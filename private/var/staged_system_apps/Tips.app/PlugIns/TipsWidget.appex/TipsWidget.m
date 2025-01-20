uint64_t sub_100001B50@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  long long v14;
  _OWORD v16[3];

  v4 = (int *)(type metadata accessor for HorizontalTipViewWithBody(0) - 8);
  __chkstk_darwin();
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = enum case for WidgetFamily.systemMedium(_:);
  v8 = sub_1000223A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v6, v7, v8);
  v9 = a1;
  sub_100021C18();
  v11 = v10;
  sub_100021C18();
  *(void *)&v6[v4[7]] = a1;
  *(void *)&v6[v4[8]] = v11;
  *(void *)&v6[v4[9]] = v12;
  sub_100021C18();
  sub_100021C18();
  sub_100022298();
  sub_100021C08();
  sub_10000239C((uint64_t)v6, a2);
  v13 = (_OWORD *)(a2 + *(int *)(sub_100001D88(&qword_10002C600) + 36));
  v14 = v16[1];
  *v13 = v16[0];
  v13[1] = v14;
  v13[2] = v16[2];
  return sub_100002400((uint64_t)v6);
}

uint64_t sub_100001CC4()
{
  return sub_1000220B8();
}

uint64_t sub_100001CE0@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v5 = *v1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v5;
  *a1 = sub_100002394;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;

  return _objc_retain_x1();
}

uint64_t variable initialization expression of TipsWidgetWrapperView._family@<X0>(uint64_t *a1@<X8>)
{
  return sub_100001F6C(&qword_10002C5E0, a1);
}

uint64_t sub_100001D64()
{
  return sub_100021DE8();
}

uint64_t sub_100001D88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of LargeTipView._colorScheme@<X0>(uint64_t *a1@<X8>)
{
  return sub_100001F6C(&qword_10002C5E8, a1);
}

uint64_t sub_100001DE0()
{
  return sub_100021CE8();
}

uint64_t sub_100001E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100001E94(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t variable initialization expression of LargeTipView._renderingMode@<X0>(uint64_t *a1@<X8>)
{
  return sub_100001F6C(&qword_10002C5F0, a1);
}

uint64_t sub_100001E44()
{
  return sub_100021DF8();
}

uint64_t sub_100001E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100001E94(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_100001E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t variable initialization expression of HorizontalTipViewWithBody.widgetContent()
{
  return 0;
}

uint64_t sub_100001F6C@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_100001D88(a1);

  return swift_storeEnumTagMultiPayload();
}

uint64_t variable initialization expression of DocumentEntry.relevance@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100022458();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t variable initialization expression of SquareTitleView._showsWidgetBackground()
{
  return swift_getKeyPath();
}

uint64_t sub_10000204C()
{
  sub_100021DD8();
  sub_100002720(&qword_10002C608, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_100021E48();
  return v1;
}

uint64_t sub_1000020C8@<X0>(unsigned char *a1@<X8>)
{
  sub_100021DD8();
  sub_100002720(&qword_10002C608, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  uint64_t result = sub_100021E48();
  *a1 = v3;
  return result;
}

uint64_t variable initialization expression of BackgroundGradient.endPoint()
{
  return 0;
}

__n128 sub_100002168(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002178(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002198(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void **initializeBufferWithCopyOfBuffer for MediumTipView(void **a1, void **a2)
{
  char v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for MediumTipView(id *a1)
{
}

void **assignWithCopy for MediumTipView(void **a1, void **a2)
{
  char v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *initializeWithTake for MediumTipView(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void **assignWithTake for MediumTipView(void **a1, void **a2)
{
  char v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MediumTipView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MediumTipView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediumTipView()
{
  return &type metadata for MediumTipView;
}

uint64_t sub_100002340()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000235C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100002394@<X0>(uint64_t a1@<X8>)
{
  return sub_100001B50(*(void **)(v1 + 16), a1);
}

uint64_t sub_10000239C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HorizontalTipViewWithBody(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100002400(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HorizontalTipViewWithBody(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_100002470(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_1000024BC()
{
  unint64_t result = qword_10002C618;
  if (!qword_10002C618)
  {
    sub_100002518(&qword_10002C620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C618);
  }
  return result;
}

uint64_t sub_100002518(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002560()
{
  return sub_100021B98();
}

uint64_t sub_1000025AC()
{
  return sub_100021B88();
}

Swift::Int sub_100002604()
{
  return sub_100022698();
}

uint64_t sub_10000266C()
{
  swift_getWitnessTable();

  return sub_100021B78();
}

uint64_t sub_1000026D8()
{
  return sub_100002720(&qword_10002CBA0, type metadata accessor for CFString);
}

uint64_t sub_100002720(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100002768()
{
  return sub_100002720(&qword_10002C628, type metadata accessor for CFString);
}

uint64_t sub_1000027B4()
{
  uint64_t v0 = sub_100021B48();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin();
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B10(v2, qword_10002E478);
  uint64_t v5 = sub_100005A74(v0, (uint64_t)qword_10002E478);
  v6 = self;
  id v7 = TPSAnalyticsLaunchTypeWidget;
  id v8 = [v6 URLWithTipIdentifier:0 collectionIdentifier:0 referrer:v7];

  sub_100021B28();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v4, v0);
}

uint64_t sub_1000028F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100001D88(&qword_10002C630);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001D88(&qword_10002CB80);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v27 - v9;
  uint64_t v11 = sub_1000223A8();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for WidgetFamily.accessoryCircular(_:), v11);
  sub_100005A2C(&qword_10002C720, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_1000224D8();
  sub_1000224D8();
  uint64_t v16 = v27[0];
  uint64_t v15 = v27[1];
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v15 != v16)
  {
    sub_100005BC8(a1, (uint64_t)v5, &qword_10002C630);
    uint64_t v17 = type metadata accessor for DocumentEntry();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v5, 1, v17) == 1)
    {
      sub_1000048C0((uint64_t)v5, &qword_10002C630);
    }
    else
    {
      v18 = *(void **)&v5[*(int *)(v17 + 24)];
      id v19 = v18;
      sub_100003B64((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      if (v18)
      {
        id v20 = [v19 URLWithReferrer:TPSAnalyticsLaunchTypeWidget];

        if (v20)
        {
          sub_100021B28();

          uint64_t v21 = sub_100021B48();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 0, 1, v21);
        }
        else
        {
          uint64_t v21 = sub_100021B48();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
        }
        sub_100005AAC((uint64_t)v8, (uint64_t)v10, &qword_10002CB80);
        sub_100021B48();
        uint64_t v26 = *(void *)(v21 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v10, 1, v21) != 1) {
          return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(a2, v10, v21);
        }
        goto LABEL_8;
      }
    }
    uint64_t v22 = sub_100021B48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v10, 1, 1, v22);
LABEL_8:
    sub_1000048C0((uint64_t)v10, &qword_10002CB80);
  }
  if (qword_10002C5C0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_100021B48();
  uint64_t v24 = sub_100005A74(v23, (uint64_t)qword_10002E478);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(a2, v24, v23);
}

uint64_t TipsWidgetWrapperView.family.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100002E90(&qword_10002C5E0, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_100002E18@<X0>(uint64_t a1@<X8>)
{
  return sub_100002E90(&qword_10002C5E0, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_100002E54@<X0>(uint64_t a1@<X8>)
{
  return sub_100002E90(&qword_10002C5E8, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_100002E90@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v22 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_100021E38();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001D88(a1);
  __chkstk_darwin();
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005BC8(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_100022518();
    id v20 = sub_100021F68();
    if (os_log_type_enabled(v20, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      *(void *)(v21 + 4) = sub_100005520(a3, v22, &v23);
      _os_log_impl((void *)&_mh_execute_header, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100021E28();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100003118@<X0>(uint64_t a1@<X8>)
{
  return sub_100002E90(&qword_10002C5F0, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x8000000100023D80, a1);
}

uint64_t sub_100003150(uint64_t a1, char a2)
{
  uint64_t v4 = sub_100021E38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100022518();
  uint64_t v9 = sub_100021F68();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_100005520(1819242306, 0xE400000000000000, &v12);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100021E28();
  swift_getAtKeyPath();
  sub_100005514(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

uint64_t TipsWidgetWrapperView.init(entry:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_100001D88(&qword_10002C5E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = type metadata accessor for TipsWidgetWrapperView();
  return sub_100005AAC(a1, (uint64_t)a2 + *(int *)(v4 + 20), &qword_10002C630);
}

uint64_t type metadata accessor for TipsWidgetWrapperView()
{
  uint64_t result = qword_10002C6D0;
  if (!qword_10002C6D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TipsWidgetWrapperView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v2 = sub_1000223A8();
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100001D88(&qword_10002CB80);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100001D88(&qword_10002C630);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unsigned __int8 v13 = (char *)&v30 - v12;
  uint64_t v14 = type metadata accessor for TipsWidgetView();
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (uint64_t *)((char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = sub_100001D88(&qword_10002C638);
  __chkstk_darwin(v32);
  os_log_type_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_100001D88(&qword_10002C640);
  uint64_t v31 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v21 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(int *)(type metadata accessor for TipsWidgetWrapperView() + 20);
  uint64_t v34 = v1;
  uint64_t v23 = v1 + v22;
  sub_100005BC8(v1 + v22, (uint64_t)v13, &qword_10002C630);
  *uint64_t v17 = swift_getKeyPath();
  sub_100001D88(&qword_10002C5E0);
  swift_storeEnumTagMultiPayload();
  sub_100005AAC((uint64_t)v13, (uint64_t)v17 + *(int *)(v15 + 28), &qword_10002C630);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100005BC8(v23, (uint64_t)v11, &qword_10002C630);
  uint64_t v25 = type metadata accessor for DocumentEntry();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v11, 1, v25) == 1)
  {
    sub_1000048C0((uint64_t)v11, &qword_10002C630);
    char v26 = 1;
  }
  else
  {
    char v26 = DocumentEntry.isPlaceholder.getter();
    sub_100003B64((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
  }
  sub_1000039F8((uint64_t)v17, (uint64_t)v19);
  v27 = &v19[*(int *)(v32 + 36)];
  *(void *)v27 = KeyPath;
  v27[8] = v26 & 1;
  sub_100003B64((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TipsWidgetView);
  sub_100002E90(&qword_10002C5E0, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v4);
  sub_1000028F8(v23, (uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v4, v36);
  uint64_t v28 = sub_100021B48();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v7, 0, 1, v28);
  sub_100003A5C();
  sub_100022078();
  sub_1000048C0((uint64_t)v7, &qword_10002CB80);
  sub_1000048C0((uint64_t)v19, &qword_10002C638);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(v37, v21, v33);
}

uint64_t sub_1000038C0@<X0>(unsigned char *a1@<X8>)
{
  sub_100005B74();
  uint64_t result = sub_100021E48();
  *a1 = v3;
  return result;
}

uint64_t sub_100003910@<X0>(unsigned char *a1@<X8>)
{
  sub_100005B74();
  uint64_t result = sub_100021E48();
  *a1 = v3;
  return result;
}

uint64_t sub_100003960()
{
  return sub_100021E58();
}

uint64_t sub_1000039AC()
{
  return sub_100021E58();
}

uint64_t sub_1000039F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TipsWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100003A5C()
{
  unint64_t result = qword_10002C648;
  if (!qword_10002C648)
  {
    sub_100002518(&qword_10002C638);
    sub_100005A2C(&qword_10002C650, (void (*)(uint64_t))type metadata accessor for TipsWidgetView);
    sub_100003B08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C648);
  }
  return result;
}

unint64_t sub_100003B08()
{
  unint64_t result = qword_10002C658;
  if (!qword_10002C658)
  {
    sub_100002518(&qword_10002C660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C658);
  }
  return result;
}

uint64_t sub_100003B64(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003BC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TipsWidgetWrapperView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000223A8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for DocumentEntry();
    uint64_t v13 = *((void *)v12 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_100001D88(&qword_10002C630);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_100021B68();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v11, v15);
      uint64_t v16 = v12[5];
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v11[v16];
      uint64_t v19 = sub_100022458();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = sub_100001D88(&qword_10002C668);
        memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
      uint64_t v22 = v12[6];
      uint64_t v23 = *(void **)&v11[v22];
      *(void *)&v10[v22] = v23;
      uint64_t v24 = v12[7];
      uint64_t v25 = *(void **)&v11[v24];
      *(void *)&v10[v24] = v25;
      char v26 = *(void (**)(char *, void, uint64_t, int *))(v13 + 56);
      id v27 = v23;
      id v28 = v25;
      v26(v10, 0, 1, v12);
    }
  }
  return a1;
}

void destroy for TipsWidgetWrapperView(uint64_t a1, uint64_t a2)
{
  sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000223A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = (int *)type metadata accessor for DocumentEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v6 - 1) + 48))(v5, 1, v6))
  {
    uint64_t v7 = sub_100021B68();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
    uint64_t v8 = v5 + v6[5];
    uint64_t v9 = sub_100022458();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }

    uint64_t v11 = *(void **)(v5 + v6[7]);
  }
}

void *initializeWithCopy for TipsWidgetWrapperView(void *a1, void *a2, uint64_t a3)
{
  sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000223A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v11 = *((void *)v10 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100001D88(&qword_10002C630);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v8, v9, v13);
    uint64_t v14 = v10[5];
    uint64_t v15 = &v8[v14];
    uint64_t v16 = &v9[v14];
    uint64_t v17 = sub_100022458();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_100001D88(&qword_10002C668);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v20 = v10[6];
    uint64_t v21 = *(void **)&v9[v20];
    *(void *)&v8[v20] = v21;
    uint64_t v22 = v10[7];
    uint64_t v23 = *(void **)&v9[v22];
    *(void *)&v8[v22] = v23;
    uint64_t v24 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
    id v25 = v21;
    id v26 = v23;
    v24(v8, 0, 1, v10);
  }
  return a1;
}

void *assignWithCopy for TipsWidgetWrapperView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E0);
    sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000223A8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_100003B64((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_12;
    }
    uint64_t v23 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v8, v9, v23);
    uint64_t v24 = v10[5];
    id v25 = &v8[v24];
    id v26 = &v9[v24];
    uint64_t v27 = sub_100022458();
    uint64_t v28 = *(void *)(v27 - 8);
    v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
    v49 = v25;
    LODWORD(v25) = v29(v25, 1, v27);
    int v30 = v29(v26, 1, v27);
    if (v25)
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v49, v26, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v49, 0, 1, v27);
        goto LABEL_23;
      }
      size_t v31 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v32 = v49;
    }
    else
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v49, v26, v27);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v49, v27);
      size_t v31 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v32 = v49;
    }
    memcpy(v32, v26, v31);
LABEL_23:
    uint64_t v40 = v10[6];
    v41 = *(void **)&v8[v40];
    v42 = *(void **)&v9[v40];
    *(void *)&v8[v40] = v42;
    id v43 = v42;

    uint64_t v44 = v10[7];
    v45 = *(void **)&v8[v44];
    v46 = *(void **)&v9[v44];
    *(void *)&v8[v44] = v46;
    id v47 = v46;

    return a1;
  }
  if (v14)
  {
LABEL_12:
    uint64_t v22 = sub_100001D88(&qword_10002C630);
    memcpy(v8, v9, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  uint64_t v15 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v8, v9, v15);
  uint64_t v16 = v10[5];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  uint64_t v19 = sub_100022458();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100001D88(&qword_10002C668);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v33 = v10[6];
  uint64_t v34 = *(void **)&v9[v33];
  *(void *)&v8[v33] = v34;
  uint64_t v35 = v10[7];
  uint64_t v36 = *(void **)&v9[v35];
  *(void *)&v8[v35] = v36;
  uint64_t v37 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
  id v38 = v34;
  id v39 = v36;
  v37(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1000048C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100001D88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for TipsWidgetWrapperView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000223A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100001D88(&qword_10002C630);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v14 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v9, v10, v14);
    uint64_t v15 = v11[5];
    uint64_t v16 = &v9[v15];
    uint64_t v17 = &v10[v15];
    uint64_t v18 = sub_100022458();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = sub_100001D88(&qword_10002C668);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    *(void *)&v9[v11[6]] = *(void *)&v10[v11[6]];
    *(void *)&v9[v11[7]] = *(void *)&v10[v11[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

char *assignWithTake for TipsWidgetWrapperView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E0);
    uint64_t v6 = sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000223A8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_100003B64((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_11;
    }
    uint64_t v24 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v9, v10, v24);
    uint64_t v25 = v11[5];
    id v26 = &v9[v25];
    uint64_t v27 = &v10[v25];
    uint64_t v28 = sub_100022458();
    uint64_t v29 = *(void *)(v28 - 8);
    int v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
    id v39 = v26;
    LODWORD(v26) = v30(v26, 1, v28);
    int v31 = v30(v27, 1, v28);
    if (v26)
    {
      if (!v31)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v39, v27, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v39, 0, 1, v28);
        goto LABEL_22;
      }
      size_t v32 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v33 = v39;
    }
    else
    {
      if (!v31)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v39, v27, v28);
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v28);
      size_t v32 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v33 = v39;
    }
    memcpy(v33, v27, v32);
LABEL_22:
    uint64_t v34 = v11[6];
    uint64_t v35 = *(void **)&v9[v34];
    *(void *)&v9[v34] = *(void *)&v10[v34];

    uint64_t v36 = v11[7];
    uint64_t v37 = *(void **)&v9[v36];
    *(void *)&v9[v36] = *(void *)&v10[v36];

    return a1;
  }
  if (v15)
  {
LABEL_11:
    uint64_t v23 = sub_100001D88(&qword_10002C630);
    memcpy(v9, v10, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  uint64_t v16 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v9, v10, v16);
  uint64_t v17 = v11[5];
  uint64_t v18 = &v9[v17];
  uint64_t v19 = &v10[v17];
  uint64_t v20 = sub_100022458();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = sub_100001D88(&qword_10002C668);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(void *)&v9[v11[6]] = *(void *)&v10[v11[6]];
  *(void *)&v9[v11[7]] = *(void *)&v10[v11[7]];
  (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for TipsWidgetWrapperView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000510C);
}

uint64_t sub_10000510C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C670);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100001D88(&qword_10002C630);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for TipsWidgetWrapperView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005220);
}

uint64_t sub_100005220(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100001D88(&qword_10002C670);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100001D88(&qword_10002C630);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_10000532C()
{
  sub_100005454(319, &qword_10002C6E0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_100005454(319, (unint64_t *)&unk_10002C6E8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentEntry, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100005454(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1000054B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005514(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100005520(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1000055F4(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005744((uint64_t)v12, *a3);
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
      sub_100005744((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000056F4((uint64_t)v12);
  return v7;
}

unint64_t sub_1000055F4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_1000057A0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_100022628();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000056F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005744(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_1000057A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_100005838(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000593C(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000593C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100005838(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_1000058D4(v2, 0);
      unint64_t result = (void *)sub_100022618();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1000224C8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000058D4(uint64_t a1, uint64_t a2)
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
  sub_100001D88(&qword_10002C718);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000593C(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100001D88(&qword_10002C718);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100005A2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005A74(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005AAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100001D88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100005B10(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100005B74()
{
  unint64_t result = qword_10002C728;
  if (!qword_10002C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C728);
  }
  return result;
}

uint64_t sub_100005BC8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100001D88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

double sub_100005C2C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100021C28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  int64_t v9 = &v33[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  double v13 = *(double *)(a2 + 8);
  sub_100021C18();
  double v15 = v14;
  sub_1000093B8(a2, (uint64_t)&v33[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v17 = (v12 + *(unsigned __int8 *)(v7 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = swift_allocObject();
  sub_100009DE0((uint64_t)&v33[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)], v18 + v16, type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 32))(v18 + v17, v9, v6);
  sub_100021C18();
  double v20 = v19;
  sub_100021C18();
  double v22 = v21;
  sub_100021C18();
  sub_100022298();
  if (v20 > v22)
  {
    sub_100022518();
    uint64_t v23 = (void *)sub_100021F68();
    sub_100021BA8();
  }
  sub_100021CC8();
  uint64_t v24 = v37;
  char v25 = v38;
  uint64_t v26 = v39;
  char v27 = v40;
  uint64_t v28 = v41;
  uint64_t v29 = v43;
  uint64_t v30 = v45;
  uint64_t v31 = v47;
  char v36 = v42;
  char v35 = v44;
  char v34 = v46;
  v33[0] = v48;
  *(void *)a3 = 0x3FF0000000000000;
  *(double *)(a3 + 8) = 1.0 - v13 / v15;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = sub_10000877C;
  *(void *)(a3 + 32) = v18;
  *(void *)(a3 + 40) = v24;
  *(unsigned char *)(a3 + 48) = v25;
  *(void *)(a3 + 56) = v26;
  *(unsigned char *)(a3 + 64) = v27;
  *(void *)(a3 + 72) = v28;
  *(unsigned char *)(a3 + 80) = v36;
  *(void *)(a3 + 88) = v29;
  *(unsigned char *)(a3 + 96) = v35;
  *(void *)(a3 + 104) = v30;
  *(unsigned char *)(a3 + 112) = v34;
  *(void *)(a3 + 120) = v31;
  *(unsigned char *)(a3 + 128) = v33[0];
  double result = *(double *)&v49;
  *(_OWORD *)(a3 + 136) = v49;
  return result;
}

uint64_t sub_100005FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_100021ED8();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = sub_100001D88(&qword_10002C8C8);
  return sub_100006048(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_100006048@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = type metadata accessor for HorizontalTipViewWithBody(0);
  uint64_t v4 = (int *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100001D88(&qword_10002C8D0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v39 = (uint64_t)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v40 = (uint64_t)&v38 - v10;
  uint64_t v11 = sub_100021BD8();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  double v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ImageView(0);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v38 = (uint64_t)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  double v20 = (char *)&v38 - v19;
  double v21 = *(void **)(a1 + 16);
  uint64_t v22 = type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1 + *(int *)(v22 + 24), v11);
  *(void *)double v20 = swift_getKeyPath();
  v20[8] = 0;
  *((void *)v20 + 2) = v21;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v20[*(int *)(v16 + 32)], v14, v11);
  uint64_t v23 = enum case for WidgetFamily.systemLarge(_:);
  uint64_t v24 = sub_1000223A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v6, v23, v24);
  char v25 = *(void **)(a1 + 16);
  id v26 = v25;
  id v27 = v21;
  sub_100021C18();
  double v28 = *(double *)(a1 + 8);
  *(void *)&v6[v4[7]] = v25;
  *(void *)&v6[v4[8]] = v29;
  *(double *)&v6[v4[9]] = v28;
  sub_100021C18();
  double v31 = v30;
  sub_1000222A8();
  uint64_t v32 = v39;
  sub_100006464(0.0, 1, 0.0, 1, v31, 0, v28, 0, v39, 0.0, 1, v28, 0);
  sub_100009420((uint64_t)v6, type metadata accessor for HorizontalTipViewWithBody);
  uint64_t v33 = v40;
  sub_100005AAC(v32, v40, &qword_10002C8D0);
  uint64_t v34 = v38;
  sub_1000093B8((uint64_t)v20, v38, type metadata accessor for ImageView);
  sub_100005BC8(v33, v32, &qword_10002C8D0);
  uint64_t v35 = v41;
  sub_1000093B8(v34, v41, type metadata accessor for ImageView);
  uint64_t v36 = sub_100001D88(&qword_10002C8D8);
  sub_100005BC8(v32, v35 + *(int *)(v36 + 48), &qword_10002C8D0);
  sub_1000048C0(v33, &qword_10002C8D0);
  sub_100009420((uint64_t)v20, type metadata accessor for ImageView);
  sub_1000048C0(v32, &qword_10002C8D0);
  return sub_100009420(v34, type metadata accessor for ImageView);
}

__n128 sub_100006464@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100022518();
    uint64_t v23 = (void *)sub_100021F68();
    sub_100021BA8();
  }
  sub_100021CC8();
  sub_1000093B8(v13, a9, type metadata accessor for HorizontalTipViewWithBody);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100001D88(&qword_10002C8D0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 sub_100006630@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100022518();
    uint64_t v23 = (void *)sub_100021F68();
    sub_100021BA8();
  }
  sub_100021CC8();
  uint64_t v24 = sub_100001D88(&qword_10002C9C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  char v25 = (_OWORD *)(a9 + *(int *)(sub_100001D88(&qword_10002C9C8) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *char v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

double sub_10000681C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100006878(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10002C8E0, &qword_10002C8E8).n128_u64[0];
  return result;
}

__n128 sub_100006878@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100022518();
    long long v28 = (void *)sub_100021F68();
    sub_100021BA8();

    uint64_t v19 = a17;
  }
  sub_100021CC8();
  sub_100005BC8(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(sub_100001D88(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *long long v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_100006A48@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100022518();
    uint64_t v23 = (void *)sub_100021F68();
    sub_100021BA8();
  }
  sub_100021CC8();
  long long v24 = v13[13];
  a9[12] = v13[12];
  a9[13] = v24;
  long long v25 = v13[14];
  long long v26 = v13[9];
  a9[8] = v13[8];
  a9[9] = v26;
  long long v27 = v13[11];
  a9[10] = v13[10];
  a9[11] = v27;
  long long v28 = v13[5];
  a9[4] = v13[4];
  a9[5] = v28;
  long long v29 = v13[7];
  a9[6] = v13[6];
  a9[7] = v29;
  long long v30 = v13[1];
  *a9 = *v13;
  a9[1] = v30;
  long long v31 = v13[3];
  a9[2] = v13[2];
  a9[3] = v31;
  a9[18] = v36;
  a9[19] = v37;
  a9[20] = v38;
  a9[21] = v39;
  a9[14] = v25;
  a9[15] = v33;
  a9[16] = v34;
  a9[17] = v35;

  return sub_100009B54((uint64_t)v13);
}

double sub_100006C2C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_100006878(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10002C8F0, &qword_10002C8F8).n128_u64[0];
  return result;
}

uint64_t sub_100006C88@<X0>(uint64_t a1@<X0>, double (**a2)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000093B8(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_100009DE0((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
  *a2 = sub_100008584;
  a2[1] = (double (*)@<D0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t LargeTipView.init(widgetContent:unitSize:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  *a2 = swift_getKeyPath();
  sub_100001D88(&qword_10002C5E8);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (int *)type metadata accessor for LargeTipView(0);
  uint64_t v9 = (uint64_t *)((char *)a2 + v8[5]);
  uint64_t *v9 = swift_getKeyPath();
  sub_100001D88(&qword_10002C5F0);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)a2 + v8[6]) = a1;
  uint64_t v11 = (double *)((char *)a2 + v8[7]);
  *uint64_t v11 = a3;
  v11[1] = a4;
  return result;
}

uint64_t type metadata accessor for LargeTipView(uint64_t a1)
{
  return sub_100008870(a1, (uint64_t *)&unk_10002C7B8);
}

uint64_t LargeTipView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = sub_100022378();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = sub_100001D88(&qword_10002C730);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (uint64_t *)((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v28 = sub_100001D88(&qword_10002C738);
  __chkstk_darwin(v28);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for LargeTipView(0);
  uint64_t v15 = (uint64_t *)(v1 + *(int *)(v14 + 28));
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = *(void **)(v1 + *(int *)(v14 + 24));
  uint64_t v19 = (uint64_t)v11 + *(int *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) + 24);
  id v20 = v18;
  sub_100002E54(v19);
  *uint64_t v11 = v16;
  v11[1] = v17;
  v11[2] = v18;
  sub_100003118((uint64_t)v8);
  sub_100022368();
  sub_100008038(&qword_10002C740, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  LOBYTE(v14) = sub_100022488();
  double v21 = *(void (**)(char *, uint64_t))(v3 + 8);
  v21(v6, v2);
  v21(v8, v2);
  uint64_t v22 = 0;
  if ((v14 & 1) == 0)
  {
    sub_100007174();
    sub_100022558();
    uint64_t v22 = sub_1000221B8();
  }
  uint64_t v23 = sub_1000222A8();
  uint64_t v25 = v24;
  sub_100005BC8((uint64_t)v11, (uint64_t)v13, &qword_10002C730);
  long long v26 = (uint64_t *)&v13[*(int *)(v28 + 36)];
  *long long v26 = v22;
  v26[1] = v23;
  v26[2] = v25;
  sub_1000048C0((uint64_t)v11, &qword_10002C730);
  return sub_100005AAC((uint64_t)v13, v29, &qword_10002C738);
}

uint64_t type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(uint64_t a1)
{
  return sub_100008870(a1, qword_10002C888);
}

unint64_t sub_100007174()
{
  unint64_t result = qword_10002C748;
  if (!qword_10002C748)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002C748);
  }
  return result;
}

uint64_t sub_1000071B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for LargeTipView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100001D88(&qword_10002C5E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100021BD8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100001D88(&qword_10002C5F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100022378();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + v13) = (uint64_t)v15;
    *(_OWORD *)((char *)a1 + v14) = *(_OWORD *)((char *)a2 + v14);
    id v16 = v15;
  }
  return a1;
}

void destroy for LargeTipView(uint64_t a1, uint64_t a2)
{
  sub_100001D88(&qword_10002C5E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100021BD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100022378();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = *(void **)(a1 + *(int *)(a2 + 24));
}

void *initializeWithCopy for LargeTipView(void *a1, void *a2, int *a3)
{
  sub_100001D88(&qword_10002C5E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100021BD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100022378();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v13;
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  id v14 = v13;
  return a1;
}

void *assignWithCopy for LargeTipView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E8);
    sub_100001D88(&qword_10002C5E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100021BD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1000048C0((uint64_t)a1 + v7, &qword_10002C5F0);
    sub_100001D88(&qword_10002C5F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100022378();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)((char *)a1 + v11);
  uint64_t v13 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v13;
  id v14 = v13;

  uint64_t v15 = a3[7];
  id v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *id v16 = *v17;
  v16[1] = v17[1];
  return a1;
}

char *initializeWithTake for LargeTipView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C5E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100021BD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100022378();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  return a1;
}

char *assignWithTake for LargeTipView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E8);
    uint64_t v6 = sub_100001D88(&qword_10002C5E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100021BD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_1000048C0((uint64_t)&a1[v8], &qword_10002C5F0);
    uint64_t v11 = sub_100001D88(&qword_10002C5F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100022378();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  id v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

uint64_t getEnumTagSinglePayload for LargeTipView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007B34);
}

uint64_t sub_100007B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C750);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100001D88(&qword_10002C758);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for LargeTipView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007C70);
}

uint64_t sub_100007C70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100001D88(&qword_10002C750);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100001D88(&qword_10002C758);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100007D88()
{
  sub_100007E9C(319, &qword_10002C7C8, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v0 <= 0x3F)
  {
    sub_100007E9C(319, (unint64_t *)&unk_10002C7D0, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100007E9C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100021BE8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_100007EF4()
{
  unint64_t result = qword_10002C808;
  if (!qword_10002C808)
  {
    sub_100002518(&qword_10002C738);
    sub_100007F94();
    sub_100009C94(&qword_10002C820, &qword_10002C828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C808);
  }
  return result;
}

unint64_t sub_100007F94()
{
  unint64_t result = qword_10002C810;
  if (!qword_10002C810)
  {
    sub_100002518(&qword_10002C730);
    sub_100008038(&qword_10002C818, (void (*)(uint64_t))type metadata accessor for LargeTipView.LargeTipWidgetConfiguration);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C810);
  }
  return result;
}

uint64_t sub_100008038(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_100008080(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = (void *)a2[2];
    a1[2] = (uint64_t)v5;
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100021BD8();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    id v11 = v5;
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_10000816C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100021BD8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1000081E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100021BD8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  id v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void *sub_100008280(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = (void *)a1[2];
  uint64_t v7 = (void *)a2[2];
  a1[2] = v7;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 24);
  id v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100021BD8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_100008320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1000083A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100008438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000844C);
}

uint64_t sub_100008450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008464);
}

uint64_t sub_100008468()
{
  return sub_100009A64();
}

uint64_t sub_100008474()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008490()
{
  unint64_t v1 = (int *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

double sub_100008584@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100005C2C(a1, v6, a2);
}

uint64_t sub_100008604()
{
  unint64_t v1 = (int *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_100021C28();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  uint64_t v11 = v0 + v3;

  uint64_t v12 = v11 + v1[8];
  uint64_t v13 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_10000877C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for LargeTipView.LargeTipWidgetConfiguration(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_100021C28();

  return sub_100005FEC(v1 + v4, a1);
}

uint64_t type metadata accessor for ImageView(uint64_t a1)
{
  return sub_100008870(a1, qword_10002C958);
}

uint64_t sub_100008870(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000088A8()
{
  uint64_t v0 = sub_100021BD8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100022318();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100022308();
  sub_100022348();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v8 = [objc_allocWithZone((Class)type metadata accessor for Assets()) init];
  id v9 = sub_10000B888();
  uint64_t v11 = v10;

  type metadata accessor for ImageView(0);
  uint64_t v12 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  v12(v3, enum case for ColorScheme.light(_:), v0);
  LOBYTE(v8) = sub_100021BC8();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v3, v0);
  if ((v8 & 1) == 0 || !v9)
  {
    v12(v3, enum case for ColorScheme.dark(_:), v0);
    char v15 = sub_100021BC8();
    v13(v3, v0);
    if (v15)
    {
      if (v11)
      {
        id v16 = v11;
        uint64_t v14 = sub_1000221C8();

        return v14;
      }
    }
    else
    {
    }
    return 0;
  }
  uint64_t v14 = sub_1000221C8();

  return v14;
}

double sub_100008B48@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ImageView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = sub_1000088A8();
  if (v7)
  {
    uint64_t v8 = v7;
    sub_1000093B8(a1, (uint64_t)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ImageView);
    unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    sub_100009DE0((uint64_t)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, type metadata accessor for ImageView);
    id v16 = sub_100009E48;
    uint64_t v17 = v10;
    char v18 = 0;
  }
  else
  {
    id v11 = [self whiteColor];
    sub_1000221B8();
    uint64_t v12 = sub_100022168();
    swift_release();
    id v16 = (uint64_t (*)@<X0>(uint64_t@<X8>))v12;
    uint64_t v17 = 0;
    char v18 = 1;
  }
  sub_100001D88(&qword_10002C9A8);
  sub_100009C94(&qword_10002C9B0, &qword_10002C9A8);
  sub_100021F38();
  double result = *(double *)&v19;
  char v14 = v20;
  *(_OWORD *)a2 = v19;
  *(unsigned char *)(a2 + 16) = v14;
  return result;
}

uint64_t sub_100008D3C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v55 = a2;
  uint64_t v2 = sub_100021EC8();
  uint64_t v53 = *(void *)(v2 - 8);
  uint64_t v54 = v2;
  __chkstk_darwin(v2);
  v52 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100001D88(&qword_10002C9B8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000221D8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100001D88(&qword_10002C9C0);
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100001D88(&qword_10002C9C8);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100001D88(&qword_10002C9D0);
  __chkstk_darwin(v17);
  long long v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100001D88(&qword_10002C9D8);
  uint64_t v20 = __chkstk_darwin(v50);
  v51 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  long long v49 = (char *)&v45 - v22;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
  sub_100022218();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100022388();
  uint64_t v23 = sub_100022398();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 0, 1, v23);
  sub_100022208();
  swift_release();
  sub_1000048C0((uint64_t)v6, &qword_10002C9B8);
  sub_100021C18();
  double v25 = v24;
  sub_100021C18();
  double v27 = v26;
  sub_1000222A8();
  __n128 v28 = sub_100006630(0.0, 1, 0.0, 1, v25, 0, 0.0, 1, (uint64_t)v16, 0.0, 1, v27, 0);
  (*(void (**)(char *, uint64_t, __n128))(v46 + 8))(v13, v47, v28);
  sub_100005BC8((uint64_t)v16, (uint64_t)v19, &qword_10002C9C8);
  uint64_t v29 = &v19[*(int *)(v17 + 36)];
  *(void *)uint64_t v29 = 0;
  *((_WORD *)v29 + 4) = 257;
  sub_1000048C0((uint64_t)v16, &qword_10002C9C8);
  long long v30 = *(void **)(v48 + 16);
  if (!v30) {
    goto LABEL_5;
  }
  id v31 = [v30 assets];
  long long v32 = v31;
  if (!v31)
  {
LABEL_6:
    unint64_t v35 = 0xE000000000000000;
    goto LABEL_7;
  }
  id v33 = [v31 alt];

  if (!v33)
  {
LABEL_5:
    long long v32 = 0;
    goto LABEL_6;
  }
  long long v32 = (void *)sub_100022498();
  unint64_t v35 = v34;

LABEL_7:
  v56 = v32;
  unint64_t v57 = v35;
  sub_100009ECC();
  uint64_t v36 = sub_100022048();
  uint64_t v38 = v37;
  char v40 = v39 & 1;
  sub_100009F20();
  uint64_t v41 = (uint64_t)v51;
  sub_1000220E8();
  sub_10000A030(v36, v38, v40);
  swift_bridgeObjectRelease();
  sub_1000048C0((uint64_t)v19, &qword_10002C9D0);
  char v42 = v52;
  sub_100021EB8();
  uint64_t v43 = (uint64_t)v49;
  sub_100021C78();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v54);
  sub_1000048C0(v41, &qword_10002C9D8);
  return sub_100005AAC(v43, v55, &qword_10002C9D8);
}

double sub_100009320@<D0>(uint64_t a1@<X8>)
{
  sub_100008B48(v1, (uint64_t)&v5);
  char v3 = v6;
  double result = *(double *)&v5;
  *(_OWORD *)a1 = v5;
  *(unsigned char *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100009364@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100021D18();
  *a1 = v3;
  return result;
}

uint64_t sub_100009390()
{
  return sub_100021D28();
}

uint64_t sub_1000093B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009420(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100009480(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_100009588(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = *(void **)(a2 + 16);
    *(void *)(a1 + 16) = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = a1 + v10;
    uint64_t v12 = a2 + v10;
    uint64_t v13 = sub_100021BD8();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    id v15 = v9;
    v14(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_100009588(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100009594(uint64_t a1, uint64_t a2)
{
  sub_100005514(*(void *)a1, *(unsigned char *)(a1 + 8));

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100021BD8();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100009618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100009588(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  char v8 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100021BD8();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  id v14 = v8;
  v13(v10, v11, v12);
  return a1;
}

uint64_t sub_1000096D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100009588(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005514(v8, v9);
  uint64_t v10 = *(void **)(a1 + 16);
  uint64_t v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t sub_100009790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10000981C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005514(v8, v9);
  uint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1000098C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000098D8);
}

uint64_t sub_1000098DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100021BD8();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_100009998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000099AC);
}

uint64_t sub_1000099B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v7 = sub_100021BD8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100009A58()
{
  return sub_100009A64();
}

uint64_t sub_100009A64()
{
  uint64_t result = sub_100021BD8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100009AFC()
{
  return sub_100009C94(&qword_10002C998, &qword_10002C9A0);
}

uint64_t sub_100009B38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009B54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  char v7 = *(unsigned char *)(a1 + 120);
  uint64_t v10 = *(void *)(a1 + 144);
  uint64_t v11 = *(void *)(a1 + 136);
  char v9 = *(unsigned char *)(a1 + 152);
  sub_100009C84(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_100009C84(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_100009C84(v6, v5, v7);
  swift_bridgeObjectRetain();
  sub_100009C84(v11, v10, v9);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100009C84(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100009C94(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002518(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009CD8()
{
  unint64_t v1 = (int *)(type metadata accessor for ImageView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  uint64_t v6 = v0 + v3;
  sub_100005514(*(void *)v6, *(unsigned char *)(v6 + 8));

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_100021BD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100009DE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009E48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ImageView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100008D3C(v4, a1);
}

unint64_t sub_100009ECC()
{
  unint64_t result = qword_10002C9E0;
  if (!qword_10002C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C9E0);
  }
  return result;
}

unint64_t sub_100009F20()
{
  unint64_t result = qword_10002C9E8;
  if (!qword_10002C9E8)
  {
    sub_100002518(&qword_10002C9D0);
    sub_100009F9C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C9E8);
  }
  return result;
}

unint64_t sub_100009F9C()
{
  unint64_t result = qword_10002C9F0;
  if (!qword_10002C9F0)
  {
    sub_100002518(&qword_10002C9C8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C9F0);
  }
  return result;
}

uint64_t sub_10000A030(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000A044()
{
  unint64_t result = qword_10002C9F8;
  if (!qword_10002C9F8)
  {
    sub_100002518(&qword_10002CA00);
    sub_10000A0B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C9F8);
  }
  return result;
}

unint64_t sub_10000A0B8()
{
  unint64_t result = qword_10002CA08;
  if (!qword_10002CA08)
  {
    sub_100002518(&qword_10002CA10);
    sub_100009C94(&qword_10002C9B0, &qword_10002C9A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CA08);
  }
  return result;
}

void *sub_10000A15C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A660((uint64_t)a1);
    sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000223A8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  char v9 = (char *)a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_10000B5A0((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_12;
    }
    uint64_t v23 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v8, v9, v23);
    uint64_t v24 = v10[5];
    double v25 = &v8[v24];
    double v26 = &v9[v24];
    uint64_t v27 = sub_100022458();
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
    long long v49 = v25;
    LODWORD(v25) = v29(v25, 1, v27);
    int v30 = v29(v26, 1, v27);
    if (v25)
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v49, v26, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v49, 0, 1, v27);
        goto LABEL_23;
      }
      size_t v31 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      long long v32 = v49;
    }
    else
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v49, v26, v27);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v49, v27);
      size_t v31 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      long long v32 = v49;
    }
    memcpy(v32, v26, v31);
LABEL_23:
    uint64_t v40 = v10[6];
    uint64_t v41 = *(void **)&v8[v40];
    char v42 = *(void **)&v9[v40];
    *(void *)&v8[v40] = v42;
    id v43 = v42;

    uint64_t v44 = v10[7];
    uint64_t v45 = *(void **)&v8[v44];
    uint64_t v46 = *(void **)&v9[v44];
    *(void *)&v8[v44] = v46;
    id v47 = v46;

    return a1;
  }
  if (v14)
  {
LABEL_12:
    uint64_t v22 = sub_100001D88(&qword_10002C630);
    memcpy(v8, v9, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  uint64_t v15 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v8, v9, v15);
  uint64_t v16 = v10[5];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  uint64_t v19 = sub_100022458();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100001D88(&qword_10002C668);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v33 = v10[6];
  unint64_t v34 = *(void **)&v9[v33];
  *(void *)&v8[v33] = v34;
  uint64_t v35 = v10[7];
  uint64_t v36 = *(void **)&v9[v35];
  *(void *)&v8[v35] = v36;
  uint64_t v37 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
  id v38 = v34;
  id v39 = v36;
  v37(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_10000A660(uint64_t a1)
{
  uint64_t v2 = sub_100001D88(&qword_10002C5E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10000A6C0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A660((uint64_t)a1);
    uint64_t v6 = sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000223A8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  char v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v12 = *((void *)v11 - 1);
  int v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_10000B5A0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_11;
    }
    uint64_t v24 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v9, v10, v24);
    uint64_t v25 = v11[5];
    double v26 = &v9[v25];
    uint64_t v27 = &v10[v25];
    uint64_t v28 = sub_100022458();
    uint64_t v29 = *(void *)(v28 - 8);
    int v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
    id v39 = v26;
    LODWORD(v26) = v30(v26, 1, v28);
    int v31 = v30(v27, 1, v28);
    if (v26)
    {
      if (!v31)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v39, v27, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v39, 0, 1, v28);
        goto LABEL_22;
      }
      size_t v32 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v33 = v39;
    }
    else
    {
      if (!v31)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v39, v27, v28);
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v28);
      size_t v32 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v33 = v39;
    }
    memcpy(v33, v27, v32);
LABEL_22:
    uint64_t v34 = v11[6];
    uint64_t v35 = *(void **)&v9[v34];
    *(void *)&v9[v34] = *(void *)&v10[v34];

    uint64_t v36 = v11[7];
    uint64_t v37 = *(void **)&v9[v36];
    *(void *)&v9[v36] = *(void *)&v10[v36];

    return a1;
  }
  if (v15)
  {
LABEL_11:
    uint64_t v23 = sub_100001D88(&qword_10002C630);
    memcpy(v9, v10, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  uint64_t v16 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v9, v10, v16);
  uint64_t v17 = v11[5];
  uint64_t v18 = &v9[v17];
  uint64_t v19 = &v10[v17];
  uint64_t v20 = sub_100022458();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = sub_100001D88(&qword_10002C668);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(void *)&v9[v11[6]] = *(void *)&v10[v11[6]];
  *(void *)&v9[v11[7]] = *(void *)&v10[v11[7]];
  (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_10000ABBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000ABD0);
}

uint64_t sub_10000ABD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C670);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100001D88(&qword_10002C630);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10000ACD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000ACE4);
}

uint64_t sub_10000ACE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100001D88(&qword_10002C670);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100001D88(&qword_10002C630);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for TipsWidgetView()
{
  uint64_t result = qword_10002CA70;
  if (!qword_10002CA70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000AE3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AE58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v34 = type metadata accessor for SystemWidgetView();
  uint64_t v3 = __chkstk_darwin(v34);
  uint64_t v5 = (uint64_t *)((char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v29 = (uint64_t)&v29 - v6;
  uint64_t v30 = sub_100001D88(&qword_10002CAA8);
  __chkstk_darwin(v30);
  uint64_t v32 = (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100001D88(&qword_10002C630);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for RectangularWidgetView();
  uint64_t v11 = __chkstk_darwin(v31);
  uint64_t v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v16 = sub_1000223A8();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002E18((uint64_t)v19);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  int v21 = enum case for WidgetFamily.accessoryRectangular(_:);
  uint64_t v22 = type metadata accessor for TipsWidgetView();
  sub_10000B3A8(a1 + *(int *)(v22 + 20), (uint64_t)v10);
  uint64_t KeyPath = swift_getKeyPath();
  if (v20 == v21)
  {
    *uint64_t v13 = KeyPath;
    sub_100001D88(&qword_10002C5E0);
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = v31;
    uint64_t v25 = (uint64_t *)((char *)v13 + *(int *)(v31 + 20));
    *uint64_t v25 = swift_getKeyPath();
    sub_100001D88(&qword_10002C5F0);
    swift_storeEnumTagMultiPayload();
    double v26 = (char *)v13 + *(int *)(v24 + 24);
    *(void *)double v26 = swift_getKeyPath();
    v26[8] = 0;
    sub_10000B414((uint64_t)v10, (uint64_t)v13 + *(int *)(v24 + 28));
    sub_10000B4D0((uint64_t)v13, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for RectangularWidgetView);
    sub_10000B538((uint64_t)v15, v32, (uint64_t (*)(void))type metadata accessor for RectangularWidgetView);
    swift_storeEnumTagMultiPayload();
    sub_10000B47C(&qword_10002CAB0, (void (*)(uint64_t))type metadata accessor for RectangularWidgetView);
    sub_10000B47C(&qword_10002CAB8, (void (*)(uint64_t))type metadata accessor for SystemWidgetView);
    sub_100021F38();
    return sub_10000B5A0((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for RectangularWidgetView);
  }
  else
  {
    *uint64_t v5 = KeyPath;
    sub_100001D88(&qword_10002C5E0);
    swift_storeEnumTagMultiPayload();
    sub_10000B414((uint64_t)v10, (uint64_t)v5 + *(int *)(v34 + 20));
    uint64_t v28 = v29;
    sub_10000B4D0((uint64_t)v5, v29, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    sub_10000B538(v28, v32, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    swift_storeEnumTagMultiPayload();
    sub_10000B47C(&qword_10002CAB0, (void (*)(uint64_t))type metadata accessor for RectangularWidgetView);
    sub_10000B47C(&qword_10002CAB8, (void (*)(uint64_t))type metadata accessor for SystemWidgetView);
    sub_100021F38();
    sub_10000B5A0(v28, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

uint64_t sub_10000B3A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AE58(v1, a1);
}

uint64_t sub_10000B3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001D88(&qword_10002C630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B414(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001D88(&qword_10002C630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B47C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000B4D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B538(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B5A0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000B604()
{
  unint64_t result = qword_10002CAC0;
  if (!qword_10002CAC0)
  {
    sub_100002518(&qword_10002CAC8);
    sub_10000B678();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAC0);
  }
  return result;
}

unint64_t sub_10000B678()
{
  unint64_t result = qword_10002CAD0;
  if (!qword_10002CAD0)
  {
    sub_100002518(&qword_10002CAD8);
    sub_10000B47C(&qword_10002CAB0, (void (*)(uint64_t))type metadata accessor for RectangularWidgetView);
    sub_10000B47C(&qword_10002CAB8, (void (*)(uint64_t))type metadata accessor for SystemWidgetView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CAD0);
  }
  return result;
}

id Assets.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

unint64_t sub_10000B788(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100001D88((uint64_t *)&unk_10002CBB0);
  uint64_t v2 = (void *)sub_100022638();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 40);
  while (1)
  {
    char v5 = *(unsigned char *)v4;
    id v6 = *(v4 - 1);
    unint64_t result = sub_10001C450((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v6;
    *(unsigned char *)(v2[7] + result) = v5;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
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

id sub_10000B888()
{
  uint64_t v1 = sub_100022318();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = swift_allocObject();
  uint64_t v37 = v5;
  *(void *)(v5 + 16) = 0;
  uint64_t v35 = (void **)(v5 + 16);
  uint64_t v6 = swift_allocObject();
  uint64_t v36 = v6;
  *(void *)(v6 + 16) = 0;
  uint64_t v7 = v6 + 16;
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v9 = result;
    [result setDelegate:v0];
    BOOL v10 = self;
    id v11 = [v10 defaultManager];
    [v11 setDelegate:v9];

    id v12 = [v10 defaultManager];
    [v12 setDefaultSessionDelegate:v9];

    if ([self isInternalDevice])
    {
      id v13 = [v10 defaultManager];
      id v14 = [self defaultContext];
      id v15 = [objc_allocWithZone((Class)TPSURLSessionACAuthHandler) initWithAuthenticationContext:v14];

      [v13 setAuthenticationHandler:v15];
    }
    id v16 = [objc_allocWithZone((Class)TPSWidgetController) init];
    id v17 = [v16 preferredDocument];
    sub_100022308();
    if (v17)
    {
      sub_100001D88(&qword_10002CB68);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_100023280;
      *(void *)(v18 + 56) = sub_10000C3EC();
      *(void *)(v18 + 64) = sub_10000C9F4(&qword_10002CB78, (void (*)(uint64_t))sub_10000C3EC);
      *(void *)(v18 + 32) = v17;
      id v19 = v17;
      sub_100022358();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      uint64_t v21 = swift_allocObject();
      v34[1] = v7;
      uint64_t v22 = v37;
      *(void *)(v21 + 16) = v37;
      *(void *)(v21 + 24) = v20;
      char v42 = sub_10000C430;
      uint64_t v43 = v21;
      aBlock = _NSConcreteStackBlock;
      uint64_t v39 = 1107296256;
      uint64_t v40 = sub_10000BE10;
      uint64_t v41 = &unk_100029550;
      uint64_t v23 = _Block_copy(&aBlock);
      swift_retain();
      uint64_t v24 = v20;
      swift_release();
      [v16 widgetAssetsForDocument:v19 preferCacheIfAvailable:1 userInterfaceStyle:0 completionHandler:v23];
      _Block_release(v23);
      sub_100022528();
      dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
      uint64_t v26 = swift_allocObject();
      uint64_t v27 = v36;
      *(void *)(v26 + 16) = v36;
      *(void *)(v26 + 24) = v25;
      char v42 = sub_10000C4C0;
      uint64_t v43 = v26;
      aBlock = _NSConcreteStackBlock;
      uint64_t v39 = 1107296256;
      uint64_t v28 = v27;
      uint64_t v40 = sub_10000BE10;
      uint64_t v41 = &unk_1000295A0;
      uint64_t v29 = _Block_copy(&aBlock);
      swift_retain();
      uint64_t v30 = v25;
      swift_release();
      [v16 widgetAssetsForDocument:v19 preferCacheIfAvailable:1 userInterfaceStyle:1 completionHandler:v29];
      _Block_release(v29);
      sub_100022528();

      swift_beginAccess();
      uint64_t v31 = *(void **)(v22 + 16);
      swift_beginAccess();
    }
    else
    {
      sub_100022348();

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      uint64_t v28 = v36;
      uint64_t v31 = *v35;
    }
    id v32 = *(id *)(v28 + 16);
    id v33 = v31;
    swift_release();
    swift_release();
    return v31;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BE10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002CB80);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_100021B28();
    uint64_t v10 = sub_100021B48();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_100021B48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_10000C55C((uint64_t)v8);
}

Swift::Int sub_10000BF50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a7;
  uint64_t v40 = a5;
  uint64_t v41 = a6;
  uint64_t v12 = sub_100022318();
  uint64_t v42 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100001D88(&qword_10002CB80);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100021B48();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C4F4(a1, (uint64_t)v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_10000C55C((uint64_t)v17);
  }
  else
  {
    uint64_t v36 = a3 + 16;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    sub_100022308();
    sub_100001D88(&qword_10002CB68);
    uint64_t v35 = v12;
    uint64_t v22 = swift_allocObject();
    uint64_t v39 = a4;
    uint64_t v23 = (void *)v22;
    long long v34 = xmmword_100023280;
    *(_OWORD *)(v22 + 16) = xmmword_100023280;
    uint64_t v24 = sub_100021B38();
    uint64_t v38 = a8;
    uint64_t v26 = v25;
    v23[7] = &type metadata for String;
    unint64_t v37 = sub_10000C5BC();
    v23[8] = v37;
    v23[4] = v24;
    v23[5] = v26;
    sub_100022358();
    swift_bridgeObjectRelease();
    uint64_t v42 = *(void *)(v42 + 8);
    ((void (*)(char *, uint64_t))v42)(v14, v12);
    id v27 = sub_10000C610();
    swift_beginAccess();
    uint64_t v28 = *(void **)(a3 + 16);
    *(void *)(a3 + 16) = v27;

    sub_100022308();
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = v34;
    swift_beginAccess();
    uint64_t v44 = *(void *)(a3 + 16);
    sub_100001D88(&qword_10002CB90);
    uint64_t v30 = sub_100022578();
    unint64_t v31 = v37;
    *(void *)(v29 + 56) = &type metadata for String;
    *(void *)(v29 + 64) = v31;
    *(void *)(v29 + 32) = v30;
    *(void *)(v29 + 40) = v32;
    sub_100022358();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v42)(v14, v35);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  return sub_100022538();
}

id Assets.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Assets();
  return [super init];
}

uint64_t type metadata accessor for Assets()
{
  return self;
}

id Assets.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Assets();
  return [super dealloc];
}

uint64_t sub_10000C3B4()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_10000C3EC()
{
  unint64_t result = qword_10002CB70;
  if (!qword_10002CB70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002CB70);
  }
  return result;
}

Swift::Int sub_10000C430(uint64_t a1, uint64_t a2)
{
  return sub_10000BF50(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), (uint64_t)"getAssets: light asset url is %@", 32, (uint64_t)"getAssets: light asset is %@", 28);
}

uint64_t sub_10000C464(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C474()
{
  return swift_release();
}

uint64_t sub_10000C480()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_10000C4C0(uint64_t a1, uint64_t a2)
{
  return sub_10000BF50(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), (uint64_t)"getAssets: dark asset url is %@", 31, (uint64_t)"getAssets: dark asset is %@", 27);
}

uint64_t sub_10000C4F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001D88(&qword_10002CB80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C55C(uint64_t a1)
{
  uint64_t v2 = sub_100001D88(&qword_10002CB80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000C5BC()
{
  unint64_t result = qword_10002CB88;
  if (!qword_10002CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB88);
  }
  return result;
}

id sub_10000C610()
{
  uint64_t v0 = sub_100022318();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001D88(&qword_10002CB98);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100023280;
  *(void *)(inited + 32) = kCGImageSourceShouldCache;
  *(unsigned char *)(inited + 40) = 0;
  CFStringRef v5 = (id)kCGImageSourceShouldCache;
  sub_10000B788(inited);
  sub_100021B18(v6);
  CFURLRef v8 = v7;
  type metadata accessor for CFString(0);
  sub_10000C9F4(&qword_10002CBA0, type metadata accessor for CFString);
  CFDictionaryRef isa = sub_100022478().super.isa;
  uint64_t v10 = CGImageSourceCreateWithURL(v8, isa);

  if (!v10)
  {
    swift_bridgeObjectRelease();
    sub_100022308();
    unint64_t v15 = 0;
    unint64_t v16 = 0xE000000000000000;
    sub_100022608(47);
    swift_bridgeObjectRelease();
    unint64_t v15 = 0xD00000000000002DLL;
    unint64_t v16 = 0x8000000100023EC0;
    sub_100021B48();
    sub_10000C9F4(&qword_10002CBA8, (void (*)(uint64_t))&type metadata accessor for URL);
    v17._countAndFlagsBits = sub_100022658();
    sub_1000224B8(v17);
    swift_bridgeObjectRelease();
    sub_100022348();
    swift_bridgeObjectRelease();
LABEL_6:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  CFDictionaryRef v11 = sub_100022478().super.isa;
  swift_bridgeObjectRelease();
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, v11);

  sub_100022308();
  if (!ImageAtIndex)
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0xE000000000000000;
    sub_100022608(57);
    v18._countAndFlagsBits = 0xD000000000000037;
    v18._object = (void *)0x8000000100023EF0;
    sub_1000224B8(v18);
    sub_100021B48();
    sub_10000C9F4(&qword_10002CBA8, (void (*)(uint64_t))&type metadata accessor for URL);
    v19._countAndFlagsBits = sub_100022658();
    sub_1000224B8(v19);
    swift_bridgeObjectRelease();
    sub_100022348();
    swift_bridgeObjectRelease();

    goto LABEL_6;
  }
  sub_100022348();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v13 = [objc_allocWithZone((Class)UIImage) initWithCGImage:ImageAtIndex];

  return v13;
}

uint64_t sub_10000C9F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t SystemWidgetView.init(entry:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_100001D88(&qword_10002C5E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (uint64_t)a2 + *(int *)(type metadata accessor for SystemWidgetView() + 20);

  return sub_10000B414(a1, v4);
}

uint64_t type metadata accessor for SystemWidgetView()
{
  uint64_t result = qword_10002CC78;
  if (!qword_10002CC78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_10000CB08()
{
  uint64_t v1 = sub_100001D88(&qword_10002C630);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SystemWidgetView();
  sub_100005BC8(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_10002C630);
  uint64_t v5 = type metadata accessor for DocumentEntry();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) == 1)
  {
    sub_1000048C0((uint64_t)v3, &qword_10002C630);
  }
  else
  {
    id v6 = *(id *)&v3[*(int *)(v5 + 28)];
    id v7 = v6;
    sub_10000E91C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
    if (v6) {
      return v6;
    }
  }
  id v8 = [objc_allocWithZone((Class)TPSWidgetController) init];
  id v9 = [v8 preferredDocument];
  id v10 = [v9 widgetContent];

  if (v10)
  {
    id v6 = [v9 widgetContent];
  }
  else
  {

    return [objc_allocWithZone((Class)TPSPlaceholderWidgetContent) init];
  }
  return v6;
}

uint64_t SystemWidgetView.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SystemWidgetView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  sub_10000E8B4(v1, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10000E84C((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
  *a1 = sub_10000CDD8;
  a1[1] = v7;
  return result;
}

uint64_t sub_10000CDDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CDF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v45[2] = a2;
  uint64_t v52 = a3;
  uint64_t v47 = sub_100001D88(&qword_10002CCC0);
  __chkstk_darwin(v47);
  long long v49 = (void *)((char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v51 = sub_100001D88(&qword_10002CCC8);
  __chkstk_darwin(v51);
  uint64_t v50 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for LargeTipView(0);
  uint64_t v6 = __chkstk_darwin(v48);
  id v8 = (void *)((char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  uint64_t v46 = (uint64_t)v45 - v9;
  uint64_t v10 = sub_100001D88(&qword_10002CCD0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SystemWidgetView();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13 - 8);
  uint64_t v16 = sub_1000223A8();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Swift::String v19 = (char *)v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002E18((uint64_t)v19);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (v20 == enum case for WidgetFamily.systemSmall(_:))
  {
    sub_10000E8B4(a1, (uint64_t)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    unint64_t v21 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v22 = swift_allocObject();
    sub_10000E84C((uint64_t)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 1;
    v56 = sub_10000E980;
    uint64_t v57 = v22;
    char v58 = 0;
    swift_retain();
    sub_100001D88(&qword_10002CD08);
    sub_100001D88(&qword_10002CD18);
    sub_100009C94(&qword_10002CD00, &qword_10002CD08);
    sub_100009C94(&qword_10002CD10, &qword_10002CD18);
    sub_100021F38();
    uint64_t v23 = v61;
    char v24 = v62;
    long long v25 = v60;
    *(_OWORD *)uint64_t v12 = v59;
    *((_OWORD *)v12 + 1) = v25;
    *((void *)v12 + 4) = v23;
    v12[40] = v24;
LABEL_5:
    swift_storeEnumTagMultiPayload();
    sub_100001D88(&qword_10002CCF0);
    sub_10000E6DC();
    sub_10000E79C();
    sub_100021F38();
    return swift_release();
  }
  v45[1] = v10;
  if (v20 == enum case for WidgetFamily.systemMedium(_:))
  {
    sub_10000E8B4(a1, (uint64_t)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    unint64_t v26 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v27 = swift_allocObject();
    sub_10000E84C((uint64_t)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 1;
    v56 = sub_10000E980;
    uint64_t v57 = v27;
    char v58 = 1;
    swift_retain();
    sub_100001D88(&qword_10002CD08);
    sub_100001D88(&qword_10002CD18);
    sub_100009C94(&qword_10002CD00, &qword_10002CD08);
    sub_100009C94(&qword_10002CD10, &qword_10002CD18);
    sub_100021F38();
    uint64_t v28 = v61;
    char v29 = v62;
    long long v30 = v60;
    *(_OWORD *)uint64_t v12 = v59;
    *((_OWORD *)v12 + 1) = v30;
    *((void *)v12 + 4) = v28;
    v12[40] = v29;
    goto LABEL_5;
  }
  uint64_t v32 = (uint64_t)v12;
  if (v20 == enum case for WidgetFamily.systemLarge(_:))
  {
    id v33 = sub_10000CB08();
    sub_100021C18();
    double v35 = ceil(v34 * 0.47);
    sub_100021C18();
    double v37 = ceil(v36 * 0.47);
    *id v8 = swift_getKeyPath();
    sub_100001D88(&qword_10002C5E8);
    swift_storeEnumTagMultiPayload();
    uint64_t v38 = v48;
    uint64_t v39 = (uint64_t *)((char *)v8 + *(int *)(v48 + 20));
    *uint64_t v39 = swift_getKeyPath();
    sub_100001D88(&qword_10002C5F0);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v8 + *(int *)(v38 + 24)) = (uint64_t)v33;
    uint64_t v40 = (double *)((char *)v8 + *(int *)(v38 + 28));
    *uint64_t v40 = v35;
    v40[1] = v37;
    uint64_t v41 = v46;
    sub_10000E84C((uint64_t)v8, v46, type metadata accessor for LargeTipView);
    sub_10000E8B4(v41, (uint64_t)v49, type metadata accessor for LargeTipView);
    swift_storeEnumTagMultiPayload();
    sub_100001D88(&qword_10002CCD8);
    sub_10000E684();
    sub_100009C94(&qword_10002CCE8, &qword_10002CCD8);
    uint64_t v42 = (uint64_t)v50;
    sub_100021F38();
    sub_100005BC8(v42, v32, &qword_10002CCC8);
    swift_storeEnumTagMultiPayload();
    sub_100001D88(&qword_10002CCF0);
    sub_10000E6DC();
    sub_10000E79C();
    sub_100021F38();
    sub_1000048C0(v42, &qword_10002CCC8);
    return sub_10000E91C(v41, type metadata accessor for LargeTipView);
  }
  else
  {
    uint64_t v43 = v49;
    void *v49 = 0;
    v43[1] = 0;
    *((unsigned char *)v43 + 16) = 1;
    v43[3] = nullsub_2;
    v43[4] = 0;
    swift_storeEnumTagMultiPayload();
    sub_100001D88(&qword_10002CCD8);
    sub_10000E684();
    sub_100009C94(&qword_10002CCE8, &qword_10002CCD8);
    uint64_t v44 = (uint64_t)v50;
    sub_100021F38();
    sub_100005BC8(v44, v32, &qword_10002CCC8);
    swift_storeEnumTagMultiPayload();
    sub_100001D88(&qword_10002CCF0);
    sub_10000E6DC();
    sub_10000E79C();
    sub_100021F38();
    sub_1000048C0(v44, &qword_10002CCC8);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
}

void sub_10000D6B0(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100001D88(&qword_10002C630);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SystemWidgetView();
  sub_100005BC8(a1 + *(int *)(v7 + 20), (uint64_t)v6, &qword_10002C630);
  uint64_t v8 = type metadata accessor for DocumentEntry();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) == 1)
  {
    sub_1000048C0((uint64_t)v6, &qword_10002C630);
  }
  else
  {
    id v9 = *(id *)&v6[*(int *)(v8 + 28)];
    id v10 = v9;
    sub_10000E91C((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
    if (v9) {
      goto LABEL_7;
    }
  }
  id v11 = [objc_allocWithZone((Class)TPSWidgetController) init];
  id v12 = [v11 preferredDocument];
  id v13 = [v12 widgetContent];

  if (v13)
  {
    id v9 = [v12 widgetContent];
  }
  else
  {

    id v9 = [objc_allocWithZone((Class)TPSPlaceholderWidgetContent) init];
  }
LABEL_7:
  *a2 = v9;
}

uint64_t sub_10000D878@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10000E8B4(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10000E84C((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for SystemWidgetView);
  *a2 = sub_10000CDD8;
  a2[1] = v7;
  return result;
}

void *assignWithCopy for SystemWidgetView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E0);
    sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000223A8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  id v10 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v11 = *((void *)v10 - 1);
  id v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_10000E91C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_12;
    }
    uint64_t v23 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v8, v9, v23);
    uint64_t v24 = v10[5];
    long long v25 = &v8[v24];
    unint64_t v26 = &v9[v24];
    uint64_t v27 = sub_100022458();
    uint64_t v28 = *(void *)(v27 - 8);
    char v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
    long long v49 = v25;
    LODWORD(v25) = v29(v25, 1, v27);
    int v30 = v29(v26, 1, v27);
    if (v25)
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v49, v26, v27);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v49, 0, 1, v27);
        goto LABEL_23;
      }
      size_t v31 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v32 = v49;
    }
    else
    {
      if (!v30)
      {
        (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v49, v26, v27);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v49, v27);
      size_t v31 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v32 = v49;
    }
    memcpy(v32, v26, v31);
LABEL_23:
    uint64_t v40 = v10[6];
    uint64_t v41 = *(void **)&v8[v40];
    uint64_t v42 = *(void **)&v9[v40];
    *(void *)&v8[v40] = v42;
    id v43 = v42;

    uint64_t v44 = v10[7];
    uint64_t v45 = *(void **)&v8[v44];
    uint64_t v46 = *(void **)&v9[v44];
    *(void *)&v8[v44] = v46;
    id v47 = v46;

    return a1;
  }
  if (v14)
  {
LABEL_12:
    uint64_t v22 = sub_100001D88(&qword_10002C630);
    memcpy(v8, v9, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  uint64_t v15 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v8, v9, v15);
  uint64_t v16 = v10[5];
  uint64_t v17 = &v8[v16];
  uint64_t v18 = &v9[v16];
  uint64_t v19 = sub_100022458();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100001D88(&qword_10002C668);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v33 = v10[6];
  double v34 = *(void **)&v9[v33];
  *(void *)&v8[v33] = v34;
  uint64_t v35 = v10[7];
  double v36 = *(void **)&v9[v35];
  *(void *)&v8[v35] = v36;
  double v37 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
  id v38 = v34;
  id v39 = v36;
  v37(v8, 0, 1, v10);
  return a1;
}

char *assignWithTake for SystemWidgetView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E0);
    uint64_t v6 = sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000223A8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  id v10 = &a2[v8];
  uint64_t v11 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v12 = *((void *)v11 - 1);
  int v13 = *(uint64_t (**)(char *, uint64_t, int *))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_10000E91C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_11;
    }
    uint64_t v24 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v9, v10, v24);
    uint64_t v25 = v11[5];
    unint64_t v26 = &v9[v25];
    uint64_t v27 = &v10[v25];
    uint64_t v28 = sub_100022458();
    uint64_t v29 = *(void *)(v28 - 8);
    int v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
    id v39 = v26;
    LODWORD(v26) = v30(v26, 1, v28);
    int v31 = v30(v27, 1, v28);
    if (v26)
    {
      if (!v31)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v39, v27, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v39, 0, 1, v28);
        goto LABEL_22;
      }
      size_t v32 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v33 = v39;
    }
    else
    {
      if (!v31)
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 40))(v39, v27, v28);
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v28);
      size_t v32 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v33 = v39;
    }
    memcpy(v33, v27, v32);
LABEL_22:
    uint64_t v34 = v11[6];
    uint64_t v35 = *(void **)&v9[v34];
    *(void *)&v9[v34] = *(void *)&v10[v34];

    uint64_t v36 = v11[7];
    double v37 = *(void **)&v9[v36];
    *(void *)&v9[v36] = *(void *)&v10[v36];

    return a1;
  }
  if (v15)
  {
LABEL_11:
    uint64_t v23 = sub_100001D88(&qword_10002C630);
    memcpy(v9, v10, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  uint64_t v16 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v9, v10, v16);
  uint64_t v17 = v11[5];
  uint64_t v18 = &v9[v17];
  uint64_t v19 = &v10[v17];
  uint64_t v20 = sub_100022458();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = sub_100001D88(&qword_10002C668);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  *(void *)&v9[v11[6]] = *(void *)&v10[v11[6]];
  *(void *)&v9[v11[7]] = *(void *)&v10[v11[7]];
  (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E3A4);
}

uint64_t sub_10000E3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C670);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100001D88(&qword_10002C630);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for SystemWidgetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E4B8);
}

uint64_t sub_10000E4B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100001D88(&qword_10002C670);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100001D88(&qword_10002C630);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_10000E5C4()
{
  return sub_100009C94(&qword_10002CCB0, &qword_10002CCB8);
}

uint64_t sub_10000E604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SystemWidgetView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10000CDF8(v6, a1, a2);
}

unint64_t sub_10000E684()
{
  unint64_t result = qword_10002CCE0;
  if (!qword_10002CCE0)
  {
    type metadata accessor for LargeTipView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CCE0);
  }
  return result;
}

unint64_t sub_10000E6DC()
{
  unint64_t result = qword_10002CCF8;
  if (!qword_10002CCF8)
  {
    sub_100002518(&qword_10002CCF0);
    sub_100009C94(&qword_10002CD00, &qword_10002CD08);
    sub_100009C94(&qword_10002CD10, &qword_10002CD18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CCF8);
  }
  return result;
}

unint64_t sub_10000E79C()
{
  unint64_t result = qword_10002CD20;
  if (!qword_10002CD20)
  {
    sub_100002518(&qword_10002CCC8);
    sub_10000E684();
    sub_100009C94(&qword_10002CCE8, &qword_10002CCD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CD20);
  }
  return result;
}

uint64_t sub_10000E84C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E8B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E91C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000E980()
{
  return sub_10000EBD0((uint64_t (*)(uint64_t))sub_10000D6B0);
}

uint64_t sub_10000E99C()
{
  uint64_t v1 = type metadata accessor for SystemWidgetView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000223A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = (int *)type metadata accessor for DocumentEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v7 - 1) + 48))(v6, 1, v7))
  {
    uint64_t v8 = sub_100021B68();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    uint64_t v9 = v6 + v7[5];
    uint64_t v10 = sub_100022458();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000EBD0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for SystemWidgetView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_10000EC54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v32 = type metadata accessor for DocumentEntry();
  __chkstk_darwin(v32);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100001D88(&qword_10002C668);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100021B68();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100022458();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [objc_allocWithZone((Class)TPSWidgetController) init];
  id v14 = [v13 preferredDocument];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = [v14 widgetContent];

    if (v16)
    {
      [v16 priority];
    }
  }
  sub_100022428();
  sub_100021B58();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
  uint64_t v29 = v8;
  uint64_t v17 = (uint64_t)v5;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v18(v17, 0, 1, v9);
  id v28 = [v13 preferredDocument];
  id v19 = [v13 preferredDocument];
  id v20 = [v19 widgetContent];

  uint64_t v27 = v12;
  uint64_t v21 = v32;
  uint64_t v22 = (uint64_t)&v2[*(int *)(v32 + 20)];
  v18(v22, 1, 1, v9);
  uint64_t v23 = *(int *)(v21 + 24);
  *(void *)&v2[v23] = 0;
  uint64_t v24 = *(int *)(v21 + 28);
  *(void *)&v2[v24] = 0;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v2, v29, v31);
  sub_1000110C0(v17, v22);

  *(void *)&v2[v23] = v28;
  *(void *)&v2[v24] = v20;
  sub_100011128((uint64_t)v2, v33, (uint64_t (*)(void))type metadata accessor for DocumentEntry);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v27, v9);
}

uint64_t sub_10000F014@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = sub_100022318();
  uint64_t v34 = *(void *)(v1 - 8);
  uint64_t v35 = v1;
  __chkstk_darwin(v1);
  uint64_t v32 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DocumentEntry();
  uint64_t v4 = (int *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100001D88(&qword_10002C668);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100021B68();
  uint64_t v10 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100022458();
  uint64_t v30 = *(void *)(v13 - 8);
  uint64_t v14 = v30;
  __chkstk_darwin(v13);
  id v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v16;
  sub_100022428();
  sub_100021B58();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v9, v16, v13);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v29 = v13;
  v17(v9, 0, 1, v13);
  id v18 = [objc_allocWithZone((Class)TPSPlaceholderWidgetContent) init];
  uint64_t v19 = (uint64_t)&v6[v4[7]];
  v17((char *)v19, 1, 1, v13);
  uint64_t v20 = v4[8];
  *(void *)&v6[v20] = 0;
  uint64_t v21 = v4[9];
  *(void *)&v6[v21] = 0;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v6, v12, v28);
  sub_1000110C0((uint64_t)v9, v19);

  *(void *)&v6[v20] = 0;
  *(void *)&v6[v21] = v18;
  sub_100011128((uint64_t)v6, v33, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
  uint64_t v22 = v32;
  sub_100022308();
  sub_100001D88(&qword_10002CB68);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100023280;
  uint64_t v24 = DocumentEntry.description.getter();
  uint64_t v26 = v25;
  *(void *)(v23 + 56) = &type metadata for String;
  *(void *)(v23 + 64) = sub_10000C5BC();
  *(void *)(v23 + 32) = v24;
  *(void *)(v23 + 40) = v26;
  sub_100022338();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v29);
}

uint64_t sub_10000F418(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = sub_100022318();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DocumentEntry();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EC54((uint64_t)v9);
  sub_100022308();
  sub_100001D88(&qword_10002CB68);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100023280;
  uint64_t v11 = DocumentEntry.description.getter();
  uint64_t v13 = v12;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_10000C5BC();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  sub_100022338();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  a2(v9);
  return sub_100011060((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
}

uint64_t sub_10000F5E4(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v24 = a3;
  uint64_t v25 = a2;
  uint64_t v23 = sub_100022318();
  uint64_t v3 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100022418();
  __chkstk_darwin(v6 - 8);
  uint64_t v22 = sub_100001D88(&qword_10002CDA8);
  uint64_t v7 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DocumentEntry();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EC54((uint64_t)v13);
  sub_100001D88(&qword_10002CDB0);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v15 = swift_allocObject();
  long long v21 = xmmword_100023280;
  *(_OWORD *)(v15 + 16) = xmmword_100023280;
  sub_100010D54((uint64_t)v13, v15 + v14);
  sub_100022408();
  sub_100011018(qword_10002CD90, (void (*)(uint64_t))type metadata accessor for DocumentEntry);
  sub_100022468();
  sub_100022308();
  sub_100001D88(&qword_10002CB68);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v21;
  uint64_t v17 = DocumentEntry.description.getter();
  uint64_t v19 = v18;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = sub_10000C5BC();
  *(void *)(v16 + 32) = v17;
  *(void *)(v16 + 40) = v19;
  sub_100022338();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v23);
  v25(v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  return sub_100011060((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
}

uint64_t sub_10000F970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000FA24;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000FA24()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000FB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100011190;
  return TimelineProvider.relevance()(a1, a2, a3);
}

id sub_10000FBCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v81 = a1;
  uint64_t v73 = sub_100001D88(&qword_10002CD30);
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  v70 = &v65[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v75 = sub_100001D88(&qword_10002CD38);
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  v72 = &v65[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100001D88(&qword_10002CD40);
  uint64_t v77 = *(void *)(v3 - 8);
  uint64_t v78 = v3;
  __chkstk_darwin(v3);
  v76 = &v65[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100001D88(&qword_10002CD48);
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v80 = v5;
  __chkstk_darwin(v5);
  v87 = &v65[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100022318();
  uint64_t v85 = *(void *)(v7 - 8);
  uint64_t v86 = v7;
  __chkstk_darwin(v7);
  v84 = &v65[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1000223A8();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v83 = &v65[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  v82 = &v65[-v13];
  __chkstk_darwin(v14);
  v88 = &v65[-v15];
  __n128 v17 = __chkstk_darwin(v16);
  uint64_t v19 = &v65[-v18];
  v90 = *(void (**)(unsigned char *, void, uint64_t, __n128))(v10 + 104);
  v90(&v65[-v18], enum case for WidgetFamily.accessoryRectangular(_:), v9, v17);
  uint64_t v20 = (char *)sub_100010AD0(0, 1, 1, &_swiftEmptyArrayStorage);
  unint64_t v22 = *((void *)v20 + 2);
  unint64_t v21 = *((void *)v20 + 3);
  if (v22 >= v21 >> 1) {
    uint64_t v20 = (char *)sub_100010AD0(v21 > 1, v22 + 1, 1, v20);
  }
  *((void *)v20 + 2) = v22 + 1;
  uint64_t v24 = *(void (**)(char *, unsigned char *, uint64_t))(v10 + 32);
  uint64_t v23 = v10 + 32;
  unint64_t v25 = (*(unsigned __int8 *)(v23 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 48);
  uint64_t v26 = *(void *)(v23 + 40);
  v89 = v24;
  v24(&v20[v25 + v26 * v22], v19, v9);
  sub_100021EA8();
  uint64_t v27 = sub_100022038();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  int v66 = v32;
  char v33 = v32 & 1;
  ((void (*)(unsigned char *, void, uint64_t))v90)(v88, enum case for WidgetFamily.systemSmall(_:), v9);
  uint64_t v69 = v31;
  swift_bridgeObjectRetain();
  uint64_t v68 = v27;
  uint64_t v67 = v29;
  sub_100009C84(v27, v29, v33);
  unint64_t v35 = *((void *)v20 + 2);
  unint64_t v34 = *((void *)v20 + 3);
  if (v35 >= v34 >> 1) {
    uint64_t v20 = (char *)sub_100010AD0(v34 > 1, v35 + 1, 1, v20);
  }
  uint64_t v36 = v83;
  *((void *)v20 + 2) = v35 + 1;
  v89(&v20[v25 + v35 * v26], v88, v9);
  double v37 = v82;
  ((void (*)(unsigned char *, void, uint64_t))v90)(v82, enum case for WidgetFamily.systemMedium(_:), v9);
  unint64_t v39 = *((void *)v20 + 2);
  unint64_t v38 = *((void *)v20 + 3);
  if (v39 >= v38 >> 1) {
    uint64_t v20 = (char *)sub_100010AD0(v38 > 1, v39 + 1, 1, v20);
  }
  *((void *)v20 + 2) = v39 + 1;
  v89(&v20[v25 + v39 * v26], v37, v9);
  ((void (*)(unsigned char *, void, uint64_t))v90)(v36, enum case for WidgetFamily.systemLarge(_:), v9);
  unint64_t v41 = *((void *)v20 + 2);
  unint64_t v40 = *((void *)v20 + 3);
  if (v41 >= v40 >> 1) {
    uint64_t v20 = (char *)sub_100010AD0(v40 > 1, v41 + 1, 1, v20);
  }
  *((void *)v20 + 2) = v41 + 1;
  v89(&v20[v25 + v41 * v26], v36, v9);
  uint64_t v42 = v84;
  sub_100022308();
  sub_100022348();
  (*(void (**)(unsigned char *, uint64_t))(v85 + 8))(v42, v86);
  id result = [self clientBundleIdentifier];
  if (result)
  {
    uint64_t v44 = result;
    sub_100022498();

    sub_100001D88(&qword_10002CD50);
    uint64_t v45 = type metadata accessor for TipsWidgetWrapperView();
    uint64_t v46 = sub_100011018(&qword_10002CD58, (void (*)(uint64_t))type metadata accessor for TipsWidgetWrapperView);
    uint64_t v91 = v45;
    unint64_t v92 = v46;
    swift_getOpaqueTypeConformance2();
    sub_100010CA4();
    id v47 = v70;
    sub_1000223F8();
    sub_100021EA8();
    uint64_t v48 = sub_100022038();
    uint64_t v50 = v49;
    char v52 = v51 & 1;
    unint64_t v53 = sub_100010CF8();
    uint64_t v54 = v72;
    uint64_t v55 = v73;
    sub_100021F28();
    sub_10000A030(v48, v50, v52);
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v71 + 8))(v47, v55);
    swift_bridgeObjectRetain();
    uint64_t v91 = v55;
    unint64_t v92 = v53;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v58 = v75;
    uint64_t v57 = v76;
    sub_100021F08();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v74 + 8))(v54, v58);
    uint64_t v91 = v58;
    unint64_t v92 = OpaqueTypeConformance2;
    uint64_t v59 = swift_getOpaqueTypeConformance2();
    LOBYTE(OpaqueTypeConformance2) = v66 & 1;
    uint64_t v60 = v68;
    uint64_t v61 = v67;
    uint64_t v62 = v78;
    sub_100021EF8();
    sub_10000A030(v60, v61, OpaqueTypeConformance2);
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v77 + 8))(v57, v62);
    sub_100001D88(&qword_10002CD70);
    sub_1000223C8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100023280;
    sub_1000223B8();
    uint64_t v91 = v62;
    unint64_t v92 = v59;
    swift_getOpaqueTypeConformance2();
    uint64_t v63 = v80;
    v64 = v87;
    sub_100021F18();
    sub_10000A030(v60, v61, OpaqueTypeConformance2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v79 + 8))(v64, v63);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001067C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_100021CA8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100001D88(&qword_10002C630);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TipsWidgetWrapperView();
  __chkstk_darwin(v10);
  uint64_t v12 = (uint64_t *)((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v21 - v14;
  uint64_t v22 = sub_100001D88(&qword_10002CD50);
  uint64_t v16 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010D54(a1, (uint64_t)v9);
  uint64_t v19 = type metadata accessor for DocumentEntry();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 0, 1, v19);
  *uint64_t v12 = swift_getKeyPath();
  sub_100001D88(&qword_10002C5E0);
  swift_storeEnumTagMultiPayload();
  sub_10000B414((uint64_t)v9, (uint64_t)v12 + *(int *)(v10 + 20));
  sub_100011128((uint64_t)v12, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for TipsWidgetWrapperView);
  if (DocumentEntry.isPlaceholder.getter())
  {
    sub_100021C98();
  }
  else
  {
    uint64_t v24 = 0;
    sub_100011018(&qword_10002CD78, (void (*)(uint64_t))&type metadata accessor for RedactionReasons);
    sub_1000226A8();
  }
  sub_100011018(&qword_10002CD58, (void (*)(uint64_t))type metadata accessor for TipsWidgetWrapperView);
  sub_100022118();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100011060((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for TipsWidgetWrapperView);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v23, v18, v22);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100010A50()
{
  unint64_t result = qword_10002CD28;
  if (!qword_10002CD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CD28);
  }
  return result;
}

ValueMetadata *type metadata accessor for TipsWidget()
{
  return &type metadata for TipsWidget;
}

uint64_t sub_100010AB4()
{
  return swift_getOpaqueTypeConformance2();
}

size_t sub_100010AD0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100001D88(&qword_10002CD80);
  uint64_t v10 = *(void *)(sub_1000223A8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_1000223A8() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

unint64_t sub_100010CA4()
{
  unint64_t result = qword_10002CD60;
  if (!qword_10002CD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CD60);
  }
  return result;
}

unint64_t sub_100010CF8()
{
  unint64_t result = qword_10002CD68;
  if (!qword_10002CD68)
  {
    sub_100002518(&qword_10002CD30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CD68);
  }
  return result;
}

uint64_t sub_100010D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DocumentEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_100010DBC(char *result, int64_t a2, char a3, char *a4)
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
    sub_100001D88(&qword_10002CD88);
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

ValueMetadata *type metadata accessor for Provider()
{
  return &type metadata for Provider;
}

uint64_t sub_100010ED0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010FD0()
{
  return sub_100011018(qword_10002CD90, (void (*)(uint64_t))type metadata accessor for DocumentEntry);
}

uint64_t sub_100011018(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100011060(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000110C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001D88(&qword_10002C668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011128(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t DocumentEntry.isPlaceholder.getter()
{
  uint64_t v1 = type metadata accessor for DocumentEntry();
  __chkstk_darwin(v1);
  uint64_t v32 = (uint64_t)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100022318();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [self tps_userLanguageCode];
  uint64_t v31 = sub_100022498();
  uint64_t v9 = v8;

  uint64_t v28 = v1;
  uint64_t v10 = *(int *)(v1 + 24);
  uint64_t v33 = v0;
  uint64_t v30 = v10;
  int64_t v11 = *(void **)(v0 + v10);
  if (v11)
  {
    id v12 = [v11 userLanguageCode];
    uint64_t v13 = sub_100022498();
    unint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  sub_100022308();
  sub_100001D88(&qword_10002CB68);
  uint64_t v16 = swift_allocObject();
  long long v29 = xmmword_100023280;
  *(_OWORD *)(v16 + 16) = xmmword_100023280;
  *(void *)(v16 + 56) = &type metadata for String;
  unint64_t v17 = sub_10000C5BC();
  *(void *)(v16 + 64) = v17;
  uint64_t v27 = v13;
  *(void *)(v16 + 32) = v13;
  *(void *)(v16 + 40) = v15;
  swift_bridgeObjectRetain();
  sub_100022358();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v6, v3);
  sub_100022308();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = v29;
  *(void *)(v19 + 56) = &type metadata for String;
  *(void *)(v19 + 64) = v17;
  uint64_t v20 = v31;
  *(void *)(v19 + 32) = v31;
  *(void *)(v19 + 40) = v9;
  swift_bridgeObjectRetain();
  sub_100022358();
  swift_bridgeObjectRelease();
  v18(v6, v3);
  uint64_t v21 = v32;
  uint64_t v22 = *(void *)(v33 + v30);
  sub_100010D54(v33, v32);
  if (!v22)
  {
    sub_100011520(v21);
    goto LABEL_10;
  }
  uint64_t v23 = *(void *)(v21 + *(int *)(v28 + 28));
  sub_100011520(v21);
  if (!v23)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v24 = 1;
    return v24 & 1;
  }
  if (v27 == v20 && v15 == v9)
  {
    swift_bridgeObjectRelease_n();
    char v24 = 0;
  }
  else
  {
    char v25 = sub_100022668();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v24 = v25 ^ 1;
  }
  return v24 & 1;
}

uint64_t type metadata accessor for DocumentEntry()
{
  uint64_t result = qword_10002CE28;
  if (!qword_10002CE28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011520(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DocumentEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void DocumentEntry.init(date:relevance:document:widgetContent:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v11 = a5 + v10[5];
  uint64_t v12 = sub_100022458();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = v10[6];
  *(void *)(a5 + v13) = 0;
  uint64_t v14 = v10[7];
  *(void *)(a5 + v14) = 0;
  uint64_t v15 = sub_100021B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(a5, a1, v15);
  sub_1000110C0(a2, v11);

  *(void *)(a5 + v13) = a3;
  *(void *)(a5 + v14) = a4;
}

uint64_t DocumentEntry.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100021B68();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t DocumentEntry.date.setter(uint64_t a1)
{
  uint64_t v3 = sub_100021B68();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*DocumentEntry.date.modify())()
{
  return nullsub_2;
}

uint64_t DocumentEntry.relevance.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DocumentEntry() + 20);

  return sub_1000117BC(v3, a1);
}

uint64_t sub_1000117BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001D88(&qword_10002C668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DocumentEntry.relevance.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DocumentEntry() + 20);

  return sub_1000110C0(a1, v3);
}

uint64_t (*DocumentEntry.relevance.modify())()
{
  return nullsub_2;
}

void *DocumentEntry.document.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for DocumentEntry() + 24));
  id v2 = v1;
  return v1;
}

void DocumentEntry.document.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DocumentEntry() + 24);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*DocumentEntry.document.modify())()
{
  return nullsub_2;
}

void *DocumentEntry.widgetContent.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for DocumentEntry() + 28));
  id v2 = v1;
  return v1;
}

void DocumentEntry.widgetContent.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DocumentEntry() + 28);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*DocumentEntry.widgetContent.modify())()
{
  return nullsub_2;
}

uint64_t DocumentEntry.description.getter()
{
  uint64_t v1 = sub_100001D88(&qword_10002C668);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v19 - v5;
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_100022608(105);
  v23._countAndFlagsBits = 0xD000000000000016;
  v23._object = (void *)0x8000000100024170;
  sub_1000224B8(v23);
  sub_100021B68();
  sub_100011DFC();
  v24._countAndFlagsBits = sub_100022658();
  sub_1000224B8(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x3A65726F6353202CLL;
  v25._object = (void *)0xE900000000000020;
  sub_1000224B8(v25);
  id v7 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v8 = v0 + v7[5];
  sub_1000117BC(v8, (uint64_t)v6);
  uint64_t v9 = sub_100022458();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v6, 1, v9) == 1)
  {
    sub_100011E54((uint64_t)v6);
  }
  else
  {
    sub_100022438();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
  }
  sub_100022508();
  v26._countAndFlagsBits = 0x697461727544202CLL;
  v26._object = (void *)0xEC000000203A6E6FLL;
  sub_1000224B8(v26);
  sub_1000117BC(v8, (uint64_t)v4);
  if (v11(v4, 1, v9) == 1)
  {
    sub_100011E54((uint64_t)v4);
  }
  else
  {
    sub_100022448();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v4, v9);
  }
  sub_1000224F8();
  v27._countAndFlagsBits = 0x73646E6F63657320;
  v27._object = (void *)0xEF203A706954202CLL;
  sub_1000224B8(v27);
  id v20 = *(id *)(v0 + v7[6]);
  id v12 = v20;
  sub_100001D88(&qword_10002CDC0);
  v28._countAndFlagsBits = sub_1000224A8();
  sub_1000224B8(v28);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = 0xD000000000000012;
  v29._object = (void *)0x8000000100024190;
  sub_1000224B8(v29);
  id v20 = *(id *)(v0 + v7[7]);
  id v13 = v20;
  sub_100001D88(&qword_10002CDC8);
  v30._countAndFlagsBits = sub_1000224A8();
  sub_1000224B8(v30);
  swift_bridgeObjectRelease();
  v31._object = (void *)0x80000001000241B0;
  v31._countAndFlagsBits = 0xD000000000000011;
  sub_1000224B8(v31);
  char v14 = DocumentEntry.isPlaceholder.getter();
  BOOL v15 = (v14 & 1) == 0;
  if (v14) {
    v16._countAndFlagsBits = 1702195828;
  }
  else {
    v16._countAndFlagsBits = 0x65736C6166;
  }
  if (v15) {
    unint64_t v17 = (void *)0xE500000000000000;
  }
  else {
    unint64_t v17 = (void *)0xE400000000000000;
  }
  v16._object = v17;
  sub_1000224B8(v16);
  swift_bridgeObjectRelease();
  return v21;
}

unint64_t sub_100011DFC()
{
  unint64_t result = qword_10002CDB8;
  if (!qword_10002CDB8)
  {
    sub_100021B68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CDB8);
  }
  return result;
}

uint64_t sub_100011E54(uint64_t a1)
{
  uint64_t v2 = sub_100001D88(&qword_10002C668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011EB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000117BC(v2 + *(int *)(a1 + 20), a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for DocumentEntry(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100021B68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100022458();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_100001D88(&qword_10002C668);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    unint64_t v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)a1 + v15) = (uint64_t)v17;
    uint64_t v18 = *(void **)((char *)a2 + v16);
    *(uint64_t *)((char *)a1 + v16) = (uint64_t)v18;
    id v19 = v17;
    id v20 = v18;
  }
  return a1;
}

void destroy for DocumentEntry(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100021B68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_100022458();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  uint64_t v8 = *(void **)(a1 + a2[7]);
}

uint64_t initializeWithCopy for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100021B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100022458();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100001D88(&qword_10002C668);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void **)(a2 + v13);
  *(void *)(a1 + v13) = v15;
  uint64_t v16 = *(void **)(a2 + v14);
  *(void *)(a1 + v14) = v16;
  id v17 = v15;
  id v18 = v16;
  return a1;
}

uint64_t assignWithCopy for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100021B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_100022458();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100001D88(&qword_10002C668);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  id v17 = *(void **)(a1 + v16);
  id v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  id v19 = v18;

  uint64_t v20 = a3[7];
  uint64_t v21 = *(void **)(a1 + v20);
  unint64_t v22 = *(void **)(a2 + v20);
  *(void *)(a1 + v20) = v22;
  id v23 = v22;

  return a1;
}

uint64_t initializeWithTake for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100021B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100022458();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100001D88(&qword_10002C668);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for DocumentEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100021B68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_100022458();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100001D88(&qword_10002C668);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  id v17 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);

  uint64_t v18 = a3[7];
  id v19 = *(void **)(a1 + v18);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);

  return a1;
}

uint64_t getEnumTagSinglePayload for DocumentEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001285C);
}

uint64_t sub_10001285C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100021B68();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100001D88(&qword_10002C668);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for DocumentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012994);
}

uint64_t sub_100012994(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100021B68();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100001D88(&qword_10002C668);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_100012AA8()
{
  sub_100021B68();
  if (v0 <= 0x3F)
  {
    sub_100012B7C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100012B7C()
{
  if (!qword_10002CE38)
  {
    sub_100022458();
    unint64_t v0 = sub_100022588();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002CE38);
    }
  }
}

ValueMetadata *type metadata accessor for SmallTipView()
{
  return &type metadata for SmallTipView;
}

uint64_t sub_100012BE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012C00@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000223A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SquareTitleView(0);
  uint64_t v9 = (int *)(v8 - 8);
  __n128 v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v5 + 104))(v7, enum case for WidgetFamily.systemSmall(_:), v4, v10);
  id v13 = a1;
  sub_100021C18();
  uint64_t v15 = v14;
  *(void *)uint64_t v12 = swift_getKeyPath();
  v12[8] = 0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v9[7]], v7, v4);
  *(void *)&v12[v9[8]] = a1;
  *(void *)&v12[v9[9]] = v15;
  sub_100021C18();
  sub_100021C18();
  sub_1000222A8();
  sub_100021C08();
  sub_100012EA8((uint64_t)v12, a2);
  uint64_t v16 = (_OWORD *)(a2 + *(int *)(sub_100001D88(&qword_10002CE70) + 36));
  long long v17 = v19[1];
  *uint64_t v16 = v19[0];
  v16[1] = v17;
  v16[2] = v19[2];
  return sub_100012F0C((uint64_t)v12);
}

uint64_t sub_100012DF4@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v5 = *v1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v5;
  *a1 = sub_100012E9C;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;

  return _objc_retain_x1();
}

uint64_t sub_100012E64()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012E9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100012C00(*(void **)(v1 + 16), a1);
}

uint64_t sub_100012EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SquareTitleView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012F0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SquareTitleView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100012F6C()
{
  unint64_t result = qword_10002CE78;
  if (!qword_10002CE78)
  {
    sub_100002518(&qword_10002CE80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CE78);
  }
  return result;
}

void *UIFont.defaultHyphenationFactor.unsafeMutableAddressor()
{
  return &static UIFont.defaultHyphenationFactor;
}

double static UIFont.defaultHyphenationFactor.getter()
{
  return 0.2;
}

void *UIFont.widgetTitleScaleFactor.unsafeMutableAddressor()
{
  return &static UIFont.widgetTitleScaleFactor;
}

double static UIFont.widgetTitleScaleFactor.getter()
{
  return 0.65;
}

void *UIFont.widgetBodyScaleFactor.unsafeMutableAddressor()
{
  return &static UIFont.widgetBodyScaleFactor;
}

double static UIFont.widgetBodyScaleFactor.getter()
{
  return 0.7;
}

uint64_t HorizontalTipViewWithBody.init(family:widgetContent:width:height:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  __n128 v10 = (int *)type metadata accessor for HorizontalTipViewWithBody(0);
  uint64_t v11 = v10[5];
  uint64_t v12 = sub_1000223A8();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a3, a1, v12);
  *(void *)(a3 + v11) = a2;
  *(double *)(a3 + v10[6]) = a4;
  *(double *)(a3 + v10[7]) = a5;
  return result;
}

uint64_t type metadata accessor for HorizontalTipViewWithBody(uint64_t a1)
{
  return sub_100008870(a1, qword_10002CF20);
}

uint64_t EnvironmentValues.isPlaceholder.getter()
{
  sub_100005B74();
  sub_100021E48();
  return v1;
}

uint64_t EnvironmentValues.isPlaceholder.setter()
{
  return sub_100021E58();
}

uint64_t BackgroundGradient.init(endPoint:content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3 & 1;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_100013168()
{
  uint64_t result = sub_100022158();
  qword_10002E490 = result;
  return result;
}

uint64_t sub_100013188()
{
  uint64_t v0 = sub_100022138();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001D88(&qword_10002D370);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000235C0;
  uint64_t v5 = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, enum case for Color.RGBColorSpace.sRGB(_:), v0);
  sub_100022198();
  *(void *)(v4 + 32) = sub_100022248();
  *(void *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  sub_100022198();
  *(void *)(v4 + 48) = sub_100022248();
  *(void *)(v4 + 56) = v8;
  v6(v3, v5, v0);
  sub_100022198();
  uint64_t result = sub_100022248();
  *(void *)(v4 + 64) = result;
  *(void *)(v4 + 72) = v10;
  qword_10002E498 = v4;
  return result;
}

uint64_t sub_10001334C()
{
  return sub_100021C58();
}

uint64_t sub_100013378()
{
  sub_10001DA98();
  uint64_t result = sub_100021E98();
  qword_10002E4A0 = result;
  return result;
}

uint64_t sub_1000133A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000223A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SquareTitleView(0);
  uint64_t v9 = (int *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v22 - v14;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16))(v7, a1, v4, v13);
  uint64_t v16 = type metadata accessor for HorizontalTipViewWithBody(0);
  long long v17 = *(void **)(a1 + *(int *)(v16 + 20));
  uint64_t v18 = *(void *)(a1 + *(int *)(v16 + 28));
  *(void *)uint64_t v15 = swift_getKeyPath();
  v15[8] = 0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v15[v9[7]], v7, v4);
  *(void *)&v15[v9[8]] = v17;
  *(void *)&v15[v9[9]] = v18;
  sub_10001C338((uint64_t)v15, (uint64_t)v11, type metadata accessor for SquareTitleView);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v19 = sub_100001D88(&qword_10002D390);
  sub_10001C338((uint64_t)v11, a2 + *(int *)(v19 + 48), type metadata accessor for SquareTitleView);
  id v20 = v17;
  sub_10001C3A0((uint64_t)v15, type metadata accessor for SquareTitleView);
  return sub_10001C3A0((uint64_t)v11, type metadata accessor for SquareTitleView);
}

uint64_t HorizontalTipViewWithBody.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100001D88(&qword_10002CE88);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002C5D8 != -1) {
    swift_once();
  }
  *(void *)uint64_t v6 = qword_10002E4A0;
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = sub_100001D88(&qword_10002CE90);
  sub_100013718(v2, (uint64_t)&v6[*(int *)(v7 + 44)]);
  type metadata accessor for HorizontalTipViewWithBody(0);
  sub_100022298();
  sub_100021C08();
  sub_100005BC8((uint64_t)v6, a1, &qword_10002CE88);
  uint64_t v8 = (_OWORD *)(a1 + *(int *)(sub_100001D88(&qword_10002CE98) + 36));
  long long v9 = v11[1];
  *uint64_t v8 = v11[0];
  v8[1] = v9;
  v8[2] = v11[2];
  return sub_1000048C0((uint64_t)v6, &qword_10002CE88);
}

uint64_t sub_100013718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100001D88(&qword_10002D378);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  long long v9 = (char *)&v23 - v8;
  *(void *)long long v9 = sub_100021ED8();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v10 = sub_100001D88(&qword_10002D380);
  sub_1000133A8(a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  uint64_t v11 = sub_100021ED8();
  uint64_t v12 = *(void **)(a1 + *(int *)(type metadata accessor for HorizontalTipViewWithBody(0) + 20));
  id v13 = v12;
  char v14 = sub_100021F78();
  sub_100005BC8((uint64_t)v9, (uint64_t)v6, &qword_10002D378);
  sub_100005BC8((uint64_t)v6, a2, &qword_10002D378);
  uint64_t v15 = a2 + *(int *)(sub_100001D88(&qword_10002D388) + 48);
  *(void *)uint64_t v15 = v11;
  *(void *)(v15 + 8) = 0;
  *(unsigned char *)(v15 + 16) = 0;
  *(void *)(v15 + 24) = 0;
  *(unsigned char *)(v15 + 32) = 1;
  *(void *)(v15 + 40) = v12;
  *(unsigned char *)(v15 + 48) = v14;
  *(_OWORD *)(v15 + 56) = xmmword_1000235D0;
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)(v15 + 72) = _Q0;
  *(unsigned char *)(v15 + 88) = 0;
  id v21 = v13;
  sub_1000048C0((uint64_t)v9, &qword_10002D378);

  return sub_1000048C0((uint64_t)v6, &qword_10002D378);
}

uint64_t sub_1000138A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100001D88(&qword_10002CE88);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002C5D8 != -1) {
    swift_once();
  }
  *(void *)uint64_t v6 = qword_10002E4A0;
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v7 = sub_100001D88(&qword_10002CE90);
  sub_100013718(v2, (uint64_t)&v6[*(int *)(v7 + 44)]);
  sub_100022298();
  sub_100021C08();
  sub_100005BC8((uint64_t)v6, a1, &qword_10002CE88);
  uint64_t v8 = (_OWORD *)(a1 + *(int *)(sub_100001D88(&qword_10002CE98) + 36));
  long long v9 = v11[1];
  *uint64_t v8 = v11[0];
  v8[1] = v9;
  v8[2] = v11[2];
  return sub_1000048C0((uint64_t)v6, &qword_10002CE88);
}

uint64_t SquareTitleView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100001D88(&qword_10002CEA0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100001D88(&qword_10002CEA8);
  __chkstk_darwin(v7);
  long long v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100001D88(&qword_10002CEB0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)v2;
  char v14 = *(unsigned char *)(v2 + 8);
  sub_100009588(*(void *)v2, v14);
  char v15 = sub_100003150(v13, v14);
  sub_100005514(v13, v14);
  if (v15) {
    uint64_t v16 = sub_100021E88();
  }
  else {
    uint64_t v16 = sub_100021E78();
  }
  *(void *)uint64_t v6 = v16;
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v17 = sub_100001D88(&qword_10002CEB8);
  sub_100013CC4(v2, (uint64_t)&v6[*(int *)(v17 + 44)]);
  sub_100009588(v13, v14);
  char v18 = sub_100003150(v13, v14);
  sub_100005514(v13, v14);
  if (v18) {
    uint64_t v19 = 0x4030000000000000;
  }
  else {
    uint64_t v19 = 0;
  }
  char v20 = sub_100021F78();
  sub_100005BC8((uint64_t)v6, (uint64_t)v9, &qword_10002CEA0);
  id v21 = &v9[*(int *)(v7 + 36)];
  *id v21 = v20;
  *((void *)v21 + 1) = v19;
  *((void *)v21 + 2) = v19;
  *((void *)v21 + 3) = v19;
  *((void *)v21 + 4) = v19;
  v21[40] = 0;
  sub_1000048C0((uint64_t)v6, &qword_10002CEA0);
  type metadata accessor for SquareTitleView(0);
  uint64_t v22 = *(void *)v2;
  char v23 = *(unsigned char *)(v2 + 8);
  sub_100009588(v22, v23);
  char v24 = sub_100003150(v22, v23);
  sub_100005514(v22, v23);
  if (v24) {
    sub_100022298();
  }
  else {
    sub_100022288();
  }
  sub_100021C08();
  sub_100005BC8((uint64_t)v9, (uint64_t)v12, &qword_10002CEA8);
  Swift::String v25 = &v12[*(int *)(v10 + 36)];
  long long v26 = v28[1];
  *(_OWORD *)Swift::String v25 = v28[0];
  *((_OWORD *)v25 + 1) = v26;
  *((_OWORD *)v25 + 2) = v28[2];
  sub_1000048C0((uint64_t)v9, &qword_10002CEA8);
  return sub_100005AAC((uint64_t)v12, a1, &qword_10002CEB0);
}

uint64_t sub_100013CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = sub_100001D88(&qword_10002D0A8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1000223A8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  long long v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for TitleView(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (int *)type metadata accessor for SquareTitleView(0);
  char v14 = *(void **)(a1 + v13[6]);
  double v15 = *(double *)(a1 + v13[7]);
  uint64_t v16 = a1 + v13[5];
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v37 = v6;
  v17(v9, v16, v6);
  uint64_t v18 = *(void *)a1;
  LOBYTE(a1) = *(unsigned char *)(a1 + 8);
  id v19 = v14;
  sub_100009588(v18, a1);
  char v20 = sub_100003150(v18, a1);
  sub_100005514(v18, a1);
  if (v20) {
    uint64_t v21 = sub_100022278();
  }
  else {
    uint64_t v21 = sub_100022268();
  }
  uint64_t v23 = v21;
  uint64_t v24 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  *uint64_t v5 = swift_getKeyPath();
  sub_100001D88(&qword_10002D0A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = swift_getKeyPath();
  *(void *)uint64_t v12 = KeyPath;
  v12[8] = 0;
  sub_100005AAC((uint64_t)v5, (uint64_t)&v12[v10[5]], &qword_10002D0A8);
  Swift::String v27 = &v12[v10[6]];
  *(void *)Swift::String v27 = v26;
  v27[8] = 0;
  *(void *)&v12[v10[7]] = v14;
  *(double *)&v12[v10[8]] = v15 + -32.0;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v12[v10[9]], v9, v37);
  v12[v10[10]] = 0;
  Swift::String v28 = &v12[v10[11]];
  *(void *)Swift::String v28 = v23;
  *((void *)v28 + 1) = v24;
  Swift::String v29 = &v12[v10[12]];
  *(void *)Swift::String v29 = 0x3E6E69616C703CLL;
  *((void *)v29 + 1) = 0xE700000000000000;
  Swift::String v30 = &v12[v10[13]];
  *(void *)Swift::String v30 = 0x3E6E69616C702F3CLL;
  *((void *)v30 + 1) = 0xE800000000000000;
  Swift::String v31 = &v12[v10[14]];
  *(void *)Swift::String v31 = 1701869940;
  *((void *)v31 + 1) = 0xE400000000000000;
  uint64_t v32 = &v12[v10[15]];
  *(void *)uint64_t v32 = 1954047348;
  *((void *)v32 + 1) = 0xE400000000000000;
  uint64_t v33 = &v12[v10[16]];
  *(void *)uint64_t v33 = 1954047348;
  *((void *)v33 + 1) = 0xE400000000000000;
  unint64_t v34 = &v12[v10[17]];
  *(void *)unint64_t v34 = 0x736B72616DLL;
  *((void *)v34 + 1) = 0xE500000000000000;
  unint64_t v35 = &v12[v10[18]];
  *(void *)unint64_t v35 = 0x6F43746E65636361;
  *((void *)v35 + 1) = 0xEB00000000726F6CLL;
  return sub_10001DA30((uint64_t)v12, v38, type metadata accessor for TitleView);
}

uint64_t type metadata accessor for SquareTitleView(uint64_t a1)
{
  return sub_100008870(a1, qword_10002CFB8);
}

void *IsPlaceholderKey.defaultValue.unsafeMutableAddressor()
{
  return &static IsPlaceholderKey.defaultValue;
}

uint64_t static IsPlaceholderKey.defaultValue.getter()
{
  return 1;
}

void sub_10001408C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100014098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, &protocol witness table for Bool);
}

uint64_t (*EnvironmentValues.isPlaceholder.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_100005B74();
  sub_100021E48();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_100014118;
}

uint64_t sub_100014118(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_100021E58();
}

uint64_t BackgroundGradient.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  Swift::String v28 = a2;
  uint64_t v4 = sub_100021F58();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v25 = *(void *)(v7 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 24);
  unint64_t v24 = sub_100014464();
  uint64_t v32 = v7;
  uint64_t v33 = &type metadata for LinearGradient;
  uint64_t v34 = v11;
  unint64_t v35 = v24;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v13 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  double v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v17 = __chkstk_darwin(v16);
  id v19 = (char *)&v23 - v18;
  (*(void (**)(__n128))(v2 + 24))(v17);
  sub_100021F48();
  uint64_t v29 = v7;
  uint64_t v30 = v11;
  uint64_t v31 = v2;
  sub_1000222A8();
  sub_1000220F8();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v27);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v7);
  char v20 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v20(v19, v15, OpaqueTypeMetadata2);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v15, OpaqueTypeMetadata2);
  v20(v28, v19, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v21)(v19, OpaqueTypeMetadata2);
}

unint64_t sub_100014464()
{
  unint64_t result = qword_10002CEC0;
  if (!qword_10002CEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CEC0);
  }
  return result;
}

double sub_1000144B8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (qword_10002C5D0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_100022258();
  sub_1000222E8();
  if (*(unsigned char *)(a1 + 16)) {
    sub_1000222D8();
  }
  sub_100021C48();
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(void *)(a2 + 32) = v7;
  return result;
}

double sub_100014588@<D0>(uint64_t a1@<X8>)
{
  return sub_1000144B8(*(void *)(v1 + 32), a1);
}

uint64_t sub_100014594()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000145B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000145CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014610@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return BackgroundGradient.body.getter(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for HorizontalTipViewWithBody(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000223A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    id v11 = v10;
  }
  return a1;
}

void destroy for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  id v10 = v9;
  return a1;
}

uint64_t assignWithCopy for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  id v10 = v9;

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014A14);
}

uint64_t sub_100014A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000223A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for HorizontalTipViewWithBody(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014AF4);
}

uint64_t sub_100014AF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000223A8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t sub_100014BB0()
{
  return sub_10001E6F4();
}

unint64_t initializeBufferWithCopyOfBuffer for SquareTitleView(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_100009588(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = sub_1000223A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    double v15 = *(void **)(a2 + v13);
    *(void *)(a1 + v13) = v15;
    *(void *)(a1 + v14) = *(void *)(a2 + v14);
    id v16 = v15;
  }
  return a1;
}

void destroy for SquareTitleView(uint64_t a1, uint64_t a2)
{
  sub_100005514(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t initializeWithCopy for SquareTitleView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100009588(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v14;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  id v15 = v14;
  return a1;
}

uint64_t assignWithCopy for SquareTitleView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100009588(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005514(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[6];
  id v15 = *(void **)(a1 + v14);
  id v16 = *(void **)(a2 + v14);
  *(void *)(a1 + v14) = v16;
  id v17 = v16;

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for SquareTitleView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for SquareTitleView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005514(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t)a2 + v10;
  uint64_t v13 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[6];
  id v15 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = *(uint64_t *)((char *)a2 + v14);

  *(void *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for SquareTitleView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015064);
}

uint64_t sub_100015064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000223A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SquareTitleView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100015148);
}

uint64_t sub_100015148(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000223A8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
  return result;
}

uint64_t sub_100015208()
{
  uint64_t result = sub_1000223A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for IsPlaceholderKey()
{
  return &type metadata for IsPlaceholderKey;
}

uint64_t sub_1000152C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_1000152D0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_100015304()
{
  return swift_release();
}

uint64_t sub_10001530C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10001534C(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v3;
  uint64_t v4 = *((void *)a2 + 4);
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_100015398(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1000153AC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_1000153F0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100015438(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for BackgroundGradient()
{
  return sub_10001DAEC();
}

unint64_t sub_10001549C()
{
  unint64_t result = qword_10002D078;
  if (!qword_10002D078)
  {
    sub_100002518(&qword_10002CE98);
    sub_100009C94(&qword_10002D080, &qword_10002CE88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D078);
  }
  return result;
}

uint64_t sub_10001553C()
{
  return sub_10001E8FC(&qword_10002D088, &qword_10002CEB0, (void (*)(void))sub_100015580);
}

unint64_t sub_100015580()
{
  unint64_t result = qword_10002D090;
  if (!qword_10002D090)
  {
    sub_100002518(&qword_10002CEA8);
    sub_100009C94(&qword_10002D098, &qword_10002CEA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D090);
  }
  return result;
}

uint64_t sub_100015620()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001567C(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_100009588(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    sub_100001D88(&qword_10002D0A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100021CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = a1 + v14;
    uint64_t v16 = a2 + v14;
    uint64_t v17 = *(void *)v16;
    char v18 = *(unsigned char *)(v16 + 8);
    sub_100009588(*(void *)v16, v18);
    *(void *)uint64_t v15 = v17;
    *(unsigned char *)(v15 + 8) = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    uint64_t v21 = *(void **)(a2 + v19);
    *(void *)(a1 + v19) = v21;
    *(void *)(a1 + v20) = *(void *)(a2 + v20);
    uint64_t v22 = a3[9];
    uint64_t v23 = a1 + v22;
    uint64_t v24 = a2 + v22;
    uint64_t v25 = sub_1000223A8();
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
    id v27 = v21;
    v26(v23, v24, v25);
    uint64_t v28 = a3[11];
    *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
    *(_OWORD *)(a1 + v28) = *(_OWORD *)(a2 + v28);
    uint64_t v29 = a3[12];
    uint64_t v30 = a3[13];
    uint64_t v31 = (void *)(a1 + v29);
    uint64_t v32 = (void *)(a2 + v29);
    uint64_t v33 = v32[1];
    *uint64_t v31 = *v32;
    v31[1] = v33;
    uint64_t v34 = (void *)(a1 + v30);
    unint64_t v35 = (void *)(a2 + v30);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    uint64_t v37 = a3[14];
    uint64_t v38 = a3[15];
    unint64_t v39 = (void *)(a1 + v37);
    unint64_t v40 = (void *)(a2 + v37);
    uint64_t v41 = v40[1];
    *unint64_t v39 = *v40;
    v39[1] = v41;
    uint64_t v42 = (void *)(a1 + v38);
    id v43 = (void *)(a2 + v38);
    uint64_t v44 = v43[1];
    void *v42 = *v43;
    v42[1] = v44;
    uint64_t v45 = a3[16];
    uint64_t v46 = a3[17];
    id v47 = (void *)(a1 + v45);
    uint64_t v48 = (void *)(a2 + v45);
    uint64_t v49 = v48[1];
    *id v47 = *v48;
    v47[1] = v49;
    uint64_t v50 = (void *)(a1 + v46);
    char v51 = (void *)(a2 + v46);
    uint64_t v52 = v51[1];
    *uint64_t v50 = *v51;
    v50[1] = v52;
    uint64_t v53 = a3[18];
    uint64_t v54 = (void *)(a1 + v53);
    uint64_t v55 = (void *)(a2 + v53);
    uint64_t v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100015918(uint64_t a1, int *a2)
{
  sub_100005514(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  sub_100001D88(&qword_10002D0A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100021CA8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_100005514(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));

  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100015A98(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100009588(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  sub_100001D88(&qword_10002D0A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100021CA8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = *(unsigned char *)(v14 + 8);
  sub_100009588(*(void *)v14, v16);
  *(void *)uint64_t v13 = v15;
  *(unsigned char *)(v13 + 8) = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_1000223A8();
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
  id v25 = v19;
  v24(v21, v22, v23);
  uint64_t v26 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  uint64_t v27 = a3[12];
  uint64_t v28 = a3[13];
  uint64_t v29 = (void *)(a1 + v27);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = (void *)(a1 + v28);
  uint64_t v33 = (void *)(a2 + v28);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = a3[14];
  uint64_t v36 = a3[15];
  uint64_t v37 = (void *)(a1 + v35);
  uint64_t v38 = (void *)(a2 + v35);
  uint64_t v39 = v38[1];
  *uint64_t v37 = *v38;
  v37[1] = v39;
  unint64_t v40 = (void *)(a1 + v36);
  uint64_t v41 = (void *)(a2 + v36);
  uint64_t v42 = v41[1];
  *unint64_t v40 = *v41;
  v40[1] = v42;
  uint64_t v43 = a3[16];
  uint64_t v44 = a3[17];
  uint64_t v45 = (void *)(a1 + v43);
  uint64_t v46 = (void *)(a2 + v43);
  uint64_t v47 = v46[1];
  void *v45 = *v46;
  v45[1] = v47;
  uint64_t v48 = (void *)(a1 + v44);
  uint64_t v49 = (void *)(a2 + v44);
  uint64_t v50 = v49[1];
  *uint64_t v48 = *v49;
  v48[1] = v50;
  uint64_t v51 = a3[18];
  uint64_t v52 = (void *)(a1 + v51);
  uint64_t v53 = (void *)(a2 + v51);
  uint64_t v54 = v53[1];
  void *v52 = *v53;
  v52[1] = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100015CE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_100009588(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005514(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_1000048C0(a1 + v10, &qword_10002D0A0);
    sub_100001D88(&qword_10002D0A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_100021CA8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = *(unsigned char *)(v16 + 8);
  sub_100009588(*(void *)v16, v18);
  uint64_t v19 = *(void *)v15;
  char v20 = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v15 = v17;
  *(unsigned char *)(v15 + 8) = v18;
  sub_100005514(v19, v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = *(void **)(a1 + v21);
  uint64_t v23 = *(void **)(a2 + v21);
  *(void *)(a1 + v21) = v23;
  id v24 = v23;

  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v25 = a3[9];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 24))(v26, v27, v28);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v29 = a3[11];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  uint64_t v32 = a3[12];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[13];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  *uint64_t v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v38 = a3[14];
  uint64_t v39 = (void *)(a1 + v38);
  unint64_t v40 = (void *)(a2 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[15];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (void *)(a2 + v41);
  void *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v44 = a3[16];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (void *)(a2 + v44);
  void *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v47 = a3[17];
  uint64_t v48 = (void *)(a1 + v47);
  uint64_t v49 = (void *)(a2 + v47);
  *uint64_t v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[18];
  uint64_t v51 = (void *)(a1 + v50);
  uint64_t v52 = (void *)(a2 + v50);
  void *v51 = *v52;
  v51[1] = v52[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100015FEC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100001D88(&qword_10002D0A0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100021CA8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v15 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  uint64_t v20 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  uint64_t v21 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  uint64_t v22 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_1000161A8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_100005514(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_1000048C0(a1 + v10, &qword_10002D0A0);
    uint64_t v13 = sub_100001D88(&qword_10002D0A0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100021CA8();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)((char *)a2 + v15);
  uint64_t v18 = *v17;
  LOBYTE(v17) = *((unsigned char *)v17 + 8);
  uint64_t v19 = *(void *)v16;
  char v20 = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(v16 + 8) = (_BYTE)v17;
  sub_100005514(v19, v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = *(void **)(a1 + v21);
  *(void *)(a1 + v21) = *(uint64_t *)((char *)a2 + v21);

  uint64_t v23 = a3[9];
  *(void *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t)a2 + v23;
  uint64_t v26 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  uint64_t v27 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(_OWORD *)(a1 + v27) = *(_OWORD *)((char *)a2 + v27);
  uint64_t v28 = a3[12];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)((char *)a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[13];
  uint64_t v34 = (void *)(a1 + v33);
  uint64_t v35 = (uint64_t *)((char *)a2 + v33);
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  *uint64_t v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  uint64_t v38 = a3[14];
  uint64_t v39 = (void *)(a1 + v38);
  unint64_t v40 = (uint64_t *)((char *)a2 + v38);
  uint64_t v42 = *v40;
  uint64_t v41 = v40[1];
  *uint64_t v39 = v42;
  v39[1] = v41;
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[15];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (uint64_t *)((char *)a2 + v43);
  uint64_t v47 = *v45;
  uint64_t v46 = v45[1];
  *uint64_t v44 = v47;
  v44[1] = v46;
  swift_bridgeObjectRelease();
  uint64_t v48 = a3[16];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (uint64_t *)((char *)a2 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  void *v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  uint64_t v53 = a3[17];
  uint64_t v54 = (void *)(a1 + v53);
  uint64_t v55 = (uint64_t *)((char *)a2 + v53);
  uint64_t v57 = *v55;
  uint64_t v56 = v55[1];
  *uint64_t v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[18];
  uint64_t v59 = (void *)(a1 + v58);
  uint64_t v60 = (uint64_t *)((char *)a2 + v58);
  uint64_t v62 = *v60;
  uint64_t v61 = v60[1];
  *uint64_t v59 = v62;
  v59[1] = v61;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001641C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100016430);
}

uint64_t sub_100016430(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002D0A8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = sub_1000223A8();
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[9];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[12] + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_100016548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001655C);
}

uint64_t sub_10001655C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100001D88(&qword_10002D0A8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t result = sub_1000223A8();
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[12] + 8) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[9];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);

  return v13(a1 + v11, a2, a2, v9);
}

uint64_t type metadata accessor for TitleView(uint64_t a1)
{
  return sub_100008870(a1, (uint64_t *)&unk_10002D108);
}

void sub_100016690()
{
  sub_1000167A4();
  if (v0 <= 0x3F)
  {
    sub_1000223A8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000167A4()
{
  if (!qword_10002D118)
  {
    sub_100021CA8();
    unint64_t v0 = sub_100021BE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002D118);
    }
  }
}

ValueMetadata *type metadata accessor for BodyView()
{
  return &type metadata for BodyView;
}

uint64_t sub_10001680C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_100016828()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100021B08();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = (int *)type metadata accessor for TitleView(0);
  uint64_t v6 = *(void **)(v1 + v64[7]);
  if (v6)
  {
    id v7 = [v6 titleContent];
    if (v7)
    {
      uint64_t v8 = v7;
      sub_100001D88(&qword_10002D308);
      uint64_t v9 = sub_1000224E8();

      uint64_t v10 = v9;
      uint64_t v63 = *(void *)(v9 + 16);
      if (v63)
      {
        uint64_t v51 = v2;
        uint64_t v54 = 0;
        unint64_t v11 = 0;
        v65 = (void *)(v1 + v64[14]);
        uint64_t v62 = v9 + 32;
        uint64_t v50 = (void (**)(char *, uint64_t))(v3 + 8);
        unint64_t v53 = 0xE000000000000000;
        uint64_t v12 = &protocol witness table for String;
        uint64_t v61 = (char *)&type metadata for Any + 8;
        unint64_t v13 = (unint64_t *)&unk_10002D320;
        uint64_t v14 = NSDictionary_ptr;
        uint64_t v55 = v1;
        uint64_t v56 = v10;
        while (1)
        {
          if (v11 >= *(void *)(v10 + 16))
          {
            __break(1u);
            return;
          }
          uint64_t v15 = *(void *)(v62 + 8 * v11);
          uint64_t v16 = v65[1];
          *(void *)&v68[0] = *v65;
          *((void *)&v68[0] + 1) = v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1000225F8();
          if (*(void *)(v15 + 16) && (unint64_t v17 = sub_10001C504((uint64_t)&v69), (v18 & 1) != 0))
          {
            sub_100005744(*(void *)(v15 + 56) + 32 * v17, (uint64_t)&v71);
          }
          else
          {
            long long v71 = 0u;
            long long v72 = 0u;
          }
          sub_10001D660((uint64_t)&v69);
          if (*((void *)&v72 + 1))
          {
            if ((swift_dynamicCast() & 1) == 0) {
              goto LABEL_20;
            }
            uint64_t v19 = (void *)(v1 + v64[15]);
            if (*(void *)&v68[0] == *v19 && *((void *)&v68[0] + 1) == v19[1])
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v21 = sub_100022668();
              swift_bridgeObjectRelease();
              if ((v21 & 1) == 0)
              {
                swift_bridgeObjectRelease();
                uint64_t v10 = v56;
                goto LABEL_6;
              }
            }
            uint64_t v22 = v64[13];
            uint64_t v23 = (uint64_t *)(v1 + v64[12]);
            uint64_t v24 = (void *)v23[1];
            uint64_t v57 = *v23;
            uint64_t v25 = *(void **)(v1 + v22 + 8);
            uint64_t v58 = *(void *)(v1 + v22);
            uint64_t v26 = (void *)(v1 + v64[17]);
            uint64_t v27 = v26[1];
            *(void *)&v68[0] = *v26;
            *((void *)&v68[0] + 1) = v27;
            uint64_t v59 = v24;
            swift_bridgeObjectRetain();
            uint64_t v60 = v25;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1000225F8();
            if (*(void *)(v15 + 16) && (unint64_t v28 = sub_10001C504((uint64_t)&v69), (v29 & 1) != 0))
            {
              sub_100005744(*(void *)(v15 + 56) + 32 * v28, (uint64_t)&v71);
            }
            else
            {
              long long v71 = 0u;
              long long v72 = 0u;
            }
            sub_10001D660((uint64_t)&v69);
            if (*((void *)&v72 + 1))
            {
              sub_10001D938(0, &qword_10002D318);
              if (swift_dynamicCast())
              {
                id v52 = *(id *)&v68[0];
                sub_100022548();
LABEL_31:
                sub_100021AF8();
                if (v70)
                {
                  while (1)
                  {
                    sub_10001D6B4(&v69, &v71);
                    sub_10001D938(0, v13);
                    if ((swift_dynamicCast() & 1) == 0) {
                      goto LABEL_31;
                    }
                    uint64_t v30 = v5;
                    uint64_t v31 = v14;
                    uint64_t v32 = v13;
                    uint64_t v33 = v12;
                    uint64_t v34 = *(void **)&v68[0];
                    uint64_t v35 = v65[1];
                    *(void *)&v68[0] = *v65;
                    *((void *)&v68[0] + 1) = v35;
                    swift_bridgeObjectRetain_n();
                    id v36 = [v34 __swift_objectForKeyedSubscript:sub_100022678()];
                    swift_unknownObjectRelease();
                    if (v36)
                    {
                      sub_1000225C8();
                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      memset(v68, 0, sizeof(v68));
                    }
                    sub_100005AAC((uint64_t)v68, (uint64_t)&v71, &qword_10002D310);
                    if (!*((void *)&v72 + 1)) {
                      break;
                    }
                    if ((swift_dynamicCast() & 1) == 0)
                    {
                      swift_bridgeObjectRelease();
LABEL_46:

LABEL_30:
                      uint64_t v12 = v33;
                      unint64_t v13 = v32;
                      uint64_t v14 = v31;
                      uint64_t v5 = v30;
                      goto LABEL_31;
                    }
                    uint64_t v38 = v66;
                    uint64_t v37 = v67;
                    swift_bridgeObjectRelease();
                    uint64_t v39 = (void *)(v55 + v64[18]);
                    if (v38 == *v39 && v37 == v39[1])
                    {
                      swift_bridgeObjectRelease();
                      uint64_t v12 = v33;
                      unint64_t v13 = v32;
                      uint64_t v14 = v31;
                      uint64_t v5 = v30;
                    }
                    else
                    {
                      char v40 = sub_100022668();
                      swift_bridgeObjectRelease();
                      if ((v40 & 1) == 0) {
                        goto LABEL_46;
                      }
                      uint64_t v12 = v33;
                      unint64_t v13 = v32;
                      uint64_t v14 = v31;
                      uint64_t v5 = v30;
                    }
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();

                    sub_100021AF8();
                    uint64_t v57 = 0;
                    uint64_t v58 = 0;
                    uint64_t v41 = 0;
                    uint64_t v42 = 0;
                    uint64_t v59 = (void *)0xE000000000000000;
                    uint64_t v60 = (void *)0xE000000000000000;
                    unint64_t v43 = 0xE000000000000000;
                    if (!v70) {
                      goto LABEL_49;
                    }
                  }
                  swift_bridgeObjectRelease();

                  sub_1000048C0((uint64_t)&v71, &qword_10002D310);
                  goto LABEL_30;
                }
                uint64_t v41 = v58;
                unint64_t v43 = (unint64_t)v60;
                uint64_t v42 = v57;
LABEL_49:
                (*v50)(v5, v51);

                uint64_t v58 = v41;
                uint64_t v60 = (void *)v43;
                uint64_t v57 = v42;
                uint64_t v1 = v55;
              }
            }
            else
            {
              sub_1000048C0((uint64_t)&v71, &qword_10002D310);
            }
            uint64_t v10 = v56;
            uint64_t v44 = (void *)(v1 + v64[16]);
            uint64_t v45 = v44[1];
            *(void *)&v68[0] = *v44;
            *((void *)&v68[0] + 1) = v45;
            swift_bridgeObjectRetain();
            sub_1000225F8();
            if (*(void *)(v15 + 16) && (unint64_t v46 = sub_10001C504((uint64_t)&v69), (v47 & 1) != 0))
            {
              sub_100005744(*(void *)(v15 + 56) + 32 * v46, (uint64_t)&v71);
            }
            else
            {
              long long v71 = 0u;
              long long v72 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_10001D660((uint64_t)&v69);
            if (*((void *)&v72 + 1))
            {
              if (swift_dynamicCast())
              {
                uint64_t v49 = (void *)*((void *)&v68[0] + 1);
                uint64_t v48 = *(void *)&v68[0];
                *(void *)&long long v69 = v54;
                *((void *)&v69 + 1) = v53;
                swift_bridgeObjectRetain();
                v73._countAndFlagsBits = v57;
                v73._object = v59;
                sub_1000224B8(v73);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                v74._countAndFlagsBits = v48;
                v74._object = v49;
                sub_1000224B8(v74);
                swift_bridgeObjectRelease();
                uint64_t v1 = v55;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                v75._countAndFlagsBits = v58;
                v75._object = v60;
                sub_1000224B8(v75);
                uint64_t v10 = v56;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                unint64_t v53 = *((void *)&v69 + 1);
                uint64_t v54 = v69;
                goto LABEL_6;
              }
              swift_bridgeObjectRelease();
LABEL_20:
              swift_bridgeObjectRelease();
              goto LABEL_6;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          sub_1000048C0((uint64_t)&v71, &qword_10002D310);
LABEL_6:
          if (++v11 == v63)
          {
            swift_bridgeObjectRelease();
            return;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
}

char *sub_1000170D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v35 = sub_100021AE8();
  uint64_t v6 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v9 = type metadata accessor for TitleView(0);
  uint64_t v10 = (uint64_t *)(v3 + *(int *)(v9 + 48));
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v36 = v12;
  uint64_t v37 = v11;
  sub_100009ECC();
  uint64_t v13 = sub_100022598();
  uint64_t v14 = *(void *)(v13 + 16);
  v31[1] = v13;
  if (v14)
  {
    uint64_t v15 = (uint64_t *)(v3 + *(int *)(v9 + 52));
    uint64_t v34 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    char v18 = (uint64_t *)(v13 + 40);
    uint64_t v19 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v32 = v17;
    uint64_t v33 = v16;
    do
    {
      uint64_t v20 = *v18;
      uint64_t v38 = *(v18 - 1);
      uint64_t v39 = v20;
      uint64_t v36 = v16;
      uint64_t v37 = v17;
      char v21 = (void *)sub_100022598();
      if (v21[2] <= 1uLL)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v22 = v21[4];
        uint64_t v23 = v21[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v38 = v22;
        uint64_t v39 = v23;
        sub_100021AD8();
        uint64_t v24 = sub_1000225A8();
        uint64_t v26 = v25;
        (*v34)(v8, v35);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v19 = sub_100010DBC(0, *((void *)v19 + 2) + 1, 1, v19);
        }
        unint64_t v28 = *((void *)v19 + 2);
        unint64_t v27 = *((void *)v19 + 3);
        if (v28 >= v27 >> 1) {
          uint64_t v19 = sub_100010DBC((char *)(v27 > 1), v28 + 1, 1, v19);
        }
        *((void *)v19 + 2) = v28 + 1;
        char v29 = &v19[16 * v28];
        *((void *)v29 + 4) = v24;
        *((void *)v29 + 5) = v26;
        uint64_t v17 = v32;
        uint64_t v16 = v33;
      }
      v18 += 2;
      --v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v19 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_100017348@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  LODWORD(v182) = a1;
  uint64_t v163 = a2;
  uint64_t v162 = sub_1000221F8();
  uint64_t v161 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  v160 = (char *)&v137 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_100001D88(&qword_10002D210);
  __chkstk_darwin(v159);
  v173 = (char *)&v137 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = sub_1000223A8();
  uint64_t v169 = *(void *)(v170 - 8);
  __chkstk_darwin(v170);
  v168 = (char *)&v137 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_100001D88(&qword_10002D2C0);
  uint64_t v166 = *(void *)(v167 - 8);
  __chkstk_darwin(v167);
  v165 = (char *)&v137 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v164 = (char *)&v137 - v8;
  uint64_t v9 = sub_100001D88(&qword_10002D228);
  __chkstk_darwin(v9 - 8);
  v179 = (uint64_t *)((char *)&v137 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v171 = sub_100001D88(&qword_10002D208);
  __chkstk_darwin(v171);
  uint64_t v172 = (uint64_t)&v137 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = sub_100001D88(&qword_10002D2C8);
  uint64_t v149 = *(void *)(v152 - 8);
  __chkstk_darwin(v152);
  v143 = (char *)&v137 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_100001D88(&qword_10002D1F8);
  __chkstk_darwin(v144);
  v142 = (char *)&v137 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_100001D88(&qword_10002D2D0);
  uint64_t v153 = *(void *)(v154 - 8);
  __chkstk_darwin(v154);
  v145 = (char *)&v137 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_100001D88(&qword_10002D1F0);
  __chkstk_darwin(v140);
  v147 = (char *)&v137 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_100001D88(&qword_10002D1D8);
  __chkstk_darwin(v151);
  uint64_t v148 = (uint64_t)&v137 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_100001D88(&qword_10002D2D8);
  uint64_t v155 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  v150 = (char *)&v137 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_100001D88(&qword_10002D1D0);
  __chkstk_darwin(v141);
  v157 = (char *)&v137 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_100001D88(&qword_10002C8E0);
  __chkstk_darwin(v146);
  v158 = (char *)&v137 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100021AE8();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v137 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016828();
  uint64_t v26 = sub_1000170D0(v24, v25);
  swift_bridgeObjectRelease();
  sub_100016828();
  *(void *)&long long v184 = v27;
  *((void *)&v184 + 1) = v28;
  uint64_t v29 = type metadata accessor for TitleView(0);
  uint64_t v31 = *(int *)(v29 + 48);
  uint64_t v30 = *(int *)(v29 + 52);
  uint64_t v178 = v29;
  uint64_t v32 = (uint64_t *)(v2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  uint64_t v188 = v34;
  uint64_t v189 = v33;
  uint64_t v183 = v2;
  uint64_t v35 = (uint64_t *)(v2 + v31);
  uint64_t v36 = *(void *)(v2 + v31);
  uint64_t v37 = *(void *)(v2 + v31 + 8);
  uint64_t v186 = v36;
  uint64_t v187 = v37;
  unint64_t v136 = sub_100009ECC();
  uint64_t v38 = sub_1000225B8();
  uint64_t v40 = v39;
  swift_bridgeObjectRelease();
  *(void *)&long long v184 = v38;
  *((void *)&v184 + 1) = v40;
  sub_100021AD8();
  uint64_t v41 = sub_1000225A8();
  uint64_t v43 = v42;
  uint64_t v44 = *(void (**)(char *, uint64_t))(v21 + 8);
  v138 = v23;
  uint64_t v174 = v20;
  uint64_t v139 = v21 + 8;
  v44(v23, v20);
  swift_bridgeObjectRelease();
  *(void *)&long long v184 = v41;
  *((void *)&v184 + 1) = v43;
  uint64_t v45 = v35[1];
  uint64_t v188 = *v35;
  uint64_t v189 = v45;
  uint64_t v46 = sub_100022598();
  swift_bridgeObjectRelease();
  uint64_t v47 = *(void *)(v46 + 16);
  v181 = v44;
  uint64_t v177 = v46;
  if (v47)
  {
    uint64_t v48 = (uint64_t *)(v46 + 40);
    uint64_t v49 = &_swiftEmptyArrayStorage;
    uint64_t v180 = v136;
    do
    {
      uint64_t v54 = *(v48 - 1);
      uint64_t v53 = *v48;
      if (v54) {
        BOOL v55 = 0;
      }
      else {
        BOOL v55 = v53 == 0xE000000000000000;
      }
      if (!v55 && (sub_100022668() & 1) == 0)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v184 = v49;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_10001C76C(0, v49[2] + 1, 1);
          uint64_t v49 = (void *)v184;
        }
        unint64_t v51 = v49[2];
        unint64_t v50 = v49[3];
        if (v51 >= v50 >> 1)
        {
          sub_10001C76C((char *)(v50 > 1), v51 + 1, 1);
          uint64_t v49 = (void *)v184;
        }
        v49[2] = v51 + 1;
        id v52 = &v49[2 * v51];
        v52[4] = v54;
        v52[5] = v53;
        uint64_t v44 = v181;
      }
      v48 += 2;
      --v47;
    }
    while (v47);
  }
  else
  {
    uint64_t v49 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  unint64_t v57 = v49[2];
  if (v57)
  {
    uint64_t v58 = v49[5];
    *(void *)&long long v184 = v49[4];
    *((void *)&v184 + 1) = v58;
    swift_bridgeObjectRetain();
    uint64_t v59 = v138;
    sub_100021AD8();
    uint64_t v60 = sub_1000225A8();
    uint64_t v62 = v61;
    v44(v59, v174);
    swift_bridgeObjectRelease();
    uint64_t v180 = sub_10001CA9C(v60, v62, v183, v182 & 1, v26);
    uint64_t v176 = v64;
    uint64_t v177 = v63;
    uint64_t v175 = v65;
    if (v57 > v49[2]) {
      goto LABEL_28;
    }
    uint64_t v66 = (uint64_t)&v49[2 * v57 + 4];
    uint64_t v67 = *(void *)(v66 - 8);
    *(void *)&long long v184 = *(void *)(v66 - 16);
    *((void *)&v184 + 1) = v67;
    swift_bridgeObjectRetain();
    sub_100021AD8();
    uint64_t v68 = sub_1000225A8();
    long long v69 = v59;
    uint64_t v70 = v68;
    uint64_t v72 = v71;
    v181(v69, v174);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v180 = sub_10001CA9C(0, 0, v183, v182 & 1, v26);
    uint64_t v176 = v74;
    uint64_t v177 = v73;
    uint64_t v175 = v75;
    uint64_t v62 = 0;
    uint64_t v60 = 0;
    uint64_t v70 = 0;
    uint64_t v72 = 0;
  }
  long long v184 = 0u;
  long long v185 = 0u;
  uint64_t v76 = v49[2];
  if (v76)
  {
    swift_bridgeObjectRetain();
    uint64_t v77 = v49 + 5;
    do
    {
      uint64_t v78 = *v77;
      uint64_t v188 = *(v77 - 1);
      uint64_t v189 = v78;
      swift_bridgeObjectRetain();
      sub_10001CED8((uint64_t)&v184, &v188, v60, v62, v70, v72, v182 & 1, v26, v183);
      v77 += 2;
      swift_bridgeObjectRelease();
      --v76;
    }
    while (v76);
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v79 = *((void *)&v184 + 1);
  uint64_t v182 = v184;
  long long v80 = v185;
  sub_100021FC8();
  sub_100021FA8();
  v181 = (void (*)(char *, uint64_t))sub_100021FD8();
  swift_release();
  uint64_t v81 = sub_100021EE8();
  v82 = v179;
  uint64_t *v179 = v81;
  v82[1] = 0;
  *((unsigned char *)v82 + 16) = 0;
  v83 = (char *)v82 + *(int *)(sub_100001D88(&qword_10002D2E0) + 44);
  *(void *)&long long v184 = v180;
  *((void *)&v184 + 1) = v177;
  *(void *)&long long v185 = v176;
  *((void *)&v185 + 1) = v175;
  sub_100001D88(&qword_10002D2E8);
  sub_10001D34C();
  v84 = v164;
  sub_100022068();
  uint64_t v85 = v166;
  uint64_t v86 = *(void (**)(char *, char *, uint64_t))(v166 + 16);
  v87 = v165;
  uint64_t v88 = v167;
  v86(v165, v84, v167);
  v86(v83, v87, v88);
  v89 = &v83[*(int *)(sub_100001D88(&qword_10002D2F8) + 48)];
  uint64_t v90 = v182;
  *(void *)v89 = v182;
  *((void *)v89 + 1) = v79;
  *((_OWORD *)v89 + 1) = v80;
  sub_10001D3B8(v90, v79, v80, *((uint64_t *)&v80 + 1));
  sub_10001D3B8(v90, v79, v80, *((uint64_t *)&v80 + 1));
  uint64_t v91 = *(void (**)(char *, uint64_t))(v85 + 8);
  v91(v84, v88);
  uint64_t v174 = v79;
  uint64_t v166 = v80;
  sub_10001D308(v90, v79, v80, *((uint64_t *)&v80 + 1));
  unint64_t v92 = v87;
  v93 = v181;
  v91(v92, v88);
  uint64_t v94 = v169;
  v95 = v168;
  uint64_t v96 = v170;
  (*(void (**)(char *, void, uint64_t))(v169 + 104))(v168, enum case for WidgetFamily.accessoryRectangular(_:), v170);
  sub_10001D3FC(&qword_10002C720, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_1000224D8();
  sub_1000224D8();
  uint64_t v97 = v184;
  uint64_t v98 = v188;
  (*(void (**)(char *, uint64_t))(v94 + 8))(v95, v96);
  v99 = 0;
  if (v97 != v98)
  {
    swift_retain();
    v99 = (void (*)(void, void))v93;
  }
  uint64_t KeyPath = swift_getKeyPath();
  v101 = v179;
  uint64_t v102 = v172;
  sub_100005BC8((uint64_t)v179, v172, &qword_10002D228);
  v103 = (uint64_t *)(v102 + *(int *)(v171 + 36));
  uint64_t *v103 = KeyPath;
  v103[1] = (uint64_t)v99;
  sub_1000048C0((uint64_t)v101, &qword_10002D228);
  uint64_t v104 = enum case for DynamicTypeSize.xxLarge(_:);
  uint64_t v105 = sub_100021C68();
  uint64_t v106 = (uint64_t)v173;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v105 - 8) + 104))(v173, v104, v105);
  sub_10001D3FC(&qword_10002D300, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (sub_100022488())
  {
    sub_10001C1A8();
    sub_100009C94(&qword_10002D240, &qword_10002D210);
    v107 = v143;
    sub_1000220C8();
    sub_1000048C0(v106, &qword_10002D210);
    sub_1000048C0(v102, &qword_10002D208);
    uint64_t v108 = swift_getKeyPath();
    uint64_t v109 = v149;
    uint64_t v110 = (uint64_t)v142;
    uint64_t v111 = v152;
    (*(void (**)(char *, char *, uint64_t))(v149 + 16))(v142, v107, v152);
    v112 = (uint64_t *)(v110 + *(int *)(v144 + 36));
    uint64_t *v112 = v108;
    v112[1] = 0x3FE4CCCCCCCCCCCDLL;
    (*(void (**)(char *, uint64_t))(v109 + 8))(v107, v111);
    sub_10001C084();
    v113 = v145;
    sub_1000220A8();
    sub_1000048C0(v110, &qword_10002D1F8);
    uint64_t v114 = swift_getKeyPath();
    uint64_t v115 = v153;
    uint64_t v116 = (uint64_t)v147;
    uint64_t v117 = v154;
    (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v147, v113, v154);
    uint64_t v118 = v116 + *(int *)(v140 + 36);
    *(void *)uint64_t v118 = v114;
    *(void *)(v118 + 8) = 0;
    *(unsigned char *)(v118 + 16) = 1;
    (*(void (**)(char *, uint64_t))(v115 + 8))(v113, v117);
    uint64_t v119 = swift_getKeyPath();
    uint64_t v120 = v148;
    sub_100005BC8(v116, v148, &qword_10002D1F0);
    v121 = (uint64_t *)(v120 + *(int *)(v151 + 36));
    uint64_t *v121 = v119;
    v121[1] = 0xC000000000000000;
    sub_1000048C0(v116, &qword_10002D1F0);
    sub_10001BF10();
    v122 = v150;
    sub_1000220D8();
    sub_1000048C0(v120, &qword_10002D1D8);
    uint64_t v123 = swift_getKeyPath();
    uint64_t v124 = v155;
    uint64_t v125 = (uint64_t)v157;
    uint64_t v126 = v156;
    (*(void (**)(char *, char *, uint64_t))(v155 + 16))(v157, v122, v156);
    uint64_t v127 = v125 + *(int *)(v141 + 36);
    *(void *)uint64_t v127 = v123;
    *(unsigned char *)(v127 + 8) = 0;
    (*(void (**)(char *, uint64_t))(v124 + 8))(v122, v126);
    uint64_t v128 = v161;
    v129 = v160;
    uint64_t v130 = v162;
    (*(void (**)(char *, void, uint64_t))(v161 + 104))(v160, enum case for Image.Scale.small(_:), v162);
    uint64_t v131 = swift_getKeyPath();
    uint64_t v132 = (uint64_t)v158;
    v133 = (uint64_t *)&v158[*(int *)(v146 + 36)];
    uint64_t v134 = sub_100001D88(&qword_10002D280);
    (*(void (**)(char *, char *, uint64_t))(v128 + 16))((char *)v133 + *(int *)(v134 + 28), v129, v130);
    uint64_t *v133 = v131;
    sub_100005BC8(v125, v132, &qword_10002D1D0);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v129, v130);
    sub_1000048C0(v125, &qword_10002D1D0);
    sub_10000681C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v163, 0.0, 1, *(double *)(v183 + *(int *)(v178 + 32)), 0, *(void *)(v183 + *(int *)(v178 + 44)), *(void *)(v183 + *(int *)(v178 + 44) + 8));
    sub_10001D308(v180, v177, v176, v175);
    swift_release();
    sub_1000048C0(v132, &qword_10002C8E0);
    return sub_10001D308(v182, v174, v166, *((uint64_t *)&v80 + 1));
  }
  __break(1u);
LABEL_28:
  __break(1u);
  sub_10001D308(v184, *((uint64_t *)&v184 + 1), v185, *((uint64_t *)&v185 + 1));
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_100018608(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_100022668();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_100022668() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000186D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v62 = (char *)sub_100001D88(&qword_10002D198);
  __chkstk_darwin(v62);
  BOOL v55 = (_OWORD *)((char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v58 = sub_100001D88(&qword_10002D1A0);
  __chkstk_darwin(v58);
  uint64_t v61 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100001D88(&qword_10002C8E8);
  __chkstk_darwin(v57);
  uint64_t v56 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100001D88(&qword_10002D1A8);
  __chkstk_darwin(v66);
  uint64_t v60 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100001D88(&qword_10002D1B0);
  __chkstk_darwin(v65);
  uint64_t v63 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = (int *)type metadata accessor for TitleView(0);
  __chkstk_darwin(v68);
  uint64_t v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  BOOL v12 = (char *)&v55 - v11;
  uint64_t v13 = sub_1000223A8();
  uint64_t v59 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for PlaceholderTitleView(0);
  __chkstk_darwin(v64);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v55 - v19;
  uint64_t v21 = *(void *)a1;
  char v22 = *(unsigned char *)(a1 + 8);
  sub_100009588(*(void *)a1, v22);
  char v23 = sub_100003150(v21, v22);
  sub_100005514(v21, v22);
  if ((v23 & 1) == 0)
  {
    uint64_t v35 = v60;
    uint64_t v34 = (uint64_t)v61;
    uint64_t v36 = a1 + v68[6];
    uint64_t v37 = *(void *)v36;
    char v38 = *(unsigned char *)(v36 + 8);
    sub_100009588(*(void *)v36, v38);
    char v39 = sub_100003150(v37, v38);
    sub_100005514(v37, v38);
    sub_10001C338(a1, (uint64_t)v9, type metadata accessor for TitleView);
    uint64_t v40 = a1;
    if (v39)
    {
      char v41 = v9[v68[10]];
      sub_10001C3A0((uint64_t)v9, type metadata accessor for TitleView);
      uint64_t v42 = (uint64_t)v63;
      uint64_t v43 = (uint64_t)v35;
      uint64_t v44 = v34;
      if ((v41 & 1) == 0)
      {
        uint64_t v45 = (uint64_t)v55;
        *BOOL v55 = *(_OWORD *)(v40 + v68[11]);
        uint64_t v46 = sub_100001D88(&qword_10002D2A0);
        sub_100018F00(v40, v45 + *(int *)(v46 + 44));
        uint64_t v47 = &qword_10002D198;
        sub_100005BC8(v45, v34, &qword_10002D198);
        swift_storeEnumTagMultiPayload();
        sub_10001E8FC(&qword_10002D1B8, &qword_10002C8E8, (void (*)(void))sub_10001BD9C);
LABEL_11:
        sub_100009C94(&qword_10002D288, &qword_10002D198);
        sub_100021F38();
        sub_1000048C0(v45, v47);
        sub_100005BC8(v43, v42, &qword_10002D1A8);
        swift_storeEnumTagMultiPayload();
        sub_10001D3FC(&qword_10002D290, (void (*)(uint64_t))type metadata accessor for PlaceholderTitleView);
        sub_10001C26C();
        sub_100021F38();
        return sub_1000048C0(v43, &qword_10002D1A8);
      }
    }
    else
    {
      sub_10001C3A0((uint64_t)v9, type metadata accessor for TitleView);
      uint64_t v42 = (uint64_t)v63;
      uint64_t v43 = (uint64_t)v35;
      uint64_t v44 = v34;
    }
    uint64_t v45 = v56;
    sub_100017348(0, v56);
    uint64_t v47 = &qword_10002C8E8;
    sub_100005BC8(v45, v44, &qword_10002C8E8);
    swift_storeEnumTagMultiPayload();
    sub_10001E8FC(&qword_10002D1B8, &qword_10002C8E8, (void (*)(void))sub_10001BD9C);
    goto LABEL_11;
  }
  uint64_t v62 = v20;
  uint64_t v24 = v68;
  uint64_t v25 = v59;
  uint64_t v26 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v15, a1 + v68[9], v13);
  uint64_t v27 = (uint64_t *)(a1 + v24[11]);
  uint64_t v28 = *v27;
  uint64_t v61 = (char *)v27[1];
  uint64_t v29 = a1 + v24[6];
  uint64_t v30 = *(void *)v29;
  char v31 = *(unsigned char *)(v29 + 8);
  sub_100009588(*(void *)v29, v31);
  char v32 = sub_100003150(v30, v31);
  sub_100005514(v30, v31);
  sub_10001C338(a1, (uint64_t)v12, type metadata accessor for TitleView);
  if (v32) {
    char v33 = v12[v68[10]];
  }
  else {
    char v33 = 1;
  }
  uint64_t v48 = (uint64_t)v63;
  sub_10001C3A0((uint64_t)v12, type metadata accessor for TitleView);
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v17, v15, v26);
  uint64_t v49 = v64;
  unint64_t v50 = &v17[*(int *)(v64 + 20)];
  unint64_t v51 = v61;
  *(void *)unint64_t v50 = v28;
  *((void *)v50 + 1) = v51;
  v17[*(int *)(v49 + 24)] = v33;
  *(void *)&v17[*(int *)(v49 + 28)] = 0x3FD3333333333333;
  uint64_t v52 = (uint64_t)v17;
  uint64_t v53 = (uint64_t)v62;
  sub_10001DA30(v52, (uint64_t)v62, type metadata accessor for PlaceholderTitleView);
  sub_10001C338(v53, v48, type metadata accessor for PlaceholderTitleView);
  swift_storeEnumTagMultiPayload();
  sub_10001D3FC(&qword_10002D290, (void (*)(uint64_t))type metadata accessor for PlaceholderTitleView);
  sub_10001C26C();
  sub_100021F38();
  return sub_10001C3A0(v53, type metadata accessor for PlaceholderTitleView);
}

uint64_t sub_100018F00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v45 = sub_100001D88(&qword_10002D2A8);
  __chkstk_darwin(v45);
  uint64_t v48 = (uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v44 = (uint64_t)&v43 - v5;
  __chkstk_darwin(v6);
  uint64_t v46 = (uint64_t)&v43 - v7;
  uint64_t v8 = type metadata accessor for TitleView(0);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v43 - v13;
  uint64_t v15 = sub_100001D88(&qword_10002C8E8);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v43 - v19;
  uint64_t v21 = sub_100001D88(&qword_10002D2B0);
  __chkstk_darwin(v21 - 8);
  uint64_t v43 = (uint64_t)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v43 - v24;
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v43 - v27;
  uint64_t v29 = a1 + *(int *)(v9 + 32);
  uint64_t v30 = *(void *)v29;
  char v31 = *(unsigned char *)(v29 + 8);
  sub_100009588(*(void *)v29, v31);
  sub_100003150(v30, v31);
  sub_100005514(v30, v31);
  sub_10001C338(a1, (uint64_t)v14, type metadata accessor for TitleView);
  sub_10001C3A0((uint64_t)v14, type metadata accessor for TitleView);
  sub_100017348(1, (uint64_t)v20);
  sub_100005AAC((uint64_t)v20, (uint64_t)v25, &qword_10002C8E8);
  sub_100005AAC((uint64_t)v25, (uint64_t)v28, &qword_10002D2B0);
  uint64_t v32 = *(void *)v29;
  LOBYTE(v25) = *(unsigned char *)(v29 + 8);
  sub_100009588(*(void *)v29, (char)v25);
  sub_100003150(v32, (char)v25);
  sub_100005514(v32, (char)v25);
  sub_10001C338(a1, (uint64_t)v11, type metadata accessor for TitleView);
  sub_10001C3A0((uint64_t)v11, type metadata accessor for TitleView);
  sub_100017348(0, (uint64_t)v17);
  if (qword_10002C5C8 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_10002E490;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = v44;
  sub_100005BC8((uint64_t)v17, v44, &qword_10002C8E8);
  uint64_t v36 = (uint64_t *)(v35 + *(int *)(v45 + 36));
  *uint64_t v36 = KeyPath;
  v36[1] = v33;
  swift_retain();
  sub_1000048C0((uint64_t)v17, &qword_10002C8E8);
  uint64_t v37 = v46;
  sub_100005AAC(v35, v46, &qword_10002D2A8);
  uint64_t v38 = v43;
  sub_100005BC8((uint64_t)v28, v43, &qword_10002D2B0);
  uint64_t v39 = v48;
  sub_100005BC8(v37, v48, &qword_10002D2A8);
  uint64_t v40 = v47;
  sub_100005BC8(v38, v47, &qword_10002D2B0);
  uint64_t v41 = sub_100001D88(&qword_10002D2B8);
  sub_100005BC8(v39, v40 + *(int *)(v41 + 48), &qword_10002D2A8);
  sub_1000048C0(v37, &qword_10002D2A8);
  sub_1000048C0((uint64_t)v28, &qword_10002D2B0);
  sub_1000048C0(v39, &qword_10002D2A8);
  return sub_1000048C0(v38, &qword_10002D2B0);
}

uint64_t sub_100019370@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100001D88(&qword_10002D180);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100001D88(&qword_10002D188);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_100021EE8();
  *((void *)v5 + 1) = 0;
  v5[16] = 0;
  uint64_t v10 = sub_100001D88(&qword_10002D190);
  sub_1000186D0(v1, (uint64_t)&v5[*(int *)(v10 + 44)]);
  sub_100005BC8((uint64_t)v5, (uint64_t)v9, &qword_10002D180);
  *(_WORD *)&v9[*(int *)(v7 + 44)] = 256;
  sub_1000048C0((uint64_t)v5, &qword_10002D180);
  return sub_100005AAC((uint64_t)v9, a1, &qword_10002D188);
}

uint64_t sub_1000194AC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v41 = sub_1000222B8();
  uint64_t v40 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v39 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100022138();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void *)(a1 + 24);
  uint64_t v35 = sub_100021BF8();
  uint64_t v8 = sub_100021C88();
  uint64_t v38 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v32 - v9;
  sub_100021CB8();
  uint64_t v11 = sub_100021C88();
  uint64_t v37 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v33 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v36 = (char *)&v32 - v14;
  sub_100001D88(&qword_10002D370);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1000235E0;
  uint64_t v16 = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v17(v7, enum case for Color.RGBColorSpace.sRGB(_:), v4);
  sub_1000221A8();
  *(void *)(v15 + 32) = sub_100022248();
  *(void *)(v15 + 40) = v18;
  v17(v7, v16, v4);
  sub_1000221A8();
  *(void *)(v15 + 48) = sub_100022248();
  *(void *)(v15 + 56) = v19;
  sub_100022258();
  sub_1000222C8();
  sub_1000222F8();
  sub_100021C48();
  long long v47 = v50[0];
  long long v48 = v50[1];
  uint64_t v49 = v51;
  unint64_t v20 = sub_100014464();
  sub_100022108();
  sub_10001EBDC((uint64_t)v50);
  uint64_t v21 = v40;
  uint64_t v22 = v39;
  uint64_t v23 = v41;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, enum case for BlendMode.plusLighter(_:), v41);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v45 = v20;
  uint64_t v46 = WitnessTable;
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = v33;
  sub_100022128();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v8);
  uint64_t v43 = v25;
  uint64_t v44 = &protocol witness table for _BlendModeEffect;
  swift_getWitnessTable();
  uint64_t v27 = v37;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  uint64_t v29 = v36;
  v28(v36, v26, v11);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  v30(v26, v11);
  v28(v42, v29, v11);
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, v11);
}

void *sub_100019A00@<X0>(void *a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = sub_100001D88(&qword_10002D4F0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100021FE8();
  uint64_t v5 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000223A8();
  uint64_t v9 = *(void *)(v8 - 8);
  __n128 v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v9 + 104))(v12, enum case for WidgetFamily.accessoryRectangular(_:), v8, v10);
  sub_10001D3FC(&qword_10002C720, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  uint64_t v25 = v1;
  sub_1000224D8();
  sub_1000224D8();
  uint64_t v13 = *(void *)&v38[0];
  uint64_t v14 = v39;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  if (v13 == v14)
  {
    uint64_t v24 = sub_100021F88();
  }
  else
  {
    uint64_t v15 = v27;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Font.TextStyle.title2(_:), v27);
    uint64_t v16 = sub_100021F98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 1, 1, v16);
    sub_100021FA8();
    uint64_t v24 = sub_100021FB8();
    sub_1000048C0((uint64_t)v4, &qword_10002D4F0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v15);
  }
  uint64_t v27 = sub_100021EE8();
  sub_100019F68(0x1000000000000010, 0x80000001000241F0, 0, (uint64_t)&_swiftEmptyArrayStorage, (uint64_t)v28);
  *(_OWORD *)&v29[87] = v28[5];
  *(_OWORD *)&v29[103] = v28[6];
  *(_OWORD *)&v29[119] = v28[7];
  *(_OWORD *)&v29[135] = v28[8];
  *(_OWORD *)&v29[23] = v28[1];
  *(_OWORD *)&v29[39] = v28[2];
  *(_OWORD *)&v29[55] = v28[3];
  *(_OWORD *)&v29[71] = v28[4];
  char v30 = 0;
  *(_OWORD *)&v29[7] = v28[0];
  if (qword_10002C5C8 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_10002E490;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = swift_getKeyPath();
  uint64_t v20 = swift_getKeyPath();
  char v31 = 0;
  uint64_t v21 = *(void *)(v25 + *(int *)(type metadata accessor for PlaceholderTitleView(0) + 28));
  uint64_t v22 = swift_getKeyPath();
  *(_OWORD *)((char *)&v33[7] + 1) = *(_OWORD *)&v29[112];
  *(_OWORD *)((char *)&v33[6] + 1) = *(_OWORD *)&v29[96];
  *(_OWORD *)((char *)&v33[8] + 1) = *(_OWORD *)&v29[128];
  *(_OWORD *)((char *)&v33[2] + 1) = *(_OWORD *)&v29[32];
  *(_OWORD *)((char *)&v33[3] + 1) = *(_OWORD *)&v29[48];
  *(_OWORD *)((char *)&v33[4] + 1) = *(_OWORD *)&v29[64];
  *(_OWORD *)((char *)&v33[5] + 1) = *(_OWORD *)&v29[80];
  *(_OWORD *)((char *)v33 + 1) = *(_OWORD *)v29;
  v32[0] = v27;
  v32[1] = 0;
  LOBYTE(v33[0]) = 0;
  *(_OWORD *)((char *)&v33[1] + 1) = *(_OWORD *)&v29[16];
  *(void *)&v33[9] = *(void *)&v29[143];
  *((void *)&v33[9] + 1) = KeyPath;
  *(void *)&long long v34 = v17;
  *((void *)&v34 + 1) = v19;
  *(void *)&long long v35 = v24;
  *((void *)&v35 + 1) = v20;
  *(void *)&long long v36 = 1;
  BYTE8(v36) = v31;
  *(void *)&long long v37 = v22;
  *((void *)&v37 + 1) = v21;
  long long v43 = v33[3];
  long long v44 = v33[4];
  long long v41 = v33[1];
  long long v42 = v33[2];
  long long v48 = v33[8];
  long long v47 = v33[7];
  long long v45 = v33[5];
  long long v46 = v33[6];
  long long v53 = v37;
  long long v49 = v33[9];
  long long v50 = v34;
  long long v51 = v35;
  long long v52 = v36;
  long long v39 = (unint64_t)v27;
  long long v40 = v33[0];
  swift_retain();
  swift_retain();
  sub_100006A48(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v38, 0.0, 1, 0.0, 1);
  swift_release();
  sub_10001EAAC((uint64_t)v32);
  return memcpy(v26, v38, 0x160uLL);
}

uint64_t sub_100019F68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = a3 & 1;
  sub_100009C84(a1, a2, a3 & 1);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1000222A8();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = v9;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = a1;
  *(void *)(a5 + 40) = a2;
  *(unsigned char *)(a5 + 48) = v9;
  *(void *)(a5 + 56) = a4;
  *(void *)(a5 + 64) = v10;
  *(void *)(a5 + 72) = v11;
  *(_OWORD *)(a5 + 80) = xmmword_1000235F0;
  *(unsigned char *)(a5 + 96) = 0;
  *(void *)(a5 + 104) = &_swiftEmptyArrayStorage;
  *(_OWORD *)(a5 + 112) = xmmword_100023600;
  *(unsigned char *)(a5 + 128) = 0;
  *(void *)(a5 + 136) = &_swiftEmptyArrayStorage;
  sub_100009C84(a1, a2, v9);
  swift_bridgeObjectRetain();
  sub_100009C84(a1, a2, v9);
  swift_bridgeObjectRetain();
  sub_100009C84(a1, a2, v9);
  swift_bridgeObjectRetain();
  sub_100009C84(0x202D202D202D202DLL, 0xED00002D202D202DLL, 0);
  swift_bridgeObjectRetain();
  sub_100009C84(0x202D202D202D202DLL, 0xEA0000000000202DLL, 0);
  swift_bridgeObjectRetain();
  sub_10000A030(0x202D202D202D202DLL, 0xEA0000000000202DLL, 0);
  swift_bridgeObjectRelease();
  sub_10000A030(0x202D202D202D202DLL, 0xED00002D202D202DLL, 0);
  swift_bridgeObjectRelease();
  sub_10000A030(a1, a2, v9);
  swift_bridgeObjectRelease();
  sub_10000A030(a1, a2, v9);

  return swift_bridgeObjectRelease();
}

void sub_10001A158(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v137 = a2;
  uint64_t v3 = sub_100022318();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_100001D88(&qword_10002D280);
  __chkstk_darwin(v128);
  uint64_t v131 = (uint64_t *)((char *)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v133 = sub_100001D88(&qword_10002D350);
  __chkstk_darwin(v133);
  uint64_t v130 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_1000221F8();
  uint64_t v132 = *(void *)(v134 - 8);
  *(void *)&double v9 = __chkstk_darwin(v134).n128_u64[0];
  uint64_t v129 = (uint64_t)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v136 = a1;
  if (!a1 || (id v11 = objc_msgSend(v136, "bodyContent", v9)) == 0)
  {
    sub_100022308();
    sub_100022328();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    id v16 = [objc_allocWithZone((Class)TPSPlaceholderWidgetContent) init];
    id v17 = [v16 bodyText];

    if (v17)
    {
      uint64_t v18 = sub_100022498();
      unint64_t v20 = v19;
    }
    else
    {
      uint64_t v18 = 0;
      unint64_t v20 = 0xE000000000000000;
    }
    uint64_t v149 = v18;
    unint64_t v150 = v20;
    sub_100009ECC();
    swift_bridgeObjectRetain();
    uint64_t v96 = sub_100022048();
    uint64_t v98 = v97;
    char v100 = v99 & 1;
    sub_100022158();
    uint64_t v101 = sub_100022008();
    unint64_t v103 = v102;
    char v105 = v104;
    v107 = v106;
    swift_release();
    sub_10000A030(v96, v98, v100);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v149 = v101;
    unint64_t v150 = v103;
    char v151 = v105 & 1;
    uint64_t v152 = v107;
    uint64_t v108 = sub_100022238();
    goto LABEL_71;
  }
  uint64_t v12 = v11;
  sub_100001D88(&qword_10002D308);
  uint64_t v13 = sub_1000224E8();

  uint64_t v141 = *(void *)(v13 + 16);
  if (!v141)
  {
    uint64_t v109 = 0;
    char v110 = 0;
    uint64_t v140 = _swiftEmptyArrayStorage;
    uint64_t v15 = 0xE000000000000000;
LABEL_68:
    uint64_t v111 = v129;
    sub_10001B200(v13, v129);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    v113 = v131;
    uint64_t v114 = v132;
    uint64_t v115 = v134;
    (*(void (**)(char *, uint64_t, uint64_t))(v132 + 16))((char *)v131 + *(int *)(v128 + 28), v111, v134);
    uint64_t *v113 = KeyPath;
    uint64_t v116 = v130;
    sub_100005BC8((uint64_t)v113, (uint64_t)&v130[*(int *)(v133 + 36)], &qword_10002D280);
    *(void *)uint64_t v116 = v109;
    *((void *)v116 + 1) = v15;
    char v117 = v110 & 1;
    v116[16] = v117;
    *((void *)v116 + 3) = v140;
    sub_100009C84(v109, v15, v117);
    swift_bridgeObjectRetain();
    sub_1000048C0((uint64_t)v113, &qword_10002D280);
    sub_10001D898();
    uint64_t v108 = sub_100022238();
    sub_10000A030(v109, v15, v117);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v111, v115);
    goto LABEL_71;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  uint64_t v139 = 0;
  int v138 = 0;
  uint64_t v15 = 0xE000000000000000;
  v142 = (char *)&type metadata for Any + 8;
  uint64_t v140 = _swiftEmptyArrayStorage;
  uint64_t v125 = v13;
  while (1)
  {
    uint64_t v143 = v14;
    swift_bridgeObjectRetain();
    Class isa = sub_100022478().super.isa;
    swift_bridgeObjectRelease();
    *(void *)&long long v147 = 1701869940;
    *((void *)&v147 + 1) = 0xE400000000000000;
    uint64_t v42 = sub_100022678();
    Class v144 = isa;
    id v43 = [(objc_class *)isa __swift_objectForKeyedSubscript:v42];
    swift_unknownObjectRelease();
    if (v43)
    {
      sub_1000225C8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v147 = 0u;
      long long v148 = 0u;
    }
    sub_100005AAC((uint64_t)&v147, (uint64_t)&v149, &qword_10002D310);
    if (!v152)
    {
      swift_bridgeObjectRelease();
      sub_1000048C0((uint64_t)&v149, &qword_10002D310);
      swift_bridgeObjectRelease();
      goto LABEL_70;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      break;
    }
    id v45 = v145;
    long long v44 = v146;
    if ((v145 != (id)1954047348 || v146 != (void *)0xE400000000000000) && (sub_100022668() & 1) == 0) {
      goto LABEL_23;
    }
    *(void *)&long long v147 = 1954047348;
    *((void *)&v147 + 1) = 0xE400000000000000;
    id v46 = [(objc_class *)v144 __swift_objectForKeyedSubscript:sub_100022678()];
    swift_unknownObjectRelease();
    if (v46)
    {
      sub_1000225C8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v147 = 0u;
      long long v148 = 0u;
    }
    sub_100005AAC((uint64_t)&v147, (uint64_t)&v149, &qword_10002D310);
    if (v152)
    {
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        uint64_t v149 = (uint64_t)v145;
        unint64_t v150 = (unint64_t)v146;
        sub_100009ECC();
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_100022048();
        uint64_t v23 = v22;
        char v25 = v24 & 1;
        sub_100022158();
        uint64_t v135 = v15;
        uint64_t v26 = sub_100022008();
        uint64_t v28 = v27;
        uint64_t v29 = v139;
        char v31 = v30;
        uint64_t v126 = v32;
        swift_release();
        sub_10000A030(v21, v23, v25);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v33 = v138 & 1;
        uint64_t v34 = v135;
        uint64_t v127 = sub_100022028();
        uint64_t v36 = v35;
        uint64_t v38 = v37;
        int v138 = v39 & 1;
        sub_10000A030(v26, v28, v31 & 1);
        uint64_t v13 = v125;
        swift_bridgeObjectRelease();
        sub_10000A030(v29, v34, v33);

        swift_bridgeObjectRelease();
        uint64_t v139 = v127;
        uint64_t v15 = v36;
        uint64_t v140 = v38;
        goto LABEL_8;
      }
LABEL_23:
      if (v45 != (id)0x6C6F626D7973) {
        goto LABEL_28;
      }
      goto LABEL_26;
    }
    sub_1000048C0((uint64_t)&v149, &qword_10002D310);
    if (v45 != (id)0x6C6F626D7973) {
      goto LABEL_28;
    }
LABEL_26:
    if (v44 != (void *)0xE600000000000000)
    {
LABEL_28:
      char v47 = sub_100022668();
      swift_bridgeObjectRelease();
      if ((v47 & 1) == 0)
      {

LABEL_38:
        uint64_t v40 = v143;
        goto LABEL_9;
      }
      goto LABEL_29;
    }
    swift_bridgeObjectRelease();
LABEL_29:
    *(void *)&long long v147 = 0x7372747461;
    *((void *)&v147 + 1) = 0xE500000000000000;
    id v48 = [(objc_class *)v144 __swift_objectForKeyedSubscript:sub_100022678()];
    swift_unknownObjectRelease();
    if (v48)
    {
      sub_1000225C8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v147 = 0u;
      long long v148 = 0u;
    }
    sub_100005AAC((uint64_t)&v147, (uint64_t)&v149, &qword_10002D310);
    if (v152)
    {
      sub_10001D938(0, &qword_10002D320);
      if (swift_dynamicCast())
      {
        id v49 = v145;
        *(void *)&long long v147 = 0x6449676E69727473;
        *((void *)&v147 + 1) = 0xE800000000000000;
        id v50 = [v145 __swift_objectForKeyedSubscript:sub_100022678()];
        swift_unknownObjectRelease();
        if (v50)
        {
          sub_1000225C8();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v147 = 0u;
          long long v148 = 0u;
        }
        sub_100005AAC((uint64_t)&v147, (uint64_t)&v149, &qword_10002D310);
        if (!v152)
        {
          uint64_t v51 = v13;
          BOOL v55 = v49;
          sub_1000048C0((uint64_t)&v149, &qword_10002D310);
LABEL_47:
          char v56 = v138 & 1;
          uint64_t v57 = v139;
          uint64_t v58 = sub_100022028();
          uint64_t v60 = v59;
          uint64_t v62 = v61;
          int v138 = v63 & 1;
          sub_10000A030(v57, v15, v56);

          swift_bridgeObjectRelease();
          uint64_t v139 = v58;
          uint64_t v15 = v60;
          uint64_t v140 = v62;
          uint64_t v40 = v143;
          uint64_t v13 = v51;
          goto LABEL_9;
        }
        uint64_t v51 = v13;
        if ((swift_dynamicCast() & 1) == 0)
        {
          BOOL v55 = v49;
          goto LABEL_47;
        }
        uint64_t v52 = (uint64_t)v145;
        long long v53 = v146;
        uint64_t v149 = 7629921;
        unint64_t v150 = 0xE300000000000000;
        id v54 = [v49 __swift_objectForKeyedSubscript:sub_100022678()];
        swift_unknownObjectRelease();
        if (v54)
        {
          sub_1000225C8();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v147 = 0u;
          long long v148 = 0u;
        }
        uint64_t v64 = v139;
        sub_100005AAC((uint64_t)&v147, (uint64_t)&v149, &qword_10002D310);
        uint64_t v139 = v64;
        if (v152)
        {
          int v65 = swift_dynamicCast();
          uint64_t v66 = (uint64_t)v145;
          if (!v65) {
            uint64_t v66 = 0;
          }
          uint64_t v126 = v66;
          if (v65) {
            uint64_t v67 = (uint64_t)v146;
          }
          else {
            uint64_t v67 = 0;
          }
          uint64_t v127 = v67;
        }
        else
        {
          sub_1000048C0((uint64_t)&v149, &qword_10002D310);
          uint64_t v126 = 0;
          uint64_t v127 = 0;
        }
        sub_10001D938(0, &qword_10002D360);
        swift_bridgeObjectRetain();
        v153._countAndFlagsBits = v52;
        v153._object = v53;
        uint64_t v68 = (void *)sub_100022568(v153);

        if (v68)
        {
          uint64_t v135 = v15;
          swift_bridgeObjectRetain();
          sub_1000221E8();
          uint64_t v123 = swift_retain();
          uint64_t v69 = sub_100022058();
          uint64_t v71 = v70;
          uint64_t v72 = v52;
          char v74 = v73 & 1;
          sub_100022158();
          uint64_t v75 = sub_100022008();
          uint64_t v122 = v76;
          char v78 = v77;
          uint64_t v124 = v79;
          swift_release();
          sub_10000A030(v69, v71, v74);
          swift_bridgeObjectRelease();
          v121 = v53;
          if (v127)
          {
            unint64_t v80 = v127;
            uint64_t v81 = v126;
          }
          else
          {
            swift_bridgeObjectRetain();
            uint64_t v81 = v72;
            unint64_t v80 = (unint64_t)v53;
          }
          uint64_t v149 = v81;
          unint64_t v150 = v80;
          sub_100009ECC();
          swift_bridgeObjectRetain();
          char v82 = v78 & 1;
          uint64_t v83 = v122;
          uint64_t v120 = sub_100022018();
          uint64_t v119 = v84;
          char v86 = v85 & 1;
          sub_10000A030(v75, v83, v82);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          char v87 = v138 & 1;
          uint64_t v88 = v139;
          uint64_t v89 = v135;
          uint64_t v90 = v120;
          uint64_t v91 = v119;
          uint64_t v127 = sub_100022028();
          uint64_t v126 = v92;
          uint64_t v94 = v93;
          int v138 = v95 & 1;
          sub_10000A030(v88, v89, v87);
          swift_bridgeObjectRelease();
          sub_10000A030(v90, v91, v86);

          swift_bridgeObjectRelease();
          uint64_t v139 = v127;
          uint64_t v15 = v126;
          uint64_t v140 = v94;
          uint64_t v13 = v125;
        }
        else
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v13 = v125;
        }
        goto LABEL_38;
      }
    }
    else
    {

      sub_1000048C0((uint64_t)&v149, &qword_10002D310);
    }
LABEL_8:
    uint64_t v40 = v143;
LABEL_9:
    uint64_t v14 = v40 + 1;
    if (v141 == v14)
    {
      swift_bridgeObjectRelease();
      char v110 = v138;
      uint64_t v109 = v139;
      goto LABEL_68;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_70:
  uint64_t v149 = v139;
  unint64_t v150 = v15;
  char v151 = v138 & 1;
  uint64_t v152 = v140;
  uint64_t v108 = sub_100022238();

LABEL_71:
  *uint64_t v137 = v108;
}

uint64_t sub_10001B200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = sub_1000221F8();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  uint64_t v27 = *(void (**)(__n128))(v4 + 104);
  uint64_t v28 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v26 = enum case for Image.Scale.small(_:);
  v27(v5);
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v24 = v4;
    uint64_t v25 = v3;
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    double v9 = (char *)_swiftEmptyArrayStorage;
    do
    {
      uint64_t v32 = *(void *)(a1 + 8 * v8 + 32);
      sub_10001BAD4(&v32, &v30);
      uint64_t v11 = v31;
      if (v31)
      {
        uint64_t v12 = v30;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          double v9 = sub_100010DBC(0, *((void *)v9 + 2) + 1, 1, v9);
        }
        unint64_t v14 = *((void *)v9 + 2);
        unint64_t v13 = *((void *)v9 + 3);
        if (v14 >= v13 >> 1) {
          double v9 = sub_100010DBC((char *)(v13 > 1), v14 + 1, 1, v9);
        }
        *((void *)v9 + 2) = v14 + 1;
        uint64_t v10 = &v9[16 * v14];
        *((void *)v10 + 4) = v12;
        *((void *)v10 + 5) = v11;
      }
      ++v8;
    }
    while (v7 != v8);
    swift_bridgeObjectRelease();
    uint64_t v4 = v24;
    uint64_t v3 = v25;
    uint64_t v15 = *((void *)v9 + 2);
    if (!v15) {
      goto LABEL_23;
    }
  }
  else
  {
    double v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v15 = _swiftEmptyArrayStorage[2];
    if (!v15)
    {
LABEL_23:
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v29, v28, v3);
    }
  }
  uint64_t v16 = *((void *)v9 + 4);
  id v17 = (void *)*((void *)v9 + 5);
  uint64_t v18 = v15 - 1;
  if (v15 != 1)
  {
    unint64_t v19 = v9 + 56;
    do
    {
      BOOL v20 = *(v19 - 1) == v16 && *v19 == (void)v17;
      if (!v20 && (sub_100022668() & 1) == 0) {
        goto LABEL_23;
      }
      v19 += 2;
    }
    while (--v18);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  switch(sub_10001D974(v16, v17))
  {
    case 1u:
      swift_bridgeObjectRelease();
      goto LABEL_26;
    case 4u:
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v29, v28, v3);
    default:
      char v22 = sub_100022668();
      swift_bridgeObjectRelease();
      uint64_t v23 = v26;
      if (v22) {
LABEL_26:
      }
        uint64_t v23 = enum case for Image.Scale.large(_:);
      ((void (*)(uint64_t, uint64_t, uint64_t))v27)(v29, v23, v3);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v28, v3);
      break;
  }
  return result;
}

uint64_t sub_10001B554@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_100021FF8();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  __chkstk_darwin(v3);
  uint64_t v38 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100001D88(&qword_10002D210);
  __chkstk_darwin(v35);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100001D88(&qword_10002D328);
  uint64_t v7 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  double v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100001D88(&qword_10002D330);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100001D88(&qword_10002D338);
  uint64_t v13 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100001D88(&qword_10002C8F0);
  __chkstk_darwin(v34);
  id v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A158(a1, &v42);
  uint64_t v18 = enum case for DynamicTypeSize.xxLarge(_:);
  uint64_t v19 = sub_100021C68();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v6, v18, v19);
  sub_10001D3FC(&qword_10002D300, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_100022488();
  if (result)
  {
    sub_100009C94(&qword_10002D240, &qword_10002D210);
    sub_1000220C8();
    sub_1000048C0((uint64_t)v6, &qword_10002D210);
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v22 = v36;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v36);
    uint64_t v23 = (uint64_t *)&v12[*(int *)(v10 + 36)];
    *uint64_t v23 = KeyPath;
    v23[1] = 0x3FE6666666666666;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
    sub_10001D720();
    sub_1000220D8();
    sub_1000048C0((uint64_t)v12, &qword_10002D330);
    uint64_t v25 = v38;
    uint64_t v24 = v39;
    uint64_t v26 = v40;
    (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, enum case for Text.TruncationMode.tail(_:), v40);
    uint64_t v27 = swift_getKeyPath();
    uint64_t v28 = (uint64_t *)&v17[*(int *)(v34 + 36)];
    uint64_t v29 = sub_100001D88(&qword_10002D348);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))((char *)v28 + *(int *)(v29 + 28), v25, v26);
    *uint64_t v28 = v27;
    uint64_t v30 = v37;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v15, v37);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v30);
    uint64_t v31 = sub_100022278();
    sub_100006C2C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v41, 0.0, 1, 0.0, 1, v31, v32);
    return sub_1000048C0((uint64_t)v17, &qword_10002C8F0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BAD4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_1000225F8();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10001C504((uint64_t)v12), (v5 & 1) != 0))
  {
    sub_100005744(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_10001D660((uint64_t)v12);
  if (!*((void *)&v14 + 1)) {
    goto LABEL_21;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_22;
  }
  char v7 = sub_100022668();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    goto LABEL_22;
  }
  sub_1000225F8();
  if (*(void *)(v3 + 16) && (unint64_t v8 = sub_10001C504((uint64_t)v12), (v9 & 1) != 0))
  {
    sub_100005744(*(void *)(v3 + 56) + 32 * v8, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_10001D660((uint64_t)v12);
  if (!*((void *)&v14 + 1)) {
    goto LABEL_21;
  }
  sub_100001D88(&qword_10002D308);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_22;
  }
  sub_1000225F8();
  if (MEMORY[0x7372747471] && (unint64_t v10 = sub_10001C504((uint64_t)v12), (v11 & 1) != 0))
  {
    sub_100005744(MEMORY[0x7372747499] + 32 * v10, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10001D660((uint64_t)v12);
  if (!*((void *)&v14 + 1))
  {
LABEL_21:
    uint64_t result = sub_1000048C0((uint64_t)&v13, &qword_10002D310);
    goto LABEL_22;
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *a2 = 1702521203;
    a2[1] = 0xE400000000000000;
    return result;
  }
LABEL_22:
  *a2 = 0;
  a2[1] = 0;
  return result;
}

uint64_t sub_10001BD58@<X0>(uint64_t a1@<X8>)
{
  return sub_10001B554(*v1, a1);
}

uint64_t sub_10001BD60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for PlaceholderTitleView(uint64_t a1)
{
  return sub_100008870(a1, qword_10002D478);
}

unint64_t sub_10001BD9C()
{
  unint64_t result = qword_10002D1C0;
  if (!qword_10002D1C0)
  {
    sub_100002518(&qword_10002C8E0);
    sub_10001BE3C();
    sub_100009C94(&qword_10002D278, &qword_10002D280);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1C0);
  }
  return result;
}

unint64_t sub_10001BE3C()
{
  unint64_t result = qword_10002D1C8;
  if (!qword_10002D1C8)
  {
    sub_100002518(&qword_10002D1D0);
    sub_100002518(&qword_10002D1D8);
    sub_10001BF10();
    swift_getOpaqueTypeConformance2();
    sub_100009C94(&qword_10002D268, &qword_10002D270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1C8);
  }
  return result;
}

unint64_t sub_10001BF10()
{
  unint64_t result = qword_10002D1E0;
  if (!qword_10002D1E0)
  {
    sub_100002518(&qword_10002D1D8);
    sub_10001BFB0();
    sub_100009C94(&qword_10002D248, &qword_10002D250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1E0);
  }
  return result;
}

unint64_t sub_10001BFB0()
{
  unint64_t result = qword_10002D1E8;
  if (!qword_10002D1E8)
  {
    sub_100002518(&qword_10002D1F0);
    sub_100002518(&qword_10002D1F8);
    sub_10001C084();
    swift_getOpaqueTypeConformance2();
    sub_100009C94(&qword_10002D258, &qword_10002D260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D1E8);
  }
  return result;
}

unint64_t sub_10001C084()
{
  unint64_t result = qword_10002D200;
  if (!qword_10002D200)
  {
    sub_100002518(&qword_10002D1F8);
    sub_100002518(&qword_10002D208);
    sub_100002518(&qword_10002D210);
    sub_10001C1A8();
    sub_100009C94(&qword_10002D240, &qword_10002D210);
    swift_getOpaqueTypeConformance2();
    sub_100009C94(&qword_10002D248, &qword_10002D250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D200);
  }
  return result;
}

unint64_t sub_10001C1A8()
{
  unint64_t result = qword_10002D218;
  if (!qword_10002D218)
  {
    sub_100002518(&qword_10002D208);
    sub_100009C94(&qword_10002D220, &qword_10002D228);
    sub_100009C94(&qword_10002D230, &qword_10002D238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D218);
  }
  return result;
}

unint64_t sub_10001C26C()
{
  unint64_t result = qword_10002D298;
  if (!qword_10002D298)
  {
    sub_100002518(&qword_10002D1A8);
    sub_10001E8FC(&qword_10002D1B8, &qword_10002C8E8, (void (*)(void))sub_10001BD9C);
    sub_100009C94(&qword_10002D288, &qword_10002D198);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D298);
  }
  return result;
}

uint64_t sub_10001C338(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001C3A0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001C400()
{
  return sub_100021D68();
}

uint64_t sub_10001C424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001C8E8(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

unint64_t sub_10001C450(uint64_t a1)
{
  sub_100022688();
  type metadata accessor for CFString(0);
  sub_10001D3FC(&qword_10002D368, type metadata accessor for CFString);
  sub_100021B88();
  Swift::Int v2 = sub_100022698();

  return sub_10001C548(a1, v2);
}

unint64_t sub_10001C504(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000225D8(*(void *)(v2 + 40));

  return sub_10001C6A4(a1, v4);
}

unint64_t sub_10001C548(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_10001D3FC(&qword_10002D368, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_100021B78();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_100021B78();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_10001C6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001D6C4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1000225E8();
      sub_10001D660((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_10001C76C(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10001C78C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10001C78C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100001D88(&qword_10002CD88);
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  long long v13 = v10 + 32;
  long long v14 = a4 + 32;
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
  swift_release();
  return v10;
}

uint64_t sub_10001C890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021D48();
  *a1 = result;
  return result;
}

uint64_t sub_10001C8BC()
{
  return sub_100021D58();
}

uint64_t sub_10001C8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_10001C9B8(char a1, char a2, char a3, char a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7 = a5;
  if (a1)
  {
    if ((a2 & 1) == 0) {
      goto LABEL_8;
    }
LABEL_5:
    if (a4)
    {
      sub_100022178();
LABEL_12:
      swift_retain_n();
      uint64_t v7 = sub_100022008();
      swift_release_n();
      return v7;
    }
    goto LABEL_8;
  }
  if (a2) {
    goto LABEL_5;
  }
  if ((a3 & 1) == 0)
  {
    if (a4) {
      sub_100022188();
    }
    else {
      sub_100022148();
    }
    goto LABEL_12;
  }
LABEL_8:
  sub_100009C84(a5, a6, a7 & 1);
  swift_bridgeObjectRetain();
  return v7;
}

uint64_t sub_10001CA9C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  int v59 = a4;
  uint64_t v9 = type metadata accessor for TitleView(0);
  __chkstk_darwin(v9);
  uint64_t v58 = (uint64_t)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000223A8();
  uint64_t v12 = *(void *)(v11 - 8);
  __n128 v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    uint64_t v16 = a1;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v57 = v16;
  if (a2) {
    uint64_t v17 = a2;
  }
  else {
    uint64_t v17 = 0xE000000000000000;
  }
  (*(void (**)(char *, void, uint64_t, __n128))(v12 + 104))(v15, enum case for WidgetFamily.accessoryRectangular(_:), v11, v13);
  sub_10001D3FC(&qword_10002C720, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_1000224D8();
  sub_1000224D8();
  uint64_t v19 = v60;
  uint64_t v18 = v61;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  if (v18 == v19)
  {
    sub_1000221E8();
    uint64_t v20 = sub_100022058();
    uint64_t v22 = v21;
    char v24 = v23 & 1;
    uint64_t v25 = sub_100022028();
    id v54 = a5;
    uint64_t v55 = v9;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    char v30 = v29 & 1;
    sub_10000A030(v20, v22, v24);
    swift_bridgeObjectRelease();
    uint64_t v31 = v57;
    uint64_t v32 = sub_100022028();
    uint64_t v34 = v33;
    LOBYTE(v20) = v35;
    char v56 = v36;
    swift_bridgeObjectRelease_n();
    char v37 = v20 & 1;
    uint64_t v38 = v26;
    char v39 = v30;
    a5 = v54;
    uint64_t v9 = v55;
    sub_10000A030(v38, v28, v39);
  }
  else
  {
    char v37 = 0;
    char v56 = &_swiftEmptyArrayStorage;
    uint64_t v31 = v57;
    uint64_t v32 = v57;
    uint64_t v34 = v17;
  }
  swift_bridgeObjectRelease();
  char v40 = sub_100018608(v31, v17, a5);
  swift_bridgeObjectRelease();
  uint64_t v41 = *(void *)a3;
  char v42 = *(unsigned char *)(a3 + 8);
  sub_100009588(*(void *)a3, v42);
  char v43 = sub_100003150(v41, v42);
  sub_100005514(v41, v42);
  uint64_t v44 = a3 + *(int *)(v9 + 24);
  uint64_t v45 = *(void *)v44;
  char v46 = *(unsigned char *)(v44 + 8);
  sub_100009588(*(void *)v44, v46);
  uint64_t v47 = v9;
  char v48 = sub_100003150(v45, v46);
  sub_100005514(v45, v46);
  uint64_t v49 = v58;
  sub_10001C338(a3, v58, type metadata accessor for TitleView);
  if (v48) {
    char v50 = *(unsigned char *)(v49 + *(int *)(v47 + 40));
  }
  else {
    char v50 = 1;
  }
  sub_10001C3A0(v49, type metadata accessor for TitleView);
  uint64_t v51 = sub_10001C9B8(v59 & 1, v40 & 1, v43 & 1, v50, v32, v34, v37);
  sub_10000A030(v32, v34, v37);
  swift_bridgeObjectRelease();
  return v51;
}

uint64_t sub_10001CED8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void *a8, uint64_t a9)
{
  uint64_t v63 = a1;
  uint64_t v58 = a5;
  int v59 = a8;
  LODWORD(v62) = a7;
  uint64_t v60 = type metadata accessor for TitleView(0);
  __chkstk_darwin(v60);
  uint64_t v61 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100021AE8();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a2[1];
  uint64_t v64 = *a2;
  uint64_t v65 = v18;
  sub_100021AD8();
  sub_100009ECC();
  uint64_t v19 = sub_1000225A8();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  if (a4)
  {
    BOOL v22 = v19 == a3 && v21 == a4;
    if (v22 || (sub_100022668() & 1) != 0) {
      return swift_bridgeObjectRelease();
    }
  }
  if (a6 && (v19 == v58 ? (BOOL v24 = v21 == a6) : (BOOL v24 = 0), v24 || (sub_100022668() & 1) != 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v58 = v21;
    uint64_t v25 = v19;
  }
  else
  {
    uint64_t v64 = v19;
    uint64_t v65 = v21;
    swift_bridgeObjectRetain();
    v66._countAndFlagsBits = 10;
    v66._object = (void *)0xE100000000000000;
    sub_1000224B8(v66);
    uint64_t v25 = v64;
    uint64_t v58 = v65;
  }
  uint64_t v27 = v60;
  uint64_t v26 = (uint64_t)v61;
  char v28 = sub_100018608(v19, v21, v59);
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)a9;
  char v30 = *(unsigned char *)(a9 + 8);
  sub_100009588(*(void *)a9, v30);
  char v31 = sub_100003150(v29, v30);
  sub_100005514(v29, v30);
  uint64_t v32 = a9 + *(int *)(v27 + 24);
  uint64_t v33 = *(void *)v32;
  char v34 = *(unsigned char *)(v32 + 8);
  sub_100009588(*(void *)v32, v34);
  uint64_t v35 = v27;
  LOBYTE(v27) = sub_100003150(v33, v34);
  sub_100005514(v33, v34);
  sub_10001C338(a9, v26, type metadata accessor for TitleView);
  if (v27) {
    char v36 = *(unsigned char *)(v26 + *(int *)(v35 + 40));
  }
  else {
    char v36 = 1;
  }
  uint64_t v37 = v63;
  char v38 = v62;
  uint64_t v39 = v58;
  sub_10001C3A0(v26, type metadata accessor for TitleView);
  uint64_t v40 = sub_10001C9B8(v38 & 1, v28 & 1, v31 & 1, v36, v25, v39, 0);
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45 & 1;
  sub_10000A030(v25, v39, 0);
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(v37 + 24))
  {
    LODWORD(v63) = v46 != 0;
    int v47 = *(_DWORD *)(v37 + 16);
    uint64_t v48 = *(void *)(v37 + 8);
    uint64_t v60 = *(void *)v37;
    uint64_t v49 = (uint64_t *)v37;
    char v50 = v47 & 1;
    sub_100009C84(v40, v42, v46);
    swift_bridgeObjectRetain();
    LOBYTE(v64) = v50;
    uint64_t v51 = sub_100022028();
    uint64_t v62 = v52;
    uint64_t v63 = v51;
    uint64_t v61 = v53;
    uint64_t v55 = v54 & 1;
    sub_10000A030(v40, v42, v46);
    swift_bridgeObjectRelease();
    sub_10000A030(v40, v42, v46);
    swift_bridgeObjectRelease();
    sub_10000A030(v60, v48, v50);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v56 = v62;
    uint64_t *v49 = v63;
    v49[1] = v56;
    uint64_t v57 = v61;
    v49[2] = v55;
    v49[3] = (uint64_t)v57;
  }
  else
  {
    *(void *)uint64_t v37 = v40;
    *(void *)(v37 + 8) = v42;
    *(void *)(v37 + 16) = v46;
    *(void *)(v37 + 24) = v44;
  }
  return result;
}

uint64_t sub_10001D308(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000A030(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10001D34C()
{
  unint64_t result = qword_10002D2F0;
  if (!qword_10002D2F0)
  {
    sub_100002518(&qword_10002D2E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D2F0);
  }
  return result;
}

uint64_t sub_10001D3B8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100009C84(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001D3FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001D444@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021DB8();
  *a1 = result;
  return result;
}

uint64_t sub_10001D470()
{
  return sub_100021DC8();
}

uint64_t sub_10001D49C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100021D78();
  *a1 = v3;
  return result;
}

uint64_t sub_10001D4C8()
{
  return sub_100021D88();
}

uint64_t sub_10001D4F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100021E08();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10001D524()
{
  return sub_100021E18();
}

uint64_t sub_10001D554@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100021CF8();
  *a1 = v3;
  return result;
}

uint64_t sub_10001D580()
{
  return sub_100021D08();
}

uint64_t sub_10001D5A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100021D98();
  *a1 = result;
  return result;
}

uint64_t sub_10001D5D4()
{
  return sub_100021DA8();
}

uint64_t sub_10001D5FC()
{
  return sub_100021CD8();
}

uint64_t sub_10001D620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001C8E8(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

uint64_t sub_10001D660(uint64_t a1)
{
  return a1;
}

_OWORD *sub_10001D6B4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001D6C4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_10001D720()
{
  unint64_t result = qword_10002D340;
  if (!qword_10002D340)
  {
    sub_100002518(&qword_10002D330);
    sub_100002518(&qword_10002D210);
    sub_100009C94(&qword_10002D240, &qword_10002D210);
    swift_getOpaqueTypeConformance2();
    sub_100009C94(&qword_10002D248, &qword_10002D250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D340);
  }
  return result;
}

uint64_t sub_10001D834()
{
  return sub_100021D38();
}

uint64_t sub_10001D858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001C8E8(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Text.TruncationMode, (uint64_t (*)(char *))&EnvironmentValues.truncationMode.setter);
}

unint64_t sub_10001D898()
{
  unint64_t result = qword_10002D358;
  if (!qword_10002D358)
  {
    sub_100002518(&qword_10002D350);
    sub_100009C94(&qword_10002D278, &qword_10002D280);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D358);
  }
  return result;
}

uint64_t sub_10001D938(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001D974(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000292B0;
  v6._object = a2;
  unint64_t v4 = sub_100022648(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001D9C8()
{
  return sub_100021D68();
}

uint64_t sub_10001D9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001C8E8(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

uint64_t sub_10001DA30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10001DA98()
{
  unint64_t result = qword_10002D398[0];
  if (!qword_10002D398[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10002D398);
  }
  return result;
}

uint64_t sub_10001DAEC()
{
  return swift_getGenericMetadata();
}

ValueMetadata *_s27WidgetTextBaselineAlignmentOMa()
{
  return &_s27WidgetTextBaselineAlignmentON;
}

uint64_t sub_10001DB2C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10001DBBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  Swift::OpaquePointer v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *Swift::OpaquePointer v3 = *a2;
    Swift::OpaquePointer v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_10001DC74(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_10001DCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001DCF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001DD40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001DD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_10001DDE0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_10001DF3C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x10001E154);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for LinearGradientText()
{
  return sub_10001DAEC();
}

void *sub_10001E194(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000223A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_10001E274(uint64_t a1)
{
  uint64_t v2 = sub_1000223A8();
  Swift::OpaquePointer v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_10001E2D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10001E368(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10001E40C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10001E49C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000223A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10001E52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E540);
}

uint64_t sub_10001E540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000223A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_10001E610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001E624);
}

uint64_t sub_10001E624(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000223A8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  }
  return result;
}

uint64_t sub_10001E6E0()
{
  return sub_10001E6F4();
}

uint64_t sub_10001E6F4()
{
  uint64_t result = sub_1000223A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10001E7A4()
{
  unint64_t result = qword_10002D4B8;
  if (!qword_10002D4B8)
  {
    sub_100002518(&qword_10002D4C0);
    sub_10001E818();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D4B8);
  }
  return result;
}

unint64_t sub_10001E818()
{
  unint64_t result = qword_10002D4C8;
  if (!qword_10002D4C8)
  {
    sub_100002518(&qword_10002D188);
    sub_100009C94(&qword_10002D4D0, &qword_10002D180);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D4C8);
  }
  return result;
}

uint64_t sub_10001E8B8()
{
  return sub_10001E8FC(&qword_10002D4D8, &qword_10002C8F8, (void (*)(void))sub_10001E978);
}

uint64_t sub_10001E8FC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002518(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001E978()
{
  unint64_t result = qword_10002D4E0;
  if (!qword_10002D4E0)
  {
    sub_100002518(&qword_10002C8F0);
    sub_100002518(&qword_10002D330);
    sub_10001D720();
    swift_getOpaqueTypeConformance2();
    sub_100009C94(&qword_10002D4E8, &qword_10002D348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D4E0);
  }
  return result;
}

uint64_t sub_10001EA4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EA90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EAAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  char v7 = *(unsigned char *)(a1 + 120);
  uint64_t v10 = *(void *)(a1 + 144);
  uint64_t v11 = *(void *)(a1 + 136);
  char v9 = *(unsigned char *)(a1 + 152);
  sub_10000A030(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_10000A030(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_10000A030(v6, v5, v7);
  swift_bridgeObjectRelease();
  sub_10000A030(v11, v10, v9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_10001EBDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001EC08()
{
  return sub_10001E8FC(&qword_10002D4F8, &qword_10002D500, (void (*)(void))sub_10001EC4C);
}

unint64_t sub_10001EC4C()
{
  unint64_t result = qword_10002D508;
  if (!qword_10002D508)
  {
    sub_100002518(&qword_10002D510);
    sub_10001ECEC();
    sub_100009C94(&qword_10002D248, &qword_10002D250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D508);
  }
  return result;
}

unint64_t sub_10001ECEC()
{
  unint64_t result = qword_10002D518;
  if (!qword_10002D518)
  {
    sub_100002518(&qword_10002D520);
    sub_10001ED8C();
    sub_100009C94(&qword_10002D258, &qword_10002D260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D518);
  }
  return result;
}

unint64_t sub_10001ED8C()
{
  unint64_t result = qword_10002D528;
  if (!qword_10002D528)
  {
    sub_100002518(&qword_10002D530);
    sub_10001EE2C();
    sub_100009C94(&qword_10002D230, &qword_10002D238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D528);
  }
  return result;
}

unint64_t sub_10001EE2C()
{
  unint64_t result = qword_10002D538;
  if (!qword_10002D538)
  {
    sub_100002518(&qword_10002D540);
    sub_10001EECC();
    sub_100009C94(&qword_10002D568, &qword_10002D570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D538);
  }
  return result;
}

unint64_t sub_10001EECC()
{
  unint64_t result = qword_10002D548;
  if (!qword_10002D548)
  {
    sub_100002518(&qword_10002D550);
    sub_100009C94(&qword_10002D558, &qword_10002D560);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D548);
  }
  return result;
}

uint64_t sub_10001EF64()
{
  return swift_getWitnessTable();
}

uint64_t *sub_10001F03C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000223A8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100001D88(&qword_10002C5F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100022378();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    unsigned int v14 = (char *)a1 + v13;
    int v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)v15;
    char v17 = v15[8];
    sub_100009588(*(void *)v15, v17);
    *(void *)unsigned int v14 = v16;
    v14[8] = v17;
    uint64_t v18 = a3[7];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = (int *)type metadata accessor for DocumentEntry();
    uint64_t v22 = *((void *)v21 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = sub_100001D88(&qword_10002C630);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      uint64_t v24 = sub_100021B68();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v19, v20, v24);
      uint64_t v25 = v21[5];
      uint64_t v26 = &v19[v25];
      uint64_t v27 = &v20[v25];
      uint64_t v28 = sub_100022458();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
      {
        uint64_t v30 = sub_100001D88(&qword_10002C668);
        memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
      }
      uint64_t v31 = v21[6];
      uint64_t v32 = *(void **)&v20[v31];
      *(void *)&v19[v31] = v32;
      uint64_t v33 = v21[7];
      char v34 = *(void **)&v20[v33];
      *(void *)&v19[v33] = v34;
      uint64_t v35 = *(void (**)(char *, void, uint64_t, int *))(v22 + 56);
      id v36 = v32;
      id v37 = v34;
      v35(v19, 0, 1, v21);
    }
  }
  return a1;
}

void sub_10001F410(uint64_t a1, int *a2)
{
  sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000223A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100022378();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_100005514(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = (int *)type metadata accessor for DocumentEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v8 - 1) + 48))(v7, 1, v8))
  {
    uint64_t v9 = sub_100021B68();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v7, v9);
    uint64_t v10 = v7 + v8[5];
    uint64_t v11 = sub_100022458();
    uint64_t v12 = *(void *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }

    uint64_t v13 = *(void **)(v7 + v8[7]);
  }
}

void *sub_10001F660(void *a1, void *a2, int *a3)
{
  sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000223A8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100022378();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_100009588(*(void *)v13, v15);
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  uint64_t v16 = a3[7];
  char v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v20 = *((void *)v19 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100001D88(&qword_10002C630);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v22 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v17, v18, v22);
    uint64_t v23 = v19[5];
    uint64_t v24 = &v17[v23];
    uint64_t v25 = &v18[v23];
    uint64_t v26 = sub_100022458();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = sub_100001D88(&qword_10002C668);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    uint64_t v29 = v19[6];
    uint64_t v30 = *(void **)&v18[v29];
    *(void *)&v17[v29] = v30;
    uint64_t v31 = v19[7];
    uint64_t v32 = *(void **)&v18[v31];
    *(void *)&v17[v31] = v32;
    uint64_t v33 = *(void (**)(char *, void, uint64_t, int *))(v20 + 56);
    id v34 = v30;
    id v35 = v32;
    v33(v17, 0, 1, v19);
  }
  return a1;
}

void *sub_10001F9E4(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E0);
    sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000223A8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1000048C0((uint64_t)a1 + v7, &qword_10002C5F0);
    sub_100001D88(&qword_10002C5F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100022378();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  char v15 = v13[8];
  sub_100009588(*(void *)v13, v15);
  uint64_t v16 = *(void *)v12;
  char v17 = v12[8];
  *(void *)uint64_t v12 = v14;
  v12[8] = v15;
  sub_100005514(v16, v17);
  uint64_t v18 = a3[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v22 = *((void *)v21 - 1);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, int *))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (v25)
    {
      sub_1000219E4((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_15;
    }
    uint64_t v34 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 24))(v19, v20, v34);
    uint64_t v35 = v21[5];
    id v36 = &v19[v35];
    id v37 = &v20[v35];
    uint64_t v38 = sub_100022458();
    uint64_t v39 = *(void *)(v38 - 8);
    uint64_t v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
    uint64_t v60 = v36;
    LODWORD(v36) = v40(v36, 1, v38);
    int v41 = v40(v37, 1, v38);
    if (v36)
    {
      if (!v41)
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v60, v37, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v60, 0, 1, v38);
        goto LABEL_26;
      }
      size_t v42 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v43 = v60;
    }
    else
    {
      if (!v41)
      {
        (*(void (**)(char *, char *, uint64_t))(v39 + 24))(v60, v37, v38);
        goto LABEL_26;
      }
      (*(void (**)(char *, uint64_t))(v39 + 8))(v60, v38);
      size_t v42 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v43 = v60;
    }
    memcpy(v43, v37, v42);
LABEL_26:
    uint64_t v51 = v21[6];
    uint64_t v52 = *(void **)&v19[v51];
    uint64_t v53 = *(void **)&v20[v51];
    *(void *)&v19[v51] = v53;
    id v54 = v53;

    uint64_t v55 = v21[7];
    uint64_t v56 = *(void **)&v19[v55];
    uint64_t v57 = *(void **)&v20[v55];
    *(void *)&v19[v55] = v57;
    id v58 = v57;

    return a1;
  }
  if (v25)
  {
LABEL_15:
    uint64_t v33 = sub_100001D88(&qword_10002C630);
    memcpy(v19, v20, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  uint64_t v26 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v19, v20, v26);
  uint64_t v27 = v21[5];
  uint64_t v28 = &v19[v27];
  uint64_t v29 = &v20[v27];
  uint64_t v30 = sub_100022458();
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    uint64_t v32 = sub_100001D88(&qword_10002C668);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  uint64_t v44 = v21[6];
  char v45 = *(void **)&v20[v44];
  *(void *)&v19[v44] = v45;
  uint64_t v46 = v21[7];
  int v47 = *(void **)&v20[v46];
  *(void *)&v19[v46] = v47;
  uint64_t v48 = *(void (**)(char *, void, uint64_t, int *))(v22 + 56);
  id v49 = v45;
  id v50 = v47;
  v48(v19, 0, 1, v21);
  return a1;
}

char *sub_10001FFB8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000223A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100022378();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  char v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)char v15 = *(void *)v16;
  v15[8] = v16[8];
  char v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  uint64_t v19 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v20 = *((void *)v19 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v20 + 48))(v18, 1, v19))
  {
    uint64_t v21 = sub_100001D88(&qword_10002C630);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v22 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v17, v18, v22);
    uint64_t v23 = v19[5];
    int v24 = &v17[v23];
    int v25 = &v18[v23];
    uint64_t v26 = sub_100022458();
    uint64_t v27 = *(void *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      uint64_t v28 = sub_100001D88(&qword_10002C668);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    *(void *)&v17[v19[6]] = *(void *)&v18[v19[6]];
    *(void *)&v17[v19[7]] = *(void *)&v18[v19[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
  }
  return a1;
}

char *sub_100020334(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1000048C0((uint64_t)a1, &qword_10002C5E0);
    uint64_t v6 = sub_100001D88(&qword_10002C5E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000223A8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_1000048C0((uint64_t)&a1[v8], &qword_10002C5F0);
    uint64_t v11 = sub_100001D88(&qword_10002C5F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100022378();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  char v15 = &a2[v13];
  uint64_t v16 = *(void *)v15;
  LOBYTE(v15) = v15[8];
  uint64_t v17 = *(void *)v14;
  char v18 = v14[8];
  *(void *)uint64_t v14 = v16;
  v14[8] = (char)v15;
  sub_100005514(v17, v18);
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = (int *)type metadata accessor for DocumentEntry();
  uint64_t v23 = *((void *)v22 - 1);
  int v24 = *(uint64_t (**)(char *, uint64_t, int *))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (v26)
    {
      sub_1000219E4((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
      goto LABEL_14;
    }
    uint64_t v35 = sub_100021B68();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 40))(v20, v21, v35);
    uint64_t v36 = v22[5];
    id v37 = &v20[v36];
    uint64_t v38 = &v21[v36];
    uint64_t v39 = sub_100022458();
    uint64_t v40 = *(void *)(v39 - 8);
    int v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
    id v50 = v37;
    LODWORD(v37) = v41(v37, 1, v39);
    int v42 = v41(v38, 1, v39);
    if (v37)
    {
      if (!v42)
      {
        (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v50, v38, v39);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v50, 0, 1, v39);
        goto LABEL_25;
      }
      size_t v43 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v44 = v50;
    }
    else
    {
      if (!v42)
      {
        (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v50, v38, v39);
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v40 + 8))(v50, v39);
      size_t v43 = *(void *)(*(void *)(sub_100001D88(&qword_10002C668) - 8) + 64);
      uint64_t v44 = v50;
    }
    memcpy(v44, v38, v43);
LABEL_25:
    uint64_t v45 = v22[6];
    uint64_t v46 = *(void **)&v20[v45];
    *(void *)&v20[v45] = *(void *)&v21[v45];

    uint64_t v47 = v22[7];
    uint64_t v48 = *(void **)&v20[v47];
    *(void *)&v20[v47] = *(void *)&v21[v47];

    return a1;
  }
  if (v26)
  {
LABEL_14:
    uint64_t v34 = sub_100001D88(&qword_10002C630);
    memcpy(v20, v21, *(void *)(*(void *)(v34 - 8) + 64));
    return a1;
  }
  uint64_t v27 = sub_100021B68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v20, v21, v27);
  uint64_t v28 = v22[5];
  uint64_t v29 = &v20[v28];
  uint64_t v30 = &v21[v28];
  uint64_t v31 = sub_100022458();
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    uint64_t v33 = sub_100001D88(&qword_10002C668);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  *(void *)&v20[v22[6]] = *(void *)&v21[v22[6]];
  *(void *)&v20[v22[7]] = *(void *)&v21[v22[7]];
  (*(void (**)(char *, void, uint64_t, int *))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t sub_1000208FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020910);
}

uint64_t sub_100020910(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100001D88(&qword_10002C670);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100001D88(&qword_10002C758);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 254)
  {
    unsigned int v14 = *(unsigned __int8 *)(a1 + a3[6] + 8);
    if (v14 > 1) {
      return (v14 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v15 = sub_100001D88(&qword_10002C630);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_100020A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020AAC);
}

uint64_t sub_100020AAC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100001D88(&qword_10002C670);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_100001D88(&qword_10002C758);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[6] + 8) = -(char)a2;
  }
  else
  {
    uint64_t v15 = sub_100001D88(&qword_10002C630);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t type metadata accessor for RectangularWidgetView()
{
  uint64_t result = qword_10002D5D0;
  if (!qword_10002D5D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100020C84()
{
  sub_100020E20(319, &qword_10002C6E0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F)
  {
    sub_100020E20(319, (unint64_t *)&unk_10002C7D0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F)
    {
      sub_100020E20(319, (unint64_t *)&unk_10002C6E8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentEntry, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100020E20(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100020E84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100020EA0@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  int v53 = a2;
  uint64_t v58 = a5;
  uint64_t v6 = sub_100001D88(&qword_10002D0A8);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (uint64_t *)((char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1000223A8();
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100001D88(&qword_10002C630);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)type metadata accessor for TitleView(0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100001D88(&qword_10002D610);
  uint64_t v54 = *(void *)(v18 - 8);
  uint64_t v55 = v18;
  __chkstk_darwin(v18);
  id v49 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100001D88(&qword_10002D618);
  __chkstk_darwin(v52);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for RectangularWidgetView();
  sub_10000B3A8(a1 + *(int *)(v22 + 28), (uint64_t)v14);
  uint64_t v23 = type metadata accessor for DocumentEntry();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v14, 1, v23) == 1)
  {
    sub_1000048C0((uint64_t)v14, &qword_10002C630);
    int v24 = 0;
  }
  else
  {
    int v24 = *(void **)&v14[*(int *)(v23 + 28)];
    id v25 = v24;
    sub_1000219E4((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DocumentEntry);
  }
  sub_100021C18();
  uint64_t v27 = v26;
  sub_100002E18((uint64_t)v11);
  uint64_t v28 = sub_100022268();
  uint64_t v30 = v29;
  uint64_t KeyPath = swift_getKeyPath();
  *unint64_t v8 = swift_getKeyPath();
  sub_100001D88(&qword_10002D0A0);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = v11;
  uint64_t v33 = swift_getKeyPath();
  *(void *)uint64_t v17 = KeyPath;
  v17[8] = 0;
  sub_100005AAC((uint64_t)v8, (uint64_t)&v17[v15[5]], &qword_10002D0A8);
  uint64_t v34 = &v17[v15[6]];
  *(void *)uint64_t v34 = v33;
  v34[8] = 0;
  *(void *)&v17[v15[7]] = v24;
  *(void *)&v17[v15[8]] = v27;
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(&v17[v15[9]], v32, v51);
  v17[v15[10]] = v53 & 1;
  uint64_t v35 = (uint64_t *)&v17[v15[11]];
  *uint64_t v35 = v28;
  v35[1] = v30;
  uint64_t v36 = &v17[v15[12]];
  *(void *)uint64_t v36 = 0x3E6E69616C703CLL;
  *((void *)v36 + 1) = 0xE700000000000000;
  id v37 = &v17[v15[13]];
  *(void *)id v37 = 0x3E6E69616C702F3CLL;
  *((void *)v37 + 1) = 0xE800000000000000;
  uint64_t v38 = &v17[v15[14]];
  *(void *)uint64_t v38 = 1701869940;
  *((void *)v38 + 1) = 0xE400000000000000;
  uint64_t v39 = &v17[v15[15]];
  *(void *)uint64_t v39 = 1954047348;
  *((void *)v39 + 1) = 0xE400000000000000;
  uint64_t v40 = &v17[v15[16]];
  *(void *)uint64_t v40 = 1954047348;
  *((void *)v40 + 1) = 0xE400000000000000;
  int v41 = &v17[v15[17]];
  *(void *)int v41 = 0x736B72616DLL;
  *((void *)v41 + 1) = 0xE500000000000000;
  int v42 = &v17[v15[18]];
  *(void *)int v42 = 0x6F43746E65636361;
  *((void *)v42 + 1) = 0xEB00000000726F6CLL;
  sub_10002198C();
  size_t v43 = v49;
  sub_100022068();
  sub_1000219E4((uint64_t)v17, type metadata accessor for TitleView);
  sub_100021C08();
  uint64_t v45 = v54;
  uint64_t v44 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v21, v43, v55);
  uint64_t v46 = &v21[*(int *)(v52 + 36)];
  long long v47 = v60;
  *(_OWORD *)uint64_t v46 = v59;
  *((_OWORD *)v46 + 1) = v47;
  *((_OWORD *)v46 + 2) = v61;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
  return sub_100005AAC((uint64_t)v21, v58, &qword_10002D618);
}

uint64_t sub_10002142C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100022288();
  uint64_t v9 = v8;
  sub_100021544(v2, (uint64_t)v6);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = v10 + v5;
  uint64_t v12 = swift_allocObject();
  unint64_t v13 = (v11 & 0xFFFFFFFFFFFFFFF8) + v12;
  uint64_t result = sub_100021864((uint64_t)v6, v12 + v10);
  *(unsigned char *)(v12 + v11) = 1;
  *(void *)(v13 + 8) = v7;
  *(void *)(v13 + 16) = v9;
  *a2 = sub_1000218C8;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v12;
  return result;
}

uint64_t sub_100021544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RectangularWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000215A8()
{
  unint64_t v1 = (int *)type metadata accessor for RectangularWidgetView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_100001D88(&qword_10002C5E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000223A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_100001D88(&qword_10002C5F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100022378();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_100005514(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v9 = v5 + v1[7];
  unint64_t v10 = (int *)type metadata accessor for DocumentEntry();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v10 - 1) + 48))(v9, 1, v10))
  {
    uint64_t v11 = sub_100021B68();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v9, v11);
    uint64_t v12 = v9 + v10[5];
    uint64_t v13 = sub_100022458();
    uint64_t v14 = *(void *)(v13 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    }
  }

  return _swift_deallocObject(v0, ((v3 + v4) & 0xFFFFFFFFFFFFFFF8) + 24, v2 | 7);
}

uint64_t sub_100021864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RectangularWidgetView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000218C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for RectangularWidgetView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = v4 + *(void *)(v3 + 64);
  uint64_t v6 = (v5 & 0xFFFFFFFFFFFFFFF8) + v1;
  int v7 = *(unsigned __int8 *)(v1 + v5);
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v9 = *(void *)(v6 + 16);

  return sub_100020EA0(v1 + v4, v7, v8, v9, a1);
}

unint64_t sub_10002198C()
{
  unint64_t result = qword_10002D620;
  if (!qword_10002D620)
  {
    type metadata accessor for TitleView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D620);
  }
  return result;
}

uint64_t sub_1000219E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100021A48()
{
  unint64_t result = qword_10002D628;
  if (!qword_10002D628)
  {
    sub_100002518(&qword_10002D630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D628);
  }
  return result;
}

uint64_t sub_100021AA4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100021AD8()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_100021AE8()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_100021AF8()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_100021B08()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

void sub_100021B18(NSURL *retstr@<X8>)
{
}

uint64_t sub_100021B28()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021B38()
{
  return URL.path.getter();
}

uint64_t sub_100021B48()
{
  return type metadata accessor for URL();
}

uint64_t sub_100021B58()
{
  return Date.init()();
}

uint64_t sub_100021B68()
{
  return type metadata accessor for Date();
}

uint64_t sub_100021B78()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_100021B88()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_100021B98()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_100021BA8()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100021BB8()
{
  return static AlignmentID._combineExplicit(childValue:_:into:)();
}

uint64_t sub_100021BC8()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_100021BD8()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100021BE8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100021BF8()
{
  return type metadata accessor for _MaskEffect();
}

uint64_t sub_100021C08()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100021C18()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100021C28()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_100021C48()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_100021C58()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_100021C68()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100021C78()
{
  return ModifiedContent<>.accessibility(removeTraits:)();
}

uint64_t sub_100021C88()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_100021C98()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_100021CA8()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_100021CB8()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t sub_100021CC8()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100021CD8()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100021CE8()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100021CF8()
{
  return EnvironmentValues.lineSpacing.getter();
}

uint64_t sub_100021D08()
{
  return EnvironmentValues.lineSpacing.setter();
}

uint64_t sub_100021D18()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_100021D28()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_100021D38()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_100021D48()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100021D58()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100021D68()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_100021D78()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100021D88()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100021D98()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100021DA8()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100021DB8()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100021DC8()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100021DD8()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_100021DE8()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100021DF8()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100021E08()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100021E18()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100021E28()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100021E38()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100021E48()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_100021E58()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_100021E68()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t sub_100021E78()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100021E88()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t sub_100021E98()
{
  return VerticalAlignment.init(_:)();
}

uint64_t sub_100021EA8()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100021EB8()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t sub_100021EC8()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_100021ED8()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100021EE8()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100021EF8()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100021F08()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100021F18()
{
  return WidgetConfiguration.disfavoredLocations(_:for:)();
}

uint64_t sub_100021F28()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100021F38()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100021F48()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_100021F58()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_100021F68()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100021F78()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100021F88()
{
  return static Font.body.getter();
}

uint64_t sub_100021F98()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100021FA8()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_100021FB8()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_100021FC8()
{
  return static Font.title2.getter();
}

uint64_t sub_100021FD8()
{
  return Font.weight(_:)();
}

uint64_t sub_100021FE8()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_100021FF8()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_100022008()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100022018()
{
  return Text.accessibilityLabel<A>(_:)();
}

uint64_t sub_100022028()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_100022038()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100022048()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100022058()
{
  return Text.init(_:)();
}

uint64_t sub_100022068()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_100022078()
{
  return View.widgetURL(_:)();
}

uint64_t sub_100022088()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100022098()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000220A8()
{
  return View.avoidsOrphans(_:)();
}

uint64_t sub_1000220B8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000220C8()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_1000220D8()
{
  return View.hyphenationFactor(_:)();
}

uint64_t sub_1000220E8()
{
  return View.accessibilityLabel(_:)();
}

uint64_t sub_1000220F8()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_100022108()
{
  return View.mask<A>(_:)();
}

uint64_t sub_100022118()
{
  return View.redacted(reason:)();
}

uint64_t sub_100022128()
{
  return View.blendMode(_:)();
}

uint64_t sub_100022138()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_100022148()
{
  return static Color.clear.getter();
}

uint64_t sub_100022158()
{
  return static Color.white.getter();
}

uint64_t sub_100022168()
{
  return Color.opacity(_:)();
}

uint64_t sub_100022178()
{
  return static Color.primary.getter();
}

uint64_t sub_100022188()
{
  return static Color.secondary.getter();
}

uint64_t sub_100022198()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_1000221A8()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_1000221B8()
{
  return Color.init(_:)();
}

uint64_t sub_1000221C8()
{
  return Image.init(tpsImage:)();
}

uint64_t sub_1000221D8()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000221E8()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_1000221F8()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_100022208()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_100022218()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100022228()
{
  return static Widget.main()();
}

uint64_t sub_100022238()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_100022248()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_100022258()
{
  return Gradient.init(stops:)();
}

uint64_t sub_100022268()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_100022278()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t sub_100022288()
{
  return static Alignment.top.getter();
}

uint64_t sub_100022298()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_1000222A8()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000222B8()
{
  return type metadata accessor for BlendMode();
}

uint64_t sub_1000222C8()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t sub_1000222D8()
{
  return static UnitPoint.topTrailing.getter();
}

uint64_t sub_1000222E8()
{
  return static UnitPoint.bottomLeading.getter();
}

uint64_t sub_1000222F8()
{
  return static UnitPoint.bottomTrailing.getter();
}

uint64_t sub_100022308()
{
  return static TipsLog.widget.getter();
}

uint64_t sub_100022318()
{
  return type metadata accessor for TipsLog();
}

uint64_t sub_100022328()
{
  return log(_:_:)();
}

uint64_t sub_100022338()
{
  return logInfo(_:_:_:)();
}

uint64_t sub_100022348()
{
  return logDebug(_:_:)();
}

uint64_t sub_100022358()
{
  return logDebug(_:_:_:)();
}

uint64_t sub_100022368()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_100022378()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_100022388()
{
  return static WidgetAccentedRenderingMode.accentedDesaturated.getter();
}

uint64_t sub_100022398()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1000223A8()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000223B8()
{
  return static WidgetLocation.iPhoneWidgetsOnMac.getter();
}

uint64_t sub_1000223C8()
{
  return type metadata accessor for WidgetLocation();
}

uint64_t sub_1000223F8()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_100022408()
{
  return static TimelineReloadPolicy.never.getter();
}

uint64_t sub_100022418()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100022428()
{
  return TimelineEntryRelevance.init(score:duration:)();
}

uint64_t sub_100022438()
{
  return TimelineEntryRelevance.score.getter();
}

uint64_t sub_100022448()
{
  return TimelineEntryRelevance.duration.getter();
}

uint64_t sub_100022458()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_100022468()
{
  return Timeline.init(entries:policy:)();
}

NSDictionary sub_100022478()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100022488()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100022498()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000224A8()
{
  return String.init<A>(describing:)();
}

void sub_1000224B8(Swift::String a1)
{
}

Swift::Int sub_1000224C8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000224D8()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000224E8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000224F8()
{
  return Double.write<A>(to:)();
}

uint64_t sub_100022508()
{
  return Float.write<A>(to:)();
}

uint64_t sub_100022518()
{
  return static os_log_type_t.fault.getter();
}

void sub_100022528()
{
}

Swift::Int sub_100022538()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100022548()
{
  return NSArray.makeIterator()();
}

uint64_t sub_100022558()
{
  return static UIColor.widgetBackgroundColor.getter();
}

unint64_t sub_100022568(Swift::String systemImageName)
{
  return (unint64_t)UIImage.init(systemImageName:)(systemImageName);
}

uint64_t sub_100022578()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_100022588()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100022598()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_1000225A8()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_1000225B8()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_1000225C8()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_1000225D8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000225E8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000225F8()
{
  return AnyHashable.init<A>(_:)();
}

void sub_100022608(Swift::Int a1)
{
}

uint64_t sub_100022618()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100022628()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100022638()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100022648(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100022658()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100022668()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100022678()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_100022688()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100022698()
{
  return Hasher._finalize()();
}

uint64_t sub_1000226A8()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
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