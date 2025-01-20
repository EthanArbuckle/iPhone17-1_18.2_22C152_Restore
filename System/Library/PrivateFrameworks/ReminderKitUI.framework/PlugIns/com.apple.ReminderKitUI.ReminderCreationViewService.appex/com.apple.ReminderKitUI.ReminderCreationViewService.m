uint64_t sub_100002BF8(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(char *, _UNKNOWN **, uint64_t, uint64_t);
  char *v7;
  char *v8;
  void (*v9)(void);
  id v10;

  v3 = &v1[qword_10002E538];
  swift_beginAccess();
  sub_10000E41C(a1, (uint64_t)v3);
  swift_endAccess();
  if (*(void *)v3)
  {
    v4 = *((void *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v4 + 40);
    swift_unknownObjectRetain();
    v7 = v1;
    v6(v1, &off_100029050, ObjectType, v4);
    v8 = &v7[*(void *)((swift_isaMask & *(void *)v7) + 0x68)];
    swift_beginAccess();
    if (*(void *)v8)
    {
      v9 = *(void (**)(void))(v4 + 64);
      v10 = *(id *)(*(void *)v8 + qword_10002D940);
      v9();
    }
    swift_unknownObjectRelease();
  }
  return sub_10000EA64(a1, &qword_10002DCA8);
}

uint64_t sub_100002D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v6 = sub_100006B9C(&qword_10002DCA0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100021D10();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v3[qword_10002E538];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_OWORD *)v13 + 2) = 0u;
  unint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  v14 = v3;
  sub_100022710(31);
  swift_bridgeObjectRelease();
  unint64_t v24 = 0xD00000000000001DLL;
  unint64_t v25 = 0x8000000100023B70;
  sub_100021D00();
  uint64_t v15 = sub_100021CF0();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v26._countAndFlagsBits = v15;
  v26._object = v17;
  sub_100022540(v26);
  swift_bridgeObjectRelease();
  v18 = &v14[qword_10002E530];
  uint64_t v19 = v23;
  *(void *)v18 = a1;
  *((void *)v18 + 1) = v19;

  sub_10000EAC0(a3, (uint64_t)v8, &qword_10002DCA0);
  uint64_t v20 = sub_100021E40();
  sub_10000EA64(a3, &qword_10002DCA0);
  return v20;
}

uint64_t sub_100002F60()
{
  return 3;
}

id sub_100002F68(uint64_t a1)
{
  return [*(id *)(a1 + qword_10002D940) setDelegate:0];
}

uint64_t sub_100002F84(uint64_t a1)
{
  uint64_t v2 = v1;
  v3 = *(void **)(a1 + qword_10002D940);
  NSString v4 = sub_100022500();
  [v3 setAccessibilityIdentifier:v4];

  (*(void (**)(uint64_t, void))((swift_isaMask & *v3) + 0x70))(8, 0);
  v5 = (void *)(v2 + qword_10002E538);
  uint64_t result = swift_beginAccess();
  if (*v5)
  {
    uint64_t v7 = v5[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 64);
    swift_unknownObjectRetain();
    v9(v3, ObjectType, v7);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000030A0(unsigned char *a1)
{
  v47 = a1;
  type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v42 = (uint64_t)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B9C(&qword_10002DB48);
  ((void (*)(void))__chkstk_darwin)();
  NSString v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021FC0();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ReminderNotesCellContentState = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  uint64_t v8 = *(void *)(ReminderNotesCellContentState - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B9C(&qword_10002DCA0);
  ((void (*)(void))__chkstk_darwin)();
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B9C(&qword_10002DD88);
  uint64_t v13 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v44 = (uint64_t)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v42 - v15;
  uint64_t v17 = *(void *)((swift_isaMask & *v1) + 0x78);
  v48 = v1;
  uint64_t v18 = (uint64_t)v1 + v17;
  swift_beginAccess();
  uint64_t v45 = v18;
  sub_10000EAC0(v18, (uint64_t)v12, &qword_10002DCA0);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v46 = v8 + 48;
  if (v19(v12, 1, ReminderNotesCellContentState) == 1)
  {
    uint64_t v20 = sub_100022130();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v16, 1, 1, v20);
  }
  else
  {
    sub_10000E484((uint64_t)v12, (uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
    sub_10000E4EC((uint64_t)v10, (uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    v21 = *(void **)&v10[*(int *)(ReminderNotesCellContentState + 20)];
    sub_100022120();
    swift_bridgeObjectRetain();
    id v22 = v21;
    sub_10000A39C((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
    uint64_t v23 = sub_100022130();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v16, 0, 1, v23);
  }
  unint64_t v24 = (void *)((char *)v48 + qword_10002E538);
  swift_beginAccess();
  if (*v24)
  {
    uint64_t v25 = v24[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v26 = v44;
    sub_10000EAC0((uint64_t)v16, v44, &qword_10002DD88);
    v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
    swift_unknownObjectRetain();
    v27(v26, ObjectType, v25);
    swift_unknownObjectRelease();
  }
  uint64_t v28 = v45;
  if (v19((char *)v45, 1, ReminderNotesCellContentState))
  {
    uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(ReminderNotesCellContent - 8) + 56))(v4, 1, 1, ReminderNotesCellContent);
  }
  else
  {
    sub_10000EAC0(v28 + *(int *)(ReminderNotesCellContentState + 32), (uint64_t)v4, &qword_10002DB48);
    uint64_t v30 = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 48))(v4, 1, v30) != 1)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v40 = v42;
        sub_10000E484((uint64_t)v4, v42, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
        sub_100003960(v40);
        sub_10000A39C(v40, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
      }
      else
      {
        v41 = *(void **)v4;
        sub_1000037C8(*(void **)v4, v4[8]);
      }
LABEL_12:
      sub_100003BA4();
      return sub_10000EA64((uint64_t)v16, &qword_10002DD88);
    }
  }
  if (v47[qword_10002D960 + 8] == 2 && !*(void *)&v47[qword_10002D960]) {
    goto LABEL_12;
  }
  v31 = v16;
  v32 = v47;
  v33 = *(void **)&v47[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v32;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = sub_10000E9F0;
  *(void *)(v35 + 24) = v34;
  aBlock[4] = sub_10000EA44;
  aBlock[5] = v35;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001EBE8;
  aBlock[3] = &unk_1000290B8;
  v36 = _Block_copy(aBlock);
  id v37 = v32;
  swift_retain();
  swift_release();
  v38 = v33;
  v16 = v31;
  [v38 performBatchUpdates:v36];
  _Block_release(v36);
  LOBYTE(v36) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v36 & 1) == 0) {
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000037C8(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void **)&v3[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + 24) = a1;
  *(unsigned char *)(v8 + 32) = a2 & 1;
  *(void *)(v8 + 40) = ObjectType;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10000EB68;
  *(void *)(v9 + 24) = v8;
  v14[4] = sub_10000EEE4;
  v14[5] = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10001EBE8;
  v14[3] = &unk_100029130;
  uint64_t v10 = _Block_copy(v14);
  uint64_t v11 = v3;
  id v12 = a1;
  swift_retain();
  swift_release();
  [v7 performBatchUpdates:v10];
  _Block_release(v10);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100003960(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = *(void *)(type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin();
  uint64_t v6 = *(void **)&v1[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  sub_10000E4EC(a1, (uint64_t)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v1;
  sub_10000E484((uint64_t)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  *(void *)(v8 + ((v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8)) = ObjectType;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10000EC9C;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = sub_10000EEE4;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001EBE8;
  aBlock[3] = &unk_1000291A8;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = v1;
  swift_retain();
  swift_release();
  [v6 performBatchUpdates:v10];
  _Block_release(v10);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v6) {
    __break(1u);
  }
  return result;
}

id sub_100003BA4()
{
  uint64_t v1 = (void *)((char *)v0 + *(void *)((swift_isaMask & *v0) + 0x68));
  id result = (id)swift_beginAccess();
  if (*v1)
  {
    id result = [*(id *)(*v1 + qword_10002D940) attributedText];
    if (!result)
    {
      BOOL v9 = 0;
      uint64_t v10 = *v1;
      if (!*v1) {
        return result;
      }
      return [*(id *)(v10 + qword_10002D948) setHidden:v9];
    }
    uint64_t v3 = result;
    id v4 = [result string];

    uint64_t v5 = sub_100022510();
    unint64_t v7 = v6;

    id result = (id)swift_bridgeObjectRelease();
    uint64_t v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v9 = v8 != 0;
    uint64_t v10 = *v1;
    if (*v1) {
      return [*(id *)(v10 + qword_10002D948) setHidden:v9];
    }
  }
  return result;
}

void sub_100003CBC()
{
}

uint64_t sub_100003CEC()
{
  swift_bridgeObjectRelease();
  return sub_10000EA64(v0 + qword_10002E538, &qword_10002DCA8);
}

uint64_t sub_100003D30(uint64_t a1)
{
  return sub_10000EA64(a1 + qword_10002E538, &qword_10002DCA8);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesCellContent(uint64_t a1)
{
  return sub_10000CC8C(a1, qword_10002D800);
}

uint64_t sub_100003D9C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100003DE8()
{
  return type metadata accessor for TTRIExtensionCreateReminderNotesCellContent(0);
}

void *sub_100003DF0()
{
  uint64_t v1 = (void **)((char *)v0 + *(void *)((swift_isaMask & *v0) + 0x68));
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (!v2) {
    return 0;
  }
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3) {
    id v4 = v2;
  }
  return v3;
}

id sub_100003EA8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_10000E140(a3);
}

void sub_100003EB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[qword_10002D960];
  if (v0[qword_10002D960 + 8])
  {
    if (v0[qword_10002D960 + 8] == 1)
    {
      uint64_t v3 = *(void **)&v0[direct field offset for TTRIStaticTableViewBaseCell.containerView];
      id v4 = v2;
      [v3 setAxis:1];
      [v3 setSpacing:8.0];
      uint64_t v5 = *(void **)&v1[qword_10002D958];
      [v5 setHidden:0];
      sub_100006B9C(&qword_10002DD48);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_100023040;
      *(void *)(v6 + 32) = v4;
      sub_100022590();
      sub_10000E8D8(0, &qword_10002DD50);
      Class v7 = (Class)v4;
      Class isa = sub_100022570().super.isa;
      swift_bridgeObjectRelease();
      [v5 setArrangedSubviews:isa];

      objc_msgSend(v5, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      [v5 setVerticalAlignment:0];
      [v5 setHorizontalAlignment:1];
    }
    else
    {
      [*(id *)&v0[direct field offset for TTRIStaticTableViewBaseCell.containerView] setAxis:0];
      uint64_t v5 = *(void **)&v0[qword_10002D958];
      [v5 setHidden:1];
      sub_10000E8D8(0, &qword_10002DD50);
      Class v7 = sub_100022570().super.isa;
      [v5 setArrangedSubviews:v7];
    }
  }
  else
  {
    BOOL v9 = *(void **)&v0[direct field offset for TTRIStaticTableViewBaseCell.containerView];
    id v10 = v2;
    [v9 setAxis:0];
    [v9 setSpacing:12.0];
    uint64_t v5 = *(void **)&v1[qword_10002D958];
    [v5 setHidden:0];
    sub_100006B9C(&qword_10002DD48);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100023040;
    *(void *)(v11 + 32) = v10;
    sub_100022590();
    sub_10000E8D8(0, &qword_10002DD50);
    Class v7 = (Class)v10;
    Class v12 = sub_100022570().super.isa;
    swift_bridgeObjectRelease();
    [v5 setArrangedSubviews:v12];

    objc_msgSend(v5, "setLayoutMargins:", 15.0, 0.0, 0.0, 0.0);
    [v5 setVerticalAlignment:1];
    [v5 setHorizontalAlignment:0];
  }

  sub_100006B9C(&qword_10002DD68);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100023050;
  uint64_t v14 = *(void **)&v1[qword_10002D940];
  *(void *)(v13 + 56) = sub_100021F60();
  *(void *)(v13 + 32) = v14;
  id v15 = v14;
  if ([v5 isHidden])
  {
    id v16 = 0;
    uint64_t v17 = 0;
    *(void *)(v13 + 72) = 0;
    *(void *)(v13 + 80) = 0;
  }
  else
  {
    uint64_t v17 = sub_10000E8D8(0, &qword_10002DD70);
    id v16 = v5;
  }
  *(void *)(v13 + 64) = v16;
  *(void *)(v13 + 88) = v17;
  sub_100006B9C(&qword_10002DD78);
  sub_10000E914();
  sub_100022560();
  swift_bridgeObjectRelease();
  Class v18 = sub_100022570().super.isa;
  swift_bridgeObjectRelease();
  [v1 setAccessibilityElements:v18];
}

void sub_1000042FC(uint64_t a1, void *a2, char a3)
{
  uint64_t v5 = a1 + qword_10002D960;
  if (*(unsigned char *)(a1 + qword_10002D960 + 8))
  {
    id v6 = [objc_allocWithZone((Class)UIImageView) init];
    [v6 setContentMode:2];
    [v6 setClipsToBounds:1];
    id v7 = [v6 layer];
    [v7 setCornerCurve:kCACornerCurveContinuous];

    id v8 = *(id *)v5;
    *(void *)uint64_t v5 = v6;
    *(unsigned char *)(v5 + 8) = 0;
    id v12 = v6;

    sub_100003EB0();
  }
  else
  {
    id v12 = *(id *)v5;
  }
  id v9 = a2;
  [v12 setImage:a2];
  id v10 = [v12 layer];
  double v11 = 0.0;
  if (a3)
  {
    if (qword_10002D7A0 != -1) {
      swift_once();
    }
    double v11 = *(double *)&qword_10002D7A8;
  }
  [v10 setCornerRadius:v11];
}

void sub_1000044AC(uint64_t a1, uint64_t a2)
{
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  __chkstk_darwin();
  id v6 = (void **)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v7 = (id *)(a1 + qword_10002D960);
  if (*(unsigned char *)(a1 + qword_10002D960 + 8) == 1)
  {
    id v8 = *v7;
    id v9 = *v7;
    sub_10000E4EC(a2, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_10000E4EC(a2, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  }
  id v9 = sub_10000E554(v6, a1);
LABEL_6:
  sub_10000A39C((uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  id v10 = *(void **)(a2 + *(int *)(ReminderView + 24));
  if (v10)
  {
    double v11 = *(void (**)(void))((swift_isaMask & *v9) + 0x68);
    id v12 = v10;
    v11();
  }
}

char *sub_10000461C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v4 = &v3[qword_10002D960];
  *(void *)id v4 = 0;
  v4[8] = 2;
  *(void *)&v3[qword_10002D968] = 0;
  id v5 = objc_allocWithZone((Class)sub_100021F60());
  id v6 = v3;
  id v7 = (void *)sub_100021F50();
  [v7 setScrollEnabled:1];
  [v7 setShowsVerticalScrollIndicator:1];
  sub_10000E8D8(0, &qword_10002DD40);
  id v8 = v7;
  id v9 = (void *)sub_100022680();
  [v8 setFont:v9];

  [v8 setAdjustsFontForContentSizeCategory:1];
  id v10 = self;
  id v11 = v8;
  id v12 = [v10 labelColor];
  [v11 setTextColor:v12];

  [v11 setEditable:1];
  [v11 setBackgroundColor:0];
  LODWORD(v13) = 1132068864;
  [v11 setContentHuggingPriority:0 forAxis:v13];
  id v14 = [objc_allocWithZone((Class)UILabel) init];
  [v14 setNumberOfLines:0];
  id v15 = (void *)sub_100022680();
  [v14 setFont:v15];

  [v14 setAdjustsFontForContentSizeCategory:1];
  [v14 setTextAlignment:4];
  [v14 setUserInteractionEnabled:0];
  id v16 = [v10 placeholderTextColor];
  [v14 setTextColor:v16];

  v54._object = (void *)0x8000000100023CB0;
  v53._countAndFlagsBits = 0x7365746F4ELL;
  v53._object = (void *)0xE500000000000000;
  v54._countAndFlagsBits = 0xD000000000000033;
  sub_100021DF0(v53, v54);
  NSString v17 = sub_100022500();
  swift_bridgeObjectRelease();
  [v14 setText:v17];

  sub_100006B9C(&qword_10002DD48);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100023060;
  *(void *)(v18 + 32) = v11;
  *(void *)(v18 + 40) = v14;
  uint64_t v52 = v18;
  sub_100022590();
  id v19 = objc_allocWithZone((Class)NUIContainerBoxView);
  sub_10000E8D8(0, &qword_10002DD50);
  id v20 = v11;
  id v21 = v14;
  Class isa = sub_100022570().super.isa;
  swift_bridgeObjectRelease();
  id v23 = [v19 initWithArrangedSubviews:isa];

  [v23 setHorizontalAlignment:0];
  [v23 setVerticalAlignment:0];
  [v23 setAlignment:1 forView:v21 inAxis:1];
  id v24 = objc_allocWithZone((Class)NUIContainerBoxView);
  Class v25 = sub_100022570().super.isa;
  id v26 = [v24 initWithArrangedSubviews:v25];

  [v26 setLayoutMarginsRelativeArrangement:1];
  sub_100006B9C(&qword_10002DD58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100023050;
  *(void *)(inited + 32) = v23;
  *(_DWORD *)(inited + 40) = 1132068864;
  *(void *)(inited + 48) = v26;
  *(_DWORD *)(inited + 56) = 1144750080;
  id v28 = v23;
  id v29 = v26;
  sub_100022690();
  swift_setDeallocating();
  sub_100006B9C(&qword_10002DD60);
  swift_arrayDestroy();
  [v28 setDebugBoundingBoxesEnabled:0];
  [v29 setDebugBoundingBoxesEnabled:0];
  *(void *)&v6[qword_10002D940] = v20;
  *(void *)&v6[qword_10002D948] = v21;
  *(void *)&v6[qword_10002D950] = v28;
  *(void *)&v6[qword_10002D958] = v29;
  id v30 = v20;
  id v31 = v21;
  id v32 = v28;
  id v33 = v29;

  if (a3)
  {
    NSString v34 = sub_100022500();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v34 = 0;
  }
  v51.receiver = v6;
  v51.super_class = ObjectType;
  uint64_t v35 = (char *)objc_msgSendSuper2(&v51, "initWithStyle:reuseIdentifier:", a1, v34);

  v36 = *(void **)&v35[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  id v37 = v35;
  [v36 setEdgesPreservingSuperviewLayoutMargins:10];
  [v36 layoutMargins];
  [v36 setLayoutMargins:12.0];
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_100023060;
  *(void *)(v38 + 32) = v32;
  *(void *)(v38 + 40) = v33;
  uint64_t v52 = v38;
  sub_100022590();
  id v39 = v32;
  id v40 = v33;
  id v41 = v36;
  Class v42 = sub_100022570().super.isa;
  swift_bridgeObjectRelease();
  [v41 setArrangedSubviews:v42];

  id v43 = v39;
  id v44 = sub_100004CDC();
  [v43 setDelegate:v44];

  id v45 = v40;
  id v46 = sub_100004CDC();
  [v45 setDelegate:v46];

  [v37 setIsAccessibilityElement:0];
  sub_100003EB0();

  return v37;
}

id sub_100004CDC()
{
  uint64_t v1 = qword_10002D968;
  uint64_t v2 = *(void **)(v0 + qword_10002D968);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_10002D968);
  }
  else
  {
    id v4 = (objc_class *)type metadata accessor for CustomSizeMeasurer();
    id v5 = objc_allocWithZone(v4);
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    v10.receiver = v5;
    v10.super_class = v4;
    id v6 = objc_msgSendSuper2(&v10, "init");
    id v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

char *sub_100004D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    a4 = sub_100022510();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return sub_10000461C(a3, a4, v6);
}

void sub_100004DD0(char *a1, uint64_t a2, void *a3)
{
  id v4 = &a1[qword_10002D960];
  *(void *)id v4 = 0;
  v4[8] = 2;
  *(void *)&a1[qword_10002D968] = 0;
  id v5 = a3;

  sub_100022780();
  __break(1u);
}

void sub_100004E60()
{
  uint64_t v1 = (char *)objc_allocWithZone(v0);
  uint64_t v2 = &v1[qword_10002D960];
  *(void *)uint64_t v2 = 0;
  v2[8] = 2;
  *(void *)&v1[qword_10002D968] = 0;

  sub_100022780();
  __break(1u);
}

void *sub_100004EEC()
{
  uint64_t v1 = *(void **)(v0 + qword_10002D940);
  id v2 = v1;
  return v1;
}

void sub_100004F1C()
{
  qword_10002D7A8 = 0x4030000000000000;
}

void sub_100004F2C()
{
  uint64_t v1 = *(void **)(v0 + qword_10002D968);
}

void sub_100004FAC(uint64_t a1)
{
  id v2 = *(void **)(a1 + qword_10002D968);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesTableCell(uint64_t a1)
{
  return sub_10000CC8C(a1, qword_10002D998);
}

uint64_t sub_100005058()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000050B8()
{
  return type metadata accessor for TTRIExtensionCreateReminderNotesTableCell(0);
}

id sub_100005170()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CustomSizeMeasurer()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for TTRIExtensionCreateReminderNotesTableCell.Layout(id *a1)
{
}

uint64_t assignWithCopy for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t initializeWithTake for TTRIExtensionCreateReminderViewModel.Image(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)id result = v2;
  return result;
}

uint64_t assignWithTake for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)id result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100005338(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100005354(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)id result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TTRIExtensionCreateReminderNotesTableCell.Layout()
{
  return &type metadata for TTRIExtensionCreateReminderNotesTableCell.Layout;
}

char *sub_10000537C(char *a1, char **a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    id v9 = *a2;
    *(void *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    id v6 = a3;
    uint64_t v7 = sub_100021FC0();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v8 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            v57 = *a2;
            *(void *)a1 = *a2;
            v58 = v57;
            goto LABEL_33;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v56 = sub_100021CE0();
            (*(void (**)(char *, char **, uint64_t))(*(void *)(v56 - 8) + 16))(a1, a2, v56);
LABEL_33:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
            break;
        }
        v59 = (int *)sub_100021F90();
        uint64_t v60 = v59[5];
        v61 = &a1[v60];
        v62 = (char *)a2 + v60;
        uint64_t v63 = *(uint64_t *)((char *)a2 + v60 + 8);
        if (!v63) {
          goto LABEL_37;
        }
        *(void *)v61 = *(void *)v62;
        *((void *)v61 + 1) = v63;
        v64 = (void *)*((void *)v62 + 2);
        uint64_t v65 = *((void *)v62 + 3);
        uint64_t v66 = *((void *)v62 + 4);
        uint64_t v67 = *((void *)v62 + 5);
        uint64_t v129 = *((void *)v62 + 6);
        uint64_t v136 = *((void *)v62 + 7);
        unsigned __int8 v131 = v62[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v64, v65, v66, v67, v129, v136, v131);
        *((void *)v61 + 2) = v64;
        *((void *)v61 + 3) = v65;
        *((void *)v61 + 4) = v66;
        *((void *)v61 + 5) = v67;
        *((void *)v61 + 6) = v129;
        *((void *)v61 + 7) = v136;
        v61[64] = v131;
        *(_DWORD *)(v61 + 65) = *(_DWORD *)(v62 + 65);
        int v68 = v62[120];
        if (v68 == 255)
        {
          long long v69 = *(_OWORD *)(v62 + 88);
          *(_OWORD *)(v61 + 72) = *(_OWORD *)(v62 + 72);
          *(_OWORD *)(v61 + 88) = v69;
          *(_OWORD *)(v61 + 104) = *(_OWORD *)(v62 + 104);
          v61[120] = v62[120];
        }
        else
        {
          char v137 = v68 & 1;
          uint64_t v73 = *((void *)v62 + 10);
          uint64_t v74 = *((void *)v62 + 11);
          uint64_t v75 = *((void *)v62 + 12);
          uint64_t v76 = *((void *)v62 + 13);
          uint64_t v130 = *((void *)v62 + 14);
          v132 = (void *)*((void *)v62 + 9);
          sub_100006B40(v132, v73, v74, v75, v76, v130, v68 & 1);
          *((void *)v61 + 9) = v132;
          *((void *)v61 + 10) = v73;
          *((void *)v61 + 11) = v74;
          *((void *)v61 + 12) = v75;
          *((void *)v61 + 13) = v76;
          *((void *)v61 + 14) = v130;
          v61[120] = v137;
        }
        v61[121] = v62[121];
        goto LABEL_40;
      case 1u:
        uint64_t v10 = sub_100021FF0();
        v140 = v6;
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            v81 = *a2;
            *(void *)a1 = *a2;
            v82 = v81;
            goto LABEL_44;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v80 = sub_100021CE0();
            (*(void (**)(char *, char **, uint64_t))(*(void *)(v80 - 8) + 16))(a1, a2, v80);
LABEL_44:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
            break;
        }
        v59 = (int *)sub_100021F90();
        uint64_t v83 = v59[5];
        v61 = &a1[v83];
        v62 = (char *)a2 + v83;
        uint64_t v84 = *(uint64_t *)((char *)a2 + v83 + 8);
        if (v84)
        {
          *(void *)v61 = *(void *)v62;
          *((void *)v61 + 1) = v84;
          v85 = (void *)*((void *)v62 + 2);
          uint64_t v86 = *((void *)v62 + 3);
          uint64_t v87 = *((void *)v62 + 4);
          uint64_t v88 = *((void *)v62 + 5);
          uint64_t v89 = *((void *)v62 + 6);
          uint64_t v133 = *((void *)v62 + 7);
          unsigned __int8 v138 = v62[64];
          swift_bridgeObjectRetain();
          sub_100006B18(v85, v86, v87, v88, v89, v133, v138);
          *((void *)v61 + 2) = v85;
          *((void *)v61 + 3) = v86;
          *((void *)v61 + 4) = v87;
          *((void *)v61 + 5) = v88;
          *((void *)v61 + 6) = v89;
          *((void *)v61 + 7) = v133;
          v61[64] = v138;
          *(_DWORD *)(v61 + 65) = *(_DWORD *)(v62 + 65);
          int v90 = v62[120];
          if (v90 == 255)
          {
            long long v91 = *(_OWORD *)(v62 + 88);
            *(_OWORD *)(v61 + 72) = *(_OWORD *)(v62 + 72);
            *(_OWORD *)(v61 + 88) = v91;
            *(_OWORD *)(v61 + 104) = *(_OWORD *)(v62 + 104);
            v61[120] = v62[120];
          }
          else
          {
            char v139 = v90 & 1;
            v93 = (void *)*((void *)v62 + 9);
            uint64_t v92 = *((void *)v62 + 10);
            uint64_t v94 = *((void *)v62 + 11);
            uint64_t v95 = *((void *)v62 + 12);
            uint64_t v96 = *((void *)v62 + 13);
            uint64_t v134 = *((void *)v62 + 14);
            sub_100006B40(v93, v92, v94, v95, v96, v134, v90 & 1);
            *((void *)v61 + 9) = v93;
            *((void *)v61 + 10) = v92;
            *((void *)v61 + 11) = v94;
            *((void *)v61 + 12) = v95;
            *((void *)v61 + 13) = v96;
            *((void *)v61 + 14) = v134;
            v61[120] = v139;
          }
          id v6 = v140;
          v61[121] = v62[121];
        }
        else
        {
LABEL_37:
          long long v70 = *((_OWORD *)v62 + 5);
          *((_OWORD *)v61 + 4) = *((_OWORD *)v62 + 4);
          *((_OWORD *)v61 + 5) = v70;
          *((_OWORD *)v61 + 6) = *((_OWORD *)v62 + 6);
          *(_OWORD *)(v61 + 106) = *(_OWORD *)(v62 + 106);
          long long v71 = *((_OWORD *)v62 + 1);
          *(_OWORD *)v61 = *(_OWORD *)v62;
          *((_OWORD *)v61 + 1) = v71;
          long long v72 = *((_OWORD *)v62 + 3);
          *((_OWORD *)v61 + 2) = *((_OWORD *)v62 + 2);
          *((_OWORD *)v61 + 3) = v72;
        }
LABEL_40:
        a1[v59[6]] = *((unsigned char *)a2 + v59[6]);
        a1[v59[7]] = *((unsigned char *)a2 + v59[7]);
        a1[v59[8]] = *((unsigned char *)a2 + v59[8]);
        a1[v59[9]] = *((unsigned char *)a2 + v59[9]);
        a1[v59[10]] = *((unsigned char *)a2 + v59[10]);
        uint64_t v77 = v59[11];
        v78 = *(char **)((char *)a2 + v77);
        *(void *)&a1[v77] = v78;
        id v79 = v78;
        goto LABEL_65;
      case 2u:
        id v11 = *a2;
        *(void *)a1 = *a2;
        uint64_t v12 = *(int *)(sub_100021F70() + 20);
        double v13 = (void **)&a1[v12];
        id v14 = (void **)((char *)a2 + v12);
        uint64_t v15 = sub_100021FF0();
        uint64_t v16 = *(void *)(v15 - 8);
        NSString v17 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48);
        uint64_t v18 = v11;
        if (v17(v14, 1, v15)) {
          goto LABEL_11;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            v98 = *v14;
            char *v13 = *v14;
            id v99 = v98;
            goto LABEL_54;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v97 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v97 - 8) + 16))(v13, v14, v97);
LABEL_54:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v13, v14, *(void *)(v16 + 64));
            break;
        }
        goto LABEL_64;
      case 3u:
        id v19 = *a2;
        *(void *)a1 = *a2;
        uint64_t v20 = *(int *)(sub_100021F70() + 20);
        double v13 = (void **)&a1[v20];
        id v14 = (void **)((char *)a2 + v20);
        uint64_t v15 = sub_100021FF0();
        uint64_t v16 = *(void *)(v15 - 8);
        id v21 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48);
        id v22 = v19;
        if (v21(v14, 1, v15)) {
          goto LABEL_11;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            Class v42 = *v14;
            char *v13 = *v14;
            id v43 = v42;
            goto LABEL_63;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v103 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v103 - 8) + 16))(v13, v14, v103);
LABEL_63:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v13, v14, *(void *)(v16 + 64));
            break;
        }
        goto LABEL_64;
      case 4u:
        id v23 = *a2;
        *(void *)a1 = *a2;
        uint64_t v24 = *(int *)(sub_100021F70() + 20);
        double v13 = (void **)&a1[v24];
        id v14 = (void **)((char *)a2 + v24);
        uint64_t v15 = sub_100021FF0();
        uint64_t v16 = *(void *)(v15 - 8);
        Class v25 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48);
        id v26 = v23;
        if (v25(v14, 1, v15))
        {
LABEL_11:
          uint64_t v27 = sub_100006B9C(&qword_10002DB38);
          memcpy(v13, v14, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
            case 8u:
            case 9u:
              v101 = *v14;
              char *v13 = *v14;
              id v102 = v101;
              goto LABEL_60;
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 6u:
              uint64_t v100 = sub_100021CE0();
              (*(void (**)(void **, void **, uint64_t))(*(void *)(v100 - 8) + 16))(v13, v14, v100);
LABEL_60:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v13, v14, *(void *)(v16 + 64));
              break;
          }
LABEL_64:
          (*(void (**)(void **, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
        }
LABEL_65:
        swift_storeEnumTagMultiPayload();
LABEL_66:
        uint64_t v104 = v6[5];
        uint64_t v105 = v6[6];
        v106 = *(char **)((char *)a2 + v104);
        *(void *)&a1[v104] = v106;
        a1[v105] = *((unsigned char *)a2 + v105);
        uint64_t v107 = v6[8];
        *(void *)&a1[v6[7]] = *(char **)((char *)a2 + v6[7]);
        v108 = &a1[v107];
        v109 = (void **)((char *)a2 + v107);
        uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
        uint64_t v111 = *(void *)(ReminderNotesCellContent - 8);
        v112 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v111 + 48);
        id v113 = v106;
        swift_bridgeObjectRetain();
        if (v112(v109, 1, ReminderNotesCellContent))
        {
          uint64_t v114 = sub_100006B9C(&qword_10002DB48);
          memcpy(v108, v109, *(void *)(*(void *)(v114 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v115 = *v109;
            *(void *)v108 = *v109;
            uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
            uint64_t v117 = *(int *)(ReminderView + 20);
            v141 = (char *)v109 + v117;
            v142 = &v108[v117];
            uint64_t v118 = sub_100021CB0();
            v119 = a1;
            v120 = *(void (**)(char *, char *, uint64_t))(*(void *)(v118 - 8) + 16);
            id v121 = v115;
            v120(v142, v141, v118);
            a1 = v119;
            uint64_t v122 = *(int *)(ReminderView + 24);
            v123 = *(void **)((char *)v109 + v122);
            *(void *)&v108[v122] = v123;
            id v124 = v123;
          }
          else
          {
            v125 = *v109;
            char v126 = *((unsigned char *)v109 + 8);
            id v127 = v125;
            *(void *)v108 = v125;
            v108[8] = v126;
          }
          swift_storeEnumTagMultiPayload();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v111 + 56))(v108, 0, 1, ReminderNotesCellContent);
        }
        break;
      case 5u:
        *(void *)a1 = *a2;
        a1[8] = *((unsigned char *)a2 + 8);
        *(_WORD *)(a1 + 9) = *(_WORD *)((char *)a2 + 9);
        id v28 = a2[2];
        *((void *)a1 + 2) = v28;
        id v29 = v28;
        goto LABEL_65;
      case 6u:
        id v37 = *a2;
        *(void *)a1 = *a2;
        uint64_t v38 = v37;
        goto LABEL_65;
      case 7u:
        uint64_t v30 = sub_100021FA0();
        uint64_t v31 = *(void *)(v30 - 8);
        if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v31 + 48))(a2, 1, v30))
        {
          uint64_t v32 = sub_100006B9C(&qword_10002DB40);
          memcpy(a1, a2, *(void *)(*(void *)(v32 - 8) + 64));
        }
        else
        {
          *(void *)a1 = *a2;
          uint64_t v44 = *(int *)(v30 + 20);
          v135 = &a1[v44];
          id v45 = (char *)a2 + v44;
          uint64_t v46 = sub_100022400();
          v47 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16);
          swift_bridgeObjectRetain();
          v47(v135, v45, v46);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(a1, 0, 1, v30);
        }
        uint64_t v48 = *(int *)(sub_100021F80() + 20);
        v49 = &a1[v48];
        v50 = (char **)((char *)a2 + v48);
        uint64_t v51 = v50[1];
        if (v51)
        {
          *(void *)v49 = *v50;
          *((void *)v49 + 1) = v51;
          uint64_t v52 = (void *)v50[2];
          *((void *)v49 + 2) = v52;
          swift_bridgeObjectRetain();
          id v53 = v52;
        }
        else
        {
          *(_OWORD *)v49 = *(_OWORD *)v50;
          *((void *)v49 + 2) = v50[2];
        }
        goto LABEL_65;
      case 8u:
        uint64_t v39 = sub_100022010();
        uint64_t v40 = *(void *)(v39 - 8);
        if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v40 + 48))(a2, 1, v39))
        {
          uint64_t v41 = sub_100022000();
          memcpy(a1, a2, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          uint64_t v54 = sub_100021CE0();
          (*(void (**)(char *, char **, uint64_t))(*(void *)(v54 - 8) + 16))(a1, a2, v54);
          a1[*(int *)(v39 + 20)] = *((unsigned char *)a2 + *(int *)(v39 + 20));
          (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(a1, 0, 1, v39);
        }
        uint64_t v55 = sub_100022020();
        *(void *)&a1[*(int *)(v55 + 20)] = *(char **)((char *)a2 + *(int *)(v55 + 20));
        goto LABEL_65;
      case 9u:
        *a1 = *(unsigned char *)a2;
        uint64_t v33 = *(int *)(sub_100021EA0() + 20);
        NSString v34 = &a1[v33];
        uint64_t v35 = (char *)a2 + v33;
        uint64_t v36 = sub_1000224C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
        goto LABEL_65;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
        goto LABEL_66;
    }
  }
  return a1;
}

id sub_100006B18(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  if (a7 >> 6 == 2) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!(a7 >> 6)) {
    return sub_100006B40(result, a2, a3, a4, a5, a6, a7 & 1);
  }
  return result;
}

id sub_100006B40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_100006B9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(uint64_t a1)
{
  return sub_10000CC8C(a1, qword_10002DC68);
}

void sub_100006C04(uint64_t a1, uint64_t a2)
{
  sub_100021FC0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          goto LABEL_22;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          goto LABEL_4;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 1u:
      sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
LABEL_22:

          break;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
LABEL_4:
          uint64_t v4 = sub_100021CE0();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
          break;
        default:
          break;
      }
LABEL_23:
      uint64_t v17 = sub_100021F90();
      uint64_t v18 = a1 + *(int *)(v17 + 20);
      if (*(void *)(v18 + 8))
      {
        swift_bridgeObjectRelease();
        sub_1000072D8(*(void **)(v18 + 16), *(void *)(v18 + 24), *(void *)(v18 + 32), *(void *)(v18 + 40), *(void *)(v18 + 48), *(void *)(v18 + 56), *(unsigned char *)(v18 + 64));
        int v19 = *(unsigned __int8 *)(v18 + 120);
        if (v19 != 255) {
          sub_100007300(*(void **)(v18 + 72), *(void *)(v18 + 80), *(void *)(v18 + 88), *(void *)(v18 + 96), *(void *)(v18 + 104), *(void *)(v18 + 112), v19 & 1);
        }
      }
      id v10 = *(id *)(a1 + *(int *)(v17 + 44));
      goto LABEL_27;
    case 2u:

      int v5 = (id *)(a1 + *(int *)(sub_100021F70() + 20));
      uint64_t v6 = sub_100021FF0();
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_36;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 3u:

      int v5 = (id *)(a1 + *(int *)(sub_100021F70() + 20));
      uint64_t v7 = sub_100021FF0();
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7))
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_36;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 4u:

      int v5 = (id *)(a1 + *(int *)(sub_100021F70() + 20));
      uint64_t v8 = sub_100021FF0();
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8))
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
LABEL_36:
            id v10 = *v5;
            goto LABEL_27;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
LABEL_11:
            uint64_t v9 = sub_100021CE0();
            goto LABEL_21;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 5u:
      id v10 = *(id *)(a1 + 16);
      goto LABEL_27;
    case 6u:
      id v10 = *(id *)a1;
      goto LABEL_27;
    case 7u:
      uint64_t v11 = sub_100021FA0();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(a1, 1, v11))
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = a1 + *(int *)(v11 + 20);
        uint64_t v13 = sub_100022400();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
      }
      uint64_t v14 = a1 + *(int *)(sub_100021F80() + 20);
      if (!*(void *)(v14 + 8)) {
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
      id v10 = *(id *)(v14 + 16);
LABEL_27:

LABEL_28:
      swift_bridgeObjectRelease();
      uint64_t v20 = (id *)(a1 + *(int *)(a2 + 32));
      uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(ReminderNotesCellContent - 8) + 48))(v20, 1, ReminderNotesCellContent))
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {

          uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
          id v23 = (char *)v20 + *(int *)(ReminderView + 20);
          uint64_t v24 = sub_100021CB0();
          (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
          id v25 = *(id *)((char *)v20 + *(int *)(ReminderView + 24));
        }
        else
        {
          id v25 = *v20;
        }
      }
      return;
    case 8u:
      uint64_t v15 = sub_100022010();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(a1, 1, v15))
      {
        uint64_t v16 = sub_100021CE0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
      }
      goto LABEL_28;
    case 9u:
      int v5 = (id *)(a1 + *(int *)(sub_100021EA0() + 20));
      uint64_t v9 = sub_1000224C0();
LABEL_21:
      (*(void (**)(id *, uint64_t))(*(void *)(v9 - 8) + 8))(v5, v9);
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

void sub_1000072D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  if (a7 >> 6 == 2)
  {
    swift_bridgeObjectRelease();
  }
  else if (!(a7 >> 6))
  {
    sub_100007300(a1, a2, a3, a4, a5, a6, a7 & 1);
  }
}

void sub_100007300(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void **sub_100007360(void **a1, void **a2, int *a3)
{
  uint64_t v6 = sub_100021FC0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v7 = sub_100021FF0();
      v146 = a3;
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          uint64_t v54 = *a2;
          *a1 = *a2;
          id v55 = v54;
          goto LABEL_31;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v53 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v53 - 8) + 16))(a1, a2, v53);
LABEL_31:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
          break;
      }
      uint64_t v56 = (int *)sub_100021F90();
      uint64_t v57 = v56[5];
      v58 = (char *)a1 + v57;
      v59 = (char *)a2 + v57;
      uint64_t v60 = *(uint64_t *)((char *)a2 + v57 + 8);
      if (v60)
      {
        *(void *)v58 = *(void *)v59;
        *((void *)v58 + 1) = v60;
        v61 = (void *)*((void *)v59 + 2);
        uint64_t v62 = *((void *)v59 + 3);
        uint64_t v63 = *((void *)v59 + 4);
        uint64_t v64 = *((void *)v59 + 5);
        uint64_t v65 = *((void *)v59 + 6);
        uint64_t v142 = *((void *)v59 + 7);
        unsigned __int8 v137 = v59[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v61, v62, v63, v64, v65, v142, v137);
        *((void *)v58 + 2) = v61;
        *((void *)v58 + 3) = v62;
        *((void *)v58 + 4) = v63;
        *((void *)v58 + 5) = v64;
        *((void *)v58 + 6) = v65;
        *((void *)v58 + 7) = v142;
        v58[64] = v137;
        *(_DWORD *)(v58 + 65) = *(_DWORD *)(v59 + 65);
        int v66 = v59[120];
        if (v66 == 255)
        {
          long long v67 = *(_OWORD *)(v59 + 88);
          *(_OWORD *)(v58 + 72) = *(_OWORD *)(v59 + 72);
          *(_OWORD *)(v58 + 88) = v67;
          *(_OWORD *)(v58 + 104) = *(_OWORD *)(v59 + 104);
          v58[120] = v59[120];
        }
        else
        {
          char v143 = v66 & 1;
          uint64_t v71 = *((void *)v59 + 10);
          unsigned __int8 v138 = (void *)*((void *)v59 + 9);
          uint64_t v72 = *((void *)v59 + 11);
          uint64_t v73 = *((void *)v59 + 12);
          uint64_t v74 = *((void *)v59 + 13);
          uint64_t v75 = *((void *)v59 + 14);
          sub_100006B40(v138, v71, v72, v73, v74, v75, v66 & 1);
          *((void *)v58 + 9) = v138;
          *((void *)v58 + 10) = v71;
          *((void *)v58 + 11) = v72;
          *((void *)v58 + 12) = v73;
          *((void *)v58 + 13) = v74;
          *((void *)v58 + 14) = v75;
          v58[120] = v143;
        }
        a3 = v146;
        v58[121] = v59[121];
      }
      else
      {
        long long v68 = *((_OWORD *)v59 + 5);
        *((_OWORD *)v58 + 4) = *((_OWORD *)v59 + 4);
        *((_OWORD *)v58 + 5) = v68;
        *((_OWORD *)v58 + 6) = *((_OWORD *)v59 + 6);
        *(_OWORD *)(v58 + 106) = *(_OWORD *)(v59 + 106);
        long long v69 = *((_OWORD *)v59 + 1);
        *(_OWORD *)v58 = *(_OWORD *)v59;
        *((_OWORD *)v58 + 1) = v69;
        long long v70 = *((_OWORD *)v59 + 3);
        *((_OWORD *)v58 + 2) = *((_OWORD *)v59 + 2);
        *((_OWORD *)v58 + 3) = v70;
      }
      *((unsigned char *)a1 + v56[6]) = *((unsigned char *)a2 + v56[6]);
      *((unsigned char *)a1 + v56[7]) = *((unsigned char *)a2 + v56[7]);
      *((unsigned char *)a1 + v56[8]) = *((unsigned char *)a2 + v56[8]);
      *((unsigned char *)a1 + v56[9]) = *((unsigned char *)a2 + v56[9]);
      *((unsigned char *)a1 + v56[10]) = *((unsigned char *)a2 + v56[10]);
      uint64_t v76 = v56[11];
      uint64_t v77 = *(void **)((char *)a2 + v76);
      *(void **)((char *)a1 + v76) = v77;
      id v78 = v77;
      goto LABEL_64;
    case 1u:
      uint64_t v8 = sub_100021FF0();
      v147 = a3;
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          uint64_t v80 = *a2;
          *a1 = *a2;
          id v81 = v80;
          goto LABEL_42;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v79 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v79 - 8) + 16))(a1, a2, v79);
LABEL_42:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
          break;
      }
      v82 = (int *)sub_100021F90();
      uint64_t v83 = v82[5];
      uint64_t v84 = (char *)a1 + v83;
      v85 = (char *)a2 + v83;
      uint64_t v86 = *(uint64_t *)((char *)a2 + v83 + 8);
      if (v86)
      {
        *(void *)uint64_t v84 = *(void *)v85;
        *((void *)v84 + 1) = v86;
        uint64_t v87 = (void *)*((void *)v85 + 2);
        uint64_t v88 = *((void *)v85 + 3);
        uint64_t v89 = *((void *)v85 + 4);
        uint64_t v90 = *((void *)v85 + 5);
        uint64_t v91 = *((void *)v85 + 6);
        uint64_t v139 = *((void *)v85 + 7);
        unsigned __int8 v144 = v85[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v87, v88, v89, v90, v91, v139, v144);
        *((void *)v84 + 2) = v87;
        *((void *)v84 + 3) = v88;
        *((void *)v84 + 4) = v89;
        *((void *)v84 + 5) = v90;
        *((void *)v84 + 6) = v91;
        *((void *)v84 + 7) = v139;
        v84[64] = v144;
        *(_DWORD *)(v84 + 65) = *(_DWORD *)(v85 + 65);
        int v92 = v85[120];
        if (v92 == 255)
        {
          long long v93 = *(_OWORD *)(v85 + 88);
          *(_OWORD *)(v84 + 72) = *(_OWORD *)(v85 + 72);
          *(_OWORD *)(v84 + 88) = v93;
          *(_OWORD *)(v84 + 104) = *(_OWORD *)(v85 + 104);
          v84[120] = v85[120];
        }
        else
        {
          char v145 = v92 & 1;
          uint64_t v97 = *((void *)v85 + 10);
          v140 = (void *)*((void *)v85 + 9);
          uint64_t v98 = *((void *)v85 + 11);
          uint64_t v99 = *((void *)v85 + 12);
          uint64_t v100 = *((void *)v85 + 13);
          uint64_t v101 = *((void *)v85 + 14);
          sub_100006B40(v140, v97, v98, v99, v100, v101, v92 & 1);
          *((void *)v84 + 9) = v140;
          *((void *)v84 + 10) = v97;
          *((void *)v84 + 11) = v98;
          *((void *)v84 + 12) = v99;
          *((void *)v84 + 13) = v100;
          *((void *)v84 + 14) = v101;
          v84[120] = v145;
        }
        a3 = v147;
        v84[121] = v85[121];
      }
      else
      {
        long long v94 = *((_OWORD *)v85 + 5);
        *((_OWORD *)v84 + 4) = *((_OWORD *)v85 + 4);
        *((_OWORD *)v84 + 5) = v94;
        *((_OWORD *)v84 + 6) = *((_OWORD *)v85 + 6);
        *(_OWORD *)(v84 + 106) = *(_OWORD *)(v85 + 106);
        long long v95 = *((_OWORD *)v85 + 1);
        *(_OWORD *)uint64_t v84 = *(_OWORD *)v85;
        *((_OWORD *)v84 + 1) = v95;
        long long v96 = *((_OWORD *)v85 + 3);
        *((_OWORD *)v84 + 2) = *((_OWORD *)v85 + 2);
        *((_OWORD *)v84 + 3) = v96;
      }
      *((unsigned char *)a1 + v82[6]) = *((unsigned char *)a2 + v82[6]);
      *((unsigned char *)a1 + v82[7]) = *((unsigned char *)a2 + v82[7]);
      *((unsigned char *)a1 + v82[8]) = *((unsigned char *)a2 + v82[8]);
      *((unsigned char *)a1 + v82[9]) = *((unsigned char *)a2 + v82[9]);
      *((unsigned char *)a1 + v82[10]) = *((unsigned char *)a2 + v82[10]);
      uint64_t v102 = v82[11];
      uint64_t v103 = *(void **)((char *)a2 + v102);
      *(void **)((char *)a1 + v102) = v103;
      id v104 = v103;
      goto LABEL_64;
    case 2u:
      uint64_t v9 = *a2;
      *a1 = *a2;
      uint64_t v10 = *(int *)(sub_100021F70() + 20);
      uint64_t v11 = (void **)((char *)a1 + v10);
      uint64_t v12 = (void **)((char *)a2 + v10);
      uint64_t v13 = sub_100021FF0();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
      id v16 = v9;
      if (v15(v12, 1, v13)) {
        goto LABEL_9;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          v106 = *v12;
          *uint64_t v11 = *v12;
          id v107 = v106;
          goto LABEL_53;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v105 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v105 - 8) + 16))(v11, v12, v105);
LABEL_53:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v11, v12, *(void *)(v14 + 64));
          break;
      }
      goto LABEL_63;
    case 3u:
      uint64_t v17 = *a2;
      *a1 = *a2;
      uint64_t v18 = *(int *)(sub_100021F70() + 20);
      uint64_t v11 = (void **)((char *)a1 + v18);
      uint64_t v12 = (void **)((char *)a2 + v18);
      uint64_t v13 = sub_100021FF0();
      uint64_t v14 = *(void *)(v13 - 8);
      int v19 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
      id v20 = v17;
      if (v19(v12, 1, v13)) {
        goto LABEL_9;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          uint64_t v40 = *v12;
          *uint64_t v11 = *v12;
          id v41 = v40;
          goto LABEL_62;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v111 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v111 - 8) + 16))(v11, v12, v111);
LABEL_62:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v11, v12, *(void *)(v14 + 64));
          break;
      }
      goto LABEL_63;
    case 4u:
      id v21 = *a2;
      *a1 = *a2;
      uint64_t v22 = *(int *)(sub_100021F70() + 20);
      uint64_t v11 = (void **)((char *)a1 + v22);
      uint64_t v12 = (void **)((char *)a2 + v22);
      uint64_t v13 = sub_100021FF0();
      uint64_t v14 = *(void *)(v13 - 8);
      id v23 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
      id v24 = v21;
      if (v23(v12, 1, v13))
      {
LABEL_9:
        uint64_t v25 = sub_100006B9C(&qword_10002DB38);
        memcpy(v11, v12, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            v109 = *v12;
            *uint64_t v11 = *v12;
            id v110 = v109;
            goto LABEL_59;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v108 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v108 - 8) + 16))(v11, v12, v108);
LABEL_59:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v11, v12, *(void *)(v14 + 64));
            break;
        }
LABEL_63:
        (*(void (**)(void **, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
LABEL_64:
      swift_storeEnumTagMultiPayload();
LABEL_65:
      uint64_t v112 = a3[5];
      uint64_t v113 = a3[6];
      uint64_t v114 = *(void **)((char *)a2 + v112);
      *(void **)((char *)a1 + v112) = v114;
      *((unsigned char *)a1 + v113) = *((unsigned char *)a2 + v113);
      uint64_t v115 = a3[8];
      *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
      v116 = (char *)a1 + v115;
      uint64_t v117 = (void **)((char *)a2 + v115);
      uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
      uint64_t v119 = *(void *)(ReminderNotesCellContent - 8);
      v120 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v119 + 48);
      id v121 = v114;
      swift_bridgeObjectRetain();
      if (v120(v117, 1, ReminderNotesCellContent))
      {
        uint64_t v122 = sub_100006B9C(&qword_10002DB48);
        memcpy(v116, v117, *(void *)(*(void *)(v122 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          v123 = *v117;
          *(void *)v116 = *v117;
          uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
          uint64_t v125 = *(int *)(ReminderView + 20);
          v148 = (char *)v117 + v125;
          v150 = &v116[v125];
          uint64_t v126 = sub_100021CB0();
          id v127 = a1;
          v128 = *(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v126 - 8) + 16);
          id v129 = v123;
          v128(v150, v148, v126);
          a1 = v127;
          uint64_t v130 = *(int *)(ReminderView + 24);
          unsigned __int8 v131 = *(void **)((char *)v117 + v130);
          *(void *)&v116[v130] = v131;
          id v132 = v131;
        }
        else
        {
          uint64_t v133 = *v117;
          char v134 = *((unsigned char *)v117 + 8);
          id v135 = v133;
          *(void *)v116 = v133;
          v116[8] = v134;
        }
        swift_storeEnumTagMultiPayload();
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v119 + 56))(v116, 0, 1, ReminderNotesCellContent);
      }
      return a1;
    case 5u:
      *a1 = *a2;
      *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
      *(_WORD *)((char *)a1 + 9) = *(_WORD *)((char *)a2 + 9);
      id v26 = a2[2];
      a1[2] = v26;
      id v27 = v26;
      goto LABEL_64;
    case 6u:
      uint64_t v35 = *a2;
      *a1 = *a2;
      id v36 = v35;
      goto LABEL_64;
    case 7u:
      uint64_t v28 = sub_100021FA0();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v29 + 48))(a2, 1, v28))
      {
        uint64_t v30 = sub_100006B9C(&qword_10002DB40);
        memcpy(a1, a2, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        uint64_t v42 = *(int *)(v28 + 20);
        v149 = (char *)a1 + v42;
        v141 = (char *)a2 + v42;
        uint64_t v43 = sub_100022400();
        uint64_t v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16);
        swift_bridgeObjectRetain();
        v44(v149, v141, v43);
        (*(void (**)(void **, void, uint64_t, uint64_t))(v29 + 56))(a1, 0, 1, v28);
      }
      uint64_t v45 = *(int *)(sub_100021F80() + 20);
      uint64_t v46 = (void **)((char *)a1 + v45);
      v47 = (void **)((char *)a2 + v45);
      uint64_t v48 = v47[1];
      if (v48)
      {
        *uint64_t v46 = *v47;
        v46[1] = v48;
        v49 = (void *)v47[2];
        v46[2] = v49;
        swift_bridgeObjectRetain();
        id v50 = v49;
      }
      else
      {
        *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
        v46[2] = v47[2];
      }
      goto LABEL_64;
    case 8u:
      uint64_t v37 = sub_100022010();
      uint64_t v38 = *(void *)(v37 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v38 + 48))(a2, 1, v37))
      {
        uint64_t v39 = sub_100022000();
        memcpy(a1, a2, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        uint64_t v51 = sub_100021CE0();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v51 - 8) + 16))(a1, a2, v51);
        *((unsigned char *)a1 + *(int *)(v37 + 20)) = *((unsigned char *)a2 + *(int *)(v37 + 20));
        (*(void (**)(void **, void, uint64_t, uint64_t))(v38 + 56))(a1, 0, 1, v37);
      }
      uint64_t v52 = sub_100022020();
      *(void **)((char *)a1 + *(int *)(v52 + 20)) = *(void **)((char *)a2 + *(int *)(v52 + 20));
      goto LABEL_64;
    case 9u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v31 = *(int *)(sub_100021EA0() + 20);
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      uint64_t v34 = sub_1000224C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      goto LABEL_64;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      goto LABEL_65;
  }
}

void **sub_100008AB0(void **a1, void **a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000A39C((uint64_t)a1, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    uint64_t v6 = sub_100021FC0();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v53 = *a2;
            *a1 = *a2;
            id v54 = v53;
            goto LABEL_31;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v52 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v52 - 8) + 16))(a1, a2, v52);
LABEL_31:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
            break;
        }
        id v55 = (int *)sub_100021F90();
        uint64_t v56 = v55[5];
        uint64_t v57 = (char *)a1 + v56;
        v58 = (char *)a2 + v56;
        if (!*(void **)((char *)a2 + v56 + 8)) {
          goto LABEL_35;
        }
        v152 = v55;
        *(void *)uint64_t v57 = *(void *)v58;
        *((void *)v57 + 1) = *((void *)v58 + 1);
        v59 = (void *)*((void *)v58 + 2);
        uint64_t v60 = *((void *)v58 + 3);
        uint64_t v61 = *((void *)v58 + 4);
        uint64_t v62 = *((void *)v58 + 5);
        uint64_t v63 = *((void *)v58 + 7);
        uint64_t v150 = *((void *)v58 + 6);
        unsigned __int8 v156 = v58[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v59, v60, v61, v62, v150, v63, v156);
        *((void *)v57 + 2) = v59;
        *((void *)v57 + 3) = v60;
        *((void *)v57 + 4) = v61;
        *((void *)v57 + 5) = v62;
        *((void *)v57 + 6) = v150;
        *((void *)v57 + 7) = v63;
        v57[64] = v156;
        v57[65] = v58[65];
        v57[66] = v58[66];
        v57[67] = v58[67];
        v57[68] = v58[68];
        int v64 = v58[120];
        if (v64 == 255)
        {
          long long v65 = *(_OWORD *)(v58 + 72);
          long long v66 = *(_OWORD *)(v58 + 88);
          long long v67 = *(_OWORD *)(v58 + 104);
          v57[120] = v58[120];
          *(_OWORD *)(v57 + 88) = v66;
          *(_OWORD *)(v57 + 104) = v67;
          *(_OWORD *)(v57 + 72) = v65;
        }
        else
        {
          char v157 = v64 & 1;
          uint64_t v75 = (void *)*((void *)v58 + 9);
          uint64_t v74 = *((void *)v58 + 10);
          uint64_t v76 = *((void *)v58 + 11);
          uint64_t v77 = *((void *)v58 + 12);
          uint64_t v78 = *((void *)v58 + 13);
          uint64_t v151 = *((void *)v58 + 14);
          sub_100006B40(v75, v74, v76, v77, v78, v151, v64 & 1);
          *((void *)v57 + 9) = v75;
          *((void *)v57 + 10) = v74;
          *((void *)v57 + 11) = v76;
          *((void *)v57 + 12) = v77;
          *((void *)v57 + 13) = v78;
          *((void *)v57 + 14) = v151;
          v57[120] = v157;
        }
        v57[121] = v58[121];
        id v55 = v152;
        goto LABEL_38;
      case 1u:
        uint64_t v8 = sub_100021FF0();
        v159 = a3;
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v83 = *a2;
            *a1 = *a2;
            id v84 = v83;
            goto LABEL_42;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v82 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v82 - 8) + 16))(a1, a2, v82);
LABEL_42:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
            break;
        }
        id v55 = (int *)sub_100021F90();
        uint64_t v85 = v55[5];
        uint64_t v57 = (char *)a1 + v85;
        v58 = (char *)a2 + v85;
        if (*(void **)((char *)a2 + v85 + 8))
        {
          v158 = v55;
          *(void *)uint64_t v57 = *(void *)v58;
          *((void *)v57 + 1) = *((void *)v58 + 1);
          uint64_t v86 = (void *)*((void *)v58 + 2);
          uint64_t v87 = *((void *)v58 + 3);
          uint64_t v88 = *((void *)v58 + 4);
          uint64_t v89 = *((void *)v58 + 5);
          uint64_t v90 = *((void *)v58 + 6);
          uint64_t v153 = *((void *)v58 + 7);
          unsigned __int8 v91 = v58[64];
          swift_bridgeObjectRetain();
          sub_100006B18(v86, v87, v88, v89, v90, v153, v91);
          *((void *)v57 + 2) = v86;
          *((void *)v57 + 3) = v87;
          *((void *)v57 + 4) = v88;
          *((void *)v57 + 5) = v89;
          *((void *)v57 + 6) = v90;
          *((void *)v57 + 7) = v153;
          v57[64] = v91;
          v57[65] = v58[65];
          v57[66] = v58[66];
          v57[67] = v58[67];
          v57[68] = v58[68];
          int v92 = v58[120];
          if (v92 == 255)
          {
            long long v93 = *(_OWORD *)(v58 + 72);
            long long v94 = *(_OWORD *)(v58 + 88);
            long long v95 = *(_OWORD *)(v58 + 104);
            v57[120] = v58[120];
            *(_OWORD *)(v57 + 88) = v94;
            *(_OWORD *)(v57 + 104) = v95;
            *(_OWORD *)(v57 + 72) = v93;
          }
          else
          {
            char v154 = v92 & 1;
            uint64_t v97 = (void *)*((void *)v58 + 9);
            uint64_t v96 = *((void *)v58 + 10);
            uint64_t v98 = *((void *)v58 + 11);
            uint64_t v99 = *((void *)v58 + 12);
            uint64_t v101 = *((void *)v58 + 13);
            uint64_t v100 = *((void *)v58 + 14);
            sub_100006B40(v97, v96, v98, v99, v101, v100, v92 & 1);
            *((void *)v57 + 9) = v97;
            *((void *)v57 + 10) = v96;
            *((void *)v57 + 11) = v98;
            *((void *)v57 + 12) = v99;
            *((void *)v57 + 13) = v101;
            *((void *)v57 + 14) = v100;
            v57[120] = v154;
          }
          a3 = v159;
          v57[121] = v58[121];
          id v55 = v158;
        }
        else
        {
LABEL_35:
          long long v68 = *(_OWORD *)v58;
          long long v69 = *((_OWORD *)v58 + 1);
          long long v70 = *((_OWORD *)v58 + 3);
          *((_OWORD *)v57 + 2) = *((_OWORD *)v58 + 2);
          *((_OWORD *)v57 + 3) = v70;
          *(_OWORD *)uint64_t v57 = v68;
          *((_OWORD *)v57 + 1) = v69;
          long long v71 = *((_OWORD *)v58 + 4);
          long long v72 = *((_OWORD *)v58 + 5);
          long long v73 = *((_OWORD *)v58 + 6);
          *(_OWORD *)(v57 + 106) = *(_OWORD *)(v58 + 106);
          *((_OWORD *)v57 + 5) = v72;
          *((_OWORD *)v57 + 6) = v73;
          *((_OWORD *)v57 + 4) = v71;
        }
LABEL_38:
        *((unsigned char *)a1 + v55[6]) = *((unsigned char *)a2 + v55[6]);
        *((unsigned char *)a1 + v55[7]) = *((unsigned char *)a2 + v55[7]);
        *((unsigned char *)a1 + v55[8]) = *((unsigned char *)a2 + v55[8]);
        *((unsigned char *)a1 + v55[9]) = *((unsigned char *)a2 + v55[9]);
        *((unsigned char *)a1 + v55[10]) = *((unsigned char *)a2 + v55[10]);
        uint64_t v79 = v55[11];
        uint64_t v80 = *(void **)((char *)a2 + v79);
        *(void **)((char *)a1 + v79) = v80;
        id v81 = v80;
        goto LABEL_64;
      case 2u:
        uint64_t v9 = *a2;
        *a1 = *a2;
        uint64_t v10 = *(int *)(sub_100021F70() + 20);
        uint64_t v11 = (void **)((char *)a1 + v10);
        uint64_t v12 = (void **)((char *)a2 + v10);
        uint64_t v13 = sub_100021FF0();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v15 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
        id v16 = v9;
        if (v15(v12, 1, v13)) {
          goto LABEL_10;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v103 = *v12;
            *uint64_t v11 = *v12;
            id v104 = v103;
            goto LABEL_52;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v102 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v102 - 8) + 16))(v11, v12, v102);
LABEL_52:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v11, v12, *(void *)(v14 + 64));
            break;
        }
        goto LABEL_63;
      case 3u:
        uint64_t v17 = *a2;
        *a1 = *a2;
        uint64_t v18 = *(int *)(sub_100021F70() + 20);
        uint64_t v11 = (void **)((char *)a1 + v18);
        uint64_t v12 = (void **)((char *)a2 + v18);
        uint64_t v13 = sub_100021FF0();
        uint64_t v14 = *(void *)(v13 - 8);
        int v19 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
        id v20 = v17;
        if (v19(v12, 1, v13)) {
          goto LABEL_10;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            v106 = *v12;
            *uint64_t v11 = *v12;
            id v107 = v106;
            goto LABEL_57;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v105 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v105 - 8) + 16))(v11, v12, v105);
LABEL_57:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v11, v12, *(void *)(v14 + 64));
            break;
        }
        goto LABEL_63;
      case 4u:
        id v21 = *a2;
        *a1 = *a2;
        uint64_t v22 = *(int *)(sub_100021F70() + 20);
        uint64_t v11 = (void **)((char *)a1 + v22);
        uint64_t v12 = (void **)((char *)a2 + v22);
        uint64_t v13 = sub_100021FF0();
        uint64_t v14 = *(void *)(v13 - 8);
        id v23 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
        id v24 = v21;
        if (v23(v12, 1, v13))
        {
LABEL_10:
          uint64_t v25 = sub_100006B9C(&qword_10002DB38);
          memcpy(v11, v12, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
            case 8u:
            case 9u:
              v109 = *v12;
              *uint64_t v11 = *v12;
              id v110 = v109;
              goto LABEL_62;
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 6u:
              uint64_t v108 = sub_100021CE0();
              (*(void (**)(void **, void **, uint64_t))(*(void *)(v108 - 8) + 16))(v11, v12, v108);
LABEL_62:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v11, v12, *(void *)(v14 + 64));
              break;
          }
LABEL_63:
          (*(void (**)(void **, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
        }
LABEL_64:
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        *a1 = *a2;
        *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
        *((unsigned char *)a1 + 9) = *((unsigned char *)a2 + 9);
        *((unsigned char *)a1 + 10) = *((unsigned char *)a2 + 10);
        id v26 = a2[2];
        a1[2] = v26;
        id v27 = v26;
        goto LABEL_64;
      case 6u:
        uint64_t v35 = *a2;
        *a1 = *a2;
        id v36 = v35;
        goto LABEL_64;
      case 7u:
        uint64_t v28 = sub_100021FA0();
        uint64_t v29 = *(void *)(v28 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v29 + 48))(a2, 1, v28))
        {
          uint64_t v30 = sub_100006B9C(&qword_10002DB40);
          memcpy(a1, a2, *(void *)(*(void *)(v30 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          uint64_t v40 = *(int *)(v28 + 20);
          v155 = (char *)a1 + v40;
          id v41 = (char *)a2 + v40;
          uint64_t v42 = sub_100022400();
          uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16);
          swift_bridgeObjectRetain();
          v43(v155, v41, v42);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v29 + 56))(a1, 0, 1, v28);
        }
        uint64_t v44 = *(int *)(sub_100021F80() + 20);
        uint64_t v45 = (void **)((char *)a1 + v44);
        uint64_t v46 = (void **)((char *)a2 + v44);
        if (v46[1])
        {
          *uint64_t v45 = *v46;
          v45[1] = v46[1];
          v47 = (void *)v46[2];
          v45[2] = v47;
          swift_bridgeObjectRetain();
          id v48 = v47;
        }
        else
        {
          long long v49 = *(_OWORD *)v46;
          v45[2] = v46[2];
          *(_OWORD *)uint64_t v45 = v49;
        }
        goto LABEL_64;
      case 8u:
        uint64_t v37 = sub_100022010();
        uint64_t v38 = *(void *)(v37 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v38 + 48))(a2, 1, v37))
        {
          uint64_t v39 = sub_100022000();
          memcpy(a1, a2, *(void *)(*(void *)(v39 - 8) + 64));
        }
        else
        {
          uint64_t v50 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v50 - 8) + 16))(a1, a2, v50);
          *((unsigned char *)a1 + *(int *)(v37 + 20)) = *((unsigned char *)a2 + *(int *)(v37 + 20));
          (*(void (**)(void **, void, uint64_t, uint64_t))(v38 + 56))(a1, 0, 1, v37);
        }
        uint64_t v51 = sub_100022020();
        *(void **)((char *)a1 + *(int *)(v51 + 20)) = *(void **)((char *)a2 + *(int *)(v51 + 20));
        goto LABEL_64;
      case 9u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v31 = *(int *)(sub_100021EA0() + 20);
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)a2 + v31;
        uint64_t v34 = sub_1000224C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
        goto LABEL_64;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        break;
    }
  }
  uint64_t v111 = a3[5];
  uint64_t v112 = *(void **)((char *)a1 + v111);
  uint64_t v113 = *(void **)((char *)a2 + v111);
  *(void **)((char *)a1 + v111) = v113;
  id v114 = v113;

  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v115 = a3[8];
  v116 = (char *)a1 + v115;
  uint64_t v117 = (char *)a2 + v115;
  uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  uint64_t v119 = *(void *)(ReminderNotesCellContent - 8);
  v120 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v119 + 48);
  int v121 = v120(v116, 1, ReminderNotesCellContent);
  int v122 = v120(v117, 1, ReminderNotesCellContent);
  if (v121)
  {
    if (!v122)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v123 = *(void **)v117;
        *(void *)v116 = *(void *)v117;
        uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
        uint64_t v125 = *(int *)(ReminderView + 20);
        v160 = &v117[v125];
        v161 = &v116[v125];
        uint64_t v126 = sub_100021CB0();
        id v127 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v126 - 8) + 16);
        id v128 = v123;
        v127(v161, v160, v126);
        uint64_t v129 = *(int *)(ReminderView + 24);
        uint64_t v130 = *(void **)&v117[v129];
        *(void *)&v116[v129] = v130;
        id v131 = v130;
      }
      else
      {
        char v143 = *(void **)v117;
        char v144 = v117[8];
        id v145 = v143;
        *(void *)v116 = v143;
        v116[8] = v144;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v119 + 56))(v116, 0, 1, ReminderNotesCellContent);
      return a1;
    }
LABEL_71:
    uint64_t v132 = sub_100006B9C(&qword_10002DB48);
    memcpy(v116, v117, *(void *)(*(void *)(v132 - 8) + 64));
    return a1;
  }
  if (v122)
  {
    sub_10000A39C((uint64_t)v116, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    goto LABEL_71;
  }
  if (a1 != a2)
  {
    sub_10000A39C((uint64_t)v116, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v133 = *(void **)v117;
      *(void *)v116 = *(void *)v117;
      uint64_t v134 = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      uint64_t v135 = *(int *)(v134 + 20);
      v162 = &v116[v135];
      uint64_t v136 = &v117[v135];
      uint64_t v137 = sub_100021CB0();
      unsigned __int8 v138 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v137 - 8) + 16);
      id v139 = v133;
      v138(v162, v136, v137);
      uint64_t v140 = *(int *)(v134 + 24);
      v141 = *(void **)&v117[v140];
      *(void *)&v116[v140] = v141;
      id v142 = v141;
    }
    else
    {
      v147 = *(void **)v117;
      char v148 = v117[8];
      id v149 = v147;
      *(void *)v116 = v147;
      v116[8] = v148;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000A39C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_10000A3FC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = sub_100021FC0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v7 = sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v36 = sub_100021CE0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 32))(a1, a2, v36);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
          break;
      }
      goto LABEL_25;
    case 1u:
      uint64_t v8 = sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v45 = sub_100021CE0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 32))(a1, a2, v45);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
          break;
      }
LABEL_25:
      uint64_t v37 = (int *)sub_100021F90();
      uint64_t v38 = v37[5];
      uint64_t v39 = (_OWORD *)((char *)a1 + v38);
      uint64_t v40 = (_OWORD *)((char *)a2 + v38);
      long long v41 = v40[3];
      v39[2] = v40[2];
      v39[3] = v41;
      long long v42 = v40[1];
      *uint64_t v39 = *v40;
      v39[1] = v42;
      *(_OWORD *)((char *)v39 + 106) = *(_OWORD *)((char *)v40 + 106);
      long long v43 = v40[6];
      long long v44 = v40[4];
      v39[5] = v40[5];
      v39[6] = v43;
      v39[4] = v44;
      *((unsigned char *)a1 + v37[6]) = *((unsigned char *)a2 + v37[6]);
      *((unsigned char *)a1 + v37[7]) = *((unsigned char *)a2 + v37[7]);
      *((unsigned char *)a1 + v37[8]) = *((unsigned char *)a2 + v37[8]);
      *((unsigned char *)a1 + v37[9]) = *((unsigned char *)a2 + v37[9]);
      *((unsigned char *)a1 + v37[10]) = *((unsigned char *)a2 + v37[10]);
      *(void *)((char *)a1 + v37[11]) = *(void *)((char *)a2 + v37[11]);
      goto LABEL_38;
    case 2u:
      *a1 = *a2;
      uint64_t v9 = *(int *)(sub_100021F70() + 20);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_100021FF0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        goto LABEL_7;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v46 = sub_100021CE0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v10, v11, v46);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v10, v11, *(void *)(v13 + 64));
          break;
      }
      goto LABEL_37;
    case 3u:
      *a1 = *a2;
      uint64_t v14 = *(int *)(sub_100021F70() + 20);
      uint64_t v10 = (char *)a1 + v14;
      uint64_t v11 = (char *)a2 + v14;
      uint64_t v12 = sub_100021FF0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        goto LABEL_7;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v47 = sub_100021CE0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v10, v11, v47);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v10, v11, *(void *)(v13 + 64));
          break;
      }
      goto LABEL_37;
    case 4u:
      *a1 = *a2;
      uint64_t v16 = *(int *)(sub_100021F70() + 20);
      uint64_t v10 = (char *)a1 + v16;
      uint64_t v11 = (char *)a2 + v16;
      uint64_t v12 = sub_100021FF0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
LABEL_7:
        uint64_t v15 = sub_100006B9C(&qword_10002DB38);
        memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v48 = sub_100021CE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v10, v11, v48);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v10, v11, *(void *)(v13 + 64));
            break;
        }
LABEL_37:
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
LABEL_38:
      swift_storeEnumTagMultiPayload();
LABEL_39:
      uint64_t v49 = a3[6];
      *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
      *((unsigned char *)a1 + v49) = *((unsigned char *)a2 + v49);
      uint64_t v50 = a3[8];
      *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
      uint64_t v51 = (void *)((char *)a1 + v50);
      uint64_t v52 = (void *)((char *)a2 + v50);
      uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
      uint64_t v54 = *(void *)(ReminderNotesCellContent - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v54 + 48))(v52, 1, ReminderNotesCellContent))
      {
        uint64_t v55 = sub_100006B9C(&qword_10002DB48);
        memcpy(v51, v52, *(void *)(*(void *)(v55 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          *uint64_t v51 = *v52;
          uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
          uint64_t v57 = *(int *)(ReminderView + 20);
          v58 = (char *)v51 + v57;
          v59 = (char *)v52 + v57;
          uint64_t v60 = sub_100021CB0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
          *(void *)((char *)v51 + *(int *)(ReminderView + 24)) = *(void *)((char *)v52 + *(int *)(ReminderView + 24));
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          memcpy(v51, v52, *(void *)(v54 + 64));
        }
        (*(void (**)(void *, void, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, ReminderNotesCellContent);
      }
      return a1;
    case 7u:
      uint64_t v17 = sub_100021FA0();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
      {
        uint64_t v19 = sub_100006B9C(&qword_10002DB40);
        memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        uint64_t v27 = *(int *)(v17 + 20);
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = sub_100022400();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
      }
      uint64_t v31 = *(int *)(sub_100021F80() + 20);
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
      *((void *)v32 + 2) = *((void *)v33 + 2);
      goto LABEL_38;
    case 8u:
      uint64_t v20 = sub_100022010();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(a2, 1, v20))
      {
        uint64_t v22 = sub_100022000();
        memcpy(a1, a2, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        uint64_t v34 = sub_100021CE0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
        *((unsigned char *)a1 + *(int *)(v20 + 20)) = *((unsigned char *)a2 + *(int *)(v20 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(a1, 0, 1, v20);
      }
      uint64_t v35 = sub_100022020();
      *(void *)((char *)a1 + *(int *)(v35 + 20)) = *(void *)((char *)a2 + *(int *)(v35 + 20));
      goto LABEL_38;
    case 9u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v23 = *(int *)(sub_100021EA0() + 20);
      id v24 = (char *)a1 + v23;
      uint64_t v25 = (char *)a2 + v23;
      uint64_t v26 = sub_1000224C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
      goto LABEL_38;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      goto LABEL_39;
  }
}

void *sub_10000B64C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10000A39C((uint64_t)a1, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    uint64_t v6 = sub_100021FC0();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v36 = sub_100021CE0();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 32))(a1, a2, v36);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
            break;
        }
        goto LABEL_26;
      case 1u:
        uint64_t v8 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v45 = sub_100021CE0();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 32))(a1, a2, v45);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
            break;
        }
LABEL_26:
        uint64_t v37 = (int *)sub_100021F90();
        uint64_t v38 = v37[5];
        uint64_t v39 = (_OWORD *)((char *)a1 + v38);
        uint64_t v40 = (_OWORD *)((char *)a2 + v38);
        long long v41 = v40[3];
        v39[2] = v40[2];
        v39[3] = v41;
        long long v42 = v40[1];
        *uint64_t v39 = *v40;
        v39[1] = v42;
        *(_OWORD *)((char *)v39 + 106) = *(_OWORD *)((char *)v40 + 106);
        long long v43 = v40[6];
        long long v44 = v40[4];
        v39[5] = v40[5];
        v39[6] = v43;
        v39[4] = v44;
        *((unsigned char *)a1 + v37[6]) = *((unsigned char *)a2 + v37[6]);
        *((unsigned char *)a1 + v37[7]) = *((unsigned char *)a2 + v37[7]);
        *((unsigned char *)a1 + v37[8]) = *((unsigned char *)a2 + v37[8]);
        *((unsigned char *)a1 + v37[9]) = *((unsigned char *)a2 + v37[9]);
        *((unsigned char *)a1 + v37[10]) = *((unsigned char *)a2 + v37[10]);
        *(void *)((char *)a1 + v37[11]) = *(void *)((char *)a2 + v37[11]);
        goto LABEL_39;
      case 2u:
        *a1 = *a2;
        uint64_t v9 = *(int *)(sub_100021F70() + 20);
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_100021FF0();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
          goto LABEL_8;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v46 = sub_100021CE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v10, v11, v46);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v10, v11, *(void *)(v13 + 64));
            break;
        }
        goto LABEL_38;
      case 3u:
        *a1 = *a2;
        uint64_t v14 = *(int *)(sub_100021F70() + 20);
        uint64_t v10 = (char *)a1 + v14;
        uint64_t v11 = (char *)a2 + v14;
        uint64_t v12 = sub_100021FF0();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
          goto LABEL_8;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v47 = sub_100021CE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v10, v11, v47);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v10, v11, *(void *)(v13 + 64));
            break;
        }
        goto LABEL_38;
      case 4u:
        *a1 = *a2;
        uint64_t v16 = *(int *)(sub_100021F70() + 20);
        uint64_t v10 = (char *)a1 + v16;
        uint64_t v11 = (char *)a2 + v16;
        uint64_t v12 = sub_100021FF0();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
        {
LABEL_8:
          uint64_t v15 = sub_100006B9C(&qword_10002DB38);
          memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 6u:
              uint64_t v48 = sub_100021CE0();
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v10, v11, v48);
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v10, v11, *(void *)(v13 + 64));
              break;
          }
LABEL_38:
          (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
        }
LABEL_39:
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v17 = sub_100021FA0();
        uint64_t v18 = *(void *)(v17 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
        {
          uint64_t v19 = sub_100006B9C(&qword_10002DB40);
          memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          uint64_t v27 = *(int *)(v17 + 20);
          uint64_t v28 = (char *)a1 + v27;
          uint64_t v29 = (char *)a2 + v27;
          uint64_t v30 = sub_100022400();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
        }
        uint64_t v31 = *(int *)(sub_100021F80() + 20);
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)a2 + v31;
        *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
        *((void *)v32 + 2) = *((void *)v33 + 2);
        goto LABEL_39;
      case 8u:
        uint64_t v20 = sub_100022010();
        uint64_t v21 = *(void *)(v20 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(a2, 1, v20))
        {
          uint64_t v22 = sub_100022000();
          memcpy(a1, a2, *(void *)(*(void *)(v22 - 8) + 64));
        }
        else
        {
          uint64_t v34 = sub_100021CE0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
          *((unsigned char *)a1 + *(int *)(v20 + 20)) = *((unsigned char *)a2 + *(int *)(v20 + 20));
          (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(a1, 0, 1, v20);
        }
        uint64_t v35 = sub_100022020();
        *(void *)((char *)a1 + *(int *)(v35 + 20)) = *(void *)((char *)a2 + *(int *)(v35 + 20));
        goto LABEL_39;
      case 9u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v23 = *(int *)(sub_100021EA0() + 20);
        id v24 = (char *)a1 + v23;
        uint64_t v25 = (char *)a2 + v23;
        uint64_t v26 = sub_1000224C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
        goto LABEL_39;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        break;
    }
  }
  uint64_t v49 = a3[5];
  uint64_t v50 = *(void **)((char *)a1 + v49);
  *(void *)((char *)a1 + v49) = *(void *)((char *)a2 + v49);

  uint64_t v51 = a3[7];
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  *(void *)((char *)a1 + v51) = *(void *)((char *)a2 + v51);
  swift_bridgeObjectRelease();
  uint64_t v52 = a3[8];
  uint64_t v53 = (void *)((char *)a1 + v52);
  uint64_t v54 = (void *)((char *)a2 + v52);
  uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  uint64_t v56 = *(void *)(ReminderNotesCellContent - 8);
  uint64_t v57 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v56 + 48);
  int v58 = v57(v53, 1, ReminderNotesCellContent);
  int v59 = v57(v54, 1, ReminderNotesCellContent);
  if (!v58)
  {
    if (!v59)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_10000A39C((uint64_t)v53, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        *uint64_t v53 = *v54;
        uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
        uint64_t v67 = *(int *)(ReminderView + 20);
        long long v68 = (char *)v53 + v67;
        long long v69 = (char *)v54 + v67;
        uint64_t v70 = sub_100021CB0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 32))(v68, v69, v70);
        *(void *)((char *)v53 + *(int *)(ReminderView + 24)) = *(void *)((char *)v54 + *(int *)(ReminderView + 24));
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v65 = *(void *)(v56 + 64);
      goto LABEL_47;
    }
    sub_10000A39C((uint64_t)v53, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
LABEL_46:
    size_t v65 = *(void *)(*(void *)(sub_100006B9C(&qword_10002DB48) - 8) + 64);
LABEL_47:
    memcpy(v53, v54, v65);
    return a1;
  }
  if (v59) {
    goto LABEL_46;
  }
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *uint64_t v53 = *v54;
    uint64_t v60 = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    uint64_t v61 = *(int *)(v60 + 20);
    uint64_t v62 = (char *)v53 + v61;
    uint64_t v63 = (char *)v54 + v61;
    uint64_t v64 = sub_100021CB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 32))(v62, v63, v64);
    *(void *)((char *)v53 + *(int *)(v60 + 24)) = *(void *)((char *)v54 + *(int *)(v60 + 24));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v53, v54, *(void *)(v56 + 64));
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, ReminderNotesCellContent);
  return a1;
}

uint64_t sub_10000C9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C9EC);
}

uint64_t sub_10000C9EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100021FC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
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
  else
  {
    uint64_t v12 = sub_100006B9C(&qword_10002DB48);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 32);
    return v13(v15, a2, v14);
  }
}

uint64_t sub_10000CB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000CB3C);
}

uint64_t sub_10000CB3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100021FC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  else
  {
    uint64_t v11 = sub_100006B9C(&qword_10002DB48);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(uint64_t a1)
{
  return sub_10000CC8C(a1, (uint64_t *)&unk_10002DBA8);
}

uint64_t sub_10000CC8C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000CCC4()
{
  sub_100021FC0();
  if (v0 <= 0x3F)
  {
    sub_10000CDA0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000CDA0()
{
  if (!qword_10002DBB8)
  {
    type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(255);
    unint64_t v0 = sub_1000226D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002DBB8);
    }
  }
}

char *sub_10000CDF8(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)a1 = *a2;
    a1 = &v17[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = *a2;
      *(void *)a1 = *a2;
      uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      uint64_t v8 = *(int *)(ReminderView + 20);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = (uint64_t)a2 + v8;
      uint64_t v11 = sub_100021CB0();
      uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
      uint64_t v13 = v6;
      v12(v9, v10, v11);
      uint64_t v14 = *(int *)(ReminderView + 24);
      uint64_t v15 = *(char **)((char *)a2 + v14);
      *(void *)&a1[v14] = v15;
      id v16 = v15;
    }
    else
    {
      uint64_t v18 = *a2;
      char v19 = *((unsigned char *)a2 + 8);
      uint64_t v20 = v18;
      *(void *)a1 = v18;
      a1[8] = v19;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_10000CF58(id *a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {

    uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    uint64_t v3 = (char *)a1 + *(int *)(ReminderView + 20);
    uint64_t v4 = sub_100021CB0();
    (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    id v5 = *(id *)((char *)a1 + *(int *)(ReminderView + 24));
  }
  else
  {
    id v5 = *a1;
  }
}

uint64_t sub_10000D020(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = *(void **)a2;
    *(void *)a1 = *(void *)a2;
    uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    uint64_t v6 = *(int *)(ReminderView + 20);
    uint64_t v7 = a1 + v6;
    uint64_t v8 = a2 + v6;
    uint64_t v9 = sub_100021CB0();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    id v11 = v4;
    v10(v7, v8, v9);
    uint64_t v12 = *(int *)(ReminderView + 24);
    uint64_t v13 = *(void **)(a2 + v12);
    *(void *)(a1 + v12) = v13;
    id v14 = v13;
  }
  else
  {
    uint64_t v15 = *(void **)a2;
    char v16 = *(unsigned char *)(a2 + 8);
    id v17 = v15;
    *(void *)a1 = v15;
    *(unsigned char *)(a1 + 8) = v16;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10000D128(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10000A39C(a1, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      uint64_t v6 = *(int *)(ReminderView + 20);
      uint64_t v7 = a1 + v6;
      uint64_t v8 = a2 + v6;
      uint64_t v9 = sub_100021CB0();
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
      id v11 = v4;
      v10(v7, v8, v9);
      uint64_t v12 = *(int *)(ReminderView + 24);
      uint64_t v13 = *(void **)(a2 + v12);
      *(void *)(a1 + v12) = v13;
      id v14 = v13;
    }
    else
    {
      uint64_t v15 = *(void **)a2;
      char v16 = *(unsigned char *)(a2 + 8);
      id v17 = v15;
      *(void *)a1 = v15;
      *(unsigned char *)(a1 + 8) = v16;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10000D254(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    uint64_t v7 = *(int *)(ReminderView + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100021CB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    *(void *)((char *)a1 + *(int *)(ReminderView + 24)) = *(void *)((char *)a2 + *(int *)(ReminderView + 24));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10000D340(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000A39C((uint64_t)a1, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      uint64_t v7 = *(int *)(ReminderView + 20);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_100021CB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      *(void *)((char *)a1 + *(int *)(ReminderView + 24)) = *(void *)((char *)a2 + *(int *)(ReminderView + 24));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000D450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10000D478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000D4A4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10000D4B4()
{
  uint64_t result = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

NSNumber sub_10000D548()
{
  return Float._bridgeToObjectiveC()();
}

uint64_t sub_10000D550(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000225B0();
  *(_DWORD *)a2 = 0;
  *(unsigned char *)(a2 + 4) = 1;
  return result;
}

uint64_t sub_10000D5A4(uint64_t a1, uint64_t a2)
{
  char v3 = sub_1000225C0();
  *(_DWORD *)a2 = 0;
  *(unsigned char *)(a2 + 4) = 1;
  return v3 & 1;
}

uint64_t sub_10000D5FC@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = sub_1000225D0();
  *a1 = v3;
  return result;
}

_DWORD *sub_10000D624@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

float sub_10000D634@<S0>(_DWORD *a1@<X8>)
{
  float result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_10000D640()
{
  return sub_1000227C0();
}

uint64_t sub_10000D6E0()
{
  return Float.hashValue.getter(*v0);
}

void sub_10000D6E8()
{
  if ((*v0 & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v1 = *v0;
  }
  else {
    Swift::UInt32 v1 = 0;
  }
  sub_100022800(v1);
}

uint64_t sub_10000D71C(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFF) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return static Hasher._hash(seed:bytes:count:)(a1, v2, 4);
}

BOOL sub_10000D730(float *a1, float *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000D744(uint64_t a1, uint64_t a2)
{
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  __chkstk_darwin(ReminderView);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  uint64_t v8 = __chkstk_darwin(ReminderNotesCellContent);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v13 = sub_100006B9C(&qword_10002DCC0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  char v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t)&v16[*(int *)(v14 + 56)];
  sub_10000E4EC(a1, (uint64_t)v16, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  sub_10000E4EC(a2, v17, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_10000E4EC((uint64_t)v16, (uint64_t)v12, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    id v24 = *(void **)v12;
    char v25 = v12[8];
    if (swift_getEnumCaseMultiPayload() == 1)
    {

      goto LABEL_12;
    }
    uint64_t v26 = *(void **)v17;
    if (v25)
    {
      if (*(unsigned char *)(v17 + 8))
      {
        if (!v24)
        {

          if (!v26)
          {

            goto LABEL_34;
          }

          uint64_t v30 = 0;
          goto LABEL_23;
        }
        if (v26)
        {
          sub_10000E8D8(0, &qword_10002DCD8);
          id v27 = v24;
          id v28 = v26;
          char v29 = sub_1000226A0();

          if (v29) {
            goto LABEL_34;
          }
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v30 = v24;
    }
    else
    {
      if ((*(unsigned char *)(v17 + 8) & 1) == 0)
      {
        sub_10000E8D8(0, &qword_10002DCC8);
        id v31 = v24;
        id v32 = v26;
        char v33 = sub_1000226A0();

        if (v33) {
          goto LABEL_34;
        }
        goto LABEL_28;
      }

      uint64_t v30 = v24;
    }
LABEL_23:

LABEL_28:
    sub_10000A39C((uint64_t)v16, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    return 0;
  }
  sub_10000E4EC((uint64_t)v16, (uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10000E484(v17, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    sub_10000E8D8(0, &qword_10002DCC8);
    if (sub_1000226A0() & 1) != 0 && (sub_100021C90())
    {
      uint64_t v18 = *(int *)(ReminderView + 24);
      char v19 = *(void **)&v10[v18];
      uint64_t v20 = *(void **)&v6[v18];
      if (v19)
      {
        if (v20)
        {
          sub_10000E8D8(0, &qword_10002DCD0);
          id v21 = v20;
          id v22 = v19;
          char v23 = sub_1000226A0();

          if (v23) {
            goto LABEL_8;
          }
        }
      }
      else if (!v20)
      {
LABEL_8:
        sub_10000A39C((uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
        sub_10000A39C((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_34:
        sub_10000A39C((uint64_t)v16, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
        return 1;
      }
    }
    sub_10000A39C((uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    sub_10000A39C((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    goto LABEL_28;
  }
  sub_10000A39C((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_12:
  sub_10000EA64((uint64_t)v16, &qword_10002DCC0);
  return 0;
}

BOOL sub_10000DC60(uint64_t a1, uint64_t a2)
{
  uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  uint64_t v39 = *(void *)(ReminderNotesCellContent - 8);
  uint64_t v40 = ReminderNotesCellContent;
  __chkstk_darwin(ReminderNotesCellContent);
  uint64_t v38 = (uint64_t)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006B9C(&qword_10002DCB0);
  __chkstk_darwin(v6);
  uint64_t v41 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006B9C(&qword_10002DB48);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  char v16 = (char *)&v38 - v15;
  uint64_t v17 = sub_100021FE0();
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v22 = (char *)&v38 - v21;
  sub_100021FB0();
  sub_100021FB0();
  char v23 = sub_100021FD0();
  sub_10000A39C((uint64_t)v20, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.ItemID);
  sub_10000A39C((uint64_t)v22, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.ItemID);
  if ((v23 & 1) == 0) {
    return 0;
  }
  uint64_t ReminderNotesCellContentState = (int *)type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  uint64_t v25 = ReminderNotesCellContentState[5];
  uint64_t v26 = *(void **)(a1 + v25);
  id v27 = *(void **)(a2 + v25);
  if (v26)
  {
    if (!v27) {
      return 0;
    }
    sub_10000E8D8(0, &qword_10002DCB8);
    id v28 = v27;
    id v29 = v26;
    char v30 = sub_1000226A0();

    if ((v30 & 1) == 0) {
      return 0;
    }
  }
  else if (v27)
  {
    return 0;
  }
  if (*(unsigned __int8 *)(a1 + ReminderNotesCellContentState[6]) != *(unsigned __int8 *)(a2
                                                                                         + ReminderNotesCellContentState[6])
    || (sub_100022270() & 1) == 0)
  {
    return 0;
  }
  sub_10000EAC0(a1 + ReminderNotesCellContentState[8], (uint64_t)v16, &qword_10002DB48);
  sub_10000EAC0(a2 + ReminderNotesCellContentState[8], (uint64_t)v14, &qword_10002DB48);
  uint64_t v31 = v41;
  uint64_t v32 = v41 + *(int *)(v6 + 48);
  sub_10000EAC0((uint64_t)v16, v41, &qword_10002DB48);
  sub_10000EAC0((uint64_t)v14, v32, &qword_10002DB48);
  uint64_t v33 = v40;
  uint64_t v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
  if (v34(v31, 1, v40) == 1)
  {
    sub_10000EA64((uint64_t)v14, &qword_10002DB48);
    sub_10000EA64((uint64_t)v16, &qword_10002DB48);
    if (v34(v32, 1, v33) == 1)
    {
      sub_10000EA64(v31, &qword_10002DB48);
      return 1;
    }
    goto LABEL_14;
  }
  sub_10000EAC0(v31, (uint64_t)v11, &qword_10002DB48);
  if (v34(v32, 1, v33) == 1)
  {
    sub_10000EA64((uint64_t)v14, &qword_10002DB48);
    sub_10000EA64((uint64_t)v16, &qword_10002DB48);
    sub_10000A39C((uint64_t)v11, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
LABEL_14:
    sub_10000EA64(v31, &qword_10002DCB0);
    return 0;
  }
  uint64_t v35 = v38;
  sub_10000E484(v32, v38, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  char v36 = sub_10000D744((uint64_t)v11, v35);
  sub_10000A39C(v35, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  sub_10000EA64((uint64_t)v14, &qword_10002DB48);
  sub_10000EA64((uint64_t)v16, &qword_10002DB48);
  sub_10000A39C((uint64_t)v11, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  sub_10000EA64(v31, &qword_10002DB48);
  return (v36 & 1) != 0;
}

id sub_10000E140(unsigned __int8 a1)
{
  int v2 = a1;
  uint64_t v3 = sub_100006B9C(&qword_10002DCA0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v18[-v7];
  uint64_t ReminderNotesCellContentState = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  uint64_t v10 = *(void *)(ReminderNotesCellContentState - 8);
  __chkstk_darwin(ReminderNotesCellContentState);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id result = sub_100003BA4();
  if (v2 == 3)
  {
    uint64_t v14 = (uint64_t)v1 + *(void *)((swift_isaMask & *v1) + 0x78);
    swift_beginAccess();
    sub_10000EAC0(v14, (uint64_t)v8, &qword_10002DCA0);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, ReminderNotesCellContentState) == 1)
    {
      return (id)sub_10000EA64((uint64_t)v8, &qword_10002DCA0);
    }
    else
    {
      sub_10000E484((uint64_t)v8, (uint64_t)v12, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
      uint64_t v15 = (void *)((char *)v1 + *(void *)((swift_isaMask & *v1) + 0x68));
      swift_beginAccess();
      if (!*v15
        || (id v16 = [*(id *)(*v15 + qword_10002D940) attributedText]) == 0)
      {
        id v16 = [objc_allocWithZone((Class)NSAttributedString) init];
      }
      uint64_t v17 = *(int *)(ReminderNotesCellContentState + 20);

      *(void *)&v12[v17] = v16;
      sub_10000E4EC((uint64_t)v12, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, ReminderNotesCellContentState);
      sub_100021E30();
      sub_10000EA64((uint64_t)v6, &qword_10002DCA0);
      return (id)sub_10000A39C((uint64_t)v12, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
    }
  }
  return result;
}

uint64_t sub_10000E41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B9C(&qword_10002DCA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E484(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E4EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_10000E554(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_100021CB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)a1 + *(int *)(ReminderView + 20), v4);
  uint64_t v9 = *a1;
  id v10 = objc_allocWithZone((Class)sub_100022260());
  id v11 = v9;
  uint64_t v12 = (void *)sub_100022250();
  [v12 _setApplyCornerRadius:1];
  [v12 _setPreferredSizeClass:8];
  id v13 = [v12 layer];
  if (qword_10002D7A0 != -1) {
    swift_once();
  }
  [v13 setCornerRadius:*(double *)&qword_10002D7A8];

  id v14 = [v12 layer];
  [v14 setMasksToBounds:1];

  [v12 setUserInteractionEnabled:0];
  uint64_t v15 = a2 + qword_10002D960;
  id v16 = *(void **)(a2 + qword_10002D960);
  *(void *)uint64_t v15 = v12;
  *(unsigned char *)(v15 + 8) = 1;
  id v17 = v12;

  sub_100003EB0();
  return v17;
}

double sub_10000E754(void *a1, double a2, double a3)
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return *(double *)sub_100022670();
  }
  uint64_t v7 = (unsigned __int8 *)Strong;
  if (*(void **)(Strong + qword_10002D940) == a1)
  {
    objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", a2, a3);
    double v11 = v12;
    int v13 = v7[qword_10002D960 + 8];
    id v14 = *(id *)&v7[qword_10002D960];

    if (v13)
    {
      if (v13 == 1) {
    }
      }
    else
    {
    }
  }
  else
  {
    uint64_t v8 = *(void **)(Strong + qword_10002D960);
    if (*(unsigned char *)(Strong + qword_10002D960 + 8))
    {
      if (*(unsigned char *)(Strong + qword_10002D960 + 8) != 1 || v8 != a1) {
        goto LABEL_15;
      }
      objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", a2, 120.0);
      double v11 = v10;
    }
    else
    {
      if (v8 != a1)
      {
LABEL_15:
        double v11 = *(double *)sub_100022670();

        return v11;
      }
      objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", a2, a3);
      double v16 = v15;
      double v18 = v17;

      if (v16 > v18) {
        double v19 = v16;
      }
      else {
        double v19 = v18;
      }
      return fmin(v19, 88.0);
    }
  }
  return v11;
}

uint64_t sub_10000E8D8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_10000E914()
{
  unint64_t result = qword_10002DD80;
  if (!qword_10002DD80)
  {
    sub_10000E970(&qword_10002DD78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DD80);
  }
  return result;
}

uint64_t sub_10000E970(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000E9B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000E9F0()
{
  uint64_t v1 = *(void *)(v0 + 16) + qword_10002D960;
  int v2 = *(void **)v1;
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 2;

  sub_100003EB0();
}

uint64_t sub_10000EA34()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EA44()
{
  return sub_10001EBC0(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000EA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EA5C()
{
  return swift_release();
}

uint64_t sub_10000EA64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006B9C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000EAC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006B9C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000EB24()
{
  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000EB68()
{
  sub_1000042FC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_10000EB78()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EB88()
{
  uint64_t v1 = (int *)(type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;

  uint64_t v6 = v0 + v3;
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_100021CB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v5, v4);
}

void sub_10000EC9C()
{
  uint64_t v1 = *(void *)(type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_1000044AC(v2, v3);
}

uint64_t sub_10000ED2C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
}

__n128 initializeWithTake for TTRIExtensionCreateReminderViewController.Argument(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000ED60(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000ED80(uint64_t result, int a2, int a3)
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

void sub_10000EDBC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000EE04()
{
  return sub_10000EE6C(&qword_10002DDA0);
}

uint64_t sub_10000EE38()
{
  return sub_10000EE6C(&qword_10002DDA8);
}

uint64_t sub_10000EE6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UILayoutPriority(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EEB0()
{
  return sub_10000EE6C(&qword_10002DDB0);
}

uint64_t sub_10000EEFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X6>, _OWORD *a7@<X8>)
{
  uint64_t v21 = a6;
  uint64_t v22 = a4;
  char v23 = a5;
  uint64_t v11 = sub_100021FC0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006B9C(&qword_10002DFE0);
  __chkstk_darwin(v15 - 8);
  double v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EAC0(a1, (uint64_t)v17, &qword_10002DFE0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
  {
    a7[1] = 0u;
    a7[2] = 0u;
    *a7 = 0u;
    double v18 = v23;
  }
  else
  {
    sub_100012F24((uint64_t)v17, (uint64_t)v14, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    double v18 = v23;
    (*(void (**)(char *, uint64_t, _UNKNOWN **, uint64_t, uint64_t, void *))(a2 + *v21))(v14, a2, &off_100029290, a3, v22, v23);
    sub_100012F8C((uint64_t)v14, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
  }
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_10000F0E8()
{
  uint64_t v0 = sub_1000224A0();
  sub_100012C58(v0, qword_10002DE30);
  uint64_t v1 = sub_100012A58(v0, (uint64_t)qword_10002DE30);
  if (qword_10002D7C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012A58(v0, (uint64_t)qword_10002E560);
  char v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10000F1B0(char **a1@<X8>)
{
  void (*v32)(long long *__return_ptr, uint64_t, void *);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ReminderViewModel;
  id v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  char *v43;
  char *v44;
  id v45;
  char *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t ReminderView;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char **v67;
  Class isa;
  id v69;
  id v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  id v78;
  void *v79;
  char v80;
  int *v81;
  char *v82;
  id v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  char *v101;
  uint64_t inited;
  id v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  unsigned char *v112;
  id v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  char *v122;
  int v123;
  char *v124;
  char *v125;
  id v126;
  int v127;
  unint64_t v128;
  char **v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  _UNKNOWN **v143;
  long long v144;
  uint64_t v145;
  long long v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  char v151[8];

  uint64_t v133 = sub_1000223F0();
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  uint64_t v134 = (char *)&v119 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v138 = sub_100021CB0();
  uint64_t v137 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v136 = (char *)&v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006B9C(&qword_10002DFE8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v135 = (char *)&v119 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v140 = (uint64_t)&v119 - v8;
  uint64_t v9 = sub_100006B9C(&qword_10002DFE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100021FC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v141 = (uint64_t)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v139 = v1;
  uint64_t v15 = *(void *)(v1
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                  + 8);
  uint64_t ObjectType = swift_getObjectType();
  double v17 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 24);
  uint64_t v18 = v17(ObjectType, v15);
  if (!v18) {
    goto LABEL_11;
  }
  double v19 = (void *)v18;
  uint64_t v20 = (void *)v17(ObjectType, v15);
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_10;
  }
  uint64_t v21 = v20;
  uint64_t v22 = &selRef_setAccessibilityIdentifier_;
  id v23 = [v20 objectID];
  sub_100022050();

  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_10:

    sub_10000EA64((uint64_t)v11, &qword_10002DFE0);
LABEL_11:
    ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
    (*(void (**)(char **, uint64_t, uint64_t, uint64_t))(*(void *)(ReminderViewModel - 8) + 56))(a1, 1, 1, ReminderViewModel);
    return;
  }
  sub_100012F24((uint64_t)v11, v141, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
  int v121 = v139 + 16;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v25 = v140;
  if (!Strong) {
    goto LABEL_13;
  }
  uint64_t v26 = (char *)*(id *)(sub_10002028C() + 32);
  swift_release();
  id v27 = &v26[direct field offset for TTRIReminderTitleCellContent.titleModule];
  swift_beginAccess();
  if (!*(void *)v27)
  {
    swift_unknownObjectRelease();

    goto LABEL_13;
  }
  sub_10000EAC0((uint64_t)v27, (uint64_t)&v142, &qword_10002E010);

  unint64_t v28 = (unint64_t)v142;
  id v29 = v143;
  swift_unknownObjectRetain();
  sub_10000EA64((uint64_t)&v142, &qword_10002E010);
  swift_unknownObjectRelease();
  if (!v28)
  {
LABEL_13:
    unint64_t v28 = 0;
    goto LABEL_14;
  }
  uint64_t v30 = swift_getObjectType();
  uint64_t v31 = v29[1];
  uint64_t v32 = (void (*)(long long *__return_ptr, uint64_t, void *))v31[4];
  swift_unknownObjectRetain();
  v32(&v146, v30, v31);
  swift_unknownObjectRelease();
  sub_1000132B8(&v146, (uint64_t)&v142);
  uint64_t v33 = *((void *)&v144 + 1);
  uint64_t v34 = v145;
  sub_100012478(&v142, *((uint64_t *)&v144 + 1));
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34) & 1) == 0)
  {
    sub_1000132D0((uint64_t)&v142);
LABEL_14:
    uint64_t v38 = [v19 titleAsString];
    if (v38)
    {
      uint64_t v39 = v38;
      sub_100022510();

      sub_100022520();
      id v127 = v40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v127 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v35 = *((void *)&v144 + 1);
  char v36 = v145;
  sub_100012478(&v142, *((uint64_t *)&v144 + 1));
  id v127 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 40))(v35, v36);
  sub_1000132D0((uint64_t)&v142);
LABEL_17:
  char v148 = sub_10000E8D8(0, &qword_10002DFF0);
  id v149 = &protocol witness table for REMReminderChangeItem;
  *(void *)&v146 = v19;
  uint64_t v41 = v19;
  sub_100022280();
  long long v42 = v142;
  if (v142)
  {
    long long v43 = (char *)v142;
  }
  else
  {
    long long v43 = (char *)[v41 title];
    if (!v43) {
      long long v43 = (char *)[objc_allocWithZone((Class)NSAttributedString) init];
    }
  }
  uint64_t v125 = v43;
  long long v44 = (char *)v143;
  uint64_t v126 = v42;
  if (v143)
  {
    uint64_t v45 = v42;
    uint64_t v46 = v44;
  }
  else
  {
    uint64_t v47 = v42;
    uint64_t v46 = (char *)[v41 notes];
    if (!v46) {
      uint64_t v46 = (char *)[objc_allocWithZone((Class)NSAttributedString) init];
    }
  }
  id v124 = v46;
  int v122 = v44;
  uint64_t v48 = [v41 accountCapabilities];
  LODWORD(v44) = [v48 supportsTextStyling];

  uint64_t v49 = [v41 attachmentContext];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = [v49 attachments];

    sub_10000E8D8(0, &qword_10002E008);
    uint64_t v52 = sub_100022580();
  }
  else
  {
    uint64_t v52 = (unint64_t)&_swiftEmptyArrayStorage;
  }
  uint64_t v130 = v41;
  if (v52 >> 62) {
    goto LABEL_113;
  }
  uint64_t v53 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    id v128 = v28;
    uint64_t v129 = a1;
    v123 = (int)v44;
    if (!v53) {
      goto LABEL_43;
    }
    uint64_t v54 = 0;
    unint64_t v28 = v52 & 0xC000000000000001;
    if ((v52 & 0xC000000000000001) == 0) {
      break;
    }
    long long v44 = (char *)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_100022740();
      self;
      if (swift_dynamicCastObjCClass())
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_42;
      }
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v55 = v54 + 1;
      if (__OFADD__(v54, 1)) {
        break;
      }
      ++v54;
      if (v55 == v53) {
        goto LABEL_43;
      }
    }
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    swift_bridgeObjectRetain_n();
    uint64_t v53 = sub_100022790();
    swift_bridgeObjectRelease();
  }
  while (1)
  {
    long long v44 = *(char **)(v52 + 32 + 8 * v54);
    self;
    if (swift_dynamicCastObjCClass()) {
      break;
    }
    uint64_t v56 = v54 + 1;
    if (__OFADD__(v54, 1)) {
      goto LABEL_111;
    }
    ++v54;
    if (v56 == v53) {
      goto LABEL_43;
    }
  }
LABEL_42:
  if (v54 == v53)
  {
LABEL_43:
    swift_bridgeObjectRelease();
    uint64_t v57 = 0;
    goto LABEL_44;
  }
  if (v28)
  {
    int v92 = (id)sub_100022740();
    goto LABEL_75;
  }
  if ((v54 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_116;
  }
  if (v54 >= *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  int v92 = *(id *)(v52 + 8 * v54 + 32);
LABEL_75:
  uint64_t v75 = (unint64_t)v92;
  self;
  long long v93 = swift_dynamicCastObjCClass();
  if (!v93) {
    goto LABEL_120;
  }
  uint64_t v57 = (void *)v93;
  swift_bridgeObjectRelease();
LABEL_44:
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  int v59 = *(void *)(ReminderView - 8);
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
  a1 = (char **)(v59 + 56);
  v60(v25, 1, 1, ReminderView);
  id v131 = v57;
  if (v57)
  {
    uint64_t v61 = v131;
    uint64_t v62 = [v61 metadata];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = sub_100021CD0();
      long long v66 = v65;

      sub_100013208(v64, v66);
      uint64_t v67 = v22;
      Class isa = sub_100021CC0().super.isa;
      v120 = [self metadataWithDataRepresentation:isa];
      sub_100013260(v64, v66);

      uint64_t v22 = v67;
      sub_100013260(v64, v66);
    }
    else
    {
      v120 = 0;
    }
    long long v69 = [v61 v22[7]];
    uint64_t v70 = [v61 url];
    long long v71 = v136;
    sub_100021CA0();

    long long v72 = v140;
    sub_10000EA64(v140, &qword_10002DFE8);
    long long v73 = v135;
    *(void *)uint64_t v135 = v69;
    (*(void (**)(char *, char *, uint64_t))(v137 + 32))(&v73[*(int *)(ReminderView + 20)], v71, v138);
    *(void *)&v73[*(int *)(ReminderView + 24)] = v120;
    v60((uint64_t)v73, 0, 1, ReminderView);
    uint64_t v74 = (uint64_t)v73;
    uint64_t v25 = v72;
    sub_1000130B8(v74, v72, &qword_10002DFE8);
  }
  uint64_t v22 = v129;
  if (!v53) {
    goto LABEL_62;
  }
  uint64_t v75 = 0;
  unint64_t v28 = v52 & 0xC000000000000001;
  if ((v52 & 0xC000000000000001) != 0)
  {
    long long v44 = (char *)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_100022740();
      self;
      if (swift_dynamicCastObjCClass()) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v76 = (char *)(v75 + 1);
      if (__OFADD__(v75, 1)) {
        goto LABEL_110;
      }
      ++v75;
      if (v76 == (char *)v53) {
        goto LABEL_62;
      }
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    while (1)
    {
      long long v44 = *(char **)(v52 + 32 + 8 * v75);
      self;
      if (swift_dynamicCastObjCClass()) {
        break;
      }
      uint64_t v77 = (char *)(v75 + 1);
      if (__OFADD__(v75, 1)) {
        goto LABEL_112;
      }
      ++v75;
      if (v77 == (char *)v53) {
        goto LABEL_62;
      }
    }
  }
  if (v75 == v53)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    uint64_t v78 = v131;
    if (v131)
    {

      swift_unknownObjectRelease();
LABEL_64:
      uint64_t v79 = 0;
      goto LABEL_65;
    }
    uint64_t v83 = v130;
    id v84 = [v130 userActivity];
    if (!v84)
    {

      swift_unknownObjectRelease();
      goto LABEL_64;
    }
    uint64_t v85 = v84;
    uint64_t v86 = v132;
    uint64_t v87 = v133;
    (*(void (**)(char *, void, uint64_t))(v132 + 104))(v134, enum case for REMApplicationIconFormat.reminderListiOS(_:), v133);
    uint64_t v88 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v88)
    {
LABEL_87:
      uint64_t v101 = v134;
      uint64_t v79 = (void *)sub_100022630();

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v86 + 8))(v101, v87);
      if (v79)
      {
        swift_bridgeObjectRelease();
        uint64_t v80 = 0;
        goto LABEL_66;
      }
LABEL_65:
      uint64_t v80 = -1;
LABEL_66:
      sub_100012F24(v141, (uint64_t)v22, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
      v146 = v144;
      v147 = v145;
      sub_100013004((uint64_t)&v146 + 8, (uint64_t)v151);
      sub_100013060((uint64_t)v151);

      sub_10001308C((uint64_t)v151);
      uint64_t v150 = v147;
      sub_10001308C((uint64_t)&v150);
      id v81 = (int *)type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
      *((unsigned char *)v22 + v81[5]) = v127 & 1;
      *(char **)((char *)v22 + v81[6]) = v125;
      *(char **)((char *)v22 + v81[7]) = v124;
      *((unsigned char *)v22 + v81[8]) = v123;
      sub_100013004((uint64_t)v151, (uint64_t)v22 + v81[9]);
      sub_1000130B8(v25, (uint64_t)v22 + v81[10], &qword_10002DFE8);
      uint64_t v82 = (char *)v22 + v81[11];
      *(void *)uint64_t v82 = v79;
      v82[8] = v80;
      (*(void (**)(char **, void, uint64_t, int *))(*((void *)v81 - 1) + 56))(v22, 0, 1, v81);
      return;
    }
    uint64_t v89 = [v88 view];
    if (v89)
    {
      uint64_t v90 = v89;
      unsigned __int8 v91 = [v89 traitCollection];

      [v91 displayScale];
      swift_unknownObjectRelease();

      goto LABEL_87;
    }
    goto LABEL_122;
  }
  if (!v28)
  {
    if ((v75 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v75 < *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      long long v94 = *(id *)(v52 + 8 * v75 + 32);
      goto LABEL_81;
    }
    __break(1u);
LABEL_120:

    __break(1u);
    goto LABEL_121;
  }
LABEL_117:
  long long v94 = (id)sub_100022740();
LABEL_81:
  uint64_t v75 = (unint64_t)v94;
  self;
  long long v95 = swift_dynamicCastObjCClass();
  if (!v95)
  {
LABEL_121:

    __break(1u);
LABEL_122:
    __break(1u);
    goto LABEL_123;
  }
  uint64_t v96 = v95;
  swift_bridgeObjectRelease();
  uint64_t v97 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v97)
  {
LABEL_89:
    sub_100010FD4();
    sub_100006B9C(&qword_10002DD48);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100023040;
    *(void *)(inited + 32) = v96;
    *(void *)&v146 = inited;
    sub_100022590();
    uint64_t v103 = (id)v75;
    id v104 = sub_1000220F0();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v105 = *(void *)(v104 + 16);
    if (v105)
    {
      uint64_t v79 = *(void **)(v104 + 32);
      v106 = *(void **)(v104 + 40);
      if (*(unsigned char *)(v104 + 48))
      {
        if (*(unsigned char *)(v104 + 48) == 1)
        {
          sub_10000E8D8(0, &qword_10002DFF8);
          sub_10001311C(v79, v106, 1);
          swift_retain();
          id v107 = (void *)sub_100022660();
          swift_allocObject();
          swift_weakInit();
          sub_100006B9C(&qword_10002E000);
          sub_100022430();
          sub_100012FEC(0, 0xFFu);
          swift_release();
          swift_release();

          swift_release();
          sub_1000131A0(v79, v106, 1);
        }
        else
        {
          sub_100012FEC(0, 0xFFu);
        }
        uint64_t v79 = 0;
      }
      else
      {
        uint64_t v108 = v79;
        v109 = v106;
        sub_100012FEC(0, 0xFFu);
        id v110 = v108;
        sub_1000131A0(v79, v106, 0);
      }
      uint64_t v111 = v105 - 1;
      if (v105 == 1)
      {
        uint64_t v80 = 1;
        uint64_t v25 = v140;
      }
      else
      {
        unsigned __int8 v138 = (uint64_t)v103;
        uint64_t v112 = (unsigned char *)(v104 + 72);
        do
        {
          v116 = (void *)*((void *)v112 - 2);
          uint64_t v117 = (void *)*((void *)v112 - 1);
          if (*v112)
          {
            if (*v112 == 1)
            {
              sub_10000E8D8(0, &qword_10002DFF8);
              sub_10001311C(v116, v117, 1);
              swift_retain();
              uint64_t v118 = (void *)sub_100022660();
              swift_allocObject();
              swift_weakInit();
              sub_100006B9C(&qword_10002E000);
              sub_100022430();
              sub_100012FEC(v79, 1u);
              swift_release();
              swift_release();

              swift_release();
              sub_1000131A0(v116, v117, 1);
            }
            else
            {
              sub_100012FEC(v79, 1u);
            }
            uint64_t v79 = 0;
          }
          else
          {
            uint64_t v113 = v116;
            id v114 = v117;
            sub_100012FEC(v79, 1u);
            uint64_t v115 = v113;
            sub_1000131A0(v116, v117, 0);
            uint64_t v79 = v116;
          }
          v112 += 24;
          --v111;
        }
        while (v111);
        uint64_t v80 = 1;
        uint64_t v22 = v129;
        uint64_t v25 = v140;
        uint64_t v103 = (id)v138;
      }
    }
    else
    {
      uint64_t v79 = 0;
      uint64_t v80 = -1;
    }

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    goto LABEL_66;
  }
  uint64_t v98 = [v97 view];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = [v98 traitCollection];

    [v100 displayScale];
    swift_unknownObjectRelease();

    goto LABEL_89;
  }
LABEL_123:
  __break(1u);
}

uint64_t sub_1000104D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  return sub_1000104EC(a1, a2, a3, &OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_makeCellTitleModule, a4);
}

uint64_t sub_1000104E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  return sub_1000104EC(a1, a2, a3, &OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_makeCellNotesModule, a4);
}

uint64_t sub_1000104EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v7 = v5;
  uint64_t v12 = sub_100006B9C(&qword_10002DFE0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = *(void *)(v5
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                  + 8);
  uint64_t ObjectType = swift_getObjectType();
  double v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(ObjectType, v15);
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = [v17 objectID];
    sub_100022050();

    uint64_t v20 = sub_100021FC0();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_100021FC0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_10000EEFC((uint64_t)v14, v7, a1, a2, a3, a4, a5);
  return sub_10000EA64((uint64_t)v14, &qword_10002DFE0);
}

uint64_t sub_1000106BC()
{
  uint64_t v1 = sub_1000223B0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002D7B0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000224A0();
  sub_100012A58(v5, (uint64_t)qword_10002DE30);
  sub_1000124C4((uint64_t)&_swiftEmptyArrayStorage);
  sub_1000157D4();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v0
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v9 = *(void (**)(void (*)(void *, char), uint64_t, uint64_t, uint64_t))(v6 + 136);
  swift_retain();
  v9(sub_100012AC8, v8, ObjectType, v6);
  swift_release_n();
  uint64_t v10 = *(void **)sub_100021D60();
  sub_1000223E0();
  id v11 = v10;
  sub_1000223D0();
  uint64_t v12 = sub_100006B9C(&qword_10002DFB8);
  uint64_t v13 = (uint64_t *)&v4[*(int *)(v12 + 48)];
  uint64_t v14 = enum case for REMUserOperation.commitNewReminder(_:);
  uint64_t v15 = sub_1000223A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v4, v14, v15);
  uint64_t *v13 = sub_100021D70();
  v13[1] = v16;
  sub_100021D80();
  uint64_t v21 = sub_100022820();
  uint64_t v22 = v17;
  uint64_t v18 = (uint64_t *)&v4[*(int *)(v12 + 80)];
  v23._countAndFlagsBits = 0x69736E657478452DLL;
  v23._object = (void *)0xEA00000000006E6FLL;
  sub_100022540(v23);
  uint64_t v19 = v22;
  uint64_t *v18 = v21;
  v18[1] = v19;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for REMAnalyticsEvent.userOperation(_:), v1);
  sub_1000223C0();

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_1000109DC(void *a1, char a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (swift_unknownObjectWeakLoadStrong())
    {
      if (a2)
      {
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          uint64_t v10 = (void *)Strong;
          sub_100012AD4(a1, 1);
          sub_100012AD4(a1, 1);
          swift_retain();
          sub_100013988();
          uint64_t v12 = v11;

          uint64_t v13 = (void *)sub_100021C80();
          [v12 viewServiceDidFailWithError:v13];
          sub_100012AE0(a1, 1);
          swift_unknownObjectRelease();
          swift_release_n();

          swift_unknownObjectRelease();
        }
        else
        {
          sub_100012AD4(a1, 1);
          swift_unknownObjectRelease();
          swift_release();
        }
        uint64_t v14 = a1;
        char v15 = 1;
      }
      else
      {
        sub_100022480();
        id v4 = a1;
        sub_100022470();
        uint64_t v5 = swift_unknownObjectWeakLoadStrong();
        if (v5)
        {
          uint64_t v6 = (void *)v5;
          swift_retain();
          sub_100013988();
          uint64_t v8 = v7;

          [v8 viewServiceDidFinish];
          swift_release_n();
          swift_unknownObjectRelease();
        }
        else
        {
          swift_release();
        }
        swift_unknownObjectRelease();
        uint64_t v14 = a1;
        char v15 = 0;
      }
      sub_100012AE0(v14, v15);
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_100010B94()
{
  if (qword_10002D7B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000224A0();
  sub_100012A58(v0, (uint64_t)qword_10002DE30);
  sub_1000124C4((uint64_t)&_swiftEmptyArrayStorage);
  sub_1000157D4();
  swift_bridgeObjectRelease();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v3 = (void *)Strong;
      sub_100013988();
      uint64_t v5 = v4;

      [v5 viewServiceDidCancel];
      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100010CA4(void *a1, uint64_t a2, uint64_t a3, int a4, void (*a5)(id), uint64_t a6)
{
  void (*v17)(uint64_t *__return_ptr, uint64_t, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id Strong;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(id);
  id v38;
  uint64_t v39[20];
  long long v40;
  long long v41;
  long long v42;
  long long v43;

  uint64_t v32 = a6;
  uint64_t v37 = a5;
  HIDWORD(v31) = a4;
  uint64_t v33 = a2;
  uint64_t v8 = sub_100022410();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = 1;
  if (*(unsigned char *)(a3 + 48)) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  uint64_t v38 = (id)v13;
  uint64_t v34 = sub_100021F20();
  uint64_t v35 = v14;
  char v36 = a3;
  uint64_t v15 = *(void *)(a3
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                  + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v17 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v15 + 48);
  uint64_t v18 = a1;
  v17(v39, ObjectType, v15);
  if (v33 < 1)
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for REMRemindersListDataView.SectionLite.SectionType.sectionless(_:), v8);
    sub_100021D40();
    uint64_t v12 = v39[10];
    uint64_t v19 = v39[11];
    uint64_t v21 = v39[12];
    uint64_t v20 = v39[13];
    uint64_t v22 = v39[14];
  }
  v39[15] = v12;
  v39[16] = v19;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v22;
  sub_100022040();
  uint64_t v40 = 0u;
  uint64_t v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  Swift::String v23 = (void *)v34;
  id v24 = v36;
  uint64_t v25 = (void *)sub_100022030();
  sub_100012718((void *)v12);
  sub_100012768(v39);
  swift_unknownObjectRelease();

  swift_release();
  uint64_t v26 = *sub_100012478((void *)(v24+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router), *(void *)(v24+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router+ 24));
  uint64_t Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v28 = Strong;
    id v29 = [Strong navigationController];

    if (v29)
    {
      [v29 pushViewController:v25 animated:BYTE4(v31) & 1];

      uint64_t v30 = *(void **)(v26 + 24);
      *(void *)(v26 + 24) = v25;

      uint64_t Strong = v25;
    }
  }
  if (v37) {
    v37(Strong);
  }

  sub_10001285C(v38, 2);
}

uint64_t sub_100010FD4()
{
  uint64_t v1 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager);
  }
  else
  {
    uint64_t v3 = v0;
    sub_1000221F0();
    swift_allocObject();
    sub_1000221E0();
    sub_10000E8D8(0, &qword_10002DFF8);
    sub_100022660();
    sub_100022390();
    sub_100022380();
    sub_100021ED0();
    swift_allocObject();
    sub_100021EC0();
    sub_100022110();
    swift_allocObject();
    uint64_t v2 = sub_100022100();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_100011130@<X0>(BOOL *a1@<X8>)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  uint64_t v3 = result;
  if (result)
  {
    v4._object = (void *)0x8000000100023F10;
    v4._countAndFlagsBits = 0xD000000000000011;
    sub_100021DB0(v4);
    uint64_t result = swift_release();
  }
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_1000111CC()
{
  sub_100013404(v0 + 16);
  sub_100013404(v0 + 32);
  sub_10000EA64(v0+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_viewModel, &qword_10002DFD8);
  swift_unknownObjectRelease();
  sub_1000132D0(v0+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_undoManager));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1000112A4()
{
  sub_1000111CC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000112FC()
{
  return type metadata accessor for TTRIExtensionCreateReminderPresenter();
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderPresenter()
{
  uint64_t result = qword_10002DEB8;
  if (!qword_10002DEB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100011350()
{
  sub_100011440();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100011440()
{
  if (!qword_10002DEC8)
  {
    type metadata accessor for TTRIExtensionCreateReminderViewModel(255);
    unint64_t v0 = sub_1000226D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002DEC8);
    }
  }
}

uint64_t sub_100011498()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v2 = (void *)Strong;
      sub_100013988();
      Swift::String v4 = v3;

      [v4 viewServiceDidCancel];
      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001152C()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v2 = (void *)Strong;
      swift_errorRetain();
      sub_100013988();
      Swift::String v4 = v3;

      uint64_t v5 = (void *)sub_100021C80();
      [v4 viewServiceDidFailWithError:v5];
      swift_errorRelease();
      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000115E8()
{
  v0._object = (void *)0x8000000100023F10;
  v0._countAndFlagsBits = 0xD000000000000011;
  sub_100021DB0(v0);
}

uint64_t sub_10001162C()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100021F10();
    sub_1000212A4();
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000116A8()
{
  sub_100012478((void *)(v0+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router), *(void *)(v0+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router+ 24));
  swift_retain();
  sub_1000164A0((uint64_t)sub_1000124BC, v0);

  return swift_release();
}

void sub_10001171C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_1000130B8(a2, (uint64_t)v35, &qword_10002DFB0);
  uint64_t v6 = v35[8];
  uint64_t v8 = v36;
  uint64_t v7 = v37;
  uint64_t v10 = v38;
  uint64_t v9 = v39;
  char v11 = v40;
  uint64_t v12 = a3;
  sub_1000130B8(a2, (uint64_t)&v41, &qword_10002DFB0);
  if (v43 != 2)
  {
    uint64_t v33 = a3;
    char v13 = v42;
    if (v42 != 255)
    {
      uint64_t v30 = v6;
      uint64_t v14 = v41;
      uint64_t v15 = *(void *)(a3
                      + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                      + 8);
      uint64_t v31 = v8;
      uint64_t v32 = v7;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v17 = *(void (**)(void *, void, uint64_t, uint64_t))(v15 + 104);
      id v18 = v14;
      uint64_t v19 = ObjectType;
      uint64_t v7 = v32;
      v17(v14, v13 & 1, v19, v15);
      uint64_t v20 = v14;
      uint64_t v6 = v30;
      uint64_t v8 = v31;
      sub_100012A44(v20, v13);
    }
    if (v9 != 1)
    {
      v44[0] = v8;
      v44[1] = v7;
      v44[2] = v10;
      v44[3] = v9;
      char v45 = v11;
      uint64_t v21 = *(void *)(v33
                      + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                      + 8);
      uint64_t v22 = swift_getObjectType();
      Swift::String v23 = v8;
      id v24 = *(void (**)(void *, uint64_t, uint64_t))(v21 + 144);
      sub_100012A34(v23);
      sub_100012A34(v7);
      swift_bridgeObjectRetain();
      v24(v44, v22, v21);
      sub_10001284C(v23);
      uint64_t v12 = v33;
      sub_10001284C(v7);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    uint64_t v12 = v33;
    if (v6 != 255) {
      goto LABEL_9;
    }
  }
  v46._object = (void *)0x8000000100023F10;
  v46._countAndFlagsBits = 0xD000000000000011;
  sub_100021DB0(v46);
LABEL_9:
  uint64_t v25 = *(void *)(v12
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                  + 8);
  uint64_t v26 = swift_getObjectType();
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v25 + 64))(v26, v25) & 1) != 0 || (a4)
  {
    sub_1000106BC();
  }
  else
  {
    id v27 = *(void **)(*sub_100012478((void *)(v12+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router), *(void *)(v12+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router+ 24))+ 24);
    if (v27)
    {
      id v28 = [v27 navigationController];
      if (v28)
      {
        id v29 = v28;
      }
    }
  }
}

uint64_t sub_1000119BC()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64))(ObjectType, v1);
  if (result)
  {
    return sub_100010B94();
  }
  return result;
}

void sub_100011A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  char v8 = a6 & 1;
  uint64_t v9 = *(void *)(v6
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
  uint64_t v11 = swift_allocObject();
  sub_1000130B8(a5, v11 + 16, &qword_10002DFB0);
  *(void *)(v11 + 72) = v6;
  *(unsigned char *)(v11 + 80) = v8;
  sub_100012920(a5);
  swift_retain();
  id v12 = (id)sub_100022420();
  sub_100022430();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_100011B48()
{
  return 2;
}

void *sub_100011B54()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  if (!*(void *)(Strong
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver))
  {
    swift_unknownObjectRelease();
    return 0;
  }
  swift_retain();
  uint64_t v1 = (void *)sub_100022170();
  swift_unknownObjectRelease();
  swift_release();
  if (!v1) {
    return v1;
  }
  id v2 = [v1 primaryLanguage];

  if (!v2) {
    return 0;
  }
  uint64_t v1 = (void *)sub_100022510();

  return v1;
}

uint64_t sub_100011C1C()
{
  return sub_1000222C0();
}

uint64_t sub_100011C48()
{
  return sub_1000222B0();
}

uint64_t sub_100011C74()
{
  return sub_1000222A0();
}

uint64_t sub_100011CA0()
{
  return sub_100022290();
}

uint64_t sub_100011CCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100021FC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

void *sub_100011D38()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100011D44@<X0>(uint64_t a1@<X8>)
{
  if (qword_10002D7B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000224A0();
  sub_100012A58(v2, (uint64_t)qword_10002DE30);
  uint64_t v3 = sub_100022490();
  os_log_type_t v4 = sub_100022610();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "TTRIExtensionCreateReminderPresenter.autoCompletReminderListScope(for:) should not be called", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = sub_100022160();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, 1, 1, v6);
}

uint64_t sub_100011E6C()
{
  if (qword_10002D7B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000224A0();
  sub_100012A58(v0, (uint64_t)qword_10002DE30);
  uint64_t v1 = sub_100022490();
  os_log_type_t v2 = sub_100022610();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "TTRIExtensionCreateReminderPresenter.shouldApplyListOfAutoCompleteSuggestion() should not be called", v3, 2u);
    swift_slowDealloc();
  }

  return 0;
}

uint64_t sub_100011F48()
{
  return sub_100013320(*(uint64_t (**)(uint64_t))(v0 + 8), v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_100011F88(uint64_t a1)
{
  uint64_t v3 = sub_100021FC0();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v1
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(ObjectType, v6);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = (void *)v8;
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v6 + 56))(&v12, ObjectType, v6);
  if (!v13)
  {

    sub_10000EA64((uint64_t)&v12, &qword_10002E018);
    return 0;
  }
  sub_1000132B8(&v12, (uint64_t)v14);
  sub_100013334(a1, (uint64_t)v5);
  sub_100013398((uint64_t)v14, (uint64_t)&v12);
  swift_allocObject();
  swift_weakInit();
  sub_100022220();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v10 = sub_100022210();
  sub_1000132D0((uint64_t)v14);
  swift_release();
  return v10;
}

uint64_t sub_1000121B0()
{
  return 0;
}

void sub_1000121B8(id a1)
{
  if (qword_10002D7B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000224A0();
  sub_100012A58(v2, (uint64_t)qword_10002DE30);
  id v9 = a1;
  uint64_t v3 = sub_100022490();
  os_log_type_t v4 = sub_100022610();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    if (a1) {
      a1 = [v9 objectID];
    }
    sub_100006B9C(&qword_10002E020);
    uint64_t v6 = sub_1000226C0();
    unint64_t v8 = v7;

    sub_100015DE8(v6, v8, &v10);
    sub_1000226E0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "TTRIExtensionCreateReminderPresenter: setPendingMoveTargetList is called unexpectedly {listID: %s}", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_1000123D0(uint64_t a1)
{
  if ((*(void *)sub_100022320() & ~a1) == 0)
  {
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v2._object = (void *)0x8000000100023F10;
      v2._countAndFlagsBits = 0xD000000000000011;
      sub_100021DB0(v2);
      swift_release();
    }
  }
  return sub_100022310();
}

uint64_t sub_100012468(uint64_t a1, uint64_t a2)
{
  return sub_100011F88(a2);
}

void *sub_100012478(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000124BC()
{
  return sub_100011498();
}

unint64_t sub_1000124C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006B9C(&qword_10002DFC8);
  uint64_t v2 = sub_1000227A0();
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
    sub_10000EAC0(v6, (uint64_t)&v15, &qword_10002DFD0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100012AEC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100012C48(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000125FC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006B9C(&qword_10002DFC0);
  uint64_t v2 = (void *)sub_1000227A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100012AEC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

void *sub_100012718(void *result)
{
  if (result != (void *)1)
  {

    swift_bridgeObjectRelease();
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_100012768(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v3 = (void *)a1[3];
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = (void *)a1[8];
  id v8 = (void *)a1[9];
  sub_1000127EC(*a1);

  sub_1000127FC(v3, v4, v5, v6);
  return a1;
}

uint64_t sub_1000127EC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_1000127FC(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    sub_10001284C(result);
    sub_10001284C(a2);
    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10001284C(id a1)
{
  if (a1 != (id)1) {
}
  }

void sub_10001285C(id a1, char a2)
{
  if (a2 == 1) {
}
  }

uint64_t sub_100012870()
{
  uint64_t v1 = *(void *)(v0 + 56);
  if (v1 != 2)
  {
    if (*(unsigned __int8 *)(v0 + 24) != 255)
    {

      uint64_t v1 = *(void *)(v0 + 56);
    }
    if (v1 != 1)
    {
      uint64_t v2 = *(void **)(v0 + 32);
      if (v2 != (void *)1) {

      }
      uint64_t v3 = *(void **)(v0 + 40);
      if (v3 != (void *)1) {

      }
      swift_bridgeObjectRelease();
    }
  }
  swift_release();

  return _swift_deallocObject(v0, 81, 7);
}

void sub_1000128FC(uint64_t a1)
{
  sub_10001171C(a1, v1 + 16, *(void *)(v1 + 72), *(unsigned char *)(v1 + 80));
}

uint64_t sub_100012920(uint64_t a1)
{
  return a1;
}

void *sub_10001295C(void *result, char a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (a6 != 2)
  {
    sub_1000129D0(result, a2);
    return sub_1000129E4(a3, a4, a5, a6);
  }
  return result;
}

id sub_1000129D0(id result, char a2)
{
  if (a2 != -1) {
    return result;
  }
  return result;
}

void *sub_1000129E4(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    sub_100012A34(result);
    sub_100012A34(a2);
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

id sub_100012A34(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_100012A44(id a1, char a2)
{
  if (a2 != -1) {
}
  }

uint64_t sub_100012A58(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100012A90()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100012AC8(void *a1, char a2)
{
}

id sub_100012AD4(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_100012AE0(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

unint64_t sub_100012AEC(uint64_t a1, uint64_t a2)
{
  sub_1000227F0();
  sub_100022530();
  Swift::Int v4 = sub_100022810();

  return sub_100012B64(a1, a2, v4);
}

unint64_t sub_100012B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000227D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000227D0() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_100012C48(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_100012C58(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100012CBC()
{
  uint64_t ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  uint64_t v2 = *(void *)(ReminderViewModel - 8);
  __chkstk_darwin(ReminderViewModel);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006B9C(&qword_10002DFD8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v10 = (char *)&v13 - v9;
  sub_10000F1B0((char **)((char *)&v13 - v9));
  uint64_t v11 = v0
      + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_viewModel;
  swift_beginAccess();
  sub_100012EBC((uint64_t)v10, v11);
  swift_endAccess();
  sub_10000EAC0(v11, (uint64_t)v8, &qword_10002DFD8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, ReminderViewModel) == 1) {
    return sub_10000EA64((uint64_t)v8, &qword_10002DFD8);
  }
  sub_100012F24((uint64_t)v8, (uint64_t)v4, type metadata accessor for TTRIExtensionCreateReminderViewModel);
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10001F814((uint64_t)v4);
    swift_unknownObjectRelease();
  }
  return sub_100012F8C((uint64_t)v4, type metadata accessor for TTRIExtensionCreateReminderViewModel);
}

uint64_t sub_100012EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B9C(&qword_10002DFD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012F24(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012F8C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100012FEC(id a1, unsigned __int8 a2)
{
  if (a2 != 255) {
}
  }

uint64_t sub_100013004(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100013060(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001308C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000130B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006B9C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_10001311C(id result, void *a2, char a3)
{
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      id v4 = a2;
      swift_retain();
    }
    else
    {
      if (a3) {
        return result;
      }
      id v4 = a2;
      id v3 = result;
    }
    unint64_t result = v4;
  }

  return result;
}

uint64_t sub_100013184@<X0>(BOOL *a1@<X8>)
{
  return sub_100011130(a1);
}

void sub_1000131A0(void *a1, void *a2, char a3)
{
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      id v3 = a2;
      swift_release();
    }
    else
    {
      if (a3) {
        return;
      }
      id v3 = a2;
    }
    a1 = v3;
  }
}

uint64_t sub_100013208(uint64_t a1, unint64_t a2)
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

uint64_t sub_100013260(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000132B8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000132D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100013320(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100013334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100021FC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013398(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000133FC(uint64_t a1)
{
  return sub_1000123D0(a1);
}

uint64_t sub_100013404(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001342C()
{
  uint64_t v0 = sub_1000224A0();
  sub_100012C58(v0, qword_10002E028);
  uint64_t v1 = sub_100012A58(v0, (uint64_t)qword_10002E028);
  if (qword_10002D7C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012A58(v0, (uint64_t)qword_10002E560);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_1000134F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = &v3[OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_currentEventHandler];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *(void *)&v3[OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_contentNavigationController] = 0;
  uint64_t v6 = &v3[OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_extensionCreateReminderInterface];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  if (a2)
  {
    NSString v7 = sub_100022500();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v16.receiver = v3;
  v16.super_class = (Class)type metadata accessor for TTRIVSReminderCreationViewServiceViewController();
  id v8 = objc_msgSendSuper2(&v16, "initWithNibName:bundle:", v7, a3);

  uint64_t v9 = qword_10002D7B8;
  id v10 = v8;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000224A0();
  sub_100012A58(v11, (uint64_t)qword_10002E028);
  uint64_t v12 = sub_100022490();
  os_log_type_t v13 = sub_100022600();
  if (os_log_type_enabled(v12, v13))
  {
    BOOL v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "TTRIVSReminderCreationViewServiceViewController is ready and waiting", v14, 2u);
    swift_slowDealloc();
  }

  return v10;
}

void sub_100013988()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000224A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v1 _remoteViewControllerProxy])
  {
    sub_100022700();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_1000153F4((uint64_t)&v14, (uint64_t)v16);
  sub_10001545C((uint64_t)v16, (uint64_t)&v14);
  if (*((void *)&v15 + 1))
  {
    sub_100006B9C(&qword_10002E1A8);
    if (swift_dynamicCast())
    {
      sub_1000154C4((uint64_t)v16);
      return;
    }
  }
  else
  {
    sub_1000154C4((uint64_t)&v14);
  }
  if (qword_10002D7B8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100012A58(v2, (uint64_t)qword_10002E028);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_100006B9C(&qword_10002E1A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100023590;
  *(void *)(inited + 32) = 48;
  *(void *)(inited + 40) = 0xE100000000000000;
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_10001545C((uint64_t)v16, (uint64_t)&v10);
  if (v11)
  {
    sub_100012C48(&v10, &v14);
  }
  else
  {
    *((void *)&v15 + 1) = &type metadata for String;
    *(void *)&long long v14 = 0x296C696E28;
    *((void *)&v14 + 1) = 0xE500000000000000;
    sub_1000154C4((uint64_t)&v10);
  }
  sub_100022760();
  sub_1000132D0((uint64_t)&v14);
  uint64_t v8 = v12;
  unint64_t v9 = v13;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v9;
  sub_1000124C4(inited);
  sub_1000124C4((uint64_t)&_swiftEmptyArrayStorage);
  sub_100015AC8((uint64_t)"Expecting _remoteViewControllerProxy to be of type REMReminderCreationRemoteViewController, but got %@ instead", 110, 2);
  __break(1u);
}

id sub_100013CB8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_contentNavigationController;
  uint64_t v5 = *(void **)&v2[OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_contentNavigationController];
  if (!v5)
  {
LABEL_4:
    id v10 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:a1];
    [v2 addChildViewController:v10];
    id result = [v10 view];
    if (result)
    {
      uint64_t v11 = result;
      [result setTranslatesAutoresizingMaskIntoConstraints:0];
      id result = [v2 view];
      if (result)
      {
        uint64_t v12 = result;
        [result addSubview:v11];

        sub_100006B9C(&qword_10002DD48);
        uint64_t v13 = swift_allocObject();
        *(_OWORD *)(v13 + 16) = xmmword_1000235A0;
        id result = [v2 view];
        if (result)
        {
          long long v14 = result;
          id v15 = [result leadingAnchor];

          id v16 = [v11 leadingAnchor];
          id v17 = [v15 constraintEqualToAnchor:v16];

          *(void *)(v13 + 32) = v17;
          id result = [v2 view];
          if (result)
          {
            id v18 = result;
            id v19 = [result trailingAnchor];

            id v20 = [v11 trailingAnchor];
            id v21 = [v19 constraintEqualToAnchor:v20];

            *(void *)(v13 + 40) = v21;
            id result = [v2 view];
            if (result)
            {
              uint64_t v22 = result;
              id v23 = [result topAnchor];

              id v24 = [v11 topAnchor];
              id v25 = [v23 constraintEqualToAnchor:v24];

              *(void *)(v13 + 48) = v25;
              id result = [v2 view];
              if (result)
              {
                uint64_t v26 = result;
                id v27 = self;
                id v28 = [v26 bottomAnchor];

                id v29 = [v11 bottomAnchor];
                id v30 = [v28 constraintEqualToAnchor:v29];

                *(void *)(v13 + 56) = v30;
                sub_100022590();
                sub_10000E8D8(0, &qword_10002E198);
                Class isa = sub_100022570().super.isa;
                swift_bridgeObjectRelease();
                [v27 activateConstraints:isa];

                [v10 didMoveToParentViewController:v2];
                uint64_t v32 = *(void **)&v2[v4];
                *(void *)&v2[v4] = v10;
                id v33 = v10;

                return v33;
              }
              goto LABEL_16;
            }
LABEL_15:
            __break(1u);
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
  id v6 = v5;
  [v6 willMoveToParentViewController:0];
  id result = [v6 view];
  if (result)
  {
    uint64_t v8 = result;
    [result removeFromSuperview];

    [v6 removeFromParentViewController];
    unint64_t v9 = *(void **)&v2[v4];
    *(void *)&v2[v4] = 0;

    goto LABEL_4;
  }
LABEL_17:
  __break(1u);
  return result;
}

id sub_1000140D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIVSReminderCreationViewServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRIVSReminderCreationViewServiceViewController()
{
  return self;
}

uint64_t sub_10001418C(uint64_t (*a1)(void, double, double), int a2, id a3)
{
  id v4 = [a3 viewIfLoaded];
  if (v4)
  {
    uint64_t v5 = v4;
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
    double v7 = 0.0;
  }
  return a1(0, v7, v9);
}

void sub_1000142A4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (a1) {
    uint64_t v7 = sub_100021C80();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, double, double))(a2 + 16))(a2, a3, a4);
}

uint64_t sub_10001441C()
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ReminderCreationEventHandler()
{
  return self;
}

uint64_t sub_100014488(void *a1, uint64_t a2, int a3)
{
  int v31 = a3;
  id v5 = [objc_allocWithZone((Class)REMStore) init];
  id v6 = objc_allocWithZone((Class)TTRUndoManager);
  NSString v7 = sub_100022500();
  id v8 = [v6 initWithDebugIdentifier:v7];

  sub_100021F40();
  swift_allocObject();
  sub_100021F30();
  uint64_t v30 = a2;
  double v9 = *(void **)(a2 + 16);
  sub_100022390();
  id v10 = v9;
  uint64_t v11 = (void *)sub_100022370();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = v10;
  sub_100022200();
  id v13 = v10;
  swift_retain();
  sub_100022440();
  swift_release();

  sub_100022240();
  swift_allocObject();
  id v14 = a1;
  swift_retain();
  id v15 = v8;
  swift_retain();
  id v16 = v5;
  uint64_t v17 = sub_100022230();
  uint64_t ReminderRouter = type metadata accessor for TTRIExtensionCreateReminderRouter();
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v19 + 24) = 0;
  v33[3] = ReminderRouter;
  v33[4] = &off_100029500;
  v33[0] = v19;
  type metadata accessor for TTRIExtensionCreateReminderPresenter();
  id v20 = (uint64_t *)swift_allocObject();
  uint64_t v21 = sub_100015340((uint64_t)v33, ReminderRouter);
  __chkstk_darwin(v21);
  id v23 = (uint64_t *)((char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = *v23;
  id v26 = v15;
  swift_retain();
  id v27 = sub_10001489C(v17, v25, (uint64_t)sub_100015524, 0, (uint64_t)sub_10001561C, 0, v26, v31, v20);

  sub_1000132D0((uint64_t)v33);
  type metadata accessor for TTRIExtensionCreateReminderViewController();
  v33[0] = v27;
  v33[1] = &off_100029370;
  swift_retain();
  sub_100021E00();
  swift_release();

  swift_release();
  swift_release();
  uint64_t v28 = v32;
  swift_beginAccess();
  *(void *)(v17 + 24) = &off_100029340;
  swift_unknownObjectWeakAssign();
  swift_release();
  v27[3] = (uint64_t)&off_100029680;
  swift_unknownObjectWeakAssign();
  v27[5] = (uint64_t)&off_100029418;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  swift_release();
  return v28;
}

uint64_t *sub_10001489C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8, uint64_t *a9)
{
  uint64_t v44 = a3;
  uint64_t v45 = a5;
  uint64_t v46 = *a9;
  uint64_t v15 = sub_1000223B0();
  uint64_t v47 = *(void *)(v15 - 8);
  uint64_t v48 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100006B9C(&qword_10002DFD8);
  __chkstk_darwin(v18 - 8);
  id v20 = (char **)((char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v51[3] = type metadata accessor for TTRIExtensionCreateReminderRouter();
  v51[4] = &off_100029500;
  v51[0] = a2;
  a9[3] = 0;
  swift_unknownObjectWeakInit();
  a9[5] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)a9 + 48) = 0;
  uint64_t v21 = (uint64_t)a9
      + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_viewModel;
  uint64_t ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(ReminderViewModel - 8) + 56))(v21, 1, 1, ReminderViewModel);
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager) = 0;
  uint64_t v23 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_editingSessionSharedProperties;
  sub_100022340();
  swift_allocObject();
  *(uint64_t *)((char *)a9 + v23) = sub_100022330();
  uint64_t v24 = (uint64_t *)((char *)a9
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor);
  *uint64_t v24 = a1;
  v24[1] = &protocol witness table for TTRExtensionCreateReminderInteractor;
  sub_100013398((uint64_t)v51, (uint64_t)a9+ OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_router);
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_undoManager) = (uint64_t)a7;
  *((unsigned char *)a9 + 48) = a8;
  sub_1000222E0();
  swift_allocObject();
  swift_retain();
  id v25 = a7;
  uint64_t v26 = sub_1000222D0();
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_inCellEditingPresenterHelper) = v26;
  id v27 = (uint64_t *)((char *)a9
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_makeCellTitleModule);
  *id v27 = v44;
  v27[1] = a4;
  uint64_t v28 = (uint64_t *)((char *)a9
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_makeCellNotesModule);
  *uint64_t v28 = v45;
  v28[1] = a6;
  sub_10000E8D8(0, &qword_10002DFF8);
  swift_retain();
  swift_retain();
  sub_100022660();
  sub_100021DD0();
  swift_allocObject();
  uint64_t v29 = sub_100021DC0();
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_deferredAction) = v29;
  swift_beginAccess();
  *(void *)(v29 + 24) = &off_1000292F0;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  *(void *)(v26 + 24) = &off_100029278;
  swift_unknownObjectWeakAssign();
  sub_10000F1B0(v20);
  uint64_t v30 = (uint64_t)a9
      + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_viewModel;
  swift_beginAccess();
  sub_100015390((uint64_t)v20, v30, &qword_10002DFD8);
  swift_endAccess();
  int v31 = *(void **)sub_100021D60();
  sub_1000223E0();
  id v32 = v31;
  sub_1000223D0();
  uint64_t v33 = sub_100006B9C(&qword_10002DFB8);
  uint64_t v34 = (uint64_t *)&v17[*(int *)(v33 + 48)];
  uint64_t v35 = enum case for REMUserOperation.createReminder(_:);
  uint64_t v36 = sub_1000223A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v17, v35, v36);
  *uint64_t v34 = sub_100021D70();
  v34[1] = v37;
  sub_100021D80();
  uint64_t v49 = sub_100022820();
  uint64_t v50 = v38;
  uint64_t v39 = (uint64_t *)&v17[*(int *)(v33 + 80)];
  v52._countAndFlagsBits = 0x69736E657478452DLL;
  v52._object = (void *)0xEA00000000006E6FLL;
  sub_100022540(v52);
  uint64_t v40 = v50;
  *uint64_t v39 = v49;
  v39[1] = v40;
  uint64_t v42 = v47;
  uint64_t v41 = v48;
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v17, enum case for REMAnalyticsEvent.userOperation(_:), v48);
  sub_1000223C0();

  swift_release();
  sub_1000132D0((uint64_t)v51);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v17, v41);
  return a9;
}

void sub_100014DA8(void *a1, uint64_t a2, void (**a3)(void, void, double, double))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = type metadata accessor for ReminderCreationEventHandler();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35[4] = &protocol witness table for TTRCurrentUserActivityProvider;
  sub_100022070();
  swift_allocObject();
  *(void *)(v8 + 32) = sub_100022060();
  *(void *)(v8 + 16) = a1;
  swift_unknownObjectWeakAssign();
  v35[3] = v7;
  v35[0] = v8;
  uint64_t v9 = a2 + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_currentEventHandler;
  swift_beginAccess();
  _Block_copy(a3);
  id v10 = a1;
  swift_retain();
  sub_100015390((uint64_t)v35, v9, &qword_10002E190);
  swift_endAccess();
  int v11 = [v10 wantsExtendedDetailOnlyView];
  id v12 = [v10 reminderID];
  swift_retain();
  id v13 = (void *)sub_100014488(v12, v8, v11);
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  swift_release();
  uint64_t v18 = (void *)(a2 + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_extensionCreateReminderInterface);
  void *v18 = v15;
  v18[1] = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v19 = sub_100013CB8((uint64_t)v13);
  id v20 = v19;
  if (v11)
  {
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = sub_1000151B8;
    v21[3] = v6;
    v21[4] = v20;
    uint64_t v22 = *(void *)(v15
                    + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                    + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v22 + 16);
    swift_retain();
    id v34 = v20;
    v24(ObjectType, v22);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v15;
    *(unsigned char *)(v25 + 24) = 0;
    *(void *)(v25 + 32) = sub_100015200;
    *(void *)(v25 + 40) = v21;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = sub_100015254;
    *(void *)(v26 + 24) = v25;
    swift_unknownObjectRetain();
    swift_retain();
    id v27 = (void *)sub_100022420();
    sub_100022430();
    swift_release();
    swift_release();

    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    id v28 = [v19 viewIfLoaded];
    if (v28)
    {
      uint64_t v29 = v28;
      [v28 frame];
      double v31 = v30;
      double v33 = v32;
    }
    else
    {
      double v33 = 0.0;
      double v31 = 0.0;
    }
    a3[2](a3, 0, v31, v33);
    swift_release();

    swift_unknownObjectRelease();
    swift_release();
  }
}

uint64_t sub_100015180()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000151B8(uint64_t a1, double a2, double a3)
{
  sub_1000142A4(a1, *(void *)(v3 + 16), a2, a3);
}

uint64_t sub_1000151C0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100015200()
{
  return sub_10001418C(*(uint64_t (**)(void, double, double))(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_10001520C()
{
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100015254(void *a1, uint64_t a2)
{
  sub_100010CA4(a1, a2, *(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(void (**)(id))(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_100015264()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001529C(void *a1)
{
  return sub_10001EC10(a1, *(uint64_t (**)(void, void))(v1 + 16));
}

uint64_t sub_1000152B8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000152F8()
{
  return (*(uint64_t (**)(void))(**(void **)(*(void *)(v0 + 16) + 32) + 112))(*(void *)(v0 + 24));
}

uint64_t sub_100015340(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100015390(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006B9C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000153F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B9C(&qword_10002E190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001545C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B9C(&qword_10002E190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000154C4(uint64_t a1)
{
  uint64_t v2 = sub_100006B9C(&qword_10002E190);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_100015524@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100022300();
  swift_allocObject();
  v9[3] = v2;
  v9[4] = &protocol witness table for TTRReminderTitleAttributesNoOpInteractor;
  uint64_t v8 = 0;
  v9[0] = sub_1000222F0();
  memset(v7, 0, sizeof(v7));
  uint64_t v3 = sub_1000220E0();
  uint64_t v5 = v4;
  sub_100015774((uint64_t)v7);
  sub_1000132D0((uint64_t)v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  return sub_100012C48(&v10, (_OWORD *)(a1 + 16));
}

uint64_t sub_10001561C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000220D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id TTRIExtensionCreateReminderAssembly.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id TTRIExtensionCreateReminderAssembly.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIExtensionCreateReminderAssembly();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderAssembly()
{
  return self;
}

id TTRIExtensionCreateReminderAssembly.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIExtensionCreateReminderAssembly();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100015774(uint64_t a1)
{
  uint64_t v2 = sub_100006B9C(&qword_10002E1D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000157D4()
{
  sub_100022360();
  sub_100006B9C(&qword_10002E1E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100023590;
  sub_100022460();
  *(void *)(inited + 32) = 0x696669746E656449;
  *(void *)(inited + 40) = 0xEA00000000007265;
  sub_100022730();
  NSString v1 = sub_100022500();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v1;
  sub_1000125FC(inited);
  sub_100022450();
  swift_bridgeObjectRelease();
  if (qword_10002D7C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000224A0();
  sub_100012A58(v2, (uint64_t)qword_10002E548);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_100022490();
  os_log_type_t v4 = sub_100022620();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v6 = sub_100022730();
    sub_100015DE8(v6, v7, &v11);
    sub_1000226E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000224F0();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_100015DE8(v8, v10, &v11);
    sub_1000226E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%{public}s; UserInfo=%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_100015AC8(uint64_t a1, uint64_t a2, char a3)
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_100022490();
  os_log_type_t v6 = sub_100022610();
  uint64_t v17 = a1;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446722;
    uint64_t v8 = sub_100022730();
    sub_100015DE8(v8, v9, &v18);
    sub_1000226E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    char v16 = a3;
    uint64_t v10 = sub_1000224F0();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    sub_100015DE8(v10, v12, &v18);
    sub_1000226E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000224F0();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_100015DE8(v13, v15, &v18);
    sub_1000226E0();
    swift_bridgeObjectRelease_n();
    a3 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s; UserInfo=%s; PublicUserInfo=%{public}s",
      (uint8_t *)v7,
      0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  if (a3) {
    goto LABEL_7;
  }
  if (v17)
  {
    rdi_os_crash();
LABEL_7:
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100015D4C(uint64_t a1)
{
  return sub_100015D74(a1, qword_10002E548, (SEL *)&selRef_userAction);
}

uint64_t sub_100015D60(uint64_t a1)
{
  return sub_100015D74(a1, qword_10002E560, (SEL *)&selRef_ui);
}

uint64_t sub_100015D74(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5 = sub_1000224A0();
  sub_100012C58(v5, a2);
  sub_100012A58(v5, (uint64_t)a2);
  id v6 = [self *a3];
  return sub_1000224B0();
}

uint64_t sub_100015DE8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100015EBC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100016440((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100016440((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000132D0((uint64_t)v12);
  return v7;
}

uint64_t sub_100015EBC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000226F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100016078(a5, a6);
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
  uint64_t v8 = sub_100022750();
  if (!v8)
  {
    sub_100022770();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000227B0();
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

uint64_t sub_100016078(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100016110(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000162F0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000162F0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100016110(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100016288(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100022720();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100022770();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100022550();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000227B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100022770();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100016288(uint64_t a1, uint64_t a2)
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
  sub_100006B9C(&qword_10002E1E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000162F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006B9C(&qword_10002E1E8);
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
  uint64_t result = sub_1000227B0();
  __break(1u);
  return result;
}

uint64_t sub_100016440(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000164A0(uint64_t a1, uint64_t a2)
{
  if (sub_100022350())
  {
    v14._countAndFlagsBits = 0xD00000000000001FLL;
    v20._countAndFlagsBits = 0xD000000000000099;
    v14._object = (void *)0x8000000100024600;
    v17._object = (void *)0x8000000100024620;
    v20._object = (void *)0x8000000100024670;
    v17._countAndFlagsBits = 0x1000000000000049;
    sub_100021DE0(v14, v17, v20);
  }
  else
  {
    v18._countAndFlagsBits = 0xD000000000000031;
    v15._countAndFlagsBits = 0xD000000000000049;
    v15._object = (void *)0x8000000100024500;
    v18._object = (void *)0x8000000100024550;
    sub_100021DF0(v15, v18);
  }
  v19._countAndFlagsBits = 0xD00000000000002FLL;
  v16._object = (void *)0x8000000100024590;
  v19._object = (void *)0x80000001000245B0;
  v16._countAndFlagsBits = 0xD000000000000016;
  sub_100021DF0(v16, v19);
  NSString v4 = sub_100022500();
  swift_bridgeObjectRelease();
  NSString v5 = sub_100022500();
  swift_bridgeObjectRelease();
  id v6 = [self alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  sub_100021EB0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  swift_retain();
  NSString v8 = sub_100022500();
  swift_bridgeObjectRelease();
  v13[4] = sub_100016840;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10001673C;
  v13[3] = &unk_100029548;
  int64_t v9 = _Block_copy(v13);
  swift_release();
  id v10 = [self actionWithTitle:v8 style:0 handler:v9];
  _Block_release(v9);

  [v6 addAction:v10];
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    [Strong presentViewController:v6 animated:1 completion:0];
  }
}

void sub_10001673C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000167A4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderRouter()
{
  return self;
}

uint64_t sub_100016808()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016840()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100016868(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016878()
{
  return swift_release();
}

char *sub_100016880(char *a1, char **a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    int64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100021FC0();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v8 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v57 = *a2;
            *(void *)a1 = *a2;
            int v58 = v57;
            goto LABEL_33;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v56 = sub_100021CE0();
            (*(void (**)(char *, char **, uint64_t))(*(void *)(v56 - 8) + 16))(a1, a2, v56);
LABEL_33:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
            break;
        }
        int v59 = (int *)sub_100021F90();
        uint64_t v60 = v59[5];
        uint64_t v61 = &a1[v60];
        uint64_t v62 = (char *)a2 + v60;
        uint64_t v63 = *(uint64_t *)((char *)a2 + v60 + 8);
        if (!v63) {
          goto LABEL_37;
        }
        *(void *)uint64_t v61 = *(void *)v62;
        *((void *)v61 + 1) = v63;
        uint64_t v64 = (void *)*((void *)v62 + 2);
        uint64_t v65 = *((void *)v62 + 3);
        uint64_t v66 = *((void *)v62 + 4);
        uint64_t v67 = *((void *)v62 + 5);
        uint64_t v135 = *((void *)v62 + 6);
        uint64_t v144 = *((void *)v62 + 7);
        unsigned __int8 v139 = v62[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v64, v65, v66, v67, v135, v144, v139);
        *((void *)v61 + 2) = v64;
        *((void *)v61 + 3) = v65;
        *((void *)v61 + 4) = v66;
        *((void *)v61 + 5) = v67;
        *((void *)v61 + 6) = v135;
        *((void *)v61 + 7) = v144;
        v61[64] = v139;
        *(_DWORD *)(v61 + 65) = *(_DWORD *)(v62 + 65);
        int v68 = v62[120];
        if (v68 == 255)
        {
          long long v69 = *(_OWORD *)(v62 + 88);
          *(_OWORD *)(v61 + 72) = *(_OWORD *)(v62 + 72);
          *(_OWORD *)(v61 + 88) = v69;
          *(_OWORD *)(v61 + 104) = *(_OWORD *)(v62 + 104);
          v61[120] = v62[120];
        }
        else
        {
          char v145 = v68 & 1;
          uint64_t v73 = *((void *)v62 + 10);
          uint64_t v74 = *((void *)v62 + 11);
          uint64_t v75 = *((void *)v62 + 12);
          uint64_t v76 = *((void *)v62 + 13);
          uint64_t v136 = *((void *)v62 + 14);
          uint64_t v140 = (void *)*((void *)v62 + 9);
          sub_100006B40(v140, v73, v74, v75, v76, v136, v68 & 1);
          *((void *)v61 + 9) = v140;
          *((void *)v61 + 10) = v73;
          *((void *)v61 + 11) = v74;
          *((void *)v61 + 12) = v75;
          *((void *)v61 + 13) = v76;
          *((void *)v61 + 14) = v136;
          v61[120] = v145;
        }
        v61[121] = v62[121];
        goto LABEL_40;
      case 1u:
        uint64_t v10 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            id v81 = *a2;
            *(void *)a1 = *a2;
            uint64_t v82 = v81;
            goto LABEL_44;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v80 = sub_100021CE0();
            (*(void (**)(char *, char **, uint64_t))(*(void *)(v80 - 8) + 16))(a1, a2, v80);
LABEL_44:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
            break;
        }
        int v59 = (int *)sub_100021F90();
        uint64_t v83 = v59[5];
        uint64_t v61 = &a1[v83];
        uint64_t v62 = (char *)a2 + v83;
        uint64_t v84 = *(uint64_t *)((char *)a2 + v83 + 8);
        if (v84)
        {
          *(void *)uint64_t v61 = *(void *)v62;
          *((void *)v61 + 1) = v84;
          uint64_t v85 = (void *)*((void *)v62 + 2);
          uint64_t v86 = *((void *)v62 + 3);
          uint64_t v87 = *((void *)v62 + 4);
          uint64_t v88 = *((void *)v62 + 5);
          uint64_t v137 = *((void *)v62 + 6);
          uint64_t v146 = *((void *)v62 + 7);
          unsigned __int8 v141 = v62[64];
          swift_bridgeObjectRetain();
          sub_100006B18(v85, v86, v87, v88, v137, v146, v141);
          *((void *)v61 + 2) = v85;
          *((void *)v61 + 3) = v86;
          *((void *)v61 + 4) = v87;
          *((void *)v61 + 5) = v88;
          *((void *)v61 + 6) = v137;
          *((void *)v61 + 7) = v146;
          v61[64] = v141;
          *(_DWORD *)(v61 + 65) = *(_DWORD *)(v62 + 65);
          int v89 = v62[120];
          if (v89 == 255)
          {
            long long v90 = *(_OWORD *)(v62 + 88);
            *(_OWORD *)(v61 + 72) = *(_OWORD *)(v62 + 72);
            *(_OWORD *)(v61 + 88) = v90;
            *(_OWORD *)(v61 + 104) = *(_OWORD *)(v62 + 104);
            v61[120] = v62[120];
          }
          else
          {
            char v147 = v89 & 1;
            uint64_t v91 = *((void *)v62 + 10);
            uint64_t v92 = *((void *)v62 + 11);
            uint64_t v93 = *((void *)v62 + 12);
            uint64_t v94 = *((void *)v62 + 13);
            uint64_t v138 = *((void *)v62 + 14);
            id v142 = (void *)*((void *)v62 + 9);
            sub_100006B40(v142, v91, v92, v93, v94, v138, v89 & 1);
            *((void *)v61 + 9) = v142;
            *((void *)v61 + 10) = v91;
            *((void *)v61 + 11) = v92;
            *((void *)v61 + 12) = v93;
            *((void *)v61 + 13) = v94;
            *((void *)v61 + 14) = v138;
            v61[120] = v147;
          }
          v61[121] = v62[121];
        }
        else
        {
LABEL_37:
          long long v70 = *((_OWORD *)v62 + 5);
          *((_OWORD *)v61 + 4) = *((_OWORD *)v62 + 4);
          *((_OWORD *)v61 + 5) = v70;
          *((_OWORD *)v61 + 6) = *((_OWORD *)v62 + 6);
          *(_OWORD *)(v61 + 106) = *(_OWORD *)(v62 + 106);
          long long v71 = *((_OWORD *)v62 + 1);
          *(_OWORD *)uint64_t v61 = *(_OWORD *)v62;
          *((_OWORD *)v61 + 1) = v71;
          long long v72 = *((_OWORD *)v62 + 3);
          *((_OWORD *)v61 + 2) = *((_OWORD *)v62 + 2);
          *((_OWORD *)v61 + 3) = v72;
        }
LABEL_40:
        a1[v59[6]] = *((unsigned char *)a2 + v59[6]);
        a1[v59[7]] = *((unsigned char *)a2 + v59[7]);
        a1[v59[8]] = *((unsigned char *)a2 + v59[8]);
        a1[v59[9]] = *((unsigned char *)a2 + v59[9]);
        a1[v59[10]] = *((unsigned char *)a2 + v59[10]);
        uint64_t v77 = v59[11];
        uint64_t v78 = *(char **)((char *)a2 + v77);
        *(void *)&a1[v77] = v78;
        id v79 = v78;
        goto LABEL_65;
      case 2u:
        size_t v11 = *a2;
        *(void *)a1 = *a2;
        uint64_t v12 = *(int *)(sub_100021F70() + 20);
        uint64_t v13 = (void **)&a1[v12];
        Swift::String v14 = (void **)((char *)a2 + v12);
        uint64_t v15 = sub_100021FF0();
        uint64_t v16 = *(void *)(v15 - 8);
        Swift::String v17 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48);
        Swift::String v18 = v11;
        if (v17(v14, 1, v15)) {
          goto LABEL_11;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v96 = *v14;
            char *v13 = *v14;
            id v97 = v96;
            goto LABEL_54;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v95 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v95 - 8) + 16))(v13, v14, v95);
LABEL_54:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v13, v14, *(void *)(v16 + 64));
            break;
        }
        goto LABEL_64;
      case 3u:
        Swift::String v19 = *a2;
        *(void *)a1 = *a2;
        uint64_t v20 = *(int *)(sub_100021F70() + 20);
        uint64_t v13 = (void **)&a1[v20];
        Swift::String v14 = (void **)((char *)a2 + v20);
        uint64_t v15 = sub_100021FF0();
        uint64_t v16 = *(void *)(v15 - 8);
        uint64_t v21 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48);
        uint64_t v22 = v19;
        if (v21(v14, 1, v15)) {
          goto LABEL_11;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v42 = *v14;
            char *v13 = *v14;
            id v43 = v42;
            goto LABEL_63;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v101 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v101 - 8) + 16))(v13, v14, v101);
LABEL_63:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v13, v14, *(void *)(v16 + 64));
            break;
        }
        goto LABEL_64;
      case 4u:
        uint64_t v23 = *a2;
        *(void *)a1 = *a2;
        uint64_t v24 = *(int *)(sub_100021F70() + 20);
        uint64_t v13 = (void **)&a1[v24];
        Swift::String v14 = (void **)((char *)a2 + v24);
        uint64_t v15 = sub_100021FF0();
        uint64_t v16 = *(void *)(v15 - 8);
        uint64_t v25 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48);
        uint64_t v26 = v23;
        if (v25(v14, 1, v15))
        {
LABEL_11:
          uint64_t v27 = sub_100006B9C(&qword_10002DB38);
          memcpy(v13, v14, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
            case 8u:
            case 9u:
              uint64_t v99 = *v14;
              char *v13 = *v14;
              id v100 = v99;
              goto LABEL_60;
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 6u:
              uint64_t v98 = sub_100021CE0();
              (*(void (**)(void **, void **, uint64_t))(*(void *)(v98 - 8) + 16))(v13, v14, v98);
LABEL_60:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v13, v14, *(void *)(v16 + 64));
              break;
          }
LABEL_64:
          (*(void (**)(void **, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
        }
LABEL_65:
        swift_storeEnumTagMultiPayload();
LABEL_66:
        uint64_t v102 = a3[6];
        a1[a3[5]] = *((unsigned char *)a2 + a3[5]);
        uint64_t v103 = *(char **)((char *)a2 + v102);
        *(void *)&a1[v102] = v103;
        uint64_t v104 = a3[7];
        uint64_t v105 = a3[8];
        v106 = *(char **)((char *)a2 + v104);
        *(void *)&a1[v104] = v106;
        a1[v105] = *((unsigned char *)a2 + v105);
        uint64_t v107 = a3[10];
        char v148 = a3;
        id v149 = a2;
        *(void *)&a1[a3[9]] = *(char **)((char *)a2 + a3[9]);
        uint64_t v108 = (void **)&a1[v107];
        v109 = (void **)((char *)a2 + v107);
        uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
        uint64_t v111 = *(void *)(ReminderView - 8);
        uint64_t v112 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v111 + 48);
        id v113 = v103;
        id v114 = v106;
        swift_bridgeObjectRetain();
        if (v112(v109, 1, ReminderView))
        {
          uint64_t v115 = sub_100006B9C(&qword_10002DFE8);
          memcpy(v108, v109, *(void *)(*(void *)(v115 - 8) + 64));
        }
        else
        {
          v116 = *v109;
          char *v108 = *v109;
          uint64_t v117 = *(int *)(ReminderView + 20);
          uint64_t v118 = (char *)v108 + v117;
          uint64_t v119 = (char *)v109 + v117;
          uint64_t v120 = sub_100021CB0();
          int v121 = *(void (**)(char *, char *, uint64_t))(*(void *)(v120 - 8) + 16);
          id v122 = v116;
          v121(v118, v119, v120);
          uint64_t v123 = *(int *)(ReminderView + 24);
          id v124 = *(void **)((char *)v109 + v123);
          *(void **)((char *)v108 + v123) = v124;
          uint64_t v125 = *(void (**)(void **, void, uint64_t, uint64_t))(v111 + 56);
          id v126 = v124;
          v125(v108, 0, 1, ReminderView);
        }
        uint64_t v127 = v148[11];
        id v128 = &a1[v127];
        uint64_t v129 = (char *)v149 + v127;
        int v130 = v129[8];
        if (v130 == 255)
        {
          *(void *)id v128 = *(void *)v129;
          v128[8] = v129[8];
        }
        else
        {
          char v131 = v130 & 1;
          uint64_t v132 = *(void *)v129;
          id v133 = *(id *)v129;
          *(void *)id v128 = v132;
          v128[8] = v131;
        }
        break;
      case 5u:
        *(void *)a1 = *a2;
        a1[8] = *((unsigned char *)a2 + 8);
        *(_WORD *)(a1 + 9) = *(_WORD *)((char *)a2 + 9);
        id v28 = a2[2];
        *((void *)a1 + 2) = v28;
        uint64_t v29 = v28;
        goto LABEL_65;
      case 6u:
        uint64_t v37 = *a2;
        *(void *)a1 = *a2;
        uint64_t v38 = v37;
        goto LABEL_65;
      case 7u:
        uint64_t v30 = sub_100021FA0();
        uint64_t v31 = *(void *)(v30 - 8);
        if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v31 + 48))(a2, 1, v30))
        {
          uint64_t v32 = sub_100006B9C(&qword_10002DB40);
          memcpy(a1, a2, *(void *)(*(void *)(v32 - 8) + 64));
        }
        else
        {
          *(void *)a1 = *a2;
          uint64_t v44 = *(int *)(v30 + 20);
          char v143 = &a1[v44];
          uint64_t v45 = (char *)a2 + v44;
          uint64_t v46 = sub_100022400();
          uint64_t v47 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16);
          swift_bridgeObjectRetain();
          v47(v143, v45, v46);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(a1, 0, 1, v30);
        }
        uint64_t v48 = *(int *)(sub_100021F80() + 20);
        uint64_t v49 = &a1[v48];
        uint64_t v50 = (char **)((char *)a2 + v48);
        uint64_t v51 = v50[1];
        if (v51)
        {
          *(void *)uint64_t v49 = *v50;
          *((void *)v49 + 1) = v51;
          Swift::String v52 = (void *)v50[2];
          *((void *)v49 + 2) = v52;
          swift_bridgeObjectRetain();
          id v53 = v52;
        }
        else
        {
          *(_OWORD *)uint64_t v49 = *(_OWORD *)v50;
          *((void *)v49 + 2) = v50[2];
        }
        goto LABEL_65;
      case 8u:
        uint64_t v39 = sub_100022010();
        uint64_t v40 = *(void *)(v39 - 8);
        if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v40 + 48))(a2, 1, v39))
        {
          uint64_t v41 = sub_100022000();
          memcpy(a1, a2, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          uint64_t v54 = sub_100021CE0();
          (*(void (**)(char *, char **, uint64_t))(*(void *)(v54 - 8) + 16))(a1, a2, v54);
          a1[*(int *)(v39 + 20)] = *((unsigned char *)a2 + *(int *)(v39 + 20));
          (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(a1, 0, 1, v39);
        }
        uint64_t v55 = sub_100022020();
        *(void *)&a1[*(int *)(v55 + 20)] = *(char **)((char *)a2 + *(int *)(v55 + 20));
        goto LABEL_65;
      case 9u:
        *a1 = *(unsigned char *)a2;
        uint64_t v33 = *(int *)(sub_100021EA0() + 20);
        id v34 = &a1[v33];
        uint64_t v35 = (char *)a2 + v33;
        uint64_t v36 = sub_1000224C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
        goto LABEL_65;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
        goto LABEL_66;
    }
  }
  return a1;
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(uint64_t a1)
{
  return sub_10000CC8C(a1, qword_10002E3A0);
}

void sub_10001804C(uint64_t a1, int *a2)
{
  sub_100021FC0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          goto LABEL_22;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          goto LABEL_4;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 1u:
      sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
LABEL_22:

          break;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
LABEL_4:
          uint64_t v4 = sub_100021CE0();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
          break;
        default:
          break;
      }
LABEL_23:
      uint64_t v17 = sub_100021F90();
      uint64_t v18 = a1 + *(int *)(v17 + 20);
      if (*(void *)(v18 + 8))
      {
        swift_bridgeObjectRelease();
        sub_1000072D8(*(void **)(v18 + 16), *(void *)(v18 + 24), *(void *)(v18 + 32), *(void *)(v18 + 40), *(void *)(v18 + 48), *(void *)(v18 + 56), *(unsigned char *)(v18 + 64));
        int v19 = *(unsigned __int8 *)(v18 + 120);
        if (v19 != 255) {
          sub_100007300(*(void **)(v18 + 72), *(void *)(v18 + 80), *(void *)(v18 + 88), *(void *)(v18 + 96), *(void *)(v18 + 104), *(void *)(v18 + 112), v19 & 1);
        }
      }
      id v10 = *(id *)(a1 + *(int *)(v17 + 44));
      goto LABEL_27;
    case 2u:

      int v5 = (id *)(a1 + *(int *)(sub_100021F70() + 20));
      uint64_t v6 = sub_100021FF0();
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_34;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 3u:

      int v5 = (id *)(a1 + *(int *)(sub_100021F70() + 20));
      uint64_t v7 = sub_100021FF0();
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7))
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_34;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 4u:

      int v5 = (id *)(a1 + *(int *)(sub_100021F70() + 20));
      uint64_t v8 = sub_100021FF0();
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8))
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
LABEL_34:
            id v10 = *v5;
            goto LABEL_27;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
LABEL_11:
            uint64_t v9 = sub_100021CE0();
            goto LABEL_21;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 5u:
      id v10 = *(id *)(a1 + 16);
      goto LABEL_27;
    case 6u:
      id v10 = *(id *)a1;
      goto LABEL_27;
    case 7u:
      uint64_t v11 = sub_100021FA0();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(a1, 1, v11))
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = a1 + *(int *)(v11 + 20);
        uint64_t v13 = sub_100022400();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
      }
      uint64_t v14 = a1 + *(int *)(sub_100021F80() + 20);
      if (!*(void *)(v14 + 8)) {
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
      id v10 = *(id *)(v14 + 16);
LABEL_27:

LABEL_28:
      swift_bridgeObjectRelease();
      uint64_t v20 = (id *)(a1 + a2[10]);
      uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(ReminderView - 8) + 48))(v20, 1, ReminderView))
      {

        uint64_t v22 = (char *)v20 + *(int *)(ReminderView + 20);
        uint64_t v23 = sub_100021CB0();
        (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
      }
      uint64_t v24 = a1 + a2[11];
      if (*(unsigned __int8 *)(v24 + 8) != 255)
      {
        uint64_t v25 = *(void **)v24;
      }
      return;
    case 8u:
      uint64_t v15 = sub_100022010();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(a1, 1, v15))
      {
        uint64_t v16 = sub_100021CE0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
      }
      goto LABEL_28;
    case 9u:
      int v5 = (id *)(a1 + *(int *)(sub_100021EA0() + 20));
      uint64_t v9 = sub_1000224C0();
LABEL_21:
      (*(void (**)(id *, uint64_t))(*(void *)(v9 - 8) + 8))(v5, v9);
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

void **sub_100018710(void **a1, void **a2, int *a3)
{
  uint64_t v6 = sub_100021FC0();
  char v147 = a3;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v7 = sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          uint64_t v55 = *a2;
          *a1 = *a2;
          id v56 = v55;
          goto LABEL_31;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v54 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v54 - 8) + 16))(a1, a2, v54);
LABEL_31:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
          break;
      }
      uint64_t v57 = (int *)sub_100021F90();
      uint64_t v58 = v57[5];
      int v59 = (char *)a1 + v58;
      uint64_t v60 = (char *)a2 + v58;
      uint64_t v61 = *(uint64_t *)((char *)a2 + v58 + 8);
      if (!v61) {
        goto LABEL_35;
      }
      *(void *)int v59 = *(void *)v60;
      *((void *)v59 + 1) = v61;
      uint64_t v62 = (void *)*((void *)v60 + 2);
      uint64_t v63 = *((void *)v60 + 3);
      uint64_t v64 = *((void *)v60 + 4);
      uint64_t v65 = *((void *)v60 + 5);
      uint64_t v135 = *((void *)v60 + 6);
      uint64_t v142 = *((void *)v60 + 7);
      unsigned __int8 v137 = v60[64];
      swift_bridgeObjectRetain();
      sub_100006B18(v62, v63, v64, v65, v135, v142, v137);
      *((void *)v59 + 2) = v62;
      *((void *)v59 + 3) = v63;
      *((void *)v59 + 4) = v64;
      *((void *)v59 + 5) = v65;
      *((void *)v59 + 6) = v135;
      *((void *)v59 + 7) = v142;
      v59[64] = v137;
      *(_DWORD *)(v59 + 65) = *(_DWORD *)(v60 + 65);
      int v66 = v60[120];
      if (v66 == 255)
      {
        long long v67 = *(_OWORD *)(v60 + 88);
        *(_OWORD *)(v59 + 72) = *(_OWORD *)(v60 + 72);
        *(_OWORD *)(v59 + 88) = v67;
        *(_OWORD *)(v59 + 104) = *(_OWORD *)(v60 + 104);
        v59[120] = v60[120];
      }
      else
      {
        char v143 = v66 & 1;
        uint64_t v71 = *((void *)v60 + 10);
        uint64_t v72 = *((void *)v60 + 11);
        uint64_t v73 = *((void *)v60 + 12);
        uint64_t v74 = *((void *)v60 + 13);
        uint64_t v136 = *((void *)v60 + 14);
        uint64_t v138 = (void *)*((void *)v60 + 9);
        sub_100006B40(v138, v71, v72, v73, v74, v136, v66 & 1);
        *((void *)v59 + 9) = v138;
        *((void *)v59 + 10) = v71;
        *((void *)v59 + 11) = v72;
        *((void *)v59 + 12) = v73;
        *((void *)v59 + 13) = v74;
        *((void *)v59 + 14) = v136;
        v59[120] = v143;
      }
      v59[121] = v60[121];
      goto LABEL_38;
    case 1u:
      uint64_t v8 = sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          id v79 = *a2;
          *a1 = *a2;
          id v80 = v79;
          goto LABEL_42;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v78 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v78 - 8) + 16))(a1, a2, v78);
LABEL_42:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
          break;
      }
      uint64_t v57 = (int *)sub_100021F90();
      uint64_t v81 = v57[5];
      int v59 = (char *)a1 + v81;
      uint64_t v60 = (char *)a2 + v81;
      uint64_t v82 = *(uint64_t *)((char *)a2 + v81 + 8);
      if (v82)
      {
        *(void *)int v59 = *(void *)v60;
        *((void *)v59 + 1) = v82;
        uint64_t v83 = (void *)*((void *)v60 + 2);
        uint64_t v84 = *((void *)v60 + 3);
        uint64_t v85 = *((void *)v60 + 4);
        uint64_t v86 = *((void *)v60 + 5);
        uint64_t v87 = *((void *)v60 + 6);
        uint64_t v139 = *((void *)v60 + 7);
        unsigned __int8 v144 = v60[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v83, v84, v85, v86, v87, v139, v144);
        *((void *)v59 + 2) = v83;
        *((void *)v59 + 3) = v84;
        *((void *)v59 + 4) = v85;
        *((void *)v59 + 5) = v86;
        *((void *)v59 + 6) = v87;
        *((void *)v59 + 7) = v139;
        v59[64] = v144;
        *(_DWORD *)(v59 + 65) = *(_DWORD *)(v60 + 65);
        int v88 = v60[120];
        if (v88 == 255)
        {
          long long v89 = *(_OWORD *)(v60 + 88);
          *(_OWORD *)(v59 + 72) = *(_OWORD *)(v60 + 72);
          *(_OWORD *)(v59 + 88) = v89;
          *(_OWORD *)(v59 + 104) = *(_OWORD *)(v60 + 104);
          v59[120] = v60[120];
        }
        else
        {
          char v145 = v88 & 1;
          uint64_t v91 = (void *)*((void *)v60 + 9);
          uint64_t v90 = *((void *)v60 + 10);
          uint64_t v92 = *((void *)v60 + 11);
          uint64_t v93 = *((void *)v60 + 12);
          uint64_t v94 = *((void *)v60 + 13);
          uint64_t v140 = *((void *)v60 + 14);
          sub_100006B40(v91, v90, v92, v93, v94, v140, v88 & 1);
          *((void *)v59 + 9) = v91;
          *((void *)v59 + 10) = v90;
          *((void *)v59 + 11) = v92;
          *((void *)v59 + 12) = v93;
          *((void *)v59 + 13) = v94;
          *((void *)v59 + 14) = v140;
          v59[120] = v145;
        }
        a3 = v147;
        v59[121] = v60[121];
      }
      else
      {
LABEL_35:
        long long v68 = *((_OWORD *)v60 + 5);
        *((_OWORD *)v59 + 4) = *((_OWORD *)v60 + 4);
        *((_OWORD *)v59 + 5) = v68;
        *((_OWORD *)v59 + 6) = *((_OWORD *)v60 + 6);
        *(_OWORD *)(v59 + 106) = *(_OWORD *)(v60 + 106);
        long long v69 = *((_OWORD *)v60 + 1);
        *(_OWORD *)int v59 = *(_OWORD *)v60;
        *((_OWORD *)v59 + 1) = v69;
        long long v70 = *((_OWORD *)v60 + 3);
        *((_OWORD *)v59 + 2) = *((_OWORD *)v60 + 2);
        *((_OWORD *)v59 + 3) = v70;
      }
LABEL_38:
      *((unsigned char *)a1 + v57[6]) = *((unsigned char *)a2 + v57[6]);
      *((unsigned char *)a1 + v57[7]) = *((unsigned char *)a2 + v57[7]);
      *((unsigned char *)a1 + v57[8]) = *((unsigned char *)a2 + v57[8]);
      *((unsigned char *)a1 + v57[9]) = *((unsigned char *)a2 + v57[9]);
      *((unsigned char *)a1 + v57[10]) = *((unsigned char *)a2 + v57[10]);
      uint64_t v75 = v57[11];
      uint64_t v76 = *(void **)((char *)a2 + v75);
      *(void **)((char *)a1 + v75) = v76;
      id v77 = v76;
      goto LABEL_63;
    case 2u:
      uint64_t v9 = *a2;
      *a1 = *a2;
      uint64_t v10 = *(int *)(sub_100021F70() + 20);
      uint64_t v11 = (void **)((char *)a1 + v10);
      uint64_t v12 = (void **)((char *)a2 + v10);
      uint64_t v13 = sub_100021FF0();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
      id v16 = v9;
      if (v15(v12, 1, v13)) {
        goto LABEL_9;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          uint64_t v96 = *v12;
          *uint64_t v11 = *v12;
          id v97 = v96;
          goto LABEL_52;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v95 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v95 - 8) + 16))(v11, v12, v95);
LABEL_52:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v11, v12, *(void *)(v14 + 64));
          break;
      }
      goto LABEL_62;
    case 3u:
      uint64_t v17 = *a2;
      *a1 = *a2;
      uint64_t v18 = *(int *)(sub_100021F70() + 20);
      uint64_t v11 = (void **)((char *)a1 + v18);
      uint64_t v12 = (void **)((char *)a2 + v18);
      uint64_t v13 = sub_100021FF0();
      uint64_t v14 = *(void *)(v13 - 8);
      int v19 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
      id v20 = v17;
      if (v19(v12, 1, v13)) {
        goto LABEL_9;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
        case 8u:
        case 9u:
          uint64_t v40 = *v12;
          *uint64_t v11 = *v12;
          id v41 = v40;
          goto LABEL_61;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v101 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v101 - 8) + 16))(v11, v12, v101);
LABEL_61:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v11, v12, *(void *)(v14 + 64));
          break;
      }
      goto LABEL_62;
    case 4u:
      uint64_t v21 = *a2;
      *a1 = *a2;
      uint64_t v22 = *(int *)(sub_100021F70() + 20);
      uint64_t v11 = (void **)((char *)a1 + v22);
      uint64_t v12 = (void **)((char *)a2 + v22);
      uint64_t v13 = sub_100021FF0();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v23 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
      id v24 = v21;
      if (v23(v12, 1, v13))
      {
LABEL_9:
        uint64_t v25 = sub_100006B9C(&qword_10002DB38);
        memcpy(v11, v12, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v99 = *v12;
            *uint64_t v11 = *v12;
            id v100 = v99;
            goto LABEL_58;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v98 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v98 - 8) + 16))(v11, v12, v98);
LABEL_58:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v11, v12, *(void *)(v14 + 64));
            break;
        }
LABEL_62:
        (*(void (**)(void **, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
LABEL_63:
      swift_storeEnumTagMultiPayload();
LABEL_64:
      uint64_t v102 = a3[6];
      *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
      uint64_t v103 = *(void **)((char *)a2 + v102);
      *(void **)((char *)a1 + v102) = v103;
      uint64_t v104 = a3[7];
      uint64_t v105 = a3[8];
      v106 = *(void **)((char *)a2 + v104);
      *(void **)((char *)a1 + v104) = v106;
      *((unsigned char *)a1 + v105) = *((unsigned char *)a2 + v105);
      uint64_t v107 = a3[10];
      *(void **)((char *)a1 + a3[9]) = *(void **)((char *)a2 + a3[9]);
      uint64_t v108 = (void **)((char *)a1 + v107);
      uint64_t v146 = a2;
      v109 = (void **)((char *)a2 + v107);
      uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      uint64_t v111 = *(void *)(ReminderView - 8);
      uint64_t v112 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v111 + 48);
      id v113 = v103;
      id v114 = v106;
      swift_bridgeObjectRetain();
      if (v112(v109, 1, ReminderView))
      {
        uint64_t v115 = sub_100006B9C(&qword_10002DFE8);
        memcpy(v108, v109, *(void *)(*(void *)(v115 - 8) + 64));
      }
      else
      {
        v116 = *v109;
        char *v108 = *v109;
        uint64_t v117 = *(int *)(ReminderView + 20);
        uint64_t v118 = (char *)v108 + v117;
        uint64_t v119 = (char *)v109 + v117;
        uint64_t v120 = sub_100021CB0();
        int v121 = *(void (**)(char *, char *, uint64_t))(*(void *)(v120 - 8) + 16);
        id v122 = v116;
        v121(v118, v119, v120);
        uint64_t v123 = *(int *)(ReminderView + 24);
        id v124 = *(void **)((char *)v109 + v123);
        *(void **)((char *)v108 + v123) = v124;
        uint64_t v125 = *(void (**)(void **, void, uint64_t, uint64_t))(v111 + 56);
        id v126 = v124;
        v125(v108, 0, 1, ReminderView);
      }
      uint64_t v127 = v147[11];
      id v128 = (char *)a1 + v127;
      uint64_t v129 = (char *)v146 + v127;
      int v130 = v129[8];
      if (v130 == 255)
      {
        *(void *)id v128 = *(void *)v129;
        v128[8] = v129[8];
      }
      else
      {
        char v131 = v130 & 1;
        uint64_t v132 = *(void *)v129;
        id v133 = *(id *)v129;
        *(void *)id v128 = v132;
        v128[8] = v131;
      }
      return a1;
    case 5u:
      *a1 = *a2;
      *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
      *(_WORD *)((char *)a1 + 9) = *(_WORD *)((char *)a2 + 9);
      uint64_t v26 = a2[2];
      a1[2] = v26;
      id v27 = v26;
      goto LABEL_63;
    case 6u:
      uint64_t v35 = *a2;
      *a1 = *a2;
      id v36 = v35;
      goto LABEL_63;
    case 7u:
      uint64_t v28 = sub_100021FA0();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v29 + 48))(a2, 1, v28))
      {
        uint64_t v30 = sub_100006B9C(&qword_10002DB40);
        memcpy(a1, a2, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        uint64_t v42 = *(int *)(v28 + 20);
        unsigned __int8 v141 = (char *)a1 + v42;
        id v43 = (char *)a2 + v42;
        uint64_t v44 = sub_100022400();
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16);
        swift_bridgeObjectRetain();
        v45(v141, v43, v44);
        (*(void (**)(void **, void, uint64_t, uint64_t))(v29 + 56))(a1, 0, 1, v28);
      }
      uint64_t v46 = *(int *)(sub_100021F80() + 20);
      uint64_t v47 = (void **)((char *)a1 + v46);
      uint64_t v48 = (void **)((char *)a2 + v46);
      uint64_t v49 = v48[1];
      if (v49)
      {
        void *v47 = *v48;
        v47[1] = v49;
        uint64_t v50 = (void *)v48[2];
        v47[2] = v50;
        swift_bridgeObjectRetain();
        id v51 = v50;
      }
      else
      {
        *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
        v47[2] = v48[2];
      }
      goto LABEL_63;
    case 8u:
      uint64_t v37 = sub_100022010();
      uint64_t v38 = *(void *)(v37 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v38 + 48))(a2, 1, v37))
      {
        uint64_t v39 = sub_100022000();
        memcpy(a1, a2, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        uint64_t v52 = sub_100021CE0();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v52 - 8) + 16))(a1, a2, v52);
        *((unsigned char *)a1 + *(int *)(v37 + 20)) = *((unsigned char *)a2 + *(int *)(v37 + 20));
        (*(void (**)(void **, void, uint64_t, uint64_t))(v38 + 56))(a1, 0, 1, v37);
      }
      uint64_t v53 = sub_100022020();
      *(void **)((char *)a1 + *(int *)(v53 + 20)) = *(void **)((char *)a2 + *(int *)(v53 + 20));
      goto LABEL_63;
    case 9u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v31 = *(int *)(sub_100021EA0() + 20);
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      uint64_t v34 = sub_1000224C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      goto LABEL_63;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      goto LABEL_64;
  }
}

void **sub_100019E68(void **a1, void **a2, int *a3)
{
  uint64_t v4 = a2;
  if (a1 != a2)
  {
    sub_10001B760((uint64_t)a1, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    uint64_t v6 = sub_100021FC0();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v53 = *v4;
            *a1 = *v4;
            id v54 = v53;
            goto LABEL_31;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v52 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v52 - 8) + 16))(a1, v4, v52);
LABEL_31:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, v4, *(void *)(*(void *)(v7 - 8) + 64));
            break;
        }
        uint64_t v55 = (int *)sub_100021F90();
        uint64_t v56 = v55[5];
        uint64_t v57 = (char *)a1 + v56;
        uint64_t v58 = (char *)v4 + v56;
        if (!*(void **)((char *)v4 + v56 + 8)) {
          goto LABEL_35;
        }
        v167 = v55;
        *(void *)uint64_t v57 = *(void *)v58;
        *((void *)v57 + 1) = *((void *)v58 + 1);
        int v59 = (void *)*((void *)v58 + 2);
        uint64_t v60 = *((void *)v58 + 3);
        uint64_t v61 = *((void *)v58 + 4);
        uint64_t v62 = *((void *)v58 + 5);
        uint64_t v63 = *((void *)v58 + 7);
        uint64_t v163 = *((void *)v58 + 6);
        unsigned __int8 v171 = v58[64];
        swift_bridgeObjectRetain();
        sub_100006B18(v59, v60, v61, v62, v163, v63, v171);
        *((void *)v57 + 2) = v59;
        *((void *)v57 + 3) = v60;
        *((void *)v57 + 4) = v61;
        *((void *)v57 + 5) = v62;
        *((void *)v57 + 6) = v163;
        *((void *)v57 + 7) = v63;
        v57[64] = v171;
        v57[65] = v58[65];
        v57[66] = v58[66];
        v57[67] = v58[67];
        v57[68] = v58[68];
        int v64 = v58[120];
        if (v64 == 255)
        {
          long long v65 = *(_OWORD *)(v58 + 72);
          long long v66 = *(_OWORD *)(v58 + 88);
          long long v67 = *(_OWORD *)(v58 + 104);
          v57[120] = v58[120];
          *(_OWORD *)(v57 + 88) = v66;
          *(_OWORD *)(v57 + 104) = v67;
          *(_OWORD *)(v57 + 72) = v65;
        }
        else
        {
          char v172 = v64 & 1;
          uint64_t v75 = (void *)*((void *)v58 + 9);
          uint64_t v74 = *((void *)v58 + 10);
          uint64_t v76 = *((void *)v58 + 11);
          uint64_t v77 = *((void *)v58 + 12);
          uint64_t v78 = *((void *)v58 + 13);
          uint64_t v164 = *((void *)v58 + 14);
          sub_100006B40(v75, v74, v76, v77, v78, v164, v64 & 1);
          *((void *)v57 + 9) = v75;
          *((void *)v57 + 10) = v74;
          *((void *)v57 + 11) = v76;
          *((void *)v57 + 12) = v77;
          *((void *)v57 + 13) = v78;
          *((void *)v57 + 14) = v164;
          v57[120] = v172;
        }
        v57[121] = v58[121];
        uint64_t v55 = v167;
        goto LABEL_38;
      case 1u:
        uint64_t v8 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v83 = *v4;
            *a1 = *v4;
            id v84 = v83;
            goto LABEL_42;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v82 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v82 - 8) + 16))(a1, v4, v82);
LABEL_42:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, v4, *(void *)(*(void *)(v8 - 8) + 64));
            break;
        }
        uint64_t v55 = (int *)sub_100021F90();
        uint64_t v85 = v55[5];
        uint64_t v57 = (char *)a1 + v85;
        uint64_t v58 = (char *)v4 + v85;
        if (*(void **)((char *)v4 + v85 + 8))
        {
          v168 = v55;
          *(void *)uint64_t v57 = *(void *)v58;
          *((void *)v57 + 1) = *((void *)v58 + 1);
          uint64_t v86 = (void *)*((void *)v58 + 2);
          uint64_t v87 = *((void *)v58 + 3);
          uint64_t v88 = *((void *)v58 + 4);
          uint64_t v89 = *((void *)v58 + 5);
          uint64_t v90 = *((void *)v58 + 7);
          uint64_t v165 = *((void *)v58 + 6);
          unsigned __int8 v173 = v58[64];
          swift_bridgeObjectRetain();
          sub_100006B18(v86, v87, v88, v89, v165, v90, v173);
          *((void *)v57 + 2) = v86;
          *((void *)v57 + 3) = v87;
          *((void *)v57 + 4) = v88;
          *((void *)v57 + 5) = v89;
          *((void *)v57 + 6) = v165;
          *((void *)v57 + 7) = v90;
          v57[64] = v173;
          v57[65] = v58[65];
          v57[66] = v58[66];
          v57[67] = v58[67];
          v57[68] = v58[68];
          int v91 = v58[120];
          if (v91 == 255)
          {
            long long v92 = *(_OWORD *)(v58 + 72);
            long long v93 = *(_OWORD *)(v58 + 88);
            long long v94 = *(_OWORD *)(v58 + 104);
            v57[120] = v58[120];
            *(_OWORD *)(v57 + 88) = v93;
            *(_OWORD *)(v57 + 104) = v94;
            *(_OWORD *)(v57 + 72) = v92;
          }
          else
          {
            char v174 = v91 & 1;
            uint64_t v96 = (void *)*((void *)v58 + 9);
            uint64_t v95 = *((void *)v58 + 10);
            uint64_t v97 = *((void *)v58 + 11);
            uint64_t v98 = *((void *)v58 + 12);
            uint64_t v99 = *((void *)v58 + 13);
            uint64_t v166 = *((void *)v58 + 14);
            sub_100006B40(v96, v95, v97, v98, v99, v166, v91 & 1);
            *((void *)v57 + 9) = v96;
            *((void *)v57 + 10) = v95;
            *((void *)v57 + 11) = v97;
            *((void *)v57 + 12) = v98;
            *((void *)v57 + 13) = v99;
            *((void *)v57 + 14) = v166;
            v57[120] = v174;
          }
          v57[121] = v58[121];
          uint64_t v55 = v168;
        }
        else
        {
LABEL_35:
          long long v68 = *(_OWORD *)v58;
          long long v69 = *((_OWORD *)v58 + 1);
          long long v70 = *((_OWORD *)v58 + 3);
          *((_OWORD *)v57 + 2) = *((_OWORD *)v58 + 2);
          *((_OWORD *)v57 + 3) = v70;
          *(_OWORD *)uint64_t v57 = v68;
          *((_OWORD *)v57 + 1) = v69;
          long long v71 = *((_OWORD *)v58 + 4);
          long long v72 = *((_OWORD *)v58 + 5);
          long long v73 = *((_OWORD *)v58 + 6);
          *(_OWORD *)(v57 + 106) = *(_OWORD *)(v58 + 106);
          *((_OWORD *)v57 + 5) = v72;
          *((_OWORD *)v57 + 6) = v73;
          *((_OWORD *)v57 + 4) = v71;
        }
LABEL_38:
        *((unsigned char *)a1 + v55[6]) = *((unsigned char *)v4 + v55[6]);
        *((unsigned char *)a1 + v55[7]) = *((unsigned char *)v4 + v55[7]);
        *((unsigned char *)a1 + v55[8]) = *((unsigned char *)v4 + v55[8]);
        *((unsigned char *)a1 + v55[9]) = *((unsigned char *)v4 + v55[9]);
        *((unsigned char *)a1 + v55[10]) = *((unsigned char *)v4 + v55[10]);
        uint64_t v79 = v55[11];
        id v80 = *(void **)((char *)v4 + v79);
        *(void **)((char *)a1 + v79) = v80;
        id v81 = v80;
        goto LABEL_64;
      case 2u:
        uint64_t v9 = *v4;
        *a1 = *v4;
        uint64_t v10 = *(int *)(sub_100021F70() + 20);
        uint64_t v11 = (void **)((char *)a1 + v10);
        uint64_t v12 = (void **)((char *)v4 + v10);
        uint64_t v13 = sub_100021FF0();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v15 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
        id v16 = v9;
        if (v15(v12, 1, v13)) {
          goto LABEL_10;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v101 = *v12;
            *uint64_t v11 = *v12;
            id v102 = v101;
            goto LABEL_52;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v100 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v100 - 8) + 16))(v11, v12, v100);
LABEL_52:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v11, v12, *(void *)(v14 + 64));
            break;
        }
        goto LABEL_63;
      case 3u:
        uint64_t v17 = *v4;
        *a1 = *v4;
        uint64_t v18 = *(int *)(sub_100021F70() + 20);
        uint64_t v11 = (void **)((char *)a1 + v18);
        uint64_t v12 = (void **)((char *)v4 + v18);
        uint64_t v13 = sub_100021FF0();
        uint64_t v14 = *(void *)(v13 - 8);
        int v19 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
        id v20 = v17;
        if (v19(v12, 1, v13)) {
          goto LABEL_10;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
          case 8u:
          case 9u:
            uint64_t v104 = *v12;
            *uint64_t v11 = *v12;
            id v105 = v104;
            goto LABEL_57;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v103 = sub_100021CE0();
            (*(void (**)(void **, void **, uint64_t))(*(void *)(v103 - 8) + 16))(v11, v12, v103);
LABEL_57:
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v11, v12, *(void *)(v14 + 64));
            break;
        }
        goto LABEL_63;
      case 4u:
        uint64_t v21 = *v4;
        *a1 = *v4;
        uint64_t v22 = *(int *)(sub_100021F70() + 20);
        uint64_t v11 = (void **)((char *)a1 + v22);
        uint64_t v12 = (void **)((char *)v4 + v22);
        uint64_t v13 = sub_100021FF0();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v23 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v14 + 48);
        id v24 = v21;
        if (v23(v12, 1, v13))
        {
LABEL_10:
          uint64_t v25 = sub_100006B9C(&qword_10002DB38);
          memcpy(v11, v12, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
            case 8u:
            case 9u:
              uint64_t v107 = *v12;
              *uint64_t v11 = *v12;
              id v108 = v107;
              goto LABEL_62;
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 6u:
              uint64_t v106 = sub_100021CE0();
              (*(void (**)(void **, void **, uint64_t))(*(void *)(v106 - 8) + 16))(v11, v12, v106);
LABEL_62:
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v11, v12, *(void *)(v14 + 64));
              break;
          }
LABEL_63:
          (*(void (**)(void **, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
        }
LABEL_64:
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        *a1 = *v4;
        *((unsigned char *)a1 + 8) = *((unsigned char *)v4 + 8);
        *((unsigned char *)a1 + 9) = *((unsigned char *)v4 + 9);
        *((unsigned char *)a1 + 10) = *((unsigned char *)v4 + 10);
        uint64_t v26 = v4[2];
        a1[2] = v26;
        id v27 = v26;
        goto LABEL_64;
      case 6u:
        uint64_t v35 = *v4;
        *a1 = *v4;
        id v36 = v35;
        goto LABEL_64;
      case 7u:
        uint64_t v28 = sub_100021FA0();
        uint64_t v29 = *(void *)(v28 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v29 + 48))(v4, 1, v28))
        {
          uint64_t v30 = sub_100006B9C(&qword_10002DB40);
          memcpy(a1, v4, *(void *)(*(void *)(v30 - 8) + 64));
        }
        else
        {
          *a1 = *v4;
          uint64_t v40 = *(int *)(v28 + 20);
          v170 = (char *)a1 + v40;
          id v41 = (char *)v4 + v40;
          uint64_t v42 = sub_100022400();
          id v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16);
          swift_bridgeObjectRetain();
          v43(v170, v41, v42);
          (*(void (**)(void **, void, uint64_t, uint64_t))(v29 + 56))(a1, 0, 1, v28);
        }
        uint64_t v44 = *(int *)(sub_100021F80() + 20);
        uint64_t v45 = (void **)((char *)a1 + v44);
        uint64_t v46 = (void **)((char *)v4 + v44);
        if (v46[1])
        {
          *uint64_t v45 = *v46;
          v45[1] = v46[1];
          uint64_t v47 = (void *)v46[2];
          v45[2] = v47;
          swift_bridgeObjectRetain();
          id v48 = v47;
        }
        else
        {
          long long v49 = *(_OWORD *)v46;
          v45[2] = v46[2];
          *(_OWORD *)uint64_t v45 = v49;
        }
        goto LABEL_64;
      case 8u:
        uint64_t v37 = sub_100022010();
        uint64_t v38 = *(void *)(v37 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v38 + 48))(v4, 1, v37))
        {
          uint64_t v39 = sub_100022000();
          memcpy(a1, v4, *(void *)(*(void *)(v39 - 8) + 64));
        }
        else
        {
          uint64_t v50 = sub_100021CE0();
          (*(void (**)(void **, void **, uint64_t))(*(void *)(v50 - 8) + 16))(a1, v4, v50);
          *((unsigned char *)a1 + *(int *)(v37 + 20)) = *((unsigned char *)v4 + *(int *)(v37 + 20));
          (*(void (**)(void **, void, uint64_t, uint64_t))(v38 + 56))(a1, 0, 1, v37);
        }
        uint64_t v51 = sub_100022020();
        *(void **)((char *)a1 + *(int *)(v51 + 20)) = *(void **)((char *)v4 + *(int *)(v51 + 20));
        goto LABEL_64;
      case 9u:
        *(unsigned char *)a1 = *(unsigned char *)v4;
        uint64_t v31 = *(int *)(sub_100021EA0() + 20);
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)v4 + v31;
        uint64_t v34 = sub_1000224C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
        goto LABEL_64;
      default:
        memcpy(a1, v4, *(void *)(*(void *)(v6 - 8) + 64));
        break;
    }
  }
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)v4 + a3[5]);
  uint64_t v109 = a3[6];
  id v110 = *(void **)((char *)v4 + v109);
  uint64_t v111 = *(void **)((char *)a1 + v109);
  *(void **)((char *)a1 + v109) = v110;
  id v112 = v110;

  uint64_t v113 = a3[7];
  id v114 = *(void **)((char *)v4 + v113);
  uint64_t v115 = *(void **)((char *)a1 + v113);
  *(void **)((char *)a1 + v113) = v114;
  id v116 = v114;

  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)v4 + a3[8]);
  *(void **)((char *)a1 + a3[9]) = *(void **)((char *)v4 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v117 = a3[10];
  uint64_t v118 = (void **)((char *)a1 + v117);
  uint64_t v119 = (void **)((char *)v4 + v117);
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  uint64_t v121 = *(void *)(ReminderView - 8);
  id v122 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v121 + 48);
  int v123 = v122(v118, 1, ReminderView);
  int v124 = v122(v119, 1, ReminderView);
  if (v123)
  {
    if (!v124)
    {
      v175 = a3;
      uint64_t v125 = *v119;
      *uint64_t v118 = *v119;
      uint64_t v126 = *(int *)(ReminderView + 20);
      v169 = (char *)v118 + v126;
      uint64_t v127 = (char *)v119 + v126;
      uint64_t v128 = sub_100021CB0();
      uint64_t v129 = v4;
      int v130 = *(void (**)(char *, char *, uint64_t))(*(void *)(v128 - 8) + 16);
      id v131 = v125;
      a3 = v175;
      v130(v169, v127, v128);
      uint64_t v4 = v129;
      uint64_t v132 = *(int *)(ReminderView + 24);
      id v133 = *(void **)((char *)v119 + v132);
      *(void **)((char *)v118 + v132) = v133;
      uint64_t v134 = *(void (**)(void **, void, uint64_t, uint64_t))(v121 + 56);
      id v135 = v133;
      v134(v118, 0, 1, ReminderView);
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  if (v124)
  {
    sub_10001B760((uint64_t)v118, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_70:
    uint64_t v136 = sub_100006B9C(&qword_10002DFE8);
    memcpy(v118, v119, *(void *)(*(void *)(v136 - 8) + 64));
    goto LABEL_71;
  }
  v152 = *v119;
  uint64_t v153 = *v118;
  *uint64_t v118 = *v119;
  id v154 = v152;

  uint64_t v155 = *(int *)(ReminderView + 20);
  unsigned __int8 v156 = (char *)v118 + v155;
  char v157 = (char *)v119 + v155;
  uint64_t v158 = sub_100021CB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v158 - 8) + 24))(v156, v157, v158);
  uint64_t v159 = *(int *)(ReminderView + 24);
  v160 = *(void **)((char *)v118 + v159);
  v161 = *(void **)((char *)v119 + v159);
  *(void **)((char *)v118 + v159) = v161;
  id v162 = v161;

LABEL_71:
  uint64_t v137 = a3[11];
  uint64_t v138 = (void **)((char *)a1 + v137);
  uint64_t v139 = (char *)v4 + v137;
  int v140 = *((unsigned __int8 *)a1 + v137 + 8);
  int v141 = *((unsigned __int8 *)v4 + v137 + 8);
  if (v140 == 255)
  {
    if (v141 == 255)
    {
      char v143 = *(void **)v139;
      *((unsigned char *)v138 + 8) = v139[8];
      *uint64_t v138 = v143;
    }
    else
    {
      char v148 = v141 & 1;
      id v149 = *(void **)v139;
      id v150 = v149;
      *uint64_t v138 = v149;
      *((unsigned char *)v138 + 8) = v148;
    }
  }
  else if (v141 == 255)
  {
    sub_10001B7C0(v138);
    char v142 = v139[8];
    *uint64_t v138 = *(id *)v139;
    *((unsigned char *)v138 + 8) = v142;
  }
  else
  {
    char v144 = v141 & 1;
    char v145 = *(void **)v139;
    id v146 = v145;
    id v147 = *v138;
    *uint64_t v138 = v145;
    *((unsigned char *)v138 + 8) = v144;
  }
  return a1;
}

uint64_t sub_10001B760(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id *sub_10001B7C0(id *a1)
{
  return a1;
}

void *sub_10001B7F0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = sub_100021FC0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v7 = sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v36 = sub_100021CE0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 32))(a1, a2, v36);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
          break;
      }
      goto LABEL_25;
    case 1u:
      uint64_t v8 = sub_100021FF0();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v45 = sub_100021CE0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 32))(a1, a2, v45);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
          break;
      }
LABEL_25:
      uint64_t v37 = (int *)sub_100021F90();
      uint64_t v38 = v37[5];
      uint64_t v39 = (_OWORD *)((char *)a1 + v38);
      uint64_t v40 = (_OWORD *)((char *)a2 + v38);
      long long v41 = v40[3];
      v39[2] = v40[2];
      v39[3] = v41;
      long long v42 = v40[1];
      *uint64_t v39 = *v40;
      v39[1] = v42;
      *(_OWORD *)((char *)v39 + 106) = *(_OWORD *)((char *)v40 + 106);
      long long v43 = v40[6];
      long long v44 = v40[4];
      v39[5] = v40[5];
      v39[6] = v43;
      v39[4] = v44;
      *((unsigned char *)a1 + v37[6]) = *((unsigned char *)a2 + v37[6]);
      *((unsigned char *)a1 + v37[7]) = *((unsigned char *)a2 + v37[7]);
      *((unsigned char *)a1 + v37[8]) = *((unsigned char *)a2 + v37[8]);
      *((unsigned char *)a1 + v37[9]) = *((unsigned char *)a2 + v37[9]);
      *((unsigned char *)a1 + v37[10]) = *((unsigned char *)a2 + v37[10]);
      *(void *)((char *)a1 + v37[11]) = *(void *)((char *)a2 + v37[11]);
      goto LABEL_38;
    case 2u:
      *a1 = *a2;
      uint64_t v9 = *(int *)(sub_100021F70() + 20);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_100021FF0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        goto LABEL_7;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v46 = sub_100021CE0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v10, v11, v46);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v10, v11, *(void *)(v13 + 64));
          break;
      }
      goto LABEL_37;
    case 3u:
      *a1 = *a2;
      uint64_t v14 = *(int *)(sub_100021F70() + 20);
      uint64_t v10 = (char *)a1 + v14;
      uint64_t v11 = (char *)a2 + v14;
      uint64_t v12 = sub_100021FF0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
        goto LABEL_7;
      }
      switch(swift_getEnumCaseMultiPayload())
      {
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          uint64_t v47 = sub_100021CE0();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v10, v11, v47);
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v10, v11, *(void *)(v13 + 64));
          break;
      }
      goto LABEL_37;
    case 4u:
      *a1 = *a2;
      uint64_t v16 = *(int *)(sub_100021F70() + 20);
      uint64_t v10 = (char *)a1 + v16;
      uint64_t v11 = (char *)a2 + v16;
      uint64_t v12 = sub_100021FF0();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
LABEL_7:
        uint64_t v15 = sub_100006B9C(&qword_10002DB38);
        memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v48 = sub_100021CE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v10, v11, v48);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v10, v11, *(void *)(v13 + 64));
            break;
        }
LABEL_37:
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
LABEL_38:
      swift_storeEnumTagMultiPayload();
LABEL_39:
      uint64_t v49 = a3[6];
      *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
      *(void *)((char *)a1 + v49) = *(void *)((char *)a2 + v49);
      uint64_t v50 = a3[8];
      *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
      *((unsigned char *)a1 + v50) = *((unsigned char *)a2 + v50);
      uint64_t v51 = a3[10];
      *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
      uint64_t v52 = (void *)((char *)a1 + v51);
      uint64_t v53 = (void *)((char *)a2 + v51);
      uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      uint64_t v55 = *(void *)(ReminderView - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v55 + 48))(v53, 1, ReminderView))
      {
        uint64_t v56 = sub_100006B9C(&qword_10002DFE8);
        memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        *uint64_t v52 = *v53;
        uint64_t v57 = *(int *)(ReminderView + 20);
        uint64_t v58 = (char *)v52 + v57;
        int v59 = (char *)v53 + v57;
        uint64_t v60 = sub_100021CB0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
        *(void *)((char *)v52 + *(int *)(ReminderView + 24)) = *(void *)((char *)v53 + *(int *)(ReminderView + 24));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v55 + 56))(v52, 0, 1, ReminderView);
      }
      uint64_t v61 = a3[11];
      uint64_t v62 = (char *)a1 + v61;
      uint64_t v63 = (char *)a2 + v61;
      *(void *)uint64_t v62 = *(void *)v63;
      v62[8] = v63[8];
      return a1;
    case 7u:
      uint64_t v17 = sub_100021FA0();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
      {
        uint64_t v19 = sub_100006B9C(&qword_10002DB40);
        memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        uint64_t v27 = *(int *)(v17 + 20);
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = sub_100022400();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
      }
      uint64_t v31 = *(int *)(sub_100021F80() + 20);
      uint64_t v32 = (char *)a1 + v31;
      uint64_t v33 = (char *)a2 + v31;
      *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
      *((void *)v32 + 2) = *((void *)v33 + 2);
      goto LABEL_38;
    case 8u:
      uint64_t v20 = sub_100022010();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(a2, 1, v20))
      {
        uint64_t v22 = sub_100022000();
        memcpy(a1, a2, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        uint64_t v34 = sub_100021CE0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
        *((unsigned char *)a1 + *(int *)(v20 + 20)) = *((unsigned char *)a2 + *(int *)(v20 + 20));
        (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(a1, 0, 1, v20);
      }
      uint64_t v35 = sub_100022020();
      *(void *)((char *)a1 + *(int *)(v35 + 20)) = *(void *)((char *)a2 + *(int *)(v35 + 20));
      goto LABEL_38;
    case 9u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v23 = *(int *)(sub_100021EA0() + 20);
      id v24 = (char *)a1 + v23;
      uint64_t v25 = (char *)a2 + v23;
      uint64_t v26 = sub_1000224C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
      goto LABEL_38;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      goto LABEL_39;
  }
}

void *sub_10001CA34(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10001B760((uint64_t)a1, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    uint64_t v6 = sub_100021FC0();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v36 = sub_100021CE0();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 32))(a1, a2, v36);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
            break;
        }
        goto LABEL_26;
      case 1u:
        uint64_t v8 = sub_100021FF0();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v45 = sub_100021CE0();
            (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 32))(a1, a2, v45);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
            break;
        }
LABEL_26:
        uint64_t v37 = (int *)sub_100021F90();
        uint64_t v38 = v37[5];
        uint64_t v39 = (_OWORD *)((char *)a1 + v38);
        uint64_t v40 = (_OWORD *)((char *)a2 + v38);
        long long v41 = v40[3];
        v39[2] = v40[2];
        v39[3] = v41;
        long long v42 = v40[1];
        *uint64_t v39 = *v40;
        v39[1] = v42;
        *(_OWORD *)((char *)v39 + 106) = *(_OWORD *)((char *)v40 + 106);
        long long v43 = v40[6];
        long long v44 = v40[4];
        v39[5] = v40[5];
        v39[6] = v43;
        v39[4] = v44;
        *((unsigned char *)a1 + v37[6]) = *((unsigned char *)a2 + v37[6]);
        *((unsigned char *)a1 + v37[7]) = *((unsigned char *)a2 + v37[7]);
        *((unsigned char *)a1 + v37[8]) = *((unsigned char *)a2 + v37[8]);
        *((unsigned char *)a1 + v37[9]) = *((unsigned char *)a2 + v37[9]);
        *((unsigned char *)a1 + v37[10]) = *((unsigned char *)a2 + v37[10]);
        *(void *)((char *)a1 + v37[11]) = *(void *)((char *)a2 + v37[11]);
        goto LABEL_39;
      case 2u:
        *a1 = *a2;
        uint64_t v9 = *(int *)(sub_100021F70() + 20);
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_100021FF0();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
          goto LABEL_8;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v46 = sub_100021CE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v10, v11, v46);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v10, v11, *(void *)(v13 + 64));
            break;
        }
        goto LABEL_38;
      case 3u:
        *a1 = *a2;
        uint64_t v14 = *(int *)(sub_100021F70() + 20);
        uint64_t v10 = (char *)a1 + v14;
        uint64_t v11 = (char *)a2 + v14;
        uint64_t v12 = sub_100021FF0();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
          goto LABEL_8;
        }
        switch(swift_getEnumCaseMultiPayload())
        {
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            uint64_t v47 = sub_100021CE0();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v10, v11, v47);
            swift_storeEnumTagMultiPayload();
            break;
          default:
            memcpy(v10, v11, *(void *)(v13 + 64));
            break;
        }
        goto LABEL_38;
      case 4u:
        *a1 = *a2;
        uint64_t v16 = *(int *)(sub_100021F70() + 20);
        uint64_t v10 = (char *)a1 + v16;
        uint64_t v11 = (char *)a2 + v16;
        uint64_t v12 = sub_100021FF0();
        uint64_t v13 = *(void *)(v12 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
        {
LABEL_8:
          uint64_t v15 = sub_100006B9C(&qword_10002DB38);
          memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 6u:
              uint64_t v48 = sub_100021CE0();
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v10, v11, v48);
              swift_storeEnumTagMultiPayload();
              break;
            default:
              memcpy(v10, v11, *(void *)(v13 + 64));
              break;
          }
LABEL_38:
          (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
        }
LABEL_39:
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v17 = sub_100021FA0();
        uint64_t v18 = *(void *)(v17 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
        {
          uint64_t v19 = sub_100006B9C(&qword_10002DB40);
          memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          uint64_t v27 = *(int *)(v17 + 20);
          uint64_t v28 = (char *)a1 + v27;
          uint64_t v29 = (char *)a2 + v27;
          uint64_t v30 = sub_100022400();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
        }
        uint64_t v31 = *(int *)(sub_100021F80() + 20);
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)a2 + v31;
        *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
        *((void *)v32 + 2) = *((void *)v33 + 2);
        goto LABEL_39;
      case 8u:
        uint64_t v20 = sub_100022010();
        uint64_t v21 = *(void *)(v20 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(a2, 1, v20))
        {
          uint64_t v22 = sub_100022000();
          memcpy(a1, a2, *(void *)(*(void *)(v22 - 8) + 64));
        }
        else
        {
          uint64_t v34 = sub_100021CE0();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
          *((unsigned char *)a1 + *(int *)(v20 + 20)) = *((unsigned char *)a2 + *(int *)(v20 + 20));
          (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(a1, 0, 1, v20);
        }
        uint64_t v35 = sub_100022020();
        *(void *)((char *)a1 + *(int *)(v35 + 20)) = *(void *)((char *)a2 + *(int *)(v35 + 20));
        goto LABEL_39;
      case 9u:
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v23 = *(int *)(sub_100021EA0() + 20);
        id v24 = (char *)a1 + v23;
        uint64_t v25 = (char *)a2 + v23;
        uint64_t v26 = sub_1000224C0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
        goto LABEL_39;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
        break;
    }
  }
  uint64_t v49 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v50 = *(void **)((char *)a1 + v49);
  *(void *)((char *)a1 + v49) = *(void *)((char *)a2 + v49);

  uint64_t v51 = a3[7];
  uint64_t v52 = *(void **)((char *)a1 + v51);
  *(void *)((char *)a1 + v51) = *(void *)((char *)a2 + v51);

  uint64_t v53 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *(void *)((char *)a1 + v53) = *(void *)((char *)a2 + v53);
  swift_bridgeObjectRelease();
  uint64_t v54 = a3[10];
  uint64_t v55 = (void **)((char *)a1 + v54);
  uint64_t v56 = (void **)((char *)a2 + v54);
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  uint64_t v58 = *(void *)(ReminderView - 8);
  int v59 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v58 + 48);
  int v60 = v59(v55, 1, ReminderView);
  int v61 = v59(v56, 1, ReminderView);
  if (v60)
  {
    if (!v61)
    {
      *uint64_t v55 = *v56;
      uint64_t v62 = *(int *)(ReminderView + 20);
      uint64_t v63 = (char *)v55 + v62;
      int v64 = (char *)v56 + v62;
      uint64_t v65 = sub_100021CB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 32))(v63, v64, v65);
      *(void **)((char *)v55 + *(int *)(ReminderView + 24)) = *(void **)((char *)v56 + *(int *)(ReminderView + 24));
      (*(void (**)(void **, void, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, ReminderView);
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v61)
  {
    sub_10001B760((uint64_t)v55, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_45:
    uint64_t v66 = sub_100006B9C(&qword_10002DFE8);
    memcpy(v55, v56, *(void *)(*(void *)(v66 - 8) + 64));
    goto LABEL_46;
  }
  long long v73 = *v55;
  *uint64_t v55 = *v56;

  uint64_t v74 = *(int *)(ReminderView + 20);
  uint64_t v75 = (char *)v55 + v74;
  uint64_t v76 = (char *)v56 + v74;
  uint64_t v77 = sub_100021CB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 40))(v75, v76, v77);
  uint64_t v78 = *(int *)(ReminderView + 24);
  uint64_t v79 = *(void **)((char *)v55 + v78);
  *(void **)((char *)v55 + v78) = *(void **)((char *)v56 + v78);

LABEL_46:
  uint64_t v67 = a3[11];
  long long v68 = (id *)((char *)a1 + v67);
  long long v69 = (char *)a2 + v67;
  if (*((unsigned __int8 *)a1 + v67 + 8) != 255)
  {
    int v70 = v69[8];
    if (v70 != 255)
    {
      id v71 = *v68;
      *long long v68 = *(id *)v69;
      *((unsigned char *)v68 + 8) = v70 & 1;

      return a1;
    }
    sub_10001B7C0(v68);
  }
  *long long v68 = *(id *)v69;
  *((unsigned char *)v68 + 8) = v69[8];
  return a1;
}

uint64_t sub_10001DDA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001DDBC);
}

uint64_t sub_10001DDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100021FC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_100006B9C(&qword_10002DFE8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 40);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_10001DEEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001DF00);
}

uint64_t sub_10001DF00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100021FC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_100006B9C(&qword_10002DFE8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 40);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderViewModel(uint64_t a1)
{
  return sub_10000CC8C(a1, (uint64_t *)&unk_10002E2F0);
}

void sub_10001E050()
{
  sub_100021FC0();
  if (v0 <= 0x3F)
  {
    sub_10001E144();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10001E144()
{
  if (!qword_10002E300)
  {
    type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(255);
    unint64_t v0 = sub_1000226D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002E300);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(id *)a2;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for TTRIExtensionCreateReminderViewModel.Image(id *a1)
{
}

uint64_t assignWithCopy for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(id *)a2;
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;

  return a1;
}

uint64_t assignWithTake for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TTRIExtensionCreateReminderViewModel.Image(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
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

uint64_t sub_10001E314(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_10001E31C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TTRIExtensionCreateReminderViewModel.Image()
{
  return &type metadata for TTRIExtensionCreateReminderViewModel.Image;
}

void **sub_10001E338(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  int v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100021CB0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = *(void **)((char *)a2 + v14);
    *(void **)((char *)v7 + v14) = v15;
    id v16 = v15;
  }
  return v7;
}

void sub_10001E438(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100021CB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(id *)((char *)a1 + *(int *)(a2 + 24));
}

void **sub_10001E4C4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100021CB0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = *(void **)((char *)a2 + v13);
  *(void **)((char *)a1 + v13) = v14;
  id v15 = v14;
  return a1;
}

void **sub_10001E578(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100021CB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = *(void **)((char *)a1 + v13);
  id v15 = *(void **)((char *)a2 + v13);
  *(void **)((char *)a1 + v13) = v15;
  id v16 = v15;

  return a1;
}

void *sub_10001E628(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100021CB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_10001E6C0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100021CB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void **)((char *)a1 + v11);
  *(void **)((char *)a1 + v11) = *(void **)((char *)a2 + v11);

  return a1;
}

uint64_t sub_10001E768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E77C);
}

uint64_t sub_10001E77C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100021CB0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10001E82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001E840);
}

void *sub_10001E840(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100021CB0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10001E8E8()
{
  uint64_t result = sub_100021CB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10001E98C(uint64_t a1, uint64_t a2)
{
  return sub_10001EA8C(*(void **)a1, *(unsigned char *)(a1 + 8), *(void **)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_10001E9AC(uint64_t a1, uint64_t a2)
{
  sub_10000E8D8(0, &qword_10002DCC8);
  if (sub_1000226A0())
  {
    uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    if (sub_100021C90())
    {
      uint64_t v5 = *(int *)(ReminderView + 24);
      uint64_t v6 = *(void **)(a1 + v5);
      uint64_t v7 = *(void **)(a2 + v5);
      if (v6)
      {
        if (v7)
        {
          sub_10000E8D8(0, &qword_10002DCD0);
          id v8 = v7;
          id v9 = v6;
          char v10 = sub_1000226A0();

          if (v10) {
            return 1;
          }
        }
      }
      else if (!v7)
      {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_10001EA8C(void *a1, char a2, void *a3, char a4)
{
  if (a2)
  {
    if (a4)
    {
      if (a1)
      {
        if (a3)
        {
          sub_10000E8D8(0, &qword_10002DCD8);
          uint64_t v10 = 1;
          id v11 = a1;
          id v12 = a3;
          char v13 = sub_1000226A0();

          if (v13) {
            return v10;
          }
        }
      }
      else
      {
        if (!a3) {
          return 1;
        }
      }
    }
  }
  else if ((a4 & 1) == 0)
  {
    sub_10000E8D8(0, &qword_10002DCC8);
    id v6 = a1;
    id v7 = a3;
    char v8 = sub_1000226A0();

    return v8 & 1;
  }
  return 0;
}

uint64_t sub_10001EBC0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001EBE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10001EC10(void *a1, uint64_t (*a2)(void, void))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_10001EC4C()
{
  uint64_t v0 = sub_1000224A0();
  sub_100012C58(v0, qword_10002E3E0);
  uint64_t v1 = sub_100012A58(v0, (uint64_t)qword_10002E3E0);
  if (qword_10002D7C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100012A58(v0, (uint64_t)qword_10002E560);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

id sub_10001ED14(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout] = 0;
  *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_tableDataController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver] = 0;
  *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeCancellable] = 0;
  v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_generatedSuggestionTextHasBeenSelected] = 0;
  v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_isFirstUpdate] = 1;
  *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell] = 0;
  *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell] = 0;
  *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell] = 0;
  v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_detailViewHasBeenAutomaticallyShown] = 0;
  uint64_t v5 = v2;
  sub_100021E10();
  *(objc_super *)&v5[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_presenter] = v9[1];
  swift_unknownObjectRetain();

  v9[0].receiver = v5;
  v9[0].super_class = ObjectType;
  id v6 = [(objc_super *)v9 initWithCoder:a1];

  id v7 = v6;
  swift_unknownObjectRelease();
  if (v7) {

  }
  return v7;
}

void *sub_10001EE98()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100006B9C(&qword_10002E4D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006B9C(&qword_10002E4D8);
  uint64_t v33 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v32 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006B9C(&qword_10002DFD8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  uint64_t v12 = *(void *)(ReminderViewModel - 8);
  __chkstk_darwin(ReminderViewModel);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36.receiver = v0;
  v36.super_class = ObjectType;
  objc_msgSendSuper2(&v36, "viewDidLoad");
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v16 = result;
  uint64_t v30 = v6;
  uint64_t v31 = ObjectType;
  sub_1000225F0();

  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v17 = result;
  sub_100021D50();
  swift_bridgeObjectRetain();
  NSString v18 = sub_100022500();
  swift_bridgeObjectRelease();
  [v17 setAccessibilityIdentifier:v18];

  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v19 = result;
  [result setEditing:1];

  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v20 = result;
  [result setKeyboardDismissMode:3];

  sub_10001F408();
  uint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_presenter]
      + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_viewModel;
  swift_beginAccess();
  sub_10000EAC0(v21, (uint64_t)v10, &qword_10002DFD8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, ReminderViewModel) == 1)
  {
    sub_10000EA64((uint64_t)v10, &qword_10002DFD8);
  }
  else
  {
    sub_1000218B0((uint64_t)v10, (uint64_t)v14, type metadata accessor for TTRIExtensionCreateReminderViewModel);
    sub_10001F814((uint64_t)v14);
    sub_100021918((uint64_t)v14);
  }
  uint64_t v23 = v32;
  uint64_t v22 = v33;
  sub_1000221B0();
  swift_allocObject();
  uint64_t v24 = sub_1000221A0();
  *(void *)&v1[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver] = v24;
  swift_retain();
  swift_release();
  uint64_t v35 = *(void *)(v24 + 16);
  uint64_t v25 = self;
  swift_retain();
  id v34 = [v25 mainRunLoop];
  uint64_t v26 = sub_1000226B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v5, 1, 1, v26);
  sub_100006B9C(&qword_10002E4E0);
  sub_10000E8D8(0, &qword_10002E4E8);
  sub_10002186C(&qword_10002E4F0, &qword_10002E4E0);
  sub_100021804();
  sub_1000224E0();
  sub_10000EA64((uint64_t)v5, &qword_10002E4D0);

  swift_release();
  sub_10002186C(&qword_10002E500, &qword_10002E4D8);
  uint64_t v27 = v30;
  uint64_t v28 = sub_1000224D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v27);
  *(void *)&v1[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeCancellable] = v28;
  return (void *)swift_release();
}

void sub_10001F408()
{
  uint64_t v1 = v0;
  if (![v0 isViewLoaded]) {
    return;
  }
  uint64_t v2 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_tableDataController;
  if (!*(void *)&v0[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_tableDataController])
  {
    sub_100006B9C(&qword_10002DD48);
    unint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100023860;
    sub_100006B9C(&qword_10002E508);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100023590;
    *(void *)(v7 + 32) = sub_10002028C();
    *(void *)(v7 + 40) = &protocol witness table for TTRITableCell<A>;
    sub_100021DA0();
    swift_allocObject();
    *(void *)(inited + 32) = sub_100021D90();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_100023590;
    *(void *)(v8 + 32) = sub_100020424();
    *(void *)(v8 + 40) = &protocol witness table for TTRITableCell<A>;
    swift_allocObject();
    *(void *)(inited + 40) = sub_100021D90();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100023590;
    *(void *)(v9 + 32) = sub_100020570();
    *(void *)(v9 + 40) = &protocol witness table for TTRITableCell<A>;
    swift_allocObject();
    *(void *)(inited + 48) = sub_100021D90();
    sub_100022590();
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_10002092C(inited);
      swift_bridgeObjectRelease();
      sub_10000E8D8(0, &qword_10002E4C8);
      id v10 = objc_allocWithZone((Class)sub_100021F00());
      id v11 = (char *)sub_100021EF0();
      uint64_t v12 = &v11[direct field offset for TTRITableDataController.customSectionSpacing];
      swift_beginAccess();
      *(void *)uint64_t v12 = 0x4030000000000000;
      v12[8] = 0;
      uint64_t v13 = *(void **)&v1[v2];
      *(void *)&v1[v2] = v11;
      uint64_t v14 = v11;

      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v16 = Strong;
        [Strong setDataSource:v14];

        uint64_t v17 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v17)
        {
          NSString v18 = v17;
          [v17 setDelegate:v14];

          return;
        }
LABEL_17:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_17;
  }
  if (qword_10002D7D0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000224A0();
  sub_100012A58(v3, (uint64_t)qword_10002E3E0);
  oslog = sub_100022490();
  os_log_type_t v4 = sub_100022610();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "buildSections is called more than once", v5, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10001F814(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t result = (uint64_t)[v1 isViewLoaded];
  if (result)
  {
    id v5 = *(id *)(sub_10002028C() + 32);
    swift_release();
    uint64_t v6 = (uint64_t)v5 + direct field offset for TTRIReminderTitleCellContent.titleModule;
    swift_beginAccess();
    sub_10000EAC0(v6, (uint64_t)&aBlock, &qword_10002E4A8);

    uint64_t v7 = aBlock;
    sub_10000EA64((uint64_t)&aBlock, &qword_10002E4A8);
    if (!v7)
    {
      id v8 = *(id *)(sub_10002028C() + 32);
      swift_release();
      sub_1000104D4((uint64_t)v2, (uint64_t)&off_100029610, v2, &aBlock);
      sub_100022090();
    }
    id v9 = *(id *)(sub_100020424() + 32);
    swift_release();
    uint64_t v10 = (uint64_t)v9 + qword_10002E538;
    swift_beginAccess();
    sub_10000EAC0(v10, (uint64_t)&aBlock, &qword_10002DCA8);

    uint64_t v11 = aBlock;
    sub_10000EA64((uint64_t)&aBlock, &qword_10002DCA8);
    if (!v11)
    {
      id v12 = *(id *)(sub_100020424() + 32);
      swift_release();
      sub_1000104E0((uint64_t)v2, (uint64_t)&off_100029600, v2, &aBlock);
      sub_100002BF8((uint64_t)&aBlock);
    }
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v13 = (void *)result;
    [(id)result setEnabled:*(unsigned __int8 *)(a1 + *(int *)(type metadata accessor for TTRIExtensionCreateReminderViewModel(0) + 20))];

    v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_isFirstUpdate] = 0;
    if (*(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_tableDataController])
    {
      __chkstk_darwin(v14);
      id v16 = v15;
      sub_100021EE0();
    }
    uint64_t v17 = *(void *)&v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_presenter];
    uint64_t v18 = *(void *)(v17
                    + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                    + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 72))(ObjectType, v18);
    if (result)
    {
      uint64_t v20 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_generatedSuggestionTextHasBeenSelected;
      if ((v2[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_generatedSuggestionTextHasBeenSelected] & 1) == 0
        && (*(unsigned char *)(v17 + 48) & 1) == 0)
      {
        uint64_t v21 = swift_allocObject();
        swift_unknownObjectWeakInit();
        swift_retain();
        id v22 = [v2 transitionCoordinator];
        if (v22)
        {
          uint64_t v23 = v22;
          if ([v22 isAnimated])
          {
            swift_release();
            uint64_t v24 = swift_allocObject();
            *(void *)(v24 + 16) = sub_100021794;
            *(void *)(v24 + 24) = v21;
            uint64_t v29 = sub_100016840;
            uint64_t v30 = v24;
            *(void *)&long long aBlock = _NSConcreteStackBlock;
            *((void *)&aBlock + 1) = 1107296256;
            uint64_t v27 = sub_100021244;
            uint64_t v28 = &unk_100029768;
            uint64_t v25 = _Block_copy(&aBlock);
            swift_retain();
            swift_release();
            [v23 animateAlongsideTransition:v25 completion:0];
            swift_release();
            _Block_release(v25);
            uint64_t result = swift_unknownObjectRelease();
LABEL_17:
            v2[v20] = 1;
            return result;
          }
          swift_unknownObjectRelease();
        }
        sub_10002117C();
        uint64_t result = swift_release_n();
        goto LABEL_17;
      }
    }
  }
  return result;
}

uint64_t sub_10001FC60(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1
                             + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_presenter)
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_inCellEditingPresenterHelper);
  uint64_t result = swift_beginAccess();
  if (*(void *)(v1 + 40))
  {
    uint64_t v3 = *(void *)(v1 + 48);
    uint64_t ObjectType = swift_getObjectType();
    id v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
    swift_unknownObjectRetain();
    v5(ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001FD4C(char a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, "viewWillAppear:", a1 & 1);
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    v5[3] = sub_10000E8D8(0, &qword_10002E4C8);
    v5[4] = &protocol witness table for UITableView;
    v5[0] = v4;
    sub_100022650();
    sub_1000132D0((uint64_t)v5);
    uint64_t result = sub_100021E90();
    if (*(void *)&v1[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver])
    {
      swift_retain();
      sub_100022190();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001FF20()
{
  v9.receiver = v0;
  v9.super_class = (Class)swift_getObjectType();
  uint64_t result = (uint64_t)objc_msgSendSuper2(&v9, "viewWillLayoutSubviews");
  if (*((unsigned char *)v0
       + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout) == 1)
  {
    *((unsigned char *)v0
    + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout) = 0;
    uint64_t v2 = self;
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v0;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_1000217EC;
    *(void *)(v4 + 24) = v3;
    v8[4] = sub_100016840;
    v8[5] = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_10001EBE8;
    v8[3] = &unk_1000297E0;
    id v5 = _Block_copy(v8);
    id v6 = v0;
    swift_retain();
    swift_release();
    [v2 performWithoutAnimation:v5];
    _Block_release(v5);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_10002028C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006B9C(&qword_10002E4B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell;
  if (*(void *)(v1
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell))
  {
    uint64_t v6 = *(void *)(v1
                   + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell);
  }
  else
  {
    v12._countAndFlagsBits = 0xD00000000000002CLL;
    v12._object = (void *)0x8000000100024A10;
    v11._countAndFlagsBits = 0x656C746954;
    v11._object = (void *)0xE500000000000000;
    sub_100021DF0(v11, v12);
    uint64_t v7 = sub_1000221D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
    id v8 = objc_allocWithZone((Class)sub_1000220C0());
    sub_100022080();
    sub_100006B9C(&qword_10002E4C0);
    swift_allocObject();
    uint64_t v6 = sub_100021D30();
    *(void *)(v1 + v5) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_100020424()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006B9C(&qword_10002DCA0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell;
  if (*(void *)(v1
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell))
  {
    uint64_t v6 = *(void *)(v1
                   + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell);
  }
  else
  {
    uint64_t ReminderNotesCellContentState = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(ReminderNotesCellContentState - 8) + 56))(v4, 1, 1, ReminderNotesCellContentState);
    id v8 = objc_allocWithZone((Class)type metadata accessor for TTRIExtensionCreateReminderNotesCellContent(0));
    sub_100002D50(0xD00000000000001CLL, 0x80000001000249F0, (uint64_t)v4);
    sub_100006B9C(&qword_10002E4B8);
    swift_allocObject();
    uint64_t v6 = sub_100021D30();
    *(void *)(v1 + v5) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_100020570()
{
  uint64_t v1 = OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell);
  }
  else
  {
    uint64_t v2 = sub_1000205D8();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_1000205D8()
{
  v8._object = (void *)0x8000000100024960;
  v6._countAndFlagsBits = 0x736C6961746544;
  v6._object = (void *)0xE700000000000000;
  v8._countAndFlagsBits = 0xD00000000000001ELL;
  sub_100021DF0(v6, v8);
  v9._countAndFlagsBits = 0xD000000000000028;
  v9._object = (void *)0x8000000100024980;
  v7._countAndFlagsBits = 0x7265646E696D6552;
  v7._object = (void *)0xE900000000000073;
  sub_100021DF0(v7, v9);
  sub_100021E20();
  id v0 = objc_allocWithZone((Class)sub_100022150());
  uint64_t v1 = (void *)sub_100022140();
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v3 = (void *)((char *)v1 + *(void *)((swift_isaMask & *v1) + 0x108));
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t *v3 = (uint64_t)sub_1000216CC;
  v3[1] = v2;
  sub_1000127EC(v4);
  sub_100006B9C(&qword_10002E4A0);
  swift_allocObject();
  return sub_100021D30();
}

void sub_1000207A8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    sub_100022640();
    [v1 resignFirstResponder];
    uint64_t v2 = *(void *)&v1[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_presenter];
    uint64_t v3 = *(void *)(v2
                   + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService36TTRIExtensionCreateReminderPresenter_interactor
                   + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    swift_retain();
    v5(ObjectType, v3);
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v2;
    *(unsigned char *)(v6 + 24) = 1;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 40) = 0;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = sub_100015254;
    *(void *)(v7 + 24) = v6;
    swift_retain();
    Swift::String v8 = (void *)sub_100022420();
    sub_100022430();

    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
}

void *sub_10002092C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100022790();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t result = (void *)sub_100021974(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = sub_100022740();
        unint64_t v7 = _swiftEmptyArrayStorage[2];
        unint64_t v6 = _swiftEmptyArrayStorage[3];
        if (v7 >= v6 >> 1) {
          sub_100021974(v6 > 1, v7 + 1, 1);
        }
        ++v4;
        _swiftEmptyArrayStorage[2] = v7 + 1;
        Swift::String v8 = (char *)&_swiftEmptyArrayStorage[2 * v7];
        *((void *)v8 + 4) = v5;
        *((void *)v8 + 5) = &protocol witness table for TTRITableSection;
      }
      while (v2 != v4);
    }
    else
    {
      Swift::String v9 = (uint64_t *)(a1 + 32);
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = 2 * v10;
      do
      {
        uint64_t v12 = *v9;
        unint64_t v13 = _swiftEmptyArrayStorage[3];
        swift_retain();
        if (v10 >= v13 >> 1) {
          sub_100021974(v13 > 1, v10 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v10 + 1;
        uint64_t v14 = (char *)&_swiftEmptyArrayStorage[v11];
        *((void *)v14 + 4) = v12;
        *((void *)v14 + 5) = &protocol witness table for TTRITableSection;
        v11 += 2;
        ++v9;
        ++v10;
        --v2;
      }
      while (v2);
    }
    return _swiftEmptyArrayStorage;
  }
  __break(1u);
  return result;
}

uint64_t sub_100020AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006B9C(&qword_10002DCA0);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006B9C(&qword_10002DFE8);
  __chkstk_darwin(v7 - 8);
  Swift::String v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  uint64_t v45 = *(void *)(ReminderView - 8);
  uint64_t v46 = ReminderView;
  __chkstk_darwin(ReminderView);
  uint64_t v44 = (uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006B9C(&qword_10002DB48);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100021FC0();
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100006B9C(&qword_10002E4B0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = a1;
  id v21 = *(id *)(sub_10002028C() + 32);
  swift_release();
  sub_100013334(a2, (uint64_t)v17);
  uint64_t ReminderViewModel = (int *)type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  uint64_t v23 = *(void **)(a2 + ReminderViewModel[6]);
  uint64_t v48 = ReminderViewModel[9];
  sub_1000221C0();
  uint64_t v24 = sub_1000221D0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v20, 0, 1, v24);
  swift_bridgeObjectRetain();
  id v25 = v23;
  sub_100021E50();

  uint64_t ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(ReminderNotesCellContent - 8) + 56);
  v27(v14, 1, 1, ReminderNotesCellContent);
  uint64_t v28 = a2 + ReminderViewModel[11];
  int v29 = *(unsigned __int8 *)(v28 + 8);
  if (v29 == 255)
  {
    sub_10000EAC0(a2 + ReminderViewModel[10], (uint64_t)v9, &qword_10002DFE8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v9, 1, v46) == 1)
    {
      sub_10000EA64((uint64_t)v9, &qword_10002DFE8);
    }
    else
    {
      sub_10000EA64((uint64_t)v14, &qword_10002DB48);
      uint64_t v33 = (uint64_t)v9;
      uint64_t v34 = v44;
      sub_1000218B0(v33, v44, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
      sub_1000218B0(v34, (uint64_t)v14, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
      swift_storeEnumTagMultiPayload();
      v27(v14, 0, 1, ReminderNotesCellContent);
    }
  }
  else
  {
    id v30 = *(id *)v28;
    char v31 = v29 & 1;
    id v32 = *(id *)v28;
    sub_10000EA64((uint64_t)v14, &qword_10002DB48);
    *(void *)uint64_t v14 = v30;
    v14[8] = v31;
    swift_storeEnumTagMultiPayload();
    v27(v14, 0, 1, ReminderNotesCellContent);
  }
  id v35 = *(id *)(sub_100020424() + 32);
  swift_release();
  sub_100013334(a2, (uint64_t)v6);
  uint64_t v36 = ReminderViewModel[8];
  uint64_t v37 = *(void **)(a2 + ReminderViewModel[7]);
  char v38 = *(unsigned char *)(a2 + v36);
  uint64_t v39 = *(void *)(a2 + v48);
  uint64_t ReminderNotesCellContentState = (int *)type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  sub_10000EAC0((uint64_t)v14, (uint64_t)&v6[ReminderNotesCellContentState[8]], &qword_10002DB48);
  *(void *)&v6[ReminderNotesCellContentState[5]] = v37;
  v6[ReminderNotesCellContentState[6]] = v38;
  *(void *)&v6[ReminderNotesCellContentState[7]] = v39;
  (*(void (**)(char *, void, uint64_t, int *))(*((void *)ReminderNotesCellContentState - 1) + 56))(v6, 0, 1, ReminderNotesCellContentState);
  swift_bridgeObjectRetain();
  id v41 = v37;
  sub_100021E50();

  return sub_10000EA64((uint64_t)v14, &qword_10002DB48);
}

void sub_100021008()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    [Strong performBatchUpdates:0 completion:0];
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderViewController()
{
  return self;
}

void sub_10002117C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    uint64_t v2 = sub_10002028C();

    id v3 = *(id *)(v2 + 32);
    swift_release();
    sub_1000220A0();
  }
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectWeakLoadStrong();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = sub_10002028C();

    id v7 = *(id *)(v6 + 32);
    swift_release();
    sub_1000220B0();
  }
}

uint64_t sub_100021244(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_1000212A4()
{
  if (!*(void *)(v0
                  + OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_tableDataController))
  {
    if (qword_10002D7D0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1000224A0();
    sub_100012A58(v1, (uint64_t)qword_10002E3E0);
    uint64_t v2 = sub_100022490();
    os_log_type_t v3 = sub_100022610();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "buildSections hasn't been called when update(listName:)", v4, 2u);
      swift_slowDealloc();
    }
  }
  id v5 = *(id *)(sub_100020570() + 32);
  swift_release();
  v8._object = (void *)0x8000000100024960;
  v7._countAndFlagsBits = 0x736C6961746544;
  v7._object = (void *)0xE700000000000000;
  v8._countAndFlagsBits = 0xD00000000000001ELL;
  sub_100021DF0(v7, v8);
  swift_bridgeObjectRetain();
  sub_100021E20();
  sub_100021E50();

  sub_100020570();
  sub_100021D20(0);
  return swift_release();
}

uint64_t sub_10002149C()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000214C8(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();

  return TTRKeyboardAvoidance<>.shouldAvoidKeyboard.getter(ObjectType, a2);
}

uint64_t sub_100021504()
{
  swift_getObjectType();

  return sub_100021E90();
}

uint64_t sub_100021540()
{
  swift_getObjectType();

  return sub_100021E80();
}

uint64_t sub_10002157C(double a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  v8.n128_f64[0] = a1;
  v9.n128_f64[0] = a2;

  return TTRKeyboardAvoidance<>.setKeyboardAvoidanceBottomInset(_:duration:)(ObjectType, a4, v8, v9);
}

uint64_t sub_1000215D0()
{
  return 1;
}

void sub_1000215DC()
{
  v0._object = (void *)0x8000000100023F10;
  v0._countAndFlagsBits = 0xD000000000000011;
  sub_100021DB0(v0);
}

void sub_10002162C()
{
  v0[OBJC_IVAR____TtC51com_apple_ReminderKitUI_ReminderCreationViewService41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout] = 1;
  id v1 = [v0 viewIfLoaded];
  [v1 setNeedsLayout];
}

uint64_t sub_100021694()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000216CC()
{
}

uint64_t sub_1000216D4()
{
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002171C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100021754(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_10002178C()
{
  return sub_100020AD0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100021794()
{
}

uint64_t sub_10002179C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000217AC()
{
  return swift_release();
}

uint64_t sub_1000217B4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000217EC()
{
}

uint64_t sub_1000217F4()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_100021804()
{
  unint64_t result = qword_10002E4F8;
  if (!qword_10002E4F8)
  {
    sub_10000E8D8(255, &qword_10002E4E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E4F8);
  }
  return result;
}

uint64_t sub_10002186C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000E970(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000218B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100021918(uint64_t a1)
{
  uint64_t ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(ReminderViewModel - 8) + 8))(a1, ReminderViewModel);
  return a1;
}

uint64_t sub_100021974(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100021994(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100021994(char a1, int64_t a2, char a3, void *a4)
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
    sub_100006B9C(&qword_10002E510);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_100006B9C(&qword_10002E518);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000227B0();
  __break(1u);
  return result;
}

_OWORD *initializeBufferWithCopyOfBuffer for TTRIExtensionCreateReminderViewController.Argument(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for TTRIExtensionCreateReminderViewController.Argument()
{
  return swift_unknownObjectRelease();
}

void *assignWithCopy for TTRIExtensionCreateReminderViewController.Argument(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v3;
  return a1;
}

_OWORD *assignWithTake for TTRIExtensionCreateReminderViewController.Argument(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIExtensionCreateReminderViewController.Argument(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIExtensionCreateReminderViewController.Argument(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRIExtensionCreateReminderViewController.Argument()
{
  return &type metadata for TTRIExtensionCreateReminderViewController.Argument;
}

uint64_t sub_100021C80()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100021C90()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_100021CA0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021CB0()
{
  return type metadata accessor for URL();
}

NSData sub_100021CC0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100021CD0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021CE0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100021CF0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100021D00()
{
  return UUID.init()();
}

uint64_t sub_100021D10()
{
  return type metadata accessor for UUID();
}

BOOL sub_100021D20(Swift::Bool force)
{
  return TTRITableCell.updateAssignedCellIfNeeded(force:)(force);
}

uint64_t sub_100021D30()
{
  return TTRITableCell.init(_:)();
}

uint64_t sub_100021D40()
{
  return TTRSectionLite.init(sectionType:)();
}

uint64_t sub_100021D50()
{
  return TTRAccesibility.SharingExtension.ID.ShareTable.unsafeMutableAddressor();
}

uint64_t sub_100021D60()
{
  return TTRUserDefaults.appUserDefaults.unsafeMutableAddressor();
}

uint64_t sub_100021D70()
{
  return TTRUserDefaults.activitySessionId.getter();
}

uint64_t sub_100021D80()
{
  return TTRUserDefaults.activitySessionBeginTime.getter();
}

uint64_t sub_100021D90()
{
  return TTRITableSection.init(header:footer:items:)();
}

uint64_t sub_100021DA0()
{
  return type metadata accessor for TTRITableSection();
}

void sub_100021DB0(Swift::String reason)
{
}

uint64_t sub_100021DC0()
{
  return TTRDeferredAction.init(queue:)();
}

uint64_t sub_100021DD0()
{
  return type metadata accessor for TTRDeferredAction();
}

uint64_t sub_100021DE0(Swift::String _, Swift::String value, Swift::String comment)
{
  return TTRLocalizedString(_:value:comment:)(_, value, comment)._countAndFlagsBits;
}

uint64_t sub_100021DF0(Swift::String _, Swift::String comment)
{
  return TTRLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_100021E00()
{
  return static TTRTypedController<>.instantiateFromStoryboard(with:)();
}

uint64_t sub_100021E10()
{
  return static TTRTypedController.currentArgument.getter();
}

uint64_t sub_100021E20()
{
  return TTRIDetailCellState.init(icon:title:titleTextColor:subtitle:detailText:detailTextColor:shortenedDetailText:checkmarkState:accessibilityLabel:accessibilityValue:accessibilityHint:accessibilityDifferentiateWithoutColorsIcon:)();
}

uint64_t sub_100021E30()
{
  return TTRITableCellContent.setStateWithoutUpdatingCell(_:)();
}

uint64_t sub_100021E40()
{
  return TTRITableCellContent.init(state:prototypeCellView:reuseIdentifier:)();
}

uint64_t sub_100021E50()
{
  return TTRITableCellContent.state.setter();
}

uint64_t sub_100021E80()
{
  return TTRKeyboardAvoidance<>.stopAvoidingKeyboard()();
}

uint64_t sub_100021E90()
{
  return TTRKeyboardAvoidance<>.startAvoidingKeyboard()();
}

uint64_t sub_100021EA0()
{
  return type metadata accessor for TTRRemindersListTips();
}

uint64_t sub_100021EB0()
{
  return static TTRLocalizableStrings.Common.alertOKButton.getter();
}

uint64_t sub_100021EC0()
{
  return TTRThumbnailGenerator.init(queue:backgroundQueue:)();
}

uint64_t sub_100021ED0()
{
  return type metadata accessor for TTRThumbnailGenerator();
}

uint64_t sub_100021EE0()
{
  return TTRITableDataController.performBatchUpdates(by:updates:)();
}

uint64_t sub_100021EF0()
{
  return TTRITableDataController.init(tableView:sections:rowInsertionAnimationType:collapseSectionIfItemsAreHidden:)();
}

uint64_t sub_100021F00()
{
  return type metadata accessor for TTRITableDataController();
}

uint64_t sub_100021F10()
{
  return TTRListOrCustomSmartList.displayName.getter();
}

uint64_t sub_100021F20()
{
  return TTRReminderDetailSubject.init(reminderChangeItem:)();
}

uint64_t sub_100021F30()
{
  return TTRURLMetadataInteractor.init()();
}

uint64_t sub_100021F40()
{
  return type metadata accessor for TTRURLMetadataInteractor();
}

uint64_t sub_100021F50()
{
  return TTRIReminderTitleTextView.init(isForUseInNUIContainerView:lineIndexWhereClippingBegins:hashtagTokenEditingBehavior:)();
}

uint64_t sub_100021F60()
{
  return type metadata accessor for TTRIReminderTitleTextView();
}

uint64_t sub_100021F70()
{
  return type metadata accessor for TTRRemindersListViewModel.ReminderID();
}

uint64_t sub_100021F80()
{
  return type metadata accessor for TTRRemindersListViewModel.HashtagsState();
}

uint64_t sub_100021F90()
{
  return type metadata accessor for TTRRemindersListViewModel.SectionHeader();
}

uint64_t sub_100021FA0()
{
  return type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState();
}

uint64_t sub_100021FB0()
{
  return TTRRemindersListViewModel.Item.treeItemIdentifier.getter();
}

uint64_t sub_100021FC0()
{
  return type metadata accessor for TTRRemindersListViewModel.Item();
}

uint64_t sub_100021FD0()
{
  return static TTRRemindersListViewModel.ItemID.__derived_enum_equals(_:_:)();
}

uint64_t sub_100021FE0()
{
  return type metadata accessor for TTRRemindersListViewModel.ItemID();
}

uint64_t sub_100021FF0()
{
  return type metadata accessor for TTRRemindersListViewModel.SectionID();
}

uint64_t sub_100022000()
{
  return type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay();
}

uint64_t sub_100022010()
{
  return type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription();
}

uint64_t sub_100022020()
{
  return type metadata accessor for TTRTemplatePublicLinkData();
}

uint64_t sub_100022030()
{
  return static TTRIReminderDetailAssembly.createViewController(subject:delegate:style:savesOnCommit:itemCount:pendingMoveContext:ttrSectionLite:manualOrdering:)();
}

uint64_t sub_100022040()
{
  return type metadata accessor for TTRIReminderDetailAssembly();
}

uint64_t sub_100022050()
{
  return static TTRReminderDetailViewModel.defaultItem(withReminderID:)();
}

uint64_t sub_100022060()
{
  return TTRExtensionContextExtractor.init(userActivityProvider:)();
}

uint64_t sub_100022070()
{
  return type metadata accessor for TTRExtensionContextExtractor();
}

uint64_t sub_100022080()
{
  return TTRIReminderTitleCellContent.init(placeholder:accessibilityIdentifier:state:)();
}

uint64_t sub_100022090()
{
  return TTRIReminderTitleCellContent.titleModule.setter();
}

void sub_1000220A0()
{
}

void sub_1000220B0()
{
}

uint64_t sub_1000220C0()
{
  return type metadata accessor for TTRIReminderTitleCellContent();
}

uint64_t sub_1000220D0()
{
  return static TTRIReminderCellNotesAssembly.createViewController(item:isSingleReminderEditingMode:quickBar:ownerModule:hostViewController:inCellPresenterManager:moduleDelegate:)();
}

uint64_t sub_1000220E0()
{
  return static TTRIReminderCellTitleAssembly.createViewController(item:titleAttributesInteractor:quickBar:augmentationSplitter:ownerModule:hostViewController:inCellPresenterManager:isSingleReminderEditingMode:returnKeyType:moduleDelegate:)();
}

uint64_t sub_1000220F0()
{
  return TTRAttachmentThumbnailsManager.thumbnails(for:scale:)();
}

uint64_t sub_100022100()
{
  return TTRAttachmentThumbnailsManager.init(thumbnailSizeProvider:thumbnailGenerator:)();
}

uint64_t sub_100022110()
{
  return type metadata accessor for TTRAttachmentThumbnailsManager();
}

uint64_t sub_100022120()
{
  return TTRIReminderCellNotesViewModel.init(item:allowsEditing:notes:baseTextStyles:inlineHashtagVisibility:supportsStyling:)();
}

uint64_t sub_100022130()
{
  return type metadata accessor for TTRIReminderCellNotesViewModel();
}

uint64_t sub_100022140()
{
  return TTRIDetailDisclosureCellContent.init(state:)();
}

uint64_t sub_100022150()
{
  return type metadata accessor for TTRIDetailDisclosureCellContent();
}

uint64_t sub_100022160()
{
  return type metadata accessor for TTRAutoCompleteReminderListScope();
}

uint64_t sub_100022170()
{
  return TTRICurrentTextInputModeObserver.currentTextInputMode.getter();
}

void sub_100022180()
{
}

void sub_100022190()
{
}

uint64_t sub_1000221A0()
{
  return TTRICurrentTextInputModeObserver.init()();
}

uint64_t sub_1000221B0()
{
  return type metadata accessor for TTRICurrentTextInputModeObserver();
}

uint64_t sub_1000221C0()
{
  return TTRIReminderTitleCellContentState.init(item:attributedTitle:hashtagVisibility:)();
}

uint64_t sub_1000221D0()
{
  return type metadata accessor for TTRIReminderTitleCellContentState();
}

uint64_t sub_1000221E0()
{
  return TTRAttachmentThumbnailSizeProvider.init(boundingSize:contentMode:)();
}

uint64_t sub_1000221F0()
{
  return type metadata accessor for TTRAttachmentThumbnailSizeProvider();
}

uint64_t sub_100022200()
{
  return type metadata accessor for TTRExtensionContextExtractorResult();
}

uint64_t sub_100022210()
{
  return TTRReminderStandaloneEditingSession.init(item:acquirerName:reminderChangeItem:attributeEditor:pendingMoveTargetListValue:setPendingMoveTargetList:sharedPropertiesWrapper:setNeedsDisplayHandler:)();
}

uint64_t sub_100022220()
{
  return type metadata accessor for TTRReminderStandaloneEditingSession();
}

uint64_t sub_100022230()
{
  return TTRExtensionCreateReminderInteractor.init(store:reminderID:extractorResult:undoManager:urlMetadataInteractor:)();
}

uint64_t sub_100022240()
{
  return type metadata accessor for TTRExtensionCreateReminderInteractor();
}

uint64_t sub_100022250()
{
  return TTRIRemindersListReminderCellLinkView.init(url:attachmentID:)();
}

uint64_t sub_100022260()
{
  return type metadata accessor for TTRIRemindersListReminderCellLinkView();
}

uint64_t sub_100022270()
{
  return static TTRReminderCellInlineHashtagVisibility.__derived_enum_equals(_:_:)();
}

uint64_t sub_100022280()
{
  return TTRReminderViewModelComputedProperties.init(reminder:postProcessingOperations:)();
}

uint64_t sub_100022290()
{
  return TTRInCellEditingPresenterManagingHelper.nonReminderInCellEditingPresenterDidFinishEditing(_:)();
}

uint64_t sub_1000222A0()
{
  return TTRInCellEditingPresenterManagingHelper.nonReminderInCellEditingPresenterWillBeginEditing(_:)();
}

uint64_t sub_1000222B0()
{
  return TTRInCellEditingPresenterManagingHelper.inCellEditingPresenterDidFinishEditing(_:editingSession:)();
}

uint64_t sub_1000222C0()
{
  return TTRInCellEditingPresenterManagingHelper.inCellEditingPresenterWillBeginEditing(_:)();
}

uint64_t sub_1000222D0()
{
  return TTRInCellEditingPresenterManagingHelper.init(reminderEditingComponents:)();
}

uint64_t sub_1000222E0()
{
  return type metadata accessor for TTRInCellEditingPresenterManagingHelper();
}

uint64_t sub_1000222F0()
{
  return TTRReminderTitleAttributesNoOpInteractor.init()();
}

uint64_t sub_100022300()
{
  return type metadata accessor for TTRReminderTitleAttributesNoOpInteractor();
}

uint64_t sub_100022310()
{
  return TTRRemindersListEditingSessionDisplayTargets.reminderEditingComponents.unsafeMutableAddressor();
}

uint64_t sub_100022320()
{
  return TTRRemindersListEditingSessionDisplayTargets.cell.unsafeMutableAddressor();
}

uint64_t sub_100022330()
{
  return TTRRemindersListEditingSessionPropertiesSharingWrapper.init()();
}

uint64_t sub_100022340()
{
  return type metadata accessor for TTRRemindersListEditingSessionPropertiesSharingWrapper();
}

uint64_t sub_100022350()
{
  return static REMFeatureFlags.isAppleAccountBrandingEnabled()();
}

uint64_t sub_100022360()
{
  return static REM_os_activity.labelUserAction(_:dso:)();
}

uint64_t sub_100022370()
{
  return static RDIDispatchQueue.storeQueue.getter();
}

uint64_t sub_100022380()
{
  return static RDIDispatchQueue.utilityQueue.getter();
}

uint64_t sub_100022390()
{
  return type metadata accessor for RDIDispatchQueue();
}

uint64_t sub_1000223A0()
{
  return type metadata accessor for REMUserOperation();
}

uint64_t sub_1000223B0()
{
  return type metadata accessor for REMAnalyticsEvent();
}

uint64_t sub_1000223C0()
{
  return REMAnalyticsManager.post(event:)();
}

uint64_t sub_1000223D0()
{
  return static REMAnalyticsManager.shared.getter();
}

uint64_t sub_1000223E0()
{
  return type metadata accessor for REMAnalyticsManager();
}

uint64_t sub_1000223F0()
{
  return type metadata accessor for REMApplicationIconFormat();
}

uint64_t sub_100022400()
{
  return type metadata accessor for REMHashtagLabelSpecifier();
}

uint64_t sub_100022410()
{
  return type metadata accessor for REMRemindersListDataView.SectionLite.SectionType();
}

uint64_t sub_100022420()
{
  return zalgo.getter();
}

uint64_t sub_100022430()
{
  return dispatch thunk of Promise.then<A>(on:closure:)();
}

uint64_t sub_100022440()
{
  return firstly<A>(on:closure:)();
}

uint64_t sub_100022450()
{
  return static Analytics.postEvent(_:payload:duration:)();
}

uint64_t sub_100022460()
{
  return type metadata accessor for Analytics();
}

uint64_t sub_100022470()
{
  return static AppIntentsServicesRefresher.sendNotificationIfNeeded()();
}

uint64_t sub_100022480()
{
  return type metadata accessor for AppIntentsServicesRefresher();
}

uint64_t sub_100022490()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000224A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000224B0()
{
  return Logger.init(_:)();
}

uint64_t sub_1000224C0()
{
  return type metadata accessor for AnyTip();
}

uint64_t sub_1000224D0()
{
  return Publisher.sink<A>(weakTarget:receiveValue:receiveCompletion:)();
}

uint64_t sub_1000224E0()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_1000224F0()
{
  return Dictionary.description.getter();
}

NSString sub_100022500()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100022510()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

unint64_t sub_100022520()
{
  return (unint64_t)String.validatedReminderTitle()();
}

uint64_t sub_100022530()
{
  return String.hash(into:)();
}

void sub_100022540(Swift::String a1)
{
}

Swift::Int sub_100022550()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100022560()
{
  return Sequence.removingNils<A>()();
}

NSArray sub_100022570()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100022580()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100022590()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000225B0()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000225C0()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000225D0()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_1000225F0()
{
}

uint64_t sub_100022600()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100022610()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100022620()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100022630()
{
  return REMUserActivity.platformAppIconAndName(format:scale:)();
}

void sub_100022640()
{
}

uint64_t sub_100022650()
{
  return UIViewController.deselectRowsAlongsideTransition(for:animated:)();
}

uint64_t sub_100022660()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100022670()
{
  return CGSize.nuiUseDefault.unsafeMutableAddressor();
}

uint64_t sub_100022680()
{
  return static UIFont.roundedBodyFont.getter();
}

uint64_t sub_100022690()
{
  return static UIView.setContentPriorities(_:for:)();
}

uint64_t sub_1000226A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000226B0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_1000226C0()
{
  return Optional.descriptionOrNil.getter();
}

uint64_t sub_1000226D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000226E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000226F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100022700()
{
  return _bridgeAnyObjectToAny(_:)();
}

void sub_100022710(Swift::Int a1)
{
}

uint64_t sub_100022720()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100022730()
{
  return StaticString.description.getter();
}

uint64_t sub_100022740()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100022750()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100022760()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100022770()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100022780()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100022790()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000227A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000227B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000227C0()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_1000227D0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000227F0()
{
  return Hasher.init(_seed:)();
}

void sub_100022800(Swift::UInt32 a1)
{
}

Swift::Int sub_100022810()
{
  return Hasher._finalize()();
}

uint64_t sub_100022820()
{
  return _typeName(_:qualified:)();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t rdi_os_crash()
{
  return _rdi_os_crash();
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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