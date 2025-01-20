uint64_t sub_1000027AC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000027DC()
{
  v1[2] = v0;
  uint64_t v2 = sub_100013E30();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  sub_100013F60();
  v1[7] = sub_100013F50();
  uint64_t v4 = sub_100013F40();
  v1[8] = v4;
  v1[9] = v3;
  return _swift_task_switch(sub_1000028E0, v4, v3);
}

uint64_t sub_1000028E0()
{
  sub_100013DD0();
  v1 = sub_100013E20();
  os_log_type_t v2 = sub_100013FA0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Fetching auth token", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];

  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_token + 8);
  if (v9)
  {
    uint64_t v10 = *(void *)(v7 + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_token);
    swift_bridgeObjectRetain();
    swift_release();
    sub_100013DD0();
    v11 = sub_100013E20();
    os_log_type_t v12 = sub_100013FA0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Reusing cached authentication token", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v14 = v0[5];
    uint64_t v15 = v0[3];

    v8(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    v16 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v16(v10, v9);
  }
  else
  {
    v18 = (void *)swift_task_alloc();
    v0[10] = v18;
    void *v18 = v0;
    v18[1] = sub_100002B40;
    return sub_100002D74();
  }
}

uint64_t sub_100002B40(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 88) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_100002CFC;
  }
  else
  {
    v6[12] = a2;
    v6[13] = a1;
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_100002C74;
  }
  return _swift_task_switch(v9, v7, v8);
}

uint64_t sub_100002C74()
{
  swift_release();
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_100002CFC()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100002D74()
{
  v1[22] = v0;
  sub_100013F60();
  v1[23] = sub_100013F50();
  uint64_t v2 = sub_100013F40();
  v1[24] = v2;
  v1[25] = v3;
  return _swift_task_switch(sub_100002E40, v2, v3);
}

uint64_t sub_100002E40()
{
  uint64_t v1 = sub_100013E30();
  v0[26] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[27] = *(void *)(v2 + 64);
  uint64_t v3 = swift_task_alloc();
  sub_100013DD0();
  uint64_t v4 = sub_100013E20();
  os_log_type_t v5 = sub_100013FA0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting Apple Connect authentication", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[28] = v7;
  v0[29] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v3, v1);
  swift_task_dealloc();
  if (ACAuthenticationRequest)
  {
    uint64_t v8 = v0[22];
    id v9 = [objc_allocWithZone((Class)ACAuthenticationRequest) init];
    v0[30] = v9;
    [v9 setAuthType:3];
    uint64_t v10 = *(void **)(v8 + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_context);
    v0[2] = v0;
    v0[7] = v0 + 19;
    v0[3] = sub_10000315C;
    uint64_t v11 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100003698;
    v0[13] = &unk_100018AA8;
    v0[14] = v11;
    [v10 authenticateWithRequest:v9 completion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    swift_release();
    sub_10000437C();
    swift_allocError();
    *os_log_type_t v12 = xmmword_100015A50;
    swift_willThrow();
    v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_10000315C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 200);
  uint64_t v2 = *(void *)(*(void *)v0 + 192);
  return _swift_task_switch(sub_100003290, v2, v1);
}

uint64_t sub_100003290()
{
  swift_release();
  uint64_t v1 = (void *)v0[19];
  id v2 = [v1 serviceTicket];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)v0[30];
    uint64_t v5 = v0[22];
    uint64_t v6 = sub_100013EA0();
    uint64_t v8 = v7;

    id v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_token);
    *id v9 = v6;
    v9[1] = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v10(v6, v8);
  }
  else
  {
    uint64_t v12 = swift_task_alloc();
    sub_100013DD0();
    v13 = v1;
    uint64_t v14 = sub_100013E20();
    os_log_type_t v15 = sub_100013FB0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (void *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      if ([v13 error])
      {
        uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
        v0[21] = v18;
        sub_100014030();
      }
      else
      {
        v0[20] = 0;
        sub_100014030();
        uint64_t v18 = 0;
      }
      void *v17 = v18;

      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to authenticate: %@", v16, 0xCu);
      sub_1000040F4(&qword_10001D428);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v14 = v13;
    }
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[28];
    uint64_t v20 = v0[26];

    v19(v12, v20);
    swift_task_dealloc();
    id v21 = [v13 error];
    if (v21)
    {
      swift_getErrorValue();
      uint64_t v22 = v0[15];
      uint64_t v23 = v0[16];
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v25 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v25, v22, v23);

      id v21 = (id)sub_100014160();
      uint64_t v27 = v26;
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v23);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v27 = 0;
    }
    v28 = (void *)v0[30];
    sub_10000437C();
    swift_allocError();
    void *v29 = v21;
    v29[1] = v27;
    swift_willThrow();

    v30 = (uint64_t (*)(void))v0[1];
    return v30();
  }
}

uint64_t sub_100003698(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

uint64_t sub_1000036EC(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    return sub_100013E90();
  }
  sub_1000040F4(&qword_10001D430);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100015A60;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100004684();
  uint64_t v6 = 0x6E776F6E6B6E75;
  if (a2) {
    uint64_t v6 = a1;
  }
  unint64_t v7 = 0xE700000000000000;
  if (a2) {
    unint64_t v7 = a2;
  }
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  sub_1000046CC(a1, a2);
  uint64_t v2 = sub_100013E90();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1000037F4()
{
  return sub_1000036EC(*v0, v0[1]);
}

uint64_t sub_1000037FC()
{
  return sub_100013BB0();
}

uint64_t sub_100003814()
{
  return sub_100013BC0();
}

uint64_t sub_10000382C()
{
  return sub_100013BA0();
}

id sub_100003854()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_token];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticator_context;
  id v4 = objc_allocWithZone((Class)ACMobileAuthenticationContext);
  uint64_t v5 = v0;
  id v6 = [v4 init];
  id v7 = objc_allocWithZone((Class)NSNumber);
  id v8 = v6;
  id v9 = [v7 initWithInteger:191000];
  [v8 setAppID:v9];

  [v8 setEnvironment:0];
  *(void *)&v0[v3] = v8;

  v11.receiver = v5;
  v11.super_class = ObjectType;
  return [super init];
}

id sub_100003980()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for AppleConnectAuthenticator()
{
  return self;
}

uint64_t sub_100003A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  v6[4] = sub_100013F60();
  v6[5] = sub_100013F50();
  id v7 = (void *)swift_task_alloc();
  v6[6] = v7;
  *id v7 = v6;
  v7[1] = sub_100003ADC;
  return sub_1000027DC();
}

uint64_t sub_100003ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 56) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_100013F40();
    uint64_t v9 = v8;
    uint64_t v10 = sub_100003CF4;
  }
  else
  {
    *(void *)(v6 + 64) = a2;
    *(void *)(v6 + 72) = a1;
    uint64_t v7 = sub_100013F40();
    uint64_t v9 = v11;
    uint64_t v10 = sub_100003C68;
  }
  return _swift_task_switch(v10, v7, v9);
}

uint64_t sub_100003C68()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, void))v0[2];
  swift_release();
  v3(v2, v1, 0);
  swift_bridgeObjectRelease();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100003CF4()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void (*)(void, void, uint64_t))v0[2];
  swift_release();
  swift_errorRetain();
  v2(0, 0, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void *initializeBufferWithCopyOfBuffer for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppleConnectAuthenticator.DAWToken()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppleConnectAuthenticator.DAWToken(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppleConnectAuthenticator.DAWToken(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleConnectAuthenticator.DAWToken(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppleConnectAuthenticator.DAWToken(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppleConnectAuthenticator.DAWToken()
{
  return &type metadata for AppleConnectAuthenticator.DAWToken;
}

void sub_100004064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = (void *)sub_100013E80();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_100013BD0();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

uint64_t sub_1000040F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004138()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100004064(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100004178()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000041C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100004288;
  return sub_100003A2C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100004288()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10000437C()
{
  unint64_t result = qword_10001D420;
  if (!qword_10001D420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D420);
  }
  return result;
}

unint64_t destroy for AppleConnectAuthenticator.AuthenticationError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s40GenerativePlaygroundMessagesAppExtension25AppleConnectAuthenticatorC19AuthenticationErrorOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for AppleConnectAuthenticator.AuthenticationError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for AppleConnectAuthenticator.AuthenticationError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleConnectAuthenticator.AuthenticationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppleConnectAuthenticator.AuthenticationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_10000461C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_100004644(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *unint64_t result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleConnectAuthenticator.AuthenticationError()
{
  return &type metadata for AppleConnectAuthenticator.AuthenticationError;
}

unint64_t sub_100004684()
{
  unint64_t result = qword_10001D438;
  if (!qword_10001D438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D438);
  }
  return result;
}

uint64_t sub_1000046CC(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000046E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013F80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100013F70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100013A04(a1, &qword_10001D3F8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100013F40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013F80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100013F70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100013A04(a1, &qword_10001D3F8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100013F40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_1000040F4(&qword_10001D8B0);
  return swift_task_create();
}

void sub_100004A44()
{
  qword_10001D500 = 3;
}

uint64_t sub_100004A54()
{
  uint64_t v0 = sub_100013E30();
  sub_100013100(v0, qword_10001D508);
  sub_100013060(v0, (uint64_t)qword_10001D508);
  return sub_100013DE0();
}

void sub_100004AA0()
{
  qword_10001D520 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100004AB4()
{
  uint64_t v0 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  sub_100013100(v0, qword_10001D528);
  uint64_t v1 = sub_100013060(v0, (uint64_t)qword_10001D528);
  uint64_t v2 = type metadata accessor for VisibleView(0);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

id sub_100004B4C()
{
  uint64_t v1 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for AppleConnectAuthenticator()) init];
    id v5 = [objc_allocWithZone((Class)GPAppleConnectTokenProvider) initWithAuthenticatingProtocol:v4];

    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

objc_class *sub_100004BF0()
{
  uint64_t result = (objc_class *)swift_getObjectType();
  uint64_t v2 = qword_10001D548 - 1;
  if (__OFSUB__(qword_10001D548, 1))
  {
    __break(1u);
  }
  else
  {
    id v3 = result;
    --qword_10001D548;
    if (!v2)
    {
      qword_10001D540 = 0;
      swift_release();
    }
    v4.receiver = v0;
    v4.super_class = v3;
    return (objc_class *)[super dealloc];
  }
  return result;
}

uint64_t sub_100004DA8()
{
  return type metadata accessor for GPMessagesViewController(0);
}

uint64_t type metadata accessor for GPMessagesViewController(uint64_t a1)
{
  return sub_10000CAB4(a1, (uint64_t *)&unk_10001D5C0);
}

id sub_100004DD0()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100013D30();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000040F4(&qword_10001D3F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.receiver = v0;
  v17.super_class = ObjectType;
  [super viewDidLoad];
  if (!qword_10001D540)
  {
    sub_100013D00();
    swift_allocObject();
    qword_10001D540 = sub_100013CF0();
    swift_release();
    uint64_t v10 = qword_10001D540;
    if (qword_10001D540)
    {
      uint64_t v11 = sub_100013F80();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
      sub_100013F60();
      swift_retain_n();
      uint64_t v12 = sub_100013F50();
      uint64_t v13 = (void *)swift_allocObject();
      v13[2] = v12;
      v13[3] = &protocol witness table for MainActor;
      v13[4] = v10;
      sub_1000046E4((uint64_t)v9, (uint64_t)&unk_10001D9A8, (uint64_t)v13);
      swift_release();
      swift_release();
    }
  }
  if (__OFADD__(qword_10001D548, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_10001D548;
    sub_1000051B4();
    [self setMaxConcurrentDecodeCount:1];
    if (qword_10001D2F0 == -1) {
      goto LABEL_6;
    }
  }
  swift_once();
LABEL_6:
  swift_beginAccess();
  v1;
  sub_100013EF0();
  if (*(void *)((qword_10001D520 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_10001D520 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_100013F20();
  sub_100013F30();
  sub_100013F10();
  swift_endAccess();
  sub_1000054E8();
  sub_1000040F4(&qword_10001D998);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100015A60;
  *(void *)(v14 + 32) = sub_100013E40();
  *(void *)(v14 + 40) = &protocol witness table for UITraitVerticalSizeClass;
  sub_100013FC0();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id result = [self hostPID];
  if ((int)result >= 1)
  {
    *(_DWORD *)uint64_t v6 = result;
    *((void *)v6 + 1) = 0xD00000000000001BLL;
    *((void *)v6 + 2) = 0x8000000100016500;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ExecutionContext.GPClientIdentity.hostProcessPID(_:), v3);
    sub_100013D40();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_1000051B4()
{
  uint64_t v0 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v1);
  uint64_t v5 = &v18[-v4];
  uint64_t v6 = type metadata accessor for VisibleView(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v18[-v11];
  uint64_t v13 = sub_1000040F4(&qword_10001D698);
  uint64_t v14 = *(int *)(v13 + 48);
  uint64_t v15 = type metadata accessor for SandboxedFile(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  *(_OWORD *)&v12[v14] = xmmword_100015BA0;
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 2, v13);
  if (qword_10001D2F8 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100013060(v0, (uint64_t)qword_10001D528);
  swift_beginAccess();
  sub_1000139A0(v16, (uint64_t)v5, (uint64_t *)&unk_10001D7D0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_100013A04((uint64_t)v5, (uint64_t *)&unk_10001D7D0);
  }
  else
  {
    sub_100011828((uint64_t)v12, type metadata accessor for VisibleView);
    sub_100013A60((uint64_t)v5, (uint64_t)v10, type metadata accessor for VisibleView);
    sub_100013A60((uint64_t)v10, (uint64_t)v12, type metadata accessor for VisibleView);
  }
  sub_100005D6C((uint64_t)v12);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v3, 1, 1, v6);
  swift_beginAccess();
  sub_100013098((uint64_t)v3, v16);
  swift_endAccess();
  return sub_100011828((uint64_t)v12, type metadata accessor for VisibleView);
}

uint64_t sub_1000054E8()
{
  uint64_t v1 = type metadata accessor for VisibleView(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v48 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v52 = (uint64_t)&v45 - v5;
  uint64_t v6 = sub_1000040F4(&qword_10001D9B0);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v49 = (uint64_t)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v50 = (uint64_t)&v45 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v54 = (uint64_t)&v45 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v45 - v17;
  id v19 = [self currentDevice];
  id v20 = [v19 userInterfaceIdiom];

  id v21 = [v0 traitCollection];
  id v22 = [v21 verticalSizeClass];

  if (v20) {
    BOOL v23 = 0;
  }
  else {
    BOOL v23 = v22 == (id)1;
  }
  int v24 = v23;
  int v53 = v24;
  v51 = v0;
  uint64_t v25 = (uint64_t)v0 + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView;
  swift_beginAccess();
  uint64_t v26 = sub_1000040F4(&qword_10001D698);
  uint64_t v27 = *(void *)(v26 - 8);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
  uint64_t v29 = v27 + 56;
  v28(v18, 2, 2, v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v18, 0, 1, v1);
  uint64_t v30 = (uint64_t)&v9[*(int *)(v7 + 56)];
  sub_1000139A0(v25, (uint64_t)v9, (uint64_t *)&unk_10001D7D0);
  sub_1000139A0((uint64_t)v18, v30, (uint64_t *)&unk_10001D7D0);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v31((uint64_t)v9, 1, v1) == 1)
  {
    sub_100013A04((uint64_t)v18, (uint64_t *)&unk_10001D7D0);
    if (v31(v30, 1, v1) == 1)
    {
      uint64_t result = sub_100013A04((uint64_t)v9, (uint64_t *)&unk_10001D7D0);
      if (v53) {
        return result;
      }
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  sub_1000139A0((uint64_t)v9, v54, (uint64_t *)&unk_10001D7D0);
  if (v31(v30, 1, v1) == 1)
  {
    sub_100013A04((uint64_t)v18, (uint64_t *)&unk_10001D7D0);
    sub_100011828(v54, type metadata accessor for VisibleView);
LABEL_13:
    uint64_t result = sub_100013A04((uint64_t)v9, &qword_10001D9B0);
    if ((v53 & 1) == 0) {
      return result;
    }
    goto LABEL_14;
  }
  uint64_t v45 = v29;
  v46 = v28;
  uint64_t v39 = v52;
  sub_100013A60(v30, v52, type metadata accessor for VisibleView);
  uint64_t v40 = v54;
  int v47 = sub_100011064(v54, v39);
  sub_100011828(v39, type metadata accessor for VisibleView);
  sub_100013A04((uint64_t)v18, (uint64_t *)&unk_10001D7D0);
  sub_100011828(v40, type metadata accessor for VisibleView);
  uint64_t result = sub_100013A04((uint64_t)v9, (uint64_t *)&unk_10001D7D0);
  if ((v53 & 1) == 0)
  {
    if ((v47 & 1) == 0) {
      return result;
    }
LABEL_19:
    uint64_t v41 = (uint64_t)v51
        + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleViewBeforeLandscapeTrap;
    swift_beginAccess();
    uint64_t v42 = v49;
    sub_1000139A0(v41, v49, (uint64_t *)&unk_10001D7D0);
    if (v31(v42, 1, v1) == 1)
    {
      sub_100013A04(v42, (uint64_t *)&unk_10001D7D0);
      return sub_1000051B4();
    }
    uint64_t v43 = v42;
    uint64_t v44 = v48;
    sub_100013A60(v43, v48, type metadata accessor for VisibleView);
    sub_100005D6C(v44);
    uint64_t v38 = v44;
    return sub_100011828(v38, type metadata accessor for VisibleView);
  }
  v28 = v46;
  if ((v47 & 1) == 0)
  {
LABEL_14:
    uint64_t v33 = v25;
    uint64_t v34 = v50;
    sub_1000139A0(v33, v50, (uint64_t *)&unk_10001D7D0);
    v35 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v28;
    uint64_t v36 = (uint64_t)v51
        + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleViewBeforeLandscapeTrap;
    swift_beginAccess();
    sub_100013098(v34, v36);
    swift_endAccess();
    uint64_t v37 = v52;
    v35(v52, 2, 2, v26);
    sub_100005D6C(v37);
    uint64_t v38 = v37;
    return sub_100011828(v38, type metadata accessor for VisibleView);
  }
  return result;
}

uint64_t sub_100005B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_100013F60();
  v4[3] = sub_100013F50();
  sub_100013D20();
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_100005BD0;
  return static ServicesStartup.preWarmServices(in:)(a4);
}

uint64_t sub_100005BD0()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100013F40();
  return _swift_task_switch(sub_100005D0C, v1, v0);
}

uint64_t sub_100005D0C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_100005D6C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100013D60();
  __chkstk_darwin(v4 - 8);
  v80 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000040F4(&qword_10001D6A0);
  __chkstk_darwin(v6 - 8);
  uint64_t v81 = (uint64_t)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = type metadata accessor for VisibleView(0);
  uint64_t v8 = *(void *)(v84 - 8);
  uint64_t v9 = __chkstk_darwin(v84);
  uint64_t v11 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v78 - v12;
  uint64_t v14 = sub_1000040F4(&qword_10001D9B0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  id v20 = (char *)&v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  BOOL v23 = (char *)&v78 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v78 - v24;
  uint64_t v83 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_currentController;
  if (!*(void *)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_currentController]) {
    goto LABEL_14;
  }
  v82 = v11;
  v78 = v20;
  uint64_t v79 = a1;
  sub_100011918(a1, (uint64_t)&v78 - v24, type metadata accessor for VisibleView);
  uint64_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  uint64_t v27 = v8;
  uint64_t v28 = v84;
  v26(v25, 0, 1, v84);
  uint64_t v29 = (uint64_t)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView];
  swift_beginAccess();
  uint64_t v30 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_1000139A0((uint64_t)v25, (uint64_t)v16, (uint64_t *)&unk_10001D7D0);
  sub_1000139A0(v29, v30, (uint64_t *)&unk_10001D7D0);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
  if (v31((uint64_t)v16, 1, v28) == 1)
  {
    sub_100013A04((uint64_t)v25, (uint64_t *)&unk_10001D7D0);
    if (v31(v30, 1, v28) == 1) {
      return (id)sub_100013A04((uint64_t)v16, (uint64_t *)&unk_10001D7D0);
    }
    goto LABEL_7;
  }
  sub_1000139A0((uint64_t)v16, (uint64_t)v23, (uint64_t *)&unk_10001D7D0);
  if (v31(v30, 1, v28) == 1)
  {
    sub_100013A04((uint64_t)v25, (uint64_t *)&unk_10001D7D0);
    sub_100011828((uint64_t)v23, type metadata accessor for VisibleView);
LABEL_7:
    sub_100013A04((uint64_t)v16, &qword_10001D9B0);
    uint64_t v8 = v27;
    uint64_t v11 = v82;
    goto LABEL_8;
  }
  sub_100013A60(v30, (uint64_t)v13, type metadata accessor for VisibleView);
  char v77 = sub_100011064((uint64_t)v23, (uint64_t)v13);
  sub_100011828((uint64_t)v13, type metadata accessor for VisibleView);
  sub_100013A04((uint64_t)v25, (uint64_t *)&unk_10001D7D0);
  sub_100011828((uint64_t)v23, type metadata accessor for VisibleView);
  id result = (id)sub_100013A04((uint64_t)v16, (uint64_t *)&unk_10001D7D0);
  uint64_t v8 = v27;
  uint64_t v11 = v82;
  if ((v77 & 1) == 0)
  {
LABEL_8:
    uint64_t v33 = *(void **)&v2[v83];
    a1 = v79;
    id v20 = v78;
    if (v33)
    {
      id v34 = v33;
      id result = [v34 view];
      if (!result)
      {
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      v35 = result;
      id v36 = [result superview];

      if (v36)
      {
        id result = [v34 view];
        if (!result)
        {
LABEL_45:
          __break(1u);
          return result;
        }
        uint64_t v37 = result;
        [result removeFromSuperview];

        [v34 removeFromParentViewController];
        uint64_t v38 = *(void **)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController];
        *(void *)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController] = 0;

        uint64_t v39 = (id *)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController];
        swift_beginAccess();
        id v34 = *v39;
        *uint64_t v39 = 0;
      }

      uint64_t v11 = v82;
    }
LABEL_14:
    sub_100011918(a1, (uint64_t)v11, type metadata accessor for VisibleView);
    uint64_t v40 = sub_1000040F4(&qword_10001D698);
    int v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 48))(v11, 2, v40);
    if (v41)
    {
      if (v41 == 1)
      {
        uint64_t v42 = a1;
        id v43 = [objc_allocWithZone((Class)GPInProcessImagePickerViewController) initWithStyle:0];
        [v43 setDelegate:v2];
        swift_retain();
        sub_100013FE0();
        id v44 = sub_100004B4C();
        [v43 setAppleConnectTokenProvider:v44];

        uint64_t v45 = (void **)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController];
        v46 = *(void **)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController];
        *(void *)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController] = v43;
        a1 = v42;
      }
      else
      {
        sub_100013D50();
        id v57 = objc_allocWithZone((Class)sub_1000040F4(&qword_10001D9B8));
        uint64_t v58 = sub_100013E60();
        uint64_t v45 = (void **)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController];
        v46 = *(void **)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController];
        *(void *)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController] = v58;
      }
    }
    else
    {
      uint64_t v47 = a1;
      uint64_t v48 = (uint64_t *)&v11[*(int *)(v40 + 48)];
      uint64_t v49 = *v48;
      unint64_t v50 = v48[1];
      uint64_t v51 = v81;
      sub_10001189C((uint64_t)v11, v81);
      id v52 = [objc_allocWithZone((Class)GPInProcessImageEditionViewController) initWithStyle:0];
      [v52 setDelegate:v2];
      swift_retain();
      sub_100013FF0();
      id v53 = sub_100004B4C();
      [v52 setAppleConnectTokenProvider:v53];

      uint64_t v45 = (void **)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController];
      swift_beginAccess();
      uint64_t v54 = *v45;
      *uint64_t v45 = v52;

      swift_beginAccess();
      v55 = *v45;
      if (*v45)
      {
        swift_endAccess();
        id v56 = v55;
        sub_100006730(v51, v49, v50);

        sub_100011888(v49, v50);
        sub_100013A04(v51, &qword_10001D6A0);
      }
      else
      {
        sub_100013A04(v51, &qword_10001D6A0);
        swift_endAccess();
        sub_100011888(v49, v50);
      }
      a1 = v47;
    }
    uint64_t v60 = v83;
    uint64_t v59 = v84;
    v61 = *v45;
    v62 = *(void **)&v2[v83];
    *(void *)&v2[v83] = *v45;
    id v63 = v61;

    id result = *(id *)&v2[v60];
    if (result)
    {
      id result = [result willMoveToParentViewController:v2];
      if (*(void *)&v2[v60])
      {
        [v2 addChildViewController:];
        id result = [v2 view];
        if (result)
        {
          v64 = result;
          id result = *(id *)&v2[v60];
          if (result)
          {
            id result = [result view];
            if (result)
            {
              v65 = result;
              [v64 addSubview:result];

              id result = *(id *)&v2[v60];
              if (result)
              {
                id result = [result view];
                if (result)
                {
                  v66 = result;
                  id result = [v2 view];
                  if (result)
                  {
                    v67 = result;
                    [result bounds];
                    double v69 = v68;
                    double v71 = v70;
                    double v73 = v72;
                    double v75 = v74;

                    [v66 setFrame:v69, v71, v73, v75];
                    id result = *(id *)&v2[v60];
                    if (result)
                    {
                      [result didMoveToParentViewController:v2];
                      sub_100011918(a1, (uint64_t)v20, type metadata accessor for VisibleView);
                      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v20, 0, 1, v59);
                      uint64_t v76 = (uint64_t)&v2[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView];
                      swift_beginAccess();
                      sub_100013098((uint64_t)v20, v76);
                      return (id)swift_endAccess();
                    }
                    goto LABEL_43;
                  }
LABEL_42:
                  __break(1u);
LABEL_43:
                  __break(1u);
                  goto LABEL_44;
                }
LABEL_41:
                __break(1u);
                goto LABEL_42;
              }
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_37;
  }
  return result;
}

void sub_100006730(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  sub_1000040F4(&qword_10001D6A0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SandboxedFile(0);
  uint64_t v11 = *(void *)(v10 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 >> 60 != 15)
  {
    sub_10001382C(0, &qword_10001D960);
    sub_10000CAEC(a2, a3);
    uint64_t v14 = (void *)sub_100014000();
    uint64_t v15 = (void *)sub_100013C40();
    [v14 setAdditionalMetadata:v15];

    [v4 setRecipe:v14];
    sub_100011888(a2, a3);
  }
  sub_1000139A0(a1, (uint64_t)v9, &qword_10001D6A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_100013A04((uint64_t)v9, &qword_10001D6A0);
    if (qword_10001D2E8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_100013E30();
    sub_100013060(v16, (uint64_t)qword_10001D508);
    uint64_t v17 = sub_100013E20();
    os_log_type_t v18 = sub_100013FB0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Didn't have a sandboxed file for the editor view.", v19, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v20 = sub_100013A60((uint64_t)v9, (uint64_t)v13, type metadata accessor for SandboxedFile);
    __chkstk_darwin(v20);
    *(&v21 - 2) = (uint64_t)v13;
    *(&v21 - 1) = (uint64_t)v4;
    sub_10000B340((void (*)(void))sub_100013AC8, (uint64_t)(&v21 - 4));
    sub_100011828((uint64_t)v13, type metadata accessor for SandboxedFile);
  }
}

id sub_100006A54(void *a1)
{
  id result = [a1 draftAssetArchives];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_100013F00();

    uint64_t v5 = v1;
    uint64_t v6 = sub_100011BD4(v4);
    swift_bridgeObjectRelease();

    uint64_t v7 = *((void *)v6 + 2);
    if (v7)
    {
      uint64_t v8 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController;
      uint64_t v9 = (Swift::Int *)(v6 + 40);
      do
      {
        Swift::Int v13 = *(v9 - 1);
        Swift::Int v12 = *v9;
        swift_beginAccess();
        swift_bridgeObjectRetain_n();
        sub_10000F164(&v15, v13, v12);
        swift_endAccess();
        swift_bridgeObjectRelease();
        uint64_t v14 = *(void **)&v5[v8];
        if (v14)
        {
          id v10 = v14;
          uint64_t v11 = (void *)sub_100013E80();
          swift_bridgeObjectRelease();
          [v10 delegate:v5 didStageAssetWithIdentifier:v11];
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v9 += 2;
        --v7;
      }
      while (v7);
      return (id)swift_bridgeObjectRelease();
    }
    else
    {
      return (id)swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_100006BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_100013F60();
  v5[3] = sub_100013F50();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100006CAC;
  return sub_100006DE8(a5);
}

uint64_t sub_100006CAC()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100013F40();
  return _swift_task_switch(sub_100013B38, v1, v0);
}

uint64_t sub_100006DE8(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_100013D70();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_100013CB0();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  sub_1000040F4(&qword_10001D950);
  v2[14] = swift_task_alloc();
  uint64_t v5 = sub_100013CE0();
  v2[15] = v5;
  v2[16] = *(void *)(v5 - 8);
  v2[17] = swift_task_alloc();
  sub_100013F60();
  v2[18] = sub_100013F50();
  uint64_t v7 = sub_100013F40();
  v2[19] = v7;
  v2[20] = v6;
  return _swift_task_switch(sub_100006FD4, v7, v6);
}

uint64_t sub_100006FD4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController;
  v0[21] = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController;
  uint64_t v3 = *(void **)(v1 + v2);
  uint64_t v4 = v1;
  if (v3)
  {
    id v5 = [v3 recipe];
    if (v5) {
      goto LABEL_6;
    }
    uint64_t v4 = v0[6];
  }
  uint64_t v6 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController;
  v0[22] = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController;
  uint64_t v7 = (id *)(v4 + v6);
  swift_beginAccess();
  if (*v7)
  {
    id v5 = [*v7 recipe];
    if (v5)
    {
LABEL_6:

      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v8 = (uint64_t (*)(void))v0[1];
      return v8();
    }
  }
  id v10 = *(void **)(v1 + v2);
  if (v10) {
    [v10 setIsLoadingRecipe:1];
  }
  if (*v7) {
    [*v7 setIsLoadingRecipe:1];
  }
  uint64_t v11 = (void *)swift_task_alloc();
  v0[23] = v11;
  void *v11 = v0;
  v11[1] = sub_100007190;
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[5];
  return sub_10000863C(v12, v13);
}

uint64_t sub_100007190()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    id v5 = sub_1000076F4;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    id v5 = sub_1000072B4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000072B4()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[14];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v4, v2);
  id v44 = &_swiftEmptyArrayStorage;
  sub_100013CD0();
  if (v5)
  {
    sub_100013C90();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)sub_10000E8A4(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    unint64_t v8 = v6[2];
    unint64_t v7 = v6[3];
    if (v8 >= v7 >> 1) {
      uint64_t v6 = (void *)sub_10000E8A4(v7 > 1, v8 + 1, 1, (unint64_t)v6);
    }
    uint64_t v9 = v0[13];
    uint64_t v10 = v0[10];
    uint64_t v11 = v0[11];
    v6[2] = v8 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))((unint64_t)v6+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v8, v9, v10);
    id v44 = v6;
  }
  else
  {
    uint64_t v6 = &_swiftEmptyArrayStorage;
  }
  uint64_t v12 = sub_100013CC0();
  if (v12)
  {
    uint64_t v13 = v12;
    int64_t v14 = *(void *)(v12 + 16);
    if (v14)
    {
      uint64_t v15 = v0[11];
      uint64_t v16 = v0[8];
      uint64_t v45 = &_swiftEmptyArrayStorage;
      sub_1000105B4(0, v14, 0);
      uint64_t v17 = *(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16);
      v16 += 16;
      unint64_t v18 = v13 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
      uint64_t v42 = *(void *)(v16 + 56);
      id v43 = v17;
      uint64_t v19 = (void (**)(uint64_t, uint64_t))(v16 - 8);
      uint64_t v20 = &_swiftEmptyArrayStorage;
      do
      {
        uint64_t v21 = v0[9];
        uint64_t v22 = v0[7];
        v43(v21, v18, v22);
        sub_100013CA0();
        (*v19)(v21, v22);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000105B4(0, v20[2] + 1, 1);
          uint64_t v20 = v45;
        }
        unint64_t v24 = v20[2];
        unint64_t v23 = v20[3];
        if (v24 >= v23 >> 1)
        {
          sub_1000105B4(v23 > 1, v24 + 1, 1);
          uint64_t v20 = v45;
        }
        uint64_t v25 = v0[12];
        uint64_t v26 = v0[10];
        v20[2] = v24 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 32))((unint64_t)v20+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v24, v25, v26);
        uint64_t v45 = v20;
        v18 += v42;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v20 = &_swiftEmptyArrayStorage;
    }
    sub_100008DA8((uint64_t)v20);
    uint64_t v6 = v44;
  }
  uint64_t v27 = v0[21];
  if (v6[2])
  {
    uint64_t v28 = v0[6];
    uint64_t v29 = *(void **)(v28 + v27);
    if (v29 || (uint64_t v29 = *(void **)(v28 + v0[22])) != 0)
    {
      sub_10001382C(0, &qword_10001D960);
      id v30 = v29;
      uint64_t v31 = (void *)sub_100014000();
      [v30 setRecipe:v31];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v32 = v0[21];
    uint64_t v33 = v0[6];
    (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
    id v34 = *(void **)(v33 + v32);
    if (v34) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v39 = v0[16];
    uint64_t v38 = v0[17];
    uint64_t v40 = v0[15];
    uint64_t v41 = v0[6];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    id v34 = *(void **)(v41 + v27);
    if (v34) {
LABEL_22:
    }
      [v34 setIsLoadingRecipe:0];
  }
  v35 = *(void **)(v0[6] + v0[22]);
  if (v35) {
    [v35 setIsLoadingRecipe:0];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v36 = (uint64_t (*)(void))v0[1];
  return v36();
}

uint64_t sub_1000076F4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[6];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v4, 1, 1, v2);
  sub_100013A04(v4, &qword_10001D950);
  uint64_t v6 = *(void **)(v5 + v1);
  if (v6) {
    [v6 setIsLoadingRecipe:0];
  }
  unint64_t v7 = *(void **)(v0[6] + v0[22]);
  if (v7) {
    [v7 setIsLoadingRecipe:0];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10000799C(void *a1)
{
  uint64_t v3 = sub_100012404(a1);
  unint64_t v5 = v4;
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = a1;
  swift_retain();
  id v8 = a1;
  id v9 = [v1 activeConversation];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)sub_100013C40();
    aBlock[4] = sub_100013458;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000085D0;
    aBlock[3] = &unk_100018C60;
    uint64_t v12 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v10 _insertAssetArchive:v11 completionHandler:v12];
    _Block_release(v12);
    swift_release();
    swift_release();

    return sub_10000CC7C((uint64_t)v3, v5);
  }
  else
  {
    swift_release();
    swift_release();
    return sub_10000CC7C((uint64_t)v3, v5);
  }
}

void sub_100007D34(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    if (a1)
    {
      swift_errorRetain();
      if (qword_10001D2E8 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_100013E30();
      sub_100013060(v7, (uint64_t)qword_10001D508);
      swift_errorRetain();
      swift_errorRetain();
      id v8 = sub_100013E20();
      os_log_type_t v9 = sub_100013FB0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        v17[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 136315138;
        swift_getErrorValue();
        uint64_t v11 = sub_100014160();
        Swift::Int v18 = sub_10000EB0C(v11, v12, v17);
        sub_100014030();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to stage asset with error: %s", v10, 0xCu);
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
    else
    {
      id v13 = [a3 identifier];
      Swift::Int v14 = sub_100013EA0();
      Swift::Int v16 = v15;

      swift_beginAccess();
      sub_10000F164(&v18, v14, v16);
      swift_endAccess();

      swift_bridgeObjectRelease();
    }
  }
}

void sub_100007FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  id v8 = [v3 activeConversation];
  if (v8)
  {
    os_log_type_t v9 = v8;
    uint64_t v10 = (void *)sub_100013E80();
    v12[4] = sub_100013344;
    v12[5] = v7;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_1000085D0;
    v12[3] = &unk_100018C10;
    uint64_t v11 = _Block_copy(v12);
    swift_retain();
    swift_release();
    [v9 _removeAssetArchiveWithIdentifier:v10 completionHandler:v11];
    _Block_release(v11);
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
  }
}

void sub_100008170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (void *)Strong;
    if (a1)
    {
      swift_errorRetain();
      if (qword_10001D2E8 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_100013E30();
      sub_100013060(v9, (uint64_t)qword_10001D508);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v10 = sub_100013E20();
      os_log_type_t v11 = sub_100013FB0();
      if (os_log_type_enabled(v10, v11))
      {
        unint64_t v12 = (uint8_t *)swift_slowAlloc();
        v15[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v12 = 136315138;
        swift_getErrorValue();
        uint64_t v13 = sub_100014160();
        sub_10000EB0C(v13, v14, v15);
        sub_100014030();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to unstage asset with error: %s", v12, 0xCu);
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
    else
    {
      swift_beginAccess();
      sub_10000FBF4(a3, a4);
      swift_endAccess();

      swift_bridgeObjectRelease();
    }
  }
}

unint64_t sub_1000084B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000040F4(&qword_10001D880);
  uint64_t v2 = (void *)sub_100014100();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_10000FF4C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
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

void sub_1000085D0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000863C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_100013D90();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_100013F60();
  v3[8] = sub_100013F50();
  uint64_t v6 = sub_100013F40();
  v3[9] = v6;
  v3[10] = v5;
  return _swift_task_switch(sub_100008734, v6, v5);
}

uint64_t sub_100008734()
{
  id v1 = [*(id *)(v0 + 24) contextItems];
  sub_10001382C(0, &qword_10001D970);
  unint64_t v2 = sub_100013F00();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000140D0();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_22;
    }
  }
  uint64_t v4 = sub_100010578(0, v3 & ~(v3 >> 63), 0);
  if (v3 < 0)
  {
    __break(1u);
    return VisualSummarizationClient.summarizeContext(from:precomputedSummary:)(v4, v5, v6, v7);
  }
  uint64_t v8 = 0;
  unint64_t v32 = v2 & 0xC000000000000001;
  uint64_t v33 = *(void *)(v0 + 48);
  uint64_t v31 = v33 + 32;
  unint64_t v35 = v2;
  uint64_t v34 = v3;
  do
  {
    if (v32) {
      id v9 = (id)sub_100014090();
    }
    else {
      id v9 = *(id *)(v2 + 8 * v8 + 32);
    }
    uint64_t v10 = v9;
    id v11 = [v9 timestamp:v31];
    sub_1000040F4(&qword_10001D978);
    uint64_t v12 = swift_task_alloc();
    if (v11)
    {
      sub_100013C70();

      uint64_t v13 = sub_100013C80();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
    }
    else
    {
      uint64_t v14 = sub_100013C80();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 1, 1, v14);
    }
    id v15 = [v10 messageContent];
    if (v15)
    {
      Swift::Int v16 = v15;
      sub_100013EA0();
    }
    id v17 = [v10 senderHandle];
    if (v17)
    {
      Swift::Int v18 = v17;
      sub_100013EA0();
    }
    id v19 = [v10 senderDisplayName];
    if (v19)
    {
      uint64_t v20 = v19;
      sub_100013EA0();
    }
    sub_100013D80();

    swift_task_dealloc();
    unint64_t v22 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v21 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v22 >= v21 >> 1) {
      sub_100010578(v21 > 1, v22 + 1, 1);
    }
    uint64_t v23 = *(void *)(v0 + 56);
    uint64_t v24 = *(void *)(v0 + 40);
    ++v8;
    *((void *)&_swiftEmptyArrayStorage + 2) = v22 + 1;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))((char *)&_swiftEmptyArrayStorage+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v22, v23, v24);
    unint64_t v2 = v35;
  }
  while (v34 != v8);
LABEL_22:
  swift_bridgeObjectRelease();
  *(void *)(v0 + 88) = &_swiftEmptyArrayStorage;
  id v25 = [*(id *)(v0 + 24) generatedSummary];
  uint64_t v26 = sub_100013EA0();
  uint64_t v28 = v27;

  *(void *)(v0 + 96) = v28;
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v29;
  void *v29 = v0;
  v29[1] = sub_100008B90;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  uint64_t v6 = v26;
  uint64_t v7 = v28;
  return VisualSummarizationClient.summarizeContext(from:precomputedSummary:)(v4, v5, v6, v7);
}

uint64_t sub_100008B90()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_100008D20;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 72);
    uint64_t v4 = *(void *)(v2 + 80);
    uint64_t v5 = sub_100008CB4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100008CB4()
{
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100008D20()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100008DA8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_10000E8A4(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(sub_100013CB0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100014110();
  __break(1u);
  return result;
}

void sub_100008F4C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_100014090();
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      int64_t v5 = v4;
      type metadata accessor for GPMessagesViewController(0);
      char v6 = sub_100014010();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)sub_100014090();
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_100014010();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_1000140D0();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_1000090D8(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    unint64_t v3 = sub_100010838(v3);
    unint64_t *v1 = v3;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      sub_100013F10();
      return v10;
    }
  }
  uint64_t result = sub_100014110();
  __break(1u);
  return result;
}

id sub_1000091BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider] = 0;
  *(void *)&v3[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_currentController] = 0;
  uint64_t v8 = &v3[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView];
  uint64_t v9 = type metadata accessor for VisibleView(0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v8, 1, 1, v9);
  uint64_t v11 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_contextSummarizer;
  sub_100013DC0();
  swift_allocObject();
  unint64_t v12 = v4;
  *(void *)&v4[v11] = sub_100013DB0();
  *(void *)&v12[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers] = &_swiftEmptySetSingleton;
  v10(&v12[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleViewBeforeLandscapeTrap], 1, 1, v9);

  if (a2)
  {
    unint64_t v13 = (void *)sub_100013E80();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v13 = 0;
  }
  v16.receiver = v12;
  v16.super_class = ObjectType;
  [super initWithNibName:v13 bundle:a3];

  return v14;
}

id sub_1000093C4(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_currentController] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView];
  uint64_t v6 = type metadata accessor for VisibleView(0);
  unint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  uint64_t v8 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_contextSummarizer;
  sub_100013DC0();
  swift_allocObject();
  uint64_t v9 = v2;
  *(void *)&v2[v8] = sub_100013DB0();
  *(void *)&v9[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers] = &_swiftEmptySetSingleton;
  v7(&v9[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleViewBeforeLandscapeTrap], 1, 1, v6);

  v12.receiver = v9;
  v12.super_class = ObjectType;
  [super initWithCoder:a1];

  return v10;
}

id sub_100009560(char a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController____lazy_storage___appleConnectTokenProvider] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_gpEditController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_landscapeTrapController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_currentController] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleView];
  uint64_t v6 = type metadata accessor for VisibleView(0);
  unint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  uint64_t v8 = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_contextSummarizer;
  sub_100013DC0();
  swift_allocObject();
  uint64_t v9 = v2;
  *(void *)&v2[v8] = sub_100013DB0();
  *(void *)&v9[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers] = &_swiftEmptySetSingleton;
  v7(&v9[OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_visibleViewBeforeLandscapeTrap], 1, 1, v6);

  v11.receiver = v9;
  v11.super_class = ObjectType;
  return [super initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

void sub_1000096F0()
{
  sub_10000DD3C(319, &qword_10001D5D0, (void (*)(uint64_t))type metadata accessor for VisibleView);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for VisibleView(uint64_t a1)
{
  return sub_10000CAB4(a1, (uint64_t *)&unk_10001D718);
}

uint64_t sub_100009864(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  v2[16] = sub_100013F60();
  v2[17] = sub_100013F50();
  uint64_t v4 = sub_100013F40();
  v2[18] = v4;
  v2[19] = v3;
  return _swift_task_switch(sub_100009900, v4, v3);
}

uint64_t sub_100009900()
{
  unint64_t v1 = v0[14];
  if (v1 >> 62)
  {
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000140D0();
    uint64_t v2 = v3;
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  v0[20] = v2;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    id v25 = &_swiftEmptyArrayStorage;
    goto LABEL_21;
  }
  v0[21] = OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers;
  if (v2 < 1)
  {
    __break(1u);
    return _swift_task_switch(v3, v4, v5);
  }
  swift_beginAccess();
  uint64_t v6 = 0;
  for (uint64_t i = (char *)&_swiftEmptyArrayStorage; ; uint64_t i = (char *)v0[24])
  {
    v0[22] = v6;
    uint64_t v8 = v0[14];
    if ((v8 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_100014090();
    }
    else {
      id v9 = *(id *)(v8 + 8 * v6 + 32);
    }
    id v10 = v9;
    v0[23] = v9;
    id v11 = [v9 identifier];
    uint64_t v12 = sub_100013EA0();
    uint64_t v14 = v13;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t i = sub_10000E794(0, *((void *)i + 2) + 1, 1, i);
    }
    unint64_t v16 = *((void *)i + 2);
    unint64_t v15 = *((void *)i + 3);
    if (v16 >= v15 >> 1) {
      uint64_t i = sub_10000E794((char *)(v15 > 1), v16 + 1, 1, i);
    }
    v0[24] = i;
    uint64_t v17 = v0[21];
    uint64_t v18 = v0[15];
    *((void *)i + 2) = v16 + 1;
    uint64_t v19 = &i[16 * v16];
    *((void *)v19 + 4) = v12;
    *((void *)v19 + 5) = v14;
    uint64_t v20 = *(void *)(v18 + v17);
    swift_bridgeObjectRetain();
    id v21 = [v10 identifier];
    uint64_t v22 = sub_100013EA0();
    uint64_t v24 = v23;

    LOBYTE(v21) = sub_10000A5C4(v22, v24, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      v0[25] = sub_100013F50();
      uint64_t v26 = sub_100013F40();
      uint64_t v28 = v27;
      uint64_t v3 = (uint64_t)sub_100009F64;
      uint64_t v4 = v26;
      uint64_t v5 = v28;
      return _swift_task_switch(v3, v4, v5);
    }

    uint64_t v6 = v0[22] + 1;
    if (v6 == v0[20]) {
      break;
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  id v25 = (void *)v0[24];
LABEL_21:
  uint64_t v29 = v0[15]
      + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers;
  swift_beginAccess();
  uint64_t v60 = *(void *)v29 + 56;
  uint64_t v30 = -1;
  uint64_t v31 = -1 << *(unsigned char *)(*(void *)v29 + 32);
  if (-v31 < 64) {
    uint64_t v30 = ~(-1 << -(char)v31);
  }
  unint64_t v32 = v30 & *(void *)(*(void *)v29 + 56);
  int64_t v61 = (unint64_t)(63 - v31) >> 6;
  uint64_t v62 = *(void *)v29;
  swift_bridgeObjectRetain();
  int64_t v33 = 0;
  uint64_t v58 = v25 + 9;
  uint64_t v59 = v25;
  while (1)
  {
LABEL_25:
    if (v32)
    {
      unint64_t v34 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      unint64_t v35 = v34 | (v33 << 6);
      goto LABEL_41;
    }
    int64_t v36 = v33 + 1;
    if (__OFADD__(v33, 1))
    {
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
      goto LABEL_71;
    }
    if (v36 >= v61) {
      goto LABEL_65;
    }
    unint64_t v37 = *(void *)(v60 + 8 * v36);
    ++v33;
    if (!v37)
    {
      int64_t v33 = v36 + 1;
      if (v36 + 1 >= v61) {
        goto LABEL_65;
      }
      unint64_t v37 = *(void *)(v60 + 8 * v33);
      if (!v37)
      {
        int64_t v33 = v36 + 2;
        if (v36 + 2 >= v61) {
          goto LABEL_65;
        }
        unint64_t v37 = *(void *)(v60 + 8 * v33);
        if (!v37) {
          break;
        }
      }
    }
LABEL_40:
    unint64_t v32 = (v37 - 1) & v37;
    unint64_t v35 = __clz(__rbit64(v37)) + (v33 << 6);
LABEL_41:
    uint64_t v39 = (uint64_t *)(*(void *)(v62 + 48) + 16 * v35);
    uint64_t v41 = *v39;
    uint64_t v40 = v39[1];
    uint64_t v42 = v25[2];
    if (!v42) {
      goto LABEL_48;
    }
    BOOL v43 = v25[4] == v41 && v25[5] == v40;
    if (!v43 && (sub_100014130() & 1) == 0)
    {
      if (v42 == 1) {
        goto LABEL_48;
      }
      BOOL v51 = v25[6] == v41 && v25[7] == v40;
      if (!v51 && (sub_100014130() & 1) == 0)
      {
        if (v42 != 2)
        {
          id v52 = v58;
          uint64_t v53 = 2;
          do
          {
            uint64_t v54 = v53 + 1;
            if (__OFADD__(v53, 1)) {
              goto LABEL_70;
            }
            BOOL v55 = *(v52 - 1) == v41 && *v52 == v40;
            if (v55 || (sub_100014130() & 1) != 0) {
              goto LABEL_25;
            }
            ++v53;
            v52 += 2;
          }
          while (v54 != v42);
        }
LABEL_48:
        id v44 = (void *)v0[15];
        uint64_t v45 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v46 = (void *)swift_allocObject();
        v46[2] = v45;
        v46[3] = v41;
        v46[4] = v40;
        swift_bridgeObjectRetain_n();
        swift_retain();
        id v47 = [v44 activeConversation];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = (void *)sub_100013E80();
          v0[6] = sub_100013B1C;
          v0[7] = v46;
          v0[2] = _NSConcreteStackBlock;
          v0[3] = 1107296256;
          v0[4] = sub_1000085D0;
          v0[5] = &unk_100018D28;
          unint64_t v50 = _Block_copy(v0 + 2);
          swift_retain();
          swift_release();
          [v48 _removeAssetArchiveWithIdentifier:v49 completionHandler:v50];
          _Block_release(v50);
        }
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        id v25 = v59;
        continue;
      }
    }
  }
  int64_t v38 = v36 + 3;
  if (v38 < v61)
  {
    unint64_t v37 = *(void *)(v60 + 8 * v38);
    if (!v37)
    {
      while (1)
      {
        int64_t v33 = v38 + 1;
        if (__OFADD__(v38, 1)) {
          goto LABEL_69;
        }
        if (v33 >= v61) {
          goto LABEL_65;
        }
        unint64_t v37 = *(void *)(v60 + 8 * v33);
        ++v38;
        if (v37) {
          goto LABEL_40;
        }
      }
    }
    int64_t v33 = v38;
    goto LABEL_40;
  }
LABEL_65:
  swift_release();
  swift_bridgeObjectRelease();
  id v56 = (uint64_t (*)(void))v0[1];
  return v56();
}

uint64_t sub_100009F64()
{
  unint64_t v1 = (void *)v0[23];
  swift_release();
  sub_10000799C(v1);
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  return _swift_task_switch(sub_100009FD8, v2, v3);
}

uint64_t sub_100009FD8()
{
  uint64_t v1 = *(void *)(v0 + 176) + 1;
  if (v1 == *(void *)(v0 + 160))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v2 = *(void **)(v0 + 192);
    uint64_t v3 = *(void *)(v0 + 120)
       + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers;
    swift_beginAccess();
    uint64_t v58 = *(void *)v3 + 56;
    uint64_t v4 = -1;
    uint64_t v5 = -1 << *(unsigned char *)(*(void *)v3 + 32);
    if (-v5 < 64) {
      uint64_t v4 = ~(-1 << -(char)v5);
    }
    unint64_t v6 = v4 & *(void *)(*(void *)v3 + 56);
    int64_t v59 = (unint64_t)(63 - v5) >> 6;
    uint64_t v60 = *(void *)v3;
    uint64_t v7 = swift_bridgeObjectRetain();
    int64_t v10 = 0;
    id v56 = v2 + 9;
    id v57 = v2;
    while (1)
    {
      while (1)
      {
LABEL_6:
        if (v6)
        {
          unint64_t v11 = __clz(__rbit64(v6));
          v6 &= v6 - 1;
          unint64_t v12 = v11 | (v10 << 6);
        }
        else
        {
          int64_t v13 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
LABEL_63:
            __break(1u);
LABEL_64:
            __break(1u);
            return _swift_task_switch(v7, v8, v9);
          }
          if (v13 >= v59) {
            goto LABEL_46;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          ++v10;
          if (!v14)
          {
            int64_t v10 = v13 + 1;
            if (v13 + 1 >= v59) {
              goto LABEL_46;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v10);
            if (!v14)
            {
              int64_t v10 = v13 + 2;
              if (v13 + 2 >= v59) {
                goto LABEL_46;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v10);
              if (!v14)
              {
                int64_t v15 = v13 + 3;
                if (v15 >= v59)
                {
LABEL_46:
                  swift_release();
                  swift_bridgeObjectRelease();
                  int64_t v33 = *(uint64_t (**)(void))(v0 + 8);
                  return v33();
                }
                unint64_t v14 = *(void *)(v58 + 8 * v15);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v10 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_63;
                    }
                    if (v10 >= v59) {
                      goto LABEL_46;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v10);
                    ++v15;
                    if (v14) {
                      goto LABEL_21;
                    }
                  }
                }
                int64_t v10 = v15;
              }
            }
          }
LABEL_21:
          unint64_t v6 = (v14 - 1) & v14;
          unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
        }
        unint64_t v16 = (uint64_t *)(*(void *)(v60 + 48) + 16 * v12);
        uint64_t v18 = *v16;
        uint64_t v17 = v16[1];
        uint64_t v19 = v2[2];
        if (v19) {
          break;
        }
LABEL_29:
        id v21 = *(void **)(v0 + 120);
        uint64_t v22 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v23 = (void *)swift_allocObject();
        v23[2] = v22;
        v23[3] = v18;
        v23[4] = v17;
        swift_bridgeObjectRetain_n();
        swift_retain();
        id v24 = [v21 activeConversation];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = (void *)sub_100013E80();
          *(void *)(v0 + 48) = sub_100013B1C;
          *(void *)(v0 + 56) = v23;
          *(void *)(v0 + 16) = _NSConcreteStackBlock;
          *(void *)(v0 + 24) = 1107296256;
          *(void *)(v0 + 32) = sub_1000085D0;
          *(void *)(v0 + 40) = &unk_100018D28;
          uint64_t v27 = _Block_copy((const void *)(v0 + 16));
          swift_retain();
          swift_release();
          [v25 _removeAssetArchiveWithIdentifier:v26 completionHandler:v27];
          _Block_release(v27);
        }
        swift_release();
        swift_release();
        uint64_t v7 = swift_bridgeObjectRelease();
        uint64_t v2 = v57;
      }
      uint64_t v7 = v2[4];
      uint64_t v8 = v2[5];
      if (v7 != v18 || v8 != v17)
      {
        uint64_t v7 = sub_100014130();
        if ((v7 & 1) == 0)
        {
          if (v19 == 1) {
            goto LABEL_29;
          }
          uint64_t v7 = v2[6];
          uint64_t v8 = v2[7];
          if (v7 != v18 || v8 != v17)
          {
            uint64_t v7 = sub_100014130();
            if ((v7 & 1) == 0)
            {
              if (v19 != 2)
              {
                uint64_t v29 = v56;
                uint64_t v30 = 2;
                while (1)
                {
                  uint64_t v31 = v30 + 1;
                  if (__OFADD__(v30, 1)) {
                    goto LABEL_64;
                  }
                  uint64_t v7 = *(v29 - 1);
                  uint64_t v8 = *v29;
                  if (v7 == v18 && v8 == v17) {
                    goto LABEL_6;
                  }
                  uint64_t v7 = sub_100014130();
                  if (v7) {
                    goto LABEL_6;
                  }
                  ++v30;
                  v29 += 2;
                  if (v31 == v19) {
                    goto LABEL_29;
                  }
                }
              }
              goto LABEL_29;
            }
          }
        }
      }
    }
  }
  while (1)
  {
    unint64_t v35 = *(char **)(v0 + 192);
    *(void *)(v0 + 176) = v1;
    uint64_t v36 = *(void *)(v0 + 112);
    if ((v36 & 0xC000000000000001) != 0) {
      id v37 = (id)sub_100014090();
    }
    else {
      id v37 = *(id *)(v36 + 8 * v1 + 32);
    }
    int64_t v38 = v37;
    *(void *)(v0 + 184) = v37;
    id v39 = [v37 identifier];
    uint64_t v40 = sub_100013EA0();
    uint64_t v42 = v41;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v35 = sub_10000E794(0, *((void *)v35 + 2) + 1, 1, v35);
    }
    unint64_t v44 = *((void *)v35 + 2);
    unint64_t v43 = *((void *)v35 + 3);
    if (v44 >= v43 >> 1) {
      unint64_t v35 = sub_10000E794((char *)(v43 > 1), v44 + 1, 1, v35);
    }
    *(void *)(v0 + 192) = v35;
    uint64_t v45 = *(void *)(v0 + 168);
    uint64_t v46 = *(void *)(v0 + 120);
    *((void *)v35 + 2) = v44 + 1;
    id v47 = &v35[16 * v44];
    *((void *)v47 + 4) = v40;
    *((void *)v47 + 5) = v42;
    uint64_t v48 = *(void *)(v46 + v45);
    swift_bridgeObjectRetain();
    id v49 = [v38 identifier];
    uint64_t v50 = sub_100013EA0();
    uint64_t v52 = v51;

    LOBYTE(v49) = sub_10000A5C4(v50, v52, v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v49 & 1) == 0) {
      break;
    }

    uint64_t v1 = *(void *)(v0 + 176) + 1;
    if (v1 == *(void *)(v0 + 160)) {
      goto LABEL_2;
    }
  }
  *(void *)(v0 + 200) = sub_100013F50();
  uint64_t v53 = sub_100013F40();
  uint64_t v55 = v54;
  uint64_t v7 = (uint64_t)sub_100009F64;
  uint64_t v8 = v53;
  uint64_t v9 = v55;
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_10000A5C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1000141B0();
    sub_100013EC0();
    Swift::Int v6 = sub_1000141C0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100014130() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100014130() & 1) != 0) {
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

uint64_t sub_10000A6FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_100013F60();
  v5[4] = sub_100013F50();
  uint64_t v7 = sub_100013F40();
  v5[5] = v7;
  v5[6] = v6;
  return _swift_task_switch(sub_10000A794, v7, v6);
}

uint64_t sub_10000A794()
{
  id v1 = [*(id *)(v0 + 24) selectedAssets];
  sub_10001382C(0, &qword_10001D860);
  uint64_t v2 = sub_100013F00();
  *(void *)(v0 + 56) = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10000A874;
  return sub_100009864(v2);
}

uint64_t sub_10000A874()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return _swift_task_switch(sub_10000A9B8, v3, v2);
}

uint64_t sub_10000A9B8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_10000AB64(char a1, void *a2)
{
  uint64_t v4 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    if (qword_10001D2F0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v13 = qword_10001D520;
    if ((unint64_t)qword_10001D520 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_1000140D0();
      uint64_t v14 = (uint64_t)result;
      if (!result) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v14 = *(void *)((qword_10001D520 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (!v14) {
        goto LABEL_16;
      }
    }
    if (v14 < 1)
    {
      __break(1u);
      return result;
    }
    for (uint64_t i = 0; i != v14; ++i)
    {
      if ((v13 & 0xC000000000000001) != 0) {
        id v16 = (id)sub_100014090();
      }
      else {
        id v16 = *(id *)(v13 + 8 * i + 32);
      }
      BOOL v17 = v16;
      [v16 dismiss];
    }
LABEL_16:
    swift_bridgeObjectRelease();
    qword_10001D520 = (uint64_t)&_swiftEmptyArrayStorage;
    return (id)swift_bridgeObjectRelease();
  }
  if (qword_10001D2F8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100013060(v4, (uint64_t)qword_10001D528);
  uint64_t v8 = sub_1000040F4(&qword_10001D698);
  uint64_t v9 = *(int *)(v8 + 48);
  uint64_t v10 = type metadata accessor for SandboxedFile(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  *(_OWORD *)&v6[v9] = xmmword_100015BA0;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 2, v8);
  uint64_t v11 = type metadata accessor for VisibleView(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
  swift_beginAccess();
  sub_100013098((uint64_t)v6, v7);
  swift_endAccess();
  return [a2 _requestFullScreenModalPresentationWithSize:640.0, 640.0];
}

uint64_t sub_10000AFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a1;
  v4[12] = a4;
  sub_100013F60();
  v4[13] = sub_100013F50();
  uint64_t v6 = sub_100013F40();
  return _swift_task_switch(sub_10000B058, v6, v5);
}

uint64_t sub_10000B058()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    if (qword_10001D2F0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    unint64_t v2 = qword_10001D520;
    swift_bridgeObjectRetain();
    sub_100008F4C((uint64_t)Strong, v2);
    unint64_t v4 = v3;
    char v6 = v5;
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v7 = (void *)sub_1000090D8(v4);
      swift_endAccess();
    }
    [Strong dismiss];
  }
  **(unsigned char **)(v0 + 88) = Strong == 0;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

void sub_10000B340(void (*a1)(void), uint64_t a2)
{
  type metadata accessor for SandboxedFile(0);
  __chkstk_darwin();
  char v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100013ED0() < 1)
  {
    if (qword_10001D2E8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100013E30();
    sub_100013060(v15, (uint64_t)qword_10001D508);
    id v16 = sub_100013E20();
    os_log_type_t v17 = sub_100013FB0();
    if (!os_log_type_enabled(v16, v17)) {
      goto LABEL_16;
    }
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    uint64_t v19 = "Failed to consume empty sandbox extension";
    uint64_t v20 = v16;
    os_log_type_t v21 = v17;
    uint64_t v22 = v18;
    uint32_t v23 = 2;
    goto LABEL_15;
  }
  sub_100013EB0();
  uint64_t v7 = sandbox_extension_consume();
  swift_release();
  if (v7 == -1)
  {
    if (qword_10001D2E8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_100013E30();
    sub_100013060(v24, (uint64_t)qword_10001D508);
    id v16 = sub_100013E20();
    os_log_type_t v25 = sub_100013FB0();
    if (!os_log_type_enabled(v16, v25)) {
      goto LABEL_16;
    }
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 67109120;
    LODWORD(v30) = sub_100013E50();
    sub_100014030();
    uint64_t v19 = "Failed to consume sandbox extension. errno: %d";
    uint64_t v20 = v16;
    os_log_type_t v21 = v25;
    uint64_t v22 = v26;
    uint32_t v23 = 8;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, v22, v23);
    swift_slowDealloc();
LABEL_16:

    a1(0);
    return;
  }
  if (qword_10001D2E8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100013E30();
  sub_100013060(v8, (uint64_t)qword_10001D508);
  sub_100011918(v2, (uint64_t)v6, type metadata accessor for SandboxedFile);
  uint64_t v9 = sub_100013E20();
  os_log_type_t v10 = sub_100013F90();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v27[2] = a2;
    uint64_t v30 = v12;
    uint64_t v28 = a1;
    *(_DWORD *)uint64_t v11 = 136315138;
    v27[1] = v11 + 4;
    sub_100013C20();
    sub_100013AD0();
    uint64_t v13 = sub_100014120();
    uint64_t v29 = sub_10000EB0C(v13, v14, &v30);
    a1 = v28;
    sub_100014030();
    swift_bridgeObjectRelease();
    sub_100011828((uint64_t)v6, type metadata accessor for SandboxedFile);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Consumed sandbox token for file: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100011828((uint64_t)v6, type metadata accessor for SandboxedFile);
  }

  a1(1);
  sub_10000B794(v7, v2);
}

void sub_10000B794(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SandboxedFile(0);
  __chkstk_darwin();
  unint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sandbox_extension_release();
  if (qword_10001D2E8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100013E30();
  sub_100013060(v5, (uint64_t)qword_10001D508);
  sub_100011918(a2, (uint64_t)v4, type metadata accessor for SandboxedFile);
  char v6 = sub_100013E20();
  os_log_type_t v7 = sub_100013F90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_100013C20();
    sub_100013AD0();
    uint64_t v9 = sub_100014120();
    uint64_t v11 = sub_10000EB0C(v9, v10, &v12);
    sub_100014030();
    swift_bridgeObjectRelease();
    sub_100011828((uint64_t)v4, type metadata accessor for SandboxedFile);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Released sandbox token for file: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100011828((uint64_t)v4, type metadata accessor for SandboxedFile);
  }
}

void sub_10000B9E4(char a1, uint64_t a2, void *a3)
{
  type metadata accessor for SandboxedFile(0);
  __chkstk_darwin();
  os_log_type_t v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v14 = sub_100013C30();
    unint64_t v16 = v15;
    id v17 = objc_allocWithZone((Class)UIImage);
    sub_10000CAEC(v14, v16);
    uint64_t v18 = (void *)sub_100013C40();
    v31[0] = (UIImage *)[v17 initWithData:v18];
    sub_10000CC7C(v14, v16);

    if (v31[0])
    {
      uint64_t v19 = UIImagePNGRepresentation(v31[0]);
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = sub_100013C50();
        unint64_t v23 = v22;
      }
      else
      {
        uint64_t v21 = 0;
        unint64_t v23 = 0xF000000000000000;
      }
      uint64_t v24 = (UIImage *)[a3 sourceImage];
      os_log_type_t v25 = v24;
      if (v24)
      {
        uint64_t v26 = UIImagePNGRepresentation(v24);

        if (v26)
        {
          os_log_type_t v25 = (void *)sub_100013C50();
          unint64_t v28 = v27;

          goto LABEL_19;
        }
        os_log_type_t v25 = 0;
      }
      unint64_t v28 = 0xF000000000000000;
LABEL_19:
      if (v23 >> 60 == 15)
      {
        if (v28 >> 60 == 15) {
          goto LABEL_26;
        }
      }
      else if (v28 >> 60 != 15)
      {
        sub_100011904(v21, v23);
        char v29 = sub_100010DCC(v21, v23, (uint64_t)v25, v28);
        sub_100011888((uint64_t)v25, v28);
        sub_100011888(v21, v23);
        sub_100011888(v21, v23);
        if (v29)
        {
LABEL_26:
          sub_10000CC7C(v14, v16);
          goto LABEL_27;
        }
LABEL_24:
        v31[0] = v31[0];
        [a3 setSourceImage:v31[0]];
        sub_10000CC7C(v14, v16);

LABEL_27:
        uint64_t v30 = v31[0];

        return;
      }
      sub_100011888(v21, v23);
      sub_100011888((uint64_t)v25, v28);
      goto LABEL_24;
    }
    sub_10000CC7C(v14, v16);
  }
  if (qword_10001D2E8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100013E30();
  sub_100013060(v8, (uint64_t)qword_10001D508);
  sub_100011918(a2, (uint64_t)v7, type metadata accessor for SandboxedFile);
  uint64_t v9 = sub_100013E20();
  os_log_type_t v10 = sub_100013FB0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_100013C20();
    sub_100013AD0();
    uint64_t v12 = sub_100014120();
    v31[2] = (UIImage *)sub_10000EB0C(v12, v13, &v32);
    sub_100014030();
    swift_bridgeObjectRelease();
    sub_100011828((uint64_t)v7, type metadata accessor for SandboxedFile);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to decode data from file url for editor: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100011828((uint64_t)v7, type metadata accessor for SandboxedFile);
  }
}

uint64_t sub_10000C018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  v5[10] = sub_100013F60();
  v5[11] = sub_100013F50();
  uint64_t v7 = sub_100013F40();
  v5[12] = v7;
  v5[13] = v6;
  return _swift_task_switch(sub_10000C0B4, v7, v6);
}

uint64_t sub_10000C0B4()
{
  id v1 = [*(id *)(v0 + 64) generatedAssets];
  sub_10001382C(0, &qword_10001D860);
  unint64_t v2 = sub_100013F00();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1000140D0();
    uint64_t v3 = swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_13;
  }
  if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v6 = (id)sub_100014090();
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return _swift_task_switch(v3, v4, v5);
    }
    id v6 = *(id *)(v2 + 32);
  }
  uint64_t v7 = v6;
  *(void *)(v0 + 112) = v6;
  uint64_t v8 = *(void *)(v0 + 72);
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t *)(v8
                 + OBJC_IVAR____TtC40GenerativePlaygroundMessagesAppExtension24GPMessagesViewController_stagedAssetIdentifiers);
  swift_beginAccess();
  uint64_t v10 = *v9;
  swift_bridgeObjectRetain();
  id v11 = [v7 identifier];
  uint64_t v12 = sub_100013EA0();
  uint64_t v14 = v13;

  LOBYTE(v11) = sub_10000A5C4(v12, v14, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    *(void *)(v0 + 120) = sub_100013F50();
    uint64_t v19 = sub_100013F40();
    uint64_t v21 = v20;
    uint64_t v3 = (uint64_t)sub_10000C448;
    uint64_t v4 = v19;
    uint64_t v5 = v21;
    return _swift_task_switch(v3, v4, v5);
  }
  swift_release();
  id v15 = [v7 identifier];
  uint64_t v16 = sub_100013EA0();
  uint64_t v18 = v17;

  sub_100007FC8(v16, v18);
  swift_bridgeObjectRelease();

LABEL_13:
  if (qword_10001D2F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v23 = qword_10001D520;
  if ((unint64_t)qword_10001D520 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000140D0();
    uint64_t v24 = v3;
    if (v3)
    {
LABEL_17:
      if (v24 >= 1)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if ((v23 & 0xC000000000000001) != 0) {
            id v26 = (id)sub_100014090();
          }
          else {
            id v26 = *(id *)(v23 + 8 * i + 32);
          }
          unint64_t v27 = v26;
          [v26 dismiss];
        }
        goto LABEL_24;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v24 = *(void *)((qword_10001D520 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v3 = swift_bridgeObjectRetain();
    if (v24) {
      goto LABEL_17;
    }
  }
LABEL_24:
  swift_bridgeObjectRelease();
  qword_10001D520 = (uint64_t)&_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  unint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_10000C448()
{
  id v1 = (void *)v0[14];
  swift_release();
  sub_10000799C(v1);
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  return _swift_task_switch(sub_10000C4B8, v2, v3);
}

uint64_t sub_10000C4B8()
{
  swift_release();
  if (qword_10001D2F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = qword_10001D520;
  if ((unint64_t)qword_10001D520 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000140D0();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((qword_10001D520 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_12;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v2; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_100014090();
    }
    else {
      id v5 = *(id *)(v1 + 8 * i + 32);
    }
    id v6 = v5;
    [v5 dismiss];
  }
LABEL_12:
  swift_bridgeObjectRelease();
  qword_10001D520 = (uint64_t)&_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t *sub_10000C80C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_1000040F4(&qword_10001D698);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = type metadata accessor for SandboxedFile(0);
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        uint64_t v12 = sub_1000040F4(&qword_10001D6A0);
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        uint64_t v13 = sub_100013C20();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        uint64_t v14 = *(int *)(v10 + 20);
        id v15 = (uint64_t *)((char *)a1 + v14);
        uint64_t v16 = (uint64_t *)((char *)a2 + v14);
        uint64_t v17 = v16[1];
        *id v15 = *v16;
        v15[1] = v17;
        uint64_t v18 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v11 + 56);
        swift_bridgeObjectRetain();
        v18(a1, 0, 1, v10);
      }
      uint64_t v19 = *(int *)(v7 + 48);
      uint64_t v20 = (char *)a1 + v19;
      uint64_t v21 = (char *)a2 + v19;
      unint64_t v22 = *((void *)v21 + 1);
      if (v22 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
      }
      else
      {
        uint64_t v23 = *(void *)v21;
        sub_10000CAEC(*(void *)v21, *((void *)v21 + 1));
        *(void *)uint64_t v20 = v23;
        *((void *)v20 + 1) = v22;
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t type metadata accessor for SandboxedFile(uint64_t a1)
{
  return sub_10000CAB4(a1, qword_10001D788);
}

uint64_t sub_10000CAB4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000CAEC(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000CB44(uint64_t a1)
{
  uint64_t v2 = sub_1000040F4(&qword_10001D698);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = type metadata accessor for SandboxedFile(0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4);
    if (!result)
    {
      uint64_t v5 = sub_100013C20();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      uint64_t result = swift_bridgeObjectRelease();
    }
    uint64_t v6 = (uint64_t *)(a1 + *(int *)(v2 + 48));
    unint64_t v7 = v6[1];
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *v6;
      return sub_10000CC7C(v8, v7);
    }
  }
  return result;
}

uint64_t sub_10000CC7C(uint64_t a1, unint64_t a2)
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

char *sub_10000CCD4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000040F4(&qword_10001D698);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = type metadata accessor for SandboxedFile(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = sub_1000040F4(&qword_10001D6A0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_100013C20();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = *(int *)(v8 + 20);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      uint64_t v15 = *((void *)v14 + 1);
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = v15;
      uint64_t v16 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
      swift_bridgeObjectRetain();
      v16(a1, 0, 1, v8);
    }
    uint64_t v17 = *(int *)(v6 + 48);
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    unint64_t v20 = *((void *)v19 + 1);
    if (v20 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    }
    else
    {
      uint64_t v21 = *(void *)v19;
      sub_10000CAEC(*(void *)v19, *((void *)v19 + 1));
      *(void *)uint64_t v18 = v21;
      *((void *)v18 + 1) = v20;
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *sub_10000CF20(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000040F4(&qword_10001D698);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_100013A04((uint64_t)a1, &qword_10001D698);
      goto LABEL_7;
    }
    uint64_t v14 = type metadata accessor for SandboxedFile(0);
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
    int v17 = v16(a1, 1, v14);
    int v18 = v16(a2, 1, v14);
    if (v17)
    {
      if (!v18)
      {
        uint64_t v19 = sub_100013C20();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
        uint64_t v20 = *(int *)(v14 + 20);
        uint64_t v21 = &a1[v20];
        unint64_t v22 = &a2[v20];
        *(void *)uint64_t v21 = *(void *)v22;
        *((void *)v21 + 1) = *((void *)v22 + 1);
        uint64_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
        swift_bridgeObjectRetain();
        v23(a1, 0, 1, v14);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v18)
      {
        uint64_t v44 = sub_100013C20();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 24))(a1, a2, v44);
        uint64_t v45 = *(int *)(v14 + 20);
        uint64_t v46 = &a1[v45];
        id v47 = &a2[v45];
        *(void *)uint64_t v46 = *(void *)v47;
        *((void *)v46 + 1) = *((void *)v47 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
LABEL_19:
        uint64_t v35 = *(int *)(v6 + 48);
        uint64_t v36 = (uint64_t *)&a1[v35];
        id v37 = (uint64_t *)&a2[v35];
        unint64_t v38 = *(void *)&a2[v35 + 8];
        if (*(void *)&a1[v35 + 8] >> 60 == 15)
        {
          if (v38 >> 60 != 15)
          {
            uint64_t v39 = *v37;
            sub_10000CAEC(v39, v38);
            *uint64_t v36 = v39;
            v36[1] = v38;
            return a1;
          }
        }
        else
        {
          if (v38 >> 60 != 15)
          {
            uint64_t v40 = *v37;
            sub_10000CAEC(v40, v38);
            uint64_t v41 = *v36;
            unint64_t v42 = v36[1];
            *uint64_t v36 = v40;
            v36[1] = v38;
            sub_10000CC7C(v41, v42);
            return a1;
          }
          sub_10000D3F4((uint64_t)v36);
        }
        *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
        return a1;
      }
      sub_100011828((uint64_t)a1, type metadata accessor for SandboxedFile);
    }
    uint64_t v34 = sub_1000040F4(&qword_10001D6A0);
    memcpy(a1, a2, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = type metadata accessor for SandboxedFile(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    uint64_t v13 = sub_1000040F4(&qword_10001D6A0);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v24 = sub_100013C20();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(a1, a2, v24);
    uint64_t v25 = *(int *)(v11 + 20);
    id v26 = &a1[v25];
    unint64_t v27 = &a2[v25];
    *(void *)id v26 = *(void *)v27;
    *((void *)v26 + 1) = *((void *)v27 + 1);
    unint64_t v28 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
    swift_bridgeObjectRetain();
    v28(a1, 0, 1, v11);
  }
  uint64_t v29 = *(int *)(v6 + 48);
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  unint64_t v32 = *((void *)v31 + 1);
  if (v32 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
  }
  else
  {
    uint64_t v33 = *(void *)v31;
    sub_10000CAEC(*(void *)v31, *((void *)v31 + 1));
    *(void *)uint64_t v30 = v33;
    *((void *)v30 + 1) = v32;
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_10000D3F4(uint64_t a1)
{
  return a1;
}

char *sub_10000D448(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000040F4(&qword_10001D698);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = type metadata accessor for SandboxedFile(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = sub_1000040F4(&qword_10001D6A0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_100013C20();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      *(_OWORD *)&a1[*(int *)(v8 + 20)] = *(_OWORD *)&a2[*(int *)(v8 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *sub_10000D650(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000040F4(&qword_10001D698);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = type metadata accessor for SandboxedFile(0);
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
        uint64_t v13 = sub_1000040F4(&qword_10001D6A0);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        uint64_t v20 = sub_100013C20();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a1, a2, v20);
        *(_OWORD *)&a1[*(int *)(v11 + 20)] = *(_OWORD *)&a2[*(int *)(v11 + 20)];
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
      *(_OWORD *)&a1[*(int *)(v6 + 48)] = *(_OWORD *)&a2[*(int *)(v6 + 48)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
      return a1;
    }
LABEL_7:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_100013A04((uint64_t)a1, &qword_10001D698);
    goto LABEL_7;
  }
  uint64_t v14 = type metadata accessor for SandboxedFile(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(a1, 1, v14);
  int v18 = v16(a2, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      uint64_t v29 = sub_100013C20();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 40))(a1, a2, v29);
      uint64_t v30 = *(int *)(v14 + 20);
      uint64_t v31 = &a1[v30];
      unint64_t v32 = &a2[v30];
      uint64_t v34 = *(void *)v32;
      uint64_t v33 = *((void *)v32 + 1);
      *(void *)uint64_t v31 = v34;
      *((void *)v31 + 1) = v33;
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    sub_100011828((uint64_t)a1, type metadata accessor for SandboxedFile);
    goto LABEL_15;
  }
  if (v18)
  {
LABEL_15:
    uint64_t v21 = sub_1000040F4(&qword_10001D6A0);
    memcpy(a1, a2, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_16;
  }
  uint64_t v19 = sub_100013C20();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(a1, a2, v19);
  *(_OWORD *)&a1[*(int *)(v14 + 20)] = *(_OWORD *)&a2[*(int *)(v14 + 20)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
LABEL_16:
  uint64_t v22 = *(int *)(v6 + 48);
  uint64_t v23 = (uint64_t *)&a1[v22];
  uint64_t v24 = (uint64_t *)&a2[v22];
  unint64_t v25 = *(void *)&a1[v22 + 8];
  if (v25 >> 60 != 15)
  {
    unint64_t v26 = v24[1];
    if (v26 >> 60 != 15)
    {
      uint64_t v27 = *v23;
      *uint64_t v23 = *v24;
      v23[1] = v26;
      sub_10000CC7C(v27, v25);
      return a1;
    }
    sub_10000D3F4((uint64_t)v23);
  }
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  return a1;
}

uint64_t sub_10000DA8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000DAA0);
}

uint64_t sub_10000DAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000040F4(&qword_10001D698);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000DB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DB24);
}

uint64_t sub_10000DB24(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_1000040F4(&qword_10001D698);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_10000DBAC(uint64_t a1)
{
  uint64_t v2 = sub_1000040F4(&qword_10001D698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 2, v2);
}

uint64_t sub_10000DC18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000040F4(&qword_10001D698);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 2, v4);
}

void sub_10000DC8C()
{
  sub_10000DD3C(319, &qword_10001D728, (void (*)(uint64_t))type metadata accessor for SandboxedFile);
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
  }
}

void sub_10000DD3C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100014020();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_10000DD90(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100013C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int v9 = (uint64_t *)((char *)a1 + v8);
    int v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *int v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10000DE68(uint64_t a1)
{
  uint64_t v2 = sub_100013C20();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000DEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10000DF68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000E004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000E080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  int v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000E10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E120);
}

uint64_t sub_10000E120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100013C20();
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

uint64_t sub_10000E1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E1F8);
}

uint64_t sub_10000E1F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100013C20();
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

uint64_t sub_10000E2B8()
{
  uint64_t result = sub_100013C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000E34C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_10000CAEC(a2, a3);
      unint64_t v10 = (char *)sub_100013B70();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_100013B90();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_100013B80();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x10000E5B0);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_10000CC7C(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      int v17 = (char *)sub_100013B70();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_100013B90();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_100013B80();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_10000E5C0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_10000E69C;
  return v6(a1);
}

uint64_t sub_10000E69C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_10000E794(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000040F4(&qword_10001D930);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      size_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      size_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100011AE0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E8A4(char a1, int64_t a2, char a3, unint64_t a4)
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
        goto LABEL_29;
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
    size_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000040F4(&qword_10001D968);
  uint64_t v10 = *(void *)(sub_100013CB0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1000140C0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100013CB0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100011FC8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10000EB0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000EBE0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000133B8((uint64_t)v12, *a3);
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
      sub_1000133B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100013368((uint64_t)v12);
  return v7;
}

uint64_t sub_10000EBE0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100014040();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000ED9C(a5, a6);
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
  uint64_t v8 = sub_1000140B0();
  if (!v8)
  {
    sub_1000140C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100014110();
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

uint64_t sub_10000ED9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000EE34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000F014(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000F014(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000EE34(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EFAC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100014080();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000140C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100013EE0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100014110();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000140C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000EFAC(uint64_t a1, uint64_t a2)
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
  sub_1000040F4(&qword_10001D868);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000F014(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000040F4(&qword_10001D868);
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
  size_t v13 = a4 + 32;
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
  uint64_t result = sub_100014110();
  __break(1u);
  return result;
}

uint64_t sub_10000F164(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1000141B0();
  swift_bridgeObjectRetain();
  sub_100013EC0();
  Swift::Int v8 = sub_1000141C0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100014130() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100014130() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000F5F4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000F314()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000040F4(&qword_10001D870);
  uint64_t v3 = sub_100014070();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1000141B0();
      sub_100013EC0();
      uint64_t result = sub_1000141C0();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_10000F5F4(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000F314();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000F790();
      goto LABEL_22;
    }
    sub_10000F944();
  }
  uint64_t v11 = *v4;
  sub_1000141B0();
  sub_100013EC0();
  uint64_t result = sub_1000141C0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100014130(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100014140();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100014130();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_10000F790()
{
  unint64_t v1 = v0;
  sub_1000040F4(&qword_10001D870);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100014060();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_10000F944()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000040F4(&qword_10001D870);
  uint64_t v3 = sub_100014070();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1000141B0();
    swift_bridgeObjectRetain();
    sub_100013EC0();
    uint64_t result = sub_1000141C0();
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
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
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

uint64_t sub_10000FBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1000141B0();
  swift_bridgeObjectRetain();
  sub_100013EC0();
  Swift::Int v6 = sub_1000141C0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_100014130() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_100014130() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000F790();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_10000FD84(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_10000FD84(unint64_t result)
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
    uint64_t v8 = sub_100014050();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1000141B0();
        swift_bridgeObjectRetain();
        sub_100013EC0();
        Swift::Int v10 = sub_1000141C0();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
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
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _OWORD *v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
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

unint64_t sub_10000FF4C(uint64_t a1, uint64_t a2)
{
  sub_1000141B0();
  sub_100013EC0();
  Swift::Int v4 = sub_1000141C0();

  return sub_1000102DC(a1, a2, v4);
}

uint64_t sub_10000FFC4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000040F4(&qword_10001D880);
  char v36 = a2;
  uint64_t v6 = sub_1000140F0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_1000141B0();
    sub_100013EC0();
    uint64_t result = sub_1000141C0();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1000102DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100014130() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100014130() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1000103C0()
{
  unint64_t v1 = v0;
  sub_1000040F4(&qword_10001D880);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000140E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
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

uint64_t sub_100010578(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000105F0(a1, a2, a3, (void *)*v3, &qword_10001D980, (uint64_t (*)(void))&type metadata accessor for ConversationContextItem);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000105B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000105F0(a1, a2, a3, (void *)*v3, &qword_10001D968, (uint64_t (*)(void))&type metadata accessor for ImagePlaygroundConcept);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1000105F0(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000040F4(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  int64_t v21 = (char *)v16 + v20;
  int64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  int64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_100014110();
  __break(1u);
  return result;
}

uint64_t sub_100010838(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000140D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_1000108B4(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100010994;
  return v5(v2 + 32);
}

uint64_t sub_100010994()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100010AA8()
{
  return sub_1000054E8();
}

uint64_t sub_100010ACC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  int64_t v10 = (void *)*a5;
  unint64_t v12 = sub_10000FF4C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000103C0();
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000FFC4(v15, a4 & 1);
  unint64_t v21 = sub_10000FF4C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_100014150();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100010C3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_10000E34C((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_100010D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_100013B70();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_100013B90();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100013B80();
  sub_10000E34C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100010DCC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x100011034);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_10000CAEC(a3, a4);
                  sub_10000CAEC(a1, a2);
                  char v17 = sub_100010D14((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_10000CC7C(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_10000CAEC(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_100010D14(v21, v22, v20, a3, a4);
                  sub_10000CC7C(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_10000CAEC(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_10000CAEC(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_100010C3C(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_10000CC7C(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_100011064(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SandboxedFile(0);
  uint64_t v72 = *(void *)(v4 - 8);
  uint64_t v73 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v70 = (uint64_t)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v69 = (uint64_t)&v63 - v8;
  __chkstk_darwin(v7);
  uint64_t v71 = (uint64_t)&v63 - v9;
  uint64_t v10 = sub_1000040F4(&qword_10001D7C0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000040F4(&qword_10001D6A0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v63 - v17;
  uint64_t v19 = type metadata accessor for VisibleView(0);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000040F4(&qword_10001D7C8);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  BOOL v25 = (char *)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = (uint64_t)&v25[*(int *)(v23 + 56)];
  sub_100011918(a1, (uint64_t)v25, type metadata accessor for VisibleView);
  sub_100011918(a2, v26, type metadata accessor for VisibleView);
  uint64_t v27 = sub_1000040F4(&qword_10001D698);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 48);
  double v74 = v25;
  int v29 = v28(v25, 2, v27);
  if (!v29)
  {
    uint64_t v66 = v10;
    v67 = v18;
    double v68 = v12;
    uint64_t v31 = (uint64_t)v74;
    sub_100011918((uint64_t)v74, (uint64_t)v21, type metadata accessor for VisibleView);
    uint64_t v32 = *(int *)(v27 + 48);
    uint64_t v34 = *(void *)&v21[v32];
    unint64_t v33 = *(void *)&v21[v32 + 8];
    if (v28((char *)v26, 2, v27))
    {
      sub_100011888(v34, v33);
      sub_100013A04((uint64_t)v21, &qword_10001D6A0);
      goto LABEL_9;
    }
    unint64_t v64 = v33;
    uint64_t v65 = v34;
    uint64_t v37 = v26 + v32;
    uint64_t v38 = *(void *)(v26 + v32);
    unint64_t v39 = *(void *)(v37 + 8);
    uint64_t v40 = v26;
    uint64_t v41 = (uint64_t)v67;
    sub_10001189C(v40, (uint64_t)v67);
    uint64_t v42 = (uint64_t)v68;
    uint64_t v43 = (uint64_t)&v68[*(int *)(v66 + 48)];
    sub_10001189C((uint64_t)v21, (uint64_t)v68);
    sub_1000139A0(v41, v43, &qword_10001D6A0);
    uint64_t v44 = v73;
    uint64_t v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
    if (v45(v42, 1, v73) == 1)
    {
      if (v45(v43, 1, v44) != 1)
      {
        uint64_t v46 = &qword_10001D7C0;
LABEL_29:
        sub_100013A04(v42, v46);
LABEL_30:
        sub_100013A04(v41, &qword_10001D6A0);
        sub_100011888(v38, v39);
        unint64_t v60 = v64;
        uint64_t v59 = v65;
        goto LABEL_31;
      }
      goto LABEL_20;
    }
    uint64_t v72 = v38;
    uint64_t v47 = (uint64_t)v16;
    sub_1000139A0(v42, (uint64_t)v16, &qword_10001D6A0);
    if (v45(v43, 1, v44) == 1)
    {
      uint64_t v46 = &qword_10001D7C0;
    }
    else
    {
      uint64_t v48 = v71;
      sub_100013A60(v43, v71, type metadata accessor for SandboxedFile);
      char v49 = sub_100013C00();
      uint64_t v50 = (uint64_t)v16;
      uint64_t v51 = v69;
      sub_100011918(v50, v69, type metadata accessor for SandboxedFile);
      uint64_t v52 = v70;
      sub_100011918(v48, v70, type metadata accessor for SandboxedFile);
      if (v49)
      {
        uint64_t v53 = *(int *)(v73 + 20);
        uint64_t v54 = *(void *)(v51 + v53);
        uint64_t v55 = *(void *)(v51 + v53 + 8);
        id v56 = (void *)(v52 + v53);
        if (v54 != *v56 || v55 != v56[1])
        {
          char v62 = sub_100014130();
          sub_100011828(v51, type metadata accessor for SandboxedFile);
          sub_100011828(v52, type metadata accessor for SandboxedFile);
          sub_100011828(v48, type metadata accessor for SandboxedFile);
          sub_100011828(v47, type metadata accessor for SandboxedFile);
          sub_100013A04(v42, &qword_10001D6A0);
          uint64_t v31 = (uint64_t)v74;
          uint64_t v38 = v72;
          if ((v62 & 1) == 0) {
            goto LABEL_30;
          }
LABEL_21:
          unint64_t v58 = v64;
          uint64_t v57 = v65;
          if (v64 >> 60 == 15)
          {
            sub_100013A04(v41, &qword_10001D6A0);
            if (v39 >> 60 == 15)
            {
              sub_100011888(v57, v58);
              goto LABEL_8;
            }
          }
          else
          {
            if (v39 >> 60 != 15)
            {
              sub_100011904(v38, v39);
              sub_100011904(v57, v58);
              char v61 = sub_100010DCC(v57, v58, v38, v39);
              sub_100011888(v38, v39);
              sub_100011888(v38, v39);
              sub_100011888(v57, v58);
              sub_100013A04(v41, &qword_10001D6A0);
              sub_100011888(v57, v58);
              if (v61) {
                goto LABEL_8;
              }
LABEL_32:
              sub_100011828(v31, type metadata accessor for VisibleView);
              return 0;
            }
            sub_100013A04(v41, &qword_10001D6A0);
          }
          sub_100011888(v57, v58);
          uint64_t v59 = v38;
          unint64_t v60 = v39;
LABEL_31:
          sub_100011888(v59, v60);
          goto LABEL_32;
        }
        sub_100011828(v51, type metadata accessor for SandboxedFile);
        sub_100011828(v52, type metadata accessor for SandboxedFile);
        sub_100011828(v48, type metadata accessor for SandboxedFile);
        sub_100011828(v47, type metadata accessor for SandboxedFile);
        uint64_t v31 = (uint64_t)v74;
        uint64_t v38 = v72;
LABEL_20:
        sub_100013A04(v42, &qword_10001D6A0);
        goto LABEL_21;
      }
      sub_100011828(v51, type metadata accessor for SandboxedFile);
      sub_100011828(v52, type metadata accessor for SandboxedFile);
      sub_100011828(v48, type metadata accessor for SandboxedFile);
      uint64_t v46 = &qword_10001D6A0;
      uint64_t v31 = (uint64_t)v74;
    }
    sub_100011828(v47, type metadata accessor for SandboxedFile);
    uint64_t v38 = v72;
    goto LABEL_29;
  }
  if (v29 == 1)
  {
    int v30 = v28((char *)v26, 2, v27);
    uint64_t v31 = (uint64_t)v74;
    if (v30 == 1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  int v35 = v28((char *)v26, 2, v27);
  uint64_t v31 = (uint64_t)v74;
  if (v35 == 2)
  {
LABEL_8:
    sub_100011828(v31, type metadata accessor for VisibleView);
    return 1;
  }
LABEL_9:
  sub_100013A04(v31, &qword_10001D7C8);
  return 0;
}

uint64_t sub_100011828(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100011888(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000CC7C(a1, a2);
  }
  return a1;
}

uint64_t sub_10001189C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000040F4(&qword_10001D6A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011904(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000CAEC(a1, a2);
  }
  return a1;
}

uint64_t sub_100011918(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011980(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SandboxedFile(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  char v10 = sub_100013C00();
  sub_100011918(a1, (uint64_t)v9, type metadata accessor for SandboxedFile);
  sub_100011918(a2, (uint64_t)v7, type metadata accessor for SandboxedFile);
  if (v10)
  {
    uint64_t v11 = *(int *)(v4 + 20);
    uint64_t v12 = *(void *)&v9[v11];
    uint64_t v13 = *(void *)&v9[v11 + 8];
    uint64_t v14 = &v7[v11];
    if (v12 == *(void *)v14 && v13 == *((void *)v14 + 1)) {
      char v16 = 1;
    }
    else {
      char v16 = sub_100014130();
    }
  }
  else
  {
    char v16 = 0;
  }
  sub_100011828((uint64_t)v9, type metadata accessor for SandboxedFile);
  sub_100011828((uint64_t)v7, type metadata accessor for SandboxedFile);
  return v16 & 1;
}

uint64_t sub_100011AE0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100014110();
  __break(1u);
  return result;
}

char *sub_100011BD4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v35 = sub_100013E30();
  uint64_t v4 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  unint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v38 = sub_10001382C(0, &qword_10001D988);
  uint64_t v37 = sub_10001382C(0, &qword_10001D990);
  uint64_t v34 = (void (**)(char *, uint64_t))(v4 + 8);
  swift_bridgeObjectRetain();
  uint64_t v29 = a1;
  uint64_t v8 = (unint64_t *)(a1 + 40);
  char v36 = (char *)&_swiftEmptyArrayStorage;
  *(void *)&long long v9 = 136315138;
  long long v31 = v9;
  int v30 = (char *)&type metadata for Any + 8;
  uint64_t v32 = v6;
  do
  {
    uint64_t v11 = *(v8 - 1);
    unint64_t v10 = *v8;
    sub_10000CAEC(v11, *v8);
    uint64_t v12 = (void *)sub_100013FD0();
    if (v2)
    {
      sub_100013DE0();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v13 = v6;
      uint64_t v14 = sub_100013E20();
      os_log_type_t v15 = sub_100013FB0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v39 = v33;
        *(_DWORD *)uint64_t v16 = v31;
        swift_getErrorValue();
        uint64_t v17 = sub_100014160();
        *(void *)(v16 + 4) = sub_10000EB0C(v17, v18, &v39);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to extract staged asset identifier from draft archive with error: %s", (uint8_t *)v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        unint64_t v6 = v32;
        (*v34)(v32, v35);
        sub_10000CC7C(v11, v10);
        uint64_t v2 = 0;
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        (*v34)(v13, v35);
        sub_10000CC7C(v11, v10);
        uint64_t v2 = 0;
        unint64_t v6 = v13;
      }
    }
    else
    {
      uint64_t v19 = v12;
      if (v12)
      {
        id v20 = [v12 identifier:v29, v30];
        uint64_t v21 = sub_100013EA0();
        uint64_t v23 = v22;

        sub_10000CC7C(v11, v10);
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v24 = v36;
        }
        else {
          uint64_t v24 = sub_10000E794(0, *((void *)v36 + 2) + 1, 1, v36);
        }
        unint64_t v26 = *((void *)v24 + 2);
        unint64_t v25 = *((void *)v24 + 3);
        if (v26 >= v25 >> 1) {
          uint64_t v24 = sub_10000E794((char *)(v25 > 1), v26 + 1, 1, v24);
        }
        *((void *)v24 + 2) = v26 + 1;
        char v36 = v24;
        uint64_t v27 = &v24[16 * v26];
        *((void *)v27 + 4) = v21;
        *((void *)v27 + 5) = v23;
        unint64_t v6 = v32;
      }
      else
      {
        sub_10000CC7C(v11, v10);
      }
    }
    v8 += 2;
    --v7;
  }
  while (v7);
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_100011FC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_100013CB0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_100014110();
  __break(1u);
  return result;
}

unint64_t sub_100012120(void *a1)
{
  unint64_t v2 = sub_1000084B4((uint64_t)&_swiftEmptyArrayStorage);
  id v3 = [a1 pixelWidth];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v27 = v2;
  sub_100010ACC((uint64_t)v3, 0xD00000000000001FLL, 0x8000000100016390, isUniquelyReferenced_nonNull_native, &v27);
  unint64_t v5 = v27;
  swift_bridgeObjectRelease();
  id v6 = [a1 pixelHeight];
  char v7 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v27 = v5;
  sub_100010ACC((uint64_t)v6, 0xD000000000000020, 0x80000001000163B0, v7, &v27);
  unint64_t v8 = v27;
  swift_bridgeObjectRelease();
  id v9 = [a1 creationDate];
  uint64_t v10 = sub_100013C80();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013C70();

  sub_100013C60();
  double v15 = v14;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  id v16 = [objc_allocWithZone((Class)NSDate) initWithTimeIntervalSince1970:v15];
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v27 = v8;
  sub_100010ACC((uint64_t)v16, 0xD000000000000021, 0x80000001000163E0, v17, &v27);
  unint64_t v18 = v27;
  swift_bridgeObjectRelease();
  id v19 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInteger:1];
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v27 = v18;
  sub_100010ACC((uint64_t)v19, 0xD00000000000001ELL, 0x8000000100016410, v20, &v27);
  unint64_t v21 = v27;
  swift_bridgeObjectRelease();
  id v22 = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  char v23 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v27 = v21;
  sub_100010ACC((uint64_t)v22, 0xD000000000000022, 0x8000000100016430, v23, &v27);
  unint64_t v24 = v27;
  swift_bridgeObjectRelease();
  return v24;
}

void *sub_100012404(void *a1)
{
  uint64_t v2 = sub_100013E10();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [a1 identifier];
  sub_100013EA0();

  id v7 = objc_allocWithZone((Class)AEMutableAssetPackage);
  unint64_t v8 = (void *)sub_100013E80();
  swift_bridgeObjectRelease();
  id v9 = [v7 initWithAssetIdentifier:v8];

  id v10 = [a1 imageURLWrapper];
  id v11 = [v10 url];

  uint64_t v12 = sub_100013C20();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  double v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013C10();

  id v16 = (void *)sub_100013BF0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_100013E00();
  sub_100013DF0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v17 = (void *)sub_100013E80();
  swift_bridgeObjectRelease();
  [v9 storeURL:v16 forType:v17];

  id v18 = [a1 previewImage];
  [v9 setSidecarObject:v18 forKey:kUTTypeAssetPreviewImage];

  id v19 = [a1 recipeData];
  id v20 = [v19 underlyingData];

  uint64_t v21 = sub_100013C50();
  unint64_t v23 = v22;

  id v24 = objc_allocWithZone((Class)NSData);
  unint64_t v25 = (void *)sub_100013C40();
  id v26 = [v24 initWithData:v25];
  sub_10000CC7C(v21, v23);

  unint64_t v27 = (void *)sub_100013E80();
  [v9 setSidecarObject:v26 forKey:v27];

  sub_100012120(a1);
  sub_1000040F4(&qword_10001D878);
  uint64_t v28 = (void *)sub_100013E70();
  swift_bridgeObjectRelease();
  [v9 addSidecarEntriesFromDictionary:v28];

  uint64_t v29 = self;
  id v35 = 0;
  id v30 = [v29 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v35];
  id v31 = v35;
  if (v30)
  {
    uint64_t v32 = (void *)sub_100013C50();
  }
  else
  {
    uint64_t v32 = v31;
    sub_100013BE0();

    swift_willThrow();
  }

  return v32;
}

uint64_t sub_10001289C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v35 = a4;
  unint64_t v36 = a5;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v37 = a1;
  uint64_t v34 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  __chkstk_darwin(v34);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000040F4(&qword_10001D6A0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SandboxedFile(0);
  id v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v31(v11, 1, 1, v12);
  uint64_t v13 = sub_100013C20();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000040F4(&qword_10001D888);
  __chkstk_darwin(v17 - 8);
  id v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000139A0(v37, (uint64_t)v19, &qword_10001D888);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v19, 1, v13) == 1)
  {
    sub_100013A04((uint64_t)v19, &qword_10001D888);
  }
  else
  {
    uint64_t v37 = a6;
    id v20 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v20(v16, v19, v13);
    uint64_t v21 = v33;
    if (v33)
    {
      swift_bridgeObjectRetain();
      sub_100013A04((uint64_t)v11, &qword_10001D6A0);
      v20(v11, v16, v13);
      unint64_t v22 = &v11[*(int *)(v12 + 20)];
      *(void *)unint64_t v22 = v32;
      *((void *)v22 + 1) = v21;
      v31(v11, 0, 1, v12);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    a6 = v37;
  }
  uint64_t v24 = v35;
  unint64_t v23 = v36;
  uint64_t v25 = v34;
  if (qword_10001D2F8 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_100013060(v25, (uint64_t)qword_10001D528);
  uint64_t v27 = sub_1000040F4(&qword_10001D698);
  uint64_t v28 = (uint64_t *)&v8[*(int *)(v27 + 48)];
  sub_1000139A0((uint64_t)v11, (uint64_t)v8, &qword_10001D6A0);
  uint64_t *v28 = v24;
  v28[1] = v23;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 0, 2, v27);
  uint64_t v29 = type metadata accessor for VisibleView(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v8, 0, 1, v29);
  swift_beginAccess();
  sub_100011904(v24, v23);
  sub_100013098((uint64_t)v8, v26);
  swift_endAccess();
  if (qword_10001D2E0 != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, uint64_t))(a6 + 16))(a6, qword_10001D500);
  return sub_100013A04((uint64_t)v11, &qword_10001D6A0);
}

id sub_100012D0C(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  __chkstk_darwin(v4);
  id v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a1 & 1) == 0)
  {
    if (qword_10001D2F0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v17 = qword_10001D520;
    if ((unint64_t)qword_10001D520 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_1000140D0();
      uint64_t v18 = (uint64_t)result;
      if (!result) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((qword_10001D520 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (!v18) {
        goto LABEL_20;
      }
    }
    if (v18 < 1)
    {
      __break(1u);
      return result;
    }
    for (uint64_t i = 0; i != v18; ++i)
    {
      if ((v17 & 0xC000000000000001) != 0) {
        id v20 = (id)sub_100014090();
      }
      else {
        id v20 = *(id *)(v17 + 8 * i + 32);
      }
      uint64_t v21 = v20;
      [v20 dismiss];
    }
LABEL_20:
    swift_bridgeObjectRelease();
    qword_10001D520 = (uint64_t)&_swiftEmptyArrayStorage;
    return (id)swift_bridgeObjectRelease();
  }
  if (qword_10001D2F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v7 = qword_10001D520;
  swift_bridgeObjectRetain();
  sub_100008F4C((uint64_t)v2, v7);
  unint64_t v9 = v8;
  char v11 = v10;
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v12 = (void *)sub_1000090D8(v9);
    swift_endAccess();
  }
  [v2 dismiss];
  if (qword_10001D2F8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_100013060(v4, (uint64_t)qword_10001D528);
  uint64_t v14 = sub_1000040F4(&qword_10001D698);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 2, v14);
  uint64_t v15 = type metadata accessor for VisibleView(0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 0, 1, v15);
  swift_beginAccess();
  sub_100013098((uint64_t)v6, v13);
  swift_endAccess();
  return [v2 requestPresentationStyle:0];
}

uint64_t sub_100013060(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100013098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000040F4((uint64_t *)&unk_10001D7D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100013100(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100013168(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_100013B20;
  return sub_10000C018(a1, v4, v5, v7, v6);
}

uint64_t sub_100013228(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100013B20;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001D850 + dword_10001D850);
  return v6(a1, v4);
}

uint64_t sub_1000132E0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100013318()
{
  return sub_100013894((void (*)(void))&_swift_release, (void (*)(void))&_swift_bridgeObjectRelease);
}

void sub_100013344(uint64_t a1)
{
  sub_100008170(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100013350(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013360()
{
  return swift_release();
}

uint64_t sub_100013368(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000133B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100013418()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100013458(uint64_t a1)
{
  sub_100007D34(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100013460()
{
  return sub_100013894((void (*)(void))&_swift_unknownObjectRelease, (void (*)(void))&_swift_release);
}

uint64_t sub_10001348C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100013B20;
  return sub_10000AFC0(a1, v4, v5, v6);
}

uint64_t sub_100013540()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013578(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100004288;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001D8A0 + dword_10001D8A0);
  return v6(a1, v4);
}

uint64_t sub_100013634(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100004288;
  return sub_10000A6FC(a1, v4, v5, v7, v6);
}

uint64_t sub_1000136F4()
{
  return sub_100013894((void (*)(void))&_swift_release, (void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_100013724()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001376C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100013B20;
  return sub_100006BF0(a1, v4, v5, v7, v6);
}

uint64_t sub_10001382C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100013868()
{
  return sub_100013894((void (*)(void))&_swift_unknownObjectRelease, (void (*)(void))&_swift_release);
}

uint64_t sub_100013894(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 32));

  return _swift_deallocObject(v2, 40, 7);
}

uint64_t sub_1000138EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100013B20;
  return sub_100005B14(a1, v4, v5, v6);
}

uint64_t sub_1000139A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000040F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013A04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000040F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100013A60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_100013AC8(char a1)
{
  sub_10000B9E4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_100013AD0()
{
  unint64_t result = qword_10001D9C0;
  if (!qword_10001D9C0)
  {
    sub_100013C20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D9C0);
  }
  return result;
}

uint64_t sub_100013B3C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100013B70()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100013B80()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100013B90()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100013BA0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100013BB0()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100013BC0()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100013BD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100013BE0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100013BF0()
{
  return URL._bridgeToObjectiveC()();
}

uint64_t sub_100013C00()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_100013C10()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013C20()
{
  return type metadata accessor for URL();
}

uint64_t sub_100013C30()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_100013C40()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100013C50()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013C60()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_100013C70()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013C80()
{
  return type metadata accessor for Date();
}

uint64_t sub_100013C90()
{
  return static ImagePlaygroundConcept.suggestableText(_:)();
}

uint64_t sub_100013CA0()
{
  return static ImagePlaygroundConcept.person(_:)();
}

uint64_t sub_100013CB0()
{
  return type metadata accessor for ImagePlaygroundConcept();
}

uint64_t sub_100013CC0()
{
  return VisualSummary.peopleHandles.getter();
}

uint64_t sub_100013CD0()
{
  return VisualSummary.visualTopLine.getter();
}

uint64_t sub_100013CE0()
{
  return type metadata accessor for VisualSummary();
}

uint64_t sub_100013CF0()
{
  return ServicesFetcher.init()();
}

uint64_t sub_100013D00()
{
  return type metadata accessor for ServicesFetcher();
}

uint64_t sub_100013D20()
{
  return type metadata accessor for ServicesStartup();
}

uint64_t sub_100013D30()
{
  return type metadata accessor for ExecutionContext.GPClientIdentity();
}

uint64_t sub_100013D40()
{
  return static ExecutionContext.setClientIdentity(_:)();
}

uint64_t sub_100013D50()
{
  return LandscapeTrapView.init()();
}

uint64_t sub_100013D60()
{
  return type metadata accessor for LandscapeTrapView();
}

uint64_t sub_100013D70()
{
  return type metadata accessor for ContactPersonHandle();
}

uint64_t sub_100013D80()
{
  return ConversationContextItem.init(timestamp:messageContent:senderHandle:senderDisplayName:)();
}

uint64_t sub_100013D90()
{
  return type metadata accessor for ConversationContextItem();
}

uint64_t sub_100013DB0()
{
  return VisualSummarizationClient.init()();
}

uint64_t sub_100013DC0()
{
  return type metadata accessor for VisualSummarizationClient();
}

uint64_t sub_100013DD0()
{
  return static GPLog.authentication.getter();
}

uint64_t sub_100013DE0()
{
  return static GPLog.messages.getter();
}

uint64_t sub_100013DF0()
{
  return UTType.identifier.getter();
}

uint64_t sub_100013E00()
{
  return static UTType.image.getter();
}

uint64_t sub_100013E10()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100013E20()
{
  return Logger.logObject.getter();
}

uint64_t sub_100013E30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100013E40()
{
  return type metadata accessor for UITraitVerticalSizeClass();
}

uint64_t sub_100013E50()
{
  return errno.getter();
}

uint64_t sub_100013E60()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100013E70()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100013E80()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100013E90()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_100013EA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013EB0()
{
  return String.utf8CString.getter();
}

uint64_t sub_100013EC0()
{
  return String.hash(into:)();
}

uint64_t sub_100013ED0()
{
  return String.count.getter();
}

Swift::Int sub_100013EE0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100013EF0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100013F00()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013F10()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100013F20()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100013F30()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100013F40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100013F50()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100013F60()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100013F70()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100013F80()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100013F90()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100013FA0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100013FB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100013FC0()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_100013FD0()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_100013FE0()
{
  return GPInProcessImagePickerViewController.servicesFetcher.setter();
}

uint64_t sub_100013FF0()
{
  return GPInProcessImageEditionViewController.servicesFetcher.setter();
}

uint64_t sub_100014000()
{
  return GPRecipe.init(promptElements:sourceImage:)();
}

uint64_t sub_100014010()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100014020()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100014030()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100014040()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100014050()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100014060()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100014070()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100014080()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100014090()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000140B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000140C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000140D0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000140E0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000140F0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100014100()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100014110()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100014120()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100014130()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100014140()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100014150()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100014160()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100014170()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100014180()
{
  return Error._code.getter();
}

uint64_t sub_100014190()
{
  return Error._domain.getter();
}

uint64_t sub_1000141A0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000141B0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000141C0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

id objc_msgSend_activeExtensionContext(void *a1, const char *a2, ...)
{
  return _[a1 activeExtensionContext];
}

id objc_msgSend_balloonHostAuditToken(void *a1, const char *a2, ...)
{
  return _[a1 balloonHostAuditToken];
}