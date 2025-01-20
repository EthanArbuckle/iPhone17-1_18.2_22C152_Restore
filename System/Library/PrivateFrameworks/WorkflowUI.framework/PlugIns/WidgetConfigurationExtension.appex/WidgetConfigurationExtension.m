id sub_1000042DC()
{
  return sub_100006148(OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_request);
}

id sub_10000431C()
{
  return sub_100006148(OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_action);
}

uint64_t sub_100004374()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_intentIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1000043E4()
{
  return sub_100006148(OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dataSource);
}

uint64_t sub_10000448C()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dismiss);
  swift_retain();
  return v1;
}

uint64_t sub_1000044C8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_10000450C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&v6[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_request] = a1;
  *(void *)&v6[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_action] = a2;
  objc_allocWithZone((Class)type metadata accessor for WidgetConfigurationParameterDataSource());
  id v13 = a2;
  v14 = v6;
  id v15 = a1;
  sub_100009FFC(v13);
  *(void *)&v14[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dataSource] = v16;
  v17 = &v14[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_intentIdentifier];
  *(void *)v17 = a3;
  *((void *)v17 + 1) = a4;
  v18 = &v14[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dismiss];
  *(void *)v18 = a5;
  *((void *)v18 + 1) = a6;
  swift_retain();

  v21.receiver = v14;
  v21.super_class = (Class)type metadata accessor for WFWidgetParametersConfigurationViewController();
  id v19 = objc_msgSendSuper2(&v21, "initWithNibName:bundle:", 0, 0);

  swift_release();
  return v19;
}

void sub_1000046E0()
{
}

void sub_100004754()
{
  v35.receiver = v0;
  v35.super_class = (Class)type metadata accessor for WFWidgetParametersConfigurationViewController();
  objc_msgSendSuper2(&v35, "viewDidLoad");
  id v1 = sub_10000616C();
  if (!v1)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  v3 = self;
  id v4 = [v3 clearColor];
  [v2 setBackgroundColor:v4];

  v5 = *(void **)&v0[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_request];
  uint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dismiss];
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dismiss
                    + 8];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v0;
  id v9 = v5;
  swift_retain();
  v10 = v0;
  WidgetConfigurationCardView.init(request:dismiss:content:)(v9, v6, v7, (uint64_t)sub_100005FE8, v8, v34);
  sub_100005764(&qword_1000347E8);
  sub_100005FF0();
  v34[0] = sub_10001CA20();
  id v11 = objc_allocWithZone((Class)sub_100005764(&qword_1000347F8));
  v12 = (void *)sub_10001C7B0();
  id v13 = [v12 view];
  if (!v13)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v14 = v13;
  id v15 = [v3 clearColor];
  [v14 setBackgroundColor:v15];

  id v16 = sub_10000616C();
  if (!v16)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v17 = v16;
  [v16 setAutoresizingMask:18];

  id v18 = sub_10000616C();
  if (!v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v19 = v18;
  id v20 = [v10 view];
  if (!v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  objc_super v21 = v20;
  [v20 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  objc_msgSend(v19, "setFrame:", v23, v25, v27, v29);
  id v30 = [v10 view];
  if (!v30)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v31 = v30;
  id v32 = sub_10000616C();
  if (v32)
  {
    v33 = v32;
    [v31 addSubview:v32];

    return;
  }
LABEL_15:
  __break(1u);
}

void sub_100004A30(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v3 = *(void **)(a1
                + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_dataSource);
  id v4 = objc_retain(*(id *)(a1
                         + OBJC_IVAR____TtC28WidgetConfigurationExtension45WFWidgetParametersConfigurationViewController_request));
  id v5 = v3;
  sub_10000619C(v4, a2);
}

void WidgetConfigurationCardView.init(request:dismiss:content:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  id v11 = a1;
  swift_retain();
  swift_retain();
  id v12 = [v11 appBundleIdentifier];
  uint64_t v36 = a4;
  uint64_t v37 = a2;
  if (v12)
  {
    uint64_t v13 = sub_10001CB10();
    uint64_t v15 = v14;

    sub_10000608C();
    swift_bridgeObjectRetain();
    id v32 = sub_100010C40(v13, v15, 0);
    swift_bridgeObjectRelease();
    if (v32)
    {
      id v33 = [v32 localizedName];
      id v12 = (id)sub_10001CB10();
      uint64_t v16 = v34;
    }
    else
    {
      id v12 = 0;
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    id v32 = 0;
  }
  id v17 = [v11 widgetDisplayName];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = sub_10001CB10();
    uint64_t v21 = v20;

    swift_release();
    swift_release();

    uint64_t v23 = v36;
    uint64_t v22 = v37;
  }
  else
  {
    id v35 = v12;
    id v24 = [v11 intent];
    id v25 = [v24 _title];

    uint64_t v26 = sub_10001CB10();
    unint64_t v28 = v27;

    uint64_t v19 = sub_100010A78(v26, v28);
    uint64_t v21 = v29;
    swift_bridgeObjectRelease();
    if (!v21)
    {
      id v30 = [v11 fallbackDisplayName];
      uint64_t v19 = sub_10001CB10();
      uint64_t v21 = v31;
    }
    swift_release();
    swift_release();
    uint64_t v23 = v36;
    uint64_t v22 = v37;
    id v12 = v35;
  }
  *a6 = v11;
  a6[1] = v12;
  a6[2] = v16;
  a6[3] = v19;
  a6[4] = v21;
  a6[5] = v23;
  a6[6] = a5;
  a6[7] = v22;
  a6[8] = a3;
}

uint64_t sub_100004D3C()
{
  sub_100006160();
  v1[2] = v0;
  sub_10001CB80();
  v1[3] = sub_10001CB70();
  uint64_t v3 = sub_10001CB60();
  v1[4] = v3;
  v1[5] = v2;
  return _swift_task_switch(sub_100004DD0, v3, v2);
}

uint64_t sub_100004DD0()
{
  sub_100006160();
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *id v1 = v0;
  v1[1] = sub_100004E68;
  return sub_10000ACDC();
}

uint64_t sub_100004E68(uint64_t a1)
{
  sub_100006130();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  sub_100006150();
  *uint64_t v7 = v6;
  v5[7] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = v5[4];
    uint64_t v9 = v5[5];
    v10 = sub_100004FC8;
  }
  else
  {
    v5[8] = a1;
    uint64_t v8 = v5[4];
    uint64_t v9 = v5[5];
    v10 = sub_100004F64;
  }
  return _swift_task_switch(v10, v8, v9);
}

uint64_t sub_100004F64()
{
  sub_100006160();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  return v1(v2);
}

uint64_t sub_100004FC8()
{
  sub_100006160();
  swift_release();
  sub_100006190();
  return v0();
}

uint64_t sub_1000050A0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_10001CB80();
  v2[4] = sub_10001CB70();
  uint64_t v4 = sub_10001CB60();
  return _swift_task_switch(sub_100005138, v4, v3);
}

uint64_t sub_100005138()
{
  sub_100006160();
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000051E4;
  return sub_100004D3C();
}

uint64_t sub_1000051E4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 24);
  uint64_t v7 = *v2;
  sub_100006150();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  uint64_t v9 = *(void (***)(void, void, void))(v5 + 40);
  if (v3)
  {
    v10 = (void *)sub_10001C600();
    swift_errorRelease();
    ((void (**)(void, void, void *))v9)[2](v9, 0, v10);

    _Block_release(v9);
  }
  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0);
    _Block_release(v9);
  }
  id v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

uint64_t sub_10000537C(uint64_t a1, uint64_t a2)
{
  sub_100005764(&qword_1000347B0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001CBA0();
  sub_1000057A8((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_1000347C0;
  v8[5] = v7;
  sub_100005B34((uint64_t)v5, (uint64_t)&unk_1000347D0, (uint64_t)v8);
  return swift_release();
}

void sub_100005488()
{
}

id sub_1000054E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFWidgetParametersConfigurationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WFWidgetParametersConfigurationViewController()
{
  return self;
}

uint64_t sub_1000055BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000055FC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)sub_100006184(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_1000056A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000347A0 + dword_1000347A0);
  return v6(v1, v2);
}

uint64_t sub_1000056A4()
{
  sub_100006160();
  sub_100006130();
  uint64_t v1 = *v0;
  sub_100006150();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100006190();
  return v3();
}

uint64_t sub_100005764(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000057A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000057D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000612C;
  return v6();
}

uint64_t sub_1000058A0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100006184(v4);
  void *v5 = v6;
  v5[1] = sub_10000612C;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000347B8 + dword_1000347B8);
  return v7(v1, v2, v3);
}

uint64_t sub_10000595C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10000612C;
  return v7();
}

uint64_t sub_100005A2C()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100005A6C(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_100006184(v6);
  *uint64_t v7 = v8;
  v7[1] = sub_10000612C;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000347C8 + dword_1000347C8);
  return v9(a1, v3, v4, v5);
}

uint64_t sub_100005B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001CBA0();
  if (sub_100005C9C(a1, 1, v6) == 1)
  {
    sub_100005CC4(a1);
  }
  else
  {
    sub_10001CB90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001CB60();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100005C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100005CC4(uint64_t a1)
{
  uint64_t v2 = sub_100005764(&qword_1000347B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005D24(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100005E00;
  return v6(a1);
}

uint64_t sub_100005E00()
{
  sub_100006160();
  sub_100006130();
  uint64_t v1 = *v0;
  sub_100006150();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100006190();
  return v3();
}

uint64_t sub_100005EC4()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005EFC(uint64_t a1)
{
  uint64_t v3 = *(int **)(v1 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_100006184(v4);
  void *v5 = v6;
  v5[1] = sub_1000056A4;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000347D8 + dword_1000347D8);
  return v7(a1, v3);
}

uint64_t sub_100005FB0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005FE8(uint64_t a1@<X8>)
{
  sub_100004A30(*(void *)(v1 + 16), a1);
}

unint64_t sub_100005FF0()
{
  unint64_t result = qword_1000347F0;
  if (!qword_1000347F0)
  {
    sub_100006044(&qword_1000347E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000347F0);
  }
  return result;
}

uint64_t sub_100006044(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000608C()
{
  unint64_t result = qword_100034800;
  if (!qword_100034800)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100034800);
  }
  return result;
}

uint64_t sub_1000060CC()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006104()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100006114(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006124()
{
  return swift_release();
}

id sub_100006148@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

id sub_10000616C()
{
  uint64_t v3 = *(const char **)(v1 + 3216);
  return [v0 v3];
}

uint64_t sub_100006184(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_100006190()
{
  return v0 + 8;
}

void sub_10000619C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a2 + *(int *)(type metadata accessor for WidgetParametersConfigurationView() + 28);
  *(void *)uint64_t v3 = swift_getKeyPath();
  *(unsigned char *)(v3 + 8) = 0;
  uint64_t v4 = sub_10000813C(a1);
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
  }
  else
  {
    id v8 = [a1 intent];
    id v9 = [v8 _codableDescription];

    id v10 = [v9 localizedDescriptiveText];
    uint64_t v6 = sub_10001CB10();
    uint64_t v7 = v11;
  }
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  uint64_t v12 = sub_1000081A0([a1 intent]);
  if (v13)
  {
    if (v12 == 0xD000000000000010 && v13 == 0x8000000100021810) {
      char v14 = 1;
    }
    else {
      char v14 = sub_10001CD90();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  *(unsigned char *)(a2 + 16) = v14 & 1;
  type metadata accessor for WidgetConfigurationParameterDataSource();
  sub_100008EC0((unint64_t *)&qword_100034D60, (void (*)(uint64_t))type metadata accessor for WidgetConfigurationParameterDataSource);
  sub_10001CA70();
}

uint64_t sub_10000638C@<X0>(uint64_t a1@<X8>)
{
  return sub_100006394(v1, a1);
}

uint64_t sub_100006394@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005764(&qword_1000349D8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (char *)&v51 - v9;
  uint64_t v52 = sub_100005764(&qword_1000349E0);
  __chkstk_darwin(v52);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100005764(&qword_1000349E8);
  __chkstk_darwin(v53);
  char v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005764(&qword_1000349F0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  id v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v51 - v19;
  unint64_t v21 = a1[1];
  v54 = v8;
  uint64_t v55 = a2;
  if (!v21)
  {
    uint64_t v22 = 1;
    goto LABEL_5;
  }
  v51 = a1;
  sub_100010A78(*a1, v21);
  uint64_t v22 = 1;
  if (!v23)
  {
LABEL_5:
    uint64_t v44 = v53;
    goto LABEL_6;
  }
  *(void *)uint64_t v12 = sub_10001C780();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  uint64_t v24 = sub_100005764(&qword_100034A00);
  sub_1000067CC((uint64_t)&v12[*(int *)(v24 + 44)]);
  swift_bridgeObjectRelease();
  sub_10001C7F0();
  sub_10001C6F0();
  uint64_t v61 = v25;
  uint64_t v62 = v26;
  uint64_t v63 = v27;
  uint64_t v64 = v28;
  char v65 = 0;
  sub_100005764(&qword_100034A08);
  sub_10001C7C0();
  sub_10001C820();
  sub_10001C6F0();
  uint64_t v56 = v29;
  uint64_t v57 = v30;
  uint64_t v58 = v31;
  uint64_t v59 = v32;
  char v60 = 0;
  sub_10001C7C0();
  char v33 = sub_10001C820();
  sub_10001C6F0();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_1000089C4((uint64_t)v12, (uint64_t)v14, &qword_1000349E0);
  uint64_t v42 = v53;
  v43 = &v14[*(int *)(v53 + 36)];
  char *v43 = v33;
  *((void *)v43 + 1) = v35;
  *((void *)v43 + 2) = v37;
  *((void *)v43 + 3) = v39;
  *((void *)v43 + 4) = v41;
  v43[40] = 0;
  sub_10000920C((uint64_t)v12, &qword_1000349E0);
  sub_10000901C((uint64_t)v14, (uint64_t)v20, &qword_1000349E8);
  uint64_t v44 = v42;
  uint64_t v22 = 0;
LABEL_6:
  sub_1000057A8((uint64_t)v20, v22, 1, v44);
  sub_100006B98();
  sub_1000089C4((uint64_t)v20, (uint64_t)v18, &qword_1000349F0);
  v45 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v46 = v54;
  v45(v54, v10, v4);
  uint64_t v47 = v55;
  sub_1000089C4((uint64_t)v18, v55, &qword_1000349F0);
  uint64_t v48 = sub_100005764(&qword_1000349F8);
  v45((char *)(v47 + *(int *)(v48 + 48)), v46, v4);
  v49 = *(void (**)(char *, uint64_t))(v5 + 8);
  v49(v10, v4);
  sub_10000920C((uint64_t)v20, &qword_1000349F0);
  v49(v46, v4);
  return sub_10000920C((uint64_t)v18, &qword_1000349F0);
}

uint64_t sub_1000067CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v1 = sub_100005764(&qword_100034A10);
  uint64_t v35 = *(void *)(v1 - 8);
  uint64_t v36 = v1;
  ((void (*)(void))__chkstk_darwin)();
  char v33 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005764(&qword_100034A18) - 8;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005764(&qword_100034A20) - 8;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v34 = (uint64_t)&v33 - v10;
  id v11 = objc_allocWithZone((Class)UIFontMetrics);
  swift_bridgeObjectRetain();
  id v12 = [v11 initForTextStyle:UIFontTextStyleCaption1];
  id v13 = [self preferredFontForTextStyle:UIFontTextStyleCaption1];
  id v14 = [v12 scaledFontForFont:v13 maximumPointSize:32.0];

  sub_10001C850();
  uint64_t v15 = sub_10001C880();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  swift_release();
  LOBYTE(v13) = v19 & 1;
  uint64_t v38 = v15;
  uint64_t v39 = v17;
  char v40 = v19 & 1;
  uint64_t v41 = v21;
  uint64_t v22 = v33;
  sub_10001C8C0();
  sub_100008958(v15, v17, (char)v13);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = v35;
  uint64_t v24 = v36;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v5, v22, v36);
  uint64_t v26 = &v5[*(int *)(v3 + 44)];
  *(void *)uint64_t v26 = KeyPath;
  *((void *)v26 + 1) = 0;
  v26[16] = 1;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
  uint64_t v27 = swift_getKeyPath();
  sub_1000089C4((uint64_t)v5, (uint64_t)v9, &qword_100034A18);
  uint64_t v28 = &v9[*(int *)(v6 + 44)];
  *(void *)uint64_t v28 = v27;
  v28[8] = 0;
  sub_10000920C((uint64_t)v5, &qword_100034A18);
  uint64_t v29 = v34;
  sub_10000901C((uint64_t)v9, v34, &qword_100034A20);
  sub_1000089C4(v29, (uint64_t)v9, &qword_100034A20);
  uint64_t v30 = v37;
  sub_1000089C4((uint64_t)v9, v37, &qword_100034A20);
  uint64_t v31 = v30 + *(int *)(sub_100005764(&qword_100034A28) + 48);
  *(void *)uint64_t v31 = 0;
  *(unsigned char *)(v31 + 8) = 1;
  sub_10000920C(v29, &qword_100034A20);
  return sub_10000920C((uint64_t)v9, &qword_100034A20);
}

uint64_t sub_100006B98()
{
  uint64_t v1 = sub_100005764(&qword_100034A30);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100005764(&qword_100034A38);
  sub_100009354();
  __chkstk_darwin(v6);
  uint64_t v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = v0;
  sub_100005764(&qword_100034A40);
  sub_1000092FC(&qword_100034A48, &qword_100034A40);
  sub_10001C860();
  char v9 = sub_10001C810();
  sub_10001C6F0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 16))(v8, v4, v1);
  char v18 = &v8[*(int *)(v5 + 36)];
  unsigned char *v18 = v9;
  *((void *)v18 + 1) = v11;
  *((void *)v18 + 2) = v13;
  *((void *)v18 + 3) = v15;
  *((void *)v18 + 4) = v17;
  v18[40] = 0;
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  sub_100008A28();
  sub_10001C930();
  return sub_10000920C((uint64_t)v8, &qword_100034A38);
}

uint64_t sub_100006DB4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v43 = a2;
  uint64_t v3 = type metadata accessor for WidgetParametersConfigurationView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = sub_100005764(&qword_100034A60);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v48 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - v9;
  sub_100005764(&qword_100034930);
  sub_10001CA60();
  uint64_t v11 = (void *)v49[0];
  uint64_t v12 = sub_100009E80();

  v49[0] = v12;
  sub_100008AC8(a1, (uint64_t)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_100008B30((uint64_t)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  sub_100005764(&qword_100034A68);
  sub_100005764(&qword_100034A70);
  sub_1000092FC(&qword_100034A78, &qword_100034A68);
  sub_100008BE4();
  sub_100008F08();
  sub_10001CA40();
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    uint64_t v15 = sub_10001C780();
    sub_100007B80((uint64_t)v49);
    uint64_t v16 = v49[0];
    uint64_t v17 = v49[1];
    uint64_t v18 = v50;
    uint64_t v19 = v51;
    uint64_t v20 = v52;
    uint64_t v21 = v53;
    uint64_t v24 = 256;
    if (!v55) {
      uint64_t v24 = 0;
    }
    uint64_t v22 = v24 | v54 | 0x1000000;
    uint64_t v23 = 0x3FE8000000000000;
  }
  uint64_t v46 = v17;
  uint64_t v47 = v18;
  uint64_t v39 = v15;
  uint64_t v40 = v19;
  uint64_t v41 = v20;
  uint64_t v26 = v44;
  uint64_t v25 = v45;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v28 = v48;
  v27(v48, v10, v45);
  uint64_t v42 = v10;
  uint64_t v29 = v43;
  v27(v43, v28, v25);
  uint64_t v30 = (uint64_t *)&v29[*(int *)(sub_100005764(&qword_100034AD8) + 48)];
  uint64_t v31 = v39;
  uint64_t v32 = v40;
  *uint64_t v30 = v39;
  v30[1] = 0;
  v30[2] = 0;
  v30[3] = v16;
  uint64_t v33 = v46;
  uint64_t v34 = v47;
  v30[4] = v46;
  v30[5] = v34;
  uint64_t v35 = v41;
  v30[6] = v32;
  v30[7] = v35;
  v30[8] = v21;
  v30[9] = v22;
  v30[10] = v23;
  sub_100008F54(v31, 0, 0, v16, v33, v34, v32);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v26 + 8);
  v36(v42, v25);
  sub_100008FBC(v31, 0, 0, v16, v46, v47, v32);
  return ((uint64_t (*)(char *, uint64_t))v36)(v48, v25);
}

uint64_t sub_10000719C(long long *a1)
{
  long long v1 = a1[1];
  long long v3 = *a1;
  long long v4 = v1;
  uint64_t v5 = *((void *)a1 + 4);
  sub_10000901C((uint64_t)&v3 + 8, (uint64_t)v7, &qword_100034AE0);
  sub_10000901C((uint64_t)v7, (uint64_t)&v8, &qword_100034AE0);
  sub_10000901C((uint64_t)&v4 + 8, (uint64_t)v6, &qword_100034AE0);
  sub_10000901C((uint64_t)v6, (uint64_t)&v9, &qword_100034AE0);
  sub_100009078((uint64_t)v7);
  sub_100009078((uint64_t)v6);
  sub_100005764(&qword_100034A90);
  sub_100005764(&qword_100034AA0);
  sub_100008C64();
  sub_100008CD0();
  return sub_10001CA50();
}

uint64_t sub_1000072E4(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetParametersConfigurationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v17 = *a1;
  swift_getKeyPath();
  sub_100008AC8(a2, (uint64_t)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  sub_100008B30((uint64_t)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  sub_100005764(&qword_100034AE8);
  sub_100005764(&qword_100034AF0);
  sub_1000092FC(&qword_100034AF8, &qword_100034AE8);
  uint64_t v9 = sub_100006044(&qword_100034AA8);
  uint64_t v10 = sub_100006044(&qword_100034AB0);
  unint64_t v11 = sub_100008DB4();
  uint64_t v15 = v10;
  unint64_t v16 = v11;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v15 = v9;
  unint64_t v16 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  return sub_10001CA30();
}

uint64_t sub_1000074F4(void **a1)
{
  uint64_t v2 = sub_100005764(&qword_100034AA8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007624(*a1, (uint64_t)v5);
  uint64_t v6 = sub_100006044(&qword_100034AB0);
  unint64_t v7 = sub_100008DB4();
  v9[0] = v6;
  v9[1] = v7;
  swift_getOpaqueTypeConformance2();
  sub_10001C8D0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100007624@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v4 = sub_10001C660();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  uint64_t v46 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_10001C690();
  uint64_t v6 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10001C680();
  uint64_t v9 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  unint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005764(&qword_100034B00);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v43 = v12;
  uint64_t v44 = v13;
  __chkstk_darwin(v12);
  uint64_t v39 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100005764(&qword_100034AB0);
  __chkstk_darwin(v45);
  uint64_t v42 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C6B0();
  uint64_t v16 = type metadata accessor for WidgetParametersConfigurationView();
  id v17 = a1;
  sub_100005764(&qword_100034930);
  sub_10001CA60();
  uint64_t v18 = (void *)v50;
  id v19 = objc_retain(*(id *)(v50
                          + OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource_action));

  uint64_t v20 = v2 + *(int *)(v16 + 28);
  uint64_t v21 = *(void **)v20;
  LOBYTE(v18) = *(unsigned char *)(v20 + 8);
  id v22 = v17;
  sub_100008324(v21, (char)v18);
  sub_100007EB8(v21, (char)v18);
  sub_1000083C8(v21, (char)v18);
  sub_10001C6A0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for ParameterLayoutMode.default(_:), v40);
  sub_10001C670();
  uint64_t v23 = sub_100008EC0(&qword_100034AC0, (void (*)(uint64_t))&type metadata accessor for ParameterRowView);
  uint64_t v24 = v39;
  uint64_t v25 = v41;
  sub_10001C8A0();
  uint64_t v26 = v11;
  unint64_t v27 = v25;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v26, v25);
  unint64_t v50 = 0;
  unint64_t v51 = 0xE000000000000000;
  sub_10001CC90(22);
  swift_bridgeObjectRelease();
  unint64_t v50 = 0xD000000000000014;
  unint64_t v51 = 0x8000000100021850;
  id v28 = [v22 key];
  uint64_t v29 = sub_10001CB10();
  uint64_t v31 = v30;

  v52._countAndFlagsBits = v29;
  v52._object = v31;
  sub_10001CB30(v52);
  swift_bridgeObjectRelease();
  unint64_t v50 = v27;
  unint64_t v51 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = (uint64_t)v42;
  uint64_t v32 = v43;
  sub_10001C920();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v24, v32);
  uint64_t v35 = v46;
  uint64_t v34 = v47;
  uint64_t v36 = v48;
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v46, enum case for EditorPresentationEnvironment.focusFilter(_:), v48);
  sub_100008DB4();
  sub_10001C8B0();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  return sub_10000920C(v33, &qword_100034AB0);
}

uint64_t sub_100007B80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001C9A0();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2);
  id v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C790();
  uint64_t v4 = sub_10001C890();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_10001C830();
  uint64_t v9 = sub_10001C880();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_100008958(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_10001C970();
  uint64_t v14 = sub_10001C870();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v20 = v19;
  swift_release();
  sub_100008958(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  char v21 = v18 & 1;
  sub_10001C9C0();
  uint64_t v23 = v28;
  uint64_t v22 = v29;
  uint64_t v24 = v30;
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v28, enum case for Image.ResizingMode.stretch(_:), v30);
  uint64_t v25 = sub_10001C9B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  *(void *)a1 = v14;
  *(void *)(a1 + 8) = v16;
  *(unsigned char *)(a1 + 16) = v21;
  *(void *)(a1 + 24) = v20;
  *(void *)(a1 + 32) = v25;
  *(void *)(a1 + 40) = 0;
  *(_WORD *)(a1 + 48) = 1;
  sub_100008FAC(v14, v16, v21);
  swift_bridgeObjectRetain();
  sub_100008958(v14, v16, v21);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007E24()
{
  return sub_10001C910();
}

uint64_t type metadata accessor for WidgetParametersConfigurationView()
{
  uint64_t result = qword_100034990;
  if (!qword_100034990) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001C710();
  *a1 = result;
  return result;
}

uint64_t sub_100007EB8(void *a1, char a2)
{
  uint64_t v4 = sub_10001C770();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v14 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_10001CC00();
    uint64_t v9 = sub_10001C7E0();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      v16[1] = v11 + 4;
      sub_100005764(&qword_100034B08);
      uint64_t v12 = sub_10001CE00();
      v16[2] = sub_10000DD28(v12, v13, &v17);
      sub_10001CC60();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10001C760();
    swift_getAtKeyPath();
    sub_1000083C8(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v17;
  }
  return (uint64_t)a1;
}

uint64_t sub_1000080D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10001C740();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000810C()
{
  return sub_10001C750();
}

uint64_t sub_10000813C(void *a1)
{
  id v1 = [a1 widgetDescription];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_10001CB10();

  return v3;
}

uint64_t sub_1000081A0(void *a1)
{
  id v2 = [a1 launchId];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_10001CB10();

  return v3;
}

uint64_t sub_100008210(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100005764(&qword_100034930);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(v6 + 28);
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    id v15 = *(id *)v14;
    LOBYTE(v6) = *(unsigned char *)(v14 + 8);
    sub_100008324(*(id *)v14, v6);
    *(void *)uint64_t v13 = v15;
    *(unsigned char *)(v13 + 8) = v6;
  }
  return a1;
}

id sub_100008324(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_100008330(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100005764(&qword_100034930);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = *(void **)v6;
  char v8 = *(unsigned char *)(v6 + 8);
  sub_1000083C8(v7, v8);
}

void sub_1000083C8(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_1000083D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_100005764(&qword_100034930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = v4 + v11;
  id v14 = *(id *)v13;
  LOBYTE(v4) = *(unsigned char *)(v13 + 8);
  sub_100008324(*(id *)v13, v4);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = v4;
  return a1;
}

uint64_t sub_100008498(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *((unsigned char *)v4 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = (char *)v4 + v6;
  uint64_t v9 = sub_100005764(&qword_100034930);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (char *)v4 + v10;
  id v13 = *(id *)v12;
  LOBYTE(v4) = v12[8];
  sub_100008324(*(id *)v12, (char)v4);
  id v14 = *(void **)v11;
  char v15 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = (_BYTE)v4;
  sub_1000083C8(v14, v15);
  return a1;
}

uint64_t sub_10000857C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100005764(&qword_100034930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  return a1;
}

uint64_t sub_100008630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005764(&qword_100034930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  id v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  LOBYTE(v13) = *((unsigned char *)v13 + 8);
  char v15 = *(void **)v12;
  char v16 = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v12 = v14;
  *(unsigned char *)(v12 + 8) = (_BYTE)v13;
  sub_1000083C8(v15, v16);
  return a1;
}

uint64_t sub_1000086F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000870C);
}

uint64_t sub_10000870C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
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
    uint64_t v9 = sub_100005764(&qword_100034930);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return sub_100005C9C(v10, a2, v9);
  }
}

uint64_t sub_1000087A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000087B8);
}

uint64_t sub_1000087B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_100005764(&qword_100034930);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_1000057A8(v8, a2, a2, v7);
  }
  return result;
}

void sub_10000883C()
{
  sub_1000088E4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000088E4()
{
  if (!qword_1000349A0)
  {
    type metadata accessor for WidgetConfigurationParameterDataSource();
    unint64_t v0 = sub_10001CA80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000349A0);
    }
  }
}

uint64_t sub_10000893C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008958(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100008970@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C720();
  *a1 = result;
  return result;
}

uint64_t sub_10000899C()
{
  return sub_10001C730();
}

uint64_t sub_1000089C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005764(a3);
  sub_100009354();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_100008A20@<X0>(char *a1@<X8>)
{
  return sub_100006DB4(*(void *)(v1 + 16), a1);
}

unint64_t sub_100008A28()
{
  unint64_t result = qword_100034A50;
  if (!qword_100034A50)
  {
    sub_100006044(&qword_100034A38);
    sub_1000092FC(&qword_100034A58, &qword_100034A30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A50);
  }
  return result;
}

uint64_t sub_100008AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetParametersConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008B30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WidgetParametersConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008B94()
{
  uint64_t v0 = type metadata accessor for WidgetParametersConfigurationView();
  sub_100009340(v0);
  uint64_t v1 = (long long *)sub_100009364();
  return sub_10000719C(v1);
}

unint64_t sub_100008BE4()
{
  unint64_t result = qword_100034A80;
  if (!qword_100034A80)
  {
    sub_100006044(&qword_100034A70);
    sub_100008C64();
    sub_100008CD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A80);
  }
  return result;
}

unint64_t sub_100008C64()
{
  unint64_t result = qword_100034A88;
  if (!qword_100034A88)
  {
    sub_100006044(&qword_100034A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A88);
  }
  return result;
}

unint64_t sub_100008CD0()
{
  unint64_t result = qword_100034A98;
  if (!qword_100034A98)
  {
    sub_100006044(&qword_100034AA0);
    sub_100006044(&qword_100034AA8);
    sub_100006044(&qword_100034AB0);
    sub_100008DB4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034A98);
  }
  return result;
}

unint64_t sub_100008DB4()
{
  unint64_t result = qword_100034AB8;
  if (!qword_100034AB8)
  {
    sub_100006044(&qword_100034AB0);
    sub_10001C680();
    sub_100008EC0(&qword_100034AC0, (void (*)(uint64_t))&type metadata accessor for ParameterRowView);
    swift_getOpaqueTypeConformance2();
    sub_100008EC0(&qword_100034AC8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AB8);
  }
  return result;
}

uint64_t sub_100008EC0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100008F08()
{
  unint64_t result = qword_100034AD0;
  if (!qword_100034AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034AD0);
  }
  return result;
}

uint64_t sub_100008F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  if (a7)
  {
    sub_100008FAC(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100008FAC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100008FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  if (a7)
  {
    sub_100008958(a4, a5, a6 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100009014()
{
  return sub_1000072E4(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000901C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005764(a3);
  sub_100009354();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_100009078(uint64_t a1)
{
  return a1;
}

const char *sub_1000090A4()
{
  return "key";
}

uint64_t sub_1000090B8()
{
  uint64_t v1 = (int *)(type metadata accessor for WidgetParametersConfigurationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + v1[8];
  sub_100005764(&qword_100034930);
  sub_100009354();
  (*(void (**)(uint64_t))(v8 + 8))(v7);
  sub_1000083C8(*(id *)(v6 + v1[9]), *(unsigned char *)(v6 + v1[9] + 8));
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000091BC()
{
  uint64_t v0 = type metadata accessor for WidgetParametersConfigurationView();
  sub_100009340(v0);
  uint64_t v1 = (void **)sub_100009364();
  return sub_1000074F4(v1);
}

uint64_t sub_10000920C(uint64_t a1, uint64_t *a2)
{
  sub_100005764(a2);
  sub_100009354();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_100009264()
{
  unint64_t result = qword_100034B10;
  if (!qword_100034B10)
  {
    sub_100006044(&qword_100034B18);
    sub_1000092FC(&qword_100034B20, &qword_100034B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034B10);
  }
  return result;
}

uint64_t sub_1000092FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006044(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009340(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100009364()
{
  return v0;
}

void sub_10000937C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 key];
  uint64_t v4 = sub_10001CB10();
  uint64_t v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_1000093D4@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_10001CD50();
    swift_bridgeObjectRelease();
    if (v18 != 1)
    {
LABEL_28:
      unint64_t v10 = 0;
      uint64_t v8 = 0;
      goto LABEL_21;
    }
    swift_bridgeObjectRetain();
    if (!sub_10001CD50())
    {
      swift_bridgeObjectRelease();
      unint64_t v10 = 0;
      uint64_t v8 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
    {
      unint64_t v10 = 0;
      uint64_t v8 = 0;
      goto LABEL_13;
    }
    swift_bridgeObjectRetain();
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v5 = (id)sub_10001CCC0();
    goto LABEL_7;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_28;
  }
  id v5 = *(id *)(a1 + 32);
LABEL_7:
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if ([v6 allowsMultipleValues]
    && ([v6 displaysMultipleValueEditor] & 1) != 0)
  {
    id v7 = [v6 localizedLabel];
    uint64_t v8 = sub_10001CB10();
    unint64_t v10 = v9;

    if (v4)
    {
LABEL_21:
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_10001CD50();
      if (!v11) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
  }
  else
  {

    uint64_t v8 = 0;
    unint64_t v10 = 0;
    if (v4) {
      goto LABEL_21;
    }
  }
LABEL_13:
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v11)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    unint64_t v17 = 0;
    goto LABEL_23;
  }
LABEL_14:
  BOOL v12 = __OFSUB__(v11, 1);
  unint64_t v13 = v11 - 1;
  if (v12)
  {
    __break(1u);
    goto LABEL_25;
  }
  sub_10000E7F4(v13, (a1 & 0xC000000000000001) == 0, a1);
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_25:
    id v14 = (id)sub_10001CCC0();
    goto LABEL_17;
  }
  id v14 = *(id *)(a1 + 8 * v13 + 32);
LABEL_17:
  char v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t result = sub_10000F028(v15);
LABEL_23:
  *a2 = a1;
  a2[1] = v8;
  a2[2] = v10;
  a2[3] = result;
  a2[4] = v17;
  return result;
}

uint64_t sub_1000095F4()
{
  unint64_t v0 = swift_bridgeObjectRetain();
  sub_100009868(v0);
  swift_bridgeObjectRelease();
  sub_100005764(&qword_100034C60);
  sub_1000092FC(&qword_100034C68, &qword_100034C60);
  uint64_t v1 = sub_10001CAF0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1000096B0()
{
  sub_100005764(&qword_100034C88);
  sub_1000092FC(&qword_100034CB8, &qword_100034C88);
  uint64_t v0 = sub_10001CBC0();
  uint64_t v1 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v0) {
    return (uint64_t)v1;
  }
  uint64_t v2 = v0;
  BOOL v12 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_10000E500(0, v0 & ~(v0 >> 63), 0);
  uint64_t v1 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t result = sub_10001CBB0();
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      unint64_t v4 = (void (*)(void *, void))sub_10001CBE0();
      uint64_t v6 = *v5;
      uint64_t v7 = v5[1];
      v4(v11, 0);
      swift_getKeyPath();
      v11[0] = v6;
      v11[1] = v7;
      swift_getAtKeyPath();
      swift_release();
      unint64_t v8 = v11[4];
      BOOL v12 = v1;
      unint64_t v10 = v1[2];
      unint64_t v9 = v1[3];
      if (v10 >= v9 >> 1)
      {
        sub_10000E500((char *)(v9 > 1), v10 + 1, 1);
        uint64_t v1 = v12;
      }
      v1[2] = v10 + 1;
      v1[v10 + 4] = v8;
      sub_10001CBD0();
      --v2;
    }
    while (v2);
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

char *sub_100009868(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return (char *)_swiftEmptyArrayStorage;
    }
    uint64_t result = sub_10000E520(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_10001CCC0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 key];
      uint64_t v8 = sub_10001CB10();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10000E520((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage[2 * v12];
      *((void *)v13 + 4) = v8;
      *((void *)v13 + 5) = v10;
      if (v2 == v4) {
        return (char *)_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10001CD50();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_1000099E4(uint64_t *a1, uint64_t *a2)
{
  return sub_1000099F0(*a1, *a2);
}

id sub_1000099F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_10001CD50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10001CD50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != v6) {
    goto LABEL_25;
  }
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (!v4) {
    uint64_t v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v9 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v8 = a2;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v9 = v8;
  }
  if (v7 == v9)
  {
LABEL_24:
    char v14 = 1;
    return (id)(v14 & 1);
  }
  if (v5 < 0) {
    goto LABEL_43;
  }
  unint64_t v20 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
LABEL_44:
  }
    id result = (id)sub_10001CCC0();
  else {
    id result = *(id *)(a1 + 32);
  }
  uint64_t v4 = result;
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v11 = (id)sub_10001CCC0();
LABEL_22:
    unint64_t v12 = v11;
    sub_10000F590(0, &qword_100034C70);
    char v13 = sub_10001CC30();

    if (v13)
    {
      if (v5 != 1)
      {
        uint64_t v15 = 5;
        while (1)
        {
          if (v15 - 4 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v20) {
            id v16 = (id)sub_10001CCC0();
          }
          else {
            id v16 = *(id *)(a1 + 8 * v15);
          }
          uint64_t v4 = v16;
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v17 = (id)sub_10001CCC0();
          }
          else
          {
            if ((unint64_t)(v15 - 4) >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            id v17 = *(id *)(a2 + 8 * v15);
          }
          uint64_t v18 = v17;
          char v14 = sub_10001CC30();

          if (v14)
          {
            uint64_t v19 = 2 - v5 + v15++;
            if (v19 != 5) {
              continue;
            }
          }
          return (id)(v14 & 1);
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    char v14 = 0;
    return (id)(v14 & 1);
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v11 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_100009C4C(uint64_t a1)
{
  unint64_t v2 = swift_bridgeObjectRetain();
  id v3 = sub_100009868(v2);
  swift_bridgeObjectRelease();
  sub_10000F408(a1, (uint64_t)v3);
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100009CB4()
{
  sub_10001CDB0();
  unint64_t v1 = swift_bridgeObjectRetain();
  sub_100009868(v1);
  sub_10000F6F8();
  sub_10000F408((uint64_t)v3, v0);
  swift_bridgeObjectRelease();
  return sub_10001CDD0();
}

Swift::Int sub_100009D2C()
{
  sub_10001CDB0();
  unint64_t v0 = swift_bridgeObjectRetain();
  unint64_t v1 = sub_100009868(v0);
  swift_bridgeObjectRelease();
  sub_10000F408((uint64_t)v3, (uint64_t)v1);
  swift_bridgeObjectRelease();
  return sub_10001CDD0();
}

uint64_t sub_100009DA0(uint64_t a1)
{
  return sub_10000F6E8(a1);
}

uint64_t sub_100009DAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000095F4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009DD8()
{
  return sub_100009E94();
}

uint64_t sub_100009DEC()
{
  return sub_100009E18();
}

uint64_t sub_100009E18()
{
  return sub_100009F54();
}

uint64_t sub_100009E38(uint64_t a1, uint64_t a2)
{
  return sub_100009DA0(a2);
}

uint64_t sub_100009E74(uint64_t a1)
{
  return sub_10000F6E8(a1);
}

uint64_t sub_100009E80()
{
  return sub_100009E94();
}

uint64_t sub_100009E94()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100009F08()
{
  return sub_100009F34();
}

uint64_t sub_100009F34()
{
  return sub_100009F54();
}

uint64_t sub_100009F54()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100009FC0(uint64_t a1, uint64_t a2)
{
  return sub_100009E74(a2);
}

void sub_100009FFC(void *a1)
{
  uint64_t v3 = v1;
  sub_10001C640();
  *(void *)&v3[OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource_action] = a1;
  id v4 = a1;
  id v5 = [v4 visibleParametersWithProcessing:0];
  sub_10000F590(0, &qword_100034C70);
  unint64_t v6 = sub_10001CB50();

  *(void *)&v3[OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource__configurableParameters] = sub_10000A3DC(v6);
  int64_t v7 = swift_bridgeObjectRetain();
  sub_10000A52C(v7);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  *(void *)&v3[OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource__configurationSections] = v9;

  v17.receiver = v3;
  v17.super_class = (Class)type metadata accessor for WidgetConfigurationParameterDataSource();
  id v10 = objc_msgSendSuper2(&v17, "init");
  [v4 addEventObserver:v10];
  id v11 = [v4 parameters];
  unint64_t v12 = sub_10001CB50();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_3;
    }
LABEL_9:

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_10001CD50();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_9;
  }
LABEL_3:
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v15 = (id)sub_10001CCC0();
      }
      else {
        id v15 = *(id *)(v12 + 8 * i + 32);
      }
      id v16 = v15;
      [v15 addEventObserver:v10];
    }
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_10000A208()
{
  self;
  if (swift_dynamicCastObjCClass()) {
    goto LABEL_18;
  }
  id v1 = [v0 key];
  uint64_t v2 = sub_10001CB10();
  uint64_t v4 = v3;

  if (v2 == sub_10001CB10() && v4 == v5) {
    goto LABEL_17;
  }
  char v7 = sub_10001CD90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v8 = 0;
  if (v7) {
    return v8 & 1;
  }
  id v9 = [v0 key];
  uint64_t v10 = sub_10001CB10();
  uint64_t v12 = v11;

  if (v10 == sub_10001CB10() && v12 == v13)
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
LABEL_18:
    char v8 = 0;
    return v8 & 1;
  }
  char v15 = sub_10001CD90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v8 = 0;
  if ((v15 & 1) == 0)
  {
    id v16 = [v0 key];
    uint64_t v17 = sub_10001CB10();
    uint64_t v19 = v18;

    if (v17 != sub_10001CB10() || v19 != v20)
    {
      char v22 = sub_10001CD90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v8 = v22 ^ 1;
      return v8 & 1;
    }
    goto LABEL_17;
  }
  return v8 & 1;
}

void *sub_10000A3DC(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_10001CCC0();
LABEL_7:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        if (sub_10000A208())
        {
          sub_10001CCE0();
          sub_10001CD10();
          sub_10001CD20();
          sub_10001CCF0();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          goto LABEL_17;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_10001CD50();
      if (!v2) {
        goto LABEL_17;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

void sub_10000A52C(int64_t a1)
{
  uint64_t v5 = sub_100005764(&qword_100034C88);
  sub_10000F6CC();
  uint64_t v7 = v6;
  __chkstk_darwin();
  sub_10000F738();
  unint64_t v8 = sub_100005764(&qword_100034C90);
  sub_10000F6CC();
  Swift::Int v10 = v9;
  __chkstk_darwin();
  unint64_t v57 = (unint64_t)a1 >> 62;
  unsigned __int8 v54 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
LABEL_86:
  if (a1 < 0) {
    unint64_t v2 = a1;
  }
  else {
    unint64_t v2 = v12;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_10001CD50();
  swift_bridgeObjectRelease();
  if (v13 < 0)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  swift_bridgeObjectRetain();
  sub_10001CD50();
  sub_10000F6F8();
  if ((v1 & 0x8000000000000000) == 0)
  {
    swift_bridgeObjectRetain();
    sub_10001CD50();
    sub_10000F6F8();
    if (v1 < v13)
    {
      __break(1u);
      goto LABEL_93;
    }
LABEL_3:
    unint64_t v55 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) != 0 && v13)
    {
      uint64_t v1 = sub_10000F590(0, &qword_100034C70);
      Swift::Int v14 = 0;
      do
      {
        sub_10000F774(v14);
        Swift::Int v14 = v2;
      }
      while (v13 != v2);
    }
    Swift::Int v49 = v10;
    unint64_t v50 = v8;
    int64_t v51 = v3;
    uint64_t v52 = v7;
    uint64_t v53 = v5;
    if (v57)
    {
      if (a1 < 0) {
        uint64_t v1 = a1;
      }
      else {
        uint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      sub_10001CD60();
      sub_10000F750();
    }
    else
    {
      unint64_t v8 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v2 = (2 * v13) | 1;
      swift_bridgeObjectRetain();
      Swift::Int v10 = 0;
    }
    if (v10 != v2 >> 1)
    {
      uint64_t v7 = v2 >> 1;
      if (a1 < 0) {
        uint64_t v26 = a1;
      }
      else {
        uint64_t v26 = a1 & 0xFFFFFFFFFFFFFF8;
      }
      uint64_t v47 = v26;
      uint64_t v48 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v46 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v45 = (2 * v13) | 1;
      unint64_t v12 = (unint64_t)&_swiftEmptyArrayStorage;
      uint64_t v56 = (char *)&_swiftEmptyArrayStorage;
      while (1)
      {
        int64_t v3 = v2 >> 1;
        while (1)
        {
          if (v10 >= v3)
          {
            __break(1u);
LABEL_85:
            __break(1u);
            goto LABEL_86;
          }
          unint64_t v2 = (unint64_t)*(id *)(v8 + 8 * v10);
          if ([(id)v2 allowsMultipleValues])
          {
            if ([(id)v2 displaysMultipleValueEditor]) {
              break;
            }
          }
          uint64_t v5 = sub_10000F098((void *)v2);
          uint64_t v1 = v27;

          if (v1)
          {
            swift_bridgeObjectRelease();
            unint64_t v12 = HIBYTE(v1) & 0xF;
            if ((v1 & 0x2000000000000000) == 0) {
              unint64_t v12 = v5 & 0xFFFFFFFFFFFFLL;
            }
            if (v12)
            {
              swift_unknownObjectRelease();
              goto LABEL_38;
            }
          }
          if (v7 == ++v10) {
            goto LABEL_15;
          }
        }
        swift_unknownObjectRelease();

LABEL_38:
        if (v13 < v10) {
          goto LABEL_95;
        }
        if (v57)
        {
          swift_bridgeObjectRetain();
          sub_10001CD50();
          sub_10000F6F8();
        }
        else
        {
          uint64_t v1 = *(void *)(v48 + 16);
        }
        if (v1 < v10) {
          goto LABEL_96;
        }
        if (v10 < 0) {
          goto LABEL_97;
        }
        if (v55 && v13 != v10)
        {
          if (v10 >= v13) {
            goto LABEL_101;
          }
          sub_10000F590(0, &qword_100034C70);
          Swift::Int v28 = v10;
          do
          {
            sub_10000F774(v28);
            Swift::Int v28 = v2;
          }
          while (v13 != v2);
        }
        swift_bridgeObjectRetain();
        uint64_t v1 = v48;
        uint64_t v29 = v46;
        uint64_t v7 = v10;
        unint64_t v30 = v45;
        if (v57)
        {
          uint64_t v1 = sub_10000F804();
          uint64_t v29 = v31;
          uint64_t v7 = v32;
          unint64_t v30 = v33;
          swift_bridgeObjectRelease();
        }
        uint64_t v44 = v1;
        unint64_t v12 = v30;
        uint64_t v34 = v30 >> 1;
        uint64_t v5 = v7;
        unint64_t v43 = v12;
        if (v7 != v12 >> 1)
        {
          while (v5 < v34)
          {
            uint64_t v1 = (uint64_t)*(id *)(v29 + 8 * v5);
            if ([(id)v1 allowsMultipleValues]
              && [(id)v1 displaysMultipleValueEditor])
            {
            }
            else
            {
              int64_t v3 = sub_10000F098((void *)v1);
              unint64_t v8 = v35;

              if (!v8) {
                goto LABEL_62;
              }
              swift_bridgeObjectRelease();
              unint64_t v12 = HIBYTE(v8) & 0xF;
              if ((v8 & 0x2000000000000000) == 0) {
                unint64_t v12 = v3 & 0xFFFFFFFFFFFFLL;
              }
              if (!v12) {
                goto LABEL_62;
              }
            }
            if (v34 == ++v5)
            {
              uint64_t v5 = v34;
LABEL_62:
              if (v5 < v7) {
                goto LABEL_98;
              }
              goto LABEL_63;
            }
          }
          goto LABEL_85;
        }
LABEL_63:
        sub_10000F0FC(v7, v5, v44, v29, v7, v43);
        unint64_t v37 = v36;
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        unint64_t v2 = v37 >> 1;
        if ((uint64_t)v2 < v10) {
          goto LABEL_99;
        }
        uint64_t v38 = v56;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v38 = sub_10000D4E0(0, *((void *)v38 + 2) + 1, 1, (uint64_t)v38);
        }
        uint64_t v5 = *((void *)v38 + 2);
        unint64_t v39 = *((void *)v38 + 3);
        uint64_t v1 = v5 + 1;
        if (v5 >= v39 >> 1) {
          uint64_t v38 = sub_10000D4E0((char *)(v39 > 1), v5 + 1, 1, (uint64_t)v38);
        }
        *((void *)v38 + 2) = v1;
        uint64_t v40 = &v38[16 * v5];
        *((void *)v40 + 4) = v10;
        *((void *)v40 + 5) = v2;
        if ((uint64_t)v2 >= v13)
        {
          sub_10000F7E4();
          goto LABEL_16;
        }
        if (v57)
        {
          swift_bridgeObjectRetain();
          sub_10001CD50();
          sub_10000F6F8();
        }
        else
        {
          uint64_t v1 = *(void *)(v48 + 16);
        }
        if (v1 <= (uint64_t)v2) {
          goto LABEL_100;
        }
        Swift::Int v10 = v2 + 1;
        if (v55 && v10 != v13)
        {
          if (v10 >= v13) {
            goto LABEL_102;
          }
          uint64_t v1 = sub_10000F590(0, &qword_100034C70);
          Swift::Int v41 = v2 + 1;
          do
          {
            sub_10000F774(v41);
            Swift::Int v41 = v2;
          }
          while (v13 != v2);
        }
        uint64_t v56 = v38;
        swift_bridgeObjectRetain();
        if (v57)
        {
          sub_10000F804();
          sub_10000F750();
        }
        else
        {
          unint64_t v8 = v46;
          unint64_t v12 = (unint64_t)&v64;
          unint64_t v2 = v45;
        }
        uint64_t v7 = v2 >> 1;
        if (v10 == v2 >> 1) {
          goto LABEL_15;
        }
      }
    }
    uint64_t v56 = (char *)&_swiftEmptyArrayStorage;
LABEL_15:
    swift_unknownObjectRelease();
    sub_10000F7E4();
LABEL_16:
    char v15 = v54;
    sub_10001CDE0();
    sub_10001CDF0();
    (*(void (**)(char *, unint64_t))(v8 + 8))(v15, v2);
    uint64_t v16 = sub_1000096B0();
    (*(void (**)(int64_t, uint64_t))(v7 + 8))(v3, v5);
    uint64_t v61 = v16;
    sub_10000E8DC(0, 0, 0);
    uint64_t v17 = v61;
    uint64_t v18 = sub_10000C180(1, v61);
    uint64_t v20 = v19;
    unint64_t v22 = v21;
    uint64_t v58 = v18;
    uint64_t v59 = v23;
    *(void *)&long long v60 = v19;
    *((void *)&v60 + 1) = v21;
    swift_bridgeObjectRetain();
    if ((v22 & 1) == 0
      || (char isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull(),
          uint64_t v58 = v18,
          (isUniquelyReferenced_nonNull & 1) == 0))
    {
      if (__OFSUB__(v22 >> 1, v20)) {
        goto LABEL_94;
      }
      sub_10000EAD0((void *)((v22 >> 1) - v20));
    }
    uint64_t v25 = (*((void *)&v60 + 1) >> 1) - v60;
    if (!__OFSUB__(*((void *)&v60 + 1) >> 1, (void)v60))
    {
      sub_10000E9D4((*((void *)&v60 + 1) >> 1) - v60);
      sub_10000EB8C((void *)(v25 + 1));
      v62[0] = v17;
      v62[1] = v58;
      v62[2] = v59;
      long long v63 = v60;
      *(void *)(v59 + 8 * v60 + 8 * v25) = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      sub_10000C49C(v62, a1);
      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease_n();
      return;
    }
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
LABEL_104:
  __break(1u);
}

uint64_t sub_10000ACDC()
{
  sub_100006160();
  v1[2] = v0;
  sub_10001CB80();
  v1[3] = sub_10001CB70();
  uint64_t v3 = sub_10001CB60();
  v1[4] = v3;
  v1[5] = v2;
  return _swift_task_switch(sub_10000AD70, v3, v2);
}

void sub_10000AD70()
{
  uint64_t v1 = *(void **)(v0[2] + OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource_action);
  v0[6] = v1;
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    swift_release();
    id v4 = v1;
    id v5 = [v3 fullyQualifiedLinkActionIdentifier];
    id v6 = [v5 bundleIdentifier];

    sub_10001CB10();
    id v7 = [v3 fullyQualifiedLinkActionIdentifier];
    id v8 = [v7 actionIdentifier];

    sub_10001CB10();
    id v9 = [v3 serializedParameters];
    sub_100005764(&qword_100034D30);
    uint64_t v10 = sub_10001CAE0();

    sub_10000B3C0(v10);
    swift_bridgeObjectRelease();
    id v11 = objc_allocWithZone((Class)INAppIntent);
    id v12 = sub_10000D32C();
    id v13 = [v3 metadata];
    id v14 = [v13 effectiveBundleIdentifiers];

    id v15 = [v14 array];
    uint64_t v16 = sub_10001CB50();

    unint64_t v17 = (unint64_t)sub_10000B774(v16);
    swift_bridgeObjectRelease();
    if (v17 >> 62) {
      goto LABEL_19;
    }
    uint64_t v18 = *(void **)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v18; uint64_t v18 = (void *)sub_10001CD50())
    {
      uint64_t v19 = 0;
      while (1)
      {
        id v20 = (v17 & 0xC000000000000001) != 0 ? (id)sub_10001CCC0() : *(id *)(v17 + 8 * v19 + 32);
        unint64_t v21 = v20;
        unint64_t v22 = (void *)(v19 + 1);
        if (__OFADD__(v19, 1)) {
          break;
        }
        if ([v20 type] == (id)1)
        {
          swift_bridgeObjectRelease_n();
          id v26 = [v21 bundleIdentifier];

          sub_10001CB10();
          uint64_t v18 = sub_10001CB00();
          goto LABEL_21;
        }

        ++v19;
        if (v22 == v18)
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = 0;
          goto LABEL_21;
        }
      }
      __break(1u);
LABEL_19:
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    [v12 _setExtensionBundleId:v18];

    sub_10000F824();
    sub_10000F790();
    __asm { BRAA            X2, X16 }
  }
  self;
  if (swift_dynamicCastObjCClass())
  {
    id v23 = v1;
    uint64_t v24 = (void *)swift_task_alloc();
    v0[7] = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_10000B1F0;
    sub_10000F790();
    sub_10000B870();
  }
  else
  {
    sub_10001CD40();
    sub_10000F790();
  }
}

uint64_t sub_10000B1F0()
{
  sub_10000F7F8();
  uint64_t v3 = v2;
  sub_100006130();
  id v5 = v4;
  sub_10000F7C4();
  void *v6 = v5;
  uint64_t v7 = *v1;
  sub_10000F7C4();
  *id v8 = v7;
  v5[8] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = v5[4];
    uint64_t v10 = v5[5];
    id v11 = sub_10000B354;
  }
  else
  {
    v5[9] = v3;
    uint64_t v9 = v5[4];
    uint64_t v10 = v5[5];
    id v11 = sub_10000B2E8;
  }
  return _swift_task_switch(v11, v9, v10);
}

uint64_t sub_10000B2E8()
{
  sub_100006160();
  uint64_t v1 = (void *)v0[6];
  swift_release();

  uint64_t v2 = v0[9];
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_10000B354()
{
  sub_100006160();

  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000B3C0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005764((uint64_t *)&unk_100034D40);
    uint64_t v2 = (void *)sub_10001CD70();
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
  id v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    id v15 = (void *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v16 = v15[1];
    *(void *)&v36[0] = *v15;
    *((void *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    sub_100005764(&qword_100034D30);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000F5CC(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000F5CC(v35, v36);
    sub_10000F5CC(v36, &v32);
    uint64_t result = sub_10001CC80(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)]) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v19];
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v20 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v20;
    uint64_t v25 = v2[6] + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000F5CC(&v32, (_OWORD *)(v2[7] + 32 * v20));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_10000F5DC();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void *sub_10000B774(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    id v6 = &_swiftEmptyArrayStorage;
    sub_10001CD00();
    uint64_t v4 = a1 + 32;
    do
    {
      sub_10000F4D4(v4, (uint64_t)&v5);
      sub_10000F590(0, &qword_100034D38);
      swift_dynamicCast();
      sub_10001CCE0();
      sub_10001CD10();
      sub_10001CD20();
      sub_10001CCF0();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_10000B870()
{
  v1[16] = v0;
  sub_10001CB80();
  v1[17] = sub_10001CB70();
  uint64_t v3 = sub_10001CB60();
  v1[18] = v3;
  v1[19] = v2;
  return _swift_task_switch(sub_10000B908, v3, v2);
}

uint64_t sub_10000B908()
{
  sub_100006160();
  sub_10000F590(0, &qword_100034C78);
  uint64_t v1 = sub_10001CC10();
  *(void *)(v0 + 160) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10000B9C8;
  return WFAction.processParametersWithoutAskingForValues(withInput:workQueue:)(0, v1);
}

uint64_t sub_10000B9C8()
{
  sub_10000F7F8();
  uint64_t v3 = v2;
  sub_100006130();
  uint64_t v5 = v4;
  sub_10000F7C4();
  void *v6 = v5;
  void *v6 = *v1;
  *(void *)(v5 + 176) = v7;
  *(void *)(v5 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = *(void *)(v5 + 144);
    uint64_t v9 = *(void *)(v5 + 152);
    unint64_t v10 = sub_10000BDC8;
  }
  else
  {

    uint64_t v8 = *(void *)(v5 + 144);
    uint64_t v9 = *(void *)(v5 + 152);
    unint64_t v10 = sub_10000BACC;
  }
  return _swift_task_switch(v10, v8, v9);
}

uint64_t sub_10000BACC()
{
  id v1 = [*(id *)(v0 + 128) identifier];
  if (!v1)
  {
    sub_10001CB10();
    sub_10001CB00();
    sub_10000F6F8();
  }
  *(void *)(v0 + 192) = v1;
  uint64_t v2 = *(void **)(v0 + 128);
  sub_100005764(&qword_100034D50);
  Class isa = sub_10001CAD0().super.isa;
  *(void *)(v0 + 200) = isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_10000BC54;
  uint64_t v4 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_10000D238;
  *(void *)(v0 + 104) = &unk_10002D220;
  *(void *)(v0 + 112) = v4;
  [v2 generatePopulatedIntentWithIdentifier:v1 fromInput:0 processedParameters:isa completion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10000BC54()
{
  sub_100006160();
  sub_100006130();
  sub_10000F7C4();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = v3[6];
  *(void *)(v1 + 208) = v4;
  uint64_t v5 = v3[19];
  uint64_t v6 = v3[18];
  if (v4) {
    uint64_t v7 = sub_10000BE30;
  }
  else {
    uint64_t v7 = sub_10000BD58;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_10000BD58()
{
  sub_10000F7F8();
  uint64_t v2 = *(void **)(v0 + 192);
  uint64_t v1 = *(void **)(v0 + 200);
  swift_release();

  uint64_t v3 = sub_10000F824();
  return v4(v3);
}

uint64_t sub_10000BDC8()
{
  sub_100006160();
  uint64_t v1 = *(void **)(v0 + 160);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000BE30()
{
  sub_10000F7F8();
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[24];
  swift_release();
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10000BEAC()
{
  return sub_10001C620();
}

void sub_10000BF38()
{
}

id sub_10000BF78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WidgetConfigurationParameterDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C050()
{
  return type metadata accessor for WidgetConfigurationParameterDataSource();
}

uint64_t type metadata accessor for WidgetConfigurationParameterDataSource()
{
  uint64_t result = qword_100034B78;
  if (!qword_100034B78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C0A0()
{
  uint64_t result = sub_10001C650();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000C150@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_10000C180(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_10000F178(0, result, v3);
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result;
  }
  if (v3 < v5) {
    goto LABEL_9;
  }
  if ((v5 & 0x8000000000000000) == 0) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t *sub_10000C1EC@<X0>(uint64_t *result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *result;
  int64_t v7 = result[1];
  if (v7 < *result)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a2;
    uint64_t v3 = a3;
    unint64_t v5 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v8 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_10001CD50();
  uint64_t result = (uint64_t *)swift_bridgeObjectRelease();
LABEL_4:
  if (v8 < v6)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v6 < 0)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10001CD50();
    uint64_t result = (uint64_t *)swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v7) {
    goto LABEL_23;
  }
  if ((v4 & 0xC000000000000001) != 0 && v6 != v7)
  {
    if (v6 < (unint64_t)v7)
    {
      sub_10000F590(0, &qword_100034C70);
      Swift::Int v10 = v6;
      do
      {
        Swift::Int v11 = v10 + 1;
        sub_10001CCB0(v10);
        Swift::Int v10 = v11;
      }
      while (v7 != v11);
      goto LABEL_15;
    }
LABEL_24:
    __break(1u);
    return result;
  }
LABEL_15:
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_10001CD60();
    uint64_t v13 = v15;
    uint64_t v6 = v16;
    unint64_t v14 = v17;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v4 & 0xFFFFFFFFFFFFFF8;
    uint64_t v13 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
    unint64_t v14 = (2 * v7) | 1;
    swift_bridgeObjectRetain();
  }
  unint64_t v18 = sub_10000C3B4(v12, v13, v6, v14);
  uint64_t result = (uint64_t *)sub_1000093D4((unint64_t)v18, (unint64_t *)v20);
  long long v19 = v20[1];
  *(_OWORD *)uint64_t v3 = v20[0];
  *(_OWORD *)(v3 + 16) = v19;
  *(void *)(v3 + 32) = v21;
  return result;
}

void *sub_10000C3B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_10001CDA0();
  swift_unknownObjectRetain_n();
  Swift::Int v10 = (void *)swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    Swift::Int v10 = &_swiftEmptyArrayStorage;
  }
  uint64_t v11 = v10[2];
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_10000E818(a1, a2, a3, a4);
    uint64_t v9 = v8;
    goto LABEL_9;
  }
  uint64_t v9 = (void *)swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = &_swiftEmptyArrayStorage;
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

void *sub_10000C49C(void *result, unint64_t a2)
{
  uint64_t v3 = result[4] >> 1;
  uint64_t v37 = result[3];
  if (__OFSUB__(v3, v37))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
  uint64_t v4 = v2;
  uint64_t v5 = *result;
  uint64_t v31 = result[2];
  uint64_t v32 = *(void *)(*result + 16);
  if (v3 - v37 >= v32) {
    uint64_t v6 = *(void *)(*result + 16);
  }
  else {
    uint64_t v6 = v3 - v37;
  }
  uint64_t v44 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_10000E4E0(0, v6 & ~(v6 >> 63), 0);
  if (v6 < 0) {
    goto LABEL_42;
  }
  int64_t v7 = v44;
  uint64_t v34 = v3;
  uint64_t v35 = v5;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
    uint64_t v8 = 0;
    uint64_t v9 = v37 - v3;
    while (v6 != v8)
    {
      if (!v32) {
        goto LABEL_36;
      }
      if (!(v9 + v8)) {
        goto LABEL_37;
      }
      if (v37 + v8 >= v3) {
        goto LABEL_38;
      }
      uint64_t v10 = *(void *)(v31 + 8 * v37 + 8 * v8);
      uint64_t v38 = *(void *)(v5 + 8 * v8 + 32);
      uint64_t v39 = v10;
      char v40 = 0;
      uint64_t result = sub_10000C1EC(&v38, a2, (uint64_t)&v41);
      if (v4)
      {
LABEL_33:
        swift_bridgeObjectRelease();
        swift_release();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return v7;
      }
      uint64_t v4 = 0;
      uint64_t v11 = v41;
      long long v12 = v42;
      long long v13 = v43;
      uint64_t v44 = v7;
      unint64_t v15 = v7[2];
      unint64_t v14 = v7[3];
      if (v15 >= v14 >> 1)
      {
        long long v28 = v43;
        long long v29 = v42;
        uint64_t result = sub_10000E4E0((char *)(v14 > 1), v15 + 1, 1);
        long long v13 = v28;
        long long v12 = v29;
        int64_t v7 = v44;
      }
      v7[2] = v15 + 1;
      uint64_t v16 = &v7[5 * v15];
      v16[4] = v11;
      ++v8;
      *(_OWORD *)(v16 + 5) = v12;
      *(_OWORD *)(v16 + 7) = v13;
      uint64_t v3 = v34;
      uint64_t v5 = v35;
      if (v6 == v8)
      {
        uint64_t v17 = v37 + v8;
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)swift_unknownObjectRetain();
  uint64_t v17 = v37;
LABEL_18:
  unint64_t v18 = *(void *)(v5 + 16);
  if (v6 != v18)
  {
    uint64_t v19 = v17;
    while (v6 < v18)
    {
      if (v3 == v19) {
        goto LABEL_19;
      }
      if (v17 < v37 || v19 >= v3) {
        goto LABEL_40;
      }
      uint64_t v21 = *(void *)(v31 + 8 * v19);
      uint64_t v38 = *(void *)(v5 + 8 * v6 + 32);
      uint64_t v39 = v21;
      uint64_t result = sub_10000C1EC(&v38, a2, (uint64_t)&v41);
      if (v4) {
        goto LABEL_33;
      }
      uint64_t v4 = 0;
      uint64_t v22 = v41;
      long long v23 = v42;
      long long v24 = v43;
      uint64_t v44 = v7;
      unint64_t v26 = v7[2];
      unint64_t v25 = v7[3];
      if (v26 >= v25 >> 1)
      {
        long long v33 = v42;
        long long v30 = v43;
        uint64_t result = sub_10000E4E0((char *)(v25 > 1), v26 + 1, 1);
        long long v24 = v30;
        long long v23 = v33;
        int64_t v7 = v44;
      }
      ++v6;
      v7[2] = v26 + 1;
      uint64_t v27 = &v7[5 * v26];
      v27[4] = v22;
      *(_OWORD *)(v27 + 5) = v23;
      *(_OWORD *)(v27 + 7) = v24;
      uint64_t v3 = v34;
      uint64_t v5 = v35;
      unint64_t v18 = *(void *)(v35 + 16);
      ++v19;
      if (v6 == v18) {
        goto LABEL_19;
      }
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000C79C(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = sub_10001C6E0();
  sub_10000F6CC();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  uint64_t v11 = sub_10000F710();
  sub_10000F6CC();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000F590(0, &qword_100034C78);
  *uint64_t v16 = sub_10001CC10();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v16, enum case for DispatchPredicate.onQueue(_:), v11);
  char v17 = sub_10001CAC0();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v13 + 8))(v16, v11);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t result = WFLogCategoryFocusConfiguration;
  if (!WFLogCategoryFocusConfiguration)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  sub_10001C6C0();
  swift_bridgeObjectRetain_n();
  id v19 = a1;
  unint64_t v20 = sub_10001C6D0();
  os_log_type_t v21 = sub_10001CBF0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v32 = v9;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_10000DD28(a2, a3, &v34);
    sub_10001CC60();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    id v23 = [v19 identifier];
    uint64_t v24 = sub_10001CB10();
    uint64_t v30 = v7;
    unint64_t v26 = v25;

    uint64_t v33 = sub_10000DD28(v24, v26, &v34);
    sub_10001CC60();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Parameter state changed for key: %s, in action: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    sub_10000F7AC();
    sub_10000F7AC();

    return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v3, v30);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v27 = sub_10000F7D0();
    return v28(v27);
  }
}

uint64_t sub_10000CB44(void *a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_10001C6E0();
  sub_10000F6CC();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  uint64_t v10 = sub_10000F710();
  sub_10000F6CC();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_10000F738();
  sub_10000F590(0, &qword_100034C78);
  uint64_t *v3 = sub_10001CC10();
  (*(void (**)(uint64_t *, void, uint64_t))(v12 + 104))(v3, enum case for DispatchPredicate.onQueue(_:), v10);
  char v14 = sub_10001CAC0();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v3, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t result = WFLogCategoryFocusConfiguration;
  if (!WFLogCategoryFocusConfiguration)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  sub_10001C6C0();
  id v16 = a1;
  id v17 = v4;
  id v18 = v16;
  id v19 = (char *)v17;
  unint64_t v20 = sub_10001C6D0();
  os_log_type_t v21 = sub_10001CBF0();
  uint64_t v22 = &OBJC_IVAR___WFConfigurationParametersViewController__delegate;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = swift_slowAlloc();
    v39[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v38 = v8;
    uint64_t v37 = v6;
    id v24 = [v18 key];
    uint64_t v25 = sub_10001CB10();
    unint64_t v27 = v26;

    sub_10000DD28(v25, v27, v39);
    sub_10001CC60();

    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2080;
    id v28 = [*(id *)&v19[OBJC_IVAR____TtC28WidgetConfigurationExtension38WidgetConfigurationParameterDataSource_action] identifier];
    uint64_t v29 = sub_10001CB10();
    unint64_t v31 = v30;

    sub_10000DD28(v29, v31, v39);
    uint64_t v22 = &OBJC_IVAR___WFConfigurationParametersViewController__delegate;
    sub_10001CC60();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Parameter attributes changed: %s, in action: %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    sub_10000F7AC();
    sub_10000F7AC();

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v2, v37);
  }
  else
  {

    uint64_t v32 = sub_10000F7D0();
    v33(v32);
  }
  id v34 = [*(id *)&v19[*((void *)v22 + 358)] visibleParametersWithProcessing:0];
  sub_10000F590(0, &qword_100034C70);
  unint64_t v35 = sub_10001CB50();

  sub_10000A3DC(v35);
  sub_100009E18();
  int64_t v36 = sub_100009DD8();
  sub_10000A52C(v36);
  sub_10000F6F8();
  return sub_100009F34();
}

uint64_t initializeBufferWithCopyOfBuffer for ConfigurationSection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ConfigurationSection()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ConfigurationSection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ConfigurationSection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ConfigurationSection(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for ConfigurationSection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfigurationSection(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for ConfigurationSection(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationSection()
{
  return &type metadata for ConfigurationSection;
}

void *sub_10000D1DC()
{
  return &protocol witness table for String;
}

unint64_t sub_10000D1EC()
{
  unint64_t result = qword_100034C50;
  if (!qword_100034C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034C50);
  }
  return result;
}

uint64_t sub_10000D238(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_10000D2A8(v3, (uint64_t)v4);
  }
  else if (a2)
  {
    id v5 = a2;
    return sub_10000D30C(v3, (uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D2A8(uint64_t a1, uint64_t a2)
{
  sub_100005764(&qword_100034D58);
  uint64_t v4 = swift_allocError();
  void *v5 = a2;
  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_10000D30C(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return _swift_continuation_throwingResume();
}

id sub_10000D32C()
{
  NSString v1 = sub_10001CB00();
  swift_bridgeObjectRelease();
  NSString v2 = sub_10001CB00();
  swift_bridgeObjectRelease();
  Class isa = sub_10001CAD0().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [v0 initWithAppBundleIdentifier:v1 appIntentIdentifier:v2 serializedParameters:isa];

  return v4;
}

char *sub_10000D3F0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005764(&qword_100034CB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_10000D854((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10000D5D0(0, v8, v12, a4);
  }
  return v10;
}

char *sub_10000D4E0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005764(&qword_100034C98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_10000D8E8((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10000D6C4(0, v8, v12, a4);
  }
  return v10;
}

char *sub_10000D5D0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    unint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  unint64_t result = (char *)sub_10001CD80();
  __break(1u);
  return result;
}

char *sub_10000D6C4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 16 * a1 + 32);
    unint64_t v6 = &__dst[16 * v4];
    if (v5 >= v6 || &v5[16 * v4] <= __dst)
    {
      memcpy(__dst, v5, 16 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  unint64_t result = (char *)sub_10001CD80();
  __break(1u);
  return result;
}

char *sub_10000D7B8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_10001CD80();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_10000D854(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_10001CD80();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_10000D8E8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_10001CD80();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_10000D97C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((v5 = a1, a3 + 40 * v4 > a1) ? (BOOL v6 = a1 + 40 * v4 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_10001CD80();
    __break(1u);
  }
  else
  {
    uint64_t v7 = &type metadata for ConfigurationSection;
    uint64_t v8 = a3;
  }
  return _swift_arrayInitWithCopy(v8, v5, v4, v7);
}

void *sub_10000DA60(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    unint64_t result = (void *)sub_10001CD80();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_10000DB3C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((v5 = a1, a3 + 16 * v4 > a1) ? (BOOL v6 = a1 + 16 * v4 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_10001CD80();
    __break(1u);
  }
  else
  {
    uint64_t v7 = &type metadata for String;
    uint64_t v8 = a3;
  }
  return _swift_arrayInitWithCopy(v8, v5, v4, v7);
}

uint64_t sub_10000DC1C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v6 = a1 + 8 * a2 > a3) : (BOOL v6 = 0), v6))
  {
    uint64_t v8 = sub_10001CD80();
    __break(1u);
  }
  else
  {
    uint64_t v7 = sub_10000F590(0, &qword_100034C70);
    uint64_t v8 = a3;
    unint64_t v9 = a1;
    uint64_t v10 = a2;
  }
  return _swift_arrayInitWithCopy(v8, v9, v10, v7);
}

uint64_t sub_10000DD28(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000DDFC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000F4D4((uint64_t)v12, *a3);
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
      sub_10000F4D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000F484((uint64_t)v12);
  return v7;
}

uint64_t sub_10000DDFC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000DF54((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10001CC70();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10000E02C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10001CCD0();
    if (!v8)
    {
      uint64_t result = sub_10001CD30();
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

void *sub_10000DF54(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10001CD80();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10000E02C(uint64_t a1, unint64_t a2)
{
  NSString v2 = sub_10000E0C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    NSString v2 = sub_10000E2A0(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    NSString v2 = sub_10000E2A0((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000E0C4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_10001CB40();
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
  unint64_t v3 = sub_10000E238(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10001CCA0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_10001CD80();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_10001CD30();
  __break(1u);
  return result;
}

void *sub_10000E238(uint64_t a1, uint64_t a2)
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
  sub_100005764(&qword_100034C80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000E2A0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005764(&qword_100034C80);
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
    sub_10000E450(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000E378(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10000E378(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10001CD80();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10000E450(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_10001CD80();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_10000E4E0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E540(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_10000E500(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E62C(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_10000E520(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E710(a1, a2, a3, *v3);
  uint64_t *v3 = (uint64_t)result;
  return result;
}

char *sub_10000E540(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005764(&qword_100034CA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000D7B8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000D97C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_10000E62C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005764(&qword_100034CB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000D854(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000DA60(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_10000E710(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005764(&qword_100034C58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000D8E8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000DB3C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

unint64_t sub_10000E7F4(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_10000E818(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_100005764(&qword_100034CA8);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      v8[3] = (2 * ((uint64_t)(v9 - 32) / 8)) | 1;
    }
    if (v4 != a3)
    {
      sub_10000DC1C(a2 + 8 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_10000E8DC(uint64_t result, int64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = result;
  int64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v10 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v10) {
      int64_t v12 = v6 + v9;
    }
    else {
      int64_t v12 = v6;
    }
    uint64_t result = (uint64_t)sub_10000D3F0((char *)result, v12, 1, v5);
    uint64_t v5 = result;
  }
  uint64_t v13 = v5 + 32 + 8 * v7;
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v14 = *(void *)(v5 + 16);
  if (__OFSUB__(v14, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_10000D854((char *)(v5 + 32 + 8 * a2), v14 - a2, (char *)(v13 + 8));
  uint64_t v15 = *(void *)(v5 + 16);
  BOOL v16 = __OFADD__(v15, v9);
  uint64_t v17 = v15 + v9;
  if (!v16)
  {
    *(void *)(v5 + 16) = v17;
LABEL_16:
    *(void *)uint64_t v13 = a3;
    uint64_t *v3 = v5;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_10000E9D4(uint64_t result)
{
  uint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  uint64_t v5 = (v3 >> 1) - v4;
  if (__OFSUB__(v3 >> 1, v4))
  {
    __break(1u);
LABEL_11:
    return sub_10000EAD0(v1);
  }
  NSString v1 = (void *)result;
  if (v3)
  {
    uint64_t v6 = v2[1];
    sub_10001CDA0();
    swift_unknownObjectRetain();
    uint64_t v7 = (void *)swift_dynamicCastClass();
    if (!v7)
    {
      swift_unknownObjectRelease();
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
    uint64_t v8 = v7[2];
    if ((void *)(v6 + 8 * v4 + 8 * v5) == &v7[v8 + 4])
    {
      unint64_t v9 = v7[3];
      uint64_t result = swift_release();
      uint64_t v10 = (v9 >> 1) - v8;
      BOOL v11 = __OFADD__(v5, v10);
      v5 += v10;
      if (v11)
      {
        __break(1u);
        return result;
      }
    }
    else
    {
      uint64_t result = swift_release();
    }
  }
  if (v5 < (uint64_t)v1 + 1) {
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_10000EAD0(void *a1)
{
  uint64_t v3 = (uint64_t)a1 + 1;
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v6 = v1[2];
  unint64_t v7 = v1[3];
  swift_unknownObjectRetain();
  uint64_t v8 = sub_10000EC44(a1, v3, v4, v5, v6, v7);
  swift_unknownObjectRelease();
  BOOL v11 = v8;
  unint64_t v9 = (void (*)(uint64_t, uint64_t))sub_10000EE44();
  sub_10000EE60((uint64_t *)&v11, (uint64_t)a1, 0, v9);
  swift_release();
  return swift_release();
}

void *sub_10000EB8C(void *result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = v3 >> 1;
  BOOL v5 = __OFSUB__(v3 >> 1, v2);
  uint64_t v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v7 = (char *)result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7) {
    return result;
  }
  sub_10001CDA0();
  swift_unknownObjectRetain();
  uint64_t result = (void *)swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    uint64_t result = &_swiftEmptyArrayStorage;
  }
  uint64_t v8 = result[2];
  BOOL v5 = __OFADD__(v8, v7);
  unint64_t v9 = &v7[v8];
  if (v5) {
    goto LABEL_13;
  }
  result[2] = v9;
  uint64_t result = (void *)swift_release();
  uint64_t v10 = &v7[v4];
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (((unint64_t)v10 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(void *)(v1 + 24) = v3 & 1 | (2 * (void)v10);
  return result;
}

void *sub_10000EC44(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_32:
    if (v8 >= v7) {
      goto LABEL_21;
    }
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v7 = a2;
  uint64_t v6 = (uint64_t)result;
  if ((a6 & 1) == 0) {
    goto LABEL_32;
  }
  sub_10001CDA0();
  swift_unknownObjectRetain();
  BOOL v11 = (void *)swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    BOOL v11 = &_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v11[2];
  uint64_t v13 = a4 + 8 * a5 + 8 * v8;
  if ((void *)v13 == &v11[v12 + 4])
  {
    unint64_t v15 = v11[3];
    uint64_t result = (void *)swift_release();
    uint64_t v16 = (v15 >> 1) - v12;
    uint64_t v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    swift_release();
    uint64_t v14 = v8;
  }
  swift_unknownObjectRetain();
  uint64_t v17 = (void *)swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      uint64_t v17 = &_swiftEmptyArrayStorage;
    }
    uint64_t v18 = v17[2];
    if ((void *)v13 == &v17[v18 + 4])
    {
      unint64_t v20 = v17[3];
      uint64_t result = (void *)swift_release();
      uint64_t v21 = (v20 >> 1) - v18;
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t result = (void *)swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    uint64_t v17 = &_swiftEmptyArrayStorage;
  }
  uint64_t v19 = v17[2];
  if ((void *)v13 == &v17[v19 + 4])
  {
    unint64_t v23 = v17[3];
    uint64_t result = (void *)swift_release();
    uint64_t v24 = (v23 >> 1) - v19;
    BOOL v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22) {
      goto LABEL_21;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = v8;
  }
  if (v25 <= v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = v25;
  }
  if (!v26) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005764(&qword_100034CB0);
  unint64_t v27 = (void *)swift_allocObject();
  size_t v28 = j__malloc_size(v27);
  v27[2] = v6;
  v27[3] = 2 * ((uint64_t)(v28 - 32) / 8);
  return v27;
}

uint64_t (*sub_10000EE44())(void, void)
{
  return nullsub_1;
}

void *sub_10000EE60(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = v4[2];
  uint64_t v7 = v4[3] >> 1;
  uint64_t result = (void *)(v7 - v6);
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v10 = *a1;
  uint64_t v11 = *(void *)(*a1 + 16);
  BOOL v29 = __OFSUB__(v11, a2);
  uint64_t v12 = v11 - a2;
  if (v29)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v15 = (char *)result - a2;
  if (__OFSUB__(result, a2))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BOOL v29 = __OFSUB__(v15, v14);
  uint64_t v16 = &v15[-v14];
  if (v29)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int64_t v36 = v16;
  uint64_t v17 = (char *)(v10 + 32);
  uint64_t v18 = v10 + 32 + 8 * a2;
  uint64_t result = (void *)sub_10000F20C(result);
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v35 = v10;
    uint64_t v20 = v4[2];
    uint64_t v21 = (char *)(v4[1] + 8 * v20);
    BOOL v22 = &v21[8 * a2];
    sub_10000D854(v21, a2, v17);
    a4(v18, a3);
    unint64_t v23 = &v22[8 * (void)v36];
    uint64_t v10 = v35;
    sub_10000D854(v23, v14, (char *)(v18 + 8 * a3));
    v19[2] = 0;
    swift_release();
LABEL_15:
    swift_retain();
    swift_unknownObjectRelease();
    uint64_t result = (void *)sub_10000F1C4(v10, v20);
    *unint64_t v4 = result;
    v4[1] = v32;
    v4[2] = v33;
    v4[3] = v34;
    return result;
  }
  uint64_t v24 = (void *)(v18 + 8 * a3);
  uint64_t v20 = v4[2];
  uint64_t v25 = v20 + a2;
  if (__OFADD__(v20, a2)) {
    goto LABEL_21;
  }
  if (v25 < v20)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (__OFSUB__(v25, v20))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v26 = v4[1];
  memcpy((void *)(v10 + 32), (const void *)(v26 + 8 * v20), 8 * a2);
  uint64_t result = (void *)((uint64_t (*)(char *, uint64_t))a4)(&v17[8 * a2], a3);
  unint64_t v27 = &v36[v25];
  if (__OFADD__(v25, v36))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  size_t v28 = (char *)(v4[3] >> 1);
  BOOL v29 = __OFSUB__(v28, v27);
  BOOL v30 = (uint64_t)v28 < (uint64_t)v27;
  uint64_t v31 = v28 - v27;
  if (v30)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!v29)
  {
    memcpy(v24, (const void *)(v26 + 8 * (void)v27), 8 * v31);
    goto LABEL_15;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_10000F028(void *a1)
{
  id v2 = [a1 localizedDescription];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_10001CB10();

  return v3;
}

uint64_t sub_10000F098(void *a1)
{
  id v1 = [a1 localizedDescription];
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = sub_10001CB10();

  return v3;
}

uint64_t sub_10000F0FC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10000F178(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_10000F1C4(uint64_t result, uint64_t a2)
{
  if (__OFSUB__(0, a2))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(result + 16);
  BOOL v3 = __OFADD__(a2, v2);
  uint64_t v4 = a2 + v2;
  if (v3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < a2)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0) {
LABEL_9:
  }
    __break(1u);
  return result;
}

uint64_t sub_10000F20C(void *a1)
{
  char isUniquelyReferenced_nonNull = (char *)swift_isUniquelyReferenced_nonNull();
  if (!isUniquelyReferenced_nonNull) {
    return 0;
  }
  uint64_t v6 = v1[2];
  unint64_t v5 = v1[3];
  uint64_t v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = v1[1];
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  sub_10001CDA0();
  swift_unknownObjectRetain();
  unint64_t v9 = (void *)swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    unint64_t v9 = &_swiftEmptyArrayStorage;
  }
  uint64_t v10 = v9[2];
  if ((void *)(v8 + 8 * v6 + 8 * v7) != &v9[v10 + 4])
  {
    swift_release();
LABEL_8:
    uint64_t v11 = v7;
    goto LABEL_10;
  }
  unint64_t v12 = v9[3];
  uint64_t result = swift_release();
  uint64_t v14 = (v12 >> 1) - v10;
  BOOL v15 = __OFADD__(v7, v14);
  uint64_t v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < (uint64_t)a1) {
      return 0;
    }
    sub_10001CDA0();
    swift_unknownObjectRetain();
    a1 = (void *)swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = &_swiftEmptyArrayStorage;
    }
    uint64_t v16 = (v8 + 8 * v6 - (uint64_t)a1 - 32) / 8;
    char isUniquelyReferenced_nonNull = (char *)(v7 + v16);
    if (!__OFADD__(v7, v16))
    {
      uint64_t v4 = a1[2];
      if ((uint64_t)isUniquelyReferenced_nonNull >= v4) {
        return (uint64_t)a1;
      }
LABEL_19:
      sub_10000F378(isUniquelyReferenced_nonNull, v4, 0);
      return (uint64_t)a1;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

char *sub_10000F378(char *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 - (void)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = a3 - v4;
  if (__OFSUB__(a3, v4))
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(v7 + 16);
  BOOL v9 = __OFSUB__(v8, a2);
  uint64_t v10 = v8 - a2;
  if (v9) {
    goto LABEL_11;
  }
  uint64_t result = sub_10000D854((char *)(v7 + 32 + 8 * a2), v10, (char *)(v7 + 32 + 8 * (void)result + 8 * a3));
  uint64_t v11 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v11, v6);
  uint64_t v12 = v11 + v6;
  if (v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(void *)(v7 + 16) = v12;
LABEL_7:
  if (a3 > 0) {
LABEL_13:
  }
    __break(1u);
  return result;
}

void sub_10000F408(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  sub_10001CDC0(v3);
  if (v3)
  {
    uint64_t v4 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_10001CB20();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
  }
}

uint64_t sub_10000F484(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000F4D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10000F530()
{
  return &protocol witness table for Int;
}

unint64_t sub_10000F540()
{
  unint64_t result = qword_100034CC0;
  if (!qword_100034CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100034CC0);
  }
  return result;
}

uint64_t sub_10000F590(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_10000F5CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000F5DC()
{
  return swift_release();
}

uint64_t sub_10000F5E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009E80();
  *a1 = result;
  return result;
}

uint64_t sub_10000F614()
{
  return sub_100009FC0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_10000F630()
{
  unint64_t result = qword_100034D60;
  if (!qword_100034D60)
  {
    type metadata accessor for WidgetConfigurationParameterDataSource();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034D60);
  }
  return result;
}

uint64_t sub_10000F680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009DD8();
  *a1 = result;
  return result;
}

uint64_t sub_10000F6B0()
{
  return sub_100009E38(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000F6E8(uint64_t a1)
{
  *(void *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F6F8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F710()
{
  return type metadata accessor for DispatchPredicate(0);
}

uint64_t sub_10000F750()
{
  return swift_bridgeObjectRelease();
}

void sub_10000F774(Swift::Int a1)
{
  sub_10001CCB0(a1);
}

uint64_t sub_10000F7AC()
{
  return swift_slowDealloc();
}

uint64_t sub_10000F7D0()
{
  return v0;
}

uint64_t sub_10000F804()
{
  return sub_10001CD60();
}

uint64_t sub_10000F824()
{
  return v0;
}

uint64_t sub_10000F83C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t WidgetConfigurationCardHeaderView.init(icon:title:subtitle:dismiss:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t WidgetConfigurationCardHeaderView.body.getter@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v21 = sub_100006044(&qword_100034D70);
  BOOL v22 = &type metadata for Spacer;
  uint64_t v23 = sub_100006044(qword_100034D78);
  uint64_t v24 = &type metadata for Spacer;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v25 = sub_10001CC50();
  sub_100010A58();
  sub_10001CA90();
  swift_getWitnessTable();
  uint64_t v6 = sub_10001C9F0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v17[-v11];
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v18 = v5;
  uint64_t v19 = v13;
  uint64_t v20 = v2;
  sub_10001C780();
  sub_10001C9E0();
  swift_getWitnessTable();
  uint64_t v14 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
  v14(v12, v10, v6);
  BOOL v15 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  v14(a2, v12, v6);
  return ((uint64_t (*)(unsigned char *, uint64_t))v15)(v12, v6);
}

uint64_t sub_10000FAA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v47 = a4;
  uint64_t v7 = sub_10001CC50();
  uint64_t v51 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v44 = (char *)&WitnessTable - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v45 = (char *)&WitnessTable - v10;
  uint64_t v46 = sub_100005764(qword_100034D78);
  uint64_t v11 = __chkstk_darwin(v46);
  uint64_t v50 = (uint64_t)&WitnessTable - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&WitnessTable - v13;
  uint64_t v43 = sub_100005764(&qword_100034D70);
  uint64_t v49 = *(void *)(v43 - 8);
  uint64_t v15 = __chkstk_darwin(v43);
  uint64_t v48 = (char *)&WitnessTable - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&WitnessTable - v17;
  long long v42 = *(void (**)(uint64_t))a1;
  long long v64 = *(_OWORD *)(a1 + 16);
  sub_100010888(a1 + 32, (uint64_t)v63);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  uint64_t v20 = a3;
  long long v21 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v19 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v19 + 48) = v21;
  long long v22 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v19 + 64) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v19 + 80) = v22;
  swift_retain();
  sub_100009078((uint64_t)&v64);
  sub_100009078((uint64_t)v63);
  swift_retain();
  uint64_t v23 = v18;
  uint64_t v41 = v18;
  sub_10001C9D0();
  uint64_t v24 = (uint64_t)v14;
  *(void *)uint64_t v14 = sub_10001C7A0();
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  uint64_t v25 = sub_100005764(&qword_100034E00);
  uint64_t v26 = sub_1000100E0(a1, &v14[*(int *)(v25 + 44)]);
  unint64_t v27 = v44;
  v42(v26);
  v62[5] = v20;
  uint64_t v28 = v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v29 = v51;
  BOOL v30 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  uint64_t v31 = v45;
  v30(v45, v27, v7);
  uint64_t v32 = *(void (**)(uint64_t))(v29 + 8);
  uint64_t v51 = v29 + 8;
  long long v42 = v32;
  uint64_t v33 = v27;
  ((void (*)(char *, uint64_t))v32)(v27, v28);
  uint64_t v34 = v48;
  uint64_t v35 = v43;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v48, v23, v43);
  uint64_t v60 = 0;
  char v61 = 1;
  v62[0] = v34;
  v62[1] = &v60;
  uint64_t v36 = v50;
  sub_100010968(v24, v50, qword_100034D78);
  uint64_t v58 = 0;
  char v59 = 1;
  v62[2] = v36;
  void v62[3] = &v58;
  v30(v33, v31, v28);
  v62[4] = v33;
  v57[0] = v35;
  v57[1] = &type metadata for Spacer;
  v57[2] = v46;
  v57[3] = &type metadata for Spacer;
  v57[4] = v28;
  uint64_t v52 = sub_1000092FC(&qword_100034E08, &qword_100034D70);
  uint64_t v53 = &protocol witness table for Spacer;
  uint64_t v54 = sub_1000092FC(&qword_100034E10, qword_100034D78);
  unint64_t v55 = &protocol witness table for Spacer;
  uint64_t v56 = WitnessTable;
  sub_100010ACC((uint64_t)v62, 5, (uint64_t)v57);
  uint64_t v37 = (void (*)(char *, uint64_t))v42;
  ((void (*)(char *, uint64_t))v42)(v31, v28);
  sub_1000109CC(v24, qword_100034D78);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v49 + 8);
  v38(v41, v35);
  v37(v33, v28);
  sub_1000109CC(v50, qword_100034D78);
  return ((uint64_t (*)(char *, uint64_t))v38)(v48, v35);
}

uint64_t sub_100010058@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FAA8(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_100010064()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000100A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001C990();
  *a1 = result;
  return result;
}

uint64_t sub_1000100E0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_100005764(&qword_100034E18);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v44 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v41 = (char *)&v41 - v6;
  uint64_t v7 = sub_100005764(&qword_100034A10);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  long long v42 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v41 - v11;
  swift_bridgeObjectRetain();
  sub_10001C840();
  uint64_t v13 = sub_10001C880();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = v12;
  swift_release();
  uint64_t v45 = v13;
  uint64_t v46 = v15;
  char v47 = v17 & 1;
  uint64_t v48 = v19;
  sub_10001C8C0();
  sub_100008958(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    id v21 = objc_allocWithZone((Class)UIFontMetrics);
    swift_bridgeObjectRetain();
    id v22 = [v21 initForTextStyle:UIFontTextStyleCaption1];
    id v23 = [self preferredFontForTextStyle:UIFontTextStyleCaption1];
    id v24 = [v22 scaledFontForFont:v23 maximumPointSize:32.0];

    sub_10001C850();
    uint64_t v25 = sub_10001C880();
    uint64_t v27 = v26;
    char v29 = v28;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v45 = v25;
    uint64_t v46 = v27;
    char v47 = v29 & 1;
    uint64_t v48 = v31;
    uint64_t v32 = (uint64_t)v41;
    sub_10001C8C0();
    sub_100008958(v25, v27, v29 & 1);
    swift_bridgeObjectRelease();
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = 1;
    uint64_t v32 = (uint64_t)v41;
  }
  sub_1000057A8(v32, v33, 1, v7);
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v35 = v42;
  v34(v42, v20, v7);
  uint64_t v36 = v44;
  sub_100010968(v32, v44, &qword_100034E18);
  uint64_t v37 = v43;
  v34(v43, v35, v7);
  uint64_t v38 = sub_100005764(&qword_100034E20);
  sub_100010968(v36, (uint64_t)&v37[*(int *)(v38 + 48)], &qword_100034E18);
  sub_1000109CC(v32, &qword_100034E18);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v8 + 8);
  v39(v20, v7);
  sub_1000109CC(v36, &qword_100034E18);
  return ((uint64_t (*)(char *, uint64_t))v39)(v35, v7);
}

uint64_t sub_1000104EC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return WidgetConfigurationCardHeaderView.body.getter(a1, a2);
}

uint64_t sub_100010528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_100010530()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10001057C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_1000105FC(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[7];
  a1[6] = a2[6];
  a1[7] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_10001069C(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000106B0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  swift_release();
  return a1;
}

uint64_t sub_100010720(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t sub_100010760(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for WidgetConfigurationCardHeaderView()
{
  return sub_100010A28();
}

uint64_t sub_1000107C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_100010888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005764(&qword_100034AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000108F0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_100010940()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_100010968(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005764(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000109CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005764(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010A28()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100010A58()
{
  return swift_getTupleTypeMetadata();
}

uint64_t sub_100010A78(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  uint64_t v3 = a1;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_100010ACC(uint64_t TupleTypeMetadata, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    __chkstk_darwin(TupleTypeMetadata);
    uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      uint64_t v9 = v5;
      uint64_t v10 = v8;
      uint64_t v11 = a2;
      do
      {
        uint64_t v12 = *v9++;
        *v10++ = v12;
        --v11;
      }
      while (v11);
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  __chkstk_darwin(TupleTypeMetadata);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v15 = (int *)(v6 + 32);
    uint64_t v16 = a2;
    do
    {
      if (a2 == 1) {
        int v17 = 0;
      }
      else {
        int v17 = *v15;
      }
      uint64_t v19 = *v5++;
      uint64_t v18 = v19;
      uint64_t v20 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 16))(&v14[v17], v20);
      v15 += 4;
      --v16;
    }
    while (v16);
  }
  return sub_10001CAA0();
}

id sub_100010C40(uint64_t a1, uint64_t a2, char a3)
{
  NSString v4 = sub_10001CB00();
  swift_bridgeObjectRelease();
  id v9 = 0;
  id v5 = [(id)swift_getObjCClassFromMetadata() bundleRecordWithBundleIdentifier:v4 allowPlaceholder:a3 & 1 error:&v9];

  if (v5)
  {
    id v6 = v9;
  }
  else
  {
    id v7 = v9;
    sub_10001C610();

    swift_willThrow();
  }
  return v5;
}

uint64_t WidgetConfigurationCardView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  sub_100006044(&qword_100034E28);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v42 = *(void *)(a1 + 24);
  uint64_t v55 = v3;
  uint64_t v56 = v42;
  uint64_t v4 = v3;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  sub_100011EF4(OpaqueTypeMetadata2);
  v39[3] = sub_10001CA90();
  uint64_t v39[2] = swift_getWitnessTable();
  uint64_t v6 = sub_10001CA10();
  sub_10000F6CC();
  uint64_t v40 = v7;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v39 - v9;
  sub_10001C7D0();
  uint64_t v11 = sub_10001C700();
  sub_10000F6CC();
  uint64_t v46 = v12;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v39 - v14;
  uint64_t WitnessTable = swift_getWitnessTable();
  v39[1] = WitnessTable;
  unint64_t v17 = sub_1000111CC();
  uint64_t v53 = WitnessTable;
  unint64_t v54 = v17;
  uint64_t v18 = swift_getWitnessTable();
  uint64_t v55 = v11;
  uint64_t v56 = v18;
  uint64_t v41 = v18;
  uint64_t v19 = swift_getOpaqueTypeMetadata2();
  sub_10000F6CC();
  uint64_t v43 = v20;
  __chkstk_darwin(v21);
  id v23 = (char *)v39 - v22;
  uint64_t v24 = sub_10001C700();
  sub_10000F6CC();
  uint64_t v45 = v25;
  uint64_t v27 = __chkstk_darwin(v26);
  char v29 = (char *)v39 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)v39 - v30;
  uint64_t v48 = v4;
  uint64_t v49 = v42;
  uint64_t v32 = v44;
  uint64_t v50 = v44;
  sub_10001C7A0();
  sub_10001CA00();
  sub_1000117B4(17.0, 14.0, 17.0, 14.0);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v6);
  if (![*v32 widgetPrimaryColor]) {
    id v33 = [self systemGroupedBackgroundColor];
  }
  sub_10001C980();
  uint64_t v34 = v41;
  sub_10001C8E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v11);
  uint64_t v55 = v11;
  uint64_t v56 = v34;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_10001C800();
  sub_10001C950();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v23, v19);
  uint64_t v51 = OpaqueTypeConformance2;
  uint64_t v52 = &protocol witness table for _PaddingLayout;
  uint64_t v36 = swift_getWitnessTable();
  sub_10000F838(v29, v24, v36);
  uint64_t v37 = *(void (**)(char *, uint64_t))(v45 + 8);
  v37(v29, v24);
  sub_10000F838(v31, v24, v36);
  return ((uint64_t (*)(char *, uint64_t))v37)(v31, v24);
}

unint64_t sub_1000111CC()
{
  unint64_t result = qword_100034E30[0];
  if (!qword_100034E30[0])
  {
    sub_10001C7D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100034E30);
  }
  return result;
}

uint64_t sub_10001121C@<X0>(uint64_t a1@<X0>, void (*a2)(void *a1@<X8>)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v50 = a3;
  uint64_t v49 = *((void *)a2 - 1);
  __chkstk_darwin(a1);
  uint64_t v45 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v6;
  uint64_t v56 = v7;
  uint64_t v8 = v7;
  uint64_t v41 = v7;
  uint64_t v47 = &opaque type descriptor for <<opaque return type of View.scrollContentBackground(_:)>>;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v48 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v10 = __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v42 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v44 = (char *)&v37 - v12;
  uint64_t v46 = sub_100005764(&qword_100034E28);
  uint64_t v51 = *(void *)(v46 - 8);
  uint64_t v13 = __chkstk_darwin(v46);
  uint64_t v43 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v38 = (char *)&v37 - v15;
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = a2;
  *((void *)v16 + 3) = v8;
  memcpy(v16 + 32, (const void *)a1, 0x48uLL);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v55 = (char *)sub_100011E2C;
  uint64_t v56 = v16;
  uint64_t v57 = v17;
  uint64_t v58 = v18;
  uint64_t v59 = v19;
  uint64_t v60 = v20;
  uint64_t v61 = v21;
  uint64_t v62 = v22;
  sub_100011E38((void **)a1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_100005764(&qword_100034EB8);
  unint64_t v40 = sub_100011EA0();
  sub_10001C940();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = swift_release();
  uint64_t v24 = v45;
  (*(void (**)(uint64_t))(a1 + 40))(v23);
  uint64_t v25 = v42;
  uint64_t v26 = v41;
  sub_10001C930();
  (*(void (**)(char *, void (*)(void *@<X8>)))(v49 + 8))(v24, a2);
  uint64_t v55 = (char *)a2;
  uint64_t v56 = v26;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v28 = v44;
  sub_10000F838(v25, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v29 = v48;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v31 = OpaqueTypeMetadata2;
  v30(v25, OpaqueTypeMetadata2);
  uint64_t v32 = v43;
  id v33 = v38;
  uint64_t v34 = v46;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v43, v38, v46);
  uint64_t v55 = v32;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v25, v28, v31);
  uint64_t v56 = v25;
  v54[0] = v34;
  v54[1] = v31;
  uint64_t v52 = v39;
  unint64_t v53 = v40;
  uint64_t v52 = swift_getOpaqueTypeConformance2();
  unint64_t v53 = OpaqueTypeConformance2;
  sub_100010ACC((uint64_t)&v55, 2, (uint64_t)v54);
  v30(v28, v31);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v51 + 8);
  v35(v33, v34);
  v30(v25, v31);
  return ((uint64_t (*)(char *, uint64_t))v35)(v32, v34);
}

uint64_t sub_1000116DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10001121C(*(void *)(v1 + 32), *(void (**)(void *@<X8>))(v1 + 16), a1);
}

void sub_1000116E8(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = [*a1 appBundleIdentifier];
  if (v3)
  {
    sub_10001CB10();

    uint64_t v4 = self;
    NSString v5 = sub_10001CB00();
    id v3 = [v4 applicationIconImageForBundleIdentifier:v5];
    swift_bridgeObjectRelease();

    if (v3)
    {
      id v6 = v3;
      id v3 = (id)sub_10001CC20();
    }
  }
  *a2 = v3;
}

uint64_t sub_1000117B4(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = sub_10001C7D0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C800();
  *(double *)&v13[1] = a1;
  *(double *)&v13[2] = a2;
  *(double *)&v13[3] = a3;
  *(double *)&v13[4] = a4;
  char v14 = 0;
  sub_10001C7C0();
  sub_10001C960();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000118E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011924@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, v2, sizeof(__dst));
  return WidgetConfigurationCardView.body.getter(a1, a2);
}

uint64_t sub_100011978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_100011980(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_1000119D4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  long long v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v9;
  *(void *)(a1 + 64) = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100011A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_100011B0C(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t sub_100011B14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = v6;
  swift_release();
  return a1;
}

uint64_t sub_100011B94(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t sub_100011BD4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for WidgetConfigurationCardView()
{
  return sub_100010A28();
}

uint64_t sub_100011C3C()
{
  sub_100006044(&qword_100034E28);
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  sub_100011EF4(OpaqueTypeMetadata2);
  sub_10001CA90();
  swift_getWitnessTable();
  sub_10001CA10();
  sub_10001C7D0();
  sub_10001C700();
  swift_getWitnessTable();
  sub_1000111CC();
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  sub_10001C700();
  swift_getOpaqueTypeConformance2();
  return swift_getWitnessTable();
}

uint64_t sub_100011DD4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 104, 7);
}

void sub_100011E2C(void *a1@<X8>)
{
  sub_1000116E8((id *)(v1 + 32), a1);
}

void **sub_100011E38(void **a1)
{
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  return a1;
}

unint64_t sub_100011EA0()
{
  unint64_t result = qword_100034EC0;
  if (!qword_100034EC0)
  {
    sub_100006044(&qword_100034EB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100034EC0);
  }
  return result;
}

uint64_t sub_100011EF4(uint64_t a1)
{
  return _swift_getTupleTypeMetadata2(255, v1, a1, 0, 0);
}

uint64_t sub_100011F18()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100012744(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) scrollDividerView];
  [v2 setAlpha:v1];
}

void sub_1000135B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  [*(id *)(a1 + 32) preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) tableView];
  [v7 contentSize];
  double v9 = v8;
  double v11 = v10;

  if (v4 != v9 || v6 != v11)
  {
    id v13 = [*(id *)(a1 + 32) tableView];
    [v13 contentSize];
    objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  }
}

BOOL sub_100013850(id a1, LNEffectiveBundleIdentifier *a2)
{
  return [(LNEffectiveBundleIdentifier *)a2 type] == (id)1;
}

void sub_100013908(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() & 1;
    if (v10) {
      double v11 = v7;
    }
    else {
      double v11 = 0;
    }
    id v12 = v11;
    if (v10)
    {
      id v13 = [*(id *)(a1 + 32) intentIdentifier];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100013B58;
      v17[3] = &unk_10002D3B0;
      id v18 = *(id *)(a1 + 40);
      [v7 generatePopulatedIntentWithIdentifier:v13 fromInput:0 processedParameters:v8 completion:v17];
    }
    else
    {
      uint64_t v16 = getWFWidgetConfigurationLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = "-[WFWidgetConfigurationParametersViewController populateConfiguredCustomIntentWithCompletion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s Invalid Intent Action", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    char v14 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v9 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[WFWidgetConfigurationParametersViewController populateConfiguredCustomIntentWithCompletion:]_block_invoke";
      __int16 v21 = 2114;
      uint64_t v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Unable to process parameters. %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100013B58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    double v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v7 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v5 localizedDescription];
      int v9 = 136315394;
      int v10 = "-[WFWidgetConfigurationParametersViewController populateConfiguredCustomIntentWithCompletion:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unable to generate populated intent. %{public}@", (uint8_t *)&v9, 0x16u);
    }
    double v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

BOOL sub_100014B34(id a1, LNEffectiveBundleIdentifier *a2)
{
  return [(LNEffectiveBundleIdentifier *)a2 type] == (id)1;
}

void sub_100014C28(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = *(void **)(a1 + 32);
    int v9 = [*(id *)(a1 + 40) intentIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014DC4;
    void v12[3] = &unk_10002D3B0;
    id v13 = *(id *)(a1 + 48);
    [v8 generatePopulatedIntentWithIdentifier:v9 fromInput:0 processedParameters:v6 completion:v12];
  }
  else
  {
    int v10 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[WFWidgetValuePickerViewController populateConfiguredCustomIntentWithAction:completion:]_block_invoke";
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Unable to process parameters. %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100014DC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v7 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v5 localizedDescription];
      int v9 = 136315394;
      int v10 = "-[WFWidgetValuePickerViewController populateConfiguredCustomIntentWithAction:completion:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Unable to generate populated intent. %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

BOOL sub_100015528(id a1, LNEffectiveBundleIdentifier *a2)
{
  return [(LNEffectiveBundleIdentifier *)a2 type] == (id)1;
}

double sub_1000159A4()
{
  uint64_t v0 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleFootnote];
  [v0 scaledValueForValue:2.0];
  double v2 = ceil(v1);

  return v2;
}

void sub_100016658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t sub_100016694(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [a2 key];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

BOOL sub_1000166DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 allowsMultipleValues]
    && ([v3 displaysMultipleValueEditor] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else if ([*(id *)(a1 + 32) showsParameterDescription])
  {
    id v5 = [v3 localizedDescription];
    BOOL v4 = [v5 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_100016764(uint64_t a1, unint64_t a2)
{
  if (a2 > *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v4 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:");
    id v5 = [*(id *)(a1 + 32) objectsAtIndexes:v4];
    id v6 = [WFDataConfigurationParametersSection alloc];
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v7 = -[WFDataConfigurationParametersSection initWithParameters:sectionIndex:](v6, "initWithParameters:sectionIndex:", v5);
    [*(id *)(a1 + 40) addObject:v7];
  }
  id v8 = [WFDataConfigurationParametersSection alloc];
  int v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v12 = v9;
  int v10 = +[NSArray arrayWithObjects:&v12 count:1];
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  __int16 v11 = -[WFDataConfigurationParametersSection initWithParameters:sectionIndex:](v8, "initWithParameters:sectionIndex:", v10);

  [*(id *)(a1 + 40) addObject:v11];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 + 1;
}

void sub_1000168D8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  int v9 = a2;
  id v4 = a2;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v5, v9);

  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 parameters];
  id v8 = [v7 valueForKey:@"key"];
  [v6 appendItemsWithIdentifiers:v8];
}

NSString *__cdecl sub_1000169B4(id a1, WFFocusConfigurationButton *a2, unint64_t a3)
{
  id v3 = [(WFFocusConfigurationButton *)a2 identifier];
  id v4 = [@"_footerButton_" stringByAppendingString:v3];

  return (NSString *)v4;
}

NSArray *__cdecl sub_100016A84(id a1, id a2, NSArray *a3)
{
  id v3 = a3;
  return v3;
}

BOOL sub_100016AAC(id a1, id a2, NSExtension *a3)
{
  return 1;
}

NSArray *__cdecl sub_100016AB4(id a1, id a2, NSArray *a3)
{
  id v3 = a3;
  return v3;
}

BOOL sub_100016ADC(id a1, id a2, NSExtension *a3)
{
  return 1;
}

BOOL sub_100016B3C(id a1, WFParameter *a2)
{
  double v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(WFParameter *)v2 key],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqualToString:WFHandleIntentActionShowWhenRunKey],
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(WFParameter *)v2 key];
    if ([v6 isEqualToString:WFLinkActionShowWhenRunKey])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v7 = [(WFParameter *)v2 key];
      unsigned int v5 = [v7 isEqualToString:WFLinkActionOpenWhenRunKey] ^ 1;
    }
  }

  return v5;
}

void sub_1000179E4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)WFAppLaunchRequest) initWithURL:*(void *)(a1 + 32) error:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100017A90;
  v3[3] = &unk_10002D6B8;
  id v4 = *(id *)(a1 + 32);
  [v2 performWithCompletionHandler:v3];
}

void sub_100017A90(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      int v9 = "-[WFWidgetConfigurationAttributionView textView:shouldInteractWithURL:inRange:interaction:]_block_invoke_2";
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Unable to open an attribution URL (%{public}@) with error: %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

void sub_1000182C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000182F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018300(uint64_t a1)
{
}

void sub_100018308(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [a2 image];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a5 = 1;
  }
}

void sub_10001838C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v13 = v7;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      objc_msgSend(v8, "addAttribute:value:range:", NSLinkAttributeName, v13, 0, objc_msgSend(v8, "length"));
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    else
    {
      uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }

    id v7 = v13;
  }
}

void sub_1000187D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void *sub_1000187F4(void *a1)
{
  v5[0] = 0;
  if (!qword_100035818)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = (void *)3221225472;
    v5[3] = sub_100018C4C;
    v5[4] = &unk_10002D718;
    v5[5] = v5;
    long long v6 = off_10002D700;
    uint64_t v7 = 0;
    qword_100035818 = _sl_dlopen();
  }
  id v2 = (void *)qword_100035818;
  if (!qword_100035818)
  {
    a1 = +[NSAssertionHandler currentHandler];
    id v2 = +[NSString stringWithUTF8String:"void *StocksUILibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFWidgetConfigurationAttributionView.m", 21, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  unint64_t result = dlsym(v2, "StocksAttributionString");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  off_100035810 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_100018978(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [a2 image];

  if (v9)
  {
    id v10 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", NSAttachmentAttributeName, v10, a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", NSBaselineOffsetAttributeName, a3, a4);
    *a5 = 1;
  }
}

void *sub_100018A54(void *a1)
{
  v5[0] = 0;
  if (!qword_100035828)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = (void *)3221225472;
    v5[3] = sub_100018BD8;
    v5[4] = &unk_10002D718;
    v5[5] = v5;
    long long v6 = off_10002D738;
    uint64_t v7 = 0;
    qword_100035828 = _sl_dlopen();
  }
  id v2 = (void *)qword_100035828;
  if (!qword_100035828)
  {
    a1 = +[NSAssertionHandler currentHandler];
    id v2 = +[NSString stringWithUTF8String:"void *WeatherLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFWidgetConfigurationAttributionView.m", 24, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  unint64_t result = dlsym(v2, "WAAttributionString");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  off_100035820 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_100018BD8()
{
  uint64_t result = _sl_dlopen();
  qword_100035828 = result;
  return result;
}

uint64_t sub_100018C4C()
{
  uint64_t result = _sl_dlopen();
  qword_100035818 = result;
  return result;
}

void sub_1000195CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000195F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v9 hasPrefix:@"_footerButton_"])
  {
    uint64_t v11 = [v9 substringFromIndex:objc_msgSend(@"_footerButton_", "length")];
    uint64_t v12 = [WeakRetained footerButtons];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000198F8;
    v27[3] = &unk_10002D7D0;
    id v13 = v11;
    id v28 = v13;
    char v14 = objc_msgSend(v12, "if_firstObjectPassingTest:", v27);

    uint64_t v15 = [v7 dequeueReusableCellWithIdentifier:@"ButtonCell" forIndexPath:v8];
    __int16 v16 = +[UIListContentConfiguration cellConfiguration];
    uint64_t v17 = [v14 localizedTitle];
    [v16 setText:v17];

    if ([v14 isDestructive]) {
      +[UIColor systemRedColor];
    }
    else {
    uint64_t v24 = +[UIColor tintColor];
    }
    uint64_t v25 = [v16 textProperties];
    [v25 setColor:v24];

    [v15 setContentConfiguration:v16];
  }
  else
  {
    id v18 = v9;
    uint64_t v15 = [v7 dequeueReusableCellWithIdentifier:@"ParameterEditorHostingCell" forIndexPath:v8];
    [v15 setContainingViewController:WeakRetained];
    [v15 setDelegate:WeakRetained];
    uint64_t v19 = [WeakRetained action];
    id v13 = [v19 parameterForKey:v18];

    uint64_t v20 = [WeakRetained action];
    __int16 v21 = [v20 parameterStateForKey:v18 fallingBackToDefaultValue:1];

    id v22 = objc_msgSend(objc_alloc((Class)WFParameterEditorModel), "initWithParameter:state:widgetFamily:", v13, v21, objc_msgSend(WeakRetained, "widgetFamily"));
    [v15 updateModel:v22];

    [v15 layoutIfNeeded];
    uint64_t v23 = [WeakRetained action];
    [WeakRetained configureCell:v15 forAction:v23 parameter:v13];
  }
  return v15;
}

id sub_1000198F8(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100019B14(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  double v3 = v2;
  double v5 = v4;
  long long v6 = [*(id *)(a1 + 32) tableView];
  [v6 contentSize];
  double v8 = v7;
  double v10 = v9;

  if (v3 != v8 || v5 != v10)
  {
    id v12 = [*(id *)(a1 + 32) tableView];
    [v12 contentSize];
    objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  }
}

void sub_100019C90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  if (v6)
  {
    double v8 = [*(id *)(a1 + 32) action];
    (*(void (**)(uint64_t, void *, id, void))(v7 + 16))(v7, v8, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, uint64_t))(v7 + 16))(v7, 0, 0, a4);
  }
}

void sub_100019EA8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 addEventObserver:v3];
  double v4 = [v6 resourceManager];
  [v4 addTarget:*(void *)(a1 + 32) selector:"reloadActionParameterModels"];

  if (*(void *)(a1 + 40) == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v6 setEditingContext:v5];
}

id sub_100019F54(void *a1)
{
  id v1 = a1;
  double v2 = sub_100019FC0();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id sub_100019FC0()
{
  if (qword_100035838 != -1) {
    dispatch_once(&qword_100035838, &stru_10002D838);
  }
  uint64_t v0 = (void *)qword_100035830;
  return v0;
}

void sub_10001A014(id a1)
{
  memset(&v5, 0, sizeof(v5));
  if (dladdr(sub_100019FC0, &v5) && v5.dli_fname)
  {
    id v1 = [objc_alloc((Class)NSURL) initFileURLWithFileSystemRepresentation:v5.dli_fname isDirectory:0 relativeToURL:0];
    double v2 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    uint64_t v3 = +[NSBundle bundleWithURL:v2];
    double v4 = (void *)qword_100035830;
    qword_100035830 = v3;
  }
  else
  {
    id v1 = getWFGeneralLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "WFCurrentBundle_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s WFLocalizedString failed to locate current bundle", buf, 0xCu);
    }
  }
}

void sub_10001A38C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) hostViewControllerProxy];
    double v8 = INIntentWithTypedIntent();
    [v7 intentWasConfigured:v8];
  }
  else
  {
    id v9 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[WFWidgetConfigurationServiceViewController requestViewControllerDismissal]_block_invoke";
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unable to generate populated intent: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v7 = [*(id *)(a1 + 32) extensionContext];
    [v7 cancelRequestWithError:v6];
  }
}

uint64_t sub_10001A7D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A8B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) customIntentActionFromRequest:*(void *)(a1 + 40)];
  }
  id v5 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001AC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001AC84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001AC94(uint64_t a1)
{
}

uint64_t sub_10001AC9C(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setWidgetFamily:", objc_msgSend(*(id *)(a1 + 32), "family"));
  if (!*(void *)(a1 + 40))
  {
    double v2 = [*(id *)(a1 + 32) intent];
    id v3 = [v2 _asMigratedAppIntent];

    id v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v5 = [v3 serializedParameters];
    id v6 = [v4 copyWithSerializedParameters:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setWidgetFamily:", objc_msgSend(*(id *)(a1 + 32), "family"));
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forceUpdateParameterVisibility];
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v9();
}

void sub_10001BCA4(uint64_t a1, void *a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BD94;
  block[3] = &unk_10002D888;
  id v11 = a2;
  id v12 = a3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v15 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v8 = v12;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001BD94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = +[NSError errorWithDomain:@"WFWidgetConfigurationErrorDomain" code:1000 userInfo:0];
    }
    id v5 = v4;
    uint64_t v6 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v33 = 136315394;
      uint64_t v34 = "-[WFWidgetConfigurationServiceViewController startConfigurationWithRequest:completion:]_block_invoke_2";
      __int16 v35 = 2114;
      uint64_t v36 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error getting action from request: %{public}@", (uint8_t *)&v33, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(a1 + 48) setAction:v2];
  if ([*(id *)(a1 + 48) shouldShowShortcutPickerPresentation])
  {
    id v8 = [[WFSystemShortcutPickerModuleSummaryCoordinator alloc] initWithAction:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) setSystemShortcutPickerModuleSummaryCoordinator:v8];

    id v9 = *(void **)(a1 + 48);
    int v10 = [v9 systemShortcutPickerModuleSummaryCoordinator];
    [v10 setDelegate:v9];

    id v11 = [*(id *)(a1 + 48) systemShortcutPickerModuleSummaryCoordinator];
    id v12 = [v11 createViewController];
    [*(id *)(a1 + 48) setSystemShortcutPickerViewController:v12];

    uint64_t v13 = *(void **)(a1 + 48);
    id v14 = [v13 systemShortcutPickerViewController];
    [v13 setupChildViewController:v14];
  }
  else
  {
    uint64_t v15 = [*(id *)(a1 + 48) parameterConfigurationViewControllerForAction:*(void *)(a1 + 32) request:*(void *)(a1 + 56)];
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v15;

    if ([*(id *)(a1 + 56) resolvedWidgetConfigurationStyle] == (id)1
      && ([*(id *)(a1 + 48) parameterConfigurationViewController],
          id v18 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v18,
          (isKindOfClass & 1) != 0))
    {
      uint64_t v20 = [WFWidgetConfigurationContentViewController alloc];
      uint64_t v21 = *(void *)(a1 + 56);
      id v22 = [*(id *)(a1 + 48) parameterConfigurationViewController];
      uint64_t v23 = [(WFWidgetConfigurationContentViewController *)v20 initWithRequest:v21 parametersConfigurationViewController:v22];
    }
    else
    {
      uint64_t v23 = [*(id *)(a1 + 48) parameterConfigurationViewController];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v23];
      uint64_t v24 = [v14 navigationBar];
      [v24 setTranslucent:0];

      uint64_t v25 = [*(id *)(a1 + 48) request];
      uint64_t v26 = [v25 widgetPrimaryColor];
      uint64_t v27 = v26;
      if (!v26)
      {
        uint64_t v27 = +[UIColor wf_defaultWidgetConfigurationCardBackgroundColor];
      }
      id v28 = [v14 navigationBar];
      [v28 setBarTintColor:v27];

      if (!v26) {
    }
      }
    else
    {
      id v14 = v23;
    }
    uint64_t v29 = [[WFWidgetConfigurationServiceCardContainerViewController alloc] initWithRequest:*(void *)(a1 + 56) contentViewController:v14];
    [(WFWidgetConfigurationServiceCardContainerViewController *)v29 setContainerDelegate:*(void *)(a1 + 48)];
    [*(id *)(a1 + 48) setRootWidgetConfigurationViewController:v29];
    uint64_t v30 = *(void **)(a1 + 48);
    uint64_t v31 = [v30 rootWidgetConfigurationViewController];
    [v30 setupChildViewController:v31];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10001C20C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[WFWidgetConfigurationServiceViewController hostViewControllerProxy]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Connection interrupted to widget configuration host process: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) extensionContext];
  [v5 cancelRequestWithError:v3];
}

uint64_t sub_10001C600()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10001C610()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10001C620()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10001C630()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10001C640()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_10001C650()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_10001C660()
{
  return type metadata accessor for EditorPresentationEnvironment();
}

uint64_t sub_10001C670()
{
  return ParameterRowView.init(parameter:stateStore:processing:shouldFocus:layoutMode:isArrayElement:variableProvider:editorOptions:)();
}

uint64_t sub_10001C680()
{
  return type metadata accessor for ParameterRowView();
}

uint64_t sub_10001C690()
{
  return type metadata accessor for ParameterLayoutMode();
}

uint64_t sub_10001C6A0()
{
  return ParameterStateStore.__allocating_init(action:parameter:undoManager:)();
}

uint64_t sub_10001C6B0()
{
  return type metadata accessor for ParameterStateStore();
}

uint64_t sub_10001C6C0()
{
  return static WFLog.subscript.getter();
}

uint64_t sub_10001C6D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001C6E0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001C6F0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10001C700()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_10001C710()
{
  return EnvironmentValues.undoManager.getter();
}

uint64_t sub_10001C720()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10001C730()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10001C740()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10001C750()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10001C760()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10001C770()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10001C780()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10001C790()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10001C7A0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10001C7B0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_10001C7C0()
{
  return SafeAreaPaddingModifier.init(edges:insets:)();
}

uint64_t sub_10001C7D0()
{
  return type metadata accessor for SafeAreaPaddingModifier();
}

uint64_t sub_10001C7E0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10001C7F0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_10001C800()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10001C810()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10001C820()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10001C830()
{
  return static Font.caption.getter();
}

uint64_t sub_10001C840()
{
  return static Font.headline.getter();
}

uint64_t sub_10001C850()
{
  return Font.init(_:)();
}

uint64_t sub_10001C860()
{
  return List<>.init(content:)();
}

uint64_t sub_10001C870()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_10001C880()
{
  return Text.font(_:)();
}

uint64_t sub_10001C890()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10001C8A0()
{
  return View.allowsPickingVariables(_:)();
}

uint64_t sub_10001C8B0()
{
  return View.presentationEnvironment(_:)();
}

uint64_t sub_10001C8C0()
{
  return View.foregroundStyle(_:)();
}

uint64_t sub_10001C8D0()
{
  return View.listRowBackground(_:)();
}

uint64_t sub_10001C8E0()
{
  return View.cardBackgroundColor(_:)();
}

uint64_t sub_10001C8F0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10001C900()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10001C910()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10001C920()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_10001C930()
{
  return View.scrollContentBackground(_:)();
}

uint64_t sub_10001C940()
{
  return View.persistentSystemOverlays(_:)();
}

uint64_t sub_10001C950()
{
  return View.padding(_:_:)();
}

uint64_t sub_10001C960()
{
  return View.modifier<A>(_:)();
}

uint64_t sub_10001C970()
{
  return static Color.gray.getter();
}

uint64_t sub_10001C980()
{
  return Color.init(_:)();
}

uint64_t sub_10001C990()
{
  return Image.init(systemName:)();
}

uint64_t sub_10001C9A0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10001C9B0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10001C9C0()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_10001C9D0()
{
  return Button.init(action:label:)();
}

uint64_t sub_10001C9E0()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_10001C9F0()
{
  return type metadata accessor for HStack();
}

uint64_t sub_10001CA00()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_10001CA10()
{
  return type metadata accessor for VStack();
}

uint64_t sub_10001CA20()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_10001CA30()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10001CA40()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10001CA50()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_10001CA60()
{
  return Bindable.wrappedValue.getter();
}

uint64_t sub_10001CA70()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t sub_10001CA80()
{
  return type metadata accessor for Bindable();
}

uint64_t sub_10001CA90()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_10001CAA0()
{
  return TupleView.init(_:)();
}

uint64_t sub_10001CAC0()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary sub_10001CAD0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001CAE0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001CAF0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_10001CB00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001CB10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001CB20()
{
  return String.hash(into:)();
}

void sub_10001CB30(Swift::String a1)
{
}

Swift::Int sub_10001CB40()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001CB50()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001CB60()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10001CB70()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10001CB80()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10001CB90()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10001CBA0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10001CBB0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_10001CBC0()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_10001CBD0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_10001CBE0()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_10001CBF0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10001CC00()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10001CC10()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10001CC20()
{
  return WFImage.image.getter();
}

uint64_t sub_10001CC30()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10001CC50()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001CC60()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001CC70()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_10001CC80(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

void sub_10001CC90(Swift::Int a1)
{
}

uint64_t sub_10001CCA0()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_10001CCB0(Swift::Int a1)
{
}

uint64_t sub_10001CCC0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001CCD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001CCE0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10001CCF0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10001CD00()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10001CD10()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10001CD20()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10001CD30()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001CD40()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001CD50()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001CD60()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_10001CD70()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001CD80()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001CD90()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001CDA0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10001CDB0()
{
  return Hasher.init(_seed:)();
}

void sub_10001CDC0(Swift::UInt a1)
{
}

Swift::Int sub_10001CDD0()
{
  return Hasher._finalize()();
}

uint64_t sub_10001CDE0()
{
  return RangeSet.init(_orderedRanges:)();
}

uint64_t sub_10001CDF0()
{
  return RangeSet.ranges.getter();
}

uint64_t sub_10001CE00()
{
  return _typeName(_:qualified:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t INIntentWithTypedIntent()
{
  return _INIntentWithTypedIntent();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WFGetCustomIntentActionIdentifier()
{
  return _WFGetCustomIntentActionIdentifier();
}

uint64_t WFModuleSummaryEditorClassForParameterClass()
{
  return _WFModuleSummaryEditorClassForParameterClass();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

Method class_getClassMethod(Class cls, SEL name)
{
  return _class_getClassMethod(cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t getWFDialogLogObject()
{
  return _getWFDialogLogObject();
}

uint64_t getWFGeneralLogObject()
{
  return _getWFGeneralLogObject();
}

uint64_t getWFWidgetConfigurationLogObject()
{
  return _getWFWidgetConfigurationLogObject();
}

uint64_t getWFWidgetLogObject()
{
  return _getWFWidgetLogObject();
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
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

IMP method_setImplementation(Method m, IMP imp)
{
  return _method_setImplementation(m, imp);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return _swift_isUniquelyReferenced_nonNull();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__asMigratedAppIntent(void *a1, const char *a2, ...)
{
  return _[a1 _asMigratedAppIntent];
}

id objc_msgSend__attributionBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 _attributionBackgroundColor];
}

id objc_msgSend__attributionFont(void *a1, const char *a2, ...)
{
  return _[a1 _attributionFont];
}

id objc_msgSend__attributionTitleColor(void *a1, const char *a2, ...)
{
  return _[a1 _attributionTitleColor];
}

id objc_msgSend__className(void *a1, const char *a2, ...)
{
  return _[a1 _className];
}

id objc_msgSend__configureAttributedString(void *a1, const char *a2, ...)
{
  return _[a1 _configureAttributedString];
}

id objc_msgSend__paragraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 _paragraphStyle];
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__setExtensionBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setExtensionBundleId:");
}

id objc_msgSend__setInteractiveTextSelectionDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInteractiveTextSelectionDisabled:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__tableHeaderHeightDidChangeToHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tableHeaderHeightDidChangeToHeight:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addEventObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEventObserver:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:selector:");
}

id objc_msgSend_allowsMultipleValues(void *a1, const char *a2, ...)
{
  return _[a1 allowsMultipleValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 appBundleIdentifier];
}

id objc_msgSend_appIntentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 appIntentIdentifier];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendItemsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendItemsWithIdentifiers:");
}

id objc_msgSend_appendSectionsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendSectionsWithIdentifiers:");
}

id objc_msgSend_applyParametersFromAction_animatingDifferences_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyParametersFromAction:animatingDifferences:completion:");
}

id objc_msgSend_applyParametersFromAction_animatingDifferences_hiddenParameterKeys_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyParametersFromAction:animatingDifferences:hiddenParameterKeys:completion:");
}

id objc_msgSend_applyStylingWithStrokeProvider_fillProvider_cardBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyStylingWithStrokeProvider:fillProvider:cardBackgroundColor:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayMaxCountForWidgetFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayMaxCountForWidgetFamily:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributedSubstringFromRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedSubstringFromRange:");
}

id objc_msgSend_attributionViewForAppBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionViewForAppBundleIdentifier:");
}

id objc_msgSend_automaticallyUpdateView_withStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticallyUpdateView:withStyle:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_cancelRequestWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRequestWithError:");
}

id objc_msgSend_cardBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 cardBackgroundColor];
}

id objc_msgSend_cardView(void *a1, const char *a2, ...)
{
  return _[a1 cardView];
}

id objc_msgSend_cellConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 cellConfiguration];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configurableParameters(void *a1, const char *a2, ...)
{
  return _[a1 configurableParameters];
}

id objc_msgSend_configurationParametersViewControllerDidPressButton_buttonIdentifier_cellFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationParametersViewControllerDidPressButton:buttonIdentifier:cellFrame:");
}

id objc_msgSend_configurationParametersViewControllerDidRequestToClose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationParametersViewControllerDidRequestToClose:");
}

id objc_msgSend_configurationParametersViewControllerDidUpdateAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationParametersViewControllerDidUpdateAction:");
}

id objc_msgSend_configureCell_forAction_parameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:forAction:parameter:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsWithVisualFormat:options:metrics:views:");
}

id objc_msgSend_containsAttachmentsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsAttachmentsInRange:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentViewController];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithSerializedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithSerializedParameters:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createViewController(void *a1, const char *a2, ...)
{
  return _[a1 createViewController];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_customIntentActionFromRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customIntentActionFromRequest:");
}

id objc_msgSend_customIntentMigratedActionIdentifierWithLaunchId_className_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customIntentMigratedActionIdentifierWithLaunchId:className:");
}

id objc_msgSend_dataAttributionView(void *a1, const char *a2, ...)
{
  return _[a1 dataAttributionView];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_defaultCardSize(void *a1, const char *a2, ...)
{
  return _[a1 defaultCardSize];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 directionalLayoutMargins];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_displaysMultipleValueEditor(void *a1, const char *a2, ...)
{
  return _[a1 displaysMultipleValueEditor];
}

id objc_msgSend_effectiveBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBundleIdentifiers];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_extensionBundleId(void *a1, const char *a2, ...)
{
  return _[a1 extensionBundleId];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return _[a1 family];
}

id objc_msgSend_fillProvider(void *a1, const char *a2, ...)
{
  return _[a1 fillProvider];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_footerButtons(void *a1, const char *a2, ...)
{
  return _[a1 footerButtons];
}

id objc_msgSend_forceUpdateParameterVisibility(void *a1, const char *a2, ...)
{
  return _[a1 forceUpdateParameterVisibility];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fullyQualifiedLinkActionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 fullyQualifiedLinkActionIdentifier];
}

id objc_msgSend_generatePopulatedIntentWithIdentifier_fromInput_processedParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePopulatedIntentWithIdentifier:fromInput:processedParameters:completion:");
}

id objc_msgSend_getActionFromRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActionFromRequest:completion:");
}

id objc_msgSend_getLinkActionFromRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLinkActionFromRequest:completion:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_hiddenParameterKeys(void *a1, const char *a2, ...)
{
  return _[a1 hiddenParameterKeys];
}

id objc_msgSend_hostViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 hostViewControllerProxy];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_if_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_firstObjectPassingTest:");
}

id objc_msgSend_if_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_map:");
}

id objc_msgSend_if_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_objectsPassingTest:");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_indexesOfObjectsWithOptions_passingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsWithOptions:passingTest:");
}

id objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_initWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAction:");
}

id objc_msgSend_initWithAction_intentIdentifier_widgetFamily_widgetDisplayName_widgetDescription_widgetConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAction:intentIdentifier:widgetFamily:widgetDisplayName:widgetDescription:widgetConfigurationType:");
}

id objc_msgSend_initWithAction_parameter_intentIdentifier_widgetFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAction:parameter:intentIdentifier:widgetFamily:");
}

id objc_msgSend_initWithAppBundleIdentifier_appIntentIdentifier_serializedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:");
}

id objc_msgSend_initWithAppBundleIdentifier_intentType_sizeClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleIdentifier:intentType:sizeClass:");
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithButtons:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIdentifier_intent_className_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:intent:className:bundleIdentifier:");
}

id objc_msgSend_initWithLegacyWidgetAttributionAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLegacyWidgetAttributionAttributedString:");
}

id objc_msgSend_initWithParameter_arrayIndex_processing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameter:arrayIndex:processing:");
}

id objc_msgSend_initWithParameter_state_widgetFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameter:state:widgetFamily:");
}

id objc_msgSend_initWithParameterStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameterStates:");
}

id objc_msgSend_initWithParameters_sectionIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:sectionIndex:");
}

id objc_msgSend_initWithRequest_contentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:contentViewController:");
}

id objc_msgSend_initWithRequest_parametersConfigurationViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:parametersConfigurationViewController:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTableView_cellProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTableView:cellProvider:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithWidgetAttributionAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWidgetAttributionAttributedString:");
}

id objc_msgSend_initializeDatabase(void *a1, const char *a2, ...)
{
  return _[a1 initializeDatabase];
}

id objc_msgSend_initializeDatabaseIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 initializeDatabaseIfNeeded];
}

id objc_msgSend_initializeProcessWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeProcessWithDatabase:");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _[a1 intent];
}

id objc_msgSend_intentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 intentIdentifier];
}

id objc_msgSend_intentWasConfigured_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intentWasConfigured:");
}

id objc_msgSend_invalidateIntentDescriptionLabelMetrics(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntentDescriptionLabelMetrics];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return _[a1 isDestructive];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_itemIdentifierForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIdentifierForIndexPath:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_launchId(void *a1, const char *a2, ...)
{
  return _[a1 launchId];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_linkActionOrIntentActionFromRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkActionOrIntentActionFromRequest:completion:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return _[a1 localizedLabel];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_moduleSummarySlotForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleSummarySlotForState:");
}

id objc_msgSend_moduleSummarySlotsForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moduleSummarySlotsForState:");
}

id objc_msgSend_multipleStateClass(void *a1, const char *a2, ...)
{
  return _[a1 multipleStateClass];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_overrideUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 overrideUserInterfaceStyle];
}

id objc_msgSend_parameter(void *a1, const char *a2, ...)
{
  return _[a1 parameter];
}

id objc_msgSend_parameterConfigurationViewController(void *a1, const char *a2, ...)
{
  return _[a1 parameterConfigurationViewController];
}

id objc_msgSend_parameterConfigurationViewControllerForAction_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterConfigurationViewControllerForAction:request:");
}

id objc_msgSend_parameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterForKey:");
}

id objc_msgSend_parameterStateForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterStateForKey:");
}

id objc_msgSend_parameterStateForKey_fallingBackToDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterStateForKey:fallingBackToDefaultValue:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parametersConfigurationViewController(void *a1, const char *a2, ...)
{
  return _[a1 parametersConfigurationViewController];
}

id objc_msgSend_performWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithCompletionHandler:");
}

id objc_msgSend_pickerDelegate(void *a1, const char *a2, ...)
{
  return _[a1 pickerDelegate];
}

id objc_msgSend_populateConfiguredActionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateConfiguredActionWithCompletion:");
}

id objc_msgSend_populateConfiguredAppIntentWithAction_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateConfiguredAppIntentWithAction:completion:");
}

id objc_msgSend_populateConfiguredAppIntentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateConfiguredAppIntentWithCompletion:");
}

id objc_msgSend_populateConfiguredCustomIntentWithAction_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateConfiguredCustomIntentWithAction:completion:");
}

id objc_msgSend_populateConfiguredCustomIntentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateConfiguredCustomIntentWithCompletion:");
}

id objc_msgSend_populateConfiguredIntentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateConfiguredIntentWithCompletion:");
}

id objc_msgSend_preferParameterValuePicker(void *a1, const char *a2, ...)
{
  return _[a1 preferParameterValuePicker];
}

id objc_msgSend_preferredCardSizeDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredCardSizeDidUpdate:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_preferredMaxLayoutWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredMaxLayoutWidth];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_processParametersWithoutAskingForValuesWithInput_workQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:");
}

id objc_msgSend_providedActionWithIdentifier_serializedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providedActionWithIdentifier:serializedParameters:");
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_reloadActionParameterModels(void *a1, const char *a2, ...)
{
  return _[a1 reloadActionParameterModels];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_remoteLocalizedIntent(void *a1, const char *a2, ...)
{
  return _[a1 remoteLocalizedIntent];
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAttribute:range:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_resolvedWidgetConfigurationStyle(void *a1, const char *a2, ...)
{
  return _[a1 resolvedWidgetConfigurationStyle];
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return _[a1 resourceManager];
}

id objc_msgSend_rootWidgetConfigurationViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootWidgetConfigurationViewController];
}

id objc_msgSend_scaledFontForFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledFontForFont:");
}

id objc_msgSend_scaledFontForFont_maximumPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledFontForFont:maximumPointSize:");
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:");
}

id objc_msgSend_scrollDividerView(void *a1, const char *a2, ...)
{
  return _[a1 scrollDividerView];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_sectionFooter(void *a1, const char *a2, ...)
{
  return _[a1 sectionFooter];
}

id objc_msgSend_sectionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sectionIdentifier];
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 sectionIdentifiers];
}

id objc_msgSend_sectionTitle(void *a1, const char *a2, ...)
{
  return _[a1 sectionTitle];
}

id objc_msgSend_serializedParameters(void *a1, const char *a2, ...)
{
  return _[a1 serializedParameters];
}

id objc_msgSend_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceHorizontal:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBarTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarTintColor:");
}

id objc_msgSend_setCardBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCardBackgroundColor:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setConfigurationCardViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationCardViewFrame:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContainerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerDelegate:");
}

id objc_msgSend_setContainingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainingViewController:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setDataAttributionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataAttributionView:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaultRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultRowAnimation:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEditingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingContext:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setFillProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillProvider:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterButtons:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLinkTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkTextAttributes:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOptions_forIntentClassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:forIntentClassName:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setParameterState_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParameterState:forKey:");
}

id objc_msgSend_setPickerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPickerDelegate:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootWidgetConfigurationViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootWidgetConfigurationViewController:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setScrollDividerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollDividerView:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSectionFooterHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionFooterHeight:");
}

id objc_msgSend_setShowsCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsCancelButton:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsPrompt:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setStrokeProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrokeProvider:");
}

id objc_msgSend_setSummarySlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummarySlot:");
}

id objc_msgSend_setSystemShortcutPickerModuleSummaryCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemShortcutPickerModuleSummaryCoordinator:");
}

id objc_msgSend_setSystemShortcutPickerViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemShortcutPickerViewController:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setVariableProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVariableProvider:");
}

id objc_msgSend_setWidgetDescriptionLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetDescriptionLabel:");
}

id objc_msgSend_setWidgetDescriptionTallScriptCompensatedSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetDescriptionTallScriptCompensatedSpacing:");
}

id objc_msgSend_setWidgetDescriptionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetDescriptionView:");
}

id objc_msgSend_setWidgetFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetFamily:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupChildViewController:");
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedResolver(void *a1, const char *a2, ...)
{
  return _[a1 sharedResolver];
}

id objc_msgSend_shortcutsMigratedAppIntentForIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutsMigratedAppIntentForIntent:");
}

id objc_msgSend_shouldShowShortcutPickerPresentation(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowShortcutPickerPresentation];
}

id objc_msgSend_showsParameterDescription(void *a1, const char *a2, ...)
{
  return _[a1 showsParameterDescription];
}

id objc_msgSend_showsWidgetDescription(void *a1, const char *a2, ...)
{
  return _[a1 showsWidgetDescription];
}

id objc_msgSend_singleButtonSlotForParameter_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singleButtonSlotForParameter:state:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_startAccessingSecurityScopedBundleResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedBundleResource];
}

id objc_msgSend_stopAutomaticallyUpdatingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAutomaticallyUpdatingView:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strokeProvider(void *a1, const char *a2, ...)
{
  return _[a1 strokeProvider];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_summarySlot(void *a1, const char *a2, ...)
{
  return _[a1 summarySlot];
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemShortcutPickerModuleSummaryCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 systemShortcutPickerModuleSummaryCoordinator];
}

id objc_msgSend_systemShortcutPickerModuleSummaryCoordinatorDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemShortcutPickerModuleSummaryCoordinatorDidFinish:");
}

id objc_msgSend_systemShortcutPickerViewController(void *a1, const char *a2, ...)
{
  return _[a1 systemShortcutPickerViewController];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableView_titleForHeaderInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:titleForHeaderInSection:");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _[a1 textProperties];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_track(void *a1, const char *a2, ...)
{
  return _[a1 track];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_updateModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateModel:");
}

id objc_msgSend_updateTableHeaderHeight(void *a1, const char *a2, ...)
{
  return _[a1 updateTableHeaderHeight];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerForEditingWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForEditingWithIdentifier:");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_visibleParametersWithProcessing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleParametersWithProcessing:");
}

id objc_msgSend_wf_defaultWidgetConfigurationCardBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_defaultWidgetConfigurationCardBackgroundColor");
}

id objc_msgSend_widgetConfigurationType(void *a1, const char *a2, ...)
{
  return _[a1 widgetConfigurationType];
}

id objc_msgSend_widgetDescription(void *a1, const char *a2, ...)
{
  return _[a1 widgetDescription];
}

id objc_msgSend_widgetDescriptionLabel(void *a1, const char *a2, ...)
{
  return _[a1 widgetDescriptionLabel];
}

id objc_msgSend_widgetDescriptionLabelTopSpacingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 widgetDescriptionLabelTopSpacingConstraint];
}

id objc_msgSend_widgetDescriptionTallScriptCompensatedSpacing(void *a1, const char *a2, ...)
{
  return _[a1 widgetDescriptionTallScriptCompensatedSpacing];
}

id objc_msgSend_widgetDescriptionView(void *a1, const char *a2, ...)
{
  return _[a1 widgetDescriptionView];
}

id objc_msgSend_widgetDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 widgetDisplayName];
}

id objc_msgSend_widgetFamily(void *a1, const char *a2, ...)
{
  return _[a1 widgetFamily];
}

id objc_msgSend_widgetPrimaryColor(void *a1, const char *a2, ...)
{
  return _[a1 widgetPrimaryColor];
}

id objc_msgSend_widgetValuePickerViewControllerDidChooseValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetValuePickerViewControllerDidChooseValue:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}