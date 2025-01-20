void sub_100002F08(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  int v5;
  NSError *v6;

  v4 = a3;
  if (!a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed setting application audio session category for Photos Application! Error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_1000031CC(id a1)
{
  v1 = -[PhotosApplication px_photoLibrary]_0();
  id v2 = [v1 photoLibrary];

  +[PHQuery photoLibraryWasAccessed];
}

id sub_1000032B4(uint64_t a1)
{
  id v2 = PLAppIntentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Perform deferred check for App Intents URL navigation to workaround rdar://117412505", v4, 2u);
  }

  return [*(id *)(a1 + 32) _satisfyAppIntentsURLNavigationPerformerRequestsIfNecessary];
}

void sub_100003328(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    v4 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error while synchronizing key/value store: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_10000354C(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 px_photoLibrary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022170;
  v8[3] = &unk_1000627C0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t start(int a1, char **a2)
{
  PLPushPhotoLibraryClient();
  +[PHPhotoLibrary enableMultiLibraryMode];
  v5 = dispatch_get_global_queue(33, 0);
  dispatch_async(v5, &stru_1000645B0);

  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = UIApplicationMain(a1, a2, v7, v7);

  return v8;
}

id sub_100005874(unint64_t a1)
{
  if (a1 >= 5)
  {
    v1 = +[NSString stringWithFormat:@"%ld", a1];
  }
  else
  {
    v1 = *(&off_100064520 + a1);
  }

  return v1;
}

uint64_t sub_100005A18()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  sub_10000750C(v6, qword_100071FF8);
  sub_1000074D4(v6, (uint64_t)qword_100071FF8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100005C04()
{
  if (qword_100070E70 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();

  return sub_1000074D4(v0, (uint64_t)qword_100071FF8);
}

uint64_t sub_100005C68()
{
  uint64_t v0 = sub_1000071E0(&qword_100070F28);
  uint64_t v1 = sub_100007B0C(v0);
  __chkstk_darwin(v1);
  sub_100007B48();
  uint64_t v2 = sub_1000071E0(&qword_100070F30);
  __chkstk_darwin(v2);
  sub_100007B18();
  sub_100006F98();
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v3._object = (void *)0x800000010004C860;
  v3._countAndFlagsBits = 0xD000000000000022;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v3);
  swift_getKeyPath();
  sub_1000071E0(&qword_100070F38);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v4);
  ParameterSummaryString.init(stringInterpolation:)();
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_100005DEC()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100005E10(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = type metadata accessor for Logger();
  v2[6] = v3;
  sub_100007AF4(v3);
  v2[7] = v4;
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for CollectionEntity();
  v2[11] = v5;
  sub_100007B0C(v5);
  v2[12] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for URL();
  v2[13] = v6;
  sub_100007AF4(v6);
  v2[14] = v7;
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[17] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[18] = v9;
  v2[19] = v8;
  return _swift_task_switch(sub_100005F70, v9, v8);
}

uint64_t sub_100005F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  sub_100007B94();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  uint64_t v28 = v24[15];
  uint64_t v27 = v24[16];
  uint64_t v29 = v24[13];
  uint64_t v30 = v24[14];
  uint64_t v32 = v24[11];
  uint64_t v31 = v24[12];
  IntentParameter.wrappedValue.getter();
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
  v33(v27, v31 + *(int *)(v32 + 28), v29);
  sub_100007294(v31);
  PXAppIntentsLogger.getter();
  v33(v28, v27, v29);
  v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v37 = v24[14];
    uint64_t v36 = v24[15];
    uint64_t v38 = v24[13];
    a10 = v24[7];
    a11 = v24[6];
    a12 = v24[10];
    v39 = (uint8_t *)swift_slowAlloc();
    a13 = swift_slowAlloc();
    *(_DWORD *)v39 = 136446210;
    a9 = v39 + 4;
    sub_10000724C(&qword_100070F20, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v40 = v38;
    uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
    v24[3] = sub_10001AE98(v41, v42, &a13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v43 = *(void (**)(void))(v37 + 8);
    ((void (*)(uint64_t, uint64_t))v43)(v36, v40);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Will perform OpenCollectionIntent: %{public}s", v39, 0xCu);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();

    v44 = *(void (**)(void))(a10 + 8);
    sub_100007B3C();
    v44();
  }
  else
  {
    uint64_t v45 = v24[10];
    uint64_t v46 = v24[6];
    uint64_t v47 = v24[7];
    v43 = *(void (**)(void))(v24[14] + 8);
    sub_100007B3C();
    v43();

    v44 = *(void (**)(void))(v47 + 8);
    ((void (*)(uint64_t, uint64_t))v44)(v45, v46);
  }
  v24[20] = v43;
  v24[21] = v44;
  type metadata accessor for PXAppDependencyManager();
  v48 = (void *)swift_task_alloc();
  v24[22] = v48;
  void *v48 = v24;
  v48[1] = sub_100006230;
  sub_100007B78();
  return static PXAppDependencyManager.navigateToURLDestination(_:)(v49, v50, v51, v52, v53, v54, v55, v56, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_100006230()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 144);
  if (v0) {
    uint64_t v5 = sub_1000064D8;
  }
  else {
    uint64_t v5 = sub_10000636C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000636C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_100007B94();
  swift_release();
  PXAppIntentsLogger.getter();
  v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Did perform OpenCollectionIntent", v19, 2u);
    sub_100007B60();
  }
  v20 = (void (*)(void))v16[21];
  uint64_t v31 = v16[20];
  uint64_t v32 = v16[15];
  uint64_t v33 = v16[12];
  uint64_t v34 = v16[10];
  uint64_t v35 = v16[8];

  sub_100007B3C();
  v20();
  static IntentResult.result<>()();
  sub_100007B3C();
  v21();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100007B78();
  return v23(v22, v23, v24, v25, v26, v27, v28, v29, v31, v32, v33, v34, v35, a14, a15, a16);
}

uint64_t sub_1000064D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  sub_100007B94();
  swift_release();
  PXAppIntentsLogger.getter();
  swift_errorRetain();
  swift_errorRetain();
  v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = (void *)swift_slowAlloc();
    *(_DWORD *)v19 = 138412290;
    swift_errorRetain();
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    v16[2] = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v20 = v21;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to perform OpenCollectionIntent: %@", v19, 0xCu);
    sub_1000071E0(&qword_100070F18);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v22 = (void (*)(void))v16[20];
  v23 = (void (*)(void))v16[21];
  uint64_t v33 = v16[15];
  uint64_t v34 = v16[12];
  uint64_t v35 = v16[10];
  uint64_t v36 = v16[9];

  sub_100007B3C();
  v23();
  swift_willThrow();
  sub_100007B3C();
  v22();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100007B78();
  return v25(v24, v25, v26, v27, v28, v29, v30, v31, v33, v34, v35, v36, a13, a14, a15, a16);
}

uint64_t sub_1000066F8()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000671C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for CollectionEntity();
  uint64_t v4 = sub_100007B0C(v3);
  __chkstk_darwin(v4);
  sub_100007B48();
  sub_100007570(a1, v1);
  IntentParameter.wrappedValue.setter();
  return sub_100007294(a1);
}

uint64_t sub_100006798()
{
  type metadata accessor for InputConnectionBehavior();
  sub_100007A9C();
  uint64_t v35 = v1;
  uint64_t v36 = v0;
  __chkstk_darwin(v0);
  sub_100007B28();
  uint64_t v34 = v2;
  uint64_t v3 = sub_1000071E0(&qword_100070EF8);
  uint64_t v4 = sub_100007B0C(v3);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v33 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v32 = (uint64_t)&v30 - v7;
  uint64_t v8 = sub_1000071E0(&qword_100070F00);
  uint64_t v9 = sub_100007B0C(v8);
  __chkstk_darwin(v9);
  sub_100007B28();
  uint64_t v31 = v10;
  uint64_t v11 = sub_1000071E0(&qword_1000715D0);
  uint64_t v12 = sub_100007B0C(v11);
  __chkstk_darwin(v12);
  sub_100007B28();
  uint64_t v30 = v13;
  type metadata accessor for LocalizedStringResource.BundleDescription();
  sub_100007A9C();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_100007B18();
  uint64_t v17 = type metadata accessor for Locale();
  uint64_t v18 = sub_100007B0C(v17);
  __chkstk_darwin(v18);
  sub_100007B18();
  uint64_t v19 = type metadata accessor for String.LocalizationValue();
  uint64_t v20 = sub_100007B0C(v19);
  uint64_t v21 = __chkstk_darwin(v20);
  __chkstk_darwin(v21);
  uint64_t v22 = type metadata accessor for LocalizedStringResource();
  __chkstk_darwin(v22);
  sub_100007B18();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  v23 = *(void (**)(uint64_t))(v15 + 104);
  uint64_t v24 = sub_100007BB0();
  v23(v24);
  sub_100007AB8();
  String.LocalizationValue.init(stringLiteral:)();
  sub_1000071E0(&qword_100070F08);
  static Locale.current.getter();
  uint64_t v25 = sub_100007BB0();
  v23(v25);
  uint64_t v26 = v30;
  sub_100007AB8();
  sub_100007224(v26, 0, 1, v22);
  uint64_t v27 = type metadata accessor for CollectionEntity();
  sub_100007224(v31, 1, 1, v27);
  uint64_t v28 = type metadata accessor for IntentDialog();
  sub_100007224(v32, 1, 1, v28);
  sub_100007224(v33, 1, 1, v28);
  (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v34, enum case for InputConnectionBehavior.default(_:), v36);
  sub_10000724C(qword_100071390, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006BB8()
{
  return sub_1000066F8();
}

uint64_t sub_100006BC0(uint64_t a1)
{
  return sub_10000671C(a1);
}

void (*sub_100006BC8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100006C24;
}

void sub_100006C24(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100006C70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005C04();
  uint64_t v3 = type metadata accessor for LocalizedStringResource();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_100006CE0()
{
  return byte_100070E78;
}

uint64_t sub_100006CFC(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100006D9C;
  return sub_100005E10(a1, v4);
}

uint64_t sub_100006D9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006E90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006798();
  *a1 = result;
  return result;
}

uint64_t sub_100006EB8(uint64_t a1)
{
  unint64_t v2 = sub_100006F98();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

void variable initialization expression of PhotosFeedbackActionPerformer.previousMemoryUUID()
{
}

unint64_t sub_100006F00()
{
  unint64_t result = qword_100070EA0;
  if (!qword_100070EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070EA0);
  }
  return result;
}

uint64_t sub_100006F4C()
{
  return sub_10000724C(&qword_100070EA8, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

unint64_t sub_100006F98()
{
  unint64_t result = qword_100070EB0;
  if (!qword_100070EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070EB0);
  }
  return result;
}

unint64_t sub_100006FE8()
{
  unint64_t result = qword_100070EB8;
  if (!qword_100070EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070EB8);
  }
  return result;
}

unint64_t sub_100007038()
{
  unint64_t result = qword_100070EC0;
  if (!qword_100070EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070EC0);
  }
  return result;
}

uint64_t sub_100007084()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000070A0()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for OpenCollectionIntent()
{
}

void type metadata accessor for PhotoGMCentralizedFeedbackType(uint64_t a1)
{
}

uint64_t sub_1000070DC()
{
  return sub_10000719C(&qword_100070ED8, &qword_100070EE0);
}

uint64_t sub_100007118(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007160()
{
  return sub_10000719C(&qword_100070EE8, &qword_100070EF0);
}

uint64_t sub_10000719C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007118(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000071E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000724C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007294(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CollectionEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000072F0()
{
  return sub_100007A5C(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100007328@<X0>(void *a1@<X8>)
{
  NSString result = sub_100007A24();
  *a1 = result;
  return result;
}

uint64_t sub_100007350()
{
  return sub_100007A5C(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007380()
{
  return sub_10000765C();
}

Swift::Int sub_100007388()
{
  return sub_10000E7EC();
}

uint64_t sub_100007390()
{
  return sub_1000075D4();
}

uint64_t sub_10000739C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000073E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007414(uint64_t a1)
{
  uint64_t v2 = sub_10000724C(&qword_100070F80, type metadata accessor for Key);
  uint64_t v3 = sub_10000724C(&qword_100070F88, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000074D4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000750C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CollectionEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000075D4()
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

uint64_t sub_10000765C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

void type metadata accessor for Key(uint64_t a1)
{
}

__n128 sub_1000076C4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000076D4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000076F4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_100007730(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100007764(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_100007778(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007798(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_10000780C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100007854()
{
  return sub_10000724C(&qword_100070F68, type metadata accessor for Key);
}

uint64_t sub_10000789C()
{
  return sub_10000724C(&qword_100070F70, type metadata accessor for Key);
}

uint64_t sub_1000078E4()
{
  return sub_10000724C(&qword_100070F78, type metadata accessor for Key);
}

uint64_t sub_10000792C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000079A4(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_100007A24()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100007A5C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100007AB8()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100007AF4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100007B0C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100007B60()
{
  return swift_slowDealloc();
}

uint64_t sub_100007BB0()
{
  return v0;
}

uint64_t sub_100007BD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005DEC();
  *a1 = result;
  return result;
}

uint64_t sub_100007BFC()
{
  uint64_t v0 = sub_1000071E0(&qword_100070FC0);
  uint64_t v1 = sub_100007B0C(v0);
  __chkstk_darwin(v1);
  sub_100007B28();
  uint64_t v125 = v2;
  uint64_t v123 = sub_1000071E0(&qword_100070FC8);
  __chkstk_darwin(v123);
  sub_100007B28();
  uint64_t v122 = v3;
  uint64_t v4 = sub_1000071E0(&qword_100070FD0);
  uint64_t v5 = sub_100007B0C(v4);
  __chkstk_darwin(v5);
  sub_100007B28();
  uint64_t v124 = v6;
  uint64_t v7 = sub_1000071E0(&qword_100070FD8);
  uint64_t v8 = sub_100007B0C(v7);
  __chkstk_darwin(v8);
  sub_100007B28();
  uint64_t v126 = v9;
  uint64_t v121 = type metadata accessor for LocalizedStringResource.BundleDescription();
  sub_100007A9C();
  uint64_t v120 = v10;
  __chkstk_darwin(v11);
  sub_100007B28();
  sub_100009868(v12);
  uint64_t v13 = type metadata accessor for Locale();
  uint64_t v14 = sub_100007B0C(v13);
  __chkstk_darwin(v14);
  sub_100007B28();
  sub_100009868(v15);
  uint64_t v16 = type metadata accessor for String.LocalizationValue();
  uint64_t v17 = sub_100007B0C(v16);
  __chkstk_darwin(v17);
  sub_100007B28();
  sub_100009868(v18);
  uint64_t v19 = type metadata accessor for LocalizedStringResource();
  uint64_t v20 = sub_100007B0C(v19);
  __chkstk_darwin(v20);
  sub_100007B28();
  sub_100009868(v21);
  uint64_t v22 = type metadata accessor for AppShortcutPhraseToken();
  sub_100007A9C();
  uint64_t v24 = v23;
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)v116 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1000071E0(&qword_100070FE0);
  __chkstk_darwin(v28);
  sub_1000097B4();
  __chkstk_darwin(v29);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v30);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v31);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v32);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v33);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v34);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v35);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v36);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v37);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v38);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v39);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v40);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v41);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v42);
  sub_1000097E4();
  sub_1000097B4();
  __chkstk_darwin(v43);
  sub_1000097E4();
  sub_1000097B4();
  uint64_t v45 = __chkstk_darwin(v44);
  __chkstk_darwin(v45);
  uint64_t v118 = type metadata accessor for AppShortcut();
  sub_100007A9C();
  uint64_t v117 = v46;
  __chkstk_darwin(v47);
  sub_100007B28();
  v116[18] = v48;
  uint64_t v142 = sub_100006798();
  sub_1000071E0(&qword_100070FE8);
  uint64_t v49 = *(void *)(sub_1000071E0(&qword_100070FF0) - 8);
  uint64_t KeyPath = *(void *)(v49 + 72);
  unint64_t v50 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  uint64_t v51 = swift_allocObject();
  v116[17] = v51;
  *(_OWORD *)(v51 + 16) = xmmword_10004BE70;
  unint64_t v130 = v51 + v50;
  unint64_t v52 = sub_100006F98();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v53._countAndFlagsBits = sub_1000099BC();
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v53);
  swift_getKeyPath();
  uint64_t v131 = sub_1000071E0(&qword_100070F38);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097C4();
  unsigned int v134 = enum case for AppShortcutPhraseToken.applicationName(_:);
  v133 = *(void (**)(char *, void, uint64_t))(v24 + 104);
  uint64_t v135 = v24 + 104;
  sub_100009964();
  v54();
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  uint64_t v56 = v24 + 8;
  uint64_t v55 = *(void (**)(void))(v24 + 8);
  uint64_t v132 = v56;
  ((void (*)(char *, uint64_t))v55)(v27, v22);
  v57 = v55;
  v128 = v55;
  sub_100009798();
  sub_10000997C();
  unint64_t v137 = v52;
  AppShortcutPhrase.init(stringInterpolation:)();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v58._countAndFlagsBits = sub_100009930(0x6E65704Fu);
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v58);
  swift_getKeyPath();
  sub_1000098FC();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097C4();
  uint64_t v59 = v134;
  sub_100009964();
  v60();
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  sub_1000099B0();
  v57();
  sub_100009798();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_100009878();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  sub_1000098EC();
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v61);
  swift_getKeyPath();
  sub_1000098FC();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v62._countAndFlagsBits = 544106784;
  v62._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v62);
  v127 = v27;
  uint64_t v129 = v22;
  v63 = v133;
  v133(v27, v59, v22);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  sub_1000099B0();
  v64();
  sub_100009798();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_1000098B8();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v65._countAndFlagsBits = sub_100009930(0x776F6853u);
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v65);
  swift_getKeyPath();
  sub_1000098FC();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  unint64_t v66 = v130;
  sub_1000097C4();
  v67 = v127;
  v63(v127, v134, v129);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  v68 = v128;
  sub_100009970();
  v68();
  sub_100009798();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_100009878();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v69._countAndFlagsBits = sub_1000098A0();
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v69);
  swift_getKeyPath();
  sub_100009884();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v116[2] = v66 + 4 * KeyPath;
  sub_1000097C4();
  sub_10000999C();
  v70();
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  sub_100009970();
  v68();
  sub_100009798();
  sub_100009830();
  sub_10000984C();
  sub_1000098EC();
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v71);
  swift_getKeyPath();
  sub_100009884();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097C4();
  sub_100009988();
  v72 = (void (*)(char *, char *, uint64_t))v133;
  ((void (*)(void))v133)();
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  v73 = v128;
  sub_100009970();
  v73();
  sub_100009798();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_10000980C();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v74._countAndFlagsBits = sub_1000098A0();
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v74);
  v72(v67, v67, v129);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  sub_100009970();
  v73();
  uint64_t v75 = KeyPath;
  unint64_t v76 = v130 + 6 * KeyPath;
  sub_100009944();
  swift_getKeyPath();
  sub_1000098FC();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_100009798();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_100009878();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v143._countAndFlagsBits = sub_100009890() & 0xFFFFFFFFFFFFLL | 0x6D20000000000000;
  sub_100009908(v143);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097F0();
  sub_100009988();
  v77 = v133;
  ((void (*)(void))v133)();
  sub_100009818();
  v78 = v128;
  sub_100009920();
  v78();
  sub_100009798();
  sub_1000098E0();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_10000980C();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v79._countAndFlagsBits = sub_100009890() & 0xFFFFFFFFFFFFLL | 0x20000000000000;
  v79._object = (void *)0xE700000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v79);
  swift_getKeyPath();
  sub_100009884();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097F0();
  v80 = v127;
  v77(v127, v76, v75);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  sub_100009920();
  v78();
  sub_100009798();
  sub_1000098E0();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_1000098B8();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v81._countAndFlagsBits = sub_100009890() & 0xFFFFFFFFFFFFLL | 0x7420000000000000;
  v81._object = (void *)0xEB00000000206568;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v81);
  swift_getKeyPath();
  sub_100009884();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097F0();
  v82 = (void (*)(void))v133;
  sub_100009964();
  v82();
  sub_100009818();
  v83 = v128;
  sub_1000099B0();
  v83();
  sub_100009798();
  sub_10000997C();
  sub_100009830();
  sub_10000980C();
  sub_10000984C();
  sub_1000098D0();
  sub_1000098EC();
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v84);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097C4();
  uint64_t v85 = v129;
  sub_100009964();
  v82();
  sub_100009818();
  sub_1000099B0();
  v83();
  sub_100009798();
  sub_100009830();
  sub_10000980C();
  sub_10000984C();
  v86._countAndFlagsBits = sub_1000098D0();
  v86._object = (void *)0xE600000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v86);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  unint64_t v87 = v130;
  sub_1000097C4();
  uint64_t v88 = v134;
  v133(v80, v134, v85);
  sub_100009818();
  uint64_t v89 = v85;
  v90 = v128;
  ((void (*)(char *, uint64_t))v128)(v80, v89);
  sub_100009798();
  sub_100009830();
  sub_10000980C();
  sub_10000984C();
  v91._countAndFlagsBits = sub_1000098D0() & 0xFFFFFFFFFFFFLL | 0x6874000000000000;
  v91._object = (void *)0xEA00000000002065;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v91);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097C4();
  uint64_t v92 = v88;
  uint64_t v93 = v129;
  v94 = v133;
  v133(v80, v92, v129);
  sub_100009818();
  ((void (*)(char *, uint64_t))v90)(v80, v93);
  sub_100009798();
  sub_10000997C();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_10000980C();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v95._countAndFlagsBits = 0x20646E6946;
  v95._object = (void *)0xE500000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v95);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  v116[11] = v87 + 13 * KeyPath;
  v96._countAndFlagsBits = 0x206874697720;
  v96._object = (void *)0xE600000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v96);
  uint64_t v97 = v134;
  v94(v80, v134, v93);
  sub_100009818();
  ((void (*)(char *, uint64_t))v90)(v80, v93);
  sub_100009798();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_10000980C();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  sub_100009798();
  v98 = v127;
  v94(v127, v97, v93);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
  ((void (*)(char *, uint64_t))v90)(v98, v93);
  sub_100009944();
  swift_getKeyPath();
  sub_1000098FC();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_100009798();
  sub_10000997C();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_100009878();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v144._countAndFlagsBits = 0;
  v144._object = (void *)0xE000000000000000;
  sub_100009908(v144);
  swift_getKeyPath();
  sub_100009884();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097F0();
  v99 = v127;
  uint64_t v100 = v134;
  v133(v127, v134, v129);
  sub_100009818();
  v101 = v128;
  sub_100009920();
  v101();
  sub_100009798();
  sub_1000098E0();
  sub_100009830();
  sub_100009878();
  sub_10000984C();
  v145._countAndFlagsBits = 543516756;
  v145._object = (void *)0xE400000000000000;
  sub_100009908(v145);
  swift_getKeyPath();
  sub_100009884();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097F0();
  uint64_t v102 = v100;
  uint64_t v103 = v129;
  v133(v99, v102, v129);
  sub_100009818();
  ((void (*)(char *, uint64_t))v101)(v99, v103);
  sub_100009798();
  sub_1000098E0();
  AppShortcutPhrase.init(stringInterpolation:)();
  sub_100009878();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v146._countAndFlagsBits = 2128205;
  v146._object = (void *)0xE300000000000000;
  sub_100009908(v146);
  swift_getKeyPath();
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)();
  swift_release();
  sub_1000097F0();
  sub_10000999C();
  v104();
  sub_100009818();
  ((void (*)(char *, uint64_t))v101)(v99, v103);
  sub_100009798();
  sub_1000098E0();
  AppShortcutPhrase.init(stringInterpolation:)();
  String.LocalizationValue.init(stringLiteral:)();
  sub_10000980C();
  static Locale.current.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v120 + 104))(v119, enum case for LocalizedStringResource.BundleDescription.main(_:), v121);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v105 = type metadata accessor for CollectionEntity();
  sub_1000071E0(&qword_100070F08);
  unint64_t v106 = sub_1000096A8();
  sub_10000980C();
  AppShortcutParameterPresentationSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v107._countAndFlagsBits = sub_1000099BC();
  AppShortcutParameterPresentationSummaryString.StringInterpolation.appendLiteral(_:)(v107);
  swift_getKeyPath();
  AppShortcutParameterPresentationSummaryString.StringInterpolation.appendInterpolation(_:)();
  swift_release();
  v108._countAndFlagsBits = 0;
  v108._object = (void *)0xE000000000000000;
  AppShortcutParameterPresentationSummaryString.StringInterpolation.appendLiteral(_:)(v108);
  AppShortcutParameterPresentationSummaryString.init(stringInterpolation:)();
  AppShortcutParameterPresentationSummary.init(_:table:)();
  uint64_t v109 = sub_1000071E0(&qword_100071000);
  uint64_t v110 = sub_100007118(&qword_100071008);
  unint64_t v111 = sub_1000096F8();
  uint64_t v138 = v105;
  uint64_t v139 = v110;
  unint64_t v140 = v106;
  unint64_t v141 = v111;
  swift_getOpaqueTypeConformance2();
  AppShortcutParameterPresentation.init<A>(for:summary:optionsCollections:)();
  sub_10000980C();
  AppShortcut.init<A, B, C, D>(intent:phrases:shortTitle:systemImageName:parameterPresentation:)();
  uint64_t v112 = static AppShortcutsBuilder.buildExpression(_:)();
  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v109, v118);
  sub_1000071E0(&qword_100071018);
  uint64_t v113 = swift_allocObject();
  *(_OWORD *)(v113 + 16) = xmmword_10004BE80;
  *(void *)(v113 + 32) = v112;
  uint64_t v114 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease();
  return v114;
}

uint64_t sub_100009218()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for Locale();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for LocalizedStringResource();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000071E0(&qword_100071008);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  sub_10000974C();
  AppShortcutOptionsCollection.init(_:title:systemImageName:)();
  type metadata accessor for CollectionEntity();
  sub_1000096A8();
  sub_1000096F8();
  static AppShortcutOptionsCollectionSpecificationBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_100009524()
{
  return static AppShortcutsProvider.updateAppShortcutParameters()();
}

id sub_100009570()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosAppShortcutsProviderWrapper();
  return [super init];
}

id sub_1000095C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosAppShortcutsProviderWrapper();
  return [super dealloc];
}

uint64_t type metadata accessor for PhotosAppShortcutsProviderWrapper()
{
  return self;
}

ValueMetadata *type metadata accessor for PhotosAppShortcutsProvider()
{
  return &type metadata for PhotosAppShortcutsProvider;
}

unint64_t sub_100009630()
{
  unint64_t result = qword_100070FB8;
  if (!qword_100070FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070FB8);
  }
  return result;
}

uint64_t sub_10000967C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005DEC();
  *a1 = result;
  return result;
}

unint64_t sub_1000096A8()
{
  unint64_t result = qword_100070FF8;
  if (!qword_100070FF8)
  {
    type metadata accessor for CollectionEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100070FF8);
  }
  return result;
}

unint64_t sub_1000096F8()
{
  unint64_t result = qword_100071010;
  if (!qword_100071010)
  {
    sub_100007118(&qword_100071008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071010);
  }
  return result;
}

unint64_t sub_10000974C()
{
  unint64_t result = qword_100071380;
  if (!qword_100071380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071380);
  }
  return result;
}

void sub_100009798()
{
  uint64_t v1 = 0;
  unint64_t v2 = 0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

void sub_1000097B4()
{
  *(void *)(v1 - 256) = v0;
}

void sub_1000097C4()
{
  uint64_t v1 = 544106784;
  unint64_t v2 = 0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

void sub_1000097F0()
{
  uint64_t v1 = 32;
  unint64_t v2 = 0xE100000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

uint64_t sub_100009818()
{
  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_100009830()
{
  return AppShortcutPhrase.init(stringInterpolation:)();
}

uint64_t sub_10000984C()
{
  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009868@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_100009890()
{
  return 0x6573776F7242;
}

uint64_t sub_1000098A0()
{
  return 0x20776F6853;
}

uint64_t sub_1000098B8()
{
  return 12;
}

uint64_t sub_1000098D0()
{
  return 0x206F74206F47;
}

uint64_t sub_1000098E0()
{
  return v0;
}

void sub_100009908(Swift::String a1)
{
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(a1);
}

uint64_t sub_100009930(unsigned int a1)
{
  return a1 | 0x20796D2000000000;
}

void sub_100009944()
{
  uint64_t v1 = 543584032;
  unint64_t v2 = 0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

uint64_t sub_10000997C()
{
  return v0;
}

uint64_t sub_1000099BC()
{
  return 0x206E65704FLL;
}

uint64_t sub_1000099D0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000750C(v0, qword_100072010);
  sub_1000074D4(v0, (uint64_t)qword_100072010);
  return Logger.init(subsystem:category:)();
}

id sub_100009A54(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_previousMemoryUUID];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_previousAssetUUID];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = type metadata accessor for FeedbackFeatureFlags();
  v17[3] = v5;
  v17[4] = sub_10000BCF8();
  uint64_t v6 = sub_10000BD48(v17);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v6, enum case for FeedbackFeatureFlags.CentralizedFeedback(_:), v5);
  uint64_t v7 = v1;
  char v8 = isFeatureEnabled(_:)();
  sub_10000BDAC((uint64_t)v17);
  if (v8)
  {
    type metadata accessor for FBKEvaluationController();
    sub_10000BDFC(&qword_1000710C0);
    id v9 = a1;
    *(void *)&v7[OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_feedbackController] = FBKEvaluationController.__allocating_init(delegate:)();

    v16.receiver = v7;
    v16.super_class = (Class)type metadata accessor for PhotosFeedbackActionPerformer();
    id v10 = [super init];
  }
  else
  {
    if (qword_100070E80 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_1000074D4(v11, (uint64_t)qword_100072010);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "FeedbackFrameworks/CentralizedFeedback feature flag disabled. Skipping Centralized Feedback", v14, 2u);
      sub_100007B60();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for PhotosFeedbackActionPerformer();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

id PhotosFeedbackActionPerformer.actionIcon(type:hasResponse:)(uint64_t a1)
{
  type metadata accessor for FBKSEvaluation.Action();
  sub_10000BF44();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)(a1 - 1) > 2) {
    char v8 = (unsigned int *)&enum case for FBKSEvaluation.Action.reportConcern(_:);
  }
  else {
    char v8 = (unsigned int *)*(&off_100062198 + a1 - 1);
  }
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *v8, v1);
  type metadata accessor for FBKEvaluationController();
  static FBKEvaluationController.systemImageName(for:hasResponse:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v1);
  sub_10000BEA4(0, &qword_100071020);
  return sub_100009DB8();
}

id sub_100009DB8()
{
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() systemImageNamed:v0];

  return v1;
}

uint64_t PhotosFeedbackActionPerformer.symbolName(type:hasResponse:)(uint64_t a1)
{
  type metadata accessor for FBKSEvaluation.Action();
  sub_10000BF44();
  uint64_t v4 = v3;
  uint64_t v6 = __chkstk_darwin(v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v14 - v9;
  if ((unint64_t)(a1 - 1) > 2) {
    uint64_t v11 = (unsigned int *)&enum case for FBKSEvaluation.Action.reportConcern(_:);
  }
  else {
    uint64_t v11 = (unsigned int *)*(&off_100062198 + a1 - 1);
  }
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v8, *v11, v1);
  type metadata accessor for FBKEvaluationController();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v10, v8, v1);
  uint64_t v12 = static FBKEvaluationController.systemImageName(for:hasResponse:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v1);
  return v12;
}

uint64_t sub_100009F68(uint64_t a1, uint64_t a2)
{
  return sub_100009F80(a1, a2, &OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_previousMemoryUUID);
}

uint64_t sub_100009F74(uint64_t a1, uint64_t a2)
{
  return sub_100009F80(a1, a2, &OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_previousAssetUUID);
}

uint64_t sub_100009F80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)(v3 + *a3);
  void *v4 = a1;
  v4[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100009F98()
{
  sub_10000C00C();
  v0[15] = v1;
  v0[16] = v2;
  sub_1000071E0(&qword_100071570);
  v0[17] = sub_10000C080();
  uint64_t v3 = type metadata accessor for UUID();
  v0[18] = v3;
  sub_100007AF4(v3);
  v0[19] = v4;
  v0[20] = sub_10000C080();
  sub_10000C060();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_10000A04C()
{
  uint64_t v1 = sub_10000BBD4(*(void **)(v0 + 128));
  if (!v1) {
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  uint64_t v3 = v0 + 16;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000A654(v4, v5, v2, (_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 40))
  {
LABEL_8:
    uint64_t v12 = (uint64_t *)&unk_1000710A8;
    uint64_t v11 = v3;
    goto LABEL_9;
  }
  sub_1000071E0(&qword_1000710B0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    sub_10000BF70();
    swift_task_dealloc();
    sub_10000BF64();
    return v13();
  }
  uint64_t v3 = v0 + 48;
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000A654(v7, v8, v6, (_OWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 72)) {
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(v0 + 136);
  uint64_t v10 = *(void *)(v0 + 144);
  UUID.init(uuidString:)();
  swift_bridgeObjectRelease();
  if (sub_10000B91C(v9, 1, v10) == 1)
  {
    uint64_t v11 = *(void *)(v0 + 136);
    uint64_t v12 = (uint64_t *)&unk_100071570;
LABEL_9:
    sub_10000BC40(v11, v12);
    goto LABEL_10;
  }
  uint64_t v16 = *(void *)(v0 + 152);
  uint64_t v15 = *(void *)(v0 + 160);
  uint64_t v17 = *(void *)(v0 + 136);
  uint64_t v18 = *(void *)(v0 + 144);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  *(void *)(v0 + 168) = v19;
  *(void *)(v0 + 176) = (v16 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v19(v15, v17, v18);
  type metadata accessor for FBKSDonation();
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v20;
  void *v20 = v0;
  v20[1] = sub_10000A284;
  uint64_t v21 = *(void *)(v0 + 160);
  return static FBKSDonation.fetch(evaluationID:)(v21);
}

uint64_t sub_10000A284()
{
  sub_10000C00C();
  sub_10000BF2C();
  *(void *)(v2 + 192) = v1;
  *(void *)(v2 + 200) = v0;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_10000A36C()
{
  uint64_t v1 = (void *)v0[24];
  if (v1)
  {
    uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[21];
    uint64_t v3 = v0[20];
    uint64_t v4 = v0[18];
    uint64_t v5 = v0[15];

    v2(v5, v3, v4);
    uint64_t v6 = sub_10000C04C();
  }
  else
  {
    sub_10000C018();
    v10();
    uint64_t v6 = sub_10000C06C();
  }
  sub_100007224(v6, v7, v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v11();
}

uint64_t sub_10000A434()
{
  uint64_t v16 = v0;
  if (qword_100070E80 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000074D4(v1, (uint64_t)qword_100072010);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[25];
  uint64_t v7 = v0[19];
  uint64_t v6 = (_DWORD *)v0[20];
  uint64_t v8 = v0[18];
  if (v4)
  {
    sub_10000BFE8();
    uint64_t v15 = sub_10000C098();
    *uint64_t v6 = 136315138;
    v0[13] = v5;
    swift_errorRetain();
    sub_1000071E0(qword_100071030);
    uint64_t v9 = String.init<A>(describing:)();
    v0[14] = sub_10001AE98(v9, v10, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    sub_10000C02C((void *)&_mh_execute_header, v11, v12, "Error occurred while retrieving donation. Reason: %s");
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();

    swift_errorRelease();
    (*(void (**)())(v7 + 8))();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    (*(void (**)(_DWORD *, uint64_t))(v7 + 8))(v6, v8);
  }
  sub_10000BF70();
  swift_task_dealloc();
  sub_10000BF64();
  return v13();
}

double sub_10000A654@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_10000F9EC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_10000BC9C(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_10000A6B8(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_10000FAA8(a1 & 1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_10000A700(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_10000FA64(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v3);
  id v6 = v5;
  return v5;
}

uint64_t sub_10000A748()
{
  sub_10000C00C();
  v0[4] = v1;
  v0[5] = v2;
  sub_1000071E0(&qword_100071570);
  v0[6] = sub_10000C080();
  uint64_t v3 = type metadata accessor for UUID();
  v0[7] = v3;
  sub_100007AF4(v3);
  v0[8] = v4;
  v0[9] = sub_10000C080();
  sub_10000C060();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_10000A7FC()
{
  sub_100011F38(*(void **)(v0 + 40));
  if (!v1)
  {
LABEL_4:
    sub_10000BFAC();
    swift_task_dealloc();
    sub_10000BF64();
    return v4();
  }
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  UUID.init(uuidString:)();
  swift_bridgeObjectRelease();
  if (sub_10000B91C(v3, 1, v2) == 1)
  {
    sub_10000BC40(*(void *)(v0 + 48), &qword_100071570);
    goto LABEL_4;
  }
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v9 = *(void *)(v0 + 56);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  *(void *)(v0 + 80) = v10;
  *(void *)(v0 + 88) = (v7 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v10(v6, v8, v9);
  type metadata accessor for FBKSDonation();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10000A954;
  uint64_t v12 = *(void *)(v0 + 72);
  return static FBKSDonation.fetch(evaluationID:)(v12);
}

uint64_t sub_10000A954()
{
  sub_10000C00C();
  sub_10000BF2C();
  *(void *)(v2 + 104) = v1;
  *(void *)(v2 + 112) = v0;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_10000AA3C()
{
  uint64_t v1 = (void *)v0[13];
  if (v1)
  {
    uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[10];
    uint64_t v3 = v0[9];
    uint64_t v4 = v0[7];
    uint64_t v5 = v0[4];

    v2(v5, v3, v4);
    uint64_t v6 = sub_10000C04C();
  }
  else
  {
    sub_10000C018();
    v10();
    uint64_t v6 = sub_10000C06C();
  }
  sub_100007224(v6, v7, v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v11();
}

uint64_t sub_10000AB04()
{
  uint64_t v16 = v0;
  if (qword_100070E80 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000074D4(v1, (uint64_t)qword_100072010);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[8];
  uint64_t v6 = (_DWORD *)v0[9];
  uint64_t v8 = v0[7];
  if (v4)
  {
    sub_10000BFE8();
    uint64_t v15 = sub_10000C098();
    *uint64_t v6 = 136315138;
    v0[2] = v5;
    swift_errorRetain();
    sub_1000071E0(qword_100071030);
    uint64_t v9 = String.init<A>(describing:)();
    v0[3] = sub_10001AE98(v9, v10, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    sub_10000C02C((void *)&_mh_execute_header, v11, v12, "Error occurred while retrieving donation. Reason: %s");
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();

    swift_errorRelease();
    (*(void (**)())(v7 + 8))();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    (*(void (**)(_DWORD *, uint64_t))(v7 + 8))(v6, v8);
  }
  sub_10000BFAC();
  swift_task_dealloc();
  sub_10000BF64();
  return v13();
}

void sub_10000AD24(char a1, void *a2)
{
  uint64_t v2 = (void *)qword_100072038;
  if (qword_100072038)
  {
    uint64_t v5 = (void *)xmmword_100072028;
    uint64_t v6 = (void (*)(void))qword_100072040;
    uint64_t v7 = *((void *)&xmmword_100072028 + 1);
    sub_10000BEA4(0, (unint64_t *)&qword_1000710C8);
    sub_10000BEE0(v5, v7, v2);
    id v8 = v2;
    char v9 = static NSObject.== infix(_:_:)();

    if (v9)
    {
      uint64_t v10 = qword_100070E80;
      id v11 = v5;
      if (v7)
      {
        if (v10 != -1) {
          swift_once();
        }
        uint64_t v39 = type metadata accessor for Logger();
        sub_1000074D4(v39, (uint64_t)qword_100072010);
        id v13 = v11;
        uint64_t v14 = Logger.logObject.getter();
        os_log_type_t v40 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v14, v40))
        {
          uint64_t v41 = swift_slowAlloc();
          uint64_t v49 = swift_slowAlloc();
          *(_DWORD *)uint64_t v41 = 136315394;
          sub_100011F38(v13);
          v48[1] = v42;
          sub_1000071E0(&qword_1000710D0);
          uint64_t v43 = String.init<A>(describing:)();
          HIDWORD(v48[0]) = (unint64_t)sub_10001AE98(v43, v44, &v49) >> 32;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v41 + 12) = 1024;
          LODWORD(v48[0]) = a1 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v14, v40, "Completing feedback report for asset %s with status: %{BOOL}d", (uint8_t *)v41, 0x12u);
          swift_arrayDestroy();
          goto LABEL_21;
        }
      }
      else
      {
        if (v10 != -1) {
          swift_once();
        }
        uint64_t v12 = type metadata accessor for Logger();
        sub_1000074D4(v12, (uint64_t)qword_100072010);
        id v13 = v11;
        uint64_t v14 = Logger.logObject.getter();
        os_log_type_t v15 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = swift_slowAlloc();
          v48[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v16 = 136315394;
          id v47 = v11;
          id v17 = [v13 uuid];
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          char v19 = a1;
          unint64_t v21 = v20;

          uint64_t v49 = sub_10001AE98(v18, v21, v48);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          a1 = v19;
          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 1024;
          LODWORD(v49) = v19 & 1;
          id v11 = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Completing feedback report for memory %s with status: %{BOOL}d", (uint8_t *)v16, 0x12u);
          swift_arrayDestroy();
LABEL_21:
          swift_slowDealloc();
          swift_slowDealloc();

LABEL_24:
          v6(a1 & 1);
          swift_release();

          goto LABEL_25;
        }
      }

      goto LABEL_24;
    }
    if (qword_100070E80 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_1000074D4(v26, (uint64_t)qword_100072010);
    id v27 = v5;
    swift_retain_n();
    id v28 = a2;
    id v29 = v8;
    id v30 = v27;
    id v31 = v28;
    id v32 = v29;
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v33, v34))
    {

      swift_release_n();
      goto LABEL_25;
    }
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 138412546;
    id v37 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v36 = v2;
    swift_release_n();

    *(_WORD *)(v35 + 12) = 2112;
    v48[0] = (uint64_t)v31;
    id v38 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v36[1] = v31;

    uint64_t v23 = v33;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Unexpected report completion with mismatching controllers. %@ %@", (uint8_t *)v35, 0x16u);
    sub_1000071E0(&qword_100070F18);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {
    if (qword_100070E80 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_1000074D4(v22, (uint64_t)qword_100072010);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unexpected report completion with missing feedback report request", v25, 2u);
      swift_slowDealloc();
    }
  }

LABEL_25:
  long long v45 = xmmword_100072028;
  uint64_t v46 = (void *)qword_100072038;
  xmmword_100072028 = 0u;
  *(_OWORD *)&qword_100072038 = 0u;
  qword_100072048 = 0;
  sub_10000BE50((void *)v45, *((uint64_t *)&v45 + 1), v46);
}

id PhotosFeedbackActionPerformer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void PhotosFeedbackActionPerformer.init()()
{
}

id PhotosFeedbackActionPerformer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosFeedbackActionPerformer();
  return [super dealloc];
}

uint64_t type metadata accessor for PhotosFeedbackActionPerformer()
{
  return self;
}

id sub_10000B588(uint64_t a1)
{
  return PhotosFeedbackActionPerformer.actionIcon(type:hasResponse:)(a1);
}

uint64_t sub_10000B5A0(uint64_t a1)
{
  return PhotosFeedbackActionPerformer.symbolName(type:hasResponse:)(a1);
}

uint64_t sub_10000B5B8()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000B67C;
  return PhotosFeedbackActionPerformer.reportMemoryFeedback(type:memory:completionHandler:)();
}

uint64_t sub_10000B67C()
{
  sub_10000C00C();
  sub_10000BF2C();
  swift_task_dealloc();
  sub_10000BF64();
  return v0();
}

uint64_t sub_10000B744()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000BF28;
  return PhotosFeedbackActionPerformer.reportCleanupFeedback(type:asset:originalImageData:renderedImageData:summaryString:completionHandler:)();
}

void sub_10000B83C(void *a1)
{
}

void UIViewController.evaluationDidComplete(controller:evaluation:)(void *a1)
{
  uint64_t v2 = sub_1000071E0(&qword_100071028);
  __chkstk_darwin(v2 - 8);
  BOOL v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  FBKSEvaluation.formResponse.getter();
  uint64_t v5 = type metadata accessor for FBKSEvaluation.FormResponse();
  char v6 = sub_10000B91C((uint64_t)v4, 1, v5) != 1;
  sub_10000BC40((uint64_t)v4, &qword_100071028);
  type metadata accessor for PhotosFeedbackActionPerformer();
  sub_10000AD24(v6, a1);
}

uint64_t sub_10000B91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000B944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return FBKEvaluationControllerDelegate.evaluationDidComplete(controller:response:)(a1, a2, a3, WitnessTable);
}

void sub_10000B9B0(void *a1)
{
}

void UIViewController.evaluationDidFail(controller:error:)(void *a1)
{
  if (qword_100070E80 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000074D4(v2, (uint64_t)qword_100072010);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_errorRetain();
    sub_1000071E0(qword_100071030);
    uint64_t v6 = String.init<A>(describing:)();
    sub_10001AE98(v6, v7, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received error: %s", v5, 0xCu);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  type metadata accessor for PhotosFeedbackActionPerformer();
  sub_10000AD24(0, a1);
}

uint64_t sub_10000BBA0()
{
  return sub_10000BDFC(&qword_100071048);
}

uint64_t sub_10000BBD4(void *a1)
{
  id v1 = [a1 photosGraphProperties];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_10000BC40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000071E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000BC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000BCF8()
{
  unint64_t result = qword_1000710B8;
  if (!qword_1000710B8)
  {
    type metadata accessor for FeedbackFeatureFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000710B8);
  }
  return result;
}

uint64_t *sub_10000BD48(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000BDAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000BDFC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000BEA4(255, &qword_100071050);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000BE50(void *a1, uint64_t a2, void *a3)
{
  if (a3)
  {

    swift_release();
  }
}

uint64_t sub_10000BEA4(uint64_t a1, unint64_t *a2)
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

void *sub_10000BEE0(void *result, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = result;
    id v5 = a3;
    return (void *)swift_retain();
  }
  return result;
}

uint64_t sub_10000BF64()
{
  return v0 + 8;
}

uint64_t sub_10000BF70()
{
  sub_100007224(*(void *)(v0 + 120), 1, 1, *(void *)(v0 + 144));
  return swift_task_dealloc();
}

uint64_t sub_10000BFAC()
{
  sub_100007224(*(void *)(v0 + 32), 1, 1, *(void *)(v0 + 56));
  return swift_task_dealloc();
}

uint64_t sub_10000BFE8()
{
  return swift_slowAlloc();
}

void sub_10000C02C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t sub_10000C04C()
{
  return v0;
}

uint64_t sub_10000C06C()
{
  return v0;
}

uint64_t sub_10000C080()
{
  return swift_task_alloc();
}

uint64_t sub_10000C098()
{
  return swift_slowAlloc();
}

uint64_t sub_10000C0B8()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000750C(v0, qword_100072050);
  sub_1000074D4(v0, (uint64_t)qword_100072050);
  return Logger.init(subsystem:category:)();
}

uint64_t static PhotosGenerativeStoryFactory.createDonation(memory:prompt:statistics:generationTime:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v9 + 128) = a8;
  *(void *)(v9 + 136) = v8;
  *(unsigned char *)(v9 + 312) = a7;
  *(void *)(v9 + 112) = a5;
  *(void *)(v9 + 120) = a6;
  *(void *)(v9 + 96) = a3;
  *(void *)(v9 + 104) = a4;
  *(void *)(v9 + 80) = a1;
  *(void *)(v9 + 88) = a2;
  uint64_t v10 = type metadata accessor for UUID();
  *(void *)(v9 + 144) = v10;
  sub_100007AF4(v10);
  *(void *)(v9 + 152) = v11;
  *(void *)(v9 + 160) = swift_task_alloc();
  sub_1000071E0(&qword_1000710E0);
  *(void *)(v9 + 168) = swift_task_alloc();
  uint64_t v12 = type metadata accessor for FBKSInteraction.Content();
  *(void *)(v9 + 176) = v12;
  sub_100007AF4(v12);
  *(void *)(v9 + 184) = v13;
  *(void *)(v9 + 192) = swift_task_alloc();
  *(void *)(v9 + 200) = swift_task_alloc();
  sub_1000071E0(&qword_1000710E8);
  *(void *)(v9 + 208) = swift_task_alloc();
  *(void *)(v9 + 216) = swift_task_alloc();
  uint64_t v14 = type metadata accessor for FBKSInteraction.FeatureDomain();
  *(void *)(v9 + 224) = v14;
  sub_100007AF4(v14);
  *(void *)(v9 + 232) = v15;
  *(void *)(v9 + 240) = swift_task_alloc();
  return _swift_task_switch(sub_10000C2D4, 0, 0);
}

uint64_t sub_10000C2D4()
{
  uint64_t v1 = type metadata accessor for FeedbackFeatureFlags();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = sub_10000E624((unint64_t *)&qword_1000710B8, (void (*)(uint64_t))&type metadata accessor for FeedbackFeatureFlags);
  uint64_t v2 = sub_10000BD48((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, enum case for FeedbackFeatureFlags.CentralizedFeedback(_:), v1);
  LOBYTE(v1) = isFeatureEnabled(_:)();
  sub_10000BDAC(v0 + 16);
  if ((v1 & 1) == 0)
  {
    if (qword_100070E88 != -1) {
      swift_once();
    }
    uint64_t v38 = type metadata accessor for Logger();
    sub_1000074D4(v38, (uint64_t)qword_100072050);
    uint64_t v39 = (void *)Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.default.getter();
    if (!sub_10000E8B8(v40)) {
      goto LABEL_21;
    }
    *(_WORD *)swift_slowAlloc() = 0;
    uint64_t v43 = "Skipping feedback donation, feature flag disabled.";
LABEL_15:
    sub_10000E918((void *)&_mh_execute_header, v41, v42, v43);
    sub_100007B60();
    goto LABEL_21;
  }
  uint64_t v3 = *(void **)(v0 + 128);
  id v4 = *(void **)(v0 + 88);
  id v5 = [v4 localIdentifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  *(void *)(v0 + 248) = v6;
  *(void *)(v0 + 256) = v8;
  uint64_t v9 = (UIImage *)sub_10000D018(v4, v3);
  *(void *)(v0 + 264) = v9;
  if (!v9)
  {
    swift_bridgeObjectRelease();
    if (qword_100070E88 != -1) {
      swift_once();
    }
    uint64_t v44 = type metadata accessor for Logger();
    sub_1000074D4(v44, (uint64_t)qword_100072050);
    uint64_t v39 = (void *)Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (!sub_10000E8B8(v45)) {
      goto LABEL_21;
    }
    *(_WORD *)swift_slowAlloc() = 0;
    uint64_t v43 = "Skipping feedback donation, couldn't generate image for feedback.";
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = UIImageJPEGRepresentation(v9, 0.5);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(v0 + 232);
    uint64_t v14 = *(void *)(v0 + 240);
    uint64_t v60 = v6;
    uint64_t v56 = *(void *)(v0 + 216);
    uint64_t v15 = *(uint64_t **)(v0 + 200);
    v57 = *(uint64_t **)(v0 + 192);
    uint64_t v58 = *(void *)(v0 + 208);
    uint64_t v59 = v8;
    uint64_t v53 = *(void *)(v0 + 184);
    uint64_t v16 = *(void *)(v0 + 168);
    uint64_t v51 = *(void *)(v0 + 224);
    uint64_t v52 = *(void *)(v0 + 176);
    uint64_t v17 = *(void *)(v0 + 104);
    uint64_t v62 = *(void *)(v0 + 112);
    uint64_t v63 = *(void *)(v0 + 120);
    int v61 = *(unsigned char *)(v0 + 312) & 1;
    uint64_t v18 = *(void *)(v0 + 96);
    uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;
    unint64_t v55 = v20;

    *(void *)(v0 + 272) = v19;
    *(void *)(v0 + 280) = v21;
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v14, enum case for FBKSInteraction.FeatureDomain.memoryCreation(_:), v51);
    *uint64_t v15 = v18;
    v15[1] = v17;
    uint64_t v54 = *(void (**)(uint64_t *, void, uint64_t))(v53 + 104);
    v54(v15, enum case for FBKSInteraction.Content.text(_:), v52);
    uint64_t v22 = enum case for FBKSInteraction.AnnotatedContent.IconType.text(_:);
    uint64_t v23 = type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v16, v22, v23);
    sub_100007224(v16, 0, 1, v23);
    swift_bridgeObjectRetain();
    FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
    uint64_t v24 = type metadata accessor for FBKSInteraction.AnnotatedContent();
    sub_100007224(v56, 0, 1, v24);
    uint64_t *v57 = v19;
    v57[1] = v55;
    v54(v57, enum case for FBKSInteraction.Content.image(_:), v52);
    sub_100007224(v16, 1, 1, v23);
    sub_10000E3E4(v19, v55);
    FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
    sub_100007224(v58, 0, 1, v24);
    id v25 = objc_allocWithZone((Class)type metadata accessor for FBKSDonation());
    uint64_t v26 = (void *)FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)();
    *(void *)(v0 + 288) = v26;
    sub_1000071E0(&qword_1000710F0);
    id v27 = (int *)(sub_1000071E0(&qword_1000710F8) - 8);
    unint64_t v28 = (*(unsigned __int8 *)(*(void *)v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v27 + 80);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10004BE80;
    unint64_t v30 = v29 + v28;
    uint64_t v31 = v27[14];
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    FBKSForm.Question.init(stringValue:)();
    sub_1000071E0(&qword_100071100);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_10004BE80;
    *(void *)(v32 + 32) = v60;
    *(void *)(v32 + 40) = v59;
    *(void *)(v30 + v31) = v32;
    type metadata accessor for FBKSForm.Question();
    swift_bridgeObjectRetain();
    sub_1000071E0(&qword_100071108);
    sub_10000E624((unint64_t *)&qword_100071110, (void (*)(uint64_t))&type metadata accessor for FBKSForm.Question);
    Dictionary.init(dictionaryLiteral:)();
    id v33 = v26;
    sub_10000D4D4(v62, v63, v61);
    dispatch thunk of FBKSInteraction.auxiliaryMetrics.setter();

    id v34 = v33;
    dispatch thunk of FBKSInteraction.prefillQuestions.setter();

    v64 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of FBKSDonation.donate()
                                          + async function pointer to dispatch thunk of FBKSDonation.donate());
    uint64_t v35 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v35;
    *uint64_t v35 = v0;
    v35[1] = sub_10000CB30;
    uint64_t v36 = *(void *)(v0 + 160);
    return v64(v36);
  }
  swift_bridgeObjectRelease();
  if (qword_100070E88 != -1) {
    swift_once();
  }
  uint64_t v46 = type metadata accessor for Logger();
  sub_1000074D4(v46, (uint64_t)qword_100072050);
  uint64_t v39 = (void *)Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.error.getter();
  if (sub_10000E8B8(v47))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_10000E918((void *)&_mh_execute_header, v48, v49, "Skipping feedback donation, couldn't retrieve data for image generated.");
    sub_100007B60();
  }

LABEL_21:
  sub_10000E870();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v50();
}

uint64_t sub_10000CB30()
{
  sub_10000BF2C();
  *(void *)(v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10000CD2C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_10000CC28;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000CC28()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = (void *)v0[33];
  uint64_t v4 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[10];
  sub_10000E43C(v0[34], v0[35]);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v6, v3, v5);
  sub_100007224(v0[10], 0, 1, v0[18]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v7();
}

uint64_t sub_10000CD2C()
{
  uint64_t v19 = v0;
  if (qword_100070E88 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000074D4(v1, (uint64_t)qword_100072050);
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[38];
  uint64_t v6 = (void *)v0[36];
  uint64_t v7 = (void *)v0[33];
  unint64_t v8 = v0[32];
  if (v4)
  {
    uint64_t v15 = (void *)v0[33];
    uint64_t v16 = v0[34];
    uint64_t v9 = v0[31];
    unint64_t v17 = v0[35];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain();
    v0[7] = sub_10001AE98(v9, v8, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    v0[8] = v5;
    swift_errorRetain();
    sub_1000071E0(qword_100071030);
    uint64_t v11 = String.init<A>(describing:)();
    v0[9] = sub_10001AE98(v11, v12, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Donation for memory %s failed. Reason: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();

    swift_errorRelease();
    sub_10000E43C(v16, v17);
  }
  else
  {
    sub_10000E43C(v0[34], v0[35]);

    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10000E870();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v13();
}

id sub_10000D018(void *a1, void *a2)
{
  BOOL v4 = self;
  id v5 = [a2 librarySpecificFetchOptions];
  uint64_t isEscapingClosureAtFileLocation = (uint64_t)[v4 fetchKeyCuratedAssetInAssetCollection:a1 referenceAsset:0 options:v5];

  if (!isEscapingClosureAtFileLocation) {
    return 0;
  }
  id v7 = [(id)isEscapingClosureAtFileLocation firstObject];
  if (!v7) {
    goto LABEL_8;
  }
  unint64_t v8 = v7;
  uint64_t v9 = PHCollection.title.getter();
  if (!v10)
  {
LABEL_7:

LABEL_8:
    return 0;
  }
  uint64_t v29 = v9;
  uint64_t v31 = v10;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [self defaultManager];
  id v13 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
  [v13 setSynchronous:1];
  [v13 setResizeMode:2];
  [v13 setDeliveryMode:1];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v11;
  *(void *)&aBlock.tx = sub_10000E530;
  *(void *)&aBlock.ty = v15;
  *(void *)&aBlock.a = _NSConcreteStackBlock;
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_10000D98C;
  *(void *)&aBlock.d = &unk_100062200;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  unint64_t v17 = v11;
  swift_release();
  [v12 requestNewCGImageForAsset:v8 targetSize:1 contentMode:v13 options:v16 resultHandler:400.0, 500.0];
  _Block_release(v16);
  unint64_t v30 = v17;
  OS_dispatch_semaphore.wait()();
  swift_beginAccess();
  uint64_t v18 = *(void **)(v14 + 16);
  if (!v18)
  {

    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  CGAffineTransformMakeScale(&aBlock, 1.0, -1.0);
  CGAffineTransformTranslate(&v32, &aBlock, 0.0, -500.0);
  CGAffineTransform aBlock = v32;
  id v19 = objc_allocWithZone((Class)UIGraphicsImageRenderer);
  id v20 = v18;
  id v21 = [v19 initWithSize:400.0, 500.0];
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = &aBlock;
  *(void *)(v22 + 24) = v20;
  *(_OWORD *)(v22 + 32) = xmmword_10004C040;
  *(void *)(v22 + 48) = v29;
  *(void *)(v22 + 56) = v31;
  *(void *)(v22 + 64) = a1;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_10000E598;
  *(void *)(v23 + 24) = v22;
  *(void *)&v32.tx = sub_10000E5BC;
  *(void *)&v32.ty = v23;
  *(void *)&v32.a = _NSConcreteStackBlock;
  *(void *)&v32.b = 1107296256;
  *(void *)&v32.c = sub_10000E148;
  *(void *)&v32.d = &unk_100062278;
  uint64_t v24 = _Block_copy(&v32);
  id v25 = v20;
  id v26 = a1;
  swift_retain();
  swift_release();
  id v27 = [v21 imageWithActions:v24];

  _Block_release(v24);
  uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
    goto LABEL_7;
  }
  return v27;
}

void *sub_10000D4D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v44 = type metadata accessor for FreeformStoryType();
  sub_100007A9C();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = &v41[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for MemoryLaunchType();
  sub_100007A9C();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  unint64_t v17 = &v41[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  id v19 = &v41[-v18];
  id v20 = &_swiftEmptyDictionarySingleton;
  if (a1)
  {
    swift_retain();
    int v42 = a3;
    dispatch thunk of StoryStatistics.queryUnderstandingStatistics.getter();
    dispatch thunk of QueryUnderstandingStatistics.isModifiedByUser.getter();
    uint64_t v43 = a2;
    swift_release();
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = sub_10000E8D4();
    sub_10000FD78(v21, v22 | 0x4D79726575510000, 0xEF6465696669646FLL, v23);
    sub_10000E900();
    dispatch thunk of StoryStatistics.memoryStatistics.getter();
    dispatch thunk of MemoryStatistics.isSuggestedPrompt.getter();
    swift_release();
    swift_isUniquelyReferenced_nonNull_native();
    sub_10000E938();
    uint64_t v24 = sub_10000E8EC();
    sub_10000FD78(v24, v25, v26, v27);
    sub_10000E900();
    dispatch thunk of StoryStatistics.queryUnderstandingStatistics.getter();
    char Understanding = dispatch thunk of QueryUnderstandingStatistics.isQueryAmbiguous.getter();
    swift_release();
    swift_isUniquelyReferenced_nonNull_native();
    sub_10000E938();
    sub_10000FD78(Understanding & 1, 0x4173497972657571, 0xEF73756F6769626DLL, v29);
    sub_10000E900();
    dispatch thunk of StoryStatistics.queryUnderstandingStatistics.getter();
    dispatch thunk of QueryUnderstandingStatistics.isQueryAmbiguous.getter();
    swift_release();
    swift_isUniquelyReferenced_nonNull_native();
    sub_10000E938();
    uint64_t v30 = sub_10000E8EC();
    sub_10000FD78(v30, 0xD000000000000010, v31, v32);
    swift_bridgeObjectRelease();
    dispatch thunk of StoryStatistics.memoryStatistics.getter();
    dispatch thunk of MemoryStatistics.generationEntryPoint.getter();
    swift_release();
    (*(void (**)(unsigned char *, void, uint64_t))(v13 + 104))(v17, enum case for MemoryLaunchType.remixButton(_:), v11);
    sub_10000E624(&qword_100071148, (void (*)(uint64_t))&type metadata accessor for MemoryLaunchType);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    id v33 = *(void (**)(unsigned char *, uint64_t))(v13 + 8);
    v33(v17, v11);
    v33(v19, v11);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = sub_10000E8D4();
    sub_10000FD78(v34, v35 | 0x78696D65520000, 0xE700000000000000, v36);
    sub_10000E900();
    dispatch thunk of StoryStatistics.memoryStatistics.getter();
    dispatch thunk of MemoryStatistics.storyType.getter();
    swift_release();
    uint64_t v37 = FreeformStoryType.analyticsValue.getter();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v44);
    swift_isUniquelyReferenced_nonNull_native();
    sub_10000E938();
    a2 = v43;
    sub_10000FD78(v37, 0x745379726F6D656DLL, 0xEF6570795479726FLL, v38);
    LOBYTE(a3) = v42;
    id v20 = v45;
    swift_release();
    swift_bridgeObjectRelease();
  }
  if ((a3 & 1) == 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    os_log_type_t v45 = v20;
    sub_10000FD78(a2, 0x69746172656E6567, 0xEE00656D69546E6FLL, isUniquelyReferenced_nonNull_native);
    id v20 = v45;
    swift_bridgeObjectRelease();
  }
  return v20;
}

Swift::Int sub_10000D92C(void *a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  id v5 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = a1;
  id v6 = a1;

  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10000D98C(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10000DA38(void *a1, _OWORD *a2, CGImage *a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v13 = (CGContext *)[a1 CGContext];
  long long v14 = a2[1];
  *(_OWORD *)&transform.a = *a2;
  *(_OWORD *)&transform.c = v14;
  *(_OWORD *)&transform.tx = a2[2];
  CGContextConcatCTM(v13, &transform);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = a4;
  v32.size.height = a5;
  CGContextRef.draw(_:in:byTiling:)(a3, v32, 0);
  long long v15 = a2[1];
  *(_OWORD *)&transform.a = *a2;
  *(_OWORD *)&transform.c = v15;
  *(_OWORD *)&transform.tx = a2[2];
  CGContextConcatCTM(v13, &transform);
  id v16 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
  [v16 setAlignment:1];
  sub_1000071E0(&qword_100071150);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004C050;
  *(void *)(inited + 32) = NSFontAttributeName;
  uint64_t v18 = self;
  id v19 = NSFontAttributeName;
  *(void *)(inited + 40) = [v18 systemFontOfSize:36.0];
  *(void *)(inited + 48) = NSParagraphStyleAttributeName;
  *(void *)(inited + 56) = v16;
  *(void *)(inited + 64) = NSForegroundColorAttributeName;
  id v20 = self;
  uint64_t v21 = NSParagraphStyleAttributeName;
  id v22 = v16;
  char v23 = NSForegroundColorAttributeName;
  *(void *)(inited + 72) = [v20 whiteColor];
  type metadata accessor for Key(0);
  sub_10000E5E4();
  sub_10000E624(&qword_100070F80, type metadata accessor for Key);
  uint64_t v24 = Dictionary.init(dictionaryLiteral:)();
  *(void *)&transform.a = 10;
  transform.b = -1.7573882e159;
  uint64_t v25 = sub_10000E66C(a8);
  if (v26)
  {
    unint64_t v27 = v26;
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v27 = 0xE000000000000000;
  }
  unint64_t v28 = v27;
  String.append(_:)(*(Swift::String *)&v25);
  swift_bridgeObjectRelease();
  sub_10000DD2C();
  swift_bridgeObjectRelease();
  NSString v29 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_10000DDAC(v24);
  swift_bridgeObjectRelease();
  sub_10000E6D0(1, 0.0, a5 - a5 * 0.25, a4, a5 * 0.25, v30, 0, v29);
}

uint64_t sub_10000DD2C()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = String.init<A>(_:)();
  String.append<A>(contentsOf:)();
  return v1;
}

uint64_t sub_10000DDAC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000071E0(&qword_100071158);
    uint64_t v2 = (unsigned char *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v29 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v3) >> 6;
  id v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v30 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v30 << 6);
  while (1)
  {
    long long v15 = *(void **)(*(void *)(a1 + 56) + 8 * v9);
    *(void *)&v33[0] = *(void *)(*(void *)(a1 + 48) + 8 * v9);
    long long v14 = *(void **)&v33[0];
    *(void *)&v32[0] = v15;
    sub_10000E5E4();
    id v16 = v14;
    id v17 = v15;
    swift_dynamicCast();
    uint64_t v18 = *(void *)&v33[0];
    sub_10000E7DC((_OWORD *)((char *)v33 + 8), v31);
    sub_10000E7DC(v31, v33);
    sub_10000E7DC(v33, v32);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v19 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << v2[32];
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) == 0)
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
        uint64_t v27 = *(void *)&v6[8 * v22];
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v23 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v23;
    *(void *)(*((void *)v2 + 6) + 8 * v23) = v18;
    uint64_t result = (uint64_t)sub_10000E7DC(v32, (_OWORD *)(*((void *)v2 + 7) + 32 * v23));
    ++*((void *)v2 + 2);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      goto LABEL_38;
    }
    if (v10 >= v28) {
      goto LABEL_36;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v30 + 1;
    if (!v11)
    {
      int64_t v12 = v30 + 2;
      if (v30 + 2 >= v28) {
        goto LABEL_36;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v30 + 3;
        if (v30 + 3 >= v28) {
          goto LABEL_36;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v30 + 4;
          if (v30 + 4 >= v28) {
            goto LABEL_36;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v30 = v12;
  }
  int64_t v13 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_36:
    swift_release();
    sub_10000E860();
    return (uint64_t)v2;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v30 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v28) {
      goto LABEL_36;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_10000E148(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id PhotosGenerativeStoryFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosGenerativeStoryFactory();
  return [super init];
}

id PhotosGenerativeStoryFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosGenerativeStoryFactory();
  return [super dealloc];
}

uint64_t sub_10000E224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  char v16 = a7 & 1;
  id v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  void *v17 = v8;
  v17[1] = sub_10000E318;
  return static PhotosGenerativeStoryFactory.createDonation(memory:prompt:statistics:generationTime:photoLibrary:)(a1, a2, a3, a4, a5, a6, v16, a8);
}

uint64_t sub_10000E318()
{
  sub_10000BF2C();
  swift_task_dealloc();
  sub_10000BF64();
  return v0();
}

uint64_t sub_10000E3E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000E43C(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for PhotosGenerativeStoryFactory()
{
  return self;
}

uint64_t sub_10000E4B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000E4F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_10000E530(void *a1, uint64_t a2)
{
  return sub_10000D92C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_10000E538(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E548()
{
  return swift_release();
}

uint64_t sub_10000E550()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

void sub_10000E598(void *a1)
{
  sub_10000DA38(a1, *(_OWORD **)(v1 + 16), *(CGImage **)(v1 + 24), *(CGFloat *)(v1 + 32), *(CGFloat *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64));
}

uint64_t sub_10000E5AC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E5BC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10000E5E4()
{
  unint64_t result = qword_1000710C8;
  if (!qword_1000710C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000710C8);
  }
  return result;
}

uint64_t sub_10000E624(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000E66C(void *a1)
{
  id v1 = [a1 subtitle];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

void sub_10000E6D0(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, void *a8)
{
  type metadata accessor for Key(0);
  sub_10000E624(&qword_100070F80, type metadata accessor for Key);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [a8 drawWithRect:a1 options:isa attributes:a7 context:a2 a3 a4 a5];
}

_OWORD *sub_10000E7DC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

Swift::Int sub_10000E7EC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000E860()
{
  return swift_release();
}

uint64_t sub_10000E870()
{
  sub_100007224(*(void *)(v0 + 80), 1, 1, *(void *)(v0 + 144));
  return swift_task_dealloc();
}

BOOL sub_10000E8B8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000E8D4()
{
  *(void *)(v2 - 88) = v1;
  return v0;
}

uint64_t sub_10000E8EC()
{
  return v0;
}

uint64_t sub_10000E900()
{
  return swift_bridgeObjectRelease();
}

void sub_10000E918(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void sub_10000E938()
{
  *(void *)(v1 - 88) = v0;
}

uint64_t sub_10000E944(uint64_t a1)
{
  if (qword_100070E90 != -1) {
    a1 = swift_once();
  }
  uint64_t v1 = qword_100071160;
  __chkstk_darwin(a1);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_100010224((id *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  uint64_t v2 = v4;
  swift_release();
  return v2;
}

BOOL sub_10000EA18(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10000EA28(uint64_t a1, char a2)
{
}

_UNKNOWN **sub_10000EA50()
{
  return &off_100061EA8;
}

Swift::Int sub_10000EA5C(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_10000EAA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000EA18(*a1, *a2);
}

Swift::Int sub_10000EAB0()
{
  return sub_10000EA5C(*v0);
}

void sub_10000EAB8(uint64_t a1)
{
  sub_10000EA28(a1, *v1);
}

Swift::Int sub_10000EAC0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_UNKNOWN **sub_10000EB04@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10000EA50();
  *a1 = result;
  return result;
}

uint64_t sub_10000EB2C()
{
  id v0 = [self weakToStrongObjectsMapTable];
  sub_1000071E0(&qword_1000712D0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = v0;
  qword_100071160 = result;
  return result;
}

id sub_10000EB94@<X0>(id *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v5 = *a1;
  id result = [*a1 objectForKey:a2];
  uint64_t v7 = (uint64_t)result;
  if (!result)
  {
    type metadata accessor for PhotosCollectionEntityCache();
    swift_allocObject();
    id v8 = a2;
    uint64_t v7 = sub_10000EC3C(v8);
    id result = [v5 setObject:v7 forKey:v8];
  }
  *a3 = v7;
  return result;
}

uint64_t sub_10000EC3C(void *a1)
{
  uint64_t v2 = v1;
  swift_unknownObjectWeakInit();
  *(void *)(v2 + 56) = 0;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  uint64_t v4 = sub_10000EDDC();
  sub_1000071E0(&qword_1000712C0);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  *(void *)(v2 + 64) = v5;
  swift_unknownObjectWeakAssign();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  PHPhotoLibrary.registerObserver(_:block:)();
  swift_release_n();

  swift_beginAccess();
  sub_100010280((uint64_t)v7, v2 + 24);
  swift_endAccess();
  return v2;
}

uint64_t sub_10000ED74()
{
  if (swift_weakLoadStrong())
  {
    sub_10000EF90();
    swift_release();
  }
  return 0;
}

void *sub_10000EDDC()
{
  char v0 = 0;
  unint64_t v1 = 0;
  while (1)
  {
    char v2 = v0;
    if (v1 >= 2) {
      break;
    }
    char v3 = *((unsigned char *)&off_100061ED0 + v1 + 32);
    sub_1000071E0(&qword_1000712C8);
    uint64_t v4 = Dictionary.init(dictionaryLiteral:)();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v6 = sub_10000FAA8(v3);
    uint64_t v8 = _swiftEmptyDictionarySingleton[2];
    BOOL v9 = (v7 & 1) == 0;
    Swift::Int v10 = v8 + v9;
    if (__OFADD__(v8, v9)) {
      goto LABEL_14;
    }
    unint64_t v11 = v6;
    char v12 = v7;
    sub_1000071E0(&qword_1000712A8);
    if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10))
    {
      unint64_t v13 = sub_10000FAA8(v3);
      if ((v12 & 1) != (v14 & 1)) {
        goto LABEL_16;
      }
      unint64_t v11 = v13;
    }
    if (v12)
    {
      uint64_t v15 = _swiftEmptyDictionarySingleton[7];
      swift_bridgeObjectRelease();
      *(void *)(v15 + 8 * v11) = v4;
    }
    else
    {
      _swiftEmptyDictionarySingleton[(v11 >> 6) + 8] |= 1 << v11;
      *(unsigned char *)(_swiftEmptyDictionarySingleton[6] + v11) = v3;
      *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v11) = v4;
      uint64_t v16 = _swiftEmptyDictionarySingleton[2];
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17) {
        goto LABEL_15;
      }
      _swiftEmptyDictionarySingleton[2] = v18;
    }
    swift_bridgeObjectRelease();
    char v0 = 1;
    unint64_t v1 = &_mh_execute_header.magic + 1;
    if (v2) {
      return _swiftEmptyDictionarySingleton;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  id result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10000EF90()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_10000F9D0((void *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  return swift_release();
}

uint64_t sub_10000EFFC(void *a1, uint64_t a2)
{
  char v3 = a1;
  uint64_t v4 = *a1;
  uint64_t v5 = 1 << *(unsigned char *)(v4 + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v62 = v6 & *(void *)(v4 + 64);
  int64_t v59 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v60 = v4;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
LABEL_5:
  if (!v62)
  {
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_70:
      __break(1u);
      goto LABEL_71;
    }
    if (v10 >= v59) {
      return swift_release();
    }
    unint64_t v11 = *(void *)(v58 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      int64_t v12 = v7 + 2;
      if (v7 + 2 >= v59) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v58 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v7 + 3;
        if (v7 + 3 >= v59) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v58 + 8 * v12);
        if (!v11)
        {
          uint64_t v13 = v7 + 4;
          if (v7 + 4 < v59)
          {
            unint64_t v11 = *(void *)(v58 + 8 * v13);
            if (v11)
            {
              int64_t v12 = v7 + 4;
              goto LABEL_20;
            }
            while (1)
            {
              int64_t v12 = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_72;
              }
              if (v12 >= v59) {
                break;
              }
              unint64_t v11 = *(void *)(v58 + 8 * v12);
              ++v13;
              if (v11) {
                goto LABEL_20;
              }
            }
          }
          return swift_release();
        }
      }
    }
LABEL_20:
    int64_t v61 = v12;
    unint64_t v62 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    goto LABEL_21;
  }
  unint64_t v8 = __clz(__rbit64(v62));
  int64_t v61 = v7;
  v62 &= v62 - 1;
  unint64_t v9 = v8 | (v7 << 6);
LABEL_21:
  char v66 = *(unsigned char *)(*(void *)(v60 + 48) + v9);
  uint64_t v14 = *(void *)(*(void *)(v60 + 56) + 8 * v9);
  uint64_t v63 = v14 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v14 + 32);
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & *(void *)(v14 + 64);
  int64_t v65 = (unint64_t)(v15 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v18 = 0;
  uint64_t v64 = v14;
  while (v17)
  {
    unint64_t v19 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v20 = v19 | (v18 << 6);
LABEL_27:
    sub_10000FF88(*(void *)(v14 + 48) + 40 * v20, (uint64_t)&v72);
    *((void *)&v74 + 1) = *(void *)(*(void *)(v14 + 56) + 8 * v20);
    id v21 = *((id *)&v74 + 1);
LABEL_46:
    sub_10000FFE4((uint64_t)&v72, (uint64_t)&v75);
    if (!*((void *)&v76 + 1))
    {
      swift_release();
      int64_t v7 = v61;
      goto LABEL_5;
    }
    long long v72 = v75;
    long long v73 = v76;
    unint64_t v25 = v78;
    *(void *)&long long v74 = v77;
    sub_10001004C();
    BOOL v26 = (void *)PHChange.changeDetails<A>(for:)();
    if (v26
      && (uint64_t v27 = v26,
          id v28 = [v26 fetchResultAfterChanges],
          v27,
          v28))
    {
      unint64_t v68 = v17;
      int64_t v69 = v18;
      sub_10000FF88((uint64_t)&v72, (uint64_t)v71);
      id v29 = v28;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v79 = *v3;
      uint64_t v31 = v79;
      *char v3 = 0x8000000000000000;
      unint64_t v70 = sub_10000FAA8(v66);
      uint64_t v33 = *(void *)(v31 + 16);
      BOOL v34 = (v32 & 1) == 0;
      Swift::Int v35 = v33 + v34;
      if (__OFADD__(v33, v34))
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
      char v36 = v32;
      sub_1000071E0(&qword_1000712A8);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v35))
      {
        unint64_t v70 = sub_10000FAA8(v66);
        if ((v36 & 1) != (v37 & 1)) {
          goto LABEL_73;
        }
      }
      if ((v36 & 1) == 0) {
        goto LABEL_66;
      }
      char v38 = v25;
      uint64_t v39 = v3;
      uint64_t v40 = a2;
      uint64_t v67 = v79;
      uint64_t v41 = *(void **)(*(void *)(v79 + 56) + 8 * v70);
      char v42 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v43 = sub_10000FA64((uint64_t)v71);
      uint64_t v45 = v41[2];
      BOOL v46 = (v44 & 1) == 0;
      Swift::Int v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_67;
      }
      unint64_t v48 = v43;
      char v49 = v44;
      sub_1000071E0(&qword_1000712B0);
      Swift::Bool v50 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v42, v47);
      a2 = v40;
      char v3 = v39;
      if (v50)
      {
        unint64_t v51 = sub_10000FA64((uint64_t)v71);
        if ((v49 & 1) != (v52 & 1)) {
          goto LABEL_73;
        }
        unint64_t v48 = v51;
      }
      if (v49)
      {
        uint64_t v53 = v41[7];

        *(void *)(v53 + 8 * v48) = v29;
      }
      else
      {
        v41[(v48 >> 6) + 8] |= 1 << v48;
        sub_10000FF88((uint64_t)v71, v41[6] + 40 * v48);
        *(void *)(v41[7] + 8 * v48) = v29;
        uint64_t v54 = v41[2];
        BOOL v55 = __OFADD__(v54, 1);
        uint64_t v56 = v54 + 1;
        if (v55) {
          goto LABEL_69;
        }
        v41[2] = v56;
      }
      swift_bridgeObjectRelease();
      sub_10001008C((uint64_t)v71);
      *(void *)(*(void *)(v67 + 56) + 8 * v70) = v41;
      void *v39 = v67;

      sub_10001008C((uint64_t)&v72);
      uint64_t v14 = v64;
      unint64_t v17 = v68;
      int64_t v18 = v69;
    }
    else
    {

      sub_10001008C((uint64_t)&v72);
    }
  }
  int64_t v22 = v18 + 1;
  if (__OFADD__(v18, 1)) {
    goto LABEL_68;
  }
  if (v22 >= v65)
  {
LABEL_45:
    unint64_t v17 = 0;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v72 = 0u;
    goto LABEL_46;
  }
  unint64_t v23 = *(void *)(v63 + 8 * v22);
  if (v23)
  {
LABEL_31:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
    goto LABEL_27;
  }
  int64_t v24 = v18 + 2;
  ++v18;
  if (v22 + 1 >= v65) {
    goto LABEL_45;
  }
  unint64_t v23 = *(void *)(v63 + 8 * v24);
  if (v23) {
    goto LABEL_34;
  }
  int64_t v18 = v22 + 1;
  if (v22 + 2 >= v65) {
    goto LABEL_45;
  }
  unint64_t v23 = *(void *)(v63 + 8 * (v22 + 2));
  if (v23)
  {
    v22 += 2;
    goto LABEL_31;
  }
  int64_t v24 = v22 + 3;
  int64_t v18 = v22 + 2;
  if (v22 + 3 >= v65) {
    goto LABEL_45;
  }
  unint64_t v23 = *(void *)(v63 + 8 * v24);
  if (v23)
  {
LABEL_34:
    int64_t v22 = v24;
    goto LABEL_31;
  }
  while (1)
  {
    int64_t v22 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v22 >= v65)
    {
      int64_t v18 = v65 - 1;
      goto LABEL_45;
    }
    unint64_t v23 = *(void *)(v63 + 8 * v22);
    ++v24;
    if (v23) {
      goto LABEL_31;
    }
  }
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10000F5BC@<X0>(uint64_t *a1@<X0>, char a2@<W1>, void *a3@<X2>, void *a4@<X8>)
{
  char v6 = a2 & 1;
  int64_t v7 = sub_1000101E0(a3, a3[3]);
  __chkstk_darwin(v7);
  (*(void (**)(unsigned char *))(v9 + 16))(&v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
  AnyHashable.init<A>(_:)();
  uint64_t result = sub_10000A6B8(v6, *a1);
  if (result)
  {
    unint64_t v11 = sub_10000A700((uint64_t)v13, result);
    swift_bridgeObjectRelease();
    *a4 = v11;
    return sub_10001008C((uint64_t)v13);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F6F4()
{
  swift_unknownObjectWeakDestroy();
  sub_100010180(v0 + 24);
  swift_release();
  return v0;
}

uint64_t sub_10000F724()
{
  sub_10000F6F4();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for PhotosCollectionEntityCache()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for PhotosCollectionEntityCache.CacheCategory(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosCollectionEntityCache.CacheCategory(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PhotosCollectionEntityCache.CacheCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000F8DCLL);
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

uint64_t sub_10000F904(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000F90C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosCollectionEntityCache.CacheCategory()
{
  return &type metadata for PhotosCollectionEntityCache.CacheCategory;
}

unint64_t sub_10000F92C()
{
  unint64_t result = qword_100071280;
  if (!qword_100071280)
  {
    sub_100007118(&qword_100071288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071280);
  }
  return result;
}

unint64_t sub_10000F984()
{
  unint64_t result = qword_100071290;
  if (!qword_100071290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071290);
  }
  return result;
}

uint64_t sub_10000F9D0(void *a1)
{
  return sub_10000EFFC(a1, *(void *)(v1 + 16));
}

unint64_t sub_10000F9EC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000FB18(a1, a2, v4);
}

unint64_t sub_10000FA64(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000FBFC(a1, v4);
}

unint64_t sub_10000FAA8(char a1)
{
  char v2 = a1 & 1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  Swift::Int v3 = Hasher._finalize()();

  return sub_10000FCC4(v2, v3);
}

unint64_t sub_10000FB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
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

unint64_t sub_10000FBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000FF88(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10001008C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10000FCC4(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000FD78(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v10 = *v4;
  sub_10000F9EC(a2, a3);
  sub_1000102E8();
  if (v13)
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v11;
  char v15 = v12;
  sub_1000071E0(&qword_1000712D8);
  uint64_t result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v10);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_10000F9EC(a2, a3);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = result;
LABEL_5:
  int64_t v18 = (void *)*v5;
  if (v15)
  {
    *(void *)(v18[7] + 8 * v14) = a1;
  }
  else
  {
    sub_1000100E0(v14, a2, a3, a1, v18);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_10000FE8C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v8 = *v3;
  sub_10000FA64(a2);
  sub_1000102E8();
  if (v11)
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v9;
  char v13 = v10;
  sub_1000071E0(&qword_1000712B0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v8)) {
    goto LABEL_5;
  }
  unint64_t v14 = sub_10000FA64(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v14;
LABEL_5:
  uint64_t v16 = (void *)*v4;
  if (v13)
  {
    uint64_t v17 = v16[7];

    *(void *)(v17 + 8 * v12) = a1;
  }
  else
  {
    sub_10000FF88(a2, (uint64_t)v18);
    sub_100010128(v12, (uint64_t)v18, a1, v16);
  }
}

uint64_t sub_10000FF88(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000FFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000071E0(&qword_100071298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001004C()
{
  unint64_t result = qword_1000712A0;
  if (!qword_1000712A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000712A0);
  }
  return result;
}

uint64_t sub_10001008C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000100E0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_100010128(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = a4[6] + 40 * result;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 16) = v5;
  *(void *)(v4 + 32) = *(void *)(a2 + 32);
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_100010180(uint64_t a1)
{
  uint64_t v2 = sub_1000071E0(&qword_1000712B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1000101E0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id sub_100010224@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000EB94(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_100010240()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010278()
{
  return sub_10000ED74();
}

uint64_t sub_100010280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000071E0(&qword_1000712B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t PhotosFeedbackActionPerformer.reportCleanupFeedback(type:asset:originalImageData:renderedImageData:summaryString:completionHandler:)()
{
  sub_10000C00C();
  v1[16] = v19;
  v1[17] = v0;
  v1[14] = v2;
  v1[15] = v18;
  v1[12] = v3;
  v1[13] = v4;
  v1[10] = v5;
  v1[11] = v6;
  v1[8] = v7;
  v1[9] = v8;
  v1[7] = v9;
  v1[18] = swift_getObjectType();
  sub_1000071E0(&qword_1000712E8);
  v1[19] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for FBKSEvaluation.Subject();
  v1[20] = v10;
  sub_100007AF4(v10);
  v1[21] = v11;
  v1[22] = *(void *)(v12 + 64);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  sub_10000C060();
  return _swift_task_switch(v13, v14, v15);
}

uint64_t sub_100010400()
{
  unint64_t v43 = v0;
  uint64_t v1 = (void *)qword_100072038;
  if (qword_100072038)
  {
    long long v2 = xmmword_100072028;
    sub_10000E5E4();
    sub_10000BEE0((void *)v2, *((uint64_t *)&v2 + 1), v1);
    id v3 = v1;
    char v4 = static NSObject.== infix(_:_:)();

    if (v4)
    {
      if (qword_100070E80 != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      sub_1000074D4(v5, (uint64_t)qword_100072010);
      uint64_t v6 = Logger.logObject.getter();
      os_log_type_t v7 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v6, v7))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        sub_1000120F8((void *)&_mh_execute_header, v8, v9, "Skipping reporting feedback because previous request was not completed");
        sub_100007B60();

        swift_release();
      }
      else
      {

        swift_release();
      }

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10000BF64();
      return v41();
    }
    if (qword_100070E80 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_1000074D4(v10, (uint64_t)qword_100072010);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_1000120F8((void *)&_mh_execute_header, v13, v14, "Ignoring previous request because feedback controller does not match");
      sub_100007B60();
    }

    long long v15 = xmmword_100072028;
    uint64_t v16 = (void *)qword_100072038;
    xmmword_100072028 = 0u;
    *(_OWORD *)&qword_100072038 = 0u;
    qword_100072048 = 0;
    sub_10000BE50((void *)v15, *((uint64_t *)&v15 + 1), v16);

    swift_release();
  }
  if (qword_100070E80 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)v0[8];
  uint64_t v18 = type metadata accessor for Logger();
  sub_1000074D4(v18, (uint64_t)qword_100072010);
  id v19 = v17;
  unint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  BOOL v22 = os_log_type_enabled(v20, v21);
  unint64_t v23 = (void *)v0[8];
  if (v22)
  {
    uint64_t v24 = v0[7];
    uint64_t v25 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    v0[4] = v24;
    type metadata accessor for PhotoGMCentralizedFeedbackType(0);
    uint64_t v26 = String.init<A>(describing:)();
    v0[5] = sub_10001AE98(v26, v27, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    v0[2] = sub_100011F38(v23);
    v0[3] = v28;
    sub_1000071E0(&qword_1000710D0);
    uint64_t v29 = String.init<A>(describing:)();
    v0[6] = sub_10001AE98(v29, v30, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Reporting feedback of type: %s for asset %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();
  }
  else
  {
  }
  uint64_t v31 = (void *)swift_task_alloc();
  v0[25] = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_1000108E0;
  uint64_t v32 = v0[24];
  uint64_t v33 = v0[13];
  uint64_t v34 = v0[14];
  uint64_t v35 = v0[11];
  uint64_t v36 = v0[12];
  uint64_t v37 = v0[9];
  uint64_t v38 = v0[10];
  uint64_t v39 = v0[8];
  return sub_100010D64(v32, v39, v37, v38, v35, v36, v33, v34);
}

uint64_t sub_1000108E0()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_1000120C4();
  *long long v2 = v1;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_1000109A8()
{
  uint64_t v1 = (uint64_t *)(v0[17] + OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_previousAssetUUID);
  uint64_t v2 = v1[1];
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)v0[8];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100011F38(v4);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (v3 == v5 && v2 == v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0) {
LABEL_10:
  }
    dispatch thunk of FBKEvaluationController.reset()();
LABEL_12:
  uint64_t v10 = v0[23];
  uint64_t v9 = v0[24];
  uint64_t v11 = v0[21];
  uint64_t v12 = v0[22];
  uint64_t v13 = v0[19];
  uint64_t v14 = v0[20];
  uint64_t v15 = v0[17];
  uint64_t v32 = v0[16];
  uint64_t v30 = v0[18];
  uint64_t v31 = v0[15];
  uint64_t v16 = (void *)v0[8];
  uint64_t v17 = type metadata accessor for TaskPriority();
  sub_100007224(v13, 1, 1, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v9, v14);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))(v19 + v18, v10, v14);
  *(void *)(v19 + ((v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8)) = v30;
  sub_100019ED4(v13, (uint64_t)&unk_100071300, v19);
  swift_release();
  uint64_t v20 = sub_100011F38(v16);
  sub_100009F74(v20, v21);
  BOOL v22 = *(void **)(v15 + OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_feedbackController);
  long long v23 = xmmword_100072028;
  uint64_t v24 = (void *)qword_100072038;
  *(void *)&xmmword_100072028 = v16;
  *((void *)&xmmword_100072028 + 1) = 1;
  qword_100072038 = (uint64_t)v22;
  qword_100072040 = v31;
  qword_100072048 = v32;
  id v25 = v16;
  id v26 = v22;
  swift_retain();
  sub_10000BE50((void *)v23, *((uint64_t *)&v23 + 1), v24);
  type metadata accessor for MainActor();
  v0[26] = static MainActor.shared.getter();
  uint64_t v28 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100010C54, v28, v27);
}

uint64_t sub_100010C54()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release();
  sub_100011C08(v1);
  sub_10000C060();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_100010CE0()
{
  sub_10000C00C();
  (*(void (**)(void, void))(v0[21] + 8))(v0[24], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v1();
}

uint64_t sub_100010D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a3;
  void v8[4] = a4;
  v8[2] = a1;
  uint64_t v9 = type metadata accessor for FBKSInteraction.AnnotatedContent();
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for FBKSInteraction.FeatureDomain();
  v8[12] = v10;
  v8[13] = *(void *)(v10 - 8);
  v8[14] = swift_task_alloc();
  sub_1000071E0(&qword_1000710E0);
  v8[15] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for FBKSInteraction.Content();
  v8[16] = v11;
  v8[17] = *(void *)(v11 - 8);
  v8[18] = swift_task_alloc();
  v8[19] = swift_task_alloc();
  sub_1000071E0(&qword_1000710E8);
  v8[20] = swift_task_alloc();
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  v8[25] = swift_task_alloc();
  sub_1000071E0(&qword_100071570);
  v8[26] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for UUID();
  v8[27] = v12;
  v8[28] = *(void *)(v12 - 8);
  v8[29] = swift_task_alloc();
  uint64_t v13 = (void *)swift_task_alloc();
  v8[30] = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_10001106C;
  return sub_10000A748();
}

uint64_t sub_10001106C()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_1000120C4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_100011134()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  if (sub_10000B91C(v2, 1, v3) == 1)
  {
    unint64_t v4 = v0[4];
    sub_100012004(v2, &qword_100071570);
    if (v4 >> 60 == 15)
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v10 = (uint64_t *)v0[19];
      uint64_t v70 = v0[15];
      uint64_t v11 = v0[3];
      unint64_t v12 = v0[4];
      *uint64_t v10 = v11;
      v10[1] = v12;
      uint64_t v13 = sub_1000120E4();
      v14(v13);
      sub_100012118();
      sub_100012118();
      NSString v15 = sub_1000120A4();
      id v16 = (id)PULocalizedString();

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v17 = String._bridgeToObjectiveC()();
      id v18 = (id)PULocalizedString();

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
      sub_100007224(v70, 1, 1, v19);
      sub_10001206C();
      sub_100012058(v11, v12);
      uint64_t v5 = 0;
    }
    unint64_t v20 = v1[6];
    uint64_t v21 = 1;
    sub_100007224(v1[25], v5, 1, v1[9]);
    if (v20 >> 60 != 15)
    {
      BOOL v22 = (uint64_t *)v1[19];
      uint64_t v23 = v1[15];
      uint64_t v24 = v1[5];
      unint64_t v25 = v1[6];
      *BOOL v22 = v24;
      v22[1] = v25;
      uint64_t v26 = sub_1000120E4();
      v27(v26);
      sub_100012118();
      sub_100012118();
      NSString v28 = sub_1000120A4();
      id v29 = (id)PULocalizedString();

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v30 = String._bridgeToObjectiveC()();
      id v31 = (id)PULocalizedString();

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v32 = type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
      sub_100007224(v23, 1, 1, v32);
      sub_10001206C();
      sub_100012058(v24, v25);
      uint64_t v21 = 0;
    }
    uint64_t v33 = v1[8];
    uint64_t v34 = 1;
    sub_100007224(v1[24], v21, 1, v1[9]);
    if (v33)
    {
      uint64_t v35 = v1[17];
      uint64_t v36 = (void *)v1[18];
      uint64_t v38 = v1[15];
      uint64_t v37 = v1[16];
      uint64_t v39 = v1[8];
      *uint64_t v36 = v1[7];
      v36[1] = v39;
      (*(void (**)(void *, void, uint64_t))(v35 + 104))(v36, enum case for FBKSInteraction.Content.text(_:), v37);
      swift_bridgeObjectRetain();
      NSString v40 = sub_1000120A4();
      id v41 = (id)PULocalizedString();

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v42 = enum case for FBKSInteraction.AnnotatedContent.IconType.text(_:);
      uint64_t v43 = type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
      sub_1000120D4();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 104))(v38, v42, v43);
      sub_100007224(v38, 0, 1, v43);
      FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
      uint64_t v34 = 0;
    }
    uint64_t v45 = v1 + 23;
    uint64_t v47 = v1[24];
    uint64_t v46 = v1[25];
    uint64_t v49 = v1[21];
    uint64_t v48 = v1[22];
    uint64_t v71 = v1[23];
    uint64_t v72 = v1[20];
    uint64_t v51 = v1[13];
    uint64_t v50 = v1[14];
    uint64_t v52 = v1[12];
    uint64_t v53 = v34;
    uint64_t v54 = v1[9];
    sub_100007224(v71, v53, 1, v54);
    (*(void (**)(uint64_t, void, uint64_t))(v51 + 104))(v50, enum case for FBKSInteraction.FeatureDomain.photosCleanup(_:), v52);
    sub_100011F9C(v46, v48);
    sub_100011F9C(v47, v49);
    id v55 = objc_allocWithZone((Class)type metadata accessor for FBKSInteraction());
    sub_10000C060();
    uint64_t v56 = FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)();
    sub_100011F9C(v71, v72);
    if (sub_10000B91C(v72, 1, v54) == 1)
    {
      sub_100012004(*v45, &qword_1000710E8);
      uint64_t v45 = v1 + 24;
      v57 = v1 + 25;
      uint64_t v58 = v1 + 20;
    }
    else
    {
      uint64_t v60 = v1[10];
      uint64_t v59 = v1[11];
      uint64_t v61 = v1[9];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v59, v1[20], v61);
      sub_1000071E0(&qword_100071308);
      unint64_t v62 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
      uint64_t v63 = swift_allocObject();
      *(_OWORD *)(v63 + 16) = xmmword_10004BE80;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v60 + 16))(v63 + v62, v59, v61);
      dispatch thunk of FBKSInteraction.extraContent.setter();
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
      v57 = v1 + 24;
      uint64_t v58 = v1 + 25;
    }
    uint64_t v64 = *v58;
    uint64_t v65 = *v57;
    uint64_t v7 = (uint64_t *)v1[2];
    sub_100012004(*v45, &qword_1000710E8);
    sub_100012004(v65, &qword_1000710E8);
    sub_100012004(v64, &qword_1000710E8);
    *uint64_t v7 = v56;
    uint64_t v9 = (unsigned int *)&enum case for FBKSEvaluation.Subject.interaction(_:);
  }
  else
  {
    uint64_t v6 = v0[29];
    uint64_t v7 = (uint64_t *)v0[2];
    char v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[28] + 32);
    v8(v6, v2, v3);
    v8((uint64_t)v7, v6, v3);
    uint64_t v9 = (unsigned int *)&enum case for FBKSEvaluation.Subject.id(_:);
  }
  uint64_t v66 = *v9;
  type metadata accessor for FBKSEvaluation.Subject();
  sub_1000120D4();
  (*(void (**)(uint64_t *, uint64_t))(v67 + 104))(v7, v66);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v68 = (uint64_t (*)(void))v1[1];
  return v68();
}

uint64_t sub_100011864()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_1000118F8;
  return FBKSEvaluation.Subject.presented()();
}

uint64_t sub_1000118F8()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v2 = *v1;
  sub_1000120C4();
  *uint64_t v3 = v2;
  *(void *)(v4 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_10000C060();
    return _swift_task_switch(v5, v6, v7);
  }
  else
  {
    sub_10000BF64();
    return v8();
  }
}

uint64_t sub_1000119F4()
{
  unint64_t v12 = v0;
  if (qword_100070E80 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000074D4(v1, (uint64_t)qword_100072010);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[5];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[2] = v5;
    swift_errorRetain();
    sub_1000071E0(qword_100071030);
    uint64_t v7 = String.init<A>(describing:)();
    v0[3] = sub_10001AE98(v7, v8, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, ".presented() failed to report with error: %s", v6, 0xCu);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10000BF64();
  return v9();
}

uint64_t sub_100011C08(uint64_t result)
{
  switch(result)
  {
    case 3:
      return dispatch thunk of FBKEvaluationController.userDidReportAConcern(subject:showFeedbackForm:)();
    case 2:
      return dispatch thunk of FBKEvaluationController.userDidDislike(subject:showFeedbackForm:)();
    case 1:
      return dispatch thunk of FBKEvaluationController.userDidLike(subject:showFeedbackForm:)();
  }
  return result;
}

uint64_t sub_100011CA0()
{
  uint64_t v1 = type metadata accessor for FBKSEvaluation.Subject();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100011D78()
{
  uint64_t v1 = type metadata accessor for FBKSEvaluation.Subject();
  sub_100007AF4(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100011E78;
  return sub_100011864();
}

uint64_t sub_100011E78()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_1000120C4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000BF64();
  return v3();
}

uint64_t sub_100011F38(void *a1)
{
  id v1 = [a1 uuid];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_100011F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000071E0(&qword_1000710E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012004(uint64_t a1, uint64_t *a2)
{
  sub_1000071E0(a2);
  sub_1000120D4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100012058(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000E43C(a1, a2);
  }
  return a1;
}

uint64_t sub_10001206C()
{
  return FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
}

NSString sub_1000120A4()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000120E4()
{
  return v0;
}

void sub_1000120F8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100012118()
{
  return sub_10000E3E4(v0, v1);
}

uint64_t sub_100012130()
{
  return sub_100012208(&qword_100070EA8, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t type metadata accessor for CollectionEntity()
{
  uint64_t result = qword_1000714C0;
  if (!qword_1000714C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000121C0()
{
  return sub_100012208(&qword_100071320, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_100012208(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100012250()
{
  return sub_100012208(&qword_100071328, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

unint64_t sub_10001229C()
{
  unint64_t result = qword_100071330;
  if (!qword_100071330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071330);
  }
  return result;
}

void *sub_1000122E8()
{
  return &protocol witness table for UUID;
}

uint64_t sub_1000122F4(char a1, char a2)
{
  if (*(void *)&aRecents_1[8 * a1] == *(void *)&aRecents_1[8 * a2]
    && *(void *)&aOneyeara[8 * a1 + 8] == *(void *)&aOneyeara[8 * a2 + 8])
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

uint64_t sub_10001237C(uint64_t *a1, void *a2, char a3, void *a4)
{
  char v7 = a3 & 1;
  sub_1000101E0(a2, a2[3]);
  sub_100019054();
  __chkstk_darwin(v8);
  sub_100019100();
  (*(void (**)(uint64_t))(v9 + 16))(v4);
  AnyHashable.init<A>(_:)();
  sub_10000FF88((uint64_t)v31, (uint64_t)v29);
  AnyHashable.init<A>(_:)();
  uint64_t v10 = sub_10000A6B8(v7, *a1);
  if (!v10) {
    goto LABEL_16;
  }
  id v11 = sub_10000A700((uint64_t)v30, v10);
  swift_bridgeObjectRelease();
  sub_10001008C((uint64_t)v30);
  if (v11)
  {
    sub_10001008C((uint64_t)v31);
    return (uint64_t)v11;
  }
  sub_10000FF88((uint64_t)v31, (uint64_t)v29);
  AnyHashable.init<A>(_:)();
  id v11 = a4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v29[0] = *a1;
  uint64_t v13 = v29[0];
  *a1 = 0x8000000000000000;
  unint64_t v14 = sub_10000FAA8(v7);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = (v15 & 1) == 0;
  Swift::Int v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v19 = v14;
  char v20 = v15;
  sub_1000071E0(&qword_1000712A8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v18))
  {
LABEL_8:
    if (v20)
    {
      uint64_t v23 = v29[0];
      uint64_t v24 = *(void *)(*(void *)(v29[0] + 56) + 8 * v19);
      char v25 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v32 = v24;
      sub_10000FE8C((uint64_t)v11, (uint64_t)v30, v25);
      uint64_t v26 = v32;
      swift_bridgeObjectRelease();
      sub_10001008C((uint64_t)v30);
      if (v26)
      {
        *(void *)(*(void *)(v23 + 56) + 8 * v19) = v26;
      }
      else
      {
        sub_1000071E0(&qword_100071560);
        sub_100018D04();
        _NativeDictionary._delete(at:)();
      }
      *a1 = v23;
      sub_10001008C((uint64_t)v31);
      id v27 = v11;
      return (uint64_t)v11;
    }
    goto LABEL_15;
  }
  unint64_t v21 = sub_10000FAA8(v7);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v19 = v21;
    goto LABEL_8;
  }
LABEL_17:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10001261C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000071E0(&qword_100071570);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  char v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v22 - v12;
  __chkstk_darwin(v11);
  char v15 = (char *)&v22 - v14;
  switch(a1)
  {
    case 1:
      UUID.init(uuidString:)();
      uint64_t v16 = type metadata accessor for UUID();
      if (sub_10000B91C((uint64_t)v13, 1, v16) == 1) {
        goto LABEL_15;
      }
      BOOL v17 = *(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32);
      uint64_t v18 = a2;
      unint64_t v19 = v13;
      return v17(v18, v19, v16);
    case 2:
      UUID.init(uuidString:)();
      uint64_t v20 = type metadata accessor for UUID();
      if (sub_10000B91C((uint64_t)v7, 1, v20) == 1)
      {
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        JUMPOUT(0x1000128F0);
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a2, v7, v20);
    case 3:
      UUID.init(uuidString:)();
      uint64_t v16 = type metadata accessor for UUID();
      if (sub_10000B91C((uint64_t)v10, 1, v16) == 1) {
        goto LABEL_13;
      }
      BOOL v17 = *(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32);
      uint64_t v18 = a2;
      unint64_t v19 = v10;
      return v17(v18, v19, v16);
    default:
      UUID.init(uuidString:)();
      uint64_t v16 = type metadata accessor for UUID();
      if (sub_10000B91C((uint64_t)v15, 1, v16) == 1) {
        goto LABEL_14;
      }
      BOOL v17 = *(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32);
      uint64_t v18 = a2;
      unint64_t v19 = v15;
      return v17(v18, v19, v16);
  }
}

uint64_t sub_100012900()
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v3 = __chkstk_darwin(v2);
  __chkstk_darwin(v3);
  uint64_t v4 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Locale();
  __chkstk_darwin(v8 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

id sub_100012C78()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PlacesAlbumThumbnailGenerator()) init];
  qword_100071310 = (uint64_t)result;
  return result;
}

id sub_100012CAC(uint64_t a1, char a2)
{
  type metadata accessor for PhotosCollectionEntityCache();
  uint64_t v4 = sub_10000E944(a1);
  uint64_t v16 = &type metadata for StaticAlbum;
  unint64_t v17 = sub_100018A88();
  v15[0] = a2;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_7;
  }
  uint64_t v6 = (void *)Strong;
  uint64_t v7 = *(void *)(v4 + 64);
  __chkstk_darwin(Strong);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  sub_100018AD4((uint64_t *)(v7 + 16), &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  uint64_t v8 = v14;
  swift_release();
  if (!v8)
  {
    id v9 = sub_100012E90(v6, a2);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(v4 + 64);
      __chkstk_darwin(v9);
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
      sub_100018CE0((uint64_t *)(v11 + 16), (uint64_t *)&v14);
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
      uint64_t v8 = v14;
      swift_release();

      goto LABEL_8;
    }

LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }

LABEL_8:
  sub_10000BDAC((uint64_t)v15);
  id v12 = [v8 firstObject];
  swift_release();

  return v12;
}

id sub_100012E90(void *a1, char a2)
{
  id v3 = [a1 librarySpecificFetchOptions];
  uint64_t v4 = v3;
  switch(a2)
  {
    case 1:
      id v5 = [self fetchAssetCollectionsWithType:2 subtype:203 options:v3];
      goto LABEL_6;
    case 2:
      [v3 setIncludePlacesSmartAlbum:1];
      id v5 = [self fetchAssetCollectionsWithType:2 subtype:1000000203 options:v4];
      goto LABEL_6;
    case 3:

      return 0;
    default:
      id v5 = [self fetchAssetCollectionsWithType:2 subtype:209 options:v3];
LABEL_6:
      id v6 = v5;

      return v6;
  }
}

id sub_100012FB0(uint64_t a1, unsigned __int8 a2)
{
  type metadata accessor for PhotosCollectionEntityCache();
  uint64_t v4 = sub_10000E944(a1);
  uint64_t v16 = &type metadata for StaticAlbum;
  unint64_t v17 = sub_100018A88();
  v15[0] = a2;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_7;
  }
  id v6 = (void *)Strong;
  uint64_t v7 = *(void *)(v4 + 64);
  __chkstk_darwin(Strong);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  sub_10001903C((uint64_t *)(v7 + 16), &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  uint64_t v8 = v14;
  swift_release();
  if (!v8)
  {
    uint64_t v9 = sub_10001318C(v6, a2);
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = *(void *)(v4 + 64);
      __chkstk_darwin(v9);
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
      sub_100019024((uint64_t *)(v11 + 16), (uint64_t *)&v14);
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
      uint64_t v8 = v14;
      swift_release();

      goto LABEL_8;
    }

LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }

LABEL_8:
  sub_10000BDAC((uint64_t)v15);
  id v12 = [v8 firstObject];
  swift_release();

  return v12;
}

uint64_t sub_10001318C(void *a1, unsigned __int8 a2)
{
  unsigned int v4 = a2;
  uint64_t v5 = sub_1000071E0(&qword_100071578);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v64 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v63 = (char *)&v56 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v56 - v10;
  uint64_t v12 = sub_1000071E0(&qword_100071580);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000071E0(&qword_100071588);
  __chkstk_darwin(v15 - 8);
  unint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DateComponents();
  uint64_t v61 = *(void *)(v18 - 8);
  uint64_t v62 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v65 = *(void *)(v21 - 8);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v60 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v66 = (char *)&v56 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v67 = (char *)&v56 - v27;
  __chkstk_darwin(v26);
  id v29 = (char *)&v56 - v28;
  uint64_t v30 = type metadata accessor for Calendar();
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v56 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4 <= 2)
  {
    id v35 = sub_100012CAC((uint64_t)a1, a2);
    if (!v35) {
      return 0;
    }
    uint64_t v36 = v35;
    id v37 = [a1 librarySpecificFetchOptions];
    [v37 setFetchLimit:1];
    [v37 setReverseSortOrder:[v36 keyAssetsAtEnd]];
    id v38 = [self fetchAssetsInAssetCollection:v36 options:v37];

    return (uint64_t)v38;
  }
  uint64_t v57 = v32;
  uint64_t v39 = v31;
  id v56 = [a1 librarySpecificFetchOptions];
  static Calendar.current.getter();
  Date.init()();
  uint64_t v59 = v39;
  sub_100007224((uint64_t)v17, 1, 1, v39);
  uint64_t v40 = type metadata accessor for TimeZone();
  sub_100007224((uint64_t)v14, 1, 1, v40);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  DateComponents.year.setter();
  uint64_t v58 = v29;
  Calendar.date(byAdding:to:wrappingComponents:)();
  uint64_t result = sub_10000B91C((uint64_t)v11, 1, v21);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v42 = v65;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
  v43(v67, v11, v21);
  DateComponents.year.setter();
  DateComponents.day.setter();
  uint64_t v44 = (uint64_t)v63;
  Calendar.date(byAdding:to:wrappingComponents:)();
  uint64_t v45 = v44;
  uint64_t result = sub_10000B91C(v44, 1, v21);
  uint64_t v46 = (uint64_t)v64;
  if (result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v43(v66, (char *)v45, v21);
  DateComponents.day.setter();
  Calendar.date(byAdding:to:wrappingComponents:)();
  uint64_t result = sub_10000B91C(v46, 1, v21);
  if (result != 1)
  {
    uint64_t v47 = v60;
    v43(v60, (char *)v46, v21);
    sub_10000BEA4(0, &qword_100071590);
    sub_1000071E0(&qword_100071598);
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_10004C1C0;
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    uint64_t v50 = sub_10000BEA4(0, &qword_1000715A0);
    *(void *)(v48 + 56) = v50;
    unint64_t v51 = sub_100018D50();
    *(void *)(v48 + 64) = v51;
    *(void *)(v48 + 32) = isa;
    v52.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
    *(void *)(v48 + 96) = v50;
    *(void *)(v48 + 104) = v51;
    *(NSDate *)(v48 + 72) = v52;
    uint64_t v53 = NSPredicate.init(format:_:)();
    id v54 = v56;
    [v56 setPredicate:v53];

    [v54 setFetchLimit:1];
    id v38 = [self fetchAssetsWithOptions:v54];

    id v55 = *(void (**)(char *, uint64_t))(v42 + 8);
    v55(v47, v21);
    v55(v66, v21);
    v55(v67, v21);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v20, v62);
    v55(v58, v21);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v34, v59);
    return (uint64_t)v38;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100013958(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 88) = a3;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_1000071E0(&qword_100071528);
  *(void *)(v3 + 32) = swift_task_alloc();
  *(void *)(v3 + 40) = swift_task_alloc();
  *(void *)(v3 + 48) = swift_task_alloc();
  return _swift_task_switch(sub_100013A0C, 0, 0);
}

uint64_t sub_100013A0C()
{
  sub_10000C00C();
  switch(*(unsigned char *)(v0 + 88))
  {
    case 1:
      id v6 = sub_100012FB0(*(void *)(v0 + 24), 1u);
      if (!v6) {
        goto LABEL_21;
      }
      uint64_t v2 = v6;
      sub_100019174((uint64_t)v6);

      uint64_t v7 = type metadata accessor for DisplayRepresentation.Image();
      int v8 = sub_1000190C4(v7);
      uint64_t v5 = *(void *)(v0 + 40);
      if (v8 != 1) {
        goto LABEL_20;
      }
      sub_100018944(*(void *)(v0 + 40));
      goto LABEL_21;
    case 2:
      id v9 = sub_100012CAC(*(void *)(v0 + 24), 2);
      *(void *)(v0 + 56) = v9;
      if (!v9) {
        goto LABEL_21;
      }
      uint64_t v10 = (uint64_t)v9;
      if (qword_100070E98 != -1) {
        swift_once();
      }
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 64) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_100013CCC;
      return sub_100013EEC(v10);
    case 3:
      id v13 = sub_100012FB0(*(void *)(v0 + 24), 3u);
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v2 = v13;
      sub_100019174((uint64_t)v13);

      uint64_t v14 = type metadata accessor for DisplayRepresentation.Image();
      int v15 = sub_1000190C4(v14);
      uint64_t v5 = *(void *)(v0 + 32);
      if (v15 != 1) {
        goto LABEL_20;
      }
      sub_100018944(*(void *)(v0 + 32));
      goto LABEL_21;
    default:
      id v1 = sub_100012FB0(*(void *)(v0 + 24), 0);
      if (!v1) {
        goto LABEL_21;
      }
      uint64_t v2 = v1;
      sub_100019174((uint64_t)v1);

      uint64_t v3 = type metadata accessor for DisplayRepresentation.Image();
      int v4 = sub_1000190C4(v3);
      uint64_t v5 = *(void *)(v0 + 48);
      if (v4 == 1)
      {
        sub_100018944(*(void *)(v0 + 48));
LABEL_21:
        DisplayRepresentation.Image.init(systemName:isTemplate:)();
      }
      else
      {
LABEL_20:
        (*(void (**)(void, uint64_t, void *))(*((void *)v2 - 1) + 32))(*(void *)(v0 + 16), v5, v2);
      }
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10000BF64();
      return v16();
  }
}

uint64_t sub_100013CCC()
{
  sub_10000C00C();
  sub_10000BF2C();
  sub_100019084();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 72) = v4;
  *(void *)(v2 + 80) = v5;
  swift_task_dealloc();
  if (v0) {
    swift_errorRelease();
  }
  sub_10000C060();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_100013DB8()
{
  sub_10000C00C();
  if (*(void *)(v0 + 80) >> 60 == 15)
  {

    sub_100019190();
  }
  else
  {
    id v1 = *(void **)(v0 + 56);
    DisplayRepresentation.Image.init(data:isTemplate:)();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v2();
}

uint64_t sub_100013E68()
{
  sub_10000C00C();

  sub_100019190();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v1();
}

uint64_t sub_100013EEC(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return _swift_task_switch(sub_100013F0C, 0, 0);
}

uint64_t sub_100013F0C()
{
  uint64_t v1 = (char *)v0[5];
  uint64_t v2 = OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_lock;
  v0[6] = OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_lock;
  uint64_t v3 = *(void **)&v1[v2];
  uint64_t v4 = v1;
  id v5 = v3;
  [v5 lock];
  uint64_t v6 = OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail;
  v0[7] = OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail;
  uint64_t v7 = (uint64_t *)&v4[v6];
  unint64_t v8 = v7[1];
  sub_1000189A4(*v7, v8);
  [v5 unlock];

  if (v8 >> 60 == 15)
  {
    v0[8] = [objc_allocWithZone((Class)PXPlacesAlbumCoverProvider) initWithDelegate:v0[5] andPlacesCollection:v0[4]];
    v0[9] = self;
    v0[10] = type metadata accessor for MainActor();
    v0[11] = static MainActor.shared.getter();
    uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
    return _swift_task_switch(sub_100014088, v10, v9);
  }
  else
  {
    uint64_t v11 = sub_100019144();
    return v12(v11);
  }
}

uint64_t sub_100014088()
{
  sub_10000C00C();
  uint64_t v1 = *(void **)(v0 + 72);
  swift_release();
  *(void *)(v0 + 96) = [v1 mainScreen];
  sub_10000C060();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_100014108()
{
  sub_10000C00C();
  *(void *)(v0 + 104) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100014190, v2, v1);
}

uint64_t sub_100014190()
{
  sub_10000C00C();
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();
  [v1 scale];
  *(void *)(v0 + 112) = v2;

  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_100014208()
{
  uint64_t v1 = *(void *)(v0 + 64);
  id v2 = [objc_allocWithZone((Class)PXAppIntentsExtendedTraitCollection) initWithUserInterfaceStyle:1 displayScale:*(double *)(v0 + 112)];
  *(void *)(v0 + 120) = v2;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 128) = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v4;
  sub_1000071E0(&qword_100071538);
  void *v4 = v0;
  v4[1] = sub_10001433C;
  sub_10000C060();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_10001433C()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v3 = v2;
  sub_100019084();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_100019084();
  *uint64_t v6 = v5;
  *(void *)(v3 + 144) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  sub_10000C060();
  return _swift_task_switch(v7, v8, v9);
}

void sub_100014424()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = (void *)v0[8];
  uint64_t v3 = (char *)v0[5];
  uint64_t v4 = (uint64_t *)&v3[v0[7]];
  uint64_t v6 = v0[2];
  unint64_t v5 = v0[3];
  uint64_t v7 = *(void **)&v3[v0[6]];
  uint64_t v8 = v3;
  sub_1000189A4(v6, v5);
  id v9 = v7;
  [v9 lock];
  uint64_t v10 = *v4;
  unint64_t v11 = v4[1];
  uint64_t *v4 = v6;
  v4[1] = v5;
  sub_1000189A4(v6, v5);
  sub_100012058(v10, v11);
  [v9 unlock];

  sub_100012058(v6, v5);
  sub_100019144();
  sub_100019118();
  __asm { BRAA            X3, X16 }
}

uint64_t sub_100014518()
{
  sub_10000C00C();
  uint64_t v1 = *(void **)(v0 + 120);

  swift_task_dealloc();
  sub_10000BF64();
  return v2();
}

uint64_t sub_100014584@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000071E0(&qword_100071520);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v22 - v12;
  __chkstk_darwin(v11);
  int v15 = (char *)&v22 - v14;
  switch(a1)
  {
    case 1:
      URL.init(string:)();
      uint64_t v16 = type metadata accessor for URL();
      if (sub_10000B91C((uint64_t)v13, 1, v16) == 1) {
        goto LABEL_15;
      }
      uint64_t v17 = *(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32);
      uint64_t v18 = a2;
      uint64_t v19 = v13;
      return v17(v18, v19, v16);
    case 2:
      URL.init(string:)();
      uint64_t v20 = type metadata accessor for URL();
      if (sub_10000B91C((uint64_t)v7, 1, v20) == 1)
      {
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        JUMPOUT(0x100014868);
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a2, v7, v20);
    case 3:
      URL.init(string:)();
      uint64_t v16 = type metadata accessor for URL();
      if (sub_10000B91C((uint64_t)v10, 1, v16) == 1) {
        goto LABEL_13;
      }
      uint64_t v17 = *(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32);
      uint64_t v18 = a2;
      uint64_t v19 = v10;
      return v17(v18, v19, v16);
    default:
      URL.init(string:)();
      uint64_t v16 = type metadata accessor for URL();
      if (sub_10000B91C((uint64_t)v15, 1, v16) == 1) {
        goto LABEL_14;
      }
      uint64_t v17 = *(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32);
      uint64_t v18 = a2;
      uint64_t v19 = v15;
      return v17(v18, v19, v16);
  }
}

unint64_t sub_100014878(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100061EF8, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

_UNKNOWN **sub_1000148C4()
{
  return &off_100061F78;
}

uint64_t sub_1000148D0(char a1)
{
  return *(void *)&aRecents_1[8 * a1];
}

uint64_t sub_1000148F0(char *a1, char *a2)
{
  return sub_1000122F4(*a1, *a2);
}

Swift::Int sub_1000148FC()
{
  return sub_100014904();
}

Swift::Int sub_100014904()
{
  return Hasher._finalize()();
}

uint64_t sub_10001494C()
{
  return sub_100014954();
}

uint64_t sub_100014954()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000149A8()
{
  return sub_1000149B0();
}

Swift::Int sub_1000149B0()
{
  return Hasher._finalize()();
}

unint64_t sub_1000149F4@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100014878(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100014A24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000148D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_UNKNOWN **sub_100014A50@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000148C4();
  *a1 = result;
  return result;
}

uint64_t sub_100014A78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000071E0(&qword_100071570);
  uint64_t v3 = sub_100007B0C(v2);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v44 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v43 = (char *)&v33 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v42 = (char *)&v33 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v33 - v10;
  uint64_t v12 = type metadata accessor for UUID();
  sub_100019054();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100007B18();
  uint64_t v18 = v17 - v16;
  type metadata accessor for LocalizedStringResource();
  sub_100019054();
  __chkstk_darwin(v19);
  sub_100007B18();
  uint64_t v20 = 4;
  uint64_t v34 = v22 - v21;
  uint64_t v35 = v23;
  uint64_t v36 = v24;
  uint64_t v37 = a1;
  unint64_t v40 = 0x800000010004D050;
  unint64_t v41 = 0x800000010004D080;
  unint64_t v38 = 0x800000010004D020;
  unint64_t v39 = 0x800000010004CFF0;
  uint64_t v25 = &byte_100061F98;
  while (2)
  {
    int v26 = *v25++;
    switch(v26)
    {
      case 1:
        sub_100019134();
        UUID.init(uuidString:)();
        sub_10001909C();
        if (!v29) {
          goto LABEL_12;
        }
        goto LABEL_19;
      case 2:
        sub_100019134();
        UUID.init(uuidString:)();
        sub_10001909C();
        if (!v29) {
          goto LABEL_12;
        }
        goto LABEL_17;
      case 3:
        sub_100019134();
        UUID.init(uuidString:)();
        sub_10001909C();
        if (!v29) {
          goto LABEL_12;
        }
        goto LABEL_18;
      default:
        UUID.init(uuidString:)();
        int v27 = sub_10000B91C((uint64_t)v11, 1, v12);
        uint64_t v28 = v11;
        if (v27 == 1)
        {
          __break(1u);
LABEL_17:
          __break(1u);
LABEL_18:
          __break(1u);
LABEL_19:
          __break(1u);
          JUMPOUT(0x100014DE4);
        }
LABEL_12:
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v18, v28, v12);
        char v30 = static UUID.== infix(_:_:)();
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v12);
        if ((v30 & 1) == 0)
        {
          if (!--v20)
          {
            swift_bridgeObjectRelease();
            return LocalizedStringResource.init(stringLiteral:)();
          }
          continue;
        }
        swift_bridgeObjectRelease();
        uint64_t v32 = v34;
        sub_100012900();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v37, v32, v36);
    }
  }
}

uint64_t sub_100014DF4()
{
  uint64_t v0 = sub_1000071E0(&qword_1000715D0);
  uint64_t v1 = sub_100007B0C(v0);
  __chkstk_darwin(v1);
  sub_100007B18();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for LocalizedStringResource.BundleDescription();
  sub_100019054();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_100007B18();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for Locale();
  uint64_t v13 = sub_100007B0C(v12);
  __chkstk_darwin(v13);
  sub_100007B18();
  uint64_t v14 = type metadata accessor for String.LocalizationValue();
  uint64_t v15 = sub_100007B0C(v14);
  __chkstk_darwin(v15);
  sub_1000190E4();
  uint64_t v16 = type metadata accessor for LocalizedStringResource();
  __chkstk_darwin(v16);
  sub_100019100();
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v11, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)();
  sub_100007224(v4, 1, 1, v16);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10001500C()
{
  uint64_t v2 = sub_1000071E0(&qword_100071528);
  uint64_t v3 = sub_100007B0C(v2);
  __chkstk_darwin(v3);
  sub_100007B18();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1000071E0(&qword_1000715D0);
  uint64_t v8 = sub_100007B0C(v7);
  __chkstk_darwin(v8);
  sub_100007B18();
  uint64_t v41 = v10 - v9;
  uint64_t v11 = type metadata accessor for LocalizedStringResource();
  sub_100019054();
  __chkstk_darwin(v12);
  sub_1000190E4();
  uint64_t v13 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  uint64_t v14 = sub_100007B0C(v13);
  uint64_t v15 = __chkstk_darwin(v14);
  __chkstk_darwin(v15);
  uint64_t v16 = type metadata accessor for CollectionEntity();
  uint64_t v17 = v0;
  uint64_t v18 = v0 + *(int *)(v16 + 24);
  if ((*(unsigned char *)(v18 + 8) & 1) != 0 || *(uint64_t *)v18 < 1)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v33);
    sub_100014A78(v1);
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)();
    uint64_t v34 = sub_10001915C();
    v35(v34);
    v36._countAndFlagsBits = 0;
    v36._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v36);
    LocalizedStringResource.init(stringInterpolation:)();
    uint64_t v31 = v41;
    uint64_t v32 = 1;
  }
  else
  {
    uint64_t v19 = self;
    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
    id v21 = [v19 localizedStringFromNumber:isa numberStyle:1];

    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = v22;

    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v24);
    sub_100014A78(v1);
    String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)();
    uint64_t v25 = sub_10001915C();
    v26(v25);
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v27);
    LocalizedStringResource.init(stringInterpolation:)();
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v28);
    v29._countAndFlagsBits = v40;
    v29._object = v23;
    String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v29);
    swift_bridgeObjectRelease();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v30);
    LocalizedStringResource.init(stringInterpolation:)();
    uint64_t v31 = v41;
    uint64_t v32 = 0;
  }
  sub_100007224(v31, v32, 1, v11);
  uint64_t v37 = v17 + *(int *)(v16 + 20);
  uint64_t v38 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16))(v6, v37, v38);
  sub_100007224(v6, 0, 1, v38);
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_1000153A0()
{
  return sub_100012208(&qword_100071338, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_1000153E8()
{
  return sub_100012208((unint64_t *)&unk_100071340, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_100015430()
{
  return sub_100012208((unint64_t *)&qword_100070FF8, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_100015478()
{
  return sub_100012208(&qword_100071350, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_1000154C0()
{
  return sub_100012208(&qword_100071358, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_100015508@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100015578()
{
  return sub_10000719C(&qword_100071360, &qword_100071368);
}

uint64_t sub_1000155B4(uint64_t a1)
{
  uint64_t v2 = sub_100012208(qword_100071390, (void (*)(uint64_t))type metadata accessor for CollectionEntity);

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100015630()
{
  return sub_100012208((unint64_t *)&unk_100071370, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_10001567C(uint64_t a1)
{
  uint64_t v2 = sub_100012208(&qword_100071350, (void (*)(uint64_t))type metadata accessor for CollectionEntity);

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000156F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_100019090((uint64_t)sub_100015710);
}

uint64_t sub_100015710()
{
  sub_10000C00C();
  id v1 = -[PhotosApplication px_photoLibrary]_0();
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000157B0;
  return sub_100016254((uint64_t)v1);
}

uint64_t sub_1000157B0()
{
  sub_10000C00C();
  sub_10000BF2C();
  sub_100019084();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 40) = v3;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100015880()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_bridgeObjectRetain();
  sub_10001590C(v1, v2);

  uint64_t v4 = sub_1000191B4();
  return v5(v4);
}

uint64_t sub_10001590C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000071E0(&qword_100071570);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CollectionEntity();
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v31 = (uint64_t)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v13);
  uint64_t v42 = (uint64_t)v30 - v16;
  uint64_t v17 = &_swiftEmptyArrayStorage;
  uint64_t v43 = &_swiftEmptyArrayStorage;
  uint64_t v37 = *(void *)(a1 + 16);
  if (v37)
  {
    v30[1] = v2;
    unint64_t v18 = 0;
    uint64_t v40 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v41 = v6 + 16;
    uint64_t v32 = v6;
    uint64_t v19 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v35 = a2;
    uint64_t v36 = a1;
    while (v18 < *(void *)(a1 + 16))
    {
      unint64_t v20 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
      uint64_t v21 = *(void *)(v38 + 72);
      unint64_t v39 = v18;
      sub_100007570(a1 + v20 + v21 * v18, v42);
      uint64_t v22 = *(void *)(a2 + 16);
      if (v22)
      {
        uint64_t v33 = v21;
        unint64_t v34 = v20;
        uint64_t v23 = a2 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
        uint64_t v24 = *(void *)(v32 + 72);
        uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          v25(v11, v23, v5);
          sub_100007224((uint64_t)v11, 0, 1, v5);
          if (sub_10000B91C((uint64_t)v11, 1, v5) == 1) {
            break;
          }
          (*v40)(v8, v11, v5);
          sub_100012208(&qword_1000715B8, (void (*)(uint64_t))&type metadata accessor for UUID);
          char v26 = dispatch thunk of static Equatable.== infix(_:_:)();
          (*v19)(v8, v5);
          if (v26)
          {
            a2 = v35;
            swift_bridgeObjectRelease();
            sub_100018534(v42, v31);
            Swift::String v27 = v43;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_100018AF4(0, v27[2] + 1, 1);
              Swift::String v27 = v43;
            }
            a1 = v36;
            unint64_t v29 = v27[2];
            unint64_t v28 = v27[3];
            if (v29 >= v28 >> 1)
            {
              sub_100018AF4(v28 > 1, v29 + 1, 1);
              Swift::String v27 = v43;
            }
            v27[2] = v29 + 1;
            uint64_t result = sub_100018534(v31, (uint64_t)v27 + v34 + v29 * v33);
            goto LABEL_18;
          }
          v23 += v24;
          if (!--v22) {
            goto LABEL_11;
          }
        }
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_11:
        sub_100007224((uint64_t)v11, 1, 1, v5);
      }
      a2 = v35;
      swift_bridgeObjectRelease();
      uint64_t result = sub_100007294(v42);
      a1 = v36;
LABEL_18:
      unint64_t v18 = v39 + 1;
      if (v39 + 1 == v37)
      {
        uint64_t v17 = v43;
        goto LABEL_20;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_20:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v17;
  }
  return result;
}

uint64_t sub_100015D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v29 = type metadata accessor for LocalizedStringResource();
  uint64_t v5 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CollectionEntity();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v27 = (uint64_t)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - v12;
  uint64_t v14 = &_swiftEmptyArrayStorage;
  unint64_t v34 = &_swiftEmptyArrayStorage;
  uint64_t v26 = *(void *)(a1 + 16);
  if (v26)
  {
    unint64_t v15 = 0;
    uint64_t v24 = v3;
    uint64_t v25 = (void (**)(char *, uint64_t))(v5 + 8);
    while (v15 < *(void *)(a1 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
      uint64_t v17 = *(void *)(v28 + 72);
      uint64_t v18 = a1;
      sub_100007570(a1 + v16 + v17 * v15, (uint64_t)v13);
      v33._countAndFlagsBits = 0;
      v33._object = (void *)0xE000000000000000;
      sub_100014A78((uint64_t)v7);
      uint64_t v19 = v29;
      _print_unlocked<A, B>(_:_:)();
      (*v25)(v7, v19);
      Swift::String v20 = String.lowercased()();
      swift_bridgeObjectRelease();
      Swift::String v33 = v20;
      Swift::String v32 = String.lowercased()();
      sub_100018DB0();
      LOBYTE(v19) = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19)
      {
        sub_100018534((uint64_t)v13, v27);
        uint64_t v21 = v34;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100018AF4(0, v21[2] + 1, 1);
          uint64_t v21 = v34;
        }
        unint64_t v23 = v21[2];
        unint64_t v22 = v21[3];
        if (v23 >= v22 >> 1)
        {
          sub_100018AF4(v22 > 1, v23 + 1, 1);
          uint64_t v21 = v34;
        }
        v21[2] = v23 + 1;
        uint64_t result = sub_100018534(v27, (uint64_t)v21 + v16 + v23 * v17);
      }
      else
      {
        uint64_t result = sub_100007294((uint64_t)v13);
      }
      ++v15;
      a1 = v18;
      if (v26 == v15)
      {
        uint64_t v14 = v34;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v14;
  }
  return result;
}

uint64_t sub_10001606C()
{
  return sub_100019090((uint64_t)sub_100016080);
}

uint64_t sub_100016080()
{
  sub_10000C00C();
  id v1 = -[PhotosApplication px_photoLibrary]_0();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100016120;
  return sub_100016254((uint64_t)v1);
}

uint64_t sub_100016120()
{
  sub_10000C00C();
  sub_10000BF2C();
  sub_100019084();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 32) = v3;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1000161F0()
{
  sub_10000C00C();

  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 32);
  return v1(v2);
}

uint64_t sub_100016254(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = type metadata accessor for DisplayRepresentation.Image();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for UUID();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for CollectionEntity();
  v1[9] = v4;
  v1[10] = *(void *)(v4 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  return _swift_task_switch(sub_1000163DC, 0, 0);
}

uint64_t sub_1000163DC()
{
  *(void *)(v0 + 104) = 4;
  uint64_t v1 = 0;
  while (1)
  {
    *(void *)(v0 + 112) = v1;
    *(void *)(v0 + 120) = &_swiftEmptyArrayStorage;
    uint64_t v2 = *(void *)(v0 + 16);
    char v3 = *((unsigned char *)&off_100061F78 + v1 + 32);
    *(unsigned char *)(v0 + 136) = v3;
    id v4 = sub_100012FB0(v2, v3);
    if (v4) {
      break;
    }
    uint64_t v1 = *(void *)(v0 + 112) + 1;
    if (v1 == *(void *)(v0 + 104))
    {
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v5 = *(uint64_t (**)(void *))(v0 + 8);
      return v5(&_swiftEmptyArrayStorage);
    }
  }
  uint64_t v7 = *(void *)(v0 + 64);

  sub_10001261C(v3, v7);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10001654C;
  uint64_t v9 = *(void *)(v0 + 40);
  uint64_t v10 = *(void *)(v0 + 16);
  return sub_100013958(v9, v10, v3);
}

uint64_t sub_10001654C()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_100019084();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_100016618()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(int **)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = *(void *)(v0 + 40);
  uint64_t v9 = *(void *)(v0 + 24);
  sub_100014584(*(unsigned char *)(v0 + 136), v1 + v4[7]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v3, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1 + v4[5], v8, v9);
  uint64_t v10 = v1 + v4[6];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  sub_100007570(v1, v2);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *(void *)(v0 + 120);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v12 = sub_100018308(0, *(void *)(v12 + 16) + 1, 1, *(void *)(v0 + 120));
  }
  unint64_t v14 = *(void *)(v12 + 16);
  unint64_t v13 = *(void *)(v12 + 24);
  if (v14 >= v13 >> 1) {
    uint64_t v12 = sub_100018308(v13 > 1, v14 + 1, 1, v12);
  }
  uint64_t v15 = *(void *)(v0 + 88);
  uint64_t v16 = *(void *)(v0 + 96);
  uint64_t v17 = *(void *)(v0 + 80);
  *(void *)(v12 + 16) = v14 + 1;
  sub_100018534(v15, v12+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(void *)(v17 + 72) * v14);
  sub_100007294(v16);
  do
  {
    uint64_t v18 = *(void *)(v0 + 112) + 1;
    if (v18 == *(void *)(v0 + 104))
    {
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_100019118();
      __asm { BRAA            X2, X16 }
    }
    *(void *)(v0 + 112) = v18;
    *(void *)(v0 + 120) = v12;
    uint64_t v19 = *(void *)(v0 + 16);
    char v20 = *((unsigned char *)&off_100061F78 + v18 + 32);
    *(unsigned char *)(v0 + 136) = v20;
    id v21 = sub_100012FB0(v19, v20);
  }
  while (!v21);
  uint64_t v22 = *(void *)(v0 + 64);

  sub_10001261C(v20, v22);
  unint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v23;
  *unint64_t v23 = v0;
  v23[1] = sub_10001654C;
  sub_100019118();
  return sub_100013958(v24, v25, v26);
}

uint64_t sub_10001688C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_100019090((uint64_t)sub_1000168A4);
}

uint64_t sub_1000168A4()
{
  sub_10000C00C();
  id v1 = -[PhotosApplication px_photoLibrary]_0();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100016944;
  return sub_100016254((uint64_t)v1);
}

uint64_t sub_100016944()
{
  sub_10000C00C();
  sub_10000BF2C();
  sub_100019084();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 48) = v3;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_100016A14()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = v0[2];
  swift_bridgeObjectRetain();
  sub_100015D38(v1, v4, v2);

  uint64_t v5 = sub_1000191B4();
  return v6(v5);
}

uint64_t sub_100016AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100016B48;
  return sub_10001688C(a2, a3);
}

uint64_t sub_100016B48(uint64_t a1)
{
  sub_10000BF2C();
  uint64_t v5 = v4;
  sub_100019084();
  *uint64_t v6 = v5;
  uint64_t v7 = *v2;
  sub_100019084();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v5 + 16) = a1;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

unint64_t sub_100016C34()
{
  unint64_t result = qword_100071388;
  if (!qword_100071388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071388);
  }
  return result;
}

uint64_t sub_100016C80()
{
  return sub_100012208(qword_100071390, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
}

uint64_t sub_100016CC8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100016D5C;
  return sub_1000156F8(a1);
}

uint64_t sub_100016D5C()
{
  sub_10000C00C();
  uint64_t v3 = v2;
  sub_10000BF2C();
  uint64_t v4 = *v1;
  sub_100019084();
  void *v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_100016E30(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100019020;
  return sub_10001606C();
}

unint64_t sub_100016EC4()
{
  unint64_t result = qword_1000713A8;
  if (!qword_1000713A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000713A8);
  }
  return result;
}

unint64_t sub_100016F14()
{
  unint64_t result = qword_1000713B0;
  if (!qword_1000713B0)
  {
    sub_100007118(qword_1000713B8);
    sub_100012208((unint64_t *)&qword_100070FF8, (void (*)(uint64_t))type metadata accessor for CollectionEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000713B0);
  }
  return result;
}

uint64_t sub_100016FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001229C();
  void *v5 = v2;
  v5[1] = sub_10001706C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10001706C()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_100019084();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000BF64();
  return v3();
}

uint64_t sub_100017130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10001706C;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

void sub_1000171E8(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [objc_allocWithZone((Class)NSLock) init];
  sub_1000071E0(&qword_100071540);
  uint64_t v7 = swift_allocBox();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1000071E0(&qword_100071548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v9, a1, v10);
  sub_100007224(v9, 0, 1, v10);
  id v11 = [objc_allocWithZone((Class)UITraitCollection) init];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  *(void *)(v12 + 24) = v7;
  v15[4] = sub_100018A00;
  v15[5] = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1000176A8;
  v15[3] = &unk_1000623C8;
  unint64_t v13 = _Block_copy(v15);
  id v14 = v6;
  swift_retain();
  swift_release();
  [a2 requestPlacesAlbumCover:a3 snapshotTraitCollection:v11 completion:v13];
  _Block_release(v13);

  swift_release();
}

id sub_1000173A0(void *a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = sub_1000071E0(&qword_100071540);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000071E0(&qword_100071548);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v27 - v17;
  uint64_t v19 = swift_projectBox();
  [a5 lock];
  if ((a2 & 1) == 0)
  {
    if (a1)
    {
      swift_beginAccess();
      if (!sub_10000B91C(v19, 1, v12))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v19, v12);
        char v20 = a1;
        id v21 = UIImagePNGRepresentation(v20);
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v25 = v24;
        }
        else
        {
          uint64_t v23 = 0;
          unint64_t v25 = 0xF000000000000000;
        }
        *(void *)&long long v27 = v23;
        *((void *)&v27 + 1) = v25;
        CheckedContinuation.resume(returning:)();

        (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      }
      goto LABEL_14;
    }
    if (a4)
    {
      swift_beginAccess();
      if (!sub_10000B91C(v19, 1, v12))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v19, v12);
        *(void *)&long long v27 = a4;
        swift_errorRetain();
        CheckedContinuation.resume(throwing:)();
LABEL_11:
        (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      }
    }
    else
    {
      swift_beginAccess();
      if (!sub_10000B91C(v19, 1, v12))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v19, v12);
        long long v27 = xmmword_10004C1D0;
        CheckedContinuation.resume(returning:)();
        goto LABEL_11;
      }
    }
LABEL_14:
    sub_100007224((uint64_t)v11, 1, 1, v12);
    swift_beginAccess();
    sub_100018A20((uint64_t)v11, v19);
  }
  return [a5 unlock];
}

void sub_1000176A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v11 = a2;
  id v10 = a5;
  v9(a2, a3, a4, a5);
  swift_release();
}

void sub_100017794()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_lock];
  uint64_t v5 = v0;
  id v2 = v1;
  [v2 lock];
  uint64_t v3 = *(void *)&v5[OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail];
  unint64_t v4 = *(void *)&v5[OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail
                    + 8];
  *(_OWORD *)&v5[OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail] = xmmword_10004C1D0;
  sub_100012058(v3, v4);
  [v2 unlock];
}

id sub_10001782C()
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v0[OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail] = xmmword_10004C1D0;
  uint64_t v2 = OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_lock;
  id v3 = objc_allocWithZone((Class)NSLock);
  unint64_t v4 = v0;
  *(void *)&v0[v2] = [v3 init];

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return [super init];
}

id sub_1000178EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for PlacesAlbumThumbnailGenerator()
{
  return self;
}

ValueMetadata *type metadata accessor for CollectionQuery()
{
  return &type metadata for CollectionQuery;
}

uint64_t *sub_1000179A8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DisplayRepresentation.Image();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
    uint64_t v16 = (char *)a1 + v13;
    uint64_t v17 = (char *)a2 + v13;
    uint64_t v18 = type metadata accessor for URL();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return a1;
}

uint64_t sub_100017B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t sub_100017C08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  uint64_t v17 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t sub_100017D28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  char v14 = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t sub_100017E4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  uint64_t v17 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t sub_100017F6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for DisplayRepresentation.Image();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  uint64_t v15 = a1 + v12;
  uint64_t v16 = a2 + v12;
  uint64_t v17 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_10001808C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000180A0);
}

uint64_t sub_1000180A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for UUID();
  sub_10001906C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    type metadata accessor for DisplayRepresentation.Image();
    sub_10001906C();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = type metadata accessor for URL();
      uint64_t v12 = *(int *)(a3 + 28);
    }
    uint64_t v9 = a1 + v12;
  }

  return sub_10000B91C(v9, a2, v8);
}

uint64_t sub_100018140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018154);
}

uint64_t sub_100018154(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for UUID();
  sub_10001906C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    type metadata accessor for DisplayRepresentation.Image();
    sub_10001906C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = type metadata accessor for URL();
      uint64_t v14 = *(int *)(a4 + 28);
    }
    uint64_t v11 = a1 + v14;
  }

  return sub_100007224(v11, a2, a2, v10);
}

uint64_t sub_1000181FC()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for DisplayRepresentation.Image();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for URL();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100018308(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000071E0(&qword_100071518);
  uint64_t v10 = *(void *)(type metadata accessor for CollectionEntity() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for CollectionEntity() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_1000186F8(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100018598(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_100018534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CollectionEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018598(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for CollectionEntity() - 8);
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

uint64_t sub_1000186F8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1
    || (uint64_t result = type metadata accessor for CollectionEntity(),
        a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = type metadata accessor for CollectionEntity();
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_10001882C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(type metadata accessor for CollectionEntity() - 8) + 72) * a2,
         unint64_t v6 = a3 + v5,
         unint64_t v7 = a1 + v5,
         v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_100018944(uint64_t a1)
{
  uint64_t v2 = sub_1000071E0(&qword_100071528);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000189A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000E3E4(a1, a2);
  }
  return a1;
}

void sub_1000189B8(uint64_t a1)
{
  sub_1000171E8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000189C0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_100018A00(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1000173A0(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_100018A08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018A18()
{
  return swift_release();
}

uint64_t sub_100018A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000071E0(&qword_100071540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100018A88()
{
  unint64_t result = qword_100071550;
  if (!qword_100071550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071550);
  }
  return result;
}

uint64_t sub_100018AD4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000F5BC(a1, *(unsigned char *)(v2 + 16), *(void **)(v2 + 24), a2);
}

size_t sub_100018AF4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100018B14(a1, a2, a3, *v3);
  *unint64_t v3 = result;
  return result;
}

size_t sub_100018B14(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000071E0(&qword_100071518);
  uint64_t v10 = *(void *)(type metadata accessor for CollectionEntity() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for CollectionEntity() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_1000186F8(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001882C(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_100018CB0@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, char a3@<W2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = sub_10001237C(a1, a2, a3 & 1, a4);
  if (!v5) {
    *a5 = result;
  }
  return result;
}

uint64_t sub_100018CE0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100018CB0(a1, *(void **)(v2 + 16), *(unsigned char *)(v2 + 24), *(void **)(v2 + 32), a2);
}

unint64_t sub_100018D04()
{
  unint64_t result = qword_100071568;
  if (!qword_100071568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071568);
  }
  return result;
}

unint64_t sub_100018D50()
{
  unint64_t result = qword_1000715A8;
  if (!qword_1000715A8)
  {
    sub_10000BEA4(255, &qword_1000715A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000715A8);
  }
  return result;
}

unint64_t sub_100018DB0()
{
  unint64_t result = qword_1000715C8;
  if (!qword_1000715C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000715C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StaticAlbum(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for StaticAlbum(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100018F50);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_100018F78(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StaticAlbum()
{
  return &type metadata for StaticAlbum;
}

uint64_t sub_100018F90()
{
  return sub_10000719C(&qword_1000715D8, &qword_1000715E0);
}

unint64_t sub_100018FD0()
{
  unint64_t result = qword_1000715E8;
  if (!qword_1000715E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000715E8);
  }
  return result;
}

uint64_t sub_100019024@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100018CE0(a1, a2);
}

uint64_t sub_10001903C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100018AD4(a1, a2);
}

uint64_t sub_100019090(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_10001909C()
{
  return sub_10000B91C(v1, 1, v0);
}

uint64_t sub_1000190C4(uint64_t a1)
{
  return sub_10000B91C(v1, 1, a1);
}

uint64_t sub_1000190E4()
{
  return 0;
}

unint64_t sub_100019134()
{
  return 0xD000000000000024;
}

uint64_t sub_100019144()
{
  return v0;
}

uint64_t sub_10001915C()
{
  return v0;
}

uint64_t sub_100019174(uint64_t a1)
{
  return PXDisplayRepresentationImageForAsset(_:badgeName:)(a1, 0, 0);
}

uint64_t sub_100019190()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_1000191B4()
{
  return v0;
}

id static PhotosFeedbackFactory.makeCentralizedFeedbackActionPerformer(parentViewController:)(void *a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for PhotosFeedbackActionPerformer());
  return sub_100009A54(a1);
}

id PhotosFeedbackFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosFeedbackFactory();
  return [super init];
}

uint64_t type metadata accessor for PhotosFeedbackFactory()
{
  return self;
}

id PhotosFeedbackFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosFeedbackFactory();
  return [super dealloc];
}

uint64_t PhotosFeedbackActionPerformer.reportMemoryFeedback(type:memory:completionHandler:)()
{
  sub_10000C00C();
  v1[11] = v2;
  v1[12] = v0;
  v1[9] = v3;
  v1[10] = v4;
  v1[8] = v5;
  v1[13] = swift_getObjectType();
  sub_1000071E0(&qword_1000712E8);
  v1[14] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for FBKSEvaluation.Subject();
  v1[15] = v6;
  sub_100007AF4(v6);
  v1[16] = v7;
  v1[17] = *(void *)(v8 + 64);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  sub_10000C060();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_1000193E4()
{
  uint64_t v47 = v0;
  uint64_t v1 = (void *)qword_100072038;
  if (qword_100072038)
  {
    long long v2 = xmmword_100072028;
    sub_10000E5E4();
    sub_10000BEE0((void *)v2, *((uint64_t *)&v2 + 1), v1);
    id v3 = v1;
    char v4 = static NSObject.== infix(_:_:)();

    if (v4)
    {
      if (qword_100070E80 != -1) {
        swift_once();
      }
      uint64_t v5 = (void *)v0[9];
      uint64_t v6 = type metadata accessor for Logger();
      sub_1000074D4(v6, (uint64_t)qword_100072010);
      id v7 = v5;
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.default.getter();
      BOOL v10 = os_log_type_enabled(v8, v9);
      uint64_t v11 = (void *)v0[9];
      if (v10)
      {
        uint64_t v12 = v0[8];
        uint64_t v13 = swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315394;
        v0[5] = v12;
        type metadata accessor for PhotoGMCentralizedFeedbackType(0);
        uint64_t v14 = String.init<A>(describing:)();
        v0[6] = sub_10001AE98(v14, v15, &v46);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v13 + 12) = 2080;
        id v16 = [v11 uuid];
        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v19 = v18;

        v0[7] = sub_10001AE98(v17, v19, &v46);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping reporting feedback of type: %s for memory %s because previous request was not completed", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        sub_100007B60();
        sub_100007B60();

        swift_release();
      }
      else
      {

        swift_release();
      }

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10000BF64();
      return v45();
    }
    if (qword_100070E80 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_1000074D4(v20, (uint64_t)qword_100072010);
    id v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Ignoring previous request because feedback controller does not match", v23, 2u);
      sub_100007B60();
    }

    long long v24 = xmmword_100072028;
    unint64_t v25 = (void *)qword_100072038;
    xmmword_100072028 = 0u;
    *(_OWORD *)&qword_100072038 = 0u;
    qword_100072048 = 0;
    sub_10000BE50((void *)v24, *((uint64_t *)&v24 + 1), v25);

    swift_release();
  }
  if (qword_100070E80 != -1) {
    swift_once();
  }
  char v26 = (void *)v0[9];
  uint64_t v27 = type metadata accessor for Logger();
  sub_1000074D4(v27, (uint64_t)qword_100072010);
  id v28 = v26;
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  BOOL v31 = os_log_type_enabled(v29, v30);
  Swift::String v32 = (void *)v0[9];
  if (v31)
  {
    uint64_t v33 = v0[8];
    uint64_t v34 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 136315394;
    v0[2] = v33;
    type metadata accessor for PhotoGMCentralizedFeedbackType(0);
    uint64_t v35 = String.init<A>(describing:)();
    v0[3] = sub_10001AE98(v35, v36, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    id v37 = [v32 uuid];
    uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v40 = v39;

    v0[4] = sub_10001AE98(v38, v40, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Reporting feedback of type: %s for memory %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    sub_100007B60();
    sub_100007B60();
  }
  else
  {
  }
  uint64_t v41 = (void *)swift_task_alloc();
  v0[20] = v41;
  *uint64_t v41 = v0;
  v41[1] = sub_100019A2C;
  uint64_t v42 = v0[19];
  uint64_t v43 = v0[9];
  return sub_10001A044(v42, v43);
}

uint64_t sub_100019A2C()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_1000120C4();
  *long long v2 = v1;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_100019AF4()
{
  uint64_t v1 = (uint64_t *)(v0[12] + OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_previousMemoryUUID);
  uint64_t v2 = v1[1];
  if (v2)
  {
    uint64_t v3 = *v1;
    uint64_t v4 = (void *)v0[9];
    swift_bridgeObjectRetain();
    id v5 = [v4 uuid];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    if (v3 == v6 && v2 == v8)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        dispatch thunk of FBKEvaluationController.reset()();
      }
    }
  }
  uint64_t v12 = v0[18];
  uint64_t v11 = v0[19];
  uint64_t v14 = v0[16];
  uint64_t v13 = v0[17];
  uint64_t v15 = v0[14];
  uint64_t v16 = v0[15];
  uint64_t v17 = v0[13];
  uint64_t v36 = v0[11];
  unint64_t v18 = (void *)v0[9];
  uint64_t v34 = v0[12];
  uint64_t v35 = v0[10];
  uint64_t v19 = type metadata accessor for TaskPriority();
  sub_10001B78C(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v11, v16);
  unint64_t v20 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v21 + v20, v12, v16);
  *(void *)(v21 + ((v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8)) = v17;
  sub_100019ED4(v15, (uint64_t)&unk_100071690, v21);
  swift_release();
  id v22 = [v18 uuid];
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;

  sub_100009F68(v23, v25);
  char v26 = *(void **)(v34 + OBJC_IVAR____TtC9PhotosApp29PhotosFeedbackActionPerformer_feedbackController);
  long long v27 = xmmword_100072028;
  id v28 = (void *)qword_100072038;
  xmmword_100072028 = (unint64_t)v18;
  qword_100072038 = (uint64_t)v26;
  qword_100072040 = v35;
  qword_100072048 = v36;
  id v29 = v18;
  id v30 = v26;
  swift_retain();
  sub_10000BE50((void *)v27, *((uint64_t *)&v27 + 1), v28);
  type metadata accessor for MainActor();
  v0[21] = static MainActor.shared.getter();
  uint64_t v32 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100019DC4, v32, v31);
}

uint64_t sub_100019DC4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  sub_100011C08(v1);
  sub_10000C060();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_100019E50()
{
  sub_10000C00C();
  (*(void (**)(void, void))(v0[16] + 8))(v0[19], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000BF64();
  return v1();
}

uint64_t sub_100019ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (sub_10000B91C(a1, 1, v6) == 1)
  {
    sub_100012004(a1, &qword_1000712E8);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001A044(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = type metadata accessor for FBKSInteraction.AnnotatedContent();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for FBKSInteraction.FeatureDomain();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  sub_1000071E0(&qword_1000710E0);
  v2[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for FBKSInteraction.Content();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  sub_1000071E0(&qword_1000710E8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  sub_1000071E0(&qword_100071570);
  v2[19] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for UUID();
  v2[20] = v6;
  v2[21] = *(void *)(v6 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v7 = (void *)swift_task_alloc();
  v2[23] = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001A328;
  return sub_100009F98();
}

uint64_t sub_10001A328()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_1000120C4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000C060();
  return _swift_task_switch(v3, v4, v5);
}

id sub_10001A3F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  if (sub_10000B91C(v2, 1, v3) == 1)
  {
    uint64_t v4 = (void *)v0[3];
    sub_100012004(v2, &qword_100071570);
    sub_1000071E0(&qword_1000710F0);
    uint64_t v5 = (int *)(sub_1000071E0(&qword_1000710F8) - 8);
    unint64_t v6 = (*(unsigned __int8 *)(*(void *)v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_10004BE80;
    unint64_t v8 = v7 + v6;
    uint64_t v9 = v5[14];
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    FBKSForm.Question.init(stringValue:)();
    sub_1000071E0(&qword_100071100);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10004BE80;
    id v11 = [v4 localIdentifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;

    *(void *)(v10 + 32) = v12;
    *(void *)(v10 + 40) = v14;
    *(void *)(v8 + v9) = v10;
    type metadata accessor for FBKSForm.Question();
    sub_1000071E0(&qword_100071108);
    sub_10001B73C();
    Dictionary.init(dictionaryLiteral:)();
    uint64_t v15 = static NonInternalDiagnosticsGenerator.retrievePrompt(for:)();
    uint64_t v17 = v16;
    id result = [v4 photoLibrary];
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v19 = result;
    unint64_t v20 = (void *)v1[3];
    type metadata accessor for PhotosGenerativeStoryFactory();
    uint64_t v21 = (UIImage *)sub_10000D018(v20, v19);

    uint64_t v63 = v17;
    uint64_t v64 = v15;
    if (v21)
    {
      id v22 = UIImagePNGRepresentation(v21);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = (uint64_t *)v1[14];
        uint64_t v26 = v1[11];
        uint64_t v25 = v1[12];
        uint64_t v27 = v1[10];
        uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v30 = v29;

        uint64_t *v24 = v28;
        v24[1] = v30;
        (*(void (**)(uint64_t *, void, uint64_t))(v25 + 104))(v24, enum case for FBKSInteraction.Content.image(_:), v26);
        uint64_t v31 = enum case for FBKSInteraction.AnnotatedContent.IconType.text(_:);
        uint64_t v32 = type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
        sub_1000120D4();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 104))(v27, v31, v32);
        sub_100007224(v27, 0, 1, v32);
        sub_10000E3E4(v28, v30);
        FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();

        sub_10000E43C(v28, v30);
        uint64_t v34 = 0;
LABEL_9:
        unint64_t v40 = v1 + 18;
        uint64_t v60 = v1[16];
        uint64_t v61 = v1[18];
        uint64_t v62 = v1[15];
        uint64_t v59 = v1[17];
        uint64_t v42 = v1[12];
        uint64_t v41 = (uint64_t *)v1[13];
        uint64_t v43 = v1[11];
        uint64_t v45 = v1[8];
        uint64_t v44 = v1[9];
        uint64_t v46 = v1[7];
        uint64_t v47 = v1[4];
        sub_100007224(v61, v34, 1, v47);
        (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v44, enum case for FBKSInteraction.FeatureDomain.memoryCreation(_:), v46);
        *uint64_t v41 = v64;
        v41[1] = v63;
        (*(void (**)(uint64_t *, void, uint64_t))(v42 + 104))(v41, enum case for FBKSInteraction.Content.text(_:), v43);
        uint64_t v48 = type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
        sub_10001B78C(v48);
        FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
        sub_100007224(v59, 0, 1, v47);
        sub_100007224(v60, 1, 1, v47);
        id v49 = objc_allocWithZone((Class)type metadata accessor for FBKSInteraction());
        sub_10000C060();
        uint64_t v50 = FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)();
        sub_100011F9C(v61, v62);
        if (sub_10000B91C(v62, 1, v47) == 1)
        {
          sub_100012004(*v40, &qword_1000710E8);
          unint64_t v40 = v1 + 15;
        }
        else
        {
          uint64_t v51 = v1[16];
          uint64_t v53 = v1[5];
          uint64_t v52 = v1[6];
          uint64_t v54 = v1[4];
          (*(void (**)(uint64_t, void, uint64_t))(v53 + 32))(v52, v1[15], v54);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v51, v52, v54);
          sub_100007224(v51, 0, 1, v54);
          dispatch thunk of FBKSInteraction.generatedAnnotatedContent.setter();
          (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
        }
        id v55 = (uint64_t *)v1[2];
        sub_100012004(*v40, &qword_1000710E8);
        *id v55 = v50;
        uint64_t v56 = enum case for FBKSEvaluation.Subject.interaction(_:);
        type metadata accessor for FBKSEvaluation.Subject();
        sub_1000120D4();
        (*(void (**)(uint64_t *, uint64_t))(v57 + 104))(v55, v56);
        goto LABEL_13;
      }
    }
    uint64_t v34 = 1;
    goto LABEL_9;
  }
  uint64_t v35 = v0[22];
  uint64_t v36 = v0[2];
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[21] + 32);
  v37(v35, v2, v3);
  v37(v36, v35, v3);
  uint64_t v38 = enum case for FBKSEvaluation.Subject.id(_:);
  type metadata accessor for FBKSEvaluation.Subject();
  sub_1000120D4();
  (*(void (**)(uint64_t, uint64_t))(v39 + 104))(v36, v38);
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v58 = (uint64_t (*)(void))v1[1];
  return (id)v58();
}

uint64_t sub_10001AB20()
{
  uint64_t v1 = type metadata accessor for FBKSEvaluation.Subject();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10001ABF8()
{
  uint64_t v1 = type metadata accessor for FBKSEvaluation.Subject();
  sub_100007AF4(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100011E78;
  return sub_100011864();
}

uint64_t sub_10001ACF8(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10001ADD4;
  return v6(a1);
}

uint64_t sub_10001ADD4()
{
  sub_10000C00C();
  sub_10000BF2C();
  uint64_t v1 = *v0;
  sub_1000120C4();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000BF64();
  return v3();
}

uint64_t sub_10001AE98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  sub_10000C060();
  uint64_t v9 = sub_10001AF68(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    ObjectType = (void *)swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_10000BC9C((uint64_t)v15, *a3);
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
      sub_10000BC9C((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000BDAC((uint64_t)v15);
  return v10;
}

uint64_t sub_10001AF68(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10001B0C0((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = (uint64_t)sub_10001B198(a5, a6);
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

void *sub_10001B0C0(char *__src, size_t __n, char *__dst)
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

void *sub_10001B198(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10001B230(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001B40C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001B40C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10001B230(uint64_t a1, unint64_t a2)
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
  unint64_t v3 = sub_10001B3A4(v2, 0);
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

void *sub_10001B3A4(uint64_t a1, uint64_t a2)
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
  sub_1000071E0(&qword_100071698);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10001B40C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000071E0(&qword_100071698);
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
    sub_10001B5BC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001B4E4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10001B4E4(char *__src, size_t __n, char *__dst)
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

char *sub_10001B5BC(char *__src, size_t __len, char *__dst)
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

uint64_t sub_10001B64C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B684(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100011E78;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000716A0 + dword_1000716A0);
  return v6(a1, v4);
}

unint64_t sub_10001B73C()
{
  unint64_t result = qword_100071110;
  if (!qword_100071110)
  {
    type metadata accessor for FBKSForm.Question();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100071110);
  }
  return result;
}

uint64_t sub_10001B78C(uint64_t a1)
{
  return sub_100007224(v1, 1, 1, a1);
}

uint64_t sub_10001B7AC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10001BE68(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) actionPerformerForActionType:a2];
  [v2 performActionWithCompletionHandler:0];
}

void sub_10001BF3C(id a1)
{
}

void sub_10001C910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C93C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = PLSharingGetLog();
  int64_t v7 = v6;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v8;
      int64_t v9 = "Did open iCloud Link with UUID: %{public}@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543874;
    uint64_t v15 = v13;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    __int16 v18 = 2112;
    id v19 = v5;
    int64_t v9 = "Failed to open iCloud Link with UUID: %{public}@, result: %li, error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 32;
    goto LABEL_6;
  }
}

void sub_10001CA60(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _openMomentShareWithURL:*(void *)(a1 + 32)];
  }
}

void sub_10001CCE0(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  uint64_t v8 = a4;
  int64_t v9 = PLUIGetLog();
  uint64_t v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Item provider import suceeded.", buf, 2u);
    }

    if (v8)
    {
      uint64_t v10 = v8[2](v8);
    }
    else
    {
      uint64_t v10 = 0;
    }
    os_log_type_t v11 = [v10 lastObject];
    uint32_t v12 = [v11 uuid];

    if (v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) stringByAppendingFormat:@"&revealassetuuid=%@", v12];
      int v14 = *(void **)(a1 + 40);
      uint64_t v15 = +[NSURL URLWithString:v13];
      [v14 openRoutingURL:v15];
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to import item providers (error: %@)", buf, 0xCu);
  }
}

void sub_10001CFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001CFFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleFetchedMomentShare:v7 forURL:*(void *)(a1 + 32) error:v6];
}

void sub_10001D2D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = PLSharedLibraryGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      int64_t v9 = "Did open Shared Library invitation with URL: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    int64_t v9 = "Failed to open Shared Library invitation with URL: %@, error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

void sub_10001D704(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) publicDescription];
    int v16 = 138413058;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = a2;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "OpenRoutingURL completion handler for %@ (%{public}@): result=%ti error=%@", (uint8_t *)&v16, 0x2Au);
  }
  if (a2 == 1)
  {
    int64_t v9 = [*(id *)(a1 + 40) libraryViewMode];
    if (v9)
    {
      uint64_t v10 = -[PhotosApplication px_photoLibrary]_0();
      os_log_type_t v11 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v10];
      if ([v11 hasSharedLibraryOrPreview]) {
        id v12 = [v9 integerValue];
      }
      else {
        id v12 = 0;
      }
      uint64_t v15 = [*(id *)(a1 + 48) libraryFilterState];
      [v15 setViewMode:v12];
    }
    if ([*(id *)(a1 + 40) assetCollectionSubtype] == (id)1000000201) {
      +[PLUserActivityDaemonJob userDidViewSharedLibraryParticipantAssetTrashNotification];
    }
  }
  else
  {
    int64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = [*(id *)(a1 + 40) publicDescription];
      int v16 = 138413058;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to programmatically navigate to %@ (%{public}@): result=%ti error=%@", (uint8_t *)&v16, 0x2Au);
    }
  }
}

void sub_10001D9F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = PLUIGetLog();
  uint64_t v7 = v6;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) publicDescription];
      int v10 = 138543362;
      os_log_type_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Retry succeeeded to programmatically navigate to %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int64_t v9 = [*(id *)(a1 + 32) publicDescription];
    int v10 = 138543874;
    os_log_type_t v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Retry failed to programmatically navigate to %{public}@: result=%ti error=%@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_10001DDBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 != 1)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 32) publicDescription];
      int v8 = 138543874;
      int64_t v9 = v7;
      __int16 v10 = 2048;
      uint64_t v11 = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "failed to programmatically navigate to %{public}@: result=%ti error=%@", (uint8_t *)&v8, 0x20u);
    }
  }
}

void sub_10001E210(id a1)
{
  uint64_t v1 = PLAppIntentsGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Perform deferred presentation of PXRetailExperienceManager", v3, 2u);
  }

  id v2 = objc_alloc_init((Class)PXRetailExperienceManager);
  [v2 presentRetailExperienceView];
}

void sub_10001EC88(id a1, BOOL a2, NSError *a3)
{
  uint64_t v3 = a3;
  if (v3)
  {
    unint64_t v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "+[PhotosWindowSceneDelegate _showContactsPromptIfNecessary]_block_invoke";
      __int16 v7 = 2112;
      int v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Error requesting contacts access: %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_10001F618(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = PXPeopleErrorKey;
  id v6 = a2;
  id v7 = [a3 objectForKeyedSubscript:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001F6A4(id a1, id a2)
{
}

void sub_10001F890(uint64_t a1)
{
  id v2 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithURL:*(void *)(a1 + 32)];
  if ([v2 type])
  {
    uint64_t v3 = [*(id *)(a1 + 40) keyRootViewController];
    if (!v3)
    {
      int v8 = +[NSAssertionHandler currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"PhotosApplication.m", 974, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
    }
    if ([v3 routingOptionsForDestination:v2])
    {
      unint64_t v4 = PLAppIntentsGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will perform App Intents URL navigation request", buf, 2u);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001FB48;
      v9[3] = &unk_100062880;
      id v10 = *(id *)(a1 + 48);
      [v3 navigateToDestination:v2 options:0 completionHandler:v9];
      uint64_t v5 = v10;
    }
    else
    {
      uint64_t v5 = +[NSError px_genericErrorWithDebugDescription:@"No routing options for destination"];
      id v7 = PLAppIntentsGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to perform App Intents URL navigation request: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v3 = +[NSError px_genericErrorWithDebugDescription:@"No matching destination for URL"];
    id v6 = PLAppIntentsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to perform App Intents URL navigation request: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10001FB48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = PLAppIntentsGetLog();
  id v7 = v6;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      int v8 = "Did perform App Intents URL navigation request";
      int64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    id v13 = v5;
    int v8 = "Failed to perform App Intents URL navigation request: %@";
    int64_t v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 1);
}

void sub_10001FFAC(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained _nebulaDaemonProxyManager];

  if (!v4)
  {
    uint64_t v9 = 0;
    os_log_type_t v10 = &v9;
    uint64_t v11 = 0x2050000000;
    id v5 = (void *)qword_100073348;
    uint64_t v12 = qword_100073348;
    if (!qword_100073348)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000200E0;
      v8[3] = &unk_1000643A0;
      void v8[4] = &v9;
      sub_1000200E0((uint64_t)v8);
      id v5 = (void *)v10[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v9, 8);
    id v4 = objc_alloc_init(v6);
    id v7 = objc_loadWeakRetained(v2);
    [v7 _setNebulaDaemonProxyManager:v4];
  }
  [v4 performCrashRecoveryIfNeededForceEndLastTimelapseSession:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1000200C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000200E0(uint64_t a1)
{
  v8[0] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v2 = qword_100073350;
  uint64_t v14 = qword_100073350;
  if (!qword_100073350)
  {
    v8[1] = _NSConcreteStackBlock;
    v8[2] = (void *)3221225472;
    v8[3] = sub_100020330;
    void v8[4] = &unk_100062960;
    uint64_t v9 = &v11;
    os_log_type_t v10 = v8;
    long long v15 = off_100062948;
    v12[3] = _sl_dlopen();
    qword_100073350 = *(void *)(v9[1] + 24);
    uint64_t v2 = v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v2)
  {
    id v4 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"void *CameraUILibrary(void)"];
    [v4 handleFailureInFunction:v5 file:@"PhotosApplication.m" lineNumber:116 description:@"%s" v8[0]];

    goto LABEL_10;
  }
  if (v8[0]) {
    free(v8[0]);
  }
  Class result = objc_getClass("CAMNebulaDaemonProxyManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v6 = +[NSAssertionHandler currentHandler];
    id v7 = +[NSString stringWithUTF8String:"Class getCAMNebulaDaemonProxyManagerClass(void)_block_invoke"];
    [v6 handleFailureInFunction:v7 file:@"PhotosApplication.m" lineNumber:117 description:@"Unable to find class %s" @"CAMNebulaDaemonProxyManager"];

LABEL_10:
    __break(1u);
  }
  qword_100073348 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100020310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020330(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100073350 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000203C0(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.nebulad-access-queue", v3);
  uint64_t v2 = (void *)qword_100073328;
  qword_100073328 = (uint64_t)v1;
}

void sub_100020F94(uint64_t a1)
{
  +[PXSystemNavigation navigateToDestination:5 completion:0];
  uint64_t v3 = *(void **)(a1 + 32);
  unint64_t v2 = *(void *)(a1 + 40);

  sub_100020FEC(1, v2, v3);
}

void sub_100020FE0(uint64_t a1)
{
}

void sub_100020FEC(int a1, unint64_t a2, void *a3)
{
  if ((uint64_t)a2 >= 1)
  {
    CFStringRef v3 = @"com.apple.photos.CPAnalytics.exitPrompt30DaysStorageCanceled";
    CFStringRef v4 = @"com.apple.photos.CPAnalytics.exitPrompt1DayStorageCanceled";
    if (a2 > 1) {
      CFStringRef v4 = @"com.apple.photos.CPAnalytics.exitPrompt7DaysStorageCanceled";
    }
    if (a2 <= 7) {
      CFStringRef v3 = v4;
    }
    CFStringRef v5 = @"com.apple.photos.CPAnalytics.exitPrompt7DaysStorageSettingsSelected";
    if (a2 <= 1) {
      CFStringRef v5 = @"com.apple.photos.CPAnalytics.exitPrompt1DayStorageSettingsSelected";
    }
    if (a2 > 7) {
      CFStringRef v5 = @"com.apple.photos.CPAnalytics.exitPrompt30DaysStorageSettingsSelected";
    }
    if (a1) {
      CFStringRef v6 = v5;
    }
    else {
      CFStringRef v6 = v3;
    }
    uint64_t v9 = CPAnalyticsPayloadClassNameKey;
    os_log_type_t v10 = a3;
    id v7 = a3;
    int v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    +[CPAnalytics sendEvent:v6 withPayload:v8];
  }
}

void sub_100021318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class sub_100021338(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100073340)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_100021524;
    v6[4] = &unk_100062DF0;
    v6[5] = v6;
    long long v7 = off_100062930;
    uint64_t v8 = 0;
    qword_100073340 = _sl_dlopen();
  }
  if (!qword_100073340)
  {
    CFStringRef v3 = +[NSAssertionHandler currentHandler];
    CFStringRef v4 = +[NSString stringWithUTF8String:"void *PreferencesLibrary(void)"];
    [v3 handleFailureInFunction:v4 file:@"PhotosApplication.m" lineNumber:120 description:@"%s" v6[0]];

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PSOAuthAccountRedirectURLController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    CFStringRef v3 = +[NSAssertionHandler currentHandler];
    CFStringRef v5 = +[NSString stringWithUTF8String:"Class getPSOAuthAccountRedirectURLControllerClass(void)_block_invoke"];
    [v3 handleFailureInFunction:v5 file:@"PhotosApplication.m" lineNumber:121 description:@"Unable to find class %s" PSOAuthAccountRedirectURLController];

LABEL_10:
    __break(1u);
  }
  qword_100073338 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100021524()
{
  uint64_t result = _sl_dlopen();
  qword_100073340 = result;
  return result;
}

void sub_100021970(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) undoActionsInvalidator];

  if (!v2)
  {
    CFStringRef v3 = [*(id *)(a1 + 32) applicationScene];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }

    CFStringRef v5 = [v4 keyWindow];
    CFStringRef v6 = [v5 undoManager];
    if (v6)
    {
      long long v7 = +[PXContentPrivacyController privacyControllerForCollection:*(void *)(a1 + 40)];
      id v8 = [objc_alloc((Class)PXUndoActionsInvalidator) initWithUndoManager:v6 privacyController:v7];
      [*(id *)(a1 + 32) setUndoActionsInvalidator:v8];

      uint64_t v9 = [*(id *)(a1 + 32) undoActionsInvalidator];
      [v9 beginObservingSystemEventsForAutomaticInvalidation];
    }
    else
    {
      os_log_type_t v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[UndoActionsInvalidator] Unable to get an undo manager for the key window.", v11, 2u);
      }
    }
  }
}

void sub_100021D24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

uint64_t sub_100021D44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021D54(uint64_t a1)
{
}

void sub_100021D5C(uint64_t a1)
{
  id v5 = +[UIApplication pu_debugCurrentAsset];
  uint64_t v2 = [v5 uuid];
  CFStringRef v3 = (void *)v2;
  if (v2) {
    id v4 = (__CFString *)v2;
  }
  else {
    id v4 = @"<none>";
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);
}

void sub_100022038(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    CFStringRef v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      long long v7 = "User granted authorization for user notifications";
LABEL_9:
      uint64_t v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = PLUIGetLog();
    CFStringRef v6 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v5;
        long long v7 = "Error requesting authorization for user notifications: %@";
        uint64_t v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v9, v10, v7, (uint8_t *)&v13, v11);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      long long v7 = "User did not grant authorization for user notifications";
      goto LABEL_9;
    }
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v12);
}

void sub_100022170(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v36 = a1;
  id v37 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  uint64_t v34 = v5;
  id v57 = v5;
  long long v7 = +[NSArray arrayWithObjects:&v57 count:1];
  uint64_t v33 = (void *)v6;
  id v8 = +[PHCloudSharedAlbum fetchCloudSharedAlbumsWithGUIDs:v7 options:v6];
  uint64_t v9 = [v8 firstObject];

  uint64_t v35 = v9;
  [v9 invitationRecords];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v15 = [v14 invitationState];
        unsigned int v16 = [v15 intValue];

        if (v16 == 1)
        {
          uint64_t v17 = [v14 inviteePhones];
          __int16 v18 = +[NSSet setWithArray:v17];

          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v19 = v37;
          id v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v48;
            while (2)
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v48 != v22) {
                  objc_enumerationMutation(v19);
                }
                if ([v18 containsObject:*(void *)(*((void *)&v47 + 1) + 8 * (void)j)])
                {
                  uint64_t v24 = *(void **)(v36 + 32);
                  v44[0] = _NSConcreteStackBlock;
                  v44[1] = 3221225472;
                  v44[2] = sub_10002264C;
                  v44[3] = &unk_100064710;
                  id v45 = v35;
                  uint64_t v46 = v14;
                  v43[0] = _NSConcreteStackBlock;
                  v43[1] = 3221225472;
                  v43[2] = sub_1000226F8;
                  v43[3] = &unk_1000642D8;
                  v43[4] = v14;
                  [v24 performChanges:v44 completionHandler:v43];

                  goto LABEL_17;
                }
              }
              id v21 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
              if (v21) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v11);
  }
  if ((unint64_t)[v37 count] < 2)
  {
    uint64_t v25 = PLLocalizedFrameworkString();
    uint64_t v26 = PLLocalizedFrameworkString();
    uint64_t v27 = v35;
    uint64_t v28 = [v35 localizedTitle];
    PFStringWithValidatedFormat();
  }
  else
  {
    uint64_t v25 = PLLocalizedFrameworkString();
    uint64_t v26 = PLLocalizedFrameworkString();
    uint64_t v27 = v35;
    uint64_t v28 = [v35 localizedTitle];
    PFLocalizedStringWithValidatedFormat();
  unint64_t v29 = };

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022848;
  block[3] = &unk_100062CF8;
  block[4] = *(void *)(v36 + 40);
  id v40 = v25;
  id v41 = v29;
  id v42 = v27;
  id v30 = v27;
  id v31 = v29;
  id v32 = v25;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10002264C(uint64_t a1)
{
  uint64_t v2 = +[PHCloudSharedAlbumChangeRequest changeRequestForCloudSharedAlbum:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 40);
  CFStringRef v3 = +[NSArray arrayWithObjects:&v4 count:1];
  [v2 setInvitationStateLocalForInvitationRecords:v3 invitationStateLocal:&off_100068188];
}

void sub_1000226F8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v7;
      id v8 = "Succeeded setting failure state on invitation record %{public}@.";
LABEL_9:
      id v11 = v6;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = PLUIGetLog();
    BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v14 = 138543618;
        uint64_t v15 = v10;
        __int16 v16 = 2112;
        id v17 = v5;
        id v8 = "Failed to set failure state on invitation record %{public}@. Error: %@";
        id v11 = v6;
        uint32_t v12 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v12);
      }
    }
    else if (v9)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v13;
      id v8 = "Failed to set failure state on invitation record %{public}@.";
      goto LABEL_9;
    }
  }
}

void sub_100022848(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) px_firstKeyWindow];
  CFStringRef v3 = +[UIAlertController alertControllerWithTitle:*(void *)(a1 + 40) message:*(void *)(a1 + 48) preferredStyle:1];
  uint64_t v4 = PLLocalizedFrameworkString();
  id v5 = +[UIAlertAction actionWithTitle:v4 style:1 handler:0];
  [v3 addAction:v5];

  uint64_t v6 = [v2 rootViewController];
  uint64_t v7 = [v6 presentedViewController];

  if (!v7)
  {
    id v8 = PLLocalizedFrameworkString();
    uint32_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    int v14 = sub_1000229E4;
    uint64_t v15 = &unk_100062798;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v16 = v9;
    uint64_t v17 = v10;
    id v11 = +[UIAlertAction actionWithTitle:v8 style:0 handler:&v12];
    [v3 addAction:v11, v12, v13, v14, v15];
  }
  [v2 pl_presentViewController:v3 animated:1];
}

void sub_1000229E4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  +[NSString stringWithFormat:@"photos://album?uuid=%@&show-options=true", v2];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  CFStringRef v3 = +[NSURL URLWithString:v4];
  [*(id *)(a1 + 40) navigateToURLDestination:v3 completionHandler:&stru_100062770];
}

void sub_100022A90(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (!a2)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to navigate to shared album details with error %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100022BD4(id a1)
{
  id v1 = +[PXPreloadScheduler sharedScheduler];
  [v1 scheduleDeferredTaskWithQoS:2 block:&stru_100062750];
}

void sub_100022C28(id a1)
{
}

void sub_100022C34(uint64_t a1)
{
  v9[5] = _NSConcreteStackBlock;
  v9[6] = 3221225472;
  v9[7] = sub_100022E50;
  v9[8] = &unk_1000626F0;
  uint64_t v2 = *(void *)(a1 + 40);
  v9[9] = *(void *)(a1 + 32);
  v9[10] = v2;
  PLDisableCPLIfExited();
  PXLemonadeAppearanceConfigureIfNeeded();
  +[PXRemoteDiagnosticsService startServerOnInternalDevicesWithAgentClass:objc_opt_class()];
  +[PURootSettings setupStatusBarInternalSettingsGestureOnInternalDevices];
  CFStringRef v3 = +[PXMediaTypeInfoManager sharedManager];
  [v3 prepareInformationForLookups];

  id v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleDeferredTaskWithQoS:1 block:&stru_100062710];

  id v5 = +[PXPreloadScheduler sharedScheduler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022EC0;
  v9[3] = &unk_1000646C0;
  void v9[4] = *(void *)(a1 + 32);
  [v5 scheduleDeferredTaskWithQoS:2 block:v9];

  int v6 = [*(id *)(a1 + 32) undoActionsInvalidator];

  if (!v6)
  {
    uint64_t v7 = +[PXPreloadScheduler sharedScheduler];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022EEC;
    v8[3] = &unk_1000646C0;
    void v8[4] = *(void *)(a1 + 32);
    [v7 scheduleDeferredTaskWithQoS:2 block:v8];
  }
}

id sub_100022E0C(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) applicationState] == 0;
  CFStringRef v3 = *(void **)(a1 + 32);

  return _[v3 performNebuladCrashRecoveryIfNeededForceEndLastTimelapseSession:v2];
}

uint64_t sub_100022E50()
{
  return px_dispatch_on_main_queue();
}

id sub_100022EC0()
{
  uint64_t v0 = objc_opt_class();

  return _[v0 _donateTipsAppPhotosSignals];
}

id sub_100022EEC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _beginUndoActionsInvalidator];
}

void sub_100022EF4(id a1)
{
  id v1 = +[CPAnalytics activateEventQueue];

  _PNUserDefaultPhotosAppFinishedLaunching(v1);
}

id sub_100022F24(uint64_t a1)
{
  [*(id *)(a1 + 32) _showCloudPhotoLibraryExitPromptIfNecessary];
  [*(id *)(a1 + 32) _showSyncReminderPromptIfNecessary];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023080;
  v5[3] = &unk_1000626A0;
  v5[4] = *(void *)(a1 + 32);
  +[PXUserPromptCoordinator schedulePromptWithIdentifier:@"WelcomeView" action:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002308C;
  v4[3] = &unk_1000626A0;
  v4[4] = *(void *)(a1 + 32);
  +[PXUserPromptCoordinator schedulePromptWithIdentifier:@"AppleMusic" action:v4];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023098;
  v3[3] = &unk_1000626A0;
  v3[4] = *(void *)(a1 + 32);
  +[PXUserPromptCoordinator schedulePromptWithIdentifier:@"UserNotifications" action:v3];
  return +[PXCloudQuotaUpsellSheetManager presentUpsellSheetIfNecessaryWithActivationOptions:*(void *)(a1 + 40)];
}

id sub_100023080(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _showWelcomeViewControllersIfNecessaryWithCompletion:a2];
}

id sub_10002308C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _showAppleMusicPromptsIfNecessaryWithCompletion:a2];
}

id sub_100023098(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _showUserNotificationsPromptIfNecessaryWithCompletion:a2];
}

id sub_1000230A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) synchronizeWithCompletionHandler:&stru_100062658];
}

id sub_1000230B4(uint64_t a1)
{
  PXAsynchronousAddDragAndDropFileProviderDomain();
  PXAsynchronousAddBoopFileProviderDomain();
  +[PXNetworkStatusMonitor sharedInstance];

  BOOL v2 = *(void **)(a1 + 32);

  return [v2 updateShowHiddenAlbumCachedValue];
}

void sub_100023104(uint64_t a1)
{
  BOOL v2 = PXPhotosApplicationURLToOpenWhenLaunchedForTesting();
  CFStringRef v3 = v2;
  if (v2)
  {
    id v4 = [v2 absoluteString];
    unsigned int v5 = [v4 hasPrefix:@"photos://shelf?"];

    if (v5)
    {
      dispatch_time_t v6 = dispatch_time(0, 5000000000);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100023218;
      v8[3] = &unk_100064710;
      void v8[4] = *(void *)(a1 + 32);
      id v9 = v3;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) photosWindowSceneDelegate];
      [v7 openRoutingURL:v3];
    }
  }
}

void sub_100023218(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photosWindowSceneDelegate];
  [v2 openRoutingURL:*(void *)(a1 + 40)];
}

void sub_10002326C(id a1)
{
  id v1 = +[PhotosAppShortcutsProviderWrapper updateAppShortcutParameters];

  _PXPreferencesEnsureDefaultEnhancedVisualSearch(v1);
}

id sub_100025794(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = PXLocalizedString();
    unsigned int v5 = +[UIKeyCommand commandWithTitle:v4 image:0 action:"deselectAll:" input:@"a" modifierFlags:1572864 propertyList:0];
    id v6 = [v3 arrayByAddingObject:v5];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

id sub_100025870(uint64_t a1)
{
  id v2 = PXFilter();
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v3 = PXLocalizedString();
    id v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"find:" input:@"f" modifierFlags:0x100000 propertyList:0];
    id v5 = [v2 arrayByAddingObject:v4];
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

BOOL sub_100025960(id a1, UIMenuElement *a2)
{
  id v2 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v2;

    if (!v3)
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
    id v4 = [(UIMenuElement *)v3 input];
    if ([v4 isEqualToString:@"e"]) {
      BOOL v5 = [(UIMenuElement *)v3 modifierFlags] != (id)0x100000;
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    id v3 = 0;
    BOOL v5 = 1;
    id v4 = v2;
  }

LABEL_8:
  return v5;
}

BOOL sub_100025A20(id a1, SEL a2, NSArray *a3)
{
  return PXExists() ^ 1;
}

BOOL sub_100025A94(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0) {
    BOOL v5 = [v3 action] == *(id *)(a1 + 32);
  }

  return v5;
}

void sub_100025B70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  BOOL v5 = [v4 librarySpecificFetchOptions];

  [v5 setIncludeAllPhotosSmartAlbum:1];
  id v6 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:1000000205 options:v5];
  uint64_t v7 = [v6 firstObject];

  id v8 = +[PHAsset fetchAssetsInAssetCollection:v7 options:v5];
  id v9 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAssets:v8];
  id v10 = [objc_alloc((Class)PXSectionedSelectionManager) initWithDataSourceManager:v9];
  [v10 performChanges:&stru_100064480];
  id v11 = [objc_alloc((Class)PXPhotoKitAssetActionManager) initWithSelectionManager:v10];
  uint32_t v12 = [v11 actionPerformerForActionType:PXAssetActionTypeShare];
  uint64_t v13 = +[PXViewControllerPresenter defaultPresenterWithViewController:v3];

  [v12 setPresentationEnvironment:v13];
  [*(id *)(a1 + 32) startedCurrentTest];
  [v12 performActionWithCompletionHandler:0];
  dispatch_time_t v14 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025D78;
  block[3] = &unk_1000646C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100025D78(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100025D80(id a1, PXMutableSelectionManager *a2)
{
}

void sub_100025F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_100025F84(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100025FB0(uint64_t a1)
{
}

void sub_100025FB8(void *a1, int a2, unint64_t a3)
{
  if (a1[6] <= a3)
  {
    BOOL v5 = (void *)a1[4];
    if (a2)
    {
      [v5 finishedCurrentTest];
    }
    else
    {
      [v5 failedCurrentTest];
    }
  }
  else if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002630C;
    block[3] = &unk_1000643A0;
    block[4] = a1[5];
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_1000260B0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026154;
  v6[3] = &unk_100064418;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _runImportTestCommonInit:v3 navigateToImportTab:1 completionHandler:v6];
}

void sub_100026154(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026254;
    block[3] = &unk_100063A50;
    id v11 = v5;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v12 = v7;
    uint64_t v13 = v8;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    (*(void (**)(void))(v9 + 16))();
  }
}

void sub_100026254(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000262E8;
  v5[3] = &unk_1000643F0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 ppt_removeImportDataSourceWithOptions:0 completionHandler:v5];
}

uint64_t sub_1000262E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t sub_10002630C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

id sub_1000263CC(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100026468;
    v6[3] = &unk_100062CA8;
    uint64_t v3 = *(void *)(a1 + 32);
    void v6[4] = *(void *)(a1 + 40);
    return [a3 ppt_performThumbnailWithOptions:v3 completionHandler:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 failedCurrentTest];
  }
}

id sub_100026468(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishedCurrentTestWithExtraResults:];
  }
  else {
    return [v2 failedCurrentTestWithFailure:@"Thumbnailing failed"];
  }
}

id sub_100026528(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000265C4;
    v6[3] = &unk_100062CA8;
    uint64_t v3 = *(void *)(a1 + 32);
    void v6[4] = *(void *)(a1 + 40);
    return [a3 ppt_performImportToLibraryWithOptions:v3 completionHandler:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 failedCurrentTest];
  }
}

id sub_1000265C4(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishedCurrentTestWithExtraResults:];
  }
  else {
    return [v2 failedCurrentTestWithFailure:@"Import to library all failed"];
  }
}

id sub_100026684(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100026720;
    v6[3] = &unk_100062CA8;
    uint64_t v3 = *(void *)(a1 + 32);
    void v6[4] = *(void *)(a1 + 40);
    return [a3 ppt_performDeleteWithOptions:v3 completionHandler:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 failedCurrentTest];
  }
}

id sub_100026720(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishedCurrentTestWithExtraResults:];
  }
  else {
    return [v2 failedCurrentTestWithFailure:@"Delete all failed"];
  }
}

void sub_1000267D0(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = [a3 additionalResults];
  id v6 = *(void **)(a1 + 32);
  id v7 = (id)v5;
  if (a2) {
    [v6 finishedCurrentTestWithExtraResults:v5];
  }
  else {
    [v6 failedCurrentTestWithFailure:@"Content loading failed"];
  }
}

id *sub_1000269E4(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] failedCurrentTestWithFailure:@"Missing import test content"];
  }
  id v2 = (uint64_t (**)(id, uint64_t, id))result[6];
  if (v2) {
    return (id *)v2[2](result[6], 1, result[5]);
  }
  return result;
}

void sub_100026B94(uint64_t a1)
{
  id v2 = objc_alloc((Class)PXDisplayAssetViewPPTPerformer);
  uint64_t v3 = [*(id *)(a1 + 32) view];
  id v4 = [v2 initWithContainerView:v3 delegate:*(void *)(a1 + 40) testOptions:*(void *)(a1 + 48)];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026C78;
  v7[3] = &unk_1000642D8;
  id v8 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, uint64_t, void *))(v5 + 16))(v5, v4, v6, v7);
}

void sub_100026C78(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "asset view test failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_100026D54(id a1, PXDisplayAssetViewPPTPerformer *a2, NSArray *a3, id a4)
{
}

void sub_100026D68(id a1, PXDisplayAssetViewPPTPerformer *a2, NSArray *a3, id a4)
{
}

void sub_100026E9C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026F74;
  v8[3] = &unk_100064228;
  void v8[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 _navigateToStoryFeedWithConfiguration:a2 completion:v8];
}

void sub_100026F74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027078;
    v9[3] = &unk_100064328;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    id v12 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, id, void *))(v5 + 16))(v5, v6, v7, v9);
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Unable to navigate to feed."];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100027078(uint64_t a1, char a2)
{
  id v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027128;
  v6[3] = &unk_100064120;
  void v6[4] = v3;
  id v7 = *(id *)(a1 + 48);
  char v8 = a2;
  id v5 = v4;
  [v3 _dismissStoryFeed:v5 completion:v6];
}

id sub_100027128(uint64_t a1, char a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
  else {
    return [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Unable to dismiss feed."];
  }
}

void sub_100027160(id a1, PXStoryPPTPerformer *a2, PXFeedTestElement *a3, id a4)
{
}

void sub_100027250(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [objc_alloc((Class)PXMockExtendedTraitCollection) initWithFormFactor:4 orientation:1 visibleChromeElements:0];
  id v8 = [objc_alloc((Class)PXStoryViewConfiguration) initWithConfiguration:v6 extendedTraitCollection:v7];

  uint64_t v11 = a1 + 32;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v11 + 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002736C;
  v14[3] = &unk_100064198;
  id v15 = v5;
  id v12 = *(void (**)(uint64_t, uint64_t, id, void *))(v10 + 16);
  id v13 = v5;
  v12(v10, v9, v8, v14);
}

uint64_t sub_10002736C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027468(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027540;
  v8[3] = &unk_100064148;
  void v8[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v7 = v5;
  [v6 _navigateToStoryPlayerWithConfiguration:a2 completion:v8];
}

void sub_100027540(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027644;
    v7[3] = &unk_100064328;
    uint64_t v6 = *(void *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, id, void *))(v5 + 16))(v5, v6, v8, v7);
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Unable to navigate to player."];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100027644(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000276EC;
  v5[3] = &unk_100064120;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  char v7 = a2;
  [v3 _dismissStoryPlayer:v4 animated:0 completion:v5];
}

id sub_1000276EC(uint64_t a1, char a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
  else {
    return [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Unable to dismiss player."];
  }
}

void sub_100027724(id a1, PXStoryPPTPerformer *a2, PXStoryViewConfiguration *a3, id a4)
{
}

void sub_100027738(id a1, PXStoryPPTPerformer *a2, PXStoryViewConfiguration *a3, id a4)
{
}

void sub_10002774C(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
}

void sub_10002776C(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
}

void sub_10002778C(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
}

void sub_1000277A0(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
}

void sub_100027C04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100027C34(uint64_t a1)
{
  sub_10002812C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PUTesterDefaultVideoGenerator");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100073390 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getPUTesterDefaultVideoGeneratorClass(void)_block_invoke"];
    [v2 handleFailureInFunction:v3 file:@"PhotosApplication-Testing.m" lineNumber:177 description:@"Unable to find class %s" v3];

    __break(1u);
  }
}

void sub_100027CFC(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027F0C;
  v4[3] = &unk_100063FF8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  __int16 v9 = *(_WORD *)(a1 + 72);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

uint64_t sub_100027DEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100027DFC(uint64_t a1)
{
}

void sub_100027E04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = +[NSURL fileURLWithPath:v5 isDirectory:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else if (v6)
  {
    id v11 = PLPPTGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to generate a video %@", (uint8_t *)&v12, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100027F0C(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) gridView];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028000;
  v8[3] = &unk_100063FD0;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 64);
  __int16 v12 = *(_WORD *)(a1 + 72);
  [v2 ppt_performScrollTest:v3 withOptions:v4 gridView:v5 completionHandler:v8];
}

void sub_100028000(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000280CC;
  v9[3] = &unk_100063FA8;
  char v12 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 48);
  void v9[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  __int16 v13 = *(_WORD *)(a1 + 56);
  id v8 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v9];
}

id sub_1000280CC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 finishedCurrentTestWithExtraResults:*(void *)(a1 + 40)];
  }
  else {
    [v3 failedCurrentTest];
  }
  [*(id *)(a1 + 48) setEnableInlinePlayback:*(unsigned __int8 *)(a1 + 57)];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 58);
  id v5 = *(void **)(a1 + 48);

  return [v5 setMaxNumberOfPlayingItems:v4];
}

void sub_10002812C()
{
  v3[0] = 0;
  if (!qword_100073378)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10002827C;
    v3[4] = &unk_100062DF0;
    void v3[5] = v3;
    long long v4 = off_1000644F0;
    uint64_t v5 = 0;
    qword_100073378 = _sl_dlopen();
  }
  if (!qword_100073378)
  {
    uint64_t v1 = +[NSAssertionHandler currentHandler];
    int v2 = +[NSString stringWithUTF8String:"void *PhotosUITesterLibrary(void)"];
    [v1 handleFailureInFunction:v2 file:@"PhotosApplication-Testing.m" lineNumber:171 description:@"%s" v3[0]];

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10002827C()
{
  uint64_t result = _sl_dlopen();
  qword_100073378 = result;
  return result;
}

void sub_100028518(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:[v3 index]];
  if (!*(unsigned char *)(a1 + 88)) {
    [*(id *)(a1 + 40) setDefaultValuesWithPresetName:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 40) createLayout];
  id v6 = [objc_alloc((Class)PXGPPTViewController) initWithLayout:v5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000286AC;
  v13[3] = &unk_100063F30;
  id v8 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v9 = *(void **)(a1 + 64);
  id v14 = v4;
  uint64_t v15 = v7;
  id v16 = v9;
  id v17 = *(id *)(a1 + 72);
  id v18 = v6;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 80);
  id v21 = v3;
  id v10 = v3;
  id v11 = v6;
  id v12 = v4;
  [v8 presentViewController:v11 animated:1 completion:v13];
}

id sub_1000286A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTestWithExtraResults:*(void *)(a1 + 40)];
}

void sub_1000286AC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  [*(id *)(a1 + 40) startedSubTest:v2 forTest:*(void *)(a1 + 48)];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 64) gridView];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000287DC;
  v8[3] = &unk_100063F08;
  id v6 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v2;
  id v10 = v6;
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 80);
  id v13 = *(id *)(a1 + 88);
  id v7 = v2;
  [v3 ppt_performScrollTest:&stru_1000654D8 withOptions:v4 gridView:v5 completionHandler:v8];
}

void sub_1000287DC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) finishedSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
  id v6 = *(void **)(a1 + 56);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000288D8;
  v10[3] = &unk_100063EE0;
  char v16 = a2;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v9 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v10];
}

void sub_1000288D8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    id v6 = sub_1000289B4;
    id v7 = &unk_100063EB8;
    id v2 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [v2 enumerateKeysAndObjectsUsingBlock:&v4];
    [*(id *)(a1 + 56) next:v4, v5, v6, v7];
  }
  else
  {
    [*(id *)(a1 + 64) failedCurrentTest];
    id v3 = *(void **)(a1 + 56);
    _[v3 stop];
  }
}

void sub_1000289B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = +[NSString stringWithFormat:@"sub:%@:%@", v5, a2];
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
}

void sub_100028CA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 configurationDescription];
  [*(id *)(a1 + 40) pu_startedAnimationSubTest:v7 forTest:*(void *)(a1 + 48)];
  id v8 = *(void **)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029308;
  v14[3] = &unk_100063DC8;
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v17 = a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029368;
  v11[3] = &unk_100062BE0;
  id v9 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  [v8 animate:v14 animationRenderingCompletionHandler:v11 proceedHandler:v6];
}

void sub_100028DFC(id *a1)
{
  [a1[4] count];
  id v3 = a1[5];
  id v4 = a1[4];
  id v5 = a1[8];
  id v2 = a1[6];
  PXIterateAsynchronously();
}

void sub_100028F20(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:[v4 index]];
  [v5 floatValue];
  LODWORD(v2) = vcvtps_u32_f32(sqrtf(v6));
  [*(id *)(a1 + 32) setNumberOfRows:v2];
  [*(id *)(a1 + 32) setNumberOfColumns:v2];

  [*(id *)(a1 + 32) setStyle:0];
  dispatch_time_t v7 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000290C0;
  block[3] = &unk_100063E40;
  id v8 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v11 = v4;
  id v12 = v8;
  id v9 = v4;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100029040(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000290B8;
  v3[3] = &unk_1000646C0;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

id sub_1000290B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_1000290C0(uint64_t a1)
{
  id v3 = *(id *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  PXIterateAsynchronously();
}

void sub_1000291A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002926C;
  v7[3] = &unk_100063870;
  id v8 = v3;
  id v9 = v4;
  id v5 = (void (*)(void *, uint64_t, void *))v4[2];
  id v6 = v3;
  v5(v9, 1, v7);
}

id sub_100029264(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

void sub_10002926C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100029300;
  v2[3] = &unk_1000646C0;
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

id sub_100029300(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

void sub_100029308(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) createAnimation];
  [v2 setDuration:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setStyle:*(void *)(a1 + 48)];
}

id sub_100029368(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
}

void sub_10002945C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  [v9 mean];
  id v11 = +[NSNumber numberWithDouble:v10 * 1000.0];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"editorialLayoutGeneration:mean"];

  [*(id *)(a1 + 32) setObject:@"ms" forKeyedSubscript:@"editorialLayoutGeneration:meanUnits"];
  [v9 min];
  uint64_t v13 = +[NSNumber numberWithDouble:v12 * 1000.0];
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"editorialLayoutGeneration:min"];

  id v14 = +[NSString stringWithFormat:@"ms (%@)", v8];

  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"editorialLayoutGeneration:minUnits"];
  [v9 max];
  double v16 = v15;

  uint64_t v17 = +[NSNumber numberWithDouble:v16 * 1000.0];
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:@"editorialLayoutGeneration:max"];

  id v18 = +[NSString stringWithFormat:@"ms (%@)", v7];

  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"editorialLayoutGeneration:maxUnits"];
}

void sub_1000296FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  [v9 mean];
  id v11 = +[NSNumber numberWithDouble:v10 * 1000.0];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"gridLayoutGeneration:mean"];

  [*(id *)(a1 + 32) setObject:@"ms" forKeyedSubscript:@"gridLayoutGeneration:meanUnits"];
  [v9 min];
  uint64_t v13 = +[NSNumber numberWithDouble:v12 * 1000.0];
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"gridLayoutGeneration:min"];

  id v14 = +[NSString stringWithFormat:@"ms (%@)", v8];

  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"gridLayoutGeneration:minUnits"];
  [v9 max];
  double v16 = v15;

  uint64_t v17 = +[NSNumber numberWithDouble:v16 * 1000.0];
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:@"gridLayoutGeneration:max"];

  id v18 = +[NSString stringWithFormat:@"ms (%@)", v7];

  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"gridLayoutGeneration:maxUnits"];
}

id sub_1000299E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) measurementsDictionaryRepresentation];
  [v1 finishedCurrentTestWithExtraResults:v2];

  return +[PXPPTLoadingLatencyMeter stopMeasurements];
}

id sub_100029A3C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"%@", a2];
}

id sub_100029BF0(uint64_t a1, void *a2)
{
  return _[a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

void sub_100029F04(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 canPlayAutoloop] & 1) == 0)
  {
    if ([v6 canPerformEditOperation:2])
    {
      [*(id *)(a1 + 32) addObject:v6];
      if ([*(id *)(a1 + 32) count] == *(id *)(a1 + 40)) {
        *a4 = 1;
      }
    }
  }
}

void sub_100029F8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) firstObject];
  [*(id *)(a1 + 32) removeObjectAtIndex:0];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v5 currentTestName];
  [v5 startedSubTest:@"GenerateSingleAutoLoop" forTest:v6 withMetrics:&off_1000683A0];

  id v7 = *(void **)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002A1BC;
  v10[3] = &unk_100063D00;
  void v10[4] = v7;
  id v11 = v4;
  id v13 = v3;
  id v12 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v4;
  [v7 _convertAsset:v9 toVariationType:1 completionHandler:v10];
}

void sub_10002A0BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) valueForKeyPath:@"@avg.creationDate.timeIntervalSinceReferenceDate"];
  [v2 doubleValue];
  double v4 = v3;

  id v5 = *(void **)(a1 + 40);
  id v6 = [v5 currentTestName];
  CFStringRef v9 = @"TestedAssetsHash";
  id v7 = +[NSNumber numberWithDouble:v4];
  double v10 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v5 finishedTest:v6 extraResults:v8];
}

void sub_10002A1BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 currentTestName];
  [v6 finishedSubTest:@"GenerateSingleAutoLoop" forTest:v7];

  id v8 = *(void **)(a1 + 32);
  CFStringRef v9 = [v8 currentTestName];
  [v8 startedSubTest:@"RevertSingleAutoLoop" forTest:v9 withMetrics:&off_1000683B8];

  double v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002A314;
  v13[3] = &unk_100063CD8;
  void v13[4] = v10;
  char v18 = a2;
  id v17 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 40);
  id v16 = v5;
  id v12 = v5;
  [v10 _convertAsset:v11 toVariationType:0 completionHandler:v13];
}

void sub_10002A314(uint64_t a1, int a2, void *a3)
{
  id v15 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 currentTestName];
  [v5 finishedSubTest:@"RevertSingleAutoLoop" forTest:v6];

  if (*(unsigned char *)(a1 + 72)) {
    BOOL v7 = a2 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 72)) {
      double v10 = @"YES";
    }
    else {
      double v10 = @"NO";
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 56);
    if (a2) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    id v14 = v13;
    [v8 failedCurrentTestWithFailure:@"GenerateAutoLoop asset:%@ convertSuccess:%@ with error:%@ revertSuccess:%@ with error:%@", v9, v11, v12, v14, v15];
  }
  else
  {
    (*(void (**)(void, BOOL))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), [*(id *)(a1 + 40) count] == 0);
  }
}

void sub_10002A6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A704(id *a1, void *a2)
{
  id v3 = a2;
  double v4 = [a1[4] viewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002A800;
  v5[3] = &unk_100063C60;
  id v6 = a1[4];
  objc_copyWeak(&v8, a1 + 6);
  id v7 = a1[5];
  [v3 presentViewController:v4 animated:1 completion:v5];

  objc_destroyWeak(&v8);
}

void sub_10002A7EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002A800(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ppt_scrollTestViewController];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [v2 childViewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (!v9) {
      goto LABEL_12;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v11 = [WeakRetained _scrollViewToTestForViewController:v9];

    id v12 = objc_loadWeakRetained((id *)(a1 + 48));
    [v12 startedCurrentTest];

    id v13 = objc_loadWeakRetained((id *)(a1 + 48));
    id v14 = [v13 currentTestName];
    [v13 ppt_performScrollTest:v14 withOptions:*(void *)(a1 + 40) scrollView:v11 completionHandler:0];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    [v9 failedCurrentTestWithFailure:@"PXPhotosUIViewController not found on image picker for runScrollAssetPickerTest"];
  }
}

void sub_10002AA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002AAB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)UIViewController);
  id v5 = +[UIColor systemBackgroundColor];
  uint64_t v6 = [v4 view];
  [v6 setBackgroundColor:v5];

  [v4 setModalPresentationStyle:5];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ABF8;
  block[3] = &unk_100063C60;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v11 = v3;
  id v12 = v4;
  id v8 = v4;
  id v9 = v3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v13);
}

void sub_10002ABF8(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained startedCurrentTest];

  id v4 = objc_alloc((Class)PHPickerConfiguration);
  id v5 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  id v6 = [v4 initWithPhotoLibrary:v5];

  id v7 = [objc_alloc((Class)PHPickerViewController) initWithConfiguration:v6];
  id v9 = *(void **)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002AD58;
  v11[3] = &unk_100063C60;
  id v12 = v8;
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(&v14, v2);
  [v9 presentViewController:v12 animated:0 completion:v11];
  objc_destroyWeak(&v14);
}

void sub_10002AD44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002AD58(uint64_t a1)
{
  [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = +[NSNotificationCenter defaultCenter];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002AE54;
  v5[3] = &unk_100063C10;
  objc_copyWeak(&v6, v2);
  [WeakRetained installNotificationObserverForNotificationName:v4 notificationName:@"PPT_PickerFinishedLoading" forOneNotification:1 usingBlock:v5];

  objc_destroyWeak(&v6);
}

void sub_10002AE40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002AE54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finishedCurrentTest];
}

void sub_10002B03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B064(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v9 = v3;
    if (*(unsigned char *)(a1 + 56))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;
    }
    id v3 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = v9;
  }

  return _objc_release_x1(v3, v4);
}

void sub_10002B250(uint64_t a1)
{
  id v2 = +[PLPhotoLibrary systemPhotoLibrary];
  ppt_ResetSyncStatusWithLibrary();

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B2F8;
  block[3] = &unk_1000646C0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10002B2F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_10002B394(uint64_t a1)
{
  id v2 = +[PLPhotoLibrary systemPhotoLibrary];
  ppt_ResetSyncStatusWithLibrary();

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B43C;
  block[3] = &unk_1000646C0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10002B43C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_10002B500(uint64_t a1)
{
  id v2 = +[PLPhotoLibrary systemPhotoLibrary];
  +[PLManagedAsset createMastersInLibrary:v2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BB00;
  block[3] = &unk_1000646C0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  id v3 = [v2 libraryServicesManager];
  id v4 = [v3 databaseContext];

  id v5 = objc_alloc((Class)PLRelationshipOrderKeyManager);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10002BB60;
  v38[3] = &unk_100063B40;
  id v6 = v4;
  id v39 = v6;
  id v7 = [v5 initWithGenerateContextBlock:v38];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002BB98;
  v35[3] = &unk_100064710;
  id v8 = v2;
  id v36 = v8;
  id v9 = v7;
  id v37 = v9;
  [v8 performBlockAndWait:v35 completionHandler:&stru_100063B60];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10002BCA4;
  v34[3] = &unk_1000646C0;
  v34[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v34);

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  _OWORD v32[2] = sub_10002BD04;
  v32[3] = &unk_1000646C0;
  id v10 = v8;
  id v33 = v10;
  [v10 performBlockAndWait:v32 completionHandler:&stru_100063B80];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10002BD28;
  v31[3] = &unk_1000646C0;
  _OWORD v31[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v31);

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  void v30[2] = sub_10002BD88;
  v30[3] = &unk_1000646C0;
  v30[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002BDE8;
  v28[3] = &unk_1000646C0;
  id v11 = v10;
  id v29 = v11;
  [v11 performBlockAndWait:v28 completionHandler:&stru_100063BA0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002BE0C;
  v27[3] = &unk_1000646C0;
  v27[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v27);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002BE6C;
  v26[3] = &unk_1000646C0;
  v26[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002BECC;
  v24[3] = &unk_1000646C0;
  id v12 = v11;
  id v25 = v12;
  [v12 performBlockAndWait:v24 completionHandler:&stru_100063BC0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002BEEC;
  v23[3] = &unk_1000646C0;
  v23[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002BF4C;
  v22[3] = &unk_1000646C0;
  v22[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  do
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002BFAC;
    void v15[3] = &unk_1000645D8;
    id v13 = v12;
    id v16 = v13;
    long long v17 = &v18;
    [v13 performTransactionAndWait:v15];
  }
  while (!*((unsigned char *)v19 + 24));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002C124;
  v14[3] = &unk_1000646C0;
  void v14[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

  _Block_object_dispose(&v18, 8);
}

void sub_10002BAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002BB00(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 finishedSubTest:@"createMaster" forTest:v2];
}

id sub_10002BB60(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) newShortLivedLibraryForOrderKeyManagerWithName:"-[PLPhotosApplication(Testing) runHyperionInitialSyncTest:]_block_invoke_3"];

  return [v1 managedObjectContext];
}

void sub_10002BB98(uint64_t a1)
{
  id v2 = +[PLGenericAlbum albumsToUploadInitiallyInLibrary:*(void *)(a1 + 32) limit:50];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) cplAlbumChangeInPhotoLibrary:*(void *)(a1 + 32) orderKeyManager:*(void *)(a1 + 40)];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_10002BCA4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 startedSubTest:@"estimatedLibrarySizeCalculation" forTest:v2];
}

id sub_10002BD04(uint64_t a1)
{
  return [*(id *)(a1 + 32) estimatedLibrarySizes];
}

void sub_10002BD28(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 finishedSubTest:@"estimatedLibrarySizeCalculation" forTest:v2];
}

void sub_10002BD88(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 startedSubTest:@"originalPhotosAndPurgableLibrarySize" forTest:v2];
}

id sub_10002BDE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) librarySizesFromDB];
}

void sub_10002BE0C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 finishedSubTest:@"originalPhotosAndPurgableLibrarySize" forTest:v2];
}

void sub_10002BE6C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 startedSubTest:@"purgeableSharedStreamsSize" forTest:v2];
}

id sub_10002BECC(uint64_t a1)
{
  return +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:0 shouldFreeSpace:0 shouldKeepRecentlyViewedAssets:0 fromPhotoLibrary:*(void *)(a1 + 32)];
}

void sub_10002BEEC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 finishedSubTest:@"purgeableSharedStreamsSize" forTest:v2];
}

void sub_10002BF4C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 startedSubTest:@"fetchAssets" forTest:v2];
}

void sub_10002BFAC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[PLManagedAsset assetsToUploadInitiallyInManagedObjectContext:v2 limit:50];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 incrementUploadAttempts];
        long long v10 = +[NSDate date];
        [v9 setLastUploadAttemptDate:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count] == 0;
}

id sub_10002C124(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 finishedSubTest:@"fetchAssets" forTest:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 finishedCurrentTest];
}

void sub_10002C9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_10002CA04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(*(void *)(v5 + 8) + 24);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10002CE28;
  v38[3] = &unk_100063A78;
  uint64_t v7 = *(void *)(a1 + 104);
  void v38[4] = *(void *)(a1 + 40);
  uint64_t v41 = v5;
  uint64_t v42 = v7;
  uint64_t v43 = v6;
  uint64_t v44 = *(void *)(a1 + 112);
  id v8 = v3;
  id v40 = v8;
  id v39 = *(id *)(a1 + 32);
  long long v9 = objc_retainBlock(v38);
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;
  long long v12 = *(void **)(a1 + 40);
  long long v13 = [v12 currentTestName];
  [v12 startedSubTest:@"highQualityImage" forTest:v13 withMetrics:&__NSArray0__struct];

  uint64_t v14 = *(void *)(a1 + 136);
  long long v15 = *(void **)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002CFAC;
  v26[3] = &unk_100063AA0;
  uint64_t v33 = v11;
  id v30 = &v34;
  long long v31 = *(_OWORD *)(a1 + 80);
  id v27 = *(id *)(a1 + 64);
  long long v17 = v9;
  id v29 = v17;
  id v18 = v4;
  uint64_t v19 = *(void *)(a1 + 96);
  id v28 = v18;
  uint64_t v32 = v19;
  [v15 requestImageForAsset:v18 targetSize:v14 contentMode:v16 options:v26 resultHandler:^(UIImage *, NSDictionary *, NSError *)];
  *((unsigned char *)v35 + 24) = 0;
  dispatch_time_t v20 = dispatch_time(0, 60000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D1AC;
  block[3] = &unk_100063AC8;
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = v6;
  void block[4] = *(void *)(a1 + 40);
  id v23 = v18;
  id v21 = v18;
  dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v34, 8);
}

void sub_10002CCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

id sub_10002CCF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2 >= 1)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v11 = v2;
    CFStringRef v4 = @"%ld images were in the cloud and had to be downloaded, please run the test again.";
LABEL_3:
    [v3 failedCurrentTestWithFailure:v4, v11];
    goto LABEL_6;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = *(void **)(a1 + 32);
    CFStringRef v4 = @"Unable to get image results for any assets.";
    goto LABEL_3;
  }
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = +[NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)/ *(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [v5 setObject:v6 forKeyedSubscript:@"imagePixelSize:mean"];

  uint64_t v7 = +[PXPPTLoadingLatencyMeter sharedInstance];
  id v8 = [v7 measurementsDictionaryRepresentation];
  [v5 addEntriesFromDictionary:v8];

  +[PXPPTLoadingLatencyMeter stopMeasurements];
  [*(id *)(a1 + 32) finishedCurrentTestWithExtraResults:v5];

LABEL_6:
  long long v9 = *(void **)(a1 + 40);

  return _[v9 removeFromSuperview];
}

void sub_10002CE28(uint64_t a1)
{
  if (!+[NSThread isMainThread])
  {
    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"PhotosApplication-Testing.m" lineNumber:2849 description:@"%s must be called on the main thread" -[PLPhotosApplication(Testing) _runRequestImageWithTargetSize:contentMode:options:]_block_invoke_2];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 72))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [v2 currentTestName];
    [v2 finishedSubTest:@"highQualityImage" forTest:v3];

    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 80) * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D1F4;
    block[3] = &unk_100063A50;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = v5;
    uint64_t v11 = v6;
    id v9 = *(id *)(a1 + 40);
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10002CFAC(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  if (v21)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v7 = v6 - *(double *)(a1 + 88);
    id v8 = [v5 objectForKeyedSubscript:PHImageResultIsDegradedKey];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v11 = +[PXPPTLoadingLatencyMeter sharedInstance];
      [v11 reportLatency:v10 == 0 forOutputQuality:v7];

      goto LABEL_9;
    }
    [v21 size];
    double v15 = v14;
    [v21 size];
    double v17 = v15 * v16;
    [v21 scale];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (uint64_t)((double)*(uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                               + 24)
                                                                          + v17 * v18);
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v19 = +[PXPPTLoadingLatencyMeter sharedInstance];
    [v19 reportLatency:2 forOutputQuality:v7];

    [*(id *)(a1 + 32) setImage:v21];
  }
  else
  {
    long long v12 = [v5 objectForKeyedSubscript:PHImageResultIsInCloudKey];

    uint64_t v13 = *(void *)(a1 + 40);
    if (v12)
    {
      NSLog(@"Media in the cloud for asset:%@, downloading.", *(void *)(a1 + 40));
      ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      goto LABEL_9;
    }
    dispatch_time_t v20 = [v5 objectForKeyedSubscript:PHImageErrorKey];
    NSLog(@"Got nil image for asset:%@ error:%@", v13, v20);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

id *sub_10002D1AC(id *result)
{
  if (*(id *)(*((void *)result[6] + 1) + 24) == result[7]) {
    return (id *)[result[4] failedCurrentTestWithFailure:@"Timeout requesting image for asset:%@", result[5]];
  }
  return result;
}

uint64_t sub_10002D1F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  BOOL v3 = v2 >= (unint64_t)[*(id *)(a1 + 32) count];
  dispatch_time_t v4 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);

  return v4(v1, v3);
}

uint64_t sub_10002D60C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002D714(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10002D7CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002D8E4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002DB44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 72))
  {
    dispatch_time_t v4 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002E044;
    v19[3] = &unk_100064570;
    id v20 = *(id *)(a1 + 48);
    [v4 installCACommitCompletionBlock:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002E054;
    v17[3] = &unk_100064570;
    id v18 = *(id *)(a1 + 56);
    [v3 ppt_performBlockAfterNextNavigationAnimation:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id v5 = [v3 topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    char v16 = 0;
    +[NSDate timeIntervalSinceReferenceDate];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002E064;
    v9[3] = &unk_1000639B0;
    uint64_t v14 = v6;
    uint64_t v13 = v15;
    id v10 = *(id *)(a1 + 40);
    id v11 = v5;
    id v12 = *(id *)(a1 + 64);
    [v11 ppt_performBlockAfterAllWidgetLoadingCompletes:v9];
    dispatch_time_t v7 = dispatch_time(0, 90000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E1F8;
    block[3] = &unk_1000645D8;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v15;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v15, 8);
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTest];
  }
}

void sub_10002DDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002DDF8(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"album"];
  unsigned int v3 = [v2 isEqualToString:@"People"];

  if (v3)
  {
    dispatch_time_t v4 = *(void **)(a1 + 40);
    CFStringRef v5 = @"rdar://133850769";
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"album"];

    dispatch_time_t v7 = *(void **)(a1 + 40);
    if (v6)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10002DF44;
      v10[3] = &unk_100063A00;
      id v11 = *(id *)(a1 + 48);
      char v13 = *(unsigned char *)(a1 + 64);
      id v8 = *(id *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      id v12 = v8;
      void v10[4] = v9;
      [v7 _navigateToAlbumForCurrentTest:v10];

      return;
    }
    CFStringRef v5 = @"Memory details views don't exist anymore";
    dispatch_time_t v4 = *(void **)(a1 + 40);
  }

  [v4 failedCurrentTestWithFailure:v5];
}

void sub_10002DF44(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v8;
    dispatch_time_t v4 = [v3 photosDataSource];
    CFStringRef v5 = [v4 lastAssetCollection];

    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [v3 navigateToPhotosDetailsForAssetCollection:v5 animated:*(unsigned __int8 *)(a1 + 56)];
      uint64_t v6 = *(void *)(a1 + 48);
      dispatch_time_t v7 = [v3 navigationController];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      [*(id *)(a1 + 32) failedCurrentTest];
    }
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTest];
  }
}

uint64_t sub_10002E044(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002E054(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002E064(uint64_t a1)
{
  unint64_t v2 = PLPPTGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v4 = v3 - *(double *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    double v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Took %0.1fs to load all details view's widgets", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  CFStringRef v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"discloseWidgets"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    [*(id *)(a1 + 40) ppt_toggleDiscloseWidgets];
  }
  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E21C;
  v8[3] = &unk_100063870;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
}

id *sub_10002E1F8(id *result)
{
  if (!*(unsigned char *)(*((void *)result[5] + 1) + 24)) {
    return (id *)[result[4] failedCurrentTestWithFailure:@"Details view's widgets took too long to load"];
  }
  return result;
}

uint64_t sub_10002E21C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002E304(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 px_descendantViewControllerWithClass:objc_opt_class()];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_time_t v5 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E428;
    block[3] = &unk_100063870;
    id v8 = *(id *)(a1 + 40);
    id v7 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Top viewController is not a libraryViewController:%@", v4];
  }
}

uint64_t sub_10002E428(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002E814(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002E82C(uint64_t a1, void *a2)
{
  id v3 = [a2 navigationController];
  id v8 = [v3 topViewController];

  double v4 = [v8 presentedViewController];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 topViewController];
    }
    else
    {
      id v5 = v4;
    }
    id v7 = v5;

    id v6 = v7;
  }
  else
  {
    id v6 = v8;
  }
  id v9 = v6;
  if (*(unsigned char *)(a1 + 48))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Expected one up view controller, got %@", v9];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002E948(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 collectionListFetchResult];
    id v6 = v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      [v5 lastObject];
    }
    else {
    id v11 = [v5 firstObject];
    }
    double v12 = [v4 assetsInAssetCollection:v11];
    char v13 = v12;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      [v12 lastObject];
    }
    else {
    uint64_t v14 = [v12 firstObject];
    }
    double v15 = [*(id *)(a1 + 32) valueForKey:@"assetMediaType"];
    if (v15)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        unint64_t v16 = (unint64_t)[v13 count] - 1;
      }
      else {
        unint64_t v16 = 0;
      }
      id v18 = [v14 mediaType];
      if (v18 != [v15 unsignedIntegerValue] && (v16 & 0x8000000000000000) == 0)
      {
        while (v16 < (unint64_t)[v13 count])
        {
          double v17 = [v13 objectAtIndexedSubscript:v16];

          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
            --v16;
          }
          else {
            ++v16;
          }
          id v19 = [v17 mediaType];
          if (v19 != [v15 unsignedIntegerValue])
          {
            uint64_t v14 = v17;
            if ((v16 & 0x8000000000000000) == 0) {
              continue;
            }
          }
          goto LABEL_29;
        }
      }
      double v17 = v14;
LABEL_29:
      id v20 = [v17 mediaType];
      if (v20 != [v15 unsignedIntegerValue])
      {
        id v21 = PLPPTGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v15;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "no assets with mediaType = %@", buf, 0xCu);
        }

        [*(id *)(a1 + 40) failedCurrentTest];
      }
    }
    else
    {
      double v17 = v14;
    }
    if (v17)
    {
      [v4 navigateToPhoto:v17 inAssetContainer:v11 animated:1];
      dispatch_time_t v22 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002F39C;
      block[3] = &unk_100063870;
      id v61 = *(id *)(a1 + 48);
      id v60 = v4;
      dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      id v23 = PLPPTGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "no initial asset to navigate to", buf, 2u);
      }

      [*(id *)(a1 + 40) failedCurrentTest];
    }

    goto LABEL_106;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v7 = [v4 viewModel];
    id v6 = [v7 currentDataSource];

    if (*(unsigned char *)(a1 + 64)) {
      [v6 lastAssetCollection];
    }
    else {
    id v11 = [v6 firstAssetCollection];
    }
    id v24 = objc_alloc((Class)PXAssetCollectionReference);
    long long v25 = PXSimpleIndexPathNull[1];
    *(_OWORD *)buf = PXSimpleIndexPathNull[0];
    long long v65 = v25;
    id v26 = [v24 initWithAssetCollection:v11 keyAssetReference:0 indexPath:buf];
    *(_OWORD *)buf = 0u;
    long long v65 = 0u;
    if (v6) {
      [v6 indexPathForAssetCollectionReference:v26];
    }
    *(_OWORD *)uint64_t v62 = *(_OWORD *)buf;
    long long v63 = v65;
    id v27 = [v6 assetsInSectionIndexPath:v62];
    id v28 = v27;
    if (*(unsigned char *)(a1 + 64)) {
      [v27 lastObject];
    }
    else {
    id v30 = [v27 firstObject];
    }
    long long v31 = [*(id *)(a1 + 32) valueForKey:@"assetMediaType"];
    long long v52 = v26;
    if (v31)
    {
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v32 = (uint64_t)[v28 count] - 1;
      }
      else {
        uint64_t v32 = 0;
      }
      id v38 = [v30 mediaType];
      if (v38 != [v31 unsignedIntegerValue] && (v32 & 0x8000000000000000) == 0)
      {
        while (v32 < (uint64_t)[v28 count])
        {
          uint64_t v33 = [v28 objectAtIndex:v32];

          if (*(unsigned char *)(a1 + 64)) {
            --v32;
          }
          else {
            ++v32;
          }
          id v39 = [v33 mediaType];
          if (v39 != [v31 unsignedIntegerValue])
          {
            id v30 = v33;
            if ((v32 & 0x8000000000000000) == 0) {
              continue;
            }
          }
          goto LABEL_68;
        }
      }
      uint64_t v33 = v30;
LABEL_68:
      id v40 = [v33 mediaType];
      if (v40 != [v31 unsignedIntegerValue])
      {
        uint64_t v41 = PLPPTGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v62 = 138412290;
          *(void *)&v62[4] = v31;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "no assets with mediaType = %@", v62, 0xCu);
        }

        [*(id *)(a1 + 40) failedCurrentTest];
      }
    }
    else
    {
      uint64_t v33 = v30;
    }
    if (v33)
    {
      uint64_t v42 = *(unsigned __int8 *)(a1 + 65);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10002F3B0;
      v56[3] = &unk_100063898;
      id v58 = *(id *)(a1 + 48);
      id v57 = v4;
      [v57 ppt_navigateToAsset:v33 inAssetContainer:v11 revealInOneUp:v42 completionHandler:v56];

LABEL_105:
LABEL_106:

      goto LABEL_107;
    }
    uint64_t v43 = PLPPTGetLog();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
LABEL_104:

      [*(id *)(a1 + 40) failedCurrentTest];
      goto LABEL_105;
    }
    *(_WORD *)uint64_t v62 = 0;
LABEL_103:
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "no initial asset to navigate to", v62, 2u);
    goto LABEL_104;
  }
  id v8 = [v3 px_descendantViewControllerWithClass:objc_opt_class()];

  if (v8)
  {
    [v3 px_descendantViewControllerWithClass:objc_opt_class()];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v4 viewProvider];
    id v10 = [v9 viewModel];
    id v6 = [v10 currentDataSource];

    if (*(unsigned char *)(a1 + 64)) {
      [v6 lastAssetCollection];
    }
    else {
    id v11 = [v6 firstAssetCollection];
    }
    id v34 = objc_alloc((Class)PXAssetCollectionReference);
    long long v35 = PXSimpleIndexPathNull[1];
    *(_OWORD *)buf = PXSimpleIndexPathNull[0];
    long long v65 = v35;
    id v36 = [v34 initWithAssetCollection:v11 keyAssetReference:0 indexPath:buf];
    *(_OWORD *)buf = 0u;
    long long v65 = 0u;
    if (v6) {
      [v6 indexPathForAssetCollectionReference:v36];
    }
    *(_OWORD *)uint64_t v62 = *(_OWORD *)buf;
    long long v63 = v65;
    char v37 = [v6 assetsInSectionIndexPath:v62];
    id v28 = v37;
    if (*(unsigned char *)(a1 + 64)) {
      [v37 lastObject];
    }
    else {
    uint64_t v44 = [v37 firstObject];
    }
    long long v31 = [*(id *)(a1 + 32) valueForKey:@"assetMediaType"];
    long long v52 = v36;
    if (v31)
    {
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v45 = (uint64_t)[v28 count] - 1;
      }
      else {
        uint64_t v45 = 0;
      }
      id v46 = [v44 mediaType];
      if (v46 != [v31 unsignedIntegerValue] && (v45 & 0x8000000000000000) == 0)
      {
        while (v45 < (uint64_t)[v28 count])
        {
          uint64_t v33 = [v28 objectAtIndex:v45];

          if (*(unsigned char *)(a1 + 64)) {
            --v45;
          }
          else {
            ++v45;
          }
          id v47 = [v33 mediaType];
          if (v47 != [v31 unsignedIntegerValue])
          {
            uint64_t v44 = v33;
            if ((v45 & 0x8000000000000000) == 0) {
              continue;
            }
          }
          goto LABEL_92;
        }
      }
      uint64_t v33 = v44;
LABEL_92:
      id v48 = [v33 mediaType];
      if (v48 != [v31 unsignedIntegerValue])
      {
        long long v49 = PLPPTGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v62 = 138412290;
          *(void *)&v62[4] = v31;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "no assets with mediaType = %@", v62, 0xCu);
        }

        [*(id *)(a1 + 40) failedCurrentTest];
      }
    }
    else
    {
      uint64_t v33 = v44;
    }
    if (v33)
    {
      if (*(unsigned char *)(a1 + 65)) {
        uint64_t v50 = 1;
      }
      else {
        uint64_t v50 = 2;
      }
      id v51 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithType:7 revealMode:v50 asset:v33 assetCollection:v11];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10002F3C4;
      v53[3] = &unk_100063898;
      id v55 = *(id *)(a1 + 48);
      id v54 = v4;
      [v54 navigateToDestination:v51 options:2 completionHandler:v53];

      goto LABEL_105;
    }
    uint64_t v43 = PLPPTGetLog();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_104;
    }
    *(_WORD *)uint64_t v62 = 0;
    goto LABEL_103;
  }
  id v29 = PLPPTGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) failedCurrentTest];
LABEL_107:
}

uint64_t sub_10002F39C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10002F3B0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10002F3C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002F47C(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = v6;
    if (!*(unsigned char *)(a1 + 48))
    {
LABEL_11:
      dispatch_time_t v18 = dispatch_time(0, 2000000000);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002F970;
      v22[3] = &unk_1000637F8;
      id v19 = *(id *)(a1 + 40);
      id v23 = v7;
      id v24 = v19;
      char v25 = a3;
      id v20 = v7;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, v22);

      goto LABEL_15;
    }
    id v8 = [v6 browsingSession];
    id v9 = [v8 viewModel];

    id v10 = [v9 assetsDataSource];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_100027DEC;
    uint64_t v42 = sub_100027DFC;
    id v43 = 0;
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = sub_100027DEC;
    char v37 = sub_100027DFC;
    id v38 = 0;
    id v11 = +[NSIndexPath indexPathForItem:0 inSection:0];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10002F89C;
    v29[3] = &unk_1000637D0;
    id v12 = v10;
    id v30 = v12;
    p_long long buf = &buf;
    uint64_t v32 = &v33;
    [v12 enumerateIndexPathsStartingAtIndexPath:v11 reverseDirection:0 usingBlock:v29];

    char v13 = (void *)v34[5];
    if (!v13)
    {
      char v13 = *(void **)(*((void *)&buf + 1) + 40);
      if (!v13)
      {
        if (([v12 isEmpty] & 1) == 0)
        {
          id v14 = +[NSIndexPath indexPathForItem:0 inSection:0];
          goto LABEL_8;
        }
        char v13 = 0;
      }
    }
    id v14 = v13;
LABEL_8:
    double v15 = v14;
    if (v14)
    {
      unint64_t v16 = [v12 assetReferenceAtIndexPath:v14];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002F964;
      v26[3] = &unk_100064710;
      id v27 = v9;
      id v17 = v16;
      id v28 = v17;
      [v27 performChanges:v26];
    }
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&buf, 8);
    goto LABEL_11;
  }
  id v21 = PLPPTGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", (uint8_t *)&buf, 0xCu);
  }

  [*(id *)(a1 + 32) failedCurrentTest];
LABEL_15:
}

void sub_10002F868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002F89C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [*(id *)(a1 + 32) assetAtIndexPath:];
  id v7 = [v6 location];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    [v6 faceAreaMinX];
    if (v8 != 0.0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

id sub_10002F964(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
}

uint64_t sub_10002F970(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

id sub_10002FA00(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _runRotationTestWithViewController:a2];
}

void sub_10002FB58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002FB70(uint64_t a1, void *a2)
{
  id v3 = a2;
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FC2C;
  block[3] = &unk_100063A50;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10002FC24(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_10002FC2C(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) px_firstKeyWindow];
  id v3 = [v2 windowScene];
  id v4 = [v3 interfaceOrientation];

  if (v4 == (id)4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 4;
  }
  id v6 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002FD4C;
  v12[3] = &unk_100063730;
  v12[4] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002FDAC;
  v9[3] = &unk_100063758;
  void v9[4] = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 rotateIfNeeded:v5 before:v12 after:v9];
}

void sub_10002FD4C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 currentTestName];
  [v1 pu_startedAnimationSubTest:@"Rotation" forTest:v2];
}

uint64_t sub_10002FDAC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 pu_finishedAnimationSubTest:@"Rotation" forTest:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void sub_10003001C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 40) pu_finishedAnimationSubTest:*(void *)(a1 + 32) forTest:*(void *)(a1 + 48)];
  }
  id v2 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000300E8;
  v6[3] = &unk_1000636E0;
  id v3 = *(id *)(a1 + 56);
  uint64_t v5 = *(void **)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v7 = v3;
  uint64_t v9 = v4;
  id v8 = v5;
  [v2 installCACommitCompletionBlock:v6];
}

id sub_1000300DC(uint64_t a1, void *a2)
{
  return _[a2 setZoomLevel:*(void *)(a1 + 32)];
}

void sub_1000300E8(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000301A8;
  block[3] = &unk_1000636E0;
  id v3 = *(id *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v9 = v4;
  id v8 = v5;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000301A8(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v2 + 16))(v2, a1[6], a1[5]);
  }
  else {
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
}

void sub_1000303A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2 == 1)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    [*(id *)(a1 + 32) subarrayWithRange:1, v2 - 1];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _transitionCuratedLibraryVC:*(void *)(a1 + 48) toZoomLevelsWithSubTestNames:v4 taskHandler:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
}

void sub_100030840(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"Latency" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) finishedSubTest:*(void *)(a1 + 48) forTest:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030974;
  v5[3] = &unk_100063668;
  id v6 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 64);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);
}

id *sub_100030938(id *result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] failedCurrentTestWithFailure:@"Failed to perform action%@ error:%@", result[5], a3, v3, v4];
  }
  return result;
}

void sub_100030974(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == (id)1)
  {
    dispatch_time_t v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    [*(id *)(a1 + 32) subarrayWithRange:1, [*(id *)(a1 + 32) count] - 1];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _performActionsWithCuratedLibraryVC:*(void *)(a1 + 48) actionsTypesAndNames:v3 completionHandler:*(void *)(a1 + 56)];
  }
}

void sub_100030B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100030B18(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startedCurrentTest];
  id v4 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681E8 second:&stru_1000654D8];
  v27[0] = v4;
  id v5 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681B8 second:&stru_1000654D8];
  v27[1] = v5;
  id v6 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681A0 second:&stru_1000654D8];
  v27[2] = v6;
  id v7 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681D0 second:&stru_1000654D8];
  v27[3] = v7;
  id v8 = +[NSArray arrayWithObjects:v27 count:4];

  id v9 = objc_alloc((Class)PXTwoTuple);
  id v10 = [v9 initWithFirst:PXCuratedLibraryActionSetPersonalLibraryFilter second:@"Personal"];
  v26[0] = v10;
  id v11 = objc_alloc((Class)PXTwoTuple);
  id v12 = [v11 initWithFirst:PXCuratedLibraryActionSetSharedLibraryFilter second:@"Shared"];
  v26[1] = v12;
  id v13 = objc_alloc((Class)PXTwoTuple);
  id v14 = [v13 initWithFirst:PXCuratedLibraryActionSetAllLibrariesFilter second:@"All"];
  v26[2] = v14;
  double v15 = +[NSArray arrayWithObjects:v26 count:3];

  unint64_t v16 = *(void **)(a1 + 32);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100030DD4;
  v21[3] = &unk_100063640;
  v21[4] = v16;
  id v22 = v3;
  id v23 = v8;
  id v24 = v15;
  uint64_t v25 = *(void *)(a1 + 40);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100030F04;
  v20[3] = &unk_1000646C0;
  v20[4] = v16;
  id v17 = v15;
  id v18 = v8;
  id v19 = v3;
  [v16 ppt_startIterationWithBlock:v21 completion:v20];
}

void sub_100030DD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100030F0C;
  v12[3] = &unk_100063618;
  v12[4] = v5;
  id v13 = v4;
  id v14 = *(id *)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100030F20;
  v9[3] = &unk_100062F30;
  uint64_t v7 = *(void *)(a1 + 64);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v5 _transitionCuratedLibraryVC:v13 toZoomLevelsWithSubTestNames:v6 taskHandler:v12 completionHandler:v9];
}

id sub_100030F04(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

id sub_100030F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _performActionsWithCuratedLibraryVC:*(void *)(a1 + 40) actionsTypesAndNames:*(void *)(a1 + 48) completionHandler:a3];
}

uint64_t sub_100030F20(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100031034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003104C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startedCurrentTest];
  id v4 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031144;
  v7[3] = &unk_1000635C8;
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000314A4;
  v6[3] = &unk_1000646C0;
  void v6[4] = v9;
  id v5 = v3;
  [v4 ppt_startIterationWithBlock:v7, v6];
}

void sub_100031144(uint64_t a1, void *a2)
{
  uint64_t v27 = a1;
  id v28 = a2;
  id v2 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681A0 second:@"DaysToMonths"];
  v37[0] = v2;
  id v3 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681B8 second:@"MonthsToYears"];
  v37[1] = v3;
  id v4 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681A0 second:@"YearsToMonths"];
  v37[2] = v4;
  id v5 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681D0 second:@"MonthsToDays"];
  v37[3] = v5;
  id v6 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681E8 second:@"DaysToAllPhotos"];
  v37[4] = v6;
  id v7 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681D0 second:@"AllPhotosToDays"];
  v37[5] = v7;
  id v8 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681B8 second:@"DaysToYears"];
  v37[6] = v8;
  id v9 = [objc_alloc((Class)PXTwoTuple) initWithFirst:&off_1000681D0 second:@"YearsToDays"];
  v37[7] = v9;
  id v10 = +[NSArray arrayWithObjects:v37 count:8];

  uint64_t v11 = (void *)v27;
  id v12 = [*(id *)(v27 + 32) viewProvider];
  id v13 = [v12 viewModel];
  id v14 = [v13 configuration];

  id v15 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v22 = [v21 first:v27];
        if (objc_msgSend(v14, "isZoomLevelEnabled:", objc_msgSend(v22, "integerValue"))) {
          [v15 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }

  uint64_t v24 = v11[4];
  id v23 = (void *)v11[5];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000314AC;
  v29[3] = &unk_100062F30;
  uint64_t v25 = v11[6];
  id v30 = v28;
  uint64_t v31 = v25;
  id v26 = v28;
  [v23 _transitionCuratedLibraryVC:v24 toZoomLevelsWithSubTestNames:v15 taskHandler:0 completionHandler:v29];
}

id sub_1000314A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

uint64_t sub_1000314AC(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_1000315E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000315FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 navigationController];
    id v6 = [v4 viewModel];
    id v7 = [v6 currentDataSource];

    [*(id *)(a1 + 32) startedCurrentTest];
    id v8 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100031788;
    v14[3] = &unk_100063578;
    id v15 = v7;
    id v16 = v8;
    id v17 = v4;
    id v18 = v5;
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100031A48;
    v13[3] = &unk_1000646C0;
    void v13[4] = v8;
    id v10 = v5;
    id v11 = v4;
    id v12 = v7;
    [v8 ppt_startIterationWithBlock:v14 completion:v13];
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTest];
  }
}

void sub_100031788(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) lastAssetCollection];
  id v5 = objc_alloc((Class)PXAssetCollectionReference);
  long long v6 = PXSimpleIndexPathNull[1];
  long long v34 = PXSimpleIndexPathNull[0];
  long long v35 = v6;
  id v7 = [v5 initWithAssetCollection:v4 keyAssetReference:0 indexPath:&v34];
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 indexPathForAssetCollectionReference:v7];
    id v8 = *(void **)(a1 + 32);
  }
  long long v32 = v34;
  long long v33 = v35;
  uint64_t v9 = [v8 assetsInSectionIndexPath:&v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 keyAssetsAtEnd])
  {
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = &v32;
    long long v33 = 0x2020000000uLL;
    id v10 = (char *)[v9 count] - 1;
    uint64_t v11 = -1;
  }
  else
  {
    id v10 = 0;
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = &v32;
    long long v33 = 0x2020000000uLL;
    uint64_t v11 = 1;
  }
  *((void *)&v33 + 1) = v10;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  id v12 = *(void **)(a1 + 40);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100031A50;
  v21[3] = &unk_100063550;
  uint64_t v27 = &v32;
  id v13 = v9;
  uint64_t v29 = v11;
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = *(void **)(a1 + 48);
  id v22 = v13;
  uint64_t v23 = v14;
  id v24 = v15;
  id v16 = v4;
  id v25 = v16;
  id v28 = v31;
  uint64_t v30 = *(void *)(a1 + 72);
  id v26 = *(id *)(a1 + 56);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100031BEC;
  v18[3] = &unk_100062F30;
  uint64_t v20 = *(void *)(a1 + 64);
  id v17 = v3;
  id v19 = v17;
  [v12 ppt_startIterationWithBlock:v21, v18];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);
}

void sub_100031A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100031A48(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100031A50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v4 >= (uint64_t)[*(id *)(a1 + 32) count]
    || (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) & 0x8000000000000000) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3[2](v3, 1);
  }
  else
  {
    long long v6 = (void *)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += *(void *)(a1 + 88);
    id v7 = [*(id *)(a1 + 40) currentTestName];
    [*(id *)(a1 + 40) pu_startedAnimationSubTest:@"ZoomIn" forTest:v7];
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100031C20;
    v12[3] = &unk_100063528;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v8;
    id v14 = v7;
    uint64_t v10 = *(void *)(a1 + 96);
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v18 = v10;
    id v16 = v3;
    id v15 = *(id *)(a1 + 64);
    id v11 = v7;
    [v13 ppt_navigateToAsset:v6 inAssetContainer:v9 revealInOneUp:1 completionHandler:v12];
  }
}

uint64_t sub_100031BEC(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100031C20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v6 = [*(id *)(a1 + 32) _oneUpViewControllerForViewController:*(void *)(a1 + 40)];
  uint64_t v7 = [v6 navigationController];
  id v8 = (void *)v7;
  if (a2 != 1 || (v6 ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), v9))
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Failed to navigate to one up view with error %@", v5];
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100031DF0;
    v21[3] = &unk_100064710;
    void v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    [v8 ppt_installTransitionAnimationCompletionHandler:v21];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100031E04;
    v14[3] = &unk_100063500;
    void v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 80);
    id v16 = v10;
    uint64_t v20 = v11;
    long long v13 = *(_OWORD *)(a1 + 64);
    id v12 = (id)v13;
    long long v19 = v13;
    id v17 = v8;
    id v18 = *(id *)(a1 + 56);
    [v17 ppt_performBlockAfterNextNavigationAnimation:v14];
  }
}

id sub_100031DF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomIn" forTest:*(void *)(a1 + 40)];
}

void sub_100031E04(uint64_t a1)
{
  [*(id *)(a1 + 32) startedSubTest:@"vkAnalysisReady" forTest:*(void *)(a1 + 40) withMetrics:&off_100068388];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031F1C;
  v8[3] = &unk_1000634D8;
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 88);
  id v9 = v4;
  uint64_t v14 = v5;
  long long v7 = *(_OWORD *)(a1 + 72);
  id v6 = (id)v7;
  long long v13 = v7;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 48);
  [v3 ppt_notifyWhenVKAnalysisIsReadyWithTimeout:v8 handler:10.0];
}

void sub_100031F1C(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"vkAnalysisReady" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000320FC;
  v17[3] = &unk_100063438;
  uint64_t v19 = *(void *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 72);
  id v2 = (id)v11;
  long long v18 = v11;
  id v3 = objc_retainBlock(v17);
  id v4 = *(void **)(a1 + 48);
  if (v4 == *(void **)(a1 + 56))
  {
    id v8 = [v4 popViewControllerAnimated:1];
    id v9 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100032228;
    v12[3] = &unk_100064710;
    id v10 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    long long v7 = &v13;
    id v13 = v10;
    [v9 ppt_installTransitionAnimationCompletionHandler:v12];
    [*(id *)(a1 + 56) ppt_performBlockAfterNextNavigationAnimation:v3];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 64);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000321D8;
    v14[3] = &unk_100062AC8;
    id v6 = *(void **)(a1 + 40);
    void v14[4] = *(void *)(a1 + 32);
    long long v7 = &v15;
    id v15 = v6;
    id v16 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v14];
  }
}

void sub_1000320FC(uint64_t a1)
{
  BOOL v2 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 48);
  dispatch_time_t v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003223C;
  v4[3] = &unk_100063410;
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
}

uint64_t sub_1000321D8(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

id sub_100032228(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
}

uint64_t sub_10003223C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100032358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100032370(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 px_descendantViewControllerWithClass:objc_opt_class()];

  if (v4)
  {
    [v3 px_descendantViewControllerWithClass:objc_opt_class()];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "ppt_dismiss"))
    {
      dispatch_time_t v6 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100032700;
      block[3] = &unk_100063AC8;
      id v37 = v5;
      uint64_t v39 = *(void *)(a1 + 48);
      long long v38 = *(_OWORD *)(a1 + 32);
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Unable to dismiss to home"];
    }
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    id v8 = [v7 navigationController];
    [*(id *)(a1 + 32) startedCurrentTest];
    id v9 = *(void **)(a1 + 32);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    void v30[2] = sub_100032850;
    v30[3] = &unk_100062E68;
    id v31 = v7;
    long long v32 = v9;
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v34 = *(void *)(a1 + 40);
    uint64_t v35 = v10;
    id v33 = v8;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100032AA4;
    v29[3] = &unk_1000646C0;
    void v29[4] = v9;
    id v11 = v8;
    id v5 = v7;
    [v9 ppt_startIterationWithBlock:v30 completion:v29];

LABEL_7:
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v3;
    id v13 = [v12 navigationController];
    uint64_t v14 = [v12 viewModel];
    id v15 = [v14 currentDataSource];

    [*(id *)(a1 + 32) startedCurrentTest];
    id v16 = *(void **)(a1 + 32);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100032AAC;
    v22[3] = &unk_100063578;
    id v23 = v15;
    id v24 = v16;
    id v25 = v12;
    id v26 = v13;
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v28 = v17;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100032D6C;
    v21[3] = &unk_1000646C0;
    void v21[4] = v16;
    id v18 = v13;
    id v19 = v12;
    id v20 = v15;
    [v16 ppt_startIterationWithBlock:v22 completion:v21];
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTest];
  }
LABEL_8:
}

void sub_100032700(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) viewProvider];
  id v3 = [v2 viewModel];
  id v4 = [v3 currentDataSource];

  [*(id *)(a1 + 40) startedCurrentTest];
  id v5 = *(void **)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000339FC;
  v11[3] = &unk_100062E68;
  id v12 = v4;
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v9.i64[0];
  int8x16_t v13 = vextq_s8(v9, v9, 8uLL);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033CA4;
  v10[3] = &unk_1000646C0;
  void v10[4] = *(void *)(a1 + 40);
  id v8 = v4;
  [v5 ppt_startIterationWithBlock:v11, completion:v10];
}

void sub_100032850(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) collectionListFetchResult];
  id v5 = [v4 lastObject];

  id v6 = [*(id *)(a1 + 32) assetsInAssetCollection:v5];
  if ([*(id *)(a1 + 32) initiallyScrolledToBottom]) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  uint64_t v30 = 0;
  unsigned int v8 = [*(id *)(a1 + 32) initiallyScrolledToBottom];
  int8x16_t v9 = 0;
  if (v8) {
    int8x16_t v9 = (char *)[v6 count] - 1;
  }
  uint64_t v30 = v9;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  uint64_t v10 = *(void **)(a1 + 40);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100033578;
  v19[3] = &unk_100063550;
  id v24 = v29;
  id v11 = v6;
  id v20 = v11;
  uint64_t v26 = v7;
  int8x16_t v15 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v15.i64[0];
  int8x16_t v21 = vextq_s8(v15, v15, 8uLL);
  id v13 = v5;
  id v22 = v13;
  id v23 = *(id *)(a1 + 48);
  id v25 = v28;
  uint64_t v27 = *(void *)(a1 + 64);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100033774;
  v16[3] = &unk_100062F30;
  uint64_t v18 = *(void *)(a1 + 56);
  id v14 = v3;
  id v17 = v14;
  [v10 ppt_startIterationWithBlock:v19 completion:v16];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
}

void sub_100032A80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_100032AA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100032AAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) lastAssetCollection];
  id v5 = objc_alloc((Class)PXAssetCollectionReference);
  long long v6 = PXSimpleIndexPathNull[1];
  long long v34 = PXSimpleIndexPathNull[0];
  long long v35 = v6;
  id v7 = [v5 initWithAssetCollection:v4 keyAssetReference:0 indexPath:&v34];
  long long v34 = 0u;
  long long v35 = 0u;
  unsigned int v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 indexPathForAssetCollectionReference:v7];
    unsigned int v8 = *(void **)(a1 + 32);
  }
  long long v32 = v34;
  long long v33 = v35;
  int8x16_t v9 = [v8 assetsInSectionIndexPath:&v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 keyAssetsAtEnd])
  {
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = &v32;
    long long v33 = 0x2020000000uLL;
    uint64_t v10 = (char *)[v9 count] - 1;
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v10 = 0;
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = &v32;
    long long v33 = 0x2020000000uLL;
    uint64_t v11 = 1;
  }
  *((void *)&v33 + 1) = v10;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  id v12 = *(void **)(a1 + 40);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100032D74;
  v21[3] = &unk_100063550;
  uint64_t v27 = &v32;
  id v13 = v9;
  uint64_t v29 = v11;
  uint64_t v14 = *(void *)(a1 + 40);
  int8x16_t v15 = *(void **)(a1 + 48);
  id v22 = v13;
  uint64_t v23 = v14;
  id v24 = v15;
  id v16 = v4;
  id v25 = v16;
  uint64_t v28 = v31;
  uint64_t v30 = *(void *)(a1 + 72);
  id v26 = *(id *)(a1 + 56);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100032F10;
  v18[3] = &unk_100062F30;
  uint64_t v20 = *(void *)(a1 + 64);
  id v17 = v3;
  id v19 = v17;
  [v12 ppt_startIterationWithBlock:v21, v18];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);
}

void sub_100032D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100032D6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100032D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v4 >= (uint64_t)[*(id *)(a1 + 32) count]
    || (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) & 0x8000000000000000) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3[2](v3, 1);
  }
  else
  {
    long long v6 = (void *)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += *(void *)(a1 + 88);
    id v7 = [*(id *)(a1 + 40) currentTestName];
    [*(id *)(a1 + 40) pu_startedAnimationSubTest:@"ZoomIn" forTest:v7];
    unsigned int v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100032F44;
    v12[3] = &unk_100063528;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v8;
    id v14 = v7;
    uint64_t v10 = *(void *)(a1 + 96);
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v18 = v10;
    id v16 = v3;
    id v15 = *(id *)(a1 + 64);
    id v11 = v7;
    [v13 ppt_navigateToAsset:v6 inAssetContainer:v9 revealInOneUp:1 completionHandler:v12];
  }
}

uint64_t sub_100032F10(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100032F44(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v6 = [*(id *)(a1 + 32) _oneUpViewControllerForViewController:*(void *)(a1 + 40)];
  uint64_t v7 = [v6 navigationController];
  unsigned int v8 = (void *)v7;
  if (a2 != 1 || (v6 ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), v9))
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Failed to navigate to one up view with error %@", v5];
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100033114;
    v21[3] = &unk_100064710;
    void v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    [v8 ppt_installTransitionAnimationCompletionHandler:v21];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100033128;
    v14[3] = &unk_100063500;
    void v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 80);
    id v16 = v10;
    uint64_t v20 = v11;
    long long v13 = *(_OWORD *)(a1 + 64);
    id v12 = (id)v13;
    long long v19 = v13;
    id v17 = v8;
    id v18 = *(id *)(a1 + 56);
    [v17 ppt_performBlockAfterNextNavigationAnimation:v14];
  }
}

id sub_100033114(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomIn" forTest:*(void *)(a1 + 40)];
}

void sub_100033128(uint64_t a1)
{
  [*(id *)(a1 + 32) startedSubTest:@"TimeToSharp" forTest:*(void *)(a1 + 40) withMetrics:&off_100068370];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033240;
  v8[3] = &unk_1000634D8;
  BOOL v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 88);
  id v9 = v4;
  uint64_t v14 = v5;
  long long v7 = *(_OWORD *)(a1 + 72);
  id v6 = (id)v7;
  long long v13 = v7;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 48);
  [v3 ppt_notifyWhenFullQualityIsDisplayedWithTimeout:v8 handler:3.0];
}

void sub_100033240(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"TimeToSharp" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100033420;
  v17[3] = &unk_100063438;
  uint64_t v19 = *(void *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 72);
  id v2 = (id)v11;
  long long v18 = v11;
  id v3 = objc_retainBlock(v17);
  id v4 = *(void **)(a1 + 48);
  if (v4 == *(void **)(a1 + 56))
  {
    id v8 = [v4 popViewControllerAnimated:1];
    id v9 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003354C;
    v12[3] = &unk_100064710;
    id v10 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    long long v7 = &v13;
    id v13 = v10;
    [v9 ppt_installTransitionAnimationCompletionHandler:v12];
    [*(id *)(a1 + 56) ppt_performBlockAfterNextNavigationAnimation:v3];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 64);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000334FC;
    v14[3] = &unk_100062AC8;
    id v6 = *(void **)(a1 + 40);
    void v14[4] = *(void *)(a1 + 32);
    long long v7 = &v15;
    id v15 = v6;
    id v16 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v14];
  }
}

void sub_100033420(uint64_t a1)
{
  BOOL v2 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 48);
  dispatch_time_t v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033560;
  v4[3] = &unk_100063410;
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
}

uint64_t sub_1000334FC(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

id sub_10003354C(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
}

uint64_t sub_100033560(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100033578(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v4 >= (unint64_t)[*(id *)(a1 + 32) count]
    || (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) & 0x8000000000000000) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3[2](v3, 1);
  }
  else
  {
    BOOL v6 = (void *)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += *(void *)(a1 + 88);
    long long v7 = [*(id *)(a1 + 40) currentTestName];
    [*(id *)(a1 + 40) pu_startedAnimationSubTest:@"ZoomIn" forTest:v7];
    [*(id *)(a1 + 48) navigateToPhoto:v6 inAssetContainer:*(void *)(a1 + 56) animated:1];
    id v8 = *(void **)(a1 + 64);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000337A8;
    v21[3] = &unk_100064710;
    void v21[4] = *(void *)(a1 + 40);
    id v9 = v7;
    id v22 = v9;
    [v8 ppt_installTransitionAnimationCompletionHandler:v21];
    id v10 = *(void **)(a1 + 64);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000337BC;
    void v15[3] = &unk_100062E40;
    void v15[4] = *(void *)(a1 + 40);
    id v16 = v9;
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 80);
    id v17 = v11;
    uint64_t v13 = *(void *)(a1 + 96);
    uint64_t v19 = v12;
    uint64_t v20 = v13;
    long long v18 = v3;
    id v14 = v9;
    [v11 ppt_performBlockAfterNextNavigationAnimation:v15];
  }
}

uint64_t sub_100033774(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

id sub_1000337A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomIn" forTest:*(void *)(a1 + 40)];
}

void sub_1000337BC(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) popViewControllerAnimated:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000338F4;
  v11[3] = &unk_100064710;
  dispatch_time_t v3 = *(void **)(a1 + 40);
  unint64_t v4 = *(void **)(a1 + 48);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  [v4 ppt_installTransitionAnimationCompletionHandler:v11];
  uint64_t v5 = *(void **)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033908;
  v8[3] = &unk_100063438;
  uint64_t v10 = *(void *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v7;
  long long v9 = v7;
  [v5 ppt_performBlockAfterNextNavigationAnimation:v8];
}

id sub_1000338F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
}

void sub_100033908(uint64_t a1)
{
  BOOL v2 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 48);
  dispatch_time_t v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000339E4;
  v4[3] = &unk_100063410;
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
}

uint64_t sub_1000339E4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_1000339FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) lastAssetCollection];
  id v5 = objc_alloc((Class)PXAssetCollectionReference);
  long long v6 = PXSimpleIndexPathNull[1];
  long long v33 = PXSimpleIndexPathNull[0];
  long long v34 = v6;
  id v7 = [v5 initWithAssetCollection:v4 keyAssetReference:0 indexPath:&v33];
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 indexPathForAssetCollectionReference:v7];
    id v8 = *(void **)(a1 + 32);
  }
  long long v31 = v33;
  long long v32 = v34;
  long long v9 = [v8 assetsInSectionIndexPath:&v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 keyAssetsAtEnd])
  {
    *(void *)&long long v31 = 0;
    *((void *)&v31 + 1) = &v31;
    long long v32 = 0x2020000000uLL;
    uint64_t v10 = (char *)[v9 count] - 1;
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v10 = 0;
    *(void *)&long long v31 = 0;
    *((void *)&v31 + 1) = &v31;
    long long v32 = 0x2020000000uLL;
    uint64_t v11 = 1;
  }
  *((void *)&v32 + 1) = v10;
  v30[0] = 0;
  v30[1] = v30;
  void v30[2] = 0x2020000000;
  v30[3] = 0;
  id v12 = *(void **)(a1 + 40);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100033CAC;
  v21[3] = &unk_1000634B0;
  id v26 = &v31;
  id v13 = v9;
  uint64_t v28 = v11;
  uint64_t v14 = *(void *)(a1 + 40);
  id v15 = *(void **)(a1 + 48);
  id v22 = v13;
  uint64_t v23 = v14;
  id v24 = v15;
  id v16 = v4;
  id v25 = v16;
  uint64_t v27 = v30;
  uint64_t v29 = *(void *)(a1 + 64);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100033E34;
  v18[3] = &unk_100062F30;
  uint64_t v20 = *(void *)(a1 + 56);
  id v17 = v3;
  id v19 = v17;
  [v12 ppt_startIterationWithBlock:v21 completion:v18];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);
}

void sub_100033C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100033CA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100033CAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v4 >= (uint64_t)[*(id *)(a1 + 32) count]
    || (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) & 0x8000000000000000) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3[2](v3, 1);
  }
  else
  {
    long long v6 = (void *)v5;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += *(void *)(a1 + 80);
    id v7 = [*(id *)(a1 + 40) currentTestName];
    [*(id *)(a1 + 40) pu_startedAnimationSubTest:@"ZoomIn" forTest:v7];
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100033E68;
    v12[3] = &unk_100063488;
    v12[4] = *(void *)(a1 + 40);
    id v13 = v8;
    id v14 = v7;
    uint64_t v10 = *(void *)(a1 + 88);
    uint64_t v16 = *(void *)(a1 + 72);
    uint64_t v17 = v10;
    id v15 = v3;
    id v11 = v7;
    [v13 ppt_navigateToAsset:v6 inAssetContainer:v9 revealInOneUp:1 completionHandler:v12];
  }
}

uint64_t sub_100033E34(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100033E68(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v6 = [*(id *)(a1 + 32) _oneUpViewControllerForViewController:*(void *)(a1 + 40)];
  uint64_t v7 = [v6 navigationController];
  id v8 = (void *)v7;
  if (a2 != 1 || (v6 ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), v9))
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Failed to navigate to one up view with error %@", v5];
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100034010;
    v19[3] = &unk_100064710;
    void v19[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    [v8 ppt_installTransitionAnimationCompletionHandler:v19];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100034024;
    v14[3] = &unk_100062E40;
    void v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 72);
    id v16 = v10;
    uint64_t v18 = v11;
    long long v13 = *(_OWORD *)(a1 + 56);
    id v12 = (id)v13;
    long long v17 = v13;
    [v8 ppt_performBlockAfterNextNavigationAnimation:v14];
  }
}

id sub_100034010(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomIn" forTest:*(void *)(a1 + 40)];
}

void sub_100034024(uint64_t a1)
{
  [*(id *)(a1 + 32) startedSubTest:@"TimeToSharp" forTest:*(void *)(a1 + 40) withMetrics:&off_100068358];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100034114;
  v8[3] = &unk_100063460;
  BOOL v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 72);
  id v9 = v4;
  uint64_t v12 = v5;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v7;
  long long v11 = v7;
  id v10 = *(id *)(a1 + 48);
  [v3 ppt_notifyWhenFullQualityIsDisplayedWithTimeout:v8 handler:3.0];
}

void sub_100034114(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"TimeToSharp" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100034264;
  v11[3] = &unk_100063438;
  uint64_t v13 = *(void *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  id v2 = (id)v7;
  long long v12 = v7;
  id v3 = objc_retainBlock(v11);
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100034340;
  v8[3] = &unk_100062AC8;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  [v5 dismissViewControllerAnimated:1 completion:v8];
}

void sub_100034264(uint64_t a1)
{
  BOOL v2 = ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 48);
  dispatch_time_t v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034390;
  v4[3] = &unk_100063410;
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
}

uint64_t sub_100034340(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"ZoomOut" forTest:*(void *)(a1 + 40)];
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t sub_100034390(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

id sub_1000344D0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100073370;
  uint64_t v7 = qword_100073370;
  if (!qword_100073370)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100035060;
    v3[3] = &unk_1000643A0;
    v3[4] = &v4;
    sub_100035060((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10003459C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000345B4(uint64_t a1)
{
  [*(id *)(a1 + 32) startedCurrentTest];
  BOOL v2 = [*(id *)(a1 + 32) currentTestName];
  dispatch_time_t v3 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(a1 + 40)];
  uint64_t v4 = [&off_100068340 objectEnumerator];
  id v5 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100034770;
  v13[3] = &unk_1000633C0;
  id v14 = v4;
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  id v17 = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 64);
  uint64_t v18 = v6;
  id v19 = v7;
  id v20 = *(id *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000348C0;
  v11[3] = &unk_100064710;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  id v8 = v2;
  id v9 = v3;
  id v10 = v4;
  [v5 ppt_startIterationWithBlock:v13 completion:v11];
}

void sub_100034770(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) nextObject];
  if (v4)
  {
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:@"transition"];
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100034904;
    v10[3] = &unk_100063398;
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = *(void **)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 88);
    void v10[4] = v8;
    id v11 = v9;
    id v12 = v4;
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 80);
    id v15 = v3;
    [v6 prepareForTransitionTestWithName:v5 options:v7 readyHandler:v10];
  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

id sub_1000348C0(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedCurrentTest];
  BOOL v2 = *(void **)(a1 + 40);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

void sub_100034904(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"PhotosApplication-Testing.m", 1742, @"unexpected class %@", v6 object file lineNumber description];
    }
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  id v26 = 0;
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"iterations"];
  id v8 = [v7 integerValue];

  id v26 = v8;
  id v9 = *(void **)(a1 + 32);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100034B44;
  v17[3] = &unk_100063370;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v18 = v10;
  uint64_t v19 = v11;
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  id v12 = v5;
  id v22 = v12;
  id v13 = v6;
  id v23 = v13;
  id v24 = v25;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100034D18;
  void v15[3] = &unk_100064570;
  id v16 = *(id *)(a1 + 72);
  [v9 ppt_startIterationWithBlock:v17 completion:v15];

  _Block_object_dispose(v25, 8);
}

void sub_100034B2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100034B44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSString stringWithFormat:@"Push-%@", *(void *)(a1 + 32)];
  id v5 = +[NSString stringWithFormat:@"Pop-%@", *(void *)(a1 + 32)];
  [*(id *)(a1 + 40) pu_startedAnimationSubTest:v4 forTest:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) pu_pushViewController:*(void *)(a1 + 64) withTransition:*(void *)(a1 + 72) animated:1 isInteractive:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100034D2C;
  v21[3] = &unk_100062BE0;
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  void v21[4] = *(void *)(a1 + 40);
  id v22 = v4;
  id v23 = v6;
  id v8 = v4;
  [v7 ppt_installTransitionAnimationCompletionHandler:v21];
  id v9 = *(void **)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100034D3C;
  void v15[3] = &unk_100063348;
  void v15[4] = *(void *)(a1 + 40);
  id v16 = v5;
  id v17 = v9;
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 80);
  id v19 = v3;
  uint64_t v20 = v12;
  id v18 = v11;
  id v13 = v3;
  id v14 = v5;
  [v10 ppt_performBlockAfterNextNavigationAnimation:v15];
}

uint64_t sub_100034D18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100034D2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
}

void sub_100034D3C(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034E30;
  block[3] = &unk_100063348;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 64);
  id v4 = (id)v5;
  long long v10 = v5;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100034E30(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) pu_popViewControllerAnimated:1 interactive:0];
  dispatch_time_t v2 = *(void **)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100034F68;
  v9[3] = &unk_100062BE0;
  id v3 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  [v2 ppt_installTransitionAnimationCompletionHandler:v9];
  id v4 = *(void **)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034F78;
  v7[3] = &unk_100062F30;
  long long v6 = *(_OWORD *)(a1 + 64);
  id v5 = (id)v6;
  long long v8 = v6;
  [v4 ppt_performBlockAfterNextNavigationAnimation:v7];
}

id sub_100034F68(uint64_t a1)
{
  return [*(id *)(a1 + 32) pu_finishedAnimationSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
}

void sub_100034F78(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003502C;
  block[3] = &unk_100062F30;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10003502C(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100035060(uint64_t a1)
{
  sub_10002812C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PUTesterPPTBaselineViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100073370 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    dispatch_time_t v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getPUTesterPPTBaselineViewControllerClass(void)_block_invoke"];
    [v2 handleFailureInFunction:v3 file:@"PhotosApplication-Testing.m" lineNumber:172 description:@"Unable to find class %s" v3, @"PUTesterPPTBaselineViewController"];

    __break(1u);
  }
}

void sub_1000351C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v5;
    long long v6 = [v20 browsingSession];
    id v7 = [v6 viewModel];

    long long v8 = [v7 assetsDataSource];
    id v9 = [*(id *)(a1 + 32) currentTestOptions];
    id v10 = [v9 objectForKeyedSubscript:@"maxPhotosCount"];
    id v11 = [v10 integerValue];

    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    id v35 = 0;
    uint64_t v12 = [v9 objectForKeyedSubscript:@"iterations"];
    id v13 = [v12 integerValue];

    id v35 = v13;
    id v14 = +[NSMutableArray arrayWithCapacity:v11];
    if (a3) {
      [v8 lastItemIndexPath];
    }
    else {
    id v16 = [v8 firstItemIndexPath];
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    void v30[2] = sub_100035604;
    v30[3] = &unk_1000632A8;
    id v17 = v8;
    id v31 = v17;
    id v18 = v14;
    id v32 = v18;
    id v33 = v11;
    [v17 enumerateIndexPathsStartingAtIndexPath:v16 reverseDirection:a3 usingBlock:v30];
    if ([v18 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v37 = 0x3032000000;
      long long v38 = sub_100027DEC;
      uint64_t v39 = sub_100027DFC;
      id v40 = 0;
      [*(id *)(a1 + 32) startedCurrentTest];
      id v19 = *(void **)(a1 + 32);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000356A0;
      v22[3] = &unk_1000632F8;
      p_long long buf = &buf;
      id v23 = v18;
      uint64_t v29 = v34;
      id v24 = v17;
      id v25 = v7;
      id v27 = *(id *)(a1 + 40);
      id v26 = v20;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000358D0;
      v21[3] = &unk_1000646C0;
      void v21[4] = *(void *)(a1 + 32);
      [v19 ppt_startIterationWithBlock:v22 completion:v21];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Couldn't find any Live Photo"];
    }

    _Block_object_dispose(v34, 8);
  }
  else
  {
    id v15 = PLPPTGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", (uint8_t *)&buf, 0xCu);
    }

    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Unexpected view controller class"];
  }
}

void sub_1000355CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_100035604(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v5 = [*(id *)(a1 + 32) assetAtIndexPath:];
  if ([v5 playbackStyle] == (id)3)
  {
    [*(id *)(a1 + 40) addObject:v6];
    if ((unint64_t)[*(id *)(a1 + 40) count] >= *(void *)(a1 + 48)) {
      *a3 = 1;
    }
  }
}

void sub_1000356A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) nextObject];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) assetReferenceAtIndexPath:v4];
    id v6 = [*(id *)(a1 + 48) assetsDataSource];
    id v7 = [v6 assetReferenceForAssetReference:v5];

    long long v8 = *(void **)(a1 + 48);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000358D8;
    v20[3] = &unk_100064710;
    id v21 = v8;
    id v22 = v7;
    id v9 = v7;
    [v21 performChanges:v20];
    dispatch_time_t v10 = dispatch_time(0, 500000000);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000358E4;
    void v15[3] = &unk_1000632D0;
    id v18 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 56);
    id v17 = v5;
    id v19 = v3;
    id v11 = v5;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v15);
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 32) objectEnumerator];
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    (*((void (**)(id, void))v3 + 2))(v3, --*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) >> 63);
  }
}

id sub_1000358D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

id sub_1000358D8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
}

void sub_1000358E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 40) asset];
  (*(void (**)(uint64_t, uint64_t, id, void))(v3 + 16))(v3, v2, v4, *(void *)(a1 + 56));
}

void sub_100035BA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

Class sub_100035BC0(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100073388)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_100035EE0;
    void v6[4] = &unk_100062DF0;
    void v6[5] = v6;
    long long v7 = off_100064508;
    uint64_t v8 = 0;
    qword_100073388 = _sl_dlopen();
  }
  if (!qword_100073388)
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:"void *NeutrinoCoreLibrary(void)"];
    [v3 handleFailureInFunction:v4 file:@"PhotosApplication-Testing.m" lineNumber:179 description:@"%s" v6[0]];

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("NUCacheNode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getNUCacheNodeClass(void)_block_invoke"];
    [v3 handleFailureInFunction:v5 file:@"PhotosApplication-Testing.m" lineNumber:180 description:@"Unable to find class %s" @"NUCacheNode"];

LABEL_10:
    __break(1u);
  }
  qword_100073380 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100035DAC(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = +[PHAssetChangeRequest changeRequestForAsset:](PHAssetChangeRequest, "changeRequestForAsset:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v5), (void)v7);
        [v6 setVariationSuggestionStates:0 forVariationType:1];
        [v6 setVariationSuggestionStates:0 forVariationType:3];
        [v6 setVariationSuggestionStates:0 forVariationType:2];

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

uint64_t sub_100035EE0()
{
  uint64_t result = _sl_dlopen();
  qword_100073388 = result;
  return result;
}

void sub_100035FC0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  long long v7 = *(void **)(a1 + 32);
  id v8 = a2;
  long long v9 = [v7 currentTestName];
  [v7 startedSubTest:@"LivePhotoPlayback" forTest:v9 withMetrics:&off_100068328];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000360B0;
  v11[3] = &unk_100063870;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v10 = v6;
  [v8 ppt_playCurrentLivePhotoWithCompletionHandler:v11];
}

uint64_t sub_1000360B0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 finishedSubTest:@"LivePhotoPlayback" forTest:v3];

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void sub_100036190(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036224;
  v6[3] = &unk_100064710;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v5 ppt_executeAfterRender:v6];
}

void sub_100036224(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000362EC;
  v4[3] = &unk_100064710;
  id v1 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = @"LivePhotoInEditPlaybackSubtest";
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100036350;
  v2[3] = &unk_100064710;
  void v2[4] = v5;
  id v3 = @"LivePhotoInEditPlaybackSubtest";
  [v1 ppt_playLivePhotoWithWillBeginPlaybackBlock:v4 didEndPlaybackBlock:v2];
}

void sub_1000362EC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 currentTestName];
  [v1 startedSubTest:v2 forTest:v3 withMetrics:&off_100068310];
}

id sub_100036350(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [v2 currentTestName];
  [v2 finishedSubTest:v3 forTest:v4];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 finishedCurrentTest];
}

void sub_10003644C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000364F4;
  v7[3] = &unk_100062BE0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  [v6 ppt_executeAfterRender:v7];
}

void sub_1000364F4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036598;
  v6[3] = &unk_100062BE0;
  id v3 = v2;
  uint64_t v4 = a1[5];
  uint64_t v5 = (void *)a1[6];
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v3 ppt_selectAdjustmentsController:v6];
}

void sub_100036598(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003664C;
  v4[3] = &unk_100062BE0;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 ppt_scrollBWSlider:v4];
}

id sub_10003664C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _runSelectedSliderTestForViewController:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48)];
}

void sub_1000366F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003679C;
  v7[3] = &unk_100062BE0;
  uint64_t v4 = *(void *)(a1 + 32);
  int8x16_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  [v6 ppt_executeAfterRender:v7];
}

void sub_10003679C(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036840;
  v6[3] = &unk_100062BE0;
  id v3 = v2;
  uint64_t v4 = a1[5];
  int8x16_t v5 = (void *)a1[6];
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v3 ppt_selectAdjustmentsController:v6];
}

void sub_100036840(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000368F4;
  v4[3] = &unk_100062BE0;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 ppt_scrollColorSlider:v4];
}

id sub_1000368F4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _runSelectedSliderTestForViewController:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48)];
}

void sub_10003699C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036A44;
  v7[3] = &unk_100062BE0;
  uint64_t v4 = *(void *)(a1 + 32);
  int8x16_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  [v6 ppt_executeAfterRender:v7];
}

void sub_100036A44(void *a1)
{
  id v2 = (void *)a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036AE8;
  v6[3] = &unk_100062BE0;
  id v3 = v2;
  uint64_t v4 = a1[5];
  int8x16_t v5 = (void *)a1[6];
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v3 ppt_selectAdjustmentsController:v6];
}

void sub_100036AE8(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100036B9C;
  v4[3] = &unk_100062BE0;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 ppt_scrollLightSlider:v4];
}

id sub_100036B9C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _runSelectedSliderTestForViewController:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48)];
}

void sub_100036DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100036DF8(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v3 = +[NSDate date];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    int8x16_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  [*(id *)(a1 + 32) ppt_scrollSelectedSliderByDelta];
  if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 64))
  {
    id v6 = +[NSDate date];
    [v6 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    double v8 = v7;

    [v10 invalidate];
    id v9 = [*(id *)(a1 + 32) ppt_renderStatisticsDictionaryForTimeInterval:v8];
    [*(id *)(a1 + 40) finishedCurrentTestWithExtraResults:v9];
  }
}

void sub_100036F0C(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100036F98;
  v3[3] = &unk_1000646C0;
  uint64_t v4 = a2;
  id v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

void sub_100036F98(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100037014;
  v2[3] = &unk_1000646C0;
  id v3 = v1;
  [v3 ppt_applyAutoenhance:v2];
}

void sub_100037014(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000370BC;
  block[3] = &unk_1000646C0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000370BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_save];
}

void sub_1000370D0(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003715C;
  v3[3] = &unk_1000646C0;
  id v4 = a2;
  dispatch_time_t v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

void sub_10003715C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000371D8;
  v2[3] = &unk_1000646C0;
  id v3 = v1;
  [v3 ppt_selectPerspectiveController:v2];
}

id sub_1000371D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_cancelEdits];
}

void sub_1000371EC(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100037278;
  v3[3] = &unk_1000646C0;
  id v4 = a2;
  dispatch_time_t v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

void sub_100037278(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000372F4;
  v2[3] = &unk_1000646C0;
  id v3 = v1;
  [v3 ppt_selectCropController:v2];
}

id sub_1000372F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_cancelEdits];
}

void sub_100037308(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100037394;
  v3[3] = &unk_1000646C0;
  id v4 = a2;
  dispatch_time_t v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

void sub_100037394(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100037410;
  v2[3] = &unk_1000646C0;
  id v3 = v1;
  [v3 ppt_selectAdjustmentsController:v2];
}

id sub_100037410(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_cancelEdits];
}

void sub_100037424(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000374B0;
  v3[3] = &unk_1000646C0;
  id v4 = a2;
  dispatch_time_t v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

void sub_1000374B0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037534;
  block[3] = &unk_1000646C0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100037534(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000375B0;
  v2[3] = &unk_1000646C0;
  id v3 = v1;
  [v3 ppt_selectNextLightingEffect:v2];
}

id sub_1000375B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_save];
}

void sub_1000375C4(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100037650;
  v3[3] = &unk_1000646C0;
  id v4 = a2;
  id v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

void sub_100037650(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000376CC;
  v2[3] = &unk_1000646C0;
  id v3 = v1;
  [v3 ppt_selectFiltersController:v2];
}

id sub_1000376CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_cancelEdits];
}

void sub_1000376E0(id a1, PUPhotoEditViewController *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003776C;
  v3[3] = &unk_1000646C0;
  id v4 = a2;
  id v2 = v4;
  [(PUPhotoEditViewController *)v2 ppt_executeAfterRender:v3];
}

id sub_10003776C(uint64_t a1)
{
  return [*(id *)(a1 + 32) ppt_cancelEdits];
}

void sub_100037780(id a1, PUPhotoEditViewController *a2)
{
}

void sub_100037890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000378A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startedCurrentTest];
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000379BC;
  v9[3] = &unk_100063098;
  id v10 = v3;
  id v11 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v12 = v5;
  uint64_t v13 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037AE8;
  v8[3] = &unk_1000646C0;
  void v8[4] = *(void *)(a1 + 32);
  id v7 = v3;
  [v4 ppt_startIterationWithBlock:v9 completion:v8];
}

void sub_1000379BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) ppt_overOneUpPresentationSession];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v5 currentTestName];
  [v5 pu_startedAnimationSubTest:@"Enter" forTest:v6];

  [v4 ppt_presentPhotoEditor];
  id v7 = [*(id *)(a1 + 32) navigationController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100037AF0;
  v13[3] = &unk_100063070;
  double v8 = *(void **)(a1 + 48);
  void v13[4] = *(void *)(a1 + 40);
  id v14 = v7;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 56);
  id v16 = v3;
  uint64_t v17 = v10;
  id v15 = v9;
  id v11 = v3;
  id v12 = v7;
  [v12 ppt_performBlockAfterNextNavigationAnimation:v13];
}

id sub_100037AE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100037AF0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 pu_finishedAnimationSubTest:@"Enter" forTest:v3];

  id v4 = [*(id *)(a1 + 40) topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 currentTestName];
    [v5 pu_startedAnimationSubTest:@"Exit" forTest:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100037C4C;
    v10[3] = &unk_100063A50;
    id v7 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 56);
    id v8 = (id)v9;
    long long v11 = v9;
    [v7 ppt_performBlockAfterNextNavigationAnimation:v10];
  }
  else
  {
    NSLog(@"navigation to photo editor failed");
    [*(id *)(a1 + 32) failedCurrentTest];
  }
}

uint64_t sub_100037C4C(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = [v2 currentTestName];
  [v2 pu_finishedAnimationSubTest:@"Exit" forTest:v3];

  --*(void *)(*(void *)(a1[6] + 8) + 24);
  id v4 = *(uint64_t (**)(void))(a1[5] + 16);

  return v4();
}

void sub_100037E40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"iterations"];
  [v4 integerValue];
  id v6 = *(id *)(a1 + 32);
  id v5 = v3;
  PXIterateAsynchronously();
}

void sub_100037F68(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] browsingSession];
  id v5 = [v4 viewModel];

  id v6 = [v5 assetsDataSource];
  id v7 = [v5 currentAssetReference];
  id v8 = [v6 indexPathForAssetReference:v7];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100027DEC;
  id v26 = sub_100027DFC;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000381C4;
  v19[3] = &unk_100063020;
  id v9 = v8;
  id v20 = v9;
  id v21 = &v22;
  [v6 enumerateIndexPathsStartingAtIndexPath:v9 reverseDirection:0 usingBlock:v19];
  if (v23[5])
  {
    uint64_t v10 = [v6 assetReferenceAtIndexPath:];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100038240;
    id v16 = &unk_100064710;
    id v17 = v5;
    id v11 = v10;
    id v18 = v11;
    [v17 performChanges:&v13];
  }
  id v12 = [a1[5] objectForKey:@"documentMenuActions" v13, v14, v15, v16];

  if (v12) {
    [a1[6] _runLoadOneUpDocumentMenuActionsSubTest:a1[4]];
  }
  [v3 next];

  _Block_object_dispose(&v22, 8);
}

void sub_1000381A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000381BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_1000381C4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (*(id *)(a1 + 32) != v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v6 = v7;
    *a3 = 1;
  }
}

id sub_100038240(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
}

id sub_1000382EC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _runSharingTest:@"ScrollShareSheetNatural" withActivityType:0];
}

void sub_1000383F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 ppt_overOneUpPresentationSession];
  [*(id *)(a1 + 32) startedCurrentTest];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSNotificationCenter defaultCenter];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000385DC;
  v18[3] = &unk_100062F80;
  void v18[4] = v19;
  [v5 installNotificationObserverForNotificationName:v6 notificationName:@"AddedNextButton" forOneNotification:1 usingBlock:v18];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 currentTestName];
  [v7 pu_startedAnimationSubTest:@"ShareSheetPresentation" forTest:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000385F0;
  v12[3] = &unk_100062FD0;
  id v9 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  id v11 = v3;
  id v15 = v11;
  id v16 = *(id *)(a1 + 48);
  id v17 = v19;
  [v10 ppt_presentShareSheetWithCompletion:v12];

  _Block_object_dispose(v19, 8);
}

void sub_1000385C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000385DC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_1000385F0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 pu_finishedAnimationSubTest:@"ShareSheetPresentation" forTest:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000387A8;
  v17[3] = &unk_100062FA8;
  uint64_t v6 = *(void *)(a1 + 40);
  void v17[4] = *(void *)(a1 + 32);
  id v18 = *(id *)(a1 + 48);
  [v4 installNotificationObserverForNotificationName:v5 notificationName:v6 forOneNotification:1 usingBlock:v17];

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_10003883C;
  id v12 = &unk_100062CF8;
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 64);
  id v7 = objc_retainBlock(&v9);
  id v8 = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    [*(id *)(a1 + 48) ppt_tapNextButton:v7, v9, v10, v11, v12, v13, v14, v15];
  }
  else {
    ((void (*)(void ***))v7[2])(v7);
  }
}

id sub_1000387A8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 finishedSubTest:@"Sharing" forTest:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 currentTestName];
  [v4 pu_finishedAnimationSubTest:@"Sharing" forTest:v5];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);

  return _[v6 tearDownSharingTest:v7];
}

id sub_10003883C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 currentTestName];
  [v2 startedSubTest:@"Sharing" forTest:v3 withMetrics:&off_1000682F8];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 currentTestName];
  [v4 pu_startedAnimationSubTest:@"Sharing" forTest:v5];

  uint64_t v6 = [*(id *)(a1 + 32) currentTestName];
  unsigned __int8 v7 = [v6 isEqualToString:@"ScrollShareSheetNatural"];

  id v8 = [*(id *)(a1 + 32) currentTestName];
  unsigned int v9 = [v8 isEqualToString:@"ScrollShareSheetCarousel"];

  if (v9) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  if ((v7 & 1) == 0 && !v9)
  {
    if (*(void *)(a1 + 56))
    {
      id v11 = *(void **)(a1 + 48);
      return [v11 ppt_shareUsingActivityOfType:];
    }
    else
    {
      id v18 = *(void **)(a1 + 32);
      return [v18 failedCurrentTestWithFailure:@"Code which should be unreachable has been reached."];
    }
  }
  id v12 = *(void **)(a1 + 40);
  if (!v12)
  {
    uint64_t v19 = 0;
    return [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"OneUpViewController:%@ is nil or has not appeared yet.", v19];
  }
  if ([v12 _appearState] != 2)
  {
    uint64_t v19 = *(void *)(a1 + 40);
    return [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"OneUpViewController:%@ is nil or has not appeared yet.", v19];
  }
  [*(id *)(a1 + 48) ppt_activityViewController];
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    char v20 = *(void **)(a1 + 32);
    CFStringRef v21 = @"ActivityViewController is nil";
LABEL_24:
    uint64_t v13 = (uint64_t)[v20 failedCurrentTestWithFailure:v21];
    goto LABEL_25;
  }
  if (!+[PhotosTestingRPTHelper isRPTAvailable])
  {
    char v20 = *(void **)(a1 + 32);
    CFStringRef v21 = @"RecapPerformanceTesting FWS is not available.";
    goto LABEL_24;
  }
  uint64_t v13 = objc_opt_respondsToSelector();
  id v14 = v23;
  if (v13)
  {
    id v15 = *(void **)(a1 + 32);
    id v16 = v23;
    id v17 = [v15 currentTestName];
    [v16 runScrollingTestWithName:v17 type:v10 completionHandler:0];

LABEL_25:
    id v14 = v23;
  }

  return (id)_objc_release_x1(v13, v14);
}

void sub_100038B18(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100038BAC;
  v4[3] = &unk_100064710;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_100038BAC(uint64_t a1)
{
  [*(id *)(a1 + 32) ppt_cancelActivity];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100038C30;
  v4[3] = &unk_1000646C0;
  id v2 = *(void **)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [v2 ppt_dismissShareSheetWithCompletion:v4];
}

id sub_100038C30(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100038D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100038D30(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) startedCurrentTest];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100038E20;
  v8[3] = &unk_100063780;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100038EE8;
  v7[3] = &unk_1000646C0;
  void v7[4] = v5;
  id v6 = v3;
  [v5 ppt_startIterationWithBlock:v8, v7];
}

void sub_100038E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) ppt_overOneUpPresentationSession];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100038EF0;
  v8[3] = &unk_100063A50;
  uint64_t v5 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v5;
  id v9 = v4;
  id v6 = v3;
  id v7 = v4;
  [v7 ppt_presentShareSheetWithCompletion:v8];
}

id sub_100038EE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_100038EF0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100038F88;
  v4[3] = &unk_100062F30;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  [v1 ppt_dismissShareSheetWithCompletion:v4];
}

uint64_t sub_100038F88(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100039028(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 browsingSession];
  id v7 = [v6 viewModel];

  id v8 = [v7 assetsDataSource];
  id v9 = [*(id *)(a1 + 32) currentTestOptions];
  id v10 = [v9 objectForKeyedSubscript:@"maxPhotosCount"];
  id v11 = [v10 integerValue];

  id v12 = [v9 objectForKeyedSubscript:@"offset"];
  uint64_t v13 = (uint64_t)[v12 integerValue];

  if (v13 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13;
  }
  id v15 = +[NSMutableArray arrayWithCapacity:v11];
  if (a3) {
    [v8 lastItemIndexPath];
  }
  else {
  id v16 = [v8 firstItemIndexPath];
  }
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100039408;
  v39[3] = &unk_100062EB8;
  uint64_t v41 = v44;
  uint64_t v42 = v14;
  id v17 = v15;
  id v40 = v17;
  id v43 = v11;
  [v8 enumerateIndexPathsStartingAtIndexPath:v16 reverseDirection:a3 usingBlock:v39];
  if ([v17 count])
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    id v38 = 0;
    id v18 = [v9 objectForKeyedSubscript:@"iterations"];
    id v19 = [v18 integerValue];

    id v38 = v19;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_100027DEC;
    void v35[4] = sub_100027DFC;
    id v36 = 0;
    id v20 = objc_alloc_init((Class)PXStatsCalculator);
    [*(id *)(a1 + 32) startedCurrentTest];
    CFStringRef v21 = *(void **)(a1 + 32);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100039478;
    v27[3] = &unk_100062F08;
    id v33 = v35;
    id v28 = v8;
    id v29 = v7;
    id v30 = v5;
    id v31 = v20;
    long long v34 = v37;
    id v32 = v17;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100039650;
    v24[3] = &unk_100064710;
    id v22 = v31;
    uint64_t v23 = *(void *)(a1 + 32);
    id v25 = v22;
    uint64_t v26 = v23;
    [v21 ppt_startIterationWithBlock:v27 completion:v24];

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
  else
  {
    [*(id *)(a1 + 32) failedCurrentTestWithFailure:@"Couldn't find any photos"];
  }

  _Block_object_dispose(v44, 8);
}

void sub_1000393CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id sub_100039408(id result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*((void *)result + 5) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  if (!(v4 % *((void *)result + 6)))
  {
    id v6 = (id *)result;
    [*((id *)result + 4) addObject:a2];
    uint64_t result = [v6[4] count];
    if (result >= v6[7]) {
      *a3 = 1;
    }
  }
  return result;
}

void sub_100039478(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) nextObject];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) assetReferenceAtIndexPath:v4];
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v7 = v6;
    id v8 = *(void **)(a1 + 40);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000397FC;
    void v19[3] = &unk_100064710;
    id v20 = v8;
    id v21 = v5;
    id v9 = v5;
    [v20 performChanges:v19];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100039804;
    void v15[3] = &unk_100062EE0;
    uint64_t v18 = v7;
    id v10 = *(void **)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v17 = v3;
    [v10 ppt_notifyWhenFullQualityIsDisplayedWithTimeout:v15 handler:2.0];
  }
  else
  {
    unint64_t v11 = --*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v12 = [*(id *)(a1 + 64) objectEnumerator];
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    (*((void (**)(id, unint64_t))v3 + 2))(v3, v11 >> 63);
  }
}

void sub_100039650(uint64_t a1)
{
  id v9 = +[NSMutableDictionary dictionary];
  id v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) count]);
  [v9 setObject:v2 forKeyedSubscript:@"highQualityImage-Latency:count"];

  [*(id *)(a1 + 32) mean];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v9 setObject:v3 forKeyedSubscript:@"highQualityImage-Latency:mean"];

  [*(id *)(a1 + 32) standardDeviation];
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v9 setObject:v4 forKeyedSubscript:@"highQualityImage-Latency:stdev"];

  [*(id *)(a1 + 32) min];
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v9 setObject:v5 forKeyedSubscript:@"highQualityImage-Latency:min"];

  [*(id *)(a1 + 32) max];
  uint64_t v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v9 setObject:v6 forKeyedSubscript:@"highQualityImage-Latency:max"];

  [*(id *)(a1 + 32) mean];
  id v8 = +[NSNumber numberWithDouble:1.0 / v7];
  [v9 setObject:v8 forKeyedSubscript:@"highQualityImage-ImagesPerSecond"];

  [*(id *)(a1 + 40) finishedCurrentTestWithExtraResults:v9];
}

id sub_1000397FC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setCurrentAssetReference:*(void *)(a1 + 40)];
}

void sub_100039804(uint64_t a1, int a2)
{
  if (a2)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    [*(id *)(a1 + 32) addValue:v3 - *(double *)(a1 + 48)];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000398B4;
  block[3] = &unk_100064570;
  id v5 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000398B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10003995C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _runScrubTestWithOneUpViewController:a2 options:*(void *)(a1 + 40)];
}

void sub_100039BBC(uint64_t a1, void *a2)
{
  [a2 ppt_mainScrollView];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v5 = [v4 currentTestName];
    uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"iterations"];
    id v7 = [v6 integerValue];

    [v14 contentSize];
    double v9 = v8;
    [v14 bounds];
    double Width = CGRectGetWidth(v16);
    [v14 _interpageSpacing];
    double v12 = v9 / (Width + v11);
    if ((uint64_t)v12 >= 10) {
      uint64_t v13 = 10;
    }
    else {
      uint64_t v13 = (uint64_t)v12;
    }
    [v14 pu_ppt_performPageSwipeTest:v5 iterations:v7 numberOfPages:v13 scrollAxis:1];
  }
  else
  {
    [v4 failedCurrentTest];
  }
}

void sub_100039D6C(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [*(id *)(a1 + 32) objectForKey:@"openInfoPanel"];

  if (v3)
  {
    [v5 ppt_toggleAccessoryView];
    uint64_t v4 = [v5 view];
    [v4 layoutIfNeeded];
  }
  [*(id *)(a1 + 40) _runScrollTestWithOneUpViewController:v5 options:*(void *)(a1 + 32)];
}

void sub_10003A110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A128(uint64_t a1)
{
  [*(id *)(a1 + 32) ppt_toggleAccessoryView];
  dispatch_time_t v2 = dispatch_time(0, 1000000 * *(void *)(a1 + 64));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A200;
  block[3] = &unk_100062E90;
  double v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = v5;
  id v8 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10003A200(uint64_t a1)
{
  [*(id *)(a1 + 32) startedCurrentTest];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003A308;
  v6[3] = &unk_100062E68;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = v4;
  id v8 = v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A414;
  v5[3] = &unk_1000646C0;
  void v5[4] = *(void *)(a1 + 32);
  [v2 ppt_startIterationWithBlock:v6 completion:v5];
}

void sub_10003A308(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:@"RevealRelatedTransition" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) ppt_toggleAccessoryView];
  dispatch_time_t v4 = dispatch_time(0, 1000000 * *(void *)(a1 + 64));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A41C;
  v9[3] = &unk_100062E40;
  uint64_t v5 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = v7;
  id v11 = v6;
  id v12 = v3;
  id v8 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v9);
}

id sub_10003A414(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_10003A41C(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"RevealRelatedTransition" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) pu_startedAnimationSubTest:@"HideRelatedTransition" forTest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) ppt_toggleAccessoryView];
  dispatch_time_t v2 = dispatch_time(0, 1000000 * *(void *)(a1 + 72));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A51C;
  block[3] = &unk_100064440;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v8 = v5;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10003A51C(uint64_t a1)
{
  [*(id *)(a1 + 32) pu_finishedAnimationSubTest:@"HideRelatedTransition" forTest:*(void *)(a1 + 40)];
  --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  dispatch_time_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

id sub_10003A644(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _oneUpDetailsTransitionWith:a2 testOptions:*(void *)(a1 + 40)];
}

uint64_t sub_10003A79C()
{
  return PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview();
}

id sub_10003A870(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureLibraryFilterModeWithTestOptions:*(void *)(a1 + 40)];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A8FC;
  v4[3] = &unk_100062DD0;
  void v4[4] = v2;
  return [v2 _navigateToAssetInOneUpPreferLocationAndFace:1 forCurrentTest:v4];
}

void sub_10003A8FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 browsingSession];
  long long v5 = [v4 viewModel];
  id v6 = [v5 assetsDataSource];
  unsigned __int8 v7 = [v6 isEmpty];

  long long v8 = *(void **)(a1 + 32);
  if (v7)
  {
    [v8 failedCurrentTest];
  }
  else
  {
    [v8 startedCurrentTest];
    [v3 ppt_toggleAccessoryView];
    uint64_t v9 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003A9E8;
    v10[3] = &unk_1000646C0;
    void v10[4] = v9;
    [v9 installCACommitCompletionBlock:v10];
  }
}

id sub_10003A9E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedCurrentTest];
}

void sub_10003AD04(uint64_t a1, void *a2)
{
  id v3 = [a2 viewProvider];
  id v4 = [v3 viewModel];
  id v5 = *(id *)(a1 + 56);
  if (v5 == [v4 zoomLevel])
  {
    int64_t v6 = 0;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003AE98;
    v17[3] = &unk_100062D40;
    void v17[4] = *(void *)(a1 + 56);
    [v4 performChanges:v17];
    int64_t v6 = 1000000000;
  }
  unsigned __int8 v7 = [v3 assetsDataSourceManager];
  [v7 performChanges:&stru_100062D80];

  dispatch_time_t v8 = dispatch_time(0, v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AEA4;
  block[3] = &unk_100062CF8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v9;
  id v15 = v10;
  id v16 = *(id *)(a1 + 48);
  id v11 = v3;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10003AE98(uint64_t a1, void *a2)
{
  return _[a2 setZoomLevel:*(void *)(a1 + 32)];
}

void sub_10003AEA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gridView];
  [*(id *)(a1 + 40) ppt_performScrollTest:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 56) gridView:v2 completionHandler:0];
}

void sub_10003AF04(id a1, PXCuratedLibraryMutableAssetsDataSourceManager *a2)
{
}

void sub_10003B174(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _tungstenViewToTestForViewController:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 currentTestName];
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003B238;
  v6[3] = &unk_100062CA8;
  void v6[4] = *(void *)(a1 + 32);
  [v3 ppt_performScrollTest:v4 withOptions:v5 gridView:v2 completionHandler:v6];
}

void sub_10003B238(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) rootViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_10003B318(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) _tungstenViewToTestForViewController:];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) currentTestName];
    [v4 ppt_performScrollTest:v5 withOptions:*(void *)(a1 + 40) gridView:v3 completionHandler:0];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) _scrollViewToTestForViewController:v8];
    if (v5)
    {
      int64_t v6 = *(void **)(a1 + 32);
      unsigned __int8 v7 = [v6 currentTestName];
      [v6 ppt_performScrollTest:v7 withOptions:*(void *)(a1 + 40) scrollView:v5 completionHandler:0];
    }
  }
}

void sub_10003B524(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentTestName];
  id v4 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003B604;
  v6[3] = &unk_100062CD0;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v8 = v3;
  id v9 = *(id *)(a1 + 56);
  id v5 = v2;
  [v4 prepareForScrollTestWithName:v5 options:v8 readyHandler:v6];
}

void sub_10003B604(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003B6A8;
  v6[3] = &unk_100062CA8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 ppt_performScrollTest:v4 withOptions:v5 scrollView:a2 completionHandler:v6];
}

id sub_10003B6A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_10003B7B4(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[NSError px_genericErrorWithDebugDescription:@"Scroll test %@ failed", *(void *)(a1 + 32)];
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10003B954(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  PXPPTDidEndScrollTestOnScrollView();
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void sub_10003BB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003BB1C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void sub_10003BD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003BDD0(void *a1, void *a2, unsigned char *a3)
{
  id v23 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v23;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  id v7 = (void *)a1[4];
  [v23 bounds];
  [v7 convertRect:v23 fromCoordinateSpace:];
  uint64_t isKindOfClass = PXSizeGetArea();
  id v6 = v23;
  double v9 = v8;
  if (v8 <= *(double *)(*(void *)(a1[6] + 8) + 24)) {
    goto LABEL_7;
  }
  id v10 = v23;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    uint64_t v18 = a1[9];
    uint64_t v19 = a1[5];
    id v20 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v20);
    id v21 = [v10 px_descriptionForAssertionMessage];
    [v13 handleFailureInMethod:v18, v19, @"PhotosApplication-Testing.m", 762, @"%@ should be an instance inheriting from %@, but it is %@", @"view", v17, v21 object file lineNumber description];
  }
  else
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    uint64_t v14 = a1[9];
    uint64_t v15 = a1[5];
    id v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    [v13 handleFailureInMethod:v14, v15, @"PhotosApplication-Testing.m", 762, @"%@ should be an instance inheriting from %@, but it is nil", @"view", v17 object file lineNumber description];
  }

LABEL_5:
  uint64_t v11 = *(void *)(a1[7] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  *(double *)(*(void *)(a1[6] + 8) + 24) = v9;
  id v6 = v23;
  if (v9 >= *(double *)(*(void *)(a1[8] + 8) + 24)) {
    *a3 = 1;
  }
LABEL_7:

  return _objc_release_x1(isKindOfClass, v6);
}

void sub_10003C090(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v8 = *(void **)(a1 + 32);
    if (v11)
    {
      [v8 failedCurrentTestWithFailure:@"%@", v11];
    }
    else
    {
      double v9 = +[PXPPTNavigationHelper caseNameStringForPXProgrammaticNavigationResult:a2];
      id v10 = +[NSString stringWithFormat:@"Unable to navigate to destination. No reason was given. ProgrammaticNavigationResult is: %@", v9];
      [v8 failedCurrentTestWithFailure:@"%@", v10];
    }
  }
}

id sub_10003CEF8(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllowImageRequests:*(unsigned __int8 *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 41);

  return [v2 setAllowCaching:v3];
}

id sub_10003CF3C(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setHDRConsideration:v3];
}

id sub_10003CF7C(uint64_t a1)
{
  id v2 = PLPPTGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Performing test with selector:%@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) performSelector:NSSelectorFromString(*(NSString **)(a1 + 32)) withObject:*(void *)(a1 + 48)];
}

id sub_10003D03C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performTestWithBlock:*(void *)(a1 + 40)];
}

void sub_10003D5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_10003D60C(uint64_t a1)
{
  [*(id *)(a1 + 32) failedTest:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_10003D66C(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

id sub_10003D688(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeFibonnaciNumbersForDuration:*(double *)(a1 + 40) + *(double *)(a1 + 48)];
}

void sub_10003D69C(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = *(void **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003D7C8;
    v5[3] = &unk_100062B40;
    void v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v7 = v3;
    uint64_t v8 = v4;
    [v2 installCACommitCompletionBlock:v5];
  }
}

id sub_10003D758(id result)
{
  uint64_t v1 = *(void *)(*((void *)result + 7) + 8);
  if (*(void *)(v1 + 24) == 1)
  {
    id v2 = result;
    uint64_t result = [*((id *)result + 4) finishedSubTest:v2[5] forTest:v2[6]];
    uint64_t v1 = *(void *)(v2[7] + 8);
  }
  *(void *)(v1 + 24) = 2;
  return result;
}

uint64_t sub_10003D7A8(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  }
  return result;
}

id sub_10003D7C8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) startedSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48) withMetrics:&off_1000682E0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

id sub_10003D954(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedTest:*(void *)(a1 + 40)];
}

void sub_10003DC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003DC90(uint64_t a1, void *a2, unsigned char *a3)
{
  id v19 = a2;
  if (([v19 isHidden] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      uint64_t v14 = *(void **)(a1 + 32);
      [v19 bounds];
      [v14 convertRect:v19 fromView:];
      v22.origin.x = v15;
      v22.origin.y = v16;
      v22.size.width = v17;
      v22.size.height = v18;
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      if (CGRectContainsRect(v21, v22))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *a3 = 1;
      }
    }
  }
}

id sub_10003DD8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ppt_extraResults];
  [*(id *)(a1 + 32) ppt_cleanUpAfterTest:*(void *)(a1 + 40) isScrollTest:1];

  return v2;
}

uint64_t sub_10003E0EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void sub_10003E324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10003E348(void *a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    uint64_t v4 = *(void *)(a1[5] + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(a1[6] + 8);
    CGFloat v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    double v8 = *(void (**)(void))(*(void *)(*(void *)(a1[5] + 8) + 40) + 16);
    v8();
  }
}

uint64_t sub_10003E710(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10003EE7C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t sub_10003F090(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t sub_10003F344(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t sub_10003F6E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void sub_10003F870(id a1)
{
  byte_100073398 = +[RPTTestRunner isRecapAvailable];
}

void sub_100040A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100040B08(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) contentModeIsAvailableForNavigation:13];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 navigateToContentMode:13 animated:0 completion:0];
  }
  return result;
}

void sub_100040B7C(id a1, int64_t a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (a2 != 1)
  {
    int v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134218242;
      int64_t v7 = a2;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error navigating to allSharedAlbums destination: result=%ti error=%@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_100040C48(id a1, int64_t a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (a2 != 1)
  {
    int v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134218242;
      int64_t v7 = a2;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error navigating to allAlbums destination: result=%ti error=%@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_100041460(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041560;
    block[3] = &unk_100064710;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100041638;
    v7[3] = &unk_1000646C0;
    void v7[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_100041560(uint64_t a1)
{
  if ([*(id *)(a1 + 32) MSContainsErrorWithDomain:kMSASModelErrorDomain code:5]) {
    uint64_t v2 = 4;
  }
  else {
    uint64_t v2 = 3;
  }
  [*(id *)(a1 + 40) _showAlertForError:v2];
  id v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "ERROR: Failed to subcribe to shared stream %@", (uint8_t *)&v5, 0xCu);
  }
}

id sub_100041638(uint64_t a1)
{
  return [*(id *)(a1 + 32) _navigateToSharedAlbumActivityFeed];
}

void sub_100041910(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = PLPhotoSharingGetLog();
  int64_t v7 = v6;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = [*(id *)(a1 + 32) publicDescription];
      int v10 = 138543362;
      CGFloat v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Succeeded to programmatically navigate to %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v9 = [*(id *)(a1 + 32) publicDescription];
    int v10 = 138543874;
    CGFloat v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to programmatically navigate to %{public}@: result=%ti error=%@", (uint8_t *)&v10, 0x20u);
  }
}

void sub_100041F58(uint64_t a1)
{
  id v3 = +[UIApplication sharedApplication];
  uint64_t v2 = [v3 px_firstKeyWindow];
  [v2 pl_presentViewController:*(void *)(a1 + 32) animated:1];
}

void sub_100041FC4(id a1, UIAlertAction *a2)
{
}

void sub_100041FD8(id a1, UIAlertAction *a2)
{
}

uint64_t AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)()
{
  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
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

uint64_t type metadata accessor for AppShortcutPhraseToken()
{
  return type metadata accessor for AppShortcutPhraseToken();
}

uint64_t AppShortcutOptionsCollection.init(_:title:systemImageName:)()
{
  return AppShortcutOptionsCollection.init(_:title:systemImageName:)();
}

uint64_t AppShortcutParameterPresentation.init<A>(for:summary:optionsCollections:)()
{
  return AppShortcutParameterPresentation.init<A>(for:summary:optionsCollections:)();
}

uint64_t AppShortcutParameterPresentationSummary.init(_:table:)()
{
  return AppShortcutParameterPresentationSummary.init(_:table:)();
}

uint64_t AppShortcutParameterPresentationSummaryString.StringInterpolation.appendInterpolation(_:)()
{
  return AppShortcutParameterPresentationSummaryString.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall AppShortcutParameterPresentationSummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t AppShortcutParameterPresentationSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return AppShortcutParameterPresentationSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t AppShortcutParameterPresentationSummaryString.init(stringInterpolation:)()
{
  return AppShortcutParameterPresentationSummaryString.init(stringInterpolation:)();
}

uint64_t static AppShortcutOptionsCollectionSpecificationBuilder.buildBlock<A>(_:)()
{
  return static AppShortcutOptionsCollectionSpecificationBuilder.buildBlock<A>(_:)();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t AppShortcut.init<A, B, C, D>(intent:phrases:shortTitle:systemImageName:parameterPresentation:)()
{
  return AppShortcut.init<A, B, C, D>(intent:phrases:shortTitle:systemImageName:parameterPresentation:)();
}

uint64_t type metadata accessor for AppShortcut()
{
  return type metadata accessor for AppShortcut();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t DisplayRepresentation.Image.init(systemName:isTemplate:)()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t DisplayRepresentation.Image.init(data:isTemplate:)()
{
  return DisplayRepresentation.Image.init(data:isTemplate:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t IntentParameterSummary.init(_:table:)()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall ParameterSummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t ParameterSummaryString.init(stringInterpolation:)()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t DateComponents.day.setter()
{
  return DateComponents.day.setter();
}

uint64_t DateComponents.year.setter()
{
  return DateComponents.year.setter();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t LocalizedStringResource.init(stringInterpolation:)()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t PXAppIntentsLogger.getter()
{
  return PXAppIntentsLogger.getter();
}

uint64_t type metadata accessor for PXAppDependencyManager()
{
  return type metadata accessor for PXAppDependencyManager();
}

uint64_t type metadata accessor for FeedbackFeatureFlags()
{
  return type metadata accessor for FeedbackFeatureFlags();
}

uint64_t FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)()
{
  return FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)();
}

uint64_t type metadata accessor for FBKSDonation()
{
  return type metadata accessor for FBKSDonation();
}

uint64_t type metadata accessor for FBKSEvaluation.FormResponse()
{
  return type metadata accessor for FBKSEvaluation.FormResponse();
}

uint64_t FBKSEvaluation.formResponse.getter()
{
  return FBKSEvaluation.formResponse.getter();
}

uint64_t type metadata accessor for FBKSEvaluation.Action()
{
  return type metadata accessor for FBKSEvaluation.Action();
}

uint64_t type metadata accessor for FBKSEvaluation.Subject()
{
  return type metadata accessor for FBKSEvaluation.Subject();
}

uint64_t dispatch thunk of FBKSInteraction.extraContent.setter()
{
  return dispatch thunk of FBKSInteraction.extraContent.setter();
}

uint64_t type metadata accessor for FBKSInteraction.FeatureDomain()
{
  return type metadata accessor for FBKSInteraction.FeatureDomain();
}

uint64_t FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)()
{
  return FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalAnnotatedContent:generatedAnnotatedContent:extraContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)();
}

uint64_t FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)()
{
  return FBKSInteraction.AnnotatedContent.init(payload:displayName:description:fileName:group:iconType:additionalInfo:)();
}

uint64_t type metadata accessor for FBKSInteraction.AnnotatedContent.IconType()
{
  return type metadata accessor for FBKSInteraction.AnnotatedContent.IconType();
}

uint64_t type metadata accessor for FBKSInteraction.AnnotatedContent()
{
  return type metadata accessor for FBKSInteraction.AnnotatedContent();
}

uint64_t dispatch thunk of FBKSInteraction.auxiliaryMetrics.setter()
{
  return dispatch thunk of FBKSInteraction.auxiliaryMetrics.setter();
}

uint64_t dispatch thunk of FBKSInteraction.prefillQuestions.setter()
{
  return dispatch thunk of FBKSInteraction.prefillQuestions.setter();
}

uint64_t dispatch thunk of FBKSInteraction.generatedAnnotatedContent.setter()
{
  return dispatch thunk of FBKSInteraction.generatedAnnotatedContent.setter();
}

uint64_t type metadata accessor for FBKSInteraction.Content()
{
  return type metadata accessor for FBKSInteraction.Content();
}

uint64_t type metadata accessor for FBKSInteraction()
{
  return type metadata accessor for FBKSInteraction();
}

uint64_t FBKSForm.Question.init(stringValue:)()
{
  return FBKSForm.Question.init(stringValue:)();
}

uint64_t type metadata accessor for FBKSForm.Question()
{
  return type metadata accessor for FBKSForm.Question();
}

uint64_t dispatch thunk of StoryStatistics.queryUnderstandingStatistics.getter()
{
  return dispatch thunk of StoryStatistics.queryUnderstandingStatistics.getter();
}

uint64_t dispatch thunk of StoryStatistics.memoryStatistics.getter()
{
  return dispatch thunk of StoryStatistics.memoryStatistics.getter();
}

uint64_t type metadata accessor for MemoryLaunchType()
{
  return type metadata accessor for MemoryLaunchType();
}

uint64_t dispatch thunk of MemoryStatistics.isSuggestedPrompt.getter()
{
  return dispatch thunk of MemoryStatistics.isSuggestedPrompt.getter();
}

uint64_t dispatch thunk of MemoryStatistics.generationEntryPoint.getter()
{
  return dispatch thunk of MemoryStatistics.generationEntryPoint.getter();
}

uint64_t dispatch thunk of MemoryStatistics.storyType.getter()
{
  return dispatch thunk of MemoryStatistics.storyType.getter();
}

uint64_t FreeformStoryType.analyticsValue.getter()
{
  return FreeformStoryType.analyticsValue.getter();
}

uint64_t type metadata accessor for FreeformStoryType()
{
  return type metadata accessor for FreeformStoryType();
}

uint64_t dispatch thunk of QueryUnderstandingStatistics.isQueryAmbiguous.getter()
{
  return dispatch thunk of QueryUnderstandingStatistics.isQueryAmbiguous.getter();
}

uint64_t dispatch thunk of QueryUnderstandingStatistics.isModifiedByUser.getter()
{
  return dispatch thunk of QueryUnderstandingStatistics.isModifiedByUser.getter();
}

uint64_t static NonInternalDiagnosticsGenerator.retrievePrompt(for:)()
{
  return static NonInternalDiagnosticsGenerator.retrievePrompt(for:)();
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

uint64_t dispatch thunk of FBKEvaluationController.userDidLike(subject:showFeedbackForm:)()
{
  return dispatch thunk of FBKEvaluationController.userDidLike(subject:showFeedbackForm:)();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidDislike(subject:showFeedbackForm:)()
{
  return dispatch thunk of FBKEvaluationController.userDidDislike(subject:showFeedbackForm:)();
}

uint64_t static FBKEvaluationController.systemImageName(for:hasResponse:)()
{
  return static FBKEvaluationController.systemImageName(for:hasResponse:)();
}

uint64_t dispatch thunk of FBKEvaluationController.userDidReportAConcern(subject:showFeedbackForm:)()
{
  return dispatch thunk of FBKEvaluationController.userDidReportAConcern(subject:showFeedbackForm:)();
}

uint64_t dispatch thunk of FBKEvaluationController.reset()()
{
  return dispatch thunk of FBKEvaluationController.reset()();
}

uint64_t FBKEvaluationController.__allocating_init(delegate:)()
{
  return FBKEvaluationController.__allocating_init(delegate:)();
}

uint64_t type metadata accessor for FBKEvaluationController()
{
  return type metadata accessor for FBKEvaluationController();
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

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
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

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
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

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

Swift::Void __swiftcall CGContextRef.draw(_:in:byTiling:)(CGImageRef _, CGRect in, Swift::Bool byTiling)
{
}

uint64_t PHCollection.title.getter()
{
  return PHCollection.title.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t PHPhotoLibrary.registerObserver(_:block:)()
{
  return PHPhotoLibrary.registerObserver(_:block:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t PHChange.changeDetails<A>(for:)()
{
  return PHChange.changeDetails<A>(for:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PFLocalizedStringWithValidatedFormat()
{
  return _PFLocalizedStringWithValidatedFormat();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return _PFProcessIsLaunchedToExecuteTests();
}

uint64_t PFStringWithValidatedFormat()
{
  return _PFStringWithValidatedFormat();
}

uint64_t PLAppIntentsGetLog()
{
  return _PLAppIntentsGetLog();
}

uint64_t PLBackendGetLog()
{
  return _PLBackendGetLog();
}

uint64_t PLCameraConnectionKitGetLog()
{
  return _PLCameraConnectionKitGetLog();
}

uint64_t PLDisableCPLIfExited()
{
  return _PLDisableCPLIfExited();
}

uint64_t PLHasInternalDiagnostics()
{
  return _PLHasInternalDiagnostics();
}

uint64_t PLHasInternalUI()
{
  return _PLHasInternalUI();
}

uint64_t PLIsChinaSKU()
{
  return _PLIsChinaSKU();
}

uint64_t PLIsCloudPhotoLibraryEnabledForCurrentUser()
{
  return _PLIsCloudPhotoLibraryEnabledForCurrentUser();
}

uint64_t PLIsLockdownMode()
{
  return _PLIsLockdownMode();
}

uint64_t PLLocalizedFrameworkString()
{
  return _PLLocalizedFrameworkString();
}

uint64_t PLMobileSlideShowPhotoLibraryTestingMode()
{
  return _PLMobileSlideShowPhotoLibraryTestingMode();
}

uint64_t PLPPTGetLog()
{
  return _PLPPTGetLog();
}

uint64_t PLPhotoSharingGetLog()
{
  return _PLPhotoSharingGetLog();
}

uint64_t PLPhotosSearchGetLog()
{
  return _PLPhotosSearchGetLog();
}

uint64_t PLPushPhotoLibraryClient()
{
  return _PLPushPhotoLibraryClient();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return _PLServicesLocalizedFrameworkString();
}

uint64_t PLSharedLibraryGetLog()
{
  return _PLSharedLibraryGetLog();
}

uint64_t PLSharingGetLog()
{
  return _PLSharingGetLog();
}

uint64_t PLUIActionsGetLog()
{
  return _PLUIActionsGetLog();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PLUserStatusGetLog()
{
  return _PLUserStatusGetLog();
}

uint64_t PLWindowSceneDelegateGetLog()
{
  return _PLWindowSceneDelegateGetLog();
}

uint64_t PULocalizedString()
{
  return _PULocalizedString();
}

uint64_t PUPhotoEditHandleURLAction()
{
  return _PUPhotoEditHandleURLAction();
}

uint64_t PXAppIntentsAddPendingEditsRequestProviderDependency()
{
  return _PXAppIntentsAddPendingEditsRequestProviderDependency();
}

uint64_t PXAppIntentsAddPersonImageProviderDependency()
{
  return _PXAppIntentsAddPersonImageProviderDependency();
}

uint64_t PXAppIntentsAddPhotoLibraryProviderDependency()
{
  return _PXAppIntentsAddPhotoLibraryProviderDependency();
}

uint64_t PXAppIntentsAddURLNavigationPerformerDependency()
{
  return _PXAppIntentsAddURLNavigationPerformerDependency();
}

uint64_t PXApplicationAudioSessionSetCategory()
{
  return _PXApplicationAudioSessionSetCategory();
}

uint64_t PXAssertGetLog()
{
  return _PXAssertGetLog();
}

uint64_t PXAssetActionTypeForSelectingAssetVariationType()
{
  return _PXAssetActionTypeForSelectingAssetVariationType();
}

uint64_t PXAsynchronousAddBoopFileProviderDomain()
{
  return _PXAsynchronousAddBoopFileProviderDomain();
}

uint64_t PXAsynchronousAddDragAndDropFileProviderDomain()
{
  return _PXAsynchronousAddDragAndDropFileProviderDomain();
}

uint64_t PXCPLIsInTestReadonlyMode()
{
  return _PXCPLIsInTestReadonlyMode();
}

uint64_t PXCPLNumberOfCalendarDaysUntilDate()
{
  return _PXCPLNumberOfCalendarDaysUntilDate();
}

uint64_t PXCloudQuotaUpsellSheetManagerActivationOptionsForSceneConnectionOptions()
{
  return _PXCloudQuotaUpsellSheetManagerActivationOptionsForSceneConnectionOptions();
}

uint64_t PXCuratedLibraryZoomLevelDescription()
{
  return _PXCuratedLibraryZoomLevelDescription();
}

uint64_t PXExists()
{
  return _PXExists();
}

uint64_t PXFetchMomentShareForURL()
{
  return _PXFetchMomentShareForURL();
}

uint64_t PXFilter()
{
  return _PXFilter();
}

uint64_t PXIsCMMURL()
{
  return _PXIsCMMURL();
}

uint64_t PXIsRetailExperienceManagerURL()
{
  return _PXIsRetailExperienceManagerURL();
}

uint64_t PXIsSharedLibraryURL()
{
  return _PXIsSharedLibraryURL();
}

uint64_t PXIterateAsynchronously()
{
  return _PXIterateAsynchronously();
}

uint64_t PXLemonadeAppearanceConfigureIfNeeded()
{
  return _PXLemonadeAppearanceConfigureIfNeeded();
}

uint64_t PXLemonadeViewControllerFactory()
{
  return _PXLemonadeViewControllerFactory();
}

uint64_t PXLocalizedString()
{
  return _PXLocalizedString();
}

uint64_t PXLocalizedStringWithValidatedFormat()
{
  return _PXLocalizedStringWithValidatedFormat();
}

uint64_t PXMomentSharePresentRetryAlertForFetchFailure()
{
  return _PXMomentSharePresentRetryAlertForFetchFailure();
}

uint64_t PXPPTDidEndScrollTestOnScrollView()
{
  return _PXPPTDidEndScrollTestOnScrollView();
}

uint64_t PXPPTDidEndTest()
{
  return _PXPPTDidEndTest();
}

uint64_t PXPPTWillBeginScrollTestOnScrollView()
{
  return _PXPPTWillBeginScrollTestOnScrollView();
}

uint64_t PXPPTWillStartTest()
{
  return _PXPPTWillStartTest();
}

uint64_t PXPhotosApplicationStartedLaunchingForTesting()
{
  return _PXPhotosApplicationStartedLaunchingForTesting();
}

uint64_t PXPhotosApplicationTryRunningSwiftPPTTest()
{
  return _PXPhotosApplicationTryRunningSwiftPPTTest();
}

uint64_t PXPhotosApplicationURLToOpenWhenLaunchedForTesting()
{
  return _PXPhotosApplicationURLToOpenWhenLaunchedForTesting();
}

uint64_t PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview()
{
  return _PXPreferencesGetLibraryFilterViewModeWithSharedLibraryOrPreview();
}

uint64_t PXPreferencesIsHiddenAlbumVisible()
{
  return _PXPreferencesIsHiddenAlbumVisible();
}

uint64_t PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview()
{
  return _PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview();
}

uint64_t PXProgrammaticNavigationRequestExecute()
{
  return _PXProgrammaticNavigationRequestExecute();
}

uint64_t PXRectConvertFromCoordinateSpaceToCoordinateSpace()
{
  return _PXRectConvertFromCoordinateSpaceToCoordinateSpace();
}

uint64_t PXRectGetCenter()
{
  return _PXRectGetCenter();
}

uint64_t PXRectWithCenterAndSize()
{
  return _PXRectWithCenterAndSize();
}

uint64_t PXSharedAlbumURLHandlingInvitationTokenForURL()
{
  return _PXSharedAlbumURLHandlingInvitationTokenForURL();
}

uint64_t PXSharedAlbumURLHandlingParseInvitationToken()
{
  return _PXSharedAlbumURLHandlingParseInvitationToken();
}

uint64_t PXSharedLibraryHandleSharedLibraryURL()
{
  return _PXSharedLibraryHandleSharedLibraryURL();
}

uint64_t PXSizeGetArea()
{
  return _PXSizeGetArea();
}

uint64_t PXSizeScale()
{
  return _PXSizeScale();
}

uint64_t RPTGetBoundsForView()
{
  return _RPTGetBoundsForView();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIScrollDirectionFromRPTScrollDirection()
{
  return __UIScrollDirectionFromRPTScrollDirection();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t ppt_ResetSyncStatusWithLibrary()
{
  return _ppt_ResetSyncStatusWithLibrary();
}

uint64_t px_dispatch_on_main_queue()
{
  return _px_dispatch_on_main_queue();
}

uint64_t px_dispatch_on_main_queue_when_idle_after_delay()
{
  return _px_dispatch_on_main_queue_when_idle_after_delay();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

id objc_msgSend_HDRConsideration(void *a1, const char *a2, ...)
{
  return _[a1 HDRConsideration];
}

id objc_msgSend_MSContainsErrorWithDomain_code_(void *a1, const char *a2, ...)
{
  return [a1 MSContainsErrorWithDomain:code:];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _[a1 URLContexts];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend__RPTOppositeOfDirection_(void *a1, const char *a2, ...)
{
  return [_RPTOppositeOfDirection:];
}

id objc_msgSend__RPTScrollDirectionForContentFromEnd_scrollVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_RPTScrollDirectionForContentFromEnd:scrollVertical:");
}

id objc_msgSend__addTest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTest:completionHandler:");
}

id objc_msgSend__albumForKnownName_orUUID_requestIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_albumForKnownName:orUUID:requestIsValid:");
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return _[a1 _appearState];
}

id objc_msgSend__axisFromOptions_(void *a1, const char *a2, ...)
{
  return [a1 _axisFromOptions:];
}

id objc_msgSend__callCompletionHandlersForTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletionHandlersForTest:");
}

id objc_msgSend__canProceedWithPhotoLibraryInGoodState(void *a1, const char *a2, ...)
{
  return _[a1 _canProceedWithPhotoLibraryInGoodState];
}

id objc_msgSend__checkAndAlertSubscribedStreamsLimitReached(void *a1, const char *a2, ...)
{
  return _[a1 _checkAndAlertSubscribedStreamsLimitReached];
}

id objc_msgSend__computeFibonnaciNumbersForDuration_(void *a1, const char *a2, ...)
{
  return [a1 _computeFibonnaciNumbersForDuration:];
}

id objc_msgSend__configSwipeParams_forSpeed_returnTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configSwipeParams:forSpeed:returnTrip:");
}

id objc_msgSend__configureLibraryFilterModeWithTestOptions_(void *a1, const char *a2, ...)
{
  return [a1 _configureLibraryFilterModeWithTestOptions:];
}

id objc_msgSend__contentStartFromEndFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentStartFromEndFromOptions:");
}

id objc_msgSend__convertAsset_toVariationType_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _convertAsset:toVariationType:completionHandler:];
}

id objc_msgSend__curatedLibraryVC_transitionToZoomLevel_animationSubTestName_task_then_(void *a1, const char *a2, ...)
{
  return [_curatedLibraryVC:transitionToZoomLevel:animationSubTestName:task:then:];
}

id objc_msgSend__dequeueNextImportDevice(void *a1, const char *a2, ...)
{
  return _[a1 _dequeueNextImportDevice];
}

id objc_msgSend__dismissStoryFeed_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissStoryFeed:completion:");
}

id objc_msgSend__dismissStoryPlayer_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissStoryPlayer:animated:completion:");
}

id objc_msgSend__endedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endedTest:");
}

id objc_msgSend__ensureLemonadeRootViewControllerExists(void *a1, const char *a2, ...)
{
  return _[a1 _ensureLemonadeRootViewControllerExists];
}

id objc_msgSend__ensureSplitViewControllerExistsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _ensureSplitViewControllerExistsIfNeeded];
}

id objc_msgSend__executePendingRequestsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _executePendingRequestsIfNeeded];
}

id objc_msgSend__finishNavigationSuccessfully_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishNavigationSuccessfully:");
}

id objc_msgSend__gridView_performBlockAfterAnimationsCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gridView:performBlockAfterAnimationsCompleted:");
}

id objc_msgSend__handleFetchedMomentShare_forURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFetchedMomentShare:forURL:error:");
}

id objc_msgSend__installWillFinishTestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installWillFinishTestHandler:");
}

id objc_msgSend__interpageSpacing(void *a1, const char *a2, ...)
{
  return _[a1 _interpageSpacing];
}

id objc_msgSend__isUserActivityExpired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isUserActivityExpired:");
}

id objc_msgSend__itemProviderCollections(void *a1, const char *a2, ...)
{
  return _[a1 _itemProviderCollections];
}

id objc_msgSend__iterationsFromOptions_(void *a1, const char *a2, ...)
{
  return [a1 _iterationsFromOptions:];
}

id objc_msgSend__launchUIImagePickerControllerWithOptions_sourceType_mediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchUIImagePickerControllerWithOptions:sourceType:mediaTypes:");
}

id objc_msgSend__navigateToAlbumForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAlbumForCurrentTest:");
}

id objc_msgSend__navigateToAssetForCurrentTestInOneUp_startFromEnd_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAssetForCurrentTestInOneUp:startFromEnd:completion:");
}

id objc_msgSend__navigateToAssetInOneUpForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAssetInOneUpForCurrentTest:");
}

id objc_msgSend__navigateToAssetInOneUpPreferLocationAndFace_forCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:");
}

id objc_msgSend__navigateToCuratedLibraryTabForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToCuratedLibraryTabForCurrentTest:");
}

id objc_msgSend__navigateToDestination_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToDestination:completionHandler:");
}

id objc_msgSend__navigateToLivePhotosForCurrentTest_(void *a1, const char *a2, ...)
{
  return [a1 _navigateToLivePhotosForCurrentTest];
}

id objc_msgSend__navigateToSharedAlbumActivityFeed(void *a1, const char *a2, ...)
{
  return _[a1 _navigateToSharedAlbumActivityFeed];
}

id objc_msgSend__navigateToStoryFeedWithConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToStoryFeedWithConfiguration:completion:");
}

id objc_msgSend__navigateToStoryPlayerWithConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToStoryPlayerWithConfiguration:completion:");
}

id objc_msgSend__nebulaDaemonProxyManager(void *a1, const char *a2, ...)
{
  return _[a1 _nebulaDaemonProxyManager];
}

id objc_msgSend__newImportViewController(void *a1, const char *a2, ...)
{
  return _[a1 _newImportViewController];
}

id objc_msgSend__oneUpViewControllerForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oneUpViewControllerForViewController:");
}

id objc_msgSend__openItemProviderCollections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openItemProviderCollections:");
}

id objc_msgSend__openMomentShareWithURL_(void *a1, const char *a2, ...)
{
  return [a1 _openMomentShareWithURL:];
}

id objc_msgSend__openSpotlightSearchActivity_(void *a1, const char *a2, ...)
{
  return [a1 _openSpotlightSearchActivity:];
}

id objc_msgSend__openUniversalLinkActivity_(void *a1, const char *a2, ...)
{
  return [a1 _openUniversalLinkActivity:];
}

id objc_msgSend__oscillationScrollTestParamsWithScrollBounds_contentFromEnd_axis_speed_pages_iterations_completionHandler_(void *a1, const char *a2, ...)
{
  return [_oscillationScrollTestParamsWithScrollBounds:contentFromEnd:axis:speed:pages:iterations:completionHandler:];
}

id objc_msgSend__pagesFromOptions_(void *a1, const char *a2, ...)
{
  return [a1 _pagesFromOptions:];
}

id objc_msgSend__paramsArrayByParams_iterations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_paramsArrayByParams:iterations:");
}

id objc_msgSend__performActionType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performActionType:completionHandler:");
}

id objc_msgSend__performActionsWithCuratedLibraryVC_actionsTypesAndNames_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performActionsWithCuratedLibraryVC:actionsTypesAndNames:completionHandler:");
}

id objc_msgSend__performBlockWhenImportSourceIsReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockWhenImportSourceIsReady:");
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__performTestWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 _performTestWithBlock:];
}

id objc_msgSend__purgeVariationsCaches(void *a1, const char *a2, ...)
{
  return _[a1 _purgeVariationsCaches];
}

id objc_msgSend__responderForKeyEvents(void *a1, const char *a2, ...)
{
  return _[a1 _responderForKeyEvents];
}

id objc_msgSend__runImportTestCommonInit_navigateToImportTab_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runImportTestCommonInit:navigateToImportTab:completionHandler:");
}

id objc_msgSend__runLoadOneUpDocumentMenuActionsSubTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runLoadOneUpDocumentMenuActionsSubTest:");
}

id objc_msgSend__runPhotoEditTestWithOptions_afterEditOpenedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:");
}

id objc_msgSend__runRequestImageWithTargetSize_contentMode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runRequestImageWithTargetSize:contentMode:options:");
}

id objc_msgSend__runScrollTestWithOneUpViewController_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runScrollTestWithOneUpViewController:options:");
}

id objc_msgSend__satisfyAppIntentsURLNavigationPerformerRequestsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _satisfyAppIntentsURLNavigationPerformerRequestsIfNecessary];
}

id objc_msgSend__schedulePendingNavigation(void *a1, const char *a2, ...)
{
  return _[a1 _schedulePendingNavigation];
}

id objc_msgSend__scrollTestDelta_options_(void *a1, const char *a2, ...)
{
  return [a1 _scrollTestDelta:options:];
}

id objc_msgSend__scrollTestLength_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollTestLength:options:");
}

id objc_msgSend__scrollViewToTestForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollViewToTestForViewController:");
}

id objc_msgSend__setNebulaDaemonProxyManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNebulaDaemonProxyManager:");
}

id objc_msgSend__shareSheetScrollTestParamsWithScrollBounds_pages_iterations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareSheetScrollTestParamsWithScrollBounds:pages:iterations:completionHandler:");
}

id objc_msgSend__showAlertForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertForError:");
}

id objc_msgSend__showCloudPhotoLibraryExitPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _showCloudPhotoLibraryExitPromptIfNecessary];
}

id objc_msgSend__showContactsPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _showContactsPromptIfNecessary];
}

id objc_msgSend__showSyncReminderPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _showSyncReminderPromptIfNecessary];
}

id objc_msgSend__speedFromTestName_(void *a1, const char *a2, ...)
{
  return [a1 _speedFromTestName:];
}

id objc_msgSend__swipeCountFromOptions_(void *a1, const char *a2, ...)
{
  return [a1 _swipeCountFromOptions:];
}

id objc_msgSend__swipeTestParamsWithScrollBounds_contentFromEnd_axis_speed_swipeCount_iterations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swipeTestParamsWithScrollBounds:contentFromEnd:axis:speed:swipeCount:iterations:completionHandler:");
}

id objc_msgSend__tearDownImportViewController(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownImportViewController];
}

id objc_msgSend__transitionCuratedLibraryVC_toZoomLevelsWithSubTestNames_taskHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transitionCuratedLibraryVC:toZoomLevelsWithSubTestNames:taskHandler:completionHandler:");
}

id objc_msgSend__tungstenViewToTestForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tungstenViewToTestForViewController:");
}

id objc_msgSend__uuidFromURLParams_prefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uuidFromURLParams:prefix:");
}

id objc_msgSend__zoomLevelFromTestDefinitionZoomLevelName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoomLevelFromTestDefinitionZoomLevelName:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptInvitationWithToken_personID_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 acceptInvitationWithToken:personID:completionBlock:];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionManager(void *a1, const char *a2, ...)
{
  return _[a1 actionManager];
}

id objc_msgSend_actionManagerForObjects_(void *a1, const char *a2, ...)
{
  return [a1 actionManagerForObjects:];
}

id objc_msgSend_actionPerformerForActionType_(void *a1, const char *a2, ...)
{
  return [a1 actionPerformerForActionType:];
}

id objc_msgSend_actionPerformerForActionType_parameters_(void *a1, const char *a2, ...)
{
  return [a1 actionPerformerForActionType:parameters:];
}

id objc_msgSend_actionTypeForGenericType_(void *a1, const char *a2, ...)
{
  return [a1 actionTypeForGenericType:];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activateEventQueue(void *a1, const char *a2, ...)
{
  return _[a1 activateEventQueue];
}

id objc_msgSend_activationOptions(void *a1, const char *a2, ...)
{
  return _[a1 activationOptions];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addDeferredKeyObserver_(void *a1, const char *a2, ...)
{
  return [a1 addDeferredKeyObserver:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addImportControllerObserver_(void *a1, const char *a2, ...)
{
  return [a1 addImportControllerObserver];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return [a1 addValue:];
}

id objc_msgSend_additionalResults(void *a1, const char *a2, ...)
{
  return _[a1 additionalResults];
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return _[a1 adjustedContentInset];
}

id objc_msgSend_albumIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return [a1 albumIsAvailableForNavigation];
}

id objc_msgSend_albumWithKind_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 albumWithKind:inManagedObjectContext:];
}

id objc_msgSend_albumWithUuid_(void *a1, const char *a2, ...)
{
  return [a1 albumWithUuid:];
}

id objc_msgSend_albumsToUploadInitiallyInLibrary_limit_(void *a1, const char *a2, ...)
{
  return [a1 albumsToUploadInitiallyInLibrary:limit:];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_allImportedPhotosAlbumCreateIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 allImportedPhotosAlbumCreateIfNeeded:];
}

id objc_msgSend_allowCaching(void *a1, const char *a2, ...)
{
  return _[a1 allowCaching];
}

id objc_msgSend_allowImageRequests(void *a1, const char *a2, ...)
{
  return _[a1 allowImageRequests];
}

id objc_msgSend_alternateWithTitle_action_modifierFlags_(void *a1, const char *a2, ...)
{
  return [a1 alternateWithTitle:action:modifierFlags:];
}

id objc_msgSend_alwaysBounceHorizontal(void *a1, const char *a2, ...)
{
  return _[a1 alwaysBounceHorizontal];
}

id objc_msgSend_animate_animationRenderingCompletionHandler_proceedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animate:animationRenderingCompletionHandler:proceedHandler:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appleMusicPromptTrigger(void *a1, const char *a2, ...)
{
  return _[a1 appleMusicPromptTrigger];
}

id objc_msgSend_applicationScene(void *a1, const char *a2, ...)
{
  return _[a1 applicationScene];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _[a1 asset];
}

id objc_msgSend_assetActionManager(void *a1, const char *a2, ...)
{
  return _[a1 assetActionManager];
}

id objc_msgSend_assetAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 assetAtIndexPath:];
}

id objc_msgSend_assetCollectionSubtype(void *a1, const char *a2, ...)
{
  return _[a1 assetCollectionSubtype];
}

id objc_msgSend_assetIsAvailableForNavigation_inAlbum_(void *a1, const char *a2, ...)
{
  return [a1 assetIsAvailableForNavigation:inAlbum:];
}

id objc_msgSend_assetReferenceAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 assetReferenceAtIndexPath:];
}

id objc_msgSend_assetReferenceForAssetReference_(void *a1, const char *a2, ...)
{
  return [a1 assetReferenceForAssetReference:];
}

id objc_msgSend_assetWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 assetWithUUID:];
}

id objc_msgSend_assetsDataSource(void *a1, const char *a2, ...)
{
  return _[a1 assetsDataSource];
}

id objc_msgSend_assetsDataSourceManager(void *a1, const char *a2, ...)
{
  return _[a1 assetsDataSourceManager];
}

id objc_msgSend_assetsInAssetCollection_(void *a1, const char *a2, ...)
{
  return [a1 assetsInAssetCollection:];
}

id objc_msgSend_assetsInSectionIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 assetsInSectionIndexPath:];
}

id objc_msgSend_assetsToUploadInitiallyInManagedObjectContext_limit_(void *a1, const char *a2, ...)
{
  return [a1 assetsToUploadInitiallyInManagedObjectContext:limit:];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_beginObservingSystemEventsForAutomaticInvalidation(void *a1, const char *a2, ...)
{
  return _[a1 beginObservingSystemEventsForAutomaticInvalidation];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_browsingSession(void *a1, const char *a2, ...)
{
  return _[a1 browsingSession];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_cachedPrimaryAppleAccount(void *a1, const char *a2, ...)
{
  return _[a1 cachedPrimaryAppleAccount];
}

id objc_msgSend_canPerformActionType_(void *a1, const char *a2, ...)
{
  return [a1 canPerformActionType:];
}

id objc_msgSend_canPerformEditOperation_(void *a1, const char *a2, ...)
{
  return [a1 canPerformEditOperation:];
}

id objc_msgSend_canPerformEditsWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 canPerformEditsWithRootViewController:];
}

id objc_msgSend_canPlayAutoloop(void *a1, const char *a2, ...)
{
  return _[a1 canPlayAutoloop];
}

id objc_msgSend_canRedo(void *a1, const char *a2, ...)
{
  return _[a1 canRedo];
}

id objc_msgSend_canUndo(void *a1, const char *a2, ...)
{
  return _[a1 canUndo];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:selector:object:];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_caseNameStringForPXProgrammaticNavigationResult_(void *a1, const char *a2, ...)
{
  return [a1 caseNameStringForPXProgrammaticNavigationResult:];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_changeRequestForAsset_(void *a1, const char *a2, ...)
{
  return [a1 changeRequestForAsset:];
}

id objc_msgSend_changeRequestForCloudSharedAlbum_(void *a1, const char *a2, ...)
{
  return [a1 changeRequestForCloudSharedAlbum:];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_clearCacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 clearCacheDirectory];
}

id objc_msgSend_clockwise(void *a1, const char *a2, ...)
{
  return _[a1 clockwise];
}

id objc_msgSend_cloudFeedAssetIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return [a1 cloudFeedAssetIsAvailableForNavigation];
}

id objc_msgSend_cloudFeedCommentIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return [a1 cloudFeedCommentIsAvailableForNavigation];
}

id objc_msgSend_cloudFeedInvitationForAlbumIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return [a1 cloudFeedInvitationForAlbumIsAvailableForNavigation];
}

id objc_msgSend_cloudFeedIsAvailableForNavigation(void *a1, const char *a2, ...)
{
  return _[a1 cloudFeedIsAvailableForNavigation];
}

id objc_msgSend_cloudKitShareMetadata(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitShareMetadata];
}

id objc_msgSend_cloudSharedCommentWithGUID_inLibrary_(void *a1, const char *a2, ...)
{
  return [a1 cloudSharedCommentWithGUID:inLibrary:];
}

id objc_msgSend_collectionActionReceiver(void *a1, const char *a2, ...)
{
  return _[a1 collectionActionReceiver];
}

id objc_msgSend_collectionListFetchResult(void *a1, const char *a2, ...)
{
  return _[a1 collectionListFetchResult];
}

id objc_msgSend_commandWithTitle_image_action_input_modifierFlags_propertyList_(void *a1, const char *a2, ...)
{
  return [a1 commandWithTitle:image:action:input:modifierFlags:propertyList:];
}

id objc_msgSend_commandWithTitle_image_action_input_modifierFlags_propertyList_alternates_(void *a1, const char *a2, ...)
{
  return [a1 commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:];
}

id objc_msgSend_commentIsAvailableForNavigation_inAsset_(void *a1, const char *a2, ...)
{
  return [a1 commentIsAvailableForNavigation:inAsset:];
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:toDate:options:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationDescription(void *a1, const char *a2, ...)
{
  return _[a1 configurationDescription];
}

id objc_msgSend_configureCollectionViewGridLayout_forWidth_safeAreaInsets_(void *a1, const char *a2, ...)
{
  return [a1 configureCollectionViewGridLayout:forWidth:safeAreaInsets:];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentModeIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return [a1 contentModeIsAvailableForNavigation];
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _[a1 contentScrollView];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentViewController];
}

id objc_msgSend_contextMenuElementsWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 contextMenuElementsWithHandler:];
}

id objc_msgSend_convertRect_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromCoordinateSpace:];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromView:];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toView:];
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 coordinateSpace];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cplAlbumChangeInPhotoLibrary_orderKeyManager_(void *a1, const char *a2, ...)
{
  return [a1 cplAlbumChangeInPhotoLibrary:orderKeyManager:];
}

id objc_msgSend_cplStatus(void *a1, const char *a2, ...)
{
  return _[a1 cplStatus];
}

id objc_msgSend_createAnimation(void *a1, const char *a2, ...)
{
  return _[a1 createAnimation];
}

id objc_msgSend_createLayout(void *a1, const char *a2, ...)
{
  return _[a1 createLayout];
}

id objc_msgSend_createMastersInLibrary_(void *a1, const char *a2, ...)
{
  return [a1 createMastersInLibrary:];
}

id objc_msgSend_createPhotoLibraryWithURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 createPhotoLibraryWithURL:options:error:];
}

id objc_msgSend_creationOptionsForUserLibrary(void *a1, const char *a2, ...)
{
  return _[a1 creationOptionsForUserLibrary];
}

id objc_msgSend_currentAssetReference(void *a1, const char *a2, ...)
{
  return _[a1 currentAssetReference];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDataSource(void *a1, const char *a2, ...)
{
  return _[a1 currentDataSource];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTestName(void *a1, const char *a2, ...)
{
  return _[a1 currentTestName];
}

id objc_msgSend_currentTestOptions(void *a1, const char *a2, ...)
{
  return _[a1 currentTestOptions];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataSourceManagerForAssetCollection_existingAssetsFetchResult_existingKeyAssetsFetchResult_fetchPropertySets_basePredicate_options_ignoreSharedLibraryFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:");
}

id objc_msgSend_dataSourceManagerWithAsset_(void *a1, const char *a2, ...)
{
  return [a1 dataSourceManagerWithAsset:];
}

id objc_msgSend_dataSourceManagerWithAssets_(void *a1, const char *a2, ...)
{
  return [a1 dataSourceManagerWithAssets:];
}

id objc_msgSend_databaseContext(void *a1, const char *a2, ...)
{
  return _[a1 databaseContext];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfigurations];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultPresenterWithViewController_(void *a1, const char *a2, ...)
{
  return [a1 defaultPresenterWithViewController:];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return _[a1 destinationURL];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForKey:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didRecieveSpotlightSearchActivity(void *a1, const char *a2, ...)
{
  return _[a1 didRecieveSpotlightSearchActivity];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_donateSignalForEvent_(void *a1, const char *a2, ...)
{
  return [a1 donateSignalForEvent:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_enableDeviceImport(void *a1, const char *a2, ...)
{
  return _[a1 enableDeviceImport];
}

id objc_msgSend_enableInlinePlayback(void *a1, const char *a2, ...)
{
  return _[a1 enableInlinePlayback];
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return _[a1 enableMultiLibraryMode];
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return _[a1 engine];
}

id objc_msgSend_enumerateFeedConfigurationsUsingBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateFeedConfigurationsUsingBlock:completion:");
}

id objc_msgSend_enumerateIndexPathsStartingAtIndexPath_reverseDirection_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateStoryConfigurationsUsingBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateStoryConfigurationsUsingBlock:completion:");
}

id objc_msgSend_estimatedLibrarySizes(void *a1, const char *a2, ...)
{
  return _[a1 estimatedLibrarySizes];
}

id objc_msgSend_exitDeleteTime(void *a1, const char *a2, ...)
{
  return _[a1 exitDeleteTime];
}

id objc_msgSend_faceAreaMinX(void *a1, const char *a2, ...)
{
  return _[a1 faceAreaMinX];
}

id objc_msgSend_failedCurrentTest(void *a1, const char *a2, ...)
{
  return _[a1 failedCurrentTest];
}

id objc_msgSend_failedCurrentTestWithFailure_(void *a1, const char *a2, ...)
{
  return [a1 failedCurrentTestWithFailure:];
}

id objc_msgSend_failedTest_(void *a1, const char *a2, ...)
{
  return [a1 failedTest:];
}

id objc_msgSend_failedTest_withFailure_(void *a1, const char *a2, ...)
{
  return [a1 failedTest:withFailure:];
}

id objc_msgSend_fallbackUndoManager(void *a1, const char *a2, ...)
{
  return _[a1 fallbackUndoManager];
}

id objc_msgSend_feedViewControllerWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 feedViewControllerWithConfiguration:];
}

id objc_msgSend_fetchAssetCollectionsWithType_subtype_options_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetCollectionsWithType:subtype:options:];
}

id objc_msgSend_fetchAssetsInAssetCollection_options_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetsInAssetCollection:options:];
}

id objc_msgSend_fetchAssetsWithMediaType_options_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetsWithMediaType:options:];
}

id objc_msgSend_fetchAssetsWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetsWithOptions:];
}

id objc_msgSend_fetchCloudSharedAlbumsWithGUIDs_options_(void *a1, const char *a2, ...)
{
  return [a1 fetchCloudSharedAlbumsWithGUIDs:];
}

id objc_msgSend_fetchTopLevelUserCollectionsWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 fetchTopLevelUserCollectionsWithOptions:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_finishedCurrentTest(void *a1, const char *a2, ...)
{
  return _[a1 finishedCurrentTest];
}

id objc_msgSend_finishedCurrentTestWithExtraResults_(void *a1, const char *a2, ...)
{
  return [a1 finishedCurrentTestWithExtraResults:];
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return [a1 finishedSubTest:forTest:];
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return [a1 finishedTest:extraResults:];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return _[a1 first];
}

id objc_msgSend_firstAssetCollection(void *a1, const char *a2, ...)
{
  return _[a1 firstAssetCollection];
}

id objc_msgSend_firstItemIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 firstItemIndexPath];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_generateVideoWithFileNameSuffix_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 generateVideoWithFileNameSuffix:completionHandler:];
}

id objc_msgSend_gesturePerformerForTestWithName_options_(void *a1, const char *a2, ...)
{
  return [a1 gesturePerformerForTestWithName:options:];
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _[a1 gridView];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleOAuthRedirectURL_(void *a1, const char *a2, ...)
{
  return [a1 handleOAuthRedirectURL:];
}

id objc_msgSend_handlePhoneInvitationFailuresWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 handlePhoneInvitationFailuresWithCompletionBlock:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasReachedLimitOfSubscribedStreamsInLibrary_(void *a1, const char *a2, ...)
{
  return [a1 hasReachedLimitOfSubscribedStreamsInLibrary:];
}

id objc_msgSend_hasSharedLibraryOrPreview(void *a1, const char *a2, ...)
{
  return _[a1 hasSharedLibraryOrPreview];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iTunesLibraryAlbumInLibrary_(void *a1, const char *a2, ...)
{
  return [a1 iTunesLibraryAlbumInLibrary:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_importItemProviders_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 importItemProviders:completionHandler:];
}

id objc_msgSend_importSource(void *a1, const char *a2, ...)
{
  return _[a1 importSource];
}

id objc_msgSend_importViewControllerInstanceHost(void *a1, const char *a2, ...)
{
  return _[a1 importViewControllerInstanceHost];
}

id objc_msgSend_importViewControllerSpec(void *a1, const char *a2, ...)
{
  return _[a1 importViewControllerSpec];
}

id objc_msgSend_incrementUploadAttempts(void *a1, const char *a2, ...)
{
  return _[a1 incrementUploadAttempts];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexPathForAssetCollectionReference_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForAssetCollectionReference:];
}

id objc_msgSend_indexPathForAssetReference_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForAssetReference:];
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForItem:inSection:];
}

id objc_msgSend_indexPathSetWithIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 indexPathSetWithIndexPath:];
}

id objc_msgSend_initWithAdjustments_rootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdjustments:rootViewController:];
}

id objc_msgSend_initWithAssetCollection_keyAssetReference_indexPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetCollection:keyAssetReference:indexPath:];
}

id objc_msgSend_initWithAssetsDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetsDataSource:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithConfiguration_extendedTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:extendedTraitCollection:];
}

id objc_msgSend_initWithContainerView_delegate_testOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainerView:delegate:testOptions:];
}

id objc_msgSend_initWithDataSourceManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataSourceManager:];
}

id objc_msgSend_initWithDataSourceManager_mediaProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataSourceManager:mediaProvider:];
}

id objc_msgSend_initWithDefaultTitle(void *a1, const char *a2, ...)
{
  return _[a1 initWithDefaultTitle];
}

id objc_msgSend_initWithDelegate_testOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:testOptions:];
}

id objc_msgSend_initWithDestination_options_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithDestination:options:completionHandler:];
}

id objc_msgSend_initWithDestinationURL_rootController_(void *a1, const char *a2, ...)
{
  return [a1 initWithDestinationURL:rootController:];
}

id objc_msgSend_initWithFileBackedAssetDescriptionsBySection_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileBackedAssetDescriptionsBySection:];
}

id objc_msgSend_initWithFireDate_interval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithFireDate:interval:repeats:block:];
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return [a1 initWithFirst:second:];
}

id objc_msgSend_initWithFormFactor_orientation_visibleChromeElements_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormFactor:orientation:visibleChromeElements:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:arguments:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithGenerateContextBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithGenerateContextBlock:];
}

id objc_msgSend_initWithLayout_(void *a1, const char *a2, ...)
{
  return [a1 initWithLayout:];
}

id objc_msgSend_initWithNavigationRoot_photoLibrary_libraryFilterState_(void *a1, const char *a2, ...)
{
  return [a1 initWithNavigationRoot:photoLibrary:libraryFilterState:];
}

id objc_msgSend_initWithObject_revealMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithObject:revealMode:];
}

id objc_msgSend_initWithPHConfiguration_coordinatorActionHandler_loadingStatusManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithPHConfiguration:coordinatorActionHandler:loadingStatusManager:];
}

id objc_msgSend_initWithPerson_targetSize_displayScale_(void *a1, const char *a2, ...)
{
  return [a1 initWithPerson:targetSize:displayScale:];
}

id objc_msgSend_initWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return [a1 initWithPhotoLibrary:];
}

id objc_msgSend_initWithPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithPhotoLibraryURL:];
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:];
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithSearchText_(void *a1, const char *a2, ...)
{
  return [a1 initWithSearchText:];
}

id objc_msgSend_initWithSelectionManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithSelectionManager:];
}

id objc_msgSend_initWithSidebarNavigationController_contentViewController_compactViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithSidebarNavigationController:contentViewController:compactViewController:];
}

id objc_msgSend_initWithSpec_photoLibrary_(void *a1, const char *a2, ...)
{
  return [a1 initWithSpec:photoLibrary:];
}

id objc_msgSend_initWithTestName_scrollBounds_scrollContentLength_direction_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:];
}

id objc_msgSend_initWithTestName_scrollingBounds_swipeCount_direction_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:];
}

id objc_msgSend_initWithTestName_testOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:testOptions:];
}

id objc_msgSend_initWithType_revealMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:revealMode:];
}

id objc_msgSend_initWithType_revealMode_asset_assetCollection_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:revealMode:asset:assetCollection:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithUndoManager_privacyController_(void *a1, const char *a2, ...)
{
  return [a1 initWithUndoManager:privacyController:];
}

id objc_msgSend_initWithWelcomeController_(void *a1, const char *a2, ...)
{
  return [a1 initWithWelcomeController:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_initiallyScrolledToBottom(void *a1, const char *a2, ...)
{
  return _[a1 initiallyScrolledToBottom];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _[a1 input];
}

id objc_msgSend_insertChildMenu_atEndOfMenuForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 insertChildMenu:atEndOfMenuForIdentifier:];
}

id objc_msgSend_insertSiblingMenu_afterMenuForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 insertSiblingMenu:afterMenuForIdentifier:];
}

id objc_msgSend_installCACommitCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 installCACommitCompletionBlock:];
}

id objc_msgSend_installNotificationObserverForNotificationName_notificationName_forOneNotification_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectsSet:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateActionManagerProvider(void *a1, const char *a2, ...)
{
  return _[a1 invalidateActionManagerProvider];
}

id objc_msgSend_invitationRecords(void *a1, const char *a2, ...)
{
  return _[a1 invitationRecords];
}

id objc_msgSend_invitationState(void *a1, const char *a2, ...)
{
  return _[a1 invitationState];
}

id objc_msgSend_inviteePhones(void *a1, const char *a2, ...)
{
  return _[a1 inviteePhones];
}

id objc_msgSend_isCloudPhotoLibraryEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCloudPhotoLibraryEnabled];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isEmpty];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isRPTAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRPTAvailable];
}

id objc_msgSend_isRPTStyleTestName_(void *a1, const char *a2, ...)
{
  return [a1 isRPTStyleTestName:];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRecapAvailable];
}

id objc_msgSend_isSidebarEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSidebarEnabled];
}

id objc_msgSend_isSourceTypeAvailable_(void *a1, const char *a2, ...)
{
  return [a1 isSourceTypeAvailable:];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isZoomLevelEnabled_(void *a1, const char *a2, ...)
{
  return [a1 isZoomLevelEnabled:];
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return _[a1 itemSize];
}

id objc_msgSend_keyAssetsAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 keyAssetsAtEnd];
}

id objc_msgSend_keyCollectionActionReceiver(void *a1, const char *a2, ...)
{
  return _[a1 keyCollectionActionReceiver];
}

id objc_msgSend_keyCommandWithInput_modifierFlags_action_(void *a1, const char *a2, ...)
{
  return [a1 keyCommandWithInput:modifierFlags:action:];
}

id objc_msgSend_keyRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 keyRootViewController];
}

id objc_msgSend_keySpec(void *a1, const char *a2, ...)
{
  return _[a1 keySpec];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_lastAssetCollection(void *a1, const char *a2, ...)
{
  return _[a1 lastAssetCollection];
}

id objc_msgSend_lastDidEnterBackgroundDate(void *a1, const char *a2, ...)
{
  return _[a1 lastDidEnterBackgroundDate];
}

id objc_msgSend_lastImportedPhotosAlbumCreateIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 lastImportedPhotosAlbumCreateIfNeeded:];
}

id objc_msgSend_lastItemIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 lastItemIndexPath];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastSuccessfulSyncDate(void *a1, const char *a2, ...)
{
  return _[a1 lastSuccessfulSyncDate];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return _[a1 launchedToTest];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_lemonadeRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 lemonadeRootViewController];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_libraryFilterState(void *a1, const char *a2, ...)
{
  return _[a1 libraryFilterState];
}

id objc_msgSend_libraryServicesManager(void *a1, const char *a2, ...)
{
  return _[a1 libraryServicesManager];
}

id objc_msgSend_librarySizesFromDB(void *a1, const char *a2, ...)
{
  return _[a1 librarySizesFromDB];
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return _[a1 librarySpecificFetchOptions];
}

id objc_msgSend_libraryViewMode(void *a1, const char *a2, ...)
{
  return _[a1 libraryViewMode];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_localizedTitleForActionType_useCase_(void *a1, const char *a2, ...)
{
  return [a1 localizedTitleForActionType:useCase:];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return _[a1 mainSystem];
}

id objc_msgSend_mainWindow(void *a1, const char *a2, ...)
{
  return _[a1 mainWindow];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return _[a1 max];
}

id objc_msgSend_maxNumberOfPlayingItems(void *a1, const char *a2, ...)
{
  return _[a1 maxNumberOfPlayingItems];
}

id objc_msgSend_maxSubscribedStreams(void *a1, const char *a2, ...)
{
  return _[a1 maxSubscribedStreams];
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return _[a1 mean];
}

id objc_msgSend_measurementsDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 measurementsDictionaryRepresentation];
}

id objc_msgSend_mediaProviderWithLibrary_(void *a1, const char *a2, ...)
{
  return [a1 mediaProviderWithLibrary:];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_menuForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 menuForIdentifier:];
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:image:identifier:options:children:];
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return _[a1 min];
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return _[a1 modifierFlags];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigateToAlbum_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToAlbum:animated:completion:");
}

id objc_msgSend_navigateToAsset_inAlbum_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToAsset:inAlbum:animated:];
}

id objc_msgSend_navigateToCloudFeedAsset_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToCloudFeedAsset:completion:];
}

id objc_msgSend_navigateToCloudFeedComment_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToCloudFeedComment:completion:];
}

id objc_msgSend_navigateToCloudFeedWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToCloudFeedWithCompletion:];
}

id objc_msgSend_navigateToComment_forAsset_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToComment:forAsset:animated:];
}

id objc_msgSend_navigateToContentMode_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToContentMode:animated:completion:];
}

id objc_msgSend_navigateToDestination_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToDestination:completion:");
}

id objc_msgSend_navigateToDestination_options_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 navigateToDestination:options:completionHandler:];
}

id objc_msgSend_navigateToOneYearAgoSearch(void *a1, const char *a2, ...)
{
  return _[a1 navigateToOneYearAgoSearch];
}

id objc_msgSend_navigateToPeopleAlbumAnimated_revealPersonWithLocalIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToPeopleAlbumAnimated:revealPersonWithLocalIdentifier:completion:];
}

id objc_msgSend_navigateToPhoto_inAssetContainer_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToPhoto:inAssetContainer:animated:];
}

id objc_msgSend_navigateToPhotosDetailsForAssetCollection_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToPhotosDetailsForAssetCollection:animated:];
}

id objc_msgSend_navigateToPlacesAlbumAnimated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToPlacesAlbumAnimated:];
}

id objc_msgSend_navigateToRevealAsset_inAlbum_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToRevealAsset:inAlbum:animated:];
}

id objc_msgSend_navigateToRevealCloudFeedAsset_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToRevealCloudFeedAsset:completion:];
}

id objc_msgSend_navigateToRevealCloudFeedComment_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToRevealCloudFeedComment:completion:];
}

id objc_msgSend_navigateToRevealCloudFeedInvitationForAlbum_completion_(void *a1, const char *a2, ...)
{
  return [a1 navigateToRevealCloudFeedInvitationForAlbum:completion:];
}

id objc_msgSend_navigateToSearchWithHashtag_(void *a1, const char *a2, ...)
{
  return [a1 navigateToSearchWithHashtag];
}

id objc_msgSend_navigateToSearchWithTerms_searchCategories_(void *a1, const char *a2, ...)
{
  return [a1 navigateToSearchWithTerms:searchCategories:];
}

id objc_msgSend_navigateToURLDestination_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 navigateToURLDestination:];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_newShortLivedLibraryForOrderKeyManagerWithName_(void *a1, const char *a2, ...)
{
  return [a1 newShortLivedLibraryForOrderKeyManagerWithName:];
}

id objc_msgSend_newWithTestName_parameters_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 newWithTestName:parameters:completionHandler:];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return _[a1 next];
}

id objc_msgSend_nextExistingParticipantOnRouteToDestination_(void *a1, const char *a2, ...)
{
  return [a1 nextExistingParticipantOnRouteToDestination];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextResponder(void *a1, const char *a2, ...)
{
  return _[a1 nextResponder];
}

id objc_msgSend_noteSceneWillEnterForeground_(void *a1, const char *a2, ...)
{
  return [a1 noteSceneWillEnterForeground:];
}

id objc_msgSend_notificationSuppressionContexts(void *a1, const char *a2, ...)
{
  return _[a1 notificationSuppressionContexts];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openCloudKitShareWithURL_(void *a1, const char *a2, ...)
{
  return [a1 openCloudKitShareWithURL:];
}

id objc_msgSend_openRoutingURL_(void *a1, const char *a2, ...)
{
  return [a1 openRoutingURL:];
}

id objc_msgSend_openUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 openUserActivity:];
}

id objc_msgSend_originalUniformTypeIdentifierForAsset_(void *a1, const char *a2, ...)
{
  return [a1 originalUniformTypeIdentifierForAsset:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingCloudKitShareURLToOpen(void *a1, const char *a2, ...)
{
  return _[a1 pendingCloudKitShareURLToOpen];
}

id objc_msgSend_pendingProgrammaticNavigationRequestToOpen(void *a1, const char *a2, ...)
{
  return _[a1 pendingProgrammaticNavigationRequestToOpen];
}

id objc_msgSend_pendingURLToOpen(void *a1, const char *a2, ...)
{
  return _[a1 pendingURLToOpen];
}

id objc_msgSend_pendingUserActivity(void *a1, const char *a2, ...)
{
  return _[a1 pendingUserActivity];
}

id objc_msgSend_performActionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 performActionWithCompletionHandler:];
}

id objc_msgSend_performBlockAndWait_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:completionHandler:];
}

id objc_msgSend_performChanges_(void *a1, const char *a2, ...)
{
  return [a1 performChanges:];
}

id objc_msgSend_performChanges_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 performChanges:completionHandler:];
}

id objc_msgSend_performChangesAndWait_error_(void *a1, const char *a2, ...)
{
  return [a1 performChangesAndWait:error:];
}

id objc_msgSend_performCrashRecoveryIfNeededForceEndLastTimelapseSession_(void *a1, const char *a2, ...)
{
  return [a1 performCrashRecoveryIfNeededForceEndLastTimelapseSession:];
}

id objc_msgSend_performRequest(void *a1, const char *a2, ...)
{
  return _[a1 performRequest];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_performTransactionAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performTransactionAndWait:];
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 photoLibrary];
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return _[a1 photoLibraryURL];
}

id objc_msgSend_photosDataSource(void *a1, const char *a2, ...)
{
  return _[a1 photosDataSource];
}

id objc_msgSend_photosWindowSceneDelegate(void *a1, const char *a2, ...)
{
  return _[a1 photosWindowSceneDelegate];
}

id objc_msgSend_pl_presentViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pl_presentViewController:animated:];
}

id objc_msgSend_pl_sharedAccountStore(void *a1, const char *a2, ...)
{
  return [a1 pl_sharedAccountStore];
}

id objc_msgSend_placeholderCommandTitle(void *a1, const char *a2, ...)
{
  return _[a1 placeholderCommandTitle];
}

id objc_msgSend_playbackStyle(void *a1, const char *a2, ...)
{
  return _[a1 playbackStyle];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popViewControllerAnimated:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_ppt_activityViewController(void *a1, const char *a2, ...)
{
  return [a1 ppt_activityViewController];
}

id objc_msgSend_ppt_animator(void *a1, const char *a2, ...)
{
  return [a1 ppt_animator];
}

id objc_msgSend_ppt_applyAutoenhance_(void *a1, const char *a2, ...)
{
  return [a1 ppt_applyAutoenhance];
}

id objc_msgSend_ppt_barsController(void *a1, const char *a2, ...)
{
  return [a1 ppt_barsController];
}

id objc_msgSend_ppt_beginPausingChanges(void *a1, const char *a2, ...)
{
  return [a1 ppt_beginPausingChanges];
}

id objc_msgSend_ppt_cancelActivity(void *a1, const char *a2, ...)
{
  return [a1 ppt_cancelActivity];
}

id objc_msgSend_ppt_cleanUpAfterTest_isScrollTest_(void *a1, const char *a2, ...)
{
  return [a1 ppt_cleanUpAfterTest:isScrollTest:];
}

id objc_msgSend_ppt_configureSelectedSliderWithSteps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_configureSelectedSliderWithSteps:");
}

id objc_msgSend_ppt_determineAxisForScrollView_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_determineAxisForScrollView:withOptions:");
}

id objc_msgSend_ppt_dismiss(void *a1, const char *a2, ...)
{
  return [a1 ppt_dismiss];
}

id objc_msgSend_ppt_dismissShareSheetWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_dismissShareSheetWithCompletion:");
}

id objc_msgSend_ppt_documentMenuActions(void *a1, const char *a2, ...)
{
  return [a1 ppt_documentMenuActions];
}

id objc_msgSend_ppt_endPausingChanges(void *a1, const char *a2, ...)
{
  return [a1 ppt_endPausingChanges];
}

id objc_msgSend_ppt_executeAfterRender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_executeAfterRender:");
}

id objc_msgSend_ppt_extraResults(void *a1, const char *a2, ...)
{
  return [a1 ppt_extraResults];
}

id objc_msgSend_ppt_insertImportDataSourceWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_insertImportDataSourceWithOptions:completionHandler:];
}

id objc_msgSend_ppt_installTransitionAnimationCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_installTransitionAnimationCompletionHandler];
}

id objc_msgSend_ppt_mainScrollView(void *a1, const char *a2, ...)
{
  return [a1 ppt_mainScrollView];
}

id objc_msgSend_ppt_navigateToAsset_inAssetContainer_revealInOneUp_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:];
}

id objc_msgSend_ppt_notifyWhenFullQualityIsDisplayedWithTimeout_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_notifyWhenFullQualityIsDisplayedWithTimeout:handler:");
}

id objc_msgSend_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_notifyWhenVKAnalysisIsReadyWithTimeout:handler:");
}

id objc_msgSend_ppt_overOneUpPresentationSession(void *a1, const char *a2, ...)
{
  return [a1 ppt_overOneUpPresentationSession];
}

id objc_msgSend_ppt_performBlockAfterAllWidgetLoadingCompletes_(void *a1, const char *a2, ...)
{
  return [a1 ppt_performBlockAfterAllWidgetLoadingCompletes];
}

id objc_msgSend_ppt_performBlockAfterNextNavigationAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performBlockAfterNextNavigationAnimation:");
}

id objc_msgSend_ppt_performDeleteWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_performDeleteWithOptions:completionHandler:];
}

id objc_msgSend_ppt_performImportToLibraryWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_performImportToLibraryWithOptions:completionHandler:];
}

id objc_msgSend_ppt_performScrollTest_withOptions_gridView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:gridView:completionHandler:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollBounds_(void *a1, const char *a2, ...)
{
  return [a1 ppt_performScrollTest:withOptions:scrollBounds:];
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_performScrollTest:withOptions:scrollView:completionHandler:];
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollView_scrollAxis_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollView_scrollAxis_extraResultsBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:");
}

id objc_msgSend_ppt_performThumbnailWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performThumbnailWithOptions:completionHandler:");
}

id objc_msgSend_ppt_playCurrentLivePhotoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_playCurrentLivePhotoWithCompletionHandler:];
}

id objc_msgSend_ppt_playLivePhotoWithWillBeginPlaybackBlock_didEndPlaybackBlock_(void *a1, const char *a2, ...)
{
  return [a1 ppt_playLivePhotoWithWillBeginPlaybackBlock:didEndPlaybackBlock:];
}

id objc_msgSend_ppt_prepareApplicationForTesting(void *a1, const char *a2, ...)
{
  return [a1 ppt_prepareApplicationForTesting];
}

id objc_msgSend_ppt_prepareForTest_withOptions_isScrollTest_(void *a1, const char *a2, ...)
{
  return [a1 ppt_prepareForTest:withOptions:isScrollTest:];
}

id objc_msgSend_ppt_presentPhotoEditor(void *a1, const char *a2, ...)
{
  return [a1 ppt_presentPhotoEditor];
}

id objc_msgSend_ppt_presentShareSheetWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ppt_presentShareSheetWithCompletion:];
}

id objc_msgSend_ppt_removeImportDataSourceWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 ppt_removeImportDataSourceWithOptions:completionHandler:];
}

id objc_msgSend_ppt_renderStatisticsDictionaryForTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 ppt_renderStatisticsDictionaryForTimeInterval:];
}

id objc_msgSend_ppt_scrollBWSlider_(void *a1, const char *a2, ...)
{
  return [a1 ppt_scrollBWSlider:];
}

id objc_msgSend_ppt_scrollColorSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollColorSlider:");
}

id objc_msgSend_ppt_scrollLightSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollLightSlider:");
}

id objc_msgSend_ppt_scrollSelectedSliderByDelta(void *a1, const char *a2, ...)
{
  return [a1 ppt_scrollSelectedSliderByDelta];
}

id objc_msgSend_ppt_scrollTestViewController(void *a1, const char *a2, ...)
{
  return [a1 ppt_scrollTestViewController];
}

id objc_msgSend_ppt_scrollableBoundsForTesting(void *a1, const char *a2, ...)
{
  return [a1 ppt_scrollableBoundsForTesting];
}

id objc_msgSend_ppt_scrubberView(void *a1, const char *a2, ...)
{
  return [a1 ppt_scrubberView];
}

id objc_msgSend_ppt_selectAdjustmentsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_selectAdjustmentsController:");
}

id objc_msgSend_ppt_selectCropController_(void *a1, const char *a2, ...)
{
  return [a1 ppt_selectCropController:];
}

id objc_msgSend_ppt_selectFiltersController_(void *a1, const char *a2, ...)
{
  return [a1 ppt_selectFiltersController:];
}

id objc_msgSend_ppt_selectNextLightingEffect_(void *a1, const char *a2, ...)
{
  return [a1 ppt_selectNextLightingEffect:];
}

id objc_msgSend_ppt_selectPerspectiveController_(void *a1, const char *a2, ...)
{
  return [a1 ppt_selectPerspectiveController:];
}

id objc_msgSend_ppt_startIterationWithBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_startIterationWithBlock:completion:");
}

id objc_msgSend_ppt_tapNextButton_(void *a1, const char *a2, ...)
{
  return [a1 ppt_tapNextButton:];
}

id objc_msgSend_ppt_testDefinitions(void *a1, const char *a2, ...)
{
  return [a1 ppt_testDefinitions];
}

id objc_msgSend_ppt_toggleAccessoryView(void *a1, const char *a2, ...)
{
  return [a1 ppt_toggleAccessoryView];
}

id objc_msgSend_ppt_toggleDiscloseWidgets(void *a1, const char *a2, ...)
{
  return [a1 ppt_toggleDiscloseWidgets];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_prepareForScrollTestWithName_options_readyHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareForScrollTestWithName:options:readyHandler:];
}

id objc_msgSend_prepareForTransitionTestWithName_options_readyHandler_(void *a1, const char *a2, ...)
{
  return [a1 prepareForTransitionTestWithName:options:readyHandler:];
}

id objc_msgSend_prepareInformationForLookups(void *a1, const char *a2, ...)
{
  return _[a1 prepareInformationForLookups];
}

id objc_msgSend_presentRetailExperienceView(void *a1, const char *a2, ...)
{
  return _[a1 presentRetailExperienceView];
}

id objc_msgSend_presentUpsellSheetIfNecessaryWithActivationOptions_(void *a1, const char *a2, ...)
{
  return [a1 presentUpsellSheetIfNecessaryWithActivationOptions:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentWelcomeViewControllersIfNecessaryFromViewController_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentWelcomeViewControllersIfNecessaryFromViewController:completion:];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_privacyControllerForCollection_(void *a1, const char *a2, ...)
{
  return [a1 privacyControllerForCollection:];
}

id objc_msgSend_pu_debugCurrentAsset(void *a1, const char *a2, ...)
{
  return [a1 pu_debugCurrentAsset];
}

id objc_msgSend_pu_finishedAnimationSubTest_forTest_(void *a1, const char *a2, ...)
{
  return [a1 pu_finishedAnimationSubTest:forTest:];
}

id objc_msgSend_pu_popViewControllerAnimated_interactive_(void *a1, const char *a2, ...)
{
  return [a1 pu_popViewControllerAnimated:interactive:];
}

id objc_msgSend_pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis_(void *a1, const char *a2, ...)
{
  return [a1 pu_ppt_performPageSwipeTest:iterations:numberOfPages:scrollAxis:];
}

id objc_msgSend_pu_prepareCPAnalytics(void *a1, const char *a2, ...)
{
  return [a1 pu_prepareCPAnalytics];
}

id objc_msgSend_pu_pushViewController_withTransition_animated_isInteractive_(void *a1, const char *a2, ...)
{
  return [a1 pu_pushViewController:withTransition:animated:isInteractive:];
}

id objc_msgSend_pu_startedAnimationSubTest_forTest_(void *a1, const char *a2, ...)
{
  return [a1 pu_startedAnimationSubTest:forTest:];
}

id objc_msgSend_publicDescription(void *a1, const char *a2, ...)
{
  return _[a1 publicDescription];
}

id objc_msgSend_purgeAll(void *a1, const char *a2, ...)
{
  return _[a1 purgeAll];
}

id objc_msgSend_px_beginPausingChangesWithTimeout_identifier_(void *a1, const char *a2, ...)
{
  return [a1 px_beginPausingChangesWithTimeout:];
}

id objc_msgSend_px_builtInAlbumNameForSubtype_(void *a1, const char *a2, ...)
{
  return [a1 px_builtInAlbumNameForSubtype:];
}

id objc_msgSend_px_deprecated_appPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 px_deprecated_appPhotoLibrary];
}

id objc_msgSend_px_descendantViewControllerWithClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_descendantViewControllerWithClass:");
}

id objc_msgSend_px_descriptionForAssertionMessage(void *a1, const char *a2, ...)
{
  return [a1 px_descriptionForAssertionMessage];
}

id objc_msgSend_px_enableExtendedTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 px_enableExtendedTraitCollection];
}

id objc_msgSend_px_endPausingChanges_(void *a1, const char *a2, ...)
{
  return [a1 px_endPausingChanges:];
}

id objc_msgSend_px_enumerateDescendantSubviewsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_enumerateDescendantSubviewsUsingBlock:");
}

id objc_msgSend_px_firstKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 px_firstKeyWindow];
}

id objc_msgSend_px_genericErrorWithDebugDescription_(void *a1, const char *a2, ...)
{
  return [a1 px_genericErrorWithDebugDescription:];
}

id objc_msgSend_px_integerValues(void *a1, const char *a2, ...)
{
  return [a1 px_integerValues];
}

id objc_msgSend_px_isScrolledAtEdge_(void *a1, const char *a2, ...)
{
  return [a1 px_isScrolledAtEdge:];
}

id objc_msgSend_px_photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 px_photoLibrary];
}

id objc_msgSend_px_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 px_systemPhotoLibrary];
}

id objc_msgSend_px_topmostPresentedViewController(void *a1, const char *a2, ...)
{
  return [a1 px_topmostPresentedViewController];
}

id objc_msgSend_px_virtualCollections(void *a1, const char *a2, ...)
{
  return [a1 px_virtualCollections];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryKeysAndValues(void *a1, const char *a2, ...)
{
  return _[a1 queryKeysAndValues];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:];
}

id objc_msgSend_redo(void *a1, const char *a2, ...)
{
  return _[a1 redo];
}

id objc_msgSend_redoMenuItemTitle(void *a1, const char *a2, ...)
{
  return _[a1 redoMenuItemTitle];
}

id objc_msgSend_refreshRate(void *a1, const char *a2, ...)
{
  return _[a1 refreshRate];
}

id objc_msgSend_registerChangeObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerChangeObserver:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeMenuForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeMenuForIdentifier];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_replaceChildrenOfMenuForIdentifier_fromChildrenBlock_(void *a1, const char *a2, ...)
{
  return [a1 replaceChildrenOfMenuForIdentifier:fromChildrenBlock:];
}

id objc_msgSend_reportLatency_forOutputQuality_(void *a1, const char *a2, ...)
{
  return [a1 reportLatency:forOutputQuality:];
}

id objc_msgSend_reportPhotosAppEnteredBackground(void *a1, const char *a2, ...)
{
  return _[a1 reportPhotosAppEnteredBackground];
}

id objc_msgSend_reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText_previousSearchTokens_(void *a1, const char *a2, ...)
{
  return [a1 reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:previousSearchText:previousSearchTokens:];
}

id objc_msgSend_reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity(void *a1, const char *a2, ...)
{
  return _[a1 reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity];
}

id objc_msgSend_reportPhotosAppQuit(void *a1, const char *a2, ...)
{
  return _[a1 reportPhotosAppQuit];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestAccessForEntityType:completionHandler:];
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestAuthorizationWithOptions:completionHandler:];
}

id objc_msgSend_requestFaceCropForOptions_resultHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestFaceCropForOptions:resultHandler:];
}

id objc_msgSend_requestImageForAsset_targetSize_contentMode_options_resultHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestImageForAsset:targetSize:contentMode:options:resultHandler:];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 resourceSpecifier];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootAlbumCollectionList(void *a1, const char *a2, ...)
{
  return _[a1 rootAlbumCollectionList];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _[a1 rootController];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_rotateIfNeeded_before_after_(void *a1, const char *a2, ...)
{
  return [a1 rotateIfNeeded:before:after:];
}

id objc_msgSend_routingOptionsForDestination_(void *a1, const char *a2, ...)
{
  return [a1 routingOptionsForDestination:];
}

id objc_msgSend_runEditorialLayoutTestWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 runEditorialLayoutTestWithOptions:completionHandler:];
}

id objc_msgSend_runGridLayoutTestWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 runGridLayoutTestWithOptions:completionHandler:];
}

id objc_msgSend_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runRenderTextTestWithOptions:latencyMeter:completionHandler:failureHandler:");
}

id objc_msgSend_runScrollingTestWithName_type_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 runScrollingTestWithName:type:completionHandler:];
}

id objc_msgSend_runTestWithName_RPTOptions_scrollBounds_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithName:RPTOptions:scrollBounds:completionHandler:];
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:];
}

id objc_msgSend_runTestWithParameters_delegate_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:delegate:];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduleDeferredTaskWithQoS_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduleDeferredTaskWithQoS:block:];
}

id objc_msgSend_schedulePromptWithIdentifier_action_(void *a1, const char *a2, ...)
{
  return [a1 schedulePromptWithIdentifier:action:];
}

id objc_msgSend_scheduleTaskWithQoS_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduleTaskWithQoS:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return _[a1 screenScale];
}

id objc_msgSend_scrollTestCPUSustainDuration(void *a1, const char *a2, ...)
{
  return _[a1 scrollTestCPUSustainDuration];
}

id objc_msgSend_scrollTestCPUWarmupDuration(void *a1, const char *a2, ...)
{
  return _[a1 scrollTestCPUWarmupDuration];
}

id objc_msgSend_scrollTestRampUpDuration(void *a1, const char *a2, ...)
{
  return _[a1 scrollTestRampUpDuration];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_scrollViewController(void *a1, const char *a2, ...)
{
  return _[a1 scrollViewController];
}

id objc_msgSend_scrollViewWillBeginDragging_(void *a1, const char *a2, ...)
{
  return [a1 scrollViewWillBeginDragging:];
}

id objc_msgSend_scrollingPresetNames(void *a1, const char *a2, ...)
{
  return _[a1 scrollingPresetNames];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_sendEvent_withPayload_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:withPayload:];
}

id objc_msgSend_sendNavigationEndEventForURL_(void *a1, const char *a2, ...)
{
  return [a1 sendNavigationEndEventForURL:];
}

id objc_msgSend_sendNavigationStartEventForURL_(void *a1, const char *a2, ...)
{
  return [a1 sendNavigationStartEventForURL:];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActionProviderDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setActionProviderDelegate:];
}

id objc_msgSend_setActivationOptions_(void *a1, const char *a2, ...)
{
  return [a1 setActivationOptions:];
}

id objc_msgSend_setAllowCaching_(void *a1, const char *a2, ...)
{
  return [a1 setAllowCaching:];
}

id objc_msgSend_setAllowImageRequests_(void *a1, const char *a2, ...)
{
  return [a1 setAllowImageRequests:];
}

id objc_msgSend_setAllowSecondaryDegradedImage_(void *a1, const char *a2, ...)
{
  return [a1 setAllowSecondaryDegradedImage:];
}

id objc_msgSend_setAllowedActionTypes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedActionTypes:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setCurrentTestName_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTestName:];
}

id objc_msgSend_setCurrentTestOptions_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTestOptions:];
}

id objc_msgSend_setDefaultValuesWithPresetName_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultValuesWithPresetName:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeliveryMode_(void *a1, const char *a2, ...)
{
  return [a1 setDeliveryMode:];
}

id objc_msgSend_setDidRecieveSpotlightSearchActivity_(void *a1, const char *a2, ...)
{
  return [a1 setDidRecieveSpotlightSearchActivity:];
}

id objc_msgSend_setDiscoverabilityTitle_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoverabilityTitle:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEnableInlinePlayback_(void *a1, const char *a2, ...)
{
  return [a1 setEnableInlinePlayback:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setFetchPropertySets_(void *a1, const char *a2, ...)
{
  return [a1 setFetchPropertySets:];
}

id objc_msgSend_setHDRConsideration_(void *a1, const char *a2, ...)
{
  return [a1 setHDRConsideration];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImportSource_(void *a1, const char *a2, ...)
{
  return [a1 setImportSource:];
}

id objc_msgSend_setImportViewController_forImportSource_(void *a1, const char *a2, ...)
{
  return [a1 setImportViewController:forImportSource:];
}

id objc_msgSend_setImportViewControllerProvider_(void *a1, const char *a2, ...)
{
  return [a1 setImportViewControllerProvider:];
}

id objc_msgSend_setIncludeAllPhotosSmartAlbum_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeAllPhotosSmartAlbum:];
}

id objc_msgSend_setIncludeAssetSourceTypes_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeAssetSourceTypes:];
}

id objc_msgSend_setIncludeHiddenAssets_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeHiddenAssets:];
}

id objc_msgSend_setInternalCreateOptions_(void *a1, const char *a2, ...)
{
  return [a1 setInternalCreateOptions:];
}

id objc_msgSend_setInternalPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setInternalPredicate:];
}

id objc_msgSend_setInternalSortDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setInternalSortDescriptors:];
}

id objc_msgSend_setInvitationStateLocalForInvitationRecords_invitationStateLocal_(void *a1, const char *a2, ...)
{
  return [a1 setInvitationStateLocalForInvitationRecords:invitationStateLocal:];
}

id objc_msgSend_setIterationDurationFactor_(void *a1, const char *a2, ...)
{
  return [a1 setIterationDurationFactor:];
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setLargeTitleDisplayMode:];
}

id objc_msgSend_setLastDidEnterBackgroundDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastDidEnterBackgroundDate:];
}

id objc_msgSend_setLastUploadAttemptDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastUploadAttemptDate:];
}

id objc_msgSend_setLemonadeRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setLemonadeRootViewController:];
}

id objc_msgSend_setMainWindow_(void *a1, const char *a2, ...)
{
  return [a1 setMainWindow:];
}

id objc_msgSend_setMaxNumberOfPlayingItems_(void *a1, const char *a2, ...)
{
  return [a1 setMaxNumberOfPlayingItems:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setNetworkAccessAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkAccessAllowed:];
}

id objc_msgSend_setNumberOfColumns_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfColumns:];
}

id objc_msgSend_setNumberOfRows_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfRows:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setPendingCloudKitShareURLToOpen_(void *a1, const char *a2, ...)
{
  return [a1 setPendingCloudKitShareURLToOpen];
}

id objc_msgSend_setPendingProgrammaticNavigationRequestToOpen_(void *a1, const char *a2, ...)
{
  return [a1 setPendingProgrammaticNavigationRequestToOpen:];
}

id objc_msgSend_setPendingURLToOpen_(void *a1, const char *a2, ...)
{
  return [a1 setPendingURLToOpen:];
}

id objc_msgSend_setPendingUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 setPendingUserActivity:];
}

id objc_msgSend_setPerformerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setPerformerDelegate:];
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersLargeTitles:];
}

id objc_msgSend_setPresentationEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setPresentationEnvironment:];
}

id objc_msgSend_setPreventSheetDismissal_(void *a1, const char *a2, ...)
{
  return [a1 setPreventSheetDismissal:];
}

id objc_msgSend_setResizeMode_(void *a1, const char *a2, ...)
{
  return [a1 setResizeMode:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setShouldFlick_(void *a1, const char *a2, ...)
{
  return [a1 setShouldFlick:];
}

id objc_msgSend_setSpec_(void *a1, const char *a2, ...)
{
  return [a1 setSpec:];
}

id objc_msgSend_setSplitViewController_(void *a1, const char *a2, ...)
{
  return [a1 setSplitViewController:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSwipeCount_(void *a1, const char *a2, ...)
{
  return [a1 setSwipeCount:];
}

id objc_msgSend_setSwipeSpeedFactor_(void *a1, const char *a2, ...)
{
  return [a1 setSwipeSpeedFactor:];
}

id objc_msgSend_setTestName_(void *a1, const char *a2, ...)
{
  return [a1 setTestName:];
}

id objc_msgSend_setTestOptions_(void *a1, const char *a2, ...)
{
  return [a1 setTestOptions:];
}

id objc_msgSend_setUndoActionsInvalidator_(void *a1, const char *a2, ...)
{
  return [a1 setUndoActionsInvalidator:];
}

id objc_msgSend_setVariationSuggestionStates_forVariationType_(void *a1, const char *a2, ...)
{
  return [a1 setVariationSuggestionStates:forVariationType:];
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return [a1 setVersion:];
}

id objc_msgSend_setViewController_forColumn_(void *a1, const char *a2, ...)
{
  return [a1 setViewController:forColumn:];
}

id objc_msgSend_setViewMode_(void *a1, const char *a2, ...)
{
  return [a1 setViewMode:];
}

id objc_msgSend_setWantsIncrementalChangeDetails_(void *a1, const char *a2, ...)
{
  return [a1 setWantsIncrementalChangeDetails:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setupAppUI(void *a1, const char *a2, ...)
{
  return _[a1 setupAppUI];
}

id objc_msgSend_setupOnInternalDevicesWithWindow_(void *a1, const char *a2, ...)
{
  return [a1 setupOnInternalDevicesWithWindow:];
}

id objc_msgSend_setupStatusBarInternalSettingsGestureOnInternalDevices(void *a1, const char *a2, ...)
{
  return _[a1 setupStatusBarInternalSettingsGestureOnInternalDevices];
}

id objc_msgSend_setupSystemPropertyProvidersForLibrary_(void *a1, const char *a2, ...)
{
  return [a1 setupSystemPropertyProvidersForLibrary:];
}

id objc_msgSend_setupWithConfigurationFilename_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 setupWithConfigurationFilename:inBundle:];
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return _[a1 share];
}

id objc_msgSend_sharedAlbumsCollectionList(void *a1, const char *a2, ...)
{
  return _[a1 sharedAlbumsCollectionList];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedContactStore(void *a1, const char *a2, ...)
{
  return _[a1 sharedContactStore];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedLibraryStatusProviderWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return [a1 sharedLibraryStatusProviderWithPhotoLibrary:];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _[a1 sharedSettings];
}

id objc_msgSend_sharedStreamsEnabledForPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return [a1 sharedStreamsEnabledForPhotoLibraryURL:];
}

id objc_msgSend_sharingPersonID(void *a1, const char *a2, ...)
{
  return _[a1 sharingPersonID];
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItem];
}

id objc_msgSend_shortcutURLForShortcutItem_(void *a1, const char *a2, ...)
{
  return [a1 shortcutURLForShortcutItem:];
}

id objc_msgSend_shouldMobileSlideShowLaunchWithError_(void *a1, const char *a2, ...)
{
  return [a1 shouldMobileSlideShowLaunchWithError:];
}

id objc_msgSend_shouldPromptUserForLibrarySchemaMismatch(void *a1, const char *a2, ...)
{
  return _[a1 shouldPromptUserForLibrarySchemaMismatch];
}

id objc_msgSend_shouldTestNestedScrollView(void *a1, const char *a2, ...)
{
  return _[a1 shouldTestNestedScrollView];
}

id objc_msgSend_shouldUseRPTScrollingForRPTOptions_(void *a1, const char *a2, ...)
{
  return [a1 shouldUseRPTScrollingForRPTOptions:];
}

id objc_msgSend_showPromptsIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 showPromptsIfNeededWithCompletion:];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_spec(void *a1, const char *a2, ...)
{
  return _[a1 spec];
}

id objc_msgSend_specForIdiom_(void *a1, const char *a2, ...)
{
  return [a1 specForIdiom:];
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return _[a1 splitViewController];
}

id objc_msgSend_standardDeviation(void *a1, const char *a2, ...)
{
  return _[a1 standardDeviation];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAppTracking(void *a1, const char *a2, ...)
{
  return _[a1 startAppTracking];
}

id objc_msgSend_startMeasurementsForOutputType_(void *a1, const char *a2, ...)
{
  return [a1 startMeasurementsForOutputType:];
}

id objc_msgSend_startServerOnInternalDevicesWithAgentClass_(void *a1, const char *a2, ...)
{
  return [a1 startServerOnInternalDevicesWithAgentClass:];
}

id objc_msgSend_startViewTracking(void *a1, const char *a2, ...)
{
  return _[a1 startViewTracking];
}

id objc_msgSend_startedCurrentTest(void *a1, const char *a2, ...)
{
  return _[a1 startedCurrentTest];
}

id objc_msgSend_startedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return [a1 startedSubTest:forTest:];
}

id objc_msgSend_startedSubTest_forTest_withMetrics_(void *a1, const char *a2, ...)
{
  return [a1 startedSubTest:forTest:withMetrics:];
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return [a1 startedTest:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateRestorationActivity(void *a1, const char *a2, ...)
{
  return _[a1 stateRestorationActivity];
}

id objc_msgSend_stopMeasurements(void *a1, const char *a2, ...)
{
  return _[a1 stopMeasurements];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_submitWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithCompletionHandler:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_swipeSpeedFactor_(void *a1, const char *a2, ...)
{
  return [a1 swipeSpeedFactor:];
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _[a1 system];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemLibraryURL(void *a1, const char *a2, ...)
{
  return _[a1 systemLibraryURL];
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 systemPhotoLibrary];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 typeWithIdentifier:];
}

id objc_msgSend_undo(void *a1, const char *a2, ...)
{
  return _[a1 undo];
}

id objc_msgSend_undoActionsInvalidator(void *a1, const char *a2, ...)
{
  return _[a1 undoActionsInvalidator];
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return _[a1 undoManager];
}

id objc_msgSend_undoMenuItemTitle(void *a1, const char *a2, ...)
{
  return _[a1 undoMenuItemTitle];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAppShortcutParameters(void *a1, const char *a2, ...)
{
  return _[a1 updateAppShortcutParameters];
}

id objc_msgSend_updateShowHiddenAlbumCachedValue(void *a1, const char *a2, ...)
{
  return _[a1 updateShowHiddenAlbumCachedValue];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _[a1 userActivities];
}

id objc_msgSend_userActivityURLForUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 userActivityURLForUserActivity:];
}

id objc_msgSend_userDidViewSharedLibraryParticipantAssetTrashNotification(void *a1, const char *a2, ...)
{
  return _[a1 userDidViewSharedLibraryParticipantAssetTrashNotification];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userLibraryAlbumInLibrary_(void *a1, const char *a2, ...)
{
  return [a1 userLibraryAlbumInLibrary:];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_uuidFromAssetURL_(void *a1, const char *a2, ...)
{
  return [a1 uuidFromAssetURL:];
}

id objc_msgSend_uuidFromLocalIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 uuidFromLocalIdentifier];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 valueForKeyPath:];
}

id objc_msgSend_variationCache(void *a1, const char *a2, ...)
{
  return _[a1 variationCache];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewControllerWithConfiguration_contentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerWithConfiguration:contentViewController:");
}

id objc_msgSend_viewControllerWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerWithPhotoLibrary:];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _[a1 viewModel];
}

id objc_msgSend_viewProvider(void *a1, const char *a2, ...)
{
  return _[a1 viewProvider];
}

id objc_msgSend_viewResetTimeoutDuration(void *a1, const char *a2, ...)
{
  return _[a1 viewResetTimeoutDuration];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return _[a1 yellowColor];
}

id objc_msgSend_zoomLevel(void *a1, const char *a2, ...)
{
  return _[a1 zoomLevel];
}