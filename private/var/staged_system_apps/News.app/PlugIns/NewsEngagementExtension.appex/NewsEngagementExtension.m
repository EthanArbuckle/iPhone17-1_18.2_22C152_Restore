uint64_t sub_10000434C(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  unint64_t v7;
  const char *v8;
  char v9;

  v2 = 0xD000000000000016;
  v3 = 0x800000010000A470;
  v4 = a1;
  v5 = 0xD000000000000016;
  switch(v4)
  {
    case 1:
      v5 = 0xD000000000000017;
      v6 = "queryNewsPlusEngagement";
      goto LABEL_5;
    case 2:
      v5 = 0xD000000000000018;
      v6 = "queryLocalNewsEngagement";
      goto LABEL_5;
    case 3:
      v5 = 0xD00000000000001CLL;
      v6 = "queryNewsPlusAudioEngagement";
LABEL_5:
      v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  v7 = 0x800000010000A470;
  switch(a2)
  {
    case 1:
      v2 = 0xD000000000000017;
      v8 = "queryNewsPlusEngagement";
      goto LABEL_10;
    case 2:
      v2 = 0xD000000000000018;
      v8 = "queryLocalNewsEngagement";
      goto LABEL_10;
    case 3:
      v2 = 0xD00000000000001CLL;
      v8 = "queryNewsPlusAudioEngagement";
LABEL_10:
      v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    v9 = 1;
  }
  else {
    v9 = sub_10000A058();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_1000044AC()
{
  return sub_10000A0D8();
}

uint64_t sub_10000458C()
{
  sub_100009EC8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000464C()
{
  return sub_10000A0D8();
}

uint64_t sub_100004724@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  v3 = (void *)a1[1];
  v4._rawValue = &off_10000C628;
  v7._object = v3;
  Swift::Int v5 = sub_10000A018(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100004778@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000051C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000047A4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_10000C660;
  v8._object = a2;
  Swift::Int v6 = sub_10000A018(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_1000047FC()
{
  return 0;
}

void sub_100004808(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100004814(uint64_t a1)
{
  unint64_t v2 = sub_1000054A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004850(uint64_t a1)
{
  unint64_t v2 = sub_1000054A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_10000488C(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD00000000000001CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004914(void *a1, char a2)
{
  uint64_t v4 = sub_100005420(&qword_100010500);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  Swift::String v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005464(a1, a1[3]);
  sub_1000054A8();
  sub_10000A0F8();
  v9[15] = a2;
  sub_1000058A8();
  sub_10000A038();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

void *sub_100004A58@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000052B4(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100004A84(void *a1)
{
  return sub_100004914(a1, *v1);
}

uint64_t sub_100004AA0()
{
  v1._countAndFlagsBits = 0x646E616D6D6F635BLL;
  v1._object = (void *)0xEA0000000000203ALL;
  sub_100009ED8(v1);
  sub_100009FD8();
  v2._countAndFlagsBits = 93;
  v2._object = (void *)0xE100000000000000;
  sub_100009ED8(v2);
  return 0;
}

uint64_t sub_100004B2C()
{
  return sub_100004AA0();
}

unsigned char *initializeBufferWithCopyOfBuffer for Command(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for JsonPayload()
{
  return &type metadata for JsonPayload;
}

ValueMetadata *type metadata accessor for PluginRequest()
{
  return &type metadata for PluginRequest;
}

uint64_t sub_100004B6C()
{
  return 1;
}

void sub_100004B78()
{
}

uint64_t sub_100004BA4(void *a1, char a2)
{
  uint64_t v4 = sub_100005420(&qword_1000104F0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  Swift::String v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005464(a1, a1[3]);
  sub_1000057AC();
  sub_10000A0F8();
  v9[15] = a2;
  sub_100005854();
  sub_10000A038();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100004CE8(void *a1, char a2)
{
  uint64_t v4 = sub_100005420(&qword_100010558);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  Swift::String v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100005464(a1, a1[3]);
  sub_100005D60();
  sub_10000A0F8();
  v9[15] = a2;
  sub_100005E08();
  sub_10000A038();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100004E30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000055A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100004E5C(uint64_t a1)
{
  unint64_t v2 = sub_1000057AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004E98(uint64_t a1)
{
  unint64_t v2 = sub_1000057AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100004ED4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100005640(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100004F00(void *a1)
{
  return sub_100004BA4(a1, *v1);
}

Swift::Int sub_100004F1C()
{
  return sub_10000A0D8();
}

Swift::Int sub_100004F60()
{
  return sub_10000A0D8();
}

uint64_t sub_100004FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100005B54(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100004FD0(uint64_t a1)
{
  unint64_t v2 = sub_100005D60();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000500C(uint64_t a1)
{
  unint64_t v2 = sub_100005D60();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_100005048@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100005BF4(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100005074(void *a1)
{
  return sub_100004CE8(a1, *v1);
}

uint64_t sub_100005090(unsigned __int8 *a1, char *a2)
{
  return sub_10000434C(*a1, *a2);
}

Swift::Int sub_10000509C()
{
  return sub_1000044AC();
}

uint64_t sub_1000050A4()
{
  return sub_10000458C();
}

Swift::Int sub_1000050AC()
{
  return sub_10000464C();
}

uint64_t sub_1000050B4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000062D8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000050E4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000488C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005110()
{
  return sub_100009F08();
}

uint64_t sub_100005170()
{
  return sub_100009EF8();
}

uint64_t sub_1000051C0()
{
  return 0x7961702D6E6F736ALL;
}

Swift::Int sub_1000051E0()
{
  return sub_10000A0D8();
}

uint64_t sub_10000523C()
{
  return sub_100009EC8();
}

Swift::Int sub_10000525C()
{
  return sub_10000A0D8();
}

void *sub_1000052B4(void *a1)
{
  uint64_t v3 = sub_100005420(&qword_1000104C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Swift::String v7 = sub_100005464(a1, a1[3]);
  sub_1000054A8();
  sub_10000A0E8();
  if (v1)
  {
    sub_1000054FC((uint64_t)a1);
  }
  else
  {
    sub_10000554C();
    sub_10000A028();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    Swift::String v7 = (void *)v9[15];
    sub_1000054FC((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_100005420(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100005464(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000054A8()
{
  unint64_t result = qword_1000104C8;
  if (!qword_1000104C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104C8);
  }
  return result;
}

uint64_t sub_1000054FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000554C()
{
  unint64_t result = qword_1000104D0;
  if (!qword_1000104D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104D0);
  }
  return result;
}

uint64_t sub_1000055A0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10000A058();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100005628()
{
  return 0x74736575716572;
}

void *sub_100005640(void *a1)
{
  uint64_t v3 = sub_100005420(&qword_1000104D8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Swift::String v7 = sub_100005464(a1, a1[3]);
  sub_1000057AC();
  sub_10000A0E8();
  if (v1)
  {
    sub_1000054FC((uint64_t)a1);
  }
  else
  {
    sub_100005800();
    sub_10000A028();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    Swift::String v7 = (void *)v9[15];
    sub_1000054FC((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_1000057AC()
{
  unint64_t result = qword_1000104E0;
  if (!qword_1000104E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104E0);
  }
  return result;
}

unint64_t sub_100005800()
{
  unint64_t result = qword_1000104E8;
  if (!qword_1000104E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104E8);
  }
  return result;
}

unint64_t sub_100005854()
{
  unint64_t result = qword_1000104F8;
  if (!qword_1000104F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104F8);
  }
  return result;
}

unint64_t sub_1000058A8()
{
  unint64_t result = qword_100010508;
  if (!qword_100010508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010508);
  }
  return result;
}

uint64_t sub_100005908()
{
  return 0;
}

ValueMetadata *type metadata accessor for JsonPayload.CodingKeys()
{
  return &type metadata for JsonPayload.CodingKeys;
}

ValueMetadata *type metadata accessor for PluginRequest.CodingKeys()
{
  return &type metadata for PluginRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for Request()
{
  return &type metadata for Request;
}

unint64_t sub_100005948()
{
  unint64_t result = qword_100010510;
  if (!qword_100010510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010510);
  }
  return result;
}

unint64_t sub_1000059A0()
{
  unint64_t result = qword_100010518;
  if (!qword_100010518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010518);
  }
  return result;
}

unint64_t sub_1000059F8()
{
  unint64_t result = qword_100010520;
  if (!qword_100010520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010520);
  }
  return result;
}

unint64_t sub_100005A50()
{
  unint64_t result = qword_100010528;
  if (!qword_100010528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010528);
  }
  return result;
}

unint64_t sub_100005AA8()
{
  unint64_t result = qword_100010530;
  if (!qword_100010530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010530);
  }
  return result;
}

unint64_t sub_100005B00()
{
  unint64_t result = qword_100010538;
  if (!qword_100010538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010538);
  }
  return result;
}

uint64_t sub_100005B54(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10000A058();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100005BDC()
{
  return 0x646E616D6D6F63;
}

void *sub_100005BF4(void *a1)
{
  uint64_t v3 = sub_100005420(&qword_100010540);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Swift::String v7 = sub_100005464(a1, a1[3]);
  sub_100005D60();
  sub_10000A0E8();
  if (v1)
  {
    sub_1000054FC((uint64_t)a1);
  }
  else
  {
    sub_100005DB4();
    sub_10000A028();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    Swift::String v7 = (void *)v9[15];
    sub_1000054FC((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_100005D60()
{
  unint64_t result = qword_100010548;
  if (!qword_100010548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010548);
  }
  return result;
}

unint64_t sub_100005DB4()
{
  unint64_t result = qword_100010550;
  if (!qword_100010550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010550);
  }
  return result;
}

unint64_t sub_100005E08()
{
  unint64_t result = qword_100010560;
  if (!qword_100010560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010560);
  }
  return result;
}

uint64_t _s23NewsEngagementExtension11JsonPayloadV10CodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s23NewsEngagementExtension11JsonPayloadV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100005F48);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Request.CodingKeys()
{
  return &type metadata for Request.CodingKeys;
}

uint64_t _s23NewsEngagementExtension7CommandOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s23NewsEngagementExtension7CommandOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000060DCLL);
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

uint64_t sub_100006104(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000610C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Command()
{
  return &type metadata for Command;
}

unint64_t sub_100006128()
{
  unint64_t result = qword_100010568;
  if (!qword_100010568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010568);
  }
  return result;
}

unint64_t sub_100006180()
{
  unint64_t result = qword_100010570;
  if (!qword_100010570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010570);
  }
  return result;
}

unint64_t sub_1000061D8()
{
  unint64_t result = qword_100010578;
  if (!qword_100010578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010578);
  }
  return result;
}

unint64_t sub_100006230()
{
  unint64_t result = qword_100010580;
  if (!qword_100010580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010580);
  }
  return result;
}

unint64_t sub_100006284()
{
  unint64_t result = qword_100010588;
  if (!qword_100010588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010588);
  }
  return result;
}

uint64_t sub_1000062D8(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C698;
  v6._object = a2;
  unint64_t v4 = sub_10000A018(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_100006328(void *a1, uint64_t a2)
{
  uint64_t v5 = self;
  sub_100005464(a1, a1[3]);
  id v13 = 0;
  id v6 = [v5 dataWithJSONObject:sub_10000A048() options:a2 error:&v13];
  swift_unknownObjectRelease();
  id v7 = v13;
  if (v6)
  {
    uint64_t v8 = sub_100009DC8();
    unint64_t v10 = v9;

    sub_1000099C4();
    sub_100009D48();
    uint64_t result = sub_100009A18(v8, v10);
    if (!v2) {
      return v14;
    }
  }
  else
  {
    v12 = v7;
    sub_100009D88();

    return swift_willThrow();
  }
  return result;
}

BOOL sub_100006474(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006488()
{
  Swift::UInt v1 = *v0;
  sub_10000A0B8();
  sub_10000A0C8(v1);
  return sub_10000A0D8();
}

void sub_1000064D0()
{
  sub_10000A0C8(*v0);
}

Swift::Int sub_1000064FC()
{
  Swift::UInt v1 = *v0;
  sub_10000A0B8();
  sub_10000A0C8(v1);
  return sub_10000A0D8();
}

double sub_100006550()
{
  qword_1000105B0 = 0;
  double result = 0.0;
  xmmword_100010590 = 0u;
  unk_1000105A0 = 0u;
  return result;
}

double sub_100006568@<D0>(uint64_t *a1@<X8>)
{
  v38 = a1;
  uint64_t v1 = sub_100009E08();
  uint64_t v36 = *(void *)(v1 - 8);
  uint64_t v37 = v1;
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v35 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v35 - v4;
  uint64_t v6 = sub_100005420(&qword_100010728);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009DB8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  v16 = (char *)&v35 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v35 - v17;
  id v19 = [self defaultManager];
  NSString v20 = sub_100009EB8();
  id v21 = [v19 containerURLForSecurityApplicationGroupIdentifier:v20];

  if (v21)
  {
    sub_100009DA8();

    v22 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v22(v8, v16, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v22(v18, v8, v9);
      sub_100009D98();
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v16, v9);
      sub_100009DF8();
      uint64_t v23 = v36;
      uint64_t v24 = v37;
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v35, v5, v37);
      uint64_t v25 = sub_100009DE8();
      swift_allocObject();
      uint64_t v26 = sub_100009DD8();
      v27 = v38;
      v38[3] = v25;
      v27[4] = (uint64_t)&protocol witness table for EngagementDataManager;
      uint64_t *v27 = v26;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
      v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v16, v9);
      v28(v18, v9);
      return result;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  sub_100009968((uint64_t)v8, &qword_100010728);
  if (qword_1000104B8 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100009E68();
  sub_100009440(v30, (uint64_t)qword_100011730);
  v31 = sub_100009E48();
  os_log_type_t v32 = sub_100009F18();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Error while loading container for News. Ensure you have access to the application group folder.", v33, 2u);
    swift_slowDealloc();
  }

  v34 = v38;
  v38[4] = 0;
  double result = 0.0;
  *(_OWORD *)v34 = 0u;
  *((_OWORD *)v34 + 1) = 0u;
  return result;
}

uint64_t sub_100006A40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1000104B8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100009E68();
  sub_100009440(v12, (uint64_t)qword_100011730);
  id v13 = sub_100009E48();
  os_log_type_t v14 = sub_100009F28();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "PerformRequest: Asking Manager for properties", v15, 2u);
    swift_slowDealloc();
  }

  sub_100005464(a1, a1[3]);
  v16 = (void *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = a6;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100009E18();

  return swift_release();
}

uint64_t sub_100006BD0(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t *, void), uint64_t a5)
{
  uint64_t v10 = sub_100005420(&qword_1000106F0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009E38();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009904(a1, (uint64_t)v12, &qword_1000106F0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_100009968((uint64_t)v12, &qword_1000106F0);
    if (qword_1000104B8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_100009E68();
    sub_100009440(v17, (uint64_t)qword_100011730);
    swift_bridgeObjectRetain_n();
    v18 = sub_100009E48();
    os_log_type_t v19 = sub_100009F18();
    if (os_log_type_enabled(v18, v19))
    {
      NSString v20 = (uint8_t *)swift_slowAlloc();
      v48[0] = swift_slowAlloc();
      *(_DWORD *)NSString v20 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_100007B08(a2, a3, v48);
      sub_100009F78();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to get propertyValues for %s, returning empty response", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v42 = sub_100009794();
    uint64_t v49 = sub_100005420(&qword_1000106F8);
    v48[0] = v42;
    a4(v48, 0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v46 = v16;
    uint64_t v21 = sub_100009E28();
    uint64_t v22 = sub_100005420(&qword_1000106F8);
    uint64_t v49 = v22;
    v48[0] = v21;
    sub_100005420(&qword_100010700);
    uint64_t inited = swift_initStackObject();
    long long v45 = xmmword_10000AE40;
    *(_OWORD *)(inited + 16) = xmmword_10000AE40;
    *(void *)(inited + 32) = 0x65736E6F70736572;
    *(void *)(inited + 40) = 0xE800000000000000;
    sub_100009890((uint64_t)v48, inited + 48);
    unint64_t v24 = sub_1000074A4(inited);
    sub_100005420(&qword_100010708);
    uint64_t v25 = swift_initStackObject();
    *(_OWORD *)(v25 + 16) = v45;
    strcpy((char *)(v25 + 32), "json-payload");
    *(unsigned char *)(v25 + 45) = 0;
    *(_WORD *)(v25 + 46) = -5120;
    *(void *)(v25 + 48) = v24;
    unint64_t v26 = sub_1000075DC(v25);
    unint64_t v27 = sub_1000076F8(v26);
    swift_bridgeObjectRelease();
    sub_1000054FC((uint64_t)v48);
    if (qword_1000104B8 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_100009E68();
    sub_100009440(v28, (uint64_t)qword_100011730);
    v29 = sub_100009E48();
    os_log_type_t v30 = sub_100009F28();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "PerformRequest: Sending value back to AMS", v31, 2u);
      swift_slowDealloc();
    }

    swift_bridgeObjectRetain_n();
    os_log_type_t v32 = sub_100009E48();
    os_log_type_t v33 = sub_100009F28();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      v44[3] = a5;
      v35 = (uint8_t *)v34;
      uint64_t v36 = swift_slowAlloc();
      *(void *)&long long v45 = a4;
      v44[2] = v36;
      v48[0] = v36;
      *(_DWORD *)v35 = 136315138;
      v44[0] = v35 + 4;
      swift_bridgeObjectRetain();
      v44[1] = (char *)&type metadata for Any + 8;
      uint64_t v37 = v22;
      uint64_t v38 = sub_100009EA8();
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      uint64_t v41 = v38;
      uint64_t v22 = v37;
      uint64_t v47 = sub_100007B08(v41, v40, v48);
      sub_100009F78();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Plugin Response = %s", v35, 0xCu);
      swift_arrayDestroy();
      a4 = (void (*)(uint64_t *, void))v45;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v49 = v22;
    v48[0] = v27;
    a4(v48, 0);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v46, v13);
  }
  return sub_100009968((uint64_t)v48, &qword_1000106A8);
}

uint64_t sub_100007274(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100007338(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100009904(a1, (uint64_t)v11, &qword_1000106A8);
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v10 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = sub_100005464(v11, v12);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = sub_10000A048();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_1000054FC((uint64_t)v11);
  if (a2) {
LABEL_3:
  }
    a2 = (void *)sub_100009D78();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease();
}

unint64_t sub_1000074A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005420(&qword_100010710);
  uint64_t v2 = sub_100009FF8();
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
    sub_100009904(v6, (uint64_t)&v15, &qword_100010720);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100008160(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000098EC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000075DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005420(&qword_100010718);
  uint64_t v2 = (void *)sub_100009FF8();
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
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100008160(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
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

unint64_t sub_1000076F8(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005420(&qword_100010710);
    uint64_t v2 = (void *)sub_100009FF8();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  char v10 = (uint64_t *)&unk_1000106F8;
  uint64_t v11 = (char *)&type metadata for Any + 8;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1000098FC();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    unint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100005420(v10);
    swift_dynamicCast();
    sub_1000098EC(v6, v7);
    sub_1000098EC(v7, v40);
    sub_1000098EC(v40, &v38);
    unint64_t result = sub_100008160(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      BOOL v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      long long v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *long long v17 = v35;
      v17[1] = v36;
      char v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_1000054FC((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1000098EC(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1000098EC(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id sub_100007AA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super dealloc];
}

uint64_t type metadata accessor for NewsEngagementPluginProvider()
{
  return self;
}

uint64_t sub_100007B08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007BDC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009890((uint64_t)v12, *a3);
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
      sub_100009890((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000054FC((uint64_t)v12);
  return v7;
}

uint64_t sub_100007BDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009F88();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007D98(a5, a6);
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
  uint64_t v8 = sub_100009FC8();
  if (!v8)
  {
    sub_100009FE8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A008();
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

uint64_t sub_100007D98(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007E30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008010(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008010(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007E30(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007FA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009FB8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009FE8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009EE8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A008();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009FE8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007FA8(uint64_t a1, uint64_t a2)
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
  sub_100005420(&qword_100010738);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008010(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005420(&qword_100010738);
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
  uint64_t result = sub_10000A008();
  __break(1u);
  return result;
}

unint64_t sub_100008160(uint64_t a1, uint64_t a2)
{
  sub_10000A0B8();
  sub_100009EC8();
  Swift::Int v4 = sub_10000A0D8();

  return sub_1000081D8(a1, a2, v4);
}

unint64_t sub_1000081D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A058() & 1) == 0)
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
      while (!v14 && (sub_10000A058() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000082BC(void *a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v55 = a2;
  uint64_t v61 = sub_100009E78();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  v59 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100009F48();
  uint64_t v52 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  v53 = (char *)v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009F38();
  __chkstk_darwin(v7);
  uint64_t v58 = sub_100009E98();
  uint64_t v57 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  v56 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100009E68();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = swift_allocObject();
  *(void *)(v62 + 16) = a3;
  _Block_copy(a3);
  if (qword_1000104B8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100009440(v9, (uint64_t)qword_100011730);
  BOOL v14 = sub_100009E48();
  os_log_type_t v15 = sub_100009F28();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    v51 = a1;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received request.", v16, 2u);
    a1 = v51;
    swift_slowDealloc();
  }

  long long v17 = self;
  sub_100005464(a1, a1[3]);
  LODWORD(v17) = [v17 isValidJSONObject:sub_10000A048()];
  swift_unknownObjectRelease();
  if (!v17)
  {
    *(void *)&long long aBlock = 0;
    *((void *)&aBlock + 1) = 0xE000000000000000;
    v71._countAndFlagsBits = 91;
    v71._object = (void *)0xE100000000000000;
    sub_100009ED8(v71);
    sub_100009FD8();
    v72._countAndFlagsBits = 93;
    v72._object = (void *)0xE100000000000000;
    sub_100009ED8(v72);
    long long v18 = aBlock;
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_100009E48();
    os_log_type_t v20 = sub_100009F18();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)unint64_t v21 = 136315138;
      swift_bridgeObjectRetain();
      v69[0] = sub_100007B08(v18, *((unint64_t *)&v18 + 1), (uint64_t *)&aBlock);
      sub_100009F78();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Invalid input = %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_100009478();
    long long aBlock = 0u;
    long long v65 = 0u;
    swift_allocError();
    *int64_t v22 = 2;
LABEL_11:
    sub_100009904((uint64_t)&aBlock, (uint64_t)v69, &qword_1000106A8);
    uint64_t v23 = v70;
    if (v70)
    {
      unint64_t v24 = sub_100005464(v69, v70);
      uint64_t v25 = *(void *)(v23 - 8);
      __chkstk_darwin(v24);
      unint64_t v27 = (char *)v49 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v25 + 16))(v27);
      uint64_t v28 = sub_10000A048();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v23);
      sub_1000054FC((uint64_t)v69);
    }
    else
    {
      uint64_t v28 = 0;
    }
    BOOL v29 = (void *)sub_100009D78();
    ((void (**)(void, uint64_t, void *))a3)[2](a3, v28, v29);
    swift_unknownObjectRelease();

    swift_errorRelease();
    sub_100009968((uint64_t)&aBlock, &qword_1000106A8);
    return swift_release();
  }
  sub_100009D68();
  swift_allocObject();
  sub_100009D58();
  char v30 = sub_100006328(a1, 0);
  swift_release();
  if (qword_1000104B0 != -1) {
    swift_once();
  }
  sub_100006568((uint64_t *)&aBlock);
  swift_beginAccess();
  sub_1000094CC((uint64_t)&aBlock, (uint64_t)&xmmword_100010590);
  swift_endAccess();
  sub_100009904((uint64_t)&xmmword_100010590, (uint64_t)&aBlock, &qword_1000106B0);
  if (!*((void *)&v65 + 1))
  {
    sub_100009968((uint64_t)&aBlock, &qword_1000106B0);
    uint64_t v35 = sub_100009E48();
    os_log_type_t v36 = sub_100009F18();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Failed to instantiate manager", v37, 2u);
      swift_slowDealloc();
    }

    sub_100009478();
    long long aBlock = 0u;
    long long v65 = 0u;
    swift_allocError();
    unsigned char *v38 = 0;
    goto LABEL_11;
  }
  sub_100009534(&aBlock, (uint64_t)v69);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  int64_t v31 = sub_100009E48();
  os_log_type_t v32 = sub_100009F28();
  if (os_log_type_enabled(v31, v32))
  {
    int64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(void *)&v68[0] = v50;
    v51 = (void *)v10;
    *(_DWORD *)int64_t v33 = 136380675;
    *(void *)&long long aBlock = 0;
    *((void *)&aBlock + 1) = 0xE000000000000000;
    v73._countAndFlagsBits = 0x646E616D6D6F635BLL;
    v73._object = (void *)0xEA0000000000203ALL;
    sub_100009ED8(v73);
    LOBYTE(v63) = v30;
    sub_100009FD8();
    v49[1] = v33 + 4;
    v74._countAndFlagsBits = 93;
    v74._object = (void *)0xE100000000000000;
    sub_100009ED8(v74);
    *(void *)&long long aBlock = sub_100007B08(aBlock, *((unint64_t *)&aBlock + 1), (uint64_t *)v68);
    sub_100009F78();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "performRequest: receivedRequest = %{private}s", v33, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    ((void (*)(char *, uint64_t))v51[1])(v12, v9);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  unint64_t v39 = 0xD000000000000016;
  unint64_t v40 = 0x800000010000A470;
  switch(v30)
  {
    case 1:
      unint64_t v39 = 0xD000000000000017;
      uint64_t v41 = "queryNewsPlusEngagement";
      goto LABEL_29;
    case 2:
      unint64_t v39 = 0xD000000000000018;
      uint64_t v41 = "queryLocalNewsEngagement";
      goto LABEL_29;
    case 3:
      unint64_t v39 = 0xD00000000000001CLL;
      uint64_t v41 = "queryNewsPlusAudioEngagement";
LABEL_29:
      unint64_t v40 = (unint64_t)(v41 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  sub_10000954C();
  unint64_t v42 = v56;
  sub_100009E88();
  *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
  sub_1000096AC(&qword_1000106C0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005420(&qword_1000106C8);
  sub_1000096F4(&qword_1000106D0, &qword_1000106C8);
  sub_100009FA8();
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v53, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v54);
  v43 = (void *)sub_100009F68();
  sub_1000095D4((uint64_t)v69, (uint64_t)v68);
  v44 = (void *)swift_allocObject();
  sub_100009534(v68, (uint64_t)(v44 + 2));
  v44[7] = v39;
  v44[8] = v40;
  uint64_t v45 = v62;
  v44[9] = sub_100009438;
  v44[10] = v45;
  v44[11] = v55;
  v66 = sub_100009680;
  v67 = v44;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v65 = sub_100007274;
  *((void *)&v65 + 1) = &unk_10000CB28;
  v46 = _Block_copy(&aBlock);
  swift_retain();
  sub_100009E88();
  v63 = &_swiftEmptyArrayStorage;
  sub_1000096AC(&qword_1000106D8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005420(&qword_1000106E0);
  sub_1000096F4(&qword_1000106E8, &qword_1000106E0);
  uint64_t v47 = v59;
  uint64_t v48 = v61;
  sub_100009FA8();
  sub_100009F58();
  _Block_release(v46);

  (*(void (**)(char *, uint64_t))(v60 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v58);
  sub_1000054FC((uint64_t)v69);
  swift_release();
  return swift_release();
}

uint64_t sub_100009400()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100009438(uint64_t a1, void *a2)
{
  sub_100007338(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100009440(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100009478()
{
  unint64_t result = qword_1000106A0;
  if (!qword_1000106A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000106A0);
  }
  return result;
}

uint64_t sub_1000094CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005420(&qword_1000106B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009534(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_10000954C()
{
  unint64_t result = qword_1000106B8;
  if (!qword_1000106B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000106B8);
  }
  return result;
}

uint64_t sub_10000958C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000095D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009638()
{
  sub_1000054FC(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_100009680()
{
  return sub_100006A40(v0 + 2, v0[7], v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_100009694(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000096A4()
{
  return swift_release();
}

uint64_t sub_1000096AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000096F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000958C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009744()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100009784(uint64_t a1)
{
  return sub_100006BD0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *, void))(v1 + 32), *(void *)(v1 + 40));
}

unint64_t sub_100009794()
{
  v6[3] = sub_100005420(&qword_1000106F8);
  v6[0] = &_swiftEmptyDictionarySingleton;
  sub_100005420(&qword_100010700);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000AE40;
  *(void *)(inited + 32) = 0x65736E6F70736572;
  *(void *)(inited + 40) = 0xE800000000000000;
  sub_100009890((uint64_t)v6, inited + 48);
  unint64_t v1 = sub_1000074A4(inited);
  sub_100005420(&qword_100010708);
  uint64_t v2 = swift_initStackObject();
  *(_OWORD *)(v2 + 16) = xmmword_10000AE40;
  strcpy((char *)(v2 + 32), "json-payload");
  *(unsigned char *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  *(void *)(v2 + 48) = v1;
  unint64_t v3 = sub_1000075DC(v2);
  unint64_t v4 = sub_1000076F8(v3);
  swift_bridgeObjectRelease();
  sub_1000054FC((uint64_t)v6);
  return v4;
}

uint64_t sub_100009890(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1000098EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000098FC()
{
  return swift_release();
}

uint64_t sub_100009904(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005420(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009968(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005420(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000099C4()
{
  unint64_t result = qword_100010730;
  if (!qword_100010730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010730);
  }
  return result;
}

uint64_t sub_100009A18(uint64_t a1, unint64_t a2)
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

uint64_t getEnumTagSinglePayload for NewsEngagementPluginError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NewsEngagementPluginError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009BD0);
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

ValueMetadata *type metadata accessor for NewsEngagementPluginError()
{
  return &type metadata for NewsEngagementPluginError;
}

unint64_t sub_100009C0C()
{
  unint64_t result = qword_100010740;
  if (!qword_100010740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010740);
  }
  return result;
}

uint64_t sub_100009C60()
{
  uint64_t v0 = sub_100009E68();
  sub_100009CE4(v0, qword_100011730);
  sub_100009440(v0, (uint64_t)qword_100011730);
  return sub_100009E58();
}

uint64_t *sub_100009CE4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009D48()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100009D58()
{
  return JSONDecoder.init()();
}

uint64_t sub_100009D68()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100009D78()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100009D88()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009D98()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_100009DA8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009DB8()
{
  return type metadata accessor for URL();
}

uint64_t sub_100009DC8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009DD8()
{
  return EngagementDataManager.init(config:)();
}

uint64_t sub_100009DE8()
{
  return type metadata accessor for EngagementDataManager();
}

uint64_t sub_100009DF8()
{
  return EngagementDataManagerConfig.init(localStorageDirectory:)();
}

uint64_t sub_100009E08()
{
  return type metadata accessor for EngagementDataManagerConfig();
}

uint64_t sub_100009E18()
{
  return dispatch thunk of EngagementCollectorManagerType.getProperties(propertyName:completion:)();
}

uint64_t sub_100009E28()
{
  return StatePropertyValue.value.getter();
}

uint64_t sub_100009E38()
{
  return type metadata accessor for StatePropertyValue();
}

uint64_t sub_100009E48()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009E58()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009E68()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009E78()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100009E88()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100009E98()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100009EA8()
{
  return Dictionary.description.getter();
}

NSString sub_100009EB8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009EC8()
{
  return String.hash(into:)();
}

void sub_100009ED8(Swift::String a1)
{
}

Swift::Int sub_100009EE8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009EF8()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100009F08()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100009F18()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009F28()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009F38()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100009F48()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100009F58()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100009F68()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100009F78()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009F88()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009F98()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100009FA8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100009FB8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009FC8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009FD8()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100009FE8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009FF8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000A008()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000A018(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A028()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10000A038()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10000A048()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10000A058()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A068()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A078()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000A088()
{
  return Error._code.getter();
}

uint64_t sub_10000A098()
{
  return Error._domain.getter();
}

uint64_t sub_10000A0A8()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A0B8()
{
  return Hasher.init(_seed:)();
}

void sub_10000A0C8(Swift::UInt a1)
{
}

Swift::Int sub_10000A0D8()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A0E8()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000A0F8()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}