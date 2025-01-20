UIImage *sub_100005BBC()
{
  void *v0;
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  id v6;
  double v7;
  CGFloat v8;
  UIImage *v9;
  CGSize v11;

  [v0 bounds];
  v3 = v2;
  v5 = v4;
  v6 = [self mainScreen];
  [v6 scale];
  v8 = v7;

  v11.width = v3;
  v11.height = v5;
  UIGraphicsBeginImageContextWithOptions(v11, 0, v8);
  [v0 bounds];
  [v0 drawViewHierarchyInRect:0];
  v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v9;
}

id sub_100005C9C(uint64_t a1, uint64_t a2)
{
  id v5 = [objc_allocWithZone((Class)UILabel) init];
  sub_100006FE4(a1, a2, v5);
  id v6 = [self systemFontOfSize:15.0];
  [v5 setFont:v6];

  [v5 setNumberOfLines:0];
  v7 = self;
  id v8 = [v7 whiteColor];
  [v5 setTextColor:v8];

  id v9 = v5;
  id v10 = [v7 blackColor];
  id v11 = [v10 colorWithAlphaComponent:0.3];

  [v9 setBackgroundColor:v11];
  [v9 sizeToFit];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 addSubview:v9];
  v12 = self;
  sub_1000068D8(&qword_10006BBA0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100055290;
  id v14 = [v9 leadingAnchor];
  id v15 = [v2 safeAreaLayoutGuide];
  id v16 = [v15 leadingAnchor];

  id v17 = [v14 constraintEqualToAnchor:v16];
  *(void *)(v13 + 32) = v17;
  id v18 = [v9 trailingAnchor];
  id v19 = [v2 safeAreaLayoutGuide];
  id v20 = [v19 trailingAnchor];

  id v21 = [v18 constraintEqualToAnchor:v20];
  *(void *)(v13 + 40) = v21;
  id v22 = [v9 bottomAnchor];
  id v23 = [v2 safeAreaLayoutGuide];
  id v24 = [v23 bottomAnchor];

  id v25 = [v22 constraintLessThanOrEqualToAnchor:v24 constant:-200.0];
  *(void *)(v13 + 48) = v25;
  sub_100053FE8();
  sub_10000691C();
  Class isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  [v12 activateConstraints:isa];

  return v9;
}

char *sub_100006038(uint64_t a1)
{
  uint64_t v2 = sub_100053CA8();
  __chkstk_darwin(v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  id v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v7 = sub_10002AFE8((uint64_t)v4);
  sub_100006124(v7, 1);
  return v7;
}

void sub_100006124(void *a1, char a2)
{
  id v5 = [a1 layer];
  [v5 setZPosition:sub_10004C2B8(a2)];

  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 addSubview:a1];
  id v6 = self;
  sub_1000068D8(&qword_10006BBA0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000552A0;
  id v8 = [a1 leadingAnchor];
  id v9 = [v2 leadingAnchor];
  id v10 = sub_100007680();

  *(void *)(v7 + 32) = v10;
  id v11 = [a1 trailingAnchor];
  id v12 = [v2 trailingAnchor];
  id v13 = sub_100007680();

  *(void *)(v7 + 40) = v13;
  id v14 = [a1 topAnchor];
  id v15 = [v2 topAnchor];
  id v16 = sub_100007680();

  *(void *)(v7 + 48) = v16;
  id v17 = [a1 bottomAnchor];
  id v18 = [v2 bottomAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  *(void *)(v7 + 56) = v19;
  sub_100053FE8();
  sub_10000691C();
  Class isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  [v6 activateConstraints:isa];
}

void sub_1000063A4(CGFloat a1, double a2, double a3)
{
  if (a1 > 0.0)
  {
    [v3 bounds];
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    v15.size.width = 0.0;
    v15.size.height = 0.0;
    if (!CGRectEqualToRect(v12, v15))
    {
      id v7 = [v3 layer];
      [v7 setAnchorPoint:a2, a3];

      [v3 bounds];
      CGFloat v8 = 1.0 / a1 * (a2 + -0.5) * CGRectGetWidth(v13);
      [v3 bounds];
      CGFloat v9 = 1.0 / a1 * (a3 + -0.5) * CGRectGetHeight(v14);
      CGAffineTransformMakeScale(&v11, a1, a1);
      CGAffineTransformTranslate(&v10, &v11, v8, v9);
      CGAffineTransform v11 = v10;
      [v3 setTransform:&v11];
    }
  }
}

uint64_t variable initialization expression of PosterUpdater.descriptorVersion()
{
  return 3;
}

uint64_t variable initialization expression of WeatherIntentResponse.code()
{
  return 0;
}

void type metadata accessor for CLAuthorizationStatus(uint64_t a1)
{
}

__n128 initializeBufferWithCopyOfBuffer for UnlockState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_10000653C(uint64_t a1, id *a2)
{
  uint64_t result = sub_100053EF8();
  *a2 = 0;
  return result;
}

uint64_t sub_1000065B4(uint64_t a1, id *a2)
{
  char v3 = sub_100053F08();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_100006634()
{
  sub_100053F18();
  NSString v0 = sub_100053EE8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000666C(uint64_t a1, id *a2)
{
  return sub_10000653C(a1, a2);
}

uint64_t sub_100006684(uint64_t a1, id *a2)
{
  return sub_1000065B4(a1, a2) & 1;
}

uint64_t sub_1000066A0()
{
  return sub_100006728(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_1000066D0@<X0>(void *a1@<X8>)
{
  NSString result = sub_100006634();
  *a1 = result;
  return result;
}

uint64_t sub_1000066F8()
{
  return sub_100006728(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006728(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_100053F18();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100006768()
{
  return sub_100006784();
}

uint64_t sub_100006784()
{
  sub_100053F18();
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000067D8()
{
  return sub_1000067F4();
}

Swift::Int sub_1000067F4()
{
  sub_100053F18();
  sub_1000545B8();
  sub_100053F48();
  Swift::Int v0 = sub_1000545D8();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_100006868(uint64_t *a1, uint64_t *a2)
{
  return sub_10000F884(*a1, *a2);
}

void sub_100006874(uint64_t a1@<X8>)
{
  sub_1000068A8();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_1000068B0()
{
  uint64_t v1 = sub_10000769C();
  uint64_t result = WeatherIntentResponseCode.rawValue.getter(v1);
  *Swift::Int v0 = result;
  return result;
}

uint64_t sub_1000068D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000691C()
{
  unint64_t result = qword_10006BBA8;
  if (!qword_10006BBA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006BBA8);
  }
  return result;
}

id sub_10000695C()
{
  return *v0;
}

uint64_t sub_100006964@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_10000696C()
{
  return sub_10002BA9C(*v0);
}

void sub_100006974(uint64_t a1)
{
  sub_100027004(a1, *v1);
}

uint64_t sub_10000697C(uint64_t a1)
{
  return sub_1000274A0(a1, *v1);
}

uint64_t sub_100006984(void *a1, void *a2)
{
  return sub_10000F890(*a1, *a2);
}

uint64_t sub_100006994()
{
  return sub_100053F18();
}

uint64_t sub_1000069A4(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BC68, type metadata accessor for CLError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100006A10(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BC68, type metadata accessor for CLError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100006A7C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007178(&qword_10006BC68, type metadata accessor for CLError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100006B0C()
{
  return sub_100006B14(*v0);
}

uint64_t sub_100006B14(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100054268();

  return v2;
}

uint64_t sub_100006B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007178(&qword_10006BC68, type metadata accessor for CLError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100006BC4()
{
  return sub_1000545D8();
}

uint64_t sub_100006C2C(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BCD0, type metadata accessor for AttributeName);
  uint64_t v3 = sub_100007178(&qword_10006BCD8, type metadata accessor for AttributeName);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006CE8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100053EE8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100006D30()
{
  sub_10000769C();
  uint64_t result = sub_100006D58();
  *Swift::Int v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_100006D5C(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BCC0, type metadata accessor for TraitKey);
  uint64_t v3 = sub_100007178(&qword_10006BCC8, type metadata accessor for TraitKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006E18(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BC70, type metadata accessor for CLError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100006E84(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BC70, type metadata accessor for CLError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100006EF4(uint64_t a1)
{
  uint64_t v2 = sub_100007178(&qword_10006BC68, type metadata accessor for CLError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100006F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007178(&qword_10006BC68, type metadata accessor for CLError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

void sub_100006FE4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100053EE8();
  [a3 setText:v4];
}

void type metadata accessor for Code(uint64_t a1)
{
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

uint64_t sub_100007078(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007098(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

uint64_t sub_1000070E8()
{
  return sub_100007178(&qword_10006BC38, type metadata accessor for UIInterfaceOrientation);
}

uint64_t sub_100007130()
{
  return sub_100007178(&qword_10006BC40, type metadata accessor for AttributeName);
}

uint64_t sub_100007178(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000071C0()
{
  return sub_100007178(&qword_10006BC48, type metadata accessor for AttributeName);
}

uint64_t sub_100007208()
{
  return sub_100007178(&qword_10006BC50, type metadata accessor for TraitKey);
}

uint64_t sub_100007250()
{
  return sub_100007178(&qword_10006BC58, type metadata accessor for TraitKey);
}

uint64_t sub_100007298()
{
  return sub_100007178(&qword_10006BC60, type metadata accessor for Code);
}

uint64_t sub_1000072E0()
{
  return sub_100007178(&qword_10006BC68, type metadata accessor for CLError);
}

void type metadata accessor for CLError(uint64_t a1)
{
}

void sub_10000733C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100007384()
{
  return sub_100007178(&qword_10006BC70, type metadata accessor for CLError);
}

uint64_t sub_1000073CC()
{
  return sub_100007178(&qword_10006BC78, type metadata accessor for CLError);
}

uint64_t sub_100007414()
{
  return sub_100007178((unint64_t *)&unk_10006BC80, type metadata accessor for CLError);
}

uint64_t sub_10000745C()
{
  return sub_100007178((unint64_t *)&qword_10006D950, type metadata accessor for Code);
}

uint64_t sub_1000074A4()
{
  return sub_100007178(&qword_10006BC90, type metadata accessor for Code);
}

unint64_t sub_1000074F0()
{
  unint64_t result = qword_10006BC98;
  if (!qword_10006BC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BC98);
  }
  return result;
}

uint64_t sub_10000753C()
{
  return sub_100007178(&qword_10006BCA0, type metadata accessor for CLError);
}

uint64_t sub_100007584()
{
  return sub_100007178(&qword_10006BCA8, type metadata accessor for CLError);
}

uint64_t sub_1000075CC()
{
  return sub_100007178(&qword_10006BCB0, type metadata accessor for AttributeName);
}

uint64_t sub_100007614()
{
  return sub_100007178(&qword_10006BCB8, type metadata accessor for TraitKey);
}

id sub_100007680()
{
  uint64_t v4 = *(const char **)(v2 + 2424);
  return [v0 v4:v1];
}

uint64_t sub_10000769C()
{
  return *(void *)v0;
}

uint64_t getEnumTagSinglePayload for UnlockState(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && a1[16])
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 3;
      int v2 = v3 - 3;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UnlockState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)unint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnlockState()
{
  return &type metadata for UnlockState;
}

void sub_100007734(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000775C(unsigned __int8 a1)
{
  return sub_1000545D8();
}

Swift::Int sub_1000077A4()
{
  return sub_10000775C(*v0);
}

void sub_1000077AC(uint64_t a1)
{
  sub_100007734(a1, *v1);
}

Swift::Int sub_1000077B4()
{
  Swift::UInt v1 = *v0;
  sub_1000545B8();
  sub_1000545C8(v1);
  return sub_1000545D8();
}

uint64_t sub_1000077F8(char a1)
{
  if (!a1) {
    return 0x64656B636F6CLL;
  }
  if (a1 == 1) {
    return 0x64656B636F6C6E75;
  }
  return 0x697469736E617274;
}

uint64_t sub_100007858()
{
  return sub_1000077F8(*v0);
}

uint64_t sub_100007860(char a1)
{
  sub_100054308(27);
  swift_bridgeObjectRelease();
  strcpy((char *)v5, "screenState:");
  BYTE5(v5[1]) = 0;
  HIWORD(v5[1]) = -5120;
  if (a1)
  {
    if (a1 == 1) {
      v2._countAndFlagsBits = 0x64656B636F6C6E75;
    }
    else {
      v2._countAndFlagsBits = 0x697469736E617274;
    }
    if (a1 == 1) {
      unsigned int v3 = (void *)0xE800000000000000;
    }
    else {
      unsigned int v3 = (void *)0xED0000676E696E6FLL;
    }
  }
  else
  {
    unsigned int v3 = (void *)0xE600000000000000;
    v2._countAndFlagsBits = 0x64656B636F6CLL;
  }
  v2._object = v3;
  sub_100053F58(v2);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x6572676F7270202CLL;
  v6._object = (void *)0xEB000000003A7373;
  sub_100053F58(v6);
  v7._countAndFlagsBits = sub_1000540B8();
  sub_100053F58(v7);
  swift_bridgeObjectRelease();
  return v5[0];
}

BOOL sub_100007984(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_100007994(char a1, char a2, double a3, double a4)
{
  return a3 == a4 && a1 == a2;
}

uint64_t sub_1000079AC()
{
  return sub_100007860(*v0);
}

BOOL sub_1000079B8(char *a1, char *a2)
{
  return sub_100007984(*a1, *a2);
}

BOOL sub_1000079C4(uint64_t a1, uint64_t a2)
{
  return sub_100007994(*(unsigned char *)a1, *(unsigned char *)a2, *(double *)(a1 + 8), *(double *)(a2 + 8));
}

unsigned char *initializeBufferWithCopyOfBuffer for UnlockState.ScreenState(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UnlockState.ScreenState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UnlockState.ScreenState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x100007B38);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_100007B60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007B68(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnlockState.ScreenState()
{
  return &type metadata for UnlockState.ScreenState;
}

unint64_t sub_100007B84()
{
  unint64_t result = qword_10006BE70;
  if (!qword_10006BE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006BE70);
  }
  return result;
}

void *sub_100007BD0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *a1 = *a2;
    a1 = (void *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000534C8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    CGFloat v9 = (char *)a1 + v8;
    CGAffineTransform v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100053198();
    CGRect v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    CGRect v14 = (char *)a1 + v13;
    CGRect v15 = (char *)a2 + v13;
    uint64_t v16 = sub_1000533B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
    uint64_t v18 = a3[9];
    id v19 = (char *)a1 + v18;
    id v20 = (char *)a2 + v18;
    uint64_t v21 = sub_100053C28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = a3[10];
    id v23 = (char *)a1 + v22;
    id v24 = (char *)a2 + v22;
    if (sub_100007FE8((uint64_t)a2 + v22, 1, v11))
    {
      uint64_t v25 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v12(v23, v24, v11);
      sub_100008010((uint64_t)v23, 0, 1, v11);
    }
    uint64_t v27 = a3[11];
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    if (sub_100007FE8((uint64_t)a2 + v27, 1, v11))
    {
      uint64_t v30 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      v12(v28, v29, v11);
      sub_100008010((uint64_t)v28, 0, 1, v11);
    }
    uint64_t v31 = a3[12];
    v32 = (char *)a1 + v31;
    v33 = (char *)a2 + v31;
    uint64_t v34 = sub_100053E38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    uint64_t v35 = a3[14];
    *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    v36 = (char *)a1 + v35;
    v37 = (char *)a2 + v35;
    uint64_t v38 = sub_100053C68();
    if (sub_100007FE8((uint64_t)v37, 1, v38))
    {
      uint64_t v39 = sub_1000068D8(&qword_10006BE78);
      memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
      sub_100008010((uint64_t)v36, 0, 1, v38);
    }
    uint64_t v40 = a3[16];
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    v41 = (char *)a1 + v40;
    v42 = (char *)a2 + v40;
    uint64_t v43 = sub_100053CB8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    uint64_t v44 = a3[17];
    uint64_t v45 = a3[18];
    v46 = *(void **)((char *)a2 + v44);
    *(void *)((char *)a1 + v44) = v46;
    v47 = *(void **)((char *)a2 + v45);
    *(void *)((char *)a1 + v45) = v47;
    id v48 = v46;
    id v49 = v47;
  }
  return a1;
}

uint64_t sub_100007FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100008010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void sub_100008038(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1000534C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_100053198();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[9];
  uint64_t v11 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = a1 + a2[10];
  if (!sub_100007FE8(v12, 1, v6)) {
    v7(v12, v6);
  }
  uint64_t v13 = a1 + a2[11];
  if (!sub_100007FE8(v13, 1, v6)) {
    v7(v13, v6);
  }
  uint64_t v14 = a1 + a2[12];
  uint64_t v15 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = a1 + a2[14];
  uint64_t v17 = sub_100053C68();
  if (!sub_100007FE8(v16, 1, v17)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  uint64_t v18 = a1 + a2[16];
  uint64_t v19 = sub_100053CB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);

  id v20 = *(void **)(a1 + a2[18]);
}

uint64_t sub_1000082C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000534C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100053198();
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  id v23 = (const void *)(a2 + v21);
  if (sub_100007FE8(a2 + v21, 1, v10))
  {
    uint64_t v24 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v11(v22, v23, v10);
    sub_100008010((uint64_t)v22, 0, 1, v10);
  }
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  if (sub_100007FE8(a2 + v25, 1, v10))
  {
    uint64_t v28 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    v11(v26, v27, v10);
    sub_100008010((uint64_t)v26, 0, 1, v10);
  }
  uint64_t v29 = a3[12];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  uint64_t v32 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
  uint64_t v33 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  uint64_t v36 = sub_100053C68();
  if (sub_100007FE8((uint64_t)v35, 1, v36))
  {
    uint64_t v37 = sub_1000068D8(&qword_10006BE78);
    memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
    sub_100008010((uint64_t)v34, 0, 1, v36);
  }
  uint64_t v38 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_100053CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  uint64_t v42 = a3[17];
  uint64_t v43 = a3[18];
  uint64_t v44 = *(void **)(a2 + v42);
  *(void *)(a1 + v42) = v44;
  uint64_t v45 = *(void **)(a2 + v43);
  *(void *)(a1 + v43) = v45;
  id v46 = v44;
  id v47 = v45;
  return a1;
}

uint64_t sub_10000868C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000534C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100053198();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 24);
  v12(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  id v23 = (const void *)(a2 + v21);
  int v24 = sub_100007FE8(a1 + v21, 1, v10);
  int v25 = sub_100007FE8((uint64_t)v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v22, v23, v10);
      sub_100008010((uint64_t)v22, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_6:
    uint64_t v26 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  v12(v22, v23, v10);
LABEL_7:
  uint64_t v27 = a3[11];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  int v30 = sub_100007FE8(a1 + v27, 1, v10);
  int v31 = sub_100007FE8((uint64_t)v29, 1, v10);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v28, v29, v10);
      sub_100008010((uint64_t)v28, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
LABEL_12:
    uint64_t v32 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  v12(v28, v29, v10);
LABEL_13:
  uint64_t v33 = a3[12];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 24))(v34, v35, v36);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  uint64_t v37 = a3[14];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (const void *)(a2 + v37);
  uint64_t v40 = sub_100053C68();
  int v41 = sub_100007FE8((uint64_t)v38, 1, v40);
  int v42 = sub_100007FE8((uint64_t)v39, 1, v40);
  if (!v41)
  {
    uint64_t v43 = *(void *)(v40 - 8);
    if (!v42)
    {
      (*(void (**)(void *, const void *, uint64_t))(v43 + 24))(v38, v39, v40);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v43 + 8))(v38, v40);
    goto LABEL_18;
  }
  if (v42)
  {
LABEL_18:
    uint64_t v44 = sub_1000068D8(&qword_10006BE78);
    memcpy(v38, v39, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
  sub_100008010((uint64_t)v38, 0, 1, v40);
LABEL_19:
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v45 = a3[16];
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  uint64_t v48 = sub_100053CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 24))(v46, v47, v48);
  uint64_t v49 = a3[17];
  v50 = *(void **)(a1 + v49);
  v51 = *(void **)(a2 + v49);
  *(void *)(a1 + v49) = v51;
  id v52 = v51;

  uint64_t v53 = a3[18];
  v54 = *(void **)(a1 + v53);
  v55 = *(void **)(a2 + v53);
  *(void *)(a1 + v53) = v55;
  id v56 = v55;

  return a1;
}

uint64_t sub_100008BC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000534C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100053198();
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  id v23 = (const void *)(a2 + v21);
  if (sub_100007FE8(a2 + v21, 1, v10))
  {
    uint64_t v24 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v11(v22, v23, v10);
    sub_100008010((uint64_t)v22, 0, 1, v10);
  }
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  if (sub_100007FE8(a2 + v25, 1, v10))
  {
    uint64_t v28 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    v11(v26, v27, v10);
    sub_100008010((uint64_t)v26, 0, 1, v10);
  }
  uint64_t v29 = a3[12];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  uint64_t v32 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  uint64_t v33 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  uint64_t v36 = sub_100053C68();
  if (sub_100007FE8((uint64_t)v35, 1, v36))
  {
    uint64_t v37 = sub_1000068D8(&qword_10006BE78);
    memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
    sub_100008010((uint64_t)v34, 0, 1, v36);
  }
  uint64_t v38 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  uint64_t v41 = sub_100053CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
  uint64_t v42 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v42) = *(void *)(a2 + v42);
  return a1;
}

uint64_t sub_100008F84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000534C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100053198();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  uint64_t v22 = a3[10];
  id v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  int v25 = sub_100007FE8(a1 + v22, 1, v10);
  int v26 = sub_100007FE8((uint64_t)v24, 1, v10);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v23, v24, v10);
      sub_100008010((uint64_t)v23, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v23, v10);
LABEL_6:
    uint64_t v27 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  v12(v23, v24, v10);
LABEL_7:
  uint64_t v28 = a3[11];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  int v31 = sub_100007FE8(a1 + v28, 1, v10);
  int v32 = sub_100007FE8((uint64_t)v30, 1, v10);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v29, v30, v10);
      sub_100008010((uint64_t)v29, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v32)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v29, v10);
LABEL_12:
    uint64_t v33 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  v12(v29, v30, v10);
LABEL_13:
  uint64_t v34 = a3[12];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  uint64_t v37 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 40))(v35, v36, v37);
  uint64_t v38 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (const void *)(a2 + v38);
  uint64_t v41 = sub_100053C68();
  int v42 = sub_100007FE8((uint64_t)v39, 1, v41);
  int v43 = sub_100007FE8((uint64_t)v40, 1, v41);
  if (!v42)
  {
    uint64_t v44 = *(void *)(v41 - 8);
    if (!v43)
    {
      (*(void (**)(void *, const void *, uint64_t))(v44 + 40))(v39, v40, v41);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v44 + 8))(v39, v41);
    goto LABEL_18;
  }
  if (v43)
  {
LABEL_18:
    uint64_t v45 = sub_1000068D8(&qword_10006BE78);
    memcpy(v39, v40, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
  sub_100008010((uint64_t)v39, 0, 1, v41);
LABEL_19:
  uint64_t v46 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_100053CB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 40))(v47, v48, v49);
  uint64_t v50 = a3[17];
  v51 = *(void **)(a1 + v50);
  *(void *)(a1 + v50) = *(void *)(a2 + v50);

  uint64_t v52 = a3[18];
  uint64_t v53 = *(void **)(a1 + v52);
  *(void *)(a1 + v52) = *(void *)(a2 + v52);

  return a1;
}

uint64_t sub_1000094A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000094BC);
}

uint64_t sub_1000094BC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_1000534C8();
  sub_10000AF24();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_18:
    return sub_100007FE8(v9, a2, v8);
  }
  sub_100053198();
  sub_10000AF24();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[5];
LABEL_17:
    uint64_t v9 = a1 + v12;
    goto LABEL_18;
  }
  sub_1000533B8();
  sub_10000AF24();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[6];
    goto LABEL_17;
  }
  sub_100053C28();
  sub_10000AF24();
  if (*(_DWORD *)(v16 + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = a3[9];
    goto LABEL_17;
  }
  sub_1000068D8((uint64_t *)&unk_10006C4C0);
  sub_10000AF24();
  if (*(_DWORD *)(v18 + 84) == a2)
  {
    uint64_t v8 = v17;
    uint64_t v12 = a3[10];
    goto LABEL_17;
  }
  sub_100053E38();
  sub_10000AF24();
  if (*(_DWORD *)(v20 + 84) == a2)
  {
    uint64_t v8 = v19;
    uint64_t v12 = a3[12];
    goto LABEL_17;
  }
  sub_1000068D8(&qword_10006BE78);
  sub_10000AF24();
  if (*(_DWORD *)(v22 + 84) == a2)
  {
    uint64_t v8 = v21;
    uint64_t v12 = a3[14];
    goto LABEL_17;
  }
  sub_100053CB8();
  sub_10000AF24();
  if (*(_DWORD *)(v24 + 84) == a2)
  {
    uint64_t v8 = v23;
    uint64_t v12 = a3[16];
    goto LABEL_17;
  }
  unint64_t v26 = *(void *)(a1 + a3[17]);
  if (v26 >= 0xFFFFFFFF) {
    LODWORD(v26) = -1;
  }
  int v27 = v26 - 1;
  if (v27 < 0) {
    int v27 = -1;
  }
  return (v27 + 1);
}

uint64_t sub_10000967C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009690);
}

void sub_100009690(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_1000534C8();
  sub_10000AF24();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_100053198();
    sub_10000AF24();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      sub_1000533B8();
      sub_10000AF24();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        sub_100053C28();
        sub_10000AF24();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[9];
        }
        else
        {
          sub_1000068D8((uint64_t *)&unk_10006C4C0);
          sub_10000AF24();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[10];
          }
          else
          {
            sub_100053E38();
            sub_10000AF24();
            if (*(_DWORD *)(v22 + 84) == a3)
            {
              uint64_t v10 = v21;
              uint64_t v14 = a4[12];
            }
            else
            {
              sub_1000068D8(&qword_10006BE78);
              sub_10000AF24();
              if (*(_DWORD *)(v24 + 84) == a3)
              {
                uint64_t v10 = v23;
                uint64_t v14 = a4[14];
              }
              else
              {
                sub_100053CB8();
                sub_10000AF24();
                if (*(_DWORD *)(v26 + 84) != a3)
                {
                  *(void *)(a1 + a4[17]) = a2;
                  return;
                }
                uint64_t v10 = v25;
                uint64_t v14 = a4[16];
              }
            }
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  sub_100008010(v11, a2, a2, v10);
}

uint64_t type metadata accessor for PosterAnimationViewModel()
{
  uint64_t result = qword_10006BED8;
  if (!qword_10006BED8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100009888()
{
  sub_1000534C8();
  if (v0 <= 0x3F)
  {
    sub_100053198();
    if (v1 <= 0x3F)
    {
      sub_1000533B8();
      if (v2 <= 0x3F)
      {
        sub_100053C28();
        if (v3 <= 0x3F)
        {
          sub_100009B14(319, (unint64_t *)&qword_10006BEE8, (void (*)(uint64_t))&type metadata accessor for Date);
          if (v4 <= 0x3F)
          {
            sub_100053E38();
            if (v5 <= 0x3F)
            {
              sub_100009B14(319, (unint64_t *)&unk_10006BEF0, (void (*)(uint64_t))&type metadata accessor for BackgroundMoonData);
              if (v6 <= 0x3F)
              {
                sub_100053CB8();
                if (v7 <= 0x3F) {
                  swift_initStructMetadata();
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_100009B14(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100054278();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100009B68@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, char a5@<W7>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  sub_100053CB8();
  sub_10000AF38();
  uint64_t v40 = v16;
  uint64_t v41 = v15;
  __chkstk_darwin(v15);
  sub_10000AF50();
  uint64_t v37 = v17;
  sub_10000AFE0();
  sub_1000534C8();
  sub_10000B020();
  sub_10000AF24();
  sub_10000AFEC();
  v18();
  uint64_t v19 = (int *)type metadata accessor for PosterAnimationViewModel();
  sub_100053198();
  sub_10000B020();
  sub_10000AF24();
  sub_10000AFEC();
  v20();
  sub_1000533B8();
  sub_10000B020();
  sub_10000AF24();
  sub_10000AFEC();
  v21();
  *(double *)(a6 + v19[7]) = a7;
  *(double *)(a6 + v19[8]) = a8;
  sub_100053C28();
  sub_10000B020();
  uint64_t v34 = v22;
  sub_10000AF24();
  uint64_t v24 = v23;
  sub_10000AFEC();
  v25();
  sub_10000ADF0(a2, a6 + v19[10], (uint64_t *)&unk_10006C4C0);
  sub_10000ADF0(a3, a6 + v19[11], (uint64_t *)&unk_10006C4C0);
  uint64_t v26 = sub_100053E38();
  sub_10000AF24();
  uint64_t v28 = v27;
  sub_10000AFEC();
  v29();
  *(unsigned char *)(a6 + v19[13]) = a5;
  sub_10000ADF0(a9, a6 + v19[14], &qword_10006BE78);
  *(unsigned char *)(a6 + v19[15]) = a12;
  *(void *)(a6 + v19[17]) = a10;
  *(void *)(a6 + v19[18]) = a11;
  sub_10003F45C(v37);
  sub_10000AE4C(a9, &qword_10006BE78);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(a4, v26);
  sub_10000AE4C(a3, (uint64_t *)&unk_10006C4C0);
  sub_10000AE4C(a2, (uint64_t *)&unk_10006C4C0);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a1, v34);
  sub_10000B02C();
  v30();
  sub_10000B02C();
  v31();
  sub_10000B02C();
  v32();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(a6 + v19[16], v37, v41);
}

uint64_t sub_100009ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v99 = sub_100053C68();
  sub_10000AF38();
  uint64_t v94 = v5;
  ((void (*)(void))__chkstk_darwin)();
  sub_10000AF50();
  uint64_t v93 = v6;
  uint64_t v7 = sub_1000068D8(&qword_10006BF58);
  sub_10000AFB4();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000AF50();
  v98 = (char *)v8;
  uint64_t v9 = sub_1000068D8(&qword_10006BE78);
  uint64_t v10 = sub_10000AFD4(v9);
  __chkstk_darwin(v10);
  sub_10000AF84(v11, v87);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v96 = (uint64_t)&v87 - v14;
  __chkstk_darwin(v13);
  uint64_t v97 = (uint64_t)&v87 - v15;
  sub_10000AFE0();
  sub_100053198();
  sub_10000AF38();
  uint64_t v103 = v17;
  uint64_t v104 = v16;
  __chkstk_darwin(v16);
  sub_10000AF50();
  uint64_t v102 = v18;
  uint64_t v19 = sub_1000068D8(&qword_10006BF60);
  sub_10000AFB4();
  __chkstk_darwin(v20);
  sub_10000AFF8();
  uint64_t v101 = v21;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v87 - v23;
  uint64_t v25 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v26 = sub_10000AFD4(v25);
  __chkstk_darwin(v26);
  sub_10000AFF8();
  uint64_t v100 = v27;
  uint64_t v29 = __chkstk_darwin(v28);
  int v31 = (char *)&v87 - v30;
  __chkstk_darwin(v29);
  sub_10000B00C();
  uint64_t v33 = __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v87 - v34;
  uint64_t v36 = __chkstk_darwin(v33);
  uint64_t v38 = (char *)&v87 - v37;
  __chkstk_darwin(v36);
  uint64_t v40 = (char *)&v87 - v39;
  if ((sub_100053488() & 1) == 0) {
    return 0;
  }
  uint64_t v92 = v7;
  uint64_t v41 = (int *)type metadata accessor for PosterAnimationViewModel();
  if ((sub_100053148() & 1) == 0
    || (sub_10000FC40(a1 + v41[6], a2 + v41[6]) & 1) == 0
    || *(double *)(a1 + v41[7]) != *(double *)(a2 + v41[7])
    || *(double *)(a1 + v41[8]) != *(double *)(a2 + v41[8])
    || (sub_100053C18() & 1) == 0)
  {
    return 0;
  }
  uint64_t v42 = v41[10];
  uint64_t v90 = a1;
  sub_10000ADF0(a1 + v42, (uint64_t)v40, (uint64_t *)&unk_10006C4C0);
  v89 = v41;
  uint64_t v43 = v41[10];
  uint64_t v91 = a2;
  sub_10000ADF0(a2 + v43, (uint64_t)v38, (uint64_t *)&unk_10006C4C0);
  uint64_t v44 = (uint64_t)&v24[*(int *)(v19 + 48)];
  sub_10000ADF0((uint64_t)v40, (uint64_t)v24, (uint64_t *)&unk_10006C4C0);
  sub_10000ADF0((uint64_t)v38, v44, (uint64_t *)&unk_10006C4C0);
  uint64_t v45 = v104;
  if (sub_100007FE8((uint64_t)v24, 1, v104) == 1)
  {
    sub_10000AE4C((uint64_t)v38, (uint64_t *)&unk_10006C4C0);
    sub_10000AE4C((uint64_t)v40, (uint64_t *)&unk_10006C4C0);
    sub_10000AF64(v44);
    if (!v55) {
      goto LABEL_14;
    }
    sub_10000AE4C((uint64_t)v24, (uint64_t *)&unk_10006C4C0);
LABEL_17:
    uint64_t v50 = v89;
    sub_10000ADF0(v90 + v89[11], v2, (uint64_t *)&unk_10006C4C0);
    sub_10000ADF0(v91 + v50[11], (uint64_t)v31, (uint64_t *)&unk_10006C4C0);
    uint64_t v51 = *(int *)(v19 + 48);
    uint64_t v52 = v101;
    uint64_t v53 = v101 + v51;
    sub_10000ADF0(v2, v101, (uint64_t *)&unk_10006C4C0);
    sub_10000ADF0((uint64_t)v31, v53, (uint64_t *)&unk_10006C4C0);
    sub_10000AF64(v52);
    if (v55)
    {
      sub_10000AE4C((uint64_t)v31, (uint64_t *)&unk_10006C4C0);
      sub_10000AE4C(v2, (uint64_t *)&unk_10006C4C0);
      sub_10000AF64(v53);
      if (v55)
      {
        sub_10000AE4C(v52, (uint64_t *)&unk_10006C4C0);
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v54 = v100;
      sub_10000ADF0(v52, v100, (uint64_t *)&unk_10006C4C0);
      sub_10000AF64(v53);
      if (!v55)
      {
        uint64_t v57 = v103;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 32))(v102, v53, v45);
        sub_10000AEDC(&qword_10006BF78, (void (*)(uint64_t))&type metadata accessor for Date);
        char v58 = sub_100053ED8();
        v59 = *(void (**)(void))(v57 + 8);
        sub_10000AFC4();
        v59();
        sub_10000AE4C((uint64_t)v31, (uint64_t *)&unk_10006C4C0);
        sub_10000AE4C(v2, (uint64_t *)&unk_10006C4C0);
        sub_10000AFC4();
        v59();
        sub_10000AE4C(v52, (uint64_t *)&unk_10006C4C0);
        if ((v58 & 1) == 0) {
          return 0;
        }
LABEL_30:
        v61 = v89;
        uint64_t v60 = v90;
        uint64_t v62 = v91;
        if ((sub_100053E08() & 1) == 0 || *(unsigned __int8 *)(v60 + v61[13]) != *(unsigned __int8 *)(v62 + v61[13])) {
          return 0;
        }
        uint64_t v63 = v97;
        sub_10000ADF0(v60 + v61[14], v97, &qword_10006BE78);
        uint64_t v64 = v96;
        sub_10000ADF0(v62 + v61[14], v96, &qword_10006BE78);
        uint64_t v24 = v98;
        uint64_t v65 = (uint64_t)&v98[*(int *)(v92 + 48)];
        sub_10000ADF0(v63, (uint64_t)v98, &qword_10006BE78);
        sub_10000ADF0(v64, v65, &qword_10006BE78);
        uint64_t v66 = v99;
        if (sub_100007FE8((uint64_t)v24, 1, v99) == 1)
        {
          sub_10000AE4C(v64, &qword_10006BE78);
          sub_10000AE4C(v63, &qword_10006BE78);
          if (sub_100007FE8(v65, 1, v66) == 1)
          {
            sub_10000AE4C((uint64_t)v24, &qword_10006BE78);
            goto LABEL_39;
          }
        }
        else
        {
          uint64_t v67 = v95;
          sub_10000ADF0((uint64_t)v24, v95, &qword_10006BE78);
          if (sub_100007FE8(v65, 1, v66) != 1)
          {
            uint64_t v69 = v93;
            uint64_t v68 = v94;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 32))(v93, v65, v66);
            sub_10000AEDC(&qword_10006BF70, (void (*)(uint64_t))&type metadata accessor for BackgroundMoonData);
            char v70 = sub_100053ED8();
            v71 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
            v71(v69, v66);
            sub_10000AE4C(v64, &qword_10006BE78);
            sub_10000AE4C(v63, &qword_10006BE78);
            v71(v67, v66);
            sub_10000AE4C((uint64_t)v24, &qword_10006BE78);
            if ((v70 & 1) == 0) {
              return 0;
            }
LABEL_39:
            v73 = v89;
            uint64_t v72 = v90;
            uint64_t v74 = v91;
            if (*(unsigned __int8 *)(v90 + v89[15]) != *(unsigned __int8 *)(v91 + v89[15])
              || (sub_1000100FC(v90 + v89[16], v91 + v89[16]) & 1) == 0)
            {
              return 0;
            }
            uint64_t v75 = v73[17];
            v76 = *(void **)(v72 + v75);
            v77 = *(void **)(v74 + v75);
            if (v76)
            {
              if (!v77) {
                return 0;
              }
              sub_10000AE9C();
              id v78 = v77;
              id v79 = v76;
              char v80 = sub_100054258();

              if ((v80 & 1) == 0) {
                return 0;
              }
            }
            else if (v77)
            {
              return 0;
            }
            uint64_t v81 = v89[18];
            v82 = *(void **)(v90 + v81);
            v83 = *(void **)(v91 + v81);
            if (v82)
            {
              if (!v83) {
                return 0;
              }
              sub_10000AE9C();
              id v84 = v83;
              id v85 = v82;
              char v86 = sub_100054258();

              if ((v86 & 1) == 0) {
                return 0;
              }
            }
            else if (v83)
            {
              return 0;
            }
            return 1;
          }
          sub_10000AE4C(v64, &qword_10006BE78);
          sub_10000AE4C(v63, &qword_10006BE78);
          (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v67, v66);
        }
        uint64_t v46 = &qword_10006BF58;
        goto LABEL_15;
      }
      sub_10000AE4C((uint64_t)v31, (uint64_t *)&unk_10006C4C0);
      sub_10000AE4C(v2, (uint64_t *)&unk_10006C4C0);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v54, v45);
    }
    uint64_t v46 = &qword_10006BF60;
    uint64_t v47 = v52;
    goto LABEL_26;
  }
  sub_10000ADF0((uint64_t)v24, (uint64_t)v35, (uint64_t *)&unk_10006C4C0);
  sub_10000AF64(v44);
  if (!v55)
  {
    uint64_t v48 = v103;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 32))(v102, v44, v45);
    sub_10000AEDC(&qword_10006BF78, (void (*)(uint64_t))&type metadata accessor for Date);
    int v88 = sub_100053ED8();
    uint64_t v49 = *(void (**)(void))(v48 + 8);
    sub_10000AFC4();
    v49();
    sub_10000AE4C((uint64_t)v38, (uint64_t *)&unk_10006C4C0);
    sub_10000AE4C((uint64_t)v40, (uint64_t *)&unk_10006C4C0);
    sub_10000AFC4();
    v49();
    sub_10000AE4C((uint64_t)v24, (uint64_t *)&unk_10006C4C0);
    if ((v88 & 1) == 0) {
      return 0;
    }
    goto LABEL_17;
  }
  sub_10000AE4C((uint64_t)v38, (uint64_t *)&unk_10006C4C0);
  sub_10000AE4C((uint64_t)v40, (uint64_t *)&unk_10006C4C0);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v35, v45);
LABEL_14:
  uint64_t v46 = &qword_10006BF60;
LABEL_15:
  uint64_t v47 = (uint64_t)v24;
LABEL_26:
  sub_10000AE4C(v47, v46);
  return 0;
}

uint64_t sub_10000A914@<X0>(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v66 = a3;
  id v64 = a2;
  id v65 = a1;
  uint64_t v67 = a4;
  uint64_t v5 = sub_1000068D8(&qword_10006BE78);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_10000AF50();
  uint64_t v63 = v7;
  sub_10000AFE0();
  uint64_t v8 = sub_100053E38();
  uint64_t v9 = sub_10000AFD4(v8);
  __chkstk_darwin(v9);
  sub_10000AF50();
  uint64_t v62 = v10;
  uint64_t v11 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v12 = sub_10000AFD4(v11);
  __chkstk_darwin(v12);
  sub_10000AF84(v13, v55[0]);
  __chkstk_darwin(v14);
  uint64_t v68 = (uint64_t)v55 - v15;
  sub_10000AFE0();
  sub_100053C28();
  sub_10000AF38();
  uint64_t v59 = v17;
  uint64_t v60 = v16;
  __chkstk_darwin(v16);
  sub_10000AF50();
  uint64_t v70 = v18;
  sub_10000AFE0();
  uint64_t v58 = sub_1000533B8();
  sub_10000AF38();
  uint64_t v56 = v19;
  __chkstk_darwin(v20);
  sub_10000AF50();
  uint64_t v69 = v21;
  sub_10000AFE0();
  v55[1] = sub_1000531E8();
  sub_10000AF38();
  uint64_t v23 = v22;
  __chkstk_darwin(v24);
  uint64_t v25 = sub_1000534C8();
  uint64_t v26 = sub_10000AFD4(v25);
  __chkstk_darwin(v26);
  uint64_t v57 = (char *)v55 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100053198();
  v55[0] = v28;
  sub_10000AF38();
  uint64_t v30 = v29;
  uint64_t v32 = __chkstk_darwin(v31);
  uint64_t v34 = (char *)v55 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  sub_10000B00C();
  __chkstk_darwin(v35);
  uint64_t v37 = (char *)v55 - v36;
  sub_100053188();
  sub_100053178();
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  v38(v4, v28);
  v55[2] = v30 + 8;
  sub_1000534B8();
  sub_1000531D8();
  sub_1000530D8();
  uint64_t v39 = *(void (**)(void))(v23 + 8);
  sub_10000AFA4();
  v39();
  sub_1000531D8();
  sub_1000530E8();
  sub_10000AFA4();
  v39();
  uint64_t v40 = v34;
  uint64_t v41 = v55[0];
  v38((uint64_t)v40, v55[0]);
  (*(void (**)(uint64_t, void, uint64_t))(v56 + 104))(v69, enum case for WeatherCondition.mostlyClear(_:), v58);
  (*(void (**)(uint64_t, void, uint64_t))(v59 + 104))(v70, enum case for CloudAltitudeKind.low(_:), v60);
  sub_1000531D8();
  uint64_t v42 = v68;
  sub_1000530D8();
  sub_10000AFA4();
  v39();
  uint64_t v43 = v42;
  uint64_t v44 = v41;
  sub_100008010(v43, 0, 1, v41);
  sub_1000531D8();
  uint64_t v45 = v61;
  sub_1000530D8();
  sub_10000AFA4();
  v39();
  uint64_t v46 = v44;
  sub_100008010(v45, 0, 1, v44);
  uint64_t v47 = v62;
  sub_100053E48();
  uint64_t v48 = sub_100053C68();
  uint64_t v49 = v63;
  sub_100008010(v63, 1, 1, v48);
  uint64_t v50 = (uint64_t)v64;
  id v51 = v64;
  uint64_t v52 = (uint64_t)v65;
  id v53 = v65;
  sub_100009B68(v70, v68, v45, v47, 1, v67, 0.0, 0.0, v49, v52, v50, v66);
  return ((uint64_t (*)(char *, uint64_t))v38)(v37, v46);
}

uint64_t sub_10000ADF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000068D8(a3);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000AE4C(uint64_t a1, uint64_t *a2)
{
  sub_1000068D8(a2);
  sub_10000AFB4();
  sub_10000B02C();
  v3();
  return a1;
}

unint64_t sub_10000AE9C()
{
  unint64_t result = qword_10006BF68;
  if (!qword_10006BF68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006BF68);
  }
  return result;
}

uint64_t sub_10000AEDC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000AF64(uint64_t a1)
{
  return sub_100007FE8(a1, 1, v1);
}

void sub_10000AF84(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10000AFD4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000AFE0()
{
  return 0;
}

uint64_t sub_10000B038(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v9 = sub_1000068D8(&qword_10006C920);
  __chkstk_darwin(v9 - 8);
  sub_10000EA98();
  uint64_t v10 = sub_1000537B8();
  sub_10000E978();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  uint64_t v15 = (uint64_t *)((char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000DD58();
  *uint64_t v15 = sub_100054178();
  (*(void (**)(uint64_t *, void, uint64_t))(v12 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v10);
  char v16 = sub_1000537D8();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v15, v10);
  if (v16)
  {
    uint64_t v18 = swift_allocObject();
    swift_weakInit();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v18;
    v19[3] = a2;
    v19[4] = a3;
    if (*(void *)(v5 + 40))
    {
      swift_retain();
      swift_retain();
      sub_100054098();
      swift_release();
    }
    else
    {
      swift_retain();
    }
    uint64_t v20 = sub_100054088();
    sub_100008010(v4, 1, 1, v20);
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = sub_10000DE10;
    v21[5] = v19;
    v21[6] = v5;
    v21[7] = a1;
    swift_retain();
    id v22 = a1;
    *(void *)(v5 + 40) = sub_10000D4E8(v4, (uint64_t)&unk_10006C048, (uint64_t)v21);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000B290(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 40) = 0;
    swift_release();
    swift_release();
  }
  if (sub_1000540A8())
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100053568();
    sub_10000E284(v6, (uint64_t)qword_1000708C8);
    uint64_t v7 = sub_100053548();
    os_log_type_t v8 = sub_100054118();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Task was cancelled before it completed. Call to completion will be skipped.", v9, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    a3(a1);
  }
}

uint64_t sub_10000B3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = a4;
  v7[3] = a5;
  type metadata accessor for PosterData(0);
  uint64_t v9 = swift_task_alloc();
  v7[4] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v7[5] = v10;
  *uint64_t v10 = v7;
  v10[1] = sub_10000B4AC;
  return sub_10000B6A0(v9, a7);
}

uint64_t sub_10000B4AC()
{
  sub_10000EA70();
  sub_10000E710();
  uint64_t v1 = *v0;
  sub_10000E968();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000ED58();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_10000B574()
{
  sub_10000EA70();
  sub_100054068();
  *(void *)(v0 + 48) = sub_100054058();
  uint64_t v2 = sub_100054028();
  return _swift_task_switch(sub_10000B604, v2, v1);
}

uint64_t sub_10000B604()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 16);
  swift_release();
  v2(v1);
  sub_10000E320(v1, (void (*)(void))type metadata accessor for PosterData);
  swift_task_dealloc();
  sub_10000E9E0();
  return v3();
}

uint64_t sub_10000B6A0(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  uint64_t v4 = sub_100053E38();
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  uint64_t v5 = sub_100053C28();
  v3[19] = v5;
  v3[20] = *(void *)(v5 - 8);
  v3[21] = swift_task_alloc();
  uint64_t v6 = sub_100053458();
  v3[22] = v6;
  v3[23] = *(void *)(v6 - 8);
  v3[24] = swift_task_alloc();
  uint64_t v7 = sub_1000068D8(&qword_10006C068);
  v3[25] = v7;
  v3[26] = *(void *)(v7 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  uint64_t v8 = sub_1000533B8();
  v3[29] = v8;
  v3[30] = *(void *)(v8 - 8);
  v3[31] = swift_task_alloc();
  sub_1000068D8((uint64_t *)&unk_10006C4C0);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = type metadata accessor for PosterDataModel(0);
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  sub_1000068D8(&qword_10006BE78);
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  uint64_t v9 = sub_100053198();
  v3[39] = v9;
  v3[40] = *(void *)(v9 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  uint64_t v10 = sub_1000541F8();
  v3[43] = v10;
  v3[44] = *(void *)(v10 - 8);
  v3[45] = swift_task_alloc();
  uint64_t v11 = sub_100053248();
  v3[46] = v11;
  v3[47] = *(void *)(v11 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  uint64_t v12 = sub_1000068D8(&qword_10006C070);
  v3[50] = v12;
  v3[51] = *(void *)(v12 - 8);
  v3[52] = swift_task_alloc();
  uint64_t v13 = sub_1000068D8(&qword_10006C078);
  v3[53] = v13;
  v3[54] = *(void *)(v13 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = sub_1000068D8(&qword_10006C080);
  v3[57] = swift_task_alloc();
  v3[58] = sub_1000068D8(&qword_10006C088);
  v3[59] = swift_task_alloc();
  v3[60] = sub_1000532C8();
  v3[61] = swift_task_alloc();
  sub_1000068D8(&qword_10006C090);
  v3[62] = swift_task_alloc();
  sub_1000068D8(&qword_10006C098);
  v3[63] = swift_task_alloc();
  sub_1000068D8(&qword_10006C0A0);
  v3[64] = swift_task_alloc();
  uint64_t v14 = sub_1000532F8();
  v3[65] = v14;
  v3[66] = *(void *)(v14 - 8);
  v3[67] = swift_task_alloc();
  uint64_t v15 = sub_1000532B8();
  v3[68] = v15;
  v3[69] = *(void *)(v15 - 8);
  v3[70] = swift_task_alloc();
  v3[71] = swift_task_alloc();
  return _swift_task_switch(sub_10000BD8C, 0, 0);
}

uint64_t sub_10000BD8C()
{
  uint64_t v33 = v0;
  if (qword_10006BB58 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[7].i64[0];
  uint64_t v2 = sub_100053568();
  v0[36].i64[0] = sub_10000E284(v2, (uint64_t)qword_1000708C8);
  id v3 = v1;
  uint64_t v4 = sub_100053548();
  os_log_type_t v5 = sub_100054118();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[7].i64[0];
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 141558275;
    v0[5].i64[1] = 1752392040;
    sub_100054288();
    *(_WORD *)(v8 + 12) = 2081;
    [v7 coordinate];
    uint64_t v9 = sub_100054218();
    v0[6].i64[0] = sub_100029610(v9, v10, &v32);
    sub_100054288();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Update task is about to fetch weather data for %{private,mask.hash}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {
  }
  id v11 = (id)WCCountryCodeEstimate();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v30 = v0[33].i64[1];
    uint64_t v14 = v0[31].i64[1];
    uint64_t v13 = v0[32].i64[0];
    uint64_t v15 = v0[31].i64[0];
    uint64_t v16 = v0[23].i64[0];
    int8x16_t v31 = v0[7];
    sub_100053F18();

    sub_100053238();
    sub_100008010(v13, 0, 1, v16);
    uint64_t v17 = sub_100053308();
    sub_100008010(v14, 1, 1, v17);
    uint64_t v18 = sub_1000532D8();
    sub_100008010(v15, 1, 1, v18);
    v0[5].i64[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10000E3D8();
    sub_1000068D8(&qword_10006C0B8);
    sub_10000E428();
    sub_1000542B8();
    sub_10000EDA4();
    sub_1000532E8();
    uint64_t v19 = (int8x16_t *)swift_task_alloc();
    v0[36].i64[1] = (uint64_t)v19;
    v19[1] = vextq_s8(v31, v31, 8uLL);
    v19[2].i64[0] = v30;
    uint64_t v20 = (void *)swift_task_alloc();
    v0[37].i64[0] = (uint64_t)v20;
    *uint64_t v20 = v0;
    v20[1] = sub_10000C1D0;
    sub_10000ED58();
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  else
  {
    sub_100053348();
    sub_100053338();
    uint64_t v21 = (void *)swift_task_alloc();
    v0[38].i64[0] = (uint64_t)v21;
    *uint64_t v21 = v0;
    v21[1] = sub_10000C8AC;
    uint64_t v22 = v0[35].i64[0];
    uint64_t v23 = v0[34].i64[0];
    uint64_t v25 = v0[28].i64[0];
    uint64_t v24 = v0[28].i64[1];
    uint64_t v26 = v0[27].i64[1];
    uint64_t v27 = v0[26].i64[0];
    uint64_t v28 = v0[7].i64[0];
    return WeatherService.weather<A, B>(for:including:_:)(v22, v24, v28, v26, v27, v23, v25);
  }
}

uint64_t sub_10000C1D0()
{
  sub_10000EA70();
  sub_10000E710();
  uint64_t v2 = *v1;
  sub_10000E968();
  *id v3 = v2;
  *(void *)(v4 + 600) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000ED58();
  return _swift_task_switch(v5, v6, v7);
}

#error "10000C4A0: call analysis failed (funcsize=365)"

uint64_t sub_10000C8AC()
{
  sub_10000E710();
  uint64_t v3 = v2;
  uint64_t v5 = v4[55];
  uint64_t v6 = v4[54];
  uint64_t v7 = v4[53];
  uint64_t v8 = v4[52];
  uint64_t v9 = v4[51];
  uint64_t v10 = v4[50];
  uint64_t v11 = *v1;
  sub_10000E968();
  void *v12 = v11;
  *(void *)(v3 + 616) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (!v0) {
    sub_10000AE4C(*(void *)(v3 + 456), &qword_10006C080);
  }
  sub_10000ED58();
  return _swift_task_switch(v13, v14, v15);
}

#error "10000CC00: call analysis failed (funcsize=350)"

uint64_t sub_10000D00C()
{
  uint64_t v11 = v0;
  (*(void (**)(void, void))(v0[66] + 8))(v0[67], v0[65]);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100053548();
  os_log_type_t v2 = sub_1000540F8();
  if (os_log_type_enabled(v1, v2))
  {
    sub_10000EBD0();
    uint64_t v10 = swift_slowAlloc();
    sub_10000EA48(4.8751e-34);
    uint64_t v3 = sub_100054598();
    uint64_t v5 = sub_100029610(v3, v4, &v10);
    sub_10000EB48(v5);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    sub_10000ED84((void *)&_mh_execute_header, v6, v7, "Update task failed to fetch current weather; error=%{public}s");
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10000EDD8();
  swift_storeEnumTagMultiPayload();
  sub_10000E728();
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
  swift_task_dealloc();
  sub_10000E9E0();
  return v8();
}

uint64_t sub_10000D288()
{
  uint64_t v11 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100053548();
  os_log_type_t v2 = sub_1000540F8();
  if (os_log_type_enabled(v1, v2))
  {
    sub_10000EBD0();
    uint64_t v10 = swift_slowAlloc();
    sub_10000EA48(4.8751e-34);
    uint64_t v3 = sub_100054598();
    uint64_t v5 = sub_100029610(v3, v4, &v10);
    sub_10000EB48(v5);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    sub_10000ED84((void *)&_mh_execute_header, v6, v7, "Update task failed to fetch current weather; error=%{public}s");
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10000EDD8();
  swift_storeEnumTagMultiPayload();
  sub_10000E728();
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
  swift_task_dealloc();
  sub_10000E9E0();
  return v8();
}

uint64_t sub_10000D4E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100054088();
  if (sub_100007FE8(a1, 1, v6) == 1)
  {
    sub_10000AE4C(a1, &qword_10006C920);
  }
  else
  {
    sub_100054078();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100054028();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000D658()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_1000537B8();
  sub_10000E978();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_10000EA98();
  sub_10000DD58();
  *uint64_t v1 = sub_100054178();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v1, enum case for DispatchPredicate.onQueue(_:), v3);
  char v7 = sub_1000537D8();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v5 + 8))(v1, v3);
  if ((v7 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  if (!*(void *)(v2 + 40)) {
    return result;
  }
  uint64_t v9 = qword_10006BB58;
  swift_retain();
  if (v9 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v10 = sub_100053568();
  sub_10000E284(v10, (uint64_t)qword_1000708C8);
  uint64_t v11 = sub_100053548();
  os_log_type_t v12 = sub_100054118();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Canceling task to update poster data", v13, 2u);
    sub_10000E950();
  }

  sub_100054098();
  swift_release();
  *(void *)(v2 + 40) = 0;
  return swift_release();
}

uint64_t sub_10000D824()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_10000D85C()
{
  sub_10000D824();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for PosterDataUpdater()
{
  return self;
}

void *sub_10000D8B4()
{
  sub_100053388();
  v0[2] = sub_100036584();
  sub_100053BD8();
  swift_allocObject();
  v0[3] = sub_100053BC8();
  if (qword_10006BB20 != -1) {
    swift_once();
  }
  v0[4] = qword_100070828;
  v0[5] = 0;
  swift_retain();
  return v0;
}

uint64_t sub_10000D94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v6 = sub_1000068D8(&qword_10006C0C8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin();
  uint64_t v9 = sub_1000068D8(&qword_10006C070);
  uint64_t v20 = *(void *)(v9 - 8);
  uint64_t v21 = v9;
  __chkstk_darwin();
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000068D8(&qword_10006C078);
  uint64_t v12 = *(void *)(v19 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(a2 + 16);
  sub_1000532B8();
  sub_100053348();
  sub_1000068D8(&qword_10006C080);
  sub_100053338();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_100053358();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v19);
}

uint64_t sub_10000DC0C(uint64_t a1)
{
  sub_1000068D8(&qword_10006C088);
  __chkstk_darwin();
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000068D8(&qword_10006C0D0);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000ADF0(a1, (uint64_t)v5, &qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7[1] = *v5;
    sub_1000068D8(&qword_10006C0C8);
    return sub_100054038();
  }
  else
  {
    sub_10000E5CC((uint64_t)v5, (uint64_t)v3, &qword_10006C088);
    sub_1000068D8(&qword_10006C0C8);
    return sub_100054048();
  }
}

unint64_t sub_10000DD58()
{
  unint64_t result = qword_10006C038;
  if (!qword_10006C038)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_10006C038);
  }
  return result;
}

uint64_t sub_10000DD98()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DDD0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000DE10(uint64_t a1)
{
  sub_10000B290(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_10000DE1C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000DE6C()
{
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000DF34;
  sub_10000EDA4();
  return sub_10000B3CC(v4, v5, v6, v7, v8, v9, v2);
}

uint64_t sub_10000DF34()
{
  sub_10000EA70();
  sub_10000E710();
  uint64_t v1 = *v0;
  sub_10000E968();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000E9E0();
  return v3();
}

uint64_t sub_10000DFF4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000E0D0;
  return v6(a1);
}

uint64_t sub_10000E0D0()
{
  sub_10000EA70();
  sub_10000E710();
  uint64_t v1 = *v0;
  sub_10000E968();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000E9E0();
  return v3();
}

uint64_t sub_10000E194()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E1CC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000DF34;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006C050 + dword_10006C050);
  return v6(a1, v4);
}

uint64_t sub_10000E284(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000E2BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PosterDataModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E320(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  sub_10000B02C();
  v3();
  return a1;
}

uint64_t sub_10000E374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PosterDataModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000E3D8()
{
  unint64_t result = qword_10006C0B0;
  if (!qword_10006C0B0)
  {
    sub_1000532C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C0B0);
  }
  return result;
}

unint64_t sub_10000E428()
{
  unint64_t result = qword_10006C0C0;
  if (!qword_10006C0C0)
  {
    sub_10000E47C(&qword_10006C0B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C0C0);
  }
  return result;
}

uint64_t sub_10000E47C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000E4C4(uint64_t a1)
{
  return sub_10000D94C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000E4D0()
{
  sub_1000068D8(&qword_10006C0C8);
  sub_10000AFB4();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 56);
  uint64_t v4 = v2 | 7;
  sub_10000B02C();
  v5();

  return _swift_deallocObject(v0, v3, v4);
}

uint64_t sub_10000E558(uint64_t a1)
{
  sub_1000068D8(&qword_10006C0C8);

  return sub_10000DC0C(a1);
}

uint64_t sub_10000E5CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000068D8(a3);
  sub_10000AFB4();
  sub_10000E994();
  v4();
  return a2;
}

uint64_t sub_10000E624()
{
  uint64_t v3 = v0[48];
  *(void *)(v1 - 168) = v0[47];
  *(void *)(v1 - 160) = v3;
  *(void *)(v1 - 152) = v0[46];
  *(void *)(v1 - 208) = v0[39];
  *(void *)(v1 - 144) = v0[37];
  *(void *)(v1 - 176) = v0[33];
  uint64_t v4 = v0[31];
  *(void *)(v1 - 200) = v0[32];
  *(void *)(v1 - 192) = v4;
  return sub_100053238();
}

uint64_t sub_10000E728()
{
  uint64_t v3 = v0[21];
  *(void *)(v1 - 104) = v0[24];
  *(void *)(v1 - 96) = v3;
  *(void *)(v1 - 88) = v0[18];
  return swift_task_dealloc();
}

uint64_t sub_10000E7C8()
{
  uint64_t v3 = v0[33];
  *(void *)(v1 - 208) = v0[35];
  *(void *)(v1 - 200) = v3;
  uint64_t v4 = v0[31];
  *(void *)(v1 - 192) = v0[32];
  *(void *)(v1 - 184) = v4;
  uint64_t v5 = v0[27];
  *(void *)(v1 - 176) = v0[28];
  *(void *)(v1 - 168) = v5;
  uint64_t v6 = v0[21];
  *(void *)(v1 - 160) = v0[24];
  *(void *)(v1 - 152) = v6;
  *(void *)(v1 - 144) = v0[18];
  return swift_task_dealloc();
}

uint64_t sub_10000E868()
{
  uint64_t v3 = v0[71];
  uint64_t v4 = v0[69];
  *(void *)(v1 - 152) = v0[68];
  *(void *)(v1 - 144) = v3;
  *(void *)(v1 - 168) = v0[49];
  *(void *)(v1 - 160) = v4;
  uint64_t v5 = v0[46];
  *(void *)(v1 - 184) = v0[47];
  *(void *)(v1 - 176) = v5;
  uint64_t v6 = v0[45];
  *(void *)(v1 - 208) = v0[44];
  *(void *)(v1 - 200) = v0[43];
  *(void *)(v1 - 192) = v6;
  return swift_slowAlloc();
}

char *sub_10000E8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  *(unsigned char *)(v33 + *(int *)(v35 + 48)) = v34 & 1;
  *a22 = 49;
  a22[1] = 0xE100000000000000;
  a22[2] = v36;
  a22[3] = v37;
  return (char *)a22 + *(int *)(a33 + 24);
}

void sub_10000E910()
{
  uint64_t v4 = v1[71];
  *(void *)(v2 - 152) = v1[68];
  *(void *)(v2 - 144) = v4;
  uint64_t v5 = v1[49];
  *(void *)(v2 - 168) = v1[46];
  *(void *)(v2 - 160) = v5;
}

uint64_t sub_10000E950()
{
  return swift_slowDealloc();
}

uint64_t sub_10000E9BC()
{
  return *(void *)(v0 - 160);
}

uint64_t sub_10000E9E0()
{
  return v0 + 8;
}

uint64_t sub_10000E9EC(uint64_t result)
{
  *(void *)(v1 + 56) = 1752392040;
  *(void *)(v2 - 136) = result;
  return result;
}

uint64_t sub_10000EA20()
{
  return sub_100053BB8();
}

uint64_t sub_10000EA48(float a1)
{
  *uint64_t v1 = a1;
  return swift_getErrorValue();
}

uint64_t sub_10000EA7C()
{
  return v0;
}

uint64_t sub_10000EA98()
{
  return 0;
}

uint64_t sub_10000EAB4(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_100053288();
}

uint64_t sub_10000EADC()
{
  return swift_allocObject();
}

uint64_t sub_10000EB04()
{
  return v0;
}

uint64_t sub_10000EB20()
{
  return sub_100053AB8();
}

uint64_t sub_10000EB48(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return sub_100054288();
}

uint64_t sub_10000EB70()
{
  return sub_100053288();
}

uint64_t sub_10000EB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  *(void *)(v35 + *(int *)(v34 + 40)) = a21;
  return sub_10000E2BC(v35, a34);
}

uint64_t sub_10000EBB8()
{
  return v0;
}

uint64_t sub_10000EBD0()
{
  return swift_slowAlloc();
}

uint64_t sub_10000EBF4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_100054288();
}

uint64_t sub_10000EC40(__n128 a1, __n128 a2)
{
  a1.n128_u64[0] = v5;
  a2.n128_u64[0] = v6;
  return CLLocationCoordinate2D.solarEvents(referenceDate:timeZone:)(v3, v2, a1, a2);
}

uint64_t sub_10000EC64()
{
  *(_WORD *)(v0 + 22) = 2082;
  return sub_100032538();
}

uint64_t sub_10000EC88()
{
  return sub_100053288();
}

uint64_t sub_10000ECAC(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return sub_100054288();
}

uint64_t sub_10000ECD0(float a1)
{
  *uint64_t v1 = a1;
  return sub_100054288();
}

uint64_t sub_10000ECF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return Measurement<>.converted(to:)(a1, a18);
}

uint64_t sub_10000ED18()
{
  return v0;
}

uint64_t sub_10000ED64()
{
  uint64_t v5 = v2 + *(int *)(v0 + 32);
  uint64_t v6 = *(void *)(v3 - 200);
  return sub_10000E5CC(v6, v5, v1);
}

void sub_10000ED84(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_10000EDB8()
{
  return swift_arrayDestroy();
}

uint64_t sub_10000EDD8()
{
  **(unsigned char **)(v0 + 104) = 3;
  return type metadata accessor for PosterData(0);
}

uint64_t sub_10000EDF8()
{
  return *(void *)(v0 - 160);
}

void sub_10000EE0C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0x20u);
}

unsigned char *storeEnumTagSinglePayload for WakeState.ScreenState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x10000EEF8);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WakeState.ScreenState()
{
  return &type metadata for WakeState.ScreenState;
}

ValueMetadata *type metadata accessor for WakeState()
{
  return &type metadata for WakeState;
}

unint64_t sub_10000EF44()
{
  unint64_t result = qword_10006C0D8;
  if (!qword_10006C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C0D8);
  }
  return result;
}

uint64_t sub_10000EF90(char a1, uint64_t a2, double a3)
{
  if (*(double *)&a2 == a3) {
    unsigned int v3 = 3;
  }
  else {
    unsigned int v3 = *(double *)&a2 >= a3;
  }
  if (a1 == 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000EFB8(char a1)
{
  if (!a1) {
    return 28271;
  }
  if (a1 == 1) {
    return 6710895;
  }
  return 0x697469736E617274;
}

uint64_t sub_10000F008()
{
  return sub_10000EFB8(*v0);
}

uint64_t sub_10000F010(char a1)
{
  sub_100054308(27);
  swift_bridgeObjectRelease();
  strcpy((char *)v5, "screenState:");
  BYTE5(v5[1]) = 0;
  HIWORD(v5[1]) = -5120;
  if (a1)
  {
    if (a1 == 1) {
      v2._countAndFlagsBits = 6710895;
    }
    else {
      v2._countAndFlagsBits = 0x697469736E617274;
    }
    if (a1 == 1) {
      unsigned int v3 = (void *)0xE300000000000000;
    }
    else {
      unsigned int v3 = (void *)0xED0000676E696E6FLL;
    }
  }
  else
  {
    unsigned int v3 = (void *)0xE200000000000000;
    v2._countAndFlagsBits = 28271;
  }
  v2._object = v3;
  sub_100053F58(v2);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x6572676F7270202CLL;
  v6._object = (void *)0xEB000000003A7373;
  sub_100053F58(v6);
  v7._countAndFlagsBits = sub_1000540B8();
  sub_100053F58(v7);
  swift_bridgeObjectRelease();
  return v5[0];
}

uint64_t sub_10000F124()
{
  return sub_10000F010(*v0);
}

uint64_t *sub_10000F130(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000531C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = a3[8];
    uint64_t v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v12 = a3[10];
    *(_DWORD *)((char *)a1 + a3[9]) = *(_DWORD *)((char *)a2 + a3[9]);
    *(_DWORD *)((char *)a1 + v12) = *(_DWORD *)((char *)a2 + v12);
    id v13 = v11;
  }
  return a1;
}

void sub_10000F230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 28));
}

uint64_t sub_10000F2A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a3[8];
  uint64_t v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v11 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_DWORD *)(a1 + v11) = *(_DWORD *)(a2 + v11);
  id v12 = v10;
  return a1;
}

uint64_t sub_10000F354(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v7 = a3[7];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_DWORD *)(a1 + a3[10]) = *(_DWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10000F418(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_DWORD *)(a1 + v9) = *(_DWORD *)(a2 + v9);
  return a1;
}

uint64_t sub_10000F4C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = *(void **)(a1 + v8);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);

  uint64_t v10 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(_DWORD *)(a1 + v10) = *(_DWORD *)(a2 + v10);
  *(_DWORD *)(a1 + a3[10]) = *(_DWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10000F57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F590);
}

uint64_t sub_10000F590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000531C8();
  sub_10000F86C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_100007FE8(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_10000F61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F630);
}

void sub_10000F630(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1000531C8();
  sub_10000F86C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_100008010(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for DynamicRotationAnimationState()
{
  uint64_t result = qword_10006C138;
  if (!qword_10006C138) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F700()
{
  uint64_t result = sub_1000531C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_10000F7BC(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>, float a5@<S0>)
{
  uint64_t v10 = (int *)type metadata accessor for DynamicRotationAnimationState();
  *(void *)(a4 + v10[7]) = a1;
  *(void *)(a4 + v10[5]) = a2;
  *(void *)(a4 + v10[6]) = a3;
  id v11 = a1;
  sub_1000531B8();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();

  *(CFAbsoluteTime *)(a4 + v10[8]) = Current;
  *(float *)(a4 + v10[9]) = sub_10001FA0C(a2, a3, a5);
  *(_DWORD *)(a4 + v10[10]) = v13;
}

BOOL sub_10000F884(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_10000F894()
{
  uint64_t v0 = sub_100053F18();
  uint64_t v2 = v1;
  if (v0 == sub_100053F18() && v2 == v3) {
    sub_10001943C();
  }
  else {
    LOBYTE(v0) = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

unint64_t sub_10000F90C(char a1, char a2)
{
  unint64_t v3 = sub_10003A758(a1);
  uint64_t v5 = v4;
  if (v3 == sub_10003A758(a2) && v5 == v6) {
    sub_10001943C();
  }
  else {
    LOBYTE(v3) = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10000F984(char a1, char a2)
{
  BOOL v3 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v4 = 0x656E696C66666FLL;
  }
  else {
    uint64_t v4 = 0x6C62616863616572;
  }
  if (v3) {
    unint64_t v5 = 0xE900000000000065;
  }
  else {
    unint64_t v5 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v6 = 0x656E696C66666FLL;
  }
  else {
    uint64_t v6 = 0x6C62616863616572;
  }
  if (a2) {
    unint64_t v7 = 0xE700000000000000;
  }
  else {
    unint64_t v7 = 0xE900000000000065;
  }
  if (v4 == v6 && v5 == v7) {
    sub_10001943C();
  }
  else {
    char v2 = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_10000FA1C(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 0x6E6F6973726576;
  unint64_t v4 = 0xE700000000000000;
  uint64_t v5 = a1;
  unint64_t v6 = 0x6E6F6973726576;
  switch(v5)
  {
    case 1:
      unint64_t v6 = 0x616E6964726F6F63;
      unint64_t v4 = 0xEA00000000006574;
      break;
    case 2:
      unint64_t v4 = 0x8000000100057360;
      unint64_t v6 = 0xD000000000000012;
      break;
    case 3:
      unint64_t v6 = 0x657369726E7573;
      break;
    case 4:
      unint64_t v4 = 0xE600000000000000;
      unint64_t v6 = 0x7465736E7573;
      break;
    case 5:
      unint64_t v6 = 0x617461446E6F6F6DLL;
      uint64_t v7 = 3307053;
      goto LABEL_8;
    case 6:
      unint64_t v6 = 0x4472656874616577;
      uint64_t v7 = 6386785;
LABEL_8:
      unint64_t v4 = v7 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
      break;
    default:
      break;
  }
  unint64_t v8 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x616E6964726F6F63;
      unint64_t v8 = 0xEA00000000006574;
      break;
    case 2:
      unint64_t v8 = 0x8000000100057360;
      unint64_t v3 = 0xD000000000000012;
      break;
    case 3:
      unint64_t v3 = 0x657369726E7573;
      break;
    case 4:
      unint64_t v8 = 0xE600000000000000;
      unint64_t v3 = 0x7465736E7573;
      break;
    case 5:
      unint64_t v3 = 0x617461446E6F6F6DLL;
      uint64_t v9 = 3307053;
      goto LABEL_16;
    case 6:
      unint64_t v3 = 0x4472656874616577;
      uint64_t v9 = 6386785;
LABEL_16:
      unint64_t v8 = v9 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
      break;
    default:
      break;
  }
  if (v6 == v3 && v4 == v8) {
    sub_10001943C();
  }
  else {
    char v2 = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_10000FC40(uint64_t a1, uint64_t a2)
{
  return sub_100010144(a1, a2, (void (*)(void))&type metadata accessor for WeatherCondition, &qword_10006C368, (void (*)(uint64_t))&type metadata accessor for WeatherCondition);
}

uint64_t sub_10000FC88(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 1702125924;
  unint64_t v4 = 0xE400000000000000;
  uint64_t v5 = a1;
  unint64_t v6 = 1702125924;
  switch(v5)
  {
    case 1:
      unint64_t v6 = 0x6F697469646E6F63;
      unint64_t v4 = 0xE90000000000006ELL;
      break;
    case 2:
      unint64_t v6 = 0x65657053646E6977;
      goto LABEL_6;
    case 3:
      unint64_t v6 = 0x766F4364756F6C63;
      unint64_t v4 = 0xEA00000000007265;
      break;
    case 4:
      unint64_t v6 = 0x6E694B64756F6C63;
LABEL_6:
      unint64_t v4 = 0xE900000000000064;
      break;
    case 5:
      unint64_t v4 = 0x8000000100057320;
      unint64_t v6 = 0xD000000000000010;
      break;
    case 6:
      unint64_t v6 = 0x6F69746176656C65;
      unint64_t v4 = 0xED00004D5073496ELL;
      break;
    case 7:
      unint64_t v6 = 0x67696C7961447369;
      unint64_t v4 = 0xEA00000000007468;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x6F697469646E6F63;
      unint64_t v7 = 0xE90000000000006ELL;
      break;
    case 2:
      unint64_t v3 = 0x65657053646E6977;
      goto LABEL_15;
    case 3:
      unint64_t v3 = 0x766F4364756F6C63;
      unint64_t v7 = 0xEA00000000007265;
      break;
    case 4:
      unint64_t v3 = 0x6E694B64756F6C63;
LABEL_15:
      unint64_t v7 = 0xE900000000000064;
      break;
    case 5:
      unint64_t v7 = 0x8000000100057320;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 6:
      unint64_t v3 = 0x6F69746176656C65;
      unint64_t v7 = 0xED00004D5073496ELL;
      break;
    case 7:
      unint64_t v3 = 0x67696C7961447369;
      unint64_t v7 = 0xEA00000000007468;
      break;
    default:
      break;
  }
  if (v6 == v3 && v4 == v7) {
    sub_10001943C();
  }
  else {
    char v2 = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_10000FF0C(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 0xD000000000000014;
  unint64_t v4 = 0x80000001000572A0;
  uint64_t v5 = a1;
  unint64_t v6 = 0xD000000000000014;
  switch(v5)
  {
    case 1:
      unint64_t v6 = 0x4F6B726F7774656ELL;
      unint64_t v4 = 0xEE00656E696C6666;
      break;
    case 2:
      unint64_t v4 = 0xE600000000000000;
      unint64_t v6 = 0x617461446F6ELL;
      break;
    case 3:
      unint64_t v4 = 0x80000001000572D0;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000001000572A0;
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x4F6B726F7774656ELL;
      unint64_t v7 = 0xEE00656E696C6666;
      break;
    case 2:
      unint64_t v7 = 0xE600000000000000;
      unint64_t v3 = 0x617461446F6ELL;
      break;
    case 3:
      unint64_t v7 = 0x80000001000572D0;
      break;
    default:
      break;
  }
  if (v6 == v3 && v4 == v7) {
    sub_10001943C();
  }
  else {
    char v2 = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_100010074(char a1, char a2)
{
  BOOL v3 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v4 = 1635017060;
  }
  else {
    uint64_t v4 = 0x726F727265;
  }
  if (v3) {
    unint64_t v5 = 0xE500000000000000;
  }
  else {
    unint64_t v5 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v6 = 1635017060;
  }
  else {
    uint64_t v6 = 0x726F727265;
  }
  if (a2) {
    unint64_t v7 = 0xE400000000000000;
  }
  else {
    unint64_t v7 = 0xE500000000000000;
  }
  if (v4 == v6 && v5 == v7) {
    sub_10001943C();
  }
  else {
    char v2 = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1000100FC(uint64_t a1, uint64_t a2)
{
  return sub_100010144(a1, a2, (void (*)(void))&type metadata accessor for TargetWindowSizeClass, &qword_10006C360, (void (*)(uint64_t))&type metadata accessor for TargetWindowSizeClass);
}

uint64_t sub_100010144(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  a3(0);
  sub_100018C68(a4, a5);
  sub_100053F78();
  sub_100053F78();
  if (v11 == v9 && v12 == v10) {
    sub_10001943C();
  }
  else {
    LOBYTE(a4) = sub_1000193BC();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a4 & 1;
}

void sub_100010214()
{
  sub_100019508();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_1000068D8(&qword_10006C3A8);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_1000194F0();
  uint64_t v7 = sub_1000533B8();
  sub_10000E978();
  uint64_t v9 = v8;
  uint64_t v11 = __chkstk_darwin(v10);
  int v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v31 - v14;
  sub_100018DB0(0, (unint64_t *)&qword_10006C3A0);
  uint64_t v16 = sub_100054128();
  if (!v16) {
    goto LABEL_5;
  }
  uint64_t v17 = (void *)v16;
  NSString v18 = sub_100053EE8();
  id v19 = [v17 stringForKey:v18];

  if (!v19) {
    goto LABEL_5;
  }
  sub_100053F18();

  sub_100053398();
  if (sub_100007FE8(v0, 1, v7) == 1)
  {
    sub_10000AE4C(v0, &qword_10006C3A8);
LABEL_5:
    uint64_t v20 = type metadata accessor for PosterAnimationViewModel();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v4, v2 + *(int *)(v20 + 24), v7);
    goto LABEL_6;
  }
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  v34(v15, v0, v7);
  if (qword_10006BB50 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_100053568();
  sub_10000E284(v21, (uint64_t)qword_1000708B0);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v15, v7);
  uint64_t v22 = sub_100053548();
  os_log_type_t v23 = sub_100054118();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)sub_1000194A0();
    uint64_t v32 = sub_100019538();
    uint64_t v36 = v32;
    uint64_t v33 = v4;
    *(_DWORD *)uint64_t v24 = 136446210;
    int8x16_t v31 = v24 + 4;
    uint64_t v25 = sub_1000533A8();
    uint64_t v35 = sub_100029610(v25, v26, &v36);
    uint64_t v4 = v33;
    sub_100054288();
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_100019620();
    v28(v27);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Rendering overridden weather condition=%{public}s", v24, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {
    uint64_t v29 = sub_100019620();
    v30(v29);
  }

  v34(v4, (uint64_t)v15, v7);
LABEL_6:
  sub_100019520();
}

id sub_100010588()
{
  sub_100018DB0(0, (unint64_t *)&qword_10006C3A0);
  uint64_t v0 = sub_100054128();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = (void *)v0;
  NSString v2 = sub_100053EE8();
  id v3 = [v1 BOOLForKey:v2];

  return v3;
}

uint64_t sub_100010620()
{
  uint64_t v2 = v0;
  sub_100053568();
  sub_10000E978();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100019484();
  sub_100053908();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(void *)(v0 + 64) = 0;
  swift_allocObject();
  *(void *)(v0 + 72) = sub_1000538F8();
  sub_100053A48();
  swift_allocObject();
  *(void *)(v0 + 80) = sub_100053A38();
  type metadata accessor for VFXLightningManager();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(unsigned char *)(v6 + 24) = 0;
  *(void *)(v0 + 88) = v6;
  type metadata accessor for VFXSimulationManager();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = &_swiftEmptySetSingleton;
  *(unsigned char *)(v7 + 24) = 0;
  *(void *)(v0 + 96) = v7;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(void *)(v0 + 144) = 0;
  sub_1000194CC();
  uint64_t v8 = sub_100053D38();
  sub_1000193D8(v8);
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_gradientView) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel) = 0;
  sub_1000194CC();
  uint64_t v9 = type metadata accessor for PosterAnimationViewModel();
  sub_1000193D8(v9);
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer) = 0;
  uint64_t v10 = (void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
  *uint64_t v10 = 0;
  v10[1] = 0;
  sub_1000194CC();
  uint64_t v11 = type metadata accessor for SimulationReason();
  sub_1000193D8(v11);
  sub_1000194CC();
  uint64_t v12 = sub_100053198();
  sub_1000193D8(v12);
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastPauseAnimationTimerDuration) = 0;
  sub_1000194CC();
  uint64_t v13 = type metadata accessor for DynamicRotationState();
  sub_1000193D8(v13);
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_deviceRotationTimer) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rendererDelegate + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v14 = *(void (**)(void))(v4 + 16);
  sub_10001960C();
  v14();
  sub_10001960C();
  v14();
  type metadata accessor for VFXSnapshotRenderer();
  swift_allocObject();
  uint64_t v15 = sub_100046A24(v1);
  uint64_t v16 = sub_1000195EC();
  v17(v16);
  *(void *)(v2 + 104) = v15;
  return v2;
}

void sub_10001087C()
{
  sub_100019508();
  uint64_t v1 = v0;
  int v117 = v2;
  uint64_t v4 = v3;
  uint64_t v110 = sub_100053568();
  sub_10000E978();
  uint64_t v109 = v5;
  __chkstk_darwin(v6);
  sub_10000AF50();
  uint64_t v113 = v7;
  sub_10000AFE0();
  uint64_t v112 = sub_100053CA8();
  sub_10000E978();
  uint64_t v116 = v8;
  __chkstk_darwin(v9);
  sub_10000AF50();
  uint64_t v108 = v10;
  uint64_t v11 = sub_1000068D8(&qword_10006C370);
  uint64_t v12 = sub_10000AFD4(v11);
  __chkstk_darwin(v12);
  sub_10000AFF8();
  uint64_t v111 = v13;
  sub_100019448();
  __chkstk_darwin(v14);
  v115 = (char *)&v107 - v15;
  uint64_t v16 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v17 = sub_10000AFD4(v16);
  __chkstk_darwin(v17);
  sub_10000AF50();
  uint64_t v120 = v18;
  sub_10000AFE0();
  uint64_t v19 = type metadata accessor for PosterAnimationViewModel();
  sub_10000AFB4();
  __chkstk_darwin(v20);
  sub_10000AFF8();
  uint64_t v122 = v21;
  sub_100019448();
  __chkstk_darwin(v22);
  sub_1000195E0();
  uint64_t v123 = v23;
  sub_100019448();
  __chkstk_darwin(v24);
  sub_1000195E0();
  uint64_t v114 = v25;
  sub_100019448();
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v107 - v27;
  uint64_t v29 = sub_1000068D8(&qword_10006C4E0);
  uint64_t v30 = v29 - 8;
  __chkstk_darwin(v29);
  sub_100019474();
  uint64_t v33 = v32 - v31;
  uint64_t v34 = sub_1000068D8(&qword_10006C320);
  uint64_t v35 = sub_10000AFD4(v34);
  __chkstk_darwin(v35);
  sub_10000AFF8();
  uint64_t v119 = v36;
  sub_100019448();
  __chkstk_darwin(v37);
  sub_1000195E0();
  uint64_t v118 = v38;
  sub_100019448();
  __chkstk_darwin(v39);
  sub_1000195E0();
  uint64_t v121 = v40;
  sub_100019448();
  uint64_t v42 = __chkstk_darwin(v41);
  uint64_t v44 = (char *)&v107 - v43;
  __chkstk_darwin(v42);
  uint64_t v46 = (char *)&v107 - v45;
  uint64_t v124 = v4;
  sub_100018CB0();
  sub_100008010((uint64_t)v46, 0, 1, v19);
  uint64_t v47 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v48 = v33 + *(int *)(v30 + 56);
  sub_100018F48((uint64_t)v46, v33, &qword_10006C320);
  sub_100018F48(v47, v48, &qword_10006C320);
  sub_100019454(v33);
  if (v49)
  {
    sub_10000AE4C((uint64_t)v46, &qword_10006C320);
    sub_100019454(v48);
    if (v49)
    {
      sub_10000AE4C(v33, &qword_10006C320);
LABEL_18:
      uint64_t v73 = v122;
      sub_100018CB0();
      uint64_t v63 = sub_100053548();
      os_log_type_t v64 = sub_100054118();
      if (os_log_type_enabled(v63, v64))
      {
        id v65 = (uint8_t *)sub_1000194A0();
        v125[0] = sub_100019538();
        *(_DWORD *)id v65 = 136446210;
        sub_100053198();
        sub_100018C68((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v74 = sub_1000544E8();
        uint64_t v76 = sub_100029610(v74, v75, v125);
        sub_100019584(v76);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_100018C14(v73, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        uint64_t v69 = "Animation already reflects the view model with weather data at date=%{public}s";
        goto LABEL_20;
      }

      uint64_t v77 = v73;
      goto LABEL_23;
    }
    goto LABEL_9;
  }
  sub_100018F48(v33, (uint64_t)v44, &qword_10006C320);
  sub_100019454(v48);
  if (v49)
  {
    sub_10000AE4C((uint64_t)v46, &qword_10006C320);
    sub_100018C14((uint64_t)v44, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
LABEL_9:
    sub_10000AE4C(v33, &qword_10006C4E0);
    uint64_t v50 = v124;
    goto LABEL_10;
  }
  sub_100018BC0();
  char v70 = sub_100009ED4((uint64_t)v44, (uint64_t)v28);
  sub_100018C14((uint64_t)v28, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_10000AE4C((uint64_t)v46, &qword_10006C320);
  uint64_t v71 = sub_1000195EC();
  sub_100018C14(v71, v72);
  sub_10000AE4C(v33, &qword_10006C320);
  uint64_t v50 = v124;
  if (v70) {
    goto LABEL_18;
  }
LABEL_10:
  uint64_t v51 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rendererDelegate;
  if (!swift_unknownObjectWeakLoadStrong()
    || (uint64_t v52 = *(void *)(v51 + 8),
        uint64_t ObjectType = swift_getObjectType(),
        LOBYTE(v52) = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(ObjectType, v52),
        swift_unknownObjectRelease(),
        (v52 & 1) == 0))
  {
    uint64_t v62 = v123;
    sub_100018CB0();
    uint64_t v63 = sub_100053548();
    os_log_type_t v64 = sub_100054118();
    if (os_log_type_enabled(v63, v64))
    {
      id v65 = (uint8_t *)sub_1000194A0();
      v125[0] = sub_100019538();
      *(_DWORD *)id v65 = 136446210;
      sub_100053198();
      sub_100018C68((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v66 = sub_1000544E8();
      uint64_t v68 = sub_100029610(v66, v67, v125);
      sub_100019584(v68);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100018C14(v62, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
      uint64_t v69 = "Animation was not granted a render session; Skipping render of weather data at date=%{public}s";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v63, v64, v69, v65, 0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();

      goto LABEL_49;
    }

    uint64_t v77 = v62;
LABEL_23:
    sub_100018C14(v77, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    goto LABEL_49;
  }
  uint64_t v54 = v121;
  sub_100018F48(v47, v121, &qword_10006C320);
  uint64_t v55 = v118;
  sub_100018CB0();
  sub_100008010(v55, 0, 1, v19);
  sub_100019410();
  sub_1000186C8(v55, v47, &qword_10006C320);
  swift_endAccess();
  uint64_t v56 = v120;
  sub_100053188();
  uint64_t v57 = sub_100053198();
  sub_100008010(v56, 0, 1, v57);
  uint64_t v58 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_renderStartTime;
  sub_100019410();
  sub_1000186C8(v56, v58, (uint64_t *)&unk_10006C4C0);
  swift_endAccess();
  uint64_t v59 = v119;
  sub_100018F48(v54, v119, &qword_10006C320);
  sub_100019454(v59);
  if (v49)
  {
    uint64_t v60 = &qword_10006C320;
    uint64_t v61 = v59;
  }
  else
  {
    uint64_t v78 = v114;
    sub_100018BC0();
    uint64_t v79 = *(int *)(v19 + 68);
    char v80 = *(void **)(v78 + v79);
    uint64_t v81 = *(void **)(v50 + v79);
    if (v80)
    {
      uint64_t v83 = (uint64_t)v115;
      uint64_t v82 = v116;
      if (v81)
      {
        sub_100018DB0(0, (unint64_t *)&qword_10006BF68);
        id v84 = v81;
        id v85 = v80;
        char v86 = sub_100054258();

        if (v86) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      uint64_t v83 = (uint64_t)v115;
      uint64_t v82 = v116;
      if (!v81)
      {
LABEL_40:
        sub_100018C14(v78, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        goto LABEL_41;
      }
    }
    uint64_t v87 = sub_100053548();
    os_log_type_t v88 = sub_100054118();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v89 = 0;
      _os_log_impl((void *)&_mh_execute_header, v87, v88, "Resetting views due to change in background view", v89, 2u);
      sub_10000E950();
    }

    uint64_t v90 = (void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_gradientView);
    uint64_t v91 = 1;
    swift_beginAccess();
    if (*v90)
    {
      uint64_t v92 = (uint64_t)*v90 + OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient;
      swift_beginAccess();
      uint64_t v93 = v112;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v83, v92, v112);
      uint64_t v91 = 0;
    }
    else
    {
      uint64_t v93 = v112;
    }
    sub_100008010(v83, v91, 1, v93);
    uint64_t v94 = *v90;
    *uint64_t v90 = 0;

    uint64_t v95 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
    *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView) = 0;

    uint64_t v96 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel);
    *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel) = 0;

    uint64_t v97 = v111;
    sub_100018F48(v83, v111, &qword_10006C370);
    if (sub_100007FE8(v97, 1, v93) != 1)
    {
      uint64_t v98 = v108;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 32))(v108, v97, v93);
      if ((*(unsigned char *)(v78 + *(int *)(v19 + 60)) & 1) == 0) {
        sub_10001152C(v98);
      }
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v98, v93);
      sub_10000AE4C(v83, &qword_10006C370);
      goto LABEL_40;
    }
    sub_10000AE4C(v83, &qword_10006C370);
    sub_100018C14(v78, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    uint64_t v61 = v97;
    uint64_t v60 = &qword_10006C370;
  }
  sub_10000AE4C(v61, v60);
LABEL_41:
  if (*(unsigned char *)(v50 + *(int *)(v19 + 60)) == 1)
  {
    uint64_t v99 = sub_100011F2C(v1);
    sub_100053988();
    if (v117)
    {
      sub_100053538();
      uint64_t v100 = sub_100053548();
      os_log_type_t v101 = sub_100054118();
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v102 = 0;
        _os_log_impl((void *)&_mh_execute_header, v100, v101, "VFX animation should start paused, freezing the scene", v102, 2u);
        sub_10000E950();
      }

      sub_10000B02C();
      v103();
      uint64_t v104 = (void *)sub_1000539B8();
      sub_100053628();

      v105 = (void *)sub_1000539B8();
      sub_100053658();
    }
    uint64_t v106 = sub_10001212C(v1);
    sub_1000133E8(v50, v99, v106);
    swift_release();
    swift_release();
  }
  else
  {
    sub_1000118D0();
  }
  sub_10000AE4C(v54, &qword_10006C320);
LABEL_49:
  sub_100019520();
}

void sub_10001152C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DynamicRotationState();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100053CA8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v2 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v15 = type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v14, 1, v15))
  {
    uint64_t v16 = *(void **)(v14 + *(int *)(v15 + 68));
    if (v16)
    {
      uint64_t v32 = v9;
      uint64_t v17 = (void **)(v2 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_gradientView);
      swift_beginAccess();
      uint64_t v18 = *v17;
      if (*v17)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
        id v19 = v16;
        id v20 = v18;
        sub_10002AAD8((uint64_t)v13);

        return;
      }
      id v21 = v16;
      uint64_t v22 = sub_100006038(a1);
      uint64_t v23 = *v17;
      *uint64_t v17 = v22;

      uint64_t v24 = v2 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rotationState;
      swift_beginAccess();
      sub_100018F48(v24, (uint64_t)v6, &qword_10006C308);
      if (sub_100007FE8((uint64_t)v6, 1, v7) == 1)
      {

        sub_10000AE4C((uint64_t)v6, &qword_10006C308);
        return;
      }
      uint64_t v25 = (uint64_t)v32;
      sub_100018BC0();
      id v26 = [self currentDevice];
      id v27 = [v26 userInterfaceIdiom];

      if (v27 == (id)1)
      {
        swift_beginAccess();
        uint64_t v28 = *v17;
        if (*v17)
        {
          swift_endAccess();
          id v29 = v28;
          uint64_t v30 = (uint64_t)v32;
          sub_10002A978((uint64_t)v32);

          sub_100018C14(v30, (void (*)(void))type metadata accessor for DynamicRotationState);
          return;
        }
        sub_100018C14((uint64_t)v32, (void (*)(void))type metadata accessor for DynamicRotationState);
        swift_endAccess();
      }
      else
      {
        sub_100018C14(v25, (void (*)(void))type metadata accessor for DynamicRotationState);
      }
    }
  }
}

uint64_t sub_1000118D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100053768();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  __chkstk_darwin(v2);
  uint64_t v44 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100053788();
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v42 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_1000537A8();
  uint64_t v5 = *(void *)(v41 - 8);
  uint64_t v6 = __chkstk_darwin(v41);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = sub_1000068D8(&qword_10006C320);
  uint64_t v40 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v40 + 64);
  uint64_t v13 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v38 - v15;
  uint64_t v17 = sub_100053548();
  os_log_type_t v18 = sub_100054118();
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Skipping showing vfx because the poster should not show animation", v19, 2u);
    swift_slowDealloc();
  }

  uint64_t v20 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView;
  id v21 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
  if (v21)
  {
    [v21 removeFromSuperview];
    uint64_t v22 = *(void **)(v1 + v20);
  }
  else
  {
    uint64_t v22 = 0;
  }
  *(void *)(v1 + v20) = 0;

  *(void *)(v1 + 64) = 0;
  swift_release();
  uint64_t v50 = 0;
  long long aBlock = 0u;
  long long v49 = 0u;
  swift_beginAccess();
  sub_1000186C8((uint64_t)&aBlock, v1 + 112, &qword_10006C328);
  swift_endAccess();
  *(void *)(v1 + 16) = 0;
  swift_release();
  if (qword_10006BB28 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_100053CA8();
  uint64_t v24 = sub_10000E284(v23, (uint64_t)qword_100070838);
  sub_10001152C(v24);
  uint64_t v25 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  swift_beginAccess();
  sub_100018F48(v25, (uint64_t)v16, &qword_10006C320);
  sub_100018DB0(0, &qword_10006C038);
  id v26 = (void *)sub_100054178();
  sub_100053798();
  sub_1000537C8();
  id v27 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v38 = v10;
  uint64_t v39 = v27;
  uint64_t v28 = v41;
  v27(v8, v41);
  uint64_t v29 = swift_allocObject();
  swift_weakInit();
  sub_100018F48((uint64_t)v16, (uint64_t)v14, &qword_10006C320);
  unint64_t v30 = (*(unsigned __int8 *)(v40 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v29;
  sub_100018E7C((uint64_t)v14, v31 + v30);
  uint64_t v50 = sub_10001930C;
  uint64_t v51 = v31;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v49 = sub_100017B38;
  *((void *)&v49 + 1) = &unk_100066910;
  uint64_t v32 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v33 = v42;
  sub_100053778();
  *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
  sub_100018C68((unint64_t *)&qword_10006C348, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000068D8(&qword_10006C350);
  sub_100018E34((unint64_t *)&qword_10006C358, &qword_10006C350);
  uint64_t v34 = v44;
  uint64_t v35 = v47;
  sub_1000542B8();
  uint64_t v36 = v38;
  sub_100054158();
  _Block_release(v32);

  (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v35);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v45);
  v39(v36, v28);
  return sub_10000AE4C((uint64_t)v16, &qword_10006C320);
}

uint64_t sub_100011F2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = v2;
  }
  else
  {
    swift_beginAccess();
    sub_100018F48(a1 + 24, (uint64_t)&v12, &qword_10006C330);
    if (v13)
    {
      sub_100019054(&v12, (uint64_t)v15);
    }
    else
    {
      uint64_t v4 = sub_100053DF8();
      swift_allocObject();
      uint64_t v5 = sub_100053DE8();
      v15[3] = v4;
      v15[4] = &protocol witness table for VFXSceneTemplateManager;
      v15[0] = v5;
      sub_10000AE4C((uint64_t)&v12, &qword_10006C330);
    }
    sub_100018FA0((uint64_t)v15, (uint64_t)&v12);
    swift_beginAccess();
    sub_1000186C8((uint64_t)&v12, a1 + 24, &qword_10006C330);
    swift_endAccess();
    uint64_t v6 = sub_100053548();
    os_log_type_t v7 = sub_100054118();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initial rendering of animation, creating background manager", v8, 2u);
      swift_slowDealloc();
    }

    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t v13 = sub_100053A48();
    uint64_t v14 = &protocol witness table for WeatherConditionConfigurationManager;
    *(void *)&long long v12 = v9;
    sub_100018FA0((uint64_t)v15, (uint64_t)&v11);
    sub_1000539C8();
    swift_allocObject();
    swift_retain();
    uint64_t v3 = sub_100053938();
    sub_100019004((uint64_t)v15);
    *(void *)(a1 + 16) = v3;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v3;
}

uint64_t sub_10001212C(uint64_t a1)
{
  uint64_t v2 = sub_1000068D8(&qword_10006C3B0);
  __chkstk_darwin(v2);
  uint64_t v3 = sub_1000068D8(&qword_10006C3B8);
  __chkstk_darwin(v3);
  uint64_t v4 = sub_1000068D8(&qword_10006C3C0);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 64))
  {
    uint64_t v8 = *(void *)(a1 + 64);
  }
  else
  {
    uint64_t v14 = v5;
    sub_1000538D8();
    swift_allocObject();
    uint64_t v8 = sub_1000538C8();
    *(void *)(a1 + 64) = v8;
    swift_retain();
    swift_release();
    sub_1000538B8();
    sub_100053898();
    sub_100018E34(&qword_10006C3C8, &qword_10006C3B8);
    sub_100018E34(&qword_10006C3D0, &qword_10006C3B0);
    sub_100053698();
    uint64_t v9 = swift_allocObject();
    swift_weakInit();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_100018DEC;
    *(void *)(v10 + 24) = v9;
    sub_100018E34(&qword_10006C3D8, &qword_10006C3C0);
    uint64_t v11 = sub_1000536B8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v4);
    v15[3] = sub_1000536A8();
    v15[4] = &protocol witness table for AnyCancellable;
    v15[0] = v11;
    swift_beginAccess();
    sub_1000186C8((uint64_t)v15, a1 + 112, &qword_10006C328);
    swift_endAccess();
  }
  swift_retain();
  return v8;
}

uint64_t sub_100012470(char a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000124E4(a1 & 1, a2);
    return swift_release();
  }
  return result;
}

void sub_1000124E4(char a1, uint64_t a2)
{
  uint64_t v107 = sub_100053768();
  uint64_t v106 = *(void *)(v107 - 8);
  __chkstk_darwin(v107);
  uint64_t v112 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_100053788();
  uint64_t v111 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v110 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_1000537A8();
  uint64_t v109 = *(void *)(v116 - 8);
  uint64_t v7 = __chkstk_darwin(v116);
  v105 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v108 = (char *)&v90 - v9;
  uint64_t v10 = sub_1000068D8(&qword_10006C320);
  uint64_t v102 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v102 + 64);
  uint64_t v12 = __chkstk_darwin(v10 - 8);
  uint64_t v103 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v115 = (uint64_t)&v90 - v13;
  uint64_t v100 = sub_100053568();
  uint64_t v99 = *(void *)(v100 - 8);
  uint64_t v14 = __chkstk_darwin(v100);
  uint64_t v16 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  os_log_type_t v18 = (char *)&v90 - v17;
  uint64_t v19 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v98 = (char *)&v90 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v90 - v22;
  uint64_t v114 = (void *)sub_100053198();
  uint64_t v24 = *(v114 - 1);
  uint64_t v25 = __chkstk_darwin(v114);
  id v27 = (char *)&v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v104 = (char *)&v90 - v28;
  uint64_t v29 = sub_1000068D8(&qword_10006C3E8);
  __chkstk_darwin(v29 - 8);
  uint64_t v31 = (char *)&v90 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100053848();
  uint64_t v33 = __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v90 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v96 = v36;
    uint64_t v95 = v34;
    uint64_t v97 = v33;
    uint64_t v101 = v2;
    uint64_t v37 = v2 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
    swift_beginAccess();
    uint64_t v38 = type metadata accessor for PosterAnimationViewModel();
    if (!sub_100007FE8(v37, 1, v38) && *(unsigned char *)(v37 + *(int *)(v38 + 60)) == 1)
    {
      uint64_t v94 = v37;
      sub_100018F48(a2, (uint64_t)v31, &qword_10006C3E8);
      uint64_t v39 = v97;
      if (sub_100007FE8((uint64_t)v31, 1, v97) == 1)
      {
        sub_10000AE4C((uint64_t)v31, &qword_10006C3E8);
        return;
      }
      (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v96, v31, v39);
      uint64_t v43 = v101;
      sub_1000170DC();
      uint64_t v44 = v43 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_renderStartTime;
      swift_beginAccess();
      sub_100018F48(v44, (uint64_t)v23, (uint64_t *)&unk_10006C4C0);
      uint64_t v45 = (void (*)(void, void))v114;
      if (sub_100007FE8((uint64_t)v23, 1, (uint64_t)v114) == 1)
      {
        sub_10000AE4C((uint64_t)v23, (uint64_t *)&unk_10006C4C0);
        uint64_t v46 = v107;
        uint64_t v47 = v106;
        uint64_t v48 = (uint64_t)v103;
        uint64_t v49 = v102;
        uint64_t v50 = v105;
        uint64_t v51 = v94;
LABEL_38:
        uint64_t v81 = v115;
        sub_100018F48(v51, v115, &qword_10006C320);
        sub_100018DB0(0, &qword_10006C038);
        uint64_t v107 = sub_100054178();
        sub_100053798();
        uint64_t v82 = v108;
        sub_1000537C8();
        uint64_t v114 = *(void **)(v109 + 8);
        ((void (*)(char *, uint64_t))v114)(v50, v116);
        uint64_t v83 = swift_allocObject();
        swift_weakInit();
        sub_100018F48(v81, v48, &qword_10006C320);
        unint64_t v84 = (*(unsigned __int8 *)(v49 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
        uint64_t v85 = swift_allocObject();
        *(void *)(v85 + 16) = v83;
        sub_100018E7C(v48, v85 + v84);
        aBlock[4] = sub_100018EE4;
        aBlock[5] = v85;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100017B38;
        aBlock[3] = &unk_100066870;
        char v86 = _Block_copy(aBlock);
        swift_release();
        uint64_t v87 = v110;
        sub_100053778();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_100018C68((unint64_t *)&qword_10006C348, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_1000068D8(&qword_10006C350);
        sub_100018E34((unint64_t *)&qword_10006C358, &qword_10006C350);
        os_log_type_t v88 = v112;
        sub_1000542B8();
        v89 = (void *)v107;
        sub_100054158();
        _Block_release(v86);

        (*(void (**)(char *, uint64_t))(v47 + 8))(v88, v46);
        (*(void (**)(char *, uint64_t))(v111 + 8))(v87, v113);
        ((void (*)(char *, uint64_t))v114)(v82, v116);
        sub_10000AE4C(v115, &qword_10006C320);
        (*(void (**)(char *, uint64_t))(v95 + 8))(v96, v97);
        return;
      }
      uint64_t v91 = v44;
      (*(void (**)(char *, char *, void (*)(void, void)))(v24 + 32))(v104, v23, v45);
      sub_100053188();
      sub_100053118();
      double v53 = v52;
      uint64_t v54 = *(void (**)(char *, void))(v24 + 8);
      uint64_t v93 = v24 + 8;
      uint64_t v92 = v54;
      v54(v27, v45);
      sub_100053538();
      uint64_t v55 = sub_100053548();
      os_log_type_t v56 = sub_100054118();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v57 = 134217984;
        *(double *)long long aBlock = v53;
        sub_100054288();
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "VFX animation took %fs to load", v57, 0xCu);
        uint64_t v43 = v101;
        swift_slowDealloc();
      }

      uint64_t v58 = *(void (**)(char *, uint64_t))(v99 + 8);
      uint64_t v59 = v100;
      v58(v18, v100);
      uint64_t v60 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer;
      if (*(void *)(v43 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer) && v53 < 0.3)
      {
        uint64_t v99 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer;
        sub_100053538();
        swift_retain();
        uint64_t v61 = sub_100053548();
        os_log_type_t v62 = sub_100054118();
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v63 = 134349056;
          aBlock[0] = *(void *)(v101 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastPauseAnimationTimerDuration);
          sub_100054288();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v61, v62, "VFX animation loaded quickly, restarting pause timer after %{public}fs", v63, 0xCu);
          uint64_t v43 = v101;
          swift_slowDealloc();
        }
        else
        {

          swift_release();
        }
        v58(v16, v59);
        sub_1000150F4(*(double *)(v43 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastPauseAnimationTimerDuration));
        uint64_t v60 = v99;
      }
      if (*(void *)(v43 + 16))
      {
        swift_retain();
        os_log_type_t v64 = (void *)sub_1000539B8();
        swift_release();
        sub_100053648();
        float v66 = v65;

        unint64_t v67 = (void (*)(void, void))v114;
        if (v66 == 1.0)
        {
          uint64_t v68 = *(void **)(v43 + v60);
          if (v68)
          {
            id v69 = [v68 fireDate];
            sub_100053158();

            sub_100053138();
            double v71 = v70;
            v92(v27, v67);
            BOOL v72 = v71 > 0.4;
          }
          else
          {
            BOOL v72 = 1;
          }
        }
        else
        {
          BOOL v72 = 0;
        }
        uint64_t v73 = v103;
        uint64_t v74 = v102;
        uint64_t v75 = (uint64_t)v98;
      }
      else
      {
        BOOL v72 = 0;
        uint64_t v73 = v103;
        uint64_t v74 = v102;
        uint64_t v75 = (uint64_t)v98;
        unint64_t v67 = (void (*)(void, void))v114;
      }
      uint64_t v76 = sub_100053838();
      if (v76)
      {
        uint64_t v77 = (void *)v76;
        if ((*(unsigned char *)(*(void *)(v43 + 88) + 24) & 1) == 0 || !v72)
        {
          uint64_t v78 = (uint64_t)v73;
          uint64_t v49 = v74;
          v92(v104, v67);

LABEL_37:
          uint64_t v50 = v105;
          uint64_t v51 = v94;
          sub_100008010(v75, 1, 1, (uint64_t)v67);
          uint64_t v80 = v91;
          swift_beginAccess();
          sub_1000186C8(v75, v80, (uint64_t *)&unk_10006C4C0);
          swift_endAccess();
          uint64_t v46 = v107;
          uint64_t v47 = v106;
          uint64_t v48 = v78;
          goto LABEL_38;
        }
        uint64_t v78 = (uint64_t)v73;
        uint64_t v49 = v74;
        sub_100018910(0.1, 0.4);
        sub_10005107C(v79);
      }
      else
      {
        uint64_t v78 = (uint64_t)v73;
        uint64_t v49 = v74;
      }
      v92(v104, v67);
      goto LABEL_37;
    }
    uint64_t v40 = sub_100053548();
    os_log_type_t v41 = sub_100054118();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "VFX finished loading, but skipping showing VFX because the poster is no longer showing animation", v42, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    sub_100017080();
  }
}

uint64_t sub_100013394(unsigned __int8 *a1, uint64_t (*a2)(uint64_t, unsigned __int8 *))
{
  uint64_t v4 = *a1;
  uint64_t v5 = sub_1000068D8(&qword_10006C3E0);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_1000133E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v165 = a3;
  uint64_t v174 = a2;
  uint64_t v122 = a1;
  uint64_t v104 = sub_100053BE8();
  uint64_t v103 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  uint64_t v102 = (char *)&v99 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100053CD8();
  uint64_t v101 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v100 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v6 - 8);
  uint64_t v105 = (uint64_t)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = type metadata accessor for DynamicRotationState();
  uint64_t v8 = __chkstk_darwin(v106);
  uint64_t v99 = (char *)&v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v107 = (uint64_t)&v99 - v10;
  uint64_t v11 = sub_1000068D8(&qword_10006C378);
  __chkstk_darwin(v11 - 8);
  uint64_t v148 = (uint64_t)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_100053CB8();
  uint64_t v145 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  v144 = (char *)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_100053758();
  uint64_t v142 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v141 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v140 = (uint64_t)&v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v138 = (uint64_t)&v99 - v18;
  uint64_t v135 = sub_1000539E8();
  uint64_t v134 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  v133 = (char *)&v99 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_100053918();
  uint64_t v131 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  v130 = (char *)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_100053BA8();
  uint64_t v155 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  v152 = (char *)&v99 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000539F8();
  __chkstk_darwin(v22 - 8);
  v136 = (char *)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1000068D8(&qword_10006BE78);
  __chkstk_darwin(v24 - 8);
  uint64_t v129 = (uint64_t)&v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1000068D8(&qword_10006C068);
  __chkstk_darwin(v26 - 8);
  v163 = (char *)&v99 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100053198();
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  v162 = (char *)&v99 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_1000534C8();
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  v161 = (char *)&v99 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_100053D38();
  uint64_t v150 = *(void *)(v151 - 8);
  __chkstk_darwin(v151);
  v154 = (char *)&v99 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000068D8(&qword_10006C318);
  __chkstk_darwin(v31 - 8);
  uint64_t v169 = (uint64_t)&v99 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100053B68();
  uint64_t v147 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  v153 = (char *)&v99 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = (void *)sub_100053C28();
  uint64_t v173 = *(v160 - 1);
  __chkstk_darwin(v160);
  v159 = (char *)&v99 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_100053878();
  uint64_t v119 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  int v117 = (char *)&v99 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_100053E38();
  uint64_t v171 = *(void *)(v157 - 8);
  __chkstk_darwin(v157);
  v172 = (char *)&v99 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_100053888();
  uint64_t v118 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v116 = (char *)&v99 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = sub_100053CA8();
  uint64_t v167 = *(void *)(v168 - 8);
  uint64_t v38 = __chkstk_darwin(v168);
  v127 = (char *)&v99 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  v158 = (char *)&v99 - v40;
  uint64_t v41 = sub_1000533B8();
  uint64_t v166 = v41;
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v45 = (char *)&v99 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v43);
  uint64_t v47 = (char *)&v99 - v46;
  uint64_t v48 = sub_1000068D8(&qword_10006C310);
  __chkstk_darwin(v48 - 8);
  uint64_t v50 = (char *)&v99 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for SimulationReason();
  __chkstk_darwin(v51);
  double v53 = (char *)&v99 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000531B8();
  swift_storeEnumTagMultiPayload();
  sub_1000223CC((uint64_t)v53, v174);
  v137 = v53;
  sub_100018CB0();
  sub_100008010((uint64_t)v50, 0, 1, v51);
  uint64_t v54 = v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_activeRenderSimulation;
  swift_beginAccess();
  sub_1000186C8((uint64_t)v50, v54, &qword_10006C310);
  swift_endAccess();
  uint64_t v55 = v47;
  v164 = v47;
  uint64_t v56 = v122;
  sub_100010214();
  uint64_t v109 = *(void *)(v3 + 72);
  uint64_t v139 = v42;
  uint64_t v112 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v112(v45, v55, v41);
  uint64_t v57 = (int *)type metadata accessor for PosterAnimationViewModel();
  uint64_t v113 = v56 + v57[12];
  uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t))(v171 + 16);
  v171 += 16;
  uint64_t v114 = v58;
  ((void (*)(char *))v58)(v172);
  uint64_t v121 = v57[13];
  uint64_t v59 = enum case for WeatherConditionGradientModel.AnimationContext.vfx(_:);
  uint64_t v60 = sub_100053868();
  uint64_t v61 = v117;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v60 - 8) + 104))(v117, v59, v60);
  (*(void (**)(char *, void, uint64_t))(v119 + 104))(v61, enum case for WeatherConditionGradientModel.PresentationContext.fullScreen(_:), v128);
  uint64_t v119 = v57[8];
  uint64_t v110 = v56 + v57[9];
  os_log_type_t v62 = *(void (**)(void))(v173 + 16);
  v173 += 16;
  uint64_t v111 = (void (*)(char *, uint64_t, void *))v62;
  uint64_t v63 = v159;
  v62(v159);
  os_log_type_t v64 = v116;
  uint64_t v115 = v45;
  sub_100053858();
  uint64_t v65 = (uint64_t)v158;
  sub_1000538E8();
  (*(void (**)(char *, uint64_t))(v118 + 8))(v64, v120);
  uint64_t v66 = v170;
  sub_10001152C(v65);
  uint64_t v67 = v66 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastModel;
  swift_beginAccess();
  uint64_t v128 = v67;
  sub_100018F48(v67, v169, &qword_10006C318);
  (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v161, v56, v124);
  (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v162, v56 + v57[5], v126);
  v112(v45, v164, v166);
  uint64_t v68 = self;
  swift_retain();
  id v69 = [v68 milesPerHour];
  sub_100018DB0(0, &qword_10006C380);
  sub_100052EF8();
  v111(v63, v110, v160);
  v114(v172, v113, v157);
  sub_100018F48(v56 + v57[14], v129, &qword_10006BE78);
  double v70 = *(void (**)(void))(v155 + 104);
  LODWORD(v171) = enum case for VFXEffectViewID.poster(_:);
  uint64_t v173 = v155 + 104;
  v160 = v70;
  v70(v152);
  (*(void (**)(char *, void, uint64_t))(v131 + 104))(v130, enum case for WeatherConditionBackgroundConfig.CameraPositionType.default(_:), v132);
  (*(void (**)(char *, void, uint64_t))(v134 + 104))(v133, enum case for WeatherConditionBackgroundOptions.DisplayLocation.poster(_:), v135);
  double v71 = self;
  id v72 = [v71 mainScreen];
  [v72 bounds];

  uint64_t v73 = (uint64_t)v154;
  id v74 = [v71 mainScreen];
  [v74 scale];

  sub_1000539D8();
  uint64_t v75 = v56;
  sub_100018F48(v56 + v57[10], v138, (uint64_t *)&unk_10006C4C0);
  sub_100018F48(v56 + v57[11], v140, (uint64_t *)&unk_10006C4C0);
  UIAccessibilityIsReduceMotionEnabled();
  uint64_t v76 = v158;
  sub_100053D18();
  (*(void (**)(char *, char *, uint64_t))(v167 + 16))(v127, v76, v168);
  (*(void (**)(char *, void, uint64_t))(v142 + 104))(v141, enum case for DynamicTypeSize.large(_:), v143);
  uint64_t v77 = v57[16];
  uint64_t v78 = v153;
  (*(void (**)(char *, uint64_t, uint64_t))(v145 + 16))(v144, v75 + v77, v146);
  uint64_t v79 = sub_100053C78();
  sub_100008010(v148, 1, 1, v79);
  uint64_t v80 = v169;
  sub_100053B48();
  sub_100053968();
  id v81 = [self currentDevice];
  id v82 = [v81 userInterfaceIdiom];

  if (v82 == (id)1)
  {
    uint64_t v83 = v170 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rotationState;
    swift_beginAccess();
    uint64_t v84 = v105;
    sub_100018F48(v83, v105, &qword_10006C308);
    if (sub_100007FE8(v84, 1, v106) == 1)
    {
      sub_10000AE4C(v84, &qword_10006C308);
    }
    else
    {
      sub_100018BC0();
      uint64_t v85 = (uint64_t)v99;
      sub_100018CB0();
      char v86 = v100;
      sub_100053CC8();
      sub_100018C14(v85, (void (*)(void))type metadata accessor for DynamicRotationState);
      uint64_t v87 = v101;
      os_log_type_t v88 = v102;
      (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v102, v86, v108);
      uint64_t v89 = v103;
      uint64_t v90 = v104;
      (*(void (**)(char *, void, uint64_t))(v103 + 104))(v88, enum case for VFXOverrideModel.deviceRotation(_:), v104);
      uint64_t v91 = v76;
      uint64_t v92 = v152;
      uint64_t v93 = v156;
      ((void (*)(char *, void, uint64_t))v160)(v152, v171, v156);
      sub_100053958();
      uint64_t v94 = v92;
      uint64_t v76 = v91;
      (*(void (**)(char *, uint64_t))(v155 + 8))(v94, v93);
      uint64_t v95 = v88;
      uint64_t v73 = (uint64_t)v154;
      (*(void (**)(char *, uint64_t))(v89 + 8))(v95, v90);
      uint64_t v78 = v153;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v108);
      uint64_t v80 = v169;
      sub_100018C14(v107, (void (*)(void))type metadata accessor for DynamicRotationState);
    }
  }
  sub_1000539C8();
  sub_100018C68(&qword_10006C388, (void (*)(uint64_t))&type metadata accessor for WeatherConditionBackgroundManager);
  sub_100053A58();
  sub_100053B58();
  uint64_t v96 = v151;
  sub_100008010(v80, 0, 1, v151);
  uint64_t v97 = v128;
  swift_beginAccess();
  sub_1000186C8(v80, v97, &qword_10006C318);
  swift_endAccess();
  sub_100053B58();
  sub_100017E90(v73);
  (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v73, v96);
  (*(void (**)(char *, uint64_t))(v147 + 8))(v78, v149);
  (*(void (**)(char *, uint64_t))(v167 + 8))(v76, v168);
  (*(void (**)(char *, uint64_t))(v139 + 8))(v164, v166);
  return sub_100018C14((uint64_t)v137, (void (*)(void))type metadata accessor for SimulationReason);
}

void sub_100014C64(NSObject *a1, uint64_t a2)
{
}

void sub_100014C88()
{
  type metadata accessor for SimulationReason();
  sub_10000AFB4();
  __chkstk_darwin(v1);
  sub_100019474();
  uint64_t v4 = v3 - v2;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    sub_1000195EC();
    swift_storeEnumTagMultiPayload();
    swift_retain();
    uint64_t v5 = sub_1000195EC();
    sub_1000223CC(v5, v6);
    swift_release();
    sub_100018C14(v4, (void (*)(void))type metadata accessor for SimulationReason);
    if (*(void *)(v0 + 16))
    {
      swift_retain();
      sub_100053998(0);
      swift_release();
    }
    uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
    if (v7 && (id v8 = [v7 effect]) != 0)
    {
      uint64_t v9 = v8;
      sub_100018910(0.0, 0.4);
      sub_10005107C(v10);
    }
    else
    {
      *(unsigned char *)(*(void *)(v0 + 88) + 24) = 1;
    }
  }
}

uint64_t sub_100014DBC(char a1, uint64_t (*a2)(uint64_t), uint64_t a3, double a4)
{
  uint64_t v5 = v4;
  double v9 = a4;
  *(double *)(v5 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastPauseAnimationTimerDuration) = a4;
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  uint64_t v11 = (uint64_t (*)())swift_allocObject();
  *((void *)v11 + 2) = a2;
  *((void *)v11 + 3) = a3;
  *((void *)v11 + 4) = v10;
  swift_retain();
  swift_retain();
  if ((a1 & 1) != 0 && !UIAccessibilityIsReduceMotionEnabled())
  {
    swift_release();
    uint64_t v18 = (uint64_t (**)())(v5 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
    uint64_t v19 = *(void *)(v5 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
    *uint64_t v18 = sub_100018BAC;
    v18[1] = v11;
    swift_retain();
    sub_1000186B8(v19);
    if (!*(void *)(v5 + 64) || (swift_retain(), char v20 = sub_1000538A8(), swift_release(), (v20 & 1) == 0)) {
      double v9 = v9 + 0.3;
    }
    sub_1000150F4(v9);
  }
  else
  {
    sub_1000511F0();
    uint64_t v12 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer;
    uint64_t v13 = *(void **)(v5 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer);
    if (v13)
    {
      [v13 invalidate];
      uint64_t v14 = *(void **)(v5 + v12);
    }
    else
    {
      uint64_t v14 = 0;
    }
    *(void *)(v5 + v12) = 0;

    uint64_t v15 = (void *)(v5 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
    uint64_t v16 = *(void *)(v5 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
    *uint64_t v15 = 0;
    v15[1] = 0;
    sub_1000186B8(v16);
    if (*(void *)(v5 + 16))
    {
      swift_retain();
      swift_retain();
      sub_1000539A8();
      swift_release();
      swift_release();
      return swift_release_n();
    }
    sub_100014FDC(a2);
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100014FDC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for SimulationReason();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(void *)(v6 + 16);
    swift_retain();
    sub_100022BBC((uint64_t)v4, v7);
    swift_release();
    sub_100018C14((uint64_t)v4, (void (*)(void))type metadata accessor for SimulationReason);
    uint64_t Strong = swift_release();
  }
  return a1(Strong);
}

void sub_1000150F4(double a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer);
  if (v4) {
    [v4 invalidate];
  }
  uint64_t v5 = self;
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  v10[4] = sub_100018BB8;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100017018;
  v10[3] = &unk_1000667F8;
  uint64_t v7 = _Block_copy(v10);
  swift_release();
  id v8 = [v5 scheduledTimerWithTimeInterval:0 repeats:v7 block:a1];
  _Block_release(v7);
  uint64_t v9 = *(void **)(v1 + v3);
  *(void *)(v1 + v3) = v8;
}

uint64_t sub_100015224(int a1, uint64_t (*a2)(uint64_t), uint64_t a3, double a4)
{
  type metadata accessor for SimulationReason();
  sub_10000E978();
  uint64_t v10 = __chkstk_darwin(v9);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t result = UIAccessibilityIsReduceMotionEnabled();
  if ((result & 1) == 0)
  {
    int v27 = a1;
    uint64_t v14 = *(void *)(v4 + 16);
    if (v14)
    {
      uint64_t v15 = *(void **)(v4 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
      if (v15)
      {
        swift_retain();
        id v16 = [v15 effect];
        if (v16)
        {
          id v26 = v16;
          sub_1000531B8();
          swift_storeEnumTagMultiPayload();
          swift_retain();
          sub_1000223CC((uint64_t)v12, v14);
          swift_release();
          if (v27 == 2)
          {
            uint64_t v17 = 0;
            uint64_t v18 = 0;
          }
          else
          {
            uint64_t v25 = swift_allocObject();
            swift_weakInit();
            sub_100018CB0();
            uint64_t v18 = swift_allocObject();
            *(void *)(v18 + 16) = v25;
            sub_100018BC0();
            uint64_t v17 = sub_100018850;
          }
          uint64_t v19 = (void *)sub_1000539B8();
          uint64_t v20 = swift_allocObject();
          swift_weakInit();
          uint64_t v21 = swift_allocObject();
          *(void *)(v21 + 16) = v17;
          *(void *)(v21 + 24) = v18;
          *(void *)(v21 + 32) = a2;
          *(void *)(v21 + 40) = a3;
          uint64_t v22 = v26;
          *(void *)(v21 + 48) = v20;
          *(void *)(v21 + 56) = v22;
          *(unsigned char *)(v21 + 64) = v27;
          *(double *)(v21 + 72) = a4;
          sub_100018900((uint64_t)v17);
          sub_100018900((uint64_t)a2);
          swift_retain();
          id v23 = v22;
          sub_1000535E8();

          swift_release();
          sub_1000186B8((uint64_t)v17);
          swift_release();
          sub_100018C14((uint64_t)v12, (void (*)(void))type metadata accessor for SimulationReason);
          return swift_release();
        }
        uint64_t result = swift_release();
      }
    }
  }
  if (a2) {
    return a2(result);
  }
  return result;
}

uint64_t sub_100015538(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = *(void *)(result + 16);
    swift_retain();
    swift_retain();
    sub_100022BBC(a2, v4);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000155CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, uint64_t a6, uint64_t a7)
{
  uint64_t v40 = a2;
  uint64_t v41 = a7;
  uint64_t v39 = a1;
  uint64_t v10 = sub_100053C08();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100053B18();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_release();
  if (Strong)
  {
    uint64_t v19 = (void *)sub_100053688();

    if (v19)
    {
      *(float *)&long long v20 = a5;
      long long v38 = v20;
      float v21 = 1.0 - *(float *)&v20;
      sub_100018A1C((uint64_t)&off_100065D88);
      long long v37 = v22;
      sub_1000068D8(&qword_10006C338);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100055CD0;
      float v24 = *(float *)&v38;
      float32x4_t v25 = (float32x4_t)v37;
      *(float32x2_t *)(inited + 32) = vmul_n_f32(*(float32x2_t *)&v37, *(float *)&v38);
      *(float *)(inited + 40) = vmuls_lane_f32(v24, v25, 2) + 100.0;
      sub_100018A1C(inited);
      long long v32 = v26;
      *(void *)&long long v38 = a4;
      uint64_t v36 = *(void (**)(char *, void, uint64_t))(v15 + 104);
      uint64_t v31 = v14;
      v36(v17, enum case for BoundEntity.camera(_:), v14);
      sub_100053B08();
      uint64_t v30 = v27;
      uint64_t v35 = *(void (**)(char *, uint64_t))(v15 + 8);
      v35(v17, v14);
      uint64_t v34 = *(void (**)(char *, void, uint64_t))(v11 + 104);
      v34(v13, enum case for BoundPropertyName.cameraPosition(_:), v10);
      sub_100053BF8();
      *(void *)&long long v37 = a3;
      uint64_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
      v33(v13, v10);
      uint64_t v43 = (void *)sub_1000068D8(&qword_10006C340);
      *(void *)uint64_t v42 = swift_allocObject();
      *(_OWORD *)(*(void *)v42 + 16) = v32;
      sub_100053678();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100019004((uint64_t)v42);
      uint64_t v28 = v31;
      v36(v17, enum case for BoundEntity.lightning(_:), v31);
      sub_100053B08();
      v35(v17, v28);
      v34(v13, enum case for BoundPropertyName.lightningFadeProgress(_:), v10);
      sub_100053BF8();
      v33(v13, v10);
      uint64_t v43 = &type metadata for Float;
      v42[0] = v21;
      sub_100053678();
      a4 = v38;
      swift_bridgeObjectRelease();
      a3 = v37;
      swift_bridgeObjectRelease();
      sub_100019004((uint64_t)v42);
    }
  }
  return sub_100015A34(v39, v40, a3, a4);
}

uint64_t sub_100015A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100053768();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100053788();
  uint64_t result = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 | a3)
  {
    uint64_t v22 = v14;
    uint64_t v23 = result;
    sub_100018DB0(0, &qword_10006C038);
    uint64_t v21 = sub_100054178();
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = a1;
    v17[3] = a2;
    v17[4] = a3;
    v17[5] = a4;
    aBlock[4] = sub_100018B08;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100017B38;
    aBlock[3] = &unk_1000667A8;
    uint64_t v18 = _Block_copy(aBlock);
    sub_100018900(a3);
    sub_100018900(a1);
    swift_release();
    sub_100053778();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100018C68((unint64_t *)&qword_10006C348, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000068D8(&qword_10006C350);
    sub_100018E34((unint64_t *)&qword_10006C358, &qword_10006C350);
    sub_1000542B8();
    uint64_t v19 = (void *)v21;
    sub_100054188();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v16, v23);
  }
  return result;
}

uint64_t sub_100015D40(uint64_t a1)
{
  uint64_t v5 = sub_1000068D8(&qword_10006C308);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_10000AF50();
  uint64_t v50 = v7;
  sub_10000AFE0();
  uint64_t v8 = sub_100053BA8();
  sub_10000E978();
  uint64_t v48 = v9;
  __chkstk_darwin(v10);
  uint64_t v47 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AFE0();
  sub_100053BE8();
  sub_10000E978();
  uint64_t v45 = v13;
  uint64_t v46 = v12;
  __chkstk_darwin(v12);
  sub_10000AF50();
  uint64_t v44 = v14;
  sub_10000AFE0();
  uint64_t v52 = type metadata accessor for DynamicRotationState();
  sub_10000AFB4();
  __chkstk_darwin(v15);
  sub_100019484();
  uint64_t v51 = sub_100053CD8();
  sub_10000E978();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_10000AF50();
  uint64_t v20 = v19;
  sub_10000AFE0();
  type metadata accessor for SimulationReason();
  sub_10000AFB4();
  __chkstk_darwin(v21);
  sub_1000194D8();
  sub_1000531C8();
  sub_10000AFB4();
  uint64_t v22 = a1;
  sub_1000195C0();
  v23();
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v49 = v3;
  sub_1000223CC(v3, v24);
  swift_release();
  uint64_t v53 = v1;
  if (*(void *)(v1 + 16))
  {
    uint64_t v43 = a1;
    sub_100018CB0();
    swift_retain();
    uint64_t v41 = v20;
    sub_100053CC8();
    sub_100018C14(v2, (void (*)(void))type metadata accessor for DynamicRotationState);
    uint64_t v42 = v17;
    uint64_t v25 = v44;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v44, v20, v51);
    uint64_t v27 = v45;
    uint64_t v26 = v46;
    (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v25, enum case for VFXOverrideModel.deviceRotation(_:), v46);
    uint64_t v28 = enum case for VFXEffectViewID.poster(_:);
    uint64_t v30 = v47;
    uint64_t v29 = v48;
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 104);
    v40(v47, enum case for VFXEffectViewID.poster(_:), v8);
    sub_100053958();
    uint64_t v31 = *(void (**)(uint64_t))(v29 + 8);
    uint64_t v32 = sub_1000195AC();
    v31(v32);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    v40(v30, v28, v8);
    uint64_t v22 = v43;
    sub_100053978();
    swift_release();
    uint64_t v33 = sub_1000195AC();
    v31(v33);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v51);
  }
  uint64_t v34 = (void **)(v53 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_gradientView);
  swift_beginAccess();
  uint64_t v35 = *v34;
  if (*v34)
  {
    swift_endAccess();
    id v36 = v35;
    sub_10002A978(v22);

    sub_100018C14(v49, (void (*)(void))type metadata accessor for SimulationReason);
  }
  else
  {
    sub_100018C14(v49, (void (*)(void))type metadata accessor for SimulationReason);
    swift_endAccess();
  }
  uint64_t v37 = v50;
  sub_100018CB0();
  sub_100008010(v37, 0, 1, v52);
  uint64_t v38 = v53 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rotationState;
  sub_100019410();
  sub_1000186C8(v37, v38, &qword_10006C308);
  return swift_endAccess();
}

uint64_t sub_1000161DC()
{
  type metadata accessor for SimulationReason();
  sub_10000AFB4();
  __chkstk_darwin(v1);
  sub_100019474();
  uint64_t v4 = v3 - v2;
  sub_1000531C8();
  sub_10000AFB4();
  sub_1000195C0();
  v5();
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = *(void *)(v0 + 16);
  swift_retain();
  sub_100022BBC(v4, v6);
  swift_release();
  return sub_100018C14(v4, (void (*)(void))type metadata accessor for SimulationReason);
}

void sub_1000162D0()
{
  sub_100019508();
  uint64_t v3 = v0;
  char v5 = v4;
  uint64_t v6 = sub_1000068D8(&qword_10006C308);
  uint64_t v7 = sub_10000AFD4(v6);
  __chkstk_darwin(v7);
  sub_100019474();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v12 = sub_10000AFD4(v11);
  __chkstk_darwin(v12);
  sub_10000AF50();
  uint64_t v70 = v13;
  uint64_t v14 = sub_1000068D8(&qword_10006C310);
  uint64_t v15 = sub_10000AFD4(v14);
  __chkstk_darwin(v15);
  uint64_t v69 = (uint64_t)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000068D8(&qword_10006C318);
  uint64_t v18 = sub_10000AFD4(v17);
  __chkstk_darwin(v18);
  sub_1000194F0();
  uint64_t v19 = sub_1000068D8(&qword_10006C320);
  uint64_t v20 = sub_10000AFD4(v19);
  __chkstk_darwin(v20);
  sub_1000194D8();
  uint64_t v21 = sub_100053548();
  os_log_type_t v22 = sub_100054118();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v68 = v10;
    char v23 = v5;
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    v71[0] = sub_100019538();
    *(_DWORD *)uint64_t v24 = 136446210;
    char v25 = v23;
    if (v23)
    {
      if (v23 == 1) {
        uint64_t v26 = 0xD000000000000011;
      }
      else {
        uint64_t v26 = 0x646564616F6C6E75;
      }
      if (v23 == 1) {
        unint64_t v27 = 0x8000000100057480;
      }
      else {
        unint64_t v27 = 0xE800000000000000;
      }
    }
    else
    {
      uint64_t v26 = 0xD000000000000013;
      unint64_t v27 = 0x80000001000574A0;
    }
    v71[5] = sub_100029610(v26, v27, v71);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Invalidating animation for reason=%{public}s", v24, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();

    char v5 = v25;
    uint64_t v10 = v68;
  }
  else
  {
  }
  uint64_t v28 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView;
  uint64_t v29 = *(void **)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
  if (v29) {
    [v29 removeFromSuperview];
  }
  uint64_t v30 = (id *)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_gradientView);
  swift_beginAccess();
  if (*v30) {
    [*v30 removeFromSuperview];
  }
  uint64_t v31 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel;
  uint64_t v32 = *(void **)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel);
  if (v32) {
    [v32 removeFromSuperview];
  }
  uint64_t v33 = type metadata accessor for PosterAnimationViewModel();
  sub_1000193F8(v2, v34, v35, v33);
  uint64_t v36 = v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  sub_100019410();
  sub_1000186C8(v2, v36, &qword_10006C320);
  swift_endAccess();
  uint64_t v37 = sub_100053D38();
  sub_1000193F8(v1, v38, v39, v37);
  uint64_t v40 = v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastModel;
  sub_100019410();
  sub_1000186C8(v1, v40, &qword_10006C318);
  swift_endAccess();
  uint64_t v41 = *(void **)(v3 + v28);
  *(void *)(v3 + v28) = 0;

  id v42 = *v30;
  *uint64_t v30 = 0;

  uint64_t v43 = *(void **)(v3 + v31);
  *(void *)(v3 + v31) = 0;

  sub_100019598();
  sub_100019410();
  sub_1000186C8((uint64_t)v71, v3 + 112, &qword_10006C328);
  swift_endAccess();
  *(void *)(v3 + 64) = 0;
  swift_release();
  uint64_t v44 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer;
  uint64_t v45 = *(void **)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer);
  if (v45)
  {
    [v45 invalidate];
    uint64_t v46 = *(void **)(v3 + v44);
  }
  else
  {
    uint64_t v46 = 0;
  }
  *(void *)(v3 + v44) = 0;

  uint64_t v47 = (void *)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
  uint64_t v48 = *(void *)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
  void *v47 = 0;
  v47[1] = 0;
  sub_1000186B8(v48);
  uint64_t v49 = type metadata accessor for SimulationReason();
  uint64_t v50 = v69;
  sub_1000193F8(v69, v51, v52, v49);
  uint64_t v53 = v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_activeRenderSimulation;
  sub_100019410();
  sub_1000186C8(v50, v53, &qword_10006C310);
  swift_endAccess();
  uint64_t v54 = sub_100053198();
  uint64_t v55 = v70;
  sub_1000193F8(v70, v56, v57, v54);
  uint64_t v58 = v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_renderStartTime;
  sub_100019410();
  sub_1000186C8(v55, v58, (uint64_t *)&unk_10006C4C0);
  swift_endAccess();
  sub_1000511F0();
  *(void *)(v3 + 16) = 0;
  swift_release();
  sub_100023328();
  *(void *)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastPauseAnimationTimerDuration) = 0;
  uint64_t v59 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_deviceRotationTimer;
  uint64_t v60 = *(void **)(v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_deviceRotationTimer);
  if (v60)
  {
    [v60 invalidate];
    uint64_t v61 = *(void **)(v3 + v59);
  }
  else
  {
    uint64_t v61 = 0;
  }
  *(void *)(v3 + v59) = 0;

  uint64_t v62 = type metadata accessor for DynamicRotationState();
  sub_1000193F8(v10, v63, v64, v62);
  uint64_t v65 = v3 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rotationState;
  sub_100019410();
  sub_1000186C8(v10, v65, &qword_10006C308);
  swift_endAccess();
  sub_10004686C();
  if (v5)
  {
    if (v5 != 1) {
      sub_100019570();
    }
    char v66 = sub_100054508();
    swift_bridgeObjectRelease();
    if (v66) {
      goto LABEL_34;
    }
    if (v5 == 2)
    {
      sub_100019570();
      char v67 = sub_100054508();
      swift_bridgeObjectRelease();
      if ((v67 & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRelease();
LABEL_34:
  sub_100019598();
  sub_100019410();
  sub_1000186C8((uint64_t)v71, v3 + 24, &qword_10006C330);
  swift_endAccess();
LABEL_35:
  sub_100019520();
}

uint64_t sub_100016938()
{
  swift_release();
  sub_10000AE4C(v0 + 24, &qword_10006C330);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10000AE4C(v0 + 112, &qword_10006C328);
  sub_10000AE4C(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_lastModel, &qword_10006C318);

  sub_10000AE4C(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel, &qword_10006C320);
  sub_1000186B8(*(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion));
  sub_10000AE4C(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_activeRenderSimulation, &qword_10006C310);
  sub_10000AE4C(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_renderStartTime, (uint64_t *)&unk_10006C4C0);
  sub_10000AE4C(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rotationState, &qword_10006C308);

  sub_100053568();
  sub_10000AFB4();
  sub_10000B02C();
  v1();
  sub_100019374(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rendererDelegate);
  return v0;
}

uint64_t sub_100016AD4()
{
  sub_100016938();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100016B2C()
{
  return type metadata accessor for VFXAnimation();
}

uint64_t type metadata accessor for VFXAnimation()
{
  uint64_t result = qword_10006C1B0;
  if (!qword_10006C1B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100016B7C()
{
  sub_100016E14(319, &qword_10006C1C0, (void (*)(uint64_t))&type metadata accessor for BackgroundAnimationData.Model);
  if (v0 <= 0x3F)
  {
    sub_100016E14(319, (unint64_t *)&qword_10006C1C8, (void (*)(uint64_t))type metadata accessor for PosterAnimationViewModel);
    if (v1 <= 0x3F)
    {
      sub_100016E14(319, &qword_10006C1D0, (void (*)(uint64_t))type metadata accessor for SimulationReason);
      if (v2 <= 0x3F)
      {
        sub_100016E14(319, (unint64_t *)&qword_10006BEE8, (void (*)(uint64_t))&type metadata accessor for Date);
        if (v3 <= 0x3F)
        {
          sub_100016E14(319, (unint64_t *)&qword_10006C1D8, (void (*)(uint64_t))type metadata accessor for DynamicRotationState);
          if (v4 <= 0x3F)
          {
            sub_100053568();
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_100016E14(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100054278();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100016E68(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rendererDelegate + 8) = a2;
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t sub_100016ED4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer;
    unint64_t v3 = *(void **)(result + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimer);
    if (v3)
    {
      [v3 invalidate];
      unint64_t v4 = *(void **)(v1 + v2);
    }
    else
    {
      unint64_t v4 = 0;
    }
    *(void *)(v1 + v2) = 0;

    swift_retain();
    sub_1000511F0();
    swift_release();
    if (*(void *)(v1 + 16))
    {
      uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
      swift_retain();
      sub_100018900(v5);
      sub_1000539A8();
      sub_1000186B8(v5);
      swift_release();
    }
    else
    {
      uint64_t v6 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
      if (v6)
      {
        uint64_t v7 = swift_retain();
        v6(v7);
        sub_1000186B8((uint64_t)v6);
      }
    }
    uint64_t v8 = (void *)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
    uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_freezeTimerCompletion);
    *uint64_t v8 = 0;
    v8[1] = 0;
    sub_1000186B8(v9);
    return swift_release();
  }
  return result;
}

void sub_100017018(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100017080()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
  if (v1)
  {
    id v2 = v1;
    sub_100018540(v2, 0.0);
  }
}

void sub_1000170DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v2, 1, v3))
  {
    id v4 = *(void **)(v2 + *(int *)(v3 + 68));
    if (v4)
    {
      uint64_t v5 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView;
      uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_vfxView);
      if (v6)
      {
        id v7 = v4;
        id v8 = v6;
      }
      else
      {
        id v9 = objc_allocWithZone((Class)VFXView);
        id v10 = v4;
        id v11 = [v9 init];
        [v11 setAlpha:0.0];
        sub_100006124(v11, 0);
        uint64_t v12 = *(void **)(v1 + v5);
        *(void *)(v1 + v5) = v11;
        id v8 = v11;

        uint64_t v6 = 0;
      }
      id v13 = v6;
      sub_100054248();
      sub_100018540(v8, 1.0);
    }
  }
}

void sub_100017214(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = a2;
  uint64_t v2 = sub_1000068D8(&qword_10006C310);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v38 - v6;
  uint64_t v8 = type metadata accessor for SimulationReason();
  __chkstk_darwin(v8);
  uint64_t v40 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PosterAnimationViewModel();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000068D8(&qword_10006C4E0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000068D8(&qword_10006C320);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v38 - v20;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v23 = Strong;
  uint64_t v38 = v5;
  uint64_t v39 = v8;
  uint64_t v24 = Strong + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  swift_beginAccess();
  sub_100018F48(v24, (uint64_t)v21, &qword_10006C320);
  uint64_t v25 = (uint64_t)&v15[*(int *)(v13 + 48)];
  sub_100018F48((uint64_t)v21, (uint64_t)v15, &qword_10006C320);
  sub_100018F48(v41, v25, &qword_10006C320);
  if (sub_100007FE8((uint64_t)v15, 1, v10) == 1)
  {
    sub_10000AE4C((uint64_t)v21, &qword_10006C320);
    if (sub_100007FE8(v25, 1, v10) == 1)
    {
      sub_10000AE4C((uint64_t)v15, &qword_10006C320);
LABEL_12:
      uint64_t v30 = v23 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_activeRenderSimulation;
      swift_beginAccess();
      sub_100018F48(v30, (uint64_t)v7, &qword_10006C310);
      uint64_t v31 = v39;
      if (sub_100007FE8((uint64_t)v7, 1, v39) == 1)
      {
        sub_10000AE4C((uint64_t)v7, &qword_10006C310);
        uint64_t v32 = sub_100053548();
        os_log_type_t v33 = sub_1000540F8();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v34 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "Completed rendering of weather data, but there was no active render simulation.", v34, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        uint64_t v35 = (uint64_t)v40;
        sub_100018BC0();
        uint64_t v36 = *(void *)(v23 + 16);
        swift_retain();
        sub_100022BBC(v35, v36);
        swift_release();
        sub_100018C14(v35, (void (*)(void))type metadata accessor for SimulationReason);
        uint64_t v37 = (uint64_t)v38;
        sub_100008010((uint64_t)v38, 1, 1, v31);
        swift_beginAccess();
        sub_1000186C8(v37, v30, &qword_10006C310);
        swift_endAccess();
      }
      sub_1000177DC();
      swift_release();
      return;
    }
    goto LABEL_7;
  }
  sub_100018F48((uint64_t)v15, (uint64_t)v19, &qword_10006C320);
  if (sub_100007FE8(v25, 1, v10) == 1)
  {
    sub_10000AE4C((uint64_t)v21, &qword_10006C320);
    sub_100018C14((uint64_t)v19, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
LABEL_7:
    sub_10000AE4C((uint64_t)v15, &qword_10006C4E0);
    goto LABEL_8;
  }
  sub_100018BC0();
  char v29 = sub_100009ED4((uint64_t)v19, (uint64_t)v12);
  sub_100018C14((uint64_t)v12, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_10000AE4C((uint64_t)v21, &qword_10006C320);
  sub_100018C14((uint64_t)v19, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_10000AE4C((uint64_t)v15, &qword_10006C320);
  if (v29) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v26 = sub_100053548();
  os_log_type_t v27 = sub_100054118();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Skipping notifying of completion because a newer request is inflight that will notify instead", v28, 2u);
    swift_slowDealloc();
  }
  swift_release();
}

uint64_t sub_1000177DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068D8(&qword_10006C320);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100053198();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain_n();
  uint64_t v9 = sub_100053548();
  os_log_type_t v10 = sub_100054118();
  if (os_log_type_enabled(v9, v10))
  {
    v22[0] = v4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v23[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v12 = v0 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
    swift_beginAccess();
    uint64_t v13 = type metadata accessor for PosterAnimationViewModel();
    if (sub_100007FE8(v12, 1, v13))
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12 + *(int *)(v13 + 20), v5);
      uint64_t v14 = sub_1000530F8();
      unint64_t v15 = v16;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    v22[1] = sub_100029610(v14, v15, v23);
    sub_100054288();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Completed rendering of weather data at date=%{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v4 = (char *)v22[0];
  }
  else
  {
    swift_release_n();
  }
  uint64_t v17 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_rendererDelegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v21 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
    swift_beginAccess();
    sub_100018F48(v21, (uint64_t)v4, &qword_10006C320);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v4, ObjectType, v19);
    swift_unknownObjectRelease();
    return sub_10000AE4C((uint64_t)v4, &qword_10006C320);
  }
  return result;
}

uint64_t sub_100017B38(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100017B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for PosterAnimationViewModel();
  __chkstk_darwin(v3);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000068D8(&qword_10006C4E0);
  __chkstk_darwin(v6);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1000068D8(&qword_10006C320);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v14 = &v19[-v13];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v16 = result + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
    swift_beginAccess();
    sub_100018F48(v16, (uint64_t)v14, &qword_10006C320);
    uint64_t v17 = (uint64_t)&v8[*(int *)(v6 + 48)];
    sub_100018F48(a2, (uint64_t)v8, &qword_10006C320);
    sub_100018F48((uint64_t)v14, v17, &qword_10006C320);
    if (sub_100007FE8((uint64_t)v8, 1, v3) == 1)
    {
      sub_10000AE4C((uint64_t)v14, &qword_10006C320);
      if (sub_100007FE8(v17, 1, v3) == 1)
      {
        sub_10000AE4C((uint64_t)v8, &qword_10006C320);
LABEL_9:
        sub_1000177DC();
        return swift_release();
      }
    }
    else
    {
      sub_100018F48((uint64_t)v8, (uint64_t)v12, &qword_10006C320);
      if (sub_100007FE8(v17, 1, v3) != 1)
      {
        sub_100018BC0();
        char v18 = sub_100009ED4((uint64_t)v12, (uint64_t)v5);
        sub_100018C14((uint64_t)v5, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v14, &qword_10006C320);
        sub_100018C14((uint64_t)v12, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v8, &qword_10006C320);
        if (v18) {
          goto LABEL_9;
        }
        return swift_release();
      }
      sub_10000AE4C((uint64_t)v14, &qword_10006C320);
      sub_100018C14((uint64_t)v12, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    }
    sub_10000AE4C((uint64_t)v8, &qword_10006C4E0);
    return swift_release();
  }
  return result;
}

void sub_100017E90(uint64_t a1)
{
  uint64_t v60 = a1;
  uint64_t v2 = sub_100053E38();
  uint64_t v58 = *(void *)(v2 - 8);
  uint64_t v59 = v2;
  __chkstk_darwin(v2);
  uint64_t v57 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100053198();
  uint64_t v55 = *(void *)(v4 - 8);
  uint64_t v56 = v4;
  __chkstk_darwin(v4);
  uint64_t v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000533B8();
  uint64_t v54 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100053248();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000534C8();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = v1;
  uint64_t v17 = v1 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v18 = type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v17, 1, v18))
  {
    uint64_t v19 = *(void **)(v17 + *(int *)(v18 + 72));
    if (v19)
    {
      id v20 = v19;
      if (sub_100010588())
      {
        id v52 = v20;
        id v21 = [objc_allocWithZone((Class)NSDateFormatter) init];
        sub_100053D08();
        sub_1000534A8();
        os_log_type_t v22 = *(void (**)(char *, uint64_t))(v14 + 8);
        uint64_t v50 = v14 + 8;
        uint64_t v51 = v22;
        v22(v16, v13);
        Class isa = sub_100053218().super.isa;
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        [v21 setTimeZone:isa];

        [v21 setTimeStyle:1];
        [v21 setDateStyle:1];
        uint64_t v24 = (void *)0xE000000000000000;
        uint64_t v64 = 0;
        uint64_t v65 = 0xE000000000000000;
        sub_100054308(49);
        v66._countAndFlagsBits = 0x6F697469646E6F43;
        v66._object = (void *)0xEB00000000203A6ELL;
        sub_100053F58(v66);
        sub_100053CE8();
        uint64_t v25 = sub_1000533A8();
        os_log_type_t v27 = v26;
        (*(void (**)(char *, uint64_t))(v54 + 8))(v8, v6);
        v67._countAndFlagsBits = v25;
        v67._object = v27;
        sub_100053F58(v67);
        swift_bridgeObjectRelease();
        v68._countAndFlagsBits = 0x6F697461636F4C0ALL;
        v68._object = (void *)0xEB00000000203A6ELL;
        sub_100053F58(v68);
        sub_100053D08();
        sub_100053478();
        uint64_t v29 = v28;
        uint64_t v31 = v30;
        uint64_t v32 = v13;
        os_log_type_t v33 = v21;
        v51(v16, v32);
        uint64_t v62 = v29;
        uint64_t v63 = v31;
        type metadata accessor for CLLocationCoordinate2D(0);
        sub_1000543B8();
        v69._countAndFlagsBits = 0x203A657461440ALL;
        v69._object = (void *)0xE700000000000000;
        sub_100053F58(v69);
        uint64_t v34 = v53;
        sub_100053CF8();
        Class v35 = sub_100053128().super.isa;
        (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v56);
        id v36 = [v21 stringForObjectValue:v35];

        if (v36)
        {
          uint64_t v37 = sub_100053F18();
          uint64_t v24 = v38;
        }
        else
        {
          uint64_t v37 = 0;
        }
        uint64_t v39 = v61;
        v70._countAndFlagsBits = v37;
        v70._object = v24;
        sub_100053F58(v70);
        swift_bridgeObjectRelease();
        v71._countAndFlagsBits = 0x69746176656C450ALL;
        v71._object = (void *)0xEC000000203A6E6FLL;
        sub_100053F58(v71);
        sub_1000068D8(&qword_10006C390);
        uint64_t v40 = swift_allocObject();
        *(_OWORD *)(v40 + 16) = xmmword_100055B40;
        uint64_t v41 = v57;
        sub_100053D28();
        sub_100053E28();
        uint64_t v43 = v42;
        (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v59);
        *(void *)(v40 + 56) = &type metadata for CGFloat;
        *(void *)(v40 + 64) = sub_100018D00();
        *(void *)(v40 + 32) = v43;
        v72._countAndFlagsBits = sub_100053F28();
        sub_100053F58(v72);
        swift_bridgeObjectRelease();
        uint64_t v45 = v64;
        uint64_t v44 = v65;
        uint64_t v46 = OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel;
        uint64_t v47 = *(void **)(v39 + OBJC_IVAR____TtC13WeatherPoster12VFXAnimation_debugLabel);
        id v20 = v52;
        if (v47)
        {
          id v48 = v47;
          sub_100018D4C(v45, v44, v48);
        }
        else
        {
          id v49 = sub_100005C9C(v64, v65);

          swift_bridgeObjectRelease();
          id v20 = *(id *)(v39 + v46);
          *(void *)(v39 + v46) = v49;
        }
      }
    }
  }
}

id sub_100018540(void *a1, double a2)
{
  uint64_t v4 = self;
  [v4 begin];
  if (qword_10006BB40 != -1) {
    swift_once();
  }
  [v4 setAnimationTimingFunction:qword_100070880];
  uint64_t v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(double *)(v6 + 24) = a2;
  v10[4] = sub_100018F34;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100017B38;
  v10[3] = &unk_1000668C0;
  uint64_t v7 = _Block_copy(v10);
  id v8 = a1;
  swift_release();
  [v5 animateWithDuration:v7 animations:0.25];
  _Block_release(v7);
  return [v4 commit];
}

uint64_t sub_1000186B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000186C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000068D8(a3);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_100018724()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001875C()
{
  uint64_t v1 = *(void *)(type metadata accessor for SimulationReason() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  if (swift_getEnumCaseMultiPayload() <= 2)
  {
    sub_1000531C8();
    sub_10000AFB4();
    (*(void (**)(uint64_t))(v5 + 8))(v0 + v3);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100018850()
{
  uint64_t v0 = type metadata accessor for SimulationReason();
  sub_100019428(v0);
  uint64_t v1 = sub_1000195CC();

  return sub_100015538(v1, v2);
}

uint64_t sub_100018888()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000188E8()
{
  return sub_1000155CC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(double *)(v0 + 72), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_100018900(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_100018910(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0) {
    sub_100018990(0x20000000000001uLL);
  }
  else {
    __break(1u);
  }
}

unint64_t sub_100018990(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100018A1C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    long long v3 = 0uLL;
    do
    {
      if (v1 - 4 < 0xFFFFFFFFFFFFFFFDLL)
      {
        __break(1u);
        goto LABEL_8;
      }
      int v4 = *(_DWORD *)(a1 + 4 * v2 + 32);
      long long v6 = v3;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v4;
      long long v3 = v6;
      ++v2;
    }
    while (v1 != v2);
    uint64_t result = swift_bridgeObjectRelease();
    if (v1 < 3) {
      goto LABEL_9;
    }
  }
  else
  {
LABEL_8:
    uint64_t result = swift_bridgeObjectRelease();
LABEL_9:
    __break(1u);
  }
  return result;
}

uint64_t sub_100018AA8()
{
  return _swift_deallocObject(v0, 32, 15);
}

uint64_t sub_100018AB8()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100018B08()
{
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 32);
  if (v1) {
    uint64_t result = v1();
  }
  if (v2) {
    return v2();
  }
  return result;
}

uint64_t sub_100018B54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018B64()
{
  return swift_release();
}

uint64_t sub_100018B6C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100018BAC()
{
  return sub_100014FDC(*(uint64_t (**)(uint64_t))(v0 + 16));
}

uint64_t sub_100018BB8()
{
  return sub_100016ED4();
}

uint64_t sub_100018BC0()
{
  uint64_t v2 = sub_1000195F8();
  v3(v2);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_100018C14(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  sub_10000B02C();
  v3();
  return a1;
}

uint64_t sub_100018C68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018CB0()
{
  uint64_t v1 = sub_1000195F8();
  v2(v1);
  sub_10000AFB4();
  sub_1000195C0();
  v3();
  return v0;
}

unint64_t sub_100018D00()
{
  unint64_t result = qword_10006C398;
  if (!qword_10006C398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C398);
  }
  return result;
}

void sub_100018D4C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100053EE8();
  swift_bridgeObjectRelease();
  [a3 setText:v4];
}

uint64_t sub_100018DB0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100018DEC(char a1, uint64_t a2)
{
  return sub_100012470(a1, a2);
}

uint64_t sub_100018DF4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100018E2C(unsigned __int8 *a1)
{
  return sub_100013394(a1, *(uint64_t (**)(uint64_t, unsigned __int8 *))(v1 + 16));
}

uint64_t sub_100018E34(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000E47C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100018E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018EE4()
{
  return sub_100019324((uint64_t (*)(uint64_t))sub_100017214);
}

uint64_t sub_100018EFC()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_100018F34()
{
  return [*(id *)(v0 + 16) setAlpha:*(double *)(v0 + 24)];
}

uint64_t sub_100018F48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000068D8(a3);
  sub_10000AFB4();
  sub_1000195C0();
  v4();
  return a2;
}

uint64_t sub_100018FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100019004(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100019054(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100019070()
{
  sub_100019508();
  uint64_t v1 = *(void *)(sub_1000068D8(&qword_10006C320) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_release();
  uint64_t v3 = v0 + v2;
  uint64_t v4 = (int *)type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v0 + v2, 1, (uint64_t)v4))
  {
    sub_1000534C8();
    sub_10000AFB4();
    sub_10000B02C();
    v5();
    sub_100053198();
    sub_10000AFB4();
    uint64_t v7 = *(void (**)(uint64_t))(v6 + 8);
    uint64_t v8 = sub_1000194BC();
    v7(v8);
    sub_1000533B8();
    sub_10000AFB4();
    sub_10000B02C();
    v9();
    sub_100053C28();
    sub_10000AFB4();
    sub_10000B02C();
    v10();
    if (!sub_100019550(v4[10]))
    {
      uint64_t v11 = sub_1000194BC();
      v7(v11);
    }
    if (!sub_100019550(v4[11]))
    {
      uint64_t v12 = sub_1000194BC();
      v7(v12);
    }
    sub_100053E38();
    sub_10000AFB4();
    sub_10000B02C();
    v13();
    uint64_t v14 = v3 + v4[14];
    uint64_t v15 = sub_100053C68();
    if (!sub_100007FE8(v14, 1, v15)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    }
    sub_100053CB8();
    sub_10000AFB4();
    sub_10000B02C();
    v16();
  }
  sub_100019520();
  return _swift_deallocObject(v17, v18, v19);
}

uint64_t sub_10001930C()
{
  return sub_100019324((uint64_t (*)(uint64_t))sub_100017B7C);
}

uint64_t sub_100019324(uint64_t (*a1)(uint64_t))
{
  uint64_t v1 = sub_1000068D8(&qword_10006C320);
  sub_100019428(v1);
  uint64_t v2 = sub_1000195CC();

  return a1(v2);
}

uint64_t sub_100019374(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000193BC()
{
  return sub_100054508();
}

uint64_t sub_1000193D8(uint64_t a1)
{
  return sub_100008010(v1, 1, 1, a1);
}

uint64_t sub_1000193F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008010(a1, 1, 1, a4);
}

uint64_t sub_100019410()
{
  return swift_beginAccess();
}

uint64_t sub_100019428(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100019454(uint64_t a1)
{
  return sub_100007FE8(a1, 1, v1);
}

uint64_t sub_100019484()
{
  return 0;
}

uint64_t sub_1000194A0()
{
  return swift_slowAlloc();
}

uint64_t sub_1000194BC()
{
  return v0;
}

uint64_t sub_1000194CC()
{
  return 0;
}

uint64_t sub_100019538()
{
  return swift_slowAlloc();
}

uint64_t sub_100019550@<X0>(uint64_t a1@<X8>)
{
  return sub_100007FE8(v1 + a1, 1, v2);
}

uint64_t sub_100019570()
{
  return 0x646564616F6C6E75;
}

uint64_t sub_100019584(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

double sub_100019598()
{
  *(void *)(v0 - 112) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

uint64_t sub_1000195AC()
{
  return v0;
}

uint64_t sub_1000195CC()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1000195EC()
{
  return v0;
}

uint64_t sub_1000195F8()
{
  return 0;
}

uint64_t sub_100019620()
{
  return v0;
}

id sub_100019634(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100053568();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_10001F8AC();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v29 - v7;
  *(void *)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer] = 0;
  uint64_t v9 = type metadata accessor for PosterData(0);
  sub_10001F990(v9);
  uint64_t v10 = type metadata accessor for PosterAnimationViewModel();
  sub_10001F990(v10);
  *(_OWORD *)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState] = xmmword_100055DC0;
  *(_OWORD *)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState] = xmmword_100055DC0;
  v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastWakeTransitionDirection] = 3;
  v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_isRenderRequiredOnUpdate] = 0;
  uint64_t v11 = qword_10006BB68;
  uint64_t v12 = v1;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10000E284(v4, (uint64_t)qword_1000708F8);
  uint64_t v29 = v5;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v8, v13, v4);
  v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_deviceSupportsVFX] = a1 & 1;
  uint64_t v15 = sub_10001F914();
  ((void (*)(uint64_t))v14)(v15);
  if (a1)
  {
    type metadata accessor for VFXAnimation();
    sub_10001F8FC();
    uint64_t v16 = sub_100010620();
    uint64_t v17 = &off_100066688;
  }
  else
  {
    type metadata accessor for MicaAnimation();
    sub_10001F8FC();
    uint64_t v16 = (uint64_t)sub_1000471F4(v2);
    uint64_t v17 = &off_100067460;
  }
  uint64_t v18 = (uint64_t *)&v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation];
  *uint64_t v18 = v16;
  v18[1] = (uint64_t)v17;
  id v19 = objc_allocWithZone((Class)type metadata accessor for PosterDataManager());
  *(void *)&v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_dataManager] = sub_10004C828(0);
  type metadata accessor for RenderingSessionManager();
  sub_10001F8FC();
  uint64_t v20 = sub_10003B38C();
  uint64_t v21 = OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderingSessionManager;
  *(void *)&v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderingSessionManager] = v20;
  if (a1)
  {
    id v22 = [self currentDevice];
    id v23 = [v22 userInterfaceIdiom];

    char v24 = v23 != (id)1;
    uint64_t v25 = *(void *)&v12[v21];
  }
  else
  {
    uint64_t v25 = v20;
    char v24 = 0;
  }
  type metadata accessor for AnimationUnloadManager();
  swift_allocObject();
  *(void *)&v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unloadManager] = sub_10003EFAC(v24, v25);
  uint64_t v26 = sub_10001F914();
  ((void (*)(uint64_t))v14)(v26);
  type metadata accessor for PosterLabelManager();
  sub_10001F8FC();
  *(void *)&v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_labelManager] = sub_100042FAC(v2);
  type metadata accessor for DynamicRotationManager();
  sub_10001F8FC();
  swift_retain();
  uint64_t v27 = sub_100039078();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v4);
  *(void *)&v12[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_rotationManager] = v27;

  v31.receiver = v12;
  v31.super_class = ObjectType;
  return [super init];
}

void sub_1000199B4()
{
  sub_10001F8E0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_1000068D8(&qword_10006C4A0);
  uint64_t v7 = sub_10000AFD4(v6);
  __chkstk_darwin(v7);
  sub_10001F874(v8, v50);
  uint64_t v9 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v10 = sub_10000AFD4(v9);
  __chkstk_darwin(v10);
  uint64_t v55 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v12);
  sub_10000AF84(v13, v50);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v50 - v16;
  __chkstk_darwin(v15);
  id v19 = (char *)&v50 - v18;
  if (qword_10006BB68 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100053568();
  uint64_t v21 = sub_10000E284(v20, (uint64_t)qword_1000708F8);
  swift_unknownObjectRetain_n();
  uint64_t v53 = v21;
  id v22 = sub_100053548();
  os_log_type_t v23 = sub_100054118();
  p_name = &stru_100069FF8.name;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = sub_100019538();
    uint64_t v51 = v17;
    v58[0] = v26;
    *(_DWORD *)uint64_t v25 = 67240706;
    LODWORD(v57) = [v3 isPreview];
    sub_100054288();
    *(_WORD *)(v25 + 8) = 1026;
    LODWORD(v57) = [v3 isSnapshot];
    sub_100054288();
    *(_WORD *)(v25 + 14) = 2082;
    [v3 deviceOrientation];
    uint64_t v27 = sub_10001FAC0();
    uint64_t v29 = sub_100029610(v27, v28, v58);
    sub_10001F9B0(v29);
    p_name = (char **)(&stru_100069FF8 + 8);
    sub_100054288();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Did initialize; isPreview=%{BOOL,public}d, isSnapshot=%{BOOL,public}d, orientation=%{public}s",
      (uint8_t *)v25,
      0x18u);
    swift_arrayDestroy();
    uint64_t v17 = v51;
    sub_10000E950();
    sub_10000E950();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v30 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer);
  *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer) = v5;

  id v31 = v5;
  sub_1000396CC();
  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_rotationManager)
            + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate
            + 8) = &off_100066938;
  swift_unknownObjectWeakAssign();
  sub_1000068D8((uint64_t *)&unk_10006D400);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_100055DD0;
  uint64_t v33 = *(void *)(*(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8) + 8);
  *(void *)(v32 + 32) = *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation);
  *(void *)(v32 + 40) = v33;
  *(void *)(v32 + 48) = *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_labelManager);
  *(void *)(v32 + 56) = &off_100067430;
  swift_unknownObjectRetain();
  swift_retain();
  sub_10003723C(v32);
  swift_bridgeObjectRelease();
  sub_1000372D8([v3 p_name[352]]);
  v58[4] = (uint64_t)sub_10001A22C;
  v58[5] = 0;
  v58[0] = (uint64_t)_NSConcreteStackBlock;
  v58[1] = 1107296256;
  v58[2] = (uint64_t)sub_10001A230;
  v58[3] = (uint64_t)&unk_1000669B8;
  uint64_t v34 = _Block_copy(v58);
  swift_release();
  [v31 updatePreferences:v34];
  _Block_release(v34);
  if (swift_isEscapingClosureAtFileLocation())
  {
    __break(1u);
  }
  else
  {
    if (([v3 isPreview] & 1) == 0)
    {
      uint64_t v35 = *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_dataManager);
      sub_10004C2CC(v19);
      uint64_t v36 = (uint64_t)v55;
      sub_10001F58C((uint64_t)v19, (uint64_t)v55, (void (*)(void))type metadata accessor for PosterData);
      sub_100008010(v36, 0, 1, v54);
      uint64_t v37 = v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData;
      sub_100019410();
      sub_10001F488(v36, v37);
      swift_endAccess();
      sub_10001F58C((uint64_t)v19, (uint64_t)v17, (void (*)(void))type metadata accessor for PosterData);
      uint64_t v38 = v56;
      sub_10001F58C((uint64_t)v19, v56, (void (*)(void))type metadata accessor for PosterData);
      uint64_t v39 = sub_100053548();
      int v40 = sub_100054118();
      if (os_log_type_enabled(v39, (os_log_type_t)v40))
      {
        LODWORD(v54) = v40;
        uint64_t v55 = v19;
        uint64_t v41 = sub_100019538();
        uint64_t v53 = swift_slowAlloc();
        v58[0] = v53;
        *(_DWORD *)uint64_t v41 = 136446723;
        uint64_t v42 = sub_10002F11C();
        uint64_t v57 = sub_100029610(v42, v43, v58);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_10001F4F0((uint64_t)v17, (void (*)(void))type metadata accessor for PosterData);
        *(_WORD *)(v41 + 12) = 2160;
        sub_10001F9D8();
        sub_100054288();
        *(_WORD *)(v41 + 22) = 2081;
        uint64_t v44 = v52;
        sub_10002F030(v52);
        uint64_t v45 = type metadata accessor for PosterDataModel(0);
        if (sub_100007FE8(v44, 1, v45) == 1)
        {
          sub_10001F7A8(v44, &qword_10006C4A0);
          unint64_t v46 = 0xE300000000000000;
          uint64_t v47 = 7104878;
        }
        else
        {
          sub_10001F4F0(v44, (void (*)(void))type metadata accessor for PosterDataModel);
          uint64_t v47 = sub_100054218();
          unint64_t v46 = v48;
        }
        uint64_t v49 = sub_100029610(v47, v46, v58);
        sub_10001F9B0(v49);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_10001F4F0(v56, (void (*)(void))type metadata accessor for PosterData);
        _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v54, "Initializing with data=%{public}s, location=%{private,mask.hash}s", (uint8_t *)v41, 0x20u);
        swift_arrayDestroy();
        sub_10000E950();
        sub_10000E950();

        id v19 = v55;
      }
      else
      {
        sub_10001F4F0((uint64_t)v17, (void (*)(void))type metadata accessor for PosterData);
        sub_10001F4F0(v38, (void (*)(void))type metadata accessor for PosterData);
      }
      *(void *)(v35 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate + 8) = &off_100066980;
      swift_unknownObjectWeakAssign();
      *(void *)(v35 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate + 8) = &off_100066968;
      swift_unknownObjectWeakAssign();
      sub_10004C550();
      sub_10001F4F0((uint64_t)v19, (void (*)(void))type metadata accessor for PosterData);
    }
    sub_10001A298(v31, (int)[v3 isPreview]);
    sub_10001B8AC(v3, v31, 0);
    sub_10001F92C();
  }
}

void sub_10001A1B8(void *a1)
{
  id v2 = [self whiteColor];
  [a1 setPreferredProminentColor:v2];
}

uint64_t sub_10001A230(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

uint64_t sub_10001A298(void *a1, int a2)
{
  int v145 = a2;
  id v149 = a1;
  uint64_t v121 = sub_100053CB8();
  uint64_t v120 = *(void *)(v121 - 8);
  __chkstk_darwin(v121);
  uint64_t v119 = (uint64_t)&v113 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000068D8(&qword_10006BE78);
  __chkstk_darwin(v4 - 8);
  uint64_t v118 = (uint64_t)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_100053E38();
  uint64_t v131 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  uint64_t v129 = (char *)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100053C28();
  uint64_t v130 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  uint64_t v138 = (char *)&v113 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_1000533B8();
  uint64_t v127 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  v137 = (char *)&v113 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100053198();
  uint64_t v126 = *(void *)(v142 - 8);
  __chkstk_darwin(v142);
  v136 = (char *)&v113 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v125 = (uint64_t)&v113 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v135 = (uint64_t)&v113 - v13;
  uint64_t v116 = (void (*)(char *, uint64_t, uint64_t))sub_100053248();
  uint64_t v115 = *((void *)v116 - 1);
  __chkstk_darwin(v116);
  int v117 = (char *)&v113 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_1000534C8();
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v134 = (char *)&v113 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000068D8((uint64_t *)&unk_10006D940);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v113 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = (int *)type metadata accessor for PosterDataModel.DataPoint(0);
  __chkstk_darwin(v19);
  uint64_t v122 = (uint64_t)&v113 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (int *)type metadata accessor for PosterDataModel(0);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v114 = (uint64_t)&v113 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v140 = (uint64_t)&v113 - v24;
  uint64_t v133 = type metadata accessor for PosterAnimationViewModel();
  uint64_t v25 = __chkstk_darwin(v133);
  v141 = (char *)&v113 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v144 = (uint64_t)&v113 - v27;
  uint64_t v28 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  __chkstk_darwin(v28 - 8);
  uint64_t v30 = (char *)&v113 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for PosterData(0);
  uint64_t v32 = __chkstk_darwin(v31);
  uint64_t v34 = (unsigned __int8 *)&v113 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v113 - v35;
  uint64_t v148 = v2;
  uint64_t v37 = v2 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData;
  swift_beginAccess();
  sub_10001F5E0(v37, (uint64_t)v30, (uint64_t *)&unk_10006C4B0);
  if (sub_100007FE8((uint64_t)v30, 1, v31) == 1)
  {
    unsigned char *v36 = 2;
    swift_storeEnumTagMultiPayload();
    sub_10001F7A8((uint64_t)v30, (uint64_t *)&unk_10006C4B0);
  }
  else
  {
    sub_10001F698((uint64_t)v30, (uint64_t)v36, (void (*)(void))type metadata accessor for PosterData);
  }
  id v38 = v149;
  id v147 = [v149 backgroundView];
  id v146 = [v38 foregroundView];
  sub_10001F58C((uint64_t)v36, (uint64_t)v34, (void (*)(void))type metadata accessor for PosterData);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v143 = v36;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v40 = v140;
    sub_10001F698((uint64_t)v34, v140, (void (*)(void))type metadata accessor for PosterDataModel);
    uint64_t v41 = v148;
    sub_100042F20();
    *(unsigned char *)(*(void *)(v41 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unloadManager) + 32) = 0;
    sub_10001F394(*(void *)(v40 + v21[10]), (uint64_t)v18);
    if (sub_100007FE8((uint64_t)v18, 1, (uint64_t)v19) == 1)
    {
      sub_10001F7A8((uint64_t)v18, (uint64_t *)&unk_10006D940);
      uint64_t v42 = v144;
      if (qword_10006BB68 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_100053568();
      sub_10000E284(v43, (uint64_t)qword_1000708F8);
      uint64_t v44 = v114;
      sub_10001F58C(v40, v114, (void (*)(void))type metadata accessor for PosterDataModel);
      uint64_t v45 = sub_100053548();
      os_log_type_t v46 = sub_1000540F8();
      BOOL v47 = os_log_type_enabled(v45, v46);
      id v48 = v149;
      uint64_t v49 = v146;
      if (v47)
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        v155[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v50 = 136446210;
        uint64_t v51 = sub_100032538();
        v153[0] = sub_100029610(v51, v52, v155);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_10001F4F0(v44, (void (*)(void))type metadata accessor for PosterDataModel);
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Poster has data but no recent weather; model=%{public}s",
          v50,
          0xCu);
        swift_arrayDestroy();
        id v48 = v149;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_10001F4F0(v44, (void (*)(void))type metadata accessor for PosterDataModel);
      }

      uint64_t v82 = (uint64_t)v141;
      sub_10000A914(v147, v49, 1, v42);
      sub_10001F4F0(v140, (void (*)(void))type metadata accessor for PosterDataModel);
      Swift::String v72 = &off_10006B000;
    }
    else
    {
      uint64_t v59 = v122;
      sub_10001F698((uint64_t)v18, v122, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
      (*(void (**)(char *, uint64_t, void *))(v115 + 16))(v117, v40 + v21[6], v116);
      uint64_t v60 = v135;
      uint64_t v61 = v142;
      sub_100008010(v135, 1, 1, v142);
      sub_100053498();
      int v117 = *(char **)(v126 + 16);
      ((void (*)(char *, uint64_t, uint64_t))v117)(v136, v59, v61);
      uint64_t v62 = v59 + v19[5];
      uint64_t v116 = *(void (**)(char *, uint64_t, uint64_t))(v127 + 16);
      uint64_t v63 = v128;
      v116(v137, v62, v128);
      uint64_t v64 = *(void *)(v59 + v19[6]);
      uint64_t v65 = *(void *)(v59 + v19[7]);
      uint64_t v66 = v59 + v19[8];
      uint64_t v115 = *(void *)(v130 + 16);
      ((void (*)(char *, uint64_t, uint64_t))v115)(v138, v66, v139);
      sub_10001F5E0(v40 + v21[7], v60, (uint64_t *)&unk_10006C4C0);
      sub_10001F5E0(v40 + v21[8], v125, (uint64_t *)&unk_10006C4C0);
      uint64_t v67 = v59;
      uint64_t v68 = v59 + v19[9];
      Swift::String v69 = *(void (**)(char *, uint64_t, uint64_t))(v131 + 16);
      v69(v129, v68, v132);
      LODWORD(v114) = *(unsigned __int8 *)(v67 + v19[10]);
      uint64_t v70 = v118;
      sub_10001F5E0(v40 + v21[9], v118, &qword_10006BE78);
      uint64_t v42 = v144;
      (*(void (**)(uint64_t, char *, uint64_t))(v123 + 16))(v144, v134, v124);
      Swift::String v71 = (int *)v133;
      ((void (*)(uint64_t, char *, uint64_t))v117)(v42 + *(int *)(v133 + 20), v136, v142);
      Swift::String v72 = &off_10006B000;
      v116((char *)(v42 + v71[6]), (uint64_t)v137, v63);
      *(void *)(v42 + v71[7]) = v64;
      *(void *)(v42 + v71[8]) = v65;
      ((void (*)(uint64_t, char *, uint64_t))v115)(v42 + v71[9], v138, v139);
      sub_10001F5E0(v135, v42 + v71[10], (uint64_t *)&unk_10006C4C0);
      uint64_t v73 = v125;
      sub_10001F5E0(v125, v42 + v71[11], (uint64_t *)&unk_10006C4C0);
      id v74 = v129;
      uint64_t v75 = v132;
      v69((char *)(v42 + v71[12]), (uint64_t)v129, v132);
      *(unsigned char *)(v42 + v71[13]) = v114;
      sub_10001F5E0(v70, v42 + v71[14], &qword_10006BE78);
      *(unsigned char *)(v42 + v71[15]) = 1;
      uint64_t v76 = v147;
      *(void *)(v42 + v71[17]) = v147;
      uint64_t v77 = v146;
      *(void *)(v42 + v71[18]) = v146;
      id v78 = v76;
      id v79 = v77;
      uint64_t v80 = v119;
      sub_10003F45C(v119);
      uint64_t v81 = v70;
      uint64_t v49 = v77;
      sub_10001F7A8(v81, &qword_10006BE78);
      (*(void (**)(char *, uint64_t))(v131 + 8))(v74, v75);
      sub_10001F7A8(v73, (uint64_t *)&unk_10006C4C0);
      sub_10001F7A8(v135, (uint64_t *)&unk_10006C4C0);
      (*(void (**)(char *, uint64_t))(v130 + 8))(v138, v139);
      (*(void (**)(char *, uint64_t))(v127 + 8))(v137, v128);
      (*(void (**)(char *, uint64_t))(v126 + 8))(v136, v142);
      (*(void (**)(char *, uint64_t))(v123 + 8))(v134, v124);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v120 + 32))(v42 + v71[16], v80, v121);
      sub_10001F4F0(v122, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
      sub_10001F4F0(v140, (void (*)(void))type metadata accessor for PosterDataModel);
      id v48 = v149;
      uint64_t v82 = (uint64_t)v141;
    }
  }
  else
  {
    unsigned __int8 v53 = *v34;
    LODWORD(v140) = *v34;
    if (v145)
    {
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      char v58 = 0;
    }
    else
    {
      sub_100036998(v53, 0, (uint64_t)v153);
      uint64_t v54 = v153[0];
      uint64_t v55 = v153[1];
      uint64_t v56 = v153[2];
      uint64_t v57 = v153[3];
      char v58 = v154;
    }
    uint64_t v139 = v56;
    v155[0] = v54;
    v155[1] = v55;
    v155[2] = v56;
    v155[3] = v57;
    uint64_t v84 = v147;
    uint64_t v83 = v148;
    char v156 = v58;
    uint64_t v85 = *(void *)(v148 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState);
    uint64_t v86 = *(void *)(v148 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState + 8);
    id v87 = v147;
    sub_100042E9C((uint64_t)v155, v84, v85, v86);
    sub_10001F548(v54, v55);

    uint64_t v88 = *(void *)(v83 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unloadManager);
    int v89 = v140;
    if (v140 == 2)
    {
      *(unsigned char *)(v88 + 32) = 0;
    }
    else
    {
      *(unsigned char *)(v88 + 32) = 1;
      sub_10003E87C();
    }
    uint64_t v42 = v144;
    uint64_t v49 = v146;
    uint64_t v82 = (uint64_t)v141;
    Swift::String v72 = &off_10006B000;
    sub_10000A914(v87, v146, v89 == 2, v144);
    id v48 = v149;
  }
  if (v145)
  {
    id v90 = objc_msgSend(objc_msgSend(v48, "environment"), "deviceOrientation");
    swift_unknownObjectRelease();
    if (v72[365] != (ClassDescriptor *)-1) {
      swift_once();
    }
    uint64_t v91 = sub_100053568();
    sub_10000E284(v91, (uint64_t)qword_1000708F8);
    uint64_t v92 = sub_100053548();
    os_log_type_t v93 = sub_100054118();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      *(_DWORD *)uint64_t v94 = 136446210;
      uint64_t v150 = 0x2D7972656C6C6167;
      unint64_t v151 = 0xE800000000000000;
      uint64_t v152 = v95;
      v157._countAndFlagsBits = sub_10001FAC0();
      sub_100053F58(v157);
      uint64_t v42 = v144;
      swift_bridgeObjectRelease();
      uint64_t v150 = sub_100029610(v150, v151, &v152);
      uint64_t v49 = v146;
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v92, v93, "Rendering poster snapshot for kind=%{public}s", v94, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v96 = *(void *)(v148 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v96 + 48))(v42, v90, ObjectType, v96);
  }
  else
  {
    if (v72[365] != (ClassDescriptor *)-1) {
      swift_once();
    }
    uint64_t v98 = sub_100053568();
    sub_10000E284(v98, (uint64_t)qword_1000708F8);
    sub_10001F58C(v42, v82, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    uint64_t v99 = sub_100053548();
    os_log_type_t v100 = sub_100054118();
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v101 = (uint8_t *)swift_slowAlloc();
      uint64_t v150 = swift_slowAlloc();
      *(_DWORD *)uint64_t v101 = 136446210;
      sub_10001F6F8((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v102 = sub_1000544E8();
      uint64_t v152 = sub_100029610(v102, v103, &v150);
      sub_100054288();
      swift_bridgeObjectRelease();
      uint64_t v49 = v146;
      sub_10001F4F0(v82, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
      _os_log_impl((void *)&_mh_execute_header, v99, v100, "Rendering poster with live animation of weather data at date=%{public}s", v101, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10001F4F0(v82, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    }

    id v104 = [v48 environment];
    swift_getObjectType();
    sub_10003F200();
    int v106 = v105;
    swift_unknownObjectRelease();
    if (v106)
    {
      uint64_t v107 = 1;
    }
    else
    {
      uint64_t v107 = (uint64_t)objc_msgSend(objc_msgSend(v48, "environment"), "isSnapshot");
      swift_unknownObjectRelease();
    }
    uint64_t v108 = *(void *)(v148 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
    uint64_t v109 = swift_getObjectType();
    uint64_t v110 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v108 + 24);
    uint64_t v111 = swift_unknownObjectRetain();
    v110(v111, &off_100066950, v109, v108);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v108 + 40))(v42, v107, v109, v108);
  }

  sub_10001F4F0(v42, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  return sub_10001F4F0((uint64_t)v143, (void (*)(void))type metadata accessor for PosterData);
}

void sub_10001B8AC(void *a1, void *a2, void *a3)
{
  swift_getObjectType();
  if (([a1 isPreview] & 1) == 0 && (objc_msgSend(a1, "isSnapshot") & 1) == 0)
  {
    sub_100037830((unint64_t)[a1 deviceOrientation], a3);
    double v6 = sub_10003F28C();
    sub_10001D8C0(v7, a2, v6);
    double v9 = sub_10003F200();
    sub_10001DD50(v8, a2, v9);
  }
}

void sub_10001BA08(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  if (qword_10006BB68 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100053568();
  sub_10000E284(v8, (uint64_t)qword_1000708F8);
  swift_unknownObjectRetain_n();
  double v9 = sub_100053548();
  os_log_type_t v10 = sub_100054118();
  p_name = &stru_100069FF8.name;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = sub_100019538();
    *(_DWORD *)uint64_t v12 = 67240706;
    [a2 isPreview];
    sub_100054288();
    *(_WORD *)(v12 + 8) = 1026;
    [a2 isSnapshot];
    sub_100054288();
    *(_WORD *)(v12 + 14) = 2082;
    [a2 deviceOrientation];
    uint64_t v13 = sub_10001FAC0();
    sub_100029610(v13, v14, &v20);
    p_name = (char **)(&stru_100069FF8 + 8);
    sub_100054288();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Did update; isPreview=%{BOOL,public}d, isSnapshot=%{BOOL,public}d, orientation=%{public}s",
      (uint8_t *)v12,
      0x18u);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_1000396CC();
  uint64_t v15 = OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_isRenderRequiredOnUpdate;
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_isRenderRequiredOnUpdate) == 1)
  {
    uint64_t v16 = sub_100053548();
    os_log_type_t v17 = sub_100054118();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)sub_10001F85C();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Rendering poster data update that was postponed", v18, 2u);
      sub_10000E950();
    }

    *(unsigned char *)(v4 + v15) = 0;
    sub_10001A298(a1, [a2 p_name[348]]);
  }
  id v19 = [a3 animationSettings];
  sub_10001B8AC(a2, a1, v19);
}

double sub_10001BD9C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v3 = sub_10000AFD4(v2);
  __chkstk_darwin(v3);
  sub_100019474();
  uint64_t v6 = v5 - v4;
  if (qword_10006BB68 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100053568();
  uint64_t v8 = sub_10001F948(v7, (uint64_t)qword_1000708F8);
  os_log_type_t v9 = sub_100054118();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)sub_10001F85C();
    *(_WORD *)os_log_type_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Invalidated", v10, 2u);
    sub_10000E950();
  }

  sub_10004C59C();
  sub_100037684();
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void, uint64_t, uint64_t))(v11 + 80))(0, ObjectType, v11);
  sub_10003E87C();
  sub_10003977C();
  sub_100042DD8();
  uint64_t v13 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer);
  *(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer) = 0;

  uint64_t v14 = type metadata accessor for PosterData(0);
  sub_100008010(v6, 1, 1, v14);
  uint64_t v15 = v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData;
  sub_100019410();
  sub_10001F488(v6, v15);
  swift_endAccess();
  *(void *)&double result = 3;
  *(_OWORD *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState) = xmmword_100055DC0;
  *(_OWORD *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState) = xmmword_100055DC0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_isRenderRequiredOnUpdate) = 0;
  return result;
}

void sub_10001C01C()
{
}

id sub_10001C05C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_10001C160()
{
  return type metadata accessor for PosterRenderer();
}

uint64_t type metadata accessor for PosterRenderer()
{
  uint64_t result = qword_10006C480;
  if (!qword_10006C480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001C1B0()
{
  sub_10001C308(319, (unint64_t *)&qword_10006C490, (void (*)(uint64_t))type metadata accessor for PosterData);
  if (v0 <= 0x3F)
  {
    sub_10001C308(319, (unint64_t *)&qword_10006C1C8, (void (*)(uint64_t))type metadata accessor for PosterAnimationViewModel);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10001C308(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100054278();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_10001C360()
{
  sub_10001F8E0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_1000068D8(&qword_10006C4A0);
  uint64_t v5 = sub_10000AFD4(v4);
  __chkstk_darwin(v5);
  sub_10001F874(v6, v66);
  uint64_t v7 = type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v8);
  sub_10000AF84(v9, v66);
  uint64_t v11 = __chkstk_darwin(v10);
  Swift::String v69 = (char *)&v66 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v66 - v13;
  uint64_t v15 = sub_1000068D8(&qword_10006C4A8);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  sub_100019474();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v21 = sub_10000AFD4(v20);
  __chkstk_darwin(v21);
  sub_10001F890();
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v66 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v66 - v26;
  uint64_t v70 = v3;
  sub_10001F58C(v3, (uint64_t)&v66 - v26, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010((uint64_t)v27, 0, 1, v7);
  uint64_t v71 = v0;
  uint64_t v28 = v0 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData;
  swift_beginAccess();
  uint64_t v29 = v19 + *(int *)(v16 + 56);
  sub_10001F5E0((uint64_t)v27, v19, (uint64_t *)&unk_10006C4B0);
  sub_10001F5E0(v28, v29, (uint64_t *)&unk_10006C4B0);
  sub_10001F970(v19);
  if (v30)
  {
    sub_10001F7A8((uint64_t)v27, (uint64_t *)&unk_10006C4B0);
    sub_10001F970(v29);
    if (v30)
    {
      sub_10001F7A8(v19, (uint64_t *)&unk_10006C4B0);
      goto LABEL_27;
    }
    goto LABEL_9;
  }
  sub_10001F5E0(v19, (uint64_t)v25, (uint64_t *)&unk_10006C4B0);
  sub_10001F970(v29);
  if (v30)
  {
    sub_10001F7A8((uint64_t)v27, (uint64_t *)&unk_10006C4B0);
    sub_10001F4F0((uint64_t)v25, (void (*)(void))type metadata accessor for PosterData);
LABEL_9:
    sub_10001F7A8(v19, &qword_10006C4A8);
    uint64_t v31 = v72;
    goto LABEL_10;
  }
  sub_10001F698(v29, (uint64_t)v14, (void (*)(void))type metadata accessor for PosterData);
  char v56 = sub_1000328E0((uint64_t)v25, (uint64_t)v14);
  sub_10001F4F0((uint64_t)v14, (void (*)(void))type metadata accessor for PosterData);
  sub_10001F7A8((uint64_t)v27, (uint64_t *)&unk_10006C4B0);
  sub_10001F4F0((uint64_t)v25, (void (*)(void))type metadata accessor for PosterData);
  sub_10001F7A8(v19, (uint64_t *)&unk_10006C4B0);
  uint64_t v31 = v72;
  if (v56)
  {
LABEL_27:
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v57 = sub_100053568();
    uint64_t v42 = sub_10001F948(v57, (uint64_t)qword_1000708F8);
    os_log_type_t v58 = sub_100054118();
    if (os_log_type_enabled(v42, v58))
    {
      uint64_t v59 = (uint8_t *)sub_10001F85C();
      *(_WORD *)uint64_t v59 = 0;
      uint64_t v60 = "Poster data updated, but did not change";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v42, v58, v60, v59, 2u);
      sub_10000E950();
      goto LABEL_40;
    }
    goto LABEL_40;
  }
LABEL_10:
  uint64_t v32 = v70;
  sub_10001F58C(v70, v1, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010(v1, 0, 1, v7);
  sub_100019410();
  sub_10001F488(v1, v28);
  swift_endAccess();
  uint64_t v33 = *(void **)(v71 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer);
  if (v33)
  {
    uint64_t v34 = *(unsigned __int8 *)(v71 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState);
    unint64_t v35 = 0xE200000000000000;
    uint64_t v36 = 28271;
    unint64_t v37 = 0xE300000000000000;
    uint64_t v38 = 6710895;
    if (v34 != 1)
    {
      uint64_t v38 = 0x697469736E617274;
      unint64_t v37 = 0xED0000676E696E6FLL;
    }
    if (*(unsigned char *)(v71 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState))
    {
      uint64_t v36 = v38;
      unint64_t v35 = v37;
    }
    if (v34 == 3) {
      uint64_t v39 = 0x6E776F6E6B6E75;
    }
    else {
      uint64_t v39 = v36;
    }
    if (v34 == 3) {
      unint64_t v40 = 0xE700000000000000;
    }
    else {
      unint64_t v40 = v35;
    }
    uint64_t v41 = qword_10006BB68;
    uint64_t v42 = v33;
    uint64_t v43 = (uint64_t)v69;
    if (v41 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_100053568();
    sub_10000E284(v44, (uint64_t)qword_1000708F8);
    sub_10001F58C(v32, v43, (void (*)(void))type metadata accessor for PosterData);
    sub_10001F58C(v32, v31, (void (*)(void))type metadata accessor for PosterData);
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_100053548();
    int v46 = sub_100054118();
    if (os_log_type_enabled(v45, (os_log_type_t)v46))
    {
      LODWORD(v70) = v46;
      uint64_t v72 = v39;
      uint64_t v47 = v43;
      uint64_t v48 = swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      v74[0] = v67;
      *(_DWORD *)uint64_t v48 = 136446979;
      uint64_t v49 = sub_10002F11C();
      uint64_t v51 = sub_100029610(v49, v50, v74);
      sub_10001F8C8(v51);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_10001F4F0(v47, (void (*)(void))type metadata accessor for PosterData);
      *(_WORD *)(v48 + 12) = 2160;
      sub_10001F9D8();
      sub_100054288();
      *(_WORD *)(v48 + 22) = 2081;
      uint64_t v52 = v68;
      sub_10002F030(v68);
      uint64_t v53 = type metadata accessor for PosterDataModel(0);
      if (sub_100007FE8(v52, 1, v53) == 1)
      {
        sub_10001F7A8(v52, &qword_10006C4A0);
        unint64_t v54 = 0xE300000000000000;
        uint64_t v55 = 7104878;
      }
      else
      {
        sub_10001F4F0(v52, (void (*)(void))type metadata accessor for PosterDataModel);
        uint64_t v55 = sub_100054218();
        unint64_t v54 = v62;
      }
      uint64_t v63 = v72;
      uint64_t v64 = sub_100029610(v55, v54, v74);
      sub_10001F8C8(v64);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_10001F4F0(v31, (void (*)(void))type metadata accessor for PosterData);
      *(_WORD *)(v48 + 32) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v73 = sub_100029610(v63, v40, v74);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v70, "Updating to reflect the latest data; data=%{public}s, location=%{private,mask.hash}s, screen=%{public}s",
        (uint8_t *)v48,
        0x2Au);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
      sub_10001F4F0(v43, (void (*)(void))type metadata accessor for PosterData);
      sub_10001F4F0(v31, (void (*)(void))type metadata accessor for PosterData);

      swift_bridgeObjectRelease_n();
    }
    int v65 = [[v42 environment] isPreview];
    swift_unknownObjectRelease();
    sub_10001A298(v42, v65);
  }
  else
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_100053568();
    uint64_t v42 = sub_10001F948(v61, (uint64_t)qword_1000708F8);
    os_log_type_t v58 = sub_1000540F8();
    if (os_log_type_enabled(v42, v58))
    {
      uint64_t v59 = (uint8_t *)sub_10001F85C();
      *(_WORD *)uint64_t v59 = 0;
      uint64_t v60 = "Poster data updated, but unable to render new data because renderer does not exist.";
      goto LABEL_35;
    }
  }
LABEL_40:

  sub_10001F92C();
}

uint64_t sub_10001CBF0(char a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer);
  if (v3)
  {
    id v4 = v3;
    char v5 = sub_100039C04(a1, v4);

    return v5 & 1;
  }
  else
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100053568();
    uint64_t v8 = sub_10001F948(v7, (uint64_t)qword_1000708F8);
    os_log_type_t v9 = sub_1000540F8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = sub_100019538();
      *(_DWORD *)uint64_t v10 = 136446210;
      unint64_t v11 = sub_10003A758(a1);
      sub_100029610(v11, v12, &v13);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to extend session for %{public}s because renderer does not exist", v10, 0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }

    return 0;
  }
}

void sub_10001CD94(char a1)
{
}

void sub_10001CDC4()
{
  sub_10001F8E0();
  uint64_t v2 = sub_1000068D8(&qword_10006C4A0);
  uint64_t v3 = sub_10000AFD4(v2);
  __chkstk_darwin(v3);
  sub_100019474();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v8);
  sub_10001F890();
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v33 - v10;
  unint64_t v12 = *(void **)&v0[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer];
  if (!v12)
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100053568();
    uint64_t v13 = sub_10001F948(v14, (uint64_t)qword_1000708F8);
    os_log_type_t v15 = sub_1000540F8();
    if (os_log_type_enabled(v13, v15))
    {
      *(_WORD *)sub_10001F85C() = 0;
      sub_10001F9EC((void *)&_mh_execute_header, v16, v17, "Unable to extend session for 'weatherRendering' because renderer does not exist");
      sub_10000E950();
    }
    goto LABEL_3;
  }
  uint64_t v13 = v12;
  if ((sub_100039C04(1u, v13) & 1) == 0)
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100053568();
    sub_10000E284(v18, (uint64_t)qword_1000708F8);
    uint64_t v19 = v0;
    uint64_t v20 = sub_100053548();
    int v21 = sub_100054118();
    if (!os_log_type_enabled(v20, (os_log_type_t)v21))
    {

LABEL_21:
      v19[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_isRenderRequiredOnUpdate] = 1;
      goto LABEL_22;
    }
    int v36 = v21;
    unint64_t v37 = v20;
    uint64_t v22 = sub_100019538();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v39 = v35;
    *(_DWORD *)uint64_t v22 = 136446723;
    uint64_t v23 = (uint64_t)&v19[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_posterData];
    swift_beginAccess();
    if (sub_100007FE8(v23, 1, v7))
    {
      unint64_t v24 = 0xE300000000000000;
      uint64_t v25 = 7104878;
    }
    else
    {
      uint64_t v34 = type metadata accessor for PosterData;
      sub_10001F58C(v23, (uint64_t)v11, (void (*)(void))type metadata accessor for PosterData);
      uint64_t v25 = sub_10002F11C();
      unint64_t v24 = v26;
      sub_10001F4F0((uint64_t)v11, (void (*)(void))v34);
    }
    uint64_t v38 = sub_100029610(v25, v24, &v39);
    sub_100054288();

    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2160;
    uint64_t v38 = 1752392040;
    sub_100054288();
    *(_WORD *)(v22 + 22) = 2081;
    if (!sub_100007FE8(v23, 1, v7))
    {
      sub_10001F58C(v23, v1, (void (*)(void))type metadata accessor for PosterData);
      sub_10002F030(v6);
      sub_10001F4F0(v1, (void (*)(void))type metadata accessor for PosterData);
      uint64_t v27 = type metadata accessor for PosterDataModel(0);
      if (sub_100007FE8(v6, 1, v27) != 1)
      {
        sub_10001F4F0(v6, (void (*)(void))type metadata accessor for PosterDataModel);
        uint64_t v31 = sub_100054218();
        unint64_t v28 = v32;
        uint64_t v29 = v37;
        os_log_type_t v30 = v36;
        goto LABEL_20;
      }
      sub_10001F7A8(v6, &qword_10006C4A0);
    }
    unint64_t v28 = 0xE300000000000000;
    uint64_t v29 = v37;
    os_log_type_t v30 = v36;
    uint64_t v31 = 7104878;
LABEL_20:
    uint64_t v38 = sub_100029610(v31, v28, &v39);
    sub_100054288();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Render was postponed because extended session was not granted; data=%{public}s, location=%{private,mask.hash}s",
      (uint8_t *)v22,
      0x20u);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();

    goto LABEL_21;
  }
LABEL_3:

LABEL_22:
  sub_10001F92C();
}

void sub_10001D294(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000068D8(&qword_10006C320);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_10001F8AC();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v35 - v8;
  sub_10003A480(1);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer];
  if (v10)
  {
    uint64_t v11 = *(void *)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation];
    uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8];
    id v13 = v10;
    sub_10003EEB8(v13, v11, v12);
    LOBYTE(v11) = objc_msgSend(objc_msgSend(v13, "environment"), "isPreview");
    swift_unknownObjectRelease();
    if ((v11 & 1) == 0)
    {
      unsigned __int8 v14 = objc_msgSend(objc_msgSend(v13, "environment"), "isSnapshot");
      swift_unknownObjectRelease();
      if ((v14 & 1) == 0)
      {
        uint64_t v15 = (uint64_t)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastRenderedAnimationViewModel];
        swift_beginAccess();
        sub_10001F5E0(v15, (uint64_t)v9, &qword_10006C320);
        char v16 = sub_10001EAD4((uint64_t)v9, v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_deviceSupportsVFX]);
        sub_10001F7A8((uint64_t)v9, &qword_10006C320);
        if (v16)
        {
          if (qword_10006BB68 != -1) {
            swift_once();
          }
          uint64_t v17 = sub_100053568();
          sub_10000E284(v17, (uint64_t)qword_1000708F8);
          sub_10001F5E0(a1, v2, &qword_10006C320);
          id v18 = v3;
          uint64_t v19 = sub_100053548();
          os_log_type_t v20 = sub_100054118();
          int v21 = v20;
          if (os_log_type_enabled(v19, v20))
          {
            uint64_t v22 = swift_slowAlloc();
            int v37 = v21;
            uint64_t v23 = v22;
            os_log_t v38 = (os_log_t)swift_slowAlloc();
            v40[0] = (uint64_t)v38;
            *(_DWORD *)uint64_t v23 = 136446466;
            v35[1] = v23 + 4;
            sub_10001F5E0(v15, (uint64_t)v9, &qword_10006C320);
            os_log_t v36 = v19;
            uint64_t v24 = sub_10001EFFC();
            unint64_t v26 = v25;
            sub_10001F7A8((uint64_t)v9, &qword_10006C320);
            uint64_t v39 = sub_100029610(v24, v26, v40);
            sub_100054288();

            swift_bridgeObjectRelease();
            *(_WORD *)(v23 + 12) = 2082;
            uint64_t v27 = sub_10001EFFC();
            uint64_t v39 = sub_100029610(v27, v28, v40);
            sub_100054288();
            swift_bridgeObjectRelease();
            sub_10001F7A8(v2, &qword_10006C320);
            os_log_t v29 = v36;
            _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v37, "Render content has significantly changed; from='%{public}s', to='%{public}s'",
              (uint8_t *)v23,
              0x16u);
            swift_arrayDestroy();
            sub_10000E950();
            sub_10000E950();
          }
          else
          {

            sub_10001F7A8(v2, &qword_10006C320);
          }
          [v13 noteContentSignificantlyChanged];
        }
      }
    }

    uint64_t v34 = (uint64_t)v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastRenderedAnimationViewModel;
    sub_100019410();
    sub_10001F630(a1, v34);
    swift_endAccess();
  }
  else
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_100053568();
    os_log_t v38 = (os_log_t)sub_10001F948(v30, (uint64_t)qword_1000708F8);
    os_log_type_t v31 = sub_1000540F8();
    if (os_log_type_enabled(v38, v31))
    {
      unint64_t v32 = (uint8_t *)sub_10001F85C();
      *(_WORD *)unint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v31, "Unable to handle render completion because renderer does not exist", v32, 2u);
      sub_10000E950();
    }
    os_log_t v33 = v38;
  }
}

uint64_t sub_10001D764()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer);
  if (v1)
  {
    uint64_t v2 = v1;
    char v3 = sub_100039C04(4u, v2);
  }
  else
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100053568();
    uint64_t v2 = sub_10001F948(v4, (uint64_t)qword_1000708F8);
    os_log_type_t v5 = sub_1000540F8();
    if (os_log_type_enabled(v2, v5))
    {
      *(_WORD *)sub_10001F85C() = 0;
      sub_10001F9EC((void *)&_mh_execute_header, v6, v7, "Unable to extend session for device rotation because renderer does not exist");
      sub_10000E950();
    }
    char v3 = 0;
  }

  return v3 & 1;
}

id sub_10001D858()
{
  sub_10003A480(4);
  id result = *(id *)(v0 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer);
  if (result)
  {
    return [result noteContentSignificantlyChanged];
  }
  return result;
}

void sub_10001D8C0(unsigned __int8 a1, void *a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState;
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState);
  uint64_t v10 = *(uint64_t *)(v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState + 8);
  uint64_t v11 = v9;
  if (v9 == 3 || (v9 == a1 ? (BOOL v12 = *(double *)&v10 == a3) : (BOOL v12 = 0), !v12))
  {
    unsigned __int8 v13 = sub_10000EF90(v9, v10, a3);
    uint64_t v14 = OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastWakeTransitionDirection;
    int v15 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_lastWakeTransitionDirection);
    BOOL v16 = v15 == 3;
    BOOL v18 = v15 != 3 && v15 == v13;
    if (v13 == 3) {
      char v19 = v16;
    }
    else {
      char v19 = v18;
    }
    if (v11 != 1 && a1 == 1)
    {
      if (qword_10006BB68 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_100053568();
      sub_10000E284(v21, (uint64_t)qword_1000708F8);
      uint64_t v22 = sub_100053548();
      os_log_type_t v23 = sub_100054118();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Screen is off, pausing animation", v24, 2u);
        swift_slowDealloc();
      }

      sub_10001E438(1, a2);
    }
    if (v13) {
      char v25 = 1;
    }
    else {
      char v25 = v19;
    }
    if ((v25 & 1) == 0 && !*(unsigned char *)(v4 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState))
    {
      if (qword_10006BB68 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_100053568();
      sub_10000E284(v26, (uint64_t)qword_1000708F8);
      uint64_t v27 = sub_100053548();
      os_log_type_t v28 = sub_100054118();
      if (os_log_type_enabled(v27, v28))
      {
        os_log_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_t v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Screen was turned on and settled on lock screen, starting animation", v29, 2u);
        swift_slowDealloc();
      }

      sub_10001E438(2, a2);
    }
    uint64_t v30 = a1;
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_100053568();
    sub_10000E284(v31, (uint64_t)qword_1000708F8);
    unint64_t v32 = sub_100053548();
    os_log_type_t v33 = sub_100054118();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136446466;
      uint64_t v35 = sub_10000F010(a1);
      sub_100029610(v35, v36, &v39);
      sub_100054288();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2082;
      if (v13 == 3)
      {
        unint64_t v37 = 0xE300000000000000;
        uint64_t v38 = 7104878;
      }
      else if (v13)
      {
        if (v13 == 1)
        {
          unint64_t v37 = 0xE300000000000000;
          uint64_t v38 = 6710895;
        }
        else
        {
          unint64_t v37 = 0xED0000676E696E6FLL;
          uint64_t v38 = 0x697469736E617274;
        }
      }
      else
      {
        unint64_t v37 = 0xE200000000000000;
        uint64_t v38 = 28271;
      }
      sub_100029610(v38, v37, &v39);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Setting wake state to %{public}s; transitionDirection=%{public}s",
        (uint8_t *)v34,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v30 = a1;
    }
    else
    {
    }
    *(void *)uint64_t v8 = v30;
    *(double *)(v8 + 8) = a3;
    *(unsigned char *)(v4 + v14) = v13;
  }
}

void sub_10001DD50(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (double *)(v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState);
  uint64_t v9 = *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState);
  if (v9 == 3 || (v9 == a1 ? (BOOL v10 = v8[1] == a3) : (BOOL v10 = 0), !v10))
  {
    if (sub_100039AAC(a2))
    {
      uint64_t v39 = *(unsigned __int8 *)v8;
      if (v39 != 3)
      {
        if (!*(unsigned char *)v8 && (_BYTE)a1)
        {
          if (qword_10006BB68 != -1) {
            swift_once();
          }
          uint64_t v11 = sub_100053568();
          sub_10000E284(v11, (uint64_t)qword_1000708F8);
          BOOL v12 = sub_100053548();
          os_log_type_t v13 = sub_100054118();
          if (!os_log_type_enabled(v12, v13))
          {
            char v15 = 1;
            goto LABEL_28;
          }
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Starting to move from lock screen to home screen, pausing animation", v14, 2u);
          char v15 = 1;
          goto LABEL_26;
        }
        if (!*(unsigned char *)v8) {
          goto LABEL_29;
        }
      }
      if ((_BYTE)a1 || *(unsigned char *)(v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_wakeState))
      {
LABEL_29:
        if (qword_10006BB68 != -1) {
          swift_once();
        }
        uint64_t v25 = sub_100053568();
        sub_10000E284(v25, (uint64_t)qword_1000708F8);
        uint64_t v26 = sub_100053548();
        os_log_type_t v27 = sub_100054118();
        if (os_log_type_enabled(v26, v27))
        {
          os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
          uint64_t v40 = swift_slowAlloc();
          *(_DWORD *)os_log_type_t v28 = 136446210;
          uint64_t v29 = sub_100007860(a1);
          sub_100029610(v29, v30, &v40);
          sub_100054288();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Setting unlock progress to %{public}s", v28, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        *(void *)uint64_t v8 = a1;
        v8[1] = a3;
        if (sub_10003E8BC())
        {
          unsigned __int8 v31 = objc_msgSend(objc_msgSend(a2, "environment"), "isPreview");
          swift_unknownObjectRelease();
          if ((v31 & 1) == 0)
          {
            sub_10003E8E0();
            if (a1 == 1)
            {
              if (v39 != 1)
              {
                if (sub_100039C04(2u, a2))
                {
                  uint64_t v33 = swift_allocObject();
                  swift_unknownObjectWeakInit();
                  unint64_t v32 = sub_10001F834;
                  goto LABEL_36;
                }
                unint64_t v36 = sub_100053548();
                os_log_type_t v37 = sub_100054118();
                if (os_log_type_enabled(v36, v37))
                {
                  uint64_t v38 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v38 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v36, v37, "Skipping unloading because renderer failed to get extended session", v38, 2u);
                  swift_slowDealloc();
                }
              }
            }
            else if (v39 == 1 && !UIAccessibilityIsReduceMotionEnabled())
            {
              sub_10001A298(a2, 0);
            }
          }
        }
        unint64_t v32 = 0;
        uint64_t v33 = 0;
LABEL_36:
        uint64_t v34 = *(void *)(v4 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, void (*)(), uint64_t, uint64_t, uint64_t, double))(v34 + 72))(a1, v32, v33, ObjectType, v34, a3);
        sub_100042F74(a3);
        sub_1000186B8((uint64_t)v32);
        return;
      }
      if (qword_10006BB68 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_100053568();
      sub_10000E284(v22, (uint64_t)qword_1000708F8);
      BOOL v12 = sub_100053548();
      os_log_type_t v23 = sub_100054118();
      char v15 = 2;
      if (!os_log_type_enabled(v12, v23))
      {
LABEL_28:

        sub_10001E438(v15, a2);
        goto LABEL_29;
      }
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v23, "Settling on lock screen from home screen and screen is on, restarting animation", v24, 2u);
LABEL_26:
      swift_slowDealloc();
      goto LABEL_28;
    }
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_100053568();
    sub_10000E284(v16, (uint64_t)qword_1000708F8);
    uint64_t v17 = sub_100053548();
    os_log_type_t v18 = sub_100054118();
    if (os_log_type_enabled(v17, v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)char v19 = 136446210;
      uint64_t v20 = sub_100007860(a1);
      sub_100029610(v20, v21, &v40);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to get extended session for unlock, skipping unlock update; unlockState=%{public}s",
        v19,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    *(void *)uint64_t v8 = a1;
    v8[1] = a3;
  }
}

uint64_t sub_10001E438(char a1, void *a2)
{
  uint64_t v3 = v2;
  if (sub_100039C04(0, a2))
  {
    if (a1 == 2)
    {
      uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v5 + 56))(ObjectType, v5);
    }
    uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
    double v8 = 0.0;
    if (a1 != 1) {
      double v8 = sub_10004295C();
    }
    uint64_t v9 = swift_getObjectType();
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v11 = *(void (**)(BOOL, uint64_t (*)(), uint64_t, uint64_t, uint64_t, double))(v7 + 64);
    swift_retain();
    v11(a1 != 1, sub_10001F83C, v10, v9, v7, v8);
    return swift_release_n();
  }
  else
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100053568();
    sub_10000E284(v13, (uint64_t)qword_1000708F8);
    uint64_t v14 = sub_100053548();
    os_log_type_t v15 = sub_100054118();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446210;
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v17 = 0xD000000000000010;
        }
        else {
          uint64_t v17 = 0x6E65685479616C70;
        }
        if (a1 == 1) {
          unint64_t v18 = 0x8000000100057960;
        }
        else {
          unint64_t v18 = 0xED00006573756150;
        }
      }
      else
      {
        unint64_t v18 = 0xE500000000000000;
        uint64_t v17 = 0x6573756170;
      }
      sub_100029610(v17, v18, &v21);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Skipping %{public}s animation because no render session was granted", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v19 = *(void *)(v3 + OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation + 8);
    uint64_t v20 = swift_getObjectType();
    return (*(uint64_t (**)(void, uint64_t (*)(void), void, uint64_t, uint64_t, double))(v19 + 64))(0, WeatherIntentResponseCode.rawValue.getter, 0, v20, v19, 0.0);
  }
}

void sub_10001E76C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_10001E7C0();
  }
}

void sub_10001E7C0()
{
  uint64_t v1 = v0;
  if ((sub_10003E8BC() & 1) != 0 && v0[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState] == 1)
  {
    uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_renderer];
    uint64_t v3 = &v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation];
    uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_animation];
    uint64_t v5 = *((void *)v3 + 1);
    id v15 = v2;
    sub_10003E9A8(v2, v4, v5);
  }
  else
  {
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100053568();
    sub_10000E284(v6, (uint64_t)qword_1000708F8);
    uint64_t v7 = v0;
    double v8 = sub_100053548();
    os_log_type_t v9 = sub_100054118();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 67240450;
      sub_10003E8BC();
      sub_100054288();
      *(_WORD *)(v10 + 8) = 2082;
      uint64_t v11 = v7[OBJC_IVAR____TtC13WeatherPoster14PosterRenderer_unlockState];
      if (v11 == 3)
      {
        unint64_t v12 = 0xE300000000000000;
        uint64_t v13 = 7104878;
      }
      else
      {
        uint64_t v13 = sub_100007860(v11);
        unint64_t v12 = v14;
      }
      sub_100029610(v13, v12, &v16);
      sub_100054288();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Skipping unloading because state changed; unloadingEnabled=%{BOOL,public}d unlockState=%{public}s",
        (uint8_t *)v10,
        0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10003A480(2);
  }
}

uint64_t sub_10001EA60()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_retain();
    sub_10003A480(0);

    return swift_release();
  }
  return result;
}

uint64_t sub_10001EAD4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int v37 = a2;
  uint64_t v38 = sub_1000068D8(&qword_10006C4E0);
  __chkstk_darwin(v38);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000068D8(&qword_10006C320);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v36 = (uint64_t)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v35 - v11;
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v35 - v13;
  uint64_t v15 = type metadata accessor for PosterAnimationViewModel();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v35 = (uint64_t)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v35 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v35 - v21;
  sub_10001F5E0(v3, (uint64_t)v14, &qword_10006C320);
  if (sub_100007FE8((uint64_t)v14, 1, v15) == 1)
  {
    unint64_t v12 = v14;
LABEL_5:
    uint64_t v24 = v38;
    sub_10001F7A8((uint64_t)v12, &qword_10006C320);
    uint64_t v25 = (uint64_t)&v6[*(int *)(v24 + 48)];
    sub_10001F5E0(a1, (uint64_t)v6, &qword_10006C320);
    sub_10001F5E0(v3, v25, &qword_10006C320);
    if (sub_100007FE8((uint64_t)v6, 1, v15) == 1)
    {
      if (sub_100007FE8(v25, 1, v15) == 1)
      {
        sub_10001F7A8((uint64_t)v6, &qword_10006C320);
        char v26 = 0;
        return v26 & 1;
      }
    }
    else
    {
      uint64_t v27 = v36;
      sub_10001F5E0((uint64_t)v6, v36, &qword_10006C320);
      if (sub_100007FE8(v25, 1, v15) != 1)
      {
        uint64_t v30 = v35;
        sub_10001F698(v25, v35, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        char v31 = sub_100009ED4(v27, v30);
        sub_10001F4F0(v30, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10001F4F0(v27, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10001F7A8((uint64_t)v6, &qword_10006C320);
        char v26 = v31 ^ 1;
        return v26 & 1;
      }
      sub_10001F4F0(v27, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    }
    sub_10001F7A8((uint64_t)v6, &qword_10006C4E0);
LABEL_16:
    char v26 = 1;
    return v26 & 1;
  }
  char v23 = v37;
  sub_10001F698((uint64_t)v14, (uint64_t)v22, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_10001F5E0(a1, (uint64_t)v12, &qword_10006C320);
  if (sub_100007FE8((uint64_t)v12, 1, v15) == 1)
  {
    sub_10001F4F0((uint64_t)v22, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    goto LABEL_5;
  }
  sub_10001F698((uint64_t)v12, (uint64_t)v20, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_1000533B8();
  sub_10001F6F8(&qword_10006C4E8, (void (*)(uint64_t))&type metadata accessor for WeatherCondition);
  if ((sub_100053ED8() & 1) == 0)
  {
    sub_10001F4F0((uint64_t)v20, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    sub_10001F4F0((uint64_t)v22, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    goto LABEL_16;
  }
  if (v23)
  {
    sub_100053118();
    double v29 = v28;
    sub_10001F4F0((uint64_t)v20, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    sub_10001F4F0((uint64_t)v22, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    char v26 = v29 >= 900.0;
  }
  else
  {
    char v33 = v22[*(int *)(v15 + 52)];
    sub_10001F4F0((uint64_t)v22, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    char v34 = v20[*(int *)(v15 + 52)];
    sub_10001F4F0((uint64_t)v20, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    char v26 = v33 ^ v34;
  }
  return v26 & 1;
}

uint64_t sub_10001EFFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068D8(&qword_10006C320);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PosterAnimationViewModel();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F5E0(v1, (uint64_t)v4, &qword_10006C320);
  if (sub_100007FE8((uint64_t)v4, 1, v5) == 1)
  {
    sub_10001F7A8((uint64_t)v4, &qword_10006C320);
    return 7104878;
  }
  else
  {
    sub_10001F698((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
    sub_100054308(38);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0x697469646E6F637BLL;
    unint64_t v13 = 0xEB000000003D6E6FLL;
    v14._countAndFlagsBits = sub_1000533A8();
    sub_100053F58(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 0x3D65746164202CLL;
    v15._object = (void *)0xE700000000000000;
    sub_100053F58(v15);
    sub_100053198();
    sub_10001F6F8((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
    v16._countAndFlagsBits = sub_1000544E8();
    sub_100053F58(v16);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0x6C7961447369202CLL;
    v17._object = (void *)0xED00003D74686769;
    sub_100053F58(v17);
    if (v7[*(int *)(v5 + 52)]) {
      v9._countAndFlagsBits = 1702195828;
    }
    else {
      v9._countAndFlagsBits = 0x65736C6166;
    }
    if (v7[*(int *)(v5 + 52)]) {
      uint64_t v10 = (void *)0xE400000000000000;
    }
    else {
      uint64_t v10 = (void *)0xE500000000000000;
    }
    v9._object = v10;
    sub_100053F58(v9);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 125;
    v18._object = (void *)0xE100000000000000;
    sub_100053F58(v18);
    uint64_t v8 = v12;
    sub_10001F4F0((uint64_t)v7, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  }
  return v8;
}

uint64_t sub_10001F2A8()
{
  NSString v1 = sub_100053EE8();
  id v2 = [v0 objectForUserInfoKey:v1];

  if (v2)
  {
    sub_1000542A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_10001F740((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
  }
  else
  {
    sub_10001F7A8((uint64_t)v6, &qword_10006C4F0);
  }
  return 0;
}

uint64_t sub_10001F394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = v3 - 1;
    uint64_t v6 = type metadata accessor for PosterDataModel.DataPoint(0);
    sub_10001F58C(a1+ ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80))+ *(void *)(*(void *)(v6 - 8) + 72) * v5, a2, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
    uint64_t v7 = a2;
    uint64_t v8 = 0;
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v9 = type metadata accessor for PosterDataModel.DataPoint(0);
    uint64_t v7 = a2;
    uint64_t v8 = 1;
  }

  return sub_100008010(v7, v8, 1, v9);
}

uint64_t sub_10001F488(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F4F0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10001F548(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001F58C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  uint64_t v4 = sub_10001F9C4();
  v5(v4);
  return a2;
}

uint64_t sub_10001F5E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000068D8(a3);
  sub_10000AFB4();
  uint64_t v4 = sub_10001F9C4();
  v5(v4);
  return a2;
}

uint64_t sub_10001F630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F698(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_10001F6F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001F740(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C4F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F7A8(uint64_t a1, uint64_t *a2)
{
  sub_1000068D8(a2);
  sub_10000AFB4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10001F7FC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001F834()
{
}

uint64_t sub_10001F83C()
{
  return sub_10001EA60();
}

uint64_t sub_10001F844(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F854()
{
  return swift_release();
}

uint64_t sub_10001F85C()
{
  return swift_slowAlloc();
}

void sub_10001F874(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10001F8C8(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t sub_10001F8FC()
{
  return swift_allocObject();
}

uint64_t sub_10001F914()
{
  return v0;
}

uint64_t sub_10001F948(uint64_t a1, uint64_t a2)
{
  sub_10000E284(a1, a2);
  return sub_100053548();
}

uint64_t sub_10001F970(uint64_t a1)
{
  return sub_100007FE8(a1, 1, v1);
}

uint64_t sub_10001F990(uint64_t a1)
{
  return sub_100008010(v1, 1, 1, a1);
}

uint64_t sub_10001F9B0(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t sub_10001F9C4()
{
  return v0;
}

uint64_t sub_10001F9D8()
{
  *(void *)(v0 - 152) = 1752392040;
  return v0 - 152;
}

void sub_10001F9EC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

float sub_10001FA0C(uint64_t a1, unint64_t a2, float result)
{
  float v3 = 0.0;
  if (a2 - 2 <= 2) {
    float v3 = flt_100055EE0[a2 - 2];
  }
  switch(a1)
  {
    case 0:
    case 1:
      if (a2 == 4) {
        goto LABEL_5;
      }
      break;
    case 2:
      if (a2 == 3) {
        goto LABEL_5;
      }
      break;
    case 3:
      if (a2 < 2) {
        goto LABEL_5;
      }
      break;
    case 4:
      if (a2 == 2)
      {
LABEL_5:
        if (v3 > result) {
          uint64_t result = result + 360.0;
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001FAC0()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_10001FB80()
{
  type metadata accessor for PosterDataCacheManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_100021204();
  qword_100070828 = v0;
  return result;
}

uint64_t sub_10001FBC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000068D8(&qword_10006C5F8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v12[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager____lazy_storage___posterDataURL;
  swift_beginAccess();
  sub_10001F5E0(v9, (uint64_t)v8, &qword_10006C5F8);
  uint64_t v10 = sub_1000068D8((uint64_t *)&unk_10006C558);
  if (sub_100007FE8((uint64_t)v8, 1, v10) != 1) {
    return sub_1000213C8((uint64_t)v8, a1);
  }
  sub_10001F7A8((uint64_t)v8, &qword_10006C5F8);
  sub_10001FD3C(a1);
  sub_10001F5E0(a1, (uint64_t)v6, (uint64_t *)&unk_10006C558);
  sub_100008010((uint64_t)v6, 0, 1, v10);
  swift_beginAccess();
  sub_1000186C8((uint64_t)v6, v9, &qword_10006C5F8);
  return swift_endAccess();
}

uint64_t sub_10001FD3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006C558);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v13 - v6;
  id v8 = [self defaultManager];
  id v9 = [v8 URLsForDirectory:9 inDomains:1];

  uint64_t v10 = sub_100053088();
  sub_100053FC8();

  sub_10003BB24();
  swift_bridgeObjectRelease();
  sub_10001F5E0((uint64_t)v7, (uint64_t)v5, (uint64_t *)&unk_10006C558);
  if (sub_100007FE8((uint64_t)v5, 1, v10) == 1)
  {
    sub_10001F7A8((uint64_t)v7, (uint64_t *)&unk_10006C558);
    sub_10001F7A8((uint64_t)v5, (uint64_t *)&unk_10006C558);
    uint64_t v11 = 1;
  }
  else
  {
    sub_100053048();
    sub_10001F7A8((uint64_t)v7, (uint64_t *)&unk_10006C558);
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v5, v10);
    uint64_t v11 = 0;
  }
  return sub_100008010(a1, v11, 1, v10);
}

uint64_t sub_10001FF1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v5 = sub_10000AFD4(v4);
  uint64_t v6 = __chkstk_darwin(v5);
  id v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v18[-v9];
  uint64_t v11 = v2 + OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager_posterData;
  swift_beginAccess();
  sub_10001F5E0(v11, (uint64_t)v10, (uint64_t *)&unk_10006C4B0);
  uint64_t v12 = type metadata accessor for PosterData(0);
  if (sub_100007FE8((uint64_t)v10, 1, v12) != 1) {
    return sub_100021430((uint64_t)v10, (uint64_t)a1, (void (*)(void))type metadata accessor for PosterData);
  }
  sub_10001F7A8((uint64_t)v10, (uint64_t *)&unk_10006C4B0);
  if (qword_10006BB58 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100053568();
  sub_10000E284(v13, (uint64_t)qword_1000708C8);
  Swift::String v14 = sub_100053548();
  os_log_type_t v15 = sub_100054118();
  if (os_log_type_enabled(v14, v15))
  {
    Swift::String v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Decoding cached poster data from disk", v16, 2u);
    sub_10000E950();
  }

  sub_10002016C(a1);
  sub_100021318((uint64_t)a1, (uint64_t)v8, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010((uint64_t)v8, 0, 1, v12);
  swift_beginAccess();
  sub_1000186C8((uint64_t)v8, v11, (uint64_t *)&unk_10006C4B0);
  return swift_endAccess();
}

uint64_t sub_10002016C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006C558);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100053088();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001FBC0((uint64_t)v4);
  if (sub_100007FE8((uint64_t)v4, 1, v5) == 1)
  {
    sub_10001F7A8((uint64_t)v4, (uint64_t *)&unk_10006C558);
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100053568();
    sub_10000E284(v9, (uint64_t)qword_1000708C8);
    uint64_t v10 = sub_100053548();
    os_log_type_t v11 = sub_1000540F8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to read cached poster data from disk due to missing file path", v12, 2u);
      swift_slowDealloc();
    }

    *a1 = 2;
    type metadata accessor for PosterData(0);
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v13 = sub_100053098();
    unint64_t v15 = v14;
    type metadata accessor for PosterData(0);
    sub_100021490(&qword_10006C600);
    sub_100052F48();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return sub_1000212C0(v13, v15);
  }
}

void sub_100020600(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PosterDataModel(0);
  uint64_t v4 = sub_10000AFD4(v3);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v56 = (uint64_t)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v57 = (uint64_t)&v56 - v7;
  uint64_t v8 = type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v9);
  sub_100019474();
  os_log_type_t v58 = (unsigned __int8 *)(v11 - v10);
  uint64_t v12 = sub_1000068D8((uint64_t *)&unk_10006C558);
  uint64_t v13 = sub_10000AFD4(v12);
  __chkstk_darwin(v13);
  sub_100019474();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_100053088();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_100019474();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v23 = sub_10000AFD4(v22);
  __chkstk_darwin(v23);
  sub_100019474();
  uint64_t v26 = v25 - v24;
  sub_100021318(a1, v25 - v24, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010(v26, 0, 1, v8);
  uint64_t v27 = v1 + OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager_posterData;
  swift_beginAccess();
  sub_1000186C8(v26, v27, (uint64_t *)&unk_10006C4B0);
  swift_endAccess();
  sub_10001FBC0(v16);
  if (sub_100007FE8(v16, 1, v17) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v21, v16, v17);
    sub_100021490(&qword_10006C5F0);
    uint64_t v32 = sub_100052F88();
    unint64_t v34 = v33;
    sub_1000530B8();
    sub_1000212C0(v32, v34);
    uint64_t v36 = v58;
    sub_100021318(a1, (uint64_t)v58, (void (*)(void))type metadata accessor for PosterData);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v38 = v57;
      sub_100021430((uint64_t)v36, v57, (void (*)(void))type metadata accessor for PosterDataModel);
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_100053568();
      sub_10000E284(v39, (uint64_t)qword_1000708C8);
      uint64_t v40 = v56;
      sub_100021318(v38, v56, (void (*)(void))type metadata accessor for PosterDataModel);
      uint64_t v41 = sub_100053548();
      os_log_type_t v42 = sub_100054118();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        v60[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v43 = 141558275;
        os_log_type_t v58 = (unsigned __int8 *)v17;
        uint64_t v59 = 1752392040;
        sub_100054288();
        *(_WORD *)(v43 + 12) = 2081;
        uint64_t v44 = sub_100054218();
        uint64_t v59 = sub_100029610(v44, v45, v60);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_10002136C(v40);
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Successfully saved poster data of type 'data' to disk; location=%{private,mask.hash}s",
          (uint8_t *)v43,
          0x16u);
        swift_arrayDestroy();
        sub_10000E950();
        sub_10000E950();

        sub_10002136C(v57);
        int v46 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        uint64_t v47 = v21;
LABEL_8:
        uint64_t v35 = (uint64_t)v58;
LABEL_10:
        v46(v47, v35);
        return;
      }

      sub_10002136C(v40);
      sub_10002136C(v38);
      int v46 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      uint64_t v47 = v21;
    }
    else
    {
      uint64_t v48 = v21;
      uint64_t v49 = *v36;
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v50 = sub_100053568();
      sub_10000E284(v50, (uint64_t)qword_1000708C8);
      uint64_t v51 = sub_100053548();
      os_log_type_t v52 = sub_100054118();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = 0xD000000000000014;
        unint64_t v54 = (uint8_t *)swift_slowAlloc();
        v60[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v54 = 136446210;
        unint64_t v55 = 0x80000001000572A0;
        os_log_type_t v58 = (unsigned __int8 *)v17;
        switch(v49)
        {
          case 1:
            unint64_t v55 = 0xEE00656E696C6666;
            uint64_t v53 = 0x4F6B726F7774656ELL;
            break;
          case 2:
            unint64_t v55 = 0xE600000000000000;
            uint64_t v53 = 0x617461446F6ELL;
            break;
          case 3:
            unint64_t v55 = 0x80000001000572D0;
            break;
          default:
            break;
        }
        uint64_t v59 = sub_100029610(v53, v55, v60);
        sub_100054288();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Successfully saved poster data of type 'error' to disk; error=%{public}s",
          v54,
          0xCu);
        swift_arrayDestroy();
        sub_10000E950();
        sub_10000E950();

        int v46 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        uint64_t v47 = v48;
        goto LABEL_8;
      }

      int v46 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      uint64_t v47 = v21;
    }
    uint64_t v35 = v17;
    goto LABEL_10;
  }
  sub_10001F7A8(v16, (uint64_t *)&unk_10006C558);
  if (qword_10006BB58 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_100053568();
  sub_10000E284(v28, (uint64_t)qword_1000708C8);
  double v29 = sub_100053548();
  os_log_type_t v30 = sub_1000540F8();
  if (os_log_type_enabled(v29, v30))
  {
    char v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Failed to save poster data to disk due to missing file path", v31, 2u);
    sub_10000E950();
  }
}

uint64_t sub_100020F64()
{
  sub_10001F7A8(v0 + OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager_posterData, (uint64_t *)&unk_10006C4B0);
  swift_release();
  swift_release();
  sub_10001F7A8(v0 + OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager____lazy_storage___posterDataURL, &qword_10006C5F8);
  return v0;
}

uint64_t sub_100020FCC()
{
  sub_100020F64();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100021024()
{
  return type metadata accessor for PosterDataCacheManager();
}

uint64_t type metadata accessor for PosterDataCacheManager()
{
  uint64_t result = qword_10006C540;
  if (!qword_10006C540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100021074()
{
  sub_100021150();
  if (v0 <= 0x3F)
  {
    sub_1000211A8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100021150()
{
  if (!qword_10006C490)
  {
    type metadata accessor for PosterData(255);
    unint64_t v0 = sub_100054278();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C490);
    }
  }
}

void sub_1000211A8()
{
  if (!qword_10006C550)
  {
    sub_10000E47C((uint64_t *)&unk_10006C558);
    unint64_t v0 = sub_100054278();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C550);
    }
  }
}

uint64_t sub_100021204()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PosterData(0);
  sub_1000193D8(v2);
  uint64_t v3 = OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager_decoder;
  sub_100052F68();
  swift_allocObject();
  *(void *)(v0 + v3) = sub_100052F58();
  uint64_t v4 = OBJC_IVAR____TtC13WeatherPoster22PosterDataCacheManager_serializer;
  sub_100052FA8();
  swift_allocObject();
  uint64_t v5 = sub_100052F98();
  sub_100052F78();
  *(void *)(v1 + v4) = v5;
  uint64_t v6 = sub_1000068D8((uint64_t *)&unk_10006C558);
  sub_1000193D8(v6);
  return v1;
}

uint64_t sub_1000212C0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100021318(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  uint64_t v4 = sub_10001F9C4();
  v5(v4);
  return a2;
}

uint64_t sub_10002136C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PosterDataModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000213C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006C558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021430(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_100021490(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PosterData(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000214D4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v5 = swift_unknownObjectRetain();
    sub_100021668(v5, a2);
    uint64_t v6 = self;
    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v8[3] = a1;
    v8[4] = a2;
    v15[4] = sub_1000219B4;
    void v15[5] = v8;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    v15[2] = sub_100017018;
    v15[3] = &unk_100066A30;
    uint64_t v9 = _Block_copy(v15);
    swift_unknownObjectRetain();
    swift_release();
    id v10 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:5.0];
    _Block_release(v9);
    uint64_t v11 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = v10;

    uint64_t ObjectType = swift_getObjectType();
    char v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(a2 + 8))(*(unsigned __int8 *)(v2 + 16), ObjectType, a2);
    swift_unknownObjectRelease();
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

void sub_100021668(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(void, uint64_t, uint64_t))(a2 + 16))(*(unsigned __int8 *)(v2 + 16), ObjectType, a2);
  }
  uint64_t v5 = *(void **)(v2 + 24);
  if (v5)
  {
    [v5 invalidate];
    uint64_t v5 = *(void **)(v2 + 24);
  }
  *(void *)(v2 + 24) = 0;
}

uint64_t sub_1000216EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_100053568();
    sub_10000E284(v8, (uint64_t)qword_1000708C8);
    swift_retain_n();
    uint64_t v9 = sub_100053548();
    os_log_type_t v10 = sub_100054118();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136446210;
      unint64_t v12 = sub_10003A758(*(unsigned char *)(v7 + 16));
      sub_100029610(v12, v13, &v14);
      sub_100054288();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Extended session for %{public}s timed out before its task was completed", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    sub_100021668(a3, a4);
    return swift_release();
  }
  return result;
}

uint64_t sub_1000218E0()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for RenderSessionExtender()
{
  return self;
}

uint64_t sub_10002193C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100021974()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000219B4(uint64_t a1)
{
  return sub_1000216EC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1000219C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000219D0()
{
  return swift_release();
}

uint64_t sub_1000219D8()
{
  sub_100022300();
  uint64_t v0 = sub_100054128();
  if (!v0) {
    return DeviceSupportsVFX();
  }
  uint64_t v1 = (void *)v0;
  NSString v2 = sub_100053EE8();
  id v3 = [v1 stringForKey:v2];

  if (!v3) {
    return DeviceSupportsVFX();
  }
  uint64_t v4 = sub_100053F18();
  uint64_t v6 = v5;

  BOOL v7 = v4 == 7890550 && v6 == 0xE300000000000000;
  if (v7 || (sub_100054508() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v4 == 1633905005 && v6 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  char v10 = sub_100054508();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if ((v10 & 1) == 0) {
    return DeviceSupportsVFX();
  }
  return result;
}

uint64_t sub_100021B20()
{
  char v0 = sub_1000219D8();
  [self setSuppressEngagement:1];
  return v0 & 1;
}

uint64_t sub_100021B64(char a1)
{
  *(unsigned char *)(swift_allocObject() + 16) = a1;
  sub_1000068D8(&qword_10006C6C0);
  swift_allocObject();
  sub_100053808();
  sub_100022374(&qword_10006C6C8);
  sub_100053528();
  return swift_release();
}

uint64_t sub_100021C5C@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  *(unsigned char *)(swift_allocObject() + 16) = a1;
  sub_100053818();
  swift_allocObject();
  sub_100053828();
  *(unsigned char *)(swift_allocObject() + 16) = a1;
  sub_1000537E8();
  swift_allocObject();
  sub_1000537F8();
  uint64_t v4 = sub_100021DA4();
  swift_release();
  uint64_t result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t sub_100021D5C(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t))
{
  id v5 = objc_allocWithZone((Class)a2(0));
  return a3(a1);
}

uint64_t sub_100021DA4()
{
  sub_1000068D8(&qword_10006C6D0);
  sub_1000534F8();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100055DD0;
  sub_100053818();
  sub_1000222B8(&qword_10006C6D8, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  sub_1000534E8();
  sub_1000537E8();
  sub_1000222B8(&qword_10006C6E0, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_1000534E8();
  return v0;
}

uint64_t sub_100021F40@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100021B20();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100021F6C()
{
  return sub_100021B64(*v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100021FFC()
{
  unint64_t result = qword_10006C6B0;
  if (!qword_10006C6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C6B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WeatherPosterExtension(unsigned __int8 *a1, unsigned int a2)
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
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WeatherPosterExtension(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1000221ACLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherPosterExtension()
{
  return &type metadata for WeatherPosterExtension;
}

uint64_t sub_1000221E4()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100022220@<X0>(uint64_t *a1@<X8>)
{
  return sub_100021C5C(*(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_10002222C()
{
  return sub_100021D5C(*(unsigned __int8 *)(v0 + 16), (uint64_t (*)(void))type metadata accessor for PosterRenderer, (uint64_t (*)(uint64_t))sub_100019634);
}

uint64_t sub_100022274()
{
  return sub_100021D5C(*(unsigned __int8 *)(v0 + 16), (uint64_t (*)(void))type metadata accessor for PosterEditor, (uint64_t (*)(uint64_t))sub_10003F738);
}

uint64_t sub_1000222B8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100022300()
{
  unint64_t result = qword_10006C3A0;
  if (!qword_10006C3A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006C3A0);
  }
  return result;
}

uint64_t sub_100022340()
{
  return sub_100022374(&qword_10006C6E8);
}

uint64_t sub_100022374(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000E47C(&qword_10006C6C0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000223BC()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_1000223CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_100053568();
  sub_10000E978();
  uint64_t v76 = v7;
  uint64_t v77 = v8;
  __chkstk_darwin(v7);
  sub_100026F08();
  __chkstk_darwin(v9);
  sub_1000195E0();
  uint64_t v75 = v10;
  sub_100019448();
  __chkstk_darwin(v11);
  uint64_t v81 = (char *)&v73 - v12;
  uint64_t v13 = type metadata accessor for SimulationReason();
  uint64_t v14 = sub_100026EE0(v13);
  uint64_t v84 = v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  sub_1000195E0();
  uint64_t v74 = v19;
  sub_100019448();
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v73 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v73 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v73 - v27;
  double v29 = (uint64_t *)(v2 + 16);
  swift_beginAccess();
  uint64_t v30 = *(void *)(v4 + 16);
  uint64_t v86 = a1;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = sub_100025B44((uint64_t)sub_100026E88, (uint64_t)v85, v30);
  swift_bridgeObjectRelease();
  sub_100026D68(a1, (uint64_t)v26);
  swift_beginAccess();
  uint64_t v83 = v26;
  sub_1000249FC((uint64_t)v28, (uint64_t)v26);
  swift_endAccess();
  uint64_t v82 = v28;
  sub_100023D5C((uint64_t)v28);
  uint64_t v78 = a2;
  if (!a2)
  {
    sub_100053538();
    sub_100026D68(a1, (uint64_t)v18);
    uint64_t v50 = sub_100053548();
    uint64_t v51 = sub_100054118();
    if (os_log_type_enabled(v50, (os_log_type_t)v51))
    {
      os_log_type_t v52 = (uint8_t *)sub_1000194A0();
      v88[0] = sub_100019538();
      *(_DWORD *)os_log_type_t v52 = 136446210;
      uint64_t v53 = sub_10002361C();
      uint64_t v55 = sub_100029610(v53, v54, v88);
      sub_10001F9B0(v55);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100023D5C((uint64_t)v18);
      _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v51, "VFX simulation for '%{public}s' started; Failed to unfreeze scene because manager was nil.",
        v52,
        0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
      sub_100023D5C((uint64_t)v18);
    }

LABEL_27:
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v3, v76);
    return;
  }
  if ((*(unsigned char *)(v4 + 24) & 1) == 0)
  {
    swift_retain();
    uint64_t v56 = v81;
    sub_100053538();
    sub_100026D68(a1, (uint64_t)v23);
    uint64_t v57 = sub_100053548();
    os_log_type_t v58 = sub_100054118();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)sub_1000194A0();
      v88[0] = sub_100019538();
      *(_DWORD *)uint64_t v59 = 136446210;
      uint64_t v60 = sub_10002361C();
      uint64_t v62 = sub_100029610(v60, v61, v88);
      sub_10001F9B0(v62);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100023D5C((uint64_t)v23);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "VFX simulation for '%{public}s' started. Unfreezing the scene to start rendering.", v59, 0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
      sub_100023D5C((uint64_t)v23);
    }

    (*(void (**)(char *, uint64_t))(v77 + 8))(v56, v76);
    *(unsigned char *)(v4 + 24) = 1;
    sub_100053988();
    uint64_t v63 = (void *)sub_1000539B8();
    sub_100053628();
    swift_release();

    return;
  }
  uint64_t v31 = *v29;
  int64_t v32 = *(void *)(*v29 + 16);
  if (!v32)
  {
    swift_retain();
LABEL_24:
    uint64_t v3 = v75;
    sub_100053538();
    uint64_t v64 = v74;
    sub_100026D68(a1, v74);
    swift_bridgeObjectRetain();
    int v65 = sub_100053548();
    os_log_type_t v66 = sub_100054118();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = swift_slowAlloc();
      v88[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v67 = 136446466;
      uint64_t v68 = sub_10002361C();
      uint64_t v87 = sub_100029610(v68, v69, v88);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100023D5C(v64);
      *(_WORD *)(v67 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_100053FD8();
      unint64_t v72 = v71;
      swift_bridgeObjectRelease();
      uint64_t v87 = sub_100029610(v70, v72, v88);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "VFX simulation for '%{public}s' started, and scene was already unfrozen; activeSimulations=%{public}s",
        (uint8_t *)v67,
        0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();

      swift_release();
    }
    else
    {
      swift_release();
      sub_100023D5C(v64);

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_27;
  }
  v88[0] = (uint64_t)&_swiftEmptyArrayStorage;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100026B00(0, v32, 0);
  int64_t v33 = sub_100026CE8(v31);
  int v35 = v34;
  char v37 = v36 & 1;
  uint64_t v80 = a1;
  uint64_t v81 = (char *)(v31 + 56);
  uint64_t v79 = v31;
  while ((v33 & 0x8000000000000000) == 0 && v33 < 1 << *(unsigned char *)(v31 + 32))
  {
    if (((*(void *)&v81[((unint64_t)v33 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v33) & 1) == 0) {
      goto LABEL_29;
    }
    if (*(_DWORD *)(v31 + 36) != v35) {
      goto LABEL_30;
    }
    uint64_t v38 = (uint64_t)v82;
    sub_100026D68(*(void *)(v31 + 48) + *(void *)(v84 + 72) * v33, (uint64_t)v82);
    uint64_t v39 = (uint64_t)v83;
    sub_100026DCC(v38, (uint64_t)v83);
    uint64_t v40 = sub_10002361C();
    uint64_t v42 = v41;
    sub_100023D5C(v39);
    uint64_t v43 = v88[0];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100026B00(0, *(void *)(v43 + 16) + 1, 1);
      uint64_t v43 = v88[0];
    }
    unint64_t v45 = *(void *)(v43 + 16);
    unint64_t v44 = *(void *)(v43 + 24);
    if (v45 >= v44 >> 1)
    {
      sub_100026B00((char *)(v44 > 1), v45 + 1, 1);
      uint64_t v43 = v88[0];
    }
    *(void *)(v43 + 16) = v45 + 1;
    uint64_t v46 = v43 + 16 * v45;
    *(void *)(v46 + 32) = v40;
    *(void *)(v46 + 40) = v42;
    uint64_t v31 = v79;
    int64_t v47 = sub_100026C04(v33, v35, v37 & 1, v79);
    int64_t v33 = v47;
    int v35 = v48;
    char v37 = v49 & 1;
    --v32;
    a1 = v80;
    if (!v32)
    {
      sub_100026E30(v47, v48, v49 & 1);
      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
}

uint64_t sub_100022BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  uint64_t v9 = type metadata accessor for SimulationReason();
  uint64_t v10 = sub_100026EE0(v9);
  uint64_t v86 = v11;
  __chkstk_darwin(v10);
  sub_10000AFF8();
  uint64_t v77 = v12;
  sub_100019448();
  __chkstk_darwin(v13);
  sub_1000195E0();
  uint64_t v85 = v14;
  sub_100019448();
  __chkstk_darwin(v15);
  sub_1000195E0();
  uint64_t v84 = v16;
  sub_100019448();
  __chkstk_darwin(v17);
  sub_100026FA0();
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v77 - v19;
  sub_100053568();
  sub_10000E978();
  uint64_t v79 = v21;
  uint64_t v80 = v22;
  __chkstk_darwin(v21);
  sub_10000AFF8();
  uint64_t v78 = v23;
  sub_100019448();
  __chkstk_darwin(v24);
  sub_100026FB4();
  __chkstk_darwin(v25);
  sub_100026F64();
  uint64_t v26 = sub_1000068D8(&qword_10006C310);
  __chkstk_darwin(v26 - 8);
  sub_100019474();
  uint64_t v29 = v28 - v27;
  swift_beginAccess();
  uint64_t v81 = a1;
  sub_100026470(a1, v29);
  swift_endAccess();
  sub_10001F7A8(v29, &qword_10006C310);
  uint64_t v30 = *(void *)(v3 + 16);
  int64_t v31 = *(void *)(v30 + 16);
  if (v31)
  {
    v88[0] = (uint64_t)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100026B00(0, v31, 0);
    uint64_t result = sub_100026CE8(v30);
    uint64_t v33 = result;
    int v35 = v34;
    uint64_t v82 = v30;
    uint64_t v83 = v30 + 56;
    do
    {
      if (v33 < 0 || v33 >= 1 << *(unsigned char *)(v30 + 32))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        return result;
      }
      if (((*(void *)(v83 + (((unint64_t)v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v33) & 1) == 0) {
        goto LABEL_26;
      }
      if (*(_DWORD *)(v30 + 36) != v35) {
        goto LABEL_27;
      }
      uint64_t v36 = v84;
      sub_100026D68(*(void *)(v30 + 48) + *(void *)(v86 + 72) * v33, v84);
      uint64_t v37 = v36;
      uint64_t v38 = v85;
      sub_100026DCC(v37, v85);
      uint64_t v39 = sub_10002361C();
      uint64_t v41 = v40;
      sub_100023D5C(v38);
      uint64_t v42 = v88[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100026B00(0, *(void *)(v42 + 16) + 1, 1);
        uint64_t v42 = v88[0];
      }
      unint64_t v44 = *(void *)(v42 + 16);
      unint64_t v43 = *(void *)(v42 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_100026B00((char *)(v43 > 1), v44 + 1, 1);
        uint64_t v42 = v88[0];
      }
      *(void *)(v42 + 16) = v44 + 1;
      uint64_t v45 = v42 + 16 * v44;
      *(void *)(v45 + 32) = v39;
      *(void *)(v45 + 40) = v41;
      int64_t v46 = sub_100026FC8();
      uint64_t v30 = v82;
      uint64_t result = sub_100026C04(v46, v47, v48, v82);
      uint64_t v33 = result;
      int v35 = v49;
      char v51 = v50 & 1;
      --v31;
    }
    while (v31);
    uint64_t v52 = sub_100026FC8();
    sub_100026E30(v52, v53, v51);
    swift_bridgeObjectRelease();
    uint64_t v54 = v78;
    sub_100053538();
    uint64_t v55 = v77;
    sub_100026D68(v81, v77);
    swift_retain();
    uint64_t v56 = sub_100053548();
    os_log_type_t v57 = sub_100054118();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = swift_slowAlloc();
      v88[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v58 = 136446466;
      uint64_t v59 = sub_10002361C();
      uint64_t v87 = sub_100029610(v59, v60, v88);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100023D5C(v55);
      *(_WORD *)(v58 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_100053FD8();
      unint64_t v63 = v62;
      swift_release();
      uint64_t v87 = sub_100029610(v61, v63, v88);
      sub_100054288();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "VFX simulation for '%{public}s' ended; Remaining simulations = %{public}s",
        (uint8_t *)v58,
        0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
      sub_100023D5C(v55);

      swift_release_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 8))(v54, v79);
  }
  else if (a2)
  {
    swift_retain();
    sub_100053538();
    sub_100026D68(v81, (uint64_t)v20);
    uint64_t v64 = sub_100053548();
    os_log_type_t v65 = sub_100054118();
    if (os_log_type_enabled(v64, v65))
    {
      os_log_type_t v66 = (uint8_t *)sub_1000194A0();
      v88[0] = sub_100019538();
      *(_DWORD *)os_log_type_t v66 = 136446210;
      uint64_t v86 = v3;
      uint64_t v67 = sub_10002361C();
      uint64_t v69 = sub_100029610(v67, v68, v88);
      sub_100026F4C(v69);
      uint64_t v6 = v86;
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100023D5C((uint64_t)v20);
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "VFX simulation for '%{public}s' ended; Freezing scene as no simulations remain.",
        v66,
        0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
      sub_100023D5C((uint64_t)v20);
    }

    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v5, v79);
    *(unsigned char *)(v6 + 24) = 0;
    uint64_t v76 = (void *)sub_1000539B8();
    sub_100053628();

    sub_100053948();
    return swift_release();
  }
  else
  {
    sub_100053538();
    sub_100026D68(v81, v4);
    uint64_t v70 = sub_100053548();
    os_log_type_t v71 = sub_1000540F8();
    if (os_log_type_enabled(v70, v71))
    {
      unint64_t v72 = (uint8_t *)sub_1000194A0();
      v88[0] = sub_100019538();
      *(_DWORD *)unint64_t v72 = 136446210;
      uint64_t v73 = sub_10002361C();
      uint64_t v75 = sub_100029610(v73, v74, v88);
      sub_100026F4C(v75);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100023D5C(v4);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "VFX simulation for '%{public}s' ended; Failed to freeze scene because manager was nil.",
        v72,
        0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
      sub_100023D5C(v4);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 8))(v2, v79);
  }
}

uint64_t sub_100023328()
{
  *(unsigned char *)(v0 + 24) = 0;
  swift_beginAccess();
  *(void *)(v0 + 16) = &_swiftEmptySetSingleton;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100023370(uint64_t a1)
{
  uint64_t v4 = v1;
  type metadata accessor for SimulationReason();
  sub_10000AFB4();
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  sub_100026FA0();
  __chkstk_darwin(v10);
  sub_100026F64();
  uint64_t v11 = sub_1000068D8(&qword_10006C868);
  __chkstk_darwin(v11 - 8);
  sub_100019474();
  uint64_t v14 = v13 - v12;
  uint64_t v16 = v13 - v12 + *(int *)(v15 + 56);
  sub_100026D68(v4, v13 - v12);
  sub_100026D68(a1, v16);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100026D68(v14, v2);
      int v21 = sub_100026FEC();
      uint64_t v22 = sub_1000531C8();
      sub_10000AFB4();
      uint64_t v24 = *(void (**)(void))(v23 + 8);
      if (v21 == 1) {
        goto LABEL_7;
      }
      uint64_t v29 = (char *)v2;
      goto LABEL_12;
    case 2u:
      uint64_t v25 = sub_100026FC8();
      sub_100026D68(v25, v26);
      int v27 = sub_100026FEC();
      uint64_t v22 = sub_1000531C8();
      sub_10000AFB4();
      uint64_t v24 = *(void (**)(void))(v28 + 8);
      if (v27 == 2)
      {
LABEL_7:
        sub_100026EF8();
        v24();
        sub_100026EF8();
        v24();
        goto LABEL_15;
      }
      uint64_t v29 = v9;
LABEL_12:
      ((void (*)(char *, uint64_t))v24)(v29, v22);
      goto LABEL_13;
    case 3u:
      if (sub_100026FEC() == 3) {
        goto LABEL_15;
      }
      goto LABEL_13;
    default:
      sub_100026D68(v14, v3);
      int v17 = sub_100026FEC();
      uint64_t v18 = sub_1000531C8();
      sub_10000AFB4();
      uint64_t v20 = *(void (**)(void))(v19 + 8);
      if (v17)
      {
        sub_100026EF8();
        v20();
LABEL_13:
        sub_10001F7A8(v14, &qword_10006C868);
        return 0;
      }
      else
      {
        sub_100026EF8();
        v20();
        ((void (*)(uint64_t, uint64_t))v20)(v3, v18);
LABEL_15:
        sub_100023D5C(v14);
        return 1;
      }
  }
}

uint64_t sub_10002361C()
{
  uint64_t v3 = sub_1000531C8();
  sub_10000E978();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100026F24();
  sub_10000AFB4();
  __chkstk_darwin(v7);
  sub_100026F74();
  sub_100026D68(v0, v2);
  uint64_t v8 = 0x6F6974616D696E61;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v12 = sub_100026EC4();
      v13(v12);
      uint64_t v11 = 0x6B636F6C6E75;
      goto LABEL_4;
    case 2u:
      uint64_t v14 = sub_100026EC4();
      v15(v14);
      uint64_t v17 = 0x6E6F697461746F72;
      goto LABEL_6;
    case 3u:
      return v8;
    default:
      uint64_t v9 = sub_100026EC4();
      v10(v9);
      uint64_t v11 = 0x7265646E6572;
LABEL_4:
      uint64_t v17 = v11 & 0xFFFFFFFFFFFFLL | 0x28000000000000;
LABEL_6:
      sub_100026E40(&qword_10006C848, (void (*)(uint64_t))&type metadata accessor for UUID);
      v18._countAndFlagsBits = sub_1000544E8();
      sub_100053F58(v18);
      swift_bridgeObjectRelease();
      v19._countAndFlagsBits = 41;
      v19._object = (void *)0xE100000000000000;
      sub_100053F58(v19);
      uint64_t v8 = v17;
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
      return v8;
  }
}

uint64_t sub_10002381C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 25, 7);
}

uint64_t type metadata accessor for VFXSimulationManager()
{
  return self;
}

uint64_t *sub_100023878(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_1000531C8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100023A18(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 2)
  {
    uint64_t v3 = sub_1000531C8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_100023A94(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_1000531C8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100023BF0(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100023D5C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_1000531C8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100023D5C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SimulationReason();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SimulationReason()
{
  uint64_t result = qword_10006C808;
  if (!qword_10006C808) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_100023E00(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_1000531C8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100023F5C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100023D5C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_1000531C8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1000240D4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000240E4()
{
  uint64_t result = sub_1000531C8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_100024170()
{
  return sub_100026E40(&qword_10006C840, (void (*)(uint64_t))type metadata accessor for SimulationReason);
}

uint64_t sub_1000241B8(uint64_t a1, uint64_t a2)
{
  sub_1000531C8();
  sub_10000E978();
  uint64_t v39 = v8;
  uint64_t v40 = v7;
  __chkstk_darwin(v7);
  sub_10000AFF8();
  uint64_t v38 = v9;
  sub_100019448();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v37 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v37 - v14;
  type metadata accessor for SimulationReason();
  sub_10000AFB4();
  __chkstk_darwin(v16);
  sub_100026F08();
  __chkstk_darwin(v17);
  sub_100026FB4();
  __chkstk_darwin(v18);
  sub_100026F64();
  uint64_t v19 = sub_1000068D8(&qword_10006C868);
  __chkstk_darwin(v19 - 8);
  sub_100019474();
  uint64_t v22 = v21 - v20;
  uint64_t v24 = v21 - v20 + *(int *)(v23 + 56);
  sub_100026D68(a1, v21 - v20);
  sub_100026D68(a2, v24);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100026D68(v22, v2);
      if (sub_100026FD4() == 1)
      {
        uint64_t v26 = v39;
        uint64_t v25 = v40;
        (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v13, v24, v40);
        sub_100026FC8();
        char v27 = sub_1000531A8();
        uint64_t v28 = *(void (**)(char *, uint64_t))(v26 + 8);
        v28(v13, v25);
        v28((char *)v2, v25);
        goto LABEL_14;
      }
      uint64_t v4 = v2;
      goto LABEL_11;
    case 2u:
      sub_100026D68(v22, v4);
      if (sub_100026FD4() != 2) {
        goto LABEL_11;
      }
      uint64_t v30 = v38;
      uint64_t v29 = v39;
      uint64_t v31 = v40;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v38, v24, v40);
      char v27 = sub_1000531A8();
      int64_t v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v32(v30, v31);
      v32(v4, v31);
      goto LABEL_14;
    case 3u:
      if (sub_100026FD4() != 3) {
        goto LABEL_12;
      }
      sub_100023D5C(v22);
      char v27 = 1;
      return v27 & 1;
    default:
      sub_100026D68(v22, v3);
      if (sub_100026FD4())
      {
        uint64_t v4 = v3;
LABEL_11:
        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v4, v40);
LABEL_12:
        sub_10001F7A8(v22, &qword_10006C868);
        char v27 = 0;
      }
      else
      {
        uint64_t v34 = v39;
        uint64_t v33 = v40;
        (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v15, v24, v40);
        char v27 = sub_1000531A8();
        int v35 = *(void (**)(char *, uint64_t))(v34 + 8);
        v35(v15, v33);
        v35((char *)v3, v33);
LABEL_14:
        sub_100023D5C(v22);
      }
      return v27 & 1;
  }
}

void sub_100024550()
{
  uint64_t v3 = sub_1000531C8();
  sub_10000E978();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100026F24();
  sub_10000AFB4();
  __chkstk_darwin(v7);
  sub_100026F74();
  sub_100026D68(v0, v2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v13 = sub_100026EC4();
      v14(v13);
      Swift::UInt v10 = 2;
      goto LABEL_6;
    case 2u:
      uint64_t v11 = sub_100026EC4();
      v12(v11);
      Swift::UInt v10 = 3;
      goto LABEL_6;
    case 3u:
      sub_1000545C8(0);
      return;
    default:
      uint64_t v8 = sub_100026EC4();
      v9(v8);
      Swift::UInt v10 = 1;
LABEL_6:
      sub_1000545C8(v10);
      sub_100026E40(&qword_10006C858, (void (*)(uint64_t))&type metadata accessor for UUID);
      sub_100053EC8();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
      return;
  }
}

Swift::Int sub_1000246F0()
{
  return sub_1000545D8();
}

Swift::Int sub_10002473C()
{
  return sub_1000545D8();
}

char *sub_100024778(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100054428();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_10002480C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_100054428();
    __break(1u);
  }
  else if (a3 < a1 {
         || (type metadata accessor for PosterDataModel.DataPoint(0),
  }
             sub_10000AFB4(),
             a1 + *(void *)(v6 + 72) * a2 <= a3))
  {
    type metadata accessor for PosterDataModel.DataPoint(0);
    sub_100026F8C();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    sub_100026F8C();
    swift_arrayInitWithTakeBackToFront();
  }
}

uint64_t sub_10002491C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100054428();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1000249FC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = v2;
  uint64_t v6 = type metadata accessor for SimulationReason();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1000545B8();
  swift_bridgeObjectRetain();
  sub_100024550();
  Swift::Int v11 = sub_1000545D8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v19 = a1;
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v7 + 72);
    while (1)
    {
      sub_100026D68(*(void *)(v10 + 48) + v15 * v13, (uint64_t)v9);
      char v16 = sub_1000241B8((uint64_t)v9, a2);
      sub_100023D5C((uint64_t)v9);
      if (v16) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
      if (((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a1 = v19;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    sub_100023D5C(a2);
    sub_100026D68(*(void *)(*v3 + 48) + v15 * v13, v19);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100026D68(a2, (uint64_t)v9);
    uint64_t v20 = *v3;
    *BOOL v3 = 0x8000000000000000;
    sub_10002518C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *BOOL v3 = v20;
    swift_bridgeObjectRelease();
    sub_100026DCC(a2, a1);
    return 1;
  }
}

uint64_t sub_100024C08()
{
  uint64_t v1 = v0;
  uint64_t v52 = sub_1000531C8();
  uint64_t v2 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  char v51 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SimulationReason();
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v45 - v8;
  uint64_t v10 = *v0;
  sub_1000068D8(&qword_10006C860);
  uint64_t v11 = sub_1000542E8();
  uint64_t v12 = v11;
  if (*(void *)(v10 + 16))
  {
    uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
    uint64_t v14 = *(void *)(v10 + 56);
    int v47 = (void *)(v10 + 56);
    if (v13 < 64) {
      uint64_t v15 = ~(-1 << v13);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & v14;
    uint64_t v45 = v0;
    int64_t v46 = (unint64_t)(v13 + 63) >> 6;
    char v48 = (void (**)(char *, uint64_t))(v2 + 8);
    int v49 = (void (**)(char *, char *, uint64_t))(v2 + 32);
    uint64_t v17 = v11 + 56;
    swift_retain();
    int64_t v18 = 0;
    char v50 = v7;
    if (!v16) {
      goto LABEL_7;
    }
    while (2)
    {
      unint64_t v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v20 = v19 | (v18 << 6);
LABEL_21:
      uint64_t v24 = v10;
      uint64_t v25 = *(void *)(v10 + 48);
      uint64_t v26 = *(void *)(v53 + 72);
      sub_100026DCC(v25 + v26 * v20, (uint64_t)v9);
      sub_1000545B8();
      sub_100026D68((uint64_t)v9, (uint64_t)v7);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          char v27 = v51;
          uint64_t v31 = v7;
          uint64_t v29 = v52;
          (*v49)(v51, v31, v52);
          Swift::UInt v30 = 2;
          goto LABEL_25;
        case 2u:
          char v27 = v51;
          int64_t v32 = v7;
          uint64_t v29 = v52;
          (*v49)(v51, v32, v52);
          Swift::UInt v30 = 3;
          goto LABEL_25;
        case 3u:
          sub_1000545C8(0);
          goto LABEL_27;
        default:
          char v27 = v51;
          uint64_t v28 = v7;
          uint64_t v29 = v52;
          (*v49)(v51, v28, v52);
          Swift::UInt v30 = 1;
LABEL_25:
          sub_1000545C8(v30);
          sub_100026E40(&qword_10006C858, (void (*)(uint64_t))&type metadata accessor for UUID);
          sub_100053EC8();
          uint64_t v33 = v29;
          uint64_t v7 = v50;
          (*v48)(v27, v33);
LABEL_27:
          Swift::Int v34 = sub_1000545D8();
          uint64_t v35 = -1 << *(unsigned char *)(v12 + 32);
          unint64_t v36 = v34 & ~v35;
          unint64_t v37 = v36 >> 6;
          if (((-1 << v36) & ~*(void *)(v17 + 8 * (v36 >> 6))) != 0)
          {
            unint64_t v38 = __clz(__rbit64((-1 << v36) & ~*(void *)(v17 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
            goto LABEL_36;
          }
          char v39 = 0;
          unint64_t v40 = (unint64_t)(63 - v35) >> 6;
          break;
      }
      do
      {
        if (++v37 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
        BOOL v41 = v37 == v40;
        if (v37 == v40) {
          unint64_t v37 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v17 + 8 * v37);
      }
      while (v42 == -1);
      unint64_t v38 = __clz(__rbit64(~v42)) + (v37 << 6);
LABEL_36:
      *(void *)(v17 + ((v38 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v38;
      sub_100026DCC((uint64_t)v9, *(void *)(v12 + 48) + v38 * v26);
      ++*(void *)(v12 + 16);
      uint64_t v10 = v24;
      if (v16) {
        continue;
      }
      break;
    }
LABEL_7:
    int64_t v21 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_44;
    }
    if (v21 < v46)
    {
      unint64_t v22 = v47[v21];
      ++v18;
      if (v22) {
        goto LABEL_20;
      }
      int64_t v18 = v21 + 1;
      if (v21 + 1 < v46)
      {
        unint64_t v22 = v47[v18];
        if (v22) {
          goto LABEL_20;
        }
        int64_t v18 = v21 + 2;
        if (v21 + 2 < v46)
        {
          unint64_t v22 = v47[v18];
          if (v22) {
            goto LABEL_20;
          }
          int64_t v23 = v21 + 3;
          if (v23 < v46)
          {
            unint64_t v22 = v47[v23];
            if (v22)
            {
              int64_t v18 = v23;
LABEL_20:
              unint64_t v16 = (v22 - 1) & v22;
              unint64_t v20 = __clz(__rbit64(v22)) + (v18 << 6);
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v18 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                break;
              }
              if (v18 >= v46) {
                goto LABEL_38;
              }
              unint64_t v22 = v47[v18];
              ++v23;
              if (v22) {
                goto LABEL_20;
              }
            }
LABEL_45:
            __break(1u);
            JUMPOUT(0x10002517CLL);
          }
        }
      }
    }
LABEL_38:
    swift_release();
    uint64_t v1 = v45;
    uint64_t v43 = 1 << *(unsigned char *)(v10 + 32);
    if (v43 > 63) {
      sub_1000253A0(0, (unint64_t)(v43 + 63) >> 6, v47);
    }
    else {
      void *v47 = -1 << v43;
    }
    *(void *)(v10 + 16) = 0;
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v12;
  return result;
}

uint64_t sub_10002518C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for SimulationReason();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0)
  {
LABEL_13:
    uint64_t v14 = v9;
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100024C08();
    goto LABEL_8;
  }
  if (v13 <= v12)
  {
    sub_1000255F8();
LABEL_8:
    uint64_t v15 = *v4;
    sub_1000545B8();
    sub_100024550();
    Swift::Int v16 = sub_1000545D8();
    uint64_t v17 = -1 << *(unsigned char *)(v15 + 32);
    a2 = v16 & ~v17;
    if ((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v26 = v8;
      uint64_t v18 = ~v17;
      uint64_t v14 = v9;
      uint64_t v19 = *(void *)(v9 + 72);
      while (1)
      {
        sub_100026D68(*(void *)(v15 + 48) + v19 * a2, (uint64_t)v11);
        char v20 = sub_1000241B8((uint64_t)v11, a1);
        sub_100023D5C((uint64_t)v11);
        if (v20) {
          goto LABEL_17;
        }
        a2 = (a2 + 1) & v18;
        if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t v14 = v9;
  sub_1000253BC();
LABEL_14:
  uint64_t v21 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_100026DCC(a1, *(void *)(v21 + 48) + *(void *)(v14 + 72) * a2);
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (!v24)
  {
    *(void *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_100054548();
  __break(1u);
  return result;
}

uint64_t sub_1000253A0(uint64_t result, uint64_t a2, void *a3)
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

void *sub_1000253BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SimulationReason();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000068D8(&qword_10006C860);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1000542D8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v15 = *(void *)(v6 + 56);
  uint64_t v16 = -1;
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  unint64_t v17 = v16 & v15;
  int64_t v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v19 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    unint64_t v24 = *(void *)(v3 + 72) * i;
    sub_100026D68(*(void *)(v6 + 48) + v24, (uint64_t)v5);
    uint64_t result = (void *)sub_100026DCC((uint64_t)v5, *(void *)(v8 + 48) + v24);
    if (v17) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v18) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v18) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v10 + 8 * v13);
      if (!v22)
      {
        int64_t v13 = v21 + 2;
        if (v21 + 2 >= v18) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v10 + 8 * v13);
        if (!v22) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v17 = (v22 - 1) & v22;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v18) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v10 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v18) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000255F8()
{
  uint64_t v1 = v0;
  uint64_t v51 = sub_1000531C8();
  uint64_t v2 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  char v50 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SimulationReason();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = *v0;
  sub_1000068D8(&qword_10006C860);
  uint64_t v11 = sub_1000542E8();
  uint64_t v12 = v11;
  if (*(void *)(v10 + 16))
  {
    uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
    uint64_t v14 = *(void *)(v10 + 56);
    unint64_t v44 = v0;
    uint64_t v45 = v10 + 56;
    if (v13 < 64) {
      uint64_t v15 = ~(-1 << v13);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & v14;
    char v48 = (void (**)(char *, char *, uint64_t))(v2 + 32);
    int64_t v46 = (unint64_t)(v13 + 63) >> 6;
    int v47 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v17 = v11 + 56;
    swift_retain();
    int64_t v18 = 0;
    int v49 = v7;
    if (!v16) {
      goto LABEL_7;
    }
    while (2)
    {
      unint64_t v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v20 = v19 | (v18 << 6);
LABEL_21:
      uint64_t v24 = v10;
      uint64_t v25 = *(void *)(v10 + 48);
      uint64_t v26 = *(void *)(v52 + 72);
      sub_100026D68(v25 + v26 * v20, (uint64_t)v9);
      sub_1000545B8();
      sub_100026D68((uint64_t)v9, (uint64_t)v7);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          char v27 = v50;
          uint64_t v31 = v7;
          uint64_t v29 = v51;
          (*v48)(v50, v31, v51);
          Swift::UInt v30 = 2;
          goto LABEL_25;
        case 2u:
          char v27 = v50;
          int64_t v32 = v7;
          uint64_t v29 = v51;
          (*v48)(v50, v32, v51);
          Swift::UInt v30 = 3;
          goto LABEL_25;
        case 3u:
          sub_1000545C8(0);
          goto LABEL_27;
        default:
          char v27 = v50;
          uint64_t v28 = v7;
          uint64_t v29 = v51;
          (*v48)(v50, v28, v51);
          Swift::UInt v30 = 1;
LABEL_25:
          sub_1000545C8(v30);
          sub_100026E40(&qword_10006C858, (void (*)(uint64_t))&type metadata accessor for UUID);
          sub_100053EC8();
          uint64_t v33 = v29;
          uint64_t v7 = v49;
          (*v47)(v27, v33);
LABEL_27:
          Swift::Int v34 = sub_1000545D8();
          uint64_t v35 = -1 << *(unsigned char *)(v12 + 32);
          unint64_t v36 = v34 & ~v35;
          unint64_t v37 = v36 >> 6;
          if (((-1 << v36) & ~*(void *)(v17 + 8 * (v36 >> 6))) != 0)
          {
            unint64_t v38 = __clz(__rbit64((-1 << v36) & ~*(void *)(v17 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
            goto LABEL_36;
          }
          char v39 = 0;
          unint64_t v40 = (unint64_t)(63 - v35) >> 6;
          break;
      }
      do
      {
        if (++v37 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
        BOOL v41 = v37 == v40;
        if (v37 == v40) {
          unint64_t v37 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v17 + 8 * v37);
      }
      while (v42 == -1);
      unint64_t v38 = __clz(__rbit64(~v42)) + (v37 << 6);
LABEL_36:
      *(void *)(v17 + ((v38 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v38;
      sub_100026DCC((uint64_t)v9, *(void *)(v12 + 48) + v38 * v26);
      ++*(void *)(v12 + 16);
      uint64_t v10 = v24;
      if (v16) {
        continue;
      }
      break;
    }
LABEL_7:
    int64_t v21 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_42;
    }
    if (v21 < v46)
    {
      unint64_t v22 = *(void *)(v45 + 8 * v21);
      ++v18;
      if (v22) {
        goto LABEL_20;
      }
      int64_t v18 = v21 + 1;
      if (v21 + 1 < v46)
      {
        unint64_t v22 = *(void *)(v45 + 8 * v18);
        if (v22) {
          goto LABEL_20;
        }
        int64_t v18 = v21 + 2;
        if (v21 + 2 < v46)
        {
          unint64_t v22 = *(void *)(v45 + 8 * v18);
          if (v22) {
            goto LABEL_20;
          }
          int64_t v23 = v21 + 3;
          if (v23 < v46)
          {
            unint64_t v22 = *(void *)(v45 + 8 * v23);
            if (v22)
            {
              int64_t v18 = v23;
LABEL_20:
              unint64_t v16 = (v22 - 1) & v22;
              unint64_t v20 = __clz(__rbit64(v22)) + (v18 << 6);
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v18 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                break;
              }
              if (v18 >= v46) {
                goto LABEL_38;
              }
              unint64_t v22 = *(void *)(v45 + 8 * v18);
              ++v23;
              if (v22) {
                goto LABEL_20;
              }
            }
LABEL_43:
            __break(1u);
            JUMPOUT(0x100025B34);
          }
        }
      }
    }
LABEL_38:
    uint64_t result = swift_release_n();
    uint64_t v1 = v44;
  }
  else
  {
    uint64_t result = swift_release();
  }
  *uint64_t v1 = v12;
  return result;
}

void *sub_100025B44(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t (*)(char *))isStackAllocationSafe;
  char v6 = *(unsigned char *)(a3 + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v8 = (unint64_t *)((char *)&v12 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1000253A0(0, v7, v8);
    uint64_t v9 = sub_100025CD4(v8, v7, a3, v5);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v10 = (unint64_t *)swift_slowAlloc();
    sub_1000253A0(0, v7, v10);
    uint64_t v9 = sub_100025CD4(v10, v7, a3, v5);
    swift_release();
    swift_slowDealloc();
  }
  return v9;
}

void *sub_100025CD4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  uint64_t v31 = a4;
  uint64_t v26 = a2;
  char v27 = a1;
  uint64_t v6 = type metadata accessor for SimulationReason();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = (void *)__chkstk_darwin(v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = 0;
  uint64_t v12 = a3;
  uint64_t v13 = *(void *)(a3 + 56);
  uint64_t v28 = 0;
  uint64_t v29 = a3 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v30 = (unint64_t)(v14 + 63) >> 6;
  while (v16)
  {
    unint64_t v17 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v18 = v17 | (v11 << 6);
LABEL_17:
    sub_100026D68(*(void *)(v12 + 48) + *(void *)(v7 + 72) * v18, (uint64_t)v10);
    char v22 = v31(v10);
    uint64_t result = (void *)sub_100023D5C((uint64_t)v10);
    if (v4) {
      return result;
    }
    if (v22)
    {
      *(unint64_t *)((char *)v27 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      BOOL v19 = __OFADD__(v28++, 1);
      if (v19) {
        goto LABEL_30;
      }
    }
  }
  BOOL v19 = __OFADD__(v11++, 1);
  if (v19)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v30) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v29 + 8 * v11);
  if (v20)
  {
LABEL_16:
    unint64_t v16 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v11 << 6);
    goto LABEL_17;
  }
  int64_t v21 = v11 + 1;
  if (v11 + 1 >= v30) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v29 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v11 + 2;
  if (v11 + 2 >= v30) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v29 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v11 + 3;
  if (v11 + 3 >= v30)
  {
LABEL_27:
    uint64_t v23 = v26;
    uint64_t v24 = v28;
    swift_retain();
    return sub_100025F54(v27, v23, v24, v12);
  }
  unint64_t v20 = *(void *)(v29 + 8 * v21);
  if (v20)
  {
LABEL_15:
    int64_t v11 = v21;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v30) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v29 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100025F54(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v49 = a1;
  uint64_t v51 = sub_1000531C8();
  uint64_t v7 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  char v50 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SimulationReason();
  uint64_t v53 = *(void *)(v9 - 8);
  uint64_t v54 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v45 - v13;
  if (a3)
  {
    if (*(void *)(a4 + 16) != a3)
    {
      sub_1000068D8(&qword_10006C860);
      uint64_t v16 = sub_1000542F8();
      uint64_t v15 = v16;
      uint64_t v45 = a2;
      if (a2 < 1) {
        unint64_t v17 = 0;
      }
      else {
        unint64_t v17 = *v49;
      }
      uint64_t v18 = 0;
      int64_t v46 = (void (**)(char *, uint64_t))(v7 + 8);
      int v47 = (void (**)(char *, char *, uint64_t))(v7 + 32);
      uint64_t v19 = v16 + 56;
      char v48 = v12;
      uint64_t v52 = a4;
      while (1)
      {
        if (v17)
        {
          unint64_t v20 = __clz(__rbit64(v17));
          v17 &= v17 - 1;
          unint64_t v21 = v20 | (v18 << 6);
        }
        else
        {
          uint64_t v22 = v18 + 1;
          if (__OFADD__(v18, 1)) {
            goto LABEL_46;
          }
          if (v22 >= v45) {
            goto LABEL_42;
          }
          unint64_t v23 = v49[v22];
          ++v18;
          if (!v23)
          {
            uint64_t v18 = v22 + 1;
            if (v22 + 1 >= v45) {
              goto LABEL_42;
            }
            unint64_t v23 = v49[v18];
            if (!v23)
            {
              uint64_t v18 = v22 + 2;
              if (v22 + 2 >= v45) {
                goto LABEL_42;
              }
              unint64_t v23 = v49[v18];
              if (!v23)
              {
                uint64_t v24 = v22 + 3;
                if (v24 >= v45) {
                  goto LABEL_42;
                }
                unint64_t v23 = v49[v24];
                if (!v23)
                {
                  while (1)
                  {
                    uint64_t v18 = v24 + 1;
                    if (__OFADD__(v24, 1)) {
                      goto LABEL_47;
                    }
                    if (v18 >= v45) {
                      goto LABEL_42;
                    }
                    unint64_t v23 = v49[v18];
                    ++v24;
                    if (v23) {
                      goto LABEL_24;
                    }
                  }
                }
                uint64_t v18 = v24;
              }
            }
          }
LABEL_24:
          unint64_t v17 = (v23 - 1) & v23;
          unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
        }
        uint64_t v25 = *(void *)(a4 + 48);
        uint64_t v26 = *(void *)(v53 + 72);
        sub_100026D68(v25 + v26 * v21, (uint64_t)v14);
        sub_1000545B8();
        sub_100026D68((uint64_t)v14, (uint64_t)v12);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            char v27 = v50;
            uint64_t v31 = v12;
            uint64_t v29 = v51;
            (*v47)(v50, v31, v51);
            Swift::UInt v30 = 2;
            goto LABEL_29;
          case 2u:
            char v27 = v50;
            int64_t v32 = v12;
            uint64_t v29 = v51;
            (*v47)(v50, v32, v51);
            Swift::UInt v30 = 3;
            goto LABEL_29;
          case 3u:
            sub_1000545C8(0);
            goto LABEL_31;
          default:
            char v27 = v50;
            uint64_t v28 = v12;
            uint64_t v29 = v51;
            (*v47)(v50, v28, v51);
            Swift::UInt v30 = 1;
LABEL_29:
            sub_1000545C8(v30);
            sub_100026E40(&qword_10006C858, (void (*)(uint64_t))&type metadata accessor for UUID);
            sub_100053EC8();
            uint64_t v33 = v29;
            uint64_t v12 = v48;
            (*v46)(v27, v33);
LABEL_31:
            Swift::Int v34 = sub_1000545D8();
            uint64_t v35 = -1 << *(unsigned char *)(v15 + 32);
            unint64_t v36 = v34 & ~v35;
            unint64_t v37 = v36 >> 6;
            if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
            {
              unint64_t v38 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
              goto LABEL_40;
            }
            char v39 = 0;
            unint64_t v40 = (unint64_t)(63 - v35) >> 6;
            break;
        }
        do
        {
          if (++v37 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
            JUMPOUT(0x100026460);
          }
          BOOL v41 = v37 == v40;
          if (v37 == v40) {
            unint64_t v37 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v19 + 8 * v37);
        }
        while (v42 == -1);
        unint64_t v38 = __clz(__rbit64(~v42)) + (v37 << 6);
LABEL_40:
        *(void *)(v19 + ((v38 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v38;
        sub_100026DCC((uint64_t)v14, *(void *)(v15 + 48) + v38 * v26);
        ++*(void *)(v15 + 16);
        if (__OFSUB__(a3--, 1)) {
          goto LABEL_45;
        }
        a4 = v52;
        if (!a3)
        {
LABEL_42:
          swift_release();
          return (void *)v15;
        }
      }
    }
    return (void *)a4;
  }
  else
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
}

uint64_t sub_100026470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for SimulationReason();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1000545B8();
  swift_bridgeObjectRetain();
  sub_100024550();
  Swift::Int v11 = sub_1000545D8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v22 = v6;
    uint64_t v23 = a2;
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v7 + 72);
    while (1)
    {
      sub_100026D68(*(void *)(v10 + 48) + v15 * v13, (uint64_t)v9);
      char v16 = sub_1000241B8((uint64_t)v9, a1);
      sub_100023D5C((uint64_t)v9);
      if (v16) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
      if (((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v17 = 1;
        uint64_t v6 = v22;
        a2 = v23;
        return sub_100008010(a2, v17, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v3;
    uint64_t v24 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1000253BC();
      uint64_t v19 = v24;
    }
    a2 = v23;
    sub_100026DCC(*(void *)(v19 + 48) + v15 * v13, v23);
    sub_100026684(v13);
    *uint64_t v3 = v24;
    swift_bridgeObjectRelease();
    uint64_t v17 = 0;
    uint64_t v6 = v22;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = 1;
  }
  return sub_100008010(a2, v17, 1, v6);
}

uint64_t sub_100026684(int64_t a1)
{
  uint64_t v44 = sub_1000531C8();
  uint64_t v3 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v43 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for SimulationReason();
  uint64_t v5 = __chkstk_darwin(v45);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v5);
  Swift::Int v11 = (char *)&v38 - v10;
  uint64_t v12 = *v1;
  uint64_t v13 = *v1 + 56;
  uint64_t v14 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v15 = (a1 + 1) & ~v14;
  if (((1 << v15) & *(void *)(v13 + 8 * (v15 >> 6))) != 0)
  {
    uint64_t v46 = v9;
    uint64_t v42 = v3;
    unint64_t v38 = v1;
    uint64_t v16 = ~v14;
    swift_retain();
    uint64_t v17 = sub_1000542C8();
    if ((*(void *)(v13 + 8 * (v15 >> 6)) & (1 << v15)) != 0)
    {
      unint64_t v18 = (v17 + 1) & v16;
      uint64_t v46 = *(void *)(v46 + 72);
      char v39 = (void (**)(char *, uint64_t))(v42 + 8);
      unint64_t v40 = (void (**)(char *, char *, uint64_t))(v42 + 32);
      uint64_t v41 = v16;
      uint64_t v42 = v13;
      while (2)
      {
        int64_t v19 = v46 * v15;
        sub_100026D68(*(void *)(v12 + 48) + v46 * v15, (uint64_t)v11);
        sub_1000545B8();
        sub_100026D68((uint64_t)v11, (uint64_t)v7);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v21 = v43;
            uint64_t v20 = v44;
            (*v40)(v43, v7, v44);
            Swift::UInt v22 = 2;
            goto LABEL_8;
          case 2u:
            uint64_t v21 = v43;
            uint64_t v20 = v44;
            (*v40)(v43, v7, v44);
            Swift::UInt v22 = 3;
            goto LABEL_8;
          case 3u:
            sub_1000545C8(0);
            goto LABEL_10;
          default:
            uint64_t v21 = v43;
            uint64_t v20 = v44;
            (*v40)(v43, v7, v44);
            Swift::UInt v22 = 1;
LABEL_8:
            sub_1000545C8(v22);
            sub_100026E40(&qword_10006C858, (void (*)(uint64_t))&type metadata accessor for UUID);
            sub_100053EC8();
            uint64_t v23 = v21;
            uint64_t v24 = v20;
            uint64_t v16 = v41;
            uint64_t v13 = v42;
            (*v39)(v23, v24);
LABEL_10:
            Swift::Int v25 = sub_1000545D8();
            sub_100023D5C((uint64_t)v11);
            Swift::Int v26 = v25 & v16;
            if (a1 >= (uint64_t)v18)
            {
              if (v26 < v18 || a1 < v26) {
                goto LABEL_30;
              }
            }
            else if (v26 < v18 && a1 < v26)
            {
              goto LABEL_30;
            }
            uint64_t v29 = *(void *)(v12 + 48);
            int64_t v30 = v46 * a1;
            unint64_t v31 = v29 + v46 * a1;
            unint64_t v32 = v29 + v19 + v46;
            if (v46 * a1 < v19 || v31 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              a1 = v15;
              if (v30 == v19) {
                goto LABEL_30;
              }
              swift_arrayInitWithTakeBackToFront();
            }
            a1 = v15;
LABEL_30:
            unint64_t v15 = (v15 + 1) & v16;
            if (((*(void *)(v13 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
    *(void *)(v13 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v38;
  }
  else
  {
    *(void *)(v13 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v34 = *v1;
  uint64_t v35 = *(void *)(*v1 + 16);
  BOOL v36 = __OFSUB__(v35, 1);
  uint64_t v37 = v35 - 1;
  if (v36)
  {
    __break(1u);
    JUMPOUT(0x100026AF0);
  }
  *(void *)(v34 + 16) = v37;
  ++*(_DWORD *)(v34 + 36);
  return result;
}

char *sub_100026B00(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100026B20(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_100026B20(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000068D8(&qword_10006C850);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100024778(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002491C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

int64_t sub_100026C04(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100026CE8(uint64_t a1)
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

uint64_t sub_100026D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SimulationReason();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100026DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SimulationReason();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100026E30(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100026E40(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL sub_100026E88()
{
  return (sub_100023370(*(void *)(v0 + 16)) & 1) == 0;
}

uint64_t sub_100026EC4()
{
  return v0;
}

uint64_t sub_100026EE0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100026F24()
{
  return type metadata accessor for SimulationReason();
}

uint64_t sub_100026F4C(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_100026F8C()
{
  return v0;
}

uint64_t sub_100026FC8()
{
  return v0;
}

uint64_t sub_100026FD4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_100026FEC()
{
  return swift_getEnumCaseMultiPayload();
}

void sub_100027004(uint64_t a1, Swift::UInt a2)
{
}

uint64_t sub_10002702C(uint64_t a1, char a2)
{
  sub_10003A758(a2);
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100027080()
{
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000270F0()
{
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002721C()
{
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100027370()
{
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100027440()
{
  sub_100053F48();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000274A4()
{
  return sub_1000545D8();
}

Swift::Int sub_100027518()
{
  return sub_1000545D8();
}

Swift::Int sub_10002755C(uint64_t a1, uint64_t a2)
{
  return sub_100027628(a1, a2, (void (*)(uint64_t))sub_100030F2C);
}

Swift::Int sub_100027574(uint64_t a1, uint64_t a2)
{
  return sub_100027628(a1, a2, (void (*)(uint64_t))sub_100031F64);
}

Swift::Int sub_10002758C()
{
  return sub_1000545D8();
}

Swift::Int sub_100027610(uint64_t a1, uint64_t a2)
{
  return sub_100027628(a1, a2, (void (*)(uint64_t))sub_10003A758);
}

Swift::Int sub_100027628(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_1000545D8();
}

Swift::Int sub_100027690(uint64_t a1, Swift::UInt a2)
{
  return sub_1000545D8();
}

id PosterUpdater.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t PosterUpdater.updateDescriptors(_:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_10002A8CC((uint64_t)sub_100027720);
}

uint64_t sub_100027720()
{
  uint64_t v55 = v0;
  uint64_t v1 = v0;
  if (qword_10006BB70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100053568();
  sub_10000E284(v2, (uint64_t)qword_100070910);
  uint64_t v3 = sub_100053548();
  os_log_type_t v4 = sub_100054118();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received request to update descriptors", v5, 2u);
    sub_10000E950();
  }
  uint64_t v51 = (uint64_t *)(v0 + 16);

  uint64_t v6 = 2;
  uint64_t v52 = v0;
  uint64_t v7 = *(void *)(v0 + 24);
  unint64_t v8 = (unint64_t *)&off_100065E08;
  do
  {
    uint64_t v9 = *(v8 - 1);
    unint64_t v10 = *v8;
    uint64_t v11 = *(void *)(v7 + 16);
    swift_bridgeObjectRetain();
    if (v11)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_10002A958();
      unint64_t v14 = sub_100029E50(v12, v13);
      if (v15)
      {
        id v16 = *(id *)(*(void *)(v7 + 56) + 8 * v14);
        swift_bridgeObjectRelease();
        uint64_t v17 = sub_100027D6C();
        if ((v18 & 1) == 0 && v17 == 3)
        {
          uint64_t v53 = v8;
          id v19 = *(id *)(v1 + 32);
          swift_bridgeObjectRetain();
          id v20 = v19;
          uint64_t v21 = sub_100053548();
          os_log_type_t v22 = sub_100054118();
          BOOL v23 = os_log_type_enabled(v21, v22);
          uint64_t v24 = *(void **)(v1 + 32);
          if (v23)
          {
            uint64_t v25 = swift_slowAlloc();
            uint64_t v54 = swift_slowAlloc();
            *(_DWORD *)uint64_t v25 = 136446466;
            swift_bridgeObjectRetain();
            uint64_t v26 = sub_10002A958();
            *(void *)(v25 + 4) = sub_100029610(v26, v27, v28);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v25 + 12) = 2050;

            *(void *)(v25 + 14) = 3;
            _os_log_impl((void *)&_mh_execute_header, v21, v22, "Reusing current descriptor with identifier=%{public}s version=%{public}ld", (uint8_t *)v25, 0x16u);
            swift_arrayDestroy();
            uint64_t v1 = v52;
            sub_10000E950();
            sub_10000E950();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }

          id v41 = v16;
          sub_100053FA8();
          sub_10002A944();
          unint64_t v8 = v53;
          if (v40) {
            sub_10002A924(v42);
          }
          sub_100054008();
          sub_100053FE8();

          goto LABEL_23;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v29 = *(void **)(v1 + 32);
    swift_bridgeObjectRetain_n();
    id v30 = v29;
    unint64_t v31 = sub_100053548();
    os_log_type_t v32 = sub_100054118();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void **)(v1 + 32);
    if (v33)
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t *v51 = sub_100029610(v9, v10, &v54);
      uint64_t v1 = v52;
      sub_100054288();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2050;

      uint64_t *v51 = 3;
      sub_100054288();

      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Creating new descriptor with identifier=%{public}s version=%{public}ld", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    if (v9 != 0xD000000000000014 || v10 != 0x8000000100057250)
    {
      sub_10002A958();
      sub_100054508();
    }
    uint64_t v36 = sub_10002A958();
    sub_100028640(v36, v37, v38);
    swift_bridgeObjectRelease();
    sub_100053FA8();
    sub_10002A944();
    if (v40) {
      sub_10002A924(v39);
    }
    sub_100054008();
    sub_100053FE8();
LABEL_23:
    v8 += 2;
    --v6;
  }
  while (v6);
  uint64_t v43 = sub_100053548();
  os_log_type_t v44 = sub_100054118();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136446210;
    uint64_t v47 = sub_100053FD8();
    *(void *)(v52 + 16) = sub_100029610(v47, v48, &v54);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Returning descriptors for %{public}s", v46, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    uint64_t v1 = v52;
    sub_10000E950();
  }

  int v49 = *(uint64_t (**)(void *))(v1 + 8);
  return v49(&_swiftEmptyArrayStorage);
}

uint64_t sub_100027D6C()
{
  NSString v1 = sub_100053EE8();
  id v2 = [v0 objectForUserInfoKey:v1];

  if (v2)
  {
    sub_1000542A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_10001F740((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v4;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10002A664((uint64_t)v6, &qword_10006C4F0);
    return 0;
  }
}

uint64_t sub_100027E84(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = sub_100018DB0(0, (unint64_t *)&unk_10006C968);
  uint64_t v5 = sub_100053E88();
  v3[5] = v5;
  a3;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[6] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100027F80;
  return PosterUpdater.updateDescriptors(_:)(v5);
}

uint64_t sub_100027F80()
{
  sub_10002A900();
  uint64_t v2 = v0;
  sub_10000E710();
  uint64_t v4 = v3;
  uint64_t v6 = *(void **)(v5 + 16);
  uint64_t v7 = *v1;
  sub_10000E968();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v9 = sub_100053018();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v11 = (void *)v9;
  }
  else
  {
    Class isa = sub_100053FB8().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v9 = 0;
    uint64_t v11 = isa;
  }
  uint64_t v12 = *(void (***)(void, void, void))(v4 + 24);
  ((void (**)(void, Class, uint64_t))v12)[2](v12, isa, v9);

  _Block_release(v12);
  sub_10000E9E0();
  return v13();
}

uint64_t sub_1000280F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C920);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100054088();
  sub_100008010((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_10006C930;
  v9[5] = v8;
  sub_1000292FC((uint64_t)v6, (uint64_t)&unk_10006C940, (uint64_t)v9);
  return swift_release();
}

uint64_t PosterUpdater.updateConfiguration(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return sub_10002A8CC((uint64_t)sub_100028214);
}

uint64_t sub_100028214()
{
  sub_10002A900();
  if (qword_10006BB70 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100053568();
  sub_10000E284(v1, (uint64_t)qword_100070910);
  uint64_t v2 = sub_100053548();
  os_log_type_t v3 = sub_100054118();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Received request to update configuration", v4, 2u);
    sub_10000E950();
  }
  uint64_t v5 = *(void **)(v0 + 16);

  sub_10000E9E0();
  unint64_t v10 = v6;
  id v7 = v5;
  uint64_t v8 = *(void *)(v0 + 16);
  return v10(v8);
}

uint64_t sub_100028350(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = _Block_copy(aBlock);
  unint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  id v11 = a3;
  id v12 = a1;

  return sub_1000280F8(a6, (uint64_t)v10);
}

uint64_t sub_1000283D4(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100028494;
  return PosterUpdater.updateConfiguration(_:)((uint64_t)v6);
}

uint64_t sub_100028494()
{
  sub_10002A900();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = *v1;
  id v6 = *(void **)(*v1 + 24);
  id v7 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  sub_10000E968();
  *uint64_t v9 = v8;
  swift_task_dealloc();

  uint64_t v10 = *(void (***)(void, void, void))(v5 + 32);
  if (v2)
  {
    id v11 = (void *)sub_100053018();
    swift_errorRelease();
    ((void (**)(void, void, void *))v10)[2](v10, 0, v11);

    _Block_release(v10);
  }
  else
  {
    ((void (**)(void, void *, void))v10)[2](v10, v4, 0);
    _Block_release(v10);
  }
  id v12 = *(uint64_t (**)(void))(v8 + 8);
  return v12();
}

void *sub_100028640(uint64_t a1, unint64_t a2, char a3)
{
  sub_100018DB0(0, (unint64_t *)&unk_10006C980);
  swift_bridgeObjectRetain();
  uint64_t v77 = a1;
  unint64_t v78 = a2;
  id v6 = sub_100028EE4();
  sub_1000068D8(&qword_10006BBA0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100056090;
  *(void *)(v7 + 32) = [self vibrantMaterialColor];
  sub_10002A90C();
  sub_100018DB0(0, &qword_10006C990);
  Class isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  [v6 setPreferredTitleColors:isa];

  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100056090;
  *(void *)(v9 + 32) = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:PRTimeFontIdentifierSoft];
  sub_10002A90C();
  sub_100018DB0(0, &qword_10006C998);
  Class v10 = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  [v6 setPreferredTimeFontConfigurations:v10];

  Class v11 = sub_1000540D8().super.super.isa;
  NSString v12 = sub_100053EE8();
  [v6 setObject:v11 forUserInfoKey:v12];

  id v13 = [objc_allocWithZone((Class)type metadata accessor for WeatherIntent()) init];
  type metadata accessor for WeatherLocation();
  if (qword_10006BB38 != -1) {
    swift_once();
  }
  uint64_t v80 = v6;
  uint64_t v14 = static WeatherLocation.currentLocationID;
  uint64_t v15 = *(void *)algn_100070868;
  uint64_t v16 = qword_10006BB30;
  swift_bridgeObjectRetain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = (objc_class *)(id)qword_100070850;
  v74._countAndFlagsBits = 0x8000000100057F30;
  v82._countAndFlagsBits = 0x7461636F4C20794DLL;
  v82._object = (void *)0xEB000000006E6F69;
  v83.value._countAndFlagsBits = 0;
  v83.value._object = 0;
  v18.super.Class isa = v17;
  v84._countAndFlagsBits = 0;
  v84._object = (void *)0xE000000000000000;
  sub_100052F28(v82, v83, v18, v84, v74);

  id v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v20 = sub_100028FE4(v14, v15);
  [v13 setLocation:v20];

  id v21 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
  [v21 setHero:a3 & 1];
  [v21 setAllowsSystemSuggestedComplications:0];
  [v21 setFeaturedConfidenceLevel:1];
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_100055290;
  id v23 = (id)INIntentWithTypedIntent();
  id v24 = objc_allocWithZone((Class)ATXComplication);
  uint64_t v79 = v13;
  *(void *)(v22 + 32) = sub_100029078(0xD000000000000018, 0x8000000100057F80, 0xD000000000000011, 0x8000000100057FA0, 0xD000000000000011, 0x8000000100057FA0, 1, v23, 5u);
  id v25 = objc_allocWithZone((Class)ATXComplication);
  *(void *)(v22 + 40) = sub_10002A890(0xD000000000000018, 0x8000000100057F80, 0xD000000000000023, 0x8000000100057FC0, v26, v27, v28, v29, 5u);
  id v30 = objc_allocWithZone((Class)ATXComplication);
  *(void *)(v22 + 48) = sub_10002A890(0xD000000000000018, 0x8000000100057F80, 0xD000000000000026, 0x8000000100057FF0, v31, v32, v33, v34, 5u);
  sub_10002A90C();
  sub_10002A800((uint64_t)v81, v21, (SEL *)&selRef_setModularLandscapeComplications_);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_100055290;
  id v36 = objc_allocWithZone((Class)ATXComplication);
  uint64_t v37 = sub_10002A8B4();
  *(void *)(v35 + 32) = sub_100029078(v37, v38, v39, v40, v41, v42, 11, 0, 5u);
  id v43 = objc_allocWithZone((Class)ATXComplication);
  uint64_t v44 = sub_10002A964();
  *(void *)(v35 + 40) = sub_10002A890(v44, v45, 0xD000000000000023, 0x8000000100057FC0, v46, v47, v48, v49, v75);
  id v50 = objc_allocWithZone((Class)ATXComplication);
  uint64_t v51 = sub_10002A964();
  *(void *)(v35 + 48) = sub_10002A890(v51, v52, 0xD000000000000026, 0x8000000100057FF0, v53, v54, v55, v56, v76);
  sub_10002A90C();
  sub_10002A800((uint64_t)v81, v21, (SEL *)&selRef_setModularComplications_);
  id v57 = objc_allocWithZone((Class)ATXComplication);
  uint64_t v58 = sub_10002A8B4();
  id v64 = sub_100029078(v58, v59, v60, v61, v62, v63, 12, 0, 5u);
  [v21 setInlineComplication:v64];

  id v81 = 0;
  if ([v80 storeGalleryOptions:v21 error:&v81])
  {
    id v65 = v81;
  }
  else
  {
    id v66 = v81;
    sub_100053028();

    swift_willThrow();
    if (qword_10006BB70 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_100053568();
    sub_10000E284(v67, (uint64_t)qword_100070910);
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    unint64_t v68 = sub_100053548();
    os_log_type_t v69 = sub_1000540F8();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = swift_slowAlloc();
      id v81 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v70 = 136315394;
      swift_bridgeObjectRetain();
      sub_100029610(v77, v78, (uint64_t *)&v81);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v70 + 12) = 2082;
      swift_errorRetain();
      sub_1000068D8(&qword_10006C9A0);
      uint64_t v71 = sub_100053F38();
      sub_100029610(v71, v72, (uint64_t *)&v81);
      sub_100054288();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "Failed to store gallery options when updating descriptor; identifier=%s, error=%{public}s",
        (uint8_t *)v70,
        0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  return v80;
}

id sub_100028EE4()
{
  NSString v0 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() mutableDescriptorWithIdentifier:v0];

  return v1;
}

id PosterUpdater.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC13WeatherPoster13PosterUpdater_descriptorVersion] = 3;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterUpdater();
  return [super init];
}

id PosterUpdater.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterUpdater();
  return [super dealloc];
}

id sub_100028FE4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v5 = [v2 initWithIdentifier:v3 displayString:v4];

  return v5;
}

id sub_100029078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, unsigned int a9)
{
  Class v10 = v9;
  NSString v14 = sub_100053EE8();
  swift_bridgeObjectRelease();
  NSString v15 = sub_100053EE8();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v16 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  id v17 = [v10 initWithExtensionBundleIdentifier:v14 kind:v15 containerBundleIdentifier:v16 widgetFamily:a7 intent:a8 source:a9];

  return v17;
}

uint64_t sub_100029164(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  NSString v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10002A88C;
  return v6();
}

uint64_t sub_100029230(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_10002A88C;
  return v7();
}

uint64_t sub_1000292FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100054088();
  if (sub_100007FE8(a1, 1, v6) == 1)
  {
    sub_10002A664(a1, &qword_10006C920);
  }
  else
  {
    sub_100054078();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100054028();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002946C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100029548;
  return v6(a1);
}

uint64_t sub_100029548()
{
  sub_10000E710();
  uint64_t v1 = *v0;
  sub_10000E968();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000E9E0();
  return v3();
}

uint64_t sub_100029610(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000296E4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002A6C0((uint64_t)v12, *a3);
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
      sub_10002A6C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100019004((uint64_t)v12);
  return v7;
}

uint64_t sub_1000296E4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10002983C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100054298();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100029914(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100054358();
    if (!v8)
    {
      uint64_t result = sub_1000543E8();
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

void *sub_10002983C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100054428();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100029914(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1000299AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100029B88(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100029B88((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_1000299AC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100053F68();
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
  unint64_t v3 = sub_100029B20(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100054318();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100054428();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_1000543E8();
  __break(1u);
  return result;
}

void *sub_100029B20(uint64_t a1, uint64_t a2)
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
  sub_1000068D8(&qword_10006C978);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100029B88(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000068D8(&qword_10006C978);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  NSString v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100029D38(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100029C60(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100029C60(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100054428();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100029D38(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100054428();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_100029DC8(char a1)
{
  sub_1000545B8();
  sub_10003A758(a1);
  sub_100053F48();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_1000545D8();

  return sub_100029EEC(a1, v2);
}

unint64_t sub_100029E50(uint64_t a1, uint64_t a2)
{
  sub_1000545B8();
  sub_100053F48();
  Swift::Int v4 = sub_1000545D8();

  return sub_10002A71C(a1, a2, v4);
}

uint64_t type metadata accessor for PosterUpdater()
{
  return self;
}

unint64_t sub_100029EEC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000001000573A0;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0x80000001000573C0;
          unint64_t v8 = 0xD000000000000010;
          break;
        case 2:
          int64_t v9 = "weatherRendering";
          goto LABEL_9;
        case 3:
          int64_t v9 = "weatherUnloadingMemory";
          goto LABEL_9;
        case 4:
          uint64_t v10 = "weatherUnlockAnimation";
          unint64_t v8 = 0xD000000000000015;
          goto LABEL_11;
        case 5:
          int64_t v9 = "weatherDeviceRotation";
LABEL_9:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v8 = 0xD000000000000016;
          break;
        case 6:
          uint64_t v10 = "weatherLocationRequest";
          unint64_t v8 = 0xD000000000000012;
LABEL_11:
          unint64_t v7 = (unint64_t)v10 | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v11 = 0x80000001000573A0;
      unint64_t v12 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          unint64_t v11 = 0x80000001000573C0;
          unint64_t v12 = 0xD000000000000010;
          break;
        case 2:
          id v13 = "weatherRendering";
          goto LABEL_18;
        case 3:
          id v13 = "weatherUnloadingMemory";
          goto LABEL_18;
        case 4:
          NSString v14 = "weatherUnlockAnimation";
          unint64_t v12 = 0xD000000000000015;
          goto LABEL_20;
        case 5:
          id v13 = "weatherDeviceRotation";
LABEL_18:
          unint64_t v11 = (unint64_t)v13 | 0x8000000000000000;
          unint64_t v12 = 0xD000000000000016;
          break;
        case 6:
          NSString v14 = "weatherLocationRequest";
          unint64_t v12 = 0xD000000000000012;
LABEL_20:
          unint64_t v11 = (unint64_t)v14 | 0x8000000000000000;
          break;
        default:
          break;
      }
      if (v8 == v12 && v7 == v11) {
        break;
      }
      char v16 = sub_100054508();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_10002A16C()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002A8F4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10002A88C;
  uint64_t v3 = sub_10002A8D8();
  return v4(v3);
}

uint64_t sub_10002A20C()
{
  sub_10002A900();
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002A8F4(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_10002A88C;
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10006C928 + dword_10006C928);
  return v7(v1, v2, v3);
}

uint64_t sub_10002A2C8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002A308()
{
  sub_10002A900();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = (int *)v0[4];
  uint64_t v6 = swift_task_alloc();
  unint64_t v7 = (void *)sub_10002A8F4(v6);
  void *v7 = v8;
  v7[1] = sub_10002A88C;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10006C938 + dword_10006C938);
  return v9(v2, v3, v4, v5);
}

uint64_t sub_10002A3CC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A404(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_10002A8F4(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_10002A4B8;
  unint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006C948 + dword_10006C948);
  return v7(a1, v3);
}

uint64_t sub_10002A4B8()
{
  sub_10000E710();
  uint64_t v1 = *v0;
  sub_10000E968();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000E9E0();
  return v3();
}

uint64_t sub_10002A580()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002A5C8()
{
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10002A8F4(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10002A4B8;
  uint64_t v3 = sub_10002A8D8();
  return v4(v3);
}

uint64_t sub_10002A664(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000068D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002A6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10002A71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100054508() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100054508() & 1) == 0);
    }
  }
  return v6;
}

void sub_10002A800(uint64_t a1, void *a2, SEL *a3)
{
  sub_100018DB0(0, &qword_10006C9A8);
  Class isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  [a2 *a3];
}

id sub_10002A890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  return sub_100029078(a1, a2, a3, a4, 0xD000000000000011, v9, 10, 0, a9);
}

uint64_t sub_10002A8B4()
{
  return v0;
}

uint64_t sub_10002A8CC(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_10002A8D8()
{
  return v0;
}

uint64_t sub_10002A8F4(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10002A90C()
{
  *(void *)(v1 - 96) = v0;
  return sub_100053FE8();
}

uint64_t sub_10002A924@<X0>(unint64_t a1@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1 > 1, v1 + 1, 1);
}

uint64_t sub_10002A958()
{
  return v0;
}

uint64_t sub_10002A964()
{
  return v0;
}

id sub_10002A978(uint64_t a1)
{
  uint64_t v3 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B620(a1, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for DynamicRotationState();
  sub_100008010((uint64_t)v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC13WeatherPoster12GradientView_rotationState;
  swift_beginAccess();
  sub_10002B684((uint64_t)v5, v7);
  swift_endAccess();
  sub_10002B2D0(&v13, *(float *)(a1 + *(int *)(v6 + 20)));
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer);
  v14.x = sub_10002B954();
  v14.y = 0.0;
  CGPoint v9 = CGPointApplyAffineTransform(v14, &v12);
  [v8 setStartPoint:v9.x, v9.y];
  v15.x = sub_10002B954();
  v15.y = 1.0;
  CGPoint v10 = CGPointApplyAffineTransform(v15, &v12);
  return [v8 setEndPoint:v10.x, v10.y];
}

uint64_t sub_10002AAD8(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient;
  swift_beginAccess();
  uint64_t v4 = sub_100053CA8();
  sub_10000F86C();
  uint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v3, a1, v4);
  swift_endAccess();
  sub_10002AB88();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v4);
}

void sub_10002AB88()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DynamicRotationState();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100053CA8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  BOOL v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = self;
  [v24 begin];
  CGAffineTransform v12 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer);
  id v13 = [v12 colors];
  if (v13) {
    uint64_t v23 = sub_100053FC8();
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v14 = v1 + OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  v15.super.super.Class isa = (Class)v12;
  sub_100053C88(v15);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v16 = v1 + OBJC_IVAR____TtC13WeatherPoster12GradientView_rotationState;
  swift_beginAccess();
  sub_10002B6EC(v16, (uint64_t)v4);
  if (sub_100007FE8((uint64_t)v4, 1, v5) == 1)
  {
    sub_10002B754((uint64_t)v4);
  }
  else
  {
    sub_10002B870((uint64_t)v4, (uint64_t)v7);
    id v17 = [self currentDevice];
    id v18 = [v17 userInterfaceIdiom];

    if (v18 == (id)1) {
      sub_10002A978((uint64_t)v7);
    }
    sub_10002B8D4((uint64_t)v7);
  }
  sub_10002B7B4();
  id v19 = sub_10002AF78(0x73726F6C6F63, 0xE600000000000000);
  if (v23)
  {
    swift_bridgeObjectRelease();
  }
  else
  {

    id v13 = 0;
  }
  [v19 setFromValue:v13, v23];
  swift_unknownObjectRelease();
  id v20 = [v12 colors];
  [v19 setToValue:v20];

  [v19 setDuration:0.25];
  uint64_t v21 = qword_10006BB40;
  id v22 = v19;
  if (v21 != -1) {
    swift_once();
  }
  [v22 setTimingFunction:qword_100070880];

  sub_10002B7F4((uint64_t)v22, 0x73726F6C6F63, 0xE600000000000000, v12);
  [v24 commit];
}

id sub_10002AF78(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v2 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v3 = [(id)swift_getObjCClassFromMetadata() animationWithKeyPath:v2];

  return v3;
}

char *sub_10002AFE8(uint64_t a1)
{
  NSString v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer;
  id v6 = objc_allocWithZone((Class)CAGradientLayer);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = [v6 init];
  uint64_t v8 = type metadata accessor for DynamicRotationState();
  sub_10002B968(v8);
  uint64_t v9 = &v7[OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient];
  uint64_t v10 = sub_100053CA8();
  sub_10000F86C();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);

  v21.receiver = v7;
  v21.super_class = ObjectType;
  id v13 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v14 = OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer;
  CAGradientLayer v15 = *(void **)&v13[OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer];
  uint64_t v16 = v13;
  v17.super.super.Class isa = (Class)v15;
  Class isa = v17.super.super.isa;
  sub_100053C88(v17);

  id v19 = [v16 layer];
  [v19 addSublayer:*(void *)&v13[v14]];

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v10);
  return v16;
}

void sub_10002B160()
{
  uint64_t v1 = OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)CAGradientLayer) init];
  uint64_t v2 = type metadata accessor for DynamicRotationState();
  sub_10002B968(v2);

  sub_1000543F8();
  __break(1u);
}

id sub_10002B21C()
{
  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  [super layoutSubviews];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC13WeatherPoster12GradientView_gradientLayer];
  [v0 bounds];
  return [v1 setFrame:];
}

__n128 sub_10002B2D0@<Q0>(__n128 *a1@<X8>, float a2@<S0>)
{
  CGAffineTransformMakeTranslation(&v49, -0.5, -0.5);
  CGFloat a = v49.a;
  CGFloat b = v49.b;
  CGFloat c = v49.c;
  CGFloat d = v49.d;
  CGFloat tx = v49.tx;
  CGFloat ty = v49.ty;
  Rotation = CGAffineTransformMakeRotation(&v49, (float)((float)(a2 * 3.1416) / 180.0));
  __n128 v11 = *(__n128 *)&v49.a;
  __n128 v12 = *(__n128 *)&v49.c;
  __n128 v13 = *(__n128 *)&v49.tx;
  v49.CGFloat a = a;
  v49.CGFloat b = b;
  v49.CGFloat c = c;
  v49.CGFloat d = d;
  v49.CGFloat tx = tx;
  v49.CGFloat ty = ty;
  sub_10002B930((uint64_t)Rotation, v14, v15, v16, v17, v18, v19, v11, v12, v13, v20, v34, v35, v36, v37, v38, v41, v42, v44,
    v45,
    v47,
    v21,
    v22,
    v23,
    *(uint64_t *)&v48.a);
  v49.CGFloat a = a;
  v49.CGFloat b = b;
  v49.CGFloat c = c;
  v49.CGFloat d = d;
  v49.CGFloat tx = tx;
  v49.CGFloat ty = ty;
  id v24 = CGAffineTransformInvert(&v48, &v49);
  CGAffineTransform v49 = v39;
  sub_10002B930((uint64_t)v24, v25, v26, v27, v28, v29, v30, *(__n128 *)&v48.a, *(__n128 *)&v48.c, *(__n128 *)&v48.tx, v31, *(uint64_t *)&v39.c, *(uint64_t *)&v39.d, *(uint64_t *)&v39.a, *(uint64_t *)&v39.b, *(uint64_t *)&v39.a, *(uint64_t *)&v39.b, *(uint64_t *)&v39.c, *(uint64_t *)&v39.d,
    *(uint64_t *)&v39.tx,
    *(uint64_t *)&v39.ty,
    *(__n128 *)&v39.c,
    *(__n128 *)&v39.a,
    v32,
    *(uint64_t *)&v48.a);
  __n128 result = v40;
  *a1 = v40;
  a1[1] = v43;
  a1[2] = v46;
  return result;
}

void sub_10002B3C8()
{
}

uint64_t sub_10002B498()
{
  return type metadata accessor for GradientView();
}

uint64_t type metadata accessor for GradientView()
{
  uint64_t result = qword_10006C9E8;
  if (!qword_10006C9E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002B4E8()
{
  sub_10002B5C4();
  if (v0 <= 0x3F)
  {
    sub_100053CA8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10002B5C4()
{
  if (!qword_10006C1D8)
  {
    type metadata accessor for DynamicRotationState();
    unint64_t v0 = sub_100054278();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C1D8);
    }
  }
}

uint64_t sub_10002B620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicRotationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C308);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B6EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C308);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B754(uint64_t a1)
{
  uint64_t v2 = sub_1000068D8(&qword_10006C308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002B7B4()
{
  unint64_t result = qword_10006C9F8;
  if (!qword_10006C9F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006C9F8);
  }
  return result;
}

void sub_10002B7F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = sub_100053EE8();
  swift_bridgeObjectRelease();
  [a4 addAnimation:a1 forKey:v6];
}

uint64_t sub_10002B870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicRotationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B8D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicRotationState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

CGAffineTransform *sub_10002B930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CGAffineTransform *a5, CGAffineTransform *t2, CGAffineTransform *t1, __n128 a8, __n128 a9, __n128 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,__n128 t2a,__n128 t2_16,__n128 t2_32,uint64_t t1a)
{
  t2CGFloat a = a8;
  t2_16 = a9;
  t2_32 = a10;
  return CGAffineTransformConcat((CGAffineTransform *)&a16, (CGAffineTransform *)&t1a, (CGAffineTransform *)&t2a);
}

double sub_10002B954()
{
  *(void *)(v0 - 192) = v1;
  *(void *)(v0 - 184) = v2;
  *(void *)(v0 - 176) = v3;
  *(void *)(v0 - 168) = v4;
  *(void *)(v0 - 160) = v5;
  *(void *)(v0 - 152) = v6;
  return 0.0;
}

uint64_t sub_10002B968(uint64_t a1)
{
  return sub_100008010(v1, 1, 1, a1);
}

Swift::Int sub_10002B988()
{
  return sub_10002758C();
}

Swift::Int sub_10002B994()
{
  return sub_1000545D8();
}

Swift::Int sub_10002B9DC()
{
  return sub_1000274A4();
}

Swift::Int sub_10002B9E8(uint64_t a1)
{
  return sub_10002BA30(a1, (void (*)(uint64_t))sub_100030F2C);
}

Swift::Int sub_10002BA00(uint64_t a1)
{
  return sub_10002BA30(a1, (void (*)(uint64_t))sub_100031F64);
}

Swift::Int sub_10002BA18(uint64_t a1)
{
  return sub_10002BA30(a1, (void (*)(uint64_t))sub_10003A758);
}

Swift::Int sub_10002BA30(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_1000545D8();
}

Swift::Int sub_10002BAA0(Swift::UInt a1)
{
  return sub_1000545D8();
}

uint64_t sub_10002BAE8(uint64_t a1, void *a2)
{
  v7._countAndFlagsBits = a1;
  v3._rawValue = &off_100065E20;
  v7._object = a2;
  Swift::Int v4 = sub_100054448(v3, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_10002BB3C(char a1)
{
  if (a1) {
    return 0x656E696C66666FLL;
  }
  else {
    return 0x6C62616863616572;
  }
}

uint64_t sub_10002BB78(char *a1, char *a2)
{
  return sub_10000F984(*a1, *a2);
}

Swift::Int sub_10002BB84()
{
  return sub_10002B988();
}

uint64_t sub_10002BB8C()
{
  return sub_100027080();
}

Swift::Int sub_10002BB94()
{
  return sub_10002758C();
}

uint64_t sub_10002BB9C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002BAE8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10002BBCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002BB3C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10002BBF8()
{
  if (!*(void *)(v0 + 16))
  {
    uint64_t v1 = v0;
    sub_100053708();
    swift_allocObject();
    uint64_t v2 = sub_1000536F8();
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_100018900((uint64_t)sub_10002C7C8);
    sub_1000536C8();
    swift_release_n();
    sub_1000536D8();
    *(void *)(v1 + 16) = v2;
    swift_release();
  }
}

uint64_t sub_10002BCDC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10002BD3C(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_10002BD3C(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v1 = sub_100053768();
  uint64_t v20 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::OpaquePointer v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100053788();
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100053748();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DD58();
  __n128 v11 = (void *)sub_100054178();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v14 + v13, v10, v7);
  aBlock[4] = sub_10002C874;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100017B38;
  aBlock[3] = &unk_100066D10;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  sub_100053778();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10002C8F0((unint64_t *)&qword_10006C348, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000068D8(&qword_10006C350);
  sub_10002C938((unint64_t *)&qword_10006C358, &qword_10006C350);
  sub_1000542B8();
  sub_100054188();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v6, v19);
}

uint64_t sub_10002C0DC()
{
  if (*(void *)(v0 + 16))
  {
    swift_retain();
    sub_100018900(0);
    sub_1000536C8();
    swift_release();
    if (*(void *)(v0 + 16))
    {
      swift_retain();
      sub_1000536E8();
      swift_release();
    }
  }
  *(void *)(v0 + 16) = 0;

  return swift_release();
}

uint64_t sub_10002C168()
{
  uint64_t v0 = sub_100053728();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - v5;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    uint64_t result = swift_release();
    if (Strong)
    {
      sub_100053738();
      (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for NWPath.Status.satisfied(_:), v0);
      char v9 = sub_100053718();
      uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
      v10(v4, v0);
      v10(v6, v0);
      sub_10004D4C0((v9 & 1) == 0);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_10002C308()
{
  swift_release();

  sub_100019374(v0 + 32);
  return v0;
}

uint64_t sub_10002C338()
{
  sub_10002C308();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for NetworkMonitor()
{
  return self;
}

uint64_t getEnumTagSinglePayload for LabelViewModel.Placement(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NetworkStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002C4E4);
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

unsigned char *sub_10002C50C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkStatus()
{
  return &type metadata for NetworkStatus;
}

unint64_t sub_10002C52C()
{
  unint64_t result = qword_10006CAB0;
  if (!qword_10006CAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAB0);
  }
  return result;
}

void *sub_10002C578()
{
  uint64_t v1 = sub_100054168();
  sub_10000E978();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100019474();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_100054148();
  __chkstk_darwin(v8);
  sub_100019474();
  uint64_t v9 = sub_100053788();
  __chkstk_darwin(v9 - 8);
  sub_100019474();
  v0[2] = 0;
  sub_10000DD58();
  sub_100053778();
  sub_10002C8F0(&qword_10006CAB8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000068D8(&qword_10006CAC0);
  sub_10002C938(&qword_10006CAC8, &qword_10006CAC0);
  sub_1000542B8();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  v0[3] = sub_100054198();
  v0[5] = 0;
  swift_unknownObjectWeakInit();
  return v0;
}

uint64_t sub_10002C790()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002C7C8(uint64_t a1)
{
  return sub_10002BCDC(a1);
}

uint64_t sub_10002C7D0()
{
  uint64_t v1 = sub_100053748();
  sub_10000E978();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_10002C874()
{
  sub_100053748();

  return sub_10002C168();
}

uint64_t sub_10002C8D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C8E8()
{
  return swift_release();
}

uint64_t sub_10002C8F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002C938(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000E47C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10002C988(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      uint64_t v8 = (int *)type metadata accessor for PosterDataModel(0);
      uint64_t v9 = v8[6];
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_100053248();
      unint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      uint64_t v14 = v8[7];
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_100053198();
      if (sub_100007FE8((uint64_t)v16, 1, v17))
      {
        uint64_t v18 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
        memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
        sub_100008010((uint64_t)v15, 0, 1, v17);
      }
      uint64_t v20 = v8[8];
      __n128 v21 = (char *)a1 + v20;
      __n128 v22 = (char *)a2 + v20;
      if (sub_100007FE8((uint64_t)a2 + v20, 1, v17))
      {
        uint64_t v23 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
        memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v21, v22, v17);
        sub_100008010((uint64_t)v21, 0, 1, v17);
      }
      uint64_t v24 = v8[9];
      uint64_t v25 = (char *)a1 + v24;
      uint64_t v26 = (char *)a2 + v24;
      uint64_t v27 = sub_100053C68();
      if (sub_100007FE8((uint64_t)v26, 1, v27))
      {
        uint64_t v28 = sub_1000068D8(&qword_10006BE78);
        memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        sub_100008010((uint64_t)v25, 0, 1, v27);
      }
      *(void *)((char *)a1 + v8[10]) = *(void *)((char *)a2 + v8[10]);
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t type metadata accessor for PosterDataModel(uint64_t a1)
{
  return sub_100033940(a1, qword_10006CBD0);
}

uint64_t sub_10002CCE0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = (int *)type metadata accessor for PosterDataModel(0);
    uint64_t v4 = a1 + v3[6];
    uint64_t v5 = sub_100053248();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    uint64_t v6 = a1 + v3[7];
    uint64_t v7 = sub_100053198();
    if (!sub_100007FE8(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    }
    uint64_t v8 = a1 + v3[8];
    if (!sub_100007FE8(v8, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v8, v7);
    }
    uint64_t v9 = a1 + v3[9];
    uint64_t v10 = sub_100053C68();
    if (!sub_100007FE8(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_10002CE8C(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    uint64_t v7 = (int *)type metadata accessor for PosterDataModel(0);
    uint64_t v8 = v7[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100053248();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = v7[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100053198();
    if (sub_100007FE8((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
      sub_100008010((uint64_t)v14, 0, 1, v16);
    }
    uint64_t v18 = v7[8];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    if (sub_100007FE8((uint64_t)a2 + v18, 1, v16))
    {
      uint64_t v21 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v19, v20, v16);
      sub_100008010((uint64_t)v19, 0, 1, v16);
    }
    uint64_t v22 = v7[9];
    uint64_t v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = sub_100053C68();
    if (sub_100007FE8((uint64_t)v24, 1, v25))
    {
      uint64_t v26 = sub_1000068D8(&qword_10006BE78);
      memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      sub_100008010((uint64_t)v23, 0, 1, v25);
    }
    *(void *)((char *)a1 + v7[10]) = *(void *)((char *)a2 + v7[10]);
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10002D180(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10003356C((uint64_t)a1, (void (*)(void))type metadata accessor for PosterData);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      uint64_t v6 = (int *)type metadata accessor for PosterDataModel(0);
      uint64_t v7 = v6[6];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_100053248();
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
      swift_bridgeObjectRetain();
      v11(v8, v9, v10);
      uint64_t v12 = v6[7];
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_100053198();
      if (sub_100007FE8((uint64_t)v14, 1, v15))
      {
        uint64_t v16 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
        memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        sub_100008010((uint64_t)v13, 0, 1, v15);
      }
      uint64_t v17 = v6[8];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      if (sub_100007FE8((uint64_t)a2 + v17, 1, v15))
      {
        uint64_t v20 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v18, v19, v15);
        sub_100008010((uint64_t)v18, 0, 1, v15);
      }
      uint64_t v21 = v6[9];
      uint64_t v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      uint64_t v24 = sub_100053C68();
      if (sub_100007FE8((uint64_t)v23, 1, v24))
      {
        uint64_t v25 = sub_1000068D8(&qword_10006BE78);
        memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
        sub_100008010((uint64_t)v22, 0, 1, v24);
      }
      *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t type metadata accessor for PosterData(uint64_t a1)
{
  return sub_100033940(a1, qword_10006CB40);
}

_OWORD *sub_10002D4C0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    long long v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = (int *)type metadata accessor for PosterDataModel(0);
    uint64_t v8 = v7[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100053248();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    uint64_t v12 = v7[7];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_100053198();
    if (sub_100007FE8((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      sub_100008010((uint64_t)v13, 0, 1, v15);
    }
    uint64_t v17 = v7[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    if (sub_100007FE8((uint64_t)a2 + v17, 1, v15))
    {
      uint64_t v20 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v18, v19, v15);
      sub_100008010((uint64_t)v18, 0, 1, v15);
    }
    uint64_t v21 = v7[9];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = sub_100053C68();
    if (sub_100007FE8((uint64_t)v23, 1, v24))
    {
      uint64_t v25 = sub_1000068D8(&qword_10006BE78);
      memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
      sub_100008010((uint64_t)v22, 0, 1, v24);
    }
    *(void *)((char *)a1 + v7[10]) = *(void *)((char *)a2 + v7[10]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_10002D794(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10003356C((uint64_t)a1, (void (*)(void))type metadata accessor for PosterData);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = (int *)type metadata accessor for PosterDataModel(0);
      uint64_t v8 = v7[6];
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_100053248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      uint64_t v12 = v7[7];
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = sub_100053198();
      if (sub_100007FE8((uint64_t)v14, 1, v15))
      {
        uint64_t v16 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
        memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
        sub_100008010((uint64_t)v13, 0, 1, v15);
      }
      uint64_t v17 = v7[8];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      if (sub_100007FE8((uint64_t)a2 + v17, 1, v15))
      {
        uint64_t v20 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v18, v19, v15);
        sub_100008010((uint64_t)v18, 0, 1, v15);
      }
      uint64_t v21 = v7[9];
      uint64_t v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      uint64_t v24 = sub_100053C68();
      if (sub_100007FE8((uint64_t)v23, 1, v24))
      {
        uint64_t v25 = sub_1000068D8(&qword_10006BE78);
        memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
        sub_100008010((uint64_t)v22, 0, 1, v24);
      }
      *(void *)((char *)a1 + v7[10]) = *(void *)((char *)a2 + v7[10]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10002DA8C()
{
  uint64_t result = type metadata accessor for PosterDataModel(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_10002DB20(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    uint64_t v8 = a3[6];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_100053248();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100053198();
    if (sub_100007FE8((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
      sub_100008010((uint64_t)v14, 0, 1, v16);
    }
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)v4 + v19;
    uint64_t v21 = (char *)a2 + v19;
    if (sub_100007FE8((uint64_t)a2 + v19, 1, v16))
    {
      uint64_t v22 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v20, v21, v16);
      sub_100008010((uint64_t)v20, 0, 1, v16);
    }
    uint64_t v23 = a3[9];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_100053C68();
    if (sub_100007FE8((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = sub_1000068D8(&qword_10006BE78);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
      sub_100008010((uint64_t)v24, 0, 1, v26);
    }
    *(void *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_10002DE10(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_100053248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = sub_100053198();
  if (!sub_100007FE8(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  uint64_t v8 = a1 + a2[8];
  if (!sub_100007FE8(v8, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v8, v7);
  }
  uint64_t v9 = a1 + a2[9];
  uint64_t v10 = sub_100053C68();
  if (!sub_100007FE8(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002DF98(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100053248();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_100053198();
  if (sub_100007FE8((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    sub_100008010((uint64_t)v13, 0, 1, v15);
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  if (sub_100007FE8(a2 + v17, 1, v15))
  {
    uint64_t v20 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v18, v19, v15);
    sub_100008010((uint64_t)v18, 0, 1, v15);
  }
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  uint64_t v24 = sub_100053C68();
  if (sub_100007FE8((uint64_t)v23, 1, v24))
  {
    uint64_t v25 = sub_1000068D8(&qword_10006BE78);
    memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    sub_100008010((uint64_t)v22, 0, 1, v24);
  }
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10002E238(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100053248();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100053198();
  int v14 = sub_100007FE8((uint64_t)v11, 1, v13);
  int v15 = sub_100007FE8((uint64_t)v12, 1, v13);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      sub_100008010((uint64_t)v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = *(void *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
LABEL_6:
    uint64_t v17 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  int v21 = sub_100007FE8((uint64_t)a1 + v18, 1, v13);
  int v22 = sub_100007FE8((uint64_t)v20, 1, v13);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v19, v20, v13);
      sub_100008010((uint64_t)v19, 0, 1, v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v23 = *(void *)(v13 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v13);
LABEL_12:
    uint64_t v24 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v19, v20, v13);
LABEL_13:
  uint64_t v25 = a3[9];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  uint64_t v28 = sub_100053C68();
  int v29 = sub_100007FE8((uint64_t)v26, 1, v28);
  int v30 = sub_100007FE8((uint64_t)v27, 1, v28);
  if (!v29)
  {
    uint64_t v31 = *(void *)(v28 - 8);
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 24))(v26, v27, v28);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v28);
    goto LABEL_18;
  }
  if (v30)
  {
LABEL_18:
    uint64_t v32 = sub_1000068D8(&qword_10006BE78);
    memcpy(v26, v27, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  sub_100008010((uint64_t)v26, 0, 1, v28);
LABEL_19:
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_10002E670(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100053248();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100053198();
  if (sub_100007FE8((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
    sub_100008010((uint64_t)v12, 0, 1, v14);
  }
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  if (sub_100007FE8((uint64_t)a2 + v16, 1, v14))
  {
    uint64_t v19 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v17, v18, v14);
    sub_100008010((uint64_t)v17, 0, 1, v14);
  }
  uint64_t v20 = a3[9];
  int v21 = (char *)a1 + v20;
  int v22 = (char *)a2 + v20;
  uint64_t v23 = sub_100053C68();
  if (sub_100007FE8((uint64_t)v22, 1, v23))
  {
    uint64_t v24 = sub_1000068D8(&qword_10006BE78);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
    sub_100008010((uint64_t)v21, 0, 1, v23);
  }
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

uint64_t sub_10002E8E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100053248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_100053198();
  int v15 = sub_100007FE8((uint64_t)v12, 1, v14);
  int v16 = sub_100007FE8((uint64_t)v13, 1, v14);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
      sub_100008010((uint64_t)v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v17 = *(void *)(v14 - 8);
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v12, v14);
LABEL_6:
    uint64_t v18 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v17 + 40))(v12, v13, v14);
LABEL_7:
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  int v21 = (const void *)(a2 + v19);
  int v22 = sub_100007FE8(a1 + v19, 1, v14);
  int v23 = sub_100007FE8((uint64_t)v21, 1, v14);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v20, v21, v14);
      sub_100008010((uint64_t)v20, 0, 1, v14);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v24 = *(void *)(v14 - 8);
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v24 + 8))(v20, v14);
LABEL_12:
    uint64_t v25 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v24 + 40))(v20, v21, v14);
LABEL_13:
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (const void *)(a2 + v26);
  uint64_t v29 = sub_100053C68();
  int v30 = sub_100007FE8((uint64_t)v27, 1, v29);
  int v31 = sub_100007FE8((uint64_t)v28, 1, v29);
  if (!v30)
  {
    uint64_t v32 = *(void *)(v29 - 8);
    if (!v31)
    {
      (*(void (**)(void *, const void *, uint64_t))(v32 + 40))(v27, v28, v29);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v27, v29);
    goto LABEL_18;
  }
  if (v31)
  {
LABEL_18:
    uint64_t v33 = sub_1000068D8(&qword_10006BE78);
    memcpy(v27, v28, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
  sub_100008010((uint64_t)v27, 0, 1, v29);
LABEL_19:
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002ED00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002ED14);
}

uint64_t sub_10002ED14(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_100053248();
    sub_10000F86C();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a3[6];
    }
    else
    {
      sub_1000068D8((uint64_t *)&unk_10006C4C0);
      sub_10000F86C();
      if (*(_DWORD *)(v13 + 84) == a2)
      {
        uint64_t v10 = v12;
        uint64_t v11 = a3[7];
      }
      else
      {
        uint64_t v10 = sub_1000068D8(&qword_10006BE78);
        uint64_t v11 = a3[9];
      }
    }
    return sub_100007FE8(a1 + v11, a2, v10);
  }
}

uint64_t sub_10002EDEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002EE00);
}

uint64_t sub_10002EE00(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_100053248();
    sub_10000F86C();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a4[6];
    }
    else
    {
      sub_1000068D8((uint64_t *)&unk_10006C4C0);
      sub_10000F86C();
      if (*(_DWORD *)(v13 + 84) == a3)
      {
        uint64_t v10 = v12;
        uint64_t v11 = a4[7];
      }
      else
      {
        uint64_t v10 = sub_1000068D8(&qword_10006BE78);
        uint64_t v11 = a4[9];
      }
    }
    return sub_100008010(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_10002EED4()
{
  sub_100053248();
  if (v0 <= 0x3F)
  {
    sub_100009B14(319, (unint64_t *)&qword_10006BEE8, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F)
    {
      sub_100009B14(319, (unint64_t *)&unk_10006BEF0, (void (*)(uint64_t))&type metadata accessor for BackgroundMoonData);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_10002F030@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100036504();
  sub_100033974(v5, v6, v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100033B5C((uint64_t)v4, a1, (void (*)(void))type metadata accessor for PosterDataModel);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v9 = type metadata accessor for PosterDataModel(0);
  return sub_100008010(a1, v8, 1, v9);
}

uint64_t sub_10002F11C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PosterDataModel(0);
  uint64_t v3 = sub_10000AFD4(v2);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v6);
  sub_100019474();
  uint64_t v9 = (unsigned char *)(v8 - v7);
  sub_100033974(v1, v8 - v7, (void (*)(void))type metadata accessor for PosterData);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100036504();
    sub_100033B5C(v10, v11, v12);
    uint64_t v13 = sub_100032538();
    sub_10003356C((uint64_t)v5, (void (*)(void))type metadata accessor for PosterDataModel);
  }
  else
  {
    uint64_t v13 = 0xD000000000000014;
    switch(*v9)
    {
      case 1:
        uint64_t v13 = 0x4F6B726F7774656ELL;
        break;
      case 2:
        uint64_t v13 = 0x617461446F6ELL;
        break;
      default:
        return v13;
    }
  }
  return v13;
}

unint64_t sub_10002F2DC(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4F6B726F7774656ELL;
      break;
    case 2:
      unint64_t result = 0x617461446F6ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002F378(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100065E70;
  v6._object = a2;
  unint64_t v4 = sub_100054448(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

Swift::Int sub_10002F3C4()
{
  return sub_10002B994();
}

uint64_t sub_10002F3CC()
{
  return sub_100027370();
}

Swift::Int sub_10002F3D4()
{
  return sub_100027518();
}

uint64_t sub_10002F3DC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002F378(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10002F40C()
{
  char v1 = sub_100036530();
  unint64_t result = sub_10002F2DC(v1);
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
}

uint64_t sub_10002F434()
{
  return sub_100053F98();
}

uint64_t sub_10002F494()
{
  return sub_100053F88();
}

uint64_t sub_10002F4E4(unsigned __int8 *a1, char *a2)
{
  return sub_10000FF0C(*a1, *a2);
}

uint64_t sub_10002F4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v4 = sub_100053E38();
  sub_10000E978();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_1000363EC();
  uint64_t v7 = (int *)type metadata accessor for PosterDataModel.DataPoint(v6);
  sub_10000E978();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_1000363D0();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = *(void *)(a1 + *(int *)(type metadata accessor for PosterDataModel(0) + 40));
  if (*(void *)(v14 + 16))
  {
    uint64_t v27 = v4;
    uint64_t v28 = v9;
    uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
    uint64_t v29 = type metadata accessor for PosterDataModel.DataPoint;
    sub_100033974(v14 + ((v15 + 32) & ~v15), (uint64_t)v13, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
    sub_100053AB8();
    sub_100053198();
    sub_10000AFB4();
    sub_1000195C0();
    v16();
    sub_1000533B8();
    sub_10000AFB4();
    sub_1000195C0();
    v17();
    uint64_t v18 = *(void *)&v13[v7[6]];
    uint64_t v19 = *(void *)&v13[v7[7]];
    sub_100053C28();
    sub_10000AFB4();
    sub_1000195C0();
    v20();
    sub_1000364C0();
    v21();
    sub_100053E28();
    *(void *)(v2 + v7[6]) = v18;
    *(void *)(v2 + v7[7]) = v19;
    *(unsigned char *)(v2 + v7[10]) = v22 > 0.0;
    sub_1000068D8(&qword_10006C0A8);
    uint64_t v23 = *(void *)(v28 + 72);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100055DD0;
    uint64_t v24 = v14 + ((v15 + 32) & ~v15);
    sub_100033974((uint64_t)v13, v24, (void (*)(void))v29);
    sub_100033B5C(v2, v24 + v23, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
    sub_100036474();
    v25();
    sub_10003356C((uint64_t)v13, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v14;
}

uint64_t sub_10002F7F4(double a1)
{
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006D940);
  uint64_t v5 = sub_10000AFD4(v4);
  __chkstk_darwin(v5);
  sub_1000362FC();
  uint64_t v6 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v7 = sub_10000AFD4(v6);
  __chkstk_darwin(v7);
  sub_1000363EC();
  uint64_t v8 = sub_100053198();
  sub_10000E978();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_1000363D0();
  __chkstk_darwin(v12);
  sub_100018F48(v1, v2, (uint64_t *)&unk_10006D940);
  uint64_t v13 = type metadata accessor for PosterDataModel.DataPoint(0);
  if (sub_100007FE8(v2, 1, v13) == 1)
  {
    sub_10000AE4C(v2, (uint64_t *)&unk_10006D940);
    sub_100008010(v1, 1, 1, v8);
LABEL_4:
    sub_10000AE4C(v1, (uint64_t *)&unk_10006C4C0);
    return 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v1, v2, v8);
  sub_10003356C(v2, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
  sub_100008010(v1, 0, 1, v8);
  if (sub_100007FE8(v1, 1, v8) == 1) {
    goto LABEL_4;
  }
  uint64_t v15 = sub_100036504();
  v16(v15);
  sub_100053188();
  sub_100053118();
  double v18 = v17;
  uint64_t v19 = *(void (**)(void))(v10 + 8);
  sub_100036388();
  v19();
  if (v18 >= a1)
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_100053568();
    sub_10000E284(v28, (uint64_t)qword_1000708C8);
    uint64_t v29 = sub_100053548();
    os_log_type_t v30 = sub_100054118();
    if (os_log_type_enabled(v29, v30))
    {
      swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      sub_100036364(v31, 4.8752e-34);
      sub_1000540C8();
      sub_100036314();
      uint64_t v32 = sub_1000363B4();
      sub_1000362D8(v32);
      swift_bridgeObjectRelease();
      sub_100036394();
      sub_1000540C8();
      sub_100036314();
      uint64_t v33 = sub_1000363B4();
      sub_1000362D8(v33);
      swift_bridgeObjectRelease();
      sub_1000364E4((void *)&_mh_execute_header, v34, v35, "Data point requires update; age=%{public}s, maxAge=%{public}s");
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }

    sub_100036388();
    v19();
    return 1;
  }
  if (qword_10006BB58 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100053568();
  sub_10000E284(v20, (uint64_t)qword_1000708C8);
  int v21 = sub_100053548();
  os_log_type_t v22 = sub_100054118();
  if (os_log_type_enabled(v21, v22))
  {
    swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    sub_100036364(v23, 4.8752e-34);
    sub_1000540C8();
    sub_100036314();
    uint64_t v24 = sub_1000363B4();
    sub_1000362D8(v24);
    swift_bridgeObjectRelease();
    sub_100036394();
    sub_1000540C8();
    sub_100036314();
    uint64_t v25 = sub_1000363B4();
    sub_1000362D8(v25);
    swift_bridgeObjectRelease();
    sub_1000364E4((void *)&_mh_execute_header, v26, v27, "Data point does not require update; age=%{public}s, maxAge=%{public}s");
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }

  sub_100036388();
  v19();
  return 0;
}

uint64_t sub_10002FCC4(void *a1)
{
  type metadata accessor for PosterDataModel(0);
  sub_10000AFB4();
  __chkstk_darwin(v5);
  sub_1000362FC();
  type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v6);
  sub_100036408();
  uint64_t v7 = sub_1000068D8(&qword_10006CC48);
  sub_10000E978();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_1000194F0();
  sub_100033A80(a1, a1[3]);
  sub_100033AC4();
  sub_100054618();
  sub_100033974(v12, v3, (void (*)(void))type metadata accessor for PosterData);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100033B5C(v3, v1, (void (*)(void))type metadata accessor for PosterDataModel);
    sub_1000338D8(&qword_10006CC50, (void (*)(uint64_t))type metadata accessor for PosterDataModel);
    sub_1000544D8();
    sub_10003356C(v1, (void (*)(void))type metadata accessor for PosterDataModel);
  }
  else
  {
    sub_100033BB8();
    sub_1000544D8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
}

uint64_t sub_10002FF18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = sub_1000068D8(&qword_10006C4A0);
  uint64_t v7 = sub_10000AFD4(v6);
  __chkstk_darwin(v7);
  sub_10000AF50();
  uint64_t v17 = v8;
  uint64_t v9 = sub_10000AFE0();
  uint64_t v18 = type metadata accessor for PosterDataModel(v9);
  sub_10000AFB4();
  __chkstk_darwin(v10);
  sub_1000194D8();
  sub_1000068D8(&qword_10006CC28);
  sub_10000E978();
  __chkstk_darwin(v11);
  sub_100019474();
  type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v12);
  sub_100026F74();
  sub_100033A80(a1, a1[3]);
  sub_100033AC4();
  sub_100054608();
  if (!v2)
  {
    sub_1000338D8(&qword_10006CC38, (void (*)(uint64_t))type metadata accessor for PosterDataModel);
    sub_100054498();
    sub_100008010(v17, 0, 1, v18);
    sub_10000B02C();
    v14(v13);
    sub_100033B5C(v17, v4, (void (*)(void))type metadata accessor for PosterDataModel);
    sub_100033B5C(v4, v3, (void (*)(void))type metadata accessor for PosterDataModel);
    swift_storeEnumTagMultiPayload();
    sub_100033B5C(v3, a2, (void (*)(void))type metadata accessor for PosterData);
  }
  return sub_100019004((uint64_t)a1);
}

uint64_t sub_100030318(uint64_t a1, void *a2)
{
  v7._countAndFlagsBits = a1;
  v3._rawValue = &off_100065EF0;
  v7._object = a2;
  Swift::Int v4 = sub_100054448(v3, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_100030370()
{
  return 2;
}

uint64_t sub_100030378()
{
  return 0;
}

uint64_t sub_100030384(char a1)
{
  if (a1) {
    return 1635017060;
  }
  else {
    return 0x726F727265;
  }
}

uint64_t sub_1000303B0(char *a1, char *a2)
{
  return sub_100010074(*a1, *a2);
}

Swift::Int sub_1000303BC()
{
  return sub_10002B9DC();
}

uint64_t sub_1000303C4()
{
  return sub_100027440();
}

Swift::Int sub_1000303CC()
{
  return sub_1000274A4();
}

uint64_t sub_1000303D4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100030318(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100030404()
{
  char v1 = sub_100036530();
  uint64_t result = sub_100030384(v1);
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
}

uint64_t sub_10003042C()
{
  return sub_100030384(*v0);
}

uint64_t sub_100030434@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10003036C();
  *a1 = result;
  return result;
}

uint64_t sub_10003045C()
{
  return sub_100030378();
}

uint64_t sub_10003047C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100030370();
  *a1 = result;
  return result;
}

uint64_t sub_1000304A4(uint64_t a1)
{
  unint64_t v2 = sub_100033AC4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000304E0(uint64_t a1)
{
  unint64_t v2 = sub_100033AC4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10003051C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002FF18(a1, a2);
}

uint64_t sub_100030534(void *a1)
{
  return sub_10002FCC4(a1);
}

uint64_t sub_10003054C(void *a1)
{
  uint64_t v3 = v1;
  sub_1000068D8(&qword_10006CC98);
  sub_10000E978();
  __chkstk_darwin(v5);
  sub_100033A80(a1, a1[3]);
  sub_100033C04();
  sub_100036510();
  sub_100053198();
  sub_1000338D8(&qword_10006CCA0, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_100036334();
  if (!v2)
  {
    uint64_t v6 = type metadata accessor for PosterDataModel.DataPoint(0);
    sub_1000533B8();
    sub_1000338D8(&qword_10006CCA8, (void (*)(uint64_t))&type metadata accessor for WeatherCondition);
    sub_100036334();
    sub_100036450(2);
    sub_100036450(3);
    sub_100053C28();
    sub_1000338D8(&qword_10006CCB0, (void (*)(uint64_t))&type metadata accessor for CloudAltitudeKind);
    sub_100036334();
    sub_100053E28();
    sub_100033C9C();
    sub_100036334();
    char v7 = sub_100053E18();
    sub_100036550(v7 & 1);
    sub_100036550(*(unsigned __int8 *)(v3 + *(int *)(v6 + 40)));
  }
  sub_100036388();
  return v8();
}

uint64_t sub_100030824@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100053E38();
  sub_10000E978();
  uint64_t v31 = v4;
  uint64_t v32 = v5;
  __chkstk_darwin(v4);
  sub_10000AF50();
  uint64_t v30 = v6;
  uint64_t v7 = sub_1000068D8(&qword_10006CC60);
  uint64_t v8 = sub_10000AFD4(v7);
  __chkstk_darwin(v8);
  sub_10000AF50();
  uint64_t v33 = v9;
  sub_10000AFE0();
  uint64_t v34 = sub_100053C28();
  sub_10000E978();
  __chkstk_darwin(v10);
  sub_10000AF50();
  sub_10000AFE0();
  sub_1000533B8();
  sub_10000E978();
  __chkstk_darwin(v11);
  sub_100036408();
  uint64_t v12 = sub_100053198();
  sub_10000E978();
  uint64_t v35 = v13;
  __chkstk_darwin(v14);
  sub_1000194F0();
  sub_1000068D8(&qword_10006CC68);
  sub_10000E978();
  __chkstk_darwin(v15);
  sub_100026F74();
  sub_100033A80(a1, a1[3]);
  sub_100033C04();
  sub_100054608();
  if (v36) {
    return sub_100019004((uint64_t)a1);
  }
  sub_1000338D8(&qword_10006CC78, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_100054498();
  sub_1000338D8(&qword_10006CC80, (void (*)(uint64_t))&type metadata accessor for WeatherCondition);
  sub_100054498();
  sub_1000364A0(2);
  uint64_t v17 = v16;
  sub_1000364A0(3);
  uint64_t v19 = v18;
  sub_1000338D8(&qword_10006CC88, (void (*)(uint64_t))&type metadata accessor for CloudAltitudeKind);
  sub_100054458();
  if (sub_100007FE8(v33, 1, v34) == 1)
  {
    sub_1000364C0();
    v21();
    sub_10000AE4C(v33, &qword_10006CC60);
  }
  else
  {
    sub_1000364C0();
    v22();
  }
  sub_100033C50();
  sub_100054498();
  sub_100054478();
  sub_100053E48();
  char v23 = sub_100054478();
  uint64_t v24 = sub_10003634C();
  v25(v24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(a2, v2, v12);
  uint64_t v26 = (int *)type metadata accessor for PosterDataModel.DataPoint(0);
  sub_10000E994();
  v27();
  *(void *)(a2 + v26[6]) = v17;
  *(void *)(a2 + v26[7]) = v19;
  sub_10000E994();
  v28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(a2 + v26[9], v30, v31);
  *(unsigned char *)(a2 + v26[10]) = v23 & 1;
  return sub_100019004((uint64_t)a1);
}

uint64_t sub_100030ED4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100065F40;
  v6._object = a2;
  unint64_t v4 = sub_100054448(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

uint64_t sub_100030F24()
{
  return 8;
}

uint64_t sub_100030F2C(char a1)
{
  uint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x7469646E6F63;
      goto LABEL_9;
    case 2:
      uint64_t result = 0x65657053646E6977;
      break;
    case 3:
      uint64_t result = 0x766F4364756F6C63;
      break;
    case 4:
      uint64_t result = 0x6E694B64756F6C63;
      break;
    case 5:
      uint64_t result = 0xD000000000000010;
      break;
    case 6:
      uint64_t v3 = 0x746176656C65;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6F69000000000000;
      break;
    case 7:
      uint64_t result = 0x67696C7961447369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10003104C(char a1)
{
  uint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x7469646E6F63;
      goto LABEL_9;
    case 2:
      uint64_t result = 0x65657053646E6977;
      break;
    case 3:
      uint64_t result = 0x766F4364756F6C63;
      break;
    case 4:
      uint64_t result = 0x6E694B64756F6C63;
      break;
    case 5:
      uint64_t result = 0xD000000000000010;
      break;
    case 6:
      uint64_t v3 = 0x746176656C65;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6F69000000000000;
      break;
    case 7:
      uint64_t result = 0x67696C7961447369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10003116C(unsigned __int8 *a1, char *a2)
{
  return sub_10000FC88(*a1, *a2);
}

Swift::Int sub_100031178()
{
  return sub_10002B9E8(*v0);
}

uint64_t sub_100031180()
{
  return sub_10002721C();
}

Swift::Int sub_100031188(uint64_t a1)
{
  return sub_10002755C(a1, *v1);
}

uint64_t sub_100031190@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100030ED4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000311C0()
{
  char v1 = sub_100036530();
  uint64_t result = sub_100030F2C(v1);
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
}

uint64_t sub_1000311E8()
{
  return sub_10003104C(*v0);
}

uint64_t sub_1000311F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100030F20();
  *a1 = result;
  return result;
}

uint64_t sub_100031218@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100030F24();
  *a1 = result;
  return result;
}

uint64_t sub_100031240(uint64_t a1)
{
  unint64_t v2 = sub_100033C04();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003127C(uint64_t a1)
{
  unint64_t v2 = sub_100033C04();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000312B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100030824(a1, a2);
}

uint64_t sub_1000312D0(void *a1)
{
  return sub_10003054C(a1);
}

uint64_t sub_1000312E8(void *a1)
{
  uint64_t v3 = v1;
  sub_1000068D8(&qword_10006CD08);
  sub_10000E978();
  __chkstk_darwin(v5);
  sub_100033A80(a1, a1[3]);
  sub_100033CE8();
  sub_100036510();
  sub_100036480(*v3, v3[1]);
  if (!v2)
  {
    type metadata accessor for CLLocationCoordinate2D(0);
    sub_1000338D8(&qword_10006CD10, type metadata accessor for CLLocationCoordinate2D);
    sub_100036334();
    type metadata accessor for PosterDataModel(0);
    uint64_t v9 = sub_100053208();
    sub_100036480(v9, v10);
    swift_bridgeObjectRelease();
    sub_1000068D8((uint64_t *)&unk_10006C4C0);
    sub_100034188(&qword_10006CD18, &qword_10006CCA0);
    sub_100036570();
    sub_100036334();
    sub_100036334();
    sub_1000068D8(&qword_10006BE78);
    sub_10003421C();
    sub_100036570();
    sub_100036334();
    sub_1000068D8(&qword_10006CD30);
    sub_1000342C0();
    sub_100036334();
  }
  uint64_t v6 = sub_10003653C();
  return v7(v6);
}

uint64_t sub_1000315B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v78 = a2;
  uint64_t v5 = sub_1000068D8((uint64_t *)&unk_10006D940);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_10000AF50();
  uint64_t v71 = v7;
  uint64_t v8 = sub_10000AFE0();
  uint64_t v73 = type metadata accessor for PosterDataModel.DataPoint(v8);
  sub_10000E978();
  uint64_t v70 = v9;
  __chkstk_darwin(v10);
  sub_10000AFF8();
  uint64_t v72 = v11;
  sub_100019448();
  __chkstk_darwin(v12);
  uint64_t v69 = (uint64_t)v61 - v13;
  uint64_t v14 = sub_1000068D8(&qword_10006CCC0);
  uint64_t v67 = *(void *)(v14 - 8);
  __chkstk_darwin(v14 - 8);
  sub_10000AF50();
  uint64_t v74 = v15;
  uint64_t v16 = sub_1000068D8(&qword_10006BE78);
  uint64_t v17 = sub_10000AFD4(v16);
  __chkstk_darwin(v17);
  sub_10000AF50();
  uint64_t v68 = v18;
  unsigned int v76 = (void *)sub_1000068D8((uint64_t *)&unk_10006C4C0);
  sub_10000AFB4();
  __chkstk_darwin(v19);
  sub_10000AFF8();
  uint64_t v75 = v20;
  sub_100019448();
  __chkstk_darwin(v21);
  uint64_t v77 = (uint64_t)v61 - v22;
  uint64_t v23 = sub_1000068D8(&qword_10006C0A0);
  uint64_t v24 = sub_10000AFD4(v23);
  __chkstk_darwin(v24);
  sub_100036420();
  uint64_t v25 = sub_100053248();
  sub_10000E978();
  uint64_t v79 = v26;
  __chkstk_darwin(v27);
  sub_100019474();
  uint64_t v30 = v29 - v28;
  uint64_t v31 = sub_1000068D8(&qword_10006CCC8);
  sub_10000E978();
  __chkstk_darwin(v32);
  sub_1000362FC();
  uint64_t v33 = a1[3];
  uint64_t v80 = a1;
  sub_100033A80(a1, v33);
  sub_100033CE8();
  uint64_t v34 = v81;
  sub_100054608();
  if (!v34)
  {
    uint64_t v65 = v2;
    uint64_t v81 = v30;
    uint64_t v66 = v25;
    uint64_t v36 = v78;
    uint64_t v35 = v79;
    LOBYTE(v83) = 0;
    uint64_t v37 = sub_100054468();
    uint64_t v39 = v38;
    uint64_t v64 = v37;
    type metadata accessor for CLLocationCoordinate2D(0);
    LOBYTE(v85) = 1;
    sub_1000338D8(&qword_10006CCD8, type metadata accessor for CLLocationCoordinate2D);
    sub_100054498();
    uint64_t v40 = v83;
    uint64_t v41 = v84;
    LOBYTE(v85) = 2;
    sub_100054468();
    uint64_t v63 = v31;
    uint64_t v43 = v65;
    sub_1000531F8();
    swift_bridgeObjectRelease();
    uint64_t v44 = v66;
    int v45 = sub_100007FE8(v43, 1, v66);
    uint64_t v62 = v39;
    if (v45 == 1)
    {
      sub_100053238();
      sub_10000AE4C(v43, &qword_10006C0A0);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v81, v43, v44);
    }
    LOBYTE(v85) = 3;
    sub_100034188(&qword_10006CCE0, &qword_10006CC78);
    sub_100054498();
    LOBYTE(v85) = 4;
    sub_100054498();
    sub_100053C68();
    LOBYTE(v85) = 5;
    sub_1000338D8(&qword_10006CCE8, (void (*)(uint64_t))&type metadata accessor for BackgroundMoonData);
    sub_100036438();
    sub_100054458();
    sub_1000068D8(&qword_10006CCF0);
    char v82 = 6;
    sub_100033D34();
    sub_100036438();
    sub_100054498();
    uint64_t v65 = v3;
    uint64_t v46 = *(void *)(v85 + 16);
    if (v46)
    {
      uint64_t v47 = v85 + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80));
      uint64_t v67 = *(void *)(v67 + 72);
      v61[1] = v85;
      swift_bridgeObjectRetain();
      unsigned int v76 = &_swiftEmptyArrayStorage;
      uint64_t v48 = v71;
      uint64_t v49 = v74;
      do
      {
        sub_100018F48(v47, v49, &qword_10006CCC0);
        sub_100018F48(v49, v48, (uint64_t *)&unk_10006D940);
        sub_10000AE4C(v49, &qword_10006CCC0);
        if (sub_100007FE8(v48, 1, v73) == 1)
        {
          sub_10000AE4C(v48, (uint64_t *)&unk_10006D940);
        }
        else
        {
          uint64_t v50 = v69;
          sub_100033B5C(v48, v69, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
          sub_100033B5C(v50, v72, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unsigned int v76 = (void *)sub_100033DFC(0, v76[2] + 1, 1, (uint64_t)v76);
          }
          uint64_t v51 = v70;
          unint64_t v53 = v76[2];
          unint64_t v52 = v76[3];
          if (v53 >= v52 >> 1)
          {
            uint64_t v55 = (void *)sub_100033DFC(v52 > 1, v53 + 1, 1, (uint64_t)v76);
            uint64_t v51 = v70;
            unsigned int v76 = v55;
          }
          uint64_t v54 = v76;
          v76[2] = v53 + 1;
          sub_100033B5C(v72, (uint64_t)v54+ ((*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80))+ *(void *)(v51 + 72) * v53, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
          uint64_t v48 = v71;
        }
        v47 += v67;
        --v46;
        uint64_t v49 = v74;
      }
      while (v46);
      swift_bridgeObjectRelease_n();
      uint64_t v56 = v68;
      uint64_t v36 = v78;
    }
    else
    {
      swift_bridgeObjectRelease();
      unsigned int v76 = &_swiftEmptyArrayStorage;
      uint64_t v56 = v68;
    }
    sub_100036474();
    v57();
    uint64_t v58 = v62;
    uint64_t *v36 = v64;
    v36[1] = v58;
    v36[2] = v40;
    v36[3] = v41;
    uint64_t v59 = (int *)type metadata accessor for PosterDataModel(0);
    sub_10000E994();
    v60();
    sub_10000E5CC(v77, (uint64_t)v36 + v59[7], (uint64_t *)&unk_10006C4C0);
    sub_10000E5CC(v75, (uint64_t)v36 + v59[8], (uint64_t *)&unk_10006C4C0);
    sub_10000E5CC(v56, (uint64_t)v36 + v59[9], &qword_10006BE78);
    *(uint64_t *)((char *)v36 + v59[10]) = (uint64_t)v76;
  }
  return sub_100019004((uint64_t)v80);
}

uint64_t sub_100031F0C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100066020;
  v6._object = a2;
  unint64_t v4 = sub_100054448(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_100031F5C()
{
  return 7;
}

unint64_t sub_100031F64(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x616E6964726F6F63;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x657369726E7573;
      break;
    case 4:
      unint64_t result = 0x7465736E7573;
      break;
    case 5:
      unint64_t result = 0x617461446E6F6F6DLL;
      break;
    case 6:
      unint64_t result = 0x4472656874616577;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10003205C(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x616E6964726F6F63;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x657369726E7573;
      break;
    case 4:
      unint64_t result = 0x7465736E7573;
      break;
    case 5:
      unint64_t result = 0x617461446E6F6F6DLL;
      break;
    case 6:
      unint64_t result = 0x4472656874616577;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100032154(unsigned __int8 *a1, char *a2)
{
  return sub_10000FA1C(*a1, *a2);
}

Swift::Int sub_100032160()
{
  return sub_10002BA00(*v0);
}

uint64_t sub_100032168()
{
  return sub_1000270F0();
}

Swift::Int sub_100032170(uint64_t a1)
{
  return sub_100027574(a1, *v1);
}

uint64_t sub_100032178@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100031F0C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000321A8()
{
  char v1 = sub_100036530();
  unint64_t result = sub_100031F64(v1);
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
}

unint64_t sub_1000321D0()
{
  return sub_10003205C(*v0);
}

uint64_t sub_1000321D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100031F58();
  *a1 = result;
  return result;
}

uint64_t sub_100032200@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100031F5C();
  *a1 = result;
  return result;
}

uint64_t sub_100032228(uint64_t a1)
{
  unint64_t v2 = sub_100033CE8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100032264(uint64_t a1)
{
  unint64_t v2 = sub_100033CE8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000322A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000315B8(a1, a2);
}

uint64_t sub_1000322B8(void *a1)
{
  return sub_1000312E8(a1);
}

uint64_t sub_1000322D0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v26 = a4;
  uint64_t v8 = sub_100054278();
  uint64_t v24 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v21 = (char *)&v20 - v9;
  uint64_t v22 = a3;
  uint64_t v10 = type metadata accessor for SingleValueDecodable();
  uint64_t v23 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v20 - v11;
  sub_100033A80(a1, a1[3]);
  sub_1000545F8();
  if (!v4)
  {
    uint64_t v20 = v12;
    sub_100033A80(v25, v25[3]);
    uint64_t v13 = v21;
    sub_100054518();
    uint64_t v14 = (uint64_t)v13;
    uint64_t v15 = a2;
    uint64_t v16 = v26;
    uint64_t v17 = v24;
    sub_100008010(v14, 0, 1, v15);
    uint64_t v18 = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v20, v14, v8);
    sub_100019004((uint64_t)v25);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v16, v18, v10);
  }
  return sub_100019004((uint64_t)a1);
}

uint64_t sub_100032518@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1000322D0(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_100032538()
{
  sub_1000068D8((uint64_t *)&unk_10006C4C0);
  sub_10000AFB4();
  __chkstk_darwin();
  sub_1000362FC();
  sub_100054308(39);
  swift_bridgeObjectRelease();
  strcpy((char *)v7, "[weatherData:");
  HIWORD(v7[1]) = -4864;
  uint64_t v2 = type metadata accessor for PosterDataModel(0);
  type metadata accessor for PosterDataModel.DataPoint(0);
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100053FD8();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = v3;
  v8._object = v5;
  sub_100053F58(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x7369726E7573202CLL;
  v9._object = (void *)0xEA00000000003A65;
  sub_100053F58(v9);
  sub_100018F48(v0 + *(int *)(v2 + 28), v1, (uint64_t *)&unk_10006C4C0);
  v10._countAndFlagsBits = sub_100053F38();
  sub_100053F58(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x7465736E7573202CLL;
  v11._object = (void *)0xE90000000000003ALL;
  sub_100053F58(v11);
  sub_100018F48(v0 + *(int *)(v2 + 32), v1, (uint64_t *)&unk_10006C4C0);
  v12._countAndFlagsBits = sub_100053F38();
  sub_100053F58(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 93;
  v13._object = (void *)0xE100000000000000;
  sub_100053F58(v13);
  return v7[0];
}

uint64_t sub_1000326FC()
{
  sub_100054308(53);
  v5._countAndFlagsBits = 0x697469646E6F635BLL;
  v5._object = (void *)0xEB000000003A6E6FLL;
  sub_100053F58(v5);
  uint64_t v1 = type metadata accessor for PosterDataModel.DataPoint(0);
  v6._countAndFlagsBits = sub_1000533A8();
  sub_100053F58(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x3A65746164202CLL;
  v7._object = (void *)0xE700000000000000;
  sub_100053F58(v7);
  sub_100053198();
  sub_1000338D8((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
  v8._countAndFlagsBits = sub_1000544E8();
  sub_100053F58(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x746176656C65202CLL;
  v9._object = (void *)0xEC0000003A6E6F69;
  sub_100053F58(v9);
  sub_100053E28();
  v10._countAndFlagsBits = sub_1000540B8();
  sub_100053F58(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x6C7961447369202CLL;
  v11._object = (void *)0xEE00203A74686769;
  sub_100053F58(v11);
  if (*(unsigned char *)(v0 + *(int *)(v1 + 40))) {
    v2._countAndFlagsBits = 1702195828;
  }
  else {
    v2._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + *(int *)(v1 + 40))) {
    uint64_t v3 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v3 = (void *)0xE500000000000000;
  }
  v2._object = v3;
  sub_100053F58(v2);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 93;
  v12._object = (void *)0xE100000000000000;
  sub_100053F58(v12);
  return 0;
}

uint64_t sub_1000328E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for PosterDataModel(0);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  Swift::String v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PosterData(0);
  sub_10000AFB4();
  uint64_t v10 = __chkstk_darwin(v9);
  Swift::String v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (unsigned __int8 *)&v23 - v13;
  uint64_t v15 = sub_1000068D8(&qword_10006CC20);
  uint64_t v16 = sub_10000AFD4(v15);
  __chkstk_darwin(v16);
  sub_100036420();
  uint64_t v18 = (char *)(v2 + *(int *)(v17 + 56));
  sub_100033974(a1, v2, (void (*)(void))type metadata accessor for PosterData);
  sub_100033974(a2, (uint64_t)v18, (void (*)(void))type metadata accessor for PosterData);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_100033974(v2, (uint64_t)v14, (void (*)(void))type metadata accessor for PosterData);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v21 = sub_10000FF0C(*v14, *v18);
      goto LABEL_6;
    }
LABEL_8:
    sub_10000AE4C(v2, &qword_10006CC20);
    char v21 = 0;
    return v21 & 1;
  }
  sub_100033974(v2, (uint64_t)v12, (void (*)(void))type metadata accessor for PosterData);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_10003356C((uint64_t)v12, (void (*)(void))type metadata accessor for PosterDataModel);
    goto LABEL_8;
  }
  sub_100033B5C((uint64_t)v18, (uint64_t)v8, (void (*)(void))type metadata accessor for PosterDataModel);
  uint64_t v19 = (void *)sub_100036504();
  char v21 = sub_100032B78(v19, v20);
  sub_10003356C((uint64_t)v8, (void (*)(void))type metadata accessor for PosterDataModel);
  sub_10003356C((uint64_t)v12, (void (*)(void))type metadata accessor for PosterDataModel);
LABEL_6:
  sub_10003356C(v2, (void (*)(void))type metadata accessor for PosterData);
  return v21 & 1;
}

uint64_t sub_100032B78(void *a1, void *a2)
{
  uint64_t v5 = sub_100053C68();
  sub_10000E978();
  uint64_t v85 = v6;
  __chkstk_darwin(v7);
  sub_10000AF50();
  uint64_t v84 = v8;
  uint64_t v87 = sub_1000068D8(&qword_10006BF58);
  sub_10000AFB4();
  __chkstk_darwin(v9);
  sub_1000194D8();
  uint64_t v10 = sub_1000068D8(&qword_10006BE78);
  uint64_t v11 = sub_10000AFD4(v10);
  __chkstk_darwin(v11);
  sub_10000AFF8();
  uint64_t v86 = v12;
  sub_100019448();
  __chkstk_darwin(v13);
  id v90 = &v78[-v14];
  sub_100019448();
  __chkstk_darwin(v15);
  uint64_t v88 = &v78[-v16];
  sub_10000AFE0();
  uint64_t v17 = sub_100053198();
  sub_10000E978();
  uint64_t v95 = v18;
  __chkstk_darwin(v19);
  sub_10000AF50();
  uint64_t v94 = v20;
  uint64_t v21 = sub_1000068D8(&qword_10006BF60);
  sub_10000AFB4();
  __chkstk_darwin(v22);
  sub_10000AFF8();
  uint64_t v91 = v23;
  sub_100019448();
  __chkstk_darwin(v24);
  uint64_t v26 = &v78[-v25];
  uint64_t v27 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v28 = sub_10000AFD4(v27);
  __chkstk_darwin(v28);
  sub_10000AFF8();
  uint64_t v89 = v29;
  sub_100019448();
  __chkstk_darwin(v30);
  uint64_t v92 = &v78[-v31];
  sub_100019448();
  __chkstk_darwin(v32);
  os_log_type_t v93 = &v78[-v33];
  sub_100019448();
  uint64_t v35 = __chkstk_darwin(v34);
  uint64_t v37 = &v78[-v36];
  uint64_t v38 = __chkstk_darwin(v35);
  uint64_t v40 = &v78[-v39];
  __chkstk_darwin(v38);
  uint64_t v42 = &v78[-v41];
  BOOL v43 = *a1 == *a2 && a1[1] == a2[1];
  if (v43 || (char v44 = sub_100054508(), v45 = 0, (v44 & 1) != 0))
  {
    if ((sub_100054238() & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v83 = v17;
    uint64_t v46 = type metadata accessor for PosterDataModel(0);
    if ((sub_100053228() & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v80 = v5;
    uint64_t v81 = v2;
    sub_100018F48((uint64_t)a1 + *(int *)(v46 + 28), (uint64_t)v42, (uint64_t *)&unk_10006C4C0);
    char v82 = (int *)v46;
    sub_100018F48((uint64_t)a2 + *(int *)(v46 + 28), (uint64_t)v40, (uint64_t *)&unk_10006C4C0);
    uint64_t v47 = (uint64_t)&v26[*(int *)(v21 + 48)];
    sub_100018F48((uint64_t)v42, (uint64_t)v26, (uint64_t *)&unk_10006C4C0);
    sub_100018F48((uint64_t)v40, v47, (uint64_t *)&unk_10006C4C0);
    uint64_t v48 = v83;
    if (sub_100007FE8((uint64_t)v26, 1, v83) == 1)
    {
      sub_10000AE4C((uint64_t)v40, (uint64_t *)&unk_10006C4C0);
      sub_10000AE4C((uint64_t)v42, (uint64_t *)&unk_10006C4C0);
      sub_10000AF64(v47);
      if (!v43) {
        goto LABEL_15;
      }
      sub_10000AE4C((uint64_t)v26, (uint64_t *)&unk_10006C4C0);
    }
    else
    {
      sub_100018F48((uint64_t)v26, (uint64_t)v37, (uint64_t *)&unk_10006C4C0);
      sub_10000AF64(v47);
      if (v43)
      {
        sub_10000AE4C((uint64_t)v40, (uint64_t *)&unk_10006C4C0);
        sub_10000AE4C((uint64_t)v42, (uint64_t *)&unk_10006C4C0);
        (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v37, v48);
LABEL_15:
        uint64_t v49 = &qword_10006BF60;
        uint64_t v50 = (uint64_t)v26;
LABEL_36:
        sub_10000AE4C(v50, v49);
LABEL_37:
        char v45 = 0;
        return v45 & 1;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 32))(v94, v47, v48);
      sub_1000338D8(&qword_10006BF78, (void (*)(uint64_t))&type metadata accessor for Date);
      int v51 = sub_100053ED8();
      uint64_t v48 = v83;
      int v79 = v51;
      unint64_t v52 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
      v52(v94, v83);
      sub_10000AE4C((uint64_t)v40, (uint64_t *)&unk_10006C4C0);
      sub_10000AE4C((uint64_t)v42, (uint64_t *)&unk_10006C4C0);
      v52((uint64_t)v37, v48);
      sub_10000AE4C((uint64_t)v26, (uint64_t *)&unk_10006C4C0);
      if ((v79 & 1) == 0) {
        goto LABEL_37;
      }
    }
    unint64_t v53 = v82;
    uint64_t v54 = v93;
    sub_100018F48((uint64_t)a1 + v82[8], (uint64_t)v93, (uint64_t *)&unk_10006C4C0);
    uint64_t v55 = v92;
    sub_100018F48((uint64_t)a2 + v53[8], (uint64_t)v92, (uint64_t *)&unk_10006C4C0);
    uint64_t v56 = v91;
    uint64_t v57 = v91 + *(int *)(v21 + 48);
    sub_100018F48((uint64_t)v54, v91, (uint64_t *)&unk_10006C4C0);
    sub_100018F48((uint64_t)v55, v57, (uint64_t *)&unk_10006C4C0);
    sub_10000AF64(v56);
    if (v43)
    {
      sub_10000AE4C((uint64_t)v55, (uint64_t *)&unk_10006C4C0);
      sub_10000AE4C((uint64_t)v54, (uint64_t *)&unk_10006C4C0);
      sub_10000AF64(v57);
      uint64_t v58 = v80;
      uint64_t v59 = v81;
      if (v43)
      {
        sub_10000AE4C(v56, (uint64_t *)&unk_10006C4C0);
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v60 = v89;
      sub_100018F48(v56, v89, (uint64_t *)&unk_10006C4C0);
      sub_10000AF64(v57);
      uint64_t v59 = v81;
      if (!v61)
      {
        uint64_t v62 = v95;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 32))(v94, v57, v48);
        sub_1000338D8(&qword_10006BF78, (void (*)(uint64_t))&type metadata accessor for Date);
        LODWORD(v83) = sub_100053ED8();
        uint64_t v63 = v56;
        uint64_t v64 = *(void (**)(void))(v62 + 8);
        sub_100036388();
        v64();
        sub_10000AE4C((uint64_t)v92, (uint64_t *)&unk_10006C4C0);
        sub_10000AE4C((uint64_t)v93, (uint64_t *)&unk_10006C4C0);
        sub_100036388();
        v64();
        uint64_t v58 = v80;
        sub_10000AE4C(v63, (uint64_t *)&unk_10006C4C0);
        if ((v83 & 1) == 0) {
          goto LABEL_37;
        }
LABEL_27:
        uint64_t v65 = v88;
        sub_100018F48((uint64_t)a1 + v53[9], (uint64_t)v88, &qword_10006BE78);
        uint64_t v66 = v90;
        sub_100018F48((uint64_t)a2 + v53[9], (uint64_t)v90, &qword_10006BE78);
        uint64_t v67 = v59 + *(int *)(v87 + 48);
        sub_100018F48((uint64_t)v65, v59, &qword_10006BE78);
        sub_100018F48((uint64_t)v66, v67, &qword_10006BE78);
        sub_100019454(v59);
        if (v43)
        {
          sub_10000AE4C((uint64_t)v66, &qword_10006BE78);
          sub_10000AE4C((uint64_t)v65, &qword_10006BE78);
          sub_100019454(v67);
          if (v43)
          {
            sub_10000AE4C(v59, &qword_10006BE78);
            goto LABEL_40;
          }
        }
        else
        {
          uint64_t v68 = v86;
          sub_100018F48(v59, v86, &qword_10006BE78);
          sub_100019454(v67);
          if (!v69)
          {
            uint64_t v71 = v65;
            uint64_t v72 = v84;
            uint64_t v73 = v85;
            sub_1000364C0();
            v74();
            sub_1000338D8(&qword_10006BF70, (void (*)(uint64_t))&type metadata accessor for BackgroundMoonData);
            char v75 = sub_100053ED8();
            unsigned int v76 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
            v76(v72, v58);
            sub_10000AE4C((uint64_t)v90, &qword_10006BE78);
            uint64_t v77 = (uint64_t)v71;
            unint64_t v53 = v82;
            sub_10000AE4C(v77, &qword_10006BE78);
            v76(v68, v58);
            sub_10000AE4C(v59, &qword_10006BE78);
            if ((v75 & 1) == 0) {
              goto LABEL_37;
            }
LABEL_40:
            char v45 = sub_1000335C0(*(void *)((char *)a1 + v53[10]), *(void *)((char *)a2 + v53[10]));
            return v45 & 1;
          }
          sub_10000AE4C((uint64_t)v90, &qword_10006BE78);
          sub_10000AE4C((uint64_t)v65, &qword_10006BE78);
          (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v68, v58);
        }
        uint64_t v49 = &qword_10006BF58;
        uint64_t v50 = v59;
        goto LABEL_36;
      }
      sub_10000AE4C((uint64_t)v92, (uint64_t *)&unk_10006C4C0);
      sub_10000AE4C((uint64_t)v93, (uint64_t *)&unk_10006C4C0);
      (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v60, v48);
    }
    uint64_t v49 = &qword_10006BF60;
    uint64_t v50 = v56;
    goto LABEL_36;
  }
  return v45 & 1;
}

uint64_t sub_100033490(uint64_t a1, uint64_t a2)
{
  if ((sub_100053148() & 1) != 0
    && (uint64_t v4 = (int *)type metadata accessor for PosterDataModel.DataPoint(0),
        (sub_10000FC40(a1 + v4[5], a2 + v4[5]) & 1) != 0)
    && *(double *)(a1 + v4[6]) == *(double *)(a2 + v4[6])
    && *(double *)(a1 + v4[7]) == *(double *)(a2 + v4[7])
    && (sub_100053C18() & 1) != 0
    && (sub_100053E08() & 1) != 0)
  {
    char v5 = *(unsigned char *)(a1 + v4[10]) ^ *(unsigned char *)(a2 + v4[10]) ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_10003356C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  sub_10000B02C();
  v3();
  return a1;
}

uint64_t sub_1000335C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for PosterDataModel.DataPoint(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_22:
    char v19 = 0;
    return v19 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v21 = *(void *)(v8 + 72);
    uint64_t v22 = a1;
    uint64_t v13 = v11 - 1;
    while (1)
    {
      uint64_t v14 = v13;
      sub_100033974(a1 + v12, (uint64_t)v10, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
      uint64_t v15 = a2;
      sub_100033974(a2 + v12, (uint64_t)v7, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
      if ((sub_100053148() & 1) == 0) {
        break;
      }
      sub_1000533B8();
      sub_1000338D8(&qword_10006C368, (void (*)(uint64_t))&type metadata accessor for WeatherCondition);
      sub_100053F78();
      sub_100053F78();
      if (v25 == v23 && v26 == v24)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v17 = sub_100054508();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0) {
          break;
        }
      }
      if (*(double *)&v10[v4[6]] != *(double *)&v7[v4[6]]
        || *(double *)&v10[v4[7]] != *(double *)&v7[v4[7]]
        || (sub_100053C18() & 1) == 0
        || (sub_100053E08() & 1) == 0)
      {
        break;
      }
      char v18 = v10[v4[10]] ^ v7[v4[10]];
      sub_10003356C((uint64_t)v7, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
      sub_10003356C((uint64_t)v10, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
      a1 = v22;
      if ((v18 & 1) == 0)
      {
        a2 = v15;
        uint64_t v13 = v14 - 1;
        v12 += v21;
        if (v14) {
          continue;
        }
      }
      char v19 = v18 ^ 1;
      return v19 & 1;
    }
    sub_10003356C((uint64_t)v7, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
    sub_10003356C((uint64_t)v10, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
    goto LABEL_22;
  }
  char v19 = 1;
  return v19 & 1;
}

uint64_t sub_1000338D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for PosterDataModel.DataPoint(uint64_t a1)
{
  return sub_100033940(a1, qword_10006CE20);
}

uint64_t sub_100033940(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100033974(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  sub_1000195C0();
  v4();
  return a2;
}

uint64_t sub_1000339D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (void **)(a1 + 32);
    uint64_t v4 = (void **)(a2 + 32);
    do
    {
      uint64_t v6 = *v3++;
      uint64_t v5 = v6;
      uint64_t v8 = *v4++;
      uint64_t v7 = v8;
      if (v5)
      {
        if (!v7) {
          return 0;
        }
        sub_10000AE9C();
        id v9 = v7;
        id v10 = v5;
        char v11 = sub_100054258();

        if ((v11 & 1) == 0) {
          return 0;
        }
      }
      else if (v7)
      {
        return 0;
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

void *sub_100033A80(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100033AC4()
{
  unint64_t result = qword_10006CC30;
  if (!qword_10006CC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC30);
  }
  return result;
}

unint64_t sub_100033B10()
{
  unint64_t result = qword_10006CC40;
  if (!qword_10006CC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC40);
  }
  return result;
}

uint64_t sub_100033B5C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  sub_10000E994();
  v4();
  return a2;
}

unint64_t sub_100033BB8()
{
  unint64_t result = qword_10006CC58;
  if (!qword_10006CC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC58);
  }
  return result;
}

unint64_t sub_100033C04()
{
  unint64_t result = qword_10006CC70;
  if (!qword_10006CC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC70);
  }
  return result;
}

unint64_t sub_100033C50()
{
  unint64_t result = qword_10006CC90;
  if (!qword_10006CC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC90);
  }
  return result;
}

unint64_t sub_100033C9C()
{
  unint64_t result = qword_10006CCB8;
  if (!qword_10006CCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCB8);
  }
  return result;
}

unint64_t sub_100033CE8()
{
  unint64_t result = qword_10006CCD0;
  if (!qword_10006CCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCD0);
  }
  return result;
}

unint64_t sub_100033D34()
{
  unint64_t result = qword_10006CCF8;
  if (!qword_10006CCF8)
  {
    sub_10000E47C(&qword_10006CCF0);
    sub_100033DA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCF8);
  }
  return result;
}

unint64_t sub_100033DA8()
{
  unint64_t result = qword_10006CD00;
  if (!qword_10006CD00)
  {
    sub_10000E47C(&qword_10006CCC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD00);
  }
  return result;
}

uint64_t sub_100033DFC(char a1, int64_t a2, char a3, uint64_t a4)
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
  sub_1000068D8(&qword_10006C0A8);
  uint64_t v10 = *(void *)(type metadata accessor for PosterDataModel.DataPoint(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_1000543E8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for PosterDataModel.DataPoint(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_10002480C(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100034028(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_100034028(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for PosterDataModel.DataPoint(0) - 8);
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
  uint64_t result = sub_100054428();
  __break(1u);
  return result;
}

uint64_t sub_100034188(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000E47C((uint64_t *)&unk_10006C4C0);
    sub_1000338D8(a2, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10003421C()
{
  unint64_t result = qword_10006CD20;
  if (!qword_10006CD20)
  {
    sub_10000E47C(&qword_10006BE78);
    sub_1000338D8(&qword_10006CD28, (void (*)(uint64_t))&type metadata accessor for BackgroundMoonData);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD20);
  }
  return result;
}

unint64_t sub_1000342C0()
{
  unint64_t result = qword_10006CD38;
  if (!qword_10006CD38)
  {
    sub_10000E47C(&qword_10006CD30);
    sub_1000338D8(qword_10006CD40, (void (*)(uint64_t))type metadata accessor for PosterDataModel.DataPoint);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD38);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RenderingSessionManager.ExtensionReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PosterDataModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000344B8);
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

ValueMetadata *type metadata accessor for PosterDataModel.CodingKeys()
{
  return &type metadata for PosterDataModel.CodingKeys;
}

uint64_t sub_1000344F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_1000344F8()
{
  uint64_t result = sub_100054278();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100034588(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if (sub_100007FE8((uint64_t)a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    sub_100008010((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1000346A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_100007FE8(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_100034720(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = sub_100007FE8((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (v6)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    sub_100008010((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1000347E4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = sub_100007FE8((uint64_t)a1, 1, v5);
  int v7 = sub_100007FE8((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      sub_100008010((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

void *sub_10003490C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = sub_100007FE8((uint64_t)a2, 1, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  if (v6)
  {
    if (*(_DWORD *)(v7 + 84)) {
      size_t v8 = *(void *)(v7 + 64);
    }
    else {
      size_t v8 = *(void *)(v7 + 64) + 1;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    sub_100008010((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1000349D0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  int v6 = sub_100007FE8((uint64_t)a1, 1, v5);
  int v7 = sub_100007FE8((uint64_t)a2, 1, v5);
  uint64_t v8 = *(void *)(v5 - 8);
  if (v6)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      sub_100008010((uint64_t)a1, 0, 1, v5);
      return a1;
    }
    int v9 = *(_DWORD *)(v8 + 84);
    size_t v10 = *(void *)(v8 + 64);
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v11 = v8 + 8;
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v10 + 1;
  }
  memcpy(a1, a2, v12);
  return a1;
}

uint64_t sub_100034AF8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 > 3) {
            LODWORD(v7) = 4;
          }
          switch((int)v7)
          {
            case 2:
              LODWORD(v7) = *a1;
              break;
            case 3:
              LODWORD(v7) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v7) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v7) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v7 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v14 = sub_100007FE8((uint64_t)a1, v5, v4);
  if (v14 >= 2) {
    return v14 - 1;
  }
  else {
    return 0;
  }
}

void sub_100034C7C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v9) {
    size_t v11 = *(void *)(v8 + 64);
  }
  else {
    size_t v11 = *(void *)(v8 + 64) + 1;
  }
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v10;
  unsigned int v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        int v6 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v6 = 2;
      }
      else
      {
        int v6 = v15 > 1;
      }
    }
    else
    {
      int v6 = 1;
    }
  }
  if (v10 < a2)
  {
    unsigned int v16 = ~v10 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v18 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_28;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x100034E9CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_27;
    default:
LABEL_27:
      if (a2)
      {
LABEL_28:
        if (v9 >= 2)
        {
          uint64_t v19 = a2 + 1;
          sub_100008010((uint64_t)a1, v19, v9, v7);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SingleValueDecodable()
{
  return sub_10003629C();
}

uint64_t getEnumTagSinglePayload for PosterDataModel.DataPoint.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PosterDataModel.DataPoint.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x100035030);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterDataModel.DataPoint.CodingKeys()
{
  return &type metadata for PosterDataModel.DataPoint.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for PosterData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100035134);
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

ValueMetadata *type metadata accessor for PosterData.CodingKeys()
{
  return &type metadata for PosterData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PosterDataError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PosterDataError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1000352C0);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PosterDataError()
{
  return &type metadata for PosterDataError;
}

void *sub_1000352F8(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100053198();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    unsigned int v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000533B8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[7];
    *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
    uint64_t v13 = a3[8];
    unsigned int v14 = (char *)a1 + v13;
    unsigned int v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100053C28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[9];
    int v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_100053E38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  }
  return a1;
}

uint64_t sub_1000354B8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100053198();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[8];
  uint64_t v8 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[9];
  uint64_t v10 = sub_100053E38();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);

  return v11(v9, v10);
}

uint64_t sub_1000355E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053198();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100035758(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053198();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1000358CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053198();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100035A3C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100053198();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000533B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100053C28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_100053E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100035BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100035BC0);
}

uint64_t sub_100035BC0(uint64_t a1, uint64_t a2, int *a3)
{
  sub_100053198();
  sub_10000F86C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_1000533B8();
    sub_10000F86C();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      sub_100053C28();
      sub_10000F86C();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[8];
      }
      else
      {
        sub_100053E38();
        sub_10000F86C();
        if (*(_DWORD *)(v16 + 84) != a2)
        {
          unsigned int v18 = *(unsigned __int8 *)(a1 + a3[10]);
          if (v18 >= 2) {
            return ((v18 + 2147483646) & 0x7FFFFFFF) + 1;
          }
          else {
            return 0;
          }
        }
        uint64_t v8 = v15;
        uint64_t v12 = a3[9];
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return sub_100007FE8(v9, a2, v8);
}

uint64_t sub_100035CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100035CE0);
}

void sub_100035CE0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_100053198();
  sub_10000F86C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_1000533B8();
    sub_10000F86C();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      sub_100053C28();
      sub_10000F86C();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[8];
      }
      else
      {
        sub_100053E38();
        sub_10000F86C();
        if (*(_DWORD *)(v18 + 84) != a3)
        {
          *(unsigned char *)(a1 + a4[10]) = a2 + 1;
          return;
        }
        uint64_t v10 = v17;
        uint64_t v14 = a4[9];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  sub_100008010(v11, a2, a2, v10);
}

uint64_t sub_100035DD8()
{
  uint64_t result = sub_100053198();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000533B8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_100053C28();
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_100053E38();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

unint64_t sub_100035F34()
{
  unint64_t result = qword_10006CE70;
  if (!qword_10006CE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE70);
  }
  return result;
}

unint64_t sub_100035F84()
{
  unint64_t result = qword_10006CE78;
  if (!qword_10006CE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE78);
  }
  return result;
}

unint64_t sub_100035FD4()
{
  unint64_t result = qword_10006CE80;
  if (!qword_10006CE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE80);
  }
  return result;
}

unint64_t sub_100036024()
{
  unint64_t result = qword_10006CE88;
  if (!qword_10006CE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE88);
  }
  return result;
}

unint64_t sub_100036074()
{
  unint64_t result = qword_10006CE90;
  if (!qword_10006CE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE90);
  }
  return result;
}

unint64_t sub_1000360C4()
{
  unint64_t result = qword_10006CE98;
  if (!qword_10006CE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE98);
  }
  return result;
}

unint64_t sub_100036114()
{
  unint64_t result = qword_10006CEA0;
  if (!qword_10006CEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEA0);
  }
  return result;
}

unint64_t sub_100036164()
{
  unint64_t result = qword_10006CEA8;
  if (!qword_10006CEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEA8);
  }
  return result;
}

unint64_t sub_1000361B4()
{
  unint64_t result = qword_10006CEB0;
  if (!qword_10006CEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEB0);
  }
  return result;
}

unint64_t sub_100036204()
{
  unint64_t result = qword_10006CEB8;
  if (!qword_10006CEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEB8);
  }
  return result;
}

unint64_t sub_100036250()
{
  unint64_t result = qword_10006CEC0;
  if (!qword_10006CEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEC0);
  }
  return result;
}

uint64_t sub_10003629C()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000362D8(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return sub_100054288();
}

void sub_100036314()
{
  v1._countAndFlagsBits = 1852402976;
  v1._object = (void *)0xE400000000000000;
  sub_100053F58(v1);
}

uint64_t sub_100036334()
{
  return sub_1000544D8();
}

uint64_t sub_10003634C()
{
  return v0;
}

double sub_100036364(uint64_t a1, float a2)
{
  float *v2 = a2;
  *(void *)(v3 - 136) = 0;
  *(void *)(v3 - 128) = 0xE000000000000000;
  *(void *)(v3 - 120) = a1;
  return v4 / 60.0;
}

uint64_t sub_100036394()
{
  *(_WORD *)(v0 + 12) = 2082;
  *(void *)(v1 - 136) = 0;
  *(void *)(v1 - 128) = 0xE000000000000000;
  return v1 - 136;
}

uint64_t sub_1000363B4()
{
  uint64_t v2 = *(void *)(v0 - 136);
  unint64_t v3 = *(void *)(v0 - 128);
  return sub_100029610(v2, v3, (uint64_t *)(v0 - 120));
}

uint64_t sub_1000363EC()
{
  return 0;
}

uint64_t sub_100036438()
{
  return v0;
}

uint64_t sub_100036450@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v2 - 72) = a1;
  return KeyedEncodingContainer.encode(_:forKey:)(v2 - 72, v1);
}

uint64_t sub_100036480(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v3 - 96, v2);
}

uint64_t sub_1000364A0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v2 - 104) = a1;
  return KeyedDecodingContainer.decode(_:forKey:)(v2 - 104, v1);
}

uint64_t sub_1000364CC()
{
  return swift_bridgeObjectRelease();
}

void sub_1000364E4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t sub_100036504()
{
  return v0;
}

uint64_t sub_100036510()
{
  return sub_100054618();
}

uint64_t sub_100036530()
{
  return *v0;
}

uint64_t sub_10003653C()
{
  return v0;
}

uint64_t sub_100036550(uint64_t a1)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, v2 - 72, v1);
}

uint64_t sub_100036570()
{
  return v0;
}

uint64_t sub_100036584()
{
  uint64_t v0 = sub_1000068D8((uint64_t *)&unk_10006C558);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000533D8();
  __chkstk_darwin(v3 - 8);
  sub_100053078();
  uint64_t v4 = sub_100053088();
  uint64_t result = sub_100007FE8((uint64_t)v2, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1000533C8();
    sub_100053438();
    swift_allocObject();
    sub_100053428();
    sub_100053418();
    swift_allocObject();
    sub_100053408();
    uint64_t v6 = sub_100053328();
    swift_allocObject();
    uint64_t v7 = sub_100053318();
    v8[4] = v6;
    v8[5] = &protocol witness table for WeatherServiceFetchOptionsProvider;
    v8[1] = v7;
    return sub_100053378();
  }
  return result;
}

uint64_t sub_100036738()
{
  return sub_1000533E8();
}

uint64_t initializeBufferWithCopyOfBuffer for LabelViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LabelViewModel()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LabelViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LabelViewModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for LabelViewModel(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LabelViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LabelViewModel(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LabelViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LabelViewModel()
{
  return &type metadata for LabelViewModel;
}

void sub_100036998(unsigned __int8 a1@<W0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (a1 - 2 >= 2)
  {
    char v8 = a2 & 1;
    if (a1)
    {
      if (qword_10006BB30 != -1) {
        swift_once();
      }
      id v9 = (id)qword_100070850;
      v12._countAndFlagsBits = 0xD000000000000016;
      v14._countAndFlagsBits = 0x80000001000582B0;
      uint64_t v4 = sub_1000370C8(v12, (uint64_t)"No Internet Connection", v14);
      uint64_t v5 = v13;
      unint64_t v7 = 0xEA00000000006873;
      unint64_t v6 = 0x616C732E69666977;
    }
    else
    {
      if (qword_10006BB30 != -1) {
        swift_once();
      }
      unint64_t v6 = 0xD000000000000013;
      id v9 = (id)qword_100070850;
      v10._countAndFlagsBits = 0xD000000000000018;
      v14._countAndFlagsBits = 0x8000000100058330;
      uint64_t v4 = sub_1000370C8(v10, (uint64_t)"Location Services is Off", v14);
      uint64_t v5 = v11;
      unint64_t v7 = 0x80000001000582F0;
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    char v8 = 0;
  }
  *(void *)a3 = v4;
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v6;
  *(void *)(a3 + 24) = v7;
  *(unsigned char *)(a3 + 32) = v8;
}

void sub_100036B34(uint64_t a1, char a2)
{
}

BOOL sub_100036B5C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

Swift::Int sub_100036B6C(char a1)
{
  return sub_1000545D8();
}

Swift::Int sub_100036BB4()
{
  return sub_100036B6C(*v0);
}

void sub_100036BBC(uint64_t a1)
{
  sub_100036B34(a1, *v1);
}

BOOL sub_100036BC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100036B5C(*a1, *a2);
}

id sub_100036BD0()
{
  char v1 = *(unsigned char *)(v0 + 32);
  unint64_t v2 = self;
  if (v1)
  {
    id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
    sub_1000068D8(&qword_10006CEC8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100055B40;
    UIFontDescriptorAttributeName v5 = UIFontDescriptorTraitsAttribute;
    *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    sub_1000068D8(&qword_10006CED0);
    uint64_t v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_100055B40;
    UIFontDescriptorTraitKey v7 = UIFontWeightTrait;
    *(void *)(v6 + 32) = UIFontWeightTrait;
    char v8 = &UIFontWeightSemibold;
  }
  else
  {
    id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
    sub_1000068D8(&qword_10006CEC8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100055B40;
    UIFontDescriptorAttributeName v5 = UIFontDescriptorTraitsAttribute;
    *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    sub_1000068D8(&qword_10006CED0);
    uint64_t v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_100055B40;
    UIFontDescriptorTraitKey v7 = UIFontWeightTrait;
    *(void *)(v6 + 32) = UIFontWeightTrait;
    char v8 = &UIFontWeightMedium;
  }
  *(UIFontWeight *)(v6 + 40) = *v8;
  type metadata accessor for TraitKey(0);
  sub_100036F2C(&qword_10006BCC0, type metadata accessor for TraitKey);
  id v9 = v5;
  Swift::String v10 = v7;
  uint64_t v11 = sub_100053E98();
  *(void *)(inited + 64) = sub_1000068D8(&qword_10006CED8);
  *(void *)(inited + 40) = v11;
  type metadata accessor for AttributeName(0);
  sub_100036F2C(&qword_10006BCD0, type metadata accessor for AttributeName);
  sub_100053E98();
  Class isa = sub_100053E78().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [v3 fontDescriptorByAddingAttributes:isa];

  id v14 = [self fontWithDescriptor:v13 size:0.0];
  return v14;
}

uint64_t sub_100036EA4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = sub_100054508(), v6 = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (v8 = sub_100054508(), char v6 = 0, (v8 & 1) != 0)) {
      char v6 = *(unsigned char *)(a1 + 32) ^ *(unsigned char *)(a2 + 32) ^ 1;
    }
  }
  return v6 & 1;
}

uint64_t sub_100036F2C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for LabelViewModel.Placement(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100037040);
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

ValueMetadata *type metadata accessor for LabelViewModel.Placement()
{
  return &type metadata for LabelViewModel.Placement;
}

unint64_t sub_10003707C()
{
  unint64_t result = qword_10006CEE0;
  if (!qword_10006CEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEE0);
  }
  return result;
}

uint64_t sub_1000370C8@<X0>(Swift::String a1@<X1:X0>, uint64_t a2@<X8>, Swift::String a3)
{
  v5.value._countAndFlagsBits = 0;
  v5.value._object = 0;
  v6.super.Class isa = v3;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  a1._object = (void *)((a2 - 32) | 0x8000000000000000);
  return sub_100052F28(a1, v5, v6, v7, a3);
}

uint64_t sub_1000370F4()
{
  uint64_t v0 = sub_100053CA8();
  sub_10003714C(v0, qword_100070838);
  sub_10000E284(v0, (uint64_t)qword_100070838);
  return sub_100053C98();
}

uint64_t *sub_10003714C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000371B0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for BundleLookup()
{
  return self;
}

id sub_1000371E4()
{
  type metadata accessor for BundleLookup();
  ObjCClassFromMetadatCGFloat a = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100070850 = (uint64_t)result;
  return result;
}

void sub_10003723C(uint64_t a1)
{
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1)
  {
    *(void *)(v1 + 16) = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
}

void sub_1000372D8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000531C8();
  sub_10000E978();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100019474();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = (int *)type metadata accessor for DynamicRotationState();
  sub_10000AFB4();
  __chkstk_darwin(v12);
  sub_100019474();
  uint64_t v15 = v14 - v13;
  id v16 = [self currentDevice];
  id v17 = [v16 userInterfaceIdiom];

  if (v17 == (id)1)
  {
    if (qword_10006BB80 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100053568();
    sub_10000E284(v18, (uint64_t)qword_100070940);
    uint64_t v19 = sub_100053548();
    os_log_type_t v20 = sub_100054118();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v34 = v4;
      uint64_t v21 = swift_slowAlloc();
      v35[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136446466;
      uint64_t v22 = sub_10001FAC0();
      uint64_t v24 = sub_100029610(v22, v23, v35);
      sub_1000396C0(v24);
      sub_100054288();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2050;
      sub_100054288();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Initial orientation of poster is %{public}s (%{public}f degrees)", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();

      uint64_t v4 = v34;
    }
    else
    {
    }
    sub_1000531B8();
    int v25 = 0;
    if ((unint64_t)(a1 - 2) <= 2) {
      int v25 = dword_100056AF8[a1 - 2];
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v15, v10, v4);
    *(_DWORD *)(v15 + v11[5]) = v25;
    *(_DWORD *)(v15 + v11[6]) = 1065353216;
    *(void *)(v15 + v11[7]) = a1;
    *(void *)(v15 + v11[8]) = a1;
    uint64_t v26 = v2 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_rotationState;
    swift_beginAccess();
    sub_10003926C(v15, v26);
    swift_endAccess();
    uint64_t v27 = *(void *)(v2 + 16);
    uint64_t v28 = *(void *)(v27 + 16);
    if (v28)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = v27 + 40;
      do
      {
        swift_getObjectType();
        uint64_t v30 = sub_1000396AC();
        v31(v30);
        uint64_t v32 = sub_1000396AC();
        v33(v32);
        v29 += 16;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease();
    }
    sub_100039628(v15, (void (*)(void))type metadata accessor for DynamicRotationState);
  }
}

uint64_t sub_100037684()
{
  uint64_t v2 = v0;
  id v3 = (int *)type metadata accessor for DynamicRotationState();
  sub_10000AFB4();
  __chkstk_darwin(v4);
  sub_100039694();
  if (qword_10006BB80 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100053568();
  sub_10000E284(v5, (uint64_t)qword_100070940);
  uint64_t v6 = sub_100053548();
  os_log_type_t v7 = sub_100054118();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Rotation manager was invalidated", v8, 2u);
    sub_10000E950();
  }

  sub_100038608();
  *(void *)(v2 + 16) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate + 8) = 0;
  swift_unknownObjectWeakAssign();
  sub_1000531B8();
  *(_DWORD *)(v1 + v3[5]) = 0;
  *(_DWORD *)(v1 + v3[6]) = 1065353216;
  *(void *)(v1 + v3[7]) = 0;
  *(void *)(v1 + v3[8]) = 0;
  uint64_t v9 = v2 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_rotationState;
  swift_beginAccess();
  sub_1000391A0(v1, v9);
  return swift_endAccess();
}

void sub_100037830(unint64_t a1, void *a2)
{
  sub_100039680();
  uint64_t v71 = v5;
  uint64_t v6 = sub_1000531C8();
  sub_10000E978();
  uint64_t v70 = v7;
  __chkstk_darwin(v8);
  sub_100019474();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = (int *)type metadata accessor for DynamicRotationState();
  sub_10000AFB4();
  __chkstk_darwin(v13);
  sub_100019474();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = sub_1000068D8(&qword_10006D070);
  __chkstk_darwin(v17 - 8);
  sub_100019474();
  uint64_t v20 = v19 - v18;
  id v21 = [self currentDevice];
  id v22 = [v21 userInterfaceIdiom];

  if (v22 == (id)1)
  {
    uint64_t v23 = v2 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_rotationState;
    swift_beginAccess();
    if (*(void *)(v23 + v12[8]) != a1)
    {
      uint64_t v68 = *(void *)(v23 + v12[8]);
      unint64_t v69 = a1;
      uint64_t v67 = v2;
      uint64_t v24 = v2 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate;
      if (swift_unknownObjectWeakLoadStrong()
        && (uint64_t v25 = *(void *)(v24 + 8),
            uint64_t ObjectType = swift_getObjectType(),
            LOBYTE(v25) = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(ObjectType, v25),
            swift_unknownObjectRelease(),
            (v25 & 1) != 0))
      {
        if (a2)
        {
          uint64_t v27 = qword_10006BB80;
          id v28 = a2;
          if (v27 != -1) {
            swift_once();
          }
          uint64_t v29 = sub_100053568();
          sub_10000E284(v29, (uint64_t)qword_100070940);
          uint64_t v30 = sub_100053548();
          os_log_type_t v31 = sub_100054118();
          if (os_log_type_enabled(v30, v31))
          {
            uint64_t v32 = swift_slowAlloc();
            v72[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v32 = 136446466;
            uint64_t v33 = sub_10001FAC0();
            uint64_t v35 = sub_100029610(v33, v34, v72);
            sub_1000396C0(v35);
            sub_100054288();
            swift_bridgeObjectRelease();
            *(_WORD *)(v32 + 12) = 2082;
            uint64_t v36 = sub_10001FAC0();
            uint64_t v73 = sub_100029610(v36, v37, v72);
            sub_100054288();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "Starting animation of device orientation; currentOrientation=%{public}s, toOrientation=%{public}s",
              (uint8_t *)v32,
              0x16u);
            swift_arrayDestroy();
            sub_10000E950();
            sub_10000E950();
          }

          uint64_t v38 = OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_displayLink;
          uint64_t v39 = *(void **)(v67 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_displayLink);
          if (v39) {
            [v39 invalidate];
          }
          float v40 = *(float *)(v23 + v12[5]);
          id v41 = v28;
          sub_10000F7BC(v41, v68, v69, v20, v40);
          uint64_t v42 = type metadata accessor for DynamicRotationAnimationState();
          sub_100008010(v20, 0, 1, v42);
          uint64_t v43 = v67 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_animationState;
          swift_beginAccess();
          sub_100039204(v20, v43);
          swift_endAccess();
          sub_100018DB0(0, &qword_10006D078);
          v72[3] = v71;
          v72[0] = v67;
          swift_retain();
          id v44 = sub_100038588(v72, (uint64_t)"displayLinkFired:");
          id v45 = [self mainScreen];
          uint64_t v46 = (uint64_t)[v45 maximumFramesPerSecond];

          if (v46 >= 60) {
            uint64_t v47 = 60;
          }
          else {
            uint64_t v47 = v46;
          }
          [v44 setPreferredFramesPerSecond:v47];
          id v48 = [self currentRunLoop];
          [v44 addToRunLoop:v48 forMode:NSRunLoopCommonModes];

          uint64_t v49 = *(void **)(v67 + v38);
          *(void *)(v67 + v38) = v44;
        }
        else
        {
          if (qword_10006BB80 != -1) {
            swift_once();
          }
          uint64_t v57 = sub_100053568();
          sub_10000E284(v57, (uint64_t)qword_100070940);
          uint64_t v58 = sub_100053548();
          os_log_type_t v59 = sub_100054118();
          if (os_log_type_enabled(v58, v59))
          {
            uint64_t v60 = swift_slowAlloc();
            v72[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v60 = 136446466;
            uint64_t v61 = sub_10001FAC0();
            uint64_t v63 = sub_100029610(v61, v62, v72);
            sub_1000396C0(v63);
            sub_100054288();
            swift_bridgeObjectRelease();
            *(_WORD *)(v60 + 12) = 2082;
            uint64_t v64 = sub_10001FAC0();
            uint64_t v73 = sub_100029610(v64, v65, v72);
            sub_100054288();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v58, v59, "Updating orientation change without animating because animation settings were missing; orientation=%{publi"
              "c}s, newOrientation=%{public}s",
              (uint8_t *)v60,
              0x16u);
            swift_arrayDestroy();
            sub_10000E950();
            sub_10000E950();
          }
          else
          {
          }
          sub_1000531B8();
          int v66 = 0;
          if (a1 - 2 <= 2) {
            int v66 = dword_100056AF8[a1 - 2];
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v16, v11, v6);
          *(_DWORD *)(v16 + v12[5]) = v66;
          *(_DWORD *)(v16 + v12[6]) = 1065353216;
          *(void *)(v16 + v12[7]) = v68;
          *(void *)(v16 + v12[8]) = a1;
          sub_100038050(v16);
          sub_100039628(v16, (void (*)(void))type metadata accessor for DynamicRotationState);
        }
      }
      else
      {
        if (qword_10006BB80 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_100053568();
        sub_10000E284(v50, (uint64_t)qword_100070940);
        int v51 = sub_100053548();
        os_log_type_t v52 = sub_100054118();
        if (os_log_type_enabled(v51, v52))
        {
          unint64_t v53 = (uint8_t *)swift_slowAlloc();
          v72[0] = swift_slowAlloc();
          *(_DWORD *)unint64_t v53 = 136446210;
          uint64_t v54 = sub_10001FAC0();
          uint64_t v56 = sub_100029610(v54, v55, v72);
          sub_1000396C0(v56);
          sub_100054288();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Rotation manager was not granted a rendering session; Skipping rotation to %{public}s",
            v53,
            0xCu);
          swift_arrayDestroy();
          sub_10000E950();
          sub_10000E950();
        }
      }
    }
  }
}

uint64_t sub_100038050(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100053768();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v41 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100053788();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v39 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DynamicRotationState();
  uint64_t v34 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v35 = v9;
  uint64_t v36 = (uint64_t)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000537A8();
  uint64_t v38 = *(void *)(v43 - 8);
  uint64_t v10 = __chkstk_darwin(v43);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v37 = (char *)&v32 - v13;
  uint64_t v14 = *(void *)(v1 + 16);
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v33 = v1;
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    swift_bridgeObjectRetain();
    uint64_t v18 = (uint64_t *)(v14 + 40);
    do
    {
      uint64_t v19 = *v18;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 8))(a1, ObjectType, v19);
      v18 += 2;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    uint64_t v4 = v17;
    uint64_t v5 = v16;
    uint64_t v2 = v33;
  }
  uint64_t v21 = v2 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_rotationState;
  swift_beginAccess();
  sub_10003926C(a1, v21);
  uint64_t result = swift_endAccess();
  if (*(float *)(a1 + *(int *)(v8 + 24)) >= 1.0)
  {
    sub_100038608();
    sub_100018DB0(0, &qword_10006C038);
    uint64_t v33 = sub_100054178();
    sub_100053798();
    uint64_t v23 = v37;
    sub_1000537C8();
    uint64_t v38 = *(void *)(v38 + 8);
    ((void (*)(char *, uint64_t))v38)(v12, v43);
    uint64_t v24 = swift_allocObject();
    swift_weakInit();
    uint64_t v25 = v36;
    sub_10002B620(a1, v36);
    unint64_t v26 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v24;
    sub_1000395C8(v25, v27 + v26, (void (*)(void))type metadata accessor for DynamicRotationState);
    aBlock[4] = sub_1000393E0;
    aBlock[5] = v27;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100017B38;
    aBlock[3] = &unk_100067138;
    id v28 = _Block_copy(aBlock);
    swift_release();
    uint64_t v29 = v39;
    sub_100053778();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10003945C();
    sub_1000068D8(&qword_10006C350);
    sub_1000394AC();
    uint64_t v30 = v41;
    sub_1000542B8();
    os_log_type_t v31 = (void *)v33;
    sub_100054158();
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v30, v4);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v29, v42);
    return ((uint64_t (*)(char *, uint64_t))v38)(v23, v43);
  }
  return result;
}

id sub_100038588(void *a1, uint64_t a2)
{
  sub_100033A80(a1, a1[3]);
  uint64_t v4 = sub_1000544F8();
  id v5 = [(id)swift_getObjCClassFromMetadata() displayLinkWithTarget:v4 selector:a2];
  swift_unknownObjectRelease();
  sub_100019004((uint64_t)a1);
  return v5;
}

uint64_t sub_100038608()
{
  uint64_t v1 = sub_1000068D8(&qword_10006D070);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_displayLink;
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_displayLink);
  if (v5)
  {
    [v5 invalidate];
    uint64_t v6 = *(void **)(v0 + v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(v0 + v4) = 0;

  uint64_t v7 = type metadata accessor for DynamicRotationAnimationState();
  sub_100008010((uint64_t)v3, 1, 1, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_animationState;
  swift_beginAccess();
  sub_100039204((uint64_t)v3, v8);
  return swift_endAccess();
}

id sub_1000386FC(void *a1)
{
  id v3 = (int *)type metadata accessor for DynamicRotationState();
  __chkstk_darwin(v3);
  id v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000068D8(&qword_10006D070);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for DynamicRotationAnimationState();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_animationState;
  swift_beginAccess();
  sub_100039500(v12, (uint64_t)v8);
  if (sub_100007FE8((uint64_t)v8, 1, (uint64_t)v9) == 1)
  {
    sub_100039568((uint64_t)v8);
    if (qword_10006BB80 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100053568();
    sub_10000E284(v13, (uint64_t)qword_100070940);
    uint64_t v14 = sub_100053548();
    os_log_type_t v15 = sub_1000540F8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Display link fired with no animation state", v16, 2u);
      swift_slowDealloc();
    }

    return [a1 invalidate];
  }
  else
  {
    sub_1000395C8((uint64_t)v8, (uint64_t)v11, (void (*)(void))type metadata accessor for DynamicRotationAnimationState);
    [*(id *)&v11[v9[7]] progressAtTime:CFAbsoluteTimeGetCurrent() - *(double *)&v11[v9[8]]];
    float v18 = *(float *)&v11[v9[9]];
    float v20 = v19;
    float v21 = fmodf(v18 + (float)((float)(*(float *)&v11[v9[10]] - v18) * v20), 360.0);
    uint64_t v22 = sub_1000531C8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v5, v11, v22);
    uint64_t v23 = *(void *)&v11[v9[5]];
    uint64_t v24 = *(void *)&v11[v9[6]];
    *(float *)&v5[v3[5]] = v21;
    *(float *)&v5[v3[6]] = v20;
    *(void *)&v5[v3[7]] = v23;
    *(void *)&v5[v3[8]] = v24;
    sub_100038050((uint64_t)v5);
    sub_100039628((uint64_t)v5, (void (*)(void))type metadata accessor for DynamicRotationState);
    return (id)sub_100039628((uint64_t)v11, (void (*)(void))type metadata accessor for DynamicRotationAnimationState);
  }
}

uint64_t sub_100038A90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for DynamicRotationState();
  __chkstk_darwin(v3);
  id v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000068D8(&qword_10006D070);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = result + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_animationState;
    swift_beginAccess();
    sub_100039500(v11, (uint64_t)v8);
    uint64_t v12 = type metadata accessor for DynamicRotationAnimationState();
    if (sub_100007FE8((uint64_t)v8, 1, v12) == 1)
    {
      sub_100039568((uint64_t)v8);
      if (qword_10006BB80 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_100053568();
      sub_10000E284(v13, (uint64_t)qword_100070940);
      sub_10002B620(a2, (uint64_t)v5);
      uint64_t v14 = sub_100053548();
      os_log_type_t v15 = sub_100054118();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136446210;
        uint64_t v29 = v17;
        uint64_t v18 = sub_10001FAC0();
        uint64_t v28 = sub_100029610(v18, v19, &v29);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_100039628((uint64_t)v5, (void (*)(void))type metadata accessor for DynamicRotationState);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Completed animation of device orientation to %{public}s", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100039628((uint64_t)v5, (void (*)(void))type metadata accessor for DynamicRotationState);
      }

      uint64_t v20 = *(void *)(v10 + 16);
      uint64_t v21 = *(void *)(v20 + 16);
      if (v21)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = (uint64_t *)(v20 + 40);
        do
        {
          uint64_t v23 = *v22;
          uint64_t ObjectType = swift_getObjectType();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(a2, ObjectType, v23);
          v22 += 2;
          --v21;
        }
        while (v21);
        swift_bridgeObjectRelease();
      }
      uint64_t v25 = v10 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate;
      if (swift_unknownObjectWeakLoadStrong())
      {
        uint64_t v26 = *(void *)(v25 + 8);
        uint64_t v27 = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v27, v26);
        swift_release();
        return swift_unknownObjectRelease();
      }
      else
      {
        return swift_release();
      }
    }
    else
    {
      swift_release();
      return sub_100039568((uint64_t)v8);
    }
  }
  return result;
}

uint64_t sub_100038E38()
{
  swift_bridgeObjectRelease();
  sub_100039628(v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_rotationState, (void (*)(void))type metadata accessor for DynamicRotationState);

  sub_100039568(v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_animationState);
  sub_100019374(v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate);
  return v0;
}

uint64_t sub_100038EAC()
{
  sub_100038E38();
  sub_100039680();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

uint64_t sub_100038EE4()
{
  return type metadata accessor for DynamicRotationManager();
}

uint64_t type metadata accessor for DynamicRotationManager()
{
  uint64_t result = qword_10006CFC0;
  if (!qword_10006CFC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100038F34()
{
  type metadata accessor for DynamicRotationState();
  if (v0 <= 0x3F)
  {
    sub_100039020();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100039020()
{
  if (!qword_10006CFD0)
  {
    type metadata accessor for DynamicRotationAnimationState();
    unint64_t v0 = sub_100054278();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006CFD0);
    }
  }
}

uint64_t sub_100039078()
{
  uint64_t v2 = sub_1000531C8();
  sub_10000E978();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100039694();
  *(void *)(v0 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v6 = v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_rotationState;
  sub_1000531B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v6, v1, v2);
  uint64_t v7 = (int *)type metadata accessor for DynamicRotationState();
  *(_DWORD *)(v6 + v7[5]) = 0;
  *(_DWORD *)(v6 + v7[6]) = 1065353216;
  *(void *)(v6 + v7[7]) = 0;
  *(void *)(v6 + v7[8]) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_displayLink) = 0;
  uint64_t v8 = v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_animationState;
  uint64_t v9 = type metadata accessor for DynamicRotationAnimationState();
  sub_100008010(v8, 1, 1, v9);
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  return v0;
}

uint64_t sub_1000391A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicRotationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100039204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006D070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003926C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DynamicRotationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000392D0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100039308()
{
  uint64_t v1 = *(void *)(type metadata accessor for DynamicRotationState() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  sub_1000531C8();
  sub_10000AFB4();
  (*(void (**)(uint64_t))(v6 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000393E0()
{
  uint64_t v1 = *(void *)(type metadata accessor for DynamicRotationState() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100038A90(v2, v3);
}

uint64_t sub_100039444(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100039454()
{
  return swift_release();
}

unint64_t sub_10003945C()
{
  unint64_t result = qword_10006C348;
  if (!qword_10006C348)
  {
    sub_100053768();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C348);
  }
  return result;
}

unint64_t sub_1000394AC()
{
  unint64_t result = qword_10006C358;
  if (!qword_10006C358)
  {
    sub_10000E47C(&qword_10006C350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C358);
  }
  return result;
}

uint64_t sub_100039500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006D070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100039568(uint64_t a1)
{
  uint64_t v2 = sub_1000068D8(&qword_10006D070);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000395C8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_100039628(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1000396AC()
{
  return v0;
}

uint64_t sub_1000396C0(uint64_t result)
{
  *(void *)(v1 - 128) = result;
  return result;
}

uint64_t sub_1000396CC()
{
  uint64_t v1 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  __chkstk_darwin(v1 - 8);
  sub_100019474();
  uint64_t v4 = v3 - v2;
  sub_100053168();
  uint64_t v5 = sub_100053198();
  sub_100008010(v4, 0, 1, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_springBoardUnlimitedAssertionTakenAt;
  sub_10003B960();
  sub_10003B854(v4, v6);
  return swift_endAccess();
}

uint64_t sub_10003977C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  __chkstk_darwin(v2 - 8);
  sub_100019474();
  uint64_t v5 = v4 - v3;
  if (qword_10006BB88 == -1) {
    goto LABEL_2;
  }
LABEL_31:
  swift_once();
LABEL_2:
  uint64_t v6 = sub_100053568();
  uint64_t v7 = sub_10001F948(v6, (uint64_t)qword_100070958);
  os_log_type_t v8 = sub_100054118();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Invalidating all extended sessions", v9, 2u);
    sub_10000E950();
  }

  uint64_t v10 = OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer;
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer);
  if (v11)
  {
    [v11 invalidate];
    uint64_t v12 = *(void **)(v1 + v10);
  }
  else
  {
    uint64_t v12 = 0;
  }
  *(void *)(v1 + v10) = 0;

  uint64_t v13 = sub_100053198();
  sub_100008010(v5, 1, 1, v13);
  uint64_t v14 = v1 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_springBoardUnlimitedAssertionTakenAt;
  sub_10003B960();
  sub_10003B854(v5, v14);
  swift_endAccess();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v1 + 16);
  sub_10003B8BC(v1, v26);
  uint64_t v5 = v26[0];
  uint64_t v15 = v26[1];
  int64_t v16 = v26[3];
  unint64_t v17 = v26[4];
  int64_t v18 = (unint64_t)(v26[2] + 64) >> 6;
  swift_bridgeObjectRetain_n();
  if (v17)
  {
LABEL_8:
    unint64_t v19 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v20 = v19 | (v16 << 6);
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v21 >= v18) {
      goto LABEL_29;
    }
    unint64_t v22 = *(void *)(v15 + 8 * v21);
    int64_t v23 = v16 + 1;
    if (!v22)
    {
      int64_t v23 = v16 + 2;
      if (v16 + 2 >= v18) {
        goto LABEL_29;
      }
      unint64_t v22 = *(void *)(v15 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v16 + 3;
        if (v16 + 3 >= v18) {
          goto LABEL_29;
        }
        unint64_t v22 = *(void *)(v15 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v16 + 4;
          if (v16 + 4 >= v18) {
            goto LABEL_29;
          }
          unint64_t v22 = *(void *)(v15 + 8 * v23);
          if (!v22)
          {
            int64_t v23 = v16 + 5;
            if (v16 + 5 >= v18) {
              goto LABEL_29;
            }
            unint64_t v22 = *(void *)(v15 + 8 * v23);
            if (!v22)
            {
              int64_t v23 = v16 + 6;
              if (v16 + 6 >= v18) {
                goto LABEL_29;
              }
              unint64_t v22 = *(void *)(v15 + 8 * v23);
              if (!v22) {
                break;
              }
            }
          }
        }
      }
    }
LABEL_26:
    unint64_t v17 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    int64_t v16 = v23;
LABEL_27:
    objc_msgSend(objc_msgSend(*(id *)(*(void *)(v5 + 56) + 16 * v20), "assertion"), "invalidate");
    swift_unknownObjectRelease();
    if (v17) {
      goto LABEL_8;
    }
  }
  int64_t v24 = v16 + 7;
  while (v24 < v18)
  {
    unint64_t v22 = *(void *)(v15 + 8 * v24++);
    if (v22)
    {
      int64_t v23 = v24 - 1;
      goto LABEL_26;
    }
  }
LABEL_29:
  swift_bridgeObjectRelease();
  swift_release();
  sub_10003B960();
  sub_1000068D8(&qword_10006D178);
  sub_100053EA8(0);
  return swift_endAccess();
}

uint64_t sub_100039AAC(void *a1)
{
  sub_10003A980(3);
  if (v3 < 2.0 && (sub_100039C04(3u, a1) & 1) == 0) {
    return 0;
  }
  uint64_t v4 = OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer;
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer);
  if (v5) {
    [v5 invalidate];
  }
  uint64_t v6 = self;
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  v12[4] = sub_10003B92C;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100017018;
  void v12[3] = &unk_100067298;
  os_log_type_t v8 = _Block_copy(v12);
  swift_release();
  id v9 = [v6 scheduledTimerWithTimeInterval:0 repeats:v8 block:2.0];
  _Block_release(v8);
  uint64_t v10 = *(void **)(v1 + v4);
  *(void *)(v1 + v4) = v9;

  return 1;
}

uint64_t sub_100039C04(unsigned __int8 a1, void *a2)
{
  uint64_t v5 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  __chkstk_darwin(v5 - 8);
  sub_100019474();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_100053198();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v64 = v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v15 = __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v61 - v16;
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v61 - v18;
  sub_10003A480(a1);
  uint64_t v63 = v2;
  uint64_t v20 = v2 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_springBoardUnlimitedAssertionTakenAt;
  swift_beginAccess();
  sub_10003B5C4(v20, v8);
  if (sub_100007FE8(v8, 1, v9) == 1)
  {
    sub_100053108();
    sub_10003B62C(v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v19, v8, v9);
  }
  int64_t v21 = v19;
  unint64_t v22 = *(void (**)(char *))(v10 + 16);
  unint64_t v65 = v21;
  v22(v17);
  if (a1 >= 5u)
  {
    uint64_t v27 = *(void (**)(void))(v10 + 8);
    sub_10003B950();
    v27();
    uint64_t v26 = v27;
  }
  else
  {
    sub_100053168();
    sub_100053118();
    double v24 = v23;
    uint64_t v25 = *(void (**)(void))(v10 + 8);
    sub_10003B950();
    v25();
    ((void (*)(char *, uint64_t))v25)(v17, v9);
    if (v24 >= 7.0)
    {
      if (qword_10006BB88 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_100053568();
      sub_10000E284(v42, (uint64_t)qword_100070958);
      uint64_t v43 = v65;
      ((void (*)(char *, char *, uint64_t))v22)(v13, v65, v9);
      id v44 = sub_100053548();
      os_log_type_t v45 = sub_100054118();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        v66[0] = v64;
        *(_DWORD *)uint64_t v46 = 136446466;
        unint64_t v47 = sub_10003A758(a1);
        uint64_t v67 = sub_100029610(v47, v48, v66);
        sub_100054288();
        swift_bridgeObjectRelease();
        *(_WORD *)(v46 + 12) = 2082;
        sub_10003B68C();
        uint64_t v49 = sub_1000544E8();
        uint64_t v67 = sub_100029610(v49, v50, v66);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_10003B950();
        v25();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Not enough time to extend session before unlimited assertion is dropped; reason=%{public}s, lastUnlimitedAsser"
          "tionTakenAt=%{public}s",
          (uint8_t *)v46,
          0x16u);
        swift_arrayDestroy();
        sub_10000E950();
        sub_10000E950();

        int v51 = v65;
      }
      else
      {

        sub_10003B950();
        v25();
        int v51 = v43;
      }
      ((void (*)(char *, uint64_t))v25)(v51, v9);
      return 0;
    }
    uint64_t v26 = v25;
  }
  sub_10003A758(a1);
  NSString v28 = sub_100053EE8();
  swift_bridgeObjectRelease();
  uint64_t v29 = [a2 extendRenderingSessionForReason:v28];

  uint64_t v30 = sub_10003A8FC(v29);
  if (!v30)
  {
    if (qword_10006BB88 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_100053568();
    uint64_t v40 = sub_10001F948(v39, (uint64_t)qword_100070958);
    os_log_type_t v41 = sub_100054118();
    if (os_log_type_enabled(v40, v41))
    {
      unint64_t v62 = v26;
      swift_slowAlloc();
      v66[0] = sub_10003B9FC();
      _DWORD *v29 = 136446210;
      uint64_t v67 = sub_10003B9E0();
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Not granted an extented session for reason=%{public}s", (uint8_t *)v29, 0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();

      ((void (*)(char *, uint64_t))v62)(v65, v9);
      return 0;
    }

LABEL_29:
    uint64_t v60 = sub_10003B9C4();
    ((void (*)(uint64_t))v26)(v60);
    return 0;
  }
  uint64_t v32 = v30;
  double v33 = v31;
  [v30 timeRemaining];
  if (v34 < 5.0)
  {
    if (qword_10006BB88 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_100053568();
    uint64_t v36 = sub_10001F948(v35, (uint64_t)qword_100070958);
    os_log_type_t v37 = sub_100054118();
    if (os_log_type_enabled(v36, v37))
    {
      swift_slowAlloc();
      v66[0] = sub_10003B9FC();
      _DWORD *v29 = 136446466;
      uint64_t v38 = sub_10003B9E0();
      sub_10003B9A8(v38);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_10003B97C();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Granted extended session, but not enough time remaining to do work; reason=%{public}s, timeGranted=%{public}f seconds",
        (uint8_t *)v29,
        0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }

    objc_msgSend(objc_msgSend(v32, "assertion"), "invalidate");
    swift_unknownObjectRelease();
    goto LABEL_29;
  }
  double v52 = v33;
  if (qword_10006BB88 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_100053568();
  uint64_t v54 = sub_10001F948(v53, (uint64_t)qword_100070958);
  os_log_type_t v55 = sub_100054118();
  if (os_log_type_enabled(v54, v55))
  {
    swift_slowAlloc();
    v66[0] = sub_10003B9FC();
    unint64_t v62 = v26;
    _DWORD *v29 = 136446466;
    uint64_t v61 = v29 + 1;
    uint64_t v56 = sub_10003B9E0();
    sub_10003B9A8(v56);
    sub_100054288();
    swift_bridgeObjectRelease();
    sub_10003B97C();
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "Granted extended session for reason=%{public}s and timeGranted=%{public}f seconds", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    uint64_t v26 = v62;
    sub_10000E950();
    sub_10000E950();
  }

  sub_10003B960();
  id v57 = v32;
  sub_10003B4E8((uint64_t)v57, a1, v52);
  swift_endAccess();

  uint64_t v58 = sub_10003B9C4();
  ((void (*)(uint64_t))v26)(v58);
  return 1;
}

void sub_10003A480(char a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  if (!*(void *)(v4 + 16) || (unint64_t v5 = sub_100029DC8(a1), (v6 & 1) == 0))
  {
    swift_endAccess();
    return;
  }
  uint64_t v7 = *(void **)(*(void *)(v4 + 56) + 16 * v5);
  swift_endAccess();
  uint64_t v8 = qword_10006BB88;
  id v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100053568();
  uint64_t v11 = sub_10001F948(v10, (uint64_t)qword_100070958);
  os_log_type_t v12 = sub_100054118();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v23[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446210;
    unint64_t v14 = sub_10003A758(a1);
    sub_100029610(v14, v15, v23);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Invalidating extended session; reason=%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }

  objc_msgSend(objc_msgSend(v9, "assertion"), "invalidate");
  swift_unknownObjectRelease();
  swift_beginAccess();
  uint64_t v16 = (void *)sub_10003B3EC(a1);
  swift_endAccess();

  if (sub_10003A758(a1) == 0xD000000000000016 && v17 == 0x8000000100057400)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_100054508();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {

      return;
    }
  }
  uint64_t v19 = OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer;
  uint64_t v20 = *(void **)(v2 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer);
  if (v20)
  {
    id v21 = v20;
    [v21 invalidate];
  }
  unint64_t v22 = *(void **)(v2 + v19);
  *(void *)(v2 + v19) = 0;
}

unint64_t sub_10003A758(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 2:
    case 3:
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10003A820(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000660E8;
  v6._object = a2;
  unint64_t v4 = sub_100054448(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

unint64_t sub_10003A86C(char *a1, char *a2)
{
  return sub_10000F90C(*a1, *a2);
}

Swift::Int sub_10003A878()
{
  return sub_10002BA18(*v0);
}

uint64_t sub_10003A880(uint64_t a1)
{
  return sub_10002702C(a1, *v1);
}

Swift::Int sub_10003A888(uint64_t a1)
{
  return sub_100027610(a1, *v1);
}

uint64_t sub_10003A890@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10003A820(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10003A8C0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10003A758(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10003A8EC(void *a1@<X8>)
{
  *a1 = &off_100065DB8;
}

void *sub_10003A8FC(void *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = a1;
    id v3 = [v2 assertion];
    swift_unknownObjectRelease();
    if (v3)
    {
      CFAbsoluteTimeGetCurrent();
    }
    else
    {

      return 0;
    }
  }
  return v1;
}

void sub_10003A980(char a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_100029DC8(a1), (v5 & 1) != 0))
  {
    Swift::String v6 = *(void **)(*(void *)(v3 + 56) + 16 * v4);
    swift_endAccess();
    id v7 = v6;
    CFAbsoluteTimeGetCurrent();
    [v7 timeRemaining];
  }
  else
  {
    swift_endAccess();
  }
}

uint64_t sub_10003AA3C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10003A480(3);
    return swift_release();
  }
  return result;
}

uint64_t sub_10003AA98(char a1)
{
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 16) + 16))
  {
    sub_100029DC8(a1);
    char v4 = v3;
  }
  else
  {
    char v4 = 0;
  }
  swift_endAccess();
  return v4 & 1;
}

uint64_t sub_10003AB00()
{
  uint64_t v1 = v0;
  if (qword_10006BB88 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100053568();
  char v3 = sub_10001F948(v2, (uint64_t)qword_100070958);
  os_log_type_t v4 = sub_100054118();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Invalidating all extended sessions that require rendering", v5, 2u);
    sub_10000E950();
  }

  uint64_t v6 = 7;
  uint64_t v7 = OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer;
  uint64_t v8 = (uint64_t *)(v1 + 16);
  id v9 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 32);
  do
  {
    int v11 = *v9++;
    char v10 = v11;
    switch(v11)
    {
      case 0:
      case 1:
      case 4:
        goto LABEL_9;
      case 2:
        if (0x80000001000573E0 == 0x8000000100057400) {
          goto LABEL_8;
        }
LABEL_9:
        char v12 = sub_100054508();
        swift_bridgeObjectRelease();
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_14;
      case 3:
LABEL_8:
        swift_bridgeObjectRelease();
LABEL_10:
        uint64_t v13 = *(void **)(v1 + v7);
        if (v13)
        {
          [v13 invalidate];
          unint64_t v14 = *(void **)(v1 + v7);
        }
        else
        {
          unint64_t v14 = 0;
        }
        *(void *)(v1 + v7) = 0;

LABEL_14:
        swift_beginAccess();
        swift_bridgeObjectRetain();
        unint64_t v15 = sub_100029DC8(v10);
        char v17 = v16;
        swift_bridgeObjectRelease();
        if (v17)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v23 = *v8;
          uint64_t v19 = *v8;
          *uint64_t v8 = 0x8000000000000000;
          Swift::Int v20 = *(void *)(v19 + 24);
          sub_1000068D8(&qword_10006D168);
          sub_1000543C8(isUniquelyReferenced_nonNull_native, v20);
          id v21 = *(void **)(*(void *)(v23 + 56) + 16 * v15);
          sub_10003B578();
          sub_1000543D8();
          *uint64_t v8 = v23;
          swift_bridgeObjectRelease();
          swift_endAccess();
          objc_msgSend(objc_msgSend(v21, "assertion"), "invalidate");

          swift_unknownObjectRelease();
        }
        else
        {
          swift_endAccess();
        }
        break;
      default:
        break;
    }
    --v6;
  }
  while (v6);
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_10003AEA8()
{
  swift_bridgeObjectRelease();
  sub_10003B62C(v0 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_springBoardUnlimitedAssertionTakenAt);

  return v0;
}

uint64_t sub_10003AEE8()
{
  sub_10003AEA8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10003AF40()
{
  return type metadata accessor for RenderingSessionManager();
}

uint64_t type metadata accessor for RenderingSessionManager()
{
  uint64_t result = qword_10006D0B8;
  if (!qword_10006D0B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003AF90()
{
  sub_10003B038();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10003B038()
{
  if (!qword_10006BEE8)
  {
    sub_100053198();
    unint64_t v0 = sub_100054278();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006BEE8);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for WeatherRenderingSession(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for WeatherRenderingSession(id *a1)
{
}

uint64_t assignWithCopy for WeatherRenderingSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for WeatherRenderingSession(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for WeatherRenderingSession(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WeatherRenderingSession(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeatherRenderingSession()
{
  return &type metadata for WeatherRenderingSession;
}

unsigned char *storeEnumTagSinglePayload for RenderingSessionManager.ExtensionReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x10003B2ACLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderingSessionManager.ExtensionReason()
{
  return &type metadata for RenderingSessionManager.ExtensionReason;
}

unint64_t sub_10003B2E8()
{
  unint64_t result = qword_10006D150;
  if (!qword_10006D150)
  {
    sub_10000E47C(&qword_10006D158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D150);
  }
  return result;
}

unint64_t sub_10003B340()
{
  unint64_t result = qword_10006D160;
  if (!qword_10006D160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D160);
  }
  return result;
}

uint64_t sub_10003B38C()
{
  *(void *)(v0 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v1 = v0 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_springBoardUnlimitedAssertionTakenAt;
  uint64_t v2 = sub_100053198();
  sub_100008010(v1, 1, 1, v2);
  *(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster23RenderingSessionManager_unlockSessionTimer) = 0;
  return v0;
}

uint64_t sub_10003B3EC(char a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100029DC8(a1);
  char v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v2;
  uint64_t v8 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  Swift::Int v9 = *(void *)(v8 + 24);
  sub_1000068D8(&qword_10006D168);
  sub_1000543C8(isUniquelyReferenced_nonNull_native, v9);
  uint64_t v10 = *(void *)(*(void *)(v12 + 56) + 16 * v4);
  sub_10003B578();
  sub_1000543D8();
  uint64_t *v2 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10003B4E8(uint64_t a1, char a2, double a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *int v3 = 0x8000000000000000;
  sub_10003B6DC(a1, a2, isUniquelyReferenced_nonNull_native, a3);
  *int v3 = v9;

  return swift_bridgeObjectRelease();
}

unint64_t sub_10003B578()
{
  unint64_t result = qword_10006D170;
  if (!qword_10006D170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D170);
  }
  return result;
}

uint64_t sub_10003B5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003B62C(uint64_t a1)
{
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10003B68C()
{
  unint64_t result = qword_10006C4D0;
  if (!qword_10006C4D0)
  {
    sub_100053198();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C4D0);
  }
  return result;
}

void sub_10003B6DC(uint64_t a1, char a2, char a3, double a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_100029DC8(a2);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_1000068D8(&qword_10006D168);
  if (!sub_1000543C8(a3 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_100029DC8(a2);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    sub_100054558();
    __break(1u);
    return;
  }
  unint64_t v16 = v18;
LABEL_5:
  Swift::Int v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7] + 16 * v16;

    *(void *)uint64_t v21 = a1;
    *(double *)(v21 + 8) = a4;
  }
  else
  {
    sub_10003B808(v16, a2, a1, v20, a4);
  }
}

unint64_t sub_10003B808(unint64_t result, char a2, uint64_t a3, void *a4, double a5)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  uint64_t v5 = a4[7] + 16 * result;
  *(void *)uint64_t v5 = a3;
  *(double *)(v5 + 8) = a5;
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

uint64_t sub_10003B854(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003B8BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_10003B8F4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003B92C()
{
  return sub_10003AA3C();
}

uint64_t sub_10003B934(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003B944()
{
  return swift_release();
}

uint64_t sub_10003B960()
{
  return swift_beginAccess();
}

uint64_t sub_10003B97C()
{
  *(_WORD *)(v0 + 12) = 2050;
  *(void *)(v1 - 128) = v3;
  return sub_100054288();
}

uint64_t sub_10003B9A8(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t sub_10003B9C4()
{
  return v0;
}

uint64_t sub_10003B9E0()
{
  return sub_100029610(v1, v0, (uint64_t *)(v2 - 152));
}

uint64_t sub_10003B9FC()
{
  return swift_slowAlloc();
}

uint64_t sub_10003BA18(uint64_t a1)
{
  uint64_t v1 = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0x7469617274726F70;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      uint64_t v1 = (void *)0x80000001000579D0;
      v3._countAndFlagsBits = 0xD000000000000012;
      break;
    case 3:
      uint64_t v1 = (void *)0xEE00746867695265;
      goto LABEL_6;
    case 4:
      uint64_t v1 = (void *)0xED00007466654C65;
LABEL_6:
      v3._countAndFlagsBits = 0x70616373646E616CLL;
      break;
    default:
      uint64_t v1 = (void *)0xE700000000000000;
      v3._countAndFlagsBits = 0x6E776F6E6B6E75;
      break;
  }
  v3._object = v1;
  sub_100053F58(v3);
  swift_bridgeObjectRelease();
  return 0x2D7972656C6C6167;
}

uint64_t sub_10003BB24()
{
  sub_10003E730();
  uint64_t v3 = sub_100053088();
  uint64_t v4 = v3;
  if (v2)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v0, v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)), v3);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return sub_100008010(v0, v5, 1, v4);
}

uint64_t sub_10003BBC0()
{
  uint64_t v3 = sub_10003E730();
  uint64_t v4 = type metadata accessor for PosterDataModel.DataPoint(v3);
  uint64_t v5 = v4;
  if (v2)
  {
    sub_10003E64C(v1+ ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80)), v0);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return sub_100008010(v0, v6, 1, v5);
}

void sub_10003BC5C(uint64_t a1, Swift::UInt a2)
{
}

Swift::Int sub_10003BC90(Swift::UInt a1)
{
  return sub_1000545D8();
}

Swift::Int sub_10003BCE4()
{
  return sub_10003BC90(*v0);
}

void sub_10003BCEC(uint64_t a1)
{
  sub_10003BC5C(a1, *v1);
}

Swift::Int sub_10003BCF4()
{
  Swift::UInt v1 = *v0;
  sub_1000545B8();
  sub_1000545C8(0);
  sub_1000545C8(v1);
  return sub_1000545D8();
}

uint64_t sub_10003BD44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_1000068D8((uint64_t *)&unk_10006C558);
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [*(id *)(v2 + 16) URLsForDirectory:9 inDomains:1];
  uint64_t v9 = sub_100053088();
  sub_100053FC8();

  sub_10003BB24();
  swift_bridgeObjectRelease();
  if (sub_100007FE8((uint64_t)v7, 1, v9) == 1)
  {
    sub_10002A664((uint64_t)v7, (uint64_t *)&unk_10006C558);
    uint64_t v10 = 1;
  }
  else
  {
    sub_10003E28C(a1);
    sub_100053048();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    uint64_t v10 = 0;
  }
  return sub_100008010(a2, v10, 1, v9);
}

void sub_10003BEEC(UIImage *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8((uint64_t *)&unk_10006C558);
  __chkstk_darwin(v4 - 8);
  sub_100019474();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_100053088();
  sub_10000E978();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_100019474();
  uint64_t v14 = v13 - v12;
  sub_10003BD44(a2, v7);
  if (sub_100007FE8(v7, 1, v8) == 1)
  {
    sub_10002A664(v7, (uint64_t *)&unk_10006C558);
LABEL_6:
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_100053568();
    sub_10000E284(v22, (uint64_t)qword_100070928);
    uint64_t v23 = sub_100053548();
    os_log_type_t v24 = sub_1000540F8();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (_DWORD *)sub_10003E700();
      uint64_t v42 = sub_100019538();
      *uint64_t v25 = 136446210;
      uint64_t v26 = sub_10003BA18(a2);
      uint64_t v28 = sub_100029610(v26, v27, &v42);
      sub_10003E6D8(v28);
      swift_bridgeObjectRelease();
      sub_10003E744((void *)&_mh_execute_header, v29, v30, "Failed to create PNG data when saving snapshot to disk for kind=%{public}s");
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }

    return;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v14, v7, v8);
  Swift::Int v15 = UIImagePNGRepresentation(a1);
  if (!v15)
  {
    uint64_t v20 = sub_10003E764();
    v21(v20);
    goto LABEL_6;
  }
  unint64_t v16 = v15;
  uint64_t v17 = sub_1000530A8();
  unint64_t v19 = v18;

  sub_1000530B8();
  if (qword_10006BB78 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_100053568();
  sub_10000E284(v31, (uint64_t)qword_100070928);
  uint64_t v32 = sub_100053548();
  os_log_type_t v33 = sub_100054118();
  if (os_log_type_enabled(v32, v33))
  {
    double v34 = (uint8_t *)sub_10003E700();
    uint64_t v42 = sub_100019538();
    *(_DWORD *)double v34 = 136446210;
    uint64_t v35 = sub_10003BA18(a2);
    uint64_t v37 = sub_100029610(v35, v36, &v42);
    sub_10003E718(v37);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Saved snapshot view for kind=%{public}s to disk", v34, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
    unint64_t v39 = v19;
    uint64_t v38 = v17;
  }
  else
  {
    uint64_t v38 = v17;
    unint64_t v39 = v19;
  }
  sub_1000212C0(v38, v39);

  uint64_t v40 = sub_10003E764();
  v41(v40);
}

void *sub_10003C458(uint64_t a1)
{
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006C558);
  __chkstk_darwin(v2 - 8);
  sub_100019474();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_100053088();
  sub_10000E978();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100019474();
  uint64_t v12 = v11 - v10;
  sub_10003BD44(a1, v5);
  if (sub_100007FE8(v5, 1, v6) == 1)
  {
    sub_10002A664(v5, (uint64_t *)&unk_10006C558);
LABEL_12:
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_100053568();
    sub_10000E284(v28, (uint64_t)qword_100070928);
    uint64_t v29 = sub_100053548();
    os_log_type_t v30 = sub_100054118();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (_DWORD *)sub_10003E700();
      uint64_t v47 = sub_100019538();
      *uint64_t v31 = 136446210;
      uint64_t v32 = sub_10003BA18(a1);
      uint64_t v34 = sub_100029610(v32, v33, &v47);
      sub_10003E6D8(v34);
      swift_bridgeObjectRelease();
      sub_10003E744((void *)&_mh_execute_header, v35, v36, "No snapshot found on disk for kind=%{public}s");
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }

    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v12, v5, v6);
  sub_10003E60C();
  sub_100053068();
  id v13 = sub_10003C92C();
  if (!v13)
  {
    uint64_t v26 = sub_10003E6B0();
    v27(v26);
    goto LABEL_12;
  }
  uint64_t v14 = v13;
  id v15 = [v13 CGImage];
  if (!v15)
  {
LABEL_18:
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_100053568();
    sub_10000E284(v37, (uint64_t)qword_100070928);
    uint64_t v38 = sub_100053548();
    os_log_type_t v39 = sub_1000540F8();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)sub_10003E700();
      uint64_t v47 = sub_100019538();
      *(_DWORD *)uint64_t v40 = 136446210;
      uint64_t v41 = sub_10003BA18(a1);
      uint64_t v43 = sub_100029610(v41, v42, &v47);
      sub_10003E6C4(v43);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Failed to find valid snapshot on disk for kind=%{public}s", v40, 0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }

    uint64_t v44 = sub_10003E6B0();
    v45(v44);
    return 0;
  }
  unint64_t v16 = v15;
  if ((sub_10004BC50() & 1) == 0)
  {

    goto LABEL_18;
  }
  if (qword_10006BB78 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_100053568();
  sub_10000E284(v17, (uint64_t)qword_100070928);
  unint64_t v18 = sub_100053548();
  os_log_type_t v19 = sub_100054118();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)sub_10003E700();
    uint64_t v47 = sub_100019538();
    *(_DWORD *)uint64_t v20 = 136446210;
    uint64_t v21 = sub_10003BA18(a1);
    uint64_t v23 = sub_100029610(v21, v22, &v47);
    sub_10003E6C4(v23);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Found valid cached snapshot on disk for kind=%{public}s", v20, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }

  uint64_t v24 = sub_10003E6B0();
  v25(v24);
  return v14;
}

id sub_10003C92C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithContentsOfFile:v1];

  return v2;
}

uint64_t sub_10003C9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10003CA04(a1, a2, a3, &v8);
  return v8;
}

void sub_10003CA04(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v125 = a3;
  uint64_t v122 = a2;
  uint64_t v134 = a4;
  uint64_t v129 = sub_100053CA8();
  uint64_t v124 = *(void *)(v129 - 8);
  __chkstk_darwin(v129);
  uint64_t v123 = v5;
  uint64_t v128 = (char *)v112 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000068D8((uint64_t *)&unk_10006C558);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v118 = (char *)v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v120 = (char *)v112 - v10;
  __chkstk_darwin(v9);
  uint64_t v12 = ((char *)v112 - v11);
  uint64_t v13 = sub_100053B38();
  uint64_t v126 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v15 = (char *)v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100053088();
  uint64_t v132 = *(void *)(v16 - 8);
  uint64_t v133 = v16;
  uint64_t v17 = *(void *)(v132 + 64);
  uint64_t v18 = __chkstk_darwin(v16);
  os_log_t v130 = (os_log_t)((char *)v112 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __chkstk_darwin(v18);
  int v117 = (char *)v112 - v20;
  __chkstk_darwin(v19);
  uint64_t v131 = (char *)v112 - v21;
  uint64_t v22 = sub_1000068D8(&qword_10006D228);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)v112 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100053928();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v127 = (char *)v112 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = v28;
  __chkstk_darwin(v27);
  os_log_type_t v30 = (char *)v112 - v29;
  sub_10003E29C(a1, (uint64_t)v24);
  if (sub_100007FE8((uint64_t)v24, 1, v25) == 1)
  {
    sub_10002A664((uint64_t)v24, &qword_10006D228);
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_100053568();
    sub_10000E284(v31, (uint64_t)qword_100070928);
    uint64_t v32 = sub_100053548();
    os_log_type_t v33 = sub_1000540F8();
    BOOL v34 = os_log_type_enabled(v32, v33);
    uint64_t v35 = v134;
    if (v34)
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Failed to create snapshot because no configuration was provided", v36, 2u);
      swift_slowDealloc();
    }

    goto LABEL_21;
  }
  uint64_t v119 = v26;
  uint64_t v38 = *(void (**)(unint64_t, char *, uint64_t))(v26 + 32);
  uint64_t v37 = v26 + 32;
  uint64_t v116 = v38;
  v38((unint64_t)v30, v24, v25);
  id v39 = MTLCreateSystemDefaultDevice();
  if (!v39) {
    goto LABEL_16;
  }
  id v40 = v39;
  id v41 = [v39 newCommandQueue];
  if (!v41)
  {
    swift_unknownObjectRelease();
LABEL_16:
    uint64_t v44 = v30;
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_100053568();
    sub_10000E284(v51, (uint64_t)qword_100070928);
    uint64_t v46 = sub_100053548();
    os_log_type_t v52 = sub_1000540F8();
    BOOL v53 = os_log_type_enabled(v46, v52);
    uint64_t v35 = v134;
    uint64_t v49 = v119;
    if (v53)
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v52, "Failed to create snapshot because command queue was not able to be setup", v54, 2u);
      swift_slowDealloc();
    }
    goto LABEL_20;
  }
  uint64_t v114 = v37;
  id v115 = v41;
  uint64_t v42 = v126;
  (*(void (**)(char *, void, uint64_t))(v126 + 104))(v15, enum case for VFXEffectType.background(_:), v13);
  sub_100053B28();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v13);
  uint64_t v43 = v133;
  if (sub_100007FE8((uint64_t)v12, 1, v133) == 1)
  {
    uint64_t v44 = v30;
    sub_10002A664((uint64_t)v12, (uint64_t *)&unk_10006C558);
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_100053568();
    sub_10000E284(v45, (uint64_t)qword_100070928);
    uint64_t v46 = sub_100053548();
    os_log_type_t v47 = sub_1000540F8();
    BOOL v48 = os_log_type_enabled(v46, v47);
    uint64_t v35 = v134;
    uint64_t v49 = v119;
    if (v48)
    {
      unint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Failed to create snapshot because URL for effect could not be created", v50, 2u);
      swift_slowDealloc();
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_20:

    (*(void (**)(char *, uint64_t))(v49 + 8))(v44, v25);
LABEL_21:
    os_log_type_t v55 = 0;
    goto LABEL_22;
  }
  v112[2] = v40;
  uint64_t v56 = *(void (**)(char *, os_log_t, uint64_t))(v132 + 32);
  uint64_t v126 = v132 + 32;
  uint64_t v113 = v56;
  v56(v131, v12, v43);
  if (qword_10006BB78 != -1) {
    swift_once();
  }
  uint64_t v57 = sub_100053568();
  uint64_t v58 = sub_10000E284(v57, (uint64_t)qword_100070928);
  os_log_type_t v59 = sub_100053548();
  os_log_type_t v60 = sub_100054118();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v61 = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, v60, "Starting to create new snapshot", v61, 2u);
    swift_slowDealloc();
  }

  id v62 = [objc_allocWithZone((Class)sub_1000535D8()) init];
  sub_1000535B8();
  sub_1000535C8();
  sub_100053578();
  sub_1000535A8();
  sub_100053598();
  uint64_t v63 = v119;
  if (qword_10006BB30 != -1) {
    swift_once();
  }
  id v64 = sub_10003E304(0x746C7561666564, 0xE700000000000000, 0x62696C6C6174656DLL, 0xE800000000000000, (void *)qword_100070850);
  v112[1] = v58;
  if (v64)
  {
    unint64_t v65 = v64;
    os_log_t v66 = v130;
    sub_100053058();

    uint64_t v67 = (uint64_t)v120;
    uint64_t v68 = v133;
    v113(v120, v66, v133);
    sub_100008010(v67, 0, 1, v68);
    if (sub_100007FE8(v67, 1, v68) != 1)
    {
      unint64_t v69 = v117;
      v113(v117, (os_log_t)v67, v68);
      uint64_t v70 = v132;
      uint64_t v71 = (uint64_t)v118;
      (*(void (**)(char *, char *, uint64_t))(v132 + 16))(v118, v69, v68);
      sub_100008010(v71, 0, 1, v68);
      sub_100053588();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v68);
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v67 = (uint64_t)v120;
    sub_100008010((uint64_t)v120, 1, 1, v43);
  }
  sub_10002A664(v67, (uint64_t *)&unk_10006C558);
LABEL_34:
  id v72 = objc_allocWithZone((Class)sub_100053668());
  int v117 = (char *)v62;
  uint64_t v120 = (char *)sub_100053608();
  uint64_t v73 = dispatch_group_create();
  dispatch_group_enter(v73);
  uint64_t v74 = v132 + 16;
  (*(void (**)(os_log_t, char *, uint64_t))(v132 + 16))(v130, v131, v133);
  char v75 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  uint64_t v118 = v30;
  v75(v127, v30, v25);
  uint64_t v76 = v124;
  (*(void (**)(char *, uint64_t, uint64_t))(v124 + 16))(v128, v122, v129);
  unint64_t v77 = (*(unsigned __int8 *)(v74 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 64);
  unint64_t v78 = (v17 + *(unsigned __int8 *)(v63 + 80) + v77) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  unint64_t v79 = (v121 + *(unsigned __int8 *)(v76 + 80) + v78) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
  unint64_t v80 = (v123 + v79 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v81 = swift_allocObject();
  char v82 = v120;
  *(void *)(v81 + 16) = v73;
  *(void *)(v81 + 24) = v82;
  v113((char *)(v81 + v77), v130, v133);
  uint64_t v83 = v25;
  v116(v81 + v78, v127, v25);
  (*(void (**)(unint64_t, char *, uint64_t))(v76 + 32))(v81 + v79, v128, v129);
  *(void *)(v81 + v80) = v125;
  uint64_t v84 = v73;
  id v85 = v82;
  sub_1000535E8();
  swift_release();
  sub_100054138();
  unint64_t v86 = sub_1000535F8();
  if (v86 >> 62) {
    uint64_t v87 = sub_100054418();
  }
  else {
    uint64_t v87 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v35 = v134;
  swift_bridgeObjectRelease();
  uint64_t v88 = v83;
  if (!v87)
  {
    unint64_t v103 = sub_100053548();
    uint64_t v104 = sub_1000540F8();
    if (os_log_type_enabled(v103, (os_log_type_t)v104))
    {
      unsigned __int8 v105 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned __int8 v105 = 0;
      _os_log_impl((void *)&_mh_execute_header, v103, (os_log_type_t)v104, "Failed to create snapshot because effect was not added to scene", v105, 2u);
      swift_slowDealloc();
    }

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    goto LABEL_53;
  }
  id v89 = objc_allocWithZone((Class)VFXRenderer);
  id v90 = [v89 initWithCommandQueue:v115];
  id v91 = [self blackColor];
  [v90 setBackgroundColor:v91];

  [v90 setScene:v85];
  id v92 = [self mainScreen];
  [v92 nativeBounds];
  double v94 = v93;
  double v96 = v95;

  id v97 = [v90 snapshotImageWithSize:v94, v96];
  if (!v97)
  {
    int v106 = sub_100053548();
    os_log_type_t v107 = sub_1000540F8();
    if (os_log_type_enabled(v106, v107))
    {
      uint64_t v108 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v108 = 0;
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "Failed to create snapshot because VFX renderer did not provide an image", v108, 2u);
      swift_slowDealloc();
    }

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_54;
  }
  os_log_type_t v55 = v97;
  id v98 = [v97 CGImage];
  if (!v98)
  {
LABEL_50:
    uint64_t v109 = sub_100053548();
    os_log_type_t v110 = sub_1000540F8();
    if (os_log_type_enabled(v109, v110))
    {
      uint64_t v111 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v111 = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, v110, "Failed to create valid snapshot", v111, 2u);
      uint64_t v88 = v83;
      swift_slowDealloc();
    }

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

LABEL_53:
LABEL_54:
    (*(void (**)(char *, uint64_t))(v132 + 8))(v131, v133);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v118, v88);
    os_log_type_t v55 = 0;
    goto LABEL_22;
  }
  uint64_t v99 = v98;
  if ((sub_10004BC50() & 1) == 0)
  {

    goto LABEL_50;
  }
  v112[0] = v83;
  os_log_type_t v100 = sub_100053548();
  os_log_type_t v101 = sub_100054118();
  if (os_log_type_enabled(v100, v101))
  {
    uint64_t v102 = (uint8_t *)swift_slowAlloc();
    os_log_t v130 = v100;
    *(_WORD *)uint64_t v102 = 0;
    _os_log_impl((void *)&_mh_execute_header, v130, v101, "Successfully created new snapshot", v102, 2u);
    os_log_type_t v100 = v130;
    swift_slowDealloc();
  }

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v132 + 8))(v131, v133);
  (*(void (**)(char *, void))(v119 + 8))(v118, v112[0]);
LABEL_22:
  *uint64_t v35 = v55;
}

void sub_10003D9F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v42 = a6;
  uint64_t v43 = a4;
  uint64_t v40 = a5;
  dispatch_group_t v44 = a1;
  uint64_t v7 = sub_1000068D8(&qword_10006C370);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100053918();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100053B38();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000068D8(&qword_10006D228);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = a2;
  uint64_t v21 = (void *)sub_100053638();
  sub_100053AA8();
  swift_allocObject();
  id v39 = v21;
  sub_100053A98();
  uint64_t v22 = sub_100053928();
  sub_100008010((uint64_t)v20, 1, 1, v22);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, enum case for VFXEffectType.background(_:), v14);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for WeatherConditionBackgroundConfig.CameraPositionType.default(_:), v10);
  uint64_t v23 = sub_100053CA8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v9, v40, v23);
  sub_100008010((uint64_t)v9, 0, 1, v23);
  sub_100053A78();
  sub_10002A664((uint64_t)v9, &qword_10006C370);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_10002A664((uint64_t)v20, &qword_10006D228);
  id v24 = [self currentDevice];
  id v25 = [v24 userInterfaceIdiom];

  uint64_t v26 = v42;
  if (v25 == (id)1 && sub_10003E5FC(v42))
  {
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_100053568();
    sub_10000E284(v27, (uint64_t)qword_100070928);
    uint64_t v28 = sub_100053548();
    os_log_type_t v29 = sub_100054118();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v30 = 136446210;
      uint64_t v31 = sub_10003BA18(v26);
      uint64_t v45 = sub_100029610(v31, v32, &v46);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Applying overrides for landscape snapshot; kind=%{public}s",
        v30,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000068D8(&qword_10006D230);
    uint64_t v33 = sub_100053BE8();
    uint64_t v34 = *(void *)(v33 - 8);
    unint64_t v35 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_100055B40;
    unint64_t v37 = v36 + v35;
    sub_100053CC8();
    (*(void (**)(unint64_t, void, uint64_t))(v34 + 104))(v37, enum case for VFXOverrideModel.deviceRotation(_:), v33);
    sub_100053A88();
    swift_bridgeObjectRelease();
  }
  sub_100053618();
  swift_release();

  dispatch_group_leave(v44);
}

uint64_t sub_10003E174()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for VFXSnapshotManager()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for SnapshotKind(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SnapshotKind(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SnapshotKind(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t sub_10003E224()
{
  return 0;
}

ValueMetadata *type metadata accessor for SnapshotKind()
{
  return &type metadata for SnapshotKind;
}

unint64_t sub_10003E240()
{
  unint64_t result = qword_10006D220;
  if (!qword_10006D220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D220);
  }
  return result;
}

BOOL sub_10003E28C(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t sub_10003E29C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006D228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_10003E304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSString v6 = sub_100053EE8();
  swift_bridgeObjectRelease();
  NSString v7 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v8 = [a5 URLForResource:v6 withExtension:v7];

  return v8;
}

uint64_t sub_10003E398()
{
  uint64_t v24 = sub_100053088();
  sub_10000E978();
  uint64_t v2 = v1;
  uint64_t v3 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v23 = sub_100053928();
  sub_10000E978();
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = (v4 + v6 + v9) & ~v9;
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = sub_100053CA8();
  sub_10000E978();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v19 = (v10 + v12 + v18) & ~v18;
  uint64_t v20 = v3 | v9 | v18 | 7;
  unint64_t v21 = ((*(void *)(v17 + 64) + v19 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v24);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v10, v23);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v0 + v19, v13);

  return _swift_deallocObject(v0, v21, v20);
}

void sub_10003E510()
{
  uint64_t v1 = sub_100053088();
  sub_100026EE0(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = sub_100053928();
  sub_100026EE0(v6);
  unint64_t v8 = (v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = sub_100053CA8();
  sub_100026EE0(v11);
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  unint64_t v16 = (v8 + v10 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = *(NSObject **)(v0 + 16);
  uint64_t v18 = *(void *)(v0 + 24);
  uint64_t v19 = *(void *)(v0 + ((*(void *)(v15 + 64) + v16 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_10003D9F4(v17, v18, v0 + v3, v0 + v8, v0 + v16, v19);
}

BOOL sub_10003E5FC(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

unint64_t sub_10003E60C()
{
  unint64_t result = qword_10006D238;
  if (!qword_10006D238)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006D238);
  }
  return result;
}

uint64_t sub_10003E64C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PosterDataModel.DataPoint(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003E6B0()
{
  return v0;
}

uint64_t sub_10003E6C4(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_10003E6D8(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return sub_100054288();
}

uint64_t sub_10003E700()
{
  return swift_slowAlloc();
}

uint64_t sub_10003E718(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_10003E730()
{
  return 0;
}

void sub_10003E744(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_10003E764()
{
  return v0;
}

uint64_t *WeatherLocation.currentLocationID.unsafeMutableAddressor()
{
  if (qword_10006BB38 != -1) {
    swift_once();
  }
  return &static WeatherLocation.currentLocationID;
}

uint64_t sub_10003E7C4()
{
  uint64_t result = sub_100053468();
  static WeatherLocation.currentLocationID = result;
  *(void *)algn_100070868 = v1;
  return result;
}

uint64_t static WeatherLocation.currentLocationID.getter()
{
  if (qword_10006BB38 != -1) {
    swift_once();
  }
  uint64_t v0 = static WeatherLocation.currentLocationID;
  swift_bridgeObjectRetain();
  return v0;
}

const char *WeatherLocation.alternateCurrentLocationID.unsafeMutableAddressor()
{
  return "_localCity_";
}

uint64_t static WeatherLocation.alternateCurrentLocationID.getter()
{
  return 0x69436C61636F6C5FLL;
}

void sub_10003E87C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    [v1 removeFromSuperview];
    uint64_t v1 = *(void **)(v0 + 24);
  }
  *(void *)(v0 + 24) = 0;
}

uint64_t sub_10003E8BC()
{
  if (*(unsigned char *)(v0 + 33) == 1) {
    char v1 = *(unsigned char *)(v0 + 32) ^ 1;
  }
  else {
    char v1 = 0;
  }
  return v1 & 1;
}

void sub_10003E8E0()
{
  if (!UIAccessibilityIsReduceMotionEnabled() && *(unsigned char *)(v0 + 33) == 1 && (*(unsigned char *)(v0 + 32) & 1) == 0)
  {
    char v1 = *(void **)(v0 + 24);
    if (v1)
    {
      sub_10003F198();
      id v2 = v1;
      sub_100053EB8();
      sub_1000063A4((1.0 - v3) * 0.2 + 1.0, 0.5, 0.25);
    }
  }
}

void sub_10003E9A8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(unsigned char *)(v3 + 33) == 1 && (*(unsigned char *)(v3 + 32) & 1) == 0)
  {
    if (a1)
    {
      id v6 = a1;
      if (sub_10003AA98(1))
      {
        if (qword_10006BB68 != -1) {
          swift_once();
        }
        uint64_t v7 = sub_100053568();
        sub_10000E284(v7, (uint64_t)qword_1000708F8);
        unint64_t v8 = sub_100053548();
        os_log_type_t v9 = sub_100054118();
        if (!sub_10003F1E4(v9)) {
          goto LABEL_31;
        }
        uint64_t v10 = (uint8_t *)sub_10001F85C();
        *(_WORD *)uint64_t v10 = 0;
        uint64_t v11 = "Skipping unload of background because rendering is in progress";
        goto LABEL_30;
      }
      if (*(void *)(v3 + 24))
      {
        id v16 = [v6 backgroundView];
        id v17 = [v16 subviews];

        sub_10000AE9C();
        unint64_t v18 = sub_100053FC8();

        uint64_t v19 = sub_10003EFC0(v18);
        swift_bridgeObjectRelease();
        sub_1000068D8(&qword_10006D2F8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100055B40;
        unint64_t v21 = *(void **)(v4 + 24);
        *(void *)(inited + 32) = v21;
        uint64_t v39 = inited;
        sub_100053FE8();
        id v22 = v21;
        LOBYTE(v21) = sub_1000339D0((uint64_t)v19, v39);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v21)
        {
          if (qword_10006BB68 != -1) {
            swift_once();
          }
          uint64_t v23 = sub_100053568();
          sub_10000E284(v23, (uint64_t)qword_1000708F8);
          unint64_t v8 = sub_100053548();
          os_log_type_t v24 = sub_100054118();
          if (!sub_10003F1E4(v24)) {
            goto LABEL_31;
          }
          uint64_t v10 = (uint8_t *)sub_10001F85C();
          *(_WORD *)uint64_t v10 = 0;
          uint64_t v11 = "Skipping unload of background because a snapshot already exists";
          goto LABEL_30;
        }
      }
      if (qword_10006BB68 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_100053568();
      sub_10000E284(v25, (uint64_t)qword_1000708F8);
      uint64_t v26 = sub_100053548();
      os_log_type_t v27 = sub_100054118();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)sub_10001F85C();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Starting to unload background while on home screen", v28, 2u);
        swift_slowDealloc();
      }

      id v29 = [v6 backgroundView];
      os_log_type_t v30 = sub_100005BBC();

      if (!v30)
      {
        unint64_t v8 = sub_100053548();
        os_log_type_t v33 = sub_1000540F8();
        if (!sub_10003F1E4(v33))
        {
LABEL_31:

          goto LABEL_14;
        }
        uint64_t v10 = (uint8_t *)sub_10001F85C();
        *(_WORD *)uint64_t v10 = 0;
        uint64_t v11 = "Failed to snapshot the background view when unloading on home screen";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v4, v11, v10, 2u);
        swift_slowDealloc();
        goto LABEL_31;
      }
      uint64_t v31 = *(void **)(v4 + 24);
      if (v31)
      {
        id v32 = *(id *)(v4 + 24);
      }
      else
      {
        id v34 = [objc_allocWithZone((Class)UIImageView) init];
        id v35 = [v6 backgroundView];
        sub_100006124(v34, 2);

        uint64_t v36 = *(void **)(v4 + 24);
        *(void *)(v4 + 24) = v34;
        id v32 = v34;

        uint64_t v31 = 0;
      }
      id v37 = v31;
      [v32 setImage:v30];
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 80))(2, ObjectType, a3);
      sub_10003AB00();
    }
    else
    {
      if (qword_10006BB68 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_100053568();
      sub_10000E284(v12, (uint64_t)qword_1000708F8);
      uint64_t v13 = sub_100053548();
      os_log_type_t v14 = sub_1000540F8();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)sub_10001F85C();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Failed to unload background on home screen because renderer is not set", v15, 2u);
        swift_slowDealloc();
      }
    }
  }
LABEL_14:
  sub_10003A480(2);
}

void sub_10003EEB8(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(v3 + 33) == 1 && (*(unsigned char *)(v3 + 32) & 1) == 0)
  {
    id v7 = [a1 environment];
    swift_getObjectType();
    sub_10003F200();
    int v9 = v8;
    swift_unknownObjectRelease();
    if (v9 == 1)
    {
      sub_10003E9A8(a1, a2, a3);
    }
    else
    {
      uint64_t v10 = *(void **)(v3 + 24);
      if (v10)
      {
        [v10 removeFromSuperview];
        uint64_t v10 = *(void **)(v3 + 24);
      }
      *(void *)(v3 + 24) = 0;
    }
  }
}

uint64_t sub_10003EFAC(char a1, uint64_t a2)
{
  *(unsigned char *)(v2 + 33) = a1;
  *(unsigned char *)(v2 + 32) = 0;
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = 0;
  return v2;
}

void *sub_10003EFC0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100054418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t result = (void *)sub_100054388();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v5 = (id)sub_100054328();
        }
        else {
          id v5 = *(id *)(a1 + 8 * v4 + 32);
        }
        id v6 = v5;
        ++v4;
        sub_10000AE9C();
        id v7 = v6;
        sub_1000068D8(&qword_10006D300);
        swift_dynamicCast();

        sub_100054368();
        sub_100054398();
        sub_1000543A8();
        sub_100054378();
      }
      while (v2 != v4);
      return &_swiftEmptyArrayStorage;
    }
  }
  return result;
}

uint64_t sub_10003F118()
{
  swift_release();

  return v0;
}

uint64_t sub_10003F140()
{
  sub_10003F118();

  return _swift_deallocClassInstance(v0, 34, 7);
}

uint64_t type metadata accessor for AnimationUnloadManager()
{
  return self;
}

unint64_t sub_10003F198()
{
  unint64_t result = qword_10006D308;
  if (!qword_10006D308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D308);
  }
  return result;
}

BOOL sub_10003F1E4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

double sub_10003F200()
{
  [v0 unlockProgress];
  char v1 = sub_1000534D8();
  [v0 unlockProgress];
  double v3 = v2;
  if ((v1 & 1) == 0)
  {
    sub_1000534D8();
    [v0 unlockProgress];
    return v4;
  }
  return v3;
}

double sub_10003F28C()
{
  [v0 linearBacklightProgress];
  char v1 = sub_1000534D8();
  [v0 linearBacklightProgress];
  double v3 = v2;
  if ((v1 & 1) == 0)
  {
    sub_1000534D8();
    [v0 linearBacklightProgress];
    return v4;
  }
  return v3;
}

uint64_t sub_10003F318(uint64_t a1)
{
  uint64_t v2 = sub_1000531C8();
  sub_10000E978();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100053D78();
  sub_10000E978();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v2);
  type metadata accessor for DynamicRotationState();
  sub_100053D68();
  sub_100053D88();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v8);
}

uint64_t sub_10003F45C@<X0>(uint64_t a1@<X8>)
{
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = sub_100053CB8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104);
  uint64_t v6 = (unsigned int *)&enum case for TargetWindowSizeClass.maglev(_:);
  if (v3 != (id)1) {
    uint64_t v6 = (unsigned int *)&enum case for TargetWindowSizeClass.poster(_:);
  }
  uint64_t v7 = *v6;

  return v5(a1, v7, v4);
}

void sub_10003F51C(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = v1 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData;
  swift_beginAccess();
  sub_10001F5E0(v6, (uint64_t)v5, (uint64_t *)&unk_10006C4B0);
  uint64_t v7 = type metadata accessor for PosterData(0);
  if (sub_100007FE8((uint64_t)v5, 1, v7) == 1)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    char v10 = 0;
    int64x2_t v11 = 0uLL;
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    if (qword_10006BB30 != -1) {
      swift_once();
    }
    uint64_t v12 = (objc_class *)(id)qword_100070850;
    v16._countAndFlagsBits = 0x80000001000586A0;
    v22._object = (void *)0x8000000100058670;
    v22._countAndFlagsBits = 0xD000000000000021;
    v23.value._countAndFlagsBits = 0;
    v23.value._object = 0;
    v13.super.Class isa = v12;
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    uint64_t v8 = sub_100052F28(v22, v23, v13, v24, v16);
    uint64_t v15 = v14;

    sub_10001F4F0((uint64_t)v5, (void (*)(void))type metadata accessor for PosterData);
    int64x2_t v11 = vdupq_n_s64(0x6E6F697461636F6CuLL);
    v11.i64[0] = v15;
    char v10 = 1;
    unint64_t v9 = 0xED00006C6C69662ELL;
  }
  else
  {
    sub_100036998(*v5, 1, (uint64_t)&v18);
    uint64_t v8 = v18;
    int64x2_t v11 = v19;
    unint64_t v9 = v20;
    char v10 = v21;
  }
  *(void *)a1 = v8;
  *(int64x2_t *)(a1 + 8) = v11;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
}

id sub_10003F738(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100053568();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v10 = (char *)&v25 - v9;
  *(void *)&v1[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_editor] = 0;
  uint64_t v11 = type metadata accessor for PosterData(0);
  sub_100042918(v11);
  uint64_t v12 = type metadata accessor for PosterAnimationViewModel();
  sub_100042918(v12);
  v1[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_hasPosterDataUpdated] = 0;
  uint64_t v13 = qword_10006BB60;
  uint64_t v14 = v1;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10000E284(v4, (uint64_t)qword_1000708E0);
  Swift::String v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, v15, v4);
  uint64_t v17 = sub_1000428E0();
  ((void (*)(uint64_t))v16)(v17);
  if (a1)
  {
    type metadata accessor for VFXAnimation();
    sub_10001F8FC();
    uint64_t v18 = sub_100010620();
    int64x2_t v19 = &off_100066688;
  }
  else
  {
    type metadata accessor for MicaAnimation();
    sub_10001F8FC();
    uint64_t v18 = (uint64_t)sub_1000471F4((uint64_t)v8);
    int64x2_t v19 = &off_100067460;
  }
  unint64_t v20 = (uint64_t *)&v14[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_animation];
  *unint64_t v20 = v18;
  v20[1] = (uint64_t)v19;
  id v21 = objc_allocWithZone((Class)type metadata accessor for PosterDataManager());
  *(void *)&v14[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_dataManager] = sub_10004C828(1);
  uint64_t v22 = sub_1000428E0();
  ((void (*)(uint64_t))v16)(v22);
  type metadata accessor for PosterLabelManager();
  sub_10001F8FC();
  *(void *)&v14[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_labelManager] = sub_100042FAC((uint64_t)v8);
  v14[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_deviceSupportsVFX] = a1 & 1;
  type metadata accessor for DynamicRotationManager();
  sub_10001F8FC();
  uint64_t v23 = sub_100039078();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(void *)&v14[OBJC_IVAR____TtC13WeatherPoster12PosterEditor_rotationManager] = v23;

  v25.receiver = v14;
  v25.super_class = ObjectType;
  return [super init];
}

uint64_t sub_10003F9E4(void *a1, void *a2)
{
  uint64_t v49 = a2;
  uint64_t v5 = sub_1000068D8(&qword_10006C4A0);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_10000AF50();
  uint64_t v48 = v7;
  uint64_t v8 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v9 = sub_10000AFD4(v8);
  __chkstk_darwin(v9);
  sub_100019474();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v14);
  sub_10000AFF8();
  uint64_t v50 = v15;
  __chkstk_darwin(v16);
  sub_100042938();
  __chkstk_darwin(v17);
  int64x2_t v19 = (char *)&v43 - v18;
  unint64_t v20 = *(void **)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_editor);
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_editor) = a1;

  *(void *)(*(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_rotationManager)
            + OBJC_IVAR____TtC13WeatherPoster22DynamicRotationManager_delegate
            + 8) = &off_1000673B8;
  swift_unknownObjectWeakAssign();
  sub_1000068D8((uint64_t *)&unk_10006D400);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_100055DD0;
  uint64_t v22 = *(void *)(*(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_animation + 8) + 8);
  *(void *)(v21 + 32) = *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_animation);
  *(void *)(v21 + 40) = v22;
  *(void *)(v21 + 48) = *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_labelManager);
  *(void *)(v21 + 56) = &off_100067430;
  id v23 = a1;
  Swift::String v24 = v49;
  swift_unknownObjectRetain();
  swift_retain();
  sub_10003723C(v21);
  swift_bridgeObjectRelease();
  sub_1000372D8((uint64_t)[v24 deviceOrientation]);
  uint64_t v25 = *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_dataManager);
  sub_10004C2CC(v19);
  sub_100042868((uint64_t)v19, v12, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010(v12, 0, 1, v13);
  uint64_t v26 = v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData;
  sub_10003B960();
  sub_1000186C8(v12, v26, (uint64_t *)&unk_10006C4B0);
  swift_endAccess();
  if (qword_10006BB60 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_100053568();
  sub_10000E284(v27, (uint64_t)qword_1000708E0);
  sub_100042868((uint64_t)v19, v3, (void (*)(void))type metadata accessor for PosterData);
  uint64_t v28 = v50;
  sub_100042868((uint64_t)v19, v50, (void (*)(void))type metadata accessor for PosterData);
  swift_unknownObjectRetain_n();
  id v29 = sub_100053548();
  int v30 = sub_100054118();
  if (os_log_type_enabled(v29, (os_log_type_t)v30))
  {
    int v45 = v30;
    os_log_t v46 = v29;
    os_log_type_t v47 = v19;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    v52[0] = v44;
    *(_DWORD *)uint64_t v31 = 136447235;
    [v24 deviceOrientation];
    uint64_t v32 = sub_10001FAC0();
    uint64_t v51 = sub_100029610(v32, v33, v52);
    sub_100054288();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2160;
    sub_1000428BC();
    *(_WORD *)(v31 + 22) = 2081;
    uint64_t v34 = sub_10002F11C();
    uint64_t v51 = sub_100029610(v34, v35, v52);
    sub_100054288();
    swift_bridgeObjectRelease();
    sub_10001F4F0(v3, (void (*)(void))type metadata accessor for PosterData);
    *(_WORD *)(v31 + 32) = 2160;
    sub_1000428BC();
    *(_WORD *)(v31 + 42) = 2081;
    uint64_t v36 = v48;
    sub_10002F030(v48);
    uint64_t v37 = type metadata accessor for PosterDataModel(0);
    if (sub_100007FE8(v36, 1, v37) == 1)
    {
      sub_10001F7A8(v36, &qword_10006C4A0);
      unint64_t v38 = 0xE300000000000000;
      uint64_t v39 = 7104878;
    }
    else
    {
      sub_10001F4F0(v36, (void (*)(void))type metadata accessor for PosterDataModel);
      uint64_t v39 = sub_100054218();
      unint64_t v38 = v40;
    }
    uint64_t v51 = sub_100029610(v39, v38, v52);
    sub_100054288();
    swift_bridgeObjectRelease();
    sub_10001F4F0(v28, (void (*)(void))type metadata accessor for PosterData);
    os_log_t v41 = v46;
    _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v45, "Did initialize; orientation=%{public}s, data=%{private,mask.hash}s, location=%{private,mask.hash}s",
      (uint8_t *)v31,
      0x34u);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();

    int64x2_t v19 = v47;
  }
  else
  {
    swift_unknownObjectRelease_n();
    sub_10001F4F0(v3, (void (*)(void))type metadata accessor for PosterData);
    sub_10001F4F0(v28, (void (*)(void))type metadata accessor for PosterData);
  }
  *(void *)(v25 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate + 8) = &off_100067400;
  swift_unknownObjectWeakAssign();
  *(void *)(v25 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate + 8) = &off_1000673E8;
  swift_unknownObjectWeakAssign();
  sub_10004C550();
  return sub_10001F4F0((uint64_t)v19, (void (*)(void))type metadata accessor for PosterData);
}

void sub_100040094(int a1, id a2, void *a3)
{
  [a2 deviceOrientation];
  if (qword_10006BB60 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100053568();
  sub_10000E284(v5, (uint64_t)qword_1000708E0);
  uint64_t v6 = sub_100053548();
  os_log_type_t v7 = sub_100054118();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446210;
    uint64_t v9 = sub_10001FAC0();
    sub_100029610(v9, v10, &v15);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Did update; orientation=%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }

  id v11 = [self currentDevice];
  id v12 = [v11 userInterfaceIdiom];

  if (v12 == (id)1)
  {
    id v13 = [a2 deviceOrientation];
    id v14 = [a3 animationSettings];
    sub_100037830((unint64_t)v13, v14);
  }
}

uint64_t sub_100040344()
{
  if (qword_10006BB30 != -1) {
    swift_once();
  }
  uint64_t v0 = (objc_class *)(id)qword_100070850;
  v11._countAndFlagsBits = 0x8000000100058720;
  v13._countAndFlagsBits = 0x72656874616557;
  v13._object = (void *)0xE700000000000000;
  v14.value._countAndFlagsBits = 0;
  v14.value._object = 0;
  v1.super.Class isa = v0;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_100052F28(v13, v14, v1, v15, v11);
  uint64_t v4 = v3;

  id v5 = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:PRTimeFontIdentifierSoft];
  id v6 = [self vibrantMaterialColor];
  void v12[3] = sub_100018DB0(0, &qword_10006C990);
  v12[0] = v6;
  id v7 = objc_allocWithZone((Class)PREditingLook);
  id v8 = sub_100042528(0xD000000000000013, 0x8000000100058700, v2, v4, v5, v12);
  sub_1000068D8(&qword_10006BBA0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100056090;
  *(void *)(v9 + 32) = v8;
  v12[0] = v9;
  sub_100053FE8();
  return v12[0];
}

id sub_100040588()
{
  id v0 = [objc_allocWithZone((Class)PREditorContentStylePickerConfiguration) init];
  [v0 setColorWellDisplayMode:1];
  sub_1000068D8(&qword_10006BBA0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100056D90;
  *(void *)(v1 + 32) = [objc_allocWithZone((Class)PRPosterContentVibrantMaterialStyle) init];
  *(void *)(v1 + 40) = [objc_allocWithZone((Class)PRPosterContentVibrantMonochromeStyle) init];
  sub_100053FE8();
  id v2 = objc_allocWithZone((Class)PREditorContentStylePalette);
  id v3 = sub_1000426C0(v1, 0, 0xE000000000000000);
  [v0 setStylePalette:v3];

  return v0;
}

uint64_t sub_1000406E8(uint64_t a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v6 = sub_1000068D8(&qword_10006C320);
  uint64_t v7 = sub_10000AFD4(v6);
  __chkstk_darwin(v7);
  sub_100019474();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for PosterAnimationViewModel();
  sub_10000AFB4();
  __chkstk_darwin(v12);
  sub_100039694();
  sub_10003F51C((uint64_t)v20);
  id v13 = [a2 backgroundView];
  sub_100042768((uint64_t)v20, (uint64_t)v21);
  if (*((void *)&v21[0] + 1))
  {
    v23[0] = v21[0];
    v23[1] = v21[1];
    char v24 = v22;
    sub_100043048((uint64_t)v23, v13);
  }
  else
  {
    sub_100042F20();
  }

  sub_100040930(v2, (uint64_t)v20, a2, v3);
  sub_1000427D0(v20);
  sub_100042868(v3, v10, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_100008010(v10, 0, 1, v11);
  uint64_t v14 = v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_lastRenderedAnimationViewModel;
  sub_10003B960();
  sub_1000186C8(v10, v14, &qword_10006C320);
  swift_endAccess();
  uint64_t v15 = *(void *)(v4 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_animation + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v17 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v15 + 24);
  uint64_t v18 = swift_unknownObjectRetain();
  v17(v18, &off_1000673D0, ObjectType, v15);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 40))(v3, 0, ObjectType, v15);
  (*(void (**)(uint64_t, uint64_t))(v15 + 56))(ObjectType, v15);
  return sub_10001F4F0(v3, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
}

void sub_100040930(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v95 = a3;
  uint64_t v96 = a4;
  sub_100042768(a2, (uint64_t)v99);
  double v94 = v100;
  uint64_t v5 = sub_1000068D8(&qword_10006BE78);
  __chkstk_darwin(v5 - 8);
  uint64_t v79 = (uint64_t)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100053E38();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  id v89 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100053C28();
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  uint64_t v88 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_1000533B8();
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  id v90 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100053198();
  uint64_t v80 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  id v92 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v75 = (uint64_t)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v85 = (uint64_t)&v72 - v14;
  uint64_t v77 = sub_100053248();
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  unint64_t v78 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000534C8();
  __chkstk_darwin(v16 - 8);
  id v91 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000068D8((uint64_t *)&unk_10006D940);
  __chkstk_darwin(v18 - 8);
  unint64_t v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for PosterDataModel.DataPoint(0);
  __chkstk_darwin(v21);
  id v23 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for PosterData(0);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000068D8(&qword_10006C4A0);
  __chkstk_darwin(v27 - 8);
  id v29 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for PosterDataModel(0);
  uint64_t v31 = __chkstk_darwin(v30);
  unint64_t v33 = (char *)&v72 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  unint64_t v35 = (char *)&v72 - v34;
  uint64_t v36 = a1 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData;
  swift_beginAccess();
  if (sub_100007FE8(v36, 1, v24))
  {
    sub_100008010((uint64_t)v29, 1, 1, v30);
LABEL_4:
    unint64_t v38 = &qword_10006C4A0;
    uint64_t v39 = (uint64_t)v29;
LABEL_5:
    sub_10001F7A8(v39, v38);
    unint64_t v40 = v94;
    if (qword_10006BB68 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_100053568();
    sub_10000E284(v41, (uint64_t)qword_1000708F8);
    uint64_t v42 = sub_100053548();
    os_log_type_t v43 = sub_100054118();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 67109120;
      LODWORD(v98) = v40 != 0;
      sub_100054288();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Rendering default view model because the editor has no valid weather data; shouldShowAnimation=%{BOOL}d",
        v44,
        8u);
      swift_slowDealloc();
    }

    id v45 = v95;
    id v46 = [v95 backgroundView];
    id v47 = [v45 foregroundView];
    sub_10000A914(v46, v47, v40 != 0, v96);

    return;
  }
  uint64_t v74 = (int *)v21;
  uint64_t v73 = v23;
  uint64_t v37 = v93;
  sub_100042868(v36, (uint64_t)v26, (void (*)(void))type metadata accessor for PosterData);
  sub_10002F030((uint64_t)v29);
  sub_10001F4F0((uint64_t)v26, (void (*)(void))type metadata accessor for PosterData);
  if (sub_100007FE8((uint64_t)v29, 1, v30) == 1) {
    goto LABEL_4;
  }
  uint64_t v48 = (uint64_t)v35;
  sub_100042808((uint64_t)v29, (uint64_t)v35, (void (*)(void))type metadata accessor for PosterDataModel);
  sub_10001F394(*(void *)&v35[*(int *)(v30 + 40)], (uint64_t)v20);
  if (sub_100007FE8((uint64_t)v20, 1, (uint64_t)v74) == 1)
  {
    sub_10001F4F0((uint64_t)v35, (void (*)(void))type metadata accessor for PosterDataModel);
    unint64_t v38 = (uint64_t *)&unk_10006D940;
    uint64_t v39 = (uint64_t)v20;
    goto LABEL_5;
  }
  double v94 = (int *)v30;
  sub_100042808((uint64_t)v20, (uint64_t)v73, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
  if (qword_10006BB60 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_100053568();
  sub_10000E284(v49, (uint64_t)qword_1000708E0);
  uint64_t v50 = (uint64_t)v33;
  sub_100042868((uint64_t)v35, (uint64_t)v33, (void (*)(void))type metadata accessor for PosterDataModel);
  uint64_t v51 = sub_100053548();
  os_log_type_t v52 = sub_100054118();
  if (os_log_type_enabled(v51, v52))
  {
    BOOL v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v98 = swift_slowAlloc();
    *(_DWORD *)BOOL v53 = 136446210;
    uint64_t v54 = sub_100032538();
    uint64_t v97 = sub_100029610(v54, v55, &v98);
    uint64_t v48 = (uint64_t)v35;
    sub_100054288();
    swift_bridgeObjectRelease();
    sub_10001F4F0(v50, (void (*)(void))type metadata accessor for PosterDataModel);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Rendering poster; data=%{public}s", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10001F4F0(v50, (void (*)(void))type metadata accessor for PosterDataModel);
  }

  uint64_t v57 = (uint64_t)v88;
  uint64_t v56 = (uint64_t)v89;
  uint64_t v58 = v86;
  os_log_type_t v59 = v92;
  os_log_type_t v60 = v94;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v78, v48 + v94[6], v77);
  uint64_t v61 = v85;
  sub_100008010(v85, 1, 1, v37);
  sub_100053498();
  uint64_t v62 = (uint64_t)v73;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v59, v73, v37);
  uint64_t v63 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v90, v62 + v74[5], v82);
  double v64 = *(double *)(v62 + v63[6]);
  double v65 = *(double *)(v62 + v63[7]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v57, v62 + v63[8], v84);
  sub_10001F5E0(v48 + v60[7], v61, (uint64_t *)&unk_10006C4C0);
  uint64_t v66 = v75;
  sub_10001F5E0(v48 + v60[8], v75, (uint64_t *)&unk_10006C4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v56, v62 + v63[9], v87);
  char v67 = *(unsigned char *)(v62 + v63[10]);
  uint64_t v68 = v79;
  sub_10001F5E0(v48 + v60[9], v79, &qword_10006BE78);
  id v69 = v95;
  id v70 = [v95 backgroundView];
  id v71 = [v69 foregroundView];
  sub_100009B68(v57, v61, v66, v56, v67, v96, v64, v65, v68, (uint64_t)v70, (uint64_t)v71, 1);
  sub_10001F4F0(v62, (void (*)(void))type metadata accessor for PosterDataModel.DataPoint);
  sub_10001F4F0(v48, (void (*)(void))type metadata accessor for PosterDataModel);
}

void sub_10004162C(void *a1, uint64_t a2, void (**a3)(void))
{
  if (qword_10006BB60 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100053568();
  sub_10000E284(v6, (uint64_t)qword_1000708E0);
  uint64_t v7 = sub_100053548();
  os_log_type_t v8 = sub_100054118();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Editor did finalize", v9, 2u);
    swift_slowDealloc();
  }

  *(void *)(*(void *)(a2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_dataManager)
            + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate
            + 8) = 0;
  swift_unknownObjectWeakAssign();
  id v10 = objc_msgSend(objc_msgSend(a1, "environment"), "targetConfiguration");
  swift_unknownObjectRelease();
  Class isa = sub_100054018().super.super.isa;
  NSString v12 = sub_100053EE8();
  [v10 setObject:isa forUserInfoKey:v12];

  objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  LOBYTE(isa) = sub_10001F2A8();
  swift_unknownObjectRelease();
  if ((isa & 1) == 0) {
    sub_100042BA4(1);
  }
  a3[2](a3);

  _Block_release(a3);
}

void sub_1000418D4()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v4 = sub_10000AFD4(v3);
  __chkstk_darwin(v4);
  sub_100039694();
  if (qword_10006BB60 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100053568();
  sub_10000E284(v5, (uint64_t)qword_1000708E0);
  uint64_t v6 = sub_100053548();
  os_log_type_t v7 = sub_100054118();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Invalidated", v8, 2u);
    sub_10000E950();
  }

  sub_100037684();
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_animation + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 80))(1, ObjectType, v9);
  sub_100042DD8();
  uint64_t v11 = *(void **)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_editor);
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_editor) = 0;

  uint64_t v12 = type metadata accessor for PosterData(0);
  sub_100008010(v1, 1, 1, v12);
  uint64_t v13 = v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData;
  sub_10003B960();
  sub_1000186C8(v1, v13, (uint64_t *)&unk_10006C4B0);
  swift_endAccess();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_hasPosterDataUpdated) = 0;
  *(void *)(*(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_dataManager)
            + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate
            + 8) = 0;
  swift_unknownObjectWeakAssign();
  sub_10004C59C();
}

void sub_100041B3C(uint64_t a1)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C4A0);
  uint64_t v5 = sub_10000AFD4(v4);
  __chkstk_darwin(v5);
  sub_10000AF50();
  uint64_t v54 = v6;
  uint64_t v7 = type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v8);
  sub_10000AFF8();
  uint64_t v58 = v9;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v52 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v52 - v14;
  uint64_t v16 = sub_1000068D8(&qword_10006C4A8);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  sub_100019474();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_1000068D8((uint64_t *)&unk_10006C4B0);
  uint64_t v22 = sub_10000AFD4(v21);
  __chkstk_darwin(v22);
  sub_10000AFF8();
  uint64_t v55 = v23;
  __chkstk_darwin(v24);
  sub_100042938();
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v52 - v26;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_hasPosterDataUpdated) = 1;
  uint64_t v56 = a1;
  sub_100042868(a1, (uint64_t)&v52 - v26, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010((uint64_t)v27, 0, 1, v7);
  uint64_t v57 = v1;
  uint64_t v28 = v1 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData;
  swift_beginAccess();
  uint64_t v29 = v20 + *(int *)(v17 + 56);
  sub_10001F5E0((uint64_t)v27, v20, (uint64_t *)&unk_10006C4B0);
  sub_10001F5E0(v28, v29, (uint64_t *)&unk_10006C4B0);
  sub_1000428F8(v20);
  if (v30)
  {
    sub_10001F7A8((uint64_t)v27, (uint64_t *)&unk_10006C4B0);
    sub_1000428F8(v29);
    if (v30)
    {
      sub_10001F7A8(v20, (uint64_t *)&unk_10006C4B0);
LABEL_11:
      if (qword_10006BB60 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_100053568();
      sub_10000E284(v33, (uint64_t)qword_1000708E0);
      uint64_t v34 = sub_100053548();
      os_log_type_t v35 = sub_100054118();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Poster data updated, but did not change", v36, 2u);
        sub_10000E950();
      }

      return;
    }
    goto LABEL_9;
  }
  sub_10001F5E0(v20, v2, (uint64_t *)&unk_10006C4B0);
  sub_1000428F8(v29);
  if (v30)
  {
    sub_10001F7A8((uint64_t)v27, (uint64_t *)&unk_10006C4B0);
    sub_10001F4F0(v2, (void (*)(void))type metadata accessor for PosterData);
LABEL_9:
    sub_10001F7A8(v20, &qword_10006C4A8);
    uint64_t v31 = v58;
    goto LABEL_16;
  }
  sub_100042808(v29, (uint64_t)v15, (void (*)(void))type metadata accessor for PosterData);
  char v32 = sub_1000328E0(v2, (uint64_t)v15);
  sub_10001F4F0((uint64_t)v15, (void (*)(void))type metadata accessor for PosterData);
  sub_10001F7A8((uint64_t)v27, (uint64_t *)&unk_10006C4B0);
  sub_10001F4F0(v2, (void (*)(void))type metadata accessor for PosterData);
  sub_10001F7A8(v20, (uint64_t *)&unk_10006C4B0);
  uint64_t v31 = v58;
  if (v32) {
    goto LABEL_11;
  }
LABEL_16:
  if (qword_10006BB60 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_100053568();
  sub_10000E284(v37, (uint64_t)qword_1000708E0);
  uint64_t v38 = v56;
  sub_100042868(v56, (uint64_t)v13, (void (*)(void))type metadata accessor for PosterData);
  sub_100042868(v38, v31, (void (*)(void))type metadata accessor for PosterData);
  uint64_t v39 = sub_100053548();
  os_log_type_t v40 = sub_100054118();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    v60[0] = v53;
    *(_DWORD *)uint64_t v41 = 136446723;
    uint64_t v42 = sub_10002F11C();
    uint64_t v59 = sub_100029610(v42, v43, v60);
    sub_100054288();
    swift_bridgeObjectRelease();
    sub_10001F4F0((uint64_t)v13, (void (*)(void))type metadata accessor for PosterData);
    *(_WORD *)(v41 + 12) = 2160;
    uint64_t v59 = 1752392040;
    uint64_t v44 = v58;
    sub_100054288();
    *(_WORD *)(v41 + 22) = 2081;
    uint64_t v45 = v54;
    sub_10002F030(v54);
    uint64_t v46 = type metadata accessor for PosterDataModel(0);
    if (sub_100007FE8(v45, 1, v46) == 1)
    {
      sub_10001F7A8(v45, &qword_10006C4A0);
      unint64_t v47 = 0xE300000000000000;
      uint64_t v48 = 7104878;
    }
    else
    {
      sub_10001F4F0(v45, (void (*)(void))type metadata accessor for PosterDataModel);
      uint64_t v48 = sub_100054218();
      unint64_t v47 = v49;
    }
    uint64_t v59 = sub_100029610(v48, v47, v60);
    sub_100054288();
    swift_bridgeObjectRelease();
    sub_10001F4F0(v44, (void (*)(void))type metadata accessor for PosterData);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Updating looks to reflect latest data; data=%{public}s, location=%{private,mask.hash}s",
      (uint8_t *)v41,
      0x20u);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {
    sub_10001F4F0((uint64_t)v13, (void (*)(void))type metadata accessor for PosterData);
    sub_10001F4F0(v31, (void (*)(void))type metadata accessor for PosterData);
  }

  uint64_t v50 = v55;
  sub_100042868(v38, v55, (void (*)(void))type metadata accessor for PosterData);
  sub_100008010(v50, 0, 1, v7);
  swift_beginAccess();
  sub_1000186C8(v50, v28, (uint64_t *)&unk_10006C4B0);
  swift_endAccess();
  uint64_t v51 = *(void **)(v57 + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_editor);
  if (v51) {
    [v51 updateLooks];
  }
}

void sub_1000422A0()
{
}

uint64_t sub_10004238C()
{
  return type metadata accessor for PosterEditor();
}

uint64_t type metadata accessor for PosterEditor()
{
  uint64_t result = qword_10006D3D0;
  if (!qword_10006D3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000423DC()
{
  sub_10001C308(319, (unint64_t *)&qword_10006C490, (void (*)(uint64_t))type metadata accessor for PosterData);
  if (v0 <= 0x3F)
  {
    sub_10001C308(319, (unint64_t *)&qword_10006C1C8, (void (*)(uint64_t))type metadata accessor for PosterAnimationViewModel);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t static WeatherLocation.supportsSecureCoding.getter()
{
  return 1;
}

id sub_100042528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  NSString v9 = sub_100053EE8();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100053EE8();
  swift_bridgeObjectRelease();
  uint64_t v11 = a6[3];
  if (v11)
  {
    uint64_t v12 = sub_100033A80(a6, a6[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_1000544F8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_100019004((uint64_t)a6);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [v6 initWithIdentifier:v9 displayName:v10 initialTimeFontConfiguration:a5 initialTitleColor:v16];

  swift_unknownObjectRelease();
  return v17;
}

id sub_1000426C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000068D8(&qword_10006D3E8);
  v5.super.Class isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  if (a3)
  {
    NSString v6 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [v3 initWithContentStyles:v5.super.isa localizedName:v6];

  return v7;
}

uint64_t sub_100042768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006D3E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1000427D0(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100042808(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_100042868(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10000AFB4();
  uint64_t v4 = sub_10001F9C4();
  v5(v4);
  return a2;
}

uint64_t sub_1000428BC()
{
  *(void *)(v0 - 128) = 1752392040;
  return sub_100054288();
}

uint64_t sub_1000428E0()
{
  return v0;
}

uint64_t sub_1000428F8(uint64_t a1)
{
  return sub_100007FE8(a1, 1, v1);
}

uint64_t sub_100042918(uint64_t a1)
{
  return sub_100008010(v1, 1, 1, a1);
}

ValueMetadata *type metadata accessor for AnimationConstants()
{
  return &type metadata for AnimationConstants;
}

double sub_10004295C()
{
  sub_100042C80();
  if (v0 <= 0.0)
  {
    if (sub_100042D08())
    {
      if (qword_10006BB50 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_100053568();
      sub_10000E284(v7, (uint64_t)qword_1000708B0);
      uint64_t v8 = (void *)sub_100053548();
      os_log_type_t v9 = sub_100054118();
      if (sub_100042D80(v9))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        sub_10001F9EC((void *)&_mh_execute_header, v10, v11, "Animation will use longer playback duration");
        sub_100042D9C();
      }

      sub_100042BA4(0);
      return 2.6;
    }
    else
    {
      if (qword_10006BB50 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_100053568();
      sub_10000E284(v12, (uint64_t)qword_1000708B0);
      uint64_t v13 = (void *)sub_100053548();
      os_log_type_t v14 = sub_100054118();
      if (sub_100042D80(v14))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        sub_10001F9EC((void *)&_mh_execute_header, v15, v16, "Animation will use default playback duration");
        sub_100042D9C();
      }

      return 1.1;
    }
  }
  else
  {
    if (qword_10006BB50 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100053568();
    os_log_type_t v2 = sub_10000E284(v1, (uint64_t)qword_1000708B0);
    uint64_t v3 = sub_100053548();
    os_log_type_t v4 = sub_100054118();
    if (sub_100042D80(v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 134349056;
      sub_100042C80();
      sub_100054288();
      _os_log_impl((void *)&_mh_execute_header, v3, v2, "Animation will use overridden playback duration; duration=%{public}f",
        v5,
        0xCu);
      sub_100042D9C();
    }

    sub_100042C80();
  }
  return result;
}

void sub_100042BA4(char a1)
{
  sub_100022300();
  uint64_t v2 = sub_100054128();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    NSString v4 = sub_100042DB8();
    [v3 setBool:a1 & 1 forKey:v4];
  }
}

id sub_100042C34()
{
  id v0 = objc_allocWithZone((Class)CAMediaTimingFunction);
  LODWORD(v1) = 1051260355;
  LODWORD(v2) = 1059816735;
  LODWORD(v3) = 1.0;
  id result = [v0 initWithControlPoints:v1 :0.0 :v2 :v3];
  qword_100070880 = (uint64_t)result;
  return result;
}

void sub_100042C80()
{
  sub_100022300();
  uint64_t v0 = sub_100054128();
  if (v0)
  {
    double v1 = (void *)v0;
    NSString v2 = sub_100053EE8();
    [v1 doubleForKey:v2];
  }
}

id sub_100042D08()
{
  sub_100022300();
  uint64_t v0 = sub_100054128();
  if (!v0) {
    return 0;
  }
  double v1 = (void *)v0;
  NSString v2 = sub_100042DB8();
  id v3 = [v1 BOOLForKey:v2];

  return v3;
}

BOOL sub_100042D80(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100042D9C()
{
  return swift_slowDealloc();
}

NSString sub_100042DB8()
{
  return sub_100053EE8();
}

uint64_t sub_100042DD8()
{
  uint64_t v1 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v1 - 8);
  sub_100019474();
  uint64_t v4 = v3 - v2;
  sub_100042F20();
  uint64_t v5 = type metadata accessor for DynamicRotationState();
  sub_100008010(v4, 1, 1, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_rotationState;
  swift_beginAccess();
  sub_10002B684(v4, v6);
  uint64_t result = swift_endAccess();
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  return result;
}

void sub_100042E9C(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  sub_100042768(a1, (uint64_t)v7);
  if (*((void *)&v7[0] + 1))
  {
    v9[0] = v7[0];
    v9[1] = v7[1];
    char v10 = v8;
    sub_100043048((uint64_t)v9, a2);
    if (a3 != 3) {
      sub_100042F74(*(double *)&a4);
    }
  }
  else
  {
    sub_100042F20();
  }
}

void sub_100042F20()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    [v1 removeFromSuperview];
    uint64_t v2 = *(void **)(v0 + 24);
  }
  else
  {
    uint64_t v2 = 0;
  }
  *(void *)(v0 + 24) = 0;

  uint64_t v3 = *(void **)(v0 + 16);
  *(void *)(v0 + 16) = 0;
}

id sub_100042F74(double a1)
{
  id result = *(id *)(v1 + 16);
  if (result)
  {
    double v3 = a1 * 6.66666667;
    double v4 = 1.0 - v3;
    BOOL v5 = v3 <= 1.0;
    double v6 = 0.0;
    if (v5) {
      double v6 = v4;
    }
    return [result setAlpha:v6];
  }
  return result;
}

uint64_t sub_100042FAC(uint64_t a1)
{
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  uint64_t v3 = v1 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_rotationState;
  uint64_t v4 = type metadata accessor for DynamicRotationState();
  sub_100008010(v3, 1, 1, v4);
  uint64_t v5 = v1 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_logger;
  sub_100053568();
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v5, a1);
  return v1;
}

void sub_100043048(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v5 = a2;
    id v46 = sub_100036BD0();
    id v6 = [self tertiaryLabelColor];
    id v7 = sub_100043CFC(v2, v5);
    char v8 = sub_100043E70(v2, v7, a1, v6);
    [v8 setFont:v46];
    [v8 setTextColor:v6];
    sub_100044244();
    if (*(unsigned char *)(a1 + 32))
    {
      id v9 = [v8 widthAnchor];
      id v10 = [v7 widthAnchor];
      id v11 = [v9 constraintLessThanOrEqualToAnchor:v10 multiplier:0.35];

      uint64_t v12 = *(void **)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint];
      *(void *)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint] = v11;

      id v13 = [v8 widthAnchor];
      id v14 = [v7 widthAnchor];
      id v15 = [v13 constraintLessThanOrEqualToAnchor:v14 constant:-32.0];

      uint64_t v16 = *(void **)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint];
      *(void *)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint] = v15;

      id v17 = self;
      sub_1000068D8(&qword_10006BBA0);
      uint64_t v18 = (__n128 *)swift_allocObject();
      id v19 = sub_100044D00(v18, (__n128)xmmword_100056D90);
      id v20 = [v7 *(SEL *)(v3 + 3440)];
      id v21 = [v19 constraintEqualToAnchor:v20];

      v18[2].n128_u64[0] = (unint64_t)v21;
      id v22 = [v8 bottomAnchor];
      id v23 = [v7 safeAreaLayoutGuide];
      id v24 = [v23 bottomAnchor];

      id v25 = [v22 constraintLessThanOrEqualToAnchor:v24 constant:-50.0];
      v18[2].n128_u64[1] = (unint64_t)v25;
      *(void *)&long long v48 = v18;
      sub_100053FE8();
      sub_100018DB0(0, (unint64_t *)&qword_10006BBA8);
      Class isa = sub_100053FB8().super.isa;
      swift_bridgeObjectRelease();
      [v17 activateConstraints:isa];

      sub_1000444CC();
    }
    else
    {
      char v32 = *(void **)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint];
      *(void *)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint] = 0;

      uint64_t v33 = *(void **)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint];
      *(void *)&v8[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint] = 0;

      uint64_t v34 = self;
      sub_1000068D8(&qword_10006BBA0);
      os_log_type_t v35 = (__n128 *)swift_allocObject();
      id v36 = sub_100044D00(v35, (__n128)xmmword_100055290);
      id v37 = [v7 *(SEL *)(v3 + 3440)];
      id v38 = [v36 constraintEqualToAnchor:v37];

      v35[2].n128_u64[0] = (unint64_t)v38;
      id v39 = [v8 centerYAnchor];
      id v40 = [v7 centerYAnchor];
      id v41 = [v39 constraintEqualToAnchor:v40];

      v35[2].n128_u64[1] = (unint64_t)v41;
      id v42 = [v8 widthAnchor];
      id v43 = [v7 widthAnchor];
      id v44 = [v42 constraintLessThanOrEqualToAnchor:v43 constant:-32.0];

      v35[3].n128_u64[0] = (unint64_t)v44;
      *(void *)&long long v48 = v35;
      sub_100053FE8();
      sub_100018DB0(0, (unint64_t *)&qword_10006BBA8);
      Class v45 = sub_100053FB8().super.isa;
      swift_bridgeObjectRelease();
      [v34 activateConstraints:v45];
    }
  }
  else
  {
    uint64_t v28 = *(void *)a1;
    unint64_t v27 = *(void *)(a1 + 8);
    long long v48 = *(_OWORD *)(a1 + 16);
    swift_bridgeObjectRetain();
    sub_100044C38((uint64_t)&v48);
    swift_bridgeObjectRetain();
    sub_100044C38((uint64_t)&v48);
    uint64_t v29 = sub_100053548();
    os_log_type_t v30 = sub_1000540F8();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_bridgeObjectRetain();
      sub_100029610(v28, v27, &v47);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      sub_100044C64((uint64_t)&v48);
      swift_bridgeObjectRelease();
      sub_100044C64((uint64_t)&v48);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "No parent view exists to add label; skipping showing message=%s",
        v31,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();

      sub_100044C64((uint64_t)&v48);
      swift_bridgeObjectRelease();
      sub_100044C64((uint64_t)&v48);
    }
  }
}

void sub_100043710(uint64_t a1)
{
  uint64_t v3 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v3 - 8);
  sub_10000AF50();
  uint64_t v57 = v4;
  uint64_t v5 = sub_1000531C8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_10000AF50();
  uint64_t v54 = v7;
  uint64_t v8 = sub_1000068D8(&qword_10006D548);
  sub_10000AFB4();
  __chkstk_darwin(v9);
  sub_100019474();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = type metadata accessor for DynamicRotationState();
  sub_10000AFB4();
  __chkstk_darwin(v14);
  sub_100019474();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = sub_1000068D8(&qword_10006D550);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v55 = (uint64_t)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  id v23 = (char *)&v53 - v22;
  __chkstk_darwin(v21);
  id v25 = (char *)&v53 - v24;
  uint64_t v56 = v6;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  *(void *)&long long v60 = a1;
  v26((char *)&v53 - v24, a1, v5);
  uint64_t v27 = 1;
  sub_100008010((uint64_t)v25, 0, 1, v5);
  *(void *)&long long v59 = v1;
  uint64_t v28 = v1 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_rotationState;
  swift_beginAccess();
  uint64_t v58 = v13;
  if (!sub_100007FE8(v28, 1, v13))
  {
    sub_10002B620(v28, v17);
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v23, v17, v5);
    uint64_t v27 = 0;
  }
  sub_100008010((uint64_t)v23, v27, 1, v5);
  uint64_t v29 = v12 + *(int *)(v8 + 48);
  sub_10000ADF0((uint64_t)v25, v12, &qword_10006D550);
  sub_10000ADF0((uint64_t)v23, v29, &qword_10006D550);
  sub_100044CE0(v12);
  if (v34)
  {
    sub_10001F7A8((uint64_t)v23, &qword_10006D550);
    sub_10001F7A8((uint64_t)v25, &qword_10006D550);
    sub_100044CE0(v29);
    if (v30) {
      uint64_t v31 = &qword_10006D550;
    }
    else {
      uint64_t v31 = &qword_10006D548;
    }
    if (v30) {
      char v32 = -1;
    }
    else {
      char v32 = 0;
    }
  }
  else
  {
    uint64_t v33 = v55;
    sub_10000ADF0(v12, v55, &qword_10006D550);
    sub_100044CE0(v29);
    if (v34)
    {
      sub_10001F7A8((uint64_t)v23, &qword_10006D550);
      sub_10001F7A8((uint64_t)v25, &qword_10006D550);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v33, v5);
      char v32 = 0;
      uint64_t v31 = &qword_10006D548;
    }
    else
    {
      uint64_t v35 = v56;
      uint64_t v36 = v54;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v54, v29, v5);
      sub_100044C90();
      uint64_t v37 = v33;
      char v38 = sub_100053ED8();
      id v39 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v39(v36, v5);
      uint64_t v31 = &qword_10006D550;
      sub_10001F7A8((uint64_t)v23, &qword_10006D550);
      sub_10001F7A8((uint64_t)v25, &qword_10006D550);
      uint64_t v40 = v37;
      char v32 = v38;
      v39(v40, v5);
    }
  }
  uint64_t v41 = v60;
  uint64_t v43 = v58;
  id v42 = (double *)v59;
  uint64_t v44 = v57;
  sub_10001F7A8(v12, v31);
  sub_10002B620(v41, v44);
  sub_100008010(v44, 0, 1, v43);
  swift_beginAccess();
  sub_10002B684(v44, v28);
  swift_endAccess();
  Class v45 = (void *)*((void *)v42 + 3);
  if (v45)
  {
    id v46 = v45;
    id v47 = [v46 superview];
    if (v47)
    {
      long long v48 = v47;
      [v47 frame];

      if ((v32 & 1) == 0 || v42[4] == 0.0 && v42[5] == 0.0)
      {
        [v46 bounds];
        *((void *)v42 + 4) = v49;
        *((void *)v42 + 5) = v50;
      }
      sub_10003E28C(*(void *)(v41 + *(int *)(v43 + 32)));
      CGAffineTransformMakeRotation(&v61, (float)((float)(*(float *)(v41 + *(int *)(v43 + 20)) * 3.1416) / 180.0));
      long long v59 = *(_OWORD *)&v61.c;
      long long v60 = *(_OWORD *)&v61.a;
      CGFloat tx = v61.tx;
      CGFloat ty = v61.ty;
      [v46 bounds];
      [v46 setBounds:];
      *(_OWORD *)&v61.CGFloat a = v60;
      *(_OWORD *)&v61.CGFloat c = v59;
      v61.CGFloat tx = tx;
      v61.CGFloat ty = ty;
      [v46 setTransform:&v61];
    }
  }
}

id sub_100043CFC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4)
  {
    id v5 = v4;
    id v6 = [v5 superview];
    if (v6)
    {
      uint64_t v7 = v6;
      sub_100018DB0(0, (unint64_t *)&qword_10006BF68);
      id v8 = a2;
      char v9 = sub_100054258();

      if (v9) {
        return v5;
      }
    }
  }
  id v11 = [objc_allocWithZone((Class)UIView) init];
  [a2 bounds];
  [v11 setFrame:];
  id v12 = [v11 layer];
  [v12 setZPosition:4.0];

  id v13 = [v11 layer];
  [v13 setAllowsGroupBlending:0];

  [a2 addSubview:v11];
  uint64_t v14 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v11;
  id v15 = v11;

  return v15;
}

char *sub_100043E70(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DynamicRotationState();
  __chkstk_darwin(v11);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void **)(a1 + 16);
  if (v14)
  {
    uint64_t v40 = v11;
    id v15 = v13;
    uint64_t v16 = a2;
    uint64_t v17 = v14;
    id v18 = [v17 superview];
    if (v18)
    {
      uint64_t v19 = v18;
      sub_100018DB0(0, (unint64_t *)&qword_10006BF68);
      id v20 = v16;
      char v21 = sub_100054258();

      if (v21)
      {
        long long v23 = *(_OWORD *)(a3 + 16);
        long long v41 = *(_OWORD *)a3;
        long long v22 = v41;
        long long v43 = v23;
        uint64_t v24 = &v17[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model];
        v24[32] = *(unsigned char *)(a3 + 32);
        *(_OWORD *)uint64_t v24 = v22;
        *((_OWORD *)v24 + 1) = v23;
        sub_100044C38((uint64_t)&v41);
        sub_100044C38((uint64_t)&v43);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v25 = *(void **)&v17[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_color];
        *(void *)&v17[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_color] = a4;
        id v26 = a4;

        return v17;
      }
    }

    a2 = v16;
    id v13 = v15;
    uint64_t v11 = v40;
  }
  long long v27 = *(_OWORD *)a3;
  long long v42 = *(_OWORD *)(a3 + 16);
  long long v43 = v27;
  id v28 = objc_allocWithZone((Class)type metadata accessor for PosterLabel());
  id v29 = a4;
  sub_100044C38((uint64_t)&v43);
  sub_100044C38((uint64_t)&v42);
  id v30 = sub_1000447C8(a3, (uint64_t)v29);
  [v30 setTextAlignment:1];
  [v30 setNumberOfLines:0];
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v31 = [v30 layer];
  NSString v32 = sub_100053EE8();
  [v31 setCompositingFilter:v32];

  [v30 setOverrideUserInterfaceStyle:2];
  [v30 setAdjustsFontForContentSizeCategory:1];
  LODWORD(v33) = 1148846080;
  [v30 setContentCompressionResistancePriority:1 forAxis:v33];
  [a2 addSubview:v30];
  char v34 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v30;
  uint64_t v17 = (char *)v30;

  uint64_t v35 = a1 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_rotationState;
  swift_beginAccess();
  sub_10000ADF0(v35, (uint64_t)v10, &qword_10006C308);
  if (sub_100007FE8((uint64_t)v10, 1, v11) == 1)
  {
    sub_10001F7A8((uint64_t)v10, &qword_10006C308);
  }
  else
  {
    sub_10002B870((uint64_t)v10, (uint64_t)v13);
    id v36 = [self currentDevice];
    id v37 = [v36 userInterfaceIdiom];

    if (v37 == (id)1) {
      sub_100043710((uint64_t)v13);
    }
    sub_10002B8D4((uint64_t)v13);
  }
  return v17;
}

void sub_100044244()
{
  uint64_t v1 = v0;
  id v2 = [v0 font];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [self configurationWithFont:v2];

    sub_100018DB0(0, (unint64_t *)&qword_10006D238);
    id v5 = &v1[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model];
    uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model + 16];
    uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model + 24];
    swift_bridgeObjectRetain();
    id v8 = v4;
    id v9 = sub_100044908(v6, v7, v4);
    id v10 = [objc_allocWithZone((Class)NSTextAttachment) init];
    if (v9) {
      id v11 = [v9 imageWithTintColor:*(void *)&v1[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_color]];
    }
    else {
      id v11 = 0;
    }
    [v10 setImage:v11];

    sub_100018DB0(0, &qword_10006D538);
    id v17 = sub_100044978();
    id v12 = [self attributedStringWithAttachment:v10];
    [v17 appendAttributedString:v12];

    if (v5[32]) {
      uint64_t v13 = 10;
    }
    else {
      uint64_t v13 = 32;
    }
    sub_100018DB0(0, &qword_10006D540);
    v19._countAndFlagsBits = v13;
    v19._object = (void *)0xE100000000000000;
    sub_100053F58(v19);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)v5;
    id v15 = (void *)*((void *)v5 + 1);
    swift_bridgeObjectRetain();
    v20._countAndFlagsBits = v14;
    v20._object = v15;
    sub_100053F58(v20);
    swift_bridgeObjectRelease();
    id v16 = sub_100044978();
    [v17 appendAttributedString:v16];

    [v1 setAttributedText:v17];
  }
  else
  {
    __break(1u);
  }
}

id sub_1000444CC()
{
  id v1 = [v0 traitCollection];
  id v2 = [v1 preferredContentSizeCategory];

  char v3 = sub_1000541C8();
  id v4 = *(void **)&v0[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint];
  if (v3)
  {
    if (v4) {
      [v4 setActive:1];
    }
  }
  else if (v4)
  {
    [v4 setActive:0];
  }
  id result = *(id *)&v0[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint];
  if (result)
  {
    return [result setActive:(v3 & 1) == 0];
  }
  return result;
}

uint64_t sub_1000445B4()
{
  sub_10001F7A8(v0 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_rotationState, &qword_10006C308);
  uint64_t v1 = v0 + OBJC_IVAR____TtC13WeatherPoster18PosterLabelManager_logger;
  sub_100053568();
  sub_10000AFB4();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t sub_100044638()
{
  sub_1000445B4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100044690()
{
  return type metadata accessor for PosterLabelManager();
}

uint64_t type metadata accessor for PosterLabelManager()
{
  uint64_t result = qword_10006D448;
  if (!qword_10006D448) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000446E0()
{
  sub_10002B5C4();
  if (v0 <= 0x3F)
  {
    sub_100053568();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

id sub_1000447C8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint] = 0;
  *(void *)&v2[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint] = 0;
  uint64_t v6 = &v2[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_model];
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a1;
  *((_OWORD *)v6 + 1) = v7;
  v6[32] = *(unsigned char *)(a1 + 32);
  *(void *)&v2[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_color] = a2;
  v9.receiver = v2;
  v9.super_class = ObjectType;
  return [super initWithFrame:0.0, 0.0, 0.0, 0.0];
}

void sub_100044868()
{
  *(void *)&v0[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_smallTypeWidthConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13WeatherPosterP33_A76A6EA094F378CBF19696357987AB1611PosterLabel_largeTypeWidthConstraint] = 0;

  sub_1000543F8();
  __break(1u);
}

id sub_100044908(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v5 = [(id)swift_getObjCClassFromMetadata() systemImageNamed:v4 withConfiguration:a3];

  return v5;
}

id sub_100044978()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithString:v1];

  return v2;
}

id sub_1000449EC()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_1000444CC();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return [super updateConstraints];
}

id sub_100044A7C(uint64_t a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)swift_getObjectType();
  [super traitCollectionDidChange:a1];
  sub_100044244();
  return [v1 setNeedsUpdateConstraints];
}

void sub_100044B44()
{
}

uint64_t type metadata accessor for PosterLabel()
{
  return self;
}

uint64_t sub_100044C38(uint64_t a1)
{
  return a1;
}

uint64_t sub_100044C64(uint64_t a1)
{
  return a1;
}

unint64_t sub_100044C90()
{
  unint64_t result = qword_10006D558;
  if (!qword_10006D558)
  {
    sub_1000531C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D558);
  }
  return result;
}

uint64_t sub_100044CE0(uint64_t a1)
{
  return sub_100007FE8(a1, 1, v1);
}

id sub_100044D00(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return [v2 centerXAnchor];
}

uint64_t *sub_100044D20(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000531C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    *(_DWORD *)((char *)a1 + v8) = *(_DWORD *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
  }
  return a1;
}

uint64_t sub_100044E08(uint64_t a1)
{
  uint64_t v2 = sub_1000531C8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100044E6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_DWORD *)(a1 + v7) = *(_DWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_100044F04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_DWORD *)(a1 + a3[6]) = *(_DWORD *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_100044FA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_DWORD *)(a1 + v7) = *(_DWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_10004503C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000531C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_DWORD *)(a1 + v7) = *(_DWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t sub_1000450D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000450E8);
}

uint64_t sub_1000450E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000531C8();

  return sub_100007FE8(a1, a2, v4);
}

uint64_t sub_100045130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100045144);
}

uint64_t sub_100045144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000531C8();

  return sub_100008010(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DynamicRotationState()
{
  uint64_t result = qword_10006D5B8;
  if (!qword_10006D5B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000451D8()
{
  uint64_t result = sub_1000531C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_100045284(NSObject *a1, uint64_t a2)
{
  uint64_t v5 = sub_1000531C8();
  sub_10000E978();
  uint64_t v186 = v6;
  __chkstk_darwin(v7);
  sub_10000AF50();
  sub_100047150(v8);
  uint64_t v184 = type metadata accessor for DynamicRotationState();
  sub_10000AFB4();
  __chkstk_darwin(v9);
  sub_10000AF50();
  sub_10004718C(v10);
  uint64_t v11 = sub_1000068D8(&qword_10006C378);
  uint64_t v12 = sub_10000AFD4(v11);
  __chkstk_darwin(v12);
  sub_10000AF50();
  sub_100047150(v13);
  uint64_t v212 = sub_1000539E8();
  sub_10000E978();
  uint64_t v211 = v14;
  __chkstk_darwin(v15);
  sub_10000AF50();
  sub_100047150(v16);
  uint64_t v209 = sub_100053CB8();
  sub_10000E978();
  uint64_t v208 = v17;
  __chkstk_darwin(v18);
  sub_10000AF50();
  sub_100047150(v19);
  uint64_t v207 = sub_100053758();
  sub_10000E978();
  uint64_t v206 = v20;
  __chkstk_darwin(v21);
  sub_10000AF50();
  sub_100047150(v22);
  uint64_t v204 = sub_100053918();
  sub_10000E978();
  uint64_t v203 = v23;
  __chkstk_darwin(v24);
  sub_10000AF50();
  sub_10004718C(v25);
  uint64_t v26 = sub_1000068D8(&qword_10006BE78);
  uint64_t v27 = sub_10000AFD4(v26);
  __chkstk_darwin(v27);
  sub_10000AF50();
  sub_100047150(v28);
  uint64_t v29 = sub_100053248();
  uint64_t v30 = sub_10000AFD4(v29);
  __chkstk_darwin(v30);
  sub_10000AF50();
  sub_10004718C(v31);
  uint64_t v32 = sub_1000068D8((uint64_t *)&unk_10006C4C0);
  uint64_t v33 = sub_10000AFD4(v32);
  uint64_t v34 = __chkstk_darwin(v33);
  uint64_t v202 = (uint64_t)v176 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  uint64_t v222 = (uint64_t)v176 - v36;
  sub_10000AFE0();
  uint64_t v199 = sub_100053198();
  sub_10000E978();
  uint64_t v198 = v37;
  __chkstk_darwin(v38);
  sub_10000AF50();
  uint64_t v221 = v39;
  uint64_t v40 = sub_1000068D8(&qword_10006C068);
  uint64_t v41 = sub_10000AFD4(v40);
  __chkstk_darwin(v41);
  sub_10000AF50();
  uint64_t v220 = v42;
  sub_10000AFE0();
  uint64_t v201 = sub_100053A18();
  sub_10000E978();
  uint64_t v200 = v43;
  __chkstk_darwin(v44);
  sub_10000AF50();
  sub_10004718C(v45);
  uint64_t v46 = sub_1000068D8(&qword_10006D228);
  uint64_t v47 = sub_10000AFD4(v46);
  __chkstk_darwin(v47);
  sub_10000AF50();
  sub_100047150(v48);
  uint64_t v218 = sub_100053C28();
  sub_10000E978();
  uint64_t v197 = v49;
  __chkstk_darwin(v50);
  sub_10000AF50();
  uint64_t v219 = v51;
  sub_10000AFE0();
  uint64_t v194 = sub_100053878();
  sub_10000E978();
  v193 = v52;
  __chkstk_darwin(v53);
  sub_10000AF50();
  sub_100047150(v54);
  uint64_t v217 = sub_100053E38();
  sub_10000E978();
  uint64_t v196 = v55;
  __chkstk_darwin(v56);
  sub_10000AF50();
  uint64_t v224 = v57;
  sub_10000AFE0();
  uint64_t v216 = sub_1000533B8();
  sub_10000E978();
  v192 = v58;
  __chkstk_darwin(v59);
  sub_10000AF50();
  uint64_t v223 = v60;
  sub_10000AFE0();
  uint64_t v191 = sub_100053888();
  sub_10000E978();
  uint64_t v190 = v61;
  __chkstk_darwin(v62);
  sub_10000AF50();
  sub_100047150(v63);
  uint64_t v188 = sub_100053CA8();
  sub_10000E978();
  uint64_t v189 = v64;
  __chkstk_darwin(v65);
  sub_10000AF50();
  uint64_t v226 = v66;
  sub_10000AFE0();
  char v67 = (int *)type metadata accessor for PosterAnimationViewModel();
  sub_10000AFB4();
  __chkstk_darwin(v68);
  sub_10000AF50();
  sub_10004718C(v69);
  uint64_t v70 = sub_1000068D8(&qword_10006C4E0);
  sub_10000AFB4();
  __chkstk_darwin(v71);
  uint64_t v73 = (char *)v176 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_1000068D8(&qword_10006C320);
  uint64_t v75 = sub_10000AFD4(v74);
  uint64_t v76 = __chkstk_darwin(v75);
  unint64_t v78 = (char *)v176 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __chkstk_darwin(v76);
  uint64_t v81 = (char *)v176 - v80;
  __chkstk_darwin(v79);
  uint64_t v83 = (char *)v176 - v82;
  uint64_t v84 = v67[17];
  v227 = a1;
  uint64_t v85 = *(Class *)((char *)&a1->isa + v84);
  if (v85)
  {
    uint64_t v181 = v84;
    uint64_t v180 = v5;
    uint64_t v225 = a2;
    uint64_t v86 = self;
    id v214 = v85;
    v179 = v86;
    id v87 = [v86 currentDevice];
    id v88 = [v87 userInterfaceIdiom];

    if (v88 == (id)1)
    {
      uint64_t v89 = v2;
      BOOL v90 = (*(unsigned char *)(v2 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotKind + 8) & 1) == 0
         && *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotKind) == v225;
      LODWORD(v182) = !v90;
    }
    else
    {
      LODWORD(v182) = 0;
      uint64_t v89 = v2;
    }
    sub_100047034((uint64_t)v227, (uint64_t)v83);
    sub_100008010((uint64_t)v83, 0, 1, (uint64_t)v67);
    uint64_t v96 = v89 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotModel;
    swift_beginAccess();
    uint64_t v97 = (uint64_t)&v73[*(int *)(v70 + 48)];
    sub_10000ADF0((uint64_t)v83, (uint64_t)v73, &qword_10006C320);
    sub_10000ADF0(v96, v97, &qword_10006C320);
    sub_10001F970((uint64_t)v73);
    if (v100)
    {
      sub_10000AE4C((uint64_t)v83, &qword_10006C320);
      sub_10001F970(v97);
      uint64_t v98 = v225;
      uint64_t v99 = v2;
      if (v100)
      {
        sub_10000AE4C((uint64_t)v73, &qword_10006C320);
LABEL_23:
        int v103 = (int)v182;
        if (!*(void *)(v99 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotView)) {
          int v103 = 1;
        }
        if (v103 != 1)
        {
          v141 = sub_100053548();
          os_log_type_t v142 = sub_100054118();
          if (os_log_type_enabled(v141, v142))
          {
            uint64_t v143 = (_DWORD *)sub_10003E700();
            uint64_t v228 = sub_100019538();
            *uint64_t v143 = 136446210;
            uint64_t v144 = sub_10003BA18(v98);
            uint64_t v146 = sub_100029610(v144, v145, &v228);
            sub_1000471B0(v146);
            sub_100054288();
            swift_bridgeObjectRelease();
            sub_10003E744((void *)&_mh_execute_header, v147, v148, "Skipping creating snapshot for model because we already have a snapshot for kind=%{public}s");
            swift_arrayDestroy();
            sub_10000E950();
            sub_10000E950();
          }

          goto LABEL_39;
        }
LABEL_26:
        uint64_t v104 = v227;
        sub_100047034((uint64_t)v227, (uint64_t)v78);
        sub_100008010((uint64_t)v78, 0, 1, (uint64_t)v67);
        swift_beginAccess();
        sub_100046FCC((uint64_t)v78, v96);
        swift_endAccess();
        uint64_t v105 = v99 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotKind;
        *(void *)uint64_t v105 = v98;
        *(unsigned char *)(v105 + 8) = 0;
        if (qword_10006BB48 != -1) {
          swift_once();
        }
        sub_100033A80(qword_10006D600, qword_10006D618);
        int v106 = sub_10003C458(v98);
        if (v106)
        {
          os_log_type_t v107 = v106;
          uint64_t v108 = sub_100053548();
          os_log_type_t v109 = sub_100054118();
          if (os_log_type_enabled(v108, v109))
          {
            os_log_type_t v110 = (uint8_t *)sub_10003E700();
            uint64_t v228 = sub_100019538();
            uint64_t v111 = sub_1000471C8(4.8751e-34);
            uint64_t v113 = sub_100029610(v111, v112, &v228);
            sub_100047198(v113);
            sub_100054288();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v108, v109, "Adding cached snapshot to view for kind=%{public}s", v110, 0xCu);
            swift_arrayDestroy();
            sub_10000E950();
            sub_10000E950();
          }

          uint64_t v114 = v214;
          sub_100046B2C((uint64_t)v107, v98, v214);

          return;
        }
        uint64_t v178 = *(void *)(v99 + 16);
        uint64_t v187 = (uint64_t)v104 + v67[6];
        v182 = (void (*)(uint64_t))*((void *)v192 + 2);
        v182(v223);
        v192 = (char *)v104 + v67[12];
        uint64_t v196 = *(void *)(v196 + 16);
        ((void (*)(uint64_t))v196)(v224);
        v176[1] = *((unsigned __int8 *)&v104->isa + v67[13]);
        uint64_t v115 = enum case for WeatherConditionGradientModel.AnimationContext.vfx(_:);
        sub_100053868();
        sub_10000AFB4();
        (*(void (**)(uint64_t, uint64_t))(v116 + 104))(v195, v115);
        sub_1000471E8();
        sub_100047160();
        v117();
        uint64_t v194 = v67[8];
        v193 = (char *)v227 + v67[9];
        v177 = *(void (**)(uint64_t))(v197 + 16);
        uint64_t v118 = v219;
        v177(v219);
        uint64_t v119 = v223;
        sub_100053858();
        sub_1000538E8();
        sub_10000B02C();
        v120();
        uint64_t v195 = v99;
        uint64_t v197 = *(void *)(v99 + 24);
        ((void (*)(uint64_t, uint64_t, uint64_t))v182)(v119, v187, v216);
        id v121 = [self milesPerHour];
        sub_100018DB0(0, &qword_10006C380);
        sub_100052EF8();
        uint64_t v122 = v227;
        ((void (*)(uint64_t, char *, uint64_t))v177)(v118, v193, v218);
        ((void (*)(uint64_t, char *, uint64_t))v196)(v224, v192, v217);
        (*(void (**)(uint64_t, char *, uint64_t))(v198 + 16))(v221, (char *)v122 + v67[5], v199);
        sub_10000ADF0((uint64_t)v122 + v67[10], v222, (uint64_t *)&unk_10006C4C0);
        sub_10000ADF0((uint64_t)v122 + v67[11], v202, (uint64_t *)&unk_10006C4C0);
        sub_1000534A8();
        sub_10000ADF0((uint64_t)v122 + v67[14], v205, &qword_10006BE78);
        sub_1000471E8();
        sub_100047160();
        v123();
        sub_1000471E8();
        sub_100047160();
        v124();
        (*(void (**)(uint64_t, char *, uint64_t))(v208 + 16))(v210, (char *)v122 + v67[16], v209);
        sub_1000471E8();
        sub_100047160();
        v125();
        uint64_t v126 = sub_100053C78();
        sub_100008010(v213, 1, 1, v126);
        uint64_t v127 = v225;
        sub_100053A08();
        uint64_t v128 = v215;
        sub_100053A28();
        sub_10000B02C();
        v129();
        sub_100033A80(qword_10006D600, qword_10006D618);
        uint64_t v130 = sub_10003C9A0(v128, v226, v127);
        if (v130)
        {
          uint64_t v131 = (UIImage *)v130;
          uint64_t v132 = sub_100053548();
          os_log_type_t v133 = sub_100054118();
          if (os_log_type_enabled(v132, v133))
          {
            uint64_t v134 = (uint8_t *)sub_10003E700();
            uint64_t v228 = sub_100019538();
            uint64_t v135 = sub_1000471C8(4.8751e-34);
            uint64_t v137 = sub_100029610(v135, v136, &v228);
            sub_100047198(v137);
            sub_100054288();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v132, v133, "Adding snapshot to view for kind=%{public}s", v134, 0xCu);
            swift_arrayDestroy();
            uint64_t v128 = v215;
            sub_10000E950();
            sub_10000E950();
          }

          uint64_t v138 = v214;
          uint64_t v139 = v188;
          uint64_t v140 = v189;
          sub_100046B2C((uint64_t)v131, v127, v214);
          sub_100033A80(qword_10006D600, qword_10006D618);
          sub_10003BEEC(v131, v127);

          sub_10000AE4C(v128, &qword_10006D228);
          (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v226, v139);
          return;
        }
        uint64_t v149 = v195;
        uint64_t v150 = sub_100053548();
        os_log_type_t v151 = sub_1000540F8();
        if (os_log_type_enabled(v150, v151))
        {
          uint64_t v152 = (_DWORD *)sub_10003E700();
          uint64_t v228 = sub_100019538();
          _DWORD *v152 = 136446210;
          uint64_t v153 = v127;
          uint64_t v154 = sub_10003BA18(v127);
          uint64_t v156 = sub_100029610(v154, v155, &v228);
          sub_1000471B0(v156);
          uint64_t v122 = v227;
          uint64_t v128 = v215;
          sub_100054288();
          swift_bridgeObjectRelease();
          sub_10003E744((void *)&_mh_execute_header, v157, v158, "Adding gradient to view because no snapshot image exists for kind=%{public}s");
          swift_arrayDestroy();
          sub_10000E950();
          sub_10000E950();
        }
        else
        {
          uint64_t v153 = v127;
        }

        uint64_t v159 = v180;
        v160 = v179;
        v161 = *(char **)((char *)&v122->isa + v181);
        if (v161) {
          v161 = sub_100006038(v226);
        }
        v162 = (void **)(v149 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotGradientView);
        swift_beginAccess();
        v163 = *v162;
        char *v162 = v161;

        id v164 = [v160 currentDevice];
        id v165 = [v164 userInterfaceIdiom];

        if (v165 != (id)1)
        {

LABEL_51:
          sub_10000AE4C(v128, &qword_10006D228);
          uint64_t v172 = sub_100047170();
          v173(v172);
          return;
        }
        swift_beginAccess();
        uint64_t v166 = *v162;
        if (v166)
        {
          swift_endAccess();
          id v167 = v166;
          uint64_t v168 = v183;
          sub_1000531B8();
          int v169 = 0;
          if ((unint64_t)(v153 - 2) <= 2) {
            int v169 = dword_100056FAC[v153 - 2];
          }
          uint64_t v170 = v185;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v186 + 32))(v185, v168, v159);
          uint64_t v171 = (int *)v184;
          *(_DWORD *)(v170 + *(int *)(v184 + 20)) = v169;
          *(_DWORD *)(v170 + v171[6]) = 1065353216;
          *(void *)(v170 + v171[7]) = v153;
          *(void *)(v170 + v171[8]) = v153;
          sub_10002A978(v170);

          sub_100047098(v170, (void (*)(void))type metadata accessor for DynamicRotationState);
          goto LABEL_51;
        }
        sub_10000AE4C(v128, &qword_10006D228);
        uint64_t v174 = sub_100047170();
        v175(v174);
        swift_endAccess();
LABEL_39:

        return;
      }
    }
    else
    {
      sub_10000ADF0((uint64_t)v73, (uint64_t)v81, &qword_10006C320);
      sub_10001F970(v97);
      if (!v100)
      {
        uint64_t v101 = v187;
        sub_1000470EC(v97, v187);
        char v102 = sub_100009ED4((uint64_t)v81, v101);
        sub_100047098(v101, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v83, &qword_10006C320);
        sub_100047098((uint64_t)v81, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v73, &qword_10006C320);
        uint64_t v98 = v225;
        uint64_t v99 = v2;
        if ((v102 & 1) == 0) {
          goto LABEL_26;
        }
        goto LABEL_23;
      }
      sub_10000AE4C((uint64_t)v83, &qword_10006C320);
      sub_100047098((uint64_t)v81, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
      uint64_t v98 = v225;
      uint64_t v99 = v2;
    }
    sub_10000AE4C((uint64_t)v73, &qword_10006C4E0);
    goto LABEL_26;
  }
  v227 = sub_100053548();
  os_log_type_t v91 = sub_100054118();
  if (os_log_type_enabled(v227, v91))
  {
    id v92 = (uint8_t *)sub_10003E700();
    uint64_t v229 = sub_100019538();
    *(_DWORD *)id v92 = 136446210;
    uint64_t v93 = sub_10003BA18(a2);
    uint64_t v228 = sub_100029610(v93, v94, &v229);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v227, v91, "Skipping creating snapshot for model because parent view does not exist for kind=%{public}s", v92, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {
    id v95 = v227;
  }
}

uint64_t sub_10004686C()
{
  uint64_t v1 = sub_1000068D8(&qword_10006C320);
  uint64_t v2 = sub_10000AFD4(v1);
  __chkstk_darwin(v2);
  uint64_t v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotView;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotView);
  if (v6) {
    [v6 removeFromSuperview];
  }
  uint64_t v7 = (id *)(v0 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotGradientView);
  swift_beginAccess();
  if (*v7) {
    [*v7 removeFromSuperview];
  }
  uint64_t v8 = *(void **)(v0 + v5);
  *(void *)(v0 + v5) = 0;

  id v9 = *v7;
  id *v7 = 0;

  uint64_t v10 = type metadata accessor for PosterAnimationViewModel();
  sub_100008010((uint64_t)v4, 1, 1, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotModel;
  swift_beginAccess();
  sub_100046FCC((uint64_t)v4, v11);
  uint64_t result = swift_endAccess();
  uint64_t v13 = v0 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotKind;
  *(void *)uint64_t v13 = 0;
  *(unsigned char *)(v13 + 8) = 1;
  return result;
}

id sub_1000469B0()
{
  uint64_t v0 = type metadata accessor for VFXSnapshotManager();
  uint64_t v1 = swift_allocObject();
  id result = [self defaultManager];
  *(void *)(v1 + 16) = result;
  qword_10006D618 = v0;
  unk_10006D620 = &off_100067350;
  qword_10006D600 = v1;
  return result;
}

uint64_t sub_100046A24(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100053908();
  swift_allocObject();
  *(void *)(v1 + 16) = sub_1000538F8();
  sub_100053A48();
  swift_allocObject();
  *(void *)(v1 + 24) = sub_100053A38();
  uint64_t v4 = v1 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotModel;
  uint64_t v5 = type metadata accessor for PosterAnimationViewModel();
  sub_100008010(v4, 1, 1, v5);
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotView) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotGradientView) = 0;
  uint64_t v6 = v2 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotKind;
  *(void *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 8) = 1;
  uint64_t v7 = v2 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_logger;
  sub_100053568();
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v7, a1);
  return v2;
}

void sub_100046B2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotView;
  id v9 = *(void **)(v3 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotView);
  if (v9)
  {
    id v10 = v9;
    id v11 = [v10 superview];
    if (v11)
    {
      uint64_t v12 = v11;
      sub_100018DB0(0, (unint64_t *)&qword_10006BF68);
      id v13 = a3;
      id v14 = v12;
      LOBYTE(v12) = sub_100054258();

      if (v12)
      {
        [v10 setImage:a1];
        goto LABEL_7;
      }
    }
  }
  id v10 = [objc_allocWithZone((Class)UIImageView) initWithImage:a1];
  sub_100006124(v10, 3);
LABEL_7:
  uint64_t v15 = *(void **)(v4 + v8);
  *(void *)(v4 + v8) = v10;
  id v20 = v10;

  id v16 = [self currentDevice];
  id v17 = [v16 userInterfaceIdiom];

  if (v17 == (id)1)
  {
    if (a2 == 4 || a2 == 2)
    {
      CGAffineTransformMakeRotation(&v21, 3.1415925);
    }
    else
    {
      long long v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v21.CGFloat a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v21.CGFloat c = v19;
      *(_OWORD *)&v21.CGFloat tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    [v20 setTransform:&v21];
  }
  else
  {
  }
}

uint64_t sub_100046D3C()
{
  swift_release();
  swift_release();
  sub_10000AE4C(v0 + OBJC_IVAR____TtC13WeatherPoster19VFXSnapshotRenderer_snapshotModel, &qword_10006C320);

  sub_100053568();
  sub_10000AFB4();
  sub_10000B02C();
  v1();
  return v0;
}

uint64_t sub_100046DDC()
{
  sub_100046D3C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100046E34()
{
  return type metadata accessor for VFXSnapshotRenderer();
}

uint64_t type metadata accessor for VFXSnapshotRenderer()
{
  uint64_t result = qword_10006D678;
  if (!qword_10006D678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100046E84()
{
  sub_100046F74();
  if (v0 <= 0x3F)
  {
    sub_100053568();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100046F74()
{
  if (!qword_10006C1C8)
  {
    type metadata accessor for PosterAnimationViewModel();
    unint64_t v0 = sub_100054278();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C1C8);
    }
  }
}

uint64_t sub_100046FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100047034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PosterAnimationViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100047098(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  sub_10000B02C();
  v3();
  return a1;
}

uint64_t sub_1000470EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PosterAnimationViewModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100047150@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_100047170()
{
  return *(void *)(v0 - 192);
}

void sub_10004718C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_100047198(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return v1 - 176;
}

uint64_t sub_1000471B0(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return v1 - 176;
}

uint64_t sub_1000471C8(float a1)
{
  *uint64_t v1 = a1;
  return sub_10003BA18(v2);
}

void *sub_1000471F4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100053D98();
  sub_10000E978();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_10004BB9C();
  id v8 = [self mainScreen];
  [v8 bounds];

  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v1, enum case for MicaBackgroundAnimation.Mode.poster(_:), v4);
  id v9 = objc_allocWithZone((Class)sub_100053DD8());
  v1[2] = sub_100053D48();
  sub_100053908();
  swift_allocObject();
  v1[3] = sub_1000538F8();
  v1[4] = 0;
  v1[5] = 0;
  v1[6] = 0;
  uint64_t v10 = (uint64_t)v1 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  uint64_t v11 = type metadata accessor for PosterAnimationViewModel();
  sub_1000193F8(v10, v12, v13, v11);
  uint64_t v14 = (uint64_t)v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rotationState;
  uint64_t v15 = type metadata accessor for DynamicRotationState();
  sub_1000193F8(v14, v16, v17, v15);
  *(void *)((char *)v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer) = 0;
  *(void *)((char *)v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rendererDelegate + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v18 = (char *)v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_logger;
  sub_100053568();
  sub_10000AFB4();
  (*(void (**)(char *, uint64_t))(v19 + 32))(v18, a1);
  return v2;
}

void sub_1000473E0(uint64_t a1, int a2)
{
  int v141 = a2;
  uint64_t v133 = sub_100053768();
  sub_10000E978();
  uint64_t v128 = v4;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_100053788();
  sub_10000E978();
  uint64_t v134 = v8;
  __chkstk_darwin(v9);
  sub_10000AF50();
  sub_100047150(v10);
  uint64_t v138 = sub_1000537A8();
  sub_10000E978();
  uint64_t v144 = v11;
  __chkstk_darwin(v12);
  sub_10000AFF8();
  sub_10004BB70();
  __chkstk_darwin(v13);
  sub_10004BB80();
  sub_100047150(v14);
  uint64_t v143 = sub_100053568();
  sub_10000E978();
  uint64_t v142 = v15;
  __chkstk_darwin(v16);
  sub_10004BBFC();
  sub_10004718C(v17);
  uint64_t v131 = v18;
  __chkstk_darwin(v19);
  sub_10004BB80();
  sub_100047150(v20);
  uint64_t v137 = sub_100053CA8();
  sub_10000E978();
  uint64_t v136 = v21;
  __chkstk_darwin(v22);
  sub_10000AF50();
  sub_10004718C(v23);
  uint64_t v24 = sub_1000068D8(&qword_10006C370);
  uint64_t v25 = sub_10000AFD4(v24);
  __chkstk_darwin(v25);
  sub_10000AFF8();
  sub_10004BB70();
  __chkstk_darwin(v26);
  sub_10004BB80();
  uint64_t v152 = v27;
  uint64_t v28 = type metadata accessor for PosterAnimationViewModel();
  sub_10000E978();
  uint64_t v129 = v29;
  __chkstk_darwin(v30);
  sub_10004BBFC();
  uint64_t v150 = v31;
  __chkstk_darwin(v32);
  sub_10004BB80();
  uint64_t v151 = v33;
  __chkstk_darwin(v34);
  sub_10004BB80();
  sub_10004718C(v35);
  uint64_t v130 = v36;
  __chkstk_darwin(v37);
  sub_10004BB80();
  sub_10004718C(v38);
  uint64_t v39 = sub_1000068D8(&qword_10006C4E0);
  uint64_t v40 = v39 - 8;
  __chkstk_darwin(v39);
  sub_10004BB9C();
  uint64_t v41 = sub_1000068D8(&qword_10006C320);
  uint64_t v42 = sub_10000AFD4(v41);
  __chkstk_darwin(v42);
  sub_10000AFF8();
  sub_10004BB70();
  __chkstk_darwin(v43);
  sub_10004BB70();
  __chkstk_darwin(v44);
  sub_10004BB70();
  uint64_t v46 = __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v125 - v47;
  __chkstk_darwin(v46);
  uint64_t v50 = (char *)&v125 - v49;
  uint64_t v153 = a1;
  sub_10004BB18();
  sub_10004BBB4();
  uint64_t v51 = v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v52 = v2 + *(int *)(v40 + 56);
  sub_10001F5E0((uint64_t)v50, v2, &qword_10006C320);
  sub_10001F5E0(v51, v52, &qword_10006C320);
  sub_10004BC10(v2);
  if (v54)
  {
    sub_10000AE4C((uint64_t)v50, &qword_10006C320);
    sub_10004BC10(v52);
    uint64_t v53 = v153;
    if (v54)
    {
      sub_10000AE4C(v2, &qword_10006C320);
LABEL_17:
      uint64_t v77 = v150;
      sub_10004BB18();
      char v67 = sub_100053548();
      os_log_type_t v68 = sub_100054118();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v69 = 136446210;
        sub_100053198();
        sub_10004B800((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v78 = sub_1000544E8();
        uint64_t v80 = sub_100029610(v78, v79, aBlock);
        sub_10004BBE8(v80);
        sub_100054288();
        swift_bridgeObjectRelease();
        sub_10004B418(v77, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        uint64_t v73 = "Animation already reflects the view model with weather data at date=%{public}s";
        goto LABEL_19;
      }

      uint64_t v81 = v77;
LABEL_22:
      sub_10004B418(v81, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
      return;
    }
    goto LABEL_9;
  }
  sub_10001F5E0(v2, (uint64_t)v48, &qword_10006C320);
  sub_10004BC10(v52);
  if (v54)
  {
    sub_10000AE4C((uint64_t)v50, &qword_10006C320);
    sub_10004B418((uint64_t)v48, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    uint64_t v53 = v153;
LABEL_9:
    sub_10000AE4C(v2, &qword_10006C4E0);
    uint64_t v55 = v152;
    goto LABEL_10;
  }
  uint64_t v74 = v28;
  uint64_t v75 = v149;
  sub_10004B3C4();
  char v76 = sub_100009ED4((uint64_t)v48, v75);
  sub_10004B418(v75, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_10000AE4C((uint64_t)v50, &qword_10006C320);
  sub_10004B418((uint64_t)v48, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  uint64_t v28 = v74;
  sub_10000AE4C(v2, &qword_10006C320);
  uint64_t v55 = v152;
  uint64_t v53 = v153;
  if (v76) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v56 = (char *)v2;
  uint64_t v57 = v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rendererDelegate;
  if (!swift_unknownObjectWeakLoadStrong()
    || (uint64_t v58 = *(void *)(v57 + 8),
        uint64_t ObjectType = swift_getObjectType(),
        LOBYTE(v58) = (*(uint64_t (**)(uint64_t, uint64_t))(v58 + 8))(ObjectType, v58),
        swift_unknownObjectRelease(),
        (v58 & 1) == 0))
  {
    uint64_t v66 = v151;
    sub_10004BB18();
    char v67 = sub_100053548();
    os_log_type_t v68 = sub_100054118();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 136446210;
      sub_100053198();
      sub_10004B800((unint64_t *)&qword_10006C4D0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v70 = sub_1000544E8();
      uint64_t v72 = sub_100029610(v70, v71, aBlock);
      sub_10004BBE8(v72);
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_10004B418(v66, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
      uint64_t v73 = "Animation was not granted a render session; Skipping render of weather data at date=%{public}s";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v67, v68, v73, v69, 0xCu);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();

      return;
    }

    uint64_t v81 = v66;
    goto LABEL_22;
  }
  uint64_t v60 = v148;
  sub_10001F5E0(v51, v148, &qword_10006C320);
  uint64_t v61 = v145;
  sub_10004BB18();
  sub_10004BBB4();
  sub_100019410();
  sub_1000186C8(v61, v51, &qword_10006C320);
  swift_endAccess();
  uint64_t v62 = v146;
  sub_10001F5E0(v60, v146, &qword_10006C320);
  int v63 = sub_100007FE8(v62, 1, v28);
  uint64_t v64 = (void *)&unk_100070000;
  uint64_t v126 = v7;
  if (v63 == 1)
  {
    sub_10000AE4C(v62, &qword_10006C320);
    uint64_t v65 = v147;
    goto LABEL_41;
  }
  uint64_t v82 = v140;
  sub_10004B3C4();
  uint64_t v83 = *(int *)(v28 + 68);
  uint64_t v84 = *(void **)(v82 + v83);
  uint64_t v85 = *(void **)(v53 + v83);
  if (v84)
  {
    uint64_t v86 = v139;
    if (v85)
    {
      sub_100018DB0(0, (unint64_t *)&qword_10006BF68);
      id v87 = v85;
      id v88 = v84;
      char v89 = sub_100054258();

      if (v89) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    uint64_t v86 = v139;
    if (!v85) {
      goto LABEL_37;
    }
  }
  BOOL v90 = sub_100053548();
  os_log_type_t v91 = sub_100054118();
  if (os_log_type_enabled(v90, v91))
  {
    id v92 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v92 = 0;
    _os_log_impl((void *)&_mh_execute_header, v90, v91, "Resetting views due to change in background view", v92, 2u);
    sub_10000E950();
  }

  uint64_t v93 = 1;
  swift_beginAccess();
  uint64_t v94 = *((void *)v56 + 5);
  if (v94)
  {
    uint64_t v95 = v94 + OBJC_IVAR____TtC13WeatherPoster12GradientView_skyBackgroundGradient;
    swift_beginAccess();
    uint64_t v96 = v136;
    uint64_t v97 = v137;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v136 + 16))(v55, v95, v137);
    uint64_t v93 = 0;
  }
  else
  {
    uint64_t v97 = v137;
    uint64_t v96 = v136;
  }
  sub_100008010(v55, v93, 1, v97);
  uint64_t v98 = (void *)*((void *)v56 + 5);
  *((void *)v56 + 5) = 0;

  uint64_t v99 = (void *)*((void *)v56 + 4);
  *((void *)v56 + 4) = 0;

  char v100 = (void *)*((void *)v56 + 6);
  *((void *)v56 + 6) = 0;

  sub_10001F5E0(v55, v86, &qword_10006C370);
  if (sub_100007FE8(v86, 1, v97) != 1)
  {
    uint64_t v101 = v127;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 32))(v127, v86, v97);
    if ((*(unsigned char *)(v82 + *(int *)(v28 + 60)) & 1) == 0)
    {
      sub_1000484F8(v101);
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v101, v97);
      sub_10000AE4C(v55, &qword_10006C370);
      uint64_t v102 = v82;
      goto LABEL_39;
    }
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v101, v97);
    sub_10000AE4C(v55, &qword_10006C370);
LABEL_37:
    uint64_t v102 = v82;
LABEL_39:
    sub_10004B418(v102, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    goto LABEL_40;
  }
  sub_10000AE4C(v55, &qword_10006C370);
  sub_10004B418(v82, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
  sub_10000AE4C(v86, &qword_10006C370);
LABEL_40:
  uint64_t v65 = v147;
  uint64_t v64 = &unk_100070000;
LABEL_41:
  if (*(unsigned char *)(v53 + *(int *)(v28 + 60)) != 1)
  {
    sub_100048894();
LABEL_51:
    uint64_t v124 = v60;
    goto LABEL_52;
  }
  if (v141)
  {
    sub_100053DD8();
    sub_100053A68(0);
  }
  int v103 = (void *)sub_100053DB8();
  [v103 speed];
  float v105 = v104;

  if (v105 == 0.0) {
    double v106 = 0.0;
  }
  else {
    double v106 = 0.25;
  }
  uint64_t v107 = v142;
  uint64_t v108 = *(void (**)(uint64_t, char *, uint64_t))(v142 + 16);
  uint64_t v109 = v143;
  v108((uint64_t)v65, &v56[v64[276]], v143);
  sub_100048E94(v153, 1);
  if (v106 <= 0.0)
  {
    sub_100049998();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v65, v109);
    goto LABEL_51;
  }
  sub_100018DB0(0, &qword_10006C038);
  uint64_t v151 = sub_100054178();
  sub_100053798();
  sub_1000537C8();
  uint64_t v110 = *(void *)(v144 + 8);
  v144 += 8;
  uint64_t v152 = v110;
  sub_10000B02C();
  v111();
  uint64_t v112 = swift_allocObject();
  swift_weakInit();
  sub_10004BB18();
  uint64_t v113 = v132;
  v108(v132, v65, v109);
  uint64_t v114 = v128;
  unint64_t v115 = (v130
        + *(unsigned __int8 *)(v107 + 80)
        + ((*(unsigned __int8 *)(v129 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80);
  uint64_t v116 = swift_allocObject();
  *(void *)(v116 + 16) = v112;
  sub_10004B3C4();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v107 + 32))(v116 + v115, v113, v109);
  aBlock[4] = (uint64_t)sub_10004B774;
  aBlock[5] = v116;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100017B38;
  aBlock[3] = (uint64_t)&unk_100067558;
  int v117 = _Block_copy(aBlock);
  swift_release();
  sub_100053778();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10004B800((unint64_t *)&qword_10006C348, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000068D8(&qword_10006C350);
  sub_1000394AC();
  uint64_t v118 = v126;
  uint64_t v119 = v133;
  sub_1000542B8();
  uint64_t v120 = (void *)v151;
  sub_100054158();
  _Block_release(v117);

  (*(void (**)(char *, uint64_t))(v114 + 8))(v118, v119);
  sub_10000B02C();
  v121();
  sub_10000B02C();
  v122();
  sub_10000B02C();
  v123();
  uint64_t v124 = v148;
LABEL_52:
  sub_10000AE4C(v124, &qword_10006C320);
}

void sub_1000484F8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000068D8(&qword_10006C308);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DynamicRotationState();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100053CA8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v15 = type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v14, 1, v15))
  {
    uint64_t v16 = *(void **)(v14 + *(int *)(v15 + 68));
    if (v16)
    {
      uint64_t v30 = a1;
      swift_beginAccess();
      uint64_t v17 = *(void **)(v2 + 40);
      if (v17)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v30, v10);
        id v18 = v16;
        id v19 = v17;
        sub_10002AAD8((uint64_t)v13);

        return;
      }
      uint64_t v20 = (void **)(v2 + 40);
      id v21 = v16;
      uint64_t v22 = sub_100006038(v30);
      uint64_t v23 = *(void **)(v2 + 40);
      *(void *)(v2 + 40) = v22;

      uint64_t v24 = v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rotationState;
      swift_beginAccess();
      sub_10001F5E0(v24, (uint64_t)v6, &qword_10006C308);
      if (sub_100007FE8((uint64_t)v6, 1, v7) == 1)
      {

        sub_10000AE4C((uint64_t)v6, &qword_10006C308);
        return;
      }
      sub_10004B3C4();
      id v25 = [self currentDevice];
      id v26 = [v25 userInterfaceIdiom];

      if (v26 == (id)1)
      {
        swift_beginAccess();
        uint64_t v27 = *v20;
        if (*v20)
        {
          swift_endAccess();
          id v28 = v27;
          sub_10002A978((uint64_t)v9);

          sub_10004B418((uint64_t)v9, (void (*)(void))type metadata accessor for DynamicRotationState);
          return;
        }
        sub_10004B418((uint64_t)v9, (void (*)(void))type metadata accessor for DynamicRotationState);
        swift_endAccess();
      }
      else
      {
        sub_10004B418((uint64_t)v9, (void (*)(void))type metadata accessor for DynamicRotationState);
      }
    }
  }
}

uint64_t sub_100048894()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100053768();
  uint64_t v41 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v45 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100053788();
  uint64_t v44 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v43 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1000537A8();
  uint64_t v42 = *(void *)(v46 - 8);
  uint64_t v6 = __chkstk_darwin(v46);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v39 = (char *)&v35 - v9;
  uint64_t v10 = sub_1000068D8(&qword_10006C320);
  uint64_t v38 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v38 + 64);
  uint64_t v12 = __chkstk_darwin(v10 - 8);
  uint64_t v40 = (uint64_t)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v15 = sub_100053548();
  os_log_type_t v16 = sub_100054118();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Skipping showing mica because the poster should not show animation", v17, 2u);
    swift_slowDealloc();
  }

  id v18 = *(void **)(v1 + 32);
  if (v18)
  {
    [v18 removeFromSuperview];
    id v19 = *(void **)(v1 + 32);
  }
  else
  {
    id v19 = 0;
  }
  *(void *)(v1 + 32) = 0;

  if (qword_10006BB28 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100053CA8();
  uint64_t v21 = sub_10000E284(v20, (uint64_t)qword_100070838);
  sub_1000484F8(v21);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t result = swift_unknownObjectRelease();
  if (Strong)
  {
    uint64_t v24 = v1 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
    swift_beginAccess();
    sub_10001F5E0(v24, (uint64_t)v14, &qword_10006C320);
    sub_100018DB0(0, &qword_10006C038);
    uint64_t v36 = sub_100054178();
    sub_100053798();
    id v25 = v39;
    sub_1000537C8();
    uint64_t v37 = v4;
    uint64_t v26 = v41;
    uint64_t v42 = *(void *)(v42 + 8);
    ((void (*)(char *, uint64_t))v42)(v8, v46);
    uint64_t v27 = swift_allocObject();
    swift_weakInit();
    uint64_t v28 = v40;
    sub_10001F5E0((uint64_t)v14, v40, &qword_10006C320);
    unint64_t v29 = (*(unsigned __int8 *)(v38 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = v27;
    sub_100018E7C(v28, v30 + v29);
    aBlock[4] = sub_10004BAD0;
    aBlock[5] = v30;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100017B38;
    aBlock[3] = &unk_1000675A8;
    uint64_t v31 = _Block_copy(aBlock);
    swift_release();
    uint64_t v32 = v43;
    sub_100053778();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10004B800((unint64_t *)&qword_10006C348, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_1000068D8(&qword_10006C350);
    sub_1000394AC();
    uint64_t v33 = v45;
    sub_1000542B8();
    uint64_t v34 = (void *)v36;
    sub_100054158();
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v33, v2);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v37);
    ((void (*)(char *, uint64_t))v42)(v25, v46);
    return sub_10000AE4C((uint64_t)v14, &qword_10006C320);
  }
  return result;
}

uint64_t sub_100048E94(uint64_t a1, char a2)
{
  uint64_t v5 = sub_100053C28();
  uint64_t v57 = *(void *)(v5 - 8);
  uint64_t v58 = v5;
  __chkstk_darwin(v5);
  uint64_t v56 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100053878();
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  __chkstk_darwin(v7);
  uint64_t v55 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100053E38();
  uint64_t v42 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v49 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100053888();
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v52 = v10;
  __chkstk_darwin(v10);
  uint64_t v47 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100053CA8();
  uint64_t v48 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v46 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100053C58();
  uint64_t v44 = *(void *)(v13 - 8);
  uint64_t v45 = v13;
  __chkstk_darwin(v13);
  uint64_t v39 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000533B8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)v35 - v20;
  uint64_t v41 = v16;
  uint64_t v40 = v2;
  if (a2)
  {
    sub_100010210(a1);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  }
  else
  {
    uint64_t v23 = type metadata accessor for PosterAnimationViewModel();
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    v22(v21, a1 + *(int *)(v23 + 24), v15);
  }
  v22(v19, (uint64_t)v21, v15);
  uint64_t v24 = (int *)type metadata accessor for PosterAnimationViewModel();
  uint64_t v35[3] = *(unsigned __int8 *)(a1 + v24[13]);
  id v25 = self;
  uint64_t v38 = v15;
  id v26 = [v25 mainScreen];
  [v26 bounds];

  id v27 = [v25 mainScreen];
  [v27 scale];

  uint64_t v28 = (uint64_t)v39;
  sub_100053C48();
  uint64_t v37 = v21;
  uint64_t v36 = *(void *)(v40 + 24);
  v22(v19, (uint64_t)v21, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v49, a1 + v24[12], v43);
  uint64_t v29 = enum case for WeatherConditionGradientModel.AnimationContext.mica(_:);
  uint64_t v30 = sub_100053868();
  uint64_t v31 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v55, v29, v30);
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v31, enum case for WeatherConditionGradientModel.PresentationContext.fullScreen(_:), v54);
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v56, a1 + v24[9], v58);
  uint64_t v32 = v47;
  sub_100053858();
  uint64_t v33 = (uint64_t)v46;
  sub_1000538E8();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v52);
  sub_1000484F8(v33);
  sub_10004AC10(v28, a1);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v33, v50);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v28, v45);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v37, v38);
}

void sub_100049578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for PosterAnimationViewModel();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000068D8(&qword_10006C4E0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000068D8(&qword_10006C320);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)v27 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)v27 - v17;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v27[0] = v6;
    v27[1] = a3;
    uint64_t v20 = Strong + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
    swift_beginAccess();
    sub_10001F5E0(v20, (uint64_t)v18, &qword_10006C320);
    sub_10004BB18();
    sub_100008010((uint64_t)v16, 0, 1, v4);
    uint64_t v21 = (uint64_t)&v9[*(int *)(v7 + 48)];
    sub_10001F5E0((uint64_t)v18, (uint64_t)v9, &qword_10006C320);
    sub_10001F5E0((uint64_t)v16, v21, &qword_10006C320);
    if (sub_100007FE8((uint64_t)v9, 1, v4) == 1)
    {
      sub_10000AE4C((uint64_t)v16, &qword_10006C320);
      sub_10000AE4C((uint64_t)v18, &qword_10006C320);
      if (sub_100007FE8(v21, 1, v4) == 1)
      {
        sub_10000AE4C((uint64_t)v9, &qword_10006C320);
LABEL_9:
        sub_100049998();
        swift_release();
        return;
      }
    }
    else
    {
      sub_10001F5E0((uint64_t)v9, (uint64_t)v13, &qword_10006C320);
      if (sub_100007FE8(v21, 1, v4) != 1)
      {
        uint64_t v22 = v27[0];
        sub_10004B3C4();
        char v23 = sub_100009ED4((uint64_t)v13, v22);
        sub_10004B418(v22, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v16, &qword_10006C320);
        sub_10000AE4C((uint64_t)v18, &qword_10006C320);
        sub_10004B418((uint64_t)v13, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v9, &qword_10006C320);
        if (v23) {
          goto LABEL_9;
        }
        goto LABEL_10;
      }
      sub_10000AE4C((uint64_t)v16, &qword_10006C320);
      sub_10000AE4C((uint64_t)v18, &qword_10006C320);
      sub_10004B418((uint64_t)v13, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    }
    sub_10000AE4C((uint64_t)v9, &qword_10006C4E0);
LABEL_10:
    swift_release();
  }
  uint64_t v24 = sub_100053548();
  os_log_type_t v25 = sub_100054118();
  if (os_log_type_enabled(v24, v25))
  {
    id v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Skipping notifying of completion because a newer request is inflight that will notify instead", v26, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100049998()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000068D8(&qword_10006C320);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100053198();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain_n();
  uint64_t v9 = sub_100053548();
  os_log_type_t v10 = sub_100054118();
  if (os_log_type_enabled(v9, v10))
  {
    v22[0] = v4;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v23[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v12 = v0 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
    swift_beginAccess();
    uint64_t v13 = type metadata accessor for PosterAnimationViewModel();
    if (sub_100007FE8(v12, 1, v13))
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0xE000000000000000;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12 + *(int *)(v13 + 20), v5);
      uint64_t v14 = sub_1000530F8();
      unint64_t v15 = v16;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    v22[1] = sub_100029610(v14, v15, v23);
    sub_100054288();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Completed rendering of weather data at date=%{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v4 = (char *)v22[0];
  }
  else
  {
    swift_release_n();
  }
  uint64_t v17 = v1 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rendererDelegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v21 = v1 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
    swift_beginAccess();
    sub_10001F5E0(v21, (uint64_t)v4, &qword_10006C320);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v4, ObjectType, v19);
    swift_unknownObjectRelease();
    return sub_10000AE4C((uint64_t)v4, &qword_10006C320);
  }
  return result;
}

uint64_t sub_100049CF4(uint64_t a1)
{
  uint64_t v4 = sub_1000068D8(&qword_10006C320);
  uint64_t v5 = sub_10000AFD4(v4);
  __chkstk_darwin(v5);
  sub_100026F74();
  sub_10004BB18();
  uint64_t v6 = type metadata accessor for PosterAnimationViewModel();
  sub_100008010(v2, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  sub_100019410();
  sub_1000186C8(v2, v7, &qword_10006C320);
  swift_endAccess();
  return sub_100048E94(a1, 0);
}

void sub_100049DE0()
{
  if (!UIAccessibilityIsReduceMotionEnabled()) {
    sub_100053DA8(0);
  }
}

void sub_100049E10(char a1, void (*a2)(void), uint64_t a3, double a4)
{
  if ((a1 & 1) != 0 && !UIAccessibilityIsReduceMotionEnabled())
  {
    uint64_t v11 = OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer;
    uint64_t v12 = *(void **)(v4 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer);
    if (v12) {
      [v12 invalidate];
    }
    uint64_t v13 = self;
    uint64_t v14 = swift_allocObject();
    swift_weakInit();
    unint64_t v15 = (void *)swift_allocObject();
    v15[2] = v14;
    v15[3] = a2;
    v15[4] = a3;
    v19[4] = sub_10004B3A0;
    v19[5] = v15;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 1107296256;
    v19[2] = sub_100017018;
    v19[3] = &unk_100067508;
    unint64_t v16 = _Block_copy(v19);
    swift_retain();
    swift_release();
    id v17 = [v13 scheduledTimerWithTimeInterval:0 repeats:v16 block:a4];
    _Block_release(v16);
    uint64_t v18 = *(void **)(v4 + v11);
    *(void *)(v4 + v11) = v17;
  }
  else
  {
    uint64_t v8 = OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer;
    uint64_t v9 = *(void **)(v4 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer);
    if (v9)
    {
      [v9 invalidate];
      os_log_type_t v10 = *(void **)(v4 + v8);
    }
    else
    {
      os_log_type_t v10 = 0;
    }
    *(void *)(v4 + v8) = 0;

    sub_100053DD8();
    sub_100053A68(0);
    a2();
  }
}

void sub_100049FE4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    uint64_t v2 = OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer;
    uint64_t v3 = *(void **)(Strong + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer);
    if (v3)
    {
      [v3 invalidate];
      uint64_t v4 = *(void **)(v1 + v2);
    }
    else
    {
      uint64_t v4 = 0;
    }
    *(void *)(v1 + v2) = 0;

    id v5 = *(id *)(v1 + 16);
    sub_100053DC8();
    swift_release();
  }
}

void sub_10004A09C(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  IsReduceMotionEnableCGFloat d = UIAccessibilityIsReduceMotionEnabled();
  if ((IsReduceMotionEnabled & 1) == 0)
  {
    sub_10003F198();
    IsReduceMotionEnableCGFloat d = sub_100053EB8();
    uint64_t v7 = *(void **)(v2 + 32);
    if (v7)
    {
      id v8 = v7;
      sub_100053B78();
    }
  }
  if (a2) {
    a2(IsReduceMotionEnabled, v5, v6);
  }
}

uint64_t sub_10004A160(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000068D8(&qword_10006C308);
  uint64_t v6 = sub_10000AFD4(v5);
  __chkstk_darwin(v6);
  sub_100039694();
  sub_10003F318(a1);
  swift_beginAccess();
  uint64_t v7 = *(void **)(v1 + 40);
  if (v7)
  {
    id v8 = v7;
    sub_10002A978(a1);
  }
  sub_10004BB18();
  uint64_t v9 = type metadata accessor for DynamicRotationState();
  sub_100008010(v2, 0, 1, v9);
  uint64_t v10 = v3 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rotationState;
  sub_100019410();
  sub_1000186C8(v2, v10, &qword_10006C308);
  return swift_endAccess();
}

uint64_t sub_10004A274(char a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_1000068D8(&qword_10006C308);
  uint64_t v7 = sub_10000AFD4(v6);
  __chkstk_darwin(v7);
  sub_100039694();
  uint64_t v8 = sub_1000068D8(&qword_10006C320);
  uint64_t v9 = sub_10000AFD4(v8);
  __chkstk_darwin(v9);
  sub_100026F74();
  uint64_t v10 = sub_100053548();
  os_log_type_t v11 = sub_100054118();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    v30[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    if (a1)
    {
      if (a1 == 1) {
        uint64_t v13 = 0xD000000000000011;
      }
      else {
        uint64_t v13 = 0x646564616F6C6E75;
      }
      if (a1 == 1) {
        unint64_t v14 = 0x8000000100057480;
      }
      else {
        unint64_t v14 = 0xE800000000000000;
      }
    }
    else
    {
      uint64_t v13 = 0xD000000000000013;
      unint64_t v14 = 0x80000001000574A0;
    }
    sub_100029610(v13, v14, v30);
    sub_100054288();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Invalidating animation for reason=%{public}s", v12, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }

  uint64_t v15 = type metadata accessor for PosterAnimationViewModel();
  sub_1000193F8(v3, v16, v17, v15);
  uint64_t v18 = (uint64_t)v4 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  sub_100019410();
  sub_1000186C8(v3, v18, &qword_10006C320);
  swift_endAccess();
  uint64_t v19 = (void *)v4[4];
  v4[4] = 0;

  swift_beginAccess();
  uint64_t v20 = (void *)v4[5];
  v4[5] = 0;

  uint64_t v21 = (void *)v4[6];
  v4[6] = 0;

  uint64_t v22 = OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer;
  char v23 = *(void **)((char *)v4 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_freezeTimer);
  if (v23)
  {
    [v23 invalidate];
    uint64_t v24 = *(void **)((char *)v4 + v22);
  }
  else
  {
    uint64_t v24 = 0;
  }
  *(void *)((char *)v4 + v22) = 0;

  uint64_t v25 = type metadata accessor for DynamicRotationState();
  sub_1000193F8(v2, v26, v27, v25);
  uint64_t v28 = (uint64_t)v4 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rotationState;
  sub_100019410();
  sub_1000186C8(v2, v28, &qword_10006C308);
  return swift_endAccess();
}

id *sub_10004A558()
{
  swift_release();
  sub_10000AE4C((uint64_t)v0 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel, &qword_10006C320);
  sub_10000AE4C((uint64_t)v0 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rotationState, &qword_10006C308);

  sub_100053568();
  sub_10000AFB4();
  sub_10000B02C();
  v1();
  sub_100019374((uint64_t)v0 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rendererDelegate);
  return v0;
}

uint64_t sub_10004A628()
{
  sub_10004A558();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10004A680()
{
  return type metadata accessor for MicaAnimation();
}

uint64_t type metadata accessor for MicaAnimation()
{
  uint64_t result = qword_10006D758;
  if (!qword_10006D758) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10004A6D0()
{
  sub_10004A840(319, (unint64_t *)&qword_10006C1C8, (void (*)(uint64_t))type metadata accessor for PosterAnimationViewModel);
  if (v0 <= 0x3F)
  {
    sub_10004A840(319, (unint64_t *)&qword_10006C1D8, (void (*)(uint64_t))type metadata accessor for DynamicRotationState);
    if (v1 <= 0x3F)
    {
      sub_100053568();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10004A840(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100054278();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10004A894(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_rendererDelegate + 8) = a2;
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t sub_10004A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for PosterAnimationViewModel();
  __chkstk_darwin(v3);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000068D8(&qword_10006C4E0);
  __chkstk_darwin(v6);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1000068D8(&qword_10006C320);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  unint64_t v14 = &v19[-v13];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v16 = result + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
    swift_beginAccess();
    sub_10001F5E0(v16, (uint64_t)v14, &qword_10006C320);
    uint64_t v17 = (uint64_t)&v8[*(int *)(v6 + 48)];
    sub_10001F5E0(a2, (uint64_t)v8, &qword_10006C320);
    sub_10001F5E0((uint64_t)v14, v17, &qword_10006C320);
    if (sub_100007FE8((uint64_t)v8, 1, v3) == 1)
    {
      sub_10000AE4C((uint64_t)v14, &qword_10006C320);
      if (sub_100007FE8(v17, 1, v3) == 1)
      {
        sub_10000AE4C((uint64_t)v8, &qword_10006C320);
LABEL_9:
        sub_100049998();
        return swift_release();
      }
    }
    else
    {
      sub_10001F5E0((uint64_t)v8, (uint64_t)v12, &qword_10006C320);
      if (sub_100007FE8(v17, 1, v3) != 1)
      {
        sub_10004B3C4();
        char v18 = sub_100009ED4((uint64_t)v12, (uint64_t)v5);
        sub_10004B418((uint64_t)v5, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v14, &qword_10006C320);
        sub_10004B418((uint64_t)v12, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
        sub_10000AE4C((uint64_t)v8, &qword_10006C320);
        if (v18) {
          goto LABEL_9;
        }
        return swift_release();
      }
      sub_10000AE4C((uint64_t)v14, &qword_10006C320);
      sub_10004B418((uint64_t)v12, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
    }
    sub_10000AE4C((uint64_t)v8, &qword_10006C4E0);
    return swift_release();
  }
  return result;
}

uint64_t sub_10004AC10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v35 = a2;
  uint64_t v37 = a1;
  uint64_t v4 = sub_100053E68();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000068D8((uint64_t *)&unk_10006C558);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100053088();
  uint64_t v36 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000068D8(&qword_10006C320);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for PosterAnimationViewModel();
  __chkstk_darwin(v16);
  char v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v3 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  swift_beginAccess();
  sub_10001F5E0(v19, (uint64_t)v15, &qword_10006C320);
  if (sub_100007FE8((uint64_t)v15, 1, v16) == 1)
  {
    uint64_t v20 = &qword_10006C320;
    uint64_t v21 = (uint64_t)v15;
    return sub_10000AE4C(v21, v20);
  }
  sub_10004B3C4();
  uint64_t v22 = *(void **)&v18[*(int *)(v16 + 68)];
  if (v22)
  {
    sub_100053AF8();
    swift_allocObject();
    id v23 = v22;
    sub_100053AE8();
    sub_100053AC8();
    if (sub_100007FE8((uint64_t)v9, 1, v10) == 1)
    {
      sub_10004B418((uint64_t)v18, (void (*)(void))type metadata accessor for PosterAnimationViewModel);

      swift_release();
      uint64_t v20 = (uint64_t *)&unk_10006C558;
      uint64_t v21 = (uint64_t)v9;
      return sub_10000AE4C(v21, v20);
    }
    id v32 = v23;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v12, v9, v10);
    if (!*(void *)(v3 + 32))
    {
      uint64_t v25 = *(void **)(v3 + 16);
      id v26 = objc_allocWithZone((Class)sub_100053B98());
      id v27 = v25;
      uint64_t v28 = (void *)sub_100053B88();
      sub_100006124(v28, 0);
      uint64_t v29 = *(void **)(v3 + 32);
      *(void *)(v3 + 32) = v28;
    }
    id v30 = (id)sub_100053AD8();
    sub_100053E58();
    sub_100053D58();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v34);
    sub_10004B054();

    swift_release();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v10);
  }
  return sub_10004B418((uint64_t)v18, (void (*)(void))type metadata accessor for PosterAnimationViewModel);
}

void sub_10004B054()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000533B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13WeatherPoster13MicaAnimation_posterViewModel;
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v6, 1, v7))
  {
    uint64_t v8 = *(void **)(v6 + *(int *)(v7 + 72));
    if (v8)
    {
      id v9 = v8;
      if (sub_100010584())
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0xE000000000000000;
        sub_100054308(39);
        v20._countAndFlagsBits = 0x6F697469646E6F43;
        v20._object = (void *)0xEB00000000203A6ELL;
        sub_100053F58(v20);
        sub_100053C38();
        sub_10004B800(&qword_10006D828, (void (*)(uint64_t))&type metadata accessor for WeatherCondition);
        v21._countAndFlagsBits = sub_1000544E8();
        sub_100053F58(v21);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        v22._countAndFlagsBits = 0x6F697461636F4C0ALL;
        v22._object = (void *)0xEB00000000203A6ELL;
        sub_100053F58(v22);
        sub_100053478();
        v17[1] = v10;
        v17[2] = v11;
        type metadata accessor for CLLocationCoordinate2D(0);
        sub_1000543B8();
        v23._object = (void *)0xEB00000000203A65;
        v23._countAndFlagsBits = 0x6D616E656C69460ALL;
        sub_100053F58(v23);
        v24._countAndFlagsBits = sub_100053038();
        sub_100053F58(v24);
        swift_bridgeObjectRelease();
        uint64_t v12 = v18;
        uint64_t v13 = v19;
        uint64_t v14 = *(void **)(v1 + 48);
        if (v14)
        {
          id v15 = v14;
          sub_100018D4C(v12, v13, v15);
        }
        else
        {
          id v16 = sub_100005C9C(v18, v19);
          swift_bridgeObjectRelease();

          id v9 = *(id *)(v1 + 48);
          *(void *)(v1 + 48) = v16;
        }
      }
    }
  }
}

uint64_t sub_10004B328()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004B360()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10004B3A0()
{
}

uint64_t sub_10004B3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004B3BC()
{
  return swift_release();
}

uint64_t sub_10004B3C4()
{
  uint64_t v2 = sub_10004BBD4();
  v3(v2);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_10004B418(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  sub_10000B02C();
  v3();
  return a1;
}

uint64_t sub_10004B46C()
{
  uint64_t v1 = (int *)type metadata accessor for PosterAnimationViewModel();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v23 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v24 = sub_100053568();
  sub_10000E978();
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v22 = *(void *)(v6 + 64);
  swift_release();
  uint64_t v7 = v0 + ((v2 + 24) & ~v2);
  sub_1000534C8();
  sub_10000AFB4();
  sub_10000B02C();
  v8();
  sub_100053198();
  sub_10000AFB4();
  uint64_t v10 = *(void (**)(uint64_t))(v9 + 8);
  uint64_t v11 = sub_10004BB8C();
  v10(v11);
  sub_1000533B8();
  sub_10000AFB4();
  sub_10000B02C();
  v12();
  sub_100053C28();
  sub_10000AFB4();
  sub_10000B02C();
  v13();
  if (!sub_10004BC30(v1[10]))
  {
    uint64_t v14 = sub_10004BB8C();
    v10(v14);
  }
  if (!sub_10004BC30(v1[11]))
  {
    uint64_t v15 = sub_10004BB8C();
    v10(v15);
  }
  sub_100053E38();
  sub_10000AFB4();
  sub_10000B02C();
  v16();
  uint64_t v17 = v7 + v1[14];
  uint64_t v18 = sub_100053C68();
  if (!sub_100007FE8(v17, 1, v18)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  }
  uint64_t v19 = (((v2 + 24) & ~v2) + v23 + v5) & ~v5;
  sub_100053CB8();
  sub_10000AFB4();
  sub_10000B02C();
  v20();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v19, v24);

  return _swift_deallocObject(v0, v19 + v22, v2 | v5 | 7);
}

void sub_10004B774()
{
  uint64_t v1 = type metadata accessor for PosterAnimationViewModel();
  sub_100026EE0(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = sub_100053568();
  sub_100019428(v6);
  uint64_t v8 = *(void *)(v0 + 16);
  uint64_t v9 = v0 + ((v3 + v5 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  sub_100049578(v8, v0 + v3, v9);
}

uint64_t sub_10004B800(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004B848()
{
  uint64_t v1 = sub_1000068D8(&qword_10006C320);
  sub_100026EE0(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  swift_release();
  uint64_t v7 = v0 + v4;
  uint64_t v8 = (int *)type metadata accessor for PosterAnimationViewModel();
  if (!sub_100007FE8(v0 + v4, 1, (uint64_t)v8))
  {
    sub_1000534C8();
    sub_10000AFB4();
    sub_10000B02C();
    v9();
    sub_100053198();
    sub_10000AFB4();
    uint64_t v11 = *(void (**)(uint64_t))(v10 + 8);
    uint64_t v12 = sub_1000194BC();
    v11(v12);
    sub_1000533B8();
    sub_10000AFB4();
    sub_10000B02C();
    v13();
    sub_100053C28();
    sub_10000AFB4();
    sub_10000B02C();
    v14();
    if (!sub_100019550(v8[10]))
    {
      uint64_t v15 = sub_1000194BC();
      v11(v15);
    }
    if (!sub_100019550(v8[11]))
    {
      uint64_t v16 = sub_1000194BC();
      v11(v16);
    }
    sub_100053E38();
    sub_10000AFB4();
    sub_10000B02C();
    v17();
    uint64_t v18 = v7 + v8[14];
    uint64_t v19 = sub_100053C68();
    if (!sub_100007FE8(v18, 1, v19)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
    }
    sub_100053CB8();
    sub_10000AFB4();
    sub_10000B02C();
    v20();
  }

  return _swift_deallocObject(v0, v4 + v6, v3 | 7);
}

uint64_t sub_10004BAD0()
{
  uint64_t v1 = sub_1000068D8(&qword_10006C320);
  sub_100019428(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return sub_10004A8FC(v3, v4);
}

uint64_t sub_10004BB18()
{
  uint64_t v1 = sub_10004BBD4();
  v2(v1);
  sub_10000AFB4();
  uint64_t v3 = sub_10001F9C4();
  v4(v3);
  return v0;
}

void sub_10004BB70()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_10004BB8C()
{
  return v0;
}

uint64_t sub_10004BBB4()
{
  return sub_100008010(v0, 0, 1, v1);
}

uint64_t sub_10004BBD4()
{
  return 0;
}

uint64_t sub_10004BBE8(uint64_t a1)
{
  *(void *)(v1 - 200) = a1;
  return v1 - 200;
}

uint64_t sub_10004BC10(uint64_t a1)
{
  return sub_100007FE8(a1, 1, v1);
}

uint64_t sub_10004BC30@<X0>(uint64_t a1@<X8>)
{
  return sub_100007FE8(v1 + a1, 1, v2);
}

uint64_t sub_10004BC50()
{
  sub_10004BFD4(0, 0, (uint64_t)v24);
  sub_10004C22C((uint64_t)v24, (uint64_t)v25);
  if (v26)
  {
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_100053568();
    sub_10000E284(v0, (uint64_t)qword_100070928);
    uint64_t v1 = sub_100053548();
    os_log_type_t v2 = sub_1000540F8();
    if (!os_log_type_enabled(v1, v2)) {
      goto LABEL_16;
    }
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Snapshot image is not valid because color components do not exist", v3, 2u);
LABEL_15:
    sub_10000E950();
LABEL_16:

    return 0;
  }
  if (*(double *)&v25[3] != 1.0)
  {
    if (qword_10006BB78 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100053568();
    sub_10000E284(v14, (uint64_t)qword_100070928);
    uint64_t v1 = sub_100053548();
    os_log_type_t v15 = sub_1000540F8();
    if (!os_log_type_enabled(v1, v15)) {
      goto LABEL_16;
    }
    uint64_t v16 = (_DWORD *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *uint64_t v16 = 136446210;
    uint64_t v23 = v17;
    sub_1000068D8(&qword_10006D838);
    uint64_t v18 = sub_100053F38();
    sub_100029610(v18, v19, &v23);
    sub_10004C294();
    swift_bridgeObjectRelease();
    sub_10003E744((void *)&_mh_execute_header, v20, v21, "Snapshot image is not valid because image has transparency; colorComponents=%{public}s");
    swift_arrayDestroy();
    sub_10000E950();
    goto LABEL_15;
  }
  if (qword_10006BB78 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100053568();
  sub_10000E284(v4, (uint64_t)qword_100070928);
  uint64_t v5 = sub_100053548();
  os_log_type_t v6 = sub_100054118();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (_DWORD *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    _DWORD *v7 = 136446210;
    uint64_t v23 = v8;
    sub_1000068D8(&qword_10006D838);
    uint64_t v9 = sub_100053F38();
    sub_100029610(v9, v10, &v23);
    sub_10004C294();
    swift_bridgeObjectRelease();
    sub_10003E744((void *)&_mh_execute_header, v11, v12, "Snapshot image is valid; colorComponents=%{public}s");
    uint64_t v13 = 1;
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {

    return 1;
  }
  return v13;
}

void sub_10004BFD4(int64_t a1@<X0>, int64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  int64_t Width = CGImageGetWidth(v3);
  if (Width < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  float64x2_t v9 = 0uLL;
  char v10 = 1;
  if (a1 < 0 || Width <= a1) {
    goto LABEL_17;
  }
  int64_t Height = CGImageGetHeight(v3);
  if (Height < 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  char v10 = 1;
  float64x2_t v9 = 0uLL;
  if (a2 < 0 || Height <= a2)
  {
LABEL_17:
    _Q0 = 0uLL;
LABEL_20:
    *(float64x2_t *)a3 = v9;
    *(float64x2_t *)(a3 + 16) = _Q0;
    *(unsigned char *)(a3 + 32) = v10;
    return;
  }
  uint64_t v12 = CGImageGetDataProvider(v3);
  if (!v12) {
    goto LABEL_19;
  }
  uint64_t v13 = v12;
  CFDataRef v14 = CGDataProviderCopyData(v12);

  if (!v14) {
    goto LABEL_19;
  }
  BytePtr = CFDataGetBytePtr(v14);
  if (!BytePtr)
  {

LABEL_19:
    char v10 = 1;
    _Q0 = 0uLL;
    float64x2_t v9 = 0uLL;
    goto LABEL_20;
  }
  uint64_t v16 = BytePtr;
  int64_t BytesPerRow = CGImageGetBytesPerRow(v4);
  int64_t v18 = a2 * BytesPerRow;
  if ((unsigned __int128)(a2 * (__int128)BytesPerRow) >> 64 != (a2 * BytesPerRow) >> 63)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int64_t BitsPerPixel = CGImageGetBitsPerPixel(v4);
  if ((unsigned __int128)(a1 * (__int128)BitsPerPixel) >> 64 != (a1 * BitsPerPixel) >> 63)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v20 = a1 * BitsPerPixel / 8;
  uint64_t v21 = v18 + v20;
  if (__OFADD__(v18, v20))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (CGImageGetBitsPerComponent(v4) == 16 && (CGImageGetBitmapInfo(v4) & 0x100) != 0)
  {
    _S0 = *(_DWORD *)&v16[v21];
    _H1 = HIWORD(_S0);
    __asm
    {
      FCVT            D1, H1
      FCVT            D0, H0
    }
    _Q0.f64[1] = _D1;
    int v41 = *(_DWORD *)&v16[v21 + 4];
    float64x2_t v43 = _Q0;

    char v10 = 0;
    _H0 = HIWORD(v41);
    _H2 = v41;
    __asm
    {
      FCVT            D1, H0
      FCVT            D0, H2
    }
    _Q0.f64[1] = _D1;
    float64x2_t v9 = v43;
    goto LABEL_20;
  }
  if (CGImageGetBitsPerComponent(v4) == 16)
  {
    v22.i64[0] = *(unsigned __int16 *)&v16[v21];
    v22.i64[1] = *(unsigned __int16 *)&v16[v21 + 2];
    float64x2_t v40 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
    float64x2_t v42 = vdivq_f64(vcvtq_f64_u64(v22), v40);
    LODWORD(v23) = *(unsigned __int16 *)&v16[v21 + 4];
    int v24 = *(unsigned __int16 *)&v16[v21 + 6];
LABEL_23:
    HIDWORD(v23) = v24;
    uint64_t v39 = v23;

    float64x2_t v9 = v42;
    char v10 = 0;
    v27.i64[0] = v39;
    v27.i64[1] = HIDWORD(v39);
    _Q0 = vdivq_f64(vcvtq_f64_u64(v27), v40);
    goto LABEL_20;
  }
  if (v21 <= 0x7FFFFFFFFFFFFFFCLL)
  {
    v26.i64[0] = v16[v21];
    v26.i64[1] = v16[v21 + 1];
    float64x2_t v40 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    float64x2_t v42 = vdivq_f64(vcvtq_f64_u64(v26), v40);
    LODWORD(v23) = v16[v21 + 2];
    int v24 = v16[v21 + 3];
    goto LABEL_23;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_10004C22C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000068D8(&qword_10006D830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004C294()
{
  return sub_100054288();
}

double sub_10004C2B8(char a1)
{
  return dbl_100057048[a1];
}

uint64_t sub_10004C2CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for PosterData(0);
  sub_10000AFB4();
  __chkstk_darwin(v4);
  os_log_type_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000068D8(&qword_10006C4A0);
  __chkstk_darwin(v7 - 8);
  float64x2_t v9 = (double *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001FF1C(a1);
  id v10 = sub_10004C740();
  unsigned int v11 = [v10 authorizationStatus];

  uint64_t v12 = v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus;
  *(_DWORD *)uint64_t v12 = v11;
  *(unsigned char *)(v12 + 4) = 0;
  sub_10002F030((uint64_t)v9);
  uint64_t v13 = type metadata accessor for PosterDataModel(0);
  if (sub_100007FE8((uint64_t)v9, 1, v13) == 1)
  {
    sub_10001F7A8((uint64_t)v9, &qword_10006C4A0);
  }
  else
  {
    double v14 = v9[2];
    double v15 = v9[3];
    sub_100050D2C((uint64_t)v9, (void (*)(void))type metadata accessor for PosterDataModel);
    uint64_t v16 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_location;
    if (!*(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_location))
    {
      id v17 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:v14 longitude:v15];
      int64_t v18 = *(void **)(v2 + v16);
      *(void *)(v2 + v16) = v17;
    }
  }
  *os_log_type_t v6 = 0;
  swift_storeEnumTagMultiPayload();
  char v19 = sub_1000541A8();
  char v20 = sub_1000328E0((uint64_t)a1, (uint64_t)v6);
  if (v19)
  {
    if (v20)
    {
      sub_100050D2C((uint64_t)a1, (void (*)(void))type metadata accessor for PosterData);
      *a1 = 2;
      swift_storeEnumTagMultiPayload();
LABEL_10:
      sub_100020600((uint64_t)a1);
    }
  }
  else if ((v20 & 1) == 0)
  {
    sub_100050D2C((uint64_t)a1, (void (*)(void))type metadata accessor for PosterData);
    sub_100050CD8();
    goto LABEL_10;
  }
  return sub_100050D2C((uint64_t)v6, (void (*)(void))type metadata accessor for PosterData);
}

void sub_10004C550()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_isMonitoringEvents) & 1) == 0)
  {
    *(unsigned char *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_isMonitoringEvents) = 1;
    sub_10004CA28();
    sub_10004CE8C();
    sub_10004CF90();
  }
}

void sub_10004C59C()
{
  uint64_t v1 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_isMonitoringEvents;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_isMonitoringEvents) == 1)
  {
    uint64_t v2 = v0;
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100053568();
    sub_10000E284(v3, (uint64_t)qword_1000708C8);
    uint64_t v4 = sub_100053548();
    os_log_type_t v5 = sub_100054118();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stopping monitoring of significant events for data manager", v6, 2u);
      sub_10000E950();
    }

    *(unsigned char *)(v2 + v1) = 0;
    uint64_t v7 = v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    sub_100021668(Strong, *(void *)(v7 + 8));
    swift_unknownObjectRelease();
    uint64_t v9 = swift_unknownObjectWeakLoadStrong();
    sub_100021668(v9, *(void *)(v7 + 8));
    swift_unknownObjectRelease();
    sub_10004D28C();
    sub_10004D2F4();
    sub_10004D330();
    sub_10000D658();
    id v10 = *(void **)(v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation);
    *(void *)(v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation) = 0;
  }
}

id sub_10004C740()
{
  uint64_t v1 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager____lazy_storage___locationManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager____lazy_storage___locationManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager____lazy_storage___locationManager);
  }
  else
  {
    id v4 = sub_10004C7A4(v0);
    os_log_type_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_10004C7A4(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)CLLocationManager) init];
  [v2 setDelegate:a1];
  [v2 setDistanceFilter:500.0];
  [v2 setDesiredAccuracy:kCLLocationAccuracyKilometer];
  return v2;
}

id sub_10004C828(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_cacheManager;
  uint64_t v5 = qword_10006BB20;
  id v6 = v1;
  if (v5 != -1) {
    swift_once();
  }
  *(void *)&v6[v4] = qword_100070828;
  uint64_t v7 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_dataUpdater;
  type metadata accessor for PosterDataUpdater();
  swift_allocObject();
  swift_retain();
  *(void *)&v6[v7] = sub_10000D8B4();
  *(void *)&v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager____lazy_storage___locationManager] = 0;
  uint64_t v8 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkMonitor;
  type metadata accessor for NetworkMonitor();
  swift_allocObject();
  *(void *)&v6[v8] = sub_10002C578();
  *(void *)&v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_periodicTimer] = 0;
  uint64_t v9 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_locationSessionExtender;
  type metadata accessor for RenderSessionExtender();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 24) = 0;
  *(unsigned char *)(v10 + 16) = 5;
  *(void *)&v6[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkSessionExtender;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 24) = 0;
  *(unsigned char *)(v12 + 16) = 6;
  *(void *)&v6[v11] = v12;
  uint64_t v13 = &v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus];
  *(_DWORD *)uint64_t v13 = 0;
  v13[4] = 1;
  *(void *)&v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_location] = 0;
  v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkStatus] = 2;
  *(void *)&v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation] = 0;
  v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_isMonitoringEvents] = 0;
  *(void *)&v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v6[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_canRequestLocationAuthorization] = a1 & 1;

  v15.receiver = v6;
  v15.super_class = ObjectType;
  return [super init];
}

void sub_10004CA28()
{
  uint64_t v1 = v0;
  id v2 = sub_10004C740();
  [v2 setDelegate:v1];

  id v3 = sub_10004C740();
  unsigned int v4 = [v3 authorizationStatus];

  if (v4 - 1 < 2)
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100053568();
    sub_10000E284(v12, (uint64_t)qword_1000708C8);
    uint64_t v13 = sub_100053548();
    os_log_type_t v14 = sub_100054118();
    if (os_log_type_enabled(v13, v14))
    {
      objc_super v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Cannot start location updates because authorization is denied", v15, 2u);
      swift_slowDealloc();
    }

    id v24 = sub_10004C740();
    [v24 stopUpdatingLocation];
  }
  else if (v4 - 3 >= 2)
  {
    if (v4)
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_100053568();
      sub_10000E284(v20, (uint64_t)qword_1000708C8);
      uint64_t v21 = sub_100053548();
      os_log_type_t v22 = sub_100054118();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Cannot start location updates because authorization is unknown", v23, 2u);
        swift_slowDealloc();
      }

      id v17 = sub_10004C740();
      [v17 stopUpdatingLocation];
    }
    else
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_100053568();
      sub_10000E284(v16, (uint64_t)qword_1000708C8);
      id v17 = sub_100053548();
      os_log_type_t v18 = sub_100054118();
      if (os_log_type_enabled(v17, v18))
      {
        char v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Cannot start location updates because authorization is not determined", v19, 2u);
        swift_slowDealloc();
      }
    }

    sub_10004D6C8();
  }
  else
  {
    uint64_t v5 = v1 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    sub_1000214D4(Strong, *(void *)(v5 + 8));
    swift_unknownObjectRelease();
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100053568();
    sub_10000E284(v7, (uint64_t)qword_1000708C8);
    uint64_t v8 = sub_100053548();
    os_log_type_t v9 = sub_100054118();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 67109120;
      sub_100054288();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Starting updates for locations; extendedSessionGranted=%{BOOL}d",
        v10,
        8u);
      swift_slowDealloc();
    }

    id v11 = sub_10004C740();
    [v11 startUpdatingLocation];
  }
}

void sub_10004CE8C()
{
  uint64_t v1 = v0;
  if (qword_10006BB58 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100053568();
  sub_10000E284(v2, (uint64_t)qword_1000708C8);
  id v3 = sub_100053548();
  os_log_type_t v4 = sub_100054118();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting monitoring for changes in network status", v5, 2u);
    swift_slowDealloc();
  }

  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkMonitor) + 40) = &off_1000675D0;
  swift_unknownObjectWeakAssign();
  sub_10002BBF8();
}

void sub_10004CF90()
{
  uint64_t v1 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_periodicTimer;
  if (!*(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_periodicTimer))
  {
    uint64_t v2 = v0;
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100053568();
    sub_10000E284(v3, (uint64_t)qword_1000708C8);
    os_log_type_t v4 = sub_100053548();
    os_log_type_t v5 = sub_100054118();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)id v6 = 136446210;
      uint64_t v13 = v7;
      uint64_t aBlock = 0;
      unint64_t v15 = 0xE000000000000000;
      sub_1000540C8();
      v20._countAndFlagsBits = 1852402976;
      v20._object = (void *)0xE400000000000000;
      sub_100053F58(v20);
      uint64_t aBlock = sub_100029610(0, 0xE000000000000000, &v13);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Scheduling timer for periodic updates every %{public}s", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100018DB0(0, &qword_10006D960);
    id v8 = sub_10004F688();
    sub_100018DB0(0, &qword_10006C038);
    os_log_type_t v9 = (void *)sub_100054178();
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    os_log_type_t v18 = sub_100050F6C;
    uint64_t v19 = v10;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v15 = 1107296256;
    uint64_t v16 = sub_100017018;
    id v17 = &unk_100067608;
    id v11 = _Block_copy(&aBlock);
    swift_release();
    [v8 scheduleRepeatingWithFireInterval:v9 repeatInterval:v11 leewayInterval:900.0 queue:900.0 handler:60.0];
    _Block_release(v11);

    uint64_t v12 = *(void **)(v2 + v1);
    *(void *)(v2 + v1) = v8;
  }
}

void sub_10004D28C()
{
  id v0 = sub_10004C740();
  [v0 stopUpdatingLocation];

  id v1 = sub_10004C740();
  [v1 setDelegate:0];
}

uint64_t sub_10004D2F4()
{
  *(void *)(*(void *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkMonitor) + 40) = 0;
  swift_unknownObjectWeakAssign();
  return sub_10002C0DC();
}

void sub_10004D330()
{
  uint64_t v1 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_periodicTimer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_periodicTimer);
  if (v2)
  {
    [v2 invalidate];
    uint64_t v2 = *(void **)(v0 + v1);
  }
  *(void *)(v0 + v1) = 0;
}

void sub_10004D380()
{
}

uint64_t type metadata accessor for PosterDataManager()
{
  return self;
}

void sub_10004D4C0(char a1)
{
  uint64_t v3 = v1;
  int v4 = a1 & 1;
  uint64_t v5 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkStatus;
  int v6 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkStatus);
  if (v6 == 2 || (sub_10000F984(a1 & 1, v6 & 1) & 1) == 0)
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100053568();
    sub_10000E284(v7, (uint64_t)qword_1000708C8);
    id v8 = (void *)sub_100053548();
    os_log_type_t v9 = sub_100054118();
    if (sub_10005102C(v9))
    {
      sub_10003E700();
      uint64_t v10 = sub_10003B9FC();
      _DWORD *v2 = 136446210;
      uint64_t v16 = v10;
      if (v4) {
        uint64_t v11 = 0x656E696C66666FLL;
      }
      else {
        uint64_t v11 = 0x6C62616863616572;
      }
      if (v4) {
        unint64_t v12 = 0xE700000000000000;
      }
      else {
        unint64_t v12 = 0xE900000000000065;
      }
      sub_100029610(v11, v12, &v16);
      sub_100050FF0();
      sub_100054288();
      swift_bridgeObjectRelease();
      sub_100050F8C((void *)&_mh_execute_header, v13, v14, "Network status changed to %{public}s");
      sub_100050FD4();
      sub_10000E950();
      sub_10000E950();
    }

    *(unsigned char *)(v3 + v5) = v4;
    if (!v4)
    {
      swift_bridgeObjectRelease();
LABEL_16:
      sub_10004DDD4(0xD000000000000015, 0x8000000100058C30);
      return;
    }
    char v15 = sub_100054508();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_16;
    }
    sub_10004F4DC();
  }
}

void sub_10004D6C8()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_canRequestLocationAuthorization) == 1)
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100053568();
    sub_10000E284(v1, (uint64_t)qword_1000708C8);
    uint64_t v2 = sub_100053548();
    os_log_type_t v3 = sub_100054118();
    if (os_log_type_enabled(v2, v3))
    {
      int v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Requesting when in use authorization", v4, 2u);
      swift_slowDealloc();
    }

    id v5 = sub_10004C740();
    [v5 requestWhenInUseAuthorization];
  }
}

void sub_10004D800(void *a1, unint64_t a2)
{
  os_log_type_t v3 = v2;
  int v6 = &v2[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  sub_100021668(Strong, *((void *)v6 + 1));
  swift_unknownObjectRelease();
  id v8 = [a1 _limitsPrecision];
  Swift::Bool v9 = (char)v8;
  unint64_t v51 = a2;
  if (a2 >> 62) {
    goto LABEL_39;
  }
  unint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    p_cache = _TtC13WeatherPoster22DynamicRotationManager.cache;
    if (!v10) {
      break;
    }
    uint64_t v12 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_location;
    uint64_t v49 = a2 & 0xFFFFFFFFFFFFFF8;
    while (!__OFSUB__(v10--, 1))
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v14 = (id)sub_100054328();
      }
      else
      {
        if ((v10 & 0x8000000000000000) != 0) {
          goto LABEL_37;
        }
        if (v10 >= *(void *)(v49 + 16)) {
          goto LABEL_38;
        }
        id v14 = *(id *)(a2 + 32 + 8 * v10);
      }
      char v15 = v14;
      uint64_t v16 = *(CLLocation_optional **)&v3[v12];
      id v17 = v16;
      LOBYTE(v16) = sub_1000540E8(v9, v16);

      if ((v16 & 1) != 0 || !v10)
      {
        p_cache = (void **)(_TtC13WeatherPoster22DynamicRotationManager + 16);
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_100054418();
    id v8 = (id)swift_bridgeObjectRelease();
  }
LABEL_14:
  __chkstk_darwin(v8);
  v47[2] = &v51;
  uint64_t v19 = sub_100050EB0((void *(*)(uint64_t *__return_ptr, uint64_t *))sub_100050F4C, (uint64_t)v47, v10, v18 & 1);
  if (v19)
  {
    Swift::String v20 = v19;
    uint64_t v21 = (char *)p_cache[272];
    os_log_type_t v22 = *(void **)&v21[(void)v3];
    if (v22 && ([v22 coordinate], v52.super.Class isa = (Class)v20, !sub_100054228(v52, 0.001)))
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_100053568();
      sub_10000E284(v39, (uint64_t)qword_1000708C8);
      uint64_t v36 = sub_100053548();
      os_log_type_t v40 = sub_100054118();
      if (os_log_type_enabled(v36, v40))
      {
        int v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, v40, "Location updated but no significant difference from known location; Update will be skipped.",
          v41,
          2u);
        sub_10000E950();
      }
      else
      {

        uint64_t v36 = v20;
      }
    }
    else
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_100053568();
      sub_10000E284(v23, (uint64_t)qword_1000708C8);
      id v24 = v3;
      uint64_t v25 = v20;
      uint64x2_t v26 = v24;
      uint64x2_t v27 = v25;
      uint64_t v28 = sub_100053548();
      int v29 = sub_100054118();
      if (os_log_type_enabled(v28, (os_log_type_t)v29))
      {
        LODWORD(v49) = v29;
        uint64_t v30 = swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        unint64_t v51 = v48;
        *(_DWORD *)uint64_t v30 = 141558787;
        uint64_t v50 = 1752392040;
        sub_100054288();
        *(_WORD *)(v30 + 12) = 2081;
        uint64_t v31 = *(void **)&v21[(void)v3];
        if (v31)
        {
          [v31 coordinate];
          uint64_t v32 = sub_100054218();
          unint64_t v34 = v33;
        }
        else
        {
          unint64_t v34 = 0xE300000000000000;
          uint64_t v32 = 7104878;
        }
        uint64_t v42 = sub_100029610(v32, v34, (uint64_t *)&v51);
        sub_100051048(v42);

        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 22) = 2160;
        uint64_t v50 = 1752392040;
        sub_100054288();
        *(_WORD *)(v30 + 32) = 2081;
        [v27 coordinate];
        uint64_t v43 = sub_100054218();
        uint64_t v45 = sub_100029610(v43, v44, (uint64_t *)&v51);
        sub_100051048(v45);

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v49, "Location significantly changed from %{private,mask.hash}s to %{private,mask.hash}s", (uint8_t *)v30, 0x2Au);
        swift_arrayDestroy();
        sub_10000E950();
        sub_10000E950();
      }
      else
      {
      }
      uint64_t v46 = *(void **)&v21[(void)v3];
      *(void *)&v21[(void)v3] = v20;
      uint64_t v36 = v27;

      sub_10004DDD4(0x6E6F697461636F6CLL, 0xEF65676E61686320);
    }
  }
  else
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_100053568();
    sub_10000E284(v35, (uint64_t)qword_1000708C8);
    uint64_t v36 = sub_100053548();
    os_log_type_t v37 = sub_100054118();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Location updated but did not meet accuracy requirements; Update will be skipped.",
        v38,
        2u);
      sub_10000E950();
    }
  }
}

void sub_10004DDD4(uint64_t a1, unint64_t a2)
{
  os_log_type_t v3 = v2;
  uint64_t v6 = sub_100053198();
  uint64_t v78 = *(void *)(v6 - 8);
  uint64_t v79 = v6;
  __chkstk_darwin(v6);
  id v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000068D8((uint64_t *)&unk_10006D940);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for PosterDataModel(0);
  uint64_t v13 = __chkstk_darwin(v12);
  char v15 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v80 = (uint64_t)&v75 - v16;
  uint64_t v17 = type metadata accessor for PosterData(0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v20 = &v3[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus];
  if ((v3[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus + 4] & 1) != 0
    || (sub_1000541A8() & 1) == 0)
  {
    uint64_t v27 = a1;
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_100053568();
    sub_10000E284(v28, (uint64_t)qword_1000708C8);
    unint64_t v29 = a2;
    swift_bridgeObjectRetain_n();
    uint64_t v30 = v3;
    uint64_t v31 = sub_100053548();
    os_log_type_t v32 = sub_100054118();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_100029610(v27, v29, &v82);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2082;
      if (v20[4])
      {
        unint64_t v34 = 0xE700000000000000;
        uint64_t v35 = 0x6E776F6E6B6E75;
      }
      else
      {
        uint64_t v35 = sub_1000541B8();
        unint64_t v34 = v36;
      }
      uint64_t v81 = sub_100029610(v35, v34, &v82);
      sub_100054288();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Update for %{public}s will be skipped because location is unauthorized; status=%{public}s",
        (uint8_t *)v33,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_17;
    }

LABEL_14:
    swift_bridgeObjectRelease_n();
LABEL_18:
    sub_10004F4DC();
    return;
  }
  uint64_t v77 = a1;
  int v21 = v3[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkStatus];
  if (v21 == 2) {
    goto LABEL_4;
  }
  if (v21)
  {
    swift_bridgeObjectRelease();
LABEL_23:
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_100053568();
    sub_10000E284(v38, (uint64_t)qword_1000708C8);
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_100053548();
    os_log_type_t v39 = sub_100054118();
    if (os_log_type_enabled(v31, v39))
    {
      os_log_type_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v40 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_100029610(v77, a2, &v82);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v31, v39, "Update for %{public}s will be skipped because network is offline", v40, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
LABEL_17:
      swift_slowDealloc();

      goto LABEL_18;
    }

    goto LABEL_14;
  }
  char v37 = sub_100054508();
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_23;
  }
LABEL_4:
  os_log_type_t v22 = *(void **)&v3[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_location];
  if (v22)
  {
    uint64_t v23 = v22;
    sub_10001FF1C(v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      char v76 = v23;
      sub_100050D84();
      sub_10003BBC0();
      char v24 = sub_10002F7F4(600.0);
      sub_10001F7A8((uint64_t)v11, (uint64_t *)&unk_10006D940);
      sub_100050CD8();
      if (v24)
      {
        sub_100050D2C((uint64_t)v15, (void (*)(void))type metadata accessor for PosterDataModel);
        uint64x2_t v26 = v76;
      }
      else
      {
        uint64x2_t v26 = v76;
        v25.super.Class isa = v76;
        BOOL v54 = sub_100054228(v25, 0.001);
        sub_100050D2C((uint64_t)v15, (void (*)(void))type metadata accessor for PosterDataModel);
        if (!v54)
        {
          if (qword_10006BB58 != -1) {
            swift_once();
          }
          uint64_t v65 = sub_100053568();
          sub_10000E284(v65, (uint64_t)qword_1000708C8);
          uint64_t v66 = v26;
          swift_bridgeObjectRetain_n();
          char v67 = v66;
          os_log_type_t v68 = sub_100053548();
          os_log_type_t v69 = sub_100054118();
          if (os_log_type_enabled(v68, v69))
          {
            uint64_t v70 = swift_slowAlloc();
            char v76 = (objc_class *)swift_slowAlloc();
            uint64_t v82 = (uint64_t)v76;
            *(_DWORD *)uint64_t v70 = 136446466;
            swift_bridgeObjectRetain();
            uint64_t v81 = sub_100029610(v77, a2, &v82);
            sub_100054288();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v70 + 12) = 2082;
            id v71 = [(objc_class *)v67 timestamp];
            sub_100053158();

            uint64_t v72 = sub_1000530F8();
            unint64_t v74 = v73;
            (*(void (**)(char *, uint64_t))(v78 + 8))(v8, v79);
            uint64_t v81 = sub_100029610(v72, v74, &v82);
            sub_100054288();

            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v68, v69, "Update for %{public}s will be skipped because the current data's weather and location is recent; locationT"
              "imestamp=%{public}s",
              (uint8_t *)v70,
              0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }
          goto LABEL_56;
        }
      }
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v55 = sub_100053568();
      sub_10000E284(v55, (uint64_t)qword_1000708C8);
      uint64_t v56 = v26;
      swift_bridgeObjectRetain_n();
      uint64_t v57 = v56;
      uint64_t v58 = sub_100053548();
      os_log_type_t v59 = sub_100054118();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = swift_slowAlloc();
        char v76 = (objc_class *)swift_slowAlloc();
        uint64_t v82 = (uint64_t)v76;
        *(_DWORD *)uint64_t v60 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v81 = sub_100029610(v77, a2, &v82);
        sub_100054288();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v60 + 12) = 2082;
        id v61 = [(objc_class *)v57 timestamp];
        sub_100053158();

        uint64_t v62 = sub_1000530F8();
        unint64_t v64 = v63;
        (*(void (**)(char *, uint64_t))(v78 + 8))(v8, v79);
        uint64_t v81 = sub_100029610(v62, v64, &v82);
        sub_100054288();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "Update for %{public}s will fetch new data because the current data's weather or location is stale; locationTim"
          "estamp=%{public}s",
          (uint8_t *)v60,
          0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_10004FA9C(v57);

LABEL_56:
      sub_100050D2C(v80, (void (*)(void))type metadata accessor for PosterDataModel);
      return;
    }
    uint64_t v45 = v23;
    uint64_t v46 = *v19;
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_100053568();
    sub_10000E284(v47, (uint64_t)qword_1000708C8);
    unint64_t v48 = a2;
    swift_bridgeObjectRetain_n();
    uint64_t v49 = sub_100053548();
    os_log_type_t v50 = sub_100054118();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = 0xD000000000000014;
      uint64_t v52 = swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_100029610(v77, v48, &v82);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v52 + 12) = 2082;
      unint64_t v53 = 0x80000001000572A0;
      switch(v46)
      {
        case 1:
          unint64_t v53 = 0xEE00656E696C6666;
          uint64_t v51 = 0x4F6B726F7774656ELL;
          break;
        case 2:
          unint64_t v53 = 0xE600000000000000;
          uint64_t v51 = 0x617461446F6ELL;
          break;
        case 3:
          unint64_t v53 = 0x80000001000572D0;
          break;
        default:
          break;
      }
      uint64_t v81 = sub_100029610(v51, v53, &v82);
      sub_100054288();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Update for %{public}s will fetch new data because the current data has error; error=%{public}s",
        (uint8_t *)v52,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10004FA9C(v45);
  }
  else
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_100053568();
    sub_10000E284(v41, (uint64_t)qword_1000708C8);
    swift_bridgeObjectRetain_n();
    uint64_t v42 = sub_100053548();
    os_log_type_t v43 = sub_100054118();
    if (os_log_type_enabled(v42, v43))
    {
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      *(_DWORD *)unint64_t v44 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_100029610(v77, a2, &v82);
      sub_100054288();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Update for %{public}s will be skipped because current location is unknown", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_10004ED28()
{
  if (qword_10006BB58 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100053568();
  sub_10000E284(v1, (uint64_t)qword_1000708C8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100053548();
  os_log_type_t v3 = sub_100054118();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = (uint8_t *)sub_10003E700();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)int v4 = 136446210;
    swift_getErrorValue();
    uint64_t v5 = sub_100054588();
    sub_100029610(v5, v6, &v10);
    sub_100050FF0();
    sub_100054288();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Location request had error=%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    sub_10000E950();
    sub_10000E950();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  type metadata accessor for Code(0);
  uint64_t v10 = 0;
  sub_100050DD8();
  uint64_t result = sub_100052F38();
  if ((result & 1) == 0)
  {
    uint64_t v8 = v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    sub_100021668(Strong, *(void *)(v8 + 8));
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_10004EFA0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus;
  char v5 = *(unsigned char *)(v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus + 4);
  *(_DWORD *)uint64_t v4 = [a1 authorizationStatus];
  *(unsigned char *)(v4 + 4) = 0;
  [a1 authorizationStatus];
  char v6 = sub_1000541A8();
  if ((v5 & 1) == 0 && (sub_1000541A8() & 1) == (v6 & 1))
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_100053568();
    sub_10000E284(v23, (uint64_t)qword_1000708C8);
    id v35 = a1;
    char v24 = sub_100053548();
    os_log_type_t v25 = sub_100054118();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136446466;
      [v35 authorizationStatus];
      uint64_t v27 = sub_1000541B8();
      sub_100029610(v27, v28, &v36);
      sub_100054288();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      [v35 authorizationStatus];
      char v29 = sub_1000541A8();
      BOOL v30 = (v29 & 1) == 0;
      if (v29) {
        uint64_t v31 = 0x7A69726F68747561;
      }
      else {
        uint64_t v31 = 0x726F687475616E75;
      }
      if (v30) {
        unint64_t v32 = 0xEC00000064657A69;
      }
      else {
        unint64_t v32 = 0xEA00000000006465;
      }
      sub_100029610(v31, v32, &v36);
      sub_100054288();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Location authorization changed to %{public}s, but the poster has no change as it is still %s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      sub_10000E950();
      sub_10000E950();
    }
    else
    {
    }
  }
  else
  {
    [a1 authorizationStatus];
    if (sub_1000541A8())
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_100053568();
      sub_10000E284(v7, (uint64_t)qword_1000708C8);
      id v8 = a1;
      uint64_t v9 = (void *)sub_100053548();
      os_log_type_t v10 = sub_100054118();
      if (sub_10005102C(v10))
      {
        sub_10003E700();
        uint64_t v36 = sub_10003B9FC();
        sub_100051008(4.8751e-34);
        uint64_t v11 = sub_1000541B8();
        sub_100029610(v11, v12, &v36);
        sub_100050FAC();

        swift_bridgeObjectRelease();
        sub_100050F8C((void *)&_mh_execute_header, v13, v14, "Location authorization changed to %{public}s - starting location updates");
        sub_100050FD4();
        sub_10000E950();
        sub_10000E950();
      }
      else
      {
      }
      id v33 = sub_10004C740();
      [v33 startUpdatingLocation];

      sub_10004DDD4(0xD00000000000001DLL, 0x8000000100058BA0);
    }
    else
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_100053568();
      sub_10000E284(v15, (uint64_t)qword_1000708C8);
      id v16 = a1;
      uint64_t v17 = (void *)sub_100053548();
      os_log_type_t v18 = sub_100054118();
      if (sub_10005102C(v18))
      {
        sub_10003E700();
        uint64_t v36 = sub_10003B9FC();
        sub_100051008(4.8751e-34);
        uint64_t v19 = sub_1000541B8();
        sub_100029610(v19, v20, &v36);
        sub_100050FAC();

        swift_bridgeObjectRelease();
        sub_100050F8C((void *)&_mh_execute_header, v21, v22, "Location authorization changed to %{public}s - stopping location updates");
        sub_100050FD4();
        sub_10000E950();
        sub_10000E950();
      }
      else
      {
      }
      id v34 = sub_10004C740();
      [v34 stopUpdatingLocation];

      sub_10004F4DC();
    }
  }
}

uint64_t sub_10004F4DC()
{
  uint64_t v1 = type metadata accessor for PosterData(0);
  uint64_t result = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_authorizationStatus + 4) & 1) == 0)
  {
    uint64_t result = sub_1000541A8();
    if ((result & 1) == 0)
    {
      char v7 = 0;
LABEL_10:
      char *v4 = v7;
      swift_storeEnumTagMultiPayload();
      sub_10004FF40();
      return sub_100050D2C((uint64_t)v4, (void (*)(void))type metadata accessor for PosterData);
    }
  }
  int v5 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkStatus);
  if (v5 == 2) {
    return result;
  }
  if (v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  char v6 = sub_100054508();
  uint64_t result = swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_9:
    char v7 = 1;
    goto LABEL_10;
  }
  return result;
}

id sub_10004F688()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100053EE8();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithIdentifier:v1];

  return v2;
}

void sub_10004F6FC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v1 = Strong;
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (!v2)
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_100053568();
      sub_10000E284(v3, (uint64_t)qword_1000708C8);
      uint64_t v4 = sub_100053548();
      os_log_type_t v5 = sub_1000540F8();
      if (os_log_type_enabled(v4, v5))
      {
        char v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Found unset network delegate during periodic update", v6, 2u);
        swift_slowDealloc();
      }
    }
    id v7 = sub_10004C740();
    id v8 = [v7 delegate];
    swift_unknownObjectRelease();

    if (!v8)
    {
      if (qword_10006BB58 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_100053568();
      sub_10000E284(v9, (uint64_t)qword_1000708C8);
      os_log_type_t v10 = sub_100053548();
      os_log_type_t v11 = sub_1000540F8();
      if (os_log_type_enabled(v10, v11))
      {
        unint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Found unset location manager delegate during periodic update", v12, 2u);
        swift_slowDealloc();
      }
    }
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100053568();
    sub_10000E284(v13, (uint64_t)qword_1000708C8);
    uint64_t v14 = sub_100053548();
    os_log_type_t v15 = sub_100054118();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Periodic timer fired - will check if update is needed", v16, 2u);
      swift_slowDealloc();
    }

    sub_10004DDD4(0x6369646F69726570, 0xEE0072656D697420);
  }
  else
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_100053568();
    sub_10000E284(v17, (uint64_t)qword_1000708C8);
    NSString v1 = sub_100053548();
    os_log_type_t v18 = sub_1000540F8();
    if (os_log_type_enabled(v1, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v18, "Periodic timer fired - self does not exist so the update will be skipped", v19, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10004FA9C(id a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation;
  if (!*(void *)(v1 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation)) {
    goto LABEL_4;
  }
  [a1 coordinate];
  os_log_type_t v5 = *(void **)(v1 + v4);
  if (!v5)
  {
    __break(1u);
    return;
  }
  v27.super.Class isa = (Class)v5;
  Class isa = v27.super.isa;
  BOOL v7 = sub_100054228(v27, 0.001);

  if (!v7)
  {
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_100053568();
    sub_10000E284(v17, (uint64_t)qword_1000708C8);
    os_log_t oslog = (os_log_t)a1;
    os_log_type_t v18 = sub_100053548();
    os_log_type_t v19 = sub_100054118();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 141558275;
      uint64_t v25 = v21;
      sub_100054288();
      *(_WORD *)(v20 + 12) = 2081;
      [oslog coordinate];
      uint64_t v22 = sub_100054218();
      sub_100029610(v22, v23, &v25);
      sub_100054288();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Update will be skipped because there is already a running request for the location=%{private,mask.hash}s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
LABEL_4:
    uint64_t v8 = v2 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    char v10 = sub_1000214D4(Strong, *(void *)(v8 + 8));
    swift_unknownObjectRelease();
    if (v10)
    {
      os_log_type_t v11 = *(void **)(v2 + v4);
      *(void *)(v2 + v4) = a1;

      uint64_t v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v13 = a1;
      swift_retain();
      sub_10000B038(v13, (uint64_t)sub_100050CD0, v12);
      swift_release_n();
      return;
    }
    if (qword_10006BB58 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100053568();
    sub_10000E284(v14, (uint64_t)qword_1000708C8);
    os_log_t oslog = (os_log_t)sub_100053548();
    os_log_type_t v15 = sub_100054118();
    if (os_log_type_enabled(oslog, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Update will be skipped because an extended session was not granted", v16, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10004FE70()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation);
    *(void *)(Strong + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation) = 0;

    uint64_t v3 = &v1[OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate];
    uint64_t v4 = swift_unknownObjectWeakLoadStrong();
    uint64_t v5 = *((void *)v3 + 1);
    swift_retain();
    sub_100021668(v4, v5);
    swift_release();
    swift_unknownObjectRelease();
    sub_10004FF40();
  }
}

uint64_t sub_10004FF40()
{
  uint64_t v0 = sub_100053198();
  uint64_t v77 = *(void *)(v0 - 8);
  uint64_t v78 = v0;
  __chkstk_darwin(v0);
  char v76 = (char *)&v72 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000068D8((uint64_t *)&unk_10006D940);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = type metadata accessor for PosterDataModel(0);
  uint64_t v5 = __chkstk_darwin(v79);
  BOOL v7 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  char v10 = (char *)&v72 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  id v13 = (char *)&v72 - v12;
  __chkstk_darwin(v11);
  uint64_t v80 = (char *)&v72 - v14;
  uint64_t v15 = type metadata accessor for PosterData(0);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v75 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v72 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  unint64_t v23 = (char *)&v72 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v72 - v24;
  sub_100050CD8();
  sub_100050CD8();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = type metadata accessor for PosterData;
    uint64_t v27 = (uint64_t)v23;
LABEL_3:
    sub_100050D2C(v27, (void (*)(void))v26);
  }
  else
  {
    switch(*v23)
    {
      case 1:
      case 2:
        goto LABEL_7;
      case 3:
        if (0x80000001000572D0 == 0x80000001000572A0) {
          goto LABEL_6;
        }
LABEL_7:
        uint64_t v74 = *v23;
        char v28 = sub_100054508();
        swift_bridgeObjectRelease();
        if (v28) {
          break;
        }
        sub_10001FF1C(v20);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          uint64_t v26 = type metadata accessor for PosterData;
          uint64_t v27 = (uint64_t)v20;
          goto LABEL_3;
        }
        id v34 = (uint64_t *)v80;
        sub_100050D84();
        sub_10001F394(*(uint64_t *)((char *)v34 + *(int *)(v79 + 40)), (uint64_t)v4);
        char v35 = sub_10002F7F4(900.0);
        sub_10001F7A8((uint64_t)v4, (uint64_t *)&unk_10006D940);
        if ((v35 & 1) == 0)
        {
          if (qword_10006BB58 != -1) {
            swift_once();
          }
          uint64_t v43 = sub_100053568();
          sub_10000E284(v43, (uint64_t)qword_1000708C8);
          sub_100050CD8();
          unint64_t v44 = sub_100053548();
          os_log_type_t v45 = sub_100054118();
          if (os_log_type_enabled(v44, v45))
          {
            uint64_t v46 = swift_slowAlloc();
            uint64_t v83 = swift_slowAlloc();
            *(_DWORD *)uint64_t v46 = 136446466;
            if (v74 == 1)
            {
              unint64_t v47 = 0xEE00656E696C6666;
              uint64_t v48 = 0x4F6B726F7774656ELL;
            }
            else if (v74 == 2)
            {
              unint64_t v47 = 0xE600000000000000;
              uint64_t v48 = 0x617461446F6ELL;
            }
            else
            {
              unint64_t v47 = 0x80000001000572D0;
              uint64_t v48 = 0xD000000000000014;
            }
            uint64_t v82 = sub_100029610(v48, v47, &v83);
            sub_100054288();
            swift_bridgeObjectRelease();
            *(_WORD *)(v46 + 12) = 2082;
            uint64_t v56 = sub_100032538();
            uint64_t v82 = sub_100029610(v56, v57, &v83);
            sub_100054288();
            swift_bridgeObjectRelease();
            sub_100050D2C((uint64_t)v7, (void (*)(void))type metadata accessor for PosterDataModel);
            _os_log_impl((void *)&_mh_execute_header, v44, v45, "Poster data changed to a transient error, but cached data is recent - will continue to show existing data;"
              " error=%{public}s, currentData=%{public}s",
              (uint8_t *)v46,
              0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v55 = (uint64_t)v80;
          }
          else
          {

            sub_100050D2C((uint64_t)v7, (void (*)(void))type metadata accessor for PosterDataModel);
            uint64_t v55 = (uint64_t)v34;
          }
          sub_100050D2C(v55, (void (*)(void))type metadata accessor for PosterDataModel);
          return sub_100050D2C((uint64_t)v25, (void (*)(void))type metadata accessor for PosterData);
        }
        sub_10003BBC0();
        char v36 = sub_10002F7F4(86400.0);
        sub_10001F7A8((uint64_t)v4, (uint64_t *)&unk_10006D940);
        if (v36)
        {
          if (qword_10006BB58 != -1) {
            swift_once();
          }
          uint64_t v37 = sub_100053568();
          sub_10000E284(v37, (uint64_t)qword_1000708C8);
          sub_100050CD8();
          uint64_t v38 = sub_100053548();
          os_log_type_t v39 = sub_100054118();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = swift_slowAlloc();
            uint64_t v83 = swift_slowAlloc();
            *(_DWORD *)uint64_t v40 = 136446466;
            if (v74 == 1)
            {
              unint64_t v41 = 0xEE00656E696C6666;
              uint64_t v42 = 0x4F6B726F7774656ELL;
            }
            else if (v74 == 2)
            {
              unint64_t v41 = 0xE600000000000000;
              uint64_t v42 = 0x617461446F6ELL;
            }
            else
            {
              unint64_t v41 = 0x80000001000572D0;
              uint64_t v42 = 0xD000000000000014;
            }
            uint64_t v82 = sub_100029610(v42, v41, &v83);
            sub_100054288();
            swift_bridgeObjectRelease();
            *(_WORD *)(v40 + 12) = 2082;
            uint64_t v58 = sub_100032538();
            uint64_t v82 = sub_100029610(v58, v59, &v83);
            sub_100054288();
            swift_bridgeObjectRelease();
            sub_100050D2C((uint64_t)v13, (void (*)(void))type metadata accessor for PosterDataModel);
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "Poster data changed to a transient error, and cached data is no longer usable - will update to show error;"
              " error=%{public}s, currentData=%{public}s",
              (uint8_t *)v40,
              0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v27 = (uint64_t)v80;
          }
          else
          {

            sub_100050D2C((uint64_t)v13, (void (*)(void))type metadata accessor for PosterDataModel);
            uint64_t v27 = (uint64_t)v34;
          }
          uint64_t v26 = type metadata accessor for PosterDataModel;
          goto LABEL_3;
        }
        if (qword_10006BB58 != -1) {
          swift_once();
        }
        uint64_t v49 = sub_100053568();
        sub_10000E284(v49, (uint64_t)qword_1000708C8);
        sub_100050CD8();
        os_log_type_t v50 = sub_100053548();
        os_log_type_t v51 = sub_100054118();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = swift_slowAlloc();
          uint64_t v73 = swift_slowAlloc();
          uint64_t v83 = v73;
          *(_DWORD *)uint64_t v52 = 136446466;
          if (v74 == 1)
          {
            unint64_t v53 = 0xEE00656E696C6666;
            uint64_t v54 = 0x4F6B726F7774656ELL;
          }
          else if (v74 == 2)
          {
            unint64_t v53 = 0xE600000000000000;
            uint64_t v54 = 0x617461446F6ELL;
          }
          else
          {
            unint64_t v53 = 0x80000001000572D0;
            uint64_t v54 = 0xD000000000000014;
          }
          uint64_t v82 = sub_100029610(v54, v53, &v83);
          sub_100054288();
          swift_bridgeObjectRelease();
          *(_WORD *)(v52 + 12) = 2082;
          uint64_t v60 = sub_100032538();
          uint64_t v82 = sub_100029610(v60, v61, &v83);
          sub_100054288();
          swift_bridgeObjectRelease();
          sub_100050D2C((uint64_t)v10, (void (*)(void))type metadata accessor for PosterDataModel);
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Poster data changed to a transient error, but cached data is updatable - will update to show new time of day; error=%{public}s, currentData=%{public}s",
            (uint8_t *)v52,
            0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          id v34 = (uint64_t *)v80;
        }
        else
        {
          sub_100050D2C((uint64_t)v10, (void (*)(void))type metadata accessor for PosterDataModel);
        }
        uint64_t v62 = (uint64_t)v76;
        sub_100053188();
        uint64_t v80 = (char *)sub_10002F4F0((uint64_t)v34, v62);
        sub_100053BD8();
        swift_allocObject();
        sub_100053BC8();
        unint64_t v63 = (int *)v79;
        unint64_t v64 = (char *)v34 + *(int *)(v79 + 24);
        uint64_t v65 = v34[2];
        uint64_t v66 = v34[3];
        char v67 = v75;
        sub_100053BB8();
        swift_release();
        uint64_t v68 = v34[1];
        uint64_t v74 = *v34;
        os_log_type_t v69 = (char *)v67 + v63[6];
        uint64_t v70 = sub_100053248();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16))(v69, v64, v70);
        sub_10003B5C4((uint64_t)v34 + v63[7], (uint64_t)v67 + v63[7]);
        sub_10003B5C4((uint64_t)v34 + v63[8], (uint64_t)v67 + v63[8]);
        *char v67 = v74;
        v67[1] = v68;
        v67[2] = v65;
        v67[3] = v66;
        *(void *)((char *)v67 + v63[10]) = v80;
        id v71 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
        swift_bridgeObjectRetain();
        v71(v62, v78);
        sub_100050D2C((uint64_t)v34, (void (*)(void))type metadata accessor for PosterDataModel);
        sub_100050D2C((uint64_t)v25, (void (*)(void))type metadata accessor for PosterData);
        swift_storeEnumTagMultiPayload();
        sub_100050D84();
        break;
      default:
LABEL_6:
        swift_bridgeObjectRelease();
        break;
    }
  }
  uint64_t v29 = v81;
  sub_100020600((uint64_t)v25);
  uint64_t v30 = v29 + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v31 = *(void *)(v30 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 8))(v25, ObjectType, v31);
    swift_unknownObjectRelease();
  }
  return sub_100050D2C((uint64_t)v25, (void (*)(void))type metadata accessor for PosterData);
}

uint64_t sub_100050C98()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100050CD0()
{
}

uint64_t sub_100050CD8()
{
  uint64_t v2 = sub_100051068();
  v3(v2);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_100050D2C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10000AFB4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100050D84()
{
  uint64_t v2 = sub_100051068();
  v3(v2);
  sub_10000AFB4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

unint64_t sub_100050DD8()
{
  unint64_t result = qword_10006D950;
  if (!qword_10006D950)
  {
    type metadata accessor for Code(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D950);
  }
  return result;
}

unint64_t sub_100050E28(unint64_t result, char a2, uint64_t a3)
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

id sub_100050E4C(unint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  sub_100050E28(a1, (a2 & 0xC000000000000001) == 0, a2);
  if (v4) {
    return (id)sub_100054328();
  }
  else {
    return *(id *)(a2 + 8 * a1 + 32);
  }
}

void *sub_100050EB0(void *(*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return 0;
  }
  uint64_t v6 = a3;
  unint64_t result = a1(&v7, &v6);
  if (!v4) {
    return (void *)v7;
  }
  return result;
}

id sub_100050F0C@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  id result = sub_100050E4C(*a1, *a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

id sub_100050F4C@<X0>(unint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100050F0C(a1, *(uint64_t **)(v2 + 16), a2);
}

void sub_100050F6C()
{
}

uint64_t sub_100050F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100050F84()
{
  return swift_release();
}

void sub_100050F8C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_100050FAC()
{
  return sub_100054288();
}

uint64_t sub_100050FD4()
{
  return swift_arrayDestroy();
}

id sub_100051008(float a1)
{
  float *v2 = a1;
  uint64_t v5 = *(const char **)(v3 + 3656);
  return [v1 v5];
}

BOOL sub_10005102C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100051048(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return sub_100054288();
}

uint64_t sub_100051068()
{
  return 0;
}

void sub_10005107C(double a1)
{
  *(unsigned char *)(v1 + 24) = 0;
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3) {
    [v3 invalidate];
  }
  uint64_t v4 = self;
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_1000517E8;
  v11[5] = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100017018;
  v11[3] = &unk_1000676A8;
  uint64_t v8 = _Block_copy(v11);
  swift_release();
  id v9 = [v4 scheduledTimerWithTimeInterval:0 repeats:v8 block:a1];
  _Block_release(v8);
  char v10 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v9;
}

void sub_1000511F0()
{
  *(unsigned char *)(v0 + 24) = 0;
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    [v1 invalidate];
    uint64_t v1 = *(void **)(v0 + 16);
  }
  *(void *)(v0 + 16) = 0;
}

uint64_t sub_100051234()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 16);
    if (v2)
    {
      [v2 invalidate];
      uint64_t v3 = *(void **)(v1 + 16);
    }
    else
    {
      uint64_t v3 = 0;
    }
    *(void *)(v1 + 16) = 0;

    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v5 = (void *)Strong;
      uint64_t v6 = sub_100053688();
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        uint64_t v8 = swift_allocObject();
        swift_weakInit();
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v8;
        *(void *)(v9 + 24) = v5;
        swift_retain();
        id v10 = v5;
        sub_1000535E8();
        swift_release();

        swift_release();
      }
      else
      {
      }
    }
    return swift_release();
  }
  return result;
}

void sub_10005138C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100053198();
  uint64_t v19 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100053C08();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100053B18();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_release();
  if (Strong)
  {
    uint64_t v15 = (void *)sub_100053688();

    if (v15)
    {
      v18[1] = a2;
      (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for BoundEntity.lightning(_:), v10);
      v18[0] = sub_100053B08();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for BoundPropertyName.lightningRespawnSeed(_:), v6);
      sub_100053BF8();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      sub_100053188();
      sub_1000530C8();
      double v17 = v16;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v3);
      if ((~*(void *)&v17 & 0x7FF0000000000000) != 0)
      {
        if (v17 > -9.22337204e18)
        {
          if (v17 < 9.22337204e18)
          {
            v20[3] = &type metadata for Int;
            v20[0] = (uint64_t)v17;
            sub_100053678();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_100019004((uint64_t)v20);
            return;
          }
LABEL_10:
          __break(1u);
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_10;
    }
  }
}

uint64_t sub_1000516DC()
{
  return _swift_deallocClassInstance(v0, 25, 7);
}

uint64_t type metadata accessor for VFXLightningManager()
{
  return self;
}

uint64_t sub_100051738()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100051770()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000517A8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000517E8()
{
  return sub_100051234();
}

uint64_t sub_1000517F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100051800()
{
  return swift_release();
}

uint64_t sub_100051808()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100051848()
{
  sub_10005138C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100051850(uint64_t a1)
{
  return sub_100051990(a1, qword_1000708B0);
}

uint64_t sub_10005187C(uint64_t a1)
{
  return sub_100051990(a1, qword_1000708C8);
}

uint64_t sub_1000518A0(uint64_t a1)
{
  return sub_100051990(a1, qword_1000708E0);
}

uint64_t sub_1000518C8(uint64_t a1)
{
  return sub_100051A08(a1, qword_1000708F8);
}

uint64_t sub_1000518F0(uint64_t a1)
{
  return sub_100051990(a1, qword_100070910);
}

uint64_t sub_10005191C(uint64_t a1)
{
  return sub_100051A08(a1, qword_100070928);
}

uint64_t sub_100051944(uint64_t a1)
{
  return sub_100051A08(a1, qword_100070940);
}

uint64_t sub_10005196C(uint64_t a1)
{
  return sub_100051990(a1, qword_100070958);
}

uint64_t sub_100051990(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100053568();
  sub_10003714C(v3, a2);
  sub_10000E284(v3, (uint64_t)a2);
  return sub_100053558();
}

uint64_t sub_100051A08(uint64_t a1, uint64_t *a2)
{
  return sub_100051990(a1, a2);
}

id WeatherIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherIntent();
  return [super init];
}

uint64_t type metadata accessor for WeatherIntent()
{
  return self;
}

id WeatherIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntent();
  id v9 = sub_100052584((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id WeatherIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for WeatherIntent();
  [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id WeatherIntent.__allocating_init(domain:verb:parametersByName:)()
{
  NSString v2 = sub_10005259C();
  swift_bridgeObjectRelease();
  NSString v3 = sub_100053EE8();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v4.super.Class isa = sub_100053E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  id v5 = [objc_allocWithZone(v0) initWithDomain:v2 verb:v3 parametersByName:v4.super.isa];

  return v5;
}

id WeatherIntent.init(domain:verb:parametersByName:)()
{
  NSString v2 = sub_10005259C();
  swift_bridgeObjectRelease();
  NSString v3 = sub_100053EE8();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v4.super.Class isa = sub_100053E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WeatherIntent();
  id v5 = [super initWithDomain:v2 verb:v3 parametersByName:v4.super.isa];

  return v5;
}

id WeatherIntent.__deallocating_deinit()
{
  return sub_100052490(type metadata accessor for WeatherIntent);
}

unint64_t WeatherIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

unint64_t sub_100051EB0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = WeatherIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_100051EE4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t WeatherIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___WeatherIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_100051F84(uint64_t a1)
{
  NSString v3 = (void *)(v1 + OBJC_IVAR___WeatherIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *NSString v3 = a1;
  return result;
}

char *WeatherIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return WeatherIntentResponse.init(code:userActivity:)(a1, a2);
}

char *WeatherIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___WeatherIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id WeatherIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  return [super init];
}

uint64_t type metadata accessor for WeatherIntentResponse()
{
  return self;
}

id WeatherLocation.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id WeatherIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_100052584((uint64_t)v11.super_class, "initWithCoder:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id WeatherIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_100052584((uint64_t)v11.super_class, "initWithBackingStore:", v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id WeatherIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.Class isa = sub_100053E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id WeatherIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.Class isa = sub_100053E78().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  id v9 = sub_100052584((uint64_t)v11.super_class, "initWithPropertiesByName:", v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id WeatherIntentResponse.__deallocating_deinit()
{
  return sub_100052490(type metadata accessor for WeatherIntentResponse);
}

id sub_100052490(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

unint64_t sub_1000524CC()
{
  unint64_t result = qword_10006DA18;
  if (!qword_10006DA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA18);
  }
  return result;
}

uint64_t sub_100052518@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WeatherIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100052544(uint64_t *a1)
{
  return sub_100051F84(*a1);
}

ValueMetadata *type metadata accessor for WeatherIntentResponseCode()
{
  return &type metadata for WeatherIntentResponseCode;
}

id sub_100052584(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return [super a2:v9];
}

NSString sub_10005259C()
{
  return sub_100053EE8();
}

id WeatherLocation.__allocating_init(identifier:display:pronunciationHint:)()
{
  sub_100052EE4();
  if (v2)
  {
    NSString v3 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = sub_100053EE8();
  swift_bridgeObjectRelease();
  if (v1)
  {
    NSString v5 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [objc_allocWithZone(v0) initWithIdentifier:v3 displayString:v4 pronunciationHint:v5];

  return v6;
}

id WeatherLocation.init(identifier:display:pronunciationHint:)()
{
  sub_100052EE4();
  if (v2)
  {
    NSString v3 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  NSString v4 = sub_100053EE8();
  swift_bridgeObjectRelease();
  if (v1)
  {
    NSString v5 = sub_100053EE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for WeatherLocation();
  id v6 = [super initWithIdentifier:v3 displayString:v4 pronunciationHint:v5];

  return v6;
}

uint64_t type metadata accessor for WeatherLocation()
{
  return self;
}

id WeatherLocation.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for WeatherLocation();
  [super initWithCoder:a1];

  return v3;
}

id WeatherLocation.__deallocating_deinit()
{
  return sub_100052E84(type metadata accessor for WeatherLocation);
}

id static WeatherLocationResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static WeatherLocationResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100052A5C();
    swift_bridgeObjectRetain();
    sub_100054408();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100054528();
    sub_100052A5C();
  }
  ObjCClassFromMetadatCGFloat a = (void *)swift_getObjCClassFromMetadata();
  sub_100052A5C();
  Class isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  id v3 = [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_100052A5C()
{
  unint64_t result = qword_10006DA98;
  if (!qword_10006DA98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006DA98);
  }
  return result;
}

id static WeatherLocationResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static WeatherLocationResolutionResult.success(with:)()
{
}

void static WeatherLocationResolutionResult.disambiguation(with:)()
{
}

void static WeatherLocationResolutionResult.confirmationRequired(with:)()
{
}

id WeatherLocationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_100053E78().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id WeatherLocationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_100053E78().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for WeatherLocationResolutionResult();
  id v5 = [super initWithJSONDictionary:isa forIntent:a2];

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for WeatherLocationResolutionResult()
{
  return self;
}

id WeatherLocationResolutionResult.__deallocating_deinit()
{
  return sub_100052E84(type metadata accessor for WeatherLocationResolutionResult);
}

id sub_100052E84(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_100052EBC()
{
  return sub_1000543F8();
}

uint64_t sub_100052EF8()
{
  return Measurement.init(value:unit:)();
}

uint64_t sub_100052F08()
{
  return Measurement.value.getter();
}

uint64_t sub_100052F28(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100052F38()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_100052F48()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100052F58()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100052F68()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100052F78()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_100052F88()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_100052F98()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_100052FA8()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_100053018()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100053028()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100053038()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_100053048()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100053058()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100053068()
{
  return URL.path.getter();
}

uint64_t sub_100053078()
{
  return URL.init(string:)();
}

uint64_t sub_100053088()
{
  return type metadata accessor for URL();
}

uint64_t sub_100053098()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_1000530A8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000530B8()
{
  return Data.write(to:options:)();
}

uint64_t sub_1000530C8()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_1000530D8()
{
  return Date.wc_addHours(_:calendar:)();
}

uint64_t sub_1000530E8()
{
  return Date.wc_addMinutes(_:calendar:)();
}

uint64_t sub_1000530F8()
{
  return Date.description.getter();
}

uint64_t sub_100053108()
{
  return static Date.distantPast.getter();
}

uint64_t sub_100053118()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_100053128()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100053138()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100053148()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_100053158()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100053168()
{
  return static Date.now.getter();
}

uint64_t sub_100053178()
{
  return Date.startOfDay.getter();
}

uint64_t sub_100053188()
{
  return Date.init()();
}

uint64_t sub_100053198()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000531A8()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_1000531B8()
{
  return UUID.init()();
}

uint64_t sub_1000531C8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000531D8()
{
  return static Calendar.current.getter();
}

uint64_t sub_1000531E8()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_1000531F8()
{
  return TimeZone.init(identifier:)();
}

uint64_t sub_100053208()
{
  return TimeZone.identifier.getter();
}

NSTimeZone sub_100053218()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_100053228()
{
  return static TimeZone.== infix(_:_:)();
}

uint64_t sub_100053238()
{
  return static TimeZone.current.getter();
}

uint64_t sub_100053248()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100053258()
{
  return CurrentWeather.predominateCloudAltitudeKind.getter();
}

uint64_t sub_100053268()
{
  return CurrentWeather.cloudCover.getter();
}

uint64_t sub_100053278()
{
  return CurrentWeather.isDaylight.getter();
}

uint64_t sub_100053288()
{
  return CurrentWeather.date.getter();
}

uint64_t sub_100053298()
{
  return CurrentWeather.wind.getter();
}

uint64_t sub_1000532A8()
{
  return CurrentWeather.condition.getter();
}

uint64_t sub_1000532B8()
{
  return type metadata accessor for CurrentWeather();
}

uint64_t sub_1000532C8()
{
  return type metadata accessor for WeatherServiceCaching.Options();
}

uint64_t sub_1000532D8()
{
  return type metadata accessor for WeatherNetworkActivity();
}

uint64_t sub_1000532E8()
{
  return WeatherServiceFetchOptions.init(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:networkActivity:needsMarineData:needsTwilightData:)();
}

uint64_t sub_1000532F8()
{
  return type metadata accessor for WeatherServiceFetchOptions();
}

uint64_t sub_100053308()
{
  return type metadata accessor for WeatherServiceLocationOptions();
}

uint64_t sub_100053318()
{
  return WeatherServiceFetchOptionsProvider.init(geocodeManager:)();
}

uint64_t sub_100053328()
{
  return type metadata accessor for WeatherServiceFetchOptionsProvider();
}

uint64_t sub_100053338()
{
  return static WeatherQuery.minute.getter();
}

uint64_t sub_100053348()
{
  return static WeatherQuery.current.getter();
}

uint64_t sub_100053358()
{
  return WeatherService.fetchWeather<A, B>(for:including:_:options:completion:)();
}

uint64_t sub_100053378()
{
  return WeatherService.__allocating_init(endpoint:fetchOptionsProvider:)();
}

uint64_t sub_100053388()
{
  return type metadata accessor for WeatherService();
}

uint64_t sub_100053398()
{
  return WeatherCondition.init(rawValue:)();
}

uint64_t sub_1000533A8()
{
  return WeatherCondition.rawValue.getter();
}

uint64_t sub_1000533B8()
{
  return type metadata accessor for WeatherCondition();
}

uint64_t sub_1000533C8()
{
  return WDSEndpoint.init(url:)();
}

uint64_t sub_1000533D8()
{
  return type metadata accessor for WDSEndpoint();
}

uint64_t sub_1000533E8()
{
  return GeocodeStore.init()();
}

uint64_t sub_1000533F8()
{
  return type metadata accessor for GeocodeStore();
}

uint64_t sub_100053408()
{
  return GeocodeManager.init(service:store:)();
}

uint64_t sub_100053418()
{
  return type metadata accessor for GeocodeManager();
}

uint64_t sub_100053428()
{
  return GeocodeService.init()();
}

uint64_t sub_100053438()
{
  return type metadata accessor for GeocodeService();
}

uint64_t sub_100053448()
{
  return Wind.speed.getter();
}

uint64_t sub_100053458()
{
  return type metadata accessor for Wind();
}

uint64_t sub_100053468()
{
  return static Location.currentLocationIntentID.getter();
}

uint64_t sub_100053478()
{
  return Location.coordinate.getter();
}

uint64_t sub_100053488()
{
  return static Location.== infix(_:_:)();
}

uint64_t sub_100053498()
{
  return Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)();
}

uint64_t sub_1000534A8()
{
  return Location.timeZone.getter();
}

uint64_t sub_1000534B8()
{
  return static Location.cupertino.getter();
}

uint64_t sub_1000534C8()
{
  return type metadata accessor for Location();
}

uint64_t sub_1000534D8()
{
  return CGFloat.isEqualTo(_:)();
}

uint64_t sub_1000534E8()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_1000534F8()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100053508()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100053518()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100053528()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100053538()
{
  return static Logger.vfx.getter();
}

uint64_t sub_100053548()
{
  return Logger.logObject.getter();
}

uint64_t sub_100053558()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100053568()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100053578()
{
  return dispatch thunk of VFXScene.LoadOptions.setupRenderer.setter();
}

uint64_t sub_100053588()
{
  return dispatch thunk of VFXScene.LoadOptions.metalLibraryURL.setter();
}

uint64_t sub_100053598()
{
  return dispatch thunk of VFXScene.LoadOptions.useGammaBlending.setter();
}

uint64_t sub_1000535A8()
{
  return dispatch thunk of VFXScene.LoadOptions.internalPixelFormatDepth.setter();
}

uint64_t sub_1000535B8()
{
  return dispatch thunk of VFXScene.LoadOptions.automaticallyPrepareScene.setter();
}

uint64_t sub_1000535C8()
{
  return dispatch thunk of VFXScene.LoadOptions.clientID.setter();
}

uint64_t sub_1000535D8()
{
  return type metadata accessor for VFXScene.LoadOptions();
}

uint64_t sub_1000535E8()
{
  return dispatch thunk of VFXScene.performTransaction(_:)();
}

uint64_t sub_1000535F8()
{
  return dispatch thunk of VFXScene.effects.getter();
}

uint64_t sub_100053608()
{
  return VFXScene.init(options:)();
}

uint64_t sub_100053618()
{
  return dispatch thunk of VFXScene.prepare()();
}

uint64_t sub_100053628()
{
  return dispatch thunk of VFXScene.isFrozen.setter();
}

uint64_t sub_100053638()
{
  return dispatch thunk of VFXScene.addEffect(from:)();
}

uint64_t sub_100053648()
{
  return dispatch thunk of VFXScene.timeScale.getter();
}

uint64_t sub_100053658()
{
  return dispatch thunk of VFXScene.timeScale.setter();
}

uint64_t sub_100053668()
{
  return type metadata accessor for VFXScene();
}

uint64_t sub_100053678()
{
  return dispatch thunk of VFXEffect.setParameter(of:named:_:)();
}

uint64_t sub_100053688()
{
  return dispatch thunk of VFXEffect.scene.getter();
}

uint64_t sub_100053698()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t sub_1000536A8()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_1000536B8()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1000536C8()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t sub_1000536D8()
{
  return NWPathMonitor.start(queue:)();
}

void sub_1000536E8()
{
}

uint64_t sub_1000536F8()
{
  return NWPathMonitor.init()();
}

uint64_t sub_100053708()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t sub_100053718()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t sub_100053728()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t sub_100053738()
{
  return NWPath.status.getter();
}

uint64_t sub_100053748()
{
  return type metadata accessor for NWPath();
}

uint64_t sub_100053758()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100053768()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100053778()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100053788()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100053798()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000537A8()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000537B8()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_1000537C8()
{
  return + infix(_:_:)();
}

uint64_t sub_1000537D8()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_1000537E8()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_1000537F8()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100053808()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100053818()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100053828()
{
  return PRRenderingConfiguration.init(_:)();
}

uint64_t sub_100053838()
{
  return WeatherVFXViewModel.effect.getter();
}

uint64_t sub_100053848()
{
  return type metadata accessor for WeatherVFXViewModel();
}

uint64_t sub_100053858()
{
  return WeatherConditionGradientModel.init(conditionKind:elevation:isDaylight:presentation:cloudCover:cloudKind:)();
}

uint64_t sub_100053868()
{
  return type metadata accessor for WeatherConditionGradientModel.AnimationContext();
}

uint64_t sub_100053878()
{
  return type metadata accessor for WeatherConditionGradientModel.PresentationContext();
}

uint64_t sub_100053888()
{
  return type metadata accessor for WeatherConditionGradientModel();
}

uint64_t sub_100053898()
{
  return WeatherVFXConditionBackground.$backgroundEffectModel.getter();
}

uint64_t sub_1000538A8()
{
  return WeatherVFXConditionBackground.isLoaded.getter();
}

uint64_t sub_1000538B8()
{
  return WeatherVFXConditionBackground.$isLoaded.getter();
}

uint64_t sub_1000538C8()
{
  return WeatherVFXConditionBackground.init()();
}

uint64_t sub_1000538D8()
{
  return type metadata accessor for WeatherVFXConditionBackground();
}

uint64_t sub_1000538E8()
{
  return WeatherConditionGradientManager.load(for:)();
}

uint64_t sub_1000538F8()
{
  return WeatherConditionGradientManager.init()();
}

uint64_t sub_100053908()
{
  return type metadata accessor for WeatherConditionGradientManager();
}

uint64_t sub_100053918()
{
  return type metadata accessor for WeatherConditionBackgroundConfig.CameraPositionType();
}

uint64_t sub_100053928()
{
  return type metadata accessor for WeatherConditionBackgroundConfig();
}

uint64_t sub_100053938()
{
  return WeatherConditionBackgroundManager.init(configurationManager:templateManager:)();
}

void sub_100053948()
{
}

uint64_t sub_100053958()
{
  return WeatherConditionBackgroundManager.addOverride(_:for:)();
}

uint64_t sub_100053968()
{
  return WeatherConditionBackgroundManager.addLoadRequest(_:)();
}

uint64_t sub_100053978()
{
  return WeatherConditionBackgroundManager.executeOverrides(for:)();
}

void sub_100053988()
{
}

void sub_100053998(Swift::Bool a1)
{
}

uint64_t sub_1000539A8()
{
  return WeatherConditionBackgroundManager.pause(_:completion:)();
}

uint64_t sub_1000539B8()
{
  return WeatherConditionBackgroundManager.vfxScene.getter();
}

uint64_t sub_1000539C8()
{
  return type metadata accessor for WeatherConditionBackgroundManager();
}

uint64_t sub_1000539D8()
{
  return WeatherConditionBackgroundOptions.init(locationIDs:applyMask:applyLegibilityScrim:effectViewID:canShowCollisionLayer:cameraPositionType:displayLocation:windowBounds:displayScale:locationViewerOrientation:)();
}

uint64_t sub_1000539E8()
{
  return type metadata accessor for WeatherConditionBackgroundOptions.DisplayLocation();
}

uint64_t sub_1000539F8()
{
  return type metadata accessor for WeatherConditionBackgroundOptions();
}

uint64_t sub_100053A08()
{
  return WeatherConditionConfigurationModel.init(condition:windSpeed:cloudCover:cloudKind:elevation:date:sunrise:sunset:timeZone:moonData:cameraPositionType:dynamicTypeSize:targetWindowSizeClass:displayLocation:collisionViewMetrics:)();
}

uint64_t sub_100053A18()
{
  return type metadata accessor for WeatherConditionConfigurationModel();
}

uint64_t sub_100053A28()
{
  return WeatherConditionConfigurationManager.load(for:)();
}

uint64_t sub_100053A38()
{
  return WeatherConditionConfigurationManager.init()();
}

uint64_t sub_100053A48()
{
  return type metadata accessor for WeatherConditionConfigurationManager();
}

void sub_100053A58()
{
}

void sub_100053A68(Swift::Bool a1)
{
}

uint64_t sub_100053A78()
{
  return WeatherVFXEffect.applyUpdate(_:lastConfiguration:effectType:cameraPositionType:hasLocationChanged:gradient:)();
}

uint64_t sub_100053A88()
{
  return WeatherVFXEffect.applyOverrides(_:config:)();
}

uint64_t sub_100053A98()
{
  return WeatherVFXEffect.init(vfxEffect:)();
}

uint64_t sub_100053AA8()
{
  return type metadata accessor for WeatherVFXEffect();
}

uint64_t sub_100053AB8()
{
  return static GeoHandler.getElevation(for:timeZone:on:)();
}

uint64_t sub_100053AC8()
{
  return MicaLoader.loadMicaURL(for:)();
}

uint64_t sub_100053AD8()
{
  return MicaLoader.loadMicaLayer(at:)();
}

uint64_t sub_100053AE8()
{
  return MicaLoader.init()();
}

uint64_t sub_100053AF8()
{
  return type metadata accessor for MicaLoader();
}

uint64_t sub_100053B08()
{
  return BoundEntity.rawValue.getter();
}

uint64_t sub_100053B18()
{
  return type metadata accessor for BoundEntity();
}

uint64_t sub_100053B28()
{
  return VFXEffectType.url.getter();
}

uint64_t sub_100053B38()
{
  return type metadata accessor for VFXEffectType();
}

uint64_t sub_100053B48()
{
  return VFXLoadRequest.init(backgroundObserver:lastModel:model:gradient:dynamicTypeSize:targetWindowSizeClass:collisionViewMetrics:)();
}

uint64_t sub_100053B58()
{
  return VFXLoadRequest.model.getter();
}

uint64_t sub_100053B68()
{
  return type metadata accessor for VFXLoadRequest();
}

uint64_t sub_100053B78()
{
  return MicaContentView.applyScaleTransform(_:)();
}

uint64_t sub_100053B88()
{
  return MicaContentView.init(animation:)();
}

uint64_t sub_100053B98()
{
  return type metadata accessor for MicaContentView();
}

uint64_t sub_100053BA8()
{
  return type metadata accessor for VFXEffectViewID();
}

uint64_t sub_100053BB8()
{
  return MoonDataProvider.weatherBackgroundMoonData(for:timeZone:coordinate:)();
}

uint64_t sub_100053BC8()
{
  return MoonDataProvider.init()();
}

uint64_t sub_100053BD8()
{
  return type metadata accessor for MoonDataProvider();
}

uint64_t sub_100053BE8()
{
  return type metadata accessor for VFXOverrideModel();
}

uint64_t sub_100053BF8()
{
  return BoundPropertyName.rawValue.getter();
}

uint64_t sub_100053C08()
{
  return type metadata accessor for BoundPropertyName();
}

uint64_t sub_100053C18()
{
  return static CloudAltitudeKind.== infix(_:_:)();
}

uint64_t sub_100053C28()
{
  return type metadata accessor for CloudAltitudeKind();
}

uint64_t sub_100053C38()
{
  return MicaResourceModel.condition.getter();
}

uint64_t sub_100053C48()
{
  return MicaResourceModel.init(condition:isDay:windowBounds:displayScale:)();
}

uint64_t sub_100053C58()
{
  return type metadata accessor for MicaResourceModel();
}

uint64_t sub_100053C68()
{
  return type metadata accessor for BackgroundMoonData();
}

uint64_t sub_100053C78()
{
  return type metadata accessor for CollisionViewMetrics();
}

void sub_100053C88(CAGradientLayer to)
{
}

uint64_t sub_100053C98()
{
  return SkyBackgroundGradient.init(hexes:)();
}

uint64_t sub_100053CA8()
{
  return type metadata accessor for SkyBackgroundGradient();
}

uint64_t sub_100053CB8()
{
  return type metadata accessor for TargetWindowSizeClass();
}

uint64_t sub_100053CC8()
{
  return VFXDeviceRotationState.init(degrees:progress:)();
}

uint64_t sub_100053CD8()
{
  return type metadata accessor for VFXDeviceRotationState();
}

uint64_t sub_100053CE8()
{
  return BackgroundAnimationData.Model.conditionKind.getter();
}

uint64_t sub_100053CF8()
{
  return BackgroundAnimationData.Model.date.getter();
}

uint64_t sub_100053D08()
{
  return BackgroundAnimationData.Model.location.getter();
}

uint64_t sub_100053D18()
{
  return BackgroundAnimationData.Model.init(location:date:conditionKind:windSpeed:cloudCover:cloudKind:elevation:moonData:options:isDayTime:sunrise:sunset:isReduceMotionEnabled:)();
}

uint64_t sub_100053D28()
{
  return BackgroundAnimationData.Model.elevation.getter();
}

uint64_t sub_100053D38()
{
  return type metadata accessor for BackgroundAnimationData.Model();
}

uint64_t sub_100053D48()
{
  return MicaBackgroundAnimation.init(windowBounds:mode:)();
}

uint64_t sub_100053D58()
{
  return MicaBackgroundAnimation.updateForNewLayer(_:duration:)();
}

uint64_t sub_100053D68()
{
  return MicaBackgroundAnimation.DynamicPosterRotationState.init(animationId:fromOrientation:toOrientation:progress:)();
}

uint64_t sub_100053D78()
{
  return type metadata accessor for MicaBackgroundAnimation.DynamicPosterRotationState();
}

uint64_t sub_100053D88()
{
  return MicaBackgroundAnimation.updateDynamicPosterRotationState(_:)();
}

uint64_t sub_100053D98()
{
  return type metadata accessor for MicaBackgroundAnimation.Mode();
}

void sub_100053DA8(Swift::Bool a1)
{
}

uint64_t sub_100053DB8()
{
  return MicaBackgroundAnimation.layer.getter();
}

uint64_t sub_100053DC8()
{
  return MicaBackgroundAnimation.pause(_:completion:)();
}

uint64_t sub_100053DD8()
{
  return type metadata accessor for MicaBackgroundAnimation();
}

uint64_t sub_100053DE8()
{
  return VFXSceneTemplateManager.init()();
}

uint64_t sub_100053DF8()
{
  return type metadata accessor for VFXSceneTemplateManager();
}

uint64_t sub_100053E08()
{
  return static Elevation.== infix(_:_:)();
}

uint64_t sub_100053E18()
{
  return Elevation.isPM.getter();
}

uint64_t sub_100053E28()
{
  return Elevation.degrees.getter();
}

uint64_t sub_100053E38()
{
  return type metadata accessor for Elevation();
}

uint64_t sub_100053E48()
{
  return Elevation.init(_:isPM:)();
}

uint64_t sub_100053E58()
{
  return MicaLayer.init(layer:)();
}

uint64_t sub_100053E68()
{
  return type metadata accessor for MicaLayer();
}

NSDictionary sub_100053E78()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100053E88()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100053E98()
{
  return Dictionary.init(dictionaryLiteral:)();
}

void sub_100053EA8(Swift::Bool keepingCapacity)
{
}

uint64_t sub_100053EB8()
{
  return FloatingPoint.clamped(to:)();
}

uint64_t sub_100053EC8()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100053ED8()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100053EE8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100053EF8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100053F08()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100053F18()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100053F28()
{
  return String.init(format:_:)();
}

uint64_t sub_100053F38()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100053F48()
{
  return String.hash(into:)();
}

void sub_100053F58(Swift::String a1)
{
}

Swift::Int sub_100053F68()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100053F78()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100053F88()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100053F98()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100053FA8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100053FB8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100053FC8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100053FD8()
{
  return Array.description.getter();
}

uint64_t sub_100053FE8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100054008()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_100054018()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_100054028()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100054038()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100054048()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100054058()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100054068()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100054078()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100054088()
{
  return type metadata accessor for TaskPriority();
}

void sub_100054098()
{
}

uint64_t sub_1000540A8()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_1000540B8()
{
  return Double.description.getter();
}

uint64_t sub_1000540C8()
{
  return Double.write<A>(to:)();
}

NSNumber sub_1000540D8()
{
  return Int._bridgeToObjectiveC()();
}

BOOL sub_1000540E8(Swift::Bool limitsPrecision, CLLocation_optional lastKnownLocation)
{
  return CLLocation.isValid(limitsPrecision:lastKnownLocation:)(limitsPrecision, lastKnownLocation);
}

uint64_t sub_1000540F8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100054108()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100054118()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100054128()
{
  return static NSUserDefaults.weatherSharedInternal.getter();
}

void sub_100054138()
{
}

uint64_t sub_100054148()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100054158()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100054168()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100054178()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100054188()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100054198()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000541A8()
{
  return CLAuthorizationStatus.isAuthorized.getter();
}

uint64_t sub_1000541B8()
{
  return CLAuthorizationStatus.logDescription.getter();
}

uint64_t sub_1000541C8()
{
  return static UIContentSizeCategory.<= infix(_:_:)();
}

uint64_t sub_1000541D8()
{
  return CLLocationCoordinate2D.SolarEvents.sunset.getter();
}

uint64_t sub_1000541E8()
{
  return CLLocationCoordinate2D.SolarEvents.sunrise.getter();
}

uint64_t sub_1000541F8()
{
  return type metadata accessor for CLLocationCoordinate2D.SolarEvents();
}

uint64_t sub_100054218()
{
  return CLLocationCoordinate2D.debugDescription.getter();
}

BOOL sub_100054228(CLLocation from, Swift::Double precision)
{
  return CLLocationCoordinate2D.isSignificantlyDifferent(from:precision:)(from, precision);
}

uint64_t sub_100054238()
{
  return static CLLocationCoordinate2D.== infix(_:_:)();
}

uint64_t sub_100054248()
{
  return VFXView.setupView(with:)();
}

uint64_t sub_100054258()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100054268()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100054278()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100054288()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100054298()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000542A8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000542B8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000542C8()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000542D8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000542E8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000542F8()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100054308(Swift::Int a1)
{
}

uint64_t sub_100054318()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100054328()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100054338()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_100054348()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_100054358()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100054368()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100054378()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100054388()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100054398()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000543A8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000543B8()
{
  return _print_unlocked<A, B>(_:_:)();
}

BOOL sub_1000543C8(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_1000543D8()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_1000543E8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000543F8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100054408()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100054418()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100054428()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100054448(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100054458()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100054468()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100054478()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100054498()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000544D8()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000544E8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000544F8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100054508()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100054518()
{
  return dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t sub_100054528()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100054548()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100054558()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100054588()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100054598()
{
  return Error.logSafeDescription.getter();
}

uint64_t sub_1000545A8()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000545B8()
{
  return Hasher.init(_seed:)();
}

void sub_1000545C8(Swift::UInt a1)
{
}

Swift::Int sub_1000545D8()
{
  return Hasher._finalize()();
}

uint64_t sub_1000545E8()
{
  return dispatch thunk of Decoder.codingPath.getter();
}

uint64_t sub_1000545F8()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t sub_100054608()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100054618()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return _CGDataProviderCopyData(provider);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return _CGImageGetBitmapInfo(image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return _CGImageGetBitsPerComponent(image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return _CGImageGetBytesPerRow(image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return _CGImageGetDataProvider(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  CGPoint v4 = _CGPointApplyAffineTransform(point, t);
  double y = v4.y;
  double x = v4.x;
  result.double y = y;
  result.double x = x;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t DeviceSupportsVFX()
{
  return _DeviceSupportsVFX();
}

uint64_t INIntentWithTypedIntent()
{
  return _INIntentWithTypedIntent();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t WCCountryCodeEstimate()
{
  return _WCCountryCodeEstimate();
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

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
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