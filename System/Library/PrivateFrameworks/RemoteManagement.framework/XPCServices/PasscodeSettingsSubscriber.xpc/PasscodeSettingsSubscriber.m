int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  sub_100003184(&qword_100014BD0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10000DA00;
  *(void *)(v4 + 32) = type metadata accessor for PasscodeSettingsApplicator();
  sub_100003184(&qword_100014BB8);
  isa = sub_10000D158().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for PasscodeSettingsStatus();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:swift_getObjCClassFromMetadata()];

  return 0;
}

uint64_t sub_100003184(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for RMStoreScope()
{
  if (!qword_100014BC0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100014BC0);
    }
  }
}

uint64_t sub_100003220()
{
  uint64_t v0 = sub_10000D038();
  sub_10000842C(v0, qword_100015018);
  sub_1000083A0(v0, (uint64_t)qword_100015018);
  type metadata accessor for PasscodeSettingsAdapter();
  sub_100003184(&qword_100014D28);
  sub_10000D108();
  return sub_10000D028();
}

void sub_1000032B8(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  if (a3)
  {
    sub_10000D308(30);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = a1;
    v12._object = a2;
    sub_10000D128(v12);
    unint64_t v9 = 0xD00000000000001CLL;
    unint64_t v10 = 0x800000010000EA90;
    unint64_t v7 = 0xD000000000000029;
    unint64_t v8 = 0x800000010000EA60;
  }
  else
  {
    sub_10000D308(18);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = a1;
    v11._object = a2;
    sub_10000D128(v11);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0xD000000000000010;
    unint64_t v10 = 0x800000010000EAB0;
  }
  *a4 = v7;
  a4[1] = v8;
  a4[2] = v9;
  a4[3] = v10;
  a4[4] = 0;
}

__n128 sub_1000033B8@<Q0>(uint64_t a1@<X8>)
{
  sub_1000032B8(*(void *)v1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16), (unint64_t *)v5);
  uint64_t v3 = v6;
  __n128 result = (__n128)v5[1];
  *(_OWORD *)a1 = v5[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_100003408(uint64_t a1)
{
  unint64_t v2 = sub_100008790();

  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003444(uint64_t a1)
{
  unint64_t v2 = sub_100008790();

  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_10000348C(uint64_t a1)
{
  unint64_t v2 = sub_1000086E4();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000034C8(uint64_t a1)
{
  unint64_t v2 = sub_1000086E4();

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000350C()
{
  uint64_t result = sub_10000D0E8();
  qword_100015030 = result;
  *(void *)algn_100015038 = v1;
  return result;
}

uint64_t PasscodeSettingsAdapter.configurationClasses()()
{
  sub_100003184(&qword_100014BD0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10000DA00;
  *(void *)(v0 + 32) = sub_1000082FC(0, &qword_100014BD8);
  return v0;
}

id PasscodeSettingsAdapter.declarationKey(forConfiguration:)(uint64_t a1)
{
  unint64_t v2 = self;
  if (qword_100014BA8 != -1) {
    swift_once();
  }
  NSString v3 = sub_10000D0D8();
  id v4 = [v2 newDeclarationKeyWithSubscriberIdentifier:v3 reference:a1];

  return v4;
}

void PasscodeSettingsAdapter.allDeclarationKeys(for:)()
{
}

uint64_t PasscodeSettingsAdapter.applyConfiguration(_:replace:scope:)(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100014BE8 + dword_100014BE8);
  NSString v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *NSString v3 = v1;
  v3[1] = sub_100003930;
  return v5(a1);
}

uint64_t sub_100003930(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100003BC4(void *a1, void *a2, int a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  _OWORD v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  v14 = (uint64_t (*)(id))((char *)&dword_100014BE8 + dword_100014BE8);
  id v9 = a1;
  id v10 = a2;
  id v11 = a5;
  Swift::String v12 = (void *)swift_task_alloc();
  v5[6] = v12;
  *Swift::String v12 = v5;
  v12[1] = sub_100003CA8;
  return v14(v9);
}

uint64_t sub_100003CA8()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 32);
  v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v8 = sub_10000CFB8();
    swift_errorRelease();
    Class isa = 0;
    id v10 = (void *)v8;
  }
  else
  {
    sub_1000082FC(0, &qword_100014D00);
    Class isa = sub_10000D158().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    id v10 = isa;
  }
  id v11 = *(void (***)(void, void, void))(v3 + 40);
  ((void (**)(void, Class, uint64_t))v11)[2](v11, isa, v8);

  _Block_release(v11);
  Swift::String v12 = *(uint64_t (**)(void))(v7 + 8);
  return v12();
}

uint64_t PasscodeSettingsAdapter.remove(_:scope:)(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100014BF8 + dword_100014BF8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100003F28;
  return v5(a1);
}

uint64_t sub_100003F28()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000419C(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v11 = (uint64_t (*)(uint64_t))((char *)&dword_100014BF8 + dword_100014BF8);
  id v7 = a1;
  id v8 = a4;
  id v9 = (void *)swift_task_alloc();
  v4[5] = v9;
  *id v9 = v4;
  v9[1] = sub_100004270;
  return v11((uint64_t)v7);
}

uint64_t sub_100004270()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    id v9 = (void *)sub_10000CFB8();
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

uint64_t sub_10000440C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003184(&qword_100014D48);
    uint64_t v2 = (void *)sub_10000D2F8();
  }
  else
  {
    uint64_t v2 = &_swiftEmptySetSingleton;
  }
  v19 = v2;
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v5) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v10 = (v6 - 1) & v6;
  unint64_t v11 = __clz(__rbit64(v6)) | (v9 << 6);
  for (i = v9; ; unint64_t v11 = __clz(__rbit64(v14)) + (i << 6))
  {
    sub_1000084A8(*(void *)(a1 + 48) + 40 * v11, (uint64_t)&v18);
    if ((swift_dynamicCast() & 1) == 0 || !v17)
    {
      swift_release();
      sub_1000084A0();
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t result = sub_100005E44(v16, v17);
    int64_t v9 = i;
    unint64_t v6 = v10;
    if (v10) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v13 >= v7) {
      goto LABEL_29;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t i = v9 + 1;
    if (!v14)
    {
      int64_t i = v9 + 2;
      if (v9 + 2 >= v7) {
        goto LABEL_29;
      }
      unint64_t v14 = *(void *)(v3 + 8 * i);
      if (!v14)
      {
        int64_t i = v9 + 3;
        if (v9 + 3 >= v7) {
          goto LABEL_29;
        }
        unint64_t v14 = *(void *)(v3 + 8 * i);
        if (!v14)
        {
          int64_t i = v9 + 4;
          if (v9 + 4 >= v7) {
            goto LABEL_29;
          }
          unint64_t v14 = *(void *)(v3 + 8 * i);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v10 = (v14 - 1) & v14;
  }
  int64_t v15 = v9 + 5;
  if (v9 + 5 >= v7)
  {
LABEL_29:
    sub_1000084A0();
    return (uint64_t)v19;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v15);
  if (v14)
  {
    int64_t i = v9 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t i = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (i >= v7) {
      goto LABEL_29;
    }
    unint64_t v14 = *(void *)(v3 + 8 * i);
    ++v15;
    if (v14) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100004660(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003184(&qword_100014D38);
    uint64_t v2 = (void *)sub_10000D388();
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
  unint64_t v6 = (char *)(v2 + 8);
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
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
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
    sub_100008490(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_100008490(v35, v36);
    sub_100008490(v36, &v32);
    uint64_t result = sub_10000D2B8(v2[5]);
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
    uint64_t result = (uint64_t)sub_100008490(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1000084A0();
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

uint64_t PasscodeSettingsAdapter.configurationUI(forConfiguration:scope:)(uint64_t a1)
{
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100014C08 + dword_100014C08);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004AC4;
  return v5(a1);
}

uint64_t sub_100004AC4(char a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  swift_task_dealloc();
  int64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
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

uint64_t sub_100004D5C(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_100014C08 + dword_100014C08);
  id v7 = a1;
  id v8 = a4;
  unint64_t v9 = (void *)swift_task_alloc();
  v4[5] = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_100004E30;
  return v11((uint64_t)v7);
}

uint64_t sub_100004E30(char a1, void *a2)
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
    int64_t v13 = (void *)sub_10000CFB8();
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

id PasscodeSettingsAdapter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id PasscodeSettingsAdapter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PasscodeSettingsAdapter();
  return objc_msgSendSuper2(&v2, "init");
}

id PasscodeSettingsAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PasscodeSettingsAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000050D8(void *a1, void *a2)
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
    uint64_t v9 = sub_10000D298();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1000082FC(0, &qword_100014D08);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_10000D288();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100005378(v7, result + 1);
    long long v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100005570();
      unint64_t v23 = v28;
    }
    else
    {
      unint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100005810((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_10000D218(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_1000082FC(0, &qword_100014D08);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_10000D228();

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
        char v19 = sub_10000D228();

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
    sub_100005894((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100005378(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100003184(&qword_100014D40);
    uint64_t v2 = sub_10000D2E8();
    uint64_t v14 = v2;
    sub_10000D278();
    if (sub_10000D2A8())
    {
      sub_1000082FC(0, &qword_100014D08);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100005570();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_10000D218(*(void *)(v2 + 40));
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
      while (sub_10000D2A8());
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

uint64_t sub_100005570()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_100003184(&qword_100014D40);
  uint64_t v3 = sub_10000D2D8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    long long v28 = v0;
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
                id v1 = v28;
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
      uint64_t result = sub_10000D218(*(void *)(v4 + 40));
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
  *id v1 = v4;
  return result;
}

unint64_t sub_100005810(uint64_t a1, void *a2)
{
  sub_10000D218(a2[5]);
  unint64_t result = sub_10000D268();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100005894(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100005570();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100005A1C();
      goto LABEL_14;
    }
    sub_100005BC8();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_10000D218(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000082FC(0, &qword_100014D08);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_10000D228();

    if (v12)
    {
LABEL_13:
      sub_10000D3B8();
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
        char v15 = sub_10000D228();

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

id sub_100005A1C()
{
  id v1 = v0;
  sub_100003184(&qword_100014D40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000D2C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *id v1 = v4;
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

uint64_t sub_100005BC8()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_100003184(&qword_100014D40);
  uint64_t v3 = sub_10000D2D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  long long v28 = v0;
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
    uint64_t result = sub_10000D218(v19);
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
    id v1 = v28;
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

Swift::Int sub_100005E44(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_10000D418();
  sub_10000D118();
  Swift::Int result = sub_10000D428();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = result & ~v7;
  uint64_t v9 = v5 + 56;
  if ((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v10 = *(void *)(v5 + 48);
    uint64_t v11 = (void *)(v10 + 16 * v8);
    BOOL v12 = *v11 == a1 && v11[1] == a2;
    if (v12 || (Swift::Int result = sub_10000D3A8(), (result & 1) != 0))
    {
LABEL_7:
      unint64_t v13 = (void *)(v10 + 16 * v8);
      Swift::Int result = swift_bridgeObjectRelease();
      *unint64_t v13 = a1;
      v13[1] = a2;
      return result;
    }
    uint64_t v14 = ~v7;
    while (1)
    {
      unint64_t v8 = (v8 + 1) & v14;
      if (((*(void *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        break;
      }
      unint64_t v15 = (void *)(v10 + 16 * v8);
      if (*v15 != a1 || v15[1] != a2)
      {
        Swift::Int result = sub_10000D3A8();
        if ((result & 1) == 0) {
          continue;
        }
      }
      goto LABEL_7;
    }
  }
  if (*(void *)(v5 + 16) >= *(void *)(v5 + 24))
  {
    __break(1u);
    goto LABEL_21;
  }
  *(void *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) |= 1 << v8;
  unint64_t v17 = (void *)(*(void *)(v5 + 48) + 16 * v8);
  *unint64_t v17 = a1;
  v17[1] = a2;
  uint64_t v18 = *(void *)(v5 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  *(void *)(v5 + 16) = v20;
  return result;
}

id sub_100005FB0()
{
  id result = [self sharedConnection];
  if (result)
  {
    id v1 = result;
    NSString v2 = sub_10000D0D8();
    id v3 = [v1 allClientUUIDsForClientType:v2];

    if (v3)
    {
      uint64_t v4 = sub_10000D1C8();

      uint64_t v5 = sub_10000440C(v4);
      swift_bridgeObjectRelease();
      return (id)v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000608C()
{
  id v0 = [self sharedConnection];
  if (!v0) {
    __break(1u);
  }
  id v1 = v0;
  NSString v2 = sub_10000D0D8();
  NSString v3 = sub_10000D0D8();
  id v13 = 0;
  unsigned int v4 = [v1 applyRestrictionDictionary:0 clientType:v2 clientUUID:v3 localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v13];

  if (v4) {
    return v13;
  }
  id v6 = v13;
  sub_10000CFC8();

  swift_willThrow();
  if (qword_100014BA0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10000D038();
  sub_1000083A0(v7, (uint64_t)qword_100015018);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v8 = sub_10000D018();
  os_log_type_t v9 = sub_10000D1F8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138543362;
    swift_errorRetain();
    BOOL v12 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v13 = v12;
    sub_10000D238();
    *uint64_t v11 = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to remove restrictions: %{public}@", v10, 0xCu);
    sub_100003184(&qword_100014D30);
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

void sub_100006348()
{
  uint64_t v1 = v0;
  if (qword_100014BA0 != -1) {
    goto LABEL_50;
  }
  while (1)
  {
    uint64_t v2 = sub_10000D038();
    sub_1000083A0(v2, (uint64_t)qword_100015018);
    NSString v3 = sub_10000D018();
    os_log_type_t v4 = sub_10000D1E8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching applied configuration keys", v5, 2u);
      swift_slowDealloc();
    }

    id v6 = sub_100005FB0();
    if (!v6) {
      break;
    }
    int64_t v7 = 0;
    v34[2] = &_swiftEmptySetSingleton;
    long long v31 = v6 + 56;
    uint64_t v8 = 1 << v6[32];
    uint64_t v9 = -1;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    unint64_t v10 = v9 & *((void *)v6 + 7);
    int64_t v32 = (unint64_t)(v8 + 63) >> 6;
    long long v33 = v6;
    while (v10)
    {
      unint64_t v11 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v12 = v11 | (v7 << 6);
LABEL_22:
      int64_t v16 = (uint64_t *)(*((void *)v6 + 6) + 16 * v12);
      uint64_t v18 = *v16;
      unint64_t v17 = v16[1];
      BOOL v19 = self;
      swift_bridgeObjectRetain();
      NSString v20 = sub_10000D0D8();
      id v21 = [v19 newDeclarationKey:v20];

      if ([v21 isValid])
      {
        swift_bridgeObjectRelease();
        id v22 = [v21 subscriberIdentifier];
        uint64_t v23 = sub_10000D0E8();
        uint64_t v25 = v24;

        if (qword_100014BA8 != -1) {
          swift_once();
        }
        if (v23 == (void)xmmword_100015030 && v25 == *((void *)&xmmword_100015030 + 1))
        {
          swift_bridgeObjectRelease();
LABEL_37:
          sub_1000050D8(v34, v21);

          id v6 = v33;
        }
        else
        {
          char v27 = sub_10000D3A8();
          swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_37;
          }

          id v6 = v33;
        }
      }
      else
      {
        if (qword_100014BA8 != -1) {
          swift_once();
        }
        if (!sub_10000D148((Swift::String)xmmword_100015030)) {
          goto LABEL_8;
        }
        swift_bridgeObjectRetain_n();
        long long v28 = sub_10000D018();
        os_log_type_t v29 = sub_10000D1D8();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = swift_slowAlloc();
          v34[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v30 = 136446210;
          swift_bridgeObjectRetain();
          *(void *)(v30 + 4) = sub_10000AFFC(v18, v17, (uint64_t *)v34);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "Removing invalid clientUUID: %{public}s", (uint8_t *)v30, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        sub_10000608C();
        if (v1)
        {
          swift_errorRelease();

          swift_bridgeObjectRelease();
          uint64_t v1 = 0;
          id v6 = v33;
        }
        else
        {
LABEL_8:

          swift_bridgeObjectRelease();
          id v6 = v33;
        }
      }
    }
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v7 >= v32) {
      goto LABEL_45;
    }
    unint64_t v14 = *(void *)&v31[8 * v7];
    if (v14) {
      goto LABEL_21;
    }
    int64_t v15 = v7 + 1;
    if (v7 + 1 >= v32) {
      goto LABEL_45;
    }
    unint64_t v14 = *(void *)&v31[8 * v15];
    if (v14) {
      goto LABEL_20;
    }
    int64_t v15 = v7 + 2;
    if (v7 + 2 >= v32) {
      goto LABEL_45;
    }
    unint64_t v14 = *(void *)&v31[8 * v15];
    if (v14) {
      goto LABEL_20;
    }
    int64_t v15 = v7 + 3;
    if (v7 + 3 >= v32)
    {
LABEL_45:
      swift_release();
      return;
    }
    unint64_t v14 = *(void *)&v31[8 * v15];
    if (v14)
    {
LABEL_20:
      int64_t v7 = v15;
LABEL_21:
      unint64_t v10 = (v14 - 1) & v14;
      unint64_t v12 = __clz(__rbit64(v14)) + (v7 << 6);
      goto LABEL_22;
    }
    while (1)
    {
      int64_t v7 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      if (v7 >= v32) {
        goto LABEL_45;
      }
      unint64_t v14 = *(void *)&v31[8 * v7];
      ++v15;
      if (v14) {
        goto LABEL_21;
      }
    }
LABEL_49:
    __break(1u);
LABEL_50:
    swift_once();
  }
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_10000D358()) {
    sub_10000BE70((unint64_t)&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000068A0(void *a1, char a2)
{
  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  if ((a2 & 1) == 0)
  {
    id v19 = MCFeaturePasscodeRequired;
    id v20 = [a1 payloadRequirePasscode];
    id v21 = [v20 BOOLValue];

    [v4 MCSetBoolRestriction:v19 value:v21];
    id v22 = MCFeatureAlphanumericPasscodeRequired;
    id v23 = [a1 payloadRequireAlphanumericPasscode];
    id v24 = [v23 BOOLValue];

    [v4 MCSetBoolRestriction:v22 value:v24];
    id v25 = MCFeatureSimplePasscodeAllowed;
    id v26 = [a1 payloadRequireComplexPasscode];
    LODWORD(v24) = [v26 BOOLValue];

    [v4 MCSetBoolRestriction:v25 value:v24 ^ 1];
    id v27 = MCFeatureMinimumPasscodeLength;
    id v28 = [a1 payloadMinimumLength];
    [v4 MCSetValueRestriction:v27 value:v28];

    id v29 = MCFeaturePasscodeMinimumComplexChars;
    id v30 = [a1 payloadMinimumComplexCharacters];
    [v4 MCSetValueRestriction:v29 value:v30];

    id v31 = MCFeatureMaximumFailedPasscodeAttempts;
    id v32 = [a1 payloadMaximumFailedAttempts];
    [v4 MCSetValueRestriction:v31 value:v32];

    id v33 = [a1 payloadMaximumGracePeriodInMinutes];
    if (v33)
    {
      uint64_t v34 = v33;
      id v35 = MCFeaturePasscodeLockGraceTime;
      uint64_t result = (uint64_t)[v34 integerValue];
      if ((unsigned __int128)(result * (__int128)60) >> 64 != (60 * result) >> 63)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      id v36 = [objc_allocWithZone((Class)NSNumber) initWithInteger:60 * result];
      [v4 MCSetValueRestriction:v35 value:v36];
    }
    id v37 = [a1 payloadMaximumInactivityInMinutes];
    if (v37)
    {
      v38 = v37;
      id v39 = MCFeatureAutoLockTime;
      uint64_t result = (uint64_t)[v38 integerValue];
      if ((unsigned __int128)(result * (__int128)60) >> 64 != (60 * result) >> 63)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      id v40 = [objc_allocWithZone((Class)NSNumber) initWithInteger:60 * result];
      [v4 MCSetValueRestriction:v39 value:v40];
    }
    id v41 = [a1 payloadMaximumPasscodeAgeInDays];
    if (v41)
    {
      v42 = v41;
      [v4 MCSetValueRestriction:MCFeatureMaximumPasscodeAgeDays value:v41];
    }
    id v43 = [a1 payloadPasscodeReuseLimit];
    if (!v43) {
      goto LABEL_17;
    }
    id v6 = v43;
    [v4 MCSetValueRestriction:MCFeaturePasscodeHistoryCount value:v43];
LABEL_16:

LABEL_17:
    v4;
    uint64_t result = sub_10000D058();
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)[self filterForUserEnrollmentWithDeclaration:a1];
  if (result)
  {
    id v6 = (void *)result;
    self;
    int64_t v7 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v8 = MCFeaturePasscodeRequired;
    id v9 = [v7 payloadRequirePasscode];
    id v10 = [v9 BOOLValue];

    [v4 MCSetBoolRestriction:v8 value:v10];
    id v11 = MCFeatureSimplePasscodeAllowed;
    id v12 = [v7 payloadRequireComplexPasscode];
    LODWORD(v10) = [v12 BOOLValue];

    [v4 MCSetBoolRestriction:v11 value:v10 ^ 1];
    id v13 = MCFeatureMinimumPasscodeLength;
    id v14 = [v7 payloadMinimumLength];
    [v4 MCSetValueRestriction:v13 value:v14];

    id v15 = [v7 payloadMaximumInactivityInMinutes];
    if (v15)
    {
      int64_t v16 = v15;
      id v17 = MCFeatureAutoLockTime;
      uint64_t result = (uint64_t)[v16 integerValue];
      if ((unsigned __int128)(result * (__int128)60) >> 64 == (60 * result) >> 63)
      {
        id v18 = [objc_allocWithZone((Class)NSNumber) initWithInteger:60 * result];
        [v4 MCSetValueRestriction:v17 value:v18];

        goto LABEL_16;
      }
      __break(1u);
      goto LABEL_19;
    }
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
  return result;
}

id sub_100006F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSString a5)
{
  id v7 = [self sharedConnection];
  if (!v7) {
    __break(1u);
  }
  id v8 = v7;
  sub_100004660(a1);
  v9.super.Class isa = sub_10000D048().super.isa;
  swift_bridgeObjectRelease();
  NSString v10 = sub_10000D0D8();
  NSString v11 = sub_10000D0D8();
  if (a5) {
    a5 = sub_10000D0D8();
  }
  id v21 = 0;
  unsigned int v12 = [v8 applyRestrictionDictionary:v9.super.isa clientType:v10 clientUUID:v11 localizedClientDescription:a5 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v21];

  if (v12) {
    return v21;
  }
  id v14 = v21;
  sub_10000CFC8();

  swift_willThrow();
  if (qword_100014BA0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10000D038();
  sub_1000083A0(v15, (uint64_t)qword_100015018);
  swift_errorRetain();
  swift_errorRetain();
  int64_t v16 = sub_10000D018();
  os_log_type_t v17 = sub_10000D1F8();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    id v19 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 138543362;
    swift_errorRetain();
    id v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v21 = v20;
    sub_10000D238();
    void *v19 = v20;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unable to apply restrictions: %{public}@", v18, 0xCu);
    sub_100003184(&qword_100014D30);
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

uint64_t sub_100007220(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100007240, 0, 0);
}

uint64_t sub_100007240()
{
  uint64_t v45 = v0;
  uint64_t v1 = (id *)(v0 + 24);
  uint64_t v2 = self;
  if (qword_100014BA8 != -1) {
    swift_once();
  }
  id v3 = *v1;
  NSString v4 = sub_10000D0D8();
  id v5 = [v2 newDeclarationKeyWithSubscriberIdentifier:v4 reference:v3];

  if (qword_100014BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000D038();
  sub_1000083A0(v6, (uint64_t)qword_100015018);
  id v7 = v5;
  id v8 = sub_10000D018();
  os_log_type_t v9 = sub_10000D1E8();
  uint64_t v43 = v0;
  if (os_log_type_enabled(v8, v9))
  {
    v42 = (id *)(v0 + 24);
    NSString v10 = (uint64_t *)(v0 + 16);
    NSString v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)NSString v11 = 136446210;
    unsigned int v12 = v7;
    id v13 = [v7 key];
    uint64_t v14 = sub_10000D0E8();
    unint64_t v16 = v15;

    id v7 = v12;
    *NSString v10 = sub_10000AFFC(v14, v16, &v44);
    uint64_t v1 = v42;
    sub_10000D238();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Applying configuration with key: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v17 = [*v1 declaration];
  self;
  uint64_t v18 = swift_dynamicCastObjCClass();
  id v19 = *v1;
  if (v18)
  {
    id v20 = (void *)v18;
    id v21 = [*v1 store];
    uint64_t v22 = sub_1000068A0(v20, [v21 type] == 0);
    id v23 = [v7 key];
    uint64_t v24 = sub_10000D0E8();
    uint64_t v26 = v25;

    id v27 = [v21 name];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = sub_10000D0E8();
      id v31 = v30;
    }
    else
    {
      uint64_t v29 = 0;
      id v31 = 0;
    }
    sub_100006F04(v22, v24, v26, v29, v31);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v41 = *(uint64_t (**)(void *))(v43 + 8);
    return v41(&_swiftEmptyArrayStorage);
  }
  else
  {

    id v32 = [v19 declaration];
    id v33 = [v32 declarationType];

    uint64_t v34 = sub_10000D0E8();
    id v35 = v7;
    uint64_t v37 = v36;

    sub_1000083D8();
    swift_allocError();
    *(void *)uint64_t v38 = v34;
    *(void *)(v38 + 8) = v37;
    *(unsigned char *)(v38 + 16) = 1;
    swift_willThrow();

    id v39 = *(uint64_t (**)(void))(v43 + 8);
    return v39();
  }
}

uint64_t sub_100007700(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100007720, 0, 0);
}

uint64_t sub_100007720()
{
  uint64_t v19 = v0;
  if (qword_100014BA0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = sub_10000D038();
  sub_1000083A0(v2, (uint64_t)qword_100015018);
  id v3 = v1;
  NSString v4 = sub_10000D018();
  os_log_type_t v5 = sub_10000D1E8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = *(void **)(v0 + 24);
  id v8 = &PasscodeSettingsAdapter;
  if (v6)
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 136446210;
    id v10 = [v7 key];
    uint64_t v11 = sub_10000D0E8();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    id v8 = &PasscodeSettingsAdapter;
    *(void *)(v0 + 16) = sub_10000AFFC(v14, v13, &v18);
    sub_10000D238();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removing configuration with key: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v15 = [*(id *)(v0 + 24) (SEL)v8[263].count];
  sub_10000D0E8();

  sub_10000608C();
  swift_bridgeObjectRelease();
  unint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_100007984(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_1000079A4, 0, 0);
}

void sub_1000079A4()
{
  uint64_t v39 = v0;
  if (qword_100014BA0 != -1) {
    swift_once();
  }
  uint64_t v1 = (id *)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = sub_10000D038();
  sub_1000083A0(v3, (uint64_t)qword_100015018);
  id v4 = v2;
  os_log_type_t v5 = sub_10000D018();
  os_log_type_t v6 = sub_10000D1F8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  id v8 = *(void **)(v0 + 24);
  os_log_type_t v9 = &PasscodeSettingsAdapter;
  if (v7)
  {
    uint64_t v36 = (uint64_t *)(v0 + 16);
    id v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = v0;
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)id v10 = 136446210;
    id v11 = [v8 declaration];
    id v12 = [v11 declarationIdentifier];

    uint64_t v13 = sub_10000D0E8();
    unint64_t v15 = v14;

    *uint64_t v36 = sub_10000AFFC(v13, v15, &v38);
    sub_10000D238();

    os_log_type_t v9 = &PasscodeSettingsAdapter;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Get configuration UI for: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v0 = v37;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v16 = [*v1 (SEL)v9[257].count];
  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    id v19 = *v1;
    id v20 = v16;
    id v21 = [v19 store];
    if ([v21 type])
    {
    }
    else
    {
      id v33 = [self filterForUserEnrollmentWithDeclaration:v18];

      if (!v33)
      {
        __break(1u);
        return;
      }

      self;
      uint64_t v18 = (void *)swift_dynamicCastObjCClassUnconditional();
    }
    id v34 = sub_100008B1C(v18);

    id v35 = *(void (**)(uint64_t, id))(v0 + 8);
    v35(1, v34);
  }
  else
  {

    uint64_t v22 = sub_10000D018();
    os_log_type_t v23 = sub_10000D1F8();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Invalid configuration type in configurationUI", v24, 2u);
      swift_slowDealloc();
    }
    uint64_t v25 = *(void **)(v0 + 24);

    id v26 = [v25 (SEL)v9[257].count];
    id v27 = [v26 declarationType];

    uint64_t v28 = sub_10000D0E8();
    uint64_t v30 = v29;

    sub_1000083D8();
    swift_allocError();
    *(void *)uint64_t v31 = v28;
    *(void *)(v31 + 8) = v30;
    *(unsigned char *)(v31 + 16) = 1;
    swift_willThrow();
    id v32 = *(void (**)(void))(v0 + 8);
    v32(0);
  }
}

uint64_t type metadata accessor for PasscodeSettingsAdapter()
{
  return self;
}

uint64_t sub_100007E34()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  os_log_type_t v5 = (void *)v0[4];
  id v4 = (void *)v0[5];
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *os_log_type_t v6 = v1;
  v6[1] = sub_100003F28;
  BOOL v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_100014CA0 + dword_100014CA0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_100007EF8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1000087E4;
  os_log_type_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100014F80 + dword_100014F80);
  return v6(v2, v3, v4);
}

uint64_t sub_100007FBC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_1000087E4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100014F90 + dword_100014F90);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000808C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000080D4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *os_log_type_t v6 = v1;
  v6[1] = sub_1000087E4;
  BOOL v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_100014CC0 + dword_100014CC0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000819C()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000081EC()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  os_log_type_t v6 = (void *)v0[6];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *BOOL v7 = v1;
  v7[1] = sub_1000087E4;
  uint64_t v8 = (uint64_t (*)(void *, void *, int, void *, void *))((char *)&dword_100014CE0 + dword_100014CE0);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_1000082BC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000082FC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100008338()
{
  unint64_t result = qword_100014D10;
  if (!qword_100014D10)
  {
    sub_1000082FC(255, &qword_100014D08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014D10);
  }
  return result;
}

uint64_t sub_1000083A0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000083D8()
{
  unint64_t result = qword_100014D20;
  if (!qword_100014D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014D20);
  }
  return result;
}

uint64_t *sub_10000842C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

_OWORD *sub_100008490(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000084A0()
{
  return swift_release();
}

uint64_t sub_1000084A8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100008508()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for PasscodeSettingsAdapter.AdapterError()
{
  return sub_100008520();
}

uint64_t sub_100008520()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s26PasscodeSettingsSubscriber23PasscodeSettingsAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100008508();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PasscodeSettingsAdapter.AdapterError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100008508();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100008520();
  return a1;
}

__n128 initializeWithTake for PasscodeSettingsAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PasscodeSettingsAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100008520();
  return a1;
}

uint64_t getEnumTagSinglePayload for PasscodeSettingsAdapter.AdapterError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PasscodeSettingsAdapter.AdapterError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1000086B4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1000086C0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PasscodeSettingsAdapter.AdapterError()
{
  return &type metadata for PasscodeSettingsAdapter.AdapterError;
}

unint64_t sub_1000086E4()
{
  unint64_t result = qword_100014D50;
  if (!qword_100014D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014D50);
  }
  return result;
}

unint64_t sub_10000873C()
{
  unint64_t result = qword_100014D58;
  if (!qword_100014D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014D58);
  }
  return result;
}

unint64_t sub_100008790()
{
  unint64_t result = qword_100014D60;
  if (!qword_100014D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014D60);
  }
  return result;
}

char *sub_1000087E8(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003184((uint64_t *)&unk_100014E40);
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
    sub_100008A10(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000088F8()
{
  return sub_10000D0F8();
}

uint64_t sub_100008A10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100003184(&qword_100014E38);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10000D398();
  __break(1u);
  return result;
}

id sub_100008B1C(void *a1)
{
  sub_10000D0A8();
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v141 = (char *)&v137 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v140 = (char *)&v137 - v5;
  __chkstk_darwin(v4);
  v139 = (char *)&v137 - v6;
  uint64_t v7 = sub_10000CFE8();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v137 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000D0C8();
  __chkstk_darwin(v10 - 8);
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v144 = sub_10000D0F8();
  uint64_t v12 = v11;
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v142 = sub_10000D0F8();
  uint64_t v14 = v13;
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v15 = sub_10000D0F8();
  uint64_t v17 = v16;
  id v146 = a1;
  id v18 = [a1 payloadRequirePasscode];
  unsigned int v19 = [v18 BOOLValue];

  if (v19)
  {
    sub_100003184(&qword_100015010);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_10000DB90;
    *(void *)(v20 + 32) = v15;
    *(void *)(v20 + 40) = v17;
    swift_bridgeObjectRetain();
    *(void *)(v20 + 48) = sub_1000088F8();
    *(void *)(v20 + 56) = v21;
    uint64_t v22 = sub_1000087E8(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    unint64_t v24 = *((void *)v22 + 2);
    unint64_t v23 = *((void *)v22 + 3);
    uint64_t v25 = v22;
    if (v24 >= v23 >> 1) {
      uint64_t v25 = sub_1000087E8((char *)(v23 > 1), v24 + 1, 1, v22);
    }
    *((void *)v25 + 2) = v24 + 1;
    *(void *)&v25[8 * v24 + 32] = v20;
  }
  else
  {
    uint64_t v25 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v26 = sub_10000D0F8();
  uint64_t v28 = v27;
  id v29 = [v146 payloadRequireAlphanumericPasscode];
  unsigned int v30 = [v29 BOOLValue];

  if (v30)
  {
    sub_100003184(&qword_100015010);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_10000DB90;
    *(void *)(v31 + 32) = v26;
    *(void *)(v31 + 40) = v28;
    swift_bridgeObjectRetain();
    *(void *)(v31 + 48) = sub_1000088F8();
    *(void *)(v31 + 56) = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
    }
    unint64_t v34 = *((void *)v25 + 2);
    unint64_t v33 = *((void *)v25 + 3);
    if (v34 >= v33 >> 1) {
      uint64_t v25 = sub_1000087E8((char *)(v33 > 1), v34 + 1, 1, v25);
    }
    *((void *)v25 + 2) = v34 + 1;
    *(void *)&v25[8 * v34 + 32] = v31;
  }
  swift_bridgeObjectRelease();
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v35 = sub_10000D0F8();
  uint64_t v37 = v36;
  id v38 = [v146 payloadRequireComplexPasscode];
  unsigned int v39 = [v38 BOOLValue];

  uint64_t v145 = v12;
  uint64_t v143 = v14;
  if (v39)
  {
    sub_100003184(&qword_100015010);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_10000DB90;
    *(void *)(v40 + 32) = v35;
    *(void *)(v40 + 40) = v37;
    swift_bridgeObjectRetain();
    *(void *)(v40 + 48) = sub_1000088F8();
    *(void *)(v40 + 56) = v41;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
    }
    unint64_t v43 = *((void *)v25 + 2);
    unint64_t v42 = *((void *)v25 + 3);
    if (v43 >= v42 >> 1) {
      uint64_t v25 = sub_1000087E8((char *)(v42 > 1), v43 + 1, 1, v25);
    }
    *((void *)v25 + 2) = v43 + 1;
    *(void *)&v25[8 * v43 + 32] = v40;
  }
  swift_bridgeObjectRelease();
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v44 = sub_10000D0F8();
  uint64_t v46 = v45;
  id v47 = [v146 payloadMinimumLength];
  sub_100009E5C();
  v48.super.super.Class isa = sub_10000D208(0).super.super.isa;
  if (v47)
  {
    Class isa = (Class)v47;
    if ((sub_10000D228() & 1) == 0)
    {
      sub_100003184(&qword_100015010);
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = xmmword_10000DB90;
      *(void *)(v50 + 32) = v44;
      *(void *)(v50 + 40) = v46;
      v138 = v46;
      swift_bridgeObjectRetain();
      id v51 = [(objc_class *)isa stringValue];
      uint64_t v52 = sub_10000D0E8();
      v53 = v25;
      uint64_t v55 = v54;

      *(void *)(v50 + 48) = v52;
      *(void *)(v50 + 56) = v55;
      uint64_t v25 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = sub_1000087E8(0, *((void *)v53 + 2) + 1, 1, v53);
      }
      unint64_t v57 = *((void *)v25 + 2);
      unint64_t v56 = *((void *)v25 + 3);
      if (v57 >= v56 >> 1) {
        uint64_t v25 = sub_1000087E8((char *)(v56 > 1), v57 + 1, 1, v25);
      }
      *((void *)v25 + 2) = v57 + 1;
      *(void *)&v25[8 * v57 + 32] = v50;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    Class isa = v48.super.super.isa;
  }

  sub_10000D068();
  sub_10000CFD8();
  uint64_t v58 = sub_10000D0F8();
  uint64_t v60 = v59;
  id v61 = [v146 payloadMinimumComplexCharacters];
  v62.super.super.Class isa = sub_10000D208(0).super.super.isa;
  if (v61)
  {
    Class v63 = (Class)v61;
    if ((sub_10000D228() & 1) == 0)
    {
      v138 = v9;
      sub_100003184(&qword_100015010);
      uint64_t v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = xmmword_10000DB90;
      *(void *)(v64 + 32) = v58;
      *(void *)(v64 + 40) = v60;
      swift_bridgeObjectRetain();
      id v65 = [(objc_class *)v63 stringValue];
      uint64_t v66 = sub_10000D0E8();
      v67 = v25;
      uint64_t v69 = v68;

      *(void *)(v64 + 48) = v66;
      *(void *)(v64 + 56) = v69;
      uint64_t v25 = v67;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = sub_1000087E8(0, *((void *)v67 + 2) + 1, 1, v67);
      }
      unint64_t v71 = *((void *)v25 + 2);
      unint64_t v70 = *((void *)v25 + 3);
      if (v71 >= v70 >> 1) {
        uint64_t v25 = sub_1000087E8((char *)(v70 > 1), v71 + 1, 1, v25);
      }
      *((void *)v25 + 2) = v71 + 1;
      *(void *)&v25[8 * v71 + 32] = v64;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    Class v63 = v62.super.super.isa;
  }

  sub_10000D068();
  sub_10000CFD8();
  uint64_t v72 = sub_10000D0F8();
  uint64_t v74 = v73;
  id v75 = [v146 payloadMaximumFailedAttempts];
  v76.super.super.Class isa = sub_10000D208(11).super.super.isa;
  if (v75)
  {
    Class v77 = (Class)v75;
    if ((sub_10000D228() & 1) == 0)
    {
      sub_100003184(&qword_100015010);
      uint64_t v78 = swift_allocObject();
      *(_OWORD *)(v78 + 16) = xmmword_10000DB90;
      *(void *)(v78 + 32) = v72;
      *(void *)(v78 + 40) = v74;
      swift_bridgeObjectRetain();
      id v79 = [(objc_class *)v77 stringValue];
      uint64_t v80 = sub_10000D0E8();
      uint64_t v82 = v81;

      *(void *)(v78 + 48) = v80;
      *(void *)(v78 + 56) = v82;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
      }
      unint64_t v84 = *((void *)v25 + 2);
      unint64_t v83 = *((void *)v25 + 3);
      if (v84 >= v83 >> 1) {
        uint64_t v25 = sub_1000087E8((char *)(v83 > 1), v84 + 1, 1, v25);
      }
      *((void *)v25 + 2) = v84 + 1;
      *(void *)&v25[8 * v84 + 32] = v78;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    Class v77 = v76.super.super.isa;
  }

  sub_10000D068();
  sub_10000CFD8();
  uint64_t v85 = sub_10000D0F8();
  uint64_t v87 = v86;
  id v88 = [v146 payloadMaximumGracePeriodInMinutes];
  if (v88)
  {
    id v89 = v88;
    sub_10000D098();
    v148._countAndFlagsBits = 0;
    v148._object = (void *)0xE000000000000000;
    sub_10000D088(v148);
    id v147 = [v89 integerValue];
    sub_10000D078();
    v149._countAndFlagsBits = 0x554E494D2E495520;
    v149._object = (void *)0xEB00000000534554;
    sub_10000D088(v149);
    sub_10000D0B8();
    sub_10000CFD8();
    uint64_t v90 = sub_10000D0F8();
    uint64_t v92 = v91;

    if ((v90 || v92 != 0xE000000000000000) && (sub_10000D3A8() & 1) == 0)
    {
      sub_100003184(&qword_100015010);
      uint64_t v93 = swift_allocObject();
      *(_OWORD *)(v93 + 16) = xmmword_10000DB90;
      *(void *)(v93 + 32) = v85;
      *(void *)(v93 + 40) = v87;
      *(void *)(v93 + 48) = v90;
      *(void *)(v93 + 56) = v92;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
      }
      unint64_t v95 = *((void *)v25 + 2);
      unint64_t v94 = *((void *)v25 + 3);
      if (v95 >= v94 >> 1) {
        uint64_t v25 = sub_1000087E8((char *)(v94 > 1), v95 + 1, 1, v25);
      }
      *((void *)v25 + 2) = v95 + 1;
      *(void *)&v25[8 * v95 + 32] = v93;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v96 = sub_10000D0F8();
  uint64_t v98 = v97;
  id v99 = [v146 payloadMaximumInactivityInMinutes];
  if (v99)
  {
    id v100 = v99;
    sub_10000D098();
    v150._countAndFlagsBits = 0;
    v150._object = (void *)0xE000000000000000;
    sub_10000D088(v150);
    id v147 = [v100 integerValue];
    sub_10000D078();
    v151._countAndFlagsBits = 0x554E494D2E495520;
    v151._object = (void *)0xEB00000000534554;
    sub_10000D088(v151);
    sub_10000D0B8();
    sub_10000CFD8();
    uint64_t v101 = sub_10000D0F8();
    uint64_t v103 = v102;

    if ((v101 || v103 != 0xE000000000000000) && (sub_10000D3A8() & 1) == 0)
    {
      sub_100003184(&qword_100015010);
      uint64_t v104 = swift_allocObject();
      *(_OWORD *)(v104 + 16) = xmmword_10000DB90;
      *(void *)(v104 + 32) = v96;
      *(void *)(v104 + 40) = v98;
      *(void *)(v104 + 48) = v101;
      *(void *)(v104 + 56) = v103;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
      }
      unint64_t v106 = *((void *)v25 + 2);
      unint64_t v105 = *((void *)v25 + 3);
      if (v106 >= v105 >> 1) {
        uint64_t v25 = sub_1000087E8((char *)(v105 > 1), v106 + 1, 1, v25);
      }
      *((void *)v25 + 2) = v106 + 1;
      *(void *)&v25[8 * v106 + 32] = v104;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v107 = sub_10000D0F8();
  uint64_t v109 = v108;
  id v110 = [v146 payloadMaximumPasscodeAgeInDays];
  if (v110)
  {
    id v111 = v110;
    sub_10000D098();
    v152._countAndFlagsBits = 0;
    v152._object = (void *)0xE000000000000000;
    sub_10000D088(v152);
    id v147 = [v111 integerValue];
    sub_10000D078();
    v153._countAndFlagsBits = 0x535941442E495520;
    v153._object = (void *)0xE800000000000000;
    sub_10000D088(v153);
    sub_10000D0B8();
    sub_10000CFD8();
    uint64_t v112 = sub_10000D0F8();
    uint64_t v114 = v113;

    if ((v112 || v114 != 0xE000000000000000) && (sub_10000D3A8() & 1) == 0)
    {
      sub_100003184(&qword_100015010);
      uint64_t v115 = swift_allocObject();
      *(_OWORD *)(v115 + 16) = xmmword_10000DB90;
      *(void *)(v115 + 32) = v107;
      *(void *)(v115 + 40) = v109;
      *(void *)(v115 + 48) = v112;
      *(void *)(v115 + 56) = v114;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
      }
      unint64_t v117 = *((void *)v25 + 2);
      unint64_t v116 = *((void *)v25 + 3);
      if (v117 >= v116 >> 1) {
        uint64_t v25 = sub_1000087E8((char *)(v116 > 1), v117 + 1, 1, v25);
      }
      *((void *)v25 + 2) = v117 + 1;
      *(void *)&v25[8 * v117 + 32] = v115;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_10000D068();
  sub_10000CFD8();
  uint64_t v118 = sub_10000D0F8();
  uint64_t v120 = v119;
  id v121 = [v146 payloadPasscodeReuseLimit];
  if (v121)
  {
    v122 = v121;
    sub_100003184(&qword_100015010);
    uint64_t v123 = swift_allocObject();
    *(_OWORD *)(v123 + 16) = xmmword_10000DB90;
    *(void *)(v123 + 32) = v118;
    *(void *)(v123 + 40) = v120;
    id v124 = v122;
    swift_bridgeObjectRetain();
    id v125 = [v124 stringValue];
    uint64_t v126 = sub_10000D0E8();
    uint64_t v128 = v127;

    *(void *)(v123 + 48) = v126;
    *(void *)(v123 + 56) = v128;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = sub_1000087E8(0, *((void *)v25 + 2) + 1, 1, v25);
    }
    unint64_t v130 = *((void *)v25 + 2);
    unint64_t v129 = *((void *)v25 + 3);
    if (v130 >= v129 >> 1) {
      uint64_t v25 = sub_1000087E8((char *)(v129 > 1), v130 + 1, 1, v25);
    }
    *((void *)v25 + 2) = v130 + 1;
    *(void *)&v25[8 * v130 + 32] = v123;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v131 = self;
  NSString v132 = sub_10000D0D8();
  swift_bridgeObjectRelease();
  NSString v133 = sub_10000D0D8();
  swift_bridgeObjectRelease();
  sub_100003184(&qword_100014E38);
  Class v134 = sub_10000D158().super.isa;
  swift_bridgeObjectRelease();
  id v135 = [v131 configurationUIWithTitle:v132 description:v133 details:v134];

  return v135;
}

unint64_t sub_100009E5C()
{
  unint64_t result = qword_100014E30;
  if (!qword_100014E30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100014E30);
  }
  return result;
}

id sub_10000A038()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PasscodeSettingsApplicator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PasscodeSettingsApplicator()
{
  return self;
}

uint64_t sub_10000A090()
{
  uint64_t v0 = sub_10000D038();
  sub_10000842C(v0, qword_100015040);
  sub_1000083A0(v0, (uint64_t)qword_100015040);
  type metadata accessor for PasscodeSettingsStatus();
  sub_100003184(&qword_100015008);
  sub_10000D108();
  return sub_10000D028();
}

unint64_t sub_10000A180(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003184(&qword_100014FF8);
  uint64_t v2 = sub_10000D388();
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
    sub_10000CF04(v6, (uint64_t)&v15, &qword_100015000);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000B654(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_10000CD94((uint64_t)&v17, v3[7] + 32 * result);
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

unint64_t sub_10000A2B8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003184(&qword_100014FC8);
  uint64_t v2 = sub_10000D388();
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
    sub_10000CF04(v6, (uint64_t)&v15, &qword_100014FD0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000B654(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100008490(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10000A574(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v7 = sub_10000D168();
  v4[5] = v7;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)&dword_100014FB0 + dword_100014FB0);
  id v8 = a2;
  id v9 = a4;
  char v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *char v10 = v4;
  v10[1] = sub_10000A664;
  return v12(v7);
}

uint64_t sub_10000A664()
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
    uint64_t v7 = sub_10000CFB8();
    swift_errorRelease();
    Class isa = 0;
    id v9 = (void *)v7;
  }
  else
  {
    Class isa = sub_10000D048().super.isa;
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

id sub_10000A880()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PasscodeSettingsStatus();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PasscodeSettingsStatus()
{
  return self;
}

uint64_t sub_10000A8DC()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000A92C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100003F28;
  uint64_t v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_100014F70 + dword_100014F70);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000A9EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000087E4;
  return v6();
}

uint64_t sub_10000AABC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1000087E4;
  return v7();
}

uint64_t sub_10000AB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D1A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000D198();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000CDFC(a1, &qword_100014C98);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000D188();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000AD38(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000AE14;
  return v6(a1);
}

uint64_t sub_10000AE14()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000AF0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AF44(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100003F28;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100014FA0 + dword_100014FA0);
  return v6(a1, v4);
}

uint64_t sub_10000AFFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B0D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000CEA8((uint64_t)v12, *a3);
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
      sub_10000CEA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000CE58((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B0D0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000D248();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000B28C(a5, a6);
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
  uint64_t v8 = sub_10000D338();
  if (!v8)
  {
    sub_10000D348();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000D398();
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

uint64_t sub_10000B28C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B324(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B504(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B504(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B324(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000B49C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000D318();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000D348();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000D138();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000D398();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000D348();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000B49C(uint64_t a1, uint64_t a2)
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
  sub_100003184(&qword_100014FC0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000B504(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003184(&qword_100014FC0);
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
  uint64_t result = sub_10000D398();
  __break(1u);
  return result;
}

unint64_t sub_10000B654(uint64_t a1, uint64_t a2)
{
  sub_10000D418();
  sub_10000D118();
  Swift::Int v4 = sub_10000D428();

  return sub_10000B6CC(a1, a2, v4);
}

unint64_t sub_10000B6CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000D3A8() & 1) == 0)
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
      while (!v14 && (sub_10000D3A8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000B7B0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003184(&qword_100014FC8);
  uint64_t v6 = sub_10000D378();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
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
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
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
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100008490(v24, v35);
      }
      else
      {
        sub_10000CEA8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_10000D418();
      sub_10000D118();
      uint64_t result = sub_10000D428();
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100008490(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000BAB0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10000D258();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000D418();
        swift_bridgeObjectRetain();
        sub_10000D118();
        Swift::Int v10 = sub_10000D428();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_10000BC88()
{
  uint64_t v1 = v0;
  sub_100003184(&qword_100014FC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000D368();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10000CEA8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_100008490(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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

void sub_10000BE70(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10000D358();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100003184(&qword_100014D40);
      uint64_t v3 = (void *)sub_10000D2F8();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_10000D358();
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
  unint64_t v7 = (char *)(v3 + 7);
  uint64_t v43 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = sub_10000D328();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = sub_10000D218(v3[5]);
        uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)&v7[8 * v15] = v17 | v16;
        *(void *)(v3[6] + 8 * v14) = v11;
        uint64_t v23 = v3[2];
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        v3[2] = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_1000082FC(0, &qword_100014D08);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = sub_10000D228();

      if ((v19 & 1) == 0)
      {
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
          char v22 = sub_10000D228();

          if (v22) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v41 = a1 + 32;
  uint64_t v42 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(v41 + 8 * v25);
    Swift::Int v28 = sub_10000D218(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_1000082FC(0, &qword_100014D08);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_10000D228();

      if (v35)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = ~v29;
      while (1)
      {
        unint64_t v30 = (v30 + 1) & v36;
        unint64_t v31 = v30 >> 6;
        uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
        uint64_t v33 = 1 << v30;
        if ((v32 & (1 << v30)) == 0) {
          break;
        }
        id v37 = *(id *)(v3[6] + 8 * v30);
        char v38 = sub_10000D228();

        if (v38) {
          goto LABEL_24;
        }
      }
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
LABEL_25:
    if (++v25 == v43) {
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

Swift::Int sub_10000C1CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003184(&qword_100014D48);
    uint64_t v3 = sub_10000D2F8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_10000D418();
      swift_bridgeObjectRetain();
      sub_10000D118();
      Swift::Int result = sub_10000D428();
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
        if (v17 || (Swift::Int result = sub_10000D3A8(), (result & 1) != 0))
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
          char v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_10000D3A8();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *id v21 = v8;
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

Swift::Int sub_10000C370()
{
  sub_100003184(&qword_100015010);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000DB90;
  sub_1000082FC(0, &qword_100014FE0);
  id v1 = [(id)swift_getObjCClassFromMetadata() statusItemType];
  uint64_t v2 = sub_10000D0E8();
  uint64_t v4 = v3;

  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = v4;
  sub_1000082FC(0, (unint64_t *)&unk_100014FE8);
  id v5 = [(id)swift_getObjCClassFromMetadata() statusItemType];
  uint64_t v6 = sub_10000D0E8();
  uint64_t v8 = v7;

  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  Swift::Int v9 = sub_10000C1CC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v9;
}

unint64_t sub_10000C488()
{
  id v0 = [self sharedConnection];
  if (v0)
  {
    id v1 = v0;
    id v24 = 0;
    unsigned int v2 = [v0 currentPasscodeIsCompliantWithGlobalRestrictionsOutError:&v24];
    char v3 = v2;
    if (v2)
    {
      id v4 = v24;
    }
    else
    {
      id v6 = v24;
      sub_10000CFC8();

      swift_willThrow();
      if (qword_100014BB0 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_10000D038();
      sub_1000083A0(v7, (uint64_t)qword_100015040);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v8 = sub_10000D018();
      os_log_type_t v9 = sub_10000D1F8();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        unint64_t v11 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 138543362;
        swift_errorRetain();
        unint64_t v12 = (void *)_swift_stdlib_bridgeErrorToNSError();
        id v24 = v12;
        sub_10000D238();
        *unint64_t v11 = v12;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Compliance check %{public}@", v10, 0xCu);
        sub_100003184(&qword_100014D30);
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
    unsigned __int8 v13 = [v1 isPasscodeSet];
    sub_100003184(&qword_100014FD8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000DB90;
    sub_1000082FC(0, &qword_100014FE0);
    id v15 = [(id)swift_getObjCClassFromMetadata() statusItemType];
    uint64_t v16 = sub_10000D0E8();
    uint64_t v18 = v17;

    *(void *)(inited + 32) = v16;
    *(void *)(inited + 40) = v18;
    *(void *)(inited + 72) = &type metadata for Bool;
    *(unsigned char *)(inited + 48) = v3;
    sub_1000082FC(0, (unint64_t *)&unk_100014FE8);
    id v19 = [(id)swift_getObjCClassFromMetadata() statusItemType];
    uint64_t v20 = sub_10000D0E8();
    uint64_t v22 = v21;

    *(void *)(inited + 80) = v20;
    *(void *)(inited + 88) = v22;
    *(void *)(inited + 120) = &type metadata for Bool;
    *(unsigned char *)(inited + 96) = v13;
    unint64_t v23 = sub_10000A180(inited);

    return v23;
  }
  else
  {
    return sub_10000A180((uint64_t)&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_10000C828(uint64_t a1)
{
  *(void *)(v1 + 112) = a1;
  return _swift_task_switch(sub_10000C848, 0, 0);
}

uint64_t sub_10000C848()
{
  uint64_t v44 = v0;
  unint64_t v1 = (unint64_t)(v0 + 2);
  if (qword_100014BB0 != -1) {
LABEL_40:
  }
    swift_once();
  uint64_t v2 = sub_10000D038();
  sub_1000083A0(v2, (uint64_t)qword_100015040);
  swift_bridgeObjectRetain_n();
  char v3 = sub_10000D018();
  os_log_type_t v4 = sub_10000D1E8();
  unint64_t v39 = v1;
  uint64_t v40 = v0;
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = (void *)swift_slowAlloc();
    *(_DWORD *)id v5 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10000D178();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    uint64_t v9 = v6;
    unint64_t v1 = v39;
    v0[2] = sub_10000AFFC(v9, v8, (uint64_t *)&v43);
    sub_10000D238();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Querying status for key paths:%{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v10 = v0[14];
  unint64_t v11 = sub_10000C488();
  unint64_t v12 = (void *)sub_10000A2B8((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v13 = *(void *)(v10 + 16);
  if (!v13)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    id v37 = (uint64_t (*)(void *))v0[1];
    return v37(v12);
  }
  uint64_t v14 = v0 + 6;
  uint64_t v42 = v0 + 10;
  id v15 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  unint64_t v41 = v0 + 6;
  while (1)
  {
    if (!*(void *)(v11 + 16)) {
      goto LABEL_8;
    }
    uint64_t v17 = *(v15 - 1);
    uint64_t v16 = *v15;
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_10000B654(v17, v16);
    if (v19) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_8:
    v15 += 2;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
  }
  sub_10000CF04(*(void *)(v11 + 56) + 32 * v18, (uint64_t)v14, &qword_100014FB8);
  sub_10000CD94((uint64_t)v14, v1);
  sub_10000CF04(v1, (uint64_t)v14, &qword_100014FB8);
  if (!v0[9])
  {
    sub_10000CDFC((uint64_t)v14, &qword_100014FB8);
    swift_bridgeObjectRetain();
    unint64_t v27 = sub_10000B654(v17, v16);
    char v29 = v28;
    swift_bridgeObjectRelease();
    if (v29)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v43 = v12;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_10000BC88();
        unint64_t v12 = v43;
      }
      swift_bridgeObjectRelease();
      uint64_t v31 = (uint64_t)v42;
      sub_100008490((_OWORD *)(v12[7] + 32 * v27), v42);
      sub_10000BAB0(v27, (uint64_t)v12);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v31 = (uint64_t)v42;
      _OWORD *v42 = 0u;
      v42[1] = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000CDFC(v31, &qword_100014FB8);
    uint64_t v14 = v41;
    goto LABEL_30;
  }
  sub_100008490(v14, v42);
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v43 = v12;
  unint64_t v1 = sub_10000B654(v17, v16);
  uint64_t v22 = v12[2];
  BOOL v23 = (v21 & 1) == 0;
  uint64_t v24 = v22 + v23;
  if (__OFADD__(v22, v23))
  {
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  id v0 = v21;
  if (v12[3] >= v24)
  {
    if (v20)
    {
      uint64_t v14 = v41;
      if ((v21 & 1) == 0) {
        goto LABEL_27;
      }
    }
    else
    {
      sub_10000BC88();
      unint64_t v12 = v43;
      uint64_t v14 = v41;
      if ((v0 & 1) == 0) {
        goto LABEL_27;
      }
    }
    goto LABEL_23;
  }
  sub_10000B7B0(v24, v20);
  unint64_t v12 = v43;
  unint64_t v25 = sub_10000B654(v17, v16);
  if ((v0 & 1) == (v26 & 1))
  {
    unint64_t v1 = v25;
    uint64_t v14 = v41;
    if ((v0 & 1) == 0)
    {
LABEL_27:
      v12[(v1 >> 6) + 8] |= 1 << v1;
      uint64_t v33 = (uint64_t *)(v12[6] + 16 * v1);
      *uint64_t v33 = v17;
      v33[1] = v16;
      sub_100008490(v42, (_OWORD *)(v12[7] + 32 * v1));
      uint64_t v34 = v12[2];
      BOOL v35 = __OFADD__(v34, 1);
      uint64_t v36 = v34 + 1;
      if (v35) {
        goto LABEL_39;
      }
      v12[2] = v36;
      swift_bridgeObjectRetain();
LABEL_29:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v1 = v39;
      id v0 = v40;
LABEL_30:
      sub_10000CDFC(v1, &qword_100014FB8);
      goto LABEL_8;
    }
LABEL_23:
    uint64_t v32 = (_OWORD *)(v12[7] + 32 * v1);
    sub_10000CE58((uint64_t)v32);
    sub_100008490(v42, v32);
    goto LABEL_29;
  }
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
}

uint64_t sub_10000CD94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003184(&qword_100014FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CDFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003184(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000CE58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000CEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CF04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003184(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000CF68()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_10000CF78()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_10000CF88()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_10000CF98()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_10000CFA8()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_10000CFB8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000CFC8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10000CFD8()
{
  return static Locale.current.getter();
}

uint64_t sub_10000CFE8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10000D018()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000D028()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000D038()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10000D048()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000D058()
{
  return static Dictionary._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10000D068()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000D078()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_10000D088(Swift::String a1)
{
}

uint64_t sub_10000D098()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000D0A8()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_10000D0B8()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_10000D0C8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10000D0D8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000D0E8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D0F8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_10000D108()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000D118()
{
  return String.hash(into:)();
}

void sub_10000D128(Swift::String a1)
{
}

Swift::Int sub_10000D138()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_10000D148(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

NSArray sub_10000D158()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000D168()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D178()
{
  return Array.description.getter();
}

uint64_t sub_10000D188()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000D198()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000D1A8()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_10000D1B8()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10000D1C8()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D1D8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000D1E8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000D1F8()
{
  return static os_log_type_t.error.getter();
}

NSNumber sub_10000D208(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_10000D218(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_10000D228()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10000D238()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000D248()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000D258()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10000D268()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_10000D278()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10000D288()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_10000D298()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_10000D2A8()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int sub_10000D2B8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10000D2C8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10000D2D8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000D2E8()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_10000D2F8()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10000D308(Swift::Int a1)
{
}

uint64_t sub_10000D318()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000D328()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000D338()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000D348()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000D358()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000D368()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000D378()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000D388()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000D398()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000D3A8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000D3B8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000D3F8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000D408()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000D418()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000D428()
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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