uint64_t sub_2619EBD48(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;

  v14 = sub_2619EE7D0();
  v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388]();
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2619EBEB0(a2, a3);
  sub_2619EE7C0();
  sub_2619EC1B8(a1, (uint64_t)v17, a4, a5, a6, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_2619EBEB0(uint64_t a1, unint64_t a2)
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

void sub_2619EC148(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_2619EE770();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_2619EC1B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  uint64_t v29 = a3;
  id v30 = a1;
  uint64_t v10 = sub_2619EE7D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v6 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_lastPresenter;
  swift_unknownObjectWeakAssign();
  v14 = (uint64_t *)(v6 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  uint64_t v15 = *(void *)(v6 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  uint64_t *v14 = a3;
  v14[1] = a4;
  swift_retain();
  sub_2619EC4B8(v15);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v16(v13, a2, v10);
  v17 = (objc_class *)type metadata accessor for WorkoutHostingRemoteViewController();
  v18 = (char *)objc_allocWithZone(v17);
  v19 = (uint64_t *)&v18[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion];
  uint64_t *v19 = 0;
  v19[1] = 0;
  *(void *)&v18[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController] = 0;
  v16(&v18[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_workout], (uint64_t)v13, v10);
  uint64_t v20 = *v19;
  uint64_t *v19 = v29;
  v19[1] = a4;
  swift_retain_n();
  sub_2619EC4B8(v20);
  v35.receiver = v18;
  v35.super_class = v17;
  id v21 = objc_msgSendSuper2(&v35, sel_initWithNibName_bundle_, 0, 0);
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  id v22 = v30;
  id v23 = objc_msgSend(v22, sel_presentedViewController);
  if (v23)
  {
    do
    {
      v24 = v23;

      id v23 = objc_msgSend(v24, sel_presentedViewController);
      id v22 = v24;
    }
    while (v23);
  }
  else
  {
    v24 = v22;
  }
  swift_unknownObjectWeakAssign();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v33;
  *(void *)(v25 + 16) = v32;
  *(void *)(v25 + 24) = v26;
  aBlock[4] = sub_2619EC54C;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2619EC57C;
  aBlock[3] = &block_descriptor;
  v27 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v24, sel_presentViewController_animated_completion_, v21, 1, v27);
  _Block_release(v27);
}

uint64_t sub_2619EC4B8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for WorkoutHostingRemoteViewController()
{
  uint64_t result = qword_26A942768;
  if (!qword_26A942768) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2619EC514()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2619EC54C()
{
  return (*(uint64_t (**)(uint64_t, void))(v0 + 16))(1, 0);
}

uint64_t sub_2619EC57C(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2619EC5D8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_presentedViewController);
  if (v2)
  {
    v3 = v2;
    type metadata accessor for WorkoutHostingRemoteViewController();
    v4 = (void *)swift_dynamicCastClass();
    if (v4) {
      objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
  swift_unknownObjectWeakAssign();
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  *uint64_t v5 = 0;
  v5[1] = 0;
  return sub_2619EC4B8(v6);
}

uint64_t sub_2619EC6E0()
{
  uint64_t v1 = (void *)MEMORY[0x263E48560](v0 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_lastPresenter);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v1, sel_presentedViewController);
    if (v3)
    {
      v4 = v3;
      type metadata accessor for WorkoutHostingRemoteViewController();
      uint64_t v5 = (void *)swift_dynamicCastClass();
      if (v5) {
        objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, 0);
      }
    }
    else
    {
      v4 = v2;
    }
  }
  swift_unknownObjectWeakAssign();
  uint64_t v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  v7 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  if (v7)
  {
    uint64_t v8 = swift_retain();
    v7(v8);
    sub_2619EC4B8((uint64_t)v7);
    uint64_t v9 = *v6;
  }
  else
  {
    uint64_t v9 = 0;
  }
  *uint64_t v6 = 0;
  v6[1] = 0;
  return sub_2619EC4B8(v9);
}

id WorkoutRemoteViewServiceAdaptor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id WorkoutRemoteViewServiceAdaptor.init()()
{
  swift_unknownObjectWeakInit();
  id v1 = &v0[OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion];
  id v2 = (objc_class *)type metadata accessor for WorkoutRemoteViewServiceAdaptor();
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for WorkoutRemoteViewServiceAdaptor()
{
  return self;
}

id WorkoutRemoteViewServiceAdaptor.__deallocating_deinit(uint64_t a1)
{
  return sub_2619ED638(a1, type metadata accessor for WorkoutRemoteViewServiceAdaptor);
}

uint64_t method lookup function for WorkoutRemoteViewServiceAdaptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WorkoutRemoteViewServiceAdaptor);
}

uint64_t dispatch thunk of WorkoutRemoteViewServiceAdaptor.presentRemoteViewController(on:with:dismissCompletion:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WorkoutRemoteViewServiceAdaptor.dismissRemoteViewController(on:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

id sub_2619ECAE4()
{
  id v1 = v0;
  v24.receiver = v0;
  v24.super_class = (Class)type metadata accessor for WorkoutHostingRemoteViewController();
  objc_msgSendSuper2(&v24, sel_viewDidLoad);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F823E8]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  objc_super v4 = result;
  objc_msgSend(result, sel_addSubview_, v2);

  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = result;
  id v6 = objc_msgSend(self, sel_systemBackgroundColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  objc_msgSend(v2, sel_startAnimating);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A942778);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2619EEDA0;
  id v8 = objc_msgSend(v2, sel_centerXAnchor);
  id result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v9 = result;
  id v10 = objc_msgSend(result, sel_centerXAnchor);

  id v11 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v10);
  *(void *)(v7 + 32) = v11;
  id v12 = objc_msgSend(v2, sel_centerYAnchor);
  id result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v13 = result;
    v14 = self;
    id v15 = objc_msgSend(v13, sel_centerYAnchor);

    id v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
    *(void *)(v7 + 40) = v16;
    sub_2619EE810();
    sub_2619ED7F4();
    v17 = (void *)sub_2619EE800();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_activateConstraints_, v17);

    type metadata accessor for WorkoutRemoteViewController();
    uint64_t v18 = (uint64_t)v1 + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_workout;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v1;
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = v2;
    id v22 = v1;
    swift_retain();
    id v23 = v2;
    sub_2619EDA60(v18, (uint64_t)sub_2619ED86C, v19, (uint64_t)sub_2619ED8EC, v21);

    swift_release();
    swift_release();
    return (id)swift_release();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_2619ECE78(uint64_t result)
{
  id v1 = *(void (**)(uint64_t))(result
                                      + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_2619EC4B8((uint64_t)v1);
  }
  return result;
}

void sub_2619ECEE0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = a3 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x263E48560](v7);
  if (v8)
  {
    uint64_t v9 = (char *)v8;
    if (a2 || !a1)
    {
      id v10 = *(void (**)(uint64_t))(v8
                                           + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
      if (!v10)
      {
LABEL_6:

        return;
      }
      uint64_t v11 = swift_retain();
      v10(v11);
    }
    else
    {
      id v15 = a1;
      id v16 = objc_msgSend(v15, sel_view);
      if (v16)
      {
        v17 = v16;
        id v18 = objc_msgSend(self, sel_currentDevice);
        id v19 = objc_msgSend(v18, sel_userInterfaceIdiom);

        if (v19 == (id)1)
        {
          objc_msgSend(v15, sel_setModalPresentationStyle_, 2);
          objc_msgSend(v15, sel_setPreferredContentSize_, 0.0, 0.0);
        }
        objc_msgSend(v9, sel_addChildViewController_, v15);
        objc_msgSend(v17, sel_setAlpha_, 0.0);
        objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        id v20 = objc_msgSend(v9, sel_view);
        if (v20)
        {
          uint64_t v21 = v20;
          objc_msgSend(v20, sel_addSubview_, v17);

          __swift_instantiateConcreteTypeFromMangledName(&qword_26A942778);
          uint64_t v22 = swift_allocObject();
          *(_OWORD *)(v22 + 16) = xmmword_2619EEDB0;
          id v23 = objc_msgSend(v17, sel_leadingAnchor);
          id v24 = objc_msgSend(v9, sel_view);
          if (v24)
          {
            uint64_t v25 = v24;
            id v26 = objc_msgSend(v24, sel_leadingAnchor);

            id v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v26);
            *(void *)(v22 + 32) = v27;
            id v28 = objc_msgSend(v17, sel_trailingAnchor);
            id v29 = objc_msgSend(v9, sel_view);
            if (v29)
            {
              id v30 = v29;
              id v31 = objc_msgSend(v29, sel_trailingAnchor);

              id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
              *(void *)(v22 + 40) = v32;
              id v33 = objc_msgSend(v17, sel_topAnchor);
              id v34 = objc_msgSend(v9, sel_view);
              if (v34)
              {
                objc_super v35 = v34;
                id v36 = objc_msgSend(v34, sel_topAnchor);

                id v37 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v36);
                *(void *)(v22 + 48) = v37;
                id v38 = objc_msgSend(v17, sel_bottomAnchor);
                id v39 = objc_msgSend(v9, sel_view);
                if (v39)
                {
                  v40 = v39;
                  v41 = self;
                  id v42 = objc_msgSend(v40, sel_bottomAnchor);

                  id v43 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v42);
                  *(void *)(v22 + 56) = v43;
                  sub_2619EE810();
                  sub_2619ED7F4();
                  v44 = (void *)sub_2619EE800();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v41, sel_activateConstraints_, v44);

                  objc_msgSend(v15, sel_didMoveToParentViewController_, v9);
                  v45 = self;
                  uint64_t v46 = swift_allocObject();
                  *(void *)(v46 + 16) = v17;
                  *(void *)(v46 + 24) = a4;
                  v59 = sub_2619ED944;
                  uint64_t v60 = v46;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v56 = 1107296256;
                  v57 = sub_2619EC57C;
                  v58 = &block_descriptor_33;
                  v47 = _Block_copy(&aBlock);
                  id v48 = v17;
                  id v49 = a4;
                  swift_release();
                  uint64_t v50 = swift_allocObject();
                  *(void *)(v50 + 16) = v49;
                  v59 = sub_2619ED990;
                  uint64_t v60 = v50;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v56 = 1107296256;
                  v57 = sub_2619ED54C;
                  v58 = &block_descriptor_39;
                  v51 = _Block_copy(&aBlock);
                  id v52 = v49;
                  swift_release();
                  objc_msgSend(v45, sel_animateWithDuration_animations_completion_, v47, v51, 0.2);
                  _Block_release(v51);
                  _Block_release(v47);
                  v53 = *(void **)&v9[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController];
                  *(void *)&v9[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_presentedRemoteViewController] = a1;

                  return;
                }
LABEL_28:
                __break(1u);
                return;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_26;
      }
      id v10 = *(void (**)(uint64_t))&v9[OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion];
      if (!v10)
      {

        return;
      }
      uint64_t v54 = swift_retain();
      v10(v54);
    }
    sub_2619EC4B8((uint64_t)v10);
    goto LABEL_6;
  }
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x263E48560](v7);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = *(void (**)(void))(v12 + OBJC_IVAR____TtC12WorkoutKitUI34WorkoutHostingRemoteViewController_dismissCompletion);
    sub_2619ED8F4((uint64_t)v14);

    if (v14)
    {
      v14();
      sub_2619EC4B8((uint64_t)v14);
    }
  }
}

uint64_t sub_2619ED54C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_2619ED61C()
{
  return sub_2619ED638(0, type metadata accessor for WorkoutHostingRemoteViewController);
}

id sub_2619ED638(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_2619ED704()
{
  return type metadata accessor for WorkoutHostingRemoteViewController();
}

uint64_t sub_2619ED70C()
{
  uint64_t result = sub_2619EE7D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2619ED7F4()
{
  unint64_t result = qword_26A942780;
  if (!qword_26A942780)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A942780);
  }
  return result;
}

uint64_t sub_2619ED834()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2619ED86C()
{
  return sub_2619ECE78(*(void *)(v0 + 16));
}

uint64_t sub_2619ED874()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2619ED8AC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2619ED8EC(void *a1, uint64_t a2)
{
  sub_2619ECEE0(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_2619ED8F4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2619ED904()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_2619ED944()
{
  unint64_t v1 = *(void **)(v0 + 24);
  objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 1.0);
  return objc_msgSend(v1, sel_setAlpha_, 0.0);
}

id sub_2619ED990()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_removeFromSuperview);
}

uint64_t sub_2619ED9A0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2619ED9D8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_2619ED9E8(char a1, uint64_t a2)
{
  sub_2619EC148(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2619ED9F0(uint64_t a1, unint64_t a2)
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

void sub_2619EDA60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a4;
  uint64_t v22 = a2;
  uint64_t v8 = sub_2619EE7D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  uint64_t v12 = (void *)sub_2619EE7E0();
  v13 = (void *)sub_2619EE7E0();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v15 = (v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v21;
  *(void *)(v16 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v14, v11, v8);
  v17 = (void *)(v16 + v15);
  void *v17 = v22;
  v17[1] = a3;
  aBlock[4] = sub_2619EE4BC;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2619EE130;
  aBlock[3] = &block_descriptor_0;
  id v18 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  id v19 = objc_msgSend(ObjCClassFromMetadata, sel_requestViewController_fromServiceWithBundleIdentifier_connectionHandler_, v12, v13, v18);
  _Block_release(v18);
}

uint64_t sub_2619EDCBC()
{
  return 1;
}

uint64_t sub_2619EDCC4()
{
  return sub_2619EE890();
}

uint64_t sub_2619EDD08()
{
  return sub_2619EE880();
}

uint64_t sub_2619EDD30()
{
  return sub_2619EE890();
}

id sub_2619EDD98(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = objc_msgSend(self, sel_interfaceWithProtocol_, *a3);
  return v3;
}

void sub_2619EDE74(void *a1, void *a2, void (*a3)(char *, void *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = sub_2619EE7B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v16 = a2;
    a3(0, a2);
    v17 = a2;
LABEL_7:

    return;
  }
  if (!a1 || (type metadata accessor for WorkoutRemoteViewController(), (uint64_t v18 = swift_dynamicCastClass()) == 0))
  {
    sub_2619EE588();
    uint64_t v21 = swift_allocError();
    a3(0, (void *)v21);
    v17 = (void *)v21;
    goto LABEL_7;
  }
  id v19 = (char *)v18;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F1FEF0], v12);
  id v32 = a1;
  uint64_t v20 = sub_2619EE7A0();
  unint64_t v30 = v22;
  uint64_t v31 = v20;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  id v23 = WorkoutRemoteViewServiceInterfaceFunc(objc_msgSend(v19, sel_serviceViewControllerProxy));
  swift_unknownObjectRelease();
  unint64_t v25 = v30;
  uint64_t v24 = v31;
  if (v23)
  {
    id v26 = (void *)sub_2619EE780();
    objc_msgSend(v23, sel_presentWorkoutDataRepresentation_, v26);

    swift_unknownObjectRelease();
  }
  id v27 = &v19[OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler];
  uint64_t v28 = *(void *)&v19[OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler];
  *(void *)id v27 = a6;
  *((void *)v27 + 1) = a7;
  swift_retain();
  sub_2619EC4B8(v28);
  id v29 = v32;
  a3(v19, 0);
  sub_2619ED9F0(v24, v25);
}

void sub_2619EE130(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_2619EE2DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutRemoteViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WorkoutRemoteViewController()
{
  return self;
}

uint64_t sub_2619EE3D0()
{
  uint64_t v1 = sub_2619EE7D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

void sub_2619EE4BC(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_2619EE7D0() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v7 = *(void (**)(char *, void *))(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  uint64_t v9 = v2 + v6;
  uint64_t v10 = (uint64_t *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  sub_2619EDE74(a1, a2, v7, v8, v9, v11, v12);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_2619EE588()
{
  unint64_t result = qword_26A942860;
  if (!qword_26A942860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A942860);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WorkoutRemoteViewError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WorkoutRemoteViewError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2619EE6D4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2619EE6FC()
{
  return 0;
}

ValueMetadata *type metadata accessor for WorkoutRemoteViewError()
{
  return &type metadata for WorkoutRemoteViewError;
}

unint64_t sub_2619EE71C()
{
  unint64_t result = qword_26A942868;
  if (!qword_26A942868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A942868);
  }
  return result;
}

uint64_t sub_2619EE770()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2619EE780()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2619EE790()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2619EE7A0()
{
  return MEMORY[0x270F07B50]();
}

uint64_t sub_2619EE7B0()
{
  return MEMORY[0x270F07B58]();
}

uint64_t sub_2619EE7C0()
{
  return MEMORY[0x270F07B70]();
}

uint64_t sub_2619EE7D0()
{
  return MEMORY[0x270F07BB0]();
}

uint64_t sub_2619EE7E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2619EE7F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2619EE800()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2619EE810()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2619EE820()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2619EE830()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2619EE840()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2619EE850()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2619EE860()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2619EE870()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2619EE880()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2619EE890()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}