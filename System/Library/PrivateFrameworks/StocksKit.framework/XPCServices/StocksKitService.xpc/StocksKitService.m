uint64_t sub_100003F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v0 = sub_100006F40();
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006EF0();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100004FD0(0, &qword_10000C0E0, &qword_10000C0E8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000075A0;
  v9 = sub_100006EA0();
  swift_allocObject();
  v10 = sub_100006E90();
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = sub_1000050DC(&qword_10000C0F0, (void (*)(uint64_t))&type metadata accessor for Assembly);
  *(void *)(v8 + 32) = v10;
  *(void *)(v8 + 96) = sub_100007060();
  *(void *)(v8 + 104) = sub_1000050DC(&qword_10000C0F8, (void (*)(uint64_t))&type metadata accessor for Assembly);
  sub_100005028((uint64_t *)(v8 + 72));
  sub_100007050();
  sub_100004FD0(0, &qword_10000C100, &qword_10000C108);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1000075B0;
  v12 = type metadata accessor for Assembly();
  v13 = swift_allocObject();
  *(void *)(v11 + 56) = v12;
  *(void *)(v11 + 64) = sub_1000050DC(&qword_10000C110, (void (*)(uint64_t))type metadata accessor for Assembly);
  *(void *)(v11 + 32) = v13;
  sub_100006F10();
  swift_allocObject();
  sub_100006F00();
  *v7 = [objc_allocWithZone((Class)NSRecursiveLock) init];
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for ContainerLock.lock(_:), v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Container.Environment.normal(_:), v0);
  sub_100006F70();
  swift_allocObject();
  result = sub_100006F50();
  qword_10000C0B0 = result;
  return result;
}

uint64_t sub_1000042D8()
{
  if (qword_10000C0B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100006FA0();
  sub_100004E58(v0, (uint64_t)qword_10000C1E0);
  v1 = sub_100006F80();
  os_log_type_t v2 = sub_100007140();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Handling request", v3, 2u);
    swift_slowDealloc();
  }

  sub_100007040();
  sub_1000050DC(&qword_10000C0D0, (void (*)(uint64_t))&type metadata accessor for PeerHandler);
  return sub_100006FF0();
}

uint64_t sub_100004430@<X0>(uint64_t a1@<X8>)
{
  sub_100004EE0(0, &qword_10000C0D8, (void (*)(uint64_t))&type metadata accessor for PeerHandler);
  __chkstk_darwin();
  v3 = (char *)&v14 - v2;
  if (qword_10000C0B8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006FA0();
  sub_100004E58(v4, (uint64_t)qword_10000C1E0);
  swift_retain_n();
  v5 = sub_100006F80();
  os_log_type_t v6 = sub_100007140();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v15 = a1;
    v8 = (uint8_t *)v7;
    v17[0] = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    uint64_t v9 = sub_100006FB0();
    uint64_t v16 = sub_100005208(v9, v10, v17);
    sub_100007160();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Accepted request %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v15;
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  sub_100006F60();
  sub_100004F34(v17, v17[3]);
  uint64_t v11 = sub_100007040();
  swift_retain();
  sub_100006EC0();
  swift_release();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1, v11);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v3, v11);
    return sub_100004F80((uint64_t)v17);
  }
  return result;
}

uint64_t sub_100004734(void *a1)
{
  return sub_100006EB0();
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t sub_10000479C()
{
  return 0;
}

void sub_1000047A8()
{
  sub_100006FE0();
  __chkstk_darwin();
  sub_100005B20(1uLL);
  uint64_t v0 = sub_100005E38();
  unint64_t v2 = v1;
  if (qword_10000C0B8 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100006FA0();
  sub_100004E58(v3, (uint64_t)qword_10000C1E0);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_100006F80();
  os_log_type_t v5 = sub_100007140();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    v16[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_100005208(v0, v2, v16);
    sub_100007160();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Overriding $HOME path in XPC with: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v7 = sub_1000070B0();
  setenv("HOME", (const char *)(v7 + 32), 1);
  swift_release();
  uint64_t v8 = sub_1000070B0();
  setenv("CFFIXED_USER_HOME", (const char *)(v8 + 32), 1);
  swift_release();
  v16[0] = 7368052;
  v16[1] = 0xE300000000000000;
  swift_bridgeObjectRetain();
  sub_100007100();
  sub_1000070C0();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_1000070B0();
  swift_bridgeObjectRelease();
  setenv("TMPDIR", (const char *)(v9 + 32), 1);
  swift_release();
  unint64_t v10 = sub_100006F80();
  os_log_type_t v11 = sub_100007140();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Starting XPCListener", v12, 2u);
    swift_slowDealloc();
  }

  if (qword_10000C0A8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100007020();
  sub_100006FD0();
  sub_100007010();
  swift_allocObject();
  sub_100007000();
  v13 = sub_100006F80();
  os_log_type_t v14 = sub_100007140();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Starting XPCListener dispatchMain", v15, 2u);
    swift_slowDealloc();
  }

  dispatch_main();
}

uint64_t sub_100004E58(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100004E90()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_100004ED0()
{
  return sub_1000042D8();
}

uint64_t sub_100004ED8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004430(a1);
}

void sub_100004EE0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100007150();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_100004F34(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004F78(void *a1)
{
  return sub_100004734(a1);
}

uint64_t sub_100004F80(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100004FD0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_10000508C(255, a3);
    unint64_t v4 = sub_1000071E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_100005028(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000508C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000050DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005124()
{
  uint64_t v0 = sub_100006FA0();
  sub_100005194(v0, qword_10000C1E0);
  sub_100004E58(v0, (uint64_t)qword_10000C1E0);
  return sub_100006F90();
}

uint64_t *sub_100005194(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005208(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000052DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000065F4((uint64_t)v12, *a3);
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
      sub_1000065F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004F80((uint64_t)v12);
  return v7;
}

uint64_t sub_1000052DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007170();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005498(a5, a6);
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
  uint64_t v8 = sub_1000071A0();
  if (!v8)
  {
    sub_1000071B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000071C0();
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

uint64_t sub_100005498(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005530(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005730(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005730(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005530(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000056A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100007190();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000071B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000070F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000071C0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000071B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000056A8(uint64_t a1, uint64_t a2)
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
  sub_100006654(0, &qword_10000C128, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005730(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006654(0, &qword_10000C128, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_1000071C0();
  __break(1u);
  return result;
}

uint64_t sub_1000058A0()
{
  uint64_t v0 = [self currentPersona];
  if (!v0)
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100006FA0();
    sub_100004E58(v7, (uint64_t)qword_10000C1E0);
    uint64_t v1 = sub_100006F80();
    os_log_type_t v8 = sub_100007140();
    if (os_log_type_enabled(v1, v8))
    {
      int64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v8, "Personas are not supported, using primary persona", v9, 2u);
      swift_slowDealloc();
    }
    goto LABEL_17;
  }
  uint64_t v1 = v0;
  if (![v0 isDataSeparatedPersona])
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100006FA0();
    sub_100004E58(v10, (uint64_t)qword_10000C1E0);
    size_t v11 = sub_100006F80();
    os_log_type_t v12 = sub_100007140();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Current user persona is not data-separated, using primary persona", v13, 2u);
      swift_slowDealloc();
    }

LABEL_17:
    uint64_t v6 = 1;
    goto LABEL_18;
  }
  if (qword_10000C0B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006FA0();
  sub_100004E58(v2, (uint64_t)qword_10000C1E0);
  unint64_t v3 = sub_100006F80();
  os_log_type_t v4 = sub_100007140();
  if (os_log_type_enabled(v3, v4))
  {
    size_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)size_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Current user persona is data-separated, leaving query persona to be inferred by container manager", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = 0;
LABEL_18:

  return v6;
}

unint64_t sub_100005B20(unint64_t a1)
{
  if (!container_query_create())
  {
    sub_1000065A0();
    swift_allocError();
    void *v3 = 0xD000000000000020;
    v3[1] = 0x8000000100007CA0;
    swift_willThrow();
    return a1;
  }
  if (a1) {
    a1 = 0x900000001;
  }
  else {
    a1 = 0x900000000;
  }
  container_query_set_class();
  if (sub_1000058A0()) {
    container_query_set_persona_unique_string();
  }
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100006FA0();
    sub_100004E58(v4, (uint64_t)qword_10000C1E0);
    size_t v5 = sub_100006F80();
    os_log_type_t v6 = sub_100007120();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "container_query_get_single_result() failure", v7, 2u);
      swift_slowDealloc();
    }

    container_query_get_last_error();
    if (container_error_copy_unlocalized_description())
    {
      sub_100007180(19);
      swift_bridgeObjectRelease();
      v8._countAndFlagsBits = sub_1000070E0();
    }
    else
    {
      sub_100007180(19);
      swift_bridgeObjectRelease();
      sub_100006654(0, &qword_10000C130, (uint64_t)&type metadata for OpaquePointer, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
      v8._countAndFlagsBits = sub_1000070A0();
    }
    sub_1000070D0(v8);
    swift_bridgeObjectRelease();
    a1 = 0xD000000000000011;
    sub_1000065A0();
    swift_allocError();
    *uint64_t v10 = 0xD000000000000011;
    v10[1] = 0x8000000100007CD0;
    goto LABEL_20;
  }
  uint64_t v2 = container_copy_object();
  if (!v2)
  {
    sub_1000065A0();
    swift_allocError();
    *int64_t v9 = 0xD000000000000018;
    v9[1] = 0x8000000100007CF0;
LABEL_20:
    swift_willThrow();
    container_query_free();
    return a1;
  }
  a1 = v2;
  container_query_free();
  return a1;
}

uint64_t sub_100005E38()
{
  sub_100007090();
  __chkstk_darwin();
  if (!container_get_path() || !container_get_identifier() || (sub_100007080(), uint64_t v0 = sub_100007070(), !v1))
  {
    sub_1000065A0();
    swift_allocError();
    *uint64_t v10 = 0xD000000000000030;
    size_t v11 = "Failed at accessing container path and identity.";
LABEL_9:
    unint64_t v12 = (unint64_t)(v11 - 32) | 0x8000000000000000;
LABEL_10:
    v10[1] = v12;
    return swift_willThrow();
  }
  unint64_t v2 = v1;
  uint64_t v24 = v0;
  uint64_t v3 = sub_1000070E0();
  unint64_t v5 = v4;
  if (qword_10000C0B8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100006FA0();
  sub_100004E58(v6, (uint64_t)qword_10000C1E0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_100006F80();
  os_log_type_t v8 = sub_100007110();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100005208(v3, v5, &v25);
    sub_100007160();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100005208(v24, v2, &v25);
    sub_100007160();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Found container %s with path: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = container_copy_sandbox_token();
  if (!v14)
  {
    swift_bridgeObjectRelease();
    sub_1000065A0();
    swift_allocError();
    *uint64_t v10 = 0xD00000000000003ALL;
    size_t v11 = "extensionToken: nil (skipping sandbox_extension_consume())";
    goto LABEL_9;
  }
  uint64_t v15 = v14;
  uint64_t v16 = sub_100006F80();
  os_log_type_t v17 = sub_100007110();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)v18 = 136315138;
    uint64_t v27 = v15;
    sub_100006654(0, &qword_10000C120, (uint64_t)&type metadata for Int8, (uint64_t (*)(void, uint64_t))&type metadata accessor for UnsafeMutablePointer);
    uint64_t v19 = sub_1000070A0();
    uint64_t v27 = sub_100005208(v19, v20, &v25);
    sub_100007160();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "extensionToken: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v21 = sandbox_extension_consume();
  if (v21 < 0)
  {
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
    unint64_t v26 = 0xE000000000000000;
    sub_100007180(46);
    swift_bridgeObjectRelease();
    uint64_t v25 = 0xD00000000000002CLL;
    unint64_t v26 = 0x8000000100007A20;
    uint64_t v27 = v22;
    v28._countAndFlagsBits = sub_1000071D0();
    sub_1000070D0(v28);
    swift_bridgeObjectRelease();
    uint64_t v23 = v25;
    unint64_t v12 = v26;
    sub_1000065A0();
    swift_allocError();
    *uint64_t v10 = v23;
    goto LABEL_10;
  }
  return v24;
}

uint64_t sub_10000636C()
{
  return sub_100005E38();
}

void sub_100006548()
{
  if (!qword_10000C0C0)
  {
    sub_100004E90();
    unint64_t v0 = sub_100007150();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C0C0);
    }
  }
}

unint64_t sub_1000065A0()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

uint64_t sub_1000065F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100006654(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ContainerUtilities.ContainerError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ContainerUtilities.ContainerError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ContainerUtilities.ContainerError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ContainerUtilities.ContainerError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ContainerUtilities.ContainerError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContainerUtilities.ContainerError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ContainerUtilities.ContainerError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ContainerUtilities.ContainerError()
{
  return &type metadata for ContainerUtilities.ContainerError;
}

uint64_t sub_1000067F4(void *a1)
{
  sub_100004F34(a1, a1[3]);
  sub_100006FC0();
  uint64_t result = sub_100006ED0();
  if (result)
  {
    sub_100004F34(a1, a1[3]);
    sub_100006DD8();
    uint64_t result = sub_100006EE0();
    if (v3) {
      return sub_100007030();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1000068B0(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1000068B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_100006E30();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006E60();
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  os_log_type_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t result = sub_10000636C();
  if (v12)
  {
    sub_100006E40();
    swift_bridgeObjectRelease();
    uint64_t v22 = 0x7972617262694CLL;
    unint64_t v23 = 0xE700000000000000;
    uint64_t v13 = enum case for URL.DirectoryHint.isDirectory(_:);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
    v14(v4, enum case for URL.DirectoryHint.isDirectory(_:), v1);
    sub_100006D84();
    sub_100006E50();
    uint64_t v15 = *(void (**)(char *, uint64_t))(v2 + 8);
    v15(v4, v1);
    swift_bridgeObjectRelease();
    uint64_t v22 = 0x736568636143;
    unint64_t v23 = 0xE600000000000000;
    v14(v4, v13, v1);
    sub_100006E50();
    v15(v4, v1);
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v19 + 8);
    uint64_t v17 = v20;
    v16(v8, v20);
    return ((uint64_t (*)(char *, uint64_t))v16)(v10, v17);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100006B58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for UserIdentitySource.cache(_:);
  uint64_t v3 = sub_100006E70();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_100006BCC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Assembly()
{
  return self;
}

uint64_t sub_100006C04()
{
  sub_100006F20();
  sub_100007040();
  sub_100006F30();
  swift_release();
  swift_release();
  sub_100006F20();
  sub_100006F30();
  swift_release();
  swift_release();
  sub_100006F20();
  sub_100006E60();
  sub_100006E80();
  sub_100006F30();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100006F20();
  sub_100006E70();
  sub_100006F30();
  swift_release();
  return swift_release();
}

unint64_t sub_100006D84()
{
  unint64_t result = qword_10000C1D0;
  if (!qword_10000C1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1D0);
  }
  return result;
}

unint64_t sub_100006DD8()
{
  unint64_t result = qword_10000C1D8;
  if (!qword_10000C1D8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C1D8);
  }
  return result;
}

uint64_t sub_100006E30()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100006E40()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_100006E50()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100006E60()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006E70()
{
  return type metadata accessor for UserIdentitySource();
}

uint64_t sub_100006E80()
{
  return static URLs.SharedCacheDirectory.getter();
}

uint64_t sub_100006E90()
{
  return Assembly.init()();
}

uint64_t sub_100006EA0()
{
  return type metadata accessor for Assembly();
}

uint64_t sub_100006EB0()
{
  return dispatch thunk of ContextType.use<A>(_:for:)();
}

uint64_t sub_100006EC0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:with:)();
}

uint64_t sub_100006ED0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_100006EE0()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_100006EF0()
{
  return type metadata accessor for ContainerLock();
}

uint64_t sub_100006F00()
{
  return SingletonPool.init()();
}

uint64_t sub_100006F10()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_100006F20()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_100006F30()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_100006F40()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_100006F50()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:containerLock:)();
}

uint64_t sub_100006F60()
{
  return Container.resolver.getter();
}

uint64_t sub_100006F70()
{
  return type metadata accessor for Container();
}

uint64_t sub_100006F80()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006F90()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006FA0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006FB0()
{
  return XPCSession.debugDescription.getter();
}

uint64_t sub_100006FC0()
{
  return type metadata accessor for XPCSession();
}

uint64_t sub_100006FD0()
{
  return static XPCListener.InitializationOptions.none.getter();
}

uint64_t sub_100006FE0()
{
  return type metadata accessor for XPCListener.InitializationOptions();
}

uint64_t sub_100006FF0()
{
  return dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)();
}

uint64_t sub_100007000()
{
  return XPCListener.init(service:targetQueue:options:incomingSessionHandler:)();
}

uint64_t sub_100007010()
{
  return type metadata accessor for XPCListener();
}

uint64_t sub_100007020()
{
  return static PeerHandler.machService.getter();
}

uint64_t sub_100007030()
{
  return PeerHandler.init(session:stockService:)();
}

uint64_t sub_100007040()
{
  return type metadata accessor for PeerHandler();
}

uint64_t sub_100007050()
{
  return Assembly.init()();
}

uint64_t sub_100007060()
{
  return type metadata accessor for Assembly();
}

uint64_t sub_100007070()
{
  return String.init(cString:encoding:)();
}

uint64_t sub_100007080()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100007090()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_1000070A0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000070B0()
{
  return String.utf8CString.getter();
}

uint64_t sub_1000070C0()
{
  return String.append<A>(contentsOf:)();
}

void sub_1000070D0(Swift::String a1)
{
}

uint64_t sub_1000070E0()
{
  return String.init(cString:)();
}

Swift::Int sub_1000070F0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007100()
{
  return String.init<A>(_:)();
}

uint64_t sub_100007110()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007120()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007130()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100007140()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100007150()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100007160()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007170()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100007180(Swift::Int a1)
{
}

uint64_t sub_100007190()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000071A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000071B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000071C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000071D0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000071E0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_1000071F0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100007200()
{
  return Error._code.getter();
}

uint64_t sub_100007210()
{
  return Error._domain.getter();
}

uint64_t sub_100007220()
{
  return Error._userInfo.getter();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t container_copy_object()
{
  return _container_copy_object();
}

uint64_t container_copy_sandbox_token()
{
  return _container_copy_sandbox_token();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

void dispatch_main(void)
{
}

void exit(int a1)
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

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}