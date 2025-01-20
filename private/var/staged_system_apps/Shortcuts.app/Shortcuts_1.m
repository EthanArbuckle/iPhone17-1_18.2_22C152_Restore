uint64_t sub_1000A3380()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars8;

  v1 = *(void *)(type metadata accessor for AppShortcutChiclet(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(void *)(v1 + 64);
  v4 = type metadata accessor for AggregatedEntry();
  sub_10001C100(v4);
  v6 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000A19D4(v0 + v2, v6);
}

uint64_t sub_1000A342C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isLockedByAppProtection.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000A345C()
{
  return EnvironmentValues.isLockedByAppProtection.setter();
}

void *sub_1000A3488(void *a1, void *a2, uint64_t a3)
{
  v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    void *v4 = *a2;
    v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    v9 = (void *)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
    void *v9 = *(void *)((char *)a2 + v8);
    v9[1] = v11;
    id v12 = v7;
    swift_retain();
    swift_retain();
    uint64_t v13 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
    v14 = (char *)v9 + v13;
    v15 = &v10[v13];
    uint64_t v16 = type metadata accessor for AutoShortcutApp();
    if (sub_1000225EC((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_100025A08((uint64_t *)&unk_1000F8480);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
      sub_100021594((uint64_t)v14, 0, 1, v16);
    }
    *((unsigned char *)v4 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_1000A3608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v5 = v4 + *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v6 = type metadata accessor for AutoShortcutApp();
  uint64_t result = sub_1000225EC(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v8(v5, v6);
  }
  return result;
}

void *sub_1000A36C8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)((char *)a2 + v7 + 8);
  *uint64_t v8 = *(void *)((char *)a2 + v7);
  v8[1] = v10;
  id v11 = v6;
  swift_retain();
  swift_retain();
  uint64_t v12 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v13 = (char *)v8 + v12;
  v14 = &v9[v12];
  uint64_t v15 = type metadata accessor for AutoShortcutApp();
  if (sub_1000225EC((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    sub_100021594((uint64_t)v13, 0, 1, v15);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1000A37F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)a2[1];
  uint64_t v7 = (void *)a1[1];
  a1[1] = v6;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
  swift_retain();
  swift_release();
  *((void *)v10 + 1) = *((void *)v11 + 1);
  swift_retain();
  swift_release();
  uint64_t v12 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v13 = &v10[v12];
  v14 = &v11[v12];
  uint64_t v15 = type metadata accessor for AutoShortcutApp();
  int v16 = sub_1000225EC((uint64_t)v13, 1, v15);
  int v17 = sub_1000225EC((uint64_t)v14, 1, v15);
  if (!v16)
  {
    uint64_t v18 = *(void *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v19 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  sub_100021594((uint64_t)v13, 0, 1, v15);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_1000A39D0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  id v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  void *v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  uint64_t v10 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  id v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = type metadata accessor for AutoShortcutApp();
  if (sub_1000225EC((uint64_t)v12, 1, v13))
  {
    uint64_t v14 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    sub_100021594((uint64_t)v11, 0, 1, v13);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1000A3AE4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v12 = &v9[v11];
  uint64_t v13 = &v10[v11];
  uint64_t v14 = type metadata accessor for AutoShortcutApp();
  int v15 = sub_1000225EC((uint64_t)v12, 1, v14);
  int v16 = sub_1000225EC((uint64_t)v13, 1, v14);
  if (!v15)
  {
    uint64_t v17 = *(void *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v12, v13, v14);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v18 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  sub_100021594((uint64_t)v12, 0, 1, v14);
LABEL_7:
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000A3CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A3CB4);
}

uint64_t sub_1000A3CB4()
{
  sub_1000224E8();
  if (v1) {
    return sub_100020570(*(void *)(v0 + 8));
  }
  sub_100025A08(&qword_1000F7CA0);
  uint64_t v3 = sub_1000249FC();

  return sub_1000225EC(v3, v4, v5);
}

uint64_t sub_1000A3D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A3D34);
}

void sub_1000A3D34()
{
  sub_100025FC0();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    sub_100025A08(&qword_1000F7CA0);
    uint64_t v5 = sub_100022FD0(*(int *)(v4 + 20));
    sub_100021594(v5, v6, v7, v8);
  }
}

uint64_t type metadata accessor for AutoShortcutsAppGrid(uint64_t a1)
{
  return sub_10001C010(a1, (uint64_t *)&unk_1000F7D00);
}

void sub_1000A3DC4()
{
  sub_1000A3E64();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000A3E64()
{
  if (!qword_1000F7D10)
  {
    sub_10001E8D0((uint64_t *)&unk_1000F8480);
    unint64_t v0 = type metadata accessor for Binding();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000F7D10);
    }
  }
}

uint64_t sub_1000A3EC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000A3EDC@<X0>(uint64_t a1@<X8>)
{
  v22[2] = a1;
  v22[3] = type metadata accessor for AppListView(0);
  sub_10001C094();
  __chkstk_darwin(v2);
  uint64_t v4 = (void *)((char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22[1] = sub_100025A08(&qword_1000F7D48);
  sub_10001C094();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppGridView(0);
  sub_10001C094();
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (void *)((char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v22 - v13;
  int v15 = *(unsigned __int8 *)(v1 + *(int *)(type metadata accessor for AutoShortcutsAppGrid(0) + 24));
  id v16 = *(id *)(v1 + 8);
  uint64_t v17 = dispatch thunk of AutoShortcutsAppsDataSource.autoShortcutApps.getter();

  sub_100025A08(&qword_1000F7CA0);
  Binding.projectedValue.getter();
  if (v15 == 1)
  {
    *uint64_t v12 = v17;
    uint64_t v18 = (uint64_t *)((char *)v12 + *(int *)(v8 + 24));
    *uint64_t v18 = swift_getKeyPath();
    sub_100025A08(&qword_1000F7C98);
    swift_storeEnumTagMultiPayload();
    sub_1000A9364((uint64_t)v12, (uint64_t)v14, (void (*)(void))type metadata accessor for AppGridView);
    sub_1000A6080((uint64_t)v14, (uint64_t)v7, (void (*)(void))type metadata accessor for AppGridView);
    swift_storeEnumTagMultiPayload();
    sub_1000A42C0(&qword_1000F7D50, (void (*)(uint64_t))type metadata accessor for AppGridView);
    sub_1000A42C0(&qword_1000F7D58, (void (*)(uint64_t))type metadata accessor for AppListView);
    _ConditionalContent<>.init(storage:)();
    uint64_t v19 = type metadata accessor for AppGridView;
    uint64_t v20 = (uint64_t)v14;
  }
  else
  {
    uint64_t *v4 = v17;
    sub_1000A6080((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for AppListView);
    swift_storeEnumTagMultiPayload();
    sub_1000A42C0(&qword_1000F7D50, (void (*)(uint64_t))type metadata accessor for AppGridView);
    sub_1000A42C0(&qword_1000F7D58, (void (*)(uint64_t))type metadata accessor for AppListView);
    _ConditionalContent<>.init(storage:)();
    uint64_t v19 = type metadata accessor for AppListView;
    uint64_t v20 = (uint64_t)v4;
  }
  return sub_1000A60D4(v20, (void (*)(void))v19);
}

uint64_t type metadata accessor for AppListView(uint64_t a1)
{
  return sub_10001C010(a1, qword_1000F7DB8);
}

uint64_t type metadata accessor for AppGridView(uint64_t a1)
{
  return sub_10001C010(a1, (uint64_t *)&unk_1000F7E50);
}

uint64_t sub_1000A42C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000A4308@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_100025A08(&qword_1000F7EA8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000A455C();
  static HorizontalAlignment.leading.getter();
  uint64_t v20 = v1;
  int v21 = 0;
  sub_1000A42C0(&qword_1000F7EB0, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_100025A08(&qword_1000F7EB8);
  sub_1000A8B6C();
  LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
  char v8 = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 16))(a1, v7, v4);
  uint64_t v17 = a1 + *(int *)(sub_100025A08(&qword_1000F7EE0) + 36);
  *(unsigned char *)uint64_t v17 = v8;
  *(void *)(v17 + 8) = v10;
  *(void *)(v17 + 16) = v12;
  *(void *)(v17 + 24) = v14;
  *(void *)(v17 + 32) = v16;
  *(unsigned char *)(v17 + 40) = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000A455C()
{
  uint64_t v0 = type metadata accessor for GridItem.Size();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (long long *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = type metadata accessor for ContentSizeCategory();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  char v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  type metadata accessor for AppGridView(0);
  sub_1000A2A38((uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for ContentSizeCategory.accessibilityLarge(_:), v4);
  BOOL v11 = sub_1000A5B78((uint64_t)v10, (uint64_t)v8);
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  sub_100025A08(&qword_1000F7F38);
  type metadata accessor for GridItem();
  uint64_t v13 = swift_allocObject();
  if (v11)
  {
    *(_OWORD *)(v13 + 16) = xmmword_1000BAB00;
    *uint64_t v3 = xmmword_1000BEBB0;
    (*(void (**)(long long *, void, uint64_t))(v1 + 104))(v3, enum case for GridItem.Size.flexible(_:), v0);
  }
  else
  {
    *(_OWORD *)(v13 + 16) = xmmword_1000BABE0;
    long long v17 = xmmword_1000BEBB0;
    *uint64_t v3 = xmmword_1000BEBB0;
    uint64_t v14 = enum case for GridItem.Size.flexible(_:);
    uint64_t v15 = *(void (**)(long long *, uint64_t, uint64_t))(v1 + 104);
    v15(v3, enum case for GridItem.Size.flexible(_:), v0);
    GridItem.init(_:spacing:alignment:)();
    *uint64_t v3 = v17;
    v15(v3, v14, v0);
  }
  GridItem.init(_:spacing:alignment:)();
  return v13;
}

uint64_t sub_1000A48B0(void *a1)
{
  uint64_t v2 = type metadata accessor for AppGridView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  v11[5] = *a1;
  sub_1000A6080((uint64_t)a1, (uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for AppGridView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_1000A9364((uint64_t)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (void (*)(void))type metadata accessor for AppGridView);
  swift_bridgeObjectRetain();
  sub_100025A08(&qword_1000F7EE8);
  sub_100025A08(&qword_1000F7EF0);
  sub_10001E88C(&qword_1000F7EF8, &qword_1000F7EE8);
  uint64_t v7 = sub_10001E8D0(&qword_1000F7EC8);
  uint64_t v8 = sub_10001E88C(&qword_1000F7ED0, &qword_1000F7EC8);
  unint64_t v9 = sub_1000A8C54();
  v11[1] = v7;
  v11[2] = &type metadata for AppItemButtonStyle;
  v11[3] = v8;
  v11[4] = v9;
  swift_getOpaqueTypeConformance2();
  sub_1000A42C0(&qword_1000F7F00, (void (*)(uint64_t))&type metadata accessor for AutoShortcutApp);
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000A4B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = type metadata accessor for AutoShortcutApp();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AppGridView(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100025A08(&qword_1000F7EC8);
  uint64_t v26 = *(void *)(v13 - 8);
  uint64_t v27 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000A6080(a2, (uint64_t)v12, (void (*)(void))type metadata accessor for AppGridView);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v17 = (v11 + *(unsigned __int8 *)(v6 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = swift_allocObject();
  sub_1000A9364((uint64_t)v12, v18 + v16, (void (*)(void))type metadata accessor for AppGridView);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v18 + v17, v8, v5);
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  sub_100025A08(&qword_1000F7F08);
  uint64_t v19 = sub_10001E8D0(&qword_1000F7F10);
  uint64_t v20 = type metadata accessor for NavigationDestinationEntity();
  uint64_t v21 = sub_10001E88C(&qword_1000F7F18, &qword_1000F7F10);
  uint64_t v22 = sub_1000A42C0(&qword_1000F4678, (void (*)(uint64_t))type metadata accessor for NavigationDestinationEntity);
  uint64_t v31 = v19;
  uint64_t v32 = v20;
  uint64_t v33 = v21;
  uint64_t v34 = v22;
  swift_getOpaqueTypeConformance2();
  Button.init(action:label:)();
  sub_10001E88C(&qword_1000F7ED0, &qword_1000F7EC8);
  sub_1000A8C54();
  uint64_t v23 = v27;
  View.buttonStyle<A>(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v15, v23);
}

uint64_t sub_1000A4ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100025A08((uint64_t *)&unk_1000F8480);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = type metadata accessor for AutoShortcutApp();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, a2, v9);
  sub_100021594((uint64_t)v8, 0, 1, v9);
  type metadata accessor for AppGridView(0);
  sub_100010124((uint64_t)v8, (uint64_t)v6, (uint64_t *)&unk_1000F8480);
  sub_100025A08(&qword_1000F7CA0);
  Binding.wrappedValue.setter();
  return sub_1000A98A4((uint64_t)v8, (uint64_t *)&unk_1000F8480);
}

uint64_t sub_1000A5010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v20[0] = a3;
  uint64_t v5 = type metadata accessor for AppEntityVisualState();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NavigationDestinationEntity();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100025A08(&qword_1000F7F10);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v14 = static VerticalAlignment.center.getter();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v15 = sub_100025A08(&qword_1000F7F20);
  sub_1000A538C(a1, a2, (uint64_t)&v14[*(int *)(v15 + 44)]);
  uint64_t v16 = type metadata accessor for AutoShortcutApp();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v11, a1, v16);
  uint64_t v17 = enum case for RootNavigationDestination.autoShortcuts(_:);
  uint64_t v18 = type metadata accessor for RootNavigationDestination();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v11, v17, v18);
  v20[1] = _swiftEmptyArrayStorage;
  sub_1000A42C0(&qword_1000F61C0, (void (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
  sub_100025A08((uint64_t *)&unk_1000F8490);
  sub_10001E88C(&qword_1000F61C8, (uint64_t *)&unk_1000F8490);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_10001E88C(&qword_1000F7F18, &qword_1000F7F10);
  sub_1000A42C0(&qword_1000F4678, (void (*)(uint64_t))type metadata accessor for NavigationDestinationEntity);
  View.appEntity<A>(_:state:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000A60D4((uint64_t)v11, (void (*)(void))type metadata accessor for NavigationDestinationEntity);
  return sub_1000A98A4((uint64_t)v14, &qword_1000F7F10);
}

uint64_t sub_1000A538C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v64 = a1;
  uint64_t v61 = a3;
  uint64_t v60 = type metadata accessor for IconView.DisplayMode();
  uint64_t v3 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for IconSize();
  uint64_t v6 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v8 = (double *)((char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v59 = type metadata accessor for IconView();
  uint64_t v9 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100025A08(&qword_1000F7F28);
  uint64_t v13 = v12 - 8;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v62 = (uint64_t)&v56 - v17;
  sub_1000A90F4();
  AutoShortcutApp.bundleIdentifier.getter();
  sub_1000A9BB4();
  double v18 = sub_1000A58CC();
  double v19 = sub_1000A58CC();
  *uint64_t v8 = v18;
  v8[1] = v19;
  (*(void (**)(double *, void, uint64_t))(v6 + 104))(v8, enum case for IconSize.custom(_:), v58);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for IconView.DisplayMode.default(_:), v60);
  IconView.init(_:size:displayMode:animated:)();
  LOBYTE(v8) = static Edge.Set.leading.getter();
  EdgeInsets.init(_all:)();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = (uint64_t)v16;
  uint64_t v29 = v16;
  uint64_t v30 = v59;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v29, v11, v59);
  uint64_t v31 = v28 + *(int *)(v13 + 44);
  uint64_t v32 = v28;
  *(unsigned char *)uint64_t v31 = (_BYTE)v8;
  *(void *)(v31 + 8) = v21;
  *(void *)(v31 + 16) = v23;
  *(void *)(v31 + 24) = v25;
  *(void *)(v31 + 32) = v27;
  *(unsigned char *)(v31 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v30);
  uint64_t v33 = v62;
  sub_10001C4A0(v28, v62, &qword_1000F7F28);
  uint64_t v65 = AutoShortcutApp.localizedName.getter();
  uint64_t v66 = v34;
  sub_10002B2A0();
  uint64_t v35 = Text.init<A>(_:)();
  uint64_t v37 = v36;
  char v39 = v38 & 1;
  static Font.body.getter();
  uint64_t v40 = Text.font(_:)();
  uint64_t v42 = v41;
  LOBYTE(v5) = v43;
  uint64_t v64 = v44;
  swift_release();
  LOBYTE(v9) = v5 & 1;
  sub_100010C50(v35, v37, v39);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = swift_getKeyPath();
  uint64_t v48 = sub_1000A5A28();
  uint64_t v49 = swift_getKeyPath();
  uint64_t v57 = v32;
  sub_100010124(v33, v32, &qword_1000F7F28);
  uint64_t v50 = v32;
  uint64_t v51 = v61;
  sub_100010124(v50, v61, &qword_1000F7F28);
  uint64_t v52 = sub_100025A08(&qword_1000F7F30);
  uint64_t v53 = v51 + *(int *)(v52 + 48);
  *(void *)uint64_t v53 = v40;
  *(void *)(v53 + 8) = v42;
  *(unsigned char *)(v53 + 16) = v9;
  *(void *)(v53 + 24) = v64;
  *(void *)(v53 + 32) = KeyPath;
  *(unsigned char *)(v53 + 40) = 0;
  *(void *)(v53 + 48) = v46;
  *(unsigned char *)(v53 + 56) = 1;
  *(void *)(v53 + 64) = v47;
  *(void *)(v53 + 72) = 0x3FE8000000000000;
  *(void *)(v53 + 80) = v49;
  *(void *)(v53 + 88) = v48;
  *(unsigned char *)(v53 + 96) = 0;
  uint64_t v54 = v51 + *(int *)(v52 + 64);
  *(void *)uint64_t v54 = 0;
  *(unsigned char *)(v54 + 8) = 1;
  sub_10002CF58(v40, v42, v9);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000A98A4(v62, &qword_1000F7F28);
  sub_100010C50(v40, v42, v9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1000A98A4(v57, &qword_1000F7F28);
}

double sub_1000A58CC()
{
  uint64_t v0 = type metadata accessor for ContentSizeCategory();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  type metadata accessor for AppGridView(0);
  sub_1000A2A38((uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for ContentSizeCategory.accessibilityLarge(_:), v0);
  BOOL v7 = sub_1000A5B78((uint64_t)v6, (uint64_t)v4);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  double result = 40.0;
  if (v7) {
    return 80.0;
  }
  return result;
}

uint64_t sub_1000A5A28()
{
  uint64_t v0 = type metadata accessor for ContentSizeCategory();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  type metadata accessor for AppGridView(0);
  sub_1000A2A38((uint64_t)v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for ContentSizeCategory.accessibilityLarge(_:), v0);
  BOOL v7 = sub_1000A5B78((uint64_t)v6, (uint64_t)v4);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if (v7) {
    return 1;
  }
  else {
    return 2;
  }
}

BOOL sub_1000A5B78(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v3 = type metadata accessor for ContentSizeCategory();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  BOOL v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a2, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = enum case for ContentSizeCategory.extraSmall(_:);
  if (v12 != enum case for ContentSizeCategory.extraSmall(_:))
  {
    if (v12 == enum case for ContentSizeCategory.small(_:))
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == enum case for ContentSizeCategory.medium(_:))
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == enum case for ContentSizeCategory.large(_:)) {
      goto LABEL_7;
    }
    if (v12 == enum case for ContentSizeCategory.extraLarge(_:))
    {
      unint64_t v13 = 4;
    }
    else if (v12 == enum case for ContentSizeCategory.extraExtraLarge(_:))
    {
      unint64_t v13 = 5;
    }
    else if (v12 == enum case for ContentSizeCategory.extraExtraExtraLarge(_:))
    {
      unint64_t v13 = 6;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityMedium(_:))
    {
      unint64_t v13 = 7;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityLarge(_:))
    {
      unint64_t v13 = 8;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityExtraLarge(_:))
    {
      unint64_t v13 = 9;
    }
    else if (v12 == enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:))
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:))
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == enum case for ContentSizeCategory.small(_:))
  {
    unint64_t v16 = 1;
  }
  else if (v15 == enum case for ContentSizeCategory.medium(_:))
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != enum case for ContentSizeCategory.large(_:))
    {
      if (v15 == enum case for ContentSizeCategory.extraLarge(_:))
      {
        unint64_t v16 = 4;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.extraExtraLarge(_:))
      {
        unint64_t v16 = 5;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.extraExtraExtraLarge(_:))
      {
        unint64_t v16 = 6;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityMedium(_:))
      {
        unint64_t v16 = 7;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityLarge(_:))
      {
        unint64_t v16 = 8;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityExtraLarge(_:))
      {
        unint64_t v16 = 9;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:))
      {
        unint64_t v16 = 10;
        return v13 < v16;
      }
      if (v15 == enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:))
      {
        unint64_t v16 = 11;
        return v13 < v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 < v16;
}

uint64_t sub_1000A5F90()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_1000A5FB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContentSizeCategory();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_1000A6080(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10001C094();
  uint64_t v4 = sub_10001019C();
  v5(v4);
  return a2;
}

uint64_t sub_1000A60D4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10001C094();
  uint64_t v3 = sub_100022100();
  v4(v3);
  return a1;
}

uint64_t *sub_1000A6124(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    BOOL v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    void *v7 = *(uint64_t *)((char *)a2 + v6);
    v7[1] = v9;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v10 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
    uint64_t v11 = (char *)v7 + v10;
    int v12 = &v8[v10];
    uint64_t v13 = type metadata accessor for AutoShortcutApp();
    if (sub_1000225EC((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = sub_100025A08((uint64_t *)&unk_1000F8480);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      sub_100021594((uint64_t)v11, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t sub_1000A6280(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v5 = v4 + *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v6 = type metadata accessor for AutoShortcutApp();
  uint64_t result = sub_1000225EC(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v8(v5, v6);
  }
  return result;
}

void *sub_1000A6340(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
  *uint64_t v5 = *(void *)((char *)a2 + v4);
  v5[1] = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v8 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v9 = (char *)v5 + v8;
  uint64_t v10 = &v6[v8];
  uint64_t v11 = type metadata accessor for AutoShortcutApp();
  if (sub_1000225EC((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    sub_100021594((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

void *sub_1000A6454(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (void *)((char *)a2 + v6);
  *(void *)((char *)a1 + v6) = *v8;
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = v8[1];
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = type metadata accessor for AutoShortcutApp();
  int v13 = sub_1000225EC((uint64_t)v10, 1, v12);
  int v14 = sub_1000225EC((uint64_t)v11, 1, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  sub_100021594((uint64_t)v10, 0, 1, v12);
  return a1;
}

void *sub_1000A6614(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
  *uint64_t v5 = *(void *)((char *)a2 + v4);
  v5[1] = v7;
  uint64_t v8 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v9 = (char *)v5 + v8;
  uint64_t v10 = &v6[v8];
  uint64_t v11 = type metadata accessor for AutoShortcutApp();
  if (sub_1000225EC((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    sub_100021594((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

void *sub_1000A670C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (void *)((char *)a2 + v6);
  *(void *)((char *)a1 + v6) = *v8;
  swift_release();
  *((void *)v7 + 1) = v8[1];
  swift_release();
  uint64_t v9 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = type metadata accessor for AutoShortcutApp();
  int v13 = sub_1000225EC((uint64_t)v10, 1, v12);
  int v14 = sub_1000225EC((uint64_t)v11, 1, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  sub_100021594((uint64_t)v10, 0, 1, v12);
  return a1;
}

uint64_t sub_1000A68B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A68C8);
}

uint64_t sub_1000A68C8()
{
  sub_1000224E8();
  if (v1) {
    return sub_100020570(*v0);
  }
  sub_100025A08(&qword_1000F7CA0);
  uint64_t v3 = sub_1000249FC();

  return sub_1000225EC(v3, v4, v5);
}

uint64_t sub_1000A6934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A6948);
}

void sub_1000A6948()
{
  sub_100025FC0();
  if (v3)
  {
    *char v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    sub_100025A08(&qword_1000F7CA0);
    uint64_t v5 = sub_100022FD0(*(int *)(v4 + 20));
    sub_100021594(v5, v6, v7, v8);
  }
}

void sub_1000A69B8()
{
  sub_1000A3E64();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1000A6A54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    void *v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v12 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
    int v13 = (char *)v9 + v12;
    int v14 = &v10[v12];
    uint64_t v15 = type metadata accessor for AutoShortcutApp();
    if (sub_1000225EC((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = sub_100025A08((uint64_t *)&unk_1000F8480);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
      sub_100021594((uint64_t)v13, 0, 1, v15);
    }
    uint64_t v17 = *(int *)(a3 + 24);
    uint64_t v18 = (uint64_t *)((char *)a1 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    sub_100025A08(&qword_1000F7C98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = type metadata accessor for ContentSizeCategory();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000A6C58(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v5 = v4 + *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v6 = type metadata accessor for AutoShortcutApp();
  if (!sub_1000225EC(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  sub_100025A08(&qword_1000F7C98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for ContentSizeCategory();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1000A6D98(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  void *v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v10 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = type metadata accessor for AutoShortcutApp();
  if (sub_1000225EC((uint64_t)v12, 1, v13))
  {
    uint64_t v14 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    sub_100021594((uint64_t)v11, 0, 1, v13);
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  sub_100025A08(&qword_1000F7C98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = type metadata accessor for ContentSizeCategory();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1000A6F4C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = type metadata accessor for AutoShortcutApp();
  int v13 = sub_1000225EC((uint64_t)v10, 1, v12);
  int v14 = sub_1000225EC((uint64_t)v11, 1, v12);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      sub_100021594((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    uint64_t v16 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v10, v11, v12);
LABEL_7:
  if (a1 != a2)
  {
    uint64_t v17 = *(int *)(a3 + 24);
    uint64_t v18 = (void *)((char *)a1 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    sub_1000A98A4((uint64_t)a1 + v17, &qword_1000F7C98);
    sub_100025A08(&qword_1000F7C98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = type metadata accessor for ContentSizeCategory();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *uint64_t v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1000A71BC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  void *v7 = *(void *)((char *)a2 + v6);
  v7[1] = v9;
  uint64_t v10 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v11 = (char *)v7 + v10;
  uint64_t v12 = &v8[v10];
  uint64_t v13 = type metadata accessor for AutoShortcutApp();
  if (sub_1000225EC((uint64_t)v12, 1, v13))
  {
    uint64_t v14 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    sub_100021594((uint64_t)v11, 0, 1, v13);
  }
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100025A08(&qword_1000F7C98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = type metadata accessor for ContentSizeCategory();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  return a1;
}

void *sub_1000A7364(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  swift_release();
  uint64_t v9 = *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v10 = &v7[v9];
  uint64_t v11 = &v8[v9];
  uint64_t v12 = type metadata accessor for AutoShortcutApp();
  int v13 = sub_1000225EC((uint64_t)v10, 1, v12);
  int v14 = sub_1000225EC((uint64_t)v11, 1, v12);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      sub_100021594((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    uint64_t v16 = sub_100025A08((uint64_t *)&unk_1000F8480);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_7:
  if (a1 != a2)
  {
    uint64_t v17 = *(int *)(a3 + 24);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    sub_1000A98A4((uint64_t)a1 + v17, &qword_1000F7C98);
    uint64_t v20 = sub_100025A08(&qword_1000F7C98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = type metadata accessor for ContentSizeCategory();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000A75CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A75E0);
}

uint64_t sub_1000A75E0()
{
  sub_1000224E8();
  if (v3) {
    return sub_100020570(*v0);
  }
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  sub_100025A08(&qword_1000F7CA0);
  sub_1000222C8();
  if (*(_DWORD *)(v8 + 84) == v6)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(int *)(v5 + 20);
  }
  else
  {
    uint64_t v9 = sub_100025A08(&qword_1000F7DF0);
    uint64_t v10 = *(int *)(v5 + 24);
  }

  return sub_1000225EC((uint64_t)v0 + v10, v6, v9);
}

uint64_t sub_1000A7680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A7694);
}

void sub_1000A7694()
{
  sub_100025FC0();
  if (v4)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    sub_100025A08(&qword_1000F7CA0);
    sub_1000222C8();
    if (*(_DWORD *)(v7 + 84) == v6)
    {
      uint64_t v8 = *(int *)(v5 + 20);
    }
    else
    {
      sub_100025A08(&qword_1000F7DF0);
      uint64_t v8 = *(int *)(v5 + 24);
    }
    uint64_t v9 = sub_100022FD0(v8);
    sub_100021594(v9, v10, v11, v12);
  }
}

void sub_1000A7730()
{
  sub_1000A3E64();
  if (v0 <= 0x3F)
  {
    sub_1000A7808();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000A7808()
{
  if (!qword_1000F7E60)
  {
    type metadata accessor for ContentSizeCategory();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000F7E60);
    }
  }
}

unint64_t sub_1000A7864()
{
  unint64_t result = qword_1000F7E98;
  if (!qword_1000F7E98)
  {
    sub_10001E8D0(&qword_1000F7EA0);
    sub_1000A42C0(&qword_1000F7D50, (void (*)(uint64_t))type metadata accessor for AppGridView);
    sub_1000A42C0(&qword_1000F7D58, (void (*)(uint64_t))type metadata accessor for AppListView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7E98);
  }
  return result;
}

uint64_t sub_1000A7940()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000A7960@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100025A08(&qword_1000F7FB8);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100025A08((uint64_t *)&unk_1000F84D0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v13 = 0.5;
  }
  else {
    double v13 = 1.0;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v2);
  *(double *)&v9[*(int *)(v7 + 44)] = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = 0;
  if ((ButtonStyleConfiguration.isPressed.getter() & 1) == 0) {
    uint64_t v14 = static Animation.easeInOut(duration:)();
  }
  char v15 = ButtonStyleConfiguration.isPressed.getter();
  sub_100010124((uint64_t)v9, (uint64_t)v12, &qword_1000F7FB8);
  uint64_t v16 = &v12[*(int *)(v10 + 36)];
  *(void *)uint64_t v16 = v14;
  v16[8] = v15 & 1;
  sub_1000A98A4((uint64_t)v9, &qword_1000F7FB8);
  return sub_10001C4A0((uint64_t)v12, a1, (uint64_t *)&unk_1000F84D0);
}

uint64_t sub_1000A7B90()
{
  uint64_t v1 = type metadata accessor for AppListView(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  v11[5] = *v0;
  sub_1000A6080((uint64_t)v0, (uint64_t)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for AppListView);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_1000A9364((uint64_t)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (void (*)(void))type metadata accessor for AppListView);
  swift_bridgeObjectRetain();
  sub_100025A08(&qword_1000F7EE8);
  sub_100025A08(&qword_1000F7F40);
  sub_10001E88C(&qword_1000F7EF8, &qword_1000F7EE8);
  uint64_t v6 = sub_10001E8D0(&qword_1000F7F48);
  uint64_t v7 = type metadata accessor for NavigationDestinationEntity();
  unint64_t v8 = sub_1000A947C();
  uint64_t v9 = sub_1000A42C0(&qword_1000F4678, (void (*)(uint64_t))type metadata accessor for NavigationDestinationEntity);
  v11[1] = v6;
  v11[2] = v7;
  v11[3] = v8;
  v11[4] = v9;
  swift_getOpaqueTypeConformance2();
  sub_1000A42C0(&qword_1000F7F00, (void (*)(uint64_t))&type metadata accessor for AutoShortcutApp);
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000A7DFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v81 = a3;
  uint64_t v84 = type metadata accessor for AutoShortcutApp();
  uint64_t v4 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  uint64_t v60 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100025A08((uint64_t *)&unk_1000F8480);
  __chkstk_darwin(v6 - 8);
  v70 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AppEntityVisualState();
  uint64_t v79 = *(void *)(v8 - 8);
  uint64_t v80 = v8;
  __chkstk_darwin(v8);
  v78 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for NavigationDestinationEntity();
  __chkstk_darwin(v77);
  v71 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100025A08(&qword_1000F6AB8);
  __chkstk_darwin(v11 - 8);
  uint64_t v64 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100025A08(&qword_1000F6AC0);
  __chkstk_darwin(v13 - 8);
  char v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100025A08(&qword_1000F7F60);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  v68 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100025A08(&qword_1000F7F68);
  uint64_t v69 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100025A08(&qword_1000F7F78);
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100025A08(&qword_1000F7F48);
  __chkstk_darwin(v83);
  v82 = (char *)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100025A08(&qword_1000F7F40);
  uint64_t v73 = *(void *)(v24 - 8);
  uint64_t v74 = v24;
  __chkstk_darwin(v24);
  v72 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for RootNavigationDestination();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v57 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = v4;
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v59 = v4 + 16;
  uint64_t v58 = v30;
  v30(v29, a1, v84);
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v29, enum case for RootNavigationDestination.autoShortcuts(_:), v26);
  uint64_t v86 = a1;
  uint64_t v85 = a1;
  sub_100025A08(&qword_1000F7F80);
  sub_1000A962C();
  Label.init(title:icon:)();
  uint64_t v76 = a1;
  AutoShortcutApp.numberOfShortcuts(includeUserShortcuts:)(1);
  sub_10001E88C(&qword_1000F7F70, &qword_1000F7F68);
  uint64_t v63 = v22;
  uint64_t v31 = v65;
  View.badge(_:)();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v20, v31);
  uint64_t v32 = (uint64_t)v82;
  uint64_t v69 = v27;
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  uint64_t v62 = v29;
  v33(v15, v29, v26);
  sub_100021594((uint64_t)v15, 0, 1, v26);
  uint64_t v34 = *(int *)(v17 + 44);
  uint64_t v35 = (uint64_t)v68;
  sub_100010124((uint64_t)v15, (uint64_t)&v68[v34], &qword_1000F6AC0);
  uint64_t v36 = v66;
  uint64_t v37 = v22;
  uint64_t v38 = v67;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v35, v37, v67);
  sub_1000A98A4((uint64_t)v15, &qword_1000F6AC0);
  uint64_t v39 = (uint64_t)v64;
  v33(v64, v29, v26);
  sub_100021594(v39, 0, 1, v26);
  uint64_t v40 = sub_100025A08(&qword_1000F5130);
  sub_100021594(v39, 0, 1, v40);
  sub_100010124(v39, v32 + *(int *)(v83 + 36), &qword_1000F6AB8);
  sub_100010124(v35, v32, &qword_1000F7F60);
  uint64_t v41 = v39;
  uint64_t v42 = (uint64_t)v71;
  uint64_t v43 = v26;
  sub_1000A98A4(v41, &qword_1000F6AB8);
  uint64_t v44 = v84;
  sub_1000A98A4(v35, &qword_1000F7F60);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v63, v38);
  v45 = v62;
  ((void (*)(uint64_t))v33)(v42);
  type metadata accessor for AppListView(0);
  sub_100025A08(&qword_1000F7CA0);
  uint64_t v46 = (uint64_t)v70;
  Binding.wrappedValue.getter();
  if (sub_1000225EC(v46, 1, v44))
  {
    sub_1000A98A4(v46, (uint64_t *)&unk_1000F8480);
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
  }
  else
  {
    uint64_t v49 = v60;
    v58(v60, v46, v44);
    sub_1000A98A4(v46, (uint64_t *)&unk_1000F8480);
    uint64_t v47 = AutoShortcutApp.bundleIdentifier.getter();
    unint64_t v48 = v50;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v49, v44);
  }
  if (v47 != AutoShortcutApp.bundleIdentifier.getter() || v48 != v51) {
    _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v53 = v78;
  AppEntityVisualState.init(isSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:)();
  sub_1000A947C();
  sub_1000A42C0(&qword_1000F4678, (void (*)(uint64_t))type metadata accessor for NavigationDestinationEntity);
  uint64_t v54 = v72;
  uint64_t v55 = (uint64_t)v82;
  View.appEntity<A>(_:state:)();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v53, v80);
  sub_1000A60D4(v42, (void (*)(void))type metadata accessor for NavigationDestinationEntity);
  sub_1000A98A4(v55, &qword_1000F7F48);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v45, v43);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v73 + 32))(v81, v54, v74);
}

uint64_t sub_1000A882C@<X0>(uint64_t a1@<X8>)
{
  AutoShortcutApp.localizedName.getter();
  sub_10002B2A0();
  uint64_t result = Text.init<A>(_:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000A8888@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v21 = type metadata accessor for IconView.DisplayMode();
  uint64_t v1 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for IconSize();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (_OWORD *)((char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for IconView();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000A90F4();
  AutoShortcutApp.bundleIdentifier.getter();
  sub_1000A9BB4();
  __asm { FMOV            V0.2D, #29.0 }
  _OWORD *v7 = _Q0;
  (*(void (**)(_OWORD *, void, uint64_t))(v5 + 104))(v7, enum case for IconSize.custom(_:), v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for IconView.DisplayMode.default(_:), v21);
  IconView.init(_:size:displayMode:animated:)();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v17 = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v22, v11, v8);
  uint64_t v18 = (_OWORD *)(v17 + *(int *)(sub_100025A08(&qword_1000F7F80) + 36));
  long long v19 = v24;
  *uint64_t v18 = v23;
  v18[1] = v19;
  v18[2] = v25;
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000A8B48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000A8B64()
{
  return sub_1000A48B0(*(void **)(v0 + 16));
}

unint64_t sub_1000A8B6C()
{
  unint64_t result = qword_1000F7EC0;
  if (!qword_1000F7EC0)
  {
    sub_10001E8D0(&qword_1000F7EB8);
    sub_10001E8D0(&qword_1000F7EC8);
    sub_10001E88C(&qword_1000F7ED0, &qword_1000F7EC8);
    sub_1000A8C54();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7EC0);
  }
  return result;
}

unint64_t sub_1000A8C54()
{
  unint64_t result = qword_1000F7ED8;
  if (!qword_1000F7ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7ED8);
  }
  return result;
}

uint64_t sub_1000A8CA0()
{
  uint64_t v1 = type metadata accessor for AppGridView(0);
  sub_100026224();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v4 + *(int *)(v1 + 20);
  swift_release();
  swift_release();
  uint64_t v8 = v7 + *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v9 = type metadata accessor for AutoShortcutApp();
  if (!sub_1000225EC(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  sub_100025A08(&qword_1000F7C98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for ContentSizeCategory();
    sub_10001C094();
    uint64_t v10 = sub_100022100();
    v11(v10);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v4 + v6, v3 | 7);
}

uint64_t sub_1000A8E08(uint64_t a1)
{
  return sub_1000A93E4(a1, type metadata accessor for AppGridView, (uint64_t (*)(uint64_t, uint64_t))sub_1000A4B10);
}

uint64_t sub_1000A8E34()
{
  uint64_t v1 = type metadata accessor for AppGridView(0);
  sub_100026224();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v17 = *(void *)(v5 + 64);
  uint64_t v6 = type metadata accessor for AutoShortcutApp();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  swift_bridgeObjectRelease();
  uint64_t v10 = v0 + v4 + *(int *)(v1 + 20);
  swift_release();
  swift_release();
  uint64_t v11 = v10 + *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  if (!sub_1000225EC(v11, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v11, v6);
  }
  uint64_t v12 = v0 + v4 + *(int *)(v1 + 24);
  sub_100025A08(&qword_1000F7C98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for ContentSizeCategory();
    sub_10001C094();
    (*(void (**)(uint64_t))(v13 + 8))(v12);
  }
  else
  {
    swift_release();
  }
  uint64_t v14 = (v4 + v17 + v8) & ~v8;
  uint64_t v15 = v14 + v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v14, v6);

  return _swift_deallocObject(v0, v15, v3 | v8 | 7);
}

uint64_t sub_1000A9020()
{
  uint64_t v1 = *(void *)(type metadata accessor for AppGridView(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for AutoShortcutApp() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_1000A4ED4(v0 + v2, v5);
}

uint64_t sub_1000A90EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A5010(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_1000A90F4()
{
  unint64_t result = qword_1000F83D0;
  if (!qword_1000F83D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000F83D0);
  }
  return result;
}

uint64_t sub_1000A9134@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000A9160()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000A9188@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000A91B8()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_1000A91E0@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.minimumScaleFactor.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1000A920C()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000A923C()
{
  uint64_t v1 = (int *)(type metadata accessor for AppListView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[7];
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(sub_100025A08(&qword_1000F7CA0) + 32);
  uint64_t v7 = type metadata accessor for AutoShortcutApp();
  if (!sub_1000225EC(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000A9364(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_10001C094();
  uint64_t v4 = sub_10001C17C();
  v5(v4);
  return a2;
}

uint64_t sub_1000A93B8(uint64_t a1)
{
  return sub_1000A93E4(a1, type metadata accessor for AppListView, (uint64_t (*)(uint64_t, uint64_t))sub_1000A7DFC);
}

uint64_t sub_1000A93E4(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

unint64_t sub_1000A947C()
{
  unint64_t result = qword_1000F7F50;
  if (!qword_1000F7F50)
  {
    sub_10001E8D0(&qword_1000F7F48);
    sub_1000A951C();
    sub_10001E88C(&qword_1000F6A20, &qword_1000F6A28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7F50);
  }
  return result;
}

unint64_t sub_1000A951C()
{
  unint64_t result = qword_1000F7F58;
  if (!qword_1000F7F58)
  {
    sub_10001E8D0(&qword_1000F7F60);
    sub_10001E8D0(&qword_1000F7F68);
    sub_10001E88C(&qword_1000F7F70, &qword_1000F7F68);
    swift_getOpaqueTypeConformance2();
    sub_10001E88C(&qword_1000F6A10, &qword_1000F6A18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7F58);
  }
  return result;
}

uint64_t sub_1000A961C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A882C(a1);
}

uint64_t sub_1000A9624@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A8888(a1);
}

unint64_t sub_1000A962C()
{
  unint64_t result = qword_1000F7F88;
  if (!qword_1000F7F88)
  {
    sub_10001E8D0(&qword_1000F7F80);
    sub_1000A42C0(&qword_1000F7F90, (void (*)(uint64_t))&type metadata accessor for IconView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7F88);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppItemButtonStyle()
{
  return &type metadata for AppItemButtonStyle;
}

unint64_t sub_1000A96EC()
{
  unint64_t result = qword_1000F7F98;
  if (!qword_1000F7F98)
  {
    sub_10001E8D0(&qword_1000F7EE0);
    sub_10001E88C(&qword_1000F7FA0, &qword_1000F7EA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7F98);
  }
  return result;
}

unint64_t sub_1000A9790()
{
  unint64_t result = qword_1000F7FA8;
  if (!qword_1000F7FA8)
  {
    sub_10001E8D0(&qword_1000F7FB0);
    sub_10001E8D0(&qword_1000F7F48);
    type metadata accessor for NavigationDestinationEntity();
    sub_1000A947C();
    sub_1000A42C0(&qword_1000F4678, (void (*)(uint64_t))type metadata accessor for NavigationDestinationEntity);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7FA8);
  }
  return result;
}

uint64_t sub_1000A9888()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000A98A4(uint64_t a1, uint64_t *a2)
{
  sub_100025A08(a2);
  sub_10001C094();
  uint64_t v3 = sub_100022100();
  v4(v3);
  return a1;
}

unint64_t sub_1000A98F4()
{
  unint64_t result = qword_1000F7FC0;
  if (!qword_1000F7FC0)
  {
    sub_10001E8D0((uint64_t *)&unk_1000F84D0);
    sub_1000A9994();
    sub_10001E88C(&qword_1000F84F0, &qword_1000F6330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F7FC0);
  }
  return result;
}

unint64_t sub_1000A9994()
{
  unint64_t result = qword_1000F84E0;
  if (!qword_1000F84E0)
  {
    sub_10001E8D0(&qword_1000F7FB8);
    sub_1000A42C0(&qword_1000F7FC8, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F84E0);
  }
  return result;
}

uint64_t sub_1000A9A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1000AE560(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_1000A9A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1000AE560(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

uint64_t sub_1000A9ACC(uint64_t (*a1)(void))
{
  return a1();
}

id sub_1000A9AF4(void *a1, void *a2)
{
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithView:a1 parameters:a2];

  return v4;
}

uint64_t sub_1000A9B50()
{
  return EnvironmentValues.libraryMenuDataSource.getter();
}

uint64_t sub_1000A9B74(uint64_t a1)
{
  sub_100025DE8(a1, (uint64_t)v2, &qword_1000F78A8);
  return EnvironmentValues.libraryMenuDataSource.setter();
}

id sub_1000A9BB4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_100021F6C();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithBundleIdentifier:v1];

  return v2;
}

void sub_1000A9C24(uint64_t a1, void *a2, Swift::UInt a3)
{
  id v5 = a2;
  sub_10001685C();
  NSObject.hash(into:)();

  Hasher._combine(_:)(a3);
}

uint64_t sub_1000A9C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static NSObject.== infix(_:_:)() & (a2 == a4);
}

Swift::Int sub_1000A9CD8(void *a1, Swift::UInt a2)
{
  Hasher.init(_seed:)();
  id v4 = a1;
  NSObject.hash(into:)();

  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

Swift::Int sub_1000A9D38()
{
  return sub_1000A9CD8(*(void **)v0, *(void *)(v0 + 8));
}

void sub_1000A9D40(uint64_t a1)
{
  sub_1000A9C24(a1, *(void **)v1, *(void *)(v1 + 8));
}

Swift::Int sub_1000A9D48()
{
  id v2 = *(void **)v0;
  Swift::UInt v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  id v3 = v2;
  NSObject.hash(into:)();

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000A9DA8(uint64_t *a1, uint64_t *a2)
{
  return sub_1000A9C6C(*a1, a1[1], *a2, a2[1]);
}

id sub_1000A9DBC()
{
  uint64_t v1 = qword_1000F7FF0;
  id v2 = *(void **)(v0 + qword_1000F7FF0);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_1000F7FF0);
  }
  else
  {
    uint64_t v4 = v0;
    LibraryDataSource.database.getter();
    LibraryDataSource.shortcutMoveService.getter();
    sub_100021EF8();
    id v5 = objc_allocWithZone((Class)type metadata accessor for MoveToFolderCoordinator());
    uint64_t v6 = (void *)MoveToFolderCoordinator.init(database:service:)();
    if (swift_unknownObjectWeakLoadStrong()) {
      sub_10001D3D0(&qword_1000F8438, (void (*)(uint64_t))type metadata accessor for LibraryViewController);
    }
    dispatch thunk of MoveToFolderCoordinator.delegate.setter();
    id v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    id v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_1000A9EAC()
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    unsigned int v2 = [Strong isEditing];

    if (v2)
    {
      uint64_t v3 = swift_unknownObjectWeakLoadStrong();
      if (v3)
      {
        id v4 = (id)v3;
        sub_10000ADBC();
      }
    }
  }
}

uint64_t sub_1000A9F4C()
{
  type metadata accessor for LibraryDataSource();
  uint64_t v0 = (uint64_t (*)(void))method lookup function for LibraryDataSource();

  return v0();
}

void sub_1000A9F94(uint64_t a1)
{
  type metadata accessor for LibraryDataSource();
  unsigned int v2 = (void (*)(uint64_t))method lookup function for LibraryDataSource();
  v2(a1);

  sub_1000A9EAC();
}

void (*sub_1000A9FF4())(void *a1, char a2)
{
  uint64_t v1 = malloc(0x30uLL);
  sub_1000247BC((uint64_t)v1);
  unsigned int v2 = (uint64_t (*)(uint64_t))method lookup function for LibraryDataSource();
  *(void *)(v0 + 40) = v2(v0);
  return sub_1000AA06C;
}

void sub_1000AA06C(void *a1, char a2)
{
}

void sub_1000AA084()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    type metadata accessor for LibraryDataSource();
    unsigned int v2 = (uint64_t (*)(void))method lookup function for LibraryDataSource();
    [v1 setEditing:v2() & 1 animated:1];
  }

  sub_1000238D0();
}

void sub_1000AA114(uint64_t a1)
{
  type metadata accessor for LibraryDataSource();
  unsigned int v2 = (void (*)(uint64_t))method lookup function for LibraryDataSource();
  v2(a1);

  sub_1000AA084();
}

void (*sub_1000AA174())(void *a1, char a2)
{
  uint64_t v1 = malloc(0x30uLL);
  sub_1000247BC((uint64_t)v1);
  unsigned int v2 = (uint64_t (*)(uint64_t))method lookup function for LibraryDataSource();
  *(void *)(v0 + 40) = v2(v0);
  return sub_1000AA1EC;
}

void sub_1000AA1EC(void *a1, char a2)
{
}

void sub_1000AA204(void *a1, char a2, void (*a3)(uint64_t))
{
  id v5 = (void *)*a1;
  uint64_t v6 = (*(uint64_t (**)(void, void))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0) {
    a3(v6);
  }

  free(v5);
}

uint64_t sub_1000AA270()
{
  type metadata accessor for LibraryDataSource();
  uint64_t v0 = (void (*)(void))method lookup function for LibraryDataSource();
  v0();
  uint64_t v1 = LibraryLayoutMode.rawValue.getter();
  uint64_t v3 = v2;
  if (v1 == LibraryLayoutMode.rawValue.getter() && v3 == v4) {
    return swift_bridgeObjectRelease_n();
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    return sub_1000238D0(0, 0);
  }
  return result;
}

uint64_t sub_1000AA34C()
{
  type metadata accessor for LibraryDataSource();
  uint64_t v0 = (uint64_t (*)(void))method lookup function for LibraryDataSource();
  return v0() & 1;
}

uint64_t sub_1000AA38C(char a1)
{
  uint64_t v1 = a1 & 1;
  type metadata accessor for LibraryDataSource();
  uint64_t v2 = (void (*)(void))method lookup function for LibraryDataSource();
  v2();
  uint64_t v3 = (void (*)(uint64_t))method lookup function for LibraryDataSource();
  v3(v1);

  return sub_1000AA270();
}

uint64_t (*sub_1000AA424(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = type metadata accessor for LibraryDataSource();
  uint64_t v3 = (uint64_t (*)(void))method lookup function for LibraryDataSource();
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v3() & 1;
  return sub_1000AA49C;
}

uint64_t sub_1000AA49C(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 24);
  (*(void (**)(void))(a1 + 16))();
  uint64_t v2 = (void (*)(uint64_t))method lookup function for LibraryDataSource();
  v2(v1);
  return sub_1000AA270();
}

uint64_t sub_1000AA50C(uint64_t a1)
{
  return sub_1000AA7E0(a1, (uint64_t (*)(void))&ShortcutsLibraryItem.autoShortcut.getter);
}

void sub_1000AA524()
{
  sub_10002066C();
  uint64_t v24 = v3;
  type metadata accessor for LibrarySectionOptions.SectionType();
  sub_100022284();
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  __chkstk_darwin(v4);
  sub_10002A76C();
  sub_100022284();
  __chkstk_darwin(v6);
  sub_1000074A4();
  uint64_t v7 = sub_100025A08(&qword_1000F4B00);
  uint64_t v8 = sub_1000165CC(v7);
  __chkstk_darwin(v8);
  sub_1000242E0();
  uint64_t v9 = type metadata accessor for ShortcutsLibrarySection();
  sub_100022284();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_10001C0D0();
  IndexPath.section.getter();
  sub_100025884();
  if (sub_1000225EC(v1, 1, v9) == 1)
  {
    sub_100025E44(v1, &qword_1000F4B00);
    uint64_t v13 = type metadata accessor for AutoShortcutApp();
    uint64_t v14 = v24;
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v2, v1, v9);
    ShortcutsLibrarySection.options.getter();
    LibrarySectionOptions.sectionType.getter();
    sub_100024094();
    v16();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
    uint64_t v17 = sub_100024664();
    if (v18(v17) != enum case for LibrarySectionOptions.SectionType.appShortcuts(_:))
    {
      uint64_t v21 = type metadata accessor for AutoShortcutApp();
      sub_100021594(v24, 1, 1, v21);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v0, v23);
      goto LABEL_7;
    }
    (*(void (**)(uint64_t, uint64_t))(v22 + 96))(v0, v23);
    uint64_t v19 = type metadata accessor for AutoShortcutApp();
    sub_10001C094();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v24, v0, v19);
    uint64_t v14 = v24;
    uint64_t v15 = 0;
    uint64_t v13 = v19;
  }
  sub_100021594(v14, v15, 1, v13);
LABEL_7:
  sub_10001885C();
}

uint64_t sub_1000AA7C8(uint64_t a1)
{
  return sub_1000AA7E0(a1, (uint64_t (*)(void))&ShortcutsLibraryItem.workflow.getter);
}

uint64_t sub_1000AA7E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = sub_100025A08(&qword_1000F7690);
  uint64_t v5 = sub_1000165CC(v4);
  __chkstk_darwin(v5);
  sub_1000226F0();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v14 - v7;
  sub_100022110();
  sub_100025DE8((uint64_t)v8, v2, &qword_1000F7690);
  uint64_t v9 = type metadata accessor for ShortcutsLibraryItem();
  if (sub_1000225EC(v2, 1, v9) == 1)
  {
    sub_100025E44((uint64_t)v8, &qword_1000F7690);
    sub_100025E44(v2, &qword_1000F7690);
    return 0;
  }
  else
  {
    uint64_t v10 = a2();
    sub_100025E44((uint64_t)v8, &qword_1000F7690);
    uint64_t v11 = sub_10002A650();
    v12(v11);
  }
  return v10;
}

void sub_1000AA920()
{
  sub_10002066C();
  uint64_t v56 = v1;
  uint64_t v57 = v2;
  uint64_t v58 = type metadata accessor for ShortcutsLibraryItem.ItemType();
  sub_100022284();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100020554();
  type metadata accessor for ShortcutsLibraryItem();
  sub_100022284();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_1000167F4();
  uint64_t v9 = type metadata accessor for ShortcutsLibrarySection();
  sub_100022284();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_1000167F4();
  uint64_t v54 = v13;
  sub_100025A08(&qword_1000F5EC8);
  sub_100022284();
  __chkstk_darwin(v14);
  sub_1000242E0();
  dispatch thunk of LibraryDataSource.sortedSections.getter();
  uint64_t v15 = OrderedDictionary.values.getter();
  sub_100024094();
  v16();
  uint64_t v49 = *(void *)(v15 + 16);
  if (!v49)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v45 = type metadata accessor for IndexPath();
    sub_100027C14(v45);
    goto LABEL_21;
  }
  sub_100025C80();
  uint64_t v53 = v17 + v19;
  uint64_t v20 = (unsigned int (**)(id *, uint64_t))(v4 + 88);
  int v59 = enum case for ShortcutsLibraryItem.ItemType.workflow(_:);
  uint64_t v51 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  uint64_t v52 = v9;
  uint64_t v21 = v58;
  uint64_t v22 = v54;
  uint64_t v24 = v23;
  uint64_t v47 = v7;
  uint64_t v48 = v23;
  uint64_t v50 = v17;
  while (1)
  {
    if (v18 >= *(void *)(v17 + 16))
    {
      __break(1u);
      return;
    }
    unint64_t v55 = v18;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v24 + 16))(v22, v53 + *(void *)(v24 + 72) * v18, v9);
    uint64_t v25 = *(void *)(ShortcutsLibrarySection.items.getter() + 16);
    if (v25) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_17:
    uint64_t v9 = v52;
    sub_100016618();
    v44();
    unint64_t v18 = v55 + 1;
    uint64_t v24 = v48;
    uint64_t v17 = v50;
    if (v55 + 1 == v49) {
      goto LABEL_18;
    }
  }
  sub_100025C80();
  uint64_t v28 = v26 + v27;
  uint64_t v29 = *(void *)(v7 + 72);
  uint64_t v30 = *(void (**)(void))(v7 + 16);
  while (1)
  {
    sub_1000205E8();
    v30();
    ShortcutsLibraryItem.itemType.getter();
    if ((*v20)(v0, v21) != v59)
    {
      sub_100016618();
      v41();
      uint64_t v42 = sub_10002A650();
      v43(v42);
      goto LABEL_14;
    }
    uint64_t v31 = sub_10002A650();
    v32(v31);
    id v33 = *v0;
    id v34 = [*v0 identifier];
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v37 = v36;

    if (v35 == v56 && v37 == v57) {
      break;
    }
    char v39 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_20;
    }
    sub_100016618();
    v40();

    uint64_t v21 = v58;
LABEL_14:
    v28 += v29;
    if (!--v25)
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = v54;
      uint64_t v7 = v47;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  ShortcutsLibraryItem.id.getter();
  dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
  swift_bridgeObjectRelease();

  sub_100016618();
  v46();
  (*v51)(v54, v52);
LABEL_21:
  sub_10001885C();
}

uint64_t sub_1000AADBC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000AAE18()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000AB1B8();
    return swift_release();
  }
  return result;
}

void sub_1000AAE78()
{
  sub_10002066C();
  uint64_t v21 = type metadata accessor for LibrarySectionOptions.SectionType();
  sub_100022284();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10002A76C();
  sub_100022284();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_1000204E8();
  uint64_t v9 = *(void *)(dispatch thunk of LibraryDataSource.sections.getter() + 16);
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v7 + 16;
    sub_100025C80();
    uint64_t v14 = v12 + v13;
    uint64_t v19 = *(void *)(v11 + 56);
    uint64_t v20 = v15;
    uint64_t v16 = (void (**)(uint64_t, uint64_t))(v11 - 8);
    while (1)
    {
      v20(v1, v14, v5);
      LibrarySectionOptions.sectionType.getter();
      uint64_t v17 = LibrarySectionOptions.SectionType.count.getter();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v21);
      BOOL v18 = __OFADD__(v10, v17);
      v10 += v17;
      if (v18) {
        break;
      }
      (*v16)(v1, v5);
      v14 += v19;
      if (!--v9) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    sub_10001885C();
  }
}

uint64_t sub_1000AAFF4()
{
  sub_100025A08((uint64_t *)&unk_1000F83F0);
  sub_100022284();
  __chkstk_darwin(v0);
  sub_10002206C();
  dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
  ShortcutsLibrarySection.id.getter();
  uint64_t v1 = NSDiffableDataSourceSnapshot.numberOfItems(inSection:)();
  swift_bridgeObjectRelease();
  sub_1000AF260();
  v4(v2, v3);
  return v1;
}

uint64_t sub_1000AB0C8()
{
  sub_100025A08((uint64_t *)&unk_1000F83F0);
  sub_100022284();
  __chkstk_darwin(v0);
  sub_100021FC4();
  dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
  uint64_t v1 = NSDiffableDataSourceSnapshot.numberOfSections.getter();
  sub_100021F6C();
  sub_100024094();
  v2();
  return v1;
}

uint64_t sub_1000AB16C()
{
  if (*(uint64_t *)(v0 + qword_1000F7FD0) <= 0) {
    return *(unsigned __int8 *)(v0 + qword_1000F7FF8);
  }
  else {
    return 1;
  }
}

uint64_t sub_1000AB198(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + qword_1000F7FD0);
  BOOL v3 = __OFADD__(v2, result);
  uint64_t v4 = v2 + result;
  if (v3) {
    __break(1u);
  }
  else {
    *(void *)(v1 + qword_1000F7FD0) = v4;
  }
  return result;
}

void sub_1000AB1B8()
{
  type metadata accessor for AggregatedEntry();
  sub_100022284();
  __chkstk_darwin(v1);
  sub_100021FC4();
  sub_1000205E8();
  v2();
  uint64_t v3 = sub_100024664();
  int v5 = v4(v3);
  if (v5 == enum case for AggregatedEntry.userShortcut(_:))
  {
    uint64_t v6 = sub_10001512C();
    v7(v6);
    uint64_t v8 = *v0;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v10 = (void *)Strong;
      uint64_t v11 = swift_unknownObjectWeakLoadStrong();

      if (v11)
      {
        swift_getObjectType();
        sub_1000225D0();
        dispatch thunk of LibraryDelegate.run(_:from:input:requestOutput:runViewSource:completionHandler:)();
LABEL_9:

        swift_unknownObjectRelease();
        return;
      }
    }
LABEL_10:

    return;
  }
  if (v5 == enum case for AggregatedEntry.appShortcut(_:))
  {
    uint64_t v12 = sub_10001512C();
    v13(v12);
    uint64_t v8 = *v0;
    uint64_t v14 = swift_unknownObjectWeakLoadStrong();
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = swift_unknownObjectWeakLoadStrong();

      if (v16)
      {
        swift_getObjectType();
        dispatch thunk of LibraryDelegate.run(_:)();
        goto LABEL_9;
      }
    }
    goto LABEL_10;
  }
  _diagnoseUnexpectedEnumCase<A>(type:)();
  __break(1u);
}

void sub_1000AB374()
{
}

void sub_1000AB3A4()
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + qword_1000F7FF0);
}

uint64_t sub_1000AB404()
{
  uint64_t v0 = LibraryDataSource.deinit();

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1000AB46C()
{
  uint64_t v0 = sub_1000AB404();

  return _swift_deallocClassInstance(v0, 57, 7);
}

uint64_t sub_1000AB49C()
{
  return _s10DataSourceCMa(0);
}

uint64_t sub_1000AB4A4()
{
  uint64_t v0 = type metadata accessor for LibraryWorkflowCreationBehavior();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for LibrarySectionOptions();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v9 = (void *)result;
    ShortcutsLibrarySection.options.getter();
    LibrarySectionOptions.workflowCreationBehavior.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    type metadata accessor for LibraryViewController();
    sub_10001D3D0(&qword_1000F8470, (void (*)(uint64_t))type metadata accessor for LibraryViewController);
    LibraryOperations.createWorkflow(from:withBehavior:)();

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

void sub_1000AB6BC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();

    if (v2)
    {
      swift_getObjectType();
      dispatch thunk of LibraryDelegate.navigateToAutoShortcutApp(_:)();
      swift_unknownObjectRelease();
    }
  }
}

id sub_1000AB798(uint64_t a1)
{
  return sub_1000AB970(a1, _s17SectionHeaderViewCMa);
}

void sub_1000AB7B0(uint64_t a1, uint64_t a2)
{
  sub_100029C7C(0, (unint64_t *)&qword_1000F83D0);
  AutoShortcutApp.bundleIdentifier.getter();
  id v3 = sub_1000A9BB4();
  uint64_t v4 = AutoShortcutApp.localizedName.getter();
  uint64_t v6 = v5;
  id v7 = v3;
  sub_100012EB0(v4, v6, v3, 0, 0, a2);
  swift_bridgeObjectRelease();
}

id sub_1000AB8C4(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  v7.receiver = v3;
  v7.super_class = (Class)a3(a2);
  id v5 = [super initWithCoder:a1];

  return v5;
}

id sub_1000AB958(uint64_t a1)
{
  return sub_1000AB970(a1, _s21AppShortcutHeaderViewCMa);
}

id sub_1000AB970(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  [super dealloc];
}

id sub_1000AB9EC(uint64_t a1)
{
  return sub_1000AB970(a1, _s20LibrarySectionHeaderCMa);
}

void sub_1000ABA14()
{
  [*(id *)(v0+ OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView) setAttributedText:*(void *)(v0+ OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message)];

  sub_1000AC0F0();
}

void sub_1000ABA5C(void *a1)
{
}

void sub_1000ABA7C()
{
  id v1 = [v0 selectedBackgroundView];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 layer];

    [v3 setCornerRadius:*(double *)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius]];
  }
}

char *sub_1000ABB1C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView;
  id v10 = objc_allocWithZone((Class)UITextView);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  *(void *)&v11[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message] = 0;
  *(void *)&v11[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius] = 0;

  v44.receiver = v11;
  v44.super_class = (Class)_s16EmptySectionCellCMa();
  uint64_t v12 = (char *)[super initWithFrame:a1, a2, a3, a4];
  uint64_t v13 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView;
  uint64_t v14 = *(void **)&v12[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView];
  uint64_t v15 = v12;
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setAdjustsFontForContentSizeCategory:1];
  id v16 = [v15 contentView];
  [v16 addSubview:v14];

  id v43 = self;
  sub_100025A08(&qword_1000F5200);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1000BAC00;
  id v18 = [*(id *)&v12[v13] leadingAnchor];
  id v19 = [v15 contentView];
  id v20 = [v19 layoutMarginsGuide];

  id v21 = [v20 leadingAnchor];
  id v22 = [v18 constraintEqualToAnchor:v21];

  *(void *)(v17 + 32) = v22;
  id v23 = [*(id *)&v12[v13] trailingAnchor];
  id v24 = [v15 contentView];
  id v25 = [v24 layoutMarginsGuide];

  id v26 = [v25 trailingAnchor];
  id v27 = [v23 constraintEqualToAnchor:v26];

  *(void *)(v17 + 40) = v27;
  id v28 = [*(id *)&v12[v13] centerYAnchor];
  id v29 = [v15 contentView];
  id v30 = [v29 layoutMarginsGuide];

  id v31 = [v30 centerYAnchor];
  id v32 = [v28 constraintEqualToAnchor:v31];

  *(void *)(v17 + 48) = v32;
  specialized Array._endMutation()();
  sub_100029C7C(0, &qword_1000F53B8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v43 activateConstraints:isa];

  id v34 = *(void **)&v12[v13];
  [v34 setScrollEnabled:0];
  [v34 setEditable:0];
  id v35 = [v34 textContainer];
  [v35 setLineFragmentPadding:0.0];

  uint64_t v36 = *(void **)&v12[v13];
  [v36 setTextContainerInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  uint64_t v37 = self;
  id v38 = v36;
  id v39 = [v37 clearColor];
  [v38 setBackgroundColor:v39];

  sub_1000AC0F0();
  id v40 = [objc_allocWithZone((Class)UIView) init];
  id v41 = [v37 secondarySystemBackgroundColor];
  [v40 setBackgroundColor:v41];

  [v15 setSelectedBackgroundView:v40];
  return v15;
}

void sub_1000AC028()
{
  uint64_t v1 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UITextView) init];
  *(void *)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message] = 0;
  *(void *)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_1000AC0F0()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView);
  id v2 = [self secondaryLabelColor];
  [v1 setTextColor:v2];

  [v1 setTextAlignment:1];
  id v3 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  [v1 setFont:v3];
}

id sub_1000AC1C8()
{
  return sub_1000AB970(0, _s16EmptySectionCellCMa);
}

void sub_1000AC230(uint64_t a1)
{
  id v2 = *(void **)(v1
                + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView);
  *(void *)(v1
            + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView) = a1;
}

void sub_1000AC244()
{
  v12.receiver = v0;
  v12.super_class = (Class)_s10TopHitCellCMa();
  [super layoutSubviews];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v0 contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    [v2 setFrame:v5, v7, v9, v11];
  }
}

void sub_1000AC354()
{
  v3.receiver = v0;
  v3.super_class = (Class)_s10TopHitCellCMa();
  [super prepareForReuse];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView];
  if (v1)
  {
    id v2 = v1;
    [v2 removeFromSuperview];
    sub_1000AC230(0);
  }
}

void sub_1000AC40C(void *a1)
{
  id v3 = a1;
  sub_1000AC230((uint64_t)a1);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [v1 contentView];
  [v4 addSubview:v3];

  double v5 = self;
  sub_100025A08(&qword_1000F5200);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1000BB0D0;
  id v7 = [v3 leadingAnchor];
  id v8 = [v1 contentView];
  id v9 = [v8 leadingAnchor];

  id v10 = [v7 constraintEqualToAnchor:v9];
  *(void *)(v6 + 32) = v10;
  id v11 = [v3 trailingAnchor];
  id v12 = [v1 contentView];
  id v13 = [v12 trailingAnchor];

  id v14 = [v11 constraintEqualToAnchor:v13];
  *(void *)(v6 + 40) = v14;
  id v15 = [v3 topAnchor];
  id v16 = [v1 contentView];
  id v17 = [v16 topAnchor];

  id v18 = [v15 constraintEqualToAnchor:v17];
  *(void *)(v6 + 48) = v18;
  id v19 = [v3 bottomAnchor];
  id v20 = [v1 contentView];
  id v21 = [v20 bottomAnchor];

  id v22 = [v19 constraintEqualToAnchor:v21];
  *(void *)(v6 + 56) = v22;
  specialized Array._endMutation()();
  sub_100029C7C(0, &qword_1000F53B8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v5 activateConstraints:isa];
}

id sub_1000AC764(void *a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  *(void *)&v4[*a2] = 0;
  v8.receiver = v4;
  v8.super_class = (Class)a4(a3);
  [super initWithCoder:a1];

  return v6;
}

id sub_1000AC80C()
{
  return sub_1000AB970(0, _s10TopHitCellCMa);
}

uint64_t sub_1000AC838@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  double v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100025A08(&qword_1000F7FB8);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100025A08((uint64_t *)&unk_1000F84D0);
  __chkstk_darwin(v10);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v13 = 0.5;
  }
  else {
    double v13 = 1.0;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v2);
  *(double *)&v9[*(int *)(v7 + 44)] = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = 0;
  if ((ButtonStyleConfiguration.isPressed.getter() & 1) == 0) {
    uint64_t v14 = static Animation.easeInOut(duration:)();
  }
  char v15 = ButtonStyleConfiguration.isPressed.getter();
  sub_100025DE8((uint64_t)v9, (uint64_t)v12, &qword_1000F7FB8);
  id v16 = &v12[*(int *)(v10 + 36)];
  *(void *)id v16 = v14;
  v16[8] = v15 & 1;
  sub_100025E44((uint64_t)v9, &qword_1000F7FB8);
  return sub_10002382C((uint64_t)v12, a1, (uint64_t *)&unk_1000F84D0);
}

uint64_t sub_1000ACA68(uint64_t result)
{
  uint64_t v1 = *(void **)(result + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
  if (v1)
  {
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      swift_getObjectType();
      id v2 = v1;
      WorkflowOpener.openWorkflow(_:)();
      swift_unknownObjectRelease();

      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1000ACB78(uint64_t result)
{
  uint64_t v1 = *(void **)(result + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
  if (v1)
  {
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (!result) {
      return result;
    }
    swift_getObjectType();
    id v2 = v1;
    dispatch thunk of LibraryDelegate.run(_:)();
  }
  else
  {
    uint64_t v3 = *(void **)(result + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
    if (!v3) {
      return result;
    }
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (!result) {
      return result;
    }
    swift_getObjectType();
    id v2 = v3;
    sub_1000225D0();
    dispatch thunk of LibraryDelegate.run(_:from:input:requestOutput:runViewSource:completionHandler:)();
  }

  return swift_unknownObjectRelease();
}

uint64_t sub_1000ACC84()
{
  uint64_t v0 = sub_100025A08((uint64_t *)&unk_1000F70F0);
  uint64_t v1 = sub_1000165CC(v0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    swift_getObjectType();
    dispatch thunk of LibraryDelegate.runningWorkflow.getter();
    swift_unknownObjectRelease();
    type metadata accessor for RunningWorkflow();
    sub_1000215BC((uint64_t)v3);
    if (v5)
    {
      return sub_100025E44((uint64_t)v3, (uint64_t *)&unk_1000F70F0);
    }
    else
    {
      uint64_t v6 = (void (*)(uint64_t))RunningWorkflow.stop.getter();
      sub_100016618();
      uint64_t v8 = v7();
      v6(v8);
      return swift_release();
    }
  }
  return result;
}

void sub_1000ACDA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_10002066C();
  a19 = v21;
  a20 = v22;
  id v24 = v23;
  uint64_t v25 = sub_100025A08(&qword_1000F5120);
  uint64_t v26 = sub_1000165CC(v25);
  __chkstk_darwin(v26);
  sub_1000074A4();
  uint64_t v27 = type metadata accessor for IndexPath();
  sub_100022284();
  uint64_t v29 = v28;
  uint64_t v31 = __chkstk_darwin(v30);
  id v33 = (char *)&a9 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  id v35 = (char *)&a9 - v34;
  id v36 = sub_100026038();
  id v37 = [v36 indexPathForCell:v24];

  if (!v37)
  {
    sub_100021594(v20, 1, 1, v27);
    goto LABEL_6;
  }
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();

  id v38 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
  v38(v20, v33, v27);
  sub_100021594(v20, 0, 1, v27);
  sub_1000215BC(v20);
  if (v39)
  {
LABEL_6:
    sub_100025E44(v20, &qword_1000F5120);
    goto LABEL_9;
  }
  v38((uint64_t)v35, (char *)v20, v27);
  unsigned int v40 = [v24 isSelected];
  id v41 = sub_100026038();
  v42.super.Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  if (v40)
  {
    [v41 deselectItemAtIndexPath:v42.super.isa animated:1];

    id v43 = sub_100026038();
    sub_10009B1C0((uint64_t)v43, (uint64_t)v35);
  }
  else
  {
    [v41 selectItemAtIndexPath:v42.super.isa animated:1 scrollPosition:0];

    id v43 = sub_100026038();
    sub_10009B01C((uint64_t)v43, (uint64_t)v35);
  }

  (*(void (**)(char *, uint64_t))(v29 + 8))(v35, v27);
LABEL_9:
  sub_10001885C();
}

void *sub_1000ACFF8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  id v2 = v1;
  sub_100082718();
  uint64_t v4 = v3;

  return (void *)v4;
}

uint64_t sub_1000AD048()
{
  return 0;
}

uint64_t sub_1000AD050()
{
  return sub_1000AD048() & 1;
}

CGFloat sub_1000AD078()
{
  return sub_1000AD09C();
}

CGFloat sub_1000AD09C()
{
  return UIViewNoIntrinsicMetric;
}

id sub_1000AD0B0(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_1000AB8C4(a3, 0, type metadata accessor for LibraryCellHostingView);
}

id sub_1000AD0F0()
{
  return sub_1000AB970(0, (uint64_t (*)(void))type metadata accessor for LibraryCellHostingView);
}

uint64_t sub_1000AD10C()
{
  return type metadata accessor for LibraryCellHostingView(0);
}

void *sub_1000AD148()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
  id v2 = v1;
  return v1;
}

void *sub_1000AD208()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
  id v2 = v1;
  return v1;
}

void sub_1000AD294(uint64_t a1)
{
}

uint64_t sub_1000AD2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_associatedBundleId);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_1000AD2BC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      [v2 libraryCellDidRequestComposeUI:v1];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id sub_1000AD344(uint64_t a1, double a2)
{
  sub_100029C7C(0, &qword_1000F83C8);
  id v4 = sub_1000ADE18(0xD000000000000017, a1);
  [v4 setDuration:a2];
  sub_10002A6C0((uint64_t)v4);
  [v4 setBeginTime:v5 / a2];

  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100022510((uint64_t)isa, "setFromValue:");

  Class v7 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100022510((uint64_t)v7, "setToValue:");

  id v8 = objc_allocWithZone((Class)CAMediaTimingFunction);
  id v9 = v4;
  LODWORD(v10) = 1052266988;
  LODWORD(v11) = 1059145646;
  LODWORD(v12) = 1.0;
  id v13 = [v8 initWithControlPoints:v10 :0.0 :v11 :v12];
  sub_100022510((uint64_t)v13, "setTimingFunction:");

  LODWORD(v14) = 2139095040;
  [v9 setRepeatCount:v14];
  sub_100018A9C((uint64_t)[v9 setAutoreverses:1], "setRemovedOnCompletion:");
  return v9;
}

id sub_1000AD4A4()
{
  sub_100029C7C(0, &qword_1000F83C8);
  id v1 = sub_1000ADE18(0xD000000000000012, 0x80000001000C2EB0);
  [v1 setDuration:0.128];
  sub_10002A6C0((uint64_t)v1);
  [v1 setBeginTime:v2 / v0];

  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100022510((uint64_t)isa, "setFromValue:");

  Class v4 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100022510((uint64_t)v4, "setToValue:");

  id v5 = objc_allocWithZone((Class)CAMediaTimingFunction);
  id v6 = v1;
  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  id v10 = [v5 initWithControlPoints:v7 :0.0 :v8 :v9];
  sub_100022510((uint64_t)v10, "setTimingFunction:");

  LODWORD(v11) = 2139095040;
  [v6 setRepeatCount:v11];
  sub_100018A9C((uint64_t)[v6 setAutoreverses:1], "setRemovedOnCompletion:");
  return v6;
}

void sub_1000AD60C()
{
  uint64_t v2 = type metadata accessor for ShortcutChiclet.Model.Metrics();
  uint64_t v3 = sub_1000165CC(v2);
  __chkstk_darwin(v3);
  sub_10001899C();
  uint64_t v4 = sub_100025A08(&qword_1000F83A8);
  uint64_t v5 = sub_1000165CC(v4);
  __chkstk_darwin(v5);
  sub_100021FC4();
  *(void *)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_hostingView] = 0;
  uint64_t v6 = OBJC_IVAR____TtC9Shortcuts11LibraryCell_model;
  uint64_t v7 = type metadata accessor for ShortcutChiclet.ButtonType();
  sub_100021594(v1, 1, 1, v7);
  static ShortcutChiclet.Model.Metrics.default.getter();
  type metadata accessor for ShortcutChiclet.Model();
  sub_100018828();
  *(void *)&v0[v6] = sub_100018928();
  uint64_t v8 = OBJC_IVAR____TtC9Shortcuts11LibraryCell_progress;
  type metadata accessor for ShortcutChiclet.Progress();
  sub_100018828();
  *(void *)&v0[v8] = ShortcutChiclet.Progress.init()();
  *(void *)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_observation] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut] = 0;
  double v9 = &v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_associatedBundleId];
  void *v9 = 0;
  v9[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_isEnabled] = 0;
  v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_isJiggling] = 0;
  id v10 = &v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___run];
  void *v10 = 0;
  v10[1] = 0;
  double v11 = &v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___stop];
  *double v11 = 0;
  v11[1] = 0;
  double v12 = &v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___accessibilitySelect];
  *double v12 = 0;
  v12[1] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_1000AD83C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LibraryCell();
  [super prepareForReuse];
  sub_10002361C(1, 0);
  sub_10001D5A8(0);
  sub_1000AD2A0(0, 0);
  *((unsigned char *)v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_isJiggling) = 0;
  sub_10001D5D4();
  sub_1000AD294(0);
  return dispatch thunk of ShortcutChiclet.Model.reset()();
}

void *sub_1000AD908()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v1 = (void *)Strong;
  if (!swift_unknownObjectWeakLoadStrong())
  {

    return _swiftEmptyArrayStorage;
  }
  objc_super v2 = sub_1000ACFF8((uint64_t)v1);

  swift_unknownObjectRelease();
  return v2;
}

id sub_1000AD9A4()
{
  [v0 bounds];
  sub_100018DD0();
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics];
  if (v1)
  {
    id v2 = [v1 floatingViewConfiguration];
    [v2 cornerRadius];
  }
  uint64_t v3 = self;
  double v4 = sub_100018D60();
  id v7 = [v5 v6:v4];
  id v8 = [v7 CGPath];

  id v9 = [v3 bezierPathWithCGPath:v8];
  return v9;
}

void sub_1000ADAAC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_1000ACC84();

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_1000ADB28(uint64_t a1, void (*a2)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v4 = (void *)Strong;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v5 = sub_10001685C();
      a2(v5);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_1000ADC08(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for LibraryCell();
  [super setSelected:a1 & 1];
  return sub_1000ADC50();
}

uint64_t sub_1000ADC50()
{
  [v0 isSelected];
  return dispatch thunk of ShortcutChiclet.Model.isSelected.setter();
}

void sub_1000ADC8C(void *a1, char a2, double a3, double a4)
{
  id v7 = [a1 contentView];
  id v9 = v7;
  if (a2) {
    double v8 = a3;
  }
  else {
    double v8 = a4;
  }
  [v7 setAlpha:v8];
}

id sub_1000ADD04(uint64_t a1)
{
  return sub_1000AB970(a1, type metadata accessor for LibraryCell);
}

id sub_1000ADE18(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v3 = [(id)swift_getObjCClassFromMetadata() animationWithKeyPath:v2];

  return v3;
}

void sub_1000ADE88()
{
  sub_10002066C();
  uint64_t v2 = sub_100025A08(&qword_1000F8388);
  uint64_t v3 = sub_1000165CC(v2);
  __chkstk_darwin(v3);
  sub_100020554();
  uint64_t v19 = type metadata accessor for UIPointerEffect();
  sub_100022284();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100021FC4();
  id v7 = [objc_allocWithZone((Class)UIPreviewParameters) init];
  id v8 = sub_1000AD9A4();
  [v7 setVisiblePath:v8];

  sub_100029C7C(0, &qword_1000F8390);
  id v9 = v7;
  id v10 = sub_1000A9AF4(v0, v9);
  sub_100029C7C(0, &qword_1000F8398);
  double v11 = (int *)sub_100025A08(&qword_1000F83A0);
  double v12 = (char *)v1 + v11[12];
  uint64_t v13 = v11[16];
  uint64_t v14 = v11[20];
  *uint64_t v1 = v10;
  *((unsigned char *)v1 + v13) = 1;
  uint64_t v15 = enum case for UIPointerEffect.TintMode.overlay(_:);
  type metadata accessor for UIPointerEffect.TintMode();
  sub_10001C094();
  (*(void (**)(char *, uint64_t))(v16 + 104))(v12, v15);
  *((unsigned char *)v1 + v14) = 1;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v1, enum case for UIPointerEffect.hover(_:), v19);
  uint64_t v17 = type metadata accessor for UIPointerShape();
  sub_100027C14(v17);
  id v18 = v10;
  sub_100021F6C();
  UIPointerStyle.init(effect:shape:)();

  sub_10001885C();
}

void *_s20LibrarySectionHeaderC13SectionHeaderVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  uint64_t v7 = a1[5];
  a1[3] = a2[3];
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  if (v7)
  {
    if (v8)
    {
      uint64_t v9 = a2[6];
      a1[5] = v8;
      a1[6] = v9;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = a2[6];
    a1[5] = v8;
    a1[6] = v10;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
LABEL_8:
  uint64_t v11 = a2[7];
  if (!a1[7])
  {
    if (v11)
    {
      uint64_t v13 = a2[8];
      a1[7] = v11;
      a1[8] = v13;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v12 = a2[8];
  a1[7] = v11;
  a1[8] = v12;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s20LibrarySectionHeaderC13SectionHeaderVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v5;
    *(void *)(a1 + 48) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 56);
  if (!*(void *)(a1 + 56))
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v9;
      *(void *)(a1 + 64) = v11;
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v9)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  swift_release();
  return a1;
}

uint64_t _s20LibrarySectionHeaderC13SectionHeaderVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
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

uint64_t _s20LibrarySectionHeaderC13SectionHeaderVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *_s10DataSourceC13TopHitWrapperVwCP(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t _s10DataSourceC13TopHitWrapperVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t _s10DataSourceC13TopHitWrapperVwta(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

unint64_t sub_1000AE44C()
{
  unint64_t result = qword_1000F8298;
  if (!qword_1000F8298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000F8298);
  }
  return result;
}

uint64_t sub_1000AE49C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 56);
  if (v1) {
    return v1();
  }
  return result;
}

id sub_1000AE4CC(uint64_t a1, unsigned __int16 a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10005B5D0(a3, a4);
  }
  id v10 = [v4 initWithPaletteColor:a1 glyphCharacter:a2 customImageData:isa];

  return v10;
}

unint64_t sub_1000AE560(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000AE5D8(a1, a2, v4);
}

unint64_t sub_1000AE5D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000AE6BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000AE6E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000AE714()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000AE748()
{
  swift_bridgeObjectRelease();

  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  if (*(void *)(v0 + 72)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_1000AE7A8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 72);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_1000AE7D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100025DE8(*(void *)(v1 + 16), a1, &qword_1000F8310);
}

uint64_t sub_1000AE800()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000AE838()
{
  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000AE870()
{
  sub_1000ADC8C(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

void sub_1000AE880()
{
  sub_1000ADB28(v0, (void (*)(uint64_t))sub_1000ACDA4);
}

void sub_1000AE8B0()
{
}

void sub_1000AE8B8()
{
  sub_1000ADB28(v0, (void (*)(uint64_t))sub_1000ACB78);
}

void *sub_1000AE8E8()
{
  return sub_1000AD908();
}

void sub_1000AE8F0()
{
}

uint64_t sub_1000AE8F8(uint64_t result, double a2, double a3)
{
  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  double v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = swift_stdlib_random();
  if (v5 * ((double)0 * 1.11022302e-16) + a2 == a3) {
    return sub_1000AE8F8(v6, a2, a3);
  }
  return result;
}

void sub_1000AE9A4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  [a4 addAnimation:a1 forKey:v6];
}

id sub_1000AEA0C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 alpha];
  *a2 = v4;
  return result;
}

id sub_1000AEA40(double *a1, id *a2)
{
  return [*a2 setAlpha:*a1];
}

uint64_t sub_1000AEA54()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000AEA8C()
{
  return sub_1000AAE18();
}

uint64_t sub_1000AEAA4()
{
  return EnvironmentValues.libraryMenuDataSource.getter();
}

uint64_t sub_1000AEACC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

char *sub_1000AEB04(double a1, double a2, double a3, double a4, uint64_t a5, char *a6)
{
  uint64_t v10 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_hostingView;
  BOOL v11 = *(void **)&a6[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_hostingView];
  if (v11
    || (id v12 = objc_allocWithZone((Class)sub_100025A08(&qword_1000F8478)),
        swift_unknownObjectRetain(),
        uint64_t v13 = _UIHostingView.init(rootView:)(),
        BOOL v14 = *(void **)&a6[v10],
        *(void *)&a6[v10] = v13,
        v14,
        (BOOL v11 = *(void **)&a6[v10]) != 0))
  {
    Class v15 = v11;
    id v16 = [(objc_class *)v15 superview];

    if (!v16)
    {
      sub_100018A9C(v17, "setTranslatesAutoresizingMaskIntoConstraints:");
      [a6 addSubview:v15];
      sub_100025A08(&qword_1000F5200);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1000BB0D0;
      id v19 = [a6 leadingAnchor];
      id v20 = [(objc_class *)v15 leadingAnchor];
      id v21 = [v19 constraintEqualToAnchor:v20 constant:-a2];

      *(void *)(v18 + 32) = v21;
      id v22 = [a6 topAnchor];
      id v23 = [(objc_class *)v15 topAnchor];
      id v24 = [v22 constraintEqualToAnchor:v23 constant:-a1];

      *(void *)(v18 + 40) = v24;
      id v25 = [a6 trailingAnchor];
      id v26 = [(objc_class *)v15 trailingAnchor];
      uint64_t v27 = (void *)sub_100022FE0();
      id v29 = [v27 v28:a4];

      *(void *)(v18 + 48) = v29;
      id v30 = [a6 bottomAnchor];
      id v31 = [(objc_class *)v15 bottomAnchor];
      uint64_t v32 = (void *)sub_100022FE0();
      id v34 = [v32 v33:a3];

      *(void *)(v18 + 56) = v34;
      specialized Array._endMutation()();
      sub_100029C7C(0, &qword_1000F53B8);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [a6 addConstraints:isa];

      Class v15 = isa;
    }
  }

  return a6;
}

uint64_t sub_1000AEE10()
{
  return sub_1000AEE6C((void (*)(void))&type metadata accessor for AutoShortcutApp);
}

uint64_t sub_1000AEE28()
{
  return sub_1000AEF40((uint64_t (*)(void))&type metadata accessor for AutoShortcutApp, (uint64_t (*)(uint64_t, uint64_t))sub_1000AB6BC);
}

uint64_t sub_1000AEE54()
{
  return sub_1000AEE6C((void (*)(void))&type metadata accessor for ShortcutsLibrarySection);
}

uint64_t sub_1000AEE6C(void (*a1)(void))
{
  a1(0);
  sub_100022284();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = ((v6 + 24) & ~v6) + *(void *)(v5 + 64);
  uint64_t v8 = v6 | 7;
  swift_release();
  sub_1000AF260();
  v9();

  return _swift_deallocObject(v1, v7, v8);
}

uint64_t sub_1000AEF14()
{
  return sub_1000AEF40((uint64_t (*)(void))&type metadata accessor for ShortcutsLibrarySection, (uint64_t (*)(uint64_t, uint64_t))sub_1000AB4A4);
}

uint64_t sub_1000AEF40(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a2(v4, v5);
}

void sub_1000AEFC0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for AppEntityVisualState();
  __chkstk_darwin(v8);
  id v9 = a1;
  sub_1000AD294((uint64_t)a1);
  swift_bridgeObjectRetain();
  sub_1000AD2A0(a2, a3);
  id v10 = a4;
  sub_10001D5B4(a4);
  uint64_t v11 = swift_unknownObjectRetain();
  sub_10001D4C8(v11, (uint64_t)&off_1000E7B40);
  id v12 = [v9 id];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10001D3D0(&qword_1000F61C0, (void (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
  sub_100025A08((uint64_t *)&unk_1000F8490);
  sub_10001E88C(&qword_1000F61C8, (uint64_t *)&unk_1000F8490);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for AppShortcutEntity();
  objc_allocWithZone((Class)type metadata accessor for AppEntityViewAnnotation());
  sub_10001D3D0(&qword_1000F7BC8, (void (*)(uint64_t))&type metadata accessor for AppShortcutEntity);
  uint64_t v13 = (void *)AppEntityViewAnnotation.init<A>(entityType:identifier:state:)();
  UIView.annotate(with:)();
  sub_100020F3C();
}

uint64_t sub_1000AF1FC()
{
  return sub_10001E88C(&qword_1000F84B8, (uint64_t *)&unk_1000F84C0);
}

uint64_t sub_1000AF238()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_1000AF26C(void *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip;
  sub_100021F8C();
  sub_100009CE8(v3, (uint64_t)&v14);
  if (v15)
  {
    sub_100014B80(&v14, (uint64_t)v16);
    uint64_t v4 = v17;
    uint64_t v5 = v18;
    uint64_t v6 = sub_10002A498(v16, v17);
    if (a1)
    {
      uint64_t v7 = (uint64_t)v6;
      sub_100031104();
      sub_1000AF724(v7, v4, v5, v8, v9, v10, v11);
    }
    sub_1000149BC((uint64_t)v16);
  }
  else
  {
    sub_100023268((uint64_t)&v14, &qword_1000F7920);
    id v12 = a1;
  }
  return a1;
}

uint64_t sub_1000AF334()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tipStatusObservation))
  {
    swift_retain();
    Task.cancel()();
    swift_release();
  }

  return sub_10002BB14(0);
}

uint64_t sub_1000AF3A8()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1000AF3C0()
{
  (*(void (**)(void, void))(v0[20] + 8))(v0[22], v0[19]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1000AF4A4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  double v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  double v10 = (char *)&v18 - v9;
  if (a1)
  {
    static WFLog.subscript.getter();
    double v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v11, v12))
    {
      long long v14 = &selRef_addObjectObserver_;
      goto LABEL_9;
    }
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Tip should display, requests dataSource reload", v13, 2u);
    long long v14 = &selRef_addObjectObserver_;
  }
  else
  {
    static WFLog.subscript.getter();
    double v11 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v11, v15))
    {
      long long v14 = &selRef_removeObjectObserver_;
      double v10 = v8;
      goto LABEL_9;
    }
    id v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v15, "Tip should disappear, requests dataSource reload", v16, 2u);
    long long v14 = &selRef_removeObjectObserver_;
    double v10 = v8;
  }
  swift_slowDealloc();
LABEL_9:

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  [*(id *)(v2 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_database) *v14 v2];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  onMainThreadInlineOrAsync(closure:)();
  return swift_release_n();
}

char *sub_1000AF724(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v12 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView;
  uint64_t v13 = *(void **)(v7 + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView);
  if (v13) {
    goto LABEL_3;
  }
  v42[3] = a2;
  v42[4] = a3;
  id v16 = sub_10002A4E4(v42);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v16, a1, a2);
  id v17 = objc_allocWithZone((Class)type metadata accessor for TipUIView());
  uint64_t v18 = TipUIView.init(_:arrowEdge:actionHandler:)();
  id v19 = *(void **)&v41[v12];
  *(void *)&v41[v12] = v18;

  uint64_t v13 = *(void **)&v41[v12];
  if (v13)
  {
LABEL_3:
    Class v20 = v13;
    id v21 = [(objc_class *)v20 superview];

    if (!v21)
    {
      [v41 addSubview:v20];
      sub_100025A08(&qword_1000F5200);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1000BB0D0;
      id v23 = [v41 leadingAnchor];
      id v24 = [(objc_class *)v20 leadingAnchor];
      id v25 = [v23 constraintEqualToAnchor:v24 constant:-a5];

      *(void *)(v22 + 32) = v25;
      id v26 = [v41 topAnchor];
      id v27 = [(objc_class *)v20 topAnchor];
      id v28 = [v26 constraintEqualToAnchor:v27 constant:-a4];

      *(void *)(v22 + 40) = v28;
      id v29 = [v41 trailingAnchor];
      id v30 = [(objc_class *)v20 trailingAnchor];
      id v31 = (void *)sub_100022FE0();
      id v33 = [v31 v32:a7];

      *(void *)(v22 + 48) = v33;
      id v34 = [v41 bottomAnchor];
      id v35 = [(objc_class *)v20 bottomAnchor];
      id v36 = (void *)sub_100022FE0();
      id v38 = [v36 v37:a6];

      *(void *)(v22 + 56) = v38;
      v42[0] = v22;
      specialized Array._endMutation()();
      sub_100029C7C(0, &qword_1000F53B8);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v41 addConstraints:isa];

      Class v20 = isa;
    }
  }

  return v41;
}

uint64_t sub_1000AFA68()
{
  uint64_t v1 = type metadata accessor for TipController.UseSiriToRunShortcutTip();
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v11 - v5 + 16;
  uint64_t v7 = v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip;
  sub_100021F8C();
  sub_100009CE8(v7, (uint64_t)v13);
  if (v14)
  {
    sub_100009CE8((uint64_t)v13, (uint64_t)v12);
    sub_100025A08(&qword_1000F8530);
    if (swift_dynamicCast())
    {
      sub_1000B002C((uint64_t)v6, (uint64_t)v4);
      sub_1000469B0();
      v11[3] = v1;
      v11[4] = sub_1000B0090(&qword_1000F53C8, (void (*)(uint64_t))type metadata accessor for TipController.UseSiriToRunShortcutTip);
      double v8 = sub_10002A4E4(v11);
      sub_1000B00D8((uint64_t)v4, (uint64_t)v8);
      swift_beginAccess();
      sub_10002D4D4((uint64_t)v11, v7);
      swift_endAccess();
      sub_1000B013C((uint64_t)v4);
    }
    sub_1000149BC((uint64_t)v12);
  }
  return sub_100023268((uint64_t)v13, &qword_1000F7920);
}

void sub_1000AFD40()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    type metadata accessor for LibraryViewController();
    sub_1000B0090((unint64_t *)&unk_1000F7850, (void (*)(uint64_t))type metadata accessor for LibraryViewController);
    LibraryView.reload(animated:)(1);
  }
}

void sub_1000AFDE0()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  [super prepareForReuse];
  uint64_t v1 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView];
  if (v2)
  {
    [v2 removeFromSuperview];
    uint64_t v3 = *(void **)&v0[v1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)&v0[v1] = 0;
}

id sub_1000AFE98(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView] = 0;
  *(void *)&v4[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_layoutConstraints] = _swiftEmptyArrayStorage;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return [super initWithFrame:a1 a2:a2 a3:a3 a4:a4];
}

id sub_1000AFF44(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView] = 0;
  *(void *)&v1[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_layoutConstraints] = _swiftEmptyArrayStorage;
  v6.receiver = v1;
  v6.super_class = ObjectType;
  id v4 = [super initWithCoder:a1];

  return v4;
}

uint64_t sub_1000B002C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipController.UseSiriToRunShortcutTip();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B0090(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000B00D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipController.UseSiriToRunShortcutTip();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B013C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TipController.UseSiriToRunShortcutTip();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000B0198()
{
  swift_unknownObjectRelease();
  sub_1000149BC(v0 + 32);

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_1000B01E0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000B0218()
{
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1000B06FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = +[NSFileAccessIntent readingIntentWithURL:*(void *)(a1 + 40) options:0];
  id v17 = v5;
  objc_super v6 = +[NSArray arrayWithObjects:&v17 count:1];
  uint64_t v7 = +[NSOperationQueue mainQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B08CC;
  v12[3] = &unk_1000E7EE0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  double v10 = *(void **)(a1 + 56);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v10;
  id v16 = v3;
  id v11 = v3;
  [v4 coordinateAccessWithIntents:v6 queue:v7 byAccessor:v12];
}

void sub_1000B0858(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v6 = v3;
    unsigned __int8 v5 = [v3 wf_isUserCancelledError];
    uint64_t v4 = v6;
    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 32) showAlertWithError:v6];
      uint64_t v4 = v6;
    }
  }
}

id sub_1000B08C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) showAlertWithError:a2];
}

void sub_1000B08CC(uint64_t a1)
{
  uint64_t v2 = +[WFFileRepresentation fileWithURL:*(void *)(a1 + 32) options:0];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B09A4;
  v7[3] = &unk_1000E7EB8;
  id v10 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 openFile:v2 sourceApplication:v4 completionHandler:v7];
}

void sub_1000B09A4(uint64_t a1, void *a2)
{
  id v5 = a2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  id v3 = v5;
  if (v5)
  {
    unsigned __int8 v4 = [v5 wf_isUserCancelledError];
    id v3 = v5;
    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 40) showAlertWithError:v5];
      id v3 = v5;
    }
  }
}

void sub_1000B0C88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B0D60;
  v11[3] = &unk_1000E7E68;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

void sub_1000B0D60(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) rootViewController];
    uint64_t v3 = *(void *)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000B0E4C;
    v5[3] = &unk_1000E7E40;
    id v6 = *(id *)(a1 + 56);
    [v2 importShortcutFileWithResult:v3 options:1 completion:v5];
  }
  else if (*(void *)(a1 + 48))
  {
    unsigned __int8 v4 = *(void **)(a1 + 40);
    [v4 showAlertWithError:];
  }
}

uint64_t sub_1000B0E4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000B0F3C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) showAlertWithError:a2];
}

id sub_1000B13C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) showAlertWithError:a2];
}

void sub_1000B13CC(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    unsigned __int8 v4 = *(void **)(a1 + 32);
    id v5 = a3;
    id v6 = a2;
    id v7 = [v4 rootViewController];
    [v7 runWorkflowFromState:v6 source:v5];
  }
}

void sub_1000B1450(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = objc_opt_new();
  id v5 = *(id *)(a1 + 32);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 statusBarManager];

  [v4 setPreferredStatusBarStyle:[v8 statusBarStyle]];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1000B1720;
  id v25 = sub_1000B1730;
  id v26 = objc_alloc_init((Class)UIWindow);
  [(id)v22[5] setWindowLevel:UIWindowLevelAlert];
  [(id)v22[5] makeKeyAndVisible];
  [(id)v22[5] setRootViewController:v4];
  id v9 = +[WFActionRegistry sharedRegistry];
  id v10 = [v3 actionIdentifier];
  id v11 = [v3 serializedParameters];
  uint64_t v12 = [v9 createActionWithIdentifier:v10 serializedParameters:v11];
  uint64_t v13 = (void *)qword_1000FEDB0;
  qword_1000FEDB0 = v12;

  [(id)qword_1000FEDB0 willBeAddedToWorkflow:0];
  [(id)qword_1000FEDB0 wasAddedToWorkflow:0];
  id v14 = (void *)qword_1000FEDB0;
  id v15 = [v3 processedParameters];
  [v14 setProcessedParameters:v15];

  id v16 = (void *)qword_1000FEDB0;
  id v17 = [v3 input];
  uint64_t v18 = WFUserInterfaceFromViewController();
  id v19 = &_dispatch_main_q;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_1000B1738;
  v20[3] = &unk_1000E7DF0;
  v20[4] = *(void *)(a1 + 40);
  v20[5] = &v21;
  [v16 runWithInput:v17 userInterface:v18 runningDelegate:0 variableSource:0 workQueue:&_dispatch_main_q completionHandler:v20];

  _Block_object_dispose(&v21, 8);
}

void sub_1000B1708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000B1720(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000B1730(uint64_t a1)
{
}

void sub_1000B1738(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5 && (objc_msgSend(v5, "wf_isUserCancelledError") & 1) == 0) {
    [*(id *)(a1 + 32) showAlertWithError:v6];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHidden:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  id v9 = (void *)qword_1000FEDB0;
  qword_1000FEDB0 = 0;
}

uint64_t sub_1000B27A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void sub_1000B27BC(uint64_t a1, void *a2)
{
  uint64_t v3 = WFHandoffSourceKey;
  id v4 = a2;
  uint64_t v5 = [v4 objectForKey:v3];
  id v6 = (void *)v5;
  uint64_t v7 = (void *)WFWorkflowRunSourceHandoff;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = [v4 objectForKey:WFHandoffWorkflowControllerStateKey];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000B30F8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 parameters];
  id v4 = [v3 objectForKey:@"type"];
  uint64_t v5 = [v3 objectForKey:@"webpageURL"];
  id v6 = [v3 objectForKey:@"userInfoURL"];
  uint64_t v7 = +[NSURL URLWithString:v6];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B3240;
  v12[3] = &unk_1000E7F30;
  id v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v9;
  id v13 = v4;
  id v10 = v5;
  id v11 = v4;
  [v8 deserializeUserInfoAtURL:v7 completionHandler:v12];
}

uint64_t sub_1000B3240(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

void sub_1000B3564(id a1, NSString *a2, NSURL *a3, NSDictionary *a4)
{
  id v6 = a4;
  uint64_t v7 = a3;
  id v8 = a2;
  id v12 = +[WFWindowSceneManager mainScene];
  id v9 = [v12 delegate];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  [v11 scene:v12 handleUserActivityWithType:v8 webpageURL:v7 userInfo:v6 interaction:0];
}

id sub_1000B3654(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = sub_10002491C();
  id v6 = [v5 localizedStringForKey:v4 value:v3 table:0];

  return v6;
}

uint64_t static _AssistantIntentsProvider.uniqueEntities.getter()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t AppEntityVisualState.init(isSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:)()
{
  return AppEntityVisualState.init(isSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:)();
}

uint64_t type metadata accessor for AppEntityVisualState()
{
  return type metadata accessor for AppEntityVisualState();
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t IntentFile.fileURL.getter()
{
  return IntentFile.fileURL.getter();
}

uint64_t type metadata accessor for IntentFile()
{
  return type metadata accessor for IntentFile();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<A>(opensIntent:)()
{
  return static IntentResult.result<A>(opensIntent:)();
}

uint64_t static IntentResult.result<A, B>(value:opensIntent:)()
{
  return static IntentResult.result<A, B>(value:opensIntent:)();
}

uint64_t static IntentResult.result<A>(value:)()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IndexedEntity.attributeSet.getter()
{
  return IndexedEntity.attributeSet.getter();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:query:)();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:supportedTypeIdentifiers:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:supportedTypeIdentifiers:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t _AssistantIntent.IntentProjection.subscript.getter()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t type metadata accessor for _AssistantIntent.PhraseToken()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.StringValueBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.StringValueBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t _AssistantIntent.Value.init<A>(for:builder:)()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t type metadata accessor for _AssistantIntent.Value()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t _AssistantIntent.Phrase.init(stringLiteral:)()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t _AssistantIntent.Phrase.init(stringInterpolation:)()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t static _AssistantIntent.Builder.buildBlock(_:)()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.Builder.buildExpression(_:)()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t type metadata accessor for _AssistantIntent()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t type metadata accessor for IntentDescription()
{
  return type metadata accessor for IntentDescription();
}

uint64_t IntentDescription.init(_:categoryName:searchKeywords:)()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t DisplayRepresentation.Image.init(data:isTemplate:)()
{
  return DisplayRepresentation.Image.init(data:isTemplate:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)();
}

uint64_t static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)();
}

uint64_t IntentParameterSummary.init(_:table:)()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall ParameterSummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t ParameterSummaryString.init(stringInterpolation:)()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static ParameterSummaryBuilder.buildBlock<A>(_:)()
{
  return static ParameterSummaryBuilder.buildBlock<A>(_:)();
}

uint64_t static ParameterSummaryBuilder.buildExpression<A>(_:)()
{
  return static ParameterSummaryBuilder.buildExpression<A>(_:)();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t static ParameterSummaryCaseBuilder.buildBlock<A, B>(_:_:)()
{
  return static ParameterSummaryCaseBuilder.buildBlock<A, B>(_:_:)();
}

uint64_t static ParameterSummaryCaseBuilder.buildExpression<A>(_:)()
{
  return static ParameterSummaryCaseBuilder.buildExpression<A>(_:)();
}

uint64_t ParameterSummaryCaseCondition.init(_:_:)()
{
  return ParameterSummaryCaseCondition.init(_:_:)();
}

uint64_t ParameterSummaryDefaultCaseCondition.init(_:)()
{
  return ParameterSummaryDefaultCaseCondition.init(_:)();
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_NotEqual<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_NotEqual<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t LocalizedStringResource.init(stringInterpolation:)()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::Void __swiftcall URL.stopAccessingSecurityScopedResource()()
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return URL.startAccessingSecurityScopedResource()();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for IndexSet.Index()
{
  return type metadata accessor for IndexSet.Index();
}

void __swiftcall IndexSet._bridgeToObjectiveC()(NSIndexSet *__return_ptr retstr)
{
}

Swift::tuple_inserted_Bool_memberAfterInsert_Int __swiftcall IndexSet.insert(_:)(Swift::Int a1)
{
  char v1 = IndexSet.insert(_:)(a1);
  result.memberAfterInsert = v2;
  result.inserted = v1;
  return result;
}

uint64_t IndexSet.init()()
{
  return IndexSet.init()();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(item:section:)()
{
  return IndexPath.init(item:section:)();
}

uint64_t IndexPath.item.getter()
{
  return IndexPath.item.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t OpenWorkflowOptions.onOpen.getter()
{
  return OpenWorkflowOptions.onOpen.getter();
}

uint64_t OpenWorkflowOptions.isNewWorkflow.getter()
{
  return OpenWorkflowOptions.isNewWorkflow.getter();
}

uint64_t OpenWorkflowOptions.ActionError.init(actionIndex:message:)()
{
  return OpenWorkflowOptions.ActionError.init(actionIndex:message:)();
}

uint64_t OpenWorkflowOptions.ActionError.actionIndex.getter()
{
  return OpenWorkflowOptions.ActionError.actionIndex.getter();
}

uint64_t OpenWorkflowOptions.ActionError.message.getter()
{
  return OpenWorkflowOptions.ActionError.message.getter();
}

uint64_t type metadata accessor for OpenWorkflowOptions.ActionError()
{
  return type metadata accessor for OpenWorkflowOptions.ActionError();
}

uint64_t OpenWorkflowOptions.actionError.getter()
{
  return OpenWorkflowOptions.actionError.getter();
}

uint64_t OpenWorkflowOptions.showIconPicker.getter()
{
  return OpenWorkflowOptions.showIconPicker.getter();
}

uint64_t OpenWorkflowOptions.init(scrolledToActionIndex:actionError:isNewWorkflow:showIconPicker:onOpen:)()
{
  return OpenWorkflowOptions.init(scrolledToActionIndex:actionError:isNewWorkflow:showIconPicker:onOpen:)();
}

uint64_t OpenWorkflowOptions.scrolledToActionIndex.getter()
{
  return OpenWorkflowOptions.scrolledToActionIndex.getter();
}

uint64_t type metadata accessor for OpenWorkflowOptions()
{
  return type metadata accessor for OpenWorkflowOptions();
}

uint64_t static LibraryWorkflowCreationBehavior.== infix(_:_:)()
{
  return static LibraryWorkflowCreationBehavior.== infix(_:_:)();
}

uint64_t type metadata accessor for LibraryWorkflowCreationBehavior()
{
  return type metadata accessor for LibraryWorkflowCreationBehavior();
}

uint64_t type metadata accessor for RunningWorkflow.WorkflowType()
{
  return type metadata accessor for RunningWorkflow.WorkflowType();
}

uint64_t RunningWorkflow.workflowType.getter()
{
  return RunningWorkflow.workflowType.getter();
}

uint64_t RunningWorkflow.runViewSource.getter()
{
  return RunningWorkflow.runViewSource.getter();
}

uint64_t RunningWorkflow.matchesReference(_:)()
{
  return RunningWorkflow.matchesReference(_:)();
}

uint64_t RunningWorkflow.stop.getter()
{
  return RunningWorkflow.stop.getter();
}

uint64_t RunningWorkflow.progress.getter()
{
  return RunningWorkflow.progress.getter();
}

uint64_t type metadata accessor for RunningWorkflow()
{
  return type metadata accessor for RunningWorkflow();
}

uint64_t WorkflowConflictViewController.init(conflict:)()
{
  return WorkflowConflictViewController.init(conflict:)();
}

uint64_t dispatch thunk of WorkflowConflictViewController.delegate.setter()
{
  return dispatch thunk of WorkflowConflictViewController.delegate.setter();
}

uint64_t type metadata accessor for WorkflowConflictViewController()
{
  return type metadata accessor for WorkflowConflictViewController();
}

uint64_t WorkflowOpener.openWorkflow(_:)()
{
  return WorkflowOpener.openWorkflow(_:)();
}

uint64_t dispatch thunk of EditorView.performScrollingTest(named:)()
{
  return dispatch thunk of EditorView.performScrollingTest(named:)();
}

uint64_t GalleryView.init(destination:)()
{
  return GalleryView.init(destination:)();
}

uint64_t type metadata accessor for GalleryView()
{
  return type metadata accessor for GalleryView();
}

uint64_t LibraryMenu.init(tableItems:)()
{
  return LibraryMenu.init(tableItems:)();
}

uint64_t LibraryMenu.init(entry:)()
{
  return LibraryMenu.init(entry:)();
}

uint64_t type metadata accessor for LibraryMenu()
{
  return type metadata accessor for LibraryMenu();
}

Swift::Void __swiftcall LibraryView.observeChanges(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall LibraryView.reload(animated:)(Swift::Bool animated)
{
}

uint64_t dispatch thunk of LibraryGroup.sections.getter()
{
  return dispatch thunk of LibraryGroup.sections.getter();
}

uint64_t NameIconView.init(item:dataSource:)()
{
  return NameIconView.init(item:dataSource:)();
}

uint64_t dispatch thunk of NameIconView.Model.popoverModel.getter()
{
  return dispatch thunk of NameIconView.Model.popoverModel.getter();
}

uint64_t dispatch thunk of NameIconView.Model.progress.getter()
{
  return dispatch thunk of NameIconView.Model.progress.getter();
}

uint64_t type metadata accessor for NameIconView.Model()
{
  return type metadata accessor for NameIconView.Model();
}

uint64_t dispatch thunk of PopoverModel.displaySharingPrompt(_:)()
{
  return dispatch thunk of PopoverModel.displaySharingPrompt(_:)();
}

uint64_t static SidebarStyle.== infix(_:_:)()
{
  return static SidebarStyle.== infix(_:_:)();
}

uint64_t type metadata accessor for SidebarStyle()
{
  return type metadata accessor for SidebarStyle();
}

uint64_t static GlyphRegistry.shared.getter()
{
  return static GlyphRegistry.shared.getter();
}

uint64_t type metadata accessor for GlyphRegistry()
{
  return type metadata accessor for GlyphRegistry();
}

uint64_t dispatch thunk of SidebarSection.destinations.getter()
{
  return dispatch thunk of SidebarSection.destinations.getter();
}

uint64_t dispatch thunk of SidebarSection.shouldDisplay.getter()
{
  return dispatch thunk of SidebarSection.shouldDisplay.getter();
}

uint64_t dispatch thunk of SidebarSection.observeChanges.setter()
{
  return dispatch thunk of SidebarSection.observeChanges.setter();
}

uint64_t dispatch thunk of SidebarSection.id.getter()
{
  return dispatch thunk of SidebarSection.id.getter();
}

uint64_t dispatch thunk of SidebarSection.name.getter()
{
  return dispatch thunk of SidebarSection.name.getter();
}

uint64_t dispatch thunk of LibraryDelegate.runningWorkflow.getter()
{
  return dispatch thunk of LibraryDelegate.runningWorkflow.getter();
}

uint64_t dispatch thunk of LibraryDelegate.renameObject(_:)()
{
  return dispatch thunk of LibraryDelegate.renameObject(_:)();
}

uint64_t dispatch thunk of LibraryDelegate.deleteCollections(_:alertCustomizationBlock:completion:)()
{
  return dispatch thunk of LibraryDelegate.deleteCollections(_:alertCustomizationBlock:completion:)();
}

uint64_t dispatch thunk of LibraryDelegate.presentFolderEditor(_:)()
{
  return dispatch thunk of LibraryDelegate.presentFolderEditor(_:)();
}

uint64_t dispatch thunk of LibraryDelegate.navigateToAutoShortcutApp(_:)()
{
  return dispatch thunk of LibraryDelegate.navigateToAutoShortcutApp(_:)();
}

uint64_t dispatch thunk of LibraryDelegate.isPresentingViewController.getter()
{
  return dispatch thunk of LibraryDelegate.isPresentingViewController.getter();
}

uint64_t dispatch thunk of LibraryDelegate.run(_:from:input:requestOutput:runViewSource:completionHandler:)()
{
  return dispatch thunk of LibraryDelegate.run(_:from:input:requestOutput:runViewSource:completionHandler:)();
}

uint64_t dispatch thunk of LibraryDelegate.run(_:)()
{
  return dispatch thunk of LibraryDelegate.run(_:)();
}

uint64_t type metadata accessor for LibraryMenuItem.ItemVariant()
{
  return type metadata accessor for LibraryMenuItem.ItemVariant();
}

uint64_t static LibraryMenuItem.Attributes.destructive.getter()
{
  return static LibraryMenuItem.Attributes.destructive.getter();
}

uint64_t static LibraryMenuItem.Attributes.hidden.getter()
{
  return static LibraryMenuItem.Attributes.hidden.getter();
}

uint64_t static LibraryMenuItem.Attributes.disabled.getter()
{
  return static LibraryMenuItem.Attributes.disabled.getter();
}

uint64_t type metadata accessor for LibraryMenuItem.Attributes()
{
  return type metadata accessor for LibraryMenuItem.Attributes();
}

uint64_t LibraryMenuItem.attributes.getter()
{
  return LibraryMenuItem.attributes.getter();
}

uint64_t LibraryMenuItem.symbolName.getter()
{
  return LibraryMenuItem.symbolName.getter();
}

uint64_t dispatch thunk of LibraryMenuItem.ToggleModel.isSelected.modify()
{
  return dispatch thunk of LibraryMenuItem.ToggleModel.isSelected.modify();
}

uint64_t dispatch thunk of LibraryMenuItem.ToggleModel.isSelected.getter()
{
  return dispatch thunk of LibraryMenuItem.ToggleModel.isSelected.getter();
}

uint64_t LibraryMenuItem.hasSeparator.getter()
{
  return LibraryMenuItem.hasSeparator.getter();
}

uint64_t LibraryMenuItem.init(title:symbolName:attributes:hasSeparator:variant:)()
{
  return LibraryMenuItem.init(title:symbolName:attributes:hasSeparator:variant:)();
}

uint64_t LibraryMenuItem.title.getter()
{
  return LibraryMenuItem.title.getter();
}

uint64_t dispatch thunk of LibraryMenuItem.variant.getter()
{
  return dispatch thunk of LibraryMenuItem.variant.getter();
}

uint64_t type metadata accessor for LibraryMenuItem()
{
  return type metadata accessor for LibraryMenuItem();
}

uint64_t RootPPTTestCase.parameters.getter()
{
  return RootPPTTestCase.parameters.getter();
}

uint64_t RootPPTTestCase.init(name:parameters:)()
{
  return RootPPTTestCase.init(name:parameters:)();
}

uint64_t RootPPTTestCase.name.getter()
{
  return RootPPTTestCase.name.getter();
}

uint64_t type metadata accessor for RootPPTTestCase()
{
  return type metadata accessor for RootPPTTestCase();
}

Swift::Void __swiftcall RootViewSidebar.createNewFolder()()
{
}

uint64_t RootViewSidebar.setup(with:)()
{
  return RootViewSidebar.setup(with:)();
}

uint64_t type metadata accessor for ShortcutChiclet.ButtonType()
{
  return type metadata accessor for ShortcutChiclet.ButtonType();
}

uint64_t type metadata accessor for ShortcutChiclet.MenuItemModel.ItemVariant()
{
  return type metadata accessor for ShortcutChiclet.MenuItemModel.ItemVariant();
}

uint64_t ShortcutChiclet.MenuItemModel.init(name:symbol:role:variant:)()
{
  return ShortcutChiclet.MenuItemModel.init(name:symbol:role:variant:)();
}

uint64_t ShortcutChiclet.MenuItemModel.name.getter()
{
  return ShortcutChiclet.MenuItemModel.name.getter();
}

uint64_t ShortcutChiclet.MenuItemModel.role.getter()
{
  return ShortcutChiclet.MenuItemModel.role.getter();
}

uint64_t ShortcutChiclet.MenuItemModel.symbol.getter()
{
  return ShortcutChiclet.MenuItemModel.symbol.getter();
}

uint64_t dispatch thunk of ShortcutChiclet.MenuItemModel.variant.getter()
{
  return dispatch thunk of ShortcutChiclet.MenuItemModel.variant.getter();
}

uint64_t type metadata accessor for ShortcutChiclet.MenuItemModel()
{
  return type metadata accessor for ShortcutChiclet.MenuItemModel();
}

uint64_t ShortcutChiclet.MenuItemDataSource.init(getMenuItems:)()
{
  return ShortcutChiclet.MenuItemDataSource.init(getMenuItems:)();
}

uint64_t type metadata accessor for ShortcutChiclet.MenuItemDataSource()
{
  return type metadata accessor for ShortcutChiclet.MenuItemDataSource();
}

uint64_t ShortcutChiclet.init(name:icon:textColor:associatedAppBundleIdentifier:model:progress:runAction:stopAction:accessibilitySelectionAction:)()
{
  return ShortcutChiclet.init(name:icon:textColor:associatedAppBundleIdentifier:model:progress:runAction:stopAction:accessibilitySelectionAction:)();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.buttonType.setter()
{
  return dispatch thunk of ShortcutChiclet.Model.buttonType.setter();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.isSelected.setter()
{
  return dispatch thunk of ShortcutChiclet.Model.isSelected.setter();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.buttonAction.setter()
{
  return dispatch thunk of ShortcutChiclet.Model.buttonAction.setter();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.reset()()
{
  return dispatch thunk of ShortcutChiclet.Model.reset()();
}

uint64_t ShortcutChiclet.Model.Metrics.init(cornerRadius:insets:icon:button:)()
{
  return ShortcutChiclet.Model.Metrics.init(cornerRadius:insets:icon:button:)();
}

uint64_t ShortcutChiclet.Model.Metrics.Icon.init(textSpacing:dimension:)()
{
  return ShortcutChiclet.Model.Metrics.Icon.init(textSpacing:dimension:)();
}

uint64_t type metadata accessor for ShortcutChiclet.Model.Metrics.Icon()
{
  return type metadata accessor for ShortcutChiclet.Model.Metrics.Icon();
}

uint64_t ShortcutChiclet.Model.Metrics.Button.init(pointSize:)()
{
  return ShortcutChiclet.Model.Metrics.Button.init(pointSize:)();
}

uint64_t type metadata accessor for ShortcutChiclet.Model.Metrics.Button()
{
  return type metadata accessor for ShortcutChiclet.Model.Metrics.Button();
}

uint64_t static ShortcutChiclet.Model.Metrics.default.getter()
{
  return static ShortcutChiclet.Model.Metrics.default.getter();
}

uint64_t type metadata accessor for ShortcutChiclet.Model.Metrics()
{
  return type metadata accessor for ShortcutChiclet.Model.Metrics();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.metrics.getter()
{
  return dispatch thunk of ShortcutChiclet.Model.metrics.getter();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.metrics.setter()
{
  return dispatch thunk of ShortcutChiclet.Model.metrics.setter();
}

uint64_t dispatch thunk of ShortcutChiclet.Model.isEditing.setter()
{
  return dispatch thunk of ShortcutChiclet.Model.isEditing.setter();
}

uint64_t type metadata accessor for ShortcutChiclet.Model()
{
  return type metadata accessor for ShortcutChiclet.Model();
}

uint64_t type metadata accessor for ShortcutChiclet.MenuItem()
{
  return type metadata accessor for ShortcutChiclet.MenuItem();
}

uint64_t static ShortcutChiclet.Progress.noProgress.getter()
{
  return static ShortcutChiclet.Progress.noProgress.getter();
}

uint64_t dispatch thunk of ShortcutChiclet.Progress.apply(value:cancelled:)()
{
  return dispatch thunk of ShortcutChiclet.Progress.apply(value:cancelled:)();
}

uint64_t ShortcutChiclet.Progress.init()()
{
  return ShortcutChiclet.Progress.init()();
}

uint64_t type metadata accessor for ShortcutChiclet.Progress()
{
  return type metadata accessor for ShortcutChiclet.Progress();
}

uint64_t ShortcutChiclet.init(reference:model:progress:runAction:stopAction:accessibilitySelectionAction:shouldUseClearBackground:)()
{
  return ShortcutChiclet.init(reference:model:progress:runAction:stopAction:accessibilitySelectionAction:shouldUseClearBackground:)();
}

uint64_t type metadata accessor for ShortcutChiclet()
{
  return type metadata accessor for ShortcutChiclet();
}

uint64_t type metadata accessor for AllShortcutsGroup()
{
  return type metadata accessor for AllShortcutsGroup();
}

uint64_t dispatch thunk of LibraryDataSource.selectedWorkflowIds.modify()
{
  return dispatch thunk of LibraryDataSource.selectedWorkflowIds.modify();
}

uint64_t dispatch thunk of LibraryDataSource.selectedWorkflowIds.getter()
{
  return dispatch thunk of LibraryDataSource.selectedWorkflowIds.getter();
}

uint64_t dispatch thunk of LibraryDataSource.selectedWorkflowIds.setter()
{
  return dispatch thunk of LibraryDataSource.selectedWorkflowIds.setter();
}

uint64_t LibraryDataSource.init(layoutMode:canChangeLayoutModes:shortcutMoveService:database:)()
{
  return LibraryDataSource.init(layoutMode:canChangeLayoutModes:shortcutMoveService:database:)();
}

uint64_t dispatch thunk of LibraryDataSource.layoutMode.setter()
{
  return dispatch thunk of LibraryDataSource.layoutMode.setter();
}

uint64_t dispatch thunk of LibraryDataSource.$layoutMode.getter()
{
  return dispatch thunk of LibraryDataSource.$layoutMode.getter();
}

uint64_t dispatch thunk of LibraryDataSource.libraryItem(for:)()
{
  return dispatch thunk of LibraryDataSource.libraryItem(for:)();
}

uint64_t dispatch thunk of LibraryDataSource.observeChanges.setter()
{
  return dispatch thunk of LibraryDataSource.observeChanges.setter();
}

uint64_t dispatch thunk of LibraryDataSource.sortedSections.getter()
{
  return dispatch thunk of LibraryDataSource.sortedSections.getter();
}

uint64_t static LibraryDataSource.searchPredicate(for:)()
{
  return static LibraryDataSource.searchPredicate(for:)();
}

uint64_t dispatch thunk of LibraryDataSource.searchPredicate.getter()
{
  return dispatch thunk of LibraryDataSource.searchPredicate.getter();
}

uint64_t dispatch thunk of LibraryDataSource.searchPredicate.setter()
{
  return dispatch thunk of LibraryDataSource.searchPredicate.setter();
}

uint64_t dispatch thunk of LibraryDataSource.selectedWorkflows.getter()
{
  return dispatch thunk of LibraryDataSource.selectedWorkflows.getter();
}

uint64_t dispatch thunk of LibraryDataSource.selectedTableItems.getter()
{
  return dispatch thunk of LibraryDataSource.selectedTableItems.getter();
}

uint64_t LibraryDataSource.shortcutMoveService.getter()
{
  return LibraryDataSource.shortcutMoveService.getter();
}

uint64_t dispatch thunk of LibraryDataSource.sortOrderComparators.getter()
{
  return dispatch thunk of LibraryDataSource.sortOrderComparators.getter();
}

uint64_t dispatch thunk of LibraryDataSource.sortOrderComparators.setter()
{
  return dispatch thunk of LibraryDataSource.sortOrderComparators.setter();
}

uint64_t LibraryDataSource.onSortComparatorChanged.getter()
{
  return LibraryDataSource.onSortComparatorChanged.getter();
}

uint64_t LibraryDataSource.SortType.displayName.getter()
{
  return LibraryDataSource.SortType.displayName.getter();
}

uint64_t static LibraryDataSource.SortType.== infix(_:_:)()
{
  return static LibraryDataSource.SortType.== infix(_:_:)();
}

uint64_t static LibraryDataSource.SortType.allCases.getter()
{
  return static LibraryDataSource.SortType.allCases.getter();
}

uint64_t type metadata accessor for LibraryDataSource.SortType()
{
  return type metadata accessor for LibraryDataSource.SortType();
}

uint64_t LibraryDataSource.database.getter()
{
  return LibraryDataSource.database.getter();
}

uint64_t dispatch thunk of LibraryDataSource.sections.getter()
{
  return dispatch thunk of LibraryDataSource.sections.getter();
}

uint64_t dispatch thunk of LibraryDataSource.sortType.getter()
{
  return dispatch thunk of LibraryDataSource.sortType.getter();
}

uint64_t dispatch thunk of LibraryDataSource.sortType.setter()
{
  return dispatch thunk of LibraryDataSource.sortType.setter();
}

uint64_t dispatch thunk of LibraryDataSource.isEditing.getter()
{
  return dispatch thunk of LibraryDataSource.isEditing.getter();
}

uint64_t dispatch thunk of LibraryDataSource.isEditing.setter()
{
  return dispatch thunk of LibraryDataSource.isEditing.setter();
}

uint64_t type metadata accessor for LibraryDataSource()
{
  return type metadata accessor for LibraryDataSource();
}

uint64_t method lookup function for LibraryDataSource()
{
  return method lookup function for LibraryDataSource();
}

uint64_t LibraryDataSource.deinit()
{
  return LibraryDataSource.deinit();
}

uint64_t LibraryLayoutMode.symbolName.getter()
{
  return LibraryLayoutMode.symbolName.getter();
}

uint64_t LibraryLayoutMode.accessibilityLabel.getter()
{
  return LibraryLayoutMode.accessibilityLabel.getter();
}

uint64_t LibraryLayoutMode.rawValue.getter()
{
  return LibraryLayoutMode.rawValue.getter();
}

uint64_t LibraryOperations.createWorkflow(from:withBehavior:)()
{
  return LibraryOperations.createWorkflow(from:withBehavior:)();
}

uint64_t LibraryOperations.duplicateWorkflows(_:completion:)()
{
  return LibraryOperations.duplicateWorkflows(_:completion:)();
}

uint64_t dispatch thunk of ShortcutMoveService.move(_:to:of:source:)()
{
  return dispatch thunk of ShortcutMoveService.move(_:to:of:source:)();
}

uint64_t dispatch thunk of ShortcutMoveService.prepend(_:to:source:)()
{
  return dispatch thunk of ShortcutMoveService.prepend(_:to:source:)();
}

uint64_t ShortcutMoveService.init(database:undoManager:)()
{
  return ShortcutMoveService.init(database:undoManager:)();
}

uint64_t type metadata accessor for ShortcutMoveService()
{
  return type metadata accessor for ShortcutMoveService();
}

uint64_t dispatch thunk of GallerySearchManager.searchTerm.setter()
{
  return dispatch thunk of GallerySearchManager.searchTerm.setter();
}

uint64_t dispatch thunk of GallerySearchManager.isActive.setter()
{
  return dispatch thunk of GallerySearchManager.isActive.setter();
}

uint64_t GallerySearchManager.init()()
{
  return GallerySearchManager.init()();
}

uint64_t type metadata accessor for GallerySearchManager()
{
  return type metadata accessor for GallerySearchManager();
}

uint64_t LibraryConfiguration.init(destination:)()
{
  return LibraryConfiguration.init(destination:)();
}

uint64_t LibraryConfiguration.layoutOverride.getter()
{
  return LibraryConfiguration.layoutOverride.getter();
}

uint64_t LibraryConfiguration.editingBehavior.getter()
{
  return LibraryConfiguration.editingBehavior.getter();
}

uint64_t LibraryConfiguration.workflowCreationBehavior.getter()
{
  return LibraryConfiguration.workflowCreationBehavior.getter();
}

uint64_t LibraryConfiguration.workflowContextualEditingActions.getter()
{
  return LibraryConfiguration.workflowContextualEditingActions.getter();
}

uint64_t LibraryConfiguration.title.getter()
{
  return LibraryConfiguration.title.getter();
}

uint64_t LibraryConfiguration.tipType.getter()
{
  return LibraryConfiguration.tipType.getter();
}

uint64_t LibraryConfiguration.runSource.getter()
{
  return LibraryConfiguration.runSource.getter();
}

uint64_t type metadata accessor for LibraryConfiguration()
{
  return type metadata accessor for LibraryConfiguration();
}

uint64_t LibraryEditingAction.symbolName.getter()
{
  return LibraryEditingAction.symbolName.getter();
}

uint64_t static LibraryEditingAction.== infix(_:_:)()
{
  return static LibraryEditingAction.== infix(_:_:)();
}

uint64_t LibraryEditingAction.title.getter()
{
  return LibraryEditingAction.title.getter();
}

uint64_t type metadata accessor for LibraryEditingAction()
{
  return type metadata accessor for LibraryEditingAction();
}

uint64_t LibraryEditingOption.symbolName.getter()
{
  return LibraryEditingOption.symbolName.getter();
}

uint64_t LibraryEditingOption.title.getter()
{
  return LibraryEditingOption.title.getter();
}

uint64_t type metadata accessor for LibraryEditingOption()
{
  return type metadata accessor for LibraryEditingOption();
}

uint64_t type metadata accessor for ShortcutsLibraryItem.ItemType()
{
  return type metadata accessor for ShortcutsLibraryItem.ItemType();
}

uint64_t static ShortcutsLibraryItem.identifier(for:)()
{
  return static ShortcutsLibraryItem.identifier(for:)();
}

uint64_t ShortcutsLibraryItem.autoShortcut.getter()
{
  return ShortcutsLibraryItem.autoShortcut.getter();
}

uint64_t ShortcutsLibraryItem.itemProvider.getter()
{
  return ShortcutsLibraryItem.itemProvider.getter();
}

uint64_t ShortcutsLibraryItem.actionCountText.getter()
{
  return ShortcutsLibraryItem.actionCountText.getter();
}

uint64_t ShortcutsLibraryItem.nameIconViewModel.getter()
{
  return ShortcutsLibraryItem.nameIconViewModel.getter();
}

uint64_t ShortcutsLibraryItem.modificationDateText.getter()
{
  return ShortcutsLibraryItem.modificationDateText.getter();
}

uint64_t ShortcutsLibraryItem.id.getter()
{
  return ShortcutsLibraryItem.id.getter();
}

uint64_t ShortcutsLibraryItem.name.getter()
{
  return ShortcutsLibraryItem.name.getter();
}

uint64_t ShortcutsLibraryItem.itemType.getter()
{
  return ShortcutsLibraryItem.itemType.getter();
}

uint64_t ShortcutsLibraryItem.workflow.getter()
{
  return ShortcutsLibraryItem.workflow.getter();
}

uint64_t type metadata accessor for ShortcutsLibraryItem()
{
  return type metadata accessor for ShortcutsLibraryItem();
}

uint64_t StaticSidebarSection.init(name:destinations:)()
{
  return StaticSidebarSection.init(name:destinations:)();
}

uint64_t type metadata accessor for StaticSidebarSection()
{
  return type metadata accessor for StaticSidebarSection();
}

uint64_t FoldersSidebarSection.init(folders:)()
{
  return FoldersSidebarSection.init(folders:)();
}

uint64_t type metadata accessor for FoldersSidebarSection()
{
  return type metadata accessor for FoldersSidebarSection();
}

uint64_t LibrarySectionOptions.SectionType.count.getter()
{
  return LibrarySectionOptions.SectionType.count.getter();
}

uint64_t type metadata accessor for LibrarySectionOptions.SectionType()
{
  return type metadata accessor for LibrarySectionOptions.SectionType();
}

uint64_t LibrarySectionOptions.collection.getter()
{
  return LibrarySectionOptions.collection.getter();
}

uint64_t LibrarySectionOptions.sectionType.getter()
{
  return LibrarySectionOptions.sectionType.getter();
}

uint64_t LibrarySectionOptions.hasNoShortcuts.getter()
{
  return LibrarySectionOptions.hasNoShortcuts.getter();
}

uint64_t LibrarySectionOptions.workflowCreationBehavior.getter()
{
  return LibrarySectionOptions.workflowCreationBehavior.getter();
}

uint64_t type metadata accessor for LibrarySectionOptions.Footer()
{
  return type metadata accessor for LibrarySectionOptions.Footer();
}

uint64_t LibrarySectionOptions.Header.shouldShowInTable.getter()
{
  return LibrarySectionOptions.Header.shouldShowInTable.getter();
}

uint64_t static LibrarySectionOptions.Header.== infix(_:_:)()
{
  return static LibrarySectionOptions.Header.== infix(_:_:)();
}

uint64_t type metadata accessor for LibrarySectionOptions.Header()
{
  return type metadata accessor for LibrarySectionOptions.Header();
}

uint64_t LibrarySectionOptions.header.getter()
{
  return LibrarySectionOptions.header.getter();
}

uint64_t type metadata accessor for LibrarySectionOptions()
{
  return type metadata accessor for LibrarySectionOptions();
}

uint64_t static RootNavigationContext.TransitionType.default.getter()
{
  return static RootNavigationContext.TransitionType.default.getter();
}

uint64_t type metadata accessor for RootNavigationContext.TransitionType()
{
  return type metadata accessor for RootNavigationContext.TransitionType();
}

uint64_t RootNavigationContext.transitionType.getter()
{
  return RootNavigationContext.transitionType.getter();
}

uint64_t RootNavigationContext.clearSearchState.getter()
{
  return RootNavigationContext.clearSearchState.getter();
}

uint64_t RootNavigationContext.createAutomation.getter()
{
  return RootNavigationContext.createAutomation.getter();
}

uint64_t RootNavigationContext.init(dismissOccludingViewController:clearSearchState:animateTransition:createAutomation:transitionType:pptTest:)()
{
  return RootNavigationContext.init(dismissOccludingViewController:clearSearchState:animateTransition:createAutomation:transitionType:pptTest:)();
}

uint64_t RootNavigationContext.dismissOccludingViewController.getter()
{
  return RootNavigationContext.dismissOccludingViewController.getter();
}

uint64_t RootNavigationContext.pptTest.getter()
{
  return RootNavigationContext.pptTest.getter();
}

uint64_t type metadata accessor for RootNavigationContext()
{
  return type metadata accessor for RootNavigationContext();
}

uint64_t LibraryEditingBehavior.allowsMultipleSelection.getter()
{
  return LibraryEditingBehavior.allowsMultipleSelection.getter();
}

uint64_t LibraryEditingBehavior.actions.getter()
{
  return LibraryEditingBehavior.actions.getter();
}

uint64_t type metadata accessor for LibraryEditingBehavior()
{
  return type metadata accessor for LibraryEditingBehavior();
}

uint64_t ShortcutFileImportView.init(importResult:completion:)()
{
  return ShortcutFileImportView.init(importResult:completion:)();
}

uint64_t type metadata accessor for ShortcutFileImportView()
{
  return type metadata accessor for ShortcutFileImportView();
}

uint64_t AddToHomeScreenActivity.init(reference:)()
{
  return AddToHomeScreenActivity.init(reference:)();
}

uint64_t type metadata accessor for AddToHomeScreenActivity()
{
  return type metadata accessor for AddToHomeScreenActivity();
}

uint64_t dispatch thunk of MoveToFolderCoordinator.move(_:presentingViewController:)()
{
  return dispatch thunk of MoveToFolderCoordinator.move(_:presentingViewController:)();
}

uint64_t MoveToFolderCoordinator.init(database:service:)()
{
  return MoveToFolderCoordinator.init(database:service:)();
}

uint64_t dispatch thunk of MoveToFolderCoordinator.delegate.setter()
{
  return dispatch thunk of MoveToFolderCoordinator.delegate.setter();
}

uint64_t type metadata accessor for MoveToFolderCoordinator()
{
  return type metadata accessor for MoveToFolderCoordinator();
}

uint64_t QuarantinedShortcutView.init(workflow:)()
{
  return QuarantinedShortcutView.init(workflow:)();
}

uint64_t type metadata accessor for QuarantinedShortcutView()
{
  return type metadata accessor for QuarantinedShortcutView();
}

uint64_t ShortcutsLibrarySection.tableItems.getter()
{
  return ShortcutsLibrarySection.tableItems.getter();
}

uint64_t ShortcutsLibrarySection.workflowInsertionAllowed.getter()
{
  return ShortcutsLibrarySection.workflowInsertionAllowed.getter();
}

uint64_t ShortcutsLibrarySection.id.getter()
{
  return ShortcutsLibrarySection.id.getter();
}

uint64_t ShortcutsLibrarySection.item(for:)()
{
  return ShortcutsLibrarySection.item(for:)();
}

uint64_t ShortcutsLibrarySection.items.getter()
{
  return ShortcutsLibrarySection.items.getter();
}

uint64_t ShortcutsLibrarySection.footer.getter()
{
  return ShortcutsLibrarySection.footer.getter();
}

uint64_t ShortcutsLibrarySection.header.getter()
{
  return ShortcutsLibrarySection.header.getter();
}

uint64_t ShortcutsLibrarySection.options.getter()
{
  return ShortcutsLibrarySection.options.getter();
}

uint64_t type metadata accessor for ShortcutsLibrarySection()
{
  return type metadata accessor for ShortcutsLibrarySection();
}

uint64_t type metadata accessor for AppStorePromptController()
{
  return type metadata accessor for AppStorePromptController();
}

uint64_t AutoShortcutsSettingView.Model.init(app:database:)()
{
  return AutoShortcutsSettingView.Model.init(app:database:)();
}

uint64_t type metadata accessor for AutoShortcutsSettingView.Model()
{
  return type metadata accessor for AutoShortcutsSettingView.Model();
}

uint64_t AutoShortcutsSettingView.init(model:)()
{
  return AutoShortcutsSettingView.init(model:)();
}

uint64_t type metadata accessor for AutoShortcutsSettingView()
{
  return type metadata accessor for AutoShortcutsSettingView();
}

uint64_t type metadata accessor for GalleryShortcutDescriptor()
{
  return type metadata accessor for GalleryShortcutDescriptor();
}

uint64_t MyShortcutsSidebarSection.init(name:)()
{
  return MyShortcutsSidebarSection.init(name:)();
}

uint64_t type metadata accessor for MyShortcutsSidebarSection()
{
  return type metadata accessor for MyShortcutsSidebarSection();
}

uint64_t RootNavigationDestination.symbolName.getter()
{
  return RootNavigationDestination.symbolName.getter();
}

uint64_t RootNavigationDestination.displayName.getter()
{
  return RootNavigationDestination.displayName.getter();
}

uint64_t type metadata accessor for RootNavigationDestination.DropBehavior()
{
  return type metadata accessor for RootNavigationDestination.DropBehavior();
}

uint64_t RootNavigationDestination.countOfItems(in:autoShortcutsDataSource:)()
{
  return RootNavigationDestination.countOfItems(in:autoShortcutsDataSource:)();
}

uint64_t RootNavigationDestination.dropBehavior.getter()
{
  return RootNavigationDestination.dropBehavior.getter();
}

uint64_t RootNavigationDestination.sidebarIdentifier.getter()
{
  return RootNavigationDestination.sidebarIdentifier.getter();
}

uint64_t type metadata accessor for RootNavigationDestination()
{
  return type metadata accessor for RootNavigationDestination();
}

Swift::Void __swiftcall TriggerRootViewController.startCreateNewPersonalAutomation()()
{
}

uint64_t TriggerRootViewController.init(with:)()
{
  return TriggerRootViewController.init(with:)();
}

uint64_t type metadata accessor for TriggerRootViewController()
{
  return type metadata accessor for TriggerRootViewController();
}

uint64_t type metadata accessor for GalleryShortcutActionsView()
{
  return type metadata accessor for GalleryShortcutActionsView();
}

uint64_t AutoShortcutsSidebarSection.init(dataSource:)()
{
  return AutoShortcutsSidebarSection.init(dataSource:)();
}

uint64_t type metadata accessor for AutoShortcutsSidebarSection()
{
  return type metadata accessor for AutoShortcutsSidebarSection();
}

uint64_t type metadata accessor for GalleryCollectionDescriptor()
{
  return type metadata accessor for GalleryCollectionDescriptor();
}

uint64_t static GalleryNavigationDestination.== infix(_:_:)()
{
  return static GalleryNavigationDestination.== infix(_:_:)();
}

uint64_t type metadata accessor for GalleryNavigationDestination()
{
  return type metadata accessor for GalleryNavigationDestination();
}

uint64_t AddToHomeScreenViewController.init(aggregatedEntry:)()
{
  return AddToHomeScreenViewController.init(aggregatedEntry:)();
}

uint64_t type metadata accessor for AddToHomeScreenViewController()
{
  return type metadata accessor for AddToHomeScreenViewController();
}

uint64_t type metadata accessor for NameIconComposeViewController.Mode()
{
  return type metadata accessor for NameIconComposeViewController.Mode();
}

uint64_t NameIconComposeViewController.Mode.init(_:)()
{
  return NameIconComposeViewController.Mode.init(_:)();
}

uint64_t dispatch thunk of NameIconComposeViewController.delegate.setter()
{
  return dispatch thunk of NameIconComposeViewController.delegate.setter();
}

uint64_t type metadata accessor for NameIconComposeViewController()
{
  return type metadata accessor for NameIconComposeViewController();
}

uint64_t NameIconComposeViewController.init(_:glyphCharacter:)()
{
  return NameIconComposeViewController.init(_:glyphCharacter:)();
}

uint64_t WFPreviewNavigationController.init(rootViewController:isInSheetView:)()
{
  return WFPreviewNavigationController.init(rootViewController:isInSheetView:)();
}

uint64_t type metadata accessor for WFPreviewNavigationController()
{
  return type metadata accessor for WFPreviewNavigationController();
}

uint64_t WFCollectionConfigurationViewController.init(mode:updatingWithDatabase:)()
{
  return WFCollectionConfigurationViewController.init(mode:updatingWithDatabase:)();
}

uint64_t type metadata accessor for WFCollectionConfigurationViewController.EditMode()
{
  return type metadata accessor for WFCollectionConfigurationViewController.EditMode();
}

uint64_t type metadata accessor for WFCollectionConfigurationViewController()
{
  return type metadata accessor for WFCollectionConfigurationViewController();
}

uint64_t type metadata accessor for TipType()
{
  return type metadata accessor for TipType();
}

Swift::Void __swiftcall RootView.deleteCollections(_:keepShortcuts:)(Swift::OpaquePointer _, Swift::Bool keepShortcuts)
{
}

void __swiftcall RootView.deleteAlertStrings(collections:shortcutsCount:exactCount:)(Swift::tuple_title_String_message_String_deleteTitle_String_keepTitle_String *__return_ptr retstr, Swift::OpaquePointer collections, Swift::Int shortcutsCount, Swift::Bool exactCount)
{
}

uint64_t RootView.importShortcutFile(with:openAfterImport:completion:)()
{
  return RootView.importShortcutFile(with:openAfterImport:completion:)();
}

Swift::Void __swiftcall RootView.setup()()
{
}

uint64_t RootView.scroll(toWorkflow:animated:)()
{
  return RootView.scroll(toWorkflow:animated:)();
}

uint64_t RootView.navigate(to:completion:)()
{
  return RootView.navigate(to:completion:)();
}

uint64_t RootView.navigate(to:with:completion:)()
{
  return RootView.navigate(to:with:completion:)();
}

uint64_t RootView.navigate(to:)()
{
  return RootView.navigate(to:)();
}

uint64_t dispatch thunk of AppNameCache.name(forBundleIdentifier:)()
{
  return dispatch thunk of AppNameCache.name(forBundleIdentifier:)();
}

uint64_t static AppNameCache.shared.getter()
{
  return static AppNameCache.shared.getter();
}

uint64_t AggregatedEntry.iconBadges.getter()
{
  return AggregatedEntry.iconBadges.getter();
}

uint64_t AggregatedEntry.shortTitle.getter()
{
  return AggregatedEntry.shortTitle.getter();
}

uint64_t AggregatedEntry.name.getter()
{
  return AggregatedEntry.name.getter();
}

uint64_t AggregatedEntry.entryIcon.getter()
{
  return AggregatedEntry.entryIcon.getter();
}

uint64_t type metadata accessor for AggregatedEntry()
{
  return type metadata accessor for AggregatedEntry();
}

uint64_t AutoShortcutApp.localizedName.getter()
{
  return AutoShortcutApp.localizedName.getter();
}

uint64_t AutoShortcutApp.bundleIdentifier.getter()
{
  return AutoShortcutApp.bundleIdentifier.getter();
}

Swift::Int __swiftcall AutoShortcutApp.numberOfShortcuts(includeUserShortcuts:)(Swift::Bool includeUserShortcuts)
{
  return AutoShortcutApp.numberOfShortcuts(includeUserShortcuts:)(includeUserShortcuts);
}

uint64_t type metadata accessor for AutoShortcutApp()
{
  return type metadata accessor for AutoShortcutApp();
}

uint64_t static ActionDrawerDataSource.shared.getter()
{
  return static ActionDrawerDataSource.shared.getter();
}

uint64_t type metadata accessor for ActionDrawerDataSource()
{
  return type metadata accessor for ActionDrawerDataSource();
}

uint64_t type metadata accessor for AutoShortcutAppSection.SectionType()
{
  return type metadata accessor for AutoShortcutAppSection.SectionType();
}

uint64_t AutoShortcutAppSection.sectionType.getter()
{
  return AutoShortcutAppSection.sectionType.getter();
}

uint64_t AutoShortcutAppSection.bundleIdentifier.getter()
{
  return AutoShortcutAppSection.bundleIdentifier.getter();
}

uint64_t AutoShortcutAppSection.id.getter()
{
  return AutoShortcutAppSection.id.getter();
}

uint64_t AutoShortcutAppSection.items.getter()
{
  return AutoShortcutAppSection.items.getter();
}

uint64_t type metadata accessor for AutoShortcutAppSection()
{
  return type metadata accessor for AutoShortcutAppSection();
}

uint64_t dispatch thunk of AutoShortcutsAppsDataSource.autoShortcutApps.getter()
{
  return dispatch thunk of AutoShortcutsAppsDataSource.autoShortcutApps.getter();
}

uint64_t dispatch thunk of AutoShortcutsAppsDataSource.$autoShortcutApps.getter()
{
  return dispatch thunk of AutoShortcutsAppsDataSource.$autoShortcutApps.getter();
}

uint64_t AutoShortcutsAppsDataSource.init(organizedCollections:)()
{
  return AutoShortcutsAppsDataSource.init(organizedCollections:)();
}

uint64_t type metadata accessor for AutoShortcutsAppsDataSource()
{
  return type metadata accessor for AutoShortcutsAppsDataSource();
}

uint64_t type metadata accessor for WFSheetView()
{
  return type metadata accessor for WFSheetView();
}

uint64_t TopHitView.init(icon:iconMask:badges:name:colorScheme:menu:tapHandler:)()
{
  return TopHitView.init(icon:iconMask:badges:name:colorScheme:menu:tapHandler:)();
}

uint64_t DebugMenuView.init(database:close:onShare:)()
{
  return DebugMenuView.init(database:close:onShare:)();
}

uint64_t type metadata accessor for DebugMenuView()
{
  return type metadata accessor for DebugMenuView();
}

uint64_t type metadata accessor for TopHitIconMask()
{
  return type metadata accessor for TopHitIconMask();
}

uint64_t dispatch thunk of LogStreamManager.start()()
{
  return dispatch thunk of LogStreamManager.start()();
}

uint64_t static LogStreamManager.shared.getter()
{
  return static LogStreamManager.shared.getter();
}

uint64_t type metadata accessor for LogStreamManager()
{
  return type metadata accessor for LogStreamManager();
}

uint64_t OrderedDictionary.values.getter()
{
  return OrderedDictionary.values.getter();
}

uint64_t OrderedDictionary.subscript.getter()
{
  return OrderedDictionary.subscript.getter();
}

uint64_t static TopHitViewMetrics.width.getter()
{
  return static TopHitViewMetrics.width.getter();
}

uint64_t type metadata accessor for GlyphIconColorScheme()
{
  return type metadata accessor for GlyphIconColorScheme();
}

uint64_t TopHitCollectionView.init(style:items:layout:backgroundGradient:containerWidth:content:)()
{
  return TopHitCollectionView.init(style:items:layout:backgroundGradient:containerWidth:content:)();
}

uint64_t dispatch thunk of DebugStatusBarManager.addWindowScene(_:)()
{
  return dispatch thunk of DebugStatusBarManager.addWindowScene(_:)();
}

uint64_t static DebugStatusBarManager.shared.getter()
{
  return static DebugStatusBarManager.shared.getter();
}

uint64_t type metadata accessor for DebugStatusBarManager()
{
  return type metadata accessor for DebugStatusBarManager();
}

uint64_t dispatch thunk of AttributeGraphProfiler.start()()
{
  return dispatch thunk of AttributeGraphProfiler.start()();
}

uint64_t static AttributeGraphProfiler.shared.getter()
{
  return static AttributeGraphProfiler.shared.getter();
}

uint64_t type metadata accessor for AttributeGraphProfiler()
{
  return type metadata accessor for AttributeGraphProfiler();
}

uint64_t onMainThreadInlineOrAsync(closure:)()
{
  return onMainThreadInlineOrAsync(closure:)();
}

uint64_t AppEntityViewAnnotation.init<A>(entityType:identifier:state:)()
{
  return AppEntityViewAnnotation.init<A>(entityType:identifier:state:)();
}

uint64_t type metadata accessor for AppEntityViewAnnotation()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t TopHitViewColorScheme.sectionIconForegroundColor.getter()
{
  return TopHitViewColorScheme.sectionIconForegroundColor.getter();
}

uint64_t TopHitViewColorScheme.init(bundleIdentifier:style:)()
{
  return TopHitViewColorScheme.init(bundleIdentifier:style:)();
}

uint64_t TopHitViewColorScheme.platterBackgroundGradient.getter()
{
  return TopHitViewColorScheme.platterBackgroundGradient.getter();
}

uint64_t type metadata accessor for TopHitViewColorScheme()
{
  return type metadata accessor for TopHitViewColorScheme();
}

uint64_t TopHitCollectionViewStyle.contentViewHorizontalPadding.getter()
{
  return TopHitCollectionViewStyle.contentViewHorizontalPadding.getter();
}

uint64_t type metadata accessor for TopHitCollectionViewStyle()
{
  return type metadata accessor for TopHitCollectionViewStyle();
}

uint64_t static AppShortcutAdditionMenuItem.addToShortcut.getter()
{
  return static AppShortcutAdditionMenuItem.addToShortcut.getter();
}

uint64_t AppShortcutAdditionMenuItem.symbolName.getter()
{
  return AppShortcutAdditionMenuItem.symbolName.getter();
}

uint64_t static AppShortcutAdditionMenuItem.addToHomeScreen.getter()
{
  return static AppShortcutAdditionMenuItem.addToHomeScreen.getter();
}

uint64_t AppShortcutAdditionMenuItem.name.getter()
{
  return AppShortcutAdditionMenuItem.name.getter();
}

uint64_t type metadata accessor for AppShortcutAdditionMenuItem()
{
  return type metadata accessor for AppShortcutAdditionMenuItem();
}

uint64_t type metadata accessor for IconSize()
{
  return type metadata accessor for IconSize();
}

uint64_t type metadata accessor for IconView.DisplayMode()
{
  return type metadata accessor for IconView.DisplayMode();
}

uint64_t type metadata accessor for IconView()
{
  return type metadata accessor for IconView();
}

uint64_t IconView.init(_:size:displayMode:animated:)()
{
  return IconView.init(_:size:displayMode:animated:)();
}

uint64_t ShortcutsFeatureFlags.isFeatureEnabled.getter()
{
  return ShortcutsFeatureFlags.isFeatureEnabled.getter();
}

uint64_t type metadata accessor for ShortcutsFeatureFlags()
{
  return type metadata accessor for ShortcutsFeatureFlags();
}

uint64_t static WFLog.subscript.getter()
{
  return static WFLog.subscript.getter();
}

uint64_t static UTType._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UTType._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for UIPointerShape()
{
  return type metadata accessor for UIPointerShape();
}

uint64_t type metadata accessor for UIPointerEffect.TintMode()
{
  return type metadata accessor for UIPointerEffect.TintMode();
}

uint64_t type metadata accessor for UIPointerEffect()
{
  return type metadata accessor for UIPointerEffect();
}

uint64_t UIListContentConfiguration.TextProperties.font.getter()
{
  return UIListContentConfiguration.TextProperties.font.getter();
}

uint64_t type metadata accessor for UIListContentConfiguration.TextProperties()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties();
}

uint64_t UIListContentConfiguration.textProperties.getter()
{
  return UIListContentConfiguration.textProperties.getter();
}

uint64_t static UIListContentConfiguration.prominentInsetGroupedHeader()()
{
  return static UIListContentConfiguration.prominentInsetGroupedHeader()();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t type metadata accessor for UITraitHorizontalSizeClass()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t NSDiffableDataSourceSnapshot.appendItems(_:toSection:)()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

uint64_t NSDiffableDataSourceSnapshot.numberOfItems(inSection:)()
{
  return NSDiffableDataSourceSnapshot.numberOfItems(inSection:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.appendSections(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.numberOfSections.getter()
{
  return NSDiffableDataSourceSnapshot.numberOfSections.getter();
}

uint64_t NSDiffableDataSourceSnapshot.sectionIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
}

uint64_t type metadata accessor for UITraitPreferredContentSizeCategory()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t Tip.invalidate(reason:)()
{
  return Tip.invalidate(reason:)();
}

uint64_t Tip.shouldDisplay.getter()
{
  return Tip.shouldDisplay.getter();
}

uint64_t Tip.shouldDisplayUpdates.getter()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t type metadata accessor for TipUIView()
{
  return type metadata accessor for TipUIView();
}

uint64_t TipUIView.init(_:arrowEdge:actionHandler:)()
{
  return TipUIView.init(_:arrowEdge:actionHandler:)();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(first:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(first:)();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return static Tips.OptionsBuilder.buildExpression<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter()
{
  return static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine()
{
  return type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine();
}

uint64_t static Tips.ConfigurationOption.analyticsEngine(_:)()
{
  return static Tips.ConfigurationOption.analyticsEngine(_:)();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.system.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.system.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DisplayFrequency()
{
  return type metadata accessor for Tips.ConfigurationOption.DisplayFrequency();
}

uint64_t static Tips.ConfigurationOption.displayFrequency(_:)()
{
  return static Tips.ConfigurationOption.displayFrequency(_:)();
}

uint64_t static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter()
{
  return static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DatastoreLocation()
{
  return type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
}

uint64_t static Tips.ConfigurationOption.datastoreLocation(_:)()
{
  return static Tips.ConfigurationOption.datastoreLocation(_:)();
}

uint64_t type metadata accessor for Tips.ConfigurationOption()
{
  return type metadata accessor for Tips.ConfigurationOption();
}

uint64_t type metadata accessor for Tips.Rule()
{
  return type metadata accessor for Tips.Rule();
}

uint64_t Tips.Rule.init<A>(_:_:)()
{
  return Tips.Rule.init<A>(_:_:)();
}

uint64_t type metadata accessor for Tips.Status()
{
  return type metadata accessor for Tips.Status();
}

uint64_t Tips.Parameter.wrappedValue.getter()
{
  return Tips.Parameter.wrappedValue.getter();
}

uint64_t Tips.Parameter.wrappedValue.setter()
{
  return Tips.Parameter.wrappedValue.setter();
}

uint64_t type metadata accessor for Tips.Parameter()
{
  return type metadata accessor for Tips.Parameter();
}

uint64_t Tips.Parameter.init<A>(_:_:_:_:)()
{
  return Tips.Parameter.init<A>(_:_:_:_:)();
}

uint64_t static Tips.configure(_:)()
{
  return static Tips.configure(_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t static ButtonRole.destructive.getter()
{
  return static ButtonRole.destructive.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t type metadata accessor for Prominence()
{
  return type metadata accessor for Prominence();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t type metadata accessor for PPTTestCase.ScrollMode()
{
  return type metadata accessor for PPTTestCase.ScrollMode();
}

uint64_t PPTTestCase.performScrollTest(_:scrollMode:)()
{
  return PPTTestCase.performScrollTest(_:scrollMode:)();
}

uint64_t type metadata accessor for PPTTestCase.Name()
{
  return type metadata accessor for PPTTestCase.Name();
}

uint64_t PPTTestCase.Name.init(_:)()
{
  return PPTTestCase.Name.init(_:)();
}

uint64_t dispatch thunk of PPTTestHost.runTest(_:options:)()
{
  return dispatch thunk of PPTTestHost.runTest(_:options:)();
}

uint64_t TableColumn.width(min:ideal:max:)()
{
  return TableColumn.width(min:ideal:max:)();
}

uint64_t TableColumn<>.init<A, B>(_:value:content:)()
{
  return TableColumn<>.init<A, B>(_:value:content:)();
}

uint64_t DropDelegate.dropExited(info:)()
{
  return DropDelegate.dropExited(info:)();
}

uint64_t DropDelegate.dropEntered(info:)()
{
  return DropDelegate.dropEntered(info:)();
}

uint64_t DropDelegate.dropUpdated(info:)()
{
  return DropDelegate.dropUpdated(info:)();
}

uint64_t static VerticalEdge.Set.all.getter()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t static AnyTransition.asymmetric(insertion:removal:)()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.animation(_:)()
{
  return AnyTransition.animation(_:)();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t ObservedObject.projectedValue.getter()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t ObservedObject.Wrapper.subscript.getter()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t _UIHostingView.init(rootView:)()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t dispatch thunk of _UIHostingView.rootView.setter()
{
  return dispatch thunk of _UIHostingView.rootView.setter();
}

uint64_t type metadata accessor for ScrollViewProxy()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t static TableRowContent._tableRowCount(inputs:)()
{
  return static TableRowContent._tableRowCount(inputs:)();
}

uint64_t TableRowContent.itemProvider(_:)()
{
  return TableRowContent.itemProvider(_:)();
}

uint64_t static TableRowContent._containsOutlineSymbol(inputs:)()
{
  return static TableRowContent._containsOutlineSymbol(inputs:)();
}

uint64_t static TableRowContent._makeRows(content:inputs:)()
{
  return static TableRowContent._makeRows(content:inputs:)();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t SidebarListStyle.init()()
{
  return SidebarListStyle.init()();
}

uint64_t type metadata accessor for SidebarListStyle()
{
  return type metadata accessor for SidebarListStyle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.rootNavigator.getter()
{
  return EnvironmentValues.rootNavigator.getter();
}

uint64_t EnvironmentValues.rootNavigator.setter()
{
  return EnvironmentValues.rootNavigator.setter();
}

uint64_t EnvironmentValues.libraryMenuDataSource.getter()
{
  return EnvironmentValues.libraryMenuDataSource.getter();
}

uint64_t EnvironmentValues.libraryMenuDataSource.setter()
{
  return EnvironmentValues.libraryMenuDataSource.setter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.sizeCategory.getter()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t EnvironmentValues.sizeCategory.setter()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t EnvironmentValues.userInterface.getter()
{
  return EnvironmentValues.userInterface.getter();
}

uint64_t EnvironmentValues.userInterface.setter()
{
  return EnvironmentValues.userInterface.setter();
}

uint64_t EnvironmentValues.isLockedByAppProtection.getter()
{
  return EnvironmentValues.isLockedByAppProtection.getter();
}

uint64_t EnvironmentValues.isLockedByAppProtection.setter()
{
  return EnvironmentValues.isLockedByAppProtection.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.allowsTightening.getter()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t EnvironmentValues.allowsTightening.setter()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.setter()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.editMode.getter()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t EnvironmentValues.editMode.setter()
{
  return EnvironmentValues.editMode.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation(_:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t type metadata accessor for ContentSizeCategory()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t UIHostingController.init(coder:rootView:)()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t type metadata accessor for EmptyTableRowContent()
{
  return type metadata accessor for EmptyTableRowContent();
}

uint64_t BorderlessButtonStyle.init()()
{
  return BorderlessButtonStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonStyle()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t type metadata accessor for TableHeaderRowContent()
{
  return type metadata accessor for TableHeaderRowContent();
}

uint64_t DynamicTableRowContent.onInsert(of:perform:)()
{
  return DynamicTableRowContent.onInsert(of:perform:)();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t static Font.title3.getter()
{
  return static Font.title3.getter();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t static Font.callout.getter()
{
  return static Font.callout.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Font.init(_:)()
{
  return Font.init(_:)();
}

uint64_t List.init(selection:content:)()
{
  return List.init(selection:content:)();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t type metadata accessor for List()
{
  return type metadata accessor for List();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.appEntity<A>(entityType:identifier:state:)()
{
  return View.appEntity<A>(entityType:identifier:state:)();
}

uint64_t View.appEntity<A>(_:state:)()
{
  return View.appEntity<A>(_:state:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.contextMenu<A, B>(forSelectionType:menu:primaryAction:)()
{
  return View.contextMenu<A, B>(forSelectionType:menu:primaryAction:)();
}

uint64_t View.contextMenu<A>(menuItems:)()
{
  return View.contextMenu<A>(menuItems:)();
}

uint64_t View.contextAction<A>(forSelectionType:action:)()
{
  return View.contextAction<A>(forSelectionType:action:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.headerProminence(_:)()
{
  return View.headerProminence(_:)();
}

uint64_t View.listRowSeparator(_:edges:)()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t View.confirmationDialog<A, B, C, D>(_:isPresented:titleVisibility:presenting:actions:message:)()
{
  return View.confirmationDialog<A, B, C, D>(_:isPresented:titleVisibility:presenting:actions:message:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.prefersExpandedSidebars(_:)()
{
  return View.prefersExpandedSidebars(_:)();
}

uint64_t View.badge(_:)()
{
  return View.badge(_:)();
}

uint64_t View.sheet<A, B>(item:onDismiss:content:)()
{
  return View.sheet<A, B>(item:onDismiss:content:)();
}

uint64_t View.onDrop(of:delegate:)()
{
  return View.onDrop(of:delegate:)();
}

uint64_t View.onTest(_:handler:)()
{
  return View.onTest(_:handler:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

{
  return Color.init(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Table.init<A>(selection:sortOrder:columns:rows:)()
{
  return Table.init<A>(selection:sortOrder:columns:rows:)();
}

uint64_t Button.init(role:action:label:)()
{
  return Button.init(role:action:label:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t ForEach<>.init<A>(_:id:content:)()
{
  return ForEach<>.init<A>(_:id:content:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t Section<>.init<A, B>(content:header:)()
{
  return Section<>.init<A, B>(content:header:)();
}

uint64_t Section<>.init<A>(content:)()
{
  return Section<>.init<A>(content:)();
}

uint64_t Section<>.init<A>(_:content:)()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t type metadata accessor for Section()
{
  return type metadata accessor for Section();
}

uint64_t DropInfo.itemProviders(for:)()
{
  return DropInfo.itemProviders(for:)();
}

Swift::Bool __swiftcall DropInfo.hasItemsConforming(to:)(Swift::OpaquePointer to)
{
  return DropInfo.hasItemsConforming(to:)(to._rawValue);
}

uint64_t static EditMode.== infix(_:_:)()
{
  return static EditMode.== infix(_:_:)();
}

uint64_t type metadata accessor for EditMode()
{
  return type metadata accessor for EditMode();
}

uint64_t type metadata accessor for GridItem.Size()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t type metadata accessor for GridItem()
{
  return type metadata accessor for GridItem();
}

uint64_t GridItem.init(_:spacing:alignment:)()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t TableRow.init(_:)()
{
  return TableRow.init(_:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t type metadata accessor for AppShortcutEntity()
{
  return type metadata accessor for AppShortcutEntity();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t MutableCollection.move(fromOffsets:toOffset:)()
{
  return MutableCollection.move(fromOffsets:toOffset:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t type metadata accessor for String.IntentInputOptions()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t type metadata accessor for String.LocalizationValue.Placeholder()
{
  return type metadata accessor for String.LocalizationValue.Placeholder();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation(placeholder:specifier:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation(placeholder:specifier:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.ifNotEmpty.getter()
{
  return String.ifNotEmpty.getter();
}

uint64_t String.UnicodeScalarView._foreignIndex(after:)()
{
  return String.UnicodeScalarView._foreignIndex(after:)();
}

uint64_t String.UnicodeScalarView._foreignIndex(before:)()
{
  return String.UnicodeScalarView._foreignIndex(before:)();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

{
  return String.init<A>(_:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array<A>.hashValue.getter()
{
  return Array<A>.hashValue.getter();
}

uint64_t type metadata accessor for Bool.IntentDisplayName()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t Bool.hashValue.getter()
{
  return Bool.hashValue.getter();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t Double.hashValue.getter()
{
  return Double.hashValue.getter();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t WFDatabase.performTransaction(reason:_:)()
{
  return WFDatabase.performTransaction(reason:_:)();
}

uint64_t UIKeyCommand.init(title:image:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:)()
{
  return UIKeyCommand.init(title:image:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UIPointerStyle.init(effect:shape:)()
{
  return UIPointerStyle.init(effect:shape:)();
}

uint64_t UIViewController.registerForTraitChanges<A>(_:handler:)()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t WFApplicationContext.isIPadInSplitScreen.getter()
{
  return WFApplicationContext.isIPadInSplitScreen.getter();
}

uint64_t WFHomeScreenController.add(entry:name:colorScheme:symbolName:)()
{
  return WFHomeScreenController.add(entry:name:colorScheme:symbolName:)();
}

uint64_t WFExecutableAppShortcut.name.getter()
{
  return WFExecutableAppShortcut.name.getter();
}

uint64_t static UIViewControllerTransition.zoom(options:sourceViewProvider:)()
{
  return static UIViewControllerTransition.zoom(options:sourceViewProvider:)();
}

uint64_t WFDatabaseObjectDescriptor.id.getter()
{
  return WFDatabaseObjectDescriptor.id.getter();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t UIView.annotate(with:)()
{
  return UIView.annotate(with:)();
}

uint64_t WFColor.luminanceAdjustedColor(in:)()
{
  return WFColor.luminanceAdjustedColor(in:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.localizedCaseInsensitiveContains<A>(_:)()
{
  return StringProtocol.localizedCaseInsensitiveContains<A>(_:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return dispatch thunk of Identifiable.id.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t AsyncMapSequence.base.getter()
{
  return AsyncMapSequence.base.getter();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return AsyncMapSequence.Iterator.baseIterator.modify();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return AsyncMapSequence.Iterator.transform.getter();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return AsyncMapSequence.Iterator.init(_:transform:)();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return AsyncMapSequence.transform.getter();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t BSFloatRoundForScale()
{
  return _BSFloatRoundForScale();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t VCIsInternalBuild()
{
  return _VCIsInternalBuild();
}

uint64_t WFConvertEdgeInsetsToRTLIfNeeded()
{
  return _WFConvertEdgeInsetsToRTLIfNeeded();
}

uint64_t WFEnsureDaemonIsRunningForSyncIfNeeded()
{
  return _WFEnsureDaemonIsRunningForSyncIfNeeded();
}

uint64_t WFPostAccessibilityAnnouncement()
{
  return _WFPostAccessibilityAnnouncement();
}

uint64_t WFPresentInitializationErrorIfNecessary()
{
  return _WFPresentInitializationErrorIfNecessary();
}

uint64_t WFPresentResumeSyncConfirmationAlertWithUserInterfaceIfNeeded()
{
  return _WFPresentResumeSyncConfirmationAlertWithUserInterfaceIfNeeded();
}

uint64_t WFPresentWorkflowSettingsViewController()
{
  return _WFPresentWorkflowSettingsViewController();
}

uint64_t WFSystemImageNameForGlyphCharacter()
{
  return _WFSystemImageNameForGlyphCharacter();
}

uint64_t WFTriggerIDFromNotificationUserInfo()
{
  return _WFTriggerIDFromNotificationUserInfo();
}

uint64_t WFUserInterfaceFromView()
{
  return _WFUserInterfaceFromView();
}

uint64_t WFUserInterfaceFromViewController()
{
  return _WFUserInterfaceFromViewController();
}

uint64_t WFWorkflowCollectionIdentifierForWorkflowType()
{
  return _WFWorkflowCollectionIdentifierForWorkflowType();
}

uint64_t WFWorkflowIconDrawerGloballyCacheDrawerContext()
{
  return _WFWorkflowIconDrawerGloballyCacheDrawerContext();
}

uint64_t WFWorkflowReferenceType()
{
  return _WFWorkflowReferenceType();
}

uint64_t _AXSAccessibilityEnabled()
{
  return __AXSAccessibilityEnabled();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return __AXSApplicationAccessibilityEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void free(void *a1)
{
}

uint64_t getWFGeneralLogObject()
{
  return _getWFGeneralLogObject();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _[a1 URLContexts];
}

id objc_msgSend_URLForSimulatingHandoffWithActivityType_userInfo_webpageURL_fromSource_(void *a1, const char *a2, ...)
{
  return [a1 URLForSimulatingHandoffWithActivityType:userInfo:webpageURL:fromSource:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_alertWithError_(void *a1, const char *a2, ...)
{
  return [a1 alertWithError:];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appWithURLScheme_(void *a1, const char *a2, ...)
{
  return [a1 appWithURLScheme:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_beginObservingKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _[a1 beginObservingKeyboardNotifications];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithURL:];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_composeViewController(void *a1, const char *a2, ...)
{
  return _[a1 composeViewController];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithName:sessionRole:];
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 containsValueForKey:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_coordinateAccessWithIntents_queue_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateAccessWithIntents:queue:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createActionWithIdentifier_serializedParameters_(void *a1, const char *a2, ...)
{
  return [a1 createActionWithIdentifier:serializedParameters:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDocumentsDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 createDocumentsDirectoryIfNecessary];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return _[a1 defaultDatabase];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSearchableIndex(void *a1, const char *a2, ...)
{
  return _[a1 defaultSearchableIndex];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteSearchableItemsWithDomainIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 deleteSearchableItemsWithDomainIdentifiers:completionHandler:];
}

id objc_msgSend_deserializeUserInfoAtURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeUserInfoAtURL:completionHandler:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didBecomeActive(void *a1, const char *a2, ...)
{
  return _[a1 didBecomeActive];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_externalURLForViewing(void *a1, const char *a2, ...)
{
  return _[a1 externalURLForViewing];
}

id objc_msgSend_extractShortcutWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 extractShortcutWithCompletion:];
}

id objc_msgSend_fetchConfigurationAssetWithType_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchConfigurationAssetWithType:completionHandler:];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileWithURL_options_(void *a1, const char *a2, ...)
{
  return [a1 fileWithURL:options:];
}

id objc_msgSend_fileWithURL_options_ofType_(void *a1, const char *a2, ...)
{
  return [a1 fileWithURL:options:ofType:];
}

id objc_msgSend_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 getStateForContinuingWorkflowFromUserActivityUserInfo:completionHandler:];
}

id objc_msgSend_handleAuthorizationForExtensionWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 handleAuthorizationForExtensionWithCompletion:];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleOpenURL_fromSourceApplication_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 handleOpenURL:fromSourceApplication:errorHandler:];
}

id objc_msgSend_handleOpenURL_options_(void *a1, const char *a2, ...)
{
  return [a1 handleOpenURL:options:];
}

id objc_msgSend_handleShortcutItem_(void *a1, const char *a2, ...)
{
  return [a1 handleShortcutItem:];
}

id objc_msgSend_highlightAutomationWithTriggerID_(void *a1, const char *a2, ...)
{
  return [a1 highlightAutomationWithTriggerID:];
}

id objc_msgSend_importShortcutFileWithResult_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 importShortcutFileWithResult:options:completion:];
}

id objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:];
}

id objc_msgSend_initWithActionIdentifier_input_serializedParameters_processedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionIdentifier:input:serializedParameters:processedParameters:");
}

id objc_msgSend_initWithActivityType_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityType:];
}

id objc_msgSend_initWithComposeViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithComposeViewController:];
}

id objc_msgSend_initWithContainer_database_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainer:database:];
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return [a1 initWithDatabase:];
}

id objc_msgSend_initWithFile_suggestedName_sourceApplication_(void *a1, const char *a2, ...)
{
  return [a1 initWithFile:suggestedName:sourceApplication:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_initWithWorkflow_database_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkflow:database:];
}

id objc_msgSend_initializationResult(void *a1, const char *a2, ...)
{
  return _[a1 initializationResult];
}

id objc_msgSend_initializeProcessWithDatabase_(void *a1, const char *a2, ...)
{
  return [a1 initializeProcessWithDatabase:];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _[a1 input];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return _[a1 inputStream];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _[a1 interaction];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isIndexingAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isIndexingAvailable];
}

id objc_msgSend_isShortcutFileType_(void *a1, const char *a2, ...)
{
  return [a1 isShortcutFileType:];
}

id objc_msgSend_lastForegroundDate(void *a1, const char *a2, ...)
{
  return _[a1 lastForegroundDate];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return _[a1 launchedToTest];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScene(void *a1, const char *a2, ...)
{
  return _[a1 mainScene];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_mappedData(void *a1, const char *a2, ...)
{
  return _[a1 mappedData];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 moveItemAtURL:toURL:error:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openFile_sourceApplication_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openFile:sourceApplication:completionHandler:];
}

id objc_msgSend_openInPlace(void *a1, const char *a2, ...)
{
  return _[a1 openInPlace];
}

id objc_msgSend_openWorkflow_(void *a1, const char *a2, ...)
{
  return [a1 openWorkflow:];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingOpenURLContexts(void *a1, const char *a2, ...)
{
  return _[a1 pendingOpenURLContexts];
}

id objc_msgSend_pendingShortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 pendingShortcutItem];
}

id objc_msgSend_pendingUserActivity(void *a1, const char *a2, ...)
{
  return _[a1 pendingUserActivity];
}

id objc_msgSend_performRequest_(void *a1, const char *a2, ...)
{
  return [a1 performRequest:];
}

id objc_msgSend_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:");
}

id objc_msgSend_presentAlert_(void *a1, const char *a2, ...)
{
  return [a1 presentAlert:];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_processedParameters(void *a1, const char *a2, ...)
{
  return _[a1 processedParameters];
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_proposedSharedTemporaryFileURLForFilename_(void *a1, const char *a2, ...)
{
  return [a1 proposedSharedTemporaryFileURLForFilename:];
}

id objc_msgSend_proposedTemporaryFileURLForFilename_(void *a1, const char *a2, ...)
{
  return [a1 proposedTemporaryFileURLForFilename:];
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 publicCloudDatabase];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_readingIntentWithURL_options_(void *a1, const char *a2, ...)
{
  return [a1 readingIntentWithURL:options:];
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return _[a1 reference];
}

id objc_msgSend_referenceForWorkflowID_(void *a1, const char *a2, ...)
{
  return [a1 referenceForWorkflowID:];
}

id objc_msgSend_register(void *a1, const char *a2, ...)
{
  return _[a1 register];
}

id objc_msgSend_registerHandler_forIncomingRequestsWithAction_scheme_(void *a1, const char *a2, ...)
{
  return [a1 registerHandler:forIncomingRequestsWithAction:scheme:];
}

id objc_msgSend_registerHandoffURLRequestHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerHandoffURLRequestHandler:];
}

id objc_msgSend_registeredValueClasses(void *a1, const char *a2, ...)
{
  return _[a1 registeredValueClasses];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestSceneSessionDestruction:options:errorHandler:];
}

id objc_msgSend_requestWithURL_scheme_userInterface_bundleIdentifier_successHandler_failureHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:];
}

id objc_msgSend_runWorkflowFromState_source_(void *a1, const char *a2, ...)
{
  return [a1 runWorkflowFromState:source:];
}

id objc_msgSend_scene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 scene:continueUserActivity:];
}

id objc_msgSend_scene_handleUserActivityWithType_webpageURL_userInfo_interaction_(void *a1, const char *a2, ...)
{
  return [a1 scene:handleUserActivityWithType:webpageURL:userInfo:interaction:];
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return [a1 scene:openURLContexts:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_schemeNamed_(void *a1, const char *a2, ...)
{
  return [a1 schemeNamed:];
}

id objc_msgSend_serializedParameters(void *a1, const char *a2, ...)
{
  return _[a1 serializedParameters];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setLastForegroundDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastForegroundDate:];
}

id objc_msgSend_setPendingOpenURLContexts_(void *a1, const char *a2, ...)
{
  return [a1 setPendingOpenURLContexts:];
}

id objc_msgSend_setPendingShortcutItem_(void *a1, const char *a2, ...)
{
  return [a1 setPendingShortcutItem:];
}

id objc_msgSend_setPendingUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 setPendingUserActivity:];
}

id objc_msgSend_setPreferredStatusBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredStatusBarStyle:];
}

id objc_msgSend_setProcessedParameters_(void *a1, const char *a2, ...)
{
  return [a1 setProcessedParameters:];
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return [a1 setProvider:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return [a1 setShortcutItems:];
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return [a1 setSource:];
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setSuspended:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setValuesForKeysWithDictionary:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return [a1 setWindowLevel:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setupDatabaseForTesting(void *a1, const char *a2, ...)
{
  return _[a1 setupDatabaseForTesting];
}

id objc_msgSend_setupDebuggingForWindow_(void *a1, const char *a2, ...)
{
  return [a1 setupDebuggingForWindow:];
}

id objc_msgSend_setupSession_forEditingWorkflow_(void *a1, const char *a2, ...)
{
  return [a1 setupSession:forEditingWorkflow:];
}

id objc_msgSend_sharedAppGroupDirectoryURL(void *a1, const char *a2, ...)
{
  return _[a1 sharedAppGroupDirectoryURL];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return _[a1 sharedRegistry];
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItem];
}

id objc_msgSend_showAlertWithError_(void *a1, const char *a2, ...)
{
  return [a1 showAlertWithError:];
}

id objc_msgSend_sourceApplication(void *a1, const char *a2, ...)
{
  return _[a1 sourceApplication];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startListeningForDatabaseChanges(void *a1, const char *a2, ...)
{
  return _[a1 startListeningForDatabaseChanges];
}

id objc_msgSend_startLogStream(void *a1, const char *a2, ...)
{
  return _[a1 startLogStream];
}

id objc_msgSend_stateRestorationActivity(void *a1, const char *a2, ...)
{
  return _[a1 stateRestorationActivity];
}

id objc_msgSend_statusBarManager(void *a1, const char *a2, ...)
{
  return _[a1 statusBarManager];
}

id objc_msgSend_statusBarStyle(void *a1, const char *a2, ...)
{
  return _[a1 statusBarStyle];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_temporaryFileURLBySerializingUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 temporaryFileURLBySerializingUserInfo:];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_track(void *a1, const char *a2, ...)
{
  return _[a1 track];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeWithUTType_(void *a1, const char *a2, ...)
{
  return [a1 typeWithUTType:];
}

id objc_msgSend_uniqueVisibleReferenceForWorkflowName_(void *a1, const char *a2, ...)
{
  return [a1 uniqueVisibleReferenceForWorkflowName:];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _[a1 userActivities];
}

id objc_msgSend_userActivityForEditingWorkflow_(void *a1, const char *a2, ...)
{
  return [a1 userActivityForEditingWorkflow];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_wasAddedToWorkflow_(void *a1, const char *a2, ...)
{
  return [a1 wasAddedToWorkflow:];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _[a1 webpageURL];
}

id objc_msgSend_wfType(void *a1, const char *a2, ...)
{
  return _[a1 wfType];
}

id objc_msgSend_wf_isContainedByDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return [a1 wf_isContainedByDirectoryAtURL:];
}

id objc_msgSend_wf_isUserCancelledError(void *a1, const char *a2, ...)
{
  return [a1 wf_isUserCancelledError];
}

id objc_msgSend_wf_loadValuesFromCloudKitWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 wf_loadValuesFromCloudKitWithCompletion:];
}

id objc_msgSend_wf_scrollToTopAnimated_(void *a1, const char *a2, ...)
{
  return [a1 wf_scrollToTopAnimated:];
}

id objc_msgSend_wf_securelyArchivedDataWithRootObject_deletionResponsibility_(void *a1, const char *a2, ...)
{
  return [a1 wf_securelyArchivedDataWithRootObject:deletionResponsibility:];
}

id objc_msgSend_wf_securelyUnarchiveObjectWithData_allowedClasses_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:");
}

id objc_msgSend_wf_shortcutsAppHealthStore(void *a1, const char *a2, ...)
{
  return [a1 wf_shortcutsAppHealthStore];
}

id objc_msgSend_wf_shortcutsContainer(void *a1, const char *a2, ...)
{
  return [a1 wf_shortcutsContainer];
}

id objc_msgSend_willBeAddedToWorkflow_(void *a1, const char *a2, ...)
{
  return [a1 willBeAddedToWorkflow:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_workflow(void *a1, const char *a2, ...)
{
  return _[a1 workflow];
}

id objc_msgSend_workflowIdentifierFromUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 workflowIdentifierFromUserActivity:];
}

id objc_msgSend_workflowUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 workflowUserDefaults];
}

id objc_msgSend_workflowWithReference_database_error_(void *a1, const char *a2, ...)
{
  return [a1 workflowWithReference:database:error:];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}