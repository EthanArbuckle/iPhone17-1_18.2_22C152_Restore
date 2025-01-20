int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  sub_100003E74(&qword_100021B58);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100017BB0;
  *(void *)(v4 + 32) = type metadata accessor for MathSettingsApplicator();
  sub_100003E74((uint64_t *)&unk_100021F20);
  isa = sub_100016C60().super.isa;
  swift_bridgeObjectRelease();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:0];

  return 0;
}

uint64_t sub_100003E74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of RMModelMathSettingsDeclaration.payloadSystemBehavior()
{
  return 0;
}

void type metadata accessor for RMModelSerializationType(uint64_t a1)
{
}

void type metadata accessor for RMStoreScope(uint64_t a1)
{
}

void sub_100003EE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100003F30()
{
  uint64_t v0 = sub_100016B40();
  sub_10000DBEC(v0, qword_1000223A0);
  sub_10000A9A4(v0, (uint64_t)qword_1000223A0);
  type metadata accessor for MathSettingsAdapter();
  sub_100003E74(&qword_100021DA0);
  sub_100016BE0();
  return sub_100016B30();
}

void sub_100003FC8(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  if (a3)
  {
    sub_100016EF0(30);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = a1;
    v12._object = a2;
    sub_100016C20(v12);
    unint64_t v9 = 0xD00000000000001CLL;
    unint64_t v10 = 0x8000000100018310;
    unint64_t v7 = 0xD000000000000014;
    unint64_t v8 = 0x80000001000183C0;
  }
  else
  {
    sub_100016EF0(18);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = a1;
    v11._object = a2;
    sub_100016C20(v11);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0xD000000000000010;
    unint64_t v10 = 0x80000001000183E0;
  }
  *a4 = v7;
  a4[1] = v8;
  a4[2] = v9;
  a4[3] = v10;
  a4[4] = 0;
}

__n128 sub_1000040C8@<Q0>(uint64_t a1@<X8>)
{
  sub_100003FC8(*(void *)v1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16), (unint64_t *)v5);
  uint64_t v3 = v6;
  __n128 result = (__n128)v5[1];
  *(_OWORD *)a1 = v5[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_100004118(uint64_t a1)
{
  unint64_t v2 = sub_10000DEDC();

  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100004154(uint64_t a1)
{
  unint64_t v2 = sub_10000DEDC();

  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_10000419C(uint64_t a1)
{
  unint64_t v2 = sub_10000DE30();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000041D8(uint64_t a1)
{
  unint64_t v2 = sub_10000DE30();

  return Error<>._code.getter(a1, v2);
}

uint64_t MathSettingsAdapter.configurationClass()()
{
  return type metadata accessor for RMModelMathSettingsDeclaration();
}

id MathSettingsAdapter.declarationKey(forConfiguration:)(uint64_t a1)
{
  unint64_t v2 = self;
  NSString v3 = sub_100016BB0();
  id v4 = [v2 newDeclarationKeyWithSubscriberIdentifier:v3 reference:a1];

  return v4;
}

uint64_t MathSettingsAdapter.beginProcessingConfigurations(for:)()
{
  return _swift_task_switch(sub_10000441C, 0, 0);
}

uint64_t sub_10000441C()
{
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100016B40();
  sub_10000A9A4(v1, (uint64_t)qword_1000223A0);
  unint64_t v2 = sub_100016B20();
  os_log_type_t v3 = sub_100016D40();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Begin processing configurations", v4, 2u);
    swift_slowDealloc();
  }

  v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000046AC(int a1, void *aBlock, void *a3)
{
  *(void *)(v3 + 16) = a3;
  *(void *)(v3 + 24) = _Block_copy(aBlock);
  id v5 = a3;
  return _swift_task_switch(sub_100004728, 0, 0);
}

uint64_t sub_100004728()
{
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100016B40();
  sub_10000A9A4(v1, (uint64_t)qword_1000223A0);
  unint64_t v2 = sub_100016B20();
  os_log_type_t v3 = sub_100016D40();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Begin processing configurations", v4, 2u);
    swift_slowDealloc();
  }
  id v5 = *(void (***)(void, void))(v0 + 24);

  v5[2](v5, 0);
  _Block_release(v5);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t MathSettingsAdapter.endProcessingConfigurations(_:scope:)()
{
  return _swift_task_switch(sub_10000487C, 0, 0);
}

uint64_t sub_10000487C()
{
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100016B40();
  sub_10000A9A4(v1, (uint64_t)qword_1000223A0);
  unint64_t v2 = sub_100016B20();
  os_log_type_t v3 = sub_100016D40();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "End processing configurations", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100004B14(int a1, int a2, void *aBlock, void *a4)
{
  *(void *)(v4 + 16) = a4;
  *(void *)(v4 + 24) = _Block_copy(aBlock);
  id v6 = a4;
  return _swift_task_switch(sub_100004B90, 0, 0);
}

uint64_t sub_100004B90()
{
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100016B40();
  sub_10000A9A4(v1, (uint64_t)qword_1000223A0);
  unint64_t v2 = sub_100016B20();
  os_log_type_t v3 = sub_100016D40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "End processing configurations", v4, 2u);
    swift_slowDealloc();
  }
  id v5 = *(void (***)(void, void))(v0 + 24);

  v5[2](v5, 0);
  _Block_release(v5);
  id v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t MathSettingsAdapter.allDeclarationKeys(for:)()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_100004CE8, 0, 0);
}

uint64_t sub_100004CE8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = sub_1000060BC();
  id v3 = v1;
  uint64_t v4 = sub_100004D9C((uint64_t)v2, v3);

  swift_bridgeObjectRelease();
  uint64_t v5 = sub_10000A9DC((unint64_t)v4);
  swift_bridgeObjectRelease();
  id v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v5);
}

void *sub_100004D9C(uint64_t a1, void *a2)
{
  *(void *)(swift_allocObject() + 16) = a2;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  id v9 = a2;
  __n128 result = (void *)swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v8) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v4 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v19 = *(void *)(v4 + 8 * v11);
        if (!v19)
        {
          int64_t v11 = v18 + 3;
          if (v18 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v19 = *(void *)(v4 + 8 * v11);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v19 - 1) & v19;
    unint64_t v13 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_5:
    v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v13);
    uint64_t v16 = *v14;
    unint64_t v15 = v14[1];
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10000AB30(v16, v15);
    swift_bridgeObjectRelease();
    __n128 result = (void *)sub_1000083F8(v17);
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v8)
  {
LABEL_23:
    swift_release();

    swift_release();
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v19 = *(void *)(v4 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100004F70(uint64_t a1)
{
  uint64_t result = sub_100016D00();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    int64_t v11 = (Swift::Int *)(*(void *)(a1 + 48) + 16 * v10);
    Swift::Int v12 = *v11;
    Swift::Int v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1000089F8(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100005280(int a1, void *aBlock, void *a3)
{
  *(void *)(v3 + 16) = a3;
  *(void *)(v3 + 24) = _Block_copy(aBlock);
  id v5 = a3;
  return _swift_task_switch(sub_1000052FC, 0, 0);
}

uint64_t sub_1000052FC()
{
  id v2 = (void *)v0[2];
  uint64_t v1 = (void (**)(void, void, void))v0[3];
  id v3 = sub_1000060BC();
  id v4 = v2;
  id v5 = sub_100004D9C((uint64_t)v3, v4);

  swift_bridgeObjectRelease();
  sub_10000A9DC((unint64_t)v5);

  swift_bridgeObjectRelease();
  sub_10000D85C(0, &qword_100021CC8);
  sub_10000D4E8();
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class, void))v1)[2](v1, isa, 0);

  _Block_release(v1);
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t MathSettingsAdapter.applyCombinedConfiguration(_:declarationKeys:scope:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100021B90 + dword_100021B90);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_1000054CC;
  return v7(a1, a2);
}

uint64_t sub_1000054CC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  id v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000055CC(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_100016DE0();
    uint64_t v5 = v4;
    sub_100016E80();
    char v6 = sub_100016E10();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_10000D9B4(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_10000A508(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_10000D9B4(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_10000A780(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100005870(void *a1, int a2, int a3, void *aBlock, void *a5)
{
  _OWORD v5[2] = a1;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  sub_10000D85C(0, &qword_100021CC8);
  sub_10000D4E8();
  uint64_t v8 = sub_100016CE0();
  v5[5] = v8;
  Swift::Int v12 = (uint64_t (*)(id, uint64_t))((char *)&dword_100021B90 + dword_100021B90);
  id v9 = a1;
  a5;
  char v10 = (void *)swift_task_alloc();
  v5[6] = v10;
  *char v10 = v5;
  v10[1] = sub_10000598C;
  return v12(v9, v8);
}

uint64_t sub_10000598C()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v7 = sub_100016A90();
    swift_errorRelease();
    Class isa = 0;
    id v9 = (void *)v7;
  }
  else
  {
    sub_10000D85C(0, &qword_100021CD8);
    Class isa = sub_100016C60().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v7 = 0;
    id v9 = isa;
  }
  char v10 = *(void (***)(void, void, void))(v3 + 32);
  ((void (**)(void, Class, uint64_t))v10)[2](v10, isa, v7);

  _Block_release(v10);
  uint64_t v11 = *(uint64_t (**)(void))(v6 + 8);
  return v11();
}

uint64_t MathSettingsAdapter.removeCombinedConfiguration(for:)()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100021BA0 + dword_100021BA0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005C08;
  return v3();
}

uint64_t sub_100005C08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005E74(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v7 = (uint64_t (*)(void))((char *)&dword_100021BA0 + dword_100021BA0);
  a3;
  uint64_t v5 = (void *)swift_task_alloc();
  v3[4] = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_100005F38;
  return v7();
}

uint64_t sub_100005F38()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_100016A90();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

id sub_1000060BC()
{
  id result = [self sharedConnection];
  if (result)
  {
    uint64_t v2 = result;
    NSString v3 = sub_100016BB0();
    id v4 = [v2 allClientUUIDsForClientType:v3];

    if (v4)
    {
      uint64_t v5 = sub_100016CE0();

      id v6 = v0;
      uint64_t v7 = sub_10000AF9C(v5, v6);

      if (qword_100021AA0 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_100016B40();
      sub_10000A9A4(v8, (uint64_t)qword_1000223A0);
      swift_retain_n();
      id v9 = sub_100016B20();
      os_log_type_t v10 = sub_100016D40();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 136315138;
        swift_retain();
        uint64_t v12 = sub_100016CF0();
        unint64_t v14 = v13;
        swift_release();
        sub_100007C14(v12, v14, &v21);
        sub_100016D90();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Found client UUIDs for serialized declaration(s): %s", v11, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      uint64_t v20 = sub_100006430(v7);
      swift_release();
      uint64_t v19 = sub_10000B148(v20);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100021AA0 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_100016B40();
      sub_10000A9A4(v15, (uint64_t)qword_1000223A0);
      int64_t v16 = sub_100016B20();
      os_log_type_t v17 = sub_100016D40();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "No installed serialized declarations found", v18, 2u);
        swift_slowDealloc();
      }

      return &_swiftEmptySetSingleton;
    }
    return (id)v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100006430(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v27 = a1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & v2;
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  id v9 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_22;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v6) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_30;
      }
      unint64_t v13 = *(void *)(v27 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          goto LABEL_30;
        }
        unint64_t v13 = *(void *)(v27 + 8 * v8);
        if (!v13)
        {
          int64_t v8 = v12 + 3;
          if (v12 + 3 >= v6) {
            goto LABEL_30;
          }
          unint64_t v13 = *(void *)(v27 + 8 * v8);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_21:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_22:
    sub_10000DB3C(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v25);
    v23[0] = v25[0];
    v23[1] = v25[1];
    uint64_t v24 = v26;
    sub_10000DB3C((uint64_t)v23, (uint64_t)v20);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
    }
    uint64_t result = sub_10000DB98((uint64_t)v23);
    uint64_t v15 = v22;
    if (v22)
    {
      uint64_t v16 = v21;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000DF34(0, *((void *)v9 + 2) + 1, 1, v9);
        id v9 = (char *)result;
      }
      unint64_t v18 = *((void *)v9 + 2);
      unint64_t v17 = *((void *)v9 + 3);
      if (v18 >= v17 >> 1)
      {
        uint64_t result = (uint64_t)sub_10000DF34((char *)(v17 > 1), v18 + 1, 1, v9);
        id v9 = (char *)result;
      }
      *((void *)v9 + 2) = v18 + 1;
      uint64_t v19 = &v9[16 * v18];
      *((void *)v19 + 4) = v16;
      *((void *)v19 + 5) = v15;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v6)
  {
LABEL_30:
    swift_release();
    return (uint64_t)v9;
  }
  unint64_t v13 = *(void *)(v27 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_30;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_10000668C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003E74(&qword_100021D68);
    uint64_t v2 = (void *)sub_100016FC0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  int64_t v6 = (char *)(v2 + 8);
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    unint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000D99C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000D99C(v35, v36);
    sub_10000D99C(v36, &v32);
    uint64_t result = sub_100016EA0(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000D99C(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_10000D9AC();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t MathSettingsAdapter.configurationUI(forConfiguration:scope:)(uint64_t a1)
{
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100021BB0 + dword_100021BB0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100006AF0;
  return v5(a1);
}

uint64_t sub_100006AF0(char a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (v2)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = a1 & 1;
    uint64_t v6 = a2;
  }
  return v7(v8, v6);
}

uint64_t sub_100006D88(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_100021BB0 + dword_100021BB0);
  id v7 = a1;
  id v8 = a4;
  unint64_t v9 = (void *)swift_task_alloc();
  v4[5] = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_100006E5C;
  return v11((uint64_t)v7);
}

uint64_t sub_100006E5C(char a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *(void *)(*v3 + 32);
  id v8 = *(void **)(*v3 + 24);
  unint64_t v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();

  uint64_t v11 = (void (**)(void, void, void, void))(v7 + 16);
  uint64_t v12 = *(const void **)(v10 + 32);
  if (v4)
  {
    int64_t v13 = (void *)sub_100016A90();
    swift_errorRelease();
    (*v11)(v12, 0, 0, v13);

    _Block_release(v12);
  }
  else
  {
    (*v11)(v12, a1 & 1, a2, 0);
    _Block_release(v12);
  }
  unint64_t v14 = *(uint64_t (**)(void))(v10 + 8);
  return v14();
}

id MathSettingsAdapter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id MathSettingsAdapter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MathSettingsAdapter();
  return objc_msgSendSuper2(&v2, "init");
}

id MathSettingsAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MathSettingsAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100007104(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000DF30;
  return v6();
}

uint64_t sub_1000071D0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *unint64_t v5 = v4;
  v5[1] = sub_10000DF30;
  return v7();
}

uint64_t sub_10000729C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100016CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100016CB0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000D1B8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100016CA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100007440(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000751C;
  return v6(a1);
}

uint64_t sub_10000751C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007614(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_100007AB8(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    int64_t v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  int64_t v13 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_100016C40();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_100016C10();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_100016C10();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_100016C50();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int64_t v13 = sub_10000E044(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v27 = *((void *)v13 + 2);
  unint64_t v26 = *((void *)v13 + 3);
  if (v27 >= v26 >> 1) {
    int64_t v13 = sub_10000E044((char *)(v26 > 1), v27 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v27 + 1;
  long long v28 = &v13[32 * v27];
  *((void *)v28 + 4) = v45;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_100016C10();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (*((void *)v13 + 2) != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_100016C50();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v13 = sub_10000E044(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v39 = *((void *)v13 + 2);
    unint64_t v38 = *((void *)v13 + 3);
    if (v39 >= v38 >> 1) {
      int64_t v13 = sub_10000E044((char *)(v38 > 1), v39 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v39 + 1;
    v40 = &v13[32 * v39];
    *((void *)v40 + 4) = v31;
    *((void *)v40 + 5) = v33;
    *((void *)v40 + 6) = v35;
    *((void *)v40 + 7) = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_100016F90();
  __break(1u);
LABEL_42:
  uint64_t result = sub_100016F90();
  __break(1u);
  return result;
}

uint64_t sub_100007AB8(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_100016C50();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(char **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_10000E044(0, *((void *)v14 + 2) + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = *((void *)v14 + 2);
    unint64_t v16 = *((void *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_10000E044((char *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    *((void *)v14 + 2) = v17 + 1;
    char v18 = &v14[32 * v17];
    *((void *)v18 + 4) = v7;
    *((void *)v18 + 5) = v9;
    *((void *)v18 + 6) = v11;
    *((void *)v18 + 7) = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_100016F90();
  __break(1u);
  return result;
}

uint64_t sub_100007C14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007CE8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D93C((uint64_t)v12, *a3);
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
      sub_10000D93C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D8EC((uint64_t)v12);
  return v7;
}

uint64_t sub_100007CE8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100016DA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007EA4(a5, a6);
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
  uint64_t v8 = sub_100016F30();
  if (!v8)
  {
    sub_100016F90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100016FD0();
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

uint64_t sub_100007EA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007F3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000811C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000811C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007F3C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000080B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100016F00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100016F90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100016C30();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100016FD0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100016F90();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000080B4(uint64_t a1, uint64_t a2)
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
  sub_100003E74(&qword_100021D58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000811C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003E74(&qword_100021D58);
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
  uint64_t result = sub_100016FD0();
  __break(1u);
  return result;
}

uint64_t sub_10000826C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000828C(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000828C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003E74(&qword_100021D88);
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
  uint64_t result = sub_100016FD0();
  __break(1u);
  return result;
}

uint64_t sub_1000083F8(uint64_t result)
{
  unint64_t v4 = v2;
  uint64_t v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t result = sub_100016E40();
    uint64_t v6 = result;
  }
  else
  {
    uint64_t v6 = *(void *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100016FB0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = v18 + v6;
    if (!__OFADD__(v18, v6)) {
      goto LABEL_6;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v6;
  if (__OFADD__(v7, v6)) {
    goto LABEL_21;
  }
LABEL_6:
  unint64_t v9 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v4 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_100016FB0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100016F20();
    swift_bridgeObjectRelease();
    *unint64_t v4 = v12;
    uint64_t v11 = v12 & 0xFFFFFFFFFFFFFF8;
  }
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v14 = (*(void *)(v11 + 24) >> 1) - v13;
  uint64_t result = (uint64_t)sub_10000A118(&v42, (void *)(v11 + 8 * v13 + 32), v14, v5);
  if (result < v6) {
    goto LABEL_22;
  }
  if (result >= 1)
  {
    uint64_t v15 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v16 = __OFADD__(v15, result);
    uint64_t v17 = v15 + result;
    if (v16)
    {
      __break(1u);
LABEL_29:
      if (!sub_100016E70()) {
        goto LABEL_18;
      }
      sub_10000D85C(0, &qword_100021CC8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v22 = v41;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v22) {
          goto LABEL_18;
        }
        while (1)
        {
          uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(void *)(v24 + 0x18) >> 1)
          {
            sub_100016C90();
            uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          uint64_t v25 = *(void *)(v24 + 24) >> 1;
          if (v3 < v25) {
            break;
          }
LABEL_33:
          *(void *)(v24 + 16) = v3;
        }
        uint64_t v26 = v24 + 32;
        while (1)
        {
          *(void *)(v26 + 8 * v3++) = v22;
          int64_t v27 = v45;
          if (v42 < 0)
          {
            if (!sub_100016E70()) {
              goto LABEL_70;
            }
            sub_10000D85C(0, &qword_100021CC8);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            uint64_t v22 = v41;
            swift_unknownObjectRelease();
            goto LABEL_45;
          }
          if (!v46) {
            break;
          }
          unint64_t v28 = (v46 - 1) & v46;
          unint64_t v29 = __clz(__rbit64(v46)) | (v45 << 6);
LABEL_41:
          uint64_t v22 = *(void **)(*(void *)(v42 + 48) + 8 * v29);
          id v30 = v22;
LABEL_42:
          int64_t v45 = v27;
          unint64_t v46 = v28;
LABEL_45:
          if (!v22)
          {
LABEL_70:
            *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_18;
          }
          if (v3 >= v25)
          {
            uint64_t v24 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_33;
          }
        }
        int64_t v31 = v45 + 1;
        if (__OFADD__(v45, 1))
        {
          __break(1u);
LABEL_94:
          uint64_t v22 = 0;
          unint64_t v20 = 0;
          int64_t v19 = v1;
LABEL_27:
          int64_t v45 = v19;
          unint64_t v46 = v20;
          continue;
        }
        break;
      }
      int64_t v32 = (unint64_t)(v44 + 64) >> 6;
      if (v31 >= v32)
      {
        uint64_t v22 = 0;
        unint64_t v28 = 0;
        goto LABEL_42;
      }
      unint64_t v33 = *(void *)(v43 + 8 * v31);
      if (!v33)
      {
        int64_t v34 = v45 + 2;
        if (v45 + 2 >= v32) {
          goto LABEL_67;
        }
        unint64_t v33 = *(void *)(v43 + 8 * v34);
        if (!v33)
        {
          int64_t v1 = v45 + 3;
          if (v45 + 3 >= v32) {
            goto LABEL_68;
          }
          unint64_t v33 = *(void *)(v43 + 8 * v1);
          if (v33)
          {
            int64_t v31 = v45 + 3;
            goto LABEL_51;
          }
          int64_t v34 = v45 + 4;
          if (v45 + 4 >= v32)
          {
            uint64_t v22 = 0;
            unint64_t v28 = 0;
            int64_t v27 = v45 + 3;
            goto LABEL_42;
          }
          unint64_t v33 = *(void *)(v43 + 8 * v34);
          if (!v33)
          {
            int64_t v31 = v45 + 5;
            if (v45 + 5 >= v32)
            {
LABEL_68:
              uint64_t v22 = 0;
              unint64_t v28 = 0;
              int64_t v27 = v34;
              goto LABEL_42;
            }
            unint64_t v33 = *(void *)(v43 + 8 * v31);
            if (!v33)
            {
              int64_t v31 = v32 - 1;
              uint64_t v35 = v45 + 6;
              while (v32 != v35)
              {
                unint64_t v33 = *(void *)(v43 + 8 * v35++);
                if (v33)
                {
                  int64_t v31 = v35 - 1;
                  goto LABEL_51;
                }
              }
LABEL_67:
              uint64_t v22 = 0;
              unint64_t v28 = 0;
              int64_t v27 = v31;
              goto LABEL_42;
            }
            goto LABEL_51;
          }
        }
        int64_t v31 = v34;
      }
LABEL_51:
      unint64_t v28 = (v33 - 1) & v33;
      unint64_t v29 = __clz(__rbit64(v33)) + (v31 << 6);
      int64_t v27 = v31;
      goto LABEL_41;
    }
    *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v17;
  }
  if (result != v14)
  {
LABEL_18:
    sub_10000D9AC();
    return sub_100016C80();
  }
LABEL_23:
  uint64_t v3 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int64_t v19 = v45;
  if (v42 < 0) {
    goto LABEL_29;
  }
  if (v46)
  {
    unint64_t v20 = (v46 - 1) & v46;
    unint64_t v21 = __clz(__rbit64(v46)) | (v45 << 6);
LABEL_26:
    uint64_t v22 = *(void **)(*(void *)(v42 + 48) + 8 * v21);
    id v23 = v22;
    goto LABEL_27;
  }
  int64_t v36 = v45 + 1;
  if (!__OFADD__(v45, 1))
  {
    int64_t v37 = (unint64_t)(v44 + 64) >> 6;
    if (v36 >= v37)
    {
      uint64_t v22 = 0;
      unint64_t v20 = 0;
      goto LABEL_27;
    }
    unint64_t v38 = *(void *)(v43 + 8 * v36);
    if (v38) {
      goto LABEL_75;
    }
    int64_t v39 = v45 + 2;
    if (v45 + 2 >= v37)
    {
LABEL_91:
      uint64_t v22 = 0;
      unint64_t v20 = 0;
      int64_t v19 = v36;
      goto LABEL_27;
    }
    unint64_t v38 = *(void *)(v43 + 8 * v39);
    if (v38) {
      goto LABEL_79;
    }
    int64_t v1 = v45 + 3;
    if (v45 + 3 < v37)
    {
      unint64_t v38 = *(void *)(v43 + 8 * v1);
      if (v38)
      {
        int64_t v36 = v45 + 3;
        goto LABEL_75;
      }
      int64_t v39 = v45 + 4;
      if (v45 + 4 >= v37) {
        goto LABEL_94;
      }
      unint64_t v38 = *(void *)(v43 + 8 * v39);
      if (v38)
      {
LABEL_79:
        int64_t v36 = v39;
LABEL_75:
        unint64_t v20 = (v38 - 1) & v38;
        unint64_t v21 = __clz(__rbit64(v38)) + (v36 << 6);
        int64_t v19 = v36;
        goto LABEL_26;
      }
      int64_t v36 = v45 + 5;
      if (v45 + 5 < v37)
      {
        unint64_t v38 = *(void *)(v43 + 8 * v36);
        if (!v38)
        {
          int64_t v36 = v37 - 1;
          uint64_t v40 = v45 + 6;
          do
          {
            if (v37 == v40) {
              goto LABEL_91;
            }
            unint64_t v38 = *(void *)(v43 + 8 * v40++);
          }
          while (!v38);
          int64_t v36 = v40 - 1;
        }
        goto LABEL_75;
      }
    }
    uint64_t v22 = 0;
    unint64_t v20 = 0;
    int64_t v19 = v39;
    goto LABEL_27;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000089F8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100017060();
  swift_bridgeObjectRetain();
  sub_100016C00();
  Swift::Int v8 = sub_100017070();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100016FF0() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100016FF0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100009644(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100008BA8(void *a1, void *a2)
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
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_100016E50();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_10000D85C(0, &qword_100021CC8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100016E40();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100008E48(v7, result + 1);
    unint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100009320();
      id v23 = v28;
    }
    else
    {
      id v23 = (void *)v22;
      id v24 = v8;
    }
    sub_1000095C0((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100016D70(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_10000D85C(0, &qword_100021CC8);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100016D80();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
        char v19 = sub_100016D80();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_1000097E0((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100008E48(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100003E74(&qword_100021D90);
    uint64_t v2 = sub_100016ED0();
    uint64_t v14 = v2;
    sub_100016DF0();
    if (sub_100016E70())
    {
      sub_10000D85C(0, &qword_100021CC8);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100009320();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100016D70(*(void *)(v2 + 40));
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
      while (sub_100016E70());
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

uint64_t sub_100009040()
{
  int64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003E74(&qword_100022310);
  uint64_t v3 = sub_100016EC0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                int64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
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
      char v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100017060();
      sub_100016C00();
      uint64_t result = sub_100017070();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *int64_t v1 = v4;
  return result;
}

uint64_t sub_100009320()
{
  int64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003E74(&qword_100021D90);
  uint64_t v3 = sub_100016EC0();
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
                int64_t v1 = v28;
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
      uint64_t result = sub_100016D70(*(void *)(v4 + 40));
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
  *int64_t v1 = v4;
  return result;
}

unint64_t sub_1000095C0(uint64_t a1, void *a2)
{
  sub_100016D70(a2[5]);
  unint64_t result = sub_100016DD0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

Swift::Int sub_100009644(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100009040();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_100014340();
      goto LABEL_22;
    }
    sub_100009968();
  }
  uint64_t v11 = *v4;
  sub_100017060();
  sub_100016C00();
  unint64_t result = sub_100017070();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_100016FF0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_100017010();
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
          unint64_t result = sub_100016FF0();
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
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

void sub_1000097E0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100009320();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000144F4();
      goto LABEL_14;
    }
    sub_100009C18();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100016D70(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10000D85C(0, &qword_100021CC8);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100016D80();

    if (v12)
    {
LABEL_13:
      sub_100017010();
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
        char v15 = sub_100016D80();

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

uint64_t sub_100009968()
{
  int64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003E74(&qword_100022310);
  uint64_t v3 = sub_100016EC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *int64_t v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100017060();
    swift_bridgeObjectRetain();
    sub_100016C00();
    uint64_t result = sub_100017070();
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
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    int64_t v1 = v0;
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

uint64_t sub_100009C18()
{
  int64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003E74(&qword_100021D90);
  uint64_t v3 = sub_100016EC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *int64_t v1 = v4;
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
    uint64_t result = sub_100016D70(v19);
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
    int64_t v1 = v28;
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

uint64_t sub_100009E94(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_100003E74(&qword_100021D98);
  uint64_t result = sub_100016EE0();
  uint64_t v6 = result;
  id v30 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2)
      {
LABEL_37:
        swift_release();
        return v6;
      }
      unint64_t v16 = v30[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          goto LABEL_37;
        }
        unint64_t v16 = v30[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            goto LABEL_37;
          }
          unint64_t v16 = v30[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              goto LABEL_37;
            }
            unint64_t v16 = v30[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  goto LABEL_37;
                }
                unint64_t v16 = v30[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    sub_10000DB3C(*(void *)(a4 + 48) + 40 * v14, (uint64_t)v31);
    uint64_t result = sub_100016EA0(*(void *)(v6 + 40));
    uint64_t v18 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v12 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v12 + 8 * v20);
      }
      while (v25 == -1);
      unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(void *)(v12 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v6 + 48) + 40 * v21;
    long long v27 = v31[0];
    long long v28 = v31[1];
    *(void *)(v26 + 32) = v32;
    *(_OWORD *)uint64_t v26 = v27;
    *(_OWORD *)(v26 + 16) = v28;
    ++*(void *)(v6 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void *sub_10000A118(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_100016DF0();
    sub_10000D85C(0, &qword_100021CC8);
    sub_10000D4E8();
    uint64_t result = (void *)sub_100016D20();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    BOOL v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *BOOL v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  BOOL v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_100016E70()) {
        goto LABEL_45;
      }
      sub_10000D85C(0, &qword_100021CC8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

int64_t sub_10000A424(int64_t result, int a2, char a3, uint64_t a4)
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
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_10000A508(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_100016E60();
      sub_10000D85C(0, &qword_100021CC8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_100016E20() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_100016E30();
  sub_10000D85C(0, &qword_100021CC8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_100016D70(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = sub_100016D80();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = sub_100016D80();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  unint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_10000A780(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t _s22MathSettingsSubscriber0aB7AdapterC21combineConfigurationsySo24RMModelConfigurationBaseCSgSayAFGF_0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62)
  {
    uint64_t v3 = (objc_class *)type metadata accessor for RMModelMathSettingsDeclaration();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100016FA0();
    swift_bridgeObjectRelease();
    unint64_t v1 = v12;
  }
  else
  {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    sub_100017000();
    uint64_t v3 = (objc_class *)type metadata accessor for RMModelMathSettingsDeclaration();
    if (!swift_dynamicCastMetatype())
    {
      uint64_t v10 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v10)
      {
        uint64_t v11 = v2 + 32;
        while (swift_dynamicCastClass())
        {
          v11 += 8;
          if (!--v10) {
            goto LABEL_3;
          }
        }
        unint64_t v1 = v2 | 1;
      }
    }
  }
LABEL_3:
  type metadata accessor for RMModelMathSettingsDeclaration();
  id v4 = [objc_allocWithZone(v3) init];
  if (!(v1 >> 62))
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_19:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v4;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_100016FB0();
  uint64_t v5 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_5:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100016F10();
      }
      else {
        id v8 = *(id *)(v1 + 8 * i + 32);
      }
      id v9 = v8;
      RMModelMathSettingsDeclaration.combine(withOther:)((uint64_t)v8);
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A9A4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000A9DC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_100016FB0();
    swift_bridgeObjectRelease();
  }
  sub_10000D85C(0, &qword_100021CC8);
  sub_10000D4E8();
  uint64_t result = sub_100016D00();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100016FB0();
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
        unsigned int v6 = (void *)sub_100016F10();
        sub_100008BA8(&v9, v6);
      }
    }
    else
    {
      unint64_t v7 = (void **)(a1 + 32);
      do
      {
        id v8 = *v7++;
        sub_100008BA8(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AB30(uint64_t a1, unint64_t a2)
{
  v13[0] = 38;
  v13[1] = 0xE100000000000000;
  v12[2] = v13;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100007614(0x7FFFFFFFFFFFFFFFLL, 1, sub_10000DA9C, (uint64_t)v12, a1, a2);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    v13[0] = &_swiftEmptyArrayStorage;
    sub_100016F60();
    unsigned int v6 = self;
    uint64_t v7 = v4 + 56;
    do
    {
      swift_bridgeObjectRetain();
      sub_100016BF0();
      NSString v8 = sub_100016BB0();
      swift_bridgeObjectRelease();
      [v6 newDeclarationKey:v8];
      swift_bridgeObjectRelease();

      sub_100016F40();
      sub_100016F70();
      sub_100016F80();
      sub_100016F50();
      v7 += 32;
      --v5;
    }
    while (v5);
    id v9 = (void *)v13[0];
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v9 = &_swiftEmptyArrayStorage;
  }
  uint64_t v10 = sub_10000A9DC((unint64_t)v9);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000ACDC(uint64_t result, uint64_t a2, uint64_t a3)
{
  BOOL v24 = (unint64_t *)result;
  uint64_t v25 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  int64_t v30 = "uration.math.settings";
  while (v8)
  {
    unint64_t v11 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v12 = v11 | (v4 << 6);
LABEL_21:
    sub_10000DB3C(*(void *)(a3 + 48) + 40 * v12, (uint64_t)v29);
    sub_10000DB3C((uint64_t)v29, (uint64_t)v28);
    swift_dynamicCast();
    uint64_t v16 = sub_10000AB30(v26, v27);
    swift_bridgeObjectRelease();
    unint64_t v17 = (void *)sub_1000055CC(v16);
    swift_bridgeObjectRelease();
    if (v17)
    {
      id v18 = [v17 subscriberIdentifier];

      uint64_t v19 = sub_100016BC0();
      uint64_t v21 = v20;

      if (v19 == 0xD000000000000030 && v21 == 0x8000000100017EE0)
      {
        swift_bridgeObjectRelease();
        uint64_t result = sub_10000DB98((uint64_t)v29);
        goto LABEL_25;
      }
      char v10 = sub_100016FF0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_10000DB98((uint64_t)v29);
      if (v10)
      {
LABEL_25:
        *(unint64_t *)((char *)v24 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        if (__OFADD__(v25++, 1)) {
          goto LABEL_32;
        }
      }
    }
    else
    {
      uint64_t result = sub_10000DB98((uint64_t)v29);
    }
  }
  int64_t v13 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v13 >= v9) {
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v13);
  ++v4;
  if (v14) {
    goto LABEL_20;
  }
  int64_t v4 = v13 + 1;
  if (v13 + 1 >= v9) {
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v4);
  if (v14) {
    goto LABEL_20;
  }
  int64_t v4 = v13 + 2;
  if (v13 + 2 >= v9) {
    goto LABEL_29;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v4);
  if (v14)
  {
LABEL_20:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
    goto LABEL_21;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v9)
  {
LABEL_29:
    swift_retain();
    return sub_100009E94(v24, a2, v25, a3);
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_29;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_10000AF9C(uint64_t a1, void *a2)
{
  char v4 = *(unsigned char *)(a1 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (unint64_t)((1 << v4) + 63) >> 6;
  id v7 = a2;
  if (v5 <= 0xD || (swift_stdlib_isStackAllocationSafe() & 1) != 0)
  {
    __chkstk_darwin();
    unint64_t v8 = (char *)&v14 - ((8 * v6 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v8, 8 * v6);
    id v9 = v7;
    uint64_t v10 = sub_10000ACDC((uint64_t)v8, v6, a1);
    swift_release();

    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, 8 * v6);
    id v12 = v7;
    uint64_t v10 = sub_10000ACDC((uint64_t)v11, v6, a1);
    swift_release();

    swift_slowDealloc();
  }
  return v10;
}

uint64_t sub_10000B148(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100016D00();
  uint64_t v8 = result;
  if (v2)
  {
    char v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000089F8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000B1E0(uint64_t a1)
{
  unint64_t v28 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    uint64_t v2 = sub_100016E40();
  }
  else {
    uint64_t v2 = *(void *)(a1 + 16);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2)
  {
LABEL_21:
    uint64_t v29 = v3;
    sub_100003E74(&qword_100021D78);
    sub_10000D9C0();
    uint64_t v27 = sub_100016B80();
    swift_bridgeObjectRelease();
    return v27;
  }
  unint64_t v33 = &_swiftEmptyArrayStorage;
  sub_10000826C(0, v2 & ~(v2 >> 63), 0);
  if (v28)
  {
    uint64_t result = sub_100016DE0();
    char v6 = 1;
  }
  else
  {
    uint64_t result = sub_10000A780(a1);
    char v6 = v7 & 1;
  }
  uint64_t v30 = result;
  uint64_t v31 = v5;
  char v32 = v6;
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        int64_t v14 = v30;
        uint64_t v13 = v31;
        char v15 = v32;
        sub_10000A508(v30, v31, v32, a1);
        unint64_t v17 = v16;
        id v18 = [v16 key];
        uint64_t v19 = sub_100016BC0();
        uint64_t v21 = v20;

        uint64_t v22 = v33;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = sub_10000826C(0, v22[2] + 1, 1);
          uint64_t v22 = v33;
        }
        unint64_t v24 = v22[2];
        unint64_t v23 = v22[3];
        if (v24 >= v23 >> 1)
        {
          uint64_t result = sub_10000826C(v23 > 1, v24 + 1, 1);
          uint64_t v22 = v33;
        }
        v22[2] = v24 + 1;
        uint64_t v25 = (char *)&v22[2 * v24];
        *((void *)v25 + 4) = v19;
        *((void *)v25 + 5) = v21;
        if (v28) {
          break;
        }
        int64_t v8 = sub_10000A424(v14, v13, v15, a1);
        uint64_t v10 = v9;
        char v12 = v11;
        sub_10000D9B4(v14, v13, v15);
        uint64_t v30 = v8;
        uint64_t v31 = v10;
        char v32 = v12 & 1;
        if (!--v2) {
          goto LABEL_20;
        }
      }
      if ((v15 & 1) == 0) {
        goto LABEL_23;
      }
      if (sub_100016E00()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_100003E74(&qword_100021D70);
      uint64_t v26 = (void (*)(void **, void))sub_100016D10();
      sub_100016E90();
      v26(&v29, 0);
      --v2;
    }
    while (v2);
LABEL_20:
    sub_10000D9B4(v30, v31, v32);
    uint64_t v3 = v33;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_10000B4A0(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100016BC0();
  uint64_t v3 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator;
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator);
  if (v4
    && (uint64_t v5 = *(void *)(v4
                       + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode)) != 0)
  {
    id v6 = objc_retain(objc_retain(*(id *)(v5
                                       + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration19CalculatorBasicMode_payloadAddSquareRoot)));
    NSString v7 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v7, objc_msgSend(v6, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v8 = *(void *)(a1 + v3);
  if (v8
    && (uint64_t v9 = *(void *)(v8
                       + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode)) != 0)
  {
    id v10 = objc_retain(objc_retain(*(id *)(v9
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorProgrammerMode_payloadEnabled)));
    NSString v11 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v11, objc_msgSend(v10, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v12 = *(void *)(a1 + v3);
  if (v12
    && (uint64_t v13 = *(void *)(v12
                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode)) != 0)
  {
    id v14 = objc_retain(objc_retain(*(id *)(v13
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorScientificMode_payloadEnabled)));
    NSString v15 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v15, objc_msgSend(v14, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v16 = *(void *)(a1 + v3);
  if (v16
    && (uint64_t v17 = *(void *)(v16
                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode)) != 0)
  {
    id v18 = objc_retain(objc_retain(*(id *)(v17
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled)));
    NSString v19 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v19, objc_msgSend(v18, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v20 = *(void *)(a1 + v3);
  if (v20
    && (uint64_t v21 = *(void *)(v20
                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes)) != 0)
  {
    id v22 = objc_retain(objc_retain(*(id *)(v21
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes_payloadRPN)));
    NSString v23 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v23, objc_msgSend(v22, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v24 = *(void *)(a1 + v3);
  if (v24
    && (uint64_t v25 = *(void *)(v24
                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes)) != 0)
  {
    id v26 = objc_retain(objc_retain(*(id *)(v25
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes_payloadUnitConversion)));
    NSString v27 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v27, objc_msgSend(v26, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v28 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior;
  uint64_t v29 = *(void *)(a1 + OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior);
  if (v29)
  {
    id v30 = objc_retain(objc_retain(*(id *)(v29
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions)));
    NSString v31 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v31, objc_msgSend(v30, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100016BC0();
  uint64_t v32 = *(void *)(a1 + v28);
  if (v32)
  {
    id v33 = objc_retain(objc_retain(*(id *)(v32
                                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes)));
    NSString v34 = sub_100016BB0();
    objc_msgSend(v2, "MCSetBoolRestriction:value:", v34, objc_msgSend(v33, "BOOLValue"));
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v2;
  uint64_t result = sub_100016B60();
  __break(1u);
  return result;
}

id sub_10000BA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSString a5)
{
  id v7 = [self sharedConnection];
  if (!v7) {
    __break(1u);
  }
  uint64_t v8 = v7;
  sub_10000668C(a1);
  v9.super.Class isa = sub_100016B50().super.isa;
  swift_bridgeObjectRelease();
  NSString v10 = sub_100016BB0();
  NSString v11 = sub_100016BB0();
  if (a5) {
    a5 = sub_100016BB0();
  }
  id v21 = 0;
  unsigned int v12 = [v8 applyRestrictionDictionary:v9.super.isa clientType:v10 clientUUID:v11 localizedClientDescription:a5 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v21];

  if (v12) {
    return v21;
  }
  id v14 = v21;
  sub_100016AA0();

  swift_willThrow();
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_100016B40();
  sub_10000A9A4(v15, (uint64_t)qword_1000223A0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v16 = sub_100016B20();
  os_log_type_t v17 = sub_100016D50();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    NSString v19 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 138543362;
    swift_errorRetain();
    uint64_t v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v21 = v20;
    sub_100016D90();
    *NSString v19 = v20;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unable to apply restrictions: %{public}@", v18, 0xCu);
    sub_100003E74(&qword_100021D60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return (id)swift_willThrow();
}

id sub_10000BD58()
{
  id v0 = [self sharedConnection];
  if (!v0) {
    __break(1u);
  }
  unint64_t v1 = v0;
  NSString v2 = sub_100016BB0();
  NSString v3 = sub_100016BB0();
  id v13 = 0;
  unsigned int v4 = [v1 applyRestrictionDictionary:0 clientType:v2 clientUUID:v3 localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v13];

  if (v4) {
    return v13;
  }
  id v6 = v13;
  sub_100016AA0();

  swift_willThrow();
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100016B40();
  sub_10000A9A4(v7, (uint64_t)qword_1000223A0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_100016B20();
  os_log_type_t v9 = sub_100016D50();
  if (os_log_type_enabled(v8, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    NSString v11 = (void *)swift_slowAlloc();
    *(_DWORD *)NSString v10 = 138543362;
    swift_errorRetain();
    unsigned int v12 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v13 = v12;
    sub_100016D90();
    *NSString v11 = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to remove restrictions: %{public}@", v10, 0xCu);
    sub_100003E74(&qword_100021D60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return (id)swift_willThrow();
}

uint64_t sub_10000C014(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return _swift_task_switch(sub_10000C038, 0, 0);
}

uint64_t sub_10000C038()
{
  uint64_t v52 = v0;
  unint64_t v2 = v0 + 24;
  unint64_t v1 = *(void **)(v0 + 24);
  type metadata accessor for RMModelMathSettingsDeclaration();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3)
  {
    sub_100016EF0(30);
    swift_bridgeObjectRelease();
    v51[0] = 0xD00000000000001CLL;
    v51[1] = 0x8000000100018310;
    id v17 = [v1 declarationType];
    uint64_t v18 = sub_100016BC0();
    uint64_t v20 = v19;

    v54._countAndFlagsBits = v18;
    v54._object = v20;
    sub_100016C20(v54);
    swift_bridgeObjectRelease();
    sub_10000D898();
    swift_allocError();
    *(void *)uint64_t v21 = 0xD00000000000001CLL;
    *(void *)(v21 + 8) = 0x8000000100018310;
    *(unsigned char *)(v21 + 16) = 0;
    swift_willThrow();
    unint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
    return v46();
  }
  unint64_t v4 = v3;
  uint64_t v5 = qword_100021AA0;
  id v6 = v1;
  if (v5 == -1) {
    goto LABEL_3;
  }
LABEL_42:
  swift_once();
LABEL_3:
  uint64_t v7 = sub_100016B40();
  sub_10000A9A4(v7, (uint64_t)qword_1000223A0);
  uint64_t v8 = sub_100016B20();
  os_log_type_t v9 = sub_100016D40();
  if (os_log_type_enabled(v8, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Checking for existing declarations to be removed", v10, 2u);
    swift_slowDealloc();
  }

  v50 = sub_1000060BC();
  swift_bridgeObjectRetain_n();
  NSString v11 = sub_100016B20();
  os_log_type_t v12 = sub_100016D40();
  v49 = (void *)v0;
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    v51[0] = swift_slowAlloc();
    *(_DWORD *)id v13 = 136446210;
    sub_10000D85C(0, &qword_100021CC8);
    sub_10000D4E8();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100016CF0();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *(void *)(v2 - 8) = sub_100007C14(v14, v16, v51);
    sub_100016D90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Applying configuration with keys: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v0 = (uint64_t)v49;
  uint64_t v22 = swift_bridgeObjectRetain();
  NSString v23 = (void *)sub_1000055CC(v22);
  swift_bridgeObjectRelease();
  if (v23)
  {
    id v24 = [v23 storeIdentifier];

    NSString v23 = (void *)sub_100016BC0();
    id v26 = v25;
  }
  else
  {
    id v26 = 0;
  }
  uint64_t v27 = sub_10000B1E0(v49[4]);
  uint64_t v29 = v28;
  uint64_t v30 = sub_10000B4A0(v4);
  sub_10000BA3C(v30, v27, v29, (uint64_t)v23, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  int64_t v32 = 0;
  id v33 = v50 + 56;
  uint64_t v34 = -1;
  uint64_t v35 = -1 << v50[32];
  if (-v35 < 64) {
    uint64_t v34 = ~(-1 << -(char)v35);
  }
  unint64_t v2 = v34 & *((void *)v50 + 7);
  int64_t v36 = (unint64_t)(63 - v35) >> 6;
  if (v2)
  {
LABEL_15:
    unint64_t v37 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    unint64_t v38 = v37 | (v32 << 6);
    goto LABEL_30;
  }
  while (1)
  {
    int64_t v39 = v32 + 1;
    if (__OFADD__(v32, 1))
    {
      __break(1u);
      goto LABEL_42;
    }
    if (v39 >= v36) {
      goto LABEL_38;
    }
    unint64_t v40 = *(void *)&v33[8 * v39];
    ++v32;
    if (!v40)
    {
      int64_t v32 = v39 + 1;
      if (v39 + 1 >= v36) {
        goto LABEL_38;
      }
      unint64_t v40 = *(void *)&v33[8 * v32];
      if (!v40)
      {
        int64_t v32 = v39 + 2;
        if (v39 + 2 >= v36) {
          goto LABEL_38;
        }
        unint64_t v40 = *(void *)&v33[8 * v32];
        if (!v40) {
          break;
        }
      }
    }
LABEL_29:
    unint64_t v2 = (v40 - 1) & v40;
    unint64_t v38 = __clz(__rbit64(v40)) + (v32 << 6);
LABEL_30:
    uint64_t v42 = (uint64_t *)(*((void *)v50 + 6) + 16 * v38);
    uint64_t v43 = *v42;
    unint64_t v4 = v42[1];
    swift_bridgeObjectRetain_n();
    uint64_t v44 = sub_100016B20();
    os_log_type_t v45 = sub_100016D40();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v0 = swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v0 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 4) = sub_100007C14(v43, v4, v51);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Removing (old) serialized declaration: %{public}s", (uint8_t *)v0, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10000BD58();
    uint64_t result = swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_15;
    }
  }
  int64_t v41 = v39 + 3;
  if (v41 >= v36)
  {
LABEL_38:
    uint64_t v47 = (void *)v49[3];
    swift_release();

    unint64_t v48 = (uint64_t (*)(void *))v49[1];
    return v48(&_swiftEmptyArrayStorage);
  }
  unint64_t v40 = *(void *)&v33[8 * v41];
  if (v40)
  {
    int64_t v32 = v41;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v32 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v32 >= v36) {
      goto LABEL_38;
    }
    unint64_t v40 = *(void *)&v33[8 * v32];
    ++v41;
    if (v40) {
      goto LABEL_29;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C770()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_10000C790, 0, 0);
}

uint64_t sub_10000C790()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0 + 24;
  unint64_t v2 = sub_1000060BC();
  if (qword_100021AA0 != -1) {
LABEL_30:
  }
    swift_once();
  uint64_t v3 = sub_100016B40();
  sub_10000A9A4(v3, (uint64_t)qword_1000223A0);
  swift_bridgeObjectRetain_n();
  unint64_t v4 = sub_100016B20();
  os_log_type_t v5 = sub_100016D40();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint64_t *)(v1 - 8);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v22;
    *(_DWORD *)uint64_t v7 = 134218242;
    *id v6 = v2[2];
    sub_100016D90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100016CF0();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    *id v6 = sub_100007C14(v8, v10, &v23);
    sub_100016D90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removing combined configuration for %ld serialized declaration(s): %s", (uint8_t *)v7, 0x16u);
    uint64_t v1 = v22;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  int64_t v11 = 0;
  os_log_type_t v12 = (char *)(v2 + 7);
  uint64_t v13 = -1;
  uint64_t v14 = -1 << *((unsigned char *)v2 + 32);
  if (-v14 < 64) {
    uint64_t v13 = ~(-1 << -(char)v14);
  }
  uint64_t v15 = v13 & v2[7];
  int64_t v16 = (unint64_t)(63 - v14) >> 6;
  while (1)
  {
    if (v15)
    {
      v15 &= v15 - 1;
      goto LABEL_9;
    }
    int64_t v17 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v16) {
      goto LABEL_25;
    }
    uint64_t v18 = *(void *)&v12[8 * v17];
    ++v11;
    if (!v18)
    {
      int64_t v11 = v17 + 1;
      if (v17 + 1 >= v16) {
        goto LABEL_25;
      }
      uint64_t v18 = *(void *)&v12[8 * v11];
      if (!v18)
      {
        int64_t v11 = v17 + 2;
        if (v17 + 2 >= v16) {
          goto LABEL_25;
        }
        uint64_t v18 = *(void *)&v12[8 * v11];
        if (!v18) {
          break;
        }
      }
    }
LABEL_24:
    uint64_t v15 = (v18 - 1) & v18;
LABEL_9:
    swift_bridgeObjectRetain();
    uint64_t v1 = 0;
    sub_10000BD58();
    swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 3;
  if (v19 < v16)
  {
    uint64_t v18 = *(void *)&v12[8 * v19];
    if (!v18)
    {
      while (1)
      {
        int64_t v11 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_29;
        }
        if (v11 >= v16) {
          goto LABEL_25;
        }
        uint64_t v18 = *(void *)&v12[8 * v11];
        ++v19;
        if (v18) {
          goto LABEL_24;
        }
      }
    }
    int64_t v11 = v19;
    goto LABEL_24;
  }
LABEL_25:
  swift_release();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_10000CB10(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10000CB30, 0, 0);
}

uint64_t sub_10000CB30()
{
  uint64_t v35 = v0;
  if (qword_100021AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = (id *)(v0 + 24);
  unint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = sub_100016B40();
  sub_10000A9A4(v3, (uint64_t)qword_1000223A0);
  id v4 = v2;
  os_log_type_t v5 = sub_100016B20();
  os_log_type_t v6 = sub_100016D40();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 24);
  unint64_t v9 = &MathSettingsAdapter;
  uint64_t v33 = v0;
  if (v7)
  {
    int64_t v32 = (uint64_t *)(v0 + 16);
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 136446210;
    id v11 = [v8 declaration];
    id v12 = [v11 declarationIdentifier];

    uint64_t v13 = sub_100016BC0();
    unint64_t v15 = v14;

    *int64_t v32 = sub_100007C14(v13, v15, &v34);
    sub_100016D90();

    unint64_t v9 = &MathSettingsAdapter;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Get configuration UI for: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v16 = [*v1 (SEL)v9[509].count];
  type metadata accessor for RMModelMathSettingsDeclaration();
  uint64_t v17 = swift_dynamicCastClass();
  if (v17)
  {
    id v18 = sub_10000E670(v17);

    int64_t v19 = *(uint64_t (**)(uint64_t, id))(v33 + 8);
    return v19(1, v18);
  }
  else
  {

    uint64_t v21 = sub_100016B20();
    os_log_type_t v22 = sub_100016D50();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Invalid configuration type in configurationUI", v23, 2u);
      swift_slowDealloc();
    }
    uint64_t v24 = *(void **)(v33 + 24);

    id v25 = [v24 (SEL)v9[509].count];
    id v26 = [v25 declarationType];

    uint64_t v27 = sub_100016BC0();
    uint64_t v29 = v28;

    sub_10000D898();
    swift_allocError();
    *(void *)uint64_t v30 = v27;
    *(void *)(v30 + 8) = v29;
    *(unsigned char *)(v30 + 16) = 1;
    swift_willThrow();
    NSString v31 = *(uint64_t (**)(void))(v33 + 8);
    return v31(0);
  }
}

uint64_t type metadata accessor for MathSettingsAdapter()
{
  return self;
}

uint64_t sub_10000CF1C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000CF64()
{
  unint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  os_log_type_t v5 = (void *)v0[4];
  id v4 = (void *)v0[5];
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *os_log_type_t v6 = v1;
  v6[1] = sub_100005C08;
  BOOL v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_100021C48 + dword_100021C48);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000D028()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *os_log_type_t v5 = v1;
  v5[1] = sub_10000DF30;
  os_log_type_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100021C58 + dword_100021C58);
  return v6(v2, v3, v4);
}

uint64_t sub_10000D0EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_10000DF30;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100021C68 + dword_100021C68);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000D1B8(uint64_t a1)
{
  uint64_t v2 = sub_100003E74(&qword_100021C40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D218()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D250(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005C08;
  os_log_type_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100021C78 + dword_100021C78);
  return v6(a1, v4);
}

uint64_t sub_10000D30C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000DF30;
  os_log_type_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100021C88 + dword_100021C88);
  return v6(v2, v3, v4);
}

uint64_t sub_10000D3C8()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000D418()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  os_log_type_t v6 = (void *)v0[6];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *BOOL v7 = v1;
  v7[1] = sub_10000DF30;
  uint64_t v8 = (uint64_t (*)(void *, int, int, void *, void *))((char *)&dword_100021CA8 + dword_100021CA8);
  return v8(v2, v3, v4, v5, v6);
}

unint64_t sub_10000D4E8()
{
  unint64_t result = qword_100021CD0;
  if (!qword_100021CD0)
  {
    sub_10000D85C(255, &qword_100021CC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021CD0);
  }
  return result;
}

uint64_t sub_10000D554()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000DF30;
  os_log_type_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100021CE0 + dword_100021CE0);
  return v6(v2, v3, v4);
}

uint64_t sub_10000D610()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D650()
{
  int v2 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void **)(v0 + 40);
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *os_log_type_t v6 = v1;
  v6[1] = sub_10000DF30;
  BOOL v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_100021D00 + dword_100021D00);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_10000D720()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D760()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000DF30;
  os_log_type_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100021D20 + dword_100021D20);
  return v6(v2, v3, v4);
}

uint64_t sub_10000D81C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D85C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_10000D898()
{
  unint64_t result = qword_100021D50;
  if (!qword_100021D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021D50);
  }
  return result;
}

uint64_t sub_10000D8EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000D93C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000D99C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D9AC()
{
  return swift_release();
}

uint64_t sub_10000D9B4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10000D9C0()
{
  unint64_t result = qword_100021D80;
  if (!qword_100021D80)
  {
    sub_10000DA1C(&qword_100021D78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021D80);
  }
  return result;
}

uint64_t sub_10000DA1C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000DA64()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DA9C(void *a1)
{
  long long v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_100016FF0() & 1;
  }
}

uint64_t sub_10000DAF4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DB2C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000DB3C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000DB98(uint64_t a1)
{
  return a1;
}

uint64_t *sub_10000DBEC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000DC54()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for MathSettingsAdapter.AdapterError()
{
  return sub_10000DC6C();
}

uint64_t sub_10000DC6C()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22MathSettingsSubscriber19MathSettingsAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10000DC54();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MathSettingsAdapter.AdapterError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10000DC54();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000DC6C();
  return a1;
}

__n128 initializeWithTake for MathSettingsAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MathSettingsAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000DC6C();
  return a1;
}

uint64_t getEnumTagSinglePayload for MathSettingsAdapter.AdapterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MathSettingsAdapter.AdapterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10000DE00(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10000DE0C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MathSettingsAdapter.AdapterError()
{
  return &type metadata for MathSettingsAdapter.AdapterError;
}

unint64_t sub_10000DE30()
{
  unint64_t result = qword_100021DA8;
  if (!qword_100021DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DA8);
  }
  return result;
}

unint64_t sub_10000DE88()
{
  unint64_t result = qword_100021DB0;
  if (!qword_100021DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DB0);
  }
  return result;
}

unint64_t sub_10000DEDC()
{
  unint64_t result = qword_100021DB8;
  if (!qword_100021DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100021DB8);
  }
  return result;
}

char *sub_10000DF34(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003E74(&qword_100021D88);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000E358(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000E044(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003E74(&qword_100021E88);
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
    sub_10000E264(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000E154(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003E74(&qword_100021E80);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000E564(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E264(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100016FD0();
  __break(1u);
  return result;
}

uint64_t sub_10000E358(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100016FD0();
  __break(1u);
  return result;
}

uint64_t sub_10000E44C()
{
  return sub_100016BD0();
}

uint64_t sub_10000E564(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100003E74(&qword_100021D78);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100016FD0();
  __break(1u);
  return result;
}

id sub_10000E670(uint64_t a1)
{
  sub_100016AF0();
  __chkstk_darwin();
  sub_100016BA0();
  __chkstk_darwin();
  sub_100016B90();
  sub_100016AE0();
  sub_100016BD0();
  sub_100016B90();
  sub_100016AE0();
  sub_100016BD0();
  uint64_t v2 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator;
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator);
  uint64_t v4 = sub_100017000;
  if (!v3)
  {
    int64_t v11 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_39;
  }
  uint64_t v5 = *(void *)(v3
                 + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode);
  if (!v5)
  {
    int64_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_9:
    uint64_t v14 = *(void *)(v3
                    + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode);
    if (!v14) {
      goto LABEL_15;
    }
    unint64_t v15 = *(void **)(v14
                   + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorProgrammerMode_payloadEnabled);
    sub_100003E74(&qword_100021D88);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = *((_OWORD *)v4 + 215);
    id v17 = v15;
    sub_100016B90();
    sub_100016AE0();
    *(void *)(v16 + 32) = sub_100016BD0();
    *(void *)(v16 + 40) = v18;
    [v17 BOOLValue];
    *(void *)(v16 + 48) = sub_10000E44C();
    *(void *)(v16 + 56) = v19;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v21 = *((void *)v11 + 2);
    unint64_t v20 = *((void *)v11 + 3);
    if (v21 >= v20 >> 1) {
      int64_t v11 = sub_10000E154((char *)(v20 > 1), v21 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v21 + 1;
    *(void *)&v11[8 * v21 + 32] = v16;

    uint64_t v3 = *(void *)(a1 + v2);
    uint64_t v4 = sub_100017000;
    if (v3)
    {
LABEL_15:
      uint64_t v22 = *(void *)(v3
                      + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode);
      if (!v22) {
        goto LABEL_21;
      }
      uint64_t v23 = *(void **)(v22
                     + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorScientificMode_payloadEnabled);
      sub_100003E74(&qword_100021D88);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = *((_OWORD *)v4 + 215);
      id v25 = v23;
      sub_100016B90();
      sub_100016AE0();
      *(void *)(v24 + 32) = sub_100016BD0();
      *(void *)(v24 + 40) = v26;
      [v25 BOOLValue];
      *(void *)(v24 + 48) = sub_10000E44C();
      *(void *)(v24 + 56) = v27;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
      }
      unint64_t v29 = *((void *)v11 + 2);
      unint64_t v28 = *((void *)v11 + 3);
      if (v29 >= v28 >> 1) {
        int64_t v11 = sub_10000E154((char *)(v28 > 1), v29 + 1, 1, v11);
      }
      *((void *)v11 + 2) = v29 + 1;
      *(void *)&v11[8 * v29 + 32] = v24;

      uint64_t v3 = *(void *)(a1 + v2);
      uint64_t v4 = sub_100017000;
      if (v3)
      {
LABEL_21:
        uint64_t v30 = *(void *)(v3
                        + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode);
        if (!v30) {
          goto LABEL_27;
        }
        NSString v31 = *(void **)(v30
                       + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled);
        sub_100003E74(&qword_100021D88);
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = *((_OWORD *)v4 + 215);
        id v33 = v31;
        sub_100016B90();
        sub_100016AE0();
        *(void *)(v32 + 32) = sub_100016BD0();
        *(void *)(v32 + 40) = v34;
        [v33 BOOLValue];
        *(void *)(v32 + 48) = sub_10000E44C();
        *(void *)(v32 + 56) = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
        }
        unint64_t v37 = *((void *)v11 + 2);
        unint64_t v36 = *((void *)v11 + 3);
        if (v37 >= v36 >> 1) {
          int64_t v11 = sub_10000E154((char *)(v36 > 1), v37 + 1, 1, v11);
        }
        *((void *)v11 + 2) = v37 + 1;
        *(void *)&v11[8 * v37 + 32] = v32;

        uint64_t v3 = *(void *)(a1 + v2);
        uint64_t v4 = sub_100017000;
        if (v3)
        {
LABEL_27:
          uint64_t v38 = *(void *)(v3
                          + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes);
          if (!v38) {
            goto LABEL_33;
          }
          int64_t v39 = *(void **)(v38
                         + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes_payloadRPN);
          sub_100003E74(&qword_100021D88);
          uint64_t v40 = swift_allocObject();
          *(_OWORD *)(v40 + 16) = *((_OWORD *)v4 + 215);
          id v41 = v39;
          sub_100016B90();
          sub_100016AE0();
          *(void *)(v40 + 32) = sub_100016BD0();
          *(void *)(v40 + 40) = v42;
          [v41 BOOLValue];
          *(void *)(v40 + 48) = sub_10000E44C();
          *(void *)(v40 + 56) = v43;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
          }
          unint64_t v45 = *((void *)v11 + 2);
          unint64_t v44 = *((void *)v11 + 3);
          if (v45 >= v44 >> 1) {
            int64_t v11 = sub_10000E154((char *)(v44 > 1), v45 + 1, 1, v11);
          }
          *((void *)v11 + 2) = v45 + 1;
          *(void *)&v11[8 * v45 + 32] = v40;

          uint64_t v3 = *(void *)(a1 + v2);
          uint64_t v4 = sub_100017000;
          if (v3)
          {
LABEL_33:
            uint64_t v46 = *(void *)(v3
                            + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes);
            if (v46)
            {
              uint64_t v47 = *(void **)(v46
                             + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes_payloadUnitConversion);
              sub_100003E74(&qword_100021D88);
              uint64_t v48 = swift_allocObject();
              *(_OWORD *)(v48 + 16) = *((_OWORD *)v4 + 215);
              id v49 = v47;
              sub_100016B90();
              sub_100016AE0();
              *(void *)(v48 + 32) = sub_100016BD0();
              *(void *)(v48 + 40) = v50;
              [v49 BOOLValue];
              *(void *)(v48 + 48) = sub_10000E44C();
              *(void *)(v48 + 56) = v51;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
              }
              unint64_t v53 = *((void *)v11 + 2);
              unint64_t v52 = *((void *)v11 + 3);
              if (v53 >= v52 >> 1) {
                int64_t v11 = sub_10000E154((char *)(v52 > 1), v53 + 1, 1, v11);
              }
              *((void *)v11 + 2) = v53 + 1;
              *(void *)&v11[8 * v53 + 32] = v48;

              uint64_t v4 = sub_100017000;
            }
          }
        }
      }
    }
    goto LABEL_39;
  }
  unint64_t v6 = *(void **)(v5
                + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration19CalculatorBasicMode_payloadAddSquareRoot);
  sub_100003E74(&qword_100021D88);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100017D70;
  id v8 = v6;
  sub_100016B90();
  sub_100016AE0();
  *(void *)(v7 + 32) = sub_100016BD0();
  *(void *)(v7 + 40) = v9;
  [v8 BOOLValue];
  *(void *)(v7 + 48) = sub_10000E44C();
  *(void *)(v7 + 56) = v10;
  int64_t v11 = sub_10000E154(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v13 = *((void *)v11 + 2);
  unint64_t v12 = *((void *)v11 + 3);
  if (v13 >= v12 >> 1) {
    int64_t v11 = sub_10000E154((char *)(v12 > 1), v13 + 1, 1, v11);
  }
  *((void *)v11 + 2) = v13 + 1;
  *(void *)&v11[8 * v13 + 32] = v7;

  uint64_t v3 = *(void *)(a1 + v2);
  uint64_t v4 = sub_100017000;
  if (v3) {
    goto LABEL_9;
  }
LABEL_39:
  uint64_t v54 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior;
  uint64_t v55 = *(void *)(a1 + OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior);
  if (v55)
  {
    v56 = *(void **)(v55
                   + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions);
    sub_100003E74(&qword_100021D88);
    uint64_t v57 = swift_allocObject();
    long long v77 = *((_OWORD *)v4 + 215);
    *(_OWORD *)(v57 + 16) = v77;
    id v58 = v56;
    sub_100016B90();
    sub_100016AE0();
    *(void *)(v57 + 32) = sub_100016BD0();
    *(void *)(v57 + 40) = v59;
    [v58 BOOLValue];
    *(void *)(v57 + 48) = sub_10000E44C();
    *(void *)(v57 + 56) = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v62 = *((void *)v11 + 2);
    unint64_t v61 = *((void *)v11 + 3);
    if (v62 >= v61 >> 1) {
      int64_t v11 = sub_10000E154((char *)(v61 > 1), v62 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v62 + 1;
    *(void *)&v11[8 * v62 + 32] = v57;

    uint64_t v63 = *(void *)(a1 + v54);
    if (v63)
    {
      v64 = *(void **)(v63
                     + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes);
      sub_100003E74(&qword_100021D88);
      uint64_t v65 = swift_allocObject();
      *(_OWORD *)(v65 + 16) = v77;
      id v66 = v64;
      sub_100016B90();
      sub_100016AE0();
      *(void *)(v65 + 32) = sub_100016BD0();
      *(void *)(v65 + 40) = v67;
      [v66 BOOLValue];
      *(void *)(v65 + 48) = sub_10000E44C();
      *(void *)(v65 + 56) = v68;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v11 = sub_10000E154(0, *((void *)v11 + 2) + 1, 1, v11);
      }
      unint64_t v70 = *((void *)v11 + 2);
      unint64_t v69 = *((void *)v11 + 3);
      if (v70 >= v69 >> 1) {
        int64_t v11 = sub_10000E154((char *)(v69 > 1), v70 + 1, 1, v11);
      }
      *((void *)v11 + 2) = v70 + 1;
      *(void *)&v11[8 * v70 + 32] = v65;
    }
  }
  v71 = self;
  NSString v72 = sub_100016BB0();
  swift_bridgeObjectRelease();
  NSString v73 = sub_100016BB0();
  swift_bridgeObjectRelease();
  sub_100003E74(&qword_100021D78);
  Class isa = sub_100016C60().super.isa;
  swift_bridgeObjectRelease();
  id v75 = [v71 configurationUIWithTitle:v72 description:v73 details:isa];

  return v75;
}

id sub_10000F3C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MathSettingsApplicator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MathSettingsApplicator()
{
  return self;
}

Swift::Int sub_10000F420(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003E74(&qword_100022310);
    uint64_t v3 = sub_100016EE0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100017060();
      swift_bridgeObjectRetain();
      sub_100016C00();
      Swift::Int result = sub_100017070();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_100016FF0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_100016FF0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_10000F5C4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100003E74(&qword_100021F30);
      uint64_t v3 = (void *)sub_100016EE0();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100016FB0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = (char *)(v3 + 7);
  uint64_t v42 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = sub_100016F10();
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = sub_100016D70(v3[5]);
      uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_10000F91C();
        id v18 = *(id *)(v3[6] + 8 * v14);
        char v19 = sub_100016D80();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = sub_100016D80();

          if (v22) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v7[8 * v15] = v17 | v16;
      *(void *)(v3[6] + 8 * v14) = v11;
      uint64_t v23 = v3[2];
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_37;
      }
      v3[2] = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(a1 + 32 + 8 * v25);
    Swift::Int v28 = sub_100016D70(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_10000F91C();
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_100016D80();

      if (v35) {
        goto LABEL_23;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(v3[6] + 8 * v30);
          char v38 = sub_100016D80();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v5 = v42;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v5 = v42;
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_24:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

unint64_t sub_10000F91C()
{
  unint64_t result = qword_100021F38;
  if (!qword_100021F38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100021F38);
  }
  return result;
}

uint64_t static RMModelMathSettingsDeclaration.combineConfigurations(_:)(unint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)type metadata accessor for RMModelMathSettingsDeclaration()) init];
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_100016FB0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)sub_100016F10();
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v7 = v6;
      RMModelMathSettingsDeclaration.combine(withOther:)((uint64_t)v6);
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration()
{
  return self;
}

unint64_t static RMModelMathSettingsDeclaration.registeredIdentifier.getter()
{
  return 0xD000000000000025;
}

uint64_t static RMModelMathSettingsDeclaration.registeredClassName.getter()
{
  return 0x746172616C636544;
}

void sub_10000FB24()
{
  qword_100021F40 = 0x74616C75636C6143;
  *(void *)algn_100021F48 = 0xEA0000000000726FLL;
}

void sub_10000FB4C()
{
  algn_100021F58[7] = -18;
}

uint64_t sub_10000FB7C()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017D70;
  if (qword_100021AA8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_100021F48;
  *(void *)(inited + 32) = qword_100021F40;
  *(void *)(inited + 40) = v1;
  uint64_t v2 = qword_100021AB0;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_100021F58;
  *(void *)(inited + 48) = qword_100021F50;
  *(void *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  Swift::Int v4 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100021F60 = v4;
  return result;
}

id sub_10000FD38()
{
  uint64_t v1 = sub_100016AD0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  Swift::Int v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior] = 0;
  uint64_t v5 = (objc_class *)type metadata accessor for RMModelMathSettingsDeclaration();
  v11.receiver = v0;
  v11.super_class = v5;
  id v6 = objc_msgSendSuper2(&v11, "init");
  NSString v7 = sub_100016BB0();
  [v6 setDeclarationType:v7];

  id v8 = v6;
  sub_100016AC0();
  sub_100016AB0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  NSString v9 = sub_100016BB0();
  swift_bridgeObjectRelease();
  [v8 setDeclarationIdentifier:v9];

  [v8 updateServerToken];
  return v8;
}

unint64_t sub_10000FF68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003E74((uint64_t *)&unk_100022330);
  uint64_t v2 = (void *)sub_100016FC0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  Swift::Int v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000146A0((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

void *static RMModelMathSettingsDeclaration.assetTypes()()
{
  return &_swiftEmptySetSingleton;
}

void *RMModelMathSettingsDeclaration.assetReferences()()
{
  return &_swiftEmptyArrayStorage;
}

id RMModelMathSettingsDeclaration.loadPayload(from:serializationType:)(uint64_t a1, __int16 a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = swift_bridgeObjectRetain();
  v22[1] = (id)sub_100004F70(v5);
  if (qword_100021AB8 != -1) {
    swift_once();
  }
  sub_100014800(qword_100021F60);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v2 setUnknownPayloadKeys:isa];

  v7.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021AA8 != -1) {
    swift_once();
  }
  NSString v8 = sub_100016BB0();
  NSString v9 = sub_100016BB0();
  type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
  v22[0] = 0;
  LOWORD(v20) = a2;
  unsigned int v10 = [v3 loadDictionaryFromDictionary:v7.super.isa usingKey:v8 forKeyPath:v9 classType:swift_getObjCClassFromMetadata() isRequired:0 defaultValue:0 serializationType:v20 error:v22];

  id v11 = v22[0];
  if (v10)
  {
    id v12 = v22[0];
    v13.super.Class isa = sub_100016B50().super.isa;
    if (qword_100021AB0 != -1) {
      swift_once();
    }
    NSString v14 = sub_100016BB0();
    NSString v15 = sub_100016BB0();
    type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v22[0] = 0;
    LOWORD(v21) = a2;
    unsigned int v17 = [v3 loadDictionaryFromDictionary:v13.super.isa usingKey:v14 forKeyPath:v15 classType:ObjCClassFromMetadata isRequired:0 defaultValue:0 serializationType:v21 error:v22];

    id v11 = v22[0];
    if (v17) {
      return v22[0];
    }
  }
  id v19 = v11;
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t RMModelMathSettingsDeclaration.serializePayload(with:)(__int16 a1)
{
  uint64_t v2 = v1;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v4 = sub_100016D30();
  if (qword_100021AA8 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  id v6 = *(void **)&v1[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator];
  uint64_t v7 = swift_allocObject();
  *(_WORD *)(v7 + 16) = a1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100016A08;
  *(void *)(v8 + 24) = v7;
  uint64_t v23 = sub_1000152A4;
  uint64_t v24 = v8;
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_100010878;
  char v22 = &unk_10001CD10;
  NSString v9 = _Block_copy(&v19);
  swift_retain();
  id v10 = v6;
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v5 value:v10 dictSerializer:v9 isRequired:0 defaultValue:0];

  _Block_release(v9);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v5)
  {
    __break(1u);
  }
  else if (qword_100021AB0 == -1)
  {
    goto LABEL_5;
  }
  swift_once();
LABEL_5:
  NSString v11 = sub_100016BB0();
  id v12 = *(void **)&v2[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior];
  uint64_t v13 = swift_allocObject();
  *(_WORD *)(v13 + 16) = a1;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_100016A08;
  *(void *)(v14 + 24) = v13;
  uint64_t v23 = sub_100016A3C;
  uint64_t v24 = v14;
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_100010878;
  char v22 = &unk_10001CD88;
  NSString v15 = _Block_copy(&v19);
  id v16 = v12;
  swift_retain();
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v11 value:v16 dictSerializer:v15 isRequired:0 defaultValue:0];

  _Block_release(v15);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    return ~(v4 >> 1) & 0x4000000000000000 | v4;
  }
  return result;
}

Class sub_100010878(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();

  v4.super.Class isa = sub_100016B50().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

void RMModelMathSettingsDeclaration.combine(withOther:)(uint64_t a1)
{
  id v3 = self;
  uint64_t v4 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator;
  if ([v3 combineDictionary:*(void *)(v1 + OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator) other:*(void *)(a1 + OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator)])
  {
    sub_100016DB0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_100015304((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
    int v5 = swift_dynamicCast();
    uint64_t v6 = v12;
    if (!v5) {
      uint64_t v6 = 0;
    }
  }
  else
  {
    sub_10001536C((uint64_t)v15);
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void **)(v1 + v4);
  *(void *)(v1 + v4) = v6;

  uint64_t v8 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior;
  if ([v3 combineDictionary:*(void *)(v1+ OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior) other:*(void *)(a1+ OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior)])
  {
    sub_100016DB0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_100015304((uint64_t)&v13, (uint64_t)v15);
  if (v16)
  {
    type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior();
    int v9 = swift_dynamicCast();
    uint64_t v10 = v12;
    if (!v9) {
      uint64_t v10 = 0;
    }
  }
  else
  {
    sub_10001536C((uint64_t)v15);
    uint64_t v10 = 0;
  }
  NSString v11 = *(void **)(v1 + v8);
  *(void *)(v1 + v8) = v10;
}

void RMModelMathSettingsDeclaration.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  v16.receiver = v3;
  v16.super_class = (Class)type metadata accessor for RMModelMathSettingsDeclaration();
  objc_msgSendSuper2(&v16, "copyWithZone:", a1);
  sub_100016DB0();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v7 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator;
  uint64_t v8 = *(void **)&v3[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator];
  if (v8)
  {
    [v8 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
    if (swift_dynamicCast()) {
      uint64_t v9 = v15;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v7 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void **)(v15 + v7);
  *(void *)(v15 + v7) = v9;

  uint64_t v11 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior;
  uint64_t v12 = *(void **)&v3[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior];
  if (v12)
  {
    [v12 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior();
    if (swift_dynamicCast()) {
      uint64_t v13 = v15;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v11 = OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior;
  }
  else
  {
    uint64_t v13 = 0;
  }
  long long v14 = *(void **)(v15 + v11);
  *(void *)(v15 + v11) = v13;

  a2[3] = ObjectType;
  *a2 = v15;
}

void sub_100010C54()
{
  qword_100021F68 = 0x646F4D6369736142;
  unk_100021F70 = 0xE900000000000065;
}

void sub_100010C7C()
{
  unk_100021F87 = -18;
}

void sub_100010CAC()
{
  unk_100021F97 = -18;
}

void sub_100010CDC()
{
  unk_100021FA6 = -4864;
}

void sub_100010D0C()
{
  qword_100021FA8 = 0x646F4D7475706E49;
  unk_100021FB0 = 0xEA00000000007365;
}

uint64_t sub_100010D34()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017DA0;
  if (qword_100021AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_100021F70;
  *(void *)(inited + 32) = qword_100021F68;
  *(void *)(inited + 40) = v1;
  uint64_t v2 = qword_100021AC8;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = unk_100021F80;
  *(void *)(inited + 48) = qword_100021F78;
  *(void *)(inited + 56) = v3;
  uint64_t v4 = qword_100021AD0;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = unk_100021F90;
  *(void *)(inited + 64) = qword_100021F88;
  *(void *)(inited + 72) = v5;
  uint64_t v6 = qword_100021AD8;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = unk_100021FA0;
  *(void *)(inited + 80) = qword_100021F98;
  *(void *)(inited + 88) = v7;
  uint64_t v8 = qword_100021AE0;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = unk_100021FB0;
  *(void *)(inited + 96) = qword_100021FA8;
  *(void *)(inited + 104) = v9;
  swift_bridgeObjectRetain();
  Swift::Int v10 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100021FB8 = v10;
  return result;
}

id sub_100011140(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id RMModelMathSettingsDeclaration.Calculator.load(from:serializationType:)(uint64_t a1, __int16 a2)
{
  id v3 = v2;
  uint64_t v5 = swift_bridgeObjectRetain();
  v43[1] = (id)sub_100004F70(v5);
  if (qword_100021AE8 != -1) {
    swift_once();
  }
  sub_100014800(qword_100021FB8);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v2 setUnknownPayloadKeys:isa];

  v7.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021AC0 != -1) {
    swift_once();
  }
  NSString v8 = sub_100016BB0();
  NSString v9 = sub_100016BB0();
  type metadata accessor for RMModelMathSettingsDeclaration.CalculatorBasicMode();
  v43[0] = 0;
  LOWORD(v38) = a2;
  unsigned int v10 = [v3 loadDictionaryFromDictionary:v7.super.isa usingKey:v8 forKeyPath:v9 classType:swift_getObjCClassFromMetadata() isRequired:0 defaultValue:0 serializationType:v38 error:v43];

  id v11 = v43[0];
  if (v10)
  {
    id v12 = v43[0];
    v13.super.Class isa = sub_100016B50().super.isa;
    if (qword_100021AC8 != -1) {
      swift_once();
    }
    NSString v14 = sub_100016BB0();
    NSString v15 = sub_100016BB0();
    type metadata accessor for RMModelMathSettingsDeclaration.CalculatorScientificMode();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v43[0] = 0;
    LOWORD(v39) = a2;
    unsigned int v17 = [v3 loadDictionaryFromDictionary:v13.super.isa usingKey:v14 forKeyPath:v15 classType:ObjCClassFromMetadata isRequired:0 defaultValue:0 serializationType:v39 error:v43];

    id v11 = v43[0];
    if (v17)
    {
      id v18 = v43[0];
      v19.super.Class isa = sub_100016B50().super.isa;
      if (qword_100021AD0 != -1) {
        swift_once();
      }
      NSString v20 = sub_100016BB0();
      NSString v21 = sub_100016BB0();
      type metadata accessor for RMModelMathSettingsDeclaration.CalculatorProgrammerMode();
      uint64_t v22 = swift_getObjCClassFromMetadata();
      v43[0] = 0;
      LOWORD(v40) = a2;
      unsigned int v23 = [v3 loadDictionaryFromDictionary:v19.super.isa usingKey:v20 forKeyPath:v21 classType:v22 isRequired:0 defaultValue:0 serializationType:v40 error:v43];

      id v11 = v43[0];
      if (v23)
      {
        id v24 = v43[0];
        v25.super.Class isa = sub_100016B50().super.isa;
        if (qword_100021AD8 != -1) {
          swift_once();
        }
        NSString v26 = sub_100016BB0();
        NSString v27 = sub_100016BB0();
        type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode();
        uint64_t v28 = swift_getObjCClassFromMetadata();
        v43[0] = 0;
        LOWORD(v41) = a2;
        unsigned int v29 = [v3 loadDictionaryFromDictionary:v25.super.isa usingKey:v26 forKeyPath:v27 classType:v28 isRequired:0 defaultValue:0 serializationType:v41 error:v43];

        id v11 = v43[0];
        if (v29)
        {
          id v30 = v43[0];
          v31.super.Class isa = sub_100016B50().super.isa;
          if (qword_100021AE0 != -1) {
            swift_once();
          }
          NSString v32 = sub_100016BB0();
          NSString v33 = sub_100016BB0();
          type metadata accessor for RMModelMathSettingsDeclaration.CalculatorInputModes();
          uint64_t v34 = swift_getObjCClassFromMetadata();
          v43[0] = 0;
          LOWORD(v42) = a2;
          unsigned int v35 = [v3 loadDictionaryFromDictionary:v31.super.isa usingKey:v32 forKeyPath:v33 classType:v34 isRequired:0 defaultValue:0 serializationType:v42 error:v43];

          id v11 = v43[0];
          if (v35) {
            return v43[0];
          }
        }
      }
    }
  }
  id v37 = v11;
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t sub_1000117C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = sub_100016B70();
  id v10 = a1;
  a6(v9, a4);
  swift_bridgeObjectRelease();

  return 1;
}

uint64_t RMModelMathSettingsDeclaration.Calculator.serialize(with:)(__int16 a1)
{
  uint64_t v2 = v1;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v4 = sub_100016D30();
  if (qword_100021AC0 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode];
  uint64_t v7 = swift_allocObject();
  *(_WORD *)(v7 + 16) = a1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100016A08;
  *(void *)(v8 + 24) = v7;
  uint64_t v40 = sub_100016A3C;
  uint64_t v41 = v8;
  aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_100010878;
  uint64_t v39 = &unk_10001CE00;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_retain();
  id v10 = v6;
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v5 value:v10 dictSerializer:v9 isRequired:0 defaultValue:0];

  _Block_release(v9);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v5)
  {
    __break(1u);
  }
  else if (qword_100021AC8 == -1)
  {
    goto LABEL_5;
  }
  swift_once();
LABEL_5:
  NSString v11 = sub_100016BB0();
  id v12 = *(void **)&v2[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode];
  uint64_t v13 = swift_allocObject();
  *(_WORD *)(v13 + 16) = a1;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_1000154B0;
  *(void *)(v14 + 24) = v13;
  uint64_t v40 = sub_100016A3C;
  uint64_t v41 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_100010878;
  uint64_t v39 = &unk_10001CE78;
  NSString v15 = _Block_copy(&aBlock);
  swift_retain();
  id v16 = v12;
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v11 value:v16 dictSerializer:v15 isRequired:0 defaultValue:0];

  _Block_release(v15);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v11)
  {
    __break(1u);
  }
  else if (qword_100021AD0 == -1)
  {
    goto LABEL_7;
  }
  swift_once();
LABEL_7:
  NSString v17 = sub_100016BB0();
  id v18 = *(void **)&v2[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode];
  uint64_t v19 = swift_allocObject();
  *(_WORD *)(v19 + 16) = a1;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_100016A08;
  *(void *)(v20 + 24) = v19;
  uint64_t v40 = sub_100016A3C;
  uint64_t v41 = v20;
  aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_100010878;
  uint64_t v39 = &unk_10001CEF0;
  NSString v21 = _Block_copy(&aBlock);
  swift_retain();
  id v22 = v18;
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v17 value:v22 dictSerializer:v21 isRequired:0 defaultValue:0];

  _Block_release(v21);
  LOBYTE(v22) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v22)
  {
    __break(1u);
  }
  else if (qword_100021AD8 == -1)
  {
    goto LABEL_9;
  }
  swift_once();
LABEL_9:
  NSString v23 = sub_100016BB0();
  id v24 = *(void **)&v2[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode];
  uint64_t v25 = swift_allocObject();
  *(_WORD *)(v25 + 16) = a1;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_100016A08;
  *(void *)(v26 + 24) = v25;
  uint64_t v40 = sub_100016A3C;
  uint64_t v41 = v26;
  aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_100010878;
  uint64_t v39 = &unk_10001CF68;
  NSString v27 = _Block_copy(&aBlock);
  swift_retain();
  id v28 = v24;
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v23 value:v28 dictSerializer:v27 isRequired:0 defaultValue:0];

  _Block_release(v27);
  LOBYTE(v27) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v27)
  {
    __break(1u);
  }
  else if (qword_100021AE0 == -1)
  {
    goto LABEL_11;
  }
  swift_once();
LABEL_11:
  NSString v29 = sub_100016BB0();
  id v30 = *(void **)&v2[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes];
  uint64_t v31 = swift_allocObject();
  *(_WORD *)(v31 + 16) = a1;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_100016A08;
  *(void *)(v32 + 24) = v31;
  uint64_t v40 = sub_100016A3C;
  uint64_t v41 = v32;
  aBlock = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256;
  uint64_t v38 = sub_100010878;
  uint64_t v39 = &unk_10001CFE0;
  NSString v33 = _Block_copy(&aBlock);
  id v34 = v30;
  swift_retain();
  swift_release();
  [v2 serializeDictionaryIntoDictionary:v4 usingKey:v29 value:v34 dictSerializer:v33 isRequired:0 defaultValue:0];

  _Block_release(v33);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v33)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return ~(v4 >> 1) & 0x4000000000000000 | v4;
  }
  return result;
}

uint64_t sub_1000120CC(void *a1, __int16 a2)
{
  id v2 = [a1 serializeWithType:a2];
  uint64_t v3 = sub_100016B70();

  return v3;
}

Class sub_10001214C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v6 = a1;
  a4(a3);

  v7.super.Class isa = sub_100016B50().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

void RMModelMathSettingsDeclaration.Calculator.combine(withOther:)()
{
  type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
  uint64_t v1 = swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = self;
    uint64_t v4 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode;
    uint64_t v5 = *(void *)(v0
                   + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode);
    uint64_t v6 = *(void *)(v2
                   + OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode);
    swift_unknownObjectRetain();
    if ([v3 combineDictionary:v5 other:v6])
    {
      sub_100016DB0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_100015304((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      type metadata accessor for RMModelMathSettingsDeclaration.CalculatorBasicMode();
      int v7 = swift_dynamicCast();
      uint64_t v8 = v26;
      if (!v7) {
        uint64_t v8 = 0;
      }
    }
    else
    {
      sub_10001536C((uint64_t)v29);
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void **)(v0 + v4);
    *(void *)(v0 + v4) = v8;

    uint64_t v10 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode;
    if ([v3 combineDictionary:*(void *)(v0+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode) other:*(void *)(v2+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode)])
    {
      sub_100016DB0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_100015304((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      type metadata accessor for RMModelMathSettingsDeclaration.CalculatorScientificMode();
      int v11 = swift_dynamicCast();
      uint64_t v12 = v26;
      if (!v11) {
        uint64_t v12 = 0;
      }
    }
    else
    {
      sub_10001536C((uint64_t)v29);
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void **)(v0 + v10);
    *(void *)(v0 + v10) = v12;

    uint64_t v14 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode;
    if ([v3 combineDictionary:*(void *)(v0+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode) other:*(void *)(v2+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode)])
    {
      sub_100016DB0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_100015304((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      type metadata accessor for RMModelMathSettingsDeclaration.CalculatorProgrammerMode();
      int v15 = swift_dynamicCast();
      uint64_t v16 = v26;
      if (!v15) {
        uint64_t v16 = 0;
      }
    }
    else
    {
      sub_10001536C((uint64_t)v29);
      uint64_t v16 = 0;
    }
    NSString v17 = *(void **)(v0 + v14);
    *(void *)(v0 + v14) = v16;

    uint64_t v18 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode;
    if ([v3 combineDictionary:*(void *)(v0+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode) other:*(void *)(v2+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode)])
    {
      sub_100016DB0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_100015304((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode();
      int v19 = swift_dynamicCast();
      uint64_t v20 = v26;
      if (!v19) {
        uint64_t v20 = 0;
      }
    }
    else
    {
      sub_10001536C((uint64_t)v29);
      uint64_t v20 = 0;
    }
    NSString v21 = *(void **)(v0 + v18);
    *(void *)(v0 + v18) = v20;

    uint64_t v22 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes;
    if ([v3 combineDictionary:*(void *)(v0+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes) other:*(void *)(v2+ OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes)])
    {
      sub_100016DB0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    sub_100015304((uint64_t)&v27, (uint64_t)v29);
    if (v30)
    {
      type metadata accessor for RMModelMathSettingsDeclaration.CalculatorInputModes();
      int v23 = swift_dynamicCast();
      uint64_t v24 = v26;
      if (!v23) {
        uint64_t v24 = 0;
      }
    }
    else
    {
      sub_10001536C((uint64_t)v29);
      uint64_t v24 = 0;
    }
    uint64_t v25 = *(void **)(v0 + v22);
    *(void *)(v0 + v22) = v24;
    swift_unknownObjectRelease();
  }
}

void RMModelMathSettingsDeclaration.Calculator.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  v28.receiver = v3;
  v28.super_class = (Class)type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
  objc_msgSendSuper2(&v28, "copyWithZone:", a1);
  sub_100016DB0();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v7 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode;
  uint64_t v8 = *(void **)&v3[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode];
  if (v8)
  {
    [v8 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.CalculatorBasicMode();
    if (swift_dynamicCast()) {
      uint64_t v9 = v27;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v7 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void **)(v27 + v7);
  *(void *)(v27 + v7) = v9;

  uint64_t v11 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode;
  uint64_t v12 = *(void **)&v3[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode];
  if (v12)
  {
    [v12 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.CalculatorScientificMode();
    if (swift_dynamicCast()) {
      uint64_t v13 = v27;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v11 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(void **)(v27 + v11);
  *(void *)(v27 + v11) = v13;

  uint64_t v15 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode;
  uint64_t v16 = *(void **)&v3[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode];
  if (v16)
  {
    [v16 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.CalculatorProgrammerMode();
    if (swift_dynamicCast()) {
      uint64_t v17 = v27;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v15 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode;
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(void **)(v27 + v15);
  *(void *)(v27 + v15) = v17;

  uint64_t v19 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode;
  uint64_t v20 = *(void **)&v3[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode];
  if (v20)
  {
    [v20 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode();
    if (swift_dynamicCast()) {
      uint64_t v21 = v27;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v19 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode;
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v22 = *(void **)(v27 + v19);
  *(void *)(v27 + v19) = v21;

  uint64_t v23 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes;
  uint64_t v24 = *(void **)&v3[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes];
  if (v24)
  {
    [v24 copy];
    sub_100016DB0();
    swift_unknownObjectRelease();
    type metadata accessor for RMModelMathSettingsDeclaration.CalculatorInputModes();
    if (swift_dynamicCast()) {
      uint64_t v25 = v27;
    }
    else {
      uint64_t v25 = 0;
    }
    uint64_t v23 = OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes;
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v26 = *(void **)(v27 + v23);
  *(void *)(v27 + v23) = v25;

  a2[3] = ObjectType;
  *a2 = v27;
}

uint64_t sub_1000128A0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *__return_ptr, uint64_t))
{
  id v6 = a1;
  a4(v9, a3);

  sub_10001695C(v9, v9[3]);
  uint64_t v7 = sub_100016FE0();
  sub_10000D8EC((uint64_t)v9);
  return v7;
}

id RMModelMathSettingsDeclaration.Calculator.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.Calculator);
}

void sub_1000129B0()
{
  *(_WORD *)&algn_100021FC8[6] = -4864;
}

uint64_t sub_1000129E0()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017BB0;
  if (qword_100021AF0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_100021FC8;
  *(void *)(inited + 32) = qword_100021FC0;
  *(void *)(inited + 40) = v1;
  swift_bridgeObjectRetain();
  Swift::Int v2 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100021FD0 = v2;
  return result;
}

id RMModelMathSettingsDeclaration.CalculatorBasicMode.load(from:serializationType:)()
{
  return sub_10001553C();
}

void RMModelMathSettingsDeclaration.CalculatorBasicMode.combine(withOther:)(uint64_t a1)
{
}

void sub_100012BD0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

void RMModelMathSettingsDeclaration.CalculatorBasicMode.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

id RMModelMathSettingsDeclaration.CalculatorBasicMode.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.CalculatorBasicMode);
}

void sub_100012CA8()
{
  qword_100021FD8 = 0x64656C62616E45;
  unk_100021FE0 = 0xE700000000000000;
}

uint64_t sub_100012CCC()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017BB0;
  if (qword_100021B00 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_100021FE0;
  *(void *)(inited + 32) = qword_100021FD8;
  *(void *)(inited + 40) = v1;
  swift_bridgeObjectRetain();
  Swift::Int v2 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100021FE8 = v2;
  return result;
}

id sub_100012E10(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  sub_10000D85C(0, (unint64_t *)&qword_100021F38);
  id v7 = a1;
  *(NSNumber *)&v7[*a3] = sub_100016D60(0);

  v9.receiver = v7;
  v9.super_class = (Class)a4();
  return objc_msgSendSuper2(&v9, "init");
}

id sub_100012EC8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void))
{
  sub_10000D85C(0, (unint64_t *)&qword_100021F38);
  id v9 = a3;
  uint64_t v10 = a1;
  *(NSNumber *)&v10[*a4] = sub_100016D60(0);

  v13.receiver = v10;
  v13.super_class = (Class)a5();
  id v11 = objc_msgSendSuper2(&v13, "initWithCoder:", v9);

  return v11;
}

id RMModelMathSettingsDeclaration.CalculatorScientificMode.load(from:serializationType:)()
{
  return sub_100015830();
}

uint64_t sub_100012FAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v8 = sub_100016B70();
  id v9 = a1;
  a6(v8);
  swift_bridgeObjectRelease();

  return 1;
}

void RMModelMathSettingsDeclaration.CalculatorScientificMode.combine(withOther:)(uint64_t a1)
{
}

void RMModelMathSettingsDeclaration.CalculatorScientificMode.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

id RMModelMathSettingsDeclaration.CalculatorScientificMode.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.CalculatorScientificMode);
}

void sub_100013130()
{
  qword_100021FF0 = 0x64656C62616E45;
  *(void *)algn_100021FF8 = 0xE700000000000000;
}

uint64_t sub_100013154()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017BB0;
  if (qword_100021B10 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_100021FF8;
  *(void *)(inited + 32) = qword_100021FF0;
  *(void *)(inited + 40) = v1;
  swift_bridgeObjectRetain();
  Swift::Int v2 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100022000 = v2;
  return result;
}

id RMModelMathSettingsDeclaration.CalculatorProgrammerMode.load(from:serializationType:)()
{
  return sub_100015B2C();
}

void RMModelMathSettingsDeclaration.CalculatorProgrammerMode.combine(withOther:)(uint64_t a1)
{
}

void RMModelMathSettingsDeclaration.CalculatorProgrammerMode.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

id RMModelMathSettingsDeclaration.CalculatorProgrammerMode.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.CalculatorProgrammerMode);
}

void sub_1000133A4()
{
  qword_100022008 = 0x64656C62616E45;
  unk_100022010 = 0xE700000000000000;
}

uint64_t sub_1000133C8()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017BB0;
  if (qword_100021B20 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_100022010;
  *(void *)(inited + 32) = qword_100022008;
  *(void *)(inited + 40) = v1;
  swift_bridgeObjectRetain();
  Swift::Int v2 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100022018 = v2;
  return result;
}

id RMModelMathSettingsDeclaration.CalculatorMathNotesMode.load(from:serializationType:)()
{
  return sub_100015E28();
}

void RMModelMathSettingsDeclaration.CalculatorMathNotesMode.combine(withOther:)(uint64_t a1)
{
}

void sub_1000135A0(uint64_t a1, void (*a2)(void), uint64_t *a3, SEL *a4)
{
  a2();
  uint64_t v7 = swift_dynamicCastClass();
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = self;
    uint64_t v10 = *a3;
    uint64_t v11 = *(void *)(v4 + *a3);
    uint64_t v12 = *(void *)(v8 + v10);
    swift_unknownObjectRetain();
    id v13 = objc_msgSend(v9, *a4, v11, v12);
    if (v13)
    {
      id v14 = *(id *)(v4 + v10);
      *(void *)(v4 + v10) = v13;
      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

void RMModelMathSettingsDeclaration.CalculatorMathNotesMode.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_1000136C8(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  v14.receiver = v4;
  v14.super_class = (Class)a2();
  objc_msgSendSuper2(&v14, "copyWithZone:", a1);
  sub_100016DB0();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v10 = *(void **)&v4[*a3];
  uint64_t v11 = *(void **)(v13 + *a3);
  *(void *)(v13 + *a3) = v10;
  id v12 = v10;

  a4[3] = ObjectType;
  *a4 = v13;
}

id RMModelMathSettingsDeclaration.CalculatorMathNotesMode.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode);
}

void sub_1000137D0()
{
  algn_100022028[7] = -18;
}

void sub_100013800()
{
  qword_100022030 = 5132370;
  *(void *)algn_100022038 = 0xE300000000000000;
}

uint64_t sub_10001381C()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017D70;
  if (qword_100021B30 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)algn_100022028;
  *(void *)(inited + 32) = qword_100022020;
  *(void *)(inited + 40) = v1;
  uint64_t v2 = qword_100021B38;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)algn_100022038;
  *(void *)(inited + 48) = qword_100022030;
  *(void *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  Swift::Int v4 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100022040 = v4;
  return result;
}

id RMModelMathSettingsDeclaration.CalculatorInputModes.load(from:serializationType:)()
{
  return sub_100016124();
}

void RMModelMathSettingsDeclaration.CalculatorInputModes.combine(withOther:)(uint64_t a1)
{
}

void RMModelMathSettingsDeclaration.CalculatorInputModes.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

id RMModelMathSettingsDeclaration.CalculatorInputModes.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.CalculatorInputModes);
}

void sub_100013B58()
{
  qword_100022048 = 0x65746F4E6874614DLL;
  unk_100022050 = 0xE900000000000073;
}

uint64_t sub_100013B80()
{
  sub_100003E74(&qword_100021D88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017D70;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000100018F90;
  if (qword_100021B48 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_100022050;
  *(void *)(inited + 48) = qword_100022048;
  *(void *)(inited + 56) = v1;
  swift_bridgeObjectRetain();
  Swift::Int v2 = sub_10000F420(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_100022058 = v2;
  return result;
}

id sub_100013D40(void *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void))
{
  sub_10000D85C(0, (unint64_t *)&qword_100021F38);
  id v9 = a1;
  *(NSNumber *)&v9[*a3] = sub_100016D60(0);
  *(NSNumber *)&v9[*a4] = sub_100016D60(0);

  v11.receiver = v9;
  v11.super_class = (Class)a5();
  return objc_msgSendSuper2(&v11, "init");
}

id sub_100013E10(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t (*a6)(void))
{
  sub_10000D85C(0, (unint64_t *)&qword_100021F38);
  id v11 = a3;
  id v12 = a1;
  *(NSNumber *)&v12[*a4] = sub_100016D60(0);
  *(NSNumber *)&v12[*a5] = sub_100016D60(0);

  v15.receiver = v12;
  v15.super_class = (Class)a6();
  id v13 = objc_msgSendSuper2(&v15, "initWithCoder:", v11);

  return v13;
}

id RMModelMathSettingsDeclaration.SystemBehavior.load(from:serializationType:)()
{
  return sub_100016558();
}

Class sub_100013F20(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  id v5 = a1;
  a4();

  v6.super.Class isa = sub_100016B50().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

void RMModelMathSettingsDeclaration.SystemBehavior.combine(withOther:)(uint64_t a1)
{
}

void sub_100013FC4(uint64_t a1, void (*a2)(void), uint64_t *a3, uint64_t *a4)
{
  a2();
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  id v9 = self;
  uint64_t v10 = *a3;
  uint64_t v11 = *(void *)(v4 + *a3);
  uint64_t v12 = *(void *)(v8 + v10);
  swift_unknownObjectRetain();
  id v13 = [v9 combineBooleanAnd:v11 other:v12];
  if (!v13)
  {
    __break(1u);
    goto LABEL_9;
  }
  objc_super v14 = *(void **)(v4 + v10);
  *(void *)(v4 + v10) = v13;

  uint64_t v15 = *a4;
  id v16 = [v9 combineBooleanAnd:*(void *)(v4 + v15) other:*(void *)(v8 + v15)];
  if (!v16)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v17 = *(id *)(v4 + v15);
  *(void *)(v4 + v15) = v16;
  swift_unknownObjectRelease();
}

void RMModelMathSettingsDeclaration.SystemBehavior.copy(with:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_100014138(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, void *a5@<X8>)
{
  id v9 = v5;
  uint64_t ObjectType = swift_getObjectType();
  v22.receiver = v9;
  v22.super_class = (Class)a2();
  objc_msgSendSuper2(&v22, "copyWithZone:", a1);
  sub_100016DB0();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v13 = *a3;
  objc_super v14 = *(void **)&v9[*a3];
  uint64_t v15 = *(void **)(v21 + *a3);
  *(void *)(v21 + v13) = v14;
  id v16 = v14;

  uint64_t v17 = *a4;
  uint64_t v18 = *(void **)&v9[*a4];
  uint64_t v19 = *(void **)(v21 + *a4);
  *(void *)(v21 + v17) = v18;
  id v20 = v18;

  a5[3] = ObjectType;
  *a5 = v21;
}

id RMModelMathSettingsDeclaration.SystemBehavior.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior);
}

id RMModelMathSettingsDeclaration.__deallocating_deinit()
{
  return sub_1000142BC(type metadata accessor for RMModelMathSettingsDeclaration);
}

id sub_1000142BC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void *sub_100014340()
{
  uint64_t v1 = v0;
  sub_100003E74(&qword_100022310);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100016EB0();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
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

id sub_1000144F4()
{
  uint64_t v1 = v0;
  sub_100003E74(&qword_100021D90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100016EB0();
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
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
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

unint64_t sub_1000146A0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100016D70(*(void *)(v2 + 40));

  return sub_1000146E4(a1, v4);
}

unint64_t sub_1000146E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_10000D85C(0, (unint64_t *)&qword_100021F38);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100016D80();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100016D80();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100014800(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  id result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1000149A8(v12, v13);
    swift_bridgeObjectRelease();
    id result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

uint64_t sub_1000149A8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_100017060();
  swift_bridgeObjectRetain();
  sub_100016C00();
  Swift::Int v6 = sub_100017070();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_100016FF0() & 1) == 0)
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
    while (!v17 && (sub_100016FF0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100014340();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100014B38(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_100014B38(unint64_t result)
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
    uint64_t v8 = sub_100016DC0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_100017060();
        swift_bridgeObjectRetain();
        sub_100016C00();
        Swift::Int v10 = sub_100017070();
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
    id result = swift_release();
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

unint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC11supportedOSSDySo8NSNumberCSayShyAFGGGyFZ_0()
{
  sub_100003E74(&qword_100022318);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100017DB0;
  *(void *)(inited + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:0];
  sub_100003E74(&qword_100022320);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100017D70;
  sub_100003E74(&qword_100022328);
  unint64_t v2 = swift_initStackObject();
  *(_OWORD *)(v2 + 16) = xmmword_100017DC0;
  *(void *)(v2 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:0];
  sub_100016C80();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_10000F5C4(v2);
    uint64_t v4 = v3;
    goto LABEL_6;
  }
  uint64_t v4 = &_swiftEmptySetSingleton;
LABEL_6:
  swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v4;
  unint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_100017DC0;
  *(void *)(v6 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:3];
  sub_100016C80();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_8;
    }
  }
  else if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_8:
    sub_10000F5C4(v6);
    uint64_t v8 = v7;
    goto LABEL_11;
  }
  uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_11:
  swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = v8;
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100017D70;
  unint64_t v11 = swift_initStackObject();
  *(_OWORD *)(v11 + 16) = xmmword_100017DC0;
  *(void *)(v11 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  sub_100016C80();
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_13;
    }
  }
  else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    sub_10000F5C4(v11);
    uint64_t v13 = v12;
    goto LABEL_16;
  }
  uint64_t v13 = &_swiftEmptySetSingleton;
LABEL_16:
  swift_bridgeObjectRelease();
  *(void *)(v10 + 32) = v13;
  unint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_100017DC0;
  *(void *)(v15 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:3];
  sub_100016C80();
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_18;
    }
  }
  else if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_18:
    sub_10000F5C4(v15);
    uint64_t v17 = v16;
    goto LABEL_21;
  }
  uint64_t v17 = &_swiftEmptySetSingleton;
LABEL_21:
  swift_bridgeObjectRelease();
  *(void *)(v10 + 40) = v17;
  *(void *)(inited + 56) = v10;
  *(void *)(inited + 64) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_100017D70;
  unint64_t v20 = swift_initStackObject();
  *(_OWORD *)(v20 + 16) = xmmword_100017DD0;
  *(void *)(v20 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:0];
  *(void *)(v20 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  sub_100016C80();
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_23;
    }
  }
  else if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_23:
    sub_10000F5C4(v20);
    int64_t v22 = v21;
    goto LABEL_26;
  }
  int64_t v22 = &_swiftEmptySetSingleton;
LABEL_26:
  swift_bridgeObjectRelease();
  *(void *)(v19 + 32) = v22;
  unint64_t v24 = swift_initStackObject();
  *(_OWORD *)(v24 + 16) = xmmword_100017DC0;
  *(void *)(v24 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:3];
  sub_100016C80();
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100016FB0();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_28;
    }
LABEL_30:
    uint64_t v26 = &_swiftEmptySetSingleton;
    goto LABEL_31;
  }
  if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_30;
  }
LABEL_28:
  sub_10000F5C4(v24);
  uint64_t v26 = v25;
LABEL_31:
  swift_bridgeObjectRelease();
  *(void *)(v19 + 40) = v26;
  *(void *)(inited + 72) = v19;
  return sub_10000FF68(inited);
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.Calculator()
{
  return self;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior()
{
  return self;
}

uint64_t sub_100015284()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_100015294()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000152A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000152CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000152DC()
{
  return swift_release();
}

uint64_t sub_1000152E4()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_1000152F4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100015304(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003E74(&qword_100022078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001536C(uint64_t a1)
{
  uint64_t v2 = sub_100003E74(&qword_100022078);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.CalculatorBasicMode()
{
  return self;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.CalculatorScientificMode()
{
  return self;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.CalculatorProgrammerMode()
{
  return self;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode()
{
  return self;
}

uint64_t type metadata accessor for RMModelMathSettingsDeclaration.CalculatorInputModes()
{
  return self;
}

uint64_t sub_100015480()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_100015490()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000154A0()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_1000154B0(void *a1)
{
  return sub_1000120CC(a1, *(_WORD *)(v1 + 16));
}

uint64_t sub_1000154CC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000154DC()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_1000154EC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000154FC()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_10001550C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001551C()
{
  return _swift_deallocObject(v0, 18, 7);
}

uint64_t sub_10001552C()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10001553C()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  v10[1] = (id)sub_100004F70(v2);
  if (qword_100021AF8 != -1) {
    swift_once();
  }
  sub_100014800(qword_100021FD0);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setUnknownPayloadKeys:isa];

  v4.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021AF0 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  NSString v6 = sub_100016BB0();
  v10[0] = 0;
  unsigned int v7 = [v1 loadBooleanFromDictionary:v4.super.isa usingKey:v5 forKeyPath:v6 isRequired:1 defaultValue:0 error:v10];

  if (v7) {
    return v10[0];
  }
  id v9 = v10[0];
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC19CalculatorBasicModeC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0()
{
  uint64_t v1 = v0;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v2 = sub_100016D30();
  if (qword_100021AF0 != -1) {
    swift_once();
  }
  NSString v3 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v3 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration19CalculatorBasicMode_payloadAddSquareRoot] isRequired:1 defaultValue:0];

  return ~(v2 >> 1) & 0x4000000000000000 | v2;
}

id sub_100015830()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  v10[1] = (id)sub_100004F70(v2);
  if (qword_100021B08 != -1) {
    swift_once();
  }
  sub_100014800(qword_100021FE8);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setUnknownPayloadKeys:isa];

  v4.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021B00 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  NSString v6 = sub_100016BB0();
  v10[0] = 0;
  unsigned int v7 = [v1 loadBooleanFromDictionary:v4.super.isa usingKey:v5 forKeyPath:v6 isRequired:1 defaultValue:0 error:v10];

  if (v7) {
    return v10[0];
  }
  id v9 = v10[0];
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC24CalculatorScientificModeC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0()
{
  uint64_t v1 = v0;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v2 = sub_100016D30();
  if (qword_100021B00 != -1) {
    swift_once();
  }
  NSString v3 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v3 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorScientificMode_payloadEnabled] isRequired:1 defaultValue:0];

  return ~(v2 >> 1) & 0x4000000000000000 | v2;
}

id sub_100015B2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  v10[1] = (id)sub_100004F70(v2);
  if (qword_100021B18 != -1) {
    swift_once();
  }
  sub_100014800(qword_100022000);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setUnknownPayloadKeys:isa];

  v4.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021B10 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  NSString v6 = sub_100016BB0();
  v10[0] = 0;
  unsigned int v7 = [v1 loadBooleanFromDictionary:v4.super.isa usingKey:v5 forKeyPath:v6 isRequired:1 defaultValue:0 error:v10];

  if (v7) {
    return v10[0];
  }
  id v9 = v10[0];
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC24CalculatorProgrammerModeC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0()
{
  uint64_t v1 = v0;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v2 = sub_100016D30();
  if (qword_100021B10 != -1) {
    swift_once();
  }
  NSString v3 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v3 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorProgrammerMode_payloadEnabled] isRequired:1 defaultValue:0];

  return ~(v2 >> 1) & 0x4000000000000000 | v2;
}

id sub_100015E28()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  v10[1] = (id)sub_100004F70(v2);
  if (qword_100021B28 != -1) {
    swift_once();
  }
  sub_100014800(qword_100022018);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setUnknownPayloadKeys:isa];

  v4.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021B20 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  NSString v6 = sub_100016BB0();
  v10[0] = 0;
  unsigned int v7 = [v1 loadBooleanFromDictionary:v4.super.isa usingKey:v5 forKeyPath:v6 isRequired:1 defaultValue:0 error:v10];

  if (v7) {
    return v10[0];
  }
  id v9 = v10[0];
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC010CalculatorA9NotesModeC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0()
{
  uint64_t v1 = v0;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v2 = sub_100016D30();
  if (qword_100021B20 != -1) {
    swift_once();
  }
  NSString v3 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v3 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled] isRequired:1 defaultValue:0];

  return ~(v2 >> 1) & 0x4000000000000000 | v2;
}

id sub_100016124()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  v16[1] = (id)sub_100004F70(v2);
  if (qword_100021B40 != -1) {
    swift_once();
  }
  sub_100014800(qword_100022040);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setUnknownPayloadKeys:isa];

  v4.super.Class isa = sub_100016B50().super.isa;
  if (qword_100021B30 != -1) {
    swift_once();
  }
  NSString v5 = sub_100016BB0();
  NSString v6 = sub_100016BB0();
  v16[0] = 0;
  unsigned int v7 = [v1 loadBooleanFromDictionary:v4.super.isa usingKey:v5 forKeyPath:v6 isRequired:1 defaultValue:0 error:v16];

  id v8 = v16[0];
  if (v7)
  {
    id v9 = v16[0];
    v10.super.Class isa = sub_100016B50().super.isa;
    if (qword_100021B38 != -1) {
      swift_once();
    }
    NSString v11 = sub_100016BB0();
    NSString v12 = sub_100016BB0();
    v16[0] = 0;
    unsigned int v13 = [v1 loadBooleanFromDictionary:v10.super.isa usingKey:v11 forKeyPath:v12 isRequired:1 defaultValue:0 error:v16];

    id v8 = v16[0];
    if (v13) {
      return v16[0];
    }
  }
  id v15 = v8;
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC20CalculatorInputModesC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0()
{
  uint64_t v1 = v0;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v2 = sub_100016D30();
  if (qword_100021B30 != -1) {
    swift_once();
  }
  NSString v3 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v3 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes_payloadUnitConversion] isRequired:1 defaultValue:0];

  if (qword_100021B38 != -1) {
    swift_once();
  }
  NSString v4 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v4 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes_payloadRPN] isRequired:1 defaultValue:0];

  return ~(v2 >> 1) & 0x4000000000000000 | v2;
}

id sub_100016558()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_bridgeObjectRetain();
  v15[1] = (id)sub_100004F70(v2);
  if (qword_100021B50 != -1) {
    swift_once();
  }
  sub_100014800(qword_100022058);
  Class isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();
  [v0 setUnknownPayloadKeys:isa];

  Class v4 = sub_100016B50().super.isa;
  NSString v5 = sub_100016BB0();
  NSString v6 = sub_100016BB0();
  v15[0] = 0;
  unsigned int v7 = [v0 loadBooleanFromDictionary:v4 usingKey:v5 forKeyPath:v6 isRequired:1 defaultValue:0 error:v15];

  if (v7)
  {
    id v8 = v15[0];
    v9.super.Class isa = sub_100016B50().super.isa;
    if (qword_100021B48 != -1) {
      swift_once();
    }
    NSString v10 = sub_100016BB0();
    NSString v11 = sub_100016BB0();
    v15[0] = 0;
    unsigned int v12 = [v1 loadBooleanFromDictionary:v9.super.isa usingKey:v10 forKeyPath:v11 isRequired:1 defaultValue:0 error:v15];

    if (v12) {
      return v15[0];
    }
  }
  id v14 = v15[0];
  sub_100016AA0();

  swift_willThrow();
  return (id)swift_errorRelease();
}

uint64_t _s22MathSettingsSubscriber07RMModelaB11DeclarationC14SystemBehaviorC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0()
{
  uint64_t v1 = v0;
  sub_10000D85C(0, &qword_100022060);
  unint64_t v2 = sub_100016D30();
  NSString v3 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v3 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions] isRequired:1 defaultValue:0];

  if (qword_100021B48 != -1) {
    swift_once();
  }
  NSString v4 = sub_100016BB0();
  [v1 serializeBooleanIntoDictionary:v2 usingKey:v4 value:*(void *)&v1[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes] isRequired:1 defaultValue:0];

  return ~(v2 >> 1) & 0x4000000000000000 | v2;
}

void *sub_10001695C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000169A0()
{
  unint64_t result = qword_100022300;
  if (!qword_100022300)
  {
    sub_10000D85C(255, (unint64_t *)&qword_100021F38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022300);
  }
  return result;
}

uint64_t sub_100016A40()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_100016A50()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_100016A60()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100016A70()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100016A80()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100016A90()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100016AA0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100016AB0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100016AC0()
{
  return UUID.init()();
}

uint64_t sub_100016AD0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100016AE0()
{
  return static Locale.current.getter();
}

uint64_t sub_100016AF0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100016B20()
{
  return Logger.logObject.getter();
}

uint64_t sub_100016B30()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100016B40()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100016B50()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100016B60()
{
  return static Dictionary._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100016B70()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016B80()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100016B90()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100016BA0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100016BB0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100016BC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016BD0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100016BE0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100016BF0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100016C00()
{
  return String.hash(into:)();
}

uint64_t sub_100016C10()
{
  return String.index(after:)();
}

void sub_100016C20(Swift::String a1)
{
}

Swift::Int sub_100016C30()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100016C40()
{
  return String.subscript.getter();
}

uint64_t sub_100016C50()
{
  return String.subscript.getter();
}

NSArray sub_100016C60()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100016C70()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016C80()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100016C90()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100016CA0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100016CB0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100016CC0()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100016CD0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100016CE0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016CF0()
{
  return Set.description.getter();
}

uint64_t sub_100016D00()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100016D10()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_100016D20()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_100016D30()
{
  return NSDictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100016D40()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100016D50()
{
  return static os_log_type_t.error.getter();
}

NSNumber sub_100016D60(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int sub_100016D70(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100016D80()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100016D90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100016DA0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100016DB0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100016DC0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100016DD0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100016DE0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_100016DF0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100016E00()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_100016E10()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_100016E20()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_100016E30()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_100016E40()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100016E50()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100016E60()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_100016E70()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100016E80()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_100016E90()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int sub_100016EA0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100016EB0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100016EC0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100016ED0()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100016EE0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100016EF0(Swift::Int a1)
{
}

uint64_t sub_100016F00()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100016F10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100016F20()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100016F30()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100016F40()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100016F50()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100016F60()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100016F70()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100016F80()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100016F90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100016FA0()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100016FB0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100016FC0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100016FD0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100016FE0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100016FF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100017000()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100017010()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100017040()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100017050()
{
  return Error._userInfo.getter();
}

uint64_t sub_100017060()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100017070()
{
  return Hasher._finalize()();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}