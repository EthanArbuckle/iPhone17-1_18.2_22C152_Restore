id sub_100002A10()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView);
  }
  else
  {
    v4 = v0;
    sub_100006308();
    v5 = objc_allocWithZone((Class)sub_100004518(&qword_10000C648));
    v6 = (void *)sub_100006228();
    v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

void sub_100002AAC()
{
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for PreviewViewController();
  [super loadView];
  id v5 = sub_100002A10();
  [v0 addChildViewController:v5];

  id v6 = sub_100002A10();
  id v7 = [v6 view];

  if (!v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v8 = [v0 view];
  if (!v8)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v9 = v8;
  [v8 bounds];
  sub_100006044();

  [v7 setFrame:v1, v2, v3, v4];
  id v10 = sub_100002A10();
  id v11 = [v10 view];

  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  [v11 setAutoresizingMask:18];

  id v12 = [v0 view];
  if (!v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v13 = v12;
  id v14 = sub_100002A10();
  id v15 = [v14 view];

  if (v15)
  {
    [v13 addSubview:v15];

    id v16 = sub_100002A10();
    [v16 didMoveToParentViewController:v0];

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_100002CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = v3;
  sub_1000060F8();
  sub_100005F60();
  __chkstk_darwin();
  sub_100005FB8();
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v4, a1);
  id v10 = objc_allocWithZone((Class)WFShortcutExtractor);
  id v12 = sub_100004174(v4, 1, 0, 0, v11);
  v13 = (void *)swift_allocObject();
  v13[2] = v5;
  v13[3] = a2;
  v13[4] = a3;
  aBlock[4] = sub_1000042C0;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100002E38;
  aBlock[3] = &unk_1000087B0;
  id v14 = _Block_copy(aBlock);
  id v15 = v5;
  swift_retain();
  swift_release();
  [v12 extractShortcutWithCompletion:v14];
  _Block_release(v14);
}

void sub_100002E38(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100002FBC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1000060B8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id sub_100003020(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView] = 0;
  if (a2)
  {
    NSString v5 = sub_100006358();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for PreviewViewController();
  [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_10000310C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for PreviewViewController();
  [super initWithCoder:a1];

  return v3;
}

id sub_100003190()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for PreviewViewController()
{
  return self;
}

id sub_1000031F8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100006358();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithBundleIdentifier:v1];

  return v2;
}

uint64_t sub_10000326C@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_100006218();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = sub_100004518(&qword_10000C700);
  return sub_1000032C8(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_1000032C8@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v62 = a2;
  uint64_t v66 = a3;
  uint64_t v60 = sub_100006118();
  sub_100005F60();
  uint64_t v65 = v8;
  __chkstk_darwin(v9);
  sub_100005FA0();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_100004518(&qword_10000C708);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  sub_100005F7C();
  uint64_t v61 = v15;
  sub_100006014();
  __chkstk_darwin(v16);
  uint64_t v68 = (uint64_t)&v57 - v17;
  sub_100005FF4();
  uint64_t v64 = sub_100006328();
  sub_100005F60();
  uint64_t v67 = v18;
  __chkstk_darwin(v19);
  sub_100005F7C();
  v63 = v20;
  sub_100006014();
  __chkstk_darwin(v21);
  v23 = (char *)&v57 - v22;
  uint64_t v24 = sub_100004518(&qword_10000C710);
  __chkstk_darwin(v24 - 8);
  sub_100005FA0();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = sub_100004518(&qword_10000C718);
  uint64_t v29 = v28 - 8;
  uint64_t v30 = __chkstk_darwin(v28);
  v32 = (char *)&v57 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v34 = (char *)&v57 - v33;
  *(void *)uint64_t v27 = sub_100006218();
  *(void *)(v27 + 8) = 0;
  *(unsigned char *)(v27 + 16) = 1;
  uint64_t v35 = sub_100004518(&qword_10000C720);
  sub_100003744(a1, v27 + *(int *)(v35 + 44));
  char v36 = sub_100006248();
  sub_100006198();
  sub_100006044();
  sub_100005B58(v27, (uint64_t)v32, &qword_10000C710);
  v37 = &v32[*(int *)(v29 + 44)];
  v59 = v32;
  char *v37 = v36;
  *((void *)v37 + 1) = v3;
  *((void *)v37 + 2) = v4;
  *((void *)v37 + 3) = v5;
  *((void *)v37 + 4) = v6;
  v37[40] = 0;
  sub_100005BB4(v27, &qword_10000C710);
  v58 = v34;
  sub_100005AFC((uint64_t)v32, (uint64_t)v34, &qword_10000C718);
  sub_100006318();
  id v38 = a1;
  id v39 = v62;
  sub_100006108();
  id v40 = [self wf_systemGroupedBackgroundColor];
  uint64_t v41 = sub_1000062D8();
  char v42 = sub_100006248();
  uint64_t v43 = v65;
  uint64_t v45 = v60;
  uint64_t v44 = v61;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16))(v61, v12, v60);
  uint64_t v46 = v44 + *(int *)(v14 + 44);
  *(void *)uint64_t v46 = v41;
  *(unsigned char *)(v46 + 8) = v42;
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v12, v45);
  uint64_t v47 = v68;
  sub_100005AFC(v44, v68, &qword_10000C708);
  uint64_t v48 = (uint64_t)v59;
  sub_100005B58((uint64_t)v34, (uint64_t)v59, &qword_10000C718);
  v49 = *(void (**)(uint64_t, char *, uint64_t))(v67 + 16);
  v50 = v63;
  v51 = v23;
  uint64_t v52 = v64;
  v49((uint64_t)v63, v51, v64);
  sub_100005B58(v47, v44, &qword_10000C708);
  uint64_t v53 = v66;
  sub_100005B58(v48, v66, &qword_10000C718);
  uint64_t v54 = sub_100004518(&qword_10000C728);
  v49(v53 + *(int *)(v54 + 48), v50, v52);
  sub_100005B58(v44, v53 + *(int *)(v54 + 64), &qword_10000C708);
  sub_100005BB4(v68, &qword_10000C708);
  v55 = *(void (**)(void))(v67 + 8);
  sub_100006020();
  v55();
  sub_100005BB4((uint64_t)v58, &qword_10000C718);
  sub_100005BB4(v44, &qword_10000C708);
  sub_100006020();
  v55();
  return sub_100005BB4(v48, &qword_10000C718);
}

uint64_t sub_100003744@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_100004518(&qword_10000C730);
  __chkstk_darwin(v3 - 8);
  sub_100005F7C();
  uint64_t v54 = v4;
  sub_100006014();
  __chkstk_darwin(v5);
  id v7 = (uint64_t *)((char *)&v50 - v6);
  *id v7 = sub_100006338();
  v7[1] = v8;
  uint64_t v9 = sub_100004518(&qword_10000C738);
  sub_100003A48(a1, (uint64_t)v7 + *(int *)(v9 + 44));
  uint64_t v10 = sub_100005A30(a1, (SEL *)&selRef_name);
  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = 0xE000000000000000;
  if (v11) {
    unint64_t v13 = v11;
  }
  uint64_t v56 = v12;
  unint64_t v57 = v13;
  sub_10000591C();
  uint64_t v14 = sub_100006298();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_100006258();
  uint64_t v19 = sub_100006288();
  uint64_t v52 = v20;
  uint64_t v53 = v19;
  uint64_t v51 = v21;
  char v23 = v22;
  swift_release();
  HIDWORD(v50) = v23 & 1;
  sub_100005968(v14, v16, v18);
  swift_bridgeObjectRelease();
  id v24 = [a1 workflowSubtitle];
  uint64_t v25 = sub_100006368();
  unint64_t v27 = v26;

  uint64_t v56 = v25;
  unint64_t v57 = v27;
  uint64_t v28 = sub_100006298();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  sub_100006268();
  uint64_t v33 = sub_100006288();
  uint64_t v35 = v34;
  char v37 = v36;
  uint64_t v39 = v38;
  swift_release();
  LOBYTE(v25) = v37 & 1;
  sub_100005968(v28, v30, v32);
  swift_bridgeObjectRelease();
  uint64_t v40 = v54;
  sub_100005B58((uint64_t)v7, v54, &qword_10000C730);
  char v41 = BYTE4(v50);
  LOBYTE(v56) = BYTE4(v50);
  uint64_t v42 = v55;
  sub_100005B58(v40, v55, &qword_10000C730);
  uint64_t v43 = sub_100004518(&qword_10000C740);
  uint64_t v44 = v42 + *(int *)(v43 + 48);
  uint64_t v45 = v53;
  uint64_t v46 = v51;
  *(void *)uint64_t v44 = v53;
  *(void *)(v44 + 8) = v46;
  *(unsigned char *)(v44 + 16) = v41;
  *(void *)(v44 + 24) = v52;
  uint64_t v47 = v42 + *(int *)(v43 + 64);
  *(void *)uint64_t v47 = v33;
  *(void *)(v47 + 8) = v35;
  *(unsigned char *)(v47 + 16) = v25;
  *(void *)(v47 + 24) = v39;
  uint64_t v48 = v45;
  sub_100005A90(v45, v46, v41);
  swift_bridgeObjectRetain();
  sub_100005A90(v33, v35, v25);
  swift_bridgeObjectRetain();
  sub_100005BB4((uint64_t)v7, &qword_10000C730);
  sub_100005968(v33, v35, v25);
  swift_bridgeObjectRelease();
  sub_100005968(v48, v46, v56);
  swift_bridgeObjectRelease();
  return sub_100005BB4(v40, &qword_10000C730);
}

uint64_t sub_100003A48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v71 = sub_100006168();
  sub_100005F60();
  uint64_t v69 = v3;
  ((void (*)(void))__chkstk_darwin)();
  sub_100006000();
  uint64_t v68 = v4;
  sub_100005FF4();
  sub_100006158();
  sub_100005F60();
  uint64_t v64 = v6;
  uint64_t v65 = v5;
  ((void (*)(void))__chkstk_darwin)();
  sub_100006000();
  uint64_t v66 = v7;
  sub_100005FF4();
  sub_100006178();
  sub_100005F60();
  uint64_t v72 = v9;
  uint64_t v73 = v8;
  ((void (*)(void))__chkstk_darwin)();
  sub_100005F7C();
  v70 = v10;
  sub_100006014();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v67 = (char *)&v63 - v11;
  sub_100005FF4();
  uint64_t v12 = sub_1000061B8();
  sub_100005F90();
  ((void (*)(void))__chkstk_darwin)();
  sub_100005FA0();
  uint64_t v15 = (_OWORD *)(v14 - v13);
  uint64_t v63 = sub_100004518(&qword_10000C748);
  sub_100005F60();
  uint64_t v17 = v16;
  ((void (*)(void))__chkstk_darwin)();
  sub_100005FA0();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_100004518(&qword_10000C750) - 8;
  uint64_t v22 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  unint64_t v26 = (char *)&v63 - v25;
  unint64_t v27 = (char *)v15 + *(int *)(v12 + 20);
  uint64_t v28 = enum case for RoundedCornerStyle.continuous(_:);
  sub_100006208();
  sub_100005F90();
  (*(void (**)(char *, uint64_t))(v29 + 104))(v27, v28);
  __asm { FMOV            V0.2D, #16.0 }
  *uint64_t v15 = _Q0;
  id v35 = [a1 icon];
  id v36 = [v35 backgroundColor];

  id v37 = [v36 paletteGradient];
  sub_100005358(&qword_10000C758, (void (*)(uint64_t))&type metadata accessor for RoundedRectangle);
  sub_1000062F8();

  uint64_t v38 = a1;
  uint64_t v39 = (uint64_t)v26;
  sub_100005AA0((uint64_t)v15);
  sub_100006338();
  sub_1000061A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v24, v20, v63);
  uint64_t v40 = &v24[*(int *)(v21 + 44)];
  long long v41 = v76;
  *(_OWORD *)uint64_t v40 = v75;
  *((_OWORD *)v40 + 1) = v41;
  *((_OWORD *)v40 + 2) = v77;
  sub_100006020();
  v42();
  sub_100005AFC((uint64_t)v24, (uint64_t)v26, &qword_10000C750);
  id v43 = [v38 reference];
  if (v43)
  {
    uint64_t v44 = v43;
    id v45 = [v43 attributionIcon];
  }
  else
  {
    sub_100005A30(v38, (SEL *)&selRef_associatedAppBundleIdentifier);
    if (v46)
    {
      sub_100005C08();
      sub_1000031F8();
    }
    else
    {
      id v47 = [v38 icon];
      id v48 = [v47 icon];
    }
  }
  uint64_t v49 = v65;
  uint64_t v50 = v66;
  *uint64_t v66 = 0x4046000000000000;
  (*(void (**)(void *, void, uint64_t))(v64 + 104))(v50, enum case for IconSize.customHeight(_:), v49);
  id v51 = [self whiteColor];
  uint64_t v53 = v68;
  uint64_t v52 = v69;
  *uint64_t v68 = v51;
  *((unsigned char *)v53 + 8) = 0;
  (*(void (**)(void *, void, uint64_t))(v52 + 104))(v53, enum case for IconView.DisplayMode.customColor(_:), v71);
  uint64_t v54 = v67;
  sub_100006188();
  sub_100005B58(v39, (uint64_t)v24, &qword_10000C750);
  uint64_t v56 = v72;
  uint64_t v55 = v73;
  unint64_t v57 = *(void (**)(uint64_t, char *, uint64_t))(v72 + 16);
  v58 = v70;
  v57((uint64_t)v70, v54, v73);
  uint64_t v59 = v74;
  sub_100005B58((uint64_t)v24, v74, &qword_10000C750);
  uint64_t v60 = sub_100004518(&qword_10000C760);
  v57(v59 + *(int *)(v60 + 48), v58, v55);
  uint64_t v61 = *(void (**)(char *, uint64_t))(v56 + 8);
  v61(v54, v55);
  sub_100005BB4(v39, &qword_10000C750);
  v61(v58, v55);
  return sub_100005BB4((uint64_t)v24, &qword_10000C750);
}

uint64_t sub_100004014()
{
  return sub_1000062C8();
}

uint64_t sub_100004030@<X0>(uint64_t a1@<X8>)
{
  return sub_10000326C(*v1, v1[1], a1);
}

double sub_100004038@<D0>(uint64_t a1@<X8>)
{
  swift_getErrorValue();
  sub_1000063A8();
  sub_10000591C();
  uint64_t v2 = sub_100006298();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_1000062E8();
  uint64_t v7 = sub_100006278();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  swift_release();
  sub_100005968(v2, v4, v6);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = swift_getKeyPath();
  char v16 = sub_100006248();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  *(void *)(a1 + 32) = KeyPath;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  *(_WORD *)(a1 + 65) = 256;
  *(unsigned char *)(a1 + 72) = v16;
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(unsigned char *)(a1 + 112) = 1;
  return result;
}

double sub_10000416C@<D0>(uint64_t a1@<X8>)
{
  return sub_100004038(a1);
}

id sub_100004174@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X5>, NSURL *a5@<X8>)
{
  char v6 = v5;
  sub_1000060D8(a5);
  uint64_t v12 = v11;
  if (!a3)
  {
    NSString v13 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v14 = 0;
    goto LABEL_6;
  }
  NSString v13 = sub_100006358();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v14 = sub_100006358();
  swift_bridgeObjectRelease();
LABEL_6:
  id v15 = [v6 initWithURL:v12 allowsOldFormatFile:a2 & 1 suggestedName:v13 sourceApplication:v14];

  uint64_t v16 = sub_1000060F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
  return v15;
}

uint64_t sub_100004280()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000042C0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v2 + 24);
  if (a1)
  {
    id v4 = a1;
    id v5 = [v4 record];
    id v6 = objc_allocWithZone((Class)WFWorkflow);
    id v26 = sub_1000045D0(v5, 0, 0);
    sub_100006148();
    unint64_t v27 = (void *)sub_100006138();
    sub_100006128();
    id v28 = sub_100002A10();
    sub_1000046BC();
    id v29 = v26;
    id v30 = v27;
    sub_100006308();
    sub_100006238();

    sub_100006038();
    v3(v31, v32);
  }
  else if (a2)
  {
    swift_errorRetain();
    swift_errorRetain();
    sub_100004518(&qword_10000C630);
    type metadata accessor for WFWorkflowError(0);
    if ((sub_100005FD0(v8, v9, v10, v11, v12, v13, v14, v15, a2, v34, v36, v38) & 1) != 0
      || (swift_errorRetain(),
          type metadata accessor for WFShortcutSharingError(0),
          sub_100005FD0(v16, v17, v18, v19, v20, v21, v22, v23, a2, v35, v37, (char)v39)))
    {

      id v24 = sub_100002A10();
      swift_errorRetain();
      sub_100004584();
      sub_100006308();
      sub_100006238();

      sub_100006038();
      ((void (*)(uint64_t))v3)(v25);
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      sub_100006038();
      ((void (*)(void))v3)();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100004500(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004510()
{
  return swift_release();
}

uint64_t sub_100004518(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for WFWorkflowError(uint64_t a1)
{
}

void type metadata accessor for WFShortcutSharingError(uint64_t a1)
{
}

unint64_t sub_100004584()
{
  unint64_t result = qword_10000C638;
  if (!qword_10000C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C638);
  }
  return result;
}

id sub_1000045D0(void *a1, void *a2, uint64_t a3)
{
  id v10 = 0;
  id v6 = [v3 initWithRecord:a1 reference:a2 storageProvider:a3 error:&v10];
  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_1000060C8();

    swift_willThrow();
  }

  swift_unknownObjectRelease();
  return v6;
}

unint64_t sub_1000046BC()
{
  unint64_t result = qword_10000C640;
  if (!qword_10000C640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C640);
  }
  return result;
}

uint64_t sub_100004708()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004740(uint64_t a1)
{
  sub_100002FBC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100004748@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_100004750()
{
  return *v0;
}

BOOL sub_100004758(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_100004768()
{
  return sub_100006368();
}

uint64_t sub_100004778(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000047E4(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100004850(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_1000048E0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100006378();

  return v2;
}

uint64_t sub_100004914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

uint64_t sub_100004998()
{
  return sub_100006368();
}

uint64_t sub_1000049A8(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100004A14(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100004A80(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100004B10()
{
  return sub_1000048E0(*v0);
}

uint64_t sub_100004B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100004B94()
{
  return sub_1000063D8();
}

void sub_100004BF4(uint64_t a1@<X8>)
{
  sub_100004C28();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_100004C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for PreviewView(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for PreviewView(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for PreviewView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for PreviewView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for PreviewView(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
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

void *storeEnumTagSinglePayload for PreviewView(void *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0) {
      *((unsigned char *)result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return sub_10000602C(result, a2);
    }
    *((unsigned char *)result + 16) = 0;
    if (a2) {
      return sub_10000602C(result, a2);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewView()
{
  return &type metadata for PreviewView;
}

void *initializeBufferWithCopyOfBuffer for ErrorView(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain();
  *a1 = v3;
  return a1;
}

uint64_t destroy for ErrorView()
{
  return swift_errorRelease();
}

void *assignWithCopy for ErrorView(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain();
  *a1 = v3;
  swift_errorRelease();
  return a1;
}

void *initializeWithTake for ErrorView(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *assignWithTake for ErrorView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_errorRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ErrorView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 8))
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

void *storeEnumTagSinglePayload for ErrorView(void *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *((unsigned char *)result + 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return sub_10000602C(result, a2);
    }
    *((unsigned char *)result + 8) = 0;
    if (a2) {
      return sub_10000602C(result, a2);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorView()
{
  return &type metadata for ErrorView;
}

uint64_t sub_100004F34(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6C0, type metadata accessor for WFShortcutSharingError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004FA0(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6C0, type metadata accessor for WFShortcutSharingError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005010(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_10000507C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005100(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C670, type metadata accessor for WFWorkflowError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000516C(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C670, type metadata accessor for WFWorkflowError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000051D8(uint64_t a1)
{
  uint64_t v2 = sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100005244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000052C8()
{
  return sub_100005358(&qword_10000C660, type metadata accessor for WFWorkflowError);
}

uint64_t sub_100005310()
{
  return sub_100005358(&qword_10000C668, type metadata accessor for WFWorkflowError);
}

uint64_t sub_100005358(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000053A0()
{
  return sub_100005358(&qword_10000C670, type metadata accessor for WFWorkflowError);
}

uint64_t sub_1000053E8()
{
  return sub_100005358(&qword_10000C678, type metadata accessor for WFWorkflowError);
}

uint64_t sub_100005430()
{
  return sub_100005358(&qword_10000C680, type metadata accessor for WFWorkflowError);
}

uint64_t sub_100005478()
{
  return sub_100005358(&qword_10000C688, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_1000054D4()
{
  return sub_100005358(&qword_10000C690, _s3__C4CodeOMa_0);
}

unint64_t sub_100005520()
{
  unint64_t result = qword_10000C698;
  if (!qword_10000C698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C698);
  }
  return result;
}

uint64_t sub_10000556C()
{
  return sub_100005358(&qword_10000C6A0, _s3__C4CodeOMa_0);
}

uint64_t sub_1000055B4()
{
  return sub_100005358(&qword_10000C6A8, type metadata accessor for WFWorkflowError);
}

BOOL sub_1000055FC(uint64_t *a1, uint64_t *a2)
{
  return sub_100004758(*a1, *a2);
}

uint64_t sub_100005608()
{
  return sub_100005358(&qword_10000C6B0, type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_100005650()
{
  return sub_100005358(&qword_10000C6B8, type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_100005698()
{
  return sub_100005358(&qword_10000C6C0, type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_1000056E0()
{
  return sub_100005358(&qword_10000C6C8, type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_100005728()
{
  return sub_100005358(&qword_10000C6D0, type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_100005770()
{
  return sub_100005358(&qword_10000C6D8, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_1000057CC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005814()
{
  return sub_100005358(&qword_10000C6E0, type metadata accessor for Code);
}

uint64_t sub_10000585C()
{
  return sub_100005358(&qword_10000C6E8, type metadata accessor for Code);
}

uint64_t sub_1000058A4()
{
  return sub_100005358(&qword_10000C6F0, type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_1000058EC(uint64_t a1)
{
  return sub_100005FB0(a1, (uint64_t)&unk_1000073C0);
}

uint64_t sub_100005904(uint64_t a1)
{
  return sub_100005FB0(a1, (uint64_t)&unk_100007398);
}

unint64_t sub_10000591C()
{
  unint64_t result = qword_10000C6F8;
  if (!qword_10000C6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C6F8);
  }
  return result;
}

uint64_t sub_100005968(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100005978@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000061C8();
  *a1 = result;
  return result;
}

uint64_t sub_1000059A4()
{
  return sub_1000061D8();
}

uint64_t sub_1000059CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1000061E8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100005A00()
{
  return sub_1000061F8();
}

uint64_t sub_100005A30(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  char v3 = v2;
  uint64_t v4 = sub_100006368();

  return v4;
}

uint64_t sub_100005A90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100005AA0(uint64_t a1)
{
  uint64_t v2 = sub_1000061B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005AFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100004518(a3);
  sub_100005F90();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_100005B58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100004518(a3);
  sub_100005F90();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_100005BB4(uint64_t a1, uint64_t *a2)
{
  sub_100004518(a2);
  sub_100005F90();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_100005C08()
{
  unint64_t result = qword_10000C768;
  if (!qword_10000C768)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C768);
  }
  return result;
}

uint64_t sub_100005C48()
{
  return sub_100005D04(&qword_10000C780, &qword_10000C788, (void (*)(void))sub_100005CD4);
}

uint64_t sub_100005C8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005CD4()
{
  return sub_100005D04(&qword_10000C790, &qword_10000C798, (void (*)(void))sub_100005D80);
}

uint64_t sub_100005D04(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005C8C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100005D80()
{
  unint64_t result = qword_10000C7A0;
  if (!qword_10000C7A0)
  {
    sub_100005C8C(&qword_10000C7A8);
    sub_100005E20();
    sub_100005EFC(&qword_10000C7D0, &qword_10000C7D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C7A0);
  }
  return result;
}

unint64_t sub_100005E20()
{
  unint64_t result = qword_10000C7B0;
  if (!qword_10000C7B0)
  {
    sub_100005C8C(&qword_10000C7B8);
    sub_100005EFC(&qword_10000C7C0, &qword_10000C7C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C7B0);
  }
  return result;
}

uint64_t sub_100005EC0()
{
  return sub_100005EFC(&qword_10000C7E0, &qword_10000C7E8);
}

uint64_t sub_100005EFC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005C8C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005FB0(uint64_t a1, uint64_t a2)
{
  return _swift_getOpaqueTypeConformance2(a1, a2, 1);
}

uint64_t sub_100005FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  return _swift_dynamicCast(&a12, &a9, v12, a1, 6);
}

uint64_t sub_100005FF4()
{
  return 0;
}

void *sub_10000602C(void *result, int a2)
{
  *uint64_t result = (a2 - 1);
  return result;
}

uint64_t sub_1000060B8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000060C8()
{
  return _convertNSErrorToError(_:)();
}

void sub_1000060D8(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000060E8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000060F8()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006108()
{
  return WorkflowEditorView.init(workflow:options:)();
}

uint64_t sub_100006118()
{
  return type metadata accessor for WorkflowEditorView();
}

uint64_t sub_100006128()
{
  return dispatch thunk of WorkflowEditorOptions.isReadOnly.setter();
}

uint64_t sub_100006138()
{
  return static WorkflowEditorOptions.default.getter();
}

uint64_t sub_100006148()
{
  return type metadata accessor for WorkflowEditorOptions();
}

uint64_t sub_100006158()
{
  return type metadata accessor for IconSize();
}

uint64_t sub_100006168()
{
  return type metadata accessor for IconView.DisplayMode();
}

uint64_t sub_100006178()
{
  return type metadata accessor for IconView();
}

uint64_t sub_100006188()
{
  return IconView.init(_:size:displayMode:animated:)();
}

uint64_t sub_100006198()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000061A8()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000061B8()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000061C8()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000061D8()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000061E8()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000061F8()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100006208()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100006218()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100006228()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100006238()
{
  return dispatch thunk of UIHostingController.rootView.setter();
}

uint64_t sub_100006248()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100006258()
{
  return static Font.title.getter();
}

uint64_t sub_100006268()
{
  return static Font.title3.getter();
}

uint64_t sub_100006278()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100006288()
{
  return Text.font(_:)();
}

uint64_t sub_100006298()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000062A8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000062B8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000062C8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000062D8()
{
  return Color.init(uiColor:)();
}

uint64_t sub_1000062E8()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000062F8()
{
  return Shape.fill(_:shouldUseClearBackground:)();
}

uint64_t sub_100006308()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_100006318()
{
  return Divider.init()();
}

uint64_t sub_100006328()
{
  return type metadata accessor for Divider();
}

uint64_t sub_100006338()
{
  return static Alignment.center.getter();
}

uint64_t sub_100006348()
{
  return dispatch thunk of Hashable.hash(into:)();
}

NSString sub_100006358()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006368()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006378()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_1000063A8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000063B8()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000063C8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000063D8()
{
  return Hasher._finalize()();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}