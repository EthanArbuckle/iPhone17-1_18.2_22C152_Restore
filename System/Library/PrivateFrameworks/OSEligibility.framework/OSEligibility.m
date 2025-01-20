uint64_t static OSEligibilityResult.result(for:bundleID:persona:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  char v12;
  char v13;
  char v14;
  char v15;

  v7 = *a1;
  if (sub_257DBB60C(a2, a3, a4, a5))
  {
    v14 = v7;
    v13 = 3;
    sub_257DBDA20(&v12);
    v8 = sub_257DBDA2C();
    v9 = sub_257DBDA38();
    sub_257DBDA44(&v14, &v13, &v12, v8, v9, a6);
    *(unsigned char *)(a6 + 2) = 1;
    v10 = sub_257DBA3FC(MEMORY[0x263F8EE78]);
    swift_bridgeObjectRelease();
    *(void *)(a6 + 8) = v10;
    result = swift_bridgeObjectRelease();
    *(void *)(a6 + 16) = MEMORY[0x263F8EE88];
  }
  else
  {
    v15 = v7;
    return static OSEligibilityResult.result(for:)(&v15, a6);
  }
  return result;
}

unint64_t sub_257DBA3FC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E5A0);
  v2 = (void *)sub_257DC2DA8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (char *)(a1 + 33);
  while (1)
  {
    unsigned __int8 v5 = *(v4 - 1);
    char v6 = *v4;
    unint64_t result = sub_257DBB4D8(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(unsigned char *)(v2[7] + result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v11;
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

uint64_t static OSEligibilityResult.result(for:auditToken:)@<X0>(char *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v7 = *a1;
  if (sub_257DBC2A0(a2, a3, a4, a5))
  {
    char v14 = v7;
    char v13 = 3;
    sub_257DBDA20(&v12);
    unint64_t v8 = sub_257DBDA2C();
    uint64_t v9 = sub_257DBDA38();
    sub_257DBDA44(&v14, &v13, &v12, v8, v9, a6);
    *(unsigned char *)(a6 + 2) = 1;
    unint64_t v10 = sub_257DBA3FC(MEMORY[0x263F8EE78]);
    swift_bridgeObjectRelease();
    *(void *)(a6 + 8) = v10;
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(a6 + 16) = MEMORY[0x263F8EE88];
  }
  else
  {
    char v15 = v7;
    return static OSEligibilityResult.result(for:)(&v15, a6);
  }
  return result;
}

uint64_t OSEligibilityQuery.answer.getter()
{
  return *(void *)(v0 + OBJC_IVAR___OSEligibilityQuery_answer);
}

uint64_t OSEligibilityQuery.answerSource.getter()
{
  return *(void *)(v0 + OBJC_IVAR___OSEligibilityQuery_answerSource);
}

uint64_t OSEligibilityQuery.status.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t OSEligibilityQuery.context.getter()
{
  return swift_unknownObjectRetain();
}

id sub_257DBA6E8(Swift::UInt64 a1)
{
  v4 = v1;
  sub_257DC1F4C(a1, &v14);
  static OSEligibilityResult.result(for:)(&v14, (uint64_t)&v15);
  if (v2)
  {

    type metadata accessor for OSEligibilityQuery(v5);
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    char v7 = v15;
    char v8 = v16;
    char v9 = v17;
    uint64_t v10 = v18;
    uint64_t v11 = v19;
    char v15 = v16;
    *(void *)&v4[OBJC_IVAR___OSEligibilityQuery_answer] = sub_257DBC9D4();
    char v15 = v9 & 1;
    *(void *)&v4[OBJC_IVAR___OSEligibilityQuery_answerSource] = sub_257DBC9EC();
    char v15 = v7;
    char v16 = v8;
    char v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = v11;
    *(void *)&v4[OBJC_IVAR___OSEligibilityQuery_status] = sub_257DBDA64();
    char v15 = v7;
    char v16 = v8;
    char v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = v11;
    xpc_object_t v12 = sub_257DBDAD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&v4[OBJC_IVAR___OSEligibilityQuery_context] = v12;

    v13.receiver = v4;
    v13.super_class = (Class)OSEligibilityQuery;
    return objc_msgSendSuper2(&v13, sel_init);
  }
}

id sub_257DBA8B8(Swift::UInt64 a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  xpc_object_t v12 = v5;
  sub_257DC1F4C(a1, &v22);
  static OSEligibilityResult.result(for:bundleID:persona:)(&v22, a2, a3, a4, a5, (uint64_t)&v23);
  swift_bridgeObjectRelease();
  if (v6)
  {

    uint64_t v13 = swift_bridgeObjectRelease();
    type metadata accessor for OSEligibilityQuery(v13);
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v15 = v23;
    char v16 = v24;
    char v17 = v25;
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    char v23 = v24;
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_answer] = sub_257DBC9D4();
    char v23 = v17 & 1;
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_answerSource] = sub_257DBC9EC();
    char v23 = v15;
    char v24 = v16;
    char v25 = v17;
    uint64_t v26 = v18;
    uint64_t v27 = v19;
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_status] = sub_257DBDA64();
    char v23 = v15;
    char v24 = v16;
    char v25 = v17;
    uint64_t v26 = v18;
    uint64_t v27 = v19;
    xpc_object_t v20 = sub_257DBDAD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_context] = v20;

    v21.receiver = v12;
    v21.super_class = (Class)OSEligibilityQuery;
    return objc_msgSendSuper2(&v21, sel_init);
  }
}

id sub_257DBAB0C(Swift::UInt64 a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  xpc_object_t v12 = v5;
  sub_257DC1F4C(a1, &v22);
  static OSEligibilityResult.result(for:auditToken:)(&v22, a2, a3, a4, a5, (uint64_t)&v23);
  if (v6)
  {

    type metadata accessor for OSEligibilityQuery(v13);
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    char v15 = v23;
    char v16 = v24;
    char v17 = v25;
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    char v23 = v24;
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_answer] = sub_257DBC9D4();
    char v23 = v17 & 1;
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_answerSource] = sub_257DBC9EC();
    char v23 = v15;
    char v24 = v16;
    char v25 = v17;
    uint64_t v26 = v18;
    uint64_t v27 = v19;
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_status] = sub_257DBDA64();
    char v23 = v15;
    char v24 = v16;
    char v25 = v17;
    uint64_t v26 = v18;
    uint64_t v27 = v19;
    xpc_object_t v20 = sub_257DBDAD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&v12[OBJC_IVAR___OSEligibilityQuery_context] = v20;

    v21.receiver = v12;
    v21.super_class = (Class)OSEligibilityQuery;
    return objc_msgSendSuper2(&v21, sel_init);
  }
}

void __swiftcall OSEligibilityQuery.init()(OSEligibilityQuery *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void OSEligibilityQuery.init()()
{
}

id sub_257DBADA4(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_257DC2C28();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_257DC2B18();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_257DBAE80(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_257DBAF54(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_257DBC838((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_257DBC838((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_257DBAF54(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_257DC2CE8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_257DBB110(a5, a6);
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
  uint64_t v8 = sub_257DC2D58();
  if (!v8)
  {
    sub_257DC2D68();
    __break(1u);
LABEL_17:
    uint64_t result = sub_257DC2DB8();
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

uint64_t sub_257DBB110(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_257DBB1A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_257DBB388(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_257DBB388(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_257DBB1A8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_257DBB320(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_257DC2D38();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_257DC2D68();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_257DC2C88();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_257DC2DB8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_257DC2D68();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_257DBB320(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E598);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_257DBB388(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E598);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_257DC2DB8();
  __break(1u);
  return result;
}

unint64_t sub_257DBB4D8(uint64_t a1)
{
  sub_257DBC898();
  uint64_t v2 = sub_257DC2C08();
  return sub_257DBB544(a1, v2);
}

unint64_t sub_257DBB544(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    sub_257DBC8EC();
    do
    {
      if (sub_257DC2C18()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_257DBB60C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v88 = a4;
  uint64_t v89 = a3;
  uint64_t v91 = sub_257DC2B48();
  unint64_t v6 = *(void *)(v91 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v91);
  int64_t v9 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v83 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  char v15 = (char *)&v83 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v83 - v17;
  MEMORY[0x270FA5388](v16);
  xpc_object_t v20 = (char *)&v83 - v19;
  id v21 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  uint64_t v90 = a1;
  char v22 = a2;
  id v23 = sub_257DBADA4(a1, a2, 0);
  v31 = v20;
  uint64_t v32 = v89;
  uint64_t v86 = (uint64_t)v15;
  v87 = v12;
  if (!v23)
  {
    uint64_t v24 = sub_257DC2A2C();
    uint64_t v25 = v91;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v24, v91);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_257DC2B28();
    os_log_type_t v27 = sub_257DC2CC8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v93[0] = v29;
      *(_DWORD *)v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_257DBAE80(v90, a2, v93);
      sub_257DC2CD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_257DB8000, v26, v27, "No app record found for %s so not bypassing eligibility", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C4570](v29, -1, -1);
      MEMORY[0x25A2C4570](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v91);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v25);
    }
    return 0;
  }
  unint64_t v33 = v88;
  uint64_t v34 = v91;
  if (!v88)
  {
    v85 = v22;
    uint64_t v46 = v91;
    unint64_t v88 = v6;
    uint64_t v47 = (uint64_t)v23;
    uint64_t v89 = (uint64_t)v23;
    id v48 = objc_msgSend((id)v89, sel_identities);
    sub_257DBC940(0, &qword_26A05E5B8);
    unint64_t v49 = sub_257DC2CA8();

    if (v49 >> 62) {
      goto LABEL_38;
    }
    uint64_t v50 = *(void *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      v51 = v18;
      id v84 = (id)v47;
      if (!v50) {
        break;
      }
      uint64_t v47 = 4;
      uint64_t v18 = (char *)0x265431000;
      while (1)
      {
        id v52 = (v49 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x25A2C40D0](v47 - 4, v49)
            : *(id *)(v49 + 8 * v47);
        v53 = v52;
        uint64_t v54 = v47 - 3;
        if (__OFADD__(v47 - 4, 1)) {
          break;
        }
        id v55 = objc_msgSend(v52, sel_personaType);

        if (v55 == (id)1)
        {
          swift_bridgeObjectRelease_n();
          unint64_t v33 = 0xE800000000000000;
          uint64_t v89 = 0x6C616E6F73726570;
          unint64_t v38 = v88;
          uint64_t v34 = v46;
          id v35 = v84;
          char v22 = v85;
          goto LABEL_27;
        }
        ++v47;
        if (v54 == v50) {
          goto LABEL_21;
        }
      }
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_257DC2D78();
    }
LABEL_21:
    swift_bridgeObjectRelease_n();
    uint64_t v56 = sub_257DC2A2C();
    unint64_t v57 = v88;
    (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v51, v56, v46);
    v58 = v85;
    swift_bridgeObjectRetain_n();
    v59 = sub_257DC2B28();
    os_log_type_t v60 = sub_257DC2CC8();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      v93[0] = v62;
      *(_DWORD *)v61 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_257DBAE80(v90, (unint64_t)v58, v93);
      sub_257DC2CD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_257DB8000, v59, v60, "Personal persona not found for %s so not bypassing eligibility", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2C4570](v62, -1, -1);
      MEMORY[0x25A2C4570](v61, -1, -1);
      id v63 = (id)v89;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v59 = v89;
    }
    (*(void (**)(char *, uint64_t))(v57 + 8))(v51, v46);
    return 0;
  }
  id v35 = v23;
  v36 = v23;
  swift_bridgeObjectRetain();
  v37 = (void *)sub_257DC2C28();
  v85 = v36;
  LOBYTE(v36) = [v36 personaIsApplicable:v37];

  unint64_t v38 = v6;
  if ((v36 & 1) == 0)
  {
    uint64_t v39 = sub_257DC2A2C();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v31, v39, v34);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v40 = sub_257DC2B28();
    os_log_type_t v41 = sub_257DC2CC8();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      v87 = v31;
      uint64_t v43 = v42;
      v93[0] = swift_slowAlloc();
      uint64_t v44 = v93[0];
      *(_DWORD *)uint64_t v43 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_257DBAE80(v32, v33, v93);
      sub_257DC2CD8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_257DBAE80(v90, (unint64_t)v22, v93);
      sub_257DC2CD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_257DB8000, v40, v41, "Persona %s not applicable for %s so not bypassing eligibility", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2C4570](v44, -1, -1);
      MEMORY[0x25A2C4570](v43, -1, -1);
      v45 = v85;

      (*(void (**)(char *, uint64_t))(v6 + 8))(v87, v91);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v64 = v85;

      (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v34);
    }
    return 0;
  }
LABEL_27:
  unsigned int v65 = objc_msgSend(v35, sel_isProfileValidated);
  unsigned int v66 = objc_msgSend(v35, sel_isUPPValidated);
  unsigned int v67 = objc_msgSend(v35, sel_isBeta);
  uint64_t v68 = sub_257DC2A2C();
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
  v70 = v87;
  if (!v65 || (v66 & 1) != 0 || (v67 & 1) != 0)
  {
    v69(v87, v68, v34);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v76 = sub_257DC2B28();
    os_log_type_t v77 = sub_257DC2CC8();
    LODWORD(v88) = v77;
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = swift_slowAlloc();
      v85 = v76;
      uint64_t v79 = v78;
      uint64_t v86 = swift_slowAlloc();
      v93[0] = v86;
      *(_DWORD *)uint64_t v79 = 136316162;
      id v84 = v35;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_257DBAE80(v90, (unint64_t)v22, v93);
      sub_257DC2CD8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v79 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_257DBAE80(v89, v33, v93);
      sub_257DC2CD8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v79 + 22) = 1024;
      LODWORD(v92) = v65;
      sub_257DC2CD8();
      *(_WORD *)(v79 + 28) = 1024;
      LODWORD(v92) = v66;
      sub_257DC2CD8();
      *(_WORD *)(v79 + 34) = 1024;
      LODWORD(v92) = v67;
      sub_257DC2CD8();
      v80 = v85;
      _os_log_impl(&dword_257DB8000, v85, (os_log_type_t)v88, "Not bypassing eligibility for %s:%s (isProfileValidated: %{BOOL}d isUPPValidated:%{BOOL}d isBeta:%{BOOL}d", (uint8_t *)v79, 0x28u);
      uint64_t v81 = v86;
      swift_arrayDestroy();
      MEMORY[0x25A2C4570](v81, -1, -1);
      MEMORY[0x25A2C4570](v79, -1, -1);
      id v82 = v84;

      (*(void (**)(char *, uint64_t))(v38 + 8))(v87, v91);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v38 + 8))(v70, v34);
    }
    return 0;
  }
  uint64_t v71 = v86;
  v69((char *)v86, v68, v34);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v72 = sub_257DC2B28();
  os_log_type_t v73 = sub_257DC2CC8();
  if (os_log_type_enabled(v72, v73))
  {
    uint64_t v74 = swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    v93[0] = v75;
    *(_DWORD *)uint64_t v74 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v92 = sub_257DBAE80(v90, (unint64_t)v22, v93);
    sub_257DC2CD8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v74 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v92 = sub_257DBAE80(v89, v33, v93);
    sub_257DC2CD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_257DB8000, v72, v73, "Bypassing eligibility for %s:%s", (uint8_t *)v74, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2C4570](v75, -1, -1);
    MEMORY[0x25A2C4570](v74, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v86, v91);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v71, v34);
  }
  return 1;
}

uint64_t sub_257DBC2A0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v4 = a4;
  unint64_t v8 = HIDWORD(a1);
  unint64_t v9 = HIDWORD(a2);
  uint64_t v58 = *MEMORY[0x263EF8340];
  unint64_t v10 = HIDWORD(a3);
  unint64_t v11 = HIDWORD(a4);
  uint64_t v12 = sub_257DC2B48();
  uint64_t v54 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v46 = (char *)&v44 - v16;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  unint64_t v47 = v8;
  unint64_t v48 = a1;
  token.val[0] = a1;
  token.val[1] = v8;
  unint64_t v49 = a2;
  unint64_t v50 = a3;
  token.val[2] = a2;
  token.val[3] = v9;
  unint64_t v51 = v9;
  unint64_t v52 = v10;
  token.val[4] = a3;
  token.val[5] = v10;
  token.val[6] = v4;
  token.val[7] = v11;
  unint64_t v53 = v11;
  uint64_t v18 = SecTaskCreateWithAuditToken(v17, &token);
  if (!v18)
  {
    uint64_t v26 = sub_257DC2A2C();
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v15, v26, v12);
    os_log_type_t v27 = sub_257DC2B28();
    os_log_type_t v28 = sub_257DC2CB8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = v12;
      v30 = v29;
      *(_DWORD *)uint64_t v29 = 67109120;
      token.val[0] = v48;
      token.val[1] = v47;
      token.val[2] = v49;
      token.val[3] = v51;
      token.val[4] = v50;
      token.val[5] = v52;
      token.val[6] = v4;
      token.val[7] = v53;
      token.val[0] = audit_token_to_pid(&token);
      sub_257DC2CD8();
      _os_log_impl(&dword_257DB8000, v27, v28, "Could not create SecTask from audit token for pid %d", v30, 8u);
      v31 = v30;
      uint64_t v12 = v45;
      MEMORY[0x25A2C4570](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v12);
    goto LABEL_13;
  }
  uint64_t v19 = v18;
  CFErrorRef error = 0;
  CFStringRef v20 = SecTaskCopySigningIdentifier(v18, &error);
  if (!v20)
  {
    uint64_t v32 = sub_257DC2A2C();
    unint64_t v33 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v46, v32, v12);
    uint64_t v34 = sub_257DC2B28();
    os_log_type_t v35 = sub_257DC2CB8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v45 = v12;
      uint64_t v37 = v36;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v55 = v44;
      *(_DWORD *)uint64_t v37 = 67109378;
      token.val[0] = v48;
      token.val[1] = v47;
      token.val[2] = v49;
      token.val[3] = v51;
      token.val[4] = v50;
      token.val[5] = v52;
      uint64_t v38 = v54;
      token.val[6] = v4;
      token.val[7] = v53;
      token.val[0] = audit_token_to_pid(&token);
      sub_257DC2CD8();
      *(_WORD *)(v37 + 8) = 2080;
      swift_beginAccess();
      *(void *)token.val = error;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E590);
      uint64_t v39 = sub_257DC2C48();
      *(void *)token.val = sub_257DBAE80(v39, v40, &v55);
      sub_257DC2CD8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_257DB8000, v34, v35, "Could not get signing identifier for pid %d: %s", (uint8_t *)v37, 0x12u);
      uint64_t v41 = v44;
      swift_arrayDestroy();
      MEMORY[0x25A2C4570](v41, -1, -1);
      MEMORY[0x25A2C4570](v37, -1, -1);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v33, v45);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v54 + 8))(v33, v12);
    }
    swift_beginAccess();
    CFErrorRef v42 = error;

    if (v42) {
LABEL_13:
    }
    char v24 = 0;
    return v24 & 1;
  }
  id v21 = (__CFString *)v20;
  uint64_t v22 = sub_257DC2C38();
  char v24 = sub_257DBB60C(v22, v23, 0, 0);

  swift_bridgeObjectRelease();
  swift_beginAccess();
  CFErrorRef v25 = error;

  if (v25) {
  return v24 & 1;
  }
}

uint64_t type metadata accessor for OSEligibilityQuery(uint64_t a1)
{
  return sub_257DBC940(a1, qword_26A05E620);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_257DBC838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_257DBC898()
{
  unint64_t result = qword_26A05E5A8;
  if (!qword_26A05E5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5A8);
  }
  return result;
}

unint64_t sub_257DBC8EC()
{
  unint64_t result = qword_26A05E5B0;
  if (!qword_26A05E5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5B0);
  }
  return result;
}

uint64_t sub_257DBC940(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for CFError()
{
  if (!qword_26A05E5C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A05E5C0);
    }
  }
}

uint64_t sub_257DBC9D4()
{
  return *v0 + 1;
}

uint64_t sub_257DBC9EC()
{
  if (*v0) {
    return 2;
  }
  else {
    return 1;
  }
}

BOOL static OSEligibilityAnswerSource.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t OSEligibilityAnswerSource.hash(into:)()
{
  return sub_257DC2E48();
}

uint64_t OSEligibilityAnswerSource.hashValue.getter()
{
  return sub_257DC2E68();
}

BOOL sub_257DBCA8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s13OSEligibility0A6AnswerO9hashValueSivg_0()
{
  return sub_257DC2E68();
}

uint64_t sub_257DBCAEC()
{
  return sub_257DC2E48();
}

uint64_t sub_257DBCB18()
{
  return sub_257DC2E68();
}

uint64_t sub_257DBCB5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t result = 0xD000000000000025;
  if (a1 == 0xD000000000000025 && a2 == 0x8000000257DC4300)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t result = sub_257DC2DC8();
    char v7 = 0;
    if ((result & 1) == 0)
    {
      if (a1 == 0xD000000000000024 && a2 == 0x8000000257DC4330 || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
      {
        char v7 = 1;
      }
      else
      {
        uint64_t result = 0xD000000000000021;
        if (a1 == 0xD000000000000021 && a2 == 0x8000000257DC4360 || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
        {
          char v7 = 2;
        }
        else if (a1 == 0xD000000000000022 && a2 == 0x8000000257DC4390 {
               || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
        }
        {
          char v7 = 3;
        }
        else
        {
          uint64_t result = 0xD000000000000023;
          if (a1 == 0xD000000000000023 && a2 == 0x8000000257DC43C0 || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
          {
            char v7 = 4;
          }
          else
          {
            uint64_t result = 0xD000000000000027;
            if (a1 == 0xD000000000000027 && a2 == 0x8000000257DC43F0
              || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
            {
              char v7 = 5;
            }
            else if (a1 == 0xD000000000000024 && a2 == 0x8000000257DC4420 {
                   || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
            }
            {
              char v7 = 6;
            }
            else
            {
              uint64_t result = 0xD00000000000002CLL;
              if (a1 == 0xD00000000000002CLL && a2 == 0x8000000257DC4450
                || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
              {
                char v7 = 7;
              }
              else if (a1 == 0xD000000000000028 && a2 == 0x8000000257DC4480 {
                     || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
              }
              {
                char v7 = 8;
              }
              else if (a1 == 0xD000000000000022 && a2 == 0x8000000257DC44B0 {
                     || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
              }
              {
                char v7 = 9;
              }
              else if (a1 == 0xD000000000000028 && a2 == 0x8000000257DC44E0 {
                     || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
              }
              {
                char v7 = 10;
              }
              else
              {
                uint64_t result = 0xD000000000000020;
                if (a1 == 0xD000000000000020 && a2 == 0x8000000257DC4510
                  || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
                {
                  char v7 = 11;
                }
                else
                {
                  uint64_t result = 0xD00000000000002BLL;
                  if (a1 == 0xD00000000000002BLL && a2 == 0x8000000257DC4540
                    || (uint64_t result = sub_257DC2DC8(), (result & 1) != 0))
                  {
                    char v7 = 12;
                  }
                  else
                  {
                    uint64_t result = 0xD00000000000001ELL;
                    char v7 = 13;
                    if (a1 != 0xD00000000000001ELL || a2 != 0x8000000257DC4570)
                    {
                      uint64_t result = sub_257DC2DC8();
                      if (result) {
                        char v7 = 13;
                      }
                      else {
                        char v7 = 14;
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
  *a3 = v7;
  return result;
}

uint64_t sub_257DBCFA4(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t result = sub_257DBCB5C(a1, a2, (char *)&v15);
  uint64_t v7 = v15;
  if (v15 != 14)
  {
    uint64_t result = xpc_int64_get_value(a3);
    if ((result & 0x8000000000000000) == 0)
    {
      char v8 = result - 1;
      if (unint64_t)(result - 1) <= 6 && ((0x77u >> v8))
      {
        unint64_t v13 = 0x5040300020100uLL >> (8 * v8);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v15 = *a4;
        *a4 = 0x8000000000000000;
        sub_257DBE750(v13, v7, isUniquelyReferenced_nonNull_native);
        *a4 = v15;
      }
      else
      {
        uint64_t result = sub_257DBB4D8(v7);
        if ((v9 & 1) == 0) {
          return result;
        }
        unint64_t v10 = result;
        char v11 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v12 = *a4;
        uint64_t v15 = *a4;
        *a4 = 0x8000000000000000;
        if ((v11 & 1) == 0)
        {
          sub_257DBE87C();
          uint64_t v12 = v15;
        }
        sub_257DBE594(v10, v12);
        *a4 = v12;
      }
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

unint64_t OSEligibilityInput.bridgedInputKey.getter()
{
  unint64_t result = 0xD000000000000025;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000024;
      break;
    case 2:
      unint64_t result = 0xD000000000000021;
      break;
    case 3:
    case 9:
      unint64_t result = 0xD000000000000022;
      break;
    case 4:
      unint64_t result = 0xD000000000000023;
      break;
    case 5:
      unint64_t result = 0xD000000000000027;
      break;
    case 6:
      unint64_t result = 0xD000000000000024;
      break;
    case 7:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000028;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000028;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000020;
      break;
    case 0xC:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 0xD:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static OSEligibilityInputStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t OSEligibilityInputStatus.hash(into:)()
{
  return sub_257DC2E48();
}

BOOL sub_257DBD25C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t OSEligibilityContext.hash(into:)()
{
  uint64_t v1 = *v0;
  if (*((unsigned char *)v0 + 16) && *((unsigned char *)v0 + 16) != 1)
  {
    sub_257DC2E48();
    uint64_t result = sub_257DC2E48();
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3)
    {
      uint64_t v4 = v1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_257DC2C68();
        uint64_t result = swift_bridgeObjectRelease();
        v4 += 16;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    sub_257DC2E48();
    return sub_257DC2C68();
  }
  return result;
}

uint64_t sub_257DBD344(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_257DC2DC8(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    char v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_257DC2DC8() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t OSEligibilityContext.hashValue.getter()
{
  uint64_t v1 = *v0;
  unsigned int v2 = *((unsigned __int8 *)v0 + 16);
  sub_257DC2E38();
  if (v2 > 1)
  {
    sub_257DC2E48();
    sub_257DC2E48();
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3)
    {
      uint64_t v4 = v1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_257DC2C68();
        swift_bridgeObjectRelease();
        v4 += 16;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    sub_257DC2E48();
    sub_257DC2C68();
  }
  return sub_257DC2E68();
}

uint64_t sub_257DBD4E0()
{
  uint64_t v1 = *v0;
  unsigned int v2 = *((unsigned __int8 *)v0 + 16);
  sub_257DC2E38();
  if (v2 > 1)
  {
    sub_257DC2E48();
    uint64_t v3 = *(void *)(v1 + 16);
    sub_257DC2E48();
    if (v3)
    {
      uint64_t v4 = v1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_257DC2C68();
        swift_bridgeObjectRelease();
        v4 += 16;
        --v3;
      }
      while (v3);
    }
  }
  else
  {
    sub_257DC2E48();
    sub_257DC2C68();
  }
  return sub_257DC2E68();
}

void OSEligibilityResult.domain.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *OSEligibilityResult.domain.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*OSEligibilityResult.domain.modify())()
{
  return nullsub_1;
}

void OSEligibilityResult.answer.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *OSEligibilityResult.answer.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*OSEligibilityResult.answer.modify())()
{
  return nullsub_1;
}

void OSEligibilityResult.answerSource.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 2);
}

unsigned char *OSEligibilityResult.answerSource.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 2) = *result;
  return result;
}

uint64_t (*OSEligibilityResult.answerSource.modify())()
{
  return nullsub_1;
}

uint64_t OSEligibilityResult.statusByInput.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t OSEligibilityResult.statusByInput.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*OSEligibilityResult.statusByInput.modify())()
{
  return nullsub_1;
}

uint64_t OSEligibilityResult.context.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t OSEligibilityResult.context.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*OSEligibilityResult.context.modify())()
{
  return nullsub_1;
}

uint64_t static OSEligibilityResult.result(for:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_257DC2B88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *a1;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  LOBYTE(v29) = v8;
  OSEligibilityDomain.bridgedDomainType.getter();
  unsigned int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    uint64_t v10 = domain_answer;
    sub_257DC0F30();
    swift_allocError();
    *(void *)uint64_t v11 = v10;
    *(unsigned char *)(v11 + 8) = 0;
LABEL_15:
    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  uint64_t v12 = v31;
  char v13 = v31 - 1;
  if ((unint64_t)(v31 - 1) > 3)
  {
    sub_257DC0F30();
    swift_allocError();
    *(void *)uint64_t v20 = v12;
    *(unsigned char *)(v20 + 8) = 1;
    goto LABEL_15;
  }
  uint64_t v14 = v33;
  v27[2] = sub_257DBFB70(MEMORY[0x263F8EE78]);
  if (v30 == 2) {
    int v15 = 1;
  }
  else {
    int v15 = 2;
  }
  if (v30 == 1) {
    int v16 = 0;
  }
  else {
    int v16 = v15;
  }
  int v28 = v16;
  if (v14)
  {
    uint64_t v17 = swift_unknownObjectRetain_n();
    uint64_t v18 = MEMORY[0x25A2C4640](v17);
    if (v18 == sub_257DC2B58())
    {
      unint64_t v29 = sub_257DBFB70(MEMORY[0x263F8EE78]);
      swift_unknownObjectRetain();
      uint64_t v22 = sub_257DC2BA8();
      v27[1] = v27;
      MEMORY[0x270FA5388](v22);
      v27[-2] = &v29;
      sub_257DC2B78();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_unknownObjectRelease();
      unint64_t v19 = v29;
      goto LABEL_18;
    }
    swift_unknownObjectRelease_n();
  }
  unint64_t v19 = sub_257DBFB70(MEMORY[0x263F8EE78]);
LABEL_18:
  swift_bridgeObjectRelease();
  unint64_t v23 = (void *)swift_unknownObjectRetain();
  uint64_t v24 = sub_257DBFC74(v23);
  uint64_t v25 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  if (v24) {
    uint64_t v26 = v24;
  }
  else {
    uint64_t v26 = v25;
  }
  *(unsigned char *)a2 = v8;
  *(unsigned char *)(a2 + 1) = v13;
  *(unsigned char *)(a2 + 2) = v28;
  *(void *)(a2 + 8) = v19;
  *(void *)(a2 + 16) = v26;
  return swift_unknownObjectRelease();
}

void sub_257DBDA20(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

unint64_t sub_257DBDA2C()
{
  return sub_257DBFB70(MEMORY[0x263F8EE78]);
}

uint64_t sub_257DBDA38()
{
  return MEMORY[0x263F8EE88];
}

unsigned char *sub_257DBDA44@<X0>(unsigned char *result@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6 = *a2;
  char v7 = *a3;
  *(unsigned char *)a6 = *result;
  *(unsigned char *)(a6 + 1) = v6;
  *(unsigned char *)(a6 + 2) = v7;
  *(void *)(a6 + 8) = a4;
  *(void *)(a6 + 16) = a5;
  return result;
}

xpc_object_t sub_257DBDA64()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_257DC0988(v0, (uint64_t (*)(char *, char *))sub_257DC0F84);
  swift_bridgeObjectRelease();
  return empty;
}

xpc_object_t sub_257DBDAD4()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  swift_unknownObjectRetain();
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_257DC0B10(v1, empty);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return empty;
}

unint64_t sub_257DBDB3C(unint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  unint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  unint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    int v15 = *(unsigned __int8 *)(*(void *)(v3 + 56) + v11);
    uint64_t result = sub_257DBB4D8(*(unsigned __int8 *)(*(void *)(v3 + 48) + v11));
    if ((v16 & 1) == 0 || *(unsigned __int8 *)(*(void *)(a2 + 56) + result) != v15) {
      return 0;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_257DBDCBC(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v43 = result + 56;
  uint64_t v44 = result;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v45 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v49 = a2 + 56;
  if ((v6 & v4) == 0) {
    goto LABEL_8;
  }
  while (2)
  {
    unint64_t v8 = __clz(__rbit64(v7));
    uint64_t v9 = (v7 - 1) & v7;
    unint64_t v10 = v8 | (v3 << 6);
LABEL_24:
    uint64_t v14 = *(void *)(result + 48) + 24 * v10;
    int v15 = *(void **)v14;
    uint64_t v16 = *(void *)(v14 + 8);
    unsigned int v17 = *(unsigned __int8 *)(v14 + 16);
    sub_257DC2E38();
    unint64_t v47 = v9;
    int64_t v48 = v3;
    if (v17 > 1)
    {
      sub_257DC2E48();
      sub_257DC2E48();
      uint64_t v18 = v15[2];
      if (v18)
      {
        swift_bridgeObjectRetain();
        unint64_t v19 = v15 + 5;
        do
        {
          swift_bridgeObjectRetain();
          sub_257DC2C68();
          swift_bridgeObjectRelease();
          v19 += 2;
          --v18;
        }
        while (v18);
      }
      else
      {
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      sub_257DC2E48();
      swift_bridgeObjectRetain();
      sub_257DC2C68();
    }
    uint64_t v20 = sub_257DC2E68();
    uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v22 = v20 & ~v21;
    uint64_t v23 = v49;
    if (((*(void *)(v49 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
    {
LABEL_85:
      sub_257DC0968((uint64_t)v15, v16, v17);
      return 0;
    }
    uint64_t v50 = ~v21;
    while (1)
    {
      uint64_t v25 = *(void *)(v2 + 48) + 24 * v22;
      os_log_type_t v27 = *(void **)v25;
      uint64_t v26 = *(void *)(v25 + 8);
      int v28 = *(unsigned __int8 *)(v25 + 16);
      if (!*(unsigned char *)(v25 + 16)) {
        break;
      }
      if (v28 != 1)
      {
        if (v17 == 2)
        {
          uint64_t v34 = v27[2];
          if (v34 == v15[2])
          {
            if (v34) {
              BOOL v35 = v27 == v15;
            }
            else {
              BOOL v35 = 1;
            }
            if (v35)
            {
LABEL_79:
              sub_257DC1900((uint64_t)v27, v26, 2u);
              sub_257DC0968((uint64_t)v27, v26, 2u);
              uint64_t v2 = a2;
              goto LABEL_80;
            }
            BOOL v36 = v27[4] == v15[4] && v27[5] == v15[5];
            if (v36 || (sub_257DC2DC8() & 1) != 0)
            {
              if (v34 == 1) {
                goto LABEL_79;
              }
              BOOL v37 = v27[6] == v15[6] && v27[7] == v15[7];
              if (v37 || (sub_257DC2DC8() & 1) != 0)
              {
                uint64_t v38 = v34 - 2;
                if (!v38) {
                  goto LABEL_79;
                }
                uint64_t v39 = v27 + 9;
                unint64_t v40 = v15 + 9;
                while (1)
                {
                  BOOL v41 = *(v39 - 1) == *(v40 - 1) && *v39 == *v40;
                  if (!v41 && (sub_257DC2DC8() & 1) == 0) {
                    break;
                  }
                  v39 += 2;
                  v40 += 2;
                  if (!--v38) {
                    goto LABEL_79;
                  }
                }
              }
            }
            unsigned __int8 v24 = 2;
            LOBYTE(v28) = 2;
            uint64_t v2 = a2;
            uint64_t v23 = v49;
          }
          else
          {
            unsigned __int8 v24 = 2;
            LOBYTE(v28) = 2;
          }
        }
        else
        {
LABEL_34:
          unsigned __int8 v24 = v17;
        }
        sub_257DC1900((uint64_t)v15, v16, v24);
        sub_257DC1900((uint64_t)v27, v26, v28);
        sub_257DC0968((uint64_t)v27, v26, v28);
        sub_257DC0968((uint64_t)v15, v16, v24);
        goto LABEL_36;
      }
      if (v17 != 1) {
        goto LABEL_34;
      }
      if (v27 == v15 && v26 == v16)
      {
        sub_257DC1900((uint64_t)v15, v16, 1u);
        sub_257DC1900((uint64_t)v15, v16, 1u);
        sub_257DC0968((uint64_t)v15, v16, 1u);
        sub_257DC0968((uint64_t)v15, v16, 1u);
        goto LABEL_80;
      }
      char v30 = sub_257DC2DC8();
      sub_257DC1900((uint64_t)v15, v16, 1u);
      sub_257DC1900((uint64_t)v27, v26, 1u);
      sub_257DC0968((uint64_t)v27, v26, 1u);
      uint64_t v31 = (uint64_t)v15;
      uint64_t v32 = v16;
      unsigned __int8 v33 = 1;
LABEL_76:
      sub_257DC0968(v31, v32, v33);
      if (v30) {
        goto LABEL_80;
      }
LABEL_36:
      unint64_t v22 = (v22 + 1) & v50;
      if (((*(void *)(v23 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
        goto LABEL_85;
      }
    }
    if (v17) {
      goto LABEL_34;
    }
    if (v27 != v15 || v26 != v16)
    {
      char v30 = sub_257DC2DC8();
      sub_257DC1900((uint64_t)v15, v16, 0);
      sub_257DC1900((uint64_t)v27, v26, 0);
      sub_257DC0968((uint64_t)v27, v26, 0);
      uint64_t v31 = (uint64_t)v15;
      uint64_t v32 = v16;
      unsigned __int8 v33 = 0;
      goto LABEL_76;
    }
    sub_257DC1900((uint64_t)v15, v16, 0);
    sub_257DC1900((uint64_t)v15, v16, 0);
    sub_257DC0968((uint64_t)v15, v16, 0);
    sub_257DC0968((uint64_t)v15, v16, 0);
LABEL_80:
    sub_257DC0968((uint64_t)v15, v16, v28);
    uint64_t result = v44;
    unint64_t v7 = v47;
    int64_t v3 = v48;
    if (v47) {
      continue;
    }
    break;
  }
LABEL_8:
  int64_t v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_88;
  }
  if (v11 >= v45) {
    return 1;
  }
  unint64_t v12 = *(void *)(v43 + 8 * v11);
  ++v3;
  if (v12) {
    goto LABEL_23;
  }
  int64_t v3 = v11 + 1;
  if (v11 + 1 >= v45) {
    return 1;
  }
  unint64_t v12 = *(void *)(v43 + 8 * v3);
  if (v12) {
    goto LABEL_23;
  }
  int64_t v3 = v11 + 2;
  if (v11 + 2 >= v45) {
    return 1;
  }
  unint64_t v12 = *(void *)(v43 + 8 * v3);
  if (v12) {
    goto LABEL_23;
  }
  int64_t v3 = v11 + 3;
  if (v11 + 3 >= v45) {
    return 1;
  }
  unint64_t v12 = *(void *)(v43 + 8 * v3);
  if (v12) {
    goto LABEL_23;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v45) {
    return 1;
  }
  unint64_t v12 = *(void *)(v43 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
LABEL_23:
    uint64_t v9 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v45) {
      return 1;
    }
    unint64_t v12 = *(void *)(v43 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_88:
  __break(1u);
  return result;
}

BOOL sub_257DBE29C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_257DBE2B0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_257DBE2C0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_257DBE2CC(uint64_t a1, char a2)
{
  int64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E5A0);
  uint64_t result = sub_257DC2D98();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                int64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v31 = -1 << v29;
              }
              int64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      char v21 = *(unsigned char *)(*(void *)(v5 + 56) + v16);
      sub_257DC2E38();
      sub_257DC2E48();
      uint64_t result = sub_257DC2E68();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v7 + 48) + v14) = v20;
      *(unsigned char *)(*(void *)(v7 + 56) + v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *int64_t v3 = v7;
  return result;
}

unint64_t sub_257DBE594(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_257DC2CF8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_257DC2E38();
        sub_257DC2E48();
        uint64_t result = sub_257DC2E68();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          unint64_t v11 = (unsigned char *)(v10 + v3);
          int64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *unint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          unint64_t v14 = (unsigned char *)(v13 + v3);
          unint64_t v15 = (unsigned char *)(v13 + v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *unint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_257DBE750(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_257DBB4D8(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_257DBE87C();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(unsigned char *)(v16[7] + v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_257DBE2CC(result, a3 & 1);
  uint64_t result = sub_257DBB4D8(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_257DC2DE8();
  __break(1u);
  return result;
}

void *sub_257DBE87C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E5A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_257DC2D88();
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_257DBEA08(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v5;
  sub_257DC2E38();
  uint64_t v46 = a1;
  uint64_t v47 = v10;
  if (a4 > 1u)
  {
    sub_257DC2E48();
    sub_257DC2E48();
    uint64_t v11 = a2[2];
    if (v11)
    {
      swift_bridgeObjectRetain();
      unint64_t v12 = a2 + 5;
      do
      {
        swift_bridgeObjectRetain();
        sub_257DC2C68();
        swift_bridgeObjectRelease();
        v12 += 2;
        --v11;
      }
      while (v11);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    sub_257DC2E48();
    swift_bridgeObjectRetain();
    sub_257DC2C68();
  }
  uint64_t v13 = sub_257DC2E68();
  uint64_t v14 = v47;
  uint64_t v15 = -1 << *(unsigned char *)(v47 + 32);
  unint64_t v16 = v13 & ~v15;
  if (((*(void *)(v47 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
  {
    unsigned __int8 v17 = a4;
LABEL_56:
    swift_bridgeObjectRelease();
    uint64_t v34 = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v50 = *v34;
    *uint64_t v34 = 0x8000000000000000;
    sub_257DC1900((uint64_t)a2, a3, v17);
    sub_257DBF374((uint64_t)a2, a3, v17, v16, isUniquelyReferenced_nonNull_native);
    *uint64_t v34 = v50;
    swift_bridgeObjectRelease();
    *(void *)uint64_t v46 = a2;
    *(void *)(v46 + 8) = a3;
    uint64_t result = 1;
    *(unsigned char *)(v46 + 16) = v17;
    return result;
  }
  uint64_t v48 = ~v15;
  unsigned __int8 v17 = a4;
  while (1)
  {
    uint64_t v19 = *(void *)(v14 + 48) + 24 * v16;
    uint64_t v21 = *(void **)v19;
    uint64_t v20 = *(void *)(v19 + 8);
    int v18 = *(unsigned __int8 *)(v19 + 16);
    if (!*(unsigned char *)(v19 + 16)) {
      break;
    }
    if (v18 != 1)
    {
      if (v17 == 2)
      {
        uint64_t v26 = v21[2];
        if (v26 == a2[2])
        {
          int64_t v45 = v5;
          if (v26) {
            BOOL v27 = v21 == a2;
          }
          else {
            BOOL v27 = 1;
          }
          if (v27)
          {
LABEL_57:
            sub_257DC1900((uint64_t)a2, a3, 2u);
            sub_257DC1900((uint64_t)v21, v20, 2u);
            sub_257DC0968((uint64_t)v21, v20, 2u);
            sub_257DC0968((uint64_t)a2, a3, 2u);
            swift_bridgeObjectRelease();
            uint64_t v5 = v45;
            uint64_t v37 = v46;
            goto LABEL_62;
          }
          BOOL v28 = v21[4] == a2[4] && v21[5] == a2[5];
          if (v28 || (sub_257DC2DC8() & 1) != 0)
          {
            if (v26 == 1) {
              goto LABEL_57;
            }
            BOOL v29 = v21[6] == a2[6] && v21[7] == a2[7];
            if (v29 || (sub_257DC2DC8() & 1) != 0)
            {
              uint64_t v30 = v26 - 2;
              if (!v30) {
                goto LABEL_57;
              }
              uint64_t v31 = v21 + 9;
              uint64_t v32 = a2 + 9;
              while (1)
              {
                BOOL v33 = *(v31 - 1) == *(v32 - 1) && *v31 == *v32;
                if (!v33 && (sub_257DC2DC8() & 1) == 0) {
                  break;
                }
                v31 += 2;
                v32 += 2;
                if (!--v30) {
                  goto LABEL_57;
                }
              }
            }
          }
          unsigned __int8 v17 = 2;
          LOBYTE(v18) = 2;
          uint64_t v5 = v45;
          uint64_t v14 = v47;
        }
        else
        {
          unsigned __int8 v17 = 2;
          LOBYTE(v18) = 2;
        }
      }
LABEL_11:
      sub_257DC1900((uint64_t)a2, a3, v17);
      sub_257DC1900((uint64_t)v21, v20, v18);
      sub_257DC0968((uint64_t)v21, v20, v18);
      sub_257DC0968((uint64_t)a2, a3, v17);
      goto LABEL_12;
    }
    if (v17 != 1) {
      goto LABEL_11;
    }
    if (v21 == a2 && v20 == a3)
    {
      sub_257DC1900((uint64_t)a2, a3, 1u);
      sub_257DC1900((uint64_t)a2, a3, 1u);
      sub_257DC0968((uint64_t)a2, a3, 1u);
      uint64_t v38 = (uint64_t)a2;
      uint64_t v39 = a3;
      unsigned __int8 v40 = 1;
      goto LABEL_60;
    }
    char v23 = sub_257DC2DC8();
    sub_257DC1900((uint64_t)a2, a3, 1u);
    sub_257DC1900((uint64_t)v21, v20, 1u);
    sub_257DC0968((uint64_t)v21, v20, 1u);
    sub_257DC0968((uint64_t)a2, a3, 1u);
    if (v23) {
      goto LABEL_61;
    }
LABEL_12:
    unint64_t v16 = (v16 + 1) & v48;
    unsigned __int8 v17 = a4;
    if (((*(void *)(v47 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
      goto LABEL_56;
    }
  }
  if (v17) {
    goto LABEL_11;
  }
  if (v21 != a2 || v20 != a3)
  {
    char v25 = sub_257DC2DC8();
    sub_257DC1900((uint64_t)a2, a3, 0);
    sub_257DC1900((uint64_t)v21, v20, 0);
    sub_257DC0968((uint64_t)v21, v20, 0);
    sub_257DC0968((uint64_t)a2, a3, 0);
    if (v25) {
      goto LABEL_61;
    }
    goto LABEL_12;
  }
  sub_257DC1900((uint64_t)a2, a3, 0);
  sub_257DC1900((uint64_t)a2, a3, 0);
  sub_257DC0968((uint64_t)a2, a3, 0);
  uint64_t v38 = (uint64_t)a2;
  uint64_t v39 = a3;
  unsigned __int8 v40 = 0;
LABEL_60:
  sub_257DC0968(v38, v39, v40);
LABEL_61:
  swift_bridgeObjectRelease();
  uint64_t v37 = v46;
LABEL_62:
  sub_257DC0968((uint64_t)a2, a3, v18);
  uint64_t v41 = *(void *)(*v5 + 48) + 24 * v16;
  uint64_t v42 = *(void *)v41;
  uint64_t v43 = *(void *)(v41 + 8);
  *(void *)uint64_t v37 = *(void *)v41;
  *(void *)(v37 + 8) = v43;
  unsigned __int8 v44 = *(unsigned char *)(v41 + 16);
  *(unsigned char *)(v37 + 16) = v44;
  sub_257DC1900(v42, v43, v44);
  return 0;
}

char *sub_257DBEF50(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E608);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_257DBF054()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E600);
  uint64_t v3 = sub_257DC2D28();
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
    char v5 = (void *)(v2 + 56);
    uint64_t v6 = -1;
    if (v4 < 64) {
      uint64_t v6 = ~(-1 << v4);
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v4 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v11 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v12 = v11 | (v10 << 6);
      }
      else
      {
        int64_t v13 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v13 >= v8) {
          goto LABEL_22;
        }
        unint64_t v14 = v5[v13];
        ++v10;
        if (!v14)
        {
          int64_t v10 = v13 + 1;
          if (v13 + 1 >= v8) {
            goto LABEL_22;
          }
          unint64_t v14 = v5[v10];
          if (!v14)
          {
            int64_t v10 = v13 + 2;
            if (v13 + 2 >= v8) {
              goto LABEL_22;
            }
            unint64_t v14 = v5[v10];
            if (!v14)
            {
              int64_t v15 = v13 + 3;
              if (v15 >= v8)
              {
LABEL_22:
                swift_release();
                uint64_t v16 = 1 << *(unsigned char *)(v2 + 32);
                if (v16 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v16 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v5 = -1 << v16;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v14 = v5[v15];
              if (!v14)
              {
                while (1)
                {
                  int64_t v10 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_28;
                  }
                  if (v10 >= v8) {
                    goto LABEL_22;
                  }
                  unint64_t v14 = v5[v10];
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
        unint64_t v7 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
      }
      unint64_t result = sub_257DBF22C(*(void *)(*(void *)(v2 + 48) + 24 * v12), *(void *)(*(void *)(v2 + 48) + 24 * v12 + 8), *(unsigned char *)(*(void *)(v2 + 48) + 24 * v12 + 16), v3);
    }
  }
  unint64_t result = swift_release();
  uint64_t *v1 = v3;
  return result;
}

unint64_t sub_257DBF22C(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  sub_257DC2E38();
  if (a3 > 1u)
  {
    sub_257DC2E48();
    sub_257DC2E48();
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      uint64_t v9 = a1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_257DC2C68();
        swift_bridgeObjectRelease();
        v9 += 16;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    sub_257DC2E48();
    sub_257DC2C68();
  }
  sub_257DC2E68();
  unint64_t result = sub_257DC2D08();
  *(void *)(a4 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  uint64_t v11 = *(void *)(a4 + 48) + 24 * result;
  *(void *)uint64_t v11 = a1;
  *(void *)(v11 + 8) = a2;
  *(unsigned char *)(v11 + 16) = a3;
  ++*(void *)(a4 + 16);
  return result;
}

uint64_t sub_257DBF374(uint64_t result, uint64_t a2, unsigned __int8 a3, unint64_t a4, char a5)
{
  unint64_t v7 = v5;
  uint64_t v11 = (void *)result;
  unint64_t v12 = *(void *)(*v5 + 16);
  unint64_t v13 = *(void *)(*v5 + 24);
  if (v13 <= v12 || (a5 & 1) == 0)
  {
    if (a5)
    {
      sub_257DBF054();
    }
    else
    {
      if (v13 > v12)
      {
        unint64_t result = (uint64_t)sub_257DBF7E0();
        goto LABEL_61;
      }
      sub_257DBF9A0();
    }
    uint64_t v41 = *v5;
    sub_257DC2E38();
    if (a3 > 1u)
    {
      sub_257DC2E48();
      sub_257DC2E48();
      uint64_t v14 = v11[2];
      if (v14)
      {
        int64_t v15 = v11 + 5;
        do
        {
          swift_bridgeObjectRetain();
          sub_257DC2C68();
          swift_bridgeObjectRelease();
          v15 += 2;
          --v14;
        }
        while (v14);
      }
    }
    else
    {
      sub_257DC2E48();
      sub_257DC2C68();
    }
    unint64_t result = sub_257DC2E68();
    uint64_t v16 = v41;
    uint64_t v17 = -1 << *(unsigned char *)(v41 + 32);
    a4 = result & ~v17;
    if ((*(void *)(v41 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
    {
      uint64_t v42 = ~v17;
      unsigned __int8 v40 = v5;
      do
      {
        uint64_t v19 = *(void *)(v16 + 48) + 24 * a4;
        uint64_t v21 = *(void **)v19;
        uint64_t v20 = *(void *)(v19 + 8);
        int v6 = *(unsigned __int8 *)(v19 + 16);
        if (*(unsigned char *)(v19 + 16))
        {
          if (v6 != 1)
          {
            if (a3 == 2)
            {
              uint64_t v26 = v21[2];
              if (v26 != v11[2]) {
                goto LABEL_60;
              }
              if (v26) {
                BOOL v27 = v21 == v11;
              }
              else {
                BOOL v27 = 1;
              }
              if (v27) {
                goto LABEL_65;
              }
              BOOL v28 = v21[4] == v11[4] && v21[5] == v11[5];
              if (!v28 && (sub_257DC2DC8() & 1) == 0) {
                goto LABEL_60;
              }
              if (v26 == 1) {
                goto LABEL_65;
              }
              BOOL v29 = v21[6] == v11[6] && v21[7] == v11[7];
              if (v29 || (sub_257DC2DC8() & 1) != 0)
              {
                uint64_t v30 = v26 - 2;
                if (!v30) {
                  goto LABEL_65;
                }
                uint64_t v31 = v21 + 9;
                uint64_t v32 = v11 + 9;
                while (1)
                {
                  BOOL v33 = *(v31 - 1) == *(v32 - 1) && *v31 == *v32;
                  if (!v33 && (sub_257DC2DC8() & 1) == 0) {
                    break;
                  }
                  v31 += 2;
                  v32 += 2;
                  if (!--v30) {
                    goto LABEL_65;
                  }
                }
                LOBYTE(v6) = 2;
                unsigned __int8 v18 = 2;
                unint64_t v7 = v40;
                uint64_t v16 = v41;
              }
              else
              {
LABEL_60:
                LOBYTE(v6) = 2;
                unsigned __int8 v18 = 2;
              }
            }
            else
            {
LABEL_16:
              unsigned __int8 v18 = a3;
            }
            sub_257DC1900((uint64_t)v21, v20, v6);
            sub_257DC1900((uint64_t)v11, a2, v18);
            sub_257DC0968((uint64_t)v21, v20, v6);
            unint64_t result = sub_257DC0968((uint64_t)v11, a2, v18);
            goto LABEL_18;
          }
          if (a3 != 1) {
            goto LABEL_16;
          }
          if (v21 == v11 && v20 == a2) {
            goto LABEL_64;
          }
          LOBYTE(v6) = sub_257DC2DC8();
          sub_257DC1900((uint64_t)v21, v20, 1u);
          sub_257DC1900((uint64_t)v11, a2, 1u);
          sub_257DC0968((uint64_t)v21, v20, 1u);
          uint64_t v23 = (uint64_t)v11;
          uint64_t v24 = a2;
          unsigned __int8 v25 = 1;
        }
        else
        {
          if (a3) {
            goto LABEL_16;
          }
          if (v21 == v11 && v20 == a2) {
            goto LABEL_64;
          }
          LOBYTE(v6) = sub_257DC2DC8();
          sub_257DC1900((uint64_t)v21, v20, 0);
          sub_257DC1900((uint64_t)v11, a2, 0);
          sub_257DC0968((uint64_t)v21, v20, 0);
          uint64_t v23 = (uint64_t)v11;
          uint64_t v24 = a2;
          unsigned __int8 v25 = 0;
        }
        unint64_t result = sub_257DC0968(v23, v24, v25);
        if (v6) {
          goto LABEL_66;
        }
LABEL_18:
        a4 = (a4 + 1) & v42;
      }
      while (((*(void *)(v41 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
    }
  }
LABEL_61:
  uint64_t v35 = *v7;
  *(void *)(*v7 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v36 = *(void *)(v35 + 48) + 24 * a4;
  *(void *)uint64_t v36 = v11;
  *(void *)(v36 + 8) = a2;
  *(unsigned char *)(v36 + 16) = a3;
  uint64_t v37 = *(void *)(v35 + 16);
  BOOL v38 = __OFADD__(v37, 1);
  uint64_t v39 = v37 + 1;
  if (v38)
  {
    __break(1u);
LABEL_64:
    uint64_t v20 = a2;
    uint64_t v21 = v11;
LABEL_65:
    sub_257DC1900((uint64_t)v21, v20, v6);
    sub_257DC1900((uint64_t)v11, a2, v6);
    sub_257DC0968((uint64_t)v21, v20, v6);
    sub_257DC0968((uint64_t)v11, a2, v6);
LABEL_66:
    unint64_t result = sub_257DC2DD8();
    __break(1u);
  }
  else
  {
    *(void *)(v35 + 16) = v39;
  }
  return result;
}

void *sub_257DBF7E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E600);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_257DC2D18();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    unsigned __int8 v21 = *(unsigned char *)(v17 + 16);
    *(void *)uint64_t v20 = *(void *)v17;
    *(void *)(v20 + 8) = v19;
    *(unsigned char *)(v20 + 16) = v21;
    unint64_t result = (void *)sub_257DC1900(v18, v19, v21);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_257DBF9A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E600);
  uint64_t v3 = sub_257DC2D28();
  if (!*(void *)(v2 + 16))
  {
LABEL_23:
    unint64_t result = swift_release();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v20 = v1;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = v2 + 56;
  uint64_t v6 = -1;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v4 + 63) >> 6;
  unint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_6;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v5 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        goto LABEL_22;
      }
      unint64_t v18 = *(void *)(v5 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          goto LABEL_22;
        }
        unint64_t v18 = *(void *)(v5 + 8 * v10);
        if (!v18) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_6:
    uint64_t v13 = *(void *)(v2 + 48) + 24 * v12;
    uint64_t v14 = *(void *)v13;
    uint64_t v15 = *(void *)(v13 + 8);
    unsigned __int8 v16 = *(unsigned char *)(v13 + 16);
    sub_257DC1900(*(void *)v13, v15, v16);
    unint64_t result = sub_257DBF22C(v14, v15, v16, v3);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v8)
  {
LABEL_22:
    swift_release();
    uint64_t v1 = v20;
    goto LABEL_23;
  }
  unint64_t v18 = *(void *)(v5 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v5 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_21;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_257DBFB70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A05E5A0);
    uint64_t v3 = (void *)sub_257DC2DA8();
    for (i = (char *)(a1 + 33); ; i += 2)
    {
      unsigned __int8 v5 = *(i - 1);
      char v6 = *i;
      unint64_t result = sub_257DBB4D8(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_257DBFC48(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_257DBCFA4(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

uint64_t sub_257DBFC74(void *a1)
{
  uint64_t v97 = sub_257DC2BD8();
  uint64_t v4 = *(void *)(v97 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v96 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_257DC2B88();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  uint64_t v94 = v7;
  uint64_t v10 = swift_unknownObjectRetain();
  uint64_t v11 = MEMORY[0x25A2C4640](v10);
  if (v11 != sub_257DC2B58())
  {
    swift_unknownObjectRelease();
    return 0;
  }
  swift_unknownObjectRetain();
  sub_257DC2BA8();
  v107 = (char *)MEMORY[0x263F8EE88];
  uint64_t v13 = sub_257DC2B68();
  uint64_t v14 = v13;
  uint64_t v103 = *(void *)(v13 + 16);
  if (!v103)
  {
    swift_bridgeObjectRelease();
    goto LABEL_95;
  }
  uint64_t v88 = v6;
  xpc_object_t v92 = a1;
  unint64_t v15 = 0;
  uint64_t v91 = 0;
  uint64_t v102 = v13 + 32;
  uint64_t v89 = (void (**)(const char *, uint64_t))(v4 + 8);
  v98 = "ONTEXT_FORCE_REASON";
  unint64_t v101 = 0x8000000257DC4600;
  v93 = "DEVICE_LANGUAGES";
  unint64_t v95 = 0x8000000257DC45D0;
  v87 = "OS_ELIGIBILITY_INPUT_BIRTHDATE";
  unint64_t v90 = 0x8000000257DC4590;
  v99 = v9;
  uint64_t v100 = v13;
LABEL_13:
  if (v15 >= *(void *)(v14 + 16))
  {
    __break(1u);
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  uint64_t v20 = (uint64_t *)(v102 + 16 * v15);
  uint64_t v21 = *v20;
  uint64_t v22 = v20[1];
  if (*v20 == 0xD000000000000026 && v22 == v101 || (sub_257DC2DC8() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_257DC2B98();
    uint64_t v2 = v23;
    swift_bridgeObjectRelease();
    if (!v2) {
      goto LABEL_12;
    }
    unint64_t v24 = v15;
    uint64_t v83 = v107;
    sub_257DC2E38();
    sub_257DC2E48();
    swift_bridgeObjectRetain();
    sub_257DC2C68();
    uint64_t v25 = sub_257DC2E68();
    uint64_t v26 = -1 << v83[32];
    unint64_t v27 = v25 & ~v26;
    if ((*(void *)&v83[((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v27))
    {
      uint64_t v28 = ~v26;
      do
      {
        uint64_t v29 = *((void *)v83 + 6) + 24 * v27;
        uint64_t v30 = *(void *)v29;
        uint64_t v31 = *(void *)(v29 + 8);
        unsigned __int8 v32 = *(unsigned char *)(v29 + 16);
        if (v32)
        {
          swift_bridgeObjectRetain();
          sub_257DC1900(v30, v31, v32);
          sub_257DC0968(v30, v31, v32);
          sub_257DC0968(v1, v2, 0);
        }
        else
        {
          if (v30 == v1 && v31 == v2)
          {
            swift_bridgeObjectRetain();
            sub_257DC1900(v1, v2, 0);
            sub_257DC0968(v1, v2, 0);
            uint64_t v61 = v1;
            uint64_t v62 = v2;
            unsigned __int8 v63 = 0;
            goto LABEL_87;
          }
          char v34 = sub_257DC2DC8();
          swift_bridgeObjectRetain();
          sub_257DC1900(v30, v31, 0);
          sub_257DC0968(v30, v31, 0);
          sub_257DC0968(v1, v2, 0);
          if (v34) {
            goto LABEL_88;
          }
        }
        unint64_t v27 = (v27 + 1) & v28;
      }
      while (((*(void *)&v83[((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v27) & 1) != 0);
    }
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v106 = v83;
    unint64_t v36 = *((void *)v83 + 2);
    unint64_t v37 = *((void *)v83 + 3);
    swift_bridgeObjectRetain();
    if (v37 > v36)
    {
      uint64_t v14 = v100;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_257DBF7E0();
        uint64_t v83 = v106;
      }
    }
    else
    {
      if (isUniquelyReferenced_nonNull_native) {
        sub_257DBF054();
      }
      else {
        sub_257DBF9A0();
      }
      unint64_t v15 = v24;
      uint64_t v83 = v106;
      sub_257DC2E38();
      sub_257DC2E48();
      sub_257DC2C68();
      uint64_t v49 = sub_257DC2E68();
      uint64_t v50 = -1 << v83[32];
      unint64_t v27 = v49 & ~v50;
      if (((*(void *)&v83[((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v27) & 1) == 0)
      {
        uint64_t v14 = v100;
LABEL_10:
        *(void *)&v83[((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] |= 1 << v27;
        uint64_t v16 = *((void *)v83 + 6) + 24 * v27;
        *(void *)uint64_t v16 = v1;
        *(void *)(v16 + 8) = v2;
        *(unsigned char *)(v16 + 16) = 0;
        uint64_t v17 = *((void *)v83 + 2);
        BOOL v18 = __OFADD__(v17, 1);
        uint64_t v19 = v17 + 1;
        if (!v18)
        {
LABEL_11:
          *((void *)v83 + 2) = v19;
          v107 = v83;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v9 = v99;
          goto LABEL_12;
        }
        goto LABEL_98;
      }
      uint64_t v51 = ~v50;
      do
      {
        uint64_t v52 = *((void *)v83 + 6) + 24 * v27;
        uint64_t v53 = *(void *)v52;
        uint64_t v54 = *(void *)(v52 + 8);
        unsigned __int8 v55 = *(unsigned char *)(v52 + 16);
        if (v55)
        {
          swift_bridgeObjectRetain();
          sub_257DC1900(v53, v54, v55);
          sub_257DC0968(v53, v54, v55);
          sub_257DC0968(v1, v2, 0);
        }
        else
        {
          if (v53 == v1 && v54 == v2) {
            goto LABEL_100;
          }
          char v57 = sub_257DC2DC8();
          swift_bridgeObjectRetain();
          sub_257DC1900(v53, v54, 0);
          sub_257DC0968(v53, v54, 0);
          sub_257DC0968(v1, v2, 0);
          if (v57) {
            goto LABEL_103;
          }
        }
        unint64_t v27 = (v27 + 1) & v51;
      }
      while (((*(void *)&v83[((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v27) & 1) != 0);
      uint64_t v14 = v100;
    }
    unint64_t v15 = v24;
    goto LABEL_10;
  }
  if ((v21 != 0xD000000000000023 || v22 != v95) && (sub_257DC2DC8() & 1) == 0)
  {
    if (v21 == 0xD000000000000030 && v22 == v90 || (sub_257DC2DC8() & 1) != 0)
    {
      uint64_t v64 = sub_257DC2C58();
      xpc_object_t v65 = xpc_dictionary_get_array(v92, (const char *)(v64 + 32));
      swift_release();
      if (v65)
      {
        swift_unknownObjectRetain();
        unsigned int v66 = v96;
        sub_257DC2BF8();
        uint64_t v67 = sub_257DC2BB8();
        v106 = sub_257DBEF50(0, v67 & ~(v67 >> 63), 0, MEMORY[0x263F8EE78]);
        MEMORY[0x270FA5388](v106);
        *(&v87 - 2) = v66;
        *(&v87 - 1) = (const char *)&v106;
        uint64_t v68 = v91;
        sub_257DC2BC8();
        uint64_t v91 = v68;
        unint64_t v69 = v15;
        v70 = v106;
        swift_bridgeObjectRetain();
        uint64_t v71 = v70;
        unint64_t v15 = v69;
        sub_257DBEA08((uint64_t)v104, v71, 0, 2u);
        swift_unknownObjectRelease();
        sub_257DC0968(v104[0], v104[1], v105);
        (*v89)(v66, v97);
        swift_bridgeObjectRelease();
      }
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v9, v88);
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_257DC2B98();
  uint64_t v2 = v38;
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v83 = v107;
  sub_257DC2E38();
  sub_257DC2E48();
  swift_bridgeObjectRetain();
  sub_257DC2C68();
  uint64_t v39 = sub_257DC2E68();
  uint64_t v40 = -1 << v83[32];
  unint64_t v41 = v39 & ~v40;
  unint64_t v24 = v15;
  if ((*(void *)&v83[((v41 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v41))
  {
    uint64_t v42 = ~v40;
    do
    {
      uint64_t v43 = *((void *)v83 + 6) + 24 * v41;
      uint64_t v44 = *(void *)v43;
      uint64_t v45 = *(void *)(v43 + 8);
      int v46 = *(unsigned __int8 *)(v43 + 16);
      if (v46 == 1)
      {
        if (v44 == v1 && v45 == v2)
        {
          swift_bridgeObjectRetain();
          sub_257DC1900(v1, v2, 1u);
          sub_257DC0968(v1, v2, 1u);
          uint64_t v61 = v1;
          uint64_t v62 = v2;
          unsigned __int8 v63 = 1;
LABEL_87:
          sub_257DC0968(v61, v62, v63);
LABEL_88:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v9 = v99;
          uint64_t v14 = v100;
          unint64_t v15 = v24;
LABEL_12:
          if (++v15 == v103)
          {
            swift_bridgeObjectRelease();
            uint64_t v6 = v88;
LABEL_95:
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v94 + 8))(v9, v6);
            return (uint64_t)v107;
          }
          goto LABEL_13;
        }
        char v48 = sub_257DC2DC8();
        swift_bridgeObjectRetain();
        sub_257DC1900(v44, v45, 1u);
        sub_257DC0968(v44, v45, 1u);
        sub_257DC0968(v1, v2, 1u);
        if (v48) {
          goto LABEL_88;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_257DC1900(v44, v45, v46);
        sub_257DC0968(v44, v45, v46);
        sub_257DC0968(v1, v2, 1u);
      }
      unint64_t v41 = (v41 + 1) & v42;
    }
    while (((*(void *)&v83[((v41 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v41) & 1) != 0);
  }
  swift_bridgeObjectRelease();
  int v58 = swift_isUniquelyReferenced_nonNull_native();
  v106 = v83;
  unint64_t v59 = *((void *)v83 + 2);
  unint64_t v60 = *((void *)v83 + 3);
  swift_bridgeObjectRetain();
  if (v60 > v59)
  {
    uint64_t v14 = v100;
    if ((v58 & 1) == 0)
    {
      sub_257DBF7E0();
      uint64_t v83 = v106;
    }
    unint64_t v15 = v24;
LABEL_90:
    *(void *)&v83[((v41 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] |= 1 << v41;
    uint64_t v81 = *((void *)v83 + 6) + 24 * v41;
    *(void *)uint64_t v81 = v1;
    *(void *)(v81 + 8) = v2;
    *(unsigned char *)(v81 + 16) = 1;
    uint64_t v82 = *((void *)v83 + 2);
    BOOL v18 = __OFADD__(v82, 1);
    uint64_t v19 = v82 + 1;
    if (!v18) {
      goto LABEL_11;
    }
LABEL_99:
    __break(1u);
LABEL_100:
    swift_bridgeObjectRetain();
    sub_257DC1900(v1, v2, 0);
    sub_257DC0968(v1, v2, 0);
    uint64_t v84 = v1;
    uint64_t v85 = v2;
    unsigned __int8 v86 = 0;
    goto LABEL_102;
  }
  if (v58) {
    sub_257DBF054();
  }
  else {
    sub_257DBF9A0();
  }
  unint64_t v15 = v24;
  uint64_t v83 = v106;
  sub_257DC2E38();
  sub_257DC2E48();
  sub_257DC2C68();
  uint64_t v72 = sub_257DC2E68();
  uint64_t v73 = -1 << v83[32];
  unint64_t v41 = v72 & ~v73;
  if (((*(void *)&v83[((v41 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v41) & 1) == 0)
  {
    uint64_t v14 = v100;
    goto LABEL_90;
  }
  uint64_t v74 = ~v73;
  while (1)
  {
    uint64_t v75 = *((void *)v83 + 6) + 24 * v41;
    uint64_t v76 = *(void *)v75;
    uint64_t v77 = *(void *)(v75 + 8);
    int v78 = *(unsigned __int8 *)(v75 + 16);
    if (v78 == 1) {
      break;
    }
    swift_bridgeObjectRetain();
    sub_257DC1900(v76, v77, v78);
    sub_257DC0968(v76, v77, v78);
    sub_257DC0968(v1, v2, 1u);
LABEL_77:
    unint64_t v41 = (v41 + 1) & v74;
    if (((*(void *)&v83[((v41 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v41) & 1) == 0)
    {
      uint64_t v14 = v100;
      unint64_t v15 = v24;
      goto LABEL_90;
    }
  }
  if (v76 != v1 || v77 != v2)
  {
    char v80 = sub_257DC2DC8();
    swift_bridgeObjectRetain();
    sub_257DC1900(v76, v77, 1u);
    sub_257DC0968(v76, v77, 1u);
    sub_257DC0968(v1, v2, 1u);
    if (v80) {
      goto LABEL_103;
    }
    goto LABEL_77;
  }
  swift_bridgeObjectRetain();
  sub_257DC1900(v1, v2, 1u);
  sub_257DC0968(v1, v2, 1u);
  uint64_t v84 = v1;
  uint64_t v85 = v2;
  unsigned __int8 v86 = 1;
LABEL_102:
  sub_257DC0968(v84, v85, v86);
LABEL_103:
  uint64_t result = sub_257DC2DD8();
  __break(1u);
  return result;
}

uint64_t sub_257DC0968(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_257DC0988(uint64_t a1, uint64_t (*a2)(char *, char *))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v8) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v4 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v4 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v4 + 8 * v10);
        if (!v16)
        {
          int64_t v10 = v15 + 3;
          if (v15 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v4 + 8 * v10);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    char v13 = *(unsigned char *)(*(void *)(a1 + 48) + v12);
    char v14 = *(unsigned char *)(*(void *)(a1 + 56) + v12);
    char v18 = v13;
    char v19 = v14;
    uint64_t result = a2(&v18, &v19);
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v8) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v4 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v4 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_257DC0B10(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v30 = a2;
  uint64_t v31 = result;
  uint64_t v29 = v4;
  int64_t v32 = v8;
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v33 = v10;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v16 >= v8) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v4 + 8 * v16);
    int64_t v18 = v10 + 1;
    if (!v17)
    {
      int64_t v18 = v10 + 2;
      if (v10 + 2 >= v8) {
        return swift_release();
      }
      unint64_t v17 = *(void *)(v4 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v10 + 3;
        if (v10 + 3 >= v8) {
          return swift_release();
        }
        unint64_t v17 = *(void *)(v4 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v10 + 4;
          if (v10 + 4 >= v8) {
            return swift_release();
          }
          unint64_t v17 = *(void *)(v4 + 8 * v18);
          if (!v17)
          {
            uint64_t v19 = v10 + 5;
            if (v10 + 5 >= v8) {
              return swift_release();
            }
            unint64_t v17 = *(void *)(v4 + 8 * v19);
            int64_t v18 = v10 + 5;
            if (!v17) {
              break;
            }
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v17 - 1) & v17;
    int64_t v33 = v18;
    unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
LABEL_24:
    uint64_t v20 = *(void *)(v3 + 48) + 24 * v15;
    uint64_t v21 = *(void *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    LODWORD(v23) = *(unsigned __int8 *)(v20 + 16);
    sub_257DC1900(*(void *)v20, v22, *(unsigned char *)(v20 + 16));
    uint64_t v24 = MEMORY[0x25A2C4640](a2);
    if (v24 == sub_257DC2B58())
    {
      if (!v23)
      {
        unint64_t v11 = (const char *)(sub_257DC2C58() + 32);
        unint64_t v12 = a2;
        char v13 = "OS_ELIGIBILITY_CONTEXT_COUNTRY_BILLING";
LABEL_5:
        xpc_dictionary_set_string(v12, v13, v11);
        swift_release();
        goto LABEL_6;
      }
      if (v23 == 1)
      {
        unint64_t v11 = (const char *)(sub_257DC2C58() + 32);
        unint64_t v12 = a2;
        char v13 = "OS_ELIGIBILITY_CONTEXT_FORCE_REASON";
        goto LABEL_5;
      }
      xpc_object_t v23 = xpc_array_create(0, 0);
      uint64_t v25 = *(void *)(v21 + 16);
      if (v25)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = v21 + 40;
        do
        {
          unint64_t v27 = (const char *)(sub_257DC2C58() + 32);
          swift_bridgeObjectRetain();
          xpc_object_t v28 = xpc_string_create(v27);
          swift_release();
          xpc_array_append_value(v23, v28);
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          v26 += 16;
          --v25;
        }
        while (v25);
        sub_257DC0968(v21, v22, 2u);
        a2 = v30;
        uint64_t v3 = v31;
        uint64_t v4 = v29;
      }
      xpc_dictionary_set_value(a2, "OS_ELIGIBILITY_CONTEXT_ELIGIBLE_DEVICE_LANGUAGES", v23);
      swift_unknownObjectRelease();
      LOBYTE(v23) = 2;
      int64_t v8 = v32;
    }
LABEL_6:
    uint64_t result = sub_257DC0968(v21, v22, v23);
    int64_t v10 = v33;
  }
  while (1)
  {
    int64_t v18 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v18 >= v8) {
      return swift_release();
    }
    unint64_t v17 = *(void *)(v4 + 8 * v18);
    ++v19;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t _s13OSEligibility0A7ContextO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  int v4 = *((unsigned __int8 *)a1 + 16);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  int v7 = *((unsigned __int8 *)a2 + 16);
  if (!*((unsigned char *)a1 + 16))
  {
    if (!*((unsigned char *)a2 + 16))
    {
      if (v2 != v5 || v3 != v6)
      {
        char v9 = sub_257DC2DC8();
        LOBYTE(v7) = 0;
        LOBYTE(v4) = 0;
        goto LABEL_21;
      }
      LOBYTE(v7) = 0;
      LOBYTE(v4) = 0;
LABEL_20:
      char v9 = 1;
      goto LABEL_21;
    }
LABEL_17:
    char v9 = 0;
    goto LABEL_21;
  }
  if (v4 != 1)
  {
    if (v7 == 2)
    {
      char v9 = sub_257DBD344((void *)*a1, (void *)*a2);
      LOBYTE(v4) = 2;
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  if (v7 != 1) {
    goto LABEL_17;
  }
  if (v2 == v5 && v3 == v6)
  {
    LOBYTE(v7) = 1;
    LOBYTE(v4) = 1;
    goto LABEL_20;
  }
  char v9 = sub_257DC2DC8();
  LOBYTE(v7) = 1;
  LOBYTE(v4) = 1;
LABEL_21:
  sub_257DC1900(v5, v6, v7);
  sub_257DC1900(v2, v3, v4);
  sub_257DC0968(v2, v3, v4);
  sub_257DC0968(v5, v6, v7);
  return v9 & 1;
}

unint64_t sub_257DC0F30()
{
  unint64_t result = qword_26A05E5C8;
  if (!qword_26A05E5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5C8);
  }
  return result;
}

uint64_t sub_257DC0F84(uint64_t a1, char *a2)
{
  uint64_t v3 = *(void **)(v2 + 16);
  uint64_t v4 = *a2;
  OSEligibilityInput.bridgedInputKey.getter();
  uint64_t v5 = qword_257DC3840[v4];
  uint64_t v6 = sub_257DC2C58();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_uint64(v3, (const char *)(v6 + 32), v5);

  return swift_release();
}

uint64_t _s13OSEligibility0A6ResultV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  int v3 = *(unsigned __int8 *)(a1 + 2);
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a2 + 1);
  int v6 = *(unsigned __int8 *)(a2 + 2);
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  sub_257DC1DF4();
  sub_257DC2C98();
  sub_257DC2C98();
  char v9 = 0;
  if (v13 == v12 && v2 == v5)
  {
    if (v3 == 2)
    {
      if (v6 != 2) {
        goto LABEL_10;
      }
    }
    else
    {
      char v9 = 0;
      if (v6 == 2 || ((v6 ^ v3) & 1) != 0) {
        return v9 & 1;
      }
    }
    if ((sub_257DBDB3C(v4, v8) & 1) == 0)
    {
LABEL_10:
      char v9 = 0;
      return v9 & 1;
    }
    char v9 = sub_257DBDCBC(v11, v7);
  }
  return v9 & 1;
}

unint64_t sub_257DC1120()
{
  unint64_t result = qword_26A05E5D0;
  if (!qword_26A05E5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5D0);
  }
  return result;
}

unint64_t sub_257DC1178()
{
  unint64_t result = qword_26A05E5D8;
  if (!qword_26A05E5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5D8);
  }
  return result;
}

unint64_t sub_257DC11D4()
{
  unint64_t result = qword_26A05E5E0;
  if (!qword_26A05E5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5E0);
  }
  return result;
}

unint64_t sub_257DC122C()
{
  unint64_t result = qword_26A05E5E8;
  if (!qword_26A05E5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5E8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OSEligibilityAnswer(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OSEligibilityAnswer(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x257DC13ECLL);
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

ValueMetadata *type metadata accessor for OSEligibilityAnswer()
{
  return &type metadata for OSEligibilityAnswer;
}

uint64_t getEnumTagSinglePayload for OSEligibilityAnswerSource(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OSEligibilityAnswerSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x257DC1580);
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

uint64_t sub_257DC15A8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_257DC15B0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityAnswerSource()
{
  return &type metadata for OSEligibilityAnswerSource;
}

uint64_t getEnumTagSinglePayload for OSEligibilityInput(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSEligibilityInput(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x257DC1728);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityInput()
{
  return &type metadata for OSEligibilityInput;
}

uint64_t getEnumTagSinglePayload for OSEligibilityInputStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSEligibilityInputStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x257DC18BCLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

unsigned char *sub_257DC18E4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityInputStatus()
{
  return &type metadata for OSEligibilityInputStatus;
}

uint64_t sub_257DC1900(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for OSEligibilityContext(uint64_t a1)
{
  return sub_257DC0968(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s13OSEligibility20OSEligibilityContextOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_257DC1900(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for OSEligibilityContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_257DC1900(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_257DC0968(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OSEligibilityContext(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_257DC0968(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSEligibilityContext(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OSEligibilityContext(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_257DC1ABC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_257DC1AC4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityContext()
{
  return &type metadata for OSEligibilityContext;
}

uint64_t destroy for OSEligibilityResult()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s13OSEligibility19OSEligibilityResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OSEligibilityResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OSEligibilityResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OSEligibilityResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OSEligibilityResult(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityResult()
{
  return &type metadata for OSEligibilityResult;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for OSEligibilityError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSEligibilityError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_257DC1D78(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_257DC1D80(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityError()
{
  return &type metadata for OSEligibilityError;
}

void type metadata accessor for os_eligibility_answer_t()
{
  if (!qword_26A05E5F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A05E5F0);
    }
  }
}

unint64_t sub_257DC1DF4()
{
  unint64_t result = qword_26A05E5F8;
  if (!qword_26A05E5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E5F8);
  }
  return result;
}

uint64_t sub_257DC1E48()
{
  uint64_t v1 = *(uint64_t **)(v0 + 24);
  uint64_t result = sub_257DC2BE8();
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t v6 = *v1;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t *v1 = v6;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_257DBEF50(0, *(void *)(v6 + 16) + 1, 1, (char *)v6);
      uint64_t v6 = result;
      uint64_t *v1 = result;
    }
    unint64_t v8 = *(void *)(v6 + 16);
    unint64_t v7 = *(void *)(v6 + 24);
    if (v8 >= v7 >> 1)
    {
      uint64_t result = (uint64_t)sub_257DBEF50((char *)(v7 > 1), v8 + 1, 1, (char *)v6);
      uint64_t v6 = result;
      uint64_t *v1 = result;
    }
    *(void *)(v6 + 16) = v8 + 1;
    unint64_t v9 = v6 + 16 * v8;
    *(void *)(v9 + 32) = v4;
    *(void *)(v9 + 40) = v5;
  }
  return result;
}

uint64_t sub_257DC1F20(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_257DBFC48(a1, a2, a3);
}

OSEligibility::OSEligibilityDomain_optional sub_257DC1F4C@<W0>(Swift::UInt64 a1@<X0>, unsigned char *a2@<X8>)
{
  result.value = OSEligibilityDomain.init(rawValue:)(a1).value;
  char v4 = v5;
  if (v5 == 126) {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

OSEligibility::OSEligibilityDomain_optional __swiftcall OSEligibilityDomain.init(rawValue:)(Swift::UInt64 rawValue)
{
  char v2 = 0;
  char v3 = 108;
  switch(rawValue)
  {
    case 0uLL:
      goto LABEL_127;
    case 1uLL:
      char v2 = 2;
      goto LABEL_127;
    case 2uLL:
      char v2 = 8;
      goto LABEL_127;
    case 3uLL:
      char v2 = 9;
      goto LABEL_127;
    case 4uLL:
      char v2 = 10;
      goto LABEL_127;
    case 5uLL:
      char v2 = 11;
      goto LABEL_127;
    case 6uLL:
      char v2 = 12;
      goto LABEL_127;
    case 7uLL:
      char v2 = 13;
      goto LABEL_127;
    case 8uLL:
      char v2 = 14;
      goto LABEL_127;
    case 9uLL:
      char v2 = 15;
      goto LABEL_127;
    case 0xAuLL:
      char v2 = 16;
      goto LABEL_127;
    case 0xBuLL:
      char v2 = 17;
      goto LABEL_127;
    case 0xCuLL:
      char v2 = 18;
      goto LABEL_127;
    case 0xDuLL:
      char v2 = 19;
      goto LABEL_127;
    case 0xEuLL:
      char v2 = 20;
      goto LABEL_127;
    case 0xFuLL:
      char v2 = 21;
      goto LABEL_127;
    case 0x10uLL:
      char v2 = 22;
      goto LABEL_127;
    case 0x11uLL:
      char v2 = 23;
      goto LABEL_127;
    case 0x12uLL:
      char v2 = 24;
      goto LABEL_127;
    case 0x13uLL:
      char v2 = 25;
      goto LABEL_127;
    case 0x14uLL:
      char v2 = 26;
      goto LABEL_127;
    case 0x15uLL:
      char v2 = 27;
      goto LABEL_127;
    case 0x16uLL:
      char v2 = 28;
      goto LABEL_127;
    case 0x17uLL:
      char v2 = 29;
      goto LABEL_127;
    case 0x18uLL:
      char v2 = 30;
      goto LABEL_127;
    case 0x19uLL:
      char v2 = 31;
      goto LABEL_127;
    case 0x1AuLL:
      char v2 = 32;
      goto LABEL_127;
    case 0x1BuLL:
      char v2 = 33;
      goto LABEL_127;
    case 0x1CuLL:
      char v2 = 34;
      goto LABEL_127;
    case 0x1DuLL:
      char v2 = 35;
      goto LABEL_127;
    case 0x1EuLL:
      char v2 = 36;
      goto LABEL_127;
    case 0x1FuLL:
      char v2 = 37;
      goto LABEL_127;
    case 0x20uLL:
      char v2 = 38;
      goto LABEL_127;
    case 0x21uLL:
      char v2 = 39;
      goto LABEL_127;
    case 0x22uLL:
      char v2 = 40;
      goto LABEL_127;
    case 0x23uLL:
      char v2 = 41;
      goto LABEL_127;
    case 0x24uLL:
      char v2 = 42;
      goto LABEL_127;
    case 0x25uLL:
      char v2 = 43;
      goto LABEL_127;
    case 0x26uLL:
      char v2 = 44;
      goto LABEL_127;
    case 0x27uLL:
      char v2 = 45;
      goto LABEL_127;
    case 0x28uLL:
      char v2 = 46;
      goto LABEL_127;
    case 0x29uLL:
      char v2 = 47;
      goto LABEL_127;
    case 0x2AuLL:
      char v2 = 48;
      goto LABEL_127;
    case 0x2BuLL:
      char v2 = 49;
      goto LABEL_127;
    case 0x2CuLL:
      char v2 = 50;
      goto LABEL_127;
    case 0x2DuLL:
      char v2 = 51;
      goto LABEL_127;
    case 0x2EuLL:
      char v2 = 52;
      goto LABEL_127;
    case 0x2FuLL:
      char v2 = 53;
      goto LABEL_127;
    case 0x30uLL:
      char v2 = 54;
      goto LABEL_127;
    case 0x31uLL:
      char v2 = 55;
      goto LABEL_127;
    case 0x32uLL:
      char v2 = 56;
      goto LABEL_127;
    case 0x33uLL:
      char v2 = 57;
      goto LABEL_127;
    case 0x34uLL:
      char v2 = 58;
      goto LABEL_127;
    case 0x35uLL:
      char v2 = 59;
      goto LABEL_127;
    case 0x36uLL:
      char v2 = 60;
      goto LABEL_127;
    case 0x37uLL:
      char v2 = 61;
      goto LABEL_127;
    case 0x38uLL:
      char v2 = 62;
      goto LABEL_127;
    case 0x39uLL:
      char v2 = 63;
      goto LABEL_127;
    case 0x3AuLL:
      char v2 = 64;
      goto LABEL_127;
    case 0x3BuLL:
      char v2 = 65;
      goto LABEL_127;
    case 0x3CuLL:
      char v2 = 66;
      goto LABEL_127;
    case 0x3DuLL:
      char v2 = 67;
      goto LABEL_127;
    case 0x3EuLL:
      char v2 = 68;
      goto LABEL_127;
    case 0x3FuLL:
      char v2 = 69;
      goto LABEL_127;
    case 0x40uLL:
      char v2 = 70;
      goto LABEL_127;
    case 0x41uLL:
      char v2 = 71;
      goto LABEL_127;
    case 0x42uLL:
      char v2 = 72;
      goto LABEL_127;
    case 0x43uLL:
      char v2 = 73;
      goto LABEL_127;
    case 0x44uLL:
      char v2 = 74;
      goto LABEL_127;
    case 0x45uLL:
      char v2 = 75;
      goto LABEL_127;
    case 0x46uLL:
      char v2 = 76;
      goto LABEL_127;
    case 0x47uLL:
      char v2 = 77;
      goto LABEL_127;
    case 0x48uLL:
      char v2 = 78;
      goto LABEL_127;
    case 0x49uLL:
      char v2 = 79;
      goto LABEL_127;
    case 0x4AuLL:
      char v2 = 80;
      goto LABEL_127;
    case 0x4BuLL:
      char v2 = 81;
      goto LABEL_127;
    case 0x4CuLL:
      char v2 = 82;
      goto LABEL_127;
    case 0x4DuLL:
      char v2 = 83;
      goto LABEL_127;
    case 0x4EuLL:
      char v2 = 84;
      goto LABEL_127;
    case 0x4FuLL:
      char v2 = 85;
      goto LABEL_127;
    case 0x50uLL:
      char v2 = 86;
      goto LABEL_127;
    case 0x51uLL:
      char v2 = 87;
      goto LABEL_127;
    case 0x52uLL:
      char v2 = 88;
      goto LABEL_127;
    case 0x53uLL:
      char v2 = 89;
      goto LABEL_127;
    case 0x54uLL:
      char v2 = 90;
      goto LABEL_127;
    case 0x55uLL:
      char v2 = 91;
      goto LABEL_127;
    case 0x56uLL:
      char v2 = 92;
      goto LABEL_127;
    case 0x57uLL:
      char v2 = 93;
      goto LABEL_127;
    case 0x58uLL:
      char v2 = 94;
      goto LABEL_127;
    case 0x59uLL:
      char v2 = 95;
      goto LABEL_127;
    case 0x5AuLL:
      char v2 = 96;
      goto LABEL_127;
    case 0x5BuLL:
      char v2 = 97;
      goto LABEL_127;
    case 0x5CuLL:
      char v2 = 98;
      goto LABEL_127;
    case 0x5DuLL:
      char v2 = 99;
      goto LABEL_127;
    case 0x5EuLL:
      char v2 = 100;
      goto LABEL_127;
    case 0x5FuLL:
      char v2 = 101;
      goto LABEL_127;
    case 0x60uLL:
      char v2 = 102;
      goto LABEL_127;
    case 0x61uLL:
      char v2 = 103;
      goto LABEL_127;
    case 0x62uLL:
      char v2 = 104;
      goto LABEL_127;
    case 0x63uLL:
      char v2 = 105;
      goto LABEL_127;
    case 0x64uLL:
      char v2 = 106;
      goto LABEL_127;
    case 0x65uLL:
      char v2 = 107;
      goto LABEL_127;
    case 0x66uLL:
      goto LABEL_128;
    case 0x67uLL:
      char *v1 = 109;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x68uLL:
      char *v1 = 110;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x69uLL:
      char *v1 = 111;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x6AuLL:
      char *v1 = 112;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x6BuLL:
      char *v1 = 113;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x6CuLL:
      char *v1 = 114;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x6DuLL:
      char *v1 = 115;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x6EuLL:
      char *v1 = 116;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x6FuLL:
      char *v1 = 117;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x70uLL:
      char *v1 = 118;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x71uLL:
      char *v1 = 119;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x72uLL:
      char *v1 = 120;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x73uLL:
      char *v1 = 121;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x74uLL:
      char *v1 = 122;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x75uLL:
      char *v1 = 123;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x76uLL:
      char *v1 = 124;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x77uLL:
      char *v1 = 125;
      return (OSEligibility::OSEligibilityDomain_optional)rawValue;
    case 0x78uLL:
      char v2 = 1;
      goto LABEL_127;
    case 0x79uLL:
      char v2 = 3;
      goto LABEL_127;
    case 0x7AuLL:
      char v2 = 4;
      goto LABEL_127;
    case 0x7BuLL:
      char v2 = 5;
      goto LABEL_127;
    case 0x7CuLL:
      char v2 = 6;
      goto LABEL_127;
    case 0x7DuLL:
      char v2 = 7;
LABEL_127:
      char v3 = v2;
LABEL_128:
      char *v1 = v3;
      break;
    default:
      char *v1 = 126;
      break;
  }
  return (OSEligibility::OSEligibilityDomain_optional)rawValue;
}

uint64_t OSEligibilityDomain.bridgedDomainType.getter()
{
  return qword_257DC3B30[*v0];
}

uint64_t OSEligibilityDomain.rawValue.getter()
{
  return qword_257DC3B30[*v0];
}

uint64_t OSEligibilityDomain.darwinNotificationName.getter()
{
  uint64_t result = os_eligibility_get_domain_notification_name();
  if (result) {
    return sub_257DC2C78();
  }
  return result;
}

BOOL sub_257DC2654(char *a1, char *a2)
{
  return qword_257DC3B30[*a1] == qword_257DC3B30[*a2];
}

unint64_t sub_257DC267C()
{
  unint64_t result = qword_26A05E610;
  if (!qword_26A05E610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A05E610);
  }
  return result;
}

uint64_t sub_257DC26D0()
{
  return sub_257DC2E68();
}

uint64_t sub_257DC2720()
{
  return sub_257DC2E58();
}

uint64_t sub_257DC2758()
{
  return sub_257DC2E68();
}

OSEligibility::OSEligibilityDomain_optional sub_257DC27A4(Swift::UInt64 *a1)
{
  return OSEligibilityDomain.init(rawValue:)(*a1);
}

void sub_257DC27AC(void *a1@<X8>)
{
  *a1 = qword_257DC3B30[*v1];
}

uint64_t getEnumTagSinglePayload for OSEligibilityDomain(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x83) {
    goto LABEL_17;
  }
  if (a2 + 125 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 125) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 125;
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
      return (*a1 | (v4 << 8)) - 125;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 125;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x7E;
  int v8 = v6 - 126;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for OSEligibilityDomain(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 125 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 125) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x83) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x82)
  {
    unsigned int v6 = ((a2 - 131) >> 8) + 1;
    *unint64_t result = a2 + 125;
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
        JUMPOUT(0x257DC2920);
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
          *unint64_t result = a2 + 125;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OSEligibilityDomain()
{
  return &type metadata for OSEligibilityDomain;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_257DC2990(uint64_t a1)
{
  return sub_257DC29B4(a1, qword_26A05EEB8);
}

uint64_t sub_257DC29B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_257DC2B48();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_257DC2B38();
}

uint64_t sub_257DC2A2C()
{
  return sub_257DC2A50(&qword_26A05EEB0, (uint64_t)qword_26A05EEB8);
}

uint64_t sub_257DC2A50(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_257DC2B48();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_257DC2B08()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_257DC2B18()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_257DC2B28()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_257DC2B38()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_257DC2B48()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_257DC2B58()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_257DC2B68()
{
  return MEMORY[0x270FA1C98]();
}

uint64_t sub_257DC2B78()
{
  return MEMORY[0x270FA1CA0]();
}

uint64_t sub_257DC2B88()
{
  return MEMORY[0x270FA1CB0]();
}

uint64_t sub_257DC2B98()
{
  return MEMORY[0x270FA1CC0]();
}

uint64_t sub_257DC2BA8()
{
  return MEMORY[0x270FA1CE0]();
}

uint64_t sub_257DC2BB8()
{
  return MEMORY[0x270FA1DA0]();
}

uint64_t sub_257DC2BC8()
{
  return MEMORY[0x270FA1DA8]();
}

uint64_t sub_257DC2BD8()
{
  return MEMORY[0x270FA1DB0]();
}

uint64_t sub_257DC2BE8()
{
  return MEMORY[0x270FA1DB8]();
}

uint64_t sub_257DC2BF8()
{
  return MEMORY[0x270FA1DC0]();
}

uint64_t sub_257DC2C08()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_257DC2C18()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_257DC2C28()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_257DC2C38()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_257DC2C48()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_257DC2C58()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_257DC2C68()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_257DC2C78()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_257DC2C88()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_257DC2C98()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_257DC2CA8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_257DC2CB8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_257DC2CC8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_257DC2CD8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_257DC2CE8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_257DC2CF8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_257DC2D08()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_257DC2D18()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_257DC2D28()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_257DC2D38()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_257DC2D48()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_257DC2D58()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_257DC2D68()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_257DC2D78()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_257DC2D88()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_257DC2D98()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_257DC2DA8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_257DC2DB8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_257DC2DC8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_257DC2DD8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_257DC2DE8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_257DC2DF8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_257DC2E08()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_257DC2E18()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_257DC2E28()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_257DC2E38()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_257DC2E48()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_257DC2E58()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_257DC2E68()
{
  return MEMORY[0x270F9FC90]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
}

uint64_t os_eligibility_get_domain_notification_name()
{
  return MEMORY[0x270EDA928]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}