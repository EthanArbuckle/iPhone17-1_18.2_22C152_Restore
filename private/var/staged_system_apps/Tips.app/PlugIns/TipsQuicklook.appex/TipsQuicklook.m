id sub_1000028D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewViewController();
  return [super dealloc];
}

void sub_1000029E0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_100009570();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id sub_100002A44()
{
  id v1 = [self sharedInstance];
  id v7 = 0;
  unsigned int v2 = [v1 setCategory:AVAudioSessionCategoryAmbient error:&v7];

  if (v2)
  {
    id v3 = v7;
  }
  else
  {
    id v4 = v7;
    sub_100009580();

    swift_willThrow();
    swift_errorRelease();
  }
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for PreviewViewController();
  return [super viewDidLoad];
}

uint64_t variable initialization expression of TipPreviewView.tipsContentModel()
{
  return sub_100009630();
}

uint64_t variable initialization expression of TipPreviewView.currentTipIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of TipPreviewView.hostingView()
{
  return 0;
}

void *variable initialization expression of TipPreviewView.cancellables()
{
  return &_swiftEmptySetSingleton;
}

uint64_t (*variable initialization expression of TipPreviewView.contentSizeUpdatedHandler())()
{
  return nullsub_2;
}

uint64_t type metadata accessor for PreviewViewController()
{
  return self;
}

__n128 initializeWithTake for PreviewViewController.QuickLookPreviewError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002D40(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002D60(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_100010930)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010930);
    }
  }
}

void sub_100002DE0(uint64_t a1, uint64_t a2, char *a3, void (**a4)(void, void))
{
  id v8 = objc_allocWithZone((Class)sub_100009B00());
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100009AC0();
  if (v9)
  {
    id v49 = (id)v9;
    sub_100009AD0();
    if (v10)
    {
      sub_100009AF0();
      sub_100009AE0();
      if (!v11) {
        sub_100009B40();
      }
      NSString v12 = sub_100009B30();
      swift_bridgeObjectRelease();
      NSString v13 = sub_100009B30();
      swift_bridgeObjectRelease();
      id v14 = [self helpViewControllerWithIdentifier:v12 version:v13];

      if (!v14)
      {
        swift_bridgeObjectRelease();
        a4[2](a4, 0);
        v45 = v49;
        goto LABEL_20;
      }
      v15 = *(void **)&a3[OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController];
      *(void *)&a3[OBJC_IVAR____TtC13TipsQuicklook21PreviewViewController_helpViewController] = v14;
      id v48 = v14;

      [v48 setShouldDisallowOffSiteRedirects:1];
      [v48 setDisplayHelpTopicsOnly:1];
      NSString v16 = sub_100009B30();
      swift_bridgeObjectRelease();
      [v48 setSelectedHelpTopicID:v16];

      [v48 setShowTopicViewOnLoad:1];
      id v17 = [v48 view];
      if (!v17)
      {
LABEL_14:
        a4[2](a4, 0);

        v45 = v48;
LABEL_20:

        return;
      }
      v18 = v17;
      id v19 = [a3 view];
      if (v19)
      {
        v20 = v19;
        [v19 addSubview:v18];

        [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v21 = [a3 view];
        if (v21)
        {
          v22 = v21;
          sub_100003A48(&qword_100010940);
          uint64_t v23 = swift_allocObject();
          *(_OWORD *)(v23 + 16) = xmmword_10000A0E0;
          id v24 = [v18 leadingAnchor];
          id v25 = [a3 view];
          if (v25)
          {
            v26 = v25;
            id v27 = [v25 leadingAnchor];

            id v28 = [v24 constraintEqualToAnchor:v27];
            *(void *)(v23 + 32) = v28;
            id v29 = [v18 topAnchor];
            id v30 = [a3 view];
            if (v30)
            {
              v31 = v30;
              id v32 = [v30 topAnchor];

              id v33 = [v29 constraintEqualToAnchor:v32];
              *(void *)(v23 + 40) = v33;
              id v34 = [v18 trailingAnchor];
              id v35 = [a3 view];
              if (v35)
              {
                v36 = v35;
                id v37 = [v35 trailingAnchor];

                id v38 = [v34 constraintEqualToAnchor:v37];
                *(void *)(v23 + 48) = v38;
                id v39 = [v18 bottomAnchor];
                id v40 = [a3 view];
                if (v40)
                {
                  v41 = v40;
                  id v42 = [v40 bottomAnchor];

                  id v43 = [v39 constraintEqualToAnchor:v42];
                  *(void *)(v23 + 56) = v43;
                  sub_100009B70();
                  sub_100003A8C();
                  Class isa = sub_100009B60().super.isa;
                  swift_bridgeObjectRelease();
                  [v22 addConstraints:isa];

                  [v48 didMoveToParentViewController:a3];
                  goto LABEL_14;
                }
LABEL_28:
                _Block_release(a4);
                __break(1u);
                return;
              }
LABEL_27:
              _Block_release(a4);
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            _Block_release(a4);
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          _Block_release(a4);
          __break(1u);
          goto LABEL_26;
        }
      }
      else
      {
        _Block_release(a4);
        __break(1u);
      }
      _Block_release(a4);
      __break(1u);
      goto LABEL_25;
    }
  }
  sub_1000039F4();
  swift_allocError();
  void *v46 = a1;
  v46[1] = a2;
  swift_bridgeObjectRetain();
  v47 = (void *)sub_100009570();
  ((void (**)(void, void *))a4)[2](a4, v47);

  swift_errorRelease();
}

void sub_1000033B0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for TipPreviewView();
  id v8 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v4;
  uint64_t v10 = (uint64_t *)&v8[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
  swift_beginAccess();
  uint64_t v11 = *v10;
  *uint64_t v10 = (uint64_t)sub_100003B04;
  v10[1] = v9;
  id v12 = v4;
  sub_100003B14(v11);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [v12 view];
  if (!v13)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v14 = v13;
  [v13 addSubview:v8];

  id v15 = [v12 view];
  if (!v15)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  NSString v16 = v15;
  uint64_t v39 = a3;
  sub_100003A48(&qword_100010940);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10000A0E0;
  id v18 = [v8 leadingAnchor];
  id v19 = [v12 view];
  if (!v19)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v20 = v19;
  id v21 = [v19 leadingAnchor];

  id v22 = [v18 constraintEqualToAnchor:v21];
  *(void *)(v17 + 32) = v22;
  id v23 = [v8 topAnchor];
  id v24 = [v12 view];
  if (!v24)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v25 = v24;
  id v26 = [v24 topAnchor];

  id v27 = [v23 constraintEqualToAnchor:v26];
  *(void *)(v17 + 40) = v27;
  id v28 = [v8 trailingAnchor];
  id v29 = [v12 view];
  if (!v29)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v30 = v29;
  id v31 = [v29 trailingAnchor];

  id v32 = [v28 constraintEqualToAnchor:v31];
  *(void *)(v17 + 48) = v32;
  id v33 = [v8 bottomAnchor];
  id v34 = [v12 view];
  if (v34)
  {
    id v35 = v34;
    id v36 = [v34 bottomAnchor];

    id v37 = [v33 constraintEqualToAnchor:v36];
    *(void *)(v17 + 56) = v37;
    sub_100009B70();
    sub_100003A8C();
    Class isa = sub_100009B60().super.isa;
    swift_bridgeObjectRelease();
    [v16 addConstraints:isa];

    sub_1000056AC(a1, a2, v39, a4);
    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_100003780(uint64_t a1, void *a2, uint64_t a3, void *a4, char *a5, void *a6)
{
  id v18 = a5;
  uint64_t v17 = sub_100009AA0();
  uint64_t v11 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a6;
  _Block_copy(a6);
  sub_100009A90();
  id v15 = (void *)0xE000000000000000;
  uint64_t v19 = 0;
  unint64_t v20 = 0xE000000000000000;
  sub_100009BE0(64);
  v21._object = (void *)0x800000010000A360;
  v21._countAndFlagsBits = 0xD00000000000002DLL;
  sub_100009B50(v21);
  v22._countAndFlagsBits = a1;
  v22._object = a2;
  sub_100009B50(v22);
  v23._countAndFlagsBits = 0x537972657571202CLL;
  v23._object = (void *)0xEF203A676E697274;
  sub_100009B50(v23);
  if (a4) {
    id v15 = a4;
  }
  else {
    a3 = 0;
  }
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = a3;
  v24._object = v15;
  sub_100009B50(v24);
  swift_bridgeObjectRelease();
  sub_100009B10();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v17);
  sub_100009B00();
  if (sub_100009AB0())
  {
    _Block_copy(a6);
    sub_100002DE0(a1, (uint64_t)a2, v18, (void (**)(void, void))a6);
    _Block_release(a6);
  }
  else
  {
    sub_1000033B0(a1, a2, (uint64_t)sub_1000039EC, v14);
  }
  return swift_release();
}

uint64_t sub_1000039B4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000039EC(uint64_t a1)
{
  sub_1000029E0(a1, *(void *)(v1 + 16));
}

unint64_t sub_1000039F4()
{
  unint64_t result = qword_100010938;
  if (!qword_100010938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010938);
  }
  return result;
}

uint64_t sub_100003A48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003A8C()
{
  unint64_t result = qword_100010948;
  if (!qword_100010948)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010948);
  }
  return result;
}

uint64_t sub_100003ACC()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100003B04()
{
  return [*(id *)(v0 + 16) setPreferredContentSize:];
}

uint64_t sub_100003B14(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t destroy for PreviewViewController.QuickLookPreviewError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s13TipsQuicklook21PreviewViewControllerC21QuickLookPreviewErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for PreviewViewController.QuickLookPreviewError(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewViewController.QuickLookPreviewError(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewViewController.QuickLookPreviewError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviewViewController.QuickLookPreviewError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_100003D44(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100003D60(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewViewController.QuickLookPreviewError()
{
  return &type metadata for PreviewViewController.QuickLookPreviewError;
}

uint64_t (*variable initialization expression of TipPreviewView.completionHandler())()
{
  return nullsub_2;
}

uint64_t TipPreviewView.contentSizeUpdatedHandler.getter()
{
  unint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_100003E08(*v1);
  return v2;
}

uint64_t sub_100003E08(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t TipPreviewView.contentSizeUpdatedHandler.setter(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *unsigned int v5 = a1;
  v5[1] = a2;
  return sub_100003B14(v6);
}

uint64_t (*TipPreviewView.contentSizeUpdatedHandler.modify())()
{
  return j__swift_endAccess;
}

double sub_100003ED8()
{
  double result = 428.0;
  xmmword_1000109B0 = xmmword_10000A190;
  return result;
}

double sub_100003EF0()
{
  double result = 1000.0;
  xmmword_1000109C0 = xmmword_10000A1A0;
  return result;
}

void TipPreviewView.preparePreviewForTip(identifier:queryString:completionHandler:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

void sub_100003F14(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    uint64_t v8 = *(void *)(Strong + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier);
    id v7 = *(void **)(Strong + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier + 8);
    swift_bridgeObjectRetain();

    if (v7)
    {
      if (v8 == a2 && v7 == a3)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v10 = sub_100009C00();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0) {
          return;
        }
      }
      swift_beginAccess();
      uint64_t v11 = swift_unknownObjectWeakLoadStrong();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        sub_100004010(a2, a3);
      }
    }
  }
}

uint64_t sub_100004010(uint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = sub_100009AA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  id v11 = *(id *)&v2[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel];
  uint64_t v12 = (void *)sub_100009620();

  if (v12)
  {
    id v13 = [v3 traitCollection];
    [v13 userInterfaceStyle];

    id v14 = *(id *)&v3[v10];
    id v15 = v12;
    sub_1000095F0();

    NSString v16 = *(void **)&v3[v10];
    uint64_t v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v18 = (void *)swift_allocObject();
    v18[2] = a1;
    v18[3] = a2;
    v18[4] = v17;
    id v19 = v16;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100009610();

    swift_release();
    return swift_release();
  }
  else
  {
    sub_100009A90();
    unint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    sub_100009BE0(30);
    swift_bridgeObjectRelease();
    unint64_t v21 = 0xD00000000000001CLL;
    unint64_t v22 = 0x800000010000A550;
    v24._countAndFlagsBits = a1;
    v24._object = a2;
    sub_100009B50(v24);
    sub_100009B20();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return sub_100004798(a1, a2, 0);
  }
}

uint64_t sub_1000042BC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  Swift::String v24 = a1;
  uint64_t v25 = a5;
  uint64_t v28 = a3;
  uint64_t v7 = sub_100009A60();
  uint64_t v27 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100009A80();
  uint64_t v10 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100009AA0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  NSString v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    sub_100009A90();
    aBlock = 0;
    unint64_t v31 = 0xE000000000000000;
    sub_100009BE0(36);
    v36._object = (void *)0x800000010000A580;
    v36._countAndFlagsBits = 0xD00000000000001ELL;
    sub_100009B50(v36);
    v37._countAndFlagsBits = v28;
    v37._object = a4;
    sub_100009B50(v37);
    v38._countAndFlagsBits = 8250;
    v38._object = (void *)0xE200000000000000;
    sub_100009B50(v38);
    uint64_t v29 = a2;
    sub_100003A48(&qword_100010A60);
    sub_100009BF0();
    sub_100009B20();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  sub_100005B48(0, &qword_100010A40);
  uint64_t v17 = (void *)sub_100009B90();
  id v18 = (void *)swift_allocObject();
  id v19 = v24;
  uint64_t v20 = v28;
  v18[2] = v25;
  v18[3] = v20;
  v18[4] = a4;
  v18[5] = v19;
  id v34 = sub_100005BCC;
  id v35 = v18;
  aBlock = _NSConcreteStackBlock;
  unint64_t v31 = 1107296256;
  id v32 = sub_100004754;
  id v33 = &unk_10000CB38;
  unint64_t v21 = _Block_copy(&aBlock);
  id v22 = v19;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  sub_100009A70();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_100005BF0();
  sub_100003A48(&qword_100010A50);
  sub_100005D3C(&qword_100010A58, &qword_100010A50);
  sub_100009BD0();
  sub_100009BA0();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v26);
}

void sub_1000046DC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    sub_100004798(a2, a3, a4);
  }
}

uint64_t sub_100004754(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100004798(uint64_t a1, void *a2, void *a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = sub_100009AA0();
  uint64_t v75 = *(void *)(v8 - 8);
  uint64_t v76 = v8;
  ((void (*)(void))__chkstk_darwin)();
  v77 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003A48(&qword_100010A28);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SingleTipView();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  NSString v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v18 = (char *)&v73 - v17;
  uint64_t v19 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView;
  [*(id *)&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView] removeFromSuperview];
  sub_100004F14(a1, a2, a3, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_100005930((uint64_t)v11);
    sub_100009870();
    uint64_t v20 = sub_100009970();
    uint64_t v22 = v21;
    char v24 = v23 & 1;
    sub_100009910();
    uint64_t v25 = sub_100009960();
    uint64_t v27 = v26;
    char v29 = v28;
    uint64_t v74 = v19;
    swift_release();
    sub_100005990(v20, v22, v24);
    swift_bridgeObjectRelease();
    sub_100009A00();
    uint64_t v30 = sub_100009950();
    uint64_t v32 = v31;
    char v34 = v33;
    uint64_t v36 = v35;
    swift_release();
    sub_100005990(v25, v27, v29 & 1);
    uint64_t v37 = v74;
    swift_bridgeObjectRelease();
    uint64_t v79 = v30;
    uint64_t v80 = v32;
    char v81 = v34 & 1;
    uint64_t v82 = v36;
    id v38 = objc_allocWithZone((Class)sub_100003A48(&qword_100010A30));
    uint64_t v39 = sub_100009830();
    id v40 = *(void **)&v4[v37];
    *(void *)&v4[v37] = v39;

    uint64_t v42 = v75;
    uint64_t v41 = v76;
    id v43 = *(void **)&v4[v37];
    if (!v43) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  sub_1000059A0((uint64_t)v11, (uint64_t)v18);
  sub_100005A04((uint64_t)v18, (uint64_t)v16);
  id v44 = objc_allocWithZone((Class)sub_100003A48(&qword_100010A38));
  uint64_t v45 = sub_100009830();
  v46 = *(void **)&v4[v19];
  *(void *)&v4[v19] = v45;

  v47 = self;
  if ([v47 isPhoneUI])
  {
    id v48 = (void (**)(double, double))&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
    swift_beginAccess();
    id v49 = *v48;
    uint64_t v42 = v75;
    uint64_t v41 = v76;
    if (!*v48) {
      goto LABEL_15;
    }
    uint64_t v50 = qword_100010890;
    swift_retain();
    if (v50 != -1) {
      swift_once();
    }
    v51 = &xmmword_1000109B0;
    goto LABEL_14;
  }
  unsigned int v52 = [v47 isPadUI];
  uint64_t v42 = v75;
  uint64_t v41 = v76;
  if (v52)
  {
    v53 = (void (**)(double, double))&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
    swift_beginAccess();
    id v49 = *v53;
    if (*v53)
    {
      uint64_t v54 = qword_100010898;
      swift_retain();
      if (v54 != -1) {
        swift_once();
      }
      v51 = &xmmword_1000109C0;
LABEL_14:
      v49(*(double *)v51, *((double *)v51 + 1));
      sub_100003B14((uint64_t)v49);
    }
  }
LABEL_15:
  sub_100005A68((uint64_t)v18);
  id v43 = *(void **)&v4[v19];
  if (v43)
  {
LABEL_16:
    id v55 = v43;
    [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addSubview:v55];
    sub_100003A48(&qword_100010940);
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_10000A0E0;
    id v57 = [v55 leadingAnchor];
    id v58 = [v4 leadingAnchor];
    id v59 = [v57 constraintEqualToAnchor:v58];

    *(void *)(v56 + 32) = v59;
    id v60 = [v55 topAnchor];
    id v61 = [v4 topAnchor];
    id v62 = [v60 constraintEqualToAnchor:v61];

    *(void *)(v56 + 40) = v62;
    id v63 = [v55 trailingAnchor];
    id v64 = [v4 trailingAnchor];
    id v65 = [v63 constraintEqualToAnchor:v64];

    *(void *)(v56 + 48) = v65;
    id v66 = [v55 bottomAnchor];
    id v67 = [v4 bottomAnchor];
    id v68 = [v66 constraintEqualToAnchor:v67];

    *(void *)(v56 + 56) = v68;
    uint64_t v78 = v56;
    sub_100009B70();
    sub_100005B48(0, (unint64_t *)&qword_100010948);
    Class isa = sub_100009B60().super.isa;
    swift_bridgeObjectRelease();
    [v4 addConstraints:isa];
  }
LABEL_17:
  v70 = v77;
  sub_100009A90();
  sub_100009B10();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v70, v41);
  v71 = *(void (**)(void))&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  swift_retain();
  v71(0);
  return swift_release();
}

uint64_t sub_100004F14@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v39 = a3;
  uint64_t v9 = sub_100009AA0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  id v14 = *(id *)(v4 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel);
  uint64_t v15 = (void *)sub_1000095D0();

  if (!v15) {
    goto LABEL_7;
  }
  uint64_t v38 = a4;
  id v16 = *(id *)(v5 + v13);
  uint64_t v17 = (void *)sub_100009620();

  if (!v17)
  {

    a4 = v38;
LABEL_7:
    sub_100009A90();
    unint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    sub_100009BE0(44);
    swift_bridgeObjectRelease();
    unint64_t v40 = 0xD00000000000002ALL;
    unint64_t v41 = 0x800000010000A490;
    v43._countAndFlagsBits = a1;
    v43._object = a2;
    sub_100009B50(v43);
    sub_100009B20();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v29 = type metadata accessor for SingleTipView();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(a4, 1, 1, v29);
  }
  id v18 = *(id *)(v5 + v13);
  uint64_t v19 = (void *)sub_1000095C0();

  if (v19
    && (id v20 = [v19 tip],
        v19,
        id v21 = [v20 compact],
        v20,
        v21))
  {
    id v22 = [v21 width];
    id v23 = [v22 integerValue];

    id v24 = [v21 height];
    id v25 = [v24 integerValue];

    double v26 = (double)(uint64_t)v23;
    double v27 = (double)(uint64_t)v25;
    char v28 = v39;
  }
  else
  {
    uint64_t v31 = self;
    unsigned __int8 v32 = [v31 isPadUI];
    char v28 = v39;
    if (v32)
    {
      double v26 = 2500.0;
      double v27 = 1500.0;
    }
    else
    {
      unsigned int v33 = [v31 isMacUI];
      if (v33) {
        double v27 = 2000.0;
      }
      else {
        double v27 = 0.0;
      }
      if (v33) {
        double v26 = 3200.0;
      }
      else {
        double v26 = 0.0;
      }
    }
  }
  id v34 = v28;
  uint64_t v35 = v38;
  sub_100005D80(v15, v17, v28, v38, v26, v27);
  uint64_t v36 = type metadata accessor for SingleTipView();
  uint64_t v37 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56);

  return v37(v35, 0, 1, v36);
}

id TipPreviewView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithFrame:a1, a2, a3, a4];
}

id TipPreviewView.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  sub_100009640();
  uint64_t v10 = v4;
  *(void *)&v4[v9] = sub_100009630();
  uint64_t v11 = &v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView] = 0;
  *(void *)&v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables] = &_swiftEmptySetSingleton;
  uint64_t v12 = &v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  *(void *)uint64_t v12 = nullsub_2;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v10[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
  *(void *)uint64_t v13 = nullsub_2;
  *((void *)v13 + 1) = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for TipPreviewView();
  return [super initWithFrame:a1, a2, a3, a4];
}

id TipPreviewView.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id TipPreviewView.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  sub_100009640();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_100009630();
  uint64_t v5 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_hostingView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables] = &_swiftEmptySetSingleton;
  uint64_t v6 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler];
  *(void *)uint64_t v6 = nullsub_2;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v4[OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_contentSizeUpdatedHandler];
  *(void *)uint64_t v7 = nullsub_2;
  *((void *)v7 + 1) = 0;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for TipPreviewView();
  [super initWithCoder:a1];

  return v8;
}

id TipPreviewView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipPreviewView();
  return [super dealloc];
}

void sub_1000056AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  objc_super v10 = (uint64_t *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_currentTipIdentifier);
  *objc_super v10 = a1;
  v10[1] = (uint64_t)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_completionHandler);
  *uint64_t v11 = a3;
  v11[1] = a4;
  swift_retain();
  swift_release();
  uint64_t v12 = (void *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_cancellables);
  swift_beginAccess();
  *uint64_t v12 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
  uint64_t v13 = OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel;
  id v14 = *(id *)(v5 + OBJC_IVAR____TtC13TipsQuicklook14TipPreviewView_tipsContentModel);
  sub_100009600();

  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a1;
  v16[4] = a2;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_100005CD0;
  *(void *)(v17 + 24) = v16;
  swift_bridgeObjectRetain();
  sub_100003A48(&qword_100010A68);
  sub_100005D3C(&qword_100010A70, &qword_100010A68);
  sub_1000097D0();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_1000097C0();
  swift_endAccess();
  swift_release();
  id v18 = *(id *)(v5 + v13);
  uint64_t v19 = (void *)sub_100009620();

  if (v19)
  {

    sub_100004010(a1, a2);
  }
  else
  {
    id v20 = *(id *)(v5 + v13);
    sub_1000095B0();
  }
}

uint64_t type metadata accessor for TipPreviewView()
{
  return self;
}

uint64_t sub_100005930(uint64_t a1)
{
  uint64_t v2 = sub_100003A48(&qword_100010A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000059A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SingleTipView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SingleTipView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005A68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SingleTipView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005AC4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005AFC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005B3C(void *a1, uint64_t a2)
{
  return sub_1000042BC(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100005B48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100005B84()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100005BCC()
{
  sub_1000046DC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_100005BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005BE8()
{
  return swift_release();
}

unint64_t sub_100005BF0()
{
  unint64_t result = qword_100010A48;
  if (!qword_100010A48)
  {
    sub_100009A60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A48);
  }
  return result;
}

uint64_t sub_100005C48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005C90()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100005CD0()
{
  sub_100003F14(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_100005CDC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005D14()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005D3C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005C48(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100005D80(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  sub_100009A10();
  *(unsigned char *)(a4 + 16) = v18;
  *(void *)(a4 + 24) = v19;
  uint64_t v12 = (int *)type metadata accessor for SingleTipView();
  uint64_t v13 = (uint64_t *)(a4 + v12[6]);
  *uint64_t v13 = swift_getKeyPath();
  sub_100003A48(&qword_100010A78);
  swift_storeEnumTagMultiPayload();
  *(void *)(a4 + v12[7]) = 0x4040000000000000;
  sub_100009640();
  id v14 = a3;
  id v15 = a1;
  id v16 = a2;
  sub_100009630();
  sub_1000096E0();
  swift_allocObject();
  sub_100009680();
  sub_100009A10();

  *(void *)a4 = v18;
  *(void *)(a4 + 8) = v19;
  uint64_t v17 = (double *)(a4 + v12[8]);
  *uint64_t v17 = a5;
  v17[1] = a6;
}

uint64_t type metadata accessor for SingleTipView()
{
  uint64_t result = qword_100010AE0;
  if (!qword_100010AE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005F3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  double v27 = a2;
  uint64_t v31 = a3;
  uint64_t v4 = sub_100003A48(&qword_100010BF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100003A48(&qword_100010BF8);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  objc_super v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000097B0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100003A48(&qword_100010C00);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000097A0();
  uint64_t v29 = *(void *)(v18 - 8);
  uint64_t v30 = v18;
  __chkstk_darwin(v18);
  id v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  sub_100009820();
  type metadata accessor for SingleTipView();
  sub_100009820();
  sub_100005B48(0, &qword_100010C08);
  sub_100009BB0();
  uint64_t v21 = sub_100009590();
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v37 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 1, 1, v21);
  sub_100009760();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for ConstellationContentParagraphStyle.newline(_:), v11);
  sub_100009790();
  *(void *)uint64_t v6 = sub_1000098A0();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v22 = sub_100003A48(&qword_100010C10);
  sub_100006358(v27, (uint64_t)v20, (uint64_t)&v6[*(int *)(v22 + 44)]);
  sub_100009820();
  sub_100009A50();
  sub_100009810();
  sub_100009474((uint64_t)v6, (uint64_t)v10, &qword_100010BF0);
  id v23 = &v10[*(int *)(v8 + 44)];
  long long v24 = v33;
  *(_OWORD *)id v23 = v32;
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v34;
  sub_1000094D8((uint64_t)v6, &qword_100010BF0);
  sub_100009410((uint64_t)v10, v31, &qword_100010BF8);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v20, v30);
}

uint64_t sub_100006358@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100003A48(&qword_100010C18);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100003A48(&qword_100010C20);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100003A48(&qword_100010C28);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100003A48(&qword_100010C30);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_1000098B0();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v20 = sub_100003A48(&qword_100010C38);
  sub_10000669C(a1, a2, (uint64_t)&v8[*(int *)(v20 + 44)]);
  sub_100009A50();
  sub_100007004(0.0, 1, 0.0, 1, 1.79769313e308, 0, 0.0, 1, (uint64_t)v11, 0.0, 1, 0.0, 1);
  sub_1000094D8((uint64_t)v8, &qword_100010C18);
  LOBYTE(v8) = sub_1000098E0();
  type metadata accessor for SingleTipView();
  sub_1000097E0();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  sub_100009474((uint64_t)v11, (uint64_t)v15, &qword_100010C20);
  uint64_t v29 = &v15[*(int *)(v13 + 44)];
  *uint64_t v29 = (char)v8;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  sub_1000094D8((uint64_t)v11, &qword_100010C20);
  LOBYTE(v8) = sub_1000098F0();
  sub_1000097E0();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_100009474((uint64_t)v15, (uint64_t)v19, &qword_100010C28);
  uint64_t v38 = &v19[*(int *)(v17 + 44)];
  *uint64_t v38 = (char)v8;
  *((void *)v38 + 1) = v31;
  *((void *)v38 + 2) = v33;
  *((void *)v38 + 3) = v35;
  *((void *)v38 + 4) = v37;
  v38[40] = 0;
  sub_1000094D8((uint64_t)v15, &qword_100010C28);
  LOBYTE(v8) = sub_100009900();
  sub_1000097E0();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  sub_100009474((uint64_t)v19, a3, &qword_100010C30);
  uint64_t v47 = a3 + *(int *)(sub_100003A48(&qword_100010C40) + 36);
  *(unsigned char *)uint64_t v47 = (_BYTE)v8;
  *(void *)(v47 + 8) = v40;
  *(void *)(v47 + 16) = v42;
  *(void *)(v47 + 24) = v44;
  *(void *)(v47 + 32) = v46;
  *(unsigned char *)(v47 + 40) = 0;
  return sub_1000094D8((uint64_t)v19, &qword_100010C30);
}

uint64_t sub_10000669C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v96 = a2;
  uint64_t v99 = a3;
  uint64_t v4 = sub_100003A48(&qword_100010C48);
  __chkstk_darwin(v4 - 8);
  v92 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003A48(&qword_100010C50);
  __chkstk_darwin(v6 - 8);
  v90 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009780();
  uint64_t v97 = *(void *)(v8 - 8);
  uint64_t v98 = v8;
  __chkstk_darwin(v8);
  v91 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100003A48(&qword_100010C58) - 8;
  uint64_t v10 = __chkstk_darwin(v94);
  v93 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v95 = (uint64_t)&v80 - v12;
  uint64_t v89 = sub_100009890();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  v87 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100003A48(&qword_100010C60);
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v80 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100003A48(&qword_100010C68);
  __chkstk_darwin(v82);
  char v81 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100003A48(&qword_100010C70);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v100 = (uint64_t)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v101 = (uint64_t)&v80 - v19;
  v84 = a1;
  uint64_t v20 = a1[1];
  uint64_t v102 = *a1;
  uint64_t v103 = v20;
  uint64_t v83 = sub_100003A48(&qword_100010B60);
  sub_100009A20();
  uint64_t v21 = sub_1000096C0();
  uint64_t v23 = v22;
  swift_release();
  uint64_t v102 = v21;
  uint64_t v103 = v23;
  sub_100009310();
  uint64_t v24 = sub_100009980();
  uint64_t v26 = v25;
  char v28 = v27 & 1;
  sub_100005B48(0, &qword_100010C08);
  sub_100009BB0();
  sub_100009930();
  uint64_t v29 = sub_100009960();
  uint64_t v31 = v30;
  char v33 = v32;
  swift_release();
  sub_100005990(v24, v26, v28);
  swift_bridgeObjectRelease();
  sub_100009920();
  uint64_t v34 = sub_100009940();
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  char v40 = v39 & 1;
  sub_100005990(v29, v31, v33 & 1);
  swift_bridgeObjectRelease();
  uint64_t v102 = v34;
  uint64_t v103 = v36;
  char v104 = v40;
  uint64_t v105 = v38;
  sub_100009BC0();
  uint64_t v41 = v80;
  sub_1000099D0();
  sub_100005990(v34, v36, v40);
  swift_bridgeObjectRelease();
  LOBYTE(v31) = sub_1000098F0();
  sub_1000097E0();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v50 = v85;
  uint64_t v51 = (uint64_t)v81;
  uint64_t v52 = v86;
  (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v81, v41, v86);
  uint64_t v53 = v51 + *(int *)(v82 + 36);
  *(unsigned char *)uint64_t v53 = v31;
  *(void *)(v53 + 8) = v43;
  *(void *)(v53 + 16) = v45;
  *(void *)(v53 + 24) = v47;
  *(void *)(v53 + 32) = v49;
  *(unsigned char *)(v53 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v41, v52);
  uint64_t v54 = v87;
  sub_100009880();
  sub_100009364();
  uint64_t v55 = v100;
  sub_1000099E0();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v54, v89);
  sub_1000094D8(v51, &qword_100010C68);
  sub_100009410(v55, v101, &qword_100010C70);
  uint64_t v57 = v84[1];
  uint64_t v102 = *v84;
  uint64_t v56 = v102;
  uint64_t v103 = v57;
  sub_100009A20();
  uint64_t v89 = sub_1000096B0();
  swift_release();
  uint64_t v102 = v56;
  uint64_t v103 = v57;
  sub_100009A20();
  uint64_t v88 = sub_1000096D0();
  swift_release();
  uint64_t v102 = v56;
  uint64_t v103 = v57;
  sub_100009A20();
  sub_100009690();
  swift_release();
  uint64_t v102 = v56;
  uint64_t v103 = v57;
  sub_100009A20();
  sub_1000096A0();
  swift_release();
  uint64_t v58 = sub_1000097A0();
  uint64_t v59 = *(void *)(v58 - 8);
  id v60 = v92;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v92, v96, v58);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v60, 0, 1, v58);
  uint64_t v102 = v56;
  uint64_t v103 = v57;
  sub_100009A20();
  id v61 = v91;
  sub_100009770();
  LOBYTE(v55) = sub_1000098F0();
  sub_1000097E0();
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v97;
  uint64_t v70 = v98;
  uint64_t v72 = (uint64_t)v93;
  (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v93, v61, v98);
  uint64_t v73 = v72 + *(int *)(v94 + 44);
  *(unsigned char *)uint64_t v73 = v55;
  *(void *)(v73 + 8) = v63;
  *(void *)(v73 + 16) = v65;
  *(void *)(v73 + 24) = v67;
  *(void *)(v73 + 32) = v69;
  *(unsigned char *)(v73 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v71 + 8))(v61, v70);
  uint64_t v74 = v95;
  sub_100009410(v72, v95, &qword_100010C58);
  uint64_t v75 = v100;
  uint64_t v76 = v101;
  sub_100009474(v101, v100, &qword_100010C70);
  sub_100009474(v74, v72, &qword_100010C58);
  uint64_t v77 = v99;
  sub_100009474(v75, v99, &qword_100010C70);
  uint64_t v78 = sub_100003A48(&qword_100010C88);
  sub_100009474(v72, v77 + *(int *)(v78 + 48), &qword_100010C58);
  sub_1000094D8(v74, &qword_100010C58);
  sub_1000094D8(v76, &qword_100010C70);
  sub_1000094D8(v72, &qword_100010C58);
  return sub_1000094D8(v75, &qword_100010C70);
}

__n128 sub_100007004@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100009B80();
    uint64_t v23 = (void *)sub_1000098D0();
    sub_1000095A0();
  }
  sub_100009840();
  sub_100009474(v13, a9, &qword_100010C18);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100003A48(&qword_100010C20) + 36));
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

uint64_t sub_1000071C4@<X0>(char *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = type metadata accessor for SingleTipView();
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v41 = *(void *)(v42 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v40 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009700();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100003A48(&qword_100010BC8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003A48(&qword_100010BD0);
  uint64_t v38 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v45 = (char *)&v37 - v16;
  char v39 = v1;
  uint64_t v17 = v1[1];
  uint64_t v49 = *v1;
  uint64_t v50 = v17;
  sub_100003A48(&qword_100010B60);
  sub_100009A20();
  sub_100009650();
  swift_release();
  LOBYTE(v46) = 0;
  sub_100009A40();
  sub_1000096F0();
  sub_100009A50();
  sub_100009810();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v7, v4);
  uint64_t v18 = &v10[*(int *)(v8 + 36)];
  long long v19 = v47;
  *(_OWORD *)uint64_t v18 = v46;
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v48;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100009064(&qword_100010BD8, &qword_100010BC8, (void (*)(void))sub_1000090E0);
  uint64_t v20 = v15;
  uint64_t v44 = v15;
  sub_100009990();
  sub_1000094D8((uint64_t)v10, &qword_100010BC8);
  uint64_t v21 = v12;
  uint64_t v22 = v45;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v45, v20, v11);
  uint64_t v23 = v40;
  sub_100005A04((uint64_t)v39, v40);
  unint64_t v24 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v25 = swift_allocObject();
  sub_1000059A0(v23, v25 + v24);
  sub_100009A50();
  sub_100009810();
  uint64_t v42 = v49;
  LODWORD(v41) = v50;
  uint64_t v40 = v51;
  char v26 = v52;
  uint64_t v27 = v53;
  uint64_t v28 = v54;
  __n128 v29 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  long long v30 = v44;
  long long v31 = v22;
  uint64_t v32 = v38;
  v29(v44, v31, v38);
  char v33 = v43;
  v29(v43, v30, v32);
  uint64_t v34 = &v33[*(int *)(sub_100003A48(&qword_100010BE8) + 48)];
  *(void *)uint64_t v34 = sub_100009264;
  *((void *)v34 + 1) = v25;
  *((void *)v34 + 2) = v42;
  v34[24] = v41;
  *((void *)v34 + 4) = v40;
  v34[40] = v26;
  *((void *)v34 + 6) = v27;
  *((void *)v34 + 7) = v28;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v21 + 8);
  swift_retain();
  v35(v45, v32);
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v35)(v44, v32);
}

uint64_t sub_100007714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v53 = a3;
  uint64_t v5 = sub_100003A48(&qword_100010B30);
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v55 = v5;
  __chkstk_darwin(v5);
  char v52 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SingleTipView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003A48(&qword_100010B38);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100003A48(&qword_100010B40);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100003A48(&qword_100010B48);
  __chkstk_darwin(v56);
  uint64_t v48 = (uint64_t)v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100003A48(&qword_100010B50);
  uint64_t v50 = *(void *)(v19 - 8);
  uint64_t v51 = v19;
  __chkstk_darwin(v19);
  uint64_t v49 = (char *)v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v13 = sub_1000098A0();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  sub_100003A48(&qword_100010B58);
  sub_100007D30(a1, a2);
  sub_100005A04(a2, (uint64_t)v10);
  uint64_t v21 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v22 = (v21 + 16) & ~v21;
  uint64_t v23 = v21 | 7;
  uint64_t v24 = swift_allocObject();
  sub_1000059A0((uint64_t)v10, v24 + v22);
  sub_100009474((uint64_t)v13, (uint64_t)v17, &qword_100010B38);
  uint64_t v25 = &v17[*(int *)(v15 + 44)];
  *(void *)uint64_t v25 = sub_100008E0C;
  *((void *)v25 + 1) = v24;
  *((void *)v25 + 2) = 0;
  *((void *)v25 + 3) = 0;
  sub_1000094D8((uint64_t)v13, &qword_100010B38);
  sub_100005A04(a2, (uint64_t)v10);
  v47[0] = v22 + v9;
  v47[1] = v23;
  uint64_t v26 = swift_allocObject();
  sub_1000059A0((uint64_t)v10, v26 + v22);
  uint64_t v27 = v48;
  sub_100009474((uint64_t)v17, v48, &qword_100010B40);
  uint64_t v28 = (void *)(v27 + *(int *)(v56 + 36));
  *uint64_t v28 = 0;
  v28[1] = 0;
  v28[2] = sub_100008E0C;
  v28[3] = v26;
  sub_1000094D8((uint64_t)v17, &qword_100010B40);
  uint64_t v29 = *(void *)(a2 + 8);
  id v57 = *(id *)a2;
  uint64_t v58 = v29;
  sub_100003A48(&qword_100010B60);
  sub_100009A20();
  long long v30 = (void *)sub_100009660();
  swift_release();
  long long v31 = (void *)sub_1000095E0();

  id v57 = v31;
  sub_100005A04(a2, (uint64_t)v10);
  uint64_t v32 = swift_allocObject();
  sub_1000059A0((uint64_t)v10, v32 + v22);
  sub_100003A48(&qword_100010B68);
  sub_100009064(&qword_100010B70, &qword_100010B48, (void (*)(void))sub_100008E74);
  sub_100008F14();
  char v33 = v49;
  sub_1000099F0();
  swift_release();

  sub_1000094D8(v27, &qword_100010B48);
  uint64_t v34 = *(void *)(a2 + 8);
  id v57 = *(id *)a2;
  uint64_t v58 = v34;
  sub_100009A20();
  sub_100009650();
  swift_release();
  uint64_t v35 = v52;
  sub_100009740();
  swift_release();
  sub_100005A04(a2, (uint64_t)v10);
  uint64_t v36 = swift_allocObject();
  sub_1000059A0((uint64_t)v10, v36 + v22);
  uint64_t v38 = v50;
  uint64_t v37 = v51;
  uint64_t v39 = v53;
  (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v53, v33, v51);
  uint64_t v40 = sub_100003A48(&qword_100010BA0);
  uint64_t v41 = v39 + *(int *)(v40 + 52);
  uint64_t v42 = v39;
  uint64_t v44 = v54;
  uint64_t v43 = v55;
  (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v41, v35, v55);
  uint64_t v45 = (id (**)(void **))(v42 + *(int *)(v40 + 56));
  char *v45 = sub_100008FF4;
  v45[1] = (id (*)(void **))v36;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v35, v43);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v33, v37);
}

uint64_t sub_100007D30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100003A48(&qword_100010BB0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003A48(&qword_100010BB8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009820();
  double v10 = v9;
  sub_100009820();
  sub_100009820();
  double v12 = v11;
  uint64_t v13 = (double *)(a2 + *(int *)(type metadata accessor for SingleTipView() + 32));
  double v14 = v12 * (v13[1] / *v13);
  sub_100009820();
  if (v10 >= v15 || (sub_100009820(), v16 - v14 >= v10))
  {
    sub_100009820();
    sub_1000071C4(v8);
    sub_100009474((uint64_t)v8, (uint64_t)v5, &qword_100010BB8);
  }
  else
  {
    sub_100009820();
    sub_100009820();
    sub_100009820();
    sub_100009820();
    sub_1000071C4(v8);
    sub_100009474((uint64_t)v8, (uint64_t)v5, &qword_100010BB8);
  }
  swift_storeEnumTagMultiPayload();
  sub_100005D3C(&qword_100010BC0, &qword_100010BB8);
  sub_1000098C0();
  return sub_1000094D8((uint64_t)v8, &qword_100010BB8);
}

uint64_t sub_100007F84()
{
  sub_100003A48(&qword_100010B60);
  sub_100009A20();
  char v0 = sub_100009670();
  swift_release();
  sub_100003A48(&qword_100010BA8);
  sub_100009A30();
  sub_100009A20();
  sub_100009A20();
  sub_100009650();
  swift_release();
  if ((v0 & 1) == 1)
  {
    sub_100009720();
    swift_release();
    sub_100009A20();
    sub_100009650();
    swift_release();
    sub_100009750();
  }
  else
  {
    sub_100009730();
    swift_release();
    sub_100009A20();
    sub_100009650();
    swift_release();
    sub_100009710();
  }
  return swift_release();
}

id sub_100008134(void **a1)
{
  unint64_t v1 = *a1;
  sub_100003A48(&qword_100010BA8);
  id result = (id)sub_100009A20();
  if (v3 == 1) {
    return [v1 play];
  }
  return result;
}

uint64_t sub_1000081A8()
{
  return sub_1000099C0();
}

uint64_t sub_1000081C4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  uint64_t v6 = sub_100009AA0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009A90();
  sub_100009B10();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100005A04(v2, (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  uint64_t result = sub_1000059A0((uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  *a2 = sub_100008DF0;
  a2[1] = (uint64_t (*)(uint64_t))v11;
  return result;
}

uint64_t sub_100008374()
{
  return sub_100009850();
}

uint64_t sub_100008398(uint64_t a1)
{
  uint64_t v2 = sub_1000097F0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100009860();
}

uint64_t sub_100008464(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a3[6];
    double v9 = (void *)(a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100003A48(&qword_100010A78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1000097F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *double v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[8];
    *(void *)(a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(_OWORD *)(a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  }
  return a1;
}

uint64_t sub_1000085C8(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_100003A48(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000097F0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100008690(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  double v9 = (void *)(a2 + v7);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100003A48(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1000097F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_1000087A4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[6];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_1000094D8(a1 + v6, &qword_100010A78);
    sub_100003A48(&qword_100010A78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1000097F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

_OWORD *sub_100008900(_OWORD *a1, _OWORD *a2, int *a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100003A48(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1000097F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  return a1;
}

uint64_t sub_1000089F8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[6];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_1000094D8(a1 + v6, &qword_100010A78);
    uint64_t v9 = sub_100003A48(&qword_100010A78);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_1000097F0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_100008B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008B4C);
}

uint64_t sub_100008B4C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100003A48(&qword_100010A80);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100008C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008C14);
}

void *sub_100008C14(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100003A48(&qword_100010A80);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100008CC0()
{
  sub_100008D78();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100008D78()
{
  if (!qword_100010AF0)
  {
    sub_1000097F0();
    unint64_t v0 = sub_100009800();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010AF0);
    }
  }
}

uint64_t sub_100008DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008DF0(uint64_t a1)
{
  return sub_10000927C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100007714);
}

uint64_t sub_100008E18()
{
  return sub_100007F84();
}

unint64_t sub_100008E74()
{
  unint64_t result = qword_100010B78;
  if (!qword_100010B78)
  {
    sub_100005C48(&qword_100010B40);
    sub_100005D3C(&qword_100010B80, &qword_100010B38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B78);
  }
  return result;
}

unint64_t sub_100008F14()
{
  unint64_t result = qword_100010B88;
  if (!qword_100010B88)
  {
    sub_100005C48(&qword_100010B68);
    sub_100008F88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B88);
  }
  return result;
}

unint64_t sub_100008F88()
{
  unint64_t result = qword_100010B90;
  if (!qword_100010B90)
  {
    sub_100005B48(255, &qword_100010B98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B90);
  }
  return result;
}

id sub_100008FF4(void **a1)
{
  type metadata accessor for SingleTipView();

  return sub_100008134(a1);
}

uint64_t sub_100009064(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005C48(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000090E0()
{
  unint64_t result = qword_100010BE0;
  if (!qword_100010BE0)
  {
    sub_100009700();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BE0);
  }
  return result;
}

uint64_t sub_10000913C()
{
  uint64_t v1 = (int *)(type metadata accessor for SingleTipView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  sub_100003A48(&qword_100010A78);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000097F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100009264(uint64_t a1)
{
  return sub_10000927C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100005F3C);
}

uint64_t sub_10000927C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for SingleTipView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_100009310()
{
  unint64_t result = qword_100010C78;
  if (!qword_100010C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010C78);
  }
  return result;
}

unint64_t sub_100009364()
{
  unint64_t result = qword_100010C80;
  if (!qword_100010C80)
  {
    sub_100005C48(&qword_100010C68);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010C80);
  }
  return result;
}

uint64_t sub_100009410(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003A48(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009474(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003A48(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000094D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003A48(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009534()
{
  return sub_100005D3C(&qword_100010C90, &qword_100010C98);
}

uint64_t sub_100009570()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100009580()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009590()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_1000095A0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000095B0()
{
  return dispatch thunk of TipsContentModel.updateContent(alwaysShowIntro:)();
}

uint64_t sub_1000095C0()
{
  return dispatch thunk of TipsContentModel.assetSizes()();
}

uint64_t sub_1000095D0()
{
  return dispatch thunk of TipsContentModel.collection(forTipIdentifier:)();
}

uint64_t sub_1000095E0()
{
  return dispatch thunk of TipsContentModel.currentTip.getter();
}

uint64_t sub_1000095F0()
{
  return dispatch thunk of TipsContentModel.currentTip.setter();
}

uint64_t sub_100009600()
{
  return TipsContentModel.contentDidUpdate.getter();
}

uint64_t sub_100009610()
{
  return dispatch thunk of TipsContentModel.fetchTipAssetsInfo(for:userInterfaceStyle:completionHandler:)();
}

uint64_t sub_100009620()
{
  return dispatch thunk of TipsContentModel.tip(forIdentifier:)();
}

uint64_t sub_100009630()
{
  return static TipsContentModel.shared()();
}

uint64_t sub_100009640()
{
  return type metadata accessor for TipsContentModel();
}

uint64_t sub_100009650()
{
  return dispatch thunk of TipViewModel.assetViewModel.getter();
}

uint64_t sub_100009660()
{
  return TipViewModel.contentModel.getter();
}

uint64_t sub_100009670()
{
  return dispatch thunk of TipViewModel.isCurrentTip.getter();
}

uint64_t sub_100009680()
{
  return TipViewModel.init(collection:tip:assetsInfo:contentModel:onNextHandler:)();
}

uint64_t sub_100009690()
{
  return dispatch thunk of TipViewModel.assetsBaseURL.getter();
}

uint64_t sub_1000096A0()
{
  return dispatch thunk of TipViewModel.assetFileInfoManager.getter();
}

uint64_t sub_1000096B0()
{
  return dispatch thunk of TipViewModel.plainBodyContentOrText.getter();
}

uint64_t sub_1000096C0()
{
  return dispatch thunk of TipViewModel.title.getter();
}

uint64_t sub_1000096D0()
{
  return dispatch thunk of TipViewModel.language.getter();
}

uint64_t sub_1000096E0()
{
  return type metadata accessor for TipViewModel();
}

uint64_t sub_1000096F0()
{
  return RemoteVideoView.init(viewModel:showReplayButtonAtVideoEnd:isImageLoaded:)();
}

uint64_t sub_100009700()
{
  return type metadata accessor for RemoteVideoView();
}

uint64_t sub_100009710()
{
  return dispatch thunk of DocumentAssetViewModel.resetVideo()();
}

uint64_t sub_100009720()
{
  return dispatch thunk of DocumentAssetViewModel.load()();
}

uint64_t sub_100009730()
{
  return dispatch thunk of DocumentAssetViewModel.cancel()();
}

uint64_t sub_100009740()
{
  return dispatch thunk of DocumentAssetViewModel.$player.getter();
}

uint64_t sub_100009750()
{
  return dispatch thunk of DocumentAssetViewModel.playVideo()();
}

uint64_t sub_100009760()
{
  return defaultParagraphSpacing.getter();
}

uint64_t sub_100009770()
{
  return ConstellationContentView.init(rawContent:language:assetsBaseURL:assetFileInfoManager:attributes:size:maxWidth:textIsSelectable:delegate:)();
}

uint64_t sub_100009780()
{
  return type metadata accessor for ConstellationContentView();
}

uint64_t sub_100009790()
{
  return ConstellationContentAttributes.init(font:foregroundColor:accentColor:titleGradientStyle:textAlignment:paragraphSpacing:paragraphStyle:numberOfLines:lineBreakMode:symbolScale:useForegroundColorForSymbol:displayLinkStyle:typeSettingLanguage:supportsLinks:)();
}

uint64_t sub_1000097A0()
{
  return type metadata accessor for ConstellationContentAttributes();
}

uint64_t sub_1000097B0()
{
  return type metadata accessor for ConstellationContentParagraphStyle();
}

uint64_t sub_1000097C0()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_1000097D0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1000097E0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000097F0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100009800()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100009810()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100009820()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100009830()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t sub_100009840()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100009850()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100009860()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100009870()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100009880()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t sub_100009890()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_1000098A0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000098B0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000098C0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000098D0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000098E0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000098F0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100009900()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100009910()
{
  return static Font.title.getter();
}

uint64_t sub_100009920()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_100009930()
{
  return Font.init(_:)();
}

uint64_t sub_100009940()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100009950()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100009960()
{
  return Text.font(_:)();
}

uint64_t sub_100009970()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100009980()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100009990()
{
  return View.assetContentMode(_:)();
}

uint64_t sub_1000099A0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000099B0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000099C0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000099D0()
{
  return View.hyphenationFactor(_:)();
}

uint64_t sub_1000099E0()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_1000099F0()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_100009A00()
{
  return static Color.secondary.getter();
}

uint64_t sub_100009A10()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100009A20()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100009A30()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100009A40()
{
  return static Binding.constant(_:)();
}

uint64_t sub_100009A50()
{
  return static Alignment.center.getter();
}

uint64_t sub_100009A60()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100009A70()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100009A80()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100009A90()
{
  return static TipsLog.default.getter();
}

uint64_t sub_100009AA0()
{
  return type metadata accessor for TipsLog();
}

uint64_t sub_100009AB0()
{
  return static UserGuideTopic.isValidIdentifier(_:)();
}

uint64_t sub_100009AC0()
{
  return UserGuideTopic.init(searchableItemUniqueIdentifier:)();
}

uint64_t sub_100009AD0()
{
  return dispatch thunk of UserGuideTopic.topicId.getter();
}

uint64_t sub_100009AE0()
{
  return dispatch thunk of UserGuideTopic.version.getter();
}

uint64_t sub_100009AF0()
{
  return dispatch thunk of UserGuideTopic.productId.getter();
}

uint64_t sub_100009B00()
{
  return type metadata accessor for UserGuideTopic();
}

uint64_t sub_100009B10()
{
  return logDebug(_:_:)();
}

uint64_t sub_100009B20()
{
  return logError(_:_:)();
}

NSString sub_100009B30()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009B40()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_100009B50(Swift::String a1)
{
}

NSArray sub_100009B60()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009B70()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100009B80()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100009B90()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100009BA0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100009BB0()
{
  return static UIFont.fontWithStyle(_:size:)();
}

uint64_t sub_100009BC0()
{
  return static UIFont.defaultHyphenationFactor.getter();
}

uint64_t sub_100009BD0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_100009BE0(Swift::Int a1)
{
}

uint64_t sub_100009BF0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100009C00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009C10()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100009C20()
{
  return Error._code.getter();
}

uint64_t sub_100009C30()
{
  return Error._domain.getter();
}

uint64_t sub_100009C40()
{
  return Error._userInfo.getter();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}