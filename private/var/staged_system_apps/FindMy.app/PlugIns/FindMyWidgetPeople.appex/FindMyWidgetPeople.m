uint64_t variable initialization expression of AnnotationPin._colorScheme@<X0>(uint64_t *a1@<X8>)
{
  return sub_100002378(&qword_1000502F8, a1);
}

uint64_t sub_100002280()
{
  return sub_1000422AC();
}

uint64_t sub_1000022A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002418(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_1000022D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of AnnotationPin._pixelLength()
{
  return swift_getKeyPath();
}

uint64_t sub_100002338@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000422CC();
  *a1 = v3;
  return result;
}

uint64_t variable initialization expression of AnnotationPin._widgetRenderingMode@<X0>(uint64_t *a1@<X8>)
{
  return sub_100002378(&qword_100050300, a1);
}

uint64_t sub_100002378@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_1000022D0(a1);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000023C8()
{
  return sub_1000423AC();
}

uint64_t sub_1000023EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002418(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_100002418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1000024E8(long long *a1)
{
  long long v2 = *a1;
  if (sub_100041580(2, 17, 0, 0)) {
    return swift_getOpaqueTypeMetadata2();
  }
  else {
    return v2;
  }
}

uint64_t sub_10000255C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (sub_100041580(2, 17, 0, 0)) {
    return swift_getOpaqueTypeConformance2();
  }
  return v1;
}

uint64_t sub_1000025C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002610()
{
  unint64_t result = qword_100050330;
  if (!qword_100050330)
  {
    sub_1000025C8(&qword_100050328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050330);
  }
  return result;
}

__n128 _s12DependenciesVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for WidgetEntryViewContent.Model.State.TemplateInfo(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000026D0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000026F0(uint64_t result, int a2, int a3)
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

uint64_t sub_100002730(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002750(uint64_t result, int a2, int a3)
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

void sub_10000278C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000027DC()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_1000027FC, v0, 0);
}

uint64_t sub_1000027FC()
{
  char v3 = (uint64_t (*)(void))(*(void *)(*(void *)(v0 + 24) + 112) + **(int **)(*(void *)(v0 + 24) + 112));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000028C8;
  return v3();
}

uint64_t sub_1000028C8(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(void *)(v4 + 24);
    return _swift_task_switch(sub_100002A18, v6, 0);
  }
  else
  {
    v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7(a1 & 1);
  }
}

uint64_t sub_100002A18()
{
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042DEC();
  if (os_log_type_enabled(v1, v2))
  {
    char v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)char v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v5;
    sub_100042E3C();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error: %{public}@", v3, 0xCu);
    sub_1000022D0(&qword_100050430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  sub_100002E4C();
  swift_willThrowTypedImpl();
  swift_errorRelease();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6(0);
}

uint64_t sub_100002BFC()
{
  return 1;
}

Swift::Int sub_100002C04()
{
  return sub_100042F1C();
}

void sub_100002C48()
{
}

Swift::Int sub_100002C70()
{
  return sub_100042F1C();
}

uint64_t sub_100002CC0()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18FindMyWidgetPeople12AccountStore_logger;
  uint64_t v2 = sub_10004211C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_100002D44()
{
  return type metadata accessor for AccountStore();
}

uint64_t type metadata accessor for AccountStore()
{
  uint64_t result = qword_100050380;
  if (!qword_100050380) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100002D98()
{
  uint64_t result = sub_10004211C();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100002E40()
{
  return v0;
}

unint64_t sub_100002E4C()
{
  unint64_t result = qword_100050428;
  if (!qword_100050428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050428);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AccountStore.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AccountStore.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100002F90);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100002FB8()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountStore.Error()
{
  return &type metadata for AccountStore.Error;
}

unsigned char *initializeBufferWithCopyOfBuffer for AccountStore.AccountInfo(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccountStore.AccountInfo(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AccountStore.AccountInfo(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000314CLL);
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

ValueMetadata *type metadata accessor for AccountStore.AccountInfo()
{
  return &type metadata for AccountStore.AccountInfo;
}

unint64_t sub_100003188()
{
  unint64_t result = qword_100050438;
  if (!qword_100050438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100050438);
  }
  return result;
}

void *_s12DependenciesVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t _s12DependenciesVwxx()
{
  return swift_release();
}

void *_s12DependenciesVwca(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s12DependenciesVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t _s12DependenciesVwet(uint64_t *a1, int a2)
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

uint64_t _s12DependenciesVwst(uint64_t result, int a2, int a3)
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s12DependenciesVMa()
{
  return &_s12DependenciesVN;
}

uint64_t sub_10000331C(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_10000333C, 0, 0);
}

uint64_t sub_10000333C()
{
  uint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100003438;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100003628;
  v0[13] = &unk_10004DF00;
  v0[14] = v2;
  [v1 aa_primaryAppleAccountWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100003438()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_1000035B8;
  }
  else {
    uint64_t v2 = sub_100003548;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003548()
{
  uint64_t v1 = *(void **)(v0 + 120);
  if (v1) {

  }
  uint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v2(v1 != 0);
}

uint64_t sub_1000035B8()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_100003628(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_1000022D0(&qword_100050450);
    uint64_t v5 = swift_allocError();
    *unsigned int v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_1000036EC((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1000036EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_100050448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003754(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  *(double *)(v10 + 88) = a8;
  *(double *)(v10 + 96) = a10;
  *(double *)(v10 + 72) = a6;
  *(double *)(v10 + 80) = a7;
  *(double *)(v10 + 56) = a4;
  *(double *)(v10 + 64) = a5;
  *(double *)(v10 + 48) = a3;
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  uint64_t v11 = sub_1000420CC();
  *(void *)(v10 + 104) = v11;
  *(void *)(v10 + 112) = *(void *)(v11 - 8);
  *(void *)(v10 + 120) = swift_task_alloc();
  uint64_t v12 = sub_10004202C();
  *(void *)(v10 + 128) = v12;
  *(void *)(v10 + 136) = *(void *)(v12 - 8);
  *(void *)(v10 + 144) = swift_task_alloc();
  uint64_t v13 = sub_100042BDC();
  *(void *)(v10 + 152) = v13;
  *(void *)(v10 + 160) = *(void *)(v13 - 8);
  *(void *)(v10 + 168) = swift_task_alloc();
  return _swift_task_switch(sub_1000038DC, 0, 0);
}

uint64_t sub_1000038DC()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for WidgetFamily.systemSmall(_:), v3);
  sub_100003DD8();
  sub_100042D5C();
  sub_100042D5C();
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  double v6 = *(double *)(v0 + 64);
  if (v5 == v4)
  {
    double v7 = *(double *)(v0 + 96) + v6 * 0.5;
    double v8 = *(double *)(v0 + 48);
  }
  else
  {
    double v8 = *(double *)(v0 + 48);
    double v7 = v8 / 3.0 - (*(double *)(v0 + 88) + v6 * 0.5);
  }
  double v10 = *(double *)(v0 + 72);
  double v9 = *(double *)(v0 + 80);
  double v11 = *(double *)(v0 + 56);
  sub_100041E5C();
  sub_100041E6C();
  sub_100003E30();
  if (qword_1000502B8 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)(v0 + 112);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v14 = *(void *)(v0 + 104);
  uint64_t v15 = sub_100003E70(v14, (uint64_t)qword_1000530A8);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v16(v12, v15, v14);
  sub_100042E1C();
  if (qword_1000502C0 != -1) {
    swift_once();
  }
  uint64_t v17 = *(void *)(v0 + 120);
  uint64_t v18 = *(void *)(v0 + 104);
  uint64_t v19 = sub_100003E70(v18, (uint64_t)qword_1000530C0);
  v16(v17, v19, v18);
  sub_100042E1C();
  sub_10004201C();
  v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v20;
  void *v20 = v0;
  v20[1] = sub_100003BC0;
  uint64_t v23 = *(void *)(v0 + 144);
  v24.n128_u64[0] = *(void *)(v0 + 48);
  v25.n128_u64[0] = *(void *)(v0 + 56);
  v21.n128_f64[0] = v8 * 0.5 - v7;
  v22.n128_f64[0] = v11 * 0.5 - (v9 + v10);
  return static StaticMapGenerator.generateImage(focusedAnnotation:centerOffset:size:allowPitch:)(v23, 0, v21, v22, v24, v25);
}

uint64_t sub_100003BC0(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[23] = v1;
  swift_task_dealloc();
  if (v1)
  {
    (*(void (**)(void, void))(v4[17] + 8))(v4[18], v4[16]);
    return _swift_task_switch(sub_100003D5C, 0, 0);
  }
  else
  {
    (*(void (**)(void, void))(v4[17] + 8))(v4[18], v4[16]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(uint64_t))v4[1];
    return v5(a1);
  }
}

uint64_t sub_100003D5C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_100003DD8()
{
  unint64_t result = qword_100050460;
  if (!qword_100050460)
  {
    sub_100042BDC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050460);
  }
  return result;
}

unint64_t sub_100003E30()
{
  unint64_t result = qword_100050468;
  if (!qword_100050468)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100050468);
  }
  return result;
}

uint64_t sub_100003E70(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003EA8()
{
  uint64_t v26 = sub_1000427BC();
  uint64_t v0 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000427CC();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004283C();
  type metadata accessor for CGPoint(0);
  sub_1000421EC();
  swift_release();
  double v7 = v30;
  double v8 = v31;
  sub_10004282C();
  sub_100004208();
  uint64_t v9 = sub_100042DAC();
  double v10 = &_swiftEmptyArrayStorage;
  if (!v9)
  {
    __n128 v24 = v6;
LABEL_11:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v24, v3);
    return (uint64_t)v10;
  }
  uint64_t v11 = v9;
  v29 = &_swiftEmptyArrayStorage;
  sub_100040BCC(0, v9 & ~(v9 >> 63), 0);
  uint64_t v27 = v6;
  uint64_t result = sub_100042D9C();
  if ((v11 & 0x8000000000000000) == 0)
  {
    uint64_t v25 = v4;
    do
    {
      uint64_t v13 = v3;
      uint64_t v14 = (void (*)(char *, void))sub_100042DCC();
      uint64_t v15 = v26;
      (*(void (**)(char *))(v0 + 16))(v2);
      v14(v28, 0);
      sub_1000427AC();
      double v16 = v30;
      double v17 = v31;
      uint64_t v18 = v32;
      double v19 = v33;
      double v20 = v34;
      (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v15);
      double v10 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100040BCC(0, v10[2] + 1, 1);
        double v10 = v29;
      }
      unint64_t v22 = v10[2];
      unint64_t v21 = v10[3];
      if (v22 >= v21 >> 1)
      {
        sub_100040BCC(v21 > 1, v22 + 1, 1);
        double v10 = v29;
      }
      v10[2] = v22 + 1;
      uint64_t v23 = (double *)&v10[4 * v22];
      v23[4] = v7 + v16;
      v23[5] = v8 + v17 - v19;
      *((void *)v23 + 6) = v18;
      v23[7] = v19 + v20;
      __n128 v24 = v27;
      uint64_t v3 = v13;
      sub_100042DBC();
      --v11;
    }
    while (v11);
    uint64_t v4 = v25;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

unint64_t sub_100004208()
{
  unint64_t result = qword_100050470;
  if (!qword_100050470)
  {
    sub_1000427CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050470);
  }
  return result;
}

unint64_t sub_100004264()
{
  unint64_t result = qword_100050478;
  if (!qword_100050478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050478);
  }
  return result;
}

unint64_t sub_1000042BC()
{
  unint64_t result = qword_100050480;
  if (!qword_100050480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050480);
  }
  return result;
}

unint64_t sub_100004314()
{
  unint64_t result = qword_100050488;
  if (!qword_100050488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050488);
  }
  return result;
}

unint64_t sub_10000436C()
{
  unint64_t result = qword_100050490;
  if (!qword_100050490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050490);
  }
  return result;
}

uint64_t sub_1000043C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004410@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004294C();
  *a1 = result;
  return result;
}

uint64_t sub_100004438()
{
  uint64_t v0 = sub_10004262C();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000022D0(&qword_1000504A8);
  __chkstk_darwin();
  v5[0] = sub_10004293C();
  sub_10004261C();
  sub_100042B2C();
  sub_1000428EC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  v5[0] = &type metadata for Color;
  v5[1] = &type metadata for Color;
  v5[2] = &protocol witness table for Color;
  v5[3] = &protocol witness table for Color;
  swift_getOpaqueTypeConformance2();
  return sub_100042ABC();
}

uint64_t sub_100004604()
{
  uint64_t v0 = sub_100041EAC();
  sub_100005928(v0, qword_100053068);
  sub_100003E70(v0, (uint64_t)qword_100053068);
  return sub_100041E9C();
}

uint64_t sub_100004668@<X0>(uint64_t a1@<X8>)
{
  if (qword_100050290 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100041EAC();
  uint64_t v3 = sub_100003E70(v2, (uint64_t)qword_100053068);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100004724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000058D4();
  *uint64_t v4 = v2;
  v4[1] = sub_1000047D0;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_1000047D0()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_1000048D8(uint64_t a1)
{
  unint64_t v2 = sub_100004264();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for WidgetPreviewWrapper()
{
  return &type metadata for WidgetPreviewWrapper;
}

ValueMetadata *type metadata accessor for WidgetPreviewWrapper.Intent()
{
  return &type metadata for WidgetPreviewWrapper.Intent;
}

uint64_t sub_100004934()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004950@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100041F0C();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_1000049BC@<X0>(uint64_t a1@<X8>)
{
  sub_100041EEC();
  uint64_t result = type metadata accessor for WidgetPreviewWrapper.Provider.Entry();
  uint64_t v3 = (void *)(a1 + *(int *)(result + 20));
  *uint64_t v3 = 0x6C6F686563616C70;
  v3[1] = 0xEB00000000726564;
  return result;
}

uint64_t sub_100004A10(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100004A30, 0, 0);
}

uint64_t sub_100004A30()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_100041EEC();
  unint64_t v2 = (void *)(v1 + *(int *)(type metadata accessor for WidgetPreviewWrapper.Provider.Entry() + 20));
  *unint64_t v2 = 0x746F687370616E73;
  v2[1] = 0xE800000000000000;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100004ABC(uint64_t a1)
{
  v1[2] = a1;
  sub_100042C1C();
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_100041F0C();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_100004BA8, 0, 0);
}

uint64_t sub_100004BA8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_1000022D0(&qword_1000505A0);
  uint64_t v4 = type metadata accessor for WidgetPreviewWrapper.Provider.Entry();
  unint64_t v5 = (*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100046410;
  sub_100041EEC();
  unint64_t v7 = v6 + v5;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7, v1, v3);
  double v8 = (void *)(v7 + *(int *)(v4 + 20));
  *double v8 = 0x656E696C656D6974;
  v8[1] = 0xE800000000000000;
  sub_100042C0C();
  sub_100006008();
  sub_100042CDC();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100004D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  void v5[4] = type metadata accessor for WidgetPreviewWrapper.Provider.Entry();
  v5[5] = swift_task_alloc();
  return _swift_task_switch(sub_100004DC0, 0, 0);
}

uint64_t sub_100004DC0()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = (void (*)(uint64_t))v0[2];
  sub_100041EEC();
  uint64_t v4 = (void *)(v1 + *(int *)(v2 + 20));
  *uint64_t v4 = 0x746F687370616E73;
  v4[1] = 0xE800000000000000;
  v3(v1);
  sub_100006340(v1);
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100004E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_100042C1C();
  void v5[4] = swift_task_alloc();
  uint64_t v6 = sub_100041F0C();
  v5[5] = v6;
  v5[6] = *(void *)(v6 - 8);
  v5[7] = swift_task_alloc();
  uint64_t v7 = sub_1000022D0(&qword_100050598);
  v5[8] = v7;
  v5[9] = *(void *)(v7 - 8);
  v5[10] = swift_task_alloc();
  return _swift_task_switch(sub_100004FB8, 0, 0);
}

uint64_t sub_100004FB8()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v14 = v0[8];
  uint64_t v13 = (void (*)(uint64_t))v0[2];
  sub_1000022D0(&qword_1000505A0);
  uint64_t v6 = type metadata accessor for WidgetPreviewWrapper.Provider.Entry();
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100046410;
  sub_100041EEC();
  unint64_t v9 = v8 + v7;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v9, v3, v4);
  double v10 = (void *)(v9 + *(int *)(v6 + 20));
  *double v10 = 0x656E696C656D6974;
  v10[1] = 0xE800000000000000;
  sub_100042C0C();
  sub_100006008();
  sub_100042CDC();
  v13(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10000518C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000639C;
  v3[2] = a1;
  return _swift_task_switch(sub_100004A30, 0, 0);
}

uint64_t sub_100005234(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000639C;
  return sub_100004ABC(a1);
}

uint64_t sub_1000052CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_10000530C(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_10004E038, (uint64_t)&unk_1000505B8);
}

uint64_t sub_1000052EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_10000530C(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_10004E010, (uint64_t)&unk_100050590);
}

uint64_t sub_10000530C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = sub_100042C9C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin();
  sub_1000022D0(&qword_100050580);
  __chkstk_darwin();
  double v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100042D8C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v12);
  unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  double v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = 0;
  *((void *)v19 + 3) = 0;
  *((void *)v19 + 4) = a3;
  *((void *)v19 + 5) = a4;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v19[v18], (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  swift_retain();
  sub_1000342A4((uint64_t)v16, a8, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_1000054E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_100005594;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100005594()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000639C;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

void sub_10000573C(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_100004438;
  a1[1] = 0;
}

uint64_t sub_100005754()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  sub_100005880();
  swift_retain();
  return sub_100042C2C();
}

uint64_t sub_100005818()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100005850@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t sub_100005880()
{
  unint64_t result = qword_1000504A0;
  if (!qword_1000504A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000504A0);
  }
  return result;
}

unint64_t sub_1000058D4()
{
  unint64_t result = qword_1000504B0;
  if (!qword_1000504B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000504B0);
  }
  return result;
}

uint64_t *sub_100005928(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for WidgetPreviewWrapper.Provider()
{
  return &type metadata for WidgetPreviewWrapper.Provider;
}

uint64_t *sub_10000599C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100041F0C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    double v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    void *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100005A74(uint64_t a1)
{
  uint64_t v2 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100005AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100005B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100005C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005D2C);
}

uint64_t sub_100005D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100005DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005E04);
}

uint64_t sub_100005E04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100041F0C();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for WidgetPreviewWrapper.Provider.Entry()
{
  uint64_t result = qword_100050510;
  if (!qword_100050510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005F10()
{
  uint64_t result = sub_100041F0C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100005FA8()
{
  unint64_t result = qword_100050548;
  if (!qword_100050548)
  {
    sub_1000025C8(&qword_100050550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050548);
  }
  return result;
}

unint64_t sub_100006008()
{
  unint64_t result = qword_100050558[0];
  if (!qword_100050558[0])
  {
    type metadata accessor for WidgetPreviewWrapper.Provider.Entry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100050558);
  }
  return result;
}

uint64_t sub_100006068(uint64_t a1)
{
  sub_100042C9C();
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000639C;
  return sub_100004E6C(a1, v4, v5, v6, v7);
}

uint64_t sub_10000616C()
{
  uint64_t v1 = sub_100042C9C();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_100006240(uint64_t a1)
{
  sub_100042C9C();
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000639C;
  return sub_100004D2C(a1, v4, v5, v6, v7);
}

uint64_t sub_100006340(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WidgetPreviewWrapper.Provider.Entry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000063A0()
{
  sub_1000092F0();
  uint64_t result = sub_10004243C();
  static VerticalAlignment.annotationPinAlignment = result;
  return result;
}

uint64_t *VerticalAlignment.annotationPinAlignment.unsafeMutableAddressor()
{
  if (qword_100050298 != -1) {
    swift_once();
  }
  return &static VerticalAlignment.annotationPinAlignment;
}

uint64_t static VerticalAlignment.annotationPinAlignment.getter()
{
  return sub_10000650C(&qword_100050298, (uint64_t)&static VerticalAlignment.annotationPinAlignment);
}

uint64_t sub_100006440()
{
  return sub_10004223C();
}

uint64_t sub_10000646C()
{
  sub_10000929C();
  uint64_t result = sub_10004250C();
  static HorizontalAlignment.annotationPinAlignment = result;
  return result;
}

uint64_t *HorizontalAlignment.annotationPinAlignment.unsafeMutableAddressor()
{
  if (qword_1000502A0 != -1) {
    swift_once();
  }
  return &static HorizontalAlignment.annotationPinAlignment;
}

uint64_t static HorizontalAlignment.annotationPinAlignment.getter()
{
  return sub_10000650C(&qword_1000502A0, (uint64_t)&static HorizontalAlignment.annotationPinAlignment);
}

uint64_t sub_10000650C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(void *)a2;
}

uint64_t sub_100006548()
{
  return sub_10004224C();
}

uint64_t AnnotationPin.init(icon:showTail:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v8 = (int *)type metadata accessor for AnnotationPin();
  uint64_t v9 = (uint64_t *)(a3 + v8[6]);
  uint64_t *v9 = swift_getKeyPath();
  sub_1000022D0(&qword_1000502F8);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = a3 + v8[7];
  *(void *)uint64_t v10 = swift_getKeyPath();
  *(unsigned char *)(v10 + 8) = 0;
  uint64_t v11 = (uint64_t *)(a3 + v8[8]);
  uint64_t *v11 = swift_getKeyPath();
  sub_1000022D0(&qword_100050300);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(void *)a3 = a1;
  *(double *)(a3 + 8) = a4;
  *(unsigned char *)(a3 + 16) = a2;
  return result;
}

uint64_t type metadata accessor for AnnotationPin()
{
  uint64_t result = qword_100050638;
  if (!qword_100050638) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AnnotationPin.body.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1000424EC();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_1000022D0(&qword_1000505C8);
  return sub_1000066F8(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_1000066F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_1000425DC();
  __chkstk_darwin(v3 - 8);
  v58 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000022D0(&qword_1000506A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1000022D0(&qword_1000506A8);
  __chkstk_darwin(v56);
  uint64_t v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000420CC();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_1000022D0(&qword_1000506B0);
  uint64_t v14 = __chkstk_darwin(v57);
  double v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v56 - v17;
  char v19 = *(unsigned char *)(a1 + 16);
  if (qword_1000502D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100003E70(v10, (uint64_t)qword_1000530F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v20, v10);
  uint64_t v21 = sub_10004297C();
  LOBYTE(v60) = v19;
  uint64_t v61 = v21;
  LOWORD(v62) = 256;
  sub_1000022D0(&qword_1000506B8);
  sub_100009134(&qword_1000506C0, &qword_1000506B8);
  sub_10004287C();
  swift_release();
  uint64_t v22 = sub_100042B1C();
  uint64_t v24 = v23;
  uint64_t v25 = (uint64_t)&v18[*(int *)(sub_1000022D0(&qword_1000506C8) + 36)];
  sub_100006CC0((uint64_t)v7);
  uint64_t v26 = a1 + *(int *)(type metadata accessor for AnnotationPin() + 28);
  uint64_t v27 = *(void *)v26;
  char v28 = *(unsigned char *)(v26 + 8);
  sub_1000082F4(*(void *)v26, v28);
  sub_10002BFD0(v27, v28);
  sub_100008444(v27, v28);
  LOBYTE(v27) = sub_10004266C();
  sub_10004214C();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  sub_1000091DC((uint64_t)v7, (uint64_t)v9, &qword_1000506A0);
  v37 = &v9[*(int *)(v56 + 36)];
  char *v37 = v27;
  *((void *)v37 + 1) = v30;
  *((void *)v37 + 2) = v32;
  *((void *)v37 + 3) = v34;
  *((void *)v37 + 4) = v36;
  v37[40] = 0;
  sub_100009240((uint64_t)v7, &qword_1000506A0);
  sub_1000425CC();
  sub_1000022D0(&qword_1000506D0);
  sub_10004263C();
  sub_100009178((uint64_t)v9, v25, &qword_1000506A8);
  v38 = (uint64_t *)(v25 + *(int *)(sub_1000022D0(&qword_1000506D8) + 36));
  uint64_t *v38 = v22;
  v38[1] = v24;
  uint64_t v39 = sub_100042B1C();
  uint64_t v41 = v40;
  uint64_t v42 = (uint64_t)&v18[*(int *)(v57 + 36)];
  sub_10000701C((id *)a1, v42);
  v43 = (uint64_t *)(v42 + *(int *)(sub_1000022D0(&qword_1000506E0) + 36));
  uint64_t *v43 = v39;
  v43[1] = v41;
  sub_100042B2C();
  sub_1000421CC();
  v58 = v60;
  LODWORD(v57) = v61;
  uint64_t v44 = v62;
  char v45 = v63;
  uint64_t v46 = v64;
  uint64_t v47 = v65;
  if (qword_1000502A0 != -1) {
    swift_once();
  }
  uint64_t v48 = (uint64_t)v18;
  uint64_t v49 = static HorizontalAlignment.annotationPinAlignment;
  if (qword_100050298 != -1) {
    swift_once();
  }
  uint64_t v50 = static VerticalAlignment.annotationPinAlignment;
  sub_1000091DC(v48, (uint64_t)v16, &qword_1000506B0);
  uint64_t v51 = (uint64_t)v16;
  uint64_t v52 = (uint64_t)v16;
  uint64_t v53 = v59;
  sub_1000091DC(v51, v59, &qword_1000506B0);
  uint64_t v54 = v53 + *(int *)(sub_1000022D0(&qword_1000506E8) + 48);
  *(void *)uint64_t v54 = v58;
  *(unsigned char *)(v54 + 8) = v57;
  *(void *)(v54 + 16) = v44;
  *(unsigned char *)(v54 + 24) = v45;
  *(void *)(v54 + 32) = v46;
  *(void *)(v54 + 40) = v47;
  *(void *)(v54 + 48) = v49;
  *(void *)(v54 + 56) = sub_100006548;
  *(void *)(v54 + 64) = 0;
  *(void *)(v54 + 72) = v50;
  *(void *)(v54 + 80) = sub_100006440;
  *(void *)(v54 + 88) = 0;
  sub_100009240(v48, &qword_1000506B0);
  return sub_100009240(v52, &qword_1000506B0);
}

uint64_t sub_100006CA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006CC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v22 = sub_1000022D0(&qword_100050720);
  __chkstk_darwin(v22);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000022D0(&qword_100050728);
  __chkstk_darwin(v19);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000022D0(&qword_100050730);
  __chkstk_darwin(v20);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004217C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v19 - v12;
  type metadata accessor for AnnotationPin();
  sub_10002BF94((uint64_t)v13);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for ColorScheme.dark(_:), v7);
  char v14 = sub_10004216C();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
  if (v14)
  {
    sub_100007680((uint64_t)v6);
    double v16 = &qword_100050730;
    sub_1000091DC((uint64_t)v6, (uint64_t)v4, &qword_100050730);
    swift_storeEnumTagMultiPayload();
    sub_100009134(&qword_100050738, &qword_100050730);
    sub_100009074();
    sub_1000425AC();
    uint64_t v17 = (uint64_t)v6;
  }
  else
  {
    sub_100007980((uint64_t)v2);
    double v16 = &qword_100050720;
    sub_1000091DC((uint64_t)v2, (uint64_t)v4, &qword_100050720);
    swift_storeEnumTagMultiPayload();
    sub_100009134(&qword_100050738, &qword_100050730);
    sub_100009074();
    sub_1000425AC();
    uint64_t v17 = (uint64_t)v2;
  }
  return sub_100009240(v17, v16);
}

uint64_t sub_10000701C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_100042B9C();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v46 - v7;
  uint64_t v9 = sub_1000022D0(&qword_1000506F0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10004299C();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1000022D0(&qword_1000506F8);
  uint64_t v50 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_1000022D0(&qword_100050700) - 8;
  __chkstk_darwin(v48);
  uint64_t v47 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_1000022D0(&qword_100050708) - 8;
  __chkstk_darwin(v55);
  uint64_t v51 = (uint64_t)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1000022D0(&qword_100050710) - 8;
  __chkstk_darwin(v53);
  uint64_t v49 = (uint64_t)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1000022D0(&qword_100050718) - 8;
  __chkstk_darwin(v56);
  uint64_t v52 = (uint64_t)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = *a1;
  sub_10004298C();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for Image.ResizingMode.stretch(_:), v12);
  double v23 = 0.0;
  sub_1000429EC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_100042BBC();
  uint64_t v24 = sub_100042BCC();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 0, 1, v24);
  sub_1000429DC();
  swift_release();
  sub_100009240((uint64_t)v11, &qword_1000506F0);
  type metadata accessor for AnnotationPin();
  uint64_t v46 = a1;
  sub_10002C1DC((uint64_t)v8);
  sub_100042B8C();
  LOBYTE(v15) = sub_100042B7C();
  uint64_t v25 = v58;
  uint64_t v26 = *(void (**)(char *, uint64_t))(v57 + 8);
  v26(v6, v58);
  v26(v8, v25);
  if (v15) {
    double v23 = 1.0;
  }
  uint64_t v27 = v50;
  uint64_t v28 = (uint64_t)v47;
  uint64_t v29 = v54;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v47, v17, v54);
  *(double *)(v28 + *(int *)(v48 + 44)) = v23;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v29);
  sub_10002C1DC((uint64_t)v8);
  sub_100042B8C();
  char v30 = sub_100042B7C();
  v26(v6, v25);
  v26(v8, v25);
  if (v30) {
    double v31 = 0.9;
  }
  else {
    double v31 = 1.0;
  }
  uint64_t v32 = v51;
  sub_1000091DC(v28, v51, &qword_100050700);
  *(double *)(v32 + *(int *)(v55 + 44)) = v31;
  sub_100009240(v28, &qword_100050700);
  uint64_t v33 = v49;
  sub_1000091DC(v32, v49, &qword_100050708);
  uint64_t v34 = v33 + *(int *)(v53 + 44);
  *(void *)uint64_t v34 = 0;
  *(_WORD *)(v34 + 8) = 1;
  sub_100009240(v32, &qword_100050708);
  LOBYTE(v32) = sub_10004266C();
  sub_10004214C();
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v43 = v52;
  sub_1000091DC(v33, v52, &qword_100050710);
  uint64_t v44 = v43 + *(int *)(v56 + 44);
  *(unsigned char *)uint64_t v44 = v32;
  *(void *)(v44 + 8) = v36;
  *(void *)(v44 + 16) = v38;
  *(void *)(v44 + 24) = v40;
  *(void *)(v44 + 32) = v42;
  *(unsigned char *)(v44 + 40) = 0;
  sub_100009240(v33, &qword_100050710);
  return sub_100009178(v43, v59, &qword_100050718);
}

uint64_t sub_100007680@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v1 = sub_1000421AC();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000022D0(&qword_100050758);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000022D0(&qword_100050760) - 8;
  __chkstk_darwin();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004295C();
  sub_10004296C();
  swift_release();
  sub_10004219C();
  swift_release();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v18(v6, v4, v1);
  uint64_t v10 = *(void (**)(char *, uint64_t))(v2 + 8);
  v10(v4, v1);
  sub_1000091DC((uint64_t)v6, (uint64_t)v9, &qword_100050758);
  *(_WORD *)&v9[*(int *)(v7 + 64)] = 256;
  sub_100009240((uint64_t)v6, &qword_100050758);
  sub_10004295C();
  sub_10004296C();
  swift_release();
  sub_10004219C();
  swift_release();
  v18(v6, v4, v1);
  v10(v4, v1);
  uint64_t v11 = v19;
  sub_1000091DC((uint64_t)v6, v19, &qword_100050758);
  *(_WORD *)(v11 + *(int *)(v7 + 64)) = 256;
  uint64_t v12 = sub_100042B2C();
  uint64_t v14 = v13;
  uint64_t v15 = v11 + *(int *)(sub_1000022D0(&qword_100050768) + 36);
  sub_1000091DC((uint64_t)v9, v15, &qword_100050760);
  uint64_t v16 = (uint64_t *)(v15 + *(int *)(sub_1000022D0(&qword_100050770) + 36));
  *uint64_t v16 = v12;
  v16[1] = v14;
  sub_100009240((uint64_t)v6, &qword_100050758);
  return sub_100009240((uint64_t)v9, &qword_100050760);
}

uint64_t sub_100007980@<X0>(uint64_t a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v62 = sub_1000022D0(&qword_100050778);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v63 = (uint64_t)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000421AC();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000022D0(&qword_100050758);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000022D0(&qword_100050760);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000022D0(&qword_100050730);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v53 = (uint64_t)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v59 = (uint64_t)&v50 - v14;
  uint64_t v60 = sub_1000022D0(&qword_100050750);
  uint64_t v15 = __chkstk_darwin(v60);
  uint64_t v54 = (uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v55 = (uint64_t)&v50 - v17;
  int v57 = *(unsigned __int8 *)(v1 + 16);
  sub_10004295C();
  sub_10004296C();
  swift_release();
  sub_10004219C();
  swift_release();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v18(v8, v6, v3);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v56 = v4 + 8;
  v19(v6, v3);
  sub_1000091DC((uint64_t)v8, (uint64_t)v11, &qword_100050758);
  uint64_t v65 = v9;
  uint64_t v20 = *(int *)(v9 + 56);
  uint64_t v58 = v11;
  *(_WORD *)&v11[v20] = 256;
  uint64_t v21 = (uint64_t)v8;
  sub_100009240((uint64_t)v8, &qword_100050758);
  sub_10004295C();
  sub_10004296C();
  swift_release();
  sub_10004219C();
  swift_release();
  uint64_t v52 = (void (*)(uint64_t, char *, uint64_t))v18;
  v18(v8, v6, v3);
  uint64_t v50 = v3;
  uint64_t v51 = v19;
  v19(v6, v3);
  if (v57 == 1)
  {
    uint64_t v22 = (uint64_t)v8;
    uint64_t v23 = v59;
    sub_1000091DC(v22, v59, &qword_100050758);
    *(_WORD *)(v23 + *(int *)(v65 + 56)) = 256;
    uint64_t v24 = sub_100042B2C();
    uint64_t v26 = v25;
    uint64_t v27 = v23 + *(int *)(sub_1000022D0(&qword_100050768) + 36);
    uint64_t v28 = (uint64_t)v58;
    sub_1000091DC((uint64_t)v58, v27, &qword_100050760);
    uint64_t v29 = (uint64_t *)(v27 + *(int *)(sub_1000022D0(&qword_100050770) + 36));
    uint64_t *v29 = v24;
    v29[1] = v26;
    sub_100009240(v21, &qword_100050758);
    sub_100009240(v28, &qword_100050760);
    sub_10004295C();
    sub_10004296C();
    swift_release();
    sub_10004219C();
    swift_release();
    uint64_t v30 = v50;
    v52(v21, v6, v50);
    v51(v6, v30);
    uint64_t v31 = v54;
    sub_1000091DC(v21, v54, &qword_100050758);
    *(_WORD *)(v31 + *(int *)(v65 + 56)) = 256;
    uint64_t v32 = sub_100042B2C();
    uint64_t v34 = v33;
    uint64_t v35 = v31 + *(int *)(sub_1000022D0(&qword_100050780) + 36);
    sub_1000091DC(v23, v35, &qword_100050730);
    uint64_t v36 = (uint64_t *)(v35 + *(int *)(sub_1000022D0(&qword_100050788) + 36));
    *uint64_t v36 = v32;
    v36[1] = v34;
    sub_100009240(v21, &qword_100050758);
    sub_100009240(v23, &qword_100050730);
    uint64_t v37 = v55;
    sub_100009178(v31, v55, &qword_100050750);
    sub_1000091DC(v37, v63, &qword_100050750);
    swift_storeEnumTagMultiPayload();
    sub_100009134(&qword_100050748, &qword_100050750);
    sub_100009134(&qword_100050738, &qword_100050730);
    sub_1000425AC();
    uint64_t v38 = v37;
    uint64_t v39 = &qword_100050750;
  }
  else
  {
    uint64_t v40 = v53;
    sub_1000091DC((uint64_t)v8, v53, &qword_100050758);
    *(_WORD *)(v40 + *(int *)(v65 + 56)) = 256;
    uint64_t v41 = sub_100042B2C();
    uint64_t v43 = v42;
    uint64_t v44 = v40 + *(int *)(sub_1000022D0(&qword_100050768) + 36);
    uint64_t v45 = (uint64_t)v58;
    sub_1000091DC((uint64_t)v58, v44, &qword_100050760);
    uint64_t v46 = (uint64_t *)(v44 + *(int *)(sub_1000022D0(&qword_100050770) + 36));
    *uint64_t v46 = v41;
    v46[1] = v43;
    sub_100009240(v21, &qword_100050758);
    sub_100009240(v45, &qword_100050760);
    uint64_t v47 = v40;
    uint64_t v48 = v59;
    sub_100009178(v47, v59, &qword_100050730);
    sub_1000091DC(v48, v63, &qword_100050730);
    swift_storeEnumTagMultiPayload();
    sub_100009134(&qword_100050748, &qword_100050750);
    sub_100009134(&qword_100050738, &qword_100050730);
    sub_1000425AC();
    uint64_t v38 = v48;
    uint64_t v39 = &qword_100050730;
  }
  return sub_100009240(v38, v39);
}

uint64_t sub_1000080E8()
{
  return sub_1000428DC();
}

char *initializeBufferWithCopyOfBuffer for AnnotationPin(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    a1[16] = *((unsigned char *)a2 + 16);
    uint64_t v8 = a3[6];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (char **)((char *)a2 + v8);
    uint64_t v11 = v5;
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004217C();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *(void *)uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[7];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = *(unsigned char *)(v15 + 8);
    sub_1000082F4(*(void *)v15, v17);
    *(void *)uint64_t v14 = v16;
    v14[8] = v17;
    uint64_t v18 = a3[8];
    uint64_t v19 = &a1[v18];
    uint64_t v20 = (char **)((char *)a2 + v18);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_100042B9C();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *(void *)uint64_t v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000082F4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for AnnotationPin(id *a1, int *a2)
{
  int v4 = (char *)a1 + a2[6];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004217C();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_100008444(*(uint64_t *)((char *)a1 + a2[7]), *((unsigned char *)a1 + a2[7] + 8));
  uint64_t v6 = (char *)a1 + a2[8];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100042B9C();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100008444(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for AnnotationPin(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  id v11 = v6;
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004217C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)v15;
  char v17 = *(unsigned char *)(v15 + 8);
  sub_1000082F4(*(void *)v15, v17);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = sub_100042B9C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  }
  else
  {
    *uint64_t v19 = *v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for AnnotationPin(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (a1 != a2)
  {
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)(a1 + v9);
    id v11 = (void *)(a2 + v9);
    sub_100009240(a1 + v9, &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void *)v15;
  char v17 = *(unsigned char *)(v15 + 8);
  sub_1000082F4(*(void *)v15, v17);
  uint64_t v18 = *(void *)v14;
  char v19 = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v14 = v16;
  *(unsigned char *)(v14 + 8) = v17;
  sub_100008444(v18, v19);
  if (a1 != a2)
  {
    uint64_t v20 = a3[8];
    uint64_t v21 = (void *)(a1 + v20);
    uint64_t v22 = (void *)(a2 + v20);
    sub_100009240(a1 + v20, &qword_100050300);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = sub_100042B9C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else
    {
      *uint64_t v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for AnnotationPin(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  id v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004217C();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  uint64_t v15 = (void *)(a1 + v12);
  uint64_t v16 = (const void *)(a2 + v12);
  uint64_t v17 = sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_100042B9C();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for AnnotationPin(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (a1 != a2)
  {
    uint64_t v7 = a3[6];
    id v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_100009240(a1 + v7, &qword_1000502F8);
    uint64_t v10 = sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_10004217C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  LOBYTE(v14) = *((unsigned char *)v14 + 8);
  uint64_t v16 = *(void *)v13;
  char v17 = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v13 = v15;
  *(unsigned char *)(v13 + 8) = (_BYTE)v14;
  sub_100008444(v16, v17);
  if (a1 != a2)
  {
    uint64_t v18 = a3[8];
    char v19 = (void *)(a1 + v18);
    uint64_t v20 = (const void *)(a2 + v18);
    sub_100009240(a1 + v18, &qword_100050300);
    uint64_t v21 = sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_100042B9C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AnnotationPin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008B78);
}

uint64_t sub_100008B78(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000022D0(&qword_1000505D0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000022D0(&qword_1000505D8);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AnnotationPin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008CC0);
}

void *sub_100008CC0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_1000022D0(&qword_1000505D0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000022D0(&qword_1000505D8);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 32);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_100008DF4()
{
  sub_100008F10(319, &qword_100050648, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v0 <= 0x3F)
  {
    sub_100008F10(319, (unint64_t *)&unk_100050650, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100008F10(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004218C();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for AnnotationPin.Icon(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for AnnotationPin.Icon(id *a1)
{
}

uint64_t assignWithCopy for AnnotationPin.Icon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AnnotationPin.Icon(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for AnnotationPin.Icon()
{
  return &type metadata for AnnotationPin.Icon;
}

uint64_t sub_100009038()
{
  return sub_100009134(&qword_100050690, &qword_100050698);
}

unint64_t sub_100009074()
{
  unint64_t result = qword_100050740;
  if (!qword_100050740)
  {
    sub_1000025C8(&qword_100050720);
    sub_100009134(&qword_100050748, &qword_100050750);
    sub_100009134(&qword_100050738, &qword_100050730);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050740);
  }
  return result;
}

uint64_t sub_100009134(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000025C8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009178(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000022D0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000091DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000022D0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009240(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000022D0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000929C()
{
  unint64_t result = qword_100050790;
  if (!qword_100050790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050790);
  }
  return result;
}

unint64_t sub_1000092F0()
{
  unint64_t result = qword_100050798;
  if (!qword_100050798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050798);
  }
  return result;
}

ValueMetadata *_s22AnnotationPinAlignmentVMa()
{
  return &_s22AnnotationPinAlignmentVN;
}

ValueMetadata *_s22AnnotationPinAlignmentVMa_0()
{
  return &_s22AnnotationPinAlignmentVN_0;
}

unsigned char *storeEnumTagSinglePayload for AnnotationPinShape(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100009434);
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

ValueMetadata *type metadata accessor for AnnotationPinShape()
{
  return &type metadata for AnnotationPinShape;
}

unint64_t sub_100009470()
{
  unint64_t result = qword_1000507A0;
  if (!qword_1000507A0)
  {
    sub_1000025C8(&qword_1000507A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000507A0);
  }
  return result;
}

uint64_t sub_1000094CC@<X0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>)
{
  CGRectGetWidth(*(CGRect *)&a3);
  uint64_t result = sub_10004275C();
  if (a1)
  {
    __chkstk_darwin(result);
    sub_10004276C();
    sub_10004274C();
    sub_10004270C();
    uint64_t v9 = v18;
    uint64_t v10 = v19;
    uint64_t v11 = v20;
    uint64_t v12 = v21;
    char v13 = v22;
    sub_100009B08((uint64_t)v16);
    sub_100009B08((uint64_t)v14);
    uint64_t result = sub_100009B08((uint64_t)v17);
  }
  else
  {
    uint64_t v9 = v14[0];
    uint64_t v10 = v14[1];
    uint64_t v11 = v14[2];
    uint64_t v12 = v14[3];
    char v13 = v15;
  }
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = v13;
  return result;
}

uint64_t sub_100009628()
{
  return sub_10004271C();
}

double sub_100009784@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_1000094CC(*v2, (uint64_t)v6, a2);
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a1 = v6[0];
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v7;
  return result;
}

double sub_1000097D4(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a4)
  {
    double v5 = *(double *)&a1;
LABEL_7:
    double result = 50.0;
    if ((a2 & 1) == 0) {
      return v5;
    }
    return result;
  }
  double result = *(double *)&a3 / 1.12;
  double v5 = *(double *)&a1;
  double v6 = INFINITY;
  if ((a2 & 1) == 0) {
    double v6 = *(double *)&a1;
  }
  if (result > v6) {
    goto LABEL_7;
  }
  return result;
}

void (*sub_100009828(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004212C();
  return sub_100009898;
}

void sub_100009898(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_1000098E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100009B58();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100009948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100009B58();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000099AC(uint64_t a1)
{
  unint64_t v2 = sub_100009B58();

  return Shape.body.getter(a1, v2);
}

unint64_t sub_1000099FC()
{
  unint64_t result = qword_1000507B0;
  if (!qword_1000507B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000507B0);
  }
  return result;
}

unint64_t sub_100009A54()
{
  unint64_t result = qword_1000507B8;
  if (!qword_1000507B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000507B8);
  }
  return result;
}

unint64_t sub_100009AAC()
{
  unint64_t result = qword_1000507C0;
  if (!qword_1000507C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000507C0);
  }
  return result;
}

uint64_t sub_100009B00()
{
  return sub_100009628();
}

uint64_t sub_100009B08(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100009B58()
{
  unint64_t result = qword_1000507C8;
  if (!qword_1000507C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000507C8);
  }
  return result;
}

uint64_t sub_100009BAC(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8)
    {
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v8;
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      *(void *)(a1 + 56) = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v10;
    }
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    char v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100041B5C();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_1000022D0(&qword_1000507D0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v17 = a3[7];
    uint64_t v18 = (void *)(a1 + v17);
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_100041D4C();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = sub_1000022D0(&qword_1000507D8);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v23 = a3[8];
    uint64_t v24 = (void *)(a1 + v23);
    uint64_t v25 = (uint64_t *)((char *)a2 + v23);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    }
    else
    {
      *uint64_t v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = a3[9];
    uint64_t v28 = (void *)(a1 + v27);
    uint64_t v29 = (uint64_t *)((char *)a2 + v27);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_100042B9C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      *uint64_t v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100009FA8(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_100041B5C();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_100041D4C();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = a1 + a2[8];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = a1 + a2[9];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_100042B9C();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
    return v14(v12, v13);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10000A220(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_100041B5C();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_1000022D0(&qword_1000507D0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_100041D4C();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = sub_1000022D0(&qword_1000507D8);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *uint64_t v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_100042B9C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    *uint64_t v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10000A5C4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v8)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10000AAE0(a1 + 32);
      long long v9 = *(_OWORD *)(a2 + 48);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 48) = v9;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 48);
    *uint64_t v6 = *v7;
    *(_OWORD *)(a1 + 48) = v10;
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_100041B5C();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_13:
    uint64_t v19 = sub_1000022D0(&qword_1000507D0);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_14:
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = sub_100041D4C();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v28 = sub_1000022D0(&qword_1000507D8);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_21;
  }
  if (v27)
  {
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
  if (a1 == a2) {
    return a1;
  }
LABEL_21:
  uint64_t v29 = a3[8];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  sub_100009240(a1 + v29, &qword_1000507E0);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
  }
  else
  {
    *uint64_t v30 = *v31;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v33 = a3[9];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (void *)(a2 + v33);
  sub_100009240(a1 + v33, &qword_100050300);
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v36 = sub_100042B9C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  }
  else
  {
    *uint64_t v34 = *v35;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10000AAE0(uint64_t a1)
{
  return a1;
}

_OWORD *sub_10000AB34(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  long long v9 = (char *)a1 + v8;
  long long v10 = (char *)a2 + v8;
  uint64_t v11 = sub_100041B5C();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_1000022D0(&qword_1000507D0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100041D4C();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = sub_1000022D0(&qword_1000507D8);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_100042BDC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  uint64_t v25 = a3[9];
  int v26 = (char *)a1 + v25;
  int v27 = (char *)a2 + v25;
  uint64_t v28 = sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = sub_100042B9C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v26, v27, v29);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10000AE8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = *(void *)(a2 + 40);
    if (v7)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_10000AAE0(a1 + 32);
  }
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
LABEL_6:
  uint64_t v9 = a3[6];
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_100041B5C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_11:
    uint64_t v17 = sub_1000022D0(&qword_1000507D0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_12:
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_100041D4C();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v26 = sub_1000022D0(&qword_1000507D8);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_19;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_18;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v19, v20, v21);
  if (a1 == a2) {
    return a1;
  }
LABEL_19:
  uint64_t v27 = a3[8];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  sub_100009240(a1 + v27, &qword_1000507E0);
  uint64_t v30 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v31 = sub_100042BDC();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v31 - 8) + 32))(v28, v29, v31);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  uint64_t v32 = a3[9];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  sub_100009240(a1 + v32, &qword_100050300);
  uint64_t v35 = sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v36 = sub_100042B9C();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 32))(v33, v34, v36);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10000B358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B36C);
}

uint64_t sub_10000B36C(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_1000022D0(&qword_1000507D0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507D8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_11;
  }
  uint64_t v13 = sub_1000022D0(&qword_1000507E8);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[8];
    goto LABEL_11;
  }
  uint64_t v15 = sub_1000022D0(&qword_1000505D8);
  int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[9];

  return v16(v18, a2, v17);
}

uint64_t sub_10000B540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B554);
}

uint64_t sub_10000B554(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_1000022D0(&qword_1000507D0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507D8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_9;
  }
  uint64_t v13 = sub_1000022D0(&qword_1000507E8);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[8];
    goto LABEL_9;
  }
  uint64_t v15 = sub_1000022D0(&qword_1000505D8);
  int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[9];

  return v16(v18, a2, a2, v17);
}

uint64_t type metadata accessor for LabelsModule(uint64_t a1)
{
  return sub_10000D730(a1, (uint64_t *)&unk_100050848);
}

void sub_10000B748()
{
  sub_10000B95C(319, &qword_100050858, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F)
  {
    sub_10000B95C(319, &qword_100050860, (uint64_t (*)(uint64_t))&type metadata accessor for Badge, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F)
    {
      sub_10000B95C(319, (unint64_t *)&qword_100050868, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v2 <= 0x3F)
      {
        sub_10000B95C(319, (unint64_t *)&unk_100050650, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_10000B95C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10000B9C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B9DC@<X0>(char *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v50 = sub_1000022D0(&qword_1000508B0);
  uint64_t v52 = *(void *)(v50 - 8);
  uint64_t v1 = __chkstk_darwin(v50);
  uint64_t v49 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v51 = (char *)&v39 - v3;
  sub_10000BD54();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10004285C();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_1000426EC();
  uint64_t v9 = sub_10004279C();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_10000D48C(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_1000426AC();
  uint64_t v14 = sub_10004277C();
  uint64_t v46 = v15;
  uint64_t v47 = v14;
  uint64_t v48 = v16;
  int v45 = v17 & 1;
  sub_10000D48C(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  int v42 = sub_1000425EC();
  sub_10000BF60(v53);
  uint64_t v18 = v53[1];
  uint64_t v41 = v53[0];
  uint64_t v19 = v53[2];
  uint64_t v40 = v53[3];
  uint64_t v20 = v53[4];
  uint64_t v21 = v53[5];
  uint64_t v22 = v53[6];
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  int v24 = v49;
  uint64_t v25 = v50;
  v23(v49, v51, v50);
  uint64_t v26 = v43;
  v23(v43, v24, v25);
  uint64_t v27 = sub_1000022D0(&qword_1000508B8);
  uint64_t v28 = &v26[*(int *)(v27 + 48)];
  uint64_t v29 = v46;
  uint64_t v30 = v47;
  *(void *)uint64_t v28 = v47;
  *((void *)v28 + 1) = v29;
  char v31 = v45;
  v28[16] = v45;
  uint64_t v32 = KeyPath;
  *((void *)v28 + 3) = v48;
  *((void *)v28 + 4) = v32;
  *((void *)v28 + 5) = 2;
  v28[48] = 0;
  *((_DWORD *)v28 + 13) = v42;
  uint64_t v33 = (uint64_t *)&v26[*(int *)(v27 + 64)];
  uint64_t v34 = v41;
  *uint64_t v33 = v41;
  v33[1] = v18;
  uint64_t v35 = v40;
  v33[2] = v19;
  v33[3] = v35;
  v33[4] = v20;
  v33[5] = v21;
  v33[6] = v22;
  sub_10000D4A4(v30, v29, v31);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000D4B4(v34, v18, v19, v35);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v52 + 8);
  uint64_t v37 = v50;
  v36(v51, v50);
  sub_10000D504(v34, v18, v19, v35);
  sub_10000D48C(v47, v46, v45);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v36)(v49, v37);
}

uint64_t sub_10000BD54()
{
  uint64_t v1 = sub_1000022D0(&qword_1000508C0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000022D0(&qword_1000508C8);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  char v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000022D0(&qword_1000508D0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_10004241C();
  *((void *)v3 + 1) = 0x4010000000000000;
  v3[16] = 0;
  uint64_t v11 = sub_1000022D0(&qword_1000508D8);
  sub_10000C204(v0, (uint64_t)&v3[*(int *)(v11 + 44)]);
  uint64_t v12 = sub_1000426DC();
  uint64_t KeyPath = swift_getKeyPath();
  sub_1000091DC((uint64_t)v3, (uint64_t)v7, &qword_1000508C0);
  uint64_t v14 = (uint64_t *)&v7[*(int *)(v5 + 44)];
  *uint64_t v14 = KeyPath;
  v14[1] = v12;
  sub_100009240((uint64_t)v3, &qword_1000508C0);
  uint64_t v15 = swift_getKeyPath();
  sub_1000091DC((uint64_t)v7, (uint64_t)v10, &qword_1000508C8);
  uint64_t v16 = &v10[*(int *)(v8 + 36)];
  *(void *)uint64_t v16 = v15;
  *((void *)v16 + 1) = 1;
  v16[16] = 0;
  sub_100009240((uint64_t)v7, &qword_1000508C8);
  sub_10000D5AC();
  sub_10004287C();
  return sub_100009240((uint64_t)v10, &qword_1000508D0);
}

uint64_t sub_10000BF60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_100042BDC();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t result = __chkstk_darwin(v5);
  if (*(void *)(v1 + 40))
  {
    uint64_t v31 = (uint64_t)&v31 - v7;
    uint64_t v32 = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10004285C();
    uint64_t v11 = v10;
    char v13 = v12 & 1;
    sub_1000426DC();
    uint64_t v14 = sub_10004279C();
    uint64_t v34 = v15;
    uint64_t v35 = v14;
    char v17 = v16;
    uint64_t v33 = v18;
    swift_release();
    uint64_t v19 = v17 & 1;
    sub_10000D48C(v9, v11, v13);
    swift_bridgeObjectRelease();
    type metadata accessor for LabelsModule(0);
    uint64_t v20 = v31;
    sub_10002C4CC(v31);
    uint64_t v21 = v32;
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v32, enum case for WidgetFamily.systemSmall(_:), v3);
    sub_100003DD8();
    sub_100042D5C();
    sub_100042D5C();
    uint64_t v23 = v36;
    uint64_t v22 = v37;
    int v24 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v24(v21, v3);
    v24(v20, v3);
    if (v22 == v23) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = 2;
    }
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t result = sub_1000425EC();
    uint64_t v28 = v33;
    uint64_t v27 = v34;
    uint64_t v29 = result << 32;
    uint64_t v30 = v35;
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v27 = 0;
    uint64_t v19 = 0;
    uint64_t v28 = 0;
    uint64_t KeyPath = 0;
    uint64_t v25 = 0;
    uint64_t v29 = 0;
  }
  *a1 = v30;
  a1[1] = v27;
  a1[2] = v19;
  a1[3] = v28;
  a1[4] = KeyPath;
  a1[5] = v25;
  a1[6] = v29;
  return result;
}

uint64_t sub_10000C204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v102 = a1;
  uint64_t v98 = a2;
  uint64_t v2 = sub_100042B9C();
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v88 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v86 = (uint64_t)&v75 - v5;
  uint64_t v6 = type metadata accessor for LabelsModule.WidgetRelativeDateText(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v97 = (uint64_t)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_1000022D0(&qword_100050918);
  uint64_t v99 = *(void *)(v101 - 8);
  uint64_t v8 = __chkstk_darwin(v101);
  uint64_t v87 = (uint64_t)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v85 = (uint64_t)&v75 - v10;
  uint64_t v11 = sub_1000022D0(&qword_1000507D0);
  __chkstk_darwin(v11 - 8);
  uint64_t v94 = (uint64_t)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_100041B5C();
  uint64_t v100 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  v95 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000022D0(&qword_100050920);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  char v17 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v75 - v18;
  uint64_t v84 = sub_10004222C();
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v82 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000424AC();
  __chkstk_darwin(v21 - 8);
  uint64_t v22 = sub_1000022D0(&qword_100050928);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  v81 = (char *)&v75 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000022D0(&qword_1000507D8);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100041D4C();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v75 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1000022D0(&qword_100050930);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  uint64_t v93 = (uint64_t)&v75 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  v91 = (char *)&v75 - v35;
  uint64_t v92 = type metadata accessor for LabelsModule(0);
  sub_1000091DC(v102 + *(int *)(v92 + 28), (uint64_t)v27, &qword_1000507D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
    sub_100009240((uint64_t)v27, &qword_1000507D8);
    uint64_t v36 = 1;
    uint64_t v37 = (uint64_t)v91;
    uint64_t v38 = v96;
  }
  else
  {
    uint64_t v77 = v29;
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    v75 = v31;
    uint64_t v76 = v28;
    v39(v31, v27, v28);
    sub_10004249C();
    v107._countAndFlagsBits = 0;
    v107._object = (void *)0xE000000000000000;
    sub_10004248C(v107);
    sub_100041D3C();
    sub_1000429BC();
    sub_10004246C();
    swift_release();
    v108._countAndFlagsBits = 0;
    v108._object = (void *)0xE000000000000000;
    sub_10004248C(v108);
    sub_1000424CC();
    uint64_t v40 = sub_10004285C();
    uint64_t v42 = v41;
    uint64_t v79 = v22;
    char v44 = v43 & 1;
    LODWORD(v103) = sub_1000425EC();
    uint64_t v45 = sub_10004278C();
    v80 = v17;
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    char v50 = v49;
    uint64_t v78 = v23;
    uint64_t v52 = v51;
    char v53 = v44;
    uint64_t v22 = v79;
    sub_10000D48C(v40, v42, v53);
    swift_bridgeObjectRelease();
    uint64_t v103 = v46;
    uint64_t v104 = v48;
    char v17 = v80;
    uint64_t v38 = v96;
    char v105 = v50 & 1;
    uint64_t v106 = v52;
    uint64_t v23 = v78;
    uint64_t v54 = v82;
    sub_10004221C();
    uint64_t v55 = v81;
    sub_1000428CC();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v54, v84);
    sub_10000D48C(v103, v104, v105);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v75, v76);
    uint64_t v56 = v91;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v91, v55, v22);
    uint64_t v36 = 0;
    uint64_t v37 = (uint64_t)v56;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v37, v36, 1, v22);
  uint64_t v57 = v94;
  sub_1000091DC(v102 + *(int *)(v92 + 24), v94, &qword_1000507D0);
  uint64_t v58 = v100;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v100 + 48))(v57, 1, v38) == 1)
  {
    sub_100009240(v57, &qword_1000507D0);
    uint64_t v59 = 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v95, v57, v38);
    sub_100041B4C();
    uint64_t v60 = v86;
    sub_10002C1DC(v86);
    uint64_t v61 = v88;
    sub_100042B8C();
    char v62 = sub_100042B7C();
    uint64_t v63 = *(void (**)(char *, uint64_t))(v89 + 8);
    uint64_t v64 = v61;
    uint64_t v65 = v90;
    v63(v64, v90);
    v63((char *)v60, v65);
    if (v62) {
      int v66 = sub_1000425EC();
    }
    else {
      int v66 = sub_1000425FC();
    }
    int v67 = v66;
    uint64_t v68 = v97;
    uint64_t v69 = v87;
    sub_10000D768(v97, v87);
    *(_DWORD *)(v69 + *(int *)(v101 + 36)) = v67;
    sub_10000D7CC(v68);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v95, v38);
    uint64_t v70 = v85;
    sub_10000D828(v69, v85);
    sub_10000D828(v70, (uint64_t)v19);
    uint64_t v59 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v99 + 56))(v19, v59, 1, v101);
  uint64_t v71 = v93;
  sub_1000091DC(v37, v93, &qword_100050930);
  sub_1000091DC((uint64_t)v19, (uint64_t)v17, &qword_100050920);
  uint64_t v72 = v98;
  sub_1000091DC(v71, v98, &qword_100050930);
  uint64_t v73 = sub_1000022D0(&qword_100050938);
  sub_1000091DC((uint64_t)v17, v72 + *(int *)(v73 + 48), &qword_100050920);
  sub_100009240((uint64_t)v19, &qword_100050920);
  sub_100009240(v37, &qword_100050930);
  sub_100009240((uint64_t)v17, &qword_100050920);
  return sub_100009240(v71, &qword_100050930);
}

__n128 sub_10000CC94@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v55 = a1;
  uint64_t v51 = sub_10004281C();
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  char v49 = (char *)&v48 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000424AC();
  __chkstk_darwin(v2 - 8);
  uint64_t v52 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56.n128_u64[0] = sub_100041F0C();
  uint64_t v4 = *(void *)(v56.n128_u64[0] - 8);
  __chkstk_darwin(v56.n128_u64[0]);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000427DC();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1000427FC();
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v58 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (objc_class *)[self mainBundle];
  v47._countAndFlagsBits = 0xE000000000000000;
  v66._countAndFlagsBits = 0x6F6741656D6954;
  v66._object = (void *)0xE700000000000000;
  v75.value._countAndFlagsBits = 0;
  v75.value._object = 0;
  v13.super.isa = v12;
  v76._countAndFlagsBits = 0;
  v76._object = (void *)0xE000000000000000;
  uint64_t v14 = sub_100041E8C(v66, v75, v13, v76, v47);
  uint64_t v16 = v15;

  v67._countAndFlagsBits = 1076113701;
  v67._object = (void *)0xE400000000000000;
  BOOL v17 = sub_100042D4C(v67);
  *(void *)&long long v62 = v14;
  *((void *)&v62 + 1) = v16;
  *(void *)&long long v59 = 1076113701;
  *((void *)&v59 + 1) = 0xE400000000000000;
  sub_10000DCD8();
  uint64_t v18 = sub_100042E5C();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v18 + 16);
  if (v17)
  {
    if (v19)
    {
      uint64_t v20 = v18 + 16 * v19;
      uint64_t v21 = (uint64_t *)(v20 + 16);
      uint64_t v22 = (void **)(v20 + 24);
LABEL_6:
      uint64_t v23 = *v21;
      uint64_t v24 = *v22;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
  }
  else if (v19)
  {
    uint64_t v21 = (uint64_t *)(v18 + 32);
    uint64_t v22 = (void **)(v18 + 40);
    goto LABEL_6;
  }
  uint64_t v23 = 0;
  uint64_t v24 = (void *)0xE000000000000000;
LABEL_8:
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Text.DateStyle.UnitsConfiguration.Style.brief(_:), v7);
  uint64_t v25 = v58;
  sub_1000427EC();
  sub_100041EFC();
  sub_100041EDC();
  double v27 = v26;
  (*(void (**)(char *, unint64_t))(v4 + 8))(v6, v56.n128_u64[0]);
  sub_100041EDC();
  if (v27 - v28 >= 60.0)
  {
    sub_10004249C();
    v68._countAndFlagsBits = 0;
    v68._object = (void *)0xE000000000000000;
    sub_10004248C(v68);
    if (!v17)
    {
      v72._countAndFlagsBits = v23;
      v72._object = v24;
      sub_10004247C(v72);
      swift_bridgeObjectRelease();
      v73._countAndFlagsBits = 0;
      v73._object = (void *)0xE000000000000000;
      sub_10004248C(v73);
      uint64_t v39 = v49;
      sub_10004280C();
      sub_10004245C();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v39, v51);
      v74._countAndFlagsBits = 0;
      v74._object = (void *)0xE000000000000000;
      sub_10004248C(v74);
      sub_1000424CC();
      *(void *)&long long v59 = sub_10004285C();
      *((void *)&v59 + 1) = v40;
      v60.n128_u64[0] = v41 & 1;
      v60.n128_u64[1] = v42;
      __int16 v61 = 256;
      sub_1000022D0(&qword_1000509E8);
      sub_10000DD2C();
      sub_1000425AC();
      goto LABEL_14;
    }
    uint64_t v36 = v49;
    sub_10004280C();
    sub_10004245C();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v36, v51);
    v69._countAndFlagsBits = 0;
    v69._object = (void *)0xE000000000000000;
    sub_10004248C(v69);
    v70._countAndFlagsBits = v23;
    v70._object = v24;
    sub_10004247C(v70);
    swift_bridgeObjectRelease();
    v71._countAndFlagsBits = 0;
    v71._object = (void *)0xE000000000000000;
    sub_10004248C(v71);
    sub_1000424CC();
    uint64_t v29 = sub_10004285C();
    uint64_t v31 = v29;
    uint64_t v32 = v30;
    char v34 = v37 & 1;
    *(void *)&long long v59 = v29;
    *((void *)&v59 + 1) = v30;
    v60.n128_u64[0] = v37 & 1;
    v60.n128_u64[1] = v38;
    LOBYTE(v61) = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1000424BC();
    uint64_t v29 = sub_10004285C();
    uint64_t v31 = v29;
    uint64_t v32 = v30;
    *(void *)&long long v59 = v29;
    *((void *)&v59 + 1) = v30;
    char v34 = v33 & 1;
    v60.n128_u64[0] = v33 & 1;
    v60.n128_u64[1] = v35;
    LOBYTE(v61) = 0;
  }
  sub_10000D4A4(v29, v30, v34);
  swift_bridgeObjectRetain();
  sub_1000425AC();
  long long v59 = v62;
  __n128 v60 = v63;
  __int16 v61 = v64;
  sub_1000022D0(&qword_1000509E8);
  sub_10000DD2C();
  sub_1000425AC();
  sub_10000D48C(v31, v32, v34);
  swift_bridgeObjectRelease();
LABEL_14:
  __n128 v56 = v63;
  long long v57 = v62;
  unsigned __int8 v43 = v64;
  char v44 = v65;
  uint64_t v45 = v55;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v25, v54);
  __n128 result = v56;
  *(_OWORD *)uint64_t v45 = v57;
  *(__n128 *)(v45 + 16) = result;
  *(unsigned char *)(v45 + 32) = v43;
  *(unsigned char *)(v45 + 33) = v44;
  return result;
}

double sub_10000D3F8@<D0>(uint64_t a1@<X8>)
{
  sub_10000CC94((uint64_t)v6);
  char v2 = v7;
  char v3 = v8;
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)a1 = v6[0];
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 33) = v3;
  return result;
}

uint64_t sub_10000D440@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1000424FC();
  *(void *)(a1 + 8) = 0x4000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v2 = sub_1000022D0(&qword_1000508A8);
  return sub_10000B9DC((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_10000D48C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000D4A4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000D4B4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000D4A4(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000D504(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000D48C(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000D554@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004237C();
  *a1 = result;
  return result;
}

uint64_t sub_10000D580()
{
  return sub_10004238C();
}

unint64_t sub_10000D5AC()
{
  unint64_t result = qword_1000508E0;
  if (!qword_1000508E0)
  {
    sub_1000025C8(&qword_1000508D0);
    sub_10000D64C();
    sub_100009134(&qword_100050908, &qword_100050910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000508E0);
  }
  return result;
}

unint64_t sub_10000D64C()
{
  unint64_t result = qword_1000508E8;
  if (!qword_1000508E8)
  {
    sub_1000025C8(&qword_1000508C8);
    sub_100009134(&qword_1000508F0, &qword_1000508C0);
    sub_100009134(&qword_1000508F8, &qword_100050900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000508E8);
  }
  return result;
}

uint64_t type metadata accessor for LabelsModule.WidgetRelativeDateText(uint64_t a1)
{
  return sub_10000D730(a1, qword_100050998);
}

uint64_t sub_10000D730(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000D768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LabelsModule.WidgetRelativeDateText(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D7CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LabelsModule.WidgetRelativeDateText(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D828(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_100050918);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  long long v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10000D8FC(uint64_t a1)
{
  uint64_t v2 = sub_100041F0C();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10000D960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000D9C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000DA28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000DA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000DAF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000DB04);
}

uint64_t sub_10000DB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000DB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DB84);
}

uint64_t sub_10000DB84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  long long v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_10000DBF4()
{
  uint64_t result = sub_100041F0C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000DC80()
{
  return sub_100009134(&qword_1000509D0, &qword_1000509D8);
}

uint64_t sub_10000DCBC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000DCD8()
{
  unint64_t result = qword_1000509E0;
  if (!qword_1000509E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000509E0);
  }
  return result;
}

unint64_t sub_10000DD2C()
{
  unint64_t result = qword_1000509F0;
  if (!qword_1000509F0)
  {
    sub_1000025C8(&qword_1000509E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000509F0);
  }
  return result;
}

unint64_t sub_10000DD9C()
{
  unint64_t result = qword_1000509F8;
  if (!qword_1000509F8)
  {
    sub_1000025C8(qword_100050A00);
    sub_10000DD2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000509F8);
  }
  return result;
}

uint64_t sub_10000DE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 72);
}

void sub_10000DE24()
{
  sub_10000E87C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10000DECC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)a1 = v5;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    uint64_t v8 = a2[5];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = *(int *)(a3 + 76);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 80);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *(void *)(v15 + 8);
    uint64_t v18 = *(void *)(v15 + 16);
    uint64_t v19 = *(void *)(v15 + 24);
    char v20 = *(unsigned char *)(v15 + 32);
    sub_10000E070(*(void *)v15, v17, v18, v19, v20);
    *(void *)uint64_t v14 = v16;
    *(void *)(v14 + 8) = v17;
    *(void *)(v14 + 16) = v18;
    *(void *)(v14 + 24) = v19;
    *(unsigned char *)(v14 + 32) = v20;
  }
  return a1;
}

uint64_t sub_10000E070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000E07C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 76);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 80);
  uint64_t v7 = *(void *)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v9 = *(void *)(v6 + 16);
  uint64_t v10 = *(void *)(v6 + 24);
  char v11 = *(unsigned char *)(v6 + 32);

  return sub_10000E150(v7, v8, v9, v10, v11);
}

uint64_t sub_10000E150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000E15C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(int *)(a3 + 76);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 80);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *(void *)(v13 + 8);
  uint64_t v16 = *(void *)(v13 + 16);
  uint64_t v17 = *(void *)(v13 + 24);
  char v18 = *(unsigned char *)(v13 + 32);
  sub_10000E070(*(void *)v13, v15, v16, v17, v18);
  *(void *)uint64_t v12 = v14;
  *(void *)(v12 + 8) = v15;
  *(void *)(v12 + 16) = v16;
  *(void *)(v12 + 24) = v17;
  *(unsigned char *)(v12 + 32) = v18;
  return a1;
}

void *sub_10000E2B4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 76);
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    sub_10000E42C((uint64_t)a1 + v9);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 80);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = *(void *)v15;
  uint64_t v17 = *((void *)v15 + 1);
  uint64_t v18 = *((void *)v15 + 2);
  uint64_t v19 = *((void *)v15 + 3);
  char v20 = v15[32];
  sub_10000E070(*(void *)v15, v17, v18, v19, v20);
  uint64_t v21 = *(void *)v14;
  uint64_t v22 = *((void *)v14 + 1);
  uint64_t v23 = *((void *)v14 + 2);
  uint64_t v24 = *((void *)v14 + 3);
  char v25 = v14[32];
  *(void *)uint64_t v14 = v16;
  *((void *)v14 + 1) = v17;
  *((void *)v14 + 2) = v18;
  *((void *)v14 + 3) = v19;
  v14[32] = v20;
  sub_10000E150(v21, v22, v23, v24, v25);
  return a1;
}

uint64_t sub_10000E42C(uint64_t a1)
{
  uint64_t v2 = sub_1000022D0(&qword_1000507E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_10000E48C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 76);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100042BDC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = *(int *)(a3 + 80);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  long long v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  v13[32] = v14[32];
  return a1;
}

_OWORD *sub_10000E594(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 76);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_10000E42C((uint64_t)a1 + v6);
    uint64_t v9 = sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100042BDC();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = *(int *)(a3 + 80);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  char v14 = v13[32];
  uint64_t v15 = *(void *)v12;
  uint64_t v16 = *((void *)v12 + 1);
  uint64_t v17 = *((void *)v12 + 2);
  uint64_t v18 = *((void *)v12 + 3);
  char v19 = v12[32];
  long long v20 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v20;
  v12[32] = v14;
  sub_10000E150(v15, v16, v17, v18, v19);
  return a1;
}

uint64_t sub_10000E6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E6F0);
}

uint64_t sub_10000E6F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000022D0(&qword_1000507E8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 76);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10000E7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E7B8);
}

void *sub_10000E7B8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000022D0(&qword_1000507E8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 76);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LoadedOverlayTemplate(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for LoadedOverlayTemplate);
}

void sub_10000E87C()
{
  if (!qword_100050868)
  {
    sub_100042BDC();
    unint64_t v0 = sub_10004218C();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100050868);
    }
  }
}

uint64_t sub_10000E8D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E920(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  long long v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_100042B5C();
}

uint64_t sub_10000EAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004259C();
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_1000425AC();
}

uint64_t sub_10000EBDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10004259C();
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_1000425AC();
}

double sub_10000ECD4(uint64_t a1, double a2)
{
  uint64_t v4 = v2 + *(int *)(a1 + 80);
  long long v5 = *(_OWORD *)(v4 + 16);
  v12[0] = *(_OWORD *)v4;
  v12[1] = v5;
  char v13 = *(unsigned char *)(v4 + 32);
  sub_1000118EC((uint64_t)v12, (uint64_t)v14);
  sub_100011954((uint64_t)v14, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  double v7 = v6;
  sub_100011954((uint64_t)v12, (void (*)(void, void, void, void, void))sub_10000E150);
  double v8 = v7 + a2;
  sub_100011954((uint64_t)v14, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  double v10 = v9;
  sub_100011954((uint64_t)v12, (void (*)(void, void, void, void, void))sub_10000E150);
  sub_100011954((uint64_t)v14, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  sub_100011954((uint64_t)v12, (void (*)(void, void, void, void, void))sub_10000E150);
  sub_100011954((uint64_t)v14, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  sub_100011954((uint64_t)v12, (void (*)(void, void, void, void, void))sub_10000E150);
  return v8 + v10;
}

uint64_t sub_10000EE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = a1;
  uint64_t v3 = *(void *)(a1 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(a1);
  uint64_t v36 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100042BDC();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  double v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = v2;
  sub_10002C4CC((uint64_t)&v35 - v10);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for WidgetFamily.systemSmall(_:), v5);
  sub_100003DD8();
  sub_100042D5C();
  sub_100042D5C();
  uint64_t v13 = v55;
  uint64_t v14 = v59;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v9, v5);
  v15(v11, v5);
  uint64_t v16 = v36;
  uint64_t v17 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v36, v12, v38);
  unint64_t v18 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v19 = swift_allocObject();
  if (v13 == v14)
  {
    uint64_t v20 = *(void *)(v17 + 24);
    *(void *)(v19 + 16) = *(void *)(v17 + 16);
    *(void *)(v19 + 24) = v20;
    long long v21 = *(_OWORD *)(v17 + 48);
    long long v35 = *(_OWORD *)(v17 + 32);
    *(_OWORD *)(v19 + 32) = v35;
    *(_OWORD *)(v19 + 48) = v21;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v19 + v18, v16, v17);
    sub_10004227C();
    swift_getTupleTypeMetadata3();
    sub_100042B4C();
    swift_getWitnessTable();
    sub_100042A8C();
    sub_10004227C();
    sub_10004227C();
    swift_getTupleTypeMetadata2();
    sub_100042B4C();
    swift_getWitnessTable();
    sub_100042AAC();
    sub_10004227C();
    uint64_t WitnessTable = swift_getWitnessTable();
    unint64_t v42 = &protocol witness table for _FrameLayout;
    swift_getWitnessTable();
    uint64_t v55 = sub_1000421FC();
    __n128 v56 = v22;
    uint64_t v23 = sub_10004220C();
    uint64_t v36 = (char *)swift_getWitnessTable();
    uint64_t v24 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v23 - 8) + 16);
    v24(&v59, &v55, v23);
    swift_release();
    uint64_t v55 = v59;
    __n128 v56 = v60;
    v24(&v53, &v55, v23);
    uint64_t v51 = v53;
    uint64_t v52 = v54;
    sub_10004227C();
    sub_10004227C();
    swift_getTupleTypeMetadata2();
    sub_100042B4C();
    swift_getWitnessTable();
    sub_100042A6C();
    sub_10004227C();
    uint64_t v39 = swift_getWitnessTable();
    uint64_t v40 = &protocol witness table for _FrameLayout;
    swift_getWitnessTable();
    sub_10004220C();
    swift_getWitnessTable();
    sub_10000EAE4((uint64_t)&v51, v23);
  }
  else
  {
    uint64_t v25 = *(void *)(v17 + 24);
    *(void *)(v19 + 16) = *(void *)(v17 + 16);
    *(void *)(v19 + 24) = v25;
    long long v26 = *(_OWORD *)(v17 + 48);
    long long v35 = *(_OWORD *)(v17 + 32);
    *(_OWORD *)(v19 + 32) = v35;
    *(_OWORD *)(v19 + 48) = v26;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v19 + v18, v16, v17);
    sub_10004227C();
    swift_getTupleTypeMetadata3();
    sub_100042B4C();
    swift_getWitnessTable();
    sub_100042A8C();
    sub_10004227C();
    sub_10004227C();
    sub_10004227C();
    swift_getTupleTypeMetadata2();
    sub_100042B4C();
    swift_getWitnessTable();
    sub_100042A6C();
    sub_10004227C();
    uint64_t v57 = swift_getWitnessTable();
    uint64_t v58 = &protocol witness table for _FrameLayout;
    swift_getWitnessTable();
    uint64_t v55 = sub_1000421FC();
    __n128 v56 = v27;
    uint64_t v28 = sub_10004220C();
    uint64_t v36 = (char *)swift_getWitnessTable();
    uint64_t v29 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v28 - 8) + 16);
    v29(&v59, &v55, v28);
    swift_release();
    uint64_t v55 = v59;
    __n128 v56 = v60;
    v29(&v53, &v55, v28);
    uint64_t v51 = v53;
    uint64_t v52 = v54;
    sub_10004227C();
    swift_getTupleTypeMetadata2();
    sub_100042B4C();
    swift_getWitnessTable();
    sub_100042AAC();
    sub_10004227C();
    uint64_t v49 = swift_getWitnessTable();
    uint64_t v50 = &protocol witness table for _FrameLayout;
    swift_getWitnessTable();
    uint64_t v30 = sub_10004220C();
    swift_getWitnessTable();
    sub_10000EBDC((uint64_t)&v51, v30, v28);
  }
  swift_release();
  swift_release();
  *(void *)&long long v35 = v55;
  uint64_t v36 = v56;
  sub_10004227C();
  swift_getTupleTypeMetadata3();
  sub_100042B4C();
  swift_getWitnessTable();
  sub_100042A8C();
  sub_10004227C();
  sub_10004227C();
  swift_getTupleTypeMetadata2();
  sub_100042B4C();
  swift_getWitnessTable();
  sub_100042AAC();
  sub_10004227C();
  uint64_t v47 = swift_getWitnessTable();
  uint64_t v48 = &protocol witness table for _FrameLayout;
  swift_getWitnessTable();
  sub_10004220C();
  sub_10004227C();
  sub_10004227C();
  swift_getTupleTypeMetadata2();
  sub_100042B4C();
  swift_getWitnessTable();
  sub_100042A6C();
  sub_10004227C();
  uint64_t v45 = swift_getWitnessTable();
  uint64_t v46 = &protocol witness table for _FrameLayout;
  swift_getWitnessTable();
  sub_10004220C();
  uint64_t v31 = sub_1000425BC();
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v43 = v32;
  uint64_t v44 = v33;
  swift_getWitnessTable();
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v31 - 8) + 16))(v37, &v55, v31);
  return sub_10001166C();
}

uint64_t sub_10000FAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  uint64_t v31 = a7;
  uint64_t v32 = a8;
  uint64_t v29 = a2;
  uint64_t v30 = a6;
  uint64_t v26 = a5;
  uint64_t v33 = a9;
  sub_10004227C();
  swift_getTupleTypeMetadata3();
  sub_100042B4C();
  swift_getWitnessTable();
  sub_100042A8C();
  sub_10004227C();
  sub_10004227C();
  swift_getTupleTypeMetadata2();
  sub_100042B4C();
  swift_getWitnessTable();
  uint64_t v12 = sub_100042AAC();
  uint64_t v28 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = sub_10004227C();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  double v27 = (char *)&v26 - v20;
  uint64_t v34 = a3;
  uint64_t v35 = a4;
  uint64_t v36 = v26;
  uint64_t v37 = v30;
  uint64_t v38 = v31;
  uint64_t v39 = v32;
  uint64_t v40 = v29;
  uint64_t v41 = a1;
  sub_100042B2C();
  sub_100042A9C();
  sub_1000421DC();
  sub_1000421DC();
  sub_100042B2C();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1000428FC();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v12);
  uint64_t v42 = WitnessTable;
  uint64_t v43 = &protocol witness table for _FrameLayout;
  swift_getWitnessTable();
  unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v23 = v27;
  v22(v27, v19, v15);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v16 + 8);
  v24(v19, v15);
  v22(v33, v23, v15);
  return ((uint64_t (*)(char *, uint64_t))v24)(v23, v15);
}

uint64_t sub_10000FE6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, void (*a6)(void, void)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v50 = a8;
  uint64_t v57 = a7;
  uint64_t v58 = a6;
  uint64_t v60 = a2;
  uint64_t v67 = a9;
  uint64_t v62 = *(void *)(a5 - 8);
  __chkstk_darwin(a1);
  __n128 v56 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10004227C();
  uint64_t v65 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v59 = (char *)&v49 - v16;
  uint64_t v66 = sub_10004227C();
  uint64_t v64 = *(void *)(v66 - 8);
  uint64_t v17 = __chkstk_darwin(v66);
  __int16 v61 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  __n128 v63 = (char *)&v49 - v19;
  sub_10004227C();
  swift_getTupleTypeMetadata3();
  sub_100042B4C();
  swift_getWitnessTable();
  uint64_t v20 = sub_100042A8C();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v49 - v25;
  uint64_t v54 = (char *)&v49 - v25;
  Swift::String v71 = a3;
  Swift::String v72 = a4;
  uint64_t v73 = a5;
  Swift::String v74 = v58;
  uint64_t v75 = v57;
  uint64_t v76 = a8;
  uint64_t v27 = type metadata accessor for LoadedOverlayTemplate(0, (uint64_t)&v71);
  sub_100010514();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  uint64_t v52 = v21 + 16;
  uint64_t v53 = v28;
  uint64_t v29 = v24;
  uint64_t v51 = v20;
  v28(v26, v24, v20);
  uint64_t v30 = *(void (**)(void, void))(v21 + 8);
  uint64_t v57 = v21 + 8;
  uint64_t v58 = v30;
  uint64_t v31 = ((uint64_t (*)(char *, uint64_t))v30)(v24, v20);
  uint64_t v32 = v56;
  (*(void (**)(uint64_t))(a1 + 32))(v31);
  sub_1000421DC();
  sub_10000ECD4(v27, v33);
  sub_100042B2C();
  uint64_t v34 = v59;
  uint64_t v35 = v50;
  sub_1000428FC();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v32, a5);
  sub_100042AFC();
  v70[4] = v35;
  v70[5] = &protocol witness table for _FrameLayout;
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v36 = v61;
  sub_10004290C();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v34, v15);
  v70[2] = v48;
  v70[3] = &protocol witness table for _FlexFrameLayout;
  uint64_t v37 = v66;
  uint64_t v65 = swift_getWitnessTable();
  uint64_t v38 = v63;
  uint64_t v39 = v64;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  uint64_t v41 = v36;
  v40(v63, v36, v37);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v39 + 8);
  v42(v36, v37);
  uint64_t v49 = v29;
  uint64_t v43 = v54;
  uint64_t v44 = v51;
  v53(v29, v54, v51);
  Swift::String v71 = v29;
  v40(v41, v38, v37);
  Swift::String v72 = v41;
  uint64_t v45 = v41;
  v70[0] = v44;
  v70[1] = v37;
  uint64_t v68 = WitnessTable;
  uint64_t v69 = v65;
  sub_10000E920((uint64_t)&v71, 2uLL, (uint64_t)v70);
  v42(v38, v37);
  uint64_t v46 = (uint64_t (*)(char *, uint64_t))v58;
  v58(v43, v44);
  v42(v45, v37);
  return v46(v49, v44);
}

uint64_t sub_100010514()
{
  return sub_100042A7C();
}

uint64_t sub_10001060C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  uint64_t v31 = a7;
  uint64_t v32 = a8;
  uint64_t v29 = a2;
  uint64_t v30 = a6;
  uint64_t v27 = a5;
  double v33 = a9;
  sub_10004227C();
  swift_getTupleTypeMetadata3();
  sub_100042B4C();
  swift_getWitnessTable();
  sub_100042A8C();
  sub_10004227C();
  sub_10004227C();
  sub_10004227C();
  swift_getTupleTypeMetadata2();
  sub_100042B4C();
  swift_getWitnessTable();
  uint64_t v12 = sub_100042A6C();
  uint64_t v28 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = sub_10004227C();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v26 = (char *)&v26 - v20;
  uint64_t v34 = a3;
  uint64_t v35 = a4;
  uint64_t v36 = v27;
  uint64_t v37 = v30;
  uint64_t v38 = v31;
  uint64_t v39 = v32;
  uint64_t v40 = v29;
  uint64_t v41 = a1;
  sub_10004242C();
  sub_100042A5C();
  sub_1000421DC();
  sub_1000421DC();
  sub_100042B3C();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1000428FC();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v12);
  uint64_t v42 = WitnessTable;
  uint64_t v43 = &protocol witness table for _FrameLayout;
  swift_getWitnessTable();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v23 = v26;
  v22(v26, v19, v15);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v16 + 8);
  v24(v19, v15);
  v22(v33, v23, v15);
  return ((uint64_t (*)(char *, uint64_t))v24)(v23, v15);
}

uint64_t sub_1000109F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t (*a7)(char *, uint64_t)@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v67 = a7;
  uint64_t v77 = a2;
  uint64_t v74 = a9;
  uint64_t v75 = a1;
  uint64_t v59 = *(void *)(a5 - 8);
  __chkstk_darwin(a1);
  uint64_t v57 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_10004227C();
  uint64_t v68 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v58 = (char *)&v56 - v15;
  uint64_t v70 = sub_10004227C();
  uint64_t v73 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v78 = (char *)&v56 - v16;
  uint64_t v72 = sub_10004227C();
  uint64_t v79 = *(void *)(v72 - 8);
  uint64_t v17 = __chkstk_darwin(v72);
  uint64_t v69 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  Swift::String v71 = (char *)&v56 - v19;
  sub_10004227C();
  swift_getTupleTypeMetadata3();
  sub_100042B4C();
  swift_getWitnessTable();
  uint64_t v20 = sub_100042A8C();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v56 - v25;
  __n128 v63 = (char *)&v56 - v25;
  v84[0] = a3;
  v84[1] = a4;
  v84[2] = a5;
  v84[3] = a6;
  v84[4] = v67;
  v84[5] = a8;
  uint64_t v27 = a8;
  uint64_t v28 = type metadata accessor for LoadedOverlayTemplate(0, (uint64_t)v84);
  uint64_t v29 = v75;
  sub_100010514();
  uint64_t v60 = v20;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  uint64_t v61 = v21 + 16;
  uint64_t v62 = v30;
  uint64_t v76 = v24;
  v30(v26, v24, v20);
  uint64_t v31 = *(uint64_t (**)(char *, uint64_t))(v21 + 8);
  uint64_t v66 = v21 + 8;
  uint64_t v67 = v31;
  uint64_t v32 = v31(v24, v20);
  double v33 = v57;
  (*(void (**)(uint64_t))(v29 + 32))(v32);
  sub_1000421DC();
  sub_10000ECD4(v28, v34);
  sub_100042B2C();
  uint64_t v35 = v58;
  sub_1000428FC();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v33, a5);
  LODWORD(v59) = sub_10004265C();
  uint64_t v36 = v29 + *(int *)(v28 + 80);
  long long v37 = *(_OWORD *)(v36 + 16);
  v87[0] = *(_OWORD *)v36;
  v87[1] = v37;
  char v88 = *(unsigned char *)(v36 + 32);
  sub_1000118EC((uint64_t)v87, (uint64_t)v89);
  sub_100011954((uint64_t)v89, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  sub_100011954((uint64_t)v87, (void (*)(void, void, void, void, void))sub_10000E150);
  v83[6] = v27;
  v83[7] = &protocol witness table for _FrameLayout;
  uint64_t v38 = v64;
  uint64_t v39 = swift_getWitnessTable();
  sub_10004291C();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v35, v38);
  sub_1000421DC();
  sub_10000ECD4(v28, v40);
  long long v41 = *(_OWORD *)(v36 + 16);
  v85[0] = *(_OWORD *)v36;
  v85[1] = v41;
  char v86 = *(unsigned char *)(v36 + 32);
  sub_1000118EC((uint64_t)v85, (uint64_t)v84);
  sub_100011954((uint64_t)v84, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  sub_100011954((uint64_t)v85, (void (*)(void, void, void, void, void))sub_10000E150);
  sub_100042AEC();
  v83[4] = v39;
  v83[5] = &protocol witness table for _PaddingLayout;
  uint64_t v54 = v70;
  uint64_t v55 = swift_getWitnessTable();
  uint64_t v42 = v69;
  uint64_t v43 = v78;
  sub_10004290C();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v43, v54);
  v83[2] = v55;
  v83[3] = &protocol witness table for _FlexFrameLayout;
  uint64_t v44 = v72;
  uint64_t v78 = (char *)swift_getWitnessTable();
  uint64_t v45 = v79;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
  uint64_t v47 = v71;
  v46(v71, v42, v44);
  uint64_t v48 = *(void (**)(char *, uint64_t))(v45 + 8);
  uint64_t v79 = v45 + 8;
  v48(v42, v44);
  uint64_t v49 = v76;
  uint64_t v50 = v63;
  uint64_t v51 = v60;
  v62(v76, v63, v60);
  v83[0] = v49;
  v46(v42, v47, v44);
  v83[1] = v42;
  v82[0] = v51;
  v82[1] = v44;
  uint64_t v80 = WitnessTable;
  v81 = v78;
  sub_10000E920((uint64_t)v83, 2uLL, (uint64_t)v82);
  v48(v47, v44);
  uint64_t v52 = v67;
  v67(v50, v51);
  v48(v42, v44);
  return v52(v76, v51);
}

uint64_t sub_1000111E4@<X0>(void (**a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v39 = a5;
  uint64_t v43 = a4;
  uint64_t v44 = a6;
  uint64_t v35 = a3;
  uint64_t WitnessTable = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  double v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004227C();
  uint64_t v45 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v38 = (char *)&v34 - v15;
  uint64_t v16 = *(void *)(a2 - 8);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v34 - v21;
  long long v37 = (char *)&v34 - v21;
  (*a1)(v20);
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v34 = a2;
  v36(v22, v19, a2);
  double v40 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
  uint64_t v41 = v16 + 8;
  uint64_t v23 = v40(v19, a2);
  a1[2](v23);
  sub_1000424FC();
  sub_10004240C();
  uint64_t v24 = v39;
  uint64_t v25 = v35;
  sub_10004290C();
  (*(void (**)(char *, uint64_t))(WitnessTable + 8))(v9, v25);
  v52[3] = v24;
  v52[4] = &protocol witness table for _FlexFrameLayout;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v26 = v45;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  uint64_t v28 = v38;
  v27(v38, v13, v10);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v45 = v26 + 8;
  v29(v13, v10);
  uint64_t v30 = v37;
  uint64_t v31 = v34;
  v36(v19, v37, v34);
  uint64_t v50 = 0;
  char v51 = 1;
  v52[0] = v19;
  v52[1] = &v50;
  v27(v13, v28, v10);
  v52[2] = v13;
  v49[0] = v31;
  v49[1] = &type metadata for Spacer;
  v49[2] = v10;
  uint64_t v46 = v43;
  uint64_t v47 = &protocol witness table for Spacer;
  uint64_t v48 = WitnessTable;
  sub_10000E920((uint64_t)v52, 3uLL, (uint64_t)v49);
  v29(v28, v10);
  uint64_t v32 = v40;
  v40(v30, v31);
  v29(v13, v10);
  return v32(v19, v31);
}

uint64_t sub_100011654(uint64_t a1)
{
  return sub_1000117F4(a1, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10001060C);
}

uint64_t sub_10001166C()
{
  return swift_release();
}

uint64_t sub_100011678()
{
  long long v1 = v0[2];
  v8[0] = v0[1];
  v8[1] = v1;
  v8[2] = v0[3];
  uint64_t v2 = type metadata accessor for LoadedOverlayTemplate(0, (uint64_t)v8);
  uint64_t v3 = (char *)v0
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = &v3[*(int *)(v2 + 76)];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100042BDC();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = &v3[*(int *)(v2 + 80)];
  sub_10000E150(*(void *)v6, *((void *)v6 + 1), *((void *)v6 + 2), *((void *)v6 + 3), v6[32]);
  return swift_deallocObject();
}

uint64_t sub_1000117DC(uint64_t a1)
{
  return sub_1000117F4(a1, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000FAA4);
}

uint64_t sub_1000117F4(uint64_t a1, uint64_t (*a2)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  v14[0] = v2[2];
  uint64_t v4 = v14[0];
  v14[1] = v5;
  v14[2] = v6;
  v14[3] = v7;
  void v14[4] = v8;
  v14[5] = v9;
  uint64_t v10 = *(void *)(type metadata accessor for LoadedOverlayTemplate(0, (uint64_t)v14) - 8);
  uint64_t v11 = (char *)v2 + ((*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));

  return a2(a1, v11, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1000118D4()
{
  return sub_1000119C0((uint64_t (*)(void, void, void, void, void, void, void, void))sub_10000FE6C);
}

uint64_t sub_1000118EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_100050A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011954(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_100011994@<X0>(uint64_t a1@<X8>)
{
  return sub_1000111E4(*(void (***)(uint64_t))(v1 + 64), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 40), *(void *)(v1 + 48), a1);
}

uint64_t sub_1000119A8()
{
  return sub_1000119C0((uint64_t (*)(void, void, void, void, void, void, void, void))sub_1000109F0);
}

uint64_t sub_1000119C0(uint64_t (*a1)(void, void, void, void, void, void, void, void))
{
  return a1(v1[8], v1[9], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1000119DC()
{
  return swift_getWitnessTable();
}

uint64_t sub_100011CB4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8)
    {
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v8;
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      *(void *)(a1 + 56) = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v10;
    }
    *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
    *(void *)(a1 + 80) = a2[10];
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100011EE0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004217C();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10001202C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
  }
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = *(int *)(a3 + 28);
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    *long long v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_10004217C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *uint64_t v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100012200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v8)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10000AAE0(a1 + 32);
      long long v9 = *(_OWORD *)(a2 + 48);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 48) = v9;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 48);
    *uint64_t v6 = *v7;
    *(_OWORD *)(a1 + 48) = v10;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    sub_100009240(a1 + v11, &qword_1000507E0);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (void *)(a2 + v15);
    sub_100009240(a1 + v15, &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100012484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  long long v8 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = *(int *)(a3 + 28);
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  *(_OWORD *)(a1 + 64) = v8;
  uint64_t v12 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_100042BDC();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_10004217C();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100012620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = *(void *)(a2 + 40);
    if (v7)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_10000AAE0(a1 + 32);
  }
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
LABEL_6:
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 28);
    long long v10 = (void *)(a1 + v9);
    uint64_t v11 = (const void *)(a2 + v9);
    sub_100009240(a1 + v9, &qword_1000507E0);
    uint64_t v12 = sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_100042BDC();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    uint64_t v14 = *(int *)(a3 + 32);
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (const void *)(a2 + v14);
    sub_100009240(a1 + v14, &qword_1000502F8);
    uint64_t v17 = sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_10004217C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10001284C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012860);
}

uint64_t sub_100012860(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000022D0(&qword_1000507E8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000022D0(&qword_1000505D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100012994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000129A8);
}

uint64_t sub_1000129A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_1000022D0(&qword_1000507E8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000022D0(&qword_1000505D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for CenteredInformationView()
{
  uint64_t result = qword_100050AE8;
  if (!qword_100050AE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100012B28()
{
  sub_100012C48(319, (unint64_t *)&qword_100050868, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_100012C48(319, &qword_100050648, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100012C48(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004218C();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100012C9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012CB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v2 = sub_10004262C();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2);
  unint64_t v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100042BDC();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v22[-v10];
  uint64_t v12 = sub_1000022D0(&qword_100050B30);
  uint64_t v27 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  __chkstk_darwin(v12);
  uint64_t v26 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_1000424EC();
  uint64_t v24 = *(void *)(v1 + 64);
  uint64_t v25 = v14;
  sub_1000131A8(v1, (uint64_t)v53);
  int v23 = sub_10004265C();
  type metadata accessor for CenteredInformationView();
  sub_10002C4CC((uint64_t)v11);
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v9, enum case for WidgetFamily.systemSmall(_:), v5);
  sub_100013974(&qword_100050B38, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100042CEC();
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v15(v9, v5);
  *(_OWORD *)&v38[103] = v53[6];
  *(_OWORD *)&v38[87] = v53[5];
  *(_OWORD *)&v38[39] = v53[2];
  *(_OWORD *)&v38[23] = v53[1];
  *(_OWORD *)&v38[119] = v53[7];
  *(_OWORD *)&v38[135] = v54;
  *(_OWORD *)&v38[55] = v53[3];
  char v39 = 0;
  *(_OWORD *)&v38[71] = v53[4];
  *(_OWORD *)&v38[7] = v53[0];
  long long v46 = *(_OWORD *)&v38[96];
  long long v47 = *(_OWORD *)&v38[112];
  *(_OWORD *)uint64_t v48 = *(_OWORD *)&v38[128];
  *(void *)&v48[15] = *((void *)&v54 + 1);
  long long v42 = *(_OWORD *)&v38[32];
  long long v43 = *(_OWORD *)&v38[48];
  long long v44 = *(_OWORD *)&v38[64];
  long long v45 = *(_OWORD *)&v38[80];
  long long v40 = *(_OWORD *)v38;
  long long v41 = *(_OWORD *)&v38[16];
  v15(v11, v5);
  sub_10004214C();
  *(_OWORD *)((char *)&v34[6] + 1) = v46;
  *(_OWORD *)((char *)&v34[7] + 1) = v47;
  *(_OWORD *)((char *)&v34[8] + 1) = *(_OWORD *)v48;
  *(_OWORD *)((char *)&v34[2] + 1) = v42;
  *(_OWORD *)((char *)&v34[3] + 1) = v43;
  *(_OWORD *)((char *)&v34[4] + 1) = v44;
  *(_OWORD *)((char *)&v34[5] + 1) = v45;
  *(_OWORD *)((char *)v34 + 1) = v40;
  char v49 = 0;
  *(void *)&long long v33 = v25;
  *((void *)&v33 + 1) = v24;
  LOBYTE(v34[0]) = 0;
  *(void *)&v34[9] = *(void *)&v48[15];
  *(_OWORD *)((char *)&v34[1] + 1) = v41;
  BYTE8(v34[9]) = v23;
  *(_DWORD *)((char *)&v34[9] + 9) = *(_DWORD *)v50;
  HIDWORD(v34[9]) = *(_DWORD *)&v50[3];
  *(void *)&long long v35 = v16;
  *((void *)&v35 + 1) = v17;
  *(void *)&long long v36 = v18;
  *((void *)&v36 + 1) = v19;
  char v37 = 0;
  sub_10004261C();
  uint64_t v32 = v1;
  sub_100042B2C();
  sub_1000022D0(&qword_100050B40);
  sub_1000022D0(&qword_100050B48);
  sub_100013804();
  sub_1000138A4();
  uint64_t v20 = v26;
  sub_1000428EC();
  (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v4, v30);
  v51[10] = v34[9];
  v51[11] = v35;
  v51[12] = v36;
  v51[6] = v34[5];
  v51[7] = v34[6];
  char v52 = v37;
  v51[8] = v34[7];
  v51[9] = v34[8];
  v51[2] = v34[1];
  v51[3] = v34[2];
  v51[4] = v34[3];
  v51[5] = v34[4];
  v51[0] = v33;
  v51[1] = v34[0];
  sub_1000139BC((uint64_t)v51);
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v27 + 32))(v31, v20, v28);
}

uint64_t sub_1000131A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10001344C((uint64_t)v38);
  uint64_t v35 = v38[1];
  uint64_t v36 = v38[0];
  char v4 = v39;
  uint64_t v5 = v40;
  uint64_t v37 = v41;
  uint64_t v6 = v42;
  char v7 = v43;
  uint64_t v33 = v44;
  uint64_t v34 = v40;
  char v8 = v45;
  int v9 = v46;
  if (*(void *)(a1 + 40))
  {
    char v25 = v43;
    char v26 = v45;
    uint64_t v27 = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10004285C();
    uint64_t v12 = v11;
    char v14 = v13 & 1;
    sub_1000426DC();
    uint64_t v15 = sub_10004279C();
    uint64_t v31 = v16;
    uint64_t v32 = v15;
    char v18 = v17;
    uint64_t v30 = v19;
    swift_release();
    uint64_t v20 = v18 & 1;
    uint64_t v5 = v34;
    sub_10000D48C(v10, v12, v14);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = swift_getKeyPath();
    uint64_t v21 = sub_1000425FC();
    uint64_t v6 = v27;
    uint64_t v22 = (v21 << 32) | 1;
    char v7 = v25;
    char v8 = v26;
    uint64_t v23 = 4;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v20 = 0;
    uint64_t KeyPath = 0;
    uint64_t v30 = 0;
    uint64_t v23 = 0;
    uint64_t v28 = 0;
    uint64_t v22 = 0;
  }
  LOBYTE(v38[0]) = v4;
  *(void *)a2 = v36;
  *(void *)(a2 + 8) = v35;
  *(unsigned char *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v37;
  *(void *)(a2 + 40) = v6;
  *(unsigned char *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v33;
  *(unsigned char *)(a2 + 64) = v8;
  *(_DWORD *)(a2 + 68) = v9;
  *(void *)(a2 + 72) = v32;
  *(void *)(a2 + 80) = v31;
  *(void *)(a2 + 88) = v20;
  *(void *)(a2 + 96) = v30;
  *(void *)(a2 + 104) = KeyPath;
  *(void *)(a2 + 112) = v23;
  *(void *)(a2 + 120) = 0;
  *(void *)(a2 + 128) = v28;
  *(void *)(a2 + 136) = v22;
  sub_10000D4A4(v36, v35, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100013AE4(v32, v31, v20, v30);
  sub_100013A78(v32, v31, v20, v30);
  sub_10000D48C(v36, v35, v4);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001344C@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_10004285C();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_1000426EC();
  sub_1000426AC();
  sub_1000426CC();
  swift_release();
  uint64_t v7 = sub_10004279C();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_10000D48C(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_10004267C();
  uint64_t v13 = sub_10004279C();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_10000D48C(v7, v9, v12);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_getKeyPath();
  uint64_t result = sub_1000425EC();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 3;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v21;
  *(unsigned char *)(a1 + 64) = 1;
  *(_DWORD *)(a1 + 68) = result;
  return result;
}

uint64_t sub_1000135F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004217C();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100041FEC();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100041FDC();
  type metadata accessor for CenteredInformationView();
  sub_10002BF94((uint64_t)v5);
  uint64_t KeyPath = swift_getKeyPath();
  char v11 = (uint64_t *)(a1 + *(int *)(sub_1000022D0(&qword_100050B48) + 36));
  uint64_t v12 = sub_1000022D0(&qword_100050B80);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v11 + *(int *)(v12 + 28), v5, v2);
  uint64_t *v11 = KeyPath;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000137FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000135F8(a1);
}

unint64_t sub_100013804()
{
  unint64_t result = qword_100050B50;
  if (!qword_100050B50)
  {
    sub_1000025C8(&qword_100050B40);
    sub_100009134(&qword_100050B58, &qword_100050B60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050B50);
  }
  return result;
}

unint64_t sub_1000138A4()
{
  unint64_t result = qword_100050B68;
  if (!qword_100050B68)
  {
    sub_1000025C8(&qword_100050B48);
    sub_100013974(&qword_100050B70, (void (*)(uint64_t))&type metadata accessor for BackgroundBlurView);
    sub_100009134((unint64_t *)&qword_100050B78, &qword_100050B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050B68);
  }
  return result;
}

uint64_t sub_100013974(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000139BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 96);
  sub_10000D48C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100013A78(v6, v2, v3, v4);
  return a1;
}

uint64_t sub_100013A78(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000D48C(result, a2, a3 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100013AE4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000D4A4(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for CenteredInformationView.Style(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CenteredInformationView.Style(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CenteredInformationView.Style(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CenteredInformationView.Style()
{
  return &type metadata for CenteredInformationView.Style;
}

uint64_t sub_100013BC8()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100013C48(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a3[5];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_1000420EC();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v4 + v13;
    uint64_t v16 = (uint64_t)a2 + v13;
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    *((void *)v15 + 2) = *(void *)(v16 + 16);
    char v17 = (void *)((char *)v4 + v14);
    uint64_t v18 = (uint64_t *)((char *)a2 + v14);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *char v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)v4 + v21;
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = *(void *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    uint64_t v26 = *(void *)(v23 + 16);
    uint64_t v27 = *(void *)(v23 + 24);
    char v28 = *(unsigned char *)(v23 + 32);
    sub_10000E070(*(void *)v23, v25, v26, v27, v28);
    *(void *)uint64_t v22 = v24;
    *((void *)v22 + 1) = v25;
    *((void *)v22 + 2) = v26;
    *((void *)v22 + 3) = v27;
    v22[32] = v28;
    uint64_t v29 = a3[9];
    uint64_t v30 = (void *)((char *)v4 + v29);
    uint64_t v31 = (uint64_t *)((char *)a2 + v29);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    }
    else
    {
      *uint64_t v30 = *v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v33 = a3[10];
    uint64_t v34 = (void *)((char *)v4 + v33);
    uint64_t v35 = (uint64_t *)((char *)a2 + v33);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v36 = sub_100042B9C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
    }
    else
    {
      *uint64_t v34 = *v35;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_100013F64(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[7];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = a1 + a2[8];
  sub_10000E150(*(void *)v8, *(void *)(v8 + 8), *(void *)(v8 + 16), *(void *)(v8 + 24), *(unsigned char *)(v8 + 32));
  uint64_t v9 = a1 + a2[9];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = a1 + a2[10];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100042B9C();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    return v13(v11, v12);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100014160(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000420EC();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(void *)(v14 + 16) = *(void *)(v15 + 16);
  uint64_t v16 = (void *)(a1 + v13);
  char v17 = (void *)(a2 + v13);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)v21;
  uint64_t v23 = *(void *)(v21 + 8);
  uint64_t v24 = *(void *)(v21 + 16);
  uint64_t v25 = *(void *)(v21 + 24);
  char v26 = *(unsigned char *)(v21 + 32);
  sub_10000E070(*(void *)v21, v23, v24, v25, v26);
  *(void *)uint64_t v20 = v22;
  *(void *)(v20 + 8) = v23;
  *(void *)(v20 + 16) = v24;
  *(void *)(v20 + 24) = v25;
  *(unsigned char *)(v20 + 32) = v26;
  uint64_t v27 = a3[9];
  char v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v30 = sub_10004217C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  }
  else
  {
    *char v28 = *v29;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = sub_100042B9C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
  }
  else
  {
    *uint64_t v32 = *v33;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100014424(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  if (a1 != a2)
  {
    uint64_t v13 = a3[7];
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (void *)(a2 + v13);
    sub_100009240(a1 + v13, &qword_1000507E0);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *(void *)(v19 + 8);
  uint64_t v22 = *(void *)(v19 + 16);
  uint64_t v23 = *(void *)(v19 + 24);
  char v24 = *(unsigned char *)(v19 + 32);
  sub_10000E070(*(void *)v19, v21, v22, v23, v24);
  uint64_t v25 = *(void *)v18;
  uint64_t v26 = *(void *)(v18 + 8);
  uint64_t v27 = *(void *)(v18 + 16);
  uint64_t v28 = *(void *)(v18 + 24);
  char v29 = *(unsigned char *)(v18 + 32);
  *(void *)uint64_t v18 = v20;
  *(void *)(v18 + 8) = v21;
  *(void *)(v18 + 16) = v22;
  *(void *)(v18 + 24) = v23;
  *(unsigned char *)(v18 + 32) = v24;
  sub_10000E150(v25, v26, v27, v28, v29);
  if (a1 != a2)
  {
    uint64_t v30 = a3[9];
    uint64_t v31 = (void *)(a1 + v30);
    uint64_t v32 = (void *)(a2 + v30);
    sub_100009240(a1 + v30, &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    }
    else
    {
      *uint64_t v31 = *v32;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v34 = a3[10];
    uint64_t v35 = (void *)(a1 + v34);
    uint64_t v36 = (void *)(a2 + v34);
    sub_100009240(a1 + v34, &qword_100050300);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_100042B9C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    }
    else
    {
      *uint64_t v35 = *v36;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_100014758(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000420EC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((void *)v13 + 2) = *((void *)v14 + 2);
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  uint64_t v17 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_100042BDC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = (char *)a1 + v19;
  uint64_t v22 = (char *)a2 + v19;
  long long v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  v21[32] = v22[32];
  char v24 = (char *)a1 + v20;
  uint64_t v25 = (char *)a2 + v20;
  uint64_t v26 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v27 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v24, v25, v27);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  uint64_t v28 = a3[10];
  char v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_100042B9C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1000149F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  if (a1 != a2)
  {
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (const void *)(a2 + v14);
    sub_100009240(a1 + v14, &qword_1000507E0);
    uint64_t v17 = sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_100042BDC();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  char v22 = *(unsigned char *)(v21 + 32);
  uint64_t v23 = *(void *)v20;
  uint64_t v24 = *(void *)(v20 + 8);
  uint64_t v25 = *(void *)(v20 + 16);
  uint64_t v26 = *(void *)(v20 + 24);
  char v27 = *(unsigned char *)(v20 + 32);
  long long v28 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v28;
  *(unsigned char *)(v20 + 32) = v22;
  sub_10000E150(v23, v24, v25, v26, v27);
  if (a1 != a2)
  {
    uint64_t v29 = a3[9];
    uint64_t v30 = (void *)(a1 + v29);
    uint64_t v31 = (const void *)(a2 + v29);
    sub_100009240(a1 + v29, &qword_1000502F8);
    uint64_t v32 = sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_10004217C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v33 - 8) + 32))(v30, v31, v33);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    uint64_t v34 = a3[10];
    uint64_t v35 = (void *)(a1 + v34);
    uint64_t v36 = (const void *)(a2 + v34);
    sub_100009240(a1 + v34, &qword_100050300);
    uint64_t v37 = sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v38 = sub_100042B9C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v38 - 8) + 32))(v35, v36, v38);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100014D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014D1C);
}

uint64_t sub_100014D1C(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_1000420EC();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507E8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_11;
  }
  uint64_t v13 = sub_1000022D0(&qword_1000505D0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[9];
    goto LABEL_11;
  }
  uint64_t v15 = sub_1000022D0(&qword_1000505D8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[10];

  return v16(v18, a2, v17);
}

uint64_t sub_100014EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014F00);
}

uint64_t sub_100014F00(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_1000420EC();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507E8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_9;
  }
  uint64_t v13 = sub_1000022D0(&qword_1000505D0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[9];
    goto LABEL_9;
  }
  uint64_t v15 = sub_1000022D0(&qword_1000505D8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[10];

  return v16(v18, a2, a2, v17);
}

uint64_t type metadata accessor for EmptyStateView()
{
  uint64_t result = qword_100050BE0;
  if (!qword_100050BE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001511C()
{
  sub_1000420EC();
  if (v0 <= 0x3F)
  {
    sub_1000152CC(319, (unint64_t *)&qword_100050868, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v1 <= 0x3F)
    {
      sub_1000152CC(319, &qword_100050648, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
      if (v2 <= 0x3F)
      {
        sub_1000152CC(319, (unint64_t *)&unk_100050650, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1000152CC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10004218C();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_100015320()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001533C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000022D0(&qword_100050C40);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_1000424EC();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = sub_1000022D0(&qword_100050C48);
  sub_100015468(a1, &v6[*(int *)(v7 + 44)]);
  sub_1000421DC();
  sub_1000421DC();
  sub_100042B2C();
  sub_1000421CC();
  sub_1000091DC((uint64_t)v6, a2, &qword_100050C40);
  uint64_t v8 = (_OWORD *)(a2 + *(int *)(sub_1000022D0(&qword_100050C50) + 36));
  long long v9 = v11[1];
  *uint64_t v8 = v11[0];
  v8[1] = v9;
  v8[2] = v11[2];
  return sub_100009240((uint64_t)v6, &qword_100050C40);
}

uint64_t sub_100015468@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v76 = sub_100042BDC();
  uint64_t v75 = *(void *)(v76 - 8);
  uint64_t v3 = __chkstk_darwin(v76);
  uint64_t v74 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v73 = (uint64_t)&v65 - v5;
  uint64_t v6 = sub_1000022D0(&qword_100050C58);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1000022D0(&qword_100050C60);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000022D0(&qword_100050C68);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v65 - v18;
  uint64_t v69 = (uint64_t)&v65 - v18;
  sub_1000421DC();
  *uint64_t v8 = sub_100042B2C();
  v8[1] = v20;
  uint64_t v21 = sub_1000022D0(&qword_100050C70);
  sub_100015DD0(a1, (uint64_t)v8 + *(int *)(v21 + 44));
  sub_1000091DC((uint64_t)v8, (uint64_t)v12, &qword_100050C58);
  char v22 = &v12[*(int *)(v10 + 44)];
  *(void *)char v22 = 0;
  *((_WORD *)v22 + 4) = 1;
  sub_100009240((uint64_t)v8, &qword_100050C58);
  uint64_t v72 = type metadata accessor for EmptyStateView();
  uint64_t v71 = a1 + *(int *)(v72 + 24);
  uint64_t v23 = a1 + *(int *)(v72 + 32);
  char v82 = *(unsigned char *)(v23 + 32);
  long long v24 = *(_OWORD *)(v23 + 16);
  v81[0] = *(_OWORD *)v23;
  v81[1] = v24;
  sub_100009178((uint64_t)v81, (uint64_t)v83, &qword_100050A88);
  sub_100011954((uint64_t)v83, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  sub_100011954((uint64_t)v81, (void (*)(void, void, void, void, void))sub_10000E150);
  sub_100011954((uint64_t)v83, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  sub_100011954((uint64_t)v81, (void (*)(void, void, void, void, void))sub_10000E150);
  sub_100042B2C();
  sub_1000421CC();
  sub_1000091DC((uint64_t)v12, (uint64_t)v17, &qword_100050C60);
  uint64_t v25 = &v17[*(int *)(v14 + 44)];
  uint64_t v70 = v17;
  long long v26 = v79;
  *(_OWORD *)uint64_t v25 = v78;
  *((_OWORD *)v25 + 1) = v26;
  *((_OWORD *)v25 + 2) = v80;
  sub_100009240((uint64_t)v12, &qword_100050C60);
  sub_100009178((uint64_t)v17, (uint64_t)v19, &qword_100050C68);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_10004285C();
  uint64_t v29 = v28;
  LOBYTE(v12) = v30 & 1;
  sub_1000426EC();
  sub_10004268C();
  swift_release();
  uint64_t v31 = sub_10004279C();
  uint64_t v33 = v32;
  char v35 = v34;
  swift_release();
  sub_10000D48C(v27, v29, (char)v12);
  swift_bridgeObjectRelease();
  sub_10004267C();
  uint64_t v36 = sub_10004279C();
  uint64_t v67 = v37;
  LOBYTE(v29) = v38;
  uint64_t v68 = v39;
  swift_release();
  LOBYTE(v8) = v29 & 1;
  sub_10000D48C(v31, v33, v35 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v41 = swift_getKeyPath();
  int v66 = sub_1000425EC();
  int v65 = sub_10004265C();
  uint64_t v42 = v73;
  sub_10002C4CC(v73);
  uint64_t v43 = v75;
  uint64_t v44 = v74;
  uint64_t v45 = v76;
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, enum case for WidgetFamily.systemSmall(_:), v76);
  sub_100017700(&qword_100050B38, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100042CEC();
  int v46 = *(void (**)(char *, uint64_t))(v43 + 8);
  v46(v44, v45);
  v46((char *)v42, v45);
  sub_10004214C();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v55 = v69;
  uint64_t v56 = (uint64_t)v70;
  sub_1000091DC(v69, (uint64_t)v70, &qword_100050C68);
  uint64_t v57 = v77;
  *uint64_t v77 = 0;
  *((unsigned char *)v57 + 8) = 0;
  uint64_t v58 = (int *)sub_1000022D0(&qword_100050C78);
  sub_1000091DC(v56, (uint64_t)v57 + v58[12], &qword_100050C68);
  uint64_t v59 = (char *)v57 + v58[16];
  *(void *)uint64_t v59 = 0;
  v59[8] = 0;
  uint64_t v60 = (char *)v57 + v58[20];
  uint64_t v61 = v67;
  *(void *)uint64_t v60 = v36;
  *((void *)v60 + 1) = v61;
  v60[16] = (char)v8;
  *((void *)v60 + 3) = v68;
  *((void *)v60 + 4) = KeyPath;
  *((void *)v60 + 5) = 3;
  v60[48] = 0;
  *((void *)v60 + 7) = v41;
  v60[64] = 1;
  *((_DWORD *)v60 + 17) = v66;
  v60[72] = v65;
  *((void *)v60 + 10) = v48;
  *((void *)v60 + 11) = v50;
  *((void *)v60 + 12) = v52;
  *((void *)v60 + 13) = v54;
  v60[112] = 0;
  uint64_t v62 = (char *)v57 + v58[24];
  *(void *)uint64_t v62 = 0;
  v62[8] = 0;
  uint64_t v63 = v61;
  sub_10000D4A4(v36, v61, (char)v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100009240(v55, &qword_100050C68);
  sub_10000D48C(v36, v63, (char)v8);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100009240(v56, &qword_100050C68);
}

uint64_t sub_100015BD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004217C();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100041FEC();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100041FDC();
  type metadata accessor for EmptyStateView();
  sub_10002BF94((uint64_t)v5);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v11 = (uint64_t *)(a1 + *(int *)(sub_1000022D0(&qword_100050B48) + 36));
  uint64_t v12 = sub_1000022D0(&qword_100050B80);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v11 + *(int *)(v12 + 28), v5, v2);
  uint64_t *v11 = KeyPath;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100015DD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v138 = a1;
  uint64_t v130 = a2;
  uint64_t v127 = sub_100042B9C();
  uint64_t v126 = *(void *)(v127 - 8);
  uint64_t v2 = __chkstk_darwin(v127);
  v125 = (char *)&v111 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v124 = (uint64_t)&v111 - v4;
  uint64_t v120 = sub_1000022D0(&qword_100050700);
  __chkstk_darwin(v120);
  v123 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_1000022D0(&qword_100050708);
  uint64_t v6 = __chkstk_darwin(v122);
  uint64_t v129 = (uint64_t)&v111 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v121 = (uint64_t)&v111 - v9;
  __chkstk_darwin(v8);
  uint64_t v128 = (uint64_t)&v111 - v10;
  uint64_t v119 = sub_1000420CC();
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  v117 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000022D0(&qword_100050C80);
  __chkstk_darwin(v12 - 8);
  v114 = (char *)&v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_1000022D0(&qword_100050C88);
  uint64_t v14 = __chkstk_darwin(v116);
  uint64_t v140 = (uint64_t)&v111 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v139 = (uint64_t)&v111 - v16;
  uint64_t v152 = sub_10004217C();
  uint64_t v150 = *(void *)(v152 - 8);
  uint64_t v17 = __chkstk_darwin(v152);
  v151 = (char *)&v111 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v111 - v19;
  uint64_t v21 = sub_1000022D0(&qword_1000506F0);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10004299C();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v111 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1000420EC();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  v142 = (char *)&v111 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_1000022D0(&qword_1000506F8);
  uint64_t v112 = *(void *)(v141 - 8);
  uint64_t v31 = __chkstk_darwin(v141);
  v115 = (char *)&v111 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  v155 = (char *)&v111 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v154 = (char *)&v111 - v36;
  __chkstk_darwin(v35);
  char v38 = (char *)&v111 - v37;
  uint64_t v135 = sub_1000022D0(&qword_100050C90);
  uint64_t v39 = __chkstk_darwin(v135);
  uint64_t v137 = (uint64_t)&v111 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v43 = (char *)&v111 - v42;
  __chkstk_darwin(v41);
  uint64_t v153 = (uint64_t)&v111 - v44;
  if (qword_1000502E8 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_100003E70(v28, (uint64_t)qword_100053138);
  int v46 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  uint64_t v147 = v29 + 16;
  v134 = v46;
  v46(v142, v45, v28);
  sub_1000429FC();
  uint64_t v47 = *(void (**)(void))(v25 + 104);
  unsigned int v133 = enum case for Image.ResizingMode.stretch(_:);
  v148 = (void (*)(char *, uint64_t, uint64_t))v47;
  uint64_t v149 = v25 + 104;
  v47(v27);
  sub_1000429EC();
  uint64_t v132 = v28;
  swift_release();
  uint64_t v48 = *(void (**)(char *, uint64_t))(v25 + 8);
  uint64_t v111 = v24;
  v146 = v48;
  uint64_t v131 = v25 + 8;
  v48(v27, v24);
  sub_100042BBC();
  uint64_t v49 = sub_100042BCC();
  uint64_t v50 = *(void *)(v49 - 8);
  v144 = *(void (**)(char *, void, uint64_t))(v50 + 56);
  uint64_t v145 = v49;
  uint64_t v143 = v50 + 56;
  v144(v23, 0, 1);
  uint64_t v51 = v38;
  sub_1000429DC();
  swift_release();
  sub_100009240((uint64_t)v23, &qword_1000506F0);
  uint64_t v113 = type metadata accessor for EmptyStateView();
  uint64_t v52 = v20;
  sub_10002BF94((uint64_t)v20);
  uint64_t v53 = v150;
  uint64_t v54 = v151;
  uint64_t v55 = v152;
  (*(void (**)(char *, void, uint64_t))(v150 + 104))(v151, enum case for ColorScheme.light(_:), v152);
  char v56 = sub_10004216C();
  uint64_t v57 = *(void (**)(char *, uint64_t))(v53 + 8);
  v57(v54, v55);
  v57(v52, v55);
  if (v56) {
    double v58 = 0.3;
  }
  else {
    double v58 = 1.0;
  }
  uint64_t v59 = v112;
  uint64_t v60 = *(void (**)(uint64_t, char *, uint64_t))(v112 + 16);
  uint64_t v61 = v141;
  uint64_t v150 = v112 + 16;
  v136 = v60;
  v60((uint64_t)v43, v51, v141);
  *(double *)&v43[*(int *)(v135 + 36)] = v58;
  v151 = *(char **)(v59 + 8);
  uint64_t v152 = v59 + 8;
  ((void (*)(char *, uint64_t))v151)(v51, v61);
  sub_100009178((uint64_t)v43, v153, &qword_100050C90);
  uint64_t v62 = v59;
  if (qword_1000502E0 != -1) {
    swift_once();
  }
  uint64_t v63 = v132;
  uint64_t v64 = sub_100003E70(v132, (uint64_t)qword_100053120);
  int v65 = v142;
  int v66 = v134;
  v134(v142, v64, v63);
  sub_1000429FC();
  uint64_t v67 = v133;
  uint64_t v68 = v111;
  v148(v27, v133, v111);
  sub_1000429EC();
  swift_release();
  v146(v27, v68);
  sub_100042BBC();
  ((void (*)(char *, void, uint64_t, uint64_t))v144)(v23, 0, 1, v145);
  uint64_t v135 = (uint64_t)v27;
  uint64_t v69 = v155;
  sub_1000429DC();
  swift_release();
  sub_100009240((uint64_t)v23, &qword_1000506F0);
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v154, v69, v141);
  uint64_t v70 = v68;
  if (qword_1000502D8 != -1) {
    swift_once();
  }
  uint64_t v71 = sub_100003E70(v63, (uint64_t)qword_100053108);
  v66(v65, v71, v63);
  sub_1000429FC();
  uint64_t v72 = v135;
  v148((char *)v135, v67, v68);
  double v73 = 0.0;
  sub_1000429EC();
  swift_release();
  v146((char *)v72, v68);
  uint64_t v74 = enum case for Image.TemplateRenderingMode.template(_:);
  uint64_t v75 = sub_1000429CC();
  uint64_t v76 = *(void *)(v75 - 8);
  uint64_t v77 = (uint64_t)v114;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 104))(v114, v74, v75);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v76 + 56))(v77, 0, 1, v75);
  sub_1000429AC();
  swift_release();
  sub_100009240(v77, &qword_100050C80);
  sub_100042BAC();
  ((void (*)(char *, void, uint64_t, uint64_t))v144)(v23, 0, 1, v145);
  long long v78 = v155;
  sub_1000429DC();
  swift_release();
  sub_100009240((uint64_t)v23, &qword_1000506F0);
  uint64_t v79 = v138;
  uint64_t v80 = v70;
  v81 = v78;
  if (qword_1000502D0 != -1) {
    swift_once();
  }
  uint64_t v82 = v119;
  uint64_t v83 = sub_100003E70(v119, (uint64_t)qword_1000530F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v118 + 16))(v117, v83, v82);
  uint64_t v84 = sub_10004297C();
  uint64_t v85 = v140;
  uint64_t v86 = v141;
  v136(v140, v81, v141);
  *(void *)(v85 + *(int *)(v116 + 36)) = v84;
  ((void (*)(char *, uint64_t))v151)(v81, v86);
  sub_100009178(v85, v139, &qword_100050C88);
  v134(v142, v79 + *(int *)(v113 + 20), v132);
  sub_1000429FC();
  uint64_t v87 = v135;
  v148((char *)v135, v133, v80);
  sub_1000429EC();
  swift_release();
  v146((char *)v87, v80);
  sub_100042BBC();
  ((void (*)(char *, void, uint64_t, uint64_t))v144)(v23, 0, 1, v145);
  char v88 = v115;
  sub_1000429DC();
  swift_release();
  sub_100009240((uint64_t)v23, &qword_1000506F0);
  uint64_t v89 = v124;
  sub_10002C1DC(v124);
  uint64_t v90 = v125;
  sub_100042B8C();
  char v91 = sub_100042B7C();
  uint64_t v92 = *(void (**)(char *, uint64_t))(v126 + 8);
  uint64_t v93 = v127;
  v92(v90, v127);
  v92((char *)v89, v93);
  if (v91) {
    double v73 = 1.0;
  }
  uint64_t v94 = (uint64_t)v123;
  v95 = (void (*)(char *, char *, uint64_t))v136;
  v136((uint64_t)v123, v88, v86);
  *(double *)(v94 + *(int *)(v120 + 36)) = v73;
  ((void (*)(char *, uint64_t))v151)(v88, v86);
  sub_10002C1DC(v89);
  sub_100042B8C();
  char v96 = sub_100042B7C();
  v92(v90, v93);
  v92((char *)v89, v93);
  if (v96) {
    double v97 = 0.9;
  }
  else {
    double v97 = 1.0;
  }
  uint64_t v98 = v121;
  sub_1000091DC(v94, v121, &qword_100050700);
  *(double *)(v98 + *(int *)(v122 + 36)) = v97;
  sub_100009240(v94, &qword_100050700);
  uint64_t v99 = v128;
  sub_100009178(v98, v128, &qword_100050708);
  uint64_t v100 = v137;
  sub_1000091DC(v153, v137, &qword_100050C90);
  uint64_t v101 = v155;
  uint64_t v102 = v86;
  v95(v155, v154, v86);
  uint64_t v103 = (void (*)(uint64_t, char *, uint64_t))v95;
  uint64_t v104 = v139;
  uint64_t v105 = v140;
  sub_1000091DC(v139, v140, &qword_100050C88);
  uint64_t v106 = v129;
  sub_1000091DC(v99, v129, &qword_100050708);
  uint64_t v107 = v130;
  sub_1000091DC(v100, v130, &qword_100050C90);
  Swift::String v108 = (int *)sub_1000022D0(&qword_100050C98);
  v103(v107 + v108[12], v101, v102);
  sub_1000091DC(v105, v107 + v108[16], &qword_100050C88);
  sub_1000091DC(v106, v107 + v108[20], &qword_100050708);
  sub_100009240(v99, &qword_100050708);
  sub_100009240(v104, &qword_100050C88);
  v109 = v151;
  ((void (*)(char *, uint64_t))v151)(v154, v102);
  sub_100009240(v153, &qword_100050C90);
  sub_100009240(v106, &qword_100050708);
  sub_100009240(v105, &qword_100050C88);
  ((void (*)(char *, uint64_t))v109)(v155, v102);
  return sub_100009240(v137, &qword_100050C90);
}

uint64_t sub_100016F94(uint64_t a1)
{
  uint64_t v3 = sub_10004262C();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v5);
  uint64_t v10 = &v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000171DC(v1, (uint64_t)v10);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  sub_10001749C((uint64_t)v10, v12 + v11);
  uint64_t v16 = sub_100017500;
  uint64_t v17 = v12;
  sub_10004261C();
  uint64_t v15 = v1;
  sub_100042B2C();
  sub_1000022D0(&qword_100050C30);
  sub_1000022D0(&qword_100050B48);
  sub_100009134(&qword_100050C38, &qword_100050C30);
  sub_1000138A4();
  sub_1000428EC();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  return swift_release();
}

uint64_t sub_1000171DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EmptyStateView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017240()
{
  uint64_t v1 = (int *)type metadata accessor for EmptyStateView();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v2 + v1[5];
  uint64_t v4 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v2 + v1[7];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v2 + v1[8];
  sub_10000E150(*(void *)v7, *(void *)(v7 + 8), *(void *)(v7 + 16), *(void *)(v7 + 24), *(unsigned char *)(v7 + 32));
  uint64_t v8 = v2 + v1[9];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v2 + v1[10];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100042B9C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_10001749C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EmptyStateView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for EmptyStateView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10001533C(v4, a1);
}

uint64_t sub_100017580@<X0>(uint64_t a1@<X8>)
{
  return sub_100015BD0(a1);
}

uint64_t sub_100017588@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1000423CC();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000175BC()
{
  return sub_1000423DC();
}

uint64_t sub_1000175EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004235C();
  *a1 = result;
  return result;
}

uint64_t sub_100017618()
{
  return sub_10004236C();
}

uint64_t sub_100017648@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1000423CC();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10001767C()
{
  return sub_1000423DC();
}

uint64_t sub_1000176AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004235C();
  *a1 = result;
  return result;
}

uint64_t sub_1000176D8()
{
  return sub_10004236C();
}

uint64_t sub_100017700(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for EmptyStateView.Style()
{
  return &type metadata for EmptyStateView.Style;
}

uint64_t sub_100017758()
{
  return swift_getOpaqueTypeConformance2();
}

void **sub_1000177FC(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100041D4C();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v12 = v4;
    if (v11(v8, 1, v9))
    {
      uint64_t v13 = sub_1000022D0(&qword_1000507D8);
      memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v5;
}

uint64_t sub_10001797C(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100041D4C();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void **sub_100017A4C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_100041D4C();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  id v11 = v4;
  if (v10(v7, 1, v8))
  {
    uint64_t v12 = sub_1000022D0(&qword_1000507D8);
    memcpy(v6, v7, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void **sub_100017B6C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100041D4C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_1000022D0(&qword_1000507D8);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

void *sub_100017CF8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100041D4C();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = sub_1000022D0(&qword_1000507D8);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void **sub_100017E0C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100041D4C();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_1000022D0(&qword_1000507D8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_100017F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017FA8);
}

uint64_t sub_100017FA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000022D0(&qword_1000507D8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001805C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018070);
}

void *sub_100018070(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000022D0(&qword_1000507D8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LoadedView.Callout(uint64_t a1)
{
  return sub_10000D730(a1, qword_100050CF8);
}

void sub_10001813C()
{
  sub_10001B460(319, &qword_100050860, (uint64_t (*)(uint64_t))&type metadata accessor for Badge, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for LoadedView.Style()
{
  return &type metadata for LoadedView.Style;
}

void *initializeBufferWithCopyOfBuffer for LoadedView.Background(void *a1, void **a2)
{
  int v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for LoadedView.Background(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for LoadedView.Background(void **a1, void **a2)
{
  int v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *initializeWithTake for LoadedView.Background(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for LoadedView.Background(void **a1, unint64_t *a2)
{
  int v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for LoadedView.Background(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LoadedView.Background(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_100018410(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100018428(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for LoadedView.Background()
{
  return &type metadata for LoadedView.Background;
}

uint64_t sub_100018458(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8)
    {
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v8;
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      *(void *)(a1 + 56) = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v10;
    }
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    int v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100041B5C();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_1000022D0(&qword_1000507D0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v17 = a3[7];
    uint64_t v18 = (void *)(a1 + v17);
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_100041D4C();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48);
    uint64_t v71 = v21;
    if (v22(v19, 1, v20))
    {
      uint64_t v23 = sub_1000022D0(&qword_1000507D8);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v24 = a3[8];
    uint64_t v25 = a3[9];
    uint64_t v26 = (void *)(a1 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a1 + v25;
    uint64_t v30 = (uint64_t)a2 + v25;
    uint64_t v31 = *(void **)((char *)a2 + v25);
    *(void *)(a1 + v25) = v31;
    uint64_t v32 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v33 = (void *)(v29 + v32);
    uint64_t v34 = (const void *)(v30 + v32);
    swift_bridgeObjectRetain();
    id v35 = v31;
    if (v22(v34, 1, v20))
    {
      uint64_t v36 = sub_1000022D0(&qword_1000507D8);
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v71 + 16))(v33, v34, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v71 + 56))(v33, 0, 1, v20);
    }
    uint64_t v37 = a3[10];
    char v38 = *(void **)((char *)a2 + v37);
    if ((unint64_t)v38 >= 2) {
      id v39 = v38;
    }
    *(void *)(a1 + v37) = v38;
    uint64_t v40 = a3[12];
    *(void *)(a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    uint64_t v41 = (void *)(a1 + v40);
    uint64_t v42 = (uint64_t *)((char *)a2 + v40);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v43 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
    }
    else
    {
      *uint64_t v41 = *v42;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v44 = a3[13];
    uint64_t v45 = a1 + v44;
    uint64_t v46 = (uint64_t)a2 + v44;
    uint64_t v47 = *(void *)v46;
    uint64_t v48 = *(void *)(v46 + 8);
    uint64_t v49 = *(void *)(v46 + 16);
    uint64_t v50 = *(void *)(v46 + 24);
    char v51 = *(unsigned char *)(v46 + 32);
    sub_10000E070(*(void *)v46, v48, v49, v50, v51);
    *(void *)uint64_t v45 = v47;
    *(void *)(v45 + 8) = v48;
    *(void *)(v45 + 16) = v49;
    *(void *)(v45 + 24) = v50;
    *(unsigned char *)(v45 + 32) = v51;
    uint64_t v52 = a3[14];
    uint64_t v53 = (void *)(a1 + v52);
    uint64_t v54 = (uint64_t *)((char *)a2 + v52);
    sub_1000022D0(&qword_100050D30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v55 = sub_10004226C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
    }
    else
    {
      *uint64_t v53 = *v54;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v56 = a3[15];
    uint64_t v57 = (void *)(a1 + v56);
    double v58 = (uint64_t *)((char *)a2 + v56);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v59 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v59 - 8) + 16))(v57, v58, v59);
    }
    else
    {
      *uint64_t v57 = *v58;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v60 = a3[16];
    uint64_t v61 = (void *)(a1 + v60);
    uint64_t v62 = (uint64_t *)((char *)a2 + v60);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v63 = sub_100042B9C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
    }
    else
    {
      *uint64_t v61 = *v62;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v64 = a3[17];
    uint64_t v65 = a1 + v64;
    uint64_t v66 = (uint64_t)a2 + v64;
    uint64_t v67 = *(void *)v66;
    uint64_t v68 = *(void *)(v66 + 8);
    char v69 = *(unsigned char *)(v66 + 16);
    sub_100018AE0(*(void *)v66, v68, v69);
    *(void *)uint64_t v65 = v67;
    *(void *)(v65 + 8) = v68;
    *(unsigned char *)(v65 + 16) = v69;
  }
  return a1;
}

uint64_t sub_100018AE0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100018AEC(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_100041B5C();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_100041D4C();
  uint64_t v9 = *(void *)(v8 - 8);
  long long v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = (id *)(a1 + a2[9]);

  uint64_t v12 = (char *)v11 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  if (!v10((uint64_t)v12, 1, v8)) {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  int v13 = *(void **)(a1 + a2[10]);
  if ((unint64_t)v13 >= 2) {

  }
  uint64_t v14 = a1 + a2[12];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = a1 + a2[13];
  sub_10000E150(*(void *)v16, *(void *)(v16 + 8), *(void *)(v16 + 16), *(void *)(v16 + 24), *(unsigned char *)(v16 + 32));
  uint64_t v17 = a1 + a2[14];
  sub_1000022D0(&qword_100050D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_10004226C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  }
  else
  {
    swift_release();
  }
  uint64_t v19 = a1 + a2[15];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  }
  else
  {
    swift_release();
  }
  uint64_t v21 = a1 + a2[16];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_100042B9C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  }
  else
  {
    swift_release();
  }
  uint64_t v23 = a1 + a2[17];
  uint64_t v24 = *(void *)v23;
  uint64_t v25 = *(void *)(v23 + 8);
  char v26 = *(unsigned char *)(v23 + 16);

  return sub_100018ED0(v24, v25, v26);
}

uint64_t sub_100018ED0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100018EDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = a3[6];
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_100041B5C();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_1000022D0(&qword_1000507D0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_100041D4C();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v20(v17, 1, v18))
  {
    uint64_t v21 = sub_1000022D0(&qword_1000507D8);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  char v69 = a3;
  uint64_t v24 = (void *)(a1 + v22);
  uint64_t v25 = (void *)(a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a1 + v23;
  uint64_t v28 = a2 + v23;
  uint64_t v29 = *(void **)(a2 + v23);
  *(void *)(a1 + v23) = v29;
  uint64_t v30 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  uint64_t v31 = (void *)(v27 + v30);
  uint64_t v32 = (const void *)(v28 + v30);
  swift_bridgeObjectRetain();
  id v33 = v29;
  if (v20(v32, 1, v18))
  {
    uint64_t v34 = sub_1000022D0(&qword_1000507D8);
    memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v31, v32, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v31, 0, 1, v18);
  }
  uint64_t v35 = v69[10];
  uint64_t v36 = *(void **)(a2 + v35);
  if ((unint64_t)v36 >= 2) {
    id v37 = v36;
  }
  *(void *)(a1 + v35) = v36;
  uint64_t v38 = v69[12];
  *(void *)(a1 + v69[11]) = *(void *)(a2 + v69[11]);
  id v39 = (void *)(a1 + v38);
  uint64_t v40 = (void *)(a2 + v38);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v41 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
  }
  else
  {
    *id v39 = *v40;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v42 = v69[13];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  uint64_t v45 = *(void *)v44;
  uint64_t v46 = *(void *)(v44 + 8);
  uint64_t v47 = *(void *)(v44 + 16);
  uint64_t v48 = *(void *)(v44 + 24);
  char v49 = *(unsigned char *)(v44 + 32);
  sub_10000E070(*(void *)v44, v46, v47, v48, v49);
  *(void *)uint64_t v43 = v45;
  *(void *)(v43 + 8) = v46;
  *(void *)(v43 + 16) = v47;
  *(void *)(v43 + 24) = v48;
  *(unsigned char *)(v43 + 32) = v49;
  uint64_t v50 = v69[14];
  char v51 = (void *)(a1 + v50);
  uint64_t v52 = (void *)(a2 + v50);
  sub_1000022D0(&qword_100050D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v53 = sub_10004226C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v53 - 8) + 16))(v51, v52, v53);
  }
  else
  {
    *char v51 = *v52;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v54 = v69[15];
  uint64_t v55 = (void *)(a1 + v54);
  uint64_t v56 = (void *)(a2 + v54);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v57 = sub_10004217C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
  }
  else
  {
    *uint64_t v55 = *v56;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v58 = v69[16];
  uint64_t v59 = (void *)(a1 + v58);
  uint64_t v60 = (void *)(a2 + v58);
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v61 = sub_100042B9C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
  }
  else
  {
    *uint64_t v59 = *v60;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v62 = v69[17];
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  uint64_t v65 = *(void *)v64;
  uint64_t v66 = *(void *)(v64 + 8);
  char v67 = *(unsigned char *)(v64 + 16);
  sub_100018AE0(*(void *)v64, v66, v67);
  *(void *)uint64_t v63 = v65;
  *(void *)(v63 + 8) = v66;
  *(unsigned char *)(v63 + 16) = v67;
  return a1;
}

uint64_t sub_100019518(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v8)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10000AAE0(a1 + 32);
      long long v9 = *(_OWORD *)(a2 + 48);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 48) = v9;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 48);
    *uint64_t v6 = *v7;
    *(_OWORD *)(a1 + 48) = v10;
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_100041B5C();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_13:
    uint64_t v19 = sub_1000022D0(&qword_1000507D0);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_14:
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = sub_100041D4C();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v27)
  {
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
LABEL_19:
    uint64_t v28 = sub_1000022D0(&qword_1000507D8);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
LABEL_20:
  uint64_t v29 = a3[8];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[9];
  id v33 = (void **)(a1 + v32);
  uint64_t v34 = a2 + v32;
  uint64_t v35 = *(void **)(a2 + v32);
  uint64_t v36 = *v33;
  *id v33 = v35;
  id v37 = v35;

  uint64_t v38 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  id v39 = (char *)v33 + v38;
  uint64_t v40 = (void *)(v34 + v38);
  LODWORD(v36) = v25(v39, 1, v23);
  int v41 = v25(v40, 1, v23);
  if (v36)
  {
    if (!v41)
    {
      (*(void (**)(char *, void *, uint64_t))(v24 + 16))(v39, v40, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v39, 0, 1, v23);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v39, v23);
LABEL_25:
    uint64_t v42 = sub_1000022D0(&qword_1000507D8);
    memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, void *, uint64_t))(v24 + 24))(v39, v40, v23);
LABEL_26:
  uint64_t v43 = a3[10];
  uint64_t v44 = *(void **)(a1 + v43);
  uint64_t v45 = *(void **)(a2 + v43);
  if ((unint64_t)v44 < 2)
  {
    if ((unint64_t)v45 >= 2)
    {
      *(void *)(a1 + v43) = v45;
      id v46 = v45;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  if ((unint64_t)v45 < 2)
  {

    uint64_t v45 = *(void **)(a2 + v43);
LABEL_31:
    *(void *)(a1 + v43) = v45;
    goto LABEL_33;
  }
  *(void *)(a1 + v43) = v45;
  id v47 = v45;

LABEL_33:
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  if (a1 != a2)
  {
    uint64_t v48 = a3[12];
    char v49 = (void *)(a1 + v48);
    uint64_t v50 = (void *)(a2 + v48);
    sub_100009240(a1 + v48, &qword_1000507E0);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v51 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
    }
    else
    {
      *char v49 = *v50;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v52 = a3[13];
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  uint64_t v55 = *(void *)v54;
  uint64_t v56 = *(void *)(v54 + 8);
  uint64_t v57 = *(void *)(v54 + 16);
  uint64_t v58 = *(void *)(v54 + 24);
  char v59 = *(unsigned char *)(v54 + 32);
  sub_10000E070(*(void *)v54, v56, v57, v58, v59);
  uint64_t v60 = *(void *)v53;
  uint64_t v61 = *(void *)(v53 + 8);
  uint64_t v62 = *(void *)(v53 + 16);
  uint64_t v63 = *(void *)(v53 + 24);
  char v64 = *(unsigned char *)(v53 + 32);
  *(void *)uint64_t v53 = v55;
  *(void *)(v53 + 8) = v56;
  *(void *)(v53 + 16) = v57;
  *(void *)(v53 + 24) = v58;
  *(unsigned char *)(v53 + 32) = v59;
  sub_10000E150(v60, v61, v62, v63, v64);
  if (a1 != a2)
  {
    uint64_t v65 = a3[14];
    uint64_t v66 = (void *)(a1 + v65);
    char v67 = (void *)(a2 + v65);
    sub_100009240(a1 + v65, &qword_100050D30);
    sub_1000022D0(&qword_100050D30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v68 = sub_10004226C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v68 - 8) + 16))(v66, v67, v68);
    }
    else
    {
      *uint64_t v66 = *v67;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v69 = a3[15];
    uint64_t v70 = (void *)(a1 + v69);
    uint64_t v71 = (void *)(a2 + v69);
    sub_100009240(a1 + v69, &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v72 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v72 - 8) + 16))(v70, v71, v72);
    }
    else
    {
      *uint64_t v70 = *v71;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v73 = a3[16];
    uint64_t v74 = (void *)(a1 + v73);
    uint64_t v75 = (void *)(a2 + v73);
    sub_100009240(a1 + v73, &qword_100050300);
    sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v76 = sub_100042B9C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v76 - 8) + 16))(v74, v75, v76);
    }
    else
    {
      *uint64_t v74 = *v75;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v77 = a3[17];
  uint64_t v78 = a1 + v77;
  uint64_t v79 = a2 + v77;
  uint64_t v80 = *(void *)v79;
  uint64_t v81 = *(void *)(v79 + 8);
  char v82 = *(unsigned char *)(v79 + 16);
  sub_100018AE0(*(void *)v79, v81, v82);
  uint64_t v83 = *(void *)v78;
  uint64_t v84 = *(void *)(v78 + 8);
  char v85 = *(unsigned char *)(v78 + 16);
  *(void *)uint64_t v78 = v80;
  *(void *)(v78 + 8) = v81;
  *(unsigned char *)(v78 + 16) = v82;
  sub_100018ED0(v83, v84, v85);
  return a1;
}

_OWORD *sub_100019D98(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  long long v9 = (char *)a1 + v8;
  long long v10 = (char *)a2 + v8;
  uint64_t v11 = sub_100041B5C();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_1000022D0(&qword_1000507D0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100041D4C();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = sub_1000022D0(&qword_1000507D8);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  uint64_t v24 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  uint64_t v25 = &v22[v24];
  int v26 = &v23[v24];
  if (v19(v26, 1, v17))
  {
    uint64_t v27 = sub_1000022D0(&qword_1000507D8);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v26, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v25, 0, 1, v17);
  }
  uint64_t v28 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  uint64_t v29 = a3[12];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v33 = sub_100042BDC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v30, v31, v33);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  uint64_t v34 = a3[13];
  uint64_t v35 = a3[14];
  uint64_t v36 = (char *)a1 + v34;
  id v37 = (char *)a2 + v34;
  long long v38 = *((_OWORD *)v37 + 1);
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
  *((_OWORD *)v36 + 1) = v38;
  v36[32] = v37[32];
  id v39 = (char *)a1 + v35;
  uint64_t v40 = (char *)a2 + v35;
  uint64_t v41 = sub_1000022D0(&qword_100050D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v42 = sub_10004226C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v39, v40, v42);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
  }
  uint64_t v43 = a3[15];
  uint64_t v44 = (char *)a1 + v43;
  uint64_t v45 = (char *)a2 + v43;
  uint64_t v46 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v47 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v44, v45, v47);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
  }
  uint64_t v48 = a3[16];
  char v49 = (char *)a1 + v48;
  uint64_t v50 = (char *)a2 + v48;
  uint64_t v51 = sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v52 = sub_100042B9C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(v49, v50, v52);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v49, v50, *(void *)(*(void *)(v51 - 8) + 64));
  }
  uint64_t v53 = a3[17];
  uint64_t v54 = (char *)a1 + v53;
  uint64_t v55 = (char *)a2 + v53;
  *(_OWORD *)uint64_t v54 = *(_OWORD *)v55;
  v54[16] = v55[16];
  return a1;
}

uint64_t sub_10001A340(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = *(void *)(a2 + 40);
    if (v7)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_10000AAE0(a1 + 32);
  }
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
LABEL_6:
  uint64_t v9 = a3[6];
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_100041B5C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_11:
    uint64_t v17 = sub_1000022D0(&qword_1000507D0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_12:
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_100041D4C();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
LABEL_17:
    uint64_t v26 = sub_1000022D0(&qword_1000507D8);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v19, v20, v21);
LABEL_18:
  uint64_t v27 = a3[8];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[9];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = *(void *)(a2 + v32);

  uint64_t v36 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  id v37 = (void *)(v33 + v36);
  long long v38 = (void *)(v34 + v36);
  int v39 = v23(v37, 1, v21);
  int v40 = v23(v38, 1, v21);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v37, v38, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v37, 0, 1, v21);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v37, v21);
LABEL_23:
    uint64_t v41 = sub_1000022D0(&qword_1000507D8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v37, v38, v21);
LABEL_24:
  uint64_t v42 = a3[10];
  uint64_t v43 = *(void **)(a1 + v42);
  unint64_t v44 = *(void *)(a2 + v42);
  if ((unint64_t)v43 >= 2)
  {
    if (v44 >= 2)
    {
      *(void *)(a1 + v42) = v44;
    }
    else
    {

      *(void *)(a1 + v42) = *(void *)(a2 + v42);
    }
  }
  else
  {
    *(void *)(a1 + v42) = v44;
  }
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  if (a1 != a2)
  {
    uint64_t v45 = a3[12];
    uint64_t v46 = (void *)(a1 + v45);
    uint64_t v47 = (const void *)(a2 + v45);
    sub_100009240(a1 + v45, &qword_1000507E0);
    uint64_t v48 = sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v49 = sub_100042BDC();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v49 - 8) + 32))(v46, v47, v49);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v46, v47, *(void *)(*(void *)(v48 - 8) + 64));
    }
  }
  uint64_t v50 = a3[13];
  uint64_t v51 = a1 + v50;
  uint64_t v52 = a2 + v50;
  char v53 = *(unsigned char *)(v52 + 32);
  uint64_t v54 = *(void *)v51;
  uint64_t v55 = *(void *)(v51 + 8);
  uint64_t v56 = *(void *)(v51 + 16);
  uint64_t v57 = *(void *)(v51 + 24);
  char v58 = *(unsigned char *)(v51 + 32);
  long long v59 = *(_OWORD *)(v52 + 16);
  *(_OWORD *)uint64_t v51 = *(_OWORD *)v52;
  *(_OWORD *)(v51 + 16) = v59;
  *(unsigned char *)(v51 + 32) = v53;
  sub_10000E150(v54, v55, v56, v57, v58);
  if (a1 != a2)
  {
    uint64_t v60 = a3[14];
    uint64_t v61 = (void *)(a1 + v60);
    uint64_t v62 = (const void *)(a2 + v60);
    sub_100009240(a1 + v60, &qword_100050D30);
    uint64_t v63 = sub_1000022D0(&qword_100050D30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v64 = sub_10004226C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v64 - 8) + 32))(v61, v62, v64);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v61, v62, *(void *)(*(void *)(v63 - 8) + 64));
    }
    uint64_t v65 = a3[15];
    uint64_t v66 = (void *)(a1 + v65);
    char v67 = (const void *)(a2 + v65);
    sub_100009240(a1 + v65, &qword_1000502F8);
    uint64_t v68 = sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v69 = sub_10004217C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v69 - 8) + 32))(v66, v67, v69);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v66, v67, *(void *)(*(void *)(v68 - 8) + 64));
    }
    uint64_t v70 = a3[16];
    uint64_t v71 = (void *)(a1 + v70);
    uint64_t v72 = (const void *)(a2 + v70);
    sub_100009240(a1 + v70, &qword_100050300);
    uint64_t v73 = sub_1000022D0(&qword_100050300);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v74 = sub_100042B9C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v74 - 8) + 32))(v71, v72, v74);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v71, v72, *(void *)(*(void *)(v73 - 8) + 64));
    }
  }
  uint64_t v75 = a3[17];
  uint64_t v76 = a1 + v75;
  uint64_t v77 = a2 + v75;
  char v78 = *(unsigned char *)(v77 + 16);
  uint64_t v79 = *(void *)v76;
  uint64_t v80 = *(void *)(v76 + 8);
  char v81 = *(unsigned char *)(v76 + 16);
  *(_OWORD *)uint64_t v76 = *(_OWORD *)v77;
  *(unsigned char *)(v76 + 16) = v78;
  sub_100018ED0(v79, v80, v81);
  return a1;
}

uint64_t sub_10001AB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001AB54);
}

uint64_t sub_10001AB54(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_1000022D0(&qword_1000507D0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_17:
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v17(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507D8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_17;
  }
  uint64_t v13 = type metadata accessor for LoadedView.Callout(0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[9];
    goto LABEL_17;
  }
  uint64_t v14 = sub_1000022D0(&qword_1000507E8);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v9 = v14;
    uint64_t v10 = *(void *)(v14 - 8);
    uint64_t v11 = a3[12];
    goto LABEL_17;
  }
  uint64_t v15 = sub_1000022D0(&qword_100050D38);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v9 = v15;
    uint64_t v10 = *(void *)(v15 - 8);
    uint64_t v11 = a3[14];
    goto LABEL_17;
  }
  uint64_t v16 = sub_1000022D0(&qword_1000505D0);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v9 = v16;
    uint64_t v10 = *(void *)(v16 - 8);
    uint64_t v11 = a3[15];
    goto LABEL_17;
  }
  uint64_t v18 = sub_1000022D0(&qword_1000505D8);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a3[16];

  return v19(v21, a2, v20);
}

uint64_t sub_10001AE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001AE28);
}

uint64_t sub_10001AE28(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_1000022D0(&qword_1000507D0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_15:
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v17(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507D8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_15;
  }
  uint64_t v13 = type metadata accessor for LoadedView.Callout(0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[9];
    goto LABEL_15;
  }
  uint64_t v14 = sub_1000022D0(&qword_1000507E8);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a3)
  {
    uint64_t v9 = v14;
    uint64_t v10 = *(void *)(v14 - 8);
    uint64_t v11 = a4[12];
    goto LABEL_15;
  }
  uint64_t v15 = sub_1000022D0(&qword_100050D38);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a3)
  {
    uint64_t v9 = v15;
    uint64_t v10 = *(void *)(v15 - 8);
    uint64_t v11 = a4[14];
    goto LABEL_15;
  }
  uint64_t v16 = sub_1000022D0(&qword_1000505D0);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v9 = v16;
    uint64_t v10 = *(void *)(v16 - 8);
    uint64_t v11 = a4[15];
    goto LABEL_15;
  }
  uint64_t v18 = sub_1000022D0(&qword_1000505D8);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = v5 + a4[16];

  return v19(v21, a2, a2, v20);
}

uint64_t type metadata accessor for LoadedView(uint64_t a1)
{
  return sub_10000D730(a1, (uint64_t *)&unk_100050D98);
}

void sub_10001B108()
{
  sub_10001B460(319, &qword_100050858, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F)
  {
    sub_10001B460(319, &qword_100050860, (uint64_t (*)(uint64_t))&type metadata accessor for Badge, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F)
    {
      type metadata accessor for LoadedView.Callout(319);
      if (v2 <= 0x3F)
      {
        sub_10001B460(319, (unint64_t *)&qword_100050868, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
        if (v3 <= 0x3F)
        {
          sub_10001B460(319, (unint64_t *)&unk_100050DA8, (uint64_t (*)(uint64_t))&type metadata accessor for LayoutDirection, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
          if (v4 <= 0x3F)
          {
            sub_10001B460(319, &qword_100050648, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
            if (v5 <= 0x3F)
            {
              sub_10001B460(319, (unint64_t *)&unk_100050650, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
              if (v6 <= 0x3F) {
                swift_initStructMetadata();
              }
            }
          }
        }
      }
    }
  }
}

void sub_10001B460(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10001B4C4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t *sub_10001B4E0(void (*a1)(long long *__return_ptr, _OWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v22 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100040BCC(0, v5, 0);
    unint64_t v6 = (unint64_t *)&_swiftEmptyArrayStorage;
    for (i = (long long *)(a3 + 48); ; i += 2)
    {
      long long v10 = *i;
      v19[0] = *(i - 1);
      v19[1] = v10;
      a1(&v20, v19);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      long long v11 = v20;
      long long v12 = v21;
      uint64_t v22 = v6;
      unint64_t v14 = v6[2];
      unint64_t v13 = v6[3];
      if (v14 >= v13 >> 1)
      {
        long long v17 = v21;
        long long v18 = v20;
        sub_100040BCC(v13 > 1, v14 + 1, 1);
        long long v12 = v17;
        long long v11 = v18;
        unint64_t v6 = v22;
      }
      _OWORD v6[2] = v14 + 1;
      uint64_t v15 = &v6[4 * v14];
      *((_OWORD *)v15 + 2) = v11;
      *((_OWORD *)v15 + 3) = v12;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_10001B5FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v35 = sub_10004262C();
  uint64_t v33 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v32 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000022D0(&qword_100050E08);
  __chkstk_darwin(v3 - 8);
  uint64_t v31 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LoadedView(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8);
  unint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000022D0(&qword_100050E10);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  long long v12 = (uint64_t (**)@<X0>(uint64_t@<X8>))((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v30 = sub_1000022D0(&qword_100050E18);
  __chkstk_darwin(v30);
  uint64_t v29 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E92C(v1, (uint64_t)v8);
  unint64_t v14 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = swift_allocObject();
  sub_1000204FC((uint64_t)v8, v15 + v14, type metadata accessor for LoadedView);
  uint64_t v28 = v1;
  sub_10001E92C(v1, (uint64_t)v8);
  uint64_t v16 = swift_allocObject();
  sub_1000204FC((uint64_t)v8, v16 + v14, type metadata accessor for LoadedView);
  sub_10001E92C(v1, (uint64_t)v8);
  uint64_t v17 = swift_allocObject();
  sub_1000204FC((uint64_t)v8, v17 + v14, type metadata accessor for LoadedView);
  *long long v12 = sub_10001E994;
  v12[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v15;
  _OWORD v12[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_10001EE74;
  v12[3] = (uint64_t (*)@<X0>(uint64_t@<X8>))v16;
  v12[4] = sub_10001EE7C;
  v12[5] = (uint64_t (*)@<X0>(uint64_t@<X8>))v17;
  long long v18 = (uint64_t *)((char *)v12 + *(int *)(v10 + 84));
  *long long v18 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = (char *)v12 + *(int *)(v10 + 88);
  *(void *)uint64_t v19 = swift_getKeyPath();
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *((void *)v19 + 3) = 0;
  v19[32] = 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = (uint64_t)v31;
  sub_100042ACC();
  uint64_t v22 = sub_100042ADC();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 0, 1, v22);
  uint64_t v23 = (uint64_t)v29;
  int v24 = (uint64_t *)&v29[*(int *)(v30 + 36)];
  uint64_t v25 = sub_1000022D0(&qword_100050E20);
  sub_1000091DC(v21, (uint64_t)v24 + *(int *)(v25 + 28), &qword_100050E08);
  *int v24 = KeyPath;
  sub_1000091DC((uint64_t)v12, v23, &qword_100050E10);
  sub_100009240(v21, &qword_100050E08);
  sub_100009240((uint64_t)v12, &qword_100050E10);
  uint64_t v26 = v32;
  sub_10004261C();
  uint64_t v36 = v28;
  sub_100042B2C();
  sub_1000022D0(&qword_100050E28);
  sub_10001EF24();
  sub_10001EFE8();
  sub_1000428EC();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v35);
  return sub_100009240(v23, &qword_100050E18);
}

uint64_t sub_10001BAE4(uint64_t a1)
{
  uint64_t v2 = sub_1000022D0(&qword_100050E08);
  __chkstk_darwin(v2 - 8);
  sub_1000091DC(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100050E08);
  return sub_10004234C();
}

uint64_t sub_10001BB78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004217C();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000022D0(&qword_100050E58);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BD28((uint64_t)v8);
  type metadata accessor for LoadedView(0);
  sub_10002BF94((uint64_t)v5);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = (uint64_t *)(a1 + *(int *)(sub_1000022D0(&qword_100050E28) + 36));
  uint64_t v11 = sub_1000022D0(&qword_100050B80);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v10 + *(int *)(v11 + 28), v5, v2);
  *uint64_t v10 = KeyPath;
  sub_1000091DC((uint64_t)v8, a1, &qword_100050E58);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_100009240((uint64_t)v8, &qword_100050E58);
}

uint64_t sub_10001BD28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v79 = a1;
  uint64_t v80 = sub_1000022D0(&qword_100050E88);
  __chkstk_darwin(v80);
  uint64_t v4 = (uint64_t *)((char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = sub_100041FEC();
  uint64_t v69 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v66 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_1000022D0(&qword_100050E90);
  __chkstk_darwin(v76);
  uint64_t v78 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1000022D0(&qword_100050E98);
  __chkstk_darwin(v71);
  uint64_t v73 = (uint64_t *)((char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v77 = sub_1000022D0(&qword_100050E68);
  __chkstk_darwin(v77);
  uint64_t v74 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100042B9C();
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v65 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v64 = (uint64_t)&v58 - v11;
  uint64_t v12 = sub_1000022D0(&qword_1000506F0);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10004299C();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  long long v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_1000022D0(&qword_1000506F8);
  uint64_t v19 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_1000022D0(&qword_100050700);
  __chkstk_darwin(v59);
  uint64_t v23 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1000022D0(&qword_100050EA0);
  __chkstk_darwin(v62);
  uint64_t v60 = (uint64_t)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000022D0(&qword_100050EA8);
  __chkstk_darwin(v61);
  uint64_t v70 = (uint64_t)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(int *)(type metadata accessor for LoadedView(0) + 40);
  *(void *)&long long v72 = v2;
  uint64_t v27 = *(void **)(v2 + v26);
  if (v27)
  {
    if (v27 == (void *)1)
    {
      *uint64_t v4 = sub_100042B2C();
      v4[1] = v28;
      uint64_t v29 = sub_1000022D0(&qword_100050EB0);
      sub_10001D3DC((char *)v4 + *(int *)(v29 + 44));
      sub_1000091DC((uint64_t)v4, v78, &qword_100050E88);
      swift_storeEnumTagMultiPayload();
      sub_10001F128();
      sub_100009134(&qword_100050E80, &qword_100050E88);
      sub_1000425AC();
      uint64_t v30 = (uint64_t)v4;
      uint64_t v31 = &qword_100050E88;
    }
    else
    {
      id v58 = v27;
      id v37 = v27;
      sub_10004298C();
      (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for Image.ResizingMode.stretch(_:), v15);
      double v38 = 0.0;
      sub_1000429EC();
      swift_release();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      sub_100042BBC();
      uint64_t v39 = sub_100042BCC();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v14, 0, 1, v39);
      sub_1000429DC();
      swift_release();
      sub_100009240((uint64_t)v14, &qword_1000506F0);
      uint64_t v40 = v64;
      sub_10002C1DC(v64);
      uint64_t v41 = v65;
      sub_100042B8C();
      char v42 = sub_100042B7C();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v67 + 8);
      uint64_t v44 = v68;
      v43(v41, v68);
      v43((char *)v40, v44);
      if (v42) {
        double v45 = 1.0;
      }
      else {
        double v45 = 0.0;
      }
      uint64_t v46 = v63;
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v23, v21, v63);
      *(double *)&v23[*(int *)(v59 + 36)] = v45;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v46);
      sub_10002C1DC(v40);
      sub_100042B8C();
      LOBYTE(v46) = sub_100042B7C();
      v43(v41, v44);
      v43((char *)v40, v44);
      if (v46) {
        double v38 = -0.1;
      }
      uint64_t v47 = v60;
      sub_1000091DC((uint64_t)v23, v60, &qword_100050700);
      *(double *)(v47 + *(int *)(v62 + 36)) = v38;
      sub_100009240((uint64_t)v23, &qword_100050700);
      uint64_t v48 = v70;
      sub_1000091DC(v47, v70, &qword_100050EA0);
      uint64_t v49 = v48 + *(int *)(v61 + 36);
      *(void *)uint64_t v49 = 0;
      *(_WORD *)(v49 + 8) = 257;
      sub_100009240(v47, &qword_100050EA0);
      uint64_t v50 = sub_100042B2C();
      uint64_t v52 = v51;
      sub_10001D118(v48, v72, &v81);
      char v53 = v81;
      uint64_t v54 = v83;
      long long v55 = v82;
      long long v72 = v82;
      uint64_t v56 = v73;
      *uint64_t v73 = v50;
      v56[1] = v52;
      v56[2] = (uint64_t)v53;
      *(_OWORD *)(v56 + 3) = v55;
      v56[5] = v54;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      swift_retain();
      sub_1000022D0(&qword_100050E78);
      sub_100009134(&qword_100050E70, &qword_100050E78);
      sub_1000205B4(&qword_100050B70, (void (*)(uint64_t))&type metadata accessor for BackgroundBlurView);
      uint64_t v57 = (uint64_t)v74;
      sub_1000425AC();
      sub_1000091DC(v57, v78, &qword_100050E68);
      swift_storeEnumTagMultiPayload();
      sub_10001F128();
      sub_100009134(&qword_100050E80, &qword_100050E88);
      sub_1000425AC();
      sub_10001F310(v58);
      sub_100009240(v57, &qword_100050E68);
      swift_release();
      swift_release();
      uint64_t v31 = &qword_100050EA8;
      uint64_t v30 = v48;
    }
    return sub_100009240(v30, v31);
  }
  else
  {
    uint64_t v32 = v66;
    sub_100041FDC();
    uint64_t v33 = v69;
    uint64_t v34 = v75;
    (*(void (**)(uint64_t *, char *, uint64_t))(v69 + 16))(v73, v32, v75);
    swift_storeEnumTagMultiPayload();
    sub_1000022D0(&qword_100050E78);
    sub_100009134(&qword_100050E70, &qword_100050E78);
    sub_1000205B4(&qword_100050B70, (void (*)(uint64_t))&type metadata accessor for BackgroundBlurView);
    uint64_t v35 = (uint64_t)v74;
    sub_1000425AC();
    sub_1000091DC(v35, v78, &qword_100050E68);
    swift_storeEnumTagMultiPayload();
    sub_10001F128();
    sub_100009134(&qword_100050E80, &qword_100050E88);
    sub_1000425AC();
    sub_100009240(v35, &qword_100050E68);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v32, v34);
  }
}

uint64_t sub_10001C8A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100042B9C();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v15 - v9;
  uint64_t v11 = *(void *)(a1 + *(int *)(type metadata accessor for LoadedView(0) + 32) + 8);
  if (v11)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1000429BC();
    sub_10002C1DC((uint64_t)v10);
    sub_100042B8C();
    char v12 = sub_100042B7C();
    uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
    v13(v8, v4);
    v13(v10, v4);
    if (v12) {
      uint64_t result = sub_1000425EC();
    }
    else {
      uint64_t result = sub_1000425FC();
    }
  }
  else
  {
    uint64_t result = 0;
  }
  *(void *)a2 = v11;
  *(_DWORD *)(a2 + 8) = result;
  return result;
}

uint64_t sub_10001CA2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v3 = sub_100041FAC();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  __chkstk_darwin(v3);
  uint64_t v56 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000022D0(&qword_100050F68);
  __chkstk_darwin(v5 - 8);
  long long v55 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000420CC();
  uint64_t v49 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000022D0(&qword_100050F70);
  __chkstk_darwin(v10 - 8);
  uint64_t v52 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000022D0(&qword_100050F78);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000420AC();
  uint64_t v53 = *(void *)(v15 - 8);
  uint64_t v54 = v15;
  __chkstk_darwin(v15);
  uint64_t v51 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000022D0(&qword_1000507D8);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (int *)type metadata accessor for AnnotationPin();
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v48 - v24;
  uint64_t v26 = (int *)type metadata accessor for LoadedView(0);
  uint64_t v27 = (void **)(a1 + v26[9]);
  uint64_t v28 = *v27;
  uint64_t v29 = *(void *)(a1 + v26[11]);
  BOOL v30 = *(void *)(a1 + v26[10]) > 1uLL;
  uint64_t v31 = (uint64_t *)&v23[v20[6]];
  *uint64_t v31 = swift_getKeyPath();
  sub_1000022D0(&qword_1000502F8);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = &v23[v20[7]];
  *(void *)uint64_t v32 = swift_getKeyPath();
  v32[8] = 0;
  uint64_t v33 = (uint64_t *)&v23[v20[8]];
  *uint64_t v33 = swift_getKeyPath();
  sub_1000022D0(&qword_100050300);
  swift_storeEnumTagMultiPayload();
  *(void *)uint64_t v23 = v28;
  *((void *)v23 + 1) = v29;
  v23[16] = v30;
  sub_1000204FC((uint64_t)v23, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for AnnotationPin);
  uint64_t v34 = type metadata accessor for LoadedView.Callout(0);
  sub_1000091DC((uint64_t)v27 + *(int *)(v34 + 20), (uint64_t)v19, &qword_1000507D8);
  uint64_t v35 = sub_10004269C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v14, 1, 1, v35);
  id v36 = v28;
  sub_1000426BC();
  sub_100009240((uint64_t)v14, &qword_100050F78);
  if (qword_1000502D0 != -1) {
    swift_once();
  }
  uint64_t v37 = v50;
  uint64_t v38 = sub_100003E70(v50, (uint64_t)qword_1000530F0);
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
  v39(v9, v38, v37);
  sub_10004297C();
  if (qword_1000502C8 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_100003E70(v37, (uint64_t)qword_1000530D8);
  v39(v9, v40, v37);
  sub_10004297C();
  uint64_t v41 = v55;
  sub_10004208C();
  uint64_t v42 = sub_10004209C();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 0, 1, v42);
  uint64_t v43 = v52;
  sub_10004206C();
  uint64_t v44 = sub_10004207C();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v43, 0, 1, v44);
  double v45 = v51;
  sub_10004205C();
  uint64_t v46 = v56;
  sub_100041F9C();
  sub_1000205B4(&qword_100050F80, (void (*)(uint64_t))type metadata accessor for AnnotationPin);
  sub_10004286C();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v46, v59);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v45, v54);
  sub_100009240((uint64_t)v19, &qword_1000507D8);
  return sub_1000205FC((uint64_t)v25);
}

uint64_t sub_10001D118@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double (**a3)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v5 = type metadata accessor for LoadedView(0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v16 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = sub_1000022D0(&qword_100050EA8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000091DC(a1, (uint64_t)v10, &qword_100050EA8);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  sub_100009178((uint64_t)v10, v12 + v11, &qword_100050EA8);
  sub_1000091DC(a1, (uint64_t)v10, &qword_100050EA8);
  sub_10001E92C(v17, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (v11 + v9 + *(unsigned __int8 *)(v16 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v14 = swift_allocObject();
  sub_100009178((uint64_t)v10, v14 + v11, &qword_100050EA8);
  uint64_t result = sub_1000204FC((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for LoadedView);
  *a3 = sub_10001F400;
  a3[1] = (double (*)@<D0>(uint64_t@<X8>))v12;
  a3[2] = (double (*)@<D0>(uint64_t@<X8>))sub_10001F994;
  a3[3] = (double (*)@<D0>(uint64_t@<X8>))v14;
  return result;
}

double sub_10001D338@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_1000421DC();
  sub_1000421DC();
  sub_100042B2C();
  sub_1000421CC();
  sub_1000091DC(a1, a2, &qword_100050EA8);
  uint64_t v4 = (_OWORD *)(a2 + *(int *)(sub_1000022D0(&qword_100050F58) + 36));
  *uint64_t v4 = v6;
  v4[1] = v7;
  double result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

uint64_t sub_10001D3DC@<X0>(char *a1@<X8>)
{
  BOOL v30 = a1;
  uint64_t v1 = sub_10004200C();
  uint64_t v28 = *(void *)(v1 - 8);
  uint64_t v2 = v28;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  long long v7 = (char *)&v27 - v6;
  uint64_t v8 = sub_100041FCC();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v9 = v29;
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v27 - v13;
  sub_100041FBC();
  uint64_t v27 = v7;
  sub_100041FFC();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v11, v14, v8);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v17 = v7;
  uint64_t v18 = v1;
  v16(v4, v17, v1);
  uint64_t v19 = v30;
  v15(v30, v11, v8);
  uint64_t v20 = sub_1000022D0(&qword_100050F60);
  uint64_t v21 = v4;
  uint64_t v22 = v4;
  uint64_t v23 = v18;
  v16(&v19[*(int *)(v20 + 48)], v22, v18);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v28 + 8);
  v24(v27, v18);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v29 + 8);
  v25(v14, v8);
  v24(v21, v23);
  return ((uint64_t (*)(char *, uint64_t))v25)(v11, v8);
}

CGFloat sub_10001D658(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = sub_10004226C();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v9);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v25 - v14;
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  CGFloat v16 = CGRectGetHeight(v34) * -0.8;
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  CGRectGetHeight(v35);
  uint64_t v17 = type metadata accessor for LoadedView(0);
  uint64_t v18 = v4 + *(int *)(v17 + 52);
  long long v19 = *(_OWORD *)(v18 + 16);
  v30[0] = *(_OWORD *)v18;
  v30[1] = v19;
  char v31 = *(unsigned char *)(v18 + 32);
  sub_100009178((uint64_t)v30, (uint64_t)v32, &qword_100050A88);
  uint64_t v27 = sub_10000E070;
  sub_100011954((uint64_t)v32, (void (*)(void, void, void, void, void))sub_10000E070);
  sub_10002C508();
  uint64_t v26 = sub_10000E150;
  sub_100011954((uint64_t)v30, (void (*)(void, void, void, void, void))sub_10000E150);
  v25[1] = v4 + *(int *)(v17 + 56);
  sub_10002C728((uint64_t)v15);
  uint64_t v20 = enum case for LayoutDirection.rightToLeft(_:);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v21(v13, enum case for LayoutDirection.rightToLeft(_:), v9);
  sub_10004225C();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v13, v9);
  v22(v15, v9);
  long long v23 = *(_OWORD *)(v18 + 16);
  v28[0] = *(_OWORD *)v18;
  v28[1] = v23;
  char v29 = *(unsigned char *)(v18 + 32);
  sub_100009178((uint64_t)v28, (uint64_t)v33, &qword_100050A88);
  sub_100011954((uint64_t)v33, (void (*)(void, void, void, void, void))v27);
  sub_10002C508();
  sub_100011954((uint64_t)v28, (void (*)(void, void, void, void, void))v26);
  sub_10002C728((uint64_t)v15);
  v21(v13, v20, v9);
  sub_10004225C();
  v22(v13, v9);
  v22(v15, v9);
  return v16;
}

uint64_t sub_10001D990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v57 = a4;
  uint64_t v58 = a3;
  uint64_t v52 = a1;
  uint64_t v5 = sub_10004244C();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  __chkstk_darwin(v5);
  uint64_t v54 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000022D0(&qword_100050EB8);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000022D0(&qword_100050EC0);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1000022D0(&qword_100050EC8);
  __chkstk_darwin(v49);
  CGFloat v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_1000022D0(&qword_100050ED0);
  uint64_t v51 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000022D0(&qword_100050ED8);
  uint64_t v20 = v19 - 8;
  __chkstk_darwin(v19);
  uint64_t v50 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100042B6C();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  sub_1000091DC(a2, (uint64_t)v10, &qword_100050EA8);
  uint64_t v26 = (int64x2_t *)&v10[*(int *)(v8 + 44)];
  *uint64_t v26 = vdupq_n_s64(0x3FF6666666666666uLL);
  v26[1].i64[0] = v23;
  v26[1].i64[1] = v25;
  uint64_t v27 = sub_100042B2C();
  uint64_t v29 = v28;
  uint64_t v30 = (uint64_t)&v14[*(int *)(v12 + 44)];
  sub_1000091DC((uint64_t)v10, v30, &qword_100050EB8);
  char v31 = (uint64_t *)(v30 + *(int *)(sub_1000022D0(&qword_100050EE0) + 36));
  *char v31 = v27;
  v31[1] = v29;
  sub_1000091DC(a2, (uint64_t)v14, &qword_100050EA8);
  sub_100009240((uint64_t)v10, &qword_100050EB8);
  sub_1000421DC();
  sub_1000421DC();
  sub_100042B2C();
  sub_1000421CC();
  sub_1000091DC((uint64_t)v14, (uint64_t)v16, &qword_100050EC0);
  uint64_t v32 = &v16[*(int *)(v49 + 36)];
  long long v33 = v60;
  *(_OWORD *)uint64_t v32 = v59;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v61;
  sub_100009240((uint64_t)v14, &qword_100050EC0);
  CGRect v35 = v54;
  uint64_t v34 = v55;
  uint64_t v36 = v56;
  (*(void (**)(char *, void, uint64_t))(v55 + 104))(v54, enum case for ColorRenderingMode.nonLinear(_:), v56);
  sub_10001FB78(&qword_100050EE8, &qword_100050EC8, (void (*)(void))sub_10001FA7C);
  sub_1000428BC();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  sub_100009240((uint64_t)v16, &qword_100050EC8);
  uint64_t v38 = (uint64_t)v50;
  uint64_t v37 = v51;
  uint64_t v39 = v53;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v50, v18, v53);
  uint64_t v40 = v38 + *(int *)(v20 + 44);
  *(void *)uint64_t v40 = 0x4034000000000000;
  *(unsigned char *)(v40 + 8) = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v39);
  uint64_t v41 = sub_100042B0C();
  uint64_t v43 = v42;
  uint64_t v44 = sub_1000022D0(&qword_100050F18);
  uint64_t v45 = v57;
  uint64_t v46 = (uint64_t *)(v57 + *(int *)(v44 + 36));
  uint64_t v47 = sub_1000022D0(&qword_100050F20);
  sub_10001DE80(v58, (uint64_t)v46 + *(int *)(v47 + 36));
  *uint64_t v46 = v41;
  v46[1] = v43;
  return sub_100009178(v38, v45, &qword_100050ED8);
}

uint64_t sub_10001DE80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v60 = a2;
  uint64_t v3 = type metadata accessor for LoadedView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v58 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000022D0(&qword_100050F28);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (void (**)(uint64_t@<X8>))((char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_1000022D0(&qword_100050F30);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000022D0(&qword_100050F38);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_1000022D0(&qword_100050F40) - 8;
  __chkstk_darwin(v59);
  uint64_t v55 = (uint64_t)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = v6;
  sub_10001E92C(a1, (uint64_t)v6);
  uint64_t v19 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v20 = (v19 + 16) & ~v19;
  uint64_t v57 = v20 + v5;
  uint64_t v58 = v20;
  uint64_t v56 = v19 | 7;
  uint64_t v21 = swift_allocObject();
  sub_1000204FC((uint64_t)v6, v21 + v20, type metadata accessor for LoadedView);
  *uint64_t v10 = sub_1000206D8;
  v10[1] = 0;
  v10[2] = (void (*)(uint64_t@<X8>))sub_10001EE74;
  v10[3] = (void (*)(uint64_t@<X8>))v21;
  v10[4] = sub_10001E590;
  v10[5] = 0;
  uint64_t v22 = (uint64_t *)((char *)v10 + *(int *)(v8 + 84));
  *uint64_t v22 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = (char *)v10 + *(int *)(v8 + 88);
  *(void *)uint64_t v23 = swift_getKeyPath();
  *((void *)v23 + 1) = 0;
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  v23[32] = 0;
  sub_1000091DC((uint64_t)v10, (uint64_t)v14, &qword_100050F28);
  *(void *)&v14[*(int *)(v12 + 44)] = 0;
  sub_100009240((uint64_t)v10, &qword_100050F28);
  uint64_t v24 = v53;
  uint64_t v25 = v53 + *(int *)(v4 + 60);
  long long v26 = *(_OWORD *)(v25 + 16);
  v66[0] = *(_OWORD *)v25;
  v66[1] = v26;
  char v67 = *(unsigned char *)(v25 + 32);
  sub_100009178((uint64_t)v66, (uint64_t)v68, &qword_100050A88);
  sub_100011954((uint64_t)v68, (void (*)(void, void, void, void, void))sub_10000E070);
  double v27 = sub_10002C508();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_100011954((uint64_t)v66, (void (*)(void, void, void, void, void))sub_10000E150);
  sub_10004266C();
  double v61 = v27;
  uint64_t v62 = v29;
  uint64_t v63 = v31;
  uint64_t v64 = v33;
  char v65 = 0;
  sub_10004260C();
  sub_100009178((uint64_t)v14, (uint64_t)v17, &qword_100050F30);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = v24 + *(int *)(v4 + 76);
  uint64_t v36 = v24;
  uint64_t v37 = *(void *)v35;
  uint64_t v38 = *(void *)(v35 + 8);
  LOBYTE(v22) = *(unsigned char *)(v35 + 16);
  sub_100018AE0(*(void *)v35, v38, (char)v22);
  uint64_t v39 = sub_10002C768(v37, v38, (char)v22);
  uint64_t v41 = v40;
  sub_100018ED0(v37, v38, (char)v22);
  uint64_t v42 = v55;
  sub_1000091DC((uint64_t)v17, v55, &qword_100050F38);
  uint64_t v43 = (uint64_t *)(v42 + *(int *)(v59 + 44));
  uint64_t *v43 = KeyPath;
  v43[1] = v39;
  v43[2] = v41;
  sub_100009240((uint64_t)v17, &qword_100050F38);
  uint64_t v44 = sub_100042B2C();
  uint64_t v46 = v45;
  uint64_t v47 = (uint64_t)v54;
  sub_10001E92C(v36, (uint64_t)v54);
  uint64_t v48 = swift_allocObject();
  sub_1000204FC(v47, v48 + v58, type metadata accessor for LoadedView);
  uint64_t v49 = v60;
  sub_1000091DC(v42, v60, &qword_100050F40);
  uint64_t v50 = (uint64_t (**)@<X0>(uint64_t *@<X0>, double (**)@<D0>(uint64_t@<X8>)@<X8>))(v49 + *(int *)(sub_1000022D0(&qword_100050F48) + 36));
  *uint64_t v50 = sub_10001FCFC;
  v50[1] = (uint64_t (*)@<X0>(uint64_t *@<X0>, double (**)@<D0>(uint64_t@<X8>)@<X8>))v48;
  v50[2] = (uint64_t (*)@<X0>(uint64_t *@<X0>, double (**)@<D0>(uint64_t@<X8>)@<X8>))v44;
  v50[3] = v46;
  return sub_100009240(v42, &qword_100050F40);
}

uint64_t sub_10001E3D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = type metadata accessor for LabelsModule(0);
  uint64_t v4 = (int *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[1];
  uint64_t v19 = *a1;
  int v18 = *((unsigned __int8 *)a1 + 16);
  uint64_t v9 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = a1[7];
  uint64_t v13 = type metadata accessor for LoadedView(0);
  sub_1000091DC((uint64_t)a1 + *(int *)(v13 + 24), (uint64_t)&v6[v4[8]], &qword_1000507D0);
  sub_1000091DC((uint64_t)a1 + *(int *)(v13 + 28), (uint64_t)&v6[v4[9]], &qword_1000507D8);
  *(void *)uint64_t v6 = v19;
  *((void *)v6 + 1) = v7;
  v6[16] = v18;
  *((void *)v6 + 3) = v9;
  *((void *)v6 + 4) = v8;
  *((void *)v6 + 5) = v10;
  *((void *)v6 + 6) = v11;
  *((void *)v6 + 7) = v12;
  uint64_t v14 = (uint64_t *)&v6[v4[10]];
  *uint64_t v14 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = (uint64_t *)&v6[v4[11]];
  *uint64_t v15 = swift_getKeyPath();
  sub_1000022D0(&qword_100050300);
  swift_storeEnumTagMultiPayload();
  sub_1000204FC((uint64_t)v6, v20, type metadata accessor for LabelsModule);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_100020564(v8, v10);
}

void sub_10001E590(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_10001E5A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, double (**a3)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v6 = type metadata accessor for LoadedView(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = *a1;
  sub_10001E92C(a2, (uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  sub_1000204FC((uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, type metadata accessor for LoadedView);
  *a3 = sub_1000201F0;
  a3[1] = (double (*)@<D0>(uint64_t@<X8>))v11;
  return swift_bridgeObjectRetain();
}

double sub_10001E6C0@<D0>(uint64_t a1@<X8>)
{
  sub_10004276C();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = 0x4028000000000000;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_10001E72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (uint64_t)&_swiftEmptyArrayStorage;
  *(void *)&v16.a = &_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6)
  {
    uint64_t v8 = *(void *)(sub_10004284C() - 8);
    uint64_t v9 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v11 = sub_100003EA8();
      sub_100020280(v11);
      v9 += v10;
      --v6;
    }
    while (v6);
    a1 = swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)&v16.a;
  }
  __chkstk_darwin(a1);
  v15[2] = a4;
  uint64_t v12 = sub_10001B4E0((void (*)(long long *__return_ptr, _OWORD *))sub_1000203C8, (uint64_t)v15, v5);
  swift_bridgeObjectRelease();
  v16.a = 1.0;
  v16.b = 0.0;
  v16.c = 0.0;
  v16.d = 1.0;
  v16.tx = 0.0;
  v16.ty = 0.0;
  v13._rawValue = v12;
  sub_10004273C(v13, &v16);
  return swift_bridgeObjectRelease();
}

void sub_10001E89C(double *a1@<X0>, uint64_t a2@<X8>)
{
  double v3 = *a1;
  CGFloat v4 = a1[1];
  CGFloat v5 = a1[2];
  CGFloat v6 = a1[3];
  double v7 = sub_10001D658(*a1, v4, v5, v6);
  *(double *)a2 = sub_1000203E8(v3, v4, v5, v6, v7, v8);
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v11;
}

uint64_t sub_10001E92C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LoadedView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E994@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LoadedView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10001C8A0(v4, a1);
}

uint64_t sub_10001EA08()
{
  uint64_t v1 = (int *)type metadata accessor for LoadedView(0);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v3 = v2 + v1[6];
  uint64_t v4 = sub_100041B5C();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  uint64_t v6 = v2 + v1[7];
  uint64_t v7 = sub_100041D4C();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = (id *)(v2 + v1[9]);

  uint64_t v11 = (char *)v10 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  if (!v9((uint64_t)v11, 1, v7)) {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  uint64_t v12 = *(void **)(v2 + v1[10]);
  if ((unint64_t)v12 >= 2) {

  }
  uint64_t v13 = v2 + v1[12];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  uint64_t v15 = v2 + v1[13];
  sub_10000E150(*(void *)v15, *(void *)(v15 + 8), *(void *)(v15 + 16), *(void *)(v15 + 24), *(unsigned char *)(v15 + 32));
  uint64_t v16 = v2 + v1[14];
  sub_1000022D0(&qword_100050D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_10004226C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }
  uint64_t v18 = v2 + v1[15];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  uint64_t v20 = v2 + v1[16];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = sub_100042B9C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  }
  else
  {
    swift_release();
  }
  sub_100018ED0(*(void *)(v2 + v1[17]), *(void *)(v2 + v1[17] + 8), *(unsigned char *)(v2 + v1[17] + 16));

  return swift_deallocObject();
}

uint64_t sub_10001EE7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LoadedView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10001CA2C(v4, a1);
}

uint64_t sub_10001EEF4()
{
  return sub_10004233C();
}

uint64_t sub_10001EF1C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001BB78(a1);
}

unint64_t sub_10001EF24()
{
  unint64_t result = qword_100050E30;
  if (!qword_100050E30)
  {
    sub_1000025C8(&qword_100050E18);
    sub_100009134(&qword_100050E38, &qword_100050E10);
    sub_100009134(&qword_100050E40, &qword_100050E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050E30);
  }
  return result;
}

unint64_t sub_10001EFE8()
{
  unint64_t result = qword_100050E48;
  if (!qword_100050E48)
  {
    sub_1000025C8(&qword_100050E28);
    sub_10001F088();
    sub_100009134((unint64_t *)&qword_100050B78, &qword_100050B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050E48);
  }
  return result;
}

unint64_t sub_10001F088()
{
  unint64_t result = qword_100050E50;
  if (!qword_100050E50)
  {
    sub_1000025C8(&qword_100050E58);
    sub_10001F128();
    sub_100009134(&qword_100050E80, &qword_100050E88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050E50);
  }
  return result;
}

unint64_t sub_10001F128()
{
  unint64_t result = qword_100050E60;
  if (!qword_100050E60)
  {
    sub_1000025C8(&qword_100050E68);
    sub_100009134(&qword_100050E70, &qword_100050E78);
    sub_1000205B4(&qword_100050B70, (void (*)(uint64_t))&type metadata accessor for BackgroundBlurView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050E60);
  }
  return result;
}

char *sub_10001F1F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1000022D0(&qword_100050F50);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100020404(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_10001F310(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

uint64_t sub_10001F320()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(sub_1000022D0(&qword_100050EA8) - 8) + 80);
  uint64_t v2 = v0 + ((v1 + 16) & ~v1);
  uint64_t v3 = sub_1000022D0(&qword_1000506F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_deallocObject();
}

double sub_10001F400@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_1000022D0(&qword_100050EA8) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10001D338(v4, a1);
}

uint64_t sub_10001F484()
{
  uint64_t v1 = *(void *)(sub_1000022D0(&qword_100050EA8) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = (int *)type metadata accessor for LoadedView(0);
  unint64_t v5 = (v2 + v3 + *(unsigned __int8 *)(*((void *)v4 - 1) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v4 - 1) + 80);
  uint64_t v6 = sub_1000022D0(&qword_1000506F8);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v2, v6);
  uint64_t v7 = v0 + v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v5 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = v7 + v4[6];
  uint64_t v9 = sub_100041B5C();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = v7 + v4[7];
  uint64_t v12 = sub_100041D4C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v14(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = (id *)(v7 + v4[9]);

  uint64_t v16 = (char *)v15 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  if (!v14((uint64_t)v16, 1, v12)) {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  uint64_t v17 = *(void **)(v7 + v4[10]);
  if ((unint64_t)v17 >= 2) {

  }
  uint64_t v18 = v7 + v4[12];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  uint64_t v20 = v7 + v4[13];
  sub_10000E150(*(void *)v20, *(void *)(v20 + 8), *(void *)(v20 + 16), *(void *)(v20 + 24), *(unsigned char *)(v20 + 32));
  uint64_t v21 = v7 + v4[14];
  sub_1000022D0(&qword_100050D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_10004226C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  }
  else
  {
    swift_release();
  }
  uint64_t v23 = v7 + v4[15];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  }
  else
  {
    swift_release();
  }
  uint64_t v25 = v7 + v4[16];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = sub_100042B9C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v25, v26);
  }
  else
  {
    swift_release();
  }
  sub_100018ED0(*(void *)(v7 + v4[17]), *(void *)(v7 + v4[17] + 8), *(unsigned char *)(v7 + v4[17] + 16));

  return swift_deallocObject();
}

uint64_t sub_10001F994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1000022D0(&qword_100050EA8) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for LoadedView(0) - 8);
  uint64_t v9 = v2 + ((v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));

  return sub_10001D990(a1, v2 + v6, v9, a2);
}

unint64_t sub_10001FA7C()
{
  unint64_t result = qword_100050EF0;
  if (!qword_100050EF0)
  {
    sub_1000025C8(&qword_100050EC0);
    sub_10001FB78(&qword_100050EF8, &qword_100050EA8, (void (*)(void))sub_10001FB48);
    sub_100009134(&qword_100050F10, &qword_100050EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050EF0);
  }
  return result;
}

uint64_t sub_10001FB48()
{
  return sub_10001FB78(&qword_100050F00, &qword_100050EA0, (void (*)(void))sub_10001FBF4);
}

uint64_t sub_10001FB78(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000025C8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001FBF4()
{
  unint64_t result = qword_100050F08;
  if (!qword_100050F08)
  {
    sub_1000025C8(&qword_100050700);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050F08);
  }
  return result;
}

uint64_t sub_10001FC8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LoadedView(0) - 8);
  return sub_10001E3D4((uint64_t *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))), a1);
}

uint64_t sub_10001FCFC@<X0>(uint64_t *a1@<X0>, double (**a2)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for LoadedView(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10001E5A0(a1, v6, a2);
}

uint64_t sub_10001FD7C()
{
  uint64_t v1 = (int *)type metadata accessor for LoadedView(0);
  unint64_t v2 = (*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v2 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = v3 + v1[6];
  uint64_t v5 = sub_100041B5C();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = v3 + v1[7];
  uint64_t v8 = sub_100041D4C();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = (id *)(v3 + v1[9]);

  uint64_t v12 = (char *)v11 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  if (!v10((uint64_t)v12, 1, v8)) {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  uint64_t v13 = *(void **)(v3 + v1[10]);
  if ((unint64_t)v13 >= 2) {

  }
  uint64_t v14 = v3 + v1[12];
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  uint64_t v16 = v3 + v1[13];
  sub_10000E150(*(void *)v16, *(void *)(v16 + 8), *(void *)(v16 + 16), *(void *)(v16 + 24), *(unsigned char *)(v16 + 32));
  uint64_t v17 = v3 + v1[14];
  sub_1000022D0(&qword_100050D30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_10004226C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  }
  else
  {
    swift_release();
  }
  uint64_t v19 = v3 + v1[15];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  }
  else
  {
    swift_release();
  }
  uint64_t v21 = v3 + v1[16];
  sub_1000022D0(&qword_100050300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_100042B9C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  }
  else
  {
    swift_release();
  }
  sub_100018ED0(*(void *)(v3 + v1[17]), *(void *)(v3 + v1[17] + 8), *(unsigned char *)(v3 + v1[17] + 16));

  return swift_deallocObject();
}

double sub_1000201F0@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for LoadedView(0);

  return sub_10001E6C0(a1);
}

uint64_t sub_100020274(uint64_t a1)
{
  return sub_10001E72C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100020280(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
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
  uint64_t v3 = sub_10001F1F8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = &v3[32 * v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[32 * v2] && (unint64_t)v9 < a1 + 32 + 32 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 32 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100042EAC();
  __break(1u);
  return result;
}

void sub_1000203C8(double *a1@<X0>, uint64_t a2@<X8>)
{
}

double sub_1000203E8(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

char *sub_100020404(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    int64_t v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_100042EAC();
  __break(1u);
  return result;
}

uint64_t sub_1000204FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100020564(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000205B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000205FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnnotationPin();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100020658()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1000206E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100042BDC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100020888(uint64_t a1, uint64_t a2)
{
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004217C();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  else
  {
    return swift_release();
  }
}

void *sub_10002099C(void *a1, void *a2, uint64_t a3)
{
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_10004217C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_100020AF4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100009240((uint64_t)a1, &qword_1000507E0);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100009240((uint64_t)a1 + v7, &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_100020C74(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100042BDC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  return a1;
}

char *sub_100020DDC(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100009240((uint64_t)a1, &qword_1000507E0);
    uint64_t v6 = sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100042BDC();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100009240((uint64_t)&a1[v8], &qword_1000502F8);
    uint64_t v11 = sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10004217C();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100020F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020F80);
}

uint64_t sub_100020F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000022D0(&qword_1000507E8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_1000022D0(&qword_1000505D0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100021080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100021094);
}

uint64_t sub_100021094(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000022D0(&qword_1000507E8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_1000022D0(&qword_1000505D0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for PlaceholderView()
{
  uint64_t result = qword_100050FE0;
  if (!qword_100050FE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000211EC()
{
  sub_100012C48(319, (unint64_t *)&qword_100050868, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_100012C48(319, &qword_100050648, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_1000212EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021308()
{
  uint64_t v0 = sub_100042BDC();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v11 - v5;
  sub_10002C4CC((uint64_t)v11 - v5);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for WidgetFamily.systemSmall(_:), v0);
  sub_100003DD8();
  sub_100042D5C();
  sub_100042D5C();
  uint64_t v8 = v11[0];
  uint64_t v7 = v11[1];
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v3, v0);
  v9(v6, v0);
  if (v7 == v8) {
    return 0x1000000000000012;
  }
  else {
    return 0x1000000000000024;
  }
}

uint64_t sub_1000214A4()
{
  uint64_t v0 = sub_100042BDC();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v11 - v5;
  sub_10002C4CC((uint64_t)v11 - v5);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for WidgetFamily.systemSmall(_:), v0);
  sub_100003DD8();
  sub_100042D5C();
  sub_100042D5C();
  uint64_t v8 = v11[0];
  uint64_t v7 = v11[1];
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v3, v0);
  v9(v6, v0);
  if (v7 == v8) {
    return 0x100000000000001ELL;
  }
  else {
    return 0x100000000000003CLL;
  }
}

uint64_t sub_100021640@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v29 = a1;
  uint64_t v30 = sub_10004262C();
  uint64_t v28 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  double v27 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10004229C();
  uint64_t v4 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PlaceholderView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000022D0(&qword_100051018);
  __chkstk_darwin(v11);
  uint64_t v13 = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall **)(UIImage, Swift::Double))((char *)&v25
                                                                                         - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = sub_1000022D0(&qword_100051020);
  uint64_t v14 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021E24(v2, (uint64_t)v10);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  sub_100022000((uint64_t)v10, v18 + v17);
  *uint64_t v13 = AnnotationPin.Icon.init(content:padding:);
  v13[1] = 0;
  v13[2] = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall *)(UIImage, Swift::Double))sub_100022064;
  v13[3] = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall *)(UIImage, Swift::Double))v18;
  v13[4] = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall *)(UIImage, Swift::Double))sub_100021C74;
  v13[5] = 0;
  uint64_t v19 = (uint64_t *)((char *)v13 + *(int *)(v11 + 76));
  *uint64_t v19 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = (char *)v13 + *(int *)(v11 + 80);
  *(void *)uint64_t v20 = swift_getKeyPath();
  *((void *)v20 + 1) = 0;
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  v20[32] = 0;
  sub_10004228C();
  uint64_t v21 = sub_100009134(&qword_100051028, &qword_100051018);
  sub_10004292C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v26);
  sub_100009240((uint64_t)v13, &qword_100051018);
  uint64_t v22 = v27;
  sub_10004261C();
  uint64_t v31 = v2;
  sub_100042B2C();
  sub_1000022D0(&qword_100051030);
  uint64_t v32 = v11;
  uint64_t v33 = v21;
  swift_getOpaqueTypeConformance2();
  sub_1000220E4();
  uint64_t v23 = v25;
  sub_1000428EC();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v23);
}

uint64_t sub_100021ACC@<X0>(uint64_t a1@<X8>)
{
  sub_100021308();
  uint64_t v2 = sub_1000424DC();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v23 = v7;
  sub_1000214A4();
  uint64_t v8 = sub_1000424DC();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13 & 1;
  uint64_t v15 = (int *)type metadata accessor for LabelsModule(0);
  uint64_t v16 = a1 + v15[6];
  uint64_t v17 = sub_100041B5C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = a1 + v15[7];
  uint64_t v19 = sub_100041D4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v23;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v12;
  uint64_t v20 = (uint64_t *)(a1 + v15[8]);
  uint64_t *v20 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = (uint64_t *)(a1 + v15[9]);
  *uint64_t v21 = swift_getKeyPath();
  sub_1000022D0(&qword_100050300);

  return swift_storeEnumTagMultiPayload();
}

void sub_100021C74(_WORD *a1@<X8>)
{
  *a1 = 256;
}

uint64_t sub_100021C80@<X0>(_WORD *a1@<X8>)
{
  uint64_t v2 = sub_1000022D0(&qword_100050B80);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  char v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_10004217C();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PlaceholderView();
  sub_10002BF94((uint64_t)v9);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *char v5 = KeyPath;
  uint64_t v11 = sub_1000022D0(&qword_100051030);
  sub_1000221B0((uint64_t)v5, (uint64_t)a1 + *(int *)(v11 + 36));
  *a1 = 256;
  sub_100009240((uint64_t)v5, &qword_100050B80);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100021E24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlaceholderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021E88()
{
  uint64_t v1 = type metadata accessor for PlaceholderView();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v3 = sub_100042BDC();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  unint64_t v4 = v0 + v2 + *(int *)(v1 + 20);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10004217C();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_100022000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlaceholderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022064@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for PlaceholderView();

  return sub_100021ACC(a1);
}

uint64_t sub_1000220DC@<X0>(_WORD *a1@<X8>)
{
  return sub_100021C80(a1);
}

unint64_t sub_1000220E4()
{
  unint64_t result = qword_100051038;
  if (!qword_100051038)
  {
    sub_1000025C8(&qword_100051030);
    sub_100009134(&qword_100051040, &qword_100051048);
    sub_100009134((unint64_t *)&qword_100050B78, &qword_100050B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051038);
  }
  return result;
}

uint64_t sub_1000221B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_100050B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022220()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000222F8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)a1 = *a2;
    a1 = v12 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000224D0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10004217C();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100022608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100042BDC();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_10004217C();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100022788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_100009240(a1 + v6, &qword_1000507E0);
    sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100042BDC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_100009240(a1 + v10, &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      void *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10002294C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100042BDC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100022AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_100009240(a1 + v7, &qword_1000507E0);
    uint64_t v10 = sub_1000022D0(&qword_1000507E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_100042BDC();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (const void *)(a2 + v12);
    sub_100009240(a1 + v12, &qword_1000502F8);
    uint64_t v15 = sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_10004217C();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100022C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100022CB0);
}

uint64_t sub_100022CB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000022D0(&qword_1000507E8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000022D0(&qword_1000505D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100022DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100022DF8);
}

uint64_t sub_100022DF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_1000022D0(&qword_1000507E8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000022D0(&qword_1000505D0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for TemplateInformationView()
{
  uint64_t result = qword_1000510A8;
  if (!qword_1000510A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100022F78()
{
  sub_100012C48(319, (unint64_t *)&qword_100050868, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_100012C48(319, &qword_100050648, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_100023084()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000230A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v17[1] = a1;
  v17[0] = sub_10004262C();
  uint64_t v3 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TemplateInformationView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_1000022D0(&qword_1000510E8);
  __chkstk_darwin(v9);
  uint64_t v11 = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall **)(UIImage, Swift::Double))((char *)v17
                                                                                         - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000239EC(v1, (uint64_t)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  sub_100023DA4((uint64_t)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, (uint64_t (*)(void))type metadata accessor for TemplateInformationView);
  void *v11 = AnnotationPin.Icon.init(content:padding:);
  v11[1] = 0;
  void v11[2] = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall *)(UIImage, Swift::Double))sub_100023BE8;
  _OWORD v11[3] = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall *)(UIImage, Swift::Double))v13;
  v11[4] = (FindMyWidgetPeople::AnnotationPin::Icon (__swiftcall *)(UIImage, Swift::Double))sub_100023594;
  v11[5] = 0;
  uint64_t v14 = (uint64_t *)((char *)v11 + *(int *)(v9 + 76));
  *uint64_t v14 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = (char *)v11 + *(int *)(v9 + 80);
  *(void *)uint64_t v15 = swift_getKeyPath();
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  v15[32] = 0;
  sub_10004261C();
  v17[4] = v2;
  sub_100042B2C();
  sub_1000022D0(&qword_1000510F0);
  sub_100009134(&qword_1000510F8, &qword_1000510E8);
  sub_100023C68();
  sub_1000428EC();
  (*(void (**)(char *, void))(v3 + 8))(v5, v17[0]);
  return sub_100009240((uint64_t)v11, &qword_1000510E8);
}

uint64_t sub_1000233C4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LabelsModule(0);
  uint64_t v5 = (int *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  char v10 = *((unsigned char *)a1 + 16);
  uint64_t v11 = a1[3];
  unint64_t v12 = &v7[v5[8]];
  uint64_t v13 = sub_100041B5C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = &v7[v5[9]];
  uint64_t v15 = sub_100041D4C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(void *)uint64_t v7 = v9;
  *((void *)v7 + 1) = v8;
  v7[16] = v10;
  *((void *)v7 + 3) = v11;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  uint64_t v16 = (uint64_t *)&v7[v5[10]];
  *uint64_t v16 = swift_getKeyPath();
  sub_1000022D0(&qword_1000507E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (uint64_t *)&v7[v5[11]];
  *uint64_t v17 = swift_getKeyPath();
  sub_1000022D0(&qword_100050300);
  swift_storeEnumTagMultiPayload();
  sub_100023DA4((uint64_t)v7, a2, type metadata accessor for LabelsModule);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_100023594(uint64_t a1@<X8>)
{
  *(void *)a1 = 1;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_1000235A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004217C();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000022D0(&qword_100050E88);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v8 = sub_100042B2C();
  v8[1] = v9;
  uint64_t v10 = sub_1000022D0(&qword_100050EB0);
  sub_10002376C((char *)v8 + *(int *)(v10 + 44));
  type metadata accessor for TemplateInformationView();
  sub_10002BF94((uint64_t)v5);
  uint64_t KeyPath = swift_getKeyPath();
  unint64_t v12 = (uint64_t *)(a1 + *(int *)(sub_1000022D0(&qword_1000510F0) + 36));
  uint64_t v13 = sub_1000022D0(&qword_100050B80);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v12 + *(int *)(v13 + 28), v5, v2);
  *unint64_t v12 = KeyPath;
  sub_100023D34((uint64_t)v8, a1);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_100009240((uint64_t)v8, &qword_100050E88);
}

uint64_t sub_10002376C@<X0>(char *a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_10004200C();
  uint64_t v28 = *(void *)(v1 - 8);
  uint64_t v2 = v28;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v27 - v6;
  uint64_t v8 = sub_100041FCC();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v9 = v29;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v27 - v13;
  sub_100041FBC();
  double v27 = v7;
  sub_100041FFC();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v11, v14, v8);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v17 = v7;
  uint64_t v18 = v1;
  v16(v4, v17, v1);
  uint64_t v19 = v30;
  v15(v30, v11, v8);
  uint64_t v20 = sub_1000022D0(&qword_100050F60);
  uint64_t v21 = v4;
  uint64_t v22 = v4;
  uint64_t v23 = v18;
  v16(&v19[*(int *)(v20 + 48)], v22, v18);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v28 + 8);
  v24(v27, v18);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v29 + 8);
  v25(v14, v8);
  v24(v21, v23);
  return ((uint64_t (*)(char *, uint64_t))v25)(v11, v8);
}

uint64_t sub_1000239EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TemplateInformationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023A50()
{
  uint64_t v1 = type metadata accessor for TemplateInformationView();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v2 + *(int *)(v1 + 20);
  sub_1000022D0(&qword_1000507E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100042BDC();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = v2 + *(int *)(v1 + 24);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_100023BE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TemplateInformationView() - 8);
  uint64_t v4 = (uint64_t *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_1000233C4(v4, a1);
}

uint64_t sub_100023C60@<X0>(uint64_t a1@<X8>)
{
  return sub_1000235A8(a1);
}

unint64_t sub_100023C68()
{
  unint64_t result = qword_100051100;
  if (!qword_100051100)
  {
    sub_1000025C8(&qword_1000510F0);
    sub_100009134(&qword_100050E80, &qword_100050E88);
    sub_100009134((unint64_t *)&qword_100050B78, &qword_100050B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051100);
  }
  return result;
}

uint64_t sub_100023D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_100050E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023DA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100023E0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100023EB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_10002D104(a1, a2, a3, &qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode);
}

uint64_t type metadata accessor for WidgetEntryViewContent.Model(uint64_t a1)
{
  return sub_10000D730(a1, (uint64_t *)&unk_1000513E0);
}

uint64_t type metadata accessor for WidgetEntryViewContent.Model.State(uint64_t a1)
{
  return sub_10000D730(a1, qword_100051350);
}

uint64_t type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(uint64_t a1)
{
  return sub_10000D730(a1, qword_1000512A8);
}

uint64_t type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(uint64_t a1)
{
  return sub_10000D730(a1, qword_100051200);
}

uint64_t sub_100023F50(uint64_t a1, uint64_t a2)
{
  return sub_10002D904(a1, a2, &qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode);
}

char *sub_100023F70(char *a1, char *a2, uint64_t a3)
{
  return sub_10002DDC4(a1, a2, a3, &qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode);
}

char *sub_100023F90(char *a1, char *a2, uint64_t a3)
{
  return sub_10002E574(a1, a2, a3, &qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode);
}

char *sub_100023FB0(char *a1, char *a2, uint64_t a3)
{
  return sub_10002EDEC(a1, a2, a3, &qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode);
}

char *sub_100023FD0(char *a1, char *a2, uint64_t a3)
{
  return sub_10002F440(a1, a2, a3, &qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode);
}

uint64_t sub_100023FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024004);
}

uint64_t sub_100024004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002FB30(a1, a2, a3, &qword_1000505D8);
}

uint64_t sub_100024010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024024);
}

uint64_t sub_100024024(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_10002FCA4(a1, a2, a3, a4, &qword_1000505D8);
}

uint64_t type metadata accessor for WidgetEntryView(uint64_t a1)
{
  return sub_10000D730(a1, qword_100051168);
}

void sub_100024050(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_100024070(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v8)
    {
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v8;
      *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
      *(void *)(a1 + 56) = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v10;
    }
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_100041B5C();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_1000022D0(&qword_1000507D0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v17 = a3[7];
    uint64_t v18 = (void *)(a1 + v17);
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_100041D4C();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48);
    uint64_t v41 = v21;
    if (v22(v19, 1, v20))
    {
      uint64_t v23 = sub_1000022D0(&qword_1000507D8);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v24 = a3[8];
    uint64_t v25 = a3[9];
    uint64_t v26 = (void *)(a1 + v24);
    double v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a1 + v25;
    uint64_t v30 = (uint64_t)a2 + v25;
    uint64_t v31 = *(void **)((char *)a2 + v25);
    *(void *)(a1 + v25) = v31;
    uint64_t v32 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v33 = (void *)(v29 + v32);
    uint64_t v34 = (const void *)(v30 + v32);
    swift_bridgeObjectRetain();
    id v35 = v31;
    if (v22(v34, 1, v20))
    {
      uint64_t v36 = sub_1000022D0(&qword_1000507D8);
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v41 + 16))(v33, v34, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v41 + 56))(v33, 0, 1, v20);
    }
    uint64_t v37 = a3[10];
    uint64_t v38 = *(void **)((char *)a2 + v37);
    *(void *)(a1 + v37) = v38;
    if ((unint64_t)v38 >= 2) {
      id v39 = v38;
    }
  }
  return a1;
}

void sub_100024450(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_100041B5C();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_100041D4C();
  uint64_t v9 = *(void *)(v8 - 8);
  long long v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = (id *)(a1 + a2[9]);

  uint64_t v12 = (char *)v11 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  if (!v10((uint64_t)v12, 1, v8)) {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  uint64_t v13 = *(void **)(a1 + a2[10]);
  if ((unint64_t)v13 >= 2)
  {
  }
}

uint64_t sub_100024670(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
  }
  uint64_t v9 = a3[6];
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_100041B5C();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_1000022D0(&qword_1000507D0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_100041D4C();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v20(v17, 1, v18))
  {
    uint64_t v21 = sub_1000022D0(&qword_1000507D8);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  id v39 = a3;
  uint64_t v24 = (void *)(a1 + v22);
  uint64_t v25 = (void *)(a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a1 + v23;
  uint64_t v28 = a2 + v23;
  uint64_t v29 = *(void **)(a2 + v23);
  *(void *)(a1 + v23) = v29;
  uint64_t v30 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  uint64_t v31 = (void *)(v27 + v30);
  uint64_t v32 = (const void *)(v28 + v30);
  swift_bridgeObjectRetain();
  id v33 = v29;
  if (v20(v32, 1, v18))
  {
    uint64_t v34 = sub_1000022D0(&qword_1000507D8);
    memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v31, v32, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v31, 0, 1, v18);
  }
  uint64_t v35 = v39[10];
  uint64_t v36 = *(void **)(a2 + v35);
  if ((unint64_t)v36 >= 2) {
    id v37 = v36;
  }
  *(void *)(a1 + v35) = v36;
  return a1;
}

uint64_t sub_1000249F8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (_OWORD *)(a1 + 32);
  uint64_t v7 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v8)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10000AAE0(a1 + 32);
      long long v9 = *(_OWORD *)(a2 + 48);
      *uint64_t v6 = *v7;
      *(_OWORD *)(a1 + 48) = v9;
    }
  }
  else if (v8)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 48);
    *uint64_t v6 = *v7;
    *(_OWORD *)(a1 + 48) = v10;
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_100041B5C();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_13:
    uint64_t v19 = sub_1000022D0(&qword_1000507D0);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_14:
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = sub_100041D4C();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v27)
  {
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
LABEL_19:
    uint64_t v28 = sub_1000022D0(&qword_1000507D8);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
LABEL_20:
  uint64_t v29 = a3[8];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[9];
  id v33 = (void **)(a1 + v32);
  uint64_t v34 = a2 + v32;
  uint64_t v35 = *(void **)(a2 + v32);
  uint64_t v36 = *v33;
  *id v33 = v35;
  id v37 = v35;

  uint64_t v38 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  id v39 = (char *)v33 + v38;
  uint64_t v40 = (void *)(v34 + v38);
  LODWORD(v36) = v25(v39, 1, v23);
  int v41 = v25(v40, 1, v23);
  if (v36)
  {
    if (!v41)
    {
      (*(void (**)(char *, void *, uint64_t))(v24 + 16))(v39, v40, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v39, 0, 1, v23);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v39, v23);
LABEL_25:
    uint64_t v42 = sub_1000022D0(&qword_1000507D8);
    memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, void *, uint64_t))(v24 + 24))(v39, v40, v23);
LABEL_26:
  uint64_t v43 = a3[10];
  uint64_t v44 = *(void **)(a1 + v43);
  uint64_t v45 = *(void **)(a2 + v43);
  if ((unint64_t)v44 >= 2)
  {
    if ((unint64_t)v45 >= 2)
    {
      *(void *)(a1 + v43) = v45;
      id v47 = v45;

      return a1;
    }

    uint64_t v45 = *(void **)(a2 + v43);
    goto LABEL_31;
  }
  if ((unint64_t)v45 < 2)
  {
LABEL_31:
    *(void *)(a1 + v43) = v45;
    return a1;
  }
  *(void *)(a1 + v43) = v45;
  id v46 = v45;
  return a1;
}

_OWORD *sub_100024F58(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[6];
  long long v9 = (char *)a1 + v8;
  long long v10 = (char *)a2 + v8;
  uint64_t v11 = sub_100041B5C();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_1000022D0(&qword_1000507D0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_100041D4C();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = sub_1000022D0(&qword_1000507D8);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  uint64_t v24 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  uint64_t v25 = &v22[v24];
  int v26 = &v23[v24];
  if (v19(v26, 1, v17))
  {
    uint64_t v27 = sub_1000022D0(&qword_1000507D8);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v26, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v25, 0, 1, v17);
  }
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

uint64_t sub_100025244(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = *(void *)(a2 + 40);
    if (v7)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v7;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_10000AAE0(a1 + 32);
  }
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
LABEL_6:
  uint64_t v9 = a3[6];
  long long v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_100041B5C();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_11:
    uint64_t v17 = sub_1000022D0(&qword_1000507D0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_12:
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = sub_100041D4C();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
LABEL_17:
    uint64_t v26 = sub_1000022D0(&qword_1000507D8);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v19, v20, v21);
LABEL_18:
  uint64_t v27 = a3[8];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[9];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = *(void *)(a2 + v32);

  uint64_t v36 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
  id v37 = (void *)(v33 + v36);
  uint64_t v38 = (void *)(v34 + v36);
  int v39 = v23(v37, 1, v21);
  int v40 = v23(v38, 1, v21);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v37, v38, v21);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v37, 0, 1, v21);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(v37, v21);
LABEL_23:
    uint64_t v41 = sub_1000022D0(&qword_1000507D8);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v37, v38, v21);
LABEL_24:
  uint64_t v42 = a3[10];
  uint64_t v43 = *(void **)(a1 + v42);
  unint64_t v44 = *(void *)(a2 + v42);
  if ((unint64_t)v43 >= 2)
  {
    if (v44 >= 2)
    {
      *(void *)(a1 + v42) = v44;
    }
    else
    {

      *(void *)(a1 + v42) = *(void *)(a2 + v42);
    }
  }
  else
  {
    *(void *)(a1 + v42) = v44;
  }
  return a1;
}

uint64_t sub_100025714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100025728);
}

uint64_t sub_100025728(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_1000022D0(&qword_1000507D0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507D8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_9;
  }
  uint64_t v14 = type metadata accessor for LoadedView.Callout(0);
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + a3[9];

  return v15(v17, a2, v16);
}

uint64_t sub_1000258A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000258BC);
}

uint64_t sub_1000258BC(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_1000022D0(&qword_1000507D0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = sub_1000022D0(&qword_1000507D8);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_7;
  }
  uint64_t v14 = type metadata accessor for LoadedView.Callout(0);
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = v5 + a4[9];

  return v15(v17, a2, a2, v16);
}

void sub_100025A3C()
{
  sub_10002FF90(319, &qword_100050858, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F)
  {
    sub_10002FF90(319, &qword_100050860, (uint64_t (*)(uint64_t))&type metadata accessor for Badge, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F)
    {
      type metadata accessor for LoadedView.Callout(319);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_100025BC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000420EC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *((void *)v10 + 1);
    *(void *)uint64_t v9 = *(void *)v10;
    *((void *)v9 + 1) = v11;
    v9[16] = v10[16];
    *((void *)v9 + 3) = *((void *)v10 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100025CB4(uint64_t a1)
{
  uint64_t v2 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100025D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100025DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100025E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_100025F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000420EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100025FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100025FCC);
}

uint64_t sub_100025FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000420EC();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100026090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000260A4);
}

uint64_t sub_1000260A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000420EC();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100026164()
{
  uint64_t result = sub_1000420EC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1000261F8(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_1000420EC();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
        uint64_t v9 = (char *)a1 + v8;
        unint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = *((void *)v10 + 1);
        *(void *)uint64_t v9 = *(void *)v10;
        *((void *)v9 + 1) = v11;
        v9[16] = v10[16];
        *((void *)v9 + 3) = *((void *)v10 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        uint64_t v15 = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v15)
        {
          a1[4] = a2[4];
          a1[5] = v15;
          *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v19 = *((_OWORD *)a2 + 3);
          *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)a1 + 3) = v19;
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v16 = a2[1];
        *a1 = *a2;
        a1[1] = v16;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        uint64_t v18 = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v18)
        {
          a1[4] = a2[4];
          a1[5] = v18;
          *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v20 = *((_OWORD *)a2 + 3);
          *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)a1 + 3) = v20;
        }
        uint64_t v21 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
        uint64_t v22 = v21[6];
        uint64_t v23 = (char *)a1 + v22;
        int v24 = (char *)a2 + v22;
        uint64_t v25 = sub_100041B5C();
        uint64_t v26 = *(void *)(v25 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
        {
          uint64_t v27 = sub_1000022D0(&qword_1000507D0);
          memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
        }
        uint64_t v28 = v21[7];
        uint64_t v29 = (char *)a1 + v28;
        uint64_t v30 = (char *)a2 + v28;
        uint64_t v31 = sub_100041D4C();
        uint64_t v32 = *(void *)(v31 - 8);
        uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
        uint64_t v51 = v32;
        if (v33(v30, 1, v31))
        {
          uint64_t v34 = sub_1000022D0(&qword_1000507D8);
          memcpy(v29, v30, *(void *)(*(void *)(v34 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
        }
        uint64_t v35 = v21[8];
        uint64_t v36 = (void *)((char *)a1 + v35);
        id v37 = (void *)((char *)a2 + v35);
        uint64_t v38 = v37[1];
        *uint64_t v36 = *v37;
        v36[1] = v38;
        uint64_t v52 = v21;
        uint64_t v39 = v21[9];
        int v40 = (char *)a1 + v39;
        uint64_t v41 = (char *)a2 + v39;
        uint64_t v42 = *(void **)((char *)a2 + v39);
        *(void *)((char *)a1 + v39) = v42;
        uint64_t v43 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
        unint64_t v44 = &v40[v43];
        uint64_t v45 = &v41[v43];
        swift_bridgeObjectRetain();
        id v46 = v42;
        if (v33(v45, 1, v31))
        {
          uint64_t v47 = sub_1000022D0(&qword_1000507D8);
          memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v44, v45, v31);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56))(v44, 0, 1, v31);
        }
        uint64_t v48 = v52[10];
        uint64_t v49 = *(void **)((char *)a2 + v48);
        if ((unint64_t)v49 >= 2) {
          id v50 = v49;
        }
        *(void *)((char *)a1 + v48) = v49;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void sub_100026780(uint64_t a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v2 = sub_1000420EC();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
      type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0);
      goto LABEL_4;
    case 1u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(a1 + 40)) {
        goto LABEL_4;
      }
      return;
    case 2u:
LABEL_4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 3u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(a1 + 40))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v3 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v4 = a1 + v3[6];
      uint64_t v5 = sub_100041B5C();
      uint64_t v6 = *(void *)(v5 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
      }
      uint64_t v7 = a1 + v3[7];
      uint64_t v8 = sub_100041D4C();
      uint64_t v9 = *(void *)(v8 - 8);
      unint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      if (!v10(v7, 1, v8)) {
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
      }
      swift_bridgeObjectRelease();
      uint64_t v11 = (id *)(a1 + v3[9]);

      uint64_t v12 = (char *)v11 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      if (!v10((uint64_t)v12, 1, v8)) {
        (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      }
      uint64_t v13 = *(void **)(a1 + v3[10]);
      if ((unint64_t)v13 >= 2)
      {
      }
      break;
    default:
      return;
  }
}

void *sub_100026A74(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = sub_1000420EC();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = *((void *)v9 + 1);
      *(void *)uint64_t v8 = *(void *)v9;
      *((void *)v8 + 1) = v10;
      v8[16] = v9[16];
      *((void *)v8 + 3) = *((void *)v9 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_24;
    case 1u:
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
      a1[3] = a2[3];
      uint64_t v12 = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v12)
      {
        a1[4] = a2[4];
        a1[5] = v12;
        *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
        a1[7] = a2[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v16 = *((_OWORD *)a2 + 3);
        *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
        *((_OWORD *)a1 + 3) = v16;
      }
      goto LABEL_24;
    case 2u:
      uint64_t v13 = a2[1];
      *a1 = *a2;
      a1[1] = v13;
      *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_24;
    case 3u:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
      a1[3] = a2[3];
      uint64_t v15 = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v15)
      {
        a1[4] = a2[4];
        a1[5] = v15;
        *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
        a1[7] = a2[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v17 = *((_OWORD *)a2 + 3);
        *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
        *((_OWORD *)a1 + 3) = v17;
      }
      uint64_t v18 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v19 = v18[6];
      long long v20 = (char *)a1 + v19;
      uint64_t v21 = (char *)a2 + v19;
      uint64_t v22 = sub_100041B5C();
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
      {
        uint64_t v24 = sub_1000022D0(&qword_1000507D0);
        memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      uint64_t v25 = v18[7];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      uint64_t v28 = sub_100041D4C();
      uint64_t v29 = *(void *)(v28 - 8);
      uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
      uint64_t v49 = v29;
      if (v30(v27, 1, v28))
      {
        uint64_t v31 = sub_1000022D0(&qword_1000507D8);
        memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      }
      uint64_t v32 = v18[8];
      uint64_t v33 = (void *)((char *)a1 + v32);
      uint64_t v34 = (void *)((char *)a2 + v32);
      uint64_t v35 = v34[1];
      *uint64_t v33 = *v34;
      v33[1] = v35;
      id v50 = v18;
      uint64_t v36 = v18[9];
      id v37 = (char *)a1 + v36;
      uint64_t v38 = (char *)a2 + v36;
      uint64_t v39 = *(void **)((char *)a2 + v36);
      *(void *)((char *)a1 + v36) = v39;
      uint64_t v40 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      uint64_t v41 = &v37[v40];
      uint64_t v42 = &v38[v40];
      swift_bridgeObjectRetain();
      id v43 = v39;
      if (v30(v42, 1, v28))
      {
        uint64_t v44 = sub_1000022D0(&qword_1000507D8);
        memcpy(v41, v42, *(void *)(*(void *)(v44 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v41, v42, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v41, 0, 1, v28);
      }
      uint64_t v45 = v50[10];
      id v46 = *(void **)((char *)a2 + v45);
      if ((unint64_t)v46 >= 2) {
        id v47 = v46;
      }
      *(void *)((char *)a1 + v45) = v46;
LABEL_24:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_100026FAC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10002CB30((uint64_t)a1, type metadata accessor for WidgetEntryViewContent.Model.State);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_1000420EC();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        *(void *)uint64_t v8 = *(void *)v9;
        *((void *)v8 + 1) = *((void *)v9 + 1);
        v8[16] = v9[16];
        *((void *)v8 + 3) = *((void *)v9 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_24;
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        uint64_t v10 = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v10)
        {
          a1[4] = a2[4];
          a1[5] = a2[5];
          *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v42 = *((_OWORD *)a2 + 3);
          *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)a1 + 3) = v42;
        }
        goto LABEL_24;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_24;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        a1[3] = a2[3];
        uint64_t v11 = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v11)
        {
          a1[4] = a2[4];
          a1[5] = a2[5];
          *((unsigned char *)a1 + 48) = *((unsigned char *)a2 + 48);
          a1[7] = a2[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v12 = *((_OWORD *)a2 + 3);
          *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)a1 + 3) = v12;
        }
        uint64_t v13 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
        uint64_t v14 = v13[6];
        uint64_t v15 = (char *)a1 + v14;
        long long v16 = (char *)a2 + v14;
        uint64_t v17 = sub_100041B5C();
        uint64_t v18 = *(void *)(v17 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
        {
          uint64_t v19 = sub_1000022D0(&qword_1000507D0);
          memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
        }
        uint64_t v20 = v13[7];
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (char *)a2 + v20;
        uint64_t v23 = sub_100041D4C();
        uint64_t v24 = *(void *)(v23 - 8);
        uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
        if (v25(v22, 1, v23))
        {
          uint64_t v26 = sub_1000022D0(&qword_1000507D8);
          memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
        }
        uint64_t v27 = v13[8];
        uint64_t v28 = (void *)((char *)a1 + v27);
        uint64_t v29 = (void *)((char *)a2 + v27);
        *uint64_t v28 = *v29;
        v28[1] = v29[1];
        uint64_t v44 = v13;
        uint64_t v30 = v13[9];
        uint64_t v31 = (char *)a1 + v30;
        uint64_t v32 = (char *)a2 + v30;
        uint64_t v33 = *(void **)((char *)a2 + v30);
        *(void *)((char *)a1 + v30) = v33;
        uint64_t v34 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
        uint64_t v35 = &v31[v34];
        uint64_t v36 = &v32[v34];
        swift_bridgeObjectRetain();
        id v37 = v33;
        if (v25(v36, 1, v23))
        {
          uint64_t v38 = sub_1000022D0(&qword_1000507D8);
          memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v35, v36, v23);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v35, 0, 1, v23);
        }
        uint64_t v39 = v44[10];
        uint64_t v40 = *(void **)((char *)a2 + v39);
        if ((unint64_t)v40 >= 2) {
          id v41 = v40;
        }
        *(void *)((char *)a1 + v39) = v40;
LABEL_24:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_100027538(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    long long v12 = a2[1];
    *a1 = *a2;
    a1[1] = v12;
    long long v13 = a2[3];
    a1[2] = a2[2];
    a1[3] = v13;
    uint64_t v14 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
    uint64_t v15 = v14[6];
    long long v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_100041B5C();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = sub_1000022D0(&qword_1000507D0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    uint64_t v21 = v14[7];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = sub_100041D4C();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    if (v26(v23, 1, v24))
    {
      uint64_t v27 = sub_1000022D0(&qword_1000507D8);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    *(_OWORD *)((char *)a1 + v14[8]) = *(_OWORD *)((char *)a2 + v14[8]);
    uint64_t v28 = v14[9];
    uint64_t v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
    uint64_t v31 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v32 = &v29[v31];
    uint64_t v33 = &v30[v31];
    if (v26(v33, 1, v24))
    {
      uint64_t v34 = sub_1000022D0(&qword_1000507D8);
      memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v32, v33, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v32, 0, 1, v24);
    }
    *(void *)((char *)a1 + v14[10]) = *(void *)((char *)a2 + v14[10]);
    goto LABEL_15;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_1000420EC();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
    uint64_t v9 = (_OWORD *)((char *)a1 + v8);
    uint64_t v10 = (_OWORD *)((char *)a2 + v8);
    long long v11 = v10[1];
    _OWORD *v9 = *v10;
    v9[1] = v11;
LABEL_15:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

_OWORD *sub_1000278E8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10002CB30((uint64_t)a1, type metadata accessor for WidgetEntryViewContent.Model.State);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      long long v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      long long v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      uint64_t v14 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v15 = v14[6];
      long long v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_100041B5C();
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
      {
        uint64_t v20 = sub_1000022D0(&qword_1000507D0);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      }
      uint64_t v21 = v14[7];
      uint64_t v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      uint64_t v24 = sub_100041D4C();
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
      if (v26(v23, 1, v24))
      {
        uint64_t v27 = sub_1000022D0(&qword_1000507D8);
        memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      }
      *(_OWORD *)((char *)a1 + v14[8]) = *(_OWORD *)((char *)a2 + v14[8]);
      uint64_t v28 = v14[9];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
      uint64_t v31 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      uint64_t v32 = &v29[v31];
      uint64_t v33 = &v30[v31];
      if (v26(v33, 1, v24))
      {
        uint64_t v34 = sub_1000022D0(&qword_1000507D8);
        memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v32, v33, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v32, 0, 1, v24);
      }
      *(void *)((char *)a1 + v14[10]) = *(void *)((char *)a2 + v14[10]);
      goto LABEL_16;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_1000420EC();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
      uint64_t v9 = (_OWORD *)((char *)a1 + v8);
      uint64_t v10 = (_OWORD *)((char *)a2 + v8);
      long long v11 = v10[1];
      _OWORD *v9 = *v10;
      v9[1] = v11;
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100027CBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100027CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100027D10()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100027D20()
{
  uint64_t result = type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_100027DF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100041ECC();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000022D0(&qword_100051108);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = *(int *)(a3 + 20);
    long long v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v16 = sub_1000420EC();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
        uint64_t v17 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
        uint64_t v18 = &v13[v17];
        uint64_t v19 = &v14[v17];
        uint64_t v20 = *((void *)v19 + 1);
        *(void *)uint64_t v18 = *(void *)v19;
        *((void *)v18 + 1) = v20;
        v18[16] = v19[16];
        *((void *)v18 + 3) = *((void *)v19 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v21 = *((void *)v14 + 1);
        *(void *)long long v13 = *(void *)v14;
        *((void *)v13 + 1) = v21;
        v13[16] = v14[16];
        *((void *)v13 + 3) = *((void *)v14 + 3);
        uint64_t v22 = *((void *)v14 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v22)
        {
          *((void *)v13 + 4) = *((void *)v14 + 4);
          *((void *)v13 + 5) = v22;
          v13[48] = v14[48];
          *((void *)v13 + 7) = *((void *)v14 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v26 = *((_OWORD *)v14 + 3);
          *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
          *((_OWORD *)v13 + 3) = v26;
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v23 = *((void *)v14 + 1);
        *(void *)long long v13 = *(void *)v14;
        *((void *)v13 + 1) = v23;
        v13[16] = v14[16];
        *((void *)v13 + 3) = *((void *)v14 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v24 = *((void *)v14 + 1);
        *(void *)long long v13 = *(void *)v14;
        *((void *)v13 + 1) = v24;
        v13[16] = v14[16];
        *((void *)v13 + 3) = *((void *)v14 + 3);
        uint64_t v25 = *((void *)v14 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v25)
        {
          *((void *)v13 + 4) = *((void *)v14 + 4);
          *((void *)v13 + 5) = v25;
          v13[48] = v14[48];
          *((void *)v13 + 7) = *((void *)v14 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v27 = *((_OWORD *)v14 + 3);
          *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
          *((_OWORD *)v13 + 3) = v27;
        }
        uint64_t v28 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
        uint64_t v29 = v28[6];
        uint64_t v30 = &v13[v29];
        uint64_t v31 = &v14[v29];
        uint64_t v32 = sub_100041B5C();
        uint64_t v33 = *(void *)(v32 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
        {
          uint64_t v34 = sub_1000022D0(&qword_1000507D0);
          memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
        }
        uint64_t v35 = v28[7];
        uint64_t v36 = &v13[v35];
        id v37 = &v14[v35];
        uint64_t v38 = sub_100041D4C();
        uint64_t v39 = *(void *)(v38 - 8);
        uint64_t v58 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
        uint64_t v57 = v39;
        if (v58(v37, 1, v38))
        {
          uint64_t v40 = sub_1000022D0(&qword_1000507D8);
          memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
        }
        uint64_t v41 = v28[8];
        long long v42 = &v13[v41];
        id v43 = &v14[v41];
        uint64_t v44 = *((void *)v43 + 1);
        *(void *)long long v42 = *(void *)v43;
        *((void *)v42 + 1) = v44;
        uint64_t v59 = v28;
        uint64_t v45 = v28[9];
        id v46 = &v13[v45];
        id v47 = &v14[v45];
        uint64_t v48 = *(void **)&v14[v45];
        *(void *)&v13[v45] = v48;
        uint64_t v49 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
        id v50 = &v46[v49];
        uint64_t v51 = &v47[v49];
        swift_bridgeObjectRetain();
        id v52 = v48;
        if (v58(v51, 1, v38))
        {
          uint64_t v53 = sub_1000022D0(&qword_1000507D8);
          memcpy(v50, v51, *(void *)(*(void *)(v53 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v50, v51, v38);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v50, 0, 1, v38);
        }
        uint64_t v54 = v59[10];
        uint64_t v55 = *(void **)&v14[v54];
        if ((unint64_t)v55 >= 2) {
          id v56 = v55;
        }
        *(void *)&v13[v54] = v55;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
        break;
    }
  }
  return a1;
}

void sub_10002848C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041ECC();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  type metadata accessor for WidgetEntryViewContent.Model.State(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v7 = sub_1000420EC();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0);
      goto LABEL_6;
    case 1u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v6 + 40)) {
        goto LABEL_6;
      }
      return;
    case 2u:
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 3u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v6 + 40))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v8 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v9 = v6 + v8[6];
      uint64_t v10 = sub_100041B5C();
      uint64_t v11 = *(void *)(v10 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
      }
      uint64_t v12 = v6 + v8[7];
      uint64_t v13 = sub_100041D4C();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      if (!v15(v12, 1, v13)) {
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
      }
      swift_bridgeObjectRelease();
      uint64_t v16 = (id *)(v6 + v8[9]);

      uint64_t v17 = (char *)v16 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      if (!v15((uint64_t)v17, 1, v13)) {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
      }
      uint64_t v18 = *(void **)(v6 + v8[10]);
      if ((unint64_t)v18 >= 2)
      {
      }
      break;
    default:
      return;
  }
}

char *sub_100028824(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100041ECC();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v13 = sub_1000420EC();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
      uint64_t v14 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
      uint64_t v15 = &v10[v14];
      uint64_t v16 = &v11[v14];
      uint64_t v17 = *((void *)v16 + 1);
      *(void *)uint64_t v15 = *(void *)v16;
      *((void *)v15 + 1) = v17;
      v15[16] = v16[16];
      *((void *)v15 + 3) = *((void *)v16 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_27;
    case 1u:
      uint64_t v18 = *((void *)v11 + 1);
      *(void *)uint64_t v10 = *(void *)v11;
      *((void *)v10 + 1) = v18;
      v10[16] = v11[16];
      *((void *)v10 + 3) = *((void *)v11 + 3);
      uint64_t v19 = *((void *)v11 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v19)
      {
        *((void *)v10 + 4) = *((void *)v11 + 4);
        *((void *)v10 + 5) = v19;
        v10[48] = v11[48];
        *((void *)v10 + 7) = *((void *)v11 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v23 = *((_OWORD *)v11 + 3);
        *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
        *((_OWORD *)v10 + 3) = v23;
      }
      goto LABEL_27;
    case 2u:
      uint64_t v20 = *((void *)v11 + 1);
      *(void *)uint64_t v10 = *(void *)v11;
      *((void *)v10 + 1) = v20;
      v10[16] = v11[16];
      *((void *)v10 + 3) = *((void *)v11 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_27;
    case 3u:
      uint64_t v21 = *((void *)v11 + 1);
      *(void *)uint64_t v10 = *(void *)v11;
      *((void *)v10 + 1) = v21;
      v10[16] = v11[16];
      *((void *)v10 + 3) = *((void *)v11 + 3);
      uint64_t v22 = *((void *)v11 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v22)
      {
        *((void *)v10 + 4) = *((void *)v11 + 4);
        *((void *)v10 + 5) = v22;
        v10[48] = v11[48];
        *((void *)v10 + 7) = *((void *)v11 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v24 = *((_OWORD *)v11 + 3);
        *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
        *((_OWORD *)v10 + 3) = v24;
      }
      uint64_t v25 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v26 = v25[6];
      long long v27 = &v10[v26];
      uint64_t v28 = &v11[v26];
      uint64_t v29 = sub_100041B5C();
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
      {
        uint64_t v31 = sub_1000022D0(&qword_1000507D0);
        memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      }
      uint64_t v32 = v25[7];
      uint64_t v33 = &v10[v32];
      uint64_t v34 = &v11[v32];
      uint64_t v35 = sub_100041D4C();
      uint64_t v36 = *(void *)(v35 - 8);
      id v56 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
      uint64_t v55 = v36;
      if (v56(v34, 1, v35))
      {
        uint64_t v37 = sub_1000022D0(&qword_1000507D8);
        memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      }
      uint64_t v38 = v25[8];
      uint64_t v39 = &v10[v38];
      uint64_t v40 = &v11[v38];
      uint64_t v41 = *((void *)v40 + 1);
      *(void *)uint64_t v39 = *(void *)v40;
      *((void *)v39 + 1) = v41;
      uint64_t v57 = v25;
      uint64_t v42 = v25[9];
      id v43 = &v10[v42];
      uint64_t v44 = &v11[v42];
      uint64_t v45 = *(void **)&v11[v42];
      *(void *)&v10[v42] = v45;
      uint64_t v46 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      id v47 = &v43[v46];
      uint64_t v48 = &v44[v46];
      swift_bridgeObjectRetain();
      id v49 = v45;
      if (v56(v48, 1, v35))
      {
        uint64_t v50 = sub_1000022D0(&qword_1000507D8);
        memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v47, v48, v35);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v47, 0, 1, v35);
      }
      uint64_t v51 = v57[10];
      id v52 = *(void **)&v11[v51];
      if ((unint64_t)v52 >= 2) {
        id v53 = v52;
      }
      *(void *)&v10[v51] = v52;
LABEL_27:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
      break;
  }
  return a1;
}

char *sub_100028E5C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100041ECC();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v11 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_8;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
  if (a1 == a2) {
    return a1;
  }
LABEL_8:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  sub_10002CB30((uint64_t)&a1[v12], type metadata accessor for WidgetEntryViewContent.Model.State);
  uint64_t v15 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v16 = sub_1000420EC();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
      uint64_t v17 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
      uint64_t v18 = &v13[v17];
      uint64_t v19 = &v14[v17];
      *(void *)uint64_t v18 = *(void *)v19;
      *((void *)v18 + 1) = *((void *)v19 + 1);
      v18[16] = v19[16];
      *((void *)v18 + 3) = *((void *)v19 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_32;
    case 1u:
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      v13[16] = v14[16];
      *((void *)v13 + 3) = *((void *)v14 + 3);
      uint64_t v20 = *((void *)v14 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v20)
      {
        *((void *)v13 + 4) = *((void *)v14 + 4);
        *((void *)v13 + 5) = *((void *)v14 + 5);
        v13[48] = v14[48];
        *((void *)v13 + 7) = *((void *)v14 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v51 = *((_OWORD *)v14 + 3);
        *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
        *((_OWORD *)v13 + 3) = v51;
      }
      goto LABEL_32;
    case 2u:
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      v13[16] = v14[16];
      *((void *)v13 + 3) = *((void *)v14 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_32;
    case 3u:
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      v13[16] = v14[16];
      *((void *)v13 + 3) = *((void *)v14 + 3);
      uint64_t v21 = *((void *)v14 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v21)
      {
        *((void *)v13 + 4) = *((void *)v14 + 4);
        *((void *)v13 + 5) = *((void *)v14 + 5);
        v13[48] = v14[48];
        *((void *)v13 + 7) = *((void *)v14 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v22 = *((_OWORD *)v14 + 3);
        *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
        *((_OWORD *)v13 + 3) = v22;
      }
      long long v23 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v24 = v23[6];
      uint64_t v25 = &v13[v24];
      uint64_t v26 = &v14[v24];
      uint64_t v27 = sub_100041B5C();
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
      {
        uint64_t v29 = sub_1000022D0(&qword_1000507D0);
        memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      }
      uint64_t v30 = v23[7];
      uint64_t v31 = &v13[v30];
      uint64_t v32 = &v14[v30];
      uint64_t v33 = sub_100041D4C();
      uint64_t v34 = *(void *)(v33 - 8);
      id v53 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
      if (v53(v32, 1, v33))
      {
        uint64_t v35 = sub_1000022D0(&qword_1000507D8);
        memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
      }
      uint64_t v36 = v23[8];
      uint64_t v37 = &v13[v36];
      uint64_t v38 = &v14[v36];
      *(void *)uint64_t v37 = *(void *)v38;
      *((void *)v37 + 1) = *((void *)v38 + 1);
      uint64_t v54 = v23;
      uint64_t v39 = v23[9];
      uint64_t v40 = &v13[v39];
      uint64_t v41 = &v14[v39];
      uint64_t v42 = *(void **)&v14[v39];
      *(void *)&v13[v39] = v42;
      uint64_t v43 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      uint64_t v44 = &v40[v43];
      uint64_t v45 = &v41[v43];
      swift_bridgeObjectRetain();
      id v46 = v42;
      if (v53(v45, 1, v33))
      {
        uint64_t v47 = sub_1000022D0(&qword_1000507D8);
        memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v44, v45, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v44, 0, 1, v33);
      }
      uint64_t v48 = v54[10];
      id v49 = *(void **)&v14[v48];
      if ((unint64_t)v49 >= 2) {
        id v50 = v49;
      }
      *(void *)&v13[v48] = v49;
LABEL_32:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
      break;
  }
  return a1;
}

char *sub_100029554(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100041ECC();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = *(int *)(a3 + 20);
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    long long v19 = *((_OWORD *)v11 + 1);
    *(_OWORD *)int v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v19;
    long long v20 = *((_OWORD *)v11 + 3);
    *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 3) = v20;
    uint64_t v42 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
    uint64_t v21 = v42[6];
    long long v22 = &v10[v21];
    long long v23 = &v11[v21];
    uint64_t v24 = sub_100041B5C();
    uint64_t v25 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      uint64_t v26 = sub_1000022D0(&qword_1000507D0);
      memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    uint64_t v27 = v42[7];
    uint64_t v28 = &v10[v27];
    uint64_t v29 = &v11[v27];
    uint64_t v30 = sub_100041D4C();
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    if (v32(v29, 1, v30))
    {
      uint64_t v33 = sub_1000022D0(&qword_1000507D8);
      memcpy(v28, v29, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v28, v29, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    *(_OWORD *)&v10[v42[8]] = *(_OWORD *)&v11[v42[8]];
    uint64_t v34 = v42[9];
    uint64_t v35 = &v10[v34];
    uint64_t v36 = &v11[v34];
    *(void *)&v10[v34] = *(void *)&v11[v34];
    uint64_t v37 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v38 = &v35[v37];
    uint64_t v39 = &v36[v37];
    if (v32(v39, 1, v30))
    {
      uint64_t v40 = sub_1000022D0(&qword_1000507D8);
      memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v38, v39, v30);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v38, 0, 1, v30);
    }
    *(void *)&v10[v42[10]] = *(void *)&v11[v42[10]];
    goto LABEL_18;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v14 = sub_1000420EC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
    uint64_t v15 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
    uint64_t v16 = &v10[v15];
    uint64_t v17 = &v11[v15];
    long long v18 = *((_OWORD *)v17 + 1);
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *((_OWORD *)v16 + 1) = v18;
LABEL_18:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  return a1;
}

char *sub_100029A10(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100041ECC();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      if (a1 == a2) {
        return a1;
      }
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v11 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    if (a1 == a2) {
      return a1;
    }
    goto LABEL_8;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
  if (a1 == a2) {
    return a1;
  }
LABEL_8:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  sub_10002CB30((uint64_t)&a1[v12], type metadata accessor for WidgetEntryViewContent.Model.State);
  uint64_t v15 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    long long v22 = *((_OWORD *)v14 + 1);
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    *((_OWORD *)v13 + 1) = v22;
    long long v23 = *((_OWORD *)v14 + 3);
    *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
    *((_OWORD *)v13 + 3) = v23;
    uint64_t v45 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
    uint64_t v24 = v45[6];
    uint64_t v25 = &v13[v24];
    uint64_t v26 = &v14[v24];
    uint64_t v27 = sub_100041B5C();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      uint64_t v29 = sub_1000022D0(&qword_1000507D0);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    uint64_t v30 = v45[7];
    uint64_t v31 = &v13[v30];
    uint64_t v32 = &v14[v30];
    uint64_t v33 = sub_100041D4C();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
    if (v35(v32, 1, v33))
    {
      uint64_t v36 = sub_1000022D0(&qword_1000507D8);
      memcpy(v31, v32, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    *(_OWORD *)&v13[v45[8]] = *(_OWORD *)&v14[v45[8]];
    uint64_t v37 = v45[9];
    uint64_t v38 = &v13[v37];
    uint64_t v39 = &v14[v37];
    *(void *)&v13[v37] = *(void *)&v14[v37];
    uint64_t v40 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v41 = &v38[v40];
    uint64_t v42 = &v39[v40];
    if (v35(v42, 1, v33))
    {
      uint64_t v43 = sub_1000022D0(&qword_1000507D8);
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v41, v42, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v41, 0, 1, v33);
    }
    *(void *)&v13[v45[10]] = *(void *)&v14[v45[10]];
    goto LABEL_24;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v17 = sub_1000420EC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v13, v14, v17);
    uint64_t v18 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
    long long v19 = &v13[v18];
    long long v20 = &v14[v18];
    long long v21 = *((_OWORD *)v20 + 1);
    *(_OWORD *)long long v19 = *(_OWORD *)v20;
    *((_OWORD *)v19 + 1) = v21;
LABEL_24:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  return a1;
}

uint64_t sub_100029F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100029F70);
}

uint64_t sub_100029F70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000022D0(&qword_100051108);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10002A06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A080);
}

uint64_t sub_10002A080(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000022D0(&qword_100051108);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_10002A188()
{
  sub_10002FF90(319, (unint64_t *)&unk_1000513F0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  if (v0 <= 0x3F)
  {
    type metadata accessor for WidgetEntryViewContent.Model.State(319);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_10002A280()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002A29C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000422FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002A2C8()
{
  return sub_10004230C();
}

uint64_t sub_10002A2F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v39 = a1;
  uint64_t v36 = sub_100042B9C();
  uint64_t v3 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v37 = sub_10004217C();
  uint64_t v35 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v38 = (uint64_t)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for WidgetEntryViewContent.Model(0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for WidgetEntryViewContent(0);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  long long v19 = (char *)&v34 - v18;
  uint64_t v34 = sub_1000022D0(&qword_100051420);
  __chkstk_darwin(v34);
  long long v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002CAC8(v2, (uint64_t)v12, type metadata accessor for WidgetEntryViewContent.Model);
  long long v22 = (uint64_t *)&v16[*(int *)(v14 + 28)];
  *long long v22 = swift_getKeyPath();
  sub_1000022D0(&qword_1000502F8);
  swift_storeEnumTagMultiPayload();
  long long v23 = (uint64_t *)&v16[*(int *)(v14 + 32)];
  *long long v23 = swift_getKeyPath();
  sub_1000022D0(&qword_100050D30);
  swift_storeEnumTagMultiPayload();
  sub_10002BF2C((uint64_t)v12, (uint64_t)v16, type metadata accessor for WidgetEntryViewContent.Model);
  sub_10002BF2C((uint64_t)v16, (uint64_t)v19, type metadata accessor for WidgetEntryViewContent);
  type metadata accessor for WidgetEntryView(0);
  sub_10002C214(&qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x8000000100049A10, (uint64_t)v8);
  sub_100042B8C();
  LOBYTE(v23) = sub_100042B7C();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v25 = v5;
  uint64_t v26 = v36;
  v24(v25, v36);
  v24(v8, v26);
  if (v23)
  {
    uint64_t v27 = v35;
    uint64_t v28 = v37;
    uint64_t v29 = v38;
    (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v38, enum case for ColorScheme.dark(_:), v37);
  }
  else
  {
    uint64_t v29 = v38;
    sub_10002C214(&qword_1000502F8, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, v38);
    uint64_t v28 = v37;
    uint64_t v27 = v35;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = (uint64_t *)&v21[*(int *)(v34 + 36)];
  uint64_t v32 = sub_1000022D0(&qword_100050B80);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))((char *)v31 + *(int *)(v32 + 28), v29, v28);
  *uint64_t v31 = KeyPath;
  sub_10002CAC8((uint64_t)v19, (uint64_t)v21, type metadata accessor for WidgetEntryViewContent);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
  sub_10002CB30((uint64_t)v19, type metadata accessor for WidgetEntryViewContent);
  return sub_100009178((uint64_t)v21, v39, &qword_100051420);
}

uint64_t type metadata accessor for WidgetEntryViewContent(uint64_t a1)
{
  return sub_10000D730(a1, qword_100051480);
}

uint64_t sub_10002A820@<X0>(uint64_t a1@<X8>)
{
  uint64_t v147 = a1;
  uint64_t v1 = sub_1000022D0(&qword_1000505D8);
  __chkstk_darwin(v1 - 8);
  v125 = (uint64_t *)((char *)&v117 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = type metadata accessor for LoadedView.Callout(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v124 = (uint64_t)&v117 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000022D0(&qword_1000507D8);
  __chkstk_darwin(v5 - 8);
  uint64_t v122 = (uint64_t)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000022D0(&qword_1000507D0);
  __chkstk_darwin(v7 - 8);
  uint64_t v119 = (uint64_t)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = type metadata accessor for LoadedView(0);
  __chkstk_darwin(v146);
  uint64_t v10 = (char *)&v117 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v126 = (uint64_t)&v117 - v12;
  uint64_t v117 = type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
  __chkstk_darwin(v117);
  uint64_t v14 = (char *)&v117 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = type metadata accessor for TemplateInformationView();
  __chkstk_darwin(v135);
  uint64_t v16 = (char *)&v117 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v123 = (uint64_t)&v117 - v18;
  uint64_t v131 = sub_1000022D0(&qword_100051538);
  __chkstk_darwin(v131);
  v134 = (char *)&v117 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_1000022D0(&qword_100051518);
  __chkstk_darwin(v140);
  v136 = (char *)&v117 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = type metadata accessor for CenteredInformationView();
  __chkstk_darwin(v133);
  long long v22 = (char *)&v117 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v120 = (uint64_t)&v117 - v24;
  uint64_t v132 = type metadata accessor for EmptyStateView();
  __chkstk_darwin(v132);
  uint64_t v26 = (char *)&v117 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v121 = (uint64_t)&v117 - v28;
  uint64_t v29 = type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0);
  __chkstk_darwin(v29);
  uint64_t v118 = (uint64_t)&v117 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_1000022D0(&qword_100051540);
  __chkstk_darwin(v143);
  uint64_t v145 = (uint64_t)&v117 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_1000022D0(&qword_100051548);
  __chkstk_darwin(v137);
  uint64_t v139 = (uint64_t)&v117 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_1000022D0(&qword_100051550);
  __chkstk_darwin(v127);
  uint64_t v129 = (uint64_t)&v117 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_1000022D0(&qword_1000514F8);
  __chkstk_darwin(v138);
  uint64_t v130 = (char *)&v117 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_1000022D0(&qword_1000514E8);
  __chkstk_darwin(v144);
  uint64_t v141 = (char *)&v117 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = type metadata accessor for PlaceholderView();
  __chkstk_darwin(v128);
  uint64_t v37 = (uint64_t *)((char *)&v117 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v38);
  uint64_t v40 = (char *)&v117 - v39;
  uint64_t v41 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  __chkstk_darwin(v41);
  uint64_t v43 = (char *)&v117 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for WidgetEntryViewContent.Model(0);
  sub_10002CAC8(v142 + *(int *)(v44 + 20), (uint64_t)v43, type metadata accessor for WidgetEntryViewContent.Model.State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v64 = *((void *)v43 + 1);
      char v65 = v43[16];
      uint64_t v67 = *((void *)v43 + 3);
      uint64_t v66 = *((void *)v43 + 4);
      uint64_t v68 = *((void *)v43 + 5);
      uint64_t v69 = *((void *)v43 + 6);
      uint64_t v70 = *((void *)v43 + 7);
      *(void *)long long v22 = *(void *)v43;
      *((void *)v22 + 1) = v64;
      v22[16] = v65;
      *((void *)v22 + 3) = v67;
      *((void *)v22 + 4) = v66;
      *((void *)v22 + 5) = v68;
      *((void *)v22 + 6) = v69;
      *((void *)v22 + 7) = v70;
      *((_OWORD *)v22 + 4) = xmmword_1000473D0;
      *((void *)v22 + 10) = 0x4040000000000000;
      uint64_t v71 = v133;
      long long v72 = (uint64_t *)&v22[*(int *)(v133 + 28)];
      *long long v72 = swift_getKeyPath();
      sub_1000022D0(&qword_1000507E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v73 = (uint64_t *)&v22[*(int *)(v71 + 32)];
      *uint64_t v73 = swift_getKeyPath();
      sub_1000022D0(&qword_1000502F8);
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100020564(v66, v68);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100030508(v66, v68);
      uint64_t v74 = v120;
      sub_10002BF2C((uint64_t)v22, v120, (uint64_t (*)(void))type metadata accessor for CenteredInformationView);
      sub_10002CAC8(v74, (uint64_t)v134, (uint64_t (*)(void))type metadata accessor for CenteredInformationView);
      swift_storeEnumTagMultiPayload();
      sub_100030320(&qword_100051520, (void (*)(uint64_t))type metadata accessor for CenteredInformationView);
      sub_100030320(&qword_100051528, (void (*)(uint64_t))type metadata accessor for TemplateInformationView);
      uint64_t v75 = (uint64_t)v136;
      sub_1000425AC();
      sub_1000091DC(v75, v139, &qword_100051518);
      swift_storeEnumTagMultiPayload();
      sub_100030244();
      sub_100030368();
      uint64_t v76 = (uint64_t)v141;
      sub_1000425AC();
      sub_100009240(v75, &qword_100051518);
      sub_1000091DC(v76, v145, &qword_1000514E8);
      swift_storeEnumTagMultiPayload();
      sub_1000301C8();
      sub_100030320(&qword_100051530, (void (*)(uint64_t))type metadata accessor for LoadedView);
      sub_1000425AC();
      sub_100009240(v76, &qword_1000514E8);
      uint64_t v77 = type metadata accessor for CenteredInformationView;
      goto LABEL_5;
    case 2u:
      uint64_t v78 = *((void *)v43 + 1);
      char v79 = v43[16];
      uint64_t v80 = *((void *)v43 + 3);
      *(void *)uint64_t v16 = *(void *)v43;
      *((void *)v16 + 1) = v78;
      v16[16] = v79;
      *((void *)v16 + 3) = v80;
      uint64_t v81 = v135;
      long long v82 = (uint64_t *)&v16[*(int *)(v135 + 20)];
      uint64_t *v82 = swift_getKeyPath();
      sub_1000022D0(&qword_1000507E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v83 = (uint64_t *)&v16[*(int *)(v81 + 24)];
      *uint64_t v83 = swift_getKeyPath();
      sub_1000022D0(&qword_1000502F8);
      swift_storeEnumTagMultiPayload();
      uint64_t v74 = v123;
      sub_10002BF2C((uint64_t)v16, v123, (uint64_t (*)(void))type metadata accessor for TemplateInformationView);
      sub_10002CAC8(v74, (uint64_t)v134, (uint64_t (*)(void))type metadata accessor for TemplateInformationView);
      swift_storeEnumTagMultiPayload();
      sub_100030320(&qword_100051520, (void (*)(uint64_t))type metadata accessor for CenteredInformationView);
      sub_100030320(&qword_100051528, (void (*)(uint64_t))type metadata accessor for TemplateInformationView);
      uint64_t v84 = (uint64_t)v136;
      sub_1000425AC();
      sub_1000091DC(v84, v139, &qword_100051518);
      swift_storeEnumTagMultiPayload();
      sub_100030244();
      sub_100030368();
      uint64_t v85 = (uint64_t)v141;
      sub_1000425AC();
      sub_100009240(v84, &qword_100051518);
      sub_1000091DC(v85, v145, &qword_1000514E8);
      swift_storeEnumTagMultiPayload();
      sub_1000301C8();
      sub_100030320(&qword_100051530, (void (*)(uint64_t))type metadata accessor for LoadedView);
      sub_1000425AC();
      sub_100009240(v85, &qword_1000514E8);
      uint64_t v77 = type metadata accessor for TemplateInformationView;
LABEL_5:
      uint64_t v62 = (uint64_t (*)(void))v77;
      uint64_t v63 = v74;
      break;
    case 3u:
      sub_10002BF2C((uint64_t)v43, (uint64_t)v14, type metadata accessor for WidgetEntryViewContent.Model.State.Loaded);
      uint64_t v86 = *(char **)v14;
      uint64_t v87 = (char *)*((void *)v14 + 1);
      LODWORD(v135) = v14[16];
      uint64_t v88 = *((void *)v14 + 3);
      uint64_t v89 = *((void *)v14 + 4);
      uint64_t v141 = v87;
      uint64_t v142 = v88;
      uint64_t v91 = *((void *)v14 + 6);
      uint64_t v138 = *((void *)v14 + 5);
      uint64_t v90 = v138;
      uint64_t v139 = v89;
      v136 = v86;
      uint64_t v137 = v91;
      uint64_t v140 = *((void *)v14 + 7);
      uint64_t v92 = v140;
      uint64_t v93 = (int *)v117;
      uint64_t v94 = v119;
      sub_1000091DC((uint64_t)&v14[*(int *)(v117 + 24)], v119, &qword_1000507D0);
      uint64_t v95 = v122;
      sub_1000091DC((uint64_t)&v14[v93[7]], v122, &qword_1000507D8);
      uint64_t v96 = v93[9];
      double v97 = (uint64_t *)&v14[v93[8]];
      uint64_t v98 = *v97;
      uint64_t v132 = v97[1];
      uint64_t v133 = v98;
      uint64_t v99 = v124;
      sub_10002CAC8((uint64_t)&v14[v96], v124, type metadata accessor for LoadedView.Callout);
      v134 = *(char **)&v14[v93[10]];
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v101 = (uint64_t)v125;
      uint64_t *v125 = KeyPath;
      sub_1000022D0(&qword_100050300);
      swift_storeEnumTagMultiPayload();
      uint64_t v102 = v141;
      *(void *)uint64_t v10 = v136;
      *((void *)v10 + 1) = v102;
      v10[16] = v135;
      *((void *)v10 + 3) = v142;
      *((void *)v10 + 4) = v89;
      *((void *)v10 + 5) = v90;
      *((void *)v10 + 6) = v91;
      *((void *)v10 + 7) = v92;
      uint64_t v103 = (int *)v146;
      sub_100009178(v94, (uint64_t)&v10[*(int *)(v146 + 24)], &qword_1000507D0);
      sub_100009178(v95, (uint64_t)&v10[v103[7]], &qword_1000507D8);
      uint64_t v104 = (uint64_t *)&v10[v103[8]];
      uint64_t v105 = v132;
      *uint64_t v104 = v133;
      v104[1] = v105;
      sub_10002BF2C(v99, (uint64_t)&v10[v103[9]], type metadata accessor for LoadedView.Callout);
      uint64_t v106 = v134;
      *(void *)&v10[v103[10]] = v134;
      *(void *)&v10[v103[11]] = 0x400C000000000000;
      uint64_t v107 = (uint64_t *)&v10[v103[12]];
      *uint64_t v107 = swift_getKeyPath();
      sub_1000022D0(&qword_1000507E0);
      swift_storeEnumTagMultiPayload();
      Swift::String v108 = &v10[v103[13]];
      *(void *)Swift::String v108 = swift_getKeyPath();
      *((void *)v108 + 1) = 0;
      *((void *)v108 + 2) = 0;
      *((void *)v108 + 3) = 0;
      v108[32] = 0;
      v109 = (uint64_t *)&v10[v103[14]];
      uint64_t *v109 = swift_getKeyPath();
      sub_1000022D0(&qword_100050D30);
      swift_storeEnumTagMultiPayload();
      v110 = (uint64_t *)&v10[v103[15]];
      uint64_t *v110 = swift_getKeyPath();
      sub_1000022D0(&qword_1000502F8);
      swift_storeEnumTagMultiPayload();
      sub_100009178(v101, (uint64_t)&v10[v103[16]], &qword_1000505D8);
      uint64_t v111 = &v10[v103[17]];
      *(void *)uint64_t v111 = swift_getKeyPath();
      *((void *)v111 + 1) = 0;
      v111[16] = 0;
      uint64_t v112 = v126;
      sub_10002BF2C((uint64_t)v10, v126, type metadata accessor for LoadedView);
      sub_10002CAC8(v112, v145, type metadata accessor for LoadedView);
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100020564(v139, v138);
      swift_bridgeObjectRetain();
      sub_1000304F8(v106);
      sub_1000301C8();
      sub_100030320(&qword_100051530, (void (*)(uint64_t))type metadata accessor for LoadedView);
      sub_1000425AC();
      sub_10002CB30(v112, type metadata accessor for LoadedView);
      uint64_t v62 = type metadata accessor for WidgetEntryViewContent.Model.State.Loaded;
      uint64_t v63 = (uint64_t)v14;
      break;
    case 4u:
      uint64_t *v37 = swift_getKeyPath();
      sub_1000022D0(&qword_1000507E0);
      swift_storeEnumTagMultiPayload();
      uint64_t v113 = (uint64_t *)((char *)v37 + *(int *)(v128 + 20));
      *uint64_t v113 = swift_getKeyPath();
      sub_1000022D0(&qword_1000502F8);
      swift_storeEnumTagMultiPayload();
      sub_10002BF2C((uint64_t)v37, (uint64_t)v40, (uint64_t (*)(void))type metadata accessor for PlaceholderView);
      sub_10002CAC8((uint64_t)v40, v129, (uint64_t (*)(void))type metadata accessor for PlaceholderView);
      swift_storeEnumTagMultiPayload();
      sub_100030320(&qword_100051500, (void (*)(uint64_t))type metadata accessor for PlaceholderView);
      sub_100030320(&qword_100051508, (void (*)(uint64_t))type metadata accessor for EmptyStateView);
      uint64_t v114 = (uint64_t)v130;
      sub_1000425AC();
      sub_1000091DC(v114, v139, &qword_1000514F8);
      swift_storeEnumTagMultiPayload();
      sub_100030244();
      sub_100030368();
      uint64_t v115 = (uint64_t)v141;
      sub_1000425AC();
      sub_100009240(v114, &qword_1000514F8);
      sub_1000091DC(v115, v145, &qword_1000514E8);
      swift_storeEnumTagMultiPayload();
      sub_1000301C8();
      sub_100030320(&qword_100051530, (void (*)(uint64_t))type metadata accessor for LoadedView);
      sub_1000425AC();
      sub_100009240(v115, &qword_1000514E8);
      uint64_t v62 = (uint64_t (*)(void))type metadata accessor for PlaceholderView;
      uint64_t v63 = (uint64_t)v40;
      break;
    default:
      uint64_t v45 = v118;
      sub_10002BF2C((uint64_t)v43, v118, type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage);
      uint64_t v46 = v45 + *(int *)(v29 + 20);
      uint64_t v48 = *(void *)v46;
      uint64_t v47 = *(void *)(v46 + 8);
      char v49 = *(unsigned char *)(v46 + 16);
      uint64_t v50 = *(void *)(v46 + 24);
      long long v51 = (int *)v132;
      id v52 = &v26[*(int *)(v132 + 20)];
      uint64_t v53 = sub_1000420EC();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 16))(v52, v45, v53);
      *(void *)uint64_t v26 = v48;
      *((void *)v26 + 1) = v47;
      v26[16] = v49;
      *((void *)v26 + 3) = v50;
      uint64_t v54 = &v26[v51[6]];
      *(_OWORD *)uint64_t v54 = xmmword_1000473E0;
      *((void *)v54 + 2) = 0x4040000000000000;
      uint64_t v55 = (uint64_t *)&v26[v51[7]];
      *uint64_t v55 = swift_getKeyPath();
      sub_1000022D0(&qword_1000507E0);
      swift_storeEnumTagMultiPayload();
      id v56 = &v26[v51[8]];
      *(void *)id v56 = swift_getKeyPath();
      *((void *)v56 + 1) = 0;
      *((void *)v56 + 2) = 0;
      *((void *)v56 + 3) = 0;
      v56[32] = 0;
      uint64_t v57 = (uint64_t *)&v26[v51[9]];
      *uint64_t v57 = swift_getKeyPath();
      sub_1000022D0(&qword_1000502F8);
      swift_storeEnumTagMultiPayload();
      uint64_t v58 = (uint64_t *)&v26[v51[10]];
      uint64_t *v58 = swift_getKeyPath();
      sub_1000022D0(&qword_100050300);
      swift_storeEnumTagMultiPayload();
      uint64_t v59 = v121;
      sub_10002BF2C((uint64_t)v26, v121, (uint64_t (*)(void))type metadata accessor for EmptyStateView);
      sub_10002CAC8(v59, v129, (uint64_t (*)(void))type metadata accessor for EmptyStateView);
      swift_storeEnumTagMultiPayload();
      sub_100030320(&qword_100051500, (void (*)(uint64_t))type metadata accessor for PlaceholderView);
      sub_100030320(&qword_100051508, (void (*)(uint64_t))type metadata accessor for EmptyStateView);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v60 = (uint64_t)v130;
      sub_1000425AC();
      sub_1000091DC(v60, v139, &qword_1000514F8);
      swift_storeEnumTagMultiPayload();
      sub_100030244();
      sub_100030368();
      uint64_t v61 = (uint64_t)v141;
      sub_1000425AC();
      sub_100009240(v60, &qword_1000514F8);
      sub_1000091DC(v61, v145, &qword_1000514E8);
      swift_storeEnumTagMultiPayload();
      sub_1000301C8();
      sub_100030320(&qword_100051530, (void (*)(uint64_t))type metadata accessor for LoadedView);
      sub_1000425AC();
      sub_100009240(v61, &qword_1000514E8);
      sub_10002CB30(v59, (uint64_t (*)(void))type metadata accessor for EmptyStateView);
      uint64_t v62 = type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage;
      uint64_t v63 = v45;
      break;
  }
  return sub_10002CB30(v63, v62);
}

uint64_t sub_10002BE6C()
{
  uint64_t v0 = sub_1000022D0(&qword_1000514D0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A820((uint64_t)v2);
  sub_10003011C();
  sub_10004288C();
  return sub_100009240((uint64_t)v2, &qword_1000514D0);
}

uint64_t sub_10002BF2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002BF94@<X0>(uint64_t a1@<X8>)
{
  return sub_10002C214(&qword_1000502F8, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

double sub_10002BFD0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000423FC();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100042DFC();
  uint64_t v9 = sub_10004264C();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10003C7DC(0x74616F6C464743, 0xE700000000000000, &v14);
    sub_100042E3C();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000423EC();
  swift_getAtKeyPath();
  sub_100008444(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_10002C1DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002C214(&qword_100050300, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x8000000100049A10, a1);
}

uint64_t sub_10002C214@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1000423FC();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000022D0(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000091DC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_100042DFC();
    uint64_t v21 = sub_10004264C();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_10003C7DC(v27, v25, &v29);
      sub_100042E3C();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000423EC();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_10002C4CC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002C214(&qword_1000507E0, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

double sub_10002C508()
{
  uint64_t v1 = sub_1000423FC();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v0[32] == 1) {
    return *(double *)v0;
  }
  swift_retain();
  os_log_type_t v6 = sub_100042DFC();
  uint64_t v7 = sub_10004264C();
  os_log_type_t v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v10[0] = v9 + 4;
    v10[1] = sub_10003C7DC(0x65736E4965676445, 0xEA00000000007374, &v11);
    sub_100042E3C();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000423EC();
  swift_getAtKeyPath();
  sub_10003054C((uint64_t)v0);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return *(double *)&v11;
}

uint64_t sub_10002C728@<X0>(uint64_t a1@<X8>)
{
  return sub_10002C214(&qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection, 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_10002C768(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_1000423FC();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v10 = sub_100042DFC();
    uint64_t v11 = sub_10004264C();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      v15[0] = v13 + 4;
      v15[1] = sub_10003C7DC(0xD000000000000013, 0x8000000100049A30, &v16);
      sub_100042E3C();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000423EC();
    swift_getAtKeyPath();
    sub_100018ED0(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v16;
  }
  return a1;
}

uint64_t sub_10002C984()
{
  return sub_10004239C();
}

uint64_t sub_10002C9A8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000423BC();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_10002C9D8()
{
  return sub_1000422AC();
}

uint64_t sub_10002C9FC(uint64_t a1)
{
  uint64_t v2 = sub_10004217C();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_1000422BC();
}

uint64_t sub_10002CAC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002CB30(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for WidgetEntryViewContent.Model.State.TemplateInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WidgetEntryViewContent.Model.State.TemplateInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WidgetEntryViewContent.Model.State.TemplateInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for WidgetEntryViewContent.Model.State.TemplateInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetEntryViewContent.Model.State.TemplateInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WidgetEntryViewContent.Model.State.TemplateInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WidgetEntryViewContent.Model.State.TemplateInfo()
{
  return &type metadata for WidgetEntryViewContent.Model.State.TemplateInfo;
}

uint64_t destroy for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v5;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
  }
  return a1;
}

uint64_t assignWithCopy for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 32);
  uint64_t v5 = (_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10000AAE0(a1 + 32);
      long long v7 = *(_OWORD *)(a2 + 48);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 48) = v7;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 48);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
  }
  return a1;
}

__n128 initializeWithTake for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (!*(void *)(a1 + 40)) {
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(a2 + 40);
  if (!v5)
  {
    sub_10000AAE0(a1 + 32);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    return a1;
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetEntryViewContent.Model.State.CenteredInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetEntryViewContent.Model.State.CenteredInfo()
{
  return &type metadata for WidgetEntryViewContent.Model.State.CenteredInfo;
}

uint64_t *sub_10002D0E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_10002D104(a1, a2, a3, &qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection);
}

uint64_t *sub_10002D104(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void))
{
  int v7 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v7 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else
  {
    uint64_t v11 = sub_100041ECC();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
    {
      uint64_t v13 = sub_1000022D0(&qword_100051108);
      memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v12 + 16))(a1, a2, v11);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
    }
    uint64_t v15 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model(0) + 20);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v19 = sub_1000420EC();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v16, v17, v19);
        uint64_t v20 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
        uint64_t v21 = &v16[v20];
        uint64_t v22 = &v17[v20];
        uint64_t v23 = *((void *)v22 + 1);
        *(void *)uint64_t v21 = *(void *)v22;
        *((void *)v21 + 1) = v23;
        v21[16] = v22[16];
        *((void *)v21 + 3) = *((void *)v22 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_29;
      case 1u:
        uint64_t v24 = *((void *)v17 + 1);
        *(void *)uint64_t v16 = *(void *)v17;
        *((void *)v16 + 1) = v24;
        v16[16] = v17[16];
        *((void *)v16 + 3) = *((void *)v17 + 3);
        uint64_t v25 = *((void *)v17 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v25)
        {
          *((void *)v16 + 4) = *((void *)v17 + 4);
          *((void *)v16 + 5) = v25;
          v16[48] = v17[48];
          *((void *)v16 + 7) = *((void *)v17 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v29 = *((_OWORD *)v17 + 3);
          *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
          *((_OWORD *)v16 + 3) = v29;
        }
        goto LABEL_29;
      case 2u:
        uint64_t v26 = *((void *)v17 + 1);
        *(void *)uint64_t v16 = *(void *)v17;
        *((void *)v16 + 1) = v26;
        v16[16] = v17[16];
        *((void *)v16 + 3) = *((void *)v17 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_29;
      case 3u:
        uint64_t v27 = *((void *)v17 + 1);
        *(void *)uint64_t v16 = *(void *)v17;
        *((void *)v16 + 1) = v27;
        v16[16] = v17[16];
        *((void *)v16 + 3) = *((void *)v17 + 3);
        uint64_t v28 = *((void *)v17 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v71 = a4;
        long long v72 = a5;
        if (v28)
        {
          *((void *)v16 + 4) = *((void *)v17 + 4);
          *((void *)v16 + 5) = v28;
          v16[48] = v17[48];
          *((void *)v16 + 7) = *((void *)v17 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v30 = *((_OWORD *)v17 + 3);
          *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
          *((_OWORD *)v16 + 3) = v30;
        }
        uint64_t v73 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
        uint64_t v31 = v73[6];
        uint64_t v32 = &v16[v31];
        uint64_t v33 = &v17[v31];
        uint64_t v34 = sub_100041B5C();
        uint64_t v35 = *(void *)(v34 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
        {
          uint64_t v36 = sub_1000022D0(&qword_1000507D0);
          memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
        }
        uint64_t v37 = v73[7];
        uint64_t v38 = &v16[v37];
        uint64_t v39 = &v17[v37];
        uint64_t v40 = sub_100041D4C();
        uint64_t v41 = *(void *)(v40 - 8);
        uint64_t v70 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
        uint64_t v69 = v41;
        if (v70(v39, 1, v40))
        {
          uint64_t v42 = sub_1000022D0(&qword_1000507D8);
          memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
        }
        uint64_t v43 = v40;
        uint64_t v44 = v73[8];
        uint64_t v45 = &v16[v44];
        uint64_t v46 = &v17[v44];
        uint64_t v47 = *((void *)v46 + 1);
        *(void *)uint64_t v45 = *(void *)v46;
        *((void *)v45 + 1) = v47;
        uint64_t v48 = v73[9];
        char v49 = &v16[v48];
        uint64_t v50 = &v17[v48];
        long long v51 = *(void **)&v17[v48];
        *(void *)&v16[v48] = v51;
        uint64_t v52 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
        uint64_t v53 = &v49[v52];
        uint64_t v54 = &v50[v52];
        swift_bridgeObjectRetain();
        id v55 = v51;
        if (v70(v54, 1, v43))
        {
          uint64_t v56 = sub_1000022D0(&qword_1000507D8);
          memcpy(v53, v54, *(void *)(*(void *)(v56 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v53, v54, v43);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v53, 0, 1, v43);
        }
        a4 = v71;
        a5 = v72;
        uint64_t v57 = v73[10];
        uint64_t v58 = *(void **)&v17[v57];
        if ((unint64_t)v58 >= 2) {
          id v59 = v58;
        }
        *(void *)&v16[v57] = v58;
LABEL_29:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
        break;
    }
    uint64_t v60 = *(int *)(a3 + 20);
    uint64_t v61 = (uint64_t *)((char *)a1 + v60);
    uint64_t v62 = (uint64_t *)((char *)a2 + v60);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v63 = sub_10004217C();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
    }
    else
    {
      *uint64_t v61 = *v62;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v64 = *(int *)(a3 + 24);
    char v65 = (uint64_t *)((char *)a1 + v64);
    uint64_t v66 = (uint64_t *)((char *)a2 + v64);
    sub_1000022D0(a4);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v67 = a5(0);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v67 - 8) + 16))(v65, v66, v67);
    }
    else
    {
      *char v65 = *v66;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10002D8E4(uint64_t a1, uint64_t a2)
{
  return sub_10002D904(a1, a2, &qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection);
}

uint64_t sub_10002D904(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v8 = sub_100041ECC();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  uint64_t v10 = a1 + *(int *)(type metadata accessor for WidgetEntryViewContent.Model(0) + 20);
  type metadata accessor for WidgetEntryViewContent.Model.State(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v11 = sub_1000420EC();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
      type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v10 + 40)) {
        goto LABEL_6;
      }
      break;
    case 2u:
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 3u:
      long long v29 = a4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v10 + 40))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      uint64_t v12 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v13 = v10 + v12[6];
      uint64_t v14 = sub_100041B5C();
      uint64_t v15 = *(void *)(v14 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
      }
      uint64_t v16 = v10 + v12[7];
      uint64_t v17 = sub_100041D4C();
      uint64_t v18 = *(void *)(v17 - 8);
      uint64_t v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
      if (!v19(v16, 1, v17)) {
        (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
      }
      swift_bridgeObjectRelease();
      uint64_t v20 = (id *)(v10 + v12[9]);

      uint64_t v21 = (char *)v20 + *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      if (!v19((uint64_t)v21, 1, v17)) {
        (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      }
      uint64_t v22 = *(void **)(v10 + v12[10]);
      a4 = v29;
      if ((unint64_t)v22 >= 2) {

      }
      break;
    default:
      break;
  }
  uint64_t v23 = a1 + *(int *)(a2 + 20);
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_10004217C();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  }
  else
  {
    swift_release();
  }
  uint64_t v25 = a1 + *(int *)(a2 + 24);
  sub_1000022D0(a3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = a4(0);
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8);
    return v27(v25, v26);
  }
  else
  {
    return swift_release();
  }
}

char *sub_10002DDA4(char *a1, char *a2, uint64_t a3)
{
  return sub_10002DDC4(a1, a2, a3, &qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection);
}

char *sub_10002DDC4(char *a1, char *a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v10 = sub_100041ECC();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
  {
    uint64_t v12 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(a1, a2, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model(0) + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v17 = sub_1000420EC();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v14, v15, v17);
      uint64_t v18 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
      uint64_t v19 = &v14[v18];
      uint64_t v20 = &v15[v18];
      uint64_t v21 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v21;
      v19[16] = v20[16];
      *((void *)v19 + 3) = *((void *)v20 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_27;
    case 1u:
      uint64_t v22 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = *(void *)v15;
      *((void *)v14 + 1) = v22;
      unsigned char v14[16] = v15[16];
      *((void *)v14 + 3) = *((void *)v15 + 3);
      uint64_t v23 = *((void *)v15 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v23)
      {
        *((void *)v14 + 4) = *((void *)v15 + 4);
        *((void *)v14 + 5) = v23;
        v14[48] = v15[48];
        *((void *)v14 + 7) = *((void *)v15 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v27 = *((_OWORD *)v15 + 3);
        *((_OWORD *)v14 + 2) = *((_OWORD *)v15 + 2);
        *((_OWORD *)v14 + 3) = v27;
      }
      goto LABEL_27;
    case 2u:
      uint64_t v24 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = *(void *)v15;
      *((void *)v14 + 1) = v24;
      unsigned char v14[16] = v15[16];
      *((void *)v14 + 3) = *((void *)v15 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_27;
    case 3u:
      uint64_t v25 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = *(void *)v15;
      *((void *)v14 + 1) = v25;
      unsigned char v14[16] = v15[16];
      *((void *)v14 + 3) = *((void *)v15 + 3);
      uint64_t v26 = *((void *)v15 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v70 = a5;
      uint64_t v68 = a3;
      if (v26)
      {
        *((void *)v14 + 4) = *((void *)v15 + 4);
        *((void *)v14 + 5) = v26;
        v14[48] = v15[48];
        *((void *)v14 + 7) = *((void *)v15 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v28 = *((_OWORD *)v15 + 3);
        *((_OWORD *)v14 + 2) = *((_OWORD *)v15 + 2);
        *((_OWORD *)v14 + 3) = v28;
      }
      uint64_t v71 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v29 = v71[6];
      long long v30 = &v14[v29];
      uint64_t v31 = &v15[v29];
      uint64_t v32 = sub_100041B5C();
      uint64_t v33 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        uint64_t v34 = sub_1000022D0(&qword_1000507D0);
        memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
      uint64_t v35 = v71[7];
      uint64_t v36 = &v14[v35];
      uint64_t v37 = &v15[v35];
      uint64_t v38 = sub_100041D4C();
      uint64_t v39 = *(void *)(v38 - 8);
      uint64_t v67 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
      uint64_t v69 = a4;
      uint64_t v66 = v39;
      if (v67(v37, 1, v38))
      {
        uint64_t v40 = sub_1000022D0(&qword_1000507D8);
        memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v36, v37, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      }
      uint64_t v41 = v71[8];
      uint64_t v42 = &v14[v41];
      uint64_t v43 = &v15[v41];
      uint64_t v44 = *((void *)v43 + 1);
      *(void *)uint64_t v42 = *(void *)v43;
      *((void *)v42 + 1) = v44;
      uint64_t v45 = v71[9];
      uint64_t v46 = &v14[v45];
      uint64_t v47 = &v15[v45];
      uint64_t v48 = *(void **)&v15[v45];
      *(void *)&v14[v45] = v48;
      uint64_t v49 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
      uint64_t v50 = &v46[v49];
      long long v51 = &v47[v49];
      swift_bridgeObjectRetain();
      id v52 = v48;
      if (v67(v51, 1, v38))
      {
        uint64_t v53 = sub_1000022D0(&qword_1000507D8);
        memcpy(v50, v51, *(void *)(*(void *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v50, v51, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v50, 0, 1, v38);
      }
      a4 = v69;
      a5 = v70;
      a3 = v68;
      uint64_t v54 = v71[10];
      id v55 = *(void **)&v15[v54];
      if ((unint64_t)v55 >= 2) {
        id v56 = v55;
      }
      *(void *)&v14[v54] = v55;
LABEL_27:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
      break;
  }
  uint64_t v57 = *(int *)(a3 + 20);
  uint64_t v58 = &a1[v57];
  id v59 = &a2[v57];
  sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v60 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v58, v59, v60);
  }
  else
  {
    *(void *)uint64_t v58 = *(void *)v59;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v61 = *(int *)(a3 + 24);
  uint64_t v62 = &a1[v61];
  uint64_t v63 = &a2[v61];
  sub_1000022D0(a4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v64 = a5(0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(v62, v63, v64);
  }
  else
  {
    *(void *)uint64_t v62 = *(void *)v63;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_10002E554(char *a1, char *a2, uint64_t a3)
{
  return sub_10002E574(a1, a2, a3, &qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection);
}

char *sub_10002E574(char *a1, char *a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v10 = sub_100041ECC();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(a1, 1, v10);
  int v14 = v12(a2, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(a1, a2, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(a1, v10);
LABEL_6:
    uint64_t v15 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 24))(a1, a2, v10);
LABEL_7:
  uint64_t v16 = type metadata accessor for WidgetEntryViewContent.Model(0);
  if (a1 != a2)
  {
    uint64_t v17 = *(int *)(v16 + 20);
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    sub_10002CB30((uint64_t)&a1[v17], type metadata accessor for WidgetEntryViewContent.Model.State);
    uint64_t v20 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v21 = sub_1000420EC();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v18, v19, v21);
        uint64_t v22 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
        uint64_t v23 = &v18[v22];
        uint64_t v24 = &v19[v22];
        *(void *)uint64_t v23 = *(void *)v24;
        *((void *)v23 + 1) = *((void *)v24 + 1);
        v23[16] = v24[16];
        *((void *)v23 + 3) = *((void *)v24 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_31;
      case 1u:
        *(void *)uint64_t v18 = *(void *)v19;
        *((void *)v18 + 1) = *((void *)v19 + 1);
        v18[16] = v19[16];
        *((void *)v18 + 3) = *((void *)v19 + 3);
        uint64_t v25 = *((void *)v19 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v25)
        {
          *((void *)v18 + 4) = *((void *)v19 + 4);
          *((void *)v18 + 5) = *((void *)v19 + 5);
          v18[48] = v19[48];
          *((void *)v18 + 7) = *((void *)v19 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v55 = *((_OWORD *)v19 + 3);
          *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
          *((_OWORD *)v18 + 3) = v55;
        }
        goto LABEL_31;
      case 2u:
        *(void *)uint64_t v18 = *(void *)v19;
        *((void *)v18 + 1) = *((void *)v19 + 1);
        v18[16] = v19[16];
        *((void *)v18 + 3) = *((void *)v19 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_31;
      case 3u:
        *(void *)uint64_t v18 = *(void *)v19;
        *((void *)v18 + 1) = *((void *)v19 + 1);
        v18[16] = v19[16];
        *((void *)v18 + 3) = *((void *)v19 + 3);
        uint64_t v26 = *((void *)v19 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v66 = a4;
        uint64_t v67 = a3;
        if (v26)
        {
          *((void *)v18 + 4) = *((void *)v19 + 4);
          *((void *)v18 + 5) = *((void *)v19 + 5);
          v18[48] = v19[48];
          *((void *)v18 + 7) = *((void *)v19 + 7);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          long long v27 = *((_OWORD *)v19 + 3);
          *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
          *((_OWORD *)v18 + 3) = v27;
        }
        uint64_t v69 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
        uint64_t v28 = v69[6];
        uint64_t v29 = &v18[v28];
        long long v30 = &v19[v28];
        uint64_t v31 = sub_100041B5C();
        uint64_t v32 = *(void *)(v31 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
        {
          uint64_t v33 = sub_1000022D0(&qword_1000507D0);
          memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
        }
        uint64_t v34 = v69[7];
        uint64_t v35 = &v18[v34];
        uint64_t v36 = &v19[v34];
        uint64_t v37 = sub_100041D4C();
        uint64_t v38 = *(void *)(v37 - 8);
        char v65 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
        uint64_t v68 = a5;
        if (v65(v36, 1, v37))
        {
          uint64_t v39 = sub_1000022D0(&qword_1000507D8);
          memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
        }
        uint64_t v40 = v69[8];
        uint64_t v41 = &v18[v40];
        uint64_t v42 = &v19[v40];
        *(void *)uint64_t v41 = *(void *)v42;
        *((void *)v41 + 1) = *((void *)v42 + 1);
        uint64_t v43 = v69[9];
        uint64_t v44 = &v18[v43];
        uint64_t v45 = &v19[v43];
        uint64_t v46 = *(void **)&v19[v43];
        *(void *)&v18[v43] = v46;
        uint64_t v47 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
        uint64_t v48 = &v44[v47];
        uint64_t v49 = &v45[v47];
        swift_bridgeObjectRetain();
        id v50 = v46;
        if (v65(v49, 1, v37))
        {
          uint64_t v51 = sub_1000022D0(&qword_1000507D8);
          memcpy(v48, v49, *(void *)(*(void *)(v51 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v48, v49, v37);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v48, 0, 1, v37);
        }
        a3 = v67;
        a5 = v68;
        uint64_t v52 = v69[10];
        uint64_t v53 = *(void **)&v19[v52];
        a4 = v66;
        if ((unint64_t)v53 >= 2) {
          id v54 = v53;
        }
        *(void *)&v18[v52] = v53;
LABEL_31:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
        break;
    }
    uint64_t v56 = *(int *)(a3 + 20);
    uint64_t v57 = &a1[v56];
    uint64_t v58 = &a2[v56];
    sub_100009240((uint64_t)&a1[v56], &qword_1000502F8);
    sub_1000022D0(&qword_1000502F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v59 = sub_10004217C();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v59 - 8) + 16))(v57, v58, v59);
    }
    else
    {
      *(void *)uint64_t v57 = *(void *)v58;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v60 = *(int *)(a3 + 24);
    uint64_t v61 = &a1[v60];
    uint64_t v62 = &a2[v60];
    sub_100009240((uint64_t)&a1[v60], a4);
    sub_1000022D0(a4);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v63 = a5(0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
    }
    else
    {
      *(void *)uint64_t v61 = *(void *)v62;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_10002EDCC(char *a1, char *a2, uint64_t a3)
{
  return sub_10002EDEC(a1, a2, a3, &qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection);
}

char *sub_10002EDEC(char *a1, char *a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v10 = sub_100041ECC();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
  {
    uint64_t v12 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(a1, a2, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model(0) + 20);
  int v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v57 = a3;
    uint64_t v59 = a5;
    long long v23 = *((_OWORD *)v15 + 1);
    *(_OWORD *)int v14 = *(_OWORD *)v15;
    *((_OWORD *)v14 + 1) = v23;
    long long v24 = *((_OWORD *)v15 + 3);
    *((_OWORD *)v14 + 2) = *((_OWORD *)v15 + 2);
    *((_OWORD *)v14 + 3) = v24;
    uint64_t v60 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
    uint64_t v25 = v60[6];
    uint64_t v26 = &v14[v25];
    long long v27 = &v15[v25];
    uint64_t v28 = sub_100041B5C();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v58 = a4;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      uint64_t v30 = sub_1000022D0(&qword_1000507D0);
      memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    uint64_t v31 = v60[7];
    __dst = &v14[v31];
    uint64_t v32 = &v15[v31];
    uint64_t v33 = sub_100041D4C();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
    uint64_t v55 = v34;
    if (v35(v32, 1, v33))
    {
      uint64_t v36 = sub_1000022D0(&qword_1000507D8);
      memcpy(__dst, v32, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(__dst, v32, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(__dst, 0, 1, v33);
    }
    *(_OWORD *)&v14[v60[8]] = *(_OWORD *)&v15[v60[8]];
    uint64_t v37 = v60[9];
    uint64_t v38 = &v14[v37];
    uint64_t v39 = &v15[v37];
    *(void *)&v14[v37] = *(void *)&v15[v37];
    uint64_t v40 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v41 = &v38[v40];
    uint64_t v42 = &v39[v40];
    if (v35(v42, 1, v33))
    {
      uint64_t v43 = sub_1000022D0(&qword_1000507D8);
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v41, v42, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v41, 0, 1, v33);
    }
    a4 = v58;
    a5 = v59;
    a3 = v57;
    *(void *)&v14[v60[10]] = *(void *)&v15[v60[10]];
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
      goto LABEL_19;
    }
    uint64_t v18 = sub_1000420EC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v14, v15, v18);
    uint64_t v19 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
    uint64_t v20 = &v14[v19];
    uint64_t v21 = &v15[v19];
    long long v22 = *((_OWORD *)v21 + 1);
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    *((_OWORD *)v20 + 1) = v22;
  }
  swift_storeEnumTagMultiPayload();
LABEL_19:
  uint64_t v44 = *(int *)(a3 + 20);
  uint64_t v45 = &a1[v44];
  uint64_t v46 = &a2[v44];
  uint64_t v47 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v48 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v45, v46, v48);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v45, v46, *(void *)(*(void *)(v47 - 8) + 64));
  }
  uint64_t v49 = *(int *)(a3 + 24);
  id v50 = &a1[v49];
  uint64_t v51 = &a2[v49];
  uint64_t v52 = sub_1000022D0(a4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v53 = a5(0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 32))(v50, v51, v53);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
  }
  return a1;
}

char *sub_10002F420(char *a1, char *a2, uint64_t a3)
{
  return sub_10002F440(a1, a2, a3, &qword_100050D30, (uint64_t (*)(void))&type metadata accessor for LayoutDirection);
}

char *sub_10002F440(char *a1, char *a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void))
{
  uint64_t v10 = sub_100041ECC();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(a1, 1, v10);
  int v14 = v12(a2, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(a1, a2, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(a1, v10);
LABEL_6:
    uint64_t v15 = sub_1000022D0(&qword_100051108);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(a1, a2, v10);
LABEL_7:
  uint64_t v16 = type metadata accessor for WidgetEntryViewContent.Model(0);
  if (a1 == a2) {
    return a1;
  }
  uint64_t v64 = a3;
  uint64_t v17 = *(int *)(v16 + 20);
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  sub_10002CB30((uint64_t)&a1[v17], type metadata accessor for WidgetEntryViewContent.Model.State);
  uint64_t v20 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v61 = a4;
    long long v27 = *((_OWORD *)v19 + 1);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    *((_OWORD *)v18 + 1) = v27;
    long long v28 = *((_OWORD *)v19 + 3);
    *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
    *((_OWORD *)v18 + 3) = v28;
    uint64_t v63 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
    uint64_t v29 = v63[6];
    uint64_t v30 = &v18[v29];
    uint64_t v31 = &v19[v29];
    uint64_t v32 = sub_100041B5C();
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v62 = a5;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      uint64_t v34 = sub_1000022D0(&qword_1000507D0);
      memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v31, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
    }
    uint64_t v35 = v63[7];
    __dst = &v18[v35];
    uint64_t v36 = &v19[v35];
    uint64_t v37 = sub_100041D4C();
    uint64_t v38 = *(void *)(v37 - 8);
    uint64_t v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
    uint64_t v59 = v38;
    if (v39(v36, 1, v37))
    {
      uint64_t v40 = sub_1000022D0(&qword_1000507D8);
      memcpy(__dst, v36, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(__dst, v36, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(__dst, 0, 1, v37);
    }
    *(_OWORD *)&v18[v63[8]] = *(_OWORD *)&v19[v63[8]];
    uint64_t v41 = v63[9];
    uint64_t v42 = &v18[v41];
    uint64_t v43 = &v19[v41];
    *(void *)&v18[v41] = *(void *)&v19[v41];
    uint64_t v44 = *(int *)(type metadata accessor for LoadedView.Callout(0) + 20);
    uint64_t v45 = &v42[v44];
    uint64_t v46 = &v43[v44];
    if (v39(v46, 1, v37))
    {
      uint64_t v47 = sub_1000022D0(&qword_1000507D8);
      memcpy(v45, v46, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v45, v46, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v45, 0, 1, v37);
    }
    a4 = v61;
    a5 = v62;
    *(void *)&v18[v63[10]] = *(void *)&v19[v63[10]];
    goto LABEL_23;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v22 = sub_1000420EC();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v18, v19, v22);
    uint64_t v23 = *(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20);
    long long v24 = &v18[v23];
    uint64_t v25 = &v19[v23];
    long long v26 = *((_OWORD *)v25 + 1);
    *(_OWORD *)long long v24 = *(_OWORD *)v25;
    *((_OWORD *)v24 + 1) = v26;
LABEL_23:
    swift_storeEnumTagMultiPayload();
    goto LABEL_24;
  }
  memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
LABEL_24:
  uint64_t v48 = *(int *)(v64 + 20);
  uint64_t v49 = &a1[v48];
  id v50 = &a2[v48];
  sub_100009240((uint64_t)&a1[v48], &qword_1000502F8);
  uint64_t v51 = sub_1000022D0(&qword_1000502F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v52 = sub_10004217C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32))(v49, v50, v52);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v49, v50, *(void *)(*(void *)(v51 - 8) + 64));
  }
  uint64_t v53 = *(int *)(v64 + 24);
  id v54 = &a1[v53];
  uint64_t v55 = &a2[v53];
  sub_100009240((uint64_t)&a1[v53], a4);
  uint64_t v56 = sub_1000022D0(a4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v57 = a5(0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 32))(v54, v55, v57);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v54, v55, *(void *)(*(void *)(v56 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10002FB10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002FB24);
}

uint64_t sub_10002FB24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002FB30(a1, a2, a3, &qword_100050D38);
}

uint64_t sub_10002FB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = type metadata accessor for WidgetEntryViewContent.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a2)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, v10);
  }
  uint64_t v13 = sub_1000022D0(&qword_1000505D0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    goto LABEL_5;
  }
  uint64_t v16 = sub_1000022D0(a4);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a3 + 24);

  return v17(v19, a2, v18);
}

uint64_t sub_10002FC84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002FC98);
}

uint64_t sub_10002FC98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_10002FCA4(a1, a2, a3, a4, &qword_100050D38);
}

uint64_t sub_10002FCA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = type metadata accessor for WidgetEntryViewContent.Model(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    uint64_t v14 = a1;
LABEL_5:
    return v13(v14, a2, a2, v12);
  }
  uint64_t v15 = sub_1000022D0(&qword_1000505D0);
  uint64_t v16 = *(void *)(v15 - 8);
  if (*(_DWORD *)(v16 + 84) == a3)
  {
    uint64_t v12 = v15;
    uint64_t v14 = a1 + *(int *)(a4 + 20);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
    goto LABEL_5;
  }
  uint64_t v18 = sub_1000022D0(a5);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + *(int *)(a4 + 24);

  return v19(v21, a2, a2, v20);
}

void sub_10002FE10(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_10002FE30(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t))
{
  type metadata accessor for WidgetEntryViewContent.Model(319);
  if (v7 <= 0x3F)
  {
    sub_10002FF90(319, &qword_100050648, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v8 <= 0x3F)
    {
      sub_10002FF90(319, a4, a5, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v9 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_10002FF90(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_10002FFF8()
{
  unint64_t result = qword_1000514C0;
  if (!qword_1000514C0)
  {
    sub_1000025C8(&qword_100051420);
    sub_100030320(&qword_1000514C8, (void (*)(uint64_t))type metadata accessor for WidgetEntryViewContent);
    sub_1000300A4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000514C0);
  }
  return result;
}

unint64_t sub_1000300A4()
{
  unint64_t result = qword_100050B78;
  if (!qword_100050B78)
  {
    sub_1000025C8(&qword_100050B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100050B78);
  }
  return result;
}

uint64_t sub_100030100()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10003011C()
{
  unint64_t result = qword_1000514D8;
  if (!qword_1000514D8)
  {
    sub_1000025C8(&qword_1000514D0);
    sub_1000301C8();
    sub_100030320(&qword_100051530, (void (*)(uint64_t))type metadata accessor for LoadedView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000514D8);
  }
  return result;
}

unint64_t sub_1000301C8()
{
  unint64_t result = qword_1000514E0;
  if (!qword_1000514E0)
  {
    sub_1000025C8(&qword_1000514E8);
    sub_100030244();
    sub_100030368();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000514E0);
  }
  return result;
}

unint64_t sub_100030244()
{
  unint64_t result = qword_1000514F0;
  if (!qword_1000514F0)
  {
    sub_1000025C8(&qword_1000514F8);
    sub_100030320(&qword_100051500, (void (*)(uint64_t))type metadata accessor for PlaceholderView);
    sub_100030320(&qword_100051508, (void (*)(uint64_t))type metadata accessor for EmptyStateView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000514F0);
  }
  return result;
}

uint64_t sub_100030320(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100030368()
{
  unint64_t result = qword_100051510;
  if (!qword_100051510)
  {
    sub_1000025C8(&qword_100051518);
    sub_100030320(&qword_100051520, (void (*)(uint64_t))type metadata accessor for CenteredInformationView);
    sub_100030320(&qword_100051528, (void (*)(uint64_t))type metadata accessor for TemplateInformationView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051510);
  }
  return result;
}

uint64_t sub_10003044C()
{
  return sub_10004239C();
}

uint64_t sub_100030470@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000423BC();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_1000304A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000422FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000304CC()
{
  return sub_10004230C();
}

id sub_1000304F8(id result)
{
  if ((unint64_t)result >= 2) {
    return result;
  }
  return result;
}

uint64_t sub_100030508(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10003054C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100030584()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000305E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v80 = a1;
  uint64_t v2 = _s12DependenciesVMa_0();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000022D0(&qword_100050328);
  uint64_t v62 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1000022D0(&qword_100050320);
  uint64_t v65 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000022D0(&qword_100050318);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v70 = v10;
  uint64_t v71 = v11;
  __chkstk_darwin(v10);
  uint64_t v61 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000022D0(&qword_100050310);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v72 = v13;
  uint64_t v73 = v14;
  __chkstk_darwin(v13);
  uint64_t v66 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000022D0(&qword_100050308);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v74 = v16;
  uint64_t v75 = v17;
  __chkstk_darwin(v16);
  uint64_t v67 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000022D0(&qword_1000515F0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v76 = v19;
  uint64_t v77 = v20;
  __chkstk_darwin(v19);
  uint64_t v68 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000022D0(&qword_1000515F8);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v78 = v22;
  uint64_t v79 = v23;
  __chkstk_darwin(v22);
  uint64_t v69 = (char *)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = (void (**)(uint64_t))(v1 + *(int *)(type metadata accessor for PeopleWidget() + 20));
  sub_100031D68((uint64_t)v63, (uint64_t)v4, (uint64_t (*)(void))_s12DependenciesVMa_0);
  type metadata accessor for PeopleWidgetProvider(0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v81 = sub_100034450((uint64_t)v4);
  type metadata accessor for WidgetEntryView(0);
  sub_100031D20(&qword_100051600, (void (*)(uint64_t))type metadata accessor for WidgetEntryView);
  sub_100031D20(&qword_100051608, (void (*)(uint64_t))type metadata accessor for PeopleWidgetProvider);
  sub_100042C2C();
  sub_1000424BC();
  uint64_t v25 = sub_10004285C();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  unint64_t v30 = sub_100002610();
  sub_10004255C();
  sub_10000D48C(v25, v27, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v7, v5);
  sub_1000424BC();
  uint64_t v31 = sub_10004285C();
  uint64_t v33 = v32;
  LOBYTE(v27) = v34 & 1;
  uint64_t v81 = v5;
  unint64_t v82 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v36 = v61;
  uint64_t v37 = v64;
  sub_10004252C();
  sub_10000D48C(v31, v33, v27);
  swift_bridgeObjectRelease();
  uint64_t v38 = v37;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v9, v37);
  sub_1000022D0(&qword_100051610);
  uint64_t v39 = sub_100042BDC();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(void *)(v40 + 72);
  unint64_t v42 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_1000476F0;
  unint64_t v44 = v43 + v42;
  uint64_t v45 = *(void (**)(unint64_t, void, uint64_t))(v40 + 104);
  v45(v44, enum case for WidgetFamily.systemSmall(_:), v39);
  v45(v44 + v41, enum case for WidgetFamily.systemMedium(_:), v39);
  uint64_t v81 = v38;
  unint64_t v82 = OpaqueTypeConformance2;
  uint64_t v46 = swift_getOpaqueTypeConformance2();
  uint64_t v47 = v66;
  uint64_t v48 = v70;
  sub_10004253C();
  swift_bridgeObjectRelease();
  uint64_t v49 = (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v36, v48);
  (*v63)(v49);
  uint64_t v81 = v48;
  unint64_t v82 = v46;
  uint64_t v50 = swift_getOpaqueTypeConformance2();
  uint64_t v51 = v67;
  uint64_t v52 = v72;
  sub_10004258C();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v47, v52);
  uint64_t v81 = v52;
  unint64_t v82 = v50;
  uint64_t v53 = swift_getOpaqueTypeConformance2();
  id v54 = v68;
  uint64_t v55 = v74;
  sub_10004256C();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v51, v55);
  uint64_t v81 = v55;
  unint64_t v82 = v53;
  uint64_t v56 = swift_getOpaqueTypeConformance2();
  uint64_t v57 = v69;
  uint64_t v58 = v76;
  sub_10004254C();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v54, v58);
  uint64_t v81 = v58;
  unint64_t v82 = v56;
  swift_getOpaqueTypeConformance2();
  uint64_t v59 = v78;
  sub_10004257C();
  return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v57, v59);
}

uint64_t sub_100030F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PeopleWidgetProvider.Entry(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031D68(a1, (uint64_t)v6, type metadata accessor for PeopleWidgetProvider.Entry);
  return sub_1000323E0((uint64_t)v6, a2);
}

uint64_t sub_100031030@<X0>(void *a1@<X8>)
{
  *a1 = 0xD000000000000023;
  a1[1] = 0x8000000100049A50;
  id v2 = [objc_allocWithZone((Class)ACAccountStore) init];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  type metadata accessor for AccountStore();
  uint64_t v4 = swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v5 = (BOOL (**)())((char *)a1 + *(int *)(type metadata accessor for PeopleWidget() + 20));
  sub_10004210C();
  *(void *)(v4 + 112) = &unk_100051558;
  *(void *)(v4 + 120) = v3;
  uint64_t v6 = _s12DependenciesVMa_0();
  sub_100041CBC();
  uint64_t result = sub_100041B8C();
  *uint64_t v5 = sub_10004043C;
  v5[1] = 0;
  v5[2] = (BOOL (*)())v4;
  uint64_t v8 = (BOOL (**)())((char *)v5 + *(int *)(v6 + 32));
  *uint64_t v8 = &unk_100051A90;
  v8[1] = 0;
  return result;
}

uint64_t sub_10003118C()
{
  return swift_deallocObject();
}

uint64_t sub_1000311C4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100031258;
  return sub_10000331C(v2);
}

uint64_t sub_100031258(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for PeopleWidget()
{
  uint64_t result = qword_1000515B8;
  if (!qword_1000515B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_1000313A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v22 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *uint64_t v7 = *(uint64_t *)((char *)a2 + v6);
    v7[1] = v9;
    v7[2] = *(uint64_t *)((char *)a2 + v6 + 16);
    uint64_t v10 = (int *)_s12DependenciesVMa_0();
    uint64_t v11 = v10[6];
    uint64_t v24 = &v8[v11];
    uint64_t v25 = (char *)v7 + v11;
    uint64_t v12 = sub_100041CCC();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v13(v25, v24, v12);
    uint64_t v14 = v10[7];
    uint64_t v15 = (char *)v7 + v14;
    uint64_t v16 = &v8[v14];
    uint64_t v17 = sub_100041B9C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = v10[8];
    uint64_t v19 = (void *)((char *)v7 + v18);
    uint64_t v20 = &v8[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *uint64_t v19 = *(void *)v20;
    v19[1] = v21;
  }
  swift_retain();
  return v3;
}

uint64_t sub_100031534(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v5 = _s12DependenciesVMa_0();
  uint64_t v6 = v4 + *(int *)(v5 + 24);
  uint64_t v7 = sub_100041CCC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v4 + *(int *)(v5 + 28);
  uint64_t v9 = sub_100041B9C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return swift_release();
}

void *sub_100031628(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = *(void *)((char *)a2 + v5 + 8);
  *uint64_t v6 = *(void *)((char *)a2 + v5);
  v6[1] = v8;
  _OWORD v6[2] = *(void *)((char *)a2 + v5 + 16);
  uint64_t v9 = (int *)_s12DependenciesVMa_0();
  uint64_t v10 = v9[6];
  uint64_t v22 = &v7[v10];
  uint64_t v23 = (char *)v6 + v10;
  uint64_t v11 = sub_100041CCC();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v12(v23, v22, v11);
  uint64_t v13 = v9[7];
  uint64_t v14 = (char *)v6 + v13;
  uint64_t v15 = &v7[v13];
  uint64_t v16 = sub_100041B9C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = v9[8];
  uint64_t v18 = (void *)((char *)v6 + v17);
  uint64_t v19 = &v7[v17];
  uint64_t v20 = *((void *)v19 + 1);
  *uint64_t v18 = *(void *)v19;
  v18[1] = v20;
  swift_retain();
  return a1;
}

void *sub_100031768(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *uint64_t v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  swift_retain();
  swift_release();
  v7[2] = *((void *)v8 + 2);
  swift_retain();
  swift_release();
  uint64_t v10 = (int *)_s12DependenciesVMa_0();
  uint64_t v11 = v10[6];
  uint64_t v12 = (char *)v7 + v11;
  uint64_t v13 = &v8[v11];
  uint64_t v14 = sub_100041CCC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = v10[7];
  uint64_t v16 = (char *)v7 + v15;
  uint64_t v17 = &v8[v15];
  uint64_t v18 = sub_100041B9C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = v10[8];
  uint64_t v20 = (void *)((char *)v7 + v19);
  uint64_t v21 = &v8[v19];
  uint64_t v22 = *((void *)v21 + 1);
  void *v20 = *(void *)v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1000318C0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  *(_OWORD *)uint64_t v5 = *(_OWORD *)((char *)a2 + v4);
  *((void *)v5 + 2) = *(void *)((char *)a2 + v4 + 16);
  uint64_t v7 = (int *)_s12DependenciesVMa_0();
  uint64_t v8 = v7[6];
  uint64_t v9 = &v5[v8];
  uint64_t v10 = &v6[v8];
  uint64_t v11 = sub_100041CCC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = v7[7];
  uint64_t v13 = &v5[v12];
  uint64_t v14 = &v6[v12];
  uint64_t v15 = sub_100041B9C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  *(_OWORD *)&v5[v7[8]] = *(_OWORD *)&v6[v7[8]];
  return a1;
}

void *sub_1000319C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(_OWORD *)((char *)a1 + v7) = *(_OWORD *)((char *)a2 + v7);
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  swift_release();
  uint64_t v10 = (int *)_s12DependenciesVMa_0();
  uint64_t v11 = v10[6];
  uint64_t v12 = &v8[v11];
  uint64_t v13 = &v9[v11];
  uint64_t v14 = sub_100041CCC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = v10[7];
  uint64_t v16 = &v8[v15];
  uint64_t v17 = &v9[v15];
  uint64_t v18 = sub_100041B9C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  *(_OWORD *)&v8[v10[8]] = *(_OWORD *)&v9[v10[8]];
  swift_release();
  return a1;
}

uint64_t sub_100031AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031B00);
}

uint64_t sub_100031B00(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = _s12DependenciesVMa_0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100031BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100031BC4);
}

uint64_t sub_100031BC4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = _s12DependenciesVMa_0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100031C6C()
{
  uint64_t result = _s12DependenciesVMa_0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100031D04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100031D20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100031D68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100031DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100031F7C()
{
  uint64_t v0 = type metadata accessor for PeopleWidget();
  __chkstk_darwin(v0);
  uint64_t v2 = (uint64_t *)((char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v13 - v4;
  *uint64_t v2 = 0xD000000000000023;
  v2[1] = 0x8000000100049A50;
  id v6 = [objc_allocWithZone((Class)ACAccountStore) init];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  type metadata accessor for AccountStore();
  uint64_t v8 = swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v9 = (BOOL (**)())((char *)v2 + *(int *)(v0 + 20));
  sub_10004210C();
  *(void *)(v8 + 112) = &unk_100051558;
  *(void *)(v8 + 120) = v7;
  uint64_t v10 = _s12DependenciesVMa_0();
  sub_100041CBC();
  sub_100041B8C();
  char *v9 = sub_10004043C;
  v9[1] = 0;
  v9[2] = (BOOL (*)())v8;
  uint64_t v11 = (BOOL (**)())((char *)v9 + *(int *)(v10 + 32));
  void *v11 = &unk_100051A90;
  v11[1] = 0;
  sub_100032270((uint64_t)v2, (uint64_t)v5);
  sub_1000322D4();
  sub_10004251C();
  return sub_10003232C((uint64_t)v5);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000321B8()
{
  unint64_t result = qword_100051618;
  if (!qword_100051618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051618);
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleWidgetBundle()
{
  return &type metadata for PeopleWidgetBundle;
}

uint64_t sub_10003221C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100032238()
{
  return swift_deallocObject();
}

uint64_t sub_100032270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleWidget();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000322D4()
{
  unint64_t result = qword_100051620;
  if (!qword_100051620)
  {
    type metadata accessor for PeopleWidget();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051620);
  }
  return result;
}

uint64_t sub_10003232C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleWidget();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100032388()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000323E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v209 = a1;
  uint64_t v206 = a2;
  uint64_t v204 = type metadata accessor for WidgetEntryViewContent.Model(0);
  __chkstk_darwin(v204);
  v205 = (char *)&v177 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100041C6C();
  uint64_t v194 = *(void *)(v3 - 8);
  uint64_t v195 = v3;
  __chkstk_darwin(v3);
  v193 = (char *)&v177 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v202 = type metadata accessor for LoadedView.Callout(0);
  __chkstk_darwin(v202);
  v197 = (char *)&v177 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000022D0(&qword_1000507D8);
  __chkstk_darwin(v6 - 8);
  v191 = (char *)&v177 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v196 = (char *)&v177 - v9;
  uint64_t v190 = sub_100041BDC();
  uint64_t v189 = *(void *)(v190 - 8);
  __chkstk_darwin(v190);
  v188 = (char *)&v177 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000022D0(&qword_1000507D0);
  __chkstk_darwin(v11 - 8);
  v192 = (char *)&v177 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = sub_100041C0C();
  uint64_t v185 = *(void *)(v186 - 8);
  __chkstk_darwin(v186);
  v183 = (char *)&v177 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = sub_100041C2C();
  uint64_t v182 = *(void *)(v184 - 8);
  __chkstk_darwin(v184);
  v181 = (char *)&v177 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
  v198 = *(unsigned int (***)(void, void, void))(v200 - 8);
  __chkstk_darwin(v200);
  uint64_t v199 = (uint64_t)&v177 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000022D0(&qword_100051628);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v177 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v201 = (char *)&v177 - v20;
  uint64_t v21 = sub_1000420EC();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v177 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  __chkstk_darwin(v25);
  uint64_t v27 = (unsigned __int8 *)&v177 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = type metadata accessor for WidgetEntryViewContent.Model.State(0);
  __chkstk_darwin(v203);
  v187 = (uint64_t *)((char *)&v177 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)&v177 - v30;
  __chkstk_darwin(v32);
  char v34 = (char *)&v177 - v33;
  __chkstk_darwin(v35);
  uint64_t v207 = (uint64_t)&v177 - v36;
  uint64_t v37 = sub_1000022D0(&qword_100051108);
  __chkstk_darwin(v37 - 8);
  uint64_t v39 = (char *)&v177 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  unint64_t v42 = (char *)&v177 - v41;
  __chkstk_darwin(v43);
  v208 = (char *)&v177 - v44;
  uint64_t v45 = type metadata accessor for PeopleWidgetProvider.Entry(0);
  sub_1000338F8(v209 + *(int *)(v45 + 20), (uint64_t)v27);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v48 = *(void *)v27;
      uint64_t v47 = (void *)*((void *)v27 + 1);
      uint64_t v50 = (char *)*((void *)v27 + 2);
      uint64_t v49 = (unsigned int (**)(void, void, void))*((void *)v27 + 3);
      unsigned __int8 v51 = v27[32];
      uint64_t v52 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      uint64_t v53 = (uint64_t)&v27[v52];
      if (v51)
      {
        uint64_t v54 = (uint64_t)&v27[v52];
        uint64_t v55 = (uint64_t)v201;
        sub_100009178(v54, (uint64_t)v201, &qword_100051628);
        unint64_t v210 = 0xD000000000000010;
        unint64_t v211 = 0x8000000100049AE0;
        v212._countAndFlagsBits = v48;
        v212._object = v47;
        sub_100042D2C(v212);
        sub_100041EBC();
        swift_bridgeObjectRelease();
        sub_10003396C(v55, (uint64_t)v18);
        if (((unsigned int (**)(char *, uint64_t, uint64_t))v198)[6](v18, 1, v200) == 1)
        {
          sub_100009240((uint64_t)v18, &qword_100051628);
          sub_100041BFC();
          uint64_t v56 = sub_1000424DC();
          v198 = v57;
          uint64_t v199 = v56;
          char v59 = v58;
          uint64_t v200 = v60;
          sub_1000339D4(v209, type metadata accessor for PeopleWidgetProvider.Entry);
          sub_100009240(v55, &qword_100051628);
          uint64_t v61 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
          uint64_t v62 = v207;
          uint64_t v63 = v207 + v61[6];
          uint64_t v64 = sub_100041B5C();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v63, 1, 1, v64);
          uint64_t v65 = v62 + v61[7];
          uint64_t v66 = sub_100041D4C();
          uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56);
          v67(v65, 1, 1, v66);
          uint64_t v68 = (void *)(v62 + v61[9]);
          v67((uint64_t)v68 + *(int *)(v202 + 20), 1, 1, v66);

          swift_bridgeObjectRelease();
          *uint64_t v68 = v49;
          uint64_t v69 = v198;
          *(void *)uint64_t v62 = v199;
          *(void *)(v62 + 8) = v69;
          *(unsigned char *)(v62 + 16) = v59 & 1;
          *(void *)(v62 + 24) = v200;
          *(_OWORD *)(v62 + 32) = 0u;
          *(_OWORD *)(v62 + 48) = 0u;
          uint64_t v70 = (void *)(v62 + v61[8]);
          *uint64_t v70 = 0;
          v70[1] = 0;
          *(void *)(v62 + v61[10]) = 0;
          swift_storeEnumTagMultiPayload();
LABEL_29:
          uint64_t v153 = (uint64_t)v205;
          uint64_t v152 = v206;
          uint64_t v154 = v204;
          uint64_t v72 = (uint64_t)v208;
          goto LABEL_30;
        }
        v198 = v49;
        v180 = v47;
        sub_100033A34((uint64_t)v18, v199, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
        uint64_t v94 = v181;
        sub_100041C3C();
        uint64_t v95 = v185;
        uint64_t v96 = v183;
        uint64_t v97 = v186;
        (*(void (**)(char *, void, uint64_t))(v185 + 104))(v183, enum case for PublishedLocation.Label.DetailLevel.compact(_:), v186);
        sub_100041C1C();
        uint64_t v99 = v98;
        (*(void (**)(char *, uint64_t))(v95 + 8))(v96, v97);
        (*(void (**)(char *, uint64_t))(v182 + 8))(v94, v184);
        swift_bridgeObjectRetain();
        uint64_t v100 = sub_1000424DC();
        uint64_t v186 = v101;
        uint64_t v185 = v100;
        uint64_t v184 = v102;
        LODWORD(v183) = v103;
        uint64_t v104 = v50;
        if (v99)
        {
          swift_bridgeObjectRetain();
          uint64_t v182 = sub_1000424DC();
          v181 = v105;
          char v107 = v106;
          uint64_t v179 = v108;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v178 = v107 & 1;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v182 = 0;
          v181 = 0;
          uint64_t v178 = 0;
          uint64_t v179 = 0;
        }
        uint64_t v155 = v202;
        v156 = v197;
        uint64_t v157 = (uint64_t)v192;
        uint64_t v158 = v199;
        sub_100041C8C();
        uint64_t v159 = sub_100041B5C();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v159 - 8) + 56))(v157, 0, 1, v159);
        v160 = v188;
        sub_100041BEC();
        uint64_t v161 = (uint64_t)v196;
        sub_100041BCC();
        (*(void (**)(char *, uint64_t))(v189 + 8))(v160, v190);
        v162 = v198;
        v163 = v193;
        sub_100041C7C();
        uint64_t v164 = (uint64_t)v191;
        sub_100041C5C();
        (*(void (**)(char *, uint64_t))(v194 + 8))(v163, v195);
        void *v156 = v162;
        sub_100009178(v164, (uint64_t)v156 + *(int *)(v155 + 20), &qword_1000507D8);
        v165 = *(void **)(v158 + *(int *)(v200 + 20));
        id v166 = v165;

        swift_bridgeObjectRelease();
        sub_1000339D4(v209, type metadata accessor for PeopleWidgetProvider.Entry);

        sub_1000339D4(v158, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
        sub_100009240((uint64_t)v201, &qword_100051628);
        v167 = v187;
        uint64_t v168 = v184;
        uint64_t *v187 = v185;
        v167[1] = v168;
        *((unsigned char *)v167 + 16) = v183 & 1;
        uint64_t v169 = v182;
        v167[3] = v186;
        v167[4] = v169;
        uint64_t v170 = v178;
        v167[5] = (uint64_t)v181;
        v167[6] = v170;
        v167[7] = v179;
        v171 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
        sub_100009178(v157, (uint64_t)v167 + v171[6], &qword_1000507D0);
        sub_100009178(v161, (uint64_t)v167 + v171[7], &qword_1000507D8);
        v172 = (uint64_t *)((char *)v167 + v171[8]);
        void *v172 = 0;
        v172[1] = 0;
        sub_100033A34((uint64_t)v156, (uint64_t)v167 + v171[9], type metadata accessor for LoadedView.Callout);
        *(uint64_t *)((char *)v167 + v171[10]) = (uint64_t)v165;
        swift_storeEnumTagMultiPayload();
        uint64_t v139 = (uint64_t)v167;
        uint64_t v62 = v207;
LABEL_28:
        sub_100033A34(v139, v62, type metadata accessor for WidgetEntryViewContent.Model.State);
        goto LABEL_29;
      }
      v198 = v49;
      v201 = v50;
      int v84 = v27[33];
      uint64_t v199 = sub_1000424BC();
      uint64_t v200 = v85;
      v197 = v86;
      LODWORD(v196) = v87;
      if (v84 == 1)
      {
        uint64_t v88 = sub_1000424BC();
        uint64_t v194 = v89;
        uint64_t v195 = v88;
        uint64_t v91 = v90;
        uint64_t v93 = v92 & 1;
      }
      else
      {
        uint64_t v194 = 0;
        uint64_t v195 = 0;
        uint64_t v93 = 0;
        uint64_t v91 = 0;
      }
      uint64_t v140 = v209;
      unint64_t v210 = 0xD000000000000010;
      unint64_t v211 = 0x8000000100049AE0;
      v213._countAndFlagsBits = v48;
      v213._object = v47;
      sub_100042D2C(v213);
      sub_100041EBC();
      swift_bridgeObjectRelease();
      sub_1000339D4(v140, type metadata accessor for PeopleWidgetProvider.Entry);
      uint64_t v141 = (int *)type metadata accessor for WidgetEntryViewContent.Model.State.Loaded(0);
      uint64_t v142 = v207;
      uint64_t v143 = v207 + v141[6];
      uint64_t v144 = sub_100041B5C();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v144 - 8) + 56))(v143, 1, 1, v144);
      uint64_t v145 = v142 + v141[7];
      uint64_t v146 = sub_100041D4C();
      uint64_t v147 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v146 - 8) + 56);
      v147(v145, 1, 1, v146);
      v148 = (void *)(v142 + v141[9]);
      v147((uint64_t)v148 + *(int *)(v202 + 20), 1, 1, v146);
      uint64_t v72 = (uint64_t)v208;

      swift_bridgeObjectRelease();
      void *v148 = v198;
      uint64_t v62 = v142;
      uint64_t v149 = v197;
      *(void *)uint64_t v142 = v199;
      *(void *)(v142 + 8) = v149;
      *(unsigned char *)(v142 + 16) = v196 & 1;
      uint64_t v150 = v195;
      *(void *)(v142 + 24) = v200;
      *(void *)(v142 + 32) = v150;
      *(void *)(v142 + 40) = v194;
      *(void *)(v142 + 48) = v93;
      *(void *)(v142 + 56) = v91;
      v151 = (void *)(v142 + v141[8]);
      void *v151 = 0;
      v151[1] = 0;
      *(void *)(v142 + v141[10]) = 1;
      swift_storeEnumTagMultiPayload();
      sub_100009240(v53, &qword_100051628);
    }
    else
    {
      sub_1000339D4(v209, type metadata accessor for PeopleWidgetProvider.Entry);
      uint64_t v83 = sub_100041ECC();
      uint64_t v72 = (uint64_t)v208;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 56))(v208, 1, 1, v83);
      uint64_t v62 = v207;
      swift_storeEnumTagMultiPayload();
    }
LABEL_25:
    uint64_t v153 = (uint64_t)v205;
    uint64_t v152 = v206;
    uint64_t v154 = v204;
LABEL_30:
    sub_100009178(v72, v153, &qword_100051108);
    sub_100033A34(v62, v153 + *(int *)(v154 + 20), type metadata accessor for WidgetEntryViewContent.Model.State);
    uint64_t v173 = type metadata accessor for WidgetEntryView(0);
    v174 = (uint64_t *)(v152 + *(int *)(v173 + 20));
    uint64_t *v174 = swift_getKeyPath();
    sub_1000022D0(&qword_1000502F8);
    swift_storeEnumTagMultiPayload();
    v175 = (uint64_t *)(v152 + *(int *)(v173 + 24));
    uint64_t *v175 = swift_getKeyPath();
    sub_1000022D0(&qword_100050300);
    swift_storeEnumTagMultiPayload();
    return sub_100033A34(v153, v152, type metadata accessor for WidgetEntryViewContent.Model);
  }
  int v71 = *v27;
  if (v71 == 1)
  {
    uint64_t v109 = sub_100041ECC();
    uint64_t v72 = (uint64_t)v208;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56))(v208, 1, 1, v109);
    uint64_t v110 = sub_1000424BC();
    uint64_t v112 = v111;
    char v114 = v113;
    uint64_t v116 = v115;
    sub_1000339D4(v209, type metadata accessor for PeopleWidgetProvider.Entry);
    *(void *)char v34 = v110;
    *((void *)v34 + 1) = v112;
    v34[16] = v114 & 1;
    *((void *)v34 + 3) = v116;
LABEL_18:
    swift_storeEnumTagMultiPayload();
    uint64_t v117 = (uint64_t)v34;
    uint64_t v62 = v207;
    sub_100033A34(v117, v207, type metadata accessor for WidgetEntryViewContent.Model.State);
    goto LABEL_25;
  }
  uint64_t v72 = (uint64_t)v208;
  if (v71 != 3)
  {
    if (v71 == 2)
    {
      uint64_t v73 = sub_100041ECC();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v72, 1, 1, v73);
      if (qword_1000502F0 != -1) {
        swift_once();
      }
      uint64_t v74 = sub_100003E70(v21, (uint64_t)qword_100053150);
      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v74, v21);
      uint64_t v75 = sub_1000424BC();
      uint64_t v77 = v76;
      char v79 = v78;
      uint64_t v81 = v80;
      sub_1000339D4(v209, type metadata accessor for PeopleWidgetProvider.Entry);
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v34, v24, v21);
      unint64_t v82 = &v34[*(int *)(type metadata accessor for WidgetEntryViewContent.Model.State.CenteredImage(0) + 20)];
      *(void *)unint64_t v82 = v75;
      *((void *)v82 + 1) = v77;
      v82[16] = v79 & 1;
      *((void *)v82 + 3) = v81;
      goto LABEL_18;
    }
    uint64_t v135 = sub_100041ECC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v135 - 8) + 56))(v42, 1, 1, v135);
    sub_100009178((uint64_t)v42, v72, &qword_100051108);
    uint64_t v121 = sub_1000424BC();
    uint64_t v123 = v136;
    char v125 = v137;
    uint64_t v127 = v138;
    uint64_t v128 = 0;
    uint64_t v130 = 0;
    uint64_t v134 = 0;
    uint64_t v132 = 0;
    uint64_t v62 = v207;
LABEL_22:
    sub_1000339D4(v209, type metadata accessor for PeopleWidgetProvider.Entry);
    *(void *)uint64_t v31 = v121;
    *((void *)v31 + 1) = v123;
    v31[16] = v125 & 1;
    *((void *)v31 + 3) = v127;
    *((void *)v31 + 4) = v128;
    *((void *)v31 + 5) = v130;
    *((void *)v31 + 6) = v134;
    *((void *)v31 + 7) = v132;
    swift_storeEnumTagMultiPayload();
    uint64_t v139 = (uint64_t)v31;
    goto LABEL_28;
  }
  sub_100041EBC();
  uint64_t v118 = sub_100041ECC();
  uint64_t v119 = *(void *)(v118 - 8);
  int v120 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v119 + 48))(v39, 1, v118);
  uint64_t v62 = v207;
  if (v120 != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v119 + 32))(v42, v39, v118);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v119 + 56))(v42, 0, 1, v118);
    sub_100009178((uint64_t)v42, v72, &qword_100051108);
    uint64_t v121 = sub_1000424BC();
    uint64_t v123 = v122;
    char v125 = v124;
    uint64_t v127 = v126;
    uint64_t v128 = sub_1000424BC();
    uint64_t v130 = v129;
    uint64_t v132 = v131;
    uint64_t v134 = v133 & 1;
    goto LABEL_22;
  }
  uint64_t result = sub_100009240((uint64_t)v39, &qword_100051108);
  __break(1u);
  return result;
}

uint64_t sub_1000338F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003396C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_100051628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000339D4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100033A34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100033AA0()
{
  unint64_t result = qword_100051638;
  if (!qword_100051638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051638);
  }
  return result;
}

unint64_t sub_100033AF8()
{
  unint64_t result = qword_100051640;
  if (!qword_100051640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051640);
  }
  return result;
}

unint64_t sub_100033B50()
{
  unint64_t result = qword_100051648;
  if (!qword_100051648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051648);
  }
  return result;
}

uint64_t sub_100033BA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100033BF4()
{
  uint64_t v0 = sub_100041EAC();
  sub_100005928(v0, qword_100053090);
  sub_100003E70(v0, (uint64_t)qword_100053090);
  return sub_100041E9C();
}

uint64_t sub_100033C58@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000502A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100041EAC();
  uint64_t v3 = sub_100003E70(v2, (uint64_t)qword_100053090);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100033D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100034250();
  *uint64_t v4 = v2;
  v4[1] = sub_1000047D0;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_100033DAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100033E90();
  *a1 = result;
  return result;
}

uint64_t sub_100033DD4(uint64_t a1)
{
  unint64_t v2 = sub_100033E3C();

  return static CustomIntentMigratedAppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100033E10()
{
  return 0xD000000000000014;
}

ValueMetadata *type metadata accessor for PeopleWidgetIntent()
{
  return &type metadata for PeopleWidgetIntent;
}

unint64_t sub_100033E3C()
{
  unint64_t result = qword_100051658;
  if (!qword_100051658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051658);
  }
  return result;
}

uint64_t sub_100033E90()
{
  uint64_t v22 = sub_100041B1C();
  uint64_t v0 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  unint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000022D0(&qword_100051660);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_1000022D0(&qword_100051668);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000022D0(&qword_100051670);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100041EAC();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v21 = sub_1000022D0(&qword_100051678);
  sub_100041E9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  uint64_t v17 = sub_100041B7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  uint64_t v18 = sub_100041ADC();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v8, 1, 1, v18);
  v19(v5, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v22);
  sub_1000341F8();
  return sub_100041AFC();
}

unint64_t sub_1000341F8()
{
  unint64_t result = qword_100051680;
  if (!qword_100051680)
  {
    sub_100041B7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051680);
  }
  return result;
}

unint64_t sub_100034250()
{
  unint64_t result = qword_100051688;
  if (!qword_100051688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100051688);
  }
  return result;
}

uint64_t sub_1000342A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100042D8C();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100042D7C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100009240(a1, &qword_100050580);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100042D6C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100034450(uint64_t a1)
{
  sub_10004210C();
  sub_10003CFF0(a1, v1 + OBJC_IVAR____TtC18FindMyWidgetPeople20PeopleWidgetProvider_dependencies, (uint64_t (*)(void))_s12DependenciesVMa_0);
  swift_retain_n();
  uint64_t v3 = sub_1000420FC();
  os_log_type_t v4 = sub_100042E0C();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 136446210;
    unint64_t v6 = sub_100034664(0xD000000000000013, (void *)0x8000000100049F10);
    sub_10003C7DC(v6, v7, &v9);
    sub_100042E3C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  sub_10003D058(a1, (uint64_t (*)(void))_s12DependenciesVMa_0);
  return v1;
}

unint64_t sub_100034664(uint64_t a1, void *a2)
{
  sub_100042E6C(28);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = sub_100042CFC();
  sub_100042D2C(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 2108704;
  v6._object = (void *)0xE300000000000000;
  sub_100042D2C(v6);
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  sub_100042D2C(v7);
  return 0xD000000000000015;
}

uint64_t sub_100034718()
{
  swift_retain_n();
  uint64_t v0 = sub_1000420FC();
  os_log_type_t v1 = sub_100042E0C();
  if (os_log_type_enabled(v0, v1))
  {
    unint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)unint64_t v2 = 136446210;
    unint64_t v3 = sub_100034664(0xD000000000000010, (void *)0x8000000100049EF0);
    sub_10003C7DC(v3, v4, &v6);
    sub_100042E3C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "%{public}s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  sub_100041EEC();
  type metadata accessor for PeopleWidgetProvider.Entry(0);
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1000348D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[31] = a3;
  v4[32] = v3;
  v4[29] = a1;
  v4[30] = a2;
  uint64_t v5 = sub_100042C9C();
  v4[33] = v5;
  v4[34] = *(void *)(v5 - 8);
  v4[35] = swift_task_alloc();
  uint64_t v6 = sub_100041B9C();
  v4[36] = v6;
  v4[37] = *(void *)(v6 - 8);
  v4[38] = swift_task_alloc();
  uint64_t v7 = sub_100041BBC();
  v4[39] = v7;
  v4[40] = *(void *)(v7 - 8);
  v4[41] = swift_task_alloc();
  uint64_t v8 = sub_1000022D0(&qword_1000517C8);
  v4[42] = v8;
  v4[43] = *(void *)(v8 - 8);
  v4[44] = swift_task_alloc();
  uint64_t v9 = sub_100041F0C();
  v4[45] = v9;
  v4[46] = *(void *)(v9 - 8);
  v4[47] = swift_task_alloc();
  v4[48] = type metadata accessor for PeopleWidgetProvider.Entry(0);
  v4[49] = swift_task_alloc();
  v4[50] = swift_task_alloc();
  v4[51] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
  v4[52] = v10;
  v4[53] = *(void *)(v10 - 8);
  v4[54] = swift_task_alloc();
  uint64_t v11 = sub_100042BDC();
  v4[55] = v11;
  v4[56] = *(void *)(v11 - 8);
  v4[57] = swift_task_alloc();
  uint64_t v12 = sub_100041E7C();
  v4[58] = v12;
  v4[59] = *(void *)(v12 - 8);
  v4[60] = swift_task_alloc();
  uint64_t v13 = sub_100041C9C();
  v4[61] = v13;
  v4[62] = *(void *)(v13 - 8);
  v4[63] = swift_task_alloc();
  uint64_t v14 = sub_100041CFC();
  v4[64] = v14;
  v4[65] = *(void *)(v14 - 8);
  v4[66] = swift_task_alloc();
  uint64_t v15 = sub_100041CAC();
  v4[67] = v15;
  v4[68] = *(void *)(v15 - 8);
  v4[69] = swift_task_alloc();
  v4[70] = swift_task_alloc();
  v4[71] = swift_task_alloc();
  v4[72] = swift_task_alloc();
  v4[73] = sub_1000022D0(&qword_1000517D0);
  v4[74] = swift_task_alloc();
  v4[75] = swift_task_alloc();
  v4[76] = swift_task_alloc();
  v4[77] = swift_task_alloc();
  v4[78] = swift_task_alloc();
  uint64_t v16 = sub_100041CCC();
  v4[79] = v16;
  v4[80] = *(void *)(v16 - 8);
  v4[81] = swift_task_alloc();
  uint64_t v17 = sub_100041D2C();
  v4[82] = v17;
  v4[83] = *(void *)(v17 - 8);
  v4[84] = swift_task_alloc();
  uint64_t v18 = sub_100041D7C();
  v4[85] = v18;
  v4[86] = *(void *)(v18 - 8);
  v4[87] = swift_task_alloc();
  v4[88] = swift_task_alloc();
  uint64_t v19 = sub_100041D9C();
  v4[89] = v19;
  v4[90] = *(void *)(v19 - 8);
  v4[91] = swift_task_alloc();
  v4[92] = swift_task_alloc();
  uint64_t v20 = sub_100041DDC();
  v4[93] = v20;
  v4[94] = *(void *)(v20 - 8);
  v4[95] = swift_task_alloc();
  uint64_t v21 = sub_10004226C();
  v4[96] = v21;
  v4[97] = *(void *)(v21 - 8);
  v4[98] = swift_task_alloc();
  v4[99] = sub_1000022D0(&qword_1000517D8);
  v4[100] = swift_task_alloc();
  uint64_t v22 = sub_100042C5C();
  v4[101] = v22;
  v4[102] = *(void *)(v22 - 8);
  v4[103] = swift_task_alloc();
  v4[104] = swift_task_alloc();
  sub_1000022D0(&qword_1000517E0);
  v4[105] = swift_task_alloc();
  v4[106] = swift_task_alloc();
  v4[107] = swift_task_alloc();
  uint64_t v23 = sub_100041DFC();
  v4[108] = v23;
  v4[109] = *(void *)(v23 - 8);
  v4[110] = swift_task_alloc();
  uint64_t v24 = sub_100041E4C();
  v4[111] = v24;
  v4[112] = *(void *)(v24 - 8);
  v4[113] = swift_task_alloc();
  v4[114] = swift_task_alloc();
  v4[115] = swift_task_alloc();
  sub_1000022D0(&qword_100051668);
  v4[116] = swift_task_alloc();
  v4[117] = swift_task_alloc();
  uint64_t v25 = sub_100041B7C();
  v4[118] = v25;
  v4[119] = *(void *)(v25 - 8);
  v4[120] = swift_task_alloc();
  return _swift_task_switch(sub_1000352E0, 0, 0);
}

uint64_t sub_1000352E0()
{
  uint64_t v9 = v0;
  v0[121] = OBJC_IVAR____TtC18FindMyWidgetPeople20PeopleWidgetProvider_logger;
  swift_retain_n();
  os_log_type_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042E0C();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446210;
    unint64_t v4 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    v0[27] = sub_10003C7DC(v4, v5, &v8);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s - Start", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  v0[122] = OBJC_IVAR____TtC18FindMyWidgetPeople20PeopleWidgetProvider_dependencies;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[123] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_100035524;
  return sub_1000027DC();
}

uint64_t sub_100035524(char a1)
{
  *(unsigned char *)(*(void *)v2 + 51) = a1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v3 = sub_100038780;
  }
  else {
    uint64_t v3 = sub_100035664;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100035664()
{
  uint64_t v51 = v0;
  swift_retain_n();
  uint64_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042E0C();
  if (os_log_type_enabled(v1, v2))
  {
    char v3 = *(unsigned char *)(v0 + 51);
    uint64_t v4 = swift_slowAlloc();
    v50[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446467;
    unint64_t v5 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 208) = sub_10003C7DC(v5, v6, v50);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v4 + 12) = 2081;
    *(unsigned char *)(v0 + 50) = v3;
    uint64_t v7 = sub_100042D1C();
    *(void *)(v0 + 224) = sub_10003C7DC(v7, v8, v50);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s - AccountInfo %{private}s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  if (*(unsigned char *)(v0 + 51) == 1)
  {
    uint64_t v9 = *(void *)(v0 + 952);
    uint64_t v10 = *(void *)(v0 + 944);
    uint64_t v11 = *(void *)(v0 + 936);
    sub_100041AEC();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v11, 1, v10) == 1)
    {
      sub_100009240(*(void *)(v0 + 936), &qword_100051668);
      swift_retain_n();
      swift_retain_n();
      uint64_t v12 = sub_1000420FC();
      os_log_type_t v13 = sub_100042E0C();
      BOOL v14 = os_log_type_enabled(v12, v13);
      uint64_t v15 = *(void *)(v0 + 240);
      if (v14)
      {
        uint64_t v16 = swift_slowAlloc();
        v50[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136446466;
        unint64_t v17 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
        *(void *)(v0 + 72) = sub_10003C7DC(v17, v18, v50);
        sub_100042E3C();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v16 + 12) = 2080;
        *(void *)(v0 + 80) = v15;
        swift_retain();
        uint64_t v19 = sub_100042D1C();
        *(void *)(v0 + 88) = sub_10003C7DC(v19, v20, v50);
        sub_100042E3C();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}s - No Entity in configuration: %s", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
        swift_release_n();
      }
      uint64_t v40 = *(void *)(v0 + 296);
      uint64_t v39 = *(void *)(v0 + 304);
      uint64_t v41 = *(void *)(v0 + 288);
      uint64_t v42 = *(void *)(v0 + 256) + *(void *)(v0 + 976);
      uint64_t v43 = _s12DependenciesVMa_0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v39, v42 + *(int *)(v43 + 28), v41);
      sub_100041BAC();
      uint64_t v44 = (void *)swift_task_alloc();
      *(void *)(v0 + 1112) = v44;
      uint64_t v45 = sub_10003D0D8(&qword_1000517E8, (void (*)(uint64_t))&type metadata accessor for PersonEntityQuery);
      *uint64_t v44 = v0;
      v44[1] = sub_1000381B4;
      uint64_t v46 = *(void *)(v0 + 352);
      uint64_t v47 = *(void *)(v0 + 312);
      return EntityQuery.results()(v46, v47, v45);
    }
    else
    {
      uint64_t v28 = *(void *)(v0 + 920);
      uint64_t v29 = *(void *)(v0 + 896);
      uint64_t v30 = *(void *)(v0 + 888);
      uint64_t v31 = *(void *)(v0 + 880);
      uint64_t v32 = *(void *)(v0 + 872);
      uint64_t v48 = *(void *)(v0 + 864);
      uint64_t v33 = *(void *)(v0 + 256) + *(void *)(v0 + 976);
      (*(void (**)(void, void, void))(*(void *)(v0 + 952) + 32))(*(void *)(v0 + 960), *(void *)(v0 + 936), *(void *)(v0 + 944));
      uint64_t v34 = _s12DependenciesVMa_0();
      *(void *)(v0 + 992) = v34;
      uint64_t v35 = *(int **)(v33 + *(int *)(v34 + 32));
      sub_1000022D0(&qword_1000517F0);
      sub_100041E1C();
      uint64_t v36 = swift_allocObject();
      *(void *)(v0 + 1000) = v36;
      *(_OWORD *)(v36 + 16) = xmmword_100046410;
      sub_100041B6C();
      sub_100041E2C();
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      *(void *)(v0 + 1008) = v37;
      *(void *)(v0 + 1016) = (v29 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v37(v28, v30);
      sub_100041DEC();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v48);
      uint64_t v49 = (uint64_t (*)(uint64_t))((char *)v35 + *v35);
      uint64_t v38 = (void *)swift_task_alloc();
      *(void *)(v0 + 1024) = v38;
      void *v38 = v0;
      v38[1] = sub_10003608C;
      return v49(v36);
    }
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 384);
    uint64_t v22 = *(void *)(v0 + 232);
    char v23 = sub_100042C8C();
    sub_100041EEC();
    uint64_t v24 = (char *)(v22 + *(int *)(v21 + 20));
    if (v23) {
      char v25 = 2;
    }
    else {
      char v25 = 3;
    }
    *uint64_t v24 = v25;
    type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    swift_storeEnumTagMultiPayload();
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
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
}

uint64_t sub_10003608C()
{
  *(void *)(*(void *)v1 + 1032) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v2 = sub_1000391C4;
  }
  else
  {
    swift_bridgeObjectRelease();
    os_log_type_t v2 = sub_1000361DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000361DC()
{
  uint64_t v88 = v0;
  uint64_t v1 = *(void *)(v0 + 832);
  uint64_t v2 = *(void *)(v0 + 816);
  uint64_t v3 = *(void *)(v0 + 808);
  sub_100042C3C();
  *(void *)(v0 + 1040) = v4;
  *(void *)(v0 + 1048) = v5;
  sub_100042C6C();
  swift_getKeyPath();
  uint64_t v6 = sub_100042C4C();
  swift_release();
  int v84 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v84(v1, v3);
  if (v6)
  {
    uint64_t v7 = *(void *)(v0 + 856);
    uint64_t v8 = *(void *)(v0 + 776);
    uint64_t v9 = *(void *)(v0 + 768);
    if (*(void *)(v6 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v8 + 16))(*(void *)(v0 + 856), v6 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), *(void *)(v0 + 768));
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v10(v7, 0, 1, v9);
    }
    else
    {
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v10(*(void *)(v0 + 856), 1, 1, v9);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 776) + 56);
    v10(*(void *)(v0 + 856), 1, 1, *(void *)(v0 + 768));
  }
  uint64_t v11 = *(void *)(v0 + 856);
  uint64_t v12 = *(void *)(v0 + 848);
  uint64_t v13 = *(void *)(v0 + 800);
  uint64_t v14 = *(void *)(v0 + 792);
  uint64_t v15 = *(void *)(v0 + 776);
  uint64_t v16 = *(void *)(v0 + 768);
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v12, enum case for LayoutDirection.rightToLeft(_:), v16);
  v10(v12, 0, 1, v16);
  uint64_t v17 = v13 + *(int *)(v14 + 48);
  sub_1000091DC(v11, v13, &qword_1000517E0);
  sub_1000091DC(v12, v17, &qword_1000517E0);
  unint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  if (v18(v13, 1, v16) == 1)
  {
    uint64_t v19 = *(void *)(v0 + 856);
    uint64_t v20 = *(void *)(v0 + 768);
    sub_100009240(*(void *)(v0 + 848), &qword_1000517E0);
    sub_100009240(v19, &qword_1000517E0);
    if (v18(v17, 1, v20) == 1)
    {
      sub_100009240(*(void *)(v0 + 800), &qword_1000517E0);
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  uint64_t v21 = *(void *)(v0 + 768);
  sub_1000091DC(*(void *)(v0 + 800), *(void *)(v0 + 840), &qword_1000517E0);
  unsigned int v22 = v18(v17, 1, v21);
  uint64_t v23 = *(void *)(v0 + 856);
  uint64_t v24 = *(void *)(v0 + 848);
  uint64_t v25 = *(void *)(v0 + 840);
  if (v22 == 1)
  {
    uint64_t v26 = *(void *)(v0 + 776);
    uint64_t v27 = *(void *)(v0 + 768);
    sub_100009240(*(void *)(v0 + 848), &qword_1000517E0);
    sub_100009240(v23, &qword_1000517E0);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
LABEL_12:
    sub_100009240(*(void *)(v0 + 800), &qword_1000517D8);
    goto LABEL_14;
  }
  uint64_t v82 = *(void *)(v0 + 800);
  uint64_t v28 = *(void *)(v0 + 784);
  uint64_t v29 = *(void *)(v0 + 776);
  uint64_t v30 = *(void *)(v0 + 768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v28, v17, v30);
  sub_10003D0D8(&qword_100051800, (void (*)(uint64_t))&type metadata accessor for LayoutDirection);
  sub_100042D0C();
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v31(v28, v30);
  sub_100009240(v24, &qword_1000517E0);
  sub_100009240(v23, &qword_1000517E0);
  v31(v25, v30);
  sub_100009240(v82, &qword_1000517E0);
LABEL_14:
  uint64_t v32 = *(void *)(v0 + 824);
  uint64_t v33 = *(void *)(v0 + 808);
  sub_100042C6C();
  swift_getKeyPath();
  uint64_t v34 = sub_100042C4C();
  swift_release();
  v84(v32, v33);
  if (v34) {
    swift_bridgeObjectRelease();
  }
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 1008);
  uint64_t v36 = *(void *)(v0 + 920);
  uint64_t v37 = *(void *)(v0 + 888);
  uint64_t v38 = *(void *)(v0 + 760);
  uint64_t v72 = *(void *)(v0 + 752);
  uint64_t v74 = *(void *)(v0 + 744);
  uint64_t v68 = *(void *)(v0 + 912);
  uint64_t v69 = *(void *)(v0 + 736);
  uint64_t v78 = *(void *)(v0 + 728);
  uint64_t v79 = *(void *)(v0 + 904);
  uint64_t v83 = *(void *)(v0 + 720);
  uint64_t v76 = *(void *)(v0 + 712);
  uint64_t v71 = *(void *)(v0 + 704);
  uint64_t v80 = *(void *)(v0 + 696);
  uint64_t v85 = *(void *)(v0 + 688);
  uint64_t v77 = *(void *)(v0 + 680);
  sub_100041B6C();
  Class isa = sub_100041DAC().super.isa;
  *(void *)(v0 + 1056) = isa;
  v35(v36, v37);
  uint64_t v40 = (void *)sub_10004204C();
  *(void *)(v0 + 1064) = v40;
  sub_100041B6C();
  sub_100041E3C();
  v35(v36, v37);
  uint64_t v41 = sub_100041DCC();
  uint64_t v81 = v42;
  uint64_t v67 = v41;
  *(void *)(v0 + 1072) = v41;
  *(void *)(v0 + 1080) = v42;
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v38, v74);
  uint64_t v75 = isa;
  id v73 = v40;
  sub_100041B6C();
  sub_100041DBC();
  v35(v68, v37);
  sub_100041D8C();
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
  v43(v69, v76);
  char v70 = sub_100041D6C() & 1;
  *(unsigned char *)(v0 + 52) = v70;
  uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  v44(v71, v77);
  sub_100041B6C();
  sub_100041DBC();
  v35(v79, v37);
  sub_100041D8C();
  v43(v78, v76);
  char v45 = sub_100041D5C() & 1;
  *(unsigned char *)(v0 + 53) = v45;
  v44(v80, v77);
  swift_retain_n();
  uint64_t v46 = v75;
  id v47 = v73;
  swift_bridgeObjectRetain_n();
  uint64_t v48 = v46;
  id v49 = v47;
  uint64_t v50 = sub_1000420FC();
  os_log_type_t v51 = sub_100042E0C();
  if (os_log_type_enabled(v50, v51))
  {
    os_log_type_t v86 = v51;
    uint64_t v52 = swift_slowAlloc();
    v87[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 136446467;
    unint64_t v53 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 168) = sub_10003C7DC(v53, v54, v87);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v52 + 12) = 2081;
    *(void *)(v0 + 16) = v67;
    *(void *)(v0 + 24) = v81;
    *(void *)(v0 + 32) = v48;
    *(void *)(v0 + 40) = v49;
    *(unsigned char *)(v0 + 48) = v70;
    *(unsigned char *)(v0 + 49) = v45;
    uint64_t v55 = v48;
    id v56 = v49;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_100042D1C();
    *(void *)(v0 + 184) = sub_10003C7DC(v57, v58, v87);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();

    _os_log_impl((void *)&_mh_execute_header, v50, v86, "%{public}s - PersonInfo %{private}s", (uint8_t *)v52, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v59 = *(void *)(v0 + 960);
  uint64_t v60 = *(void *)(v0 + 952);
  uint64_t v61 = *(void *)(v0 + 944);
  uint64_t v62 = *(void *)(v0 + 928);
  (*(void (**)(void, void, void))(*(void *)(v0 + 640) + 16))(*(void *)(v0 + 648), *(void *)(v0 + 256) + *(void *)(v0 + 976) + *(int *)(*(void *)(v0 + 992) + 24), *(void *)(v0 + 632));
  sub_100041CDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v62, v59, v61);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v62, 0, 1, v61);
  sub_100041D0C();
  uint64_t v63 = (void *)swift_task_alloc();
  *(void *)(v0 + 1088) = v63;
  *uint64_t v63 = v0;
  v63[1] = sub_100036C48;
  uint64_t v64 = *(void *)(v0 + 616);
  uint64_t v65 = *(void *)(v0 + 568);
  return _s10FindMyCore29GetPersonCachedLocationIntentV7performAC6ResultVyYaAC05FetchG5ErrorOYKF(v64, v65);
}

uint64_t sub_100036C48()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_100039E38;
  }
  else {
    uint64_t v1 = sub_100036D84;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_100036D84()
{
  uint64_t v54 = v0;
  uint64_t v1 = *(void *)(v0 + 624);
  uint64_t v2 = *(void *)(v0 + 616);
  uint64_t v3 = *(void *)(v0 + 608);
  (*(void (**)(uint64_t, void, uint64_t, void))(*(void *)(v0 + 520) + 56))(v2, 0, 1, *(void *)(v0 + 512));
  sub_10003D200(v2, v1);
  sub_1000091DC(v1, v3, &qword_1000517D0);
  swift_retain_n();
  uint64_t v4 = sub_1000420FC();
  os_log_type_t v5 = sub_100042E0C();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 600);
    uint64_t v50 = *(void *)(v0 + 608);
    uint64_t v7 = swift_slowAlloc();
    v53[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446467;
    unint64_t v8 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 152) = sub_10003C7DC(v8, v9, v53);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v7 + 12) = 2081;
    sub_1000091DC(v50, v6, &qword_1000517D0);
    uint64_t v10 = sub_100042D1C();
    *(void *)(v0 + 160) = sub_10003C7DC(v10, v11, v53);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    sub_100009240(v50, &qword_1000517D0);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s - LocationResult %{private}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 608);

    swift_release_n();
    sub_100009240(v12, &qword_1000517D0);
  }
  uint64_t v13 = *(void *)(v0 + 592);
  uint64_t v14 = *(void *)(v0 + 520);
  uint64_t v15 = *(void *)(v0 + 512);
  sub_1000091DC(*(void *)(v0 + 624), v13, &qword_1000517D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v13, 1, v15) == 1)
  {
    char v51 = *(unsigned char *)(v0 + 53);
    char v49 = *(unsigned char *)(v0 + 52);
    uint64_t v48 = *(void *)(v0 + 1080);
    uint64_t v16 = *(void **)(v0 + 1064);
    uint64_t v17 = *(void **)(v0 + 1056);
    uint64_t v45 = *(void *)(v0 + 960);
    uint64_t v46 = *(void *)(v0 + 1072);
    uint64_t v18 = *(void *)(v0 + 952);
    uint64_t v44 = *(void *)(v0 + 944);
    uint64_t v19 = *(void *)(v0 + 664);
    uint64_t v40 = *(void *)(v0 + 656);
    uint64_t v41 = *(void *)(v0 + 672);
    uint64_t v20 = *(void *)(v0 + 624);
    uint64_t v21 = *(void *)(v0 + 424);
    uint64_t v47 = *(void *)(v0 + 416);
    uint64_t v22 = *(void *)(v0 + 376);
    uint64_t v43 = *(void *)(v0 + 384);
    uint64_t v23 = *(void *)(v0 + 368);
    uint64_t v52 = *(void *)(v0 + 360);
    uint64_t v42 = *(void *)(v0 + 232);
    sub_100009240(*(void *)(v0 + 592), &qword_1000517D0);
    sub_100041EEC();

    sub_100009240(v20, &qword_1000517D0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v41, v40);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v45, v44);
    uint64_t v24 = v42 + *(int *)(v43 + 20);
    uint64_t v25 = v24 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
    *(void *)uint64_t v24 = v46;
    *(void *)(v24 + 8) = v48;
    *(void *)(v24 + 16) = v17;
    *(void *)(v24 + 24) = v16;
    *(unsigned char *)(v24 + 32) = v49;
    *(unsigned char *)(v24 + 33) = v51;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56))(v25, 1, 1, v47);
    type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v42, v22, v52);
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
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  else
  {
    double v28 = *(double *)(v0 + 1048);
    uint64_t v29 = *(void *)(v0 + 504);
    uint64_t v30 = *(void *)(v0 + 488);
    uint64_t v31 = *(void *)(v0 + 496);
    double v32 = v28 * 60.0 / 155.0;
    (*(void (**)(void, void, void))(*(void *)(v0 + 520) + 32))(*(void *)(v0 + 528), *(void *)(v0 + 592), *(void *)(v0 + 512));
    sub_100041CEC();
    sub_100041C4C();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    sub_100042C7C();
    if (v32 < INFINITY)
    {
      double v33 = v32 * 1.12;
    }
    else
    {
      double v32 = INFINITY;
      double v33 = INFINITY;
    }
    uint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 1096) = v34;
    *uint64_t v34 = v0;
    v34[1] = sub_1000375B4;
    if (v28 < 170.0) {
      double v35 = 16.0;
    }
    else {
      double v35 = 17.0;
    }
    double v36 = *(double *)(v0 + 1048);
    double v37 = *(double *)(v0 + 1040);
    uint64_t v38 = *(void *)(v0 + 480);
    uint64_t v39 = *(void *)(v0 + 456);
    return sub_100003754(v38, v39, v37, v36, v32, v33, v35, v35, v35, v35);
  }
}

uint64_t sub_1000375B4(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v3 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 472);
  uint64_t v6 = *(void *)(*(void *)v2 + 448);
  swift_task_dealloc();
  uint64_t v7 = (void (**)(uint64_t, uint64_t))(v6 + 8);
  unint64_t v8 = (void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v9 = v3[60];
  uint64_t v10 = v3[58];
  uint64_t v11 = v3[57];
  uint64_t v12 = v3[55];
  if (v1)
  {
    swift_errorRelease();
    (*v7)(v11, v12);
    (*v8)(v9, v10);
    uint64_t v13 = sub_10003A79C;
  }
  else
  {
    v4[138] = a1;
    (*v7)(v11, v12);
    (*v8)(v9, v10);
    uint64_t v13 = sub_100037804;
  }
  return _swift_task_switch(v13, 0, 0);
}

uint64_t sub_100037804()
{
  uint64_t v57 = v0;
  uint64_t v54 = *(void **)(v0 + 1104);
  id v1 = v54;
  swift_retain_n();
  id v2 = v1;
  uint64_t v3 = sub_1000420FC();
  os_log_type_t v4 = sub_100042E0C();
  if (os_log_type_enabled(v3, v4))
  {
    char v49 = v2;
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    v56[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446466;
    unint64_t v7 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 112) = sub_10003C7DC(v7, v8, v56);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v5 + 12) = 2112;
    if (v49)
    {
      *(void *)(v0 + 128) = v49;
      id v9 = v49;
    }
    else
    {
      *(void *)(v0 + 120) = 0;
    }
    sub_100042E3C();
    *uint64_t v6 = v54;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s - MapImage %@", (uint8_t *)v5, 0x16u);
    sub_1000022D0(&qword_100050430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v2 = v49;
  }
  else
  {

    swift_release_n();
  }
  char v47 = *(unsigned char *)(v0 + 53);
  char v45 = *(unsigned char *)(v0 + 52);
  uint64_t v10 = *(void *)(v0 + 1080);
  uint64_t v11 = *(void **)(v0 + 1064);
  uint64_t v41 = *(void **)(v0 + 1056);
  uint64_t v43 = *(void *)(v0 + 1072);
  uint64_t v12 = *(void *)(v0 + 424);
  uint64_t v13 = *(void *)(v0 + 432);
  uint64_t v14 = *(void *)(v0 + 408);
  uint64_t v15 = *(void *)(v0 + 416);
  uint64_t v50 = *(void *)(v0 + 400);
  uint64_t v16 = *(void *)(v0 + 384);
  sub_100041CEC();
  *(void *)(v13 + *(int *)(v15 + 20)) = v54;
  id v55 = v2;
  sub_100041EEC();
  uint64_t v17 = v14 + *(int *)(v16 + 20);
  uint64_t v18 = v17 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
  *(void *)uint64_t v17 = v43;
  *(void *)(v17 + 8) = v10;
  *(void *)(v17 + 16) = v41;
  *(void *)(v17 + 24) = v11;
  *(unsigned char *)(v17 + 32) = v45;
  *(unsigned char *)(v17 + 33) = v47;
  sub_10003CFF0(v13, v18, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v18, 0, 1, v15);
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  swift_storeEnumTagMultiPayload();
  sub_10003CFF0(v14, v50, type metadata accessor for PeopleWidgetProvider.Entry);
  swift_retain_n();
  id v19 = v41;
  id v20 = v11;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1000420FC();
  os_log_type_t v22 = sub_100042E0C();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v42 = *(void **)(v0 + 1056);
  uint64_t v24 = *(void *)(v0 + 960);
  uint64_t v25 = *(void *)(v0 + 952);
  uint64_t v26 = *(void *)(v0 + 944);
  uint64_t v27 = *(void *)(v0 + 672);
  uint64_t v28 = *(void *)(v0 + 664);
  uint64_t v52 = *(void *)(v0 + 624);
  uint64_t v53 = *(void *)(v0 + 656);
  uint64_t v51 = *(void *)(v0 + 528);
  uint64_t v29 = *(void *)(v0 + 520);
  uint64_t v46 = *(void **)(v0 + 1064);
  uint64_t v48 = *(void *)(v0 + 512);
  uint64_t v44 = *(void *)(v0 + 432);
  uint64_t v30 = *(void *)(v0 + 400);
  if (v23)
  {
    uint64_t v40 = *(void *)(v0 + 952);
    uint64_t v31 = *(void *)(v0 + 392);
    uint64_t v39 = *(void *)(v0 + 944);
    uint64_t v32 = swift_slowAlloc();
    v56[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136446466;
    unint64_t v33 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 96) = sub_10003C7DC(v33, v34, v56);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v32 + 12) = 2080;
    sub_10003CFF0(v30, v31, type metadata accessor for PeopleWidgetProvider.Entry);
    uint64_t v35 = sub_100042D1C();
    *(void *)(v0 + 104) = sub_10003C7DC(v35, v36, v56);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    sub_10003D058(v30, type metadata accessor for PeopleWidgetProvider.Entry);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%{public}s - Result Entry %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_bridgeObjectRelease();
    sub_10003D058(v44, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v51, v48);
    sub_100009240(v52, &qword_1000517D0);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v53);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v24, v39);
  }
  else
  {

    sub_10003D058(v30, type metadata accessor for PeopleWidgetProvider.Entry);
    swift_release_n();

    swift_bridgeObjectRelease();
    sub_10003D058(v44, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v51, v48);
    sub_100009240(v52, &qword_1000517D0);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v53);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  }
  sub_10003D19C(*(void *)(v0 + 408), *(void *)(v0 + 232));
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
  double v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t sub_1000381B4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 328);
  uint64_t v3 = *(void *)(*(void *)v1 + 320);
  uint64_t v4 = *(void *)(*(void *)v1 + 312);
  *(void *)(*(void *)v1 + 1120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_100038CB0;
  }
  else {
    uint64_t v5 = sub_100038358;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100038358()
{
  uint64_t v2 = v0[34];
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[31];
  uint64_t v5 = *(void *)(sub_100041B0C() + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v7 = v0[34];
  uint64_t v6 = v0[35];
  uint64_t v8 = v0[33];
  if (v5)
  {
    char v9 = sub_100042C8C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = v0[47];
      uint64_t v11 = v0[48];
      uint64_t v12 = v0[45];
      uint64_t v13 = v0[46];
      uint64_t v15 = v0[43];
      uint64_t v14 = v0[44];
      uint64_t v16 = v0[42];
      uint64_t v17 = v0[29];
      sub_100041EEC();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
      uint64_t v18 = (char *)(v17 + *(int *)(v11 + 20));
      char v19 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(void, void))(v7 + 8))(v0[35], v0[33]);
  }
  uint64_t v10 = v0[47];
  uint64_t v20 = v0[48];
  uint64_t v12 = v0[45];
  uint64_t v13 = v0[46];
  uint64_t v22 = v0[43];
  uint64_t v21 = v0[44];
  uint64_t v23 = v0[42];
  uint64_t v17 = v0[29];
  sub_100041EEC();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  uint64_t v18 = (char *)(v17 + *(int *)(v20 + 20));
  char v19 = 2;
LABEL_6:
  *uint64_t v18 = v19;
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v17, v10, v12);
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
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_100038780()
{
  uint64_t v13 = v0;
  sub_100002E4C();
  swift_allocError();
  swift_retain();
  swift_errorRetain();
  swift_retain();
  swift_errorRetain();
  uint64_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042E0C();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    v12[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446466;
    unint64_t v5 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    v0[7] = sub_10003C7DC(v5, v6, v12);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v7;
    sub_100042E3C();
    *uint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s - Error %{public}@", (uint8_t *)v3, 0x16u);
    sub_1000022D0(&qword_100050430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = v0[48];
  uint64_t v9 = v0[29];
  sub_100041EEC();
  swift_errorRelease();
  *(unsigned char *)(v9 + *(int *)(v8 + 20)) = 0;
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  swift_storeEnumTagMultiPayload();
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100038CB0()
{
  uint64_t v13 = v0;
  swift_retain();
  swift_errorRetain();
  swift_retain();
  swift_errorRetain();
  uint64_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042E0C();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    v12[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446466;
    unint64_t v5 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    v0[7] = sub_10003C7DC(v5, v6, v12);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[8] = v7;
    sub_100042E3C();
    *uint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s - Error %{public}@", (uint8_t *)v3, 0x16u);
    sub_1000022D0(&qword_100050430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = v0[48];
  uint64_t v9 = v0[29];
  sub_100041EEC();
  swift_errorRelease();
  *(unsigned char *)(v9 + *(int *)(v8 + 20)) = 0;
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  swift_storeEnumTagMultiPayload();
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1000391C4()
{
  uint64_t v94 = v0;
  swift_bridgeObjectRelease();
  swift_retain();
  swift_errorRetain();
  swift_retain();
  swift_errorRetain();
  uint64_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042DEC();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    v93[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446466;
    unint64_t v5 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 192) = sub_10003C7DC(v5, v6, v93);
    sub_100042E3C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 200) = v7;
    sub_100042E3C();
    *uint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s - Renew Subscription Error %{public}@", (uint8_t *)v3, 0x16u);
    sub_1000022D0(&qword_100050430);
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
    swift_release_n();

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = *(void *)(v0 + 832);
  uint64_t v9 = *(void *)(v0 + 816);
  uint64_t v10 = *(void *)(v0 + 808);
  sub_100042C3C();
  *(void *)(v0 + 1040) = v11;
  *(void *)(v0 + 1048) = v12;
  sub_100042C6C();
  swift_getKeyPath();
  uint64_t v13 = sub_100042C4C();
  swift_release();
  uint64_t v91 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v91(v8, v10);
  if (v13)
  {
    uint64_t v14 = *(void *)(v0 + 856);
    uint64_t v15 = *(void *)(v0 + 776);
    uint64_t v16 = *(void *)(v0 + 768);
    if (*(void *)(v13 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v15 + 16))(*(void *)(v0 + 856), v13 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)), *(void *)(v0 + 768));
      uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      v17(v14, 0, 1, v16);
    }
    else
    {
      uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      v17(*(void *)(v0 + 856), 1, 1, v16);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 776) + 56);
    v17(*(void *)(v0 + 856), 1, 1, *(void *)(v0 + 768));
  }
  uint64_t v18 = *(void *)(v0 + 856);
  uint64_t v19 = *(void *)(v0 + 848);
  uint64_t v20 = *(void *)(v0 + 800);
  uint64_t v21 = *(void *)(v0 + 792);
  uint64_t v22 = *(void *)(v0 + 776);
  uint64_t v23 = *(void *)(v0 + 768);
  (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v19, enum case for LayoutDirection.rightToLeft(_:), v23);
  v17(v19, 0, 1, v23);
  uint64_t v24 = v20 + *(int *)(v21 + 48);
  sub_1000091DC(v18, v20, &qword_1000517E0);
  sub_1000091DC(v19, v24, &qword_1000517E0);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  if (v25(v20, 1, v23) == 1)
  {
    uint64_t v26 = *(void *)(v0 + 856);
    uint64_t v27 = *(void *)(v0 + 768);
    sub_100009240(*(void *)(v0 + 848), &qword_1000517E0);
    sub_100009240(v26, &qword_1000517E0);
    if (v25(v24, 1, v27) == 1)
    {
      sub_100009240(*(void *)(v0 + 800), &qword_1000517E0);
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v28 = *(void *)(v0 + 768);
  sub_1000091DC(*(void *)(v0 + 800), *(void *)(v0 + 840), &qword_1000517E0);
  unsigned int v29 = v25(v24, 1, v28);
  uint64_t v30 = *(void *)(v0 + 856);
  uint64_t v31 = *(void *)(v0 + 848);
  uint64_t v32 = *(void *)(v0 + 840);
  if (v29 == 1)
  {
    uint64_t v33 = *(void *)(v0 + 776);
    uint64_t v34 = *(void *)(v0 + 768);
    sub_100009240(*(void *)(v0 + 848), &qword_1000517E0);
    sub_100009240(v30, &qword_1000517E0);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
LABEL_15:
    sub_100009240(*(void *)(v0 + 800), &qword_1000517D8);
    goto LABEL_17;
  }
  uint64_t v89 = *(void *)(v0 + 800);
  uint64_t v35 = *(void *)(v0 + 784);
  uint64_t v36 = *(void *)(v0 + 776);
  uint64_t v37 = *(void *)(v0 + 768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v35, v24, v37);
  sub_10003D0D8(&qword_100051800, (void (*)(uint64_t))&type metadata accessor for LayoutDirection);
  sub_100042D0C();
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v38(v35, v37);
  sub_100009240(v31, &qword_1000517E0);
  sub_100009240(v30, &qword_1000517E0);
  v38(v32, v37);
  sub_100009240(v89, &qword_1000517E0);
LABEL_17:
  uint64_t v39 = *(void *)(v0 + 824);
  uint64_t v40 = *(void *)(v0 + 808);
  sub_100042C6C();
  swift_getKeyPath();
  uint64_t v41 = sub_100042C4C();
  swift_release();
  v91(v39, v40);
  if (v41) {
    swift_bridgeObjectRelease();
  }
  uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v0 + 1008);
  uint64_t v43 = *(void *)(v0 + 920);
  uint64_t v44 = *(void *)(v0 + 888);
  uint64_t v45 = *(void *)(v0 + 760);
  uint64_t v79 = *(void *)(v0 + 752);
  uint64_t v81 = *(void *)(v0 + 744);
  uint64_t v75 = *(void *)(v0 + 912);
  uint64_t v76 = *(void *)(v0 + 736);
  uint64_t v85 = *(void *)(v0 + 728);
  uint64_t v86 = *(void *)(v0 + 904);
  uint64_t v90 = *(void *)(v0 + 720);
  uint64_t v83 = *(void *)(v0 + 712);
  uint64_t v78 = *(void *)(v0 + 704);
  uint64_t v87 = *(void *)(v0 + 696);
  uint64_t v92 = *(void *)(v0 + 688);
  uint64_t v84 = *(void *)(v0 + 680);
  sub_100041B6C();
  Class isa = sub_100041DAC().super.isa;
  *(void *)(v0 + 1056) = isa;
  v42(v43, v44);
  char v47 = (void *)sub_10004204C();
  *(void *)(v0 + 1064) = v47;
  sub_100041B6C();
  sub_100041E3C();
  v42(v43, v44);
  uint64_t v48 = sub_100041DCC();
  uint64_t v88 = v49;
  uint64_t v74 = v48;
  *(void *)(v0 + 1072) = v48;
  *(void *)(v0 + 1080) = v49;
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v45, v81);
  uint64_t v82 = isa;
  id v80 = v47;
  sub_100041B6C();
  sub_100041DBC();
  v42(v75, v44);
  sub_100041D8C();
  uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
  v50(v76, v83);
  char v77 = sub_100041D6C() & 1;
  *(unsigned char *)(v0 + 52) = v77;
  uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
  v51(v78, v84);
  sub_100041B6C();
  sub_100041DBC();
  v42(v86, v44);
  sub_100041D8C();
  v50(v85, v83);
  char v52 = sub_100041D5C() & 1;
  *(unsigned char *)(v0 + 53) = v52;
  v51(v87, v84);
  swift_retain_n();
  uint64_t v53 = v82;
  id v54 = v80;
  swift_bridgeObjectRetain_n();
  id v55 = v53;
  id v56 = v54;
  uint64_t v57 = sub_1000420FC();
  os_log_type_t v58 = sub_100042E0C();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = swift_slowAlloc();
    v93[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136446467;
    unint64_t v60 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 168) = sub_10003C7DC(v60, v61, v93);
    sub_100042E3C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2081;
    *(void *)(v0 + 16) = v74;
    *(void *)(v0 + 24) = v88;
    *(void *)(v0 + 32) = v55;
    *(void *)(v0 + 40) = v56;
    *(unsigned char *)(v0 + 48) = v77;
    *(unsigned char *)(v0 + 49) = v52;
    uint64_t v62 = v55;
    id v63 = v56;
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_100042D1C();
    *(void *)(v0 + 184) = sub_10003C7DC(v64, v65, v93);
    sub_100042E3C();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v57, v58, "%{public}s - PersonInfo %{private}s", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }

  uint64_t v66 = *(void *)(v0 + 960);
  uint64_t v67 = *(void *)(v0 + 952);
  uint64_t v68 = *(void *)(v0 + 944);
  uint64_t v69 = *(void *)(v0 + 928);
  (*(void (**)(void, void, void))(*(void *)(v0 + 640) + 16))(*(void *)(v0 + 648), *(void *)(v0 + 256) + *(void *)(v0 + 976) + *(int *)(*(void *)(v0 + 992) + 24), *(void *)(v0 + 632));
  sub_100041CDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(v69, v66, v68);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v67 + 56))(v69, 0, 1, v68);
  sub_100041D0C();
  char v70 = (void *)swift_task_alloc();
  *(void *)(v0 + 1088) = v70;
  *char v70 = v0;
  v70[1] = sub_100036C48;
  uint64_t v71 = *(void *)(v0 + 616);
  uint64_t v72 = *(void *)(v0 + 568);
  return _s10FindMyCore29GetPersonCachedLocationIntentV7performAC6ResultVyYaAC05FetchG5ErrorOYKF(v71, v72);
}

uint64_t sub_100039E38()
{
  uint64_t v71 = v0;
  uint64_t v1 = *(void *)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 560);
  id v63 = *(NSObject **)(v0 + 624);
  uint64_t v66 = *(void *)(v0 + 552);
  uint64_t v3 = *(void *)(v0 + 544);
  uint64_t v4 = *(void *)(v0 + 536);
  uint64_t v5 = *(void *)(v0 + 520);
  uint64_t v6 = *(void *)(v0 + 512);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v7(v1, *(void *)(v0 + 568), v4);
  v7(v2, v1, v4);
  (*(void (**)(NSObject *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v63, 1, 1, v6);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v8(v66, v2, v4);
  swift_retain_n();
  uint64_t v9 = sub_1000420FC();
  os_log_type_t v10 = sub_100042E0C();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v68 = *(void *)(v0 + 560);
    uint64_t v11 = *(void *)(v0 + 552);
    uint64_t v59 = *(void *)(v0 + 544);
    uint64_t v64 = v9;
    uint64_t v12 = *(void *)(v0 + 536);
    os_log_type_t v61 = v10;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v57 = (void *)swift_slowAlloc();
    v70[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    unint64_t v14 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 136) = sub_10003C7DC(v14, v15, v70);
    sub_100042E3C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2114;
    sub_10003D0D8(&qword_1000517F8, (void (*)(uint64_t))&type metadata accessor for GetPersonCachedLocationIntent.FetchLocationError);
    swift_allocError();
    v8(v16, v11, v12);
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 144) = v17;
    sub_100042E3C();
    *uint64_t v57 = v17;
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v18(v11, v12);
    _os_log_impl((void *)&_mh_execute_header, v64, v61, "%{public}s - LocationResult error: %{public}@", (uint8_t *)v13, 0x16u);
    sub_1000022D0(&qword_100050430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v18(v68, v12);
  }
  else
  {
    uint64_t v19 = *(void *)(v0 + 560);
    uint64_t v20 = *(void *)(v0 + 552);
    uint64_t v21 = *(void *)(v0 + 544);
    uint64_t v22 = *(void *)(v0 + 536);
    swift_release_n();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v23(v20, v22);

    v23(v19, v22);
  }
  uint64_t v24 = *(void *)(v0 + 592);
  uint64_t v25 = *(void *)(v0 + 520);
  uint64_t v26 = *(void *)(v0 + 512);
  sub_1000091DC(*(void *)(v0 + 624), v24, &qword_1000517D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v24, 1, v26) == 1)
  {
    char v67 = *(unsigned char *)(v0 + 53);
    char v65 = *(unsigned char *)(v0 + 52);
    uint64_t v62 = *(void *)(v0 + 1080);
    uint64_t v27 = *(void **)(v0 + 1064);
    uint64_t v28 = *(void **)(v0 + 1056);
    uint64_t v56 = *(void *)(v0 + 960);
    uint64_t v58 = *(void *)(v0 + 1072);
    uint64_t v29 = *(void *)(v0 + 952);
    uint64_t v55 = *(void *)(v0 + 944);
    uint64_t v30 = *(void *)(v0 + 664);
    uint64_t v51 = *(void *)(v0 + 656);
    uint64_t v52 = *(void *)(v0 + 672);
    uint64_t v31 = *(void *)(v0 + 624);
    uint64_t v32 = *(void *)(v0 + 424);
    uint64_t v60 = *(void *)(v0 + 416);
    uint64_t v33 = *(void *)(v0 + 376);
    uint64_t v54 = *(void *)(v0 + 384);
    uint64_t v34 = *(void *)(v0 + 368);
    uint64_t v69 = *(void *)(v0 + 360);
    uint64_t v53 = *(void *)(v0 + 232);
    sub_100009240(*(void *)(v0 + 592), &qword_1000517D0);
    sub_100041EEC();

    sub_100009240(v31, &qword_1000517D0);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v52, v51);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v56, v55);
    uint64_t v35 = v53 + *(int *)(v54 + 20);
    uint64_t v36 = v35 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
    *(void *)uint64_t v35 = v58;
    *(void *)(v35 + 8) = v62;
    *(void *)(v35 + 16) = v28;
    *(void *)(v35 + 24) = v27;
    *(unsigned char *)(v35 + 32) = v65;
    *(unsigned char *)(v35 + 33) = v67;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v36, 1, 1, v60);
    type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v53, v33, v69);
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
    uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
    return v37();
  }
  else
  {
    double v39 = *(double *)(v0 + 1048);
    uint64_t v40 = *(void *)(v0 + 504);
    uint64_t v41 = *(void *)(v0 + 488);
    uint64_t v42 = *(void *)(v0 + 496);
    double v43 = v39 * 60.0 / 155.0;
    (*(void (**)(void, void, void))(*(void *)(v0 + 520) + 32))(*(void *)(v0 + 528), *(void *)(v0 + 592), *(void *)(v0 + 512));
    sub_100041CEC();
    sub_100041C4C();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
    sub_100042C7C();
    if (v43 < INFINITY)
    {
      double v44 = v43 * 1.12;
    }
    else
    {
      double v43 = INFINITY;
      double v44 = INFINITY;
    }
    uint64_t v45 = (void *)swift_task_alloc();
    *(void *)(v0 + 1096) = v45;
    *uint64_t v45 = v0;
    v45[1] = sub_1000375B4;
    if (v39 < 170.0) {
      double v46 = 16.0;
    }
    else {
      double v46 = 17.0;
    }
    double v47 = *(double *)(v0 + 1048);
    double v48 = *(double *)(v0 + 1040);
    uint64_t v49 = *(void *)(v0 + 480);
    uint64_t v50 = *(void *)(v0 + 456);
    return sub_100003754(v49, v50, v48, v47, v43, v44, v46, v46, v46, v46);
  }
}

uint64_t sub_10003A79C()
{
  uint64_t v50 = v0;
  swift_retain_n();
  uint64_t v1 = sub_1000420FC();
  os_log_type_t v2 = sub_100042E0C();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    v49[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136446466;
    unint64_t v5 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 112) = sub_10003C7DC(v5, v6, v49);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v3 + 12) = 2112;
    *(void *)(v0 + 120) = 0;
    sub_100042E3C();
    *uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%{public}s - MapImage %@", (uint8_t *)v3, 0x16u);
    sub_1000022D0(&qword_100050430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  char v43 = *(unsigned char *)(v0 + 53);
  char v41 = *(unsigned char *)(v0 + 52);
  uint64_t v7 = *(void *)(v0 + 1080);
  uint64_t v39 = *(void *)(v0 + 1072);
  uint64_t v8 = *(void **)(v0 + 1064);
  uint64_t v9 = *(void **)(v0 + 1056);
  uint64_t v10 = *(void *)(v0 + 424);
  uint64_t v11 = *(void *)(v0 + 432);
  uint64_t v12 = *(void *)(v0 + 408);
  uint64_t v13 = *(void *)(v0 + 416);
  uint64_t v45 = *(void *)(v0 + 400);
  uint64_t v14 = *(void *)(v0 + 384);
  sub_100041CEC();
  *(void *)(v11 + *(int *)(v13 + 20)) = 0;
  sub_100041EEC();
  uint64_t v15 = v12 + *(int *)(v14 + 20);
  uint64_t v16 = v15 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
  *(void *)uint64_t v15 = v39;
  *(void *)(v15 + 8) = v7;
  *(void *)(v15 + 16) = v9;
  *(void *)(v15 + 24) = v8;
  *(unsigned char *)(v15 + 32) = v41;
  *(unsigned char *)(v15 + 33) = v43;
  sub_10003CFF0(v11, v16, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v13);
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  swift_storeEnumTagMultiPayload();
  sub_10003CFF0(v12, v45, type metadata accessor for PeopleWidgetProvider.Entry);
  swift_retain_n();
  id v17 = v9;
  id v18 = v8;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1000420FC();
  os_log_type_t v20 = sub_100042E0C();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v38 = *(void **)(v0 + 1056);
  uint64_t v22 = *(void *)(v0 + 960);
  uint64_t v23 = *(void *)(v0 + 952);
  uint64_t v37 = *(void *)(v0 + 944);
  uint64_t v24 = *(void *)(v0 + 672);
  uint64_t v25 = *(void *)(v0 + 664);
  uint64_t v47 = *(void *)(v0 + 624);
  uint64_t v48 = *(void *)(v0 + 656);
  uint64_t v46 = *(void *)(v0 + 528);
  uint64_t v26 = *(void *)(v0 + 520);
  uint64_t v42 = *(void **)(v0 + 1064);
  uint64_t v44 = *(void *)(v0 + 512);
  uint64_t v40 = *(void *)(v0 + 432);
  uint64_t v27 = *(void *)(v0 + 400);
  if (v21)
  {
    uint64_t v35 = *(void *)(v0 + 392);
    uint64_t v36 = *(void *)(v0 + 960);
    uint64_t v28 = swift_slowAlloc();
    v49[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136446466;
    unint64_t v29 = sub_100034664(0xD000000000000011, (void *)0x8000000100049E90);
    *(void *)(v0 + 96) = sub_10003C7DC(v29, v30, v49);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v28 + 12) = 2080;
    sub_10003CFF0(v27, v35, type metadata accessor for PeopleWidgetProvider.Entry);
    uint64_t v31 = sub_100042D1C();
    *(void *)(v0 + 104) = sub_10003C7DC(v31, v32, v49);
    sub_100042E3C();
    swift_bridgeObjectRelease();
    sub_10003D058(v27, type metadata accessor for PeopleWidgetProvider.Entry);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%{public}s - Result Entry %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_bridgeObjectRelease();
    sub_10003D058(v40, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v46, v44);
    sub_100009240(v47, &qword_1000517D0);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v48);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v36, v37);
  }
  else
  {

    sub_10003D058(v27, type metadata accessor for PeopleWidgetProvider.Entry);
    swift_release_n();
    swift_bridgeObjectRelease();

    sub_10003D058(v40, type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v46, v44);
    sub_100009240(v47, &qword_1000517D0);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v48);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v37);
  }
  sub_10003D19C(*(void *)(v0 + 408), *(void *)(v0 + 232));
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
  uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_10003B0C0()
{
  return sub_10004231C();
}

uint64_t sub_10003B0E4(uint64_t a1)
{
  uint64_t v2 = sub_10004226C();
  __n128 v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_10004232C();
}

uint64_t sub_10003B1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  uint64_t v6 = sub_100042C1C();
  v3[3] = v6;
  v3[4] = *(void *)(v6 - 8);
  v3[5] = swift_task_alloc();
  v3[6] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for PeopleWidgetProvider.Entry(0);
  v3[7] = v7;
  v3[8] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  v3[9] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v3[10] = v9;
  void *v9 = v3;
  v9[1] = sub_10003B328;
  return sub_1000348D4(v8, a2, a3);
}

uint64_t sub_10003B328()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003B424, 0, 0);
}

uint64_t sub_10003B424()
{
  if (sub_10003B5D8()) {
    sub_100042C0C();
  }
  else {
    sub_100042BFC();
  }
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[3];
  sub_1000022D0(&qword_1000517C0);
  unint64_t v7 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100046410;
  sub_10003CFF0(v1, v8 + v7, type metadata accessor for PeopleWidgetProvider.Entry);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
  sub_10003D0D8(qword_100051758, (void (*)(uint64_t))type metadata accessor for PeopleWidgetProvider.Entry);
  sub_100042CDC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v6);
  sub_10003D058(v1, type metadata accessor for PeopleWidgetProvider.Entry);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

BOOL sub_10003B5D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (id *)((char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v12 - v6;
  sub_10003CFF0(v1, (uint64_t)&v12 - v6, type metadata accessor for PeopleWidgetProvider.Entry.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10003CFF0((uint64_t)v7, (uint64_t)v4, type metadata accessor for PeopleWidgetProvider.Entry.Content);
    swift_bridgeObjectRelease();

    uint64_t v8 = (uint64_t)v4 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
    uint64_t v9 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    BOOL v10 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9) != 1;
    sub_100009240(v8, &qword_100051628);
  }
  else
  {
    BOOL v10 = 0;
  }
  sub_10003D058((uint64_t)v7, type metadata accessor for PeopleWidgetProvider.Entry.Content);
  return v10;
}

BOOL sub_10003B76C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10003B780()
{
  Swift::UInt v1 = *v0;
  sub_100042EFC();
  sub_100042F0C(v1);
  return sub_100042F1C();
}

void sub_10003B7C8()
{
  sub_100042F0C(*v0);
}

Swift::Int sub_10003B7F4()
{
  Swift::UInt v1 = *v0;
  sub_100042EFC();
  sub_100042F0C(v1);
  return sub_100042F1C();
}

uint64_t sub_10003B838()
{
  sub_10003D058(v0 + OBJC_IVAR____TtC18FindMyWidgetPeople20PeopleWidgetProvider_dependencies, (uint64_t (*)(void))_s12DependenciesVMa_0);
  uint64_t v1 = v0 + OBJC_IVAR____TtC18FindMyWidgetPeople20PeopleWidgetProvider_logger;
  uint64_t v2 = sub_10004211C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10003B8FC()
{
  return type metadata accessor for PeopleWidgetProvider(0);
}

uint64_t type metadata accessor for PeopleWidgetProvider(uint64_t a1)
{
  return sub_10000D730(a1, qword_1000516C8);
}

uint64_t sub_10003B924()
{
  uint64_t result = _s12DependenciesVMa_0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_10004211C();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_10003B9F0()
{
  return sub_10003D0D8(qword_100051758, (void (*)(uint64_t))type metadata accessor for PeopleWidgetProvider.Entry);
}

uint64_t type metadata accessor for PeopleWidgetProvider.Entry(uint64_t a1)
{
  return sub_10000D730(a1, qword_1000519B0);
}

uint64_t sub_10003BA5C()
{
  return sub_100034718();
}

uint64_t sub_10003BA80(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000639C;
  return sub_1000348D4(a1, v6, a3);
}

uint64_t sub_10003BB34(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000639C;
  return sub_10003B1AC(a1, v6, a3);
}

uint64_t sub_10003BBE8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10003BC90(*a1, a2, a3, a4, 0x8000000100049ED0, (uint64_t)&unk_10004E7B0, (uint64_t)&unk_100051810);
}

uint64_t sub_10003BC3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10003BC90(*a1, a2, a3, a4, 0x8000000100049C90, (uint64_t)&unk_10004E760, (uint64_t)&unk_100051788);
}

uint64_t sub_10003BC90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v34 = a5;
  uint64_t v9 = v7;
  uint64_t v38 = a4;
  uint64_t v36 = a3;
  uint64_t v37 = sub_100042C9C();
  uint64_t v12 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v35 = v13;
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000022D0(&qword_100050580);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = sub_1000420FC();
  os_log_type_t v19 = sub_100042DDC();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v32 = a1;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = v9;
    BOOL v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v33 = a7;
    uint64_t v40 = v22;
    uint64_t v30 = a2;
    *(_DWORD *)BOOL v21 = 136315138;
    uint64_t v39 = sub_10003C7DC(0xD00000000000001FLL, v34, &v40);
    a1 = v32;
    a2 = v30;
    sub_100042E3C();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s", v21, 0xCu);
    swift_arrayDestroy();
    a7 = v33;
    swift_slowDealloc();
    uint64_t v9 = v31;
    swift_slowDealloc();
  }

  uint64_t v23 = sub_100042D8C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  uint64_t v24 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, v37);
  unint64_t v25 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v26 = (char *)swift_allocObject();
  *((void *)v26 + 2) = 0;
  *((void *)v26 + 3) = 0;
  uint64_t v27 = v38;
  *((void *)v26 + 4) = v36;
  *((void *)v26 + 5) = v27;
  *((void *)v26 + 6) = v9;
  *((void *)v26 + 7) = a1;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v26[v25], v14, v24);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000342A4((uint64_t)v17, a7, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_10003BFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a4;
  _OWORD v8[3] = a5;
  type metadata accessor for PeopleWidgetProvider.Entry(0);
  uint64_t v11 = swift_task_alloc();
  v8[4] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v8[5] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10003C0B4;
  return sub_1000348D4(v11, a7, a8);
}

uint64_t sub_10003C0B4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003C1B0, 0, 0);
}

uint64_t sub_10003C1B0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  (*(void (**)(uint64_t))(v0 + 16))(v1);
  sub_10003D058(v1, type metadata accessor for PeopleWidgetProvider.Entry);
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10003C240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a4;
  _OWORD v8[3] = a5;
  uint64_t v11 = sub_1000022D0(&qword_1000517A8);
  v8[4] = v11;
  v8[5] = *(void *)(v11 - 8);
  uint64_t v12 = swift_task_alloc();
  v8[6] = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  v8[7] = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_10003C35C;
  return sub_10003B1AC(v12, a7, a8);
}

uint64_t sub_10003C35C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10003C458, 0, 0);
}

uint64_t sub_10003C458()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  (*(void (**)(uint64_t))(v0 + 16))(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10003C4F4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100042C9C() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_10000639C;
  return sub_10003C240(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_10003C608(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10003C6E4;
  return v6(a1);
}

uint64_t sub_10003C6E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10003C7DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10003C8B0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10003CABC((uint64_t)v12, *a3);
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
      sub_10003CABC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10003CA6C((uint64_t)v12);
  return v7;
}

uint64_t sub_10003C8B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100042E4C();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10003CB18(a5, a6);
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
  uint64_t v8 = sub_100042E8C();
  if (!v8)
  {
    sub_100042E9C();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100042EAC();
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

uint64_t sub_10003CA6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10003CABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10003CB18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10003CBB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10003CD90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10003CD90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10003CBB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10003CD28(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100042E7C();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100042E9C();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100042D3C();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100042EAC();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100042E9C();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10003CD28(uint64_t a1, uint64_t a2)
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
  sub_1000022D0(&qword_100051790);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10003CD90(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000022D0(&qword_100051790);
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
  uint64_t result = sub_100042EAC();
  __break(1u);
  return result;
}

uint64_t sub_10003CEE0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_10003CF18(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_100005594;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100051798 + dword_100051798);
  return v6(a1, v4);
}

uint64_t type metadata accessor for PeopleWidgetProvider.Entry.Content(uint64_t a1)
{
  return sub_10000D730(a1, (uint64_t *)&unk_100051918);
}

uint64_t sub_10003CFF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003D058(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(uint64_t a1)
{
  return sub_10000D730(a1, qword_100051870);
}

uint64_t sub_10003D0D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003D120()
{
  return sub_10004231C();
}

uint64_t sub_10003D148@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000422DC();
  *a1 = v3;
  return result;
}

uint64_t sub_10003D174()
{
  return sub_1000422EC();
}

uint64_t sub_10003D19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleWidgetProvider.Entry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003D200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000022D0(&qword_1000517D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003D26C()
{
  uint64_t v1 = sub_100042C9C();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_10003D350(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100042C9C() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_10000639C;
  return sub_10003BFCC(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t *sub_10003D464(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100041C9C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void sub_10003D534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041C9C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_10003D5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_10003D628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  id v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  return a1;
}

uint64_t sub_10003D6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003D72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041C9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_10003D7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003D7C4);
}

uint64_t sub_10003D7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041C9C();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_10003D890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003D8A4);
}

uint64_t sub_10003D8A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100041C9C();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t sub_10003D960()
{
  uint64_t result = sub_100041C9C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t a1)
{
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  int v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  return a1;
}

uint64_t assignWithCopy for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 16);
  int v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  id v7 = *(void **)(a2 + 24);
  uint64_t v8 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  id v9 = v7;

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  return a1;
}

__n128 initializeWithTake for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  int v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 34)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleWidgetProvider.Entry.Content.PersonInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 34) = 1;
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
    *(unsigned char *)(result + 34) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleWidgetProvider.Entry.Content.PersonInfo()
{
  return &type metadata for PeopleWidgetProvider.Entry.Content.PersonInfo;
}

void *sub_10003DC28(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
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
      uint64_t v8 = (void *)a2[2];
      id v9 = (void *)a2[3];
      a1[2] = v8;
      a1[3] = v9;
      *((_WORD *)a1 + 16) = *((_WORD *)a2 + 16);
      swift_bridgeObjectRetain();
      id v10 = v8;
      id v11 = v9;
      uint64_t v12 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      uint64_t v13 = (char *)a1 + v12;
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
      uint64_t v16 = *(void *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        uint64_t v17 = sub_1000022D0(&qword_100051628);
        memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        uint64_t v19 = sub_100041C9C();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v13, v14, v19);
        uint64_t v20 = *(int *)(v15 + 20);
        BOOL v21 = *(void **)&v14[v20];
        *(void *)&v13[v20] = v21;
        uint64_t v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
        id v23 = v21;
        v22(v13, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

void sub_10003DE24(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();

    uint64_t v2 = a1 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
    uint64_t v3 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3))
    {
      uint64_t v4 = sub_100041C9C();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v2, v4);
      int v5 = *(void **)(v2 + *(int *)(v3 + 20));
    }
  }
}

void *sub_10003DF1C(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = (void *)a2[2];
    uint64_t v8 = (void *)a2[3];
    a1[2] = v7;
    a1[3] = v8;
    *((_WORD *)a1 + 16) = *((_WORD *)a2 + 16);
    swift_bridgeObjectRetain();
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_1000022D0(&qword_100051628);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v17 = sub_100041C9C();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v12, v13, v17);
      uint64_t v18 = *(int *)(v14 + 20);
      uint64_t v19 = *(void **)&v13[v18];
      *(void *)&v12[v18] = v19;
      uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
      id v21 = v19;
      v20(v12, 0, 1, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10003E0D4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10003D058((uint64_t)a1, type metadata accessor for PeopleWidgetProvider.Entry.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v6 = (void *)a2[2];
      a1[2] = v6;
      uint64_t v7 = (void *)a2[3];
      a1[3] = v7;
      *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
      *((unsigned char *)a1 + 33) = *((unsigned char *)a2 + 33);
      swift_bridgeObjectRetain();
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = sub_1000022D0(&qword_100051628);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        uint64_t v16 = sub_100041C9C();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v11, v12, v16);
        uint64_t v17 = *(int *)(v13 + 20);
        uint64_t v18 = *(void **)&v12[v17];
        *(void *)&v11[v17] = v18;
        uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
        id v20 = v18;
        v19(v11, 0, 1, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

_OWORD *sub_10003E2C8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    long long v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    *((_WORD *)a1 + 16) = *((_WORD *)a2 + 16);
    uint64_t v7 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
    id v8 = (char *)a1 + v7;
    id v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_1000022D0(&qword_100051628);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v13 = sub_100041C9C();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
      *(void *)&v8[*(int *)(v10 + 20)] = *(void *)&v9[*(int *)(v10 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_10003E468(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10003D058((uint64_t)a1, type metadata accessor for PeopleWidgetProvider.Entry.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((_WORD *)a1 + 16) = *((_WORD *)a2 + 16);
      uint64_t v7 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      id v8 = (char *)a1 + v7;
      id v9 = (char *)a2 + v7;
      uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_1000022D0(&qword_100051628);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        uint64_t v13 = sub_100041C9C();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v8, v9, v13);
        *(void *)&v8[*(int *)(v10 + 20)] = *(void *)&v9[*(int *)(v10 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void sub_10003E62C()
{
  v1[4] = &unk_100047B08;
  sub_10003E6D4();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[5] = v1;
    swift_initEnumMetadataMultiPayload();
  }
}

void sub_10003E6D4()
{
  if (!qword_100051928)
  {
    type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(255);
    unint64_t v0 = sub_100042E2C();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100051928);
    }
  }
}

uint64_t *sub_10003E72C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100041F0C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = *((void *)v10 + 1);
      *(void *)id v9 = *(void *)v10;
      *((void *)v9 + 1) = v12;
      uint64_t v13 = (void *)*((void *)v10 + 2);
      uint64_t v14 = (void *)*((void *)v10 + 3);
      *((void *)v9 + 2) = v13;
      *((void *)v9 + 3) = v14;
      *((_WORD *)v9 + 16) = *((_WORD *)v10 + 16);
      swift_bridgeObjectRetain();
      id v15 = v13;
      id v16 = v14;
      uint64_t v17 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      uint64_t v18 = &v9[v17];
      uint64_t v19 = &v10[v17];
      uint64_t v20 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        uint64_t v22 = sub_1000022D0(&qword_100051628);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        uint64_t v24 = sub_100041C9C();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v18, v19, v24);
        uint64_t v25 = *(int *)(v20 + 20);
        uint64_t v26 = *(void **)&v19[v25];
        *(void *)&v18[v25] = v26;
        uint64_t v27 = *(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56);
        id v28 = v26;
        v27(v18, 0, 1, v20);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

void sub_10003E990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();

    uint64_t v6 = v5 + *(int *)(sub_1000022D0(&qword_100051630) + 48);
    uint64_t v7 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
    {
      uint64_t v8 = sub_100041C9C();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
      id v9 = *(void **)(v6 + *(int *)(v7 + 20));
    }
  }
}

uint64_t sub_10003EADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v11;
    uint64_t v12 = (void *)v9[2];
    uint64_t v13 = (void *)v9[3];
    v8[2] = v12;
    _OWORD v8[3] = v13;
    *((_WORD *)v8 + 16) = *((_WORD *)v9 + 16);
    swift_bridgeObjectRetain();
    id v14 = v12;
    id v15 = v13;
    uint64_t v16 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
    uint64_t v17 = (char *)v8 + v16;
    uint64_t v18 = (char *)v9 + v16;
    uint64_t v19 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = sub_1000022D0(&qword_100051628);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      uint64_t v22 = sub_100041C9C();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v17, v18, v22);
      uint64_t v23 = *(int *)(v19 + 20);
      uint64_t v24 = *(void **)&v18[v23];
      *(void *)&v17[v23] = v24;
      uint64_t v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56);
      id v26 = v24;
      v25(v17, 0, 1, v19);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10003ECF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (void *)(a1 + v7);
    id v9 = (void *)(a2 + v7);
    sub_10003D058(a1 + v7, type metadata accessor for PeopleWidgetProvider.Entry.Content);
    uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v8 = *v9;
      v8[1] = v9[1];
      uint64_t v11 = (void *)v9[2];
      v8[2] = v11;
      uint64_t v12 = (void *)v9[3];
      _OWORD v8[3] = v12;
      *((unsigned char *)v8 + 32) = *((unsigned char *)v9 + 32);
      *((unsigned char *)v8 + 33) = *((unsigned char *)v9 + 33);
      swift_bridgeObjectRetain();
      id v13 = v11;
      id v14 = v12;
      uint64_t v15 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      uint64_t v16 = (char *)v8 + v15;
      uint64_t v17 = (char *)v9 + v15;
      uint64_t v18 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
      {
        uint64_t v20 = sub_1000022D0(&qword_100051628);
        memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        uint64_t v21 = sub_100041C9C();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v16, v17, v21);
        uint64_t v22 = *(int *)(v18 + 20);
        uint64_t v23 = *(void **)&v17[v22];
        *(void *)&v16[v22] = v23;
        uint64_t v24 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
        id v25 = v23;
        v24(v16, 0, 1, v18);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003EF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  id v9 = (_OWORD *)(a2 + v7);
  uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    long long v11 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v11;
    *((_WORD *)v8 + 16) = *((_WORD *)v9 + 16);
    uint64_t v12 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
    id v13 = (char *)v8 + v12;
    id v14 = (char *)v9 + v12;
    uint64_t v15 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = sub_1000022D0(&qword_100051628);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v18 = sub_100041C9C();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v13, v14, v18);
      *(void *)&v13[*(int *)(v15 + 20)] = *(void *)&v14[*(int *)(v15 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10003F13C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (_OWORD *)(a1 + v7);
    id v9 = (_OWORD *)(a2 + v7);
    sub_10003D058(a1 + v7, type metadata accessor for PeopleWidgetProvider.Entry.Content);
    uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      long long v11 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v11;
      *((_WORD *)v8 + 16) = *((_WORD *)v9 + 16);
      uint64_t v12 = *(int *)(sub_1000022D0(&qword_100051630) + 48);
      id v13 = (char *)v8 + v12;
      id v14 = (char *)v9 + v12;
      uint64_t v15 = type metadata accessor for PeopleWidgetProvider.Entry.Content.LocationInfo(0);
      uint64_t v16 = *(void *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        uint64_t v17 = sub_1000022D0(&qword_100051628);
        memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        uint64_t v18 = sub_100041C9C();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v13, v14, v18);
        *(void *)&v13[*(int *)(v15 + 20)] = *(void *)&v14[*(int *)(v15 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003F35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003F370);
}

uint64_t sub_10003F370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100041F0C();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    long long v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10003F468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003F47C);
}

uint64_t sub_10003F47C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100041F0C();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for PeopleWidgetProvider.Entry.Content(0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_10003F580()
{
  uint64_t result = sub_100041F0C();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PeopleWidgetProvider.Entry.Content(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PeopleWidgetProvider.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PeopleWidgetProvider.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10003F7A4);
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

uint64_t sub_10003F7CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10003F7D4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PeopleWidgetProvider.Error()
{
  return &type metadata for PeopleWidgetProvider.Error;
}

unint64_t sub_10003F7F0()
{
  unint64_t result = qword_1000519E8;
  if (!qword_1000519E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000519E8);
  }
  return result;
}

void *sub_10003F844(void *a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    uint64_t v8 = a2[1];
    uint64_t v9 = a2[2];
    *a1 = v5;
    a1[1] = v8;
    a1[2] = v9;
    uint64_t v10 = a3[6];
    long long v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_100041CCC();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_retain();
    swift_retain();
    v14(v11, v12, v13);
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_100041B9C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = a3[8];
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
  }
  swift_retain();
  return a1;
}

uint64_t sub_10003F9A4(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100041CCC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_100041B9C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_release();
}

void *sub_10003FA7C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100041CCC();
  long long v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_100041B9C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_retain();
  return a1;
}

void *sub_10003FB94(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100041CCC();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100041B9C();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[8];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10003FCB4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100041CCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100041B9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_10003FD9C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100041CCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100041B9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_10003FEA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003FEB4);
}

uint64_t sub_10003FEB4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100041CCC();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100041B9C();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_10003FFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003FFF4);
}

void *sub_10003FFF4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100041CCC();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100041B9C();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 28);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t _s12DependenciesVMa_0()
{
  uint64_t result = qword_100051A48;
  if (!qword_100051A48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004016C()
{
  uint64_t result = sub_100041CCC();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100041B9C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t *sub_100040254(uint64_t a1)
{
  uint64_t v15 = sub_100041F5C();
  uint64_t v3 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    v13[1] = v1;
    uint64_t v16 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100040BEC(0, v6, 0);
    uint64_t v7 = v16;
    uint64_t v8 = *(void *)(sub_100041E1C() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v14 = *(void *)(v8 + 72);
    do
    {
      sub_100041E0C();
      uint64_t v16 = v7;
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_100040BEC(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v16;
      }
      v7[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v11, v5, v15);
      v9 += v14;
      --v6;
    }
    while (v6);
  }
  return v7;
}

BOOL sub_10004043C()
{
  return (sub_100041B3C() & 1) == 0;
}

uint64_t sub_10004045C(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_100041F1C();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  void v1[6] = swift_task_alloc();
  uint64_t v3 = sub_1000022D0(&qword_100051A98);
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v4 = sub_100041F2C();
  v1[10] = v4;
  v1[11] = *(void *)(v4 - 8);
  v1[12] = swift_task_alloc();
  sub_100041F3C();
  v1[13] = swift_task_alloc();
  return _swift_task_switch(sub_100040604, 0, 0);
}

uint64_t sub_100040604()
{
  (*(void (**)(void, void, void))(v0[11] + 104))(v0[12], enum case for ClientOrigin.findMyApp(_:), v0[10]);
  sub_100041F4C();
  sub_100041F7C();
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000406E8;
  uint64_t v2 = v0[13];
  return Session.init(_:)(v2);
}

uint64_t sub_1000406E8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000407E8, 0, 0);
}

uint64_t sub_1000407E8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = sub_100040254(v0[3]);
  v0[16] = (uint64_t)v4;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for LocatePriority.backgroundAppRefresh(_:), v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[17] = (uint64_t)v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000408E0;
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[6];
  return Session.startRefreshingLocation(forHandles:priority:reverseGeocode:)(v6, v4, v7, 0);
}

uint64_t sub_1000408E0()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v4 = (void (**)(uint64_t, uint64_t))(v3 + 8);
  if (v0)
  {
    (*v4)(v2[6], v2[4]);
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_100040B34;
  }
  else
  {
    uint64_t v7 = v2[8];
    uint64_t v6 = v2[9];
    uint64_t v9 = v2[6];
    uint64_t v8 = v2[7];
    uint64_t v10 = v2[4];
    swift_bridgeObjectRelease();
    (*v4)(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v5 = sub_100040A9C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100040A9C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100040B34()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100040BCC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100040C0C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100040BEC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100040D6C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100040C0C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000022D0(&qword_100050F50);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100042EAC();
  __break(1u);
  return result;
}

uint64_t sub_100040D6C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000022D0(&qword_100051AA0);
  uint64_t v10 = *(void *)(sub_100041F5C() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100041F5C() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100042EAC();
  __break(1u);
  return result;
}

uint64_t sub_100040FAC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_100040FE0()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100051AA8 = (uint64_t)result;
  return result;
}

uint64_t sub_100041038()
{
  uint64_t v0 = sub_1000420CC();
  sub_100005928(v0, qword_1000530A8);
  sub_100003E70(v0, (uint64_t)qword_1000530A8);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420BC();
}

uint64_t sub_1000410E0()
{
  uint64_t v0 = sub_1000420CC();
  sub_100005928(v0, qword_1000530C0);
  sub_100003E70(v0, (uint64_t)qword_1000530C0);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420BC();
}

uint64_t sub_100041188()
{
  uint64_t v0 = sub_1000420CC();
  sub_100005928(v0, qword_1000530D8);
  sub_100003E70(v0, (uint64_t)qword_1000530D8);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420BC();
}

uint64_t sub_100041230()
{
  uint64_t v0 = sub_1000420CC();
  sub_100005928(v0, qword_1000530F0);
  sub_100003E70(v0, (uint64_t)qword_1000530F0);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420BC();
}

uint64_t sub_1000412D8()
{
  uint64_t v0 = sub_1000420EC();
  sub_100005928(v0, qword_100053108);
  sub_100003E70(v0, (uint64_t)qword_100053108);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420DC();
}

uint64_t sub_100041380()
{
  uint64_t v0 = sub_1000420EC();
  sub_100005928(v0, qword_100053120);
  sub_100003E70(v0, (uint64_t)qword_100053120);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420DC();
}

uint64_t sub_100041428()
{
  uint64_t v0 = sub_1000420EC();
  sub_100005928(v0, qword_100053138);
  sub_100003E70(v0, (uint64_t)qword_100053138);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420DC();
}

uint64_t sub_1000414D0()
{
  uint64_t v0 = sub_1000420EC();
  sub_100005928(v0, qword_100053150);
  sub_100003E70(v0, (uint64_t)qword_100053150);
  if (qword_1000502B0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100051AA8;
  return sub_1000420DC();
}

uint64_t sub_100041578()
{
  return sub_100041724(1);
}

uint64_t sub_100041580(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_100053058 == -1)
  {
    if (qword_100053060) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_100053058, 0, (dispatch_function_t)sub_10004171C);
    if (qword_100053060) {
      return _availability_version_check();
    }
  }
  if (qword_100053050 == -1)
  {
    BOOL v8 = dword_100053040 < a2;
    if (dword_100053040 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100053050, 0, (dispatch_function_t)sub_100041578);
    BOOL v8 = dword_100053040 < a2;
    if (dword_100053040 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_100053044 > a3) {
    return 1;
  }
  return dword_100053044 >= a3 && dword_100053048 >= a4;
}

uint64_t sub_10004171C()
{
  return sub_100041724(0);
}

uint64_t sub_100041724(uint64_t result)
{
  id v1 = (uint64_t (**)(void))qword_100053060;
  if (qword_100053060) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      id v1 = &__availability_version_check;
      qword_100053060 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            int64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    id v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        unint64_t v12 = (FILE *)result;
                        id result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              id v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_100053040, &dword_100053044, &dword_100053048);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100041A6C()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100041A7C()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100041A8C()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100041A9C()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100041AAC()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100041ADC()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100041AEC()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100041AFC()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100041B0C()
{
  return IntentItemCollection.items.getter();
}

uint64_t sub_100041B1C()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100041B3C()
{
  return static SystemInfo.isKoreaSKU.getter();
}

uint64_t sub_100041B4C()
{
  return FindMyRelativeDate.date.getter();
}

uint64_t sub_100041B5C()
{
  return type metadata accessor for FindMyRelativeDate();
}

uint64_t sub_100041B6C()
{
  return PersonEntity.person.getter();
}

uint64_t sub_100041B7C()
{
  return type metadata accessor for PersonEntity();
}

uint64_t sub_100041B8C()
{
  return static PersonEntityQuery.Dependencies.live()();
}

uint64_t sub_100041B9C()
{
  return type metadata accessor for PersonEntityQuery.Dependencies();
}

uint64_t sub_100041BAC()
{
  return PersonEntityQuery.init(dependencies:)();
}

uint64_t sub_100041BBC()
{
  return type metadata accessor for PersonEntityQuery();
}

uint64_t sub_100041BCC()
{
  return PublishedLocation.MotionActivity.badge.getter();
}

uint64_t sub_100041BDC()
{
  return type metadata accessor for PublishedLocation.MotionActivity();
}

uint64_t sub_100041BEC()
{
  return PublishedLocation.motionActivity.getter();
}

uint64_t sub_100041BFC()
{
  return static PublishedLocation.Label.noLocationLabel.getter();
}

uint64_t sub_100041C0C()
{
  return type metadata accessor for PublishedLocation.Label.DetailLevel();
}

uint64_t sub_100041C1C()
{
  return PublishedLocation.Label.primaryAndSecondary(detailLevel:)();
}

uint64_t sub_100041C2C()
{
  return type metadata accessor for PublishedLocation.Label();
}

uint64_t sub_100041C3C()
{
  return PublishedLocation.label.getter();
}

uint64_t sub_100041C4C()
{
  return PublishedLocation.value.getter();
}

uint64_t sub_100041C5C()
{
  return PublishedLocation.Priority.badge.getter();
}

uint64_t sub_100041C6C()
{
  return type metadata accessor for PublishedLocation.Priority();
}

uint64_t sub_100041C7C()
{
  return PublishedLocation.priority.getter();
}

uint64_t sub_100041C8C()
{
  return PublishedLocation.timestamp.getter();
}

uint64_t sub_100041C9C()
{
  return type metadata accessor for PublishedLocation();
}

uint64_t sub_100041CAC()
{
  return type metadata accessor for GetPersonCachedLocationIntent.FetchLocationError();
}

uint64_t sub_100041CBC()
{
  return static GetPersonCachedLocationIntent.Dependencies.live()();
}

uint64_t sub_100041CCC()
{
  return type metadata accessor for GetPersonCachedLocationIntent.Dependencies();
}

uint64_t sub_100041CDC()
{
  return GetPersonCachedLocationIntent.init(dependencies:)();
}

uint64_t sub_100041CEC()
{
  return GetPersonCachedLocationIntent.Result.location.getter();
}

uint64_t sub_100041CFC()
{
  return type metadata accessor for GetPersonCachedLocationIntent.Result();
}

uint64_t sub_100041D0C()
{
  return GetPersonCachedLocationIntent.person.setter();
}

uint64_t sub_100041D2C()
{
  return type metadata accessor for GetPersonCachedLocationIntent();
}

uint64_t sub_100041D3C()
{
  return Badge.systemSymbol.getter();
}

uint64_t sub_100041D4C()
{
  return type metadata accessor for Badge();
}

uint64_t sub_100041D5C()
{
  return Person.Relationship.Following.isPendingRequest.getter();
}

uint64_t sub_100041D6C()
{
  return Person.Relationship.Following.isActive.getter();
}

uint64_t sub_100041D7C()
{
  return type metadata accessor for Person.Relationship.Following();
}

uint64_t sub_100041D8C()
{
  return Person.Relationship.following.getter();
}

uint64_t sub_100041D9C()
{
  return type metadata accessor for Person.Relationship();
}

CNContact sub_100041DAC()
{
  return Person.lightContact()();
}

uint64_t sub_100041DBC()
{
  return Person.relationship.getter();
}

uint64_t sub_100041DCC()
{
  return Person.UniqueIdentifier.valueWithoutPrefix.getter();
}

uint64_t sub_100041DDC()
{
  return type metadata accessor for Person.UniqueIdentifier();
}

uint64_t sub_100041DEC()
{
  return Person.AssociatedHandles.mainHandle.getter();
}

uint64_t sub_100041DFC()
{
  return type metadata accessor for Person.AssociatedHandles();
}

uint64_t sub_100041E0C()
{
  return Person.Handle.fmlHandle.getter();
}

uint64_t sub_100041E1C()
{
  return type metadata accessor for Person.Handle();
}

uint64_t sub_100041E2C()
{
  return Person.handles.getter();
}

uint64_t sub_100041E3C()
{
  return Person.uniqueID.getter();
}

uint64_t sub_100041E4C()
{
  return type metadata accessor for Person();
}

uint64_t sub_100041E5C()
{
  return Location.coordinate.getter();
}

uint64_t sub_100041E6C()
{
  return Location.horizontalAccuracy.getter();
}

uint64_t sub_100041E7C()
{
  return type metadata accessor for Location();
}

uint64_t sub_100041E8C(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100041E9C()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100041EAC()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100041EBC()
{
  return URL.init(string:)();
}

uint64_t sub_100041ECC()
{
  return type metadata accessor for URL();
}

uint64_t sub_100041EDC()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_100041EEC()
{
  return static Date.now.getter();
}

uint64_t sub_100041EFC()
{
  return Date.init()();
}

uint64_t sub_100041F0C()
{
  return type metadata accessor for Date();
}

uint64_t sub_100041F1C()
{
  return type metadata accessor for LocatePriority();
}

uint64_t sub_100041F2C()
{
  return type metadata accessor for ClientOrigin();
}

uint64_t sub_100041F3C()
{
  return type metadata accessor for RequestOrigin();
}

uint64_t sub_100041F4C()
{
  return RequestOrigin.init(_:)();
}

uint64_t sub_100041F5C()
{
  return type metadata accessor for Handle();
}

uint64_t sub_100041F7C()
{
  return type metadata accessor for Session();
}

uint64_t sub_100041F9C()
{
  return static BadgeOffsetStyle.topCircleBottomTrailing.getter();
}

uint64_t sub_100041FAC()
{
  return type metadata accessor for BadgeOffsetStyle();
}

uint64_t sub_100041FBC()
{
  return BackgroundBaseView.init()();
}

uint64_t sub_100041FCC()
{
  return type metadata accessor for BackgroundBaseView();
}

uint64_t sub_100041FDC()
{
  return BackgroundBlurView.init()();
}

uint64_t sub_100041FEC()
{
  return type metadata accessor for BackgroundBlurView();
}

uint64_t sub_100041FFC()
{
  return BackgroundGridView.init()();
}

uint64_t sub_10004200C()
{
  return type metadata accessor for BackgroundGridView();
}

uint64_t sub_10004201C()
{
  return StaticMapGenerator.Annotation.init(coordinate:accuracyRadius:accuracyFillColor:accuracyStrokeColor:)();
}

uint64_t sub_10004202C()
{
  return type metadata accessor for StaticMapGenerator.Annotation();
}

uint64_t sub_10004204C()
{
  return static ContactImageGenerator.generateImage(forContact:layoutDirectionIsRTL:size:scale:)();
}

uint64_t sub_10004205C()
{
  return BadgeView.Style.init(badgeIconFont:supportsDynamicSize:border:)();
}

uint64_t sub_10004206C()
{
  return BadgeView.Style.Border.init(color:shadow:)();
}

uint64_t sub_10004207C()
{
  return type metadata accessor for BadgeView.Style.Border();
}

uint64_t sub_10004208C()
{
  return BadgeView.Style.Shadow.init(color:radius:offset:)();
}

uint64_t sub_10004209C()
{
  return type metadata accessor for BadgeView.Style.Shadow();
}

uint64_t sub_1000420AC()
{
  return type metadata accessor for BadgeView.Style();
}

uint64_t sub_1000420BC()
{
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_1000420CC()
{
  return type metadata accessor for ColorResource();
}

uint64_t sub_1000420DC()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_1000420EC()
{
  return type metadata accessor for ImageResource();
}

uint64_t sub_1000420FC()
{
  return Logger.logObject.getter();
}

uint64_t sub_10004210C()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10004211C()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10004212C()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_10004213C()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_10004214C()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10004215C()
{
  return static AlignmentID._combineExplicit(childValue:_:into:)();
}

uint64_t sub_10004216C()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_10004217C()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_10004218C()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10004219C()
{
  return static ShadowStyle.drop(color:radius:x:y:)();
}

uint64_t sub_1000421AC()
{
  return type metadata accessor for ShadowStyle();
}

uint64_t sub_1000421BC()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000421CC()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000421DC()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1000421EC()
{
  return GeometryProxy.subscript.getter();
}

uint64_t sub_1000421FC()
{
  return GeometryReader.init(content:)();
}

uint64_t sub_10004220C()
{
  return type metadata accessor for GeometryReader();
}

uint64_t sub_10004221C()
{
  return static SymbolVariants.fill.getter();
}

uint64_t sub_10004222C()
{
  return type metadata accessor for SymbolVariants();
}

uint64_t sub_10004223C()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_10004224C()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_10004225C()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t sub_10004226C()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_10004227C()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_10004228C()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_10004229C()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_1000422AC()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000422BC()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_1000422CC()
{
  return EnvironmentValues.pixelLength.getter();
}

uint64_t sub_1000422DC()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000422EC()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1000422FC()
{
  return EnvironmentValues.fontDefinition.getter();
}

uint64_t sub_10004230C()
{
  return EnvironmentValues.fontDefinition.setter();
}

uint64_t sub_10004231C()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_10004232C()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_10004233C()
{
  return EnvironmentValues.backgroundMaterial.getter();
}

uint64_t sub_10004234C()
{
  return EnvironmentValues.backgroundMaterial.setter();
}

uint64_t sub_10004235C()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10004236C()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10004237C()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10004238C()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10004239C()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_1000423AC()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_1000423BC()
{
  return EnvironmentValues.widgetContentMargins.getter();
}

uint64_t sub_1000423CC()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000423DC()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000423EC()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000423FC()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10004240C()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t sub_10004241C()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_10004242C()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10004243C()
{
  return VerticalAlignment.init(_:)();
}

uint64_t sub_10004244C()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t sub_10004245C()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:style:)();
}

uint64_t sub_10004246C()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

void sub_10004247C(Swift::String a1)
{
}

void sub_10004248C(Swift::String a1)
{
}

uint64_t sub_10004249C()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000424AC()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_1000424BC()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000424CC()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_1000424DC()
{
  return LocalizedStringKey.init(_:)();
}

uint64_t sub_1000424EC()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000424FC()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10004250C()
{
  return HorizontalAlignment.init(_:)();
}

uint64_t sub_10004251C()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_10004252C()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_10004253C()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_10004254C()
{
  return WidgetConfiguration.supportsAccentedContent()();
}

uint64_t sub_10004255C()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10004256C()
{
  return WidgetConfiguration._containerBackgroundRemovable(_:)();
}

uint64_t sub_10004257C()
{
  return WidgetConfiguration.enableContentMarginsForFirstParty(_:)();
}

uint64_t sub_10004258C()
{
  return WidgetConfiguration.enabled(_:)();
}

uint64_t sub_10004259C()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_1000425AC()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000425BC()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_1000425CC()
{
  return static _ForegroundLayerLevel.secondary.getter();
}

uint64_t sub_1000425DC()
{
  return type metadata accessor for _ForegroundLayerLevel();
}

uint64_t sub_1000425EC()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_1000425FC()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_10004260C()
{
  return SafeAreaPaddingModifier.init(edges:insets:)();
}

uint64_t sub_10004261C()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_10004262C()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_10004263C()
{
  return _ForegroundLayerLevelViewModifier.init(level:)();
}

uint64_t sub_10004264C()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10004265C()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_10004266C()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10004267C()
{
  return static Font.subheadline.getter();
}

uint64_t sub_10004268C()
{
  return Font.bold()();
}

uint64_t sub_10004269C()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000426AC()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000426BC()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000426CC()
{
  return Font.weight(_:)();
}

uint64_t sub_1000426DC()
{
  return static Font.caption2.getter();
}

uint64_t sub_1000426EC()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000426FC()
{
  return Path.move(to:)();
}

uint64_t sub_10004270C()
{
  return Path.union(_:eoFill:)();
}

uint64_t sub_10004271C()
{
  return Path.addLine(to:)();
}

uint64_t sub_10004272C()
{
  return Path.addCurve(to:control1:control2:)();
}

void sub_10004273C(Swift::OpaquePointer _, CGAffineTransform *transform)
{
}

uint64_t sub_10004274C()
{
  return Path.offsetBy(dx:dy:)();
}

uint64_t sub_10004275C()
{
  return Path.init(ellipseIn:)();
}

uint64_t sub_10004276C()
{
  return Path.init(_:)();
}

uint64_t sub_10004277C()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_10004278C()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_10004279C()
{
  return Text.font(_:)();
}

uint64_t sub_1000427AC()
{
  return Text.Layout.Line.typographicBounds.getter();
}

uint64_t sub_1000427BC()
{
  return type metadata accessor for Text.Layout.Line();
}

uint64_t sub_1000427CC()
{
  return type metadata accessor for Text.Layout();
}

uint64_t sub_1000427DC()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration.Style();
}

uint64_t sub_1000427EC()
{
  return Text.DateStyle.UnitsConfiguration.init(units:style:)();
}

uint64_t sub_1000427FC()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration();
}

uint64_t sub_10004280C()
{
  return static Text.DateStyle.relative(unitConfiguration:)();
}

uint64_t sub_10004281C()
{
  return type metadata accessor for Text.DateStyle();
}

uint64_t sub_10004282C()
{
  return Text.LayoutKey.AnchoredLayout.layout.getter();
}

uint64_t sub_10004283C()
{
  return Text.LayoutKey.AnchoredLayout.origin.getter();
}

uint64_t sub_10004284C()
{
  return type metadata accessor for Text.LayoutKey.AnchoredLayout();
}

uint64_t sub_10004285C()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10004286C()
{
  return View.badge(_:offsetStyle:style:)();
}

uint64_t sub_10004287C()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_10004288C()
{
  return View.widgetURL(_:)();
}

uint64_t sub_10004289C()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000428AC()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000428BC()
{
  return View.drawingGroup(opaque:colorMode:)();
}

uint64_t sub_1000428CC()
{
  return View.symbolVariant(_:)();
}

uint64_t sub_1000428DC()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000428EC()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1000428FC()
{
  return View.frame(width:height:alignment:)();
}

uint64_t sub_10004290C()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10004291C()
{
  return View.padding(_:_:)();
}

uint64_t sub_10004292C()
{
  return View.redacted(reason:)();
}

uint64_t sub_10004293C()
{
  return static Color.red.getter();
}

uint64_t sub_10004294C()
{
  return static Color.blue.getter();
}

uint64_t sub_10004295C()
{
  return static Color.black.getter();
}

uint64_t sub_10004296C()
{
  return Color.opacity(_:)();
}

uint64_t sub_10004297C()
{
  return Color.init(_:)();
}

uint64_t sub_10004298C()
{
  return Image.init(uiImage:)();
}

uint64_t sub_10004299C()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000429AC()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_1000429BC()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_1000429CC()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_1000429DC()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_1000429EC()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000429FC()
{
  return Image.init(_:)();
}

uint64_t sub_100042A1C()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_100042A3C()
{
  return static Shape.role.getter();
}

uint64_t sub_100042A5C()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_100042A6C()
{
  return type metadata accessor for HStack();
}

uint64_t sub_100042A7C()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_100042A8C()
{
  return type metadata accessor for VStack();
}

uint64_t sub_100042A9C()
{
  return ZStack.init(alignment:content:)();
}

uint64_t sub_100042AAC()
{
  return type metadata accessor for ZStack();
}

uint64_t sub_100042ABC()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_100042ACC()
{
  return static Material.ultraThick.getter();
}

uint64_t sub_100042ADC()
{
  return type metadata accessor for Material();
}

uint64_t sub_100042AEC()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_100042AFC()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_100042B0C()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t sub_100042B1C()
{
  return static Alignment.top.getter();
}

uint64_t sub_100042B2C()
{
  return static Alignment.center.getter();
}

uint64_t sub_100042B3C()
{
  return static Alignment.trailing.getter();
}

uint64_t sub_100042B4C()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_100042B5C()
{
  return TupleView.init(_:)();
}

uint64_t sub_100042B6C()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_100042B7C()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_100042B8C()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_100042B9C()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_100042BAC()
{
  return static WidgetAccentedRenderingMode.accented.getter();
}

uint64_t sub_100042BBC()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_100042BCC()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_100042BDC()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_100042BEC()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_100042BFC()
{
  return static TimelineReloadPolicy.atEnd.getter();
}

uint64_t sub_100042C0C()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100042C1C()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100042C2C()
{
  return AppIntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_100042C3C()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_100042C4C()
{
  return TimelineProviderContext.EnvironmentVariants.subscript.getter();
}

uint64_t sub_100042C5C()
{
  return type metadata accessor for TimelineProviderContext.EnvironmentVariants();
}

uint64_t sub_100042C6C()
{
  return TimelineProviderContext.environmentVariants.getter();
}

uint64_t sub_100042C7C()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_100042C8C()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_100042C9C()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_100042CBC()
{
  return AppIntentTimelineProvider.recommendations()();
}

uint64_t sub_100042CDC()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_100042CEC()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_100042CFC()
{
  return ObjectIdentifier.debugDescription.getter();
}

uint64_t sub_100042D0C()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100042D1C()
{
  return String.init<A>(describing:)();
}

void sub_100042D2C(Swift::String a1)
{
}

Swift::Int sub_100042D3C()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_100042D4C(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_100042D5C()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100042D6C()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100042D7C()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100042D8C()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100042D9C()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100042DAC()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_100042DBC()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_100042DCC()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_100042DDC()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100042DEC()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100042DFC()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100042E0C()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100042E1C()
{
  return UIColor.init(resource:)();
}

uint64_t sub_100042E2C()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100042E3C()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100042E4C()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100042E5C()
{
  return StringProtocol.components<A>(separatedBy:)();
}

void sub_100042E6C(Swift::Int a1)
{
}

uint64_t sub_100042E7C()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100042E8C()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100042E9C()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100042EAC()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100042EBC()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100042ECC()
{
  return Error._code.getter();
}

uint64_t sub_100042EDC()
{
  return Error._domain.getter();
}

uint64_t sub_100042EEC()
{
  return Error._userInfo.getter();
}

uint64_t sub_100042EFC()
{
  return Hasher.init(_seed:)();
}

void sub_100042F0C(Swift::UInt a1)
{
}

Swift::Int sub_100042F1C()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
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

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}