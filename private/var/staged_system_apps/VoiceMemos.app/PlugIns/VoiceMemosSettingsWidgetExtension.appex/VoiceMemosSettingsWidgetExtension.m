uint64_t sub_100004740(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  if ([*(id *)(a1 + 32) _isRunningInVoiceMemos])
  {
    v1 = +[NSUserDefaults standardUserDefaults];
  }
  else
  {
    v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.VoiceMemos"];
  }
  qword_100024F20 = (uint64_t)v1;

  return _objc_release_x1();
}

uint64_t sub_1000047A4()
{
  if (qword_100024F30 != -1) {
    dispatch_once(&qword_100024F30, &stru_100020D90);
  }
  return byte_100024F38;
}

void sub_1000047E8(id a1)
{
  byte_100024F38 = os_variant_has_internal_ui();
}

id OSLogForCategory(void *a1)
{
  id v1 = a1;
  id v2 = &_os_log_default;
  if (qword_100024F48 == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_100024F48, &stru_100020DB8);
    if (v1)
    {
LABEL_3:
      v3 = [(id)qword_100024F40 objectForKey:v1];

      if (v3) {
        goto LABEL_15;
      }
      if ((unint64_t)[(id)qword_100024F40 count] > 0xA)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_12:
          v3 = &_os_log_default;
          id v8 = &_os_log_default;
          goto LABEL_15;
        }
        __int16 v10 = 0;
        v6 = "ERROR | Too many categories defined, use default";
        v7 = (uint8_t *)&v10;
      }
      else
      {
        id v4 = v1;
        os_log_t v5 = os_log_create("com.apple.VoiceMemos", (const char *)[v4 UTF8String]);
        if (v5)
        {
          v3 = v5;
          [(id)qword_100024F40 setObject:v5 forKey:v4];
          goto LABEL_15;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v6 = "ERROR | Failed os_log_create, use default";
        v7 = buf;
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_12;
    }
  }
  v3 = &_os_log_default;
LABEL_15:

  return v3;
}

void sub_100004994(id a1)
{
  qword_100024F40 = (uint64_t)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];

  _objc_release_x1();
}

void sub_100004A2C(id a1)
{
  qword_100024F58 = objc_alloc_init(RCAppGroupStorage);

  _objc_release_x1();
}

unint64_t sub_100004BBC()
{
  unint64_t result = qword_100024500;
  if (!qword_100024500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024500);
  }
  return result;
}

uint64_t sub_100004C10()
{
  return sub_100008F90(&qword_100024508, &qword_100024510);
}

uint64_t sub_100004C4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004C94()
{
  uint64_t v0 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100018330();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000182C0();
  sub_100008F18(v5, qword_100029D60);
  sub_100008EE0(v5, (uint64_t)qword_100029D60);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000182B0();
}

uint64_t sub_100004E00()
{
  sub_100008628(&qword_1000246D0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008628(&qword_1000246A0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100018330();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v6);
  sub_100018320();
  sub_100018320();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  sub_100018190();
  uint64_t v7 = sub_1000181A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 0, 1, v7);
  sub_100018320();
  return sub_1000181C0();
}

uint64_t sub_100005068()
{
  uint64_t v0 = sub_100008628(&qword_1000246D8);
  sub_100008F18(v0, qword_100029D78);
  sub_100008EE0(v0, (uint64_t)qword_100029D78);
  if (qword_100024428 != -1) {
    swift_once();
  }
  sub_100006900();
  swift_bridgeObjectRetain();
  return sub_100018250();
}

uint64_t sub_100005124(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005144, 0, 0);
}

uint64_t sub_100005144()
{
  id v1 = [self sharedSettingsUserDefaults];
  if (v1)
  {
    uint64_t v2 = v1;
    unsigned __int8 v3 = [v1 rc_useLocationBasedNaming];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  **(unsigned char **)(v0 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000051EC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100005210, 0, 0);
}

uint64_t sub_100005210()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedSettingsUserDefaults];
  [v2 rc_setUseLocationBasedNaming:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000052AC(uint64_t a1)
{
  return sub_100007628(a1, qword_100029D90);
}

uint64_t sub_1000052D0()
{
  uint64_t v0 = sub_100008628(&qword_100024738);
  sub_100008F18(v0, qword_100029DA8);
  uint64_t v1 = sub_100008EE0(v0, (uint64_t)qword_100029DA8);
  sub_100018120();
  uint64_t v2 = sub_100018130();
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100005388()
{
  uint64_t result = swift_getKeyPath();
  qword_100029DC0 = result;
  return result;
}

uint64_t sub_1000053B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1000053BC()
{
  sub_100017FB0();
  return v1;
}

uint64_t sub_1000053F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008628(&qword_100024708);
  v3[9] = swift_task_alloc();
  sub_100008628(&qword_100024710);
  v3[10] = swift_task_alloc();
  sub_100008628(&qword_100024718);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100017F70();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008628(&qword_100024720);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1000055B4, 0, 0);
}

uint64_t sub_1000055B4()
{
  sub_100017FB0();
  unsigned __int8 v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100006900();
  *unsigned __int8 v1 = v0;
  v1[1] = sub_100005688;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100005D44, 0, &type metadata for LocationBasedNamingEntity, v2);
}

uint64_t sub_100005688()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100005784, 0, 0);
}

uint64_t sub_100005784()
{
  sub_100017FB0();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100017FB0();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000243A8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100029DC0;
  *(void *)(v0 + 168) = qword_100029DC0;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_100008F90(&qword_1000246F0, &qword_1000246F8);
  void *v3 = v0;
  v3[1] = sub_1000058DC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_1000058DC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005C80;
  }
  else {
    uint64_t v2 = sub_100005A30;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005A30()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100017FB0();
  uint64_t v7 = sub_100018290();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000182D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100004BBC();
  sub_100006C18();
  sub_100017F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100017F60();
  sub_100017F80();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100005C80()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100005D48()
{
  uint64_t v0 = sub_100008628(&qword_100024728);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000243A8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100018180();
  swift_release();
  sub_100006C18();
  sub_100008F90(&qword_100024730, &qword_100024728);
  sub_100018170();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100005EB0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100017FB0();
  *a1 = v3;
  return result;
}

uint64_t sub_100005EEC()
{
  return swift_release();
}

uint64_t (*sub_100005F34(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100017FA0();
  return sub_100005F90;
}

uint64_t sub_100005F94@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100017FB0();
  *a1 = v3;
  return result;
}

uint64_t sub_100005FD0()
{
  return sub_100017FC0();
}

uint64_t (*sub_100006008(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100017FA0();
  return sub_100005F90;
}

uint64_t sub_100006064()
{
  if (qword_1000243A8 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000060D0()
{
  unint64_t result = qword_100024518;
  if (!qword_100024518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024518);
  }
  return result;
}

unint64_t sub_100006128()
{
  unint64_t result = qword_100024520;
  if (!qword_100024520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024520);
  }
  return result;
}

uint64_t sub_10000617C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000061B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000078B4(a1, a2, a3, (void (*)(void))sub_100004BBC);
}

uint64_t sub_1000061C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100007940(&qword_100024398, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029D90, a1);
}

uint64_t sub_100006204@<X0>(uint64_t a1@<X8>)
{
  return sub_100007940(&qword_100024448, (uint64_t (*)(void))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_100029EF8, a1);
}

uint64_t sub_100006244@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000243A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024738);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029DA8);

  return sub_100008FD4(v3, a1);
}

uint64_t sub_1000062C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100009040;
  return sub_1000053F0(a1, v5, v4);
}

uint64_t sub_10000636C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000866C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100006394()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_1000063B4()
{
  unint64_t result = qword_100024530;
  if (!qword_100024530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024530);
  }
  return result;
}

unint64_t sub_10000640C()
{
  unint64_t result = qword_100024538;
  if (!qword_100024538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024538);
  }
  return result;
}

uint64_t sub_100006460()
{
  uint64_t v0 = sub_100018330();
  __chkstk_darwin(v0 - 8);
  sub_100008628(&qword_100024510);
  sub_100018320();
  sub_100008F90(&qword_1000246F0, &qword_1000246F8);
  uint64_t result = sub_100018310();
  qword_100029DC8 = result;
  return result;
}

uint64_t sub_100006568(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100006588, 0, 0);
}

uint64_t sub_100006588()
{
  if (qword_1000243B0 != -1) {
    swift_once();
  }
  **(void **)(v0 + 16) = qword_100029DC8;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  return v2();
}

unint64_t sub_100006634()
{
  unint64_t result = qword_100024548;
  if (!qword_100024548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024548);
  }
  return result;
}

uint64_t sub_100006688(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007060();
  *uint64_t v4 = v2;
  v4[1] = sub_100006738;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100006738(uint64_t a1)
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

unint64_t sub_100006850()
{
  unint64_t result = qword_100024558;
  if (!qword_100024558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024558);
  }
  return result;
}

unint64_t sub_1000068A8()
{
  unint64_t result = qword_100024560;
  if (!qword_100024560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024560);
  }
  return result;
}

unint64_t sub_100006900()
{
  unint64_t result = qword_100024568[0];
  if (!qword_100024568[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100024568);
  }
  return result;
}

uint64_t sub_100006958(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007060();
  *uint64_t v5 = v2;
  v5[1] = sub_100006A0C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100006A0C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100006B0C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100007060();
  *uint64_t v4 = v2;
  v4[1] = sub_10000903C;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100006BC0()
{
  unint64_t result = qword_100024580;
  if (!qword_100024580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024580);
  }
  return result;
}

unint64_t sub_100006C18()
{
  unint64_t result = qword_100024588;
  if (!qword_100024588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024588);
  }
  return result;
}

unint64_t sub_100006C70()
{
  unint64_t result = qword_100024590;
  if (!qword_100024590)
  {
    sub_100004C4C(qword_100024598);
    sub_100006C18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024590);
  }
  return result;
}

uint64_t sub_100006CE4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100006634();
  *unint64_t v5 = v2;
  v5[1] = sub_100006D98;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100006D98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100006D98;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100006F4C()
{
  unint64_t result = qword_1000245B0;
  if (!qword_1000245B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245B0);
  }
  return result;
}

unint64_t sub_100006FA4()
{
  unint64_t result = qword_1000245B8;
  if (!qword_1000245B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245B8);
  }
  return result;
}

unint64_t sub_100006FFC()
{
  unint64_t result = qword_1000245C0;
  if (!qword_1000245C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245C0);
  }
  return result;
}

void *sub_100007050()
{
  return &protocol witness table for String;
}

unint64_t sub_100007060()
{
  unint64_t result = qword_1000245C8;
  if (!qword_1000245C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245C8);
  }
  return result;
}

unint64_t sub_1000070B8()
{
  unint64_t result = qword_1000245D0;
  if (!qword_1000245D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245D0);
  }
  return result;
}

uint64_t sub_10000710C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100024390 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_1000246D8);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029D78);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000071B8()
{
  return 0xD000000000000015;
}

unint64_t sub_1000071D8()
{
  unint64_t result = qword_1000245D8;
  if (!qword_1000245D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245D8);
  }
  return result;
}

unint64_t sub_100007230()
{
  unint64_t result = qword_1000245E0;
  if (!qword_1000245E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245E0);
  }
  return result;
}

unint64_t sub_100007288()
{
  unint64_t result = qword_1000245E8;
  if (!qword_1000245E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000245E8);
  }
  return result;
}

void *sub_1000072DC()
{
  return &protocol witness table for String;
}

uint64_t sub_1000072E8@<X0>(uint64_t *a1@<X8>)
{
  sub_10000640C();
  uint64_t result = sub_100017F90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007328()
{
  sub_100008E8C();
  uint64_t v2 = sub_100018220();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100008F7C(v3, v0, v2, v1);
}

uint64_t sub_1000073BC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100024388 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000182C0();
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029D60);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000747C()
{
  return sub_100008F90(&qword_1000245F8, &qword_100024600);
}

uint64_t sub_1000074B8(uint64_t a1)
{
  unint64_t v2 = sub_100006900();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007508()
{
  unint64_t result = qword_100024608;
  if (!qword_100024608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024608);
  }
  return result;
}

uint64_t sub_100007560(uint64_t a1)
{
  unint64_t v2 = sub_100007288();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000075B0()
{
  unint64_t result = qword_100024610;
  if (!qword_100024610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024610);
  }
  return result;
}

uint64_t sub_100007604(uint64_t a1)
{
  return sub_100007628(a1, qword_100029DD0);
}

uint64_t sub_100007628(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100018330();
  sub_100008F18(v3, a2);
  sub_100008EE0(v3, (uint64_t)a2);
  return sub_100018320();
}

void sub_100007688(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000076D8()
{
  unint64_t result = qword_100024618;
  if (!qword_100024618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024618);
  }
  return result;
}

uint64_t sub_10000772C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008DE4();
  unint64_t v5 = sub_100008E8C();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100007798()
{
  unint64_t result = qword_100024620;
  if (!qword_100024620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024620);
  }
  return result;
}

unint64_t sub_1000077F0()
{
  unint64_t result = qword_100024628;
  if (!qword_100024628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024628);
  }
  return result;
}

unint64_t sub_100007848()
{
  unint64_t result = qword_100024630;
  if (!qword_100024630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024630);
  }
  return result;
}

uint64_t sub_10000789C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000078B4(a1, a2, a3, (void (*)(void))sub_1000076D8);
}

uint64_t sub_1000078B4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007908@<X0>(uint64_t a1@<X8>)
{
  return sub_100007940(&qword_1000243B8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029DD0, a1);
}

uint64_t sub_100007940@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008EE0(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_1000079E4()
{
  return 0;
}

uint64_t sub_1000079F0()
{
  return 1;
}

uint64_t sub_1000079FC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100008DE4();
  unint64_t v6 = sub_100008E38();
  unint64_t v7 = sub_100008E8C();
  *unint64_t v4 = v2;
  v4[1] = sub_100007AC8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007AC8()
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

uint64_t sub_100007BD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100008B00();
  *a1 = result;
  return result;
}

uint64_t sub_100007BF8(uint64_t a1)
{
  unint64_t v2 = sub_1000076D8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100007C34()
{
  sub_100008628(&qword_100024658);
  sub_100018100();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100018C00;
  sub_10000866C();
  sub_100004BBC();
  uint64_t result = sub_100018110();
  qword_100029DE8 = v0;
  return result;
}

uint64_t sub_100007D3C(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v1 = sub_100008628(&qword_100024678);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v14 = v1;
  uint64_t v15 = v2;
  __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008628(&qword_100024680);
  __chkstk_darwin(v5);
  sub_100004BBC();
  sub_1000180E0();
  v16._countAndFlagsBits = 0x206E727554;
  v16._object = (void *)0xE500000000000000;
  sub_1000180D0(v16);
  swift_getKeyPath();
  sub_100008AAC();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v17._countAndFlagsBits = 0xD000000000000016;
  v17._object = (void *)0x800000010001B7C0;
  sub_1000180D0(v17);
  sub_1000180F0();
  uint64_t v13 = sub_100018030();
  uint64_t v6 = v14;
  unint64_t v7 = *(void (**)(char *, uint64_t))(v15 + 8);
  v15 += 8;
  v7(v4, v14);
  sub_1000180E0();
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_1000180D0(v18);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v19._countAndFlagsBits = 0xD000000000000016;
  v19._object = (void *)0x800000010001B7C0;
  sub_1000180D0(v19);
  sub_1000180F0();
  uint64_t v8 = sub_100018030();
  v7(v4, v6);
  sub_100008628(&qword_100024688);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100018C10;
  *(void *)(v9 + 32) = v13;
  *(void *)(v9 + 40) = v8;
  uint64_t v10 = sub_100018020();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100008064@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100017FB0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000080A0()
{
  return sub_100017FC0();
}

uint64_t sub_1000080D8()
{
  uint64_t v0 = sub_1000180A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  char v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008AAC();
  sub_100018000();
  swift_release();
  sub_100004BBC();
  sub_100018090();
  uint64_t v4 = sub_100018080();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008628(&qword_100024668);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100018C00;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100018070();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100008240()
{
  uint64_t v0 = sub_100018050();
  uint64_t v1 = sub_100018050();
  uint64_t v2 = sub_100018050();
  uint64_t v3 = sub_100018050();
  sub_100008628(&qword_100024670);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100018C20;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_100018040();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_100008308()
{
  qword_100029DF0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000831C(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_1000243C0);
}

uint64_t sub_100008344(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_1000243C8);
}

uint64_t sub_100008368(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for LocationBasedNamingAssistantIntents()
{
  return &type metadata for LocationBasedNamingAssistantIntents;
}

ValueMetadata *type metadata accessor for OpenLocationBasedNamingEntity()
{
  return &type metadata for OpenLocationBasedNamingEntity;
}

ValueMetadata *type metadata accessor for LocationBasedNamingEntity.LocationBasedNamingEntityQuery()
{
  return &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery;
}

ValueMetadata *type metadata accessor for LocationBasedNamingEntity()
{
  return &type metadata for LocationBasedNamingEntity;
}

uint64_t destroy for LocationBasedNamingEntity.UpdateIntent_value()
{
  swift_release();

  return swift_release();
}

void *_s33VoiceMemosSettingsWidgetExtension25LocationBasedNamingEntityV18UpdateIntent_valueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LocationBasedNamingEntity.UpdateIntent_value(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for LocationBasedNamingEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for LocationBasedNamingEntity.UpdateIntent_value(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationBasedNamingEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocationBasedNamingEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LocationBasedNamingEntity.UpdateIntent_value()
{
  return &type metadata for LocationBasedNamingEntity.UpdateIntent_value;
}

uint64_t sub_1000085B0()
{
  return sub_100008F90(&qword_100024640, &qword_100024648);
}

uint64_t sub_1000085EC()
{
  return sub_100008F90(&qword_100024650, &qword_100024648);
}

uint64_t sub_100008628(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000866C()
{
  uint64_t v0 = sub_100008628(&qword_100024690);
  __chkstk_darwin(v0 - 8);
  v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100018260();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008628(&qword_100024698);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v13;
  uint64_t v14 = sub_100018330();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008628(&qword_1000246A8);
  sub_100018320();
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_100017F70();
  Swift::String v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  Swift::String v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_100006900();
  Swift::String v19 = v23;
  uint64_t v24 = sub_100017FE0();
  sub_100008628(&qword_1000246B0);
  sub_100018320();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100018480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100017FF0();
  return v24;
}

unint64_t sub_100008AAC()
{
  unint64_t result = qword_100024660;
  if (!qword_100024660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024660);
  }
  return result;
}

uint64_t sub_100008B00()
{
  v17[0] = sub_100018260();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_100024698);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100018330();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008628(&qword_1000246A8);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100017F70();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_100006900();
  return sub_100017FE0();
}

unint64_t sub_100008DE4()
{
  unint64_t result = qword_1000246B8;
  if (!qword_1000246B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000246B8);
  }
  return result;
}

unint64_t sub_100008E38()
{
  unint64_t result = qword_1000246C0;
  if (!qword_1000246C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000246C0);
  }
  return result;
}

unint64_t sub_100008E8C()
{
  unint64_t result = qword_1000246C8;
  if (!qword_1000246C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000246C8);
  }
  return result;
}

uint64_t sub_100008EE0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008F18(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008F7C(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100008F90(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004C4C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008628(&qword_100024738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009048()
{
  unint64_t result = qword_100024740;
  if (!qword_100024740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024740);
  }
  return result;
}

uint64_t sub_10000909C()
{
  return sub_100008F90(&qword_100024748, &qword_100024750);
}

uint64_t sub_1000090D8(uint64_t a1)
{
  return sub_10000ACB8(a1, qword_100029DF8);
}

uint64_t sub_1000090FC()
{
  uint64_t v0 = sub_100008628(&qword_1000246D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018330();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100018320();
  sub_100018320();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100018190();
  uint64_t v9 = sub_1000181A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_100018320();
  return sub_1000181C0();
}

uint64_t sub_100009360()
{
  uint64_t v0 = sub_100008628(&qword_100024940);
  sub_100008F18(v0, qword_100029E10);
  sub_100008EE0(v0, (uint64_t)qword_100029E10);
  if (qword_100024440 != -1) {
    swift_once();
  }
  sub_10000A900();
  swift_bridgeObjectRetain();
  return sub_100018250();
}

uint64_t sub_10000941C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000943C, 0, 0);
}

uint64_t sub_10000943C()
{
  id v1 = [self sharedSettingsUserDefaults];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 rc_recentlyDeletedWindow];

    char v4 = 0;
    switch((unint64_t)v3)
    {
      case 0uLL:
        break;
      case 1uLL:
        char v4 = 1;
        break;
      case 7uLL:
        char v4 = 2;
        break;
      case 0x1EuLL:
        goto LABEL_4;
      default:
        char v4 = 4;
        break;
    }
  }
  else
  {
LABEL_4:
    char v4 = 3;
  }
  **(unsigned char **)(v0 + 16) = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000095A8(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000095CC, 0, 0);
}

uint64_t sub_1000095CC()
{
  id v1 = [self sharedSettingsUserDefaults];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 rc_setRecentlyDeletedWindow:qword_10001A028[*(char *)(v0 + 16)]];
  }
  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100009670(uint64_t a1)
{
  return sub_100007628(a1, qword_100029E28);
}

uint64_t sub_100009694()
{
  uint64_t v0 = sub_100008628(&qword_100024738);
  sub_100008F18(v0, qword_100029E40);
  uint64_t v1 = sub_100008EE0(v0, (uint64_t)qword_100029E40);
  sub_100018120();
  uint64_t v2 = sub_100018130();
  id v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000974C()
{
  uint64_t result = swift_getKeyPath();
  qword_100029E58 = result;
  return result;
}

uint64_t sub_100009774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008628(&qword_100024708);
  v3[9] = swift_task_alloc();
  sub_100008628(&qword_100024710);
  v3[10] = swift_task_alloc();
  sub_100008628(&qword_100024980);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100017F70();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008628(&qword_100024988);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100009938, 0, 0);
}

uint64_t sub_100009938()
{
  sub_100017FB0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_10000A900();
  *uint64_t v1 = v0;
  v1[1] = sub_100009A0C;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100009FFC, 0, &type metadata for ClearDeletedEntity, v2);
}

uint64_t sub_100009A0C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100009B08, 0, 0);
}

uint64_t sub_100009B08()
{
  sub_100017FB0();
  uint64_t v1 = v0[3];
  v0[4] = v1;
  v0[20] = v1;
  sub_100017FB0();
  if (qword_1000243F0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100029E58;
  v0[21] = qword_100029E58;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[22] = v3;
  uint64_t v4 = sub_100008F90(&qword_100024968, &qword_100024970);
  void *v3 = v0;
  v3[1] = sub_100009C58;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 24, v2, &type metadata for ClearDeletedEntity.IntentClearDeleted, v4);
}

uint64_t sub_100009C58()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005C80;
  }
  else {
    uint64_t v2 = sub_100009DAC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100009DAC()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100017FB0();
  uint64_t v7 = sub_100018290();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000182D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_100009048();
  sub_10000AB14();
  sub_100017F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100017F60();
  sub_100017F80();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10000A000()
{
  uint64_t v0 = sub_100008628(&qword_100024990);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000243F0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100018180();
  swift_release();
  sub_10000AB14();
  sub_100008F90(&qword_100024998, &qword_100024990);
  sub_100018170();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000A168()
{
  if (qword_1000243F0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000A1C8()
{
  unint64_t result = qword_100024758;
  if (!qword_100024758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024758);
  }
  return result;
}

unint64_t sub_10000A220()
{
  unint64_t result = qword_100024760;
  if (!qword_100024760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024760);
  }
  return result;
}

uint64_t sub_10000A274()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000A2A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BCF4(a1, a2, a3, (void (*)(void))sub_100009048);
}

uint64_t sub_10000A2D4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_1000243E0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029E28, a1);
}

uint64_t sub_10000A30C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_100024460, (uint64_t (*)(void))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_100029F40, a1);
}

uint64_t sub_10000A344@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000243E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024738);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029E40);

  return sub_100008FD4(v3, a1);
}

uint64_t sub_10000A3C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100009040;
  return sub_100009774(a1, v5, v4);
}

uint64_t sub_10000A46C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000C88C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000A494()
{
  return 0xD000000000000023;
}

unint64_t sub_10000A4B4()
{
  unint64_t result = qword_100024770;
  if (!qword_100024770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024770);
  }
  return result;
}

unint64_t sub_10000A50C()
{
  unint64_t result = qword_100024778;
  if (!qword_100024778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024778);
  }
  return result;
}

uint64_t sub_10000A560()
{
  uint64_t v0 = sub_100018330();
  __chkstk_darwin(v0 - 8);
  sub_100008628(&qword_100024750);
  sub_100018320();
  sub_100008F90(&qword_100024968, &qword_100024970);
  sub_10000B260();
  uint64_t result = sub_100018300();
  qword_100029E60 = result;
  return result;
}

uint64_t sub_10000A67C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000A69C, 0, 0);
}

uint64_t sub_10000A69C()
{
  if (qword_1000243F8 != -1) {
    swift_once();
  }
  **(void **)(v0 + 16) = qword_100029E60;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  return v2();
}

unint64_t sub_10000A748()
{
  unint64_t result = qword_100024788;
  if (!qword_100024788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024788);
  }
  return result;
}

uint64_t sub_10000A79C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000B5B8();
  *uint64_t v4 = v2;
  v4[1] = sub_100006738;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000A850()
{
  unint64_t result = qword_100024798;
  if (!qword_100024798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024798);
  }
  return result;
}

unint64_t sub_10000A8A8()
{
  unint64_t result = qword_1000247A0;
  if (!qword_1000247A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000247A0);
  }
  return result;
}

unint64_t sub_10000A900()
{
  unint64_t result = qword_1000247A8[0];
  if (!qword_1000247A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000247A8);
  }
  return result;
}

uint64_t sub_10000A954(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000B5B8();
  *unint64_t v5 = v2;
  v5[1] = sub_100006A0C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000AA08(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_10000B5B8();
  *uint64_t v4 = v2;
  v4[1] = sub_10000903C;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000AABC()
{
  unint64_t result = qword_1000247C0;
  if (!qword_1000247C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000247C0);
  }
  return result;
}

unint64_t sub_10000AB14()
{
  unint64_t result = qword_1000247C8;
  if (!qword_1000247C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000247C8);
  }
  return result;
}

unint64_t sub_10000AB6C()
{
  unint64_t result = qword_1000247D0;
  if (!qword_1000247D0)
  {
    sub_100004C4C(qword_1000247D8);
    sub_10000AB14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000247D0);
  }
  return result;
}

uint64_t sub_10000ABE0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000A748();
  *unint64_t v5 = v2;
  v5[1] = sub_100006D98;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000AC94(uint64_t a1)
{
  return sub_10000ACB8(a1, qword_100029E68);
}

uint64_t sub_10000ACB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018330();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = sub_1000182C0();
  sub_100008F18(v8, a2);
  sub_100008EE0(v8, (uint64_t)a2);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  return sub_1000182B0();
}

BOOL sub_10000AE20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_10000AE38()
{
  unint64_t result = qword_1000247F0;
  if (!qword_1000247F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000247F0);
  }
  return result;
}

Swift::Int sub_10000AE8C()
{
  Swift::UInt v1 = *v0;
  sub_1000184A0();
  sub_1000184B0(v1);
  return sub_1000184C0();
}

void sub_10000AED4()
{
  sub_1000184B0(*v0);
}

Swift::Int sub_10000AF00()
{
  Swift::UInt v1 = *v0;
  sub_1000184A0();
  sub_1000184B0(v1);
  return sub_1000184C0();
}

unint64_t sub_10000AF44@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000D250(*a1);
  *a2 = result;
  return result;
}

void sub_10000AF70(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_10000AF80()
{
  unint64_t result = qword_1000247F8;
  if (!qword_1000247F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000247F8);
  }
  return result;
}

unint64_t sub_10000AFD8()
{
  unint64_t result = qword_100024800;
  if (!qword_100024800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024800);
  }
  return result;
}

unint64_t sub_10000B030()
{
  unint64_t result = qword_100024808;
  if (!qword_100024808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024808);
  }
  return result;
}

void *sub_10000B084()
{
  return &protocol witness table for Int;
}

void *sub_10000B090()
{
  return &protocol witness table for Int;
}

unint64_t sub_10000B0A0()
{
  unint64_t result = qword_100024810;
  if (!qword_100024810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024810);
  }
  return result;
}

unint64_t sub_10000B0F8()
{
  unint64_t result = qword_100024818;
  if (!qword_100024818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024818);
  }
  return result;
}

unint64_t sub_10000B150()
{
  unint64_t result = qword_100024820;
  if (!qword_100024820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024820);
  }
  return result;
}

unint64_t sub_10000B1A8()
{
  unint64_t result = qword_100024828;
  if (!qword_100024828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024828);
  }
  return result;
}

uint64_t sub_10000B1FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_100024400, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100029E68, a1);
}

uint64_t sub_10000B234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BCF4(a1, a2, a3, (void (*)(void))sub_10000B260);
}

unint64_t sub_10000B260()
{
  unint64_t result = qword_100024830;
  if (!qword_100024830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024830);
  }
  return result;
}

uint64_t sub_10000B2B4(uint64_t a1)
{
  unint64_t v2 = sub_10000B260();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000B304()
{
  unint64_t result = qword_100024838;
  if (!qword_100024838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024838);
  }
  return result;
}

unint64_t sub_10000B35C()
{
  unint64_t result = qword_100024840;
  if (!qword_100024840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024840);
  }
  return result;
}

unint64_t sub_10000B3B4()
{
  unint64_t result = qword_100024848;
  if (!qword_100024848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024848);
  }
  return result;
}

uint64_t sub_10000B40C(uint64_t a1)
{
  unint64_t v2 = sub_10000B1A8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000B458()
{
  return sub_100008F90(&qword_100024850, &qword_100024858);
}

void sub_10000B494(void *a1@<X8>)
{
  *a1 = &off_100020F08;
}

unint64_t sub_10000B4A8()
{
  unint64_t result = qword_100024860;
  if (!qword_100024860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024860);
  }
  return result;
}

unint64_t sub_10000B500()
{
  unint64_t result = qword_100024868;
  if (!qword_100024868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024868);
  }
  return result;
}

unint64_t sub_10000B558()
{
  unint64_t result = qword_100024870;
  if (!qword_100024870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024870);
  }
  return result;
}

unint64_t sub_10000B5B8()
{
  unint64_t result = qword_100024878;
  if (!qword_100024878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024878);
  }
  return result;
}

unint64_t sub_10000B610()
{
  unint64_t result = qword_100024880;
  if (!qword_100024880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024880);
  }
  return result;
}

uint64_t sub_10000B664@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000243D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024940);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029E10);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000B714()
{
  unint64_t result = qword_100024888;
  if (!qword_100024888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024888);
  }
  return result;
}

unint64_t sub_10000B76C()
{
  unint64_t result = qword_100024890;
  if (!qword_100024890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024890);
  }
  return result;
}

unint64_t sub_10000B7C4()
{
  unint64_t result = qword_100024898;
  if (!qword_100024898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024898);
  }
  return result;
}

uint64_t sub_10000B818@<X0>(uint64_t *a1@<X8>)
{
  sub_10000A50C();
  uint64_t result = sub_100017F90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000B858()
{
  sub_10000D5EC();
  uint64_t v2 = sub_100018220();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100008F7C(v3, v0, v2, v1);
}

uint64_t sub_10000B8EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000243D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000182C0();
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029DF8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000B9AC()
{
  return sub_100008F90(&qword_1000248A8, &qword_1000248B0);
}

uint64_t sub_10000B9E8(uint64_t a1)
{
  unint64_t v2 = sub_10000A900();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000BA38()
{
  unint64_t result = qword_1000248B8;
  if (!qword_1000248B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000248B8);
  }
  return result;
}

uint64_t sub_10000BA90(uint64_t a1)
{
  unint64_t v2 = sub_10000B7C4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000BAE0()
{
  unint64_t result = qword_1000248C0;
  if (!qword_1000248C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000248C0);
  }
  return result;
}

uint64_t sub_10000BB34(uint64_t a1)
{
  return sub_100007628(a1, qword_100029E80);
}

unint64_t sub_10000BB5C()
{
  unint64_t result = qword_1000248C8;
  if (!qword_1000248C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000248C8);
  }
  return result;
}

uint64_t sub_10000BBB0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000D544();
  unint64_t v5 = sub_10000D5EC();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000BC1C()
{
  unint64_t result = qword_1000248D0;
  if (!qword_1000248D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000248D0);
  }
  return result;
}

unint64_t sub_10000BC74()
{
  unint64_t result = qword_1000248D8;
  if (!qword_1000248D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000248D8);
  }
  return result;
}

uint64_t sub_10000BCC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BCF4(a1, a2, a3, (void (*)(void))sub_10000BB5C);
}

uint64_t sub_10000BCF4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BD3C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_100024408, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029E80, a1);
}

uint64_t sub_10000BD74@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100008EE0(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_10000BE18(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_10000D544();
  unint64_t v6 = sub_10000D598();
  unint64_t v7 = sub_10000D5EC();
  *unint64_t v4 = v2;
  v4[1] = sub_100007AC8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000BEE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000D260();
  *a1 = result;
  return result;
}

uint64_t sub_10000BF0C(uint64_t a1)
{
  unint64_t v2 = sub_10000BB5C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000BF48()
{
  sub_100008628(&qword_100024658);
  sub_100018100();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100018C00;
  sub_10000C88C();
  sub_100009048();
  uint64_t result = sub_100018110();
  qword_100029E98 = v0;
  return result;
}

uint64_t sub_10000C050(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v23 = sub_100018010();
  uint64_t v28 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  unint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_100024900);
  uint64_t v21 = v3;
  uint64_t v29 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008628(&qword_100024908);
  __chkstk_darwin(v6);
  sub_100009048();
  sub_1000180E0();
  v30._countAndFlagsBits = 0x6564207261656C43;
  v30._object = (void *)0xEE0020646574656CLL;
  sub_1000180D0(v30);
  swift_getKeyPath();
  unint64_t v26 = sub_10000B150();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_1000180D0(v31);
  sub_1000180F0();
  uint64_t v7 = sub_100018030();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v29 + 8);
  v29 += 8;
  uint64_t v24 = v7;
  uint64_t v25 = v8;
  v8(v5, v3);
  sub_1000180E0();
  v32._countAndFlagsBits = 0x207974706D45;
  v32._object = (void *)0xE600000000000000;
  sub_1000180D0(v32);
  unsigned int v20 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v9 = v28;
  Swift::String v19 = *(void (**)(char *))(v28 + 104);
  uint64_t v10 = v23;
  v19(v2);
  sub_1000180B0();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v28 = v9 + 8;
  Swift::String v18 = v11;
  v11(v2, v10);
  v33._countAndFlagsBits = 0x20687361727420;
  v33._object = (void *)0xE700000000000000;
  sub_1000180D0(v33);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_1000180D0(v34);
  sub_1000180F0();
  uint64_t v22 = sub_100018030();
  uint64_t v12 = v21;
  v25(v5, v21);
  sub_1000180E0();
  v35._countAndFlagsBits = 0x207974706D65;
  v35._object = (void *)0xE600000000000000;
  sub_1000180D0(v35);
  ((void (*)(char *, void, uint64_t))v19)(v2, v20, v10);
  sub_1000180B0();
  v18(v2, v10);
  v36._countAndFlagsBits = 0x206E696220;
  v36._object = (void *)0xE500000000000000;
  sub_1000180D0(v36);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  sub_1000180D0(v37);
  sub_1000180F0();
  uint64_t v13 = sub_100018030();
  v25(v5, v12);
  sub_100008628(&qword_100024910);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000194D0;
  uint64_t v15 = v22;
  *(void *)(v14 + 32) = v24;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v13;
  uint64_t v16 = sub_100018020();
  swift_bridgeObjectRelease();
  return v16;
}

void sub_10000C5B4()
{
  qword_100029EA0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000C5C8(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_100024410);
}

uint64_t sub_10000C5EC(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_100024418);
}

ValueMetadata *type metadata accessor for ClearDeletedIntents()
{
  return &type metadata for ClearDeletedIntents;
}

ValueMetadata *type metadata accessor for OpenClearDeletedEntity()
{
  return &type metadata for OpenClearDeletedEntity;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity.ClearDeletedEntityQuery()
{
  return &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery;
}

unsigned char *initializeBufferWithCopyOfBuffer for ClearDeletedEntity.IntentClearDeleted(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ClearDeletedEntity.IntentClearDeleted(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ClearDeletedEntity.IntentClearDeleted(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000C7ACLL);
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

uint64_t sub_10000C7D4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000C7DC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity.IntentClearDeleted()
{
  return &type metadata for ClearDeletedEntity.IntentClearDeleted;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity()
{
  return &type metadata for ClearDeletedEntity;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity.UpdateIntent_value()
{
  return &type metadata for ClearDeletedEntity.UpdateIntent_value;
}

uint64_t sub_10000C814()
{
  return sub_100008F90(&qword_1000248E8, &qword_1000248F0);
}

uint64_t sub_10000C850()
{
  return sub_100008F90(&qword_1000248F8, &qword_1000248F0);
}

uint64_t sub_10000C88C()
{
  uint64_t v28 = sub_100018260();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100008628(&qword_100024698);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  BOOL v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100018330();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100008628(&qword_100024918);
  sub_100018320();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_100017F70();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  Swift::String v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  uint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  Swift::String v18 = v27;
  v17(v27);
  sub_10000A900();
  uint64_t v23 = sub_100017FE0();
  sub_100008628(&qword_100024920);
  sub_100018320();
  v25(v10, 1, 1, v26);
  char v29 = 5;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_10000B260();
  sub_100017FD0();
  return v23;
}

uint64_t sub_10000CC78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100017FB0();
  *a1 = v3;
  return result;
}

uint64_t sub_10000CCB4()
{
  return sub_100017FC0();
}

unint64_t sub_10000CCEC()
{
  uint64_t v0 = sub_100008628(&qword_1000246D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100018330();
  uint64_t v6 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  sub_100008628(&qword_100024948);
  uint64_t v7 = sub_100008628(&qword_100024950);
  uint64_t v8 = *(void *)(*(void *)(v7 - 8) + 72);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v32 = 4 * v8;
  uint64_t v10 = v8;
  uint64_t v38 = v8;
  uint64_t v11 = swift_allocObject();
  uint64_t v33 = v11;
  *(_OWORD *)(v11 + 16) = xmmword_1000194E0;
  unint64_t v40 = v11 + v9;
  uint64_t v35 = v7;
  *(unsigned char *)(v11 + v9) = 0;
  sub_100018320();
  Swift::String v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v37 = v6 + 56;
  uint64_t v12 = v39;
  v36(v5, 1, 1, v39);
  uint64_t v13 = sub_1000181A0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v34 = v14 + 56;
  v15(v2, 1, 1, v13);
  sub_1000181D0();
  unint64_t v16 = v40;
  uint64_t v31 = v40 + v10 + *(int *)(v7 + 48);
  *(unsigned char *)(v40 + v10) = 1;
  sub_100018320();
  Swift::String v17 = v36;
  v36(v5, 1, 1, v12);
  uint64_t v30 = v15;
  v15(v2, 1, 1, v13);
  sub_1000181D0();
  uint64_t v31 = 2 * v38;
  Swift::String v18 = (unsigned char *)(v16 + 2 * v38);
  uint64_t v19 = v35;
  char v29 = &v18[*(int *)(v35 + 48)];
  *Swift::String v18 = 2;
  sub_100018320();
  uint64_t v20 = v39;
  v17(v5, 1, 1, v39);
  v15(v2, 1, 1, v13);
  sub_1000181D0();
  unint64_t v21 = v40;
  unsigned int v22 = (unsigned char *)(v40 + v31 + v38);
  uint64_t v38 = (uint64_t)&v22[*(int *)(v19 + 48)];
  *unsigned int v22 = 3;
  sub_100018320();
  uint64_t v23 = v20;
  uint64_t v24 = v20;
  uint64_t v25 = v36;
  v36(v5, 1, 1, v24);
  uint64_t v26 = v30;
  v30(v2, 1, 1, v13);
  sub_1000181D0();
  uint64_t v38 = v21 + v32 + *(int *)(v35 + 48);
  *(unsigned char *)(v21 + v32) = 4;
  sub_100018320();
  v25(v5, 1, 1, v23);
  v26(v2, 1, 1, v13);
  sub_1000181D0();
  unint64_t v27 = sub_100016E10(v33);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v27;
}

unint64_t sub_10000D250(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

uint64_t sub_10000D260()
{
  v17[0] = sub_100018260();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_100024698);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100018330();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008628(&qword_100024918);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100017F70();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_10000A900();
  return sub_100017FE0();
}

unint64_t sub_10000D544()
{
  unint64_t result = qword_100024928;
  if (!qword_100024928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024928);
  }
  return result;
}

unint64_t sub_10000D598()
{
  unint64_t result = qword_100024930;
  if (!qword_100024930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024930);
  }
  return result;
}

unint64_t sub_10000D5EC()
{
  unint64_t result = qword_100024938;
  if (!qword_100024938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024938);
  }
  return result;
}

uint64_t sub_10000D640@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

ValueMetadata *type metadata accessor for ClearDeletedWidget()
{
  return &type metadata for ClearDeletedWidget;
}

uint64_t sub_10000D65C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D678@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_100018330();
  __chkstk_darwin(v1 - 8);
  uint64_t v35 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100018400();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100018350();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100018440();
  __chkstk_darwin(v5 - 8);
  uint64_t v32 = sub_100008628(&qword_1000249A0);
  uint64_t v29 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100008628(&qword_1000249A8);
  uint64_t v30 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  unint64_t v27 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100008628(&qword_1000249B0);
  uint64_t v31 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v28 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018430();
  sub_100018340();
  v25[1] = sub_100018460();
  swift_getKeyPath();
  sub_1000183F0();
  sub_100008628(&qword_1000249B8);
  sub_100008628(&qword_1000249C0);
  sub_10000B260();
  sub_10000E10C();
  sub_10000A50C();
  sub_100008F90(&qword_1000249D0, &qword_1000249B8);
  sub_10000E160();
  uint64_t v26 = v7;
  sub_100018410();
  if (qword_1000243D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000182C0();
  sub_100008EE0(v10, (uint64_t)qword_100029DF8);
  swift_beginAccess();
  sub_1000182A0();
  swift_endAccess();
  uint64_t v11 = sub_1000183D0();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_100008F90(&qword_1000249E0, &qword_1000249A0);
  Swift::String v17 = v26;
  Swift::String v18 = v27;
  uint64_t v19 = v32;
  sub_1000183A0();
  sub_10000E1CC(v11, v13, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v19);
  uint64_t v37 = v19;
  uint64_t v38 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v21 = v28;
  uint64_t v22 = v34;
  sub_1000183B0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v22);
  uint64_t v37 = v22;
  uint64_t v38 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v33;
  sub_100018390();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v21, v23);
}

uint64_t sub_10000DC94()
{
  uint64_t v0 = sub_100018380();

  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_10000DCF4@<X0>(uint64_t a1@<X8>)
{
  sub_100018380();
  uint64_t result = sub_1000183C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10000DD6C@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100008628(&qword_1000249E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100018330();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v33 - v12;
  __chkstk_darwin(v11);
  char v15 = (char *)&v33 - v14;
  unsigned __int8 v16 = *a1;
  unint64_t v17 = sub_10000CCEC();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_100016BD8(v16), (v19 & 1) != 0))
  {
    unint64_t v20 = v18;
    uint64_t v34 = *(void *)(v17 + 56);
    uint64_t v21 = sub_1000181E0();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v35 = v7;
    uint64_t v23 = v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))(v6, v34 + *(void *)(v22 + 72) * v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v6, 0, 1, v21);
    uint64_t v7 = v35;
  }
  else
  {
    uint64_t v21 = sub_1000181E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v6, 1, 1, v21);
  }
  swift_bridgeObjectRelease();
  sub_1000181E0();
  uint64_t v24 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v21) == 1)
  {
    uint64_t result = sub_10000E1DC((uint64_t)v6);
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  else
  {
    sub_1000181B0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v21);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v15, v13, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v36, v15, v7);
    uint64_t v26 = sub_1000183D0();
    uint64_t v27 = v30;
    uint64_t v29 = v31;
    uint64_t v28 = v32 & 1;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  *a2 = v26;
  a2[1] = v27;
  a2[2] = v28;
  a2[3] = v29;
  return result;
}

unint64_t sub_10000E10C()
{
  unint64_t result = qword_1000249C8;
  if (!qword_1000249C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000249C8);
  }
  return result;
}

unint64_t sub_10000E160()
{
  unint64_t result = qword_1000249D8;
  if (!qword_1000249D8)
  {
    sub_100004C4C(&qword_1000249C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000249D8);
  }
  return result;
}

uint64_t sub_10000E1CC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000E1DC(uint64_t a1)
{
  uint64_t v2 = sub_100008628(&qword_1000249E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E23C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E32C()
{
  uint64_t v0 = sub_100008628(&qword_1000249F8);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000E3AC()
{
  unint64_t result = qword_1000249F0;
  if (!qword_1000249F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000249F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceMemosSettingsWidgetBundle()
{
  return &type metadata for VoiceMemosSettingsWidgetBundle;
}

uint64_t sub_10000E410()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000E430()
{
  unint64_t result = qword_100024A00;
  if (!qword_100024A00)
  {
    sub_100004C4C(&qword_100024A08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A00);
  }
  return result;
}

uint64_t sub_10000E48C()
{
  uint64_t result = sub_100018450();
  qword_100029EA8 = result;
  unk_100029EB0 = v1;
  return result;
}

void sub_10000E4B8(uint64_t a1)
{
}

void sub_10000E4E0(uint64_t a1)
{
}

void sub_10000E508(uint64_t a1)
{
}

void sub_10000E530(uint64_t a1)
{
}

void sub_10000E558(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, void *a5)
{
  if (qword_100024420 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100029EA8;
  uint64_t v10 = unk_100029EB0;
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = a2;
  v11._object = a3;
  sub_100018470(v11);
  *a4 = v9;
  *a5 = v10;
}

ValueMetadata *type metadata accessor for StereoRecordingWidget()
{
  return &type metadata for StereoRecordingWidget;
}

uint64_t sub_10000E60C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000E628@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v1 = sub_100018330();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100008628(&qword_100024A10);
  uint64_t v21 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100008628(&qword_100024A18);
  uint64_t v22 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008628(&qword_100024A20);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008628(&qword_1000249B8);
  sub_10000EBC4();
  sub_100008F90(&qword_1000249D0, &qword_1000249B8);
  sub_100018420();
  if (qword_100024468 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000182C0();
  sub_100008EE0(v10, (uint64_t)qword_100029F58);
  swift_beginAccess();
  sub_1000182A0();
  swift_endAccess();
  uint64_t v11 = sub_1000183D0();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_100008F90(&qword_100024A30, &qword_100024A10);
  sub_1000183A0();
  sub_10000E1CC(v11, v13, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  uint64_t v27 = v2;
  uint64_t v28 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v25;
  sub_1000183B0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v18);
  uint64_t v27 = v18;
  uint64_t v28 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v24;
  sub_100018390();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v9, v19);
}

uint64_t sub_10000EABC()
{
  uint64_t v0 = sub_100018380();

  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_10000EB1C@<X0>(uint64_t a1@<X8>)
{
  sub_100018380();
  uint64_t result = sub_1000183C0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

unint64_t sub_10000EBC4()
{
  unint64_t result = qword_100024A28;
  if (!qword_100024A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A28);
  }
  return result;
}

uint64_t sub_10000EC18()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for AudioQualityWidget()
{
  return &type metadata for AudioQualityWidget;
}

uint64_t sub_10000ED18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000ED34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_100018330();
  __chkstk_darwin(v1 - 8);
  uint64_t v35 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100018400();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100018350();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100018440();
  __chkstk_darwin(v5 - 8);
  uint64_t v32 = sub_100008628(&qword_1000249A0);
  uint64_t v29 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100008628(&qword_1000249A8);
  uint64_t v30 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v27 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100008628(&qword_1000249B0);
  uint64_t v31 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v28 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018430();
  sub_100018340();
  v25[1] = sub_100018460();
  swift_getKeyPath();
  sub_1000183F0();
  sub_100008628(&qword_1000249B8);
  sub_100008628(&qword_1000249C0);
  sub_10000F750();
  sub_10000F7A4();
  sub_10000F7F8();
  sub_100008F90(&qword_1000249D0, &qword_1000249B8);
  sub_10000E160();
  uint64_t v26 = v7;
  sub_100018410();
  if (qword_1000244B0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000182C0();
  sub_100008EE0(v10, (uint64_t)qword_100029FF0);
  swift_beginAccess();
  sub_1000182A0();
  swift_endAccess();
  uint64_t v11 = sub_1000183D0();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_100008F90(&qword_1000249E0, &qword_1000249A0);
  unint64_t v17 = v26;
  uint64_t v18 = v27;
  uint64_t v19 = v32;
  sub_1000183A0();
  sub_10000E1CC(v11, v13, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v19);
  uint64_t v37 = v19;
  uint64_t v38 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v21 = v28;
  uint64_t v22 = v34;
  sub_1000183B0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v22);
  uint64_t v37 = v22;
  uint64_t v38 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v33;
  sub_100018390();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v21, v23);
}

uint64_t sub_10000F350()
{
  uint64_t v0 = sub_100018380();

  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_10000F3B0@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100008628(&qword_1000249E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100018330();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v33 - v12;
  __chkstk_darwin(v11);
  char v15 = (char *)&v33 - v14;
  char v16 = *a1;
  unint64_t v17 = sub_1000171A0();
  if (*(void *)(v17 + 16) && (unint64_t v18 = sub_100016C44(v16), (v19 & 1) != 0))
  {
    unint64_t v20 = v18;
    uint64_t v34 = *(void *)(v17 + 56);
    uint64_t v21 = sub_1000181E0();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v35 = v7;
    uint64_t v23 = v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))(v6, v34 + *(void *)(v22 + 72) * v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v6, 0, 1, v21);
    uint64_t v7 = v35;
  }
  else
  {
    uint64_t v21 = sub_1000181E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v6, 1, 1, v21);
  }
  swift_bridgeObjectRelease();
  sub_1000181E0();
  uint64_t v24 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v21) == 1)
  {
    uint64_t result = sub_10000E1DC((uint64_t)v6);
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  else
  {
    sub_1000181B0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v21);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v15, v13, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v36, v15, v7);
    uint64_t v26 = sub_1000183D0();
    uint64_t v27 = v30;
    uint64_t v29 = v31;
    uint64_t v28 = v32 & 1;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  *a2 = v26;
  a2[1] = v27;
  a2[2] = v28;
  a2[3] = v29;
  return result;
}

unint64_t sub_10000F750()
{
  unint64_t result = qword_100024A38;
  if (!qword_100024A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A38);
  }
  return result;
}

unint64_t sub_10000F7A4()
{
  unint64_t result = qword_100024A40;
  if (!qword_100024A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A40);
  }
  return result;
}

unint64_t sub_10000F7F8()
{
  unint64_t result = qword_100024A48;
  if (!qword_100024A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A48);
  }
  return result;
}

uint64_t sub_10000F84C(uint64_t a1)
{
  return sub_10000F87C(a1, qword_100029EF8);
}

uint64_t sub_10000F858(uint64_t a1)
{
  return sub_10000F87C(a1, qword_100029F10);
}

uint64_t sub_10000F864(uint64_t a1)
{
  return sub_10000F87C(a1, qword_100029F28);
}

uint64_t sub_10000F870(uint64_t a1)
{
  return sub_10000F87C(a1, qword_100029F40);
}

uint64_t sub_10000F87C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000182E0();
  sub_100008F18(v3, a2);
  uint64_t v4 = sub_100008EE0(v3, (uint64_t)a2);
  uint64_t v5 = enum case for IntentAuthenticationPolicy.requiresAuthentication(_:);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v6(v4, v5, v3);
}

ValueMetadata *type metadata accessor for LocationBasedNamingWidget()
{
  return &type metadata for LocationBasedNamingWidget;
}

uint64_t sub_10000F910()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F92C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v1 = sub_100018330();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100008628(&qword_100024A10);
  uint64_t v21 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100008628(&qword_100024A18);
  uint64_t v22 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008628(&qword_100024A20);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008628(&qword_1000249B8);
  sub_10000640C();
  sub_100008F90(&qword_1000249D0, &qword_1000249B8);
  sub_100018420();
  if (qword_100024388 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000182C0();
  sub_100008EE0(v10, (uint64_t)qword_100029D60);
  swift_beginAccess();
  sub_1000182A0();
  swift_endAccess();
  uint64_t v11 = sub_1000183D0();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_100008F90(&qword_100024A30, &qword_100024A10);
  sub_1000183A0();
  sub_10000E1CC(v11, v13, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  uint64_t v27 = v2;
  uint64_t v28 = v16;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v25;
  sub_1000183B0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v18);
  uint64_t v27 = v18;
  uint64_t v28 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v24;
  sub_100018390();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v9, v19);
}

uint64_t sub_10000FDC0()
{
  uint64_t v0 = sub_100018380();

  return Label<>.init(_:systemImage:)(v0);
}

unint64_t sub_10000FE2C()
{
  unint64_t result = qword_100024A50;
  if (!qword_100024A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A50);
  }
  return result;
}

uint64_t sub_10000FE80()
{
  return sub_100008F90(&qword_100024A58, &qword_100024A60);
}

uint64_t sub_10000FEBC()
{
  uint64_t v0 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100018330();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000182C0();
  sub_100008F18(v5, qword_100029F58);
  sub_100008EE0(v5, (uint64_t)qword_100029F58);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000182B0();
}

uint64_t sub_100010028()
{
  uint64_t v0 = sub_100008628(&qword_1000246D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018330();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100018320();
  sub_100018320();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100018190();
  uint64_t v9 = sub_1000181A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_100018320();
  return sub_1000181C0();
}

uint64_t sub_100010288()
{
  uint64_t v0 = sub_100008628(&qword_100024BD0);
  sub_100008F18(v0, qword_100029F70);
  sub_100008EE0(v0, (uint64_t)qword_100029F70);
  if (qword_100024430 != -1) {
    swift_once();
  }
  sub_1000116E4();
  swift_bridgeObjectRetain();
  return sub_100018250();
}

uint64_t sub_100010344(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100010364, 0, 0);
}

uint64_t sub_100010364()
{
  id v1 = [self sharedSettingsUserDefaults];
  if (v1)
  {
    uint64_t v2 = v1;
    unsigned __int8 v3 = [v1 rc_useStereoRecording];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  **(unsigned char **)(v0 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001040C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100010430, 0, 0);
}

uint64_t sub_100010430()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  id v2 = [self sharedSettingsUserDefaults];
  [v2 rc_setUseStereoRecording:v1];

  unsigned __int8 v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000104C8(uint64_t a1)
{
  return sub_100007628(a1, qword_100029F88);
}

uint64_t sub_1000104EC()
{
  uint64_t v0 = sub_100008628(&qword_100024738);
  sub_100008F18(v0, qword_100029FA0);
  uint64_t v1 = sub_100008EE0(v0, (uint64_t)qword_100029FA0);
  sub_100018120();
  uint64_t v2 = sub_100018130();
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000105A4()
{
  uint64_t result = swift_getKeyPath();
  qword_100029FB8 = result;
  return result;
}

uint64_t sub_1000105CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008628(&qword_100024708);
  v3[9] = swift_task_alloc();
  sub_100008628(&qword_100024710);
  v3[10] = swift_task_alloc();
  sub_100008628(&qword_100024C00);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100017F70();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008628(&qword_100024C08);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100010790, 0, 0);
}

uint64_t sub_100010790()
{
  sub_100017FB0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_1000116E4();
  *uint64_t v1 = v0;
  v1[1] = sub_100010864;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_100010E5C, 0, &type metadata for StereoRecordingEntity, v2);
}

uint64_t sub_100010864()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100010960, 0, 0);
}

uint64_t sub_100010960()
{
  sub_100017FB0();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100017FB0();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_100024488 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100029FB8;
  *(void *)(v0 + 168) = qword_100029FB8;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_100008F90(&qword_100024BE8, &qword_100024BF0);
  void *v3 = v0;
  v3[1] = sub_100010AB8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v4);
}

uint64_t sub_100010AB8()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005C80;
  }
  else {
    uint64_t v2 = sub_100010C0C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100010C0C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100017FB0();
  uint64_t v7 = sub_100018290();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000182D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_10000FE2C();
  sub_1000118F8();
  sub_100017F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100017F60();
  sub_100017F80();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100010E60()
{
  uint64_t v0 = sub_100008628(&qword_100024C10);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100024488 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100018180();
  swift_release();
  sub_1000118F8();
  sub_100008F90(&qword_100024C18, &qword_100024C10);
  sub_100018170();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100010FC8()
{
  if (qword_100024488 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_100011028()
{
  unint64_t result = qword_100024A68;
  if (!qword_100024A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A68);
  }
  return result;
}

unint64_t sub_100011080()
{
  unint64_t result = qword_100024A70;
  if (!qword_100024A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A70);
  }
  return result;
}

uint64_t sub_1000110D4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100011108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000122AC(a1, a2, a3, (void (*)(void))sub_10000FE2C);
}

uint64_t sub_100011120@<X0>(uint64_t a1@<X8>)
{
  return sub_100007940(&qword_100024478, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029F88, a1);
}

uint64_t sub_100011158@<X0>(uint64_t a1@<X8>)
{
  return sub_100007940(&qword_100024450, (uint64_t (*)(void))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_100029F10, a1);
}

uint64_t sub_100011190@<X0>(uint64_t a1@<X8>)
{
  if (qword_100024480 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024738);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029FA0);

  return sub_100008FD4(v3, a1);
}

uint64_t sub_10001120C(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100009040;
  return sub_1000105CC(a1, v5, v4);
}

uint64_t sub_1000112B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012E48();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000112E0()
{
  return 0xD000000000000026;
}

unint64_t sub_100011300()
{
  unint64_t result = qword_100024A80;
  if (!qword_100024A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A80);
  }
  return result;
}

uint64_t sub_100011358()
{
  uint64_t v0 = sub_100018330();
  __chkstk_darwin(v0 - 8);
  sub_100008628(&qword_100024A60);
  sub_100018320();
  sub_100008F90(&qword_100024BE8, &qword_100024BF0);
  uint64_t result = sub_100018310();
  qword_100029FC0 = result;
  return result;
}

uint64_t sub_100011460(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100011480, 0, 0);
}

uint64_t sub_100011480()
{
  if (qword_100024490 != -1) {
    swift_once();
  }
  **(void **)(v0 + 16) = qword_100029FC0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  return v2();
}

unint64_t sub_10001152C()
{
  unint64_t result = qword_100024A90;
  if (!qword_100024A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024A90);
  }
  return result;
}

uint64_t sub_100011580(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100011B84();
  *uint64_t v4 = v2;
  v4[1] = sub_100006738;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100011634()
{
  unint64_t result = qword_100024AA0;
  if (!qword_100024AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024AA0);
  }
  return result;
}

unint64_t sub_10001168C()
{
  unint64_t result = qword_100024AA8;
  if (!qword_100024AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024AA8);
  }
  return result;
}

unint64_t sub_1000116E4()
{
  unint64_t result = qword_100024AB0[0];
  if (!qword_100024AB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100024AB0);
  }
  return result;
}

uint64_t sub_100011738(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100011B84();
  *unint64_t v5 = v2;
  v5[1] = sub_100006A0C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000117EC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100011B84();
  *uint64_t v4 = v2;
  v4[1] = sub_10000903C;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000118A0()
{
  unint64_t result = qword_100024AC8;
  if (!qword_100024AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024AC8);
  }
  return result;
}

unint64_t sub_1000118F8()
{
  unint64_t result = qword_100024AD0;
  if (!qword_100024AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024AD0);
  }
  return result;
}

unint64_t sub_100011950()
{
  unint64_t result = qword_100024AD8;
  if (!qword_100024AD8)
  {
    sub_100004C4C(qword_100024AE0);
    sub_1000118F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024AD8);
  }
  return result;
}

uint64_t sub_1000119C4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10001152C();
  *unint64_t v5 = v2;
  v5[1] = sub_100006D98;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100011A7C()
{
  unint64_t result = qword_100024AF8;
  if (!qword_100024AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024AF8);
  }
  return result;
}

unint64_t sub_100011AD4()
{
  unint64_t result = qword_100024B00;
  if (!qword_100024B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B00);
  }
  return result;
}

unint64_t sub_100011B2C()
{
  unint64_t result = qword_100024B08;
  if (!qword_100024B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B08);
  }
  return result;
}

unint64_t sub_100011B84()
{
  unint64_t result = qword_100024B10;
  if (!qword_100024B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B10);
  }
  return result;
}

unint64_t sub_100011BDC()
{
  unint64_t result = qword_100024B18;
  if (!qword_100024B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B18);
  }
  return result;
}

uint64_t sub_100011C30@<X0>(uint64_t a1@<X8>)
{
  if (qword_100024470 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024BD0);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029F70);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100011CE0()
{
  unint64_t result = qword_100024B20;
  if (!qword_100024B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B20);
  }
  return result;
}

unint64_t sub_100011D38()
{
  unint64_t result = qword_100024B28;
  if (!qword_100024B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B28);
  }
  return result;
}

unint64_t sub_100011D90()
{
  unint64_t result = qword_100024B30;
  if (!qword_100024B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B30);
  }
  return result;
}

uint64_t sub_100011DE4@<X0>(uint64_t *a1@<X8>)
{
  sub_10000EBC4();
  uint64_t result = sub_100017F90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100011E24()
{
  sub_100013688();
  uint64_t v2 = sub_100018220();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100008F7C(v3, v0, v2, v1);
}

uint64_t sub_100011EB8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100024468 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000182C0();
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029F58);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100011F78()
{
  return sub_100008F90(&qword_100024B40, &qword_100024B48);
}

uint64_t sub_100011FB4(uint64_t a1)
{
  unint64_t v2 = sub_1000116E4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100012004()
{
  unint64_t result = qword_100024B50;
  if (!qword_100024B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B50);
  }
  return result;
}

uint64_t sub_10001205C(uint64_t a1)
{
  unint64_t v2 = sub_100011D90();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000120AC()
{
  unint64_t result = qword_100024B58;
  if (!qword_100024B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B58);
  }
  return result;
}

uint64_t sub_100012100(uint64_t a1)
{
  return sub_100007628(a1, qword_100029FC8);
}

unint64_t sub_100012128()
{
  unint64_t result = qword_100024B60;
  if (!qword_100024B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B60);
  }
  return result;
}

uint64_t sub_10001217C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000135E0();
  unint64_t v5 = sub_100013688();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000121E8()
{
  unint64_t result = qword_100024B68;
  if (!qword_100024B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B68);
  }
  return result;
}

unint64_t sub_100012240()
{
  unint64_t result = qword_100024B70;
  if (!qword_100024B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024B70);
  }
  return result;
}

uint64_t sub_100012294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000122AC(a1, a2, a3, (void (*)(void))sub_100012128);
}

uint64_t sub_1000122AC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012300@<X0>(uint64_t a1@<X8>)
{
  return sub_100007940(&qword_100024498, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029FC8, a1);
}

uint64_t sub_100012338(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_1000135E0();
  unint64_t v6 = sub_100013634();
  unint64_t v7 = sub_100013688();
  *unint64_t v4 = v2;
  v4[1] = sub_100007AC8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100012404@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000132FC();
  *a1 = result;
  return result;
}

uint64_t sub_10001242C(uint64_t a1)
{
  unint64_t v2 = sub_100012128();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100012468()
{
  sub_100008628(&qword_100024658);
  sub_100018100();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100018C00;
  sub_100012E48();
  sub_10000FE2C();
  uint64_t result = sub_100018110();
  qword_100029FE0 = v0;
  return result;
}

uint64_t sub_100012570(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v25 = sub_100018010();
  uint64_t v31 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v30 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100008628(&qword_100024B98);
  uint64_t v32 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008628(&qword_100024BA0);
  __chkstk_darwin(v5);
  sub_10000FE2C();
  sub_1000180E0();
  v33._countAndFlagsBits = 0x206E727554;
  v33._object = (void *)0xE500000000000000;
  sub_1000180D0(v33);
  swift_getKeyPath();
  unint64_t v28 = sub_100008AAC();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v34._object = (void *)0x800000010001BF20;
  uint64_t v24 = (void *)0x800000010001BF20;
  v34._countAndFlagsBits = 0xD000000000000011;
  sub_1000180D0(v34);
  sub_1000180F0();
  uint64_t v26 = sub_100018030();
  unint64_t v6 = *(void (**)(char *, uint64_t))(v32 + 8);
  v32 += 8;
  uint64_t v29 = v2;
  v6(v4, v2);
  sub_1000180E0();
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_1000180D0(v35);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v36._countAndFlagsBits = 0xD000000000000011;
  v36._object = v24;
  sub_1000180D0(v36);
  sub_1000180F0();
  uint64_t v24 = (void *)sub_100018030();
  unint64_t v17 = v6;
  v6(v4, v2);
  sub_1000180E0();
  v37._countAndFlagsBits = 0x206E727554;
  v37._object = (void *)0xE500000000000000;
  sub_1000180D0(v37);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v38._countAndFlagsBits = 0xD000000000000015;
  v38._object = (void *)0x800000010001BF40;
  uint64_t v21 = (void *)0x800000010001BF40;
  uint64_t v22 = 0xD000000000000015;
  sub_1000180D0(v38);
  unsigned int v20 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  uint64_t v8 = v30;
  uint64_t v7 = v31;
  uint64_t v19 = *(void (**)(char *))(v31 + 104);
  uint64_t v9 = v25;
  v19(v30);
  sub_1000180B0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v31 = v7 + 8;
  uint64_t v18 = v10;
  v10(v8, v9);
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_1000180D0(v39);
  sub_1000180F0();
  uint64_t v23 = sub_100018030();
  v6(v4, v29);
  sub_1000180E0();
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_1000180D0(v40);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v41._object = v21;
  v41._countAndFlagsBits = v22;
  sub_1000180D0(v41);
  uint64_t v11 = v30;
  ((void (*)(char *, void, uint64_t))v19)(v30, v20, v9);
  sub_1000180B0();
  v18(v11, v9);
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_1000180D0(v42);
  sub_1000180F0();
  uint64_t v12 = sub_100018030();
  v17(v4, v29);
  sub_100008628(&qword_100024BA8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100018C20;
  uint64_t v14 = v24;
  *(void *)(v13 + 32) = v26;
  *(void *)(v13 + 40) = v14;
  *(void *)(v13 + 48) = v23;
  *(void *)(v13 + 56) = v12;
  uint64_t v15 = sub_100018020();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_100012BBC()
{
  uint64_t v0 = sub_1000180A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008AAC();
  sub_100018000();
  swift_release();
  sub_10000FE2C();
  sub_100018090();
  uint64_t v4 = sub_100018080();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100008628(&qword_100024668);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100018C00;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100018070();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_100012D24()
{
  qword_100029FE8 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100012D38(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_1000244A0);
}

uint64_t sub_100012D5C(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_1000244A8);
}

ValueMetadata *type metadata accessor for StereoRecordingAssistantIntents()
{
  return &type metadata for StereoRecordingAssistantIntents;
}

ValueMetadata *type metadata accessor for OpenStereoRecordingEntity()
{
  return &type metadata for OpenStereoRecordingEntity;
}

ValueMetadata *type metadata accessor for StereoRecordingEntity.StereoRecordingEntityQuery()
{
  return &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery;
}

ValueMetadata *type metadata accessor for StereoRecordingEntity()
{
  return &type metadata for StereoRecordingEntity;
}

ValueMetadata *type metadata accessor for StereoRecordingEntity.UpdateIntent_value()
{
  return &type metadata for StereoRecordingEntity.UpdateIntent_value;
}

uint64_t sub_100012DD0()
{
  return sub_100008F90(&qword_100024B80, &qword_100024B88);
}

uint64_t sub_100012E0C()
{
  return sub_100008F90(&qword_100024B90, &qword_100024B88);
}

uint64_t sub_100012E48()
{
  uint64_t v0 = sub_100008628(&qword_100024690);
  __chkstk_darwin(v0 - 8);
  uint64_t v30 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_100018260();
  uint64_t v2 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100008628(&qword_100024698);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v13;
  uint64_t v14 = sub_100018330();
  uint64_t v29 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v24 = sub_100008628(&qword_100024BB0);
  sub_100018320();
  unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  uint64_t v33 = 0;
  uint64_t v16 = sub_100017F70();
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v27 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v25 = v2 + 104;
  uint64_t v26 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_1000116E4();
  uint64_t v19 = v23;
  uint64_t v24 = sub_100017FE0();
  sub_100008628(&qword_1000246B0);
  sub_100018320();
  v28(v19, 1, 1, v29);
  char v32 = 2;
  uint64_t v20 = sub_100018480();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v30, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v26(v4, v27, v31);
  sub_100017FF0();
  return v24;
}

uint64_t sub_100013288@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100017FB0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000132C4()
{
  return sub_100017FC0();
}

uint64_t sub_1000132FC()
{
  v17[0] = sub_100018260();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_100024698);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100018330();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008628(&qword_100024BB0);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100017F70();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_1000116E4();
  return sub_100017FE0();
}

unint64_t sub_1000135E0()
{
  unint64_t result = qword_100024BB8;
  if (!qword_100024BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024BB8);
  }
  return result;
}

unint64_t sub_100013634()
{
  unint64_t result = qword_100024BC0;
  if (!qword_100024BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024BC0);
  }
  return result;
}

unint64_t sub_100013688()
{
  unint64_t result = qword_100024BC8;
  if (!qword_100024BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024BC8);
  }
  return result;
}

uint64_t sub_1000136DC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

unint64_t sub_1000136EC()
{
  unint64_t result = qword_100024C20;
  if (!qword_100024C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C20);
  }
  return result;
}

uint64_t sub_100013740()
{
  return sub_100008F90(&qword_100024C28, &qword_100024C30);
}

uint64_t sub_10001377C(uint64_t a1)
{
  return sub_100015244(a1, qword_100029FF0);
}

uint64_t sub_1000137A0()
{
  uint64_t v0 = sub_100008628(&qword_100024E10);
  sub_100008F18(v0, qword_10002A008);
  sub_100008EE0(v0, (uint64_t)qword_10002A008);
  if (qword_100024438 != -1) {
    swift_once();
  }
  sub_100014E8C();
  swift_bridgeObjectRetain();
  return sub_100018250();
}

uint64_t sub_10001385C()
{
  uint64_t v0 = sub_100008628(&qword_1000246D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018330();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100018320();
  sub_100018320();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_100018190();
  uint64_t v9 = sub_1000181A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 0, 1, v9);
  sub_100018320();
  return sub_1000181C0();
}

uint64_t sub_100013AC0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100013AE0, 0, 0);
}

uint64_t sub_100013AE0()
{
  id v1 = [self sharedSettingsUserDefaults];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 rc_audioQuality];

    BOOL v4 = v3 == (id)1;
  }
  else
  {
    BOOL v4 = 0;
  }
  **(unsigned char **)(v0 + 16) = v4;
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100013B90(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_100013BB4, 0, 0);
}

uint64_t sub_100013BB4()
{
  id v1 = [self sharedSettingsUserDefaults];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 rc_setAudioQuality:*(unsigned __int8 *)(v0 + 16)];
  }
  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100013C4C(uint64_t a1)
{
  return sub_100007628(a1, qword_10002A020);
}

uint64_t sub_100013C70()
{
  uint64_t v0 = sub_100008628(&qword_100024738);
  sub_100008F18(v0, qword_10002A038);
  uint64_t v1 = sub_100008EE0(v0, (uint64_t)qword_10002A038);
  sub_100018120();
  uint64_t v2 = sub_100018130();
  id v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100013D28()
{
  uint64_t result = swift_getKeyPath();
  qword_10002A050 = result;
  return result;
}

uint64_t sub_100013D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  sub_100008628(&qword_100024708);
  v3[9] = swift_task_alloc();
  sub_100008628(&qword_100024710);
  v3[10] = swift_task_alloc();
  sub_100008628(&qword_100024E58);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100017F70();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_100008628(&qword_100024E60);
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_100013F14, 0, 0);
}

uint64_t sub_100013F14()
{
  sub_100017FB0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v1;
  unint64_t v2 = sub_100014E8C();
  *uint64_t v1 = v0;
  v1[1] = sub_100013FE8;
  uint64_t v3 = *(void *)(v0 + 144);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v3, v0 + 16, sub_1000145E0, 0, &type metadata for AudioQualityEntity, v2);
}

uint64_t sub_100013FE8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000140E4, 0, 0);
}

uint64_t sub_1000140E4()
{
  sub_100017FB0();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 160) = v1;
  sub_100017FB0();
  *(unsigned char *)(v0 + 193) = *(unsigned char *)(v0 + 192);
  if (qword_1000244D0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002A050;
  *(void *)(v0 + 168) = qword_10002A050;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v3;
  uint64_t v4 = sub_100008F90(&qword_100024E40, &qword_100024E48);
  void *v3 = v0;
  v3[1] = sub_10001423C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for AudioQualityEntity.IntentAudioQuality, v4);
}

uint64_t sub_10001423C()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100005C80;
  }
  else {
    uint64_t v2 = sub_100014390;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100014390()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[13];
  uint64_t v13 = v0[12];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  sub_100017FB0();
  uint64_t v7 = sub_100018290();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_1000182D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1000136EC();
  sub_1000150A0();
  sub_100017F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  sub_100017F60();
  sub_100017F80();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_1000145E4()
{
  uint64_t v0 = sub_100008628(&qword_100024E68);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000244D0 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100018180();
  swift_release();
  sub_1000150A0();
  sub_100008F90(&qword_100024E70, &qword_100024E68);
  sub_100018170();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001474C()
{
  if (qword_1000244D0 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000147AC()
{
  unint64_t result = qword_100024C38;
  if (!qword_100024C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C38);
  }
  return result;
}

unint64_t sub_100014804()
{
  unint64_t result = qword_100024C40;
  if (!qword_100024C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C40);
  }
  return result;
}

uint64_t sub_100014858()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001488C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001614C(a1, a2, a3, (void (*)(void))sub_1000136EC);
}

uint64_t sub_1000148B8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_1000244C0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10002A020, a1);
}

uint64_t sub_1000148F0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_100024458, (uint64_t (*)(void))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_100029F28, a1);
}

uint64_t sub_100014928@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000244C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024738);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_10002A038);
  return sub_100017D44(v3, a1, &qword_100024738);
}

uint64_t sub_1000149A0(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_100009040;
  return sub_100013D50(a1, v5, v4);
}

uint64_t sub_100014A4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000174F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100014A74()
{
  return 0xD000000000000023;
}

unint64_t sub_100014A94()
{
  unint64_t result = qword_100024C50;
  if (!qword_100024C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C50);
  }
  return result;
}

uint64_t sub_100014AEC()
{
  uint64_t v0 = sub_100018330();
  __chkstk_darwin(v0 - 8);
  sub_100008628(&qword_100024C30);
  sub_100018320();
  sub_100008F90(&qword_100024E40, &qword_100024E48);
  sub_10000F750();
  uint64_t result = sub_100018300();
  qword_10002A058 = result;
  return result;
}

uint64_t sub_100014C08(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100014C28, 0, 0);
}

uint64_t sub_100014C28()
{
  if (qword_1000244D8 != -1) {
    swift_once();
  }
  **(void **)(v0 + 16) = qword_10002A058;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain();
  return v2();
}

unint64_t sub_100014CD4()
{
  unint64_t result = qword_100024C60;
  if (!qword_100024C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C60);
  }
  return result;
}

uint64_t sub_100014D28(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100015A0C();
  *uint64_t v4 = v2;
  v4[1] = sub_100006738;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100014DDC()
{
  unint64_t result = qword_100024C70;
  if (!qword_100024C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C70);
  }
  return result;
}

unint64_t sub_100014E34()
{
  unint64_t result = qword_100024C78;
  if (!qword_100024C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C78);
  }
  return result;
}

unint64_t sub_100014E8C()
{
  unint64_t result = qword_100024C80[0];
  if (!qword_100024C80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100024C80);
  }
  return result;
}

uint64_t sub_100014EE0(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100015A0C();
  *unint64_t v5 = v2;
  v5[1] = sub_100006A0C;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100014F94(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_100015A0C();
  *uint64_t v4 = v2;
  v4[1] = sub_10000903C;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100015048()
{
  unint64_t result = qword_100024C98;
  if (!qword_100024C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C98);
  }
  return result;
}

unint64_t sub_1000150A0()
{
  unint64_t result = qword_100024CA0;
  if (!qword_100024CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CA0);
  }
  return result;
}

unint64_t sub_1000150F8()
{
  unint64_t result = qword_100024CA8;
  if (!qword_100024CA8)
  {
    sub_100004C4C(qword_100024CB0);
    sub_1000150A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CA8);
  }
  return result;
}

uint64_t sub_10001516C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100014CD4();
  *unint64_t v5 = v2;
  v5[1] = sub_100006D98;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100015220(uint64_t a1)
{
  return sub_100015244(a1, qword_10002A060);
}

uint64_t sub_100015244(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  unint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018330();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = sub_1000182C0();
  sub_100008F18(v8, a2);
  sub_100008EE0(v8, (uint64_t)a2);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  return sub_1000182B0();
}

BOOL sub_1000153AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_1000153C8()
{
  unint64_t result = qword_100024CC8;
  if (!qword_100024CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CC8);
  }
  return result;
}

void *sub_10001541C@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

unint64_t sub_100015440()
{
  unint64_t result = qword_100024CD0;
  if (!qword_100024CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CD0);
  }
  return result;
}

unint64_t sub_100015498()
{
  unint64_t result = qword_100024CD8;
  if (!qword_100024CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CD8);
  }
  return result;
}

unint64_t sub_1000154F0()
{
  unint64_t result = qword_100024CE0;
  if (!qword_100024CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CE0);
  }
  return result;
}

unint64_t sub_100015548()
{
  unint64_t result = qword_100024CE8;
  if (!qword_100024CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CE8);
  }
  return result;
}

unint64_t sub_1000155A0()
{
  unint64_t result = qword_100024CF0;
  if (!qword_100024CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CF0);
  }
  return result;
}

unint64_t sub_1000155F8()
{
  unint64_t result = qword_100024CF8;
  if (!qword_100024CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024CF8);
  }
  return result;
}

unint64_t sub_100015650()
{
  unint64_t result = qword_100024D00;
  if (!qword_100024D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D00);
  }
  return result;
}

uint64_t sub_1000156A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_1000244E0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10002A060, a1);
}

uint64_t sub_1000156DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001614C(a1, a2, a3, (void (*)(void))sub_10000F750);
}

uint64_t sub_100015708(uint64_t a1)
{
  unint64_t v2 = sub_10000F750();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100015758()
{
  unint64_t result = qword_100024D08;
  if (!qword_100024D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D08);
  }
  return result;
}

unint64_t sub_1000157B0()
{
  unint64_t result = qword_100024D10;
  if (!qword_100024D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D10);
  }
  return result;
}

unint64_t sub_100015808()
{
  unint64_t result = qword_100024D18;
  if (!qword_100024D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D18);
  }
  return result;
}

uint64_t sub_100015860(uint64_t a1)
{
  unint64_t v2 = sub_100015650();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000158AC()
{
  return sub_100008F90(&qword_100024D20, &qword_100024D28);
}

void sub_1000158E8(void *a1@<X8>)
{
  *a1 = &off_100020F58;
}

unint64_t sub_1000158FC()
{
  unint64_t result = qword_100024D30;
  if (!qword_100024D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D30);
  }
  return result;
}

unint64_t sub_100015954()
{
  unint64_t result = qword_100024D38;
  if (!qword_100024D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D38);
  }
  return result;
}

unint64_t sub_1000159AC()
{
  unint64_t result = qword_100024D40;
  if (!qword_100024D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D40);
  }
  return result;
}

unint64_t sub_100015A0C()
{
  unint64_t result = qword_100024D48;
  if (!qword_100024D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D48);
  }
  return result;
}

unint64_t sub_100015A64()
{
  unint64_t result = qword_100024D50;
  if (!qword_100024D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D50);
  }
  return result;
}

uint64_t sub_100015AB8@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000244B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100008628(&qword_100024E10);
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_10002A008);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100015B68()
{
  unint64_t result = qword_100024D58;
  if (!qword_100024D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D58);
  }
  return result;
}

unint64_t sub_100015BC0()
{
  unint64_t result = qword_100024D60;
  if (!qword_100024D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D60);
  }
  return result;
}

unint64_t sub_100015C1C()
{
  unint64_t result = qword_100024D68;
  if (!qword_100024D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D68);
  }
  return result;
}

uint64_t sub_100015C70@<X0>(uint64_t *a1@<X8>)
{
  sub_10000F7F8();
  uint64_t result = sub_100017F90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100015CB0()
{
  sub_100017CE4();
  uint64_t v2 = sub_100018220();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100008F7C(v3, v0, v2, v1);
}

uint64_t sub_100015D44@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000244B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000182C0();
  uint64_t v3 = sub_100008EE0(v2, (uint64_t)qword_100029FF0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100015E04()
{
  return sub_100008F90(&qword_100024D78, &qword_100024D80);
}

uint64_t sub_100015E40(uint64_t a1)
{
  unint64_t v2 = sub_100014E8C();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100015E90()
{
  unint64_t result = qword_100024D88;
  if (!qword_100024D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D88);
  }
  return result;
}

uint64_t sub_100015EE8(uint64_t a1)
{
  unint64_t v2 = sub_100015C1C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100015F38()
{
  unint64_t result = qword_100024D90;
  if (!qword_100024D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D90);
  }
  return result;
}

uint64_t sub_100015F8C(uint64_t a1)
{
  return sub_100007628(a1, qword_10002A078);
}

unint64_t sub_100015FB4()
{
  unint64_t result = qword_100024D98;
  if (!qword_100024D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024D98);
  }
  return result;
}

uint64_t sub_100016008(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100017C3C();
  unint64_t v5 = sub_100017CE4();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100016074()
{
  unint64_t result = qword_100024DA0;
  if (!qword_100024DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024DA0);
  }
  return result;
}

unint64_t sub_1000160CC()
{
  unint64_t result = qword_100024DA8;
  if (!qword_100024DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024DA8);
  }
  return result;
}

uint64_t sub_100016120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001614C(a1, a2, a3, (void (*)(void))sub_100015FB4);
}

uint64_t sub_10001614C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016194@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BD74(&qword_1000244E8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10002A078, a1);
}

uint64_t sub_1000161CC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100017C3C();
  unint64_t v6 = sub_100017C90();
  unint64_t v7 = sub_100017CE4();
  *unint64_t v4 = v2;
  v4[1] = sub_100007AC8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100016298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100017958();
  *a1 = result;
  return result;
}

uint64_t sub_1000162C0(uint64_t a1)
{
  unint64_t v2 = sub_100015FB4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000162FC()
{
  sub_100008628(&qword_100024658);
  sub_100018100();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100018C00;
  sub_1000174F8();
  sub_1000136EC();
  uint64_t result = sub_100018110();
  qword_10002A090 = v0;
  return result;
}

uint64_t sub_100016404(uint64_t a1)
{
  uint64_t v2 = sub_100018010();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2);
  uint64_t v24 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008628(&qword_100024DD0);
  uint64_t v18 = v4;
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008628(&qword_100024DD8);
  __chkstk_darwin(v7);
  sub_1000136EC();
  sub_1000180E0();
  v28._countAndFlagsBits = 0xD000000000000028;
  v28._object = (void *)0x800000010001C180;
  sub_1000180D0(v28);
  swift_getKeyPath();
  unint64_t v20 = sub_1000155F8();
  uint64_t v21 = a1;
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  sub_1000180D0(v29);
  sub_1000180F0();
  uint64_t v23 = sub_100018030();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v27 + 8);
  v27 += 8;
  v8(v6, v4);
  uint64_t v19 = v8;
  sub_1000180E0();
  v30._countAndFlagsBits = 0x692064726F636552;
  v30._object = (void *)0xEA0000000000206ELL;
  sub_1000180D0(v30);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v31._countAndFlagsBits = 0x7974696C61757120;
  v31._object = (void *)0xE800000000000000;
  sub_1000180D0(v31);
  sub_1000180F0();
  uint64_t v22 = sub_100018030();
  uint64_t v9 = v18;
  v8(v6, v18);
  sub_1000180E0();
  v32._countAndFlagsBits = 0x2065676E616863;
  v32._object = (void *)0xE700000000000000;
  sub_1000180D0(v32);
  uint64_t v10 = v24;
  uint64_t v11 = v25;
  uint64_t v12 = v26;
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v24, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v26);
  sub_1000180B0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v10, v12);
  v33._object = (void *)0x800000010001C1B0;
  v33._countAndFlagsBits = 0xD000000000000010;
  sub_1000180D0(v33);
  swift_getKeyPath();
  sub_100018000();
  swift_release();
  sub_1000180C0();
  swift_release();
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  sub_1000180D0(v34);
  sub_1000180F0();
  uint64_t v13 = sub_100018030();
  v19(v6, v9);
  sub_100008628(&qword_100024DE0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000194D0;
  uint64_t v15 = v22;
  *(void *)(v14 + 32) = v23;
  *(void *)(v14 + 40) = v15;
  *(void *)(v14 + 48) = v13;
  uint64_t v16 = sub_100018020();
  swift_bridgeObjectRelease();
  return v16;
}

void sub_100016914()
{
  qword_10002A098 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100016928(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_1000244F0);
}

uint64_t sub_10001694C(uint64_t a1, uint64_t a2)
{
  return sub_100008368(a1, a2, &qword_1000244F8);
}

ValueMetadata *type metadata accessor for AudioQualityIntents()
{
  return &type metadata for AudioQualityIntents;
}

ValueMetadata *type metadata accessor for OpenAudioQualityEntity()
{
  return &type metadata for OpenAudioQualityEntity;
}

ValueMetadata *type metadata accessor for AudioQualityEntity.AudioQualityEntityQuery()
{
  return &type metadata for AudioQualityEntity.AudioQualityEntityQuery;
}

uint64_t getEnumTagSinglePayload for AudioQualityEntity.IntentAudioQuality(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AudioQualityEntity.IntentAudioQuality(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100016AFCLL);
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

unsigned char *sub_100016B24(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AudioQualityEntity.IntentAudioQuality()
{
  return &type metadata for AudioQualityEntity.IntentAudioQuality;
}

ValueMetadata *type metadata accessor for AudioQualityEntity()
{
  return &type metadata for AudioQualityEntity;
}

ValueMetadata *type metadata accessor for AudioQualityEntity.UpdateIntent_value()
{
  return &type metadata for AudioQualityEntity.UpdateIntent_value;
}

uint64_t sub_100016B60()
{
  return sub_100008F90(&qword_100024DB8, &qword_100024DC0);
}

uint64_t sub_100016B9C()
{
  return sub_100008F90(&qword_100024DC8, &qword_100024DC0);
}

unint64_t sub_100016BD8(unsigned __int8 a1)
{
  sub_1000184A0();
  sub_1000184B0(a1);
  Swift::Int v2 = sub_1000184C0();

  return sub_100016CB4(a1, v2);
}

unint64_t sub_100016C44(char a1)
{
  char v2 = a1 & 1;
  sub_1000184A0();
  sub_1000184B0(a1 & 1);
  Swift::Int v3 = sub_1000184C0();

  return sub_100016D54(v2, v3);
}

unint64_t sub_100016CB4(unsigned __int8 a1, uint64_t a2)
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

unint64_t sub_100016D54(char a1, uint64_t a2)
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

unint64_t sub_100016E10(uint64_t a1)
{
  uint64_t v2 = sub_100008628(&qword_100024950);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (unsigned __int8 *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_100008628(&qword_100024E78);
    uint64_t v7 = (void *)sub_100018490();
    uint64_t v8 = &v5[*(int *)(v2 + 48)];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_100017D44(v9, (uint64_t)v5, &qword_100024950);
      unsigned __int8 v11 = *v5;
      unint64_t result = sub_100016BD8(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v7[6] + result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = sub_1000181E0();
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

unint64_t sub_100016FD8(uint64_t a1)
{
  uint64_t v2 = sub_100008628(&qword_100024E20);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    sub_100008628(&qword_100024E28);
    uint64_t v7 = (void *)sub_100018490();
    uint64_t v8 = &v5[*(int *)(v2 + 48)];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_100017D44(v9, (uint64_t)v5, &qword_100024E20);
      char v11 = *v5;
      unint64_t result = sub_100016C44(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v7[6] + result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = sub_1000181E0();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
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

unint64_t sub_1000171A0()
{
  uint64_t v0 = sub_100008628(&qword_1000246D0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018330();
  uint64_t v20 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_100008628(&qword_100024E18);
  uint64_t v8 = sub_100008628(&qword_100024E20);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v22 = *(void *)(v9 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100018C10;
  uint64_t v12 = (unsigned char *)(v11 + v10);
  uint64_t v13 = *(int *)(v8 + 48);
  uint64_t v21 = v8;
  v19[1] = &v12[v13];
  *uint64_t v12 = 0;
  sub_100018320();
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v19[2] = v7 + 56;
  v14(v5, 1, 1, v6);
  uint64_t v15 = sub_1000181A0();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v2, 1, 1, v15);
  sub_1000181D0();
  v12[v22] = 1;
  sub_100018320();
  v14(v5, 1, 1, v20);
  v16(v2, 1, 1, v15);
  sub_1000181D0();
  unint64_t v17 = sub_100016FD8(v11);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v17;
}

uint64_t sub_1000174F8()
{
  uint64_t v28 = sub_100018260();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100008628(&qword_100024698);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v20 - v6;
  uint64_t v8 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100018330();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_100008628(&qword_100024DE8);
  sub_100018320();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v30 = 0;
  uint64_t v14 = sub_100017F70();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  unint64_t v17 = *(void (**)(void))(v0 + 104);
  v20[1] = v0 + 104;
  uint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  BOOL v18 = v27;
  v17(v27);
  sub_100014E8C();
  uint64_t v23 = sub_100017FE0();
  sub_100008628(&qword_100024DF0);
  sub_100018320();
  v25(v10, 1, 1, v26);
  char v29 = 2;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_10000F750();
  sub_100017FD0();
  return v23;
}

uint64_t sub_1000178E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100017FB0();
  *a1 = v3;
  return result;
}

uint64_t sub_100017920()
{
  return sub_100017FC0();
}

uint64_t sub_100017958()
{
  v17[0] = sub_100018260();
  uint64_t v0 = *(void *)(v17[0] - 8);
  __chkstk_darwin(v17[0]);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008628(&qword_100024698);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = sub_100008628(&qword_1000246A0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100018330();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100008628(&qword_100024DE8);
  sub_100018320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v17[1] = 0;
  uint64_t v14 = sub_100017F70();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, void))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17[0]);
  sub_100014E8C();
  return sub_100017FE0();
}

unint64_t sub_100017C3C()
{
  unint64_t result = qword_100024DF8;
  if (!qword_100024DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024DF8);
  }
  return result;
}

unint64_t sub_100017C90()
{
  unint64_t result = qword_100024E00;
  if (!qword_100024E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024E00);
  }
  return result;
}

unint64_t sub_100017CE4()
{
  unint64_t result = qword_100024E08;
  if (!qword_100024E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024E08);
  }
  return result;
}

uint64_t sub_100017D38@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100017D44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008628(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017DA8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100017DDC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[RCAppGroupStorage init]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s -- app group user defaults are nil", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_100017E60()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100017E70()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100017E80()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100017E90()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100017ED0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100017EE0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100017EF0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100017F00()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100017F10()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100017F40()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_100017F60()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_100017F70()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100017F80()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_100017F90()
{
  return _UniqueEntity.id.getter();
}

uint64_t sub_100017FA0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100017FB0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100017FC0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100017FD0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_100017FE0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100017FF0()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100018000()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100018010()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t sub_100018020()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100018030()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100018040()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100018050()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100018060()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t sub_100018070()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100018080()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100018090()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000180A0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_1000180B0()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

uint64_t sub_1000180C0()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000180D0(Swift::String a1)
{
}

uint64_t sub_1000180E0()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000180F0()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100018100()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100018110()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100018120()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_100018130()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100018170()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_100018180()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_100018190()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_1000181A0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000181B0()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_1000181C0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_1000181D0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_1000181E0()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000181F0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100018210()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100018220()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100018250()
{
  return EntityURLRepresentation.init(_:)();
}

uint64_t sub_100018260()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100018280()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100018290()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_1000182A0()
{
  return TypeDisplayRepresentation.name.getter();
}

uint64_t sub_1000182B0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000182C0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000182D0()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_1000182E0()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t sub_100018300()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_100018310()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_100018320()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100018330()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100018340()
{
  return static Locale.current.getter();
}

uint64_t sub_100018350()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100018370()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100018380()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100018390()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_1000183A0()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000183B0()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_1000183C0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000183D0()
{
  return Text.init(_:)();
}

uint64_t sub_1000183F0()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100018400()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100018410()
{
  return ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)();
}

uint64_t sub_100018420()
{
  return ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)();
}

uint64_t sub_100018430()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100018440()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100018450()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018460()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

void sub_100018470(Swift::String a1)
{
}

uint64_t sub_100018480()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_100018490()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000184A0()
{
  return Hasher.init(_seed:)();
}

void sub_1000184B0(Swift::UInt a1)
{
}

Swift::Int sub_1000184C0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__isRunningInVoiceMemos(void *a1, const char *a2, ...)
{
  return _[a1 _isRunningInVoiceMemos];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_postNotificationName_object_userInfo_deliverImmediately_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:deliverImmediately:];
}

id objc_msgSend_rc_recentlyDeletedWindow(void *a1, const char *a2, ...)
{
  return [a1 rc_recentlyDeletedWindow];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setInteger:forKey:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}