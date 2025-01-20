void sub_100002EF0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  NSURL *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void aBlock[6];

  sub_100003940();
  __chkstk_darwin();
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = [a1 fileURL];
  sub_100003930();

  v9 = objc_allocWithZone((Class)WFShortcutExtractor);
  v11 = sub_100003420((uint64_t)v7, 1, 1, 0, 0, v10);
  v12 = (void *)swift_allocObject();
  v12[2] = a2;
  v12[3] = a3;
  v12[4] = a1;
  aBlock[4] = sub_10000357C;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003194;
  aBlock[3] = &unk_100004298;
  v13 = _Block_copy(aBlock);
  swift_retain();
  v14 = a1;
  swift_release();
  [v11 extractShortcutWithCompletion:v13];
  _Block_release(v13);
}

id sub_10000308C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  v9[4] = a1;
  v9[5] = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100003154;
  v9[3] = &unk_1000042E8;
  v6 = _Block_copy(v9);
  id v7 = [swift_getObjCClassFromMetadata() replyWithContextSize:v6 currentContextDrawingBlock:a3];
  _Block_release(v6);
  swift_release();
  return v7;
}

uint64_t sub_100003154(uint64_t a1)
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

void sub_100003194(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1000032C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100003910();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id sub_100003330()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailProvider();
  return [super init];
}

id sub_100003388()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailProvider();
  return [super dealloc];
}

uint64_t type metadata accessor for ThumbnailProvider()
{
  return self;
}

uint64_t sub_1000033E0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100003418(uint64_t a1, uint64_t a2)
{
  sub_1000032C0(a1, a2, *(void *)(v2 + 16));
}

id sub_100003420@<X0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X4>, uint64_t a5@<X6>, NSURL *a6@<X8>)
{
  id v7 = v6;
  sub_100003920(a6);
  v14 = v13;
  if (!a4)
  {
    NSString v15 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v16 = 0;
    goto LABEL_6;
  }
  NSString v15 = sub_100003950();
  swift_bridgeObjectRelease();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v16 = sub_100003950();
  swift_bridgeObjectRelease();
LABEL_6:
  id v17 = [v7 initWithURL:v14 allowsOldFormatFile:a2 & 1 skipsMaliciousScanning:a3 & 1 suggestedName:v15 sourceApplication:v16];

  uint64_t v18 = sub_100003940();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a1, v18);
  return v17;
}

uint64_t sub_10000353C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000357C(void *a1)
{
  uint64_t v2 = *(void (**)(void))(v1 + 16);
  if (a1)
  {
    v3 = *(void **)(v1 + 32);
    id v15 = a1;
    [v3 maximumSize];
    double v5 = v4;
    [v3 maximumSize];
    if (v6 < v5) {
      double v5 = v6;
    }
    [v3 scale];
    uint64_t v8 = v7;
    id v9 = [v15 record];
    id v10 = [v9 icon];

    sub_10000372C();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    *(void *)(v11 + 24) = v10;
    *(double *)(v11 + 32) = v5;
    *(double *)(v11 + 40) = v5;
    id v12 = v10;
    id v13 = sub_10000308C((uint64_t)sub_1000037A4, v11, v5, v5);
    [v13 setIconFlavor:0];
    id v14 = v13;
    ((void (*)(id, void))v2)(v13, 0);
  }
  else
  {
    v2();
  }
}

uint64_t sub_100003714(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003724()
{
  return swift_release();
}

unint64_t sub_10000372C()
{
  unint64_t result = qword_1000081A0;
  if (!qword_1000081A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000081A0);
  }
  return result;
}

uint64_t sub_10000376C()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000037A4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  double v2 = *(double *)(v0 + 32);
  double v3 = *(double *)(v0 + 40);
  id v4 = [self currentContextWithScale:*(double *)(v0 + 16)];
  id v5 = [objc_allocWithZone((Class)WFWorkflowIconDrawer) initWithIcon:v1];
  [v5 setCornerRadius:1.0];
  [v5 drawInContext:v4 inRect:0.0, 0.0, v2, v3];

  return 1;
}

__n128 sub_100003864(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003874(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003894(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_1000081A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000081A8);
    }
  }
}

uint64_t sub_100003910()
{
  return _convertErrorToNSError(_:)();
}

void sub_100003920(NSURL *retstr@<X8>)
{
}

uint64_t sub_100003930()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003940()
{
  return type metadata accessor for URL();
}

NSString sub_100003950()
{
  return String._bridgeToObjectiveC()();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}