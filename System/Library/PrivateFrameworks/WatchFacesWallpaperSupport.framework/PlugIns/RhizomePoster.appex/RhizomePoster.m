void sub_100002894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000028AC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10004BBF8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000029F0;
    v3[4] = &unk_100044EC0;
    v3[5] = v3;
    long long v4 = off_100044EA8;
    uint64_t v5 = 0;
    qword_10004BBF8 = _sl_dlopen();
    if (!qword_10004BBF8)
    {
      abort_report_np();
LABEL_8:
      sub_10003A408();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NTKFontLoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10004BBF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000029F0()
{
  uint64_t result = _sl_dlopen();
  qword_10004BBF8 = result;
  return result;
}

uint64_t sub_100002A64(uint64_t a1)
{
  return sub_100002AC4(a1, qword_10004D080);
}

uint64_t sub_100002A84(uint64_t a1)
{
  return sub_100002AC4(a1, qword_10004D098);
}

uint64_t sub_100002AA8(uint64_t a1)
{
  return sub_100002AC4(a1, qword_10004D0B0);
}

uint64_t sub_100002AC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10003A5F0();
  sub_1000031F8(v3, a2);
  sub_10000325C(v3, (uint64_t)a2);
  return sub_10003A5E0();
}

uint64_t sub_100002B3C@<X0>(uint64_t *a1@<X8>)
{
  sub_10003A670();
  swift_allocObject();
  sub_10003A680();
  sub_10003A640();
  swift_allocObject();
  swift_retain();
  sub_10003A650();
  sub_10000316C(&qword_10004AD90);
  sub_10003A4A0();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10003B800;
  sub_1000031B0(&qword_10004AD98, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_10003A490();
  sub_1000031B0(&qword_10004ADA0, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_10003A490();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100002D64()
{
  return sub_100002D94((uint64_t (*)(void))type metadata accessor for RhizomePosterRenderer);
}

id sub_100002D7C()
{
  return sub_100002D94((uint64_t (*)(void))type metadata accessor for RhizomePosterEditor);
}

id sub_100002D94(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_100002DD8()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002F10()
{
  unint64_t result = qword_10004AD40;
  if (!qword_10004AD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004AD40);
  }
  return result;
}

uint64_t sub_100002F64(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for CTFontDescriptor(uint64_t a1)
{
}

void type metadata accessor for CFNumber(uint64_t a1)
{
}

__n128 initializeWithTake for RhizomeLayeredFlowerViewConfiguration(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_100002FF8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003018(uint64_t result, int a2, int a3)
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

uint64_t initializeBufferWithCopyOfBuffer for RhizomeShapeLayerConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for RhizomeFlower(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003094(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000030B4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for PosterExtension()
{
  return &type metadata for PosterExtension;
}

void sub_100003118(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_100003124@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_100003134()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10000316C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000031B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_1000031F8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000325C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003294()
{
  uint64_t v0 = sub_10003A6F0();
  uint64_t v2 = v1;
  if (v0 == sub_10003A6F0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10003AC40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100003320@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003A6F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGPath(uint64_t a1)
{
}

uint64_t sub_100003360()
{
  return sub_100003394(&qword_10004AE10);
}

uint64_t sub_100003394(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002F64(&qword_10004AD50);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

void sub_1000033F0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for RhizomeFlowerLayerLevel(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RhizomeFlowerLayerLevel(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RhizomeFlowerLayerLevel(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000035ACLL);
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

uint64_t sub_1000035D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000035DC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RhizomeFlowerLayerLevel()
{
  return &type metadata for RhizomeFlowerLayerLevel;
}

unint64_t sub_1000035F8()
{
  unint64_t result = qword_10004AE20;
  if (!qword_10004AE20)
  {
    sub_100002F64(&qword_10004AE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004AE20);
  }
  return result;
}

uint64_t sub_100003654(char a1)
{
  return *(void *)&aBackgroumiddle[8 * a1];
}

uint64_t sub_100003674(char *a1, char *a2)
{
  return sub_100003B4C(*a1, *a2);
}

uint64_t sub_100003680(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000010003CFB0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x7468676952;
      break;
    case 2:
      unint64_t v3 = 0xE200000000000000;
      unint64_t v5 = 28757;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1853321028;
      break;
    case 4:
      break;
    case 5:
      unint64_t v5 = 0xD000000000000011;
      unsigned int v6 = "Diagonal Up Right";
      goto LABEL_9;
    case 6:
      unint64_t v5 = 0xD000000000000012;
      unsigned int v6 = "Diagonal Down Left";
      goto LABEL_9;
    case 7:
      unint64_t v5 = 0xD000000000000013;
      unsigned int v6 = "Diagonal Down Right";
LABEL_9:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1952867660;
      break;
  }
  unint64_t v7 = 0x800000010003CFB0;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE500000000000000;
      unint64_t v2 = 0x7468676952;
      break;
    case 2:
      unint64_t v7 = 0xE200000000000000;
      unint64_t v2 = 28757;
      break;
    case 3:
      unint64_t v7 = 0xE400000000000000;
      unint64_t v2 = 1853321028;
      break;
    case 4:
      break;
    case 5:
      unint64_t v2 = 0xD000000000000011;
      int v8 = "Diagonal Up Right";
      goto LABEL_18;
    case 6:
      unint64_t v2 = 0xD000000000000012;
      int v8 = "Diagonal Down Left";
      goto LABEL_18;
    case 7:
      unint64_t v2 = 0xD000000000000013;
      int v8 = "Diagonal Down Right";
LABEL_18:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v7 = 0xE400000000000000;
      unint64_t v2 = 1952867660;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_10003AC40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_10000387C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1819047270;
  }
  else {
    uint64_t v3 = 0x73736572706D6F63;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006465;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1819047270;
  }
  else {
    uint64_t v5 = 0x73736572706D6F63;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xEA00000000006465;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10003AC40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_10000391C(char a1, char a2)
{
  if (*(void *)&aUnity_0[8 * a1] == *(void *)&aUnity_0[8 * a2] && qword_10003BAF0[a1] == qword_10003BAF0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_10003AC40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1000039A4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000010003D070;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xE900000000000079;
      unint64_t v5 = 0x6C694C20616C6143;
      break;
    case 3:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x646C6F676972614DLL;
      break;
    default:
      unint64_t v3 = 0xED00007973696144;
      unint64_t v5 = 0x206E616369726641;
      break;
  }
  unint64_t v6 = 0x800000010003D070;
  switch(a2)
  {
    case 1:
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xE900000000000079;
      unint64_t v2 = 0x6C694C20616C6143;
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x646C6F676972614DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xED00007973696144;
      if (v5 != 0x206E616369726641) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_10003AC40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100003B4C(char a1, char a2)
{
  if (*(void *)&aBackgroumiddle[8 * a1] == *(void *)&aBackgroumiddle[8 * a2]
    && *(void *)&aBackgroumiddle[8 * a1 + 24] == *(void *)&aBackgroumiddle[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10003AC40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_100003BD4()
{
  return sub_100003BDC();
}

Swift::Int sub_100003BDC()
{
  return sub_10003ACD0();
}

Swift::Int sub_100003C48()
{
  return sub_10003ACD0();
}

Swift::Int sub_100003CC8()
{
  return sub_10003ACD0();
}

uint64_t sub_100003D34()
{
  return sub_100003F04();
}

uint64_t sub_100003D3C()
{
  sub_10003A730();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100003E48()
{
  sub_10003A730();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100003EB0()
{
  sub_10003A730();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100003F04()
{
  sub_10003A730();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003F58()
{
  return sub_100003F60();
}

Swift::Int sub_100003F60()
{
  return sub_10003ACD0();
}

Swift::Int sub_100003FC8()
{
  return sub_10003ACD0();
}

Swift::Int sub_100004030()
{
  return sub_10003ACD0();
}

Swift::Int sub_1000040AC()
{
  return sub_10003ACD0();
}

uint64_t sub_1000041D4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100004864(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100004204@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003654(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100004230(void *a1@<X8>)
{
  *a1 = &off_100045058;
}

unint64_t sub_100004244()
{
  unint64_t result = qword_10004AE30;
  if (!qword_10004AE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004AE30);
  }
  return result;
}

void *sub_100004298(char a1, char a2, char a3)
{
  Swift::Int v5 = sub_1000044A8(a3);
  int v6 = 1;
  int v7 = 0;
  switch(a2)
  {
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_3;
    case 17:
      break;
    default:
      int v6 = sub_10003AC40();
LABEL_3:
      swift_bridgeObjectRelease();
      int v7 = v6;
      break;
  }
  if (a1)
  {
    int v8 = sub_10003AC40();
    swift_bridgeObjectRelease();
    if (((v8 | v7) & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100004594(0x19u);
LABEL_9:
  char v9 = sub_10001B3BC(v5);
  swift_bridgeObjectRelease();
  return v9;
}

Swift::Int sub_1000044A8(char a1)
{
  return sub_1000048B0((uint64_t)(&off_100045BA8)[a1]);
}

void *sub_1000044BC(char a1, char a2, char a3)
{
  char v3 = sub_100004298(a1, a2, a3);
  uint64_t v4 = v3[2];
  if (v4)
  {
    sub_10003AAE0();
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v5 + 1;
      sub_10003506C(*((unsigned char *)v3 + v5 + 32));
      sub_10003AAC0();
      sub_10003AAF0();
      sub_10003AB00();
      sub_10003AAD0();
      uint64_t v5 = v6;
    }
    while (v4 != v6);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100004594(unsigned __int8 a1)
{
  uint64_t v3 = *v1;
  sub_10003AC90();
  sub_10003ACA0(a1);
  Swift::Int v4 = sub_10003ACD0();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 27;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(unsigned __int8 *)(v7 + v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        return 27;
      }
    }
    while (*(unsigned __int8 *)(v7 + v6) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v13 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100015BB0();
    uint64_t v10 = v13;
  }
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 + 48) + v6);
  sub_1000046B8(v6);
  *uint64_t v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_1000046B8(unint64_t result)
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
    uint64_t v8 = sub_10003A980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::UInt v10 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v6);
        sub_10003AC90();
        sub_10003ACA0(v10);
        unint64_t v11 = sub_10003ACD0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (unsigned char *)(v12 + v2);
          v14 = (unsigned char *)(v12 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    unint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_100004864(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100044FF0;
  v6._object = a2;
  unint64_t v4 = sub_10003ABF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

Swift::Int sub_1000048B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000316C(&qword_10004AE38);
    uint64_t v3 = sub_10003AA50();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      Swift::UInt v7 = *(unsigned __int8 *)(v6 + v4);
      sub_10003AC90();
      sub_10003ACA0(v7);
      Swift::Int result = sub_10003ACD0();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(unsigned __int8 *)(v14 + v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(unsigned __int8 *)(v14 + v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(unsigned char *)(v14 + v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_1000049F4(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6C694C20616C6143;
      break;
    case 3:
      unint64_t result = 0x646C6F676972614DLL;
      break;
    default:
      unint64_t result = 0x206E616369726641;
      break;
  }
  return result;
}

uint64_t sub_100004A9C(unsigned __int8 *a1, char *a2)
{
  return sub_1000039A4(*a1, *a2);
}

unint64_t sub_100004AA8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000049F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_100004CC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FlowerBlurringLayer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FlowerBlurringLayer()
{
  return self;
}

void *sub_100004D2C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004D70(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *initializeBufferWithCopyOfBuffer for RhizomeLayeredFlowerViewConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RhizomeLayeredFlowerViewConfiguration()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RhizomeLayeredFlowerViewConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for RhizomeLayeredFlowerViewConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomeLayeredFlowerViewConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RhizomeLayeredFlowerViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeLayeredFlowerViewConfiguration()
{
  return &type metadata for RhizomeLayeredFlowerViewConfiguration;
}

void *sub_100004F0C(unsigned __int8 *a1, char a2, char a3)
{
  uint64_t v3 = *((void *)a1 + 9);
  if (!*(void *)(v3 + 16)) {
    return 0;
  }
  unint64_t v7 = sub_100018114(0);
  if ((v8 & 1) == 0 || !*(void *)(v3 + 16)) {
    return 0;
  }
  id v9 = *(id *)(*(void *)(v3 + 56) + 8 * v7);
  unint64_t v10 = sub_100018114(2);
  if ((v11 & 1) == 0)
  {

    return 0;
  }
  uint64_t v12 = a2 & 1;
  uint64_t v13 = *(void **)(*(void *)(v3 + 56) + 8 * v10);
  uint64_t v14 = *a1;
  uint64_t v15 = (void *)*((void *)a1 + 1);
  uint64_t v16 = (void *)*((void *)a1 + 2);
  BOOL v17 = (void *)*((void *)a1 + 3);
  double v18 = 1.5;
  if ((a3 & 1) == 0) {
    double v18 = 3.0;
  }
  if (a2) {
    double v19 = v18;
  }
  else {
    double v19 = 0.0;
  }
  uint64_t v21 = *((void *)a1 + 7);
  uint64_t v20 = *((void *)a1 + 8);
  LOBYTE(v72) = *a1;
  *(_WORD *)((char *)&v72 + 1) = a2 & 1;
  *((void *)&v72 + 1) = v9;
  v73 = v15;
  double v74 = v19;
  uint64_t v75 = v21;
  uint64_t v76 = v20;
  LOBYTE(v67) = v14;
  BYTE1(v67) = a2 & 1;
  BYTE2(v67) = 2;
  *((void *)&v67 + 1) = v13;
  v68 = v17;
  double v69 = v19;
  uint64_t v70 = v21;
  uint64_t v71 = v20;
  v22 = *(void **)(v3 + 16);
  id v23 = v15;
  id v24 = v17;
  id v25 = v23;
  id v26 = v24;
  id v27 = v13;
  id v28 = v16;
  id v29 = v9;
  id v30 = v25;
  id v31 = v26;
  id v32 = v28;
  id v33 = v27;
  if (!v22)
  {
    uint64_t v59 = 0;
    v36 = 0;
LABEL_18:
    double v37 = 0.0;
    uint64_t v61 = 0;
    uint64_t v38 = 0;
    goto LABEL_19;
  }
  unint64_t v34 = sub_100018114(1);
  if ((v35 & 1) == 0)
  {
    uint64_t v59 = 0;
    v36 = 0;
    v22 = 0;
    goto LABEL_18;
  }
  v36 = *(void **)(*(void *)(v3 + 56) + 8 * v34);
  uint64_t v59 = v14 | (v12 << 8) | 0x10000;
  double v37 = v19;
  uint64_t v61 = v21;
  uint64_t v38 = v20;
  id v39 = v32;
  id v40 = v36;
  v22 = v32;
LABEL_19:
  id v43 = v29;
  id v44 = v30;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100019A18(&v72, 0, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  id v46 = v33;
  id v60 = v31;
  char v47 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v62 = &_swiftEmptyDictionarySingleton;
  sub_100019A18(&v67, 2, v47);
  v41 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  if (v36)
  {
    LOWORD(v62) = v59 & 0x1FF;
    BYTE2(v62) = BYTE2(v59);
    *((void *)&v62 + 1) = v36;
    v63 = v22;
    double v64 = v37;
    uint64_t v65 = v61;
    uint64_t v66 = v38;
    id v48 = v36;
    v57 = v36;
    id v49 = v44;
    id v50 = v48;
    v58 = v43;
    id v43 = v32;
    id v51 = v22;
    id v52 = v50;
    v53 = v49;
    id v54 = v51;
    char v55 = swift_isUniquelyReferenced_nonNull_native();
    sub_100019A18(&v62, 1, v55);
    swift_bridgeObjectRelease();
    sub_100005648(v59, v57, v22);

    v56 = v60;
    sub_100005648(v59, v57, v22);
  }
  else
  {

    v56 = v60;
    v53 = v43;
  }

  return v41;
}

uint64_t sub_1000052A4(__int16 a1, void *a2, void *a3, void *a4, char a5, double a6)
{
  sub_100007928(0, a1, a2, a3, a4, (uint64_t)v21, a6);
  sub_100005530((uint64_t)v21, (uint64_t)v22);
  if (!*((void *)&v22[0] + 1)) {
    goto LABEL_9;
  }
  char v11 = a5 & 1;
  v23[2] = v22[2];
  v23[3] = v22[3];
  v23[4] = v22[4];
  v23[0] = v22[0];
  v23[1] = v22[1];
  uint64_t v12 = sub_100004F0C((unsigned __int8 *)v23, 0, a5 & 1);
  if (!v12)
  {
    sub_100005598((uint64_t)v21);
    swift_bridgeObjectRelease();

    return 0;
  }
  type metadata accessor for RhizomeLayerSet();
  swift_allocObject();
  uint64_t v13 = sub_100037BB4((uint64_t)v12, 0, v11);
  if (!v13)
  {
    sub_100005598((uint64_t)v21);
LABEL_9:
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_100004F0C((unsigned __int8 *)v23, 1, v11);
  if (v15)
  {
    swift_allocObject();
    uint64_t v16 = sub_100037BB4((uint64_t)v15, 1, v11);
    if (v16)
    {
      uint64_t v17 = v16;
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_100019B84(v14, 0, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_retain();
      char v19 = swift_isUniquelyReferenced_nonNull_native();
      sub_100019B84(v17, 1, v19);
      swift_bridgeObjectRelease();

      sub_100005598((uint64_t)v21);
      swift_release();
      swift_release();
      return *(void *)&a6;
    }
    sub_100005598((uint64_t)v21);
    swift_bridgeObjectRelease();

    swift_release();
    return 0;
  }
  sub_100005598((uint64_t)v21);
  swift_bridgeObjectRelease();

  swift_release();
  return 0;
}

uint64_t sub_100005530(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000316C(&qword_10004AE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005598(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000055E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a2)
  {

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100005648(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
  }
}

uint64_t sub_10000568C()
{
  uint64_t v0 = sub_10003A8A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003A890();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10003A630();
  __chkstk_darwin(v5 - 8);
  sub_1000068A8();
  sub_10003A620();
  v7[1] = _swiftEmptyArrayStorage;
  sub_1000068E8(&qword_10004AF58, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000316C(&qword_10004AF60);
  sub_100006930(&qword_10004AF68, &qword_10004AF60);
  sub_10003A970();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_10003A8D0();
  qword_10004D0C8 = result;
  return result;
}

void sub_1000058CC(__int16 a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  id v54 = a5;
  uint64_t v9 = sub_10003A470();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  sub_100012594(a1 & 0xFF01, a2, a3);
  if (qword_10004AC90 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_10003A5F0();
  uint64_t v17 = sub_10000325C(v16, (uint64_t)qword_10004D0B0);
  id v49 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v50 = v10 + 16;
  v49(v15, a4, v9);
  swift_bridgeObjectRetain_n();
  uint64_t v53 = v17;
  double v18 = sub_10003A5D0();
  os_log_type_t v19 = sub_10003A850();
  BOOL v20 = os_log_type_enabled(v18, v19);
  id v51 = v13;
  uint64_t v52 = v10;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v56[0] = v46;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v47 = a4;
    uint64_t v22 = sub_10003A450();
    *(void *)&v55[0] = sub_10000E014(v22, v23, v56);
    sub_10003A940();
    swift_bridgeObjectRelease();
    id v48 = *(void (**)(char *, uint64_t))(v10 + 8);
    v48(v15, v9);
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_10003A6B0();
    uint64_t v25 = v9;
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    *(void *)&v55[0] = sub_10000E014(v24, v27, v56);
    sub_10003A940();
    swift_bridgeObjectRelease_n();
    uint64_t v9 = v25;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Attempting to store layout dictionary in User Defaults with (uuid=%s): %s", (uint8_t *)v21, 0x16u);
    a4 = v47;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    id v48 = *(void (**)(char *, uint64_t))(v10 + 8);
    v48(v15, v9);

    swift_bridgeObjectRelease_n();
  }
  Class isa = sub_10003A690().super.isa;
  swift_bridgeObjectRelease();
  sub_10003A450();
  NSString v29 = sub_10003A6E0();
  swift_bridgeObjectRelease();
  id v30 = v54;
  [v54 setValue:isa forKey:v29];

  sub_10003A450();
  NSString v31 = sub_10003A6E0();
  swift_bridgeObjectRelease();
  id v32 = [v30 valueForKey:v31];

  if (v32)
  {
    sub_10003A960();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v55, 0, sizeof(v55));
  }
  sub_100006840((uint64_t)v55, (uint64_t)v56);
  if (v56[3])
  {
    sub_10000316C(&qword_10004AF48);
    if (swift_dynamicCast())
    {
      id v33 = v51;
      v49(v51, a4, v9);
      swift_bridgeObjectRetain();
      uint64_t v34 = v9;
      char v35 = sub_10003A5D0();
      os_log_type_t v36 = sub_10003A850();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        v56[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315394;
        uint64_t v38 = sub_10003A450();
        *(void *)&v55[0] = sub_10000E014(v38, v39, v56);
        sub_10003A940();
        swift_bridgeObjectRelease();
        v48(v33, v34);
        *(_WORD *)(v37 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v40 = sub_10003A6B0();
        unint64_t v42 = v41;
        swift_bridgeObjectRelease();
        *(void *)&v55[0] = sub_10000E014(v40, v42, v56);
        sub_10003A940();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "What is saved for this uuid? (uuid=%s) %s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v48(v33, v34);

        swift_bridgeObjectRelease_n();
      }
      return;
    }
  }
  else
  {
    sub_10000775C((uint64_t)v56, &qword_10004B570);
  }
  id v43 = sub_10003A5D0();
  os_log_type_t v44 = sub_10003A860();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Failed to save to user defaults...", v45, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100005FC0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_100006004(void *a1, void *a2)
{
  sub_10003A450();
  NSString v4 = sub_10003A6E0();
  swift_bridgeObjectRelease();
  id v5 = [a2 valueForKey:v4];

  if (v5)
  {
    sub_10003A960();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_100006840((uint64_t)v10, (uint64_t)v11);
  if (v12)
  {
    sub_10000316C(&qword_10004AF48);
    int v6 = swift_dynamicCast();
    uint64_t v7 = v9;
    if (!v6) {
      uint64_t v7 = 0;
    }
  }
  else
  {
    sub_10000775C((uint64_t)v11, &qword_10004B570);
    uint64_t v7 = 0;
  }
  *a1 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000610C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100006134()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for RhizomePosterLayoutManager()
{
  return self;
}

void sub_100006168(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v38 = a4;
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  unsigned int v39 = a1;
  uint64_t v6 = sub_10003A600();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10003A630();
  Class isa = v10[-1].isa;
  os_log_t v43 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10003A470();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v18 = sub_10003A6E0();
  id v19 = [v17 initWithSuiteName:v18];

  if (v19)
  {
    char v35 = v9;
    uint64_t v36 = v7;
    uint64_t v37 = v6;
    if (qword_10004AC98 != -1) {
      swift_once();
    }
    char v20 = v39;
    unsigned int v21 = v39 >> 8;
    uint64_t v34 = qword_10004D0C8;
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v38, v13);
    unint64_t v22 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    unint64_t v23 = (v15 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v24 = swift_allocObject();
    *(unsigned char *)(v24 + 16) = v20 & 1;
    *(unsigned char *)(v24 + 17) = v21;
    uint64_t v25 = v41;
    *(void *)(v24 + 24) = v40;
    *(void *)(v24 + 32) = v25;
    *(double *)(v24 + 40) = a5;
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v24 + v22, v16, v13);
    *(void *)(v24 + v23) = v19;
    aBlock[4] = sub_100006788;
    aBlock[5] = v24;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005FC0;
    aBlock[3] = &unk_100045C78;
    unint64_t v26 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    id v27 = v19;
    sub_10003A610();
    os_log_type_t v44 = _swiftEmptyArrayStorage;
    sub_1000068E8((unint64_t *)&qword_10004AF30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000316C(&qword_10004AF38);
    sub_100006930((unint64_t *)&qword_10004AF40, &qword_10004AF38);
    id v28 = v35;
    uint64_t v29 = v37;
    sub_10003A970();
    sub_10003A8C0();
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v29);
    (*((void (**)(char *, os_log_t))isa + 1))(v12, v43);
    swift_release();
  }
  else
  {
    if (qword_10004AC90 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_10003A5F0();
    sub_10000325C(v30, (uint64_t)qword_10004D0B0);
    os_log_t v43 = (os_log_t)sub_10003A5D0();
    os_log_type_t v31 = sub_10003A860();
    if (os_log_type_enabled(v43, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v31, "Failed to initialize rhizome user defaults...", v32, 2u);
      swift_slowDealloc();
    }
    os_log_t v33 = v43;
  }
}

uint64_t sub_1000066A0()
{
  uint64_t v1 = sub_10003A470();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100006788()
{
  uint64_t v1 = *(void *)(sub_10003A470() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 24);
  unint64_t v4 = *(void *)(v0 + 32);
  __int16 v5 = *(unsigned __int8 *)(v0 + 16) | (*(unsigned __int8 *)(v0 + 17) << 8);
  unint64_t v6 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_1000058CC(v5, v3, v4, v0 + v2, v6);
}

uint64_t sub_100006828(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006838()
{
  return swift_release();
}

uint64_t sub_100006840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000316C(&qword_10004B570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000068A8()
{
  unint64_t result = qword_10004AF50;
  if (!qword_10004AF50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004AF50);
  }
  return result;
}

uint64_t sub_1000068E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006930(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002F64(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006980(uint64_t a1, int a2)
{
  uint64_t v4 = sub_10000316C(&qword_10004AF70);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003A470();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v82 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v82 - v15;
  sub_1000076F4(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000775C((uint64_t)v6, &qword_10004AF70);
    if (qword_10004AC90 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_10003A5F0();
    sub_10000325C(v17, (uint64_t)qword_10004D0B0);
    NSString v18 = sub_10003A5D0();
    os_log_type_t v19 = sub_10003A860();
    if (os_log_type_enabled(v18, v19))
    {
      char v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to load layout dictionary because uuid was nil.", v20, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  LODWORD(v89) = a2;
  unsigned int v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v21(v16, v6, v7);
  id v22 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v23 = sub_10003A6E0();
  id v24 = [v22 initWithSuiteName:v23];

  if (!v24)
  {
    if (qword_10004AC90 == -1)
    {
LABEL_18:
      uint64_t v48 = sub_10003A5F0();
      sub_10000325C(v48, (uint64_t)qword_10004D0B0);
      id v49 = sub_10003A5D0();
      os_log_type_t v50 = sub_10003A860();
      if (os_log_type_enabled(v49, v50))
      {
        id v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed to load rhizome user defaults", v51, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
      return 0;
    }
LABEL_46:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v95 = 0;
  if (qword_10004AC98 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_10004D0C8;
  v91 = v16;
  uint64_t v92 = v8;
  unint64_t v26 = *(NSObject **)(v8 + 16);
  v8 += 16;
  v88 = v26;
  ((void (*)(char *, char *, uint64_t))v26)(v14, v16, v7);
  unint64_t v27 = (*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = &v95;
  *(void *)(v28 + 24) = v24;
  v21((char *)(v28 + v27), v14, v7);
  uint64_t v29 = v28;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = sub_100007884;
  *(void *)(v30 + 24) = v28;
  aBlock[4] = (uint64_t)sub_1000078F8;
  aBlock[5] = v30;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000610C;
  aBlock[3] = (uint64_t)&unk_100045CF0;
  os_log_type_t v31 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v16 = (char *)v24;
  swift_release();
  dispatch_sync(v25, v31);
  _Block_release(v31);
  LOBYTE(v31) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v31)
  {
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v32 = v95;
  v90 = v16;
  if (!v95)
  {
    uint64_t v87 = v29;
    id v52 = [v16 dictionaryRepresentation];
    sub_10003A6A0();

    uint64_t v53 = v92;
    if (qword_10004AC90 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_10003A5F0();
    sub_10000325C(v54, (uint64_t)qword_10004D0B0);
    char v55 = v91;
    ((void (*)(char *, char *, uint64_t))v88)(v11, v91, v7);
    swift_bridgeObjectRetain();
    v56 = sub_10003A5D0();
    os_log_type_t v57 = sub_10003A860();
    int v58 = v57;
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v59 = swift_slowAlloc();
      v89 = (char *)swift_slowAlloc();
      aBlock[0] = (uint64_t)v89;
      *(_DWORD *)uint64_t v59 = 136315394;
      v88 = v56;
      uint64_t v60 = sub_10003A450();
      uint64_t v93 = sub_10000E014(v60, v61, aBlock);
      LODWORD(v86) = v58;
      sub_10003A940();
      swift_bridgeObjectRelease();
      uint64_t v92 = *(void *)(v53 + 8);
      ((void (*)(char *, uint64_t))v92)(v11, v7);
      *(_WORD *)(v59 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_10003A6B0();
      unint64_t v64 = v63;
      swift_bridgeObjectRelease();
      uint64_t v93 = sub_10000E014(v62, v64, aBlock);
      sub_10003A940();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v65 = v88;
      _os_log_impl((void *)&_mh_execute_header, v88, (os_log_type_t)v86, "Failed to load layout dictionary for uuid %s and defaults was %s", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v92)(v55, v7);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v79 = *(void (**)(char *, uint64_t))(v53 + 8);
      v79(v11, v7);

      v79(v55, v7);
    }
    goto LABEL_41;
  }
  swift_bridgeObjectRetain_n();
  v88 = sub_10001E678(v32);
  if (!v34)
  {
    if (qword_10004AC90 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_10003A5F0();
    sub_10000325C(v66, (uint64_t)qword_10004D0B0);
    swift_bridgeObjectRetain();
    long long v67 = sub_10003A5D0();
    os_log_type_t v68 = sub_10003A850();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 136315138;
      v88 = (v69 + 4);
      swift_bridgeObjectRetain();
      v89 = (char *)&type metadata for Any + 8;
      uint64_t v70 = sub_10003A6B0();
      unint64_t v72 = v71;
      swift_bridgeObjectRelease();
      uint64_t v93 = sub_10000E014(v70, v72, aBlock);
      sub_10003A940();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "Failed to initialize poster layout dict from dictionary %s", (uint8_t *)v69, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v7);
LABEL_41:
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v35 = v33;
  unint64_t v36 = v34;
  if (qword_10004AC90 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_10003A5F0();
  uint64_t v38 = sub_10000325C(v37, (uint64_t)qword_10004D0B0);
  swift_bridgeObjectRetain();
  unsigned int v39 = sub_10003A5D0();
  os_log_type_t v40 = sub_10003A850();
  int v41 = v40;
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v42 = swift_slowAlloc();
    int v85 = v41;
    os_log_t v43 = (uint8_t *)v42;
    aBlock[0] = swift_slowAlloc();
    uint64_t v86 = v38;
    v83 = v43;
    os_log_t v84 = v39;
    *(_DWORD *)os_log_t v43 = 136315138;
    v82[1] = v43 + 4;
    swift_bridgeObjectRetain();
    v82[2] = (char *)&type metadata for Any + 8;
    uint64_t v44 = sub_10003A6B0();
    uint64_t v87 = v29;
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v93 = sub_10000E014(v44, v46, aBlock);
    sub_10003A940();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v47 = v84;
    _os_log_impl((void *)&_mh_execute_header, v84, (os_log_type_t)v85, "Successfully loaded layout dict %s", v83, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v73 = v89;
  if (v89 != 5)
  {
    if ((sub_10000391C((char)v89, SBYTE1(v88)) & 1) == 0)
    {
      unsigned __int16 v81 = sub_1000128E4((void *)v73, (unsigned __int16)v88 & 0xFF01, v35, v36);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v7);
      uint64_t v78 = v81 & 0xFF01;
      swift_release();
      swift_bridgeObjectRelease();
      return v78;
    }
    double v74 = sub_10003A5D0();
    os_log_type_t v75 = sub_10003A850();
    if (!os_log_type_enabled(v74, v75)) {
      goto LABEL_37;
    }
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v76 = 0;
    v77 = "Returning existing loaded layout because override colorway was the same as saved layout colorway.";
    goto LABEL_36;
  }
  double v74 = sub_10003A5D0();
  os_log_type_t v75 = sub_10003A850();
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v76 = 0;
    v77 = "Returning existing saved layout because no override colorway was provided";
LABEL_36:
    _os_log_impl((void *)&_mh_execute_header, v74, v75, v77, v76, 2u);
    swift_slowDealloc();
  }
LABEL_37:

  (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v7);
  uint64_t v78 = (unsigned __int16)v88 & 0xFF01;
  swift_release();
  swift_bridgeObjectRelease();
  return v78;
}

uint64_t sub_1000076F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000316C(&qword_10004AF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000775C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000316C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000077B8()
{
  uint64_t v1 = sub_10003A470();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100007884()
{
  sub_10003A470();
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  return sub_100006004(v1, v2);
}

uint64_t sub_1000078E8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000078F8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100007928(const __CTFont *a1@<X0>, __int16 a2@<W1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v14 = a1;
  if (!a1)
  {
    id v15 = [self rhizomeFontDescriptor];
    if (!v15)
    {
      uint64_t v91 = 0;
      id v86 = 0;
      id v87 = 0;
      id v88 = 0;
      uint64_t v90 = 0;
      CGFloat v57 = 0.0;
      a7 = 0.0;
      double width = 0.0;
      double height = 0.0;
      goto LABEL_89;
    }
    uint64_t v14 = (const __CTFont *)[self fontWithDescriptor:v15 size:a7];
  }
  v100 = a3;
  v101 = a4;
  v102 = a5;
  uint64_t v104 = a6;
  uint64_t v16 = a1;
  uint64_t v17 = sub_100038090(a2);
  uint64_t v19 = HIBYTE(v18) & 0xF;
  uint64_t v107 = v17;
  unint64_t v108 = v18;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v19 = v17 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v109 = 0;
  uint64_t v110 = v19;
  uint64_t v20 = sub_10003A750();
  unsigned __int8 v22 = a2;
  unsigned __int16 v103 = a2;
  if (v21 == 0.0)
  {
    double height = 0.0;
    CGFloat a = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
    double width = 0.0;
    goto LABEL_41;
  }
  uint64_t v23 = v20;
  CGFloat v24 = v21;
  unint64_t v25 = 0;
  uint64_t v26 = (char)v22;
  CGFloat a = COERCE_DOUBLE(&_swiftEmptyDictionarySingleton);
  double width = 0.0;
  uint64_t v94 = v22;
  double height = 0.0;
  do
  {
    unint64_t v30 = v25;
    while (1)
    {
      unint64_t v25 = v30 + 1;
      if (__OFADD__(v30, 1))
      {
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
      }
      *(void *)&transform.CGFloat a = qword_10003BC28[v26];
      v111._countAndFlagsBits = sub_10003AC20();
      *(void *)&transform.CGFloat a = 812872494;
      transform.CGFloat b = -4.94660803e173;
      sub_10003A740(v111);
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void *)&transform.a;
      CGFloat b = transform.b;
      *(void *)&transform.CGFloat a = v23;
      transform.CGFloat b = v24;
      swift_bridgeObjectRetain();
      v112._countAndFlagsBits = v33;
      *(CGFloat *)&v112._object = b;
      sub_10003A740(v112);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v35 = (__CFString *)sub_10003A6E0();
      swift_bridgeObjectRelease();
      CGGlyph GlyphWithName = CTFontGetGlyphWithName(v14, v35);

      CGAffineTransformMakeScale(&v105, 1.0, -1.0);
      CGAffineTransform transform = v105;
      PathForGlyph = CTFontCreatePathForGlyph(v14, GlyphWithName, 0);
      if (!PathForGlyph) {
        goto LABEL_11;
      }
      uint64_t v38 = PathForGlyph;
      CGPathRef v39 = CGPathCreateCopyByTransformingPath(PathForGlyph, &transform);
      if (v39) {
        break;
      }
      CGPathRef v31 = v38;
LABEL_10:

LABEL_11:
      uint64_t v23 = sub_10003A750();
      CGFloat v24 = v32;
      ++v30;
      if (v32 == 0.0) {
        goto LABEL_41;
      }
    }
    CGPathRef v31 = v39;
    if (v30 >= 3)
    {

      goto LABEL_10;
    }
    if (v30)
    {
      if (v30 == 1)
      {
        switch(v94)
        {
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
            swift_bridgeObjectRelease();
            char v40 = 1;
            break;
          default:
            char v41 = sub_10003AC40();
            swift_bridgeObjectRelease();
            if (v41) {
              char v40 = 1;
            }
            else {
              char v40 = 2;
            }
            break;
        }
      }
      else
      {
        char v40 = 2;
      }
    }
    else
    {
      char v40 = 0;
    }
    CGRect PathBoundingBox = CGPathGetPathBoundingBox(v38);
    if (width <= PathBoundingBox.size.width) {
      double width = PathBoundingBox.size.width;
    }
    if (height <= PathBoundingBox.size.height) {
      double height = PathBoundingBox.size.height;
    }
    id v42 = [self bezierPathWithCGPath:v31];
    if (v42)
    {
      uint64_t v43 = (uint64_t)v42;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v105.CGFloat a = a;
      sub_1000198E0(v43, v40, isUniquelyReferenced_nonNull_native);
      CGFloat a = v105.a;

      goto LABEL_36;
    }
    swift_bridgeObjectRetain();
    unint64_t v45 = sub_100018114(v40);
    char v47 = v46;
    swift_bridgeObjectRelease();
    if (v47)
    {
      char v48 = swift_isUniquelyReferenced_nonNull_native();
      v105.CGFloat a = a;
      if ((v48 & 1) == 0)
      {
        sub_10001A714();
        CGFloat a = v105.a;
      }
      id v49 = *(void **)(*(void *)(*(void *)&a + 56) + 8 * v45);
      sub_100008474(v45, *(uint64_t *)&a);

LABEL_36:
      swift_bridgeObjectRelease();
    }
    else
    {
    }
    uint64_t v23 = sub_10003A750();
    CGFloat v24 = v50;
  }
  while (v50 != 0.0);
LABEL_41:
  swift_bridgeObjectRelease();
  uint64_t v51 = *(void *)&a + 64;
  uint64_t v52 = 1 << *(unsigned char *)(*(void *)&a + 32);
  uint64_t v53 = -1;
  if (v52 < 64) {
    uint64_t v53 = ~(-1 << v52);
  }
  unint64_t v54 = v53 & *(void *)(*(void *)&a + 64);
  int64_t v55 = (unint64_t)(v52 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v56 = 0;
  CGFloat v57 = a;
  while (2)
  {
    if (v54)
    {
      unint64_t v58 = __clz(__rbit64(v54));
      v54 &= v54 - 1;
      unint64_t v59 = v58 | (v56 << 6);
      goto LABEL_64;
    }
    int64_t v60 = v56 + 1;
    if (__OFADD__(v56, 1)) {
      goto LABEL_92;
    }
    if (v60 < v55)
    {
      unint64_t v61 = *(void *)(v51 + 8 * v60);
      ++v56;
      if (!v61)
      {
        int64_t v56 = v60 + 1;
        if (v60 + 1 >= v55) {
          break;
        }
        unint64_t v61 = *(void *)(v51 + 8 * v56);
        if (!v61)
        {
          int64_t v56 = v60 + 2;
          if (v60 + 2 >= v55) {
            break;
          }
          unint64_t v61 = *(void *)(v51 + 8 * v56);
          if (!v61)
          {
            int64_t v56 = v60 + 3;
            if (v60 + 3 >= v55) {
              break;
            }
            unint64_t v61 = *(void *)(v51 + 8 * v56);
            if (!v61)
            {
              int64_t v56 = v60 + 4;
              if (v60 + 4 >= v55) {
                break;
              }
              unint64_t v61 = *(void *)(v51 + 8 * v56);
              if (!v61)
              {
                int64_t v62 = v60 + 5;
                if (v62 >= v55) {
                  break;
                }
                unint64_t v61 = *(void *)(v51 + 8 * v62);
                if (!v61)
                {
                  while (1)
                  {
                    int64_t v56 = v62 + 1;
                    if (__OFADD__(v62, 1)) {
                      goto LABEL_93;
                    }
                    if (v56 >= v55) {
                      goto LABEL_88;
                    }
                    unint64_t v61 = *(void *)(v51 + 8 * v56);
                    ++v62;
                    if (v61) {
                      goto LABEL_63;
                    }
                  }
                }
                int64_t v56 = v62;
              }
            }
          }
        }
      }
LABEL_63:
      unint64_t v54 = (v61 - 1) & v61;
      unint64_t v59 = __clz(__rbit64(v61)) + (v56 << 6);
LABEL_64:
      char v63 = *(unsigned char *)(*(void *)(*(void *)&a + 48) + v59);
      CGAffineTransformMakeTranslation(&v105, width * 0.5, height * 0.5);
      CGAffineTransform transform = v105;
      if (!*(void *)(*(void *)&v57 + 16)) {
        continue;
      }
      unint64_t v64 = sub_100018114(v63);
      if ((v65 & 1) == 0) {
        continue;
      }
      uint64_t v66 = (const CGPath *)objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(*(void *)&v57 + 56)
                                                                                  + 8 * v64), "CGPath"));
      if (!v66) {
        continue;
      }
      long long v67 = v66;
      CGPathRef v68 = CGPathCreateCopyByTransformingPath(v66, &transform);
      if (!v68)
      {

        continue;
      }
      CGPathRef v69 = v68;
      id v70 = [self bezierPathWithCGPath:v68];
      if (v70)
      {
        id v98 = v70;
        char v95 = swift_isUniquelyReferenced_nonNull_native();
        v105.CGFloat a = v57;
        unint64_t v72 = sub_100018114(v63);
        uint64_t v73 = *(void *)(*(void *)&v57 + 16);
        BOOL v74 = (v71 & 1) == 0;
        uint64_t v75 = v73 + v74;
        if (__OFADD__(v73, v74)) {
          goto LABEL_94;
        }
        if (*(void *)(*(void *)&v57 + 24) >= v75)
        {
          if (v95)
          {
            CGFloat v57 = v105.a;
            if ((v71 & 1) == 0) {
              goto LABEL_84;
            }
          }
          else
          {
            unint64_t v97 = v72;
            char v93 = v71;
            sub_10001A714();
            unint64_t v72 = v97;
            CGFloat v57 = v105.a;
            if ((v93 & 1) == 0) {
              goto LABEL_84;
            }
          }
        }
        else
        {
          char v92 = v71;
          sub_1000183B8(v75, v95);
          unint64_t v76 = sub_100018114(v63);
          if ((v92 & 1) != (v77 & 1))
          {
            sub_10003AC60();
            __break(1u);
            JUMPOUT(0x1000081D8);
          }
          unint64_t v72 = v76;
          CGFloat v57 = v105.a;
          if ((v92 & 1) == 0)
          {
LABEL_84:
            *(void *)(*(void *)&v57 + 8 * (v72 >> 6) + 64) |= 1 << v72;
            *(unsigned char *)(*(void *)(*(void *)&v57 + 48) + v72) = v63;
            *(void *)(*(void *)(*(void *)&v57 + 56) + 8 * v72) = v98;
            uint64_t v83 = *(void *)(*(void *)&v57 + 16);
            BOOL v84 = __OFADD__(v83, 1);
            uint64_t v85 = v83 + 1;
            if (v84) {
              goto LABEL_95;
            }
            *(void *)(*(void *)&v57 + 16) = v85;
LABEL_86:

LABEL_87:
            swift_bridgeObjectRelease();
            continue;
          }
        }
        uint64_t v96 = *(void *)(*(void *)&v57 + 56);
        uint64_t v82 = 8 * v72;

        *(void *)(v96 + v82) = v98;
        goto LABEL_86;
      }
      swift_bridgeObjectRetain();
      unint64_t v99 = sub_100018114(v63);
      char v79 = v78;
      swift_bridgeObjectRelease();
      if ((v79 & 1) == 0)
      {

        continue;
      }
      char v80 = swift_isUniquelyReferenced_nonNull_native();
      v105.CGFloat a = v57;
      if ((v80 & 1) == 0)
      {
        sub_10001A714();
        CGFloat v57 = v105.a;
      }
      unsigned __int16 v81 = *(void **)(*(void *)(*(void *)&v57 + 56) + 8 * v99);
      sub_100008474(v99, *(uint64_t *)&v57);

      goto LABEL_87;
    }
    break;
  }
LABEL_88:
  swift_release();
  id v86 = v100;
  id v87 = v101;
  id v88 = v102;
  id v15 = (id)sub_100038090(v103);
  uint64_t v90 = v89;

  uint64_t v91 = v103;
  a6 = v104;
LABEL_89:
  *(void *)a6 = v91;
  *(void *)(a6 + 8) = v86;
  *(void *)(a6 + 16) = v87;
  *(void *)(a6 + 24) = v88;
  *(void *)(a6 + 32) = v15;
  *(void *)(a6 + 40) = v90;
  *(double *)(a6 + 48) = a7;
  *(double *)(a6 + 56) = width;
  *(double *)(a6 + 64) = height;
  *(CGFloat *)(a6 + 72) = v57;
}

uint64_t sub_10000821C()
{
  v8._countAndFlagsBits = sub_10002D270(*(unsigned char *)v0, *(unsigned char *)(v0 + 1));
  v7._countAndFlagsBits = 91;
  v7._object = (void *)0xE100000000000000;
  sub_10003A740(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = 2236460;
  v9._object = (void *)0xE300000000000000;
  sub_10003A740(v9);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v1;
  v10._object = v2;
  sub_10003A740(v10);
  swift_bridgeObjectRelease();
  sub_10003AA60(22);
  swift_bridgeObjectRelease();
  strcpy((char *)&v7, "\", pointSize=");
  HIWORD(v7._object) = -4864;
  v11._countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x3D657A6973202CLL;
  v12._object = (void *)0xE700000000000000;
  sub_10003A740(v12);
  swift_bridgeObjectRetain();
  sub_10003A740(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for CGSize(0);
  uint64_t v3 = sub_10003A700();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v3;
  v13._object = v5;
  sub_10003A740(v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = sub_10003AC20();
  sub_10003A740(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 93;
  v15._object = (void *)0xE100000000000000;
  sub_10003A740(v15);
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 0x3D7368746170202CLL;
  v16._object = (void *)0xE800000000000000;
  sub_10003A740(v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 91;
}

unint64_t sub_100008474(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10003A980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10003AC90();
        sub_10003A730();
        swift_bridgeObjectRelease();
        uint64_t result = sub_10003ACD0();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          Swift::String v11 = (unsigned char *)(v10 + v3);
          Swift::String v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *Swift::String v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          Swift::String v14 = (void *)(v13 + 8 * v3);
          Swift::String v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            void *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    Swift::String v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    Swift::String v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *Swift::String v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000865C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10003A980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10003AC90();
        swift_bridgeObjectRetain();
        sub_10003A730();
        Swift::Int v9 = sub_10003ACD0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          Swift::String v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *Swift::String v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          Swift::String v15 = (void *)(v14 + 8 * v3);
          Swift::String v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *Swift::String v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t destroy for RhizomeFlowerDrawInfo(id *a1)
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RhizomeFlowerDrawInfo(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  int64_t v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  unint64_t v6 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  id v8 = v3;
  id v9 = v4;
  id v10 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RhizomeFlowerDrawInfo(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 24);
  uint64_t v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  id v12 = v10;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for RhizomeFlowerDrawInfo(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for RhizomeFlowerDrawInfo(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;

  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomeFlowerDrawInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RhizomeFlowerDrawInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeFlowerDrawInfo()
{
  return &type metadata for RhizomeFlowerDrawInfo;
}

void sub_100008B24()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  uint64_t v2 = 11;
  if (v1 == (id)1) {
    uint64_t v2 = 15;
  }
  qword_10004D0D0 = v2;
}

uint64_t sub_100008B90(unsigned int a1, uint64_t a2, unint64_t a3, uint64_t a4, char *a5, char a6, char a7, char a8, double a9, double a10, double a11, char a12, char a13)
{
  uint64_t v20 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView;
  LODWORD(v115) = BYTE1(a1);
  unsigned int v108 = a1 >> 8;
  id v21 = objc_allocWithZone((Class)UIView);
  uint64_t v22 = v13;
  *(void *)&v13[v20] = [v21 init];
  uint64_t v23 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView;
  *(void *)(v22 + v23) = [objc_allocWithZone((Class)UIView) init];
  uint64_t v24 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView;
  *(void *)(v22 + v24) = [objc_allocWithZone((Class)UIView) init];
  uint64_t v25 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay;
  *(void *)(v22 + v25) = [objc_allocWithZone((Class)UIView) init];
  uint64_t v26 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView;
  *(void *)(v22 + v26) = [objc_allocWithZone((Class)UIView) init];
  *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v27 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldShowShadows;
  *(unsigned char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldShowShadows) = 1;
  uint64_t v28 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_renderShadowsSynchronously;
  *(unsigned char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_renderShadowsSynchronously) = 0;
  *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastWakeProgress) = 0x3FF0000000000000;
  *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockProgress) = 0;
  *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockLandingPlace) = 0;
  *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_orientationAfterUnlock) = 1;
  *(unsigned char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldGenerateNewLayout) = 1;
  *(unsigned char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_needsCleaning) = 0;
  uint64_t v29 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_fadeInTimingFunction;
  *(void *)(v22 + v29) = [self functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  uint64_t v30 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_scaleTimingFunction;
  id v31 = objc_allocWithZone((Class)CAMediaTimingFunction);
  LODWORD(v32) = 1049918177;
  LODWORD(v33) = 1048911544;
  LODWORD(v34) = 1049247089;
  LODWORD(v35) = 1066359849;
  *(void *)(v22 + v30) = [v31 initWithControlPoints:v32 :v33 :v34 :v35];
  *(unsigned char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD) = 0;
  *(unsigned char *)(v22 + v28) = a8;
  qword_10004D0D8 = a4;
  id v36 = [self mainScreen];
  [v36 bounds];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;

  v118.origin.x = v38;
  v118.origin.y = v40;
  v118.size.double width = v42;
  v118.size.double height = v44;
  CGFloat Height = CGRectGetHeight(v118);
  uint64_t v106 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_yMinValueForOverlap;
  *(CGFloat *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_yMinValueForOverlap) = Height * a11;
  *(unsigned char *)(v22 + v27) = a7;
  char v46 = (unsigned __int8 *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout);
  char v47 = a1 & 1;
  *char v46 = a1 & 1;
  v46[1] = v108;
  *((void *)v46 + 1) = a2;
  *((void *)v46 + 2) = a3;
  *((double *)v46 + 3) = a9;
  swift_bridgeObjectRetain_n();
  uint64_t v109 = a2;
  unint64_t v48 = (unint64_t)sub_10000E814(a1 & 0xFFFFFF01, a2, a3, (__int16)v115, a8, a12);
  unint64_t v110 = a3;
  swift_bridgeObjectRelease();
  LODWORD(v28) = *v46;
  uint64_t v50 = *((void *)v46 + 1);
  unint64_t v49 = *((void *)v46 + 2);
  double v51 = *((double *)v46 + 3);
  LODWORD(a3) = v46[1];
  uint64_t v52 = self;
  swift_bridgeObjectRetain();
  id v53 = [v52 currentDevice];
  id v54 = [v53 userInterfaceIdiom];

  int v55 = v28 | (a3 << 8);
  if (v54 == (id)1) {
    __int16 v56 = sub_100014514(a4, v55, v51, v50, v49);
  }
  else {
    __int16 v56 = sub_100014A18(a4, v55, v50, v49);
  }
  __int16 v60 = v56;
  uint64_t v61 = v57;
  uint64_t v62 = v58;
  uint64_t v63 = v59;
  swift_bridgeObjectRelease();
  unint64_t v64 = (char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_unlockedScreenLayout);
  *unint64_t v64 = v60 & 1;
  v64[1] = HIBYTE(v60);
  *((void *)v64 + 1) = v61;
  *((void *)v64 + 2) = v62;
  *((void *)v64 + 3) = v63;
  if ((a13 & 1) == 0)
  {
    p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
    long long v67 = &RhizomeColorCache.ivar_lyt;
    CGPathRef v68 = &RhizomeColorCache.ivar_lyt;
    uint64_t v71 = v109;
    unint64_t v73 = v110;
    char v75 = (char)v115;
    goto LABEL_8;
  }
  uint64_t v65 = a4;
  p_ivar_lyt = (void **)(&RhizomeColorCache + 16);
  long long v67 = (void **)(&RhizomeColorCache + 16);
  CGPathRef v68 = (void **)(&RhizomeColorCache + 16);
  if (qword_10004ACA0 != -1) {
    goto LABEL_28;
  }
  while (1)
  {
    __int16 v69 = sub_100021564((char *)qword_10004D0D0, 1, (int)v115, v65, *(double *)(v22 + v106));
    uint64_t v71 = v70;
    unint64_t v73 = v72;
    a9 = v74;
    swift_bridgeObjectRelease();
    char v75 = HIBYTE(v69);
    char v47 = v69 & 1;
LABEL_8:
    unint64_t v76 = (char *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout);
    *unint64_t v76 = v47;
    v76[1] = v75;
    *((void *)v76 + 1) = v71;
    *((void *)v76 + 2) = v73;
    *((double *)v76 + 3) = a9;
    *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_floatingContainerView) = a5;
    v115 = a5;

    char v77 = (objc_class *)type metadata accessor for RhizomeView();
    v117.receiver = (id)v22;
    v117.super_class = v77;
    id v78 = objc_msgSendSuper2(&v117, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    char v79 = self;
    uint64_t v22 = (uint64_t)v78;
    id v80 = [v79 blackColor];
    [(id)v22 setBackgroundColor:v80];

    unsigned __int16 v81 = (char *)v68[498];
    CGPathRef v68 = &RhizomeColorCache.ivar_lyt;
    [(id)v22 addSubview:*(void *)&v81[v22]];
    id v82 = *(id *)&v81[v22];
    id v83 = [v79 blackColor];
    [v82 setBackgroundColor:v83];

    a5 = (char *)v67[496];
    id v84 = *(id *)&a5[v22];
    long long v67 = &RhizomeColorCache.ivar_lyt;
    id v85 = [v79 clearColor];
    [v84 setBackgroundColor:v85];

    p_ivar_lyt = (void **)p_ivar_lyt[497];
    id v86 = *(void **)((char *)p_ivar_lyt + v22);
    id v87 = [v79 clearColor];
    [v86 setBackgroundColor:v87];

    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_10003AB80();
    }
    else
    {
      uint64_t v65 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    id v114 = v79;
    if (!v65) {
      break;
    }
    if (v65 >= 1)
    {
      uint64_t v88 = 0;
      do
      {
        if ((v48 & 0xC000000000000001) != 0) {
          id v89 = (id)sub_10003AA90();
        }
        else {
          id v89 = *(id *)(v48 + 8 * v88 + 32);
        }
        uint64_t v90 = v89;
        ++v88;
        v116 = v89;
        sub_100009490(&v116, v22, a6 & 1, a7 & 1);
      }
      while (v65 != v88);
      break;
    }
    __break(1u);
LABEL_28:
    swift_once();
  }
  swift_bridgeObjectRelease_n();
  [v115 addSubview:*(void *)&a5[v22]];
  uint64_t v91 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay;
  id v92 = *(id *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay);
  id v93 = [v114 blackColor];
  [v92 setBackgroundColor:v93];

  uint64_t v94 = *(void **)(v22 + v91);
  [v94 setAlpha:0.0];
  [v115 addSubview:v94];
  if ((a13 & 1) == 0) {
    goto LABEL_31;
  }
  uint64_t v95 = *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 8);
  unint64_t v96 = *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 16);
  int v97 = *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 1);
  uint64_t v98 = *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout) | (v97 << 8);
  swift_bridgeObjectRetain();
  unint64_t v99 = (unint64_t)sub_10000E814(v98, v95, v96, v97, 0, 0);
  swift_bridgeObjectRelease();
  if (!(v99 >> 62))
  {
    uint64_t v100 = *(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v100) {
      goto LABEL_20;
    }
LABEL_30:
    swift_bridgeObjectRelease_n();
LABEL_31:
    objc_msgSend(v115, "addSubview:", *(void *)(v22 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView), v106);
    id v105 = *(void **)((char *)p_ivar_lyt + v22);
    [v115 addSubview:v105];

    return v22;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10003AB80();
  uint64_t v100 = result;
  if (!result) {
    goto LABEL_30;
  }
LABEL_20:
  if (v100 >= 1)
  {
    uint64_t v102 = 0;
    do
    {
      if ((v99 & 0xC000000000000001) != 0) {
        id v103 = (id)sub_10003AA90();
      }
      else {
        id v103 = *(id *)(v99 + 8 * v102 + 32);
      }
      uint64_t v104 = v103;
      ++v102;
      v116 = v103;
      sub_100009768(&v116, v22, a6 & 1);
    }
    while (v100 != v102);
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

void sub_100009490(id *a1, uint64_t a2, char a3, char a4)
{
  uint64_t v7 = (char *)*a1;
  if (*((unsigned char *)*a1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle)) {
    id v8 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet;
  }
  else {
    id v8 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet;
  }
  if (*(void *)&v7[*v8])
  {
    swift_retain();
    [v7 bounds];
    objc_msgSend(v7, "setBounds:");
    swift_release();
  }
  else
  {
    objc_msgSend(*a1, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  }
  uint64_t v9 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec;
  uint64_t v10 = *(void *)&v7[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec];
  double v11 = 0.0;
  CGFloat v12 = 0.0;
  if (v10) {
    CGFloat v12 = *(double *)(v10 + 104);
  }
  CGAffineTransformMakeRotation(&v31, v12);
  long long v13 = *(_OWORD *)&v31.a;
  long long v14 = *(_OWORD *)&v31.c;
  long long v15 = *(_OWORD *)&v31.tx;
  switch(qword_10004D0D8)
  {
    case 1:
      break;
    case 2:
      long long v25 = *(_OWORD *)&v31.c;
      long long v27 = *(_OWORD *)&v31.a;
      long long v24 = *(_OWORD *)&v31.tx;
      int v16 = CLKFloatEqualsFloat();
      long long v15 = v24;
      BOOL v17 = v16 == 0;
      double v18 = 3.14159265;
      double v19 = -3.14159265;
      goto LABEL_14;
    case 3:
      double v11 = 1.57079633;
      break;
    case 4:
      long long v25 = *(_OWORD *)&v31.c;
      long long v27 = *(_OWORD *)&v31.a;
      long long v24 = *(_OWORD *)&v31.tx;
      int v20 = CLKFloatEqualsFloat();
      long long v15 = v24;
      BOOL v17 = v20 == 0;
      double v18 = 4.71238898;
      double v19 = -1.57079633;
LABEL_14:
      if (v17) {
        double v11 = v18;
      }
      else {
        double v11 = v19;
      }
      long long v14 = v25;
      long long v13 = v27;
      break;
    default:
      double v11 = 1.0;
      break;
  }
  *(_OWORD *)&v31.CGFloat a = v13;
  *(_OWORD *)&v31.c = v14;
  *(_OWORD *)&v31.CGFloat tx = v15;
  CGAffineTransformRotate(&v30, &v31, v11);
  long long v26 = *(_OWORD *)&v30.c;
  long long v28 = *(_OWORD *)&v30.a;
  CGFloat tx = v30.tx;
  CGFloat ty = v30.ty;
  v29.receiver = v7;
  v29.super_class = (Class)type metadata accessor for RhizomeLayeredFlowerView();
  *(_OWORD *)&v31.CGFloat a = v28;
  *(_OWORD *)&v31.c = v26;
  v31.CGFloat tx = tx;
  v31.CGFloat ty = ty;
  objc_msgSendSuper2(&v29, "setTransform:", &v31);
  sub_1000112A8();
  uint64_t v23 = *(void *)&v7[v9];
  if (v23 && *(unsigned char *)(v23 + 128) == 1 && (a3 & 1) != 0)
  {
    [*(id *)(a2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView) addSubview:v7];
    if (v7[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] == (a4 & 1)) {
      return;
    }
    v7[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = a4 & 1;
    if ((a4 & 1) == 0)
    {
      [*(id *)&v7[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView] removeFromSuperview];
      return;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView), "addSubview:", v7, v24);
    if (v7[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows]) {
      return;
    }
    v7[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = 1;
  }
  sub_100010B80();
}

id sub_100009768(void **a1, uint64_t a2, char a3)
{
  uint64_t v5 = *a1;
  if (*((unsigned char *)*a1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows))
  {
    v5[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = 0;
    [*(id *)&v5[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView] removeFromSuperview];
  }
  v5[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shouldEnableBlurs] = 0;
  char v6 = v5[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle];
  v5[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] = 1;
  if ((v6 & 1) == 0)
  {
    sub_100010CE4();
    sub_100010B80();
  }
  double v7 = 0.0;
  [v5 setAlpha:0.0];
  uint64_t v8 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec;
  uint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec];
  CGFloat v10 = 0.0;
  if (v9) {
    CGFloat v10 = *(double *)(v9 + 104);
  }
  CGAffineTransformMakeRotation(&v31, v10);
  long long v11 = *(_OWORD *)&v31.a;
  long long v12 = *(_OWORD *)&v31.c;
  long long v13 = *(_OWORD *)&v31.tx;
  switch(qword_10004D0D8)
  {
    case 1:
      break;
    case 2:
      long long v25 = *(_OWORD *)&v31.c;
      long long v27 = *(_OWORD *)&v31.a;
      long long v24 = *(_OWORD *)&v31.tx;
      int v14 = CLKFloatEqualsFloat();
      long long v13 = v24;
      BOOL v15 = v14 == 0;
      double v16 = 3.14159265;
      double v17 = -3.14159265;
      goto LABEL_12;
    case 3:
      double v7 = 1.57079633;
      break;
    case 4:
      long long v25 = *(_OWORD *)&v31.c;
      long long v27 = *(_OWORD *)&v31.a;
      long long v24 = *(_OWORD *)&v31.tx;
      int v18 = CLKFloatEqualsFloat();
      long long v13 = v24;
      BOOL v15 = v18 == 0;
      double v16 = 4.71238898;
      double v17 = -1.57079633;
LABEL_12:
      if (v15) {
        double v7 = v16;
      }
      else {
        double v7 = v17;
      }
      long long v12 = v25;
      long long v11 = v27;
      break;
    default:
      double v7 = 1.0;
      break;
  }
  *(_OWORD *)&v31.CGFloat a = v11;
  *(_OWORD *)&v31.c = v12;
  *(_OWORD *)&v31.CGFloat tx = v13;
  CGAffineTransformRotate(&v30, &v31, v7);
  long long v26 = *(_OWORD *)&v30.c;
  long long v28 = *(_OWORD *)&v30.a;
  CGFloat tx = v30.tx;
  CGFloat ty = v30.ty;
  v29.receiver = v5;
  v29.super_class = (Class)type metadata accessor for RhizomeLayeredFlowerView();
  *(_OWORD *)&v31.CGFloat a = v28;
  *(_OWORD *)&v31.c = v26;
  v31.CGFloat tx = tx;
  v31.CGFloat ty = ty;
  objc_msgSendSuper2(&v29, "setTransform:", &v31);
  sub_1000112A8();
  uint64_t v21 = *(void *)&v5[v8];
  if (v21 && *(unsigned char *)(v21 + 128) == 1 && (a3 & 1) != 0) {
    uint64_t v22 = &OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView;
  }
  else {
    uint64_t v22 = &OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView;
  }
  return objc_msgSend(*(id *)(a2 + *v22), "addSubview:", v5, v24);
}

void sub_1000099CC()
{
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for RhizomeView();
  objc_msgSendSuper2(&v10, "layoutSubviews");
  id v1 = *(void **)&v0[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay];
  [v0 bounds];
  objc_msgSend(v1, "setFrame:");
  uint64_t v2 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView;
  id v3 = *(id *)&v0[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView];
  [v0 bounds];
  objc_msgSend(v3, "setBounds:");

  id v4 = *(id *)&v0[v2];
  [v0 bounds];
  CGFloat v5 = CGRectGetWidth(v11) * 0.5;
  [v0 bounds];
  objc_msgSend(v4, "setCenter:", v5, CGRectGetHeight(v12) * 0.5);

  uint64_t v6 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView;
  id v7 = *(id *)&v0[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView];
  [v0 bounds];
  objc_msgSend(v7, "setBounds:");

  id v8 = *(id *)&v0[v6];
  [v0 bounds];
  CGFloat v9 = CGRectGetWidth(v13) * 0.5;
  [v0 bounds];
  objc_msgSend(v8, "setCenter:", v9, CGRectGetHeight(v14) * 0.5);
}

uint64_t sub_100009B90()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView), "subviews"));
  unint64_t v2 = sub_10000EDF0();
  unint64_t v3 = sub_10003A790();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10003AB80();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_10;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_79;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_10003AA90();
    }
    else {
      id v7 = *(id *)(v3 + 8 * i + 32);
    }
    id v8 = v7;
    [v7 removeFromSuperview];
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  id v9 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView), "subviews"));
  unint64_t v10 = sub_10003A790();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10003AB80();
    uint64_t v11 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_19;
    }
  }
  if (v11 < 1)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  for (uint64_t j = 0; j != v11; ++j)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v13 = (id)sub_10003AA90();
    }
    else {
      id v13 = *(id *)(v10 + 8 * j + 32);
    }
    CGRect v14 = v13;
    [v13 removeFromSuperview];
  }
LABEL_19:
  unint64_t v86 = v2;
  swift_bridgeObjectRelease_n();
  uint64_t v89 = v0;
  BOOL v15 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout);
  uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 8);
  unint64_t v17 = *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
  int v18 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 1);
  uint64_t v19 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout) | (v18 << 8);
  swift_bridgeObjectRetain();
  unint64_t v20 = (unint64_t)sub_10000E814(v19, v16, v17, v18, 0, 0);
  swift_bridgeObjectRelease();
  int v21 = *v15;
  uint64_t v23 = *((void *)v15 + 1);
  unint64_t v22 = *((void *)v15 + 2);
  double v24 = *((double *)v15 + 3);
  uint64_t v25 = qword_10004D0D8;
  int v26 = v15[1];
  long long v27 = self;
  swift_bridgeObjectRetain();
  id v28 = [v27 currentDevice];
  id v29 = [v28 userInterfaceIdiom];

  int v30 = v21 | (v26 << 8);
  if (v29 == (id)1) {
    __int16 v31 = sub_100014514(v25, v30, v24, v23, v22);
  }
  else {
    __int16 v31 = sub_100014A18(v25, v30, v23, v22);
  }
  __int16 v35 = v31;
  uint64_t v36 = v32;
  uint64_t v37 = v33;
  uint64_t v38 = v34;
  swift_bridgeObjectRelease();
  uint64_t v39 = v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_unlockedScreenLayout;
  *(unsigned char *)uint64_t v39 = v35 & 1;
  *(unsigned char *)(v39 + 1) = HIBYTE(v35);
  *(void *)(v39 + 8) = v36;
  *(void *)(v39 + 16) = v37;
  *(void *)(v39 + 24) = v38;
  swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10003AB80();
    uint64_t v40 = result;
    if (!result) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v40 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v40) {
      goto LABEL_31;
    }
  }
  if (v40 < 1)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  uint64_t v41 = 0;
  do
  {
    if ((v20 & 0xC000000000000001) != 0) {
      id v42 = (id)sub_10003AA90();
    }
    else {
      id v42 = *(id *)(v20 + 8 * v41 + 32);
    }
    double v43 = v42;
    ++v41;
    uint64_t v90 = v42;
    sub_10000B054(&v90, v0);
  }
  while (v40 != v41);
LABEL_31:
  swift_bridgeObjectRelease_n();
  uint64_t v88 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView;
  id v44 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                              + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView), "subviews"));
  unint64_t v45 = sub_10003A790();

  if (v45 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10003AB80();
    uint64_t v46 = result;
    if (!result) {
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v46) {
      goto LABEL_40;
    }
  }
  if (v46 < 1)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  for (uint64_t k = 0; k != v46; ++k)
  {
    if ((v45 & 0xC000000000000001) != 0) {
      id v48 = (id)sub_10003AA90();
    }
    else {
      id v48 = *(id *)(v45 + 8 * k + 32);
    }
    unint64_t v49 = v48;
    objc_msgSend(v48, "removeFromSuperview", v86);
  }
LABEL_40:
  swift_bridgeObjectRelease_n();
  uint64_t v87 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView;
  id v50 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                              + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView), "subviews"));
  unint64_t v51 = sub_10003A790();

  if (v51 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10003AB80();
    uint64_t v52 = result;
    if (!result) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v52) {
      goto LABEL_49;
    }
  }
  if (v52 < 1)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  for (uint64_t m = 0; m != v52; ++m)
  {
    if ((v51 & 0xC000000000000001) != 0) {
      id v54 = (id)sub_10003AA90();
    }
    else {
      id v54 = *(id *)(v51 + 8 * m + 32);
    }
    int v55 = v54;
    objc_msgSend(v54, "removeFromSuperview", v86);
  }
LABEL_49:
  swift_bridgeObjectRelease_n();
  __int16 v56 = (unsigned __int8 *)(v89 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout);
  uint64_t v57 = *(void *)(v89 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 8);
  unint64_t v58 = *(void *)(v89 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 16);
  __int16 v59 = *(unsigned __int8 *)(v89 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout) | (*(unsigned __int8 *)(v89 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 1) << 8);
  __int16 v60 = (void *)v15[1];
  swift_bridgeObjectRetain();
  LOWORD(v57) = sub_1000128E4(v60, v59, v57, v58);
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  swift_bridgeObjectRelease();
  unsigned __int8 *v56 = v57 & 1;
  v56[1] = BYTE1(v57);
  *((void *)v56 + 1) = v62;
  *((void *)v56 + 2) = v64;
  *((void *)v56 + 3) = v66;
  swift_bridgeObjectRelease();
  unint64_t v67 = *((void *)v56 + 2);
  if (v67 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_10003AB80();
    uint64_t v68 = result;
    if (result)
    {
LABEL_51:
      if (v68 >= 1)
      {
        for (uint64_t n = 0; n != v68; ++n)
        {
          if ((v67 & 0xC000000000000001) != 0) {
            sub_10003AA90();
          }
          else {
            swift_retain();
          }
          swift_unknownObjectWeakAssign();
          swift_release();
        }
        goto LABEL_58;
      }
LABEL_83:
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v68 = *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v68) {
      goto LABEL_51;
    }
  }
LABEL_58:
  swift_bridgeObjectRelease_n();
  uint64_t v70 = *((void *)v56 + 1);
  unint64_t v71 = *((void *)v56 + 2);
  int v72 = v56[1];
  uint64_t v73 = *v56 | (v72 << 8);
  swift_bridgeObjectRetain();
  unint64_t v74 = (unint64_t)sub_10000E814(v73, v70, v71, v72, 0, 0);
  swift_bridgeObjectRelease();
  if (v74 >> 62) {
    goto LABEL_76;
  }
  uint64_t v75 = *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v75; uint64_t v75 = sub_10003AB80())
  {
    uint64_t v76 = 4;
    uint64_t v77 = 0;
    if ((v74 & 0xC000000000000001) != 0)
    {
LABEL_61:
      id v78 = (char *)sub_10003AA90();
      goto LABEL_63;
    }
    while (1)
    {
      id v78 = (char *)*(id *)(v74 + 8 * v76);
LABEL_63:
      char v79 = v78;
      BOOL v80 = __OFADD__(v77, 1);
      uint64_t v81 = v77 + 1;
      if (v80) {
        break;
      }
      if (v78[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows])
      {
        v78[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = 0;
        [*(id *)&v78[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView] removeFromSuperview];
      }
      char v82 = v79[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle];
      v79[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] = 1;
      if ((v82 & 1) == 0)
      {
        sub_100010CE4();
        sub_100010B80();
      }
      objc_msgSend(v79, "setAlpha:", 0.0, v86);
      uint64_t v83 = *(void *)&v79[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec];
      if (v83 && *(unsigned char *)(v83 + 128) == 1)
      {
        uint64_t v84 = v89;
        uint64_t v85 = v87;
      }
      else
      {
        uint64_t v85 = v88;
        uint64_t v84 = v89;
      }
      [*(id *)(v84 + v85) addSubview:v79];

      if (v81 == v75) {
        return swift_bridgeObjectRelease_n();
      }
      uint64_t v77 = ++v76 - 4;
      if ((v74 & 0xC000000000000001) != 0) {
        goto LABEL_61;
      }
    }
    __break(1u);
LABEL_76:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

double sub_10000A3EC(uint64_t a1, int a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10003A5C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  CGRect v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  CGRect v14 = (char *)&v30 - v13;
  char v15 = sub_10003A580();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v16(v14, a1, v8);
  uint64_t v34 = v4;
  int v30 = a2;
  uint64_t v32 = v16;
  if (v15) {
    int v31 = sub_10003A5B0();
  }
  else {
    int v31 = 0;
  }
  uint64_t v33 = *(void (**)(char *, uint64_t))(v9 + 8);
  v33(v14, v8);
  sub_10003A590();
  uint64_t v35 = v17;
  sub_10000ED9C();
  sub_10003A6C0();
  double v18 = v36;
  uint64_t v19 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastWakeProgress;
  uint64_t v20 = v34;
  double v21 = *(double *)(v34 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastWakeProgress);
  sub_10003A590();
  uint64_t v35 = v22;
  sub_10003A6C0();
  double v23 = v36;
  double v24 = *(double *)(v20 + v19);
  v32(v12, a1, v8);
  if (v23 != v24)
  {
    v33(v12, v8);
    if (v31 & 1 | (v18 < v21)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v25 = v18 < v21;
  sub_10003A590();
  uint64_t v35 = v26;
  sub_10003A6C0();
  double v27 = v36;
  v33(v12, v8);
  if (((v31 | v25) & 1) == 0 && v27 >= 1.0) {
LABEL_7:
  }
    sub_10000A6C8(v30 & 1, a3);
LABEL_8:
  sub_10000B2F8();
  sub_10003A590();
  uint64_t v35 = v28;
  sub_10003A6C0();
  double result = v36;
  *(double *)(v20 + v19) = v36;
  return result;
}

void sub_10000A6C8(char a1, double a2)
{
  if (*(double *)(v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockProgress) != a2)
  {
    uint64_t v27 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockProgress;
    uint64_t v30 = v2;
    unint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
    if (v4 >> 62) {
      goto LABEL_38;
    }
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
      while (1)
      {
        unint64_t v6 = 0;
        uint64_t v33 = v5;
        uint64_t v34 = v30 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_unlockedScreenLayout;
        uint64_t v29 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_fadeInTimingFunction;
        unint64_t v7 = v4 & 0xC000000000000001;
        uint64_t v31 = v4 & 0xFFFFFFFFFFFFFF8;
        unint64_t v32 = v4 & 0xC000000000000001;
        while (1)
        {
          if (v7)
          {
            sub_10003AA90();
            BOOL v9 = __OFADD__(v6++, 1);
            if (v9) {
              goto LABEL_36;
            }
          }
          else
          {
            if (v6 >= *(void *)(v31 + 16)) {
              goto LABEL_37;
            }
            swift_retain();
            BOOL v9 = __OFADD__(v6++, 1);
            if (v9) {
              goto LABEL_36;
            }
          }
          uint64_t Strong = swift_unknownObjectWeakLoadStrong();
          if (Strong) {
            break;
          }
          swift_release();
LABEL_6:
          if (v6 == v5) {
            goto LABEL_39;
          }
        }
        uint64_t v11 = (void *)Strong;
        unint64_t v12 = *(void *)(v34 + 16);
        if (!(v12 >> 62)) {
          break;
        }
        swift_bridgeObjectRetain_n();
        id v24 = v11;
        uint64_t v13 = sub_10003AB80();
        if (!v13) {
          goto LABEL_32;
        }
LABEL_16:
        unint64_t v15 = v4;
        if ((v12 & 0xC000000000000001) != 0)
        {
          uint64_t v16 = 0;
          while (1)
          {
            sub_10003AA90();
            unint64_t v4 = v16 + 1;
            if (__OFADD__(v16, 1)) {
              break;
            }
            uint64_t v17 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v17)
            {
              double v18 = v17;

              if (v18 == v11) {
                goto LABEL_29;
              }
            }
            swift_unknownObjectRelease();
            ++v16;
            if (v4 == v13) {
              goto LABEL_30;
            }
          }
          __break(1u);
        }
        else
        {
          uint64_t v19 = 0;
          while (1)
          {
            unint64_t v4 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              break;
            }
            uint64_t v20 = swift_unknownObjectWeakLoadStrong();
            if (v20)
            {
              double v21 = (void *)v20;
              swift_retain();

              if (v21 == v11)
              {
LABEL_29:

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                float v8 = a2;
                *(float *)&double v22 = v8;
                [*(id *)(v30 + v29) _solveForInput:v22];
                id v23 = v11;
                CLKInterpolateBetweenPoints();
                objc_msgSend(v23, "setCenter:");
                swift_release();
                swift_release();

                unint64_t v4 = v15;
                unint64_t v7 = v32;
                uint64_t v5 = v33;
                goto LABEL_6;
              }
              swift_release();
            }
            ++v19;
            if (v4 == v13)
            {
LABEL_30:

              swift_bridgeObjectRelease();
              unint64_t v4 = v15;
              unint64_t v7 = v32;
              uint64_t v5 = v33;
              goto LABEL_33;
            }
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        swift_bridgeObjectRetain();
        uint64_t v5 = sub_10003AB80();
        if (!v5) {
          goto LABEL_39;
        }
      }
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      id v14 = v11;
      if (v13) {
        goto LABEL_16;
      }
LABEL_32:

      swift_bridgeObjectRelease();
LABEL_33:

      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    *(double *)(v30 + v27) = a2;
    if ((a2 == 1.0 || a2 == 0.0)
      && *(double *)(v30 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockLandingPlace) != a2)
    {
      *(double *)(v30 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockLandingPlace) = a2;
    }
    if ((a1 & 1) == 0)
    {
      id v25 = [self currentDevice];
      id v26 = [v25 userInterfaceIdiom];

      if (!v26) {
        sub_10000AAE8(a2);
      }
    }
    if (a2 == 1.0) {
      *(void *)(v30 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_orientationAfterUnlock) = qword_10004D0D8;
    }
    if (a2 == 0.0) {
      *(void *)(v30 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_orientationAfterUnlock) = qword_10004D0D8;
    }
  }
}

void sub_10000AAE8(double a1)
{
  uint64_t v2 = v1;
  if (a1 == 1.0)
  {
    uint64_t v4 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldGenerateNewLayout;
    if (v1[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldGenerateNewLayout] == 1)
    {
      uint64_t v5 = &v1[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout];
      int v6 = v1[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout];
      uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 8];
      unint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16];
      int v9 = v6 | (v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 1] << 8);
      swift_bridgeObjectRetain();
      int v10 = sub_100012BDC(v9, v7, v8);
      uint64_t v12 = v11;
      unint64_t v14 = v13;
      uint64_t v16 = v15;
      swift_bridgeObjectRelease();
      unint64_t v17 = (unint64_t)sub_10000E814(v10 & 0xFFFFFF01, v12, v14, v5[1], 0, 0);
      unint64_t v18 = v17;
      uint64_t v68 = v4;
      if (v17 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v19 = sub_10003AB80();
        if (v19) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v19 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v19)
        {
LABEL_5:
          if (v19 < 1)
          {
            __break(1u);
            goto LABEL_41;
          }
          uint64_t v20 = 0;
          do
          {
            if ((v18 & 0xC000000000000001) != 0) {
              id v21 = (id)sub_10003AA90();
            }
            else {
              id v21 = *(id *)(v18 + 8 * v20 + 32);
            }
            double v22 = v21;
            ++v20;
            unint64_t v70 = (unint64_t)v21;
            sub_10000B054((void **)&v70, (uint64_t)v2);
          }
          while (v19 != v20);
        }
      }
      swift_bridgeObjectRelease_n();
      *uint64_t v5 = v10 & 1;
      v5[1] = BYTE1(v10);
      *((void *)v5 + 1) = v12;
      *((void *)v5 + 2) = v14;
      *((void *)v5 + 3) = v16;
      swift_bridgeObjectRelease();
      v2[v68] = 0;
      v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_needsCleaning] = 1;
    }
  }
  if (a1 != 0.0) {
    return;
  }
  uint64_t v23 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_needsCleaning;
  if (v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_needsCleaning] != 1) {
    return;
  }
  id v24 = &v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout];
  unsigned __int8 v25 = v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout];
  unsigned __int8 v26 = v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 1];
  uint64_t v28 = *(void *)&v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 8];
  unint64_t v27 = *(void *)&v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16];
  swift_bridgeObjectRetain();
  p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
  [v2 bounds];
  double v31 = v30;
  unint64_t v70 = (unint64_t)_swiftEmptyArrayStorage;
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_10003AB80();
    if (v32)
    {
LABEL_17:
      unsigned __int8 v67 = v26;
      unsigned __int8 v69 = v25;
      if (v32 >= 1)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if ((v27 & 0xC000000000000001) != 0)
          {
            uint64_t v34 = sub_10003AA90();
          }
          else
          {
            uint64_t v34 = *(void *)(v27 + 8 * i + 32);
            swift_retain();
          }
          if (*(double *)(v34 + 144) + *(double *)(v34 + 64) * -0.5 <= v31)
          {
            swift_retain();
            sub_10003A770();
            if (*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_10003A7C0();
            }
            sub_10003A7E0();
            sub_10003A7B0();
          }
          else
          {
            uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
            if (Strong)
            {
              id v36 = Strong;
              [v36 removeFromSuperview];
            }
          }
          swift_release();
        }
        swift_bridgeObjectRelease();
        uint64_t v37 = (void *)v70;
        unsigned __int8 v26 = v67;
        unsigned __int8 v25 = v69;
        p_ivar_lyt = (void **)(&RhizomeColorCache + 16);
        goto LABEL_32;
      }
LABEL_41:
      __break(1u);
      return;
    }
  }
  else
  {
    uint64_t v32 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v32) {
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v37 = _swiftEmptyArrayStorage;
LABEL_32:
  id v38 = [self mainScreen];
  objc_msgSend(v38, (SEL)p_ivar_lyt[35]);
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;

  v72.origin.x = v40;
  v72.origin.y = v42;
  v72.size.double width = v44;
  v72.size.double height = v46;
  double Height = CGRectGetHeight(v72);
  swift_bridgeObjectRelease();
  *id v24 = v25;
  v24[1] = v26;
  *((void *)v24 + 1) = v28;
  *((void *)v24 + 2) = v37;
  *((double *)v24 + 3) = Height / 5.0;
  swift_bridgeObjectRelease();
  int v48 = *v24;
  uint64_t v50 = *((void *)v24 + 1);
  unint64_t v49 = *((void *)v24 + 2);
  double v51 = *((double *)v24 + 3);
  uint64_t v52 = qword_10004D0D8;
  int v53 = v24[1];
  id v54 = self;
  swift_bridgeObjectRetain();
  id v55 = [v54 currentDevice];
  id v56 = [v55 userInterfaceIdiom];

  int v57 = v48 | (v53 << 8);
  if (v56 == (id)1) {
    __int16 v58 = sub_100014514(v52, v57, v51, v50, v49);
  }
  else {
    __int16 v58 = sub_100014A18(v52, v57, v50, v49);
  }
  __int16 v62 = v58;
  uint64_t v63 = v59;
  uint64_t v64 = v60;
  uint64_t v65 = v61;
  swift_bridgeObjectRelease();
  uint64_t v66 = &v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_unlockedScreenLayout];
  *uint64_t v66 = v62 & 1;
  v66[1] = HIBYTE(v62);
  *((void *)v66 + 1) = v63;
  *((void *)v66 + 2) = v64;
  *((void *)v66 + 3) = v65;
  swift_bridgeObjectRelease();
  v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldGenerateNewLayout] = 1;
  v2[v23] = 0;
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10002CB40((uint64_t)v2);
    swift_unknownObjectRelease();
  }
}

id sub_10000B054(void **a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldShowShadows);
  uint64_t v4 = *a1;
  if (v3 != *((unsigned __int8 *)*a1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows))
  {
    v4[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = v3;
    if (v3) {
      sub_100010B80();
    }
    else {
      [*(id *)&v4[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView] removeFromSuperview];
    }
  }
  if (v4[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle]) {
    uint64_t v5 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet;
  }
  else {
    uint64_t v5 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet;
  }
  if (*(void *)&v4[*v5])
  {
    swift_retain();
    [v4 bounds];
    objc_msgSend(v4, "setBounds:");
    swift_release();
  }
  else
  {
    objc_msgSend(v4, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  }
  uint64_t v6 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec;
  uint64_t v7 = *(void *)&v4[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec];
  double v8 = 0.0;
  CGFloat v9 = 0.0;
  if (v7) {
    CGFloat v9 = *(double *)(v7 + 104);
  }
  CGAffineTransformMakeRotation(&v30, v9);
  long long v10 = *(_OWORD *)&v30.a;
  long long v11 = *(_OWORD *)&v30.c;
  long long v12 = *(_OWORD *)&v30.tx;
  switch(qword_10004D0D8)
  {
    case 1:
      break;
    case 2:
      long long v24 = *(_OWORD *)&v30.c;
      long long v26 = *(_OWORD *)&v30.a;
      long long v23 = *(_OWORD *)&v30.tx;
      int v13 = CLKFloatEqualsFloat();
      long long v12 = v23;
      BOOL v14 = v13 == 0;
      double v15 = 3.14159265;
      double v16 = -3.14159265;
      goto LABEL_18;
    case 3:
      double v8 = 1.57079633;
      break;
    case 4:
      long long v24 = *(_OWORD *)&v30.c;
      long long v26 = *(_OWORD *)&v30.a;
      long long v23 = *(_OWORD *)&v30.tx;
      int v17 = CLKFloatEqualsFloat();
      long long v12 = v23;
      BOOL v14 = v17 == 0;
      double v15 = 4.71238898;
      double v16 = -1.57079633;
LABEL_18:
      if (v14) {
        double v8 = v15;
      }
      else {
        double v8 = v16;
      }
      long long v11 = v24;
      long long v10 = v26;
      break;
    default:
      double v8 = 1.0;
      break;
  }
  *(_OWORD *)&v30.CGFloat a = v10;
  *(_OWORD *)&v30.c = v11;
  *(_OWORD *)&v30.CGFloat tx = v12;
  CGAffineTransformRotate(&v29, &v30, v8);
  long long v25 = *(_OWORD *)&v29.c;
  long long v27 = *(_OWORD *)&v29.a;
  CGFloat tx = v29.tx;
  CGFloat ty = v29.ty;
  v28.receiver = v4;
  v28.super_class = (Class)type metadata accessor for RhizomeLayeredFlowerView();
  *(_OWORD *)&v30.CGFloat a = v27;
  *(_OWORD *)&v30.c = v25;
  v30.CGFloat tx = tx;
  v30.CGFloat ty = ty;
  objc_msgSendSuper2(&v28, "setTransform:", &v30);
  sub_1000112A8();
  uint64_t v20 = *(void *)&v4[v6];
  if (v20 && (*(unsigned char *)(v20 + 128) & 1) != 0) {
    id v21 = &OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView;
  }
  else {
    id v21 = &OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView;
  }
  return objc_msgSend(*(id *)(a2 + *v21), "addSubview:", v4, v23);
}

uint64_t sub_10000B2F8()
{
  sub_10003A590();
  sub_10000ED9C();
  sub_10003A6C0();
  uint64_t v1 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastWakeProgress;
  if (v5 >= *(double *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastWakeProgress)
    || (uint64_t v2 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD,
        (*(unsigned char *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD) & 1) != 0))
  {
    sub_10003A590();
    sub_10003A6C0();
    if (*(double *)(v0 + v1) < v5
      && (uint64_t v3 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD,
          *(unsigned char *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD) == 1))
    {
      sub_10000C438();
      sub_10003A590();
      uint64_t result = sub_10003A6C0();
      if (v5 > 0.99 && *(unsigned char *)(v0 + v3) == 1) {
        return sub_10000C8A8();
      }
    }
    else
    {
      sub_10003A590();
      uint64_t result = sub_10003A6C0();
      if (*(double *)(v0 + v1) < v5) {
        return sub_10000B4C4();
      }
    }
  }
  else
  {
    sub_10000B4C4();
    sub_10003A590();
    uint64_t result = sub_10003A6C0();
    if (v5 < 0.01 && (*(unsigned char *)(v0 + v2) & 1) == 0) {
      return sub_10000BCD8();
    }
  }
  return result;
}

uint64_t sub_10000B4C4()
{
  uint64_t v1 = v0;
  sub_10003A590();
  v103.CGFloat a = v2;
  sub_10000ED9C();
  sub_10003A6C0();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay], "setAlpha:");
  CLKInterpolateBetweenFloatsClipped();
  CGFloat v4 = v3;
  double v5 = *(void **)&v0[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView];
  CGAffineTransformMakeScale(&v104, v3, v3);
  [v5 setTransform:&v104];
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView];
  CGAffineTransformMakeScale(&v104, v4, v4);
  [v6 setTransform:&v104];
  unint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 16];
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_10003AB80();
    if (v81 < 0) {
      __break(1u);
    }
    uint64_t v8 = v81;
    if (v81) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v9 = 0;
      double v10 = 0.55;
      double v83 = 4.71238898;
      do
      {
        if ((v7 & 0xC000000000000001) != 0)
        {
          long long v11 = (CGFloat *)sub_10003AA90();
        }
        else
        {
          long long v11 = *(CGFloat **)(v7 + 8 * v9 + 32);
          swift_retain();
        }
        double v12 = fmax(v10 - 0.15 / (double)v8, 0.4);
        double v13 = v11[17];
        double v14 = v11[18];
        objc_msgSend(v1, "center", *(void *)&v83);
        if (v13 >= v15) {
          double v16 = 15.0;
        }
        else {
          double v16 = -15.0;
        }
        double v17 = v13 + v16;
        [v1 center];
        if (v14 >= v18) {
          double v19 = 15.0;
        }
        else {
          double v19 = -15.0;
        }
        double v20 = v14 + v19;
        CGFloat v22 = v11[17];
        CGFloat v21 = v11[18];
        sub_10003A590();
        v103.CGFloat a = v23;
        sub_10003A6C0();
        double v102 = v12;
        if (v12 >= v104.a)
        {
          sub_10003A590();
          v103.CGFloat a = v31;
          sub_10003A6C0();
          if (v104.a >= v12 + -0.4)
          {
            sub_10003A590();
            v103.CGFloat a = v37;
            sub_10003A6C0();
            double v38 = (v12 - v104.a) / 0.4;
            CLKInterpolateBetweenFloatsClipped();
            CGFloat v40 = v39;
            CLKInterpolateBetweenFloatsClipped();
            double v17 = v41;
            CLKInterpolateBetweenFloatsClipped();
            double v20 = v42;
            uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
            if (Strong)
            {
              CGFloat v44 = Strong;
              [Strong setAlpha:v38];
            }
            CGAffineTransformMakeRotation(&v104, v11[13]);
            long long v45 = *(_OWORD *)&v104.a;
            long long v46 = *(_OWORD *)&v104.c;
            long long v47 = *(_OWORD *)&v104.tx;
            double v48 = 0.0;
            switch(qword_10004D0D8)
            {
              case 1:
                break;
              case 2:
                long long v92 = *(_OWORD *)&v104.c;
                long long v98 = *(_OWORD *)&v104.a;
                long long v86 = *(_OWORD *)&v104.tx;
                int v49 = CLKFloatEqualsFloat();
                long long v47 = v86;
                long long v46 = v92;
                double v48 = 3.14159265;
                if (v49) {
                  double v48 = -3.14159265;
                }
                long long v45 = v98;
                break;
              case 3:
                double v48 = 1.57079633;
                break;
              case 4:
                long long v95 = *(_OWORD *)&v104.c;
                long long v101 = *(_OWORD *)&v104.a;
                long long v89 = *(_OWORD *)&v104.tx;
                int v61 = CLKFloatEqualsFloat();
                long long v47 = v89;
                long long v46 = v95;
                double v48 = -1.57079633;
                if (!v61) {
                  double v48 = v83;
                }
                long long v45 = v101;
                break;
              default:
                double v48 = 1.0;
                break;
            }
            *(_OWORD *)&v104.CGFloat a = v45;
            *(_OWORD *)&v104.CGFloat c = v46;
            *(_OWORD *)&v104.CGFloat tx = v47;
            CGAffineTransformRotate(&v103, &v104, v48);
            CGAffineTransform v104 = v103;
            CGAffineTransformScale(&v103, &v104, v40, v40);
            CGFloat a = v103.a;
            CGFloat b = v103.b;
            CGFloat c = v103.c;
            CGFloat d = v103.d;
            CGFloat tx = v103.tx;
            CGFloat ty = v103.ty;
            id v78 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v78)
            {
              char v79 = v78;
              v104.CGFloat a = a;
              v104.CGFloat b = b;
              v104.CGFloat c = c;
              v104.CGFloat d = d;
              v104.CGFloat tx = tx;
              v104.CGFloat ty = ty;
              [v78 setTransform:&v104];
            }
            uint64_t v80 = swift_unknownObjectWeakLoadStrong();
            if (!v80) {
              goto LABEL_5;
            }
            uint64_t v59 = (void *)v80;
          }
          else
          {
            CGAffineTransformMakeRotation(&v104, v11[13]);
            long long v32 = *(_OWORD *)&v104.a;
            long long v33 = *(_OWORD *)&v104.c;
            long long v34 = *(_OWORD *)&v104.tx;
            double v35 = 0.0;
            switch(qword_10004D0D8)
            {
              case 1:
                break;
              case 2:
                long long v91 = *(_OWORD *)&v104.c;
                long long v97 = *(_OWORD *)&v104.a;
                long long v85 = *(_OWORD *)&v104.tx;
                int v36 = CLKFloatEqualsFloat();
                long long v34 = v85;
                long long v33 = v91;
                double v35 = 3.14159265;
                if (v36) {
                  double v35 = -3.14159265;
                }
                long long v32 = v97;
                break;
              case 3:
                double v35 = 1.57079633;
                break;
              case 4:
                long long v94 = *(_OWORD *)&v104.c;
                long long v100 = *(_OWORD *)&v104.a;
                long long v88 = *(_OWORD *)&v104.tx;
                int v60 = CLKFloatEqualsFloat();
                long long v34 = v88;
                long long v33 = v94;
                double v35 = -1.57079633;
                if (!v60) {
                  double v35 = v83;
                }
                long long v32 = v100;
                break;
              default:
                double v35 = 1.0;
                break;
            }
            *(_OWORD *)&v104.CGFloat a = v32;
            *(_OWORD *)&v104.CGFloat c = v33;
            *(_OWORD *)&v104.CGFloat tx = v34;
            CGAffineTransformRotate(&v103, &v104, v35);
            CGAffineTransform v104 = v103;
            CGAffineTransformScale(&v103, &v104, 0.8, 0.8);
            CGFloat v62 = v103.a;
            CGFloat v63 = v103.b;
            CGFloat v64 = v103.c;
            CGFloat v65 = v103.d;
            CGFloat v67 = v103.tx;
            CGFloat v66 = v103.ty;
            uint64_t v68 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v68)
            {
              unsigned __int8 v69 = v68;
              [v68 setAlpha:1.0];
            }
            unint64_t v70 = (void *)swift_unknownObjectWeakLoadStrong();
            if (v70)
            {
              unint64_t v71 = v70;
              v104.CGFloat a = v62;
              v104.CGFloat b = v63;
              v104.CGFloat c = v64;
              v104.CGFloat d = v65;
              v104.CGFloat tx = v67;
              v104.CGFloat ty = v66;
              [v70 setTransform:&v104];
            }
            uint64_t v59 = (void *)swift_unknownObjectWeakLoadStrong();
            double v17 = v22;
            double v20 = v21;
            if (!v59) {
              goto LABEL_5;
            }
          }
        }
        else
        {
          long long v24 = (void *)swift_unknownObjectWeakLoadStrong();
          if (v24)
          {
            long long v25 = v24;
            [v24 setAlpha:0.0];
          }
          CGAffineTransformMakeRotation(&v104, v11[13]);
          long long v26 = *(_OWORD *)&v104.a;
          long long v27 = *(_OWORD *)&v104.c;
          long long v28 = *(_OWORD *)&v104.tx;
          double v29 = 0.0;
          switch(qword_10004D0D8)
          {
            case 1:
              break;
            case 2:
              long long v90 = *(_OWORD *)&v104.c;
              long long v96 = *(_OWORD *)&v104.a;
              long long v84 = *(_OWORD *)&v104.tx;
              int v30 = CLKFloatEqualsFloat();
              long long v28 = v84;
              long long v27 = v90;
              double v29 = 3.14159265;
              if (v30) {
                double v29 = -3.14159265;
              }
              long long v26 = v96;
              break;
            case 3:
              double v29 = 1.57079633;
              break;
            case 4:
              long long v93 = *(_OWORD *)&v104.c;
              long long v99 = *(_OWORD *)&v104.a;
              long long v87 = *(_OWORD *)&v104.tx;
              int v50 = CLKFloatEqualsFloat();
              long long v28 = v87;
              long long v27 = v93;
              double v29 = -1.57079633;
              if (!v50) {
                double v29 = v83;
              }
              long long v26 = v99;
              break;
            default:
              double v29 = 1.0;
              break;
          }
          *(_OWORD *)&v104.CGFloat a = v26;
          *(_OWORD *)&v104.CGFloat c = v27;
          *(_OWORD *)&v104.CGFloat tx = v28;
          CGAffineTransformRotate(&v103, &v104, v29);
          CGAffineTransform v104 = v103;
          CGAffineTransformScale(&v103, &v104, 1.5, 1.5);
          CGFloat v51 = v103.a;
          CGFloat v52 = v103.b;
          CGFloat v53 = v103.c;
          CGFloat v54 = v103.d;
          CGFloat v55 = v103.tx;
          CGFloat v56 = v103.ty;
          int v57 = (void *)swift_unknownObjectWeakLoadStrong();
          if (v57)
          {
            __int16 v58 = v57;
            v104.CGFloat a = v51;
            v104.CGFloat b = v52;
            v104.CGFloat c = v53;
            v104.CGFloat d = v54;
            v104.CGFloat tx = v55;
            v104.CGFloat ty = v56;
            [v57 setTransform:&v104];
          }
          uint64_t v59 = (void *)swift_unknownObjectWeakLoadStrong();
          if (!v59) {
            goto LABEL_5;
          }
        }
        objc_msgSend(v59, "setCenter:", v17, v20);

LABEL_5:
        ++v9;
        swift_release();
        double v10 = v102;
      }
      while (v8 != v9);
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000BCD8()
{
  CGFloat v3 = v1;
  if (qword_10004AC88 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10003A5F0();
  sub_10000325C(v4, (uint64_t)qword_10004D098);
  double v5 = sub_10003A5D0();
  os_log_type_t v6 = sub_10003A870();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished transition into AOD", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = (unsigned __int8 *)v3 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout;
  unint64_t v9 = *(unint64_t *)((char *)v3 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
    if (!v10) {
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_10003AB80();
  if (v14 < 0) {
    __break(1u);
  }
  uint64_t v10 = v14;
  p_ivar_lyt = (void **)(&RhizomeColorCache + 16);
  if (v14)
  {
LABEL_7:
    uint64_t v12 = 0;
    uint64_t v0 = (void *)(v9 & 0xC000000000000001);
    do
    {
      if (v0) {
        sub_10003AA90();
      }
      else {
        swift_retain();
      }
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v2 = Strong;
        objc_msgSend(v2, (SEL)p_ivar_lyt[51]);
      }
      ++v12;
      swift_release();
    }
    while (v10 != v12);
  }
LABEL_17:
  swift_bridgeObjectRelease();
  double v15 = (unsigned __int8 *)v3 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout;
  unint64_t v16 = *(unint64_t *)((char *)v3 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextScreenLayout + 16);
  if (v16 >> 62) {
    goto LABEL_51;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v17) {
    goto LABEL_19;
  }
  while (1)
  {
LABEL_26:
    uint64_t v75 = v3;
    swift_bridgeObjectRelease();
    unsigned __int8 v20 = v15[1];
    uint64_t v22 = *((void *)v15 + 1);
    uint64_t v21 = *((void *)v15 + 2);
    uint64_t v23 = *((void *)v15 + 3);
    *uint64_t v8 = *v15;
    v8[1] = v20;
    *((void *)v8 + 1) = v22;
    *((void *)v8 + 2) = v21;
    *((void *)v8 + 3) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    int v24 = *v8;
    uint64_t v26 = *((void *)v8 + 1);
    unint64_t v25 = *((void *)v8 + 2);
    double v27 = *((double *)v8 + 3);
    uint64_t v0 = &unk_10004D000;
    uint64_t v28 = qword_10004D0D8;
    int v29 = v8[1];
    int v30 = self;
    swift_bridgeObjectRetain();
    id v31 = [v30 currentDevice];
    id v32 = [v31 userInterfaceIdiom];

    int v33 = v24 | (v29 << 8);
    if (v32 == (id)1) {
      __int16 v34 = sub_100014514(v28, v33, v27, v26, v25);
    }
    else {
      __int16 v34 = sub_100014A18(v28, v33, v26, v25);
    }
    __int16 v38 = v34;
    uint64_t v39 = v35;
    uint64_t v40 = v36;
    uint64_t v41 = v37;
    id v2 = v75;
    CGFloat v3 = &RhizomeColorCache.ivar_lyt;
    swift_bridgeObjectRelease();
    double v42 = (char *)v75 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_unlockedScreenLayout;
    *double v42 = v38 & 1;
    v42[1] = HIBYTE(v38);
    *((void *)v42 + 1) = v39;
    *((void *)v42 + 2) = v40;
    *((void *)v42 + 3) = v41;
    swift_bridgeObjectRelease();
    if (qword_10004ACA0 != -1) {
LABEL_53:
    }
      swift_once();
    __int16 v43 = sub_100021564((char *)qword_10004D0D0, 1, v8[1], v0[27], *(double *)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_yMinValueForOverlap));
    *double v15 = v43 & 1;
    v15[1] = HIBYTE(v43);
    *((void *)v15 + 1) = v44;
    *((void *)v15 + 2) = v45;
    *((void *)v15 + 3) = v46;
    swift_bridgeObjectRelease();
    uint64_t v47 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView;
    [*(id *)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersView) (SEL)v3[51]];
    uint64_t v48 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView;
    [*(id *)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_currentFlowersFloatingView) (SEL)v3[51]];
    int v49 = *(void **)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay);
    [v49 setAlpha:0.0];
    CGFloat v3 = (void **)OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView;
    int v50 = *(void **)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersView);
    CGFloat v51 = *(void **)((char *)v2 + v47);
    *(void *)((char *)v2 + v47) = v50;
    id v52 = v50;

    id v53 = [objc_allocWithZone((Class)UIView) init];
    CGFloat v54 = *(void **)((char *)v3 + (void)v2);
    *(void **)((char *)v3 + (void)v2) = v53;

    [v2 addSubview:*(void *)((char *)v2 + v47)];
    uint64_t v8 = (unsigned __int8 *)OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView;
    CGFloat v55 = *(void **)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_nextFlowersFloatingView);
    CGFloat v56 = *(void **)((char *)v2 + v48);
    *(void *)((char *)v2 + v48) = v55;
    id v57 = v55;

    id v58 = [objc_allocWithZone((Class)UIView) init];
    uint64_t v59 = *(void **)&v8[(void)v2];
    *(void *)&v8[(void)v2] = v58;

    uint64_t v60 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_floatingContainerView;
    [*(id *)((char *)v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_floatingContainerView) addSubview:*(void *)((char *)v2 + v48)];
    [*(id *)((char *)v2 + v60) addSubview:v49];
    [*(id *)((char *)v2 + v60) addSubview:*(void **)((char *)v3 + (void)v2)];
    [*(id *)((char *)v2 + v60) addSubview:*(void *)&v8[(void)v2]];
    uint64_t v61 = *((void *)v15 + 1);
    unint64_t v62 = *((void *)v15 + 2);
    LODWORD(v60) = v15[1];
    uint64_t v63 = *v15 | (v60 << 8);
    swift_bridgeObjectRetain();
    uint64_t v64 = (uint64_t)sub_10000E814(v63, v61, v62, v60, 0, 0);
    swift_bridgeObjectRelease();
    if (!((unint64_t)v64 >> 62)) {
      break;
    }
    if (v64 < 0) {
      unint64_t v16 = v64;
    }
    else {
      unint64_t v16 = v64 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_10003AB80();
    uint64_t v74 = swift_bridgeObjectRelease();
    if ((v65 & 0x8000000000000000) == 0) {
      goto LABEL_32;
    }
    __break(1u);
    while (1)
    {
      uint64_t v17 = v74;
      if (!v74) {
        break;
      }
LABEL_19:
      uint64_t v18 = 0;
      uint64_t v0 = (void *)(v16 & 0xC000000000000001);
      while (v17 != v18)
      {
        if (v0) {
          sub_10003AA90();
        }
        else {
          swift_retain();
        }
        double v19 = (void *)swift_unknownObjectWeakLoadStrong();
        if (!v19)
        {
          swift_release();
          return swift_bridgeObjectRelease();
        }
        id v2 = v19;
        ++v18;
        [v19 setAlpha:1.0];
        swift_release();

        if (v17 == v18) {
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_51:
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_10003AB80();
      if (v74 < 0)
      {
        __break(1u);
        goto LABEL_53;
      }
    }
  }
  uint64_t v65 = *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_32:
  if (v65)
  {
    for (uint64_t i = 0; i != v65; ++i)
    {
      if ((v64 & 0xC000000000000001) != 0) {
        uint64_t v68 = (char *)sub_10003AA90();
      }
      else {
        uint64_t v68 = (char *)*(id *)(v64 + 8 * i + 32);
      }
      unsigned __int8 v69 = v68;
      if (v68[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows])
      {
        v68[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = 0;
        [*(id *)&v68[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView] removeFromSuperview];
      }
      char v70 = v69[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle];
      v69[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] = 1;
      if ((v70 & 1) == 0)
      {
        sub_100010CE4();
        sub_100010B80();
      }
      [v69 setAlpha:0.0];
      uint64_t v71 = *(void *)&v69[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec];
      if (v71 && *(unsigned char *)(v71 + 128) == 1)
      {
        CGRect v72 = *(void **)&v8[(void)v75];
        swift_retain();
        id v67 = v72;
        [v67 addSubview:v69];
        swift_release();
      }
      else
      {
        id v67 = *(id *)((char *)v3 + (void)v75);
        [v67 addSubview:v69];
      }
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  *((unsigned char *)v75 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD) = 1;
  return result;
}

uint64_t sub_10000C438()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
  if (v1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v2)
  {
    do
    {
      uint64_t v3 = 0;
      uint64_t v28 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldShowShadows;
      double v25 = -3.14159265;
      while (v2 != v3)
      {
        if ((v1 & 0xC000000000000001) != 0)
        {
          uint64_t v4 = sub_10003AA90();
        }
        else
        {
          uint64_t v4 = *(void *)(v1 + 8 * v3 + 32);
          swift_retain();
        }
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (!Strong)
        {
          swift_release();
          return swift_bridgeObjectRelease();
        }
        os_log_type_t v6 = (char *)Strong;
        int v7 = *(unsigned __int8 *)(v29 + v28);
        if (v7 != *(unsigned __int8 *)(Strong
                                      + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows))
        {
          *(unsigned char *)(Strong + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows) = v7;
          if (v7) {
            sub_100010B80();
          }
          else {
            [*(id *)(Strong + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView) removeFromSuperview];
          }
        }
        sub_10003A590();
        v37.double a = v8;
        sub_10000ED9C();
        sub_10003A6C0();
        double a = transform.a;
        sub_10003A590();
        v37.double a = v10;
        sub_10003A6C0();
        sub_1000107F4(1.0 - transform.a);
        CGAffineTransformMakeRotation(&transform, *(CGFloat *)(v4 + 104));
        long long v11 = *(_OWORD *)&transform.a;
        long long v12 = *(_OWORD *)&transform.c;
        long long v13 = *(_OWORD *)&transform.tx;
        double v14 = 0.0;
        switch(qword_10004D0D8)
        {
          case 1:
            break;
          case 2:
            long long v30 = *(_OWORD *)&transform.c;
            long long v33 = *(_OWORD *)&transform.a;
            long long v26 = *(_OWORD *)&transform.tx;
            int v15 = CLKFloatEqualsFloat();
            long long v13 = v26;
            long long v12 = v30;
            long long v11 = v33;
            double v14 = 3.14159265;
            if (v15) {
              double v14 = v25;
            }
            break;
          case 3:
            double v14 = 1.57079633;
            break;
          case 4:
            long long v31 = *(_OWORD *)&transform.c;
            long long v34 = *(_OWORD *)&transform.a;
            long long v27 = *(_OWORD *)&transform.tx;
            int v16 = CLKFloatEqualsFloat();
            long long v13 = v27;
            long long v12 = v31;
            long long v11 = v34;
            if (v16) {
              double v14 = -1.57079633;
            }
            else {
              double v14 = 4.71238898;
            }
            break;
          default:
            double v14 = 1.0;
            break;
        }
        *(_OWORD *)&transform.double a = v11;
        *(_OWORD *)&transform.CGFloat c = v12;
        *(_OWORD *)&transform.CGFloat tx = v13;
        CGAffineTransformRotate(&v37, &transform, v14);
        CGAffineTransform transform = v37;
        CGAffineTransformScale(&v37, &transform, a * 0.2 + 0.8, a * 0.2 + 0.8);
        long long v32 = *(_OWORD *)&v37.c;
        long long v35 = *(_OWORD *)&v37.a;
        CGFloat tx = v37.tx;
        CGFloat ty = v37.ty;
        double v19 = (objc_class *)type metadata accessor for RhizomeLayeredFlowerView();
        v36.receiver = v6;
        v36.super_class = v19;
        *(_OWORD *)&transform.double a = v35;
        *(_OWORD *)&transform.CGFloat c = v32;
        transform.CGFloat tx = tx;
        transform.CGFloat ty = ty;
        objc_msgSendSuper2(&v36, "setTransform:", &transform);
        uint64_t v20 = *(void *)&v6[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
        if (v20 && (*(unsigned char *)(v20 + 24) & 1) != 0 && (*(unsigned char *)(v20 + 120) & 1) != 0)
        {
          swift_retain();
          [v6 transform];
          CGAffineTransformDecompose((CGAffineTransformComponents *)&v37, &transform);
          double v21 = 3.0;
          if (*(unsigned char *)(v20 + 48)) {
            double v21 = 1.5;
          }
          double v22 = v21 / v37.a;
          objc_msgSend(*(id *)(v20 + 56), "setLineWidth:", v21 / v37.a, *(void *)&v25);
          [*(id *)(v20 + 64) setLineWidth:v22];
          [*(id *)(v20 + 72) setLineWidth:v22];
          swift_release();

          swift_release();
        }
        else
        {
          swift_release();
        }
        if (v2 == ++v3) {
          return swift_bridgeObjectRelease();
        }
      }
      __break(1u);
LABEL_33:
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_10003AB80();
      if (v23 < 0) {
        __break(1u);
      }
      uint64_t v2 = v23;
    }
    while (v23);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000C8A8()
{
  uint64_t v1 = v0;
  if (qword_10004AC88 != -1) {
LABEL_35:
  }
    swift_once();
  uint64_t v2 = sub_10003A5F0();
  sub_10000325C(v2, (uint64_t)qword_10004D098);
  uint64_t v3 = sub_10003A5D0();
  os_log_type_t v4 = sub_10003A870();
  if (os_log_type_enabled(v3, v4))
  {
    double v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Finished transition out of AOD", v5, 2u);
    swift_slowDealloc();
  }

  [*(id *)(v1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_blackOverlay) setAlpha:0.0];
  *(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_readyToTransitionOutOfAOD) = 0;
  unint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10003AB80();
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_6:
      uint64_t v8 = OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldShowShadows;
      unint64_t v9 = v6 & 0xC000000000000001;
      uint64_t v10 = 4;
      unint64_t v30 = v6;
      do
      {
        uint64_t v11 = v10 - 4;
        if (v9)
        {
          uint64_t v12 = sub_10003AA90();
          uint64_t v13 = v10 - 3;
          if (__OFADD__(v11, 1)) {
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v12 = *(void *)(v6 + 8 * v10);
          swift_retain();
          uint64_t v13 = v10 - 3;
          if (__OFADD__(v11, 1))
          {
LABEL_34:
            __break(1u);
            goto LABEL_35;
          }
        }
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (!Strong)
        {
          swift_release();
          return swift_bridgeObjectRelease();
        }
        int v15 = (char *)Strong;
        int v16 = *(unsigned __int8 *)(v1 + v8);
        if (v16 != *(unsigned __int8 *)(Strong
                                       + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows))
        {
          *(unsigned char *)(Strong + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows) = v16;
          if (v16) {
            sub_100010B80();
          }
          else {
            [*(id *)(Strong + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView) removeFromSuperview];
          }
        }
        double v17 = 0.0;
        sub_1000107F4(0.0);
        CGAffineTransformMakeRotation(&transform, *(CGFloat *)(v12 + 104));
        long long v18 = *(_OWORD *)&transform.a;
        long long v19 = *(_OWORD *)&transform.c;
        long long v20 = *(_OWORD *)&transform.tx;
        switch(qword_10004D0D8)
        {
          case 1:
            break;
          case 2:
            long long v33 = *(_OWORD *)&transform.c;
            long long v36 = *(_OWORD *)&transform.a;
            long long v31 = *(_OWORD *)&transform.tx;
            int v21 = CLKFloatEqualsFloat();
            long long v20 = v31;
            long long v19 = v33;
            long long v18 = v36;
            if (v21) {
              double v17 = -3.14159265;
            }
            else {
              double v17 = 3.14159265;
            }
            break;
          case 3:
            double v17 = 1.57079633;
            break;
          case 4:
            long long v34 = *(_OWORD *)&transform.c;
            long long v37 = *(_OWORD *)&transform.a;
            long long v32 = *(_OWORD *)&transform.tx;
            int v22 = CLKFloatEqualsFloat();
            long long v20 = v32;
            long long v19 = v34;
            long long v18 = v37;
            if (v22) {
              double v17 = -1.57079633;
            }
            else {
              double v17 = 4.71238898;
            }
            break;
          default:
            double v17 = 1.0;
            break;
        }
        *(_OWORD *)&transform.double a = v18;
        *(_OWORD *)&transform.CGFloat c = v19;
        *(_OWORD *)&transform.CGFloat tx = v20;
        CGAffineTransformRotate(&v40, &transform, v17);
        CGAffineTransform transform = v40;
        CGAffineTransformScale(&v40, &transform, 1.0, 1.0);
        long long v35 = *(_OWORD *)&v40.c;
        long long v38 = *(_OWORD *)&v40.a;
        CGFloat tx = v40.tx;
        CGFloat ty = v40.ty;
        double v25 = (objc_class *)type metadata accessor for RhizomeLayeredFlowerView();
        v39.receiver = v15;
        v39.super_class = v25;
        *(_OWORD *)&transform.double a = v38;
        *(_OWORD *)&transform.CGFloat c = v35;
        transform.CGFloat tx = tx;
        transform.CGFloat ty = ty;
        objc_msgSendSuper2(&v39, "setTransform:", &transform);
        uint64_t v26 = *(void *)&v15[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
        if (v26 && (*(unsigned char *)(v26 + 24) & 1) != 0 && *(unsigned char *)(v26 + 120) == 1)
        {
          swift_retain();
          [v15 transform];
          CGAffineTransformDecompose((CGAffineTransformComponents *)&v40, &transform);
          double v27 = 3.0;
          if (*(unsigned char *)(v26 + 48)) {
            double v27 = 1.5;
          }
          double v28 = v27 / v40.a;
          [*(id *)(v26 + 56) setLineWidth:v27 / v40.a];
          [*(id *)(v26 + 64) setLineWidth:v28];
          unint64_t v6 = v30;
          [*(id *)(v26 + 72) setLineWidth:v28];
          swift_release();
        }
        [v15 setAlpha:1.0];
        swift_release();

        ++v10;
      }
      while (v13 != v7);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_10002CB40(v1);
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_10000CDC4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RhizomeView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RhizomeView()
{
  return self;
}

uint64_t sub_10000CF14(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 4:
      CLKFloatEqualsFloat();
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 2:
    case 4:
      CLKFloatEqualsFloat();
      break;
    default:
      break;
  }
  CLKInterpolateBetweenFloatsClipped();
  CGFloat v5 = v4;
  transform.CGFloat a = *(CGFloat *)(v2 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
  swift_bridgeObjectRetain();
  unint64_t v6 = swift_bridgeObjectRetain();
  sub_10000D96C(v6);
  CGFloat a = transform.a;
  if (*(void *)&transform.a >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10003AB80();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((*(void *)&transform.a & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8)
    {
LABEL_7:
      if (v8 < 1)
      {
        __break(1u);
        JUMPOUT(0x10000D2F8);
      }
      for (uint64_t i = 0; i != v8; ++i)
      {
        if ((*(void *)&a & 0xC000000000000001) != 0)
        {
          uint64_t v10 = sub_10003AA90();
        }
        else
        {
          uint64_t v10 = *(void *)(*(void *)&a + 8 * i + 32);
          swift_retain();
        }
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          uint64_t v12 = (char *)Strong;
          CGAffineTransformMakeRotation(&transform, *(CGFloat *)(v10 + 104));
          CGAffineTransformRotate(&v23, &transform, v5);
          long long v20 = *(_OWORD *)&v23.c;
          long long v21 = *(_OWORD *)&v23.a;
          CGFloat tx = v23.tx;
          CGFloat ty = v23.ty;
          int v15 = (objc_class *)type metadata accessor for RhizomeLayeredFlowerView();
          v22.receiver = v12;
          v22.super_class = v15;
          *(_OWORD *)&transform.CGFloat a = v21;
          *(_OWORD *)&transform.CGFloat c = v20;
          transform.CGFloat tx = tx;
          transform.CGFloat ty = ty;
          objc_msgSendSuper2(&v22, "setTransform:", &transform);
          uint64_t v16 = *(void *)&v12[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
          if (v16 && (*(unsigned char *)(v16 + 24) & 1) != 0 && (*(unsigned char *)(v16 + 120) & 1) != 0)
          {
            swift_retain();
            [v12 transform];
            CGAffineTransformDecompose((CGAffineTransformComponents *)&v23, &transform);
            if (*(unsigned char *)(v16 + 48)) {
              double v17 = 1.5;
            }
            else {
              double v17 = 3.0;
            }
            double v18 = v17 / v23.a;
            objc_msgSend(*(id *)(v16 + 56), "setLineWidth:", v17 / v23.a, v20, v21);
            [*(id *)(v16 + 64) setLineWidth:v18];
            [*(id *)(v16 + 72) setLineWidth:v18];

            swift_release();
          }
          else
          {
          }
        }
        swift_release();
      }
      return swift_bridgeObjectRelease();
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D318(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_10004AC88 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10003A5F0();
  sub_10000325C(v3, (uint64_t)qword_10004D098);
  double v4 = sub_10003A5D0();
  os_log_type_t v5 = sub_10003A870();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v74 = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    uint64_t v7 = a1;
    uint64_t v8 = sub_10003A8E0();
    sub_10000E014(v8, v9, &v74);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Orientation landed: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v7 = a1;
  }
  qword_10004D0D8 = v7;
  double v10 = *(double *)&v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lastUnlockLandingPlace];
  unsigned __int8 v66 = v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 1];
  unint64_t v11 = *(void *)&v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16];
  id v67 = &v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout];
  double v69 = *(double *)&v2[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 24];
  swift_bridgeObjectRetain();
  [v2 bounds];
  uint64_t v74 = (uint64_t)_swiftEmptyArrayStorage;
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10003AB80();
    uint64_t v12 = result;
    uint64_t v68 = (uint64_t)v2;
    if (result) {
      goto LABEL_8;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    long long v37 = _swiftEmptyArrayStorage;
    goto LABEL_32;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v68 = (uint64_t)v2;
  if (!v12) {
    goto LABEL_31;
  }
LABEL_8:
  if (v12 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v14 = 0;
  unint64_t v72 = v11;
  unint64_t v73 = v11 & 0xC000000000000001;
  uint64_t v71 = v12;
  do
  {
    if (v73)
    {
      uint64_t v15 = sub_10003AA90();
    }
    else
    {
      uint64_t v15 = *(void *)(v11 + 8 * v14 + 32);
      swift_retain();
    }
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      double v17 = Strong;
      [Strong center];
      double v20 = v18;
      double v21 = v19;
      if (v10 == 1.0)
      {
        switch(a1)
        {
          case 2:
            double v21 = v19 - v69;
            break;
          case 3:
            double v20 = v18 - v69;
            break;
          case 4:
            double v20 = v69 + v18;
            break;
          default:
            double v21 = v69 + v19;
            break;
        }
      }
      double v22 = *(double *)(v15 + 56);
      double v23 = *(double *)(v15 + 64);
      int v24 = *(void **)(v15 + 80);
      double v25 = *(void **)(v15 + 88);
      char v26 = *(unsigned char *)(v15 + 96);
      uint64_t v27 = *(void *)(v15 + 104);
      uint64_t v28 = *(void *)(v15 + 120);
      uint64_t v29 = qword_10004AD30;
      id v30 = *(id *)(v15 + 72);
      id v31 = v24;
      id v32 = v25;
      if (v29 != -1) {
        swift_once();
      }
      uint64_t v33 = qword_10004D180;
      type metadata accessor for RhizomeLayoutSpec();
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = 0u;
      *(_OWORD *)(v34 + 32) = 0u;
      *(void *)(v34 + 48) = 0;
      swift_unknownObjectWeakInit();
      *(double *)(v34 + 56) = v22;
      *(double *)(v34 + 64) = v23;
      *(double *)(v34 + 136) = v20;
      *(double *)(v34 + 144) = v21;
      *(void *)(v34 + 72) = v30;
      *(void *)(v34 + 80) = v31;
      *(void *)(v34 + 88) = v32;
      *(void *)(v34 + 104) = v27;
      swift_unknownObjectWeakAssign();
      *(unsigned char *)(v34 + 96) = v26;
      *(void *)(v34 + 120) = v28;
      *(_WORD *)(v34 + 128) = 256;
      *(void *)(v34 + 112) = v33;
      double v35 = *(double *)(v34 + 136) - v22 * 0.5;
      double v36 = *(double *)(v34 + 144) - v23 * 0.5;
      *(double *)(v34 + 16) = v22 * v23;
      *(double *)(v34 + 24) = v35;
      *(double *)(v34 + 32) = v36;
      *(double *)(v34 + 40) = v22;
      *(double *)(v34 + 48) = v23;
      swift_unknownObjectWeakAssign();
      swift_retain();
      sub_10003A770();
      if (*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10003A7C0();
      }
      sub_10003A7E0();
      sub_10003A7B0();
      swift_release();
      swift_release();

      uint64_t v12 = v71;
      unint64_t v11 = v72;
    }
    else
    {
      swift_release();
    }
    ++v14;
  }
  while (v12 != v14);
  swift_bridgeObjectRelease();
  long long v37 = (void *)v74;
LABEL_32:
  id v38 = [self mainScreen];
  [v38 bounds];
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;

  v75.origin.x = v40;
  v75.origin.y = v42;
  v75.size.double width = v44;
  v75.size.double height = v46;
  double Height = CGRectGetHeight(v75);
  swift_bridgeObjectRelease();
  *id v67 = 1;
  v67[1] = v66;
  *((void *)v67 + 1) = a1;
  *((void *)v67 + 2) = v37;
  *((double *)v67 + 3) = Height / 5.0;
  swift_bridgeObjectRelease();
  int v48 = *v67;
  uint64_t v50 = *((void *)v67 + 1);
  unint64_t v49 = *((void *)v67 + 2);
  double v51 = *((double *)v67 + 3);
  int v52 = v67[1];
  id v53 = self;
  swift_bridgeObjectRetain();
  id v54 = [v53 currentDevice];
  id v55 = [v54 userInterfaceIdiom];

  int v56 = v48 | (v52 << 8);
  if (v55 == (id)1) {
    __int16 v57 = sub_100014514(a1, v56, v51, v50, v49);
  }
  else {
    __int16 v57 = sub_100014A18(a1, v56, v50, v49);
  }
  __int16 v61 = v57;
  uint64_t v62 = v58;
  uint64_t v63 = v59;
  uint64_t v64 = v60;
  swift_bridgeObjectRelease();
  uint64_t v65 = v68 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_unlockedScreenLayout;
  *(unsigned char *)uint64_t v65 = v61 & 1;
  *(unsigned char *)(v65 + 1) = HIBYTE(v61);
  *(void *)(v65 + 8) = v62;
  *(void *)(v65 + 16) = v63;
  *(void *)(v65 + 24) = v64;
  swift_bridgeObjectRelease();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_10002CB40(v68);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000D96C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10003AB80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10003AB80();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10003AAA0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10001E31C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10003AB80();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_10003A7B0();
}

uint64_t sub_10000DB38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100015728(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[3 * v8 + 4];
  if (a1 + 32 < v9 + 24 * v2 && v9 < a1 + 32 + 24 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10000DC94(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_100015850(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  double v10 = &v3[v9 + 4];
  if (a1 + 32 < (unint64_t)&v10[v8] && (unint64_t)v10 < a1 + 32 + 8 * v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), 8 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10000DDE0(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100015960(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = (char *)v3 + v8 + 32;
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10000DF28(uint64_t result, unsigned char **a2)
{
  int64_t v2 = *a2;
  *int64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000DF38(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000DF74(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000DF9C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000E014(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_10003A940();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000E014(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E0E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E7B4((uint64_t)v12, *a3);
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
      sub_10000E7B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004D70((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E0E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10003A950();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000E2A4(a5, a6);
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
  uint64_t v8 = sub_10003AAB0();
  if (!v8)
  {
    sub_10003AB60();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10003ABE0();
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

uint64_t sub_10000E2A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E33C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000E51C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000E51C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E33C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000E4B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10003AA70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10003AB60();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10003A760();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10003ABE0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10003AB60();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000E4B4(uint64_t a1, uint64_t a2)
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
  sub_10000316C(&qword_10004B050);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000E51C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000316C(&qword_10004B050);
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
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

unsigned char **sub_10000E66C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void (*sub_10000E67C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000E72C(v6, a2, a3);
  return sub_10000E6E4;
}

void sub_10000E6E4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_10000E72C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_10003AA90();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *unint64_t v3 = v4;
    return sub_10000E7AC;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E7AC()
{
  return swift_release();
}

uint64_t sub_10000E7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10000E814(uint64_t a1, uint64_t a2, unint64_t a3, __int16 a4, char a5, char a6)
{
  unint64_t v7 = a3;
  unint64_t v58 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!(a3 >> 62))
  {
    uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_3;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_10003AB80();
  uint64_t v8 = (uint64_t)result;
  if (!result) {
    goto LABEL_33;
  }
LABEL_3:
  if (v8 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = v7 & 0xC000000000000001;
    __int16 v46 = a4 << 8;
    unint64_t v47 = v7 & 0xC000000000000001;
    uint64_t v48 = v8;
    unint64_t v45 = v7;
    do
    {
      if (v11)
      {
        uint64_t v12 = sub_10003AA90();
      }
      else
      {
        uint64_t v12 = *(void *)(v7 + 8 * v10 + 32);
        swift_retain();
      }
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

      if (Strong)
      {
        swift_release();
      }
      else
      {
        if (a5) {
          char v14 = 1;
        }
        else {
          char v14 = *(unsigned char *)(v12 + 128) & a6;
        }
        __int16 v15 = *(unsigned __int8 *)(v12 + 96);
        uint64_t v16 = *(void **)(v12 + 72);
        double v17 = *(void **)(v12 + 80);
        double v18 = *(void **)(v12 + 88);
        double v19 = *(double *)(v12 + 112);
        id v54 = (objc_class *)type metadata accessor for RhizomeLayeredFlowerView();
        id v20 = objc_allocWithZone(v54);
        id v21 = v16;
        id v22 = v17;
        id v23 = v18;
        int v52 = v22;
        id v53 = v21;
        int v24 = (char *)sub_100011F4C(v46 | v15, v21, v22, v23, 0, v14 & 1, v19);
        double v25 = (uint64_t *)&v24[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower];
        char v26 = *(void **)&v24[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower + 8];
        if (v26)
        {
          uint64_t v27 = (void *)v25[2];
          uint64_t v28 = (void *)v25[3];
          uint64_t v29 = *v25;
          id v30 = v26;
          id v51 = v23;
          id v31 = v27;
          id v32 = v28;
          id v50 = v30;
          id v33 = v31;
          id v34 = v32;
          sub_10000ECFC(v29, v26, v27, v28);
          double v35 = v28;
          unint64_t v7 = v45;
          sub_10000ED4C(v29, v26, v27, v35);
          double v36 = *(double *)(v12 + 136);
          double v37 = *(double *)(v12 + 144);
          swift_retain();
          id v38 = v24;
          objc_msgSend(v38, "setCenter:", v36, v37);
          objc_msgSend(v38, "setBounds:", 0.0, 0.0, *(double *)(v12 + 56), *(double *)(v12 + 64));
          swift_release();

          id v23 = v51;
          swift_unknownObjectWeakAssign();
          *(void *)&v38[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec] = v12;
          swift_release();
          swift_retain();
        }
        double v39 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet;
        if (!v24[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle]) {
          double v39 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet;
        }
        if (*(void *)&v24[*v39])
        {
          swift_retain();
          [v24 bounds];
          objc_msgSend(v24, "setBounds:");
          swift_release();
        }
        else
        {
          objc_msgSend(v24, "setBounds:", 0.0, 0.0, 0.0, 0.0);
        }
        CGAffineTransformMakeRotation(&transform, *(CGFloat *)(v12 + 104));
        v56.receiver = v24;
        v56.super_class = v54;
        objc_msgSendSuper2(&v56, "setTransform:", &transform);
        uint64_t v40 = *(void *)&v24[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
        if (v40 && (*(unsigned char *)(v40 + 24) & 1) != 0 && *(unsigned char *)(v40 + 120) == 1)
        {
          swift_retain();
          [v24 transform];
          CGAffineTransformDecompose(&v55, &transform);
          if (*(unsigned char *)(v40 + 48)) {
            double v41 = 1.5;
          }
          else {
            double v41 = 3.0;
          }
          double v42 = v41 / v55.scale.width;
          [*(id *)(v40 + 56) setLineWidth:v41 / v55.scale.width];
          [*(id *)(v40 + 64) setLineWidth:v42];
          [*(id *)(v40 + 72) setLineWidth:v42];
          swift_release();
        }
        double v43 = v24;
        sub_10003A770();
        if (*(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10003A7C0();
        }
        sub_10003A7E0();
        sub_10003A7B0();
        swift_release();

        unint64_t v11 = v47;
        uint64_t v8 = v48;
      }
      ++v10;
    }
    while (v8 != v10);
    swift_bridgeObjectRelease();
    return (void *)v58;
  }
  return result;
}

void sub_10000ECFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a2)
  {
    id v5 = a2;
    id v6 = a3;
    id v7 = a4;
  }
}

void sub_10000ED4C(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a2)
  {
  }
}

unint64_t sub_10000ED9C()
{
  unint64_t result = qword_10004B058;
  if (!qword_10004B058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B058);
  }
  return result;
}

unint64_t sub_10000EDF0()
{
  unint64_t result = qword_10004B060;
  if (!qword_10004B060)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004B060);
  }
  return result;
}

uint64_t sub_10000EE30(uint64_t a1)
{
  return a1;
}

void *sub_10000EE58()
{
  uint64_t v1 = *(void *)(v0 + 56);
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v1;
  sub_10000F64C(&v71, v70);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  double v69 = &_swiftEmptyDictionarySingleton;
  sub_100019CBC(v70, 0xD000000000000017, 0x800000010003D960, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v3 = qword_10004B068;
  uint64_t v4 = off_10004B070;
  uint64_t v5 = *(void *)(v0 + 64);
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v5;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v6 = swift_isUniquelyReferenced_nonNull_native();
  double v69 = &_swiftEmptyDictionarySingleton;
  sub_100019CBC(v70, v3, (uint64_t)v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = qword_10004B078;
  uint64_t v8 = off_10004B080;
  uint64_t v9 = *(void *)(v0 + 136);
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v9;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  double v69 = &_swiftEmptyDictionarySingleton;
  sub_100019CBC(v70, v7, (uint64_t)v8, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = qword_10004B088;
  uint64_t v12 = off_10004B090;
  uint64_t v13 = *(void *)(v0 + 144);
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v13;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  double v69 = &_swiftEmptyDictionarySingleton;
  sub_100019CBC(v70, v11, (uint64_t)v12, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v0 + 120);
  unint64_t v72 = &type metadata for Int;
  *(void *)&long long v71 = v15;
  sub_10000F64C(&v71, v70);
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, 0xD000000000000013, 0x800000010003D980, v16);
  swift_bridgeObjectRelease();
  uint64_t v68 = 0;
  double v69 = 0;
  uint64_t v67 = 0;
  [*(id *)(v0 + 72) getRed:&v69 green:&v68 blue:&v67 alpha:0];
  uint64_t v17 = qword_10004B098;
  double v18 = off_10004B0A0;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v69;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v17, (uint64_t)v18, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = qword_10004B0A8;
  id v21 = off_10004B0B0;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v68;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v20, (uint64_t)v21, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = qword_10004B0B8;
  int v24 = off_10004B0C0;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v67;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v25 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v23, (uint64_t)v24, v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v64 = 0;
  [*(id *)(v0 + 80) getRed:&v66 green:&v65 blue:&v64 alpha:0];
  uint64_t v26 = qword_10004B0C8;
  uint64_t v27 = off_10004B0D0;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v66;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v26, (uint64_t)v27, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v29 = qword_10004B0D8;
  id v30 = off_10004B0E0;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v65;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v29, (uint64_t)v30, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v32 = qword_10004B0E8;
  id v33 = off_10004B0F0;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v64;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v34 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v32, (uint64_t)v33, v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v61 = 0;
  [*(id *)(v0 + 88) getRed:&v63 green:&v62 blue:&v61 alpha:0];
  uint64_t v35 = qword_10004B0F8;
  double v36 = off_10004B100;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v63;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v37 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v35, (uint64_t)v36, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v38 = qword_10004B108;
  double v39 = off_10004B110;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v62;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v40 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v38, (uint64_t)v39, v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v41 = qword_10004B118;
  double v42 = off_10004B120;
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v61;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v43 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v41, (uint64_t)v42, v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v44 = qword_10004B128;
  unint64_t v45 = off_10004B130;
  uint64_t v46 = *(unsigned __int8 *)(v0 + 96);
  unint64_t v72 = &type metadata for Int;
  *(void *)&long long v71 = v46;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v47 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v44, (uint64_t)v45, v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v48 = qword_10004B148;
  unint64_t v49 = off_10004B150;
  char v50 = *(unsigned char *)(v0 + 128);
  unint64_t v72 = &type metadata for Bool;
  LOBYTE(v71) = v50;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v51 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v48, (uint64_t)v49, v51);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v52 = qword_10004B138;
  id v53 = off_10004B140;
  uint64_t v54 = *(void *)(v0 + 104);
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v54;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v55 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v52, (uint64_t)v53, v55);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v56 = qword_10004B158;
  __int16 v57 = off_10004B160;
  uint64_t v58 = *(void *)(v0 + 112);
  unint64_t v72 = &type metadata for CGFloat;
  *(void *)&long long v71 = v58;
  sub_10000F64C(&v71, v70);
  swift_bridgeObjectRetain();
  char v59 = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v70, v56, (uint64_t)v57, v59);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return &_swiftEmptyDictionarySingleton;
}

_OWORD *sub_10000F64C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000F65C(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_83;
  }
  unint64_t v2 = sub_1000181A4(0xD000000000000017, 0x800000010003D960);
  if ((v3 & 1) == 0) {
    goto LABEL_83;
  }
  sub_10000E7B4(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v87);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v4 = off_10004B070;
  uint64_t v5 = qword_10004B068;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000181A4(v5, (uint64_t)v4);
  if (v7)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v8 = off_10004B080;
  uint64_t v9 = qword_10004B078;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1000181A4(v9, (uint64_t)v8);
  if (v11)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v12 = off_10004B090;
  uint64_t v13 = qword_10004B088;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1000181A4(v13, (uint64_t)v12);
  if (v15)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  char v16 = off_10004B0A0;
  uint64_t v17 = qword_10004B098;
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_1000181A4(v17, (uint64_t)v16);
  if (v19)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v20 = off_10004B0B0;
  uint64_t v21 = qword_10004B0A8;
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_1000181A4(v21, (uint64_t)v20);
  if (v23)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v22, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  int v24 = off_10004B0C0;
  uint64_t v25 = qword_10004B0B8;
  swift_bridgeObjectRetain();
  unint64_t v26 = sub_1000181A4(v25, (uint64_t)v24);
  if (v27)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v26, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  char v28 = off_10004B0D0;
  uint64_t v29 = qword_10004B0C8;
  swift_bridgeObjectRetain();
  unint64_t v30 = sub_1000181A4(v29, (uint64_t)v28);
  if (v31)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v30, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v32 = off_10004B0E0;
  uint64_t v33 = qword_10004B0D8;
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_1000181A4(v33, (uint64_t)v32);
  if (v35)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v34, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  double v36 = off_10004B0F0;
  uint64_t v37 = qword_10004B0E8;
  swift_bridgeObjectRetain();
  unint64_t v38 = sub_1000181A4(v37, (uint64_t)v36);
  if (v39)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v38, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  char v40 = off_10004B100;
  uint64_t v41 = qword_10004B0F8;
  swift_bridgeObjectRetain();
  unint64_t v42 = sub_1000181A4(v41, (uint64_t)v40);
  if (v43)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v42, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v44 = off_10004B110;
  uint64_t v45 = qword_10004B108;
  swift_bridgeObjectRetain();
  unint64_t v46 = sub_1000181A4(v45, (uint64_t)v44);
  if (v47)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v46, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v48 = off_10004B120;
  uint64_t v49 = qword_10004B118;
  swift_bridgeObjectRetain();
  unint64_t v50 = sub_1000181A4(v49, (uint64_t)v48);
  if (v51)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v50, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_89;
  }
  uint64_t v52 = off_10004B130;
  uint64_t v53 = qword_10004B128;
  swift_bridgeObjectRetain();
  unint64_t v54 = sub_1000181A4(v53, (uint64_t)v52);
  if (v55)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v54, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_83;
  }
  char v56 = sub_1000106AC(v86);
  if (v56 == 17) {
    goto LABEL_83;
  }
  if (!*(void *)(a1 + 16))
  {
LABEL_89:
    long long v87 = 0u;
    long long v88 = 0u;
LABEL_90:
    swift_bridgeObjectRelease();
    sub_100010148((uint64_t)&v87);
    return 0;
  }
  char v59 = v56;
  uint64_t v60 = off_10004B150;
  uint64_t v61 = qword_10004B148;
  swift_bridgeObjectRetain();
  unint64_t v62 = sub_1000181A4(v61, (uint64_t)v60);
  if (v63)
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v62, (uint64_t)&v87);
  }
  else
  {
    long long v87 = 0u;
    long long v88 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v88 + 1)) {
    goto LABEL_90;
  }
  if (swift_dynamicCast())
  {
    if (*(void *)(a1 + 16)
      && (unint64_t v64 = sub_1000181A4(0xD000000000000013, 0x800000010003D980), (v65 & 1) != 0)
      && (sub_10000E7B4(*(void *)(a1 + 56) + 32 * v64, (uint64_t)&v87), swift_dynamicCast()))
    {
      uint64_t v66 = v86;
    }
    else
    {
      uint64_t v66 = 0;
    }
    id v67 = [objc_allocWithZone((Class)UIColor) initWithRed:*(double *)&v86 green:*(double *)&v86 blue:*(double *)&v86 alpha:1.0];
    id v68 = [objc_allocWithZone((Class)UIColor) initWithRed:*(double *)&v86 green:*(double *)&v86 blue:*(double *)&v86 alpha:1.0];
    id v69 = [objc_allocWithZone((Class)UIColor) initWithRed:*(double *)&v86 green:*(double *)&v86 blue:*(double *)&v86 alpha:1.0];
    if (*(void *)(a1 + 16))
    {
      char v70 = off_10004B140;
      uint64_t v71 = qword_10004B138;
      id v72 = v67;
      id v73 = v68;
      id v74 = v69;
      swift_bridgeObjectRetain();
      unint64_t v75 = sub_1000181A4(v71, (uint64_t)v70);
      if (v76)
      {
        sub_10000E7B4(*(void *)(a1 + 56) + 32 * v75, (uint64_t)&v87);
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v88 + 1))
      {
        if (swift_dynamicCast())
        {
          double v80 = *(double *)&v86;
          goto LABEL_109;
        }
LABEL_108:
        double v80 = 0.0;
LABEL_109:
        if (*(void *)(a1 + 16))
        {
          uint64_t v81 = off_10004B160;
          uint64_t v82 = qword_10004B158;
          swift_bridgeObjectRetain();
          unint64_t v83 = sub_1000181A4(v82, (uint64_t)v81);
          if (v84)
          {
            sub_10000E7B4(*(void *)(a1 + 56) + 32 * v83, (uint64_t)&v87);
          }
          else
          {
            long long v87 = 0u;
            long long v88 = 0u;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          long long v87 = 0u;
          long long v88 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v88 + 1))
        {
          if (swift_dynamicCast())
          {
            double v85 = *(double *)&v86;
LABEL_122:
            type metadata accessor for RhizomeLayoutSpec();
            swift_allocObject();
            uint64_t v57 = sub_100035E14((uint64_t)v67, (uint64_t)v68, (uint64_t)v69, v59, *(double *)&v86, *(double *)&v86, *(double *)&v86, *(double *)&v86, v80, v85, 0, v66, v86, 1);

            return v57;
          }
        }
        else
        {
          sub_100010148((uint64_t)&v87);
        }
        if (qword_10004AD30 != -1) {
          swift_once();
        }
        double v85 = *(double *)&qword_10004D180;
        goto LABEL_122;
      }
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
      id v77 = v67;
      id v78 = v68;
      id v79 = v69;
    }
    sub_100010148((uint64_t)&v87);
    goto LABEL_108;
  }
LABEL_83:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100010148(uint64_t a1)
{
  uint64_t v2 = sub_10000316C(&qword_10004B570);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomeFlowerType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RhizomeFlowerType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x100010304);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeFlowerType()
{
  return &type metadata for RhizomeFlowerType;
}

unint64_t sub_10001033C(char a1)
{
  unint64_t v1 = 0xD000000000000011;
  switch(a1)
  {
    case 4:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      unint64_t v1 = 0x6C694C20616C6143;
      break;
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      unint64_t v1 = 0x646C6F676972614DLL;
      break;
    default:
      unint64_t v1 = 0x206E616369726641;
      break;
  }
  unint64_t v6 = v1;
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = 32;
  v7._object = (void *)0xE100000000000000;
  sub_10003A740(v7);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_10003AC20();
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = v2;
  v8._object = v4;
  sub_10003A740(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

BOOL sub_1000104D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000104EC()
{
  Swift::UInt v1 = *v0;
  sub_10003AC90();
  sub_10003ACA0(v1);
  return sub_10003ACD0();
}

void sub_100010534()
{
  sub_10003ACA0(*v0);
}

Swift::Int sub_100010560()
{
  Swift::UInt v1 = *v0;
  sub_10003AC90();
  sub_10003ACA0(v1);
  return sub_10003ACD0();
}

void sub_1000105A4(void *a1@<X8>)
{
  *a1 = &off_100045218;
}

unint64_t sub_1000105B4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000106AC(*a1);
  *a2 = result;
  return result;
}

void sub_1000105E0(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_1000105EC()
{
  return sub_10001033C(*v0);
}

unint64_t sub_1000105F8()
{
  unint64_t result = qword_10004B168;
  if (!qword_10004B168)
  {
    sub_100002F64(&qword_10004B170);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B168);
  }
  return result;
}

unint64_t sub_100010658()
{
  unint64_t result = qword_10004B178;
  if (!qword_10004B178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B178);
  }
  return result;
}

unint64_t sub_1000106AC(unint64_t result)
{
  if (result >= 0x11) {
    return 17;
  }
  return result;
}

uint64_t sub_1000106BC()
{
  uint64_t v0 = sub_10003A5F0();
  sub_1000031F8(v0, qword_10004D0E0);
  sub_10000325C(v0, (uint64_t)qword_10004D0E0);
  return sub_10003A5E0();
}

id sub_100010730()
{
  if (v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle]) {
    Swift::UInt v1 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet;
  }
  else {
    Swift::UInt v1 = &OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet;
  }
  if (*(void *)&v0[*v1])
  {
    swift_retain();
    [v0 bounds];
    objc_msgSend(v0, "setBounds:");
    return (id)swift_release();
  }
  else
  {
    return objc_msgSend(v0, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  }
}

void sub_1000107F4(double a1)
{
  uint64_t v2 = v1;
  if (a1 == 0.0)
  {
    int v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle);
    *(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle) = 0;
    if (v3 != 1) {
      return;
    }
LABEL_3:
    sub_100010CE4();
    sub_100010B80();
    return;
  }
  if (a1 == 1.0)
  {
    char v5 = *(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle);
    *(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle) = 1;
    if (v5) {
      return;
    }
    goto LABEL_3;
  }
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet);
  if (v6)
  {
    *(unsigned char *)(v6 + 152) = 0;
    swift_retain();
    sub_1000364B4();
    double v7 = 1.0 - a1;
    *(float *)&double v7 = 1.0 - a1;
    *(_DWORD *)(v6 + 156) = LODWORD(v7);
    sub_10003658C(v7);
    swift_release();
  }
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet);
  if (v8)
  {
    *(unsigned char *)(v8 + 152) = 0;
    swift_retain();
    sub_1000364B4();
    *(float *)&double v9 = a1;
    *(_DWORD *)(v8 + 156) = LODWORD(v9);
    sub_10003658C(v9);
    swift_release();
  }
  uint64_t v10 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView;
  [*(id *)(v2 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView) setHidden:(*(unsigned char *)(v2 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows) & 1) == 0];
  id v12 = [*(id *)(v2 + v10) layer];
  double v11 = 1.0 - a1;
  *(float *)&double v11 = 1.0 - a1;
  [v12 setOpacity:v11];
}

BOOL sub_100010994(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1000109B4(uint64_t a1)
{
  uint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet];
  if (a1)
  {
    swift_retain();
    swift_retain();
    sub_100037950();
    uint64_t result = swift_release();
    if (!v2) {
      return result;
    }
  }
  else
  {
    uint64_t result = swift_retain();
    if (!v2) {
      return result;
    }
  }
  if (*(unsigned char *)(v2 + 120) == 1)
  {
    swift_retain();
    sub_1000376D0(v1);
  }
  else
  {
    double v4 = *(double *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__pointSize];
    swift_retain();
    sub_100036AE8(v1, v4);
  }
  *(unsigned char *)(v2 + 152) = v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle];
  sub_1000364B4();
  return swift_release_n();
}

uint64_t sub_100010A94(uint64_t a1)
{
  uint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
  if (a1)
  {
    swift_retain();
    swift_retain();
    sub_100037950();
    uint64_t result = swift_release();
    if (!v2) {
      return result;
    }
  }
  else
  {
    uint64_t result = swift_retain();
    if (!v2) {
      return result;
    }
  }
  if (*(unsigned char *)(v2 + 120) == 1)
  {
    swift_retain();
    sub_1000376D0(v1);
  }
  else
  {
    double v4 = *(double *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__pointSize];
    swift_retain();
    sub_100036AE8(v1, v4);
  }
  *(unsigned char *)(v2 + 152) = (v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] & 1) == 0;
  sub_1000364B4();
  return swift_release_n();
}

void sub_100010B80()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet];
  if (v1)
  {
    uint64_t v2 = *(void **)(v1 + 128);
    if (v2)
    {
      uint64_t v3 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView;
      double v4 = *(void **)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView];
      id v10 = v2;
      objc_msgSend(v4, "setImage:");
      char v5 = 1;
      [*(id *)&v0[v3] setContentMode:1];
      [*(id *)&v0[v3] setAlpha:1.0];
      if ((v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] & 1) == 0) {
        char v5 = v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] ^ 1;
      }
      [*(id *)&v0[v3] setHidden:v5 & 1];
      uint64_t v6 = *(void **)&v0[v3];
      double v7 = self;
      id v8 = v6;
      id v9 = [v7 blackColor];
      [v8 setTintColor:v9];

      [v0 insertSubview:*(void *)&v0[v3] atIndex:0];
    }
  }
}

id sub_100010CE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet);
  if (v2)
  {
    *(_DWORD *)(v2 + 156) = 1065353216;
    swift_retain();
    sub_10003658C(v3);
    *(unsigned char *)(v2 + 152) = *(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle);
    sub_1000364B4();
    swift_release();
  }
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet);
  if (v4)
  {
    *(_DWORD *)(v4 + 156) = 1065353216;
    swift_retain();
    sub_10003658C(v5);
    *(unsigned char *)(v4 + 152) = (*(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle) & 1) == 0;
    sub_1000364B4();
    swift_release();
  }
  uint64_t v6 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView;
  [*(id *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView) setAlpha:1.0];
  double v7 = *(void **)(v1 + v6);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle)) {
    char v8 = 1;
  }
  else {
    char v8 = *(unsigned char *)(v1 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows) ^ 1;
  }
  return [v7 setHidden:v8 & 1];
}

void sub_100010E20(id a1)
{
  v18.receiver = v1;
  v18.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v18, "layoutSublayersOfLayer:", a1);
  id v3 = [v1 layer];

  if (v3 != a1) {
    return;
  }
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet];
  if (v4)
  {
    double v5 = (void *)v4[7];
    if (v5)
    {
      swift_retain();
      id v6 = v5;
      [a1 bounds];
      objc_msgSend(v6, "setFrame:");

      double v7 = (void *)v4[8];
      if (!v7)
      {
LABEL_6:
        id v9 = (void *)v4[9];
        if (v9)
        {
          id v10 = v9;
          [a1 bounds];
          objc_msgSend(v10, "setFrame:");
        }
        swift_release();
        goto LABEL_9;
      }
    }
    else
    {
      swift_retain();
      double v7 = (void *)v4[8];
      if (!v7) {
        goto LABEL_6;
      }
    }
    id v8 = v7;
    [a1 bounds];
    objc_msgSend(v8, "setFrame:");

    goto LABEL_6;
  }
LABEL_9:
  double v11 = *(void **)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
  if (!v11) {
    return;
  }
  id v12 = (void *)v11[7];
  if (!v12)
  {
    swift_retain();
    unint64_t v14 = (void *)v11[8];
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  swift_retain();
  id v13 = v12;
  [a1 bounds];
  objc_msgSend(v13, "setFrame:");

  unint64_t v14 = (void *)v11[8];
  if (v14)
  {
LABEL_12:
    id v15 = v14;
    [a1 bounds];
    objc_msgSend(v15, "setFrame:");
  }
LABEL_13:
  char v16 = (void *)v11[9];
  if (v16)
  {
    id v17 = v16;
    [a1 bounds];
    objc_msgSend(v17, "setFrame:");
  }
  swift_release();
}

void sub_100011080()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v4, "layoutSubviews");
  if (*(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet])
  {
    uint64_t v1 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView;
    [*(id *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView] sizeToFit];
    id v2 = *(id *)&v0[v1];
    [v0 bounds];
    CGFloat v3 = CGRectGetWidth(v5) * 0.5;
    [v0 bounds];
    objc_msgSend(v2, "setCenter:", v3, CGRectGetHeight(v6) * 0.5);
  }
}

uint64_t sub_1000112A8()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
  if (v1 && *(unsigned char *)(v1 + 24) == 1 && *(unsigned char *)(v1 + 120) == 1)
  {
    swift_retain();
    [v0 transform];
    CGAffineTransformDecompose(&v5, &transform);
    double v2 = 3.0;
    if (*(unsigned char *)(v1 + 48)) {
      double v2 = 1.5;
    }
    double v3 = v2 / v5.scale.width;
    [*(id *)(v1 + 56) setLineWidth:v2 / v5.scale.width];
    [*(id *)(v1 + 64) setLineWidth:v3];
    [*(id *)(v1 + 72) setLineWidth:v3];
    return swift_release();
  }
  return result;
}

void sub_10001138C()
{
  uint64_t v1 = v0;
  sub_10001163C();
  double v2 = (uint64_t *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower];
  double v3 = *(void **)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower + 8];
  if (!v3) {
    return;
  }
  CGAffineTransformComponents v5 = (void *)v2[2];
  objc_super v4 = (void *)v2[3];
  uint64_t v6 = *v2;
  double v7 = *(double *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__pointSize];
  char v8 = v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_context];
  id v28 = v3;
  id v9 = v5;
  id v27 = v4;
  sub_10000ECFC(v6, v3, v5, v4);
  uint64_t v10 = sub_1000052A4(v6, v28, v9, v27, v8, v7);
  if (v11)
  {
    uint64_t v12 = v11;
    if (*(void *)(v11 + 16))
    {
      uint64_t v13 = v10;
      unint64_t v14 = sub_10001821C(0);
      if (v15)
      {
        if (*(void *)(v12 + 16))
        {
          uint64_t v16 = *(void *)(*(void *)(v12 + 56) + 8 * v14);
          unint64_t v17 = sub_10001821C(1);
          if (v18)
          {
            uint64_t v19 = *(void *)(*(void *)(v12 + 56) + 8 * v17);
            uint64_t v20 = (uint64_t *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_configuration];
            *uint64_t v20 = v13;
            v20[1] = v12;
            swift_retain();
            swift_retain();
            swift_bridgeObjectRelease();
            uint64_t v21 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet;
            uint64_t v22 = *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet];
            *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet] = v16;
            swift_retain_n();
            sub_1000109B4(v22);
            swift_release();
            swift_release();
            uint64_t v23 = *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
            *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet] = v19;
            swift_retain_n();
            sub_100010A94(v23);
            swift_release();
            swift_release();
            uint64_t v24 = *(void *)&v1[v21];
            if (v24)
            {
              *(void *)(v24 + 144) = &off_100045F70;
              swift_unknownObjectWeakAssign();
              if (*(void *)(v24 + 128))
              {
                if (swift_unknownObjectWeakLoadStrong())
                {
                  swift_retain();
                  uint64_t v25 = v1;
                  sub_100010B80();
                  swift_release();

                  swift_unknownObjectRelease();
                }
              }
            }
            sub_100010B80();

            swift_release();
            swift_release();
            return;
          }
        }
      }
    }

    swift_bridgeObjectRelease();
    unint64_t v26 = v27;
  }
  else
  {

    unint64_t v26 = v28;
  }
}

uint64_t sub_10001163C()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_configuration);
  *uint64_t v1 = 0;
  v1[1] = 0;
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet);
  *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet) = 0;
  sub_100010A94(v2);
  swift_release();
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet);
  *(void *)(v0 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet) = 0;
  sub_1000109B4(v3);
  return swift_release();
}

void sub_1000116BC(unint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = (uint64_t *)(v5 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower);
  uint64_t v13 = *(void *)(v5 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower);
  unint64_t v14 = (void *)v12[1];
  char v15 = (void *)v12[2];
  uint64_t v16 = (void *)v12[3];
  unint64_t v17 = &OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldGenerateNewLayout;
  if (a2)
  {
    if (v14)
    {
      if (v13 != a1)
      {
        sub_10000ECFC(a1, a2, a3, a4);
        sub_10000ECFC(a1, a2, a3, a4);
        sub_10000ECFC(v13, v14, v15, v16);
LABEL_14:

        sub_10000ED4C(a1, a2, a3, a4);
        goto LABEL_15;
      }
      unint64_t v22 = a1 >> 8;
      sub_10000ECFC(a1, a2, a3, a4);
      sub_10000ECFC(a1, a2, a3, a4);
      sub_10000ECFC(v13, v14, v15, v16);
      if ((sub_10000391C(v22, SBYTE1(v13)) & 1) == 0) {
        goto LABEL_14;
      }
      sub_100012298();
      if ((sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0) {
        goto LABEL_14;
      }

      sub_10000ED4C(a1, a2, a3, a4);
      unint64_t v17 = &OBJC_IVAR____TtC13RhizomePoster11RhizomeView_shouldGenerateNewLayout;
LABEL_12:
      if (*(double *)(v6 + v17[50]) == a5) {
        return;
      }
      goto LABEL_15;
    }
  }
  else if (!v14)
  {
    goto LABEL_12;
  }
  sub_10000ECFC(a1, a2, a3, a4);
  sub_10000ECFC(v13, v14, v15, v16);
  sub_10000ED4C(a1, a2, a3, a4);
  sub_10000ED4C(v13, v14, v15, v16);
LABEL_15:
  uint64_t v18 = *v12;
  uint64_t v19 = (void *)v12[1];
  uint64_t v20 = (void *)v12[2];
  uint64_t v21 = (void *)v12[3];
  *uint64_t v12 = a1;
  v12[1] = (uint64_t)a2;
  v12[2] = (uint64_t)a3;
  uint64_t v12[3] = (uint64_t)a4;
  sub_10000ECFC(a1, a2, a3, a4);
  sub_10000ED4C(v18, v19, v20, v21);
  *(double *)(v6 + OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__pointSize) = a5;
  sub_10001138C();
}

uint64_t sub_1000119C0()
{
  v7.receiver = v0;
  v7.super_class = (Class)swift_getObjectType();
  id v1 = objc_msgSendSuper2(&v7, "debugDescription");
  uint64_t v2 = sub_10003A6F0();

  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = 0x7265776F6C665B20;
  v8._object = (void *)0xE90000000000003DLL;
  sub_10003A740(v8);
  swift_bridgeObjectRelease();
  sub_10000316C(&qword_10004B220);
  uint64_t v3 = sub_10003A920();
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v3;
  v9._object = v5;
  sub_10003A740(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 6124656;
  v11._object = (void *)0xE300000000000000;
  sub_10003A740(v11);
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = 8251;
  v12._object = (void *)0xE200000000000000;
  sub_10003A740(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

id sub_100011B70()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RhizomeLayeredFlowerView()
{
  return self;
}

ValueMetadata *type metadata accessor for RhizomeLayeredFlowerViewStyle()
{
  return &type metadata for RhizomeLayeredFlowerViewStyle;
}

uint64_t getEnumTagSinglePayload for LayoutState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s13RhizomePoster29RhizomeLayeredFlowerViewStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100011DD8);
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

unsigned char *sub_100011E00(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RhizomeFlowerViewContext()
{
  return &type metadata for RhizomeFlowerViewContext;
}

unint64_t sub_100011E20()
{
  unint64_t result = qword_10004B208;
  if (!qword_10004B208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B208);
  }
  return result;
}

unint64_t sub_100011E78()
{
  unint64_t result = qword_10004B210;
  if (!qword_10004B210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B210);
  }
  return result;
}

void sub_100011ECC(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0) {
    sub_10001D23C(0x20000000000001uLL);
  }
  else {
    __break(1u);
  }
}

id sub_100011F4C(unsigned __int16 a1, void *a2, void *a3, void *a4, char a5, char a6, double a7)
{
  int v8 = v7;
  ObjectType = (objc_class *)swift_getObjectType();
  char v15 = a5 & 1;
  uint64_t v16 = &v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower];
  *uint64_t v16 = 0u;
  v16[1] = 0u;
  *(void *)&v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__pointSize] = 0;
  unint64_t v17 = &v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_configuration];
  *unint64_t v17 = 0;
  v17[1] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec] = 0;
  uint64_t v18 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_synchronousShadows;
  v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_synchronousShadows] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet] = 0;
  *(void *)&v8[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet] = 0;
  uint64_t v19 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView;
  id v20 = objc_allocWithZone((Class)UIImageView);
  uint64_t v21 = v8;
  *(void *)&v8[v19] = [v20 init];
  v21[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = 0;
  v21[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shouldEnableBlurs] = 0;
  v21[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] = 0;
  v8[v18] = a6;
  v21[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_context] = v15;

  v29.receiver = v21;
  v29.super_class = ObjectType;
  id v22 = objc_msgSendSuper2(&v29, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  id v23 = a2;
  id v24 = a3;
  id v25 = a4;
  sub_1000116BC(a1, a2, a3, a4, a7);

  return v22;
}

uint64_t sub_100012114(char a1, double a2, double a3)
{
  double v5 = -30.0;
  double v6 = 30.0;
  if (((1 << a1) & 0x1F00F) == 0)
  {
    if (((1 << a1) & 0xF0) != 0)
    {
      BOOL v7 = self;
      id v8 = [v7 mainScreen];
      [v8 bounds];
      double v10 = v9;

      double v11 = v10 * 0.5;
      id v12 = [v7 mainScreen];
      [v12 bounds];
      double v14 = v13;

      if (v14 * 0.5 <= a2)
      {
        BOOL v15 = v11 < a3;
        double v6 = -35.0;
        if (v11 >= a3) {
          double v6 = -135.0;
        }
        double v5 = -165.0;
        double v16 = -65.0;
      }
      else
      {
        BOOL v15 = v11 < a3;
        double v6 = 65.0;
        if (v11 >= a3) {
          double v6 = 165.0;
        }
        double v5 = 135.0;
        double v16 = 35.0;
      }
      if (v15) {
        double v5 = v16;
      }
    }
    else
    {
      double v5 = -60.0;
      double v6 = 60.0;
    }
  }
  sub_100011ECC(v5, v6);
  return CLKDegreesToRadians();
}

unint64_t sub_100012298()
{
  unint64_t result = qword_10004B218;
  if (!qword_10004B218)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004B218);
  }
  return result;
}

void sub_1000122D8()
{
  id v1 = &v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__flower];
  *id v1 = 0u;
  v1[1] = 0u;
  *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__pointSize] = 0;
  int v2 = &v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_configuration];
  *int v2 = 0;
  v2[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_layoutSpec] = 0;
  v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_synchronousShadows] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_filledLayerSet] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet] = 0;
  uint64_t v3 = OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shadowImageView;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UIImageView) init];
  v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView__shouldShowShadows] = 0;
  v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_shouldEnableBlurs] = 0;
  v0[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_activeLayerStyle] = 0;

  sub_10003AB70();
  __break(1u);
}

uint64_t destroy for RhizomePosterLayout()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RhizomePosterLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RhizomePosterLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for RhizomePosterLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomePosterLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RhizomePosterLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomePosterLayout()
{
  return &type metadata for RhizomePosterLayout;
}

void *sub_100012594(__int16 a1, uint64_t a2, unint64_t a3)
{
  char v5 = HIBYTE(a1);
  uint64_t v6 = 1819047270;
  if ((a1 & 1) == 0) {
    uint64_t v6 = 0x73736572706D6F63;
  }
  unint64_t v7 = 0xE400000000000000;
  id v25 = &type metadata for String;
  if ((a1 & 1) == 0) {
    unint64_t v7 = 0xEA00000000006465;
  }
  *(void *)&long long v24 = v6;
  *((void *)&v24 + 1) = v7;
  sub_10000F64C(&v24, v23);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100019CBC(v23, 0xD000000000000019, 0x800000010003DC50, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  if (!(a3 >> 62))
  {
    uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_7;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    id v12 = _swiftEmptyArrayStorage;
LABEL_18:
    id v25 = (void *)sub_10000316C(&qword_10004B228);
    *(void *)&long long v24 = v12;
    sub_10000F64C(&v24, v23);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_100019CBC(v23, 0xD000000000000019, 0x800000010003DC70, v16);
    swift_bridgeObjectRelease();
    uint64_t v17 = 8 * v5;
    uint64_t v18 = *(void *)&aUnity_1[v17];
    uint64_t v19 = *(void *)((char *)&unk_10003C340 + v17);
    id v25 = &type metadata for String;
    *(void *)&long long v24 = v18;
    *((void *)&v24 + 1) = v19;
    sub_10000F64C(&v24, v23);
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_100019CBC(v23, 0xD000000000000013, 0x800000010003DC90, v20);
    swift_bridgeObjectRelease();
    id v25 = &type metadata for Int;
    *(void *)&long long v24 = a2;
    sub_10000F64C(&v24, v23);
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_100019CBC(v23, 0xD000000000000016, 0x800000010003DCB0, v21);
    swift_bridgeObjectRelease();
    return &_swiftEmptyDictionarySingleton;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10003AB80();
  if (!v9) {
    goto LABEL_17;
  }
LABEL_7:
  *(void *)&long long v24 = _swiftEmptyArrayStorage;
  unint64_t result = (void *)sub_100017604(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v22 = a2;
    uint64_t v11 = 0;
    id v12 = (void *)v24;
    do
    {
      if ((a3 & 0xC000000000000001) != 0) {
        sub_10003AA90();
      }
      else {
        swift_retain();
      }
      double v13 = sub_10000EE58();
      swift_release();
      *(void *)&long long v24 = v12;
      unint64_t v15 = v12[2];
      unint64_t v14 = v12[3];
      if (v15 >= v14 >> 1)
      {
        sub_100017604(v14 > 1, v15 + 1, 1);
        id v12 = (void *)v24;
      }
      ++v11;
      v12[2] = v15 + 1;
      v12[v15 + 4] = v13;
    }
    while (v9 != v11);
    swift_bridgeObjectRelease();
    a2 = v22;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000128E4(void *a1, __int16 a2, uint64_t a3, unint64_t a4)
{
  char v5 = a2;
  uint64_t v6 = a1;
  int v7 = HIBYTE(a2);
  if (sub_10000391C((char)a1, SHIBYTE(a2)))
  {
    swift_bridgeObjectRetain();
    LODWORD(v6) = v7;
    return v5 & 1u | (v6 << 8);
  }
  if (!(a4 >> 62))
  {
    uint64_t v8 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_5;
    }
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    id v30 = [self mainScreen];
    [v30 bounds];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v43.origin.x = v32;
    v43.origin.y = v34;
    v43.size.double width = v36;
    v43.size.double height = v38;
    CGRectGetHeight(v43);
    return v5 & 1u | (v6 << 8);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10003AB80();
  uint64_t v8 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_5:
  if (v8 >= 1)
  {
    char v39 = v5;
    uint64_t v10 = 0;
    unint64_t v40 = a4 & 0xC000000000000001;
    uint64_t v41 = v8;
    unint64_t v42 = a4;
    do
    {
      if (v40)
      {
        uint64_t v11 = sub_10003AA90();
      }
      else
      {
        uint64_t v11 = *(void *)(a4 + 8 * v10 + 32);
        swift_retain();
      }
      double v12 = *(double *)(v11 + 56);
      double v13 = *(double *)(v11 + 64);
      double v14 = *(double *)(v11 + 136);
      double v15 = *(double *)(v11 + 144);
      char v16 = *(unsigned char *)(v11 + 96);
      uint64_t v17 = v6;
      uint64_t v18 = (void *)sub_1000385B0(v16, v6);
      char v20 = v19;
      uint64_t v22 = v21;
      double v23 = *(double *)(v11 + 104);
      double v24 = *(double *)(v11 + 112);
      char v25 = *(unsigned char *)(v11 + 128);
      char v26 = *(unsigned char *)(v11 + 129);
      type metadata accessor for RhizomeLayoutSpec();
      swift_allocObject();
      sub_100035E14((uint64_t)v18, (uint64_t)v20, (uint64_t)v22, v16, v12, v13, v14, v15, v23, v24, 0, 0, v25, v26);
      id v27 = v18;
      id v28 = v20;
      id v29 = v22;
      swift_retain();
      sub_10003A770();
      if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10003A7C0();
      }
      ++v10;
      sub_10003A7E0();
      sub_10003A7B0();
      swift_release();
      swift_release();

      a4 = v42;
      uint64_t v6 = v17;
    }
    while (v41 != v10);
    swift_bridgeObjectRelease();
    char v5 = v39;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100012BDC(int a1, uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  LODWORD(v5) = a1;
  unint64_t v121 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v115 = sub_1000155D0(a1 & 0xFFFFFF01, a2, a3);
  unint64_t v6 = sub_10001D23C(2uLL);
  unint64_t v120 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v7 = v4 >> 62;
  if (v4 >> 62) {
    goto LABEL_95;
  }
  uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v117 = v4;
    uint64_t v108 = v7;
    if (v8) {
      break;
    }
    swift_bridgeObjectRelease();
    uint64_t v3 = _swiftEmptyArrayStorage;
    unint64_t v19 = v6 + 3;
    if (((v6 + 3) & 0x8000000000000000) == 0) {
      goto LABEL_13;
    }
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_10003AB80();
  }
  v123[0] = _swiftEmptyArrayStorage;
  sub_10001766C(0, v8 & ~(v8 >> 63), 0);
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_97;
  }
  unint64_t v111 = v6;
  int v114 = v5;
  uint64_t v9 = 0;
  uint64_t v3 = (void *)v123[0];
  unint64_t v10 = v4 & 0xC000000000000001;
  do
  {
    if (v10)
    {
      uint64_t v11 = sub_10003AA90();
    }
    else
    {
      uint64_t v11 = *(void *)(v4 + 8 * v9 + 32);
      swift_retain();
    }
    double v12 = *(void **)(v11 + 80);
    double v13 = *(void **)(v11 + 88);
    id v14 = *(id *)(v11 + 72);
    id v15 = v12;
    id v16 = v13;
    swift_release();
    v123[0] = v3;
    uint64_t v7 = v3[2];
    unint64_t v17 = v3[3];
    if (v7 >= v17 >> 1)
    {
      sub_10001766C(v17 > 1, v7 + 1, 1);
      uint64_t v3 = (void *)v123[0];
    }
    ++v9;
    v3[2] = v7 + 1;
    uint64_t v18 = &v3[3 * v7];
    v18[4] = v14;
    v18[5] = v15;
    v18[6] = v16;
    unint64_t v4 = v117;
  }
  while (v8 != v9);
  swift_bridgeObjectRelease();
  LODWORD(v5) = v114;
  unint64_t v6 = v111;
  unint64_t v19 = v111 + 3;
  if (((v111 + 3) & 0x8000000000000000) != 0) {
    goto LABEL_89;
  }
LABEL_13:
  int v114 = v5 & 0xFFFFFF00;
  if (v19)
  {
    uint64_t v20 = 0;
    unint64_t v110 = v19;
    uint64_t v112 = v115 ^ 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = (uint64_t)"port.RhizomePoster";
    char v109 = BYTE1(v5);
    do
    {
      if (v20 == v19) {
        goto LABEL_90;
      }
      if (v20 == v112) {
        goto LABEL_91;
      }
      swift_bridgeObjectRetain();
      unint64_t v21 = swift_bridgeObjectRetain();
      sub_10000D96C(v21);
      unint64_t v22 = v4;
      v119[0] = (uint64_t)_swiftEmptyArrayStorage;
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        unint64_t v4 = sub_10003AB80();
        swift_bridgeObjectRelease();
        if (v4)
        {
LABEL_19:
          if ((uint64_t)v4 >= 1)
          {
            unint64_t v6 = 0;
            unint64_t v5 = v22 & 0xC000000000000001;
            while (2)
            {
              if (v5)
              {
                uint64_t v23 = sub_10003AA90();
              }
              else
              {
                uint64_t v23 = *(void *)(v22 + 8 * v6 + 32);
                swift_retain();
              }
              switch(*(unsigned char *)(v23 + 96))
              {
                case 4:
                case 5:
                case 6:
                case 7:
                  swift_bridgeObjectRelease();
                  goto LABEL_22;
                default:
                  char v24 = sub_10003AC40();
                  swift_bridgeObjectRelease();
                  if (v24)
                  {
LABEL_22:
                    sub_10003AAC0();
                    sub_10003AAF0();
                    sub_10003AB00();
                    sub_10003AAD0();
                  }
                  else
                  {
                    swift_release();
                  }
                  if (v4 != ++v6) {
                    continue;
                  }
                  swift_bridgeObjectRelease();
                  uint64_t v25 = v119[0];
                  if (v119[0] < 0) {
                    goto LABEL_58;
                  }
                  goto LABEL_34;
              }
            }
          }
          goto LABEL_92;
        }
      }
      else
      {
        unint64_t v4 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v4) {
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = (uint64_t)_swiftEmptyArrayStorage;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0)
      {
LABEL_34:
        if ((v25 & 0x4000000000000000) == 0)
        {
          uint64_t v26 = *(void *)(v25 + 16);
          goto LABEL_36;
        }
      }
LABEL_58:
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_10003AB80();
      swift_release();
LABEL_36:
      swift_release();
      if (v26 >= 2)
      {
        unsigned __int8 v28 = sub_10001ED64();
      }
      else
      {
        unint64_t v27 = sub_10001D23C(0x11uLL);
        if ((v27 & 0x8000000000000000) != 0) {
          goto LABEL_93;
        }
        if (v27 >= 0x11) {
          goto LABEL_94;
        }
        unsigned __int8 v28 = *((unsigned char *)&off_100045218 + v27 + 32);
      }
      ++v20;
      ++v115;
      char v29 = 1;
      switch(v28)
      {
        case 4u:
        case 5u:
        case 6u:
        case 7u:
          break;
        default:
          char v29 = sub_10003AC40();
          break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      id v30 = (void *)sub_1000388F0(v28, (unint64_t)v3, v109);
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      swift_bridgeObjectRelease();
      id v35 = v30;
      id v36 = v32;
      id v37 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_100015728(0, v3[2] + 1, 1, v3);
      }
      unint64_t v39 = v3[2];
      unint64_t v38 = v3[3];
      if (v39 >= v38 >> 1) {
        uint64_t v3 = sub_100015728((void *)(v38 > 1), v39 + 1, 1, v3);
      }
      v3[2] = v39 + 1;
      unint64_t v40 = &v3[3 * v39];
      v40[4] = v35;
      v40[5] = v36;
      v40[6] = v37;
      uint64_t v41 = qword_10004AD30;
      id v42 = v35;
      id v43 = v36;
      id v44 = v37;
      if (v41 != -1) {
        swift_once();
      }
      sub_100007928(0, v114 | v28, v42, v43, v44, (uint64_t)v122, *(double *)&qword_10004D180);
      uint64_t v45 = sub_100005530((uint64_t)v122, (uint64_t)v123);
      if (v123[1])
      {
        double v47 = *(double *)&v123[7];
        double v46 = *(double *)&v123[8];
        uint64_t v45 = sub_100005598((uint64_t)v122);
        if ((v29 & 1) == 0) {
          goto LABEL_53;
        }
      }
      else
      {
        double v46 = 0.0;
        double v47 = 0.0;
        if ((v29 & 1) == 0)
        {
LABEL_53:
          sub_10001F1D4(v45, v46);
          goto LABEL_54;
        }
      }
      sub_10001F538(0, v47, v46);
LABEL_54:
      double v50 = v48;
      double v51 = v49;
      sub_100012114(v28, v48, v49);
      double v53 = v52;
      double v54 = *(double *)&qword_10004D180;
      type metadata accessor for RhizomeLayoutSpec();
      swift_allocObject();
      LODWORD(v5) = sub_100035E14((uint64_t)v42, (uint64_t)v43, (uint64_t)v44, v28, v47, v46, v50, v51, v53, v54, 0, v115, 0, (v29 & 1) == 0);
      id v55 = v42;
      id v56 = v43;
      id v57 = v44;
      swift_retain();
      sub_10003A770();
      unint64_t v6 = *(void *)((v120 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6 >= *(void *)((v120 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10003A7C0();
      }
      sub_10003A7E0();
      sub_10003A7B0();
      swift_release();

      unint64_t v19 = v110;
      unint64_t v4 = v117;
    }
    while (v20 != v110);
  }
  swift_bridgeObjectRelease();
  if (qword_10004AC88 != -1) {
    swift_once();
  }
  uint64_t v58 = sub_10003A5F0();
  sub_10000325C(v58, (uint64_t)qword_10004D098);
  uint64_t v7 = sub_10003A5D0();
  LOBYTE(v5) = sub_10003A850();
  if (!os_log_type_enabled((os_log_t)v7, (os_log_type_t)v5))
  {

    goto LABEL_66;
  }
  uint64_t v3 = (void *)swift_slowAlloc();
  v119[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v3 = 134218242;
  swift_beginAccess();
  if (v120 >> 62) {
    goto LABEL_98;
  }
  uint64_t v59 = *(void *)((v120 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v118 = v59;
    sub_10003A940();
    *((_WORD *)v3 + 6) = 2080;
    type metadata accessor for RhizomeLayoutSpec();
    swift_bridgeObjectRetain();
    uint64_t v60 = sub_10003A7A0();
    unint64_t v62 = v61;
    swift_bridgeObjectRelease();
    uint64_t v118 = sub_10000E014(v60, v62, v119);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, (os_log_type_t)v5, "Offscreen layout specs before refinement. Count: %ld specs: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v4 = v117;
LABEL_66:
    swift_beginAccess();
    unint64_t v63 = v120;
    uint64_t v64 = qword_10004ACB0;
    swift_bridgeObjectRetain();
    if (v64 != -1) {
      swift_once();
    }
    double v65 = -*(double *)&qword_10004D0F8;
    if (qword_10004ACC0 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_100028DA8(v63, 3, v65, *(double *)&qword_10004D108 * -2.0);
    swift_bridgeObjectRelease();
    unint64_t v120 = v66;
    swift_bridgeObjectRelease();
    id v67 = sub_10003A5D0();
    uint64_t v3 = (void *)sub_10003A850();
    if (os_log_type_enabled(v67, (os_log_type_t)v3))
    {
      uint64_t v68 = swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      LOBYTE(v5) = v69;
      uint64_t v118 = v69;
      *(_DWORD *)uint64_t v68 = 134218242;
      if (v120 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_10003AB80();
        swift_bridgeObjectRelease();
      }
      sub_10003A940();
      *(_WORD *)(v68 + 12) = 2080;
      type metadata accessor for RhizomeLayoutSpec();
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_10003A7A0();
      unint64_t v72 = v71;
      swift_bridgeObjectRelease();
      sub_10000E014(v70, v72, &v118);
      sub_10003A940();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v3, "Offscreen layout specs after refinement.  Count: %ld specs: %s", (uint8_t *)v68, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v4 = v117;
    }
    else
    {
    }
    unint64_t v73 = swift_bridgeObjectRetain();
    sub_10000D96C(v73);
    if (v108)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_10003AB80();
      if (!v7) {
        goto LABEL_87;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v7) {
        goto LABEL_87;
      }
    }
    if (v7 >= 1) {
      break;
    }
LABEL_97:
    __break(1u);
LABEL_98:
    swift_bridgeObjectRetain();
    uint64_t v59 = sub_10003AB80();
    swift_bridgeObjectRelease();
  }
  uint64_t v74 = 0;
  unint64_t v116 = v4 & 0xC000000000000001;
  __asm { FMOV            V0.2D, #-0.5 }
  float64x2_t v113 = _Q0;
  do
  {
    if (v116)
    {
      uint64_t v80 = sub_10003AA90();
    }
    else
    {
      uint64_t v80 = *(void *)(v4 + 8 * v74 + 32);
      swift_retain();
    }
    uint64_t v81 = *(void *)(v80 + 136);
    double v82 = *(double *)(v80 + 144) + *(double *)&qword_10004D0F8;
    uint64_t v83 = *(void *)(v80 + 56);
    uint64_t v84 = *(void *)(v80 + 64);
    unint64_t v86 = *(void **)(v80 + 72);
    double v85 = *(void **)(v80 + 80);
    long long v87 = *(void **)(v80 + 88);
    char v88 = *(unsigned char *)(v80 + 96);
    uint64_t v89 = *(void *)(v80 + 104);
    uint64_t v90 = *(void *)(v80 + 112);
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    uint64_t v92 = *(void *)(v80 + 120);
    type metadata accessor for RhizomeLayoutSpec();
    uint64_t v93 = swift_allocObject();
    *(_OWORD *)(v93 + 16) = 0u;
    *(_OWORD *)(v93 + 32) = 0u;
    *(void *)(v93 + 48) = 0;
    swift_unknownObjectWeakInit();
    *(void *)(v93 + 56) = v83;
    *(void *)(v93 + 64) = v84;
    *(void *)(v93 + 136) = v81;
    *(double *)(v93 + 144) = v82;
    *(void *)(v93 + 72) = v86;
    *(void *)(v93 + 80) = v85;
    *(void *)(v93 + 88) = v87;
    *(void *)(v93 + 104) = v89;
    swift_unknownObjectWeakAssign();
    id v94 = v86;
    id v95 = v85;
    id v96 = v87;

    *(unsigned char *)(v93 + 96) = v88;
    *(void *)(v93 + 120) = v92;
    *(_WORD *)(v93 + 128) = 256;
    *(void *)(v93 + 112) = v90;
    float64x2_t v97 = *(float64x2_t *)(v93 + 56);
    *(void *)(v93 + 16) = *(_OWORD *)&vmulq_laneq_f64(v97, v97, 1);
    *(float64x2_t *)(v93 + 24) = vaddq_f64(*(float64x2_t *)(v93 + 136), vmulq_f64(v97, v113));
    *(float64x2_t *)(v93 + 40) = v97;
    swift_retain();
    sub_10003A770();
    if (*(void *)((v121 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v121 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10003A7C0();
    }
    ++v74;
    sub_10003A7E0();
    sub_10003A7B0();
    swift_release();
    swift_release();
    unint64_t v4 = v117;
  }
  while (v7 != v74);
LABEL_87:
  swift_bridgeObjectRelease();
  id v98 = [self mainScreen];
  [v98 bounds];
  CGFloat v100 = v99;
  CGFloat v102 = v101;
  CGFloat v104 = v103;
  CGFloat v106 = v105;

  v124.origin.x = v100;
  v124.origin.y = v102;
  v124.size.double width = v104;
  v124.size.double height = v106;
  CGRectGetHeight(v124);
  swift_bridgeObjectRelease();
  return v114 | 1u;
}

CGFloat sub_100013AE4()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.double width = v6;
  v10.size.double height = v8;
  CGFloat result = CGRectGetHeight(v10) / 3.0;
  qword_10004D0F8 = *(void *)&result;
  return result;
}

CGFloat sub_100013B78()
{
  id v0 = [self mainScreen];
  [v0 bounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;

  v10.origin.x = v2;
  v10.origin.y = v4;
  v10.size.double width = v6;
  v10.size.double height = v8;
  CGFloat result = CGRectGetHeight(v10) / 7.0;
  qword_10004D100 = *(void *)&result;
  return result;
}

double sub_100013C0C()
{
  if (qword_10004ACB8 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_10004D100 * 0.5;
  *(double *)&qword_10004D108 = *(double *)&qword_10004D100 * 0.5;
  return result;
}

void sub_100013C68(uint64_t a1)
{
}

void sub_100013C88(uint64_t a1)
{
}

void sub_100013CA8(uint64_t a1, double (*a2)(double, double, double, double), double *a3)
{
  id v5 = [self mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  *a3 = a2(v7, v9, v11, v13);
}

uint64_t sub_100013D44(char a1)
{
  if (a1) {
    return 1819047270;
  }
  else {
    return 0x73736572706D6F63;
  }
}

uint64_t sub_100013D78(char *a1, char *a2)
{
  return sub_10000387C(*a1, *a2);
}

Swift::Int sub_100013D84()
{
  return sub_100003C48();
}

uint64_t sub_100013D8C()
{
  return sub_100003E48();
}

Swift::Int sub_100013D94()
{
  return sub_100004030();
}

uint64_t sub_100013D9C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  double v3 = (void *)a1[1];
  v4._rawValue = &off_100045178;
  v8._object = v3;
  Swift::Int v5 = sub_10003ABF0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_100013DFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013D44(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100013E28()
{
  qword_10004D120 = (uint64_t)&off_1000452A0;
}

void sub_100013E3C()
{
  qword_10004D128 = (uint64_t)&off_1000452D0;
}

void sub_100013E50()
{
  qword_10004D130 = (uint64_t)&off_1000452F8;
}

void sub_100013E64()
{
  qword_10004D138 = (uint64_t)&off_100045380;
}

unint64_t sub_100013E78(unint64_t result, unint64_t a2)
{
  if (result == a2) {
    return result;
  }
  unint64_t v4 = result;
  unint64_t v5 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      unint64_t v6 = *(void *)(v5 + 8 * result + 32);
      uint64_t result = swift_retain();
      if ((v5 & 0xC000000000000001) == 0) {
        goto LABEL_6;
      }
LABEL_23:
      uint64_t v7 = sub_10003AA90();
      unint64_t v5 = *v2;
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_26;
  }
  uint64_t result = sub_10003AA90();
  unint64_t v6 = result;
  unint64_t v5 = *v2;
  if ((*v2 & 0xC000000000000001) != 0) {
    goto LABEL_23;
  }
LABEL_6:
  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v7 = *(void *)(v5 + 8 * a2 + 32);
  swift_retain();
LABEL_9:
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *CGFloat v2 = v5;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v5 & 0x8000000000000000) != 0
    || (v5 & 0x4000000000000000) != 0)
  {
    unint64_t v5 = sub_10001E564(v5);
    *CGFloat v2 = v5;
  }
  *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 8 * v4 + 0x20) = v7;
  swift_release();
  sub_10003A7B0();
  unint64_t v9 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *CGFloat v2 = v9;
  if (!result || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_10001E564(v9);
    unint64_t v9 = result;
    *CGFloat v2 = result;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_28;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * a2 + 0x20) = v6;
  swift_release();
  return sub_10003A7B0();
}

uint64_t sub_100014010(uint64_t a1)
{
  uint64_t v1 = a1 + 64;
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = 1 << v2;
  uint64_t v4 = -1;
  if (1 << v2 < 64) {
    uint64_t v4 = ~(-1 << (1 << v2));
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = __clz(__rbit64(v5));
    unint64_t v8 = (v5 - 1) & v5;
    int64_t v9 = (unint64_t)(v3 + 63) >> 6;
  }
  else
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 <= 6) {
      return 0;
    }
    int64_t v9 = (unint64_t)(v3 + 63) >> 6;
    unint64_t v18 = *(void *)(a1 + 72);
    if (v18)
    {
      uint64_t v6 = 1;
    }
    else
    {
      if (v6 < 8) {
        return 0;
      }
      unint64_t v18 = *(void *)(a1 + 80);
      if (v18)
      {
        uint64_t v6 = 2;
      }
      else
      {
        unint64_t v18 = *(void *)(a1 + 88);
        if (v18)
        {
          uint64_t v6 = 3;
        }
        else
        {
LABEL_37:
          if (v6 < 9) {
            return 0;
          }
          unint64_t v18 = *(void *)(a1 + 96);
          if (v18)
          {
            uint64_t v6 = 4;
          }
          else
          {
            unint64_t v18 = *(void *)(a1 + 104);
            if (!v18) {
              goto LABEL_43;
            }
            uint64_t v6 = 5;
          }
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v18 - 1) & v18;
    unint64_t v7 = __clz(__rbit64(v18)) + (v6 << 6);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  double v11 = *(double *)(v10 + 8 * v7);
  while (v8)
  {
    unint64_t v12 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_7:
    if (v11 < *(double *)(v10 + 8 * v13)) {
      double v11 = *(double *)(v10 + 8 * v13);
    }
  }
  int64_t v14 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v14 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v14);
  ++v6;
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 1;
  if (v14 + 1 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 2;
  if (v14 + 2 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 3;
  if (v14 + 3 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15)
  {
LABEL_25:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v16);
  if (v15)
  {
    uint64_t v6 = v16;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v9) {
      return *(void *)&v11;
    }
    unint64_t v15 = *(void *)(v1 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_43:
  uint64_t v19 = 0;
  uint64_t v20 = 6;
  if (v9 > 6) {
    uint64_t v20 = v9;
  }
  uint64_t v21 = v20 - 6;
  while (v21 != v19)
  {
    unint64_t v18 = *(void *)(a1 + 112 + 8 * v19++);
    if (v18)
    {
      uint64_t v6 = v19 + 5;
      goto LABEL_30;
    }
  }
  return 0;
}

BOOL sub_10001420C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  switch(*(unsigned char *)(*a1 + 96))
  {
    case 4:
    case 5:
    case 6:
    case 7:
      swift_bridgeObjectRelease();
      BOOL result = 0;
      break;
    default:
      char v6 = sub_10003AC40();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if ((v6 & 1) == 0)
      {
        switch(*(unsigned char *)(v4 + 96))
        {
          case 4:
          case 5:
          case 6:
          case 7:
            swift_bridgeObjectRelease();
            BOOL result = 1;
            break;
          default:
            char v8 = sub_10003AC40();
            swift_bridgeObjectRelease();
            if (v8) {
              goto LABEL_11;
            }
            if ((a3 & 0xC000000000000001) != 0)
            {
              uint64_t v9 = sub_10003AA90();
            }
            else
            {
              if (!*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                __break(1u);
                JUMPOUT(0x10001448CLL);
              }
              uint64_t v9 = *(void *)(a3 + 32);
              swift_retain();
            }
            BOOL v10 = sub_100035CE8(v3, v9);
            swift_release();
            if (v10)
            {
LABEL_11:
              BOOL result = 1;
            }
            else
            {
              if ((a3 & 0xC000000000000001) != 0)
              {
                uint64_t v11 = sub_10003AA90();
              }
              else
              {
                uint64_t v11 = *(void *)(a3 + 32);
                swift_retain();
              }
              BOOL v12 = sub_100035CE8(v4, v11);
              swift_release();
              BOOL result = !v12 && *(double *)(v4 + 16) < *(double *)(v3 + 16);
            }
            break;
        }
      }
      break;
  }
  return result;
}

uint64_t sub_100014514(uint64_t a1, int a2, double a3, uint64_t a4, uint64_t a5)
{
  double v5 = a3;
  uint64_t v6 = a5;
  if (a1 == 2)
  {
    double v8 = 0.0;
    if (a5 < 0) {
      goto LABEL_32;
    }
  }
  else
  {
    if (a1 == 3)
    {
      double v8 = a3;
    }
    else
    {
      if (a1 != 4)
      {
        double v5 = -a3;
        double v8 = 0.0;
        if (a5 < 0) {
          goto LABEL_32;
        }
        goto LABEL_11;
      }
      double v8 = -a3;
    }
    double v5 = 0.0;
    if (a5 < 0)
    {
LABEL_32:
      swift_bridgeObjectRetain();
      uint64_t result = sub_10003AB80();
      uint64_t v9 = result;
      if (!result) {
        goto LABEL_33;
      }
      goto LABEL_13;
    }
  }
LABEL_11:
  if ((a5 & 0x4000000000000000) != 0) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v9)
  {
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    id v61 = [self mainScreen];
    [v61 bounds];
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    CGFloat v67 = v66;
    CGFloat v69 = v68;

    v74.origin.x = v63;
    v74.origin.y = v65;
    v74.size.double width = v67;
    v74.size.double height = v69;
    CGRectGetHeight(v74);
    return a2 & 0xFFFFFF00;
  }
LABEL_13:
  if (v9 >= 1)
  {
    int v70 = a2;
    uint64_t v73 = v6;
    if ((v6 & 0xC000000000000001) != 0)
    {
      uint64_t v11 = 0;
      __asm { FMOV            V0.2D, #-0.5 }
      float64x2_t v71 = _Q0;
      do
      {
        uint64_t v17 = sub_10003AA90();
        double v18 = *(double *)(v17 + 136);
        double v19 = *(double *)(v17 + 144);
        uint64_t v20 = *(void *)(v17 + 56);
        uint64_t v21 = *(void *)(v17 + 64);
        unint64_t v22 = *(void **)(v17 + 72);
        uint64_t v23 = *(void **)(v17 + 80);
        char v24 = *(void **)(v17 + 88);
        char v25 = *(unsigned char *)(v17 + 96);
        uint64_t v27 = *(void *)(v17 + 104);
        uint64_t v26 = *(void *)(v17 + 112);
        uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
        if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
        {
          id v35 = v22;
          id v36 = v23;
          id v37 = v24;
          swift_bridgeObjectRetain();
          uint64_t v29 = sub_10003AB80();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v29 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
          id v30 = v22;
          id v31 = v23;
          id v32 = v24;
        }
        type metadata accessor for RhizomeLayoutSpec();
        uint64_t v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = 0u;
        *(_OWORD *)(v33 + 32) = 0u;
        *(void *)(v33 + 48) = 0;
        swift_unknownObjectWeakInit();
        *(void *)(v33 + 56) = v20;
        *(void *)(v33 + 64) = v21;
        *(double *)(v33 + 136) = v8 + v18;
        *(double *)(v33 + 144) = v5 + v19;
        *(void *)(v33 + 72) = v22;
        *(void *)(v33 + 80) = v23;
        *(void *)(v33 + 88) = v24;
        *(void *)(v33 + 104) = v27;
        swift_unknownObjectWeakAssign();

        *(unsigned char *)(v33 + 96) = v25;
        *(void *)(v33 + 120) = v29;
        *(_WORD *)(v33 + 128) = 256;
        *(void *)(v33 + 112) = v26;
        float64x2_t v34 = *(float64x2_t *)(v33 + 56);
        *(void *)(v33 + 16) = *(_OWORD *)&vmulq_laneq_f64(v34, v34, 1);
        *(float64x2_t *)(v33 + 24) = vaddq_f64(*(float64x2_t *)(v33 + 136), vmulq_f64(v34, v71));
        *(float64x2_t *)(v33 + 40) = v34;
        swift_retain();
        sub_10003A770();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10003A7C0();
        }
        ++v11;
        sub_10003A7E0();
        sub_10003A7B0();
        swift_unknownObjectRelease();
        swift_release();
      }
      while (v9 != v11);
    }
    else
    {
      uint64_t v38 = 0;
      __asm { FMOV            V0.2D, #-0.5 }
      float64x2_t v72 = _Q0;
      do
      {
        uint64_t v40 = *(void *)(v6 + 8 * v38 + 32);
        double v41 = *(double *)(v40 + 136);
        double v42 = *(double *)(v40 + 144);
        uint64_t v43 = *(void *)(v40 + 56);
        uint64_t v44 = *(void *)(v40 + 64);
        uint64_t v45 = *(void **)(v40 + 72);
        double v46 = *(void **)(v40 + 80);
        double v47 = *(void **)(v40 + 88);
        char v48 = *(unsigned char *)(v40 + 96);
        uint64_t v50 = *(void *)(v40 + 104);
        uint64_t v49 = *(void *)(v40 + 112);
        double v51 = (void *)swift_unknownObjectWeakLoadStrong();
        if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
        {
          swift_retain();
          id v58 = v45;
          id v59 = v46;
          id v60 = v47;
          swift_bridgeObjectRetain();
          uint64_t v52 = sub_10003AB80();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v52 = *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_retain();
          id v53 = v45;
          id v54 = v46;
          id v55 = v47;
        }
        type metadata accessor for RhizomeLayoutSpec();
        uint64_t v56 = swift_allocObject();
        *(_OWORD *)(v56 + 16) = 0u;
        *(_OWORD *)(v56 + 32) = 0u;
        *(void *)(v56 + 48) = 0;
        swift_unknownObjectWeakInit();
        *(void *)(v56 + 56) = v43;
        *(void *)(v56 + 64) = v44;
        *(double *)(v56 + 136) = v8 + v41;
        *(double *)(v56 + 144) = v5 + v42;
        *(void *)(v56 + 72) = v45;
        *(void *)(v56 + 80) = v46;
        *(void *)(v56 + 88) = v47;
        *(void *)(v56 + 104) = v50;
        swift_unknownObjectWeakAssign();

        *(unsigned char *)(v56 + 96) = v48;
        *(void *)(v56 + 120) = v52;
        *(_WORD *)(v56 + 128) = 256;
        *(void *)(v56 + 112) = v49;
        float64x2_t v57 = *(float64x2_t *)(v56 + 56);
        *(void *)(v56 + 16) = *(_OWORD *)&vmulq_laneq_f64(v57, v57, 1);
        *(float64x2_t *)(v56 + 24) = vaddq_f64(*(float64x2_t *)(v56 + 136), vmulq_f64(v57, v72));
        *(float64x2_t *)(v56 + 40) = v57;
        swift_retain();
        sub_10003A770();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10003A7C0();
        }
        ++v38;
        sub_10003A7E0();
        sub_10003A7B0();
        swift_release();
        swift_release();
        uint64_t v6 = v73;
      }
      while (v9 != v38);
    }
    swift_bridgeObjectRelease();
    a2 = v70;
    goto LABEL_34;
  }
  __break(1u);
  return result;
}

uint64_t sub_100014A18(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  unint64_t v90 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v6 = a4 >> 62;
  if (a4 >> 62)
  {
    unint64_t v83 = swift_bridgeObjectRetain();
    uint64_t v7 = (uint64_t)sub_10001B494(v83);
  }
  else
  {
    uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  uint64_t v89 = v7;
  sub_10001B338(&v89, (void (*)(void *))sub_10001B58C);
  swift_bridgeObjectRelease();
  uint64_t v8 = v89;
  BOOL v9 = v89 < 0 || (v89 & 0x4000000000000000) != 0;
  if (!v9)
  {
    uint64_t v10 = *(void *)(v89 + 16);
    uint64_t v11 = -v10;
    if (!__OFSUB__(0, v10)) {
      goto LABEL_8;
    }
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10003AB80();
  swift_release();
  uint64_t v11 = -v10;
  if (__OFSUB__(0, v10)) {
    goto LABEL_61;
  }
LABEL_8:
  int v84 = a2;
  if ((unint64_t)(v11 + 1) >= 2)
  {
    uint64_t v12 = v10 - 2;
    if (__OFSUB__(v10, 2))
    {
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v10 < v12)
    {
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
    if (v9)
    {
LABEL_11:
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_10003AB80();
      swift_release();
      goto LABEL_16;
    }
  }
  else
  {
    if (v10 < 0)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    uint64_t v12 = 0;
    if (v9) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = *(void *)(v8 + 16);
LABEL_16:
  if (v13 < v12)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (v12 < 0)
  {
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_10003AB80();
    swift_release();
  }
  else
  {
    uint64_t v14 = *(void *)(v8 + 16);
  }
  if (v14 < v10) {
    goto LABEL_64;
  }
  if (v10 < 0)
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if ((v8 & 0xC000000000000001) == 0 || v12 == v10) {
    goto LABEL_28;
  }
  if (v12 < (unint64_t)v10)
  {
    type metadata accessor for RhizomeLayoutSpec();
    Swift::Int v15 = v12;
    do
    {
      Swift::Int v16 = v15 + 1;
      sub_10003AA80(v15);
      Swift::Int v15 = v16;
    }
    while (v10 != v16);
LABEL_28:
    if (v9)
    {
      swift_bridgeObjectRetain();
      sub_10003AB90();
      uint64_t v18 = v17;
      uint64_t v12 = v19;
      unint64_t v21 = v20;
      swift_release_n();
    }
    else
    {
      uint64_t v18 = v8 + 32;
      unint64_t v21 = (2 * v10) | 1;
    }
    uint64_t v86 = sub_10001EBB8(v18, v12, v21);
    swift_unknownObjectRelease();
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_10003AB80();
      if (v22)
      {
LABEL_33:
        if (v22 >= 1)
        {
          uint64_t v23 = 0;
          unint64_t v87 = v4 & 0xC000000000000001;
          __asm { FMOV            V0.2D, #-0.5 }
          float64x2_t v85 = _Q0;
          unint64_t v88 = v4;
          do
          {
            if (v87)
            {
              uint64_t v29 = sub_10003AA90();
            }
            else
            {
              uint64_t v29 = *(void *)(v4 + 8 * v23 + 32);
              swift_retain();
            }
            double v30 = *(double *)(v29 + 144);
            if (v30 <= 0.0)
            {
              uint64_t v51 = *(void *)(v29 + 56);
              uint64_t v52 = *(void *)(v29 + 64);
              uint64_t v53 = *(void *)(v29 + 136);
              id v54 = *(void **)(v29 + 72);
              id v55 = *(void **)(v29 + 80);
              uint64_t v56 = *(void **)(v29 + 88);
              char v57 = *(unsigned char *)(v29 + 96);
              uint64_t v58 = *(void *)(v29 + 104);
              uint64_t v59 = *(void *)(v29 + 112);
              uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
              if (v90 >> 62)
              {
                id v70 = v54;
                id v71 = v55;
                id v72 = v56;
                swift_bridgeObjectRetain();
                uint64_t v61 = sub_10003AB80();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v61 = *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10);
                id v62 = v54;
                id v63 = v55;
                id v64 = v56;
              }
              type metadata accessor for RhizomeLayoutSpec();
              uint64_t v65 = swift_allocObject();
              *(_OWORD *)(v65 + 16) = 0u;
              *(_OWORD *)(v65 + 32) = 0u;
              *(void *)(v65 + 48) = 0;
              swift_unknownObjectWeakInit();
              *(void *)(v65 + 56) = v51;
              *(void *)(v65 + 64) = v52;
              *(void *)(v65 + 136) = v53;
              *(double *)(v65 + 144) = v30;
              *(void *)(v65 + 72) = v54;
              *(void *)(v65 + 80) = v55;
              *(void *)(v65 + 88) = v56;
              *(void *)(v65 + 104) = v58;
              swift_unknownObjectWeakAssign();

              *(unsigned char *)(v65 + 96) = v57;
              *(void *)(v65 + 120) = v61;
              *(_WORD *)(v65 + 128) = 256;
              *(void *)(v65 + 112) = v59;
              float64x2_t v66 = *(float64x2_t *)(v65 + 56);
              *(void *)(v65 + 16) = *(_OWORD *)&vmulq_laneq_f64(v66, v66, 1);
              *(float64x2_t *)(v65 + 24) = vaddq_f64(*(float64x2_t *)(v65 + 136), vmulq_f64(v66, v85));
              *(float64x2_t *)(v65 + 40) = v66;
            }
            else
            {
              if (sub_1000151F8(v29, v86)) {
                double v31 = 0.75;
              }
              else {
                double v31 = 0.55;
              }
              uint64_t v32 = *(void *)(v29 + 136);
              double v33 = *(double *)(v29 + 144);
              double v34 = *(double *)(v29 + 56);
              double v35 = *(double *)(v29 + 64);
              id v36 = *(void **)(v29 + 72);
              id v37 = *(void **)(v29 + 80);
              uint64_t v38 = *(void **)(v29 + 88);
              char v39 = *(unsigned char *)(v29 + 96);
              uint64_t v40 = *(void *)(v29 + 104);
              double v41 = (void *)swift_unknownObjectWeakLoadStrong();
              if (v90 >> 62)
              {
                id v67 = v36;
                id v68 = v37;
                id v69 = v38;
                swift_bridgeObjectRetain();
                uint64_t v42 = sub_10003AB80();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v42 = *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10);
                id v43 = v36;
                id v44 = v37;
                id v45 = v38;
              }
              if (qword_10004AD30 != -1) {
                swift_once();
              }
              double v46 = v33 * v31;
              uint64_t v47 = qword_10004D180;
              type metadata accessor for RhizomeLayoutSpec();
              uint64_t v48 = swift_allocObject();
              *(_OWORD *)(v48 + 16) = 0u;
              *(_OWORD *)(v48 + 32) = 0u;
              *(void *)(v48 + 48) = 0;
              swift_unknownObjectWeakInit();
              *(double *)(v48 + 56) = v34;
              *(double *)(v48 + 64) = v35;
              *(void *)(v48 + 136) = v32;
              *(double *)(v48 + 144) = v46;
              *(void *)(v48 + 72) = v36;
              *(void *)(v48 + 80) = v37;
              *(void *)(v48 + 88) = v38;
              *(void *)(v48 + 104) = v40;
              swift_unknownObjectWeakAssign();
              *(unsigned char *)(v48 + 96) = v39;
              *(void *)(v48 + 120) = v42;
              *(_WORD *)(v48 + 128) = 256;
              *(void *)(v48 + 112) = v47;
              double v49 = *(double *)(v48 + 136) - v34 * 0.5;
              double v50 = *(double *)(v48 + 144) - v35 * 0.5;
              *(double *)(v48 + 16) = v34 * v35;
              *(double *)(v48 + 24) = v49;
              *(double *)(v48 + 32) = v50;
              *(double *)(v48 + 40) = v34;
              *(double *)(v48 + 48) = v35;
            }
            swift_retain();
            sub_10003A770();
            if (*(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_10003A7C0();
            }
            sub_10003A7E0();
            ++v23;
            sub_10003A7B0();
            swift_release();
            swift_release();
            unint64_t v4 = v88;
          }
          while (v22 != v23);
          goto LABEL_57;
        }
        goto LABEL_66;
      }
    }
    else
    {
      uint64_t v22 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v22) {
        goto LABEL_33;
      }
    }
LABEL_57:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v73 = [self mainScreen];
    [v73 bounds];
    CGFloat v75 = v74;
    CGFloat v77 = v76;
    CGFloat v79 = v78;
    CGFloat v81 = v80;

    v91.origin.x = v75;
    v91.origin.y = v77;
    v91.size.double width = v79;
    v91.size.double height = v81;
    CGRectGetHeight(v91);
    return v84 & 0xFFFFFF00;
  }
LABEL_70:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1000150C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_10003AC90();
    sub_10003A730();
    Swift::Int v6 = sub_10003ACD0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_10003AC40() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          Swift::Int v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_10003AC40() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_1000151F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_retain();
    char v4 = sub_10003A9E0();
    swift_release();
    return v4 & 1;
  }
  if (*(void *)(a2 + 16))
  {
    sub_10003AC90();
    sub_100035824();
    Swift::Int v6 = sub_10003ACD0();
    uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = v2 + 56;
    if ((*(void *)(v2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = ~v7;
      CGFloat v11 = *(double *)(a1 + 56);
      CGFloat v12 = *(double *)(a1 + 64);
      uint64_t v31 = v2 + 56;
      uint64_t v32 = v2;
      uint64_t v30 = ~v7;
      do
      {
        uint64_t v13 = *(void *)(*(void *)(v2 + 48) + 8 * v8);
        CGFloat v14 = *(double *)(v13 + 56);
        CGFloat v15 = *(double *)(v13 + 64);
        swift_retain();
        v35.double width = v14;
        v35.double height = v15;
        v36.double width = v11;
        v36.double height = v12;
        if (CGSizeEqualToSize(v35, v36) && CGPointEqualToPoint(*(CGPoint *)(v13 + 136), *(CGPoint *)(a1 + 136)))
        {
          Swift::Int v16 = *(void **)(v13 + 72);
          BOOL v17 = *(void **)(v13 + 80);
          uint64_t v18 = *(void **)(v13 + 88);
          unint64_t v20 = *(void **)(a1 + 72);
          uint64_t v19 = *(void **)(a1 + 80);
          double v34 = *(void **)(a1 + 88);
          sub_10002255C(0, (unint64_t *)&qword_10004B218);
          id v21 = v16;
          id v22 = v17;
          id v33 = v18;
          id v23 = v20;
          id v24 = v19;
          id v25 = v34;
          if ((sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0)
          {

            swift_release();
LABEL_17:
            uint64_t v9 = v31;
            uint64_t v2 = v32;
            uint64_t v10 = v30;
            goto LABEL_7;
          }
          char v26 = sub_10003A900();

          if ((v26 & 1) == 0)
          {
            swift_release();
            goto LABEL_17;
          }
          int v27 = *(unsigned __int8 *)(v13 + 96);
          int v28 = *(unsigned __int8 *)(a1 + 96);
          swift_release();
          BOOL v29 = v27 == v28;
          uint64_t v9 = v31;
          uint64_t v2 = v32;
          uint64_t v10 = v30;
          if (v29) {
            return 1;
          }
        }
        else
        {
          swift_release();
        }
LABEL_7:
        unint64_t v8 = (v8 + 1) & v10;
      }
      while (((*(void *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
    }
  }
  return 0;
}

uint64_t sub_100015470(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_10003A9E0();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = sub_10003A8F0(*(void *)(a2 + 40)),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_10003A900();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_10003A900();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

uint64_t sub_1000155D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!(a3 >> 62))
  {
    uint64_t v4 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_10003AB80();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_28;
  }
LABEL_3:
  if (v4 >= 1)
  {
    if ((a3 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      do
      {
        ++v7;
        uint64_t v8 = *(void *)(sub_10003AA90() + 120);
        swift_unknownObjectRelease();
        if (v6 <= v8) {
          uint64_t v6 = v8;
        }
      }
      while (v4 != v7);
    }
    else
    {
      if ((unint64_t)v4 >= 2)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        unint64_t v9 = v4 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v12 = a3 + 40;
        unint64_t v13 = v4 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          if (v10 <= *(void *)(*(void *)(v12 - 8) + 120)) {
            uint64_t v10 = *(void *)(*(void *)(v12 - 8) + 120);
          }
          if (v11 <= *(void *)(*(void *)v12 + 120)) {
            uint64_t v11 = *(void *)(*(void *)v12 + 120);
          }
          v12 += 16;
          v13 -= 2;
        }
        while (v13);
        if (v10 <= v11) {
          uint64_t v6 = v11;
        }
        else {
          uint64_t v6 = v10;
        }
        if (v4 == v9) {
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v6 = 0;
        unint64_t v9 = 0;
      }
      unint64_t v14 = v4 - v9;
      id v15 = (uint64_t *)(a3 + 8 * v9 + 32);
      do
      {
        uint64_t v16 = *v15++;
        uint64_t v17 = *(void *)(v16 + 120);
        if (v6 <= v17) {
          uint64_t v6 = v17;
        }
        --v14;
      }
      while (v14);
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_100015728(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000316C(&qword_10004B2A0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      unint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10001F0DC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100015850(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000316C(&qword_10004B2E8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      unint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1000252B8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100015960(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000316C(&qword_10004B2A8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000253A4(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100015A5C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __srCGFloat c = (void *)sub_10003ABE0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_100015B00@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_100015B30(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100015B58(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_10003A940();
  *a1 = v5;
  return result;
}

void *sub_100015BB0()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004AE38);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003AA20();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100015D44()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B270);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003AA20();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

void *sub_100015EF8()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B260);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003AA20();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000160A4()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B2D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003AA20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100016250()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000316C(&qword_10004B270);
  uint64_t v3 = sub_10003AA30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_10003AC90();
    swift_bridgeObjectRetain();
    sub_10003A730();
    uint64_t result = sub_10003ACD0();
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

unint64_t sub_100016500()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000316C(&qword_10004B260);
  uint64_t v3 = sub_10003AA30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    unint64_t result = swift_release();
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  unint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v16 >= v9) {
      goto LABEL_23;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_23;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_23;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_7:
    uint64_t v15 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_10003AC90();
    swift_retain();
    sub_100035824();
    sub_10003ACD0();
    unint64_t result = sub_10003A990();
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(*(void *)(v4 + 48) + 8 * result) = v15;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_23:
    swift_release();
    uint64_t v1 = v0;
    goto LABEL_24;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_23;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100016714()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000316C(&qword_10004B2D0);
  uint64_t v3 = sub_10003AA30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_10003A8F0(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100016990()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000316C(&qword_10004B270);
  uint64_t v3 = sub_10003AA30();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                  *uint64_t v30 = -1 << v29;
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
      Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_10003AC90();
      sub_10003A730();
      uint64_t result = sub_10003ACD0();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_100016C70()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000316C(&qword_10004B260);
  uint64_t v3 = sub_10003AA30();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    unint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_23;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_23;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_23;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_23:
                swift_release();
                uint64_t v19 = 1 << *(unsigned char *)(v2 + 32);
                if (v19 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v19 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v19;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_29;
                  }
                  if (v12 >= v9) {
                    goto LABEL_23;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_22:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v14 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v15 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_10003AC90();
      sub_100035824();
      sub_10003ACD0();
      unint64_t result = sub_10003A990();
      *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      *(void *)(*(void *)(v4 + 48) + 8 * result) = v15;
      ++*(void *)(v4 + 16);
    }
  }
  unint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100016EB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000316C(&qword_10004B2D0);
  uint64_t v3 = sub_10003AA30();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_10003A8F0(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

void *sub_100017158(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000316C(&qword_10004B260);
    uint64_t v2 = sub_10003AA40();
    uint64_t v6 = v2;
    sub_10003A9A0();
    if (sub_10003A9D0())
    {
      type metadata accessor for RhizomeLayoutSpec();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v6;
        if (*(void *)(v6 + 24) <= *(void *)(v6 + 16))
        {
          sub_100016C70();
          uint64_t v2 = v6;
        }
        sub_10003AC90();
        sub_100035824();
        sub_10003ACD0();
        unint64_t v3 = sub_10003A990();
        *(void *)(v2 + 56 + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v3;
        *(void *)(*(void *)(v2 + 48) + 8 * v3) = v5;
        ++*(void *)(v2 + 16);
      }
      while (sub_10003A9D0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return &_swiftEmptySetSingleton;
  }
  return (void *)v2;
}

Swift::Int sub_1000172E4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000316C(&qword_10004B2D0);
    uint64_t v2 = sub_10003AA40();
    uint64_t v14 = v2;
    sub_10003A9A0();
    if (sub_10003A9D0())
    {
      sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100016EB8();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_10003A8F0(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_10003A9D0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

unint64_t sub_1000174DC(uint64_t a1, uint64_t a2)
{
  sub_10003AC90();
  sub_100035824();
  sub_10003ACD0();
  unint64_t result = sub_10003A990();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

unint64_t sub_100017580(uint64_t a1, void *a2)
{
  sub_10003A8F0(a2[5]);
  unint64_t result = sub_10003A990();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t sub_100017604(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001771C(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_100017624(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000178A8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100017644(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017B9C(a1, a2, a3, *v3, &qword_10004B2A8);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001766C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017A14(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001768C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017CE8(a1, a2, a3, *v3, &qword_10004B2F0);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000176B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017CE8(a1, a2, a3, *v3, &qword_10004B2F8);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000176DC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017E44(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000176FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100017FA4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001771C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  if (v9)
  {
    sub_10000316C(&qword_10004B230);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_10000316C(&qword_10004AF48);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_1000178A8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_10000316C(&qword_10004B278);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_100017A14(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000316C(&qword_10004B2A0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_100017B9C(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    sub_10000316C(a5);
    size_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    size_t v11 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v11 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v9] || v13 >= &v14[v9])
  {
    memcpy(v13, v14, v9);
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_100017CE8(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    sub_10000316C(a5);
    size_t v11 = (char *)swift_allocObject();
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    size_t v11 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9]) {
      memmove(v14, v15, 16 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v9] || v14 >= &v15[16 * v9])
  {
    memcpy(v14, v15, 16 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_100017E44(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_10000316C(&qword_10004B2E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_100017FA4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_10000316C(&qword_10004B300);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

unint64_t sub_100018114(char a1)
{
  sub_10003AC90();
  sub_10003A730();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10003ACD0();
  return sub_10001A1EC(a1, v2);
}

unint64_t sub_1000181A4(uint64_t a1, uint64_t a2)
{
  sub_10003AC90();
  sub_10003A730();
  Swift::Int v4 = sub_10003ACD0();
  return sub_10001A300(a1, a2, v4);
}

unint64_t sub_10001821C(char a1)
{
  char v2 = a1 & 1;
  sub_10003AC90();
  sub_10003ACA0(a1 & 1);
  Swift::Int v3 = sub_10003ACD0();
  return sub_10001A3E4(v2, v3);
}

unint64_t sub_10001828C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10003A8F0(*(void *)(v2 + 40));
  return sub_10001A600(a1, v4, (unint64_t *)&qword_10004B2C0);
}

unint64_t sub_1000182DC(double a1)
{
  uint64_t v2 = sub_10003AC80();
  return sub_10001A4A0(v2, a1);
}

unint64_t sub_100018324(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10003A9F0(*(void *)(v2 + 40));
  return sub_10001A538(a1, v4);
}

unint64_t sub_100018368(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10003A8F0(*(void *)(v2 + 40));
  return sub_10001A600(a1, v4, &qword_10004B540);
}

uint64_t sub_1000183B8(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B2B0);
  char v6 = a2;
  uint64_t v7 = sub_10003ABB0();
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  id v33 = v2;
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          Swift::Int v3 = v33;
          if ((v6 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0) {
      id v31 = v30;
    }
    sub_10003AC90();
    sub_10003A730();
    swift_bridgeObjectRelease();
    uint64_t result = sub_10003ACD0();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v8 + 48) + v18) = v29;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v30;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  Swift::Int v3 = v33;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v8;
  return result;
}

uint64_t sub_1000186D0(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B2E0);
  char v41 = a2;
  uint64_t v6 = sub_10003ABB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v40 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v39) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v40 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v39) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v40 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_33:
          swift_release();
          Swift::Int v3 = v38;
          if ((v41 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v40 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v39) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v40 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void *)(v5 + 56) + 48 * v20;
    char v31 = *(unsigned char *)v30;
    char v32 = *(unsigned char *)(v30 + 1);
    char v33 = *(unsigned char *)(v30 + 2);
    long long v42 = *(_OWORD *)(v30 + 24);
    long long v43 = *(_OWORD *)(v30 + 8);
    uint64_t v34 = *(void *)(v30 + 40);
    if ((v41 & 1) == 0)
    {
      id v35 = (id)v43;
      id v36 = *((id *)&v43 + 1);
    }
    sub_10003AC90();
    sub_10003A730();
    swift_bridgeObjectRelease();
    uint64_t result = sub_10003ACD0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v29;
    uint64_t v18 = *(void *)(v7 + 56) + 48 * v17;
    *(unsigned char *)uint64_t v18 = v31;
    *(unsigned char *)(v18 + 1) = v32;
    *(unsigned char *)(v18 + 2) = v33;
    *(_OWORD *)(v18 + 8) = v43;
    *(_OWORD *)(v18 + 24) = v42;
    *(void *)(v18 + 40) = v34;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Int v3 = v38;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v41 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v37;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

uint64_t sub_100018A58(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B2D8);
  uint64_t result = sub_10003ABB0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                Swift::Int v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v30 = -1 << v28;
              }
              Swift::Int v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      Swift::UInt v26 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      sub_10003AC90();
      sub_10003ACA0(v26);
      uint64_t result = sub_10003ACD0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *Swift::Int v3 = v7;
  return result;
}

uint64_t sub_100018D2C(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B238);
  uint64_t v6 = sub_10003ABB0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              Swift::Int v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      BOOL v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_10000F64C(v24, v35);
      }
      else
      {
        sub_10000E7B4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_10003AC90();
      sub_10003A730();
      uint64_t result = sub_10003ACD0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_10000F64C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

uint64_t sub_10001902C(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B2B8);
  uint64_t v6 = sub_10003ABB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v35 = v2;
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
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          Swift::Int v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
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
            unint64_t v24 = *(void *)(v36 + 8 * v14);
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
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0) {
      id v33 = v31;
    }
    uint64_t result = sub_10003A8F0(*(void *)(v7 + 40));
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
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Int v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

uint64_t sub_1000192FC(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B308);
  char v38 = a2;
  uint64_t v6 = sub_10003ABB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          Swift::Int v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10003AC90();
    sub_10003A730();
    uint64_t result = sub_10003ACD0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Int v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

uint64_t sub_10001960C(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000316C(&qword_10004B288);
  uint64_t v6 = sub_10003ABB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v36 = v2;
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
    unint64_t v23 = (void *)(v5 + 64);
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
          Swift::Int v3 = v36;
          if ((a2 & 1) == 0) {
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
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_10003A8F0(*(void *)(v7 + 40));
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
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Int v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

void sub_1000198E0(uint64_t a1, char a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100018114(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_10001A714();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_1000183B8(v13, a3 & 1);
  unint64_t v18 = sub_100018114(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_10003AC60();
  __break(1u);
}

uint64_t sub_100019A18(long long *a1, char a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_100018114(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 < result || (a3 & 1) == 0)
  {
    if (v15 < result || (a3 & 1) != 0)
    {
      sub_1000186D0(result, a3 & 1);
      uint64_t result = sub_100018114(a2);
      if ((v14 & 1) != (v18 & 1))
      {
LABEL_17:
        uint64_t result = sub_10003AC60();
        __break(1u);
        return result;
      }
      unint64_t v10 = result;
      unint64_t v16 = (void *)*v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    uint64_t result = (uint64_t)sub_10001A8B8();
  }
  unint64_t v16 = (void *)*v4;
  if ((v14 & 1) == 0)
  {
LABEL_13:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    char v19 = (_OWORD *)(v16[7] + 48 * v10);
    long long v20 = *a1;
    long long v21 = a1[2];
    v19[1] = a1[1];
    v19[2] = v21;
    *char v19 = v20;
    uint64_t v22 = v16[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v16[2] = v24;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v17 = v16[7] + 48 * v10;
  return sub_100022600((uint64_t)a1, v17);
}

uint64_t sub_100019B84(uint64_t a1, char a2, char a3)
{
  Swift::Int v4 = v3;
  char v7 = a2 & 1;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10001821C(a2 & 1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10001AAAC();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = v7;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_100018A58(result, a3 & 1);
  uint64_t result = sub_10001821C(v7);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10003AC60();
  __break(1u);
  return result;
}

_OWORD *sub_100019CBC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000181A4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001AC50();
      goto LABEL_7;
    }
    sub_100018D2C(v15, a4 & 1);
    unint64_t v21 = sub_1000181A4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_10003AC60();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_100004D70((uint64_t)v19);
    return sub_10000F64C(a1, v19);
  }
LABEL_13:
  sub_10001A138(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

void sub_100019E10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000181A4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10001AFDC();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000192FC(v15, a4 & 1);
  unint64_t v20 = sub_1000181A4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10003AC60();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

void sub_100019F80(uint64_t a1, void *a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_100018368((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10001B190();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10001960C(v12, a3 & 1);
  unint64_t v17 = sub_100018368((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_10002255C(0, &qword_10004B540);
    sub_10003AC60();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

unint64_t sub_10001A0F4(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

_OWORD *sub_10001A138(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000F64C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_10001A1A4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  BOOL v5 = (void *)(a5[6] + 16 * result);
  *BOOL v5 = a2;
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

unint64_t sub_10001A1EC(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aBackgroumiddle_1[v6];
    uint64_t v8 = *(void *)&aBackgroumiddle_1[v6 + 24];
    while (*(void *)&aBackgroumiddle_1[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aBackgroumiddle_1[8 * *(char *)(*(void *)(v2 + 48) + v4) + 24] != v8)
    {
      char v10 = sub_10003AC40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_10001A300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10003AC40() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10003AC40() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001A3E4(char a1, uint64_t a2)
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

unint64_t sub_10001A4A0(uint64_t a1, double a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a1 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = *(void *)(v2 + 48);
    if (*(double *)(v6 + 8 * result) != a2)
    {
      uint64_t v7 = ~v4;
      for (unint64_t result = (result + 1) & v7;
            ((*(void *)(v3 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v7)
      {
        if (*(double *)(v6 + 8 * result) == a2) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_10001A538(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100026320(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10003AA00();
      sub_10002637C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10001A600(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_10002255C(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_10003A900();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_10003A900();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

id sub_10001A714()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B2B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_10001A8B8()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B2E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 48 * v15;
    char v17 = *(unsigned char *)v16;
    char v18 = *(unsigned char *)(v16 + 1);
    char v19 = *(unsigned char *)(v16 + 2);
    uint64_t v20 = *(void *)(v16 + 40);
    long long v21 = *(_OWORD *)(v16 + 24);
    long long v27 = *(_OWORD *)(v16 + 8);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v22 = *(void *)(v4 + 56) + 48 * v15;
    *(unsigned char *)uint64_t v22 = v17;
    *(unsigned char *)(v22 + 1) = v18;
    *(unsigned char *)(v22 + 2) = v19;
    *(_OWORD *)(v22 + 8) = v27;
    *(_OWORD *)(v22 + 24) = v21;
    *(void *)(v22 + 40) = v20;
    id v23 = (id)v27;
    id result = *((id *)&v27 + 1);
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001AAAC()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B2D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = (void *)swift_retain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001AC50()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B238);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10000E7B4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    long long v21 = (void *)(*(void *)(v4 + 48) + v16);
    *long long v21 = v19;
    v21[1] = v18;
    sub_10000F64C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_10001AE38()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B2B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_10001AFDC()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B308);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_10001B190()
{
  uint64_t v1 = v0;
  sub_10000316C(&qword_10004B288);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10003ABA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10001B338(uint64_t *a1, void (*a2)(void *))
{
  uint64_t v4 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_10001E520(v4);
    *a1 = v4;
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  a2(v8);
  return sub_10003AAD0();
}

void *sub_10001B3BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10000316C(&qword_10004B280);
  uint64_t v3 = swift_allocObject();
  size_t v4 = j__malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  uint64_t v5 = sub_10001E188(&v7, (unsigned char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_10001ED5C();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return (void *)v3;
}

void *sub_10001B494(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_10000316C(&qword_10004B240);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10001E31C((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10003AB80();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

Swift::Int sub_10001B58C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_10003AC10(v3);
  if (result >= v3)
  {
    if (v3 < 0)
    {
LABEL_188:
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      sub_10003ABE0();
      __break(1u);
      goto LABEL_194;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v12 = *(void *)(v10 + 8 * i);
        uint64_t v13 = v9;
        do
        {
          unint64_t v14 = (void *)(v10 + 8 * v13);
          if (*(double *)(v12 + 144) >= *(double *)(*v14 + 144)) {
            break;
          }
          if (!v10) {
            goto LABEL_189;
          }
          v14[1] = *v14;
          *(void *)(v10 + 8 * v13--) = v12;
        }
        while (v13 != -1);
        ++v9;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1)
    {
LABEL_194:
      Swift::Int result = sub_10003AB60();
      __break(1u);
      return result;
    }
    v122 = a1;
    Swift::Int v123 = result;
    if (v3 >= 2)
    {
      uint64_t v6 = v5 >> 1;
      type metadata accessor for RhizomeLayoutSpec();
      uint64_t v7 = sub_10003A7D0();
      *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      char v8 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
      uint64_t v134 = v7;
      goto LABEL_18;
    }
    unint64_t v15 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v134 = (uint64_t)&_swiftEmptyArrayStorage;
    char v8 = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 == 1)
    {
LABEL_18:
      Swift::Int v16 = 0;
      uint64_t v17 = *a1;
      uint64_t v126 = v17 - 8;
      unint64_t v15 = (char *)&_swiftEmptyArrayStorage;
      Swift::Int v18 = v3;
      Swift::Int v124 = v3;
      __dst = v8;
      while (1)
      {
        Swift::Int v20 = v16 + 1;
        if (v16 + 1 < v18)
        {
          uint64_t v21 = *(void *)(v17 + 8 * v20);
          double v22 = *(double *)(v21 + 144);
          double v23 = *(double *)(*(void *)(v17 + 8 * v16) + 144);
          Swift::Int v20 = v16 + 2;
          if (v16 + 2 < v18)
          {
            double v24 = *(double *)(v21 + 144);
            while (1)
            {
              double v25 = v24;
              double v24 = *(double *)(*(void *)(v17 + 8 * v20) + 144);
              if (v22 < v23 == v24 >= v25) {
                break;
              }
              if (v18 == ++v20)
              {
                Swift::Int v20 = v18;
                break;
              }
            }
          }
          if (v22 < v23)
          {
            if (v20 < v16) {
              goto LABEL_184;
            }
            if (v16 < v20)
            {
              int64_t v26 = (uint64_t *)(v126 + 8 * v20);
              Swift::Int v27 = v20;
              Swift::Int v28 = v16;
              uint64_t v29 = (uint64_t *)(v17 + 8 * v16);
              do
              {
                if (v28 != --v27)
                {
                  if (!v17) {
                    goto LABEL_191;
                  }
                  uint64_t v30 = *v29;
                  *uint64_t v29 = *v26;
                  *int64_t v26 = v30;
                }
                ++v28;
                --v26;
                ++v29;
              }
              while (v28 < v27);
            }
          }
        }
        if (v20 < v18)
        {
          if (__OFSUB__(v20, v16)) {
            goto LABEL_179;
          }
          if (v20 - v16 < v123)
          {
            Swift::Int v31 = v16 + v123;
            if (__OFADD__(v16, v123)) {
              goto LABEL_185;
            }
            if (v31 >= v18) {
              Swift::Int v31 = v18;
            }
            if (v31 < v16) {
              goto LABEL_186;
            }
            if (v20 != v31)
            {
              uint64_t v32 = (void *)(v126 + 8 * v20);
              do
              {
                uint64_t v33 = *(void *)(v17 + 8 * v20);
                Swift::Int v34 = v16;
                uint64_t v35 = v32;
                do
                {
                  uint64_t v36 = *v35;
                  if (*(double *)(v33 + 144) >= *(double *)(*v35 + 144)) {
                    break;
                  }
                  if (!v17) {
                    goto LABEL_187;
                  }
                  *uint64_t v35 = v33;
                  v35[1] = v36;
                  --v35;
                  ++v34;
                }
                while (v20 != v34);
                ++v20;
                ++v32;
              }
              while (v20 != v31);
              Swift::Int v20 = v31;
            }
          }
        }
        if (v20 < v16) {
          goto LABEL_178;
        }
        Swift::Int v125 = v20;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v15 = sub_10001D070(0, *((void *)v15 + 2) + 1, 1, v15);
        }
        char v8 = __dst;
        unint64_t v38 = *((void *)v15 + 2);
        unint64_t v37 = *((void *)v15 + 3);
        unint64_t v19 = v38 + 1;
        if (v38 >= v37 >> 1)
        {
          int v114 = sub_10001D070((char *)(v37 > 1), v38 + 1, 1, v15);
          char v8 = __dst;
          unint64_t v15 = v114;
        }
        *((void *)v15 + 2) = v19;
        int64_t v39 = v15 + 32;
        uint64_t v40 = &v15[16 * v38 + 32];
        *(void *)uint64_t v40 = v16;
        *((void *)v40 + 1) = v125;
        if (v38) {
          break;
        }
        unint64_t v19 = 1;
LABEL_20:
        Swift::Int v18 = v124;
        Swift::Int v16 = v125;
        if (v125 >= v124) {
          goto LABEL_150;
        }
      }
      v127 = v15 + 32;
      v128 = v15;
      while (1)
      {
        unint64_t v41 = v19 - 1;
        if (v19 >= 4)
        {
          double v46 = &v39[16 * v19];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_167;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_168;
          }
          unint64_t v53 = v19 - 2;
          id v54 = &v39[16 * v19 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_170;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_173;
          }
          if (v58 >= v49)
          {
            double v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_177;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_90;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v70 = *((void *)v15 + 4);
            uint64_t v71 = *((void *)v15 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_84;
          }
          uint64_t v43 = *((void *)v15 + 4);
          uint64_t v42 = *((void *)v15 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_169;
        }
        unint64_t v53 = v19 - 2;
        uint64_t v59 = &v39[16 * v19 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_172;
        }
        uint64_t v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_175;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_176;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_90:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_92;
        }
LABEL_84:
        if (v64) {
          goto LABEL_171;
        }
        id v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_174;
        }
        if (v75 < v63) {
          goto LABEL_20;
        }
LABEL_92:
        if (v41 - 1 >= v19)
        {
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
          goto LABEL_180;
        }
        if (!v17) {
          goto LABEL_190;
        }
        unint64_t v132 = v41 - 1;
        v131 = &v39[16 * v41 - 16];
        uint64_t v80 = *(void *)v131;
        int64_t v133 = v41;
        CGFloat v81 = &v39[16 * v41];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        v130 = v81;
        int v84 = (char *)(v17 + 8 * *(void *)v131);
        float64x2_t v85 = (char *)(v17 + 8 * *(void *)v81);
        uint64_t v86 = v17;
        unint64_t v87 = v17 + 8 * v82;
        uint64_t v88 = v85 - v84;
        uint64_t v89 = v85 - v84 + 7;
        if (v85 - v84 >= 0) {
          uint64_t v89 = v85 - v84;
        }
        uint64_t v90 = v89 >> 3;
        uint64_t v91 = v87 - (void)v85;
        uint64_t v92 = v87 - (void)v85 + 7;
        if ((uint64_t)(v87 - (void)v85) >= 0) {
          uint64_t v92 = v87 - (void)v85;
        }
        uint64_t v93 = v92 >> 3;
        if (v90 >= v92 >> 3)
        {
          if (v91 < -7) {
            goto LABEL_193;
          }
          if ((unint64_t)v8 >= v87 || v8 != v85)
          {
            uint64_t v100 = *(void *)v131;
            uint64_t v101 = v82;
            memmove(v8, v85, 8 * v93);
            uint64_t v82 = v101;
            uint64_t v80 = v100;
            char v8 = __dst;
          }
          id v96 = &v8[8 * v93];
          if (v80 >= v83 || v91 < 8)
          {
            float64x2_t v97 = v8;
            uint64_t v17 = v86;
            goto LABEL_138;
          }
          CGFloat v102 = (char *)(v126 + 8 * v82);
          double v103 = v85;
          uint64_t v17 = v86;
          while (2)
          {
            CGFloat v104 = v102 + 8;
            uint64_t v106 = *((void *)v103 - 1);
            v103 -= 8;
            uint64_t v105 = v106;
            if (*(double *)(*((void *)v96 - 1) + 144) >= *(double *)(v106 + 144))
            {
              uint64_t v105 = *((void *)v96 - 1);
              double v103 = v85;
              if (v104 != v96)
              {
                v96 -= 8;
                goto LABEL_131;
              }
              BOOL v107 = v102 >= v96;
              v96 -= 8;
              if (v107) {
LABEL_131:
              }
                *(void *)CGFloat v102 = v105;
            }
            else if (v104 != v85 || v102 >= v85)
            {
              goto LABEL_131;
            }
            if (v84 >= v103 || (v102 -= 8, float64x2_t v85 = v103, v8 >= v96))
            {
              float64x2_t v97 = v8;
              float64x2_t v85 = v103;
              goto LABEL_138;
            }
            continue;
          }
        }
        if (v88 < -7) {
          goto LABEL_193;
        }
        uint64_t v17 = v86;
        if (v8 != v84 || v8 >= v85)
        {
          uint64_t v94 = *(void *)v131;
          uint64_t v95 = v82;
          memmove(v8, v84, 8 * v90);
          uint64_t v82 = v95;
          uint64_t v80 = v94;
          char v8 = __dst;
        }
        id v96 = &v8[8 * v90];
        if (v83 < v82 && v88 >= 8)
        {
          float64x2_t v97 = v8;
          while (1)
          {
            uint64_t v98 = *(void *)v85;
            if (*(double *)(*(void *)v85 + 144) >= *(double *)(*(void *)v97 + 144)) {
              break;
            }
            BOOL v99 = v84 == v85;
            v85 += 8;
            if (!v99) {
              goto LABEL_111;
            }
LABEL_112:
            v84 += 8;
            if (v97 >= v96 || (unint64_t)v85 >= v87) {
              goto LABEL_136;
            }
          }
          uint64_t v98 = *(void *)v97;
          BOOL v99 = v84 == v97;
          v97 += 8;
          if (v99) {
            goto LABEL_112;
          }
LABEL_111:
          *(void *)int v84 = v98;
          goto LABEL_112;
        }
        float64x2_t v97 = v8;
LABEL_136:
        float64x2_t v85 = v84;
LABEL_138:
        uint64_t v108 = v96 - v97;
        uint64_t v109 = v96 - v97 + 7;
        if (v108 >= 0) {
          uint64_t v109 = v108;
        }
        if (v108 <= -8) {
          goto LABEL_193;
        }
        uint64_t v110 = v109 >> 3;
        if (v85 != v97 || v85 >= &v97[8 * v110])
        {
          uint64_t v111 = v80;
          uint64_t v112 = v82;
          memmove(v85, v97, 8 * v110);
          uint64_t v82 = v112;
          uint64_t v80 = v111;
        }
        if (v82 < v80) {
          goto LABEL_164;
        }
        unint64_t v15 = v128;
        if (v133 > *((void *)v128 + 2)) {
          goto LABEL_165;
        }
        *(void *)v131 = v80;
        int64_t v39 = v127;
        *(void *)&v127[16 * v132 + 8] = v82;
        unint64_t v113 = *((void *)v128 + 2);
        if (v133 >= (uint64_t)v113) {
          goto LABEL_166;
        }
        unint64_t v19 = v113 - 1;
        memmove(v130, v130 + 16, 16 * (v113 - 1 - v133));
        *((void *)v128 + 2) = v113 - 1;
        char v8 = __dst;
        if (v113 <= 2) {
          goto LABEL_20;
        }
      }
    }
    unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_150:
    if (v19 >= 2)
    {
      uint64_t v115 = *v122;
      while (1)
      {
        unint64_t v116 = v19 - 2;
        if (v19 < 2) {
          break;
        }
        if (!v115) {
          goto LABEL_192;
        }
        unint64_t v117 = v8;
        uint64_t v118 = *(void *)&v15[16 * v116 + 32];
        uint64_t v119 = *(void *)&v15[16 * v19 + 24];
        sub_10001C7D4((char *)(v115 + 8 * v118), (char *)(v115 + 8 * *(void *)&v15[16 * v19 + 16]), v115 + 8 * v119, v8);
        if (v1) {
          goto LABEL_161;
        }
        if (v119 < v118) {
          goto LABEL_181;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v15 = sub_10001D228((uint64_t)v15);
        }
        if (v116 >= *((void *)v15 + 2)) {
          goto LABEL_182;
        }
        unint64_t v120 = &v15[16 * v116 + 32];
        *(void *)unint64_t v120 = v118;
        *((void *)v120 + 1) = v119;
        unint64_t v121 = *((void *)v15 + 2);
        if (v19 > v121) {
          goto LABEL_183;
        }
        memmove(&v15[16 * v19 + 16], &v15[16 * v19 + 32], 16 * (v121 - v19));
        *((void *)v15 + 2) = v121 - 1;
        unint64_t v19 = v121 - 1;
        char v8 = v117;
        if (v121 <= 2) {
          goto LABEL_161;
        }
      }
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
      goto LABEL_188;
    }
LABEL_161:
    swift_bridgeObjectRelease();
    *(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
    sub_10003A7B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Int sub_10001BEB0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_10003AC10(v3);
  if (result >= v3)
  {
    if (v3 < 0)
    {
LABEL_188:
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      sub_10003ABE0();
      __break(1u);
      goto LABEL_194;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v12 = *(void *)(v10 + 8 * i);
        uint64_t v13 = v9;
        do
        {
          unint64_t v14 = (void *)(v10 + 8 * v13);
          if (*(double *)(*v14 + 16) >= *(double *)(v12 + 16)) {
            break;
          }
          if (!v10) {
            goto LABEL_189;
          }
          v14[1] = *v14;
          *(void *)(v10 + 8 * v13--) = v12;
        }
        while (v13 != -1);
        ++v9;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1)
    {
LABEL_194:
      Swift::Int result = sub_10003AB60();
      __break(1u);
      return result;
    }
    v122 = a1;
    Swift::Int v123 = result;
    if (v3 >= 2)
    {
      uint64_t v6 = v5 >> 1;
      type metadata accessor for RhizomeLayoutSpec();
      uint64_t v7 = sub_10003A7D0();
      *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      char v8 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
      uint64_t v134 = v7;
      goto LABEL_18;
    }
    unint64_t v15 = (char *)_swiftEmptyArrayStorage;
    uint64_t v134 = (uint64_t)_swiftEmptyArrayStorage;
    char v8 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 == 1)
    {
LABEL_18:
      Swift::Int v16 = 0;
      uint64_t v17 = *a1;
      uint64_t v126 = v17 - 8;
      unint64_t v15 = (char *)_swiftEmptyArrayStorage;
      Swift::Int v18 = v3;
      Swift::Int v124 = v3;
      __dst = v8;
      while (1)
      {
        Swift::Int v20 = v16 + 1;
        if (v16 + 1 < v18)
        {
          uint64_t v21 = *(void *)(v17 + 8 * v20);
          double v22 = *(double *)(v21 + 16);
          double v23 = *(double *)(*(void *)(v17 + 8 * v16) + 16);
          Swift::Int v20 = v16 + 2;
          if (v16 + 2 < v18)
          {
            double v24 = *(double *)(v21 + 16);
            while (1)
            {
              double v25 = v24;
              double v24 = *(double *)(*(void *)(v17 + 8 * v20) + 16);
              if (v23 < v22 == v25 >= v24) {
                break;
              }
              if (v18 == ++v20)
              {
                Swift::Int v20 = v18;
                break;
              }
            }
          }
          if (v23 < v22)
          {
            if (v20 < v16) {
              goto LABEL_184;
            }
            if (v16 < v20)
            {
              int64_t v26 = (uint64_t *)(v126 + 8 * v20);
              Swift::Int v27 = v20;
              Swift::Int v28 = v16;
              uint64_t v29 = (uint64_t *)(v17 + 8 * v16);
              do
              {
                if (v28 != --v27)
                {
                  if (!v17) {
                    goto LABEL_191;
                  }
                  uint64_t v30 = *v29;
                  *uint64_t v29 = *v26;
                  *int64_t v26 = v30;
                }
                ++v28;
                --v26;
                ++v29;
              }
              while (v28 < v27);
            }
          }
        }
        if (v20 < v18)
        {
          if (__OFSUB__(v20, v16)) {
            goto LABEL_179;
          }
          if (v20 - v16 < v123)
          {
            Swift::Int v31 = v16 + v123;
            if (__OFADD__(v16, v123)) {
              goto LABEL_185;
            }
            if (v31 >= v18) {
              Swift::Int v31 = v18;
            }
            if (v31 < v16) {
              goto LABEL_186;
            }
            if (v20 != v31)
            {
              uint64_t v32 = (void *)(v126 + 8 * v20);
              do
              {
                uint64_t v33 = *(void *)(v17 + 8 * v20);
                Swift::Int v34 = v16;
                uint64_t v35 = v32;
                do
                {
                  uint64_t v36 = *v35;
                  if (*(double *)(*v35 + 16) >= *(double *)(v33 + 16)) {
                    break;
                  }
                  if (!v17) {
                    goto LABEL_187;
                  }
                  *uint64_t v35 = v33;
                  v35[1] = v36;
                  --v35;
                  ++v34;
                }
                while (v20 != v34);
                ++v20;
                ++v32;
              }
              while (v20 != v31);
              Swift::Int v20 = v31;
            }
          }
        }
        if (v20 < v16) {
          goto LABEL_178;
        }
        Swift::Int v125 = v20;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v15 = sub_10001D070(0, *((void *)v15 + 2) + 1, 1, v15);
        }
        char v8 = __dst;
        unint64_t v38 = *((void *)v15 + 2);
        unint64_t v37 = *((void *)v15 + 3);
        unint64_t v19 = v38 + 1;
        if (v38 >= v37 >> 1)
        {
          int v114 = sub_10001D070((char *)(v37 > 1), v38 + 1, 1, v15);
          char v8 = __dst;
          unint64_t v15 = v114;
        }
        *((void *)v15 + 2) = v19;
        int64_t v39 = v15 + 32;
        uint64_t v40 = &v15[16 * v38 + 32];
        *(void *)uint64_t v40 = v16;
        *((void *)v40 + 1) = v125;
        if (v38) {
          break;
        }
        unint64_t v19 = 1;
LABEL_20:
        Swift::Int v18 = v124;
        Swift::Int v16 = v125;
        if (v125 >= v124) {
          goto LABEL_150;
        }
      }
      v127 = v15 + 32;
      v128 = v15;
      while (1)
      {
        unint64_t v41 = v19 - 1;
        if (v19 >= 4)
        {
          double v46 = &v39[16 * v19];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_167;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_168;
          }
          unint64_t v53 = v19 - 2;
          id v54 = &v39[16 * v19 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_170;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_173;
          }
          if (v58 >= v49)
          {
            double v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_177;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_90;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v70 = *((void *)v15 + 4);
            uint64_t v71 = *((void *)v15 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_84;
          }
          uint64_t v43 = *((void *)v15 + 4);
          uint64_t v42 = *((void *)v15 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_169;
        }
        unint64_t v53 = v19 - 2;
        uint64_t v59 = &v39[16 * v19 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_172;
        }
        uint64_t v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_175;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_176;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_90:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_92;
        }
LABEL_84:
        if (v64) {
          goto LABEL_171;
        }
        id v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_174;
        }
        if (v75 < v63) {
          goto LABEL_20;
        }
LABEL_92:
        if (v41 - 1 >= v19)
        {
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
          goto LABEL_180;
        }
        if (!v17) {
          goto LABEL_190;
        }
        unint64_t v132 = v41 - 1;
        v131 = &v39[16 * v41 - 16];
        uint64_t v80 = *(void *)v131;
        int64_t v133 = v41;
        CGFloat v81 = &v39[16 * v41];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        v130 = v81;
        int v84 = (char *)(v17 + 8 * *(void *)v131);
        float64x2_t v85 = (char *)(v17 + 8 * *(void *)v81);
        uint64_t v86 = v17;
        unint64_t v87 = v17 + 8 * v82;
        uint64_t v88 = v85 - v84;
        uint64_t v89 = v85 - v84 + 7;
        if (v85 - v84 >= 0) {
          uint64_t v89 = v85 - v84;
        }
        uint64_t v90 = v89 >> 3;
        uint64_t v91 = v87 - (void)v85;
        uint64_t v92 = v87 - (void)v85 + 7;
        if ((uint64_t)(v87 - (void)v85) >= 0) {
          uint64_t v92 = v87 - (void)v85;
        }
        uint64_t v93 = v92 >> 3;
        if (v90 >= v92 >> 3)
        {
          if (v91 < -7) {
            goto LABEL_193;
          }
          if ((unint64_t)v8 >= v87 || v8 != v85)
          {
            uint64_t v100 = *(void *)v131;
            uint64_t v101 = v82;
            memmove(v8, v85, 8 * v93);
            uint64_t v82 = v101;
            uint64_t v80 = v100;
            char v8 = __dst;
          }
          id v96 = &v8[8 * v93];
          if (v80 >= v83 || v91 < 8)
          {
            float64x2_t v97 = v8;
            uint64_t v17 = v86;
            goto LABEL_138;
          }
          CGFloat v102 = (char *)(v126 + 8 * v82);
          double v103 = v85;
          uint64_t v17 = v86;
          while (2)
          {
            CGFloat v104 = v102 + 8;
            uint64_t v106 = *((void *)v103 - 1);
            v103 -= 8;
            uint64_t v105 = v106;
            if (*(double *)(v106 + 16) >= *(double *)(*((void *)v96 - 1) + 16))
            {
              uint64_t v105 = *((void *)v96 - 1);
              double v103 = v85;
              if (v104 != v96)
              {
                v96 -= 8;
                goto LABEL_131;
              }
              BOOL v107 = v102 >= v96;
              v96 -= 8;
              if (v107) {
LABEL_131:
              }
                *(void *)CGFloat v102 = v105;
            }
            else if (v104 != v85 || v102 >= v85)
            {
              goto LABEL_131;
            }
            if (v84 >= v103 || (v102 -= 8, float64x2_t v85 = v103, v8 >= v96))
            {
              float64x2_t v97 = v8;
              float64x2_t v85 = v103;
              goto LABEL_138;
            }
            continue;
          }
        }
        if (v88 < -7) {
          goto LABEL_193;
        }
        uint64_t v17 = v86;
        if (v8 != v84 || v8 >= v85)
        {
          uint64_t v94 = *(void *)v131;
          uint64_t v95 = v82;
          memmove(v8, v84, 8 * v90);
          uint64_t v82 = v95;
          uint64_t v80 = v94;
          char v8 = __dst;
        }
        id v96 = &v8[8 * v90];
        if (v83 < v82 && v88 >= 8)
        {
          float64x2_t v97 = v8;
          while (1)
          {
            uint64_t v98 = *(void *)v85;
            if (*(double *)(*(void *)v97 + 16) >= *(double *)(*(void *)v85 + 16)) {
              break;
            }
            BOOL v99 = v84 == v85;
            v85 += 8;
            if (!v99) {
              goto LABEL_111;
            }
LABEL_112:
            v84 += 8;
            if (v97 >= v96 || (unint64_t)v85 >= v87) {
              goto LABEL_136;
            }
          }
          uint64_t v98 = *(void *)v97;
          BOOL v99 = v84 == v97;
          v97 += 8;
          if (v99) {
            goto LABEL_112;
          }
LABEL_111:
          *(void *)int v84 = v98;
          goto LABEL_112;
        }
        float64x2_t v97 = v8;
LABEL_136:
        float64x2_t v85 = v84;
LABEL_138:
        uint64_t v108 = v96 - v97;
        uint64_t v109 = v96 - v97 + 7;
        if (v108 >= 0) {
          uint64_t v109 = v108;
        }
        if (v108 <= -8) {
          goto LABEL_193;
        }
        uint64_t v110 = v109 >> 3;
        if (v85 != v97 || v85 >= &v97[8 * v110])
        {
          uint64_t v111 = v80;
          uint64_t v112 = v82;
          memmove(v85, v97, 8 * v110);
          uint64_t v82 = v112;
          uint64_t v80 = v111;
        }
        if (v82 < v80) {
          goto LABEL_164;
        }
        unint64_t v15 = v128;
        if (v133 > *((void *)v128 + 2)) {
          goto LABEL_165;
        }
        *(void *)v131 = v80;
        int64_t v39 = v127;
        *(void *)&v127[16 * v132 + 8] = v82;
        unint64_t v113 = *((void *)v128 + 2);
        if (v133 >= (uint64_t)v113) {
          goto LABEL_166;
        }
        unint64_t v19 = v113 - 1;
        memmove(v130, v130 + 16, 16 * (v113 - 1 - v133));
        *((void *)v128 + 2) = v113 - 1;
        char v8 = __dst;
        if (v113 <= 2) {
          goto LABEL_20;
        }
      }
    }
    unint64_t v19 = _swiftEmptyArrayStorage[2];
LABEL_150:
    if (v19 >= 2)
    {
      uint64_t v115 = *v122;
      while (1)
      {
        unint64_t v116 = v19 - 2;
        if (v19 < 2) {
          break;
        }
        if (!v115) {
          goto LABEL_192;
        }
        unint64_t v117 = v8;
        uint64_t v118 = *(void *)&v15[16 * v116 + 32];
        uint64_t v119 = *(void *)&v15[16 * v19 + 24];
        sub_10001CA54((char *)(v115 + 8 * v118), (char *)(v115 + 8 * *(void *)&v15[16 * v19 + 16]), v115 + 8 * v119, v8);
        if (v1) {
          goto LABEL_161;
        }
        if (v119 < v118) {
          goto LABEL_181;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v15 = sub_10001D228((uint64_t)v15);
        }
        if (v116 >= *((void *)v15 + 2)) {
          goto LABEL_182;
        }
        unint64_t v120 = &v15[16 * v116 + 32];
        *(void *)unint64_t v120 = v118;
        *((void *)v120 + 1) = v119;
        unint64_t v121 = *((void *)v15 + 2);
        if (v19 > v121) {
          goto LABEL_183;
        }
        memmove(&v15[16 * v19 + 16], &v15[16 * v19 + 32], 16 * (v121 - v19));
        *((void *)v15 + 2) = v121 - 1;
        unint64_t v19 = v121 - 1;
        char v8 = v117;
        if (v121 <= 2) {
          goto LABEL_161;
        }
      }
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
      goto LABEL_188;
    }
LABEL_161:
    swift_bridgeObjectRelease();
    *(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
    sub_10003A7B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001C7D4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  int64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  double v24 = __src;
  double v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      Swift::Int v16 = &v4[8 * v13];
      double v22 = v16;
      double v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v17 = (char *)(a3 - 8);
        while (1)
        {
          Swift::Int v18 = v17 + 8;
          unint64_t v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*(double *)(*((void *)v16 - 1) + 144) >= *(double *)(v20 + 144))
          {
            double v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = v20;
            }
            double v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    unint64_t v14 = &v4[8 * v10];
    double v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(double *)(*(void *)v6 + 144) >= *(double *)(*(void *)v4 + 144))
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          double v23 = v4;
          unint64_t v15 = v6;
        }
        else
        {
          unint64_t v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      double v24 = v7;
    }
LABEL_42:
    sub_10001D16C((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10001CA54(char *__src, char *a2, unint64_t a3, char *__dst)
{
  int64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  double v24 = __src;
  double v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      Swift::Int v16 = &v4[8 * v13];
      double v22 = v16;
      double v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v17 = (char *)(a3 - 8);
        while (1)
        {
          Swift::Int v18 = v17 + 8;
          unint64_t v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*(double *)(v20 + 16) >= *(double *)(*((void *)v16 - 1) + 16))
          {
            double v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = v20;
            }
            double v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    unint64_t v14 = &v4[8 * v10];
    double v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(double *)(*(void *)v4 + 16) >= *(double *)(*(void *)v6 + 16))
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          double v23 = v4;
          unint64_t v15 = v6;
        }
        else
        {
          unint64_t v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      double v24 = v7;
    }
LABEL_42:
    sub_10001D16C((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10001CCD4(uint64_t *a1, uint64_t *__src, unint64_t a3, uint64_t *__dst, uint64_t a5)
{
  uint64_t v6 = __dst;
  int64_t v8 = __src;
  uint64_t v9 = (char *)__src - (char *)a1;
  uint64_t v10 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v10 = (char *)__src - (char *)a1;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = a3 - (void)__src;
  uint64_t v13 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v13 = a3 - (void)__src;
  }
  uint64_t v14 = v13 >> 3;
  unint64_t v41 = a1;
  uint64_t v40 = __dst;
  __srcCGFloat a = a1;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      uint64_t v22 = v5;
      if (__dst != __src || &__src[v14] <= __dst)
      {
        memmove(__dst, __src, 8 * v14);
        a1 = __srca;
      }
      double v23 = &v6[v14];
      int64_t v39 = v23;
      unint64_t v41 = v8;
      if (a1 >= v8 || v12 < 8) {
        goto LABEL_48;
      }
      double v24 = (uint64_t *)(a3 - 8);
      double v25 = v8;
      Swift::Int v34 = v6;
      while (1)
      {
        unint64_t v27 = (unint64_t)v23;
        Swift::Int v28 = v23 - 1;
        uint64_t v38 = *(v23 - 1);
        uint64_t v29 = *--v25;
        uint64_t v37 = v29;
        swift_retain();
        swift_retain();
        BOOL v30 = sub_10001420C(&v38, &v37, a5);
        if (v22) {
          goto LABEL_47;
        }
        BOOL v31 = v30;
        uint64_t v32 = v24 + 1;
        swift_release();
        swift_release();
        if (v31)
        {
          if (v32 != v8 || v24 >= v8) {
            *double v24 = *v25;
          }
          unint64_t v41 = v25;
          uint64_t v22 = 0;
          int64_t v26 = v34;
          double v23 = (uint64_t *)v27;
          if (v25 <= __srca) {
            goto LABEL_48;
          }
        }
        else
        {
          int64_t v39 = v28;
          if ((unint64_t)v32 < v27 || (unint64_t)v24 >= v27 || v32 != (uint64_t *)v27) {
            *double v24 = *v28;
          }
          double v25 = v8;
          double v23 = v28;
          uint64_t v22 = 0;
          int64_t v26 = v34;
          if (v8 <= __srca) {
            goto LABEL_48;
          }
        }
        --v24;
        int64_t v8 = v25;
        if (v23 <= v26) {
          goto LABEL_48;
        }
      }
    }
  }
  else if (v9 >= -7)
  {
    if (__dst != a1 || &a1[v11] <= __dst)
    {
      memmove(__dst, a1, 8 * v11);
      a1 = __srca;
    }
    unint64_t v15 = &v6[v11];
    int64_t v39 = v15;
    if ((unint64_t)v8 >= a3 || v9 < 8) {
      goto LABEL_48;
    }
    while (1)
    {
      Swift::Int v16 = a1;
      uint64_t v38 = *v8;
      uint64_t v17 = v6;
      uint64_t v37 = *v6;
      swift_retain();
      swift_retain();
      BOOL v18 = sub_10001420C(&v38, &v37, a5);
      if (v5) {
        break;
      }
      BOOL v19 = v18;
      swift_release();
      swift_release();
      if (v19)
      {
        uint64_t v20 = v8 + 1;
        uint64_t v21 = v16;
        if (v16 < v8 || v16 >= v20 || v16 != v8) {
          *Swift::Int v16 = *v8;
        }
        uint64_t v6 = v17;
      }
      else
      {
        uint64_t v21 = v16;
        if (v16 != v17) {
          *Swift::Int v16 = *v17;
        }
        uint64_t v6 = v17 + 1;
        uint64_t v40 = v17 + 1;
        uint64_t v20 = v8;
      }
      a1 = v21 + 1;
      unint64_t v41 = a1;
      if (v6 < v15)
      {
        int64_t v8 = v20;
        if ((unint64_t)v20 < a3) {
          continue;
        }
      }
      goto LABEL_48;
    }
LABEL_47:
    swift_release();
    swift_release();
LABEL_48:
    sub_10001D16C((void **)&v41, (const void **)&v40, &v39);
    swift_bridgeObjectRelease();
    return 1;
  }
  swift_bridgeObjectRelease();
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

char *sub_10001D070(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000316C(&qword_10004B268);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10001D16C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_10003ABE0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10001D228(uint64_t a1)
{
  return sub_10001D070(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_10001D23C(unint64_t result)
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

uint64_t sub_10001D2C8(uint64_t result, double a2, double a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = swift_stdlib_random();
  if (v5 * ((double)0 * 1.11022302e-16) + a2 == a3) {
    return sub_10001D2C8(v6, a2, a3);
  }
  return result;
}

uint64_t sub_10001D374(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10003AC90();
  swift_bridgeObjectRetain();
  sub_10003A730();
  Swift::Int v8 = sub_10003ACD0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10003AC40() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      BOOL v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_10003AC40() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *Swift::Int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10001DBA4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *Swift::Int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10001D524(uint64_t *a1, uint64_t a2)
{
  Swift::Int v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
  {
    unint64_t v41 = v2;
    sub_10003AC90();
    swift_bridgeObjectRetain();
    sub_100035824();
    Swift::Int v10 = sub_10003ACD0();
    uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v12 = v10 & ~v11;
    uint64_t v13 = v6 + 56;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v48 = *v41;
      uint64_t *v41 = 0x8000000000000000;
      uint64_t v38 = swift_retain();
      sub_10001DD40(v38, v12, isUniquelyReferenced_nonNull_native);
      uint64_t *v41 = v48;
      swift_bridgeObjectRelease();
      *a1 = a2;
      return 1;
    }
    uint64_t v14 = ~v11;
    uint64_t v44 = v6 + 56;
    uint64_t v45 = v6;
    uint64_t v43 = ~v11;
    while (1)
    {
      uint64_t v15 = *(void *)(*(void *)(v6 + 48) + 8 * v12);
      CGFloat v16 = *(double *)(v15 + 56);
      CGFloat v17 = *(double *)(v15 + 64);
      CGFloat v18 = *(double *)(a2 + 56);
      CGFloat v19 = *(double *)(a2 + 64);
      swift_retain();
      v50.double width = v16;
      v50.double height = v17;
      v51.double width = v18;
      v51.double height = v19;
      if (CGSizeEqualToSize(v50, v51) && CGPointEqualToPoint(*(CGPoint *)(v15 + 136), *(CGPoint *)(a2 + 136)))
      {
        uint64_t v20 = *(void **)(v15 + 72);
        uint64_t v21 = *(void **)(v15 + 80);
        uint64_t v22 = *(void **)(v15 + 88);
        double v23 = *(void **)(a2 + 72);
        double v24 = *(void **)(a2 + 80);
        double v46 = *(void **)(a2 + 88);
        sub_10002255C(0, (unint64_t *)&qword_10004B218);
        id v25 = v20;
        id v26 = v21;
        id v27 = v22;
        id v28 = v23;
        uint64_t v29 = v25;
        id v30 = v28;
        id v31 = v24;
        id v32 = v46;
        if ((sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0)
        {

          swift_release();
LABEL_20:
          uint64_t v13 = v44;
          uint64_t v6 = v45;
          uint64_t v14 = v43;
          goto LABEL_10;
        }
        char v33 = sub_10003A900();

        if ((v33 & 1) == 0)
        {
          swift_release();
          goto LABEL_20;
        }
        int v34 = *(unsigned __int8 *)(v15 + 96);
        int v35 = *(unsigned __int8 *)(a2 + 96);
        swift_release();
        BOOL v36 = v34 == v35;
        uint64_t v13 = v44;
        uint64_t v6 = v45;
        uint64_t v14 = v43;
        if (v36)
        {
          swift_release();
          swift_bridgeObjectRelease();
          *a1 = *(void *)(*(void *)(*v41 + 48) + 8 * v12);
          swift_retain();
          return 0;
        }
      }
      else
      {
        swift_release();
      }
LABEL_10:
      unint64_t v12 = (v12 + 1) & v14;
      if (((*(void *)(v13 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        goto LABEL_22;
      }
    }
  }
  if (v6 < 0) {
    uint64_t v7 = *v2;
  }
  else {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v8 = sub_10003A9C0();
  swift_release();
  if (v8)
  {
    swift_bridgeObjectRelease();
    swift_release();
    type metadata accessor for RhizomeLayoutSpec();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    *a1 = v47;
    swift_unknownObjectRelease();
    return 0;
  }
  uint64_t result = sub_10003A9B0();
  if (!__OFADD__(result, 1))
  {
    int64_t v39 = sub_100017158(v7, result + 1);
    uint64_t v49 = (uint64_t)v39;
    if (v39[3] <= v39[2])
    {
      swift_retain();
      sub_100016C70();
      uint64_t v40 = v49;
    }
    else
    {
      uint64_t v40 = (uint64_t)v39;
      swift_retain();
    }
    sub_1000174DC(a2, v40);
    *Swift::Int v3 = v40;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001D904(void *a1, void *a2)
{
  Swift::Int v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_10003A9C0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_10003A9B0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_1000172E4(v7, result + 1);
    id v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100016EB8();
      double v23 = v28;
    }
    else
    {
      double v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100017580((uint64_t)v8, v23);
    *Swift::Int v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_10003A8F0(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_10003A900();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_10003A900();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *Swift::Int v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10001E000((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *Swift::Int v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10001DBA4(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  double v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100016990();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100015D44();
      goto LABEL_22;
    }
    sub_100016250();
  }
  uint64_t v11 = *v4;
  sub_10003AC90();
  sub_10003A730();
  uint64_t result = sub_10003ACD0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    id v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10003AC40(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10003AC50();
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
        id v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_10003AC40();
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
  id v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *id v21 = v8;
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

void sub_10001DD40(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_100016C70();
    }
    else
    {
      if (v7 > v6)
      {
        sub_100015EF8();
        goto LABEL_23;
      }
      sub_100016500();
    }
    uint64_t v8 = *v3;
    sub_10003AC90();
    sub_100035824();
    Swift::Int v9 = sub_10003ACD0();
    uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
    a2 = v9 & ~v10;
    uint64_t v11 = v8 + 56;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v12 = ~v10;
      type metadata accessor for RhizomeLayoutSpec();
      uint64_t v41 = v8 + 56;
      uint64_t v42 = v8;
      uint64_t v40 = v12;
      do
      {
        uint64_t v13 = *(void *)(*(void *)(v8 + 48) + 8 * a2);
        CGFloat v14 = *(double *)(v13 + 56);
        CGFloat v15 = *(double *)(v13 + 64);
        CGFloat v16 = *(double *)(a1 + 56);
        CGFloat v17 = *(double *)(a1 + 64);
        swift_retain();
        v44.double width = v14;
        v44.double height = v15;
        v45.double width = v16;
        v45.double height = v17;
        if (CGSizeEqualToSize(v44, v45) && CGPointEqualToPoint(*(CGPoint *)(v13 + 136), *(CGPoint *)(a1 + 136)))
        {
          id v18 = *(void **)(v13 + 72);
          char v19 = *(void **)(v13 + 80);
          uint64_t v20 = *(void **)(v13 + 88);
          uint64_t v22 = *(void **)(a1 + 72);
          id v21 = *(void **)(a1 + 80);
          uint64_t v43 = *(void **)(a1 + 88);
          sub_10002255C(0, (unint64_t *)&qword_10004B218);
          id v23 = v18;
          id v24 = v19;
          id v25 = v20;
          id v26 = v22;
          uint64_t v27 = v24;
          id v28 = v26;
          id v29 = v21;
          id v30 = v43;
          if ((sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0)
          {

            swift_release();
LABEL_21:
            uint64_t v11 = v41;
            uint64_t v8 = v42;
            uint64_t v12 = v40;
            goto LABEL_11;
          }
          char v31 = sub_10003A900();

          if ((v31 & 1) == 0)
          {
            swift_release();
            goto LABEL_21;
          }
          int v32 = *(unsigned __int8 *)(v13 + 96);
          int v33 = *(unsigned __int8 *)(a1 + 96);
          swift_release();
          BOOL v34 = v32 == v33;
          uint64_t v11 = v41;
          uint64_t v8 = v42;
          uint64_t v12 = v40;
          if (v34) {
            goto LABEL_26;
          }
        }
        else
        {
          swift_release();
        }
LABEL_11:
        a2 = (a2 + 1) & v12;
      }
      while (((*(void *)(v11 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_23:
  uint64_t v35 = *v39;
  *(void *)(*v39 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v35 + 48) + 8 * a2) = a1;
  uint64_t v36 = *(void *)(v35 + 16);
  BOOL v37 = __OFADD__(v36, 1);
  uint64_t v38 = v36 + 1;
  if (v37)
  {
    __break(1u);
LABEL_26:
    sub_10003AC50();
    __break(1u);
  }
  else
  {
    *(void *)(v35 + 16) = v38;
  }
}

void sub_10001E000(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100016EB8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000160A4();
      goto LABEL_14;
    }
    sub_100016714();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_10003A8F0(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_10003A900();

    if (v12)
    {
LABEL_13:
      sub_10003AC50();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_10003A900();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_10001E188(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(unsigned char *)(*(void *)(a4 + 48) + v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10001E31C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10003AB80();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10003AB80();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10001ECA8();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000316C(&qword_10004B248);
          unint64_t v12 = sub_10000E67C(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for RhizomeLayoutSpec();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10001E520(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10001E534(uint64_t a1)
{
  return sub_100017B9C(0, *(void *)(a1 + 16), 0, (char *)a1, &qword_10004B298);
}

uint64_t sub_10001E564(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_10003AB80();
    swift_bridgeObjectRelease();
  }
  return sub_10003AAA0();
}

uint64_t sub_10001E5E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_10003A800();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10001D374(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_10001E678(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_13;
  }
  unint64_t v2 = sub_1000181A4(0xD000000000000019, 0x800000010003DC50);
  if ((v3 & 1) == 0) {
    goto LABEL_13;
  }
  sub_10000E7B4(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v39);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  v4._rawValue = &off_100045178;
  unint64_t v5 = sub_10003ABF0(v4, v38);
  swift_bridgeObjectRelease();
  if (v5 >= 2) {
    goto LABEL_13;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_13;
  }
  unint64_t v6 = sub_1000181A4(0xD000000000000019, 0x800000010003DC70);
  if ((v7 & 1) == 0) {
    goto LABEL_13;
  }
  sub_10000E7B4(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v39);
  sub_10000316C(&qword_10004B228);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t countAndFlagsBits = v38._countAndFlagsBits;
  if (!*(void *)(a1 + 16)
    || (unint64_t v9 = sub_1000181A4(0xD000000000000013, 0x800000010003DC90), (v10 & 1) == 0)
    || (sub_10000E7B4(*(void *)(a1 + 56) + 32 * v9, (uint64_t)&v39), (swift_dynamicCast() & 1) == 0)
    || (unsigned __int8 v11 = sub_100034E70(v38._countAndFlagsBits, (uint64_t)v38._object), v11 == 5))
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  unsigned __int8 v13 = v11;
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_1000181A4(0xD000000000000016, 0x800000010003DCB0), (v15 & 1) != 0))
  {
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v39);
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v40 + 1))
  {
    swift_bridgeObjectRelease();
    sub_100010148((uint64_t)&v39);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  *(void *)&long long v39 = _swiftEmptyArrayStorage;
  uint64_t v16 = *(void *)(v38._countAndFlagsBits + 16);
  if (v16)
  {
    unsigned __int8 v36 = v13;
    uint64_t v17 = 0;
    p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
    uint64_t v37 = *(void *)(v38._countAndFlagsBits + 16);
    do
    {
      uint64_t v19 = *(void *)(countAndFlagsBits + 8 * v17 + 32);
      swift_bridgeObjectRetain_n();
      if (sub_10000F65C(v19))
      {
        swift_bridgeObjectRelease();
        swift_retain();
        sub_10003A770();
        if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10003A7C0();
        }
        sub_10003A7E0();
        sub_10003A7B0();
        swift_release();
      }
      else
      {
        if (p_ivar_lyt[401] != (void *)-1) {
          swift_once();
        }
        uint64_t v20 = sub_10003A5F0();
        sub_10000325C(v20, (uint64_t)qword_10004D098);
        swift_bridgeObjectRetain();
        id v21 = sub_10003A5D0();
        os_log_type_t v22 = sub_10003A860();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = swift_slowAlloc();
          v38._uint64_t countAndFlagsBits = swift_slowAlloc();
          *(_DWORD *)uint64_t v23 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_10003A6B0();
          unint64_t v26 = v25;
          swift_bridgeObjectRelease();
          *(void *)(v23 + 4) = sub_10000E014(v24, v26, &v38._countAndFlagsBits);
          swift_bridgeObjectRelease_n();
          p_ivar_lyt = (void **)(&RhizomeColorCache + 16);
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to decode layout spec with dictionary %s", (uint8_t *)v23, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v16 = v37;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      ++v17;
    }
    while (v16 != v17);
    swift_bridgeObjectRelease();
    unsigned __int8 v13 = v36;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v27 = [self mainScreen];
  [v27 bounds];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;

  v41.origin.x = v29;
  v41.origin.y = v31;
  v41.size.double width = v33;
  v41.size.double height = v35;
  CGRectGetHeight(v41);
  return v5 | ((unint64_t)v13 << 8);
}

uint64_t sub_10001EBB8(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
  }
  else
  {
    char v4 = a3;
    uint64_t v6 = result;
    type metadata accessor for RhizomeLayoutSpec();
    sub_10001ED04();
    uint64_t result = sub_10003A800();
    uint64_t v13 = result;
    uint64_t v7 = v3 - a2;
    if (v3 == a2) {
      return v13;
    }
    if (v3 > a2)
    {
      if (v4)
      {
        char v10 = (uint64_t *)(v6 + 8 * a2);
        do
        {
          uint64_t v11 = *v10++;
          swift_retain();
          sub_10001D524(&v12, v11);
          swift_release();
          --v7;
        }
        while (v7);
      }
      else
      {
        uint64_t v8 = (uint64_t *)(v6 + 8 * a2);
        do
        {
          uint64_t v9 = *v8++;
          swift_retain();
          sub_10001D524(&v12, v9);
          swift_release();
          --v7;
        }
        while (v7);
      }
      return v13;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10001ECA8()
{
  unint64_t result = qword_10004B250;
  if (!qword_10004B250)
  {
    sub_100002F64(&qword_10004B248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B250);
  }
  return result;
}

unint64_t sub_10001ED04()
{
  unint64_t result = qword_10004B258;
  if (!qword_10004B258)
  {
    type metadata accessor for RhizomeLayoutSpec();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B258);
  }
  return result;
}

uint64_t sub_10001ED5C()
{
  return swift_release();
}

uint64_t sub_10001ED64()
{
  uint64_t v0 = 17;
  unint64_t v1 = &byte_100045238;
  do
  {
    int v3 = *v1++;
    char v2 = v3;
    switch(v3)
    {
      case 4:
      case 5:
      case 6:
      case 7:
        swift_bridgeObjectRelease();
        break;
      default:
        char v4 = sub_10003AC40();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_100017644(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v6 = _swiftEmptyArrayStorage[2];
          unint64_t v5 = _swiftEmptyArrayStorage[3];
          if (v6 >= v5 >> 1) {
            sub_100017644(v5 > 1, v6 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v6 + 1;
          *((unsigned char *)&_swiftEmptyArrayStorage[4] + v6) = v2;
        }
        break;
    }
    --v0;
  }
  while (v0);
  unint64_t v7 = _swiftEmptyArrayStorage[2];
  if (!v7)
  {
LABEL_17:
    swift_release();
    __break(1u);
    JUMPOUT(0x10001EF44);
  }
  unint64_t v8 = sub_10001D23C(v7);
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 >= _swiftEmptyArrayStorage[2])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = *((unsigned __int8 *)&_swiftEmptyArrayStorage[4] + v8);
  swift_release();
  return v9;
}

uint64_t sub_10001EF88(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_10003AB80();
    swift_bridgeObjectRelease();
  }
  sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
  sub_100022598();
  uint64_t result = sub_10003A800();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10003AB80();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        unint64_t v6 = (void *)sub_10003AA90();
        sub_10001D904(&v9, v6);
      }
    }
    else
    {
      unint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_10001D904(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001F0DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10001F1D4(uint64_t result, double a2)
{
  if (qword_10004ACB0 != -1) {
    uint64_t result = swift_once();
  }
  double v3 = *(double *)&qword_10004D0F8;
  if (qword_10004ACC8 != -1) {
    uint64_t result = swift_once();
  }
  if (*(double *)&qword_10004D110 < 0.0)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    double v4 = a2 * 0.5 - v3;
    double v5 = -10.0 - a2 * 0.5;
    uint64_t result = sub_10001D2C8(result, 0.0, *(double *)&qword_10004D110);
    if (v5 >= v4) {
      return sub_10001D2C8(result, v4, v5);
    }
  }
  return result;
}

uint64_t sub_10001F2C4(__int16 a1, uint64_t a2, id a3, double a4)
{
  unint64_t v8 = self;
  p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
  id v10 = [v8 mainScreen];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v50.origin.x = v12;
  v50.origin.y = v14;
  v50.size.double width = v16;
  v50.size.double height = v18;
  double v19 = CGRectGetWidth(v50) * 0.25;
  id v20 = [v8 mainScreen];
  [v20 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  v51.origin.x = v22;
  v51.origin.y = v24;
  v51.size.double width = v26;
  v51.size.double height = v28;
  double v30 = CGRectGetWidth(v51) * 0.75;
  if (v19 > v30)
  {
    __break(1u);
  }
  else
  {
    sub_10001D2C8(v29, v19, v30);
    double v19 = v31;
    LOBYTE(v20) = sub_10001ED64();
    double v32 = (void *)sub_1000388F0((char)v20, (unint64_t)a3, a1);
    double v34 = v33;
    unsigned __int8 v36 = v35;
    uint64_t v37 = qword_10004AD30;
    a3 = v32;
    id v10 = v34;
    p_ivar_lyt = v36;
    if (v37 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  sub_100007928(0, v20 | (unsigned __int16)(a1 << 8), a3, v10, p_ivar_lyt, (uint64_t)v45, *(double *)&qword_10004D180);
  sub_100005530((uint64_t)v45, (uint64_t)v46);
  if (v47)
  {
    double v39 = v48;
    double v38 = v49;
    sub_100005598((uint64_t)v45);
  }
  else
  {
    double v38 = 0.0;
    double v39 = 0.0;
  }
  sub_100012114((char)v20, 0.0, 0.0);
  double v41 = v40;
  double v42 = *(double *)&qword_10004D180;
  type metadata accessor for RhizomeLayoutSpec();
  swift_allocObject();
  uint64_t v43 = sub_100035E14((uint64_t)a3, (uint64_t)v10, (uint64_t)p_ivar_lyt, (char)v20, v39, v38, v19, v38 * 0.5 + a4, v41, v42, 0, a2, 1, 0);

  return v43;
}

uint64_t sub_10001F538(char a1, double a2, double a3)
{
  uint64_t result = sub_10001D23C(2uLL);
  uint64_t v7 = result;
  if ((a1 & 1) == 0) {
    goto LABEL_8;
  }
  if (qword_10004ACD0 != -1) {
    uint64_t result = swift_once();
  }
  a3 = *(double *)&qword_10004D118;
  double v8 = 0.0;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_5:
  if (qword_10004ACC8 != -1) {
    goto LABEL_13;
  }
  while (1)
  {
    double v9 = *(double *)&qword_10004D110 - a2 * 0.25;
    double v10 = a2 * 0.25 + *(double *)&qword_10004D110;
    if (v9 > v10)
    {
      __break(1u);
LABEL_8:
      double v8 = a3 * -0.5 + -30.0;
      a3 = a3 * -0.5 + -20.0;
      if (v7) {
        goto LABEL_5;
      }
LABEL_9:
      double v9 = a2 * -0.25;
      double v10 = a2 * 0.25;
      if (a2 * -0.25 > a2 * 0.25) {
        break;
      }
    }
    uint64_t v11 = sub_10001D2C8(result, v9, v10);
    a2 = v12;
    if (v8 <= a3) {
      return sub_10001D2C8(v11, v8, a3);
    }
    __break(1u);
LABEL_13:
    uint64_t result = swift_once();
  }
  __break(1u);
  return result;
}

uint64_t sub_10001F674(__int16 a1, uint64_t a2, id a3)
{
  unint64_t v9 = sub_10001D23C(4uLL);
  if (v9 > 3)
  {
    __break(1u);
  }
  else
  {
    __int16 v3 = *((unsigned __int8 *)&off_100045278 + v9 + 32);
    double v10 = (void *)sub_1000388F0(*((unsigned char *)&off_100045278 + v9 + 32), (unint64_t)a3, a1);
    double v12 = v11;
    CGFloat v14 = v13;
    uint64_t v15 = qword_10004AD30;
    a3 = v10;
    id v4 = v12;
    id v5 = v14;
    if (v15 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  sub_100007928(0, v3 | (a1 << 8), a3, v4, v5, (uint64_t)v31, *(double *)&qword_10004D180);
  sub_100005530((uint64_t)v31, (uint64_t)v32);
  if (v33)
  {
    double v17 = v34;
    double v16 = v35;
    sub_100005598((uint64_t)v31);
  }
  else
  {
    double v16 = 0.0;
    double v17 = 0.0;
  }
  sub_10001F538(1, v17, v16);
  double v19 = v18;
  double v21 = v20;
  sub_100012114(v3, v18, v20);
  double v23 = v22;
  if (qword_10004AC90 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_10003A5F0();
  sub_10000325C(v24, (uint64_t)qword_10004D0B0);
  double v25 = sub_10003A5D0();
  os_log_type_t v26 = sub_10003A870();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 134219008;
    sub_10003A940();
    *(_WORD *)(v27 + 12) = 2048;
    sub_10003A940();
    *(_WORD *)(v27 + 22) = 2048;
    sub_10003A940();
    *(_WORD *)(v27 + 32) = 2048;
    sub_10003A940();
    *(_WORD *)(v27 + 42) = 2048;
    sub_10003A940();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Generating new birds of paradise flower %ld, position x: %f y: %f and size h: %f w: %f", (uint8_t *)v27, 0x34u);
    swift_slowDealloc();
  }

  double v28 = *(double *)&qword_10004D180;
  type metadata accessor for RhizomeLayoutSpec();
  swift_allocObject();
  uint64_t v29 = sub_100035E14((uint64_t)a3, (uint64_t)v4, (uint64_t)v5, v3, v17, v16, v19, v21, v23, v28, 0, a2, 0, 0);

  return v29;
}

void sub_10001F994(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  double v11 = a5 * 0.5;
  double v12 = a5 * 0.5 + CGRectGetMinX(*(CGRect *)&a1);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.double width = a3;
  v19.size.double height = a4;
  double v13 = CGRectGetMaxX(v19) - v11;
  if (v13 < v12)
  {
    v20.origin.x = a1;
    v20.origin.y = a2;
    v20.size.double width = a3;
    v20.size.double height = a4;
    double v12 = CGRectGetMidX(v20) + -1.0;
    v21.origin.x = a1;
    v21.origin.y = a2;
    v21.size.double width = a3;
    v21.size.double height = a4;
    double v13 = CGRectGetMidX(v21) + 1.0;
  }
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.double width = a3;
  v22.size.double height = a4;
  double v14 = a6 * 0.5;
  double v15 = a6 * 0.5 + CGRectGetMinY(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.double height = a4;
  double v17 = CGRectGetMaxY(v23) - v14;
  if (v17 < v15)
  {
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.double width = a3;
    v24.size.double height = a4;
    double v15 = CGRectGetMidY(v24) + -1.0;
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.double width = a3;
    v25.size.double height = a4;
    double v17 = CGRectGetMidY(v25) + 1.0;
  }
  if (v12 > v13)
  {
    __break(1u);
  }
  else
  {
    uint64_t v18 = sub_10001D2C8(v16, v12, v13);
    if (v15 <= v17)
    {
      sub_10001D2C8(v18, v15, v17);
      return;
    }
  }
  __break(1u);
}

uint64_t sub_10001FAF8(__int16 a1, uint64_t a2, char a3, unint64_t a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  unsigned __int8 v16 = sub_10001ED64();
  double v17 = (void *)sub_1000388F0(v16, a4, a1);
  CGRect v19 = v18;
  CGRect v21 = v20;
  uint64_t v22 = qword_10004AD30;
  id v23 = v17;
  id v24 = v19;
  id v25 = v21;
  if (v22 != -1) {
    swift_once();
  }
  sub_100007928(0, v16 | (unsigned __int16)(a1 << 8), v23, v24, v25, (uint64_t)v37, *(double *)&qword_10004D180);
  sub_100005530((uint64_t)v37, (uint64_t)v38);
  if (v39)
  {
    double v27 = v40;
    double v26 = v41;
    sub_100005598((uint64_t)v37);
  }
  else
  {
    double v26 = 0.0;
    double v27 = 0.0;
  }
  sub_10001F994(a5, a6, a7, a8, v27, v26);
  double v29 = v28;
  double v31 = v30;
  sub_100012114(v16, 0.0, 0.0);
  double v33 = v32;
  double v34 = *(double *)&qword_10004D180;
  type metadata accessor for RhizomeLayoutSpec();
  swift_allocObject();
  uint64_t v35 = sub_100035E14((uint64_t)v23, (uint64_t)v24, (uint64_t)v25, v16, v27, v26, v29, v31, v33, v34, 0, a2, 0, a3 & 1);

  return v35;
}

uint64_t sub_10001FCD4(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 24));
  v43.origin.x = a3;
  v43.origin.y = a4;
  v43.size.double width = a5;
  v43.size.double height = a6;
  double v13 = MinX - CGRectGetMinX(v43);
  v44.origin.x = a3;
  v44.origin.y = a4;
  v44.size.double width = a5;
  v44.size.double height = a6;
  double MaxX = CGRectGetMaxX(v44);
  double v15 = MaxX - CGRectGetMaxX(*(CGRect *)(a1 + 24));
  double MinY = CGRectGetMinY(*(CGRect *)(a1 + 24));
  v45.origin.x = a3;
  v45.origin.y = a4;
  v45.size.double width = a5;
  v45.size.double height = a6;
  double v17 = MinY - CGRectGetMinY(v45);
  v46.origin.x = a3;
  v46.origin.y = a4;
  v46.size.double width = a5;
  v46.size.double height = a6;
  double MaxY = CGRectGetMaxY(v46);
  double v19 = MaxY - CGRectGetMaxY(*(CGRect *)(a1 + 24));
  sub_10000316C(&qword_10004B290);
  initeCGFloat d = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003C1F0;
  *(double *)(inited + 32) = v13;
  *(unsigned char *)(inited + 40) = 0;
  *(double *)(inited + 48) = v15;
  *(unsigned char *)(inited + 56) = 1;
  *(double *)(inited + 64) = v17;
  *(unsigned char *)(inited + 72) = 2;
  *(double *)(inited + 80) = v19;
  *(unsigned char *)(inited + 88) = 3;
  unint64_t v21 = sub_100037F54(inited);
  swift_setDeallocating();
  uint64_t v22 = sub_100014010(v21);
  if (v23) {
    goto LABEL_43;
  }
  if (*(void *)(v21 + 16) && (unint64_t v24 = sub_1000182DC(*(double *)&v22), (v25 & 1) != 0)) {
    int v26 = *(unsigned __int8 *)(*(void *)(v21 + 56) + v24);
  }
  else {
    int v26 = 8;
  }
  uint64_t v27 = swift_bridgeObjectRelease();
  double v28 = *(double *)(a1 + 56);
  double v29 = *(double *)(a1 + 64);
  double v30 = *(double *)(a2 + 56);
  double v31 = *(double *)(a2 + 64);
  if (v28 > v30) {
    double v32 = *(double *)(a1 + 56);
  }
  else {
    double v32 = *(double *)(a2 + 56);
  }
  if (v29 > v31) {
    double v33 = *(double *)(a1 + 64);
  }
  else {
    double v33 = *(double *)(a2 + 64);
  }
  if (v30 < v28) {
    double v28 = *(double *)(a2 + 56);
  }
  double v34 = v28 * 0.5 + -5.0;
  if (v34 > 1.0) {
    double v35 = v34;
  }
  else {
    double v35 = 1.0;
  }
  if (v31 >= v29) {
    double v36 = *(double *)(a1 + 64);
  }
  else {
    double v36 = *(double *)(a2 + 64);
  }
  double v37 = v36 * 0.5 + -5.0;
  if (v37 > 1.0) {
    double v38 = v37;
  }
  else {
    double v38 = 1.0;
  }
  if (v35 < 0.0)
  {
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v39 = sub_10001D2C8(v27, 0.0, v35);
  if (v38 < 0.0)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    JUMPOUT(0x100020044);
  }
  uint64_t v40 = sub_10001D2C8(v39, 0.0, v38);
  switch(v26)
  {
    case 0:
      if (v33 * 0.5 >= 0.0) {
        goto LABEL_31;
      }
      goto LABEL_38;
    case 1:
      if (v33 * 0.5 >= 0.0) {
        goto LABEL_31;
      }
      goto LABEL_40;
    case 2:
      double v42 = v32 * 0.5;
      if (v32 * 0.5 >= 0.0) {
        goto LABEL_35;
      }
      goto LABEL_41;
    case 3:
      double v42 = v32 * 0.5;
      if (v32 * 0.5 < 0.0) {
        goto LABEL_42;
      }
LABEL_35:
      uint64_t result = sub_10001D2C8(v40, -v42, v42);
      break;
    default:
      if (v33 * 0.5 < 0.0) {
        goto LABEL_39;
      }
LABEL_31:
      uint64_t result = sub_10001D2C8(v40, -(v33 * 0.5), v33 * 0.5);
      break;
  }
  return result;
}

uint64_t sub_100020054(__int16 a1, unint64_t *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  unint64_t v62 = (unint64_t)_swiftEmptyArrayStorage;
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&a3);
  if (qword_10004ACD0 != -1) {
    swift_once();
  }
  CGFloat rect = a9;
  double v59 = *(double *)&qword_10004D118;
  v63.origin.x = a7;
  v63.origin.y = a8;
  v63.size.double width = a9;
  CGFloat v20 = a10;
  v63.size.double height = a10;
  double v21 = CGRectGetMaxY(v63);
  v64.origin.x = a3;
  v64.origin.y = a4;
  v64.size.double width = a5;
  v64.size.double height = a6;
  if (CGRectGetMaxY(v64) >= v21)
  {
    double v29 = MaxY;
    if (qword_10004ACC8 != -1) {
      swift_once();
    }
    double MinX = *(double *)&qword_10004D110 + 50.0;
    double MaxX = -50.0;
  }
  else
  {
    if (qword_10004ACC8 != -1) {
      swift_once();
    }
    double v22 = *(double *)&qword_10004D110;
    CGFloat v23 = a7;
    CGFloat v24 = a8;
    CGFloat v25 = rect;
    CGFloat v26 = v20;
    if (*(double *)&qword_10004D110 * 0.5 <= a7)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v23);
      double MaxX = -50.0;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      double MinX = v22 + 50.0;
    }
    double v29 = MaxY;
  }
  double v30 = MinX - MaxX;
  double v31 = v59 - v29;
  double v32 = (void *)*a2;
  uint64_t v33 = sub_10001FAF8(a1, 0, 0, *a2, MaxX, v29, MinX - MaxX, v59 - v29);
  double v34 = *(void **)(v33 + 80);
  double v35 = *(void **)(v33 + 88);
  id v36 = *(id *)(v33 + 72);
  id v37 = v34;
  id v38 = v35;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v32 = sub_100015728(0, v32[2] + 1, 1, v32);
  }
  unint64_t v40 = v32[2];
  unint64_t v39 = v32[3];
  if (v40 >= v39 >> 1) {
    double v32 = sub_100015728((void *)(v39 > 1), v40 + 1, 1, v32);
  }
  v32[2] = v40 + 1;
  double v41 = &v32[3 * v40];
  v41[4] = v36;
  v41[5] = v37;
  v41[6] = v38;
  uint64_t v42 = sub_10001FAF8(a1, 1, 0, (unint64_t)v32, MaxX, v29, v30, v31);
  CGRect v43 = *(void **)(v42 + 80);
  CGRect v44 = *(void **)(v42 + 88);
  id v45 = *(id *)(v42 + 72);
  id v46 = v43;
  id v47 = v44;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    double v32 = sub_100015728(0, v32[2] + 1, 1, v32);
  }
  unint64_t v49 = v32[2];
  unint64_t v48 = v32[3];
  if (v49 >= v48 >> 1) {
    double v32 = sub_100015728((void *)(v48 > 1), v49 + 1, 1, v32);
  }
  v32[2] = v49 + 1;
  CGRect v50 = &v32[3 * v49];
  v50[4] = v45;
  v50[5] = v46;
  v50[6] = v47;
  *a2 = (unint64_t)v32;
  sub_10001FCD4(v33, v42, MaxX, v29, v30, v31);
  *(double *)(v42 + 136) = v51;
  *(double *)(v42 + 144) = v52;
  double v53 = *(double *)(v42 + 56);
  double v54 = *(double *)(v42 + 64);
  *(double *)(v42 + 24) = v51 - v53 * 0.5;
  *(double *)(v42 + 32) = v52 - v54 * 0.5;
  *(double *)(v42 + 40) = v53;
  *(double *)(v42 + 48) = v54;
  swift_retain();
  sub_10003A770();
  if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_10003A7C0();
  }
  sub_10003A7E0();
  sub_10003A7B0();
  swift_retain();
  sub_10003A770();
  if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_10003A7C0();
  }
  sub_10003A7E0();
  sub_10003A7B0();
  if ((v62 & 0x8000000000000000) != 0 || (v62 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v55 = (uint64_t)sub_10001B494(v62);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v55 = v62 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  uint64_t v61 = v55;
  sub_10001B338(&v61, (void (*)(void *))sub_10001BEB0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v56 = v61;
  swift_bridgeObjectRelease();
  return v56;
}

uint64_t sub_100020554(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  if (a4 == a3) {
    goto LABEL_23;
  }
  double v9 = a6;
  double v10 = a5;
  unint64_t v48 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v8 = sub_10001D23C(a4 - a3) + a3;
  if (v8 < 0) {
    goto LABEL_24;
  }
  if (!v8)
  {
    CGRect v43 = _swiftEmptyArrayStorage;
    return sub_10000D96C((unint64_t)v43);
  }
  if (*a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v12 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  do
  {
    while (1)
    {
      unsigned __int8 v13 = sub_10001ED64();
      double v14 = (void *)sub_1000385B0(v13, (void *)a2);
      unsigned __int8 v16 = v15;
      uint64_t v18 = v17;
      uint64_t v19 = qword_10004AD30;
      id v20 = v14;
      id v21 = v16;
      id v22 = v18;
      if (v19 != -1) {
        swift_once();
      }
      sub_100007928(0, ((_WORD)a2 << 8) | v13, v20, v21, v22, (uint64_t)v49, *(double *)&qword_10004D180);
      uint64_t v23 = sub_100005530((uint64_t)v49, (uint64_t)v50);
      if (v51)
      {
        double v25 = v52;
        double v24 = v53;
        uint64_t v23 = sub_100005598((uint64_t)v49);
      }
      else
      {
        double v24 = 0.0;
        double v25 = 0.0;
      }
      uint64_t v26 = sub_10001D2C8(v23, v10, v9);
      double v28 = v27;
      sub_10001D2C8(v26, a7, a8);
      double v30 = v29;
      sub_100012114(v13, 0.0, 0.0);
      double v32 = v31;
      if (v48 >> 62) {
        break;
      }
      uint64_t v33 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v34 = v20;
      id v35 = v21;
      id v36 = v22;
      uint64_t v37 = v12 + v33;
      if (!__OFADD__(v12, v33)) {
        goto LABEL_13;
      }
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_10003AB80();
      swift_bridgeObjectRelease();
    }
    id v39 = v20;
    id v40 = v21;
    id v41 = v22;
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_10003AB80();
    swift_bridgeObjectRelease();
    uint64_t v37 = v12 + v42;
    if (__OFADD__(v12, v42)) {
      goto LABEL_22;
    }
LABEL_13:
    double v38 = *(double *)&qword_10004D180;
    type metadata accessor for RhizomeLayoutSpec();
    swift_allocObject();
    sub_100035E14((uint64_t)v20, (uint64_t)v21, (uint64_t)v22, v13, v25, v24, v28, v30, v32, v38, 0, v37, 0, 1);
    swift_retain();
    sub_10003A770();
    if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10003A7C0();
    }
    sub_10003A7E0();
    sub_10003A7B0();
    swift_release();

    --v8;
  }
  while (v8);
  CGRect v43 = (void *)v48;
  return sub_10000D96C((unint64_t)v43);
}

void sub_100020894(void *a1, unsigned int a2, uint64_t a3)
{
  id v6 = [self currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 != (id)1) {
    return;
  }
  uint64_t v8 = self;
  id v9 = [v8 mainScreen];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v36.origin.x = v11;
  v36.origin.y = v13;
  v36.size.double width = v15;
  v36.size.double height = v17;
  double Width = CGRectGetWidth(v36);
  id v19 = [v8 mainScreen];
  [v19 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v37.origin.x = v21;
  v37.origin.y = v23;
  v37.size.double width = v25;
  v37.size.double height = v27;
  double Height = CGRectGetHeight(v37);
  BOOL v29 = (unint64_t)(a3 - 3) < 2;
  BOOL v30 = Height < Width;
  if (v29 && v30) {
    double v31 = Width;
  }
  else {
    double v31 = Height;
  }
  if (v29 && v30) {
    double Width = Height;
  }
  if (Width < 0.0)
  {
    __break(1u);
  }
  else if (qword_10004ACB0 == -1)
  {
    goto LABEL_9;
  }
  swift_once();
LABEL_9:
  double v32 = *(double *)&qword_10004D0F8;
  if (v31 > v31 + *(double *)&qword_10004D0F8)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_100020554(a1, a2, 3, 5, 0.0, Width, v31, v31 + *(double *)&qword_10004D0F8);
  double v33 = Width + v32;
  if (v31 < 0.0 || Width > v33) {
    goto LABEL_22;
  }
  sub_100020554(a1, a2, 3, 5, Width, v33, 0.0, v31);
  if (v32 < 0.0)
  {
LABEL_23:
    __break(1u);
    return;
  }
  sub_100020554(a1, a2, 3, 5, -v32, 0.0, 0.0, v31);
}

uint64_t sub_100020AFC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (a3 != a2)
  {
    uint64_t v7 = a3;
    uint64_t v8 = result;
    uint64_t v9 = *a4;
    double v10 = (uint64_t *)(*a4 + 8 * a3 - 8);
    uint64_t v14 = result;
LABEL_4:
    uint64_t v11 = *(void *)(v9 + 8 * v7);
    double v16 = v10;
    while (1)
    {
      uint64_t v18 = v11;
      uint64_t v17 = *v10;
      swift_retain();
      swift_retain();
      BOOL v12 = sub_10001420C(&v18, &v17, a5);
      swift_release();
      uint64_t result = swift_release();
      if (v5) {
        break;
      }
      if (v12)
      {
        if (!v9)
        {
          __break(1u);
          return result;
        }
        uint64_t v13 = *v10;
        uint64_t v11 = v10[1];
        *double v10 = v11;
        v10[1] = v13;
        --v10;
        if (v7 != ++v8) {
          continue;
        }
      }
      ++v7;
      double v10 = v16 + 1;
      uint64_t v8 = v14;
      if (v7 != a2) {
        goto LABEL_4;
      }
      return result;
    }
  }
  return result;
}

uint64_t sub_100020C00(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  Swift::Int v5 = a1[1];
  swift_bridgeObjectRetain_n();
  Swift::Int v6 = sub_10003AC10(v5);
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_139;
    }
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_100020AFC(0, v5, 1, a1, a2);
    }
    return swift_bridgeObjectRelease_n();
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_148;
  }
  Swift::Int v108 = v6;
  uint64_t v106 = a1;
  if (v5 < 2)
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
    uint64_t v123 = (uint64_t)_swiftEmptyArrayStorage;
    __dst = (uint64_t *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v5 != 1)
    {
      unint64_t v33 = _swiftEmptyArrayStorage[2];
LABEL_103:
      if (v33 >= 2)
      {
        uint64_t v93 = *v106;
        uint64_t v116 = *v106;
        do
        {
          unint64_t v94 = v33 - 2;
          if (v33 < 2) {
            goto LABEL_134;
          }
          if (!v93) {
            goto LABEL_147;
          }
          uint64_t v95 = v11;
          id v96 = v11 + 32;
          uint64_t v97 = *(void *)&v11[16 * v94 + 32];
          uint64_t v98 = *(void *)&v96[16 * v33 - 8];
          uint64_t v119 = (uint64_t *)(v93 + 8 * v97);
          BOOL v99 = (uint64_t *)(v93 + 8 * *(void *)&v96[16 * v33 - 16]);
          unint64_t v100 = v93 + 8 * v98;
          swift_bridgeObjectRetain();
          sub_10001CCD4(v119, v99, v100, __dst, a2);
          if (v3) {
            break;
          }
          if (v98 < v97) {
            goto LABEL_135;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v95 = sub_10001D228((uint64_t)v95);
          }
          if (v94 >= *((void *)v95 + 2)) {
            goto LABEL_136;
          }
          uint64_t v101 = v95;
          CGFloat v102 = v95 + 32;
          double v103 = &v95[16 * v94 + 32];
          *(void *)double v103 = v97;
          *((void *)v103 + 1) = v98;
          unint64_t v104 = *((void *)v95 + 2);
          if (v33 > v104) {
            goto LABEL_137;
          }
          uint64_t v11 = v101;
          memmove(&v102[16 * v33 - 16], &v102[16 * v33], 16 * (v104 - v33));
          *((void *)v11 + 2) = v104 - 1;
          unint64_t v33 = v104 - 1;
          uint64_t v93 = v116;
        }
        while (v104 > 2);
      }
LABEL_116:
      swift_bridgeObjectRelease();
LABEL_117:
      *(void *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_10003A7B0();
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v7 >> 1;
    type metadata accessor for RhizomeLayoutSpec();
    uint64_t v9 = sub_10003A7D0();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    __dst = (uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v123 = v9;
  }
  Swift::Int v12 = 0;
  uint64_t v13 = *a1;
  uint64_t v107 = *a1 + 16;
  uint64_t v105 = *a1 - 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v14 = v5;
  Swift::Int v110 = v5;
  uint64_t v112 = *a1;
  while (1)
  {
    Swift::Int v15 = v12;
    Swift::Int v16 = v12 + 1;
    if (v12 + 1 < v14)
    {
      uint64_t v17 = *(void *)(v13 + 8 * v16);
      uint64_t v121 = *(void *)(v13 + 8 * v12);
      uint64_t v122 = v17;
      swift_retain();
      swift_retain();
      BOOL v18 = sub_10001420C(&v122, &v121, a2);
      if (v3)
      {
LABEL_115:
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        goto LABEL_117;
      }
      BOOL v19 = v18;
      swift_release();
      swift_release();
      Swift::Int v20 = v15 + 2;
      if (v15 + 2 < v110)
      {
        CGFloat v21 = v11;
        double v22 = (uint64_t *)(v107 + 8 * v15);
        while (1)
        {
          uint64_t v23 = *v22;
          uint64_t v121 = *(v22 - 1);
          uint64_t v122 = v23;
          swift_retain();
          swift_retain();
          BOOL v24 = sub_10001420C(&v122, &v121, a2);
          swift_release();
          swift_release();
          if ((v19 ^ v24)) {
            break;
          }
          ++v22;
          if (v110 == ++v20)
          {
            Swift::Int v20 = v110;
            break;
          }
        }
        uint64_t v11 = v21;
        uint64_t v13 = v112;
      }
      if (v19)
      {
        if (v20 < v15) {
          goto LABEL_143;
        }
        Swift::Int v16 = v20;
        Swift::Int v14 = v110;
        if (v15 < v20)
        {
          CGFloat v25 = (uint64_t *)(v105 + 8 * v20);
          Swift::Int v26 = v20;
          Swift::Int v27 = v15;
          double v28 = (uint64_t *)(v13 + 8 * v15);
          do
          {
            if (v27 != --v26)
            {
              if (!v13) {
                goto LABEL_146;
              }
              uint64_t v29 = *v28;
              *double v28 = *v25;
              *CGFloat v25 = v29;
            }
            ++v27;
            --v25;
            ++v28;
          }
          while (v27 < v26);
        }
      }
      else
      {
        Swift::Int v14 = v110;
        Swift::Int v16 = v20;
      }
    }
    if (v16 >= v14) {
      goto LABEL_41;
    }
    if (__OFSUB__(v16, v15)) {
      goto LABEL_140;
    }
    if (v16 - v15 >= v108) {
      goto LABEL_41;
    }
    if (__OFADD__(v15, v108)) {
      goto LABEL_141;
    }
    uint64_t v30 = v15 + v108 >= v14 ? v14 : v15 + v108;
    if (v30 < v15) {
      break;
    }
    if (v16 != v30)
    {
      uint64_t v115 = v30;
      *(void *)uint64_t v118 = v15;
      uint64_t v83 = v13;
      uint64_t v111 = v11;
      uint64_t v84 = v3;
      float64x2_t v85 = (uint64_t *)(v105 + 8 * v16);
      do
      {
        Swift::Int v86 = v16;
        uint64_t v87 = *(void *)(v83 + 8 * v16);
        Swift::Int v88 = *(void *)v118;
        uint64_t v89 = v85;
        do
        {
          uint64_t v121 = *v89;
          uint64_t v122 = v87;
          swift_retain();
          swift_retain();
          BOOL v90 = sub_10001420C(&v122, &v121, a2);
          if (v84) {
            goto LABEL_115;
          }
          BOOL v91 = v90;
          swift_release();
          swift_release();
          if (!v91) {
            break;
          }
          if (!v83) {
            goto LABEL_145;
          }
          uint64_t v92 = *v89;
          uint64_t v87 = v89[1];
          uint64_t *v89 = v87;
          v89[1] = v92;
          --v89;
          ++v88;
        }
        while (v86 != v88);
        Swift::Int v16 = v86 + 1;
        ++v85;
      }
      while (v86 + 1 != v115);
      Swift::Int v16 = v115;
      uint64_t v3 = 0;
      uint64_t v11 = v111;
      uint64_t v13 = v83;
      Swift::Int v15 = *(void *)v118;
      if (v115 < *(uint64_t *)v118) {
        goto LABEL_138;
      }
      goto LABEL_42;
    }
LABEL_41:
    if (v16 < v15) {
      goto LABEL_138;
    }
LABEL_42:
    Swift::Int v109 = v16;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10001D070(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v32 = *((void *)v11 + 2);
    unint64_t v31 = *((void *)v11 + 3);
    unint64_t v33 = v32 + 1;
    *(void *)unint64_t v117 = v3;
    if (v32 >= v31 >> 1) {
      uint64_t v11 = sub_10001D070((char *)(v31 > 1), v32 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v33;
    id v34 = v11 + 32;
    id v35 = &v11[16 * v32 + 32];
    *(void *)id v35 = v15;
    *((void *)v35 + 1) = v16;
    if (v32)
    {
      while (1)
      {
        unint64_t v36 = v33 - 1;
        if (v33 >= 4)
        {
          id v41 = &v34[16 * v33];
          uint64_t v42 = *((void *)v41 - 8);
          uint64_t v43 = *((void *)v41 - 7);
          BOOL v47 = __OFSUB__(v43, v42);
          uint64_t v44 = v43 - v42;
          if (v47) {
            goto LABEL_123;
          }
          uint64_t v46 = *((void *)v41 - 6);
          uint64_t v45 = *((void *)v41 - 5);
          BOOL v47 = __OFSUB__(v45, v46);
          uint64_t v39 = v45 - v46;
          char v40 = v47;
          if (v47) {
            goto LABEL_124;
          }
          unint64_t v48 = v33 - 2;
          unint64_t v49 = &v34[16 * v33 - 32];
          uint64_t v51 = *(void *)v49;
          uint64_t v50 = *((void *)v49 + 1);
          BOOL v47 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          if (v47) {
            goto LABEL_126;
          }
          BOOL v47 = __OFADD__(v39, v52);
          uint64_t v53 = v39 + v52;
          if (v47) {
            goto LABEL_129;
          }
          if (v53 >= v44)
          {
            uint64_t v71 = &v34[16 * v36];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v47 = __OFSUB__(v72, v73);
            uint64_t v74 = v72 - v73;
            if (v47) {
              goto LABEL_133;
            }
            BOOL v64 = v39 < v74;
            goto LABEL_78;
          }
        }
        else
        {
          if (v33 != 3)
          {
            uint64_t v65 = *((void *)v11 + 4);
            uint64_t v66 = *((void *)v11 + 5);
            BOOL v47 = __OFSUB__(v66, v65);
            uint64_t v58 = v66 - v65;
            char v59 = v47;
            goto LABEL_72;
          }
          uint64_t v38 = *((void *)v11 + 4);
          uint64_t v37 = *((void *)v11 + 5);
          BOOL v47 = __OFSUB__(v37, v38);
          uint64_t v39 = v37 - v38;
          char v40 = v47;
        }
        if (v40) {
          goto LABEL_125;
        }
        unint64_t v48 = v33 - 2;
        double v54 = &v34[16 * v33 - 32];
        uint64_t v56 = *(void *)v54;
        uint64_t v55 = *((void *)v54 + 1);
        BOOL v57 = __OFSUB__(v55, v56);
        uint64_t v58 = v55 - v56;
        char v59 = v57;
        if (v57) {
          goto LABEL_128;
        }
        uint64_t v60 = &v34[16 * v36];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v47 = __OFSUB__(v61, v62);
        uint64_t v63 = v61 - v62;
        if (v47) {
          goto LABEL_131;
        }
        if (__OFADD__(v58, v63)) {
          goto LABEL_132;
        }
        if (v58 + v63 >= v39)
        {
          BOOL v64 = v39 < v63;
LABEL_78:
          if (v64) {
            unint64_t v36 = v48;
          }
          goto LABEL_80;
        }
LABEL_72:
        if (v59) {
          goto LABEL_127;
        }
        uint64_t v67 = &v34[16 * v36];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v47 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v47) {
          goto LABEL_130;
        }
        if (v70 < v58) {
          goto LABEL_89;
        }
LABEL_80:
        unint64_t v75 = v36 - 1;
        if (v36 - 1 >= v33)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (!v13) {
          goto LABEL_144;
        }
        double v76 = &v34[16 * v75];
        uint64_t v77 = *(void *)v76;
        unint64_t v78 = v36;
        uint64_t v79 = &v34[16 * v36];
        uint64_t v80 = *((void *)v79 + 1);
        CGFloat v81 = (uint64_t *)(v13 + 8 * *(void *)v76);
        int v114 = (uint64_t *)(v13 + 8 * *(void *)v79);
        swift_bridgeObjectRetain();
        sub_10001CCD4(v81, v114, v13 + 8 * v80, __dst, a2);
        if (*(void *)v117) {
          goto LABEL_116;
        }
        if (v80 < v77) {
          goto LABEL_120;
        }
        if (v78 > *((void *)v11 + 2)) {
          goto LABEL_121;
        }
        *(void *)double v76 = v77;
        id v34 = v11 + 32;
        *(void *)&v11[16 * v75 + 40] = v80;
        unint64_t v82 = *((void *)v11 + 2);
        if (v78 >= v82) {
          goto LABEL_122;
        }
        unint64_t v33 = v82 - 1;
        memmove(v79, v79 + 16, 16 * (v82 - 1 - v78));
        *((void *)v11 + 2) = v82 - 1;
        uint64_t v13 = v112;
        if (v82 <= 2) {
          goto LABEL_89;
        }
      }
    }
    unint64_t v33 = 1;
LABEL_89:
    Swift::Int v12 = v109;
    Swift::Int v14 = v110;
    uint64_t v3 = *(void *)v117;
    if (v109 >= v110) {
      goto LABEL_103;
    }
  }
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_145:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_146:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_147:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_148:
  swift_bridgeObjectRelease_n();
  uint64_t result = sub_10003AB60();
  __break(1u);
  return result;
}

uint64_t sub_1000214B8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_10001E520(v4);
    *a1 = v4;
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  sub_100020C00(v8, a2);
  swift_bridgeObjectRelease();
  sub_10003AAD0();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_100021564(char *a1, char a2, int a3, uint64_t a4, double a5)
{
  LODWORD(v6) = a3;
  unint64_t v9 = sub_10001D23C(2uLL);
  unint64_t v160 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v10 = v9 + 3;
  if ((uint64_t)(v9 + 3) < 0) {
    goto LABEL_81;
  }
  v154 = a1;
  char v151 = a2;
  uint64_t v11 = _swiftEmptyArrayStorage;
  __int16 v155 = (_WORD)v6 << 8;
  int v156 = (int)v6;
  if (v9 != -3)
  {
    do
    {
      unsigned __int8 v12 = sub_10001ED64();
      swift_bridgeObjectRetain();
      uint64_t v13 = (void *)sub_1000388F0(v12, (unint64_t)v11, (char)v6);
      Swift::Int v15 = v14;
      uint64_t v17 = v16;
      swift_bridgeObjectRelease();
      id v18 = v13;
      id v19 = v15;
      id v20 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = sub_100015728(0, v11[2] + 1, 1, v11);
      }
      unint64_t v22 = v11[2];
      unint64_t v21 = v11[3];
      if (v22 >= v21 >> 1) {
        uint64_t v11 = sub_100015728((void *)(v21 > 1), v22 + 1, 1, v11);
      }
      v11[2] = v22 + 1;
      uint64_t v23 = &v11[3 * v22];
      v23[4] = v18;
      _OWORD v23[5] = v19;
      v23[6] = v20;
      uint64_t v24 = qword_10004AD30;
      id v25 = v18;
      id v26 = v19;
      id v27 = v20;
      if (v24 != -1) {
        swift_once();
      }
      sub_100007928(0, v155 | v12, v25, v26, v27, (uint64_t)v161, *(double *)&qword_10004D180);
      uint64_t v28 = sub_100005530((uint64_t)v161, (uint64_t)v164);
      if (v165)
      {
        double v30 = v166;
        double v29 = v167;
        uint64_t v28 = sub_100005598((uint64_t)v161);
      }
      else
      {
        double v29 = 0.0;
        double v30 = 0.0;
      }
      sub_10001F1D4(v28, v29);
      double v32 = v31;
      double v34 = v33;
      sub_100012114(v12, 0.0, 0.0);
      double v36 = v35;
      if (v160 >> 62)
      {
        id v42 = v25;
        id v43 = v26;
        id v44 = v27;
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_10003AB80();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v37 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v38 = v25;
        id v39 = v26;
        id v40 = v27;
      }
      double v41 = *(double *)&qword_10004D180;
      type metadata accessor for RhizomeLayoutSpec();
      swift_allocObject();
      sub_100035E14((uint64_t)v25, (uint64_t)v26, (uint64_t)v27, v12, v30, v29, v32, v34, v36, v41, 0, v37, 0, 1);
      swift_retain();
      sub_10003A770();
      if (*(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10003A7C0();
      }
      sub_10003A7E0();
      sub_10003A7B0();
      swift_release();

      --v10;
      LODWORD(v6) = v156;
    }
    while (v10);
  }
  if (qword_10004AC88 != -1) {
    goto LABEL_82;
  }
  while (1)
  {
    uint64_t v45 = sub_10003A5F0();
    sub_10000325C(v45, (uint64_t)qword_10004D098);
    uint64_t v46 = sub_10003A5D0();
    os_log_type_t v47 = sub_10003A850();
    unint64_t v48 = &unk_10003C000;
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v49 = swift_slowAlloc();
      v163[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 134218242;
      swift_beginAccess();
      if (v160 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_10003AB80();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v50 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v162[0] = v50;
      sub_10003A940();
      *(_WORD *)(v49 + 12) = 2080;
      type metadata accessor for RhizomeLayoutSpec();
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_10003A7A0();
      unint64_t v53 = v52;
      swift_bridgeObjectRelease();
      v162[0] = sub_10000E014(v51, v53, v163);
      sub_10003A940();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Offscreen layout specs before refinement. Count: %ld specs: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      LODWORD(v6) = v156;
      unint64_t v48 = (void *)&unk_10003C000;
    }
    else
    {
    }
    swift_beginAccess();
    unint64_t v54 = v160;
    uint64_t v55 = qword_10004ACB0;
    swift_bridgeObjectRetain();
    if (v55 != -1) {
      swift_once();
    }
    double v56 = -*(double *)&qword_10004D0F8;
    if (qword_10004ACC0 != -1) {
      swift_once();
    }
    uint64_t v57 = sub_100028DA8(v54, 3, v56, -*(double *)&qword_10004D108);
    swift_bridgeObjectRelease();
    unint64_t v160 = v57;
    swift_bridgeObjectRelease();
    uint64_t v58 = sub_10003A5D0();
    os_log_type_t v59 = sub_10003A850();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = swift_slowAlloc();
      v163[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v60 = v48[30];
      if (v160 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v61 = sub_10003AB80();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v61 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v162[0] = v61;
      sub_10003A940();
      *(_WORD *)(v60 + 12) = 2080;
      type metadata accessor for RhizomeLayoutSpec();
      swift_bridgeObjectRetain();
      id v6 = (id)sub_10003A7A0();
      unint64_t v63 = v62;
      swift_bridgeObjectRelease();
      v162[0] = sub_10000E014((uint64_t)v6, v63, v163);
      sub_10003A940();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Offscreen layout specs after refinement.  Count: %ld specs: %s", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      LODWORD(v6) = v156;
    }
    else
    {
    }
    unint64_t v158 = (unint64_t)_swiftEmptyArrayStorage;
    if (v160 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_10003AB80();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v64 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v65 = sub_10001F2C4((__int16)v6, v64, _swiftEmptyArrayStorage, a5);
    swift_retain();
    sub_10003A770();
    if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10003A7C0();
    }
    sub_10003A7E0();
    sub_10003A7B0();
    uint64_t v66 = *(void **)(v65 + 80);
    uint64_t v67 = *(void **)(v65 + 88);
    id v68 = *(id *)(v65 + 72);
    id v69 = v66;
    id v70 = v67;
    uint64_t v71 = sub_100015728(0, 1, 1, _swiftEmptyArrayStorage);
    unint64_t v73 = v71[2];
    unint64_t v72 = v71[3];
    if (v73 >= v72 >> 1) {
      uint64_t v71 = sub_100015728((void *)(v72 > 1), v73 + 1, 1, v71);
    }
    v71[2] = v73 + 1;
    uint64_t v74 = &v71[3 * v73];
    v74[4] = v68;
    v74[5] = v69;
    v74[6] = v70;
    if (v160 >> 62)
    {
      if ((v160 & 0x8000000000000000) != 0) {
        unint64_t v73 = v160;
      }
      else {
        unint64_t v73 = v160 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      uint64_t v148 = sub_10003AB80();
      swift_bridgeObjectRelease();
      uint64_t v76 = v148 + 1;
      if (!__OFADD__(v148, 1))
      {
LABEL_42:
        swift_bridgeObjectRetain();
        unint64_t v73 = sub_10001F674((__int16)v6, v76, v71);
        swift_bridgeObjectRelease();
        swift_retain();
        sub_10003A770();
        if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          goto LABEL_43;
        }
        goto LABEL_90;
      }
    }
    else
    {
      uint64_t v75 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v76 = v75 + 1;
      if (!__OFADD__(v75, 1)) {
        goto LABEL_42;
      }
    }
    __break(1u);
LABEL_90:
    sub_10003A7C0();
LABEL_43:
    sub_10003A7E0();
    sub_10003A7B0();
    unint64_t v77 = v73;
    unint64_t v78 = *(void **)(v73 + 72);
    uint64_t v79 = *(void **)(v73 + 80);
    v153 = (CGFloat *)v77;
    uint64_t v80 = *(void **)(v77 + 88);
    id v81 = v78;
    id v82 = v79;
    id v83 = v80;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v71 = sub_100015728(0, v71[2] + 1, 1, v71);
    }
    unint64_t v85 = v71[2];
    unint64_t v84 = v71[3];
    if (v85 >= v84 >> 1) {
      uint64_t v71 = sub_100015728((void *)(v84 > 1), v85 + 1, 1, v71);
    }
    v71[2] = v85 + 1;
    Swift::Int v86 = &v71[3 * v85];
    v86[4] = v81;
    v86[5] = v82;
    v86[6] = v83;
    v159 = v71;
    uint64_t v87 = (void *)sub_100020054((__int16)v6, (unint64_t *)&v159, *(CGFloat *)(v65 + 24), *(CGFloat *)(v65 + 32), *(CGFloat *)(v65 + 40), *(CGFloat *)(v65 + 48), v153[3], v153[4], v153[5], v153[6]);
    unint64_t v88 = swift_bridgeObjectRetain();
    sub_10000D96C(v88);
    uint64_t v89 = v154 - 4;
    if (__OFSUB__(v154, 4))
    {
      __break(1u);
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
    if (((unint64_t)v89 & 0x8000000000000000) != 0) {
      goto LABEL_92;
    }
    uint64_t v150 = (uint64_t)v87;
    if (v154 == (char *)4) {
      break;
    }
    v154 = (char *)self;
    BOOL v90 = v159;
    while (1)
    {
      id v91 = [v154 mainScreen];
      [v91 bounds];
      a5 = v92;
      double v94 = v93;

      if (a5 < 0.0) {
        break;
      }
      uint64_t v96 = sub_10001D2C8(v95, 0.0, a5);
      if (v94 < 0.0) {
        goto LABEL_79;
      }
      a5 = v97;
      sub_10001D2C8(v96, 0.0, v94);
      double v99 = v98;
      unsigned __int8 v100 = sub_10001ED64();
      swift_bridgeObjectRetain();
      uint64_t v101 = (void *)sub_1000388F0(v100, (unint64_t)v90, (char)v6);
      double v103 = v102;
      uint64_t v105 = v104;
      swift_bridgeObjectRelease();
      id v106 = v101;
      id v107 = v103;
      id v108 = v105;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        BOOL v90 = sub_100015728(0, v90[2] + 1, 1, v90);
      }
      unint64_t v110 = v90[2];
      unint64_t v109 = v90[3];
      if (v110 >= v109 >> 1) {
        BOOL v90 = sub_100015728((void *)(v109 > 1), v110 + 1, 1, v90);
      }
      v90[2] = v110 + 1;
      uint64_t v111 = &v90[3 * v110];
      v111[4] = v106;
      v111[5] = v107;
      v111[6] = v108;
      uint64_t v112 = qword_10004AD30;
      id v113 = v106;
      id v114 = v107;
      id v6 = v108;
      if (v112 != -1) {
        swift_once();
      }
      sub_100007928(0, v155 | v100, v113, v114, v6, (uint64_t)v162, *(double *)&qword_10004D180);
      sub_100005530((uint64_t)v162, (uint64_t)v163);
      if (v163[1])
      {
        double v116 = *(double *)&v163[7];
        double v115 = *(double *)&v163[8];
        sub_100005598((uint64_t)v162);
      }
      else
      {
        double v115 = 0.0;
        double v116 = 0.0;
      }
      sub_100012114(v100, 0.0, 0.0);
      double v118 = v117;
      if (v158 >> 62)
      {
        id v127 = v113;
        id v128 = v114;
        id v129 = v6;
        swift_bridgeObjectRetain();
        uint64_t v119 = sub_10003AB80();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v119 = *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v120 = v113;
        id v121 = v114;
        id v122 = v6;
      }
      if (v160 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v130 = sub_10003AB80();
        swift_bridgeObjectRelease();
        BOOL v124 = __OFADD__(v119, v130);
        uint64_t v125 = v119 + v130;
        if (v124) {
          goto LABEL_80;
        }
      }
      else
      {
        uint64_t v123 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
        BOOL v124 = __OFADD__(v119, v123);
        uint64_t v125 = v119 + v123;
        if (v124) {
          goto LABEL_80;
        }
      }
      double v126 = *(double *)&qword_10004D180;
      type metadata accessor for RhizomeLayoutSpec();
      swift_allocObject();
      sub_100035E14((uint64_t)v113, (uint64_t)v114, (uint64_t)v6, v100, v116, v115, a5, v99, v118, v126, 0, v125, 0, 1);
      swift_retain();
      sub_10003A770();
      if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10003A7C0();
      }
      sub_10003A7E0();
      sub_10003A7B0();
      swift_release();

      --v89;
      LODWORD(v6) = v156;
      if (!v89)
      {
        v159 = v90;
        goto LABEL_74;
      }
    }
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    swift_once();
  }
LABEL_74:
  uint64_t v87 = self;
  id v131 = [v87 mainScreen];
  [v131 bounds];
  double v133 = v132;

  uint64_t v134 = sub_100028DA8(v158, 9, 0.0, v133);
  swift_bridgeObjectRelease();
  unint64_t v158 = v134;
  sub_100020894(&v158, v6, a4);
  unint64_t v135 = v158;
  unint64_t v157 = v160;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000D96C(v135);
  if ((v157 & 0x8000000000000000) == 0 && (v157 & 0x4000000000000000) == 0)
  {
    uint64_t v136 = v157 & 0xFFFFFFFFFFFFFF8;
    uint64_t v137 = v150;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_77;
  }
LABEL_93:
  uint64_t v137 = v150;
  swift_bridgeObjectRetain();
  unint64_t v149 = swift_bridgeObjectRetain();
  uint64_t v136 = (uint64_t)sub_10001B494(v149);
  swift_bridgeObjectRelease();
LABEL_77:
  unint64_t v157 = v136;
  sub_1000214B8((uint64_t *)&v157, v137);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v138 = [v87 mainScreen];
  [v138 bounds];
  CGFloat v140 = v139;
  CGFloat v142 = v141;
  CGFloat v144 = v143;
  CGFloat v146 = v145;

  v168.origin.x = v140;
  v168.origin.y = v142;
  v168.size.double width = v144;
  v168.size.double height = v146;
  CGRectGetHeight(v168);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v151 & 1u | (v6 << 8);
}

uint64_t sub_10002255C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100022598()
{
  unint64_t result = qword_10004B2C8;
  if (!qword_10004B2C8)
  {
    sub_10002255C(255, (unint64_t *)&qword_10004B2C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B2C8);
  }
  return result;
}

uint64_t sub_100022600(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002265C(char a1)
{
  switch(a1)
  {
    case 1:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C200;
      id v27 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:");
      uint64_t v28 = self;
      id v29 = [v28 blackColor];
      id v30 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      *(void *)(v1 + 32) = v27;
      *(void *)(v1 + 40) = v29;
      *(void *)(v1 + 48) = v30;
      id v31 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:");
      id v32 = [v28 blackColor];
      id v33 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      *(void *)(v1 + 56) = v31;
      *(void *)(v1 + 64) = v32;
      *(void *)(v1 + 72) = v33;
      id v34 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v35 = [v28 blackColor];
      id v36 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      *(void *)(v1 + 80) = v34;
      *(void *)(v1 + 88) = v35;
      *(void *)(v1 + 96) = v36;
      id v37 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v38 = [v28 blackColor];
      id v39 = [v28 blackColor];
      *(void *)(v1 + 104) = v37;
      *(void *)(v1 + 112) = v38;
      *(void *)(v1 + 120) = v39;
      id v40 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      id v41 = [v28 blackColor];
      id v42 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      *(void *)(v1 + 128) = v40;
      *(void *)(v1 + 136) = v41;
      *(void *)(v1 + 144) = v42;
      id v43 = [objc_allocWithZone((Class)UIColor) initWithRed:0.956862745 green:0.31372549 blue:0.349019608 alpha:1.0];
      id v44 = [v28 blackColor];
      id v45 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      *(void *)(v1 + 152) = v43;
      *(void *)(v1 + 160) = v44;
      *(void *)(v1 + 168) = v45;
      id v46 = [objc_allocWithZone((Class)UIColor) initWithRed:0.956862745 green:0.31372549 blue:0.349019608 alpha:1.0];
      id v47 = [v28 blackColor];
      id v48 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      *(void *)(v1 + 176) = v46;
      *(void *)(v1 + 184) = v47;
      *(void *)(v1 + 192) = v48;
      id v24 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      id v25 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v26 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      break;
    case 2:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C200;
      id v49 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:");
      uint64_t v50 = self;
      id v51 = [v50 blackColor];
      id v52 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      *(void *)(v1 + 32) = v49;
      *(void *)(v1 + 40) = v51;
      *(void *)(v1 + 48) = v52;
      id v53 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 0.117647059, 0.564705882);
      id v54 = [v50 blackColor];
      id v55 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      *(void *)(v1 + 56) = v53;
      *(void *)(v1 + 64) = v54;
      *(void *)(v1 + 72) = v55;
      id v56 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v57 = [v50 blackColor];
      id v58 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      *(void *)(v1 + 80) = v56;
      *(void *)(v1 + 88) = v57;
      *(void *)(v1 + 96) = v58;
      id v59 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v60 = [v50 blackColor];
      id v61 = [v50 blackColor];
      *(void *)(v1 + 104) = v59;
      *(void *)(v1 + 112) = v60;
      *(void *)(v1 + 120) = v61;
      id v62 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      id v63 = [v50 blackColor];
      id v64 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 128) = v62;
      *(void *)(v1 + 136) = v63;
      *(void *)(v1 + 144) = v64;
      id v65 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v66 = [v50 blackColor];
      id v67 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 152) = v65;
      *(void *)(v1 + 160) = v66;
      *(void *)(v1 + 168) = v67;
      id v68 = [objc_allocWithZone((Class)UIColor) initWithRed:0.388235294 green:0.674509804 blue:0.525490196 alpha:1.0];
      id v69 = [v50 blackColor];
      id v70 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 176) = v68;
      *(void *)(v1 + 184) = v69;
      *(void *)(v1 + 192) = v70;
      id v24 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v25 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v26 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      break;
    case 3:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C200;
      id v71 = [objc_allocWithZone((Class)UIColor) initWithRed:0.643137255 green:0.37254902 blue:0.796078431 alpha:1.0];
      unint64_t v72 = self;
      id v73 = [v72 blackColor];
      id v74 = [objc_allocWithZone((Class)UIColor) initWithRed:0.364705882 green:0.168627451 blue:0.478431373 alpha:1.0];
      *(void *)(v1 + 32) = v71;
      *(void *)(v1 + 40) = v73;
      *(void *)(v1 + 48) = v74;
      id v75 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:");
      id v76 = [v72 blackColor];
      id v77 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 56) = v75;
      *(void *)(v1 + 64) = v76;
      *(void *)(v1 + 72) = v77;
      id v78 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v79 = [v72 blackColor];
      id v80 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 80) = v78;
      *(void *)(v1 + 88) = v79;
      *(void *)(v1 + 96) = v80;
      id v81 = [objc_allocWithZone((Class)UIColor) initWithRed:0.364705882 green:0.168627451 blue:0.478431373 alpha:1.0];
      id v82 = [v72 blackColor];
      id v83 = [v72 blackColor];
      *(void *)(v1 + 104) = v81;
      *(void *)(v1 + 112) = v82;
      *(void *)(v1 + 120) = v83;
      id v84 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      id v85 = [v72 blackColor];
      id v86 = [objc_allocWithZone((Class)UIColor) initWithRed:0.725490196 green:0.321568627 blue:0.0 alpha:1.0];
      *(void *)(v1 + 128) = v84;
      *(void *)(v1 + 136) = v85;
      *(void *)(v1 + 144) = v86;
      id v87 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      id v88 = [v72 blackColor];
      id v89 = [v72 blackColor];
      *(void *)(v1 + 152) = v87;
      *(void *)(v1 + 160) = v88;
      *(void *)(v1 + 168) = v89;
      id v90 = [objc_allocWithZone((Class)UIColor) initWithRed:0.725490196 green:0.321568627 blue:0.0 alpha:1.0];
      id v91 = [v72 blackColor];
      id v92 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 176) = v90;
      *(void *)(v1 + 184) = v91;
      *(void *)(v1 + 192) = v92;
      id v24 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v25 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v26 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      break;
    case 4:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C200;
      id v93 = [objc_allocWithZone((Class)UIColor) initWithRed:0.51372549 green:0.51372549 blue:0.51372549 alpha:1.0];
      double v94 = self;
      id v95 = [v94 blackColor];
      id v96 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      *(void *)(v1 + 32) = v93;
      *(void *)(v1 + 40) = v95;
      *(void *)(v1 + 48) = v96;
      id v97 = [objc_allocWithZone((Class)UIColor) initWithRed:0.407843137 green:0.407843137 blue:0.407843137 alpha:1.0];
      id v98 = [v94 blackColor];
      id v99 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      *(void *)(v1 + 56) = v97;
      *(void *)(v1 + 64) = v98;
      *(void *)(v1 + 72) = v99;
      id v100 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      id v101 = [v94 blackColor];
      id v102 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      *(void *)(v1 + 80) = v100;
      *(void *)(v1 + 88) = v101;
      *(void *)(v1 + 96) = v102;
      id v103 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      id v104 = [v94 blackColor];
      id v105 = [v94 blackColor];
      *(void *)(v1 + 104) = v103;
      *(void *)(v1 + 112) = v104;
      *(void *)(v1 + 120) = v105;
      id v106 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      id v107 = [v94 blackColor];
      id v108 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      *(void *)(v1 + 128) = v106;
      *(void *)(v1 + 136) = v107;
      *(void *)(v1 + 144) = v108;
      id v109 = [objc_allocWithZone((Class)UIColor) initWithRed:0.407843137 green:0.407843137 blue:0.407843137 alpha:1.0];
      id v110 = [v94 blackColor];
      id v111 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      *(void *)(v1 + 152) = v109;
      *(void *)(v1 + 160) = v110;
      *(void *)(v1 + 168) = v111;
      id v112 = [objc_allocWithZone((Class)UIColor) initWithRed:0.51372549 green:0.51372549 blue:0.51372549 alpha:1.0];
      id v113 = [v94 blackColor];
      id v114 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      *(void *)(v1 + 176) = v112;
      *(void *)(v1 + 184) = v113;
      *(void *)(v1 + 192) = v114;
      id v24 = [objc_allocWithZone((Class)UIColor) initWithRed:0.407843137 green:0.407843137 blue:0.407843137 alpha:1.0];
      id v25 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      id v26 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      break;
    default:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C200;
      id v2 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:");
      uint64_t v3 = self;
      id v4 = [v3 blackColor];
      id v5 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 32) = v2;
      *(void *)(v1 + 40) = v4;
      *(void *)(v1 + 48) = v5;
      id v6 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v7 = [v3 blackColor];
      id v8 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 56) = v6;
      *(void *)(v1 + 64) = v7;
      *(void *)(v1 + 72) = v8;
      id v9 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v10 = [v3 blackColor];
      id v11 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 80) = v9;
      *(void *)(v1 + 88) = v10;
      *(void *)(v1 + 96) = v11;
      id v12 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      id v13 = [v3 blackColor];
      id v14 = [v3 blackColor];
      *(void *)(v1 + 104) = v12;
      *(void *)(v1 + 112) = v13;
      *(void *)(v1 + 120) = v14;
      id v15 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v16 = [v3 blackColor];
      id v17 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 128) = v15;
      *(void *)(v1 + 136) = v16;
      *(void *)(v1 + 144) = v17;
      id v18 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      id v19 = [v3 blackColor];
      id v20 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      *(void *)(v1 + 152) = v18;
      *(void *)(v1 + 160) = v19;
      *(void *)(v1 + 168) = v20;
      id v21 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      id v22 = [v3 blackColor];
      id v23 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 176) = v21;
      *(void *)(v1 + 184) = v22;
      *(void *)(v1 + 192) = v23;
      id v24 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v25 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      id v26 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      break;
  }
  *(void *)(v1 + 200) = v24;
  *(void *)(v1 + 208) = v25;
  *(void *)(v1 + 216) = v26;
  return v1;
}

uint64_t sub_1000239B4(char a1)
{
  switch(a1)
  {
    case 1:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C210;
      id v22 = [objc_allocWithZone((Class)UIColor) initWithRed:0.956862745 green:0.31372549 blue:0.349019608 alpha:1.0];
      id v23 = self;
      id v24 = [v23 blackColor];
      id v25 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      *(void *)(v1 + 32) = v22;
      *(void *)(v1 + 40) = v24;
      *(void *)(v1 + 48) = v25;
      id v26 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      id v27 = [v23 blackColor];
      id v28 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      *(void *)(v1 + 56) = v26;
      *(void *)(v1 + 64) = v27;
      *(void *)(v1 + 72) = v28;
      id v29 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v30 = [v23 blackColor];
      id v31 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      *(void *)(v1 + 80) = v29;
      *(void *)(v1 + 88) = v30;
      *(void *)(v1 + 96) = v31;
      id v32 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v33 = [v23 blackColor];
      id v34 = [v23 blackColor];
      *(void *)(v1 + 104) = v32;
      *(void *)(v1 + 112) = v33;
      *(void *)(v1 + 120) = v34;
      id v16 = [objc_allocWithZone((Class)UIColor) initWithRed:0.658823529 green:0.0 blue:0.031372549 alpha:1.0];
      id v17 = [v23 blackColor];
      id v35 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      break;
    case 2:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C210;
      id v36 = [objc_allocWithZone((Class)UIColor) initWithRed:0.388235294 green:0.674509804 blue:0.525490196 alpha:1.0];
      id v37 = self;
      id v38 = [v37 blackColor];
      id v39 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      *(void *)(v1 + 32) = v36;
      *(void *)(v1 + 40) = v38;
      *(void *)(v1 + 48) = v39;
      id v40 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v41 = [v37 blackColor];
      id v42 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      *(void *)(v1 + 56) = v40;
      *(void *)(v1 + 64) = v41;
      *(void *)(v1 + 72) = v42;
      id v43 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v44 = [v37 blackColor];
      id v45 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      *(void *)(v1 + 80) = v43;
      *(void *)(v1 + 88) = v44;
      *(void *)(v1 + 96) = v45;
      id v46 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v47 = [v37 blackColor];
      id v48 = [v37 blackColor];
      *(void *)(v1 + 104) = v46;
      *(void *)(v1 + 112) = v47;
      *(void *)(v1 + 120) = v48;
      id v16 = [objc_allocWithZone((Class)UIColor) initWithRed:0.203921569 green:0.454901961 blue:0.266666667 alpha:1.0];
      id v17 = [v37 blackColor];
      id v35 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      break;
    case 3:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C210;
      id v49 = [objc_allocWithZone((Class)UIColor) initWithRed:0.643137255 green:0.37254902 blue:0.796078431 alpha:1.0];
      uint64_t v50 = self;
      id v51 = [v50 blackColor];
      id v52 = [objc_allocWithZone((Class)UIColor) initWithRed:0.364705882 green:0.168627451 blue:0.478431373 alpha:1.0];
      *(void *)(v1 + 32) = v49;
      *(void *)(v1 + 40) = v51;
      *(void *)(v1 + 48) = v52;
      id v53 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v54 = [v50 blackColor];
      id v55 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 56) = v53;
      *(void *)(v1 + 64) = v54;
      *(void *)(v1 + 72) = v55;
      id v56 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v57 = [v50 blackColor];
      id v58 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      *(void *)(v1 + 80) = v56;
      *(void *)(v1 + 88) = v57;
      *(void *)(v1 + 96) = v58;
      id v59 = [objc_allocWithZone((Class)UIColor) initWithRed:0.364705882 green:0.168627451 blue:0.478431373 alpha:1.0];
      id v60 = [v50 blackColor];
      id v61 = [v50 blackColor];
      *(void *)(v1 + 104) = v59;
      *(void *)(v1 + 112) = v60;
      *(void *)(v1 + 120) = v61;
      id v16 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      id v17 = [v50 blackColor];
      id v35 = [objc_allocWithZone((Class)UIColor) initWithRed:0.725490196 green:0.321568627 blue:0.0 alpha:1.0];
      break;
    case 4:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C210;
      id v62 = [objc_allocWithZone((Class)UIColor) initWithRed:0.51372549 green:0.51372549 blue:0.51372549 alpha:1.0];
      id v63 = self;
      id v64 = [v63 blackColor];
      id v65 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      *(void *)(v1 + 32) = v62;
      *(void *)(v1 + 40) = v64;
      *(void *)(v1 + 48) = v65;
      id v66 = [objc_allocWithZone((Class)UIColor) initWithRed:0.407843137 green:0.407843137 blue:0.407843137 alpha:1.0];
      id v67 = [v63 blackColor];
      id v68 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      *(void *)(v1 + 56) = v66;
      *(void *)(v1 + 64) = v67;
      *(void *)(v1 + 72) = v68;
      double v5 = 0.2;
      id v69 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      id v70 = [v63 blackColor];
      id v71 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      *(void *)(v1 + 80) = v69;
      *(void *)(v1 + 88) = v70;
      *(void *)(v1 + 96) = v71;
      id v72 = [objc_allocWithZone((Class)UIColor) initWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
      id v73 = [v63 blackColor];
      id v74 = [v63 blackColor];
      *(void *)(v1 + 104) = v72;
      *(void *)(v1 + 112) = v73;
      *(void *)(v1 + 120) = v74;
      id v16 = [objc_allocWithZone((Class)UIColor) initWithRed:0.325490196 green:0.325490196 blue:0.325490196 alpha:1.0];
      id v17 = [v63 blackColor];
      id v18 = objc_allocWithZone((Class)UIColor);
      double v20 = 1.0;
      double v19 = 0.2;
      double v21 = 0.2;
      goto LABEL_7;
    default:
      sub_10000316C(&qword_10004B2A0);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_10003C210;
      id v2 = [objc_allocWithZone((Class)UIColor) initWithRed:0.917647059 green:0.00392156863 blue:0.0509803922 alpha:1.0];
      uint64_t v3 = self;
      id v4 = [v3 blackColor];
      double v5 = 0.0274509804;
      id v6 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 32) = v2;
      *(void *)(v1 + 40) = v4;
      *(void *)(v1 + 48) = v6;
      id v7 = [objc_allocWithZone((Class)UIColor) initWithRed:0.117647059 green:0.564705882 blue:0.333333333 alpha:1.0];
      id v8 = [v3 blackColor];
      id v9 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 56) = v7;
      *(void *)(v1 + 64) = v8;
      *(void *)(v1 + 72) = v9;
      id v10 = [objc_allocWithZone((Class)UIColor) initWithRed:0.164705882 green:0.270588235 blue:0.192156863 alpha:1.0];
      id v11 = [v3 blackColor];
      id v12 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      *(void *)(v1 + 80) = v10;
      *(void *)(v1 + 88) = v11;
      *(void *)(v1 + 96) = v12;
      id v13 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.670588235 blue:0.0274509804 alpha:1.0];
      id v14 = [v3 blackColor];
      id v15 = [v3 blackColor];
      *(void *)(v1 + 104) = v13;
      *(void *)(v1 + 112) = v14;
      *(void *)(v1 + 120) = v15;
      id v16 = [objc_allocWithZone((Class)UIColor) initWithRed:0.439215686 green:0.105882353 blue:0.149019608 alpha:1.0];
      id v17 = [v3 blackColor];
      id v18 = objc_allocWithZone((Class)UIColor);
      double v19 = 1.0;
      double v20 = 1.0;
      double v21 = 0.670588235;
LABEL_7:
      id v35 = [v18 initWithRed:v19 green:v21 blue:v5 alpha:v20];
      break;
  }
  *(void *)(v1 + 128) = v16;
  *(void *)(v1 + 136) = v17;
  *(void *)(v1 + 144) = v35;
  return v1;
}

uint64_t sub_100024664(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = (void **)self;
  p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
  id v5 = [v3 mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v140.origin.x = v7;
  v140.origin.y = v9;
  v140.size.double width = v11;
  v140.size.double height = v13;
  double Width = CGRectGetWidth(v140);
  id v14 = [v3 mainScreen];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v141.origin.x = v16;
  v141.origin.y = v18;
  v141.size.double width = v20;
  v141.size.double height = v22;
  *(double *)v23.i64 = CGRectGetHeight(v141);
  unsigned int v25 = *(double *)v23.i64 < Width && (unint64_t)(a2 - 3) < 2;
  int32x2_t v26 = vdup_n_s32(v25);
  v27.i64[0] = v26.u32[0];
  v27.i64[1] = v26.u32[1];
  *(double *)&v23.i64[1] = Width;
  int8x16_t v133 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v27, 0x3FuLL)), v23, vextq_s8(v23, v23, 8uLL));
  v139[0] = _swiftEmptyArrayStorage;
  sub_1000176B4(0, 13, 0);
  float64x2_t v28 = (float64x2_t)v133;
  id v29 = _swiftEmptyArrayStorage;
  unint64_t v30 = _swiftEmptyArrayStorage[2];
  uint64_t v31 = &stru_100000020;
  do
  {
    float64x2_t v32 = *(float64x2_t *)((char *)&off_1000453E0 + v31);
    v139[0] = v29;
    unint64_t v33 = v29[3];
    if (v30 >= v33 >> 1)
    {
      float64x2_t v130 = v32;
      sub_1000176B4(v33 > 1, v30 + 1, 1);
      float64x2_t v32 = v130;
      float64x2_t v28 = (float64x2_t)v133;
      id v29 = (void *)v139[0];
    }
    v29[2] = v30 + 1;
    *(float64x2_t *)&v29[2 * v30 + 4] = vmulq_f64(v28, v32);
    v31 += 16;
    ++v30;
  }
  while (v31 != 240);
  id v129 = v29;
  v139[0] = _swiftEmptyArrayStorage;
  sub_10001768C(0, 13, 0);
  id v34 = _swiftEmptyArrayStorage;
  if (qword_10004ACB8 != -1) {
LABEL_59:
  }
    swift_once();
  uint64_t v35 = &stru_100000020;
  do
  {
    id v36 = objc_msgSend(v3, (SEL)p_ivar_lyt[36]);
    [v36 scale];

    UISizeRoundToScale();
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    v139[0] = v34;
    unint64_t v42 = v34[2];
    unint64_t v41 = v34[3];
    if (v42 >= v41 >> 1)
    {
      sub_10001768C(v41 > 1, v42 + 1, 1);
      id v34 = (void *)v139[0];
    }
    v34[2] = v42 + 1;
    id v43 = &v34[2 * v42];
    v43[4] = v38;
    v43[5] = v40;
    v35 += 16;
  }
  while (v35 != 240);
  id v131 = v34;
  uint64_t v44 = sub_10002265C(a1);
  uint64_t v45 = sub_1000239B4(a1);
  v139[0] = v44;
  sub_10000DB38(v45);
  uint64_t v46 = v44;
  sub_10000316C(&qword_10004B2E8);
  initeCGFloat d = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003C220;
  CLKDegreesToRadians();
  *(void *)(inited + 32) = v48;
  uint64_t v128 = inited + 32;
  *(_OWORD *)(inited + 40) = 0u;
  *(_OWORD *)(inited + 56) = 0u;
  *(_OWORD *)(inited + 72) = 0u;
  *(_OWORD *)(inited + 88) = 0u;
  *(_OWORD *)(inited + 104) = 0u;
  CLKDegreesToRadians();
  *(void *)(inited + 120) = v49;
  CLKDegreesToRadians();
  *(void *)(inited + 128) = v50;
  unint64_t v137 = (unint64_t)_swiftEmptyArrayStorage;
  if (v34[2] < 0xDuLL)
  {
    __break(1u);
    goto LABEL_61;
  }
  id v51 = v129;
  if (v129[2] < 0xDuLL)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (*(void *)(v46 + 16) < 0xDuLL)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    swift_once();
    goto LABEL_48;
  }
  uint64_t v126 = a2;
  uint64_t v125 = v3;
  unint64_t v52 = 0;
  uint64_t v3 = (void **)(v46 + 48);
  uint64_t v53 = 4;
  do
  {
    double v54 = *(double *)&v34[v53];
    double v55 = *(double *)&v34[v53 + 1];
    uint64_t v56 = v51[v53];
    uint64_t v57 = v51[v53 + 1];
    id v58 = *(v3 - 1);
    id v59 = *v3;
    uint64_t v60 = qword_10004ACD8;
    id v34 = *(v3 - 2);
    p_ivar_lyt = v58;
    id v61 = v59;
    if (v60 != -1) {
      swift_once();
    }
    if (v52 >= *(void *)(qword_10004D120 + 16))
    {
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    char v62 = *(unsigned char *)(qword_10004D120 + v52 + 32);
    uint64_t v63 = *(void *)(v128 + 8 * v52);
    if (qword_10004ACE8 != -1) {
      swift_once();
    }
    if (v52 >= *(void *)(qword_10004D130 + 16)) {
      goto LABEL_58;
    }
    uint64_t v64 = *(void *)(qword_10004D130 + 8 * v52 + 32);
    if (v137 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_10003AB80();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v65 = *(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    type metadata accessor for RhizomeLayoutSpec();
    a2 = swift_allocObject();
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(void *)(a2 + 48) = 0;
    swift_unknownObjectWeakInit();
    *(double *)(a2 + 56) = v54;
    *(double *)(a2 + 64) = v55;
    *(void *)(a2 + 136) = v56;
    *(void *)(a2 + 144) = v57;
    *(void *)(a2 + 72) = v34;
    *(void *)(a2 + 80) = p_ivar_lyt;
    *(void *)(a2 + 88) = v61;
    *(void *)(a2 + 104) = v63;
    swift_unknownObjectWeakAssign();
    *(unsigned char *)(a2 + 96) = v62;
    *(void *)(a2 + 120) = v65;
    *(unsigned char *)(a2 + 128) = v52 == 3;
    *(unsigned char *)(a2 + 129) = 0;
    *(void *)(a2 + 112) = v64;
    double v66 = *(double *)(a2 + 136) - v54 * 0.5;
    double v67 = *(double *)(a2 + 144) - v55 * 0.5;
    *(double *)(a2 + 16) = v54 * v55;
    *(double *)(a2 + 24) = v66;
    *(double *)(a2 + 32) = v67;
    *(double *)(a2 + 40) = v54;
    *(double *)(a2 + 48) = v55;
    swift_retain();
    sub_10003A770();
    if (*(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v137 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10003A7C0();
    }
    ++v52;
    sub_10003A7E0();
    sub_10003A7B0();
    swift_release();
    v3 += 3;
    v53 += 2;
    id v51 = v129;
    id v34 = v131;
  }
  while (v52 != 13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  unint64_t v68 = sub_10001D23C(2uLL);
  unint64_t v136 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v69 = v68 + 3;
  if ((uint64_t)(v68 + 3) < 0) {
    goto LABEL_63;
  }
  if (v68 != -3)
  {
    do
    {
      unsigned __int8 v70 = sub_10001ED64();
      id v71 = (void *)sub_1000385B0(v70, (void *)a1);
      id v73 = v72;
      id v75 = v74;
      uint64_t v76 = qword_10004AD30;
      id v77 = v71;
      id v78 = v73;
      id v79 = v75;
      if (v76 != -1) {
        swift_once();
      }
      sub_100007928(0, ((_WORD)a1 << 8) | v70, v77, v78, v79, (uint64_t)v138, *(double *)&qword_10004D180);
      uint64_t v80 = sub_100005530((uint64_t)v138, (uint64_t)v139);
      if (v139[1])
      {
        double v82 = *(double *)&v139[7];
        double v81 = *(double *)&v139[8];
        uint64_t v80 = sub_100005598((uint64_t)v138);
      }
      else
      {
        double v81 = 0.0;
        double v82 = 0.0;
      }
      sub_10001F1D4(v80, v81);
      double v84 = v83;
      double v86 = v85;
      sub_100012114(v70, 0.0, 0.0);
      double v88 = v87;
      if (v136 >> 62)
      {
        id v94 = v77;
        id v95 = v78;
        id v96 = v79;
        swift_bridgeObjectRetain();
        uint64_t v89 = sub_10003AB80();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v89 = *(void *)((v136 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v90 = v77;
        id v91 = v78;
        id v92 = v79;
      }
      double v93 = *(double *)&qword_10004D180;
      swift_allocObject();
      sub_100035E14((uint64_t)v77, (uint64_t)v78, (uint64_t)v79, v70, v82, v81, v84, v86, v88, v93, 0, v89, 0, 1);
      swift_retain();
      sub_10003A770();
      if (*(void *)((v136 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v136 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10003A7C0();
      }
      sub_10003A7E0();
      sub_10003A7B0();
      swift_release();

      --v69;
    }
    while (v69);
  }
  if (qword_10004AC88 != -1) {
    goto LABEL_64;
  }
LABEL_48:
  uint64_t v97 = sub_10003A5F0();
  sub_10000325C(v97, (uint64_t)qword_10004D098);
  id v98 = sub_10003A5D0();
  os_log_type_t v99 = sub_10003A850();
  if (os_log_type_enabled(v98, v99))
  {
    id v100 = (uint8_t *)swift_slowAlloc();
    v135[0] = swift_slowAlloc();
    *(_DWORD *)id v100 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_10003A7A0();
    unint64_t v103 = v102;
    swift_bridgeObjectRelease();
    uint64_t v134 = sub_10000E014(v101, v103, v135);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v98, v99, "Layouts before refinement %s", v100, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  unint64_t v104 = v136;
  uint64_t v105 = qword_10004ACB0;
  swift_bridgeObjectRetain();
  if (v105 != -1) {
    swift_once();
  }
  double v106 = -*(double *)&qword_10004D0F8;
  if (qword_10004ACC0 != -1) {
    swift_once();
  }
  uint64_t v107 = sub_100028DA8(v104, 3, v106, -*(double *)&qword_10004D108);
  swift_bridgeObjectRelease();
  unint64_t v136 = v107;
  swift_bridgeObjectRelease();
  id v108 = sub_10003A5D0();
  os_log_type_t v109 = sub_10003A850();
  if (os_log_type_enabled(v108, v109))
  {
    id v110 = (uint8_t *)swift_slowAlloc();
    uint64_t v134 = swift_slowAlloc();
    *(_DWORD *)id v110 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v111 = sub_10003A7A0();
    unint64_t v113 = v112;
    swift_bridgeObjectRelease();
    sub_10000E014(v111, v113, &v134);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v108, v109, "Layouts after refinement %s", v110, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v114 = swift_bridgeObjectRetain();
  sub_10000D96C(v114);
  sub_100020894(&v137, a1, v126);
  id v115 = [v125 mainScreen];
  [v115 bounds];
  CGFloat v117 = v116;
  CGFloat v119 = v118;
  CGFloat v121 = v120;
  CGFloat v123 = v122;

  v142.origin.x = v117;
  v142.origin.y = v119;
  v142.size.double width = v121;
  v142.size.double height = v123;
  CGRectGetHeight(v142);
  swift_bridgeObjectRelease();
  return (a1 << 8) | 1;
}

char *sub_1000252B8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    id v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    CGFloat v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_10003ABE0();
  __break(1u);
  return result;
}

char *sub_1000253A4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    id v5 = (char *)(a4 + a1 + 32);
    size_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)sub_10003ABE0();
  __break(1u);
  return result;
}

uint64_t sub_10002548C(int a1, uint64_t a2)
{
  LODWORD(v3) = a1;
  id v4 = [self currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1)
  {
    __int16 v6 = sub_100024664(v3, a2);
    unsigned int v7 = HIBYTE(v6);
    int v8 = v6 & 1;
    return v8 | (v7 << 8);
  }
  id v9 = self;
  id v10 = [v9 mainScreen];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v162.origin.x = v12;
  v162.origin.y = v14;
  v162.size.double width = v16;
  v162.size.double height = v18;
  double Width = CGRectGetWidth(v162);
  id v20 = [v9 mainScreen];
  [v20 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  v163.origin.x = v22;
  v163.origin.y = v24;
  v163.size.double width = v26;
  v163.size.double height = v28;
  double Height = CGRectGetHeight(v163);
  BOOL v30 = (unint64_t)(a2 - 3) < 2;
  BOOL v31 = Height < Width;
  if (v30 && v31) {
    double v32 = Width;
  }
  else {
    double v32 = Height;
  }
  if (v30 && v31) {
    double Width = Height;
  }
  unint64_t v33 = (unint64_t)_swiftEmptyArrayStorage;
  v161[0] = _swiftEmptyArrayStorage;
  sub_1000176B4(0, 8, 0);
  id v34 = _swiftEmptyArrayStorage;
  double v35 = 0.17;
  double v36 = 0.1;
  int64_t v38 = _swiftEmptyArrayStorage[2];
  unint64_t v37 = _swiftEmptyArrayStorage[3];
  int64_t v39 = v37 >> 1;
  int64_t v40 = v38 + 1;
  if (v37 >> 1 <= v38)
  {
LABEL_73:
    sub_1000176B4(v37 > 1, v40, 1);
    id v34 = (void *)v161[0];
    unint64_t v37 = *(void *)(v161[0] + 24);
    int64_t v39 = v37 >> 1;
  }
  v34[2] = v40;
  unint64_t v41 = (double *)&v34[2 * v38];
  v41[4] = Width * v35;
  v41[5] = v32 * v36;
  unint64_t v42 = (char *)(v38 + 2);
  if (v39 < v38 + 2)
  {
    sub_1000176B4(v37 > 1, v38 + 2, 1);
    id v34 = (void *)v161[0];
  }
  v34[2] = v42;
  id v43 = (double *)&v34[2 * v40];
  v43[4] = Width * 0.8;
  v43[5] = v32 * 0.3;
  unint64_t v44 = v34[3];
  uint64_t v45 = (char *)(v38 + 3);
  if (v38 + 3 > (uint64_t)(v44 >> 1)) {
    sub_1000176B4(v44 > 1, v38 + 3, 1);
  }
  uint64_t v46 = v161[0];
  *(void *)(v161[0] + 16) = v45;
  uint64_t v47 = v46 + 16 * (void)v42;
  *(double *)(v47 + 32) = Width * 0.9;
  *(double *)(v47 + 40) = v32 * 0.1;
  unint64_t v48 = *(void *)(v46 + 24);
  uint64_t v49 = (char *)(v38 + 4);
  if (v38 + 4 > (uint64_t)(v48 >> 1))
  {
    sub_1000176B4(v48 > 1, v38 + 4, 1);
    uint64_t v46 = v161[0];
  }
  *(void *)(v46 + 16) = v49;
  uint64_t v50 = v46 + 16 * (void)v45;
  *(double *)(v50 + 32) = Width * 0.1;
  *(double *)(v50 + 40) = v32 * 0.45;
  unint64_t v51 = *(void *)(v46 + 24);
  unint64_t v52 = (char *)(v38 + 5);
  if (v38 + 5 > (uint64_t)(v51 >> 1))
  {
    sub_1000176B4(v51 > 1, v38 + 5, 1);
    uint64_t v46 = v161[0];
  }
  *(void *)(v46 + 16) = v52;
  uint64_t v53 = v46 + 16 * (void)v49;
  *(double *)(v53 + 32) = Width * 0.4;
  *(double *)(v53 + 40) = v32 * 0.6;
  unint64_t v54 = *(void *)(v46 + 24);
  double v55 = (char *)(v38 + 6);
  if (v38 + 6 > (uint64_t)(v54 >> 1)) {
    sub_1000176B4(v54 > 1, v38 + 6, 1);
  }
  uint64_t v56 = v161[0];
  *(void *)(v161[0] + 16) = v55;
  uint64_t v57 = v56 + 16 * (void)v52;
  *(double *)(v57 + 32) = Width * 0.85;
  *(double *)(v57 + 40) = v32 * 0.55;
  unint64_t v58 = *(void *)(v56 + 24);
  id v59 = (char *)(v38 + 7);
  if (v38 + 7 > (uint64_t)(v58 >> 1))
  {
    sub_1000176B4(v58 > 1, v38 + 7, 1);
    uint64_t v56 = v161[0];
  }
  *(void *)(v56 + 16) = v59;
  uint64_t v60 = v56 + 16 * (void)v55;
  *(double *)(v60 + 32) = Width * 0.17;
  *(double *)(v60 + 40) = v32 * 0.85;
  unint64_t v61 = *(void *)(v56 + 24);
  int64_t v62 = v38 + 8;
  if (v62 > (uint64_t)(v61 >> 1))
  {
    sub_1000176B4(v61 > 1, v62, 1);
    uint64_t v56 = v161[0];
  }
  *(void *)(v56 + 16) = v62;
  uint64_t v155 = v56;
  uint64_t v63 = v56 + 16 * (void)v59;
  *(double *)(v63 + 32) = Width * 0.8;
  *(double *)(v63 + 40) = v32 * 0.9;
  v161[0] = v33;
  sub_10001768C(0, 8, 0);
  unint64_t v64 = v33;
  if (qword_10004ACB8 != -1) {
    swift_once();
  }
  uint64_t v65 = 0;
  p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
  do
  {
    id v67 = objc_msgSend(v9, (SEL)p_ivar_lyt[36], v151);
    [v67 scale];

    UISizeRoundToScale();
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    v161[0] = v64;
    unint64_t v73 = *(void *)(v64 + 16);
    unint64_t v72 = *(void *)(v64 + 24);
    if (v73 >= v72 >> 1)
    {
      sub_10001768C(v72 > 1, v73 + 1, 1);
      p_ivar_lyt = (void **)(&RhizomeColorCache + 16);
      unint64_t v64 = v161[0];
    }
    *(void *)(v64 + 16) = v73 + 1;
    unint64_t v74 = v64 + 16 * v73;
    *(void *)(v74 + 32) = v69;
    *(void *)(v74 + 40) = v71;
    v65 += 16;
  }
  while (v65 != 128);
  uint64_t v75 = sub_10002265C(v3);
  sub_10000316C(&qword_10004B2E8);
  initeCGFloat d = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003C200;
  *(void *)(inited + 32) = 0;
  uint64_t v154 = inited + 32;
  *(void *)(inited + 40) = 0;
  CLKDegreesToRadians();
  *(void *)(inited + 48) = v77;
  CLKDegreesToRadians();
  *(void *)(inited + 56) = v78;
  *(void *)(inited + 64) = 0;
  CLKDegreesToRadians();
  *(void *)(inited + 72) = v79;
  CLKDegreesToRadians();
  *(void *)(inited + 80) = v80;
  *(void *)(inited + 88) = 0;
  unint64_t v159 = (unint64_t)_swiftEmptyArrayStorage;
  if (*(void *)(v64 + 16) < 8uLL)
  {
    __break(1u);
    goto LABEL_75;
  }
  uint64_t v81 = v155;
  if (*(void *)(v155 + 16) < 8uLL)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (*(void *)(v75 + 16) < 8uLL)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  char v151 = v9;
  unsigned int v152 = v3;
  unint64_t v33 = 0;
  double v82 = (void **)(v75 + 48);
  uint64_t v3 = 32;
  double Width = 0.5;
  unint64_t v153 = v64;
  do
  {
    double v32 = *(double *)(v64 + v3);
    double v35 = *(double *)(v64 + v3 + 8);
    double v36 = *(double *)(v81 + v3);
    uint64_t v83 = *(void *)(v81 + v3 + 8);
    double v84 = *(v82 - 1);
    int64_t v38 = (int64_t)*v82;
    uint64_t v85 = qword_10004ACE0;
    id v86 = *(v82 - 2);
    id v9 = v84;
    int64_t v40 = (int64_t)(id)v38;
    if (v85 != -1) {
      swift_once();
    }
    unint64_t v37 = *(void *)(qword_10004D128 + 16);
    if (v33 >= v37)
    {
      __break(1u);
LABEL_72:
      __break(1u);
      goto LABEL_73;
    }
    char v87 = *(unsigned char *)(qword_10004D128 + v33 + 32);
    uint64_t v88 = *(void *)(v154 + 8 * v33);
    if (qword_10004ACF0 != -1) {
      swift_once();
    }
    unint64_t v37 = *(void *)(qword_10004D138 + 16);
    if (v33 >= v37) {
      goto LABEL_72;
    }
    uint64_t v89 = *(void *)(qword_10004D138 + 8 * v33 + 32);
    if (v159 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v90 = sub_10003AB80();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v90 = *(void *)((v159 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    type metadata accessor for RhizomeLayoutSpec();
    uint64_t v91 = swift_allocObject();
    *(_OWORD *)(v91 + 16) = 0u;
    *(_OWORD *)(v91 + 32) = 0u;
    *(void *)(v91 + 48) = 0;
    swift_unknownObjectWeakInit();
    *(double *)(v91 + 56) = v32;
    *(double *)(v91 + 64) = v35;
    *(double *)(v91 + 136) = v36;
    *(void *)(v91 + 144) = v83;
    *(void *)(v91 + 72) = v86;
    *(void *)(v91 + 80) = v9;
    *(void *)(v91 + 88) = v40;
    *(void *)(v91 + 104) = v88;
    swift_unknownObjectWeakAssign();
    *(unsigned char *)(v91 + 96) = v87;
    *(void *)(v91 + 120) = v90;
    *(unsigned char *)(v91 + 128) = v33 == 1;
    *(unsigned char *)(v91 + 129) = 0;
    *(void *)(v91 + 112) = v89;
    double v92 = *(double *)(v91 + 136) - v32 * 0.5;
    double v93 = *(double *)(v91 + 144) - v35 * 0.5;
    *(double *)(v91 + 16) = v32 * v35;
    *(double *)(v91 + 24) = v92;
    *(double *)(v91 + 32) = v93;
    *(double *)(v91 + 40) = v32;
    *(double *)(v91 + 48) = v35;
    swift_retain();
    sub_10003A770();
    if (*(void *)((v159 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v159 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10003A7C0();
    }
    ++v33;
    sub_10003A7E0();
    sub_10003A7B0();
    swift_release();
    v82 += 3;
    v3 += 16;
    uint64_t v81 = v155;
    unint64_t v64 = v153;
  }
  while (v33 != 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_100013E78(3uLL, 4uLL);
  unint64_t v94 = sub_10001D23C(2uLL);
  unint64_t v158 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v95 = v94 + 3;
  if ((uint64_t)(v94 + 3) >= 0)
  {
    if (v94 != -3)
    {
      do
      {
        unsigned __int8 v96 = sub_10001ED64();
        uint64_t v97 = (void *)sub_1000385B0(v96, (void *)v152);
        os_log_type_t v99 = v98;
        uint64_t v101 = v100;
        uint64_t v102 = qword_10004AD30;
        id v103 = v97;
        id v104 = v99;
        id v105 = v101;
        if (v102 != -1) {
          swift_once();
        }
        sub_100007928(0, ((_WORD)v152 << 8) | v96, v103, v104, v105, (uint64_t)v160, *(double *)&qword_10004D180);
        uint64_t v106 = sub_100005530((uint64_t)v160, (uint64_t)v161);
        if (v161[1])
        {
          double v108 = *(double *)&v161[7];
          double v107 = *(double *)&v161[8];
          uint64_t v106 = sub_100005598((uint64_t)v160);
        }
        else
        {
          double v107 = 0.0;
          double v108 = 0.0;
        }
        sub_10001F1D4(v106, v107);
        double v110 = v109;
        double v112 = v111;
        sub_100012114(v96, 0.0, 0.0);
        double v114 = v113;
        if (v158 >> 62)
        {
          id v120 = v103;
          id v121 = v104;
          id v122 = v105;
          swift_bridgeObjectRetain();
          uint64_t v115 = sub_10003AB80();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v115 = *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10);
          id v116 = v103;
          id v117 = v104;
          id v118 = v105;
        }
        double v119 = *(double *)&qword_10004D180;
        swift_allocObject();
        sub_100035E14((uint64_t)v103, (uint64_t)v104, (uint64_t)v105, v96, v108, v107, v110, v112, v114, v119, 0, v115, 0, 1);
        swift_retain();
        sub_10003A770();
        if (*(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v158 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10003A7C0();
        }
        sub_10003A7E0();
        sub_10003A7B0();
        swift_release();

        --v95;
      }
      while (v95);
    }
    if (qword_10004AC88 == -1) {
      goto LABEL_61;
    }
    goto LABEL_78;
  }
LABEL_77:
  __break(1u);
LABEL_78:
  swift_once();
LABEL_61:
  uint64_t v123 = sub_10003A5F0();
  sub_10000325C(v123, (uint64_t)qword_10004D098);
  BOOL v124 = sub_10003A5D0();
  os_log_type_t v125 = sub_10003A850();
  if (os_log_type_enabled(v124, v125))
  {
    uint64_t v126 = (uint8_t *)swift_slowAlloc();
    v157[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v126 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v127 = sub_10003A7A0();
    unint64_t v129 = v128;
    swift_bridgeObjectRelease();
    uint64_t v156 = sub_10000E014(v127, v129, v157);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v124, v125, "Layouts before refinement %s", v126, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  unint64_t v130 = v158;
  uint64_t v131 = qword_10004ACB0;
  swift_bridgeObjectRetain();
  if (v131 != -1) {
    swift_once();
  }
  double v132 = -*(double *)&qword_10004D0F8;
  if (qword_10004ACC0 != -1) {
    swift_once();
  }
  uint64_t v133 = sub_100028DA8(v130, 3, v132, -*(double *)&qword_10004D108);
  swift_bridgeObjectRelease();
  unint64_t v158 = v133;
  swift_bridgeObjectRelease();
  uint64_t v134 = sub_10003A5D0();
  os_log_type_t v135 = sub_10003A850();
  if (os_log_type_enabled(v134, v135))
  {
    unint64_t v136 = (uint8_t *)swift_slowAlloc();
    uint64_t v156 = swift_slowAlloc();
    *(_DWORD *)unint64_t v136 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v137 = sub_10003A7A0();
    unint64_t v139 = v138;
    swift_bridgeObjectRelease();
    sub_10000E014(v137, v139, &v156);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v134, v135, "Layouts after refinement %s", v136, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unsigned int v7 = v152;
  unint64_t v140 = swift_bridgeObjectRetain();
  sub_10000D96C(v140);
  id v141 = [v151 mainScreen];
  [v141 bounds];
  CGFloat v143 = v142;
  CGFloat v145 = v144;
  CGFloat v147 = v146;
  CGFloat v149 = v148;

  v164.origin.x = v143;
  v164.origin.y = v145;
  v164.size.double width = v147;
  v164.size.double height = v149;
  CGRectGetHeight(v164);
  swift_bridgeObjectRelease();
  int v8 = 1;
  return v8 | (v7 << 8);
}

uint64_t sub_100026320(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002637C(uint64_t a1)
{
  return a1;
}

unsigned char *storeEnumTagSinglePayload for LayoutState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002649CLL);
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

ValueMetadata *type metadata accessor for LayoutState()
{
  return &type metadata for LayoutState;
}

unint64_t sub_1000264D8()
{
  unint64_t result = qword_10004B310;
  if (!qword_10004B310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B310);
  }
  return result;
}

unint64_t sub_10002652C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7468676952;
      break;
    case 2:
      unint64_t result = 28757;
      break;
    case 3:
      unint64_t result = 1853321028;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      unint64_t result = 1952867660;
      break;
  }
  return result;
}

uint64_t sub_100026604(unsigned __int8 *a1, char *a2)
{
  return sub_100003680(*a1, *a2);
}

Swift::Int sub_100026610()
{
  return sub_1000040AC();
}

uint64_t sub_10002661C()
{
  return sub_100003D3C();
}

Swift::Int sub_100026624()
{
  return sub_1000040AC();
}

uint64_t sub_10002662C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000299D8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10002665C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10002652C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100026688(void *a1@<X8>)
{
  *a1 = &off_100045250;
}

uint64_t sub_100026698(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if (a2 >> 62) {
    goto LABEL_36;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_10003AB80())
  {
    CGFloat v5 = *(double *)(a1 + 56);
    CGFloat v6 = *(double *)(a1 + 64);
    unint64_t v48 = v2;
    uint64_t v49 = a1;
    uint64_t v47 = v4;
    if ((v2 & 0xC000000000000001) == 0)
    {
      uint64_t v27 = 0;
      while (1)
      {
        uint64_t v28 = v27 + 1;
        if (__OFADD__(v27, 1)) {
          goto LABEL_35;
        }
        uint64_t v29 = *(void *)(v2 + 8 * v27 + 32);
        CGFloat v30 = *(double *)(v29 + 56);
        CGFloat v31 = *(double *)(v29 + 64);
        swift_retain();
        v52.double width = v30;
        v52.double height = v31;
        v54.double width = v5;
        v54.double height = v6;
        if (CGSizeEqualToSize(v52, v54) && CGPointEqualToPoint(*(CGPoint *)(v29 + 136), *(CGPoint *)(a1 + 136)))
        {
          double v32 = *(void **)(v29 + 72);
          unint64_t v33 = *(void **)(v29 + 80);
          id v34 = *(void **)(v29 + 88);
          double v36 = *(void **)(a1 + 72);
          double v35 = *(void **)(a1 + 80);
          uint64_t v46 = *(void **)(a1 + 88);
          sub_100012298();
          id v37 = v32;
          id v38 = v33;
          id v39 = v34;
          id v40 = v36;
          id v51 = v35;
          id v41 = v46;
          if (sub_10003A900() & 1) != 0 && (sub_10003A900())
          {
            char v42 = sub_10003A900();

            a1 = v49;
            if (v42)
            {
              int v43 = *(unsigned __int8 *)(v29 + 96);
              int v44 = *(unsigned __int8 *)(v49 + 96);
              swift_release();
              BOOL v26 = v43 == v44;
              uint64_t v4 = v47;
              unint64_t v2 = v48;
              if (v26)
              {
LABEL_33:
                swift_bridgeObjectRelease();
                return 1;
              }
            }
            else
            {
              swift_release();
              uint64_t v4 = v47;
              unint64_t v2 = v48;
            }
          }
          else
          {
            swift_release();

            unint64_t v2 = v48;
            a1 = v49;
            uint64_t v4 = v47;
          }
        }
        else
        {
          swift_release();
        }
        ++v27;
        if (v28 == v4) {
          goto LABEL_37;
        }
      }
    }
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = sub_10003AA90();
      uint64_t v9 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        break;
      }
      uint64_t v10 = v8;
      v53.double width = v5;
      v53.double height = v6;
      if (CGSizeEqualToSize(*(CGSize *)(v8 + 56), v53)
        && CGPointEqualToPoint(*(CGPoint *)(v10 + 136), *(CGPoint *)(a1 + 136)))
      {
        double v11 = *(void **)(v10 + 72);
        CGFloat v12 = *(void **)(v10 + 80);
        double v13 = (void *)a1;
        CGFloat v14 = *(void **)(v10 + 88);
        double v15 = (void *)v13[9];
        CGFloat v16 = (void *)v13[10];
        uint64_t v50 = (void *)v13[11];
        sub_100012298();
        id v17 = v11;
        id v18 = v12;
        id v19 = v14;
        id v20 = v15;
        id v21 = v16;
        id v22 = v50;
        if ((sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0)
        {
          swift_unknownObjectRelease();

LABEL_17:
          unint64_t v2 = v48;
          a1 = v49;
          uint64_t v4 = v47;
          goto LABEL_6;
        }
        char v23 = sub_10003A900();

        if ((v23 & 1) == 0)
        {
          swift_unknownObjectRelease();
          goto LABEL_17;
        }
        int v24 = *(unsigned __int8 *)(v10 + 96);
        a1 = v49;
        int v25 = *(unsigned __int8 *)(v49 + 96);
        swift_unknownObjectRelease();
        BOOL v26 = v24 == v25;
        uint64_t v4 = v47;
        unint64_t v2 = v48;
        if (v26) {
          goto LABEL_33;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
LABEL_6:
      ++v7;
      if (v9 == v4) {
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
  }
LABEL_37:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100026A38(uint64_t *a1, void (*a2)(void *))
{
  uint64_t v4 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_10001E520(v4);
    *a1 = v4;
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  a2(v8);
  return sub_10003AAD0();
}

Swift::Int sub_100026ABC(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_10003AC10(v3);
  if (result >= v3)
  {
    if (v3 < 0)
    {
LABEL_188:
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      sub_10003ABE0();
      __break(1u);
      goto LABEL_194;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v12 = *(void *)(v10 + 8 * i);
        uint64_t v13 = v9;
        do
        {
          CGFloat v14 = (void *)(v10 + 8 * v13);
          if (*(double *)(v12 + 136) >= *(double *)(*v14 + 136)) {
            break;
          }
          if (!v10) {
            goto LABEL_189;
          }
          v14[1] = *v14;
          *(void *)(v10 + 8 * v13--) = v12;
        }
        while (v13 != -1);
        ++v9;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1)
    {
LABEL_194:
      Swift::Int result = sub_10003AB60();
      __break(1u);
      return result;
    }
    id v122 = a1;
    Swift::Int v123 = result;
    if (v3 >= 2)
    {
      uint64_t v6 = v5 >> 1;
      type metadata accessor for RhizomeLayoutSpec();
      uint64_t v7 = sub_10003A7D0();
      *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      uint64_t v8 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
      uint64_t v134 = v7;
      goto LABEL_18;
    }
    double v15 = (char *)_swiftEmptyArrayStorage;
    uint64_t v134 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v8 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 == 1)
    {
LABEL_18:
      Swift::Int v16 = 0;
      uint64_t v17 = *a1;
      uint64_t v126 = v17 - 8;
      double v15 = (char *)_swiftEmptyArrayStorage;
      Swift::Int v18 = v3;
      Swift::Int v124 = v3;
      __dst = v8;
      while (1)
      {
        Swift::Int v20 = v16 + 1;
        if (v16 + 1 < v18)
        {
          uint64_t v21 = *(void *)(v17 + 8 * v20);
          double v22 = *(double *)(v21 + 136);
          double v23 = *(double *)(*(void *)(v17 + 8 * v16) + 136);
          Swift::Int v20 = v16 + 2;
          if (v16 + 2 < v18)
          {
            double v24 = *(double *)(v21 + 136);
            while (1)
            {
              double v25 = v24;
              double v24 = *(double *)(*(void *)(v17 + 8 * v20) + 136);
              if (v22 < v23 == v24 >= v25) {
                break;
              }
              if (v18 == ++v20)
              {
                Swift::Int v20 = v18;
                break;
              }
            }
          }
          if (v22 < v23)
          {
            if (v20 < v16) {
              goto LABEL_184;
            }
            if (v16 < v20)
            {
              BOOL v26 = (uint64_t *)(v126 + 8 * v20);
              Swift::Int v27 = v20;
              Swift::Int v28 = v16;
              uint64_t v29 = (uint64_t *)(v17 + 8 * v16);
              do
              {
                if (v28 != --v27)
                {
                  if (!v17) {
                    goto LABEL_191;
                  }
                  uint64_t v30 = *v29;
                  *uint64_t v29 = *v26;
                  *BOOL v26 = v30;
                }
                ++v28;
                --v26;
                ++v29;
              }
              while (v28 < v27);
            }
          }
        }
        if (v20 < v18)
        {
          if (__OFSUB__(v20, v16)) {
            goto LABEL_179;
          }
          if (v20 - v16 < v123)
          {
            Swift::Int v31 = v16 + v123;
            if (__OFADD__(v16, v123)) {
              goto LABEL_185;
            }
            if (v31 >= v18) {
              Swift::Int v31 = v18;
            }
            if (v31 < v16) {
              goto LABEL_186;
            }
            if (v20 != v31)
            {
              double v32 = (void *)(v126 + 8 * v20);
              do
              {
                uint64_t v33 = *(void *)(v17 + 8 * v20);
                Swift::Int v34 = v16;
                double v35 = v32;
                do
                {
                  uint64_t v36 = *v35;
                  if (*(double *)(v33 + 136) >= *(double *)(*v35 + 136)) {
                    break;
                  }
                  if (!v17) {
                    goto LABEL_187;
                  }
                  *double v35 = v33;
                  v35[1] = v36;
                  --v35;
                  ++v34;
                }
                while (v20 != v34);
                ++v20;
                ++v32;
              }
              while (v20 != v31);
              Swift::Int v20 = v31;
            }
          }
        }
        if (v20 < v16) {
          goto LABEL_178;
        }
        Swift::Int v125 = v20;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          double v15 = sub_10001D070(0, *((void *)v15 + 2) + 1, 1, v15);
        }
        uint64_t v8 = __dst;
        unint64_t v38 = *((void *)v15 + 2);
        unint64_t v37 = *((void *)v15 + 3);
        unint64_t v19 = v38 + 1;
        if (v38 >= v37 >> 1)
        {
          double v114 = sub_10001D070((char *)(v37 > 1), v38 + 1, 1, v15);
          uint64_t v8 = __dst;
          double v15 = v114;
        }
        *((void *)v15 + 2) = v19;
        id v39 = v15 + 32;
        id v40 = &v15[16 * v38 + 32];
        *(void *)id v40 = v16;
        *((void *)v40 + 1) = v125;
        if (v38) {
          break;
        }
        unint64_t v19 = 1;
LABEL_20:
        Swift::Int v18 = v124;
        Swift::Int v16 = v125;
        if (v125 >= v124) {
          goto LABEL_150;
        }
      }
      uint64_t v127 = v15 + 32;
      unint64_t v128 = v15;
      while (1)
      {
        unint64_t v41 = v19 - 1;
        if (v19 >= 4)
        {
          uint64_t v46 = &v39[16 * v19];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_167;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_168;
          }
          unint64_t v53 = v19 - 2;
          CGSize v54 = &v39[16 * v19 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_170;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_173;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_177;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_90;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v70 = *((void *)v15 + 4);
            uint64_t v71 = *((void *)v15 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_84;
          }
          uint64_t v43 = *((void *)v15 + 4);
          uint64_t v42 = *((void *)v15 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_169;
        }
        unint64_t v53 = v19 - 2;
        id v59 = &v39[16 * v19 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_172;
        }
        uint64_t v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_175;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_176;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_90:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_92;
        }
LABEL_84:
        if (v64) {
          goto LABEL_171;
        }
        unint64_t v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_174;
        }
        if (v75 < v63) {
          goto LABEL_20;
        }
LABEL_92:
        if (v41 - 1 >= v19)
        {
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
          goto LABEL_180;
        }
        if (!v17) {
          goto LABEL_190;
        }
        unint64_t v132 = v41 - 1;
        uint64_t v131 = &v39[16 * v41 - 16];
        uint64_t v80 = *(void *)v131;
        int64_t v133 = v41;
        uint64_t v81 = &v39[16 * v41];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        unint64_t v130 = v81;
        double v84 = (char *)(v17 + 8 * *(void *)v131);
        uint64_t v85 = (char *)(v17 + 8 * *(void *)v81);
        uint64_t v86 = v17;
        unint64_t v87 = v17 + 8 * v82;
        uint64_t v88 = v85 - v84;
        uint64_t v89 = v85 - v84 + 7;
        if (v85 - v84 >= 0) {
          uint64_t v89 = v85 - v84;
        }
        uint64_t v90 = v89 >> 3;
        uint64_t v91 = v87 - (void)v85;
        uint64_t v92 = v87 - (void)v85 + 7;
        if ((uint64_t)(v87 - (void)v85) >= 0) {
          uint64_t v92 = v87 - (void)v85;
        }
        uint64_t v93 = v92 >> 3;
        if (v90 >= v92 >> 3)
        {
          if (v91 < -7) {
            goto LABEL_193;
          }
          if ((unint64_t)v8 >= v87 || v8 != v85)
          {
            uint64_t v100 = *(void *)v131;
            uint64_t v101 = v82;
            memmove(v8, v85, 8 * v93);
            uint64_t v82 = v101;
            uint64_t v80 = v100;
            uint64_t v8 = __dst;
          }
          unsigned __int8 v96 = &v8[8 * v93];
          if (v80 >= v83 || v91 < 8)
          {
            uint64_t v97 = v8;
            uint64_t v17 = v86;
            goto LABEL_138;
          }
          uint64_t v102 = (char *)(v126 + 8 * v82);
          id v103 = v85;
          uint64_t v17 = v86;
          while (2)
          {
            id v104 = v102 + 8;
            uint64_t v106 = *((void *)v103 - 1);
            v103 -= 8;
            uint64_t v105 = v106;
            if (*(double *)(*((void *)v96 - 1) + 136) >= *(double *)(v106 + 136))
            {
              uint64_t v105 = *((void *)v96 - 1);
              id v103 = v85;
              if (v104 != v96)
              {
                v96 -= 8;
                goto LABEL_131;
              }
              BOOL v107 = v102 >= v96;
              v96 -= 8;
              if (v107) {
LABEL_131:
              }
                *(void *)uint64_t v102 = v105;
            }
            else if (v104 != v85 || v102 >= v85)
            {
              goto LABEL_131;
            }
            if (v84 >= v103 || (v102 -= 8, uint64_t v85 = v103, v8 >= v96))
            {
              uint64_t v97 = v8;
              uint64_t v85 = v103;
              goto LABEL_138;
            }
            continue;
          }
        }
        if (v88 < -7) {
          goto LABEL_193;
        }
        uint64_t v17 = v86;
        if (v8 != v84 || v8 >= v85)
        {
          uint64_t v94 = *(void *)v131;
          uint64_t v95 = v82;
          memmove(v8, v84, 8 * v90);
          uint64_t v82 = v95;
          uint64_t v80 = v94;
          uint64_t v8 = __dst;
        }
        unsigned __int8 v96 = &v8[8 * v90];
        if (v83 < v82 && v88 >= 8)
        {
          uint64_t v97 = v8;
          while (1)
          {
            uint64_t v98 = *(void *)v85;
            if (*(double *)(*(void *)v85 + 136) >= *(double *)(*(void *)v97 + 136)) {
              break;
            }
            BOOL v99 = v84 == v85;
            v85 += 8;
            if (!v99) {
              goto LABEL_111;
            }
LABEL_112:
            v84 += 8;
            if (v97 >= v96 || (unint64_t)v85 >= v87) {
              goto LABEL_136;
            }
          }
          uint64_t v98 = *(void *)v97;
          BOOL v99 = v84 == v97;
          v97 += 8;
          if (v99) {
            goto LABEL_112;
          }
LABEL_111:
          *(void *)double v84 = v98;
          goto LABEL_112;
        }
        uint64_t v97 = v8;
LABEL_136:
        uint64_t v85 = v84;
LABEL_138:
        uint64_t v108 = v96 - v97;
        uint64_t v109 = v96 - v97 + 7;
        if (v108 >= 0) {
          uint64_t v109 = v108;
        }
        if (v108 <= -8) {
          goto LABEL_193;
        }
        uint64_t v110 = v109 >> 3;
        if (v85 != v97 || v85 >= &v97[8 * v110])
        {
          uint64_t v111 = v80;
          uint64_t v112 = v82;
          memmove(v85, v97, 8 * v110);
          uint64_t v82 = v112;
          uint64_t v80 = v111;
        }
        if (v82 < v80) {
          goto LABEL_164;
        }
        double v15 = v128;
        if (v133 > *((void *)v128 + 2)) {
          goto LABEL_165;
        }
        *(void *)uint64_t v131 = v80;
        id v39 = v127;
        *(void *)&v127[16 * v132 + 8] = v82;
        unint64_t v113 = *((void *)v128 + 2);
        if (v133 >= (uint64_t)v113) {
          goto LABEL_166;
        }
        unint64_t v19 = v113 - 1;
        memmove(v130, v130 + 16, 16 * (v113 - 1 - v133));
        *((void *)v128 + 2) = v113 - 1;
        uint64_t v8 = __dst;
        if (v113 <= 2) {
          goto LABEL_20;
        }
      }
    }
    unint64_t v19 = _swiftEmptyArrayStorage[2];
LABEL_150:
    if (v19 >= 2)
    {
      uint64_t v115 = *v122;
      while (1)
      {
        unint64_t v116 = v19 - 2;
        if (v19 < 2) {
          break;
        }
        if (!v115) {
          goto LABEL_192;
        }
        id v117 = v8;
        uint64_t v118 = *(void *)&v15[16 * v116 + 32];
        uint64_t v119 = *(void *)&v15[16 * v19 + 24];
        sub_1000273E0((char *)(v115 + 8 * v118), (char *)(v115 + 8 * *(void *)&v15[16 * v19 + 16]), v115 + 8 * v119, v8);
        if (v1) {
          goto LABEL_161;
        }
        if (v119 < v118) {
          goto LABEL_181;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          double v15 = sub_10001D228((uint64_t)v15);
        }
        if (v116 >= *((void *)v15 + 2)) {
          goto LABEL_182;
        }
        id v120 = &v15[16 * v116 + 32];
        *(void *)id v120 = v118;
        *((void *)v120 + 1) = v119;
        unint64_t v121 = *((void *)v15 + 2);
        if (v19 > v121) {
          goto LABEL_183;
        }
        memmove(&v15[16 * v19 + 16], &v15[16 * v19 + 32], 16 * (v121 - v19));
        *((void *)v15 + 2) = v121 - 1;
        unint64_t v19 = v121 - 1;
        uint64_t v8 = v117;
        if (v121 <= 2) {
          goto LABEL_161;
        }
      }
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
      goto LABEL_188;
    }
LABEL_161:
    swift_bridgeObjectRelease();
    *(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
    sub_10003A7B0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000273E0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 7;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  double v24 = __src;
  double v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      Swift::Int v16 = &v4[8 * v13];
      double v22 = v16;
      double v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v17 = (char *)(a3 - 8);
        while (1)
        {
          Swift::Int v18 = v17 + 8;
          unint64_t v19 = v6 - 8;
          uint64_t v20 = *((void *)v6 - 1);
          if (*(double *)(*((void *)v16 - 1) + 136) >= *(double *)(v20 + 136))
          {
            double v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *(void *)uint64_t v17 = *((void *)v16 - 1);
            }
            v16 -= 8;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *(void *)uint64_t v17 = v20;
            }
            double v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 8;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    CGFloat v14 = &v4[8 * v10];
    double v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(double *)(*(void *)v6 + 136) >= *(double *)(*(void *)v4 + 136))
        {
          if (v7 != v4) {
            *(void *)uint64_t v7 = *(void *)v4;
          }
          v4 += 8;
          double v23 = v4;
          double v15 = v6;
        }
        else
        {
          double v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(void *)uint64_t v7 = *(void *)v6;
          }
        }
        v7 += 8;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      double v24 = v7;
    }
LABEL_42:
    sub_10001D16C((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_10003ABE0();
  __break(1u);
  return result;
}

void sub_100027660()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *(void *)(*v0 + 16);
  unint64_t v3 = v2 - 2;
  if (v2 >= 2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      swift_stdlib_random();
      uint64_t v6 = (0 * (unsigned __int128)v2) >> 64;
      if (v2)
      {
        if (-(uint64_t)v2 % v2)
        {
          while (1)
            swift_stdlib_random();
        }
      }
      unint64_t v8 = v4 + v6;
      if (__OFADD__(v4, v6)) {
        break;
      }
      if (v4 != v8)
      {
        unint64_t v9 = *(void *)(v1 + 16);
        if (v4 >= v9) {
          goto LABEL_18;
        }
        if (v8 >= v9) {
          goto LABEL_19;
        }
        char v10 = *(unsigned char *)(v1 + 32 + v4);
        char v11 = *(unsigned char *)(v1 + 32 + v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v1 = sub_10001E534(v1);
        }
        unint64_t v12 = *(void *)(v1 + 16);
        if (v4 >= v12) {
          goto LABEL_20;
        }
        *(unsigned char *)(v1 + 32 + v4) = v11;
        if (v8 >= v12) {
          goto LABEL_21;
        }
        *(unsigned char *)(v1 + 32 + v8) = v10;
        *uint64_t v0 = v1;
      }
      --v2;
      if (v4++ == v3) {
        return;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
}

void *sub_1000277A8(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_23:
    uint64_t v4 = sub_10003AB80();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      unint64_t v5 = 0;
      unint64_t v6 = v3 & 0xC000000000000001;
      uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8;
      uint64_t v19 = v4;
      unint64_t v20 = v3;
      unint64_t v18 = v3 & 0xC000000000000001;
      while (1)
      {
        if (v6)
        {
          uint64_t v7 = sub_10003AA90();
          unint64_t v8 = v5 + 1;
          if (__OFADD__(v5, 1))
          {
LABEL_20:
            __break(1u);
            return _swiftEmptyArrayStorage;
          }
        }
        else
        {
          if (v5 >= *(void *)(v26 + 16))
          {
            __break(1u);
            goto LABEL_23;
          }
          uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
          swift_retain();
          unint64_t v8 = v5 + 1;
          if (__OFADD__(v5, 1)) {
            goto LABEL_20;
          }
        }
        if (!CGSizeEqualToSize(*(CGSize *)(v7 + 56), *(CGSize *)(a2 + 56))
          || !CGPointEqualToPoint(*(CGPoint *)(v7 + 136), *(CGPoint *)(a2 + 136)))
        {
          goto LABEL_15;
        }
        unint64_t v9 = *(void **)(v7 + 72);
        char v10 = *(void **)(v7 + 80);
        char v11 = *(void **)(v7 + 88);
        double v24 = *(void **)(a2 + 80);
        uint64_t v21 = *(void **)(a2 + 72);
        double v22 = *(void **)(a2 + 88);
        sub_100012298();
        id v12 = v9;
        id v23 = v10;
        id v13 = v11;
        id v14 = v21;
        id v25 = v24;
        id v15 = v22;
        if ((sub_10003A900() & 1) == 0 || (sub_10003A900() & 1) == 0) {
          break;
        }
        char v16 = sub_10003A900();

        uint64_t v4 = v19;
        unint64_t v3 = v20;
        unint64_t v6 = v18;
        if ((v16 & 1) == 0 || *(unsigned __int8 *)(v7 + 96) != *(unsigned __int8 *)(a2 + 96)) {
          goto LABEL_15;
        }
        swift_release();
LABEL_16:
        ++v5;
        if (v8 == v4) {
          return _swiftEmptyArrayStorage;
        }
      }

      uint64_t v4 = v19;
      unint64_t v3 = v20;
      unint64_t v6 = v18;
LABEL_15:
      sub_10003AAC0();
      sub_10003AAF0();
      sub_10003AB00();
      sub_10003AAD0();
      goto LABEL_16;
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100027A1C(uint64_t a1, unint64_t a2, char a3)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10003AB80();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6)
  {
    char v7 = a3;
    if ((a2 & 0xC000000000000001) != 0)
    {
      char v8 = 0;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v10 = sub_10003AA90();
        uint64_t v11 = v10;
        if (v7)
        {
          if (*(double *)(a1 + 16) >= *(double *)(v10 + 16)) {
            uint64_t v12 = v10;
          }
          else {
            uint64_t v12 = a1;
          }
          uint64_t v13 = swift_retain();
          if (sub_100035CE8(v13, a1)) {
            id v14 = (double *)v11;
          }
          else {
            id v14 = (double *)a1;
          }
          double v15 = v14[7];
          double v16 = *(double *)(v12 + 136);
          double v17 = *(double *)(v12 + 144);
          double v18 = v14[17];
          double v19 = v14[18];
          swift_retain();
          swift_unknownObjectRelease();
          swift_release();
          double v20 = vabdd_f64(v17, v19);
          double v21 = v14[8];
          swift_release();
          if (v20 < v21 * 0.5) {
            v8 |= vabdd_f64(v16, v18) < v15 * 0.5;
          }
        }
        else if (v8)
        {
          swift_unknownObjectRelease();
          char v8 = 1;
        }
        else
        {
          char v8 = CGRectIntersectsRect(*(CGRect *)(a1 + 24), *(CGRect *)(v10 + 24));
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      char v8 = 0;
      id v23 = (uint64_t *)(a2 + 32);
      do
      {
        uint64_t v24 = *v23;
        if (v7)
        {
          if (*(double *)(a1 + 16) >= *(double *)(v24 + 16)) {
            uint64_t v25 = *v23;
          }
          else {
            uint64_t v25 = a1;
          }
          swift_retain();
          uint64_t v26 = swift_retain();
          if (sub_100035CE8(v26, a1)) {
            Swift::Int v27 = (double *)v24;
          }
          else {
            Swift::Int v27 = (double *)a1;
          }
          double v28 = v27[7];
          double v29 = *(double *)(v25 + 136);
          double v30 = *(double *)(v25 + 144);
          double v31 = v27[17];
          double v32 = v27[18];
          swift_retain();
          swift_release();
          swift_release();
          double v33 = vabdd_f64(v30, v32);
          double v34 = v27[8];
          swift_release();
          if (v33 < v34 * 0.5) {
            v8 |= vabdd_f64(v29, v31) < v28 * 0.5;
          }
        }
        else
        {
          char v8 = (v8 & 1) != 0 || CGRectIntersectsRect(*(CGRect *)(a1 + 24), *(CGRect *)(v24 + 24));
        }
        ++v23;
        --v6;
      }
      while (v6);
    }
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_100027C88(uint64_t a1, unint64_t a2, char a3, double a4, double a5)
{
  int v9 = a3 & 1;
  uint64_t v10 = sub_10003A5F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v14 = (uint64_t)v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  double v17 = (char *)v114 - v16;
  __chkstk_darwin(v15);
  double v19 = (char *)v114 - v18;
  unint64_t v135 = a2;
  char v20 = sub_100027A1C(a1, a2, v9);
  int v134 = v9;
  if ((v20 & 1) == 0)
  {
    if (qword_10004AC90 == -1) {
      goto LABEL_86;
    }
    goto LABEL_114;
  }
  CGFloat v121 = *(double *)(a1 + 136);
  CGFloat v120 = *(double *)(a1 + 144);
  double v142 = (void **)&off_100045250;
  sub_100027660();
  double v22 = v142;
  id v23 = v142[2];
  uint64_t v122 = v10;
  uint64_t v126 = v23;
  if (!v23)
  {
    swift_release();
    uint64_t v132 = 3;
LABEL_97:
    v146.x = v121;
    v146.y = v120;
    if (CGPointEqualToPoint(v146, *(CGPoint *)(a1 + 136))) {
      goto LABEL_111;
    }
    if (qword_10004AC90 == -1)
    {
LABEL_99:
      uint64_t v103 = sub_10000325C(v10, (uint64_t)qword_10004D0B0);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v17, v103, v10);
      swift_retain_n();
      id v104 = sub_10003A5D0();
      uint64_t v105 = v17;
      os_log_type_t v106 = sub_10003A850();
      if (os_log_type_enabled(v104, v106))
      {
        uint64_t v127 = v105;
        uint64_t v107 = 0xD000000000000010;
        uint64_t v108 = swift_slowAlloc();
        uint64_t v109 = (void **)swift_slowAlloc();
        *(_DWORD *)uint64_t v108 = 134218754;
        uint64_t v141 = *(void *)(a1 + 120);
        double v142 = v109;
        sub_10003A940();
        *(_WORD *)(v108 + 12) = 2080;
        unint64_t v110 = 0x800000010003CFB0;
        switch((int)v132)
        {
          case 1:
            unint64_t v110 = 0xE500000000000000;
            uint64_t v107 = 0x7468676952;
            break;
          case 2:
            unint64_t v110 = 0xE200000000000000;
            uint64_t v107 = 28757;
            break;
          case 3:
            unint64_t v110 = 0xE400000000000000;
            uint64_t v107 = 1853321028;
            break;
          case 4:
            break;
          case 5:
            uint64_t v107 = 0xD000000000000011;
            uint64_t v111 = "Diagonal Up Right";
            goto LABEL_109;
          case 6:
            uint64_t v107 = 0xD000000000000012;
            uint64_t v111 = "Diagonal Down Left";
            goto LABEL_109;
          case 7:
            uint64_t v107 = 0xD000000000000013;
            uint64_t v111 = "Diagonal Down Right";
LABEL_109:
            unint64_t v110 = (unint64_t)(v111 - 32) | 0x8000000000000000;
            break;
          default:
            unint64_t v110 = 0xE400000000000000;
            uint64_t v107 = 1952867660;
            break;
        }
        uint64_t v141 = sub_10000E014(v107, v110, (uint64_t *)&v142);
        sub_10003A940();
        swift_bridgeObjectRelease();
        *(_WORD *)(v108 + 22) = 2048;
        uint64_t v141 = *(void *)(a1 + 136);
        sub_10003A940();
        swift_release_n();
        *(_WORD *)(v108 + 32) = 2048;
        uint64_t v141 = *(void *)(a1 + 144);
        sub_10003A940();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v104, v106, "Pushed spec %ld %s to position x: %f y: %f", (uint8_t *)v108, 0x2Au);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v11 + 8))(v127, v122);
        LOBYTE(v9) = v134;
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v105, v10);
      }
LABEL_111:
      char v102 = sub_100027A1C(a1, v135, v9) ^ 1;
      return v102 & 1;
    }
LABEL_117:
    swift_once();
    goto LABEL_99;
  }
  uint64_t v14 = v135;
  if (!(v135 >> 62))
  {
    uint64_t v24 = *(void *)((v135 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_5;
  }
  unint64_t v113 = v142;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_10003AB80();
  swift_bridgeObjectRelease();
  if (v24 < 0)
  {
    __break(1u);
    goto LABEL_117;
  }
  double v22 = v113;
LABEL_5:
  unint64_t v25 = 0;
  Swift::Int v123 = (_UNKNOWN **)(v22 + 4);
  unint64_t v130 = v14 & 0xC000000000000001;
  unint64_t v129 = (uint64_t *)(v14 + 32);
  uint64_t v119 = (void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  uint64_t v118 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  id v117 = &v142;
  *(void *)&long long v21 = 134218242;
  long long v116 = v21;
  unint64_t v115 = (unint64_t)"ll";
  v114[4] = (char *)&type metadata for Any + 8;
  v114[3] = "Diagonal Up Left";
  v114[2] = "Diagonal Up Right";
  v114[1] = "Diagonal Down Left";
  uint64_t v140 = v24;
  uint64_t v125 = v11;
  uint64_t v127 = v17;
  uint64_t v131 = v19;
  Swift::Int v124 = v22;
  while (v25 < (unint64_t)v22[2])
  {
    unint64_t v128 = v25;
    uint64_t v132 = *((unsigned __int8 *)v123 + v25);
    unint64_t v26 = v135;
    if (v24)
    {
      while (1)
      {
        if (v130)
        {
          char v27 = 0;
          uint64_t v10 = 0;
          do
          {
            uint64_t v28 = sub_10003AA90();
            uint64_t v29 = v28;
            if (v9)
            {
              if (*(double *)(a1 + 16) >= *(double *)(v28 + 16)) {
                uint64_t v30 = v28;
              }
              else {
                uint64_t v30 = a1;
              }
              CGFloat v31 = *(double *)(v30 + 56);
              CGFloat v32 = *(double *)(v30 + 64);
              CGFloat v33 = *(double *)(a1 + 56);
              CGFloat v34 = *(double *)(a1 + 64);
              swift_retain();
              v144.double width = v31;
              v144.double height = v32;
              v147.double width = v33;
              v147.double height = v34;
              uint64_t v14 = a1;
              if (CGSizeEqualToSize(v144, v147))
              {
                uint64_t v14 = a1;
                if (CGPointEqualToPoint(*(CGPoint *)(v30 + 136), *(CGPoint *)(a1 + 136)))
                {
                  double v35 = *(void **)(v30 + 72);
                  uint64_t v36 = *(void **)(v30 + 80);
                  unint64_t v37 = *(void **)(v30 + 88);
                  id v39 = *(void **)(a1 + 72);
                  unint64_t v38 = *(void **)(a1 + 80);
                  id v139 = *(id *)(a1 + 88);
                  id v136 = (id)sub_100012298();
                  id v40 = v35;
                  id v41 = v36;
                  id v137 = v37;
                  id v42 = v39;
                  uint64_t v43 = v41;
                  id v44 = v42;
                  id v45 = v38;
                  id v46 = v139;
                  id v138 = v40;
                  id v139 = v46;
                  if (sub_10003A900() & 1) != 0 && (sub_10003A900())
                  {
                    id v47 = v137;
                    LODWORD(v136) = sub_10003A900();

                    uint64_t v14 = a1;
                    int v9 = v134;
                    unint64_t v26 = v135;
                    if (v136)
                    {
                      if (*(unsigned __int8 *)(v30 + 96) == *(unsigned __int8 *)(a1 + 96)) {
                        uint64_t v14 = v29;
                      }
                      else {
                        uint64_t v14 = a1;
                      }
                    }
                  }
                  else
                  {

                    uint64_t v14 = a1;
                    int v9 = v134;
                    unint64_t v26 = v135;
                  }
                }
              }
              double v48 = *(double *)(v14 + 56);
              double v49 = *(double *)(v30 + 136);
              double v50 = *(double *)(v30 + 144);
              double v51 = *(double *)(v14 + 136);
              double v52 = *(double *)(v14 + 144);
              swift_retain();
              swift_unknownObjectRelease();
              swift_release();
              double v53 = vabdd_f64(v50, v52);
              double v54 = *(double *)(v14 + 64);
              swift_release();
              if (v53 < v54 * 0.5) {
                v27 |= vabdd_f64(v49, v51) < v48 * 0.5;
              }
              uint64_t v24 = v140;
            }
            else if (v27)
            {
              swift_unknownObjectRelease();
              char v27 = 1;
            }
            else
            {
              char v27 = CGRectIntersectsRect(*(CGRect *)(a1 + 24), *(CGRect *)(v28 + 24));
              swift_unknownObjectRelease();
            }
            ++v10;
          }
          while (v24 != v10);
        }
        else
        {
          char v27 = 0;
          uint64_t v55 = v129;
          uint64_t v56 = v24;
          do
          {
            uint64_t v57 = *v55;
            if (v9)
            {
              if (*(double *)(a1 + 16) >= *(double *)(v57 + 16)) {
                uint64_t v10 = *v55;
              }
              else {
                uint64_t v10 = a1;
              }
              CGFloat v58 = *(double *)(v10 + 56);
              CGFloat v59 = *(double *)(v10 + 64);
              CGFloat v60 = *(double *)(a1 + 56);
              CGFloat v61 = *(double *)(a1 + 64);
              swift_retain();
              swift_retain();
              v145.double width = v58;
              v145.double height = v59;
              v148.double width = v60;
              v148.double height = v61;
              uint64_t v14 = a1;
              if (CGSizeEqualToSize(v145, v148))
              {
                uint64_t v14 = a1;
                if (CGPointEqualToPoint(*(CGPoint *)(v10 + 136), *(CGPoint *)(a1 + 136)))
                {
                  BOOL v62 = *(void **)(v10 + 72);
                  uint64_t v63 = *(void **)(v10 + 80);
                  char v64 = *(void **)(v10 + 88);
                  id v133 = *(id *)(a1 + 72);
                  id v136 = *(id *)(a1 + 80);
                  id v138 = *(id *)(a1 + 88);
                  sub_100012298();
                  id v65 = v62;
                  id v139 = v63;
                  id v66 = v64;
                  uint64_t v67 = v65;
                  id v137 = v66;
                  id v68 = v133;
                  id v69 = v136;
                  id v138 = v138;
                  id v136 = v67;
                  if (sub_10003A900() & 1) != 0 && (sub_10003A900())
                  {
                    LODWORD(v133) = sub_10003A900();

                    uint64_t v14 = a1;
                    int v9 = v134;
                    unint64_t v26 = v135;
                    uint64_t v24 = v140;
                    if (v133)
                    {
                      if (*(unsigned __int8 *)(v10 + 96) == *(unsigned __int8 *)(a1 + 96)) {
                        uint64_t v14 = v57;
                      }
                      else {
                        uint64_t v14 = a1;
                      }
                    }
                  }
                  else
                  {

                    uint64_t v14 = a1;
                    int v9 = v134;
                    unint64_t v26 = v135;
                    uint64_t v24 = v140;
                  }
                }
              }
              double v70 = *(double *)(v14 + 56);
              double v71 = *(double *)(v10 + 136);
              double v72 = *(double *)(v10 + 144);
              double v73 = *(double *)(v14 + 136);
              double v74 = *(double *)(v14 + 144);
              swift_retain();
              swift_release();
              swift_release();
              double v75 = vabdd_f64(v72, v74);
              double v76 = *(double *)(v14 + 64);
              swift_release();
              if (v75 < v76 * 0.5) {
                v27 |= vabdd_f64(v71, v73) < v70 * 0.5;
              }
            }
            else
            {
              char v27 = (v27 & 1) != 0 || CGRectIntersectsRect(*(CGRect *)(a1 + 24), *(CGRect *)(v57 + 24));
            }
            ++v55;
            --v56;
          }
          while (v56);
        }
        uint64_t v77 = (uint64_t)v131;
        if ((v27 & 1) == 0) {
          break;
        }
        double v79 = *(double *)(a1 + 136);
        double v78 = *(double *)(a1 + 144);
        switch(v132)
        {
          case 1:
            double v79 = v79 + 4.0;
            break;
          case 2:
            goto LABEL_58;
          case 3:
            goto LABEL_60;
          case 4:
            double v80 = -4.0;
            goto LABEL_55;
          case 5:
            double v79 = v79 + 4.0;
LABEL_58:
            double v80 = -4.0;
            goto LABEL_61;
          case 6:
            double v79 = v79 + -4.0;
LABEL_60:
            double v80 = 4.0;
            goto LABEL_61;
          case 7:
            double v80 = 4.0;
LABEL_55:
            double v79 = v79 + v80;
LABEL_61:
            double v78 = v78 + v80;
            break;
          default:
            double v79 = v79 + -4.0;
            break;
        }
        *(double *)(a1 + 136) = v79;
        *(double *)(a1 + 144) = v78;
        double v81 = *(double *)(a1 + 56);
        double v82 = *(double *)(a1 + 64);
        *(double *)(a1 + 24) = v79 - v81 * 0.5;
        *(double *)(a1 + 32) = v78 - v82 * 0.5;
        *(double *)(a1 + 40) = v81;
        *(double *)(a1 + 48) = v82;
        if (v79 >= 0.0)
        {
          if (qword_10004ACC8 != -1) {
            swift_once();
          }
          if (*(double *)&qword_10004D110 >= v79)
          {
            double v83 = *(double *)(a1 + 144);
            if (v83 >= a4 && v83 <= a5) {
              continue;
            }
          }
        }
        double v84 = v121;
        double v85 = v120;
        *(CGFloat *)(a1 + 136) = v121;
        *(double *)(a1 + 144) = v85;
        *(double *)(a1 + 24) = v84 - v81 * 0.5;
        *(double *)(a1 + 32) = v85 - v82 * 0.5;
        *(double *)(a1 + 40) = v81;
        *(double *)(a1 + 48) = v82;
        if (qword_10004AC90 != -1) {
          swift_once();
        }
        uint64_t v86 = v122;
        uint64_t v87 = sub_10000325C(v122, (uint64_t)qword_10004D0B0);
        (*v119)(v77, v87, v86);
        swift_retain();
        uint64_t v14 = v77;
        uint64_t v88 = sub_10003A5D0();
        os_log_type_t v89 = sub_10003A850();
        if (os_log_type_enabled(v88, v89))
        {
          uint64_t v14 = swift_slowAlloc();
          uint64_t v90 = (void **)swift_slowAlloc();
          *(_DWORD *)uint64_t v14 = v116;
          uint64_t v141 = *(void *)(a1 + 120);
          double v142 = v90;
          sub_10003A940();
          swift_release();
          *(_WORD *)(v14 + 12) = 2080;
          unint64_t v91 = v115 | 0x8000000000000000;
          uint64_t v92 = 0xD000000000000010;
          switch(v132)
          {
            case 1:
              unint64_t v91 = 0xE500000000000000;
              uint64_t v92 = 0x7468676952;
              break;
            case 2:
              unint64_t v91 = 0xE200000000000000;
              uint64_t v92 = 28757;
              break;
            case 3:
              unint64_t v91 = 0xE400000000000000;
              uint64_t v92 = 1853321028;
              break;
            case 4:
              break;
            case 5:
              uint64_t v92 = 0xD000000000000011;
              uint64_t v93 = (uint64_t *)&v143;
              goto LABEL_80;
            case 6:
              uint64_t v92 = 0xD000000000000012;
              uint64_t v93 = (uint64_t *)&v142;
              goto LABEL_80;
            case 7:
              uint64_t v92 = 0xD000000000000013;
              uint64_t v93 = &v141;
LABEL_80:
              unint64_t v91 = *(v93 - 32) | 0x8000000000000000;
              break;
            default:
              unint64_t v91 = 0xE400000000000000;
              uint64_t v92 = 1952867660;
              break;
          }
          uint64_t v141 = sub_10000E014(v92, v91, (uint64_t *)&v142);
          sub_10003A940();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v88, v89, "Pushed spec %ld offscreen while going %s...resetting.", (uint8_t *)v14, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*v118)(v77, v122);
          unint64_t v26 = v135;
          uint64_t v24 = v140;
        }
        else
        {

          swift_release();
          (*v118)(v77, v86);
        }
        break;
      }
    }
    if ((sub_100027A1C(a1, v26, v9) & 1) == 0)
    {
      swift_release();
      uint64_t v10 = v122;
      uint64_t v11 = v125;
      double v17 = v127;
      goto LABEL_97;
    }
    unint64_t v25 = v128 + 1;
    uint64_t v11 = v125;
    double v17 = v127;
    double v22 = v124;
    if ((void *)(v128 + 1) == v126)
    {
      swift_release();
      uint64_t v10 = v122;
      goto LABEL_97;
    }
  }
  __break(1u);
LABEL_114:
  swift_once();
LABEL_86:
  uint64_t v94 = sub_10000325C(v10, (uint64_t)qword_10004D0B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v94, v10);
  swift_retain();
  uint64_t v95 = sub_10003A5D0();
  uint64_t v96 = v11;
  os_log_type_t v97 = sub_10003A850();
  if (os_log_type_enabled(v95, v97))
  {
    uint64_t v98 = swift_slowAlloc();
    BOOL v99 = (void **)swift_slowAlloc();
    *(_DWORD *)uint64_t v98 = 134218242;
    uint64_t v141 = *(void *)(a1 + 120);
    double v142 = v99;
    sub_10003A940();
    swift_release();
    *(_WORD *)(v98 + 12) = 2080;
    if (v134) {
      uint64_t v100 = 0x65764F20656D6F53;
    }
    else {
      uint64_t v100 = 0x6C7265764F206F4ELL;
    }
    if (v134) {
      unint64_t v101 = 0xEC00000070616C72;
    }
    else {
      unint64_t v101 = 0xEA00000000007061;
    }
    uint64_t v141 = sub_10000E014(v100, v101, (uint64_t *)&v142);
    sub_10003A940();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v95, v97, "Spec %ld is in an acceptable position for rule %s.", (uint8_t *)v98, 0x16u);
    char v102 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v14, v10);
  }
  else
  {

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v10);
    char v102 = 1;
  }
  return v102 & 1;
}

uint64_t sub_100028DA8(unint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v54 = a2;
  unint64_t v7 = sub_10003A5F0();
  unint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = a1;
  unint64_t v57 = a1 >> 62;
  if (a1 >> 62) {
    goto LABEL_74;
  }
  uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
LABEL_3:
  v61[0] = v11;
  sub_100026A38(v61, (void (*)(void *))sub_100026ABC);
  unint64_t v13 = v61[0];
  v61[0] = (uint64_t)_swiftEmptyArrayStorage;
  if ((v13 & 0x8000000000000000) != 0 || (v13 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_10003AB80();
    swift_release();
    if (v14 < 0)
    {
      __break(1u);
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v14 = *(void *)(v13 + 16);
  }
  if (v14)
  {
    uint64_t v15 = 0;
    unint64_t v16 = v13 & 0xC000000000000001;
    uint64_t v52 = v59 & 0xFFFFFFFFFFFFFF8;
    double v53 = v10;
    if (v59 < 0) {
      uint64_t v17 = v59;
    }
    else {
      uint64_t v17 = v59 & 0xFFFFFFFFFFFFFF8;
    }
    double v50 = (void (**)(char *, unint64_t, unint64_t))(v8 + 16);
    uint64_t v51 = v17;
    double v49 = (void (**)(char *, unint64_t))(v8 + 8);
    *(void *)&long long v12 = 134217984;
    long long v55 = v12;
    *(void *)&long long v12 = 134218242;
    long long v48 = v12;
    unint64_t v47 = (unint64_t)"port.RhizomePoster";
    id v46 = (char *)&type metadata for Any + 8;
    unint64_t v58 = v7;
    unint64_t v56 = v13 & 0xC000000000000001;
    do
    {
      if (v14 == v15)
      {
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        unint64_t v43 = swift_bridgeObjectRetain();
        uint64_t v11 = (uint64_t)sub_10001B494(v43);
        swift_bridgeObjectRelease();
        goto LABEL_3;
      }
      if (v16)
      {
        uint64_t v18 = sub_10003AA90();
        if (*(unsigned char *)(v18 + 128)) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v18 = *(void *)(v13 + 8 * v15 + 32);
        swift_retain();
        if (*(unsigned char *)(v18 + 128)) {
          goto LABEL_16;
        }
      }
      if (*(unsigned char *)(v18 + 129) == 1)
      {
        swift_retain();
        swift_retain();
        uint64_t v10 = (char *)sub_1000277A8(v13, v18);
        swift_release();
        swift_release();
        if (sub_100027C88(v18, (unint64_t)v10, 0, a3, a4))
        {
          swift_release();
          swift_bridgeObjectRelease();
          goto LABEL_17;
        }
        if (qword_10004AC90 != -1) {
          swift_once();
        }
        unint64_t v8 = sub_10000325C(v7, (uint64_t)qword_10004D0B0);
        swift_retain();
        double v19 = sub_10003A5D0();
        os_log_type_t v20 = sub_10003A850();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = swift_slowAlloc();
          *(_DWORD *)uint64_t v21 = v55;
          *(void *)(v21 + 4) = *(void *)(v18 + 120);
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to relocate spec %ld using rule no overlap rule. Trying with some overlap.", (uint8_t *)v21, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          swift_release();
        }
        char v22 = sub_100027C88(v18, (unint64_t)v10, 1, a3, a4);
        swift_bridgeObjectRelease();
        if (v22)
        {
          swift_release();
          unint64_t v7 = v58;
          unint64_t v16 = v56;
          goto LABEL_17;
        }
        swift_retain();
        id v23 = sub_10003A5D0();
        os_log_type_t v24 = sub_10003A850();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = swift_slowAlloc();
          *(_DWORD *)uint64_t v25 = v55;
          *(void *)(v25 + 4) = *(void *)(v18 + 120);
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to relocate spec %ld using rule some overlap rule. Attempting to remove flower.", (uint8_t *)v25, 0xCu);
          swift_slowDealloc();

          if (v57) {
            goto LABEL_35;
          }
LABEL_37:
          uint64_t v10 = *(char **)(v52 + 16);
        }
        else
        {

          swift_release();
          if (!v57) {
            goto LABEL_37;
          }
LABEL_35:
          swift_bridgeObjectRetain();
          uint64_t v10 = (char *)sub_10003AB80();
          swift_bridgeObjectRelease();
        }
        if ((unint64_t)v61[0] >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v26 = sub_10003AB80();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v26 = *(void *)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        unint64_t v7 = v58;
        if (__OFSUB__(v10, v26)) {
          goto LABEL_73;
        }
        if ((uint64_t)&v10[-v26] <= v54)
        {
          uint64_t v30 = v53;
          (*v50)(v53, v8, v58);
          swift_retain_n();
          unint64_t v8 = sub_10003A5D0();
          os_log_type_t v31 = sub_10003A850();
          if (os_log_type_enabled((os_log_t)v8, v31))
          {
            uint64_t v10 = (char *)swift_slowAlloc();
            uint64_t v45 = swift_slowAlloc();
            v60[0] = v45;
            *(_DWORD *)uint64_t v10 = v48;
            *(void *)(v10 + 4) = *(void *)(v18 + 120);
            swift_release();
            *((_WORD *)v10 + 6) = 2080;
            unint64_t v32 = v47 | 0x8000000000000000;
            unint64_t v16 = v56;
            uint64_t v33 = 0xD000000000000011;
            switch(*(unsigned char *)(v18 + 96))
            {
              case 4:
              case 5:
              case 6:
              case 7:
                break;
              case 8:
              case 9:
              case 0xA:
              case 0xB:
                unint64_t v32 = 0xE900000000000079;
                uint64_t v33 = 0x6C694C20616C6143;
                break;
              case 0xC:
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                unint64_t v32 = 0xE800000000000000;
                uint64_t v33 = 0x646C6F676972614DLL;
                break;
              default:
                unint64_t v32 = 0xED00007973696144;
                uint64_t v33 = 0x206E616369726641;
                break;
            }
            *(void *)(v10 + 14) = sub_10000E014(v33, v32, v60);
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, v31, "Failed to remove spec %ld because it was floating or birds of paradise. type: %s", (uint8_t *)v10, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
            swift_release();

            unint64_t v7 = v58;
            (*v49)(v53, v58);
          }
          else
          {

            swift_release_n();
            (*v49)(v30, v7);
            unint64_t v16 = v56;
          }
          goto LABEL_17;
        }
        swift_retain();
        char v27 = sub_10003A5D0();
        os_log_type_t v28 = sub_10003A850();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = swift_slowAlloc();
          *(_DWORD *)uint64_t v29 = v55;
          *(void *)(v29 + 4) = *(void *)(v18 + 120);
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Removing spec %ld because there were only 3 left...", (uint8_t *)v29, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          swift_release();
        }
        unint64_t v16 = v56;
        swift_retain();
        unint64_t v8 = (unint64_t)v61;
        sub_10003A770();
        uint64_t v10 = *(char **)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        if ((unint64_t)v10 >= *(void *)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10003A7C0();
        }
        sub_10003A7E0();
        sub_10003A7B0();
      }
LABEL_16:
      swift_release();
LABEL_17:
      ++v15;
    }
    while (v14 != v15);
  }
  swift_release();
  v60[0] = (uint64_t)_swiftEmptyArrayStorage;
  unint64_t v8 = v59;
  if (v57)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = (char *)sub_10003AB80();
    if (v10) {
      goto LABEL_54;
    }
LABEL_67:
    unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_68;
  }
  uint64_t v10 = *(char **)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_67;
  }
LABEL_54:
  unint64_t v7 = 0;
  unint64_t v34 = v8 & 0xC000000000000001;
  uint64_t v35 = v8 & 0xFFFFFFFFFFFFFF8;
  unint64_t v36 = v61[0];
  while (v34)
  {
    uint64_t v37 = sub_10003AA90();
    unint64_t v38 = (char *)(v7 + 1);
    if (__OFADD__(v7, 1)) {
      goto LABEL_64;
    }
LABEL_60:
    swift_bridgeObjectRetain();
    char v39 = sub_100026698(v37, v36);
    swift_bridgeObjectRelease();
    if (v39)
    {
      swift_release();
    }
    else
    {
      sub_10003AAC0();
      sub_10003AAF0();
      sub_10003AB00();
      sub_10003AAD0();
      unint64_t v8 = v59;
    }
    ++v7;
    if (v38 == v10) {
      goto LABEL_65;
    }
  }
  if (v7 >= *(void *)(v35 + 16)) {
    goto LABEL_72;
  }
  uint64_t v37 = *(void *)(v8 + 8 * v7 + 32);
  swift_retain();
  unint64_t v38 = (char *)(v7 + 1);
  if (!__OFADD__(v7, 1)) {
    goto LABEL_60;
  }
LABEL_64:
  __break(1u);
LABEL_65:
  unint64_t v8 = v60[0];
LABEL_68:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v8 & 0x8000000000000000) != 0 || (id v40 = (void *)v8, (v8 & 0x4000000000000000) != 0))
  {
LABEL_77:
    id v40 = sub_10001B494(v8);
    swift_release();
  }
  v60[0] = (uint64_t)v40;
  sub_100026A38(v60, (void (*)(void *))sub_10001BEB0);
  swift_release();
  uint64_t v41 = v60[0];
  swift_bridgeObjectRelease();
  return v41;
}

uint64_t getEnumTagSinglePayload for PushDirection(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PushDirection(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000298E8);
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

ValueMetadata *type metadata accessor for PushDirection()
{
  return &type metadata for PushDirection;
}

unint64_t sub_100029924()
{
  unint64_t result = qword_10004B318;
  if (!qword_10004B318)
  {
    sub_100002F64(&qword_10004B320);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B318);
  }
  return result;
}

unint64_t sub_100029984()
{
  unint64_t result = qword_10004B328;
  if (!qword_10004B328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B328);
  }
  return result;
}

uint64_t sub_1000299D8(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_100045700;
  v6._object = a2;
  unint64_t v4 = sub_10003ABF0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

uint64_t sub_100029A24()
{
  sub_10003A570();
  swift_allocObject();
  uint64_t result = sub_10003A560();
  qword_10004D140 = result;
  return result;
}

id sub_100029A64()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = v0;
  sub_10003A4E0();
  sub_10003A5A0();
  uint64_t v2 = OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView;
  *(void *)&v1[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView] = 0;
  Swift::OpaquePointer v3 = &v1[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentUUID];
  uint64_t v4 = sub_10003A470();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentColorway] = 0;
  LODWORD(v3) = sub_10002548C(0, 0);
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  double v10 = v9;
  uint64_t v11 = (char *)[objc_allocWithZone((Class)UIView) init];
  id v12 = objc_allocWithZone((Class)type metadata accessor for RhizomeView());
  uint64_t v13 = sub_100008B90(v3 & 0xFFFFFF01, v6, v8, 0, v11, 1, 1, 0, v10, 0.0, 0.0, 0, 1);
  uint64_t v14 = *(void **)&v1[v2];
  *(void *)&v1[v2] = v13;

  v36.receiver = v1;
  v36.super_class = (Class)type metadata accessor for RhizomePosterRenderer();
  id v15 = objc_msgSendSuper2(&v36, "init");
  uint64_t v16 = qword_10004AC88;
  id v17 = v15;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_10003A5F0();
  sub_10000325C(v18, (uint64_t)qword_10004D098);
  double v19 = sub_10003A5D0();
  os_log_type_t v20 = sub_10003A840();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "PosterRenderer created", v21, 2u);
    swift_slowDealloc();
  }

  char v22 = self;
  id v23 = [v22 currentDevice];
  id v24 = [v23 userInterfaceIdiom];

  if (v24 == (id)1)
  {
    if (qword_10004ACD8 != -1) {
      swift_once();
    }
    uint64_t v25 = &qword_10004D120;
  }
  else
  {
    if (qword_10004ACE0 != -1) {
      swift_once();
    }
    uint64_t v25 = &qword_10004D128;
  }
  uint64_t v26 = *v25;
  swift_bridgeObjectRetain();
  id v27 = [v22 currentDevice];
  id v28 = [v27 userInterfaceIdiom];

  if (v28 == (id)1)
  {
    if (qword_10004ACE8 != -1) {
      swift_once();
    }
    uint64_t v29 = &qword_10004D130;
  }
  else
  {
    if (qword_10004ACF0 != -1) {
      swift_once();
    }
    uint64_t v29 = &qword_10004D138;
  }
  uint64_t v30 = *v29;
  swift_bridgeObjectRetain();
  uint64_t v31 = 17;
  sub_1000176DC(0, 17, 0);
  if (qword_10004AD30 != -1) {
    swift_once();
  }
  uint64_t v32 = qword_10004D180;
  unint64_t v33 = _swiftEmptyArrayStorage[2];
  do
  {
    unint64_t v34 = _swiftEmptyArrayStorage[3];
    if (v33 >= v34 >> 1) {
      sub_1000176DC(v34 > 1, v33 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v33 + 1;
    _swiftEmptyArrayStorage[v33++ + 4] = v32;
    --v31;
  }
  while (v31);
  sub_10000DDE0((uint64_t)&off_100045218);
  sub_10000DC94((uint64_t)_swiftEmptyArrayStorage);
  sub_100033A5C(v26, v30, 1, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v17;
}

void sub_100029F68(void *a1, void *a2)
{
  Swift::OpaquePointer v3 = v2;
  uint64_t v6 = sub_10003A5C0();
  uint64_t v116 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003A500();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000316C(&qword_10004AF70);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakAssign();
  id v16 = [a2 contents];
  v120[0] = 0;
  id v17 = [v16 loadUserInfoWithError:v120];
  swift_unknownObjectRelease();
  id v18 = v120[0];
  if (v17)
  {
    unint64_t v110 = v15;
    uint64_t v19 = sub_10003A6A0();
    id v20 = v18;

    if (qword_10004AD28 != -1) {
      swift_once();
    }
    unint64_t v118 = qword_10004D170;
    unint64_t v119 = *(void *)algn_10004D178;
    swift_bridgeObjectRetain();
    sub_10003AA10();
    uint64_t v21 = *(void *)(v19 + 16);
    uint64_t v117 = v19;
    if (v21 && (unint64_t v22 = sub_100018324((uint64_t)v120), (v23 & 1) != 0))
    {
      sub_10000E7B4(*(void *)(v19 + 56) + 32 * v22, (uint64_t)&v121);
    }
    else
    {
      long long v121 = 0u;
      long long v122 = 0u;
    }
    sub_10002637C((uint64_t)v120);
    id v24 = (void *)&unk_10004D000;
    uint64_t v112 = v6;
    uint64_t v111 = v8;
    uint64_t v115 = v9;
    uint64_t v114 = v10;
    unint64_t v113 = v12;
    if (*((void *)&v122 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v26 = v118;
        unint64_t v25 = v119;
        swift_bridgeObjectRetain();
        char v27 = sub_100034E70(v26, v25);
        if (v27 == 5)
        {
          if (qword_10004AC88 != -1) {
            swift_once();
          }
          uint64_t v28 = sub_10003A5F0();
          sub_10000325C(v28, (uint64_t)qword_10004D098);
          swift_bridgeObjectRetain();
          uint64_t v29 = sub_10003A5D0();
          os_log_type_t v30 = sub_10003A860();
          if (os_log_type_enabled(v29, v30))
          {
            uint64_t v31 = a1;
            uint64_t v32 = (uint8_t *)swift_slowAlloc();
            v120[0] = (id)swift_slowAlloc();
            *(_DWORD *)uint64_t v32 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)&long long v121 = sub_10000E014(v26, v25, (uint64_t *)v120);
            sub_10003A940();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v29, v30, "Rhizome renderer failed to create color option variant string: %s. Defaulting to unity.", v32, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            a1 = v31;
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v39 = v117;
          id v24 = &unk_10004D000;
        }
        else
        {
          char v46 = v27;
          swift_bridgeObjectRelease();
          id v24 = &unk_10004D000;
          v3[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentColorway] = v46;
          uint64_t v39 = v117;
        }
        goto LABEL_29;
      }
    }
    else
    {
      sub_10000775C((uint64_t)&v121, &qword_10004B570);
    }
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_10003A5F0();
    sub_10000325C(v38, (uint64_t)qword_10004D098);
    uint64_t v39 = v117;
    swift_bridgeObjectRetain_n();
    id v40 = sub_10003A5D0();
    os_log_type_t v41 = sub_10003A860();
    if (os_log_type_enabled(v40, v41))
    {
      id v42 = (uint8_t *)swift_slowAlloc();
      v120[0] = (id)swift_slowAlloc();
      uint64_t v109 = v3;
      *(_DWORD *)id v42 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_10003A6B0();
      unint64_t v45 = v44;
      swift_bridgeObjectRelease();
      *(void *)&long long v121 = sub_10000E014(v43, v45, (uint64_t *)v120);
      Swift::OpaquePointer v3 = v109;
      sub_10003A940();
      swift_bridgeObjectRelease_n();
      uint64_t v39 = v117;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Rhizome renderer failed to create color option from user info dictionary: %s. Defaulting to unity.", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v24 = (void *)&unk_10004D000;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_29:
    p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
    id v48 = objc_msgSend(objc_msgSend(a1, "environment"), "deviceOrientation");
    swift_unknownObjectRelease();
    __int16 v49 = sub_10002548C(v3[v24[43]], (uint64_t)v48);
    unsigned __int8 v50 = HIBYTE(v49);
    uint64_t v52 = v51;
    unint64_t v54 = v53;
    double v56 = v55;
    LODWORD(v117) = v49 & 1;
    unint64_t v118 = 0xD000000000000010;
    unint64_t v119 = 0x800000010003DED0;
    sub_10003AA10();
    if (*(void *)(v39 + 16) && (unint64_t v57 = sub_100018324((uint64_t)v120), (v58 & 1) != 0))
    {
      sub_10000E7B4(*(void *)(v39 + 56) + 32 * v57, (uint64_t)&v121);
    }
    else
    {
      long long v121 = 0u;
      long long v122 = 0u;
    }
    sub_10002637C((uint64_t)v120);
    if (*((void *)&v122 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v109 = a1;
        uint64_t v59 = (uint64_t)v110;
        sub_10003A440();
        swift_bridgeObjectRelease();
        uint64_t v60 = (uint64_t)&v3[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentUUID];
        swift_beginAccess();
        sub_10002CE0C(v59, v60);
        swift_endAccess();
        sub_1000076F4(v60, v59);
        unint64_t v61 = sub_100006980(v59, 5);
        uint64_t v108 = v62;
        unint64_t v64 = v63;
        double v66 = v65;
        sub_10000775C(v59, &qword_10004AF70);
        if (v64)
        {
          swift_bridgeObjectRelease();
          LODWORD(v117) = v61 & 1;
          unint64_t v67 = v61 >> 8;
          double v56 = v66;
          p_ivar_lyt = &RhizomeColorCache.ivar_lyt;
          if (qword_10004AC88 != -1) {
            swift_once();
          }
          uint64_t v68 = sub_10003A5F0();
          sub_10000325C(v68, (uint64_t)qword_10004D098);
          swift_bridgeObjectRetain();
          id v69 = sub_10003A5D0();
          os_log_type_t v70 = sub_10003A870();
          if (os_log_type_enabled(v69, v70))
          {
            double v71 = (uint8_t *)swift_slowAlloc();
            uint64_t v107 = (void *)swift_slowAlloc();
            v120[0] = v107;
            unint64_t v110 = (char *)v64;
            os_log_type_t v106 = v71;
            *(_DWORD *)double v71 = 136315138;
            v105[0] = v71 + 4;
            swift_bridgeObjectRetain();
            v105[1] = (char *)&type metadata for Any + 8;
            uint64_t v72 = sub_10003A6B0();
            unint64_t v74 = v73;
            swift_bridgeObjectRelease();
            *(void *)&long long v121 = sub_10000E014(v72, v74, (uint64_t *)v120);
            sub_10003A940();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v69, v70, "Rhizome renderer loaded saved layout from user info: %s", v106, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v52 = v108;
            unint64_t v54 = (unint64_t)v110;
          }
          else
          {

            swift_bridgeObjectRelease_n();
            uint64_t v52 = v108;
            unint64_t v54 = v64;
          }
          a1 = v109;
        }
        else
        {
          LODWORD(v67) = v50;
          swift_bridgeObjectRelease();
          a1 = v109;
          p_ivar_lyt = (void **)(&RhizomeColorCache + 16);
        }
      }
      else
      {
        LODWORD(v67) = v50;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      LODWORD(v67) = v50;
      swift_bridgeObjectRelease();
      sub_10000775C((uint64_t)&v121, &qword_10004B570);
    }
    objc_msgSend(objc_msgSend(a1, (SEL)p_ivar_lyt[75]), "floatingObscurableBounds");
    double v76 = v75;
    double v78 = v77;
    swift_unknownObjectRelease();
    double v79 = (char *)[a1 floatingView];
    id v80 = objc_allocWithZone((Class)type metadata accessor for RhizomeView());
    uint64_t v81 = sub_100008B90(v117 | (v67 << 8), v52, v54, (uint64_t)v48, v79, 1, 1, 0, v56, v76, v78, 0, 1);
    uint64_t v82 = OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView;
    double v83 = *(void **)&v3[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView];
    *(void *)&v3[OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView] = v81;

    uint64_t v84 = *(void *)&v3[v82];
    if (v84)
    {
      *(void *)(v84 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_delegate + 8) = &off_1000461F8;
      swift_unknownObjectWeakAssign();
      double v85 = *(void **)&v3[v82];
      uint64_t v86 = v116;
      uint64_t v87 = v115;
      uint64_t v88 = v114;
      uint64_t v89 = (uint64_t)v113;
      if (v85)
      {
        id v90 = v85;
        id v91 = [a1 backgroundView];
        [v91 bounds];
        double v93 = v92;
        double v95 = v94;
        double v97 = v96;
        double v99 = v98;

        objc_msgSend(v90, "setFrame:", v93, v95, v97, v99);
        id v100 = [a1 backgroundView];
        if (*(void *)&v3[v82])
        {
          unint64_t v101 = v100;
          objc_msgSend(v100, "addSubview:");

          sub_10003A810();
          sub_10002C428(v89);
          (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v89, v87);
          uint64_t v102 = (uint64_t)v111;
          sub_10003A820();
          sub_10002BF74(v102);
          (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v102, v112);
          if (qword_10004ACF8 != -1) {
            swift_once();
          }
          uint64_t v103 = *(void **)&v3[v82];
          if (v103) {
            sub_10002CE74((unint64_t *)&unk_10004B420, (void (*)(uint64_t))type metadata accessor for RhizomeView);
          }
          id v104 = v103;
          sub_10003A550();
          objc_msgSend(objc_msgSend(a1, "environment"), "deviceOrientation");
          swift_unknownObjectRelease();
          sub_10003A520();
          return;
        }
LABEL_55:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_55;
  }
  id v33 = v120[0];
  sub_10003A430();

  swift_willThrow();
  swift_errorRelease();
  if (qword_10004AC88 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_10003A5F0();
  sub_10000325C(v34, (uint64_t)qword_10004D098);
  uint64_t v35 = sub_10003A5D0();
  os_log_type_t v36 = sub_10003A860();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Rhizome renderer failed to create user info dictionary.", v37, 2u);
    swift_slowDealloc();
  }
}

void sub_10002AE90(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10003A500();
  uint64_t v107 = *(char **)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10003A5C0();
  id v12 = *(void **)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000316C(&qword_10004AF70);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (UIAccessibilityIsReduceMotionEnabled()) {
    return;
  }
  os_log_type_t v106 = v12;
  swift_unknownObjectWeakAssign();
  id v105 = a2;
  id v18 = [a2 contents];
  v110[0] = 0;
  id v19 = [v18 loadUserInfoWithError:v110];
  swift_unknownObjectRelease();
  id v20 = v110[0];
  if (!v19)
  {
    id v29 = v110[0];
    sub_10003A430();

    swift_willThrow();
    swift_errorRelease();
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_10003A5F0();
    sub_10000325C(v30, (uint64_t)qword_10004D098);
    uint64_t v31 = sub_10003A5D0();
    os_log_type_t v32 = sub_10003A860();
    if (!os_log_type_enabled(v31, v32)) {
      goto LABEL_25;
    }
    id v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Rhizome renderer failed to create user info dictionary.", v33, 2u);
LABEL_24:
    swift_slowDealloc();
LABEL_25:

    return;
  }
  uint64_t v104 = a1;
  uint64_t v21 = sub_10003A6A0();
  id v22 = v20;

  if (qword_10004AD28 != -1) {
    swift_once();
  }
  uint64_t v108 = qword_10004D170;
  unint64_t v109 = *(void *)algn_10004D178;
  swift_bridgeObjectRetain();
  sub_10003AA10();
  if (*(void *)(v21 + 16) && (unint64_t v23 = sub_100018324((uint64_t)v110), (v24 & 1) != 0))
  {
    sub_10000E7B4(*(void *)(v21 + 56) + 32 * v23, (uint64_t)&v111);
  }
  else
  {
    long long v111 = 0u;
    long long v112 = 0u;
  }
  sub_10002637C((uint64_t)v110);
  if (!*((void *)&v112 + 1))
  {
    sub_10000775C((uint64_t)&v111, &qword_10004B570);
LABEL_20:
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_10003A5F0();
    sub_10000325C(v34, (uint64_t)qword_10004D098);
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_10003A5D0();
    os_log_type_t v35 = sub_10003A860();
    if (!os_log_type_enabled(v31, v35))
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
    v110[0] = (id)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v36 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_10003A6B0();
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    *(void *)&long long v111 = sub_10000E014(v37, v39, (uint64_t *)v110);
    sub_10003A940();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v35, "Rhizome renderer failed to create color option from user info dictionary: %s", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_24;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_20;
  }
  char v25 = sub_100034E70(v108, v109);
  if (v25 == 5) {
    goto LABEL_20;
  }
  char v26 = v25;
  unint64_t v101 = (unint64_t)"currentUUID";
  uint64_t v108 = 0xD000000000000010;
  unint64_t v109 = 0x800000010003DED0;
  sub_10003AA10();
  if (*(void *)(v21 + 16) && (unint64_t v27 = sub_100018324((uint64_t)v110), (v28 & 1) != 0))
  {
    sub_10000E7B4(*(void *)(v21 + 56) + 32 * v27, (uint64_t)&v111);
  }
  else
  {
    long long v111 = 0u;
    long long v112 = 0u;
  }
  sub_10002637C((uint64_t)v110);
  if (*((void *)&v112 + 1))
  {
    if (swift_dynamicCast())
    {
      sub_10003A440();
      swift_bridgeObjectRelease();
      uint64_t v40 = v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentUUID;
      swift_beginAccess();
      sub_10002CE0C((uint64_t)v17, v40);
      swift_endAccess();
    }
  }
  else
  {
    sub_10000775C((uint64_t)&v111, &qword_10004B570);
  }
  uint64_t v41 = OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentColorway;
  char v42 = sub_10000391C(v26, *(unsigned char *)(v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentColorway));
  uint64_t v102 = a3;
  uint64_t v103 = v11;
  if (v42)
  {
    swift_bridgeObjectRelease();
LABEL_52:
    os_log_type_t v70 = v106;
    id v69 = v107;
    goto LABEL_53;
  }
  *(unsigned char *)(v4 + v41) = v26;
  uint64_t v108 = 0xD000000000000010;
  unint64_t v109 = v101 | 0x8000000000000000;
  sub_10003AA10();
  if (*(void *)(v21 + 16) && (unint64_t v43 = sub_100018324((uint64_t)v110), (v44 & 1) != 0))
  {
    sub_10000E7B4(*(void *)(v21 + 56) + 32 * v43, (uint64_t)&v111);
  }
  else
  {
    long long v111 = 0u;
    long long v112 = 0u;
  }
  sub_10002637C((uint64_t)v110);
  if (!*((void *)&v112 + 1))
  {
    sub_10000775C((uint64_t)&v111, &qword_10004B570);
    goto LABEL_46;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_46:
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_10003A5F0();
    sub_10000325C(v61, (uint64_t)qword_10004D098);
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_10003A5D0();
    os_log_type_t v63 = sub_10003A860();
    int v64 = v63;
    if (os_log_type_enabled(v62, v63))
    {
      LODWORD(v101) = v64;
      double v65 = (uint8_t *)swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      v110[0] = (id)v100;
      *(_DWORD *)double v65 = 136315138;
      double v98 = v65 + 4;
      swift_bridgeObjectRetain();
      double v99 = (char *)&type metadata for Any + 8;
      uint64_t v66 = sub_10003A6B0();
      unint64_t v68 = v67;
      swift_bridgeObjectRelease();
      *(void *)&long long v111 = sub_10000E014(v66, v68, (uint64_t *)v110);
      sub_10003A940();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v101, "Failed to load user uuid from user info after colorway changed: %s", v65, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_52;
    }

LABEL_51:
    swift_bridgeObjectRelease_n();
    goto LABEL_52;
  }
  sub_10003A440();
  swift_bridgeObjectRelease();
  uint64_t v45 = v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentUUID;
  swift_beginAccess();
  sub_10002CE0C((uint64_t)v17, v45);
  swift_endAccess();
  sub_1000076F4(v45, (uint64_t)v17);
  uint64_t v100 = sub_100006980((uint64_t)v17, 5);
  unint64_t v47 = v46;
  __int16 v49 = v48;
  unint64_t v101 = (unint64_t)v50;
  sub_10000775C((uint64_t)v17, &qword_10004AF70);
  if (!v49)
  {
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v80 = sub_10003A5F0();
    sub_10000325C(v80, (uint64_t)qword_10004D098);
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_10003A5D0();
    os_log_type_t v82 = sub_10003A860();
    int v83 = v82;
    if (os_log_type_enabled(v81, v82))
    {
      LODWORD(v101) = v83;
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      v110[0] = (id)v100;
      *(_DWORD *)uint64_t v84 = 136315138;
      double v98 = v84 + 4;
      swift_bridgeObjectRetain();
      double v99 = (char *)&type metadata for Any + 8;
      uint64_t v85 = sub_10003A6B0();
      unint64_t v87 = v86;
      swift_bridgeObjectRelease();
      *(void *)&long long v111 = sub_10000E014(v85, v87, (uint64_t *)v110);
      sub_10003A940();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v81, (os_log_type_t)v101, "Failed to load saved layout after changing variants in the editor: %s", v84, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_52;
    }

    goto LABEL_51;
  }
  if (qword_10004AC88 != -1) {
    swift_once();
  }
  double v98 = v47;
  double v99 = v49;
  uint64_t v51 = sub_10003A5F0();
  sub_10000325C(v51, (uint64_t)qword_10004D098);
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_10003A5D0();
  os_log_type_t v53 = sub_10003A870();
  int v54 = v53;
  if (os_log_type_enabled(v52, v53))
  {
    os_log_t v97 = v52;
    uint64_t v55 = swift_slowAlloc();
    int v96 = v54;
    double v56 = (uint8_t *)v55;
    double v95 = (void *)swift_slowAlloc();
    v110[0] = v95;
    double v94 = v56;
    *(_DWORD *)double v56 = 136315138;
    v93[0] = v56 + 4;
    swift_bridgeObjectRetain();
    v93[1] = (char *)&type metadata for Any + 8;
    uint64_t v57 = sub_10003A6B0();
    unint64_t v59 = v58;
    swift_bridgeObjectRelease();
    *(void *)&long long v111 = sub_10000E014(v57, v59, (uint64_t *)v110);
    sub_10003A940();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v60 = v97;
    _os_log_impl((void *)&_mh_execute_header, v97, (os_log_type_t)v96, "Rhizome renderer loaded saved layout from user info: %s", v94, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v70 = v106;
  uint64_t v88 = *(char **)(v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView);
  if (!v88) {
    goto LABEL_67;
  }
  char v89 = BYTE1(v100);
  id v90 = &v88[OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout];
  char *v90 = v100 & 1;
  v90[1] = v89;
  id v91 = v99;
  *((void *)v90 + 1) = v98;
  *((void *)v90 + 2) = v91;
  *((void *)v90 + 3) = v101;
  double v92 = v88;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100009B90();
  swift_bridgeObjectRelease();

  id v69 = v107;
LABEL_53:
  sub_10003A820();
  sub_10002BF74((uint64_t)v14);
  os_log_type_t v106 = (void *)v70[1];
  uint64_t v107 = (char *)(v70 + 1);
  ((void (*)(char *, uint64_t))v106)(v14, v103);
  sub_10003A810();
  sub_10002C428((uint64_t)v10);
  double v71 = (void (*)(char *, uint64_t))*((void *)v69 + 1);
  v71(v10, v8);
  uint64_t v72 = *(void **)(v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_contentView);
  if (!v72)
  {
    __break(1u);
LABEL_67:
    __break(1u);
    return;
  }
  uint64_t v73 = v8;
  uint64_t v74 = v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_unlockState;
  swift_beginAccess();
  (*((void (**)(char *, uint64_t, uint64_t))v69 + 2))(v10, v74, v73);
  id v75 = v72;
  sub_10003A4F0();
  double v77 = v76;
  v71(v10, v73);
  uint64_t v78 = v4 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_wakeState;
  swift_beginAccess();
  uint64_t v79 = v103;
  ((void (*)(char *, uint64_t, uint64_t))v70[2])(v14, v78, v103);
  sub_10000A3EC((uint64_t)v14, (int)[v105 isSnapshot], v77);

  ((void (*)(char *, uint64_t))v106)(v14, v79);
  if (qword_10004ACF8 != -1) {
    swift_once();
  }
  sub_10003A540();
}

uint64_t sub_10002BF74(uint64_t a1)
{
  uint64_t v3 = sub_10000316C(&qword_10004B400);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  __chkstk_darwin(v3);
  id v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10003A5C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  char v26 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v14 = v1 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_wakeState;
  swift_beginAccess();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v15(v13, v14, v5);
  sub_10002CE74(&qword_10004B408, (void (*)(uint64_t))&type metadata accessor for WakeState);
  char v16 = sub_10003A6D0();
  char v25 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t result = v25(v13, v5);
  if ((v16 & 1) == 0)
  {
    v15(v13, v14, v5);
    v15(v11, a1, v5);
    sub_10003A510();
    v15(v13, a1, v5);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v14, v13, v5);
    swift_endAccess();
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_10003A5F0();
    sub_10000325C(v18, (uint64_t)qword_10004D098);
    id v19 = v26;
    v15(v26, a1, v5);
    id v20 = sub_10003A5D0();
    os_log_type_t v21 = sub_10003A840();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      v31[0] = swift_slowAlloc();
      *(_DWORD *)id v22 = 136315138;
      sub_10002CE74((unint64_t *)&unk_10004B410, (void (*)(uint64_t))&type metadata accessor for WakeState);
      uint64_t v23 = sub_10003AC20();
      uint64_t v30 = sub_10000E014(v23, v24, v31);
      sub_10003A940();
      swift_bridgeObjectRelease();
      v25(v19, v5);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Set wake state to %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v25(v19, v5);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v29, v28);
  }
  return result;
}

uint64_t sub_10002C428(uint64_t a1)
{
  uint64_t v3 = sub_10000316C(&qword_10004B3F0);
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003A500();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  os_log_type_t v32 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v26 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = v1 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_unlockState;
  swift_beginAccess();
  char v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(v14, v15, v6);
  sub_10002CE74(&qword_10004B3F8, (void (*)(uint64_t))&type metadata accessor for UnlockState);
  char v17 = sub_10003A6D0();
  uint64_t v33 = v7;
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t result = v31(v14, v6);
  if ((v17 & 1) == 0)
  {
    v16(v14, v15, v6);
    v16(v12, a1, v6);
    uint64_t v30 = v5;
    sub_10003A510();
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_10003A5F0();
    sub_10000325C(v19, (uint64_t)qword_10004D098);
    id v20 = v32;
    v16(v32, a1, v6);
    os_log_type_t v21 = sub_10003A5D0();
    os_log_type_t v22 = sub_10003A850();
    int v29 = v22;
    uint64_t v23 = a1;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v27 = v21;
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = v23;
      *(_DWORD *)unint64_t v24 = 134217984;
      char v26 = v24 + 4;
      sub_10003A4F0();
      os_log_type_t v21 = v27;
      uint64_t v36 = v25;
      uint64_t v23 = v28;
      sub_10003A940();
      v31(v20, v6);
      _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v29, "Set unlock progress to %f", v24, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      v31(v20, v6);
    }

    v16(v14, v23, v6);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 40))(v15, v14, v6);
    swift_endAccess();
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v30, v35);
  }
  return result;
}

id sub_10002C85C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RhizomePosterRenderer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10002C974()
{
  return type metadata accessor for RhizomePosterRenderer();
}

uint64_t type metadata accessor for RhizomePosterRenderer()
{
  uint64_t result = qword_10004B3D0;
  if (!qword_10004B3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002C9C8()
{
  sub_10003A500();
  if (v0 <= 0x3F)
  {
    sub_10003A5C0();
    if (v1 <= 0x3F)
    {
      sub_10002CAE8();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_10002CAE8()
{
  if (!qword_10004B3E0)
  {
    sub_10003A470();
    unint64_t v0 = sub_10003A930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10004B3E0);
    }
  }
}

void sub_10002CB40(uint64_t a1)
{
  uint64_t v3 = sub_10000316C(&qword_10004AF70);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10003A470();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v1 + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentUUID;
  swift_beginAccess();
  sub_1000076F4(v10, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10000775C((uint64_t)v5, &qword_10004AF70);
    if (qword_10004AC88 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10003A5F0();
    sub_10000325C(v11, (uint64_t)qword_10004D098);
    uint64_t v12 = sub_10003A5D0();
    os_log_type_t v13 = sub_10003A850();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to save layout because there was no UUID...", v14, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    uint64_t v15 = a1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout;
    int v16 = *(unsigned __int8 *)(a1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout);
    uint64_t v17 = *(void *)(a1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 8);
    uint64_t v18 = *(void *)(v15 + 16);
    double v19 = *(double *)(v15 + 24);
    unsigned int v20 = v16 | (*(unsigned __int8 *)(v15 + 1) << 8);
    swift_bridgeObjectRetain();
    sub_100006168(v20, v17, v18, (uint64_t)v9, v19);
    swift_bridgeObjectRelease();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    [Strong noteContentSignificantlyChanged];

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_10002CE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000316C(&qword_10004AF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002CE74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002CEBC()
{
  if (qword_10004AC88 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003A5F0();
  sub_10000325C(v0, (uint64_t)qword_10004D098);
  uint64_t v1 = sub_10003A5D0();
  os_log_type_t v2 = sub_10003A840();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "PosterRenderer invalidate", v3, 2u);
    swift_slowDealloc();
  }

  return swift_unknownObjectWeakAssign();
}

void destroy for RhizomeFlower(uint64_t a1)
{
  os_log_type_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for RhizomeFlower(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

uint64_t assignWithCopy for RhizomeFlower(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  id v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 24);
  uint64_t v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  id v12 = v10;

  return a1;
}

uint64_t assignWithTake for RhizomeFlower(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;

  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomeFlower(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RhizomeFlower(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeFlower()
{
  return &type metadata for RhizomeFlower;
}

BOOL sub_10002D1B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  BOOL result = 0;
  if (*a1 == *a2 && (sub_10000391C(a1[1], a2[1]) & 1) != 0)
  {
    sub_100012298();
    if (sub_10003A900() & 1) != 0 && (sub_10003A900() & 1) != 0 && (sub_10003A900()) {
      return 1;
    }
  }
  return result;
}

unint64_t sub_10002D264()
{
  return sub_10002D270(*v0, v0[1]);
}

unint64_t sub_10002D270(char a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  switch(a1)
  {
    case 4:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      unint64_t v2 = 0x6C694C20616C6143;
      break;
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      unint64_t v2 = 0x646C6F676972614DLL;
      break;
    default:
      unint64_t v2 = 0x206E616369726641;
      break;
  }
  unint64_t v11 = v2;
  swift_bridgeObjectRetain();
  v12._uint64_t countAndFlagsBits = 0x3073732820;
  v12._object = (void *)0xE500000000000000;
  sub_10003A740(v12);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_10003AC20();
  id v6 = v5;
  swift_bridgeObjectRetain();
  v13._uint64_t countAndFlagsBits = v4;
  v13._object = v6;
  sub_10003A740(v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v14._uint64_t countAndFlagsBits = 5972009;
  v14._object = (void *)0xE300000000000000;
  sub_10003A740(v14);
  swift_bridgeObjectRelease();
  uint64_t v7 = 8 * a2;
  uint64_t v8 = *(void *)&aUnity_2[v7];
  id v9 = *(void **)((char *)&unk_10003C5B8 + v7);
  swift_bridgeObjectRetain();
  v15._uint64_t countAndFlagsBits = v8;
  v15._object = v9;
  sub_10003A740(v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v16._uint64_t countAndFlagsBits = 93;
  v16._object = (void *)0xE100000000000000;
  sub_10003A740(v16);
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_10002D4B8(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_100018368((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_10003AB40();

  if (!v4) {
    return 0;
  }
  type metadata accessor for RhizomeView();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_10002D580()
{
  sub_10003AAE0();
  uint64_t v0 = 0;
  do
  {
    ++v0;
    uint64_t v1 = sub_10003A710();
    id v3 = v2;
    swift_bridgeObjectRelease();
    v8._uint64_t countAndFlagsBits = v1;
    v8._object = v3;
    sub_10003A740(v8);
    swift_bridgeObjectRelease();
    sub_10003A720();
    swift_bridgeObjectRelease();
    id v4 = objc_allocWithZone((Class)PREditingLook);
    NSString v5 = sub_10003A6E0();
    swift_bridgeObjectRelease();
    NSString v6 = sub_10003A6E0();
    swift_bridgeObjectRelease();
    [v4 initWithIdentifier:v5 displayName:v6];

    sub_10003AAC0();
    sub_10003AAF0();
    sub_10003AB00();
    uint64_t result = sub_10003AAD0();
  }
  while (v0 != 5);
  qword_10004D160 = (uint64_t)_swiftEmptyArrayStorage;
  return result;
}

id sub_10002D7B4()
{
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_showingDebugViews] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_savedLayoutUUIDString];
  *uint64_t v1 = 0;
  v1[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_allRhizomeViews] = &_swiftEmptyDictionarySingleton;
  uint64_t v2 = OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_rotationAnimator;
  sub_10003A570();
  swift_allocObject();
  id v3 = v0;
  *(void *)&v0[v2] = sub_10003A560();

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for RhizomePosterEditor();
  id v4 = objc_msgSendSuper2(&v12, "init");
  uint64_t v5 = qword_10004AC80;
  id v6 = v4;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10003A5F0();
  sub_10000325C(v7, (uint64_t)qword_10004D080);
  Swift::String v8 = sub_10003A5D0();
  os_log_type_t v9 = sub_10003A840();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "PosterEditor created", v10, 2u);
    swift_slowDealloc();
  }

  return v6;
}

void sub_10002D9D8(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  id v135 = a1;
  uint64_t v7 = sub_10000316C(&qword_10004AF70);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  unint64_t v128 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v133 = (char *)&v118 - v10;
  uint64_t v11 = sub_10003A470();
  uint64_t v130 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  Swift::String v13 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v136 = (void *)sub_10003A5F0();
  uint64_t v134 = *(v136 - 1);
  uint64_t v14 = __chkstk_darwin(v136);
  uint64_t v127 = (char *)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v118 - v16;
  id v18 = [a3 identifier];
  uint64_t v19 = sub_10003A6F0();
  uint64_t v21 = v20;

  uint64_t v22 = sub_100034E70(v19, v21);
  if (v22 != 5)
  {
    uint64_t v28 = v22;
    Swift::Int v123 = v13;
    id v132 = objc_msgSend(objc_msgSend(v135, "environment"), "deviceOrientation");
    swift_unknownObjectRelease();
    if (qword_10004AC80 != -1) {
      swift_once();
    }
    int v29 = v136;
    uint64_t v30 = sub_10000325C((uint64_t)v136, (uint64_t)qword_10004D080);
    uint64_t v31 = v134;
    os_log_type_t v32 = *(void (**)(void))(v134 + 16);
    uint64_t v121 = v30;
    uint64_t v122 = v134 + 16;
    CGFloat v120 = (void (*)(char *, uint64_t, void *))v32;
    v32(v17);
    uint64_t v33 = sub_10003A5D0();
    os_log_type_t v34 = sub_10003A870();
    BOOL v35 = os_log_type_enabled(v33, v34);
    id v131 = a2;
    if (v35)
    {
      uint64_t v36 = swift_slowAlloc();
      unint64_t v119 = a3;
      uint64_t v37 = (uint8_t *)v36;
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v39 = 8 * (char)v28;
      uint64_t v40 = *(void *)&aUnity_3[v39];
      v138[0] = v38;
      unint64_t v129 = v11;
      uint64_t v137 = sub_10000E014(v40, *(void *)((char *)&unk_10003C6F0 + v39), v138);
      sub_10003A940();
      uint64_t v11 = v129;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "PosterEditor poulating views for colorway %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v119;
      swift_slowDealloc();

      uint64_t v41 = *(void (**)(char *, void *))(v134 + 8);
      v41(v17, v136);
    }
    else
    {

      uint64_t v41 = *(void (**)(char *, void *))(v31 + 8);
      v41(v17, v29);
    }
    __int16 v43 = sub_10002548C(v28, (uint64_t)v132);
    uint64_t v126 = (char *)v44;
    unint64_t v129 = v45;
    double v47 = v46;
    unint64_t v48 = HIBYTE(v43);
    int v49 = v43 & 1;
    uint64_t v125 = v4;
    uint64_t v50 = v4 + OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_savedLayoutUUIDString;
    uint64_t v51 = (uint64_t)v133;
    if (*(void *)(v50 + 8))
    {
      swift_bridgeObjectRetain();
      sub_10003A440();
      swift_bridgeObjectRelease();
      uint64_t v52 = v130;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v130 + 48))(v51, 1, v11) == 1)
      {
        unint64_t v124 = v48;
        LODWORD(v128) = v49;
        sub_10000775C(v51, &qword_10004AF70);
      }
      else
      {
        uint64_t v118 = v50;
        os_log_type_t v53 = v123;
        (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v123, v51, v11);
        int v54 = (void *)v28;
        uint64_t v55 = (uint64_t)v128;
        (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v128, v53, v11);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v52 + 56))(v55, 0, 1, v11);
        unint64_t v119 = v54;
        unint64_t v56 = sub_100006980(v55, (int)v54);
        id v133 = v57;
        double v59 = v58;
        uint64_t v60 = v55;
        unint64_t v62 = v61;
        sub_10000775C(v60, &qword_10004AF70);
        if (v62)
        {
          swift_bridgeObjectRelease();
          LODWORD(v128) = v56 & 1;
          unint64_t v124 = v56 >> 8;
          double v47 = v59;
          os_log_type_t v63 = v127;
          int v64 = v136;
          v120(v127, v121, v136);
          double v65 = sub_10003A5D0();
          os_log_type_t v66 = sub_10003A870();
          if (os_log_type_enabled(v65, v66))
          {
            unint64_t v129 = v11;
            unint64_t v67 = (uint8_t *)swift_slowAlloc();
            uint64_t v68 = swift_slowAlloc();
            *(_DWORD *)unint64_t v67 = 136315138;
            uint64_t v69 = 8 * (char)v119;
            uint64_t v70 = *(void *)&aUnity_3[v69];
            v138[0] = v68;
            unint64_t v119 = a3;
            uint64_t v137 = sub_10000E014(v70, *(void *)((char *)&unk_10003C6F0 + v69), v138);
            sub_10003A940();
            a3 = v119;
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v65, v66, "Loaded saved layout, and applied override colorway %s", v67, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v41(v127, v64);
            (*(void (**)(char *, unint64_t))(v130 + 8))(v123, v129);
          }
          else
          {

            v41(v63, v64);
            (*(void (**)(char *, uint64_t))(v52 + 8))(v123, v11);
          }
          uint64_t v126 = v133;
          unint64_t v129 = v62;
        }
        else
        {
          unint64_t v124 = v48;
          LODWORD(v128) = v49;
          (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v11);
        }
        uint64_t v50 = v118;
      }
    }
    else
    {
      unint64_t v124 = HIBYTE(v43);
      LODWORD(v128) = v43 & 1;
    }
    id v71 = [a3 identifier];
    uint64_t v72 = sub_10003A6F0();
    uint64_t v74 = v73;

    if (qword_10004AD00 != -1) {
      swift_once();
    }
    uint64_t v75 = qword_10004D160;
    if ((unint64_t)qword_10004D160 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_10003AB80();
      if (v76)
      {
LABEL_29:
        unint64_t v77 = v76 - 1;
        if (__OFSUB__(v76, 1))
        {
          __break(1u);
        }
        else if ((v75 & 0xC000000000000001) == 0)
        {
          if ((v77 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v77 < *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v78 = *(id *)(v75 + 8 * v77 + 32);
LABEL_34:
            uint64_t v79 = v78;
            swift_bridgeObjectRelease();
            id v80 = [v79 identifier];

            uint64_t v81 = sub_10003A6F0();
            uint64_t v83 = v82;

            if (v72 == v81 && v74 == v83) {
              char v84 = 1;
            }
            else {
              char v84 = sub_10003AC40();
            }
LABEL_40:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v85 = (char *)[v131 floatingView];
            id v86 = v135;
            objc_msgSend(objc_msgSend(v135, "environment"), "floatingObscurableBounds");
            double v88 = v87;
            double v90 = v89;
            swift_unknownObjectRelease();
            uint64_t v91 = *(void *)(v50 + 8);
            double v92 = a3;
            id v93 = [a3 identifier];
            uint64_t v94 = sub_10003A6F0();
            uint64_t v96 = v95;

            id v97 = [v86 currentLook];
            id v98 = [v97 identifier];

            uint64_t v99 = sub_10003A6F0();
            uint64_t v101 = v100;

            if (v94 == v99 && v96 == v101) {
              char v102 = 1;
            }
            else {
              char v102 = sub_10003AC40();
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v103 = objc_allocWithZone((Class)type metadata accessor for RhizomeView());
            id v104 = (id)sub_100008B90(v128 | (v124 << 8), (uint64_t)v126, v129, (uint64_t)v132, v85, v91 == 0, v84 & 1, v102 & 1, v47, v88, v90, v84 & 1, 0);
            id v105 = v131;
            id v106 = [v131 backgroundView];
            [v106 bounds];
            double v108 = v107;
            double v110 = v109;
            double v112 = v111;
            double v114 = v113;

            objc_msgSend(v104, "setFrame:", v108, v110, v112, v114);
            swift_beginAccess();
            id v115 = v104;
            id v116 = v92;
            sub_100030568((uint64_t)v115, v116);
            swift_endAccess();

            id v117 = [v105 backgroundView];
            [v117 addSubview:v115];

            return;
          }
          __break(1u);
          return;
        }
        id v78 = (id)sub_10003AA90();
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v76 = *(void *)((qword_10004D160 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v76) {
        goto LABEL_29;
      }
    }
    char v84 = 0;
    goto LABEL_40;
  }
  if (qword_10004AC80 != -1) {
    swift_once();
  }
  sub_10000325C((uint64_t)v136, (uint64_t)qword_10004D080);
  id v136 = a3;
  uint64_t v23 = sub_10003A5D0();
  os_log_type_t v24 = sub_10003A860();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    char v26 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138412290;
    v138[0] = (uint64_t)v136;
    uint64_t v27 = v136;
    sub_10003A940();
    *char v26 = v136;

    _os_log_impl((void *)&_mh_execute_header, v23, v24, "PosterEditor failed to create color option for look %@", v25, 0xCu);
    sub_10000316C((uint64_t *)&unk_10004B560);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v42 = v136;
  }
}

void sub_10002E940(uint64_t a1)
{
  uint64_t v2 = sub_10003A470();
  Class isa = v2[-1].isa;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    sub_10003A460();
    sub_10000316C(&qword_10004B548);
    initeCGFloat d = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10003B800;
    if (qword_10004AD28 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void *)algn_10004D178;
    *(void *)(inited + 32) = qword_10004D170;
    *(void *)(inited + 40) = v9;
    uint64_t v10 = (unsigned __int8 *)(a1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout);
    uint64_t v11 = 8 * *(char *)(a1 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 1);
    uint64_t v12 = *(void *)&aUnity_3[v11];
    uint64_t v13 = *(void *)((char *)&unk_10003C6F0 + v11);
    *(void *)(inited + 48) = v12;
    *(void *)(inited + 56) = v13;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 80) = 0xD000000000000010;
    *(void *)(inited + 88) = 0x800000010003DED0;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_10003A450();
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 96) = v14;
    *(void *)(inited + 104) = v15;
    unint64_t v16 = sub_100036040(inited);
    id v17 = objc_msgSend(objc_msgSend(v7, "environment"), "targetConfiguration");
    swift_unknownObjectRelease();
    sub_10002F1AC(v16);
    swift_bridgeObjectRelease();
    Class v18 = sub_10003A690().super.isa;
    swift_bridgeObjectRelease();
    id v52 = 0;
    unsigned int v19 = [v17 storeUserInfo:v18 error:&v52];

    id v20 = v52;
    if (v19
      && (id v21 = v52,
          v22 = objc_msgSend(objc_msgSend(v7, "environment"), "targetConfiguration"), swift_unknownObjectRelease(), v52 = 0, v23 = objc_msgSend(v22, "loadUserInfoWithError:", &v52), v22, id v20 = v52, v23))
    {
      sub_10003A6A0();
      id v24 = v20;

      if (qword_10004AC80 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_10003A5F0();
      sub_10000325C(v25, (uint64_t)qword_10004D080);
      swift_bridgeObjectRetain();
      char v26 = sub_10003A5D0();
      os_log_type_t v27 = sub_10003A850();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        int v49 = (void *)swift_slowAlloc();
        id v52 = v49;
        os_log_t v50 = v2;
        unint64_t v48 = v28;
        *(_DWORD *)uint64_t v28 = 136315138;
        v47[0] = v28 + 4;
        swift_bridgeObjectRetain();
        v47[1] = (char *)&type metadata for Any + 8;
        uint64_t v29 = sub_10003A6B0();
        unint64_t v31 = v30;
        swift_bridgeObjectRelease();
        uint64_t v51 = sub_10000E014(v29, v31, (uint64_t *)&v52);
        uint64_t v2 = v50;
        sub_10003A940();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Successfully stored userInfo: %s", v48, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v43 = *((void *)v10 + 1);
      uint64_t v44 = *((void *)v10 + 2);
      double v45 = *((double *)v10 + 3);
      unsigned int v46 = *v10 | (v10[1] << 8);
      swift_bridgeObjectRetain();
      sub_100006168(v46, v43, v44, (uint64_t)v5, v45);

      swift_bridgeObjectRelease();
      (*((void (**)(char *, NSObject *))isa + 1))(v5, v2);
    }
    else
    {
      id v32 = v20;
      sub_10003A430();

      swift_willThrow();
      (*((void (**)(char *, NSObject *))isa + 1))(v5, v2);
      if (qword_10004AC80 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_10003A5F0();
      sub_10000325C(v33, (uint64_t)qword_10004D080);
      swift_errorRetain();
      swift_errorRetain();
      os_log_type_t v34 = sub_10003A5D0();
      os_log_type_t v35 = sub_10003A860();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        id v52 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v36 = 136315138;
        swift_getErrorValue();
        uint64_t v37 = sub_10003AC70();
        uint64_t v51 = sub_10000E014(v37, v38, (uint64_t *)&v52);
        sub_10003A940();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to store userInfo in editor.environment.targetConfiguration. %s", v36, 0xCu);
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
    }
  }
  else
  {
    if (qword_10004AC80 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_10003A5F0();
    sub_10000325C(v39, (uint64_t)qword_10004D080);
    os_log_t v50 = (os_log_t)sub_10003A5D0();
    os_log_type_t v40 = sub_10003A860();
    if (os_log_type_enabled(v50, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v40, "Failed to save layout because editor was nil...", v41, 2u);
      swift_slowDealloc();
    }
    os_log_t v42 = v50;
  }
}

uint64_t sub_10002F1AC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000316C((uint64_t *)&unk_10004B550);
    uint64_t v2 = (void *)sub_10003ABD0();
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
  id v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000E7B4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000F64C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10000F64C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10000F64C(v36, v37);
    sub_10000F64C(v37, &v33);
    uint64_t result = sub_10003A9F0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_10000F64C(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_10001ED5C();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10002F644(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10003AB80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  int64_t v13 = _swiftEmptyArrayStorage;
  uint64_t result = sub_1000176FC(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_10003AA90();
        sub_10002255C(0, &qword_10004B578);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000176FC(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_1000176FC(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_10000F64C(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      int64_t v8 = (id *)(a1 + 32);
      sub_10002255C(0, &qword_10004B578);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000176FC(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_1000176FC(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_10000F64C(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_10002FA10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RhizomePosterEditor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RhizomePosterEditor()
{
  return self;
}

void sub_10002FAD8(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_7:
    if (qword_10004AC80 != -1) {
      goto LABEL_65;
    }
    goto LABEL_8;
  }
  unint64_t v6 = Strong;
  id v7 = [Strong currentLook];
  int64_t v8 = (uint64_t *)(v3 + OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_allRhizomeViews);
  swift_beginAccess();
  uint64_t v9 = *v8;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_10002D4B8(v7, v9);

  swift_bridgeObjectRelease();
  if (!v10)
  {

    goto LABEL_7;
  }
  sub_10000CF14(a1, a2);
  if (a3 != 1.0)
  {

    goto LABEL_62;
  }
  unint64_t v11 = *v8;
  if ((v11 & 0xC000000000000001) != 0)
  {
    unint64_t v51 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    unint64_t v14 = sub_10003AB20() | 0x8000000000000000;
  }
  else
  {
    uint64_t v18 = -1 << *(unsigned char *)(v11 + 32);
    uint64_t v12 = ~v18;
    unint64_t v51 = v11 + 64;
    uint64_t v19 = -v18;
    if (v19 < 64) {
      uint64_t v20 = ~(-1 << v19);
    }
    else {
      uint64_t v20 = -1;
    }
    unint64_t v13 = v20 & *(void *)(v11 + 64);
    unint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = 0;
  int64_t v50 = (unint64_t)(v12 + 64) >> 6;
  for (i = v14; ; unint64_t v14 = i)
  {
    if ((v14 & 0x8000000000000000) != 0)
    {
      uint64_t v25 = sub_10003AB50();
      if (!v25) {
        goto LABEL_61;
      }
      CGFloat v27 = v26;
      *(void *)&v59.CGFloat a = v25;
      sub_10002255C(0, &qword_10004B540);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      CGFloat a = transform.a;
      swift_unknownObjectRelease();
      v59.CGFloat a = v27;
      type metadata accessor for RhizomeView();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      CGFloat v29 = transform.a;
      swift_unknownObjectRelease();
      uint64_t v24 = v21;
      uint64_t v22 = v13;
      if (a == 0.0) {
        goto LABEL_61;
      }
    }
    else
    {
      if (v13)
      {
        uint64_t v22 = (v13 - 1) & v13;
        unint64_t v23 = __clz(__rbit64(v13)) | (v21 << 6);
        uint64_t v24 = v21;
      }
      else
      {
        int64_t v30 = v21 + 1;
        if (__OFADD__(v21, 1)) {
          goto LABEL_64;
        }
        if (v30 >= v50) {
          goto LABEL_61;
        }
        unint64_t v31 = *(void *)(v51 + 8 * v30);
        uint64_t v24 = v21 + 1;
        if (!v31)
        {
          uint64_t v24 = v21 + 2;
          if (v21 + 2 >= v50) {
            goto LABEL_61;
          }
          unint64_t v31 = *(void *)(v51 + 8 * v24);
          if (!v31)
          {
            uint64_t v24 = v21 + 3;
            if (v21 + 3 >= v50) {
              goto LABEL_61;
            }
            unint64_t v31 = *(void *)(v51 + 8 * v24);
            if (!v31)
            {
              uint64_t v24 = v21 + 4;
              if (v21 + 4 >= v50) {
                goto LABEL_61;
              }
              unint64_t v31 = *(void *)(v51 + 8 * v24);
              if (!v31)
              {
                uint64_t v32 = v21 + 5;
                while (v50 != v32)
                {
                  unint64_t v31 = *(void *)(v51 + 8 * v32++);
                  if (v31)
                  {
                    uint64_t v24 = v32 - 1;
                    goto LABEL_36;
                  }
                }
LABEL_61:
                sub_10001ED5C();

                goto LABEL_62;
              }
            }
          }
        }
LABEL_36:
        uint64_t v22 = (v31 - 1) & v31;
        unint64_t v23 = __clz(__rbit64(v31)) + (v24 << 6);
      }
      uint64_t v33 = 8 * v23;
      long long v34 = *(void **)(*(void *)(v14 + 56) + v33);
      CGFloat a = COERCE_DOUBLE(*(id *)(*(void *)(v14 + 48) + v33));
      CGFloat v29 = COERCE_DOUBLE(v34);
      if (a == 0.0) {
        goto LABEL_61;
      }
    }

    switch(a1)
    {
      case 2:
      case 4:
        CLKFloatEqualsFloat();
        break;
      default:
        break;
    }
    switch(a2)
    {
      case 2:
      case 4:
        CLKFloatEqualsFloat();
        break;
      default:
        break;
    }
    CLKInterpolateBetweenFloatsClipped();
    CGFloat v36 = v35;
    CGFloat v55 = v29;
    transform.CGFloat a = *(CGFloat *)(*(void *)&v29 + OBJC_IVAR____TtC13RhizomePoster11RhizomeView_lockedScreenLayout + 16);
    swift_bridgeObjectRetain();
    unint64_t v37 = swift_bridgeObjectRetain();
    sub_10000D96C(v37);
    CGFloat v38 = transform.a;
    if (*(void *)&transform.a >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_10003AB80();
      swift_bridgeObjectRelease();
      if (!v39) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v39 = *(void *)((*(void *)&transform.a & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v39) {
        goto LABEL_16;
      }
    }
    if (v39 < 1) {
      break;
    }
    for (uint64_t j = 0; j != v39; ++j)
    {
      if ((*(void *)&v38 & 0xC000000000000001) != 0)
      {
        uint64_t v41 = sub_10003AA90();
      }
      else
      {
        uint64_t v41 = *(void *)(*(void *)&v38 + 8 * j + 32);
        swift_retain();
      }
      uint64_t v42 = swift_unknownObjectWeakLoadStrong();
      if (v42)
      {
        uint64_t v43 = (char *)v42;
        CGAffineTransformMakeRotation(&transform, *(CGFloat *)(v41 + 104));
        CGAffineTransformRotate(&v59, &transform, v36);
        long long v56 = *(_OWORD *)&v59.c;
        long long v57 = *(_OWORD *)&v59.a;
        CGFloat tx = v59.tx;
        CGFloat ty = v59.ty;
        unsigned int v46 = (objc_class *)type metadata accessor for RhizomeLayeredFlowerView();
        v58.receiver = v43;
        v58.super_class = v46;
        *(_OWORD *)&transform.CGFloat a = v57;
        *(_OWORD *)&transform.CGFloat c = v56;
        transform.CGFloat tx = tx;
        transform.CGFloat ty = ty;
        objc_msgSendSuper2(&v58, "setTransform:", &transform);
        uint64_t v47 = *(void *)&v43[OBJC_IVAR____TtC13RhizomePoster24RhizomeLayeredFlowerView_outlineLayerSet];
        if (v47 && (*(unsigned char *)(v47 + 24) & 1) != 0 && (*(unsigned char *)(v47 + 120) & 1) != 0)
        {
          swift_retain();
          [v43 transform];
          CGAffineTransformDecompose((CGAffineTransformComponents *)&v59, &transform);
          if (*(unsigned char *)(v47 + 48)) {
            double v48 = 1.5;
          }
          else {
            double v48 = 3.0;
          }
          double v49 = v48 / v59.a;
          [*(id *)(v47 + 56) setLineWidth:v48 / v59.a];
          [*(id *)(v47 + 64) setLineWidth:v49];
          [*(id *)(v47 + 72) setLineWidth:v49];

          swift_release();
        }
        else
        {
        }
      }
      swift_release();
    }
LABEL_16:

    swift_bridgeObjectRelease();
    unint64_t v13 = v22;
    uint64_t v21 = v24;
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  swift_once();
LABEL_8:
  uint64_t v15 = sub_10003A5F0();
  sub_10000325C(v15, (uint64_t)qword_10004D080);
  unint64_t v6 = sub_10003A5D0();
  os_log_type_t v16 = sub_10003A860();
  if (os_log_type_enabled(v6, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v16, "Failed to load first rhizome view for rotation.", v17, 2u);
    swift_slowDealloc();
  }
LABEL_62:
}

void sub_10003029C(uint64_t a1)
{
  uint64_t v3 = (unint64_t *)(v1 + OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_allRhizomeViews);
  swift_beginAccess();
  unint64_t v4 = *v3;
  if ((v4 & 0xC000000000000001) != 0)
  {
    unint64_t v23 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v7 = sub_10003AB20() | 0x8000000000000000;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(v4 + 32);
    uint64_t v5 = ~v8;
    unint64_t v23 = v4 + 64;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(v4 + 64);
    unint64_t v7 = v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = 0;
  int64_t v12 = (unint64_t)(v5 + 64) >> 6;
  if ((v7 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v13 = (v6 - 1) & v6;
      unint64_t v14 = __clz(__rbit64(v6)) | (v11 << 6);
      uint64_t v15 = v11;
      goto LABEL_27;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v18 >= v12) {
      goto LABEL_30;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    uint64_t v15 = v11 + 1;
    if (!v19)
    {
      uint64_t v15 = v11 + 2;
      if (v11 + 2 >= v12) {
        goto LABEL_30;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v15);
      if (!v19)
      {
        uint64_t v15 = v11 + 3;
        if (v11 + 3 >= v12) {
          goto LABEL_30;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v15);
        if (!v19)
        {
          uint64_t v15 = v11 + 4;
          if (v11 + 4 >= v12) {
            goto LABEL_30;
          }
          unint64_t v19 = *(void *)(v23 + 8 * v15);
          if (!v19)
          {
            uint64_t v20 = v11 + 5;
            while (v12 != v20)
            {
              unint64_t v19 = *(void *)(v23 + 8 * v20++);
              if (v19)
              {
                uint64_t v15 = v20 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_10001ED5C();
            return;
          }
        }
      }
    }
LABEL_26:
    uint64_t v13 = (v19 - 1) & v19;
    unint64_t v14 = __clz(__rbit64(v19)) + (v15 << 6);
LABEL_27:
    uint64_t v21 = 8 * v14;
    uint64_t v22 = *(void **)(*(void *)(v7 + 56) + v21);
    id v16 = *(id *)(*(void *)(v7 + 48) + v21);
    id v17 = v22;
    if (!v16) {
      goto LABEL_30;
    }
    while (1)
    {

      sub_10000D318(a1);
      uint64_t v11 = v15;
      unint64_t v6 = v13;
      if ((v7 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_10003AB50())
      {
        sub_10002255C(0, &qword_10004B540);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v16 = v24;
        swift_unknownObjectRelease();
        type metadata accessor for RhizomeView();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v17 = v24;
        swift_unknownObjectRelease();
        uint64_t v15 = v11;
        uint64_t v13 = v6;
        if (v24) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
}

uint64_t sub_100030568(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_10003AB30();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = sub_10003061C(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_100019F80(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10003061C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000316C(&qword_10004B288);
    uint64_t v2 = sub_10003ABC0();
    uint64_t v18 = v2;
    sub_10003AB20();
    uint64_t v3 = sub_10003AB50();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_10002255C(0, &qword_10004B540);
      do
      {
        swift_dynamicCast();
        type metadata accessor for RhizomeView();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_10001960C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_10003A8F0(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_10003AB50();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

uint64_t sub_100030858(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000316C(&qword_10004AF70);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v75 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v76 = (char *)&v71 - v7;
  uint64_t v8 = sub_10003A470();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakAssign();
  sub_100032264();
  swift_unknownObjectRetain();
  sub_10003A550();
  unint64_t v12 = self;
  id v13 = [v12 currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14 == (id)1)
  {
    if (qword_10004ACD8 != -1) {
      swift_once();
    }
    BOOL v15 = &qword_10004D120;
  }
  else
  {
    if (qword_10004ACE0 != -1) {
      swift_once();
    }
    BOOL v15 = &qword_10004D128;
  }
  uint64_t v16 = (void *)*v15;
  swift_bridgeObjectRetain();
  id v17 = [v12 currentDevice];
  id v18 = [v17 userInterfaceIdiom];

  if (v18 == (id)1)
  {
    if (qword_10004ACE8 != -1) {
      swift_once();
    }
    unint64_t v19 = &qword_10004D130;
  }
  else
  {
    if (qword_10004ACF0 != -1) {
      swift_once();
    }
    unint64_t v19 = &qword_10004D138;
  }
  uint64_t v20 = (void *)*v19;
  swift_bridgeObjectRetain();
  id v21 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  v79[0] = 0;
  id v22 = [v21 loadUserInfoWithError:v79];
  swift_unknownObjectRelease();
  id v23 = v79[0];
  if (v22)
  {
    uint64_t v24 = sub_10003A6A0();
    id v25 = v23;

    unint64_t v77 = 0xD000000000000010;
    unint64_t v78 = 0x800000010003DED0;
    sub_10003AA10();
    if (*(void *)(v24 + 16) && (unint64_t v26 = sub_100018324((uint64_t)v79), (v27 & 1) != 0))
    {
      sub_10000E7B4(*(void *)(v24 + 56) + 32 * v26, (uint64_t)&v80);
    }
    else
    {
      long long v80 = 0u;
      long long v81 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10002637C((uint64_t)v79);
    if (!*((void *)&v81 + 1))
    {
      uint64_t v44 = &qword_10004B570;
      double v45 = &v80;
LABEL_35:
      sub_10000775C((uint64_t)v45, v44);
      goto LABEL_36;
    }
    if (swift_dynamicCast())
    {
      uint64_t v28 = v77;
      unint64_t v29 = v78;
      if (qword_10004AC80 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_10003A5F0();
      sub_10000325C(v30, (uint64_t)qword_10004D080);
      swift_bridgeObjectRetain_n();
      unint64_t v31 = sub_10003A5D0();
      os_log_type_t v32 = sub_10003A850();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v74 = v11;
      if (v33)
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v73 = v9;
        double v35 = (uint8_t *)v34;
        CGFloat v36 = (void *)swift_slowAlloc();
        uint64_t v72 = v8;
        v79[0] = v36;
        *(_DWORD *)double v35 = 136315138;
        id v71 = v35 + 4;
        swift_bridgeObjectRetain();
        *(void *)&long long v80 = sub_10000E014(v28, v29, (uint64_t *)v79);
        sub_10003A940();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Successfully loaded uuid string from user info. %s", v35, 0xCu);
        swift_arrayDestroy();
        uint64_t v8 = v72;
        swift_slowDealloc();
        uint64_t v9 = v73;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      unsigned int v46 = (long long *)v76;
      uint64_t v47 = (uint64_t *)(v2 + OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_savedLayoutUUIDString);
      *uint64_t v47 = v28;
      v47[1] = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_10003A440();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(long long *, uint64_t, uint64_t))(v9 + 48))(v46, 1, v8) == 1)
      {
        uint64_t v44 = &qword_10004AF70;
        double v45 = v46;
        goto LABEL_35;
      }
      double v49 = v74;
      (*(void (**)(char *, long long *, uint64_t))(v9 + 32))(v74, v46, v8);
      uint64_t v50 = (uint64_t)v75;
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v75, v49, v8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v50, 0, 1, v8);
      sub_100006980(v50, 0);
      unint64_t v52 = v51;
      sub_10000775C(v50, &qword_10004AF70);
      if (!v52)
      {
        (*(void (**)(char *, uint64_t))(v9 + 8))(v49, v8);
        goto LABEL_36;
      }
      uint64_t v73 = v9;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v52 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v53 = sub_10003AB80();
        if (v53) {
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v53 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v53)
        {
LABEL_40:
          v79[0] = _swiftEmptyArrayStorage;
          sub_100017644(0, v53 & ~(v53 >> 63), 0);
          if (v53 < 0) {
            __break(1u);
          }
          uint64_t v72 = v8;
          uint64_t v16 = v79[0];
          uint64_t v76 = (char *)(v52 & 0xC000000000000001);
          if ((v52 & 0xC000000000000001) != 0)
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              char v55 = *(unsigned char *)(sub_10003AA90() + 96);
              swift_unknownObjectRelease();
              v79[0] = v16;
              unint64_t v57 = v16[2];
              unint64_t v56 = v16[3];
              if (v57 >= v56 >> 1)
              {
                sub_100017644(v56 > 1, v57 + 1, 1);
                uint64_t v16 = v79[0];
              }
              v16[2] = v57 + 1;
              *((unsigned char *)v16 + v57 + 32) = v55;
            }
          }
          else
          {
            unint64_t v58 = v52 + 32;
            unint64_t v59 = *((void *)v79[0] + 2);
            uint64_t v60 = v53;
            do
            {
              char v61 = *(unsigned char *)(*(void *)v58 + 96);
              v79[0] = v16;
              unint64_t v62 = v16[3];
              if (v59 >= v62 >> 1)
              {
                sub_100017644(v62 > 1, v59 + 1, 1);
                uint64_t v16 = v79[0];
              }
              v16[2] = v59 + 1;
              *((unsigned char *)v16 + v59 + 32) = v61;
              v58 += 8;
              ++v59;
              --v60;
            }
            while (v60);
          }
          swift_bridgeObjectRelease();
          v79[0] = _swiftEmptyArrayStorage;
          sub_1000176DC(0, v53 & ~(v53 >> 63), 0);
          uint64_t v20 = v79[0];
          if (v76)
          {
            uint64_t v63 = 0;
            uint64_t v8 = v72;
            do
            {
              uint64_t v64 = *(void *)(sub_10003AA90() + 112);
              swift_unknownObjectRelease();
              v79[0] = v20;
              unint64_t v66 = v20[2];
              unint64_t v65 = v20[3];
              if (v66 >= v65 >> 1)
              {
                sub_1000176DC(v65 > 1, v66 + 1, 1);
                uint64_t v20 = v79[0];
              }
              ++v63;
              v20[2] = v66 + 1;
              v20[v66 + 4] = v64;
            }
            while (v53 != v63);
          }
          else
          {
            unint64_t v67 = v52 + 32;
            unint64_t v68 = *((void *)v79[0] + 2);
            uint64_t v8 = v72;
            do
            {
              uint64_t v69 = *(void *)(*(void *)v67 + 112);
              v79[0] = v20;
              unint64_t v70 = v20[3];
              if (v68 >= v70 >> 1)
              {
                sub_1000176DC(v70 > 1, v68 + 1, 1);
                uint64_t v20 = v79[0];
              }
              v20[2] = v68 + 1;
              v20[v68 + 4] = v69;
              v67 += 8;
              ++v68;
              --v53;
            }
            while (v53);
          }
          swift_bridgeObjectRelease();
          goto LABEL_65;
        }
      }
      swift_bridgeObjectRelease_n();
      uint64_t v20 = _swiftEmptyArrayStorage;
      uint64_t v16 = _swiftEmptyArrayStorage;
LABEL_65:
      (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v8);
    }
  }
  else
  {
    id v37 = v79[0];
    sub_10003A430();

    swift_willThrow();
    if (qword_10004AC80 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_10003A5F0();
    sub_10000325C(v38, (uint64_t)qword_10004D080);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v39 = sub_10003A5D0();
    os_log_type_t v40 = sub_10003A860();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      v79[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      swift_getErrorValue();
      uint64_t v42 = sub_10003AC70();
      *(void *)&long long v80 = sub_10000E014(v42, v43, (uint64_t *)v79);
      sub_10003A940();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to load user info in populate views. %s", v41, 0xCu);
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
  }
LABEL_36:
  sub_100033A5C((uint64_t)v16, (uint64_t)v20, 0, 0);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003142C(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = [a1 currentLook];
  uint64_t v7 = (uint64_t *)(a2 + OBJC_IVAR____TtC13RhizomePoster19RhizomePosterEditor_allRhizomeViews);
  swift_beginAccess();
  uint64_t v8 = *v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_10002D4B8(v6, v8);

  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v10 = v9;
    sub_10002E940((uint64_t)v10);
  }
  else
  {
    if (qword_10004AC80 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10003A5F0();
    sub_10000325C(v11, (uint64_t)qword_10004D080);
    unint64_t v12 = a1;
    uint64_t v10 = sub_10003A5D0();
    os_log_type_t v13 = sub_10003A860();
    if (os_log_type_enabled(v10, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      BOOL v15 = (void *)swift_slowAlloc();
      *(_DWORD *)id v14 = 138412290;
      id v17 = [v12 currentLook];
      sub_10003A940();
      *BOOL v15 = v17;

      _os_log_impl((void *)&_mh_execute_header, v10, v13, "PosterEditor couldn't find rhizome view for look %@", v14, 0xCu);
      sub_10000316C((uint64_t *)&unk_10004B560);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v10 = v12;
    }
  }

  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_100031660()
{
  if (qword_10004AC80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10003A5F0();
  sub_10000325C(v0, (uint64_t)qword_10004D080);
  uint64_t v1 = sub_10003A5D0();
  os_log_type_t v2 = sub_10003A840();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "PosterEditor invalidated", v3, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectWeakAssign();
  if (qword_10004AD10 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_10004B598 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  if (qword_10004AD18 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_10004B5A0 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  if (qword_10004AD08 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_10004B590 = &_swiftEmptyDictionarySingleton;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100031868(void *a1)
{
  id v2 = [a1 timeFontIdentifier];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)PRTimeFontIdentifierRail;
    uint64_t v5 = sub_10003A6F0();
    uint64_t v7 = v6;
    if (v5 == sub_10003A6F0() && v7 == v8) {
      goto LABEL_19;
    }
    char v10 = sub_10003AC40();
    id v11 = v4;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v12 = 0;
    if (v10) {
      return v12 & 1;
    }
  }
  id v13 = [a1 timeFontIdentifier];
  if (v13)
  {
    uint64_t v3 = v13;
    uint64_t v4 = (void *)PRTimeFontIdentifierSlab;
    uint64_t v14 = sub_10003A6F0();
    uint64_t v16 = v15;
    if (v14 != sub_10003A6F0() || v16 != v17)
    {
      char v19 = sub_10003AC40();
      id v20 = v4;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v12 = 0;
      if (v19) {
        return v12 & 1;
      }
      goto LABEL_13;
    }
LABEL_19:
    id v30 = v4;

    swift_bridgeObjectRelease_n();
    char v12 = 0;
    return v12 & 1;
  }
LABEL_13:
  id v21 = [a1 timeFontIdentifier];
  if (v21)
  {
    id v22 = v21;
    id v23 = (void *)PRTimeFontIdentifierNewYork;
    uint64_t v24 = sub_10003A6F0();
    uint64_t v26 = v25;
    if (v24 == sub_10003A6F0() && v26 == v27) {
      char v29 = 1;
    }
    else {
      char v29 = sub_10003AC40();
    }
    id v31 = v23;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v29 = 0;
  }
  char v12 = v29 ^ 1;
  return v12 & 1;
}

id sub_100031A84()
{
  id v0 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
  sub_10002F644((unint64_t)_swiftEmptyArrayStorage);
  id v1 = objc_allocWithZone((Class)PREditorColorPalette);
  Class isa = sub_10003A780().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithColors:isa localizedName:0 showsColorWell:0];

  [v0 setColorPalette:v3];
  [v0 setColorWellDisplayMode:0];
  [v0 setShowsSlider:1];
  return v0;
}

uint64_t sub_100031B6C(void *a1)
{
  if (qword_10004AD00 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10004D160;
  if ((unint64_t)qword_10004D160 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_10003AB80())
    {
LABEL_5:
      if ((v3 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_10003AA90();
      }
      else
      {
        if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_45;
        }
        id v5 = *(id *)(v3 + 32);
      }
      id v1 = v5;
      swift_bridgeObjectRelease();
      id v6 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
      swift_unknownObjectRelease();
      v35[0] = 0;
      id v7 = [v6 loadUserInfoWithError:v35];
      swift_unknownObjectRelease();
      id v8 = v35[0];
      if (!v7)
      {
        id v14 = v35[0];
        sub_10003A430();

        swift_willThrow();
        swift_errorRelease();
        if (qword_10004AC80 != -1) {
          swift_once();
        }
        uint64_t v15 = sub_10003A5F0();
        sub_10000325C(v15, (uint64_t)qword_10004D080);
        uint64_t v16 = sub_10003A5D0();
        os_log_type_t v17 = sub_10003A860();
        if (os_log_type_enabled(v16, v17))
        {
          id v18 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to create user info dictionary. Defaulting to first look.", v18, 2u);
          swift_slowDealloc();
        }

        id v19 = [v1 identifier];
        goto LABEL_31;
      }
      uint64_t v3 = sub_10003A6A0();
      id v9 = v8;

      if (qword_10004AD28 == -1)
      {
LABEL_10:
        uint64_t v33 = qword_10004D170;
        uint64_t v34 = *(void *)algn_10004D178;
        swift_bridgeObjectRetain();
        sub_10003AA10();
        if (*(void *)(v3 + 16) && (unint64_t v10 = sub_100018324((uint64_t)v35), (v11 & 1) != 0))
        {
          sub_10000E7B4(*(void *)(v3 + 56) + 32 * v10, (uint64_t)&v36);
        }
        else
        {
          long long v36 = 0u;
          long long v37 = 0u;
        }
        sub_10002637C((uint64_t)v35);
        if (*((void *)&v37 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0 && sub_100034E70(v33, v34) != 5)
          {
            swift_bridgeObjectRelease();
            switch(v12)
            {
              case 1:

                uint64_t v13 = 6579538;
                break;
              case 2:

                uint64_t v13 = 0x6E65657247;
                break;
              case 3:

                uint64_t v13 = 0x6C6F6369746C754DLL;
                break;
              case 4:

                uint64_t v13 = 0x6B63616C42;
                break;
              default:

                uint64_t v13 = 0x7974696E55;
                break;
            }
            return v13;
          }
        }
        else
        {
          sub_10000775C((uint64_t)&v36, &qword_10004B570);
        }
        if (qword_10004AC80 != -1) {
          swift_once();
        }
        uint64_t v20 = sub_10003A5F0();
        sub_10000325C(v20, (uint64_t)qword_10004D080);
        swift_bridgeObjectRetain();
        id v21 = sub_10003A5D0();
        os_log_type_t v22 = sub_10003A860();
        if (os_log_type_enabled(v21, v22))
        {
          id v23 = (uint8_t *)swift_slowAlloc();
          v35[0] = (id)swift_slowAlloc();
          *(_DWORD *)id v23 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_10003A6B0();
          unint64_t v26 = v25;
          swift_bridgeObjectRelease();
          *(void *)&long long v36 = sub_10000E014(v24, v26, (uint64_t *)v35);
          sub_10003A940();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to create color option from user info dictionary: %s", v23, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v19 = [v1 identifier];
LABEL_31:
        id v27 = v19;
        uint64_t v13 = sub_10003A6F0();

        return v13;
      }
LABEL_45:
      swift_once();
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((qword_10004D160 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_10004AC80 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_10003A5F0();
  sub_10000325C(v28, (uint64_t)qword_10004D080);
  char v29 = sub_10003A5D0();
  os_log_type_t v30 = sub_10003A860();
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "All looks array was empty somehow...", v31, 2u);
    swift_slowDealloc();
  }

  return 0;
}

unint64_t sub_100032264()
{
  unint64_t result = qword_10004B580;
  if (!qword_10004B580)
  {
    type metadata accessor for RhizomePosterEditor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B580);
  }
  return result;
}

void sub_1000322B8()
{
  off_10004B590 = &_swiftEmptyDictionarySingleton;
}

void sub_1000322CC()
{
  off_10004B598 = &_swiftEmptyDictionarySingleton;
}

void sub_1000322E0()
{
  off_10004B5A0 = &_swiftEmptyDictionarySingleton;
}

uint64_t sub_1000322F4()
{
  uint64_t v0 = sub_10003A8A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003A890();
  __chkstk_darwin();
  sub_10003A630();
  __chkstk_darwin();
  sub_1000068A8();
  sub_10003A620();
  sub_10003A880();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_10003A8D0();
  qword_10004D168 = result;
  return result;
}

void *sub_10003249C(void *a1, int a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v49 = a4;
  LODWORD(v44) = a2;
  uint64_t v8 = sub_10003A600();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v47 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10003A630();
  uint64_t v11 = *(void *)(v48 - 8);
  __chkstk_darwin();
  unsigned int v46 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100032ED8(a5);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (qword_10004AD08 != -1) {
    swift_once();
  }
  swift_beginAccess();
  os_log_type_t v17 = off_10004B590;
  uint64_t v18 = *((void *)off_10004B590 + 2);
  swift_bridgeObjectRetain();
  if (v18 && (unint64_t v19 = sub_1000181A4(v14, v16), (v20 & 1) != 0))
  {
    id v21 = *(void **)(v17[7] + 8 * v19);
    id v22 = v21;
  }
  else
  {
    id v21 = 0;
  }
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  swift_endAccess();
  swift_bridgeObjectRelease_n();
  if (!*(void *)(v23 + 16) && a3)
  {
    uint64_t v42 = v11;
    uint64_t v43 = v9;
    uint64_t v24 = v8;
    char v25 = v44 & 1;
    uint64_t v26 = a1[4];
    uint64_t v27 = a1[5];
    uint64_t v28 = (void *)a1[1];
    uint64_t v29 = a3;
    uint64_t v30 = v49;
    sub_100033078(a3);
    uint64_t v31 = qword_10004AD20;
    id v32 = v28;
    if (v31 != -1) {
      swift_once();
    }
    uint64_t v44 = qword_10004D168;
    uint64_t v33 = swift_allocObject();
    id v34 = v45;
    *(void *)(v33 + 16) = v23;
    *(void *)(v33 + 24) = v34;
    *(void *)(v33 + 40) = 0;
    *(void *)(v33 + 48) = 0;
    *(void *)(v33 + 32) = v32;
    *(void *)(v33 + 56) = v26;
    *(void *)(v33 + 64) = v27;
    *(unsigned char *)(v33 + 72) = v25;
    *(void *)(v33 + 80) = a3;
    *(void *)(v33 + 88) = v30;
    aBlock[4] = sub_1000330D0;
    aBlock[5] = v33;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005FC0;
    aBlock[3] = &unk_1000462E0;
    double v35 = _Block_copy(aBlock);
    sub_100033078(a3);
    id v45 = v32;
    swift_retain();
    long long v36 = v46;
    sub_10003A610();
    uint64_t v50 = &_swiftEmptyArrayStorage;
    sub_100033104();
    sub_10000316C(&qword_10004AF38);
    sub_10003315C();
    long long v37 = v47;
    sub_10003A970();
    sub_10003A8C0();
    _Block_release(v35);
    sub_1000331B8(v29);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v37, v24);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v36, v48);
    swift_release();
  }
  swift_beginAccess();
  uint64_t v38 = *(void **)(v23 + 16);
  id v39 = v38;
  swift_release();
  return v38;
}

uint64_t sub_1000328E4(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, void *a7, char a8, uint64_t a9, uint64_t a10)
{
  char v18 = a8 & 1;
  uint64_t v19 = sub_10003A600();
  uint64_t v34 = *(void *)(v19 - 8);
  __chkstk_darwin();
  id v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_10003A630();
  uint64_t v22 = *(void *)(v33 - 8);
  __chkstk_darwin();
  uint64_t v24 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v25 = [a7 CGPath];
  uint64_t v26 = sub_1000332F0(v25, v18, a2, a3, a4, a5);

  swift_beginAccess();
  uint64_t v27 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v26;

  sub_1000068A8();
  uint64_t v28 = (void *)sub_10003A8B0();
  uint64_t v29 = (void *)swift_allocObject();
  v29[2] = a9;
  v29[3] = a10;
  v29[4] = a1;
  aBlock[4] = sub_1000335F0;
  aBlock[5] = v29;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005FC0;
  aBlock[3] = &unk_100046330;
  uint64_t v30 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  sub_10003A610();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100033104();
  sub_10000316C(&qword_10004AF38);
  sub_10003315C();
  sub_10003A970();
  sub_10003A8C0();
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v33);
}

void sub_100032C04(void (*a1)(void *), uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t v5 = *(void **)(a3 + 16);
  id v6 = v5;
  a1(v5);
}

uint64_t sub_100032C6C(void *a1, const CGPath *a2, uint64_t a3)
{
  uint64_t v6 = sub_10003A480();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (CGContext *)[a1 CGContext];
  CGContextAddPath(v10, a2);

  uint64_t v11 = (CGContext *)[a1 CGContext];
  CGFloat v12 = *(double *)(a3 + 8);
  CGFloat v13 = *(double *)(a3 + 16);
  CGFloat v14 = *(double *)(a3 + 24);
  id v15 = [objc_allocWithZone((Class)UIColor) initWithCGColor:*(void *)a3];
  id v16 = [v15 colorWithAlphaComponent:*(double *)(a3 + 32)];

  os_log_type_t v17 = (CGColor *)[v16 CGColor];
  v21.double width = v12;
  v21.double height = v13;
  CGContextSetShadowWithColor(v11, v21, v14, v17);

  id v18 = [a1 CGContext];
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for CGPathFillRule.winding(_:), v6);
  sub_10003A830();

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100032E68(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t type metadata accessor for RhizomeFlowerLayerImageCache()
{
  return self;
}

void sub_100032ED8(double a1)
{
  sub_10003AB10();
  v2._uint64_t countAndFlagsBits = 45;
  v2._object = (void *)0xE100000000000000;
  sub_10003A740(v2);
  sub_10003AB10();
  v3._uint64_t countAndFlagsBits = 45;
  v3._object = (void *)0xE100000000000000;
  sub_10003A740(v3);
  sub_10003AB10();
  v4._uint64_t countAndFlagsBits = 45;
  v4._object = (void *)0xE100000000000000;
  sub_10003A740(v4);
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
  {
    v5._uint64_t countAndFlagsBits = sub_10003AC20();
    sub_10003A740(v5);
    swift_bridgeObjectRelease();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100033040()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100033078(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100033088()
{
  swift_release();

  swift_release();
  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_1000330D0()
{
  return sub_1000328E4(*(void *)(v0 + 16), *(CGFloat *)(v0 + 40), *(CGFloat *)(v0 + 48), *(CGFloat *)(v0 + 56), *(CGFloat *)(v0 + 64), *(void *)(v0 + 24), *(void **)(v0 + 32), *(unsigned char *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_1000330EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000330FC()
{
  return swift_release();
}

unint64_t sub_100033104()
{
  unint64_t result = qword_10004AF30;
  if (!qword_10004AF30)
  {
    sub_10003A600();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004AF30);
  }
  return result;
}

unint64_t sub_10003315C()
{
  unint64_t result = qword_10004AF40;
  if (!qword_10004AF40)
  {
    sub_100002F64(&qword_10004AF38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004AF40);
  }
  return result;
}

uint64_t sub_1000331B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_1000331C8(uint64_t a1, double a2)
{
  if (*(unsigned char *)(a1 + 1) == 1)
  {
    if (qword_10004AD18 != -1) {
      swift_once();
    }
    Swift::String v3 = (uint64_t *)&off_10004B5A0;
  }
  else
  {
    if (qword_10004AD10 != -1) {
      swift_once();
    }
    Swift::String v3 = (uint64_t *)&off_10004B598;
  }
  swift_beginAccess();
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain();
  sub_100032ED8(a2);
  if (*(void *)(v4 + 16) && (unint64_t v7 = sub_1000181A4(v5, v6), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void **)(*(void *)(v4 + 56) + 8 * v7);
    id v10 = v9;
  }
  else
  {
    uint64_t v9 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000332F0(void *a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v12 = [self blackColor];
  id v13 = [v12 CGColor];

  if (a2) {
    double v14 = 0.7;
  }
  else {
    double v14 = 0.5;
  }
  if (a2) {
    double v15 = 15.0;
  }
  else {
    double v15 = 20.0;
  }
  double v16 = 2.0;
  if ((a2 & 1) == 0) {
    double v16 = 5.0;
  }
  double v28 = v16;
  double v29 = v14;
  v31.origin.x = a3;
  v31.origin.y = a4;
  v31.size.double width = a5;
  v31.size.double height = a6;
  double v17 = v15 + 20.0 + v15 + 20.0;
  double v18 = v17 + CGRectGetWidth(v31);
  v32.origin.x = a3;
  v32.origin.y = a4;
  v32.size.double width = a5;
  v32.size.double height = a6;
  id v19 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithBounds:", -(v15 + 20.0), -(v15 + 20.0), v18, v17 + CGRectGetHeight(v32));
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = v13;
  *(void *)(v20 + 32) = 0;
  *(double *)(v20 + 40) = v28;
  *(double *)(v20 + 48) = v15;
  *(double *)(v20 + 56) = v29;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_10003363C;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = sub_100033658;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100032E68;
  aBlock[3] = &unk_1000463A8;
  uint64_t v22 = _Block_copy(aBlock);
  id v23 = a1;
  id v24 = v13;
  swift_retain();
  swift_release();
  id v25 = [v19 imageWithActions:v22];
  _Block_release(v22);
  LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v22)
  {
    __break(1u);
  }
  else
  {
    id v27 = [v25 _imageThatSuppressesAccessibilityHairlineThickening];
    swift_release();

    return (uint64_t)v27;
  }
  return result;
}

uint64_t sub_1000335B0()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000335F0()
{
  sub_100032C04(*(void (**)(void *))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000335FC()
{
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10003363C(void *a1)
{
  return sub_100032C6C(a1, *(const CGPath **)(v1 + 16), v1 + 24);
}

uint64_t sub_100033648()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033658()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100033680(char a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8 = [self blackColor];
  id v9 = [v8 CGColor];

  if (a1) {
    double v10 = 35.0;
  }
  else {
    double v10 = 40.0;
  }
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.double width = a2;
  v21.size.double height = a3;
  double v11 = v10 + v10 + CGRectGetWidth(v21);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.double width = a2;
  v22.size.double height = a3;
  double Height = CGRectGetHeight(v22);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  double v14 = sub_1000348B4(v11 * a4);
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  double v15 = v10 + v10 + Height;
  double v16 = sub_1000348B4(v15 * a4);
  if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v16 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v16 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    return;
  }
  int64_t v17 = (uint64_t)v16;
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  id v19 = CGBitmapContextCreate(0, (uint64_t)v14, v17, 8uLL, AlignedBytesPerRow, DeviceGray, 7u);
  uint64_t v20 = v19;
  if (v19)
  {
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.double width = v11;
    v23.size.double height = v15;
    CGContextClearRect(v19, v23);
    CGContextTranslateCTM(v20, 0.0, (double)v17);
    CGContextScaleCTM(v20, a4, -a4);
    CGContextTranslateCTM(v20, v10, v10);
  }
}

id sub_100033888(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  id v4 = [self mainScreen];
  [v4 scale];
  CGFloat v6 = v5;

  sub_100033680(v3, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), v6);
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  id v9 = (const CGPath *)[*(id *)(a1 + 8) CGPath];
  CGContextAddPath(v8, v9);

  double v10 = self;
  id v11 = [v10 redColor];
  id v12 = (CGColor *)[v11 CGColor];

  CGContextSetStrokeColorWithColor(v8, v12);
  id v13 = [v10 clearColor];
  double v14 = (CGColor *)[v13 CGColor];

  CGContextSetFillColorWithColor(v8, v14);
  CGContextSetLineWidth(v8, *(CGFloat *)(a1 + 24));
  CGContextDrawPath(v8, kCGPathFillStroke);
  CGImageRef Image = CGBitmapContextCreateImage(v8);
  if (!Image)
  {

    return 0;
  }
  CGImageRef v16 = Image;
  id v17 = [objc_allocWithZone((Class)UIImage) initWithCGImage:Image scale:0 orientation:v6];
  id v18 = [v17 _imageThatSuppressesAccessibilityHairlineThickening];

  return v18;
}

void sub_100033A5C(uint64_t a1, uint64_t a2, int a3, char a4)
{
  uint64_t v146 = sub_10003A480();
  uint64_t v8 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  CGSize v145 = (char *)&v132 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = self;
  id v11 = [v10 blackColor];
  id v12 = [v10 blackColor];
  id v144 = v10;
  id v135 = [v10 blackColor];
  uint64_t v140 = *(void *)(a1 + 16);
  if (v140)
  {
    uint64_t v13 = 0;
    int v149 = a4 & 1;
    uint64_t v137 = a2 + 32;
    uint64_t v138 = a1 + 32;
    uint64_t v139 = *(void *)(a2 + 16);
    unsigned int v143 = enum case for CGPathFillRule.winding(_:);
    uint64_t v141 = (void (**)(char *, uint64_t))(v8 + 8);
    double v142 = (void (**)(char *, void, uint64_t))(v8 + 104);
    double v14 = v135;
    int v148 = a3;
    id v133 = v12;
    id v134 = v11;
    while (1)
    {
      if (v13 == v139)
      {
        __break(1u);
LABEL_97:
        __break(1u);
LABEL_98:
        __break(1u);
LABEL_99:
        sub_10003AC60();
        __break(1u);
        return;
      }
      __int16 v16 = *(unsigned __int8 *)(v138 + v13);
      double v17 = *(double *)(v137 + 8 * v13);
      id v15 = v11;
      id v18 = v12;
      id v19 = v14;
      id v20 = v14;
      sub_100007928(0, v16, v15, v18, v20, (uint64_t)v155, v17);
      sub_100005530((uint64_t)v155, (uint64_t)v156);
      if (!*((void *)&v156[0] + 1))
      {

        goto LABEL_5;
      }
      id v150 = v20;
      id v147 = v15;
      v157[2] = v156[2];
      uint64_t v157[3] = v156[3];
      v157[4] = v156[4];
      v157[0] = v156[0];
      v157[1] = v156[1];
      char v21 = v149;
      CGRect v22 = sub_100004F0C((unsigned __int8 *)v157, 0, v149);
      if (!v22) {
        goto LABEL_4;
      }
      CGRect v23 = v22;
      unint64_t v153 = sub_100004F0C((unsigned __int8 *)v157, 1, v21);
      if (!v153)
      {
        swift_bridgeObjectRelease();
LABEL_4:

        id v15 = v147;
        sub_100005598((uint64_t)v155);
LABEL_5:
        double v14 = v19;
        goto LABEL_6;
      }
      uint64_t v24 = v23[2];
      char v151 = v23;
      id v152 = v18;
      uint64_t v136 = v13;
      if (!v24) {
        goto LABEL_30;
      }
      unint64_t v25 = sub_100018114(0);
      if ((v26 & 1) == 0) {
        goto LABEL_30;
      }
      id v27 = (_OWORD *)(v23[7] + 48 * v25);
      long long v29 = v27[1];
      long long v28 = v27[2];
      v161[0] = *v27;
      v161[1] = v29;
      long long v162 = v28;
      sub_100034854((uint64_t)v161);
      sub_100032ED8(v17);
      uint64_t v31 = v30;
      uint64_t v33 = v32;
      if (qword_10004AD08 != -1) {
        swift_once();
      }
      swift_beginAccess();
      if (!*((void *)off_10004B590 + 2)) {
        break;
      }
      swift_bridgeObjectRetain();
      sub_1000181A4(v31, v33);
      char v35 = v34;
      swift_bridgeObjectRelease();
      if ((v35 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
LABEL_29:
      CGRect v23 = v151;
      id v18 = v152;
      sub_100034884((uint64_t)v161);
LABEL_30:
      uint64_t v48 = 0;
      id v49 = v150;
      do
      {
        char v50 = *((unsigned char *)&off_1000457E0 + v48 + 32);
        if (v23[2])
        {
          unint64_t v51 = sub_100018114(*((unsigned char *)&off_1000457E0 + v48 + 32));
          if (v52)
          {
            uint64_t v53 = (_OWORD *)(v23[7] + 48 * v51);
            long long v55 = v53[1];
            long long v54 = v53[2];
            v159[0] = *v53;
            v159[1] = v55;
            long long v160 = v54;
            sub_100034854((uint64_t)v159);
            sub_100032ED8(v17);
            uint64_t v57 = v56;
            uint64_t v59 = v58;
            if (qword_10004AD10 != -1) {
              swift_once();
            }
            swift_beginAccess();
            if (*((void *)off_10004B598 + 2))
            {
              swift_bridgeObjectRetain();
              sub_1000181A4(v57, v59);
              char v61 = v60;
              swift_bridgeObjectRelease();
              if (v61)
              {
                sub_100034884((uint64_t)v159);
                swift_bridgeObjectRelease();
                id v18 = v152;
LABEL_64:
                CGRect v23 = v151;
                goto LABEL_65;
              }
            }
            id v62 = [self mainScreen];
            [v62 scale];
            CGFloat v64 = v63;

            sub_100033680(v21, *(CGFloat *)&v160, *((CGFloat *)&v160 + 1), v64);
            if (v65)
            {
              unint64_t v66 = v65;
              id v67 = *((id *)&v159[0] + 1);
              [v67 setUsesEvenOddFillRule:0];
              unint64_t v68 = (const CGPath *)[v67 CGPath];
              CGContextAddPath(v66, v68);

              id v69 = [v144 blueColor];
              unint64_t v70 = (CGColor *)[v69 CGColor];

              CGContextSetFillColorWithColor(v66, v70);
              uint64_t v72 = v145;
              uint64_t v71 = v146;
              (*v142)(v145, v143, v146);
              sub_10003A830();
              (*v141)(v72, v71);
              CGImageRef Image = CGBitmapContextCreateImage(v66);
              if (Image)
              {
                CGImageRef v74 = Image;
                id v75 = [objc_allocWithZone((Class)UIImage) initWithCGImage:Image scale:0 orientation:v64];
                id v76 = [v75 _imageThatSuppressesAccessibilityHairlineThickening];

                if (v76)
                {
                  id v77 = [v76 imageWithRenderingMode:2];

                  swift_beginAccess();
                  if (v77)
                  {
                    id v78 = v77;
                    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    long long v80 = off_10004B598;
                    uint64_t v154 = off_10004B598;
                    off_10004B598 = (_UNKNOWN *)0x8000000000000000;
                    unint64_t v82 = sub_1000181A4(v57, v59);
                    uint64_t v83 = v80[2];
                    BOOL v84 = (v81 & 1) == 0;
                    uint64_t v85 = v83 + v84;
                    if (__OFADD__(v83, v84)) {
                      goto LABEL_98;
                    }
                    char v86 = v81;
                    if (v80[3] >= v85)
                    {
                      if (isUniquelyReferenced_nonNull_native)
                      {
                        double v89 = v154;
                        if ((v81 & 1) == 0) {
                          goto LABEL_61;
                        }
                      }
                      else
                      {
                        sub_10001AFDC();
                        double v89 = v154;
                        if ((v86 & 1) == 0) {
                          goto LABEL_61;
                        }
                      }
                    }
                    else
                    {
                      sub_1000192FC(v85, isUniquelyReferenced_nonNull_native);
                      unint64_t v87 = sub_1000181A4(v57, v59);
                      if ((v86 & 1) != (v88 & 1)) {
                        goto LABEL_99;
                      }
                      unint64_t v82 = v87;
                      double v89 = v154;
                      if ((v86 & 1) == 0)
                      {
LABEL_61:
                        sub_10001A1A4(v82, v57, v59, (uint64_t)v78, v89);
                        swift_bridgeObjectRetain();
LABEL_62:
                        char v21 = v149;
                        off_10004B598 = v89;
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        LOBYTE(a3) = v148;
LABEL_63:
                        swift_endAccess();

                        sub_100034884((uint64_t)v159);
                        id v18 = v152;
                        id v49 = v150;
                        goto LABEL_64;
                      }
                    }
                    uint64_t v96 = v89[7];
                    uint64_t v97 = 8 * v82;

                    *(void *)(v96 + v97) = v78;
                    goto LABEL_62;
                  }
LABEL_52:
                  swift_bridgeObjectRetain();
                  unint64_t v90 = sub_1000181A4(v57, v59);
                  char v92 = v91;
                  swift_bridgeObjectRelease();
                  if (v92)
                  {
                    char v93 = swift_isUniquelyReferenced_nonNull_native();
                    uint64_t v94 = off_10004B598;
                    uint64_t v154 = off_10004B598;
                    off_10004B598 = (_UNKNOWN *)0x8000000000000000;
                    LOBYTE(a3) = v148;
                    if ((v93 & 1) == 0)
                    {
                      sub_10001AFDC();
                      uint64_t v94 = v154;
                    }
                    swift_bridgeObjectRelease();
                    uint64_t v95 = *(void **)(v94[7] + 8 * v90);
                    sub_10000865C(v90, (uint64_t)v94);
                    off_10004B598 = v94;

                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    id v78 = 0;
                    char v21 = v149;
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    id v78 = 0;
                    LOBYTE(a3) = v148;
                    char v21 = v149;
                  }
                  goto LABEL_63;
                }
              }
              else
              {
              }
            }
            swift_beginAccess();
            goto LABEL_52;
          }
        }
LABEL_65:
        if (a3)
        {
          if (v153[2])
          {
            unint64_t v98 = sub_100018114(v50);
            if (v99)
            {
              uint64_t v100 = (_OWORD *)(v153[7] + 48 * v98);
              long long v102 = v100[1];
              long long v101 = v100[2];
              v158[0] = *v100;
              v158[1] = v102;
              v158[2] = v101;
              sub_100034854((uint64_t)v158);
              sub_100032ED8(v17);
              uint64_t v104 = v103;
              uint64_t v106 = v105;
              if (qword_10004AD18 != -1) {
                swift_once();
              }
              swift_beginAccess();
              if (!*((void *)off_10004B5A0 + 2)
                || (swift_bridgeObjectRetain(),
                    sub_1000181A4(v104, v106),
                    char v108 = v107,
                    swift_bridgeObjectRelease(),
                    (v108 & 1) == 0))
              {
                id v109 = sub_100033888((uint64_t)v158, v21);
                if (v109)
                {
                  double v110 = v109;
                  id v111 = [v109 imageWithRenderingMode:2];

                  swift_beginAccess();
                  if (v111)
                  {
                    id v112 = v111;
                    char v113 = swift_isUniquelyReferenced_nonNull_native();
                    double v114 = off_10004B5A0;
                    uint64_t v154 = off_10004B5A0;
                    off_10004B5A0 = (_UNKNOWN *)0x8000000000000000;
                    unint64_t v116 = sub_1000181A4(v104, v106);
                    uint64_t v117 = v114[2];
                    BOOL v118 = (v115 & 1) == 0;
                    uint64_t v119 = v117 + v118;
                    if (__OFADD__(v117, v118)) {
                      goto LABEL_97;
                    }
                    char v120 = v115;
                    if (v114[3] >= v119)
                    {
                      if (v113)
                      {
                        Swift::Int v123 = v154;
                        if ((v115 & 1) == 0) {
                          goto LABEL_89;
                        }
                      }
                      else
                      {
                        sub_10001AFDC();
                        Swift::Int v123 = v154;
                        if ((v120 & 1) == 0) {
                          goto LABEL_89;
                        }
                      }
                    }
                    else
                    {
                      sub_1000192FC(v119, v113);
                      unint64_t v121 = sub_1000181A4(v104, v106);
                      if ((v120 & 1) != (v122 & 1)) {
                        goto LABEL_99;
                      }
                      unint64_t v116 = v121;
                      Swift::Int v123 = v154;
                      if ((v120 & 1) == 0)
                      {
LABEL_89:
                        sub_10001A1A4(v116, v104, v106, (uint64_t)v112, v123);
                        swift_bridgeObjectRetain();
LABEL_90:
                        char v21 = v149;
                        off_10004B5A0 = v123;
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
LABEL_91:
                        swift_endAccess();

                        sub_100034884((uint64_t)v158);
                        id v18 = v152;
                        id v49 = v150;
LABEL_32:
                        CGRect v23 = v151;
                        goto LABEL_33;
                      }
                    }
                    uint64_t v130 = v123[7];
                    uint64_t v131 = 8 * v116;

                    *(void *)(v130 + v131) = v112;
                    goto LABEL_90;
                  }
                }
                else
                {
                  swift_beginAccess();
                }
                swift_bridgeObjectRetain();
                unint64_t v124 = sub_1000181A4(v104, v106);
                char v126 = v125;
                swift_bridgeObjectRelease();
                if (v126)
                {
                  char v127 = swift_isUniquelyReferenced_nonNull_native();
                  unint64_t v128 = off_10004B5A0;
                  uint64_t v154 = off_10004B5A0;
                  off_10004B5A0 = (_UNKNOWN *)0x8000000000000000;
                  if ((v127 & 1) == 0)
                  {
                    sub_10001AFDC();
                    unint64_t v128 = v154;
                  }
                  swift_bridgeObjectRelease();
                  unint64_t v129 = *(void **)(v128[7] + 8 * v124);
                  sub_10000865C(v124, (uint64_t)v128);
                  off_10004B5A0 = v128;

                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRelease();
                id v112 = 0;
                char v21 = v149;
                goto LABEL_91;
              }
              sub_100034884((uint64_t)v158);
              swift_bridgeObjectRelease();
              id v18 = v152;
              goto LABEL_32;
            }
          }
        }
LABEL_33:
        ++v48;
      }
      while (v48 != 3);
      sub_100005598((uint64_t)v155);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      id v15 = v147;
      id v11 = v134;
      double v14 = v135;
      id v12 = v133;
      uint64_t v13 = v136;
LABEL_6:
      if (++v13 == v140)
      {

        goto LABEL_95;
      }
    }
    long long v36 = v162;
    id v37 = [*((id *)&v161[0] + 1) CGPath];
    uint64_t v38 = (void *)sub_1000332F0(v37, v21, 0.0, 0.0, *(CGFloat *)&v36, *((CGFloat *)&v36 + 1));
    id v39 = v38;
    if (v38)
    {
      id v40 = [v38 imageWithRenderingMode:2];
      swift_beginAccess();
      if (v40)
      {
        char v41 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v154 = off_10004B590;
        off_10004B590 = (_UNKNOWN *)0x8000000000000000;
        sub_100019E10((uint64_t)v40, v31, v33, v41);
        off_10004B590 = v154;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_28:
        swift_endAccess();

        goto LABEL_29;
      }
    }
    else
    {
      swift_beginAccess();
    }
    swift_bridgeObjectRetain();
    unint64_t v42 = sub_1000181A4(v31, v33);
    char v44 = v43;
    swift_bridgeObjectRelease();
    if (v44)
    {
      char v45 = swift_isUniquelyReferenced_nonNull_native();
      unsigned int v46 = off_10004B590;
      uint64_t v154 = off_10004B590;
      off_10004B590 = (_UNKNOWN *)0x8000000000000000;
      if ((v45 & 1) == 0)
      {
        sub_10001AFDC();
        unsigned int v46 = v154;
      }
      swift_bridgeObjectRelease();
      uint64_t v47 = *(void **)(v46[7] + 8 * v42);
      sub_10000865C(v42, (uint64_t)v46);
      off_10004B590 = v46;

      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    char v21 = v149;
    goto LABEL_28;
  }

  double v14 = v135;
LABEL_95:
}

uint64_t sub_100034854(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  id v3 = *(id *)(a1 + 8);
  id v4 = v2;
  return a1;
}

uint64_t sub_100034884(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);

  return a1;
}

double sub_1000348B4(double a1)
{
  return ceil(a1);
}

void sub_1000348CC()
{
  *(_WORD *)&algn_10004D178[6] = -4864;
}

uint64_t getEnumTagSinglePayload for RhizomeColorway(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RhizomeColorway(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x100034A58);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeColorway()
{
  return &type metadata for RhizomeColorway;
}

unint64_t sub_100034A94()
{
  unint64_t result = qword_10004B640;
  if (!qword_10004B640)
  {
    sub_100002F64(&qword_10004B648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B640);
  }
  return result;
}

uint64_t sub_100034AF0(char a1)
{
  return *(void *)&aUnity_4[8 * a1];
}

uint64_t sub_100034B10(char *a1, char *a2)
{
  return sub_10000391C(*a1, *a2);
}

Swift::Int sub_100034B1C()
{
  return sub_100003CC8();
}

uint64_t sub_100034B24()
{
  return sub_100003EB0();
}

Swift::Int sub_100034B2C()
{
  return sub_100003FC8();
}

uint64_t sub_100034B34@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100034E70(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_100034B64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100034AF0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100034B90(void *a1@<X8>)
{
  *a1 = &off_100045830;
}

unint64_t sub_100034BA4()
{
  unint64_t result = qword_10004B650;
  if (!qword_10004B650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B650);
  }
  return result;
}

uint64_t sub_100034BF8(uint64_t a1, uint64_t a2)
{
  sub_100017624(0, 5, 0);
  unint64_t v5 = _swiftEmptyArrayStorage[2];
  unint64_t v4 = _swiftEmptyArrayStorage[3];
  unint64_t v6 = v5 + 1;
  if (v5 >= v4 >> 1) {
    sub_100017624(v4 > 1, v5 + 1, 1);
  }
  _swiftEmptyArrayStorage[2] = v6;
  BOOL v7 = &_swiftEmptyArrayStorage[2 * v5];
  v7[4] = *(void *)"Unity";
  v7[5] = 0xE500000000000000;
  unint64_t v8 = _swiftEmptyArrayStorage[3];
  unint64_t v9 = v5 + 2;
  if (v6 >= v8 >> 1) {
    sub_100017624(v8 > 1, v5 + 2, 1);
  }
  _swiftEmptyArrayStorage[2] = v9;
  double v10 = &_swiftEmptyArrayStorage[2 * v6];
  v10[4] = *(void *)"Red";
  v10[5] = 0xE300000000000000;
  unint64_t v11 = _swiftEmptyArrayStorage[3];
  unint64_t v12 = v5 + 3;
  if (v9 >= v11 >> 1) {
    sub_100017624(v11 > 1, v5 + 3, 1);
  }
  _swiftEmptyArrayStorage[2] = v12;
  uint64_t v13 = &_swiftEmptyArrayStorage[2 * v9];
  v13[4] = *(void *)"Green";
  v13[5] = 0xE500000000000000;
  unint64_t v14 = _swiftEmptyArrayStorage[3];
  unint64_t v15 = v5 + 4;
  if (v12 >= v14 >> 1) {
    sub_100017624(v14 > 1, v5 + 4, 1);
  }
  _swiftEmptyArrayStorage[2] = v15;
  __int16 v16 = &_swiftEmptyArrayStorage[2 * v12];
  v16[4] = *(void *)"MulticolBlack";
  v16[5] = 0xEA0000000000726FLL;
  unint64_t v17 = _swiftEmptyArrayStorage[3];
  if (v15 >= v17 >> 1) {
    sub_100017624(v17 > 1, v5 + 5, 1);
  }
  _swiftEmptyArrayStorage[2] = v5 + 5;
  id v18 = &_swiftEmptyArrayStorage[2 * v15];
  v18[4] = *(void *)"Black";
  v18[5] = 0xE500000000000000;
  uint64_t v19 = sub_10001E5E0((uint64_t)_swiftEmptyArrayStorage);
  swift_release();
  char v20 = sub_1000150C0(a1, a2, v19);
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0) {
    return 0x7974696E55;
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100034E70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_100034BF8(a1, a2);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = 0;
  if (v2 == *(void *)"Unity" && v4 == 0xE500000000000000) {
    goto LABEL_14;
  }
  char v7 = sub_10003AC40();
  swift_bridgeObjectRelease();
  if (v7) {
    goto LABEL_15;
  }
  uint64_t v5 = 1;
  if (v2 == *(void *)"Red" && v4 == 0xE300000000000000) {
    goto LABEL_14;
  }
  char v9 = sub_10003AC40();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_15;
  }
  uint64_t v5 = 2;
  if (v2 == *(void *)"Green" && v4 == 0xE500000000000000) {
    goto LABEL_14;
  }
  char v11 = sub_10003AC40();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_15;
  }
  uint64_t v5 = 3;
  if (v2 == *(void *)"MulticolBlack" && v4 == 0xEA0000000000726FLL) {
    goto LABEL_14;
  }
  char v12 = sub_10003AC40();
  swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_15;
  }
  uint64_t v5 = 4;
  if (v2 == *(void *)"Black" && v4 == 0xE500000000000000)
  {
LABEL_14:
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_10003AC40();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return v5;
}

id sub_10003506C(char a1)
{
  switch(a1)
  {
    case 1:
    case 6:
    case 16:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.439215686;
      double v4 = 0.105882353;
      double v5 = 0.149019608;
      goto LABEL_15;
    case 2:
    case 7:
    case 18:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.117647059;
      double v4 = 0.564705882;
      uint64_t v6 = 0x3FD5555555555555;
      goto LABEL_14;
    case 3:
    case 8:
    case 20:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.164705882;
      double v4 = 0.270588235;
      double v5 = 0.192156863;
      goto LABEL_15;
    case 4:
    case 9:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v4 = 0.670588235;
      double v5 = 0.0274509804;
      double v3 = 1.0;
      goto LABEL_15;
    case 10:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.725490196;
      double v4 = 0.321568627;
      double v5 = 0.0;
      goto LABEL_15;
    case 11:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.643137255;
      double v4 = 0.37254902;
      double v5 = 0.796078431;
      goto LABEL_15;
    case 12:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.364705882;
      double v4 = 0.168627451;
      double v5 = 0.478431373;
      goto LABEL_15;
    case 13:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.956862745;
      double v4 = 0.31372549;
      double v5 = 0.349019608;
      goto LABEL_15;
    case 15:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.658823529;
      double v5 = 0.031372549;
      double v4 = 0.0;
      goto LABEL_15;
    case 17:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.388235294;
      double v4 = 0.674509804;
      double v5 = 0.525490196;
      goto LABEL_15;
    case 19:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.203921569;
      double v4 = 0.454901961;
      uint64_t v6 = 0x3FD1111111111111;
LABEL_14:
      double v5 = *(double *)&v6;
      goto LABEL_15;
    case 21:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.51372549;
      goto LABEL_23;
    case 22:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.407843137;
      goto LABEL_23;
    case 23:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.325490196;
      goto LABEL_23;
    case 24:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.2;
LABEL_23:
      double v7 = 1.0;
      double v4 = v3;
      double v5 = v3;
      goto LABEL_16;
    case 25:
      id v9 = [self blackColor];
      return v9;
    case 26:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithWhite:alpha:";
      double v3 = 0.00392156863;
      double v4 = 1.0;
      return objc_msgSend(v1, v2, v3, v4, v5, v7);
    default:
      id v1 = objc_allocWithZone((Class)UIColor);
      uint64_t v2 = "initWithRed:green:blue:alpha:";
      double v3 = 0.917647059;
      double v4 = 0.00392156863;
      double v5 = 0.0509803922;
LABEL_15:
      double v7 = 1.0;
LABEL_16:
      return objc_msgSend(v1, v2, v3, v4, v5, v7);
  }
}

uint64_t sub_10003546C(char a1)
{
  return *(void *)&aUnity1_0[8 * a1];
}

unint64_t sub_10003548C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10003571C(*a1);
  *a2 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for RhizomeColor(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE6) {
    goto LABEL_17;
  }
  if (a2 + 26 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 26) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 26;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1B;
  int v8 = v6 - 27;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RhizomeColor(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 26 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 26) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE5)
  {
    unsigned int v6 = ((a2 - 230) >> 8) + 1;
    *unint64_t result = a2 + 26;
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
        JUMPOUT(0x100035614);
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
          *unint64_t result = a2 + 26;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeColor()
{
  return &type metadata for RhizomeColor;
}

void sub_10003564C(void *a1@<X8>)
{
  *a1 = &off_100045858;
}

uint64_t sub_10003565C()
{
  return sub_10003546C(*v0);
}

unint64_t sub_100035668()
{
  unint64_t result = qword_10004B658;
  if (!qword_10004B658)
  {
    sub_100002F64(&qword_10004B660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B658);
  }
  return result;
}

unint64_t sub_1000356C8()
{
  unint64_t result = qword_10004B668;
  if (!qword_10004B668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B668);
  }
  return result;
}

unint64_t sub_10003571C(unint64_t result)
{
  if (result >= 0x1B) {
    return 27;
  }
  return result;
}

void sub_10003572C()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  double v2 = 500.0;
  if (v1 == (id)1) {
    double v2 = 800.0;
  }
  qword_10004D180 = *(void *)&v2;
}

uint64_t sub_1000357A4()
{
  id v1 = *(void **)(v0 + 72);
  double v2 = *(void **)(v0 + 80);

  swift_unknownObjectWeakDestroy();
  return _swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for RhizomeLayoutSpec()
{
  return self;
}

void sub_100035824()
{
  id v1 = v0;
  if ((v0[7] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v2 = v0[7];
  }
  else {
    Swift::UInt64 v2 = 0;
  }
  sub_10003ACC0(v2);
  if ((v0[8] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = v0[8];
  }
  else {
    Swift::UInt64 v3 = 0;
  }
  sub_10003ACC0(v3);
  if ((v0[17] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = v0[17];
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_10003ACC0(v4);
  if ((v0[18] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v5 = v0[18];
  }
  else {
    Swift::UInt64 v5 = 0;
  }
  sub_10003ACC0(v5);
  unsigned int v6 = (void *)v0[10];
  BOOL v7 = (void *)v1[11];
  id v8 = (id)v1[9];
  id v9 = v6;
  id v10 = v7;
  sub_10003A910();
  id v11 = v9;
  sub_10003A910();

  id v12 = v10;
  sub_10003A910();

  sub_10003ACA0(*((unsigned __int8 *)v1 + 96));
  sub_10003ACB0(*((unsigned char *)v1 + 128));
  sub_10003ACB0(*((unsigned char *)v1 + 129));
  if ((v1[13] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v13 = v1[13];
  }
  else {
    Swift::UInt64 v13 = 0;
  }
  sub_10003ACC0(v13);
  if ((v1[14] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v14 = v1[14];
  }
  else {
    Swift::UInt64 v14 = 0;
  }
  sub_10003ACC0(v14);
}

Swift::Int sub_10003593C()
{
  return sub_10003ACD0();
}

void sub_100035980()
{
}

Swift::Int sub_1000359A4()
{
  return sub_10003ACD0();
}

BOOL sub_1000359E4(uint64_t *a1, uint64_t *a2)
{
  return sub_100035CE8(*a1, *a2);
}

uint64_t sub_1000359F0()
{
  sub_10003AA60(126);
  v4._object = (void *)0x800000010003E140;
  v4._uint64_t countAndFlagsBits = 0xD000000000000012;
  sub_10003A740(v4);
  v5._uint64_t countAndFlagsBits = sub_10003AC20();
  sub_10003A740(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0x697469736F707B3ELL;
  v6._object = (void *)0xEE0028203D206E6FLL;
  sub_10003A740(v6);
  v7._uint64_t countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 44;
  v8._object = (void *)0xE100000000000000;
  sub_10003A740(v8);
  v9._uint64_t countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v9);
  swift_bridgeObjectRelease();
  v10._object = (void *)0x800000010003E160;
  v10._uint64_t countAndFlagsBits = 0xD000000000000012;
  sub_10003A740(v10);
  v11._uint64_t countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v11);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = 0x746867696568202CLL;
  v12._object = (void *)0xEA0000000000203ALL;
  sub_10003A740(v12);
  v13._uint64_t countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v13);
  swift_bridgeObjectRelease();
  v14._uint64_t countAndFlagsBits = 0x6974616F6C66202CLL;
  v14._object = (void *)0xEC000000203A676ELL;
  sub_10003A740(v14);
  if (*(unsigned char *)(v0 + 128)) {
    v1._uint64_t countAndFlagsBits = 7562617;
  }
  else {
    v1._uint64_t countAndFlagsBits = 28526;
  }
  if (*(unsigned char *)(v0 + 128)) {
    Swift::UInt64 v2 = (void *)0xE300000000000000;
  }
  else {
    Swift::UInt64 v2 = (void *)0xE200000000000000;
  }
  v1._object = v2;
  sub_10003A740(v1);
  swift_bridgeObjectRelease();
  v15._uint64_t countAndFlagsBits = 0xD000000000000015;
  v15._object = (void *)0x800000010003E180;
  sub_10003A740(v15);
  v16._uint64_t countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v16);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 0x20746E696F70202CLL;
  v17._object = (void *)0xEF203D20657A6973;
  sub_10003A740(v17);
  v18._uint64_t countAndFlagsBits = sub_10003A7F0();
  sub_10003A740(v18);
  swift_bridgeObjectRelease();
  v19._uint64_t countAndFlagsBits = 125;
  v19._object = (void *)0xE100000000000000;
  sub_10003A740(v19);
  return 0;
}

uint64_t sub_100035C6C()
{
  return sub_1000359F0();
}

unint64_t sub_100035C94()
{
  unint64_t result = qword_10004B7F0;
  if (!qword_10004B7F0)
  {
    type metadata accessor for RhizomeLayoutSpec();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004B7F0);
  }
  return result;
}

BOOL sub_100035CE8(uint64_t a1, uint64_t a2)
{
  BOOL result = CGSizeEqualToSize(*(CGSize *)(a1 + 56), *(CGSize *)(a2 + 56));
  if (result)
  {
    BOOL result = CGPointEqualToPoint(*(CGPoint *)(a1 + 136), *(CGPoint *)(a2 + 136));
    if (result)
    {
      Swift::String v5 = *(void **)(a1 + 72);
      Swift::String v6 = *(void **)(a1 + 80);
      Swift::String v7 = *(void **)(a1 + 88);
      Swift::String v9 = *(void **)(a2 + 72);
      Swift::String v8 = *(void **)(a2 + 80);
      Swift::String v10 = *(void **)(a2 + 88);
      sub_100012298();
      id v11 = v5;
      id v12 = v6;
      id v13 = v7;
      id v14 = v9;
      id v15 = v8;
      id v16 = v10;
      if (sub_10003A900() & 1) != 0 && (sub_10003A900())
      {
        char v17 = sub_10003A900();

        if (v17) {
          return *(unsigned __int8 *)(a1 + 96) == *(unsigned __int8 *)(a2 + 96);
        }
      }
      else
      {
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_100035E14(uint64_t a1, uint64_t a2, uint64_t a3, char a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, char a13, char a14)
{
  *(void *)(v14 + 48) = 0;
  *(_OWORD *)(v14 + 16) = 0u;
  *(_OWORD *)(v14 + 32) = 0u;
  swift_unknownObjectWeakInit();
  *(double *)(v14 + 56) = a5;
  *(double *)(v14 + 64) = a6;
  *(double *)(v14 + 136) = a7;
  *(double *)(v14 + 144) = a8;
  *(void *)(v14 + 72) = a1;
  *(void *)(v14 + 80) = a2;
  *(void *)(v14 + 88) = a3;
  *(double *)(v14 + 104) = a9;
  swift_unknownObjectWeakAssign();
  *(unsigned char *)(v14 + 96) = a4;
  *(void *)(v14 + 120) = a12;
  *(unsigned char *)(v14 + 128) = a13;
  *(unsigned char *)(v14 + 129) = a14;
  *(double *)(v14 + 112) = a10;
  *(double *)(v14 + 16) = a5 * a6;
  v26.f64[0] = a5;
  v26.f64[1] = a6;
  __asm { FMOV            V1.2D, #-0.5 }
  *(float64x2_t *)(v14 + 24) = vaddq_f64(*(float64x2_t *)(v14 + 136), vmulq_f64(v26, _Q1));
  *(double *)(v14 + 40) = a5;
  *(double *)(v14 + 48) = a6;
  return v14;
}

unint64_t sub_100035F24(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    Swift::UInt64 v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000316C(&qword_10004BA80);
  Swift::UInt64 v2 = (void *)sub_10003ABD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  Swift::String v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_1000181A4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    Swift::String v10 = (uint64_t *)(v2[6] + 16 * result);
    *Swift::String v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_100036040(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000316C(&qword_10004B238);
  uint64_t v2 = sub_10003ABD0();
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
    sub_100037EEC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000181A4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000F64C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_10003616C()
{
  sub_10000316C(&qword_10004BA78);
  initeCGFloat d = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10003CCC0;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x800000010003E320;
  *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 56) = 0xD000000000000015;
  *(void *)(inited + 64) = 0x800000010003E340;
  *(void *)(inited + 72) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 80) = 0x726F66736E617274;
  *(void *)(inited + 88) = 0xE90000000000006DLL;
  *(void *)(inited + 96) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 104) = 0x6E6564646968;
  *(void *)(inited + 112) = 0xE600000000000000;
  *(void *)(inited + 120) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 128) = 0x6E6F697469736F70;
  *(void *)(inited + 136) = 0xE800000000000000;
  *(void *)(inited + 144) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 152) = 0x7974696361706FLL;
  *(void *)(inited + 160) = 0xE700000000000000;
  *(void *)(inited + 168) = [objc_allocWithZone((Class)NSNull) init];
  strcpy((char *)(inited + 176), "instanceCount");
  *(_WORD *)(inited + 190) = -4864;
  *(void *)(inited + 192) = [objc_allocWithZone((Class)NSNull) init];
  strcpy((char *)(inited + 200), "instanceDelay");
  *(_WORD *)(inited + 214) = -4864;
  *(void *)(inited + 216) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 224) = 0x756F72676B636162;
  *(void *)(inited + 232) = 0xEF726F6C6F43646ELL;
  *(void *)(inited + 240) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 248) = 1752457584;
  *(void *)(inited + 256) = 0xE400000000000000;
  *(void *)(inited + 264) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 272) = 0x73746E65746E6F63;
  *(void *)(inited + 280) = 0xE800000000000000;
  *(void *)(inited + 288) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 296) = 0x726579616C627573;
  *(void *)(inited + 304) = 0xE900000000000073;
  *(void *)(inited + 312) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 320) = 0x676E69727473;
  *(void *)(inited + 328) = 0xE600000000000000;
  *(void *)(inited + 336) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 344) = 0x6F6C6F436C6C6966;
  *(void *)(inited + 352) = 0xE900000000000072;
  *(void *)(inited + 360) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 368) = 0x6F43656B6F727473;
  *(void *)(inited + 376) = 0xEB00000000726F6CLL;
  *(void *)(inited + 384) = [objc_allocWithZone((Class)NSNull) init];
  *(void *)(inited + 392) = 0x74646957656E696CLL;
  *(void *)(inited + 400) = 0xE900000000000068;
  *(void *)(inited + 408) = [objc_allocWithZone((Class)NSNull) init];
  unint64_t result = sub_100035F24(inited);
  qword_10004B7F8 = result;
  return result;
}

id sub_1000364B4()
{
  Swift::String v1 = *(void **)(v0 + 80);
  if (v1) {
    [v1 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  uint64_t v2 = *(void **)(v0 + 88);
  if (v2) {
    [v2 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  uint64_t v3 = *(void **)(v0 + 96);
  if (v3) {
    [v3 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  uint64_t v4 = *(void **)(v0 + 104);
  if (v4) {
    [v4 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  uint64_t v5 = *(void **)(v0 + 112);
  if (v5) {
    [v5 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  uint64_t v6 = *(void **)(v0 + 56);
  if (v6) {
    [v6 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  uint64_t v7 = *(void **)(v0 + 64);
  if (v7) {
    [v7 setHidden:*(unsigned __int8 *)(v0 + 152)];
  }
  id result = *(id *)(v0 + 72);
  if (result)
  {
    uint64_t v9 = *(unsigned __int8 *)(v0 + 152);
    return [result setHidden:v9];
  }
  return result;
}

id sub_10003658C(double a1)
{
  uint64_t v2 = *(void **)(v1 + 80);
  if (v2) {
    [v2 setAlpha:*(float *)(v1 + 156)];
  }
  uint64_t v3 = *(void **)(v1 + 88);
  if (v3) {
    [v3 setAlpha:*(float *)(v1 + 156)];
  }
  uint64_t v4 = *(void **)(v1 + 96);
  if (v4) {
    [v4 setAlpha:*(float *)(v1 + 156)];
  }
  uint64_t v5 = *(void **)(v1 + 104);
  if (v5) {
    [v5 setAlpha:*(float *)(v1 + 156)];
  }
  uint64_t v6 = *(void **)(v1 + 112);
  if (v6) {
    [v6 setAlpha:*(float *)(v1 + 156)];
  }
  uint64_t v7 = *(void **)(v1 + 56);
  if (v7)
  {
    LODWORD(a1) = *(_DWORD *)(v1 + 156);
    [v7 setOpacity:a1];
  }
  uint64_t v8 = *(void **)(v1 + 64);
  if (v8)
  {
    LODWORD(a1) = *(_DWORD *)(v1 + 156);
    [v8 setOpacity:a1];
  }
  id result = *(id *)(v1 + 72);
  if (result)
  {
    LODWORD(a1) = *(_DWORD *)(v1 + 156);
    return [result setOpacity:a1];
  }
  return result;
}

uint64_t sub_10003667C(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 128);
  *(void *)(a2 + 128) = a1;
  id v3 = a1;

  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100010B80();
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000366E0()
{
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0;
    unint64_t v3 = sub_100018114(0);
    if (v4)
    {
      uint64_t v5 = (long long *)(*(void *)(v1 + 56) + 48 * v3);
      long long v6 = *v5;
      long long v7 = v5[2];
      long long v39 = v5[1];
      long long v40 = v7;
      long long v38 = v6;
      if (*(void *)(v1 + 16))
      {
        sub_100034854((uint64_t)&v38);
        unint64_t v8 = sub_100018114(2);
        if (v9)
        {
          char v10 = (long long *)(*(void *)(v1 + 56) + 48 * v8);
          long long v12 = v10[1];
          long long v11 = v10[2];
          long long v35 = *v10;
          long long v36 = v12;
          long long v37 = v11;
          id v13 = objc_allocWithZone((Class)CAShapeLayer);
          sub_100034854((uint64_t)&v35);
          id v14 = [v13 init];
          uint64_t v15 = (void *)v2[7];
          v2[7] = v14;

          uint64_t v16 = (void *)v2[7];
          if (v16)
          {
            long long v17 = (void *)v39;
            id v18 = v16;
            sub_1000368DC((uint64_t)&v38, v17);
          }
          id v19 = [objc_allocWithZone((Class)CAShapeLayer) init];
          char v20 = (void *)v2[9];
          v2[9] = v19;

          char v21 = (void *)v2[9];
          if (v21)
          {
            CGRect v22 = (void *)v39;
            id v23 = v21;
            sub_1000368DC((uint64_t)&v35, v22);
          }
          if (*(void *)(v1 + 16) && (unint64_t v24 = sub_100018114(1), (v25 & 1) != 0))
          {
            float64x2_t v26 = (long long *)(*(void *)(v1 + 56) + 48 * v24);
            long long v28 = v26[1];
            long long v27 = v26[2];
            long long v32 = *v26;
            long long v33 = v28;
            long long v34 = v27;
            id v29 = objc_allocWithZone((Class)CAShapeLayer);
            sub_100034854((uint64_t)&v32);
            id v30 = objc_msgSend(v29, "init", v32, v33, v34, v35, v36, v37, v38);
            sub_1000368DC((uint64_t)&v32, (void *)v39);
            sub_100034884((uint64_t)&v32);
            sub_100034884((uint64_t)&v35);
            sub_100034884((uint64_t)&v38);
            uint64_t v31 = (void *)v2[8];
            v2[8] = v30;
          }
          else
          {
            sub_100034884((uint64_t)&v35);
            sub_100034884((uint64_t)&v38);
            uint64_t v31 = (void *)v2[8];
            v2[8] = 0;
          }
        }
        else
        {
          sub_100034884((uint64_t)&v38);
        }
      }
    }
  }
}

id sub_1000368DC(uint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  double v6 = 0.0;
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  id v7 = [*(id *)(a1 + 8) CGPath];
  [v3 setPath:v7];

  [v3 setLineJoin:kCALineJoinRound];
  if (*(unsigned char *)(a1 + 1))
  {
    uint64_t v8 = self;
    id v9 = [(id)v8 blackColor];
    id v10 = [v9 CGColor];

    [v3 setFillColor:v10];
    sub_100037B74();
    id v11 = *(id *)(a1 + 16);
    id v12 = [(id)v8 blackColor];
    LOBYTE(v8) = sub_10003A900();

    if (v8) {
      id v13 = a2;
    }
    else {
      id v13 = v11;
    }
    id v14 = [v13 CGColor];
    [v3 setStrokeColor:v14];

    double v6 = *(double *)(a1 + 24);
  }
  else
  {
    id v15 = [*(id *)(a1 + 16) CGColor];
    [v3 setFillColor:v15];

    [v3 setStrokeColor:0];
  }
  return [v3 setLineWidth:v6];
}

void sub_100036AE8(void *a1, double a2)
{
  unint64_t v3 = v2;
  id v5 = [a1 layer];
  uint64_t v6 = v2[2];
  if (*(void *)(v6 + 16))
  {
    id v152 = v5;
    unint64_t v7 = sub_100018114(0);
    if (v8)
    {
      id v9 = (long long *)(*(void *)(v6 + 56) + 48 * v7);
      long long v10 = *v9;
      long long v11 = v9[2];
      *(_OWORD *)unint64_t v157 = v9[1];
      *(_OWORD *)&v157[16] = v11;
      long long v156 = v10;
      if (*(void *)(v6 + 16))
      {
        sub_100034854((uint64_t)&v156);
        unint64_t v12 = sub_100018114(2);
        if ((v13 & 1) == 0)
        {
LABEL_64:
          sub_100034884((uint64_t)&v156);

          return;
        }
        id v14 = (void *)v2[14];
        if (!v14 || (id v15 = (void *)v2[12]) == 0)
        {

          sub_100034884((uint64_t)&v156);
          return;
        }
        uint64_t v16 = *(void *)(v6 + 56) + 48 * v12;
        char v17 = *(unsigned char *)v16;
        char v146 = *(unsigned char *)(v16 + 1);
        char v148 = *(unsigned char *)(v16 + 2);
        id v18 = *(void **)(v16 + 16);
        uint64_t v20 = *(void *)(v16 + 24);
        uint64_t v19 = *(void *)(v16 + 32);
        uint64_t v21 = *(void *)(v16 + 40);
        char v22 = *((unsigned char *)v3 + 24);
        uint64_t v23 = *(void *)(v6 + 16);
        id v24 = *(id *)(v16 + 8);
        id v150 = v18;
        id v25 = v14;
        id v26 = v15;
        if (v23)
        {
          sub_100018114(1);
          if (v27)
          {
            id v28 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
            id v29 = (void *)v3[13];
            v3[13] = v28;
          }
        }
        if (v22)
        {
          if ((v3[15] & 1) == 0)
          {
            NSString v30 = sub_10003A6E0();
            int v31 = MGGetBoolAnswer();

            if (v31)
            {
              id v143 = v26;
              id v32 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
              long long v33 = (void *)v3[10];
              v3[10] = v32;

              char v34 = v156;
              long long v35 = (void *)*((void *)&v156 + 1);
              long long v36 = self;
              id v37 = v35;
              id v38 = [v36 blackColor];
              char v164 = v34;
              __int16 v165 = 0;
              id v140 = v38;
              uint64_t v141 = v37;
              id v166 = v37;
              id v167 = v38;
              long long v168 = *(_OWORD *)&v157[8];
              uint64_t v169 = *(void *)&v157[24];
              long long v39 = sub_1000331C8((uint64_t)&v164, a2);
              long long v40 = v39;
              char v41 = (void *)v3[10];
              id v133 = v25;
              if (v41 && v39)
              {
                id v42 = v39;
                id v43 = v41;
                [v43 setImage:v42];
                id v44 = [v36 blackColor];
                [v43 setTintColor:v44];

                [v43 sizeToFit];
                id v45 = v43;
                [v45 center];
                double v47 = v46 + -40.0;
                [v45 center];
                objc_msgSend(v45, "setCenter:", v47, v48 + -40.0);

                id v49 = [v45 layer];
                id v50 = [v143 layer];
                [v152 insertSublayer:v49 below:v50];
              }
              id v51 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
              char v52 = (void *)v3[11];
              v3[11] = v51;

              double v142 = v40;
              if (*(void *)(v6 + 16))
              {
                sub_100018114(1);
                if (v53) {
                  char v54 = 1;
                }
                else {
                  char v54 = 2;
                }
              }
              else
              {
                char v54 = 2;
              }
              id v57 = v24;
              id v58 = [v36 blackColor];
              v158[0] = v17;
              v158[1] = 0;
              v158[2] = v54;
              id v159 = v57;
              id v160 = v58;
              uint64_t v161 = v20;
              uint64_t v162 = v19;
              uint64_t v163 = v21;
              uint64_t v59 = sub_1000331C8((uint64_t)v158, a2);
              char v60 = v59;
              char v61 = (void *)v3[11];
              if (v61)
              {
                if (v59)
                {
                  id v137 = v59;
                  id v62 = v61;
                  [v62 setImage:v137];
                  id v63 = [v36 blackColor];
                  [v62 setTintColor:v63];

                  [v62 sizeToFit];
                  id v64 = v62;
                  [v64 center];
                  double v66 = v65 + -40.0;
                  [v64 center];
                  objc_msgSend(v64, "setCenter:", v66, v67 + -40.0);

                  id v68 = [v64 layer];
                  id v69 = [v143 layer];
                  [v152 insertSublayer:v68 above:v69];

                  id v26 = v143;
LABEL_35:
                  id v25 = v133;
                  goto LABEL_36;
                }
              }
              else
              {
              }
              id v26 = v143;
              goto LABEL_35;
            }
          }
        }
        else if ((BYTE1(v156) & 1) == 0)
        {
          type metadata accessor for RhizomeFlowerLayerImageCache();
          long long v55 = sub_10003249C(&v156, *((unsigned __int8 *)v3 + 48), 0, 0, a2);
          uint64_t v56 = (void *)v3[16];
          v3[16] = v55;

          if (swift_unknownObjectWeakLoadStrong())
          {
            sub_100010B80();
            swift_unknownObjectRelease();
          }
        }
LABEL_36:
        if (*(void *)(v6 + 16) && (unint64_t v70 = sub_100018114(1), (v71 & 1) != 0))
        {
          id v134 = v25;
          uint64_t v72 = (unsigned __int8 *)(*(void *)(v6 + 56) + 48 * v70);
          uint64_t v73 = *v72;
          int v74 = v72[1];
          uint64_t v75 = v72[2];
          id v76 = v24;
          id v78 = (void *)*((void *)v72 + 1);
          id v77 = (void *)*((void *)v72 + 2);
          uint64_t v79 = *((void *)v72 + 3);
          uint64_t v80 = *((void *)v72 + 4);
          uint64_t v81 = *((void *)v72 + 5);
          sub_10000316C(&qword_10004BA88);
          uint64_t v82 = swift_allocObject();
          long long v83 = v156;
          long long v84 = *(_OWORD *)v157;
          *(_OWORD *)(v82 + 16) = xmmword_10003CCD0;
          *(_OWORD *)(v82 + 32) = v83;
          long long v85 = *(_OWORD *)&v157[16];
          *(_OWORD *)(v82 + 48) = v84;
          *(_OWORD *)(v82 + 64) = v85;
          uint64_t v138 = v73;
          *(unsigned char *)(v82 + 80) = v73;
          *(unsigned char *)(v82 + 81) = v74;
          *(unsigned char *)(v82 + 82) = v75;
          *(void *)(v82 + 88) = v78;
          *(void *)(v82 + 96) = v77;
          *(void *)(v82 + 104) = v79;
          *(void *)(v82 + 112) = v80;
          *(void *)(v82 + 120) = v81;
          *(unsigned char *)(v82 + 128) = v17;
          *(unsigned char *)(v82 + 129) = v146;
          *(unsigned char *)(v82 + 130) = v148;
          char v86 = v76;
          *(void *)(v82 + 136) = v76;
          *(void *)(v82 + 144) = v150;
          *(void *)(v82 + 152) = v20;
          *(void *)(v82 + 160) = v19;
          *(void *)(v82 + 168) = v21;
          sub_10000316C(&qword_10004B240);
          uint64_t v87 = swift_allocObject();
          *(_OWORD *)(v87 + 16) = xmmword_10003CCE0;
          id v144 = v26;
          *(void *)(v87 + 32) = v26;
          char v88 = (void *)v3[13];
          if (!v88)
          {
LABEL_66:
            __break(1u);
            return;
          }
          uint64_t v89 = 256;
          if (!v74) {
            uint64_t v89 = 0;
          }
          uint64_t v139 = v89 | v138 | (v75 << 16);
          id v25 = v134;
          *(void *)(v87 + 40) = v88;
          *(void *)(v87 + 48) = v134;
          *(void *)&long long v153 = v87;
          sub_10003A7B0();
          uint64_t v90 = v153;
          id v147 = v78;
          id v91 = v78;
          id v92 = v77;
          id v93 = v91;
          id v94 = v92;
          id v95 = v88;
          unint64_t v96 = 3;
          uint64_t v97 = v150;
          id v26 = v144;
        }
        else
        {
          sub_10000316C(&qword_10004BA88);
          uint64_t v82 = swift_allocObject();
          long long v98 = v156;
          long long v99 = *(_OWORD *)v157;
          *(_OWORD *)(v82 + 16) = xmmword_10003B800;
          *(_OWORD *)(v82 + 32) = v98;
          long long v100 = *(_OWORD *)&v157[16];
          *(_OWORD *)(v82 + 48) = v99;
          *(_OWORD *)(v82 + 64) = v100;
          *(unsigned char *)(v82 + 80) = v17;
          *(unsigned char *)(v82 + 81) = v146;
          *(unsigned char *)(v82 + 82) = v148;
          char v86 = v24;
          uint64_t v97 = v150;
          *(void *)(v82 + 88) = v24;
          *(void *)(v82 + 96) = v150;
          *(void *)(v82 + 104) = v20;
          *(void *)(v82 + 112) = v19;
          *(void *)(v82 + 120) = v21;
          sub_10000316C(&qword_10004B240);
          uint64_t v101 = swift_allocObject();
          *(_OWORD *)(v101 + 16) = xmmword_10003CCF0;
          *(void *)(v101 + 32) = v26;
          *(void *)(v101 + 40) = v25;
          *(void *)&long long v153 = v101;
          sub_10003A7B0();
          uint64_t v139 = 0;
          id v147 = 0;
          id v77 = 0;
          uint64_t v90 = v153;
          unint64_t v96 = 2;
        }
        id v145 = v77;
        unint64_t v151 = v90 & 0xC000000000000001;
        if ((v90 & 0xC000000000000001) != 0 || v96 <= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          sub_100034854((uint64_t)&v156);
          id v136 = v86;
          id v132 = v97;
          id v135 = v25;
          id v131 = v26;
          uint64_t v102 = 0;
          uint64_t v103 = 32;
          unint64_t v104 = v90 & 0xC000000000000001;
          uint64_t v149 = v82;
          do
          {
            long long v105 = *(_OWORD *)(v82 + v103 + 16);
            long long v153 = *(_OWORD *)(v82 + v103);
            long long v154 = v105;
            long long v155 = *(_OWORD *)(v82 + v103 + 32);
            if (v104)
            {
              sub_100034854((uint64_t)&v153);
              id v106 = (id)sub_10003AA90();
            }
            else
            {
              char v107 = *(void **)(v90 + 8 * v102 + 32);
              sub_100034854((uint64_t)&v153);
              id v106 = v107;
            }
            char v108 = v106;
            int v109 = BYTE1(v153);
            if (BYTE1(v153) == 1)
            {
              if (qword_10004AD18 != -1) {
                swift_once();
              }
              double v110 = (uint64_t *)&off_10004B5A0;
            }
            else
            {
              if (qword_10004AD10 != -1) {
                swift_once();
              }
              double v110 = (uint64_t *)&off_10004B598;
            }
            swift_beginAccess();
            uint64_t v111 = *v110;
            swift_bridgeObjectRetain();
            sub_100032ED8(a2);
            if (*(void *)(v111 + 16) && (unint64_t v114 = sub_1000181A4(v112, v113), (v115 & 1) != 0))
            {
              unint64_t v116 = (void *)v154;
              unint64_t v117 = v96;
              uint64_t v118 = v90;
              id v119 = *(id *)(*(void *)(v111 + 56) + 8 * v114);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_100037B74();
              char v120 = self;
              id v121 = v116;
              id v122 = [v120 blackColor];
              int v123 = sub_10003A900();

              unint64_t v124 = *(void **)v157;
              if ((v109 & v123) == 0) {
                unint64_t v124 = v121;
              }
              unint64_t v104 = v151;
              id v125 = v124;
              [v108 setImage:v119];
              [v108 setTintColor:v125];
              [v108 sizeToFit];
              id v126 = v108;
              [v126 center];
              double v128 = v127 + -40.0;
              [v126 center];
              objc_msgSend(v126, "setCenter:", v128, v129 + -40.0);

              id v130 = [v126 layer];
              [v152 addSublayer:v130];

              sub_100034884((uint64_t)&v153);
              uint64_t v90 = v118;
              unint64_t v96 = v117;
              uint64_t v82 = v149;
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              sub_100034884((uint64_t)&v153);
            }
            ++v102;
            v103 += 48;
          }
          while (v96 != v102);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100005648(v139, v147, v145);

          goto LABEL_64;
        }
        __break(1u);
        goto LABEL_66;
      }
    }
    id v5 = v152;
  }
}

void sub_1000376D0(void *a1)
{
  id v19 = [a1 layer];
  [a1 bounds];
  double MidX = CGRectGetMidX(v21);
  [a1 bounds];
  double MidY = CGRectGetMidY(v22);
  if (qword_10004AD38 != -1) {
    swift_once();
  }
  sub_1000379EC(a1);
  id v5 = (void *)v1[7];
  if (v5)
  {
    objc_msgSend(v5, "setPosition:", MidX, MidY);
    uint64_t v6 = (void *)v1[7];
    if (v6)
    {
      id v7 = v6;
      sub_10000316C(&qword_10004BA70);
      Class isa = sub_10003A690().super.isa;
      [v7 setActions:isa];

      if (v1[7]) {
        objc_msgSend(v19, "addSublayer:");
      }
    }
  }
  id v9 = (void *)v1[8];
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v10, "setPosition:", MidX, MidY);
    id v11 = v10;
    sub_10000316C(&qword_10004BA70);
    Class v12 = sub_10003A690().super.isa;
    [v11 setActions:v12];

    [v19 addSublayer:v11];
  }
  char v13 = (void *)v1[9];
  if (v13)
  {
    objc_msgSend(v13, "setPosition:", MidX, MidY);
    id v14 = (void *)v1[9];
    if (v14)
    {
      id v15 = v14;
      sub_10000316C(&qword_10004BA70);
      Class v16 = sub_10003A690().super.isa;
      [v15 setActions:v16];

      char v17 = (void *)v1[9];
      if (v17)
      {
        id v18 = v17;
        [v19 addSublayer:v18];
      }
    }
  }
}

id sub_100037950()
{
  uint64_t v1 = (void *)v0[7];
  if (v1) {
    [v1 removeFromSuperlayer];
  }
  uint64_t v2 = (void *)v0[8];
  if (v2) {
    [v2 removeFromSuperlayer];
  }
  unint64_t v3 = (void *)v0[9];
  if (v3) {
    [v3 removeFromSuperlayer];
  }
  char v4 = (void *)v0[12];
  if (v4) {
    [v4 removeFromSuperview];
  }
  id v5 = (void *)v0[13];
  if (v5) {
    [v5 removeFromSuperview];
  }
  id result = (id)v0[14];
  if (result)
  {
    return [result removeFromSuperview];
  }
  return result;
}

id sub_1000379EC(id result)
{
  if (*(unsigned char *)(v1 + 24) == 1 && *(unsigned char *)(v1 + 120) == 1)
  {
    [result transform];
    CGAffineTransformDecompose(&v4, &transform);
    double v2 = 3.0;
    if (*(unsigned char *)(v1 + 48)) {
      double v2 = 1.5;
    }
    double v3 = v2 / v4.scale.width;
    [*(id *)(v1 + 56) setLineWidth:v2 / v4.scale.width];
    [*(id *)(v1 + 64) setLineWidth:v3];
    return [*(id *)(v1 + 72) setLineWidth:v3];
  }
  return result;
}

id *sub_100037AAC()
{
  swift_bridgeObjectRelease();

  sub_10000EE30((uint64_t)(v0 + 17));
  return v0;
}

uint64_t sub_100037B1C()
{
  sub_100037AAC();
  return _swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for RhizomeLayerSet()
{
  return self;
}

unint64_t sub_100037B74()
{
  unint64_t result = qword_10004B2C0;
  if (!qword_10004B2C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004B2C0);
  }
  return result;
}

uint64_t sub_100037BB4(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = v3;
  *(void *)(v4 + 128) = 0;
  *(void *)(v4 + 144) = 0;
  *(_OWORD *)(v4 + 56) = 0u;
  int v6 = a2 & 1;
  int v7 = a3 & 1;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  swift_unknownObjectWeakInit();
  *(unsigned char *)(v4 + 152) = 0;
  *(_DWORD *)(v4 + 156) = 1065353216;
  *(void *)(v4 + 16) = a1;
  *(unsigned char *)(v4 + 24) = v6;
  *(unsigned char *)(v4 + 48) = v7;
  *(unsigned char *)(v4 + 120) = v7;
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_100018114(0);
    if (v9)
    {
      id v10 = (_OWORD *)(*(void *)(a1 + 56) + 48 * v8);
      long long v12 = v10[1];
      long long v11 = v10[2];
      v24[0] = *v10;
      v24[1] = v12;
      long long v25 = v11;
      sub_100034854((uint64_t)v24);
      swift_bridgeObjectRelease();
      *(_OWORD *)(v4 + 32) = v25;
      if (*(unsigned char *)(v4 + 120))
      {
        sub_1000366E0();
        if (v6)
        {
          sub_100034884((uint64_t)v24);
        }
        else
        {
          type metadata accessor for RhizomeFlowerLayerImageCache();
          if (qword_10004AD30 != -1) {
            swift_once();
          }
          double v13 = *(double *)&qword_10004D180;
          swift_retain();
          id v14 = sub_10003249C(v24, v7, (uint64_t)sub_10003802C, v4, v13);
          sub_100034884((uint64_t)v24);
          swift_release();
        }
      }
      else
      {
        id v20 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        CGRect v21 = *(void **)(v4 + 96);
        *(void *)(v4 + 96) = v20;

        id v22 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        sub_100034884((uint64_t)v24);
        uint64_t v23 = *(void **)(v4 + 112);
        *(void *)(v4 + 112) = v22;
      }
      return v4;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_10004ACA8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10003A5F0();
  sub_10000325C(v15, (uint64_t)qword_10004D0E0);
  Class v16 = sub_10003A5D0();
  os_log_type_t v17 = sub_10003A860();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to create rhizome layer set because the configuration had no background layer config.", v18, 2u);
    swift_slowDealloc();
  }

  swift_bridgeObjectRelease();
  sub_10000EE30(v4 + 136);
  type metadata accessor for RhizomeLayerSet();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_100037EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000316C(&qword_10004BA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100037F54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000316C(&qword_10004BA98);
    uint64_t v3 = (void *)sub_10003ABD0();
    for (uint64_t i = (double *)(a1 + 40); ; i += 2)
    {
      double v5 = *(i - 1);
      char v6 = *(unsigned char *)i;
      unint64_t result = sub_1000182DC(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(double *)(v3[6] + 8 * result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_10003802C(void *a1)
{
  return sub_10003667C(a1, v1);
}

uint64_t sub_100038034()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for RhizomeFontCache()
{
  return self;
}

uint64_t sub_100038090(char a1)
{
  switch(a1)
  {
    case 4:
    case 5:
    case 6:
    case 7:
      v2._uint64_t countAndFlagsBits = 66;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      v2._uint64_t countAndFlagsBits = 67;
      break;
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      v2._uint64_t countAndFlagsBits = *(void *)"M";
      break;
    default:
      v2._uint64_t countAndFlagsBits = 65;
      break;
  }
  v2._object = (void *)0xE100000000000000;
  sub_10003A740(v2);
  swift_bridgeObjectRelease();
  switch(a1)
  {
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      v5._uint64_t countAndFlagsBits = *(void *)"R";
      v5._object = (void *)0xE100000000000000;
      sub_10003A740(v5);
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  switch(a1)
  {
    case 4:
    case 5:
    case 6:
    case 7:
      v3._uint64_t countAndFlagsBits = 80;
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      v3._uint64_t countAndFlagsBits = 76;
      break;
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      v3._uint64_t countAndFlagsBits = *(void *)"G";
      break;
    default:
      v3._uint64_t countAndFlagsBits = 68;
      break;
  }
  v3._object = (void *)0xE100000000000000;
  sub_10003A740(v3);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for RhizomeColorCache()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for RhizomeColorSet(void *a1, uint64_t a2)
{
  Swift::String v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  Swift::String v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

void destroy for RhizomeColorSet(uint64_t a1)
{
  Swift::String v2 = *(void **)(a1 + 16);
}

uint64_t assignWithCopy for RhizomeColorSet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  Swift::String v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  BOOL v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  return a1;
}

__n128 initializeWithTake for RhizomeColorSet(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RhizomeColorSet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  Swift::String v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomeColorSet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RhizomeColorSet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeColorSet()
{
  return &type metadata for RhizomeColorSet;
}

uint64_t sub_1000385B0(char a1, void *a2)
{
  id v3 = a2;
  unint64_t v5 = (unint64_t)sub_1000044BC(0, a1, (char)a2);
  unint64_t v6 = v5;
  if (!(v5 >> 62))
  {
    unint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_3;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_42;
  }
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_10003AB80();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_10003AB80();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_24;
  }
LABEL_3:
  unint64_t v8 = sub_10001D23C(v7);
  if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v8 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v9 = *(id *)(v6 + 8 * v8 + 32);
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_27;
  }
LABEL_24:
  id v9 = (id)sub_10003AA90();
LABEL_7:
  BOOL v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1000044BC(1, a1, (char)v3);
  unint64_t v7 = v10;
  unint64_t v6 = 0;
  unint64_t v2 = (unint64_t)sub_100039BE4((unint64_t)v11);
  swift_bridgeObjectRelease();

  if (!(v2 >> 62))
  {
    unint64_t v12 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_9;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_43;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_10003AB80();
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_42;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_10003AB80();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (!v12)
  {
    __break(1u);
    goto LABEL_31;
  }
LABEL_9:
  unint64_t v13 = sub_10001D23C(v12);
  if ((v2 & 0xC000000000000001) == 0)
  {
    if ((v13 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v13 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v14 = *(id *)(v2 + 8 * v13 + 32);
      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_34;
  }
LABEL_31:
  id v14 = (id)sub_10003AA90();
LABEL_13:
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  Class v16 = sub_1000044BC(2, a1, (char)v3);
  id v3 = (id)v7;
  id v17 = v15;
  unint64_t v6 = (unint64_t)sub_100039D74((unint64_t)v16);
  swift_bridgeObjectRelease();

  if (!(v6 >> 62))
  {
    unint64_t v18 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v18) {
      goto LABEL_15;
    }
LABEL_43:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_44;
  }
LABEL_34:
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_10003AB80();
  swift_bridgeObjectRelease();
  if (!v23) {
    goto LABEL_43;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_10003AB80();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) == 0)
  {
    if (!v18)
    {
      __break(1u);
      goto LABEL_38;
    }
LABEL_15:
    unint64_t v19 = sub_10001D23C(v18);
    if ((v6 & 0xC000000000000001) == 0)
    {
      if ((v19 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v19 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v20 = *(id *)(v6 + 8 * v19 + 32);
LABEL_19:
        swift_bridgeObjectRelease();
        return (uint64_t)v3;
      }
      __break(1u);
      goto LABEL_41;
    }
LABEL_38:
    sub_10003AA90();
    goto LABEL_19;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_1000388F0(char a1, unint64_t a2, char a3)
{
  unint64_t v6 = (unint64_t)sub_1000044BC(0, a1, a3);
  unint64_t v7 = v6;
  if (v6 >> 62) {
    goto LABEL_118;
  }
  uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (2)
  {
    unint64_t v135 = a2;
    unint64_t v141 = v7;
    if (v8)
    {
      v7 &= 0xC000000000000001;
      id v9 = (id *)&_swiftEmptyDictionarySingleton;
      unint64_t v3 = 4;
      while (1)
      {
        a2 = v3 - 4;
        if (v7) {
          id v10 = (id)sub_10003AA90();
        }
        else {
          id v10 = *(id *)(v141 + 8 * v3);
        }
        uint64_t v11 = v10;
        unint64_t v12 = v3 - 3;
        if (__OFADD__(a2, 1))
        {
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
          goto LABEL_116;
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        id v143 = v9;
        a2 = (unint64_t)v9;
        unint64_t v15 = sub_10001828C((uint64_t)v11);
        id v16 = v9[2];
        BOOL v17 = (v14 & 1) == 0;
        uint64_t v18 = (uint64_t)v16 + v17;
        if (__OFADD__(v16, v17)) {
          goto LABEL_108;
        }
        uint64_t v4 = v14;
        if ((uint64_t)v9[3] >= v18)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            id v9 = v143;
            if (v14) {
              goto LABEL_5;
            }
          }
          else
          {
            a2 = (unint64_t)&v143;
            sub_10001AE38();
            id v9 = v143;
            if (v4) {
              goto LABEL_5;
            }
          }
        }
        else
        {
          sub_10001902C(v18, isUniquelyReferenced_nonNull_native);
          a2 = (unint64_t)v143;
          unint64_t v19 = sub_10001828C((uint64_t)v11);
          if ((v4 & 1) != (v20 & 1)) {
            goto LABEL_228;
          }
          unint64_t v15 = v19;
          id v9 = v143;
          if (v4)
          {
LABEL_5:
            *((void *)v9[7] + v15) = 0;
            goto LABEL_6;
          }
        }
        v9[(v15 >> 6) + 8] = (id)((unint64_t)v9[(v15 >> 6) + 8] | (1 << v15));
        uint64_t v21 = 8 * v15;
        *(void *)((char *)v9[6] + v21) = v11;
        *(void *)((char *)v9[7] + v21) = 0;
        uint64_t v22 = (char *)v9[2];
        BOOL v23 = __OFADD__(v22, 1);
        id v24 = v22 + 1;
        if (v23) {
          goto LABEL_111;
        }
        v9[2] = v24;
        id v25 = v11;
LABEL_6:

        swift_bridgeObjectRelease();
        ++v3;
        if (v12 == v8) {
          goto LABEL_23;
        }
      }
    }
    id v9 = (id *)&_swiftEmptyDictionarySingleton;
LABEL_23:
    unint64_t v7 = *(void *)(v135 + 16);
    unint64_t v134 = v7;
    if (!v7) {
      goto LABEL_43;
    }
    uint64_t v138 = v8;
    unint64_t v3 = swift_bridgeObjectRetain() + 48;
    do
    {
      if (!v9[2]) {
        goto LABEL_26;
      }
      id v26 = *(void **)(v3 - 8);
      char v27 = *(void **)v3;
      uint64_t v4 = (uint64_t)*(id *)(v3 - 16);
      id v28 = v26;
      id v29 = v27;
      a2 = (unint64_t)v9;
      unint64_t v30 = sub_10001828C(v4);
      if ((v31 & 1) == 0)
      {

        goto LABEL_26;
      }
      uint64_t v32 = *((void *)v9[7] + v30);
      uint64_t v33 = v32 + 1;
      if (__OFADD__(v32, 1)) {
        goto LABEL_114;
      }
      a2 = (unint64_t)v9;
      char v34 = v28;
      char v35 = swift_isUniquelyReferenced_nonNull_native();
      id v143 = (id *)a2;
      unint64_t v37 = sub_10001828C(v4);
      uint64_t v38 = *(void *)(a2 + 16);
      BOOL v39 = (v36 & 1) == 0;
      uint64_t v40 = v38 + v39;
      if (__OFADD__(v38, v39)) {
        goto LABEL_115;
      }
      char v41 = v36;
      if (*(void *)(a2 + 24) >= v40)
      {
        if (v35)
        {
          id v44 = v143;
          if ((v36 & 1) == 0) {
            goto LABEL_34;
          }
        }
        else
        {
          a2 = (unint64_t)&v143;
          sub_10001AE38();
          id v44 = v143;
          if ((v41 & 1) == 0) {
            goto LABEL_34;
          }
        }
      }
      else
      {
        sub_10001902C(v40, v35);
        a2 = (unint64_t)v143;
        unint64_t v42 = sub_10001828C(v4);
        if ((v41 & 1) != (v43 & 1)) {
          goto LABEL_228;
        }
        unint64_t v37 = v42;
        id v44 = v143;
        if ((v41 & 1) == 0)
        {
LABEL_34:
          v44[(v37 >> 6) + 8] = (id)((unint64_t)v44[(v37 >> 6) + 8] | (1 << v37));
          uint64_t v45 = 8 * v37;
          *(void *)((char *)v44[6] + v45) = v4;
          *(void *)((char *)v44[7] + v45) = v33;
          double v46 = (char *)v44[2];
          BOOL v23 = __OFADD__(v46, 1);
          double v47 = v46 + 1;
          if (v23) {
            goto LABEL_117;
          }
          a2 = (unint64_t)v44;
          v44[2] = v47;
          id v48 = (id)v4;
          goto LABEL_39;
        }
      }
      a2 = (unint64_t)v44;
      *((void *)v44[7] + v37) = v33;
LABEL_39:

      swift_bridgeObjectRelease();
      id v9 = (id *)a2;
LABEL_26:
      v3 += 24;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    uint64_t v8 = v138;
LABEL_43:
    if (!v8) {
      goto LABEL_223;
    }
    if ((v141 & 0xC000000000000001) == 0)
    {
      if (*(void *)((v141 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v49 = *(id *)(v141 + 32);
        goto LABEL_47;
      }
      __break(1u);
LABEL_121:
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_10003AB80();
      swift_bridgeObjectRelease();
      if (v85) {
        goto LABEL_126;
      }
LABEL_94:
      swift_bridgeObjectRelease();
      unint64_t v79 = (unint64_t)sub_1000044BC(1, a1, a3);
      unint64_t v7 = v79;
      double v142 = (void *)v4;
      if (v79 >> 62)
      {
        uint64_t v80 = sub_10003AB80();
        if (v80) {
          goto LABEL_96;
        }
      }
      else
      {
        uint64_t v80 = *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v80)
        {
LABEL_96:
          unint64_t v81 = 0;
          unint64_t v3 = v7 & 0xC000000000000001;
          uint64_t v4 = v7 & 0xFFFFFFFFFFFFFF8;
          do
          {
            if (v3)
            {
              id v82 = (id)sub_10003AA90();
            }
            else
            {
              if (v81 >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_113;
              }
              id v82 = *(id *)(v7 + 8 * v81 + 32);
            }
            long long v83 = v82;
            uint64_t v8 = v81 + 1;
            if (__OFADD__(v81, 1)) {
              goto LABEL_112;
            }
            sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
            long long v84 = (id *)(id)v141;
            a2 = sub_10003A900();

            if (a2)
            {
            }
            else
            {
              sub_10003AAC0();
              sub_10003AAF0();
              sub_10003AB00();
              a2 = (unint64_t)&v142;
              sub_10003AAD0();
            }
            ++v81;
          }
          while (v8 != v80);
          a2 = (unint64_t)v142;
          unint64_t v3 = v135;
          goto LABEL_125;
        }
      }
      a2 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_125:
      swift_bridgeObjectRelease();
      goto LABEL_126;
    }
    id v49 = (id)sub_10003AA90();
LABEL_47:
    a2 = (unint64_t)v49;
    swift_bridgeObjectRelease();
    unint64_t v141 = a2;
    id v143 = (id *)a2;
    unint64_t v7 = (unint64_t)(v9 + 8);
    uint64_t v50 = 1 << *((unsigned char *)v9 + 32);
    uint64_t v51 = -1;
    if (v50 < 64) {
      uint64_t v52 = ~(-1 << v50);
    }
    else {
      uint64_t v52 = -1;
    }
    unint64_t v53 = v52 & (unint64_t)v9[8];
    int64_t v54 = (unint64_t)(v50 + 63) >> 6;
    swift_bridgeObjectRetain();
    unint64_t v3 = 0;
    while (2)
    {
      if (v53)
      {
        unint64_t v55 = __clz(__rbit64(v53));
        v53 &= v53 - 1;
        unint64_t v56 = v55 | (v3 << 6);
LABEL_68:
        uint64_t v4 = *((void *)v9[7] + v56);
        if (v51 == -1 || v4 < v51)
        {
          a2 = (unint64_t)*((id *)v9[6] + v56);

          id v143 = (id *)a2;
          uint64_t v51 = v4;
          unint64_t v141 = a2;
        }
        continue;
      }
      break;
    }
    int64_t v57 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_110;
    }
    if (v57 < v54)
    {
      unint64_t v58 = *(void *)(v7 + 8 * v57);
      ++v3;
      if (!v58)
      {
        unint64_t v3 = v57 + 1;
        if (v57 + 1 >= v54) {
          break;
        }
        unint64_t v58 = *(void *)(v7 + 8 * v3);
        if (!v58)
        {
          unint64_t v3 = v57 + 2;
          if (v57 + 2 >= v54) {
            break;
          }
          unint64_t v58 = *(void *)(v7 + 8 * v3);
          if (!v58)
          {
            int64_t v59 = v57 + 3;
            if (v59 >= v54) {
              break;
            }
            unint64_t v58 = *(void *)(v7 + 8 * v59);
            if (!v58)
            {
              while (1)
              {
                unint64_t v3 = v59 + 1;
                if (__OFADD__(v59, 1)) {
                  break;
                }
                if ((uint64_t)v3 >= v54) {
                  goto LABEL_71;
                }
                unint64_t v58 = *(void *)(v7 + 8 * v3);
                ++v59;
                if (v58) {
                  goto LABEL_67;
                }
              }
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              swift_bridgeObjectRetain();
              uint64_t v8 = sub_10003AB80();
              swift_bridgeObjectRelease();
              continue;
            }
            unint64_t v3 = v59;
          }
        }
      }
LABEL_67:
      unint64_t v53 = (v58 - 1) & v58;
      unint64_t v56 = __clz(__rbit64(v58)) + (v3 << 6);
      goto LABEL_68;
    }
    break;
  }
LABEL_71:
  swift_release();
  uint64_t v60 = swift_bridgeObjectRetain();
  uint64_t v4 = (uint64_t)_swiftEmptyArrayStorage;
  if (v134)
  {
    unint64_t v3 = 0;
    unint64_t v7 = v60 + 48;
    uint64_t v8 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v137 = -(uint64_t)v134;
    do
    {
      id v136 = (void *)v8;
      unint64_t v61 = v134;
      if (v3 > v134) {
        unint64_t v61 = v3;
      }
      uint64_t v62 = -(uint64_t)v61;
      uint64_t v4 = v7 + 24 * v3++;
      while (1)
      {
        if (v62 + v3 == 1) {
          goto LABEL_109;
        }
        long long v139 = *(_OWORD *)(v4 - 16);
        id v63 = *(void **)v4;
        sub_10002255C(0, (unint64_t *)&qword_10004B218);
        id v64 = (id)v139;
        id v65 = *((id *)&v139 + 1);
        id v66 = v63;
        double v67 = (id *)(id)v141;
        a2 = sub_10003A900();

        if (a2) {
          break;
        }

        ++v3;
        v4 += 24;
        if (v3 - v134 == 1)
        {
          uint64_t v4 = (uint64_t)_swiftEmptyArrayStorage;
          uint64_t v8 = (uint64_t)v136;
          goto LABEL_87;
        }
      }
      uint64_t v8 = (uint64_t)v136;
      char v68 = swift_isUniquelyReferenced_nonNull_native();
      double v142 = v136;
      if ((v68 & 1) == 0)
      {
        a2 = (unint64_t)&v142;
        sub_10001766C(0, v136[2] + 1, 1);
        uint64_t v8 = (uint64_t)v142;
      }
      uint64_t v4 = (uint64_t)_swiftEmptyArrayStorage;
      long long v69 = v139;
      unint64_t v71 = *(void *)(v8 + 16);
      unint64_t v70 = *(void *)(v8 + 24);
      if (v71 >= v70 >> 1)
      {
        a2 = (unint64_t)&v142;
        sub_10001766C(v70 > 1, v71 + 1, 1);
        long long v69 = v139;
        uint64_t v8 = (uint64_t)v142;
      }
      *(void *)(v8 + 16) = v71 + 1;
      uint64_t v72 = v8 + 24 * v71;
      *(_OWORD *)(v72 + 32) = v69;
      *(void *)(v72 + 48) = v66;
    }
    while (v3 != v134);
  }
  else
  {
    uint64_t v8 = (uint64_t)_swiftEmptyArrayStorage;
  }
LABEL_87:
  unint64_t v3 = v135;
  swift_bridgeObjectRelease();
  uint64_t v73 = *(void *)(v8 + 16);
  if (v73)
  {
    double v142 = _swiftEmptyArrayStorage;
    sub_10003AAE0();
    uint64_t v74 = 40;
    do
    {
      id v75 = *(id *)(v8 + v74);
      sub_10003AAC0();
      sub_10003AAF0();
      sub_10003AB00();
      sub_10003AAD0();
      v74 += 24;
      --v73;
    }
    while (v73);
    id v76 = v142;
    swift_release();
    unint64_t v3 = v135;
  }
  else
  {
    swift_release();
    id v76 = _swiftEmptyArrayStorage;
  }
  unint64_t v77 = sub_10001EF88((unint64_t)v76);
  swift_bridgeObjectRelease();
  id v78 = sub_1000044BC(1, a1, a3);
  a2 = (unint64_t)sub_100039F1C((unint64_t)v78, (void **)&v143, v77);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a2 >> 62) {
    goto LABEL_121;
  }
  if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_94;
  }
LABEL_126:
  unint64_t v86 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 >> 62) {
    goto LABEL_193;
  }
  unint64_t v87 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v87)
  {
LABEL_224:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_225;
  }
  while (2)
  {
    unint64_t v88 = sub_10001D23C(v87);
    if ((a2 & 0xC000000000000001) == 0)
    {
      if ((v88 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v88 < *(void *)(v86 + 16))
      {
        uint64_t v89 = *(id *)(a2 + 8 * v88 + 32);
        goto LABEL_132;
      }
      __break(1u);
LABEL_200:
      int v123 = v136;
      a2 = sub_10003AB80();
      goto LABEL_156;
    }
LABEL_197:
    uint64_t v89 = (void *)sub_10003AA90();
LABEL_132:
    id v136 = v89;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v90 = v134;
    if (v134)
    {
      unint64_t v91 = v3;
      unint64_t v3 = 0;
      unint64_t v92 = v91 + 48;
      id v93 = _swiftEmptyArrayStorage;
      uint64_t v137 = -(uint64_t)v134;
      unint64_t v131 = v91 + 48;
      do
      {
        if (v3 <= v90) {
          unint64_t v94 = v90;
        }
        else {
          unint64_t v94 = v3;
        }
        uint64_t v95 = -(uint64_t)v94;
        uint64_t v8 = v92 + 24 * v3++;
        while (1)
        {
          if (v95 + v3 == 1)
          {
            __break(1u);
            goto LABEL_189;
          }
          long long v140 = *(_OWORD *)(v8 - 16);
          unint64_t v96 = *(void **)v8;
          sub_10002255C(0, (unint64_t *)&qword_10004B218);
          uint64_t v97 = (id *)(id)v141;
          id v98 = (id)v140;
          unint64_t v86 = (unint64_t)*((id *)&v140 + 1);
          id v99 = v96;
          a2 = sub_10003A900();

          if (a2) {
            break;
          }

          ++v3;
          v8 += 24;
          if (v3 - v134 == 1) {
            goto LABEL_149;
          }
        }
        char v100 = swift_isUniquelyReferenced_nonNull_native();
        double v142 = v93;
        if ((v100 & 1) == 0)
        {
          a2 = (unint64_t)&v142;
          sub_10001766C(0, v93[2] + 1, 1);
          id v93 = v142;
        }
        unint64_t v92 = v131;
        long long v101 = v140;
        unint64_t v86 = v93[2];
        unint64_t v102 = v93[3];
        if (v86 >= v102 >> 1)
        {
          a2 = (unint64_t)&v142;
          sub_10001766C(v102 > 1, v86 + 1, 1);
          long long v101 = v140;
          id v93 = v142;
        }
        void v93[2] = v86 + 1;
        uint64_t v103 = &v93[3 * v86];
        *((_OWORD *)v103 + 2) = v101;
        v103[6] = v99;
        unint64_t v90 = v134;
      }
      while (v3 != v134);
    }
    else
    {
      id v93 = _swiftEmptyArrayStorage;
    }
LABEL_149:
    swift_bridgeObjectRelease();
    uint64_t v104 = v93[2];
    if (v104)
    {
      double v142 = _swiftEmptyArrayStorage;
      sub_10003AAE0();
      unint64_t v3 = 48;
      do
      {
        id v105 = *(id *)((char *)v93 + v3);
        sub_10003AAC0();
        sub_10003AAF0();
        sub_10003AB00();
        sub_10003AAD0();
        v3 += 24;
        --v104;
      }
      while (v104);
      id v106 = v142;
      swift_release();
    }
    else
    {
      swift_release();
      id v106 = _swiftEmptyArrayStorage;
    }
    uint64_t v137 = sub_10001EF88((unint64_t)v106);
    swift_bridgeObjectRelease();
    unint64_t v107 = (unint64_t)sub_1000044BC(2, a1, a3);
    uint64_t v8 = v107;
    double v142 = _swiftEmptyArrayStorage;
    if (v107 >> 62) {
      goto LABEL_200;
    }
    a2 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
    char v108 = v136;
LABEL_156:
    if (a2)
    {
      unint64_t v109 = 0;
      unint64_t v86 = v8 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if ((v8 & 0xC000000000000001) != 0)
        {
          id v110 = (id)sub_10003AA90();
        }
        else
        {
          if (v109 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_190;
          }
          id v110 = *(id *)(v8 + 8 * v109 + 32);
        }
        uint64_t v111 = v110;
        unint64_t v112 = v109 + 1;
        if (__OFADD__(v109, 1)) {
          break;
        }
        sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
        uint64_t v113 = (id *)(id)v141;
        unint64_t v3 = sub_10003A900();

        if (v3 & 1) != 0 || (sub_10003A900() & 1) != 0 || (sub_100015470(v111, v137))
        {
        }
        else
        {
          sub_10003AAC0();
          unint64_t v3 = v142[2];
          sub_10003AAF0();
          sub_10003AB00();
          sub_10003AAD0();
        }
        ++v109;
        if (v112 == a2)
        {
          a2 = (unint64_t)v142;
          goto LABEL_171;
        }
      }
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      swift_bridgeObjectRetain();
      uint64_t v122 = sub_10003AB80();
      swift_bridgeObjectRelease();
      if (!v122) {
        goto LABEL_224;
      }
      swift_bridgeObjectRetain();
      unint64_t v87 = sub_10003AB80();
      swift_bridgeObjectRelease();
      if ((v87 & 0x8000000000000000) != 0) {
        goto LABEL_226;
      }
      if (v87) {
        continue;
      }
      __break(1u);
      goto LABEL_197;
    }
    break;
  }
  a2 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_171:
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if ((a2 & 0x8000000000000000) != 0 || (a2 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v124 = sub_10003AB80();
    swift_release();
    if (v124) {
      goto LABEL_209;
    }
  }
  else if (*(void *)(a2 + 16))
  {
    goto LABEL_209;
  }
  swift_release();
  uint64_t v114 = (uint64_t)sub_1000044BC(2, a1, a3);
  unint64_t v86 = v114;
  double v142 = _swiftEmptyArrayStorage;
  if (!((unint64_t)v114 >> 62))
  {
    uint64_t v115 = *(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v116 = v136;
    if (!v115) {
      goto LABEL_207;
    }
    goto LABEL_176;
  }
  if (v114 < 0) {
    a2 = v114;
  }
  else {
    a2 = v114 & 0xFFFFFFFFFFFFFF8;
  }
  id v125 = v136;
  uint64_t v115 = sub_10003AB80();
  if (v115)
  {
LABEL_176:
    unint64_t v117 = 0;
    uint64_t v8 = v86 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if ((v86 & 0xC000000000000001) != 0)
      {
        id v118 = (id)sub_10003AA90();
      }
      else
      {
        if (v117 >= *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_192;
        }
        id v118 = *(id *)(v86 + 8 * v117 + 32);
      }
      id v119 = v118;
      unint64_t v120 = v117 + 1;
      if (__OFADD__(v117, 1)) {
        goto LABEL_191;
      }
      a2 = sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
      unint64_t v3 = (unint64_t)(id)v141;
      char v121 = sub_10003A900();

      if (v121 & 1) != 0 || (sub_10003A900())
      {
      }
      else
      {
        sub_10003AAC0();
        unint64_t v3 = v142[2];
        sub_10003AAF0();
        sub_10003AB00();
        a2 = (unint64_t)&v142;
        sub_10003AAD0();
      }
      ++v117;
      if (v120 == v115)
      {
        a2 = (unint64_t)v142;
        goto LABEL_208;
      }
    }
  }
LABEL_207:
  a2 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_208:
  swift_bridgeObjectRelease();

LABEL_209:
  if (!(a2 >> 62))
  {
    unint64_t v126 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v126) {
      goto LABEL_211;
    }
LABEL_225:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_226:
    __break(1u);
    goto LABEL_227;
  }
  swift_bridgeObjectRetain();
  uint64_t v130 = sub_10003AB80();
  swift_bridgeObjectRelease();
  if (!v130) {
    goto LABEL_225;
  }
  swift_bridgeObjectRetain();
  unint64_t v126 = sub_10003AB80();
  swift_bridgeObjectRelease();
  if ((v126 & 0x8000000000000000) != 0)
  {
LABEL_227:
    __break(1u);
LABEL_228:
    sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
    uint64_t result = sub_10003AC60();
    __break(1u);
    return result;
  }
  if (v126)
  {
LABEL_211:
    unint64_t v127 = sub_10001D23C(v126);
    if ((a2 & 0xC000000000000001) != 0) {
      goto LABEL_220;
    }
    if ((v127 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v127 < *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v128 = *(id *)(a2 + 8 * v127 + 32);
      goto LABEL_215;
    }
    __break(1u);
LABEL_223:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_224;
  }
  __break(1u);
LABEL_220:
  sub_10003AA90();
LABEL_215:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v141;
}

Swift::Int sub_100039964()
{
  uint64_t v1 = *(void **)v0;
  unint64_t v2 = *(void **)(v0 + 8);
  unint64_t v3 = *(void **)(v0 + 16);
  sub_10003AC90();
  id v4 = v1;
  sub_10003A910();

  id v5 = v2;
  sub_10003A910();

  id v6 = v3;
  sub_10003A910();

  return sub_10003ACD0();
}

void sub_1000399E8()
{
  uint64_t v1 = *(void **)(v0 + 8);
  unint64_t v2 = *(void **)(v0 + 16);
  id v3 = *(id *)v0;
  sub_10003A910();

  id v4 = v1;
  sub_10003A910();

  id v5 = v2;
  sub_10003A910();
}

Swift::Int sub_100039A74()
{
  uint64_t v1 = *(void **)v0;
  unint64_t v2 = *(void **)(v0 + 8);
  id v3 = *(void **)(v0 + 16);
  sub_10003AC90();
  id v4 = v1;
  sub_10003A910();

  id v5 = v2;
  sub_10003A910();

  id v6 = v3;
  sub_10003A910();

  return sub_10003ACD0();
}

uint64_t sub_100039AF4()
{
  if (sub_10003A900() & 1) != 0 && (sub_10003A900()) {
    return sub_10003A900() & 1;
  }
  else {
    return 0;
  }
}

unint64_t sub_100039B90()
{
  unint64_t result = qword_10004BBE0;
  if (!qword_10004BBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004BBE0);
  }
  return result;
}

void *sub_100039BE4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_10003AA90();
LABEL_9:
        id v6 = v5;
        unint64_t v7 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
        if (sub_10003A900())
        {
        }
        else
        {
          sub_10003AAC0();
          sub_10003AAF0();
          uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
          sub_10003AB00();
          sub_10003AAD0();
        }
        ++v3;
        if (v7 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)(v4 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_10003AB80();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100039D74(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = a1 & 0xC000000000000001;
      while (v4)
      {
        id v5 = (id)sub_10003AA90();
LABEL_9:
        id v6 = v5;
        unint64_t v7 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_16;
        }
        sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
        if (sub_10003A900() & 1) != 0 || (sub_10003A900())
        {
        }
        else
        {
          sub_10003AAC0();
          sub_10003AAF0();
          unint64_t v4 = a1 & 0xC000000000000001;
          sub_10003AB00();
          sub_10003AAD0();
        }
        ++v3;
        if (v7 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      uint64_t v2 = sub_10003AB80();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100039F1C(unint64_t a1, void **a2, unint64_t a3)
{
  unint64_t v4 = a1;
  if (a1 >> 62) {
    goto LABEL_27;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      unint64_t v7 = v4 & 0xC000000000000001;
      unint64_t v31 = v4 + 32;
      uint64_t v32 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v4 = a3;
      uint64_t v28 = v5;
      unint64_t v29 = a3 + 56;
      while (v7)
      {
        id v8 = (id)sub_10003AA90();
LABEL_9:
        id v9 = v8;
        if (__OFADD__(v6++, 1)) {
          goto LABEL_26;
        }
        uint64_t v11 = *a2;
        sub_10002255C(0, (unint64_t *)&qword_10004B2C0);
        id v12 = v11;
        char v13 = sub_10003A900();

        if ((v13 & 1) == 0)
        {
          uint64_t v14 = a2;
          if ((a3 & 0xC000000000000001) != 0)
          {
            id v15 = v9;
            char v16 = sub_10003A9E0();

            if (v16)
            {

LABEL_22:
              a2 = v14;
              uint64_t v5 = v28;
              goto LABEL_5;
            }
          }
          else if (*(void *)(a3 + 16))
          {
            Swift::Int v17 = sub_10003A8F0(*(void *)(a3 + 40));
            uint64_t v18 = -1 << *(unsigned char *)(a3 + 32);
            unint64_t v19 = v17 & ~v18;
            if ((*(void *)(v29 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
            {
              id v20 = *(id *)(*(void *)(a3 + 48) + 8 * v19);
              char v21 = sub_10003A900();

              if (v21)
              {
LABEL_20:

                goto LABEL_22;
              }
              uint64_t v22 = ~v18;
              while (1)
              {
                unint64_t v19 = (v19 + 1) & v22;
                if (((*(void *)(v29 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
                  break;
                }
                id v23 = *(id *)(*(void *)(a3 + 48) + 8 * v19);
                char v24 = sub_10003A900();

                if (v24) {
                  goto LABEL_20;
                }
              }
            }
          }
          sub_10003AAC0();
          sub_10003AAF0();
          sub_10003AB00();
          sub_10003AAD0();
          goto LABEL_22;
        }

LABEL_5:
        if (v6 == v5) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v6 < *(void *)(v32 + 16)) {
        break;
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      unint64_t v26 = v4;
      uint64_t v27 = sub_10003AB80();
      unint64_t v4 = v26;
      uint64_t v5 = v27;
      if (!v27) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v8 = *(id *)(v31 + 8 * v6);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void destroy for RhizomeShapeLayerConfiguration(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for RhizomeShapeLayerConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  unint64_t v3 = *(void **)(a2 + 8);
  unint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

uint64_t assignWithCopy for RhizomeShapeLayerConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  unint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  unint64_t v7 = *(void **)(a2 + 16);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for RhizomeShapeLayerConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RhizomeShapeLayerConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);

  unint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for RhizomeShapeLayerConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RhizomeShapeLayerConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RhizomeShapeLayerConfiguration()
{
  return &type metadata for RhizomeShapeLayerConfiguration;
}

void sub_10003A408()
{
}

uint64_t sub_10003A430()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10003A440()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10003A450()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10003A460()
{
  return UUID.init()();
}

uint64_t sub_10003A470()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10003A480()
{
  return type metadata accessor for CGPathFillRule();
}

uint64_t sub_10003A490()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_10003A4A0()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_10003A4B0()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_10003A4C0()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_10003A4D0()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_10003A4E0()
{
  return static UnlockState.locked.getter();
}

uint64_t sub_10003A4F0()
{
  return UnlockState.progress.getter();
}

uint64_t sub_10003A500()
{
  return type metadata accessor for UnlockState();
}

uint64_t sub_10003A510()
{
  return StateTransition.init(previous:current:)();
}

uint64_t sub_10003A520()
{
  return dispatch thunk of PosterRotationAnimator.orientation.setter();
}

uint64_t sub_10003A530()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(editor:transition:)();
}

uint64_t sub_10003A540()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(renderer:transition:)();
}

uint64_t sub_10003A550()
{
  return dispatch thunk of PosterRotationAnimator.delegate.setter();
}

uint64_t sub_10003A560()
{
  return PosterRotationAnimator.init()();
}

uint64_t sub_10003A570()
{
  return type metadata accessor for PosterRotationAnimator();
}

uint64_t sub_10003A580()
{
  return WakeState.isTransitioning.getter();
}

uint64_t sub_10003A590()
{
  return WakeState.backlightProgress.getter();
}

uint64_t sub_10003A5A0()
{
  return static WakeState.off.getter();
}

uint64_t sub_10003A5B0()
{
  return WakeState.isOn.getter();
}

uint64_t sub_10003A5C0()
{
  return type metadata accessor for WakeState();
}

uint64_t sub_10003A5D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10003A5E0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10003A5F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10003A600()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10003A610()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10003A620()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_10003A630()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10003A640()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_10003A650()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_10003A660()
{
  return PRProviderConfiguration.init(content:)();
}

uint64_t sub_10003A670()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_10003A680()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_10003A690()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10003A6A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003A6B0()
{
  return Dictionary.description.getter();
}

uint64_t sub_10003A6C0()
{
  return FloatingPoint.smoothstep.getter();
}

uint64_t sub_10003A6D0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10003A6E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10003A6F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003A700()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10003A710()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_10003A720()
{
  return static String.localized(key:tableSuffix:comment:)();
}

uint64_t sub_10003A730()
{
  return String.hash(into:)();
}

void sub_10003A740(Swift::String a1)
{
}

uint64_t sub_10003A750()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_10003A760()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10003A770()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10003A780()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10003A790()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10003A7A0()
{
  return Array.description.getter();
}

uint64_t sub_10003A7B0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10003A7C0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10003A7D0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10003A7E0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10003A7F0()
{
  return Double.description.getter();
}

uint64_t sub_10003A800()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10003A810()
{
  return PRRenderer.unlockState.getter();
}

uint64_t sub_10003A820()
{
  return PRRenderer.wakeState.getter();
}

uint64_t sub_10003A830()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t sub_10003A840()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10003A850()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10003A860()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10003A870()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10003A880()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t sub_10003A890()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10003A8A0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10003A8B0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10003A8C0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10003A8D0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10003A8E0()
{
  return UIInterfaceOrientation.description.getter();
}

Swift::Int sub_10003A8F0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_10003A900()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10003A910()
{
  return NSObject.hash(into:)();
}

uint64_t sub_10003A920()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_10003A930()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10003A940()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10003A950()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10003A960()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10003A970()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10003A980()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10003A990()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_10003A9A0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10003A9B0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_10003A9C0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_10003A9D0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_10003A9E0()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int sub_10003A9F0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10003AA00()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10003AA10()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10003AA20()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10003AA30()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10003AA40()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_10003AA50()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10003AA60(Swift::Int a1)
{
}

uint64_t sub_10003AA70()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_10003AA80(Swift::Int a1)
{
}

uint64_t sub_10003AA90()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10003AAA0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10003AAB0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10003AAC0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10003AAD0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10003AAE0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10003AAF0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10003AB00()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10003AB10()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10003AB20()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_10003AB30()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_10003AB40()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_10003AB50()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_10003AB60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10003AB70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10003AB80()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10003AB90()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_10003ABA0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10003ABB0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10003ABC0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_10003ABD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10003ABE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10003ABF0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_10003AC10(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10003AC20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10003AC30()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10003AC40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10003AC50()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10003AC60()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10003AC70()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10003AC80()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10003AC90()
{
  return Hasher.init(_seed:)();
}

void sub_10003ACA0(Swift::UInt a1)
{
}

void sub_10003ACB0(Swift::UInt8 a1)
{
}

void sub_10003ACC0(Swift::UInt64 a1)
{
}

Swift::Int sub_10003ACD0()
{
  return Hasher._finalize()();
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return _CGAffineTransformDecompose(retstr, transform);
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

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return _CGBitmapGetAlignedBytesPerRow();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return _CGPathCreateCopyByTransformingPath(path, transform);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  return _CGPathGetPathBoundingBox(path);
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return _CGPointEqualToPoint(point1, point2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

uint64_t CLKDegreesToRadians()
{
  return _CLKDegreesToRadians();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenPoints()
{
  return _CLKInterpolateBetweenPoints();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return _CTFontCreatePathForGlyph(font, glyph, matrix);
}

CGGlyph CTFontGetGlyphWithName(CTFontRef font, CFStringRef glyphName)
{
  return _CTFontGetGlyphWithName(font, glyphName);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

uint64_t UISizeRoundToScale()
{
  return _UISizeRoundToScale();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_fontDescriptorForSectName_fromMachO_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorForSectName:fromMachO:");
}