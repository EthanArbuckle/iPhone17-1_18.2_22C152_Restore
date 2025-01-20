uint64_t sub_1000052E4(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100005438();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005390()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

uint64_t sub_1000053E8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005438()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicFocusFiltersExtension()
{
  return &type metadata for MusicFocusFiltersExtension;
}

unint64_t sub_1000054A0()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_1000054F8()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

uint64_t sub_10000554C()
{
  uint64_t v0 = sub_10000725C();
  sub_1000070D8(v0, qword_10000C4C0);
  sub_100006FF0(v0, (uint64_t)qword_10000C4C0);
  return sub_10000724C();
}

uint64_t sub_1000055B0(uint64_t a1, uint64_t a2)
{
  v2[3] = a1;
  v2[4] = a2;
  uint64_t v3 = sub_10000729C();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  sub_1000072EC();
  v2[8] = sub_1000072DC();
  uint64_t v5 = sub_1000072CC();
  return _swift_task_switch(sub_1000056A4, v5, v4);
}

uint64_t sub_1000056A4()
{
  uint64_t v26 = v0;
  swift_release();
  sub_1000071BC();
  int v1 = *(unsigned __int8 *)(v0 + 72);
  if (v1 == 2)
  {
    id v2 = [self standardUserDefaults];
    [v2 setFocusModePrivateListeningEnabled:0];

    if (qword_10000C020 != -1) {
      swift_once();
    }
    sub_100006FF0(*(void *)(v0 + 40), (uint64_t)qword_10000C4D8);
    uint64_t v3 = sub_10000727C();
    os_log_type_t v4 = sub_1000072FC();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Privacy focus filter disabled.", v5, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    id v6 = [self standardUserDefaults];
    id v7 = [objc_allocWithZone((Class)NSNumber) initWithBool:(v1 & 1) == 0];
    [v6 setFocusModePrivateListeningEnabled:v7];

    if (qword_10000C020 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v8 = *(void *)(v0 + 56);
    uint64_t v10 = *(void *)(v0 + 40);
    uint64_t v11 = sub_100006FF0(v10, (uint64_t)qword_10000C4D8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    v12 = sub_10000727C();
    os_log_type_t v13 = sub_1000072FC();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = *(void *)(v0 + 48);
    uint64_t v16 = *(void *)(v0 + 56);
    uint64_t v17 = *(void *)(v0 + 40);
    if (v14)
    {
      uint64_t v24 = *(void *)(v0 + 56);
      v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)v18 = 136446210;
      uint64_t v25 = v19;
      if (v1) {
        uint64_t v20 = 1702195828;
      }
      else {
        uint64_t v20 = 0x65736C6166;
      }
      if (v1) {
        unint64_t v21 = 0xE400000000000000;
      }
      else {
        unint64_t v21 = 0xE500000000000000;
      }
      *(void *)(v0 + 16) = sub_100006670(v20, v21, &v25);
      sub_10000730C();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Privacy focus filter enabled, useListeningHistory = %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v24, v17);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v17);
    }
  }
  sub_1000071AC();
  swift_task_dealloc();
  v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_100005A5C()
{
  sub_1000065A8(&qword_10000C080);
  ((void (*)(void))__chkstk_darwin)();
  int v1 = &v18[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000065A8(&qword_10000C088);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_10000725C();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = &v18[-v10];
  __chkstk_darwin(v9);
  os_log_type_t v13 = &v18[-v12];
  sub_10000724C();
  sub_1000071BC();
  sub_10000724C();
  BOOL v14 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16);
  v14(v8, v13, v4);
  v14(v3, v11, v4);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  uint64_t v15 = sub_10000720C();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v1, 1, 1, v15);
  sub_10000721C();
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v16(v11, v4);
  return ((uint64_t (*)(unsigned char *, uint64_t))v16)(v13, v4);
}

uint64_t sub_100005D34()
{
  return FocusFilterAppContext.init(notificationFilterPredicate:)(0);
}

uint64_t sub_100005D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005DEC;
  return static SetFocusFilterIntent.suggestedFocusFilters(for:)(a1, a2, a3);
}

uint64_t sub_100005DEC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unint64_t sub_100005EEC()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100005F44()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

uint64_t sub_100005F98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005FB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006004@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C018 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000725C();
  uint64_t v3 = sub_100006FF0(v2, (uint64_t)qword_10000C4C0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000060AC()
{
  return 0;
}

uint64_t sub_1000060C0@<X0>(uint64_t a1@<X8>)
{
  sub_1000065A8(&qword_10000C088);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000725C();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_10000724C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  sub_1000071EC();
  uint64_t v6 = sub_1000071DC();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 0, 1, v6);
}

uint64_t sub_10000624C(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000062EC;
  return sub_1000055B0(a1, v4);
}

uint64_t sub_1000062EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  int v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000063E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100006CC8();
  *a1 = result;
  return result;
}

unint64_t sub_10000640C()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_100006460()
{
  return sub_100005A5C();
}

uint64_t sub_100006468(uint64_t a1)
{
  unint64_t v2 = sub_1000054A0();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000064A4(uint64_t a1)
{
  unint64_t v2 = sub_1000054F8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MusicPrivacyFocusFilter()
{
  return &type metadata for MusicPrivacyFocusFilter;
}

unint64_t sub_100006504()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    sub_100006560(&qword_10000C078);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_100006560(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000065A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000065EC()
{
  uint64_t v0 = sub_10000729C();
  sub_1000070D8(v0, qword_10000C4D8);
  sub_100006FF0(v0, (uint64_t)qword_10000C4D8);
  return sub_10000728C();
}

uint64_t sub_100006670(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006744(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007078((uint64_t)v12, *a3);
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
      sub_100007078((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007028((uint64_t)v12);
  return v7;
}

uint64_t sub_100006744(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000731C();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006900(a5, a6);
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
  uint64_t v8 = sub_10000733C();
  if (!v8)
  {
    sub_10000734C();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000735C();
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

uint64_t sub_100006900(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006998(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006B78(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006B78(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006998(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006B10(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000732C();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000734C();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000072AC();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000735C();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000734C();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006B10(uint64_t a1, uint64_t a2)
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
  sub_1000065A8((uint64_t *)&unk_10000C0B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006B78(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000065A8((uint64_t *)&unk_10000C0B0);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_10000735C();
  __break(1u);
  return result;
}

uint64_t sub_100006CC8()
{
  uint64_t v0 = sub_10000722C();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  unint64_t v3 = &v15[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000065A8(&qword_10000C090);
  __chkstk_darwin();
  size_t v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000065A8(&qword_10000C098);
  __chkstk_darwin();
  int64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000065A8(&qword_10000C088);
  __chkstk_darwin();
  int64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10000725C();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  sub_1000065A8(&qword_10000C0A0);
  sub_10000724C();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v15[15] = 2;
  uint64_t v12 = sub_1000072BC();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  uint64_t v13 = sub_10000719C();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return sub_1000071CC();
}

uint64_t sub_100006FF0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007028(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007078(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_1000070D8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000714C()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10000715C()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000716C()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10000719C()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000071AC()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000071BC()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000071CC()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000071DC()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_1000071EC()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_10000720C()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000721C()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10000722C()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10000724C()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10000725C()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10000726C()
{
  return static AppExtension.main()();
}

uint64_t sub_10000727C()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000728C()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000729C()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_1000072AC()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000072BC()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_1000072CC()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000072DC()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000072EC()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000072FC()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000730C()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000731C()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000732C()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000733C()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000734C()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000735C()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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