id sub_100002FD0(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v3 = sub_100014E00();
  __chkstk_darwin(v3 - 8);
  v4 = OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_contentUnavailableView;
  v5 = (void *)sub_10000572C(0, &qword_1000221C8);
  v6 = v1;
  sub_100014DF0();
  *(void *)&v1[v4] = sub_1000151A0();
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___galleryWidthConstraint] = 0;
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___sidebarWidthConstraint] = 0;
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___searchBarHeightConstraint] = 0;
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_viewModel] = a1;
  self;
  sub_100005AC4();
  v7 = [v5 effectWithStyle:9];
  v8 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v7];

  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_backgroundMaterialView] = v8;
  v9 = objc_allocWithZone((Class)type metadata accessor for PencilActionConfigurationSearchViewController());
  v10 = sub_100005AC4();
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_searchViewController] = sub_10000D3C4(v10);
  v11 = objc_allocWithZone((Class)type metadata accessor for PencilActionConfigurationSidebarViewController());
  v12 = sub_100005AC4();
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_sidebarViewController] = sub_10000E528(v12);
  v13 = objc_allocWithZone((Class)type metadata accessor for PencilActionConfigurationGalleryViewController());
  v14 = sub_100005AC4();
  *(void *)&v6[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_galleryViewController] = sub_100006E18(v14);

  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for PencilActionConfigurationViewController();
  v15 = objc_msgSendSuper2(&v17, "initWithNibName:bundle:", 0, 0);
  swift_release();
  return v15;
}

void sub_1000031CC()
{
  sub_100014E00();
  __chkstk_darwin();
  uint64_t v1 = OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_contentUnavailableView;
  sub_10000572C(0, &qword_1000221C8);
  sub_100014DF0();
  *(void *)&v0[v1] = sub_1000151A0();
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___galleryWidthConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___sidebarWidthConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___searchBarHeightConstraint] = 0;

  sub_100015290();
  __break(1u);
}

void sub_100003310()
{
  v138.receiver = v0;
  v138.super_class = (Class)type metadata accessor for PencilActionConfigurationViewController();
  objc_msgSendSuper2(&v138, "loadView");
  sub_1000054E4((uint64_t *)&unk_100022850);
  inited = (_UNKNOWN **)swift_initStackObject();
  *((_OWORD *)inited + 1) = xmmword_100015BF0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_backgroundMaterialView];
  inited[4] = v2;
  v3 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_contentUnavailableView];
  inited[5] = v3;
  v137 = inited;
  sub_1000150F0();
  v4 = v0;
  id v5 = v2;
  id v6 = v3;
  sub_100003CBC((unint64_t)v137, v4);
  swift_bridgeObjectRelease();
  v7 = (_UNKNOWN **)swift_initStackObject();
  *((_OWORD *)v7 + 1) = xmmword_100015C00;
  v8 = *(void **)&v4[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_sidebarViewController];
  v7[4] = v8;
  v9 = *(void **)&v4[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_galleryViewController];
  v7[5] = v9;
  v10 = *(void **)&v4[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_searchViewController];
  v7[6] = v10;
  v137 = v7;
  sub_1000150F0();
  v11 = v137;
  v12 = v4;
  v13 = v8;
  v14 = v9;
  id v15 = v10;
  sub_100003DEC((unint64_t)v137, v12);
  swift_bridgeObjectRelease();
  *(void *)&v13[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_delegate
                + 8] = &off_10001D170;
  swift_unknownObjectWeakAssign();
  uint64_t v131 = (uint64_t)v14;
  *(void *)&v14[qword_100022518 + 8] = &off_10001D158;
  swift_unknownObjectWeakAssign();
  v16 = (_UNKNOWN **)swift_allocObject();
  *((_OWORD *)v16 + 1) = xmmword_100015C10;
  v16[4] = sub_1000046C0();
  id v17 = [v15 view];
  if (!v17)
  {
    __break(1u);
    goto LABEL_25;
  }
  id v18 = sub_100005A5C(v17);

  id v19 = sub_100005A10();
  if (!v19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v20 = v19;
  id v21 = [v19 MEMORY[0x5C8]];

  id v23 = sub_100005A28(v22, "constraintEqualToAnchor:");
  v16[5] = v23;
  id v24 = [v15 view];
  if (!v24)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v25 = v24;
  id v26 = [v24 leadingAnchor];

  id v27 = sub_100005A10();
  if (!v27)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v28 = v27;
  id v29 = [v27 leadingAnchor];

  id v31 = sub_100005A28(v30, "constraintEqualToAnchor:");
  v16[6] = v31;
  id v32 = [v15 view];
  if (!v32)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v33 = v32;
  id v126 = v15;
  id v34 = [v32 trailingAnchor];

  id v35 = sub_100005A10();
  if (!v35)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v36 = v35;
  v37 = self;
  v38 = (SEL *)[v36 trailingAnchor];

  id v40 = sub_100005A28(v39, "constraintEqualToAnchor:");
  v16[7] = v40;
  v137 = v16;
  sub_1000150F0();
  uint64_t v133 = sub_10000572C(0, (unint64_t *)&qword_100022248);
  sub_1000150D0();
  sub_100005AAC();
  [v37 activateConstraints:&v137];

  v41 = (__n128 *)sub_100005A78();
  sub_100005AF4(v41, v42, v43, v44, v45, v46, v47, v48, v124, (uint64_t)v126, (uint64_t)v6, v131, v133, (uint64_t)v37, v49);
  OBJC_CLASS___UIAlertController_ptr = sub_1000046A4();
  id v50 = sub_100005A94();
  if (!v50)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v51 = sub_100005A5C(v50);

  id v52 = sub_100005A10();
  if (!v52)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v53 = v52;
  id v54 = [v52 v38[185]];

  id v56 = sub_100005A28(v55, "constraintEqualToAnchor:");
  OBJC_CLASS___UIBlurEffect_ptr = v56;
  id v57 = sub_100005A94();
  if (!v57)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v58 = v57;
  id v59 = [v57 bottomAnchor];

  id v60 = sub_100005A10();
  v61 = (void *)v132;
  if (!v60)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  id v62 = sub_100005ADC(v60);

  id v64 = sub_100005A28(v63, "constraintEqualToAnchor:");
  OBJC_CLASS___UICollectionView_ptr = v64;
  id v65 = sub_100005A94();
  if (!v65)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v66 = v65;
  id v67 = [v65 leadingAnchor];

  id v68 = sub_100005A10();
  if (!v68)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v69 = v68;
  v70 = (SEL *)[v68 leadingAnchor];

  id v72 = sub_100005A28(v71, "constraintEqualToAnchor:");
  OBJC_CLASS___UICollectionViewCompositionalLayout_ptr = v72;
  v137 = NSLayoutConstraint_ptr;
  sub_1000150F0();
  sub_100005A40();
  sub_100005AAC();
  [v135 activateConstraints:&v137];

  v73 = (__n128 *)sub_100005A78();
  sub_100005AF4(v73, v74, v75, v76, v77, v78, v79, v80, v125, (uint64_t)v127, (uint64_t)v129, v132, v134, (uint64_t)v135, v81);
  OBJC_CLASS___UIAlertController_ptr = sub_100004688();
  id v82 = [v61 view];
  if (!v82)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v83 = sub_100005A5C(v82);

  id v84 = sub_100005A10();
  if (!v84)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v85 = v84;
  id v86 = [v84 v70[185]];

  id v88 = sub_100005A28(v87, "constraintEqualToAnchor:");
  OBJC_CLASS___UIBlurEffect_ptr = v88;
  id v89 = [v61 view];
  if (!v89)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  id v90 = sub_100005ADC(v89);

  id v91 = sub_100005A10();
  if (!v91)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  id v92 = sub_100005ADC(v91);

  id v94 = sub_100005A28(v93, "constraintEqualToAnchor:");
  OBJC_CLASS___UICollectionView_ptr = v94;
  id v95 = [v61 view];
  if (!v95)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v96 = v95;
  id v97 = [v95 leadingAnchor];

  id v98 = sub_100005A94();
  if (!v98)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v99 = v98;
  id v100 = [v98 trailingAnchor];

  id v102 = sub_100005A28(v101, "constraintEqualToAnchor:");
  OBJC_CLASS___UICollectionViewCompositionalLayout_ptr = v102;
  v137 = NSLayoutConstraint_ptr;
  sub_1000150F0();
  sub_100005A40();
  sub_100005AAC();
  [v136 activateConstraints:&v137];

  v103 = (_UNKNOWN **)sub_100005A78();
  *((_OWORD *)v103 + 1) = xmmword_100015C10;
  id v104 = [v130 topAnchor];
  id v105 = [v128 view];
  if (!v105)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  id v106 = sub_100005ADC(v105);

  id v107 = [v104 constraintEqualToAnchor:v106];
  v103[4] = v107;
  id v108 = [v130 bottomAnchor];
  id v109 = sub_100005A10();
  if (!v109)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v110 = v109;
  id v111 = [v109 keyboardLayoutGuide];

  id v112 = [v111 topAnchor];
  id v113 = [v108 constraintEqualToAnchor:v112];

  v103[5] = v113;
  id v114 = [v130 leadingAnchor];
  id v115 = sub_100005A10();
  if (!v115)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v116 = v115;
  id v117 = [v115 leadingAnchor];

  id v118 = [v114 constraintEqualToAnchor:v117];
  v103[6] = v118;
  id v119 = [v130 trailingAnchor];
  id v120 = sub_100005A10();
  if (v120)
  {
    v121 = v120;
    id v122 = [v120 trailingAnchor];

    id v123 = [v119 constraintEqualToAnchor:v122];
    v103[7] = v123;
    v137 = v103;
    sub_1000150F0();
    sub_100005A40();
    sub_100005AAC();
    [v136 activateConstraints:&v137];

    return;
  }
LABEL_45:
  __break(1u);
}

id sub_100003CBC(unint64_t a1, void *a2)
{
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:

    return (id)swift_bridgeObjectRelease();
  }
LABEL_12:
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000152A0();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v5 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_100015260();
    }
    else {
      id v6 = *(id *)(a1 + 8 * v5);
    }
    v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    id result = [a2 view];
    if (!result) {
      break;
    }
    v10 = result;
    [result addSubview:v7];

    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    ++v5;
    if (v8 == v4) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

id sub_100003DEC(unint64_t a1, void *a2)
{
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:

    return (id)swift_bridgeObjectRelease();
  }
LABEL_15:
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000152A0();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v5 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_100015260();
    }
    else {
      id v6 = *(id *)(a1 + 8 * v5);
    }
    v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
      goto LABEL_15;
    }
    id result = [v6 view];
    if (!result) {
      break;
    }
    v10 = result;
    id v11 = [self clearColor];
    [v10 setBackgroundColor:v11];

    id result = [v7 view];
    if (!result) {
      goto LABEL_18;
    }
    v12 = result;
    [result setTranslatesAutoresizingMaskIntoConstraints:0];

    [a2 addChildViewController:v7];
    id result = [a2 view];
    if (!result) {
      goto LABEL_19;
    }
    v13 = result;
    id result = [v7 view];
    if (!result) {
      goto LABEL_20;
    }
    v14 = result;
    [v13 addSubview:result];

    [v7 didMoveToParentViewController:a2];
    ++v5;
    if (v8 == v4) {
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_10000403C()
{
  sub_1000054E4(&qword_100022230);
  __chkstk_darwin();
  v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000054E4(&qword_100022A00);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (objc_class *)type metadata accessor for PencilActionConfigurationViewController();
  v15.receiver = v0;
  v15.super_class = v7;
  objc_msgSendSuper2(&v15, "viewDidLoad");
  sub_100014B00();
  sub_1000052F0((unint64_t *)&unk_100022A10, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerDataSource);
  swift_retain();
  uint64_t v8 = sub_100014E90();
  swift_release();
  v13[0] = v8;
  id v14 = [self mainRunLoop];
  uint64_t v9 = sub_1000151C0();
  sub_100005528((uint64_t)v2, 1, 1, v9);
  sub_100014EA0();
  sub_10000572C(0, &qword_100022238);
  sub_100005550();
  sub_100014EB0();
  sub_1000055B0((uint64_t)v2);

  swift_release();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_100005648;
  *(void *)(v11 + 24) = v10;
  sub_100005690();
  sub_100014EC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_beginAccess();
  sub_100014E80();
  swift_endAccess();
  return swift_release();
}

void sub_100004354()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = objc_retain(*(id *)(Strong
                           + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_contentUnavailableView));
    swift_retain();
    uint64_t v3 = sub_100014AE0();
    swift_release();
    uint64_t v4 = *(void *)(v3 + 16);
    swift_bridgeObjectRelease();
    [v2 setHidden:v4 != 0];
  }
}

id sub_100004458()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for PencilActionConfigurationViewController();
  objc_msgSendSuper2(&v12, "viewDidLayoutSubviews");
  sub_1000047A4();
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_backgroundMaterialView];
  id result = [v0 view];
  if (result)
  {
    uint64_t v3 = result;
    [result bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    return objc_msgSend(v1, "setFrame:", v5, v7, v9, v11);
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_1000045A4()
{
  id v1 = [self sharedProvider];
  objc_msgSend(v1, "metricsWithInterfaceOrientation:", objc_msgSend(v0, "interfaceOrientation"));
  [v1 sheetPreferredContentSizeWithMetrics:&v5];
  double v3 = v2;

  return v3;
}

id sub_100004688()
{
  return sub_1000046DC(&OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___galleryWidthConstraint, &OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_galleryViewController, (SEL *)&selRef_widthAnchor);
}

id sub_1000046A4()
{
  return sub_1000046DC(&OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___sidebarWidthConstraint, &OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_sidebarViewController, (SEL *)&selRef_widthAnchor);
}

id sub_1000046C0()
{
  return sub_1000046DC(&OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController____lazy_storage___searchBarHeightConstraint, &OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_searchViewController, (SEL *)&selRef_heightAnchor);
}

id sub_1000046DC(uint64_t *a1, void *a2, SEL *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
LABEL_5:
    id v13 = v5;
    return v6;
  }
  id result = [*(id *)(v3 + *a2) view];
  if (result)
  {
    double v9 = result;
    id v10 = [result *a3];

    id v11 = [v10 constraintEqualToConstant:0.0];
    objc_super v12 = *(void **)(v3 + v4);
    *(void *)(v3 + v4) = v11;
    id v6 = v11;

    uint64_t v5 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void sub_1000047A4()
{
  id v1 = [self sharedProvider];
  objc_msgSend(v1, "metricsWithInterfaceOrientation:", objc_msgSend(v0, "interfaceOrientation"));

  id v2 = sub_1000046C0();
  [v2 setConstant:v11];

  id v3 = sub_1000046A4();
  [v3 setConstant:v5];

  id v4 = sub_100004688();
  [v4 setConstant:v7 * (double)v6 + v8 * ((double)v6 + -1.0) + v9 + v10];
}

id sub_1000048D0()
{
  double v1 = sub_10000753C();
  sub_100004958(v1, v2, 20.0);
  double v4 = v3;
  double v5 = sub_100010DC8();
  sub_100004958(v5, v6, 20.0);
  uint64_t v8 = *(void *)(v0
                 + OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_searchViewController);
  if (v4 <= v7) {
    double v4 = v7;
  }
  id result = sub_10000D364();
  *(double *)(v8
            + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_backgroundVisibility) = v4;
  return result;
}

uint64_t sub_100004958(double a1, double a2, double a3)
{
  if (a3 >= 0.0) {
    return sub_100014CA0();
  }
  __break(1u);
  return result;
}

void sub_1000049C0(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(v2+ OBJC_IVAR____TtC34SystemActionConfigurationExtension39PencilActionConfigurationViewController_searchViewController)+ OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView) resignFirstResponder];
  sub_10000729C(a2);
}

void sub_100004A1C()
{
}

id sub_100004A74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PencilActionConfigurationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PencilActionConfigurationViewController()
{
  return self;
}

void type metadata accessor for WFSystemActionConfigurationContext(uint64_t a1)
{
}

uint64_t sub_100004BB0()
{
  uint64_t v0 = sub_100015080();
  uint64_t v2 = v1;
  if (v0 == sub_100015080() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000152E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_100004C38(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_100004C44()
{
  return 1;
}

uint64_t sub_100004C4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100004CA0()
{
  return sub_1000053CC(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004CD4(uint64_t a1, id *a2)
{
  uint64_t result = sub_100015060();
  *a2 = 0;
  return result;
}

uint64_t sub_100004D50(uint64_t a1, id *a2)
{
  char v3 = sub_100015070();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_100004DD0@<X0>(void *a1@<X8>)
{
  NSString result = sub_100004DF8();
  *a1 = result;
  return result;
}

NSString sub_100004DF8()
{
  sub_100015080();
  NSString v0 = sub_100015050();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004E30()
{
  return sub_100004BB0();
}

uint64_t sub_100004E3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001214C();
  *a1 = result;
  return result;
}

uint64_t sub_100004E64@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100004E94(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100004E94(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_100004E9C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100004ECC(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100004ECC(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_100004ED4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100004F04(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100004F04(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_100004F0C(void *a1, uint64_t *a2)
{
  return sub_100004F14(a1, *a2);
}

BOOL sub_100004F14(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_100004F40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100004F74(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_100004F74(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_100004F98@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100004FCC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_100004FCC(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_100004FE4(uint64_t *a1)
{
  return sub_100004FEC(*a1);
}

uint64_t sub_100004FEC(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_100004FFC(uint64_t *a1)
{
  return sub_100005004(*a1);
}

uint64_t sub_100005004(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_100005014(uint64_t *a1)
{
  return sub_10000501C(*a1);
}

uint64_t sub_10000501C(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_10000502C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000505C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_10000505C(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_100005064(uint64_t *a1)
{
  return sub_100005070(*a1, *v1);
}

BOOL sub_100005070(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_10000507C(uint64_t *a1)
{
  return sub_100005088(*a1, *v1);
}

BOOL sub_100005088(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_100005094(uint64_t *a1)
{
  return sub_1000050A0(*a1, *v1);
}

BOOL sub_1000050A0(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1000050AC()
{
  return sub_1000050B4(*v0);
}

BOOL sub_1000050B4(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1000050C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_1000050D8(uint64_t *a1)
{
  return sub_1000050E0(*a1);
}

uint64_t sub_1000050E0(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

uint64_t sub_1000050F0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100015050();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004BAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL sub_100005164(uint64_t *a1, uint64_t *a2)
{
  return sub_100004C38(*a1, *a2);
}

uint64_t sub_100005170@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100004C4C(a1);
  *a2 = result;
  return result;
}

void *sub_100005198@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000051A4(uint64_t a1)
{
  uint64_t v2 = sub_1000052F0(&qword_1000221B8, type metadata accessor for WFSystemActionConfigurationContext);
  uint64_t v3 = sub_1000052F0(&qword_1000221C0, type metadata accessor for WFSystemActionConfigurationContext);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005260()
{
  return sub_1000052F0(&qword_1000221A0, type metadata accessor for WFSystemActionConfigurationContext);
}

uint64_t sub_1000052A8()
{
  return sub_1000052F0(&qword_1000221A8, type metadata accessor for WFSystemActionConfigurationContext);
}

uint64_t sub_1000052F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005338()
{
  return sub_1000052F0(&qword_1000221B0, type metadata accessor for WFSystemActionConfigurationContext);
}

void *sub_100005380@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005390(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000539C()
{
  return sub_1000053CC(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000053CC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_100015080();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000540C()
{
  return sub_100005414();
}

uint64_t sub_100005414()
{
  sub_100015080();
  sub_1000150B0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005468()
{
  return sub_100005470();
}

Swift::Int sub_100005470()
{
  sub_100015080();
  sub_100015330();
  sub_1000150B0();
  Swift::Int v0 = sub_100015350();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000054E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_100005550()
{
  unint64_t result = qword_100022A20;
  if (!qword_100022A20)
  {
    sub_10000572C(255, &qword_100022238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022A20);
  }
  return result;
}

uint64_t sub_1000055B0(uint64_t a1)
{
  uint64_t v2 = sub_1000054E4(&qword_100022230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005610()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005648()
{
}

uint64_t sub_100005650()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005688(uint64_t a1)
{
  return sub_10000E0EC(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_100005690()
{
  unint64_t result = qword_100022240;
  if (!qword_100022240)
  {
    sub_1000056E4(&qword_100022A00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022240);
  }
  return result;
}

uint64_t sub_1000056E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000572C(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for ScrollPosition(uint64_t a1)
{
}

uint64_t sub_10000577C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000057B4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000057C0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000057E0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_100005820()
{
  return sub_1000052F0(&qword_100022260, type metadata accessor for ScrollPosition);
}

uint64_t sub_100005868()
{
  return sub_1000052F0(&qword_100022268, type metadata accessor for ScrollPosition);
}

uint64_t sub_1000058B0()
{
  return sub_1000052F0(&qword_100022270, type metadata accessor for ScrollPosition);
}

uint64_t sub_1000058F8()
{
  return sub_1000052F0(&qword_100022278, type metadata accessor for ScrollPosition);
}

__n128 sub_100005940(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000594C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000596C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_1000059BC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100005A10()
{
  char v3 = *(const char **)(v1 + 1384);
  return [v0 v3];
}

id sub_100005A28(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

NSArray sub_100005A40()
{
  return sub_1000150D0();
}

id sub_100005A5C(void *a1)
{
  return [a1 topAnchor];
}

uint64_t sub_100005A78()
{
  return swift_allocObject();
}

id sub_100005A94()
{
  uint64_t v3 = *(const char **)(v0 + 1384);
  return [v1 v3];
}

uint64_t sub_100005AAC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100005AC4()
{
  return swift_retain();
}

id sub_100005ADC(void *a1)
{
  uint64_t v3 = *(const char **)(v1 + 1520);
  return [a1 v3];
}

__n128 sub_100005AF4(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __n128 a15)
{
  __n128 result = a15;
  a1[1] = a15;
  return result;
}

uint64_t sub_100005B08(void *a1)
{
  uint64_t v1 = sub_1000054E4(&qword_1000224E8);
  uint64_t v2 = sub_100006D48(v1);
  __chkstk_darwin(v2);
  sub_100006CD4();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_100014C50();
  uint64_t v7 = sub_100006D48(v6);
  __chkstk_darwin(v7);
  sub_100006CD4();
  uint64_t v8 = sub_100014C30();
  uint64_t v9 = sub_100006D48(v8);
  __chkstk_darwin(v9);
  sub_100006CD4();
  uint64_t v10 = sub_1000149D0();
  uint64_t v11 = sub_100006D48(v10);
  __chkstk_darwin(v11);
  sub_100006CD4();
  uint64_t v12 = sub_100014AA0();
  sub_100006CB8();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100006CD4();
  id v18 = (void *)(v17 - v16);
  sub_100015080();
  NSString v19 = sub_100015050();
  swift_bridgeObjectRelease();
  sub_1000054E4(&qword_1000224F0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_100016040;
  id v21 = [self defaultDatabase];
  sub_100014C10();
  sub_100006D14();
  uint64_t v22 = sub_100014C00();
  uint64_t v23 = sub_100006C6C(&qword_1000224F8, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerUserLibraryDataSource);
  *(void *)(v20 + 32) = v22;
  *(void *)(v20 + 40) = v23;
  sub_100014C70();
  sub_100006D14();
  uint64_t v24 = sub_100014C60();
  uint64_t v25 = sub_100006C6C(&qword_100022500, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerPromotedActionsDataSource);
  *(void *)(v20 + 48) = v24;
  *(void *)(v20 + 56) = v25;
  *id v18 = v19;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v18, enum case for SmartShortcutPickerViewStyle.actionButton(_:), v12);
  sub_100014C90();
  sub_100006D14();
  id v26 = v19;
  uint64_t v27 = sub_100014C80();
  uint64_t v28 = sub_100006C6C(&qword_100022508, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerStaccatoSuggestionsDataSource);
  *(void *)(v20 + 64) = v27;
  *(void *)(v20 + 72) = v28;
  [objc_allocWithZone((Class)LNAutoShortcutsProvider) init];
  sub_1000149C0();
  sub_1000149F0();
  sub_100006D14();
  uint64_t v29 = sub_1000149E0();
  uint64_t v30 = sub_100006C6C(&qword_100022510, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerAppShortcutDataSource);
  *(void *)(v20 + 80) = v29;
  *(void *)(v20 + 88) = v30;
  id v31 = a1;
  sub_100014C20();
  id v32 = v31;
  sub_100014C40();
  uint64_t v33 = sub_100014A00();
  sub_100005528(v5, 1, 1, v33);
  sub_100014B00();
  sub_100006D14();
  uint64_t v34 = sub_100014AD0();

  return v34;
}

void sub_100005F04(void *a1)
{
  sub_100013ECC(a1);
  id v2 = [objc_allocWithZone((Class)WFActionButtonConfigurationEvent) init];
  id v9 = v2;
  if (a1)
  {
    id v3 = [a1 associatedBundleIdentifier];
    sub_100015080();

    NSString v4 = sub_100015050();
    swift_bridgeObjectRelease();
    [v9 setBundleIdentifier:v4];

    id v5 = [a1 identifier];
    sub_100015080();

    NSString v6 = sub_100015050();
    swift_bridgeObjectRelease();
  }
  else
  {
    [v2 setBundleIdentifier:0];
    NSString v6 = 0;
  }
  [v9 setIntentIdentifier:v6];

  if (a1)
  {
    id v7 = [a1 sectionIdentifier];
    sub_100015080();

    NSString v8 = sub_100015050();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  [v9 setSectionIdentifier:v8];

  [v9 setSuccess:a1 != 0];
  [v9 track];
}

uint64_t type metadata accessor for ActionButtonConfigurationViewModel()
{
  return self;
}

id sub_1000060F4()
{
  uint64_t v1 = sub_100014AA0();
  sub_100006CB8();
  uint64_t v3 = v2;
  uint64_t v5 = __chkstk_darwin(v4);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - v9;
  id v11 = *(id *)(v0 + 48);
  sub_100014A90();
  uint64_t v12 = *(void (**)(void))(v3 + 16);
  sub_100006D54();
  v12();
  sub_100006D54();
  v12();
  type metadata accessor for SystemActionConfigurationSelectionCoordinator();
  sub_100006D14();
  swift_retain();
  swift_retain();
  sub_10000ABF0((uint64_t)v7);
  id v13 = objc_allocWithZone((Class)sub_100014B80());
  uint64_t v14 = (void *)sub_100014B70();
  id v15 = objc_allocWithZone((Class)type metadata accessor for ActionButtonConfigurationViewController());
  id v16 = sub_1000062E0(v14);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v1);
  return v16;
}

uint64_t sub_10000628C()
{
  uint64_t v0 = sub_100013F3C();
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for ActionButtonModernConfigurationViewModel()
{
  return self;
}

id sub_1000062E0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_materialView;
  uint64_t v4 = self;
  uint64_t v5 = v1;
  id v6 = [v4 effectWithStyle:17];
  id v7 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v6];

  *(void *)&v1[v3] = v7;
  *(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_embeddedViewController] = a1;
  id v8 = a1;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for ActionButtonConfigurationViewController();
  id v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", 0, 0);

  return v9;
}

void sub_1000063C4()
{
  uint64_t v1 = OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_materialView;
  id v2 = [self effectWithStyle:17];
  id v3 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v2];

  *(void *)&v0[v1] = v3;
  sub_100015290();
  __break(1u);
}

void sub_1000064A0()
{
  v62.receiver = v0;
  v62.super_class = (Class)type metadata accessor for ActionButtonConfigurationViewController();
  objc_msgSendSuper2(&v62, "viewDidLoad");
  id v1 = sub_100006CFC();
  if (!v1)
  {
    __break(1u);
    goto LABEL_19;
  }
  id v2 = v1;
  [v1 addSubview:*(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_materialView]];

  id v3 = sub_100006CFC();
  if (!v3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  uint64_t v5 = self;
  id v6 = [v5 blackColor];
  id v7 = [v6 colorWithAlphaComponent:0.2];

  [v4 setBackgroundColor:v7];
  id v8 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_embeddedViewController];
  id v9 = sub_100006CE4();
  if (!v9)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  id v11 = sub_100006CFC();
  if (!v11)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  [v11 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v10, "setFrame:", v14, v16, v18, v20);
  id v21 = sub_100006CE4();
  if (!v21)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v22 = v21;
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = sub_100006CE4();
  if (!v23)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v24 = v23;
  id v25 = [v5 blackColor];
  id v26 = [v25 colorWithAlphaComponent:0.2];

  [v24 setBackgroundColor:v26];
  [v0 addChildViewController:v8];
  id v27 = sub_100006CFC();
  if (!v27)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v28 = v27;
  id v29 = sub_100006CE4();
  if (!v29)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v30 = v29;
  [v28 addSubview:v29];

  [v8 didMoveToParentViewController:v0];
  sub_1000054E4((uint64_t *)&unk_100022850);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_100015C10;
  id v32 = sub_100006CE4();
  if (!v32)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v33 = v32;
  id v34 = [v32 topAnchor];

  id v35 = sub_100006CFC();
  if (!v35)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v36 = v35;
  id v37 = [v35 topAnchor];

  id v38 = sub_100006D2C();
  *(void *)(v31 + 32) = v38;
  id v39 = sub_100006CE4();
  if (!v39)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v40 = v39;
  id v41 = [v39 bottomAnchor];

  id v42 = sub_100006CFC();
  if (!v42)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v43 = v42;
  id v44 = [v42 bottomAnchor];

  id v45 = sub_100006D2C();
  *(void *)(v31 + 40) = v45;
  id v46 = sub_100006CE4();
  if (!v46)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v47 = v46;
  id v48 = [v46 leadingAnchor];

  id v49 = sub_100006CFC();
  if (!v49)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  id v50 = v49;
  id v51 = [v49 leadingAnchor];

  id v52 = sub_100006D2C();
  *(void *)(v31 + 48) = v52;
  id v53 = sub_100006CE4();
  if (!v53)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v54 = v53;
  id v55 = [v53 trailingAnchor];

  id v56 = sub_100006CFC();
  if (v56)
  {
    id v57 = v56;
    v58 = self;
    id v59 = [v57 trailingAnchor];

    id v60 = [v55 constraintEqualToAnchor:v59];
    *(void *)(v31 + 56) = v60;
    sub_1000150F0();
    sub_100006C2C();
    Class isa = sub_1000150D0().super.isa;
    swift_bridgeObjectRelease();
    [v58 activateConstraints:isa];

    return;
  }
LABEL_33:
  __break(1u);
}

id sub_100006A2C()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for ActionButtonConfigurationViewController();
  objc_msgSendSuper2(&v12, "viewDidLayoutSubviews");
  id v1 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension39ActionButtonConfigurationViewController_materialView];
  id result = [v0 view];
  if (result)
  {
    id v3 = result;
    [result bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    return objc_msgSend(v1, "setFrame:", v5, v7, v9, v11);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100006B30()
{
}

id sub_100006B88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActionButtonConfigurationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActionButtonConfigurationViewController()
{
  return self;
}

unint64_t sub_100006C2C()
{
  unint64_t result = qword_100022248;
  if (!qword_100022248)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100022248);
  }
  return result;
}

uint64_t sub_100006C6C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100006CE4()
{
  id v3 = *(const char **)(v1 + 1384);
  return [v0 v3];
}

id sub_100006CFC()
{
  id v3 = *(const char **)(v1 + 1384);
  return [v0 v3];
}

uint64_t sub_100006D14()
{
  return swift_allocObject();
}

id sub_100006D2C()
{
  double v4 = *(const char **)(v2 + 1488);
  return objc_msgSend(v0, v4, v1);
}

uint64_t sub_100006D48(uint64_t a1)
{
  return a1 - 8;
}

uint64_t type metadata accessor for PencilActionConfigurationGalleryViewController()
{
  uint64_t result = qword_100022530;
  if (!qword_100022530) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006DB0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100006E18(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100014AA0();
  sub_100006CB8();
  uint64_t v5 = v4;
  uint64_t v7 = __chkstk_darwin(v6);
  double v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  *(void *)(v2 + qword_100022518 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v2 + qword_100022528) = &_swiftEmptySetSingleton;
  *(void *)(v2 + qword_100022520) = a1;
  double v10 = *(void (**)(void))(v5 + 104);
  sub_100007FE0();
  v10();
  sub_100007FE0();
  v10();
  type metadata accessor for SystemActionConfigurationSelectionCoordinator();
  swift_allocObject();
  swift_retain_n();
  swift_retain();
  sub_10000ABF0((uint64_t)v9);
  uint64_t v11 = sub_100014B70();
  swift_release();
  return v11;
}

void sub_100006F94()
{
  *(void *)&v0[qword_100022518 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[qword_100022528] = &_swiftEmptySetSingleton;

  sub_100015290();
  __break(1u);
}

void sub_100007020(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_100006F94();
}

void sub_10000703C()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for PencilActionConfigurationGalleryViewController();
  objc_msgSendSuper2(&v6, "viewDidLoad");
  id v1 = [v0 view];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 setClipsToBounds:0];

    id v3 = (void *)sub_100014BA0();
    [v3 setClipsToBounds:0];

    uint64_t v4 = (void *)sub_100014BA0();
    objc_msgSend(v4, "setContentOffset:", 0.0, 0.0);

    uint64_t v5 = (void *)sub_100014BA0();
    [v5 setDelaysContentTouches:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_100007110(void *a1)
{
  id v1 = a1;
  sub_10000703C();
}

void sub_100007158()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for PencilActionConfigurationGalleryViewController();
  objc_msgSendSuper2(&v6, "viewDidLayoutSubviews");
  id v1 = [self sharedProvider];
  objc_msgSend(v1, "metricsWithInterfaceOrientation:", objc_msgSend(v0, "interfaceOrientation"));

  uint64_t v2 = (void *)sub_100014BA0();
  [v2 contentInset];
  [v2 setContentInset:v4 + v5];

  id v3 = (void *)sub_100014BA0();
  [v3 verticalScrollIndicatorInsets];
  [v3 setVerticalScrollIndicatorInsets:v5];
}

void sub_100007254(void *a1)
{
  id v1 = a1;
  sub_100007158();
}

void sub_10000729C(uint64_t a1)
{
  sub_1000149B0();
  sub_100006CB8();
  __chkstk_darwin(v2);
  sub_100007FA0();
  swift_retain();
  uint64_t v3 = sub_100014AE0();
  swift_release();
  sub_10000E114(a1, v3);
  LOBYTE(a1) = v4;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    sub_1000149A0();
    double v5 = (void *)sub_100014BA0();
    id v6 = [v5 collectionViewLayout];

    uint64_t v7 = UICollectionElementKindSectionHeader;
    Class isa = sub_100014960().super.isa;
    id v9 = [v6 layoutAttributesForSupplementaryViewOfKind:v7 atIndexPath:isa];

    if (v9)
    {
      [v9 frame];
      double v38 = v10;
    }
    else
    {
      double v38 = 0.0;
    }
    uint64_t v11 = (void *)sub_100014BA0();
    [v11 adjustedContentInset];
    double v13 = v12;
    double v15 = v14;
    double v39 = v16;
    double v18 = v17;

    double v19 = (void *)sub_100014BA0();
    [v19 contentSize];
    double v21 = v20;

    uint64_t v22 = (void *)sub_100014BA0();
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    sub_100007F54(v24, v26, v28, v30, v13, v15, v39, v18);
    if (v21 >= v31)
    {
      if (v21 - v31 - v13 > v38) {
        double v34 = v38 - v13;
      }
      else {
        double v34 = v21 - v31 - v13;
      }
      id v35 = (void *)sub_100014BA0();
      objc_msgSend(v35, "setContentOffset:animated:", 0, v15, v34);

      uint64_t v36 = sub_100008014();
      v37(v36);
    }
    else
    {
      uint64_t v32 = sub_100008014();
      v33(v32);
    }
  }
}

double sub_10000753C()
{
  uint64_t v0 = (void *)sub_100014BA0();
  [v0 contentOffset];
  double v2 = v1;

  uint64_t v3 = (void *)sub_100014BA0();
  [v3 adjustedContentInset];
  double v5 = v4;

  id v6 = (void *)sub_100014BA0();
  [v6 adjustedContentInset];

  return v2 + v5;
}

void sub_1000075D0(uint64_t a1@<X8>)
{
  double v2 = v1;
  uint64_t v94 = sub_1000149B0();
  sub_100006CB8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  uint64_t v93 = (char *)v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&v1[qword_100022520];
  swift_retain();
  uint64_t v9 = sub_100014AE0();
  swift_release();
  uint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRelease();
  if (v10)
  {
    uint64_t v11 = (void *)sub_100014BA0();
    [v11 adjustedContentInset];

    double v12 = (void *)sub_100014BA0();
    sub_100007F88(v12);

    double v13 = (void *)sub_100014BA0();
    [v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v95.origin.x = v15;
    v95.origin.y = v17;
    v95.size.width = v19;
    v95.size.height = v21;
    CGRectGetWidth(v95);
    uint64_t v22 = (void *)sub_100014BA0();
    sub_100007F88(v22);

    double v23 = (void *)sub_100014BA0();
    sub_100007F88(v23);

    double v24 = (void *)sub_100014BA0();
    [v24 bounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v96.origin.x = v26;
    v96.origin.y = v28;
    v96.size.width = v30;
    v96.size.height = v32;
    CGRectGetHeight(v96);
    uint64_t v33 = (void *)sub_100014BA0();
    sub_100007F88(v33);

    double v34 = (void *)sub_100014BA0();
    sub_100007F88(v34);

    id v35 = (void *)sub_100014BA0();
    [v35 contentSize];
    double v37 = v36;

    double v38 = v37 - sub_100007FF4();
    double v39 = (void *)sub_100014BA0();
    [v39 contentOffset];
    double v41 = v40;

    double v42 = v38 - v41;
    uint64_t v43 = (void *)sub_100014BA0();
    sub_100007F88(v43);
    double v45 = v44;

    if (v42 - v45 < 0.0) {
      double v46 = 0.0;
    }
    else {
      double v46 = v42 - v45;
    }
    double v47 = sub_100007FF4();
    v92[0] = a1;
    if (v46 >= v47)
    {
      uint64_t v63 = (void *)sub_100014BA0();
      [v63 contentInset];
      double v57 = v64;
    }
    else
    {
      double v48 = sub_100007F68() - v46;
      double v49 = v48 / sub_100007F68();
      id v50 = [self functionWithName:kCAMediaTimingFunctionEaseIn];
      *(float *)&double v51 = v49;
      [v50 _solveForInput:v51];
      LODWORD(v49) = v52;
      id v53 = (void *)sub_100014BA0();
      [v53 contentInset];
      double v55 = v54;

      double v56 = sub_100007F68();
      double v57 = v55 + v56 * *(float *)&v49;
    }
    v92[1] = v8;
    swift_retain();
    uint64_t v65 = sub_100014AE0();
    swift_release();
    uint64_t v66 = *(void *)(v65 + 16);
    swift_bridgeObjectRelease();
    unint64_t v67 = 0;
    if (v66)
    {
      unint64_t v68 = 0;
      v69 = (void (**)(char *, uint64_t))(v5 + 8);
      while (1)
      {
        v70 = (void *)sub_100014BA0();
        id v71 = [v70 collectionViewLayout];

        id v72 = UICollectionElementKindSectionHeader;
        v73 = v93;
        sub_1000149A0();
        Class isa = sub_100014960().super.isa;
        (*v69)(v73, v94);
        id v75 = [v71 layoutAttributesForSupplementaryViewOfKind:v72 atIndexPath:isa];

        if (v75)
        {
          [v75 frame];
          CGFloat v77 = v76;
          CGFloat v79 = v78;
          CGFloat v81 = v80;
          CGFloat v83 = v82;

          v97.origin.x = v77;
          v97.origin.y = v79;
          v97.size.width = v81;
          v97.size.height = v83;
          double MinY = CGRectGetMinY(v97);
        }
        else
        {
          double MinY = 0.0;
        }
        v85 = (void *)sub_100014BA0();
        [v85 contentOffset];
        double v87 = v86;

        if (v57 + v87 <= MinY) {
          break;
        }
        unint64_t v88 = v68 + 1;
        unint64_t v67 = v68;
        unint64_t v68 = v88;
        if (v66 == v88)
        {
          unint64_t v67 = v88 - 1;
          break;
        }
      }
    }
    swift_retain();
    uint64_t v89 = sub_100014AE0();
    swift_release();
    if (v67 >= *(void *)(v89 + 16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v90 = sub_100014A70();
      uint64_t v91 = v92[0];
      (*(void (**)(void, unint64_t, uint64_t))(*(void *)(v90 - 8) + 16))(v92[0], v89+ ((*(unsigned __int8 *)(*(void *)(v90 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v90 - 8) + 80))+ *(void *)(*(void *)(v90 - 8) + 72) * v67, v90);
      swift_bridgeObjectRelease();
      sub_100005528(v91, 0, 1, v90);
      sub_100007FB8();
    }
  }
  else
  {
    sub_100014A70();
    sub_100007FB8();
    sub_100005528(v58, v59, v60, v61);
  }
}

id sub_100007B4C(void *a1)
{
  uint64_t v3 = sub_1000054E4(&qword_100022580);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100014A70();
  sub_100006CB8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100007FA0();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10000753C();
    sub_1000048D0();
    swift_unknownObjectRelease();
  }
  if (([a1 isTracking] & 1) != 0
    || ([a1 isDragging] & 1) != 0
    || (id result = [a1 isDecelerating], result))
  {
    sub_1000075D0((uint64_t)v5);
    if (sub_100007ECC((uint64_t)v5, 1, v6) == 1)
    {
      return (id)sub_100007EF4((uint64_t)v5);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1, v5, v6);
      if (swift_unknownObjectWeakLoadStrong())
      {
        sub_10000FBB8(v1);
        swift_unknownObjectRelease();
      }
      return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    }
  }
  return result;
}

void sub_100007D20(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100007B4C(v4);
}

void sub_100007D88()
{
}

uint64_t sub_100007DB8()
{
  sub_100007EA4(v0 + qword_100022518);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_100007E08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PencilActionConfigurationGalleryViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100007E40(uint64_t a1)
{
  sub_100007EA4(a1 + qword_100022518);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007E9C()
{
  return type metadata accessor for PencilActionConfigurationGalleryViewController();
}

uint64_t sub_100007EA4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100007EF4(uint64_t a1)
{
  uint64_t v2 = sub_1000054E4(&qword_100022580);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_100007F54(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a3 - (a6 + a8);
}

double sub_100007F68()
{
  uint64_t v4 = 0;
  uint64_t v5 = v3;
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  return CGRectGetHeight(*(CGRect *)&v4);
}

id sub_100007F88(void *a1)
{
  uint64_t v3 = *(const char **)(v1 + 1768);
  return [a1 v3];
}

double sub_100007FF4()
{
  uint64_t v5 = v2;
  uint64_t v6 = v3;
  uint64_t v7 = v1;
  uint64_t v8 = v4;
  return CGRectGetHeight(*(CGRect *)&v5);
}

uint64_t sub_100008014()
{
  return v0;
}

void sub_100008028()
{
}

Swift::Int sub_100008050()
{
  return sub_100015350();
}

Swift::Int sub_10000809C()
{
  return sub_100015350();
}

uint64_t sub_1000080EC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___WFSystemActionConfigurationServiceViewController_viewModel) = a1;
  return swift_release();
}

uint64_t sub_100008104(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___WFSystemActionConfigurationServiceViewController_embeddedViewController) = a1;
  return _objc_release_x1();
}

void sub_100008118()
{
  sub_10000A888();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_100014D10();
  sub_100006CB8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10000A7F8();
  *(void *)&v0[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_viewModel] = 0;
  *(void *)&v0[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_embeddedViewController] = 0;
  if (WFLogCategorySystemActionConfiguration)
  {
    sub_100014CF0();
    uint64_t v10 = sub_100014D00();
    os_log_type_t v11 = sub_100015160();
    if (os_log_type_enabled(v10, v11))
    {
      double v12 = (uint8_t *)sub_10000A830();
      *(_WORD *)double v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Creating SystemActionConfigurationServiceViewController", v12, 2u);
      sub_10000A7B8();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v0, v6);
    if (v5)
    {
      NSString v13 = sub_100015050();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v13 = 0;
    }
    v14.receiver = v1;
    v14.super_class = (Class)type metadata accessor for SystemActionConfigurationServiceViewController();
    objc_msgSendSuper2(&v14, "initWithNibName:bundle:", v13, v3);

    sub_10000A860();
  }
  else
  {
    __break(1u);
  }
}

void sub_1000082F8()
{
  *(void *)&v0[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_viewModel] = 0;
  *(void *)&v0[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_embeddedViewController] = 0;

  sub_100015290();
  __break(1u);
}

id sub_10000838C()
{
  uint64_t v1 = sub_100014D10();
  sub_100006CB8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10000A7F8();
  id result = (id)WFLogCategorySystemActionConfiguration;
  if (WFLogCategorySystemActionConfiguration)
  {
    sub_100014CF0();
    uint64_t v6 = sub_100014D00();
    os_log_type_t v7 = sub_100015160();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)sub_10000A830();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Destroying SystemActionConfigurationServiceViewController", v8, 2u);
      sub_10000A7B8();
    }

    (*(void (**)(void *, uint64_t))(v3 + 8))(v0, v1);
    v9.receiver = v0;
    v9.super_class = (Class)type metadata accessor for SystemActionConfigurationServiceViewController();
    return objc_msgSendSuper2(&v9, "dealloc");
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100008528()
{
  uint64_t v1 = v0;
  v44.receiver = v0;
  v44.super_class = (Class)type metadata accessor for SystemActionConfigurationServiceViewController();
  objc_msgSendSuper2(&v44, "viewDidLoad");
  uint64_t v2 = *(void *)&v0[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_viewModel];
  if (v2)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 176);
    uint64_t v4 = swift_retain();
    uint64_t v5 = (void *)v3(v4);
    id v6 = sub_10000A8F4();
    if (v6)
    {
      os_log_type_t v7 = v6;
      id v8 = sub_10000A848();
      if (v8)
      {
        objc_super v9 = v8;
        [v7 addSubview:v8];

        [v1 addChildViewController:v5];
        [v5 didMoveToParentViewController:v1];
        id v10 = sub_10000A848();
        if (v10)
        {
          os_log_type_t v11 = v10;
          [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

          sub_1000054E4((uint64_t *)&unk_100022850);
          uint64_t v12 = swift_allocObject();
          *(_OWORD *)(v12 + 16) = xmmword_100015C10;
          id v13 = sub_10000A848();
          if (v13)
          {
            objc_super v14 = v13;
            id v15 = [v13 topAnchor];

            id v16 = sub_10000A8F4();
            if (v16)
            {
              CGFloat v17 = v16;
              id v18 = [v16 topAnchor];

              id v19 = sub_10000A8A0();
              *(void *)(v12 + 32) = v19;
              id v20 = sub_10000A848();
              if (v20)
              {
                CGFloat v21 = v20;
                id v22 = [v20 bottomAnchor];

                id v23 = sub_10000A8F4();
                if (v23)
                {
                  double v24 = v23;
                  id v25 = [v23 bottomAnchor];

                  id v26 = sub_10000A8A0();
                  *(void *)(v12 + 40) = v26;
                  id v27 = sub_10000A848();
                  if (v27)
                  {
                    CGFloat v28 = v27;
                    id v29 = [v27 leadingAnchor];

                    id v30 = sub_10000A8F4();
                    if (v30)
                    {
                      double v31 = v30;
                      id v32 = [v30 leadingAnchor];

                      id v33 = sub_10000A8A0();
                      *(void *)(v12 + 48) = v33;
                      id v34 = sub_10000A848();
                      if (v34)
                      {
                        id v35 = v34;
                        id v36 = [v34 trailingAnchor];

                        id v37 = sub_10000A8F4();
                        if (v37)
                        {
                          double v38 = v37;
                          double v39 = self;
                          id v40 = [v38 trailingAnchor];

                          id v41 = [v36 constraintEqualToAnchor:v40];
                          *(void *)(v12 + 56) = v41;
                          sub_1000150F0();
                          sub_10000572C(0, (unint64_t *)&qword_100022248);
                          Class isa = sub_1000150D0().super.isa;
                          swift_bridgeObjectRelease();
                          [v39 activateConstraints:isa];

                          [v5 preferredContentSize];
                          objc_msgSend(v1, "setPreferredContentSize:");
                          id v43 = v5;
                          sub_100008104((uint64_t)v5);
                          swift_release();

                          return;
                        }
LABEL_25:
                        __break(1u);
                        return;
                      }
LABEL_24:
                      __break(1u);
                      goto LABEL_25;
                    }
LABEL_23:
                    __break(1u);
                    goto LABEL_24;
                  }
LABEL_22:
                  __break(1u);
                  goto LABEL_23;
                }
LABEL_21:
                __break(1u);
                goto LABEL_22;
              }
LABEL_20:
              __break(1u);
              goto LABEL_21;
            }
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
LABEL_18:
          __break(1u);
          goto LABEL_19;
        }
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_17;
  }
}

id sub_10000899C(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for SystemActionConfigurationServiceViewController();
  return objc_msgSendSuper2(&v4, "viewWillAppear:", a1 & 1);
}

id sub_100008A34()
{
  uint64_t v1 = (objc_class *)type metadata accessor for SystemActionConfigurationServiceViewController();
  v5.receiver = v0;
  v5.super_class = v1;
  objc_msgSendSuper2(&v5, "viewDidLayoutSubviews");
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_embeddedViewController];
  if (v2)
  {
    [v2 preferredContentSize];
  }
  else
  {
    v4.receiver = v0;
    v4.super_class = v1;
    objc_msgSendSuper2(&v4, "preferredContentSize");
  }
  return objc_msgSend(v0, "setPreferredContentSize:");
}

void *sub_100008B00(void *a1)
{
  sub_100015080();
  if (v2 == sub_10000A8D8() && v1 == v4) {
    goto LABEL_17;
  }
  uint64_t v6 = sub_10000A7D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_18:
    type metadata accessor for ActionButtonModernConfigurationViewModel();
    goto LABEL_19;
  }
  sub_100015080();
  if (v6 == sub_10000A8D8() && v1 == v7)
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  uint64_t v9 = sub_10000A7D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_18;
  }
  sub_100015080();
  if (v9 == sub_10000A8D8() && v1 == v10)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  char v12 = sub_10000A7D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_21:
    type metadata accessor for PencilActionConfigurationViewModel();
    goto LABEL_19;
  }
  type metadata accessor for SystemActionConfigurationViewModel();
LABEL_19:
  swift_allocObject();
  return sub_100014060((uint64_t)a1);
}

void sub_100008C2C()
{
  sub_10000A888();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_100014D10();
  sub_100006CB8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_10000A7F8();
  if (WFLogCategorySystemActionConfiguration)
  {
    sub_100014CF0();
    id v8 = v3;
    uint64_t v9 = sub_100014D00();
    os_log_type_t v10 = sub_100015160();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v15 = v6;
      os_log_type_t v11 = (uint8_t *)sub_10000A90C();
      objc_super v14 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v11 = 138412290;
      char v12 = v8;
      uint64_t v1 = v0;
      sub_1000151E0();
      void *v14 = v8;

      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Host send selected action: %@", v11, 0xCu);
      sub_1000054E4(&qword_100022640);
      swift_arrayDestroy();
      sub_10000A7B8();
      uint64_t v6 = v15;
      sub_10000A7B8();
    }
    else
    {

      uint64_t v9 = v8;
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
    if (*(void *)(v1 + OBJC_IVAR___WFSystemActionConfigurationServiceViewController_viewModel))
    {
      id v13 = v8;
      swift_retain();
      sub_100013F74(v8);
      swift_release();
    }
    sub_10000A860();
  }
  else
  {
    __break(1u);
  }
}

void sub_100008E78()
{
  sub_10000A888();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_100014D10();
  sub_100006CB8();
  uint64_t v6 = v5;
  uint64_t v8 = __chkstk_darwin(v7);
  v70 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  char v12 = (char *)v64 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)v64 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  v69 = (char *)v64 - v17;
  __chkstk_darwin(v16);
  if (WFLogCategorySystemActionConfiguration)
  {
    uint64_t v68 = WFLogCategorySystemActionConfiguration;
    sub_100014CF0();
    id v18 = v3;
    id v19 = sub_100014D00();
    os_log_type_t v20 = sub_100015160();
    BOOL v21 = os_log_type_enabled(v19, v20);
    id v71 = v18;
    unint64_t v67 = v12;
    if (v21)
    {
      uint64_t v65 = v6;
      uint64_t v22 = sub_10000A90C();
      uint64_t v66 = v4;
      id v23 = (uint8_t *)v22;
      double v24 = (void *)swift_slowAlloc();
      *(_DWORD *)id v23 = 138412290;
      *(void *)&long long v74 = v71;
      id v25 = v71;
      v64[1] = v15;
      id v26 = v25;
      uint64_t v6 = v65;
      id v18 = v71;
      sub_1000151E0();
      *double v24 = v18;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Starting remote System Action Configuration request with context: %@", v23, 0xCu);
      sub_1000054E4(&qword_100022640);
      swift_arrayDestroy();
      sub_10000A7B8();
      uint64_t v4 = v66;
      sub_10000A7B8();
    }
    else
    {

      id v19 = v18;
    }

    id v29 = *(void (**)(void))(v6 + 8);
    uint64_t v27 = v6 + 8;
    CGFloat v28 = v29;
    sub_10000A878();
    v29();
    id v30 = (objc_class *)type metadata accessor for SystemActionConfigurationServiceViewController();
    v78.receiver = v0;
    v78.super_class = v30;
    objc_msgSendSuper2(&v78, "beginRequestWithExtensionContext:", v18);
    sub_100014CF0();
    double v31 = (void *)sub_100014D00();
    os_log_type_t v32 = sub_100015160();
    if (sub_10000A8BC(v32))
    {
      *(_WORD *)sub_10000A830() = 0;
      sub_10000A810((void *)&_mh_execute_header, v33, v34, "Initializing process for System Action Configuration");
      sub_10000A7B8();
    }

    sub_10000A878();
    v28();
    [self initializeProcessWithDatabase:1];
    sub_100014CF0();
    id v35 = (void *)sub_100014D00();
    os_log_type_t v36 = sub_100015160();
    if (sub_10000A8BC(v36))
    {
      *(_WORD *)sub_10000A830() = 0;
      sub_10000A810((void *)&_mh_execute_header, v37, v38, "Initialized process for System Action Configuration");
      sub_10000A7B8();
    }

    sub_10000A878();
    v28();
    id v39 = [v71 inputItems];
    uint64_t v40 = sub_1000150E0();

    sub_10000E2E0(v40, &v74);
    swift_bridgeObjectRelease();
    if (!v75)
    {
      sub_10000A50C((uint64_t)&v74);
      goto LABEL_22;
    }
    sub_10000572C(0, &qword_100022648);
    if (swift_dynamicCast())
    {
      id v41 = v1;
      double v42 = (void *)v76;
      uint64_t v43 = sub_10000A56C((void *)v76);
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v72 = sub_100015080();
        uint64_t v73 = v45;
        sub_100015240();
        sub_10000E300((uint64_t)&v74, v44, &v76);
        sub_10000A5D8((uint64_t)&v74);
        swift_bridgeObjectRelease();
        if (*((void *)&v77 + 1))
        {
          type metadata accessor for WFSystemActionConfigurationContext(0);
          if (swift_dynamicCast())
          {
            double v46 = (void *)v74;
            double v47 = sub_100008B00((void *)v74);
            sub_1000080EC((uint64_t)v47);
            uint64_t v48 = *(void *)&v41[OBJC_IVAR___WFSystemActionConfigurationServiceViewController_viewModel];
            if (v48)
            {
              *(void *)(v48 + 24) = &off_10001D380;
              swift_unknownObjectWeakAssign();
            }
            double v49 = v67;
            sub_100014CF0();
            id v50 = v46;
            double v51 = sub_100014D00();
            os_log_type_t v52 = sub_100015160();
            if (os_log_type_enabled(v51, v52))
            {
              uint64_t v53 = sub_10000A90C();
              uint64_t v66 = v4;
              double v54 = (uint8_t *)v53;
              uint64_t v55 = swift_slowAlloc();
              uint64_t v65 = v27;
              *(void *)&long long v74 = v55;
              *(_DWORD *)double v54 = 136315138;
              id v71 = (v54 + 4);
              *(void *)&long long v76 = v50;
              id v56 = v50;
              uint64_t v57 = sub_100015090();
              *(void *)&long long v76 = sub_10000C940(v57, v58, (uint64_t *)&v74);
              sub_1000151E0();

              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v51, v52, "Configuring System Action Picker for context: %s", v54, 0xCu);
              swift_arrayDestroy();
              sub_10000A7B8();
              sub_10000A7B8();

              ((void (*)(char *, uint64_t))v28)(v67, v66);
LABEL_26:
              sub_10000A860();
              return;
            }

            uint64_t v63 = v49;
LABEL_25:
            ((void (*)(char *, uint64_t))v28)(v63, v4);
            goto LABEL_26;
          }

          goto LABEL_22;
        }
      }
      else
      {
        long long v76 = 0u;
        long long v77 = 0u;
      }

      sub_10000A50C((uint64_t)&v76);
    }
LABEL_22:
    sub_100014CF0();
    uint64_t v59 = (void *)sub_100014D00();
    os_log_type_t v60 = sub_100015150();
    if (sub_10000A8BC(v60))
    {
      *(_WORD *)sub_10000A830() = 0;
      sub_10000A810((void *)&_mh_execute_header, v61, v62, "Failed to decode context for System Action Picker");
      sub_10000A7B8();
    }

    uint64_t v63 = v70;
    goto LABEL_25;
  }
  __break(1u);
}

void sub_100009588()
{
  sub_10000A888();
  uint64_t v1 = v0;
  uint64_t v2 = sub_100014D10();
  sub_100006CB8();
  uint64_t v4 = v3;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - v9;
  if (WFLogCategorySystemActionConfiguration)
  {
    sub_100014CF0();
    uint64_t v11 = sub_100014D00();
    os_log_type_t v12 = sub_100015160();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)sub_10000A830();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Connecting to host process", v13, 2u);
      sub_10000A7B8();
    }

    uint64_t v14 = *(void (**)(char *, uint64_t))(v4 + 8);
    v14(v10, v2);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v1;
    v31[4] = sub_10000A434;
    v31[5] = v15;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 1107296256;
    v31[2] = sub_100009C14;
    v31[3] = &unk_10001D3F0;
    uint64_t v16 = _Block_copy(v31);
    id v17 = v1;
    swift_release();
    id v18 = [v17 _remoteViewControllerProxyWithErrorHandler:v16];
    _Block_release(v16);
    if (v18)
    {
      sub_100015200();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
    }
    sub_10000A43C((uint64_t)&v29, (uint64_t)v31);
    sub_100014CF0();
    sub_10000A4A4((uint64_t)v31, (uint64_t)&v29);
    id v19 = sub_100014D00();
    os_log_type_t v20 = sub_100015160();
    if (os_log_type_enabled(v19, v20))
    {
      BOOL v21 = (uint8_t *)sub_10000A90C();
      uint64_t v22 = swift_slowAlloc();
      id v26 = v14;
      uint64_t v28 = v22;
      *(_DWORD *)BOOL v21 = 136315138;
      sub_1000054E4((uint64_t *)&unk_1000229B0);
      uint64_t v23 = sub_1000151D0();
      uint64_t v27 = sub_10000C940(v23, v24, &v28);
      sub_1000151E0();
      swift_bridgeObjectRelease();
      sub_10000A50C((uint64_t)&v29);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Connected to host process with: %s", v21, 0xCu);
      swift_arrayDestroy();
      sub_10000A7B8();
      sub_10000A7B8();

      v26(v8, v2);
    }
    else
    {
      sub_10000A50C((uint64_t)&v29);

      v14(v8, v2);
    }
    sub_10000A43C((uint64_t)v31, (uint64_t)&v29);
    if (*((void *)&v30 + 1))
    {
      sub_1000054E4(&qword_100022638);
      swift_dynamicCast();
    }
    else
    {
      sub_10000A50C((uint64_t)&v29);
    }
    sub_10000A860();
  }
  else
  {
    __break(1u);
  }
}

void sub_100009954(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100014D10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!WFLogCategorySystemActionConfiguration) {
    __break(1u);
  }
  sub_100014CF0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_100014D00();
  os_log_type_t v9 = sub_100015150();
  if (os_log_type_enabled(v8, v9))
  {
    id v17 = a2;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    if (a1)
    {
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v18 = v12;
      sub_1000151E0();
    }
    else
    {
      uint64_t v18 = 0;
      sub_1000151E0();
      uint64_t v12 = 0;
    }
    *uint64_t v11 = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Connection interrupted to system action configuration host process: %@", v10, 0xCu);
    sub_1000054E4(&qword_100022640);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    a2 = v17;
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v13 = [a2 extensionContext];
  if (v13)
  {
    if (a1)
    {
      uint64_t v14 = v13;
      uint64_t v15 = (void *)sub_100014940();
      [v14 cancelRequestWithError:v15];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100009C14(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100009C80()
{
  uint64_t v0 = (void *)WFSystemActionConfigurationServiceXPCInterface();
  return v0;
}

id sub_100009CD4()
{
  uint64_t v0 = (void *)WFSystemActionConfigurationHostXPCInterface();
  return v0;
}

uint64_t type metadata accessor for SystemActionConfigurationServiceViewController()
{
  return self;
}

void sub_100009D4C(uint64_t a1)
{
  id v3 = [v1 presentingViewController];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 nextResponder];

    [v5 resignFirstResponder];
  }
  sub_100009588();
  if (v6)
  {
    [v6 didSelectSystemAction:a1];
    swift_unknownObjectRelease();
  }
}

void sub_100009E04()
{
  sub_100009588();
  if (v0)
  {
    uint64_t v1 = v0;
    sub_10000A3B0();
    swift_allocError();
    uint64_t v2 = (void *)sub_100014940();
    swift_errorRelease();
    [v1 didCancelSystemActionConfiguration:v2];

    swift_unknownObjectRelease();
  }
}

void sub_100009EA0()
{
  uint64_t v1 = v0;
  sub_10000572C(0, &qword_100022620);
  sub_1000150A0();
  sub_1000150A0();
  if (qword_100022110 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)static NSBundle._current;
  NSString v3 = sub_100015050();
  NSString v4 = sub_100015050();
  swift_bridgeObjectRelease();
  NSString v5 = sub_100015050();
  swift_bridgeObjectRelease();
  id v6 = [v2 localizedStringForKey:v3 value:v4 table:v5];

  uint64_t v7 = sub_100015080();
  uint64_t v9 = v8;

  id v10 = sub_10000A170(0, 0, v7, v9, 1);
  sub_10000572C(0, &qword_100022628);
  sub_1000150A0();
  sub_1000150A0();
  uint64_t v11 = (void *)static NSBundle._current;
  NSString v12 = sub_100015050();
  NSString v13 = sub_100015050();
  swift_bridgeObjectRelease();
  NSString v14 = sub_100015050();
  swift_bridgeObjectRelease();
  id v15 = [v11 localizedStringForKey:v12 value:v13 table:v14];

  uint64_t v16 = sub_100015080();
  uint64_t v18 = v17;

  id v19 = sub_10000A228(v16, v18, 0, 0, 0);
  [v10 addAction:v19];

  id v20 = [v1 presentedViewController];
  if (!v20) {
    id v20 = v1;
  }
  id v21 = v20;
  [v20 presentViewController:v10 animated:1 completion:0];
}

id sub_10000A170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    NSString v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    NSString v8 = 0;
    goto LABEL_6;
  }
  NSString v7 = sub_100015050();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v8 = sub_100015050();
  swift_bridgeObjectRelease();
LABEL_6:
  id v9 = [(id)swift_getObjCClassFromMetadata() alertControllerWithTitle:v7 message:v8 preferredStyle:a5];

  return v9;
}

id sub_10000A228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    NSString v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    id v9 = 0;
    goto LABEL_6;
  }
  NSString v8 = sub_100015050();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000A330;
  v12[3] = &unk_10001D3A0;
  id v9 = _Block_copy(v12);
  swift_release();
LABEL_6:
  id v10 = [(id)swift_getObjCClassFromMetadata() actionWithTitle:v8 style:a3 handler:v9];
  _Block_release(v9);

  return v10;
}

void sub_10000A330(uint64_t a1, void *a2)
{
  NSString v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000A398(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A3A8()
{
  return swift_release();
}

unint64_t sub_10000A3B0()
{
  unint64_t result = qword_100022630;
  if (!qword_100022630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022630);
  }
  return result;
}

uint64_t sub_10000A3FC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000A434(uint64_t a1)
{
  sub_100009954(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000A43C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000054E4((uint64_t *)&unk_1000229B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000054E4((uint64_t *)&unk_1000229B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A50C(uint64_t a1)
{
  uint64_t v2 = sub_1000054E4((uint64_t *)&unk_1000229B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A56C(void *a1)
{
  id v1 = [a1 userInfo];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100015030();

  return v3;
}

uint64_t sub_10000A5D8(uint64_t a1)
{
  return a1;
}

uint64_t getEnumTagSinglePayload for PencilActionConfigurationSidebarViewController.Section(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SystemActionConfigurationServiceViewController.Error(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10000A71CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000A744()
{
  return 0;
}

ValueMetadata *type metadata accessor for SystemActionConfigurationServiceViewController.Error()
{
  return &type metadata for SystemActionConfigurationServiceViewController.Error;
}

unint64_t sub_10000A764()
{
  unint64_t result = qword_100022650;
  if (!qword_100022650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022650);
  }
  return result;
}

uint64_t sub_10000A7B8()
{
  return swift_slowDealloc();
}

uint64_t sub_10000A7D0()
{
  return sub_1000152E0();
}

void sub_10000A810(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t sub_10000A830()
{
  return swift_slowAlloc();
}

id sub_10000A848()
{
  int v3 = *(const char **)(v1 + 1384);
  return [v0 v3];
}

id sub_10000A8A0()
{
  unsigned int v4 = *(const char **)(v2 + 1488);
  return objc_msgSend(v0, v4, v1);
}

BOOL sub_10000A8BC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000A8D8()
{
  return sub_100015080();
}

id sub_10000A8F4()
{
  uint64_t v3 = *(const char **)(v1 + 1384);
  return [v0 v3];
}

uint64_t sub_10000A90C()
{
  return swift_slowAlloc();
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result) {
      return sub_1000150A0();
    }
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return sub_1000150A0();
  }
  if (result >> 11 == 27) {
    goto LABEL_14;
  }
  if (WORD1(result) > 0x10u) {
    goto LABEL_11;
  }
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF) {
    return sub_1000150A0();
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t *NSBundle._current.unsafeMutableAddressor()
{
  if (qword_100022110 != -1) {
    swift_once();
  }
  return &static NSBundle._current;
}

id sub_10000AA80()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  static NSBundle._current = (uint64_t)result;
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_100022110 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static NSBundle._current;
  return v0;
}

uint64_t sub_10000AB34()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

uint64_t type metadata accessor for SystemActionConfigurationSelectionCoordinator()
{
  uint64_t result = qword_1000226F0;
  if (!qword_1000226F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000ABB0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10000ABF0(uint64_t a1)
{
  uint64_t v2 = sub_100014AA0();
  sub_100006CB8();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_retain();
  uint64_t v7 = sub_100014BC0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
  return v7;
}

uint64_t sub_10000ACF8(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v2 = sub_100014B40();
  uint64_t v20 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v21 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100014A80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  NSString v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000054E4(&qword_100022740);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100015140();
  sub_100005528((uint64_t)v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v22, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v2);
  sub_100015120();
  swift_retain();
  uint64_t v13 = sub_100015110();
  unint64_t v14 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v15 = (v7 + *(unsigned __int8 *)(v3 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v16 = (v4 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  *(void *)(v17 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v14, v8, v5);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v15, v21, v20);
  *(void *)(v17 + v16) = v19[1];
  sub_10000C45C((uint64_t)v11, (uint64_t)&unk_100022750, v17);
  return swift_release();
}

void sub_10000AFB0()
{
}

uint64_t sub_10000AFE0()
{
  uint64_t v0 = sub_100014BD0();
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_10000B010()
{
  return type metadata accessor for SystemActionConfigurationSelectionCoordinator();
}

uint64_t sub_10000B020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  uint64_t v7 = sub_100014BF0();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  uint64_t v8 = sub_100014D10();
  v6[11] = v8;
  v6[12] = *(void *)(v8 - 8);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  sub_1000054E4(&qword_100022768);
  v6[15] = swift_task_alloc();
  uint64_t v9 = sub_100014A30();
  v6[16] = v9;
  v6[17] = *(void *)(v9 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = swift_task_alloc();
  uint64_t v10 = sub_100014BB0();
  v6[20] = v10;
  v6[21] = *(void *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  uint64_t v11 = sub_100014B60();
  v6[25] = v11;
  v6[26] = *(void *)(v11 - 8);
  v6[27] = swift_task_alloc();
  uint64_t v12 = sub_100014A80();
  v6[28] = v12;
  v6[29] = *(void *)(v12 - 8);
  v6[30] = swift_task_alloc();
  sub_100015120();
  v6[31] = sub_100015110();
  uint64_t v14 = sub_100015100();
  v6[32] = v14;
  v6[33] = v13;
  return _swift_task_switch(sub_10000B350, v14, v13);
}

uint64_t sub_10000B350()
{
  uint64_t v2 = v0[29];
  uint64_t v1 = v0[30];
  uint64_t v3 = v0[28];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[5], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == enum case for SmartShortcutPickerSelection.workflow(_:))
  {
    uint64_t v5 = (id *)v0[30];
    uint64_t v6 = v0[28];
    uint64_t v7 = v0[29];
    uint64_t v8 = v0[21];
    uint64_t v9 = (uint64_t *)v0[22];
    uint64_t v10 = v0[20];
    swift_release();
    (*(void (**)(id *, uint64_t))(v7 + 96))(v5, v6);
    id v41 = *v5;
    id v11 = [*v5 name];
    uint64_t v12 = sub_100015080();
    uint64_t v14 = v13;

    uint64_t *v9 = v12;
    v9[1] = v14;
    v9[2] = (uint64_t)&_swiftEmptyArrayStorage;
    (*(void (**)(uint64_t *, void, uint64_t))(v8 + 104))(v9, enum case for SmartShortcutPickerActionConfiguration.formed(_:), v10);
    sub_100014B30();
    sub_100014BE0();
    sub_100014930();
    swift_allocObject();
    sub_100014920();
    sub_10000C8F0();
    uint64_t v31 = sub_100014910();
    unint64_t v33 = v32;
    uint64_t v34 = v0[7];
    id v35 = objc_allocWithZone((Class)WFConfiguredSystemWorkflowAction);
    id v42 = v41;
    sub_10000D0F8(v31, v33);
    id v36 = sub_10000C5CC(v42, v31, v33);
    (*(void (**)(void))(*(void *)v34 + 192))();
    swift_release();

    sub_10000D150(v31, v33);
    uint64_t v37 = sub_10000D328();
    v38(v37);
LABEL_8:
    sub_10000D2E0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10000D31C();
    return v39();
  }
  if (v4 != enum case for SmartShortcutPickerSelection.actionTemplate(_:))
  {
    uint64_t v28 = v0[7];
    swift_release();
    (*(void (**)(void))(*(void *)v28 + 192))(0);
    uint64_t v29 = sub_10000D350();
    v30(v29);
    goto LABEL_8;
  }
  uint64_t v15 = v0[30];
  uint64_t v16 = v0[27];
  uint64_t v17 = v0[25];
  uint64_t v18 = v0[26];
  uint64_t v19 = v0[24];
  uint64_t v20 = v0[20];
  uint64_t v21 = v0[21];
  (*(void (**)(uint64_t, void))(v0[29] + 96))(v15, v0[28]);
  uint64_t v22 = v15 + *(int *)(sub_1000054E4(&qword_100022780) + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v16, v15, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v19, v22, v20);
  sub_100014B30();
  uint64_t v23 = sub_100014B20();
  v0[34] = v23;
  sub_100014B10();
  unint64_t v24 = (void *)swift_task_alloc();
  v0[35] = v24;
  *unint64_t v24 = v0;
  v24[1] = sub_10000B964;
  uint64_t v25 = v0[24];
  uint64_t v26 = v0[19];
  uint64_t v27 = v0[15];
  return SmartShortcutPickerActionTemplate.asSystemAction(with:sectionIdentifier:iconOverride:colorScheme:)(v25, v26, v23, v27);
}

uint64_t sub_10000B964(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 288) = a1;
  *(void *)(v4 + 296) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 152);
  uint64_t v6 = *(void *)(v3 + 136);
  uint64_t v7 = *(void *)(v3 + 128);
  uint64_t v8 = *(void *)(v3 + 120);

  sub_10000D1A8(v8, &qword_100022768);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v9 = *(void *)(v3 + 264);
  uint64_t v10 = *(void *)(v3 + 256);
  if (v1) {
    id v11 = sub_10000BE7C;
  }
  else {
    id v11 = sub_10000BB48;
  }
  return _swift_task_switch(v11, v10, v9);
}

uint64_t sub_10000BB48()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  swift_release();
  sub_100014CF0();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v5(v1, v2, v3);
  uint64_t v6 = sub_100014D00();
  os_log_type_t v7 = sub_100015160();
  if (os_log_type_enabled(v6, v7))
  {
    log = v6;
    uint64_t v9 = *(void *)(v0 + 176);
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v11 = *(void *)(v0 + 160);
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v28 = *(void *)(v0 + 96);
    uint64_t v29 = *(void *)(v0 + 88);
    uint64_t v30 = *(void *)(v0 + 112);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v33 = v26;
    v5(v9, v8, v11);
    uint64_t v13 = sub_100015090();
    *(void *)(v0 + 32) = sub_10000C940(v13, v14, &v33);
    sub_1000151E0();
    swift_bridgeObjectRelease();
    unint64_t v32 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v32(v8, v11);
    _os_log_impl((void *)&_mh_execute_header, log, v7, "User configured entry for Action Button: %s", v12, 0xCu);
    swift_arrayDestroy();
    sub_10000A7B8();
    sub_10000A7B8();

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
  }
  else
  {
    unint64_t v32 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 168) + 8);
    v32(*(void *)(v0 + 184), *(void *)(v0 + 160));

    uint64_t v15 = sub_10000D350();
    v16(v15);
  }
  uint64_t v17 = *(void **)(v0 + 288);
  uint64_t v18 = *(void *)(v0 + 208);
  uint64_t v31 = *(void *)(v0 + 216);
  uint64_t v20 = *(void *)(v0 + 192);
  uint64_t v19 = *(void *)(v0 + 200);
  uint64_t v21 = *(void *)(v0 + 160);
  uint64_t v22 = *(void (**)(void *))(**(void **)(v0 + 56) + 192);
  id v23 = v17;
  v22(v17);

  v32(v20, v21);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v31, v19);
  sub_10000D2E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000D31C();
  return v24();
}

uint64_t sub_10000BE7C()
{
  id v23 = v0;
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[21];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = v0[37];
  sub_100014CF0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_100014D00();
  os_log_type_t v9 = sub_100015150();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = v0[12];
    uint64_t v20 = v0[11];
    uint64_t v21 = v0[13];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v22 = v12;
    v0[2] = v7;
    swift_errorRetain();
    sub_1000054E4(&qword_100022778);
    uint64_t v13 = sub_100015090();
    v0[3] = sub_10000C940(v13, v14, &v22);
    sub_1000151E0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to construct selected action due to: %s", v11, 0xCu);
    swift_arrayDestroy();
    sub_10000A7B8();
    sub_10000A7B8();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v21, v20);
  }
  else
  {
    uint64_t v16 = v0[12];
    uint64_t v15 = v0[13];
    uint64_t v17 = v0[11];
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  sub_100014008();
  swift_errorRelease();
  sub_10000D2E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000D31C();
  return v18();
}

uint64_t sub_10000C13C()
{
  uint64_t v1 = sub_100014A80();
  sub_100006CB8();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_100014B40();
  sub_100006CB8();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v5 + v7 + v13) & ~v13;
  uint64_t v15 = v4 | v13 | 7;
  unint64_t v16 = ((*(void *)(v12 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);
  swift_release();
  return _swift_deallocObject(v0, v16, v15);
}

uint64_t sub_10000C258(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100014A80();
  sub_10000D304(v5);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = sub_100014B40();
  sub_10000D304(v10);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  unint64_t v15 = (v7 + v9 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = *(void *)(v1 + 16);
  uint64_t v17 = *(void *)(v1 + 24);
  uint64_t v18 = v1 + v7;
  uint64_t v19 = v1 + v15;
  uint64_t v20 = *(void *)(v1 + ((*(void *)(v14 + 64) + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v21;
  *uint64_t v21 = v3;
  v21[1] = sub_10000C398;
  return sub_10000B020(a1, v16, v17, v18, v19, v20);
}

uint64_t sub_10000C398()
{
  sub_10000D2C8();
  uint64_t v1 = *v0;
  sub_10000D340();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000D31C();
  return v3();
}

uint64_t sub_10000C45C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015140();
  if (sub_100007ECC(a1, 1, v6) == 1)
  {
    sub_10000D1A8(a1, &qword_100022740);
  }
  else
  {
    sub_100015130();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100015100();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

id sub_10000C5CC(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100014950().super.isa;
    sub_10000D204(a2, a3);
  }
  id v8 = [v3 initWithWorkflow:a1 shortcutsMetadata:isa];

  return v8;
}

uint64_t sub_10000C65C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000C738;
  return v6(a1);
}

uint64_t sub_10000C738()
{
  sub_10000D2C8();
  uint64_t v1 = *v0;
  sub_10000D340();
  void *v2 = v1;
  swift_task_dealloc();
  sub_10000D31C();
  return v3();
}

uint64_t sub_10000C800()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C838(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000C398;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100022758 + dword_100022758);
  return v6(a1, v4);
}

unint64_t sub_10000C8F0()
{
  unint64_t result = qword_100022770;
  if (!qword_100022770)
  {
    sub_100014BF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022770);
  }
  return result;
}

uint64_t sub_10000C940(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000CA14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D268((uint64_t)v12, *a3);
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
      sub_10000D268((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D218((uint64_t)v12);
  return v7;
}

uint64_t sub_10000CA14(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000CB6C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1000151F0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_10000CC44(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100015270();
    if (!v8)
    {
      uint64_t result = sub_100015280();
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

void *sub_10000CB6C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000152B0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_10000CC44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10000CCDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000CEB8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000CEB8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000CCDC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_1000150C0();
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
  unint64_t v3 = sub_10000CE50(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100015250();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_1000152B0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100015280();
  __break(1u);
  return result;
}

void *sub_10000CE50(uint64_t a1, uint64_t a2)
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
  sub_1000054E4(&qword_100022788);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000CEB8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000054E4(&qword_100022788);
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
    sub_10000D068(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000CF90(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10000CF90(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000152B0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10000D068(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1000152B0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_10000D0F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D150(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D1A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000054E4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D204(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000D150(a1, a2);
  }
  return a1;
}

uint64_t sub_10000D218(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000D268(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D2E0()
{
  return *(void *)(v0 + 240);
}

uint64_t sub_10000D304(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000D31C()
{
  return v0 + 8;
}

uint64_t sub_10000D328()
{
  return v0;
}

uint64_t sub_10000D350()
{
  return v0;
}

id sub_10000D364()
{
  sub_10000E0A0();
  sub_100014CA0();
  *(void *)(v0
            + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_backgroundVisibility) = v2;
  return sub_10000DD78();
}

id sub_10000D3C4(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView;
  id v4 = objc_allocWithZone((Class)WFSearchBar);
  char v5 = v1;
  *(void *)&v1[v3] = [v4 initWithStyle:2];
  uint64_t v6 = OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_navigationBar;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)UINavigationBar) init];
  *(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_backgroundVisibility] = 0;
  *(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewTopConstraint] = 0;
  *(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewBottomConstraint] = 0;
  *(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewWidthConstraint] = 0;
  *(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_viewModel] = a1;
  swift_retain();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for PencilActionConfigurationSearchViewController();
  id v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", 0, 0);
  swift_release();
  return v7;
}

void sub_10000D4D0()
{
  uint64_t v1 = OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)WFSearchBar) initWithStyle:2];
  uint64_t v2 = OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_navigationBar;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UINavigationBar) init];
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_backgroundVisibility] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewTopConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewBottomConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewWidthConstraint] = 0;

  sub_100015290();
  __break(1u);
}

id sub_10000D5CC()
{
  uint64_t v1 = v0;
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for PencilActionConfigurationSearchViewController();
  objc_msgSendSuper2(&v19, "viewDidLoad");
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_navigationBar];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  sub_1000054E4((uint64_t *)&unk_100022850);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016330;
  *(void *)(v4 + 32) = [objc_allocWithZone((Class)UINavigationItem) init];
  sub_1000150F0();
  sub_10000DFB8(v4, v3);
  id result = [v1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v6 = result;
  [result addSubview:v3];

  id result = [v1 view];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v7 = result;
  [result addSubview:v2];

  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100015C10;
  *(void *)(v8 + 32) = sub_10000DAC8();
  *(void *)(v8 + 40) = sub_10000DADC();
  *(void *)(v8 + 48) = sub_10000DBDC();
  id v9 = [v2 centerXAnchor];
  id result = [v1 view];
  if (result)
  {
    uint64_t v10 = result;
    size_t v11 = self;
    id v12 = [v10 centerXAnchor];

    id v13 = [v9 constraintEqualToAnchor:v12];
    *(void *)(v8 + 56) = v13;
    sub_1000150F0();
    sub_10000572C(0, (unint64_t *)&qword_100022248);
    Class isa = sub_1000150D0().super.isa;
    swift_bridgeObjectRelease();
    [v11 activateConstraints:isa];

    [v2 setDelegate:v1];
    id v15 = [v2 searchTextField];
    swift_retain();
    uint64_t v16 = sub_100014AB0();
    uint64_t v18 = v17;
    swift_release();
    sub_10000E03C(v16, v18, v15);

    return sub_10000DD78();
  }
LABEL_7:
  __break(1u);
  return result;
}

id sub_10000D910(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for PencilActionConfigurationSearchViewController();
  objc_msgSendSuper2(&v4, "viewDidDisappear:", a1 & 1);
  return [*(id *)&v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView] reset];
}

id sub_10000D9C0()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for PencilActionConfigurationSearchViewController();
  objc_msgSendSuper2(&v12, "viewDidLayoutSubviews");
  sub_10000DC84();
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_navigationBar];
  id result = [v0 view];
  if (result)
  {
    uint64_t v3 = result;
    [result bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    return objc_msgSend(v1, "setFrame:", v5, v7, v9, v11);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000DAC8()
{
  return sub_10000DAF0(&OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewTopConstraint, (SEL *)&selRef_topAnchor);
}

id sub_10000DADC()
{
  return sub_10000DAF0(&OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewBottomConstraint, (SEL *)&selRef_bottomAnchor);
}

id sub_10000DAF0(uint64_t *a1, SEL *a2)
{
  uint64_t v3 = *a1;
  double v4 = *(void **)&v2[*a1];
  if (v4)
  {
    id v5 = *(id *)&v2[*a1];
LABEL_5:
    id v13 = v4;
    return v5;
  }
  id v7 = [*(id *)&v2[OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView] *a2];
  id result = [v2 view];
  if (result)
  {
    double v9 = result;
    id v10 = [result *a2];

    id v11 = [v7 constraintEqualToAnchor:v10 constant:0.0];
    objc_super v12 = *(void **)&v2[v3];
    *(void *)&v2[v3] = v11;
    id v5 = v11;

    double v4 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_10000DBDC()
{
  uint64_t v1 = OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewWidthConstraint;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewWidthConstraint);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController____lazy_storage___searchViewWidthConstraint);
  }
  else
  {
    id v4 = [*(id *)(v0+ OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_searchView) widthAnchor];
    id v5 = [v4 constraintEqualToConstant:0.0];

    double v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_10000DC84()
{
  id v1 = [self sharedProvider];
  objc_msgSend(v1, "metricsWithInterfaceOrientation:", objc_msgSend(v0, "interfaceOrientation"));

  id v2 = sub_10000DAC8();
  [v2 setConstant:v6];

  id v3 = sub_10000DADC();
  [v3 setConstant:-v7];

  id v4 = sub_10000DBDC();
  [v4 setConstant:v5];
}

id sub_10000DD78()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_navigationBar) _setBackgroundOpacity:*(double *)(v0+ OBJC_IVAR____TtC34SystemActionConfigurationExtension45PencilActionConfigurationSearchViewController_backgroundVisibility)];
}

uint64_t sub_10000DD9C()
{
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100014AC0();
  return swift_release();
}

void sub_10000DE7C()
{
}

id sub_10000DED4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PencilActionConfigurationSearchViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PencilActionConfigurationSearchViewController()
{
  return self;
}

void sub_10000DFB8(uint64_t a1, void *a2)
{
  sub_10000572C(0, &qword_100022860);
  Class isa = sub_1000150D0().super.isa;
  swift_bridgeObjectRelease();
  [a2 setItems:isa];
}

void sub_10000E03C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100015050();
  swift_bridgeObjectRelease();
  [a3 setText:v4];
}

unint64_t sub_10000E0A0()
{
  unint64_t result = qword_100022868;
  if (!qword_100022868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022868);
  }
  return result;
}

uint64_t sub_10000E0EC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_10000E114(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(sub_100014A70() - 8);
  uint64_t v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = *(void *)(v4 + 72);
  sub_100012770((unint64_t *)&unk_1000229F0, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerSection);
  uint64_t v7 = 0;
  while ((sub_100015040() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7) {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_10000E238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_1000149B0();
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), v5);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  return sub_100005528(a2, v7, 1, v6);
}

double sub_10000E2E0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000D268(a1 + 32, (uint64_t)a2);
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_10000E300@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10001239C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_10000D268(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

BOOL sub_10000E364(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10001D0D0;
  v6._object = a2;
  Swift::Int v4 = sub_1000152D0(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

uint64_t sub_10000E3AC()
{
  return 1852399981;
}

Swift::Int sub_10000E3C4()
{
  return sub_100015350();
}

uint64_t sub_10000E414()
{
  return sub_1000150B0();
}

Swift::Int sub_10000E428()
{
  return sub_100015350();
}

BOOL sub_10000E470@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = sub_10000E364(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10000E4A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000E3AC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_10000E4D0()
{
  qword_1000228D0 = 0x4372616265646953;
  *(void *)algn_1000228D8 = 0xEB000000006C6C65;
}

uint64_t sub_10000E4FC(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_visibleSections) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E514(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_dataSource) = a1;
  return _objc_release_x1();
}

id sub_10000E528(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_dataSource] = 0;
  v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_shouldAllowAnimatedSelection] = 1;
  *(void *)&v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_viewModel] = a1;
  *(void *)&v1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_visibleSections] = &_swiftEmptyArrayStorage;
  uint64_t v3 = v1;
  swift_retain();
  Swift::Int v4 = (void *)sub_10000E710();
  id v5 = objc_msgSend(objc_allocWithZone((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v4, 0.0, 0.0, 0.0, 0.0);

  *(void *)&v3[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView] = v5;
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for PencilActionConfigurationSidebarViewController();
  id v6 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", 0, 0);
  uint64_t v7 = self;
  id v8 = v6;
  id v9 = [v7 defaultCenter];
  [v9 addObserver:v8 selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  id v10 = [v7 defaultCenter];
  id v11 = v8;
  [v10 addObserver:v11 selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  swift_release();
  return v11;
}

uint64_t sub_10000E710()
{
  uint64_t v2 = sub_100014E40();
  sub_100006CB8();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100013A2C();
  uint64_t v6 = sub_100014E70();
  sub_100006CB8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100007FA0();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, enum case for UICollectionLayoutListConfiguration.Appearance.sidebar(_:), v2);
  sub_100014E50();
  id v10 = [self clearColor];
  sub_100014E60();
  sub_10000572C(0, &qword_1000229A8);
  uint64_t v11 = sub_1000151B0();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
  return v11;
}

void sub_10000E858()
{
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_dataSource] = 0;
  v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_shouldAllowAnimatedSelection] = 1;

  sub_100015290();
  __break(1u);
}

id sub_10000E91C()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for PencilActionConfigurationSidebarViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_10000EA44()
{
  uint64_t v2 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = sub_1000054E4(&qword_100022230);
  uint64_t v5 = sub_100006D48(v4);
  __chkstk_darwin(v5);
  sub_1000139D4();
  sub_1000054E4(&qword_100022A00);
  sub_100006CB8();
  __chkstk_darwin(v6);
  sub_1000139A8();
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for PencilActionConfigurationSidebarViewController();
  objc_msgSendSuper2(&v23, "viewDidLoad");
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView];
  [v7 setDelegate:v0];
  id v8 = [self clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setShowsVerticalScrollIndicator:0];
  [v7 setKeyboardDismissMode:3];
  sub_10000572C(0, &qword_100022A08);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (qword_100022118 != -1) {
    swift_once();
  }
  NSString v10 = sub_100015050();
  [v7 registerClass:ObjCClassFromMetadata forCellWithReuseIdentifier:v10];

  sub_100014B00();
  sub_100012770((unint64_t *)&unk_100022A10, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerDataSource);
  swift_retain();
  uint64_t v11 = sub_100014E90();
  swift_release();
  id v22 = objc_msgSend(self, "mainRunLoop", v11);
  uint64_t v12 = sub_1000151C0();
  sub_100005528(v1, 1, 1, v12);
  sub_100014EA0();
  sub_10000572C(0, &qword_100022238);
  sub_100005550();
  sub_100014EB0();
  sub_100013898(v1, &qword_100022230);

  swift_release();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_1000129CC;
  *(void *)(v14 + 24) = v13;
  sub_100013928((unint64_t *)&qword_100022240, &qword_100022A00);
  sub_100014EC0();
  swift_release();
  sub_100013A68();
  v15();
  swift_beginAccess();
  sub_100014E80();
  swift_endAccess();
  swift_release();
  id v16 = [v2 view];
  if (v16)
  {
    uint64_t v17 = v16;
    [v16 addSubview:v7];

    *(void *)(swift_allocObject() + 16) = ObjectType;
    id v18 = objc_allocWithZone((Class)sub_1000054E4(&qword_100022A30));
    id v19 = v7;
    uint64_t v20 = (void *)sub_100014E10();
    id v21 = v20;
    sub_10000E514((uint64_t)v20);
    [v19 setDataSource:v21];
  }
  else
  {
    __break(1u);
  }
}

void sub_10000EF10()
{
  uint64_t v0 = sub_1000149B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (char *)Strong;
    sub_100010710();
    uint64_t v6 = OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView;
    id v7 = [*(id *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView] indexPathsForSelectedItems];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = (void *)sub_1000150E0();
    }
    else
    {
      uint64_t v9 = &_swiftEmptyArrayStorage;
    }
    char v10 = sub_10000F0DC((uint64_t)v9, (uint64_t)&_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    if (v10)
    {
      if (*(void *)(*(void *)&v5[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_visibleSections]
                     + 16))
      {
        id v11 = *(id *)&v5[v6];
        sub_1000149A0();
        Class isa = sub_100014960().super.isa;
        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        [v11 selectItemAtIndexPath:isa animated:0 scrollPosition:1];

        uint64_t v5 = (char *)isa;
      }
    }
  }
}

uint64_t sub_10000F0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000149B0();
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      uint64_t v31 = v7;
      unint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      uint64_t v30 = (void (**)(char *, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      uint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        id v19 = v9;
        uint64_t v20 = v9;
        id v21 = v32;
        v32(v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        uint64_t v9 = v20;
        sub_100012770(&qword_1000229E8, (void (*)(uint64_t))&type metadata accessor for IndexPath);
        char v23 = sub_100015040();
        uint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24(v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v14 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

id sub_10000F2FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100014A70();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  if (qword_100022118 != -1) {
    swift_once();
  }
  NSString v8 = sub_100015050();
  Class isa = sub_100014960().super.isa;
  id v10 = [a1 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:isa];

  __chkstk_darwin(v11);
  *(&v15 - 2) = (uint64_t)v10;
  *(&v15 - 1) = a3;
  v16[3] = sub_1000054E4(&qword_100022A38);
  v16[4] = sub_100013928(&qword_100022A40, &qword_100022A38);
  sub_100012A3C(v16);
  type metadata accessor for PencilActionConfigurationSidebarCell();
  sub_100012770(&qword_100022A48, (void (*)(uint64_t))type metadata accessor for PencilActionConfigurationSidebarCell);
  sub_100014F60();
  sub_100015170();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v13 + v12, (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  sub_100015190();
  return v10;
}

uint64_t sub_10000F5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000054E4(&qword_100022A50);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000054E4(&qword_100022A58);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (uint64_t)&v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_100014D90();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = a1;
  uint64_t v21 = a3;
  v22[3] = sub_1000054E4(&qword_100022A38);
  v22[4] = sub_100013928(&qword_100022A40, &qword_100022A38);
  sub_100012A3C(v22);
  type metadata accessor for PencilActionConfigurationSidebarCell();
  sub_100012770(&qword_100022A48, (void (*)(uint64_t))type metadata accessor for PencilActionConfigurationSidebarCell);
  sub_100014F60();
  sub_100015170();
  sub_100014D80();
  sub_100014DE0();
  uint64_t v15 = sub_100014DD0();
  sub_100005528(v10, 0, 1, v15);
  sub_100014D70();
  LOBYTE(v10) = sub_100014D20();
  char v16 = sub_100014D30();
  if (v10)
  {
    [objc_allocWithZone((Class)UIColor) initWithWhite:0.39 alpha:0.12];
  }
  else if (v16)
  {
    [objc_allocWithZone((Class)UIColor) initWithWhite:0.39 alpha:0.06];
  }
  else
  {
    id v17 = [self clearColor];
  }
  sub_100014D60();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 16))(v7, v14, v11);
  sub_100005528((uint64_t)v7, 0, 1, v11);
  sub_100015180();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_10000F8E8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v8 = sub_100014A70();
  sub_100006CB8();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_100007FA0();
  uint64_t v12 = sub_100014D50();
  sub_100006CB8();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_1000139A8();
  id v16 = [a1 _bridgedConfigurationState];
  sub_100014D40();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v3, a2, v8);
  *a3 = swift_getKeyPath();
  sub_1000054E4(&qword_100022A60);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = type metadata accessor for PencilActionConfigurationSidebarCell();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))((char *)a3 + *(int *)(v17 + 20), v4, v12);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 32))((char *)a3 + *(int *)(v17 + 24), v3, v8);
}

void sub_10000FAC0()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for PencilActionConfigurationSidebarViewController();
  objc_msgSendSuper2(&v6, "viewDidLayoutSubviews");
  id v1 = [v0 view];
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 bounds];
    sub_1000139C0();

    double v3 = sub_100013A10();
    objc_msgSend(v4, v5, v3);
    sub_100011420();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000FBB8(uint64_t a1)
{
  double v3 = v1;
  uint64_t v5 = sub_1000054E4(&qword_1000229E0);
  uint64_t v6 = sub_100006D48(v5);
  __chkstk_darwin(v6);
  sub_100006CD4();
  id v97 = (id)(v8 - v7);
  uint64_t v9 = sub_1000149B0();
  sub_100006CB8();
  uint64_t v11 = v10;
  uint64_t v13 = __chkstk_darwin(v12);
  CGRect v96 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v90 - v16;
  uint64_t v95 = v18;
  __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v90 - v19;
  uint64_t v21 = sub_100014A70();
  sub_100006CB8();
  uint64_t v23 = v22;
  __chkstk_darwin(v24);
  sub_1000139A8();
  uint64_t result = sub_100014A20();
  id v98 = v3;
  uint64_t v26 = *(void *)&v3[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_visibleSections];
  if (result)
  {
    uint64_t v27 = *(void *)(v26 + 16);
    if (!v27) {
      return result;
    }
    uint64_t v93 = v17;
    uint64_t v90 = v20;
    uint64_t v91 = v11;
    uint64_t v92 = v9;
    uint64_t v30 = *(void (**)(uint64_t, unint64_t, uint64_t))(v23 + 16);
    uint64_t v28 = v23 + 16;
    uint64_t v29 = v30;
    unint64_t v31 = v26 + ((*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64));
    uint64_t v32 = *(void *)(v28 + 56);
    uint64_t v94 = v26;
    swift_bridgeObjectRetain();
    uint64_t v33 = 0;
    while (1)
    {
      v29(v2, v31, v21);
      char v34 = sub_100014A10();
      sub_100013A68();
      v35();
      if (v34) {
        break;
      }
      ++v33;
      v31 += v32;
      if (v27 == v33) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v92;
    uint64_t v17 = v93;
    uint64_t v11 = v91;
    uint64_t v20 = v90;
  }
  else
  {
    uint64_t v36 = *(void *)&v3[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_visibleSections];
    swift_bridgeObjectRetain();
    sub_10000E114(a1, v36);
    char v38 = v37;
    uint64_t result = swift_bridgeObjectRelease();
    if (v38) {
      return result;
    }
  }
  sub_100014980();
  id v39 = v98;
  uint64_t v40 = *(void **)&v98[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView];
  id v41 = [v40 indexPathsForSelectedItems];
  if (!v41)
  {
    uint64_t v45 = (uint64_t)v97;
    sub_100005528((uint64_t)v97, 1, 1, v9);
    goto LABEL_14;
  }
  id v42 = v41;
  uint64_t v43 = v17;
  uint64_t v44 = sub_1000150E0();

  uint64_t v45 = (uint64_t)v97;
  sub_10000E238(v44, (uint64_t)v97);
  uint64_t v17 = v43;
  swift_bridgeObjectRelease();
  if (sub_100007ECC(v45, 1, v9) == 1)
  {
LABEL_14:
    sub_100014980();
    sub_100013898(v45, &qword_1000229E0);
    goto LABEL_15;
  }
  sub_100013A48();
  v46();
LABEL_15:
  sub_100012770(&qword_1000229E8, (void (*)(uint64_t))&type metadata accessor for IndexPath);
  if (sub_100015040())
  {
    double v47 = *(void (**)(void))(v11 + 8);
    sub_100013A68();
    v47();
    return ((uint64_t (*)(char *, uint64_t))v47)(v20, v9);
  }
  uint64_t v48 = v17;
  Class isa = sub_100014960().super.isa;
  [v40 selectItemAtIndexPath:isa animated:0 scrollPosition:0];

  id v50 = [v40 collectionViewLayout];
  Class v51 = sub_100014960().super.isa;
  os_log_type_t v52 = v20;
  id v53 = [v50 layoutAttributesForItemAtIndexPath:v51];

  if (v53)
  {
    if (*((unsigned char *)v39
         + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_shouldAllowAnimatedSelection) == 1)
    {
      [v53 frame];
      sub_1000139C0();
      id v54 = [v39 view];
      double v55 = sub_100013A10();
      objc_msgSend(v56, v57, v54, v55);
      sub_1000139C0();

      uint64_t result = (uint64_t)[v39 view];
      if (!result)
      {
        __break(1u);
        return result;
      }
      unint64_t v58 = (void *)result;
      [(id)result bounds];
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double v66 = v65;

      [v40 contentInset];
      sub_100013A54();
      sub_1000127B8(v60, v62, v64, v66, v67, v68);
      sub_100013A54();
      v105.origin.x = sub_100013A10();
      CGRect v106 = CGRectIntersection(v105, v107);
      double width = v106.size.width;
      double height = v106.size.height;
      objc_msgSend(v53, "frame", v106.origin.x, v106.origin.y);
      if (width != v72 || height != v71)
      {
        uint64_t v93 = v48;
        uint64_t v74 = sub_100014990();
        uint64_t v75 = sub_100014990();
        uint64_t v76 = 4;
        if (v74 >= v75) {
          uint64_t v76 = 1;
        }
        uint64_t v94 = v76;
        id v77 = [self sharedSettings];
        id v97 = self;
        [v77 sidebarSpringDamping];
        double v79 = v78;
        [v77 sidebarSpringRepsonse];
        double v81 = v80;
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v96, v52, v9);
        double v82 = v39;
        unint64_t v83 = (v95 + ((*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v84 = swift_allocObject();
        *(void *)(v84 + 16) = v82;
        sub_100013A48();
        v85();
        *(void *)(v84 + v83) = v94;
        v103 = sub_1000127D8;
        uint64_t v104 = v84;
        aBlock = _NSConcreteStackBlock;
        uint64_t v100 = 1107296256;
        uint64_t v101 = sub_10001066C;
        id v102 = &unk_10001D650;
        double v86 = _Block_copy(&aBlock);
        id v87 = v82;
        swift_release();
        v103 = nullsub_1;
        uint64_t v104 = 0;
        aBlock = _NSConcreteStackBlock;
        uint64_t v100 = 1107296256;
        uint64_t v101 = sub_1000106B0;
        id v102 = &unk_10001D678;
        unint64_t v88 = _Block_copy(&aBlock);
        [v97 _animateUsingSpringWithDampingRatio:1 response:v86 tracking:v88 dampingRatioSmoothing:v79 responseSmoothing:v81 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
        _Block_release(v88);
        _Block_release(v86);

        id v53 = v77;
      }
    }
  }
  uint64_t v89 = *(void (**)(void))(v11 + 8);
  sub_100013A68();
  v89();
  return ((uint64_t (*)(char *, uint64_t))v89)(v52, v9);
}

uint64_t sub_10001035C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000149B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = self;
  uint64_t v10 = WFPencilActionConfigurationHighFrameRateReason;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v6);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v12 + ((v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1000128A4;
  *(void *)(v13 + 24) = v12;
  aBlock[4] = sub_10001296C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010644;
  aBlock[3] = &unk_10001D6F0;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = a1;
  swift_retain();
  swift_release();
  LODWORD(v16) = 1117782016;
  LODWORD(v17) = 1123024896;
  LODWORD(v18) = 1123024896;
  objc_msgSend(v9, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v10, v14, v16, v17, v18);
  _Block_release(v14);
  swift_release();
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a1) {
    __break(1u);
  }
  return result;
}

void sub_1000105CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView);
  Class isa = sub_100014960().super.isa;
  [v4 scrollToItemAtIndexPath:isa atScrollPosition:a3 animated:0];
}

uint64_t sub_100010644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10001066C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1000106B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_100010710()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_1000054E4(&qword_1000229C0);
  sub_100006CB8();
  uint64_t v41 = v4;
  __chkstk_darwin(v5);
  sub_1000139A8();
  uint64_t v46 = sub_100014A30();
  sub_100006CB8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_1000139D4();
  uint64_t v48 = sub_100014A70();
  sub_100006CB8();
  uint64_t v10 = v9;
  uint64_t v12 = __chkstk_darwin(v11);
  id v54 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v15 = (char *)&v38 - v14;
  swift_retain();
  uint64_t v16 = sub_100014AE0();
  uint64_t result = swift_release();
  double v18 = &_swiftEmptyArrayStorage;
  id v56 = &_swiftEmptyArrayStorage;
  uint64_t v47 = v16;
  uint64_t v53 = *(void *)(v16 + 16);
  if (v53)
  {
    uint64_t v38 = v0;
    uint64_t v39 = v1;
    uint64_t v40 = v3;
    unint64_t v19 = 0;
    uint64_t v51 = v10 + 16;
    uint64_t v50 = v7 + 88;
    int v49 = enum case for SmartShortcutPickerSection.ID.libraryFolder(_:);
    os_log_type_t v52 = (void (**)(void))(v10 + 32);
    uint64_t v43 = v7 + 96;
    uint64_t v44 = v7 + 8;
    id v42 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
    uint64_t v21 = v47;
    uint64_t v20 = v48;
    uint64_t v22 = v10;
    uint64_t v45 = v10;
    while (v19 < *(void *)(v21 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))(v15, v21+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(void *)(v22 + 72) * v19, v20);
      sub_100014A40();
      uint64_t v23 = sub_1000139FC();
      int v25 = v24(v23);
      if (v25 == v49)
      {
        uint64_t v26 = sub_1000139FC();
        v27(v26);
        swift_bridgeObjectRelease();
        uint64_t result = (*v42)(v15, v20);
      }
      else
      {
        uint64_t v28 = sub_1000139FC();
        v29(v28);
        uint64_t v30 = *v52;
        sub_100013A48();
        v30();
        unint64_t v31 = v56;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000124A8(0, v31[2] + 1, 1);
          unint64_t v31 = v56;
        }
        unint64_t v33 = v31[2];
        unint64_t v32 = v31[3];
        if (v33 >= v32 >> 1)
        {
          sub_1000124A8(v32 > 1, v33 + 1, 1);
          unint64_t v31 = v56;
        }
        v31[2] = v33 + 1;
        uint64_t v20 = v48;
        sub_100013A48();
        uint64_t result = ((uint64_t (*)(void))v30)();
        id v56 = v31;
        uint64_t v22 = v45;
        uint64_t v21 = v47;
      }
      if (v53 == ++v19)
      {
        double v18 = v56;
        uint64_t v3 = v40;
        uint64_t v34 = v41;
        uint64_t v2 = v38;
        uint64_t v1 = v39;
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v34 = v41;
LABEL_14:
    swift_bridgeObjectRelease();
    sub_100012724();
    sub_100012770(&qword_1000229D0, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerSection);
    sub_100014DC0();
    v35._rawValue = &off_10001D108;
    sub_100014DB0(v35);
    char v55 = 0;
    sub_100014DA0();
    sub_10000E4FC((uint64_t)v18);
    uint64_t v36 = *(void **)(v2
                   + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_dataSource);
    if (v36)
    {
      id v37 = v36;
      sub_100014E30();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v1, v3);
  }
  return result;
}

uint64_t sub_100010B4C()
{
  uint64_t v2 = sub_1000054E4(&qword_100022580);
  uint64_t v3 = sub_100006D48(v2);
  __chkstk_darwin(v3);
  sub_100013A2C();
  uint64_t v4 = sub_100014A70();
  sub_100006CB8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100006CD4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = *(void **)(v0
                 + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_dataSource);
  if (!v11)
  {
    sub_100005528(v1, 1, 1, v4);
    return sub_100013898(v1, &qword_100022580);
  }
  id v12 = v11;
  sub_100014E20();

  if (sub_100007ECC(v1, 1, v4) == 1) {
    return sub_100013898(v1, &qword_100022580);
  }
  sub_100013A48();
  v13();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1000049C0(v0, v10);
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
}

double sub_100010DC8()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView);
  [v1 contentOffset];
  double v3 = v2;
  [v1 contentInset];
  double v5 = v3 + v4;
  [v1 contentInset];
  return v5;
}

void sub_100010E38()
{
  id v1 = [*(id *)(v0+ OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView) layer];
  [v1 removeAllAnimations];

  *(unsigned char *)(v0
           + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_shouldAllowAnimatedSelection) = 0;
}

void sub_100010EF4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(v2+ OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView) layer];
    [v3 removeAllAnimations];

    *(unsigned char *)(v2
             + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_shouldAllowAnimatedSelection) = 1;
  }
}

void sub_100010FC0()
{
  *(unsigned char *)(v0
           + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_shouldAllowAnimatedSelection) = 1;
}

uint64_t sub_100010FF8()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100010DC8();
    sub_1000048D0();
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1000110B8(void *a1)
{
  uint64_t v1 = sub_10000A56C(a1);
  if (!v1)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  sub_100015080();
  sub_100015240();
  sub_10000E300((uint64_t)&v4, v2, &v5);
  swift_bridgeObjectRelease();
  sub_10000A5D8((uint64_t)&v4);
  if (!*((void *)&v6 + 1))
  {
LABEL_6:
    sub_100013898((uint64_t)&v5, (uint64_t *)&unk_1000229B0);
    return;
  }
  type metadata accessor for CGRect(0);
  if (swift_dynamicCast())
  {
    double Height = CGRectGetHeight(v4);
    sub_100011264(Height);
  }
}

void sub_100011264(double a1)
{
  id v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(double *)(v4 + 24) = a1;
  v7[4] = sub_10001186C;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10001066C;
  v7[3] = &unk_10001D600;
  long long v5 = _Block_copy(v7);
  id v6 = v1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.4];
  _Block_release(v5);
}

id sub_100011360(uint64_t a1, double a2)
{
  id v3 = *(void **)(a1
                + OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView);
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [v3 safeAreaInsets];
  if (a2 <= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = a2 - v10;
  }
  objc_msgSend(v3, "setContentInset:", v5, v7, v11, v9);
  return objc_msgSend(v3, "setScrollIndicatorInsets:", v5, v7, v11, v9);
}

void sub_100011420()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  v5[4] = sub_100011814;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10001066C;
  v5[3] = &unk_10001D5B0;
  id v3 = _Block_copy(v5);
  id v4 = v0;
  swift_release();
  [v1 animateWithDuration:v3 animations:0.4];
  _Block_release(v3);
}

id sub_10001150C(char *a1)
{
  id v2 = [self sharedProvider];
  objc_msgSend(v2, "metricsWithInterfaceOrientation:", objc_msgSend(a1, "interfaceOrientation"));

  id v3 = *(void **)&a1[OBJC_IVAR____TtC34SystemActionConfigurationExtension46PencilActionConfigurationSidebarViewController_collectionView];
  [v3 directionalLayoutMargins];
  objc_msgSend(v3, "setDirectionalLayoutMargins:");
  [v3 contentInset];
  [v3 setContentInset:v5 + v6];
  [v3 safeAreaInsets];
  [v3 contentInset];
  return objc_msgSend(v3, "setContentInset:");
}

void sub_10001163C()
{
}

uint64_t type metadata accessor for PencilActionConfigurationSidebarViewController()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for PencilActionConfigurationSidebarViewController.Section(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100011754);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PencilActionConfigurationSidebarViewController.Section()
{
  return &type metadata for PencilActionConfigurationSidebarViewController.Section;
}

unint64_t sub_100011790()
{
  unint64_t result = qword_1000229A0;
  if (!qword_1000229A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000229A0);
  }
  return result;
}

uint64_t sub_1000117DC()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100011814()
{
  return sub_10001150C(*(char **)(v0 + 16));
}

uint64_t sub_10001181C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001182C()
{
  return swift_release();
}

uint64_t sub_100011834()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10001186C()
{
  return sub_100011360(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_100011878@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = sub_1000054E4(&qword_100022B10);
  uint64_t v9 = sub_100006D48(v8);
  __chkstk_darwin(v9);
  sub_1000139D4();
  uint64_t v10 = sub_1000054E4(&qword_100022B18);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  sub_100006CD4();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_1000054E4(&qword_100022B20);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  double v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v2 = sub_100014F50();
  *(void *)(v2 + 8) = 0x4036000000000000;
  *(unsigned char *)(v2 + 16) = 0;
  uint64_t v19 = sub_1000054E4(&qword_100022B28);
  sub_100011AA0(v1, v2 + *(int *)(v19 + 44));
  char v20 = sub_100014F70();
  sub_100014ED0();
  sub_1000139C0();
  sub_100013838(v2, v14, &qword_100022B10);
  uint64_t v21 = v14 + *(int *)(v11 + 44);
  *(unsigned char *)uint64_t v21 = v20;
  *(void *)(v21 + 8) = v3;
  *(void *)(v21 + 16) = v4;
  *(void *)(v21 + 24) = v5;
  *(void *)(v21 + 32) = v6;
  *(unsigned char *)(v21 + 40) = 0;
  sub_100013898(v2, &qword_100022B10);
  sub_100013838(v14, (uint64_t)v18, &qword_100022B18);
  v18[*(int *)(v16 + 44)] = 0;
  sub_100013898(v14, &qword_100022B18);
  type metadata accessor for PencilActionConfigurationSidebarCell();
  sub_100013838((uint64_t)v18, a1, &qword_100022B20);
  sub_1000054E4(&qword_100022B30);
  sub_100014A70();
  sub_1000139EC();
  uint64_t v22 = sub_100013A74();
  v23(v22);
  return sub_100013898((uint64_t)v18, &qword_100022B20);
}

uint64_t sub_100011AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v3 = sub_1000054E4(&qword_100022B38);
  __chkstk_darwin(v3 - 8);
  uint64_t v52 = (uint64_t)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100014CC0();
  uint64_t v5 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  double v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100014CB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (int64x2_t *)((char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = sub_100014CD0();
  uint64_t v12 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000054E4(&qword_100022B40);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v54 = (uint64_t)&v49 - v20;
  uint64_t v49 = a1 + *(int *)(type metadata accessor for PencilActionConfigurationSidebarCell() + 24);
  sub_100014A50();
  *uint64_t v11 = vdupq_n_s64(0x4040000000000000uLL);
  (*(void (**)(int64x2_t *, void, uint64_t))(v9 + 104))(v11, enum case for IconSize.custom(_:), v8);
  id v21 = [self labelColor];
  id v22 = [objc_allocWithZone((Class)WFColor) initWithPlatformColor:v21];

  *(void *)double v7 = v22;
  v7[8] = 0;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for IconView.DisplayMode.customColor(_:), v51);
  sub_100014CE0();
  sub_100015020();
  sub_100014F00();
  uint64_t v23 = v50;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v19, v14, v50);
  uint64_t v24 = &v19[*(int *)(v16 + 44)];
  long long v25 = v58;
  *(_OWORD *)uint64_t v24 = v57;
  *((_OWORD *)v24 + 1) = v25;
  *((_OWORD *)v24 + 2) = v59;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v23);
  sub_10001376C((uint64_t)v19, v54);
  uint64_t v55 = sub_100014A60();
  uint64_t v56 = v26;
  sub_1000137D4();
  uint64_t v27 = sub_100014FD0();
  uint64_t v29 = v28;
  LOBYTE(v21) = v30 & 1;
  uint64_t v31 = sub_100014F80();
  uint64_t v32 = v52;
  sub_100005528(v52, 1, 1, v31);
  sub_100014FA0();
  sub_100013898(v32, &qword_100022B38);
  uint64_t v33 = sub_100014FC0();
  uint64_t v35 = v34;
  LOBYTE(v5) = v36;
  swift_release();
  sub_100013820(v27, v29, (char)v21);
  swift_bridgeObjectRelease();
  sub_100014F90();
  uint64_t v37 = sub_100014FB0();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  LOBYTE(v21) = v42 & 1;
  sub_100013820(v33, v35, v5 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v44 = sub_100015010();
  uint64_t v45 = v54;
  sub_100013838(v54, (uint64_t)v19, &qword_100022B40);
  uint64_t v46 = v53;
  sub_100013838((uint64_t)v19, v53, &qword_100022B40);
  uint64_t v47 = v46 + *(int *)(sub_1000054E4(&qword_100022B50) + 48);
  *(void *)uint64_t v47 = v37;
  *(void *)(v47 + 8) = v39;
  *(unsigned char *)(v47 + 16) = (_BYTE)v21;
  *(void *)(v47 + 24) = v41;
  *(void *)(v47 + 32) = KeyPath;
  *(void *)(v47 + 40) = 1;
  *(unsigned char *)(v47 + 48) = 0;
  *(void *)(v47 + 56) = v44;
  sub_100013888(v37, v39, (char)v21);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100013898(v45, &qword_100022B40);
  sub_100013820(v37, v39, (char)v21);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100013898((uint64_t)v19, &qword_100022B40);
}

uint64_t sub_100012064()
{
  return sub_100015000();
}

uint64_t sub_100012084(uint64_t a1)
{
  uint64_t v2 = sub_100014EE0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100014F20();
}

uint64_t sub_10001214C()
{
  return 0;
}

uint64_t sub_100012154(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t v8 = sub_1000152B0();
    __break(1u);
    return _swift_arrayInitWithTakeBackToFront(v8, v9, v10, v7);
  }
  if (a3 < a1 || (uint64_t result = sub_100014A70(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v11 = sub_100014A70();
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

uint64_t sub_100012284(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v6 = sub_100014A70(), v7 = *(void *)(*(void *)(v6 - 8) + 72) * a2, v8 = a3 + v7, v9 = a1 + v7, v8 > a1)
      ? (BOOL v10 = v9 > a3)
      : (BOOL v10 = 0),
        v10))
  {
    uint64_t v12 = sub_1000152B0();
    __break(1u);
  }
  else
  {
    uint64_t v11 = v6;
    uint64_t v12 = a3;
    unint64_t v13 = a1;
    uint64_t v14 = a2;
  }
  return _swift_arrayInitWithCopy(v12, v13, v14, v11);
}

unint64_t sub_10001239C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100015220(*(void *)(v2 + 40));
  return sub_1000123E0(a1, v4);
}

unint64_t sub_1000123E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000126C8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100015230();
      sub_10000A5D8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

size_t sub_1000124A8(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1000124C8(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

size_t sub_1000124C8(size_t result, int64_t a2, char a3, uint64_t a4)
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
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000054E4(&qword_1000229D8);
  uint64_t v10 = *(void *)(sub_100014A70() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
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
  void v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100014A70() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_100012154(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100012284(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_100012664@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100014F30();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100012698()
{
  return sub_100014F40();
}

uint64_t sub_1000126C8(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100012724()
{
  unint64_t result = qword_1000229C8;
  if (!qword_1000229C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000229C8);
  }
  return result;
}

uint64_t sub_100012770(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_1000127B8(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1000127D8()
{
  return sub_1000128BC((uint64_t (*)(uint64_t, unint64_t, uint64_t))sub_10001035C);
}

uint64_t sub_1000127F4()
{
  uint64_t v1 = sub_1000149B0();
  sub_100006CB8();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = ((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return _swift_deallocObject(v0, v9, v8);
}

uint64_t sub_1000128A4()
{
  return sub_1000128BC((uint64_t (*)(uint64_t, unint64_t, uint64_t))sub_1000105CC);
}

uint64_t sub_1000128BC(uint64_t (*a1)(uint64_t, unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_1000149B0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a1(v4, v1 + v3, v5);
}

uint64_t sub_100012960()
{
  return sub_100013A24(v0, 32);
}

uint64_t sub_10001296C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100012994()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000129CC()
{
}

uint64_t sub_1000129D4()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012A0C()
{
  return sub_100013A24(v0, 24);
}

id sub_100012A18(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10000F2FC(a1, a2, a3);
}

uint64_t sub_100012A20@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000F8E8(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t *sub_100012A3C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for PencilActionConfigurationSidebarCell()
{
  uint64_t result = qword_100022AC8;
  if (!qword_100022AC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012AE8()
{
  sub_100014A70();
  sub_1000139EC();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100012B70(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100014A70() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_10000F5A0(a1, a2, v6);
}

uint64_t sub_100012BF0()
{
  return sub_100014F10();
}

uint64_t *sub_100012C18(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_1000054E4(&qword_100022A60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100014EE0();
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
    uint64_t v12 = sub_100014D50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_100014A70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_100012DC0(uint64_t a1, uint64_t a2)
{
  sub_1000054E4(&qword_100022A60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100014EE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100014D50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_100014A70();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

void *sub_100012EDC(void *a1, void *a2, uint64_t a3)
{
  sub_1000054E4(&qword_100022A60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100014EE0();
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
  uint64_t v10 = sub_100014D50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100014A70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

void *sub_100013034(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100013898((uint64_t)a1, &qword_100022A60);
    sub_1000054E4(&qword_100022A60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100014EE0();
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
  uint64_t v10 = sub_100014D50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100014A70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

char *sub_1000131A4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000054E4(&qword_100022A60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100014EE0();
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
  uint64_t v11 = sub_100014D50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100014A70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

char *sub_100013304(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100013898((uint64_t)a1, &qword_100022A60);
    uint64_t v6 = sub_1000054E4(&qword_100022A60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100014EE0();
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
  uint64_t v11 = sub_100014D50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_100014A70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_10001347C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013490);
}

uint64_t sub_100013490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000054E4(&qword_100022A68);
  sub_100013990();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_100014D50();
    sub_100013990();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = sub_100014A70();
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }
  return sub_100007ECC(v9, a2, v8);
}

uint64_t sub_100013534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013548);
}

uint64_t sub_100013548(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1000054E4(&qword_100022A68);
  sub_100013990();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_100014D50();
    sub_100013990();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_100014A70();
      uint64_t v14 = *(int *)(a4 + 24);
    }
    uint64_t v11 = a1 + v14;
  }
  return sub_100005528(v11, a2, a2, v10);
}

void sub_1000135F4()
{
  sub_1000136F8();
  if (v0 <= 0x3F)
  {
    sub_100014D50();
    if (v1 <= 0x3F)
    {
      sub_100014A70();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1000136F8()
{
  if (!qword_100022AD8)
  {
    sub_100014EE0();
    unint64_t v0 = sub_100014EF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100022AD8);
    }
  }
}

uint64_t sub_100013750(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100019718, 1);
}

uint64_t sub_10001376C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000054E4(&qword_100022B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000137D4()
{
  unint64_t result = qword_100022B48;
  if (!qword_100022B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022B48);
  }
  return result;
}

uint64_t sub_100013820(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100013838(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000054E4(a3);
  sub_1000139EC();
  uint64_t v4 = sub_100013A74();
  v5(v4);
  return a2;
}

uint64_t sub_100013888(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100013898(uint64_t a1, uint64_t *a2)
{
  sub_1000054E4(a2);
  sub_1000139EC();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1000138EC()
{
  return sub_100013928(&qword_100022B58, &qword_100022B30);
}

uint64_t sub_100013928(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000056E4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000139FC()
{
  return v0;
}

double sub_100013A10()
{
  return v0;
}

uint64_t sub_100013A24(uint64_t a1, uint64_t a2)
{
  return _swift_deallocObject(a1, a2, 7);
}

uint64_t sub_100013A2C()
{
  return 0;
}

uint64_t sub_100013A74()
{
  return v0;
}

uint64_t sub_100013A88(void *a1)
{
  uint64_t v2 = sub_1000054E4(&qword_1000224E8);
  uint64_t v3 = sub_100006D48(v2);
  __chkstk_darwin(v3);
  sub_100006CD4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100014C50();
  uint64_t v8 = sub_100006D48(v7);
  __chkstk_darwin(v8);
  sub_100006CD4();
  uint64_t v9 = sub_100014C30();
  uint64_t v10 = sub_100006D48(v9);
  __chkstk_darwin(v10);
  sub_100006CD4();
  uint64_t v11 = sub_1000149D0();
  uint64_t v12 = sub_100006D48(v11);
  __chkstk_darwin(v12);
  sub_100006CD4();
  uint64_t v13 = sub_100014AA0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_100006CD4();
  uint64_t v17 = v16 - v15;
  sub_1000054E4(&qword_1000224F0);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100016040;
  id v19 = [self defaultDatabase];
  sub_100014C10();
  sub_100006D14();
  uint64_t v20 = sub_100014C00();
  uint64_t v21 = sub_100006C6C(&qword_1000224F8, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerUserLibraryDataSource);
  *(void *)(v18 + 32) = v20;
  *(void *)(v18 + 40) = v21;
  sub_100014C70();
  sub_100006D14();
  uint64_t v22 = sub_100014C60();
  uint64_t v23 = sub_100006C6C(&qword_100022500, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerPromotedActionsDataSource);
  *(void *)(v18 + 48) = v22;
  *(void *)(v18 + 56) = v23;
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v17, enum case for SmartShortcutPickerViewStyle.pencilSettings(_:), v13);
  sub_100014C90();
  sub_100006D14();
  uint64_t v24 = sub_100014C80();
  uint64_t v25 = sub_100006C6C(&qword_100022508, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerStaccatoSuggestionsDataSource);
  *(void *)(v18 + 64) = v24;
  *(void *)(v18 + 72) = v25;
  [objc_allocWithZone((Class)LNAutoShortcutsProvider) init];
  sub_1000149C0();
  sub_1000149F0();
  sub_100006D14();
  uint64_t v26 = sub_1000149E0();
  uint64_t v27 = sub_100006C6C(&qword_100022510, (void (*)(uint64_t))&type metadata accessor for SmartShortcutPickerAppShortcutDataSource);
  *(void *)(v18 + 80) = v26;
  *(void *)(v18 + 88) = v27;
  id v28 = a1;
  sub_100014C20();
  id v29 = v28;
  sub_100014C40();
  uint64_t v30 = sub_100014A00();
  sub_100005528(v6, 1, 1, v30);
  sub_100014B00();
  sub_100006D14();
  return sub_100014AD0();
}

id sub_100013E6C()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for PencilActionConfigurationViewController());
  uint64_t v1 = swift_retain();
  return sub_100002FD0(v1);
}

uint64_t type metadata accessor for PencilActionConfigurationViewModel()
{
  return self;
}

uint64_t sub_100013ECC(void *a1)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (a1)
  {
    if (!result) {
      return result;
    }
    id v3 = a1;
    sub_100009D4C((uint64_t)v3);
  }
  else
  {
    if (!result) {
      return result;
    }
    sub_100009E04();
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_100013F3C()
{
  sub_100007EA4(v0 + 16);

  swift_release();
  return v0;
}

void sub_100013F74(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
  id v3 = a1;

  sub_100014100();
}

void sub_100013FC4()
{
}

uint64_t sub_100014008()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    sub_100009EA0();
    return swift_unknownObjectRelease();
  }
  return result;
}

void *sub_100014060(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  v2[3] = 0;
  swift_unknownObjectWeakInit();
  v2[4] = 0;
  v2[5] = (*(uint64_t (**)(uint64_t))(v4 + 168))(a1);
  v2[6] = a1;
  return v2;
}

uint64_t sub_100014100()
{
  uint64_t v1 = sub_100014D10();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  __chkstk_darwin(v3);
  uint64_t v41 = (char *)v33 - v4;
  uint64_t v5 = sub_1000054E4(&qword_100022DE0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v40 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v33 - v8;
  uint64_t v10 = sub_100014B40();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)v33 - v15;
  __chkstk_darwin(v14);
  id v19 = (char *)v33 - v18;
  uint64_t v20 = *(void **)(v0 + 32);
  if (!v20
    || (uint64_t v38 = v0,
        uint64_t v39 = v17,
        uint64_t v42 = (uint64_t)v20,
        sub_10001484C(),
        id v21 = v20,
        sub_1000054E4(&qword_100022DF8),
        (swift_dynamicCast() & 1) == 0))
  {
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    return sub_10000D1A8((uint64_t)&v43, &qword_100022DE8);
  }
  if (!*((void *)&v44 + 1)) {
    return sub_10000D1A8((uint64_t)&v43, &qword_100022DE8);
  }
  uint64_t v36 = v2;
  uint64_t v37 = v1;
  sub_10001488C(&v43, (uint64_t)v46);
  sub_1000148A4(v46, v46[3]);
  sub_100014B90();
  int v23 = sub_100007ECC((uint64_t)v9, 1, v10);
  if (v23 == 1)
  {
    sub_10000D1A8((uint64_t)v9, &qword_100022DE0);
    return sub_10000D218((uint64_t)v46);
  }
  uint64_t v24 = v39;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v19, v9, v10);
  uint64_t result = WFLogCategorySystemActionConfiguration;
  if (WFLogCategorySystemActionConfiguration)
  {
    uint64_t v25 = v41;
    sub_100014CF0();
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
    v35(v16, v19, v10);
    uint64_t v26 = sub_100014D00();
    os_log_type_t v27 = sub_100015160();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(void *)&long long v43 = v34;
      *(_DWORD *)id v28 = 136315138;
      v33[1] = v28 + 4;
      v35(v13, v16, v10);
      uint64_t v29 = sub_100015090();
      uint64_t v42 = sub_10000C940(v29, v30, (uint64_t *)&v43);
      sub_1000151E0();
      swift_bridgeObjectRelease();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v24 + 8);
      v31(v16, v10);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Selecting entry with identifier: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v41, v37);
    }
    else
    {
      uint64_t v31 = *(void (**)(char *, uint64_t))(v24 + 8);
      v31(v16, v10);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v37);
    }
    uint64_t v32 = (uint64_t)v40;
    v35(v40, v19, v10);
    sub_100005528(v32, 0, 1, v10);
    sub_100014AF0();
    v31(v19, v10);
    return sub_10000D218((uint64_t)v46);
  }
  __break(1u);
  return result;
}

void sub_1000147B0()
{
}

uint64_t sub_1000147F4()
{
  sub_100013F3C();
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for SystemActionConfigurationViewModel()
{
  return self;
}

unint64_t sub_10001484C()
{
  unint64_t result = qword_100022DF0;
  if (!qword_100022DF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100022DF0);
  }
  return result;
}

uint64_t sub_10001488C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_1000148A4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000148E8()
{
  return sub_100015290();
}

uint64_t sub_100014910()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_100014920()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_100014930()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_100014940()
{
  return _convertErrorToNSError(_:)();
}

NSData sub_100014950()
{
  return Data._bridgeToObjectiveC()();
}

NSIndexPath sub_100014960()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_100014970()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014980()
{
  return IndexPath.init(row:section:)();
}

uint64_t sub_100014990()
{
  return IndexPath.row.getter();
}

uint64_t sub_1000149A0()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_1000149B0()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_1000149C0()
{
  return static SmartShortcutPickerAppShortcutDataSource.Options.default.getter();
}

uint64_t sub_1000149D0()
{
  return type metadata accessor for SmartShortcutPickerAppShortcutDataSource.Options();
}

uint64_t sub_1000149E0()
{
  return SmartShortcutPickerAppShortcutDataSource.init(provider:options:denyListEnvironment:)();
}

uint64_t sub_1000149F0()
{
  return type metadata accessor for SmartShortcutPickerAppShortcutDataSource();
}

uint64_t sub_100014A00()
{
  return type metadata accessor for SmartShortcutPickerEntry.Identifier();
}

uint64_t sub_100014A10()
{
  return SmartShortcutPickerSection.isUserLibrary.getter();
}

uint64_t sub_100014A20()
{
  return SmartShortcutPickerSection.isUserLibraryFolder.getter();
}

uint64_t sub_100014A30()
{
  return type metadata accessor for SmartShortcutPickerSection.ID();
}

uint64_t sub_100014A40()
{
  return SmartShortcutPickerSection.id.getter();
}

uint64_t sub_100014A50()
{
  return SmartShortcutPickerSection.icon.getter();
}

uint64_t sub_100014A60()
{
  return SmartShortcutPickerSection.title.getter();
}

uint64_t sub_100014A70()
{
  return type metadata accessor for SmartShortcutPickerSection();
}

uint64_t sub_100014A80()
{
  return type metadata accessor for SmartShortcutPickerSelection();
}

uint64_t sub_100014A90()
{
  return SmartShortcutPickerViewStyle.init(with:)();
}

uint64_t sub_100014AA0()
{
  return type metadata accessor for SmartShortcutPickerViewStyle();
}

uint64_t sub_100014AB0()
{
  return SmartShortcutPickerDataSource.searchText.getter();
}

uint64_t sub_100014AC0()
{
  return SmartShortcutPickerDataSource.searchText.setter();
}

uint64_t sub_100014AD0()
{
  return SmartShortcutPickerDataSource.init(dataSources:appAvailabilityContext:appAvailabilityStrategy:selectedEntry:)();
}

uint64_t sub_100014AE0()
{
  return SmartShortcutPickerDataSource.sections.getter();
}

uint64_t sub_100014AF0()
{
  return SmartShortcutPickerDataSource.selection.setter();
}

uint64_t sub_100014B00()
{
  return type metadata accessor for SmartShortcutPickerDataSource();
}

uint64_t sub_100014B10()
{
  return SmartShortcutPickerSelectedEntry.colorScheme.getter();
}

uint64_t sub_100014B20()
{
  return SmartShortcutPickerSelectedEntry.iconOverride.getter();
}

uint64_t sub_100014B30()
{
  return SmartShortcutPickerSelectedEntry.sectionIdentifier.getter();
}

uint64_t sub_100014B40()
{
  return type metadata accessor for SmartShortcutPickerSelectedEntry();
}

uint64_t sub_100014B60()
{
  return type metadata accessor for SmartShortcutPickerActionTemplate();
}

uint64_t sub_100014B70()
{
  return SmartShortcutPickerViewController.init(dataSource:style:selectionCoordinator:)();
}

uint64_t sub_100014B80()
{
  return type metadata accessor for SmartShortcutPickerViewController();
}

uint64_t sub_100014B90()
{
  return dispatch thunk of SmartShortcutPickerEntryIdentifiable.smartPickerSelectionIdentifier()();
}

uint64_t sub_100014BA0()
{
  return SmartShortcutPickerBaseViewController.collectionView.getter();
}

uint64_t sub_100014BB0()
{
  return type metadata accessor for SmartShortcutPickerActionConfiguration();
}

uint64_t sub_100014BC0()
{
  return SmartShortcutPickerSelectionCoordinator.init(style:selectionHandler:errorHandler:)();
}

uint64_t sub_100014BD0()
{
  return SmartShortcutPickerSelectionCoordinator.deinit();
}

uint64_t sub_100014BE0()
{
  return SmartShortcutPickerSelectedEntryMetadata.init(configuration:configurationIdentifier:sectionIdentifier:)();
}

uint64_t sub_100014BF0()
{
  return type metadata accessor for SmartShortcutPickerSelectedEntryMetadata();
}

uint64_t sub_100014C00()
{
  return SmartShortcutPickerUserLibraryDataSource.init(database:)();
}

uint64_t sub_100014C10()
{
  return type metadata accessor for SmartShortcutPickerUserLibraryDataSource();
}

uint64_t sub_100014C20()
{
  return SmartShortcutPickerAppAvailabilityChecker.Availability.init(configurationContext:)();
}

uint64_t sub_100014C30()
{
  return type metadata accessor for SmartShortcutPickerAppAvailabilityChecker.Availability();
}

uint64_t sub_100014C40()
{
  return SmartShortcutPickerAppAvailabilityChecker.Strategy.init(configurationContext:)();
}

uint64_t sub_100014C50()
{
  return type metadata accessor for SmartShortcutPickerAppAvailabilityChecker.Strategy();
}

uint64_t sub_100014C60()
{
  return SmartShortcutPickerPromotedActionsDataSource.init()();
}

uint64_t sub_100014C70()
{
  return type metadata accessor for SmartShortcutPickerPromotedActionsDataSource();
}

uint64_t sub_100014C80()
{
  return SmartShortcutPickerStaccatoSuggestionsDataSource.init(style:)();
}

uint64_t sub_100014C90()
{
  return type metadata accessor for SmartShortcutPickerStaccatoSuggestionsDataSource();
}

uint64_t sub_100014CA0()
{
  return clamp<A>(_:to:)();
}

uint64_t sub_100014CB0()
{
  return type metadata accessor for IconSize();
}

uint64_t sub_100014CC0()
{
  return type metadata accessor for IconView.DisplayMode();
}

uint64_t sub_100014CD0()
{
  return type metadata accessor for IconView();
}

uint64_t sub_100014CE0()
{
  return IconView.init(_:size:displayMode:animated:)();
}

uint64_t sub_100014CF0()
{
  return static WFLog.subscript.getter();
}

uint64_t sub_100014D00()
{
  return Logger.logObject.getter();
}

uint64_t sub_100014D10()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100014D20()
{
  return UICellConfigurationState.isSelected.getter();
}

uint64_t sub_100014D30()
{
  return UICellConfigurationState.isHighlighted.getter();
}

uint64_t sub_100014D40()
{
  return static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014D50()
{
  return type metadata accessor for UICellConfigurationState();
}

uint64_t sub_100014D60()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_100014D70()
{
  return UIBackgroundConfiguration.backgroundColorTransformer.setter();
}

uint64_t sub_100014D80()
{
  return static UIBackgroundConfiguration.listAccompaniedSidebarCell()();
}

uint64_t sub_100014D90()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t sub_100014DA0()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_100014DB0(Swift::OpaquePointer a1)
{
}

uint64_t sub_100014DC0()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_100014DD0()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_100014DE0()
{
  return UIConfigurationColorTransformer.init(_:)();
}

uint64_t sub_100014DF0()
{
  return static UIContentUnavailableConfiguration.search()();
}

uint64_t sub_100014E00()
{
  return type metadata accessor for UIContentUnavailableConfiguration();
}

uint64_t sub_100014E10()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_100014E20()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t sub_100014E30()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_100014E40()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t sub_100014E50()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t sub_100014E60()
{
  return UICollectionLayoutListConfiguration.backgroundColor.setter();
}

uint64_t sub_100014E70()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t sub_100014E80()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_100014E90()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100014EA0()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t sub_100014EB0()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_100014EC0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100014ED0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100014EE0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100014EF0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100014F00()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100014F10()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100014F20()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100014F30()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100014F40()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100014F50()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100014F60()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_100014F70()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100014F80()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100014F90()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_100014FA0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_100014FB0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100014FC0()
{
  return Text.font(_:)();
}

uint64_t sub_100014FD0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100014FE0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100014FF0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100015000()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100015010()
{
  return static Color.primary.getter();
}

uint64_t sub_100015020()
{
  return static Alignment.center.getter();
}

uint64_t sub_100015030()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015040()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100015050()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100015060()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100015070()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100015080()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015090()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000150A0()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t sub_1000150B0()
{
  return String.hash(into:)();
}

Swift::Int sub_1000150C0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000150D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000150E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000150F0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100015100()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100015110()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100015120()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100015130()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100015140()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100015150()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100015160()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100015170()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t sub_100015180()
{
  return UICollectionViewCell.backgroundConfiguration.setter();
}

uint64_t sub_100015190()
{
  return UICollectionViewCell.configurationUpdateHandler.setter();
}

uint64_t sub_1000151A0()
{
  return UIContentUnavailableView.init(configuration:)();
}

uint64_t sub_1000151B0()
{
  return static UICollectionViewCompositionalLayout.list(using:)();
}

uint64_t sub_1000151C0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_1000151D0()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_1000151E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000151F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100015200()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_100015220(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100015230()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100015240()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100015250()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100015260()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100015270()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100015280()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100015290()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000152A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000152B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000152D0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000152E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000152F0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100015300()
{
  return Error._code.getter();
}

uint64_t sub_100015310()
{
  return Error._domain.getter();
}

uint64_t sub_100015320()
{
  return Error._userInfo.getter();
}

uint64_t sub_100015330()
{
  return Hasher.init(_seed:)();
}

void sub_100015340(Swift::UInt a1)
{
}

Swift::Int sub_100015350()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WFSystemActionConfigurationHostXPCInterface()
{
  return _WFSystemActionConfigurationHostXPCInterface();
}

uint64_t WFSystemActionConfigurationServiceXPCInterface()
{
  return _WFSystemActionConfigurationServiceXPCInterface();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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