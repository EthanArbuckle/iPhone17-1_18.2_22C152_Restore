int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  sub_100001E9C(&qword_1000109C0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100009D10;
  *(void *)(v4 + 32) = type metadata accessor for InteractiveLegacyProfilesApplicator();
  sub_100001E9C(&qword_100010B80);
  isa = sub_100009560().super.isa;
  swift_bridgeObjectRelease();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:0];

  return 0;
}

uint64_t sub_100001E9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of InteractiveLegacyProfilesAdapter.installedProfileIdentifierByDeclarationKey()
{
  return 0;
}

void type metadata accessor for RMStoreScope()
{
  if (!qword_1000109A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000109A8);
    }
  }
}

uint64_t sub_100001F40()
{
  uint64_t v0 = sub_1000094E0();
  sub_100008C5C(v0, qword_100010D40);
  sub_100002818(v0, (uint64_t)qword_100010D40);
  type metadata accessor for InteractiveLegacyProfilesAdapter();
  sub_100001E9C(&qword_100010BB8);
  sub_100009520();
  return sub_1000094D0();
}

void sub_100001FD8(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  switch(a3)
  {
    case 1:
      sub_1000096B0(29);
      swift_bridgeObjectRelease();
      v15._countAndFlagsBits = a1;
      v15._object = a2;
      sub_100009540(v15);
      unint64_t v9 = 0xD00000000000001BLL;
      unint64_t v10 = 0x800000010000B020;
      unint64_t v7 = 0xD000000000000031;
      v11 = "InteractiveLegacyProfiles.ConfigurationURLInvalid";
      goto LABEL_6;
    case 2:
      swift_errorRetain();
      sub_1000096B0(29);
      swift_bridgeObjectRelease();
      sub_100008FD8();
      v13._countAndFlagsBits = sub_100009490();
      sub_100009540(v13);
      swift_bridgeObjectRelease();
      sub_100008D24(a1, (uint64_t)a2, 2);
      unint64_t v9 = 0xD00000000000001BLL;
      unint64_t v10 = 0x800000010000AFC0;
      unint64_t v7 = 0xD00000000000002ELL;
      v11 = "InteractiveLegacyProfiles.ProfileInstallFailed";
      goto LABEL_6;
    case 3:
      swift_errorRetain();
      sub_1000096B0(31);
      swift_bridgeObjectRelease();
      sub_100008FD8();
      v14._countAndFlagsBits = sub_100009490();
      sub_100009540(v14);
      swift_bridgeObjectRelease();
      sub_100008D24(a1, (uint64_t)a2, 3);
      unint64_t v9 = 0xD00000000000001DLL;
      unint64_t v10 = 0x800000010000AF70;
      unint64_t v7 = 0xD000000000000030;
      v11 = "InteractiveLegacyProfiles.ProfileUninstallFailed";
LABEL_6:
      unint64_t v8 = (unint64_t)(v11 - 32) | 0x8000000000000000;
      break;
    default:
      sub_1000096B0(18);
      swift_bridgeObjectRelease();
      v12._countAndFlagsBits = a1;
      v12._object = a2;
      sub_100009540(v12);
      unint64_t v7 = 0;
      unint64_t v8 = 0;
      unint64_t v9 = 0xD000000000000010;
      unint64_t v10 = 0x800000010000B040;
      break;
  }
  *a4 = v7;
  a4[1] = v8;
  a4[2] = v9;
  a4[3] = v10;
  a4[4] = 0;
}

__n128 sub_100002258@<Q0>(uint64_t a1@<X8>)
{
  sub_100001FD8(*(void *)v1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16), (unint64_t *)v5);
  uint64_t v3 = v6;
  __n128 result = (__n128)v5[1];
  *(_OWORD *)a1 = v5[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_1000022A8(uint64_t a1)
{
  unint64_t v2 = sub_100008FD8();

  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000022E4(uint64_t a1)
{
  unint64_t v2 = sub_100008FD8();

  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_10000232C(uint64_t a1)
{
  unint64_t v2 = sub_100008F2C();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100002368(uint64_t a1)
{
  unint64_t v2 = sub_100008F2C();

  return Error<>._code.getter(a1, v2);
}

id InteractiveLegacyProfilesAdapter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id InteractiveLegacyProfilesAdapter.init()()
{
  uint64_t v0 = (objc_class *)type metadata accessor for InteractiveLegacyProfilesAdapter();
  id v1 = (char *)objc_allocWithZone(v0);
  uint64_t v2 = OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController;
  *(void *)&v1[OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController] = 0;
  uint64_t v3 = OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey;
  *(void *)&v1[OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey] = 0;
  v4 = *(void **)&v1[v2];
  *(void *)&v1[v2] = 0;
  v5 = v1;

  *(void *)&v1[v3] = 0;
  swift_bridgeObjectRelease();
  v8.receiver = v5;
  v8.super_class = v0;
  id v6 = objc_msgSendSuper2(&v8, "init");
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

uint64_t type metadata accessor for InteractiveLegacyProfilesAdapter()
{
  return self;
}

uint64_t InteractiveLegacyProfilesAdapter.configurationClasses()()
{
  sub_100001E9C(&qword_1000109C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100009D10;
  *(void *)(v0 + 32) = sub_1000087A4(0, &qword_1000109C8);
  return v0;
}

uint64_t InteractiveLegacyProfilesAdapter.beginProcessingConfigurations(for:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return _swift_task_switch(sub_100002600, 0, 0);
}

uint64_t sub_100002600()
{
  Swift::String v12 = v0;
  if (qword_1000109A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000094E0();
  sub_100002818(v1, (uint64_t)qword_100010D40);
  uint64_t v2 = sub_1000094C0();
  os_log_type_t v3 = sub_1000095C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)v4 = 136315138;
    v0[2] = sub_10000494C(0xD000000000000023, 0x800000010000A9A0, &v11);
    sub_100009600();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = v0[4];
  uint64_t v6 = OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController;
  if (!*(void *)(v5
                  + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController))
  {
    id v7 = [self newProfileControllerWithPrefix:InteractiveLegacyProfileIdentifierPrefix scope:v0[3]];
    objc_super v8 = *(void **)(v5 + v6);
    *(void *)(v5 + v6) = v7;

    uint64_t v5 = v0[4];
  }
  *(void *)(v5
            + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey) = 0;
  swift_bridgeObjectRelease();
  unint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100002818(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000029C8(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  id v6 = a3;
  id v7 = (void *)swift_task_alloc();
  v3[4] = v7;
  *id v7 = v3;
  v7[1] = sub_10000902C;
  v7[3] = a1;
  v7[4] = v6;
  return _swift_task_switch(sub_100002600, 0, 0);
}

uint64_t InteractiveLegacyProfilesAdapter.endProcessingConfigurations(_:scope:)()
{
  os_log_type_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000109E0 + dword_1000109E0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100002B3C;
  return v3();
}

uint64_t sub_100002B3C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002DB0(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  objc_super v8 = (uint64_t (*)(void))((char *)&dword_1000109E0 + dword_1000109E0);
  a4;
  id v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *id v6 = v4;
  v6[1] = sub_100002E74;
  return v8();
}

uint64_t sub_100002E74()
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
    objc_super v8 = (void *)sub_100009450();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t InteractiveLegacyProfilesAdapter.allDeclarationKeys(for:)()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000109F0 + dword_1000109F0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003098;
  return v3();
}

uint64_t sub_100003098(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

void sub_100003198(uint64_t a1)
{
  sub_1000087A4(0, &qword_100010B30);
  sub_1000087E0();
  int64_t v2 = 0;
  v13[1] = (id)sub_1000095B0();
  uint64_t v3 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_100004FA4(v13, *(id *)(*(void *)(a1 + 48) + 8 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    int64_t v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v2 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v2 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v2);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_1000034B0(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  int64_t v7 = (uint64_t (*)(void))((char *)&dword_1000109F0 + dword_1000109F0);
  a3;
  uint64_t v5 = (void *)swift_task_alloc();
  v3[4] = v5;
  void *v5 = v3;
  v5[1] = sub_100003574;
  return v7();
}

uint64_t sub_100003574()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v6 = sub_100009450();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    sub_1000087A4(0, &qword_100010B30);
    sub_1000087E0();
    Class isa = sub_1000095A0().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    uint64_t v8 = isa;
  }
  unint64_t v9 = *(void (***)(void, void, void))(v3 + 24);
  ((void (**)(void, Class, uint64_t))v9)[2](v9, isa, v6);

  _Block_release(v9);
  int64_t v10 = *(uint64_t (**)(void))(v5 + 8);
  return v10();
}

uint64_t InteractiveLegacyProfilesAdapter.applyConfiguration(_:replace:scope:)(uint64_t a1, uint64_t a2)
{
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100010A00 + dword_100010A00);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100009030;
  return v7(a1, a2);
}

uint64_t sub_1000037D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100001E9C(&qword_100010B98);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    uint64_t v8 = sub_100009510();
    unint64_t v9 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *unint64_t v9 = v8;
    v9[1] = v10;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100003A28(void *a1, void *a2, int a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  _OWORD v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  uint64_t v13 = (uint64_t (*)(id, void *))((char *)&dword_100010A00 + dword_100010A00);
  id v9 = a1;
  id v10 = a2;
  a5;
  unint64_t v11 = (void *)swift_task_alloc();
  v5[6] = v11;
  void *v11 = v5;
  v11[1] = sub_100003B14;
  return v13(v9, a2);
}

uint64_t sub_100003B14()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v8 = sub_100009450();
    swift_errorRelease();
    Class isa = 0;
    id v10 = (void *)v8;
  }
  else
  {
    sub_1000087A4(0, &qword_100010B08);
    Class isa = sub_100009560().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    id v10 = isa;
  }
  unint64_t v11 = *(void (***)(void, void, void))(v3 + 40);
  ((void (**)(void, Class, uint64_t))v11)[2](v11, isa, v8);

  _Block_release(v11);
  uint64_t v12 = *(uint64_t (**)(void))(v7 + 8);
  return v12();
}

uint64_t InteractiveLegacyProfilesAdapter.remove(_:scope:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100010A10 + dword_100010A10);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100009038;
  return v5(a1);
}

uint64_t sub_100003D98(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100001E9C(&qword_100010B98);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_100003FB0(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v10 = (uint64_t (*)(uint64_t))((char *)&dword_100010A10 + dword_100010A10);
  id v7 = a1;
  a4;
  uint64_t v8 = (void *)swift_task_alloc();
  v4[5] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_100004088;
  return v10((uint64_t)v7);
}

uint64_t sub_100004088()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    id v9 = (void *)sub_100009450();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  id v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id InteractiveLegacyProfilesAdapter.declarationKey(forConfiguration:)(id result)
{
  uint64_t v2 = *(void **)(v1
                + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController);
  if (v2)
  {
    uint64_t v3 = result;
    id v4 = v2;
    id v5 = [v3 store];
    id v6 = [v3 declaration];
    id v7 = [v4 declarationKeyForStore:v5 declaration:v6];

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id InteractiveLegacyProfilesAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InteractiveLegacyProfilesAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100004434(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100009038;
  return v6();
}

uint64_t sub_100004500(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100009038;
  return v7();
}

uint64_t sub_1000045CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009590();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100009580();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008B50(a1, &qword_100010AA0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100009570();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100004778(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100004854;
  return v6(a1);
}

uint64_t sub_100004854()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000494C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004A20(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008BFC((uint64_t)v12, *a3);
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
      sub_100008BFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008BAC((uint64_t)v12);
  return v7;
}

uint64_t sub_100004A20(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009610();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100004BDC(a5, a6);
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
  uint64_t v8 = sub_1000096D0();
  if (!v8)
  {
    sub_1000096E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000096F0();
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

uint64_t sub_100004BDC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004C74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004E54(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004E54(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004C74(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100004DEC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000096C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000096E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009550();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000096F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000096E0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100004DEC(uint64_t a1, uint64_t a2)
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
  sub_100001E9C(&qword_100010BB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004E54(char a1, int64_t a2, char a3, char *a4)
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
    sub_100001E9C(&qword_100010BB0);
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
  uint64_t result = sub_1000096F0();
  __break(1u);
  return result;
}

uint64_t sub_100004FA4(void *a1, void *a2)
{
  unint64_t v3 = v2;
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
    uint64_t v9 = sub_100009650();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1000087A4(0, &qword_100010B30);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100009640();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100005244(v7, result + 1);
    v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10000543C();
      v23 = v28;
    }
    else
    {
      v23 = (void *)v22;
      id v24 = v8;
    }
    sub_1000056DC((uint64_t)v8, v23);
    *unint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_1000095E0(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_1000087A4(0, &qword_100010B30);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_1000095F0();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
        char v19 = sub_1000095F0();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100005760((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100005244(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100001E9C(&qword_100010BA8);
    uint64_t v2 = sub_100009690();
    uint64_t v14 = v2;
    sub_100009630();
    if (sub_100009660())
    {
      sub_1000087A4(0, &qword_100010B30);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10000543C();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_1000095E0(*(void *)(v2 + 40));
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
      while (sub_100009660());
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

uint64_t sub_10000543C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100001E9C(&qword_100010BA8);
  uint64_t v3 = sub_100009680();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
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
                  *unint64_t v6 = -1 << v27;
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
      uint64_t result = sub_1000095E0(*(void *)(v4 + 40));
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

unint64_t sub_1000056DC(uint64_t a1, void *a2)
{
  sub_1000095E0(a2[5]);
  unint64_t result = sub_100009620();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100005760(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10000543C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000058E8();
      goto LABEL_14;
    }
    sub_100005A94();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_1000095E0(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000087A4(0, &qword_100010B30);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1000095F0();

    if (v12)
    {
LABEL_13:
      sub_100009710();
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
        char v15 = sub_1000095F0();

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

id sub_1000058E8()
{
  uint64_t v1 = v0;
  sub_100001E9C(&qword_100010BA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100009670();
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

uint64_t sub_100005A94()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100001E9C(&qword_100010BA8);
  uint64_t v3 = sub_100009680();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  v28 = v0;
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
    uint64_t result = sub_1000095E0(v19);
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

unint64_t sub_100005D10(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000095E0(*(void *)(v2 + 40));

  return sub_100005D54(a1, v4);
}

unint64_t sub_100005D54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_1000087A4(0, &qword_100010B30);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1000095F0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1000095F0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_100005E70()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_100005E90, 0, 0);
}

uint64_t sub_100005E90()
{
  uint64_t v8 = v0;
  if (qword_1000109A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000094E0();
  sub_100002818(v1, (uint64_t)qword_100010D40);
  uint64_t v2 = sub_1000094C0();
  os_log_type_t v3 = sub_1000095C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[2] = sub_10000494C(0xD000000000000025, 0x800000010000ACA0, &v7);
    sub_100009600();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  *(void *)(v0[3]
            + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey) = 0;
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10000605C()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_10000607C, 0, 0);
}

uint64_t sub_10000607C()
{
  uint64_t v21 = v0;
  if (qword_1000109A0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0 + 2;
  uint64_t v2 = sub_1000094E0();
  sub_100002818(v2, (uint64_t)qword_100010D40);
  os_log_type_t v3 = sub_1000094C0();
  os_log_type_t v4 = sub_1000095C0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = sub_10000494C(0xD000000000000018, 0x800000010000AC70, &v20);
    sub_100009600();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = v0[3];
  uint64_t v7 = *(void **)(v6
                + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController);
  if (v7)
  {
    id v8 = [v7 installedProfileIdentifierByDeclarationKey];
    sub_1000087A4(0, &qword_100010B30);
    sub_1000087E0();
    uint64_t v9 = sub_1000094F0();

    uint64_t v6 = v0[3];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey;
  *(void *)(v6
            + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey) = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v6 + v10);
  if (v11)
  {
    swift_bridgeObjectRetain_n();
    sub_100003198(v11);
    unint64_t v13 = v12;
  }
  else
  {
    unint64_t v13 = (unint64_t)&_swiftEmptySetSingleton;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_1000094C0();
  os_log_type_t v15 = sub_1000095C0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    *uint64_t v1 = sub_10000494C(0xD000000000000018, 0x800000010000AC70, &v20);
    sub_100009600();
    *(_WORD *)(v16 + 12) = 2048;
    if ((v13 & 0xC000000000000001) != 0) {
      uint64_t v17 = sub_100009640();
    }
    else {
      uint64_t v17 = *(void *)(v13 + 16);
    }
    *uint64_t v1 = v17;
    sub_100009600();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s result: %ld", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  int64_t v18 = (uint64_t (*)(unint64_t))v0[1];
  return v18(v13);
}

uint64_t sub_10000644C(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return _swift_task_switch(sub_10000646C, 0, 0);
}

uint64_t sub_10000646C()
{
  uint64_t v28 = v0;
  if (qword_1000109A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000094E0();
  *(void *)(v0 + 136) = sub_100002818(v1, (uint64_t)qword_100010D40);
  uint64_t v2 = sub_1000094C0();
  os_log_type_t v3 = sub_1000095C0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v4 = 136315138;
    *(void *)(v0 + 80) = sub_10000494C(0xD000000000000010, 0x800000010000ABC0, &v27);
    sub_100009600();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = *(void *)(*(void *)(v0 + 128)
                 + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey);
  if (!v5 || !*(void *)(v5 + 16)) {
    goto LABEL_13;
  }
  uint64_t v6 = *(void **)(v0 + 120);
  swift_bridgeObjectRetain();
  sub_100005D10((uint64_t)v6);
  if ((v7 & 1) == 0)
  {
    unint64_t v14 = *(void **)(v0 + 120);
    swift_bridgeObjectRelease();

LABEL_13:
    id v15 = *(id *)(v0 + 120);
    uint64_t v16 = sub_1000094C0();
    os_log_type_t v17 = sub_1000095C0();
    BOOL v18 = os_log_type_enabled(v16, v17);
    Swift::Int v19 = *(void **)(v0 + 120);
    if (v18)
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315394;
      *(void *)(v0 + 80) = sub_10000494C(0xD000000000000010, 0x800000010000ABC0, &v27);
      sub_100009600();
      *(_WORD *)(v20 + 12) = 2080;
      id v21 = [v19 key];
      uint64_t v22 = sub_100009510();
      unint64_t v24 = v23;

      *(void *)(v0 + 80) = sub_10000494C(v22, v24, &v27);
      sub_100009600();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: no profile to remove: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    goto LABEL_16;
  }
  uint64_t v9 = *(void **)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

  uint64_t v10 = *(void **)(v8
                 + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController);
  *(void *)(v0 + 144) = v10;
  if (v10)
  {
    id v11 = v10;
    NSString v12 = sub_100009500();
    *(void *)(v0 + 152) = v12;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_10000693C;
    uint64_t v13 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100003D98;
    *(void *)(v0 + 104) = &unk_10000C878;
    *(void *)(v0 + 112) = v13;
    [v11 uninstallProfileWithIdentifier:v12 store:0 completionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  swift_bridgeObjectRelease();
LABEL_16:
  unint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_10000693C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_100006AB4;
  }
  else {
    uint64_t v2 = sub_100006A4C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006A4C()
{
  uint64_t v1 = *(void **)(v0 + 144);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100006AB4()
{
  uint64_t v13 = v0;
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = (void *)v0[18];
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v3 = sub_1000094C0();
  os_log_type_t v4 = sub_1000095D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[10] = sub_10000494C(0xD000000000000010, 0x800000010000ABC0, &v12);
    sub_100009600();
    *(_WORD *)(v5 + 12) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v7;
    sub_100009600();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s: failed to uninstall profile: %@", (uint8_t *)v5, 0x16u);
    sub_100001E9C(&qword_100010B90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = v0[20];
  sub_100008A94();
  swift_allocError();
  *(void *)uint64_t v9 = v8;
  *(void *)(v9 + 8) = 0;
  *(unsigned char *)(v9 + 16) = 3;
  swift_willThrow();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100006D24(uint64_t a1, uint64_t a2)
{
  v3[29] = a2;
  v3[30] = v2;
  v3[28] = a1;
  uint64_t v4 = sub_100009480();
  v3[31] = v4;
  v3[32] = *(void *)(v4 - 8);
  v3[33] = swift_task_alloc();
  sub_100001E9C(&qword_100010BA0);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  return _swift_task_switch(sub_100006E28, 0, 0);
}

uint64_t sub_100006E28()
{
  uint64_t v106 = v0;
  if (qword_1000109A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000094E0();
  *(void *)(v0 + 288) = sub_100002818(v1, (uint64_t)qword_100010D40);
  uint64_t v2 = sub_1000094C0();
  os_log_type_t v3 = sub_1000095C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v104 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 216) = sub_10000494C(0xD000000000000024, 0x800000010000AC20, &v104);
    sub_100009600();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = &InteractiveLegacyProfilesAdapter;
  id v6 = [*(id *)(v0 + 224) declaration];
  *(void *)(v0 + 296) = v6;
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (!v7)
  {
    unint64_t v25 = *(void **)(v0 + 224);

    id v26 = v25;
    uint64_t v27 = sub_1000094C0();
    os_log_type_t v28 = sub_1000095C0();
    BOOL v29 = os_log_type_enabled(v27, v28);
    v30 = *(void **)(v0 + 224);
    if (v29)
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315394;
      *(void *)(v0 + 168) = sub_10000494C(0xD000000000000024, 0x800000010000AC20, &v104);
      sub_100009600();
      *(_WORD *)(v31 + 12) = 2080;
      id v32 = [v30 declaration];
      id v33 = [v32 declarationType];

      uint64_t v34 = sub_100009510();
      unint64_t v36 = v35;

      *(void *)(v0 + 176) = sub_10000494C(v34, v36, &v104);
      sub_100009600();

      uint64_t v5 = &InteractiveLegacyProfilesAdapter;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s: invalid declaration type: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v52 = *(void **)(v0 + 224);
    uint64_t v104 = 0;
    unint64_t v105 = 0xE000000000000000;
    sub_1000096B0(28);
    swift_bridgeObjectRelease();
    uint64_t v104 = 0xD00000000000001ALL;
    unint64_t v105 = 0x800000010000AC00;
    id v53 = [v52 (SEL)v5[235].count];
    id v54 = [v53 declarationType];

    uint64_t v55 = sub_100009510();
    v57 = v56;

    v108._countAndFlagsBits = v55;
    v108._object = v57;
    sub_100009540(v108);
    swift_bridgeObjectRelease();
    uint64_t v58 = v104;
    unint64_t v59 = v105;
    sub_100008A94();
    swift_allocError();
    *(void *)uint64_t v60 = v58;
    *(void *)(v60 + 8) = v59;
    *(unsigned char *)(v60 + 16) = 0;
    swift_willThrow();
    goto LABEL_24;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v10 = *(void *)(v0 + 272);
  uint64_t v9 = *(void *)(v0 + 280);
  uint64_t v12 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  id v13 = v6;
  id v103 = v8;
  id v14 = [v8 payloadProfileURL];
  sub_100009510();

  sub_100009470();
  swift_bridgeObjectRelease();
  sub_100008AE8(v9, v10);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v10, 1, v12) == 1)
  {
    sub_100008B50(*(void *)(v0 + 272), &qword_100010BA0);
    id v15 = v13;
    uint64_t v16 = sub_1000094C0();
    os_log_type_t v17 = sub_1000095C0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v102 = v0 + 136;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      *(void *)(v0 + 160) = sub_10000494C(0xD000000000000024, 0x800000010000AC20, &v104);
      sub_100009600();
      *(_WORD *)(v18 + 12) = 2082;
      Swift::Int v19 = v103;
      id v20 = [v103 payloadProfileURL];
      uint64_t v21 = sub_100009510();
      unint64_t v23 = v22;

      *(void *)(v0 + 136) = sub_10000494C(v21, v23, &v104);
      sub_100009600();

      unint64_t v24 = &InteractiveLegacyProfilesAdapter;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: invalid URL: %{public}s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      Swift::Int v19 = v8;
      unint64_t v24 = &InteractiveLegacyProfilesAdapter;
    }
    uint64_t v61 = *(void *)(v0 + 280);
    id v62 = objc_msgSend(v19, (SEL)v24[241].count, v102);
    uint64_t v63 = sub_100009510();
    uint64_t v65 = v64;

    sub_100008A94();
    swift_allocError();
    *(void *)uint64_t v66 = v63;
    *(void *)(v66 + 8) = v65;
    *(unsigned char *)(v66 + 16) = 1;
    swift_willThrow();

    uint64_t v67 = v61;
LABEL_23:
    sub_100008B50(v67, &qword_100010BA0);
LABEL_24:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v87 = *(uint64_t (**)(void))(v0 + 8);
    return v87();
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 256) + 32))(*(void *)(v0 + 264), *(void *)(v0 + 272), *(void *)(v0 + 248));
  v37 = self;
  sub_100009460(v38);
  v40 = v39;
  LODWORD(v37) = [v37 isValidURL:v39];

  if (!v37)
  {
    id v68 = v13;
    v69 = sub_1000094C0();
    os_log_type_t v70 = sub_1000095C0();
    if (os_log_type_enabled(v69, v70))
    {
      uint64_t v71 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      *(_DWORD *)uint64_t v71 = 136315394;
      *(void *)(v0 + 144) = sub_10000494C(0xD000000000000024, 0x800000010000AC20, &v104);
      sub_100009600();
      *(_WORD *)(v71 + 12) = 2082;
      v72 = v103;
      id v73 = [v103 payloadProfileURL];
      uint64_t v74 = sub_100009510();
      unint64_t v76 = v75;

      v77 = &InteractiveLegacyProfilesAdapter;
      *(void *)(v0 + 152) = sub_10000494C(v74, v76, &v104);
      sub_100009600();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "%s: invalid URL scheme: %{public}s", (uint8_t *)v71, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v72 = v103;
      v77 = &InteractiveLegacyProfilesAdapter;
    }
    uint64_t v78 = *(void *)(v0 + 280);
    uint64_t v80 = *(void *)(v0 + 256);
    uint64_t v79 = *(void *)(v0 + 264);
    uint64_t v81 = *(void *)(v0 + 248);
    id v82 = [v72 (SEL)v77[241].count];
    uint64_t v83 = sub_100009510();
    uint64_t v85 = v84;

    sub_100008A94();
    swift_allocError();
    *(void *)uint64_t v86 = v83;
    *(void *)(v86 + 8) = v85;
    *(unsigned char *)(v86 + 16) = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v81);
    uint64_t v67 = v78;
    goto LABEL_23;
  }
  v41 = *(void **)(v0 + 232);
  if (v41)
  {
    id v42 = v13;
    id v43 = v41;
    v44 = sub_1000094C0();
    os_log_type_t v45 = sub_1000095C0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315394;
      *(void *)(v0 + 200) = sub_10000494C(0xD000000000000024, 0x800000010000AC20, &v104);
      sub_100009600();
      *(_WORD *)(v46 + 12) = 2082;
      id v47 = v43;
      id v48 = [v103 declarationIdentifier];
      uint64_t v49 = sub_100009510();
      unint64_t v51 = v50;

      id v43 = v47;
      *(void *)(v0 + 208) = sub_10000494C(v49, v51, &v104);
      sub_100009600();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "%s: updating interactive profile: %{public}s", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v89 = *(void **)(*(void *)(v0 + 240)
                   + OBJC_IVAR____TtC35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapter_profilesController);
    *(void *)(v0 + 304) = v89;
    if (v89)
    {
      uint64_t v90 = *(void *)(v0 + 224);
      id v91 = v89;
      sub_100009460(v92);
      uint64_t v94 = v93;
      *(void *)(v0 + 312) = v93;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 120;
      *(void *)(v0 + 24) = sub_100007B78;
      uint64_t v95 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_1000037D8;
      *(void *)(v0 + 104) = &unk_10000C890;
      *(void *)(v0 + 112) = v95;
      [v91 downloadAndInstallProfileConfiguration:v90 fromURL:v94 completionHandler:v0 + 80];
      return _swift_continuation_await(v0 + 16);
    }
  }
  v96 = *(void **)(v0 + 296);
  uint64_t v97 = *(void *)(v0 + 280);
  uint64_t v99 = *(void *)(v0 + 256);
  uint64_t v98 = *(void *)(v0 + 264);
  uint64_t v100 = *(void *)(v0 + 248);

  (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v98, v100);
  sub_100008B50(v97, &qword_100010BA0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v101 = *(uint64_t (**)(void *))(v0 + 8);
  return v101(&_swiftEmptyArrayStorage);
}

uint64_t sub_100007B78()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 320) = v1;
  if (v1) {
    uint64_t v2 = sub_100007D70;
  }
  else {
    uint64_t v2 = sub_100007C88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007C88()
{
  uint64_t v1 = *(void **)(v0 + 304);
  uint64_t v2 = *(void **)(v0 + 312);

  swift_bridgeObjectRelease();
  os_log_type_t v3 = *(void **)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v6 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v7 = *(void *)(v0 + 248);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  sub_100008B50(v4, &qword_100010BA0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_100007D70()
{
  id v13 = v0;
  uint64_t v1 = (void *)v0[39];
  uint64_t v2 = (void *)v0[38];
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v3 = sub_1000094C0();
  os_log_type_t v4 = sub_1000095D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[23] = sub_10000494C(0xD000000000000024, 0x800000010000AC20, &v12);
    sub_100009600();
    *(_WORD *)(v5 + 12) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v7;
    sub_100009600();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s: failed to download and install profile: %@", (uint8_t *)v5, 0x16u);
    sub_100001E9C(&qword_100010B90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = v0[29];
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_100010A10 + dword_100010A10);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[41] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100007FFC;
  return v11(v8);
}

uint64_t sub_100007FFC()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_100009034;
  }
  else
  {
    uint64_t v1 = sub_100008114;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_100008114()
{
  uint64_t v1 = v0[40];
  uint64_t v2 = (void *)v0[37];
  uint64_t v3 = v0[35];
  uint64_t v5 = v0[32];
  uint64_t v4 = v0[33];
  uint64_t v6 = v0[31];
  uint64_t v7 = (void *)v0[29];
  sub_100008A94();
  swift_allocError();
  *(void *)uint64_t v8 = v1;
  *(void *)(v8 + 8) = 0;
  *(unsigned char *)(v8 + 16) = 2;
  swift_errorRetain();
  swift_willThrow();

  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_100008B50(v3, &qword_100010BA0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100008238()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100008280()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100009038;
  uint64_t v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_100010AA8 + dword_100010AA8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100008344()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100009038;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100010AB8 + dword_100010AB8);
  return v6(v2, v3, v4);
}

uint64_t sub_100008408(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100009038;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100010AC8 + dword_100010AC8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000084D4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000850C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100002B3C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010AD8 + dword_100010AD8);
  return v6(a1, v4);
}

uint64_t sub_1000085C4()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100008614()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100009038;
  uint64_t v8 = (uint64_t (*)(void *, void *, int, void *, void *))((char *)&dword_100010AE8 + dword_100010AE8);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_1000086E8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100002B3C;
  uint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100010B10 + dword_100010B10);
  return v6(v2, v3, v4);
}

uint64_t sub_1000087A4(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1000087E0()
{
  unint64_t result = qword_100010B38;
  if (!qword_100010B38)
  {
    sub_1000087A4(255, &qword_100010B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B38);
  }
  return result;
}

uint64_t sub_100008848()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100008888()
{
  int v2 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100009038;
  uint64_t v7 = (uint64_t (*)(int, int, void *, void *))((char *)&dword_100010B40 + dword_100010B40);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_100008958()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100008998()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100009038;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100010B60 + dword_100010B60);
  return v6(v2, v3, v4);
}

uint64_t sub_100008A54()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_100008A94()
{
  unint64_t result = qword_100010B88;
  if (!qword_100010B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B88);
  }
  return result;
}

uint64_t sub_100008AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001E9C(&qword_100010BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008B50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100001E9C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008BAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100008C5C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008CC4(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    case 2:
    case 3:
      uint64_t result = swift_errorRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for InteractiveLegacyProfilesAdapter.AdapterError(uint64_t a1)
{
  return sub_100008D24(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_100008D24(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2:
    case 3:
      uint64_t result = swift_errorRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s35InteractiveLegacyProfilesSubscriber32InteractiveLegacyProfilesAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100008CC4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for InteractiveLegacyProfilesAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100008CC4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100008D24(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for InteractiveLegacyProfilesAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for InteractiveLegacyProfilesAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100008D24(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for InteractiveLegacyProfilesAdapter.AdapterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InteractiveLegacyProfilesAdapter.AdapterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100008F00(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100008F0C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for InteractiveLegacyProfilesAdapter.AdapterError()
{
  return &type metadata for InteractiveLegacyProfilesAdapter.AdapterError;
}

unint64_t sub_100008F2C()
{
  unint64_t result = qword_100010BC0;
  if (!qword_100010BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BC0);
  }
  return result;
}

unint64_t sub_100008F84()
{
  unint64_t result = qword_100010BC8;
  if (!qword_100010BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BC8);
  }
  return result;
}

unint64_t sub_100008FD8()
{
  unint64_t result = qword_100010BD0;
  if (!qword_100010BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BD0);
  }
  return result;
}

id sub_100009200()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for InteractiveLegacyProfilesApplicator()
{
  return self;
}

void *sub_10000925C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100001E9C((uint64_t *)&unk_100010D30);
    uint64_t v3 = sub_1000096A0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v26 = a1 + 32;
    while (1)
    {
      char v6 = (uint64_t *)(v26 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100009760();
      swift_bridgeObjectRetain();
      sub_100009530();
      Swift::Int v9 = sub_100009770();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v9 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (sub_100009700() & 1) != 0)
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
          Swift::Int v19 = (void *)(v15 + 16 * v11);
          BOOL v20 = *v19 == v8 && v19[1] == v7;
          if (v20 || (sub_100009700() & 1) != 0) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return (void *)sub_100009400();
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_100009400()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_100009410()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_100009420()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100009430()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100009440()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100009450()
{
  return _convertErrorToNSError(_:)();
}

void sub_100009460(NSURL *retstr@<X8>)
{
}

uint64_t sub_100009470()
{
  return URL.init(string:)();
}

uint64_t sub_100009480()
{
  return type metadata accessor for URL();
}

uint64_t sub_100009490()
{
  return RMAdapterError.underlyingErrorDescription(_:)();
}

uint64_t sub_1000094C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000094D0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000094E0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000094F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100009500()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009510()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009520()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100009530()
{
  return String.hash(into:)();
}

void sub_100009540(Swift::String a1)
{
}

Swift::Int sub_100009550()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100009560()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009570()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100009580()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100009590()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_1000095A0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000095B0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000095C0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000095D0()
{
  return static os_log_type_t.error.getter();
}

Swift::Int sub_1000095E0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000095F0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100009600()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009610()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009620()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100009630()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100009640()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100009650()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100009660()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100009670()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100009680()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100009690()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_1000096A0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000096B0(Swift::Int a1)
{
}

uint64_t sub_1000096C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000096D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000096E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000096F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100009700()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009710()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100009740()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100009750()
{
  return Error._userInfo.getter();
}

uint64_t sub_100009760()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100009770()
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}