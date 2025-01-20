int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  Class isa;

  v3 = self;
  sub_100003028(&qword_100018BC0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100011110;
  *(void *)(v4 + 32) = type metadata accessor for SecurityApplicator();
  sub_100003028(&qword_100018D40);
  isa = sub_100010788().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for SecurityStatus();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:swift_getObjCClassFromMetadata()];

  return 0;
}

uint64_t sub_100003028(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_10000306C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000307C(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for RMStoreScope()
{
  if (!qword_100018BB8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100018BB8);
    }
  }
}

void sub_1000030E4()
{
  qword_100019300 = 0x7079547465737341;
  qword_100019308 = 0xE900000000000065;
}

void sub_10000310C()
{
  HIWORD(qword_100019318) = -4864;
}

void sub_10000313C()
{
  qword_100019320 = 0x76654C7473757254;
  qword_100019328 = 0xEA00000000006C65;
}

unint64_t sub_100003164()
{
  sub_100003028(&qword_100018DB0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000111A0;
  if (qword_100018B90 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100019308;
  *(void *)(inited + 32) = qword_100019300;
  *(void *)(inited + 40) = v2;
  long long v10 = *v0;
  long long v3 = v10;
  *(void *)(inited + 72) = &type metadata for String;
  *(_OWORD *)(inited + 48) = v3;
  swift_bridgeObjectRetain();
  sub_10000B8DC((uint64_t)&v10);
  if (qword_100018B98 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100019318;
  *(void *)(inited + 80) = qword_100019310;
  *(void *)(inited + 88) = v4;
  long long v9 = v0[1];
  long long v5 = v9;
  *(void *)(inited + 120) = &type metadata for Data;
  *(_OWORD *)(inited + 96) = v5;
  swift_bridgeObjectRetain();
  sub_10000B908((uint64_t)&v9);
  if (qword_100018BA0 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100019328;
  *(void *)(inited + 128) = qword_100019320;
  *(void *)(inited + 136) = v6;
  uint64_t v7 = *((unsigned __int8 *)v0 + 32);
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = v7;
  swift_bridgeObjectRetain();
  return sub_10000BEC8(inited);
}

uint64_t sub_1000032E4()
{
  uint64_t v0 = sub_1000106A8();
  sub_10000B6D4(v0, qword_100019330);
  sub_10000B540(v0, (uint64_t)qword_100019330);
  type metadata accessor for SecurityAdapter();
  sub_100003028(&qword_100018D78);
  sub_100010738();
  return sub_100010698();
}

void sub_10000337C(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  if (a3)
  {
    if (a3 == 1)
    {
      swift_errorRetain();
      sub_100010958(27);
      swift_bridgeObjectRelease();
      sub_10000BC10();
      v12._countAndFlagsBits = sub_100010658();
      sub_100010758(v12);
      swift_bridgeObjectRelease();
      sub_10000B96C(a1, (uint64_t)a2, 1);
      unint64_t v7 = 0xD000000000000019;
      unint64_t v8 = 0x80000001000125F0;
      unint64_t v9 = 0xD00000000000001ELL;
      long long v10 = "Security.AssetResolutionFailed";
    }
    else
    {
      unint64_t v9 = 0xD000000000000015;
      unint64_t v7 = 0xD000000000000017;
      unint64_t v8 = 0x8000000100012630;
      long long v10 = "Security.AssetMissing";
    }
    unint64_t v11 = (unint64_t)(v10 - 32) | 0x8000000000000000;
  }
  else
  {
    sub_100010958(18);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = a1;
    v13._object = a2;
    sub_100010758(v13);
    unint64_t v9 = 0;
    unint64_t v11 = 0;
    unint64_t v7 = 0xD000000000000010;
    unint64_t v8 = 0x8000000100012650;
  }
  *a4 = v9;
  a4[1] = v11;
  a4[2] = v7;
  a4[3] = v8;
  a4[4] = 0;
}

__n128 sub_1000034F8@<Q0>(uint64_t a1@<X8>)
{
  sub_10000337C(*(void *)v1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16), (unint64_t *)v5);
  uint64_t v3 = v6;
  __n128 result = (__n128)v5[1];
  *(_OWORD *)a1 = v5[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_100003548(uint64_t a1)
{
  unint64_t v2 = sub_10000BC10();

  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003584(uint64_t a1)
{
  unint64_t v2 = sub_10000BC10();

  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_1000035CC(uint64_t a1)
{
  unint64_t v2 = sub_10000BB64();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003608(uint64_t a1)
{
  unint64_t v2 = sub_10000BB64();

  return Error<>._code.getter(a1, v2);
}

uint64_t SecurityAdapter.configurationClasses()()
{
  sub_100003028(&qword_100018BC0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000111B0;
  *(void *)(v0 + 32) = sub_10000B8A0(0, &qword_100018BC8);
  *(void *)(v0 + 40) = sub_10000B8A0(0, &qword_100018BD0);
  return v0;
}

uint64_t SecurityAdapter.allDeclarationKeys(for:)(uint64_t a1)
{
  long long v5 = (uint64_t (*)(uint64_t))((char *)&dword_100018BE0 + dword_100018BE0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100003828;
  return v5(a1);
}

uint64_t sub_100003828(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  long long v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

void *sub_100003928(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  __n128 result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    sub_1000109B8();
    uint64_t v4 = sub_100006478(a1);
    int v6 = v5;
    uint64_t v7 = a1 + 64;
    __n128 result = self;
    id v17 = result;
    uint64_t v8 = 0;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if ((*(void *)(v7 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v18 = v8;
      swift_bridgeObjectRetain();
      NSString v11 = sub_1000106E8();
      [v17 newDeclarationKey:v11];
      swift_bridgeObjectRelease();

      sub_100010998();
      sub_1000109C8();
      sub_1000109D8();
      __n128 result = (void *)sub_1000109A8();
      int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v12 = *(void *)(v7 + 8 * v10);
      if ((v12 & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v13 = v12 & (-2 << (v4 & 0x3F));
      if (v13)
      {
        int64_t v9 = __clz(__rbit64(v13)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v14 = v10 + 1;
        unint64_t v15 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v15)
        {
          unint64_t v16 = *(void *)(v7 + 8 * v14);
          if (v16)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v16)) + (v14 << 6);
          }
          else
          {
            while (v15 - 2 != v10)
            {
              unint64_t v16 = *(void *)(a1 + 80 + 8 * v10++);
              if (v16)
              {
                unint64_t v14 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v8 = v18 + 1;
      uint64_t v4 = v9;
      if (v18 + 1 == v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

uint64_t sub_100003CCC(uint64_t a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  int v6 = (uint64_t (*)(uint64_t))((char *)&dword_100018BE0 + dword_100018BE0);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100003D80;
  return v6(a1);
}

uint64_t sub_100003D80()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v5 = sub_100010588();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v7 = (void *)v5;
  }
  else
  {
    sub_10000B8A0(0, &qword_100018D30);
    sub_10000B4D8();
    Class isa = sub_100010828().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    uint64_t v7 = isa;
  }
  uint64_t v8 = *(void (***)(void, void, void))(v3 + 16);
  ((void (**)(void, Class, uint64_t))v8)[2](v8, isa, v5);

  _Block_release(v8);
  int64_t v9 = *(uint64_t (**)(void))(v4 + 8);
  return v9();
}

uint64_t SecurityAdapter.applyConfiguration(_:replace:scope:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100018BF0 + dword_100018BF0);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000BC68;
  return v9(a1, a2, a3);
}

uint64_t sub_100003FD4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100003028(&qword_100018D70);
    uint64_t v5 = swift_allocError();
    *int v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = sub_1000105A8();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000423C(void *a1, void *a2, uint64_t a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  _OWORD v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  unint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100018BF0 + dword_100018BF0);
  id v10 = a1;
  id v11 = a2;
  id v12 = a5;
  unint64_t v13 = (void *)swift_task_alloc();
  v5[6] = v13;
  *unint64_t v13 = v5;
  v13[1] = sub_100004330;
  return v15((uint64_t)v10, (uint64_t)a2, a3);
}

uint64_t sub_100004330()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  int v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v8 = sub_100010588();
    swift_errorRelease();
    Class isa = 0;
    id v10 = (void *)v8;
  }
  else
  {
    sub_10000B8A0(0, &qword_100018D08);
    Class isa = sub_100010788().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    id v10 = isa;
  }
  id v11 = *(void (***)(void, void, void))(v3 + 40);
  ((void (**)(void, Class, uint64_t))v11)[2](v11, isa, v8);

  _Block_release(v11);
  id v12 = *(uint64_t (**)(void))(v7 + 8);
  return v12();
}

uint64_t SecurityAdapter.remove(_:scope:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100018C00 + dword_100018C00);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000045BC;
  return v7(a1, a2);
}

uint64_t sub_1000045BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004830(void *a1, uint64_t a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v12 = (uint64_t (*)(id, uint64_t))((char *)&dword_100018C00 + dword_100018C00);
  id v8 = a1;
  id v9 = a4;
  id v10 = (void *)swift_task_alloc();
  v4[5] = v10;
  *id v10 = v4;
  v10[1] = sub_100004910;
  return v12(v8, a2);
}

uint64_t sub_100004910()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  int v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  uint64_t v8 = *(void *)(v3 + 32);
  if (v2)
  {
    id v9 = (void *)sub_100010588();
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

id SecurityAdapter.declarationKey(forConfiguration:)(uint64_t a1)
{
  uint64_t v2 = self;
  NSString v3 = sub_1000106E8();
  id v4 = [v2 newDeclarationKeyWithSubscriberIdentifier:v3 reference:a1];

  return v4;
}

uint64_t sub_100004BD0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100003028(&qword_100018D70);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t SecurityAdapter.configurationUI(forConfiguration:scope:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100018C10 + dword_100018C10);
  NSString v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *NSString v3 = v1;
  v3[1] = sub_100004D10;
  return v5(a1);
}

uint64_t sub_100004D10(char a1, uint64_t a2)
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

uint64_t sub_100004FA8(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_100018C10 + dword_100018C10);
  id v7 = a1;
  id v8 = a4;
  id v9 = (void *)swift_task_alloc();
  v4[5] = v9;
  *id v9 = v4;
  v9[1] = sub_10000507C;
  return v11((uint64_t)v7);
}

uint64_t sub_10000507C(char a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *(void *)(*v3 + 32);
  id v8 = *(void **)(*v3 + 24);
  id v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();

  uint64_t v11 = (void (**)(void, void, void, void))(v7 + 16);
  uint64_t v12 = *(const void **)(v10 + 32);
  if (v4)
  {
    uint64_t v13 = (void *)sub_100010588();
    swift_errorRelease();
    (*v11)(v12, 0, 0, v13);

    _Block_release(v12);
  }
  else
  {
    (*v11)(v12, a1 & 1, a2, 0);
    _Block_release(v12);
  }
  uint64_t v14 = *(uint64_t (**)(void))(v10 + 8);
  return v14();
}

id SecurityAdapter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id SecurityAdapter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAdapter();
  return objc_msgSendSuper2(&v2, "init");
}

id SecurityAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005324(void *a1, void *a2)
{
  NSString v3 = v2;
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
    uint64_t v9 = sub_1000108F8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_10000B8A0(0, &qword_100018D30);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1000108E8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_1000055C4(v7, result + 1);
    v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_1000057BC();
      v23 = v28;
    }
    else
    {
      v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100005A5C((uint64_t)v8, v23);
    *NSString v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100010868(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_10000B8A0(0, &qword_100018D30);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100010878();

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
        char v19 = sub_100010878();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *NSString v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100005AE0((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *NSString v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_1000055C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100003028(&qword_100018DB8);
    uint64_t v2 = sub_100010938();
    uint64_t v14 = v2;
    sub_1000108D8();
    if (sub_100010908())
    {
      sub_10000B8A0(0, &qword_100018D30);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1000057BC();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100010868(*(void *)(v2 + 40));
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
      while (sub_100010908());
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

uint64_t sub_1000057BC()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_100003028(&qword_100018DB8);
  uint64_t v3 = sub_100010928();
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
      uint64_t result = sub_100010868(*(void *)(v4 + 40));
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
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_100005A5C(uint64_t a1, void *a2)
{
  sub_100010868(a2[5]);
  unint64_t result = sub_1000108C8();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100005AE0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000057BC();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100005C68();
      goto LABEL_14;
    }
    sub_100005E14();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100010868(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_10000B8A0(0, &qword_100018D30);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100010878();

    if (v12)
    {
LABEL_13:
      sub_100010A58();
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
        char v15 = sub_100010878();

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

id sub_100005C68()
{
  id v1 = v0;
  sub_100003028(&qword_100018DB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100010918();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_100005E14()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_100003028(&qword_100018DB8);
  uint64_t v3 = sub_100010928();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t result = sub_100010868(v19);
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

uint64_t sub_100006090(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000D624(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000DFF8();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_100006160(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_100006160(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1000108B8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100010AB8();
        swift_bridgeObjectRetain();
        sub_100010748();
        Swift::Int v9 = sub_100010AC8();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          int64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
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

uint64_t sub_100006338(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10000D624(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10000DFF8();
    goto LABEL_7;
  }
  sub_10000D92C(v15, a4 & 1);
  unint64_t v21 = sub_10000D624(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_15:
    uint64_t result = sub_100010A68();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  sub_10000DF44(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100006478(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  Swift::Int v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
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

__n128 sub_100006528@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  if (qword_100018B90 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_3;
    }
LABEL_9:
    long long v23 = 0u;
    long long v24 = 0u;
    goto LABEL_10;
  }
  swift_once();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = qword_100019308;
  uint64_t v5 = qword_100019300;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000D624(v5, v4);
  if ((v7 & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_10000B844(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v23);
  swift_bridgeObjectRelease();
  if (!*((void *)&v24 + 1))
  {
LABEL_10:
    sub_10000B7A0((uint64_t)&v23);
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    unint64_t v9 = *((void *)&v22 + 1);
    unint64_t v8 = v22;
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
LABEL_12:
  if (qword_100018B98 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_14;
    }
LABEL_21:
    long long v23 = 0u;
    long long v24 = 0u;
LABEL_22:
    sub_10000B7A0((uint64_t)&v23);
    goto LABEL_23;
  }
  swift_once();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v10 = qword_100019318;
  uint64_t v11 = qword_100019310;
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_10000D624(v11, v10);
  if (v13)
  {
    sub_10000B844(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v23);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v24 + 1)) {
    goto LABEL_22;
  }
  if (swift_dynamicCast())
  {
    long long v14 = v22;
    goto LABEL_24;
  }
LABEL_23:
  long long v14 = xmmword_1000111C0;
LABEL_24:
  __n128 v21 = (__n128)v14;
  if (qword_100018BA0 != -1)
  {
    swift_once();
    if (*(void *)(a1 + 16)) {
      goto LABEL_26;
    }
LABEL_31:
    long long v23 = 0u;
    long long v24 = 0u;
    goto LABEL_32;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_31;
  }
LABEL_26:
  uint64_t v15 = qword_100019328;
  uint64_t v16 = qword_100019320;
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_10000D624(v16, v15);
  if (v18)
  {
    sub_10000B844(*(void *)(a1 + 56) + 32 * v17, (uint64_t)&v23);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  swift_bridgeObjectRelease();
LABEL_32:
  swift_bridgeObjectRelease();
  if (!*((void *)&v24 + 1))
  {
    sub_10000B7A0((uint64_t)&v23);
    goto LABEL_38;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_38:
    char v19 = 0;
    goto LABEL_39;
  }
  if ((void)v22 == 2) {
    char v19 = 2;
  }
  else {
    char v19 = (void)v22 == 1;
  }
LABEL_39:
  a2->n128_u64[0] = v8;
  a2->n128_u64[1] = v9;
  __n128 result = v21;
  a2[1] = v21;
  a2[2].n128_u8[0] = v19;
  return result;
}

uint64_t sub_100006824(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1000109F8();
    swift_bridgeObjectRelease();
  }
  sub_10000B8A0(0, &qword_100018D30);
  sub_10000B4D8();
  uint64_t result = sub_100010838();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000109F8();
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
        unint64_t v6 = (void *)sub_100010978();
        sub_100005324(&v9, v6);
      }
    }
    else
    {
      char v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_100005324(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006978(uint64_t a1)
{
  *(void *)(v1 + 96) = a1;
  return _swift_task_switch(sub_100006998, 0, 0);
}

uint64_t sub_100006998()
{
  id v1 = [self standardUserDefaults];
  NSString v2 = sub_1000106E8();
  swift_bridgeObjectRelease();
  id v3 = [v1 objectForKey:v2];

  if (v3)
  {
    sub_1000108A8();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_10000B738(v0 + 48, v0 + 16);
  if (!*(void *)(v0 + 40))
  {
    sub_10000B7A0(v0 + 16);
    goto LABEL_8;
  }
  sub_100003028(&qword_100018D98);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_1000109F8())
    {
      sub_10000E398((unint64_t)&_swiftEmptyArrayStorage);
      uint64_t v5 = v8;
    }
    else
    {
      uint64_t v5 = &_swiftEmptySetSingleton;
    }
    goto LABEL_10;
  }
  uint64_t v4 = sub_100003928(*(void *)(v0 + 80));
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_100006824((unint64_t)v4);
  swift_bridgeObjectRelease();
LABEL_10:
  unint64_t v6 = *(uint64_t (**)(void *))(v0 + 8);
  return v6(v5);
}

uint64_t sub_100006B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  return _swift_task_switch(sub_100006BB8, 0, 0);
}

uint64_t sub_100006BB8()
{
  uint64_t v1 = v0[15];
  int v2 = *(unsigned __int8 *)(v1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v4 = v0[16];
    uint64_t v3 = v0[17];
    uint64_t v5 = self;
    Class isa = sub_100010598().super.isa;
    v0[18] = isa;
    v0[2] = v0;
    v0[3] = sub_100006D40;
    uint64_t v7 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100004BD0;
    v0[13] = &unk_1000149F0;
    v0[14] = v7;
    [v5 removeTrustForCertificateRef:isa configurationKey:v4 fullTrust:v2 == 2 scope:v3 completionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    unint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_100006D40()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    int v2 = sub_10000BC70;
  }
  else {
    int v2 = sub_10000BC6C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006E50(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 152) = a1;
  *(void *)(v2 + 160) = a2;
  return _swift_task_switch(sub_100006E70, 0, 0);
}

uint64_t sub_100006E70()
{
  uint64_t v43 = v0;
  if (qword_100018BA8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void **)(v0 + 152);
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v3 = sub_1000106A8();
  *(void *)(v0 + 168) = sub_10000B540(v3, (uint64_t)qword_100019330);
  id v4 = v1;
  uint64_t v5 = sub_100010688();
  os_log_type_t v6 = sub_100010848();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void **)(v0 + 152);
  uint64_t v40 = v0 + 56;
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    id v10 = [v8 key];
    uint64_t v11 = sub_1000106F8();
    unint64_t v13 = v12;

    *(void *)(v0 + 144) = sub_10000CFCC(v11, v13, &v42);
    sub_100010888();

    uint64_t v2 = (void **)(v0 + 152);
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Removing configuration with key: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  long long v14 = self;
  *(void *)(v0 + 176) = v14;
  id v15 = [v14 standardUserDefaults];
  NSString v16 = sub_1000106E8();
  swift_bridgeObjectRelease();
  id v17 = [v15 objectForKey:v16];

  if (v17)
  {
    sub_1000108A8();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
  }
  sub_10000B738(v0 + 88, v40);
  if (!*(void *)(v0 + 80))
  {
    sub_10000B7A0(v40);
LABEL_18:
    v31 = sub_100010688();
    os_log_type_t v32 = sub_100010858();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Invalid user defaults", v33, 2u);
      swift_slowDealloc();
    }

    sub_10000B578();
    swift_allocError();
    unint64_t v35 = 0x80000001000124D0;
    *(void *)uint64_t v34 = 0xD000000000000015;
    goto LABEL_21;
  }
  sub_100003028(&qword_100018D98);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v18 = *(void *)(v0 + 136);
  *(void *)(v0 + 184) = v18;
  if (!v18) {
    goto LABEL_18;
  }
  char v19 = *v2;
  *(void *)(v0 + 120) = v18;
  swift_bridgeObjectRetain();
  id v20 = [v19 key];
  uint64_t v21 = sub_1000106F8();
  uint64_t v23 = v22;

  if (*(void *)(v18 + 16))
  {
    unint64_t v24 = sub_10000D624(v21, v23);
    if (v25)
    {
      uint64_t v26 = *(void *)(*(void *)(v18 + 56) + 8 * v24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100006528(v26, (__n128 *)(v0 + 16));
      v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100018D88 + dword_100018D88);
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v27;
      *uint64_t v27 = v0;
      v27[1] = sub_100007470;
      uint64_t v28 = *(void *)(v0 + 152);
      uint64_t v29 = *(void *)(v0 + 160);
      return v41(v0 + 16, v28, v29);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v37 = sub_100010688();
  os_log_type_t v38 = sub_100010858();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Invalid remove: no persistent ref to remove", v39, 2u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  sub_10000B578();
  swift_allocError();
  unint64_t v35 = 0x80000001000124F0;
  *(void *)uint64_t v34 = 0xD00000000000002BLL;
LABEL_21:
  *(void *)(v34 + 8) = v35;
  *(unsigned char *)(v34 + 16) = 0;
  swift_willThrow();
  v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_100007470()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_100007964;
  }
  else
  {
    uint64_t v2 = sub_10000758C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000758C()
{
  uint64_t v33 = v0;
  uint64_t v1 = v0 + 16;
  uint64_t v2 = &SecurityAdapter;
  id v3 = [*(id *)(v0 + 152) key];
  uint64_t v4 = sub_1000106F8();
  uint64_t v6 = v5;

  uint64_t v7 = sub_100006090(v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    id v8 = [*(id *)(v0 + 176) standardUserDefaults];
    sub_100003028(&qword_100018D90);
    Class isa = sub_1000106B8().super.isa;
    swift_bridgeObjectRelease();
    NSString v10 = sub_1000106E8();
    swift_bridgeObjectRelease();
    [v8 setObject:isa forKey:v10];

    sub_10000B800(v0 + 16);
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    id v12 = *(id *)(v0 + 152);
    unint64_t v13 = sub_100010688();
    os_log_type_t v14 = sub_100010858();
    BOOL v15 = os_log_type_enabled(v13, v14);
    NSString v16 = *(void **)(v0 + 152);
    if (v15)
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)id v17 = 136446210;
      id v18 = [v16 key];
      uint64_t v19 = sub_1000106F8();
      unint64_t v21 = v20;

      uint64_t v2 = &SecurityAdapter;
      *(void *)(v0 + 128) = sub_10000CFCC(v19, v21, &v31);
      sub_100010888();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Invalid remove: no configuration key: %{public}s", v17, 0xCu);
      swift_arrayDestroy();
      uint64_t v1 = v0 + 16;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void **)(v0 + 152);
    uint64_t v31 = 0;
    unint64_t v32 = 0xE000000000000000;
    sub_100010958(40);
    swift_bridgeObjectRelease();
    uint64_t v31 = 0xD000000000000026;
    unint64_t v32 = 0x8000000100012520;
    id v23 = [v22 (SEL)v2[264].count];
    uint64_t v24 = sub_1000106F8();
    uint64_t v26 = v25;

    v35._countAndFlagsBits = v24;
    v35._object = v26;
    sub_100010758(v35);
    swift_bridgeObjectRelease();
    uint64_t v27 = v31;
    unint64_t v28 = v32;
    sub_10000B578();
    swift_allocError();
    *(void *)uint64_t v29 = v27;
    *(void *)(v29 + 8) = v28;
    *(unsigned char *)(v29 + 16) = 0;
    swift_willThrow();
    sub_10000B800(v1);
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v11();
}

uint64_t sub_100007964()
{
  sub_10000B800(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000079C8(void *a1, id a2)
{
  id v3 = [a2 declarationType];
  uint64_t v4 = sub_1000106F8();
  uint64_t v6 = v5;

  id v7 = [self registeredIdentifier];
  uint64_t v8 = sub_1000106F8();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v12 = sub_100010A48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v12 & 1) == 0) {
      return result;
    }
  }
  if ([a1 type] == (id)1) {
    return 2;
  }
  if ([a1 type]) {
    return 1;
  }
  return 2;
}

uint64_t sub_100007AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  return _swift_task_switch(sub_100007B08, 0, 0);
}

uint64_t sub_100007B08()
{
  uint64_t v1 = v0[15];
  int v2 = *(unsigned __int8 *)(v1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v4 = v0[16];
    uint64_t v3 = v0[17];
    uint64_t v5 = self;
    Class isa = sub_100010598().super.isa;
    v0[18] = isa;
    v0[2] = v0;
    v0[3] = sub_100007C90;
    uint64_t v7 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100004BD0;
    v0[13] = &unk_100014A20;
    v0[14] = v7;
    [v5 setTrustForCertificateRef:isa configurationKey:v4 fullTrust:v2 == 2 scope:v3 completionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_100007C90()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    int v2 = sub_100007E04;
  }
  else {
    int v2 = sub_100007DA0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007DA0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100007E04()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  int v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100007E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[33] = a2;
  v3[34] = a3;
  v3[32] = a1;
  return _swift_task_switch(sub_100007E98, 0, 0);
}

uint64_t sub_100007E98()
{
  v50 = v0;
  uint64_t v1 = (void *)v0[33];
  if (v1)
  {
    v48 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100018C00 + dword_100018C00);
    id v2 = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[35] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_100008594;
    uint64_t v4 = v0[34];
    return v48((uint64_t)v2, v4);
  }
  uint64_t v6 = v0[32];
  uint64_t v7 = self;
  NSString v8 = sub_1000106E8();
  id v9 = [v7 newDeclarationKeyWithSubscriberIdentifier:v8 reference:v6];
  v0[36] = v9;

  if (qword_100018BA8 != -1) {
    swift_once();
  }
  uint64_t v10 = (id *)(v0 + 32);
  uint64_t v11 = sub_1000106A8();
  v0[37] = sub_10000B540(v11, (uint64_t)qword_100019330);
  id v12 = v9;
  unint64_t v13 = sub_100010688();
  os_log_type_t v14 = sub_100010848();
  if (os_log_type_enabled(v13, v14))
  {
    BOOL v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(_DWORD *)BOOL v15 = 136446210;
    id v16 = [v12 key];
    id v17 = v12;
    uint64_t v18 = sub_1000106F8();
    unint64_t v20 = v19;

    uint64_t v10 = (id *)(v0 + 32);
    uint64_t v21 = v18;
    id v12 = v17;
    v0[31] = sub_10000CFCC(v21, v20, &v49);
    sub_100010888();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Applying configuration with key: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v22 = [*v10 declaration];
  id v23 = [v22 declarationType];

  uint64_t v24 = sub_1000106F8();
  uint64_t v26 = v25;

  id v27 = [self registeredIdentifier];
  uint64_t v28 = sub_1000106F8();
  uint64_t v30 = v29;

  if (v24 == v28 && v26 == v30)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_100010A48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v31 = [*v10 assets];
  if (v31)
  {
    unint64_t v32 = v31;
    sub_10000B8A0(0, &qword_100018DA0);
    unint64_t v33 = sub_100010798();

    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v42 = sub_1000109F8();
      uint64_t v34 = swift_bridgeObjectRelease();
      if (v42)
      {
LABEL_17:
        if ((v33 & 0xC000000000000001) != 0)
        {
          id v35 = (id)sub_100010978();
        }
        else
        {
          if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return _swift_continuation_await(v34);
          }
          id v35 = *(id *)(v33 + 32);
        }
        v36 = v35;
        v0[38] = v35;
        swift_bridgeObjectRelease();
        NSString v37 = [v36 declarationIdentifier];
        if (!v37)
        {
          sub_1000106F8();
          NSString v37 = sub_1000106E8();
          swift_bridgeObjectRelease();
        }
        v0[39] = v37;
        uint64_t v38 = v0[32];
        v39 = self;
        NSString v40 = sub_1000106E8();
        v0[40] = v40;
        swift_bridgeObjectRelease();
        v0[2] = v0;
        v0[7] = v0 + 28;
        v0[3] = sub_100008D0C;
        uint64_t v41 = swift_continuation_init();
        v0[10] = _NSConcreteStackBlock;
        v0[11] = 0x40000000;
        v0[12] = sub_100003FD4;
        v0[13] = &unk_100014A08;
        v0[14] = v41;
        [v39 resolveKeychainAsset:v38 assetIdentifier:v37 accessGroup:v40 completionHandler:v0 + 10];
        uint64_t v34 = (uint64_t)(v0 + 2);
        return _swift_continuation_await(v34);
      }
    }
    else if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_17;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_100010688();
  os_log_type_t v44 = sub_100010858();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Missing asset reference", v45, 2u);
    swift_slowDealloc();
  }

  sub_10000B578();
  swift_allocError();
  *(void *)uint64_t v46 = 0;
  *(void *)(v46 + 8) = 0;
  *(unsigned char *)(v46 + 16) = 2;
  swift_willThrow();

  v47 = (uint64_t (*)(void))v0[1];
  return v47();
}

uint64_t sub_100008594()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_10000BC64;
  }
  else
  {
    uint64_t v1 = sub_1000086AC;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_1000086AC()
{
  uint64_t v45 = v0;

  uint64_t v1 = *(void *)(v0 + 256);
  id v2 = self;
  NSString v3 = sub_1000106E8();
  id v4 = [v2 newDeclarationKeyWithSubscriberIdentifier:v3 reference:v1];
  *(void *)(v0 + 288) = v4;

  if (qword_100018BA8 != -1) {
    swift_once();
  }
  uint64_t v5 = (id *)(v0 + 256);
  uint64_t v6 = sub_1000106A8();
  *(void *)(v0 + 296) = sub_10000B540(v6, (uint64_t)qword_100019330);
  id v7 = v4;
  NSString v8 = sub_100010688();
  os_log_type_t v9 = sub_100010848();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    id v11 = [v7 key];
    id v12 = v7;
    uint64_t v13 = sub_1000106F8();
    unint64_t v15 = v14;

    uint64_t v5 = (id *)(v0 + 256);
    uint64_t v16 = v13;
    id v7 = v12;
    *(void *)(v0 + 248) = sub_10000CFCC(v16, v15, &v44);
    sub_100010888();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Applying configuration with key: %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v17 = [*v5 declaration];
  id v18 = [v17 declarationType];

  uint64_t v19 = sub_1000106F8();
  uint64_t v21 = v20;

  id v22 = [self registeredIdentifier];
  uint64_t v23 = sub_1000106F8();
  uint64_t v25 = v24;

  if (v19 == v23 && v21 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_100010A48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v26 = [*v5 assets];
  if (v26)
  {
    id v27 = v26;
    sub_10000B8A0(0, &qword_100018DA0);
    unint64_t v28 = sub_100010798();

    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1000109F8();
      uint64_t v29 = swift_bridgeObjectRelease();
      if (v37)
      {
LABEL_13:
        if ((v28 & 0xC000000000000001) != 0)
        {
          id v30 = (id)sub_100010978();
        }
        else
        {
          if (!*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return _swift_continuation_await(v29);
          }
          id v30 = *(id *)(v28 + 32);
        }
        id v31 = v30;
        *(void *)(v0 + 304) = v30;
        swift_bridgeObjectRelease();
        NSString v32 = [v31 declarationIdentifier];
        if (!v32)
        {
          sub_1000106F8();
          NSString v32 = sub_1000106E8();
          swift_bridgeObjectRelease();
        }
        *(void *)(v0 + 312) = v32;
        uint64_t v33 = *(void *)(v0 + 256);
        uint64_t v34 = self;
        NSString v35 = sub_1000106E8();
        *(void *)(v0 + 320) = v35;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 224;
        *(void *)(v0 + 24) = sub_100008D0C;
        uint64_t v36 = swift_continuation_init();
        *(void *)(v0 + 80) = _NSConcreteStackBlock;
        *(void *)(v0 + 88) = 0x40000000;
        *(void *)(v0 + 96) = sub_100003FD4;
        *(void *)(v0 + 104) = &unk_100014A08;
        *(void *)(v0 + 112) = v36;
        [v34 resolveKeychainAsset:v33 assetIdentifier:v32 accessGroup:v35 completionHandler:v0 + 80];
        uint64_t v29 = v0 + 16;
        return _swift_continuation_await(v29);
      }
    }
    else if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_13;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_100010688();
  os_log_type_t v39 = sub_100010858();
  if (os_log_type_enabled(v38, v39))
  {
    NSString v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Missing asset reference", v40, 2u);
    swift_slowDealloc();
  }

  sub_10000B578();
  swift_allocError();
  *(void *)uint64_t v41 = 0;
  *(void *)(v41 + 8) = 0;
  *(unsigned char *)(v41 + 16) = 2;
  swift_willThrow();

  uint64_t v42 = *(uint64_t (**)(void))(v0 + 8);
  return v42();
}

uint64_t sub_100008D0C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 328) = v1;
  if (v1) {
    id v2 = sub_1000095D0;
  }
  else {
    id v2 = sub_100008E1C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008E1C()
{
  id v2 = *(void **)(v0 + 312);
  uint64_t v1 = *(void **)(v0 + 320);
  NSString v3 = *(void **)(v0 + 304);
  uint64_t v4 = *(void **)(v0 + 256);
  uint64_t v6 = *(void *)(v0 + 224);
  unint64_t v5 = *(void *)(v0 + 232);
  *(void *)(v0 + 336) = v6;
  *(void *)(v0 + 344) = v5;
  sub_10000B5CC(v6, v5);

  id v7 = [v3 declarationType];
  uint64_t v8 = sub_1000106F8();
  uint64_t v10 = v9;

  *(void *)(v0 + 352) = v10;
  id v11 = [v4 store];
  id v12 = [v4 declaration];
  LOBYTE(v3) = sub_1000079C8(v11, v3);

  *(void *)(v0 + 120) = v8;
  *(void *)(v0 + 128) = v10;
  *(void *)(v0 + 136) = v6;
  *(void *)(v0 + 144) = v5;
  *(unsigned char *)(v0 + 152) = (_BYTE)v3;
  id v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100018DA8 + dword_100018DA8);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_100008F9C;
  uint64_t v14 = *(void *)(v0 + 288);
  uint64_t v15 = *(void *)(v0 + 272);
  return v17(v0 + 120, v14, v15);
}

uint64_t sub_100008F9C()
{
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_100009528;
  }
  else {
    id v2 = sub_1000090B0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000090B0()
{
  uint64_t v1 = self;
  id v2 = [v1 standardUserDefaults];
  NSString v3 = sub_1000106E8();
  swift_bridgeObjectRelease();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    sub_1000108A8();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 176) = 0u;
  }
  unint64_t v5 = (unint64_t *)(v0 + 240);
  sub_10000B738(v0 + 160, v0 + 192);
  if (!*(void *)(v0 + 216))
  {
    sub_10000B7A0(v0 + 192);
    goto LABEL_9;
  }
  sub_100003028(&qword_100018D98);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    *unint64_t v5 = 0;
    goto LABEL_10;
  }
  if (*v5)
  {
LABEL_11:
    uint64_t v6 = *(void *)(v0 + 336);
    unint64_t v28 = *(void *)(v0 + 344);
    uint64_t v29 = *(void **)(v0 + 304);
    id v7 = *(void **)(v0 + 288);
    swift_bridgeObjectRetain();
    id v8 = [v7 key];
    uint64_t v9 = sub_1000106F8();
    uint64_t v11 = v10;

    unint64_t v12 = sub_100003164();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100006338(v12, v9, v11, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v14 = [v1 standardUserDefaults];
    sub_100003028(&qword_100018D90);
    Class isa = sub_1000106B8().super.isa;
    swift_bridgeObjectRelease();
    NSString v16 = sub_1000106E8();
    swift_bridgeObjectRelease();
    [v14 setObject:isa forKey:v16];

    sub_10000B624(v6, v28);
    swift_bridgeObjectRelease();

    sub_10000B624(v6, v28);
    swift_bridgeObjectRelease();
    id v17 = *(uint64_t (**)(void *))(v0 + 8);
    return v17(&_swiftEmptyArrayStorage);
  }
LABEL_10:
  *unint64_t v5 = sub_10000BFF4((uint64_t)&_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  if (*v5) {
    goto LABEL_11;
  }
  uint64_t v19 = sub_100010688();
  os_log_type_t v20 = sub_100010858();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Invalid user defaults", v21, 2u);
    swift_slowDealloc();
  }
  unint64_t v22 = *(void *)(v0 + 344);
  uint64_t v23 = *(void *)(v0 + 336);
  uint64_t v24 = *(void **)(v0 + 304);
  uint64_t v25 = *(void **)(v0 + 288);

  sub_10000B578();
  swift_allocError();
  *(void *)uint64_t v26 = 0xD000000000000015;
  *(void *)(v26 + 8) = 0x80000001000124D0;
  *(unsigned char *)(v26 + 16) = 0;
  swift_willThrow();
  sub_10000B624(v23, v22);
  swift_bridgeObjectRelease();

  sub_10000B624(v23, v22);
  swift_bridgeObjectRelease();
  id v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

uint64_t sub_100009528()
{
  unint64_t v1 = v0[43];
  uint64_t v2 = v0[42];
  NSString v3 = (void *)v0[38];
  id v4 = (void *)v0[36];
  sub_10000B624(v2, v1);

  swift_bridgeObjectRelease();
  sub_10000B624(v2, v1);

  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1000095D0()
{
  unint64_t v1 = (void *)v0[40];
  uint64_t v2 = (void *)v0[39];
  swift_willThrow();

  NSString v3 = sub_100010688();
  os_log_type_t v4 = sub_100010858();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed asset resolution", v5, 2u);
    swift_slowDealloc();
  }
  uint64_t v6 = v0[41];
  uint64_t v7 = (void *)v0[38];
  id v8 = (void *)v0[36];

  sub_10000B578();
  swift_allocError();
  *(void *)uint64_t v9 = v6;
  *(void *)(v9 + 8) = 0;
  *(unsigned char *)(v9 + 16) = 1;
  swift_errorRetain();
  swift_willThrow();

  swift_errorRelease();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100009718(uint64_t a1)
{
  v1[18] = a1;
  uint64_t v2 = sub_1000105D8();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  uint64_t v3 = sub_1000105F8();
  v1[22] = v3;
  v1[23] = *(void *)(v3 - 8);
  v1[24] = swift_task_alloc();
  uint64_t v4 = sub_100010628();
  v1[25] = v4;
  v1[26] = *(void *)(v4 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return _swift_task_switch(sub_1000098A0, 0, 0);
}

uint64_t sub_1000098A0()
{
  uint64_t v90 = v0;
  if (qword_100018BA8 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = sub_1000106A8();
  *(void *)(v0 + 232) = sub_10000B540(v2, (uint64_t)qword_100019330);
  id v3 = v1;
  uint64_t v4 = sub_100010688();
  os_log_type_t v5 = sub_100010848();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 144);
  id v8 = &SecurityAdapter;
  if (v6)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v88 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    id v10 = [v7 declaration];
    id v11 = [v10 declarationIdentifier];

    uint64_t v12 = sub_1000106F8();
    unint64_t v14 = v13;

    *(void *)(v0 + 136) = sub_10000CFCC(v12, v14, &v88);
    sub_100010888();

    id v8 = &SecurityAdapter;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Get configuration UI for: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v15 = [*(id *)(v0 + 144) (SEL)v8[257].count];
  *(void *)(v0 + 240) = v15;
  id v16 = [v15 declarationType];
  uint64_t v17 = sub_1000106F8();
  uint64_t v19 = v18;

  id v20 = [self registeredIdentifier];
  uint64_t v21 = sub_1000106F8();
  uint64_t v23 = v22;

  if (v21 == v17 && v23 == v19) {
    goto LABEL_8;
  }
  char v24 = sub_100010A48();
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_10;
  }
  id v51 = [self registeredIdentifier];
  uint64_t v52 = sub_1000106F8();
  uint64_t v54 = v53;

  if (v52 == v17 && v54 == v19)
  {
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  char v55 = sub_100010A48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) == 0)
  {
    v56 = sub_100010688();
    os_log_type_t v57 = sub_100010858();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v58 = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "Invalid configuration for configuration UI", v58, 2u);
      swift_slowDealloc();
    }

    uint64_t v88 = 0;
    unint64_t v89 = 0xE000000000000000;
    sub_100010958(30);
    swift_bridgeObjectRelease();
    uint64_t v88 = 0xD00000000000001CLL;
    unint64_t v89 = 0x80000001000122D0;
    id v59 = [v15 declarationType];
    uint64_t v60 = sub_1000106F8();
    v62 = v61;

    v92._countAndFlagsBits = v60;
    v92._object = v62;
    sub_100010758(v92);
    swift_bridgeObjectRelease();
    uint64_t v63 = v88;
    unint64_t v44 = v89;
    sub_10000B578();
    swift_allocError();
    *(void *)uint64_t v43 = v63;
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v25 = *(void **)(v0 + 144);
  self;
  id v26 = [(id)swift_dynamicCastObjCClassUnconditional() payloadCredentialAssetReference];
  sub_1000106F8();

  NSString v27 = sub_1000106E8();
  swift_bridgeObjectRelease();
  id v28 = [v25 assetWithIdentifier:v27];
  *(void *)(v0 + 248) = v28;

  if (v28)
  {
    uint64_t v29 = (void *)v0;
    uint64_t v30 = v0 + 120;
    id v31 = v28;
    id v32 = [v31 declarationType];
    uint64_t v33 = sub_1000106F8();
    uint64_t v35 = v34;

    id v36 = [self registeredIdentifier];
    uint64_t v37 = sub_1000106F8();
    uint64_t v39 = v38;

    if (v37 == v33 && v39 == v35)
    {
      swift_bridgeObjectRelease_n();
LABEL_23:
      v48 = "UI.Value.Description-ACME";
LABEL_24:
      unint64_t v49 = (unint64_t)(v48 - 32) | 0x8000000000000000;
      unint64_t v50 = 0xD000000000000019;
LABEL_44:
      v29[32] = v50;
      v29[33] = v49;
      v75 = (void *)v29[18];
      v76 = self;
      NSString v77 = sub_1000106E8();
      id v78 = [v75 store];
      id v79 = [v76 newDeclarationKeyWithSubscriberIdentifier:v77 store:v78 declaration:v31];
      v29[34] = v79;

      id v80 = [v75 store];
      v29[35] = v80;
      NSString v81 = [v79 key];
      if (!v81)
      {
        sub_1000106F8();
        NSString v81 = sub_1000106E8();
        swift_bridgeObjectRelease();
      }
      v29[36] = v81;
      v29[2] = v29;
      v29[7] = v30;
      v29[3] = sub_10000A334;
      uint64_t v82 = swift_continuation_init();
      v29[10] = _NSConcreteStackBlock;
      v29[11] = 0x40000000;
      v29[12] = sub_100003FD4;
      v29[13] = &unk_1000149D8;
      v29[14] = v82;
      [v80 certificatePersistentRefForAssetKey:v81 completionHandler:v29 + 10];
      return _swift_continuation_await(v29 + 2);
    }
    char v47 = sub_100010A48();
    swift_bridgeObjectRelease();
    if (v47)
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    id v64 = [self registeredIdentifier];
    uint64_t v65 = sub_1000106F8();
    uint64_t v67 = v66;

    if (v65 == v33 && v67 == v35)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v68 = sub_100010A48();
      swift_bridgeObjectRelease();
      if ((v68 & 1) == 0)
      {
        id v70 = [self registeredIdentifier];
        uint64_t v71 = sub_1000106F8();
        uint64_t v73 = v72;

        if (v71 == v33 && v73 == v35)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v74 = sub_100010A48();
          swift_bridgeObjectRelease();
          if ((v74 & 1) == 0)
          {
            id v83 = [self registeredIdentifier];
            uint64_t v84 = sub_1000106F8();
            uint64_t v86 = v85;

            if (v84 != v33 || v86 != v35)
            {
              char v87 = sub_100010A48();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              unint64_t v50 = 0xD00000000000001CLL;
              if (v87) {
                unint64_t v50 = 0xD000000000000019;
              }
              unint64_t v49 = 0x8000000100012400;
              if ((v87 & 1) == 0) {
                unint64_t v49 = 0x8000000100012320;
              }
              goto LABEL_44;
            }
            swift_bridgeObjectRelease_n();
            v48 = "UI.Value.Description-SCEP";
            goto LABEL_24;
          }
          swift_bridgeObjectRelease();
        }
        unint64_t v50 = 0xD00000000000001DLL;
        v69 = "UI.Value.Description-Identity";
LABEL_43:
        unint64_t v49 = (unint64_t)(v69 - 32) | 0x8000000000000000;
        goto LABEL_44;
      }
      swift_bridgeObjectRelease();
    }
    unint64_t v50 = 0xD000000000000020;
    v69 = "UI.Value.Description-Certificate";
    goto LABEL_43;
  }
  NSString v40 = sub_100010688();
  uint64_t v41 = sub_100010858();
  if (os_log_type_enabled(v40, (os_log_type_t)v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v41, "Invalid asset for configurationUI", v42, 2u);
    swift_slowDealloc();
  }

  sub_10000B578();
  swift_allocError();
  *(void *)uint64_t v43 = 0xD000000000000021;
  unint64_t v44 = 0x80000001000122F0;
LABEL_18:
  *(void *)(v43 + 8) = v44;
  *(unsigned char *)(v43 + 16) = 0;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  return v45(0);
}

uint64_t sub_10000A334()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1) {
    uint64_t v2 = sub_10000AD4C;
  }
  else {
    uint64_t v2 = sub_10000A444;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000A444()
{
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 120);
  unint64_t v4 = *(void *)(v0 + 128);

  sub_10000B5CC(v3, v4);
  id v5 = [v2 store];
  [v5 scope];

  id v6 = [v2 store];
  id v7 = [v6 personaIdentifier];

  if (v7)
  {
    sub_1000106F8();
  }
  sub_100010648();
  id v8 = (void *)sub_100010638();
  swift_bridgeObjectRelease();
  uint64_t v9 = v8;
  CFStringRef v10 = SecCertificateCopySubjectSummary(v9);
  if (v10)
  {
    id v11 = (__CFString *)v10;
    uint64_t v12 = sub_1000106F8();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0xE000000000000000;
  }
  uint64_t result = SecCertificateCopyIssuerSummary();
  if (result)
  {
    id v16 = (void *)result;
    uint64_t v17 = sub_1000106F8();
    uint64_t v76 = v18;
    uint64_t v77 = v17;

    id v78 = v9;
    SecCertificateNotValidAfter();
    unint64_t v79 = v4;
    uint64_t v80 = v3;
    unint64_t v81 = v14;
    uint64_t v82 = v12;
    if (v19 == 0.0)
    {
      unint64_t v67 = 0xE000000000000000;
      uint64_t v68 = 0;
    }
    else
    {
      uint64_t v21 = *(void *)(v0 + 216);
      uint64_t v20 = *(void *)(v0 + 224);
      uint64_t v23 = *(void *)(v0 + 200);
      uint64_t v22 = *(void *)(v0 + 208);
      uint64_t v24 = *(void *)(v0 + 192);
      uint64_t v73 = *(void *)(v0 + 184);
      uint64_t v25 = *(void *)(v0 + 168);
      uint64_t v83 = *(void *)(v0 + 176);
      uint64_t v26 = *(void *)(v0 + 160);
      uint64_t v74 = *(void *)(v0 + 152);
      sub_1000105B8();
      sub_100010608();
      sub_10000B67C();
      sub_1000106D8();
      NSString v27 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      v27(v21, v23);
      sub_1000105E8();
      sub_1000105C8();
      uint64_t v28 = sub_100010618();
      unint64_t v67 = v29;
      uint64_t v68 = v28;
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v74);
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v24, v83);
      v27(v20, v23);
    }
    NSString v75 = sub_1000106E8();
    uint64_t v30 = self;
    NSString v31 = sub_1000106E8();
    NSString v32 = [v30 string:v31];

    if (!v32)
    {
      sub_1000106F8();
      NSString v32 = sub_1000106E8();
      swift_bridgeObjectRelease();
    }
    v69 = v32;
    id v70 = *(void **)(v0 + 248);
    uint64_t v71 = *(void **)(v0 + 240);
    uint64_t v72 = *(void **)(v0 + 272);
    sub_100003028(&qword_100018D58);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_1000111D0;
    sub_100003028(&qword_100018D60);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_1000111B0;
    NSString v35 = sub_1000106E8();
    id v36 = [v30 string:v35];

    uint64_t v37 = sub_1000106F8();
    uint64_t v39 = v38;

    *(void *)(v34 + 32) = v37;
    *(void *)(v34 + 40) = v39;
    NSString v40 = sub_1000106E8();
    swift_bridgeObjectRelease();
    id v41 = [v30 string:v40];

    uint64_t v42 = sub_1000106F8();
    uint64_t v44 = v43;

    *(void *)(v34 + 48) = v42;
    *(void *)(v34 + 56) = v44;
    *(void *)(v33 + 32) = v34;
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_1000111B0;
    NSString v46 = sub_1000106E8();
    id v47 = [v30 string:v46];

    uint64_t v48 = sub_1000106F8();
    uint64_t v50 = v49;

    *(void *)(v45 + 32) = v48;
    *(void *)(v45 + 40) = v50;
    *(void *)(v45 + 48) = v82;
    *(void *)(v45 + 56) = v81;
    *(void *)(v33 + 40) = v45;
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_1000111B0;
    NSString v52 = sub_1000106E8();
    swift_bridgeObjectRelease();
    id v53 = [v30 string:v52];

    uint64_t v54 = sub_1000106F8();
    uint64_t v56 = v55;

    *(void *)(v51 + 32) = v54;
    *(void *)(v51 + 40) = v56;
    *(void *)(v51 + 48) = v68;
    *(void *)(v51 + 56) = v67;
    *(void *)(v33 + 48) = v51;
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_1000111B0;
    v58 = self;
    NSString v59 = sub_1000106E8();
    id v60 = [v30 string:v59];

    uint64_t v61 = sub_1000106F8();
    uint64_t v63 = v62;

    *(void *)(v57 + 32) = v61;
    *(void *)(v57 + 40) = v63;
    *(void *)(v57 + 48) = v77;
    *(void *)(v57 + 56) = v76;
    *(void *)(v33 + 56) = v57;
    sub_100003028(&qword_100018D68);
    Class isa = sub_100010788().super.isa;
    swift_bridgeObjectRelease();
    id v65 = [v58 configurationUIWithTitle:v75 description:v69 details:isa];

    sub_10000B624(v80, v79);
    sub_10000B624(v80, v79);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v66 = *(uint64_t (**)(uint64_t, id))(v0 + 8);
    return v66(1, v65);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000AD4C()
{
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v2 = *(void **)(v0 + 280);
  swift_willThrow();
  swift_errorRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = sub_100010688();
  os_log_type_t v4 = sub_100010858();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Invalid persistent ref for configurationUI", v5, 2u);
    swift_slowDealloc();
  }
  id v6 = *(void **)(v0 + 272);
  id v7 = *(void **)(v0 + 248);

  sub_10000B578();
  swift_allocError();
  *(void *)uint64_t v8 = 0xD000000000000013;
  *(void *)(v8 + 8) = 0x8000000100012380;
  *(unsigned char *)(v8 + 16) = 0;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9(0);
}

uint64_t type metadata accessor for SecurityAdapter()
{
  return self;
}

uint64_t sub_10000AF14()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  id v5 = (void *)v0[4];
  os_log_type_t v4 = (void *)v0[5];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_1000045BC;
  id v7 = (uint64_t (*)(void *, int, void *, void *))((char *)&dword_100018CA8 + dword_100018CA8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000AFD8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  os_log_type_t v4 = (int *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_10000BC74;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100018FD0 + dword_100018FD0);
  return v6(v2, v3, v4);
}

uint64_t sub_10000B09C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_10000BC74;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100018FE0 + dword_100018FE0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000B16C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B1B4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_10000BC74;
  id v7 = (uint64_t (*)(void *, uint64_t, void *, void *))((char *)&dword_100018CC8 + dword_100018CC8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000B27C()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000B2CC()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  id v6 = (void *)v0[6];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *id v7 = v1;
  v7[1] = sub_10000BC74;
  uint64_t v8 = (uint64_t (*)(void *, void *, uint64_t, void *, void *))((char *)&dword_100018CE8 + dword_100018CE8);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_10000B39C()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B3DC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000BC74;
  uint64_t v5 = (uint64_t (*)(uint64_t, void *))((char *)&dword_100018D10 + dword_100018D10);
  return v5(v2, v3);
}

uint64_t sub_10000B498()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_10000B4D8()
{
  unint64_t result = qword_100018D38;
  if (!qword_100018D38)
  {
    sub_10000B8A0(255, &qword_100018D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018D38);
  }
  return result;
}

uint64_t sub_10000B540(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10000B578()
{
  unint64_t result = qword_100018D48;
  if (!qword_100018D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018D48);
  }
  return result;
}

uint64_t sub_10000B5CC(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000B624(uint64_t a1, unint64_t a2)
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

unint64_t sub_10000B67C()
{
  unint64_t result = qword_100018D50;
  if (!qword_100018D50)
  {
    sub_100010628();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018D50);
  }
  return result;
}

uint64_t *sub_10000B6D4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000B738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003028(&qword_100018D80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B7A0(uint64_t a1)
{
  uint64_t v2 = sub_100003028(&qword_100018D80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B800(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  swift_bridgeObjectRelease();
  sub_10000B624(v2, v3);
  return a1;
}

uint64_t sub_10000B844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B8A0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000B8DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B908(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B93C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_errorRetain();
  }
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for SecurityAdapter.AdapterError(uint64_t a1)
{
  return sub_10000B96C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10000B96C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_errorRelease();
  }
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18SecuritySubscriber15SecurityAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000B93C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SecurityAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000B93C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000B96C(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for SecurityAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SecurityAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000B96C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecurityAdapter.AdapterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SecurityAdapter.AdapterError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10000BB18(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_10000BB34(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecurityAdapter.AdapterError()
{
  return &type metadata for SecurityAdapter.AdapterError;
}

unint64_t sub_10000BB64()
{
  unint64_t result = qword_100018DC0;
  if (!qword_100018DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018DC0);
  }
  return result;
}

unint64_t sub_10000BBBC()
{
  unint64_t result = qword_100018DC8;
  if (!qword_100018DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018DC8);
  }
  return result;
}

unint64_t sub_10000BC10()
{
  unint64_t result = qword_100018DD0;
  if (!qword_100018DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018DD0);
  }
  return result;
}

id sub_10000BD78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityApplicator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecurityApplicator()
{
  return self;
}

Swift::Int sub_10000BDD0()
{
  sub_100003028(&qword_100018D60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000111B0;
  id v1 = [self registeredIdentifier];
  uint64_t v2 = sub_1000106F8();
  uint64_t v4 = v3;

  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = v4;
  id v5 = [self registeredIdentifier];
  uint64_t v6 = sub_1000106F8();
  uint64_t v8 = v7;

  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  Swift::Int v9 = sub_10000E6F4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v9;
}

unint64_t sub_10000BEC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003028(&qword_100019020);
  uint64_t v2 = sub_100010A28();
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
    sub_1000104D0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000D624(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100010458(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000BFF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003028((uint64_t *)&unk_100019070);
  uint64_t v2 = (void *)sub_100010A28();
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
    unint64_t result = sub_10000D624(v5, v6);
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

uint64_t sub_10000C110()
{
  uint64_t v0 = sub_1000106A8();
  sub_10000B6D4(v0, qword_100019348);
  sub_10000B540(v0, (uint64_t)qword_100019348);
  type metadata accessor for SecurityStatus();
  sub_100003028((uint64_t *)&unk_100019058);
  sub_100010738();
  return sub_100010698();
}

uint64_t sub_10000C3F8(int a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v7 = sub_100010798();
  v4[5] = v7;
  BOOL v12 = (uint64_t (*)(uint64_t, id))((char *)&dword_100019000 + dword_100019000);
  id v8 = a2;
  id v9 = a4;
  char v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *char v10 = v4;
  v10[1] = sub_10000C4F0;
  return v12(v7, v8);
}

uint64_t sub_10000C4F0()
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
    uint64_t v7 = sub_100010588();
    swift_errorRelease();
    Class isa = 0;
    id v9 = (void *)v7;
  }
  else
  {
    Class isa = sub_1000106B8().super.isa;
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

uint64_t sub_10000C6CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100003028(&qword_100018D70);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10000B8A0(0, (unint64_t *)&unk_100019038);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_1000106C8();
    return _swift_continuation_throwingResume(v3);
  }
}

id sub_10000C7F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityStatus();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecurityStatus()
{
  return self;
}

uint64_t sub_10000C854()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000C8A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000045BC;
  id v7 = (uint64_t (*)(int, void *, void *, void *))((char *)&dword_100018FC0 + dword_100018FC0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000C964(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000BC74;
  return v6();
}

uint64_t sub_10000CA34(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000BC74;
  return v7();
}

uint64_t sub_10000CB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100010818();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100010808();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000CCA8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000107F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000CCA8(uint64_t a1)
{
  uint64_t v2 = sub_100003028(&qword_100018CA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000CD08(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000CDE4;
  return v6(a1);
}

uint64_t sub_10000CDE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000CEDC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CF14(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000045BC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100018FF0 + dword_100018FF0);
  return v6(a1, v4);
}

uint64_t sub_10000CFCC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000D0A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B844((uint64_t)v12, *a3);
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
      sub_10000B844((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100010468((uint64_t)v12);
  return v7;
}

uint64_t sub_10000D0A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100010898();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000D25C(a5, a6);
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
  uint64_t v8 = sub_100010988();
  if (!v8)
  {
    sub_1000109E8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100010A38();
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

uint64_t sub_10000D25C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000D2F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000D4D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000D4D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000D2F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000D46C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100010968();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000109E8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100010768();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100010A38();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000109E8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000D46C(uint64_t a1, uint64_t a2)
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
  sub_100003028(&qword_100019048);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000D4D4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003028(&qword_100019048);
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
  uint64_t result = sub_100010A38();
  __break(1u);
  return result;
}

unint64_t sub_10000D624(uint64_t a1, uint64_t a2)
{
  sub_100010AB8();
  sub_100010748();
  Swift::Int v4 = sub_100010AC8();

  return sub_10000D69C(a1, a2, v4);
}

unint64_t sub_10000D69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100010A48() & 1) == 0)
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
      while (!v14 && (sub_100010A48() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000D780(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D7A0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_10000D7A0(char a1, int64_t a2, char a3, void *a4)
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
    sub_100003028((uint64_t *)&unk_100019028);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
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
    sub_100003028(&qword_100018D90);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100010A38();
  __break(1u);
  return result;
}

uint64_t sub_10000D92C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003028((uint64_t *)&unk_100019070);
  char v36 = a2;
  uint64_t v6 = sub_100010A18();
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100010AB8();
    sub_100010748();
    uint64_t result = sub_100010AC8();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
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

uint64_t sub_10000DC44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100003028(&qword_100019020);
  uint64_t v6 = sub_100010A18();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v34 = (void *)(v5 + 64);
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
                  *int64_t v34 = -1 << v32;
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
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100010458(v24, v35);
      }
      else
      {
        sub_10000B844((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_100010AB8();
      sub_100010748();
      uint64_t result = sub_100010AC8();
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
      uint64_t result = (uint64_t)sub_100010458(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000DF44(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
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

_OWORD *sub_10000DF8C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100010458(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_10000DFF8()
{
  uint64_t v1 = v0;
  sub_100003028((uint64_t *)&unk_100019070);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100010A08();
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_10000E1B0()
{
  uint64_t v1 = v0;
  sub_100003028(&qword_100019020);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100010A08();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
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
    sub_10000B844(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_100010458(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

void sub_10000E398(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000109F8();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100003028(&qword_100018DB8);
      uint64_t v3 = (void *)sub_100010948();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1000109F8();
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
        uint64_t v9 = sub_100010978();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = sub_100010868(v3[5]);
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
      sub_10000B8A0(0, &qword_100018D30);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = sub_100010878();

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
          char v22 = sub_100010878();

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
    Swift::Int v28 = sub_100010868(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_10000B8A0(0, &qword_100018D30);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_100010878();

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
        char v38 = sub_100010878();

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

Swift::Int sub_10000E6F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003028(&qword_100019068);
    uint64_t v3 = sub_100010948();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100010AB8();
      swift_bridgeObjectRetain();
      sub_100010748();
      Swift::Int result = sub_100010AC8();
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
        if (v17 || (Swift::Int result = sub_100010A48(), (result & 1) != 0))
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
            Swift::Int result = sub_100010A48();
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

id sub_10000E898()
{
  uint64_t v0 = sub_100010728();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010718();
  uint64_t v4 = sub_100010708();
  unint64_t v6 = v5;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_6;
  }
  v8.super.Class isa = sub_100010598().super.isa;
  sub_1000104BC(v4, v6);
  id result = [(objc_class *)v8.super.isa DMCSHA256Hash];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v9 = result;
  id result = [result DMCHexString];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = sub_1000106F8();

    return (id)v11;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10000EA14(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_10000EA34, 0, 0);
}

uint64_t sub_10000EA34()
{
  uint64_t v1 = (void *)v0[16];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000EB30;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000C6CC;
  v0[13] = &unk_100014B68;
  v0[14] = v2;
  [v1 certificateStatusWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000EB30()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_10000F448;
  }
  else {
    uint64_t v2 = sub_10000EC40;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000EC40()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void **)(v0 + 128);
  [v1 scope];
  id v3 = [v1 personaIdentifier];
  if (v3)
  {
    uint64_t v4 = v3;
    sub_1000106F8();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0;
  }
  int64_t v7 = 0;
  uint64_t v8 = -1;
  uint64_t v56 = v2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  if (-v9 < 64) {
    uint64_t v8 = ~(-1 << -(char)v9);
  }
  unint64_t v10 = v8 & *(void *)(v2 + 64);
  int64_t v57 = (unint64_t)(63 - v9) >> 6;
  uint64_t v55 = v2;
  while (1)
  {
    if (v10)
    {
      unint64_t v11 = __clz(__rbit64(v10));
      uint64_t v12 = (v10 - 1) & v10;
      int64_t v62 = v7;
      unint64_t v13 = v11 | (v7 << 6);
      goto LABEL_23;
    }
    int64_t v14 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v14 >= v57) {
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v56 + 8 * v14);
    int64_t v16 = v7 + 1;
    if (!v15)
    {
      int64_t v16 = v7 + 2;
      if (v7 + 2 >= v57) {
        goto LABEL_30;
      }
      unint64_t v15 = *(void *)(v56 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v7 + 3;
        if (v7 + 3 >= v57) {
          goto LABEL_30;
        }
        unint64_t v15 = *(void *)(v56 + 8 * v16);
        if (!v15) {
          break;
        }
      }
    }
LABEL_22:
    uint64_t v12 = (v15 - 1) & v15;
    int64_t v62 = v16;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
LABEL_23:
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + 8 * v13);
    char v19 = self;
    swift_bridgeObjectRetain();
    unint64_t v6 = v18;
    NSString v20 = sub_1000106E8();
    swift_bridgeObjectRelease();
    id v21 = [v19 newDeclarationKey:v20];

    sub_100010648();
    id v22 = [(id)v6 persistentRef];
    uint64_t v23 = sub_1000105A8();
    unint64_t v25 = v24;

    Swift::Int v26 = (void *)sub_100010638();
    sub_10000B624(v23, v25);
    id v27 = v26;
    id v61 = v21;
    id v28 = [v21 keyWithoutServerToken];
    sub_1000106F8();

    sub_10000E898();
    swift_bridgeObjectRelease();
    CFStringRef v29 = SecCertificateCopySubjectSummary(v27);
    unint64_t v59 = v12;
    if (v29)
    {
      unint64_t v30 = (__CFString *)v29;
      sub_1000106F8();
    }
    [(id)v6 isIdentity];
    CFDataRef v31 = SecCertificateCopyData(v27);
    v58 = v27;

    uint64_t v32 = sub_1000105A8();
    unint64_t v34 = v33;

    char v35 = self;
    NSString v36 = sub_1000106E8();
    swift_bridgeObjectRelease();
    NSString v37 = sub_1000106E8();
    swift_bridgeObjectRelease();
    Class isa = sub_1000107E8().super.super.isa;
    uint64_t v60 = v32;
    Class v39 = sub_100010598().super.isa;
    id v40 = [v35 buildRequiredOnlyWithIdentifier:v36 subjectSummary:v37 isIdentity:isa data:v39];

    unint64_t v41 = v61;
    NSString v42 = [v61 declarationIdentifier];
    if (!v42)
    {
      sub_1000106F8();
      NSString v42 = sub_1000106E8();
      unint64_t v41 = v61;
      swift_bridgeObjectRelease();
    }
    [v40 setStatusDeclarationIdentifier:v42];

    id v43 = v40;
    sub_100010778();
    uint64_t v2 = v55;
    unint64_t v10 = v59;
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1000107C8();
    }
    sub_1000107D8();
    sub_1000107B8();

    sub_10000B624(v60, v34);
    int64_t v7 = v62;
  }
  uint64_t v17 = v7 + 4;
  if (v7 + 4 < v57)
  {
    unint64_t v15 = *(void *)(v56 + 8 * v17);
    if (!v15)
    {
      while (1)
      {
        int64_t v16 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_42;
        }
        if (v16 >= v57) {
          goto LABEL_30;
        }
        unint64_t v15 = *(void *)(v56 + 8 * v16);
        ++v17;
        if (v15) {
          goto LABEL_22;
        }
      }
    }
    int64_t v16 = v7 + 4;
    goto LABEL_22;
  }
LABEL_30:
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v6 = (unint64_t)_swiftEmptyArrayStorage;
  if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
  {
    uint64_t v44 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v44) {
      goto LABEL_44;
    }
    goto LABEL_32;
  }
LABEL_43:
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_1000109F8();
  if (!v44) {
    goto LABEL_44;
  }
LABEL_32:
  uint64_t result = sub_10000D780(0, v44 & ~(v44 >> 63), 0);
  if (v44 < 0)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v44; ++i)
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v47 = (id)sub_100010978();
    }
    else {
      id v47 = *(id *)(v6 + 8 * i + 32);
    }
    uint64_t v48 = v47;
    id v49 = [v47 serializeWithType:1];
    uint64_t v50 = sub_1000106C8();

    unint64_t v52 = _swiftEmptyArrayStorage[2];
    unint64_t v51 = _swiftEmptyArrayStorage[3];
    if (v52 >= v51 >> 1) {
      sub_10000D780(v51 > 1, v52 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v52 + 1;
    _swiftEmptyArrayStorage[v52 + 4] = v50;
  }
LABEL_44:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v53 = *(uint64_t (**)(void *))(v54 + 8);
  return v53(_swiftEmptyArrayStorage);
}

uint64_t sub_10000F448()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F4B4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return _swift_task_switch(sub_10000F4D4, 0, 0);
}

uint64_t sub_10000F4D4()
{
  unint64_t v25 = v0;
  if (qword_100018BB0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000106A8();
  v0[27] = sub_10000B540(v1, (uint64_t)qword_100019348);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_100010688();
  os_log_type_t v3 = sub_100010848();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000107A8();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[24] = sub_10000CFCC(v5, v7, &v24);
    sub_100010888();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Querying status for key paths:%{public}s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = v0[25];
  unint64_t v9 = sub_10000BEC8((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v10 = *(void *)(v8 + 16);
  v0[28] = v10;
  if (v10)
  {
    v0[29] = RMModelStatusItemSecurityCertificateList;
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    while (1)
    {
      v0[30] = v9;
      v0[31] = v11;
      uint64_t v12 = v0[25] + 16 * v11;
      uint64_t v13 = *(void *)(v12 + 32);
      v0[32] = v13;
      unint64_t v14 = *(void *)(v12 + 40);
      v0[33] = v14;
      if (v13 == sub_1000106F8() && v14 == v15) {
        break;
      }
      char v17 = sub_100010A48();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v17) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100010688();
      os_log_type_t v19 = sub_100010858();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v20 + 4) = sub_10000CFCC(v13, v14, &v24);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Ignoring unknown status key path:%s", (uint8_t *)v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v11 = v0[31] + 1;
      if (v11 == v0[28])
      {
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    id v21 = (void *)swift_task_alloc();
    v0[34] = v21;
    *id v21 = v0;
    v21[1] = sub_10000F954;
    v21[16] = v0[26];
    return _swift_task_switch(sub_10000EA34, 0, 0);
  }
  else
  {
LABEL_21:
    id v22 = (uint64_t (*)(unint64_t))v0[1];
    return v22(v9);
  }
}

uint64_t sub_10000F954(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 280) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_10000FE8C;
  }
  else
  {
    *(void *)(v4 + 288) = a1;
    uint64_t v5 = sub_10000FA7C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000FA7C()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v5 = sub_100003028(&qword_100019018);
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 40) = v5;
  sub_100010458((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 80));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 184) = v4;
  unint64_t v9 = sub_10000D624(v3, v2);
  uint64_t v10 = *(void *)(v4 + 16);
  BOOL v11 = (v7 & 1) == 0;
  uint64_t v12 = (uint64_t (*)())(v10 + v11);
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    return _swift_task_switch(v12, v7, v8);
  }
  char v13 = v7;
  if (*(void *)(*(void *)(v0 + 240) + 24) >= (uint64_t)v12)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10000E1B0();
    }
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 256);
    uint64_t v14 = *(void *)(v0 + 264);
    sub_10000DC44((uint64_t)v12, isUniquelyReferenced_nonNull_native);
    unint64_t v16 = sub_10000D624(v15, v14);
    if ((v13 & 1) != (v17 & 1))
    {
      return sub_100010A68();
    }
    unint64_t v9 = v16;
  }
  os_log_type_t v19 = *(void **)(v0 + 184);
  if (v13)
  {
    uint64_t v20 = (_OWORD *)(v19[7] + 32 * v9);
    sub_100010468((uint64_t)v20);
    sub_100010458((_OWORD *)(v0 + 80), v20);
  }
  else
  {
    sub_10000DF8C(v9, *(void *)(v0 + 256), *(void *)(v0 + 264), (_OWORD *)(v0 + 80), v19);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(v0 + 248) + 1;
  if (v21 != *(void *)(v0 + 224))
  {
    while (1)
    {
      *(void *)(v0 + 240) = v19;
      *(void *)(v0 + 248) = v21;
      uint64_t v24 = *(void *)(v0 + 200) + 16 * v21;
      uint64_t v25 = *(void *)(v24 + 32);
      *(void *)(v0 + 256) = v25;
      unint64_t v26 = *(void *)(v24 + 40);
      *(void *)(v0 + 264) = v26;
      if (v25 == sub_1000106F8() && v26 == v27) {
        break;
      }
      char v29 = sub_100010A48();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v29) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_100010688();
      os_log_type_t v31 = sub_100010858();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v23 = swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v23 + 4) = sub_10000CFCC(v25, v26, &v33);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Ignoring unknown status key path:%s", (uint8_t *)v23, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v21 = *(void *)(v0 + 248) + 1;
      if (v21 == *(void *)(v0 + 224)) {
        goto LABEL_14;
      }
    }
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_10000F954;
    v32[16] = *(void *)(v0 + 208);
    uint64_t v12 = sub_10000EA34;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    return _swift_task_switch(v12, v7, v8);
  }
LABEL_14:
  swift_bridgeObjectRelease();
  id v22 = *(uint64_t (**)(void *))(v0 + 8);
  return v22(v19);
}

uint64_t sub_10000FE8C()
{
  uint64_t v40 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100010688();
  os_log_type_t v2 = sub_100010858();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v3 + 4) = v5;
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not query certificate asset keys:%{public}@", (uint8_t *)v3, 0xCu);
    sub_100003028(&qword_100019010);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(void *)(v0 + 256);
  uint64_t v6 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 240);

  swift_getErrorValue();
  uint64_t v9 = *(void *)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 152);
  *(void *)(v0 + 72) = v10;
  BOOL v11 = sub_1000103F4((uint64_t *)(v0 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v11, v9, v10);
  sub_100010458((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 112));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 168) = v8;
  unint64_t v15 = sub_10000D624(v7, v6);
  uint64_t v16 = *(void *)(v8 + 16);
  BOOL v17 = (v13 & 1) == 0;
  uint64_t v18 = (uint64_t (*)())(v16 + v17);
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    return _swift_task_switch(v18, v13, v14);
  }
  char v19 = v13;
  if (*(void *)(*(void *)(v0 + 240) + 24) >= (uint64_t)v18)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_10000E1B0();
    }
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 256);
    uint64_t v20 = *(void *)(v0 + 264);
    sub_10000DC44((uint64_t)v18, isUniquelyReferenced_nonNull_native);
    unint64_t v22 = sub_10000D624(v21, v20);
    if ((v19 & 1) != (v23 & 1))
    {
      return sub_100010A68();
    }
    unint64_t v15 = v22;
  }
  uint64_t v25 = *(void *)(v0 + 168);
  if (v19)
  {
    unint64_t v26 = (_OWORD *)(*(void *)(v25 + 56) + 32 * v15);
    sub_100010468((uint64_t)v26);
    sub_100010458((_OWORD *)(v0 + 112), v26);
  }
  else
  {
    sub_10000DF8C(v15, *(void *)(v0 + 256), *(void *)(v0 + 264), (_OWORD *)(v0 + 112), *(void **)(v0 + 168));
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  uint64_t v27 = *(void *)(v0 + 248) + 1;
  if (v27 != *(void *)(v0 + 224))
  {
    while (1)
    {
      *(void *)(v0 + 240) = v25;
      *(void *)(v0 + 248) = v27;
      uint64_t v30 = *(void *)(v0 + 200) + 16 * v27;
      uint64_t v31 = *(void *)(v30 + 32);
      *(void *)(v0 + 256) = v31;
      unint64_t v32 = *(void *)(v30 + 40);
      *(void *)(v0 + 264) = v32;
      if (v31 == sub_1000106F8() && v32 == v33) {
        break;
      }
      char v35 = sub_100010A48();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v35) {
        break;
      }
      swift_bridgeObjectRetain();
      NSString v36 = sub_100010688();
      os_log_type_t v37 = sub_100010858();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v29 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v29 + 4) = sub_10000CFCC(v31, v32, &v39);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "Ignoring unknown status key path:%s", (uint8_t *)v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v27 = *(void *)(v0 + 248) + 1;
      if (v27 == *(void *)(v0 + 224)) {
        goto LABEL_17;
      }
    }
    char v38 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v38;
    *char v38 = v0;
    v38[1] = sub_10000F954;
    v38[16] = *(void *)(v0 + 208);
    uint64_t v18 = sub_10000EA34;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    return _swift_task_switch(v18, v13, v14);
  }
LABEL_17:
  swift_bridgeObjectRelease();
  id v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v28(v25);
}

uint64_t *sub_1000103F4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_100010458(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100010468(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000104BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000B624(a1, a2);
  }
  return a1;
}

uint64_t sub_1000104D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003028(&qword_100019050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010538()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t sub_100010548()
{
  return CustomNSError.errorCode.getter();
}

uint64_t sub_100010558()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100010568()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100010578()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100010588()
{
  return _convertErrorToNSError(_:)();
}

NSData sub_100010598()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000105A8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000105B8()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_1000105C8()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t sub_1000105D8()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_1000105E8()
{
  return static Date.FormatStyle.DateStyle.abbreviated.getter();
}

uint64_t sub_1000105F8()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_100010608()
{
  return static Date.now.getter();
}

uint64_t sub_100010618()
{
  return Date.formatted(date:time:)();
}

uint64_t sub_100010628()
{
  return type metadata accessor for Date();
}

uint64_t sub_100010638()
{
  return dispatch thunk of static ManagedKeychainPublic.copyCertificate(persistentRef:scope:persona:)();
}

uint64_t sub_100010648()
{
  return type metadata accessor for ManagedKeychainPublic();
}

uint64_t sub_100010658()
{
  return RMAdapterError.underlyingErrorDescription(_:)();
}

uint64_t sub_100010688()
{
  return Logger.logObject.getter();
}

uint64_t sub_100010698()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000106A8()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_1000106B8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000106C8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000106D8()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString sub_1000106E8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000106F8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010708()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_100010718()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100010728()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100010738()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100010748()
{
  return String.hash(into:)();
}

void sub_100010758(Swift::String a1)
{
}

Swift::Int sub_100010768()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100010778()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100010788()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100010798()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000107A8()
{
  return Array.description.getter();
}

uint64_t sub_1000107B8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000107C8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000107D8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_1000107E8()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_1000107F8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100010808()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100010818()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100010828()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100010838()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100010848()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100010858()
{
  return static os_log_type_t.error.getter();
}

Swift::Int sub_100010868(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100010878()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100010888()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100010898()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000108A8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000108B8()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000108C8()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000108D8()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000108E8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000108F8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100010908()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100010918()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100010928()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100010938()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100010948()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100010958(Swift::Int a1)
{
}

uint64_t sub_100010968()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100010978()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100010988()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100010998()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000109A8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000109B8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000109C8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000109D8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000109E8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000109F8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100010A08()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100010A18()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100010A28()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100010A38()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100010A48()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100010A58()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100010A68()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100010A98()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100010AA8()
{
  return Error._userInfo.getter();
}

uint64_t sub_100010AB8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100010AC8()
{
  return Hasher._finalize()();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return _SecCertificateCopyIssuerSummary();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return _SecCertificateCopySubjectSummary(certificate);
}

uint64_t SecCertificateNotValidAfter()
{
  return _SecCertificateNotValidAfter();
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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