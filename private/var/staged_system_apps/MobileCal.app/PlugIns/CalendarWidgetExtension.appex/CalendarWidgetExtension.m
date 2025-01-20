unint64_t sub_100004338()
{
  unint64_t result;

  result = qword_10006C600;
  if (!qword_10006C600)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C600);
  }
  return result;
}

unint64_t sub_100004390()
{
  unint64_t result = qword_10006C608;
  if (!qword_10006C608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C608);
  }
  return result;
}

uint64_t sub_1000043E4(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_100004404, 0, 0);
}

uint64_t sub_100004404()
{
  *(unsigned char *)(v0 + 136) = CalEnableTravelAdvisoriesForAutomaticBehavior();
  uint64_t v1 = self;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_100004514;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_10000464C;
  *(void *)(v0 + 104) = &unk_100069AC8;
  *(void *)(v0 + 112) = v2;
  [v1 ttlLocationStatusWithCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100004514()
{
  return _swift_task_switch(sub_1000045F4, 0, 0);
}

uint64_t sub_1000045F4()
{
  uint64_t v1 = *(void *)(v0 + 120);
  if (v1 == 4)
  {
    BOOL v2 = 0;
    BOOL v3 = 0;
    if (!*(unsigned char *)(v0 + 136)) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v2 = v1 != 0;
    if ((*(unsigned char *)(v0 + 136) & 1) == 0)
    {
      BOOL v3 = 0;
      goto LABEL_7;
    }
  }
  BOOL v3 = !v2;
LABEL_7:
  **(unsigned char **)(v0 + 128) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000464C(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_100004670(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 128) = *a2;
  return _swift_task_switch(sub_100004694, 0, 0);
}

uint64_t sub_100004694()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000479C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000464C;
  v0[13] = &unk_100069AB0;
  v0[14] = v2;
  [v1 ttlLocationStatusWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000479C()
{
  return _swift_task_switch(sub_10000487C, 0, 0);
}

uint64_t sub_10000487C()
{
  if ((*(void *)(v0 + 120) | 4) == 4)
  {
    CalSetEnableTravelAdvisoriesForAutomaticBehavior();
  }
  else
  {
    sub_10000812C();
    swift_allocError();
    *uint64_t v2 = 4;
    swift_willThrow();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100004938()
{
  sub_100007DEC(&qword_10006C780);
  __chkstk_darwin();
  uint64_t v1 = &v9[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10004B330();
  __chkstk_darwin();
  sub_10004B4E0();
  __chkstk_darwin();
  uint64_t v6 = sub_10004B2F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v1, 1, 1, v6);
  return sub_10004B260();
}

uint64_t sub_100004C10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v18 = a1;
  sub_100007DEC(&qword_10006C7D0);
  ((void (*)(void))__chkstk_darwin)();
  v17 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007DEC(&qword_10006C780);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004B330();
  ((void (*)(void))__chkstk_darwin)();
  sub_10004B4E0();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v10);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_10004B160();
  uint64_t v12 = sub_100008180(v11, (uint64_t)qword_10006E0F0);
  uint64_t v13 = *(void *)(v11 - 8);
  v14 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v17, v12, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v14, 0, 1, v11);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_100005020()
{
  uint64_t v0 = qword_10006C460;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000505C()
{
  unint64_t result = qword_10006C610;
  if (!qword_10006C610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C610);
  }
  return result;
}

unint64_t sub_1000050B4()
{
  unint64_t result = qword_10006C618;
  if (!qword_10006C618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C618);
  }
  return result;
}

unint64_t sub_10000510C()
{
  unint64_t result = qword_10006C620;
  if (!qword_10006C620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C620);
  }
  return result;
}

unint64_t sub_100005164()
{
  unint64_t result = qword_10006C628;
  if (!qword_10006C628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C628);
  }
  return result;
}

void *sub_1000051B8()
{
  return &protocol witness table for String;
}

unint64_t sub_1000051CC()
{
  unint64_t result = qword_10006C630;
  if (!qword_10006C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C630);
  }
  return result;
}

unint64_t sub_100005224()
{
  unint64_t result = qword_10006C638;
  if (!qword_10006C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C638);
  }
  return result;
}

unint64_t sub_10000527C()
{
  unint64_t result = qword_10006C640;
  if (!qword_10006C640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C640);
  }
  return result;
}

unint64_t sub_1000052D4()
{
  unint64_t result = qword_10006C648;
  if (!qword_10006C648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C648);
  }
  return result;
}

void *sub_100005328()
{
  return &protocol witness table for String;
}

void sub_100005334(void *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x8000000100052FC0;
}

uint64_t sub_10000535C()
{
  return sub_100008248(&qword_10006C650, &qword_10006C658);
}

uint64_t sub_100005398(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000053E0(uint64_t a1)
{
  unint64_t v2 = sub_100004338();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005430()
{
  unint64_t result = qword_10006C660;
  if (!qword_10006C660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C660);
  }
  return result;
}

uint64_t sub_100005488(uint64_t a1)
{
  unint64_t v2 = sub_1000052D4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000054D8()
{
  unint64_t result = qword_10006C668;
  if (!qword_10006C668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C668);
  }
  return result;
}

uint64_t sub_10000552C()
{
  return sub_100008248(&qword_10006C670, &qword_10006C678);
}

uint64_t sub_100005568()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DEA8);
  sub_100008180(v6, (uint64_t)qword_10006DEA8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_100005768()
{
  sub_10004AF90();
  return v1;
}

uint64_t sub_10000579C()
{
  uint64_t result = swift_getKeyPath();
  qword_10006DEC0 = result;
  return result;
}

uint64_t sub_1000057C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1000057D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_10000586C, v5, v4);
}

uint64_t sub_10000586C()
{
  sub_10004AF90();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 80) = v1;
  sub_10004AF90();
  *(unsigned char *)(v0 + 113) = *(unsigned char *)(v0 + 112);
  if (qword_10006C478 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006DEC0;
  *(void *)(v0 + 88) = qword_10006DEC0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_100008248(&qword_10006C7B0, &qword_10006C7B8);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000059C4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v5 = sub_100005B88;
  }
  else {
    uint64_t v5 = sub_100005B18;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100005B18()
{
  swift_release();
  sub_10004AF70();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005B88()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005BEC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10004AF90();
  *a1 = v3;
  return result;
}

uint64_t sub_100005C28()
{
  return swift_release();
}

uint64_t (*sub_100005C70(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004AF80();
  return sub_100005CCC;
}

uint64_t sub_100005CD0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004AF90();
  *a1 = v3;
  return result;
}

uint64_t sub_100005D0C()
{
  return sub_10004AFA0();
}

uint64_t (*sub_100005D44(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004AF80();
  return sub_100005CCC;
}

void sub_100005DA0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100005DEC()
{
  if (qword_10006C478 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100005E4C()
{
  unint64_t result = qword_10006C680;
  if (!qword_10006C680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C680);
  }
  return result;
}

unint64_t sub_100005EA4()
{
  unint64_t result = qword_10006C688;
  if (!qword_10006C688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C688);
  }
  return result;
}

uint64_t sub_100005EF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005F14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005F64@<X0>(uint64_t a1@<X8>)
{
  if (qword_10006C470 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004B2F0();
  uint64_t v3 = sub_100008180(v2, (uint64_t)qword_10006DEA8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100006020(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_1000057D0(a1, v5, v4);
}

uint64_t sub_1000060CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char *sub_1000061C0@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_100007624();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000061E8(uint64_t a1)
{
  unint64_t v2 = sub_1000054D8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100006228()
{
  unint64_t result = qword_10006C698;
  if (!qword_10006C698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C698);
  }
  return result;
}

unint64_t sub_100006280()
{
  unint64_t result = qword_10006C6A0[0];
  if (!qword_10006C6A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006C6A0);
  }
  return result;
}

uint64_t sub_1000062D4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006C798 + dword_10006C798);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_100006378(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100004390();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100006428(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_100006540()
{
  unint64_t result = qword_10006C6B8;
  if (!qword_10006C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C6B8);
  }
  return result;
}

unint64_t sub_100006598()
{
  unint64_t result = qword_10006C6C0[0];
  if (!qword_10006C6C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006C6C0);
  }
  return result;
}

uint64_t sub_1000065EC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004390();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000066A0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000067A0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100004390();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100006854()
{
  unint64_t result = qword_10006C6D8;
  if (!qword_10006C6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C6D8);
  }
  return result;
}

unint64_t sub_1000068AC()
{
  unint64_t result = qword_10006C6E0;
  if (!qword_10006C6E0)
  {
    sub_100005398(qword_10006C6E8);
    sub_10000527C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C6E0);
  }
  return result;
}

uint64_t sub_100006920(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005164();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000069D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000060CC;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t destroy for UpdateIntent_timeToLeave()
{
  swift_release();

  return swift_release();
}

void *_s23CalendarWidgetExtension24UpdateIntent_timeToLeaveVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for UpdateIntent_timeToLeave(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for UpdateIntent_timeToLeave(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for UpdateIntent_timeToLeave(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateIntent_timeToLeave(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UpdateIntent_timeToLeave(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UpdateIntent_timeToLeave()
{
  return &type metadata for UpdateIntent_timeToLeave;
}

ValueMetadata *type metadata accessor for SettingsTimeToLeaveEntityQuery()
{
  return &type metadata for SettingsTimeToLeaveEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsTimeToLeaveEntity()
{
  return &type metadata for SettingsTimeToLeaveEntity;
}

uint64_t sub_100006C64()
{
  return sub_100008248(&qword_10006C700, &qword_10006C708);
}

uint64_t sub_100006CA0@<X0>(uint64_t a1@<X8>)
{
  v17[1] = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_100007DEC(&qword_10006C7E0);
  uint64_t v5 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007DEC(&qword_10006C7E8);
  v16._object = &protocol witness table for Text;
  sub_100006280();
  sub_100008248(&qword_10006C7F0, &qword_10006C7E8);
  sub_10004B4B0();
  sub_10004B430();
  uint64_t v8 = sub_100008248(&qword_10006C7F8, &qword_10006C7D8);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v9 = (objc_class *)[self mainBundle];
  v16._countAndFlagsBits = 0x8000000100053020;
  v18._object = (void *)0x8000000100053000;
  v18._countAndFlagsBits = 0xD000000000000019;
  v19.value._countAndFlagsBits = 0;
  v19.value._object = 0;
  v10.super.isa = v9;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  uint64_t v11 = sub_10004B2C0(v18, v19, v10, v20, v16);
  uint64_t v13 = v12;

  v17[4] = v11;
  v17[5] = v13;
  v17[2] = v1;
  v17[3] = v8;
  swift_getOpaqueTypeConformance2();
  sub_10000828C();
  uint64_t v14 = v17[0];
  sub_10004B440();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

uint64_t sub_100007068()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v3._countAndFlagsBits = 0x8000000100052D60;
  v4._countAndFlagsBits = 0x206F7420656D6954;
  v4._object = (void *)0xED0000657661654CLL;
  v5.value._countAndFlagsBits = 0;
  v5.value._object = 0;
  v1.super.isa = v0;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  sub_10004B2C0(v4, v5, v1, v6, v3);

  sub_10000828C();
  return sub_10004B470();
}

uint64_t sub_100007150@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100007384@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unsigned char *sub_100007624()
{
  uint64_t v0 = sub_100007DEC((uint64_t *)&unk_10006C770);
  __chkstk_darwin(v0 - 8);
  v46 = &v32[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_10004B230();
  uint64_t v52 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  v49 = &v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v45 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v48 = &v32[-v6];
  uint64_t v7 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v7 - 8);
  v47 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10004B2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10004B330();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10004B4E0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004B2F0();
  uint64_t v40 = v15;
  uint64_t v51 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  v44 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  uint64_t v43 = sub_100007DEC(&qword_10006C788);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v18 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  Swift::String_optional v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104);
  unsigned int v33 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v34 = v9;
  v19(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  v35 = v19;
  uint64_t v36 = v10 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v19(v12, v18, v9);
  Swift::String v20 = v47;
  sub_10004B300();
  v21 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v51 + 56);
  v51 += 56;
  v41 = v21;
  v21(v20, 0, 1, v15);
  uint64_t v54 = 0;
  uint64_t v22 = sub_10004AF60();
  uint64_t v23 = *(void *)(v22 - 8);
  v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  v39 = v24;
  uint64_t v42 = v23 + 56;
  v24(v48, 1, 1, v22);
  v24(v45, 1, 1, v22);
  unsigned int v37 = enum case for InputConnectionBehavior.default(_:);
  v25 = *(void (**)(void))(v52 + 104);
  v52 += 104;
  v38 = (void (*)(unsigned char *, void, uint64_t))v25;
  v25(v49);
  sub_100004338();
  v45 = (unsigned char *)sub_10004AFC0();
  uint64_t v43 = sub_100007DEC(&qword_10006C790);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  v28 = v35;
  v35(v12, v33, v34);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v28(v12, v26, v27);
  v29 = v47;
  sub_10004B300();
  v41(v29, 0, 1, v40);
  char v53 = 2;
  uint64_t v30 = sub_10004B520();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v46, 1, 1, v30);
  v39(v48, 1, 1, v22);
  v38(v49, v37, v50);
  sub_10004AFD0();
  return v45;
}

uint64_t sub_100007DEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007E30()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100007F70, 0, 0);
}

uint64_t sub_100007F70()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006C678);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006C7B0, &qword_10006C7B8);
  uint64_t v4 = sub_10004B2A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

unint64_t sub_10000812C()
{
  unint64_t result = qword_10006C7C0;
  if (!qword_10006C7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10006C7C0);
  }
  return result;
}

uint64_t sub_100008180(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000081B8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for SettingsTimeToLeaveToggleControl()
{
  return &type metadata for SettingsTimeToLeaveToggleControl;
}

uint64_t sub_10000822C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008248(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005398(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000828C()
{
  unint64_t result = qword_10006C800;
  if (!qword_10006C800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C800);
  }
  return result;
}

uint64_t sub_1000082E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000083B8()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006DEC8);
  sub_100008180(v10, (uint64_t)qword_10006DEC8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_100008690()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v0 - 8);
  v173 = (char *)&v160 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100007DEC(&qword_10006C780);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v174 = (char *)&v160 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v172 = (char *)&v160 - v5;
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v160 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v184 = sub_10004B2F0();
  uint64_t v191 = *(void *)(v184 - 8);
  uint64_t v12 = __chkstk_darwin(v184);
  v166 = (char *)&v160 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v165 = (char *)&v160 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v164 = (char *)&v160 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v163 = (char *)&v160 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v162 = (char *)&v160 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v170 = (uint64_t)&v160 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v169 = (uint64_t)&v160 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v171 = (char *)&v160 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v175 = (char *)&v160 - v29;
  __chkstk_darwin(v28);
  v31 = (char *)&v160 - v30;
  sub_100007DEC(&qword_10006C950);
  uint64_t v32 = sub_100007DEC(&qword_10006C958);
  unint64_t v33 = (*(unsigned __int8 *)(*(void *)(v32 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v32 - 8) + 80);
  v181 = *(unsigned char **)(*(void *)(v32 - 8) + 72);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_10004C030;
  uint64_t v167 = v34;
  unint64_t v182 = v34 + v33;
  *(unsigned char *)(v34 + v33) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v35 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  v36(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  uint64_t v168 = (uint64_t)v31;
  sub_10004B310();
  uint64_t v183 = v32;
  sub_10004B4D0();
  sub_10004B320();
  unsigned int v189 = v35;
  uint64_t v179 = v6;
  uint64_t v176 = v7 + 104;
  v188 = v36;
  v36(v9, v35, v6);
  unsigned int v37 = v172;
  sub_10004B310();
  v38 = *(void (**)(char *, void, uint64_t, uint64_t))(v191 + 56);
  v191 += 56;
  v178 = v38;
  v38(v37, 0, 1, v184);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  unint64_t v39 = v182;
  uint64_t v40 = sub_10004B160();
  uint64_t v187 = sub_100008180(v40, (uint64_t)qword_10006E0F0);
  uint64_t v41 = *(void *)(v40 - 8);
  v190 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
  uint64_t v180 = v41 + 16;
  uint64_t v42 = v173;
  v190(v173, v187, v40);
  uint64_t v43 = *(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56);
  uint64_t v177 = v41 + 56;
  v186 = v43;
  v43(v42, 0, 1, v40);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v168 = (uint64_t)&v181[v39 + *(int *)(v183 + 48)];
  v181[v39] = 1;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v44 = v189;
  uint64_t v45 = v179;
  v46 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  v172 = (char *)0x8000000100053550;
  sub_10004B4D0();
  sub_10004B320();
  v46(v9, v44, v45);
  v47 = v174;
  sub_10004B310();
  v178(v47, 0, 1, v184);
  uint64_t v185 = v40;
  v190(v42, v187, v40);
  v186(v42, 0, 1, v40);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v168 = 2 * (void)v181;
  v48 = (unsigned char *)(v182 + 2 * (void)v181);
  v160 = &v48[*(int *)(v183 + 48)];
  unsigned char *v48 = 2;
  unint64_t v161 = 0xD000000000000013;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v49 = v179;
  uint64_t v50 = v188;
  v188(v9, v44, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v50(v9, v44, v49);
  sub_10004B310();
  uint64_t v51 = v47;
  uint64_t v52 = v178;
  v178(v51, 0, 1, v184);
  uint64_t v53 = v185;
  v190(v42, v187, v185);
  v186(v42, 0, 1, v53);
  sub_10004B2D0();
  sub_10004B180();
  unint64_t v54 = v182;
  v55 = &v181[v168 + v182];
  unsigned char *v55 = 3;
  uint64_t v168 = (uint64_t)&v55[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v56 = v189;
  uint64_t v57 = v179;
  v58 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v58(v9, v56, v57);
  v59 = v174;
  sub_10004B310();
  v52(v59, 0, 1, v184);
  v60 = v173;
  uint64_t v61 = v185;
  v190(v173, v187, v185);
  v186(v60, 0, 1, v61);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v169 = 4 * (void)v181;
  v62 = (unsigned char *)(v54 + 4 * (void)v181);
  uint64_t v63 = v183;
  uint64_t v168 = (uint64_t)&v62[*(int *)(v183 + 48)];
  unsigned char *v62 = 4;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v64 = v189;
  uint64_t v65 = v179;
  v66 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v66(v9, v64, v65);
  v67 = v174;
  sub_10004B310();
  v178(v67, 0, 1, v184);
  v68 = v173;
  uint64_t v69 = v185;
  v190(v173, v187, v185);
  v186(v68, 0, 1, v69);
  sub_10004B2D0();
  sub_10004B180();
  v70 = &v181[v169 + v182];
  uint64_t v169 = (uint64_t)&v70[*(int *)(v63 + 48)];
  char *v70 = 5;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v71 = v189;
  uint64_t v72 = v179;
  v73 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v73(v9, v71, v72);
  v74 = v174;
  sub_10004B310();
  v178(v74, 0, 1, v184);
  v75 = v173;
  uint64_t v76 = v185;
  v190(v173, v187, v185);
  v186(v75, 0, 1, v76);
  sub_10004B2D0();
  sub_10004B180();
  v77 = (unsigned char *)(v182 + 6 * (void)v181);
  unsigned char *v77 = 6;
  uint64_t v169 = (uint64_t)&v77[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v78 = v189;
  uint64_t v79 = v72;
  uint64_t v80 = v72;
  v81 = v188;
  v188(v9, v189, v80);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v81(v9, v78, v79);
  v82 = v174;
  sub_10004B310();
  uint64_t v83 = v184;
  v178(v82, 0, 1, v184);
  v84 = v173;
  uint64_t v85 = v185;
  v190(v173, v187, v185);
  v186(v84, 0, 1, v85);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v168 = 8 * (void)v181;
  unint64_t v86 = v182;
  v87 = (unsigned char *)(v182 + 7 * (void)v181);
  uint64_t v170 = (uint64_t)&v87[*(int *)(v183 + 48)];
  unsigned char *v87 = 7;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v88 = v189;
  uint64_t v89 = v179;
  v90 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v90(v9, v88, v89);
  v91 = v174;
  sub_10004B310();
  uint64_t v92 = v83;
  v93 = v178;
  v178(v91, 0, 1, v92);
  v94 = v173;
  uint64_t v95 = v185;
  v190(v173, v187, v185);
  v186(v94, 0, 1, v95);
  sub_10004B2D0();
  sub_10004B180();
  v96 = (unsigned char *)(v86 + v168);
  unsigned char *v96 = 8;
  unint64_t v161 = (unint64_t)&v96[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v97 = v189;
  uint64_t v98 = v179;
  v90(v9, v189, v179);
  sub_10004B310();
  uint64_t v170 = 0x1000000000000029;
  uint64_t v169 = 0x8000000100054010;
  sub_10004B4D0();
  sub_10004B320();
  v90(v9, v97, v98);
  sub_10004B310();
  v93(v91, 0, 1, v184);
  v99 = v173;
  uint64_t v100 = v185;
  v190(v173, v187, v185);
  v186(v99, 0, 1, v100);
  sub_10004B2D0();
  sub_10004B180();
  v101 = &v181[v168 + v182];
  unsigned char *v101 = 9;
  uint64_t v168 = (uint64_t)&v101[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v102 = v189;
  uint64_t v103 = v179;
  v104 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v104(v9, v102, v103);
  v105 = v174;
  sub_10004B310();
  v178(v105, 0, 1, v184);
  v106 = v173;
  uint64_t v107 = v185;
  v190(v173, v187, v185);
  v108 = v186;
  v186(v106, 0, 1, v107);
  sub_10004B2D0();
  sub_10004B180();
  v109 = (unsigned char *)(v182 + 10 * (void)v181);
  unsigned char *v109 = 10;
  uint64_t v168 = (uint64_t)&v109[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v110 = v189;
  uint64_t v111 = v179;
  v112 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v112(v9, v110, v111);
  v113 = v174;
  sub_10004B310();
  v178(v113, 0, 1, v184);
  uint64_t v114 = v185;
  v190(v106, v187, v185);
  v108(v106, 0, 1, v114);
  sub_10004B2D0();
  sub_10004B180();
  v115 = (unsigned char *)(v182 + 11 * (void)v181);
  unsigned char *v115 = 11;
  uint64_t v116 = v183;
  uint64_t v168 = (uint64_t)&v115[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v117 = v189;
  uint64_t v118 = v179;
  v119 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v119(v9, v117, v118);
  v120 = v174;
  sub_10004B310();
  uint64_t v121 = v184;
  v178(v120, 0, 1, v184);
  v122 = v173;
  uint64_t v123 = v185;
  v190(v173, v187, v185);
  v186(v122, 0, 1, v123);
  sub_10004B2D0();
  sub_10004B180();
  v124 = (unsigned char *)(v182 + 12 * (void)v181);
  uint64_t v170 = (uint64_t)&v124[*(int *)(v116 + 48)];
  unsigned char *v124 = 12;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v125 = v189;
  uint64_t v126 = v179;
  v127 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v127(v9, v125, v126);
  v128 = v174;
  sub_10004B310();
  v129 = v178;
  v178(v128, 0, 1, v121);
  v130 = v173;
  uint64_t v131 = v185;
  v190(v173, v187, v185);
  v186(v130, 0, 1, v131);
  sub_10004B2D0();
  v132 = v128;
  sub_10004B180();
  v133 = (unsigned char *)(v182 + 13 * (void)v181);
  unsigned char *v133 = 13;
  uint64_t v170 = (uint64_t)&v133[*(int *)(v183 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v134 = v189;
  v135 = v188;
  v188(v9, v189, v126);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v135(v9, v134, v126);
  sub_10004B310();
  uint64_t v136 = v184;
  v129(v132, 0, 1, v184);
  v137 = v173;
  uint64_t v138 = v185;
  v190(v173, v187, v185);
  v186(v137, 0, 1, v138);
  sub_10004B2D0();
  sub_10004B180();
  v139 = (unsigned char *)(v182 + 14 * (void)v181);
  uint64_t v170 = (uint64_t)&v139[*(int *)(v183 + 48)];
  unsigned char *v139 = 14;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v140 = v189;
  uint64_t v141 = v179;
  v142 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v142(v9, v140, v141);
  v143 = v174;
  sub_10004B310();
  v178(v143, 0, 1, v136);
  uint64_t v144 = v187;
  uint64_t v145 = v185;
  v190(v137, v187, v185);
  v186(v137, 0, 1, v145);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v170 = 16 * (void)v181;
  v146 = (unsigned char *)(v182 + 15 * (void)v181);
  v181 = &v146[*(int *)(v183 + 48)];
  unsigned char *v146 = 15;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v147 = v189;
  uint64_t v148 = v179;
  v149 = v188;
  v188(v9, v189, v179);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v149(v9, v147, v148);
  v150 = v174;
  sub_10004B310();
  v178(v150, 0, 1, v184);
  v151 = v173;
  uint64_t v152 = v144;
  uint64_t v153 = v185;
  v190(v173, v152, v185);
  v186(v151, 0, 1, v153);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v183 = v182 + v170 + *(int *)(v183 + 48);
  *(unsigned char *)(v182 + v170) = 16;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v154 = v189;
  uint64_t v155 = v148;
  uint64_t v156 = v148;
  v157 = v188;
  v188(v9, v189, v156);
  sub_10004B310();
  sub_10004B4D0();
  sub_10004B320();
  v157(v9, v154, v155);
  sub_10004B310();
  v178(v150, 0, 1, v184);
  uint64_t v158 = v185;
  v190(v151, v187, v185);
  v186(v151, 0, 1, v158);
  sub_10004B2D0();
  sub_10004B180();
  unint64_t result = sub_1000430C8(v167);
  qword_10006DEE0 = result;
  return result;
}

uint64_t sub_10000AB44()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C960);
  sub_1000081B8(v0, qword_10006DEE8);
  sub_100008180(v0, (uint64_t)qword_10006DEE8);
  sub_100007DEC(&qword_10006C968);
  uint64_t v1 = *(void *)(sub_100007DEC(&qword_10006C970) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10004C030;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_10000B57C();
  sub_10004B1C0();
  *(unsigned char *)(v5 + v2) = 1;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 4 * v2) = 4;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 5 * v2) = 5;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 6 * v2) = 6;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 7 * v2) = 7;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 8 * v2) = 8;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 9 * v2) = 9;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 10 * v2) = 10;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 11 * v2) = 11;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 12 * v2) = 12;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 13 * v2) = 13;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 14 * v2) = 14;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 15 * v2) = 15;
  sub_10004B1C0();
  *(unsigned char *)(v5 + 16 * v2) = 16;
  sub_10004B1C0();
  sub_100043104(v4);
  return sub_10004B1D0();
}

unint64_t sub_10000B020(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x626D754E6B656577;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0x61727544636E7973;
      break;
    case 7:
    case 15:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 10:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 11:
      unint64_t result = 0x654C6F54656D6974;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 13:
      unint64_t result = 0x6565577472617473;
      break;
    case 14:
      unint64_t result = 0x43746C7561666564;
      break;
    case 16:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      unint64_t result = 1953460082;
      break;
  }
  return result;
}

uint64_t sub_10000B20C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10000B020(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000B020(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10004B5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_10000B29C()
{
  unint64_t result = qword_10006C880;
  if (!qword_10006C880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C880);
  }
  return result;
}

Swift::Int sub_10000B2F0()
{
  char v1 = *v0;
  sub_10004B630();
  sub_10000B020(v1);
  sub_10004B510();
  swift_bridgeObjectRelease();
  return sub_10004B650();
}

uint64_t sub_10000B354()
{
  sub_10000B020(*v0);
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000B3A8()
{
  char v1 = *v0;
  sub_10004B630();
  sub_10000B020(v1);
  sub_10004B510();
  swift_bridgeObjectRelease();
  return sub_10004B650();
}

uint64_t sub_10000B408@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000C604();
  *a1 = result;
  return result;
}

unint64_t sub_10000B438@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000B020(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000B468()
{
  unint64_t result = qword_10006C888;
  if (!qword_10006C888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C888);
  }
  return result;
}

unint64_t sub_10000B4C0()
{
  unint64_t result = qword_10006C890;
  if (!qword_10006C890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C890);
  }
  return result;
}

unint64_t sub_10000B518()
{
  unint64_t result = qword_10006C898;
  if (!qword_10006C898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C898);
  }
  return result;
}

void *sub_10000B56C()
{
  return &protocol witness table for String;
}

unint64_t sub_10000B57C()
{
  unint64_t result = qword_10006C8A0;
  if (!qword_10006C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8A0);
  }
  return result;
}

unint64_t sub_10000B5D4()
{
  unint64_t result = qword_10006C8A8;
  if (!qword_10006C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8A8);
  }
  return result;
}

uint64_t sub_10000B628@<X0>(uint64_t a1@<X8>)
{
  if (qword_10006C490 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007DEC(&qword_10006C960);
  uint64_t v3 = sub_100008180(v2, (uint64_t)qword_10006DEE8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000B6D8()
{
  unint64_t result = qword_10006C8B0;
  if (!qword_10006C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8B0);
  }
  return result;
}

unint64_t sub_10000B730()
{
  unint64_t result = qword_10006C8B8;
  if (!qword_10006C8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8B8);
  }
  return result;
}

unint64_t sub_10000B788()
{
  unint64_t result = qword_10006C8C0;
  if (!qword_10006C8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8C0);
  }
  return result;
}

unint64_t sub_10000B7E0()
{
  unint64_t result = qword_10006C8C8;
  if (!qword_10006C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8C8);
  }
  return result;
}

uint64_t sub_10000B834()
{
  sub_10000CB74();
  uint64_t v2 = sub_10004B140();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_10000CBC8(v3, v0, v2, v1);
}

uint64_t sub_10000B8C8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C480, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006DEC8, a1);
}

uint64_t sub_10000B900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C0D4(a1, a2, a3, (void (*)(void))sub_10000B57C);
}

uint64_t sub_10000B92C(uint64_t a1)
{
  unint64_t v2 = sub_10000B57C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000B97C()
{
  unint64_t result = qword_10006C8D8;
  if (!qword_10006C8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8D8);
  }
  return result;
}

unint64_t sub_10000B9D4()
{
  unint64_t result = qword_10006C8E0;
  if (!qword_10006C8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8E0);
  }
  return result;
}

unint64_t sub_10000BA2C()
{
  unint64_t result = qword_10006C8E8;
  if (!qword_10006C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8E8);
  }
  return result;
}

uint64_t sub_10000BA80()
{
  if (qword_10006C488 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000BADC(uint64_t a1)
{
  unint64_t v2 = sub_10000B7E0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000BB2C()
{
  unint64_t result = qword_10006C8F0;
  if (!qword_10006C8F0)
  {
    sub_100005398(&qword_10006C8F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C8F0);
  }
  return result;
}

void sub_10000BB88(void *a1@<X8>)
{
  *a1 = &off_100069288;
}

unint64_t sub_10000BB9C()
{
  unint64_t result = qword_10006C900;
  if (!qword_10006C900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C900);
  }
  return result;
}

uint64_t sub_10000BBF0()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DF00);
  sub_100008180(v6, (uint64_t)qword_10006DF00);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B310();
}

uint64_t sub_10000BDD0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004AF90();
  *a1 = v3;
  return result;
}

uint64_t sub_10000BE0C()
{
  return sub_10004AFA0();
}

void (*sub_10000BE44(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10004AF80();
  return sub_100005DA0;
}

unint64_t sub_10000BEA4()
{
  unint64_t result = qword_10006C908;
  if (!qword_10006C908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C908);
  }
  return result;
}

uint64_t sub_10000BEF8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000CACC();
  unint64_t v5 = sub_10000CB74();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10000BF64()
{
  uint64_t v0 = qword_10006C870;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000BFA4()
{
  unint64_t result = qword_10006C910;
  if (!qword_10006C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C910);
  }
  return result;
}

unint64_t sub_10000BFFC()
{
  unint64_t result = qword_10006C918;
  if (!qword_10006C918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C918);
  }
  return result;
}

unint64_t sub_10000C054()
{
  unint64_t result = qword_10006C920;
  if (!qword_10006C920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C920);
  }
  return result;
}

uint64_t sub_10000C0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000C0D4(a1, a2, a3, (void (*)(void))sub_10000BEA4);
}

uint64_t sub_10000C0D4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C11C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C498, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006DF00, a1);
}

uint64_t sub_10000C154@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008180(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000C1F8()
{
  return 0;
}

uint64_t sub_10000C200()
{
  return 1;
}

uint64_t sub_10000C208(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000CACC();
  unint64_t v6 = sub_10000CB20();
  unint64_t v7 = sub_10000CB74();
  *unint64_t v4 = v2;
  v4[1] = sub_10000C2D4;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000C2D4()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_10000C3DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C658();
  *a1 = result;
  return result;
}

uint64_t sub_10000C404(uint64_t a1)
{
  unint64_t v2 = sub_10000BEA4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenSettingsCalendarStaticDeepLinks()
{
  return &type metadata for OpenSettingsCalendarStaticDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for SettingsCalendarStaticDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SettingsCalendarStaticDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingsCalendarStaticDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 16;
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
        JUMPOUT(0x10000C5BCLL);
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
          *uint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

uint64_t sub_10000C5E4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000C5EC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SettingsCalendarStaticDeepLinks()
{
  return &type metadata for SettingsCalendarStaticDeepLinks;
}

uint64_t sub_10000C604()
{
  unint64_t v0 = sub_10004B5E0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x11) {
    return 17;
  }
  else {
    return v0;
  }
}

uint64_t sub_10000C658()
{
  uint64_t v0 = sub_10004B230();
  uint64_t v25 = *(void *)(v0 - 8);
  uint64_t v26 = v0;
  __chkstk_darwin(v0);
  uint64_t v24 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v23 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v22 - v5;
  uint64_t v7 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B2E0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10004B330();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004B4E0();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10004B2F0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v22 = sub_100007DEC(&qword_10006C930);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v28 = 17;
  uint64_t v18 = sub_10004AF60();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v23, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v24, enum case for InputConnectionBehavior.default(_:), v26);
  sub_10000B57C();
  uint64_t v20 = sub_10004AFB0();
  char v27 = 0;
  swift_retain();
  sub_10004AFA0();
  swift_release();
  return v20;
}

unint64_t sub_10000CACC()
{
  unint64_t result = qword_10006C938;
  if (!qword_10006C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C938);
  }
  return result;
}

unint64_t sub_10000CB20()
{
  unint64_t result = qword_10006C940;
  if (!qword_10006C940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C940);
  }
  return result;
}

unint64_t sub_10000CB74()
{
  unint64_t result = qword_10006C948;
  if (!qword_10006C948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C948);
  }
  return result;
}

uint64_t sub_10000CBC8(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_10000CBE0()
{
  unint64_t result = qword_10006C988;
  if (!qword_10006C988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C988);
  }
  return result;
}

unint64_t sub_10000CC38()
{
  unint64_t result = qword_10006C990;
  if (!qword_10006C990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C990);
  }
  return result;
}

uint64_t sub_10000CC8C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000CCAC, 0, 0);
}

uint64_t sub_10000CCAC()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = CalLocationSuggestionsEnabled();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000CD14(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000CD38, 0, 0);
}

uint64_t sub_10000CD38()
{
  CalSetLocationSuggestionsEnabled();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000CD9C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_10000D06C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_10000D478()
{
  uint64_t v0 = qword_10006C978;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000D4B4()
{
  unint64_t result = qword_10006C998;
  if (!qword_10006C998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C998);
  }
  return result;
}

unint64_t sub_10000D50C()
{
  unint64_t result = qword_10006C9A0;
  if (!qword_10006C9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9A0);
  }
  return result;
}

unint64_t sub_10000D564()
{
  unint64_t result = qword_10006C9A8;
  if (!qword_10006C9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9A8);
  }
  return result;
}

unint64_t sub_10000D5BC()
{
  unint64_t result = qword_10006C9B0;
  if (!qword_10006C9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9B0);
  }
  return result;
}

unint64_t sub_10000D614()
{
  unint64_t result = qword_10006C9B8;
  if (!qword_10006C9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9B8);
  }
  return result;
}

unint64_t sub_10000D66C()
{
  unint64_t result = qword_10006C9C0;
  if (!qword_10006C9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9C0);
  }
  return result;
}

unint64_t sub_10000D6C4()
{
  unint64_t result = qword_10006C9C8;
  if (!qword_10006C9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9C8);
  }
  return result;
}

unint64_t sub_10000D71C()
{
  unint64_t result = qword_10006C9D0;
  if (!qword_10006C9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9D0);
  }
  return result;
}

void sub_10000D770(void *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x80000001000558A0;
}

uint64_t sub_10000D794()
{
  return sub_100008248(&qword_10006C9D8, &qword_10006C9E0);
}

uint64_t sub_10000D7D0(uint64_t a1)
{
  unint64_t v2 = sub_10000CBE0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000D820()
{
  unint64_t result = qword_10006C9E8;
  if (!qword_10006C9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9E8);
  }
  return result;
}

uint64_t sub_10000D878(uint64_t a1)
{
  unint64_t v2 = sub_10000D71C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000D8C8()
{
  unint64_t result = qword_10006C9F0;
  if (!qword_10006C9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C9F0);
  }
  return result;
}

uint64_t sub_10000D91C()
{
  return sub_100008248(&qword_10006C9F8, &qword_10006CA00);
}

uint64_t sub_10000D958()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DF18);
  sub_100008180(v6, (uint64_t)qword_10006DF18);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_10000DB58()
{
  uint64_t result = swift_getKeyPath();
  qword_10006DF30 = result;
  return result;
}

uint64_t sub_10000DB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_10000DC1C, v5, v4);
}

uint64_t sub_10000DC1C()
{
  sub_10004AF90();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 80) = v1;
  sub_10004AF90();
  *(unsigned char *)(v0 + 113) = *(unsigned char *)(v0 + 112);
  if (qword_10006C4A8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006DF30;
  *(void *)(v0 + 88) = qword_10006DF30;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_100008248(&qword_10006CAA8, &qword_10006CAB0);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v4);
}

uint64_t sub_10000DD74()
{
  if (qword_10006C4A8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000DDD4()
{
  unint64_t result = qword_10006CA08;
  if (!qword_10006CA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CA08);
  }
  return result;
}

unint64_t sub_10000DE2C()
{
  unint64_t result = qword_10006CA10;
  if (!qword_10006CA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CA10);
  }
  return result;
}

uint64_t sub_10000DE80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000DE9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000DEEC@<X0>(uint64_t a1@<X8>)
{
  if (qword_10006C4A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004B2F0();
  uint64_t v3 = sub_100008180(v2, (uint64_t)qword_10006DF18);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000DF94(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_10000DB80(a1, v5, v4);
}

unsigned char *sub_10000E040@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_10000F020();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000E068(uint64_t a1)
{
  unint64_t v2 = sub_10000D8C8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000E0A8()
{
  unint64_t result = qword_10006CA20;
  if (!qword_10006CA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CA20);
  }
  return result;
}

unint64_t sub_10000E100()
{
  unint64_t result = qword_10006CA28[0];
  if (!qword_10006CA28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CA28);
  }
  return result;
}

uint64_t sub_10000E154(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006CA90 + dword_10006CA90);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_10000E1F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000CC38();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000E2AC()
{
  unint64_t result = qword_10006CA40;
  if (!qword_10006CA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CA40);
  }
  return result;
}

unint64_t sub_10000E304()
{
  unint64_t result = qword_10006CA48[0];
  if (!qword_10006CA48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CA48);
  }
  return result;
}

uint64_t sub_10000E358(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000CC38();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000E40C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000CC38();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000E4C0()
{
  unint64_t result = qword_10006CA60;
  if (!qword_10006CA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CA60);
  }
  return result;
}

unint64_t sub_10000E518()
{
  unint64_t result = qword_10006CA68;
  if (!qword_10006CA68)
  {
    sub_100005398(qword_10006CA70);
    sub_10000D6C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CA68);
  }
  return result;
}

uint64_t sub_10000E58C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000D5BC();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_showLocationSuggestions()
{
  return &type metadata for UpdateIntent_showLocationSuggestions;
}

ValueMetadata *type metadata accessor for SettingsShowLocationSuggestionsEntityQuery()
{
  return &type metadata for SettingsShowLocationSuggestionsEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsShowLocationSuggestionsEntity()
{
  return &type metadata for SettingsShowLocationSuggestionsEntity;
}

uint64_t sub_10000E670()
{
  return sub_100008248(&qword_10006C700, &qword_10006C708);
}

uint64_t sub_10000E6AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007DEC(&qword_10006C7E0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007DEC(&qword_10006C7E8);
  v17._object = &protocol witness table for Text;
  sub_10000E100();
  sub_100008248(&qword_10006C7F0, &qword_10006C7E8);
  sub_10004B4B0();
  sub_10004B430();
  uint64_t v9 = sub_100008248(&qword_10006C7F8, &qword_10006C7D8);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v10 = (objc_class *)[self mainBundle];
  v17._countAndFlagsBits = 0x8000000100055900;
  v26._countAndFlagsBits = 0xD000000000000019;
  v26._object = (void *)0x80000001000555F0;
  v27.value._countAndFlagsBits = 0;
  v27.value._object = 0;
  v11.super.isa = v10;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  uint64_t v12 = sub_10004B2C0(v26, v27, v11, v28, v17);
  uint64_t v14 = v13;

  uint64_t v24 = v12;
  uint64_t v25 = v14;
  uint64_t v22 = v1;
  uint64_t v23 = v9;
  swift_getOpaqueTypeConformance2();
  sub_10000828C();
  uint64_t v15 = v19;
  sub_10004B440();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v8, v15);
}

uint64_t sub_10000EA68()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v3._countAndFlagsBits = 0x8000000100055960;
  v4._object = (void *)0x80000001000555F0;
  v4._countAndFlagsBits = 0xD000000000000019;
  v5.value._countAndFlagsBits = 0;
  v5.value._object = 0;
  v1.super.isa = v0;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  sub_10004B2C0(v4, v5, v1, v6, v3);

  sub_10000828C();
  return sub_10004B470();
}

uint64_t sub_10000EB4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10000ED80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unsigned char *sub_10000F020()
{
  uint64_t v0 = sub_100007DEC((uint64_t *)&unk_10006C770);
  __chkstk_darwin(v0 - 8);
  v46 = &v32[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_10004B230();
  uint64_t v52 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v49 = &v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v45 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v48 = &v32[-v6];
  uint64_t v7 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v7 - 8);
  v47 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10004B2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10004B330();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10004B4E0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004B2F0();
  uint64_t v40 = v15;
  uint64_t v51 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v44 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  uint64_t v43 = sub_100007DEC(&qword_10006CA88);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v18 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104);
  unsigned int v33 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v34 = v9;
  v19(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  uint64_t v35 = v19;
  uint64_t v36 = v10 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v19(v12, v18, v9);
  uint64_t v20 = v47;
  sub_10004B300();
  uint64_t v21 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v51 + 56);
  v51 += 56;
  uint64_t v41 = v21;
  v21(v20, 0, 1, v15);
  uint64_t v54 = 0;
  uint64_t v22 = sub_10004AF60();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  unint64_t v39 = v24;
  uint64_t v42 = v23 + 56;
  v24(v48, 1, 1, v22);
  v24(v45, 1, 1, v22);
  unsigned int v37 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v25 = *(void (**)(void))(v52 + 104);
  v52 += 104;
  v38 = (void (*)(unsigned char *, void, uint64_t))v25;
  v25(v49);
  sub_10000CBE0();
  uint64_t v45 = (unsigned char *)sub_10004AFC0();
  uint64_t v43 = sub_100007DEC(&qword_10006C790);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  Swift::String v28 = v35;
  v35(v12, v33, v34);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v28(v12, v26, v27);
  uint64_t v29 = v47;
  sub_10004B300();
  v41(v29, 0, 1, v40);
  char v53 = 2;
  uint64_t v30 = sub_10004B520();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v46, 1, 1, v30);
  v39(v48, 1, 1, v22);
  v38(v49, v37, v50);
  sub_10004AFD0();
  return v45;
}

uint64_t sub_10000F7E8()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10000F928, 0, 0);
}

uint64_t sub_10000F928()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006CA00);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006CAA8, &qword_10006CAB0);
  uint64_t v4 = sub_10004B2A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10000FADC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsShowLocationSuggestionsToggleControl()
{
  return &type metadata for SettingsShowLocationSuggestionsToggleControl;
}

uint64_t sub_10000FAF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FB14()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000FBE8()
{
  unint64_t result = qword_10006CAD0;
  if (!qword_10006CAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAD0);
  }
  return result;
}

unint64_t sub_10000FC40()
{
  unint64_t result = qword_10006CAD8;
  if (!qword_10006CAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAD8);
  }
  return result;
}

uint64_t sub_10000FC94(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000FCB4, 0, 0);
}

id sub_10000FCB4()
{
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(unsigned __int8 **)(v0 + 16);
    unsigned __int8 v4 = [result showWeekNumbers];

    *uint64_t v3 = v4;
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000FD60(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000FD84, 0, 0);
}

id sub_10000FD84()
{
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v2 = result;
    [result setShowWeekNumbers:*(unsigned __int8 *)(v0 + 16)];

    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v3();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000FE20()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_1000100F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_1000104FC()
{
  uint64_t v0 = qword_10006CAC0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100010538()
{
  unint64_t result = qword_10006CAE0;
  if (!qword_10006CAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAE0);
  }
  return result;
}

unint64_t sub_100010590()
{
  unint64_t result = qword_10006CAE8;
  if (!qword_10006CAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAE8);
  }
  return result;
}

unint64_t sub_1000105E8()
{
  unint64_t result = qword_10006CAF0;
  if (!qword_10006CAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAF0);
  }
  return result;
}

unint64_t sub_100010640()
{
  unint64_t result = qword_10006CAF8;
  if (!qword_10006CAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CAF8);
  }
  return result;
}

unint64_t sub_100010698()
{
  unint64_t result = qword_10006CB00;
  if (!qword_10006CB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB00);
  }
  return result;
}

unint64_t sub_1000106F0()
{
  unint64_t result = qword_10006CB08;
  if (!qword_10006CB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB08);
  }
  return result;
}

unint64_t sub_100010748()
{
  unint64_t result = qword_10006CB10;
  if (!qword_10006CB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB10);
  }
  return result;
}

unint64_t sub_1000107A0()
{
  unint64_t result = qword_10006CB18;
  if (!qword_10006CB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB18);
  }
  return result;
}

void sub_1000107F4(void *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x8000000100055C70;
}

uint64_t sub_100010818()
{
  return sub_100008248(&qword_10006CB20, &qword_10006CB28);
}

uint64_t sub_100010854(uint64_t a1)
{
  unint64_t v2 = sub_10000FBE8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000108A4()
{
  unint64_t result = qword_10006CB30;
  if (!qword_10006CB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB30);
  }
  return result;
}

uint64_t sub_1000108FC(uint64_t a1)
{
  unint64_t v2 = sub_1000107A0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001094C()
{
  unint64_t result = qword_10006CB38;
  if (!qword_10006CB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB38);
  }
  return result;
}

uint64_t sub_1000109A0()
{
  return sub_100008248(&qword_10006CB40, &qword_10006CB48);
}

uint64_t sub_1000109DC()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DF38);
  sub_100008180(v6, (uint64_t)qword_10006DF38);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_100010BDC()
{
  uint64_t result = swift_getKeyPath();
  qword_10006DF50 = result;
  return result;
}

uint64_t sub_100010C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_100010CA0, v5, v4);
}

uint64_t sub_100010CA0()
{
  sub_10004AF90();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 80) = v1;
  sub_10004AF90();
  *(unsigned char *)(v0 + 113) = *(unsigned char *)(v0 + 112);
  if (qword_10006C4B8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006DF50;
  *(void *)(v0 + 88) = qword_10006DF50;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_100008248(&qword_10006CBF0, &qword_10006CBF8);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v4);
}

uint64_t sub_100010DF8()
{
  if (qword_10006C4B8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100010E58()
{
  unint64_t result = qword_10006CB50;
  if (!qword_10006CB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB50);
  }
  return result;
}

unint64_t sub_100010EB0()
{
  unint64_t result = qword_10006CB58;
  if (!qword_10006CB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB58);
  }
  return result;
}

uint64_t sub_100010F04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010F20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010F70@<X0>(uint64_t a1@<X8>)
{
  if (qword_10006C4B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004B2F0();
  uint64_t v3 = sub_100008180(v2, (uint64_t)qword_10006DF38);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100011018(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_100010C04(a1, v5, v4);
}

unsigned char *sub_1000110C4@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_10001206C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000110EC(uint64_t a1)
{
  unint64_t v2 = sub_10001094C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001112C()
{
  unint64_t result = qword_10006CB68;
  if (!qword_10006CB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB68);
  }
  return result;
}

unint64_t sub_100011184()
{
  unint64_t result = qword_10006CB70[0];
  if (!qword_10006CB70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CB70);
  }
  return result;
}

uint64_t sub_1000111D8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006CBD8 + dword_10006CBD8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_100011280(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000FC40();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100011334()
{
  unint64_t result = qword_10006CB88;
  if (!qword_10006CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CB88);
  }
  return result;
}

unint64_t sub_10001138C()
{
  unint64_t result = qword_10006CB90[0];
  if (!qword_10006CB90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CB90);
  }
  return result;
}

uint64_t sub_1000113E0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000FC40();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100011494(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000FC40();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100011548()
{
  unint64_t result = qword_10006CBA8;
  if (!qword_10006CBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CBA8);
  }
  return result;
}

unint64_t sub_1000115A0()
{
  unint64_t result = qword_10006CBB0;
  if (!qword_10006CBB0)
  {
    sub_100005398(qword_10006CBB8);
    sub_100010748();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CBB0);
  }
  return result;
}

uint64_t sub_100011614(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100010640();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_showWeekNumbers()
{
  return &type metadata for UpdateIntent_showWeekNumbers;
}

ValueMetadata *type metadata accessor for SettingsShowWeekNumbersEntityQuery()
{
  return &type metadata for SettingsShowWeekNumbersEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsShowWeekNumbersEntity()
{
  return &type metadata for SettingsShowWeekNumbersEntity;
}

uint64_t sub_1000116F8@<X0>(uint64_t a1@<X8>)
{
  v17[1] = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = sub_100007DEC(&qword_10006C7E0);
  uint64_t v5 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007DEC(&qword_10006C7E8);
  v16._object = &protocol witness table for Text;
  sub_100011184();
  sub_100008248(&qword_10006C7F0, &qword_10006C7E8);
  sub_10004B4B0();
  sub_10004B430();
  uint64_t v8 = sub_100008248(&qword_10006C7F8, &qword_10006C7D8);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v9 = (objc_class *)[self mainBundle];
  v18._countAndFlagsBits = 0xD00000000000001DLL;
  v16._countAndFlagsBits = 0x8000000100055CE0;
  v18._object = (void *)0x8000000100055CC0;
  v19.value._countAndFlagsBits = 0;
  v19.value._object = 0;
  v10.super.isa = v9;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  uint64_t v11 = sub_10004B2C0(v18, v19, v10, v20, v16);
  uint64_t v13 = v12;

  v17[4] = v11;
  v17[5] = v13;
  v17[2] = v1;
  v17[3] = v8;
  swift_getOpaqueTypeConformance2();
  sub_10000828C();
  uint64_t v14 = v17[0];
  sub_10004B440();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

uint64_t sub_100011AB4()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v3._countAndFlagsBits = 0x80000001000559E0;
  v4._object = (void *)0x80000001000559C0;
  v4._countAndFlagsBits = 0xD000000000000011;
  v5.value._countAndFlagsBits = 0;
  v5.value._object = 0;
  v1.super.isa = v0;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  sub_10004B2C0(v4, v5, v1, v6, v3);

  sub_10000828C();
  return sub_10004B470();
}

uint64_t sub_100011B98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100011DCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unsigned char *sub_10001206C()
{
  uint64_t v0 = sub_100007DEC((uint64_t *)&unk_10006C770);
  __chkstk_darwin(v0 - 8);
  v46 = &v32[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_10004B230();
  uint64_t v52 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v49 = &v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v45 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v48 = &v32[-v6];
  uint64_t v7 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v7 - 8);
  v47 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10004B2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10004B330();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10004B4E0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004B2F0();
  uint64_t v40 = v15;
  uint64_t v51 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v44 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  uint64_t v43 = sub_100007DEC(&qword_10006CBD0);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v18 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  Swift::String_optional v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104);
  unsigned int v33 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v34 = v9;
  v19(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  uint64_t v35 = v19;
  uint64_t v36 = v10 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v19(v12, v18, v9);
  Swift::String v20 = v47;
  sub_10004B300();
  uint64_t v21 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v51 + 56);
  v51 += 56;
  uint64_t v41 = v21;
  v21(v20, 0, 1, v15);
  uint64_t v54 = 0;
  uint64_t v22 = sub_10004AF60();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  unint64_t v39 = v24;
  uint64_t v42 = v23 + 56;
  v24(v48, 1, 1, v22);
  v24(v45, 1, 1, v22);
  unsigned int v37 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v25 = *(void (**)(void))(v52 + 104);
  v52 += 104;
  v38 = (void (*)(unsigned char *, void, uint64_t))v25;
  v25(v49);
  sub_10000FBE8();
  uint64_t v45 = (unsigned char *)sub_10004AFC0();
  uint64_t v43 = sub_100007DEC(&qword_10006C790);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  Swift::String v28 = v35;
  v35(v12, v33, v34);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v28(v12, v26, v27);
  uint64_t v29 = v47;
  sub_10004B300();
  v41(v29, 0, 1, v40);
  char v53 = 2;
  uint64_t v30 = sub_10004B520();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v46, 1, 1, v30);
  v39(v48, 1, 1, v22);
  v38(v49, v37, v50);
  sub_10004AFD0();
  return v45;
}

uint64_t sub_100012834()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100012974, 0, 0);
}

uint64_t sub_100012974()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006CB48);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006CBF0, &qword_10006CBF8);
  uint64_t v4 = sub_10004B2A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100012B28@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsShowWeekNumbersToggleControl()
{
  return &type metadata for SettingsShowWeekNumbersToggleControl;
}

uint64_t sub_100012B44()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100012B60(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x746E6576456C6C61;
      break;
  }
  return result;
}

unint64_t sub_100012C04(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x746E6576456C6C61;
      break;
  }
  return result;
}

uint64_t sub_100012CA8()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006DF58);
  sub_100008180(v10, (uint64_t)qword_10006DF58);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_100012F80()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v97 = (char *)&v83 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v95 = (char *)&v83 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  v90 = (char *)&v83 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v88 = (uint64_t)&v83 - v8;
  __chkstk_darwin(v7);
  v104 = (char *)&v83 - v9;
  uint64_t v10 = sub_100007DEC(&qword_10006C780);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  v96 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v93 = (char *)&v83 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v89 = (char *)&v83 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  unint64_t v86 = (char *)&v83 - v18;
  __chkstk_darwin(v17);
  v106 = (char *)&v83 - v19;
  uint64_t v20 = sub_10004B2E0();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10004B330();
  __chkstk_darwin(v24 - 8);
  uint64_t v25 = sub_10004B4E0();
  __chkstk_darwin(v25 - 8);
  uint64_t v26 = sub_10004B2F0();
  uint64_t v105 = *(void *)(v26 - 8);
  uint64_t v27 = __chkstk_darwin(v26);
  v94 = (char *)&v83 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  v91 = (char *)&v83 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v87 = (char *)&v83 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v85 = (char *)&v83 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v119 = (char *)&v83 - v36;
  __chkstk_darwin(v35);
  v38 = (char *)&v83 - v37;
  sub_100007DEC(&qword_10006CDC8);
  uint64_t v39 = sub_100007DEC(&qword_10006CDD0);
  unint64_t v40 = (*(unsigned __int8 *)(*(void *)(v39 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v39 - 8) + 80);
  unint64_t v116 = *(void *)(*(void *)(v39 - 8) + 72);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_10004D1A0;
  uint64_t v84 = v41;
  unint64_t v42 = v41 + v40;
  *(unsigned char *)(v41 + v40) = 0;
  uint64_t v118 = (unsigned char *)v39;
  uint64_t v43 = *(int *)(v39 + 48);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
  unsigned int v117 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v92 = v20;
  v109 = v44;
  uint64_t v110 = v21 + 104;
  ((void (*)(char *))v44)(v23);
  *(void *)&long long v103 = v38;
  sub_10004B300();
  uint64_t v114 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v105 + 56);
  uint64_t v115 = v26;
  uint64_t v113 = v105 + 56;
  v114(v106, 1, 1, v26);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v102 = v42 + v43;
  uint64_t v45 = sub_10004B160();
  unint64_t v101 = v42;
  uint64_t v46 = v45;
  uint64_t v47 = sub_100008180(v45, (uint64_t)qword_10006E0F0);
  uint64_t v48 = *(void *)(v46 - 8);
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
  uint64_t v111 = v48 + 16;
  uint64_t v112 = v47;
  uint64_t v50 = v104;
  v49(v104, v47, v46);
  v108 = v49;
  uint64_t v51 = *(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56);
  v51(v50, 0, 1, v46);
  uint64_t v107 = v51;
  uint64_t v99 = v48 + 56;
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v83 = (unsigned char *)(v42 + v116);
  *uint64_t v83 = 1;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v52 = v92;
  v109(v23, v117, v92);
  sub_10004B300();
  v114(v86, 1, 1, v115);
  char v53 = (char *)v88;
  uint64_t v98 = v46;
  v49((char *)v88, v112, v46);
  v51(v53, 0, 1, v46);
  uint64_t v100 = sub_100007DEC(&qword_10006CDD8);
  uint64_t v54 = *(void *)(v105 + 72);
  uint64_t v55 = *(unsigned __int8 *)(v105 + 80);
  v106 = (char *)(((v55 + 32) & ~v55) + 2 * v54);
  v104 = (char *)((v55 + 32) & ~v55);
  uint64_t v102 = v54;
  uint64_t v105 = v55 | 7;
  uint64_t v56 = swift_allocObject();
  long long v103 = xmmword_10004D1B0;
  *(_OWORD *)(v56 + 16) = xmmword_10004D1B0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v57 = v117;
  uint64_t v58 = v52;
  uint64_t v59 = v52;
  v60 = v109;
  v109(v23, v117, v59);
  sub_10004B300();
  v83 += *((int *)v118 + 12);
  sub_10004B4D0();
  sub_10004B320();
  v60(v23, v57, v58);
  sub_10004B300();
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v88 = 2 * v116;
  uint64_t v61 = (unsigned char *)(v101 + 2 * v116);
  *uint64_t v61 = 2;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v62 = v57;
  uint64_t v63 = v58;
  v60(v23, v62, v58);
  sub_10004B300();
  v114(v89, 1, 1, v115);
  uint64_t v64 = v90;
  uint64_t v65 = v98;
  v108(v90, v112, v98);
  v107(v64, 0, 1, v65);
  *(_OWORD *)(swift_allocObject() + 16) = v103;
  sub_10004B4D0();
  sub_10004B320();
  v66 = v23;
  uint64_t v67 = v117;
  uint64_t v68 = v63;
  uint64_t v69 = v63;
  v70 = v23;
  uint64_t v71 = v109;
  v109(v66, v117, v69);
  sub_10004B300();
  unint64_t v86 = &v61[*((int *)v118 + 12)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v72 = v67;
  uint64_t v73 = v67;
  v74 = v71;
  v71(v70, v72, v68);
  sub_10004B300();
  sub_10004B2D0();
  sub_10004B180();
  v75 = (unsigned char *)(v101 + v88 + v116);
  unsigned char *v75 = 3;
  sub_10004B4D0();
  sub_10004B320();
  v74(v70, v73, v68);
  sub_10004B300();
  v114(v93, 1, 1, v115);
  uint64_t v76 = v95;
  uint64_t v77 = v98;
  v108(v95, v112, v98);
  v107(v76, 0, 1, v77);
  *(_OWORD *)(swift_allocObject() + 16) = v103;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v78 = v117;
  v74(v70, v117, v68);
  sub_10004B300();
  v90 = &v75[*((int *)v118 + 12)];
  sub_10004B4D0();
  sub_10004B320();
  v74(v70, v78, v68);
  sub_10004B300();
  sub_10004B2D0();
  sub_10004B180();
  unint64_t v116 = v101 + 4 * v116;
  *(unsigned char *)unint64_t v116 = 4;
  sub_10004B4D0();
  sub_10004B320();
  v74(v70, v78, v68);
  sub_10004B300();
  v114(v96, 1, 1, v115);
  uint64_t v79 = v97;
  uint64_t v80 = v98;
  v108(v97, v112, v98);
  v107(v79, 0, 1, v80);
  *(_OWORD *)(swift_allocObject() + 16) = v103;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v81 = v92;
  v74(v70, v78, v92);
  sub_10004B300();
  uint64_t v118 = (unsigned char *)(v116 + *((int *)v118 + 12));
  sub_10004B4D0();
  sub_10004B320();
  v74(v70, v78, v81);
  sub_10004B300();
  sub_10004B2D0();
  sub_10004B180();
  unint64_t result = sub_10004332C(v84);
  qword_10006DF70 = result;
  return result;
}

uint64_t sub_100014280@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C4C8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006DF70;
  if (*(void *)(qword_10006DF70 + 16) && (unint64_t v12 = sub_100048E4C(a1), (v13 & 1) != 0))
  {
    unint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_100014578(unsigned __int8 *a1, char *a2)
{
  return sub_100043B9C(*a1, *a2);
}

unint64_t sub_100014588()
{
  unint64_t result = qword_10006CC18;
  if (!qword_10006CC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC18);
  }
  return result;
}

Swift::Int sub_1000145DC()
{
  return sub_100043E40();
}

uint64_t sub_1000145E4()
{
  return sub_1000441D8();
}

Swift::Int sub_1000145EC()
{
  return sub_100044428();
}

uint64_t sub_1000145F4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100016EA0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100014624@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100012C04(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100014654()
{
  unint64_t result = qword_10006CC20;
  if (!qword_10006CC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC20);
  }
  return result;
}

unint64_t sub_1000146AC()
{
  unint64_t result = qword_10006CC28;
  if (!qword_10006CC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC28);
  }
  return result;
}

unint64_t sub_100014704()
{
  unint64_t result = qword_10006CC30;
  if (!qword_10006CC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC30);
  }
  return result;
}

unint64_t sub_100014758@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100012B60(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100014788()
{
  unint64_t result = qword_10006CC38;
  if (!qword_10006CC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC38);
  }
  return result;
}

unint64_t sub_1000147E0()
{
  unint64_t result = qword_10006CC40;
  if (!qword_10006CC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC40);
  }
  return result;
}

unint64_t sub_100014838()
{
  unint64_t result = qword_10006CC48;
  if (!qword_10006CC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC48);
  }
  return result;
}

unint64_t sub_100014890()
{
  unint64_t result = qword_10006CC50;
  if (!qword_10006CC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC50);
  }
  return result;
}

uint64_t sub_1000148E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C4C0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006DF58, a1);
}

uint64_t sub_10001491C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100015EEC(a1, a2, a3, (void (*)(void))sub_100014948);
}

unint64_t sub_100014948()
{
  unint64_t result = qword_10006CC58;
  if (!qword_10006CC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC58);
  }
  return result;
}

uint64_t sub_10001499C(uint64_t a1)
{
  unint64_t v2 = sub_100014948();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000149EC()
{
  unint64_t result = qword_10006CC60;
  if (!qword_10006CC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC60);
  }
  return result;
}

unint64_t sub_100014A44()
{
  unint64_t result = qword_10006CC68;
  if (!qword_10006CC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC68);
  }
  return result;
}

unint64_t sub_100014A9C()
{
  unint64_t result = qword_10006CC70;
  if (!qword_10006CC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC70);
  }
  return result;
}

uint64_t sub_100014AF0()
{
  if (qword_10006C4C8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_100014B68(uint64_t a1)
{
  unint64_t v2 = sub_100014890();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100014BB4()
{
  return sub_100008248(&qword_10006CC78, &qword_10006CC80);
}

void sub_100014BF0(void *a1@<X8>)
{
  *a1 = &off_100069358;
}

unint64_t sub_100014C04()
{
  unint64_t result = qword_10006CC88;
  if (!qword_10006CC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC88);
  }
  return result;
}

unint64_t sub_100014C5C()
{
  unint64_t result = qword_10006CC90;
  if (!qword_10006CC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC90);
  }
  return result;
}

uint64_t sub_100014CB0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100014CD0, 0, 0);
}

uint64_t sub_100014CD0()
{
  uint64_t v1 = CalDaysToSync();
  if (v1 == 183) {
    char v2 = 4;
  }
  else {
    char v2 = 0;
  }
  if (v1 == 92) {
    char v3 = 3;
  }
  else {
    char v3 = v2;
  }
  if (v1 == 31) {
    char v4 = 2;
  }
  else {
    char v4 = 0;
  }
  if (v1 == 14) {
    char v5 = 1;
  }
  else {
    char v5 = v4;
  }
  if (v1 <= 91) {
    char v3 = v5;
  }
  **(unsigned char **)(v0 + 16) = v3;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100014D70(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100014D94, 0, 0);
}

uint64_t sub_100014D94()
{
  CalSetDaysToSync();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100014E04()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_1000150D4@<X0>(uint64_t a1@<X8>)
{
  v19[0] = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v6, 1, 1, v13);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v3, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v3, 0, 1, v15);
  return sub_10004B1A0();
}

uint64_t sub_1000154A4()
{
  uint64_t v0 = qword_10006CC08;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000154E0()
{
  unint64_t result = qword_10006CC98;
  if (!qword_10006CC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CC98);
  }
  return result;
}

unint64_t sub_100015538()
{
  unint64_t result = qword_10006CCA0;
  if (!qword_10006CCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCA0);
  }
  return result;
}

unint64_t sub_100015590()
{
  unint64_t result = qword_10006CCA8;
  if (!qword_10006CCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCA8);
  }
  return result;
}

unint64_t sub_1000155E8()
{
  unint64_t result = qword_10006CCB0;
  if (!qword_10006CCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCB0);
  }
  return result;
}

unint64_t sub_100015640()
{
  unint64_t result = qword_10006CCB8;
  if (!qword_10006CCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCB8);
  }
  return result;
}

unint64_t sub_100015698()
{
  unint64_t result = qword_10006CCC0;
  if (!qword_10006CCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCC0);
  }
  return result;
}

unint64_t sub_1000156F0()
{
  unint64_t result = qword_10006CCC8;
  if (!qword_10006CCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCC8);
  }
  return result;
}

unint64_t sub_100015748()
{
  unint64_t result = qword_10006CCD0;
  if (!qword_10006CCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCD0);
  }
  return result;
}

void sub_10001579C(void *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x8000000100055E40;
}

uint64_t sub_1000157C0()
{
  return sub_100008248(&qword_10006CCD8, &qword_10006CCE0);
}

uint64_t sub_1000157FC(uint64_t a1)
{
  unint64_t v2 = sub_100014C04();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001584C()
{
  unint64_t result = qword_10006CCE8;
  if (!qword_10006CCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCE8);
  }
  return result;
}

uint64_t sub_1000158A4(uint64_t a1)
{
  unint64_t v2 = sub_100015748();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000158F4()
{
  unint64_t result = qword_10006CCF0;
  if (!qword_10006CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CCF0);
  }
  return result;
}

uint64_t sub_100015948()
{
  return sub_100008248(&qword_10006CCF8, &qword_10006CD00);
}

uint64_t sub_100015984()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DF78);
  sub_100008180(v6, (uint64_t)qword_10006DF78);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_100015B84()
{
  uint64_t result = swift_getKeyPath();
  qword_10006DF90 = result;
  return result;
}

uint64_t sub_100015BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_100015C48, v5, v4);
}

uint64_t sub_100015C48()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  sub_10004AF90();
  if (qword_10006C4D8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006DF90;
  v0[11] = qword_10006DF90;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  uint64_t v4 = sub_100008248(&qword_10006CDB0, &qword_10006CDB8);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsSyncDurationType, v4);
}

uint64_t sub_100015D98()
{
  if (qword_10006C4D8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100015DF8()
{
  unint64_t result = qword_10006CD08;
  if (!qword_10006CD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD08);
  }
  return result;
}

unint64_t sub_100015E50()
{
  unint64_t result = qword_10006CD10;
  if (!qword_10006CD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD10);
  }
  return result;
}

uint64_t sub_100015EA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100015EEC(a1, a2, a3, (void (*)(void))sub_1000158F4);
}

uint64_t sub_100015EEC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100015F34@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C4D0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006DF78, a1);
}

uint64_t sub_100015F6C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_100015BAC(a1, v5, v4);
}

uint64_t sub_100016018@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100016EEC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100016040(uint64_t a1)
{
  unint64_t v2 = sub_1000158F4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100016080()
{
  unint64_t result = qword_10006CD20;
  if (!qword_10006CD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD20);
  }
  return result;
}

unint64_t sub_1000160D8()
{
  unint64_t result = qword_10006CD28[0];
  if (!qword_10006CD28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CD28);
  }
  return result;
}

uint64_t sub_10001612C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006CD98 + dword_10006CD98);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_1000161D0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100014C5C();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100016284()
{
  unint64_t result = qword_10006CD40;
  if (!qword_10006CD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD40);
  }
  return result;
}

unint64_t sub_1000162DC()
{
  unint64_t result = qword_10006CD48[0];
  if (!qword_10006CD48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CD48);
  }
  return result;
}

uint64_t sub_100016330(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100014C5C();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000163E4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100014C5C();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100016498()
{
  unint64_t result = qword_10006CD60;
  if (!qword_10006CD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD60);
  }
  return result;
}

unint64_t sub_1000164F0()
{
  unint64_t result = qword_10006CD68;
  if (!qword_10006CD68)
  {
    sub_100005398(qword_10006CD70);
    sub_1000156F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CD68);
  }
  return result;
}

uint64_t sub_100016564(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000155E8();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_syncDurationType()
{
  return &type metadata for UpdateIntent_syncDurationType;
}

ValueMetadata *type metadata accessor for SettingsSyncDurationsEntityQuery()
{
  return &type metadata for SettingsSyncDurationsEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsSyncDurationsEntity()
{
  return &type metadata for SettingsSyncDurationsEntity;
}

uint64_t getEnumTagSinglePayload for SettingsSyncDurationType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingsSyncDurationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x1000167A4);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsSyncDurationType()
{
  return &type metadata for SettingsSyncDurationType;
}

uint64_t sub_1000167DC()
{
  return sub_100008248(&qword_10006C700, &qword_10006C708);
}

uint64_t sub_100016818@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v1 = sub_10004B490();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100007DEC(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (objc_class *)[self mainBundle];
  v9._countAndFlagsBits = 0x8000000100055D70;
  v11._object = (void *)0x8000000100055D50;
  v11._countAndFlagsBits = 0xD000000000000014;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v7.super.isa = v6;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004B2C0(v11, v12, v7, v13, v9);

  swift_getKeyPath();
  sub_10004B480();
  sub_100014948();
  sub_10001797C();
  sub_1000160D8();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100016B0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100016D40@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_100014280(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_100016DD8(unsigned __int8 *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_100014280(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_100016EA0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000692C0;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_100016EEC()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  unint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v41 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v40 = sub_100007DEC(&qword_10006CD88);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  uint64_t v19 = v41;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v50 = 0;
  uint64_t v21 = sub_10004AF60();
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  uint64_t v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_100014C04();
  uint64_t v40 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006CD90);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v26 = v31;
  uint64_t v25 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v25(v10, v24, v26);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  char v49 = 5;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_100014948();
  sub_10004AFB0();
  return v40;
}

uint64_t sub_100017644()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100017784, 0, 0);
}

uint64_t sub_100017784()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006CD00);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006CDB0, &qword_10006CDB8);
  sub_100014948();
  uint64_t v4 = sub_10004B290();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100017944@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsSyncDurationsPickerControl()
{
  return &type metadata for SettingsSyncDurationsPickerControl;
}

uint64_t sub_100017960()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001797C()
{
  unint64_t result = qword_10006CDE0;
  if (!qword_10006CDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CDE0);
  }
  return result;
}

uint64_t sub_1000179D0(uint64_t a1)
{
  uint64_t v2 = sub_100007DEC(&qword_10006CDE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017A30()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100017AB4()
{
  unint64_t result = qword_10006CE00;
  if (!qword_10006CE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE00);
  }
  return result;
}

unint64_t sub_100017B0C()
{
  unint64_t result = qword_10006CE08;
  if (!qword_10006CE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE08);
  }
  return result;
}

uint64_t sub_100017B60(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100017B80, 0, 0);
}

id sub_100017B80()
{
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(unsigned __int8 **)(v0 + 16);
    unsigned __int8 v4 = [result weekViewStartsOnToday];

    *uint64_t v3 = v4;
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100017C2C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100017C50, 0, 0);
}

id sub_100017C50()
{
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v2 = result;
    [result setWeekViewStartsOnToday:*(unsigned __int8 *)(v0 + 16)];

    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v3();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100017CEC()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_100017FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_1000183C8()
{
  uint64_t v0 = qword_10006CDF0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100018404()
{
  unint64_t result = qword_10006CE10;
  if (!qword_10006CE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE10);
  }
  return result;
}

unint64_t sub_10001845C()
{
  unint64_t result = qword_10006CE18;
  if (!qword_10006CE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE18);
  }
  return result;
}

unint64_t sub_1000184B4()
{
  unint64_t result = qword_10006CE20;
  if (!qword_10006CE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE20);
  }
  return result;
}

unint64_t sub_10001850C()
{
  unint64_t result = qword_10006CE28;
  if (!qword_10006CE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE28);
  }
  return result;
}

unint64_t sub_100018564()
{
  unint64_t result = qword_10006CE30;
  if (!qword_10006CE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE30);
  }
  return result;
}

unint64_t sub_1000185BC()
{
  unint64_t result = qword_10006CE38;
  if (!qword_10006CE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE38);
  }
  return result;
}

unint64_t sub_100018614()
{
  unint64_t result = qword_10006CE40;
  if (!qword_10006CE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE40);
  }
  return result;
}

unint64_t sub_10001866C()
{
  unint64_t result = qword_10006CE48;
  if (!qword_10006CE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE48);
  }
  return result;
}

void sub_1000186C0(void *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x8000000100056E10;
}

uint64_t sub_1000186E4()
{
  return sub_100008248(&qword_10006CE50, &qword_10006CE58);
}

uint64_t sub_100018720(uint64_t a1)
{
  unint64_t v2 = sub_100017AB4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100018770()
{
  unint64_t result = qword_10006CE60;
  if (!qword_10006CE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE60);
  }
  return result;
}

uint64_t sub_1000187C8(uint64_t a1)
{
  unint64_t v2 = sub_10001866C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100018818()
{
  unint64_t result = qword_10006CE68;
  if (!qword_10006CE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE68);
  }
  return result;
}

uint64_t sub_10001886C()
{
  return sub_100008248(&qword_10006CE70, &qword_10006CE78);
}

uint64_t sub_1000188A8()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DF98);
  sub_100008180(v6, (uint64_t)qword_10006DF98);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_100018AA8()
{
  uint64_t result = swift_getKeyPath();
  qword_10006DFB0 = result;
  return result;
}

uint64_t sub_100018AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_100018B6C, v5, v4);
}

uint64_t sub_100018B6C()
{
  sub_10004AF90();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 80) = v1;
  sub_10004AF90();
  *(unsigned char *)(v0 + 113) = *(unsigned char *)(v0 + 112);
  if (qword_10006C4E8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006DFB0;
  *(void *)(v0 + 88) = qword_10006DFB0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_100008248(&qword_10006CF20, &qword_10006CF28);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v4);
}

uint64_t sub_100018CC4()
{
  if (qword_10006C4E8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100018D24()
{
  unint64_t result = qword_10006CE80;
  if (!qword_10006CE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE80);
  }
  return result;
}

unint64_t sub_100018D7C()
{
  unint64_t result = qword_10006CE88;
  if (!qword_10006CE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE88);
  }
  return result;
}

uint64_t sub_100018DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100018DEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100018E3C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10006C4E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004B2F0();
  uint64_t v3 = sub_100008180(v2, (uint64_t)qword_10006DF98);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100018EE4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_100018AD0(a1, v5, v4);
}

unsigned char *sub_100018F90@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_100019F34();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100018FB8(uint64_t a1)
{
  unint64_t v2 = sub_100018818();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100018FF8()
{
  unint64_t result = qword_10006CE98;
  if (!qword_10006CE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CE98);
  }
  return result;
}

unint64_t sub_100019050()
{
  unint64_t result = qword_10006CEA0[0];
  if (!qword_10006CEA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CEA0);
  }
  return result;
}

uint64_t sub_1000190A4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006CF08 + dword_10006CF08);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_100019148(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100017B0C();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000191FC()
{
  unint64_t result = qword_10006CEB8;
  if (!qword_10006CEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEB8);
  }
  return result;
}

unint64_t sub_100019254()
{
  unint64_t result = qword_10006CEC0[0];
  if (!qword_10006CEC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006CEC0);
  }
  return result;
}

uint64_t sub_1000192A8(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100017B0C();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001935C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100017B0C();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100019410()
{
  unint64_t result = qword_10006CED8;
  if (!qword_10006CED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CED8);
  }
  return result;
}

unint64_t sub_100019468()
{
  unint64_t result = qword_10006CEE0;
  if (!qword_10006CEE0)
  {
    sub_100005398(qword_10006CEE8);
    sub_100018614();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CEE0);
  }
  return result;
}

uint64_t sub_1000194DC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001850C();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_weekViewStartsOnToday()
{
  return &type metadata for UpdateIntent_weekViewStartsOnToday;
}

ValueMetadata *type metadata accessor for SettingsWeekViewStartsOnTodayEntityQuery()
{
  return &type metadata for SettingsWeekViewStartsOnTodayEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsWeekViewStartsOnTodayEntity()
{
  return &type metadata for SettingsWeekViewStartsOnTodayEntity;
}

uint64_t sub_1000195C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007DEC(&qword_10006C7E0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007DEC(&qword_10006C7E8);
  v17._object = &protocol witness table for Text;
  sub_100019050();
  sub_100008248(&qword_10006C7F0, &qword_10006C7E8);
  sub_10004B4B0();
  sub_10004B430();
  uint64_t v9 = sub_100008248(&qword_10006C7F8, &qword_10006C7D8);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v10 = (objc_class *)[self mainBundle];
  v17._countAndFlagsBits = 0x8000000100056E70;
  v26._countAndFlagsBits = 0xD000000000000019;
  v26._object = (void *)0x80000001000539E0;
  v27.value._countAndFlagsBits = 0;
  v27.value._object = 0;
  v11.super.isa = v10;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  uint64_t v12 = sub_10004B2C0(v26, v27, v11, v28, v17);
  uint64_t v14 = v13;

  uint64_t v24 = v12;
  uint64_t v25 = v14;
  uint64_t v22 = v1;
  uint64_t v23 = v9;
  swift_getOpaqueTypeConformance2();
  sub_10000828C();
  uint64_t v15 = v19;
  sub_10004B440();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v8, v15);
}

uint64_t sub_10001997C()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v3._countAndFlagsBits = 0x8000000100056DD0;
  v4._object = (void *)0x80000001000539E0;
  v4._countAndFlagsBits = 0xD000000000000019;
  v5.value._countAndFlagsBits = 0;
  v5.value._object = 0;
  v1.super.isa = v0;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  sub_10004B2C0(v4, v5, v1, v6, v3);

  sub_10000828C();
  return sub_10004B470();
}

uint64_t sub_100019A60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100019C94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unsigned char *sub_100019F34()
{
  uint64_t v0 = sub_100007DEC((uint64_t *)&unk_10006C770);
  __chkstk_darwin(v0 - 8);
  uint64_t v46 = &v32[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_10004B230();
  uint64_t v52 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  char v49 = &v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v45 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v48 = &v32[-v6];
  uint64_t v7 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v7 - 8);
  uint64_t v47 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10004B2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10004B330();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10004B4E0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004B2F0();
  uint64_t v40 = v15;
  uint64_t v51 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v44 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  uint64_t v43 = sub_100007DEC(&qword_10006CF00);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v18 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104);
  unsigned int v33 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v34 = v9;
  v19(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  uint64_t v35 = v19;
  uint64_t v36 = v10 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v19(v12, v18, v9);
  uint64_t v20 = v47;
  sub_10004B300();
  uint64_t v21 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v51 + 56);
  v51 += 56;
  uint64_t v41 = v21;
  v21(v20, 0, 1, v15);
  uint64_t v54 = 0;
  uint64_t v22 = sub_10004AF60();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v39 = v24;
  uint64_t v42 = v23 + 56;
  v24(v48, 1, 1, v22);
  v24(v45, 1, 1, v22);
  unsigned int v37 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v25 = *(void (**)(void))(v52 + 104);
  v52 += 104;
  uint64_t v38 = (void (*)(unsigned char *, void, uint64_t))v25;
  v25(v49);
  sub_100017AB4();
  uint64_t v45 = (unsigned char *)sub_10004AFC0();
  uint64_t v43 = sub_100007DEC(&qword_10006C790);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  Swift::String v28 = v35;
  v35(v12, v33, v34);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v28(v12, v26, v27);
  uint64_t v29 = v47;
  sub_10004B300();
  v41(v29, 0, 1, v40);
  char v53 = 2;
  uint64_t v30 = sub_10004B520();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v46, 1, 1, v30);
  v39(v48, 1, 1, v22);
  v38(v49, v37, v50);
  sub_10004AFD0();
  return v45;
}

uint64_t sub_10001A6FC()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10001A83C, 0, 0);
}

uint64_t sub_10001A83C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006CE78);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006CF20, &qword_10006CF28);
  uint64_t v4 = sub_10004B2A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10001A9F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsWeekViewStartsOnTodayToggleControl()
{
  return &type metadata for SettingsWeekViewStartsOnTodayToggleControl;
}

uint64_t sub_10001AA0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t WidgetExtensionError.localizedStringResource.getter()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B310();
}

BOOL static WidgetExtensionError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void WidgetExtensionError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int WidgetExtensionError.hashValue.getter(unsigned __int8 a1)
{
  return sub_10004B650();
}

BOOL sub_10001AE7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10001AE90()
{
  Swift::UInt v1 = *v0;
  sub_10004B630();
  sub_10004B640(v1);
  return sub_10004B650();
}

void sub_10001AED8()
{
  sub_10004B640(*v0);
}

Swift::Int sub_10001AF04()
{
  Swift::UInt v1 = *v0;
  sub_10004B630();
  sub_10004B640(v1);
  return sub_10004B650();
}

unint64_t sub_10001AF4C()
{
  unint64_t result = qword_10006CF38;
  if (!qword_10006CF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF38);
  }
  return result;
}

uint64_t sub_10001AFB0()
{
  return WidgetExtensionError.localizedStringResource.getter();
}

unsigned char *storeEnumTagSinglePayload for WidgetExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10001B084);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetExtensionError()
{
  return &type metadata for WidgetExtensionError;
}

unint64_t sub_10001B0BC(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x694D797472696874;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x6E694D7974666966;
      break;
    case 6:
      unint64_t result = 0x72756F48656E6FLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0x7372756F486F7774;
      break;
    default:
      unint64_t result = 0x4D6E656574666966;
      break;
  }
  return result;
}

unint64_t sub_10001B1FC(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x694D797472696874;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x6E694D7974666966;
      break;
    case 6:
      unint64_t result = 0x72756F48656E6FLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0x7372756F486F7774;
      break;
    default:
      unint64_t result = 0x4D6E656574666966;
      break;
  }
  return result;
}

uint64_t sub_10001B33C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006DFB8);
  sub_100008180(v10, (uint64_t)qword_10006DFB8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_10001B614()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v140 = (char *)v131 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v154 = (char *)v131 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  v151 = (char *)v131 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  v135 = (char *)v131 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v144 = (uint64_t)v131 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v159 = (char *)v131 - v12;
  __chkstk_darwin(v11);
  uint64_t v145 = (char *)v131 - v13;
  uint64_t v14 = sub_100007DEC(&qword_10006C780);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  v139 = (char *)v131 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v153 = (char *)v131 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v150 = (char *)v131 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v148 = (char *)v131 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v143 = (char *)v131 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v158 = (char *)v131 - v26;
  __chkstk_darwin(v25);
  uint64_t v156 = (uint64_t)v131 - v27;
  uint64_t v28 = sub_10004B2E0();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)v131 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10004B330();
  __chkstk_darwin(v32 - 8);
  uint64_t v33 = sub_10004B4E0();
  __chkstk_darwin(v33 - 8);
  uint64_t v34 = sub_10004B2F0();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v138 = (char *)v131 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v152 = (char *)v131 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  v149 = (char *)v131 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  uint64_t v147 = (char *)v131 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  v146 = (char *)v131 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  v142 = (char *)v131 - v47;
  uint64_t v48 = __chkstk_darwin(v46);
  uint64_t v141 = (char *)v131 - v49;
  uint64_t v50 = __chkstk_darwin(v48);
  uint64_t v155 = (char *)v131 - v51;
  __chkstk_darwin(v50);
  char v53 = (char *)v131 - v52;
  sub_100007DEC(&qword_10006D100);
  uint64_t v163 = sub_100007DEC(&qword_10006D108);
  unint64_t v54 = (*(unsigned __int8 *)(*(void *)(v163 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v163 - 8) + 80);
  unint64_t v166 = *(void *)(*(void *)(v163 - 8) + 72);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_10004E220;
  uint64_t v137 = v55;
  unint64_t v179 = v55 + v54;
  *(unsigned char *)(v55 + v54) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v56 = *(void (**)(void))(v29 + 104);
  unsigned int v168 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v164 = v28;
  uint64_t v162 = v29 + 104;
  uint64_t v176 = (void (*)(char *, void, uint64_t))v56;
  v56(v31);
  uint64_t v136 = (uint64_t)v53;
  sub_10004B300();
  uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  uint64_t v167 = v34;
  uint64_t v177 = v35 + 56;
  v178 = v57;
  v57((char *)v156, 1, 1, v34);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v58 = sub_10004B160();
  uint64_t v59 = sub_100008180(v58, (uint64_t)qword_10006E0F0);
  uint64_t v60 = *(void *)(v58 - 8);
  uint64_t v61 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v60 + 16);
  uint64_t v169 = v58;
  uint64_t v170 = v61;
  uint64_t v174 = v60 + 16;
  uint64_t v175 = v59;
  uint64_t v62 = v145;
  v61(v145, v59, v58);
  v165 = *(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56);
  uint64_t v173 = v60 + 56;
  v165(v62, 0, 1, v58);
  uint64_t v172 = sub_100007DEC(&qword_10006CDD8);
  uint64_t v161 = *(void *)(v35 + 72);
  uint64_t v63 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v160 = ((v63 + 32) & ~v63) + v161;
  uint64_t v157 = (v63 + 32) & ~v63;
  uint64_t v171 = v63 | 7;
  uint64_t v64 = swift_allocObject();
  long long v134 = xmmword_10004E230;
  *(_OWORD *)(v64 + 16) = xmmword_10004E230;
  uint64_t v65 = v163;
  unint64_t v66 = v179;
  uint64_t v133 = v179 + *(int *)(v163 + 48);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v67 = v176;
  v176(v31, v168, v164);
  sub_10004B300();
  sub_10004B190();
  uint64_t v68 = (unsigned char *)(v66 + v166);
  unsigned char *v68 = 1;
  uint64_t v156 = (uint64_t)&v68[*(int *)(v65 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v69 = v168;
  uint64_t v70 = v164;
  v67(v31, v168, v164);
  sub_10004B300();
  v178(v158, 1, 1, v167);
  uint64_t v71 = v159;
  uint64_t v72 = v169;
  v170(v159, v175, v169);
  uint64_t v73 = v72;
  v74 = (void (*)(uint64_t, void, uint64_t, uint64_t))v165;
  v165(v71, 0, 1, v73);
  *(_OWORD *)(swift_allocObject() + 16) = v134;
  sub_10004B4D0();
  sub_10004B320();
  v67(v31, v69, v70);
  sub_10004B300();
  sub_10004B190();
  uint64_t v133 = 2 * v166;
  *(void *)&long long v134 = v179 + 2 * v166;
  *(unsigned char *)long long v134 = 2;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v75 = v168;
  v67(v31, v168, v70);
  sub_10004B300();
  v178(v143, 1, 1, v167);
  uint64_t v76 = v144;
  uint64_t v77 = v169;
  v170((char *)v144, v175, v169);
  v74(v76, 0, 1, v77);
  uint64_t v155 = (char *)(2 * v161);
  uint64_t v156 = 3 * v161;
  uint64_t v136 = 6 * v161;
  uint64_t v78 = v157;
  uint64_t v79 = swift_allocObject();
  uint64_t v132 = v79;
  *(_OWORD *)(v79 + 16) = xmmword_10004E240;
  uint64_t v80 = v79 + v78;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v81 = v176;
  v176(v31, v75, v70);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v81(v31, v75, v70);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v81(v31, v75, v70);
  sub_10004B300();
  v131[1] = v80;
  sub_10004B4D0();
  sub_10004B320();
  v81(v31, v75, v70);
  sub_10004B300();
  uint64_t v82 = v161;
  uint64_t v145 = (char *)(4 * v161);
  sub_10004B4D0();
  sub_10004B320();
  v81(v31, v75, v70);
  sub_10004B300();
  uint64_t v83 = v163;
  *(void *)&long long v134 = 5 * v82;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v84 = v168;
  uint64_t v85 = v176;
  v176(v31, v168, v70);
  sub_10004B300();
  nullsub_1(v132);
  sub_10004B190();
  unint64_t v86 = (unsigned char *)(v179 + v133 + v166);
  *unint64_t v86 = 3;
  uint64_t v144 = (uint64_t)&v86[*(int *)(v83 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  v85(v31, v84, v70);
  sub_10004B300();
  v178(v158, 1, 1, v167);
  v87 = v159;
  uint64_t v88 = v169;
  v170(v159, v175, v169);
  v165(v87, 0, 1, v88);
  uint64_t v89 = swift_allocObject();
  v143 = (char *)sub_100048DE4(v89, 1);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v90 = v164;
  v91 = v176;
  v176(v31, v84, v164);
  sub_10004B300();
  nullsub_1(v143);
  sub_10004B190();
  uint64_t v144 = 4 * v166;
  uint64_t v92 = (unsigned char *)(v179 + 4 * v166);
  *uint64_t v92 = 4;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v93 = v90;
  v91(v31, v84, v90);
  sub_10004B300();
  v178(v148, 1, 1, v167);
  v94 = v135;
  uint64_t v95 = v169;
  v170(v135, v175, v169);
  v165(v94, 0, 1, v95);
  uint64_t v96 = swift_allocObject();
  uint64_t v97 = sub_100048DE4(v96, 1);
  uint64_t v98 = v163;
  v143 = &v92[*(int *)(v163 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v99 = v168;
  uint64_t v100 = v176;
  v176(v31, v168, v93);
  sub_10004B300();
  nullsub_1(v97);
  sub_10004B190();
  unint64_t v101 = (unsigned char *)(v179 + v144 + v166);
  unsigned char *v101 = 5;
  uint64_t v148 = &v101[*(int *)(v98 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v102 = v99;
  uint64_t v103 = v164;
  v100(v31, v102, v164);
  sub_10004B300();
  uint64_t v104 = v167;
  v178(v158, 1, 1, v167);
  uint64_t v105 = v159;
  uint64_t v106 = v169;
  v170(v159, v175, v169);
  v165(v105, 0, 1, v106);
  uint64_t v107 = swift_allocObject();
  uint64_t v108 = sub_100048DE4(v107, 1);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v109 = v168;
  uint64_t v110 = v103;
  uint64_t v111 = v176;
  v176(v31, v168, v110);
  sub_10004B300();
  nullsub_1(v108);
  sub_10004B190();
  v159 = (char *)(v179 + 6 * v166);
  char *v159 = 6;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v112 = v164;
  v111(v31, v109, v164);
  sub_10004B300();
  v178(v150, 1, 1, v104);
  uint64_t v113 = v151;
  uint64_t v114 = v169;
  v170(v151, v175, v169);
  v165(v113, 0, 1, v114);
  uint64_t v115 = swift_allocObject();
  uint64_t v158 = (char *)sub_100048DE4(v115, 4);
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v109, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v109, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v109, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v109, v112);
  sub_10004B300();
  nullsub_1(v158);
  sub_10004B190();
  v159 = (char *)(8 * v166);
  unint64_t v166 = v179 + 7 * v166;
  *(unsigned char *)unint64_t v166 = 7;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v116 = v109;
  v111(v31, v109, v112);
  sub_10004B300();
  v178(v153, 1, 1, v167);
  unsigned int v117 = v154;
  uint64_t v118 = v169;
  v170(v154, v175, v169);
  v165(v117, 0, 1, v118);
  uint64_t v119 = swift_allocObject();
  uint64_t v158 = (char *)sub_100048DE4(v119, 10);
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v120 = v111;
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v111(v31, v116, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v121 = v168;
  v120(v31, v168, v112);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v122 = v121;
  uint64_t v123 = v121;
  v124 = v176;
  v176(v31, v122, v112);
  sub_10004B300();
  v166 += *(int *)(v163 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v124(v31, v123, v112);
  sub_10004B300();
  nullsub_1(v158);
  sub_10004B190();
  v159[v179] = 8;
  sub_10004B4D0();
  sub_10004B320();
  v124(v31, v123, v112);
  sub_10004B300();
  v178(v139, 1, 1, v167);
  uint64_t v125 = v140;
  uint64_t v126 = v169;
  v170(v140, v175, v169);
  v165(v125, 0, 1, v126);
  uint64_t v127 = swift_allocObject();
  uint64_t v128 = sub_100048DE4(v127, 1);
  sub_10004B4D0();
  sub_10004B320();
  v176(v31, v123, v164);
  sub_10004B300();
  nullsub_1(v128);
  sub_10004B190();
  uint64_t v129 = nullsub_1(v137);
  unint64_t result = sub_100043550(v129);
  qword_10006DFD0 = result;
  return result;
}

uint64_t sub_10001DB70@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C4F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006DFD0;
  if (*(void *)(qword_10006DFD0 + 16) && (unint64_t v12 = sub_100048F60(a1), (v13 & 1) != 0))
  {
    unint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_10001DE68(char *a1, char *a2)
{
  return sub_1000438AC(*a1, *a2);
}

unint64_t sub_10001DE78()
{
  unint64_t result = qword_10006CF50;
  if (!qword_10006CF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF50);
  }
  return result;
}

Swift::Int sub_10001DECC()
{
  return sub_10004B650();
}

uint64_t sub_10001DF14()
{
  return sub_100044064();
}

Swift::Int sub_10001DF1C()
{
  return sub_10004B650();
}

uint64_t sub_10001DF60@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100020A64(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10001DF90@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10001B1FC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10001DFC0()
{
  unint64_t result = qword_10006CF58;
  if (!qword_10006CF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF58);
  }
  return result;
}

unint64_t sub_10001E018()
{
  unint64_t result = qword_10006CF60;
  if (!qword_10006CF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF60);
  }
  return result;
}

unint64_t sub_10001E070()
{
  unint64_t result = qword_10006CF68;
  if (!qword_10006CF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF68);
  }
  return result;
}

unint64_t sub_10001E0C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10001B0BC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10001E0F4()
{
  unint64_t result = qword_10006CF70;
  if (!qword_10006CF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF70);
  }
  return result;
}

unint64_t sub_10001E14C()
{
  unint64_t result = qword_10006CF78;
  if (!qword_10006CF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF78);
  }
  return result;
}

unint64_t sub_10001E1A4()
{
  unint64_t result = qword_10006CF80;
  if (!qword_10006CF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF80);
  }
  return result;
}

unint64_t sub_10001E1FC()
{
  unint64_t result = qword_10006CF88;
  if (!qword_10006CF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF88);
  }
  return result;
}

uint64_t sub_10001E250@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C4F0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006DFB8, a1);
}

uint64_t sub_10001E288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F948(a1, a2, a3, (void (*)(void))sub_10001E2B4);
}

unint64_t sub_10001E2B4()
{
  unint64_t result = qword_10006CF90;
  if (!qword_10006CF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF90);
  }
  return result;
}

uint64_t sub_10001E308(uint64_t a1)
{
  unint64_t v2 = sub_10001E2B4();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001E358()
{
  unint64_t result = qword_10006CF98;
  if (!qword_10006CF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CF98);
  }
  return result;
}

unint64_t sub_10001E3B0()
{
  unint64_t result = qword_10006CFA0;
  if (!qword_10006CFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFA0);
  }
  return result;
}

unint64_t sub_10001E408()
{
  unint64_t result = qword_10006CFA8;
  if (!qword_10006CFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFA8);
  }
  return result;
}

uint64_t sub_10001E45C()
{
  if (qword_10006C4F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_10001E4D4(uint64_t a1)
{
  unint64_t v2 = sub_10001E1FC();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10001E520()
{
  return sub_100008248(&qword_10006CFB0, &qword_10006CFB8);
}

void sub_10001E55C(void *a1@<X8>)
{
  *a1 = &off_1000694A0;
}

unint64_t sub_10001E570()
{
  unint64_t result = qword_10006CFC0;
  if (!qword_10006CFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFC0);
  }
  return result;
}

unint64_t sub_10001E5C8()
{
  unint64_t result = qword_10006CFC8;
  if (!qword_10006CFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFC8);
  }
  return result;
}

uint64_t sub_10001E61C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001E63C, 0, 0);
}

void sub_10001E63C()
{
  id v1 = [self shared];
  if (!v1) {
    goto LABEL_11;
  }
  unint64_t v2 = v1;
  [v1 defaultEventDuration];
  double v4 = v3;

  double v5 = v4 / 60.0;
  if ((~COERCE__INT64(v4 / 60.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  uint64_t v6 = *(unsigned char **)(v0 + 16);
  *uint64_t v6 = sub_1000208BC((uint64_t)v5);
  uint64_t v7 = *(void (**)(void))(v0 + 8);
  v7();
}

uint64_t sub_10001E734(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10001E758, 0, 0);
}

id sub_10001E758()
{
  double v1 = dbl_10004EB80[*(char *)(v0 + 16)];
  id result = [self shared];
  if (result)
  {
    double v3 = result;
    [result setDefaultEventDuration:v1];

    double v4 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v4();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001E804()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_10001EAD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_10001EF00()
{
  uint64_t v0 = qword_10006CF40;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10001EF3C()
{
  unint64_t result = qword_10006CFD0;
  if (!qword_10006CFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFD0);
  }
  return result;
}

unint64_t sub_10001EF94()
{
  unint64_t result = qword_10006CFD8;
  if (!qword_10006CFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFD8);
  }
  return result;
}

unint64_t sub_10001EFEC()
{
  unint64_t result = qword_10006CFE0;
  if (!qword_10006CFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFE0);
  }
  return result;
}

unint64_t sub_10001F044()
{
  unint64_t result = qword_10006CFE8;
  if (!qword_10006CFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFE8);
  }
  return result;
}

unint64_t sub_10001F09C()
{
  unint64_t result = qword_10006CFF0;
  if (!qword_10006CFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFF0);
  }
  return result;
}

unint64_t sub_10001F0F4()
{
  unint64_t result = qword_10006CFF8;
  if (!qword_10006CFF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFF8);
  }
  return result;
}

unint64_t sub_10001F14C()
{
  unint64_t result = qword_10006D000;
  if (!qword_10006D000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D000);
  }
  return result;
}

unint64_t sub_10001F1A4()
{
  unint64_t result = qword_10006D008;
  if (!qword_10006D008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D008);
  }
  return result;
}

void sub_10001F1F8(void *a1@<X8>)
{
  *a1 = 0xD000000000000024;
  a1[1] = 0x80000001000574D0;
}

uint64_t sub_10001F21C()
{
  return sub_100008248(&qword_10006D010, &qword_10006D018);
}

uint64_t sub_10001F258(uint64_t a1)
{
  unint64_t v2 = sub_10001E570();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001F2A8()
{
  unint64_t result = qword_10006D020;
  if (!qword_10006D020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D020);
  }
  return result;
}

uint64_t sub_10001F300(uint64_t a1)
{
  unint64_t v2 = sub_10001F1A4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001F350()
{
  unint64_t result = qword_10006D028;
  if (!qword_10006D028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D028);
  }
  return result;
}

uint64_t sub_10001F3A4()
{
  return sub_100008248(&qword_10006D030, &qword_10006D038);
}

uint64_t sub_10001F3E0()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006DFD8);
  sub_100008180(v6, (uint64_t)qword_10006DFD8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_10001F5E0()
{
  uint64_t result = swift_getKeyPath();
  qword_10006DFF0 = result;
  return result;
}

uint64_t sub_10001F608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_10001F6A4, v5, v4);
}

uint64_t sub_10001F6A4()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  sub_10004AF90();
  if (qword_10006C508 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006DFF0;
  v0[11] = qword_10006DFF0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  uint64_t v4 = sub_100008248(&qword_10006D0E8, &qword_10006D0F0);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsDurationForNewEventsType, v4);
}

uint64_t sub_10001F7F4()
{
  if (qword_10006C508 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10001F854()
{
  unint64_t result = qword_10006D040;
  if (!qword_10006D040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D040);
  }
  return result;
}

unint64_t sub_10001F8AC()
{
  unint64_t result = qword_10006D048;
  if (!qword_10006D048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D048);
  }
  return result;
}

uint64_t sub_10001F900()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001F91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F948(a1, a2, a3, (void (*)(void))sub_10001F350);
}

uint64_t sub_10001F948(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001F990@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C500, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006DFD8, a1);
}

uint64_t sub_10001F9C8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_10001F608(a1, v5, v4);
}

uint64_t sub_10001FA74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020AB0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001FA9C(uint64_t a1)
{
  unint64_t v2 = sub_10001F350();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001FADC()
{
  unint64_t result = qword_10006D058;
  if (!qword_10006D058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D058);
  }
  return result;
}

unint64_t sub_10001FB34()
{
  unint64_t result = qword_10006D060[0];
  if (!qword_10006D060[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D060);
  }
  return result;
}

uint64_t sub_10001FB88(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006D0D0 + dword_10006D0D0);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_10001FC30(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001E5C8();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001FCE4()
{
  unint64_t result = qword_10006D078;
  if (!qword_10006D078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D078);
  }
  return result;
}

unint64_t sub_10001FD3C()
{
  unint64_t result = qword_10006D080[0];
  if (!qword_10006D080[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D080);
  }
  return result;
}

uint64_t sub_10001FD90(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001E5C8();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001FE44(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10001E5C8();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001FEF8()
{
  unint64_t result = qword_10006D098;
  if (!qword_10006D098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D098);
  }
  return result;
}

unint64_t sub_10001FF50()
{
  unint64_t result = qword_10006D0A0;
  if (!qword_10006D0A0)
  {
    sub_100005398(qword_10006D0A8);
    sub_10001F14C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D0A0);
  }
  return result;
}

uint64_t sub_10001FFC4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001F044();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_durationForNewEvents()
{
  return &type metadata for UpdateIntent_durationForNewEvents;
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsEntityQuery()
{
  return &type metadata for SettingsDurationForNewEventsEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsEntity()
{
  return &type metadata for SettingsDurationForNewEventsEntity;
}

uint64_t getEnumTagSinglePayload for SettingsDurationForNewEventsType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SettingsDurationForNewEventsType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x100020204);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsType()
{
  return &type metadata for SettingsDurationForNewEventsType;
}

uint64_t sub_10002023C@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v1 = sub_10004B490();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100007DEC(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (objc_class *)[self mainBundle];
  v9._countAndFlagsBits = 0x8000000100057220;
  v11._countAndFlagsBits = 0xD000000000000017;
  v11._object = (void *)0x8000000100054670;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v7.super.isa = v6;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004B2C0(v11, v12, v7, v13, v9);

  swift_getKeyPath();
  sub_10004B480();
  sub_10001E2B4();
  sub_100021544();
  sub_10001FB34();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100020528@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10002075C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_10001DB70(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_1000207F4(unsigned __int8 *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_10001DB70(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_1000208BC(uint64_t a1)
{
  uint64_t v1 = a1 - 15;
  uint64_t result = 0;
  switch(v1)
  {
    case 0:
      return result;
    case 10:
      uint64_t result = 1;
      break;
    case 15:
      uint64_t result = 2;
      break;
    case 25:
      uint64_t result = 3;
      break;
    case 35:
      uint64_t result = 4;
      break;
    case 40:
      uint64_t result = 5;
      break;
    case 75:
      uint64_t result = 7;
      break;
    default:
      uint64_t result = 6;
      break;
  }
  return result;
}

uint64_t sub_100020A64(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000693A8;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_100020AB0()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v41 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v40 = sub_100007DEC(&qword_10006D0C0);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  uint64_t v19 = v41;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v50 = 0;
  uint64_t v21 = sub_10004AF60();
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  uint64_t v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_10001E570();
  uint64_t v40 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006D0C8);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v26 = v31;
  uint64_t v25 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v25(v10, v24, v26);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  char v49 = 9;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_10001E2B4();
  sub_10004AFB0();
  return v40;
}

uint64_t sub_10002120C()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10002134C, 0, 0);
}

uint64_t sub_10002134C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006D038);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006D0E8, &qword_10006D0F0);
  sub_10001E2B4();
  uint64_t v4 = sub_10004B290();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10002150C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsPickerControl()
{
  return &type metadata for SettingsDurationForNewEventsPickerControl;
}

uint64_t sub_100021528()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100021544()
{
  unint64_t result = qword_10006D110;
  if (!qword_10006D110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D110);
  }
  return result;
}

uint64_t sub_100021598()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021618(char a1)
{
  return *(void *)&aNoalert_3[8 * a1];
}

uint64_t sub_100021638()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006DFF8);
  sub_100008180(v10, (uint64_t)qword_10006DFF8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_100021910()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v153 = (char *)v134 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  v150 = (char *)v134 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v148 = (char *)v134 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v144 = (char *)v134 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v164 = (char *)v134 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v138 = (char *)v134 - v12;
  __chkstk_darwin(v11);
  *(void *)&long long v155 = (char *)v134 - v13;
  uint64_t v14 = sub_100007DEC(&qword_10006C780);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v152 = (char *)v134 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  v149 = (char *)v134 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v146 = (char *)v134 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v143 = (char *)v134 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  *(void *)&long long v161 = (char *)v134 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v156 = (char *)v134 - v26;
  __chkstk_darwin(v25);
  uint64_t v141 = (char *)v134 - v27;
  uint64_t v28 = sub_10004B2E0();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)v134 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10004B330();
  __chkstk_darwin(v32 - 8);
  uint64_t v33 = sub_10004B4E0();
  __chkstk_darwin(v33 - 8);
  uint64_t v34 = sub_10004B2F0();
  uint64_t v171 = *(void *)(v34 - 8);
  uint64_t v35 = __chkstk_darwin(v34);
  v151 = (char *)v134 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v147 = (char *)v134 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v145 = (char *)v134 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v139 = (char *)v134 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v142 = (char *)v134 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  uint64_t v160 = (char *)v134 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  uint64_t v154 = (char *)v134 - v48;
  __chkstk_darwin(v47);
  uint64_t v50 = (char *)v134 - v49;
  sub_100007DEC(&qword_10006D2F8);
  uint64_t v180 = sub_100007DEC((uint64_t *)&unk_10006D300);
  unint64_t v51 = (*(unsigned __int8 *)(*(void *)(v180 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v180 - 8) + 80);
  uint64_t v166 = *(void *)(*(void *)(v180 - 8) + 72);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_10004EBD0;
  uint64_t v140 = v52;
  unint64_t v178 = v52 + v51;
  *(unsigned char *)(v52 + v51) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v53 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 104);
  uint64_t v54 = v29 + 104;
  uint64_t v55 = v56;
  uint64_t v165 = v28;
  uint64_t v57 = v28;
  uint64_t v58 = v171;
  v56(v31, enum case for LocalizedStringResource.BundleDescription.main(_:), v57);
  uint64_t v137 = v50;
  sub_10004B300();
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56);
  uint64_t v179 = v34;
  uint64_t v176 = v59;
  uint64_t v177 = v58 + 56;
  v59(v141, 1, 1, v34);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_10004B160();
  uint64_t v174 = sub_100008180(v60, (uint64_t)qword_10006E0F0);
  uint64_t v167 = v60;
  uint64_t v61 = *(void *)(v60 - 8);
  uint64_t v172 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 16);
  uint64_t v170 = v61 + 16;
  uint64_t v62 = v155;
  v172((char *)v155, v174, v60);
  uint64_t v173 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v61 + 56);
  uint64_t v175 = v61 + 56;
  v173(v62, 0, 1, v60);
  uint64_t v169 = sub_100007DEC(&qword_10006CDD8);
  uint64_t v63 = *(void *)(v58 + 72);
  uint64_t v64 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v157 = 2 * v63;
  uint64_t v163 = v63;
  uint64_t v136 = ((v64 + 32) & ~v64) + 2 * v63;
  uint64_t v168 = (v64 + 32) & ~v64;
  uint64_t v171 = v64 | 7;
  uint64_t v65 = swift_allocObject();
  long long v135 = xmmword_10004D1B0;
  v134[1] = v65;
  *(_OWORD *)(v65 + 16) = xmmword_10004D1B0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v66 = v165;
  v55(v31, v53, v165);
  sub_10004B300();
  uint64_t v67 = *(int *)(v180 + 48);
  uint64_t v159 = v54;
  unint64_t v68 = v178;
  v134[0] = v178 + v67;
  sub_10004B4D0();
  sub_10004B320();
  v55(v31, v53, v66);
  sub_10004B300();
  sub_10004B190();
  *(void *)&long long v155 = v68 + v166;
  *(unsigned char *)long long v155 = 1;
  uint64_t v141 = (char *)0xD000000000000010;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v158 = v55;
  v55(v31, v53, v66);
  sub_10004B300();
  v176(v156, 1, 1, v179);
  uint64_t v69 = v138;
  uint64_t v70 = v167;
  v172(v138, v174, v167);
  v173((uint64_t)v69, 0, 1, v70);
  *(_OWORD *)(swift_allocObject() + 16) = v135;
  sub_10004B4D0();
  sub_10004B320();
  v55(v31, v53, v66);
  sub_10004B300();
  uint64_t v71 = v180;
  *(void *)&long long v155 = v155 + *(int *)(v180 + 48);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v72 = v158;
  v158(v31, v53, v66);
  sub_10004B300();
  sub_10004B190();
  uint64_t v154 = (char *)(2 * v166);
  uint64_t v73 = (unsigned char *)(v178 + 2 * v166);
  uint64_t v138 = &v73[*(int *)(v71 + 48)];
  *uint64_t v73 = 2;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v74 = v53;
  uint64_t v75 = v165;
  v72(v31, v53, v165);
  sub_10004B300();
  v176((char *)v161, 1, 1, v179);
  uint64_t v76 = v164;
  uint64_t v77 = v167;
  v172(v164, v174, v167);
  v173((uint64_t)v76, 0, 1, v77);
  uint64_t v156 = (char *)(v168 + v163);
  uint64_t v78 = swift_allocObject();
  long long v155 = xmmword_10004E230;
  *(_OWORD *)(v78 + 16) = xmmword_10004E230;
  sub_10004B4D0();
  sub_10004B320();
  unsigned int v162 = v74;
  v72(v31, v74, v75);
  sub_10004B300();
  uint64_t v79 = (char *)v161;
  sub_10004B190();
  uint64_t v80 = &v154[v166 + v178];
  uint64_t v154 = &v80[*(int *)(v180 + 48)];
  *uint64_t v80 = 3;
  sub_10004B4D0();
  sub_10004B320();
  v72(v31, v74, v75);
  sub_10004B300();
  v176(v79, 1, 1, v179);
  uint64_t v81 = v164;
  uint64_t v82 = v167;
  v172(v164, v174, v167);
  v173((uint64_t)v81, 0, 1, v82);
  *(_OWORD *)(swift_allocObject() + 16) = v155;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v83 = v162;
  uint64_t v84 = v165;
  v72(v31, v162, v165);
  sub_10004B300();
  uint64_t v85 = (char *)v161;
  sub_10004B190();
  uint64_t v154 = (char *)(4 * v166);
  unint64_t v86 = (unsigned char *)(v178 + 4 * v166);
  uint64_t v138 = &v86[*(int *)(v180 + 48)];
  *unint64_t v86 = 4;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v87 = v83;
  uint64_t v88 = v158;
  v158(v31, v87, v84);
  sub_10004B300();
  v176(v85, 1, 1, v179);
  uint64_t v89 = v167;
  v172(v81, v174, v167);
  v173((uint64_t)v81, 0, 1, v89);
  *(_OWORD *)(swift_allocObject() + 16) = v155;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v90 = v162;
  v88(v31, v162, v84);
  sub_10004B300();
  v91 = (char *)v161;
  sub_10004B190();
  uint64_t v92 = &v154[v166 + v178];
  uint64_t v154 = &v92[*(int *)(v180 + 48)];
  *uint64_t v92 = 5;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v93 = v158;
  v158(v31, v90, v84);
  sub_10004B300();
  v176(v91, 1, 1, v179);
  v94 = v164;
  uint64_t v95 = v167;
  v172(v164, v174, v167);
  v173((uint64_t)v94, 0, 1, v95);
  *(_OWORD *)(swift_allocObject() + 16) = v155;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v96 = v90;
  uint64_t v97 = v165;
  v93(v31, v96, v165);
  sub_10004B300();
  sub_10004B190();
  uint64_t v98 = (unsigned char *)(v178 + 6 * v166);
  *uint64_t v98 = 6;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v99 = v162;
  uint64_t v100 = v158;
  v158(v31, v162, v97);
  sub_10004B300();
  v176(v143, 1, 1, v179);
  unint64_t v101 = v144;
  uint64_t v102 = v167;
  v172(v144, v174, v167);
  v173((uint64_t)v101, 0, 1, v102);
  uint64_t v103 = v163;
  uint64_t v160 = (char *)(4 * v163);
  uint64_t v104 = v168;
  uint64_t v105 = swift_allocObject();
  uint64_t v138 = (char *)v105;
  *(_OWORD *)(v105 + 16) = xmmword_10004EBE0;
  uint64_t v106 = v105 + v104;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v107 = v99;
  uint64_t v108 = v165;
  v100(v31, v107, v165);
  sub_10004B300();
  uint64_t v137 = &v98[*(int *)(v180 + 48)];
  uint64_t v109 = v103;
  uint64_t v154 = (char *)(v106 + v103);
  uint64_t v136 = v106;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v110 = v31;
  uint64_t v111 = v162;
  uint64_t v112 = v31;
  uint64_t v113 = v108;
  v100(v110, v162, v108);
  sub_10004B300();
  uint64_t v114 = v157;
  uint64_t v154 = (char *)(v106 + v157);
  sub_10004B4D0();
  sub_10004B320();
  v100(v112, v111, v113);
  sub_10004B300();
  uint64_t v154 = (char *)(v114 + v109);
  sub_10004B4D0();
  sub_10004B320();
  v100(v112, v111, v113);
  sub_10004B300();
  sub_10004B190();
  uint64_t v144 = (char *)(8 * v166);
  uint64_t v115 = (unsigned char *)(v178 + 7 * v166);
  unsigned char *v115 = 7;
  v143 = &v115[*(int *)(v180 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  v100(v112, v111, v113);
  sub_10004B300();
  v176((char *)v161, 1, 1, v179);
  uint64_t v116 = v164;
  uint64_t v117 = v167;
  v172(v164, v174, v167);
  v173((uint64_t)v116, 0, 1, v117);
  *(_OWORD *)(swift_allocObject() + 16) = v155;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v118 = v165;
  uint64_t v119 = v158;
  v158(v112, v111, v165);
  sub_10004B300();
  sub_10004B190();
  *(void *)&long long v155 = &v144[v178];
  *(unsigned char *)long long v155 = 8;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v120 = v162;
  uint64_t v121 = v119;
  v119(v112, v162, v118);
  uint64_t v122 = v112;
  sub_10004B300();
  v176(v146, 1, 1, v179);
  uint64_t v123 = v148;
  uint64_t v124 = v167;
  v172(v148, v174, v167);
  v173((uint64_t)v123, 0, 1, v124);
  uint64_t v164 = &v160[v163 + v168];
  uint64_t v125 = swift_allocObject();
  long long v161 = xmmword_10004D1A0;
  uint64_t v156 = (char *)v125;
  *(_OWORD *)(v125 + 16) = xmmword_10004D1A0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v126 = v165;
  v119(v122, v120, v165);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v119(v122, v120, v126);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v119(v122, v120, v126);
  sub_10004B300();
  v143 = (char *)(v155 + *(int *)(v180 + 48));
  sub_10004B4D0();
  sub_10004B320();
  v119(v122, v120, v126);
  sub_10004B300();
  *(void *)&long long v155 = 0xD000000000000018;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v127 = v126;
  v121(v122, v120, v126);
  sub_10004B300();
  sub_10004B190();
  uint64_t v156 = &v144[v166 + v178];
  *uint64_t v156 = 9;
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v120, v126);
  sub_10004B300();
  v176(v149, 1, 1, v179);
  uint64_t v128 = v150;
  uint64_t v129 = v167;
  v172(v150, v174, v167);
  v173((uint64_t)v128, 0, 1, v129);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10004EBF0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v130 = v162;
  v121(v122, v162, v127);
  sub_10004B300();
  v156 += *(int *)(v180 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B190();
  v178 += 10 * v166;
  *(unsigned char *)unint64_t v178 = 10;
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  v176(v152, 1, 1, v179);
  uint64_t v131 = v153;
  uint64_t v132 = v167;
  v172(v153, v174, v167);
  v173((uint64_t)v131, 0, 1, v132);
  *(_OWORD *)(swift_allocObject() + 16) = v161;
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v121(v122, v130, v127);
  sub_10004B300();
  sub_10004B190();
  unint64_t result = sub_100043578(v140);
  qword_10006E010 = result;
  return result;
}

uint64_t sub_1000241F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C518 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006E010;
  if (*(void *)(qword_10006E010 + 16) && (uint64_t v12 = sub_100048FCC(a1), (v13 & 1) != 0))
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_1000244E8(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_100021618(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100021618(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10004B5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100024578()
{
  unint64_t result = qword_10006D130;
  if (!qword_10006D130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D130);
  }
  return result;
}

Swift::Int sub_1000245CC()
{
  char v1 = *v0;
  sub_10004B630();
  sub_100021618(v1);
  sub_10004B510();
  swift_bridgeObjectRelease();
  return sub_10004B650();
}

uint64_t sub_100024630()
{
  sub_100021618(*v0);
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100024684()
{
  char v1 = *v0;
  sub_10004B630();
  sub_100021618(v1);
  sub_10004B510();
  swift_bridgeObjectRelease();
  return sub_10004B650();
}

uint64_t sub_1000246E4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100027710(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100024714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021618(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100024744()
{
  unint64_t result = qword_10006D138;
  if (!qword_10006D138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D138);
  }
  return result;
}

unint64_t sub_10002479C()
{
  unint64_t result = qword_10006D140;
  if (!qword_10006D140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D140);
  }
  return result;
}

unint64_t sub_1000247F4()
{
  unint64_t result = qword_10006D148;
  if (!qword_10006D148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D148);
  }
  return result;
}

unint64_t sub_10002484C()
{
  unint64_t result = qword_10006D150;
  if (!qword_10006D150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D150);
  }
  return result;
}

unint64_t sub_1000248A4()
{
  unint64_t result = qword_10006D158;
  if (!qword_10006D158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D158);
  }
  return result;
}

unint64_t sub_1000248FC()
{
  unint64_t result = qword_10006D160;
  if (!qword_10006D160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D160);
  }
  return result;
}

unint64_t sub_100024954()
{
  unint64_t result = qword_10006D168;
  if (!qword_10006D168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D168);
  }
  return result;
}

uint64_t sub_1000249A8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C510, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006DFF8, a1);
}

uint64_t sub_1000249E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000265BC(a1, a2, a3, (void (*)(void))sub_100024A0C);
}

unint64_t sub_100024A0C()
{
  unint64_t result = qword_10006D170;
  if (!qword_10006D170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D170);
  }
  return result;
}

uint64_t sub_100024A60(uint64_t a1)
{
  unint64_t v2 = sub_100024A0C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100024AB0()
{
  unint64_t result = qword_10006D178;
  if (!qword_10006D178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D178);
  }
  return result;
}

unint64_t sub_100024B08()
{
  unint64_t result = qword_10006D180;
  if (!qword_10006D180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D180);
  }
  return result;
}

unint64_t sub_100024B60()
{
  unint64_t result = qword_10006D188;
  if (!qword_10006D188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D188);
  }
  return result;
}

uint64_t sub_100024BB4()
{
  if (qword_10006C518 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_100024C2C(uint64_t a1)
{
  unint64_t v2 = sub_100024954();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100024C78()
{
  return sub_100008248(&qword_10006D190, &qword_10006D198);
}

void sub_100024CB4(void *a1@<X8>)
{
  *a1 = &off_1000695F8;
}

unint64_t sub_100024CC8()
{
  unint64_t result = qword_10006D1A0;
  if (!qword_10006D1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1A0);
  }
  return result;
}

unint64_t sub_100024D20()
{
  unint64_t result = qword_10006D1A8;
  if (!qword_10006D1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1A8);
  }
  return result;
}

uint64_t sub_100024D74(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100024D94, 0, 0);
}

uint64_t sub_100024D94()
{
  id v1 = [self defaultTimedAlarmOffset];
  id v2 = [v1 integerValue];
  if (v2 == (id)sub_10004B2B0())
  {
    char v3 = 0;
  }
  else
  {
    [v1 doubleValue];
    char v3 = sub_1000275D8(v4);
  }
  uint64_t v5 = *(unsigned char **)(v0 + 16);

  unsigned char *v5 = v3;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100024E64(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 24) = *(void *)(a1 + 8);
  *(unsigned char *)(v2 + 32) = *a2;
  return _swift_task_switch(sub_100024E90, 0, 0);
}

uint64_t sub_100024E90()
{
  sub_10004AE40();
  id v1 = [*(id *)(v0 + 16) eventStore];
  swift_unknownObjectRelease();
  if (v1)
  {
    if (sub_100021618(*(unsigned char *)(v0 + 32)) == 0x7472656C416F6ELL && v2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v4 = sub_10004B5D0();
      swift_bridgeObjectRelease();
      if ((v4 & 1) == 0)
      {
        switch(*(unsigned char *)(v0 + 32))
        {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 0xA:
            break;
          default:
            sub_10004B2B0();
            break;
        }
        uint64_t v5 = self;
        v6.super.super.Class isa = sub_10004B560().super.super.isa;
        goto LABEL_12;
      }
    }
    uint64_t v5 = self;
    sub_10004B2B0();
    v6.super.super.Class isa = sub_10004B570().super.super.isa;
LABEL_12:
    Class isa = v6.super.super.isa;
    [v5 setDefaultAlarmOffset:v6.super.super.isa forAlarmType:0 eventStore:v1];
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1000250B4()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  NSNumber v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_100025384@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_1000257B0()
{
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  sub_10004AEA0();
  uint64_t result = sub_10004AE60();
  qword_10006E018 = result;
  return result;
}

uint64_t sub_100025818()
{
  uint64_t v0 = qword_10006D120;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100025854()
{
  unint64_t result = qword_10006D1B0;
  if (!qword_10006D1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1B0);
  }
  return result;
}

unint64_t sub_1000258AC()
{
  unint64_t result = qword_10006D1B8;
  if (!qword_10006D1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1B8);
  }
  return result;
}

unint64_t sub_100025904()
{
  unint64_t result = qword_10006D1C0;
  if (!qword_10006D1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1C0);
  }
  return result;
}

unint64_t sub_10002595C()
{
  unint64_t result = qword_10006D1C8;
  if (!qword_10006D1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1C8);
  }
  return result;
}

uint64_t sub_1000259B0@<X0>(void *a1@<X8>)
{
  if (qword_10006C520 != -1) {
    swift_once();
  }
  *a1 = qword_10006E018;

  return swift_retain();
}

unint64_t sub_100025A20()
{
  unint64_t result = qword_10006D1D0;
  if (!qword_10006D1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1D0);
  }
  return result;
}

unint64_t sub_100025A78()
{
  unint64_t result = qword_10006D1D8;
  if (!qword_10006D1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1D8);
  }
  return result;
}

unint64_t sub_100025AD0()
{
  unint64_t result = qword_10006D1E0;
  if (!qword_10006D1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1E0);
  }
  return result;
}

unint64_t sub_100025B28()
{
  unint64_t result = qword_10006D1E8;
  if (!qword_10006D1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1E8);
  }
  return result;
}

void sub_100025B7C(void *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x8000000100058E90;
}

uint64_t sub_100025BA0()
{
  return sub_100008248(&qword_10006D1F0, &qword_10006D1F8);
}

uint64_t sub_100025BDC(uint64_t a1)
{
  unint64_t v2 = sub_100024CC8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100025C2C()
{
  unint64_t result = qword_10006D200;
  if (!qword_10006D200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D200);
  }
  return result;
}

uint64_t sub_100025C84(uint64_t a1)
{
  unint64_t v2 = sub_100025B28();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100025CD4()
{
  unint64_t result = qword_10006D208;
  if (!qword_10006D208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D208);
  }
  return result;
}

uint64_t sub_100025D28()
{
  return sub_100008248(&qword_10006D210, &qword_10006D218);
}

uint64_t sub_100025D64()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006E020);
  sub_100008180(v6, (uint64_t)qword_10006E020);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_100025F64()
{
  uint64_t result = swift_getKeyPath();
  qword_10006E038 = result;
  return result;
}

uint64_t sub_100025F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_10004B550();
  v3[9] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[10] = v5;
  v3[11] = v4;
  return _swift_task_switch(sub_100026028, v5, v4);
}

uint64_t sub_100026028()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[4] = v1;
  uint64_t v2 = v0[3];
  v0[12] = v1;
  v0[13] = v2;
  v0[5] = v2;
  sub_10004AF90();
  if (qword_10006C530 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10006E038;
  v0[14] = qword_10006E038;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[15] = v4;
  uint64_t v5 = sub_100008248(&qword_10006D2D8, &qword_10006D2E0);
  *uint64_t v4 = v0;
  v4[1] = sub_100026180;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 17, v3, &type metadata for SettingsEventsDefaultAlertTimeType, v5);
}

uint64_t sub_100026180()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_100026368;
  }
  else {
    uint64_t v5 = sub_1000262F8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000262F8()
{
  swift_release();
  sub_10004AF70();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100026368()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

double sub_1000263CC@<D0>(_OWORD *a1@<X8>)
{
  sub_10004AF90();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100026408()
{
  return swift_release();
}

uint64_t sub_100026468()
{
  if (qword_10006C530 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000264C8()
{
  unint64_t result = qword_10006D220;
  if (!qword_10006D220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D220);
  }
  return result;
}

unint64_t sub_100026520()
{
  unint64_t result = qword_10006D228;
  if (!qword_10006D228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D228);
  }
  return result;
}

uint64_t sub_100026574()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100026590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000265BC(a1, a2, a3, (void (*)(void))sub_100025CD4);
}

uint64_t sub_1000265BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100026604@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C528, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006E020, a1);
}

uint64_t sub_10002663C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_100025F8C(a1, v5, v4);
}

uint64_t sub_1000266E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100027A98();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100026710(uint64_t a1)
{
  unint64_t v2 = sub_100025CD4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100026750()
{
  unint64_t result = qword_10006D238;
  if (!qword_10006D238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D238);
  }
  return result;
}

unint64_t sub_1000267A8()
{
  unint64_t result = qword_10006D240[0];
  if (!qword_10006D240[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D240);
  }
  return result;
}

uint64_t sub_1000267FC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100026820, 0, 0);
}

uint64_t sub_100026820()
{
  uint64_t v1 = (uint64_t *)v0[3];
  sub_10004AE40();
  *uint64_t v1 = sub_10002775C(v0[2]);
  v1[1] = v2;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100026894(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100024D20();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100026948()
{
  unint64_t result = qword_10006D258;
  if (!qword_10006D258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D258);
  }
  return result;
}

unint64_t sub_1000269A0()
{
  unint64_t result = qword_10006D260[0];
  if (!qword_10006D260[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D260);
  }
  return result;
}

uint64_t sub_1000269F4@<X0>(uint64_t *a1@<X8>)
{
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  sub_10004AEA0();
  uint64_t result = sub_10004AE60();
  *a1 = result;
  return result;
}

uint64_t sub_100026A64(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100024D20();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100026B18(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100024D20();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100026BCC()
{
  unint64_t result = qword_10006D278;
  if (!qword_10006D278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D278);
  }
  return result;
}

unint64_t sub_100026C24()
{
  unint64_t result = qword_10006D280;
  if (!qword_10006D280)
  {
    sub_100005398(qword_10006D288);
    sub_100025AD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D280);
  }
  return result;
}

uint64_t sub_100026C98(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10002595C();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_eventsDefaultAlertTimeType()
{
  return &type metadata for UpdateIntent_eventsDefaultAlertTimeType;
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimesEntityQuery()
{
  return &type metadata for SettingsEventsDefaultAlertTimesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimesEntity()
{
  return &type metadata for SettingsEventsDefaultAlertTimesEntity;
}

uint64_t getEnumTagSinglePayload for SettingsEventsDefaultAlertTimeType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SettingsEventsDefaultAlertTimeType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x100026EE8);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimeType()
{
  return &type metadata for SettingsEventsDefaultAlertTimeType;
}

uint64_t sub_100026F20()
{
  return sub_100008248(&qword_10006C700, &qword_10006C708);
}

uint64_t sub_100026F5C@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v1 = sub_10004B490();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100007DEC(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (objc_class *)[self mainBundle];
  v11._countAndFlagsBits = 0xD000000000000020;
  v9._countAndFlagsBits = 0x8000000100058CC0;
  v11._object = (void *)0x8000000100058C90;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v7.super.Class isa = v6;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004B2C0(v11, v12, v7, v13, v9);

  swift_getKeyPath();
  sub_10004B480();
  sub_100024A0C();
  sub_100028230();
  sub_1000267A8();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100027244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100027478@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_1000241F0(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_100027510(unsigned __int8 *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_1000241F0(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_1000275D8(double a1)
{
  if ((double)sub_10004B2B0() == a1) {
    return 0;
  }
  if (a1 == 0.0) {
    return 1;
  }
  if (a1 == -300.0) {
    return 2;
  }
  if (a1 == -600.0) {
    return 3;
  }
  if (a1 == -900.0) {
    return 4;
  }
  if (a1 == -1800.0) {
    return 5;
  }
  if (a1 == -3600.0) {
    return 6;
  }
  if (a1 == -7200.0) {
    return 7;
  }
  if (a1 == -572400.0) {
    int v3 = 10;
  }
  else {
    int v3 = 0;
  }
  if (a1 == -172800.0) {
    unsigned int v4 = 9;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a1 == -86400.0) {
    return 8;
  }
  else {
    return v4;
  }
}

uint64_t sub_100027710(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000694D0;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xB) {
    return 11;
  }
  else {
    return v4;
  }
}

uint64_t sub_10002775C(uint64_t a1)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_100007DEC(&qword_10006D218);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006D2D8, &qword_10006D2E0);
  sub_100024A0C();
  uint64_t v9 = sub_10004B290();
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  swift_retain();
  sub_10004AEA0();
  sub_10004AE60();
  *(void *)&v11[0] = a1;
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  sub_10004AE50();
  swift_release();
  swift_release_n();
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_100027A98()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v41 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v40 = sub_100007DEC(&qword_10006D2B0);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  uint64_t v19 = v41;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v21 = sub_10004AF60();
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  uint64_t v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_100024CC8();
  uint64_t v40 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006D2B8);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v25 = v31;
  uint64_t v26 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v26(v10, v24, v25);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  LOBYTE(v49) = 11;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_100024A0C();
  sub_10004AFB0();
  return v40;
}

uint64_t sub_1000281F8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimesPickerControl()
{
  return &type metadata for SettingsEventsDefaultAlertTimesPickerControl;
}

uint64_t sub_100028214()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100028230()
{
  unint64_t result = qword_10006D318;
  if (!qword_10006D318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D318);
  }
  return result;
}

uint64_t sub_100028284()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100028308(uint64_t a1)
{
  uint64_t v32 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006D488);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  uint64_t v44 = v2;
  __chkstk_darwin(v1);
  unsigned int v36 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004AFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007DEC(&qword_10006D490);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v37 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  __chkstk_darwin(v11);
  sub_10002FDF8();
  sub_10004B0B0();
  v45._countAndFlagsBits = 0xD00000000000001ELL;
  v45._object = (void *)0x800000010005B280;
  sub_10004B0A0(v45);
  swift_getKeyPath();
  unint64_t v31 = sub_10003022C();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v46._countAndFlagsBits = 544106784;
  v46._object = (void *)0xE400000000000000;
  sub_10004B0A0(v46);
  uint64_t v12 = v5;
  uint64_t v13 = *(void (**)(char *))(v5 + 104);
  uint64_t v40 = v4;
  uint64_t v41 = v5 + 104;
  uint64_t v39 = v7;
  uint64_t v14 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  unsigned int v35 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v13(v7);
  uint64_t v34 = v13;
  sub_10004B080();
  uint64_t v15 = v12 + 8;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v42 = v15;
  v16(v7, v4);
  uint64_t v17 = v16;
  uint64_t v33 = v16;
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  sub_10004B0A0(v47);
  uint64_t v18 = v36;
  sub_10004B0C0();
  uint64_t v38 = sub_10004B010();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v44 + 8);
  v44 += 8;
  v29(v18, v43);
  sub_10004B0B0();
  v48._countAndFlagsBits = 2125385;
  v48._object = (void *)0xE300000000000000;
  sub_10004B0A0(v48);
  uint64_t v20 = v39;
  uint64_t v19 = v40;
  ((void (*)(char *, uint64_t, uint64_t))v13)(v39, v14, v40);
  sub_10004B080();
  v17(v20, v19);
  v49._countAndFlagsBits = 0x20776F6853202CLL;
  v49._object = (void *)0xE700000000000000;
  sub_10004B0A0(v49);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v50._object = (void *)0x800000010005B2A0;
  v50._countAndFlagsBits = 0xD000000000000013;
  sub_10004B0A0(v50);
  sub_10004B0C0();
  uint64_t v30 = sub_10004B010();
  uint64_t v21 = v29;
  v29(v18, v43);
  sub_10004B0B0();
  v51._countAndFlagsBits = 0x7420656C62616E45;
  v51._object = (void *)0xEB00000000206568;
  sub_10004B0A0(v51);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v52._countAndFlagsBits = 0xD000000000000018;
  v52._object = (void *)0x800000010005B2C0;
  sub_10004B0A0(v52);
  uint64_t v23 = v39;
  uint64_t v22 = v40;
  ((void (*)(char *, void, uint64_t))v34)(v39, v35, v40);
  sub_10004B080();
  v33(v23, v22);
  v53._countAndFlagsBits = 0;
  v53._object = (void *)0xE000000000000000;
  sub_10004B0A0(v53);
  sub_10004B0C0();
  uint64_t v24 = sub_10004B010();
  v21(v18, v43);
  sub_100007DEC(&qword_10006D498);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_10004EBF0;
  uint64_t v26 = v30;
  *(void *)(v25 + 32) = v38;
  *(void *)(v25 + 40) = v26;
  *(void *)(v25 + 48) = v24;
  uint64_t v27 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_100028944(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F858, (void (*)(void))sub_10003022C, (void (*)(uint64_t))sub_10002FDF8);
}

uint64_t sub_10002898C()
{
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  uint64_t v4 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10004D1A0;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100028A80()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D488);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D490);
  __chkstk_darwin(v6);
  sub_10002FDF8();
  sub_10004B0B0();
  v21._countAndFlagsBits = 0xD000000000000022;
  v21._object = (void *)0x800000010005B210;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._object = (void *)0x800000010005B240;
  v23._countAndFlagsBits = 0xD00000000000001FLL;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D498);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100028E24(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F858, (void (*)(void))sub_10003022C, (void (*)(uint64_t))sub_10002FDF8);
}

uint64_t sub_100028E6C()
{
  return sub_10002F218();
}

uint64_t sub_100028E7C()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D468);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D470);
  __chkstk_darwin(v6);
  sub_10001094C();
  sub_10004B0B0();
  v21._object = (void *)0x800000010005B1D0;
  v21._countAndFlagsBits = 0xD000000000000015;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._countAndFlagsBits = 0xD000000000000017;
  v23._object = (void *)0x800000010005B1F0;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D478);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100029220(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F830, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_10001094C);
}

uint64_t sub_100029268()
{
  return sub_10002F218();
}

uint64_t sub_100029278()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D468);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D470);
  __chkstk_darwin(v6);
  sub_10001094C();
  sub_10004B0B0();
  v21._object = (void *)0x800000010005B190;
  v21._countAndFlagsBits = 0xD000000000000015;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._countAndFlagsBits = 0xD000000000000018;
  v23._object = (void *)0x800000010005B1B0;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D478);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002961C(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F830, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_10001094C);
}

uint64_t sub_100029664()
{
  return sub_10002F218();
}

uint64_t sub_100029678()
{
  uint64_t v0 = sub_100007DEC(&qword_10006D450);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  uint64_t v28 = v1;
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004AFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007DEC(&qword_10006D458);
  uint64_t v9 = __chkstk_darwin(v8);
  __chkstk_darwin(v9);
  sub_100018818();
  sub_10004B0B0();
  v29._countAndFlagsBits = 544499027;
  v29._object = (void *)0xE400000000000000;
  sub_10004B0A0(v29);
  unsigned int v26 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  Swift::String v21 = *(void (**)(char *))(v5 + 104);
  v21(v7);
  sub_10004B080();
  Swift::String v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v25 = v5 + 8;
  v24(v7, v4);
  v30._object = (void *)0x800000010005B110;
  v30._countAndFlagsBits = 0xD00000000000001CLL;
  sub_10004B0A0(v30);
  sub_10004B0C0();
  uint64_t v23 = sub_10004B010();
  uint64_t v10 = v27;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  v20(v3, v27);
  sub_10004B0B0();
  v31._countAndFlagsBits = 0xD000000000000023;
  v31._object = (void *)0x800000010005B130;
  sub_10004B0A0(v31);
  uint64_t v11 = v21;
  ((void (*)(char *, void, uint64_t))v21)(v7, v26, v4);
  sub_10004B080();
  v24(v7, v4);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004B0A0(v32);
  sub_10004B0C0();
  uint64_t v22 = sub_10004B010();
  uint64_t v12 = v10;
  uint64_t v13 = v20;
  v20(v3, v12);
  sub_10004B0B0();
  v33._countAndFlagsBits = 0xD000000000000024;
  v33._object = (void *)0x800000010005B160;
  sub_10004B0A0(v33);
  ((void (*)(char *, void, uint64_t))v11)(v7, v26, v4);
  sub_10004B080();
  v24(v7, v4);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v14 = sub_10004B010();
  v13(v3, v27);
  sub_100007DEC(&qword_10006D460);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004EBF0;
  uint64_t v16 = v22;
  *(void *)(v15 + 32) = v23;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_100029B20(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F808, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_100018818);
}

uint64_t sub_100029B68()
{
  uint64_t v0 = sub_100007DEC(&qword_10006D450);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  uint64_t v28 = v1;
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004AFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007DEC(&qword_10006D458);
  uint64_t v9 = __chkstk_darwin(v8);
  __chkstk_darwin(v9);
  sub_100018818();
  sub_10004B0B0();
  v29._countAndFlagsBits = 544499027;
  v29._object = (void *)0xE400000000000000;
  sub_10004B0A0(v29);
  unsigned int v26 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  Swift::String v21 = *(void (**)(char *))(v5 + 104);
  v21(v7);
  sub_10004B080();
  Swift::String v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v25 = v5 + 8;
  v24(v7, v4);
  v30._object = (void *)0x800000010005B080;
  v30._countAndFlagsBits = 0xD000000000000020;
  sub_10004B0A0(v30);
  sub_10004B0C0();
  uint64_t v23 = sub_10004B010();
  uint64_t v10 = v27;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  v20(v3, v27);
  sub_10004B0B0();
  v31._countAndFlagsBits = 0xD000000000000027;
  v31._object = (void *)0x800000010005B0B0;
  sub_10004B0A0(v31);
  uint64_t v11 = v21;
  ((void (*)(char *, void, uint64_t))v21)(v7, v26, v4);
  sub_10004B080();
  v24(v7, v4);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004B0A0(v32);
  sub_10004B0C0();
  uint64_t v22 = sub_10004B010();
  uint64_t v12 = v10;
  uint64_t v13 = v20;
  v20(v3, v12);
  sub_10004B0B0();
  v33._countAndFlagsBits = 0xD000000000000025;
  v33._object = (void *)0x800000010005B0E0;
  sub_10004B0A0(v33);
  ((void (*)(char *, void, uint64_t))v11)(v7, v26, v4);
  sub_10004B080();
  v24(v7, v4);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v14 = sub_10004B010();
  v13(v3, v27);
  sub_100007DEC(&qword_10006D460);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004EBF0;
  uint64_t v16 = v22;
  *(void *)(v15 + 32) = v23;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10002A014(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F808, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_100018818);
}

uint64_t sub_10002A05C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006D438);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  uint64_t v28 = v1;
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004AFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007DEC(&qword_10006D440);
  __chkstk_darwin(v8);
  sub_10002FE4C();
  sub_10004B0B0();
  v29._object = (void *)0x800000010005B010;
  v29._countAndFlagsBits = 0xD000000000000019;
  sub_10004B0A0(v29);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  unsigned int v26 = *(void (**)(char *))(v5 + 104);
  v26(v7);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v25 = v5 + 8;
  v9(v7, v4);
  Swift::String v21 = v9;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10004B0A0(v30);
  sub_10004B0C0();
  uint64_t v24 = sub_10004B010();
  uint64_t v10 = v27;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  v20(v3, v27);
  sub_10004B0B0();
  v31._countAndFlagsBits = 0xD00000000000001BLL;
  v31._object = (void *)0x800000010005B030;
  sub_10004B0A0(v31);
  uint64_t v11 = v22;
  ((void (*)(char *, void, uint64_t))v26)(v7, v22, v4);
  sub_10004B080();
  v9(v7, v4);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004B0A0(v32);
  sub_10004B0C0();
  uint64_t v23 = sub_10004B010();
  uint64_t v12 = v10;
  uint64_t v13 = v20;
  v20(v3, v12);
  sub_10004B0B0();
  v33._countAndFlagsBits = 0xD000000000000023;
  v33._object = (void *)0x800000010005B050;
  sub_10004B0A0(v33);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v7, v11, v4);
  sub_10004B080();
  v21(v7, v4);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v14 = sub_10004B010();
  v13(v3, v27);
  sub_100007DEC(&qword_10006D448);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004EBF0;
  uint64_t v16 = v23;
  *(void *)(v15 + 32) = v24;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10002A4E0(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F7E0, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_10002FE4C);
}

uint64_t sub_10002A528()
{
  uint64_t v0 = sub_100007DEC(&qword_10006D438);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  uint64_t v28 = v1;
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004AFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007DEC(&qword_10006D440);
  __chkstk_darwin(v8);
  sub_10002FE4C();
  sub_10004B0B0();
  v29._object = (void *)0x800000010005AFA0;
  v29._countAndFlagsBits = 0xD000000000000019;
  sub_10004B0A0(v29);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  unsigned int v26 = *(void (**)(char *))(v5 + 104);
  v26(v7);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v25 = v5 + 8;
  v9(v7, v4);
  Swift::String v21 = v9;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10004B0A0(v30);
  sub_10004B0C0();
  uint64_t v24 = sub_10004B010();
  uint64_t v10 = v27;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  v20(v3, v27);
  sub_10004B0B0();
  v31._countAndFlagsBits = 0xD00000000000001CLL;
  v31._object = (void *)0x800000010005AFC0;
  sub_10004B0A0(v31);
  uint64_t v11 = v22;
  ((void (*)(char *, void, uint64_t))v26)(v7, v22, v4);
  sub_10004B080();
  v9(v7, v4);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004B0A0(v32);
  sub_10004B0C0();
  uint64_t v23 = sub_10004B010();
  uint64_t v12 = v10;
  uint64_t v13 = v20;
  v20(v3, v12);
  sub_10004B0B0();
  v33._countAndFlagsBits = 0xD000000000000029;
  v33._object = (void *)0x800000010005AFE0;
  sub_10004B0A0(v33);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v7, v11, v4);
  sub_10004B080();
  v21(v7, v4);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v14 = sub_10004B010();
  v13(v3, v27);
  sub_100007DEC(&qword_10006D448);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004EBF0;
  uint64_t v16 = v23;
  *(void *)(v15 + 32) = v24;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10002A9AC(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F7E0, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_10002FE4C);
}

uint64_t sub_10002A9F4(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006D420);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  uint64_t v31 = v2;
  __chkstk_darwin(v1);
  Swift::String v29 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10004AFF0();
  uint64_t v4 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100007DEC(&qword_10006D428);
  uint64_t v8 = __chkstk_darwin(v7);
  __chkstk_darwin(v8);
  v23[1] = sub_1000158F4();
  sub_10004B0B0();
  v32._countAndFlagsBits = 0x20636E7953;
  v32._object = (void *)0xE500000000000000;
  sub_10004B0A0(v32);
  swift_getKeyPath();
  unint64_t v26 = sub_100014838();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v33._countAndFlagsBits = 544106784;
  v33._object = (void *)0xE400000000000000;
  sub_10004B0A0(v33);
  uint64_t v9 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v10 = v4;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v12 = v28;
  v11(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v28);
  sub_10004B080();
  uint64_t v13 = v10 + 8;
  uint64_t v14 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23[0] = v13;
  v14(v6, v12);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  uint64_t v15 = v29;
  sub_10004B0C0();
  uint64_t v16 = sub_10004B010();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v25 = v16;
  v31 += 8;
  v24(v15, v30);
  sub_10004B0B0();
  v35._countAndFlagsBits = 544499027;
  v35._object = (void *)0xE400000000000000;
  sub_10004B0A0(v35);
  uint64_t v17 = v28;
  v11(v6, v9, v28);
  sub_10004B080();
  v14(v6, v17);
  v36._countAndFlagsBits = 0x636E7973206F7420;
  v36._object = (void *)0xE900000000000020;
  sub_10004B0A0(v36);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  sub_10004B0A0(v37);
  uint64_t v18 = v29;
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  v24(v18, v30);
  sub_100007DEC(&qword_10006D430);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_10004D1B0;
  *(void *)(v20 + 32) = v25;
  *(void *)(v20 + 40) = v19;
  uint64_t v21 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_10002AE80(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F7B8, (void (*)(void))sub_100014838, (void (*)(uint64_t))sub_1000158F4);
}

uint64_t sub_10002AEC8()
{
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  uint64_t v4 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10004D1A0;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10002AFD0(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v26 = sub_100007DEC(&qword_10006D408);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D410);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_10002FEA0();
  sub_10004B0B0();
  v29._countAndFlagsBits = 0xD000000000000027;
  v29._object = (void *)0x800000010005AF50;
  sub_10004B0A0(v29);
  swift_getKeyPath();
  unint64_t v23 = sub_10003013C();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v30._countAndFlagsBits = 544106784;
  v30._object = (void *)0xE400000000000000;
  sub_10004B0A0(v30);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v21 = *(void (**)(char *))(v3 + 104);
  uint64_t v8 = v27;
  v21(v5);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v3 + 8;
  uint64_t v20 = v9;
  v9(v5, v8);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10004B0A0(v31);
  sub_10004B0C0();
  uint64_t v25 = sub_10004B010();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  uint64_t v18 = v10;
  uint64_t v11 = v26;
  v10(v2, v26);
  sub_10004B0B0();
  v32._countAndFlagsBits = 0x6D20796669746F4ELL;
  v32._object = (void *)0xEA00000000002065;
  sub_10004B0A0(v32);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v33._object = (void *)0x800000010005AF80;
  v33._countAndFlagsBits = 0xD000000000000012;
  sub_10004B0A0(v33);
  uint64_t v12 = v27;
  ((void (*)(char *, void, uint64_t))v21)(v5, v22, v27);
  sub_10004B080();
  v20(v5, v12);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v13 = sub_10004B010();
  v18(v2, v11);
  sub_100007DEC(&qword_10006D418);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004D1B0;
  *(void *)(v14 + 32) = v25;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10002B478(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F790, (void (*)(void))sub_10003013C, (void (*)(uint64_t))sub_10002FEA0);
}

uint64_t sub_10002B4C0()
{
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10004EBE0;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10002B5CC()
{
  uint64_t v21 = sub_100007DEC(&qword_10006D408);
  uint64_t v19 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v1 = (char *)&v14 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D410);
  __chkstk_darwin(v6);
  sub_10002FEA0();
  sub_10004B0B0();
  v22._countAndFlagsBits = 0xD00000000000002BLL;
  v22._object = (void *)0x800000010005AEF0;
  sub_10004B0A0(v22);
  unsigned int v18 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v17 = *(void (**)(char *))(v3 + 104);
  uint64_t v15 = v2;
  v17(v5);
  sub_10004B080();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v5, v2);
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  sub_10004B0A0(v23);
  sub_10004B0C0();
  uint64_t v7 = sub_10004B010();
  uint64_t v19 = *(void *)(v19 + 8);
  uint64_t v20 = v7;
  uint64_t v8 = v21;
  ((void (*)(char *, uint64_t))v19)(v1, v21);
  sub_10004B0B0();
  v24._object = (void *)0x800000010005AF20;
  v24._countAndFlagsBits = 0xD000000000000021;
  sub_10004B0A0(v24);
  uint64_t v9 = v15;
  ((void (*)(char *, void, uint64_t))v17)(v5, v18, v15);
  sub_10004B080();
  v16(v5, v9);
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  sub_10004B0A0(v25);
  sub_10004B0C0();
  uint64_t v10 = sub_10004B010();
  ((void (*)(char *, uint64_t))v19)(v1, v8);
  sub_100007DEC(&qword_10006D418);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10004D1B0;
  *(void *)(v11 + 32) = v20;
  *(void *)(v11 + 40) = v10;
  uint64_t v12 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_10002B97C(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F790, (void (*)(void))sub_10003013C, (void (*)(uint64_t))sub_10002FEA0);
}

uint64_t sub_10002B9C4()
{
  return sub_10002F218();
}

uint64_t sub_10002B9D4(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v26 = sub_100007DEC(&qword_10006D3F0);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D3F8);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_100025CD4();
  sub_10004B0B0();
  v29._object = (void *)0x800000010005AEC0;
  v29._countAndFlagsBits = 0xD000000000000024;
  sub_10004B0A0(v29);
  swift_getKeyPath();
  unint64_t v23 = sub_1000248FC();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v30._countAndFlagsBits = 544106784;
  v30._object = (void *)0xE400000000000000;
  sub_10004B0A0(v30);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v21 = *(void (**)(char *))(v3 + 104);
  uint64_t v8 = v27;
  v21(v5);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v3 + 8;
  uint64_t v20 = v9;
  v9(v5, v8);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10004B0A0(v31);
  sub_10004B0C0();
  uint64_t v25 = sub_10004B010();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  unsigned int v18 = v10;
  uint64_t v11 = v26;
  v10(v2, v26);
  sub_10004B0B0();
  v32._countAndFlagsBits = 0x6D20796669746F4ELL;
  v32._object = (void *)0xEA00000000002065;
  sub_10004B0A0(v32);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v33._countAndFlagsBits = 0x65766520726F6620;
  v33._object = (void *)0xEF206E692073746ELL;
  sub_10004B0A0(v33);
  uint64_t v12 = v27;
  ((void (*)(char *, void, uint64_t))v21)(v5, v22, v27);
  sub_10004B080();
  v20(v5, v12);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v13 = sub_10004B010();
  v18(v2, v11);
  sub_100007DEC(&qword_10006D400);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004D1B0;
  *(void *)(v14 + 32) = v25;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10002BE80(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F768, (void (*)(void))sub_1000248FC, (void (*)(uint64_t))sub_100025CD4);
}

uint64_t sub_10002BEC8()
{
  uint64_t v23 = sub_10004B030();
  uint64_t v22 = sub_10004B030();
  uint64_t v21 = sub_10004B030();
  uint64_t v20 = sub_10004B030();
  uint64_t v19 = sub_10004B030();
  uint64_t v18 = sub_10004B030();
  uint64_t v17 = sub_10004B030();
  uint64_t v16 = sub_10004B030();
  uint64_t v15 = sub_10004B030();
  uint64_t v14 = sub_10004B030();
  uint64_t v13 = sub_10004B030();
  uint64_t v12 = sub_10004B030();
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  uint64_t v4 = sub_10004B030();
  uint64_t v5 = sub_10004B030();
  uint64_t v6 = sub_10004B030();
  uint64_t v7 = sub_10004B030();
  uint64_t v8 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10004F600;
  *(void *)(v9 + 32) = v23;
  *(void *)(v9 + 40) = v22;
  *(void *)(v9 + 48) = v21;
  *(void *)(v9 + 56) = v20;
  *(void *)(v9 + 64) = v19;
  *(void *)(v9 + 72) = v18;
  *(void *)(v9 + 80) = v17;
  *(void *)(v9 + 88) = v16;
  *(void *)(v9 + 96) = v15;
  *(void *)(v9 + 104) = v14;
  *(void *)(v9 + 112) = v13;
  *(void *)(v9 + 120) = v12;
  *(void *)(v9 + 128) = v0;
  *(void *)(v9 + 136) = v1;
  *(void *)(v9 + 144) = v2;
  *(void *)(v9 + 152) = v3;
  *(void *)(v9 + 160) = v4;
  *(void *)(v9 + 168) = v5;
  *(void *)(v9 + 176) = v6;
  *(void *)(v9 + 184) = v7;
  *(void *)(v9 + 192) = v8;
  uint64_t v10 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10002C29C()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D3F0);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D3F8);
  __chkstk_darwin(v6);
  sub_100025CD4();
  sub_10004B0B0();
  v21._countAndFlagsBits = 0xD000000000000028;
  v21._object = (void *)0x800000010005AD70;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._object = (void *)0x800000010005ADA0;
  v23._countAndFlagsBits = 0xD00000000000001ELL;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D400);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002C640(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F768, (void (*)(void))sub_1000248FC, (void (*)(uint64_t))sub_100025CD4);
}

uint64_t sub_10002C688(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v26 = sub_100007DEC(&qword_10006D3D8);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D3E0);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_10002FEF4();
  sub_10004B0B0();
  v29._countAndFlagsBits = 0xD00000000000002CLL;
  v29._object = (void *)0x800000010005AD20;
  sub_10004B0A0(v29);
  swift_getKeyPath();
  unint64_t v23 = sub_10003006C();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v30._countAndFlagsBits = 544106784;
  v30._object = (void *)0xE400000000000000;
  sub_10004B0A0(v30);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  Swift::String v21 = *(void (**)(char *))(v3 + 104);
  uint64_t v8 = v27;
  v21(v5);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v3 + 8;
  uint64_t v20 = v9;
  v9(v5, v8);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10004B0A0(v31);
  sub_10004B0C0();
  uint64_t v25 = sub_10004B010();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  uint64_t v18 = v10;
  uint64_t v11 = v26;
  v10(v2, v26);
  sub_10004B0B0();
  v32._countAndFlagsBits = 0x6D20796669746F4ELL;
  v32._object = (void *)0xEA00000000002065;
  sub_10004B0A0(v32);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v33._object = (void *)0x800000010005AD50;
  v33._countAndFlagsBits = 0xD000000000000017;
  sub_10004B0A0(v33);
  uint64_t v12 = v27;
  ((void (*)(char *, void, uint64_t))v21)(v5, v22, v27);
  sub_10004B080();
  v20(v5, v12);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v13 = sub_10004B010();
  v18(v2, v11);
  sub_100007DEC(&qword_10006D3E8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004D1B0;
  *(void *)(v14 + 32) = v25;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10002CB30(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F740, (void (*)(void))sub_10003006C, (void (*)(uint64_t))sub_10002FEF4);
}

uint64_t sub_10002CB78()
{
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  uint64_t v4 = sub_10004B030();
  uint64_t v5 = sub_10004B030();
  uint64_t v6 = sub_10004B030();
  uint64_t v7 = sub_10004B030();
  uint64_t v8 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10004E220;
  *(void *)(v9 + 32) = v0;
  *(void *)(v9 + 40) = v1;
  *(void *)(v9 + 48) = v2;
  *(void *)(v9 + 56) = v3;
  *(void *)(v9 + 64) = v4;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v10 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10002CD68()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D3D8);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D3E0);
  __chkstk_darwin(v6);
  sub_10002FEF4();
  sub_10004B0B0();
  v21._countAndFlagsBits = 0xD000000000000030;
  v21._object = (void *)0x800000010005ACB0;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._object = (void *)0x800000010005ACF0;
  v23._countAndFlagsBits = 0xD000000000000026;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D3E8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002D10C(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F740, (void (*)(void))sub_10003006C, (void (*)(uint64_t))sub_10002FEF4);
}

uint64_t sub_10002D154()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D3C0);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D3C8);
  __chkstk_darwin(v6);
  sub_1000054D8();
  sub_10004B0B0();
  v21._object = (void *)0x800000010005AC50;
  v21._countAndFlagsBits = 0xD00000000000001FLL;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._countAndFlagsBits = 0xD000000000000037;
  v23._object = (void *)0x800000010005AC70;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D3D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002D4F8(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F718, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_1000054D8);
}

uint64_t sub_10002D540()
{
  uint64_t v0 = sub_100007DEC(&qword_10006D3C0);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v27 = v0;
  uint64_t v28 = v1;
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004AFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007DEC(&qword_10006D3C8);
  __chkstk_darwin(v8);
  sub_1000054D8();
  sub_10004B0B0();
  v29._object = (void *)0x800000010005ABC0;
  v29._countAndFlagsBits = 0xD00000000000001DLL;
  sub_10004B0A0(v29);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v26 = *(void (**)(char *))(v5 + 104);
  v26(v7);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v25 = v5 + 8;
  v9(v7, v4);
  Swift::String v21 = v9;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_10004B0A0(v30);
  sub_10004B0C0();
  uint64_t v24 = sub_10004B010();
  uint64_t v10 = v27;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  v20(v3, v27);
  sub_10004B0B0();
  v31._countAndFlagsBits = 0xD000000000000027;
  v31._object = (void *)0x800000010005ABE0;
  sub_10004B0A0(v31);
  uint64_t v11 = v22;
  ((void (*)(char *, void, uint64_t))v26)(v7, v22, v4);
  sub_10004B080();
  v9(v7, v4);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_10004B0A0(v32);
  sub_10004B0C0();
  uint64_t v23 = sub_10004B010();
  uint64_t v12 = v10;
  uint64_t v13 = v20;
  v20(v3, v12);
  sub_10004B0B0();
  v33._countAndFlagsBits = 0xD00000000000003DLL;
  v33._object = (void *)0x800000010005AC10;
  sub_10004B0A0(v33);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v7, v11, v4);
  sub_10004B080();
  v21(v7, v4);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v14 = sub_10004B010();
  v13(v3, v27);
  sub_100007DEC(&qword_10006D3D0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004EBF0;
  uint64_t v16 = v23;
  *(void *)(v15 + 32) = v24;
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = v14;
  uint64_t v17 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10002D9C4(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F718, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_1000054D8);
}

uint64_t sub_10002DA0C(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v26 = sub_100007DEC(&qword_10006D3A8);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D3B0);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_10001F350();
  sub_10004B0B0();
  v29._countAndFlagsBits = 0xD000000000000027;
  v29._object = (void *)0x800000010005AB70;
  sub_10004B0A0(v29);
  swift_getKeyPath();
  unint64_t v23 = sub_10001E1A4();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v30._countAndFlagsBits = 544106784;
  v30._object = (void *)0xE400000000000000;
  sub_10004B0A0(v30);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  Swift::String v21 = *(void (**)(char *))(v3 + 104);
  uint64_t v8 = v27;
  v21(v5);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v3 + 8;
  uint64_t v20 = v9;
  v9(v5, v8);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10004B0A0(v31);
  sub_10004B0C0();
  uint64_t v25 = sub_10004B010();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  uint64_t v18 = v10;
  uint64_t v11 = v26;
  v10(v2, v26);
  sub_10004B0B0();
  v32._object = (void *)0x800000010005ABA0;
  v32._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10004B0A0(v32);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v33._countAndFlagsBits = 544106784;
  v33._object = (void *)0xE400000000000000;
  sub_10004B0A0(v33);
  uint64_t v12 = v27;
  ((void (*)(char *, void, uint64_t))v21)(v5, v22, v27);
  sub_10004B080();
  v20(v5, v12);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v13 = sub_10004B010();
  v18(v2, v11);
  sub_100007DEC(&qword_10006D3B8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004D1B0;
  *(void *)(v14 + 32) = v25;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10002DEA8(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F6F0, (void (*)(void))sub_10001E1A4, (void (*)(uint64_t))sub_10001F350);
}

uint64_t sub_10002DEF0()
{
  uint64_t v25 = sub_10004B030();
  uint64_t v24 = sub_10004B030();
  uint64_t v23 = sub_10004B030();
  uint64_t v22 = sub_10004B030();
  uint64_t v21 = sub_10004B030();
  uint64_t v20 = sub_10004B030();
  uint64_t v19 = sub_10004B030();
  uint64_t v18 = sub_10004B030();
  uint64_t v17 = sub_10004B030();
  uint64_t v16 = sub_10004B030();
  uint64_t v15 = sub_10004B030();
  uint64_t v14 = sub_10004B030();
  uint64_t v13 = sub_10004B030();
  uint64_t v12 = sub_10004B030();
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  uint64_t v4 = sub_10004B030();
  uint64_t v5 = sub_10004B030();
  uint64_t v6 = sub_10004B030();
  uint64_t v7 = sub_10004B030();
  uint64_t v8 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10004F610;
  *(void *)(v9 + 32) = v25;
  *(void *)(v9 + 40) = v24;
  *(void *)(v9 + 48) = v23;
  *(void *)(v9 + 56) = v22;
  *(void *)(v9 + 64) = v21;
  *(void *)(v9 + 72) = v20;
  *(void *)(v9 + 80) = v19;
  *(void *)(v9 + 88) = v18;
  *(void *)(v9 + 96) = v17;
  *(void *)(v9 + 104) = v16;
  *(void *)(v9 + 112) = v15;
  *(void *)(v9 + 120) = v14;
  *(void *)(v9 + 128) = v13;
  *(void *)(v9 + 136) = v12;
  *(void *)(v9 + 144) = v0;
  *(void *)(v9 + 152) = v1;
  *(void *)(v9 + 160) = v2;
  *(void *)(v9 + 168) = v3;
  *(void *)(v9 + 176) = v4;
  *(void *)(v9 + 184) = v5;
  *(void *)(v9 + 192) = v6;
  *(void *)(v9 + 200) = v7;
  *(void *)(v9 + 208) = v8;
  uint64_t v10 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10002E29C(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v26 = sub_100007DEC(&qword_10006D390);
  uint64_t v28 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D398);
  uint64_t v7 = __chkstk_darwin(v6);
  __chkstk_darwin(v7);
  sub_10002FF48();
  sub_10004B0B0();
  v29._countAndFlagsBits = 0xD000000000000021;
  v29._object = (void *)0x800000010005AA80;
  sub_10004B0A0(v29);
  swift_getKeyPath();
  unint64_t v23 = sub_100030000();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v30._countAndFlagsBits = 544106784;
  v30._object = (void *)0xE400000000000000;
  sub_10004B0A0(v30);
  unsigned int v22 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v21 = *(void (**)(char *))(v3 + 104);
  uint64_t v8 = v27;
  v21(v5);
  sub_10004B080();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v3 + 8;
  uint64_t v20 = v9;
  v9(v5, v8);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_10004B0A0(v31);
  sub_10004B0C0();
  uint64_t v25 = sub_10004B010();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v28 + 8);
  v28 += 8;
  uint64_t v18 = v10;
  uint64_t v11 = v26;
  v10(v2, v26);
  sub_10004B0B0();
  v32._object = (void *)0x800000010005AAB0;
  v32._countAndFlagsBits = 0xD000000000000012;
  sub_10004B0A0(v32);
  swift_getKeyPath();
  sub_10004AFE0();
  swift_release();
  sub_10004B090();
  swift_release();
  v33._countAndFlagsBits = 544106784;
  v33._object = (void *)0xE400000000000000;
  sub_10004B0A0(v33);
  uint64_t v12 = v27;
  ((void (*)(char *, void, uint64_t))v21)(v5, v22, v27);
  sub_10004B080();
  v20(v5, v12);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_10004B0A0(v34);
  sub_10004B0C0();
  uint64_t v13 = sub_10004B010();
  v18(v2, v11);
  sub_100007DEC(&qword_10006D3A0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004D1B0;
  *(void *)(v14 + 32) = v25;
  *(void *)(v14 + 40) = v13;
  uint64_t v15 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_10002E738(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F6C8, (void (*)(void))sub_100030000, (void (*)(uint64_t))sub_10002FF48);
}

uint64_t sub_10002E780()
{
  uint64_t v0 = sub_10004B030();
  uint64_t v1 = sub_10004B030();
  uint64_t v2 = sub_10004B030();
  uint64_t v3 = sub_10004B030();
  uint64_t v4 = sub_10004B030();
  uint64_t v5 = sub_10004B030();
  uint64_t v6 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10004F620;
  *(void *)(v7 + 32) = v0;
  *(void *)(v7 + 40) = v1;
  *(void *)(v7 + 48) = v2;
  *(void *)(v7 + 56) = v3;
  *(void *)(v7 + 64) = v4;
  *(void *)(v7 + 72) = v5;
  *(void *)(v7 + 80) = v6;
  uint64_t v8 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10002E8C8()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D370);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D378);
  __chkstk_darwin(v6);
  sub_10000D8C8();
  sub_10004B0B0();
  v21._object = (void *)0x800000010005AA10;
  v21._countAndFlagsBits = 0xD00000000000001FLL;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._countAndFlagsBits = 0xD000000000000020;
  v23._object = (void *)0x800000010005AA30;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D380);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002EC6C(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F6A0, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_10000D8C8);
}

uint64_t sub_10002ECB4()
{
  uint64_t v20 = sub_100007DEC(&qword_10006D370);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10004AFF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007DEC(&qword_10006D378);
  __chkstk_darwin(v6);
  sub_10000D8C8();
  sub_10004B0B0();
  v21._object = (void *)0x800000010005A9B0;
  v21._countAndFlagsBits = 0xD000000000000020;
  sub_10004B0A0(v21);
  unsigned int v17 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v16 = *(void (**)(char *))(v3 + 104);
  uint64_t v14 = v2;
  v16(v5);
  sub_10004B080();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v5, v2);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  sub_10004B0A0(v22);
  sub_10004B0C0();
  uint64_t v19 = sub_10004B010();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v18 + 8);
  v7(v1, v20);
  sub_10004B0B0();
  v23._countAndFlagsBits = 0xD000000000000021;
  v23._object = (void *)0x800000010005A9E0;
  sub_10004B0A0(v23);
  uint64_t v8 = v14;
  ((void (*)(char *, void, uint64_t))v16)(v5, v17, v14);
  sub_10004B080();
  v15(v5, v8);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  sub_10004B0A0(v24);
  sub_10004B0C0();
  uint64_t v9 = sub_10004B010();
  v7(v1, v20);
  sub_100007DEC(&qword_10006D380);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1B0;
  *(void *)(v10 + 32) = v19;
  *(void *)(v10 + 40) = v9;
  uint64_t v11 = sub_10004B000();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_10002F058(uint64_t a1)
{
  return sub_10002F0A0(a1, (uint64_t)&unk_10004F6A0, (void (*)(void))sub_10002FFA4, (void (*)(uint64_t))sub_10000D8C8);
}

uint64_t sub_10002F0A0(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_10004B070();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_10004AFE0();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_10004B060();
  uint64_t v11 = sub_10004B050();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100007DEC(&qword_10006D360);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10004E230;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_10004B040();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10002F218()
{
  uint64_t v0 = sub_10004B030();
  sub_100007DEC(&qword_10006D368);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10004E230;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_10004B020();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_10002F27C()
{
  qword_10006E040 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10002F298()
{
  if (qword_10006C538 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for CalendarSettingsAssistantIntentsProvider()
{
  return &type metadata for CalendarSettingsAssistantIntentsProvider;
}

uint64_t sub_10002F304()
{
  uint64_t v0 = sub_10004B0F0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100042598();
  uint64_t v61 = v4;
  sub_10002FDF8();
  sub_10004B100();
  uint64_t v59 = sub_10004B0E0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v60 = sub_100042598();
  uint64_t v61 = v6;
  sub_10004B100();
  uint64_t v58 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_10001206C();
  uint64_t v61 = v7;
  sub_10001094C();
  sub_10004B100();
  uint64_t v57 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_10001206C();
  uint64_t v61 = v8;
  sub_10004B100();
  uint64_t v56 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_100019F34();
  uint64_t v61 = v9;
  sub_100018818();
  sub_10004B100();
  uint64_t v55 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_100019F34();
  uint64_t v61 = v10;
  sub_10004B100();
  uint64_t v54 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_100032638();
  uint64_t v61 = v11;
  sub_10002FE4C();
  sub_10004B100();
  uint64_t v53 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_100032638();
  uint64_t v61 = v12;
  sub_10004B100();
  uint64_t v52 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_100016EEC();
  uint64_t v61 = v13;
  sub_1000158F4();
  sub_10004B100();
  uint64_t v51 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_100037BDC();
  uint64_t v61 = v14;
  uint64_t v62 = v15;
  sub_10002FEA0();
  sub_10004B100();
  uint64_t v50 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_100037BDC();
  uint64_t v61 = v16;
  uint64_t v62 = v17;
  sub_10004B100();
  uint64_t v49 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_100027A98();
  uint64_t v61 = v18;
  sub_100025CD4();
  sub_10004B100();
  uint64_t v48 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_100027A98();
  uint64_t v61 = v19;
  sub_10004B100();
  uint64_t v47 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_10004A1A4();
  uint64_t v61 = v20;
  sub_10002FEF4();
  sub_10004B100();
  uint64_t v46 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_10004A1A4();
  uint64_t v61 = v21;
  sub_10004B100();
  uint64_t v45 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_100007624();
  uint64_t v61 = v22;
  sub_1000054D8();
  sub_10004B100();
  uint64_t v44 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_100007624();
  uint64_t v61 = v23;
  sub_10004B100();
  uint64_t v24 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_100020AB0();
  uint64_t v61 = v25;
  sub_10001F350();
  sub_10004B100();
  uint64_t v26 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = sub_10003C9CC();
  uint64_t v61 = v27;
  sub_10002FF48();
  sub_10004B100();
  uint64_t v28 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_10000F020();
  uint64_t v61 = v29;
  sub_10000D8C8();
  sub_10004B100();
  uint64_t v30 = sub_10004B0E0();
  v5(v3, v0);
  uint64_t v60 = (uint64_t)sub_10000F020();
  uint64_t v61 = v31;
  sub_10004B100();
  uint64_t v32 = sub_10004B0E0();
  v5(v3, v0);
  sub_100007DEC(&qword_10006D350);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_10004F600;
  uint64_t v34 = v58;
  *(void *)(v33 + 32) = v59;
  *(void *)(v33 + 40) = v34;
  uint64_t v35 = v56;
  *(void *)(v33 + 48) = v57;
  *(void *)(v33 + 56) = v35;
  uint64_t v36 = v54;
  *(void *)(v33 + 64) = v55;
  *(void *)(v33 + 72) = v36;
  uint64_t v37 = v52;
  *(void *)(v33 + 80) = v53;
  *(void *)(v33 + 88) = v37;
  uint64_t v38 = v50;
  *(void *)(v33 + 96) = v51;
  *(void *)(v33 + 104) = v38;
  uint64_t v39 = v48;
  *(void *)(v33 + 112) = v49;
  *(void *)(v33 + 120) = v39;
  uint64_t v40 = v46;
  *(void *)(v33 + 128) = v47;
  *(void *)(v33 + 136) = v40;
  uint64_t v41 = v44;
  *(void *)(v33 + 144) = v45;
  *(void *)(v33 + 152) = v41;
  *(void *)(v33 + 160) = v24;
  *(void *)(v33 + 168) = v26;
  *(void *)(v33 + 176) = v28;
  *(void *)(v33 + 184) = v30;
  *(void *)(v33 + 192) = v32;
  uint64_t v42 = sub_10004B0D0();
  swift_bridgeObjectRelease();
  return v42;
}

unint64_t sub_10002FDF8()
{
  unint64_t result = qword_10006D328;
  if (!qword_10006D328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D328);
  }
  return result;
}

unint64_t sub_10002FE4C()
{
  unint64_t result = qword_10006D330;
  if (!qword_10006D330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D330);
  }
  return result;
}

unint64_t sub_10002FEA0()
{
  unint64_t result = qword_10006D338;
  if (!qword_10006D338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D338);
  }
  return result;
}

unint64_t sub_10002FEF4()
{
  unint64_t result = qword_10006D340;
  if (!qword_10006D340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D340);
  }
  return result;
}

unint64_t sub_10002FF48()
{
  unint64_t result = qword_10006D348;
  if (!qword_10006D348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D348);
  }
  return result;
}

unint64_t sub_10002FFA4()
{
  unint64_t result = qword_10006D358;
  if (!qword_10006D358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D358);
  }
  return result;
}

unint64_t sub_100030000()
{
  unint64_t result = qword_10006D388;
  if (!qword_10006D388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D388);
  }
  return result;
}

unint64_t sub_10003006C()
{
  unint64_t result = qword_10006DBD0;
  if (!qword_10006DBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBD0);
  }
  return result;
}

uint64_t sub_1000300C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004AF90();
  *a1 = v3;
  return result;
}

uint64_t sub_100030104()
{
  return sub_10004AFA0();
}

unint64_t sub_10003013C()
{
  unint64_t result = qword_10006D620;
  if (!qword_10006D620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D620);
  }
  return result;
}

uint64_t sub_1000301AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004AF90();
  *a1 = v3;
  return result;
}

uint64_t sub_1000301EC()
{
  return sub_10004AFA0();
}

unint64_t sub_10003022C()
{
  unint64_t result = qword_10006D480;
  if (!qword_10006D480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D480);
  }
  return result;
}

unint64_t sub_100030284()
{
  unint64_t result = qword_10006D4B0;
  if (!qword_10006D4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4B0);
  }
  return result;
}

unint64_t sub_1000302DC()
{
  unint64_t result = qword_10006D4B8;
  if (!qword_10006D4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4B8);
  }
  return result;
}

uint64_t sub_100030330(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100030350, 0, 0);
}

uint64_t sub_100030350()
{
  uint64_t v1 = *(BOOL **)(v0 + 16);
  *uint64_t v1 = CalAlertInviteeDeclines() != 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000303C0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000303E4, 0, 0);
}

uint64_t sub_1000303E4()
{
  CalSetAlertInviteeDeclines();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100030448()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_100030718@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_100030B20()
{
  uint64_t v0 = qword_10006D4A0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100030B5C()
{
  unint64_t result = qword_10006D4C0;
  if (!qword_10006D4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4C0);
  }
  return result;
}

unint64_t sub_100030BB4()
{
  unint64_t result = qword_10006D4C8;
  if (!qword_10006D4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4C8);
  }
  return result;
}

unint64_t sub_100030C0C()
{
  unint64_t result = qword_10006D4D0;
  if (!qword_10006D4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4D0);
  }
  return result;
}

unint64_t sub_100030C64()
{
  unint64_t result = qword_10006D4D8;
  if (!qword_10006D4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4D8);
  }
  return result;
}

unint64_t sub_100030CBC()
{
  unint64_t result = qword_10006D4E0;
  if (!qword_10006D4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4E0);
  }
  return result;
}

unint64_t sub_100030D14()
{
  unint64_t result = qword_10006D4E8;
  if (!qword_10006D4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4E8);
  }
  return result;
}

unint64_t sub_100030D6C()
{
  unint64_t result = qword_10006D4F0;
  if (!qword_10006D4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4F0);
  }
  return result;
}

unint64_t sub_100030DC4()
{
  unint64_t result = qword_10006D4F8;
  if (!qword_10006D4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D4F8);
  }
  return result;
}

void sub_100030E18(void *a1@<X8>)
{
  *a1 = 0xD000000000000023;
  a1[1] = 0x800000010005B550;
}

uint64_t sub_100030E3C()
{
  return sub_100008248(&qword_10006D500, &qword_10006D508);
}

uint64_t sub_100030E78(uint64_t a1)
{
  unint64_t v2 = sub_100030284();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100030EC8()
{
  unint64_t result = qword_10006D510;
  if (!qword_10006D510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D510);
  }
  return result;
}

uint64_t sub_100030F20(uint64_t a1)
{
  unint64_t v2 = sub_100030DC4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100030F70()
{
  return sub_100008248(&qword_10006D518, &qword_10006D520);
}

uint64_t sub_100030FAC()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006E048);
  sub_100008180(v6, (uint64_t)qword_10006E048);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_1000311AC()
{
  uint64_t result = swift_getKeyPath();
  qword_10006E060 = result;
  return result;
}

uint64_t sub_1000311D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_100031270, v5, v4);
}

uint64_t sub_100031270()
{
  sub_10004AF90();
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 24) = v1;
  *(void *)(v0 + 80) = v1;
  sub_10004AF90();
  *(unsigned char *)(v0 + 113) = *(unsigned char *)(v0 + 112);
  if (qword_10006C548 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006E060;
  *(void *)(v0 + 88) = qword_10006E060;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_100008248(&qword_10006D5C0, &qword_10006D5C8);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000313C8()
{
  if (qword_10006C548 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100031428()
{
  unint64_t result = qword_10006D528;
  if (!qword_10006D528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D528);
  }
  return result;
}

unint64_t sub_100031480()
{
  unint64_t result = qword_10006D530;
  if (!qword_10006D530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D530);
  }
  return result;
}

uint64_t sub_1000314D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000314F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100031540@<X0>(uint64_t a1@<X8>)
{
  if (qword_10006C540 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10004B2F0();
  uint64_t v3 = sub_100008180(v2, (uint64_t)qword_10006E048);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000315E8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_1000311D4(a1, v5, v4);
}

unsigned char *sub_100031694@<X0>(void *a1@<X8>)
{
  unint64_t result = sub_100032638();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000316BC(uint64_t a1)
{
  unint64_t v2 = sub_10002FE4C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000316FC()
{
  unint64_t result = qword_10006D540;
  if (!qword_10006D540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D540);
  }
  return result;
}

unint64_t sub_100031754()
{
  unint64_t result = qword_10006D548[0];
  if (!qword_10006D548[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D548);
  }
  return result;
}

uint64_t sub_1000317A8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006D5A8 + dword_10006D5A8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_10003184C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000302DC();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100031900()
{
  unint64_t result = qword_10006D560;
  if (!qword_10006D560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D560);
  }
  return result;
}

unint64_t sub_100031958()
{
  unint64_t result = qword_10006D568[0];
  if (!qword_10006D568[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D568);
  }
  return result;
}

uint64_t sub_1000319AC(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000302DC();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100031A60(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000302DC();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100031B14()
{
  unint64_t result = qword_10006D580;
  if (!qword_10006D580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D580);
  }
  return result;
}

unint64_t sub_100031B6C()
{
  unint64_t result = qword_10006D588;
  if (!qword_10006D588)
  {
    sub_100005398(qword_10006D590);
    sub_100030D6C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D588);
  }
  return result;
}

uint64_t sub_100031BE0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100030C64();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_showInviteeDeclines()
{
  return &type metadata for UpdateIntent_showInviteeDeclines;
}

ValueMetadata *type metadata accessor for SettingsShowInviteeDeclinesEntityQuery()
{
  return &type metadata for SettingsShowInviteeDeclinesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsShowInviteeDeclinesEntity()
{
  return &type metadata for SettingsShowInviteeDeclinesEntity;
}

uint64_t sub_100031CC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007DEC(&qword_10006C7E0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100007DEC(&qword_10006C7E8);
  v17._object = &protocol witness table for Text;
  sub_100031754();
  sub_100008248(&qword_10006C7F0, &qword_10006C7E8);
  sub_10004B4B0();
  sub_10004B430();
  uint64_t v9 = sub_100008248(&qword_10006C7F8, &qword_10006C7D8);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v10 = (objc_class *)[self mainBundle];
  v17._countAndFlagsBits = 0x800000010005B5B0;
  v26._countAndFlagsBits = 0xD000000000000015;
  v26._object = (void *)0x8000000100053B00;
  v27.value._countAndFlagsBits = 0;
  v27.value._object = 0;
  v11.super.Class isa = v10;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  uint64_t v12 = sub_10004B2C0(v26, v27, v11, v28, v17);
  uint64_t v14 = v13;

  uint64_t v24 = v12;
  uint64_t v25 = v14;
  uint64_t v22 = v1;
  uint64_t v23 = v9;
  swift_getOpaqueTypeConformance2();
  sub_10000828C();
  uint64_t v15 = v19;
  sub_10004B440();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v8, v15);
}

uint64_t sub_100032080()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v3._countAndFlagsBits = 0x8000000100055610;
  v4._object = (void *)0x8000000100053B00;
  v4._countAndFlagsBits = 0xD000000000000015;
  v5.value._countAndFlagsBits = 0;
  v5.value._object = 0;
  v1.super.Class isa = v0;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  sub_10004B2C0(v4, v5, v1, v6, v3);

  sub_10000828C();
  return sub_10004B470();
}

uint64_t sub_100032164@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100032398@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String_optional v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

unsigned char *sub_100032638()
{
  uint64_t v0 = sub_100007DEC((uint64_t *)&unk_10006C770);
  __chkstk_darwin(v0 - 8);
  uint64_t v46 = &v32[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v50 = sub_10004B230();
  uint64_t v52 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v49 = &v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v45 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v48 = &v32[-v6];
  uint64_t v7 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v7 - 8);
  uint64_t v47 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_10004B2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10004B330();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_10004B4E0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10004B2F0();
  uint64_t v40 = v15;
  uint64_t v51 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v44 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  uint64_t v43 = sub_100007DEC(&qword_10006D5D0);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v18 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104);
  unsigned int v33 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v34 = v9;
  v19(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  uint64_t v35 = v19;
  uint64_t v36 = v10 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v19(v12, v18, v9);
  uint64_t v20 = v47;
  sub_10004B300();
  uint64_t v21 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v51 + 56);
  v51 += 56;
  uint64_t v41 = v21;
  v21(v20, 0, 1, v15);
  uint64_t v54 = 0;
  uint64_t v22 = sub_10004AF60();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v39 = v24;
  uint64_t v42 = v23 + 56;
  v24(v48, 1, 1, v22);
  v24(v45, 1, 1, v22);
  unsigned int v37 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v25 = *(void (**)(void))(v52 + 104);
  v52 += 104;
  uint64_t v38 = (void (*)(unsigned char *, void, uint64_t))v25;
  v25(v49);
  sub_100030284();
  uint64_t v45 = (unsigned char *)sub_10004AFC0();
  uint64_t v43 = sub_100007DEC(&qword_10006C790);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v26 = v33;
  uint64_t v27 = v34;
  Swift::String v28 = v35;
  v35(v12, v33, v34);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v28(v12, v26, v27);
  uint64_t v29 = v47;
  sub_10004B300();
  v41(v29, 0, 1, v40);
  char v53 = 2;
  uint64_t v30 = sub_10004B520();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v46, 1, 1, v30);
  v39(v48, 1, 1, v22);
  v38(v49, v37, v50);
  sub_10004AFD0();
  return v45;
}

uint64_t sub_100032E00()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100032F40, 0, 0);
}

uint64_t sub_100032F40()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006D520);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006D5C0, &qword_10006D5C8);
  uint64_t v4 = sub_10004B2A0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_1000330F4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsShowInviteeDeclinesToggleControl()
{
  return &type metadata for SettingsShowInviteeDeclinesToggleControl;
}

uint64_t sub_100033110()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003312C(char a1)
{
  return *(void *)&aNoalert_4[8 * a1];
}

uint64_t sub_10003314C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006E068);
  sub_100008180(v10, (uint64_t)qword_10006E068);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_100033424()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v102 = &v77[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v84 = &v77[-v4];
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v98 = &v77[-v6];
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v83 = &v77[-v8];
  __chkstk_darwin(v7);
  uint64_t v87 = (uint64_t)&v77[-v9];
  uint64_t v10 = sub_100007DEC(&qword_10006C780);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  unint64_t v101 = &v77[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v99 = &v77[-v14];
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v96 = &v77[-v16];
  uint64_t v17 = __chkstk_darwin(v15);
  v91 = &v77[-v18];
  __chkstk_darwin(v17);
  uint64_t v88 = &v77[-v19];
  uint64_t v20 = sub_10004B2E0();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = &v77[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = sub_10004B330();
  __chkstk_darwin(v24 - 8);
  uint64_t v25 = sub_10004B4E0();
  __chkstk_darwin(v25 - 8);
  uint64_t v26 = sub_10004B2F0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v100 = &v77[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v97 = &v77[-v31];
  uint64_t v32 = __chkstk_darwin(v30);
  v94 = &v77[-v33];
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v90 = (uint64_t)&v77[-v35];
  __chkstk_darwin(v34);
  unsigned int v37 = &v77[-v36];
  sub_100007DEC(&qword_10006D7A8);
  uint64_t v119 = sub_100007DEC(&qword_10006D7B0);
  unint64_t v38 = (*(unsigned __int8 *)(*(void *)(v119 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v119 - 8) + 80);
  unint64_t v116 = *(void *)(*(void *)(v119 - 8) + 72);
  uint64_t v39 = v26;
  uint64_t v40 = swift_allocObject();
  long long v82 = xmmword_10004D1A0;
  *(_OWORD *)(v40 + 16) = xmmword_10004D1A0;
  uint64_t v85 = v40;
  uint64_t v41 = v20;
  unint64_t v115 = v40 + v38;
  *(unsigned char *)(v40 + v38) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v42 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v44 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v21 + 104);
  uint64_t v43 = v21 + 104;
  uint64_t v95 = v44;
  v44(v23, enum case for LocalizedStringResource.BundleDescription.main(_:), v20);
  uint64_t v81 = (uint64_t)v37;
  sub_10004B300();
  uint64_t v45 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
  uint64_t v117 = v39;
  uint64_t v113 = v45;
  uint64_t v114 = v27 + 56;
  v45(v88, 1, 1, v39);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_10004B160();
  uint64_t v47 = sub_100008180(v46, (uint64_t)qword_10006E0F0);
  uint64_t v48 = *(void *)(v46 - 8);
  uint64_t v106 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  uint64_t v111 = v48 + 16;
  uint64_t v112 = v47;
  uint64_t v49 = v87;
  uint64_t v104 = v46;
  v106(v87, v47, v46);
  uint64_t v50 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v48 + 56);
  uint64_t v109 = v48 + 56;
  uint64_t v110 = v50;
  v50((unsigned char *)v49, 0, 1, v46);
  uint64_t v108 = sub_100007DEC(&qword_10006CDD8);
  uint64_t v51 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v118 = *(void *)(v27 + 72);
  uint64_t v89 = 2 * v118;
  uint64_t v105 = (v51 + 32) & ~v51;
  uint64_t v93 = v105 + 2 * v118;
  uint64_t v107 = v51 | 7;
  uint64_t v52 = swift_allocObject();
  long long v92 = xmmword_10004D1B0;
  uint64_t v80 = v52;
  *(_OWORD *)(v52 + 16) = xmmword_10004D1B0;
  sub_10004B4D0();
  sub_10004B320();
  char v53 = v95;
  v95(v23, v42, v41);
  sub_10004B300();
  unint64_t v54 = v115;
  unint64_t v79 = v115 + *(int *)(v119 + 48);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v86 = v41;
  uint64_t v55 = v53;
  v53(v23, v42, v41);
  sub_10004B300();
  sub_10004B190();
  uint64_t v88 = (unsigned char *)(v54 + v116);
  *uint64_t v88 = 1;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v56 = v42;
  v55(v23, v42, v41);
  sub_10004B300();
  v113(v91, 1, 1, v117);
  uint64_t v57 = v83;
  uint64_t v58 = v104;
  v106((uint64_t)v83, v112, v104);
  v110(v57, 0, 1, v58);
  *(_OWORD *)(swift_allocObject() + 16) = v92;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v59 = v56;
  uint64_t v60 = v56;
  uint64_t v61 = v86;
  v55(v23, v59, v86);
  uint64_t v103 = v43;
  sub_10004B300();
  v88 += *(int *)(v119 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v55(v23, v60, v61);
  sub_10004B300();
  sub_10004B190();
  uint64_t v87 = 2 * v116;
  uint64_t v83 = (unsigned char *)(v115 + 2 * v116);
  *uint64_t v83 = 2;
  sub_10004B4D0();
  sub_10004B320();
  v55(v23, v60, v61);
  sub_10004B300();
  v113(v96, 1, 1, v117);
  uint64_t v62 = v98;
  uint64_t v63 = v104;
  v106((uint64_t)v98, v112, v104);
  v110(v62, 0, 1, v63);
  v91 = (unsigned char *)(4 * v118);
  uint64_t v90 = 5 * v118;
  uint64_t v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = v82;
  sub_10004B4D0();
  sub_10004B320();
  unsigned int v78 = v60;
  uint64_t v64 = v86;
  uint64_t v65 = v95;
  v95(v23, v60, v86);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v66 = v64;
  uint64_t v67 = v65;
  v65(v23, v60, v64);
  sub_10004B300();
  uint64_t v68 = v89;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v69 = v78;
  v65(v23, v78, v66);
  sub_10004B300();
  uint64_t v88 = (unsigned char *)(v68 + v118);
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v66);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v66);
  sub_10004B300();
  sub_10004B190();
  uint64_t v98 = (unsigned char *)(v115 + v87 + v116);
  *uint64_t v98 = 3;
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v66);
  sub_10004B300();
  v113(v99, 1, 1, v117);
  uint64_t v70 = v84;
  uint64_t v71 = v104;
  v106((uint64_t)v84, v112, v104);
  v110(v70, 0, 1, v71);
  *(_OWORD *)(swift_allocObject() + 16) = v92;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v72 = v69;
  v67(v23, v69, v66);
  sub_10004B300();
  v98 += *(int *)(v119 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v69, v66);
  sub_10004B300();
  sub_10004B190();
  unint64_t v116 = v115 + 4 * v116;
  *(unsigned char *)unint64_t v116 = 4;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v73 = v66;
  v67(v23, v69, v66);
  sub_10004B300();
  v113(v101, 1, 1, v117);
  uint64_t v74 = v102;
  uint64_t v75 = v104;
  v106((uint64_t)v102, v112, v104);
  v110(v74, 0, 1, v75);
  uint64_t v117 = swift_allocObject();
  *(_OWORD *)(v117 + 16) = xmmword_10004E240;
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v72, v73);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v72, v73);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v72, v73);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v72, v73);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v72, v73);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v67(v23, v72, v73);
  sub_10004B300();
  sub_10004B190();
  unint64_t result = sub_1000437AC(v85);
  qword_10006E080 = result;
  return result;
}

uint64_t sub_100034C3C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C558 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006E080;
  if (*(void *)(qword_10006E080 + 16) && (unint64_t v12 = sub_100049094(a1), (v13 & 1) != 0))
  {
    unint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_100034F34(char *a1, char *a2)
{
  return sub_100043824(*a1, *a2);
}

unint64_t sub_100034F44()
{
  unint64_t result = qword_10006D5F0;
  if (!qword_10006D5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D5F0);
  }
  return result;
}

Swift::Int sub_100034F98()
{
  return sub_100043F38();
}

uint64_t sub_100034FA0()
{
  return sub_100044010();
}

Swift::Int sub_100034FA8()
{
  return sub_10004451C();
}

uint64_t sub_100034FB0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100038448(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100034FE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003312C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100035010()
{
  unint64_t result = qword_10006D5F8;
  if (!qword_10006D5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D5F8);
  }
  return result;
}

unint64_t sub_100035068()
{
  unint64_t result = qword_10006D600;
  if (!qword_10006D600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D600);
  }
  return result;
}

unint64_t sub_1000350C0()
{
  unint64_t result = qword_10006D608;
  if (!qword_10006D608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D608);
  }
  return result;
}

unint64_t sub_100035118()
{
  unint64_t result = qword_10006D610;
  if (!qword_10006D610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D610);
  }
  return result;
}

unint64_t sub_100035170()
{
  unint64_t result = qword_10006D618;
  if (!qword_10006D618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D618);
  }
  return result;
}

unint64_t sub_1000351CC()
{
  unint64_t result = qword_10006D628;
  if (!qword_10006D628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D628);
  }
  return result;
}

uint64_t sub_100035220@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C550, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006E068, a1);
}

uint64_t sub_100035258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036B0C(a1, a2, a3, (void (*)(void))sub_100035284);
}

unint64_t sub_100035284()
{
  unint64_t result = qword_10006D630;
  if (!qword_10006D630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D630);
  }
  return result;
}

uint64_t sub_1000352D8(uint64_t a1)
{
  unint64_t v2 = sub_100035284();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100035328()
{
  unint64_t result = qword_10006D638;
  if (!qword_10006D638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D638);
  }
  return result;
}

unint64_t sub_100035380()
{
  unint64_t result = qword_10006D640;
  if (!qword_10006D640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D640);
  }
  return result;
}

unint64_t sub_1000353D8()
{
  unint64_t result = qword_10006D648;
  if (!qword_10006D648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D648);
  }
  return result;
}

uint64_t sub_10003542C()
{
  if (qword_10006C558 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000354A4(uint64_t a1)
{
  unint64_t v2 = sub_1000351CC();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000354F0()
{
  return sub_100008248(&qword_10006D650, &qword_10006D658);
}

void sub_10003552C(void *a1@<X8>)
{
  *a1 = &off_100069760;
}

unint64_t sub_100035540()
{
  unint64_t result = qword_10006D660;
  if (!qword_10006D660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D660);
  }
  return result;
}

unint64_t sub_100035598()
{
  unint64_t result = qword_10006D668;
  if (!qword_10006D668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D668);
  }
  return result;
}

uint64_t sub_1000355EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100035610, 0, 0);
}

uint64_t sub_100035610()
{
  sub_10004AE40();
  id v1 = [*(id *)(v0 + 16) eventStore];
  swift_unknownObjectRelease();
  if (v1)
  {
    id v2 = [self defaultBirthdayAlarmOffsetWithEventStore:v1];
    id v3 = [v2 integerValue];
    if (v3 == (id)sub_10004B2B0())
    {
      char v4 = 0;
    }
    else
    {
      [v2 doubleValue];
      char v4 = sub_1000383A8(v5);
    }
  }
  else
  {
    char v4 = 0;
  }
  **(unsigned char **)(v0 + 24) = v4;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100035728(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 24) = *(void *)(a1 + 8);
  *(unsigned char *)(v2 + 32) = *a2;
  return _swift_task_switch(sub_100035754, 0, 0);
}

uint64_t sub_100035754()
{
  sub_10004AE40();
  id v1 = [*(id *)(v0 + 16) eventStore];
  swift_unknownObjectRelease();
  if (v1)
  {
    switch(*(unsigned char *)(v0 + 32))
    {
      case 1:
      case 2:
      case 3:
      case 4:
        char v2 = sub_10004B5D0();
        swift_bridgeObjectRelease();
        if (v2) {
          goto LABEL_5;
        }
        id v3 = self;
        v4.super.super.Class isa = sub_10004B560().super.super.isa;
        break;
      default:
        swift_bridgeObjectRelease();
LABEL_5:
        id v3 = self;
        sub_10004B2B0();
        v4.super.super.Class isa = sub_10004B570().super.super.isa;
        break;
    }
    Class isa = v4.super.super.isa;
    [v3 setDefaultAlarmOffset:v4.super.super.isa forAlarmType:2 eventStore:v1];
  }
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100035940()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  char v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_100035C10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_10003603C()
{
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  sub_10004AEA0();
  uint64_t result = sub_10004AE60();
  qword_10006E088 = result;
  return result;
}

uint64_t sub_1000360A4()
{
  uint64_t v0 = qword_10006D5E0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000360E0()
{
  unint64_t result = qword_10006D670;
  if (!qword_10006D670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D670);
  }
  return result;
}

unint64_t sub_100036138()
{
  unint64_t result = qword_10006D678;
  if (!qword_10006D678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D678);
  }
  return result;
}

unint64_t sub_100036190()
{
  unint64_t result = qword_10006D680;
  if (!qword_10006D680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D680);
  }
  return result;
}

unint64_t sub_1000361E8()
{
  unint64_t result = qword_10006D688;
  if (!qword_10006D688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D688);
  }
  return result;
}

uint64_t sub_10003623C@<X0>(void *a1@<X8>)
{
  if (qword_10006C560 != -1) {
    swift_once();
  }
  *a1 = qword_10006E088;

  return swift_retain();
}

unint64_t sub_1000362AC()
{
  unint64_t result = qword_10006D690;
  if (!qword_10006D690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D690);
  }
  return result;
}

unint64_t sub_100036304()
{
  unint64_t result = qword_10006D698;
  if (!qword_10006D698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D698);
  }
  return result;
}

unint64_t sub_10003635C()
{
  unint64_t result = qword_10006D6A0;
  if (!qword_10006D6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D6A0);
  }
  return result;
}

unint64_t sub_1000363B4()
{
  unint64_t result = qword_10006D6A8;
  if (!qword_10006D6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D6A8);
  }
  return result;
}

void sub_100036408(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000010005B840;
}

uint64_t sub_10003642C()
{
  return sub_100008248(&qword_10006D6B0, &qword_10006D6B8);
}

uint64_t sub_100036468(uint64_t a1)
{
  unint64_t v2 = sub_100035540();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000364B8()
{
  unint64_t result = qword_10006D6C0;
  if (!qword_10006D6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D6C0);
  }
  return result;
}

uint64_t sub_100036510(uint64_t a1)
{
  unint64_t v2 = sub_1000363B4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100036560()
{
  return sub_100008248(&qword_10006D6D0, &qword_10006D6D8);
}

uint64_t sub_10003659C()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006E090);
  sub_100008180(v6, (uint64_t)qword_10006E090);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_10003679C()
{
  uint64_t result = swift_getKeyPath();
  qword_10006E0A8 = result;
  return result;
}

uint64_t sub_1000367C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_10004B550();
  v3[9] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[10] = v5;
  v3[11] = v4;
  return _swift_task_switch(sub_100036860, v5, v4);
}

uint64_t sub_100036860()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[4] = v1;
  uint64_t v2 = v0[3];
  v0[12] = v1;
  v0[13] = v2;
  v0[5] = v2;
  sub_10004AF90();
  if (qword_10006C570 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10006E0A8;
  v0[14] = qword_10006E0A8;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[15] = v4;
  uint64_t v5 = sub_100008248(&qword_10006D778, &qword_10006D780);
  *uint64_t v4 = v0;
  v4[1] = sub_100026180;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 17, v3, &type metadata for SettingsBirthdaysDefaultAlertTimeType, v5);
}

uint64_t sub_1000369B8()
{
  if (qword_10006C570 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100036A18()
{
  unint64_t result = qword_10006D6E0;
  if (!qword_10006D6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D6E0);
  }
  return result;
}

unint64_t sub_100036A70()
{
  unint64_t result = qword_10006D6E8;
  if (!qword_10006D6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D6E8);
  }
  return result;
}

uint64_t sub_100036AC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100036AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036B0C(a1, a2, a3, (void (*)(void))sub_10002FEA0);
}

uint64_t sub_100036B0C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100036B54@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C568, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006E090, a1);
}

uint64_t sub_100036B8C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_1000367C4(a1, v5, v4);
}

uint64_t sub_100036C38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100037BDC();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_100036C64(uint64_t a1)
{
  unint64_t v2 = sub_10002FEA0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100036CA4()
{
  unint64_t result = qword_10006D6F8;
  if (!qword_10006D6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D6F8);
  }
  return result;
}

unint64_t sub_100036CFC()
{
  unint64_t result = qword_10006D700[0];
  if (!qword_10006D700[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D700);
  }
  return result;
}

uint64_t sub_100036D50(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100036D74, 0, 0);
}

uint64_t sub_100036D74()
{
  uint64_t v1 = (uint64_t *)v0[3];
  sub_10004AE40();
  *uint64_t v1 = sub_100038494(v0[2]);
  v1[1] = v2;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100036DE8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100035598();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100036E9C()
{
  unint64_t result = qword_10006D718;
  if (!qword_10006D718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D718);
  }
  return result;
}

unint64_t sub_100036EF4()
{
  unint64_t result = qword_10006D720[0];
  if (!qword_10006D720[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D720);
  }
  return result;
}

uint64_t sub_100036F48(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100035598();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100036FFC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100035598();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000370B0()
{
  unint64_t result = qword_10006D738;
  if (!qword_10006D738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D738);
  }
  return result;
}

unint64_t sub_100037108()
{
  unint64_t result = qword_10006D740;
  if (!qword_10006D740)
  {
    sub_100005398(qword_10006D748);
    sub_10003635C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D740);
  }
  return result;
}

uint64_t sub_10003717C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000361E8();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t destroy for UpdateIntent_birthdaysDefaultAlertTimeType()
{
  swift_release();
  swift_release();

  return swift_release();
}

void *_s23CalendarWidgetExtension42UpdateIntent_birthdaysDefaultAlertTimeTypeVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for UpdateIntent_birthdaysDefaultAlertTimeType(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for UpdateIntent_birthdaysDefaultAlertTimeType(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UpdateIntent_birthdaysDefaultAlertTimeType(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateIntent_birthdaysDefaultAlertTimeType(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UpdateIntent_birthdaysDefaultAlertTimeType(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UpdateIntent_birthdaysDefaultAlertTimeType()
{
  return &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType;
}

ValueMetadata *type metadata accessor for SettingsBirthdaysDefaultAlertTimesEntityQuery()
{
  return &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsBirthdaysDefaultAlertTimesEntity()
{
  return &type metadata for SettingsBirthdaysDefaultAlertTimesEntity;
}

unsigned char *storeEnumTagSinglePayload for SettingsBirthdaysDefaultAlertTimeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x100037528);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsBirthdaysDefaultAlertTimeType()
{
  return &type metadata for SettingsBirthdaysDefaultAlertTimeType;
}

uint64_t sub_100037560@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v1 = sub_10004B490();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100007DEC(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (objc_class *)[self mainBundle];
  v11._countAndFlagsBits = 0xD000000000000023;
  v9._countAndFlagsBits = 0x800000010005C700;
  v11._object = (void *)0x800000010005C6D0;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v7.super.Class isa = v6;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004B2C0(v11, v12, v7, v13, v9);

  swift_getKeyPath();
  sub_10004B480();
  sub_100035284();
  sub_100038808();
  sub_100036CFC();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100037848@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100037A7C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_100034C3C(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_100037B14(char *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_100034C3C(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_100037BDC()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v40 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v41 = sub_100007DEC(&qword_10006D788);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  uint64_t v19 = v40;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v21 = sub_10004AF60();
  long long v49 = 0uLL;
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  unsigned int v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_100035540();
  uint64_t v41 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006D790);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v25 = v31;
  uint64_t v26 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v26(v10, v24, v25);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  LOBYTE(v49) = 5;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_100035284();
  sub_10004AFB0();
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v51 = 0;
  sub_10004AEA0();
  sub_10004AE60();
  return v41;
}

uint64_t sub_1000383A8(double a1)
{
  if ((double)sub_10004B2B0() == a1) {
    return 0;
  }
  if (a1 == 32400.0) {
    return 1;
  }
  if (a1 == -54000.0) {
    return 2;
  }
  if (a1 == -140400.0) {
    return 3;
  }
  return 4 * (a1 == -572400.0);
}

uint64_t sub_100038448(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000696C8;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_100038494(uint64_t a1)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_100007DEC(&qword_10006D6D8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006D778, &qword_10006D780);
  sub_100035284();
  uint64_t v9 = sub_10004B290();
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  swift_retain();
  sub_10004AEA0();
  sub_10004AE60();
  *(void *)&v11[0] = a1;
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  sub_10004AE50();
  swift_release();
  swift_release_n();
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_1000387D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsBirthdayDefaultAlertTimesPickerControl()
{
  return &type metadata for SettingsBirthdayDefaultAlertTimesPickerControl;
}

uint64_t sub_1000387EC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100038808()
{
  unint64_t result = qword_10006D7B8;
  if (!qword_10006D7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7B8);
  }
  return result;
}

uint64_t sub_10003885C(char a1)
{
  return *(void *)&aSystemsesunday[8 * a1];
}

uint64_t sub_10003887C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006E0B0);
  sub_100008180(v10, (uint64_t)qword_10006E0B0);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_100038B5C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v118 = (char *)v93 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v93 - v3;
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v107 = (char *)v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v93 - v8;
  uint64_t v111 = sub_10004B2E0();
  uint64_t v10 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  uint64_t v12 = (char *)v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10004B330();
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v93 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10004B4E0();
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10004B2F0();
  uint64_t v94 = *(void *)(v19 - 8);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v104 = (char *)v93 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v103 = (char *)v93 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  unint64_t v101 = (char *)v93 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v100 = (char *)v93 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v99 = (char *)v93 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v98 = (char *)v93 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v96 = (char *)v93 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v117 = (char *)v93 - v35;
  __chkstk_darwin(v34);
  unsigned int v37 = (char *)v93 - v36;
  sub_100007DEC(&qword_10006D978);
  uint64_t v123 = sub_100007DEC(&qword_10006D980);
  unint64_t v38 = (*(unsigned __int8 *)(*(void *)(v123 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v123 - 8) + 80);
  uint64_t v122 = *(void *)(*(void *)(v123 - 8) + 72);
  uint64_t v39 = v111;
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_100050870;
  uint64_t v102 = v40;
  unint64_t v120 = v40 + v38;
  *(unsigned char *)(v40 + v38) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  unsigned int v126 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v125 = v10 + 104;
  uint64_t v121 = v41;
  ((void (*)(char *))v41)(v12);
  uint64_t v42 = v94;
  uint64_t v95 = v37;
  sub_10004B300();
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
  uint64_t v97 = (uint64_t)v9;
  uint64_t v124 = v19;
  uint64_t v115 = v42 + 56;
  uint64_t v119 = v43;
  v43(v9, 1, 1, v19);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_10004B160();
  uint64_t v45 = sub_100008180(v44, (uint64_t)qword_10006E0F0);
  uint64_t v116 = v44;
  uint64_t v46 = *(void *)(v44 - 8);
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
  uint64_t v108 = v45;
  uint64_t v109 = v46 + 16;
  uint64_t v113 = v47;
  v47(v4, v45, v44);
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
  uint64_t v112 = v46 + 56;
  uint64_t v114 = v48;
  v48(v4, 0, 1, v44);
  sub_100007DEC(&qword_10006CDD8);
  uint64_t v94 = swift_allocObject();
  *(_OWORD *)(v94 + 16) = xmmword_10004D1B0;
  sub_10004B4D0();
  sub_10004B320();
  v93[2] = v4;
  uint64_t v49 = v126;
  long long v50 = v18;
  uint64_t v51 = v121;
  ((void (*)(char *))v121)(v12);
  sub_10004B300();
  unint64_t v52 = v120;
  v93[1] = v120 + *(int *)(v123 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v51(v12, v49, v39);
  char v53 = v12;
  sub_10004B300();
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v54 = v123;
  uint64_t v55 = (unsigned char *)(v52 + v122);
  unsigned char *v55 = 1;
  uint64_t v97 = (uint64_t)&v55[*(int *)(v54 + 48)];
  uint64_t v105 = v50;
  sub_10004B4D0();
  uint64_t v110 = v15;
  sub_10004B320();
  uint64_t v106 = v53;
  v51(v53, v126, v39);
  sub_10004B300();
  uint64_t v56 = v107;
  v119(v107, 1, 1, v124);
  uint64_t v57 = v118;
  uint64_t v58 = v108;
  uint64_t v59 = v116;
  v113(v118, v108, v116);
  v114(v57, 0, 1, v59);
  sub_10004B2D0();
  uint64_t v60 = v56;
  sub_10004B180();
  uint64_t v61 = v122;
  uint64_t v97 = 2 * v122;
  uint64_t v62 = (unsigned char *)(v120 + 2 * v122);
  unsigned char *v62 = 2;
  uint64_t v96 = &v62[*(int *)(v54 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v63 = v111;
  v121(v106, v126, v111);
  sub_10004B300();
  v119(v60, 1, 1, v124);
  uint64_t v64 = v118;
  uint64_t v65 = v116;
  v113(v118, v58, v116);
  uint64_t v66 = v114;
  v114(v64, 0, 1, v65);
  sub_10004B2D0();
  sub_10004B180();
  unint64_t v67 = v120;
  uint64_t v68 = (unsigned char *)(v120 + v97 + v61);
  unsigned char *v68 = 3;
  uint64_t v69 = v123;
  uint64_t v98 = &v68[*(int *)(v123 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v70 = v106;
  uint64_t v71 = v121;
  v121(v106, v126, v63);
  sub_10004B300();
  uint64_t v72 = v124;
  v119(v60, 1, 1, v124);
  v66(v118, 1, 1, v116);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v73 = 4 * v122;
  *(unsigned char *)(v67 + v73) = 4;
  uint64_t v99 = (char *)(v67 + v73 + *(int *)(v69 + 48));
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v74 = v126;
  v71(v70, v126, v111);
  sub_10004B300();
  uint64_t v75 = v72;
  uint64_t v76 = v119;
  v119(v60, 1, 1, v75);
  uint64_t v77 = v118;
  uint64_t v78 = v108;
  uint64_t v79 = v116;
  v113(v118, v108, v116);
  v114(v77, 0, 1, v79);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v80 = (unsigned char *)(v120 + v73 + v122);
  *uint64_t v80 = 5;
  uint64_t v100 = &v80[*(int *)(v123 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v81 = v111;
  v121(v70, v74, v111);
  sub_10004B300();
  v76(v107, 1, 1, v124);
  long long v82 = v118;
  uint64_t v83 = v116;
  uint64_t v84 = v113;
  v113(v118, v78, v116);
  uint64_t v85 = v83;
  uint64_t v86 = v114;
  v114(v82, 0, 1, v85);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v87 = (unsigned char *)(v120 + 6 * v122);
  unsigned char *v87 = 6;
  unint64_t v101 = &v87[*(int *)(v123 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v88 = v106;
  v121(v106, v126, v81);
  sub_10004B300();
  uint64_t v89 = v107;
  v119(v107, 1, 1, v124);
  uint64_t v90 = v118;
  uint64_t v91 = v116;
  v84(v118, v108, v116);
  v86(v90, 0, 1, v91);
  sub_10004B2D0();
  sub_10004B180();
  *(unsigned char *)(v120 - v122 + 8 * v122) = 7;
  sub_10004B4D0();
  sub_10004B320();
  v121(v88, v126, v111);
  sub_10004B300();
  v119(v89, 1, 1, v124);
  v113(v90, v108, v91);
  v114(v90, 0, 1, v91);
  sub_10004B2D0();
  sub_10004B180();
  unint64_t result = sub_1000437D4(v102);
  qword_10006E0C8 = result;
  return result;
}

uint64_t sub_100039E10@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C580 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006E0C8;
  if (*(void *)(qword_10006E0C8 + 16) && (unint64_t v12 = sub_100049124(a1), (v13 & 1) != 0))
  {
    unint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

NSNumber sub_10003A108(unsigned __int8 a1)
{
  Swift::Int v1 = a1;
  sub_10003D69C();
  return sub_10004B590(v1);
}

uint64_t sub_10003A13C(char *a1, char *a2)
{
  return sub_100043D30(*a1, *a2);
}

unint64_t sub_10003A14C()
{
  unint64_t result = qword_10006D7D0;
  if (!qword_10006D7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7D0);
  }
  return result;
}

Swift::Int sub_10003A1A0()
{
  return sub_1000443C0();
}

uint64_t sub_10003A1AC()
{
  return sub_1000442B0();
}

Swift::Int sub_10003A1B4()
{
  return sub_1000443C0();
}

uint64_t sub_10003A1BC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10003D348(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10003A1EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003885C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10003A21C()
{
  unint64_t result = qword_10006D7D8;
  if (!qword_10006D7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7D8);
  }
  return result;
}

unint64_t sub_10003A274()
{
  unint64_t result = qword_10006D7E0;
  if (!qword_10006D7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7E0);
  }
  return result;
}

unint64_t sub_10003A2CC()
{
  unint64_t result = qword_10006D7E8;
  if (!qword_10006D7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7E8);
  }
  return result;
}

unint64_t sub_10003A324()
{
  unint64_t result = qword_10006D7F0;
  if (!qword_10006D7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7F0);
  }
  return result;
}

unint64_t sub_10003A37C()
{
  unint64_t result = qword_10006D7F8;
  if (!qword_10006D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7F8);
  }
  return result;
}

unint64_t sub_10003A3D8()
{
  unint64_t result = qword_10006D800;
  if (!qword_10006D800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D800);
  }
  return result;
}

uint64_t sub_10003A42C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C578, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006E0B0, a1);
}

uint64_t sub_10003A464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003BA48(a1, a2, a3, (void (*)(void))sub_10003A490);
}

unint64_t sub_10003A490()
{
  unint64_t result = qword_10006D808;
  if (!qword_10006D808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D808);
  }
  return result;
}

uint64_t sub_10003A4E4(uint64_t a1)
{
  unint64_t v2 = sub_10003A490();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10003A534()
{
  unint64_t result = qword_10006D810;
  if (!qword_10006D810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D810);
  }
  return result;
}

unint64_t sub_10003A58C()
{
  unint64_t result = qword_10006D818;
  if (!qword_10006D818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D818);
  }
  return result;
}

unint64_t sub_10003A5E4()
{
  unint64_t result = qword_10006D820;
  if (!qword_10006D820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D820);
  }
  return result;
}

uint64_t sub_10003A638()
{
  if (qword_10006C580 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_10003A6B0(uint64_t a1)
{
  unint64_t v2 = sub_10003A3D8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10003A6FC()
{
  return sub_100008248(&qword_10006D828, &qword_10006D830);
}

void sub_10003A738(void *a1@<X8>)
{
  *a1 = &off_1000696A0;
}

unint64_t sub_10003A74C()
{
  unint64_t result = qword_10006D838;
  if (!qword_10006D838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D838);
  }
  return result;
}

unint64_t sub_10003A7A4()
{
  unint64_t result = qword_10006D840;
  if (!qword_10006D840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D840);
  }
  return result;
}

uint64_t sub_10003A7F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10003A818, 0, 0);
}

id sub_10003A818()
{
  id result = [self sharedPreferences];
  if (result)
  {
    unint64_t v2 = result;
    uint64_t v3 = *(unsigned char **)(v0 + 16);
    id v4 = [result weekStart];

    *uint64_t v3 = sub_10003D128((uint64_t)v4);
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003A8D4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10003A8F8, 0, 0);
}

id sub_10003A8F8()
{
  v1.super.super.Class isa = sub_10003A108(*(unsigned char *)(v0 + 16)).super.super.isa;
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v3 = result;
    [result setWeekStart:v1.super.super.isa];

    id v4 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v4();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003A9A4()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_10003AC7C@<X0>(uint64_t a1@<X8>)
{
  v19[0] = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v6, 1, 1, v13);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v3, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v3, 0, 1, v15);
  return sub_10004B1A0();
}

uint64_t sub_10003B054()
{
  uint64_t v0 = qword_10006D7C0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10003B090()
{
  unint64_t result = qword_10006D848;
  if (!qword_10006D848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D848);
  }
  return result;
}

unint64_t sub_10003B0E8()
{
  unint64_t result = qword_10006D850;
  if (!qword_10006D850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D850);
  }
  return result;
}

unint64_t sub_10003B140()
{
  unint64_t result = qword_10006D858;
  if (!qword_10006D858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D858);
  }
  return result;
}

unint64_t sub_10003B198()
{
  unint64_t result = qword_10006D860;
  if (!qword_10006D860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D860);
  }
  return result;
}

unint64_t sub_10003B1F0()
{
  unint64_t result = qword_10006D868;
  if (!qword_10006D868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D868);
  }
  return result;
}

unint64_t sub_10003B248()
{
  unint64_t result = qword_10006D870;
  if (!qword_10006D870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D870);
  }
  return result;
}

unint64_t sub_10003B2A0()
{
  unint64_t result = qword_10006D878;
  if (!qword_10006D878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D878);
  }
  return result;
}

unint64_t sub_10003B2F8()
{
  unint64_t result = qword_10006D880;
  if (!qword_10006D880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D880);
  }
  return result;
}

void sub_10003B34C(void *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x800000010005C880;
}

uint64_t sub_10003B370()
{
  return sub_100008248(&qword_10006D888, &qword_10006D890);
}

uint64_t sub_10003B3AC(uint64_t a1)
{
  unint64_t v2 = sub_10003A74C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10003B3FC()
{
  unint64_t result = qword_10006D898;
  if (!qword_10006D898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D898);
  }
  return result;
}

uint64_t sub_10003B454(uint64_t a1)
{
  unint64_t v2 = sub_10003B2F8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10003B4A4()
{
  return sub_100008248(&qword_10006D8A0, &qword_10006D8A8);
}

uint64_t sub_10003B4E0()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006E0D0);
  sub_100008180(v6, (uint64_t)qword_10006E0D0);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_10003B6E0()
{
  uint64_t result = swift_getKeyPath();
  qword_10006E0E8 = result;
  return result;
}

uint64_t sub_10003B708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_10003B7A4, v5, v4);
}

uint64_t sub_10003B7A4()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  sub_10004AF90();
  if (qword_10006C590 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006E0E8;
  v0[11] = qword_10006E0E8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  uint64_t v4 = sub_100008248(&qword_10006D948, &qword_10006D950);
  *uint64_t v3 = v0;
  v3[1] = sub_1000059C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsStartWeekOnType, v4);
}

uint64_t sub_10003B8F4()
{
  if (qword_10006C590 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10003B954()
{
  unint64_t result = qword_10006D8B0;
  if (!qword_10006D8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D8B0);
  }
  return result;
}

unint64_t sub_10003B9AC()
{
  unint64_t result = qword_10006D8B8;
  if (!qword_10006D8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D8B8);
  }
  return result;
}

uint64_t sub_10003BA00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003BA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003BA48(a1, a2, a3, (void (*)(void))sub_10002FF48);
}

uint64_t sub_10003BA48(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003BA90@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C588, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006E0D0, a1);
}

uint64_t sub_10003BAC8(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000060CC;
  return sub_10003B708(a1, v5, v4);
}

uint64_t sub_10003BB74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003C9CC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10003BB9C(uint64_t a1)
{
  unint64_t v2 = sub_10002FF48();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10003BBDC()
{
  unint64_t result = qword_10006D8C8;
  if (!qword_10006D8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D8C8);
  }
  return result;
}

unint64_t sub_10003BC34()
{
  unint64_t result = qword_10006D8D0[0];
  if (!qword_10006D8D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D8D0);
  }
  return result;
}

uint64_t sub_10003BC88(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006D930 + dword_10006D930);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_10003BD2C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10003A7A4();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10003BDE0()
{
  unint64_t result = qword_10006D8E8;
  if (!qword_10006D8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D8E8);
  }
  return result;
}

unint64_t sub_10003BE38()
{
  unint64_t result = qword_10006D8F0[0];
  if (!qword_10006D8F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D8F0);
  }
  return result;
}

uint64_t sub_10003BE8C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10003A7A4();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10003BF40(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10003A7A4();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10003BFF4()
{
  unint64_t result = qword_10006D908;
  if (!qword_10006D908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D908);
  }
  return result;
}

unint64_t sub_10003C04C()
{
  unint64_t result = qword_10006D910;
  if (!qword_10006D910)
  {
    sub_100005398(qword_10006D918);
    sub_10003B2A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D910);
  }
  return result;
}

uint64_t sub_10003C0C0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10003B198();
  void *v5 = v2;
  v5[1] = sub_1000083B4;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_weekStartDay()
{
  return &type metadata for UpdateIntent_weekStartDay;
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnEntityQuery()
{
  return &type metadata for SettingsStartWeekOnEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnEntity()
{
  return &type metadata for SettingsStartWeekOnEntity;
}

uint64_t getEnumTagSinglePayload for SettingsStartWeekOnType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SettingsStartWeekOnType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10003C300);
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

ValueMetadata *type metadata accessor for SettingsStartWeekOnType()
{
  return &type metadata for SettingsStartWeekOnType;
}

uint64_t sub_10003C338()
{
  uint64_t v0 = sub_10004B490();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100007DEC(&qword_10006D310);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (objc_class *)[self mainBundle];
  v8._countAndFlagsBits = 0x800000010005C7B0;
  v10._countAndFlagsBits = 0x6557207472617453;
  v10._object = (void *)0xED00006E4F206B65;
  v11.value._countAndFlagsBits = 0;
  v11.value._object = 0;
  v6.super.Class isa = v5;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  sub_10004B2C0(v10, v11, v6, v12, v8);

  swift_getKeyPath();
  sub_10004B480();
  sub_10003A490();
  sub_10003D714();
  sub_10003BC34();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10003C630@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10003C86C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_100039E10(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_10003C904(char *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_100039E10(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_10003C9CC()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v41 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v40 = sub_100007DEC(&qword_10006D960);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  uint64_t v19 = v41;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v50 = 0;
  uint64_t v21 = sub_10004AF60();
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  unsigned int v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_10003A74C();
  uint64_t v40 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006D968);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v26 = v31;
  uint64_t v25 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v25(v10, v24, v26);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  char v49 = 8;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_10003A490();
  sub_10004AFB0();
  return v40;
}

uint64_t sub_10003D128(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    sub_10003D69C();
    id v2 = v1;
    Class isa = sub_10004B590(0).super.super.isa;
    char v4 = sub_10004B5A0();

    if (v4)
    {

      return 0;
    }
    else
    {
      id v5 = v2;
      Class v6 = sub_10004B590(1).super.super.isa;
      char v7 = sub_10004B5A0();

      if (v7)
      {

        return 1;
      }
      else
      {
        id v8 = v5;
        Class v9 = sub_10004B590(2).super.super.isa;
        char v10 = sub_10004B5A0();

        if (v10)
        {

          return 2;
        }
        else
        {
          id v11 = v8;
          Class v12 = sub_10004B590(3).super.super.isa;
          char v13 = sub_10004B5A0();

          if (v13)
          {

            return 3;
          }
          else
          {
            id v14 = v11;
            Class v15 = sub_10004B590(4).super.super.isa;
            char v16 = sub_10004B5A0();

            if (v16)
            {

              return 4;
            }
            else
            {
              id v17 = v14;
              Class v18 = sub_10004B590(5).super.super.isa;
              char v19 = sub_10004B5A0();

              if (v19)
              {

                return 5;
              }
              else
              {
                id v20 = v17;
                Class v21 = sub_10004B590(6).super.super.isa;
                char v22 = sub_10004B5A0();

                if (v22)
                {

                  return 6;
                }
                else
                {
                  id v23 = v20;
                  Class v24 = sub_10004B590(7).super.super.isa;
                  char v25 = sub_10004B5A0();

                  if (v25) {
                    return 7;
                  }
                  else {
                    return 0;
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

uint64_t sub_10003D348(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100069788;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

uint64_t sub_10003D394()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_10003D4D4, 0, 0);
}

uint64_t sub_10003D4D4()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006D8A8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006D948, &qword_10006D950);
  sub_10003A490();
  uint64_t v4 = sub_10004B290();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

unint64_t sub_10003D69C()
{
  unint64_t result = qword_10006D958;
  if (!qword_10006D958)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006D958);
  }
  return result;
}

uint64_t sub_10003D6DC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnPickerControl()
{
  return &type metadata for SettingsStartWeekOnPickerControl;
}

uint64_t sub_10003D6F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10003D714()
{
  unint64_t result = qword_10006D988;
  if (!qword_10006D988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D988);
  }
  return result;
}

uint64_t sub_10003D768()
{
  uint64_t v0 = sub_10004B160();
  sub_1000081B8(v0, qword_10006E0F0);
  sub_100008180(v0, (uint64_t)qword_10006E0F0);
  return sub_10004B150();
}

id sub_10003D7CC()
{
  id result = [objc_allocWithZone((Class)EKEventStore) initWithEKOptions:0x2000];
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D804()
{
  uint64_t v0 = sub_10004B400();
  sub_1000081B8(v0, qword_10006E108);
  sub_100008180(v0, (uint64_t)qword_10006E108);
  return sub_10004B3F0();
}

uint64_t sub_10003D888@<X0>(uint64_t a1@<X8>)
{
  uint64_t v55 = a1;
  uint64_t v61 = sub_10004B350();
  uint64_t v64 = *(void *)(v61 - 8);
  uint64_t v1 = __chkstk_darwin(v61);
  uint64_t v60 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v54 = (char *)&v45 - v3;
  uint64_t v59 = sub_10004B390();
  uint64_t v63 = *(void *)(v59 - 8);
  uint64_t v4 = __chkstk_darwin(v59);
  uint64_t v58 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v45 - v6;
  uint64_t v53 = sub_10004B3B0();
  uint64_t v62 = *(void *)(v53 - 8);
  uint64_t v8 = __chkstk_darwin(v53);
  uint64_t v57 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v11 = (char *)&v45 - v10;
  uint64_t v12 = sub_10004B370();
  uint64_t v46 = v12;
  uint64_t v48 = *(void *)(v12 - 8);
  uint64_t v13 = v48;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v56 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v17 = (char *)&v45 - v16;
  uint64_t v18 = sub_10004B3D0();
  uint64_t v50 = v18;
  uint64_t v51 = *(void *)(v18 - 8);
  uint64_t v19 = v51;
  uint64_t v20 = __chkstk_darwin(v18);
  char v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  Class v24 = (char *)&v45 - v23;
  char v49 = (char *)&v45 - v23;
  sub_10004B3C0();
  uint64_t v47 = v17;
  sub_10004B360();
  uint64_t v45 = v11;
  sub_10004B3A0();
  sub_10004B380();
  char v25 = v54;
  sub_10004B340();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  unint64_t v52 = v22;
  v26(v22, v24, v18);
  v65[0] = (uint64_t)v22;
  uint64_t v27 = (uint64_t)v56;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v56, v17, v12);
  v65[1] = v27;
  uint64_t v28 = v62;
  uint64_t v29 = (uint64_t)v57;
  uint64_t v30 = v53;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v57, v11, v53);
  v65[2] = v29;
  uint64_t v31 = v63;
  uint64_t v32 = (uint64_t)v58;
  uint64_t v33 = v59;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v58, v7, v59);
  v65[3] = v32;
  uint64_t v34 = v64;
  uint64_t v35 = (uint64_t)v60;
  uint64_t v36 = v61;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v60, v25, v61);
  v65[4] = v35;
  sub_10003DEA0(v65);
  unsigned int v37 = *(void (**)(char *, uint64_t))(v34 + 8);
  uint64_t v64 = v34 + 8;
  v37(v25, v36);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v63 = v31 + 8;
  v38(v7, v33);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v62 = v28 + 8;
  v39(v45, v30);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v41 = v46;
  v40(v47, v46);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v51 + 8);
  uint64_t v43 = v50;
  v42(v49, v50);
  v37(v60, v61);
  v38(v58, v59);
  v39(v57, v30);
  v40(v56, v41);
  return ((uint64_t (*)(char *, uint64_t))v42)(v52, v43);
}

uint64_t sub_10003DEA0(uint64_t *a1)
{
  uint64_t v2 = (int *)sub_100007DEC(&qword_10006D998);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *a1;
  uint64_t v6 = sub_10004B3D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v4, v5, v6);
  uint64_t v7 = &v4[v2[12]];
  uint64_t v8 = a1[1];
  uint64_t v9 = sub_10004B370();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = &v4[v2[16]];
  uint64_t v11 = a1[2];
  uint64_t v12 = sub_10004B3B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = &v4[v2[20]];
  uint64_t v14 = a1[3];
  uint64_t v15 = sub_10004B390();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = &v4[v2[24]];
  uint64_t v17 = a1[4];
  uint64_t v18 = sub_10004B350();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  return sub_10004B410();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10003E0D8()
{
  unint64_t result = qword_10006D990;
  if (!qword_10006D990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D990);
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetGroup()
{
  return &type metadata for WidgetGroup;
}

uint64_t sub_10003E13C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_10003E158(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();

  return v3;
}

uint64_t sub_10003E1A8()
{
  if (qword_10006C5A0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10004B400();
  sub_100008180(v0, (uint64_t)qword_10006E108);
  uint64_t v1 = sub_10004B3E0();
  os_log_type_t v2 = sub_10004B580();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Initializing", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = objc_allocWithZone((Class)EKEphemeralCacheEventStoreProvider);
  uint64_t v11 = sub_10003D7CC;
  uint64_t v12 = 0;
  *(void *)&long long v9 = _NSConcreteStackBlock;
  *((void *)&v9 + 1) = 1107296256;
  *(void *)&long long v10 = sub_10003E158;
  *((void *)&v10 + 1) = &unk_10006A848;
  uint64_t v5 = _Block_copy(&v9);
  id v6 = [v4 initWithCreationBlock:v5];
  _Block_release(v5);
  swift_release();
  sub_10004AEB0();
  sub_10004AEA0();
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = v6;
  sub_100007DEC(&qword_10006D9A0);
  sub_10004AE90();

  swift_release();
  swift_release();
  return sub_10003E410((uint64_t)&v9);
}

uint64_t sub_10003E3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003E3C4()
{
  return swift_release();
}

uint64_t sub_10003E3CC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003E404@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
  return swift_unknownObjectRetain();
}

uint64_t sub_10003E410(uint64_t a1)
{
  uint64_t v2 = sub_100007DEC(&qword_10006D9A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10003E474()
{
  unint64_t result = qword_10006D9B0;
  if (!qword_10006D9B0)
  {
    sub_100005398(&qword_10006D9B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9B0);
  }
  return result;
}

uint64_t sub_10003E4D0(char a1)
{
  return qword_100051B80[a1];
}

uint64_t sub_10003E4F0()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006E120);
  sub_100008180(v10, (uint64_t)qword_10006E120);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_10003E7C8()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v73 = (char *)v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v76 = (char *)v64 - v3;
  uint64_t v4 = sub_100007DEC(&qword_10006C780);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v72 = (char *)v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v75 = (char *)v64 - v7;
  uint64_t v8 = sub_10004B2E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10004B330();
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10004B4E0();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10004B2F0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v71 = (char *)v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v69 = (char *)v64 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v68 = (char *)v64 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  unint64_t v67 = (char *)v64 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  long long v82 = (char *)v64 - v27;
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)v64 - v28;
  sub_100007DEC(&qword_10006DB70);
  uint64_t v86 = sub_100007DEC(&qword_10006DB78);
  unint64_t v30 = (*(unsigned __int8 *)(*(void *)(v86 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v86 - 8) + 80);
  uint64_t v93 = *(void *)(*(void *)(v86 - 8) + 72);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_10004D1A0;
  uint64_t v70 = v31;
  unint64_t v84 = v31 + v30;
  *(unsigned char *)(v31 + v30) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  unsigned int v92 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v90 = v8;
  uint64_t v94 = v9 + 104;
  uint64_t v85 = v32;
  ((void (*)(char *))v32)(v11);
  uint64_t v66 = v29;
  uint64_t v81 = v14;
  uint64_t v33 = v11;
  sub_10004B300();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  uint64_t v87 = v16;
  uint64_t v91 = v17 + 56;
  uint64_t v83 = v34;
  v34(v75, 1, 1, v16);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_10004B160();
  uint64_t v36 = sub_100008180(v35, (uint64_t)qword_10006E0F0);
  uint64_t v77 = v35;
  uint64_t v37 = *(void *)(v35 - 8);
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  uint64_t v88 = v36;
  uint64_t v89 = v38;
  uint64_t v80 = v37 + 16;
  uint64_t v39 = v76;
  v38(v76, v36, v35);
  uint64_t v40 = *(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56);
  uint64_t v78 = v37 + 56;
  uint64_t v79 = v40;
  v40(v39, 0, 1, v35);
  sub_100007DEC(&qword_10006CDD8);
  uint64_t v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = xmmword_10004D1B0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v74 = v33;
  uint64_t v41 = v92;
  uint64_t v42 = v90;
  uint64_t v43 = v85;
  v85(v33, v92, v90);
  sub_10004B300();
  uint64_t v44 = v86;
  v64[1] = v84 + *(int *)(v86 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v43(v33, v41, v42);
  sub_10004B300();
  sub_10004B2D0();
  sub_10004B180();
  unint64_t v45 = v84;
  uint64_t v46 = (unsigned char *)(v84 + v93);
  unsigned char *v46 = 1;
  uint64_t v76 = &v46[*(int *)(v44 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  v43(v33, v41, v42);
  sub_10004B300();
  uint64_t v47 = v72;
  v83(v72, 1, 1, v87);
  uint64_t v48 = v73;
  uint64_t v49 = v77;
  v89(v73, v88, v77);
  v79(v48, 0, 1, v49);
  sub_10004B2D0();
  sub_10004B180();
  uint64_t v76 = (char *)(2 * v93);
  uint64_t v50 = (unsigned char *)(v45 + 2 * v93);
  *uint64_t v50 = 2;
  uint64_t v51 = v86;
  uint64_t v75 = &v50[*(int *)(v86 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  unint64_t v52 = v85;
  v85(v74, v92, v90);
  sub_10004B300();
  uint64_t v53 = v83;
  v83(v47, 1, 1, v87);
  uint64_t v54 = v77;
  v89(v48, v88, v77);
  v79(v48, 0, 1, v54);
  sub_10004B2D0();
  uint64_t v55 = v47;
  sub_10004B180();
  unint64_t v56 = v84;
  uint64_t v57 = &v76[v93 + v84];
  *uint64_t v57 = 3;
  uint64_t v76 = &v57[*(int *)(v51 + 48)];
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v58 = v74;
  v52(v74, v92, v90);
  uint64_t v59 = v58;
  sub_10004B300();
  uint64_t v60 = v87;
  v53(v47, 1, 1, v87);
  uint64_t v61 = v77;
  v89(v48, v88, v77);
  uint64_t v62 = v79;
  v79(v48, 0, 1, v61);
  sub_10004B2D0();
  sub_10004B180();
  *(unsigned char *)(v56 + 4 * v93) = 4;
  sub_10004B4D0();
  sub_10004B320();
  v85(v59, v92, v90);
  sub_10004B300();
  v83(v55, 1, 1, v60);
  v89(v48, v88, v61);
  v62(v48, 0, 1, v61);
  sub_10004B2D0();
  sub_10004B180();
  unint64_t result = sub_1000437FC(v70);
  qword_10006E138 = result;
  return result;
}

uint64_t sub_10003F524@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C5B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006E138;
  if (*(void *)(qword_10006E138 + 16) && (unint64_t v12 = sub_100049168(a1), (v13 & 1) != 0))
  {
    unint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_10003F81C(char *a1, char *a2)
{
  return sub_100043DB8(*a1, *a2);
}

unint64_t sub_10003F82C()
{
  unint64_t result = qword_10006D9D0;
  if (!qword_10006D9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9D0);
  }
  return result;
}

Swift::Int sub_10003F880()
{
  return sub_100043FA4();
}

uint64_t sub_10003F888()
{
  return sub_100044304();
}

Swift::Int sub_10003F890()
{
  return sub_100044358();
}

uint64_t sub_10003F898@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100042CF0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10003F8C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003E4D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10003F8F8()
{
  unint64_t result = qword_10006D9D8;
  if (!qword_10006D9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9D8);
  }
  return result;
}

unint64_t sub_10003F950()
{
  unint64_t result = qword_10006D9E0;
  if (!qword_10006D9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9E0);
  }
  return result;
}

unint64_t sub_10003F9A8()
{
  unint64_t result = qword_10006D9E8;
  if (!qword_10006D9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9E8);
  }
  return result;
}

unint64_t sub_10003FA00()
{
  unint64_t result = qword_10006D9F0;
  if (!qword_10006D9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9F0);
  }
  return result;
}

unint64_t sub_10003FA58()
{
  unint64_t result = qword_10006D9F8;
  if (!qword_10006D9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D9F8);
  }
  return result;
}

unint64_t sub_10003FAB4()
{
  unint64_t result = qword_10006DA00;
  if (!qword_10006DA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA00);
  }
  return result;
}

uint64_t sub_10003FB08@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C5A8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006E120, a1);
}

uint64_t sub_10003FB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000416BC(a1, a2, a3, (void (*)(void))sub_10003FB6C);
}

unint64_t sub_10003FB6C()
{
  unint64_t result = qword_10006DA08;
  if (!qword_10006DA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA08);
  }
  return result;
}

uint64_t sub_10003FBC0(uint64_t a1)
{
  unint64_t v2 = sub_10003FB6C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10003FC10()
{
  unint64_t result = qword_10006DA10;
  if (!qword_10006DA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA10);
  }
  return result;
}

unint64_t sub_10003FC68()
{
  unint64_t result = qword_10006DA18;
  if (!qword_10006DA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA18);
  }
  return result;
}

unint64_t sub_10003FCC0()
{
  unint64_t result = qword_10006DA20;
  if (!qword_10006DA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA20);
  }
  return result;
}

uint64_t sub_10003FD14()
{
  if (qword_10006C5B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_10003FD8C(uint64_t a1)
{
  unint64_t v2 = sub_10003FAB4();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10003FDD8()
{
  return sub_100008248(&qword_10006DA28, &qword_10006DA30);
}

void sub_10003FE14(void *a1@<X8>)
{
  *a1 = &off_100069900;
}

unint64_t sub_10003FE28()
{
  unint64_t result = qword_10006DA38;
  if (!qword_10006DA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA38);
  }
  return result;
}

unint64_t sub_10003FE80()
{
  unint64_t result = qword_10006DA40;
  if (!qword_10006DA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA40);
  }
  return result;
}

uint64_t sub_10003FED4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10003FEF4, 0, 0);
}

id sub_10003FEF4()
{
  id result = [self sharedPreferences];
  if (!result)
  {
    __break(1u);
    return result;
  }
  unint64_t v2 = result;
  id v3 = [result overlayCalendarID];

  if (v3)
  {
    uint64_t v4 = sub_10004B500();
    uint64_t v6 = v5;

    if (v4) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6 == 0xE000000000000000;
    }
    if (v7 || (sub_10004B5D0() & 1) != 0) {
      goto LABEL_11;
    }
    uint64_t v10 = sub_10004B500();
    if (v6)
    {
      if (v10 == v4 && v6 == v11)
      {
        swift_bridgeObjectRelease_n();
        char v8 = 1;
        goto LABEL_13;
      }
      char v13 = sub_10004B5D0();
      swift_bridgeObjectRelease();
      if (v13)
      {
        swift_bridgeObjectRelease();
        char v8 = 1;
        goto LABEL_13;
      }
      if (sub_10004B500() == v4 && v6 == v14)
      {
        char v8 = 2;
        swift_bridgeObjectRelease_n();
        goto LABEL_13;
      }
      char v15 = sub_10004B5D0();
      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_bridgeObjectRelease();
        char v8 = 2;
        goto LABEL_13;
      }
      if (sub_10004B500() == v4 && v6 == v16)
      {
        swift_bridgeObjectRelease_n();
        char v8 = 3;
        goto LABEL_13;
      }
      char v17 = sub_10004B5D0();
      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_bridgeObjectRelease();
        char v8 = 3;
        goto LABEL_13;
      }
      if (sub_10004B500() == v4 && v6 == v18)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v19 = sub_10004B5D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0) {
          goto LABEL_12;
        }
      }
      char v8 = 4;
      goto LABEL_13;
    }
  }
  else
  {
    sub_10004B500();
  }
  swift_bridgeObjectRelease();
  sub_10004B500();
  swift_bridgeObjectRelease();
  sub_10004B500();
  swift_bridgeObjectRelease();
  sub_10004B500();
LABEL_11:
  swift_bridgeObjectRelease();
LABEL_12:
  char v8 = 0;
LABEL_13:
  **(unsigned char **)(v0 + 16) = v8;
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return (id)v9();
}

uint64_t sub_100040210(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100040234, 0, 0);
}

uint64_t sub_100040234()
{
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
    case 2:
    case 3:
    case 4:
      sub_10004B500();
      break;
    default:
      break;
  }
  id v1 = [self sharedPreferences];
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x100040360);
  }
  uint64_t v2 = v1;
  NSString v3 = sub_10004B4F0();
  swift_bridgeObjectRelease();
  [v2 setOverlayCalendarID:v3];

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100040374()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_100040644@<X0>(uint64_t a1@<X8>)
{
  v19[0] = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v6, 1, 1, v13);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v3, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v3, 0, 1, v15);
  return sub_10004B1A0();
}

uint64_t sub_100040A14()
{
  uint64_t v0 = qword_10006D9C0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100040A50()
{
  unint64_t result = qword_10006DA48;
  if (!qword_10006DA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA48);
  }
  return result;
}

unint64_t sub_100040AA8()
{
  unint64_t result = qword_10006DA50;
  if (!qword_10006DA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA50);
  }
  return result;
}

unint64_t sub_100040B00()
{
  unint64_t result = qword_10006DA58;
  if (!qword_10006DA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA58);
  }
  return result;
}

unint64_t sub_100040B58()
{
  unint64_t result = qword_10006DA60;
  if (!qword_10006DA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA60);
  }
  return result;
}

unint64_t sub_100040BB0()
{
  unint64_t result = qword_10006DA68;
  if (!qword_10006DA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA68);
  }
  return result;
}

unint64_t sub_100040C08()
{
  unint64_t result = qword_10006DA70;
  if (!qword_10006DA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA70);
  }
  return result;
}

unint64_t sub_100040C60()
{
  unint64_t result = qword_10006DA78;
  if (!qword_10006DA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA78);
  }
  return result;
}

unint64_t sub_100040CB8()
{
  unint64_t result = qword_10006DA80;
  if (!qword_10006DA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA80);
  }
  return result;
}

void sub_100040D0C(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x800000010005D850;
}

uint64_t sub_100040D30()
{
  return sub_100008248(&qword_10006DA88, &qword_10006DA90);
}

uint64_t sub_100040D6C(uint64_t a1)
{
  unint64_t v2 = sub_10003FE28();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100040DBC()
{
  unint64_t result = qword_10006DA98;
  if (!qword_10006DA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DA98);
  }
  return result;
}

uint64_t sub_100040E14(uint64_t a1)
{
  unint64_t v2 = sub_100040CB8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100040E64()
{
  return sub_100008248(&qword_10006DAA0, &qword_10006DAA8);
}

uint64_t sub_100040EA0()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006E140);
  sub_100008180(v6, (uint64_t)qword_10006E140);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_1000410A0()
{
  uint64_t result = swift_getKeyPath();
  qword_10006E158 = result;
  return result;
}

uint64_t sub_1000410C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  sub_10004B550();
  v3[7] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[8] = v5;
  v3[9] = v4;
  return _swift_task_switch(sub_100041164, v5, v4);
}

uint64_t sub_100041164()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  sub_10004AF90();
  if (qword_10006C5C0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10006E158;
  v0[11] = qword_10006E158;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  uint64_t v4 = sub_100008248(&qword_10006DB48, &qword_10006DB50);
  *uint64_t v3 = v0;
  v3[1] = sub_1000412B4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsAlternateCalendarType, v4);
}

uint64_t sub_1000412B4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v5 = sub_100005B88;
  }
  else {
    uint64_t v5 = sub_100041408;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100041408()
{
  swift_release();
  sub_10004AF90();
  switch(*(unsigned char *)(v0 + 113))
  {
    case 1:
    case 2:
    case 3:
    case 4:
      sub_10004B500();
      break;
    default:
      break;
  }
  id v1 = [self sharedPreferences];
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x100041554);
  }
  uint64_t v2 = v1;
  NSString v3 = sub_10004B4F0();
  swift_bridgeObjectRelease();
  [v2 setOverlayCalendarID:v3];

  sub_10004AF70();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100041568()
{
  if (qword_10006C5C0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000415C8()
{
  unint64_t result = qword_10006DAB0;
  if (!qword_10006DAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAB0);
  }
  return result;
}

unint64_t sub_100041620()
{
  unint64_t result = qword_10006DAB8;
  if (!qword_10006DAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAB8);
  }
  return result;
}

uint64_t sub_100041674()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100041690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000416BC(a1, a2, a3, (void (*)(void))sub_10002FDF8);
}

uint64_t sub_1000416BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100041704@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C5B8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006E140, a1);
}

uint64_t sub_10004173C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000083B4;
  return sub_1000410C8(a1, v5, v4);
}

uint64_t sub_1000417E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100042598();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100041810(uint64_t a1)
{
  unint64_t v2 = sub_10002FDF8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100041850()
{
  unint64_t result = qword_10006DAC8;
  if (!qword_10006DAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAC8);
  }
  return result;
}

unint64_t sub_1000418A8()
{
  unint64_t result = qword_10006DAD0[0];
  if (!qword_10006DAD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006DAD0);
  }
  return result;
}

uint64_t sub_1000418FC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10006DB30 + dword_10006DB30);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000083B0;
  return v4();
}

uint64_t sub_1000419A0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10003FE80();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100041A54()
{
  unint64_t result = qword_10006DAE8;
  if (!qword_10006DAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAE8);
  }
  return result;
}

unint64_t sub_100041AAC()
{
  unint64_t result = qword_10006DAF0[0];
  if (!qword_10006DAF0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006DAF0);
  }
  return result;
}

uint64_t sub_100041B00(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10003FE80();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100041BB4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10003FE80();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100041C68()
{
  unint64_t result = qword_10006DB08;
  if (!qword_10006DB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DB08);
  }
  return result;
}

unint64_t sub_100041CC0()
{
  unint64_t result = qword_10006DB10;
  if (!qword_10006DB10)
  {
    sub_100005398(qword_10006DB18);
    sub_100040C60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DB10);
  }
  return result;
}

uint64_t sub_100041D34(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100040B58();
  void *v5 = v2;
  v5[1] = sub_1000060CC;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_alternateCalendarType()
{
  return &type metadata for UpdateIntent_alternateCalendarType;
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarEntityQuery()
{
  return &type metadata for SettingsAlternateCalendarEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarEntity()
{
  return &type metadata for SettingsAlternateCalendarEntity;
}

unsigned char *storeEnumTagSinglePayload for SettingsAlternateCalendarType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x100041EE4);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarType()
{
  return &type metadata for SettingsAlternateCalendarType;
}

uint64_t sub_100041F1C@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v1 = sub_10004B490();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100007DEC(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (objc_class *)[self mainBundle];
  v11._countAndFlagsBits = 0xD000000000000023;
  v9._countAndFlagsBits = 0x800000010005D780;
  v11._object = (void *)0x800000010005D750;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v7.super.Class isa = v6;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004B2C0(v11, v12, v7, v13, v9);

  swift_getKeyPath();
  sub_10004B480();
  sub_10003FB6C();
  sub_100043074();
  sub_1000418A8();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100042204@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100042438@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_10003F524(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_1000424D0(char *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_10003F524(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_100042598()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  unint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v41 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v40 = sub_100007DEC(&qword_10006DB58);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  char v19 = v41;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v50 = 0;
  uint64_t v21 = sub_10004AF60();
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  uint64_t v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_10003FE28();
  uint64_t v40 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006DB60);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v26 = v31;
  uint64_t v25 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v25(v10, v24, v26);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  char v49 = 5;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_10003FB6C();
  sub_10004AFB0();
  return v40;
}

uint64_t sub_100042CF0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100069868;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_100042D3C()
{
  uint64_t v1 = sub_10004B2E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_10004B330();
  v0[5] = swift_task_alloc();
  sub_10004B4E0();
  v0[6] = swift_task_alloc();
  sub_10004B2F0();
  v0[7] = swift_task_alloc();
  return _swift_task_switch(sub_100042E7C, 0, 0);
}

uint64_t sub_100042E7C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  sub_100007DEC(&qword_10006DAA8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006DB48, &qword_10006DB50);
  sub_10003FB6C();
  uint64_t v4 = sub_10004B290();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_10004303C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarsPickerControl()
{
  return &type metadata for SettingsAlternateCalendarsPickerControl;
}

uint64_t sub_100043058()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100043074()
{
  unint64_t result = qword_10006DB80;
  if (!qword_10006DB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DB80);
  }
  return result;
}

unint64_t sub_1000430C8(uint64_t a1)
{
  return sub_1000435B4(a1, &qword_10006C958, (uint64_t *)&unk_10006DDE0, (void (*)(uint64_t))sub_10000B020, (uint64_t (*)(uint64_t, Swift::Int))sub_1000491F8);
}

unint64_t sub_100043104(uint64_t a1)
{
  uint64_t v2 = sub_100007DEC(&qword_10006C970);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007DEC(&qword_10006DDF0);
  uint64_t v6 = sub_10004B5B0();
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
    sub_10004AC98(v12, (uint64_t)v5, &qword_10006C970);
    char v14 = *v5;
    unint64_t result = sub_100048FF8(*v5, (void (*)(uint64_t))sub_10000B020, (uint64_t (*)(uint64_t, Swift::Int))sub_1000491F8);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100007DEC((uint64_t *)&unk_10006DDF8);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
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

unint64_t sub_10004332C(uint64_t a1)
{
  return sub_100043354(a1, &qword_10006CDD0, (uint64_t *)&unk_10006DDD0, (uint64_t (*)(void))sub_100048E4C);
}

unint64_t sub_100043354(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v29 = a4;
  uint64_t v7 = sub_100007DEC(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v12 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007DEC(a3);
  uint64_t v11 = sub_10004B5B0();
  uint64_t v12 = (void *)v11;
  uint64_t v13 = *(void *)(a1 + 16);
  if (!v13)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v12;
  }
  char v14 = &v10[*(int *)(v7 + 48)];
  uint64_t v15 = v11 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v28 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v8 + 72);
  swift_retain();
  while (1)
  {
    sub_10004AC98(v17, (uint64_t)v10, a2);
    char v19 = *v10;
    unint64_t result = v29(*v10);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v12[6] + result) = v19;
    uint64_t v23 = v12[7];
    uint64_t v24 = sub_10004B1B0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v14, v24);
    uint64_t v25 = v12[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    void v12[2] = v27;
    v17 += v18;
    if (!--v13)
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

unint64_t sub_100043550(uint64_t a1)
{
  return sub_100043354(a1, &qword_10006D108, (uint64_t *)&unk_10006DDC0, (uint64_t (*)(void))sub_100048F60);
}

unint64_t sub_100043578(uint64_t a1)
{
  return sub_1000435B4(a1, (uint64_t *)&unk_10006D300, (uint64_t *)&unk_10006DDB0, (void (*)(uint64_t))sub_100021618, (uint64_t (*)(uint64_t, Swift::Int))sub_100049D54);
}

unint64_t sub_1000435B4(uint64_t a1, uint64_t *a2, uint64_t *a3, void (*a4)(uint64_t), uint64_t (*a5)(uint64_t, Swift::Int))
{
  unsigned int v30 = a4;
  uint64_t v31 = a5;
  uint64_t v8 = sub_100007DEC(a2);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v13 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007DEC(a3);
  uint64_t v12 = sub_10004B5B0();
  uint64_t v13 = (void *)v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  uint64_t v15 = &v11[*(int *)(v8 + 48)];
  uint64_t v16 = v12 + 64;
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v29[1] = a1;
  uint64_t v18 = a1 + v17;
  uint64_t v19 = *(void *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_10004AC98(v18, (uint64_t)v11, a2);
    char v20 = *v11;
    unint64_t result = sub_100048FF8(*v11, v30, v31);
    if (v22) {
      break;
    }
    unint64_t v23 = result;
    *(void *)(v16 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v13[6] + result) = v20;
    uint64_t v24 = v13[7];
    uint64_t v25 = sub_10004B1B0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v24 + *(void *)(*(void *)(v25 - 8) + 72) * v23, v15, v25);
    uint64_t v26 = v13[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_11;
    }
    v13[2] = v28;
    v18 += v19;
    if (!--v14)
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

unint64_t sub_1000437AC(uint64_t a1)
{
  return sub_100043354(a1, &qword_10006D7B0, (uint64_t *)&unk_10006DDA0, (uint64_t (*)(void))sub_100049094);
}

unint64_t sub_1000437D4(uint64_t a1)
{
  return sub_100043354(a1, &qword_10006D980, (uint64_t *)&unk_10006DD90, (uint64_t (*)(void))sub_100049124);
}

unint64_t sub_1000437FC(uint64_t a1)
{
  return sub_100043354(a1, &qword_10006DB78, (uint64_t *)&unk_10006DD80, (uint64_t (*)(void))sub_100049168);
}

uint64_t sub_100043824(char a1, char a2)
{
  if (*(void *)&aNoalert_5[8 * a1] == *(void *)&aNoalert_5[8 * a2]
    && *(void *)&aDayofeveoneday_0[8 * a1 + 32] == *(void *)&aDayofeveoneday_0[8 * a2 + 32])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10004B5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1000438AC(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000011;
  unint64_t v4 = 0x8000000100052960;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      unint64_t v4 = 0xED0000736574756ELL;
      unint64_t v3 = 0x694D797472696874;
      break;
    case 3:
      uint64_t v5 = "fortyFiveMinutes";
      goto LABEL_7;
    case 4:
      unint64_t v4 = 0xEC00000073657475;
      unint64_t v3 = 0x6E694D7974666966;
      break;
    case 5:
      uint64_t v5 = "fiftyFiveMinutes";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 6:
      unint64_t v4 = 0xE700000000000000;
      unint64_t v3 = 0x72756F48656E6FLL;
      break;
    case 7:
      unint64_t v3 = 0xD000000000000014;
      unint64_t v4 = 0x80000001000529C0;
      break;
    case 8:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x7372756F486F7774;
      break;
    default:
      unint64_t v4 = 0xEE00736574756E69;
      unint64_t v3 = 0x4D6E656574666966;
      break;
  }
  unint64_t v6 = 0xD000000000000011;
  unint64_t v7 = 0x8000000100052960;
  switch(a2)
  {
    case 1:
      goto LABEL_25;
    case 2:
      unint64_t v7 = 0xED0000736574756ELL;
      if (v3 != 0x694D797472696874) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 3:
      uint64_t v8 = "fortyFiveMinutes";
      goto LABEL_20;
    case 4:
      unint64_t v7 = 0xEC00000073657475;
      if (v3 != 0x6E694D7974666966) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 5:
      uint64_t v8 = "fiftyFiveMinutes";
LABEL_20:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      if (v3 != 0xD000000000000010) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 6:
      unint64_t v7 = 0xE700000000000000;
      if (v3 != 0x72756F48656E6FLL) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 7:
      unint64_t v6 = 0xD000000000000014;
      unint64_t v7 = 0x80000001000529C0;
LABEL_25:
      if (v3 == v6) {
        goto LABEL_26;
      }
      goto LABEL_29;
    case 8:
      unint64_t v7 = 0xE800000000000000;
      if (v3 != 0x7372756F486F7774) {
        goto LABEL_29;
      }
      goto LABEL_26;
    default:
      unint64_t v7 = 0xEE00736574756E69;
      if (v3 != 0x4D6E656574666966) {
        goto LABEL_29;
      }
LABEL_26:
      if (v4 == v7) {
        char v9 = 1;
      }
      else {
LABEL_29:
      }
        char v9 = sub_10004B5D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_100043B9C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x80000001000528D0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v6 = "events1MonthBack";
      goto LABEL_6;
    case 3:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "events3MonthsBack";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "events6MonthsBack";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v5 = 0x746E6576456C6C61;
      unint64_t v3 = 0xE900000000000073;
      break;
  }
  unint64_t v7 = 0x80000001000528D0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      uint64_t v8 = "events1MonthBack";
      goto LABEL_12;
    case 3:
      unint64_t v2 = 0xD000000000000011;
      uint64_t v8 = "events3MonthsBack";
      goto LABEL_12;
    case 4:
      unint64_t v2 = 0xD000000000000011;
      uint64_t v8 = "events6MonthsBack";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v2 = 0x746E6576456C6C61;
      unint64_t v7 = 0xE900000000000073;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_10004B5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_100043D30(char a1, char a2)
{
  if (*(void *)&aSystemsesunday_0[8 * a1] == *(void *)&aSystemsesunday_0[8 * a2]
    && *(void *)&aSaturdaytting_0[8 * a1 + 8] == *(void *)&aSaturdaytting_0[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_10004B5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100043DB8(char a1, char a2)
{
  if (qword_100052668[a1] == qword_100052668[a2] && qword_100052690[a1] == qword_100052690[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_10004B5D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_100043E40()
{
  return sub_10004B650();
}

Swift::Int sub_100043F38()
{
  return sub_10004B650();
}

Swift::Int sub_100043FA4()
{
  return sub_10004B650();
}

uint64_t sub_100044010()
{
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100044064()
{
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000441D8()
{
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000442B0()
{
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100044304()
{
  sub_10004B510();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100044358()
{
  return sub_10004B650();
}

Swift::Int sub_1000443C0()
{
  return sub_10004B650();
}

Swift::Int sub_100044428()
{
  return sub_10004B650();
}

Swift::Int sub_10004451C()
{
  return sub_10004B650();
}

uint64_t sub_100044584(char a1)
{
  return *(void *)&aNoalert_5[8 * a1];
}

uint64_t sub_1000445A4()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10004B2E0();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  unint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_10004B270();
  sub_1000081B8(v10, qword_10006E160);
  sub_100008180(v10, (uint64_t)qword_10006E160);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_10004B310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_10004B260();
}

unint64_t sub_10004487C()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C7D0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v94 = (char *)v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v77 = (char *)v73 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v90 = (char *)v73 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v76 = (char *)v73 - v8;
  __chkstk_darwin(v7);
  uint64_t v79 = (uint64_t)v73 - v9;
  uint64_t v10 = sub_100007DEC(&qword_10006C780);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v93 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v91 = (char *)v73 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v88 = (char *)v73 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v83 = (char *)v73 - v18;
  __chkstk_darwin(v17);
  uint64_t v80 = (char *)v73 - v19;
  uint64_t v20 = sub_10004B2E0();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v23 = (char *)v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10004B330();
  __chkstk_darwin(v24 - 8);
  uint64_t v25 = sub_10004B4E0();
  __chkstk_darwin(v25 - 8);
  uint64_t v26 = sub_10004B2F0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = __chkstk_darwin(v26);
  unsigned int v92 = (char *)v73 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v89 = (char *)v73 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v86 = (char *)v73 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v82 = (uint64_t)v73 - v35;
  __chkstk_darwin(v34);
  uint64_t v37 = (char *)v73 - v36;
  sub_100007DEC(&qword_10006DD58);
  uint64_t v111 = sub_100007DEC((uint64_t *)&unk_10006DD60);
  unint64_t v38 = (*(unsigned __int8 *)(*(void *)(v111 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v111 - 8) + 80);
  unint64_t v108 = *(void *)(*(void *)(v111 - 8) + 72);
  uint64_t v39 = v26;
  uint64_t v40 = swift_allocObject();
  long long v75 = xmmword_10004D1A0;
  *(_OWORD *)(v40 + 16) = xmmword_10004D1A0;
  uint64_t v78 = v40;
  unint64_t v107 = v40 + v38;
  *(unsigned char *)(v40 + v38) = 0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v41 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
  uint64_t v42 = v21 + 104;
  uint64_t v95 = v20;
  uint64_t v87 = v43;
  v43(v23, enum case for LocalizedStringResource.BundleDescription.main(_:), v20);
  uint64_t v74 = (uint64_t)v37;
  sub_10004B300();
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
  uint64_t v109 = v39;
  uint64_t v105 = v44;
  uint64_t v106 = v27 + 56;
  v44(v80, 1, 1, v39);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_10004B160();
  uint64_t v46 = sub_100008180(v45, (uint64_t)qword_10006E0F0);
  uint64_t v96 = v45;
  uint64_t v47 = *(void *)(v45 - 8);
  uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 16);
  uint64_t v102 = v47 + 16;
  uint64_t v103 = v46;
  uint64_t v104 = v48;
  char v49 = (char *)v79;
  v48((char *)v79, v46, v45);
  uint64_t v98 = *(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56);
  uint64_t v101 = v47 + 56;
  v98(v49, 0, 1, v45);
  uint64_t v99 = sub_100007DEC(&qword_10006CDD8);
  uint64_t v50 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v110 = *(void *)(v27 + 72);
  uint64_t v81 = 2 * v110;
  uint64_t v97 = (v50 + 32) & ~v50;
  uint64_t v85 = v97 + 2 * v110;
  uint64_t v100 = v50 | 7;
  uint64_t v51 = swift_allocObject();
  long long v84 = xmmword_10004D1B0;
  v73[2] = v51;
  *(_OWORD *)(v51 + 16) = xmmword_10004D1B0;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v52 = v95;
  uint64_t v53 = v87;
  v87(v23, v41, v95);
  sub_10004B300();
  unint64_t v54 = v107;
  v73[0] = v107 + *(int *)(v111 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v53(v23, v41, v52);
  sub_10004B300();
  sub_10004B190();
  uint64_t v80 = (char *)(v54 + v108);
  *uint64_t v80 = 1;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v55 = v41;
  v53(v23, v41, v52);
  unint64_t v56 = v53;
  sub_10004B300();
  v105(v83, 1, 1, v109);
  uint64_t v57 = v76;
  uint64_t v58 = v96;
  v104(v76, v103, v96);
  v98(v57, 0, 1, v58);
  *(_OWORD *)(swift_allocObject() + 16) = v84;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v59 = v95;
  v56(v23, v55, v95);
  sub_10004B300();
  v80 += *(int *)(v111 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v56(v23, v55, v59);
  sub_10004B300();
  sub_10004B190();
  uint64_t v79 = 2 * v108;
  uint64_t v76 = (char *)(v107 + 2 * v108);
  *uint64_t v76 = 2;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v60 = v95;
  uint64_t v61 = v87;
  v87(v23, v55, v95);
  uint64_t v62 = v42;
  sub_10004B300();
  v105(v88, 1, 1, v109);
  uint64_t v63 = v90;
  uint64_t v64 = v96;
  v104(v90, v103, v96);
  v98(v63, 0, 1, v64);
  uint64_t v83 = (char *)(4 * v110);
  uint64_t v82 = 5 * v110;
  uint64_t v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = v75;
  sub_10004B4D0();
  sub_10004B320();
  v61(v23, v55, v60);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v61(v23, v55, v60);
  uint64_t v65 = v61;
  sub_10004B300();
  uint64_t v66 = v81;
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v55, v60);
  sub_10004B300();
  uint64_t v80 = (char *)(v66 + v110);
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v55, v60);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v55, v60);
  v73[1] = v62;
  sub_10004B300();
  sub_10004B190();
  uint64_t v90 = (char *)(v107 + v79 + v108);
  char *v90 = 3;
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v55, v60);
  sub_10004B300();
  v105(v91, 1, 1, v109);
  unint64_t v67 = v77;
  uint64_t v68 = v96;
  v104(v77, v103, v96);
  v98(v67, 0, 1, v68);
  *(_OWORD *)(swift_allocObject() + 16) = v84;
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v55, v60);
  sub_10004B300();
  v90 += *(int *)(v111 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v55, v60);
  sub_10004B300();
  sub_10004B190();
  unint64_t v108 = v107 + 4 * v108;
  *(unsigned char *)unint64_t v108 = 4;
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v69 = v55;
  v65(v23, v55, v60);
  sub_10004B300();
  v105(v93, 1, 1, v109);
  uint64_t v70 = v94;
  uint64_t v71 = v96;
  v104(v94, v103, v96);
  v98(v70, 0, 1, v71);
  uint64_t v109 = swift_allocObject();
  *(_OWORD *)(v109 + 16) = xmmword_10004E240;
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v60);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v60);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v60);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v60);
  sub_10004B300();
  uint64_t v111 = v108 + *(int *)(v111 + 48);
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v60);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v65(v23, v69, v60);
  sub_10004B300();
  sub_10004B190();
  unint64_t result = sub_100043354(v78, (uint64_t *)&unk_10006DD60, (uint64_t *)&unk_10006DD70, (uint64_t (*)(void))sub_100049094);
  qword_10006E178 = result;
  return result;
}

uint64_t sub_1000460B4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007DEC(&qword_10006CDE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004B2F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10006C5D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_10006E178;
  if (*(void *)(qword_10006E178 + 16) && (unint64_t v12 = sub_100049094(a1), (v13 & 1) != 0))
  {
    unint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 56);
    uint64_t v16 = sub_10004B1B0();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(void *)(v17 + 72) * v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v16 = sub_10004B1B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  sub_10004B1B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return sub_10004B2D0();
  }
  else
  {
    sub_10004B170();
    sub_1000179D0((uint64_t)v6);
    swift_endAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

unint64_t sub_1000463B0()
{
  unint64_t result = qword_10006DBA0;
  if (!qword_10006DBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBA0);
  }
  return result;
}

uint64_t sub_100046404@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10004A904(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100046434@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100044584(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100046464()
{
  unint64_t result = qword_10006DBA8;
  if (!qword_10006DBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBA8);
  }
  return result;
}

unint64_t sub_1000464BC()
{
  unint64_t result = qword_10006DBB0;
  if (!qword_10006DBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBB0);
  }
  return result;
}

unint64_t sub_100046514()
{
  unint64_t result = qword_10006DBB8;
  if (!qword_10006DBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBB8);
  }
  return result;
}

unint64_t sub_10004656C()
{
  unint64_t result = qword_10006DBC0;
  if (!qword_10006DBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBC0);
  }
  return result;
}

unint64_t sub_1000465C4()
{
  unint64_t result = qword_10006DBC8;
  if (!qword_10006DBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBC8);
  }
  return result;
}

unint64_t sub_100046620()
{
  unint64_t result = qword_10006DBD8;
  if (!qword_10006DBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBD8);
  }
  return result;
}

uint64_t sub_100046674@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C5C8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10006E160, a1);
}

uint64_t sub_1000466AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100047F14(a1, a2, a3, (void (*)(void))sub_1000466D8);
}

unint64_t sub_1000466D8()
{
  unint64_t result = qword_10006DBE0;
  if (!qword_10006DBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBE0);
  }
  return result;
}

uint64_t sub_10004672C(uint64_t a1)
{
  unint64_t v2 = sub_1000466D8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10004677C()
{
  unint64_t result = qword_10006DBE8;
  if (!qword_10006DBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBE8);
  }
  return result;
}

unint64_t sub_1000467D4()
{
  unint64_t result = qword_10006DBF0;
  if (!qword_10006DBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBF0);
  }
  return result;
}

unint64_t sub_10004682C()
{
  unint64_t result = qword_10006DBF8;
  if (!qword_10006DBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DBF8);
  }
  return result;
}

uint64_t sub_100046880()
{
  if (qword_10006C5D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000468F8(uint64_t a1)
{
  unint64_t v2 = sub_100046620();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100046944()
{
  return sub_100008248(&qword_10006DC00, &qword_10006DC08);
}

void sub_100046980(void *a1@<X8>)
{
  *a1 = &off_1000699C0;
}

unint64_t sub_100046994()
{
  unint64_t result = qword_10006DC10;
  if (!qword_10006DC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC10);
  }
  return result;
}

unint64_t sub_1000469EC()
{
  unint64_t result = qword_10006DC18;
  if (!qword_10006DC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC18);
  }
  return result;
}

uint64_t sub_100046A40(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100046A60, 0, 0);
}

uint64_t sub_100046A60()
{
  id v1 = [self defaultAllDayAlarmOffset];
  id v2 = [v1 integerValue];
  if (v2 == (id)sub_10004B2B0())
  {
    char v3 = 0;
  }
  else
  {
    [v1 doubleValue];
    char v3 = sub_1000383A8(v4);
  }
  uint64_t v5 = *(unsigned char **)(v0 + 16);

  unsigned char *v5 = v3;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100046B30(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 24) = *(void *)(a1 + 8);
  *(unsigned char *)(v2 + 32) = *a2;
  return _swift_task_switch(sub_100046B5C, 0, 0);
}

uint64_t sub_100046B5C()
{
  sub_10004AE40();
  id v1 = [*(id *)(v0 + 16) eventStore];
  swift_unknownObjectRelease();
  if (v1)
  {
    switch(*(unsigned char *)(v0 + 32))
    {
      case 1:
      case 2:
      case 3:
      case 4:
        char v2 = sub_10004B5D0();
        swift_bridgeObjectRelease();
        if (v2) {
          goto LABEL_5;
        }
        char v3 = self;
        v4.super.super.Class isa = sub_10004B560().super.super.isa;
        break;
      default:
        swift_bridgeObjectRelease();
LABEL_5:
        char v3 = self;
        sub_10004B2B0();
        v4.super.super.Class isa = sub_10004B570().super.super.isa;
        break;
    }
    Class isa = v4.super.super.isa;
    [v3 setDefaultAlarmOffset:v4.super.super.isa forAlarmType:1 eventStore:v1];
  }
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100046D48()
{
  uint64_t v0 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v0 - 8);
  char v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_10004B2E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B330();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B4E0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10004B2F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  sub_10004B300();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, 1, 1, v9);
  return sub_10004B260();
}

uint64_t sub_100047018@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100007DEC(&qword_10006C7D0);
  __chkstk_darwin(v1 - 8);
  uint64_t v21 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004B330();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_10004B4E0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B2F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  sub_10004B300();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v5, 1, 1, v12);
  if (qword_10006C598 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10004B160();
  uint64_t v16 = sub_100008180(v15, (uint64_t)qword_10006E0F0);
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v16, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v18, 0, 1, v15);
  sub_10004B2D0();
  return sub_10004B180();
}

uint64_t sub_100047444()
{
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  sub_10004AEA0();
  uint64_t result = sub_10004AE60();
  qword_10006E180 = result;
  return result;
}

uint64_t sub_1000474AC()
{
  uint64_t v0 = qword_10006DB90;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_1000474E8()
{
  unint64_t result = qword_10006DC20;
  if (!qword_10006DC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC20);
  }
  return result;
}

unint64_t sub_100047540()
{
  unint64_t result = qword_10006DC28;
  if (!qword_10006DC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC28);
  }
  return result;
}

unint64_t sub_100047598()
{
  unint64_t result = qword_10006DC30;
  if (!qword_10006DC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC30);
  }
  return result;
}

unint64_t sub_1000475F0()
{
  unint64_t result = qword_10006DC38;
  if (!qword_10006DC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC38);
  }
  return result;
}

uint64_t sub_100047644@<X0>(void *a1@<X8>)
{
  if (qword_10006C5D8 != -1) {
    swift_once();
  }
  *a1 = qword_10006E180;

  return swift_retain();
}

unint64_t sub_1000476B4()
{
  unint64_t result = qword_10006DC40;
  if (!qword_10006DC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC40);
  }
  return result;
}

unint64_t sub_10004770C()
{
  unint64_t result = qword_10006DC48;
  if (!qword_10006DC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC48);
  }
  return result;
}

unint64_t sub_100047764()
{
  unint64_t result = qword_10006DC50;
  if (!qword_10006DC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC50);
  }
  return result;
}

unint64_t sub_1000477BC()
{
  unint64_t result = qword_10006DC58;
  if (!qword_10006DC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC58);
  }
  return result;
}

void sub_100047810(void *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x800000010005E4D0;
}

uint64_t sub_100047834()
{
  return sub_100008248(&qword_10006DC60, &qword_10006DC68);
}

uint64_t sub_100047870(uint64_t a1)
{
  unint64_t v2 = sub_100046994();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000478C0()
{
  unint64_t result = qword_10006DC70;
  if (!qword_10006DC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC70);
  }
  return result;
}

uint64_t sub_100047918(uint64_t a1)
{
  unint64_t v2 = sub_1000477BC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100047968()
{
  return sub_100008248(&qword_10006DC80, &qword_10006DC88);
}

uint64_t sub_1000479A4()
{
  uint64_t v0 = sub_10004B2E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004B330();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10004B4E0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10004B2F0();
  sub_1000081B8(v6, qword_10006E188);
  sub_100008180(v6, (uint64_t)qword_10006E188);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10004B300();
}

uint64_t sub_100047BA4()
{
  uint64_t result = swift_getKeyPath();
  qword_10006E1A0 = result;
  return result;
}

uint64_t sub_100047BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_10004B550();
  v3[9] = sub_10004B540();
  uint64_t v5 = sub_10004B530();
  v3[10] = v5;
  v3[11] = v4;
  return _swift_task_switch(sub_100047C68, v5, v4);
}

uint64_t sub_100047C68()
{
  sub_10004AF90();
  uint64_t v1 = v0[2];
  v0[4] = v1;
  uint64_t v2 = v0[3];
  v0[12] = v1;
  v0[13] = v2;
  v0[5] = v2;
  sub_10004AF90();
  if (qword_10006C5E8 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10006E1A0;
  v0[14] = qword_10006E1A0;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[15] = v4;
  uint64_t v5 = sub_100008248(&qword_10006DD28, &qword_10006DD30);
  *uint64_t v4 = v0;
  v4[1] = sub_100026180;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 17, v3, &type metadata for SettingsAllDayDefaultAlertTimeType, v5);
}

uint64_t sub_100047DC0()
{
  if (qword_10006C5E8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100047E20()
{
  unint64_t result = qword_10006DC90;
  if (!qword_10006DC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC90);
  }
  return result;
}

unint64_t sub_100047E78()
{
  unint64_t result = qword_10006DC98;
  if (!qword_10006DC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC98);
  }
  return result;
}

uint64_t sub_100047ECC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100047EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100047F14(a1, a2, a3, (void (*)(void))sub_10002FEF4);
}

uint64_t sub_100047F14(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100047F5C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C154(&qword_10006C5E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10006E188, a1);
}

uint64_t sub_100047F94(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_1000083B4;
  return sub_100047BCC(a1, v5, v4);
}

uint64_t sub_100048040@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004A1A4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100048068(uint64_t a1)
{
  unint64_t v2 = sub_10002FEF4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000480A8()
{
  unint64_t result = qword_10006DCA8;
  if (!qword_10006DCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DCA8);
  }
  return result;
}

unint64_t sub_100048100()
{
  unint64_t result = qword_10006DCB0[0];
  if (!qword_10006DCB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006DCB0);
  }
  return result;
}

uint64_t sub_100048154(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  return _swift_task_switch(sub_100048178, 0, 0);
}

uint64_t sub_100048178()
{
  uint64_t v1 = (uint64_t *)v0[3];
  sub_10004AE40();
  *uint64_t v1 = sub_10004A950(v0[2]);
  v1[1] = v2;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1000481EC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000469EC();
  *uint64_t v4 = v2;
  v4[1] = sub_100006428;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000482A0()
{
  unint64_t result = qword_10006DCC8;
  if (!qword_10006DCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DCC8);
  }
  return result;
}

unint64_t sub_1000482F8()
{
  unint64_t result = qword_10006DCD0[0];
  if (!qword_10006DCD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006DCD0);
  }
  return result;
}

uint64_t sub_10004834C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000469EC();
  void *v5 = v2;
  v5[1] = sub_1000066A0;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100048400(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000469EC();
  *uint64_t v4 = v2;
  v4[1] = sub_1000083B0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000484B4()
{
  unint64_t result = qword_10006DCE8;
  if (!qword_10006DCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DCE8);
  }
  return result;
}

unint64_t sub_10004850C()
{
  unint64_t result = qword_10006DCF0;
  if (!qword_10006DCF0)
  {
    sub_100005398(qword_10006DCF8);
    sub_100047764();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DCF0);
  }
  return result;
}

uint64_t sub_100048580(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000475F0();
  void *v5 = v2;
  v5[1] = sub_1000060CC;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_allDayEventsDefaultAlertTimeType()
{
  return &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimesEntityQuery()
{
  return &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimesEntity()
{
  return &type metadata for SettingsAllDayDefaultAlertTimesEntity;
}

unsigned char *storeEnumTagSinglePayload for SettingsAllDayDefaultAlertTimeType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x100048730);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimeType()
{
  return &type metadata for SettingsAllDayDefaultAlertTimeType;
}

uint64_t sub_100048768@<X0>(uint64_t a1@<X8>)
{
  v10[1] = a1;
  uint64_t v1 = sub_10004B490();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100007DEC(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = (objc_class *)[self mainBundle];
  v11._countAndFlagsBits = 0xD000000000000022;
  v9._countAndFlagsBits = 0x800000010005E2D0;
  v11._object = (void *)0x800000010005E3D0;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v7.super.Class isa = v6;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_10004B2C0(v11, v12, v7, v13, v9);

  swift_getKeyPath();
  sub_10004B480();
  sub_1000466D8();
  sub_10004AD28();
  sub_100048100();
  sub_10004B4A0();
  sub_10004B430();
  sub_100008248(&qword_10006D320, &qword_10006D310);
  sub_10004B450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100048A50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  uint64_t result = sub_10004B460();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100048C84@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004B2F0();
  __chkstk_darwin(v4 - 8);
  sub_1000460B4(*a1, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_10004B460();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v8 & 1;
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_100048D1C(char *a1)
{
  uint64_t v2 = sub_10004B2F0();
  __chkstk_darwin(v2 - 8);
  sub_1000460B4(*a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10004B460();
  return sub_10004B4C0();
}

uint64_t sub_100048DE4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 2 * a2;
  sub_10004B2F0();
  return a1;
}

unint64_t sub_100048E4C(unsigned __int8 a1)
{
  sub_10004B630();
  sub_10004B510();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10004B650();

  return sub_10004976C(a1, v2);
}

unint64_t sub_100048F60(unsigned __int8 a1)
{
  sub_10004B630();
  sub_100044064();
  Swift::Int v2 = sub_10004B650();

  return sub_1000499D0(a1, v2);
}

uint64_t sub_100048FCC(uint64_t a1)
{
  return sub_100048FF8(a1, (void (*)(uint64_t))sub_100021618, (uint64_t (*)(uint64_t, Swift::Int))sub_100049D54);
}

uint64_t sub_100048FF8(uint64_t a1, void (*a2)(uint64_t), uint64_t (*a3)(uint64_t, Swift::Int))
{
  sub_10004B630();
  a2(a1);
  sub_10004B510();
  swift_bridgeObjectRelease();
  Swift::Int v5 = sub_10004B650();

  return a3(a1, v5);
}

unint64_t sub_100049094(char a1)
{
  sub_10004B630();
  sub_10004B510();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10004B650();

  return sub_100049E68(a1, v2);
}

unint64_t sub_100049124(char a1)
{
  Swift::Int v2 = sub_1000443C0();

  return sub_100049F7C(a1, v2);
}

unint64_t sub_100049168(char a1)
{
  sub_10004B630();
  sub_10004B510();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10004B650();

  return sub_10004A090(a1, v2);
}

unint64_t sub_1000491F8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x8000000100052730;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unint64_t v8 = 0xD000000000000012;
          uint64_t v9 = "timeZoneOverride";
          goto LABEL_21;
        case 3:
          unint64_t v8 = 0x626D754E6B656577;
          unint64_t v7 = 0xEB00000000737265;
          break;
        case 4:
          unint64_t v8 = 0xD000000000000015;
          uint64_t v9 = "alternateCalendars";
          goto LABEL_21;
        case 5:
          unint64_t v8 = 0xD000000000000013;
          uint64_t v9 = "weekViewStartsOnToday";
          goto LABEL_21;
        case 6:
          unint64_t v8 = 0x61727544636E7973;
          unint64_t v7 = 0xEC0000006E6F6974;
          break;
        case 7:
          uint64_t v10 = "nes";
          goto LABEL_19;
        case 8:
          unint64_t v8 = 0xD00000000000001ALL;
          uint64_t v9 = "defaultAlertTimes";
          goto LABEL_21;
        case 9:
          unint64_t v8 = 0xD00000000000001CLL;
          uint64_t v9 = "birthdaysDefaultAlertTimes";
          goto LABEL_21;
        case 0xA:
          unint64_t v8 = 0xD00000000000001DLL;
          uint64_t v9 = "timedEventsDefaultAlertTimes";
          goto LABEL_21;
        case 0xB:
          unint64_t v8 = 0x654C6F54656D6974;
          unint64_t v7 = 0xEB00000000657661;
          break;
        case 0xC:
          unint64_t v8 = 0xD000000000000014;
          uint64_t v9 = "ultAlertTimes";
          goto LABEL_21;
        case 0xD:
          unint64_t v8 = 0x6565577472617473;
          unint64_t v7 = 0xEB000000006E4F6BLL;
          break;
        case 0xE:
          unint64_t v8 = 0x43746C7561666564;
          unint64_t v7 = 0xEF7261646E656C61;
          break;
        case 0xF:
          uint64_t v10 = "";
LABEL_19:
          unint64_t v7 = (unint64_t)v10 | 0x8000000000000000;
          unint64_t v8 = 0xD000000000000011;
          break;
        case 0x10:
          unint64_t v8 = 0xD000000000000013;
          uint64_t v9 = "delegateCalendars";
LABEL_21:
          unint64_t v7 = (unint64_t)v9 | 0x8000000000000000;
          break;
        default:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1953460082;
          break;
      }
      unint64_t v11 = 0x8000000100052730;
      unint64_t v12 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          goto LABEL_44;
        case 2:
          unint64_t v13 = 0xD000000000000012;
          uint64_t v14 = "timeZoneOverride";
          goto LABEL_47;
        case 3:
          uint64_t v15 = 0x626D754E6B656577;
          uint64_t v16 = 7565925;
          goto LABEL_38;
        case 4:
          unint64_t v13 = 0xD000000000000015;
          uint64_t v14 = "alternateCalendars";
          goto LABEL_47;
        case 5:
          unint64_t v13 = 0xD000000000000013;
          uint64_t v14 = "weekViewStartsOnToday";
          goto LABEL_47;
        case 6:
          unint64_t v11 = 0xEC0000006E6F6974;
          if (v8 != 0x61727544636E7973) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 7:
          uint64_t v17 = "nes";
          goto LABEL_43;
        case 8:
          unint64_t v13 = 0xD00000000000001ALL;
          uint64_t v14 = "defaultAlertTimes";
          goto LABEL_47;
        case 9:
          unint64_t v13 = 0xD00000000000001CLL;
          uint64_t v14 = "birthdaysDefaultAlertTimes";
          goto LABEL_47;
        case 10:
          unint64_t v13 = 0xD00000000000001DLL;
          uint64_t v14 = "timedEventsDefaultAlertTimes";
          goto LABEL_47;
        case 11:
          uint64_t v15 = 0x654C6F54656D6974;
          uint64_t v16 = 6649441;
          goto LABEL_38;
        case 12:
          unint64_t v13 = 0xD000000000000014;
          uint64_t v14 = "ultAlertTimes";
          goto LABEL_47;
        case 13:
          uint64_t v15 = 0x6565577472617473;
          uint64_t v16 = 7229291;
LABEL_38:
          unint64_t v11 = v16 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          if (v8 != v15) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 14:
          unint64_t v11 = 0xEF7261646E656C61;
          if (v8 != 0x43746C7561666564) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 15:
          uint64_t v17 = "";
LABEL_43:
          unint64_t v11 = (unint64_t)v17 | 0x8000000000000000;
          unint64_t v12 = 0xD000000000000011;
LABEL_44:
          if (v8 != v12) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 16:
          unint64_t v13 = 0xD000000000000013;
          uint64_t v14 = "delegateCalendars";
LABEL_47:
          unint64_t v11 = (unint64_t)v14 | 0x8000000000000000;
          if (v8 == v13) {
            goto LABEL_48;
          }
          goto LABEL_49;
        default:
          unint64_t v11 = 0xE400000000000000;
          if (v8 != 1953460082) {
            goto LABEL_49;
          }
LABEL_48:
          if (v7 == v11)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_49:
          char v18 = sub_10004B5D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v18) {
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

unint64_t sub_10004976C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000001000528D0;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unint64_t v7 = 0x80000001000528F0;
          break;
        case 3:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x8000000100052910;
          break;
        case 4:
          unint64_t v8 = 0xD000000000000011;
          unint64_t v7 = 0x8000000100052930;
          break;
        default:
          unint64_t v8 = 0x746E6576456C6C61;
          unint64_t v7 = 0xE900000000000073;
          break;
      }
      unint64_t v9 = 0x80000001000528D0;
      unint64_t v10 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          goto LABEL_14;
        case 2:
          unint64_t v9 = 0x80000001000528F0;
          if (v8 != 0xD000000000000010) {
            goto LABEL_16;
          }
          goto LABEL_15;
        case 3:
          unint64_t v10 = 0xD000000000000011;
          unint64_t v9 = 0x8000000100052910;
LABEL_14:
          if (v8 == v10) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 4:
          unint64_t v9 = 0x8000000100052930;
          if (v8 != 0xD000000000000011) {
            goto LABEL_16;
          }
          goto LABEL_15;
        default:
          unint64_t v9 = 0xE900000000000073;
          if (v8 != 0x746E6576456C6C61) {
            goto LABEL_16;
          }
LABEL_15:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_16:
          char v11 = sub_10004B5D0();
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

unint64_t sub_1000499D0(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000011;
      unint64_t v8 = 0x8000000100052960;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unint64_t v7 = 0x694D797472696874;
          unint64_t v8 = 0xED0000736574756ELL;
          break;
        case 3:
          unint64_t v9 = "twentyFiveMinutes";
          goto LABEL_9;
        case 4:
          unint64_t v7 = 0x6E694D7974666966;
          unint64_t v8 = 0xEC00000073657475;
          break;
        case 5:
          unint64_t v9 = "fortyFiveMinutes";
LABEL_9:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000010;
          break;
        case 6:
          unint64_t v8 = 0xE700000000000000;
          unint64_t v7 = 0x72756F48656E6FLL;
          break;
        case 7:
          unint64_t v7 = 0xD000000000000014;
          unint64_t v8 = 0x80000001000529C0;
          break;
        case 8:
          unint64_t v8 = 0xE800000000000000;
          unint64_t v7 = 0x7372756F486F7774;
          break;
        default:
          unint64_t v7 = 0x4D6E656574666966;
          unint64_t v8 = 0xEE00736574756E69;
          break;
      }
      unint64_t v10 = 0xD000000000000011;
      unint64_t v11 = 0x8000000100052960;
      switch(v6)
      {
        case 1:
          goto LABEL_27;
        case 2:
          unint64_t v11 = 0xED0000736574756ELL;
          if (v7 != 0x694D797472696874) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 3:
          unint64_t v12 = "twentyFiveMinutes";
          goto LABEL_22;
        case 4:
          unint64_t v11 = 0xEC00000073657475;
          if (v7 != 0x6E694D7974666966) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 5:
          unint64_t v12 = "fortyFiveMinutes";
LABEL_22:
          unint64_t v11 = (unint64_t)v12 | 0x8000000000000000;
          if (v7 != 0xD000000000000010) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 6:
          unint64_t v11 = 0xE700000000000000;
          if (v7 != 0x72756F48656E6FLL) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 7:
          unint64_t v10 = 0xD000000000000014;
          unint64_t v11 = 0x80000001000529C0;
LABEL_27:
          if (v7 == v10) {
            goto LABEL_28;
          }
          goto LABEL_29;
        case 8:
          unint64_t v11 = 0xE800000000000000;
          if (v7 != 0x7372756F486F7774) {
            goto LABEL_29;
          }
          goto LABEL_28;
        default:
          unint64_t v11 = 0xEE00736574756E69;
          if (v7 != 0x4D6E656574666966) {
            goto LABEL_29;
          }
LABEL_28:
          if (v8 == v11)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_29:
          char v13 = sub_10004B5D0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
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

unint64_t sub_100049D54(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    uint64_t v7 = *(void *)&aNoalert_6[v6 * 8];
    uint64_t v8 = qword_100052590[v6];
    while (*(void *)&aNoalert_6[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || qword_100052590[*(char *)(*(void *)(v2 + 48) + v4)] != v8)
    {
      char v10 = sub_10004B5D0();
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

unint64_t sub_100049E68(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aNoalert_5[v6];
    uint64_t v8 = *(void *)&aDayofeveoneday_0[v6 + 32];
    while (*(void *)&aNoalert_5[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aDayofeveoneday_0[8 * *(char *)(*(void *)(v2 + 48) + v4) + 32] != v8)
    {
      char v10 = sub_10004B5D0();
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

unint64_t sub_100049F7C(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aSystemsesunday_0[v6];
    uint64_t v8 = *(void *)&aSaturdaytting_0[v6 + 8];
    while (*(void *)&aSystemsesunday_0[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aSaturdaytting_0[8 * *(char *)(*(void *)(v2 + 48) + v4) + 8] != v8)
    {
      char v10 = sub_10004B5D0();
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

unint64_t sub_10004A090(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    uint64_t v7 = qword_100052668[v6];
    uint64_t v8 = qword_100052690[v6];
    while (qword_100052668[*(char *)(*(void *)(v2 + 48) + v4)] != v7
         || qword_100052690[*(char *)(*(void *)(v2 + 48) + v4)] != v8)
    {
      char v10 = sub_10004B5D0();
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

uint64_t sub_10004A1A4()
{
  uint64_t v46 = sub_10004B230();
  uint64_t v48 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = &v29[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v1 = sub_100007DEC((uint64_t *)&unk_10006D2A0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v44 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v42 = &v29[-v4];
  uint64_t v5 = sub_100007DEC(&qword_10006C780);
  __chkstk_darwin(v5 - 8);
  uint64_t v41 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004B2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10004B330();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10004B4E0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10004B2F0();
  uint64_t v38 = v13;
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v43 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v34 = &v29[-v16];
  uint64_t v40 = sub_100007DEC(&qword_10006DD38);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v17 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  char v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  unsigned int v30 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v31 = v7;
  v18(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  uint64_t v32 = v18;
  uint64_t v33 = v8 + 104;
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v18(v10, v17, v7);
  uint64_t v19 = v41;
  sub_10004B300();
  uint64_t v20 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v47 + 56);
  v47 += 56;
  uint64_t v39 = v20;
  v20(v19, 0, 1, v13);
  uint64_t v21 = sub_10004AF60();
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v35 = v22;
  v22(v42, 1, 1, v21);
  v22(v44, 1, 1, v21);
  unsigned int v36 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v23 = *(void (**)(void))(v48 + 104);
  v48 += 104;
  uint64_t v37 = (void (*)(unsigned char *, void, uint64_t))v23;
  v23(v45);
  sub_100046994();
  uint64_t v40 = sub_10004AFC0();
  uint64_t v34 = (unsigned char *)sub_100007DEC(&qword_10006DD40);
  sub_10004B4D0();
  sub_10004B320();
  uint64_t v24 = v30;
  uint64_t v25 = v31;
  uint64_t v26 = v32;
  v32(v10, v30, v31);
  sub_10004B300();
  sub_10004B4D0();
  sub_10004B320();
  v26(v10, v24, v25);
  sub_10004B300();
  v39(v19, 0, 1, v38);
  LOBYTE(v49) = 5;
  uint64_t v27 = v35;
  v35(v42, 1, 1, v21);
  v27(v44, 1, 1, v21);
  v37(v45, v36, v46);
  sub_1000466D8();
  sub_10004AFB0();
  return v40;
}

uint64_t sub_10004A904(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100069928;
  v6._object = a2;
  unint64_t v4 = sub_10004B5C0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10004A950(uint64_t a1)
{
  uint64_t v2 = sub_10004B2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004B330();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B4E0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_10004B2F0();
  __chkstk_darwin(v8 - 8);
  sub_100007DEC(&qword_10006DC88);
  sub_10004B4D0();
  sub_10004B320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  sub_10004B300();
  sub_100008248(&qword_10006DD28, &qword_10006DD30);
  sub_1000466D8();
  uint64_t v9 = sub_10004B290();
  sub_100007DEC(&qword_10006D2C0);
  sub_10004AEB0();
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  swift_retain();
  sub_10004AEA0();
  sub_10004AE60();
  *(void *)&v11[0] = a1;
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  sub_10004AE50();
  swift_release();
  swift_release_n();
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_10004AC8C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_10004AC98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007DEC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimesPickerControl()
{
  return &type metadata for SettingsAllDayDefaultAlertTimesPickerControl;
}

uint64_t sub_10004AD0C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10004AD28()
{
  unint64_t result = qword_10006DE08;
  if (!qword_10006DE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DE08);
  }
  return result;
}

uint64_t sub_10004AD7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004ADFC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10004AE30()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10004AE40()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t sub_10004AE50()
{
  return AppDependency.wrappedValue.setter();
}

uint64_t sub_10004AE60()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t sub_10004AE70()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10004AE80()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10004AE90()
{
  return AppDependencyManager.add<A>(key:dependency:)();
}

uint64_t sub_10004AEA0()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t sub_10004AEB0()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t sub_10004AEF0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10004AF00()
{
  return static AppIntent.description.getter();
}

uint64_t sub_10004AF10()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10004AF20()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10004AF30()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10004AF60()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10004AF70()
{
  return static IntentResult.result<>()();
}

uint64_t sub_10004AF80()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10004AF90()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10004AFA0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10004AFB0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10004AFC0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10004AFD0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10004AFE0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10004AFF0()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_10004B000()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10004B010()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10004B020()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10004B030()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10004B040()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10004B050()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10004B060()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10004B070()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10004B080()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_10004B090()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10004B0A0(Swift::String a1)
{
}

uint64_t sub_10004B0B0()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10004B0C0()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10004B0D0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10004B0E0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10004B0F0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10004B100()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10004B140()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_10004B150()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_10004B160()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10004B170()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_10004B180()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10004B190()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_10004B1A0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10004B1B0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10004B1C0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10004B1D0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_10004B1E0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_10004B200()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_10004B230()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10004B250()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10004B260()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10004B270()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10004B290()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10004B2A0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10004B2B0()
{
  return NSNotFound.getter();
}

uint64_t sub_10004B2C0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10004B2D0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10004B2E0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10004B2F0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10004B300()
{
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
}

uint64_t sub_10004B310()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10004B320()
{
  return static Locale.current.getter();
}

uint64_t sub_10004B330()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10004B340()
{
  return CalendarNextEventComplication.init()();
}

uint64_t sub_10004B350()
{
  return type metadata accessor for CalendarNextEventComplication();
}

uint64_t sub_10004B360()
{
  return CalendarDateWidget.init()();
}

uint64_t sub_10004B370()
{
  return type metadata accessor for CalendarDateWidget();
}

uint64_t sub_10004B380()
{
  return CalendarListWidget.init()();
}

uint64_t sub_10004B390()
{
  return type metadata accessor for CalendarListWidget();
}

uint64_t sub_10004B3A0()
{
  return CalendarMonthWidget.init()();
}

uint64_t sub_10004B3B0()
{
  return type metadata accessor for CalendarMonthWidget();
}

uint64_t sub_10004B3C0()
{
  return CalendarUpNextWidget.init()();
}

uint64_t sub_10004B3D0()
{
  return type metadata accessor for CalendarUpNextWidget();
}

uint64_t sub_10004B3E0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10004B3F0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10004B400()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10004B410()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_10004B420()
{
  return static WidgetBundle.main()();
}

uint64_t sub_10004B430()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10004B440()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_10004B450()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_10004B460()
{
  return Text.init(_:)();
}

uint64_t sub_10004B470()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_10004B480()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_10004B490()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_10004B4A0()
{
  return ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)();
}

uint64_t sub_10004B4B0()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_10004B4C0()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_10004B4D0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10004B4E0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10004B4F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10004B500()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004B510()
{
  return String.hash(into:)();
}

uint64_t sub_10004B520()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10004B530()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10004B540()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10004B550()
{
  return type metadata accessor for MainActor();
}

NSNumber sub_10004B560()
{
  return Double._bridgeToObjectiveC()();
}

NSNumber sub_10004B570()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10004B580()
{
  return static os_log_type_t.default.getter();
}

NSNumber sub_10004B590(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_10004B5A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10004B5B0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_10004B5C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10004B5D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10004B5E0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_10004B5F0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10004B600()
{
  return Error._code.getter();
}

uint64_t sub_10004B610()
{
  return Error._domain.getter();
}

uint64_t sub_10004B620()
{
  return Error._userInfo.getter();
}

uint64_t sub_10004B630()
{
  return Hasher.init(_seed:)();
}

void sub_10004B640(Swift::UInt a1)
{
}

Swift::Int sub_10004B650()
{
  return Hasher._finalize()();
}

uint64_t CalAlertInviteeDeclines()
{
  return _CalAlertInviteeDeclines();
}

uint64_t CalDaysToSync()
{
  return _CalDaysToSync();
}

uint64_t CalEnableTravelAdvisoriesForAutomaticBehavior()
{
  return _CalEnableTravelAdvisoriesForAutomaticBehavior();
}

uint64_t CalLocationSuggestionsEnabled()
{
  return _CalLocationSuggestionsEnabled();
}

uint64_t CalSetAlertInviteeDeclines()
{
  return _CalSetAlertInviteeDeclines();
}

uint64_t CalSetDaysToSync()
{
  return _CalSetDaysToSync();
}

uint64_t CalSetEnableTravelAdvisoriesForAutomaticBehavior()
{
  return _CalSetEnableTravelAdvisoriesForAutomaticBehavior();
}

uint64_t CalSetLocationSuggestionsEnabled()
{
  return _CalSetLocationSuggestionsEnabled();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}