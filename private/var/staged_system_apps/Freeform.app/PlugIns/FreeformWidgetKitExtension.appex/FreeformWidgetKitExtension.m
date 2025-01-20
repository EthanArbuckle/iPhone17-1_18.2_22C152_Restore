void sub_1000047E0(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void v6[15];
  void v7[15];

  v6[0] = @"CRLSnapToGrid";
  v6[1] = @"CRLDisplayEdgeGuides";
  v7[0] = &__kCFBooleanFalse;
  v7[1] = &__kCFBooleanFalse;
  v6[2] = @"CRLDisplayCenterGuides";
  v6[3] = @"CRLDisplaySpacingGuides";
  v7[2] = &__kCFBooleanTrue;
  v7[3] = &__kCFBooleanTrue;
  v6[4] = @"CRLDisplaySizingGuides";
  v6[5] = @"CRLUseHapticFeedbackWhenSnapping";
  v6[6] = @"CRLEncryptSharePlayData";
  v6[7] = @"CRLDeleteBoardCleanupTolerance";
  v7[6] = &__kCFBooleanTrue;
  v7[7] = &off_1000258D0;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[8] = @"CRLDeletedBoardTTL";
  v6[9] = @"CRLSelectAndScrollWithApplePencil";
  v7[8] = &off_1000258E8;
  v7[9] = &__kCFBooleanFalse;
  v6[10] = @"CRLMathRecognitionMode";
  v6[11] = @"CRLAppAnalyticsResetIdentifier";
  v7[10] = &off_100025900;
  v7[11] = &__kCFBooleanFalse;
  v6[12] = @"enableOSSignpost";
  v6[13] = @"CRLMultiSelectionShouldDisplaySingleBoundsUserDefault";
  v7[12] = &__kCFBooleanFalse;
  v7[13] = &__kCFBooleanTrue;
  v6[14] = @"CRLRulerUnitTypeUserDefault";
  v1 = +[NSLocale currentLocale];
  if ([v1 usesMetricSystem]) {
    v2 = 1;
  }
  else {
    v2 = 2;
  }
  v3 = +[NSNumber numberWithUnsignedInteger:v2];
  v7[14] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:15];
  v5 = (void *)qword_100028D90;
  qword_100028D90 = v4;
}

unint64_t sub_1000049FC()
{
  unint64_t result = qword_100028328;
  if (!qword_100028328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028328);
  }
  return result;
}

uint64_t sub_100004A50()
{
  return sub_100007098(&qword_100028330, &qword_100028338);
}

uint64_t sub_100004A8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004AD4()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DAD8);
  sub_100006F40(v0, (uint64_t)qword_10002DAD8);
  return sub_10001BDB0();
}

uint64_t sub_100004B38()
{
  uint64_t v0 = sub_100006EFC(&qword_100028468);
  sub_100006F78(v0, qword_10002DAF0);
  uint64_t v1 = sub_100006F40(v0, (uint64_t)qword_10002DAF0);
  sub_10001BBB0();
  uint64_t v2 = sub_10001BBC0();
  v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100004BF0()
{
  uint64_t result = swift_getKeyPath();
  qword_10002DB08 = result;
  return result;
}

uint64_t sub_100004C1C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100004C28()
{
  sub_10001B9E0();
  return v1;
}

uint64_t sub_100004C5C()
{
  sub_10001B9E0();
  return v1;
}

uint64_t sub_100004C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_100004CB4, 0, 0);
}

uint64_t sub_100004CB4()
{
  sub_10001B9E0();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_10001B9E0();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_1000281F0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002DB08;
  *(void *)(v0 + 80) = qword_10002DB08;
  swift_retain();
  v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_100007098(&qword_100028448, &qword_100028450);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_100004E10;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_100004E10()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000521C;
  }
  else {
    uint64_t v2 = sub_100004F64;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004F64()
{
  sub_10001B9E0();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10002DB08;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100005040;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_100005040()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005234;
  }
  else {
    uint64_t v2 = sub_100005194;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005194()
{
  *(unsigned char *)(v0 + 147) = *(unsigned char *)(v0 + 144);
  sub_1000070DC();
  sub_10001B9B0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000521C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005234()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000524C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100005288()
{
  return swift_release();
}

uint64_t (*sub_1000052D0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001B9D0();
  return sub_10000532C;
}

uint64_t sub_100005330@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_10000536C()
{
  return sub_10001B9F0();
}

uint64_t (*sub_1000053A4(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001B9D0();
  return sub_10000532C;
}

void sub_100005400(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_10000544C()
{
  if (qword_1000281F0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000054AC()
{
  return 0xD000000000000015;
}

unint64_t sub_1000054D0()
{
  unint64_t result = qword_100028340;
  if (!qword_100028340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028340);
  }
  return result;
}

unint64_t sub_100005528()
{
  unint64_t result = qword_100028348;
  if (!qword_100028348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028348);
  }
  return result;
}

uint64_t sub_10000557C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000055B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005600@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000281E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BDC0();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DAD8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000056B8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000281E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028468);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DAF0);

  return sub_100007130(v3, a1);
}

uint64_t sub_100005734(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000057E8;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_100004CB4, 0, 0);
}

uint64_t sub_1000057E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000058DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006ABC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100005904()
{
  return 0xD000000000000028;
}

unint64_t sub_100005924()
{
  unint64_t result = qword_100028358;
  if (!qword_100028358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028358);
  }
  return result;
}

unint64_t sub_10000597C()
{
  unint64_t result = qword_100028360;
  if (!qword_100028360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028360);
  }
  return result;
}

uint64_t sub_1000059D0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000059F0, 0, 0);
}

uint64_t sub_1000059F0()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_100017B94() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100005A98(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_100005ABC, 0, 0);
}

uint64_t sub_100005ABC()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_10002DB40;
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  uint64_t v2 = sub_10001BF40();
  sub_10001BED0();
  NSString v3 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  [v1 setObject:v2 forKey:v3];

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100005BBC()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  if (qword_100028200 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001BD70();
  sub_100006F40(v9, (uint64_t)qword_10002DB28);
  swift_beginAccess();
  sub_10001BD60();
  swift_endAccess();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001BBE0();
  uint64_t v10 = sub_10001BBF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_100006EFC(&qword_100028418);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001DC70;
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BDB0();
  return sub_10001BC10();
}

uint64_t sub_100005F30()
{
  uint64_t v0 = sub_100006EFC(&qword_100028370);
  sub_100006F78(v0, qword_10002DB10);
  sub_100006F40(v0, (uint64_t)qword_10002DB10);
  sub_100006FDC();
  return sub_10001BC50();
}

uint64_t sub_100005FAC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001BDC0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000603C, 0, 0);
}

uint64_t sub_10000603C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100006EFC(&qword_100028338);
  sub_10001BDB0();
  sub_100007098(&qword_100028448, &qword_100028450);
  *uint64_t v1 = sub_10001BDA0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100006150()
{
  uint64_t v0 = sub_10001BD70();
  sub_100006F78(v0, qword_10002DB28);
  sub_100006F40(v0, (uint64_t)qword_10002DB28);
  return sub_10001BD50();
}

uint64_t sub_1000061B8()
{
  sub_100005924();

  return sub_10001BD40();
}

uint64_t sub_100006214()
{
  return sub_100007098(&qword_100028368, &qword_100028370);
}

uint64_t sub_100006250()
{
  uint64_t v0 = qword_100028208;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000628C()
{
  unint64_t result = qword_100028378;
  if (!qword_100028378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028378);
  }
  return result;
}

unint64_t sub_1000062E4()
{
  unint64_t result = qword_100028380;
  if (!qword_100028380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028380);
  }
  return result;
}

unint64_t sub_10000633C()
{
  unint64_t result = qword_100028388;
  if (!qword_100028388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028388);
  }
  return result;
}

uint64_t sub_100006390()
{
  return sub_100007098((unint64_t *)&unk_100028390, &qword_100028370);
}

void *sub_1000063CC()
{
  return &protocol witness table for String;
}

uint64_t sub_1000063D8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000281F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028370);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DB10);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100006484()
{
  sub_100007030();
  uint64_t v2 = sub_10001BCF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_10000651C()
{
  unint64_t result = qword_1000283A0;
  if (!qword_1000283A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000283A0);
  }
  return result;
}

unint64_t sub_100006574()
{
  unint64_t result = qword_1000283A8;
  if (!qword_1000283A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000283A8);
  }
  return result;
}

unint64_t sub_1000065CC()
{
  unint64_t result = qword_1000283B0;
  if (!qword_1000283B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000283B0);
  }
  return result;
}

unint64_t sub_100006624()
{
  unint64_t result = qword_1000283B8;
  if (!qword_1000283B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000283B8);
  }
  return result;
}

void *sub_100006678()
{
  return &protocol witness table for String;
}

uint64_t sub_100006684@<X0>(uint64_t *a1@<X8>)
{
  sub_100006FDC();
  uint64_t result = sub_10001B9C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000066C8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028200 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DB28);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100006788()
{
  return sub_100007098(&qword_1000283C0, &qword_1000283C8);
}

uint64_t sub_1000067C4(uint64_t a1)
{
  unint64_t v2 = sub_100005924();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006814()
{
  unint64_t result = qword_1000283D0;
  if (!qword_1000283D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000283D0);
  }
  return result;
}

uint64_t sub_10000686C(uint64_t a1)
{
  unint64_t v2 = sub_100006624();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SnapToGridSettingEntity()
{
  return &type metadata for SnapToGridSettingEntity;
}

uint64_t destroy for SnapToGridSettingEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s26FreeformWidgetKitExtension23SnapToGridSettingEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SnapToGridSettingEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SnapToGridSettingEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SnapToGridSettingEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnapToGridSettingEntity.UpdateIntent_value(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SnapToGridSettingEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnapToGridSettingEntity.UpdateIntent_value()
{
  return &type metadata for SnapToGridSettingEntity.UpdateIntent_value;
}

uint64_t sub_100006A80()
{
  return sub_100007098(&qword_1000283D8, &qword_1000283E0);
}

uint64_t sub_100006ABC()
{
  sub_100006EFC(&qword_1000283E8);
  ((void (*)(void))__chkstk_darwin)();
  v28 = (char *)&v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10001BCE0();
  uint64_t v1 = *(void *)(v29 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006EFC(&qword_1000283F0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v11;
  uint64_t v12 = sub_10001BDC0();
  uint64_t v27 = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v22 = sub_100006EFC(&qword_100028400);
  sub_10001BDB0();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  uint64_t v31 = 0;
  uint64_t v14 = sub_10001B9A0();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  unsigned int v25 = enum case for InputConnectionBehavior.default(_:);
  v16 = *(void (**)(void))(v1 + 104);
  uint64_t v23 = v1 + 104;
  v24 = (void (*)(char *, void, uint64_t))v16;
  v16(v3);
  sub_100005924();
  v17 = v21;
  uint64_t v22 = sub_10001BA20();
  sub_100006EFC(&qword_100028408);
  sub_10001BDB0();
  v26(v17, 1, 1, v27);
  char v30 = 2;
  uint64_t v18 = sub_10001BEF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v28, 1, 1, v18);
  v15(v8, 1, 1, v14);
  v24(v3, v25, v29);
  sub_10001BA30();
  return v22;
}

uint64_t sub_100006EFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006F40(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006F78(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100006FDC()
{
  unint64_t result = qword_100028420;
  if (!qword_100028420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028420);
  }
  return result;
}

unint64_t sub_100007030()
{
  unint64_t result = qword_100028428;
  if (!qword_100028428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028428);
  }
  return result;
}

uint64_t sub_100007084(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100007098(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004A8C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000070DC()
{
  unint64_t result = qword_100028460;
  if (!qword_100028460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028460);
  }
  return result;
}

uint64_t sub_100007130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006EFC(&qword_100028468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for EdgeGuidesToggleControl()
{
  return &type metadata for EdgeGuidesToggleControl;
}

uint64_t sub_1000071A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000071C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100006EFC(&qword_100028470);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006EFC(&qword_100028478);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006EFC(&qword_100028480);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006EFC(&qword_100028488);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000077B4();
  sub_10001BE90();
  sub_10001BDF0();
  unint64_t v16 = sub_100007808();
  sub_10001BE20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10001BDF0();
  uint64_t v31 = v1;
  unint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10001BE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  unint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10001BE30();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  unint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10001BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100007680@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076B8(a1);
}

uint64_t sub_10000769C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076B8(a1);
}

uint64_t sub_1000076B8@<X0>(uint64_t a1@<X8>)
{
  sub_10001BDF0();
  uint64_t result = sub_10001BE40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100007720@<X0>(uint64_t a1@<X8>)
{
  sub_10001BDF0();
  uint64_t result = sub_10001BE40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

unint64_t sub_1000077B4()
{
  unint64_t result = qword_100028490;
  if (!qword_100028490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028490);
  }
  return result;
}

unint64_t sub_100007808()
{
  unint64_t result = qword_100028498;
  if (!qword_100028498)
  {
    sub_100004A8C(&qword_100028470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028498);
  }
  return result;
}

uint64_t sub_100007864()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for SelectAndScrollToggleControl()
{
  return &type metadata for SelectAndScrollToggleControl;
}

uint64_t sub_100007974()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007990@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100006EFC(&qword_100028470);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006EFC(&qword_100028478);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006EFC(&qword_100028480);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006EFC(&qword_100028488);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007EE8();
  sub_10001BE90();
  sub_10001BDF0();
  unint64_t v16 = sub_100007808();
  sub_10001BE20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10001BDF0();
  uint64_t v31 = v1;
  unint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10001BE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  unint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10001BE30();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  unint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10001BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_100007E48@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076B8(a1);
}

uint64_t sub_100007E64@<X0>(uint64_t a1@<X8>)
{
  sub_10001BDF0();
  uint64_t result = sub_10001BE40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

unint64_t sub_100007EE8()
{
  unint64_t result = qword_1000284A0;
  if (!qword_1000284A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284A0);
  }
  return result;
}

void sub_100007F3C()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_10001BEC0();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2) {
    qword_10002DB40 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_100007FB4()
{
  return sub_10001BED0();
}

unint64_t sub_100007FD0()
{
  unint64_t result = qword_1000284B8;
  if (!qword_1000284B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284B8);
  }
  return result;
}

uint64_t sub_100008024()
{
  return sub_100007098(&qword_1000284C0, &qword_1000284C8);
}

uint64_t sub_100008060()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DB48);
  sub_100006F40(v0, (uint64_t)qword_10002DB48);
  return sub_10001BDB0();
}

uint64_t sub_1000080C4()
{
  uint64_t v0 = sub_100006EFC(&qword_100028468);
  sub_100006F78(v0, qword_10002DB60);
  uint64_t v1 = sub_100006F40(v0, (uint64_t)qword_10002DB60);
  sub_10001BBB0();
  uint64_t v2 = sub_10001BBC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000817C()
{
  uint64_t result = swift_getKeyPath();
  qword_10002DB78 = result;
  return result;
}

uint64_t sub_1000081A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_1000081C8, 0, 0);
}

uint64_t sub_1000081C8()
{
  sub_10001B9E0();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_10001B9E0();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_100028230 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002DB78;
  *(void *)(v0 + 80) = qword_10002DB78;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_100007098(&qword_100028590, &qword_100028598);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_100008324;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_100008324()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000521C;
  }
  else {
    uint64_t v2 = sub_100008478;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008478()
{
  sub_10001B9E0();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10002DB78;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100005040;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_100008554()
{
  if (qword_100028230 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000085B4()
{
  unint64_t result = qword_1000284D0;
  if (!qword_1000284D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284D0);
  }
  return result;
}

unint64_t sub_10000860C()
{
  unint64_t result = qword_1000284D8;
  if (!qword_1000284D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284D8);
  }
  return result;
}

uint64_t sub_100008660()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100008694()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000086E4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028220 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BDC0();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DB48);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000878C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028228 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028468);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DB60);

  return sub_100007130(v3, a1);
}

uint64_t sub_100008808(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000057E8;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_1000081C8, 0, 0);
}

uint64_t sub_1000088BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009810();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000088E4()
{
  return 0xD00000000000002DLL;
}

unint64_t sub_100008904()
{
  unint64_t result = qword_1000284E8;
  if (!qword_1000284E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284E8);
  }
  return result;
}

unint64_t sub_10000895C()
{
  unint64_t result = qword_1000284F0;
  if (!qword_1000284F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000284F0);
  }
  return result;
}

uint64_t sub_1000089B0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000089D0, 0, 0);
}

uint64_t sub_1000089D0()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_100017B94() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100008A78(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_100008A9C, 0, 0);
}

uint64_t sub_100008A9C()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_10002DB40;
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  uint64_t v2 = sub_10001BF40();
  sub_10001BED0();
  NSString v3 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  [v1 setObject:v2 forKey:v3];

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100008B9C()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  if (qword_100028240 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001BD70();
  sub_100006F40(v9, (uint64_t)qword_10002DB98);
  swift_beginAccess();
  sub_10001BD60();
  swift_endAccess();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001BBE0();
  uint64_t v10 = sub_10001BBF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_10001BDB0();
  return sub_10001BC10();
}

uint64_t sub_100008E50()
{
  uint64_t v0 = sub_100006EFC(&qword_100028500);
  sub_100006F78(v0, qword_10002DB80);
  sub_100006F40(v0, (uint64_t)qword_10002DB80);
  sub_100007EE8();
  return sub_10001BC50();
}

uint64_t sub_100008ECC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001BDC0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100008F5C, 0, 0);
}

uint64_t sub_100008F5C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100006EFC(&qword_1000284C8);
  sub_10001BDB0();
  sub_100007098(&qword_100028590, &qword_100028598);
  *uint64_t v1 = sub_10001BDA0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000906C()
{
  uint64_t v0 = sub_10001BD70();
  sub_100006F78(v0, qword_10002DB98);
  sub_100006F40(v0, (uint64_t)qword_10002DB98);
  return sub_10001BD50();
}

uint64_t sub_1000090D0()
{
  sub_100008904();

  return sub_10001BD40();
}

uint64_t sub_10000912C()
{
  return sub_100007098(&qword_1000284F8, &qword_100028500);
}

uint64_t sub_100009168()
{
  uint64_t v0 = qword_1000284A8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000091A4()
{
  unint64_t result = qword_100028508;
  if (!qword_100028508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028508);
  }
  return result;
}

unint64_t sub_1000091FC()
{
  unint64_t result = qword_100028510;
  if (!qword_100028510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028510);
  }
  return result;
}

unint64_t sub_100009254()
{
  unint64_t result = qword_100028518;
  if (!qword_100028518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028518);
  }
  return result;
}

uint64_t sub_1000092A8()
{
  return sub_100007098((unint64_t *)&unk_100028520, &qword_100028500);
}

uint64_t sub_1000092E4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028238 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028500);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DB80);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100009390()
{
  sub_100009C50();
  uint64_t v2 = sub_10001BCF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_100009428()
{
  unint64_t result = qword_100028530;
  if (!qword_100028530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028530);
  }
  return result;
}

unint64_t sub_100009480()
{
  unint64_t result = qword_100028538;
  if (!qword_100028538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028538);
  }
  return result;
}

unint64_t sub_1000094D8()
{
  unint64_t result = qword_100028540;
  if (!qword_100028540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028540);
  }
  return result;
}

unint64_t sub_100009530()
{
  unint64_t result = qword_100028548;
  if (!qword_100028548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028548);
  }
  return result;
}

uint64_t sub_100009584@<X0>(uint64_t *a1@<X8>)
{
  sub_100007EE8();
  uint64_t result = sub_10001B9C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000095C4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028240 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DB98);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100009684()
{
  return sub_100007098(&qword_100028550, &qword_100028558);
}

uint64_t sub_1000096C0(uint64_t a1)
{
  unint64_t v2 = sub_100008904();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009710()
{
  unint64_t result = qword_100028560;
  if (!qword_100028560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028560);
  }
  return result;
}

uint64_t sub_100009768(uint64_t a1)
{
  unint64_t v2 = sub_100009530();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SelectAndScrollSettingEntity()
{
  return &type metadata for SelectAndScrollSettingEntity;
}

ValueMetadata *type metadata accessor for SelectAndScrollSettingEntity.UpdateIntent_value()
{
  return &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value;
}

uint64_t sub_1000097D4()
{
  return sub_100007098(&qword_1000283D8, &qword_1000283E0);
}

uint64_t sub_100009810()
{
  uint64_t v0 = sub_100006EFC(&qword_1000283E8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10001BCE0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006EFC(&qword_1000283F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10001BDC0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100006EFC(&qword_100028568);
  sub_10001BDB0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10001B9A0();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100008904();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10001BA20();
  sub_100006EFC(&qword_100028408);
  sub_10001BDB0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10001BEF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10001BA30();
  return v24;
}

unint64_t sub_100009C50()
{
  unint64_t result = qword_100028570;
  if (!qword_100028570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028570);
  }
  return result;
}

uint64_t sub_100009CA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100009CB0()
{
  uint64_t v0 = sub_10001BD70();
  sub_100006F78(v0, qword_10002DBB0);
  sub_100006F40(v0, (uint64_t)qword_10002DBB0);
  return sub_10001BD50();
}

unint64_t sub_100009D14()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v53 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v67 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v76 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v53 - v10;
  sub_100006EFC(&qword_100028628);
  uint64_t v12 = sub_100006EFC(&qword_100028630);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v71 = *(void *)(v13 + 72);
  uint64_t v14 = v12 - 8;
  uint64_t v77 = v12 - 8;
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v60 = 8 * v71;
  uint64_t v16 = swift_allocObject();
  uint64_t v61 = v16;
  *(_OWORD *)(v16 + 16) = xmmword_10001E6F0;
  unint64_t v17 = v16 + v15 + *(int *)(v14 + 56);
  unint64_t v73 = v16 + v15;
  unint64_t v74 = v17;
  *(unsigned char *)(v16 + v15) = 0;
  sub_10001BDB0();
  sub_10001BDB0();
  uint64_t v18 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
  v7 += 56;
  v70 = v18;
  v18(v5, 0, 1, v6);
  unint64_t v72 = 0x800000010001C570;
  v62 = v2;
  sub_10001BBE0();
  uint64_t v75 = sub_10001BBF0();
  uint64_t v19 = *(void *)(v75 - 8);
  uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
  uint64_t v78 = v19 + 56;
  v79 = v20;
  v20(v2, 0, 1, v75);
  uint64_t v21 = sub_100006EFC(&qword_100028418);
  uint64_t v22 = *(void *)(v7 + 16);
  uint64_t v23 = *(unsigned __int8 *)(v7 + 24);
  uint64_t v69 = v7;
  uint64_t v24 = 2 * v22;
  uint64_t v64 = (v23 + 32) & ~v23;
  uint64_t v65 = v22;
  uint64_t v66 = v23 | 7;
  uint64_t v57 = v21;
  uint64_t v56 = v64 + 3 * v22;
  uint64_t v25 = swift_allocObject();
  long long v63 = xmmword_10001DC70;
  *(_OWORD *)(v25 + 16) = xmmword_10001DC70;
  sub_10001BDB0();
  sub_10001BDB0();
  uint64_t v55 = v24;
  sub_10001BDB0();
  v68 = v11;
  uint64_t v26 = v62;
  sub_10001BC20();
  unint64_t v27 = v73;
  uint64_t v54 = v73 + v71 + *(int *)(v77 + 56);
  *(unsigned char *)(v73 + v71) = 1;
  sub_10001BDB0();
  unint64_t v74 = 0x800000010001C550;
  sub_10001BDB0();
  uint64_t v28 = v67;
  uint64_t v29 = v70;
  v70(v5, 0, 1, v67);
  sub_10001BBE0();
  uint64_t v30 = v26;
  v79(v26, 0, 1, v75);
  *(_OWORD *)(swift_allocObject() + 16) = v63;
  sub_10001BDB0();
  unint64_t v58 = 0xD000000000000011;
  sub_10001BDB0();
  unint64_t v59 = 0xD000000000000010;
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BC10();
  uint64_t v31 = v71;
  uint64_t v54 = 2 * v71;
  char v32 = (unsigned char *)(v27 + 2 * v71);
  v53 = &v32[*(int *)(v77 + 56)];
  *char v32 = 2;
  sub_10001BDB0();
  sub_10001BDB0();
  uint64_t v33 = v28;
  v29(v5, 0, 1, v28);
  sub_10001BBE0();
  uint64_t v34 = v75;
  v35 = v79;
  v79(v30, 0, 1, v75);
  sub_10001BDB0();
  sub_10001BC10();
  v36 = (unsigned char *)(v73 + v54 + v31);
  uint64_t v37 = v77;
  uint64_t v54 = (uint64_t)&v36[*(int *)(v77 + 56)];
  unsigned char *v36 = 3;
  sub_10001BDB0();
  sub_10001BDB0();
  v38 = v5;
  v39 = v70;
  v70(v38, 0, 1, v33);
  v40 = v62;
  sub_10001BBE0();
  v35(v40, 0, 1, v34);
  sub_10001BDB0();
  sub_10001BC10();
  uint64_t v41 = v71;
  uint64_t v54 = 4 * v71;
  v42 = (unsigned char *)(v73 + 4 * v71);
  v53 = &v42[*(int *)(v37 + 56)];
  unsigned char *v42 = 4;
  sub_10001BDB0();
  sub_10001BDB0();
  uint64_t v43 = v67;
  v39(v38, 0, 1, v67);
  sub_10001BBE0();
  uint64_t v44 = v75;
  v79(v40, 0, 1, v75);
  sub_10001BDB0();
  sub_10001BC10();
  v45 = (unsigned char *)(v73 + v54 + v41);
  uint64_t v54 = (uint64_t)&v45[*(int *)(v37 + 56)];
  unsigned char *v45 = 5;
  sub_10001BDB0();
  sub_10001BDB0();
  v46 = v38;
  v70(v38, 0, 1, v43);
  sub_10001BBE0();
  v79(v40, 0, 1, v44);
  *(_OWORD *)(swift_allocObject() + 16) = v63;
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BC10();
  unint64_t v47 = v73;
  uint64_t v48 = v71;
  v49 = (unsigned char *)(v73 + 6 * v71);
  uint64_t v66 = (uint64_t)&v49[*(int *)(v77 + 56)];
  unsigned char *v49 = 6;
  sub_10001BDB0();
  sub_10001BDB0();
  uint64_t v50 = v67;
  v51 = v70;
  v70(v46, 0, 1, v67);
  sub_10001BBE0();
  v79(v40, 0, 1, v75);
  sub_10001BDB0();
  sub_10001BC10();
  *(unsigned char *)(v47 + v60 - v48) = 7;
  sub_10001BDB0();
  sub_10001BDB0();
  v51(v46, 0, 1, v50);
  sub_10001BBE0();
  v79(v40, 0, 1, v75);
  sub_10001BDB0();
  sub_10001BC10();
  unint64_t result = sub_100010B74(v61);
  qword_10002DBC8 = result;
  return result;
}

uint64_t sub_10000A998()
{
  uint64_t v0 = sub_100006EFC(&qword_100028640);
  sub_100006F78(v0, qword_10002DBD0);
  sub_100006F40(v0, (uint64_t)qword_10002DBD0);
  sub_100006EFC(&qword_100028648);
  uint64_t v1 = *(void *)(sub_100006EFC(&qword_100028650) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001E6F0;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_10000AE90();
  sub_10001BCB0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_10001BCB0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_10001BCB0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_10001BCB0();
  *(unsigned char *)(v5 + 4 * v2) = 4;
  sub_10001BCB0();
  *(unsigned char *)(v5 + 5 * v2) = 5;
  sub_10001BCB0();
  *(unsigned char *)(v5 + 6 * v2) = 6;
  sub_10001BCB0();
  *(unsigned char *)(v5 + 7 * v2) = 7;
  sub_10001BCB0();
  sub_100010D6C(v4);
  return sub_10001BCD0();
}

uint64_t sub_10000AC8C(unsigned __int8 *a1, char *a2)
{
  return sub_100017EE0(*a1, *a2);
}

unint64_t sub_10000AC9C()
{
  unint64_t result = qword_1000285A8;
  if (!qword_1000285A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285A8);
  }
  return result;
}

Swift::Int sub_10000ACF0()
{
  return sub_100018340();
}

uint64_t sub_10000ACFC()
{
  return sub_1000181D4();
}

Swift::Int sub_10000AD04()
{
  return sub_100018340();
}

uint64_t sub_10000AD0C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000B860(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000AD3C(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1953460082;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000073;
      uint64_t v3 = 0x746E69486874616DLL;
      goto LABEL_3;
    case 2:
      strcpy((char *)a1, "centerGuides");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 3:
      *(void *)a1 = 0x6469754765676465;
      *(void *)(a1 + 8) = 0xEA00000000007365;
      break;
    case 4:
      strcpy((char *)a1, "spacingGuides");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    case 5:
      *(void *)a1 = 0x72476F5470616E73;
      *(void *)(a1 + 8) = 0xEA00000000006469;
      break;
    case 6:
      *(void *)a1 = 0x6E417463656C6573;
      *(void *)(a1 + 8) = 0xEF6C6C6F72635364;
      break;
    case 7:
      *(void *)a1 = 0x6564497465736572;
      *(void *)(a1 + 8) = 0xEF7265696669746ELL;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

unint64_t sub_10000AE90()
{
  unint64_t result = qword_1000285B0;
  if (!qword_1000285B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285B0);
  }
  return result;
}

unint64_t sub_10000AEE8()
{
  unint64_t result = qword_1000285B8;
  if (!qword_1000285B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285B8);
  }
  return result;
}

uint64_t sub_10000AF3C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028258 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028640);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DBD0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000AFEC()
{
  unint64_t result = qword_1000285C0;
  if (!qword_1000285C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285C0);
  }
  return result;
}

unint64_t sub_10000B044()
{
  unint64_t result = qword_1000285C8;
  if (!qword_1000285C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285C8);
  }
  return result;
}

unint64_t sub_10000B09C()
{
  unint64_t result = qword_1000285D0;
  if (!qword_1000285D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285D0);
  }
  return result;
}

void *sub_10000B0F0()
{
  return &protocol witness table for String;
}

uint64_t sub_10000B0FC()
{
  sub_10000B80C();
  uint64_t v2 = sub_10001BC40();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_10000B194()
{
  unint64_t result = qword_1000285E0;
  if (!qword_1000285E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285E0);
  }
  return result;
}

unint64_t sub_10000B1EC()
{
  unint64_t result = qword_1000285E8;
  if (!qword_1000285E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285E8);
  }
  return result;
}

unint64_t sub_10000B244()
{
  unint64_t result = qword_1000285F0;
  if (!qword_1000285F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285F0);
  }
  return result;
}

unint64_t sub_10000B29C()
{
  unint64_t result = qword_1000285F8;
  if (!qword_1000285F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285F8);
  }
  return result;
}

uint64_t sub_10000B2F4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028248 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DBB0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000B39C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B3EC(uint64_t a1)
{
  unint64_t v2 = sub_10000AE90();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000B43C()
{
  unint64_t result = qword_100028600;
  if (!qword_100028600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028600);
  }
  return result;
}

unint64_t sub_10000B494()
{
  unint64_t result = qword_100028608;
  if (!qword_100028608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028608);
  }
  return result;
}

unint64_t sub_10000B4EC()
{
  unint64_t result = qword_100028610;
  if (!qword_100028610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028610);
  }
  return result;
}

uint64_t sub_10000B540()
{
  if (qword_100028250 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B59C(uint64_t a1)
{
  unint64_t v2 = sub_10000B29C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000B5EC()
{
  unint64_t result = qword_100028618;
  if (!qword_100028618)
  {
    sub_100004A8C(&qword_100028620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028618);
  }
  return result;
}

void sub_10000B648(void *a1@<X8>)
{
  *a1 = &off_100024FF8;
}

unsigned char *initializeBufferWithCopyOfBuffer for FreeformSettingsDeepLinks(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FreeformSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FreeformSettingsDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x10000B7C4);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_10000B7EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000B7F4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FreeformSettingsDeepLinks()
{
  return &type metadata for FreeformSettingsDeepLinks;
}

unint64_t sub_10000B80C()
{
  unint64_t result = qword_100028638;
  if (!qword_100028638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028638);
  }
  return result;
}

uint64_t sub_10000B860(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100024F18;
  v6._object = a2;
  unint64_t v4 = sub_10001BF20(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000B8B0()
{
  unint64_t result = qword_100028668;
  if (!qword_100028668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028668);
  }
  return result;
}

uint64_t sub_10000B904()
{
  return sub_100007098(&qword_100028670, &qword_100028678);
}

uint64_t sub_10000B940()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DBE8);
  sub_100006F40(v0, (uint64_t)qword_10002DBE8);
  return sub_10001BDB0();
}

uint64_t sub_10000B9A4()
{
  uint64_t v0 = sub_100006EFC(&qword_100028468);
  sub_100006F78(v0, qword_10002DC00);
  uint64_t v1 = sub_100006F40(v0, (uint64_t)qword_10002DC00);
  sub_10001BBB0();
  uint64_t v2 = sub_10001BBC0();
  Swift::OpaquePointer v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000BA5C()
{
  uint64_t result = swift_getKeyPath();
  qword_10002DC18 = result;
  return result;
}

uint64_t sub_10000BA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_10000BAA8, 0, 0);
}

uint64_t sub_10000BAA8()
{
  sub_10001B9E0();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_10001B9E0();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_100028270 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002DC18;
  *(void *)(v0 + 80) = qword_10002DC18;
  swift_retain();
  Swift::OpaquePointer v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_100007098(&qword_100028748, &qword_100028750);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_10000BC04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000BC04()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000521C;
  }
  else {
    uint64_t v2 = sub_10000BD58;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000BD58()
{
  sub_10001B9E0();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10002DC18;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  Swift::OpaquePointer v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100005040;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_10000BE34()
{
  if (qword_100028270 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000BE94()
{
  unint64_t result = qword_100028680;
  if (!qword_100028680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028680);
  }
  return result;
}

unint64_t sub_10000BEEC()
{
  unint64_t result = qword_100028688;
  if (!qword_100028688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028688);
  }
  return result;
}

uint64_t sub_10000BF40()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000BF74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BFC4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028260 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BDC0();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DBE8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000C06C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028268 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028468);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DC00);

  return sub_100007130(v3, a1);
}

uint64_t sub_10000C0E8(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000057E8;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_10000BAA8, 0, 0);
}

uint64_t sub_10000C19C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000D0C4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000C1C4()
{
  return 0xD00000000000002BLL;
}

unint64_t sub_10000C1E4()
{
  unint64_t result = qword_100028698;
  if (!qword_100028698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028698);
  }
  return result;
}

unint64_t sub_10000C23C()
{
  unint64_t result = qword_1000286A0;
  if (!qword_1000286A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286A0);
  }
  return result;
}

uint64_t sub_10000C290(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000C2B0, 0, 0);
}

uint64_t sub_10000C2B0()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_100017B94() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000C358(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_10000C37C, 0, 0);
}

uint64_t sub_10000C37C()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_10002DB40;
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  uint64_t v2 = sub_10001BF40();
  sub_10001BED0();
  NSString v3 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  [v1 setObject:v2 forKey:v3];

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000C47C()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  if (qword_100028280 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001BD70();
  sub_100006F40(v9, (uint64_t)qword_10002DC38);
  swift_beginAccess();
  sub_10001BD60();
  swift_endAccess();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001BBE0();
  uint64_t v10 = sub_10001BBF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_10001BDB0();
  return sub_10001BC10();
}

uint64_t sub_10000C730()
{
  uint64_t v0 = sub_100006EFC(&qword_1000286B0);
  sub_100006F78(v0, qword_10002DC20);
  sub_100006F40(v0, (uint64_t)qword_10002DC20);
  sub_10000D504();
  return sub_10001BC50();
}

uint64_t sub_10000C7AC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001BDC0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000C83C, 0, 0);
}

uint64_t sub_10000C83C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100006EFC(&qword_100028678);
  sub_10001BDB0();
  sub_100007098(&qword_100028748, &qword_100028750);
  *uint64_t v1 = sub_10001BDA0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000C954()
{
  uint64_t v0 = sub_10001BD70();
  sub_100006F78(v0, qword_10002DC38);
  sub_100006F40(v0, (uint64_t)qword_10002DC38);
  return sub_10001BD50();
}

uint64_t sub_10000C9C0()
{
  sub_10000C1E4();

  return sub_10001BD40();
}

uint64_t sub_10000CA1C()
{
  return sub_100007098(&qword_1000286A8, &qword_1000286B0);
}

uint64_t sub_10000CA58()
{
  uint64_t v0 = qword_100028658;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000CA94()
{
  unint64_t result = qword_1000286B8;
  if (!qword_1000286B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286B8);
  }
  return result;
}

unint64_t sub_10000CAEC()
{
  unint64_t result = qword_1000286C0;
  if (!qword_1000286C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286C0);
  }
  return result;
}

unint64_t sub_10000CB44()
{
  unint64_t result = qword_1000286C8;
  if (!qword_1000286C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286C8);
  }
  return result;
}

uint64_t sub_10000CB98()
{
  return sub_100007098((unint64_t *)&unk_1000286D0, &qword_1000286B0);
}

uint64_t sub_10000CBD4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028278 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_1000286B0);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DC20);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000CC80()
{
  sub_10000D558();
  uint64_t v2 = sub_10001BCF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_10000CD18()
{
  unint64_t result = qword_1000286E0;
  if (!qword_1000286E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286E0);
  }
  return result;
}

unint64_t sub_10000CD70()
{
  unint64_t result = qword_1000286E8;
  if (!qword_1000286E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286E8);
  }
  return result;
}

unint64_t sub_10000CDC8()
{
  unint64_t result = qword_1000286F0;
  if (!qword_1000286F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286F0);
  }
  return result;
}

unint64_t sub_10000CE20()
{
  unint64_t result = qword_1000286F8;
  if (!qword_1000286F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286F8);
  }
  return result;
}

uint64_t sub_10000CE74@<X0>(uint64_t *a1@<X8>)
{
  sub_10000D504();
  uint64_t result = sub_10001B9C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000CEB4@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028280 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DC38);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000CF74()
{
  return sub_100007098(&qword_100028700, &qword_100028708);
}

uint64_t sub_10000CFB0(uint64_t a1)
{
  unint64_t v2 = sub_10000C1E4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000D000()
{
  unint64_t result = qword_100028710;
  if (!qword_100028710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028710);
  }
  return result;
}

uint64_t sub_10000D058(uint64_t a1)
{
  unint64_t v2 = sub_10000CE20();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SpacingGuidesSettingEntity()
{
  return &type metadata for SpacingGuidesSettingEntity;
}

ValueMetadata *type metadata accessor for SpacingGuidesSettingEntity.UpdateIntent_value()
{
  return &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value;
}

uint64_t sub_10000D0C4()
{
  uint64_t v0 = sub_100006EFC(&qword_1000283E8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10001BCE0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006EFC(&qword_1000283F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10001BDC0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100006EFC(&qword_100028718);
  sub_10001BDB0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10001B9A0();
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000C1E4();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10001BA20();
  sub_100006EFC(&qword_100028408);
  sub_10001BDB0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10001BEF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10001BA30();
  return v24;
}

unint64_t sub_10000D504()
{
  unint64_t result = qword_100028720;
  if (!qword_100028720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028720);
  }
  return result;
}

unint64_t sub_10000D558()
{
  unint64_t result = qword_100028728;
  if (!qword_100028728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028728);
  }
  return result;
}

uint64_t sub_10000D5AC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10000D5B8()
{
  uint64_t v0 = sub_100006EFC(&qword_100028768);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000D638()
{
  unint64_t result = qword_100028760;
  if (!qword_100028760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028760);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLWidgetExtensionBundle()
{
  return &type metadata for CRLWidgetExtensionBundle;
}

uint64_t sub_10000D69C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000D6BC()
{
  unint64_t result = qword_100028770;
  if (!qword_100028770)
  {
    sub_100004A8C(&qword_100028778);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028770);
  }
  return result;
}

ValueMetadata *type metadata accessor for SpacingGuidesToggleControl()
{
  return &type metadata for SpacingGuidesToggleControl;
}

uint64_t sub_10000D728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100006EFC(&qword_100028470);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006EFC(&qword_100028478);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006EFC(&qword_100028480);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006EFC(&qword_100028488);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10000D504();
  sub_10001BE90();
  sub_10001BDF0();
  unint64_t v16 = sub_100007808();
  sub_10001BE20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10001BDF0();
  uint64_t v31 = v1;
  unint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10001BE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  unint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10001BE30();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  unint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10001BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000DBFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076B8(a1);
}

unint64_t sub_10000DC24()
{
  unint64_t result = qword_100028790;
  if (!qword_100028790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028790);
  }
  return result;
}

uint64_t sub_10000DC78()
{
  return sub_100007098(&qword_100028798, &qword_1000287A0);
}

uint64_t sub_10000DCB4()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DC50);
  sub_100006F40(v0, (uint64_t)qword_10002DC50);
  return sub_10001BDB0();
}

uint64_t sub_10000DD18()
{
  uint64_t v0 = sub_100006EFC(&qword_100028468);
  sub_100006F78(v0, qword_10002DC68);
  uint64_t v1 = sub_100006F40(v0, (uint64_t)qword_10002DC68);
  sub_10001BBB0();
  uint64_t v2 = sub_10001BBC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000DDD0()
{
  uint64_t result = swift_getKeyPath();
  qword_10002DC80 = result;
  return result;
}

uint64_t sub_10000DDF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_10000DE1C, 0, 0);
}

uint64_t sub_10000DE1C()
{
  sub_10001B9E0();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_10001B9E0();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_100028298 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002DC80;
  *(void *)(v0 + 80) = qword_10002DC80;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_100007098(&qword_100028868, &qword_100028870);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_10000DF78;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000DF78()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000521C;
  }
  else {
    uint64_t v2 = sub_10000E0CC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000E0CC()
{
  sub_10001B9E0();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10002DC80;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100005040;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_10000E1A8()
{
  if (qword_100028298 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000E208()
{
  unint64_t result = qword_1000287A8;
  if (!qword_1000287A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287A8);
  }
  return result;
}

unint64_t sub_10000E260()
{
  unint64_t result = qword_1000287B0;
  if (!qword_1000287B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287B0);
  }
  return result;
}

uint64_t sub_10000E2B4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000E2E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E338@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028288 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BDC0();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DC50);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000E3E0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028290 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028468);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DC68);

  return sub_100007130(v3, a1);
}

uint64_t sub_10000E45C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000057E8;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_10000DE1C, 0, 0);
}

uint64_t sub_10000E510@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000F430();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000E538()
{
  return 0xD000000000000028;
}

unint64_t sub_10000E558()
{
  unint64_t result = qword_1000287C0;
  if (!qword_1000287C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287C0);
  }
  return result;
}

unint64_t sub_10000E5B0()
{
  unint64_t result = qword_1000287C8;
  if (!qword_1000287C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287C8);
  }
  return result;
}

uint64_t sub_10000E604(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000E624, 0, 0);
}

uint64_t sub_10000E624()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_100017B94() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000E6CC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_10000E6F0, 0, 0);
}

uint64_t sub_10000E6F0()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_10002DB40;
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  uint64_t v2 = sub_10001BF40();
  sub_10001BED0();
  NSString v3 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  [v1 setObject:v2 forKey:v3];

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10000E7F0()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  if (qword_1000282A8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001BD70();
  sub_100006F40(v9, (uint64_t)qword_10002DCA0);
  swift_beginAccess();
  sub_10001BD60();
  swift_endAccess();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001BBE0();
  uint64_t v10 = sub_10001BBF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_10001BDB0();
  return sub_10001BC10();
}

uint64_t sub_10000EAA4()
{
  uint64_t v0 = sub_100006EFC(&qword_1000287D8);
  sub_100006F78(v0, qword_10002DC88);
  sub_100006F40(v0, (uint64_t)qword_10002DC88);
  sub_1000077B4();
  return sub_10001BC50();
}

uint64_t sub_10000EB20(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001BDC0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000EBB0, 0, 0);
}

uint64_t sub_10000EBB0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100006EFC(&qword_1000287A0);
  sub_10001BDB0();
  sub_100007098(&qword_100028868, &qword_100028870);
  *uint64_t v1 = sub_10001BDA0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000ECC4()
{
  uint64_t v0 = sub_10001BD70();
  sub_100006F78(v0, qword_10002DCA0);
  sub_100006F40(v0, (uint64_t)qword_10002DCA0);
  return sub_10001BD50();
}

uint64_t sub_10000ED2C()
{
  sub_10000E558();

  return sub_10001BD40();
}

uint64_t sub_10000ED88()
{
  return sub_100007098(&qword_1000287D0, &qword_1000287D8);
}

uint64_t sub_10000EDC4()
{
  uint64_t v0 = qword_100028780;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000EE00()
{
  unint64_t result = qword_1000287E0;
  if (!qword_1000287E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287E0);
  }
  return result;
}

unint64_t sub_10000EE58()
{
  unint64_t result = qword_1000287E8;
  if (!qword_1000287E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287E8);
  }
  return result;
}

unint64_t sub_10000EEB0()
{
  unint64_t result = qword_1000287F0;
  if (!qword_1000287F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287F0);
  }
  return result;
}

uint64_t sub_10000EF04()
{
  return sub_100007098((unint64_t *)&unk_1000287F8, &qword_1000287D8);
}

uint64_t sub_10000EF40@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000282A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_1000287D8);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DC88);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000EFEC()
{
  sub_10000F870();
  uint64_t v2 = sub_10001BCF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_10000F084()
{
  unint64_t result = qword_100028808;
  if (!qword_100028808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028808);
  }
  return result;
}

unint64_t sub_10000F0DC()
{
  unint64_t result = qword_100028810;
  if (!qword_100028810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028810);
  }
  return result;
}

unint64_t sub_10000F134()
{
  unint64_t result = qword_100028818;
  if (!qword_100028818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028818);
  }
  return result;
}

unint64_t sub_10000F18C()
{
  unint64_t result = qword_100028820;
  if (!qword_100028820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028820);
  }
  return result;
}

uint64_t sub_10000F1E0@<X0>(uint64_t *a1@<X8>)
{
  sub_1000077B4();
  uint64_t result = sub_10001B9C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000F220@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000282A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DCA0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000F2E0()
{
  return sub_100007098(&qword_100028828, &qword_100028830);
}

uint64_t sub_10000F31C(uint64_t a1)
{
  unint64_t v2 = sub_10000E558();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000F36C()
{
  unint64_t result = qword_100028838;
  if (!qword_100028838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028838);
  }
  return result;
}

uint64_t sub_10000F3C4(uint64_t a1)
{
  unint64_t v2 = sub_10000F18C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for EdgeGuidesSettingEntity()
{
  return &type metadata for EdgeGuidesSettingEntity;
}

ValueMetadata *type metadata accessor for EdgeGuidesSettingEntity.UpdateIntent_value()
{
  return &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value;
}

uint64_t sub_10000F430()
{
  uint64_t v0 = sub_100006EFC(&qword_1000283E8);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10001BCE0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006EFC(&qword_1000283F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10001BDC0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100006EFC(&qword_100028840);
  sub_10001BDB0();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10001B9A0();
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000E558();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10001BA20();
  sub_100006EFC(&qword_100028408);
  sub_10001BDB0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10001BEF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10001BA30();
  return v24;
}

unint64_t sub_10000F870()
{
  unint64_t result = qword_100028848;
  if (!qword_100028848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028848);
  }
  return result;
}

uint64_t sub_10000F8C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for CenterGuidesToggleControl()
{
  return &type metadata for CenterGuidesToggleControl;
}

uint64_t sub_10000F8E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F8FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100006EFC(&qword_100028470);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006EFC(&qword_100028478);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006EFC(&qword_100028480);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006EFC(&qword_100028488);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10000FDD8();
  sub_10001BE90();
  sub_10001BDF0();
  unint64_t v16 = sub_100007808();
  sub_10001BE20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10001BDF0();
  uint64_t v31 = v1;
  unint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10001BE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  unint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10001BE30();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  unint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10001BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10000FDB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076B8(a1);
}

unint64_t sub_10000FDD8()
{
  unint64_t result = qword_100028880;
  if (!qword_100028880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028880);
  }
  return result;
}

void *sub_10000FE2C()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000FE38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v1 = sub_10001BE70();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100006EFC(&qword_100028888);
  uint64_t v24 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006EFC(&qword_100028890);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  uint64_t v26 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006EFC(&qword_100028898);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  uint64_t v28 = v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006EFC(&qword_1000288A0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v29 = v13;
  uint64_t v30 = v14;
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10001BE60();
  sub_100010828();
  sub_10001087C();
  sub_1000108D0();
  sub_10001BE80();
  sub_10001BDF0();
  unint64_t v17 = sub_100010924();
  sub_10001BE20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v2);
  sub_10001BDF0();
  uint64_t v32 = v2;
  unint64_t v33 = v17;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v19 = v25;
  sub_10001BE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v19);
  uint64_t v32 = v19;
  unint64_t v33 = OpaqueTypeConformance2;
  uint64_t v20 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v27;
  sub_10001BE30();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v21);
  uint64_t v32 = v21;
  unint64_t v33 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v29;
  sub_10001BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v16, v22);
}

uint64_t sub_100010384@<X0>(uint64_t a1@<X8>)
{
  return sub_1000103C0(a1);
}

uint64_t sub_1000103A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000103C0(a1);
}

uint64_t sub_1000103C0@<X0>(uint64_t a1@<X8>)
{
  sub_10001BDF0();
  uint64_t result = sub_10001BE40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100010428@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100010460(*a1);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_100010460(unsigned __int8 a1)
{
  uint64_t v2 = sub_100006EFC(&qword_1000288C8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001BDC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v20 - v10;
  if (qword_1000282E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v12 = qword_10002DD50;
  if (*(void *)(qword_10002DD50 + 16) && (unint64_t v13 = sub_100019D68(a1), (v14 & 1) != 0))
  {
    unint64_t v15 = v13;
    uint64_t v16 = *(void *)(v12 + 56);
    uint64_t v17 = sub_10001BC30();
    uint64_t v18 = *(void *)(v17 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v4, v16 + *(void *)(v18 + 72) * v15, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v4, 0, 1, v17);
  }
  else
  {
    uint64_t v17 = sub_10001BC30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 1, 1, v17);
  }
  sub_10001BC30();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v4, 1, v17))
  {
    sub_100010980((uint64_t)v4);
    swift_endAccess();
    sub_10001BDB0();
  }
  else
  {
    sub_10001BC00();
    sub_100010980((uint64_t)v4);
    swift_endAccess();
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v9, v5);
  }
  return sub_10001BE50();
}

uint64_t sub_100010780(unsigned __int8 *a1)
{
  return sub_10001BEA0();
}

void sub_1000107EC(void *a1@<X8>)
{
  *a1 = *v1;
}

ValueMetadata *type metadata accessor for MathPaperPickerControl()
{
  return &type metadata for MathPaperPickerControl;
}

uint64_t sub_100010808()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100010828()
{
  unint64_t result = qword_1000288A8;
  if (!qword_1000288A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288A8);
  }
  return result;
}

unint64_t sub_10001087C()
{
  unint64_t result = qword_1000288B0;
  if (!qword_1000288B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288B0);
  }
  return result;
}

unint64_t sub_1000108D0()
{
  unint64_t result = qword_1000288B8;
  if (!qword_1000288B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288B8);
  }
  return result;
}

unint64_t sub_100010924()
{
  unint64_t result = qword_1000288C0;
  if (!qword_1000288C0)
  {
    sub_100004A8C(&qword_100028888);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288C0);
  }
  return result;
}

uint64_t sub_100010980(uint64_t a1)
{
  uint64_t v2 = sub_100006EFC(&qword_1000288C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000109E0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100010AE4()
{
  unint64_t result = qword_1000288E0;
  if (!qword_1000288E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288E0);
  }
  return result;
}

uint64_t sub_100010B38()
{
  return sub_100007098(&qword_1000288E8, &qword_1000288F0);
}

unint64_t sub_100010B74(uint64_t a1)
{
  uint64_t v2 = sub_100006EFC(&qword_100028630);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006EFC(&qword_100028A90);
  uint64_t v6 = sub_10001BF10();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100013C58(v12, (uint64_t)v5, &qword_100028630);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100019D24(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10001BC30();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_100010D6C(uint64_t a1)
{
  uint64_t v2 = sub_100006EFC(&qword_100028650);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006EFC(&qword_100028A98);
  uint64_t v6 = sub_10001BF10();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100013C58(v12, (uint64_t)v5, &qword_100028650);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100019D24(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006EFC(&qword_100028AA0);
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_100010F6C()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DCB8);
  sub_100006F40(v0, (uint64_t)qword_10002DCB8);
  return sub_10001BDB0();
}

uint64_t sub_100010FD0()
{
  uint64_t v0 = sub_100006EFC(&qword_100028468);
  sub_100006F78(v0, qword_10002DCD0);
  uint64_t v1 = sub_100006F40(v0, (uint64_t)qword_10002DCD0);
  sub_10001BBB0();
  uint64_t v2 = sub_10001BBC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100011088()
{
  uint64_t result = swift_getKeyPath();
  qword_10002DCE8 = result;
  return result;
}

uint64_t sub_1000110B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_1000110D4, 0, 0);
}

uint64_t sub_1000110D4()
{
  sub_10001B9E0();
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[9] = v1;
  sub_10001B9E0();
  if (qword_1000282C0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002DCE8;
  v0[10] = qword_10002DCE8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  uint64_t v4 = sub_100007098(&qword_100028A70, &qword_100028A78);
  v0[12] = v4;
  void *v3 = v0;
  v3[1] = sub_100011228;
  return AppEntity._setValue<A, B, C>(_:for:)((char *)v0 + 145, v2, &type metadata for MathPaperSettingEntity.Mode, v4);
}

uint64_t sub_100011228()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000521C;
  }
  else {
    uint64_t v2 = sub_10001137C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001137C()
{
  sub_10001B9E0();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10002DCE8;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100011458;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_100011458()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005234;
  }
  else {
    uint64_t v2 = sub_1000115AC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000115AC()
{
  *(unsigned char *)(v0 + 146) = *(unsigned char *)(v0 + 144);
  sub_100012FA0();
  sub_10001B9B0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100011634()
{
  if (qword_1000282C0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100011694()
{
  unint64_t result = qword_1000288F8;
  if (!qword_1000288F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288F8);
  }
  return result;
}

unint64_t sub_1000116EC()
{
  unint64_t result = qword_100028900;
  if (!qword_100028900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028900);
  }
  return result;
}

uint64_t sub_100011740()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100011774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013154(a1, a2, a3, (void (*)(void))sub_100010AE4);
}

uint64_t sub_1000117A0@<X0>(uint64_t a1@<X8>)
{
  return sub_100013084(&qword_1000282B0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10002DCB8, a1);
}

uint64_t sub_1000117D8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000282B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028468);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DCD0);
  return sub_100013C58(v3, a1, &qword_100028468);
}

uint64_t sub_100011850(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000057E8;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_1000110D4, 0, 0);
}

uint64_t sub_100011904@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000137B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001192C()
{
  return 0xD000000000000027;
}

unint64_t sub_10001194C()
{
  unint64_t result = qword_100028910;
  if (!qword_100028910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028910);
  }
  return result;
}

unint64_t sub_1000119A4()
{
  unint64_t result = qword_100028918;
  if (!qword_100028918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028918);
  }
  return result;
}

uint64_t sub_1000119F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100011A18, 0, 0);
}

uint64_t sub_100011A18()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  unint64_t v1 = sub_100017D34();
  if (v1 >= 3) {
    char v3 = 1;
  }
  else {
    char v3 = v1;
  }
  if (v2) {
    char v3 = 0;
  }
  **(unsigned char **)(v0 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100011ACC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 24) = *a2;
  return _swift_task_switch(sub_100011AF0, 0, 0);
}

uint64_t sub_100011AF0()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)qword_10002DB40;
  *(void *)(v0 + 16) = *(unsigned __int8 *)(v0 + 24);
  uint64_t v2 = sub_10001BF40();
  sub_10001BED0();
  NSString v3 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  [v1 setObject:v2 forKey:v3];

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100011BF0()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  if (qword_1000282D0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001BD70();
  sub_100006F40(v9, (uint64_t)qword_10002DD08);
  swift_beginAccess();
  sub_10001BD60();
  swift_endAccess();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001BBE0();
  uint64_t v10 = sub_10001BBF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_100006EFC(&qword_100028418);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001DC70;
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BDB0();
  sub_10001BDB0();
  return sub_10001BC10();
}

uint64_t sub_100011F4C()
{
  uint64_t v0 = sub_100006EFC(&qword_100028928);
  sub_100006F78(v0, qword_10002DCF0);
  sub_100006F40(v0, (uint64_t)qword_10002DCF0);
  sub_1000108D0();
  return sub_10001BC50();
}

uint64_t sub_100011FC8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001BDC0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_100012058, 0, 0);
}

uint64_t sub_100012058()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100006EFC(&qword_1000288F0);
  sub_10001BDB0();
  sub_100007098(&qword_100028A70, &qword_100028A78);
  sub_100010828();
  *uint64_t v1 = sub_10001BD90();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100012178(uint64_t a1)
{
  return sub_1000121A0(a1, qword_10002DD08);
}

uint64_t sub_1000121A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001BD70();
  sub_100006F78(v3, a2);
  sub_100006F40(v3, (uint64_t)a2);
  return sub_10001BD50();
}

uint64_t sub_100012200()
{
  uint64_t v0 = sub_100006EFC(&qword_100028A80);
  sub_100006F78(v0, qword_10002DD20);
  sub_100006F40(v0, (uint64_t)qword_10002DD20);
  sub_10001194C();
  return sub_10001BD40();
}

uint64_t sub_10001227C@<X0>(uint64_t a1@<X8>)
{
  return sub_100012CA4(&qword_1000282D8, &qword_100028A80, (uint64_t)qword_10002DD20, a1);
}

uint64_t sub_1000122A8()
{
  return sub_100007098(&qword_100028920, &qword_100028928);
}

uint64_t sub_1000122E4()
{
  uint64_t v0 = qword_1000288D0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100012320()
{
  unint64_t result = qword_100028930;
  if (!qword_100028930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028930);
  }
  return result;
}

unint64_t sub_100012378()
{
  unint64_t result = qword_100028938;
  if (!qword_100028938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028938);
  }
  return result;
}

unint64_t sub_1000123D0()
{
  unint64_t result = qword_100028940;
  if (!qword_100028940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028940);
  }
  return result;
}

uint64_t sub_100012424()
{
  return sub_100007098((unint64_t *)&unk_100028948, &qword_100028928);
}

uint64_t sub_100012460@<X0>(uint64_t a1@<X8>)
{
  return sub_100012CA4(&qword_1000282C8, &qword_100028928, (uint64_t)qword_10002DCF0, a1);
}

uint64_t sub_10001248C()
{
  sub_100013BF8();
  uint64_t v2 = sub_10001BCF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_100012524()
{
  unint64_t result = qword_100028958;
  if (!qword_100028958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028958);
  }
  return result;
}

unint64_t sub_10001257C()
{
  unint64_t result = qword_100028960;
  if (!qword_100028960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028960);
  }
  return result;
}

unint64_t sub_1000125D4()
{
  unint64_t result = qword_100028968;
  if (!qword_100028968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028968);
  }
  return result;
}

unint64_t sub_10001262C()
{
  unint64_t result = qword_100028970;
  if (!qword_100028970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028970);
  }
  return result;
}

uint64_t sub_100012680@<X0>(uint64_t *a1@<X8>)
{
  sub_1000108D0();
  uint64_t result = sub_10001B9C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000126C0@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000282D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DD08);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100012780()
{
  return sub_100007098(&qword_100028978, &qword_100028980);
}

uint64_t sub_1000127BC(uint64_t a1)
{
  unint64_t v2 = sub_10001194C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001280C()
{
  unint64_t result = qword_100028988;
  if (!qword_100028988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028988);
  }
  return result;
}

uint64_t sub_100012864(uint64_t a1)
{
  unint64_t v2 = sub_10001262C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000128B0(uint64_t a1)
{
  return sub_1000121A0(a1, qword_10002DD38);
}

uint64_t sub_1000128D4()
{
  sub_100006EFC(&qword_100028A28);
  uint64_t v0 = *(void *)(sub_100006EFC(&qword_100028A30) - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10001DC70;
  uint64_t v4 = (unsigned char *)(v3 + v2);
  *uint64_t v4 = 0;
  sub_10001BBD0();
  v4[v1] = 1;
  sub_10001BBD0();
  v4[2 * v1] = 2;
  sub_10001BBD0();
  unint64_t v5 = sub_1000135F0(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_10002DD50 = v5;
  return result;
}

uint64_t sub_100012A64()
{
  uint64_t v0 = sub_100006EFC(&qword_100028A48);
  sub_100006F78(v0, qword_10002DD58);
  sub_100006F40(v0, (uint64_t)qword_10002DD58);
  sub_100010828();
  return sub_10001BCC0();
}

BOOL sub_100012AE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100012AF8()
{
  unint64_t result = qword_100028990;
  if (!qword_100028990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028990);
  }
  return result;
}

Swift::Int sub_100012B4C()
{
  Swift::UInt v1 = *v0;
  sub_10001BF50();
  sub_10001BF60(v1);
  return sub_10001BF70();
}

void sub_100012B94()
{
  sub_10001BF60(*v0);
}

Swift::Int sub_100012BC0()
{
  Swift::UInt v1 = *v0;
  sub_10001BF50();
  sub_10001BF60(v1);
  return sub_10001BF70();
}

uint64_t *sub_100012C04@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

unint64_t sub_100012C24()
{
  unint64_t result = qword_100028998;
  if (!qword_100028998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028998);
  }
  return result;
}

uint64_t sub_100012C78@<X0>(uint64_t a1@<X8>)
{
  return sub_100012CA4(&qword_1000282F0, &qword_100028A48, (uint64_t)qword_10002DD58, a1);
}

uint64_t sub_100012CA4@<X0>(void *a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100006EFC(a2);
  uint64_t v8 = sub_100006F40(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

unint64_t sub_100012D48()
{
  unint64_t result = qword_1000289A0;
  if (!qword_1000289A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289A0);
  }
  return result;
}

unint64_t sub_100012DA0()
{
  unint64_t result = qword_1000289A8;
  if (!qword_1000289A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289A8);
  }
  return result;
}

unint64_t sub_100012DF8()
{
  unint64_t result = qword_1000289B0;
  if (!qword_1000289B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289B0);
  }
  return result;
}

void *sub_100012E4C()
{
  return &protocol witness table for Int;
}

uint64_t sub_100012E58()
{
  sub_100013BA4();
  uint64_t v2 = sub_10001BC40();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_100012EF0()
{
  unint64_t result = qword_1000289C0;
  if (!qword_1000289C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289C0);
  }
  return result;
}

unint64_t sub_100012F48()
{
  unint64_t result = qword_1000289C8;
  if (!qword_1000289C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289C8);
  }
  return result;
}

unint64_t sub_100012FA0()
{
  unint64_t result = qword_1000289D0;
  if (!qword_1000289D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289D0);
  }
  return result;
}

unint64_t sub_100012FF8()
{
  unint64_t result = qword_1000289D8;
  if (!qword_1000289D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289D8);
  }
  return result;
}

uint64_t sub_10001304C@<X0>(uint64_t a1@<X8>)
{
  return sub_100013084(&qword_1000282E0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10002DD38, a1);
}

uint64_t sub_100013084@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100006F40(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100013128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100013154(a1, a2, a3, (void (*)(void))sub_100010828);
}

uint64_t sub_100013154(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001319C(uint64_t a1)
{
  unint64_t v2 = sub_100010828();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000131EC()
{
  unint64_t result = qword_1000289E0;
  if (!qword_1000289E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289E0);
  }
  return result;
}

unint64_t sub_100013244()
{
  unint64_t result = qword_1000289E8;
  if (!qword_1000289E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289E8);
  }
  return result;
}

unint64_t sub_10001329C()
{
  unint64_t result = qword_1000289F0;
  if (!qword_1000289F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289F0);
  }
  return result;
}

uint64_t sub_1000132F0()
{
  if (qword_1000282E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_100013368(uint64_t a1)
{
  unint64_t v2 = sub_100012FF8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000133B4()
{
  return sub_100007098(&qword_1000289F8, &qword_100028A00);
}

void sub_1000133F0(void *a1@<X8>)
{
  *a1 = &off_100025048;
}

ValueMetadata *type metadata accessor for MathPaperSettingEntity()
{
  return &type metadata for MathPaperSettingEntity;
}

ValueMetadata *type metadata accessor for MathPaperSettingEntity.UpdateIntent_value()
{
  return &type metadata for MathPaperSettingEntity.UpdateIntent_value;
}

uint64_t getEnumTagSinglePayload for MathPaperSettingEntity.Mode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MathPaperSettingEntity.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001357CLL);
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

ValueMetadata *type metadata accessor for MathPaperSettingEntity.Mode()
{
  return &type metadata for MathPaperSettingEntity.Mode;
}

uint64_t sub_1000135B4()
{
  return sub_100007098(&qword_100028A08, &qword_100028A10);
}

unint64_t sub_1000135F0(uint64_t a1)
{
  uint64_t v2 = sub_100006EFC(&qword_100028A30);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_100006EFC(&qword_100028A38);
    BOOL v7 = (void *)sub_10001BF10();
    int v8 = &v5[*(int *)(v2 + 48)];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_100013C58(v9, (uint64_t)v5, &qword_100028A30);
      unsigned __int8 v11 = *v5;
      unint64_t result = sub_100019D68(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v7[6] + result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = sub_10001BC30();
      unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
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

uint64_t sub_1000137B8()
{
  uint64_t v28 = sub_10001BCE0();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006EFC(&qword_1000283F0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001BDC0();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100006EFC(&qword_100028A18);
  sub_10001BDB0();
  char v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_10001B9A0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  BOOL v21 = (void (*)(char *, void, uint64_t))v17;
  BOOL v18 = v27;
  v17(v27);
  sub_10001194C();
  uint64_t v23 = sub_10001BA20();
  sub_100006EFC(&qword_100028A20);
  sub_10001BDB0();
  v25(v10, 1, 1, v26);
  char v29 = 3;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_100010828();
  sub_10001BA10();
  return v23;
}

unint64_t sub_100013BA4()
{
  unint64_t result = qword_100028A40;
  if (!qword_100028A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A40);
  }
  return result;
}

unint64_t sub_100013BF8()
{
  unint64_t result = qword_100028A50;
  if (!qword_100028A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A50);
  }
  return result;
}

uint64_t sub_100013C4C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100013C58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006EFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013CBC(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_100006EFC(&qword_100028B70);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006EFC(&qword_100028B78);
  __chkstk_darwin(v5);
  sub_1000173F4();
  sub_10001BB50();
  v29._countAndFlagsBits = 0x20796D206E65704FLL;
  v29._object = (void *)0xE800000000000000;
  sub_10001BB40(v29);
  swift_getKeyPath();
  unint64_t v27 = sub_10000B244();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v30._countAndFlagsBits = 0x676E697474657320;
  v30._object = (void *)0xE800000000000000;
  sub_10001BB40(v30);
  sub_10001BB60();
  uint64_t v23 = sub_10001BAB0();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v25 = v1;
  v6(v4, v1);
  uint64_t v26 = v2 + 8;
  uint64_t v24 = v6;
  sub_10001BB50();
  v31._object = (void *)0xEB0000000020796DLL;
  v31._countAndFlagsBits = 0x20656D20776F6853;
  sub_10001BB40(v31);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v32._countAndFlagsBits = 0x676E697474657320;
  v32._object = (void *)0xE800000000000000;
  sub_10001BB40(v32);
  sub_10001BB60();
  uint64_t v22 = sub_10001BAB0();
  v6(v4, v1);
  sub_10001BB50();
  v33._object = (void *)0x800000010001D8D0;
  v33._countAndFlagsBits = 0xD000000000000015;
  sub_10001BB40(v33);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v34._countAndFlagsBits = 0x676E697474657320;
  v34._object = (void *)0xE800000000000000;
  sub_10001BB40(v34);
  sub_10001BB60();
  uint64_t v21 = sub_10001BAB0();
  BOOL v7 = v24;
  v24(v4, v25);
  sub_10001BB50();
  v35._countAndFlagsBits = 0xD000000000000017;
  v35._object = (void *)0x800000010001D8F0;
  sub_10001BB40(v35);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10001BB40(v36);
  sub_10001BB60();
  uint64_t v20 = sub_10001BAB0();
  v7(v4, v25);
  sub_10001BB50();
  v37._countAndFlagsBits = 0xD000000000000016;
  v37._object = (void *)0x800000010001D910;
  sub_10001BB40(v37);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10001BB40(v38);
  sub_10001BB60();
  uint64_t v19 = sub_10001BAB0();
  v24(v4, v25);
  sub_10001BB50();
  v39._countAndFlagsBits = 0x206E65704FLL;
  v39._object = (void *)0xE500000000000000;
  sub_10001BB40(v39);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v40._countAndFlagsBits = 0x676E697474657320;
  v40._object = (void *)0xE800000000000000;
  sub_10001BB40(v40);
  sub_10001BB60();
  uint64_t v18 = sub_10001BAB0();
  uint64_t v8 = v25;
  v24(v4, v25);
  sub_10001BB50();
  v41._countAndFlagsBits = 0x2077656956;
  v41._object = (void *)0xE500000000000000;
  sub_10001BB40(v41);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v42._countAndFlagsBits = 0x676E697474657320;
  v42._object = (void *)0xE800000000000000;
  sub_10001BB40(v42);
  sub_10001BB60();
  uint64_t v17 = sub_10001BAB0();
  uint64_t v9 = v24;
  v24(v4, v8);
  sub_10001BB50();
  v43._countAndFlagsBits = 0x20656D20656B6154;
  v43._object = (void *)0xEB00000000206F74;
  sub_10001BB40(v43);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v44._countAndFlagsBits = 0x676E697474657320;
  v44._object = (void *)0xE800000000000000;
  sub_10001BB40(v44);
  sub_10001BB60();
  uint64_t v10 = sub_10001BAB0();
  v9(v4, v8);
  sub_100006EFC(&qword_100028B80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001E6F0;
  uint64_t v12 = v22;
  *(void *)(v11 + 32) = v23;
  *(void *)(v11 + 40) = v12;
  uint64_t v13 = v20;
  *(void *)(v11 + 48) = v21;
  *(void *)(v11 + 56) = v13;
  uint64_t v14 = v18;
  *(void *)(v11 + 64) = v19;
  *(void *)(v11 + 72) = v14;
  *(void *)(v11 + 80) = v17;
  *(void *)(v11 + 88) = v10;
  uint64_t v15 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_100014528(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FFA8, (void (*)(void))sub_10000B244, (void (*)(uint64_t))sub_1000173F4);
}

uint64_t sub_100014570()
{
  uint64_t v0 = sub_10001BAD0();
  uint64_t v1 = sub_10001BAD0();
  uint64_t v2 = sub_10001BAD0();
  uint64_t v3 = sub_10001BAD0();
  uint64_t v4 = sub_10001BAD0();
  uint64_t v5 = sub_10001BAD0();
  sub_100006EFC(&qword_100028AB8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001FD20;
  *(void *)(v6 + 32) = v0;
  *(void *)(v6 + 40) = v1;
  *(void *)(v6 + 48) = v2;
  *(void *)(v6 + 56) = v3;
  *(void *)(v6 + 64) = v4;
  *(void *)(v6 + 72) = v5;
  uint64_t v7 = sub_10001BAC0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000146C8(uint64_t a1)
{
  uint64_t v2 = sub_10001BA90();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  __chkstk_darwin(v2);
  uint64_t v18 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006EFC(&qword_100028B58);
  uint64_t v23 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006EFC(&qword_100028B60);
  __chkstk_darwin(v6);
  sub_100017884();
  sub_10001BB50();
  v24._countAndFlagsBits = 544499027;
  v24._object = (void *)0xE400000000000000;
  sub_10001BB40(v24);
  swift_getKeyPath();
  v16[2] = sub_1000179FC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v25._countAndFlagsBits = 32;
  v25._object = (void *)0xE100000000000000;
  sub_10001BB40(v25);
  swift_getKeyPath();
  v16[1] = sub_1000070DC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_10001BB40(v26);
  sub_10001BB60();
  uint64_t v19 = sub_10001BAB0();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v23 + 8);
  v23 += 8;
  uint64_t v7 = v17;
  v22(v5, v17);
  sub_10001BB50();
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_10001BB40(v27);
  swift_getKeyPath();
  v16[0] = a1;
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v28._countAndFlagsBits = 32;
  v28._object = (void *)0xE100000000000000;
  sub_10001BB40(v28);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v29._countAndFlagsBits = 544108320;
  v29._object = (void *)0xE400000000000000;
  sub_10001BB40(v29);
  uint64_t v9 = v20;
  uint64_t v8 = v21;
  uint64_t v10 = v18;
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v18, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v21);
  sub_10001BB20();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v8);
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10001BB40(v30);
  sub_10001BB60();
  uint64_t v21 = sub_10001BAB0();
  v22(v5, v7);
  sub_10001BB50();
  v31._countAndFlagsBits = 0x206E727554;
  v31._object = (void *)0xE500000000000000;
  sub_10001BB40(v31);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  sub_10001BB40(v32);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10001BB40(v33);
  sub_10001BB60();
  uint64_t v11 = sub_10001BAB0();
  v22(v5, v7);
  sub_100006EFC(&qword_100028B68);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001DC70;
  uint64_t v13 = v21;
  *(void *)(v12 + 32) = v19;
  *(void *)(v12 + 40) = v13;
  *(void *)(v12 + 48) = v11;
  uint64_t v14 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_100014CA0(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FF58, (void (*)(void))sub_1000179FC, (void (*)(uint64_t))sub_100017884);
}

uint64_t sub_100014CE8()
{
  return sub_100017240();
}

uint64_t sub_100014D0C(uint64_t a1)
{
  uint64_t v2 = sub_10001BA90();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  __chkstk_darwin(v2);
  uint64_t v18 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006EFC(&qword_100028B38);
  uint64_t v23 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006EFC(&qword_100028B40);
  __chkstk_darwin(v6);
  sub_10000DC24();
  sub_10001BB50();
  v24._countAndFlagsBits = 544499027;
  v24._object = (void *)0xE400000000000000;
  sub_10001BB40(v24);
  swift_getKeyPath();
  v16[2] = sub_10000F134();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v25._countAndFlagsBits = 32;
  v25._object = (void *)0xE100000000000000;
  sub_10001BB40(v25);
  swift_getKeyPath();
  v16[1] = sub_1000070DC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_10001BB40(v26);
  sub_10001BB60();
  uint64_t v19 = sub_10001BAB0();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v23 + 8);
  v23 += 8;
  uint64_t v7 = v17;
  v22(v5, v17);
  sub_10001BB50();
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_10001BB40(v27);
  swift_getKeyPath();
  v16[0] = a1;
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v28._countAndFlagsBits = 32;
  v28._object = (void *)0xE100000000000000;
  sub_10001BB40(v28);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v29._countAndFlagsBits = 544108320;
  v29._object = (void *)0xE400000000000000;
  sub_10001BB40(v29);
  uint64_t v9 = v20;
  uint64_t v8 = v21;
  uint64_t v10 = v18;
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v18, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v21);
  sub_10001BB20();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v8);
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10001BB40(v30);
  sub_10001BB60();
  uint64_t v21 = sub_10001BAB0();
  v22(v5, v7);
  sub_10001BB50();
  v31._countAndFlagsBits = 0x206E727554;
  v31._object = (void *)0xE500000000000000;
  sub_10001BB40(v31);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  sub_10001BB40(v32);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10001BB40(v33);
  sub_10001BB60();
  uint64_t v11 = sub_10001BAB0();
  v22(v5, v7);
  sub_100006EFC(&qword_100028B48);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001DC70;
  uint64_t v13 = v21;
  *(void *)(v12 + 32) = v19;
  *(void *)(v12 + 40) = v13;
  *(void *)(v12 + 48) = v11;
  uint64_t v14 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1000152E4(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FF08, (void (*)(void))sub_10000F134, (void (*)(uint64_t))sub_10000DC24);
}

uint64_t sub_10001532C()
{
  return sub_100017240();
}

uint64_t sub_10001534C(uint64_t a1)
{
  uint64_t v2 = sub_10001BA90();
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v25 = v2;
  __chkstk_darwin(v2);
  uint64_t v22 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100006EFC(&qword_100028B20);
  uint64_t v29 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006EFC(&qword_100028B28);
  __chkstk_darwin(v6);
  sub_10000B8B0();
  sub_10001BB50();
  v31._countAndFlagsBits = 544499027;
  v31._object = (void *)0xE400000000000000;
  sub_10001BB40(v31);
  swift_getKeyPath();
  unint64_t v28 = sub_10000CDC8();
  v20[0] = a1;
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  sub_10001BB40(v32);
  swift_getKeyPath();
  v20[1] = sub_1000070DC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10001BB40(v33);
  Swift::String v26 = v5;
  sub_10001BB60();
  uint64_t v23 = sub_10001BAB0();
  uint64_t v7 = v29 + 8;
  Swift::String v30 = *(void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v8 = v27;
  v30(v5, v27);
  uint64_t v29 = v7;
  sub_10001BB50();
  v34._object = (void *)0x800000010001D8B0;
  v34._countAndFlagsBits = 0xD000000000000011;
  sub_10001BB40(v34);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_10001BB40(v35);
  uint64_t v9 = v26;
  sub_10001BB60();
  uint64_t v21 = sub_10001BAB0();
  v30(v9, v8);
  sub_10001BB50();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10001BB40(v36);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v37._countAndFlagsBits = 32;
  v37._object = (void *)0xE100000000000000;
  sub_10001BB40(v37);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v38._countAndFlagsBits = 544108320;
  v38._object = (void *)0xE400000000000000;
  sub_10001BB40(v38);
  uint64_t v11 = v24;
  uint64_t v10 = v25;
  uint64_t v12 = v22;
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v22, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v25);
  sub_10001BB20();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v12, v10);
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_10001BB40(v39);
  uint64_t v13 = v26;
  sub_10001BB60();
  uint64_t v25 = sub_10001BAB0();
  uint64_t v14 = v27;
  v30(v13, v27);
  sub_10001BB50();
  v40._countAndFlagsBits = 0x206E727554;
  v40._object = (void *)0xE500000000000000;
  sub_10001BB40(v40);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v41._countAndFlagsBits = 32;
  v41._object = (void *)0xE100000000000000;
  sub_10001BB40(v41);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10001BB40(v42);
  sub_10001BB60();
  uint64_t v15 = sub_10001BAB0();
  v30(v13, v14);
  sub_100006EFC(&qword_100028B30);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10001FD30;
  uint64_t v17 = v21;
  *(void *)(v16 + 32) = v23;
  *(void *)(v16 + 40) = v17;
  *(void *)(v16 + 48) = v25;
  *(void *)(v16 + 56) = v15;
  uint64_t v18 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_100015A04(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FEB8, (void (*)(void))sub_10000CDC8, (void (*)(uint64_t))sub_10000B8B0);
}

uint64_t sub_100015A4C()
{
  return sub_100017240();
}

uint64_t sub_100015A70(uint64_t a1)
{
  uint64_t v2 = sub_10001BA90();
  uint64_t v22 = *(void *)(v2 - 8);
  uint64_t v23 = v2;
  __chkstk_darwin(v2);
  uint64_t v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100006EFC(&qword_100028B08);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006EFC(&qword_100028B10);
  __chkstk_darwin(v6);
  sub_100010AE4();
  sub_10001BB50();
  v29._countAndFlagsBits = 544499027;
  v29._object = (void *)0xE400000000000000;
  sub_10001BB40(v29);
  swift_getKeyPath();
  unint64_t v20 = sub_1000125D4();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v30._countAndFlagsBits = 544175136;
  v30._object = (void *)0xE400000000000000;
  sub_10001BB40(v30);
  swift_getKeyPath();
  unint64_t v27 = sub_100012FA0();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10001BB40(v31);
  sub_10001BB60();
  uint64_t v24 = sub_10001BAB0();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  uint64_t v7 = v26;
  v19(v5, v26);
  sub_10001BB50();
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10001BB40(v32);
  swift_getKeyPath();
  uint64_t v25 = a1;
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v33._countAndFlagsBits = 32;
  v33._object = (void *)0xE100000000000000;
  sub_10001BB40(v33);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v34._countAndFlagsBits = 544108320;
  v34._object = (void *)0xE400000000000000;
  sub_10001BB40(v34);
  uint64_t v9 = v21;
  uint64_t v8 = v22;
  uint64_t v10 = v23;
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v23);
  sub_10001BB20();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v9, v10);
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_10001BB40(v35);
  sub_10001BB60();
  uint64_t v23 = sub_10001BAB0();
  uint64_t v11 = v19;
  v19(v5, v7);
  sub_10001BB50();
  v36._countAndFlagsBits = 543519573;
  v36._object = (void *)0xE400000000000000;
  sub_10001BB40(v36);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v37._countAndFlagsBits = 32;
  v37._object = (void *)0xE100000000000000;
  sub_10001BB40(v37);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_10001BB40(v38);
  sub_10001BB60();
  uint64_t v22 = sub_10001BAB0();
  v11(v5, v7);
  sub_10001BB50();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_10001BB40(v39);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v40._countAndFlagsBits = 0xD000000000000012;
  v40._object = (void *)0x800000010001D850;
  sub_10001BB40(v40);
  sub_10001BB60();
  uint64_t v21 = (char *)sub_10001BAB0();
  v11(v5, v26);
  sub_10001BB50();
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_10001BB40(v41);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v42._object = (void *)0x800000010001D870;
  v42._countAndFlagsBits = 0xD000000000000010;
  sub_10001BB40(v42);
  sub_10001BB60();
  unint64_t v20 = sub_10001BAB0();
  uint64_t v12 = v26;
  v11(v5, v26);
  sub_10001BB50();
  v43._countAndFlagsBits = 0xD00000000000001FLL;
  v43._object = (void *)0x800000010001D890;
  sub_10001BB40(v43);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10001BB40(v44);
  sub_10001BB60();
  uint64_t v13 = sub_10001BAB0();
  v11(v5, v12);
  sub_100006EFC(&qword_100028B18);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10001FD20;
  uint64_t v15 = v23;
  *(void *)(v14 + 32) = v24;
  *(void *)(v14 + 40) = v15;
  uint64_t v16 = v21;
  *(void *)(v14 + 48) = v22;
  *(void *)(v14 + 56) = v16;
  *(void *)(v14 + 64) = v20;
  *(void *)(v14 + 72) = v13;
  uint64_t v17 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1000162E4(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FE68, (void (*)(void))sub_1000125D4, (void (*)(uint64_t))sub_100010AE4);
}

uint64_t sub_10001632C()
{
  return sub_100017240();
}

uint64_t sub_10001634C(uint64_t a1)
{
  uint64_t v2 = sub_10001BA90();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  __chkstk_darwin(v2);
  uint64_t v19 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100006EFC(&qword_100028AF0);
  uint64_t v26 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006EFC(&qword_100028AF8);
  __chkstk_darwin(v6);
  sub_100007FD0();
  sub_10001BB50();
  v27._countAndFlagsBits = 544499027;
  v27._object = (void *)0xE400000000000000;
  sub_10001BB40(v27);
  swift_getKeyPath();
  v18[1] = sub_1000094D8();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v28._countAndFlagsBits = 32;
  v28._object = (void *)0xE100000000000000;
  sub_10001BB40(v28);
  swift_getKeyPath();
  unint64_t v25 = sub_1000070DC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_10001BB40(v29);
  sub_10001BB60();
  uint64_t v22 = sub_10001BAB0();
  v18[0] = *(void *)(v26 + 8);
  v26 += 8;
  uint64_t v7 = v24;
  ((void (*)(char *, uint64_t))v18[0])(v5, v24);
  sub_10001BB50();
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10001BB40(v30);
  swift_getKeyPath();
  uint64_t v23 = a1;
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v31._countAndFlagsBits = 32;
  v31._object = (void *)0xE100000000000000;
  sub_10001BB40(v31);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v32._countAndFlagsBits = 544108320;
  v32._object = (void *)0xE400000000000000;
  sub_10001BB40(v32);
  uint64_t v9 = v19;
  uint64_t v8 = v20;
  uint64_t v10 = v21;
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v19, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v21);
  sub_10001BB20();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v9, v10);
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10001BB40(v33);
  sub_10001BB60();
  uint64_t v21 = sub_10001BAB0();
  uint64_t v11 = (void (*)(char *, uint64_t))v18[0];
  ((void (*)(char *, uint64_t))v18[0])(v5, v7);
  sub_10001BB50();
  v34._countAndFlagsBits = 0x206E727554;
  v34._object = (void *)0xE500000000000000;
  sub_10001BB40(v34);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v35._countAndFlagsBits = 32;
  v35._object = (void *)0xE100000000000000;
  sub_10001BB40(v35);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_10001BB40(v36);
  sub_10001BB60();
  uint64_t v20 = sub_10001BAB0();
  uint64_t v12 = v24;
  v11(v5, v24);
  sub_10001BB50();
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  sub_10001BB40(v37);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v38._object = (void *)0x800000010001D830;
  v38._countAndFlagsBits = 0xD00000000000001CLL;
  sub_10001BB40(v38);
  sub_10001BB60();
  uint64_t v13 = sub_10001BAB0();
  v11(v5, v12);
  sub_100006EFC(&qword_100028B00);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10001FD30;
  uint64_t v15 = v21;
  *(void *)(v14 + 32) = v22;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v20;
  *(void *)(v14 + 56) = v13;
  uint64_t v16 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_100016A08(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FE18, (void (*)(void))sub_1000094D8, (void (*)(uint64_t))sub_100007FD0);
}

uint64_t sub_100016A50()
{
  return sub_100017240();
}

uint64_t sub_100016A6C(uint64_t a1)
{
  uint64_t v2 = sub_10001BA90();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  __chkstk_darwin(v2);
  uint64_t v18 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006EFC(&qword_100028AD8);
  uint64_t v23 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006EFC(&qword_100028AE0);
  __chkstk_darwin(v6);
  sub_1000049FC();
  sub_10001BB50();
  v24._countAndFlagsBits = 544499027;
  v24._object = (void *)0xE400000000000000;
  sub_10001BB40(v24);
  swift_getKeyPath();
  v16[2] = sub_1000065CC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v25._countAndFlagsBits = 32;
  v25._object = (void *)0xE100000000000000;
  sub_10001BB40(v25);
  swift_getKeyPath();
  v16[1] = sub_1000070DC();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_10001BB40(v26);
  sub_10001BB60();
  uint64_t v19 = sub_10001BAB0();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v23 + 8);
  v23 += 8;
  uint64_t v7 = v17;
  v22(v5, v17);
  sub_10001BB50();
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_10001BB40(v27);
  swift_getKeyPath();
  v16[0] = a1;
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v28._countAndFlagsBits = 32;
  v28._object = (void *)0xE100000000000000;
  sub_10001BB40(v28);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v29._countAndFlagsBits = 544108320;
  v29._object = (void *)0xE400000000000000;
  sub_10001BB40(v29);
  uint64_t v9 = v20;
  uint64_t v8 = v21;
  uint64_t v10 = v18;
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v18, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v21);
  sub_10001BB20();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v8);
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10001BB40(v30);
  sub_10001BB60();
  uint64_t v21 = sub_10001BAB0();
  v22(v5, v7);
  sub_10001BB50();
  v31._countAndFlagsBits = 0x206E727554;
  v31._object = (void *)0xE500000000000000;
  sub_10001BB40(v31);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  sub_10001BB40(v32);
  swift_getKeyPath();
  sub_10001BA80();
  swift_release();
  sub_10001BB30();
  swift_release();
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  sub_10001BB40(v33);
  sub_10001BB60();
  uint64_t v11 = sub_10001BAB0();
  v22(v5, v7);
  sub_100006EFC(&qword_100028AE8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001DC70;
  uint64_t v13 = v21;
  *(void *)(v12 + 32) = v19;
  *(void *)(v12 + 40) = v13;
  *(void *)(v12 + 48) = v11;
  uint64_t v14 = sub_10001BAA0();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_100017044(uint64_t a1)
{
  return sub_10001708C(a1, (uint64_t)&unk_10001FDC8, (void (*)(void))sub_1000065CC, (void (*)(uint64_t))sub_1000049FC);
}

uint64_t sub_10001708C(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_10001BB10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_10001BA80();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_10001BB00();
  uint64_t v11 = sub_10001BAF0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100006EFC(&qword_100028AD0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001FD40;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_10001BAE0();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_100017204()
{
  return sub_100017240();
}

uint64_t sub_100017224()
{
  return sub_100017240();
}

uint64_t sub_100017240()
{
  uint64_t v0 = sub_10001BAD0();
  sub_100006EFC(&qword_100028AB8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001FD40;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_10001BAC0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1000172AC()
{
  uint64_t v0 = sub_10001BA70();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000173F4();
  sub_10001BA60();
  uint64_t v4 = sub_10001BA50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006EFC(&qword_100028AB0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001FD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001BA40();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for FreeformAssistantIntentsProvider()
{
  return &type metadata for FreeformAssistantIntentsProvider;
}

unint64_t sub_1000173F4()
{
  unint64_t result = qword_100028AA8;
  if (!qword_100028AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028AA8);
  }
  return result;
}

uint64_t sub_100017448()
{
  uint64_t v0 = sub_10001BB90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10001B4BC();
  sub_1000173F4();
  sub_10001BBA0();
  uint64_t v21 = sub_10001BB80();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  uint64_t v22 = sub_10001A2C8();
  uint64_t v23 = v5;
  sub_100017884();
  sub_10001BBA0();
  uint64_t v6 = sub_10001BB80();
  v4(v3, v0);
  uint64_t v22 = sub_10000F430();
  uint64_t v23 = v7;
  sub_10000DC24();
  sub_10001BBA0();
  uint64_t v8 = sub_10001BB80();
  v4(v3, v0);
  uint64_t v22 = sub_10000D0C4();
  uint64_t v23 = v9;
  sub_10000B8B0();
  sub_10001BBA0();
  uint64_t v10 = sub_10001BB80();
  v4(v3, v0);
  uint64_t v22 = sub_1000137B8();
  uint64_t v23 = v11;
  sub_100010AE4();
  sub_10001BBA0();
  uint64_t v12 = sub_10001BB80();
  v4(v3, v0);
  uint64_t v22 = sub_100009810();
  uint64_t v23 = v13;
  sub_100007FD0();
  sub_10001BBA0();
  uint64_t v14 = sub_10001BB80();
  v4(v3, v0);
  uint64_t v22 = sub_100006ABC();
  uint64_t v23 = v15;
  sub_1000049FC();
  sub_10001BBA0();
  uint64_t v16 = sub_10001BB80();
  v4(v3, v0);
  sub_100006EFC(&qword_100028AC8);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10001FD50;
  *(void *)(v17 + 32) = v21;
  *(void *)(v17 + 40) = v6;
  *(void *)(v17 + 48) = v8;
  *(void *)(v17 + 56) = v10;
  *(void *)(v17 + 64) = v12;
  *(void *)(v17 + 72) = v14;
  *(void *)(v17 + 80) = v16;
  uint64_t v18 = sub_10001BB70();
  swift_bridgeObjectRelease();
  return v18;
}

unint64_t sub_100017884()
{
  unint64_t result = qword_100028AC0;
  if (!qword_100028AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028AC0);
  }
  return result;
}

uint64_t sub_1000178D8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100017930@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_10001796C()
{
  return sub_10001B9F0();
}

uint64_t sub_1000179C0()
{
  return sub_10001B9F0();
}

unint64_t sub_1000179FC()
{
  unint64_t result = qword_100028B50;
  if (!qword_100028B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B50);
  }
  return result;
}

uint64_t sub_100017A54@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100017A94()
{
  return sub_10001B9F0();
}

uint64_t sub_100017ACC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100017B08()
{
  return sub_10001B9F0();
}

uint64_t sub_100017B58()
{
  return sub_100007098(&qword_100028B98, &qword_100028BA0);
}

uint64_t sub_100017B94()
{
  sub_100007FB4();
  NSString v1 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    sub_10001BF00();
    swift_unknownObjectRelease();
    sub_100019D14(v10, v12);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  sub_100006EFC(&qword_100028C68);
  if (swift_dynamicCast()) {
    return v11;
  }
  unsigned __int8 v11 = 2;
  id v4 = [self defaultDefaults];
  uint64_t v5 = sub_10001BEB0();

  uint64_t v6 = sub_100007FB4();
  if (*(void *)(v5 + 16) && (unint64_t v8 = sub_100019C40(v6, v7), (v9 & 1) != 0)) {
    sub_100019CB8(*(void *)(v5 + 56) + 32 * v8, (uint64_t)v10);
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (swift_dynamicCast()) {
    return v13;
  }
  else {
    return 2;
  }
}

uint64_t sub_100017D34()
{
  sub_100007FB4();
  NSString v1 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    sub_10001BF00();
    swift_unknownObjectRelease();
    sub_100019D14(v10, v13);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_100006EFC(&qword_100028C68);
  if (swift_dynamicCast()) {
    return v11;
  }
  uint64_t v11 = 0;
  char v12 = 1;
  id v4 = [self defaultDefaults];
  uint64_t v5 = sub_10001BEB0();

  uint64_t v6 = sub_100007FB4();
  if (*(void *)(v5 + 16) && (unint64_t v8 = sub_100019C40(v6, v7), (v9 & 1) != 0)) {
    sub_100019CB8(*(void *)(v5 + 56) + 32 * v8, (uint64_t)v10);
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (swift_dynamicCast()) {
    return v14;
  }
  else {
    return 0;
  }
}

uint64_t sub_100017EE0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1953460082;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1953460082;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x746E69486874616DLL;
      unint64_t v3 = 0xE900000000000073;
      break;
    case 2:
      uint64_t v5 = 0x75477265746E6563;
      unint64_t v3 = 0xEC00000073656469;
      break;
    case 3:
      uint64_t v5 = 0x6469754765676465;
      unint64_t v3 = 0xEA00000000007365;
      break;
    case 4:
      uint64_t v5 = 0x47676E6963617073;
      unint64_t v3 = 0xED00007365646975;
      break;
    case 5:
      uint64_t v5 = 0x72476F5470616E73;
      unint64_t v3 = 0xEA00000000006469;
      break;
    case 6:
      uint64_t v5 = 0x6E417463656C6573;
      unint64_t v3 = 0xEF6C6C6F72635364;
      break;
    case 7:
      uint64_t v5 = 0x6564497465736572;
      unint64_t v3 = 0xEF7265696669746ELL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000073;
      if (v5 == 0x746E69486874616DLL) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v6 = 0xEC00000073656469;
      if (v5 != 0x75477265746E6563) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xEA00000000007365;
      if (v5 != 0x6469754765676465) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xED00007365646975;
      if (v5 != 0x47676E6963617073) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xEA00000000006469;
      if (v5 != 0x72476F5470616E73) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      uint64_t v2 = 0x6E417463656C6573;
      unint64_t v6 = 0xEF6C6C6F72635364;
      goto LABEL_21;
    case 7:
      unint64_t v6 = 0xEF7265696669746ELL;
      if (v5 != 0x6564497465736572) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_10001BF30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1000181D4()
{
  sub_10001BEE0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100018340()
{
  return sub_10001BF70();
}

uint64_t sub_1000184BC()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DD70);
  sub_100006F40(v0, (uint64_t)qword_10002DD70);
  return sub_10001BDB0();
}

uint64_t sub_100018520()
{
  uint64_t v0 = sub_100006EFC(&qword_100028468);
  sub_100006F78(v0, qword_10002DD88);
  uint64_t v1 = sub_100006F40(v0, (uint64_t)qword_10002DD88);
  sub_10001BBB0();
  uint64_t v2 = sub_10001BBC0();
  unint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000185D8()
{
  uint64_t result = swift_getKeyPath();
  qword_10002DDA0 = result;
  return result;
}

uint64_t sub_100018600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return _swift_task_switch(sub_100018624, 0, 0);
}

uint64_t sub_100018624()
{
  sub_10001B9E0();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 72) = v1;
  sub_10001B9E0();
  *(unsigned char *)(v0 + 145) = *(unsigned char *)(v0 + 146);
  if (qword_100028308 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002DDA0;
  *(void *)(v0 + 80) = qword_10002DDA0;
  swift_retain();
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  uint64_t v4 = sub_100007098(&qword_100028C58, &qword_100028C60);
  *(void *)(v0 + 96) = v4;
  void *v3 = v0;
  v3[1] = sub_100018780;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v4);
}

uint64_t sub_100018780()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10000521C;
  }
  else {
    uint64_t v2 = sub_1000188D4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000188D4()
{
  sub_10001B9E0();
  uint64_t v1 = v0[5];
  v0[4] = v1;
  uint64_t v2 = qword_10002DDA0;
  v0[14] = v1;
  v0[15] = v2;
  swift_retain();
  unint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  void *v3 = v0;
  v3[1] = sub_100005040;
  uint64_t v4 = v0[12];
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v4);
}

uint64_t sub_1000189B0()
{
  if (qword_100028308 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100018A10()
{
  unint64_t result = qword_100028BA8;
  if (!qword_100028BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BA8);
  }
  return result;
}

unint64_t sub_100018A68()
{
  unint64_t result = qword_100028BB0;
  if (!qword_100028BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BB0);
  }
  return result;
}

uint64_t sub_100018ABC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100018AF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100018B40@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000282F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BDC0();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DD70);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100018BE8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028300 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028468);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DD88);

  return sub_100007130(v3, a1);
}

uint64_t sub_100018C64(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_1000057E8;
  *(_OWORD *)(v4 + 56) = *v1;
  *(void *)(v4 + 48) = a1;
  return _swift_task_switch(sub_100018624, 0, 0);
}

uint64_t sub_100018D18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001A2C8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100018D40()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_100018D60()
{
  unint64_t result = qword_100028BC0;
  if (!qword_100028BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BC0);
  }
  return result;
}

unint64_t sub_100018DB8()
{
  unint64_t result = qword_100028BC8;
  if (!qword_100028BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BC8);
  }
  return result;
}

uint64_t sub_100018E0C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100018E2C, 0, 0);
}

uint64_t sub_100018E2C()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_100017B94() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100018ED4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 17) = *a2;
  return _swift_task_switch(sub_100018EF8, 0, 0);
}

uint64_t sub_100018EF8()
{
  if (qword_100028218 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_10002DB40;
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v0 + 17);
  uint64_t v2 = sub_10001BF40();
  sub_10001BED0();
  NSString v3 = sub_10001BEC0();
  swift_bridgeObjectRelease();
  [v1 setObject:v2 forKey:v3];

  swift_unknownObjectRelease();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100018FF8()
{
  uint64_t v0 = sub_100006EFC(&qword_100028410);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001BDC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  if (qword_100028318 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001BD70();
  sub_100006F40(v9, (uint64_t)qword_10002DDC0);
  swift_beginAccess();
  sub_10001BD60();
  swift_endAccess();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001BBE0();
  uint64_t v10 = sub_10001BBF0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_10001BDB0();
  return sub_10001BC10();
}

uint64_t sub_1000192AC()
{
  uint64_t v0 = sub_100006EFC(&qword_100028BD8);
  sub_100006F78(v0, qword_10002DDA8);
  sub_100006F40(v0, (uint64_t)qword_10002DDA8);
  sub_10000FDD8();
  return sub_10001BC50();
}

uint64_t sub_100019328(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001BDC0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1000193B8, 0, 0);
}

uint64_t sub_1000193B8()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_100006EFC(&qword_100028BA0);
  sub_10001BDB0();
  sub_100007098(&qword_100028C58, &qword_100028C60);
  *uint64_t v1 = sub_10001BDA0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000194D0()
{
  uint64_t v0 = sub_10001BD70();
  sub_100006F78(v0, qword_10002DDC0);
  sub_100006F40(v0, (uint64_t)qword_10002DDC0);
  return sub_10001BD50();
}

uint64_t sub_10001953C()
{
  sub_100018D60();

  return sub_10001BD40();
}

uint64_t sub_100019598()
{
  return sub_100007098(&qword_100028BD0, &qword_100028BD8);
}

uint64_t sub_1000195D4()
{
  uint64_t v0 = qword_100028B88;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100019610()
{
  unint64_t result = qword_100028BE0;
  if (!qword_100028BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BE0);
  }
  return result;
}

unint64_t sub_100019668()
{
  unint64_t result = qword_100028BE8;
  if (!qword_100028BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BE8);
  }
  return result;
}

unint64_t sub_1000196C0()
{
  unint64_t result = qword_100028BF0;
  if (!qword_100028BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BF0);
  }
  return result;
}

uint64_t sub_100019714()
{
  return sub_100007098((unint64_t *)&unk_100028BF8, &qword_100028BD8);
}

uint64_t sub_100019750@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028310 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006EFC(&qword_100028BD8);
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DDA8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000197FC()
{
  sub_100019BEC();
  uint64_t v2 = sub_10001BCF0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007084(v3, v0, v2, v1);
}

unint64_t sub_100019894()
{
  unint64_t result = qword_100028C08;
  if (!qword_100028C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C08);
  }
  return result;
}

unint64_t sub_1000198EC()
{
  unint64_t result = qword_100028C10;
  if (!qword_100028C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C10);
  }
  return result;
}

unint64_t sub_100019948()
{
  unint64_t result = qword_100028C18;
  if (!qword_100028C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C18);
  }
  return result;
}

uint64_t sub_10001999C@<X0>(uint64_t *a1@<X8>)
{
  sub_10000FDD8();
  uint64_t result = sub_10001B9C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000199DC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028318 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BD70();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DDC0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100019A9C()
{
  return sub_100007098(&qword_100028C20, &qword_100028C28);
}

uint64_t sub_100019AD8(uint64_t a1)
{
  unint64_t v2 = sub_100018D60();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100019B28()
{
  unint64_t result = qword_100028C30;
  if (!qword_100028C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C30);
  }
  return result;
}

uint64_t sub_100019B80(uint64_t a1)
{
  unint64_t v2 = sub_100019948();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for CenterGuidesSettingEntity()
{
  return &type metadata for CenterGuidesSettingEntity;
}

ValueMetadata *type metadata accessor for CenterGuidesSettingEntity.UpdateIntent_value()
{
  return &type metadata for CenterGuidesSettingEntity.UpdateIntent_value;
}

unint64_t sub_100019BEC()
{
  unint64_t result = qword_100028C38;
  if (!qword_100028C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C38);
  }
  return result;
}

unint64_t sub_100019C40(uint64_t a1, uint64_t a2)
{
  sub_10001BF50();
  sub_10001BEE0();
  Swift::Int v4 = sub_10001BF70();

  return sub_100019DD4(a1, a2, v4);
}

uint64_t sub_100019CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_100019D14(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100019D24(unsigned __int8 a1)
{
  Swift::Int v2 = sub_100018340();

  return sub_100019EB8(a1, v2);
}

unint64_t sub_100019D68(unsigned __int8 a1)
{
  sub_10001BF50();
  sub_10001BF60(a1);
  Swift::Int v2 = sub_10001BF70();

  return sub_10001A228(a1, v2);
}

unint64_t sub_100019DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001BF30() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unsigned __int8 v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001BF30() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100019EB8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE400000000000000;
      uint64_t v8 = 1953460082;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v8 = 0x746E69486874616DLL;
          unint64_t v7 = 0xE900000000000073;
          break;
        case 2:
          uint64_t v8 = 0x75477265746E6563;
          unint64_t v7 = 0xEC00000073656469;
          break;
        case 3:
          unint64_t v7 = 0xEA00000000007365;
          uint64_t v8 = 0x6469754765676465;
          break;
        case 4:
          uint64_t v8 = 0x47676E6963617073;
          unint64_t v7 = 0xED00007365646975;
          break;
        case 5:
          uint64_t v8 = 0x72476F5470616E73;
          unint64_t v7 = 0xEA00000000006469;
          break;
        case 6:
          uint64_t v8 = 0x6E417463656C6573;
          unint64_t v7 = 0xEF6C6C6F72635364;
          break;
        case 7:
          uint64_t v8 = 0x6564497465736572;
          unint64_t v7 = 0xEF7265696669746ELL;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1953460082;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE900000000000073;
          if (v8 == 0x746E69486874616DLL) {
            goto LABEL_24;
          }
          goto LABEL_25;
        case 2:
          unint64_t v9 = 0xEC00000073656469;
          if (v8 != 0x75477265746E6563) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 3:
          unint64_t v9 = 0xEA00000000007365;
          if (v8 != 0x6469754765676465) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 4:
          unint64_t v9 = 0xED00007365646975;
          if (v8 != 0x47676E6963617073) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 5:
          unint64_t v9 = 0xEA00000000006469;
          if (v8 != 0x72476F5470616E73) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 6:
          unint64_t v9 = 0xEF6C6C6F72635364;
          if (v8 != 0x6E417463656C6573) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 7:
          uint64_t v10 = 0x6564497465736572;
          unint64_t v9 = 0xEF7265696669746ELL;
          goto LABEL_23;
        default:
LABEL_23:
          if (v8 != v10) {
            goto LABEL_25;
          }
LABEL_24:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_25:
          char v11 = sub_10001BF30();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_10001A228(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001A2C8()
{
  uint64_t v0 = sub_100006EFC(&qword_1000283E8);
  __chkstk_darwin(v0 - 8);
  Swift::String v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10001BCE0();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006EFC(&qword_1000283F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v11 - 8);
  unsigned __int8 v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_10001BDC0();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100006EFC(&qword_100028C70);
  sub_10001BDB0();
  Swift::String v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_10001B9A0();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  Swift::String v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100018D60();
  uint64_t v19 = v23;
  uint64_t v24 = sub_10001BA20();
  sub_100006EFC(&qword_100028408);
  sub_10001BDB0();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_10001BEF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_10001BA30();
  return v24;
}

uint64_t sub_10001A708@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SnapToGridToggleControl()
{
  return &type metadata for SnapToGridToggleControl;
}

uint64_t sub_10001A724()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A740@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100006EFC(&qword_100028470);
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006EFC(&qword_100028478);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006EFC(&qword_100028480);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006EFC(&qword_100028488);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  uint64_t v29 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100006FDC();
  sub_10001BE90();
  sub_10001BDF0();
  unint64_t v16 = sub_100007808();
  sub_10001BE20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  sub_10001BDF0();
  uint64_t v31 = v1;
  unint64_t v32 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v24;
  sub_10001BE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v18);
  uint64_t v31 = v18;
  unint64_t v32 = OpaqueTypeConformance2;
  uint64_t v19 = swift_getOpaqueTypeConformance2();
  uint64_t v20 = v26;
  sub_10001BE30();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v20);
  uint64_t v31 = v20;
  unint64_t v32 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  sub_10001BE10();
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v21);
}

uint64_t sub_10001ABF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000076B8(a1);
}

unint64_t sub_10001AC24()
{
  unint64_t result = qword_100028C90;
  if (!qword_100028C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C90);
  }
  return result;
}

uint64_t sub_10001AC7C()
{
  sub_10001B9E0();
  return v1;
}

uint64_t sub_10001ACB0()
{
  return sub_10001BA00();
}

uint64_t sub_10001ACD4()
{
  uint64_t v0 = sub_10001BDC0();
  sub_100006F78(v0, qword_10002DDD8);
  sub_100006F40(v0, (uint64_t)qword_10002DDD8);
  return sub_10001BDB0();
}

uint64_t sub_10001AD38@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001B9E0();
  *a1 = v3;
  return result;
}

uint64_t sub_10001AD74()
{
  return sub_10001B9F0();
}

void (*sub_10001ADAC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001B9D0();
  return sub_100005400;
}

unint64_t sub_10001AE10()
{
  unint64_t result = qword_100028C98;
  if (!qword_100028C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C98);
  }
  return result;
}

uint64_t sub_10001AE64(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001B7C8();
  unint64_t v5 = sub_10000B80C();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10001AECC()
{
  uint64_t v0 = qword_100028C80;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10001AF08()
{
  unint64_t result = qword_100028CA0;
  if (!qword_100028CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CA0);
  }
  return result;
}

unint64_t sub_10001AF60()
{
  unint64_t result = qword_100028CA8;
  if (!qword_100028CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CA8);
  }
  return result;
}

uint64_t sub_10001AFB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001AFD0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028320 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001BDC0();
  uint64_t v3 = sub_100006F40(v2, (uint64_t)qword_10002DDD8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10001B078()
{
  return 0;
}

uint64_t sub_10001B080()
{
  return 1;
}

uint64_t sub_10001B088()
{
  uint64_t v0 = sub_100006EFC(&qword_100028CE0);
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100006EFC(&qword_100028CE8);
  __chkstk_darwin(v1);
  sub_10001BC90();
  v3._countAndFlagsBits = 0x206E65704FLL;
  v3._object = (void *)0xE500000000000000;
  sub_10001BC80(v3);
  swift_getKeyPath();
  sub_100006EFC(&qword_100028CF0);
  sub_10001BC70();
  swift_release();
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  sub_10001BC80(v4);
  sub_10001BCA0();
  return sub_10001BC60();
}

uint64_t sub_10001B20C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001B7C8();
  unint64_t v7 = sub_10001B81C();
  unint64_t v8 = sub_10000B80C();
  void *v5 = v2;
  v5[1] = sub_10001B2E0;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10001B2E0()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    Swift::String v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_10001B3E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001B4BC();
  *a1 = result;
  return result;
}

uint64_t sub_10001B410(uint64_t a1)
{
  unint64_t v2 = sub_1000173F4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFreeformSettingsIntent()
{
  return &type metadata for OpenFreeformSettingsIntent;
}

unint64_t sub_10001B460()
{
  unint64_t result = qword_100028CB8;
  if (!qword_100028CB8)
  {
    sub_100004A8C(&qword_100028CC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CB8);
  }
  return result;
}

uint64_t sub_10001B4BC()
{
  uint64_t v17 = sub_10001BCE0();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006EFC(&qword_1000283F0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006EFC(&qword_1000283F8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001BDC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006EFC(&qword_100028CC8);
  sub_10001BDB0();
  sub_10001BDB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  char v18 = 8;
  uint64_t v14 = sub_10001B9A0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000AE90();
  return sub_10001BA10();
}

unint64_t sub_10001B7C8()
{
  unint64_t result = qword_100028CD0;
  if (!qword_100028CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CD0);
  }
  return result;
}

unint64_t sub_10001B81C()
{
  unint64_t result = qword_100028CD8;
  if (!qword_100028CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CD8);
  }
  return result;
}

uint64_t sub_10001B870@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001BA00();
  *a1 = result;
  return result;
}

uint64_t sub_10001B89C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10001B8D0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10001B8E0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10001B8F0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10001B940()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10001B950()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10001B960()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10001B970()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10001B980()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10001B9A0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10001B9B0()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_10001B9C0()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_10001B9D0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10001B9E0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10001B9F0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10001BA00()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10001BA10()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10001BA20()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10001BA30()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10001BA40()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_10001BA50()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_10001BA60()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_10001BA70()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_10001BA80()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10001BA90()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_10001BAA0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10001BAB0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10001BAC0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10001BAD0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10001BAE0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10001BAF0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10001BB00()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10001BB10()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10001BB20()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_10001BB30()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10001BB40(Swift::String a1)
{
}

uint64_t sub_10001BB50()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10001BB60()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10001BB70()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10001BB80()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10001BB90()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10001BBA0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10001BBB0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10001BBC0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10001BBD0()
{
  return DisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001BBE0()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_10001BBF0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10001BC00()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_10001BC10()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10001BC20()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_10001BC30()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10001BC40()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_10001BC50()
{
  return _UniqueEntityProvider.init(_:)();
}

uint64_t sub_10001BC60()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_10001BC70()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_10001BC80(Swift::String a1)
{
}

uint64_t sub_10001BC90()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10001BCA0()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t sub_10001BCB0()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001BCC0()
{
  return _EnumURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001BCD0()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_10001BCE0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10001BCF0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_10001BD30()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10001BD40()
{
  return _EntityURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001BD50()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001BD60()
{
  return TypeDisplayRepresentation.name.getter();
}

uint64_t sub_10001BD70()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10001BD90()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10001BDA0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10001BDB0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10001BDC0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10001BDE0()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10001BDF0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10001BE00()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10001BE10()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_10001BE20()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10001BE30()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_10001BE40()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10001BE50()
{
  return Text.init(_:)();
}

uint64_t sub_10001BE60()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_10001BE70()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_10001BE80()
{
  return ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)();
}

uint64_t sub_10001BE90()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_10001BEA0()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_10001BEB0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10001BEC0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001BED0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001BEE0()
{
  return String.hash(into:)();
}

uint64_t sub_10001BEF0()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10001BF00()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001BF10()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10001BF20(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10001BF30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001BF40()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_10001BF50()
{
  return Hasher.init(_seed:)();
}

void sub_10001BF60(Swift::UInt a1)
{
}

Swift::Int sub_10001BF70()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultDefaults(void *a1, const char *a2, ...)
{
  return _[a1 defaultDefaults];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return [a1 registerDefaults:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_usesMetricSystem(void *a1, const char *a2, ...)
{
  return _[a1 usesMetricSystem];
}