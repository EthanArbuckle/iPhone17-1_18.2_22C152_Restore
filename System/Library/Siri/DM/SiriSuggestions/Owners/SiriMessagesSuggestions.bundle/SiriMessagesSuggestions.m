void sub_3D84()
{
  qword_10740 = 1701667182;
  *(void *)algn_10748 = 0xE400000000000000;
}

uint64_t sub_3DA0()
{
  return sub_6138((uint64_t)sub_3DB4);
}

uint64_t sub_3DB4()
{
  sub_A300();
  swift_allocObject();
  sub_A2F0();
  uint64_t v1 = sub_A2C0();
  swift_release();
  if (v1)
  {
    if (!sub_3FCC(v1)) {
      goto LABEL_16;
    }
    uint64_t v2 = sub_A320();
    swift_release();
    if (qword_102D8 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_10740;
    uint64_t v4 = *(void *)algn_10748;
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_4744(v3, v4, v2);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_16;
    }
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_A6B0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v11)
      {
LABEL_8:
        if ((v5 & 0xC000000000000001) != 0)
        {
          sub_A680();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
            return result;
          }
          swift_retain();
        }
        swift_bridgeObjectRelease();
        uint64_t v7 = sub_A310();
        uint64_t v9 = v8;
        swift_release();
        if (v9)
        {
          sub_5EB4(&qword_10578);
          v10 = (_OWORD *)sub_6178();
          v10[1] = xmmword_AAA0;
          *((void *)v10 + 7) = &type metadata for String;
          *((void *)v10 + 4) = v7;
          *((void *)v10 + 5) = v9;
LABEL_17:
          swift_release();
          goto LABEL_18;
        }
LABEL_16:
        v10 = &_swiftEmptyArrayStorage;
        goto LABEL_17;
      }
    }
    else if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)))
    {
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v10 = &_swiftEmptyArrayStorage;
LABEL_18:
  v12 = *(uint64_t (**)(_OWORD *))(v0 + 8);
  return v12(v10);
}

uint64_t sub_3FCC(uint64_t a1)
{
  sub_A580();
  sub_611C();
  uint64_t v63 = v3;
  uint64_t v64 = v2;
  ((void (*)(void))__chkstk_darwin)();
  sub_6190();
  uint64_t v62 = v5 - v4;
  uint64_t v61 = sub_A550();
  sub_611C();
  uint64_t v59 = v6;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = &v55[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v60 = &v55[-v10];
  uint64_t v11 = sub_5EB4(&qword_10580);
  __chkstk_darwin(v11 - 8);
  sub_6190();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_A560();
  sub_611C();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_6190();
  v21 = (uint64_t *)(v20 - v19);
  uint64_t v22 = sub_5EB4(&qword_10588);
  uint64_t v23 = __chkstk_darwin(v22);
  v25 = &v55[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v23);
  v27 = &v55[-v26];
  if (qword_102E0 != -1) {
    swift_once();
  }
  uint64_t *v21 = a1;
  (*(void (**)(uint64_t *, void, uint64_t))(v17 + 104))(v21, enum case for RRQuery.usoReference(_:), v15);
  uint64_t v28 = sub_A590();
  sub_5EF8(v14, 1, 1, v28);
  swift_retain();
  sub_A4E0();
  sub_5F58(v14, &qword_10580);
  (*(void (**)(uint64_t *, uint64_t))(v17 + 8))(v21, v15);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_5FB4((uint64_t)v27, (uint64_t)v25);
    uint64_t v29 = sub_A5A0();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t))(v30 + 88))(v25, v29) == enum case for RRResult.foundMatch(_:))
    {
      (*(void (**)(unsigned char *, uint64_t))(v30 + 96))(v25, v29);
      uint64_t v31 = v59;
      v32 = v60;
      uint64_t v33 = v61;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v59 + 32))(v60, v25, v61);
      if (qword_10308 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_A530();
      sub_5F20(v34, (uint64_t)static Logger.suggestions);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v31 + 16))(v9, v32, v33);
      swift_retain_n();
      v35 = sub_A510();
      os_log_type_t v36 = sub_A620();
      v37 = (void (*)(uint64_t))v36;
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v38 = swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        uint64_t v65 = a1;
        uint64_t v66 = v58;
        *(_DWORD *)uint64_t v38 = 136315394;
        os_log_t v57 = v35;
        sub_A330();
        int v56 = (int)v37;
        swift_retain();
        uint64_t v39 = sub_A5D0();
        uint64_t v65 = sub_52F0(v39, v40, &v66);
        sub_A640();
        sub_61A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2080;
        v37 = (void (*)(uint64_t))(v38 + 14);
        sub_601C(&qword_10590, 255, (void (*)(uint64_t))&type metadata accessor for RRCandidate);
        uint64_t v41 = sub_A6E0();
        uint64_t v65 = sub_52F0(v41, v42, &v66);
        sub_A640();
        swift_bridgeObjectRelease();
        uint64_t v43 = sub_615C();
        ((void (*)(uint64_t))(v38 + 14))(v43);
        v35 = v57;
        _os_log_impl(&dword_0, v57, (os_log_type_t)v56, "#ReferenceResolution: found SRR match for %s, match=%s", (uint8_t *)v38, 0x16u);
        swift_arrayDestroy();
        sub_6144();
        sub_6144();
      }
      else
      {
        sub_61A0();
        uint64_t v52 = sub_615C();
        v37(v52);
      }

      uint64_t v53 = v62;
      sub_A540();
      uint64_t v51 = sub_A570();
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v53, v64);
      ((void (*)(unsigned char *, uint64_t))v37)(v32, v33);
      goto LABEL_18;
    }
    (*(void (**)(unsigned char *, uint64_t))(v30 + 8))(v25, v29);
  }
  if (qword_10308 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_A530();
  sub_5F20(v44, (uint64_t)static Logger.suggestions);
  swift_retain_n();
  v45 = sub_A510();
  os_log_type_t v46 = sub_A620();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v65 = a1;
    uint64_t v66 = v48;
    *(_DWORD *)v47 = 136315138;
    sub_A330();
    swift_retain();
    uint64_t v49 = sub_A5D0();
    uint64_t v65 = sub_52F0(v49, v50, &v66);
    sub_A640();
    sub_61A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v45, v46, "#ReferenceResolution: found no SRR match for %s", v47, 0xCu);
    swift_arrayDestroy();
    sub_6144();
    sub_6144();
  }
  else
  {

    sub_61A0();
  }
  uint64_t v51 = 0;
LABEL_18:
  sub_5F58((uint64_t)v27, &qword_10588);
  return v51;
}

uint64_t sub_4744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_5AA8(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_4788(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_5B20(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for ResolveGroupEntity()
{
  return self;
}

uint64_t sub_47F4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_6118;
  return _swift_task_switch(sub_3DB4, 0, 0);
}

uint64_t sub_489C()
{
  return sub_6138((uint64_t)sub_48B0);
}

uint64_t sub_48B0()
{
  sub_A2E0();
  swift_allocObject();
  sub_A2D0();
  uint64_t v1 = sub_A2C0();
  swift_release();
  if (v1)
  {
    if (sub_3FCC(v1))
    {
      swift_release();
      sub_5EB4(&qword_10578);
      uint64_t v2 = sub_6178();
      *(_OWORD *)(v2 + 16) = xmmword_AAA0;
      *(void *)(v2 + 56) = &type metadata for Bool;
      *(unsigned char *)(v2 + 32) = 1;
    }
    else
    {
      sub_5EB4(&qword_10578);
      uint64_t v2 = sub_6178();
      *(_OWORD *)(v2 + 16) = xmmword_AAA0;
      *(void *)(v2 + 56) = &type metadata for Bool;
      *(unsigned char *)(v2 + 32) = 0;
    }
    swift_release();
  }
  else
  {
    if (qword_10308 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_A530();
    sub_5F20(v3, (uint64_t)static Logger.suggestions);
    uint64_t v4 = sub_A510();
    os_log_type_t v5 = sub_A620();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v4, v5, "#ResolveGenericReferenceEntity: Unable to create agent entity", v6, 2u);
      sub_6144();
    }

    sub_5EB4(&qword_10578);
    uint64_t v2 = sub_6178();
    *(_OWORD *)(v2 + 16) = xmmword_AAA0;
    *(void *)(v2 + 56) = &type metadata for Bool;
    *(unsigned char *)(v2 + 32) = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v7(v2);
}

uint64_t type metadata accessor for ResolveGenericReferenceEntity()
{
  return self;
}

uint64_t sub_4ACC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_6118;
  return _swift_task_switch(sub_48B0, 0, 0);
}

uint64_t sub_4B70()
{
  *(void *)(v1 + 24) = v0;
  return sub_6138((uint64_t)sub_4B88);
}

uint64_t sub_4B88()
{
  uint64_t v13 = v0;
  if (qword_10308 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_A530();
  sub_5F20(v1, (uint64_t)static Logger.suggestions);
  swift_retain();
  uint64_t v2 = sub_A510();
  os_log_type_t v3 = sub_A620();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[3];
  if (v4)
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = *(void *)(v5 + 16);
    unint64_t v7 = *(void *)(v5 + 24);
    swift_bridgeObjectRetain();
    v0[2] = sub_52F0(v8, v7, &v12);
    sub_A640();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v6 + 12) = 1024;
    *((_DWORD *)v0 + 4) = 1;
    sub_A640();
    _os_log_impl(&dword_0, v2, v3, "resolved parameter %s to %{BOOL}d", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    sub_6144();
    sub_6144();
  }
  else
  {
    swift_release();
  }

  sub_5EB4(&qword_10578);
  uint64_t v9 = sub_6178();
  *(_OWORD *)(v9 + 16) = xmmword_AAA0;
  *(void *)(v9 + 56) = &type metadata for Bool;
  *(unsigned char *)(v9 + 32) = 1;
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_4DB4()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for IsConciseResolver()
{
  return self;
}

uint64_t sub_4E10()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_4E44()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_4ED4;
  return sub_4B70();
}

uint64_t sub_4ED4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_4FD0(uint64_t a1, uint64_t a2)
{
  return sub_601C((unint64_t *)&unk_10528, a2, (void (*)(uint64_t))type metadata accessor for IsConciseResolver);
}

uint64_t sub_5018(uint64_t a1, uint64_t a2)
{
  return sub_601C(&qword_10538, a2, (void (*)(uint64_t))type metadata accessor for IsConciseResolver);
}

uint64_t sub_5060(uint64_t a1, uint64_t a2)
{
  return sub_601C((unint64_t *)&unk_10540, a2, (void (*)(uint64_t))type metadata accessor for ResolveGenericReferenceEntity);
}

uint64_t sub_50A8(uint64_t a1, uint64_t a2)
{
  return sub_601C(&qword_10550, a2, (void (*)(uint64_t))type metadata accessor for ResolveGenericReferenceEntity);
}

uint64_t sub_50F0(uint64_t a1, uint64_t a2)
{
  return sub_601C((unint64_t *)&unk_10558, a2, (void (*)(uint64_t))type metadata accessor for ResolveGroupEntity);
}

uint64_t sub_5138(uint64_t a1, uint64_t a2)
{
  return sub_601C(&qword_10568, a2, (void (*)(uint64_t))type metadata accessor for ResolveGroupEntity);
}

uint64_t sub_5180()
{
  sub_A500();
  uint64_t result = sub_A4F0();
  qword_10750 = result;
  return result;
}

uint64_t sub_51B4(char a1, char a2)
{
  unint64_t v3 = sub_621C(a1);
  uint64_t v5 = v4;
  if (v3 == sub_621C(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_A6F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_523C(uint64_t a1, char a2)
{
  sub_621C(a2);
  sub_A5E0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_5290(uint64_t a1, char a2)
{
  return sub_A710();
}

uint64_t sub_52F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_53C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_60B4((uint64_t)v12, *a3);
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
      sub_60B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6064((uint64_t)v12);
  return v7;
}

uint64_t sub_53C4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_551C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_A650();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_55F4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_A690();
    if (!v8)
    {
      uint64_t result = sub_A6A0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_551C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A6C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_55F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_568C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_5868(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5868((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_568C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_A600();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_5800(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_A670();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_A6C0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_A6A0();
  __break(1u);
  return result;
}

void *sub_5800(uint64_t a1, uint64_t a2)
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
  sub_5EB4(&qword_10598);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_5868(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_5EB4(&qword_10598);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_5A18(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5940(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_5940(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_A6C0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_5A18(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_A6C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_5AA8(uint64_t a1, uint64_t a2)
{
  sub_A700();
  sub_A5E0();
  Swift::Int v4 = sub_A710();
  return sub_5BA8(a1, a2, v4);
}

unint64_t sub_5B20(char a1)
{
  sub_A700();
  sub_621C(a1);
  sub_A5E0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_A710();
  return sub_5C8C(a1, v2);
}

unint64_t sub_5BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_A6F0() & 1) == 0)
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
      while (!v14 && (sub_A6F0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_5C8C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD00000000000001ELL;
      unint64_t v8 = 0x800000000000AE80;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xD000000000000026;
          uint64_t v9 = "messages_ReadItLongMessageHint";
          goto LABEL_8;
        case 2:
          unint64_t v8 = 0x800000000000AED0;
          unint64_t v7 = 0xD000000000000012;
          break;
        case 3:
          unint64_t v7 = 0xD000000000000025;
          uint64_t v9 = "messages_ReplyHint";
          goto LABEL_8;
        case 4:
          unint64_t v7 = 0xD000000000000013;
          uint64_t v9 = "ltilingualMessageHint";
LABEL_8:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v10 = 0xD00000000000001ELL;
      unint64_t v11 = 0x800000000000AE80;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xD000000000000026;
          uint64_t v12 = "messages_ReadItLongMessageHint";
          goto LABEL_14;
        case 2:
          unint64_t v11 = 0x800000000000AED0;
          unint64_t v10 = 0xD000000000000012;
          break;
        case 3:
          unint64_t v10 = 0xD000000000000025;
          uint64_t v12 = "messages_ReplyHint";
          goto LABEL_14;
        case 4:
          unint64_t v10 = 0xD000000000000013;
          uint64_t v12 = "ltilingualMessageHint";
LABEL_14:
          unint64_t v11 = (unint64_t)v12 | 0x8000000000000000;
          break;
        default:
          break;
      }
      if (v7 == v10 && v8 == v11) {
        break;
      }
      char v14 = sub_A6F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_5EB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_5F20(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_5F58(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5EB4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_5FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5EB4(&qword_10588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_601C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6064(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_60B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6138(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_6144()
{
  return swift_slowDealloc();
}

uint64_t sub_615C()
{
  return v0;
}

uint64_t sub_6178()
{
  return swift_allocObject();
}

uint64_t sub_61A0()
{
  return _swift_release_n(v0, 2);
}

Swift::Int sub_61B8(char a1)
{
  return sub_A710();
}

unint64_t sub_621C(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000026;
      break;
    case 2:
      unint64_t result = sub_708C();
      break;
    case 3:
      unint64_t result = 0xD000000000000025;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_62B8()
{
  uint64_t v0 = sub_A290();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v10 - v5;
  id v7 = (id)AFSystemRootDirectory();
  sub_A5C0();

  sub_A250();
  swift_bridgeObjectRelease();
  sub_A270();
  unint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_A660(22);
  swift_bridgeObjectRelease();
  sub_A270();
  return ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
}

unint64_t sub_645C(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000026;
      break;
    case 2:
      unint64_t result = sub_708C();
      break;
    case 3:
      unint64_t result = 0xD000000000000025;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

void *sub_64F8(unsigned __int8 a1)
{
  if (a1 > 1u) {
    return &_swiftEmptyArrayStorage;
  }
  sub_5EB4(&qword_105B0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_AAA0;
  uint64_t v2 = sub_70A0();
  sub_6568(v2, v3, v4);
  return (void *)v1;
}

uint64_t sub_6568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_A3D0();
  uint64_t v6 = sub_A3C0();
  uint64_t IsConciseResolver = type metadata accessor for IsConciseResolver();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0x7369636E6F437369;
  *(void *)(v8 + 24) = 0xE900000000000065;
  a3[5] = IsConciseResolver;
  unint64_t v9 = sub_663C();
  a3[1] = a2;
  a3[2] = v8;
  *a3 = a1;
  a3[6] = v9;
  a3[7] = v6;
  return swift_bridgeObjectRetain();
}

unint64_t sub_663C()
{
  unint64_t result = qword_105B8;
  if (!qword_105B8)
  {
    type metadata accessor for IsConciseResolver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_105B8);
  }
  return result;
}

uint64_t sub_668C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_C718;
  v6._object = a2;
  unint64_t v4 = sub_A6D0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

_UNKNOWN **sub_66D8()
{
  return &off_C7B0;
}

uint64_t sub_66E4(char *a1, char *a2)
{
  return sub_51B4(*a1, *a2);
}

uint64_t sub_66F0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_668C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_6720@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_621C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_674C(void *a1@<X8>)
{
  *a1 = &off_C7B0;
}

Swift::Int sub_675C()
{
  return sub_61B8(*v0);
}

uint64_t sub_6764(uint64_t a1)
{
  return sub_523C(a1, *v1);
}

Swift::Int sub_676C(uint64_t a1)
{
  return sub_5290(a1, *v1);
}

uint64_t sub_6774()
{
  sub_5EB4(&qword_105C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_ACF0;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 40) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 56) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 64) = 2;
  *(void *)(inited + 72) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 80) = 3;
  *(void *)(inited + 88) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(inited + 96) = 4;
  *(void *)(inited + 104) = &_swiftEmptyArrayStorage;
  sub_5EB4(&qword_105C8);
  sub_6830();
  uint64_t result = sub_A5B0();
  qword_10758 = result;
  return result;
}

unint64_t sub_6830()
{
  unint64_t result = qword_105D0;
  if (!qword_105D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_105D0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AnnounceNotificationHints(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AnnounceNotificationHints(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnnounceNotificationHints(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x69E0);
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

uint64_t sub_6A08(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_6A14(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AnnounceNotificationHints()
{
  return &type metadata for AnnounceNotificationHints;
}

uint64_t initializeBufferWithCopyOfBuffer for Parameter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Parameter(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    sub_6064(a1 + 16);
  }
  return swift_release();
}

uint64_t initializeWithCopy for Parameter(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 2;
  uint64_t v6 = a2[5];
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, void *, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }
  else
  {
    long long v8 = *((_OWORD *)v5 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = v5[4];
  }
  *(void *)(a1 + 56) = a2[7];
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Parameter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    sub_6064(a1 + 16);
    goto LABEL_7;
  }
  sub_6C48((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_6C48(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for Parameter(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for Parameter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    sub_6064(a1 + 16);
  }
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Parameter(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Parameter(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Parameter()
{
  return &type metadata for Parameter;
}

unint64_t sub_6FA0()
{
  unint64_t result = qword_105D8;
  if (!qword_105D8)
  {
    sub_6FF4(&qword_105E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_105D8);
  }
  return result;
}

uint64_t sub_6FF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_7040()
{
  unint64_t result = qword_105E8;
  if (!qword_105E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_105E8);
  }
  return result;
}

unint64_t sub_708C()
{
  return 0xD000000000000012;
}

uint64_t sub_70A0()
{
  return 0x7369636E6F437369;
}

uint64_t sub_70BC()
{
  sub_A370();
  swift_allocObject();
  uint64_t result = sub_A380();
  qword_105F0 = result;
  return result;
}

uint64_t sub_7110()
{
  if (qword_10340 != -1) {
    swift_once();
  }
  return sub_A3B0();
}

double sub_71C8@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = sub_5EB4(&qword_10700);
  uint64_t v4 = swift_allocObject();
  *a2 = v4;
  return sub_7270(a1, v4 + 16);
}

uint64_t sub_7220()
{
  sub_A3D0();
  uint64_t result = sub_A3C0();
  qword_10620 = result;
  return result;
}

double sub_7270@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_60B4(a1, (uint64_t)v22);
  sub_5EB4(&qword_10708);
  if (swift_dynamicCast()) {
    long long v3 = v21;
  }
  else {
    long long v3 = &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v19 = a2;
    uint64_t v5 = (uint64_t)(v3 + 4);
    swift_bridgeObjectRetain();
    uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
    while (1)
    {
      sub_60B4(v5, (uint64_t)v22);
      sub_60B4((uint64_t)v22, (uint64_t)&v21);
      sub_9034();
      if (swift_dynamicCast())
      {
        sub_925C(v20);
        uint64_t v8 = v7;
        swift_bridgeObjectRelease();
        if (v8)
        {
          id v9 = [v20 displayName];
          uint64_t v10 = sub_A5C0();
          uint64_t v12 = v11;

          sub_6064((uint64_t)v22);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_9074(0, *((void *)v6 + 2) + 1, 1, (uint64_t)v6);
          }
          unint64_t v14 = *((void *)v6 + 2);
          unint64_t v13 = *((void *)v6 + 3);
          if (v14 >= v13 >> 1) {
            uint64_t v6 = sub_9074((char *)(v13 > 1), v14 + 1, 1, (uint64_t)v6);
          }
          *((void *)v6 + 2) = v14 + 1;
          uint64_t v15 = &v6[16 * v14];
          *((void *)v15 + 4) = v10;
          *((void *)v15 + 5) = v12;
          goto LABEL_15;
        }
      }
      sub_6064((uint64_t)v22);
LABEL_15:
      v5 += 32;
      if (!--v4)
      {
        swift_bridgeObjectRelease_n();
        a2 = v19;
        goto LABEL_18;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
LABEL_18:
  if (*((void *)v6 + 2))
  {
    uint64_t v16 = *((void *)v6 + 4);
    uint64_t v17 = *((void *)v6 + 5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a2 + 24) = &type metadata for String;
    *(void *)a2 = v16;
    *(void *)(a2 + 8) = v17;
  }
  else
  {
    swift_bridgeObjectRelease();
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_74A0(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  uint64_t v4 = sub_A390();
  v3[15] = v4;
  v3[16] = *(void *)(v4 - 8);
  v3[17] = swift_task_alloc();
  return _swift_task_switch(sub_7564, 0, 0);
}

uint64_t sub_7564()
{
  if (qword_102F0 != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[12];
  uint64_t v2 = qword_105F0;
  v0[5] = sub_A370();
  v0[6] = sub_8E08(&qword_106D0, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[2] = v2;
  uint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  long long v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  *long long v3 = v0;
  v3[1] = sub_76D4;
  return v5(v0 + 2);
}

uint64_t sub_76D4()
{
  sub_92E0();
  uint64_t v1 = v0 + 16;
  *(void *)(v0 + 152) = v2;
  swift_task_dealloc();
  sub_6064(v1);
  return _swift_task_switch(sub_77BC, 0, 0);
}

uint64_t sub_77BC()
{
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[16];
  uint64_t v2 = (void *)v0[17];
  uint64_t v4 = v0[15];
  sub_5EB4(&qword_106D8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_AE00;
  sub_A4C0();
  uint64_t v6 = sub_A3A0();
  v0[10] = v6;
  v0[11] = sub_8E08(&qword_106E0, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  uint64_t v7 = sub_8E9C(v0 + 7);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v7, enum case for CoreSignalTypes.app(_:), v6);
  *(void *)(v5 + 32) = sub_A490();
  *(void *)(v5 + 40) = sub_A480();
  *(void *)(v5 + 48) = sub_A4A0();
  *(void *)(v5 + 56) = sub_A4B0();
  sub_A610();
  sub_7BFC(v1, v5);
  swift_bridgeObjectRelease();
  *uint64_t v2 = 0xD00000000000001ELL;
  v2[1] = 0x800000000000B400;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v2, enum case for DialogDetails.catId(_:), v4);
  sub_A460();
  swift_release();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v22 = sub_66D8();
  uint64_t v8 = (char *)v22[2];
  if (v8)
  {
    id v9 = (unsigned __int8 *)(v22 + 4);
    while (2)
    {
      int v11 = *v9++;
      char v10 = v11;
      switch(v11)
      {
        case 1:
          sub_92C0();
          uint64_t v13 = v15 + 20;
          unint64_t v14 = "messages_ReadItLongMessageHint";
          goto LABEL_9;
        case 2:
          uint64_t v16 = (void *)0x800000000000AED0;
          uint64_t v13 = 0xD000000000000012;
          goto LABEL_10;
        case 3:
          sub_92C0();
          uint64_t v13 = v17 + 19;
          unint64_t v14 = "messages_ReplyHint";
          goto LABEL_9;
        case 4:
          sub_92C0();
          uint64_t v13 = v18 + 1;
          unint64_t v14 = "ltilingualMessageHint";
          goto LABEL_9;
        default:
          sub_92C0();
          uint64_t v13 = v12 + 12;
          unint64_t v14 = (char *)&xmmword_AE80;
LABEL_9:
          uint64_t v16 = (void *)((unint64_t)v14 | 0x8000000000000000);
LABEL_10:
          v24._countAndFlagsBits = v13;
          v24._object = v16;
          sub_A5F0(v24);
          swift_bridgeObjectRelease();
          *(unsigned char *)(swift_task_alloc() + 16) = v10;
          sub_A450();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_task_dealloc();
          if (!--v8) {
            break;
          }
          continue;
      }
      break;
    }
  }
  swift_bridgeObjectRelease();
  sub_5EB4(&qword_106E8);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_AAA0;
  sub_A470();
  swift_release();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(uint64_t))v0[1];
  return v20(v19);
}

uint64_t sub_7BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A390();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (void *)((char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v7 = 0xD000000000000021;
  v7[1] = 0x800000000000B480;
  uint64_t v8 = enum case for DialogDetails.catId(_:);
  id v9 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 104);
  v9(v7, enum case for DialogDetails.catId(_:), v4);
  uint64_t v13 = v2;
  uint64_t v14 = a2;
  sub_A460();
  char v10 = *(void (**)(void *, uint64_t))(v5 + 8);
  v10(v7, v4);
  *uint64_t v7 = 0xD000000000000023;
  v7[1] = 0x800000000000B4D0;
  v9(v7, v8, v4);
  v12[4] = v12[1];
  v12[5] = a2;
  sub_A460();
  swift_release();
  swift_release();
  return ((uint64_t (*)(void *, uint64_t))v10)(v7, v4);
}

uint64_t sub_7E00(void *a1)
{
  uint64_t v1 = a1[5];
  long long v22 = *(_OWORD *)(a1 + 3);
  sub_8E58(a1, a1[3]);
  sub_5EB4(&qword_106F0);
  uint64_t v2 = sub_A360();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_AE10;
  unint64_t v7 = v6 + v5;
  uint64_t v8 = *(void (**)(unint64_t, void, uint64_t))(v3 + 104);
  v8(v7, enum case for DeviceType.iPhone(_:), v2);
  v8(v7 + v4, enum case for DeviceType.iPad(_:), v2);
  long long v35 = v22;
  uint64_t v36 = v1;
  sub_8E9C(v34);
  sub_A400();
  swift_bridgeObjectRelease();
  uint64_t v9 = v36;
  long long v23 = v35;
  sub_8E58(v34, v35);
  if (qword_10328 != -1) {
    swift_once();
  }
  long long v32 = v23;
  uint64_t v33 = v9;
  sub_8E9C(v31);
  sub_A410();
  uint64_t v10 = v33;
  long long v24 = v32;
  sub_8E58(v31, v32);
  if (qword_10320 != -1) {
    swift_once();
  }
  *(_OWORD *)uint64_t v30 = v24;
  *(void *)&v30[16] = v10;
  sub_8E9C(v29);
  sub_A3F0();
  uint64_t v11 = *(void *)v30;
  long long v25 = *(_OWORD *)&v30[8];
  sub_8E58(v29, *(uint64_t *)v30);
  sub_5EB4(&qword_106D8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_AE00;
  sub_A4C0();
  uint64_t v13 = sub_A3A0();
  uint64_t v27 = v13;
  uint64_t v14 = sub_8E08(&qword_106E0, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  *(void *)&long long v28 = v14;
  uint64_t v15 = sub_8E9C(v26);
  uint64_t v16 = enum case for CoreSignalTypes.app(_:);
  uint64_t v17 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104);
  v17(v15, enum case for CoreSignalTypes.app(_:), v13);
  *(void *)(v12 + 32) = sub_A490();
  uint64_t v27 = v13;
  *(void *)&long long v28 = v14;
  uint64_t v18 = sub_8E9C(v26);
  v17(v18, v16, v13);
  *(void *)(v12 + 40) = sub_A490();
  uint64_t v27 = v13;
  *(void *)&long long v28 = v14;
  uint64_t v19 = sub_8E9C(v26);
  v17(v19, v16, v13);
  if (qword_10318 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  *(void *)(v12 + 48) = sub_A490();
  uint64_t v27 = v13;
  *(void *)&long long v28 = v14;
  uint64_t v20 = sub_8E9C(v26);
  v17(v20, v16, v13);
  if (qword_10310 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  *(void *)(v12 + 56) = sub_A490();
  v26[0] = v12;
  sub_A610();
  uint64_t v27 = v11;
  long long v28 = v25;
  sub_8E9C(v26);
  sub_A350();
  swift_bridgeObjectRelease();
  sub_6064((uint64_t)v26);
  sub_6064((uint64_t)v29);
  sub_6064((uint64_t)v31);
  return sub_6064((uint64_t)v34);
}

uint64_t sub_8334(uint64_t a1, int a2)
{
  LODWORD(v25) = a2;
  *(void *)&long long v26 = sub_A290();
  uint64_t v24 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 40);
  long long v23 = *(_OWORD *)(a1 + 24);
  sub_8E58((void *)a1, v23);
  if (qword_10328 != -1) {
    swift_once();
  }
  long long v38 = v23;
  uint64_t v39 = v5;
  sub_8E9C(&v37);
  sub_A410();
  uint64_t v6 = v39;
  long long v22 = v38;
  *(void *)&long long v23 = sub_8E58(&v37, v38);
  sub_5EB4(&qword_106F0);
  uint64_t v7 = sub_A360();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_AE10;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *(void (**)(unint64_t, void, uint64_t))(v8 + 104);
  v13(v12, enum case for DeviceType.iPhone(_:), v7);
  v13(v12 + v9, enum case for DeviceType.iPad(_:), v7);
  long long v35 = v22;
  uint64_t v36 = v6;
  sub_8E9C(v34);
  sub_A400();
  swift_bridgeObjectRelease();
  uint64_t v14 = v36;
  long long v23 = v35;
  sub_8E58(v34, v35);
  char v15 = (char)v25;
  sub_62B8();
  sub_A280();
  (*(void (**)(char *, void))(v24 + 8))(v4, v26);
  long long v32 = v23;
  uint64_t v33 = v14;
  sub_8E9C(v31);
  sub_A3F0();
  swift_bridgeObjectRelease();
  uint64_t v16 = v33;
  long long v26 = v32;
  sub_8E58(v31, v32);
  sub_645C(v15);
  *(_OWORD *)uint64_t v30 = v26;
  *(void *)&v30[16] = v16;
  sub_8E9C(v29);
  sub_A420();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)v30;
  long long v26 = *(_OWORD *)&v30[8];
  sub_8E58(v29, *(uint64_t *)v30);
  if (qword_102E8 != -1) {
    swift_once();
  }
  sub_4788(v15, qword_10758);
  v27[3] = v17;
  long long v28 = v26;
  sub_8E9C(v27);
  sub_A350();
  swift_bridgeObjectRelease();
  sub_6064((uint64_t)v27);
  sub_6064((uint64_t)v29);
  sub_6064((uint64_t)v31);
  sub_6064((uint64_t)v34);
  sub_6064((uint64_t)&v37);
  long long v25 = sub_64F8(v15);
  uint64_t v18 = v25[2];
  if (v18)
  {
    uint64_t v19 = (char *)(v25 + 6);
    do
    {
      uint64_t v20 = *(void *)(a1 + 40);
      long long v26 = *(_OWORD *)(a1 + 24);
      sub_8E58((void *)a1, v26);
      long long v38 = v26;
      uint64_t v39 = v20;
      sub_8E9C(&v37);
      sub_A440();
      sub_6064((uint64_t)&v37);
      v19 += 64;
      --v18;
    }
    while (v18);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_8868(uint64_t a1)
{
  sub_8934((void *)a1);
  uint64_t v2 = *(void *)(a1 + 24);
  long long v4 = *(_OWORD *)(a1 + 32);
  sub_8E58((void *)a1, v2);
  if (qword_10338 != -1) {
    swift_once();
  }
  v5[3] = v2;
  long long v6 = v4;
  sub_8E9C(v5);
  sub_A340();
  return sub_6064((uint64_t)v5);
}

uint64_t sub_8934(void *a1)
{
  uint64_t v1 = a1[5];
  long long v7 = *(_OWORD *)(a1 + 3);
  sub_8E58(a1, a1[3]);
  if (qword_10330 != -1) {
    swift_once();
  }
  long long v24 = v7;
  uint64_t v25 = v1;
  sub_8E9C(v23);
  sub_A400();
  uint64_t v2 = v25;
  long long v8 = v24;
  sub_8E58(v23, v24);
  if (qword_10328 != -1) {
    swift_once();
  }
  long long v21 = v8;
  uint64_t v22 = v2;
  sub_8E9C(v20);
  sub_A410();
  uint64_t v3 = v22;
  long long v9 = v21;
  sub_8E58(v20, v21);
  if (qword_10320 != -1) {
    swift_once();
  }
  *(_OWORD *)uint64_t v19 = v9;
  *(void *)&v19[16] = v3;
  sub_8E9C(v18);
  sub_A3F0();
  uint64_t v4 = *(void *)v19;
  long long v10 = *(_OWORD *)&v19[8];
  sub_8E58(v18, *(uint64_t *)v19);
  *(void *)uint64_t v17 = v4;
  *(_OWORD *)&v17[8] = v10;
  sub_8E9C(v16);
  sub_A350();
  uint64_t v5 = *(void *)&v17[16];
  long long v11 = *(_OWORD *)v17;
  sub_8E58(v16, *(uint64_t *)v17);
  if (qword_102F8 != -1) {
    swift_once();
  }
  sub_8F30((uint64_t)&unk_105F8, (uint64_t)v12);
  if (qword_10300 != -1) {
    swift_once();
  }
  long long v14 = v11;
  uint64_t v15 = v5;
  sub_8E9C(v13);
  sub_A430();
  sub_8F94((uint64_t)v12);
  sub_6064((uint64_t)v13);
  sub_6064((uint64_t)v16);
  sub_6064((uint64_t)v18);
  sub_6064((uint64_t)v20);
  return sub_6064((uint64_t)v23);
}

uint64_t sub_8C54()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for MessagesOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_8C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8D30;
  return sub_74A0(a1, a2);
}

uint64_t sub_8D30(uint64_t a1)
{
  sub_92E0();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_8E08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_8E50(uint64_t a1)
{
  return sub_8334(a1, *(unsigned __int8 *)(v1 + 16));
}

void *sub_8E58(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *sub_8E9C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_8F00(uint64_t a1)
{
  return sub_8868(a1);
}

uint64_t sub_8F08(void *a1)
{
  return sub_8934(a1);
}

uint64_t sub_8F30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8F94(uint64_t a1)
{
  uint64_t v2 = sub_5EB4(&qword_106F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_8FF4()
{
  if (*(void *)(v0 + 40)) {
    sub_6064(v0 + 16);
  }
  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_9034()
{
  unint64_t result = qword_10710;
  if (!qword_10710)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10710);
  }
  return result;
}

char *sub_9074(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_5EB4(&qword_10718);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    long long v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_9CF4((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_9164(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_9164(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_A6C0();
  __break(1u);
  return result;
}

uint64_t sub_925C(void *a1)
{
  id v1 = [a1 contactIdentifier];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_A5C0();

  return v3;
}

uint64_t Logger.suggestions.unsafeMutableAddressor()
{
  if (qword_10308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_A530();
  return sub_5F20(v0, (uint64_t)static Logger.suggestions);
}

uint64_t sub_935C()
{
  uint64_t v0 = sub_A530();
  sub_9498(v0, static Logger.suggestions);
  sub_5F20(v0, (uint64_t)static Logger.suggestions);
  return sub_A520();
}

uint64_t static Logger.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10308 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_A530();
  uint64_t v3 = sub_5F20(v2, (uint64_t)static Logger.suggestions);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t *sub_9498(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_94FC()
{
}

void sub_9528()
{
}

uint64_t sub_9554()
{
  uint64_t result = sub_9578();
  qword_10798 = result;
  unk_107A0 = v1;
  return result;
}

uint64_t sub_9578()
{
  uint64_t v0 = sub_A290();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)v18 - v5;
  id v7 = (id)AFSystemRootDirectory();
  sub_A5C0();

  sub_A250();
  swift_bridgeObjectRelease();
  sub_A270();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  sub_A1FC(0, &qword_10728);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  id v9 = sub_982C((uint64_t)v4);
  if (v9 && (uint64_t v10 = sub_A18C(v9), v11))
  {
    v18[0] = v10;
    v18[1] = v11;
    swift_bridgeObjectRetain();
    v19._countAndFlagsBits = 0x74616C706D65542FLL;
    v19._object = (void *)0xEA00000000007365;
    sub_A5F0(v19);
    swift_bridgeObjectRelease();
    uint64_t v12 = v18[0];
  }
  else
  {
    if (qword_10308 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_A530();
    sub_5F20(v13, (uint64_t)static Logger.suggestions);
    long long v14 = sub_A510();
    os_log_type_t v15 = sub_A630();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "#Constants failed to find SiriMessagesFlow resource path", v16, 2u);
      swift_slowDealloc();
    }

    uint64_t v12 = 0;
  }
  v8(v6, v0);
  return v12;
}

id sub_982C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_A260(v3);
  uint64_t v5 = v4;
  id v6 = [v2 initWithURL:v4];

  uint64_t v7 = sub_A290();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

uint64_t sub_98C8()
{
  uint64_t v0 = sub_A2B0();
  sub_611C();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5EB4(&qword_10718);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_AE80;
  *(void *)(inited + 32) = 0x45442D6564;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = 0x55412D6E65;
  *(void *)(inited + 56) = 0xE500000000000000;
  *(void *)(inited + 64) = 0x41432D6E65;
  *(void *)(inited + 72) = 0xE500000000000000;
  *(void *)(inited + 80) = 0x42472D6E65;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = 0x4E492D6E65;
  *(void *)(inited + 104) = 0xE500000000000000;
  *(void *)(inited + 112) = 0x53552D6E65;
  *(void *)(inited + 120) = 0xE500000000000000;
  *(void *)(inited + 128) = 0x53452D7365;
  *(void *)(inited + 136) = 0xE500000000000000;
  *(void *)(inited + 144) = 0x584D2D7365;
  *(void *)(inited + 152) = 0xE500000000000000;
  *(void *)(inited + 160) = 0x53552D7365;
  *(void *)(inited + 168) = 0xE500000000000000;
  *(void *)(inited + 176) = 0x52462D7266;
  *(void *)(inited + 184) = 0xE500000000000000;
  *(void *)(inited + 192) = 0x504A2D616ALL;
  *(void *)(inited + 200) = 0xE500000000000000;
  *(void *)(inited + 208) = 0x4E432D687ALL;
  *(void *)(inited + 216) = 0xE500000000000000;
  *(void *)(inited + 224) = 0x4B482D687ALL;
  *(void *)(inited + 232) = 0xE500000000000000;
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_9FD0(0, 13, 0);
  uint64_t v7 = 0;
  uint64_t v8 = (uint64_t)v12;
  do
  {
    swift_bridgeObjectRetain_n();
    sub_A2A0();
    swift_bridgeObjectRelease();
    uint64_t v12 = (void *)v8;
    unint64_t v10 = *(void *)(v8 + 16);
    unint64_t v9 = *(void *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      sub_9FD0(v9 > 1, v10 + 1, 1);
      uint64_t v8 = (uint64_t)v12;
    }
    *(void *)(v8 + 16) = v10 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v8+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v10, v5, v0);
    v7 += 16;
  }
  while (v7 != 208);
  swift_setDeallocating();
  uint64_t result = sub_9CB0();
  qword_107A8 = v8;
  return result;
}

uint64_t sub_9B44()
{
  sub_5EB4(&qword_106F0);
  sub_A360();
  sub_611C();
  uint64_t v1 = v0;
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_AE90;
  uint64_t v3 = *(void (**)(void))(v1 + 104);
  sub_A238();
  v3();
  sub_A238();
  v3();
  sub_A238();
  uint64_t result = ((uint64_t (*)(void))v3)();
  qword_107B0 = v2;
  return result;
}

uint64_t sub_9C30()
{
  sub_A1FC(0, &qword_10730);
  sub_5EB4(&qword_10738);
  uint64_t result = sub_A5D0();
  qword_107B8 = result;
  unk_107C0 = v1;
  return result;
}

void sub_9C8C()
{
}

uint64_t sub_9CB0()
{
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

char *sub_9CF4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_A6C0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_9D88(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_A6C0();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_A2B0(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_A2B0();
    return _swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v11);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  return result;
}

uint64_t sub_9EB8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_A2B0() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_A6C0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

size_t sub_9FD0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_9FF0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_9FF0(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_5EB4(&qword_10720);
  uint64_t v10 = *(void *)(sub_A2B0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  uint64_t v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_A2B0() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_9D88(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_9EB8(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_A18C(void *a1)
{
  id v2 = [a1 resourcePath];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_A5C0();

  return v3;
}

uint64_t sub_A1FC(uint64_t a1, unint64_t *a2)
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

void sub_A248(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = v2;
}

uint64_t sub_A250()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_A260(NSURL *retstr@<X8>)
{
}

uint64_t sub_A270()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_A280()
{
  return URL.path.getter();
}

uint64_t sub_A290()
{
  return type metadata accessor for URL();
}

uint64_t sub_A2A0()
{
  return Locale.init(identifier:)();
}

uint64_t sub_A2B0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_A2C0()
{
  return static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
}

uint64_t sub_A2D0()
{
  return UsoEntityBuilder_common_Agent.init()();
}

uint64_t sub_A2E0()
{
  return type metadata accessor for UsoEntityBuilder_common_Agent();
}

uint64_t sub_A2F0()
{
  return UsoEntityBuilder_common_Group.init()();
}

uint64_t sub_A300()
{
  return type metadata accessor for UsoEntityBuilder_common_Group();
}

uint64_t sub_A310()
{
  return dispatch thunk of UsoValue.getAsPrimitiveValueString()();
}

uint64_t sub_A320()
{
  return UsoEntity.attributes.getter();
}

uint64_t sub_A330()
{
  return type metadata accessor for UsoEntity();
}

uint64_t sub_A340()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.enableThirdPartyIntents(_:)();
}

uint64_t sub_A350()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_A360()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_A370()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_A380()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_A390()
{
  return type metadata accessor for DialogDetails();
}

uint64_t sub_A3A0()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_A3B0()
{
  return static ProactiveResolver.createProactiveResolver(resolverType:actionId:entityId:valuePostProcessor:with3POverrideSupport:)();
}

uint64_t sub_A3C0()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)();
}

uint64_t sub_A3D0()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_A3E0()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t sub_A3F0()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_A400()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_A410()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_A420()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_A430()
{
  return dispatch thunk of SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:shownOnLockscreen:)();
}

uint64_t sub_A440()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_A450()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_A460()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
}

uint64_t sub_A470()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_A480()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_A490()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_A4A0()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_A4B0()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_A4C0()
{
  return type metadata accessor for Signal();
}

uint64_t sub_A4D0()
{
  return Wrappable.getRoot()();
}

uint64_t sub_A4E0()
{
  return dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)();
}

uint64_t sub_A4F0()
{
  return ReferenceResolutionClient.__allocating_init()();
}

uint64_t sub_A500()
{
  return type metadata accessor for ReferenceResolutionClient();
}

uint64_t sub_A510()
{
  return Logger.logObject.getter();
}

uint64_t sub_A520()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_A530()
{
  return type metadata accessor for Logger();
}

uint64_t sub_A540()
{
  return RRCandidate.entity.getter();
}

uint64_t sub_A550()
{
  return type metadata accessor for RRCandidate();
}

uint64_t sub_A560()
{
  return type metadata accessor for RRQuery();
}

uint64_t sub_A570()
{
  return RREntity.usoEntity.getter();
}

uint64_t sub_A580()
{
  return type metadata accessor for RREntity();
}

uint64_t sub_A590()
{
  return type metadata accessor for RRFilter();
}

uint64_t sub_A5A0()
{
  return type metadata accessor for RRResult();
}

uint64_t sub_A5B0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_A5C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A5D0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_A5E0()
{
  return String.hash(into:)();
}

void sub_A5F0(Swift::String a1)
{
}

Swift::Int sub_A600()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_A610()
{
  return specialized Array._endMutation()();
}

uint64_t sub_A620()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_A630()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_A640()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A650()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_A660(Swift::Int a1)
{
}

uint64_t sub_A670()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_A680()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_A690()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_A6A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A6B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_A6C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_A6D0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_A6E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_A6F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A700()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_A710()
{
  return Hasher._finalize()();
}

uint64_t AFSystemRootDirectory()
{
  return _AFSystemRootDirectory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}