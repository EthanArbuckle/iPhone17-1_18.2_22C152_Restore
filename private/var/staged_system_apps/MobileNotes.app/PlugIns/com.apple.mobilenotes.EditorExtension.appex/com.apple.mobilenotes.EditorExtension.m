id sub_100003900()
{
  void *v0;
  uint64_t ObjCClassFromMetadata;
  uint64_t v2;
  uint64_t vars8;

  v0 = self;
  sub_10000CD78(0, &qword_100015160);
  [v0 registerTextAttachmentClass:swift_getObjCClassFromMetadata() forFileType:PKAppleDrawingTypeIdentifier];
  sub_10000CD78(0, &qword_100015168);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = PKApplePaperTypeIdentifier;

  return [v0 registerTextAttachmentClass:ObjCClassFromMetadata forFileType:v2];
}

uint64_t sub_1000039AC()
{
  uint64_t v0 = sub_10000D140();
  sub_10000C5D0(v0, qword_100014E30);
  sub_10000C4E8(v0, (uint64_t)qword_100014E30);
  return sub_10000D130();
}

void sub_100003A34()
{
  sub_10000CD78(0, &qword_100015170);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v1 = (const char *)sub_10000D110();
  Method InstanceMethod = class_getInstanceMethod(ObjCClassFromMetadata, v1);
  if (InstanceMethod
    && (v3 = InstanceMethod,
        (v4 = class_getInstanceMethod(ObjCClassFromMetadata, "my_openURL:originatingView:options:completionHandler:")) != 0))
  {
    method_exchangeImplementations(v3, v4);
  }
  else
  {
    if (qword_100014E28 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10000D140();
    sub_10000C4E8(v5, (uint64_t)qword_100014E30);
    oslog = sub_10000D120();
    os_log_type_t v6 = sub_10000D2A0();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Failed to get method: -[UIApplication _openURL:originatingView:options:completionHandler:]", v7, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100003BA8(uint64_t a1, uint64_t a2)
{
  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

char *sub_100003D60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR___ICEditorExtensionViewController_analyticsController;
  v7 = self;
  v8 = v3;
  *(void *)&v3[v6] = [v7 sharedController];
  *(void *)&v8[OBJC_IVAR___ICEditorExtensionViewController_noteEditor] = 0;
  v8[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] = 0;
  v8[OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor] = 0;
  *(void *)&v8[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem] = 0;
  *(void *)&v8[OBJC_IVAR___ICEditorExtensionViewController_imageData] = &_swiftEmptyArrayStorage;
  *(void *)&v8[OBJC_IVAR___ICEditorExtensionViewController_webURLs] = &_swiftEmptyArrayStorage;
  *(void *)&v8[OBJC_IVAR___ICEditorExtensionViewController_hostConnection] = 0;
  v8[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 0;
  v9 = &v8[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier];
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  *(void *)&v8[OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator] = 0;

  if (a2)
  {
    NSString v10 = sub_10000D1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v16.receiver = v8;
  v16.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  v11 = [super initWithNibName:v10 bundle:a3];

  v12 = *(void **)&v11[OBJC_IVAR___ICEditorExtensionViewController_analyticsController];
  v13 = v11;
  id v14 = v12;
  [v14 startAppSession];

  return v13;
}

char *sub_100003F4C(void *a1)
{
  uint64_t v3 = OBJC_IVAR___ICEditorExtensionViewController_analyticsController;
  v4 = self;
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 sharedController];
  *(void *)&v5[OBJC_IVAR___ICEditorExtensionViewController_noteEditor] = 0;
  v5[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] = 0;
  v5[OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor] = 0;
  *(void *)&v5[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem] = 0;
  *(void *)&v5[OBJC_IVAR___ICEditorExtensionViewController_imageData] = &_swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR___ICEditorExtensionViewController_webURLs] = &_swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR___ICEditorExtensionViewController_hostConnection] = 0;
  v5[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 0;
  uint64_t v6 = &v5[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v5[OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator] = 0;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  v7 = [super initWithCoder:a1];
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)&v7[OBJC_IVAR___ICEditorExtensionViewController_analyticsController];
    NSString v10 = v7;
    id v11 = v9;
    [v11 startAppSession];
  }
  return v8;
}

id sub_1000040C8()
{
  [*(id *)&v0[OBJC_IVAR___ICEditorExtensionViewController_analyticsController] appSessionDidTerminate];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  return [super dealloc];
}

void sub_100004224()
{
  v1 = v0;
  sub_10000C2EC(&qword_1000150F8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&aBlock[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C2EC(&qword_100015140);
  __chkstk_darwin();
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for EditorExtensionViewController();
  v86.receiver = v0;
  v86.super_class = v6;
  [super viewDidLoad];
  sub_10000D2F0();
  v7 = (char *)sub_10000D2E0();
  v8 = &v7[direct field offset for ICModelAvailabilityManager.generalASRAvailabilityWasGenerated];
  swift_beginAccess();
  LOBYTE(v8) = *v8;

  if ((v8 & 1) == 0)
  {
    sub_10000D250();
    uint64_t v9 = sub_10000D270();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 0, 1, v9);
    sub_10000D240();
    uint64_t v10 = sub_10000D230();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = &protocol witness table for MainActor;
    sub_10000502C((uint64_t)v5, (uint64_t)&unk_100015150, v11);
    swift_release();
  }
  v12 = self;
  NSString v13 = sub_10000D1C0();
  [v12 setCurrentAttributionKey:0 andApp:v13];

  if (qword_100014E48 != -1) {
    swift_once();
  }
  id v14 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_analyticsController];
  if (v14)
  {
    sub_10000D1D0();
    sub_10000D090();
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_10000D0A0();
    uint64_t v16 = *(void *)(v15 - 8);
    v18 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v3, 1, v15) != 1)
    {
      sub_10000D060(v17);
      v18 = v19;
      (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v15);
    }
    [v14 startSessionWithReferralURL:v18 referralApplication:0 startingSessionType:1];
  }
  v20 = self;
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10000CCDC;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005380;
  aBlock[3] = &unk_100010B68;
  v22 = _Block_copy(aBlock);
  swift_release();
  [v20 setOpenURLHandler:v22];
  _Block_release(v22);
  if (qword_100014E20 != -1) {
    swift_once();
  }
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v24 = (Class *)ICTK2NoteEditorViewController_ptr;
  if (!IsTextKit2Enabled) {
    v24 = (Class *)ICNoteEditorViewController_ptr;
  }
  id v25 = [objc_allocWithZone(*v24) initWithIdentifier:-1 options:3];
  uint64_t v26 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  v27 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  *(void *)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor] = v25;

  v28 = *(void **)&v1[v26];
  if (!v28) {
    goto LABEL_58;
  }
  [v28 setDelegate:v1];
  v29 = *(void **)&v1[v26];
  if (!v29)
  {
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (*(void *)&v1[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier + 8])
  {
    id v30 = v29;
    swift_bridgeObjectRetain();
    NSString v31 = sub_10000D1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v32 = v29;
    NSString v31 = 0;
  }
  [v29 setHostBundleIdentifier:v31];

  v33 = *(void **)&v1[v26];
  if (!v33) {
    goto LABEL_60;
  }
  [v33 setCanShowLinkBar:(v1[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] & 1) == 0];
  uint64_t v34 = *(void *)&v1[v26];
  if (!v34)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  v35 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v34];
  [v1 addChildViewController:v35];
  id v36 = [v35 view];
  if (!v36)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  v37 = v36;
  id v38 = [v1 view];
  if (!v38)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v39 = v38;
  [v38 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;

  [v37 setFrame:v41, v43, v45, v47];
  id v48 = [v35 view];
  if (!v48)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  v49 = v48;
  [v48 setTranslatesAutoresizingMaskIntoConstraints:1];

  id v50 = [v35 view];
  if (!v50)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  v51 = v50;
  [v50 setAutoresizingMask:18];

  id v52 = [v1 view];
  if (!v52)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v53 = v52;
  id v54 = [v35 view];
  if (!v54)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v55 = v54;
  [v53 addSubview:v54];

  [v35 didMoveToParentViewController:v1];
  v56 = self;
  [v56 startSharedContextWithOptions:546];
  v57 = [v56 sharedContext];
  if (!v57)
  {
    if (qword_100014E28 != -1) {
      swift_once();
    }
    uint64_t v73 = sub_10000D140();
    sub_10000C4E8(v73, (uint64_t)qword_100014E30);
    v74 = sub_10000D120();
    os_log_type_t v75 = sub_10000D2B0();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "No note context; preparing to show alert", v76, 2u);
      swift_slowDealloc();
      v77 = v35;
    }
    else
    {
      v77 = v74;
      v74 = v35;
    }

    goto LABEL_55;
  }
  v58 = v57;
  [v57 addOrDeleteLocalAccountIfNecessary];
  v59 = [v58 managedObjectContext];
  v60 = self;
  if (![v60 hasModernAccountInContext:v59])
  {
LABEL_49:
    if (qword_100014E28 != -1) {
      swift_once();
    }
    uint64_t v79 = sub_10000D140();
    sub_10000C4E8(v79, (uint64_t)qword_100014E30);
    v80 = sub_10000D120();
    os_log_type_t v81 = sub_10000D2B0();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v82 = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "No modern account; preparing to show alert", v82, 2u);
      swift_slowDealloc();
      v83 = v35;
    }
    else
    {
      v83 = v80;
      v80 = v58;
      v58 = v59;
      v59 = v35;
    }

LABEL_55:
    v1[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] = 1;
    return;
  }
  id v61 = [v60 defaultAccountInContext:v59];
  if (v61) {
    goto LABEL_35;
  }
  id v62 = [v60 allActiveAccountsInContext:v59];
  sub_10000CD78(0, &qword_100015158);
  unint64_t v63 = sub_10000D210();

  if (!(v63 >> 62))
  {
    if (*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_31;
    }
    goto LABEL_48;
  }
  swift_bridgeObjectRetain();
  uint64_t v78 = sub_10000D3B0();
  swift_bridgeObjectRelease();
  if (!v78)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
LABEL_31:
  if ((v63 & 0xC000000000000001) != 0)
  {
    id v64 = (id)sub_10000D380();
    goto LABEL_34;
  }
  if (!*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v64 = *(id *)(v63 + 32);
LABEL_34:
  id v61 = v64;
  swift_bridgeObjectRelease();
LABEL_35:
  v65 = self;
  id v66 = [v61 defaultFolder];
  id v67 = [v65 newEmptyNoteInFolder:v66];

  [v67 markAsSystemPaperIfNeeded:1];
  [v59 ic_save];
  v68 = *(void **)&v1[v26];
  if (!v68)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  [v68 setNote:v67];
  v69 = *(void **)&v1[v26];
  if (!v69)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  [v69 startEditing];
  v70 = *(void **)&v1[v26];
  if (!v70)
  {
LABEL_70:
    __break(1u);
    return;
  }
  id v71 = [v70 eventReporter];
  if (v71)
  {
    v72 = v71;
    [v71 submitNoteCreateEventForModernNote:v67 createApproach:18];
  }
}

uint64_t sub_100004D18()
{
  sub_10000D240();
  v0[15] = sub_10000D230();
  uint64_t v2 = sub_10000D220();
  v0[16] = v2;
  v0[17] = v1;
  return _swift_task_switch(sub_100004DAC, v2, v1);
}

uint64_t sub_100004DAC()
{
  sub_10000D2F0();
  uint64_t v1 = (void *)sub_10000D2E0();
  v0[18] = v1;
  v0[2] = v0;
  v0[3] = sub_100004EB4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100005024;
  v0[13] = &unk_100010C30;
  v0[14] = v2;
  [v1 determineASRAvailability:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100004EB4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  uint64_t v2 = *(void *)(*(void *)v0 + 128);
  return _swift_task_switch(sub_100004FBC, v2, v1);
}

uint64_t sub_100004FBC()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100005024(uint64_t a1)
{
  return _swift_continuation_resume(*(void *)(a1 + 32));
}

uint64_t sub_10000502C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000D270();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000D260();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000CDB4(a1, &qword_100015140);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000D220();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1000051D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    uint64_t v7 = *(void **)(Strong + OBJC_IVAR___ICEditorExtensionViewController_hostConnection);
    if (v7
      && (id v8 = [v7 remoteObjectProxy],
          sub_10000D320(),
          swift_unknownObjectRelease(),
          sub_10000C2EC(&qword_1000150B0),
          (swift_dynamicCast() & 1) != 0))
    {
      uint64_t v9 = (void *)v15[6];

      sub_10000D060(v10);
      v12 = v11;
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = a2;
      *(void *)(v13 + 24) = a3;
      v15[4] = sub_10000CD34;
      v15[5] = v13;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 1107296256;
      v15[2] = sub_100003BA8;
      v15[3] = &unk_100010BE0;
      id v14 = _Block_copy(v15);
      sub_10000CD68(a2);
      swift_release();
      [v9 openURL:v12 completion:v14];
      swift_unknownObjectRelease();
      _Block_release(v14);
    }
    else
    {
    }
  }
}

uint64_t sub_100005380(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v5 = sub_10000D0A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *, uint64_t))(a1 + 32);
  sub_10000D070();
  uint64_t v10 = _Block_copy(a3);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    uint64_t v10 = sub_10000CF50;
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_retain();
  v9(v8, v10, v11);
  sub_10000CCE4((uint64_t)v10);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100005524()
{
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for EditorExtensionViewController();
  [super viewWillLayoutSubviews];
  uint64_t v1 = OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor;
  if ((*((unsigned char *)v0 + OBJC_IVAR___ICEditorExtensionViewController_didSetWindowTintColor) & 1) == 0)
  {
    id v2 = [v0 view];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = [v2 window];

      if (v4)
      {
        NSString v5 = sub_10000D1C0();
        id v6 = [self colorNamed:v5];

        [v4 setTintColor:v6];
      }
      id v7 = [v0 view];
      if (v7)
      {
        id v8 = v7;
        id v9 = [v7 window];

        if (v9)
        {
          NSString v10 = sub_10000D1C0();
          id v11 = [v9 valueForKey:v10];

          if (v11)
          {
            sub_10000D320();
            swift_unknownObjectRelease();
          }
          else
          {
            *(_OWORD *)uint64_t v13 = 0u;
            long long v14 = 0u;
          }
          sub_10000C6C8((uint64_t)v13, (uint64_t)&v15);
          if (*((void *)&v16 + 1))
          {
            sub_10000CD78(0, &qword_100015138);
            if (swift_dynamicCast())
            {
              id v12 = v13[0];
              [v13[0] setDelegate:v0];
            }
            goto LABEL_15;
          }
        }
        else
        {
          long long v15 = 0u;
          long long v16 = 0u;
        }
        sub_10000CDB4((uint64_t)&v15, &qword_1000150E8);
LABEL_15:
        *((unsigned char *)v0 + v1) = 1;
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_1000057BC(char a1)
{
  sub_10000C2EC(&qword_100015100);
  __chkstk_darwin();
  v51 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D0A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v52 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C2EC(&qword_1000150F8);
  __chkstk_darwin();
  id v50 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (objc_class *)type metadata accessor for EditorExtensionViewController();
  v53.receiver = v1;
  v53.super_class = v8;
  [super viewDidAppear:a1 & 1];
  uint64_t v9 = OBJC_IVAR___ICEditorExtensionViewController_linkContentItem;
  NSString v10 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem];
  if (v10)
  {
    id v11 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v11)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    id v12 = v10;
    [v11 addSystemPaperLink:v12 updateFirstResponder:1];
    uint64_t v13 = *(void **)&v1[v9];
    *(void *)&v1[v9] = 0;
  }
  uint64_t v14 = OBJC_IVAR___ICEditorExtensionViewController_imageData;
  if (*(void *)(*(void *)&v1[OBJC_IVAR___ICEditorExtensionViewController_imageData] + 16))
  {
    long long v15 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v15)
    {
LABEL_21:
      __break(1u);
      return;
    }
    id v16 = v15;
    swift_bridgeObjectRetain();
    Class isa = sub_10000D200().super.isa;
    swift_bridgeObjectRelease();
    [v16 addSystemPaperImageData:isa updateFirstResponder:1];

    *(void *)&v1[v14] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = *(void *)&v1[OBJC_IVAR___ICEditorExtensionViewController_webURLs];
  uint64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v39 = OBJC_IVAR___ICEditorExtensionViewController_webURLs;
    uint64_t v44 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v20 = v5 + 16;
    uint64_t v22 = v18 + ((*(unsigned __int8 *)(v20 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 64));
    uint64_t v40 = *(void *)(v20 + 56);
    v49 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 40);
    double v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 32);
    double v47 = v21;
    double v42 = (void (**)(char *, char *, uint64_t))(v20 + 16);
    uint64_t v43 = SYContentItemSourceIdentifierWeb;
    uint64_t v48 = v20;
    double v41 = (void (**)(char *, uint64_t))(v20 - 8);
    v38[1] = v18;
    swift_bridgeObjectRetain();
    v23 = v50;
    double v45 = v1;
    while (1)
    {
      v47(v23, v22, v4);
      v24 = *v49;
      (*v49)(v23, 0, 1, v4);
      if ((*v46)(v23, 1, v4) == 1) {
        goto LABEL_15;
      }
      sub_10000D1D0();
      uint64_t v25 = v4;
      (*v42)(v52, v23, v4);
      uint64_t v26 = sub_10000D100();
      uint64_t v27 = *(void *)(v26 - 8);
      v28 = v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v51, 1, 1, v26);
      NSString v29 = sub_10000D1C0();
      swift_bridgeObjectRelease();
      sub_10000D060(v30);
      id v32 = v31;
      Class v33 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v28, 1, v26) != 1)
      {
        uint64_t v34 = v51;
        Class v33 = sub_10000D0E0().super.isa;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v34, v26);
      }
      id v35 = [objc_allocWithZone((Class)SYContentItem) initWithDisplayTitle:0 sourceIdentifier:v29 sourceName:0 itemURL:v32 identifier:v33];

      uint64_t v4 = v25;
      (*v41)(v52, v25);
      uint64_t v1 = v45;
      id v36 = *(void **)&v45[v44];
      if (!v36) {
        break;
      }
      [v36 addSystemPaperLink:v35 updateFirstResponder:1];

      v22 += v40;
      --v19;
      v23 = v50;
      if (!v19)
      {
        v24(v50, 1, 1, v25);
LABEL_15:
        swift_bridgeObjectRelease();
        *(void *)&v1[v39] = &_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v37 = OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear;
  if (v1[OBJC_IVAR___ICEditorExtensionViewController_showOpenNotesAlertOnAppear] == 1)
  {
    sub_100008C5C();
    v1[v37] = 0;
  }
}

void sub_100005D40(void *a1)
{
  uint64_t v2 = sub_10000D180();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000CD78(0, &qword_1000150B8);
  *uint64_t v5 = sub_10000D2C0();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  char v6 = sub_10000D190();
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  id v7 = [a1 userInfo];
  if (!v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
LABEL_11:
    sub_10000CDB4((uint64_t)&v23, &qword_1000150E8);
    goto LABEL_12;
  }
  id v8 = v7;
  uint64_t v9 = sub_10000D1B0();

  v21[1] = sub_10000D1D0();
  v21[2] = v10;
  sub_10000D360();
  if (*(void *)(v9 + 16) && (unint64_t v11 = sub_10000B628((uint64_t)v22), (v12 & 1) != 0))
  {
    sub_10000C570(*(void *)(v9 + 56) + 32 * v11, (uint64_t)&v23);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  sub_10000CA68((uint64_t)v22);
  swift_bridgeObjectRelease();
  if (!*((void *)&v24 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    uint64_t v14 = v22[0];
    unint64_t v13 = v22[1];
    id v15 = objc_allocWithZone((Class)SYContentItem);
    sub_10000C3EC(v14, v13);
    id v20 = sub_10000BA84();
    sub_10000C330(v14, v13);
    if (v20)
    {
      sub_1000085A0(v20);

      sub_10000C330(v14, v13);
      return;
    }
    sub_10000C330(v14, v13);
  }
LABEL_12:
  if (qword_100014E28 != -1) {
LABEL_20:
  }
    swift_once();
  uint64_t v16 = sub_10000D140();
  sub_10000C4E8(v16, (uint64_t)qword_100014E30);
  objc_super v17 = sub_10000D120();
  os_log_type_t v18 = sub_10000D290();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to insert link; user activity has no SYContentItem",
      v19,
      2u);
    swift_slowDealloc();
  }
}

uint64_t sub_1000060B4(void *a1)
{
  uint64_t v2 = sub_10000D180();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000CD78(0, &qword_1000150B8);
  *uint64_t v5 = sub_10000D2C0();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  char v6 = sub_10000D190();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
    return result;
  }
  id v8 = [a1 userInfo];
  if (!v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    return sub_10000CDB4((uint64_t)&v16, &qword_1000150E8);
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_10000D1B0();

  v14[1] = sub_10000D1D0();
  v14[2] = v11;
  sub_10000D360();
  if (*(void *)(v10 + 16) && (unint64_t v12 = sub_10000B628((uint64_t)v15), (v13 & 1) != 0))
  {
    sub_10000C570(*(void *)(v10 + 56) + 32 * v12, (uint64_t)&v16);
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_10000CA68((uint64_t)v15);
  swift_bridgeObjectRelease();
  if (!*((void *)&v17 + 1)) {
    return sub_10000CDB4((uint64_t)&v16, &qword_1000150E8);
  }
  sub_10000C2EC(&qword_100015120);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    if (*(void *)(v15[0] + 16)) {
      sub_1000086C0(v15[0]);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100006304(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000C2EC(&qword_1000150F8);
  __chkstk_darwin(v4 - 8);
  char v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000D0A0();
  uint64_t v61 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  id v62 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v63 = (char *)&v51 - v10;
  uint64_t v11 = sub_10000D180();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000CD78(0, &qword_1000150B8);
  *uint64_t v14 = sub_10000D2C0();
  (*(void (**)(uint64_t *, void, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  char v15 = sub_10000D190();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
LABEL_61:
    __break(1u);
    return result;
  }
  id v17 = [a1 userInfo];
  if (!v17)
  {
    long long v67 = 0u;
    long long v68 = 0u;
LABEL_12:
    sub_10000CDB4((uint64_t)&v67, &qword_1000150E8);
    goto LABEL_13;
  }
  os_log_type_t v18 = v17;
  uint64_t v19 = sub_10000D1B0();

  uint64_t v64 = sub_10000D1D0();
  uint64_t v65 = v20;
  sub_10000D360();
  if (*(void *)(v19 + 16) && (unint64_t v21 = sub_10000B628((uint64_t)v66), (v22 & 1) != 0))
  {
    sub_10000C570(*(void *)(v19 + 56) + 32 * v21, (uint64_t)&v67);
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
  }
  sub_10000CA68((uint64_t)v66);
  swift_bridgeObjectRelease();
  if (!*((void *)&v68 + 1)) {
    goto LABEL_12;
  }
  if swift_dynamicCast() && (v66[0])
  {
    sub_100006B7C();
    goto LABEL_47;
  }
LABEL_13:
  id v23 = [a1 userInfo];
  if (!v23)
  {
    long long v67 = 0u;
    long long v68 = 0u;
LABEL_41:
    sub_10000CDB4((uint64_t)&v67, &qword_1000150E8);
    goto LABEL_47;
  }
  long long v24 = v23;
  uint64_t v25 = sub_10000D1B0();

  uint64_t v64 = sub_10000D1D0();
  uint64_t v65 = v26;
  sub_10000D360();
  if (*(void *)(v25 + 16) && (unint64_t v27 = sub_10000B628((uint64_t)v66), (v28 & 1) != 0))
  {
    sub_10000C570(*(void *)(v25 + 56) + 32 * v27, (uint64_t)&v67);
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
  }
  sub_10000CA68((uint64_t)v66);
  swift_bridgeObjectRelease();
  if (!*((void *)&v68 + 1)) {
    goto LABEL_41;
  }
  sub_10000C2EC(&qword_100015128);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    id v52 = a1;
    uint64_t v53 = v2;
    uint64_t v29 = v66[0];
    v66[0] = (uint64_t)&_swiftEmptyArrayStorage;
    uint64_t v60 = *(void *)(v29 + 16);
    if (v60)
    {
      unint64_t v30 = 0;
      uint64_t v31 = v61;
      uint64_t v59 = v61 + 16;
      uint64_t v57 = v61 + 48;
      id v32 = (void (**)(char *, char *, uint64_t))(v61 + 32);
      id v54 = (uint64_t (**)(char *, uint64_t))(v61 + 8);
      uint64_t v58 = v61 + 56;
      unint64_t v51 = (v61 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      uint64_t v55 = v29;
      v56 = v6;
      while (1)
      {
        if (v30 >= *(void *)(v29 + 16))
        {
          __break(1u);
          goto LABEL_61;
        }
        unint64_t v33 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
        uint64_t v34 = *(void *)(v31 + 72);
        (*(void (**)(char *, unint64_t, uint64_t))(v31 + 16))(v6, v29 + v33 + v34 * v30, v7);
        id v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
        v35(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v6, 1, v7) == 1) {
          goto LABEL_44;
        }
        id v36 = *v32;
        (*v32)(v63, v6, v7);
        sub_10000D080();
        if (v37)
        {
          uint64_t v38 = sub_10000D1E0();
          uint64_t v40 = v39;
          swift_bridgeObjectRelease();
          if (v38 == 1886680168 && v40 == 0xE400000000000000
            || (sub_10000D3F0() & 1) != 0
            || v38 == 0x7370747468 && v40 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
LABEL_33:
            v36(v62, v63, v7);
            uint64_t v41 = v66[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_10000B734(0, *(void *)(v41 + 16) + 1, 1);
              uint64_t v41 = v66[0];
            }
            unint64_t v43 = *(void *)(v41 + 16);
            unint64_t v42 = *(void *)(v41 + 24);
            if (v43 >= v42 >> 1)
            {
              sub_10000B734(v42 > 1, v43 + 1, 1);
              uint64_t v41 = v66[0];
            }
            *(void *)(v41 + 16) = v43 + 1;
            uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v36)(v41 + v33 + v43 * v34, v62, v7);
            v66[0] = v41;
            goto LABEL_23;
          }
          char v44 = sub_10000D3F0();
          swift_bridgeObjectRelease();
          if (v44) {
            goto LABEL_33;
          }
        }
        uint64_t result = (*v54)(v63, v7);
LABEL_23:
        ++v30;
        uint64_t v31 = v61;
        uint64_t v29 = v55;
        char v6 = v56;
        if (v60 == v30)
        {
          v35(v56, 1, 1, v7);
          goto LABEL_44;
        }
      }
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v6, 1, 1, v7);
LABEL_44:
    swift_bridgeObjectRelease();
    sub_10000CDB4((uint64_t)v6, &qword_1000150F8);
    if (*(void *)(v66[0] + 16)) {
      sub_1000087BC(v66[0]);
    }
    swift_release();
    a1 = v52;
  }
LABEL_47:
  id v45 = [a1 userInfo:v51];
  if (!v45)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    return sub_10000CDB4((uint64_t)&v67, &qword_1000150E8);
  }
  double v46 = v45;
  uint64_t v47 = sub_10000D1B0();

  uint64_t v64 = sub_10000D1D0();
  uint64_t v65 = v48;
  sub_10000D360();
  if (*(void *)(v47 + 16) && (unint64_t v49 = sub_10000B628((uint64_t)v66), (v50 & 1) != 0))
  {
    sub_10000C570(*(void *)(v47 + 56) + 32 * v49, (uint64_t)&v67);
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
  }
  sub_10000CA68((uint64_t)v66);
  swift_bridgeObjectRelease();
  if (!*((void *)&v68 + 1)) {
    return sub_10000CDB4((uint64_t)&v67, &qword_1000150E8);
  }
  sub_10000C2EC(&qword_100015120);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    if (*(void *)(v66[0] + 16)) {
      sub_1000086C0(v66[0]);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100006B7C()
{
  uint64_t v1 = OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar;
  v0[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 1;
  if (![v0 isViewLoaded]) {
    goto LABEL_4;
  }
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (v2)
  {
    [v2 setCanShowLinkBar:(v0[v1] & 1) == 0];
LABEL_4:
    uint64_t v3 = self;
    sub_100006D00((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_10000D1A0().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v0;
    v8[4] = sub_10000C7B0;
    v8[5] = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100008420;
    v8[3] = &unk_100010A00;
    char v6 = _Block_copy(v8);
    uint64_t v7 = v0;
    swift_release();
    [v3 _currentUserActivityUUIDWithOptions:isa completionHandler:v6];
    _Block_release(v6);

    return;
  }
  __break(1u);
}

unint64_t sub_100006D00(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000C2EC(&qword_100015110);
  uint64_t v2 = sub_10000D3C0();
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
    sub_10000C998(v6, (uint64_t)v15, &qword_100015118);
    unint64_t result = sub_10000B628((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10000C9FC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

void sub_100006E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = sub_10000C2EC(&qword_100015100);
  __chkstk_darwin(v8 - 8);
  long long v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D100();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  char v15 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  long long v17 = (char *)&v32 - v16;
  sub_10000C998(a1, (uint64_t)v10, &qword_100015100);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_10000CDB4((uint64_t)v10, &qword_100015100);
    if (qword_100014E28 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_10000D140();
    sub_10000C4E8(v18, (uint64_t)qword_100014E30);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v19 = sub_10000D120();
    os_log_type_t v20 = sub_10000D290();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      char v22 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v21 = 138412290;
      if (a4)
      {
        swift_errorRetain();
        uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
        aBlock[0] = v23;
        sub_10000D300();
      }
      else
      {
        aBlock[0] = 0;
        sub_10000D300();
        uint64_t v23 = 0;
      }
      void *v22 = v23;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to get current user activity uuid. Error: %@", v21, 0xCu);
      sub_10000C2EC(&qword_1000150E0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    long long v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v24(v17, v10, v11);
    id v34 = self;
    Class isa = sub_10000D0E0().super.isa;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    unint64_t v25 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v26 = a5;
    unint64_t v27 = (v13 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v28 = swift_allocObject();
    v24((char *)(v28 + v25), v15, v11);
    *(void *)(v28 + v27) = v26;
    aBlock[4] = sub_10000C85C;
    aBlock[5] = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008394;
    aBlock[3] = &unk_100010A50;
    uint64_t v29 = _Block_copy(aBlock);
    id v30 = v26;
    swift_release();
    Class v31 = isa;
    [v34 _fetchUserActivityWithUUID:isa completionHandler:v29];
    _Block_release(v29);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
}

void sub_1000072D4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v38 = a4;
  uint64_t v41 = a3;
  uint64_t v6 = sub_10000D150();
  uint64_t v40 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D170();
  uint64_t v39 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D100();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v38 - v17;
  if (a1)
  {
    id v19 = a1;
    if (sub_100007B08())
    {
      sub_10000CD78(0, &qword_1000150B8);
      os_log_type_t v20 = (void *)sub_10000D2C0();
      uint64_t v21 = swift_allocObject();
      char v22 = v38;
      *(void *)(v21 + 16) = v19;
      *(void *)(v21 + 24) = v22;
      aBlock[4] = (uint64_t)sub_10000C990;
      aBlock[5] = v21;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100008350;
      aBlock[3] = (uint64_t)&unk_100010AA0;
      uint64_t v23 = _Block_copy(aBlock);
      id v24 = v19;
      id v25 = v22;
      swift_release();
      sub_10000D160();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_10000C908(&qword_1000150C0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000C2EC(&qword_1000150C8);
      sub_10000C444();
      sub_10000D330();
      sub_10000D2D0();
      _Block_release(v23);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v6);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v9);
      return;
    }
    if (qword_100014E28 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_10000D140();
    sub_10000C4E8(v33, (uint64_t)qword_100014E30);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v41, v12);
    unint64_t v27 = sub_10000D120();
    os_log_type_t v34 = sub_10000D290();
    if (os_log_type_enabled(v27, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)id v35 = 136315138;
      uint64_t v41 = (uint64_t)(v35 + 4);
      sub_10000C908(&qword_100015108, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v36 = sub_10000D3E0();
      uint64_t v42 = sub_10000AFD0(v36, v37, aBlock);
      sub_10000D300();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      _os_log_impl((void *)&_mh_execute_header, v27, v34, "Fetched user activity %s, but it was not linkable.", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    }
  }
  else
  {
    if (qword_100014E28 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_10000D140();
    sub_10000C4E8(v26, (uint64_t)qword_100014E30);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v41, v12);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v27 = sub_10000D120();
    os_log_type_t v28 = sub_10000D290();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      aBlock[0] = v41;
      *(_DWORD *)uint64_t v29 = 136315394;
      sub_10000C908(&qword_100015108, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v30 = sub_10000D3E0();
      uint64_t v42 = sub_10000AFD0(v30, v31, aBlock);
      sub_10000D300();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      *(_WORD *)(v29 + 12) = 2112;
      if (a2)
      {
        swift_errorRetain();
        uint64_t v32 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v42 = v32;
        sub_10000D300();
      }
      else
      {
        uint64_t v42 = 0;
        sub_10000D300();
        uint64_t v32 = 0;
      }
      *(void *)uint64_t v40 = v32;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to fetch user activity %s. Error: %@", (uint8_t *)v29, 0x16u);
      sub_10000C2EC(&qword_1000150E0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_100007B08()
{
  uint64_t v1 = sub_10000D0A0();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C2EC(&qword_1000150F8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v39 - v8;
  id v10 = [v0 webpageURL];
  if (v10)
  {
    uint64_t v11 = v10;
    sub_10000D070();

    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v9, v4, v1);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v12(v9, 0, 1, v1);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) != 1)
    {
      uint64_t v13 = (uint64_t)v9;
LABEL_8:
      sub_10000CDB4(v13, &qword_1000150F8);
      uint64_t v16 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v12(v9, 1, 1, v1);
  }
  sub_10000CDB4((uint64_t)v9, &qword_1000150F8);
  id v14 = [v0 _canonicalURL];
  if (v14)
  {
    uint64_t v15 = v14;
    sub_10000D070();

    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v4, v1);
    v12(v7, 0, 1, v1);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) != 1)
    {
      uint64_t v13 = (uint64_t)v7;
      goto LABEL_8;
    }
  }
  else
  {
    v12(v7, 1, 1, v1);
  }
  sub_10000CDB4((uint64_t)v7, &qword_1000150F8);
  id v17 = [v0 persistentIdentifier];
  if (!v17) {
    goto LABEL_15;
  }
  uint64_t v18 = v17;
  uint64_t v19 = sub_10000D1D0();
  unint64_t v21 = v20;

  swift_bridgeObjectRelease();
  uint64_t v22 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0) {
    uint64_t v22 = v19 & 0xFFFFFFFFFFFFLL;
  }
  if (v22)
  {
    uint64_t v16 = 1;
  }
  else
  {
LABEL_15:
    uint64_t v16 = (uint64_t)[v0 targetContentIdentifier];
    if (v16)
    {
      uint64_t v23 = sub_10000D1D0();
      unint64_t v25 = v24;

      swift_bridgeObjectRelease();
      uint64_t v26 = HIBYTE(v25) & 0xF;
      if ((v25 & 0x2000000000000000) == 0) {
        uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v16 = v26 != 0;
    }
  }
LABEL_19:
  id v27 = [v0 activityType];
  uint64_t v28 = sub_10000D1D0();
  unint64_t v30 = v29;

  swift_bridgeObjectRelease();
  uint64_t v31 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0) {
    uint64_t v31 = v28 & 0xFFFFFFFFFFFFLL;
  }
  if (!v31) {
    return 0;
  }
  id v32 = [v0 activityType];
  uint64_t v33 = sub_10000D1D0();
  uint64_t v35 = v34;

  if (v33 == sub_10000D1D0() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v37 = sub_10000D3F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37) {
    return 0;
  }
  return v16;
}

void sub_100007F58(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C2EC(&qword_100015100);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(a2 + OBJC_IVAR___ICEditorExtensionViewController_hostConnection);
  if (!v7 || (v8 = v7, sub_100008148(), uint64_t v10 = v9, v8, !v10)) {
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = sub_10000D100();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v6, 1, 1, v11);
  id v13 = a1;
  NSString v14 = sub_10000D1C0();
  swift_bridgeObjectRelease();
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    Class isa = sub_10000D0E0().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  id v16 = [objc_allocWithZone((Class)SYContentItem) initWithUserActivity:v13 sourceAppID:v14 sourceAppName:0 identifier:isa];

  sub_1000085A0(v16);
}

uint64_t sub_100008148()
{
  [v0 auditToken];
  uint64_t v1 = SecTaskCreateWithAuditToken(0, &v14);
  if (v1)
  {
    uint64_t v2 = v1;
    CFStringRef v3 = SecTaskCopySigningIdentifier(v1, 0);
    if (v3)
    {
      uint64_t v4 = (__CFString *)v3;
      uint64_t v5 = sub_10000D1D0();

      return v5;
    }
  }
  if (qword_100014E28 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000D140();
  sub_10000C4E8(v6, (uint64_t)qword_100014E30);
  id v7 = v0;
  id v8 = sub_10000D120();
  os_log_type_t v9 = sub_10000D290();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    *(void *)v14.val = v7;
    id v12 = v7;
    sub_10000D300();
    void *v11 = v7;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to get signing info for connection %@", v10, 0xCu);
    sub_10000C2EC(&qword_1000150E0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return 0;
}

uint64_t sub_100008350(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100008394(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100008420(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_10000C2EC(&qword_100015100);
  __chkstk_darwin();
  os_log_type_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10000D0F0();
    uint64_t v11 = sub_10000D100();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_10000D100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  if (a3)
  {
    uint64_t v13 = sub_10000D1D0();
    a3 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_retain();
  id v15 = a4;
  v10(v9, v13, a3, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return sub_10000CDB4((uint64_t)v9, &qword_100015100);
}

void sub_1000085A0(void *a1)
{
  uint64_t v3 = OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar;
  v1[OBJC_IVAR___ICEditorExtensionViewController_suppressLinkBar] = 1;
  if ([v1 isViewLoaded])
  {
    uint64_t v4 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v4)
    {
      __break(1u);
      goto LABEL_15;
    }
    [v4 setCanShowLinkBar:(v1[v3] & 1) == 0];
  }
  if (![v1 isViewLoaded]) {
    goto LABEL_11;
  }
  uint64_t v5 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  id v6 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (!v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ([v6 isViewLoaded])
  {
    id v7 = *(void **)&v1[v5];
    if (v7)
    {
      [v7 addSystemPaperLink:a1 updateFirstResponder:1];
      return;
    }
LABEL_16:
    __break(1u);
    return;
  }
LABEL_11:
  id v9 = *(id *)&v1[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem];
  *(void *)&v1[OBJC_IVAR___ICEditorExtensionViewController_linkContentItem] = a1;
  id v8 = a1;
}

void sub_1000086C0(uint64_t a1)
{
  if ([v1 isViewLoaded])
  {
    uint64_t v3 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
    uint64_t v4 = *(void **)&v1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (!v4)
    {
      __break(1u);
      goto LABEL_12;
    }
    if ([v4 isViewLoaded])
    {
      uint64_t v5 = *(void **)&v1[v3];
      if (v5)
      {
        id v6 = v5;
        Class isa = sub_10000D200().super.isa;
        [v6 addSystemPaperImageData:isa updateFirstResponder:1];

        return;
      }
LABEL_12:
      __break(1u);
      return;
    }
  }
  *(void *)&v1[OBJC_IVAR___ICEditorExtensionViewController_imageData] = a1;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
}

void *sub_1000087BC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000C2EC(&qword_100015100);
  __chkstk_darwin(v4 - 8);
  uint64_t v41 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D0A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v42 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000C2EC(&qword_1000150F8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (![v2 isViewLoaded]) {
    goto LABEL_12;
  }
  uint64_t v40 = OBJC_IVAR___ICEditorExtensionViewController_noteEditor;
  unint64_t result = *(void **)&v2[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
  if (result)
  {
    if ([result isViewLoaded])
    {
      uint64_t v13 = *(void *)&v2[OBJC_IVAR___ICEditorExtensionViewController_webURLs];
      uint64_t v14 = *(void *)(v13 + 16);
      if (v14)
      {
        id v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
        uint64_t v15 = v7 + 16;
        uint64_t v39 = v16;
        uint64_t v17 = v13 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
        uint64_t v30 = *(void *)(v15 + 56);
        char v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 32);
        uint64_t v34 = (void (**)(char *, char *, uint64_t))(v15 + 16);
        uint64_t v35 = SYContentItemSourceIdentifierWeb;
        uint64_t v33 = (void (**)(char *, uint64_t))(v15 - 8);
        v29[2] = v13;
        swift_bridgeObjectRetain();
        uint64_t v38 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 40);
        v29[1] = (v15 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        uint64_t v36 = v2;
        uint64_t v31 = v11;
        uint64_t v32 = v15;
        while (1)
        {
          v39(v11, v17, v6);
          uint64_t v18 = *v38;
          (*v38)(v11, 0, 1, v6);
          if ((*v37)(v11, 1, v6) == 1) {
            break;
          }
          sub_10000D1D0();
          (*v34)(v42, v11, v6);
          uint64_t v19 = sub_10000D100();
          uint64_t v20 = *(void *)(v19 - 8);
          unint64_t v21 = v41;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v41, 1, 1, v19);
          NSString v22 = sub_10000D1C0();
          swift_bridgeObjectRelease();
          sub_10000D060(v23);
          unint64_t v25 = v24;
          Class isa = 0;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v21, 1, v19) != 1)
          {
            id v27 = v41;
            Class isa = sub_10000D0E0().super.isa;
            (*(void (**)(char *, uint64_t))(v20 + 8))(v27, v19);
          }
          id v28 = [objc_allocWithZone((Class)SYContentItem) initWithDisplayTitle:0 sourceIdentifier:v22 sourceName:0 itemURL:v25 identifier:isa];

          (*v33)(v42, v6);
          unint64_t result = *(void **)&v36[v40];
          if (!result)
          {
            __break(1u);
            goto LABEL_19;
          }
          [result addSystemPaperLink:v28 updateFirstResponder:1];

          uint64_t v11 = v31;
          v17 += v30;
          if (!--v14) {
            goto LABEL_16;
          }
        }
      }
      else
      {
        uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
        swift_bridgeObjectRetain();
LABEL_16:
        v18(v11, 1, 1, v6);
      }
      return (void *)swift_bridgeObjectRelease();
    }
LABEL_12:
    *(void *)&v2[OBJC_IVAR___ICEditorExtensionViewController_webURLs] = a1;
    swift_bridgeObjectRetain();
    return (void *)swift_bridgeObjectRelease();
  }
LABEL_19:
  __break(1u);
  return result;
}

void sub_100008C5C()
{
  int IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
  uint64_t v2 = (objc_class *)[self mainBundle];
  if (IsAppleAccountBrandingEnabled)
  {
    v24._countAndFlagsBits = 0x800000010000ED10;
    v3._object = (void *)0x800000010000EDF0;
    v3._countAndFlagsBits = 0x1000000000000053;
  }
  else
  {
    v3._countAndFlagsBits = 0xD000000000000053;
    v24._countAndFlagsBits = 0x800000010000ED10;
    v3._object = (void *)0x800000010000ECB0;
  }
  v37.value._countAndFlagsBits = 0;
  v37.value._object = 0;
  v4.super.Class isa = v2;
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  sub_10000D040(v3, v37, v4, v41, v24);

  uint64_t v5 = self;
  uint64_t v6 = (objc_class *)[v5 mainBundle];
  v25._countAndFlagsBits = 0x800000010000ED50;
  v34._countAndFlagsBits = 0x6F4E206B63697551;
  v34._object = (void *)0xEB00000000736574;
  v38.value._countAndFlagsBits = 0;
  v38.value._object = 0;
  v7.super.Class isa = v6;
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10000D040(v34, v38, v7, v42, v25);

  NSString v8 = sub_10000D1C0();
  swift_bridgeObjectRelease();
  NSString v9 = sub_10000D1C0();
  swift_bridgeObjectRelease();
  id v10 = [self alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  uint64_t v11 = (objc_class *)[v5 mainBundle];
  v26._countAndFlagsBits = 0x800000010000ED80;
  v35._countAndFlagsBits = 0x746F4E206E65704FLL;
  v35._object = (void *)0xEA00000000007365;
  v39.value._countAndFlagsBits = 0;
  v39.value._object = 0;
  v12.super.Class isa = v11;
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  sub_10000D040(v35, v39, v12, v43, v26);

  uint64_t v13 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  swift_retain();
  NSString v14 = sub_10000D1C0();
  swift_bridgeObjectRelease();
  uint64_t v32 = sub_10000C768;
  uint64_t v33 = v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  uint64_t v30 = sub_100009584;
  uint64_t v31 = &unk_100010960;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  id v16 = self;
  id v17 = [v16 actionWithTitle:v14 style:0 handler:v15];
  _Block_release(v15);
  swift_release();

  [v10 addAction:v17];
  uint64_t v18 = (objc_class *)[v5 mainBundle];
  v27._countAndFlagsBits = 0x800000010000EDD0;
  v36._countAndFlagsBits = 0x6C65636E6143;
  v36._object = (void *)0xE600000000000000;
  v40.value._countAndFlagsBits = 0;
  v40.value._object = 0;
  v19.super.Class isa = v18;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  sub_10000D040(v36, v40, v19, v44, v27);

  uint64_t v20 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  swift_retain();
  NSString v21 = sub_10000D1C0();
  swift_bridgeObjectRelease();
  uint64_t v32 = sub_10000C770;
  uint64_t v33 = v20;
  aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  uint64_t v30 = sub_100009584;
  uint64_t v31 = &unk_100010988;
  NSString v22 = _Block_copy(&aBlock);
  swift_release();
  id v23 = [v16 actionWithTitle:v21 style:1 handler:v22];
  _Block_release(v22);
  swift_release();

  [v10 addAction:v23];
  [v0 presentViewController:v10 animated:1 completion:0];
}

uint64_t sub_100009154(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  sub_10000C2EC(&qword_1000150F8);
  __chkstk_darwin();
  Swift::String v3 = (char *)&aBlock[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D030();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  NSBundle v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D0A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D020();
  id v12 = (id)ICNotesAppURLScheme();
  sub_10000D1D0();

  sub_10000D010();
  sub_10000D000();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v3, 1, v8);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v14 = v22;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v3, v8);
    uint64_t Strong = (char *)swift_unknownObjectUnownedLoadStrong();
    id v16 = *(void **)&Strong[OBJC_IVAR___ICEditorExtensionViewController_hostConnection];
    if (v16)
    {
      id v17 = [v16 remoteObjectProxy];
      sub_10000D320();
      swift_unknownObjectRelease();
      sub_10000C2EC(&qword_1000150B0);
      if (swift_dynamicCast())
      {
        uint64_t v18 = (void *)aBlock[6];

        sub_10000D060(v19);
        uint64_t Strong = v20;
        aBlock[4] = sub_10000C770;
        aBlock[5] = v14;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100003BA8;
        aBlock[3] = &unk_1000109B0;
        NSString v21 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        [v18 openURL:Strong completion:v21];
        _Block_release(v21);
        swift_unknownObjectRelease();
      }
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

void sub_1000094C0()
{
  uint64_t Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  uint64_t v1 = *(void **)&Strong[OBJC_IVAR___ICEditorExtensionViewController_hostConnection];
  if (v1
    && (id v2 = [v1 remoteObjectProxy],
        sub_10000D320(),
        swift_unknownObjectRelease(),
        sub_10000C2EC(&qword_1000150B0),
        (swift_dynamicCast() & 1) != 0))
  {

    [v3 dismissViewControllerCancelled:1];
    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_100009584(uint64_t a1, void *a2)
{
  Swift::String v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1000095EC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___ICEditorExtensionViewController_noteEditor);
  if (v1)
  {
    id v2 = [v1 note];
    if (v2)
    {
      Swift::String v3 = v2;
      if ([v2 isEmpty] && (objc_msgSend(v3, "isDeletedOrInTrash") & 1) == 0)
      {
        [self deleteEmptyNote:v3];
        id v4 = [v3 managedObjectContext];
        [v4 ic_save];
      }
    }
  }
  id v5 = [self sharedContext];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [v5 crossProcessChangeCoordinator];

    [v7 postEditorExtensionDidSaveNotification];
  }
  uint64_t v8 = OBJC_IVAR___ICEditorExtensionViewController_hostConnection;
  [*(id *)(v0 + OBJC_IVAR___ICEditorExtensionViewController_hostConnection) invalidate];
  uint64_t v9 = *(void **)(v0 + v8);
  *(void *)(v0 + v8) = 0;

  id result = *(id *)(v0 + OBJC_IVAR___ICEditorExtensionViewController_analyticsController);
  if (result)
  {
    return [result endSessionSynchronously:0 forSessionType:1 endReason:1];
  }
  return result;
}

id sub_10000976C()
{
  id result = [v0 view];
  if (result)
  {
    id v2 = result;
    id v3 = [result window];

    if (v3)
    {
      NSString v4 = sub_10000D1C0();
      id v5 = [v3 valueForKey:v4];

      if (v5)
      {
        sub_10000D320();
        swift_unknownObjectRelease();
      }
      else
      {
        *(_OWORD *)uint64_t v8 = 0u;
        long long v9 = 0u;
      }
      sub_10000C6C8((uint64_t)v8, (uint64_t)&v10);
      if (*((void *)&v11 + 1))
      {
        sub_10000CD78(0, &qword_1000150F0);
        if (swift_dynamicCast())
        {
          id v6 = v8[0];
          id v7 = [v8[0] undoManager];

          return v7;
        }
        return 0;
      }
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    sub_10000CDB4((uint64_t)&v10, &qword_1000150E8);
    return 0;
  }
  __break(1u);
  return result;
}

void sub_10000994C(uint64_t a1, uint64_t a2, SEL *a3)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = Strong;
    [Strong *a3];
  }
}

uint64_t type metadata accessor for EditorExtensionViewController()
{
  return self;
}

uint64_t sub_100009B00(void *a1)
{
  id v2 = v1;
  uint64_t v4 = sub_10000D150();
  uint64_t v31 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10000D170();
  uint64_t v7 = *(void *)(v30 - 8);
  __chkstk_darwin();
  long long v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = self;
  id v11 = [v10 ic_extensionInterface];
  [a1 setExportedInterface:v11];

  [a1 setExportedObject:v2];
  id v12 = [v10 ic_hostInterface];
  [a1 setRemoteObjectInterface:v12];

  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  Swift::String v36 = sub_10000C66C;
  Swift::String_optional v37 = (void *)v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v33 = 1107296256;
  Swift::String v34 = sub_100008350;
  Swift::String v35 = &unk_100010898;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release();
  [a1 setInvalidationHandler:v14];
  _Block_release(v14);
  [a1 resume];
  uint64_t v15 = *(void **)&v2[OBJC_IVAR___ICEditorExtensionViewController_hostConnection];
  *(void *)&v2[OBJC_IVAR___ICEditorExtensionViewController_hostConnection] = a1;
  id v16 = a1;

  uint64_t v17 = sub_100008148();
  uint64_t v19 = v18;
  id v20 = (id)ICSystemPaperViewServiceBundleIdentifier();
  uint64_t v21 = sub_10000D1D0();
  uint64_t v23 = v22;

  if (!v19)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (v17 != v21 || v19 != v23)
  {
    char v24 = sub_10000D3F0();
    swift_bridgeObjectRelease();
    if (v24)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
LABEL_8:
    sub_10000CD78(0, &qword_1000150B8);
    Swift::String v25 = (void *)sub_10000D2C0();
    Swift::String v26 = (void *)swift_allocObject();
    v26[2] = v2;
    v26[3] = v17;
    v26[4] = v19;
    Swift::String v36 = sub_10000C6B4;
    Swift::String_optional v37 = v26;
    aBlock = _NSConcreteStackBlock;
    uint64_t v33 = 1107296256;
    Swift::String v34 = sub_100008350;
    Swift::String v35 = &unk_1000108E8;
    Swift::String v27 = _Block_copy(&aBlock);
    id v28 = v2;
    swift_release();
    sub_10000D160();
    aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_10000C908(&qword_1000150C0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000C2EC(&qword_1000150C8);
    sub_10000C444();
    sub_10000D330();
    sub_10000D2D0();
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v30);
    return 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_100009FC0(uint64_t a1)
{
  uint64_t v2 = sub_10000D150();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D170();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  long long v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100014E28 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10000D140();
  sub_10000C4E8(v10, (uint64_t)qword_100014E30);
  id v11 = sub_10000D120();
  os_log_type_t v12 = sub_10000D280();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Host connection invalidated", v13, 2u);
    swift_slowDealloc();
  }

  sub_10000CD78(0, &qword_1000150B8);
  uint64_t v14 = (void *)sub_10000D2C0();
  aBlock[4] = sub_10000C6C0;
  aBlock[5] = a1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008350;
  aBlock[3] = &unk_100010910;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_10000D160();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000C908(&qword_1000150C0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000C2EC(&qword_1000150C8);
  sub_10000C444();
  sub_10000D330();
  sub_10000D2D0();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_10000A31C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1000095EC();
  }
}

void sub_10000A370(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &a1[OBJC_IVAR___ICEditorExtensionViewController_hostBundleIdentifier];
  *(void *)uint64_t v4 = a2;
  *((void *)v4 + 1) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if ([a1 isViewLoaded])
  {
    uint64_t v5 = *(void **)&a1[OBJC_IVAR___ICEditorExtensionViewController_noteEditor];
    if (v5)
    {
      if (*((void *)v4 + 1))
      {
        id v6 = v5;
        swift_bridgeObjectRetain();
        NSString v8 = sub_10000D1C0();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v7 = v5;
        NSString v8 = 0;
      }
      [v5 setHostBundleIdentifier:v8];
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000A524(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_10000D150();
  uint64_t v17 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000D170();
  uint64_t v8 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000CD78(0, &qword_1000150B8);
  id v11 = (void *)sub_10000D2C0();
  os_log_type_t v12 = (void *)swift_allocObject();
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = v2;
  aBlock[4] = sub_10000C3C8;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008350;
  aBlock[3] = &unk_100010848;
  uint64_t v13 = _Block_copy(aBlock);
  sub_10000C3EC(a1, a2);
  id v14 = v2;
  swift_release();
  sub_10000D160();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10000C908(&qword_1000150C0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000C2EC(&qword_1000150C8);
  sub_10000C444();
  sub_10000D330();
  sub_10000D2D0();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v16);
}

void sub_10000A7FC(uint64_t a1, unint64_t a2)
{
  if (qword_100014E28 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000D140();
  sub_10000C4E8(v4, (uint64_t)qword_100014E30);
  sub_10000C3EC(a1, a2);
  sub_10000C3EC(a1, a2);
  uint64_t v5 = sub_10000D120();
  os_log_type_t v6 = sub_10000D280();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)id v7 = 136315138;
    sub_10000C3EC(a1, a2);
    uint64_t v8 = sub_10000D0B0();
    unint64_t v10 = v9;
    sub_10000C330(a1, a2);
    sub_10000AFD0(v8, v10, &v32);
    sub_10000D300();
    swift_bridgeObjectRelease();
    sub_10000C330(a1, a2);
    sub_10000C330(a1, a2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "got data: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10000C330(a1, a2);
    sub_10000C330(a1, a2);
  }

  id v11 = self;
  Class isa = sub_10000D0C0().super.isa;
  id v13 = [v11 ic_userActivityWithData:isa];

  if (v13)
  {
    id v14 = [v13 activityType];
    uint64_t v15 = sub_10000D1D0();
    uint64_t v17 = v16;

    if (sub_10000D1D0() == v15 && v18 == v17)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      swift_bridgeObjectRelease();
      sub_100005D40(v13);
LABEL_12:

      return;
    }
    char v19 = sub_10000D3F0();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_11;
    }
    if (sub_10000D1D0() == v15 && v20 == v17)
    {
      swift_bridgeObjectRelease();
LABEL_18:
      swift_bridgeObjectRelease();
      sub_1000060B4(v13);
      goto LABEL_12;
    }
    char v21 = sub_10000D3F0();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_18;
    }
    if (sub_10000D1D0() == v15 && v22 == v17)
    {
      swift_bridgeObjectRelease_n();
LABEL_23:
      sub_100006304(v13);
      goto LABEL_12;
    }
    char v23 = sub_10000D3F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_23;
    }
    id v24 = v13;
    Swift::String v25 = sub_10000D120();
    os_log_type_t v26 = sub_10000D290();
    if (os_log_type_enabled(v25, v26))
    {
      Swift::String v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)Swift::String v27 = 136315138;
      id v28 = [v24 activityType];
      uint64_t v29 = sub_10000D1D0();
      unint64_t v31 = v30;

      sub_10000AFD0(v29, v31, &v32);
      sub_10000D300();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Ignoring unexpected user activity type %s", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t sub_10000ADFC(uint64_t a1, int *a2)
{
  os_log_type_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000AED8;
  return v6(a1);
}

uint64_t sub_10000AED8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000AFD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B0A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000C570((uint64_t)v12, *a3);
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
      sub_10000C570((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000C520((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B0A4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000D310();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000B260(a5, a6);
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
  uint64_t v8 = sub_10000D390();
  if (!v8)
  {
    sub_10000D3A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000D3D0();
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

uint64_t sub_10000B260(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B2F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B4D8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B4D8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B2F8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000B470(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000D370();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000D3A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000D1F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000D3D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000D3A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000B470(uint64_t a1, uint64_t a2)
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
  sub_10000C2EC(&qword_1000150D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000B4D8(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000C2EC(&qword_1000150D8);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_10000D3D0();
  __break(1u);
  return result;
}

unint64_t sub_10000B628(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10000D340(*(void *)(v2 + 40));

  return sub_10000B66C(a1, v4);
}

unint64_t sub_10000B66C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000CA0C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10000D350();
      sub_10000CA68((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000B734(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000B754(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10000B754(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    id v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000C2EC(&qword_100015130);
  uint64_t v10 = *(void *)(sub_10000D0A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10000D0A0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  char v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  char v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_10000D3D0();
  __break(1u);
  return result;
}

void sub_10000B994(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, NSURL *a4@<X8>)
{
  sub_10000D060(a4);
  uint64_t v8 = v7;
  if (a2)
  {
    v10[4] = a2;
    v10[5] = a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_100003BA8;
    v10[3] = &unk_100010C70;
    uint64_t v9 = _Block_copy(v10);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v9 = 0;
  }
  [self openURL:v8 originatingView:a1 completionHandler:v9];
  _Block_release(v9);
}

id sub_10000BA84()
{
  Class isa = sub_10000D0C0().super.isa;
  id v6 = 0;
  id v2 = [v0 initWithData:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_10000D050();

    swift_willThrow();
  }
  return v2;
}

void sub_10000BB44()
{
  if (UIAccessibilityIsShakeToUndoEnabled())
  {
    id v1 = sub_10000976C();
    if (v1)
    {
      id v7 = v1;
      if (([v1 canUndo] & 1) != 0 || objc_msgSend(v7, "canRedo"))
      {
        id v2 = [objc_allocWithZone((Class)UINotificationFeedbackGenerator) init];
        uint64_t v3 = OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator;
        id v4 = *(void **)(v0 + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator);
        *(void *)(v0 + OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator) = v2;

        uint64_t v5 = *(void **)(v0 + v3);
        if (v5)
        {
          id v6 = v5;
          [v6 prepare];
        }
      }
    }
  }
}

void sub_10000BC10()
{
  if (UIAccessibilityIsShakeToUndoEnabled())
  {
    id v1 = sub_10000976C();
    if (v1)
    {
      id v32 = v1;
      if (([v1 canUndo] & 1) != 0 || objc_msgSend(v32, "canRedo"))
      {
        uint64_t v31 = OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator;
        id v2 = *(void **)&v0[OBJC_IVAR___ICEditorExtensionViewController_feedbackGenerator];
        if (v2) {
          [v2 notificationOccurred:0];
        }
        unsigned int v3 = [v32 canUndo];
        id v4 = &selRef_undoMenuItemTitle;
        if (!v3) {
          id v4 = &selRef_redoMenuItemTitle;
        }
        id v5 = [v32 *v4];
        sub_10000D1D0();

        if ([v32 canUndo])
        {
          id v6 = (objc_class *)[self mainBundle];
          v40._countAndFlagsBits = 1868852821;
          v28._countAndFlagsBits = 0x800000010000EDD0;
          v40._object = (void *)0xE400000000000000;
          v43.value._countAndFlagsBits = 0;
          v43.value._object = 0;
          v7.super.Class isa = v6;
          v46._countAndFlagsBits = 0;
          v46._object = (void *)0xE000000000000000;
          sub_10000D040(v40, v43, v7, v46, v28);
        }
        if ([v32 canUndo])
        {
          uint64_t v8 = (objc_class *)[v32 redoMenuItemTitle];
          uint64_t v9 = sub_10000D1D0();
        }
        else
        {
          uint64_t v8 = (objc_class *)[self mainBundle];
          v28._countAndFlagsBits = 0x800000010000EDD0;
          v41._countAndFlagsBits = 1868850514;
          v41._object = (void *)0xE400000000000000;
          v44.value._countAndFlagsBits = 0;
          v44.value._object = 0;
          v10.super.Class isa = v8;
          v47._countAndFlagsBits = 0;
          v47._object = (void *)0xE000000000000000;
          uint64_t v9 = sub_10000D040(v41, v44, v10, v47, v28);
        }
        v29._object = (void *)v9;

        NSString v11 = sub_10000D1C0();
        swift_bridgeObjectRelease();
        NSString v12 = sub_10000D1C0();
        id v13 = [self alertControllerWithTitle:v11 message:v12 preferredStyle:1];

        id v30 = v13;
        if ([v32 canUndo])
        {
          uint64_t v14 = swift_allocObject();
          swift_unknownObjectWeakInit();
          swift_retain();
          NSString v15 = sub_10000D1C0();
          swift_bridgeObjectRelease();
          Swift::String_optional v37 = sub_10000CAE0;
          uint64_t v38 = v14;
          aBlock = _NSConcreteStackBlock;
          uint64_t v34 = 1107296256;
          Swift::String v35 = sub_100009584;
          Swift::String v36 = &unk_100010B18;
          uint64_t v16 = _Block_copy(&aBlock);
          swift_release();
          id v17 = [self actionWithTitle:v15 style:0 handler:v16];
          _Block_release(v16);
          swift_release();

          [v13 addAction:v17];
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        if ([v32 canRedo])
        {
          uint64_t v18 = swift_allocObject();
          swift_unknownObjectWeakInit();
          swift_retain();
          NSString v19 = sub_10000D1C0();
          swift_bridgeObjectRelease();
          Swift::String_optional v37 = sub_10000CABC;
          uint64_t v38 = v18;
          aBlock = _NSConcreteStackBlock;
          uint64_t v34 = 1107296256;
          Swift::String v35 = sub_100009584;
          Swift::String v36 = &unk_100010AF0;
          uint64_t v20 = _Block_copy(&aBlock);
          swift_release();
          id v21 = [self actionWithTitle:v19 style:0 handler:v20];
          _Block_release(v20);
          swift_release();

          unint64_t v22 = v30;
          [v30 addAction:v21];
        }
        else
        {
          swift_bridgeObjectRelease();
          unint64_t v22 = v13;
        }
        char v23 = (objc_class *)[self mainBundle];
        v29._countAndFlagsBits = 0x800000010000EDD0;
        v42._countAndFlagsBits = 0x6C65636E6143;
        v42._object = (void *)0xE600000000000000;
        v45.value._countAndFlagsBits = 0;
        v45.value._object = 0;
        v24.super.Class isa = v23;
        v48._countAndFlagsBits = 0;
        v48._object = (void *)0xE000000000000000;
        sub_10000D040(v42, v45, v24, v48, v29);

        NSString v25 = sub_10000D1C0();
        swift_bridgeObjectRelease();
        id v26 = [self actionWithTitle:v25 style:1 handler:0];

        [v22 addAction:v26];
        [v0 presentViewController:v22 animated:1 completion:0];
        Swift::String v27 = *(void **)&v0[v31];
        *(void *)&v0[v31] = 0;
      }
      else
      {
      }
    }
  }
}

uint64_t sub_10000C23C(char a1)
{
  uint64_t result = *(void *)(v1 + OBJC_IVAR___ICEditorExtensionViewController_hostConnection);
  if (result)
  {
    id v4 = [(id)result remoteObjectProxy];
    sub_10000D320();
    swift_unknownObjectRelease();
    sub_10000C2EC(&qword_1000150B0);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      [v5 dismissViewControllerCancelled:a1 & 1];
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_10000C2EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C330(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000C388()
{
  sub_10000C330(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000C3C8()
{
  sub_10000A7FC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000C3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C3E4()
{
  return swift_release();
}

uint64_t sub_10000C3EC(uint64_t a1, unint64_t a2)
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

unint64_t sub_10000C444()
{
  unint64_t result = qword_1000150D0;
  if (!qword_1000150D0)
  {
    sub_10000C4A0(&qword_1000150C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000150D0);
  }
  return result;
}

uint64_t sub_10000C4A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C4E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000C520(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10000C5D0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000C634()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C66C()
{
  return sub_100009FC0(v0);
}

uint64_t sub_10000C674()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000C6B4()
{
  sub_10000A370(*(char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_10000C6C0()
{
}

uint64_t sub_10000C6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000C2EC(&qword_1000150E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C730()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C768(uint64_t a1)
{
  return sub_100009154(a1, v1);
}

void sub_10000C770()
{
}

uint64_t sub_10000C778()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000C7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100006E44(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_10000C7B8()
{
  uint64_t v1 = sub_10000D100();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_10000C85C(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10000D100() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  NSBundle v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_1000072D4(a1, a2, v2 + v6, v7);
}

uint64_t sub_10000C908(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C950()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000C990()
{
  sub_100007F58(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000C998(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000C2EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000C9FC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000CA0C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000CA68(uint64_t a1)
{
  return a1;
}

void sub_10000CABC(uint64_t a1)
{
  sub_10000994C(a1, v1, (SEL *)&selRef_redo);
}

void sub_10000CAE0(uint64_t a1)
{
  sub_10000994C(a1, v1, (SEL *)&selRef_undo);
}

uint64_t sub_10000CB04()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CB3C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000CBE8;
  return sub_100004D18();
}

uint64_t sub_10000CBE8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_10000CCDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_10000CCE4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000CCF4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CD34(uint64_t result)
{
  long long v2 = *(uint64_t (**)(uint64_t))(v1 + 16);
  if (v2) {
    return v2(result & 1);
  }
  return result;
}

uint64_t sub_10000CD68(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000CD78(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000CDB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000C2EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000CE10()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CE48(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000CBE8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100015178 + dword_100015178);
  return v6(a1, v4);
}

uint64_t sub_10000CF00()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CF38(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_10000CFCC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10000D000()
{
  return URLComponents.url.getter();
}

uint64_t sub_10000D010()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_10000D020()
{
  return URLComponents.init()();
}

uint64_t sub_10000D030()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_10000D040(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10000D050()
{
  return _convertNSErrorToError(_:)();
}

void sub_10000D060(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000D070()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D080()
{
  return URL.scheme.getter();
}

uint64_t sub_10000D090()
{
  return URL.init(string:)();
}

uint64_t sub_10000D0A0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000D0B0()
{
  return Data.description.getter();
}

NSData sub_10000D0C0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000D0D0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSUUID sub_10000D0E0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10000D0F0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D100()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000D110()
{
  return Selector.init(_:)();
}

uint64_t sub_10000D120()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000D130()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000D140()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000D150()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000D160()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10000D170()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10000D180()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_10000D190()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary sub_10000D1A0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000D1B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10000D1C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000D1D0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D1E0()
{
  return String.lowercased()()._countAndFlagsBits;
}

Swift::Int sub_10000D1F0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10000D200()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000D210()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D220()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000D230()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000D240()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000D250()
{
  return static TaskPriority.high.getter();
}

uint64_t sub_10000D260()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000D270()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000D280()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000D290()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000D2A0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10000D2B0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000D2C0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10000D2D0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10000D2E0()
{
  return static ICModelAvailabilityManager.shared.getter();
}

uint64_t sub_10000D2F0()
{
  return type metadata accessor for ICModelAvailabilityManager();
}

uint64_t sub_10000D300()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000D310()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000D320()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000D330()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_10000D340(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10000D350()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10000D360()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10000D370()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000D380()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000D390()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000D3A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000D3B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000D3C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000D3D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000D3E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000D3F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ICInternalSettingsIsAppleAccountBrandingEnabled()
{
  return _ICInternalSettingsIsAppleAccountBrandingEnabled();
}

uint64_t ICInternalSettingsIsTextKit2Enabled()
{
  return _ICInternalSettingsIsTextKit2Enabled();
}

uint64_t ICNotesAppURLScheme()
{
  return _ICNotesAppURLScheme();
}

uint64_t ICSystemPaperViewServiceBundleIdentifier()
{
  return _ICSystemPaperViewServiceBundleIdentifier();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

BOOL UIAccessibilityIsShakeToUndoEnabled(void)
{
  return _UIAccessibilityIsShakeToUndoEnabled();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
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

void method_exchangeImplementations(Method m1, Method m2)
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
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