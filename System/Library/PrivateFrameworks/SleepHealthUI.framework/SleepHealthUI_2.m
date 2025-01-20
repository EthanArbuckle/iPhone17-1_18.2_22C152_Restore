uint64_t type metadata accessor for AlarmPreviewPlayer()
{
  return self;
}

uint64_t method lookup function for AlarmPreviewPlayer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AlarmPreviewPlayer);
}

uint64_t dispatch thunk of AlarmPreviewPlayer.__allocating_init(model:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AlarmPreviewPlayer.play()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AlarmPreviewPlayer.stop()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t sub_1AD98BCEC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1AD98BD24(uint64_t a1, void *a2)
{
  sub_1AD98ABBC(a1, a2, *(void *)(v2 + 16));
}

uint64_t block_copy_helper_31(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_31()
{
  return swift_release();
}

id sub_1AD98BD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = &v3[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v7 = (void *)*MEMORY[0x1E4FB2950];
  v8 = self;
  v9 = v3;
  id v10 = objc_msgSend(v8, sel_hk_sleepKeyColor);
  uint64_t v11 = *MEMORY[0x1E4FB09E0];
  id v12 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v13 = v7;
  id v14 = v10;
  id v15 = objc_msgSend(v12, sel_init);
  v16 = v15;
  if (v14) {
    objc_msgSend(v15, sel_setTextColor_, v14);
  }
  uint64_t v17 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_titleLabel;
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  id v18 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)((uint64_t)v13, 0, 0, 0, 0, 0, 0, v11, 0);
  objc_msgSend(v16, sel_setFont_, v18);

  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v16, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v16, sel_setLineBreakMode_, 0);
  objc_msgSend(v16, sel_setNumberOfLines_, 0);

  *(void *)&v9[v17] = v16;
  uint64_t v19 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepFocusModeView;
  v20 = (objc_class *)type metadata accessor for ConfirmationFeatureView();
  *(void *)&v9[v19] = objc_msgSend(objc_allocWithZone(v20), sel_init);
  uint64_t v21 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepScreenView;
  *(void *)&v9[v21] = objc_msgSend(objc_allocWithZone(v20), sel_init);
  uint64_t v22 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_windDownView;
  *(void *)&v9[v22] = objc_msgSend(objc_allocWithZone(v20), sel_init);
  uint64_t v23 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepTrackingView;
  *(void *)&v9[v23] = objc_msgSend(objc_allocWithZone(v20), sel_init);
  uint64_t v24 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_healthStatusView;
  *(void *)&v9[v24] = objc_msgSend(objc_allocWithZone(v20), sel_init);
  *(void *)&v9[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_currentConstraints] = MEMORY[0x1E4FBC860];

  if (a3)
  {
    v25 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v25 = 0;
  }
  v33.receiver = v9;
  v33.super_class = (Class)type metadata accessor for ConfirmationFeaturesTableViewCell();
  id v26 = objc_msgSendSuper2(&v33, sel_initWithStyle_reuseIdentifier_, a1, v25);

  id v27 = v26;
  objc_msgSend(v27, sel_setAccessoryType_, 0);
  objc_msgSend(v27, sel_setSelectionStyle_, 0);
  sub_1AD98C28C();
  sub_1AD98C5E0();
  sub_1AD87B1E0();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1AD9E3070;
  uint64_t v29 = sub_1AD9DD6D0();
  uint64_t v30 = MEMORY[0x1E4FB1138];
  *(void *)(v28 + 32) = v29;
  *(void *)(v28 + 40) = v30;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1AD841D34();
  id v31 = v27;
  sub_1AD9DFD90();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return v31;
}

void sub_1AD98C0F8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x1B3E6D270](v4);
  if (v5)
  {
    v6 = (void *)v5;
    if (a2)
    {
      v7 = self;
      id v8 = a2;
      id v9 = objc_msgSend(v7, sel_currentTraitCollection);
      id v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);
      int v11 = sub_1AD9DFD60();

      id v12 = objc_msgSend(v8, sel_preferredContentSizeCategory);
      LODWORD(v10) = sub_1AD9DFD60();

      if ((v11 ^ v10)) {
        sub_1AD98C5E0();
      }

      v6 = v8;
    }
    else
    {
      sub_1AD98C5E0();
    }
  }
}

uint64_t sub_1AD98C28C()
{
  v1 = v0;
  sub_1AD870B1C();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD9E71F0;
  v3 = *(void **)&v0[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_titleLabel];
  *(void *)(v2 + 32) = v3;
  _._rawValue = (void *)v2;
  sub_1AD9DF870();
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_healthStatusView];
  id v5 = v3;
  id v6 = v4;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8)
                                                                                              + 0x18) >> 1)
    sub_1AD9DF880();
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  v7 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepScreenView];
  id v8 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_windDownView];
  id v9 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepFocusModeView];
  id v10 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepTrackingView];
  if ((unint64_t)_._rawValue >> 62)
  {
    id v21 = v7;
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    swift_bridgeObjectRetain();
    id v11 = (id)sub_1AD9E0190();
    swift_bridgeObjectRelease();
    if (!__OFADD__(v11, 4))
    {
LABEL_5:
      sub_1AD9AF02C();
      sub_1AD9DF870();
      id v11 = v7;
      MEMORY[0x1B3E6B7E0]();
      if (*(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8)
                                                                                                 + 0x18) >> 1)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else
  {
    id v11 = *(id *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v12 = v7;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    if (!__OFADD__(v11, 4)) {
      goto LABEL_5;
    }
  }
  __break(1u);
LABEL_18:
  sub_1AD9DF880();
LABEL_6:
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v16 = v8;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8)
                                                                                              + 0x18) >> 1)
    sub_1AD9DF880();
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v17 = v9;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8)
                                                                                              + 0x18) >> 1)
    sub_1AD9DF880();
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v18 = v10;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_._rawValue & 0xFFFFFFFFFFFFFF8)
                                                                                              + 0x18) >> 1)
    sub_1AD9DF880();
  sub_1AD9DF8B0();
  sub_1AD9DF870();

  id v19 = objc_msgSend(v1, sel_contentView);
  UIView.addSubviews(_:useAutoLayout:)(_, 1);

  return swift_bridgeObjectRelease();
}

id sub_1AD98C5E0()
{
  v1 = v0;
  uint64_t v2 = self;
  uint64_t v3 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_currentConstraints;
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A090);
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_deactivateConstraints_, v4);

  id v5 = objc_msgSend(v1, sel_contentView);
  id v6 = objc_msgSend(v1, sel_contentView);
  id v7 = objc_msgSend(v6, sel_subviews);

  sub_1AD837214(0, &qword_1E9A4C460);
  unint64_t v8 = sub_1AD9DF860();

  id v9 = objc_msgSend(self, sel_currentTraitCollection);
  id v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);
  char v11 = sub_1AD9DFD60();

  double v12 = 14.0;
  if (v11) {
    double v12 = 16.0;
  }
  uint64_t v13 = UIView.constraints(verticallyStackedViews:interitemSpacing:contentInsets:)(v8, v12, 16.0, 0.0, 16.0, 0.0);

  swift_bridgeObjectRelease();
  id v14 = (void *)sub_1AD9DF850();
  objc_msgSend(v2, sel_activateConstraints_, v14);

  *(void *)&v1[v3] = v13;
  swift_bridgeObjectRelease();
  return objc_msgSend(v1, sel_setNeedsLayout);
}

uint64_t sub_1AD98C7E4()
{
  v1 = v0;
  uint64_t v2 = (uint64_t)&v0[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item];
  swift_beginAccess();
  sub_1AD886B10(v2, (uint64_t)v53);
  if (!v54)
  {
    sub_1AD8B1F34((uint64_t)v53, (unint64_t *)&qword_1E9A4A3B8, (unint64_t *)&qword_1E9A4A3C0);
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v52 = 0;
    return sub_1AD8B1F34((uint64_t)&v50, &qword_1E9A4D498, &qword_1E9A4D4A0);
  }
  sub_1AD843E70(0, (unint64_t *)&qword_1E9A4A3C0);
  sub_1AD843E70(0, &qword_1E9A4D4A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v52 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
    return sub_1AD8B1F34((uint64_t)&v50, &qword_1E9A4D498, &qword_1E9A4D4A0);
  }
  if (!*((void *)&v51 + 1)) {
    return sub_1AD8B1F34((uint64_t)&v50, &qword_1E9A4D498, &qword_1E9A4D4A0);
  }
  sub_1AD843F30(&v50, (uint64_t)v53);
  *(void *)&long long v50 = MEMORY[0x1E4FBC860];
  id v3 = *(id *)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_healthStatusView];
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1AD9DF880();
  }
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v4 = *(id *)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepScreenView];
  id v5 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_windDownView];
  id v6 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepFocusModeView];
  id v7 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepTrackingView];
  if ((unint64_t)v50 >> 62)
  {
    id v41 = v4;
    id v42 = v5;
    id v43 = v6;
    id v44 = v7;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_1AD9E0190();
    swift_bridgeObjectRelease();
    if (!__OFADD__(v45, 4))
    {
LABEL_8:
      sub_1AD9AF02C();
      sub_1AD9DF870();
      id v4 = v4;
      MEMORY[0x1B3E6B7E0]();
      if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_9;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v9 = v4;
    id v10 = v5;
    id v11 = v6;
    id v12 = v7;
    if (!__OFADD__(v8, 4)) {
      goto LABEL_8;
    }
  }
  __break(1u);
LABEL_50:
  sub_1AD9DF880();
LABEL_9:
  id v48 = v1;
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v13 = v5;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1AD9DF880();
  }
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v14 = v6;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1AD9DF880();
  }
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  id v15 = v7;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1AD9DF880();
  }
  sub_1AD9DF8B0();
  sub_1AD9DF870();

  uint64_t result = (uint64_t)__swift_project_boxed_opaque_existential_1Tm(v53, v54);
  int v17 = *(unsigned __int8 *)(result + 8);
  uint64_t v18 = v50;
  if ((unint64_t)v50 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1AD9E0190();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v46 = v15;
  if (v19)
  {
    if (v19 >= 1)
    {
      uint64_t v20 = 0;
      unint64_t v49 = v18 & 0xC000000000000001;
      uint64_t v47 = v18;
      while (1)
      {
        if (v49) {
          id v22 = (char *)MEMORY[0x1B3E6BFF0](v20, v18);
        }
        else {
          id v22 = (char *)*(id *)(v18 + 8 * v20 + 32);
        }
        id v23 = v22;
        if (*(void *)&v22[OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel + 8])
        {
          uint64_t v24 = *(void *)&v22[OBJC_IVAR____TtC13SleepHealthUI23ConfirmationFeatureView_viewModel + 32];
          if (v17)
          {
            if ((v24 & 1) == 0) {
              goto LABEL_35;
            }
          }
          else if (v24)
          {
            goto LABEL_35;
          }
          id v25 = objc_msgSend(v48, sel_contentView, v46);
          sub_1AD837214(0, &qword_1E9A4C460);
          id v26 = v23;
          char v27 = sub_1AD9DFD10();

          if (v27)
          {
            if (v17)
            {
              uint64_t v18 = v47;
              if ((v24 & 1) == 0) {
                goto LABEL_35;
              }
            }
            else
            {
              uint64_t v18 = v47;
              if (v24)
              {
LABEL_35:
                id v28 = objc_msgSend(v48, sel_contentView, v46);
                sub_1AD837214(0, &qword_1E9A4C460);
                id v29 = v23;
                char v30 = sub_1AD9DFD10();

                if (v30) {
                  objc_msgSend(v29, sel_removeFromSuperview);
                }
              }
            }
          }
          else
          {
            id v21 = objc_msgSend(v48, (SEL)&selRef_averageSleepStartTime);
            objc_msgSend(v21, sel_addSubview_, v26);

            uint64_t v18 = v47;
          }
        }
        ++v20;

        if (v19 == v20) {
          goto LABEL_40;
        }
      }
    }
    __break(1u);
  }
  else
  {
LABEL_40:
    swift_bridgeObjectRelease();
    id v31 = __swift_project_boxed_opaque_existential_1Tm(v53, v54);
    uint64_t v32 = *(void *)(*v31 + 112);
    uint64_t v33 = *(void *)(*v31 + 120);
    __swift_project_boxed_opaque_existential_1Tm((void *)(*v31 + 88), v32);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v33 + 96))(v32, v33) & 1) == 0)
    {
      id v34 = objc_msgSend(v48, sel_contentView);
      sub_1AD837214(0, &qword_1E9A4C460);
      char v35 = sub_1AD9DFD10();

      if (v35) {
        objc_msgSend(v46, sel_removeFromSuperview);
      }
    }
    v36 = __swift_project_boxed_opaque_existential_1Tm(v53, v54);
    uint64_t v37 = *(void *)(*v36 + 112);
    uint64_t v38 = *(void *)(*v36 + 120);
    __swift_project_boxed_opaque_existential_1Tm((void *)(*v36 + 88), v37);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v38 + 136))(v37, v38) & 1) == 0)
    {
      id v39 = objc_msgSend(v48, sel_contentView);
      sub_1AD837214(0, &qword_1E9A4C460);
      char v40 = sub_1AD9DFD10();

      if (v40) {
        objc_msgSend(v3, sel_removeFromSuperview);
      }
    }
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  }
  return result;
}

uint64_t sub_1AD98CF24()
{
  v1 = v0;
  uint64_t v2 = (uint64_t)&v0[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item];
  swift_beginAccess();
  sub_1AD886B10(v2, (uint64_t)&v25);
  if (*((void *)&v26 + 1))
  {
    sub_1AD843E70(0, (unint64_t *)&qword_1E9A4A3C0);
    sub_1AD843E70(0, &qword_1E9A4D4A0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v37 + 1))
      {
        sub_1AD843F30(&v36, (uint64_t)v47);
        id v3 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_titleLabel];
        id v4 = __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        sub_1AD882078(*((unsigned char *)v4 + 8));
        id v5 = (void *)sub_1AD9DF6D0();
        swift_bridgeObjectRelease();
        objc_msgSend(v3, sel_setText_, v5);

        __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        sub_1AD880D64((uint64_t)&v36);
        id v6 = v41;
        id v7 = v42;
        uint64_t v8 = v43;
        long long v25 = v36;
        long long v26 = v37;
        char v27 = v38;
        __int16 v28 = v39;
        uint64_t v29 = v40;
        char v30 = v41;
        id v31 = v42;
        uint64_t v32 = v43;
        char v33 = v44;
        uint64_t v34 = v45;
        uint64_t v35 = v46;
        sub_1AD87998C((double *)&v25);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v9 = __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        sub_1AD881018(*v9, (uint64_t)&v36);
        id v10 = v41;
        id v11 = v42;
        id v12 = v43;
        long long v25 = v36;
        long long v26 = v37;
        char v27 = v38;
        __int16 v28 = v39;
        uint64_t v29 = v40;
        char v30 = v41;
        id v31 = v42;
        uint64_t v32 = v43;
        char v33 = v44;
        uint64_t v34 = v45;
        uint64_t v35 = v46;
        sub_1AD87998C((double *)&v25);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v13 = __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        sub_1AD881534(*v13, (uint64_t)&v36);
        id v14 = v41;
        id v15 = v42;
        id v16 = v43;
        long long v25 = v36;
        long long v26 = v37;
        char v27 = v38;
        __int16 v28 = v39;
        uint64_t v29 = v40;
        char v30 = v41;
        id v31 = v42;
        uint64_t v32 = v43;
        char v33 = v44;
        uint64_t v34 = v45;
        uint64_t v35 = v46;
        sub_1AD87998C((double *)&v25);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v17 = __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        sub_1AD8812A8(*v17, (uint64_t)&v36);
        uint64_t v18 = v41;
        uint64_t v19 = v42;
        uint64_t v20 = v43;
        long long v25 = v36;
        long long v26 = v37;
        char v27 = v38;
        __int16 v28 = v39;
        uint64_t v29 = v40;
        char v30 = v41;
        id v31 = v42;
        uint64_t v32 = v43;
        char v33 = v44;
        uint64_t v34 = v45;
        uint64_t v35 = v46;
        sub_1AD87998C((double *)&v25);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        sub_1AD881894((uint64_t)&v36);
        id v21 = v41;
        id v22 = v42;
        id v23 = v43;
        long long v25 = v36;
        long long v26 = v37;
        char v27 = v38;
        __int16 v28 = v39;
        uint64_t v29 = v40;
        char v30 = v41;
        id v31 = v42;
        uint64_t v32 = v43;
        char v33 = v44;
        uint64_t v34 = v45;
        uint64_t v35 = v46;
        sub_1AD87998C((double *)&v25);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1AD98C7E4();
        sub_1AD98C5E0();
        __swift_project_boxed_opaque_existential_1Tm(v47, v48);
        objc_msgSend(v1, sel_separatorInset);
        objc_msgSend(v1, sel_setSeparatorInset_);
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
      }
    }
    else
    {
      uint64_t v38 = 0;
      long long v36 = 0u;
      long long v37 = 0u;
    }
  }
  else
  {
    sub_1AD8B1F34((uint64_t)&v25, (unint64_t *)&qword_1E9A4A3B8, (unint64_t *)&qword_1E9A4A3C0);
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v38 = 0;
  }
  return sub_1AD8B1F34((uint64_t)&v36, &qword_1E9A4D498, &qword_1E9A4D4A0);
}

id sub_1AD98D47C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfirmationFeaturesTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfirmationFeaturesTableViewCell()
{
  return self;
}

uint64_t sub_1AD98D598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item;
  swift_beginAccess();
  return sub_1AD886B10(v3, a1);
}

uint64_t sub_1AD98D5EC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item;
  swift_beginAccess();
  sub_1AD8869F8(a1, v3);
  swift_endAccess();
  sub_1AD98CF24();
  return sub_1AD8B1F34(a1, (unint64_t *)&qword_1E9A4A3B8, (unint64_t *)&qword_1E9A4A3C0);
}

uint64_t (*sub_1AD98D674(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1AD98D6D4;
}

uint64_t sub_1AD98D6D4(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_1AD98CF24();
  }
  return result;
}

uint64_t sub_1AD98D708()
{
  return sub_1AD9DD310();
}

void sub_1AD98D77C()
{
  uint64_t v1 = v0;
  objc_super v2 = &v0[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item];
  *(_OWORD *)objc_super v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  uint64_t v3 = (void *)*MEMORY[0x1E4FB2950];
  id v4 = objc_msgSend(self, sel_hk_sleepKeyColor);
  uint64_t v5 = *MEMORY[0x1E4FB09E0];
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = v3;
  id v8 = v4;
  id v9 = objc_msgSend(v6, sel_init);
  id v10 = v9;
  if (v8) {
    objc_msgSend(v9, sel_setTextColor_, v8);
  }
  uint64_t v11 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_titleLabel;
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  id v12 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)((uint64_t)v7, 0, 0, 0, 0, 0, 0, v5, 0);
  objc_msgSend(v10, sel_setFont_, v12);

  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v10, sel_setLineBreakMode_, 0);
  objc_msgSend(v10, sel_setNumberOfLines_, 0);

  *(void *)&v1[v11] = v10;
  uint64_t v13 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepFocusModeView;
  id v14 = (objc_class *)type metadata accessor for ConfirmationFeatureView();
  *(void *)&v1[v13] = objc_msgSend(objc_allocWithZone(v14), sel_init);
  uint64_t v15 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepScreenView;
  *(void *)&v1[v15] = objc_msgSend(objc_allocWithZone(v14), sel_init);
  uint64_t v16 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_windDownView;
  *(void *)&v1[v16] = objc_msgSend(objc_allocWithZone(v14), sel_init);
  uint64_t v17 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepTrackingView;
  *(void *)&v1[v17] = objc_msgSend(objc_allocWithZone(v14), sel_init);
  uint64_t v18 = OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_healthStatusView;
  *(void *)&v1[v18] = objc_msgSend(objc_allocWithZone(v14), sel_init);
  *(void *)&v1[OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_currentConstraints] = MEMORY[0x1E4FBC860];

  sub_1AD9E0140();
  __break(1u);
}

uint64_t sub_1AD98DA0C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AD98DA44(uint64_t a1, void *a2)
{
  sub_1AD98C0F8(a1, a2, v2);
}

void sub_1AD98DA4C()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v1, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_titleLabel]);

  id v2 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v2, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_datePicker]);

  id v3 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v3, sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel]);
}

id sub_1AD98DB28()
{
  sub_1AD91FF18();
  id v1 = *(void **)(v0
                + OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel);
  LODWORD(v2) = 1148813312;
  objc_msgSend(v1, sel_setContentHuggingPriority_forAxis_, 1, v2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v1, sel_setContentCompressionResistancePriority_forAxis_, 1, v3);
  return objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
}

void sub_1AD98DBB0()
{
  id v1 = v0;
  sub_1AD920A20();
  uint64_t v17 = self;
  sub_1AD870B1C();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD9E6BB0;
  double v3 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel];
  id v4 = objc_msgSend(v3, sel_topAnchor);
  id v5 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_datePicker], sel_bottomAnchor);
  id v6 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v5);

  *(void *)(v2 + 32) = v6;
  id v7 = objc_msgSend(v3, sel_leadingAnchor);
  id v8 = objc_msgSend(v1, sel_contentView);
  id v9 = objc_msgSend(v8, sel_layoutMarginsGuide);

  id v10 = objc_msgSend(v9, sel_leadingAnchor);
  id v11 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v10);

  *(void *)(v2 + 40) = v11;
  id v12 = objc_msgSend(v1, sel_contentView);
  id v13 = objc_msgSend(v12, sel_layoutMarginsGuide);

  id v14 = objc_msgSend(v13, sel_trailingAnchor);
  id v15 = objc_msgSend(v3, sel_trailingAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  *(void *)(v2 + 48) = v16;
  sub_1AD9DF870();
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A090);
  id v18 = (id)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_activateConstraints_, v18);
}

void sub_1AD98DE3C()
{
  id v1 = v0;
  uint64_t v2 = self;
  sub_1AD870B1C();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD9E71F0;
  id v4 = objc_msgSend(v1, sel_contentView);
  id v5 = objc_msgSend(v4, sel_layoutMarginsGuide);

  id v6 = objc_msgSend(v5, sel_bottomAnchor);
  id v7 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel], sel_bottomAnchor);
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(void *)(v3 + 32) = v8;
  sub_1AD9DF870();
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A090);
  id v9 = (id)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_activateConstraints_, v9);
}

void sub_1AD98DFBC(unsigned __int8 *a1)
{
  uint64_t v3 = type metadata accessor for SleepScheduleComponentsViewModel();
  MEMORY[0x1F4188790](v3, v4);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD921E98(a1);
  id v7 = &a1[*(int *)(v3 + 68)];
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *((void *)v7 + 1);
  uint64_t v10 = v1 + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_model;
  swift_beginAccess();
  id v11 = (void *)(v10 + *(int *)(v3 + 68));
  uint64_t v12 = v11[1];
  if (!v9)
  {
    if (!v12)
    {
LABEL_14:
      sub_1AD898CF4((uint64_t)a1, (uint64_t)v6);
      goto LABEL_15;
    }
LABEL_10:
    sub_1AD898CF4((uint64_t)a1, (uint64_t)v6);
    goto LABEL_11;
  }
  if (!v12) {
    goto LABEL_10;
  }
  if (v8 == *v11 && v9 == v12) {
    goto LABEL_14;
  }
  char v14 = sub_1AD9E02D0();
  sub_1AD898CF4((uint64_t)a1, (uint64_t)v6);
  if ((v14 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_15:
  uint64_t v15 = *(int *)(v3 + 64);
  id v16 = &v6[v15];
  uint64_t v17 = *(void *)&v6[v15 + 8];
  id v18 = (void *)(v10 + v15);
  uint64_t v19 = v18[1];
  if (!v17)
  {
    swift_bridgeObjectRetain();
    sub_1AD898C98((uint64_t)v6);
    if (!v19) {
      return;
    }
    swift_bridgeObjectRelease();
LABEL_12:
    sub_1AD98E170();
    return;
  }
  if (!v19)
  {
LABEL_11:
    sub_1AD898C98((uint64_t)v6);
    goto LABEL_12;
  }
  if (*(void *)v16 == *v18 && v17 == v19)
  {
    sub_1AD898C98((uint64_t)v6);
    return;
  }
  char v21 = sub_1AD9E02D0();
  sub_1AD898C98((uint64_t)v6);
  if ((v21 & 1) == 0) {
    goto LABEL_12;
  }
}

void sub_1AD98E170()
{
  char v1 = *(unsigned char *)(v0 + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_component);
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_model;
  if (v1)
  {
    swift_beginAccess();
    uint64_t v4 = *(int *)(type metadata accessor for SleepScheduleComponentsViewModel() + 68);
  }
  else
  {
    swift_beginAccess();
    uint64_t v4 = *(int *)(type metadata accessor for SleepScheduleComponentsViewModel() + 64);
  }
  if (*(void *)(v3 + v4 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_msgSend(v2, sel_setText_, v5);
}

id ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    id v6 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel;
  uint64_t v8 = self;
  uint64_t v9 = v4;
  id v10 = objc_msgSend(v8, sel_secondaryLabelColor);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  objc_msgSend(v11, sel_setTextColor_, v10);

  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  id v12 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(*MEMORY[0x1E4FB28F0], 0, 0, 1, 0, 0, 0, *MEMORY[0x1E4FB09E0], 0);
  objc_msgSend(v11, sel_setFont_, v12);

  objc_msgSend(v11, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v11, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v11, sel_setNumberOfLines_, 1);
  id v13 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v11, sel_setText_, v13);

  *(void *)&v4[v7] = v11;
  if (a3)
  {
    char v14 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  v17.receiver = v9;
  v17.super_class = (Class)type metadata accessor for ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell();
  id v15 = objc_msgSendSuper2(&v17, sel_initWithStyle_reuseIdentifier_, a1, v14);

  return v15;
}

void sub_1AD98E508()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13SleepHealthUI60ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell_dayLabel));
}

id ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell()
{
  uint64_t result = qword_1E9A4D4A8;
  if (!qword_1E9A4D4A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AD98E5AC()
{
  return type metadata accessor for ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell();
}

uint64_t sub_1AD98E5B4()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ScheduleOccurrenceComponentsAndDayAccessibilityTableViewCell);
}

uint64_t sub_1AD98E614@<X0>(uint64_t a1@<X8>)
{
  sub_1AD9DDEF0();
  sub_1AD98ED50(&qword_1E9A4D4C0);
  sub_1AD9DFA10();
  sub_1AD9DFA60();
  if (v9[4] == v9[0])
  {
    uint64_t v2 = sub_1AD9DDE20();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    uint64_t v4 = (void (*)(void *, void))sub_1AD9DFAA0();
    uint64_t v6 = v5;
    uint64_t v7 = sub_1AD9DDE20();
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

double ProportionalHStack.sizeThatFits(proposal:subviews:cache:)(uint64_t a1, int a2)
{
  sub_1AD98EC9C();
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v10);
  id v12 = (char *)&v42 - v11;
  uint64_t v13 = sub_1AD9DDE20();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v15);
  objc_super v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v19);
  uint64_t v46 = (char *)&v42 - v20;
  double v21 = *v2;
  double v22 = v2[1];
  sub_1AD98E614((uint64_t)v12);
  id v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v23(v12, 1, v13) == 1)
  {
    uint64_t v24 = (uint64_t)v12;
LABEL_7:
    sub_1AD98ECF4(v24);
    return 0.0;
  }
  int v44 = a2;
  double v43 = *(double *)&a1;
  uint64_t v45 = v17;
  long long v25 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v25(v46, v12, v13);
  sub_1AD9DDEF0();
  sub_1AD98ED50(&qword_1E9A4D4C0);
  if (sub_1AD9DFA40())
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v8, 1, 1, v13);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v14 + 8))(v46, v13);
    uint64_t v24 = (uint64_t)v8;
    goto LABEL_7;
  }
  id v42 = v25;
  sub_1AD9DFA60();
  sub_1AD98ED50(&qword_1E9A4D4C8);
  sub_1AD9DF680();
  long long v26 = (void (*)(char *, void))sub_1AD9DFAA0();
  (*(void (**)(char *))(v14 + 16))(v8);
  v26(v47, 0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v8, 0, 1, v13);
  if (v23(v8, 1, v13) == 1) {
    goto LABEL_6;
  }
  uint64_t v29 = v45;
  v42(v45, v8, v13);
  sub_1AD9DFA10();
  sub_1AD9DFA60();
  if (sub_1AD9DFA50() != 2)
  {
    char v30 = *(void (**)(char *, uint64_t))(v14 + 8);
    v30(v29, v13);
    v30(v46, v13);
    return 0.0;
  }
  if (v44)
  {
    sub_1AD9DE010();
    v47[0] = v31 & 1;
    char v48 = v32 & 1;
    sub_1AD9DDE00();
    double v34 = v33;
    sub_1AD9DE010();
    v47[0] = v35 & 1;
    char v48 = v36 & 1;
    sub_1AD9DDE00();
    double v37 = ceil(v34 / v21);
    double v39 = ceil((v22 + v38) / (1.0 - v21));
    if (v37 > v39) {
      double v27 = v37;
    }
    else {
      double v27 = v39;
    }
  }
  else
  {
    double v27 = v43;
  }
  v47[0] = 0;
  char v48 = 1;
  uint64_t v40 = v46;
  sub_1AD9DDE00();
  v47[0] = 0;
  char v48 = 1;
  sub_1AD9DDE00();
  id v41 = *(void (**)(char *, uint64_t))(v14 + 8);
  v41(v29, v13);
  v41(v40, v13);
  return v27;
}

double static ProportionalHStack.idealWidth(forFirstSubviewWidth:secondSubviewWidth:ratio:spacing:)(double a1, double a2, double a3, double a4)
{
  double result = ceil(a1 / a3);
  double v5 = ceil((a2 + a4) / (1.0 - a3));
  if (result <= v5) {
    return v5;
  }
  return result;
}

void sub_1AD98EC9C()
{
  if (!qword_1E9A4D4B8)
  {
    sub_1AD9DDE20();
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D4B8);
    }
  }
}

uint64_t sub_1AD98ECF4(uint64_t a1)
{
  sub_1AD98EC9C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AD98ED50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AD9DDEF0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ProportionalHStack.placeSubviews(in:proposal:subviews:cache:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1AD98EE80(a1, a2, a3, a4);
}

double sub_1AD98EDB0(uint64_t a1, char a2)
{
  return ProportionalHStack.sizeThatFits(proposal:subviews:cache:)(a1, a2 & 1);
}

uint64_t sub_1AD98EDC0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return sub_1AD98EE80(a1, a2, a3, a4);
}

uint64_t sub_1AD98EDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1AD98EE3C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x1E4F3ED60]);
}

uint64_t sub_1AD98EE04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1AD98EE3C(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x1E4F3ED68]);
}

uint64_t sub_1AD98EE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

uint64_t sub_1AD98EE80(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  sub_1AD98EC9C();
  MEMORY[0x1F4188790](v9 - 8, v10);
  id v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = sub_1AD9DDE20();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17, v19);
  double v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22, v23);
  long long v25 = (char *)&v33 - v24;
  double v26 = *v4;
  sub_1AD98E614((uint64_t)v16);
  double v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v27(v16, 1, v17) == 1) {
    return sub_1AD98ECF4((uint64_t)v16);
  }
  char v35 = v21;
  double v34 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v34(v25, v16, v17);
  sub_1AD9DDEF0();
  sub_1AD98ED50(&qword_1E9A4D4C0);
  if (sub_1AD9DFA40())
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v12, 1, 1, v17);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v17);
    return sub_1AD98ECF4((uint64_t)v12);
  }
  sub_1AD9DFA60();
  sub_1AD98ED50(&qword_1E9A4D4C8);
  sub_1AD9DF680();
  uint64_t v29 = sub_1AD9DFAA0();
  double v33 = v25;
  char v30 = (void (*)(char *, void))v29;
  (*(void (**)(char *))(v18 + 16))(v12);
  v30(v36, 0);
  long long v25 = v33;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v12, 0, 1, v17);
  if (v27(v12, 1, v17) == 1) {
    goto LABEL_6;
  }
  char v31 = v35;
  v34(v35, v12, v17);
  sub_1AD9DFA10();
  sub_1AD9DFA60();
  if (sub_1AD9DFA50() == 2)
  {
    v38.origin.x = a1;
    v38.origin.y = a2;
    v38.size.width = a3;
    v38.size.height = a4;
    ceil(v26 * CGRectGetWidth(v38));
    sub_1AD9DF370();
    v36[0] = 0;
    char v37 = 1;
    sub_1AD9DDE10();
    v39.origin.x = a1;
    v39.origin.y = a2;
    v39.size.width = a3;
    v39.size.height = a4;
    CGRectGetWidth(v39);
    sub_1AD9DF370();
    v36[0] = 0;
    char v37 = 1;
    sub_1AD9DDE10();
  }
  char v32 = *(void (**)(char *, uint64_t))(v18 + 8);
  v32(v31, v17);
  return ((uint64_t (*)(char *, uint64_t))v32)(v25, v17);
}

unint64_t sub_1AD98F304()
{
  unint64_t result = qword_1E9A4D4D0;
  if (!qword_1E9A4D4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D4D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProportionalHStack()
{
  return &type metadata for ProportionalHStack;
}

uint64_t QuickScheduleManagementViewRepresentation.init(sleepStore:provenanceSource:isEditingSchedule:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5;
  return result;
}

char *QuickScheduleManagementViewRepresentation.makeUIViewController(context:)()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  id v3 = objc_allocWithZone((Class)type metadata accessor for QuickScheduleManagementViewController());
  unint64_t result = QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(v1, v2);
  if (result)
  {
    double v5 = result;
    sub_1AD98FDC8();
    sub_1AD9DE710();
    swift_beginAccess();
    swift_unknownObjectWeakAssign();

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id QuickScheduleManagementViewRepresentation.makeCoordinator()()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  char v5 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = (objc_class *)type metadata accessor for QuickScheduleManagementViewRepresentation.Coordinator();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  swift_unknownObjectWeakInit();
  uint64_t v8 = &v7[OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent];
  *(void *)uint64_t v8 = v1;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v3;
  *((void *)v8 + 3) = v4;
  v8[32] = v5;
  v12.receiver = v7;
  v12.super_class = v6;
  id v9 = v1;
  id v10 = v2;
  swift_retain();
  swift_retain();
  return objc_msgSendSuper2(&v12, sel_init);
}

id QuickScheduleManagementViewRepresentation.Coordinator.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 32);
  swift_unknownObjectWeakInit();
  uint64_t v7 = &v3[OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent];
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a1;
  *((void *)v7 + 2) = v4;
  *((void *)v7 + 3) = v5;
  v7[32] = v6;
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

id sub_1AD98F578@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent;
  swift_beginAccess();
  uint64_t v4 = *(void **)v3;
  id v10 = *(id *)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  char v7 = *(unsigned char *)(v3 + 32);
  *(void *)a2 = *(void *)v3;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  swift_retain();
  swift_retain();
  id v8 = v4;
  return v10;
}

uint64_t sub_1AD98F60C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 32);
  uint64_t v7 = *a2 + OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent;
  swift_beginAccess();
  id v8 = *(void **)v7;
  objc_super v9 = *(void **)(v7 + 8);
  *(void *)uint64_t v7 = v2;
  *(void *)(v7 + 8) = v3;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  *(unsigned char *)(v7 + 32) = v6;
  swift_retain();
  swift_retain();
  id v10 = v2;
  id v11 = v3;
  swift_release();

  return swift_release();
}

id sub_1AD98F6C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent;
  swift_beginAccess();
  uint64_t v4 = *(void **)v3;
  id v10 = *(id *)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v6 = *(void *)(v3 + 24);
  char v7 = *(unsigned char *)(v3 + 32);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  swift_retain();
  swift_retain();
  id v8 = v4;
  return v10;
}

uint64_t sub_1AD98F754(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  char v5 = *(unsigned char *)(a1 + 32);
  uint64_t v6 = v1 + OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent;
  swift_beginAccess();
  char v7 = *(void **)v6;
  id v8 = *(void **)(v6 + 8);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a1;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v4;
  *(unsigned char *)(v6 + 32) = v5;
  swift_release();

  return swift_release();
}

uint64_t (*sub_1AD98F7E8())()
{
  return j__swift_endAccess;
}

id QuickScheduleManagementViewRepresentation.Coordinator.init(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  char v5 = *(unsigned char *)(a1 + 32);
  swift_unknownObjectWeakInit();
  uint64_t v6 = &v1[OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent];
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a1;
  *((void *)v6 + 2) = v3;
  *((void *)v6 + 3) = v4;
  v6[32] = v5;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for QuickScheduleManagementViewRepresentation.Coordinator();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_1AD98F8CC()
{
  return sub_1AD9900D4("[%{public}s] Will save schedule.");
}

void sub_1AD98F958(uint64_t a1, void *a2)
{
}

uint64_t sub_1AD98F9D8()
{
  return sub_1AD9900D4("[%{public}s] Did cancel.");
}

void sub_1AD98FA64(uint64_t a1, void *a2)
{
}

id QuickScheduleManagementViewRepresentation.Coordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void QuickScheduleManagementViewRepresentation.Coordinator.init()()
{
}

id QuickScheduleManagementViewRepresentation.Coordinator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QuickScheduleManagementViewRepresentation.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AD98FC1C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void **)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  char v7 = *(unsigned char *)(v1 + 32);
  objc_super v8 = (objc_class *)type metadata accessor for QuickScheduleManagementViewRepresentation.Coordinator();
  objc_super v9 = (char *)objc_allocWithZone(v8);
  swift_unknownObjectWeakInit();
  id v10 = &v9[OBJC_IVAR____TtCV13SleepHealthUI41QuickScheduleManagementViewRepresentation11Coordinator_parent];
  *(void *)id v10 = v3;
  *((void *)v10 + 1) = v4;
  *((void *)v10 + 2) = v5;
  *((void *)v10 + 3) = v6;
  v10[32] = v7;
  v14.receiver = v9;
  v14.super_class = v8;
  id v11 = v3;
  id v12 = v4;
  swift_retain();
  swift_retain();
  id result = objc_msgSendSuper2(&v14, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1AD98FCD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1AD98FE24();
  return MEMORY[0x1F40FAB70](a1, a2, a3, v6);
}

uint64_t sub_1AD98FD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1AD98FE24();
  return MEMORY[0x1F40FAB28](a1, a2, a3, v6);
}

void sub_1AD98FDA0()
{
}

void sub_1AD98FDC8()
{
  if (!qword_1E9A4D4D8)
  {
    sub_1AD98FE24();
    unint64_t v0 = sub_1AD9DE720();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D4D8);
    }
  }
}

unint64_t sub_1AD98FE24()
{
  unint64_t result = qword_1E9A4D4E0;
  if (!qword_1E9A4D4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D4E0);
  }
  return result;
}

uint64_t type metadata accessor for QuickScheduleManagementViewRepresentation.Coordinator()
{
  return self;
}

void sub_1AD98FE9C(void *a1)
{
  swift_getObjectType();
  if (qword_1E9A48EC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9A5A708);
  id v12 = a1;
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v7 = sub_1AD9E04F0();
    sub_1AD838978(v7, v8, &v13);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2082;
    sub_1AD99094C();
    id v9 = v12;
    uint64_t v10 = sub_1AD9DF730();
    sub_1AD838978(v10, v11, &v13);
    sub_1AD9DFEA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "[%{public}s] Did save schedule %{public}s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1AD9900D4(const char *a1)
{
  swift_getObjectType();
  if (qword_1E9A48EC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9A5A708);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_1AD9E04F0();
    sub_1AD838978(v7, v8, v10);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, a1, v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }

  swift_beginAccess();
  sub_1AD94F034();
  return sub_1AD9DF1D0();
}

void sub_1AD9902B4(void *a1)
{
  swift_getObjectType();
  id v2 = objc_msgSend(a1, sel_title);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1AD9DF710();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0x80000001AD9F6840;
    uint64_t v4 = 0xD00000000000001BLL;
  }
  id v7 = objc_msgSend(a1, sel_message);
  if (v7)
  {
    unint64_t v8 = v7;
    sub_1AD9DF710();
  }
  v18[1] = v6;
  sub_1AD9DF790();
  sub_1AD9DF790();
  swift_bridgeObjectRelease();
  uint64_t v10 = v4;
  unint64_t v9 = v6;
  if (qword_1E9A48EC8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1AD9DD550();
  __swift_project_value_buffer(v11, (uint64_t)qword_1E9A5A708);
  swift_bridgeObjectRetain();
  id v12 = sub_1AD9DD530();
  os_log_type_t v13 = sub_1AD9DFBC0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v18[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v16 = sub_1AD9E04F0();
    sub_1AD838978(v16, v17, v18);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    swift_bridgeObjectRetain();
    sub_1AD838978(v10, v9, v18);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AD834000, v12, v13, "[%{public}s] %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v15, -1, -1);
    MEMORY[0x1B3E6D1A0](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t destroy for QuickScheduleManagementViewRepresentation(id *a1)
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for QuickScheduleManagementViewRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  id v6 = v3;
  id v7 = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for QuickScheduleManagementViewRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  unint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for QuickScheduleManagementViewRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for QuickScheduleManagementViewRepresentation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuickScheduleManagementViewRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QuickScheduleManagementViewRepresentation()
{
  return &type metadata for QuickScheduleManagementViewRepresentation;
}

uint64_t method lookup function for QuickScheduleManagementViewRepresentation.Coordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QuickScheduleManagementViewRepresentation.Coordinator);
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.parent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.parent.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.parent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.quickScheduleManagementViewControllerWillSave(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.quickScheduleManagementViewController(_:didSave:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.quickScheduleManagementViewControllerDidCancel(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewRepresentation.Coordinator.quickScheduleManagementViewController(_:shouldPresent:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

void sub_1AD99094C()
{
  if (!qword_1EB7250A0)
  {
    sub_1AD9909A4();
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB7250A0);
    }
  }
}

unint64_t sub_1AD9909A4()
{
  unint64_t result = qword_1EB725090;
  if (!qword_1EB725090)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB725090);
  }
  return result;
}

id static Font.chartUnit.getter()
{
  id result = objc_msgSend(self, sel_sharedBehavior);
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = objc_msgSend(result, sel_isAppleWatch);

    if (v2)
    {
      return (id)sub_1AD9DE960();
    }
    else
    {
      if (qword_1E9A490C0 != -1) {
        swift_once();
      }
      return (id)swift_retain();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Font.short.getter()
{
  uint64_t v0 = sub_1AD9DE940();
  uint64_t v1 = *(void *)(v0 - 8);
  double v3 = MEMORY[0x1F4188790](v0, v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v1 + 104))(v5, *MEMORY[0x1E4F3E0F8], v0, v3);
  uint64_t v6 = sub_1AD9DE970();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v0);
  return v6;
}

uint64_t sub_1AD990BA0(uint64_t a1)
{
  return sub_1AD990BEC(a1, MEMORY[0x1E4F3E150], &qword_1E9A4D4F8);
}

uint64_t static Font.title2Rounded.getter()
{
  return sub_1AD8B1018(&qword_1E9A490B8);
}

uint64_t sub_1AD990BD8(uint64_t a1)
{
  return sub_1AD990BEC(a1, MEMORY[0x1E4F3E178], &qword_1E9A4D500);
}

uint64_t sub_1AD990BEC(uint64_t a1, unsigned int *a2, uint64_t *a3)
{
  sub_1AD9914E4();
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1AD9DE9A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  os_log_type_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, *a2, v9);
  uint64_t v14 = *MEMORY[0x1E4F3E090];
  uint64_t v15 = sub_1AD9DE890();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v8, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v8, 0, 1, v15);
  uint64_t v17 = sub_1AD9DE8F0();
  sub_1AD99153C((uint64_t)v8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  *a3 = v17;
  return result;
}

uint64_t static Font.footnoteRounded.getter()
{
  return sub_1AD8B1018(&qword_1E9A490C0);
}

uint64_t sub_1AD990DEC(uint64_t a1)
{
  return sub_1AD991158(a1, MEMORY[0x1E4F3E120], MEMORY[0x1E4F3E0F8], &qword_1E9A4D508);
}

uint64_t static Font.footnoteTightLeading.getter()
{
  return sub_1AD8B1018(&qword_1E9A490C8);
}

uint64_t sub_1AD990E38()
{
  sub_1AD9914E4();
  MEMORY[0x1F4188790](v0 - 8, v1);
  double v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1AD9DE830();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DE820();
  uint64_t v9 = *MEMORY[0x1E4F3E090];
  uint64_t v10 = sub_1AD9DE890();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v3, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v3, 0, 1, v10);
  uint64_t v12 = sub_1AD9DE8E0();
  sub_1AD99153C((uint64_t)v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  qword_1E9A4D510 = v12;
  return result;
}

uint64_t static Font.footnote2Rounded.getter()
{
  return sub_1AD8B1018(&qword_1E9A490D0);
}

uint64_t sub_1AD99101C(uint64_t a1)
{
  return sub_1AD991158(a1, MEMORY[0x1E4F3E1A0], MEMORY[0x1E4F3E0F8], &qword_1E9A4D518);
}

uint64_t static Font.footnote2TightLeading.getter()
{
  return sub_1AD8B1018(&qword_1E9A490D8);
}

uint64_t sub_1AD991068()
{
  if (qword_1E9A490D8 != -1) {
    swift_once();
  }
  uint64_t result = sub_1AD9DE840();
  qword_1E9A4D520 = result;
  return result;
}

uint64_t static Font.footnote2TightLeadingSmallCaps.getter()
{
  return sub_1AD8B1018(&qword_1E9A490E0);
}

uint64_t sub_1AD9910E4(uint64_t a1)
{
  return sub_1AD991158(a1, MEMORY[0x1E4F3E068], MEMORY[0x1E4F3E0E8], &qword_1E9A4D528);
}

uint64_t static Font.bodyLoose.getter()
{
  return sub_1AD8B1018(&qword_1E9A490E8);
}

uint64_t sub_1AD991130(uint64_t a1)
{
  return sub_1AD991158(a1, MEMORY[0x1E4F3E120], MEMORY[0x1E4F3E0E8], &qword_1E9A4D530);
}

uint64_t sub_1AD991158(uint64_t a1, void (*a2)(uint64_t), unsigned int *a3, uint64_t *a4)
{
  uint64_t v7 = sub_1AD9DE940();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v7, v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(v10);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v12, *a3, v7);
  uint64_t v13 = sub_1AD9DE970();
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  *a4 = v13;
  return result;
}

uint64_t static Font.footnoteLoose.getter()
{
  return sub_1AD8B1018(&qword_1E9A490F0);
}

void static UIFont.footnote2TightLeading.getter()
{
  id v0 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E4FB2900]);
  id v1 = objc_msgSend(v0, sel_fontDescriptorWithSymbolicTraits_, 0x8000);

  if (v1)
  {
    objc_msgSend(self, sel_fontWithDescriptor_size_, v1, 0.0);
  }
  else
  {
    __break(1u);
  }
}

void static UIFont.footnote2TightLeadingSmallCaps.getter()
{
  id v0 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E4FB2900]);
  id v1 = objc_msgSend(v0, sel_fontDescriptorWithSymbolicTraits_, 0x8000);

  if (v1)
  {
    Class isa = UIFontDescriptor.addingLowercaseSmallCapsAttributes()().super.isa;

    objc_msgSend(self, sel_fontWithDescriptor_size_, isa, 0.0);
  }
  else
  {
    __break(1u);
  }
}

id static UIFont.chartUnit.getter()
{
  id result = objc_msgSend(self, sel_sharedBehavior);
  if (result)
  {
    id v1 = result;
    unsigned int v2 = objc_msgSend(result, sel_isAppleWatch);

    sub_1AD9914A4();
    double v3 = (uint64_t *)MEMORY[0x1E4FB28D8];
    if (!v2) {
      double v3 = (uint64_t *)MEMORY[0x1E4FB28F0];
    }
    return static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(*v3, 0, v2 ^ 1, 0, 0, 0, 0, 0, 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1AD9914A4()
{
  unint64_t result = qword_1E9A4A8C0;
  if (!qword_1E9A4A8C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A4A8C0);
  }
  return result;
}

void sub_1AD9914E4()
{
  if (!qword_1EB725AB0)
  {
    sub_1AD9DE890();
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB725AB0);
    }
  }
}

uint64_t sub_1AD99153C(uint64_t a1)
{
  sub_1AD9914E4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AD991598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DF950();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1AD9DF940();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1AD9933C0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AD9DF910();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SleepNotificationManager.__allocating_init(notificationCenter:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

BOOL static SleepNotificationManager.AuthorizationStatus.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t SleepNotificationManager.AuthorizationStatus.hash(into:)()
{
  return sub_1AD9E03B0();
}

uint64_t SleepNotificationManager.AuthorizationStatus.hashValue.getter()
{
  return sub_1AD9E03E0();
}

uint64_t SleepNotificationManager.init(notificationCenter:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_1AD9917FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  sub_1AD991964();
  MEMORY[0x1F4188790](v14 - 8, v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1AD9DF950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  sub_1AD9DF930();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v19 = sub_1AD9DF920();
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t v21 = MEMORY[0x1E4FBCFD8];
  v20[2] = v19;
  v20[3] = v21;
  v20[4] = v7;
  v20[5] = a1;
  v20[6] = a2;
  v20[7] = a3;
  v20[8] = a4;
  v20[9] = a5;
  v20[10] = a6;
  sub_1AD991598((uint64_t)v17, (uint64_t)&unk_1E9A4CE18, (uint64_t)v20);
  return swift_release();
}

void sub_1AD991964()
{
  if (!qword_1E9A4A9B0)
  {
    sub_1AD9DF950();
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, &qword_1E9A4A9B0);
    }
  }
}

uint64_t sub_1AD9919BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v13;
  v8[8] = v14;
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  v8[9] = sub_1AD9DF930();
  v8[10] = sub_1AD9DF920();
  uint64_t v10 = (void *)swift_task_alloc();
  v8[11] = v10;
  *uint64_t v10 = v8;
  v10[1] = sub_1AD991AC0;
  v10[16] = a4;
  v10[17] = *a4;
  return MEMORY[0x1F4188298](sub_1AD992008, 0, 0);
}

uint64_t sub_1AD991AC0(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(v2 + 120) = a1;
  swift_task_dealloc();
  uint64_t v4 = sub_1AD9DF910();
  *(void *)(v2 + 96) = v4;
  *(void *)(v2 + 104) = v3;
  return MEMORY[0x1F4188298](sub_1AD991C0C, v4, v3);
}

uint64_t sub_1AD991C0C()
{
  if (*(unsigned char *)(v0 + 120))
  {
    uint64_t v1 = 24;
    if (*(unsigned char *)(v0 + 120) != 1) {
      uint64_t v1 = 40;
    }
    uint64_t v2 = *(void (**)(uint64_t))(v0 + v1);
    uint64_t v3 = swift_release();
    v2(v3);
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v6;
    void *v6 = v0;
    v6[1] = sub_1AD991D4C;
    uint64_t v7 = *(void **)(v0 + 16);
    v6[15] = v7;
    v6[16] = *v7;
    return MEMORY[0x1F4188298](sub_1AD9925E4, 0, 0);
  }
}

uint64_t sub_1AD991D4C(char a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v5 = *(void *)(v4 + 96);
    uint64_t v6 = *(void *)(v4 + 104);
    uint64_t v7 = sub_1AD991EF8;
  }
  else
  {
    *(unsigned char *)(v4 + 121) = a1 & 1;
    uint64_t v5 = *(void *)(v4 + 96);
    uint64_t v6 = *(void *)(v4 + 104);
    uint64_t v7 = sub_1AD991E7C;
  }
  return MEMORY[0x1F4188298](v7, v5, v6);
}

uint64_t sub_1AD991E7C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 121);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 56);
  swift_release();
  v2(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1AD991EF8()
{
  uint64_t v1 = *(void (**)(void))(v0 + 56);
  swift_release();
  v1(0);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1AD991F68()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD991FC0()
{
  *(void *)(v1 + 128) = v0;
  *(void *)(v1 + 136) = *v0;
  return MEMORY[0x1F4188298](sub_1AD992008, 0, 0);
}

uint64_t sub_1AD992008()
{
  uint64_t v14 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 10;
  if (qword_1E9A49078 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1AD9DD550();
  v1[18] = __swift_project_value_buffer(v3, (uint64_t)qword_1E9A4D2B8);
  uint64_t v4 = sub_1AD9DD530();
  os_log_type_t v5 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_1AD9E04F0();
    v1[10] = sub_1AD838978(v8, v9, &v13);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v4, v5, "%s [TCC] requestAuthorizationStatus initiating", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v7, -1, -1);
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
  }

  uint64_t v10 = *(void **)(v1[16] + 16);
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_1AD992268;
  uint64_t v11 = swift_continuation_init();
  v1[10] = MEMORY[0x1E4F143A8];
  v1[11] = 0x40000000;
  v1[12] = sub_1AD992548;
  v1[13] = &block_descriptor_9;
  v1[14] = v11;
  objc_msgSend(v10, sel_getNotificationSettingsWithCompletionHandler_, v2);
  return MEMORY[0x1F41881E8](v1 + 2);
}

uint64_t sub_1AD992268()
{
  return MEMORY[0x1F4188298](sub_1AD992348, 0, 0);
}

uint64_t sub_1AD992348()
{
  uint64_t v15 = v0;
  uint64_t v1 = (void *)v0[15];
  id v2 = objc_msgSend(v1, sel_authorizationStatus);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v14 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    uint64_t v7 = sub_1AD9E04F0();
    v0[10] = sub_1AD838978(v7, v8, &v14);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    v0[10] = v2;
    type metadata accessor for UNAuthorizationStatus(0);
    uint64_t v9 = sub_1AD9DF730();
    v0[10] = sub_1AD838978(v9, v10, &v14);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "%s [TCC] requestAuthorizationStatus status: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }

  unint64_t v11 = sub_1AD9931C0((unint64_t)v2);
  uint64_t v12 = (uint64_t (*)(unint64_t))v0[1];
  return v12(v11);
}

uint64_t sub_1AD992548(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;
  return MEMORY[0x1F41881F8](v2);
}

uint64_t sub_1AD99259C()
{
  *(void *)(v1 + 120) = v0;
  *(void *)(v1 + 128) = *v0;
  return MEMORY[0x1F4188298](sub_1AD9925E4, 0, 0);
}

uint64_t sub_1AD9925E4()
{
  uint64_t v14 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 10;
  if (qword_1E9A49078 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1AD9DD550();
  v1[17] = __swift_project_value_buffer(v3, (uint64_t)qword_1E9A4D2B8);
  os_log_type_t v4 = sub_1AD9DD530();
  os_log_type_t v5 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_1AD9E04F0();
    v1[10] = sub_1AD838978(v8, v9, &v13);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v4, v5, "%s [TCC] requestAuthorization initiating", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v7, -1, -1);
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
  }

  unint64_t v10 = *(void **)(v1[15] + 16);
  v1[2] = v1;
  v1[7] = v1 + 19;
  v1[3] = sub_1AD992848;
  uint64_t v11 = swift_continuation_init();
  v1[10] = MEMORY[0x1E4F143A8];
  v1[11] = 0x40000000;
  v1[12] = sub_1AD992D14;
  v1[13] = &block_descriptor;
  v1[14] = v11;
  objc_msgSend(v10, sel_requestAuthorizationWithOptions_completionHandler_, 39, v2);
  return MEMORY[0x1F41881E8](v1 + 2);
}

uint64_t sub_1AD992848()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_1AD992AF4;
  }
  else {
    uint64_t v2 = sub_1AD992958;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1AD992958()
{
  uint64_t v11 = v0;
  uint64_t v1 = *(unsigned __int8 *)(v0 + 152);
  uint64_t v2 = sub_1AD9DD530();
  os_log_type_t v3 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = sub_1AD9E04F0();
    *(void *)(v0 + 80) = sub_1AD838978(v6, v7, &v10);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v1;
    sub_1AD9DFEA0();
    _os_log_impl(&dword_1AD834000, v2, v3, "%s [TCC] requestAuthorization granted: %{BOOL}d", (uint8_t *)v4, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
    MEMORY[0x1B3E6D1A0](v4, -1, -1);
  }

  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v1);
}

uint64_t sub_1AD992AF4()
{
  uint64_t v18 = v0;
  uint64_t v1 = (void *)v0[18];
  swift_willThrow();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_1AD9DD530();
  os_log_type_t v5 = sub_1AD9DFBC0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[18];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v17[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_1AD9E04F0();
    v0[10] = sub_1AD838978(v9, v10, v17);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v0[10] = v6;
    id v11 = v6;
    sub_1AD869CF0();
    uint64_t v12 = sub_1AD9DF730();
    v0[10] = sub_1AD838978(v12, v13, v17);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1AD834000, v4, v5, "%s [TCC] requestAuthorization error: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v8, -1, -1);
    MEMORY[0x1B3E6D1A0](v7, -1, -1);
  }
  else
  {
    uint64_t v14 = (void *)v0[18];
  }
  swift_willThrow();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15(0);
}

uint64_t sub_1AD992D14(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_1AD869CF0();
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x1F4188200](v3);
  }
}

uint64_t SleepNotificationManager.deinit()
{
  return v0;
}

uint64_t SleepNotificationManager.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_1AD992E20()
{
  unint64_t result = qword_1E9A4D540;
  if (!qword_1E9A4D540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9A4D540);
  }
  return result;
}

uint64_t type metadata accessor for SleepNotificationManager()
{
  return self;
}

uint64_t method lookup function for SleepNotificationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SleepNotificationManager);
}

uint64_t dispatch thunk of SleepNotificationManager.__allocating_init(notificationCenter:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SleepNotificationManager.requestAuthorizationIfNeeded(alreadyAuthorized:alreadyDenied:afterRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

unsigned char *storeEnumTagSinglePayload for SleepNotificationManager.AuthorizationStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD992FB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepNotificationManager.AuthorizationStatus()
{
  return &type metadata for SleepNotificationManager.AuthorizationStatus;
}

uint64_t sub_1AD992FEC(uint64_t a1, int *a2)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_1AD9930C8;
  return v6(a1);
}

uint64_t sub_1AD9930C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1AD9931C0(unint64_t a1)
{
  if (a1 < 5) {
    return 0x101010200uLL >> (8 * a1);
  }
  if (qword_1E9A49078 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9A4D2B8);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBD0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_1AD838978(0xD000000000000013, 0x80000001AD9ED980, &v10);
    sub_1AD9DFEA0();
    *(_WORD *)(v5 + 12) = 2080;
    type metadata accessor for UNAuthorizationStatus(0);
    uint64_t v7 = sub_1AD9DF730();
    sub_1AD838978(v7, v8, &v10);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "%s [TCC] authorizationStatus unknown: %s", (uint8_t *)v5, 0x16u);
    uint64_t v1 = 2;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }
  else
  {

    return 2;
  }
  return v1;
}

uint64_t sub_1AD9933C0(uint64_t a1)
{
  sub_1AD991964();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AD99341C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD993454(uint64_t a1)
{
  os_log_type_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1AD89F448;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9A4D558 + dword_1E9A4D558);
  return v6(a1, v4);
}

uint64_t sub_1AD99350C()
{
  return sub_1AD9E03E0();
}

uint64_t sub_1AD993608()
{
  sub_1AD9DF760();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD9936E8()
{
  sub_1AD9DF760();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD99384C()
{
  return sub_1AD9E03E0();
}

SleepHealthUI::ArticleIdentifier_optional __swiftcall ArticleIdentifier.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1AD9E0210();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static ArticleIdentifier.allCases.getter()
{
  return &unk_1F046A7E0;
}

unint64_t ArticleIdentifier.rawValue.getter()
{
  unint64_t result = 0xD000000000000023;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000026;
      break;
    case 2:
      unint64_t result = 0xD000000000000022;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    case 4:
      unint64_t result = 0xD00000000000002DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1AD993A54(char *a1, char *a2)
{
  return sub_1AD902074(*a1, *a2);
}

unint64_t sub_1AD993A64()
{
  unint64_t result = qword_1E9A4D568;
  if (!qword_1E9A4D568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D568);
  }
  return result;
}

uint64_t sub_1AD993AB8()
{
  return sub_1AD99350C();
}

uint64_t sub_1AD993AC0()
{
  return sub_1AD993608();
}

uint64_t sub_1AD993AC8()
{
  return sub_1AD99384C();
}

SleepHealthUI::ArticleIdentifier_optional sub_1AD993AD0(Swift::String *a1)
{
  return ArticleIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_1AD993ADC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ArticleIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1AD993B08()
{
  unint64_t result = qword_1E9A4D570;
  if (!qword_1E9A4D570)
  {
    sub_1AD993B60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D570);
  }
  return result;
}

void sub_1AD993B60()
{
  if (!qword_1E9A4D578)
  {
    unint64_t v0 = sub_1AD9DF8D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D578);
    }
  }
}

void sub_1AD993BB8(void *a1@<X8>)
{
  *a1 = &unk_1F046A808;
}

unsigned char *storeEnumTagSinglePayload for ArticleIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD993C94);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticleIdentifier()
{
  return &type metadata for ArticleIdentifier;
}

id ScheduleOccurrenceHeaderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_1AD993D30()
{
  uint64_t v1 = OBJC_IVAR____TtC13SleepHealthUI28ScheduleOccurrenceHeaderView____lazy_storage___titleLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI28ScheduleOccurrenceHeaderView____lazy_storage___titleLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13SleepHealthUI28ScheduleOccurrenceHeaderView____lazy_storage___titleLabel);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    id v5 = objc_msgSend(self, sel_labelColor);
    objc_msgSend(v4, sel_setTextColor_, v5);

    unsigned int v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id ScheduleOccurrenceHeaderView.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC13SleepHealthUI28ScheduleOccurrenceHeaderView____lazy_storage___titleLabel] = 0;
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for ScheduleOccurrenceHeaderView();
  id v9 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  id v10 = sub_1AD993D30();
  objc_msgSend(v9, sel_addSubview_, v10);

  sub_1AD994184();
  id v11 = sub_1AD993D30();
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  id v12 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(*MEMORY[0x1E4FB2990], 32770, 0, 0, 0, 0, 0, 0, 1);
  objc_msgSend(v11, sel_setFont_, v12);

  sub_1AD87B1E0();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1AD9E3070;
  uint64_t v14 = sub_1AD9DD6D0();
  uint64_t v15 = MEMORY[0x1E4FB1138];
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v15;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1AD841D34();
  id v16 = v9;
  sub_1AD9DFD90();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return v16;
}

uint64_t type metadata accessor for ScheduleOccurrenceHeaderView()
{
  return self;
}

void sub_1AD994014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1B3E6D270](v3);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = sub_1AD993D30();
    sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
    id v7 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(*MEMORY[0x1E4FB2990], 32770, 0, 0, 0, 0, 0, 0, 1);
    objc_msgSend(v6, sel_setFont_, v7);
  }
}

void sub_1AD994184()
{
  id v1 = sub_1AD993D30();
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  uint64_t v2 = self;
  sub_1AD870B1C();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD9E5440;
  id v4 = sub_1AD993D30();
  id v5 = objc_msgSend(v4, sel_topAnchor);

  id v6 = objc_msgSend(v0, sel_topAnchor);
  id v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_constant_, v6, 12.0);

  *(void *)(v3 + 32) = v7;
  id v8 = objc_msgSend(v0, sel_bottomAnchor);
  id v9 = sub_1AD993D30();
  id v10 = objc_msgSend(v9, sel_lastBaselineAnchor);

  id v11 = objc_msgSend(v8, sel_constraintEqualToAnchor_constant_, v10, 12.0);
  *(void *)(v3 + 40) = v11;
  id v12 = sub_1AD993D30();
  id v13 = objc_msgSend(v12, sel_leadingAnchor);

  id v14 = objc_msgSend(v0, sel_leadingAnchor);
  id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, 2.0);

  *(void *)(v3 + 48) = v15;
  id v16 = objc_msgSend(v0, sel_trailingAnchor);
  id v17 = sub_1AD993D30();
  id v18 = objc_msgSend(v17, sel_trailingAnchor);

  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v18, 2.0);
  *(void *)(v3 + 56) = v19;
  sub_1AD9DF870();
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A090);
  id v20 = (id)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_activateConstraints_, v20);
}

id ScheduleOccurrenceHeaderView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceHeaderView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AD994464()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AD99449C(uint64_t a1, uint64_t a2)
{
  sub_1AD994014(a1, a2, v2);
}

uint64_t method lookup function for ScheduleOccurrenceHeaderView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ScheduleOccurrenceHeaderView);
}

uint64_t sub_1AD9944BC()
{
  id v1 = v0;
  uint64_t v44 = *v0;
  uint64_t v2 = type metadata accessor for Alarm();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v2, v4);
  id v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v8);
  id v10 = (char *)&v39 - v9;
  sub_1AD996354(0, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  uint64_t v13 = MEMORY[0x1F4188790](v11 - 8, v12);
  id v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v13, v16);
  id v19 = (char *)&v39 - v18;
  MEMORY[0x1F4188790](v17, v20);
  uint64_t v22 = (char *)&v39 - v21;
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_1AD9DD550();
  __swift_project_value_buffer(v23, (uint64_t)qword_1E9A4D288);
  swift_retain_n();
  uint64_t v24 = sub_1AD9DD530();
  int v45 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v24, (os_log_type_t)v45))
  {
    double v43 = v24;
    uint64_t v40 = v7;
    id v41 = v10;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v48[0] = v42;
    *(_DWORD *)uint64_t v25 = 136446466;
    uint64_t v26 = sub_1AD9E04F0();
    uint64_t v27 = v2;
    uint64_t v47 = sub_1AD838978(v26, v28, v48);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2082;
    uint64_t v29 = (uint64_t)v1 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarm;
    swift_beginAccess();
    sub_1AD996574(v29, (uint64_t)v22);
    sub_1AD996574((uint64_t)v22, (uint64_t)v19);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v19, 1, v27) == 1)
    {
      unint64_t v30 = 0xE300000000000000;
      uint64_t v31 = 7104878;
    }
    else
    {
      uint64_t v32 = (uint64_t)v41;
      sub_1AD8ADB78((uint64_t)v19, (uint64_t)v41);
      sub_1AD9964B4(v32, (uint64_t)v40);
      uint64_t v31 = sub_1AD9DF730();
      unint64_t v30 = v33;
      sub_1AD996518(v32);
    }
    double v34 = v43;
    sub_1AD9961D4((uint64_t)v22);
    uint64_t v46 = sub_1AD838978(v31, v30, v48);
    sub_1AD9DFEA0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v34, (os_log_type_t)v45, "[%{public}s] upcoming alarm did change: %{public}s", (uint8_t *)v25, 0x16u);
    uint64_t v35 = v42;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v35, -1, -1);
    MEMORY[0x1B3E6D1A0](v25, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  char v36 = (void (*)(char *))v1[2];
  uint64_t v37 = (uint64_t)v1 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarm;
  swift_beginAccess();
  sub_1AD996574(v37, (uint64_t)v15);
  v36(v15);
  return sub_1AD9961D4((uint64_t)v15);
}

uint64_t sub_1AD994930(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v3 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarm;
  uint64_t v7 = type metadata accessor for Alarm();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarmManager;
  *(void *)(v3 + v8) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F78B50]), sel_init);
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  uint64_t v9 = qword_1E9A49060;
  swift_retain();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1AD9DD550();
  __swift_project_value_buffer(v10, (uint64_t)qword_1E9A4D288);
  uint64_t v11 = sub_1AD9DD530();
  os_log_type_t v12 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v15 = sub_1AD9E04F0();
    sub_1AD838978(v15, v16, &v27);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v11, v12, "[%{public}s] init", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v14, -1, -1);
    MEMORY[0x1B3E6D1A0](v13, -1, -1);
  }

  uint64_t v17 = self;
  id v18 = objc_msgSend(v17, sel_defaultCenter);
  uint64_t v19 = OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarmManager;
  objc_msgSend(v18, sel_addObserver_selector_name_object_, v3, sel_handleAlarmChangeWithNotification_, *MEMORY[0x1E4F78A50], *(void *)(v3 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarmManager));

  id v20 = objc_msgSend(v17, sel_defaultCenter);
  objc_msgSend(v20, sel_addObserver_selector_name_object_, v3, sel_handleAlarmChangeWithNotification_, *MEMORY[0x1E4F78A80], *(void *)(v3 + v19));

  id v21 = objc_msgSend(v17, sel_defaultCenter);
  uint64_t v22 = (void *)*MEMORY[0x1E4F78A90];
  uint64_t v23 = *(void **)(v3 + v19);
  swift_retain();
  id v24 = v22;
  id v25 = v23;
  objc_msgSend(v21, sel_addObserver_selector_name_object_, v3, sel_handleAlarmChangeWithNotification_, v24, v25);

  swift_release();
  swift_release();
  return v3;
}

void sub_1AD994C78(uint64_t a1)
{
  uint64_t v2 = sub_1AD9DC7F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1AD9DD550();
  __swift_project_value_buffer(v7, (uint64_t)qword_1E9A4D288);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  uint64_t v8 = sub_1AD9DD530();
  os_log_type_t v9 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v11 = sub_1AD9E04F0();
    uint64_t v18 = sub_1AD838978(v11, v12, &v19);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_1AD99630C(&qword_1E9A4D5A0, MEMORY[0x1E4F26E90]);
    uint64_t v13 = sub_1AD9E0280();
    uint64_t v18 = sub_1AD838978(v13, v14, &v19);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    _os_log_impl(&dword_1AD834000, v8, v9, "[%{public}s] received alarm notification: %s, privacy: .public)", (uint8_t *)v10, 0x16u);
    uint64_t v15 = v17;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v15, -1, -1);
    MEMORY[0x1B3E6D1A0](v10, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

  sub_1AD9955D4();
}

void sub_1AD99506C(uint64_t a1)
{
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9A4D288);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_1AD9E04F0();
    sub_1AD838978(v7, v8, &v10);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "[%{public}s] dismissing active alarm", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }

  uint64_t v9 = type metadata accessor for Alarm();
  sub_1AD8B3D30(*(void **)(a1 + *(int *)(v9 + 20)));
}

uint64_t sub_1AD995240()
{
  uint64_t v1 = v0;
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9A4D288);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_1AD9E04F0();
    sub_1AD838978(v7, v8, &v11);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "[%{public}s] deinit", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }

  id v9 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v9, sel_removeObserver_, v1);

  swift_release();
  sub_1AD9961D4(v1 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarm);

  return v1;
}

uint64_t sub_1AD99544C()
{
  sub_1AD995240();
  return swift_deallocClassInstance();
}

uint64_t sub_1AD9954A4()
{
  return type metadata accessor for AlarmProvider();
}

uint64_t type metadata accessor for AlarmProvider()
{
  uint64_t result = qword_1E9A4D590;
  if (!qword_1E9A4D590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1AD9954F8()
{
  sub_1AD996354(319, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1AD9955D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1AD9DD550();
  __swift_project_value_buffer(v3, (uint64_t)qword_1E9A4D288);
  os_log_type_t v4 = sub_1AD9DD530();
  os_log_type_t v5 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    aBlock[0] = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v8 = sub_1AD9E04F0();
    sub_1AD838978(v8, v9, aBlock);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v4, v5, "[%{public}s] update", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v7, -1, -1);
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
  }

  id v10 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)v1
                                                              + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarmManager), sel_nextAlarm));
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v1;
    *(void *)(v12 + 24) = v2;
    aBlock[4] = (uint64_t)sub_1AD996298;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1AD86F738;
    aBlock[3] = (uint64_t)&block_descriptor_32;
    uint64_t v13 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v14 = objc_msgSend(v11, sel_addCompletionBlock_, v13);
    _Block_release(v13);
  }
}

uint64_t sub_1AD99586C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v45 = a3;
  uint64_t v46 = a2;
  uint64_t v6 = sub_1AD9DF3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  id v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1AD9DF400();
  uint64_t v47 = *(void *)(v11 - 8);
  uint64_t v48 = v11;
  MEMORY[0x1F4188790](v11, v12);
  id v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1AD9DD550();
  __swift_project_value_buffer(v15, (uint64_t)qword_1E9A4D288);
  id v16 = a1;
  uint64_t v17 = sub_1AD9DD530();
  os_log_type_t v18 = sub_1AD9DFBE0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  id v44 = v16;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    aBlock[0] = v41;
    *(_DWORD *)uint64_t v20 = 136446466;
    uint64_t v43 = v6;
    uint64_t v21 = sub_1AD9E04F0();
    uint64_t v42 = v7;
    uint64_t v49 = sub_1AD838978(v21, v22, aBlock);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    uint64_t v49 = (uint64_t)a1;
    sub_1AD9963B8();
    id v23 = v16;
    id v24 = a1;
    id v25 = v14;
    uint64_t v26 = v10;
    uint64_t v27 = a4;
    id v28 = v23;
    uint64_t v29 = sub_1AD9DF730();
    uint64_t v49 = sub_1AD838978(v29, v30, aBlock);
    uint64_t v6 = v43;
    sub_1AD9DFEA0();

    a4 = v27;
    id v10 = v26;
    id v14 = v25;
    a1 = v24;
    uint64_t v7 = v42;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v17, v18, "[%{public}s] next alarm: %{public}s", (uint8_t *)v20, 0x16u);
    uint64_t v31 = v41;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v31, -1, -1);
    MEMORY[0x1B3E6D1A0](v20, -1, -1);
  }
  else
  {
  }
  sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
  uint64_t v32 = (void *)sub_1AD9DFCA0();
  unint64_t v33 = (void *)swift_allocObject();
  uint64_t v35 = v45;
  double v34 = v46;
  v33[2] = a1;
  v33[3] = v35;
  v33[4] = v34;
  v33[5] = a4;
  aBlock[4] = (uint64_t)sub_1AD996300;
  aBlock[5] = (uint64_t)v33;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1AD8D34D8;
  aBlock[3] = (uint64_t)&block_descriptor_11;
  char v36 = _Block_copy(aBlock);
  id v37 = v44;
  swift_retain();
  id v38 = v34;
  swift_release();
  sub_1AD9DF3F0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1AD99630C((unint64_t *)&qword_1E9A4AD50, MEMORY[0x1E4FBCB00]);
  sub_1AD996354(0, &qword_1E9A4C330, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1AD8CCECC();
  sub_1AD9DFF40();
  MEMORY[0x1B3E6BC50](0, v14, v10, v36);
  _Block_release(v36);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v14, v48);
}

void sub_1AD995D68(void *a1, uint64_t a2, void *a3)
{
  sub_1AD996354(0, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  uint64_t v8 = MEMORY[0x1F4188790](v6 - 8, v7);
  id v10 = (char *)&v36[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8, v11);
  uint64_t v13 = (char *)&v36[-1] - v12;
  uint64_t v14 = type metadata accessor for Alarm();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14, v16);
  os_log_type_t v18 = (char *)&v36[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a1;
  sub_1AD9D5628(a1, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_1AD9961D4((uint64_t)v13);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v10, 1, 1, v14);
    uint64_t v20 = a2 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarm;
    swift_beginAccess();
    sub_1AD996420((uint64_t)v10, v20);
    swift_endAccess();
    sub_1AD9944BC();
    sub_1AD9961D4((uint64_t)v10);
    if (a3)
    {
      id v21 = a3;
      if (qword_1E9A49060 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_1AD9DD550();
      __swift_project_value_buffer(v22, (uint64_t)qword_1E9A4D288);
      id v23 = a3;
      id v24 = a3;
      id v25 = sub_1AD9DD530();
      os_log_type_t v26 = sub_1AD9DFBC0();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        v36[0] = v28;
        *(_DWORD *)uint64_t v27 = 136446466;
        uint64_t v29 = sub_1AD9E04F0();
        uint64_t v35 = sub_1AD838978(v29, v30, v36);
        sub_1AD9DFEA0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2082;
        uint64_t v35 = (uint64_t)a3;
        id v31 = a3;
        sub_1AD869CF0();
        uint64_t v32 = sub_1AD9DF730();
        uint64_t v35 = sub_1AD838978(v32, v33, v36);
        sub_1AD9DFEA0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1AD834000, v25, v26, "[%{public}s] error retrieving upcoming alarm: %{public}s", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1B3E6D1A0](v28, -1, -1);
        MEMORY[0x1B3E6D1A0](v27, -1, -1);
      }
      else
      {
      }
    }
  }
  else
  {
    sub_1AD8ADB78((uint64_t)v13, (uint64_t)v18);
    sub_1AD9964B4((uint64_t)v18, (uint64_t)v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
    uint64_t v34 = a2 + OBJC_IVAR____TtC13SleepHealthUI13AlarmProvider_alarm;
    swift_beginAccess();
    sub_1AD996420((uint64_t)v10, v34);
    swift_endAccess();
    sub_1AD9944BC();
    sub_1AD9961D4((uint64_t)v10);
    sub_1AD996518((uint64_t)v18);
  }
}

uint64_t sub_1AD9961D4(uint64_t a1)
{
  sub_1AD996354(0, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AD996260()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD996298(void *a1, void *a2)
{
  return sub_1AD99586C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t block_copy_helper_32(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_32()
{
  return swift_release();
}

uint64_t sub_1AD9962B8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1AD996300()
{
  sub_1AD995D68(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1AD99630C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1AD996354(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1AD9963B8()
{
  if (!qword_1E9A4D5A8)
  {
    sub_1AD837214(255, (unint64_t *)&qword_1E9A4D5B0);
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D5A8);
    }
  }
}

uint64_t sub_1AD996420(uint64_t a1, uint64_t a2)
{
  sub_1AD996354(0, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD9964B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Alarm();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD996518(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Alarm();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AD996574(uint64_t a1, uint64_t a2)
{
  sub_1AD996354(0, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t SleepActivityConfigurationSectionBuilder.dataSource.getter()
{
  return swift_retain();
}

uint64_t SleepActivityConfigurationSectionBuilder.init(dataSource:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t SleepActivityConfigurationSectionBuilder.sections()()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AD9DDBC0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SleepActivityConfigurationSectionBuilder.sleepTreatment()()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AD9DDBC0();
  swift_release();
  swift_release();
  if (!v3) {
    return 0;
  }
  type metadata accessor for SleepSettingsModel();
  sub_1AD996C1C(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
  sub_1AD9DE090();
  type metadata accessor for WatchAppInstalledProvider();
  sub_1AD996C1C(&qword_1E9A4D5B8, (void (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider);
  sub_1AD9DE090();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AD9DDBC0();
  swift_release();
  swift_release();
  sub_1AD9DDAA0();
  unint64_t v0 = *(void **)&v3[OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_watchAppInstalledProvider];
  sub_1AD9DDAA0();
  id v1 = v0;

  sub_1AD9968F8();
  sub_1AD996B08(&qword_1E9A4D5E0, (void (*)(uint64_t))sub_1AD9968F8, (void (*)(void))sub_1AD996AC0, (void (*)(void))sub_1AD996BE8);
  return sub_1AD9DF1B0();
}

void sub_1AD9968F8()
{
  if (!qword_1E9A4D5C0)
  {
    sub_1AD996960();
    sub_1AD9969F4(255);
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D5C0);
    }
  }
}

void sub_1AD996960()
{
  if (!qword_1E9A4D5C8)
  {
    sub_1AD9969C0(255);
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D5C8);
    }
  }
}

void sub_1AD9969C0(uint64_t a1)
{
}

void sub_1AD9969F4(uint64_t a1)
{
}

void sub_1AD996A28(uint64_t a1)
{
}

void sub_1AD996A5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1AD996AC0()
{
  return sub_1AD996B08(&qword_1E9A4D5E8, (void (*)(uint64_t))sub_1AD996960, (void (*)(void))sub_1AD996B94, (void (*)(void))sub_1AD8FE560);
}

uint64_t sub_1AD996B08(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1AD996B94()
{
  unint64_t result = qword_1E9A4D5F0;
  if (!qword_1E9A4D5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D5F0);
  }
  return result;
}

uint64_t sub_1AD996BE8()
{
  return sub_1AD996C1C(&qword_1E9A4D5F8, sub_1AD9969F4);
}

uint64_t sub_1AD996C1C(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for SleepActivityConfigurationSectionBuilder()
{
  return &type metadata for SleepActivityConfigurationSectionBuilder;
}

unint64_t static ScheduleOccurrenceDeleteTableViewCell.defaultReuseIdentifier.getter()
{
  return 0xD000000000000025;
}

void sub_1AD996DBC()
{
  id v1 = objc_msgSend(v0, sel_textLabel);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setTextAlignment_, 1);
  }
  id v3 = objc_msgSend(v0, sel_textLabel);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(self, sel_hk_appErrorColor);
    objc_msgSend(v4, sel_setTextColor_, v5);
  }
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
  v9[4] = sub_1AD8F05CC;
  void v9[5] = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1AD8F0900;
  v9[3] = &block_descriptor_33;
  uint64_t v7 = _Block_copy(v9);
  id v8 = objc_msgSend(v6, sel_initWithDynamicProvider_, v7);
  _Block_release(v7);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v8);
}

void sub_1AD996F28()
{
  id v1 = objc_msgSend(v0, sel_textLabel);
  if (v1)
  {
    uint64_t v2 = v1;
    if (qword_1EB724E38 != -1) {
      swift_once();
    }
    id v3 = (id)qword_1EB727930;
    sub_1AD9DCA70();
    swift_bridgeObjectRelease();

    id v4 = (id)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setText_, v4, 0xE000000000000000);
  }
}

void sub_1AD99709C()
{
  id v1 = v0;
  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD9E53A0;
  *(void *)(v2 + 32) = sub_1AD9DF710();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = 0x7065656C53;
  *(void *)(v2 + 56) = 0xE500000000000000;
  strcpy((char *)(v2 + 64), "ScheduleEditor");
  *(unsigned char *)(v2 + 79) = -18;
  uint64_t v11 = v2;
  sub_1AD86C2F8((uint64_t)&unk_1F046A830);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  uint64_t v4 = sub_1AD9DF690();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  uint64_t v7 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v1, sel_setAccessibilityIdentifier_, v7, v11);

  id v8 = objc_msgSend(v1, sel_textLabel);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v12 = v6;
    swift_bridgeObjectRetain();
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    id v10 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setAccessibilityIdentifier_, v10, v4, v12);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

id ScheduleOccurrenceDeleteTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceDeleteTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceDeleteTableViewCell()
{
  return self;
}

void ScheduleOccurrenceDeleteTableViewCell.apply(_:)(uint64_t a1)
{
  v1[OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model] = *(unsigned char *)(a1 + 49);
  id v2 = objc_msgSend(v1, sel_textLabel);
  if (v2)
  {
    uint64_t v3 = v2;
    if (qword_1EB724E38 != -1) {
      swift_once();
    }
    id v4 = (id)qword_1EB727930;
    sub_1AD9DCA70();
    swift_bridgeObjectRelease();

    id v5 = (id)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setText_, v5, 0xE000000000000000);
  }
}

void sub_1AD997478(uint64_t a1)
{
}

uint64_t method lookup function for ScheduleOccurrenceDeleteTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ScheduleOccurrenceDeleteTableViewCell);
}

unsigned char *storeEnumTagSinglePayload for ScheduleOccurrenceDeleteTableViewCell.Model(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD997580);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduleOccurrenceDeleteTableViewCell.Model()
{
  return &type metadata for ScheduleOccurrenceDeleteTableViewCell.Model;
}

uint64_t block_copy_helper_33(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_33()
{
  return swift_release();
}

uint64_t Calendar.date(bySubtracting:from:)(uint64_t a1)
{
  uint64_t v2 = sub_1AD9DC990();
  uint64_t v3 = *(void *)(v2 - 8);
  double v5 = MEMORY[0x1F4188790](v2, v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v3 + 16))(v7, a1, v2, v5);
  uint64_t v8 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  sub_1AD9A295C(v8, a1, (uint64_t)v7);
  swift_bridgeObjectRelease();
  sub_1AD9DCDD0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
}

uint64_t Calendar.timeComponents(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD999658(0, &qword_1E9A49F50, MEMORY[0x1E4F27D68], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)v69 - v6;
  sub_1AD999658(0, &qword_1EB725690, MEMORY[0x1E4F27CA0], v3);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)v69 - v10;
  uint64_t v12 = sub_1AD9DC990();
  uint64_t v80 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v13);
  uint64_t v15 = (char *)v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD999658(0, &qword_1EB724D70, MEMORY[0x1E4F27928], v3);
  uint64_t v18 = MEMORY[0x1F4188790](v16 - 8, v17);
  uint64_t v20 = (char *)v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v21);
  id v23 = (char *)v69 - v22;
  uint64_t v24 = sub_1AD9DCC70();
  uint64_t v77 = *(void *)(v24 - 8);
  uint64_t v78 = v24;
  uint64_t v26 = MEMORY[0x1F4188790](v24, v25);
  uint64_t v28 = (char *)v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x1F4188790](v26, v29);
  v75 = (char *)v69 - v31;
  MEMORY[0x1F4188790](v30, v32);
  v76 = (char *)v69 - v33;
  sub_1AD9DC8F0();
  if ((v34 & 1) != 0
    || (sub_1AD9DC940(), (v35 & 1) != 0)
    || (sub_1AD9DC8F0(), (v36 & 1) != 0)
    || (sub_1AD9DC940(), (v37 & 1) != 0))
  {
    uint64_t v40 = v79;
    uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56);
    return v41(v40, 1, 1, v12);
  }
  else
  {
    sub_1AD998310((uint64_t)v23);
    uint64_t v38 = v77 + 48;
    uint64_t v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48);
    if (v39(v23, 1, v78) == 1)
    {
      uint64_t v20 = v23;
    }
    else
    {
      v73 = v39;
      uint64_t v74 = v38;
      v69[0] = *(void *)(v77 + 32);
      v69[1] = v77 + 32;
      ((void (*)(char *, char *, uint64_t))v69[0])(v76, v23, v78);
      id v72 = (id)sub_1AD9DCDA0();
      uint64_t v71 = sub_1AD9DCBB0();
      sub_1AD9DC910();
      if (v43 & 1) != 0 && (sub_1AD9DC920(), (v44) && (sub_1AD9DC8D0(), (v45))
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v15, a1, v12);
      }
      else
      {
        uint64_t v46 = sub_1AD9DCE40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v11, 1, 1, v46);
        uint64_t v47 = sub_1AD9DCEB0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v7, 1, 1, v47);
        sub_1AD9DC8F0();
        int v70 = v48 & 1;
        sub_1AD9DC940();
        sub_1AD9DC970();
      }
      uint64_t v49 = v73;
      long long v50 = (void *)sub_1AD9DC8B0();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v15, v12);
      uint64_t v52 = (void *)v71;
      id v51 = v72;
      id v53 = objc_msgSend(v72, sel_hksp_previousDateBeforeDate_matchingComponents_, v71, v50);

      uint64_t v54 = v78;
      uint64_t v55 = v77;
      if (v53)
      {
        sub_1AD9DCC40();

        v56 = (void (*)(char *, char *, uint64_t))v69[0];
        ((void (*)(char *, char *, uint64_t))v69[0])(v20, v28, v54);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(v20, 0, 1, v54);
        if (v49(v20, 1, v54) != 1)
        {
          v56(v75, v20, v54);
          sub_1AD999658(0, &qword_1E9A4C140, MEMORY[0x1E4F27C88], MEMORY[0x1E4FBBE00]);
          uint64_t v57 = sub_1AD9DCE20();
          uint64_t v58 = *(void *)(v57 - 8);
          uint64_t v59 = *(void *)(v58 + 72);
          unint64_t v60 = (*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
          uint64_t v61 = swift_allocObject();
          *(_OWORD *)(v61 + 16) = xmmword_1AD9E3080;
          unint64_t v62 = v61 + v60;
          v63 = *(void (**)(unint64_t, void, uint64_t))(v58 + 104);
          v63(v62, *MEMORY[0x1E4F27C10], v57);
          v63(v62 + v59, *MEMORY[0x1E4F27C48], v57);
          sub_1AD922F84(v61);
          swift_setDeallocating();
          swift_arrayDestroy();
          swift_deallocClassInstance();
          uint64_t v64 = v79;
          v66 = v75;
          v65 = v76;
          sub_1AD9DCD70();
          swift_bridgeObjectRelease();
          v67 = *(void (**)(char *, uint64_t))(v55 + 8);
          v67(v66, v54);
          v67(v65, v54);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v80 + 56))(v64, 0, 1, v12);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56))(v20, 1, 1, v78);
      }
      (*(void (**)(char *, uint64_t))(v55 + 8))(v76, v54);
    }
    uint64_t v68 = v79;
    sub_1AD894998((uint64_t)v20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56))(v68, 1, 1, v12);
  }
}

BOOL Calendar.dayPeriod(for:in:)(uint64_t a1)
{
  uint64_t v2 = sub_1AD9DCC70();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1AD9DCE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_1AD9DCDA0();
  uint64_t v12 = (void *)sub_1AD9DCBB0();
  uint64_t v13 = (void *)sub_1AD9DCCD0();
  id v14 = objc_msgSend(v11, sel_bs_dayPeriodForDate_inLocale_, v12, v13);

  BSDayPeriod.simplified.getter((uint64_t)v14, (char *)&v30);
  if (v30 == 2)
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E4F27C10], v6);
    unint64_t v15 = sub_1AD9DCE30();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if (v15 - 10 >= 0xFFFFFFFFFFFFFFF9)
    {
      if (qword_1EB725030 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1AD9DD550();
      __swift_project_value_buffer(v16, (uint64_t)qword_1EB725018);
      uint64_t v18 = v27;
      uint64_t v17 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v5, a1, v28);
      uint64_t v19 = sub_1AD9DD530();
      os_log_type_t v20 = sub_1AD9DFBE0();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v30 = v22;
        *(_DWORD *)uint64_t v21 = 136315138;
        v26[1] = v21 + 4;
        sub_1AD9996BC((unint64_t *)&qword_1EB725230, MEMORY[0x1E4F27928]);
        uint64_t v23 = sub_1AD9E0280();
        uint64_t v29 = sub_1AD838978(v23, v24, &v30);
        sub_1AD9DFEA0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v17);
        _os_log_impl(&dword_1AD834000, v19, v20, "[BSDayPeriod] overriding evening with morning for date: %s", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3E6D1A0](v22, -1, -1);
        MEMORY[0x1B3E6D1A0](v21, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v17);
      }

      return v15 > 5;
    }
  }
  return (BOOL)v14;
}

uint64_t sub_1AD998310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1AD9DCC70();
  uint64_t v17 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1AD9DC990();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DC8F0();
  if (v11 & 1) != 0 || (uint64_t v12 = sub_1AD9DC940(), (v13))
  {
    unint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
    return v15(a1, 1, 1, v2);
  }
  else
  {
    uint64_t v16 = v12;
    _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
    sub_1AD9DCC60();
    sub_1AD9DCD80();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
    sub_1AD9DC900();
    sub_1AD9DC950();
    sub_1AD9DC960();
    sub_1AD9DC8E0();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t Calendar.timeComponents(bySubtractingHours:from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_1AD999658(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)v32 - v6;
  uint64_t v8 = sub_1AD9DCC70();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)v32 - v15;
  sub_1AD9DC8F0();
  if (v17 & 1) != 0 || (sub_1AD9DC940(), (v18))
  {
    uint64_t v21 = sub_1AD9DC990();
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
    return v22(a1, 1, 1, v21);
  }
  else
  {
    sub_1AD998310((uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_1AD894998((uint64_t)v7);
      uint64_t v19 = sub_1AD9DC990();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a1, 1, 1, v19);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v16, v7, v8);
      sub_1AD9DCBA0();
      sub_1AD999658(0, &qword_1E9A4C140, MEMORY[0x1E4F27C88], MEMORY[0x1E4FBBE00]);
      uint64_t v23 = sub_1AD9DCE20();
      uint64_t v24 = *(void *)(v23 - 8);
      v32[0] = *(void *)(v24 + 72);
      unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_1AD9E3080;
      unint64_t v27 = v26 + v25;
      uint64_t v28 = *MEMORY[0x1E4F27C10];
      v32[1] = v2;
      uint64_t v29 = *(void (**)(unint64_t, uint64_t, uint64_t))(v24 + 104);
      v29(v27, v28, v23);
      v29(v27 + v32[0], *MEMORY[0x1E4F27C48], v23);
      sub_1AD922F84(v26);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_1AD9DCD80();
      swift_bridgeObjectRelease();
      uint64_t v30 = *(void (**)(char *, uint64_t))(v9 + 8);
      v30(v12, v8);
      v30(v16, v8);
      uint64_t v31 = sub_1AD9DC990();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(a1, 0, 1, v31);
    }
  }
}

uint64_t Calendar.dateComponents(byAdding:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1AD999658(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v14 = sub_1AD9DCC70();
  char v37 = *(void **)(v14 - 8);
  MEMORY[0x1F4188790](v14, v15);
  char v35 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v18);
  os_log_type_t v20 = (char *)&v33 - v19;
  uint64_t v21 = MEMORY[0x1E4FBC870];
  uint64_t v38 = MEMORY[0x1E4FBC870];
  uint64_t v22 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  uint64_t v36 = a1;
  sub_1AD9A2C14(v22, a1, (uint64_t)&v38);
  swift_bridgeObjectRelease();
  uint64_t v23 = v38;
  uint64_t v38 = v21;
  uint64_t v24 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  sub_1AD9A2C14(v24, a2, (uint64_t)&v38);
  swift_bridgeObjectRelease();
  LOBYTE(v21) = sub_1AD998D5C(v38, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
    sub_1AD9DCDC0();
    unint64_t v25 = (unsigned int (*)(char *, uint64_t, uint64_t))v37[6];
    if (v25(v13, 1, v14) == 1)
    {
      uint64_t v9 = v13;
    }
    else
    {
      uint64_t v34 = a2;
      uint64_t v26 = (void (*)(char *, char *, uint64_t))v37[4];
      v26(v20, v13, v14);
      sub_1AD9DCDD0();
      if (v25(v9, 1, v14) != 1)
      {
        uint64_t v29 = v35;
        v26(v35, v9, v14);
        uint64_t v38 = MEMORY[0x1E4FBC870];
        uint64_t v30 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
        sub_1AD9A2C14(v30, v34, (uint64_t)&v38);
        swift_bridgeObjectRelease();
        sub_1AD9DCD80();
        swift_bridgeObjectRelease();
        uint64_t v31 = (void (*)(char *, uint64_t))v37[1];
        v31(v29, v14);
        v31(v20, v14);
        uint64_t v32 = sub_1AD9DC990();
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(a3, 0, 1, v32);
      }
      ((void (*)(char *, uint64_t))v37[1])(v20, v14);
    }
    sub_1AD894998((uint64_t)v9);
  }
  uint64_t v27 = sub_1AD9DC990();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(a3, 1, 1, v27);
}

uint64_t sub_1AD998D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AD9DCE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (char *)&v40 - v11;
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v40 - v15;
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v18 = *(void *)(a2 + 56);
  uint64_t v52 = a2 + 56;
  uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
  uint64_t v43 = ~v19;
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v18;
  int64_t v44 = (unint64_t)(63 - v19) >> 6;
  uint64_t v49 = v5 + 32;
  uint64_t v53 = a1 + 56;
  uint64_t v54 = v5 + 16;
  uint64_t v55 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v47 = a2;
  uint64_t v41 = v16;
  uint64_t v42 = v5;
  int64_t v50 = 0;
  unint64_t v51 = v21;
  if (!v21) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v45 = (v21 - 1) & v21;
  int64_t v46 = v23;
  for (unint64_t i = __clz(__rbit64(v21)) | (v23 << 6); ; unint64_t i = __clz(__rbit64(v26)) + (v27 << 6))
  {
    uint64_t v29 = *(void *)(v5 + 72);
    uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v30(v16, *(void *)(a2 + 48) + v29 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v16, v4);
    uint64_t v31 = *(void *)(a1 + 16);
    uint64_t v48 = (unint64_t)v55 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v32 = v12;
    if (!v31
      || (sub_1AD9996BC(&qword_1E9A4C170, MEMORY[0x1E4F27C88]),
          uint64_t v33 = sub_1AD9DF640(),
          uint64_t v34 = -1 << *(unsigned char *)(a1 + 32),
          unint64_t v35 = v33 & ~v34,
          ((*(void *)(v53 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0))
    {
      (*v55)(v12, v4);
LABEL_30:
      uint64_t v17 = 0;
      goto LABEL_31;
    }
    uint64_t v36 = a1;
    uint64_t v37 = ~v34;
    while (1)
    {
      v30(v8, *(void *)(v36 + 48) + v35 * v29, v4);
      sub_1AD9996BC(&qword_1E9A4C178, MEMORY[0x1E4F27C88]);
      char v38 = sub_1AD9DF6C0();
      uint64_t v39 = *v55;
      (*v55)(v8, v4);
      if (v38) {
        break;
      }
      unint64_t v35 = (v35 + 1) & v37;
      if (((*(void *)(v53 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
      {
        v39(v32, v4);
        goto LABEL_30;
      }
    }
    uint64_t v12 = v32;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v39)(v32, v4);
    unint64_t v21 = v45;
    int64_t v23 = v46;
    a2 = v47;
    a1 = v36;
    uint64_t v16 = v41;
    uint64_t v5 = v42;
    int64_t v50 = v46;
    unint64_t v51 = v45;
    if (v45) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v25 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v25 >= v44) {
      goto LABEL_34;
    }
    unint64_t v26 = *(void *)(v52 + 8 * v25);
    int64_t v27 = v23 + 1;
    if (!v26)
    {
      int64_t v27 = v23 + 2;
      if (v23 + 2 >= v44) {
        goto LABEL_34;
      }
      unint64_t v26 = *(void *)(v52 + 8 * v27);
      if (!v26)
      {
        int64_t v27 = v23 + 3;
        if (v23 + 3 >= v44) {
          goto LABEL_34;
        }
        unint64_t v26 = *(void *)(v52 + 8 * v27);
        if (!v26) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v45 = (v26 - 1) & v26;
    int64_t v46 = v27;
  }
  uint64_t v28 = v23 + 4;
  if (v23 + 4 >= v44)
  {
LABEL_34:
    uint64_t v17 = 1;
LABEL_31:
    sub_1AD999704();
    return v17;
  }
  unint64_t v26 = *(void *)(v52 + 8 * v28);
  if (v26)
  {
    int64_t v27 = v23 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v27 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v27 >= v44) {
      goto LABEL_34;
    }
    unint64_t v26 = *(void *)(v52 + 8 * v27);
    ++v28;
    if (v26) {
      goto LABEL_21;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t Calendar.dateComponents(bySubtracting:from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v51 = a3;
  uint64_t v5 = sub_1AD9DC990();
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  MEMORY[0x1F4188790](v5, v6);
  uint64_t v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD999658(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)v45 - v15;
  uint64_t v17 = sub_1AD9DCC70();
  uint64_t v52 = *(void **)(v17 - 8);
  uint64_t v53 = v17;
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21, v22);
  uint64_t v24 = (char *)v45 - v23;
  uint64_t v25 = MEMORY[0x1E4FBC870];
  uint64_t v54 = MEMORY[0x1E4FBC870];
  uint64_t v26 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  sub_1AD9A2C14(v26, a1, (uint64_t)&v54);
  swift_bridgeObjectRelease();
  uint64_t v27 = v54;
  uint64_t v54 = v25;
  uint64_t v28 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  sub_1AD9A2C14(v28, a2, (uint64_t)&v54);
  swift_bridgeObjectRelease();
  char v29 = sub_1AD998D5C(v54, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v29)
  {
    uint64_t v47 = v20;
    uint64_t v48 = v12;
    sub_1AD9DCDC0();
    uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v52[6];
    if (v30((uint64_t)v16, 1, v53) == 1)
    {
      uint64_t v31 = (uint64_t)v16;
      uint64_t v33 = v50;
      uint64_t v32 = v51;
      uint64_t v34 = v49;
    }
    else
    {
      uint64_t v46 = a2;
      uint64_t v36 = v24;
      v45[0] = v52[4];
      v45[1] = v52 + 4;
      ((void (*)(char *, char *, uint64_t))v45[0])(v24, v16, v53);
      uint64_t v34 = v49;
      uint64_t v33 = v50;
      (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v8, a1, v50);
      uint64_t v37 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
      sub_1AD9A295C(v37, a1, (uint64_t)v8);
      swift_bridgeObjectRelease();
      uint64_t v31 = (uint64_t)v48;
      sub_1AD9DCDD0();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v33);
      int v38 = v30(v31, 1, v53);
      uint64_t v39 = v36;
      uint64_t v32 = v51;
      if (v38 != 1)
      {
        uint64_t v40 = v47;
        uint64_t v41 = v53;
        ((void (*)(char *, uint64_t, uint64_t))v45[0])(v47, v31, v53);
        uint64_t v54 = MEMORY[0x1E4FBC870];
        uint64_t v42 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
        sub_1AD9A2C14(v42, v46, (uint64_t)&v54);
        swift_bridgeObjectRelease();
        sub_1AD9DCD80();
        swift_bridgeObjectRelease();
        uint64_t v43 = (void (*)(char *, uint64_t))v52[1];
        v43(v40, v41);
        v43(v39, v41);
        uint64_t v35 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v32, v35, 1, v33);
      }
      ((void (*)(char *, uint64_t))v52[1])(v36, v53);
    }
    sub_1AD894998(v31);
    uint64_t v35 = 1;
  }
  else
  {
    uint64_t v35 = 1;
    uint64_t v33 = v50;
    uint64_t v32 = v51;
    uint64_t v34 = v49;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v32, v35, 1, v33);
}

void sub_1AD999658(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1AD9996BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AD999704()
{
  return swift_release();
}

id static NSDateFormatter.makeTimeFormatter(locale:shouldCondense:)(uint64_t a1, char a2)
{
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_1AD9DF6D0();
  uint64_t v6 = (void *)sub_1AD9DCCD0();
  id v7 = objc_msgSend(v4, sel_dateFormatFromTemplate_options_locale_, v5, 0, v6);

  if (v7)
  {
    uint64_t v8 = sub_1AD9DF710();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0xE500000000000000;
    uint64_t v8 = 0x616D6D3A68;
  }
  id v11 = sub_1AD99B1D4(v8, v10, a1, a2 & 1);
  swift_bridgeObjectRelease();
  return v11;
}

char *NSDateFormatter.veryShortStandaloneWeekdaySymbol(for:)(uint64_t a1)
{
  return sub_1AD999DE8(a1, (SEL *)&selRef_veryShortStandaloneWeekdaySymbols);
}

char *NSDateFormatter.standaloneWeekdaySymbol(for:)(uint64_t a1)
{
  return sub_1AD999DE8(a1, (SEL *)&selRef_standaloneWeekdaySymbols);
}

id static NSDateFormatter.standalone.getter()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v0, sel_setFormattingContext_, 2);
  return v0;
}

char *NSDateFormatter.localizedCommaSeparatedList(using:calendar:useShortSymbols:)(uint64_t a1, uint64_t a2, char a3)
{
  if (*MEMORY[0x1E4FA5490] == a1) {
    return 0;
  }
  uint64_t v6 = (void *)sub_1AD9DCDA0();
  id v7 = objc_msgSend(v6, sel_hksp_orderedSleepWeekdaysForWeekdays_, a1);
  sub_1AD837214(0, &qword_1E9A49E48);
  unint64_t v8 = sub_1AD9DF860();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (char *)sub_1AD9E0190();
    uint64_t v9 = (uint64_t)result;
    uint64_t v34 = v6;
    if (result) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (char *)swift_bridgeObjectRetain();
    uint64_t v34 = v6;
    if (v9)
    {
LABEL_5:
      if (v9 < 1) {
        goto LABEL_48;
      }
      uint64_t v11 = 0;
      uint64_t v12 = (void *)MEMORY[0x1E4FBC860];
      do
      {
        if ((v8 & 0xC000000000000001) != 0) {
          id v13 = (id)MEMORY[0x1B3E6BFF0](v11, v8);
        }
        else {
          id v13 = *(id *)(v8 + 8 * v11 + 32);
        }
        uint64_t v14 = v13;
        id v15 = objc_msgSend(v13, sel_unsignedIntegerValue, v34);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_1AD99AADC(0, v12[2] + 1, 1, v12);
        }
        unint64_t v17 = v12[2];
        unint64_t v16 = v12[3];
        if (v17 >= v16 >> 1) {
          uint64_t v12 = sub_1AD99AADC((void *)(v16 > 1), v17 + 1, 1, v12);
        }
        ++v11;
        v12[2] = v17 + 1;
        v12[v17 + 4] = v15;
      }
      while (v9 != v11);
      goto LABEL_18;
    }
  }
  uint64_t v12 = (void *)MEMORY[0x1E4FBC860];
LABEL_18:
  swift_bridgeObjectRelease_n();
  uint64_t v18 = v12[2];
  if (!v18)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    uint64_t v31 = self;
    uint64_t v32 = (void *)sub_1AD9DF850();
    swift_bridgeObjectRelease();
    id v33 = objc_msgSend(v31, sel_localizedStringByJoiningStrings_, v32);

    uint64_t v3 = sub_1AD9DF710();
    return (char *)v3;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  uint64_t v20 = (void *)MEMORY[0x1E4FBC860];
  while (1)
  {
    HKSPDayForWeekdays();
    if (a3) {
      break;
    }
    uint64_t result = (char *)objc_msgSend(v35, sel_standaloneWeekdaySymbols);
    if (!result) {
      goto LABEL_50;
    }
    uint64_t v24 = result;
    uint64_t v22 = sub_1AD9DF860();

    uint64_t result = (char *)NSGregorianCalendarDayForHKSPDay();
    if (result)
    {
      uint64_t v23 = result - 1;
      if (__OFSUB__(result, 1)) {
        goto LABEL_43;
      }
      if (((unint64_t)v23 & 0x8000000000000000) != 0) {
        goto LABEL_45;
      }
      if ((unint64_t)v23 >= *(void *)(v22 + 16)) {
        goto LABEL_47;
      }
      goto LABEL_34;
    }
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    if (v18 == ++v19)
    {
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
  }
  uint64_t result = (char *)objc_msgSend(v35, sel_shortStandaloneWeekdaySymbols);
  if (!result) {
    goto LABEL_49;
  }
  uint64_t v21 = result;
  uint64_t v22 = sub_1AD9DF860();

  uint64_t result = (char *)NSGregorianCalendarDayForHKSPDay();
  if (!result) {
    goto LABEL_20;
  }
  uint64_t v23 = result - 1;
  if (!__OFSUB__(result, 1))
  {
    if (((unint64_t)v23 & 0x8000000000000000) != 0) {
      goto LABEL_44;
    }
    if ((unint64_t)v23 >= *(void *)(v22 + 16)) {
      goto LABEL_46;
    }
LABEL_34:
    uint64_t v25 = v22 + 16 * (void)v23;
    uint64_t v27 = *(void *)(v25 + 32);
    uint64_t v26 = *(void *)(v25 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v20 = sub_1AD99A70C(0, v20[2] + 1, 1, v20);
    }
    unint64_t v29 = v20[2];
    unint64_t v28 = v20[3];
    if (v29 >= v28 >> 1) {
      uint64_t v20 = sub_1AD99A70C((void *)(v28 > 1), v29 + 1, 1, v20);
    }
    v20[2] = v29 + 1;
    uint64_t v30 = &v20[2 * v29];
    v30[4] = v27;
    v30[5] = v26;
    goto LABEL_21;
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

id static NSDateFormatter.makeHourOnlyFormatter(locale:shouldCondense:)(uint64_t a1, char a2)
{
  uint64_t v4 = self;
  uint64_t v5 = (void *)sub_1AD9DF6D0();
  uint64_t v6 = (void *)sub_1AD9DCCD0();
  id v7 = objc_msgSend(v4, sel_dateFormatFromTemplate_options_locale_, v5, 0, v6);

  if (v7)
  {
    uint64_t v8 = sub_1AD9DF710();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0xE200000000000000;
    uint64_t v8 = 24936;
  }
  id v11 = sub_1AD99B1D4(v8, v10, a1, a2 & 1);
  swift_bridgeObjectRelease();
  return v11;
}

void __swiftcall NSDateFormatter.init(formattingContext:)(NSDateFormatter *__return_ptr retstr, NSFormattingContext formattingContext)
{
}

id static NSDateFormatter.middleOfSentence.getter()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v0, sel_setFormattingContext_, 5);
  return v0;
}

char *NSDateFormatter.shortStandaloneWeekdaySymbol(for:)(uint64_t a1)
{
  return sub_1AD999DE8(a1, (SEL *)&selRef_shortStandaloneWeekdaySymbols);
}

char *sub_1AD999DE8(uint64_t a1, SEL *a2)
{
  uint64_t result = (char *)[v2 *a2];
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v4 = result;
  uint64_t v5 = sub_1AD9DF860();

  uint64_t result = (char *)NSGregorianCalendarDayForHKSPDay();
  if (!result)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v6 = result - 1;
  if (__OFSUB__(result, 1))
  {
    __break(1u);
  }
  else if (((unint64_t)v6 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)v6 < *(void *)(v5 + 16))
    {
      uint64_t v7 = *(void *)(v5 + 16 * (void)v6 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return (char *)v7;
    }
    goto LABEL_11;
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t Time.time.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Time.designator.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Time.designatorComesBeforeTime.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

void __swiftcall Time.init(time:designator:designatorComesBeforeTime:)(SleepHealthUI::Time *__return_ptr retstr, Swift::String time, Swift::String_optional designator, Swift::Bool designatorComesBeforeTime)
{
  retstr->time = time;
  retstr->designator = designator;
  retstr->designatorComesBeforeTime = designatorComesBeforeTime;
}

void __swiftcall NSDateFormatter.time(hour:minute:)(SleepHealthUI::Time *__return_ptr retstr, Swift::Int hour, Swift::Int minute)
{
  uint64_t v4 = v3;
  Swift::Int v51 = minute;
  uint64_t v55 = retstr;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD99BAB8(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v53 = (char *)v46 - v9;
  uint64_t v54 = sub_1AD9DCC70();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54, v10);
  uint64_t v50 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD99BAB8(0, &qword_1E9A49F50, MEMORY[0x1E4F27D68], v6);
  MEMORY[0x1F4188790](v12 - 8, v13);
  uint64_t v47 = (char *)v46 - v14;
  uint64_t v15 = sub_1AD9DC990();
  uint64_t v48 = *(void *)(v15 - 8);
  uint64_t v49 = v15;
  MEMORY[0x1F4188790](v15, v16);
  uint64_t v18 = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD99BAB8(0, &qword_1EB725690, MEMORY[0x1E4F27CA0], v6);
  MEMORY[0x1F4188790](v19 - 8, v20);
  uint64_t v22 = (char *)v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23, v24);
  uint64_t v26 = (char *)v46 - v25;
  uint64_t v27 = sub_1AD9DCE40();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27, v29);
  uint64_t v31 = (char *)v46 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v34 = MEMORY[0x1F4188790](v32, v33);
  uint64_t v36 = (char *)v46 - v35;
  id v37 = objc_msgSend(v4, sel_calendar, v34);
  if (!v37)
  {
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
    v40(v26, 1, 1, v27);
LABEL_5:
    uint64_t v41 = v54;
    sub_1AD9DCE10();
    sub_1AD99B704((uint64_t)v26, &qword_1EB725690, MEMORY[0x1E4F27CA0]);
    goto LABEL_7;
  }
  int v38 = v37;
  v46[1] = hour;
  v46[2] = v4;
  sub_1AD9DCDB0();

  uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
  v39(v26, v31, v27);
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
  v40(v26, 0, 1, v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1) {
    goto LABEL_5;
  }
  v39(v36, v26, v27);
  uint64_t v41 = v54;
LABEL_7:
  v40(v22, 1, 1, v27);
  uint64_t v42 = sub_1AD9DCEB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v47, 1, 1, v42);
  sub_1AD9DC970();
  sub_1AD9DC900();
  sub_1AD9DC950();
  uint64_t v43 = (uint64_t)v53;
  sub_1AD9DCDC0();
  uint64_t v44 = v52;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v43, 1, v41) == 1)
  {
    sub_1AD99B704(v43, &qword_1EB724D70, MEMORY[0x1E4F27928]);
    sub_1AD9E0140();
    __break(1u);
  }
  else
  {
    uint64_t v45 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v50, v43, v41);
    NSDateFormatter.time(date:)((uint64_t)v55);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v41);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v49);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v36, v27);
  }
}

void NSDateFormatter.time(date:)(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  sub_1AD837214(0, &qword_1E9A4D608);
  uint64_t v4 = (void *)sub_1AD9DFE30();
  char v16 = 0;
  uint64_t v5 = (void *)sub_1AD9DCBB0();
  id v15 = v4;
  id v6 = objc_msgSend(v2, sel_hksp_timeStringFromDate_designatorString_designatorIsBeforeTime_, v5, &v15, &v16);

  id v7 = v15;
  uint64_t v8 = sub_1AD9DF710();
  uint64_t v10 = v9;

  if ((uint64_t)objc_msgSend(v7, sel_length) < 1)
  {

    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = sub_1AD9DF710();
    uint64_t v13 = v12;
  }
  char v14 = v16;
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v13;
  *(unsigned char *)(a1 + 32) = v14;
}

void *sub_1AD99A70C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1AD87F8F8(0, (unint64_t *)&qword_1EB725BD0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      uint64_t v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1AD99AFD4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1AD99A828(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1AD99BAB8(0, &qword_1E9A49FC8, (uint64_t (*)(uint64_t))sub_1AD86E54C, MEMORY[0x1E4FBBE00]);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      uint64_t v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1AD99B0C8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AD99A978(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1AD99AC60(a1, a2, a3, a4, (unint64_t *)&qword_1E9A4A250, MEMORY[0x1E4F66468], MEMORY[0x1E4F66468], MEMORY[0x1E4F66468]);
}

void *sub_1AD99A9C0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1AD87F8F8(0, (unint64_t *)&unk_1EB725BC0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      uint64_t v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1AD99B330(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1AD99AADC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1AD99BAB8(0, qword_1E9A4D618, (uint64_t (*)(uint64_t))type metadata accessor for HKSPWeekdays, MEMORY[0x1E4FBBE00]);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      uint64_t v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1AD99B424(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AD99AC18(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1AD99AC60(a1, a2, a3, a4, &qword_1EB725D40, type metadata accessor for SleepStageSegment, type metadata accessor for SleepStageSegment, type metadata accessor for SleepStageSegment);
}

uint64_t sub_1AD99AC60(char a1, int64_t a2, char a3, unint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t), uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  if (a3)
  {
    unint64_t v12 = *(void *)(a4 + 24);
    uint64_t v13 = v12 >> 1;
    if ((uint64_t)(v12 >> 1) < a2)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v12 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v13 = a2;
      }
    }
  }
  else
  {
    uint64_t v13 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v13 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v13;
  }
  if (!v15)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  sub_1AD99BAB8(0, a5, a6, MEMORY[0x1E4FBBE00]);
  uint64_t v16 = *(void *)(a7(0) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (void *)swift_allocObject();
  size_t v20 = _swift_stdlib_malloc_size(v19);
  if (!v17 || (v20 - v18 == 0x8000000000000000 ? (BOOL v21 = v17 == -1) : (BOOL v21 = 0), v21))
  {
LABEL_29:
    uint64_t result = sub_1AD9E0130();
    __break(1u);
    return result;
  }
  v19[2] = v14;
  v19[3] = 2 * ((uint64_t)(v20 - v18) / v17);
LABEL_19:
  uint64_t v22 = *(void *)(a7(0) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v19 + v23;
  if (a1)
  {
    if ((unint64_t)v19 < a4 || v24 >= a4 + v23 + *(void *)(v22 + 72) * v14)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v19 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1AD99B95C(0, v14, v24, a4, a8);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v19;
}

uint64_t sub_1AD99AEFC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1AD99AC60(a1, a2, a3, a4, &qword_1EB725638, (uint64_t (*)(uint64_t))sub_1AD91E6E8, (uint64_t (*)(void))sub_1AD91E6E8, (uint64_t (*)(void))sub_1AD91E6E8);
}

uint64_t sub_1AD99AF44(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1AD99AC60(a1, a2, a3, a4, &qword_1E9A4D610, type metadata accessor for SleepDayModel.SegmentModel, type metadata accessor for SleepDayModel.SegmentModel, type metadata accessor for SleepDayModel.SegmentModel);
}

uint64_t sub_1AD99AF8C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1AD99AC60(a1, a2, a3, a4, &qword_1E9A4AAE0, MEMORY[0x1E4F26EA0], MEMORY[0x1E4F26EA0], MEMORY[0x1E4F26EA0]);
}

uint64_t sub_1AD99AFD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1AD9E01E0();
  __break(1u);
  return result;
}

uint64_t sub_1AD99B0C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_1AD86E54C();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1AD9E01E0();
  __break(1u);
  return result;
}

id sub_1AD99B1D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1AD9DF7D0();
    if (v5)
    {
      uint64_t v6 = v4;
      uint64_t v7 = v5;
      do
      {
        if ((sub_1AD9DF660() & 1) == 0) {
          MEMORY[0x1B3E6B720](v6, v7);
        }
        swift_bridgeObjectRelease();
        uint64_t v6 = sub_1AD9DF7D0();
        uint64_t v7 = v8;
      }
      while (v8);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  uint64_t v10 = (void *)sub_1AD9DCCD0();
  objc_msgSend(v9, sel_setLocale_, v10);

  int64_t v11 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setDateFormat_, v11);

  return v9;
}

uint64_t sub_1AD99B330(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1AD9E01E0();
  __break(1u);
  return result;
}

char *sub_1AD99B424(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_1AD9E01E0();
  __break(1u);
  return result;
}

char *_sSo15NSDateFormatterC13SleepHealthUIE13localizedList5using8calendar010standaloneB008listItemB015useShortSymbolsSSSo12HKSPWeekdaysV_10Foundation8CalendarVA2BSbtFZ_0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  if (*MEMORY[0x1E4FA5490] == a1) {
    return 0;
  }
  uint64_t v10 = (void *)sub_1AD9DCDA0();
  id v11 = objc_msgSend(v10, sel_hksp_localizedGroupingStringForWeekdays_, a1);
  if (v11)
  {
    unint64_t v12 = v11;
    uint64_t v5 = sub_1AD9DF710();

    return (char *)v5;
  }
  if ((HKSPWeekdaysIsSingleDay() & 1) == 0)
  {
    NSDateFormatter.localizedCommaSeparatedList(using:calendar:useShortSymbols:)(a1, a2, a5 & 1);
    uint64_t v19 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(v19, sel_hk_localizedFirstWordCapitalizedString);

    goto LABEL_13;
  }
  HKSPDayForWeekdays();
  uint64_t result = (char *)objc_msgSend(a3, sel_standaloneWeekdaySymbols);
  if (result)
  {
    uint64_t v14 = result;
    uint64_t v15 = sub_1AD9DF860();

    uint64_t result = (char *)NSGregorianCalendarDayForHKSPDay();
    if (!result)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v16 = result - 1;
    if (__OFSUB__(result, 1))
    {
      __break(1u);
    }
    else if (((unint64_t)v16 & 0x8000000000000000) == 0)
    {
      if ((unint64_t)v16 < *(void *)(v15 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v17 = (void *)sub_1AD9DF6D0();
        swift_bridgeObjectRelease();
        id v18 = objc_msgSend(v17, sel_hk_localizedFirstWordCapitalizedString);

LABEL_13:
        uint64_t v5 = sub_1AD9DF710();

        return (char *)v5;
      }
      goto LABEL_18;
    }
    __break(1u);
LABEL_18:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1AD99B704(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1AD99BAB8(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t destroy for Time()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Time(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Time(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for Time(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for Time(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Time(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Time()
{
  return &type metadata for Time;
}

uint64_t sub_1AD99B95C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_1AD9E01E0();
  __break(1u);
  return result;
}

void sub_1AD99BAB8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t DynamicStack.init(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = swift_getKeyPath();
  sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
  swift_storeEnumTagMultiPayload();
  uint64_t result = type metadata accessor for DynamicStack();
  uint64_t v7 = (uint64_t *)((char *)a3 + *(int *)(result + 36));
  void *v7 = a1;
  v7[1] = a2;
  return result;
}

uint64_t DynamicStack.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = sub_1AD9DF0E0();
  uint64_t v40 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v6);
  unint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v10);
  unint64_t v12 = (char *)&v39 - v11;
  uint64_t v13 = sub_1AD9DF180();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v15);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v19);
  BOOL v21 = (char *)&v39 - v20;
  uint64_t v22 = sub_1AD9DE480();
  uint64_t v42 = *(void *)(v22 - 8);
  uint64_t v43 = v22;
  MEMORY[0x1F4188790](v22, v23);
  uint64_t v41 = (char *)&v39 - v24;
  BOOL v25 = sub_1AD99C0B4();
  if (v25)
  {
    uint64_t v27 = sub_1AD9DE340();
    MEMORY[0x1F4188790](v27, v28);
    *(&v39 - 4) = v3;
    *(&v39 - 3) = v4;
    *(&v39 - 2) = v2;
    sub_1AD9DF170();
    uint64_t WitnessTable = swift_getWitnessTable();
    sub_1AD90C5E8(v17, v13, WitnessTable);
    uint64_t v30 = *(void (**)(char *, uint64_t))(v14 + 8);
    v30(v17, v13);
    sub_1AD90C5E8(v21, v13, WitnessTable);
    swift_getWitnessTable();
    uint64_t v31 = v41;
    sub_1AD90C624((uint64_t)v17, v13);
    v30(v17, v13);
    v30(v21, v13);
  }
  else
  {
    MEMORY[0x1F4188790](v25, v26);
    *(&v39 - 4) = v3;
    *(&v39 - 3) = v4;
    *(&v39 - 2) = v2;
    sub_1AD9DE2B0();
    sub_1AD9DF0D0();
    uint64_t v32 = swift_getWitnessTable();
    sub_1AD90C5E8(v8, v5, v32);
    uint64_t v33 = *(void (**)(char *, uint64_t))(v40 + 8);
    v33(v8, v5);
    sub_1AD90C5E8(v12, v5, v32);
    swift_getWitnessTable();
    uint64_t v31 = v41;
    sub_1AD90C71C((uint64_t)v8, v13, v5);
    v33(v8, v5);
    v33(v12, v5);
  }
  uint64_t v34 = swift_getWitnessTable();
  uint64_t v35 = swift_getWitnessTable();
  uint64_t v45 = v34;
  uint64_t v46 = v35;
  uint64_t v36 = v43;
  uint64_t v37 = swift_getWitnessTable();
  sub_1AD90C5E8(v31, v36, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v31, v36);
}

BOOL sub_1AD99C0B4()
{
  uint64_t v0 = sub_1AD9DDF50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v6);
  unint64_t v8 = (char *)&v12 - v7;
  sub_1AD966E34((uint64_t)&v12 - v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E4F3CB28], v0);
  sub_1AD99CEF8();
  char v9 = sub_1AD9DF6A0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  v10(v8, v0);
  return (v9 & 1) == 0;
}

uint64_t sub_1AD99C200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1, a2);
  unint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (char *)&v16 - v11;
  uint64_t v13 = type metadata accessor for DynamicStack();
  (*(void (**)(void))(a1 + *(int *)(v13 + 36)))();
  sub_1AD90C5E8(v8, a2, a3);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v8, a2);
  sub_1AD90C5E8(v12, a2, a3);
  return ((uint64_t (*)(char *, uint64_t))v14)(v12, a2);
}

uint64_t sub_1AD99C34C()
{
  return sub_1AD9DE0F0();
}

uint64_t sub_1AD99C370()
{
  return sub_1AD9DE0F0();
}

uint64_t sub_1AD99C394(uint64_t a1)
{
  uint64_t v2 = sub_1AD9DDF50();
  double v4 = MEMORY[0x1F4188790](v2, v3);
  (*(void (**)(char *, uint64_t, double))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  return sub_1AD9DE100();
}

uint64_t type metadata accessor for DynamicStack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1AD99C478()
{
  return sub_1AD99C200(v0[4], v0[2], v0[3]);
}

uint64_t sub_1AD99C498()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1AD99C4DC()
{
  sub_1AD99CCE0(319, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1AD99C590(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1AD9DDF50();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
  }
  swift_retain();
  return a1;
}

uint64_t sub_1AD99C6CC(uint64_t a1)
{
  sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_1AD9DDF50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

void *sub_1AD99C788(void *a1, void *a2, uint64_t a3)
{
  sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1AD9DDF50();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

void *sub_1AD99C878(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1AD99C984((uint64_t)a1);
    sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1AD9DDF50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1AD99C984(uint64_t a1)
{
  sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_1AD99C9FC(char *a1, char *a2, uint64_t a3)
{
  sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
  uint64_t v7 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_1AD9DDF50();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 36)] = *(_OWORD *)&a2[*(int *)(a3 + 36)];
  return a1;
}

char *sub_1AD99CAE8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1AD99C984((uint64_t)a1);
    sub_1AD99CCE0(0, (unint64_t *)&qword_1E9A4B6D8, MEMORY[0x1E4F3C648]);
    uint64_t v7 = v6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = sub_1AD9DDF50();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  *(_OWORD *)&a1[*(int *)(a3 + 36)] = *(_OWORD *)&a2[*(int *)(a3 + 36)];
  swift_release();
  return a1;
}

uint64_t sub_1AD99CBF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD99CC04);
}

uint64_t sub_1AD99CC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1AD99CCE0(0, &qword_1E9A4B6E0, MEMORY[0x1E4F3C658]);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 36));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

void sub_1AD99CCE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_1AD9DDF50();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1AD99CD40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD99CD54);
}

void sub_1AD99CD54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1AD99CCE0(0, &qword_1E9A4B6E0, MEMORY[0x1E4F3C658]);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  }
}

uint64_t sub_1AD99CE2C()
{
  return swift_getWitnessTable();
}

unint64_t sub_1AD99CEF8()
{
  unint64_t result = qword_1EB725A20;
  if (!qword_1EB725A20)
  {
    sub_1AD9DDF50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB725A20);
  }
  return result;
}

id sub_1AD99CF54(void *a1)
{
  uint64_t v1 = qword_1EB724E38;
  id v2 = a1;
  if (v1 != -1) {
    swift_once();
  }
  id v3 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  double v4 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_hksp_addNextButtonWithTitle_, v4, 0xE000000000000000);

  return v5;
}

uint64_t sub_1AD99D06C()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_boldButton);
  objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v1, sel_hksp_nextButtonTapped, 64);
  id v3 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v2, sel_setTitle_forState_, v3, 0);

  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9E53A0;
  *(void *)(v4 + 32) = sub_1AD9DF710();
  *(void *)(v4 + 40) = v5;
  *(void *)(v4 + 48) = 0x7065656C53;
  *(void *)(v4 + 56) = 0xE500000000000000;
  *(void *)(v4 + 64) = 0x696472616F626E4FLL;
  *(void *)(v4 + 72) = 0xEA0000000000676ELL;
  id v6 = v2;
  sub_1AD86C2F8((uint64_t)&unk_1F046A860);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  sub_1AD9DF690();
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  unint64_t v7 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAccessibilityIdentifier_, v7);

  id v8 = objc_msgSend(v1, sel_hksp_presentationStyle);
  if (!v8 || v8 == (id)2) {
    goto LABEL_6;
  }
  if (v8 == (id)1)
  {
    id v9 = (id)BPSPillSelectedColor();
    if (v9)
    {
      unint64_t v10 = v9;
      objc_msgSend(v6, sel_setTintColor_, v9);
    }
LABEL_6:
    id v11 = objc_msgSend(v1, sel_buttonTray);
    objc_msgSend(v11, sel_addButton_, v6);

    return (uint64_t)v6;
  }
  uint64_t result = sub_1AD9E02E0();
  __break(1u);
  return result;
}

id sub_1AD99D308(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AD99D684(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))sub_1AD99D06C);
}

id sub_1AD99D324()
{
  uint64_t v1 = v0;
  sub_1AD99EF84(0, &qword_1E9A4D6D8, MEMORY[0x1E4FB1290], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)v18 - v4;
  id v6 = objc_msgSend(self, sel_buttonWithType_, 1);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_1AD9DFE40();
  uint64_t v7 = sub_1AD9DFE50();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
  sub_1AD9DFE60();
  id v8 = objc_msgSend(v6, sel_titleLabel);
  if (v8)
  {
    id v9 = v8;
    objc_msgSend(v8, sel_setTextAlignment_, 1);
  }
  unint64_t v10 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v6, sel_setTitle_forState_, v10, 0);

  objc_msgSend(v6, sel_addTarget_action_forControlEvents_, v1, sel_hksp_contentViewButtonTapped, 64);
  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1AD9E53A0;
  *(void *)(v11 + 32) = sub_1AD9DF710();
  *(void *)(v11 + 40) = v12;
  *(void *)(v11 + 48) = 0x7065656C53;
  *(void *)(v11 + 56) = 0xE500000000000000;
  *(void *)(v11 + 64) = 0x696472616F626E4FLL;
  *(void *)(v11 + 72) = 0xEA0000000000676ELL;
  v18[1] = v11;
  id v13 = v6;
  sub_1AD86C2F8((uint64_t)&unk_1F046A890);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  sub_1AD9DF690();
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  uint64_t v14 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setAccessibilityIdentifier_, v14);

  id v15 = objc_msgSend(v1, sel_secondaryContentView);
  if (v15)
  {
    uint64_t v16 = v15;
    objc_msgSend(v15, sel_addSubview_, v13);
    objc_msgSend(v13, sel_hk_alignConstraintsWithView_, v16);
  }
  return v13;
}

id sub_1AD99D66C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AD99D684(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))sub_1AD99D324);
}

id sub_1AD99D684(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1AD9DF710();
  uint64_t v8 = v7;
  id v9 = a1;
  unint64_t v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

void sub_1AD99D700(void *a1)
{
  uint64_t v1 = qword_1EB724E38;
  id v2 = a1;
  if (v1 != -1) {
    swift_once();
  }
  id v3 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  id v4 = (id)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_hksp_addSkipButtonWithTitle_, v4, 0xE000000000000000);
}

void sub_1AD99D808()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_linkButton);
  objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v1, sel_hksp_skipButtonTapped, 64);
  id v3 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v2, sel_setTitle_forState_, v3, 0);

  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9E53A0;
  *(void *)(v4 + 32) = sub_1AD9DF710();
  *(void *)(v4 + 40) = v5;
  *(void *)(v4 + 48) = 0x7065656C53;
  *(void *)(v4 + 56) = 0xE500000000000000;
  *(void *)(v4 + 64) = 0x696472616F626E4FLL;
  *(void *)(v4 + 72) = 0xEA0000000000676ELL;
  id v6 = v2;
  sub_1AD86C2F8((uint64_t)&unk_1F046A8C0);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  sub_1AD9DF690();
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  uint64_t v7 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAccessibilityIdentifier_, v7);

  id v8 = objc_msgSend(v1, sel_buttonTray);
  objc_msgSend(v8, sel_addButton_, v6);
}

uint64_t sub_1AD99DA30(void *a1)
{
  sub_1AD9DF710();
  id v2 = a1;
  sub_1AD99D808();

  return swift_bridgeObjectRelease();
}

void sub_1AD99DA9C()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v0, sel_hksp_cancelButtonTapped);
  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD9E53A0;
  *(void *)(v3 + 32) = sub_1AD9DF710();
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = 0x7065656C53;
  *(void *)(v3 + 56) = 0xE500000000000000;
  *(void *)(v3 + 64) = 0x696472616F626E4FLL;
  *(void *)(v3 + 72) = 0xEA0000000000676ELL;
  id v5 = v2;
  sub_1AD86C2F8((uint64_t)&unk_1F046A8F0);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  sub_1AD9DF690();
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  id v6 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setAccessibilityIdentifier_, v6);

  id v7 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v7, sel_setRightBarButtonItem_, v5);
}

void sub_1AD99DC80(void *a1)
{
  id v1 = a1;
  sub_1AD99DA9C();
}

void sub_1AD99DCCC()
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1400]), sel_initWithActivityIndicatorStyle_, 100);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setTag_, 1234);
  id v1 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v1, sel_addSubview_, v3);

  id v2 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v3, sel_hk_alignConstraintsWithView_, v2);

  objc_msgSend(v3, sel_setHidden_, 0);
  objc_msgSend(v3, sel_startAnimating);
}

void sub_1AD99DDD4(void *a1)
{
  id v1 = a1;
  sub_1AD99DCCC();
}

void sub_1AD99DE1C(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_contentView);
  id v6 = objc_msgSend(v2, sel_viewWithTag_, 1234);

  if (v6)
  {
    self;
    id v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      uint64_t v4 = v3;
      objc_msgSend(v3, sel_setHidden_, 1);
      objc_msgSend(v4, sel_stopAnimating);
      objc_msgSend(v4, sel_removeFromSuperview);
    }

    id v5 = v6;
  }
  else
  {
    id v5 = v1;
  }
}

void sub_1AD99DEF8(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = qword_1EB724E38;
  id v8 = v3;
  if (v7 != -1) {
    swift_once();
  }
  id v9 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  unint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  uint64_t v10[3] = a2;
  v10[4] = v8;
  v10[5] = ObjectType;
  id v27 = v8;
  swift_retain();
  uint64_t v11 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1AD99EE3C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD9199DC;
  aBlock[3] = &block_descriptor_34;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  id v13 = self;
  id v14 = objc_msgSend(v13, sel_actionWithTitle_style_handler_, v11, 0, v12, 0xE000000000000000);
  _Block_release(v12);

  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1AD9E53A0;
  *(void *)(v15 + 32) = sub_1AD9DF710();
  *(void *)(v15 + 40) = v16;
  *(void *)(v15 + 48) = 0x7065656C53;
  *(void *)(v15 + 56) = 0xE500000000000000;
  *(void *)(v15 + 64) = 0x696472616F626E4FLL;
  *(void *)(v15 + 72) = 0xEA0000000000676ELL;
  aBlock[0] = v15;
  sub_1AD86C2F8((uint64_t)&unk_1F046A920);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  sub_1AD9DF690();
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  uint64_t v17 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setAccessibilityIdentifier_, v17);

  id v18 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  uint64_t v19 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v13, sel_actionWithTitle_style_handler_, v19, 1, 0, 0xE000000000000000);

  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1AD9E53A0;
  *(void *)(v21 + 32) = sub_1AD9DF710();
  *(void *)(v21 + 40) = v22;
  *(void *)(v21 + 48) = 0x7065656C53;
  *(void *)(v21 + 56) = 0xE500000000000000;
  *(void *)(v21 + 64) = 0x696472616F626E4FLL;
  *(void *)(v21 + 72) = 0xEA0000000000676ELL;
  aBlock[0] = v21;
  sub_1AD86C2F8((uint64_t)&unk_1F046A960);
  sub_1AD9DF690();
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  uint64_t v23 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_setAccessibilityIdentifier_, v23);

  id v24 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  BOOL v25 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, 0, v25, 0, 0xE000000000000000);

  objc_msgSend(v26, sel_addAction_, v14);
  objc_msgSend(v26, sel_addAction_, v20);
  objc_msgSend(v27, sel_presentViewController_animated_completion_, v26, 1, 0);
}

void sub_1AD99E4A0(uint64_t a1, void (*a2)(void), uint64_t a3, void *a4)
{
  a2();
  id v20 = a4;
  sub_1AD99EE60();
  sub_1AD99EEA0();
  id v5 = a4;
  if (swift_dynamicCast())
  {
    sub_1AD843F30(v18, (uint64_t)v21);
    uint64_t v6 = v22;
    uint64_t v7 = v23;
    __swift_project_boxed_opaque_existential_1Tm(v21, v22);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7))
    {
      uint64_t v9 = v8;
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
      return;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  }
  else
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_1AD99EEF8((uint64_t)v18);
  }
  if (qword_1EB725658 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1AD9DD550();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EB725958);
  uint64_t v12 = sub_1AD9DD530();
  os_log_type_t v13 = sub_1AD9DFBD0();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v21[0] = v15;
    *(_DWORD *)id v14 = 136446210;
    uint64_t v16 = sub_1AD9E04F0();
    *(void *)&v18[0] = sub_1AD838978(v16, v17, v21);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v12, v13, "[%{public}s] No delegate found while attemping to cancel onboarding", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v15, -1, -1);
    MEMORY[0x1B3E6D1A0](v14, -1, -1);
  }
}

uint64_t sub_1AD99E704(void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = a1;
  sub_1AD99DEF8((uint64_t)sub_1AD99EDEC, v5);

  return swift_release();
}

void sub_1AD99E790(void *a1, uint64_t a2, void *a3)
{
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v6 = a3;
  id v7 = a1;
  id v8 = objc_msgSend(v5, sel_initWithImage_, v6);
  objc_msgSend(v8, sel_setContentMode_, 1);
  id v9 = objc_msgSend(v7, sel_contentView);
  objc_msgSend(v9, sel_addSubview_, v8);

  id v10 = objc_msgSend(v7, sel_contentView);
  UIView.alignConstraints(to:insets:reduceBottomConstraintPriority:)(v10, 0, *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));

  swift_bridgeObjectRelease();
}

void sub_1AD99E8A0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  id v6 = objc_msgSend(v5, sel_contentView);
  objc_msgSend(v6, sel_addSubview_, v4);

  id v7 = objc_msgSend(v5, sel_contentView);
  objc_msgSend(v7, sel_setClipsToBounds_, 1);

  id v8 = objc_msgSend(v5, sel_contentView);
  UIView.alignConstraints(to:insets:reduceBottomConstraintPriority:)(v8, 0, *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));

  swift_bridgeObjectRelease();
}

void OBWelcomeController.hksp_addHostedContentView<A>(hostedView:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AD9DE700();
  MEMORY[0x1F4188790](v4, v5);
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v7, v8);
  id v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DE370();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, a1, a2);
  uint64_t v11 = (void *)sub_1AD9DE360();
  uint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F3DF98];
  sub_1AD99EF84(0, &qword_1E9A4D6A0, MEMORY[0x1E4F3DF98], MEMORY[0x1E4FBBE00]);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1AD9E3070;
  id v14 = (void *)v21[0];
  sub_1AD9DE6F0();
  v21[1] = v13;
  sub_1AD99ECCC();
  sub_1AD99EF84(0, &qword_1E9A4D6B0, v12, MEMORY[0x1E4FBB320]);
  sub_1AD99ED24();
  sub_1AD9DFF40();
  sub_1AD9DE350();
  objc_msgSend(v14, sel_addChildViewController_, v11);
  id v15 = objc_msgSend(v14, sel_contentView);
  id v16 = objc_msgSend(v11, sel_view);
  if (v16)
  {
    unint64_t v17 = v16;
    objc_msgSend(v15, sel_addSubview_, v16);

    objc_msgSend(v11, sel_didMoveToParentViewController_, v14);
    id v18 = objc_msgSend(v11, sel_view);
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = objc_msgSend(v14, sel_contentView);
      objc_msgSend(v19, sel_hk_alignConstraintsWithView_, v20);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

unint64_t sub_1AD99ECCC()
{
  unint64_t result = qword_1E9A4D6A8;
  if (!qword_1E9A4D6A8)
  {
    sub_1AD9DE700();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D6A8);
  }
  return result;
}

unint64_t sub_1AD99ED24()
{
  unint64_t result = qword_1E9A4D6B8;
  if (!qword_1E9A4D6B8)
  {
    sub_1AD99EF84(255, &qword_1E9A4D6B0, MEMORY[0x1E4F3DF98], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D6B8);
  }
  return result;
}

uint64_t sub_1AD99EDAC()
{
  return 0;
}

uint64_t sub_1AD99EDB4()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1AD99EDEC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1AD99EDFC()
{
  swift_release();

  return swift_deallocObject();
}

void sub_1AD99EE3C(uint64_t a1)
{
  sub_1AD99E4A0(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t block_copy_helper_34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_34()
{
  return swift_release();
}

unint64_t sub_1AD99EE60()
{
  unint64_t result = qword_1E9A4D6C0;
  if (!qword_1E9A4D6C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A4D6C0);
  }
  return result;
}

unint64_t sub_1AD99EEA0()
{
  unint64_t result = qword_1E9A4D6C8;
  if (!qword_1E9A4D6C8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A4D6C8);
  }
  return result;
}

uint64_t sub_1AD99EEF8(uint64_t a1)
{
  sub_1AD99EF84(0, &qword_1E9A4D6D0, (uint64_t (*)(uint64_t))sub_1AD99EEA0, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1AD99EF84(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t *sub_1AD99EFE8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a3[5];
    unint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1AD9DCE40();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)v4 + v11) = (uint64_t)v12;
    uint64_t v13 = a3[8];
    uint64_t v14 = a3[9];
    id v15 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)v4 + v13) = (uint64_t)v15;
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    id v16 = v12;
    id v17 = v15;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1AD99F0FC(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_1AD9DCE40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

_OWORD *sub_1AD99F198(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD9DCE40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v11 = *(void **)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = v11;
  uint64_t v12 = a3[8];
  uint64_t v13 = a3[9];
  uint64_t v14 = *(void **)((char *)a2 + v12);
  *(void *)((char *)a1 + v12) = v14;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  id v15 = v11;
  id v16 = v14;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1AD99F25C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD9DCE40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v10 = a3[7];
  uint64_t v11 = *(void **)((char *)a2 + v10);
  uint64_t v12 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = v11;
  id v13 = v11;

  uint64_t v14 = a3[8];
  id v15 = *(void **)((char *)a2 + v14);
  id v16 = *(void **)((char *)a1 + v14);
  *(void *)((char *)a1 + v14) = v15;
  id v17 = v15;

  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1AD99F348(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD9DCE40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

_OWORD *sub_1AD99F3FC(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  unint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1AD9DCE40();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v11 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);

  uint64_t v12 = a3[8];
  id v13 = *(void **)((char *)a1 + v12);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);

  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AD99F4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD99F4E0);
}

uint64_t sub_1AD99F4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DCE40();
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_1AD99F5A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD99F5B8);
}

uint64_t sub_1AD99F5B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1AD9DCE40();
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
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for WeekResultsBuilder()
{
  uint64_t result = qword_1E9A4D6E0;
  if (!qword_1E9A4D6E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AD99F6C4()
{
  uint64_t result = sub_1AD9DCE40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AD99F788()
{
  type metadata accessor for WeekResultsBuilder();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_1AD864D84(v0);
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_sleepDurationGoal);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_msgSend(self, sel_secondUnit);
      objc_msgSend(v4, sel_doubleValueForUnit_, v5);
      uint64_t v7 = v6;

      return v7;
    }
  }
  return 0;
}

id sub_1AD99F86C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  v123 = a1;
  uint64_t v3 = sub_1AD9DCE40();
  uint64_t v121 = *(void *)(v3 - 8);
  uint64_t v122 = v3;
  MEMORY[0x1F4188790](v3, v4);
  v117 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1AD9DC7C0();
  uint64_t v119 = *(void *)(v6 - 8);
  uint64_t v120 = v6;
  MEMORY[0x1F4188790](v6, v7);
  v116 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WeekResultsBuilder();
  MEMORY[0x1F4188790](v9, v10);
  unint64_t v12 = (uint64_t *)((char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v125 = sub_1AD9DCC70();
  uint64_t v113 = *(void *)(v125 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v125, v13);
  v115 = (char *)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v14, v16);
  v114 = (char *)&v105 - v18;
  uint64_t v20 = MEMORY[0x1F4188790](v17, v19);
  v126 = (char *)&v105 - v21;
  uint64_t v23 = MEMORY[0x1F4188790](v20, v22);
  v112 = (char *)&v105 - v24;
  uint64_t v26 = MEMORY[0x1F4188790](v23, v25);
  v130 = (char *)&v105 - v27;
  MEMORY[0x1F4188790](v26, v28);
  uint64_t v30 = (char *)&v105 - v29;
  uint64_t v31 = self;
  uint64_t v32 = swift_bridgeObjectRetain();
  sub_1AD9A1434(v32);
  swift_bridgeObjectRelease();
  sub_1AD867BF0();
  uint64_t v33 = (void *)sub_1AD9DF850();
  swift_release();
  uint64_t v34 = *v2;
  id v128 = objc_msgSend(v31, sel_sleepMetricsForDaySummaries_inMorningIndexRange_, v33, *v2, v2[1]);

  uint64_t v118 = v9;
  uint64_t v35 = (char *)v2 + *(int *)(v9 + 20);
  uint64_t v36 = self;
  id v127 = v35;
  uint64_t v37 = sub_1AD9DCDA0();
  id v38 = objc_msgSend(v36, sel_hk_noonWithDayIndex_calendar_, v34, v37);

  uint64_t v39 = v30;
  sub_1AD9DCC40();

  uint64_t v40 = sub_1AD9DFC00();
  LOBYTE(v37) = v41;
  sub_1AD9A1874((uint64_t)v2, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for WeekResultsBuilder);
  if (v37) {
    uint64_t v40 = *v12;
  }
  sub_1AD9A18DC((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for WeekResultsBuilder);
  uint64_t v42 = (void *)sub_1AD9DCDA0();
  id v43 = objc_msgSend(v36, sel_hk_noonWithDayIndex_calendar_, v40, v42);

  sub_1AD9DCC40();
  id v44 = v128;
  uint64_t v45 = (uint64_t)objc_msgSend(v128, sel_sleepAnalysisCount);
  uint64_t v46 = 0;
  uint64_t v47 = v113;
  v129 = v39;
  if (v45 < 2)
  {
    int v53 = 1;
    uint64_t v49 = v125;
  }
  else
  {
    id v48 = objc_msgSend(v44, sel_averageSleepDuration);
    uint64_t v49 = v125;
    if (v48)
    {
      uint64_t v50 = v48;
      id v51 = objc_msgSend(v48, sel_hk_secondsNumber);

      objc_msgSend(v51, sel_doubleValue);
      uint64_t v46 = v52;

      int v53 = 0;
    }
    else
    {
      int v53 = 1;
    }
  }
  uint64_t v54 = sub_1AD99F788();
  LODWORD(v111) = v55;
  v56 = v126;
  if (qword_1E9A49078 != -1) {
    swift_once();
  }
  LODWORD(v125) = v53;
  uint64_t v57 = sub_1AD9DD550();
  __swift_project_value_buffer(v57, (uint64_t)qword_1E9A4D2B8);
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
  uint64_t v59 = v112;
  v58(v112, v129, v49);
  v58(v56, v130, v49);
  unint64_t v60 = sub_1AD9DD530();
  os_log_type_t v61 = sub_1AD9DFBA0();
  int v62 = v61;
  BOOL v63 = os_log_type_enabled(v60, v61);
  uint64_t v124 = v54;
  if (v63)
  {
    uint64_t v64 = swift_slowAlloc();
    v109 = v58;
    uint64_t v65 = v64;
    uint64_t v108 = swift_slowAlloc();
    uint64_t v133 = v108;
    *(_DWORD *)uint64_t v65 = 136447235;
    int v107 = v62;
    uint64_t v131 = sub_1AD838978(0xD000000000000012, 0x80000001AD9EDD90, &v133);
    os_log_t v106 = v60;
    sub_1AD9DFEA0();
    *(_WORD *)(v65 + 12) = 2080;
    sub_1AD9A17C8((unint64_t *)&qword_1EB725230, MEMORY[0x1E4F27928]);
    v110 = v2;
    uint64_t v66 = sub_1AD9E0280();
    uint64_t v131 = sub_1AD838978(v66, v67, &v133);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    uint64_t v68 = *(void (**)(char *, uint64_t))(v47 + 8);
    uint64_t v113 = (v47 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v68(v59, v49);
    *(_WORD *)(v65 + 22) = 2080;
    v69 = v126;
    uint64_t v70 = sub_1AD9E0280();
    uint64_t v131 = sub_1AD838978(v70, v71, &v133);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    id v72 = v69;
    uint64_t v73 = v124;
    v126 = (char *)v68;
    v68(v72, v49);
    *(_WORD *)(v65 + 32) = 2081;
    uint64_t v131 = v46;
    char v132 = v125;
    sub_1AD9A1B38(0, (unint64_t *)&qword_1EB725080, MEMORY[0x1E4FBB3D0], MEMORY[0x1E4FBB718]);
    uint64_t v74 = sub_1AD9DF730();
    uint64_t v131 = sub_1AD838978(v74, v75, &v133);
    uint64_t v2 = v110;
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v65 + 42) = 2081;
    uint64_t v54 = v73;
    uint64_t v131 = v73;
    char v76 = v111;
    char v132 = v111 & 1;
    uint64_t v77 = sub_1AD9DF730();
    uint64_t v131 = sub_1AD838978(v77, v78, &v133);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    os_log_t v79 = v106;
    _os_log_impl(&dword_1AD834000, v106, (os_log_type_t)v107, "[%{public}s] [%s-%s] average: %{private}s, mostRecentGoal: %{private}s", (uint8_t *)v65, 0x34u);
    uint64_t v80 = v108;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v80, -1, -1);
    uint64_t v81 = v65;
    uint64_t v58 = v109;
    MEMORY[0x1B3E6D1A0](v81, -1, -1);
  }
  else
  {
    v84 = *(void (**)(char *, uint64_t))(v47 + 8);
    uint64_t v113 = (v47 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v84(v59, v49);
    v126 = (char *)v84;
    v84(v56, v49);

    char v76 = v111;
  }
  MEMORY[0x1F4188790](v82, v83);
  *(&v105 - 4) = (uint64_t)v2;
  *(&v105 - 3) = v54;
  LODWORD(v112) = v76 & 1;
  *((unsigned char *)&v105 - 16) = v76 & 1;
  uint64_t v111 = sub_1AD9A0B04((void (*)(void *__return_ptr, char *))sub_1AD9A1544, (uint64_t)(&v105 - 6), v85, v86);
  v58(v114, v129, v49);
  v87 = v130;
  v58(v115, v130, v49);
  v88 = v116;
  sub_1AD9DC760();
  sub_1AD9A03D4();
  uint64_t v90 = v89;
  uint64_t v92 = v121;
  uint64_t v91 = v122;
  v93 = v117;
  (*(void (**)(char *, id, uint64_t))(v121 + 16))(v117, v127, v122);
  uint64_t v94 = v118;
  v95 = *(void **)((char *)v2 + *(int *)(v118 + 32));
  id v96 = objc_allocWithZone(MEMORY[0x1E4F28C00]);
  id v127 = v95;
  id v97 = objc_msgSend(v96, sel_init);
  objc_msgSend(v97, sel_setAllowedUnits_, 32);
  objc_msgSend(v97, sel_setUnitsStyle_, 1);

  v98 = v87;
  v99 = (void (*)(char *, uint64_t))v126;
  ((void (*)(char *, uint64_t))v126)(v98, v49);
  v99(v129, v49);
  v130 = *(char **)((char *)v2 + *(int *)(v94 + 28));
  v100 = v123;
  uint64_t *v123 = v111;
  v100[1] = v46;
  *((unsigned char *)v100 + 16) = v125;
  v101 = (int *)type metadata accessor for WeekResults(0);
  (*(void (**)(char *, char *, uint64_t))(v119 + 32))((char *)v100 + v101[6], v88, v120);
  *(uint64_t *)((char *)v100 + v101[7]) = v90;
  v102 = (char *)v100 + v101[8];
  *(void *)v102 = v124;
  v102[8] = (char)v112;
  *(uint64_t *)((char *)v100 + v101[9]) = 0x40AC200000000000;
  (*(void (**)(char *, char *, uint64_t))(v92 + 32))((char *)v100 + v101[10], v93, v91);
  *(uint64_t *)((char *)v100 + v101[11]) = (uint64_t)v127;
  *(uint64_t *)((char *)v100 + v101[12]) = (uint64_t)v97;
  v103 = v130;
  *(uint64_t *)((char *)v100 + v101[13]) = (uint64_t)v130;
  return v103;
}

void sub_1AD9A03D4()
{
  type metadata accessor for WeekResultsBuilder();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_1AD9A049C(v0);
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  if (v2)
  {
    objc_msgSend(v2, sel_sleepDuration);
  }
}

uint64_t sub_1AD9A049C(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  char v3 = *(unsigned char *)(a1 + 32);
  uint64_t v4 = 1 << v3;
  uint64_t v5 = -1;
  if (1 << v3 < 64) {
    uint64_t v5 = ~(-1 << (1 << v3));
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = __clz(__rbit64(v6));
    unint64_t v9 = (v6 - 1) & v6;
    int64_t v10 = (unint64_t)(v4 + 63) >> 6;
    while (2)
    {
      uint64_t v11 = 8 * v8;
      uint64_t v31 = *(void *)(*(void *)(a1 + 48) + v11);
      unint64_t v12 = *(void **)(*(void *)(a1 + 56) + v11);
      swift_bridgeObjectRetain();
      id v14 = v12;
      if (v9)
      {
LABEL_6:
        unint64_t v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v16 = v15 | (v7 << 6);
        goto LABEL_7;
      }
      while (1)
      {
        int64_t v23 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          break;
        }
        if (v23 >= v10) {
          goto LABEL_27;
        }
        unint64_t v24 = *(void *)(v2 + 8 * v23);
        ++v7;
        if (!v24)
        {
          uint64_t v7 = v23 + 1;
          if (v23 + 1 >= v10) {
            goto LABEL_27;
          }
          unint64_t v24 = *(void *)(v2 + 8 * v7);
          if (!v24)
          {
            uint64_t v7 = v23 + 2;
            if (v23 + 2 >= v10) {
              goto LABEL_27;
            }
            unint64_t v24 = *(void *)(v2 + 8 * v7);
            if (!v24)
            {
              uint64_t v7 = v23 + 3;
              if (v23 + 3 >= v10) {
                goto LABEL_27;
              }
              unint64_t v24 = *(void *)(v2 + 8 * v7);
              if (!v24)
              {
                int64_t v25 = v23 + 4;
                if (v25 >= v10)
                {
LABEL_27:
                  swift_release();
                  return v31;
                }
                unint64_t v24 = *(void *)(v2 + 8 * v25);
                if (!v24)
                {
                  while (1)
                  {
                    uint64_t v7 = v25 + 1;
                    if (__OFADD__(v25, 1)) {
                      break;
                    }
                    if (v7 >= v10) {
                      goto LABEL_27;
                    }
                    unint64_t v24 = *(void *)(v2 + 8 * v7);
                    ++v25;
                    if (v24) {
                      goto LABEL_24;
                    }
                  }
                  __break(1u);
LABEL_44:
                  uint64_t v28 = 0;
                  uint64_t v29 = 6;
                  if (v10 > 6) {
                    uint64_t v29 = v10;
                  }
                  uint64_t v30 = v29 - 6;
                  while (v30 != v28)
                  {
                    unint64_t v27 = *(void *)(a1 + 112 + 8 * v28++);
                    if (v27)
                    {
                      uint64_t v7 = v28 + 5;
                      goto LABEL_31;
                    }
                  }
                  return 0;
                }
                uint64_t v7 = v25;
              }
            }
          }
        }
LABEL_24:
        unint64_t v9 = (v24 - 1) & v24;
        unint64_t v16 = __clz(__rbit64(v24)) + (v7 << 6);
LABEL_7:
        uint64_t v17 = 8 * v16;
        uint64_t v18 = *(void *)(*(void *)(a1 + 48) + v17);
        id v19 = *(id *)(*(void *)(a1 + 56) + v17);
        objc_msgSend(v14, sel_sleepDuration);
        double v21 = v20;
        objc_msgSend(v19, sel_sleepDuration);
        if (v21 < v22)
        {

          id v14 = v19;
          uint64_t v31 = v18;
          if (v9) {
            goto LABEL_6;
          }
        }
        else
        {

          if (v9) {
            goto LABEL_6;
          }
        }
      }
      __break(1u);
LABEL_38:
      if (v13 >= 9)
      {
        unint64_t v27 = *(void *)(a1 + 96);
        if (v27)
        {
          uint64_t v7 = 4;
        }
        else
        {
          unint64_t v27 = *(void *)(a1 + 104);
          if (!v27) {
            goto LABEL_44;
          }
          uint64_t v7 = 5;
        }
LABEL_31:
        unint64_t v9 = (v27 - 1) & v27;
        unint64_t v8 = __clz(__rbit64(v27)) + (v7 << 6);
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned int v13 = v3 & 0x3F;
    if (v13 > 6)
    {
      int64_t v10 = (unint64_t)(v4 + 63) >> 6;
      unint64_t v27 = *(void *)(a1 + 72);
      if (v27)
      {
        uint64_t v7 = 1;
        goto LABEL_31;
      }
      if (v13 >= 8)
      {
        unint64_t v27 = *(void *)(a1 + 80);
        if (v27)
        {
          uint64_t v7 = 2;
        }
        else
        {
          unint64_t v27 = *(void *)(a1 + 88);
          if (!v27) {
            goto LABEL_38;
          }
          uint64_t v7 = 3;
        }
        goto LABEL_31;
      }
    }
  }
  return 0;
}

void sub_1AD9A0760(uint64_t a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  int v33 = a4;
  uint64_t v31 = a5;
  double v32 = a3;
  uint64_t v8 = sub_1AD9DF4A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  unint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_1AD9DF490();
  uint64_t v13 = *(void *)(a2 + *(int *)(type metadata accessor for WeekResultsBuilder() + 36));
  uint64_t v14 = sub_1AD9DF490();
  double v15 = 0.0;
  if (*(void *)(v13 + 16))
  {
    unint64_t v16 = sub_1AD8651E4(v14);
    if (v17)
    {
      objc_msgSend(*(id *)(*(void *)(v13 + 56) + 8 * v16), sel_sleepDuration);
      double v15 = v18;
    }
  }
  if (qword_1E9A49078 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1AD9DD550();
  __swift_project_value_buffer(v19, (uint64_t)qword_1E9A4D2B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  double v20 = sub_1AD9DD530();
  os_log_type_t v21 = sub_1AD9DFBA0();
  if (os_log_type_enabled(v20, v21))
  {
    v29[1] = v5;
    uint64_t v22 = swift_slowAlloc();
    v29[0] = swift_slowAlloc();
    uint64_t v35 = v29[0];
    *(_DWORD *)uint64_t v22 = 136446979;
    uint64_t v34 = sub_1AD838978(0xD000000000000012, 0x80000001AD9EDD90, &v35);
    sub_1AD9DFEA0();
    *(_WORD *)(v22 + 12) = 2048;
    uint64_t v23 = sub_1AD9DF490();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    uint64_t v34 = v23;
    sub_1AD9DFEA0();
    *(_WORD *)(v22 + 22) = 2049;
    uint64_t v34 = *(void *)&v15;
    sub_1AD9DFEA0();
    *(_WORD *)(v22 + 32) = 1024;
    char v24 = v33;
    if (v33)
    {
      BOOL v25 = 0;
      double v26 = v32;
    }
    else
    {
      double v26 = v32;
      BOOL v25 = v32 - *MEMORY[0x1E4FA5578] <= v15;
    }
    LODWORD(v34) = v25;
    sub_1AD9DFEA0();
    _os_log_impl(&dword_1AD834000, v20, v21, "[%{public}s] [Index %ld] duration: %{private}f, met goal: %{BOOL}d", (uint8_t *)v22, 0x26u);
    uint64_t v27 = v29[0];
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v27, -1, -1);
    MEMORY[0x1B3E6D1A0](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

    char v24 = v33;
    double v26 = v32;
  }
  uint64_t v28 = v31;
  *uint64_t v31 = v30;
  *((double *)v28 + 1) = v15;
  *((double *)v28 + 2) = v26;
  *((unsigned char *)v28 + 24) = v24 & 1;
}

uint64_t sub_1AD9A0B04(void (*a1)(void *__return_ptr, char *), uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t, uint64_t))
{
  void (*v87)(void *__return_ptr, char *);
  uint64_t v88;
  void (*v89)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  void (**v96)(char *, char *, uint64_t);
  void (**v97)(char *, uint64_t);
  uint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t (*v104)(char *, uint64_t);
  void v105[3];
  char v106;
  uint64_t v107;

  uint64_t v5 = v4;
  v88 = a2;
  v87 = a1;
  sub_1AD9A1568();
  v100 = v7;
  uint64_t v9 = MEMORY[0x1F4188790](v7, v8);
  v93 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v11);
  uint64_t v92 = (char *)&v79 - v12;
  sub_1AD9A15D0();
  uint64_t v14 = v13;
  uint64_t v16 = MEMORY[0x1F4188790](v13, v15);
  uint64_t v91 = (uint64_t)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v16, v18);
  v99 = (char *)&v79 - v20;
  MEMORY[0x1F4188790](v19, v21);
  uint64_t v90 = (uint64_t)&v79 - v22;
  sub_1AD9A1664();
  MEMORY[0x1F4188790](v23 - 8, v24);
  v101 = (char *)&v79 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1AD9DF4A0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v29 = MEMORY[0x1F4188790](v26, v28);
  uint64_t v89 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v79 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = MEMORY[0x1F4188790](v29, v31);
  v86 = (char *)&v79 - v33;
  MEMORY[0x1F4188790](v32, v34);
  uint64_t v85 = (char *)&v79 - v35;
  sub_1AD9A16BC();
  uint64_t v37 = v36 - 8;
  MEMORY[0x1F4188790](v36, v38);
  uint64_t v40 = (char *)&v79 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v107 = MEMORY[0x1E4FBC860];
  sub_1AD8A2698(0, 0, 0);
  sub_1AD9DFBF0();
  char v41 = &v40[*(int *)(v37 + 44)];
  v98 = v14;
  uint64_t v42 = *(int *)(v14 + 36);
  uint64_t v43 = (uint64_t)v40;
  id v44 = &v40[v42];
  uint64_t v84 = sub_1AD9A17C8(&qword_1E9A4D728, MEMORY[0x1E4F295A0]);
  if (sub_1AD9DF6C0())
  {
    a4 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
LABEL_15:
    uint64_t v78 = (uint64_t)v101;
    a4(v101, 1, 1, v26);
    sub_1AD9A18DC(v43, (uint64_t (*)(void))sub_1AD9A16BC);
    sub_1AD9A18DC(v78, (uint64_t (*)(void))sub_1AD9A1664);
    return v107;
  }
  else
  {
    uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
    uint64_t v46 = v27 + 16;
    uint64_t v45 = v47;
    id v96 = (void (**)(char *, char *, uint64_t))(v46 + 16);
    id v97 = (void (**)(char *, uint64_t))(v46 - 8);
    uint64_t v83 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 40);
    uint64_t v82 = v43;
    v95 = v41;
    uint64_t v81 = v44;
    uint64_t v94 = v46;
    uint64_t v80 = v47;
    while (1)
    {
      v45(v101, v41, v26);
      v102 = sub_1AD9A17C8(&qword_1E9A4D700, MEMORY[0x1E4F295A0]);
      if ((sub_1AD9DF6B0() & 1) == 0) {
        break;
      }
      v103 = v5;
      uint64_t v48 = v100;
      uint64_t v49 = v92;
      uint64_t v50 = (uint64_t (*)(char *, uint64_t))&v92[*(int *)(v100 + 48)];
      v45(v92, (char *)v43, v26);
      v104 = v50;
      v45((char *)v50, v44, v26);
      id v51 = v93;
      uint64_t v52 = &v93[*(int *)(v48 + 48)];
      v45(v93, v49, v26);
      v45(v52, (char *)v50, v26);
      int v53 = *v96;
      (*v96)(v99, v51, v26);
      uint64_t v54 = *v97;
      (*v97)(v52, v26);
      int v55 = &v51[*(int *)(v100 + 48)];
      v56 = v49;
      uint64_t v57 = v53;
      uint64_t v58 = v54;
      v57(v51, v56, v26);
      v57(v55, (char *)v104, v26);
      uint64_t v59 = (uint64_t)v99;
      v57(&v99[*(int *)(v98 + 36)], v55, v26);
      v104 = (uint64_t (*)(char *, uint64_t))v58;
      v58(v51, v26);
      uint64_t v60 = v90;
      sub_1AD9A1810(v59, v90);
      os_log_type_t v61 = v95;
      LOBYTE(v50) = sub_1AD9DF6B0();
      a4 = v89;
      int v62 = v61;
      v45((char *)v89, v61, v26);
      uint64_t v43 = v91;
      sub_1AD9A1874(v60, v91, (uint64_t (*)(void))sub_1AD9A15D0);
      if ((v50 & 1) == 0) {
        goto LABEL_17;
      }
      char v63 = sub_1AD9DF6A0();
      sub_1AD9A18DC(v43, (uint64_t (*)(void))sub_1AD9A15D0);
      uint64_t result = v104((char *)a4, v26);
      if ((v63 & 1) == 0) {
        goto LABEL_18;
      }
      sub_1AD9A18DC(v60, (uint64_t (*)(void))sub_1AD9A15D0);
      v105[0] = 1;
      sub_1AD9A17C8(&qword_1E9A4D720, MEMORY[0x1E4F295A0]);
      uint64_t v65 = v86;
      sub_1AD9DFEC0();
      v104(v62, v26);
      v57(v62, v65, v26);
      a4 = *v83;
      uint64_t v66 = v101;
      (*v83)(v101, 0, 1, v26);
      unint64_t v67 = v85;
      v57(v85, v66, v26);
      uint64_t v68 = v103;
      v87(v105, v67);
      if (v68)
      {
        v104(v67, v26);
        sub_1AD9A18DC(v82, (uint64_t (*)(void))sub_1AD9A16BC);
        return swift_release();
      }
      v103 = 0;
      v104(v67, v26);
      uint64_t v69 = v105[0];
      uint64_t v70 = v105[1];
      uint64_t v71 = v105[2];
      char v72 = v106;
      uint64_t v73 = v107;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1AD8A2698(0, *(void *)(v73 + 16) + 1, 1);
        uint64_t v73 = v107;
      }
      unint64_t v75 = *(void *)(v73 + 16);
      unint64_t v74 = *(void *)(v73 + 24);
      if (v75 >= v74 >> 1)
      {
        sub_1AD8A2698(v74 > 1, v75 + 1, 1);
        uint64_t v73 = v107;
      }
      *(void *)(v73 + 16) = v75 + 1;
      uint64_t v76 = v73 + 32 * v75;
      *(void *)(v76 + 32) = v69;
      *(void *)(v76 + 40) = v70;
      *(void *)(v76 + 48) = v71;
      *(unsigned char *)(v76 + 56) = v72;
      char v41 = v95;
      id v44 = v81;
      char v77 = sub_1AD9DF6C0();
      uint64_t v5 = v103;
      uint64_t v43 = v82;
      uint64_t v45 = v80;
      if (v77) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    sub_1AD9A18DC(v43, (uint64_t (*)(void))sub_1AD9A15D0);
    uint64_t result = v104((char *)a4, v26);
LABEL_18:
    __break(1u);
  }
  return result;
}

void *sub_1AD9A1434(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1AD9A1B38(0, (unint64_t *)&qword_1EB725350, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  char v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  unint64_t v6 = sub_1AD9A193C(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1AD999704();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

void sub_1AD9A1544(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1AD9A0760(a1, *(void *)(v2 + 16), *(double *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), a2);
}

void sub_1AD9A1568()
{
  if (!qword_1E9A4D6F0)
  {
    sub_1AD9DF4A0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A4D6F0);
    }
  }
}

void sub_1AD9A15D0()
{
  if (!qword_1E9A4D6F8)
  {
    sub_1AD9DF4A0();
    sub_1AD9A17C8(&qword_1E9A4D700, MEMORY[0x1E4F295A0]);
    unint64_t v0 = sub_1AD9DFAC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D6F8);
    }
  }
}

void sub_1AD9A1664()
{
  if (!qword_1E9A4D708)
  {
    sub_1AD9DF4A0();
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D708);
    }
  }
}

void sub_1AD9A16BC()
{
  if (!qword_1E9A4D710)
  {
    sub_1AD9A15D0();
    sub_1AD9A1720();
    unint64_t v0 = sub_1AD9E0120();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D710);
    }
  }
}

unint64_t sub_1AD9A1720()
{
  unint64_t result = qword_1E9A4D718;
  if (!qword_1E9A4D718)
  {
    sub_1AD9A15D0();
    sub_1AD9A17C8(&qword_1E9A4D720, MEMORY[0x1E4F295A0]);
    sub_1AD8587EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D718);
  }
  return result;
}

uint64_t sub_1AD9A17C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AD9A1810(uint64_t a1, uint64_t a2)
{
  sub_1AD9A15D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD9A1874(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AD9A18DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1AD9A193C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_1AD9A1B38(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t FloatingPoint.rounded(_:toNearest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v10 = (char *)&v13 - v9;
  sub_1AD9DF620();
  sub_1AD9DF630();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v6, a3);
  sub_1AD9DFA00();
  return ((uint64_t (*)(char *, uint64_t))v11)(v10, a3);
}

uint64_t static DateComponents.hourAndMinuteComponents.getter()
{
  sub_1AD9A58C4(0, &qword_1E9A4C140, MEMORY[0x1E4F27C88], MEMORY[0x1E4FBBE00]);
  uint64_t v0 = sub_1AD9DCE20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9E3080;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E4F27C10], v0);
  v6(v5 + v2, *MEMORY[0x1E4F27C48], v0);
  uint64_t v7 = sub_1AD922F84(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t DateComponents.timeComponents.getter@<X0>(uint64_t a1@<X8>)
{
  unint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD9A58C4(0, &qword_1E9A49F50, MEMORY[0x1E4F27D68], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v20 - v6;
  sub_1AD9A58C4(0, &qword_1EB725690, MEMORY[0x1E4F27CA0], v3);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)&v20 - v10;
  sub_1AD9DC910();
  if (v12 & 1) != 0 && (sub_1AD9DC920(), (v13) && (sub_1AD9DC8D0(), (v14))
  {
    uint64_t v18 = sub_1AD9DC990();
    int64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
    return v19(a1, v1, v18);
  }
  else
  {
    uint64_t v15 = sub_1AD9DCE40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
    uint64_t v16 = sub_1AD9DCEB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
    sub_1AD9DC8F0();
    sub_1AD9DC940();
    return sub_1AD9DC970();
  }
}

uint64_t DateComponents.calendarComponents.getter()
{
  uint64_t v3 = MEMORY[0x1E4FBC870];
  uint64_t v1 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  sub_1AD9A2C14(v1, v0, (uint64_t)&v3);
  swift_bridgeObjectRelease();
  return v3;
}

void static DateComponents.timeComponents(fromHours:)(double a1)
{
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD9A58C4(0, &qword_1E9A49F50, MEMORY[0x1E4F27D68], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v14 - v5;
  sub_1AD9A58C4(0, &qword_1EB725690, MEMORY[0x1E4F27CA0], v2);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v14 - v9;
  if (a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((*(void *)&a1 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_10;
  }
  double v11 = round((a1 - (double)(uint64_t)a1) * 60.0);
  if ((*(void *)&v11 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_10;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v11 < 9.22337204e18)
  {
    uint64_t v12 = sub_1AD9DCE40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
    uint64_t v13 = sub_1AD9DCEB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
    sub_1AD9DC970();
    return;
  }
LABEL_12:
  __break(1u);
}

uint64_t DateComponents.hourAndMinute.getter()
{
  uint64_t v0 = sub_1AD9DC8F0();
  if (v1) {
    return 0;
  }
  uint64_t v2 = v0;
  sub_1AD9DC940();
  if (v3) {
    return 0;
  }
  return v2;
}

uint64_t sub_1AD9A2450@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AD9DC8F0();
  if (v4 & 1) != 0 || (uint64_t v5 = v3, result = sub_1AD9DC940(), (v7))
  {
    uint64_t v9 = sub_1AD9DC990();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
    return v10(a1, v1, v9);
  }
  else if (result == 60 && __OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = sub_1AD9DC990();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, v1, v8);
    sub_1AD9DC900();
    return sub_1AD9DC950();
  }
  return result;
}

uint64_t sub_1AD9A2564(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a4)
  {
    if (a2) {
      return 0;
    }
    return 0;
  }
  if (a2) {
    return 0;
  }
  uint64_t v4 = -1;
  if (a3 >= a1) {
    uint64_t v4 = 1;
  }
  if (a3 == a1) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t static DateComponents.floatingCalendarComponents.getter()
{
  sub_1AD9A58C4(0, &qword_1E9A4C140, MEMORY[0x1E4F27C88], MEMORY[0x1E4FBBE00]);
  uint64_t v0 = sub_1AD9DCE20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9EB6D0;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E4F27C00], v0);
  v6(v5 + v2, *MEMORY[0x1E4F27C20], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E4F27C30], v0);
  v6(v5 + 3 * v2, *MEMORY[0x1E4F27BF0], v0);
  v6(v5 + 4 * v2, *MEMORY[0x1E4F27C10], v0);
  v6(v5 + 5 * v2, *MEMORY[0x1E4F27C48], v0);
  v6(v5 + 6 * v2, *MEMORY[0x1E4F27C50], v0);
  uint64_t v7 = sub_1AD922F84(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t static DateComponents.timeComponents.getter()
{
  sub_1AD9A58C4(0, &qword_1E9A4C140, MEMORY[0x1E4F27C88], MEMORY[0x1E4FBBE00]);
  uint64_t v0 = sub_1AD9DCE20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9E53A0;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E4F27C10], v0);
  v6(v5 + v2, *MEMORY[0x1E4F27C48], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E4F27C50], v0);
  uint64_t v7 = sub_1AD922F84(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t sub_1AD9A295C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v26[1] = a3;
  uint64_t v30 = a2;
  uint64_t v4 = sub_1AD9DCE20();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7, v10);
  uint64_t v12 = (char *)v26 - v11;
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v27 = a1 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v5 + 16;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v18 = 0;
  while (v16)
  {
    unint64_t v19 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v20 = v19 | (v18 << 6);
LABEL_21:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v12, *(void *)(a1 + 48) + *(void *)(v5 + 72) * v20, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v9, v12, v4);
    uint64_t v24 = sub_1AD9DC930();
    if ((v25 & 1) == 0 && v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (__OFSUB__(0, v24))
      {
        __break(1u);
        return swift_release();
      }
      sub_1AD9DC980();
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  int64_t v21 = v18 + 1;
  if (__OFADD__(v18, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v21 >= v28) {
    return swift_release();
  }
  unint64_t v22 = *(void *)(v27 + 8 * v21);
  ++v18;
  if (v22) {
    goto LABEL_20;
  }
  int64_t v18 = v21 + 1;
  if (v21 + 1 >= v28) {
    return swift_release();
  }
  unint64_t v22 = *(void *)(v27 + 8 * v18);
  if (v22) {
    goto LABEL_20;
  }
  int64_t v18 = v21 + 2;
  if (v21 + 2 >= v28) {
    return swift_release();
  }
  unint64_t v22 = *(void *)(v27 + 8 * v18);
  if (v22)
  {
LABEL_20:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v18 << 6);
    goto LABEL_21;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v28) {
    return swift_release();
  }
  unint64_t v22 = *(void *)(v27 + 8 * v23);
  if (v22)
  {
    int64_t v18 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v18 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v18 >= v28) {
      return swift_release();
    }
    unint64_t v22 = *(void *)(v27 + 8 * v18);
    ++v23;
    if (v22) {
      goto LABEL_20;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1AD9A2C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = a3;
  uint64_t v53 = a2;
  uint64_t v4 = sub_1AD9DCE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v47 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v46 = (uint64_t)&v45 - v10;
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v14 = (char *)&v45 - v13;
  MEMORY[0x1F4188790](v15, v16);
  int64_t v18 = (char *)&v45 - v17;
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v49 = a1 + 56;
  uint64_t v20 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  int64_t v50 = (unint64_t)(v20 + 63) >> 6;
  uint64_t v23 = v5 + 16;
  uint64_t v24 = v5 + 32;
  uint64_t v52 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t v54 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v26 = 0;
  while (1)
  {
    if (v22)
    {
      unint64_t v27 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v28 = v27 | (v26 << 6);
      goto LABEL_21;
    }
    int64_t v29 = v26 + 1;
    if (__OFADD__(v26, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v29 >= v50) {
      return swift_release();
    }
    unint64_t v30 = *(void *)(v49 + 8 * v29);
    ++v26;
    if (!v30)
    {
      int64_t v26 = v29 + 1;
      if (v29 + 1 >= v50) {
        return swift_release();
      }
      unint64_t v30 = *(void *)(v49 + 8 * v26);
      if (!v30)
      {
        int64_t v26 = v29 + 2;
        if (v29 + 2 >= v50) {
          return swift_release();
        }
        unint64_t v30 = *(void *)(v49 + 8 * v26);
        if (!v30) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v22 = (v30 - 1) & v30;
    unint64_t v28 = __clz(__rbit64(v30)) + (v26 << 6);
LABEL_21:
    uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v32(v18, *(void *)(v54 + 48) + *(void *)(v5 + 72) * v28, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v18, v4);
    uint64_t v33 = sub_1AD9DC930();
    if ((v34 & 1) != 0 || v33 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t result = (*v52)(v14, v4);
    }
    else
    {
      uint64_t v35 = v47;
      v32(v47, (unint64_t)v14, v4);
      int64_t v51 = v26;
      uint64_t v36 = v4;
      uint64_t v37 = v14;
      uint64_t v38 = v24;
      uint64_t v39 = v5;
      uint64_t v40 = v18;
      uint64_t v41 = v23;
      uint64_t v42 = v46;
      sub_1AD9A3570(v46, v35);
      uint64_t v43 = *v52;
      uint64_t v44 = v42;
      uint64_t v23 = v41;
      int64_t v18 = v40;
      uint64_t v5 = v39;
      uint64_t v24 = v38;
      uint64_t v14 = v37;
      uint64_t v4 = v36;
      int64_t v26 = v51;
      (*v52)((char *)v44, v4);
      uint64_t result = v43(v14, v4);
    }
  }
  int64_t v31 = v29 + 3;
  if (v31 >= v50) {
    return swift_release();
  }
  unint64_t v30 = *(void *)(v49 + 8 * v31);
  if (v30)
  {
    int64_t v26 = v31;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v26 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v26 >= v50) {
      return swift_release();
    }
    unint64_t v30 = *(void *)(v49 + 8 * v26);
    ++v31;
    if (v30) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t DateComponents.enumerate(components:block:)(uint64_t a1, void (*a2)(char *, uint64_t, void), uint64_t a3)
{
  uint64_t v31 = a3;
  unint64_t v30 = a2;
  uint64_t v4 = sub_1AD9DCE20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v27 = a1 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v5 + 16;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v18 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v20 = v19 | (v18 << 6);
      goto LABEL_5;
    }
    int64_t v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v24 >= v28) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v27 + 8 * v24);
    ++v18;
    if (!v25)
    {
      int64_t v18 = v24 + 1;
      if (v24 + 1 >= v28) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v27 + 8 * v18);
      if (!v25)
      {
        int64_t v18 = v24 + 2;
        if (v24 + 2 >= v28) {
          return swift_release();
        }
        unint64_t v25 = *(void *)(v27 + 8 * v18);
        if (!v25) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v16 = (v25 - 1) & v25;
    unint64_t v20 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v12, *(void *)(a1 + 48) + *(void *)(v5 + 72) * v20, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v12, v4);
    uint64_t v21 = sub_1AD9DC930();
    if ((v22 & 1) == 0 && v21 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = v21;
    }
    v30(v8, v23, v22 & 1 | (v21 == 0x7FFFFFFFFFFFFFFFLL));
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  int64_t v26 = v24 + 3;
  if (v26 >= v28) {
    return swift_release();
  }
  unint64_t v25 = *(void *)(v27 + 8 * v26);
  if (v25)
  {
    int64_t v18 = v26;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v18 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v18 >= v28) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v27 + 8 * v18);
    ++v26;
    if (v25) {
      goto LABEL_23;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1AD9A3250()
{
  uint64_t v0 = sub_1AD9DC8F0();
  if (v1) {
    return 0;
  }
  uint64_t v2 = v0;
  sub_1AD9DC940();
  if (v3) {
    return 0;
  }
  return v2;
}

uint64_t sub_1AD9A32A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1AD9E03A0();
  swift_bridgeObjectRetain();
  sub_1AD9DF760();
  uint64_t v8 = sub_1AD9E03E0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1AD9E02D0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      int64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1AD9E02D0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1AD9A4210(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1AD9A3450(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1AD9E03A0();
  sub_1AD9E03B0();
  uint64_t v6 = sub_1AD9E03E0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_1AD9A43AC(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1AD9A3570(uint64_t a1, char *a2)
{
  char v3 = v2;
  uint64_t v6 = sub_1AD9DCE20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_1AD9A59F0(&qword_1E9A4C170, MEMORY[0x1E4F27C88]);
  swift_bridgeObjectRetain();
  char v34 = a2;
  uint64_t v12 = sub_1AD9DF640();
  uint64_t v13 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v14 = v12 & ~v13;
  uint64_t v33 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
  {
    uint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v13;
    uint64_t v28 = v7;
    uint64_t v17 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v16 = v7 + 16;
    uint64_t v15 = v17;
    uint64_t v32 = *(void *)(v16 + 56);
    int64_t v18 = (void (**)(char *, uint64_t))(v16 - 8);
    v27[1] = v16 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v19 = v11;
      unint64_t v20 = v32 * v14;
      uint64_t v21 = v15;
      v15(v10, *(void *)(v11 + 48) + v32 * v14, v6);
      sub_1AD9A59F0(&qword_1E9A4C178, MEMORY[0x1E4F27C88]);
      char v22 = sub_1AD9DF6C0();
      uint64_t v23 = *v18;
      (*v18)(v10, v6);
      if (v22) {
        break;
      }
      unint64_t v14 = (v14 + 1) & v31;
      uint64_t v11 = v19;
      uint64_t v15 = v21;
      if (((*(void *)(v33 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        char v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v20, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v25 = v34;
    v15(v10, v34, v6);
    uint64_t v35 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_1AD9A44FC((uint64_t)v10, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1AD9A3894()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1AD9A5A38();
  uint64_t v3 = sub_1AD9E0000();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                char v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1AD9E03A0();
      sub_1AD9DF760();
      uint64_t result = sub_1AD9E03E0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1AD9A3B70()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1AD9A595C();
  uint64_t result = sub_1AD9E0000();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v26;
                }
                char v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_1AD9E03A0();
      sub_1AD9E03B0();
      uint64_t result = sub_1AD9E03E0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1AD9A3E18()
{
  char v1 = v0;
  uint64_t v43 = sub_1AD9DCE20();
  uint64_t v2 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43, v3);
  uint64_t v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_1AD924514();
  uint64_t v6 = sub_1AD9E0000();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v38 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    uint64_t v36 = v0;
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v40 = v2;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    uint64_t v39 = v7;
    int64_t v15 = v42;
    uint64_t v16 = v43;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v41 = v14;
        unint64_t v19 = v18 | (v14 << 6);
      }
      else
      {
        int64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v20 >= v37) {
          goto LABEL_33;
        }
        unint64_t v21 = v38[v20];
        int64_t v22 = v14 + 1;
        if (!v21)
        {
          int64_t v22 = v14 + 2;
          if (v14 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v21 = v38[v22];
          if (!v21)
          {
            int64_t v22 = v14 + 3;
            if (v14 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v21 = v38[v22];
            if (!v21)
            {
              uint64_t v23 = v14 + 4;
              if (v14 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                char v1 = v36;
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 > 63) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v21 = v38[v23];
              if (!v21)
              {
                while (1)
                {
                  int64_t v22 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_39;
                  }
                  if (v22 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v21 = v38[v22];
                  ++v23;
                  if (v21) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v22 = v14 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v21 - 1) & v21;
        int64_t v41 = v22;
        unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 48);
      uint64_t v26 = *(void *)(v40 + 72);
      BOOL v27 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
      v27(v15, v25 + v26 * v19, v16);
      uint64_t v7 = v39;
      sub_1AD9A59F0(&qword_1E9A4C170, MEMORY[0x1E4F27C88]);
      uint64_t result = sub_1AD9DF640();
      uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v12 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v12 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(*(void *)(v7 + 48) + v17 * v26, v42, v43);
      ++*(void *)(v7 + 16);
      uint64_t v5 = v24;
      int64_t v14 = v41;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v7;
  return result;
}

uint64_t sub_1AD9A4210(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1AD9A3894();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1AD9A479C();
      goto LABEL_22;
    }
    sub_1AD9A4D88();
  }
  uint64_t v11 = *v4;
  sub_1AD9E03A0();
  sub_1AD9DF760();
  uint64_t result = sub_1AD9E03E0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1AD9E02D0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1AD9E0300();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1AD9E02D0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_1AD9A43AC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1AD9A3B70();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_1AD9A494C();
      goto LABEL_14;
    }
    sub_1AD9A5034();
  }
  uint64_t v8 = *v3;
  sub_1AD9E03A0();
  sub_1AD9E03B0();
  uint64_t result = sub_1AD9E03E0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for HKCategoryValueSleepAnalysis(0);
      uint64_t result = sub_1AD9E0300();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_1AD9A44FC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v33 = a1;
  uint64_t v6 = sub_1AD9DCE20();
  uint64_t v7 = *(void *)(v6 - 8);
  v9.n128_f64[0] = MEMORY[0x1F4188790](v6, v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v3 + 16);
  unint64_t v13 = *(void *)(*v3 + 24);
  unint64_t v30 = v3;
  uint64_t v31 = v7;
  if (v13 > v12 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1AD9A3E18();
  }
  else
  {
    if (v13 > v12)
    {
      sub_1AD9A4AE0();
      goto LABEL_12;
    }
    sub_1AD9A52AC();
  }
  uint64_t v14 = *v3;
  sub_1AD9A59F0(&qword_1E9A4C170, MEMORY[0x1E4F27C88]);
  uint64_t v15 = sub_1AD9DF640();
  uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
  a2 = v15 & ~v16;
  uint64_t v32 = v14;
  uint64_t v17 = v14 + 56;
  if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v18 = ~v16;
    unint64_t v21 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v20 = v7 + 16;
    unint64_t v19 = v21;
    uint64_t v22 = *(void *)(v20 + 56);
    do
    {
      v19(v11, *(void *)(v32 + 48) + v22 * a2, v6);
      sub_1AD9A59F0(&qword_1E9A4C178, MEMORY[0x1E4F27C88]);
      char v23 = sub_1AD9DF6C0();
      (*(void (**)(char *, uint64_t))(v20 - 8))(v11, v6);
      if (v23) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v18;
    }
    while (((*(void *)(v17 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v24 = v31;
  uint64_t v25 = *v30;
  *(void *)(v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __n128))(v24 + 32))(*(void *)(v25 + 48) + *(void *)(v24 + 72) * a2, v33, v6, v9);
  uint64_t v27 = *(void *)(v25 + 16);
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (!v28)
  {
    *(void *)(v25 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1AD9E0300();
  __break(1u);
  return result;
}

void *sub_1AD9A479C()
{
  char v1 = v0;
  sub_1AD9A5A38();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1AD9DFFF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1AD9A494C()
{
  char v1 = v0;
  sub_1AD9A595C();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1AD9DFFF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1AD9A4AE0()
{
  char v1 = v0;
  uint64_t v2 = sub_1AD9DCE20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD924514();
  uint64_t v7 = *v0;
  uint64_t v8 = sub_1AD9DFFF0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v9;
    return result;
  }
  uint64_t result = (void *)(v8 + 56);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v7 + 56);
  if (v9 != v7 || (unint64_t)result >= v7 + 56 + 8 * v11) {
    uint64_t result = memmove(result, v25, 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 56);
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v20 >= v26) {
      goto LABEL_28;
    }
    unint64_t v21 = *((void *)v25 + v20);
    ++v13;
    if (!v21)
    {
      int64_t v13 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v21 = *((void *)v25 + v13);
      if (!v21)
      {
        int64_t v13 = v20 + 2;
        if (v20 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v21 = *((void *)v25 + v13);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v16 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(void *)(v7 + 48) + v19, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v9 + 48) + v19, v6, v2);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v26)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    char v1 = v24;
    goto LABEL_30;
  }
  unint64_t v21 = *((void *)v25 + v22);
  if (v21)
  {
    int64_t v13 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_28;
    }
    unint64_t v21 = *((void *)v25 + v13);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1AD9A4D88()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1AD9A5A38();
  uint64_t v3 = sub_1AD9E0000();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1AD9E03A0();
    swift_bridgeObjectRetain();
    sub_1AD9DF760();
    uint64_t result = sub_1AD9E03E0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    char v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1AD9A5034()
{
  char v1 = v0;
  uint64_t v2 = *v0;
  sub_1AD9A595C();
  uint64_t result = sub_1AD9E0000();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_1AD9E03A0();
    sub_1AD9E03B0();
    uint64_t result = sub_1AD9E03E0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    char v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1AD9A52AC()
{
  char v1 = v0;
  uint64_t v2 = sub_1AD9DCE20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v0;
  sub_1AD924514();
  uint64_t v8 = sub_1AD9E0000();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v9;
    return result;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 56);
  uint64_t v35 = v0;
  uint64_t v36 = v7 + 56;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  int64_t v37 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v38 = v3 + 16;
  uint64_t v14 = v8 + 56;
  uint64_t v39 = v3;
  int64_t v15 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v36 + 8 * v17);
      if (!v22)
      {
        int64_t v17 = v21 + 2;
        if (v21 + 2 >= v37) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v36 + 8 * v17);
        if (!v22) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    uint64_t v24 = v7;
    uint64_t v25 = *(void *)(v7 + 48);
    uint64_t v26 = *(void *)(v39 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v39 + 16))(v6, v25 + v26 * v20, v2);
    sub_1AD9A59F0(&qword_1E9A4C170, MEMORY[0x1E4F27C88]);
    uint64_t result = sub_1AD9DF640();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v14 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = (*v15)(*(void *)(v9 + 48) + v18 * v26, v6, v2);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v24;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    char v1 = v35;
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22)
  {
    int64_t v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v17 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v17);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0()
{
  sub_1AD9A58C4(0, &qword_1E9A4C140, MEMORY[0x1E4F27C88], MEMORY[0x1E4FBBE00]);
  uint64_t v0 = sub_1AD9DCE20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9EDDE0;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E4F27C00], v0);
  v6(v5 + v2, *MEMORY[0x1E4F27C20], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E4F27C30], v0);
  v6(v5 + 3 * v2, *MEMORY[0x1E4F27BF0], v0);
  v6(v5 + 4 * v2, *MEMORY[0x1E4F27C10], v0);
  v6(v5 + 5 * v2, *MEMORY[0x1E4F27C48], v0);
  v6(v5 + 6 * v2, *MEMORY[0x1E4F27C50], v0);
  v6(v5 + 7 * v2, *MEMORY[0x1E4F27C78], v0);
  v6(v5 + 8 * v2, *MEMORY[0x1E4F27C80], v0);
  uint64_t v7 = sub_1AD922F84(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

void sub_1AD9A58C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t dispatch thunk of HourAndMinuteProviding.hourAndMinute.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1AD9A595C()
{
  if (!qword_1E9A4D730)
  {
    type metadata accessor for HKCategoryValueSleepAnalysis(255);
    sub_1AD9A59F0(&qword_1E9A4C128, type metadata accessor for HKCategoryValueSleepAnalysis);
    unint64_t v0 = sub_1AD9E0020();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D730);
    }
  }
}

uint64_t sub_1AD9A59F0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1AD9A5A38()
{
  if (!qword_1E9A4D738)
  {
    unint64_t v0 = sub_1AD9E0020();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D738);
    }
  }
}

id LocationModel.__allocating_init(debugIdentifier:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return LocationModel.init(debugIdentifier:)(a1, a2);
}

uint64_t sub_1AD9A5ADC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AD9DDBC0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AD9A5B50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_1AD9DDBD0();
}

void (*sub_1AD9A5BBC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AD9DDBB0();
  return sub_1AD867F38;
}

uint64_t sub_1AD9A5C48()
{
  return swift_endAccess();
}

uint64_t sub_1AD9A5CDC(uint64_t a1)
{
  sub_1AD9A640C(0, &qword_1E9A4D760, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC60]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = MEMORY[0x1F4188790](v8, v9);
  uint64_t v12 = (char *)&v15 - v11;
  unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, double))(v4 + 16);
  v13((char *)&v15 - v11, a1, v3, v10);
  ((void (*)(char *, char *, uint64_t))v13)(v7, v12, v3);
  swift_beginAccess();
  sub_1AD9A640C(0, &qword_1E9A4A938, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC70]);
  sub_1AD9DDBA0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v12, v3);
}

uint64_t sub_1AD9A5EA8()
{
  return swift_endAccess();
}

uint64_t sub_1AD9A5F38(uint64_t a1)
{
  sub_1AD9A640C(0, &qword_1E9A4D760, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC60]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  double v6 = MEMORY[0x1F4188790](v2, v5);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v4 + 16))((char *)&v9 - v7, a1, v3, v6);
  swift_beginAccess();
  sub_1AD9A640C(0, &qword_1E9A4A938, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC70]);
  sub_1AD9DDBA0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
}

void (*sub_1AD9A60AC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  sub_1AD9A640C(0, &qword_1E9A4D760, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC60]);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel__currentLocation;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  sub_1AD9A640C(0, &qword_1E9A4A938, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC70]);
  v3[16] = v9;
  sub_1AD9DDB90();
  swift_endAccess();
  return sub_1AD868574;
}

id LocationModel.init(debugIdentifier:)(uint64_t a1, uint64_t a2)
{
  sub_1AD9A640C(0, &qword_1E9A4A938, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC70]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v8);
  double v10 = (char *)&v16 - v9;
  *(void *)&v2[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager] = 0;
  uint64_t v11 = &v2[OBJC_IVAR____TtC13SleepHealthUI13LocationModel__currentLocation];
  uint64_t v18 = 0;
  sub_1AD9A63A4();
  uint64_t v12 = v2;
  sub_1AD9DDB80();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v10, v6);
  *(void *)&v12[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion] = 0;
  v12[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization] = 0;
  unint64_t v13 = &v12[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_debugIdentifier];
  *(void *)unint64_t v13 = a1;
  *((void *)v13 + 1) = a2;

  uint64_t v14 = (objc_class *)type metadata accessor for LocationModel();
  v17.receiver = v12;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, sel_init);
}

void sub_1AD9A63A4()
{
  if (!qword_1E9A4D750)
  {
    sub_1AD837214(255, &qword_1E9A4A918);
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D750);
    }
  }
}

void sub_1AD9A640C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t type metadata accessor for LocationModel()
{
  uint64_t result = qword_1E9A4D790;
  if (!qword_1E9A4D790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1AD9A64BC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager;
  if (!*(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager])
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1AD9DD550();
    __swift_project_value_buffer(v3, (uint64_t)qword_1E9A4D288);
    uint64_t v4 = v0;
    uint64_t v5 = sub_1AD9DD530();
    os_log_type_t v6 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v24 = v21;
      *(_DWORD *)uint64_t v7 = 136446210;
      uint64_t v22 = sub_1AD9E04F0();
      unint64_t v23 = v8;
      sub_1AD9DF790();
      swift_bridgeObjectRetain();
      sub_1AD9DF790();
      swift_bridgeObjectRelease();
      sub_1AD838978(v22, v23, &v24);
      sub_1AD9DFEA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v5, v6, "[%{public}s] starting", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v21, -1, -1);
      MEMORY[0x1B3E6D1A0](v7, -1, -1);
    }
    else
    {
    }
    sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
    uint64_t v9 = (void *)sub_1AD9DFCA0();
    id v10 = objc_allocWithZone(MEMORY[0x1E4F1E600]);
    uint64_t v11 = v4;
    uint64_t v12 = (void *)sub_1AD9DF6D0();
    id v13 = objc_msgSend(v10, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v12, v11, v9);

    uint64_t v14 = *(void **)&v1[v2];
    *(void *)&v1[v2] = v13;

    uint64_t v15 = *(void **)&v1[v2];
    if (v15) {
      objc_msgSend(v15, sel_setDesiredAccuracy_, *MEMORY[0x1E4F1E6F8]);
    }
    uint64_t v16 = self;
    objc_super v17 = (void *)sub_1AD9DF6D0();
    uint64_t v18 = (void *)sub_1AD9DF6D0();
    id v19 = objc_msgSend(v16, sel_newAssertionForBundleIdentifier_withReason_, v17, v18);

    unint64_t v20 = *(void **)&v11[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion];
    *(void *)&v11[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion] = v19;
  }
}

void sub_1AD9A680C()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager;
  if (*(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager])
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1AD9DD550();
    __swift_project_value_buffer(v3, (uint64_t)qword_1E9A4D288);
    uint64_t v4 = v0;
    uint64_t v5 = sub_1AD9DD530();
    os_log_type_t v6 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v7 = 136446210;
      uint64_t v14 = sub_1AD9E04F0();
      unint64_t v15 = v8;
      sub_1AD9DF790();
      swift_bridgeObjectRetain();
      sub_1AD9DF790();
      swift_bridgeObjectRelease();
      sub_1AD838978(v14, v15, &v16);
      sub_1AD9DFEA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v5, v6, "[%{public}s] stopping", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v13, -1, -1);
      MEMORY[0x1B3E6D1A0](v7, -1, -1);
    }
    else
    {
    }
    uint64_t v9 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion;
    id v10 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion];
    if (v10)
    {
      objc_msgSend(v10, sel_invalidate);
      uint64_t v11 = *(void **)&v4[v9];
    }
    else
    {
      uint64_t v11 = 0;
    }
    *(void *)&v4[v9] = 0;

    uint64_t v12 = *(void **)&v1[v2];
    *(void *)&v1[v2] = 0;

    v4[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization] = 0;
  }
}

void sub_1AD9A6A6C()
{
  swift_getObjectType();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AD9DDBC0();
  swift_release();
  swift_release();

  if (v9)
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1AD9DD550();
    __swift_project_value_buffer(v1, (uint64_t)qword_1E9A4D288);
    id v2 = v0;
    uint64_t v3 = sub_1AD9DD530();
    os_log_type_t v4 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v12 = v6;
      *(_DWORD *)uint64_t v5 = 136446210;
      uint64_t v10 = sub_1AD9E04F0();
      unint64_t v11 = v7;
      sub_1AD9DF790();
      swift_bridgeObjectRetain();
      sub_1AD9DF790();
      swift_bridgeObjectRelease();
      sub_1AD838978(v10, v11, &v12);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1AD834000, v3, v4, "[%{public}s] resetting location", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v6, -1, -1);
      MEMORY[0x1B3E6D1A0](v5, -1, -1);
    }
    else
    {
    }
    swift_getKeyPath();
    swift_getKeyPath();
    unint64_t v8 = v2;
    sub_1AD9DDBD0();
    v8[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization] = 0;
  }
}

id LocationModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void LocationModel.init()()
{
}

id LocationModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AD9A6EA4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LocationModel();
  uint64_t result = sub_1AD9DDAB0();
  *a1 = result;
  return result;
}

void LocationModel.locationManager(_:didFailWithError:)(uint64_t a1, void *a2)
{
}

Swift::Void __swiftcall LocationModel.locationManager(_:didUpdateLocations:)(CLLocationManager _, Swift::OpaquePointer didUpdateLocations)
{
}

Swift::Void __swiftcall LocationModel.locationManagerDidChangeAuthorization(_:)(CLLocationManager a1)
{
  Class isa = a1.super.isa;
  swift_getObjectType();
  unsigned int v3 = [(objc_class *)isa authorizationStatus];
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AD9DD550();
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9A4D288);
  id v5 = v1;
  uint64_t v6 = sub_1AD9DD530();
  os_log_type_t v7 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v49 = v9;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v39 = sub_1AD9E04F0();
    unint64_t v44 = v10;
    sub_1AD9DF790();
    swift_bridgeObjectRetain();
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    sub_1AD838978(v39, v44, &v49);
    sub_1AD9DFEA0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    type metadata accessor for CLAuthorizationStatus(0);
    uint64_t v11 = sub_1AD9DF730();
    sub_1AD838978(v11, v12, &v49);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v6, v7, "[%{public}s] status: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v9, -1, -1);
    MEMORY[0x1B3E6D1A0](v8, -1, -1);
  }
  else
  {
  }
  if (v3 - 1 < 2)
  {
    id v19 = v5;
    unint64_t v20 = sub_1AD9DD530();
    os_log_type_t v21 = sub_1AD9DFBC0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v49 = v23;
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v41 = sub_1AD9E04F0();
      unint64_t v46 = v24;
      sub_1AD9DF790();
      swift_bridgeObjectRetain();
      sub_1AD9DF790();
      swift_bridgeObjectRelease();
      sub_1AD838978(v41, v46, &v49);
      sub_1AD9DFEA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v20, v21, "[%{public}s] doesn't have location permissions", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v23, -1, -1);
      MEMORY[0x1B3E6D1A0](v22, -1, -1);
    }
    else
    {
    }
  }
  else if (v3 - 3 >= 2)
  {
    if (!v3)
    {
      id v25 = v5;
      uint64_t v26 = sub_1AD9DD530();
      os_log_type_t v27 = sub_1AD9DFBE0();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t v49 = v29;
        *(_DWORD *)uint64_t v28 = 136446466;
        uint64_t v42 = sub_1AD9E04F0();
        unint64_t v47 = v30;
        sub_1AD9DF790();
        swift_bridgeObjectRetain();
        sub_1AD9DF790();
        swift_bridgeObjectRelease();
        sub_1AD838978(v42, v47, &v49);
        sub_1AD9DFEA0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 1024;

        sub_1AD9DFEA0();
        _os_log_impl(&dword_1AD834000, v26, v27, "[%{public}s] has requested authorization? %{BOOL}d", (uint8_t *)v28, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x1B3E6D1A0](v29, -1, -1);
        MEMORY[0x1B3E6D1A0](v28, -1, -1);
      }
      else
      {
      }
      uint64_t v31 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization;
      if ((*((unsigned char *)v25 + OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization) & 1) == 0)
      {
        BOOL v32 = (char *)v25;
        uint64_t v33 = sub_1AD9DD530();
        os_log_type_t v34 = sub_1AD9DFBE0();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = (uint8_t *)swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          uint64_t v49 = v38;
          *(_DWORD *)uint64_t v35 = 136446210;
          int64_t v37 = v35 + 4;
          uint64_t v43 = sub_1AD9E04F0();
          unint64_t v48 = v36;
          sub_1AD9DF790();
          swift_bridgeObjectRetain();
          sub_1AD9DF790();
          swift_bridgeObjectRelease();
          sub_1AD838978(v43, v48, &v49);
          sub_1AD9DFEA0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1AD834000, v33, v34, "[%{public}s] requesting when in use authorization...", v35, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1B3E6D1A0](v38, -1, -1);
          MEMORY[0x1B3E6D1A0](v35, -1, -1);
        }
        else
        {
        }
        objc_msgSend(*(id *)&v32[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager], sel_requestWhenInUseAuthorization, v37);
        *((unsigned char *)v25 + v31) = 1;
      }
    }
  }
  else
  {
    uint64_t v13 = (char *)v5;
    uint64_t v14 = sub_1AD9DD530();
    os_log_type_t v15 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v49 = v17;
      *(_DWORD *)uint64_t v16 = 136446210;
      uint64_t v40 = sub_1AD9E04F0();
      unint64_t v45 = v18;
      sub_1AD9DF790();
      swift_bridgeObjectRetain();
      sub_1AD9DF790();
      swift_bridgeObjectRelease();
      sub_1AD838978(v40, v45, &v49);
      sub_1AD9DFEA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v14, v15, "[%{public}s] requesting location once...", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v17, -1, -1);
      MEMORY[0x1B3E6D1A0](v16, -1, -1);
    }
    else
    {
    }
    objc_msgSend(*(id *)&v13[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager], sel_requestLocation);
  }
}

uint64_t CLLocation.fetchSolarColors(completion:)(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = v2;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v4 = sub_1AD9DF3D0();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v5);
  os_log_type_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1AD9DF400();
  uint64_t v8 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27, v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1AD9DF3E0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x1E4FBCB28], v12);
  uint64_t v17 = (void *)sub_1AD9DFCC0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  unint64_t v18 = (void *)swift_allocObject();
  uint64_t v19 = v25;
  uint64_t v20 = v26;
  long long v18[2] = v3;
  v18[3] = v19;
  v18[4] = v20;
  aBlock[4] = sub_1AD9A8B20;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD8D34D8;
  aBlock[3] = &block_descriptor_35;
  os_log_type_t v21 = _Block_copy(aBlock);
  id v22 = v3;
  swift_retain();
  sub_1AD9DF3F0();
  uint64_t v29 = MEMORY[0x1E4FBC860];
  sub_1AD8CCE74();
  sub_1AD9A640C(0, &qword_1E9A4C330, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1AD8CCECC();
  sub_1AD9DFF40();
  MEMORY[0x1B3E6BC50](0, v11, v7, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v27);
  return swift_release();
}

uint64_t sub_1AD9A7CA8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a2;
  uint64_t v5 = sub_1AD9DF3D0();
  uint64_t v39 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1AD9DF400();
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1AD9DD1F0();
  uint64_t v35 = *(void *)(v13 - 8);
  uint64_t v36 = v13;
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1AD9DCC70();
  uint64_t v34 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17, v19);
  os_log_type_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22, v23);
  uint64_t v25 = (char *)&v32 - v24;
  sub_1AD9DCC60();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v25, v17);
  id v26 = a1;
  sub_1AD9DD1D0();
  uint64_t v27 = sub_1AD9DD1E0();
  sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
  uint64_t v28 = (void *)sub_1AD9DFCA0();
  uint64_t v29 = (void *)swift_allocObject();
  void v29[2] = v33;
  v29[3] = a3;
  v29[4] = v27;
  aBlock[4] = sub_1AD9A8F2C;
  aBlock[5] = v29;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD8D34D8;
  aBlock[3] = &block_descriptor_30_0;
  unint64_t v30 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1AD9DF3F0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1AD8CCE74();
  sub_1AD9A640C(0, &qword_1E9A4C330, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1AD8CCECC();
  sub_1AD9DFF40();
  MEMORY[0x1B3E6BC50](0, v12, v8, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v38);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v25, v34);
}

void CLLocation.fetchCity(completion:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E5C8]), sel_init);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v8[4] = sub_1AD9A8B7C;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1AD9A8354;
  v8[3] = &block_descriptor_8_0;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_reverseGeocodeLocation_completionHandler_, v2, v7);
  _Block_release(v7);
}

uint64_t sub_1AD9A8208(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  if (!a1) {
    return a3(0, 0, a2);
  }
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_4;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1AD9E0190();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_12;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x1B3E6BFF0](0, a1);
  }
  else
  {
    if (!*(void *)(v5 + 16))
    {
      __break(1u);
      return result;
    }
    id v8 = *(id *)(a1 + 32);
  }
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v9, sel_locality);

  if (!v10)
  {
    uint64_t v6 = 0;
LABEL_13:
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = sub_1AD9DF710();
  uint64_t v12 = v11;

LABEL_14:
  a3(v6, v12, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD9A8354(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1AD837214(0, &qword_1E9A4D808);
    uint64_t v4 = sub_1AD9DF860();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

double static LinearGradient.fullScreenGradient(from:)@<D0>(uint64_t a1@<X8>)
{
  sub_1AD9DF390();
  sub_1AD9DF3A0();
  uint64_t v2 = swift_bridgeObjectRetain();
  MEMORY[0x1B3E6B280](v2);
  sub_1AD9DDF00();
  double result = *(double *)&v4;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = v6;
  return result;
}

void sub_1AD9A8484(void *a1)
{
  swift_getObjectType();
  if (qword_1E9A49060 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1AD9DD550();
  __swift_project_value_buffer(v3, (uint64_t)qword_1E9A4D288);
  id v4 = v1;
  id v5 = a1;
  id v6 = v4;
  id v7 = a1;
  oslog = sub_1AD9DD530();
  os_log_type_t v8 = sub_1AD9DFBC0();
  if (os_log_type_enabled(oslog, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v10;
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v16 = sub_1AD9E04F0();
    unint64_t v17 = v11;
    sub_1AD9DF790();
    swift_bridgeObjectRetain();
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    sub_1AD838978(v16, v17, &v18);
    sub_1AD9DFEA0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    id v12 = a1;
    sub_1AD869CF0();
    uint64_t v13 = sub_1AD9DF730();
    sub_1AD838978(v13, v14, &v18);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1AD834000, oslog, v8, "[%{public}s] error fetching current location: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v10, -1, -1);
    MEMORY[0x1B3E6D1A0](v9, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_1AD9A8740(unint64_t a1)
{
  swift_getObjectType();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (char *)sub_1AD9E0190();
    if (v3)
    {
LABEL_3:
      id v4 = v3 - 1;
      if (__OFSUB__(v3, 1))
      {
        __break(1u);
      }
      else if ((a1 & 0xC000000000000001) == 0)
      {
        if (((unint64_t)v4 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if ((unint64_t)v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v5 = (char *)*(id *)(a1 + 8 * (void)v4 + 32);
          goto LABEL_8;
        }
        __break(1u);
        goto LABEL_21;
      }
      id v5 = (char *)MEMORY[0x1B3E6BFF0](v4, a1);
LABEL_8:
      uint64_t v3 = v5;
      swift_bridgeObjectRelease();
      if (qword_1E9A49060 == -1)
      {
LABEL_9:
        uint64_t v6 = sub_1AD9DD550();
        __swift_project_value_buffer(v6, (uint64_t)qword_1E9A4D288);
        id v7 = v1;
        os_log_type_t v8 = v3;
        id v9 = v7;
        uint64_t v10 = v8;
        unint64_t v11 = sub_1AD9DD530();
        os_log_type_t v12 = sub_1AD9DFBE0();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = swift_slowAlloc();
          uint64_t v22 = swift_slowAlloc();
          uint64_t v25 = v22;
          *(_DWORD *)uint64_t v13 = 136446467;
          uint64_t v23 = sub_1AD9E04F0();
          unint64_t v24 = v14;
          sub_1AD9DF790();
          swift_bridgeObjectRetain();
          sub_1AD9DF790();
          swift_bridgeObjectRelease();
          sub_1AD838978(v23, v24, &v25);
          sub_1AD9DFEA0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v13 + 12) = 2081;
          uint64_t v15 = v10;
          id v16 = objc_msgSend(v15, sel_description);
          uint64_t v17 = sub_1AD9DF710();
          unint64_t v19 = v18;

          sub_1AD838978(v17, v19, &v25);
          sub_1AD9DFEA0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1AD834000, v11, v12, "[%{public}s] fetched current location: %{private}s", (uint8_t *)v13, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1B3E6D1A0](v22, -1, -1);
          MEMORY[0x1B3E6D1A0](v13, -1, -1);
        }
        else
        {
        }
        swift_getKeyPath();
        swift_getKeyPath();
        id v20 = v9;
        return sub_1AD9DDBD0();
      }
LABEL_21:
      swift_once();
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD9A8AE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9A8B20()
{
  return sub_1AD9A7CA8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_35(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_35()
{
  return swift_release();
}

uint64_t sub_1AD9A8B44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9A8B7C(unint64_t a1, uint64_t a2)
{
  return sub_1AD9A8208(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_1AD9A8B94()
{
  return type metadata accessor for LocationModel();
}

void sub_1AD9A8B9C()
{
  sub_1AD9A640C(319, &qword_1E9A4A938, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC70]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LocationModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LocationModel);
}

uint64_t dispatch thunk of LocationModel.currentLocation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LocationModel.currentLocation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LocationModel.currentLocation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of LocationModel.$currentLocation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of LocationModel.$currentLocation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of LocationModel.$currentLocation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of LocationModel.__allocating_init(debugIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of LocationModel.startIfNeeded()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of LocationModel.stopIfNeeded()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of LocationModel.resetLocationIfNeeded()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

unint64_t sub_1AD9A8E98()
{
  unint64_t result = qword_1E9A4D800;
  if (!qword_1E9A4D800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D800);
  }
  return result;
}

uint64_t sub_1AD9A8EEC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD9A8F2C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

id sub_1AD9A8F6C()
{
  id result = objc_msgSend(self, sel_currentDevice);
  if (result)
  {
    id v1 = result;
    sub_1AD9A905C();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AD9E53A0;
    *(void *)(inited + 32) = 5;
    *(void *)(inited + 40) = 0x4036000000000000;
    *(void *)(inited + 48) = 6;
    *(void *)(inited + 56) = 0x4036000000000000;
    *(void *)(inited + 64) = 8;
    *(void *)(inited + 72) = 0x4036000000000000;
    sub_1AD866410(inited);
    swift_setDeallocating();
    sub_1AD9DFE70();
    uint64_t v4 = v3;

    id result = (id)swift_bridgeObjectRelease();
    qword_1E9A5AAA0 = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD9A903C()
{
  uint64_t result = sub_1AD9DEE70();
  qword_1E9A5AAA8 = result;
  return result;
}

void sub_1AD9A905C()
{
  if (!qword_1E9A4D820)
  {
    sub_1AD9A90B4();
    unint64_t v0 = sub_1AD9E0290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D820);
    }
  }
}

void sub_1AD9A90B4()
{
  if (!qword_1E9A4D828)
  {
    type metadata accessor for CLKDeviceSizeClass(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A4D828);
    }
  }
}

char *sub_1AD9A911C(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_1AD9A9150(a1);
}

char *sub_1AD9A9150(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB727930;
  id v5 = (void *)sub_1AD9DF6D0();
  id v6 = objc_msgSend(self, sel_imageNamed_inBundle_, v5, v4);

  type metadata accessor for ConfirmationOnboardingSection();
  swift_allocObject();
  uint64_t v7 = swift_retain();
  uint64_t v8 = sub_1AD87F9CC(v7);
  if (qword_1E9A49108 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1E9A4D830;
  uint64_t v10 = *(void *)algn_1E9A4D838;
  unint64_t v11 = (void *)qword_1EB727930;
  swift_bridgeObjectRetain();
  id v12 = v11;
  uint64_t v13 = sub_1AD9DCA70();
  uint64_t v15 = v14;

  id v16 = self;
  swift_retain();
  uint64_t v17 = sub_1AD9B8B88(v9, v10, v13, v15, a1, 0, v8, v6, 2, 0, objc_msgSend(v16, sel_systemBackgroundColor, 0xE000000000000000), v2);
  swift_release();
  return v17;
}

void sub_1AD9A936C()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for SleepOnboardingConfirmationViewController();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_tableView);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = v1;
  objc_msgSend(v1, sel_setAllowsSelection_, 0);

  id v3 = objc_msgSend(v0, sel_tableView);
  if (!v3)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v4 = v3;
  objc_msgSend(v3, sel_setSeparatorInset_, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  uint64_t v5 = qword_1EB724E38;
  id v6 = v0;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  uint64_t v8 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
}

void sub_1AD9A9548()
{
  swift_getObjectType();
  id v1 = (void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate);
  swift_beginAccess();
  if (*v1)
  {
    uint64_t v2 = v1[1];
    uint64_t v3 = qword_1E9A49098;
    swift_unknownObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1AD9DD550();
    __swift_project_value_buffer(v4, (uint64_t)qword_1E9A4D300);
    uint64_t v5 = sub_1AD9DD530();
    os_log_type_t v6 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      v21[0] = v8;
      *(_DWORD *)id v7 = 136446210;
      uint64_t v9 = sub_1AD9E04F0();
      uint64_t v22 = sub_1AD838978(v9, v10, v21);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v5, v6, "[%{public}s] we're done!", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v8, -1, -1);
      MEMORY[0x1B3E6D1A0](v7, -1, -1);
    }

    sub_1AD95AB40(6, 2);
    uint64_t ObjectType = swift_getObjectType();
    swift_beginAccess();
    id v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    uint64_t v13 = swift_retain();
    v12(v13, ObjectType, v2);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    if (qword_1EB725658 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1AD9DD550();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EB725958);
    uint64_t v15 = sub_1AD9DD530();
    os_log_type_t v16 = sub_1AD9DFBD0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v21[0] = v18;
      *(_DWORD *)uint64_t v17 = 136446210;
      uint64_t v19 = sub_1AD9E04F0();
      uint64_t v22 = sub_1AD838978(v19, v20, v21);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v15, v16, "[%{public}s] No delegate found while attemping to complete onboarding", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v18, -1, -1);
      MEMORY[0x1B3E6D1A0](v17, -1, -1);
    }
  }
}

id sub_1AD9A9A00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepOnboardingConfirmationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SleepOnboardingConfirmationViewController()
{
  return self;
}

void sub_1AD9A9A58()
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EB727930;
  uint64_t v1 = sub_1AD9DCA70();
  uint64_t v3 = v2;

  qword_1E9A4D830 = v1;
  *(void *)algn_1E9A4D838 = v3;
}

uint64_t sub_1AD9A9B18()
{
  return swift_deallocObject();
}

void sub_1AD9A9B50()
{
}

uint64_t block_copy_helper_36(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_36()
{
  return swift_release();
}

void *HealthStatusFeatureProvider.__allocating_init(healthStore:)(void *a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B068]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x1E4F29DC8], a1);
  unint64_t v4 = sub_1AD8F1230();
  uint64_t v5 = MEMORY[0x1E4F66930];
  v2[5] = v4;
  v2[6] = v5;
  v2[2] = v3;
  sub_1AD9DD1C0();
  uint64_t v6 = sub_1AD9DD1B0();

  v2[7] = v6;
  return v2;
}

void *HealthStatusFeatureProvider.init(healthStore:)(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B068]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x1E4F29DC8], a1);
  unint64_t v5 = sub_1AD8F1230();
  uint64_t v6 = MEMORY[0x1E4F66930];
  v2[5] = v5;
  v2[6] = v6;
  v2[2] = v4;
  sub_1AD9DD1C0();
  uint64_t v7 = sub_1AD9DD1B0();

  v2[7] = v7;
  return v2;
}

id sub_1AD9A9CCC()
{
  uint64_t v1 = sub_1AD9DD4D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  unint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_1AD9DD4F0();
  uint64_t v6 = (void *)sub_1AD9DD4E0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  id v7 = objc_msgSend(v6, sel_areAllRequirementsSatisfied);

  return v7;
}

uint64_t sub_1AD9AA004()
{
  return sub_1AD9DD190() & 1;
}

uint64_t sub_1AD9AA02C()
{
  return sub_1AD9DD1A0();
}

uint64_t (*sub_1AD9AA054(uint64_t a1))()
{
  *(void *)a1 = *(void *)(v1 + 56);
  *(unsigned char *)(a1 + 8) = sub_1AD9DD190() & 1;
  return sub_1AD9AA0A4;
}

uint64_t sub_1AD9AA0A4()
{
  return sub_1AD9DD1A0();
}

uint64_t HealthStatusFeatureProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return v0;
}

uint64_t HealthStatusFeatureProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_1AD9AA134()
{
  return (unint64_t)sub_1AD9A9CCC() & 1;
}

uint64_t sub_1AD9AA15C()
{
  return sub_1AD9DD190() & 1;
}

uint64_t sub_1AD9AA188()
{
  return sub_1AD9DD1A0();
}

uint64_t (*sub_1AD9AA1B4(uint64_t a1))()
{
  *(void *)a1 = *(void *)(*(void *)v1 + 56);
  *(unsigned char *)(a1 + 8) = sub_1AD9DD190() & 1;
  return sub_1AD9AA0A4;
}

uint64_t sub_1AD9AA208@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AD9DD190();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1AD9AA23C()
{
  return sub_1AD9DD1A0();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.isHealthStatusSupported.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.healthStatusFeaturesEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.healthStatusFeaturesEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.healthStatusFeaturesEnabled.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t type metadata accessor for HealthStatusFeatureProvider()
{
  return self;
}

uint64_t method lookup function for HealthStatusFeatureProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HealthStatusFeatureProvider);
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.isHealthStatusSupported.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.healthStatusFeaturesEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.healthStatusFeaturesEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.healthStatusFeaturesEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

double static Double.defaultWindDown.getter()
{
  return *MEMORY[0x1E4FA5498] * 60.0;
}

double static Double.windDownMinutesStep.getter()
{
  return *MEMORY[0x1E4FA54B8] * 60.0;
}

double static Double.windDownMinutesMinimum.getter()
{
  return *MEMORY[0x1E4FA54A8] * 60.0;
}

double static Double.windDownMinutesMaximum.getter()
{
  return *MEMORY[0x1E4FA54A0] * 60.0;
}

uint64_t static Double.sleepDurationGoalOptions.getter()
{
  double v0 = *MEMORY[0x1E4FA53B0] * 60.0 * 60.0;
  if (v0 != 0.0) {
    return sub_1AD9AA804(*MEMORY[0x1E4FA53A8] * 60.0 * 60.0, *MEMORY[0x1E4FA53A0] * 60.0 * 60.0, v0);
  }
  __break(1u);
  return result;
}

void static Double.windDownOptions(for:duringOnboarding:)(void *a1, char a2)
{
  double v3 = *MEMORY[0x1E4FA54A8];
  double v4 = *MEMORY[0x1E4FA54B0];
  sub_1AD9AAB08(a1);
  double v6 = v5;
  double v7 = *MEMORY[0x1E4FA54B8] * 60.0;
  if (v7 == 0.0)
  {
    __break(1u);
  }
  else
  {
    if (a2) {
      double v8 = v4;
    }
    else {
      double v8 = v3;
    }
    double v9 = v8 * 60.0;
    sub_1AD9AA58C(v9, v6, v7);
  }
}

double static Double.defaultSleepDurationGoal.getter()
{
  return *MEMORY[0x1E4FA5398] * 60.0 * 60.0;
}

double static Double.windDownMinutesOnboardingMinimum.getter()
{
  return *MEMORY[0x1E4FA54B0] * 60.0;
}

double static Double.sleepDurationGoalMinimum.getter()
{
  return *MEMORY[0x1E4FA53A8] * 60.0 * 60.0;
}

double static Double.sleepDurationGoalMaximum.getter()
{
  return *MEMORY[0x1E4FA53A0] * 60.0 * 60.0;
}

double static Double.sleepDurationGoalStep.getter()
{
  return *MEMORY[0x1E4FA53B0] * 60.0 * 60.0;
}

void sub_1AD9AA58C(double a1, double a2, double a3)
{
  BOOL v6 = a1 <= a2;
  if (a3 > 0.0) {
    BOOL v6 = a1 >= a2;
  }
  if (!v6)
  {
    uint64_t v7 = -1;
    do
    {
      uint64_t v8 = ++v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_48;
      }
      double v9 = a1 + (double)v8 * a3;
      BOOL v10 = v9 <= a2;
      if (a3 > 0.0) {
        BOOL v10 = v9 >= a2;
      }
    }
    while (!v10);
    if (v8 <= 0) {
      goto LABEL_18;
    }
    sub_1AD9AAD18();
    unint64_t v11 = (double *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    uint64_t v14 = v13 >> 3;
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v14;
    uint64_t v15 = v11 + 4;
    uint64_t v16 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v8;
    uint64_t v17 = -1;
    double v18 = a1;
    while (1)
    {
      BOOL v19 = v18 <= a2;
      if (a3 > 0.0) {
        BOOL v19 = v18 >= a2;
      }
      if (v19) {
        goto LABEL_50;
      }
      double v20 = a1 + (double)(v17 + 2) * a3;
      *v15++ = v18;
      ++v17;
      double v18 = v20;
      if (v7 == v17) {
        goto LABEL_19;
      }
    }
  }
LABEL_18:
  uint64_t v8 = 0;
  unint64_t v11 = (double *)MEMORY[0x1E4FBC860];
  uint64_t v15 = (double *)(MEMORY[0x1E4FBC860] + 32);
  uint64_t v16 = *(void *)(MEMORY[0x1E4FBC860] + 24) >> 1;
  double v20 = a1;
LABEL_19:
  BOOL v21 = v20 <= a2;
  if (a3 > 0.0) {
    BOOL v21 = v20 >= a2;
  }
  if (!v21)
  {
    while (!__OFADD__(v8, 1))
    {
      if (!v16)
      {
        unint64_t v22 = *((void *)v11 + 3);
        if ((uint64_t)((v22 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_51;
        }
        int64_t v23 = v22 & 0xFFFFFFFFFFFFFFFELL;
        if (v23 <= 1) {
          uint64_t v24 = 1;
        }
        else {
          uint64_t v24 = v23;
        }
        sub_1AD9AAD18();
        uint64_t v25 = (double *)swift_allocObject();
        int64_t v26 = _swift_stdlib_malloc_size(v25);
        uint64_t v27 = v26 - 32;
        if (v26 < 32) {
          uint64_t v27 = v26 - 25;
        }
        uint64_t v28 = v27 >> 3;
        *((void *)v25 + 2) = v24;
        *((void *)v25 + 3) = 2 * (v27 >> 3);
        unint64_t v29 = (unint64_t)(v25 + 4);
        uint64_t v30 = *((void *)v11 + 3) >> 1;
        if (*((void *)v11 + 2))
        {
          if (v25 != v11 || v29 >= (unint64_t)&v11[v30 + 4]) {
            memmove(v25 + 4, v11 + 4, 8 * v30);
          }
          v11[2] = 0.0;
        }
        uint64_t v15 = (double *)(v29 + 8 * v30);
        uint64_t v16 = (v28 & 0x7FFFFFFFFFFFFFFFLL) - v30;
        swift_release();
        unint64_t v11 = v25;
      }
      BOOL v32 = __OFSUB__(v16--, 1);
      if (v32) {
        goto LABEL_49;
      }
      *v15++ = v20;
      double v20 = a1 + (double)(v8 + 1) * a3;
      BOOL v33 = v20 <= a2;
      if (a3 > 0.0) {
        BOOL v33 = v20 >= a2;
      }
      ++v8;
      if (v33) {
        goto LABEL_43;
      }
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
LABEL_43:
  unint64_t v34 = *((void *)v11 + 3);
  if (v34 >= 2)
  {
    unint64_t v35 = v34 >> 1;
    BOOL v32 = __OFSUB__(v35, v16);
    unint64_t v36 = v35 - v16;
    if (v32)
    {
LABEL_52:
      __break(1u);
      return;
    }
    *((void *)v11 + 2) = v36;
  }
}

uint64_t sub_1AD9AA804(double a1, double a2, double a3)
{
  uint64_t result = sub_1AD9AAA94(a1, a2, a3);
  uint64_t v7 = result;
  if (result > 0)
  {
    sub_1AD9AAD18();
    uint64_t v8 = (double *)swift_allocObject();
    uint64_t result = _swift_stdlib_malloc_size(v8);
    char v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = result - 32;
    if (result < 32) {
      uint64_t v11 = result - 25;
    }
    uint64_t v12 = v11 >> 3;
    *((void *)v8 + 2) = v7;
    *((void *)v8 + 3) = 2 * v12;
    uint64_t v13 = v8 + 4;
    uint64_t v14 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v7;
    double i = a1;
    while (v7)
    {
      double v17 = i;
      BOOL v18 = i <= a2;
      if (a3 > 0.0) {
        BOOL v18 = i >= a2;
      }
      if (v18)
      {
        if (v9 & 1 | (i != a2)) {
          goto LABEL_47;
        }
        char v9 = 1;
      }
      else
      {
        BOOL v16 = __OFADD__(v10++, 1);
        if (v16) {
          goto LABEL_46;
        }
        double i = a1 + (double)v10 * a3;
      }
      *v13++ = v17;
      if (!--v7) {
        goto LABEL_16;
      }
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (result < 0)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    return result;
  }
  char v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = (double *)MEMORY[0x1E4FBC860];
  uint64_t v14 = *(void *)(MEMORY[0x1E4FBC860] + 24) >> 1;
  uint64_t v13 = (double *)(MEMORY[0x1E4FBC860] + 32);
  for (double i = a1; ; double i = v20)
  {
LABEL_16:
    BOOL v19 = i <= a2;
    if (a3 > 0.0) {
      BOOL v19 = i >= a2;
    }
    if (!v19)
    {
      BOOL v16 = __OFADD__(v10++, 1);
      if (v16) {
        goto LABEL_43;
      }
      double v20 = a1 + (double)v10 * a3;
      if (v14) {
        goto LABEL_36;
      }
      goto LABEL_24;
    }
    if ((i != a2) | v9 & 1) {
      break;
    }
    char v9 = 1;
    double v20 = i;
    if (v14)
    {
      double v20 = i;
      goto LABEL_36;
    }
LABEL_24:
    unint64_t v21 = *((void *)v8 + 3);
    if ((uint64_t)((v21 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_44;
    }
    int64_t v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
    if (v22 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v22;
    }
    sub_1AD9AAD18();
    uint64_t v24 = (double *)swift_allocObject();
    int64_t v25 = _swift_stdlib_malloc_size(v24);
    uint64_t v26 = v25 - 32;
    if (v25 < 32) {
      uint64_t v26 = v25 - 25;
    }
    uint64_t v27 = v26 >> 3;
    *((void *)v24 + 2) = v23;
    *((void *)v24 + 3) = 2 * (v26 >> 3);
    unint64_t v28 = (unint64_t)(v24 + 4);
    uint64_t v29 = *((void *)v8 + 3) >> 1;
    if (*((void *)v8 + 2))
    {
      uint64_t v30 = v8 + 4;
      if (v24 != v8 || v28 >= (unint64_t)v30 + 8 * v29) {
        memmove(v24 + 4, v30, 8 * v29);
      }
      v8[2] = 0.0;
    }
    uint64_t v13 = (double *)(v28 + 8 * v29);
    uint64_t v14 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
    uint64_t result = swift_release();
    uint64_t v8 = v24;
LABEL_36:
    BOOL v16 = __OFSUB__(v14--, 1);
    if (v16)
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    *v13++ = i;
  }
  unint64_t v31 = *((void *)v8 + 3);
  if (v31 >= 2)
  {
    unint64_t v32 = v31 >> 1;
    BOOL v16 = __OFSUB__(v32, v14);
    unint64_t v33 = v32 - v14;
    if (v16) {
      goto LABEL_49;
    }
    *((void *)v8 + 2) = v33;
  }
  return (uint64_t)v8;
}

uint64_t sub_1AD9AAA94(double a1, double a2, double a3)
{
  uint64_t result = 0;
  char v4 = 0;
  uint64_t v5 = 0;
  double v6 = a1;
  do
  {
    BOOL v8 = v6 <= a2;
    if (a3 > 0.0) {
      BOOL v8 = v6 >= a2;
    }
    if (v8)
    {
      if ((v6 != a2) | v4 & 1) {
        return result;
      }
      char v4 = 1;
    }
    else
    {
      BOOL v7 = __OFADD__(v5++, 1);
      if (v7) {
        goto LABEL_12;
      }
      double v6 = a1 + (double)v5 * a3;
    }
    BOOL v7 = __OFADD__(result++, 1);
  }
  while (!v7);
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void sub_1AD9AAB08(void *a1)
{
  id v2 = objc_msgSend(a1, sel_occurrences);
  sub_1AD97F34C();
  unint64_t v3 = sub_1AD9DF860();

  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x1E4FBC860];
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1AD9E0190();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_15;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x1B3E6BFF0](i, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    BOOL v7 = v6;
    if (objc_msgSend(v6, sel_isSingleDayOverride))
    {
    }
    else
    {
      sub_1AD9E0080();
      sub_1AD9E00C0();
      sub_1AD9E00D0();
      sub_1AD9E0090();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = v10;
  if (v10 < 0) {
    goto LABEL_21;
  }
LABEL_16:
  if ((v8 & 0x4000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    goto LABEL_18;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1AD9E0190();
  swift_release();
LABEL_18:
  swift_release();
  if (v9) {
    objc_msgSend(a1, sel_maximumAllowableWindDown);
  }
}

void sub_1AD9AAD18()
{
  if (!qword_1EB725D48)
  {
    unint64_t v0 = sub_1AD9E0290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB725D48);
    }
  }
}

void ScheduledDaysState.init(schedule:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!objc_msgSend(a1, sel_weekdaysWithOccurrences))
  {
    uint64_t v4 = 1;
LABEL_6:
    char v5 = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(a1, sel_weekdaysWithoutOccurrences))
  {
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = (uint64_t)objc_msgSend(a1, sel_weekdaysWithOccurrences);
  char v5 = 0;
LABEL_7:

  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v5;
}

uint64_t ScheduledDaysState.localizedDetail.getter()
{
  if (*(unsigned char *)(v0 + 8) == 1 && !*(void *)v0) {
    return 0;
  }
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EB727930;
  uint64_t v2 = sub_1AD9DCA70();

  return v2;
}

uint64_t ScheduledDaysState.localizedPrompt.getter()
{
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    if (*(void *)v0)
    {
      if (qword_1EB724E38 != -1) {
        swift_once();
      }
    }
    else if (qword_1EB724E38 != -1)
    {
      swift_once();
    }
  }
  else if (qword_1EB724E38 != -1)
  {
    swift_once();
  }
  id v1 = (id)qword_1EB727930;
  uint64_t v2 = sub_1AD9DCA70();

  return v2;
}

uint64_t static ScheduledDaysState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 8);
  unsigned int v3 = (*(void *)a1 == *(void *)a2) & ~v2;
  if (*(void *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 8);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(void *)a2) {
    unsigned int v2 = 0;
  }
  if (*(void *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 8) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t sub_1AD9AB08C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 8);
  unsigned int v3 = (*(void *)a1 == *(void *)a2) & ~v2;
  if (*(void *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 8);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(void *)a2) {
    unsigned int v2 = 0;
  }
  if (*(void *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 8) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t ScheduledDaysState.localizedTitle.getter()
{
  if (*(unsigned char *)(v0 + 8) != 1)
  {
    if (qword_1EB724E38 == -1) {
      goto LABEL_6;
    }
LABEL_9:
    swift_once();
    goto LABEL_6;
  }
  if (!*(void *)v0) {
    return 0;
  }
  if (qword_1EB724E38 != -1) {
    goto LABEL_9;
  }
LABEL_6:
  id v1 = (id)qword_1EB727930;
  uint64_t v2 = sub_1AD9DCA70();

  return v2;
}

id ScheduledDaysState.unscheduledDaysFooter.getter()
{
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    if (!*(void *)v0) {
      return 0;
    }
    if (qword_1EB724E38 == -1) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if (!HKSPWeekdaysIsSingleDay()) {
    goto LABEL_15;
  }
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v2, sel_setFormattingContext_, 5);
  uint64_t v3 = HKSPDayForWeekdays();
  id result = objc_msgSend(v2, sel_standaloneWeekdaySymbols);
  if (result)
  {
    unsigned int v5 = result;
    uint64_t v6 = MEMORY[0x1E4FBB1A0];
    uint64_t v7 = sub_1AD9DF860();

    uint64_t v8 = NSGregorianCalendarDayForHKSPDay();
    if (v8)
    {
      unint64_t v9 = v8 - 1;
      if (__OFSUB__(v8, 1))
      {
        __break(1u);
      }
      else if ((v9 & 0x8000000000000000) == 0)
      {
        if (v9 < *(void *)(v7 + 16))
        {
          uint64_t v10 = v7 + 16 * v9;
          uint64_t v1 = *(void *)(v10 + 32);
          uint64_t v3 = *(void *)(v10 + 40);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (qword_1EB724E38 == -1)
          {
LABEL_12:
            id v11 = (id)qword_1EB727930;
            sub_1AD9DCA70();

            sub_1AD89E540();
            uint64_t v12 = swift_allocObject();
            *(_OWORD *)(v12 + 16) = xmmword_1AD9E3070;
            *(void *)(v12 + 56) = v6;
            *(void *)(v12 + 64) = sub_1AD89E5A8();
            *(void *)(v12 + 32) = v1;
            *(void *)(v12 + 40) = v3;
            sub_1AD9DF6E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v13 = (void *)sub_1AD9DF6D0();
            swift_bridgeObjectRelease();
            id v14 = objc_msgSend(v13, sel_hk_localizedFirstWordCapitalizedString, 0xE000000000000000);

            uint64_t v15 = sub_1AD9DF710();
LABEL_17:

            return (id)v15;
          }
LABEL_24:
          swift_once();
          goto LABEL_12;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_23;
    }

    swift_bridgeObjectRelease();
LABEL_15:
    if (qword_1EB724E38 == -1)
    {
LABEL_16:
      id v14 = (id)qword_1EB727930;
      uint64_t v15 = sub_1AD9DCA70();
      goto LABEL_17;
    }
LABEL_19:
    swift_once();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for ScheduledDaysState(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ScheduledDaysState(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)id result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)id result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_1AD9AB5B0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1AD9AB5CC(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)id result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduledDaysState()
{
  return &type metadata for ScheduledDaysState;
}

void BSDayPeriod.simplified.getter(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v3 = 0;
  switch(a1)
  {
    case 0:
    case 1:
      break;
    case 2:
    case 3:
    case 8:
      char v3 = 1;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
      char v3 = 2;
      break;
    case 10:
      if (qword_1EB725030 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_1AD9DD550();
      __swift_project_value_buffer(v4, (uint64_t)qword_1EB725018);
      unsigned int v5 = sub_1AD9DD530();
      os_log_type_t v6 = sub_1AD9DFBC0();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = swift_slowAlloc();
        uint64_t v9 = v8;
        *(_DWORD *)uint64_t v7 = 136446210;
        sub_1AD838978(0x7265507961445342, 0xEB00000000646F69, &v9);
        sub_1AD9DFEA0();
        _os_log_impl(&dword_1AD834000, v5, v6, "[%{public}s] unknown period, using fallback", v7, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3E6D1A0](v8, -1, -1);
        MEMORY[0x1B3E6D1A0](v7, -1, -1);
      }

      char v3 = 0;
      break;
    default:
      sub_1AD9E0140();
      __break(1u);
      JUMPOUT(0x1AD9AB804);
  }
  *a2 = v3;
}

BOOL static BSDayPeriod.Simplified.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t BSDayPeriod.greeting.getter(uint64_t a1)
{
  uint64_t v4 = 0;
  sub_1AD9AB9C4(&v4, a1);
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EB727930;
  uint64_t v2 = sub_1AD9DCA70();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t BSDayPeriod.GreetingOptions.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t BSDayPeriod.GreetingOptions.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static BSDayPeriod.GreetingOptions.headingWithName.getter(void *a1@<X8>)
{
  *a1 = 1;
}

uint64_t BSDayPeriod.Simplified.hash(into:)()
{
  return sub_1AD9E03B0();
}

uint64_t BSDayPeriod.Simplified.hashValue.getter()
{
  return sub_1AD9E03E0();
}

uint64_t sub_1AD9AB9C4(uint64_t *a1, uint64_t a2)
{
  uint64_t result = 0xD000000000000011;
  uint64_t v4 = *a1;
  unint64_t v5 = 0x80000001AD9F7110;
  switch(a2)
  {
    case 0:
      goto LABEL_13;
    case 1:
      os_log_type_t v6 = "MORNING2_GREETING";
      goto LABEL_9;
    case 2:
      uint64_t result = 0xD000000000000013;
      os_log_type_t v6 = "AFTERNOON1_GREETING";
      goto LABEL_9;
    case 3:
      uint64_t result = 0xD000000000000013;
      os_log_type_t v6 = "AFTERNOON2_GREETING";
      goto LABEL_9;
    case 4:
      os_log_type_t v6 = "EVENING1_GREETING";
      goto LABEL_9;
    case 5:
      os_log_type_t v6 = "EVENING2_GREETING";
      goto LABEL_9;
    case 6:
      uint64_t v7 = 0x31544847494ELL;
      goto LABEL_12;
    case 7:
      uint64_t v7 = 0x32544847494ELL;
LABEL_12:
      uint64_t result = v7 & 0xFFFFFFFFFFFFLL | 0x475F000000000000;
      unint64_t v5 = 0xEF474E4954454552;
LABEL_13:
      if (v4) {
        goto LABEL_14;
      }
      return result;
    case 8:
      unint64_t v5 = 0xED0000474E495445;
      uint64_t result = 0x4552475F4E4F4F4ELL;
      if (v4) {
        goto LABEL_14;
      }
      return result;
    case 9:
      os_log_type_t v6 = "MIDNIGHT_GREETING";
LABEL_9:
      unint64_t v5 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      if (v4)
      {
LABEL_14:
        v12[0] = result;
        v12[1] = v5;
        swift_bridgeObjectRetain();
        sub_1AD9DF790();
        swift_bridgeObjectRelease();
        uint64_t result = v12[0];
      }
      break;
    case 10:
      if (qword_1EB725030 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1AD9DD550();
      __swift_project_value_buffer(v8, (uint64_t)qword_1EB725018);
      uint64_t v9 = sub_1AD9DD530();
      os_log_type_t v10 = sub_1AD9DFBC0();
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1AD834000, v9, v10, "[BSDayPeriod] unknown period, using fallback", v11, 2u);
        MEMORY[0x1B3E6D1A0](v11, -1, -1);
      }

      v12[0] = v4;
      uint64_t result = sub_1AD9AB9C4(v12, 1);
      break;
    default:
      sub_1AD9E0140();
      __break(1u);
      JUMPOUT(0x1AD9ABC30);
  }
  return result;
}

Swift::String __swiftcall BSDayPeriod.namedGreeting(name:)(Swift::String name)
{
  object = name._object;
  uint64_t countAndFlagsBits = name._countAndFlagsBits;
  uint64_t v12 = 1;
  sub_1AD9AB9C4(&v12, v1);
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD89E540();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD9E3070;
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v5 + 64) = sub_1AD89E5A8();
  *(void *)(v5 + 32) = countAndFlagsBits;
  *(void *)(v5 + 40) = object;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1AD9DF6E0();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v6;
  os_log_type_t v10 = v8;
  result._object = v10;
  result._uint64_t countAndFlagsBits = v9;
  return result;
}

unint64_t sub_1AD9ABDD0()
{
  unint64_t result = qword_1E9A4D840;
  if (!qword_1E9A4D840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D840);
  }
  return result;
}

unint64_t sub_1AD9ABE28()
{
  unint64_t result = qword_1E9A4D848;
  if (!qword_1E9A4D848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D848);
  }
  return result;
}

unint64_t sub_1AD9ABE80()
{
  unint64_t result = qword_1E9A4D850;
  if (!qword_1E9A4D850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D850);
  }
  return result;
}

unint64_t sub_1AD9ABED8()
{
  unint64_t result = qword_1E9A4D858;
  if (!qword_1E9A4D858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D858);
  }
  return result;
}

unint64_t sub_1AD9ABF30()
{
  unint64_t result = qword_1E9A4D860;
  if (!qword_1E9A4D860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D860);
  }
  return result;
}

ValueMetadata *type metadata accessor for BSDayPeriod.GreetingOptions()
{
  return &type metadata for BSDayPeriod.GreetingOptions;
}

unsigned char *_s10SimplifiedOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(6, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD9AC060);
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(6, 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(6, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(6, 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BSDayPeriod.Simplified()
{
  return &type metadata for BSDayPeriod.Simplified;
}

id HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(uint64_t a1)
{
  return sub_1AD9AC158(a1, (SEL *)&selRef_isCurrentOnboardingVersionCompletedWithError_);
}

id HKFeatureAvailabilityProviding.pairedWatchSupportsSleep.getter(uint64_t a1)
{
  return sub_1AD9AC158(a1, (SEL *)&selRef_isFeatureCapabilitySupportedOnActivePairedDeviceWithError_);
}

id sub_1AD9AC158(uint64_t a1, SEL *a2)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  v10[0] = 0;
  id v3 = objc_msgSend(v2, *a2, v10);
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = v10[0];
    id v6 = objc_msgSend(v4, sel_BOOLValue);
  }
  else
  {
    id v7 = v10[0];
    uint64_t v8 = (void *)sub_1AD9DCB10();

    swift_willThrow();
    return 0;
  }
  return v6;
}

id sub_1AD9AC228()
{
  uint64_t v1 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BriefOneHourIsSixtyMinDateComponentsFormatter()), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + vsub_1AD95AB40(6, 1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1AD9AC29C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_durationLabel);
  sub_1AD9AC3E4();
  id v4 = v3;
  objc_msgSend(v2, sel_setAttributedText_, v3);

  uint64_t v5 = v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate;
  if (MEMORY[0x1B3E6D270](v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate))
  {
    uint64_t v6 = *(void *)(v5 + 8);
    unint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
    double v8 = 0.0;
    if ((v7 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options);
      if (v7 < *(void *)(v9 + 16)) {
        double v8 = *(double *)(v9 + 8 * v7 + 32);
      }
    }
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, double))(v6 + 8))(ObjectType, v6, v8);
    swift_unknownObjectRelease();
  }
  uint64_t v11 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_minusButton), sel_setEnabled_, *(void *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex) != 0);
  uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_plusButton);
  BOOL v13 = *(void *)(v1 + v11) != *(void *)(*(void *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options)
                                           + 16)
                               - 1;
  return objc_msgSend(v12, sel_setEnabled_, v13);
}

void sub_1AD9AC3E4()
{
  id v0 = objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E4FB2990]);
  sub_1AD9ACA60(0, &qword_1E9A4D8A0, &qword_1E9A49DC0, type metadata accessor for TraitKey);
  uint64_t inited = swift_initStackObject();
  uint64_t v2 = (void **)MEMORY[0x1E4FB09F0];
  *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
  id v3 = *v2;
  *(void *)(inited + 32) = *v2;
  uint64_t v4 = *MEMORY[0x1E4FB09E0];
  type metadata accessor for Weight(0);
  *(void *)(inited + 64) = v5;
  *(void *)(inited + 40) = v4;
  id v6 = v0;
  id v7 = v3;
  unint64_t v8 = sub_1AD864264(inited);
  sub_1AD9ACA60(0, &qword_1E9A4C428, (unint64_t *)&qword_1E9A4C430, type metadata accessor for AttributeName);
  uint64_t v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_1AD9E3070;
  os_log_type_t v10 = (void *)*MEMORY[0x1E4FB0950];
  *(void *)(v9 + 32) = *MEMORY[0x1E4FB0950];
  sub_1AD9ACAB8();
  *(void *)(v9 + 64) = v11;
  *(void *)(v9 + 40) = v8;
  id v12 = v10;
  sub_1AD863C98(v9);
  type metadata accessor for AttributeName(0);
  sub_1AD9ACB58((unint64_t *)&unk_1E9A4C450, type metadata accessor for AttributeName);
  BOOL v13 = (void *)sub_1AD9DF5F0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v6, sel_fontDescriptorByAddingAttributes_, v13);

  id v15 = objc_msgSend(v14, sel_fontDescriptorWithDesign_, *MEMORY[0x1E4FB0938]);
  if (v15)
  {

    BOOL v16 = self;
    Class v17 = (Class)v15;
    id v18 = objc_msgSend(v16, sel_fontWithDescriptor_size_, v17, 42.0);
    if (sub_1AD9DF430())
    {
      Class isa = UIFontDescriptor.addingLowercaseSmallCapsAttributes()().super.isa;
      v20.super.Class isa = UIFontDescriptor.addingUppercaseSmallCapsAttributes()().super.isa;

      Class v17 = isa;
    }
    else
    {
      v20.super.Class isa = v17;
    }

    id v21 = objc_msgSend(v16, sel_fontWithDescriptor_size_, v20.super.isa, 42.0);
    uint64_t v22 = sub_1AD9ACBA0();
    if (v23)
    {
      uint64_t v24 = v22;
      uint64_t v25 = v23;
      sub_1AD9ACA60(0, (unint64_t *)&qword_1E9A4BFD8, (unint64_t *)&qword_1E9A4BFE0, type metadata accessor for Key);
      uint64_t v26 = swift_initStackObject();
      *(_OWORD *)(v26 + 16) = xmmword_1AD9E3070;
      uint64_t v27 = (void *)*MEMORY[0x1E4FB06F8];
      *(void *)(v26 + 32) = *MEMORY[0x1E4FB06F8];
      uint64_t v28 = sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
      *(void *)(v26 + 64) = v28;
      *(void *)(v26 + 40) = v21;
      id v29 = v27;
      unint64_t v30 = sub_1AD86421C(v26);
      uint64_t v31 = swift_initStackObject();
      *(_OWORD *)(v31 + 16) = xmmword_1AD9E3070;
      *(void *)(v31 + 64) = v28;
      *(void *)(v31 + 32) = v29;
      *(void *)(v31 + 40) = v18;
      id v32 = v29;
      unint64_t v33 = sub_1AD86421C(v31);
      sub_1AD837214(0, (unint64_t *)&unk_1E9A4AEC0);
      MEMORY[0x1B3E6BC80](v24, v25, v33, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_1AD9AC8B4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
  if (v1 != *(void *)(*(void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options) + 16) - 1)
  {
    BOOL v2 = __OFADD__(v1, 1);
    uint64_t v3 = v1 + 1;
    if (v2)
    {
      __break(1u);
    }
    else
    {
      *(void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex) = v3;
      return sub_1AD9AC29C();
    }
  }
  return result;
}

id sub_1AD9AC97C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TimeDurationPicker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TimeDurationPicker()
{
  return self;
}

void sub_1AD9ACA60(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  if (!*a2)
  {
    sub_1AD9ACC4C(255, a3, a4);
    unint64_t v5 = sub_1AD9E0290();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1AD9ACAB8()
{
  if (!qword_1E9A4D8A8)
  {
    type metadata accessor for TraitKey(255);
    sub_1AD9ACB58(&qword_1E9A496C8, type metadata accessor for TraitKey);
    unint64_t v0 = sub_1AD9DF610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D8A8);
    }
  }
}

uint64_t sub_1AD9ACB58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1AD9ACBA0()
{
  id v1 = sub_1AD9AC228();
  objc_super v2 = v1;
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
  double v4 = 0.0;
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options);
    if (v3 < *(void *)(v5 + 16)) {
      double v4 = *(double *)(v5 + 8 * v3 + 32);
    }
  }
  id v6 = objc_msgSend(v1, sel_stringFromTimeInterval_, v4);

  if (!v6) {
    return 0;
  }
  uint64_t v7 = sub_1AD9DF710();

  return v7;
}

void sub_1AD9ACC4C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_1AD9ACCB4()
{
  id v1 = v0;
  *(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter] = 0;
  objc_super v2 = (objc_class *)type metadata accessor for PlusMinusButton();
  unint64_t v3 = (char *)objc_allocWithZone(v2);
  *(_WORD *)&v3[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type] = 24577;
  v27.receiver = v3;
  v27.super_class = v2;
  id v4 = objc_msgSendSuper2(&v27, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  uint64_t v5 = *MEMORY[0x1E4FB2988];
  uint64_t v6 = *MEMORY[0x1E4FB09E0];
  uint64_t v7 = (char *)v4;
  uint64_t v24 = v6;
  id v8 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(v5, 0, 1, 0, 0, 0, 0, v6, 0);
  sub_1AD837214(0, &qword_1E9A4D8B0);
  __int16 v26 = *(_WORD *)&v7[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type];
  Symbol.systemName.getter();
  id v9 = (id)*MEMORY[0x1E4FB28C8];
  id v10 = (id)sub_1AD9DFDE0();
  swift_bridgeObjectRelease();

  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_configurationWithFont_scale_, v8, 3);
  if (v10)
  {
    id v13 = v10;
    id v10 = objc_msgSend(v13, sel_imageWithConfiguration_, v12);

    id v12 = v13;
  }

  uint64_t v14 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_plusButton;
  objc_msgSend(v7, sel_setImage_forState_, v10, 0);

  *(void *)&v1[v14] = v7;
  id v15 = (char *)objc_allocWithZone(v2);
  *(_WORD *)&v15[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type] = 20481;
  v25.receiver = v15;
  v25.super_class = v2;
  BOOL v16 = (char *)objc_msgSendSuper2(&v25, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v17 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(v5, 0, 1, 0, 0, 0, 0, v24, 0);
  __int16 v26 = *(_WORD *)&v16[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type];
  Symbol.systemName.getter();
  id v18 = v9;
  id v19 = (id)sub_1AD9DFDE0();
  swift_bridgeObjectRelease();

  id v20 = objc_msgSend(v11, sel_configurationWithFont_scale_, v17, 3);
  if (v19)
  {
    id v21 = v19;
    id v19 = objc_msgSend(v21, sel_imageWithConfiguration_, v20);

    id v20 = v21;
  }

  uint64_t v22 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_minusButton;
  objc_msgSend(v16, sel_setImage_forState_, v19, 0);

  *(void *)&v1[v22] = v16;
  uint64_t v23 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_durationLabel;
  *(void *)&v1[v23] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);

  sub_1AD9E0140();
  __break(1u);
}

uint64_t sub_1AD9AD094(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)sub_1AD9DCE40();
  id v8 = (char *)*((void *)v7 - 1);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD8AD950(0);
  MEMORY[0x1F4188790](v12 - 8, v13);
  id v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days] = MEMORY[0x1E4FBC860];
  BOOL v16 = &v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  *(void *)BOOL v16 = a1;
  *((void *)v16 + sub_1AD95AB40(6, 1) = a2;
  *((void *)v16 + 2) = a3;
  double v17 = 22.0;
  if (!a2) {
    double v17 = 15.0;
  }
  id v18 = &v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration];
  *(_OWORD *)id v18 = xmmword_1AD9EE290;
  *((double *)v18 + 2) = v17;
  *(_OWORD *)(v18 + 24) = xmmword_1AD9EE2A0;
  id v19 = (objc_class *)type metadata accessor for SleepScheduleDayPicker();
  v45.receiver = v3;
  v45.super_class = v19;
  id v20 = a1;
  id v21 = (char *)objc_msgSendSuper2(&v45, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v22 = &v21[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  uint64_t v23 = *(void **)v22;
  uint64_t v24 = v21;
  id v25 = objc_msgSend(v23, sel_calendar);
  if (!v25)
  {
LABEL_18:
    uint64_t result = (*((uint64_t (**)(char *, uint64_t, uint64_t, char *))v8 + 7))(v15, 1, 1, v7);
    goto LABEL_19;
  }
  __int16 v26 = v25;
  sub_1AD9DCDB0();

  (*((void (**)(char *, char *, char *))v8 + 4))(v15, v11, v7);
  (*((void (**)(char *, void, uint64_t, char *))v8 + 7))(v15, 0, 1, v7);
  uint64_t result = (*((uint64_t (**)(char *, uint64_t, char *))v8 + 6))(v15, 1, v7);
  if (result != 1)
  {
    uint64_t v28 = sub_1AD9DCDA0();
    (*((void (**)(char *, char *))v8 + 1))(v15, v7);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v24;
    id v15 = (char *)swift_allocObject();
    *((void *)v15 + 2) = sub_1AD9AEFD4;
    *((void *)v15 + 3) = v29;
    aBlock[4] = sub_1AD9AEFEC;
    unint64_t v44 = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AD9AE2A0;
    aBlock[3] = &block_descriptor_37;
    unint64_t v30 = _Block_copy(aBlock);
    id v8 = v44;
    uint64_t v7 = v24;
    swift_retain();
    swift_release();
    HKSPEnumerateDaysOfWeekInCalendar();
    _Block_release(v30);

    LOBYTE(v28) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (v28)
    {
      __break(1u);
    }
    else
    {
      id v42 = v20;
      sub_1AD9AD5D0();
      objc_msgSend(v7, sel_setLayoutMargins_, *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration], *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration + 8], *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration + 16], *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration + 24]);
      uint64_t v31 = (uint64_t *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
      swift_beginAccess();
      uint64_t v29 = *v31;
      unint64_t v32 = (unint64_t)*v31 >> 62;
      uint64_t v41 = v7;
      if (!v32)
      {
        uint64_t v33 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v33)
        {
LABEL_8:
          if (v33 >= 1)
          {
            uint64_t v34 = 0;
            do
            {
              if ((v29 & 0xC000000000000001) != 0) {
                unint64_t v35 = (unsigned char *)MEMORY[0x1B3E6BFF0](v34, v29);
              }
              else {
                unint64_t v35 = *(id *)(v29 + 8 * v34 + 32);
              }
              unint64_t v36 = v35;
              ++v34;
              objc_msgSend(v35, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((void *)v22 + 2)) == 0);
              uint64_t v37 = *((void *)v22 + 1);
              BOOL v38 = (HKSPWeekdaysFromDay() & ~v37) == 0;
              v36[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v38;
              sub_1AD8AFF00();
            }
            while (v33 != v34);
            goto LABEL_16;
          }
          __break(1u);
          goto LABEL_18;
        }
LABEL_16:

        swift_bridgeObjectRelease();
        uint64_t v39 = v41;

        return (uint64_t)v39;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_1AD9E0190();
    if (v33) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_19:
  __break(1u);
  return result;
}

void sub_1AD9AD5D0()
{
  unint64_t v43 = MEMORY[0x1E4FBC860];
  id v1 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v42 = objc_msgSend(v1, sel_topAnchor);

  id v2 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v41 = objc_msgSend(v2, sel_bottomAnchor);

  id v3 = objc_msgSend(v0, sel_layoutMarginsGuide);
  id v4 = objc_msgSend(v3, sel_leadingAnchor);

  uint64_t v5 = (id *)&v0[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
  swift_beginAccess();
  unint64_t v6 = (unint64_t)*v5;
  if ((unint64_t)*v5 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1AD9E0190();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v36 = v0;
  if (v7)
  {
    if (v7 >= 1)
    {
      id v8 = 0;
      uint64_t v9 = 0;
      uint64_t v37 = (double *)&v0[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration];
      uint64_t v38 = v7;
      unint64_t v39 = v6;
      unint64_t v40 = v6 & 0xC000000000000001;
      uint64_t v10 = v4;
      while (1)
      {
        if (v40) {
          id v12 = (id)MEMORY[0x1B3E6BFF0](v9, v6);
        }
        else {
          id v12 = *(id *)(v6 + 8 * v9 + 32);
        }
        id v4 = v12;
        objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        id v13 = objc_msgSend(v4, sel_leadingAnchor);
        unint64_t v6 = (unint64_t)objc_msgSend(v13, sel_constraintEqualToAnchor_, v10);

        id v14 = objc_msgSend(v4, sel_topAnchor);
        id v15 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v42);

        id v16 = objc_msgSend(v4, sel_bottomAnchor);
        id v17 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v16);

        uint64_t v0 = (char *)v43;
        if (v43 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v30 = sub_1AD9E0190();
          swift_bridgeObjectRelease();
          uint64_t v19 = v30 + 3;
          if (__OFADD__(v30, 3))
          {
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v18 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + 3;
          if (__OFADD__(v18, 3)) {
            goto LABEL_32;
          }
        }
        sub_1AD9AF108(v19, 1);
        sub_1AD9DF870();
        id v20 = (id)v6;
        MEMORY[0x1B3E6B7E0]();
        if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1AD9DF880();
        }
        sub_1AD9DF8B0();
        sub_1AD9DF870();
        id v21 = v15;
        MEMORY[0x1B3E6B7E0]();
        if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1AD9DF880();
        }
        sub_1AD9DF8B0();
        sub_1AD9DF870();
        id v22 = v17;
        MEMORY[0x1B3E6B7E0]();
        if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1AD9DF880();
        }
        sub_1AD9DF8B0();
        sub_1AD9DF870();

        id v23 = objc_msgSend(v4, sel_heightAnchor);
        id v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, v37[4]);

        LODWORD(v25) = 1144750080;
        objc_msgSend(v24, sel_setPriority_, v25);
        id v26 = v24;
        MEMORY[0x1B3E6B7E0]();
        if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1AD9DF880();
        }
        sub_1AD9DF8B0();
        sub_1AD9DF870();
        if (v8)
        {
          id v27 = v8;
          id v28 = objc_msgSend(v4, sel_widthAnchor);
          id v29 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v27);

          MEMORY[0x1B3E6B7E0]();
          if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1AD9DF880();
          }
          sub_1AD9DF8B0();
          sub_1AD9DF870();
        }
        else
        {
          id v8 = objc_msgSend(v4, sel_widthAnchor);
        }
        ++v9;
        id v11 = v4;
        id v4 = objc_msgSend(v11, sel_trailingAnchor);

        uint64_t v10 = v4;
        unint64_t v6 = v39;
        if (v38 == v9) {
          goto LABEL_29;
        }
      }
    }
    __break(1u);
  }
  else
  {
    id v8 = 0;
LABEL_29:
    swift_bridgeObjectRelease();
    id v31 = objc_msgSend(v36, sel_layoutMarginsGuide);
    id v32 = objc_msgSend(v31, sel_trailingAnchor);

    id v33 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v4);
    MEMORY[0x1B3E6B7E0]();
    if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_1AD9DF880();
    }
    sub_1AD9DF8B0();
    sub_1AD9DF870();
    uint64_t v34 = self;
    sub_1AD837214(0, (unint64_t *)&qword_1E9A4A090);
    unint64_t v35 = (void *)sub_1AD9DF850();
    swift_bridgeObjectRelease();
    objc_msgSend(v34, sel_activateConstraints_, v35);
  }
}

id sub_1AD9ADDE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepScheduleDayPicker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SleepScheduleDayPicker()
{
  return self;
}

id sub_1AD9ADE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  *((void *)v5 + sub_1AD95AB40(6, 1) = a1;
  *((void *)v5 + 2) = a2;
  id v17 = v2;
  unint64_t v6 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
  swift_beginAccess();
  uint64_t v7 = *(void *)v6;
  if (*(void *)v6 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = (id)sub_1AD9E0190();
    uint64_t v8 = (uint64_t)result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (!v8) {
      goto LABEL_10;
    }
  }
  if (v8 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v10 = 0;
  do
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v11 = (unsigned char *)MEMORY[0x1B3E6BFF0](v10, v7);
    }
    else {
      id v11 = *(id *)(v7 + 8 * v10 + 32);
    }
    id v12 = v11;
    ++v10;
    objc_msgSend(v11, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((void *)v5 + 2)) == 0);
    uint64_t v13 = *((void *)v5 + 1);
    BOOL v14 = (HKSPWeekdaysFromDay() & ~v13) == 0;
    v12[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v14;
    sub_1AD8AFF00();
  }
  while (v8 != v10);
LABEL_10:
  swift_bridgeObjectRelease();
  if (*((void *)v5 + 1)) {
    double v15 = 22.0;
  }
  else {
    double v15 = 15.0;
  }
  id v16 = &v17[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration];
  *(_OWORD *)id v16 = xmmword_1AD9EE290;
  *((double *)v16 + 2) = v15;
  *(_OWORD *)(v16 + 24) = xmmword_1AD9EE2A0;
  return objc_msgSend(v17, sel_setLayoutMargins_, 15.0, 10.0);
}

void sub_1AD9AE07C(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v5 = (void **)&a3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  unint64_t v6 = *v5;
  uint64_t v7 = self;
  id v8 = v6;
  v13[0] = sub_1AD8B09B0;
  v13[1] = 0;
  v13[2] = objc_msgSend(v7, sel_clearColor);
  v13[3] = objc_msgSend(v7, sel_labelColor);
  v13[4] = objc_msgSend(v7, sel_clearColor);
  v13[5] = objc_msgSend(v7, sel_labelColor);
  v13[6] = objc_msgSend(v7, sel_systemGray3Color);
  v13[7] = 0x4014000000000000;
  v13[8] = objc_msgSend(v7, sel_systemBackgroundColor);
  long long v14 = xmmword_1AD9EE2B0;
  id v9 = objc_allocWithZone((Class)type metadata accessor for SleepScheduleDayPickerDay());
  uint64_t v10 = sub_1AD8AF1E8(a1, v8, (uint64_t)v13);
  objc_msgSend(v10, sel_addTarget_action_forControlEvents_, a3, sel_didTapDay_, 64);
  id v11 = &a3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
  swift_beginAccess();
  id v12 = v10;
  MEMORY[0x1B3E6B7E0]();
  if (*(void *)((*(void *)v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v11 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
    sub_1AD9DF880();
  sub_1AD9DF8B0();
  sub_1AD9DF870();
  swift_endAccess();
  objc_msgSend(a3, sel_addSubview_, v12);
}

uint64_t sub_1AD9AE2A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 32))(a2, a3);
}

void sub_1AD9AE2D0(void *a1)
{
  objc_super v2 = v1;
  swift_getObjectType();
  if (qword_1EB725658 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AD9DD550();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB725958);
  id v5 = a1;
  unint64_t v6 = sub_1AD9DD530();
  os_log_type_t v7 = sub_1AD9DFBB0();
  id v45 = v2;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    v46[0] = v44;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v9 = sub_1AD9E04F0();
    sub_1AD838978(v9, v10, v46);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    HKSPWeekdaysFromDay();
    id v11 = (id)NSStringFromHKSPWeekdays();
    uint64_t v12 = sub_1AD9DF710();
    unint64_t v14 = v13;

    sub_1AD838978(v12, v14, v46);
    sub_1AD9DFEA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v6, v7, "[%{public}s] Did tap day: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v44, -1, -1);
    MEMORY[0x1B3E6D1A0](v8, -1, -1);
  }
  else
  {
  }
  double v15 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  uint64_t v16 = *((void *)v15 + 2);
  if ((HKSPWeekdaysFromDay() & ~v16) == 0)
  {
    uint64_t v17 = *((void *)v15 + 2);
    if (v17 == HKSPWeekdaysFromDay()) {
      return;
    }
    swift_beginAccess();
    uint64_t v18 = HKSPWeekdaysFromDay();
    uint64_t v19 = *((void *)v15 + 2);
    if ((v19 & v18) != 0) {
      *((void *)v15 + 2) = v19 & ~v18;
    }
    swift_endAccess();
    id v20 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
    swift_beginAccess();
    uint64_t v21 = *(void *)v20;
    if (*(void *)v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_1AD9E0190();
      if (v22) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v22)
      {
LABEL_12:
        if (v22 >= 1)
        {
          uint64_t v23 = 0;
          do
          {
            if ((v21 & 0xC000000000000001) != 0) {
              id v24 = (unsigned char *)MEMORY[0x1B3E6BFF0](v23, v21);
            }
            else {
              id v24 = *(id *)(v21 + 8 * v23 + 32);
            }
            double v25 = v24;
            ++v23;
            objc_msgSend(v24, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((void *)v15 + 2)) == 0);
            uint64_t v26 = *((void *)v15 + 1);
            BOOL v27 = (HKSPWeekdaysFromDay() & ~v26) == 0;
            v25[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v27;
            sub_1AD8AFF00();
          }
          while (v22 != v23);
          goto LABEL_35;
        }
        __break(1u);
LABEL_38:
        __break(1u);
        return;
      }
    }
LABEL_35:
    swift_bridgeObjectRelease();
    objc_msgSend(v45, sel_sendActionsForControlEvents_, 4096);
    return;
  }
  uint64_t v28 = *((void *)v15 + 1);
  if ((HKSPWeekdaysFromDay() & ~v28) != 0)
  {
    swift_beginAccess();
    uint64_t v34 = HKSPWeekdaysFromDay();
    uint64_t v35 = *((void *)v15 + 2);
    if ((v34 & ~v35) != 0) {
      *((void *)v15 + 2) = v35 | v34;
    }
    swift_endAccess();
    id v36 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
    swift_beginAccess();
    uint64_t v37 = *(void *)v36;
    if (*(void *)v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_1AD9E0190();
      if (!v38) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v38) {
        goto LABEL_35;
      }
    }
    if (v38 >= 1)
    {
      uint64_t v39 = 0;
      do
      {
        if ((v37 & 0xC000000000000001) != 0) {
          unint64_t v40 = (unsigned char *)MEMORY[0x1B3E6BFF0](v39, v37);
        }
        else {
          unint64_t v40 = *(id *)(v37 + 8 * v39 + 32);
        }
        id v41 = v40;
        ++v39;
        objc_msgSend(v40, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((void *)v15 + 2)) == 0);
        uint64_t v42 = *((void *)v15 + 1);
        BOOL v43 = (HKSPWeekdaysFromDay() & ~v42) == 0;
        v41[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v43;
        sub_1AD8AFF00();
      }
      while (v38 != v39);
      goto LABEL_35;
    }
    goto LABEL_38;
  }
  sub_1AD837214(0, (unint64_t *)&unk_1E9A4B010);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v2;
  *(void *)(v29 + 24) = v5;
  id v30 = v5;
  id v31 = v2;
  id v32 = sub_1AD9AEA94((uint64_t)sub_1AD9AF070, v29);
  swift_release();
  id v33 = (void *)MEMORY[0x1B3E6D270](&v31[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter]);
  if (v33)
  {
    objc_msgSend(v33, sel_presentViewController_animated_completion_, v32, 1, 0);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

uint64_t sub_1AD9AE8C8(uint64_t result, char *a2)
{
  if (result)
  {
    id v3 = &a2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
    swift_beginAccess();
    uint64_t v4 = HKSPWeekdaysFromDay();
    uint64_t v5 = *((void *)v3 + 2);
    if ((v4 & ~v5) != 0) {
      *((void *)v3 + 2) = v5 | v4;
    }
    swift_endAccess();
    unint64_t v6 = &a2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
    swift_beginAccess();
    uint64_t v7 = *(void *)v6;
    if (*(void *)v6 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = sub_1AD9E0190();
      uint64_t v8 = result;
      if (result) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_6:
        if (v8 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v9 = 0;
        do
        {
          if ((v7 & 0xC000000000000001) != 0) {
            unint64_t v10 = (unsigned char *)MEMORY[0x1B3E6BFF0](v9, v7);
          }
          else {
            unint64_t v10 = *(id *)(v7 + 8 * v9 + 32);
          }
          id v11 = v10;
          ++v9;
          objc_msgSend(v10, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((void *)v3 + 2)) == 0);
          uint64_t v12 = *((void *)v3 + 1);
          BOOL v13 = (HKSPWeekdaysFromDay() & ~v12) == 0;
          v11[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v13;
          sub_1AD8AFF00();
        }
        while (v8 != v9);
      }
    }
    swift_bridgeObjectRelease();
    return (uint64_t)objc_msgSend(a2, sel_sendActionsForControlEvents_, 4096);
  }
  return result;
}

id sub_1AD9AEA94(uint64_t a1, uint64_t a2)
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  id v5 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  unint64_t v6 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_alertControllerWithTitle_message_preferredStyle_, v6, v7, 1, 0xE000000000000000);

  id v9 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_retain();
  id v11 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  double v25 = sub_1AD9AF0B0;
  uint64_t v26 = v10;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_1AD9199DC;
  id v24 = &block_descriptor_28;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_release();
  BOOL v13 = self;
  id v14 = objc_msgSend(v13, sel_actionWithTitle_style_handler_, v11, 1, v12, 0xE000000000000000);
  _Block_release(v12);

  objc_msgSend(v8, sel_addAction_, v14);
  id v15 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  swift_retain();
  uint64_t v17 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  double v25 = sub_1AD9AF0DC;
  uint64_t v26 = v16;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_1AD9199DC;
  id v24 = &block_descriptor_34;
  uint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  id v19 = objc_msgSend(v13, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
  _Block_release(v18);

  objc_msgSend(v8, sel_addAction_, v19);
  return v8;
}

uint64_t getEnumTagSinglePayload for SleepScheduleDayPicker.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SleepScheduleDayPicker.Configuration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)id result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SleepScheduleDayPicker.Configuration()
{
  return &type metadata for SleepScheduleDayPicker.Configuration;
}

uint64_t sub_1AD9AEF9C()
{
  return swift_deallocObject();
}

void sub_1AD9AEFD4(uint64_t a1, uint64_t a2)
{
  sub_1AD9AE07C(a1, a2, *(char **)(v2 + 16));
}

uint64_t sub_1AD9AEFDC()
{
  return swift_deallocObject();
}

uint64_t sub_1AD9AEFEC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_37(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_37()
{
  return swift_release();
}

uint64_t sub_1AD9AF030()
{
  return swift_deallocObject();
}

uint64_t sub_1AD9AF070(uint64_t a1)
{
  return sub_1AD9AE8C8(a1, *(char **)(v1 + 16));
}

uint64_t sub_1AD9AF078()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9AF0B0()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_1AD9AF0DC()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(1);
}

uint64_t sub_1AD9AF108(uint64_t a1, char a2)
{
  unint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v5;
  uint64_t v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1AD9E0190();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = MEMORY[0x1B3E6C000](v7, v9, a2 & 1, v5);
  *uint64_t v2 = result;
  return result;
}

BOOL static SleepOnboardingContext.EntryPoint.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SleepOnboardingContext.EntryPoint.hash(into:)()
{
  return sub_1AD9E03B0();
}

uint64_t SleepOnboardingContext.EntryPoint.hashValue.getter()
{
  return sub_1AD9E03E0();
}

id SleepOnboardingContext.provenanceInfo.getter()
{
  return *v0;
}

void SleepOnboardingContext.entryPoint.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

uint64_t SleepOnboardingContext.presentationStyle.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SleepOnboardingContext.init(provenanceInfo:entryPoint:presentationStyle:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char v4 = *a2;
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v4;
  *(void *)(a4 + 16) = a3;
  return result;
}

unint64_t sub_1AD9AF29C()
{
  unint64_t result = qword_1E9A4D8D8;
  if (!qword_1E9A4D8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D8D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SleepOnboardingContext(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for SleepOnboardingContext(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for SleepOnboardingContext(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for SleepOnboardingContext()
{
  return &type metadata for SleepOnboardingContext;
}

unsigned char *storeEnumTagSinglePayload for SleepOnboardingContext.EntryPoint(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(6, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD9AF4A8);
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(6, 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(6, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(6, 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepOnboardingContext.EntryPoint()
{
  return &type metadata for SleepOnboardingContext.EntryPoint;
}

uint64_t NSUserActivity.route.getter()
{
  sub_1AD83F638();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v1;
}

id RouteProvenanceProviding.provenanceInfo.getter(uint64_t a1, uint64_t a2)
{
  id v4 = (id)(*(uint64_t (**)(void))(a2 + 8))();
  if (!v4) {
    id v4 = (id)*MEMORY[0x1E4FA5378];
  }
  uint64_t v5 = v4;
  id v6 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (!v6) {
    id v6 = (id)*MEMORY[0x1E4FA5348];
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA5518]), sel_initWithSource_presentation_, v5, v6);

  return v8;
}

uint64_t sub_1AD9AF5E8()
{
  uint64_t v1 = sub_1AD9DF710();
  sub_1AD9DF790();
  sub_1AD9DF790();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static NSUserActivity.plugin.getter()
{
  sub_1AD9DF710();
  uint64_t v0 = sub_1AD9DD240();
  swift_bridgeObjectRelease();
  sub_1AD9AF790(1, 0);
  return v0;
}

void sub_1AD9AF790(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    sub_1AD9B447C(0, (unint64_t *)&qword_1E9A4D028, (uint64_t (*)(uint64_t))sub_1AD96E174, MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
    sub_1AD9DF710();
    sub_1AD9DF790();
    sub_1AD9DF790();
    sub_1AD9DFFE0();
    *(void *)(inited + 96) = MEMORY[0x1E4FBB550];
    *(void *)(inited + 72) = a1;
    sub_1AD863F18(inited);
    uint64_t v5 = (void *)sub_1AD9DF5F0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v5);
  }
}

uint64_t sub_1AD9AF8E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AD83F638();
  if (v3)
  {
    uint64_t v4 = sub_1AD9DF6D0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return result;
}

void NSUserActivity.route.setter(void *a1)
{
}

void (*NSUserActivity.route.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  sub_1AD83F638();
  if (v3)
  {
    uint64_t v4 = sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return sub_1AD9AF9C8;
}

void sub_1AD9AF9C8(void **a1, char a2)
{
}

uint64_t NSUserActivity.presentWithAnimation.getter()
{
  return sub_1AD83F778();
}

void NSUserActivity.presentWithAnimation.setter(char a1)
{
}

void (*NSUserActivity.presentWithAnimation.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  *((unsigned char *)v3 + 128) = sub_1AD83F778();
  return sub_1AD9AFA68;
}

void sub_1AD9AFA68(uint64_t a1, char a2)
{
}

uint64_t NSUserActivity.delayScrollToSchedule.getter()
{
  return sub_1AD83F778();
}

void NSUserActivity.delayScrollToSchedule.setter(char a1)
{
}

void sub_1AD9AFABC(char a1)
{
  if (a1 != 2)
  {
    char v2 = a1 & 1;
    sub_1AD9B447C(0, (unint64_t *)&qword_1E9A4D028, (uint64_t (*)(uint64_t))sub_1AD96E174, MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
    sub_1AD9DF710();
    sub_1AD9DF790();
    sub_1AD9DF790();
    sub_1AD9DFFE0();
    *(void *)(inited + 96) = MEMORY[0x1E4FBB390];
    *(unsigned char *)(inited + 72) = v2;
    sub_1AD863F18(inited);
    uint64_t v4 = (void *)sub_1AD9DF5F0();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_addUserInfoEntriesFromDictionary_, v4);
  }
}

void (*NSUserActivity.delayScrollToSchedule.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  *((unsigned char *)v3 + 128) = sub_1AD83F778();
  return sub_1AD9AFC88;
}

void sub_1AD9AFC88(uint64_t a1, char a2)
{
}

void sub_1AD9AFCB8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(unsigned __int8 *)(*(void *)a1 + 128);
  if (a2)
  {
    a5(v6);
  }
  else if (v6 != 2)
  {
    uint64_t v7 = (void *)v5[15];
    char v8 = v6 & 1;
    sub_1AD9B447C(0, (unint64_t *)&qword_1E9A4D028, (uint64_t (*)(uint64_t))sub_1AD96E174, MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
    uint64_t v12 = sub_1AD9DF710();
    uint64_t v13 = v10;
    sub_1AD9DF790();
    sub_1AD9DF790();
    v5[13] = v12;
    v5[14] = v13;
    sub_1AD9DFFE0();
    *(void *)(inited + 96) = MEMORY[0x1E4FBB390];
    *(unsigned char *)(inited + 72) = v8;
    sub_1AD863F18(inited);
    id v11 = (void *)sub_1AD9DF5F0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_addUserInfoEntriesFromDictionary_, v11);
  }
  free(v5);
}

uint64_t NSUserActivity.provenanceSource.getter()
{
  sub_1AD83F638();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1AD9AFEA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AD83F638();
  if (v3)
  {
    uint64_t v4 = sub_1AD9DF6D0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return result;
}

void NSUserActivity.provenanceSource.setter(void *a1)
{
}

void sub_1AD9AFF0C(void *a1)
{
  if (a1)
  {
    char v2 = v1;
    uint64_t v4 = sub_1AD9DF710();
    uint64_t v6 = v5;
    sub_1AD9B447C(0, (unint64_t *)&qword_1E9A4D028, (uint64_t (*)(uint64_t))sub_1AD96E174, MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
    sub_1AD9DF710();
    swift_bridgeObjectRetain();
    sub_1AD9DF790();
    sub_1AD9DF790();
    uint64_t v8 = MEMORY[0x1E4FBB1A0];
    sub_1AD9DFFE0();
    *(void *)(inited + 96) = v8;
    *(void *)(inited + 72) = v4;
    *(void *)(inited + 80) = v6;
    swift_bridgeObjectRetain();
    sub_1AD863F18(inited);
    uint64_t v9 = (void *)sub_1AD9DF5F0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v9);

    swift_bridgeObjectRelease_n();
  }
}

void (*NSUserActivity.provenanceSource.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  sub_1AD83F638();
  if (v3)
  {
    uint64_t v4 = sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return sub_1AD9B0110;
}

void sub_1AD9B0110(void **a1, char a2)
{
}

uint64_t NSUserActivity.provenancePresentation.getter()
{
  sub_1AD83F638();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1AD9B0170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1AD83F638();
  if (v3)
  {
    uint64_t v4 = sub_1AD9DF6D0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return result;
}

void NSUserActivity.provenancePresentation.setter(void *a1)
{
}

void (*NSUserActivity.provenancePresentation.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  sub_1AD83F638();
  if (v3)
  {
    uint64_t v4 = sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  *a1 = v4;
  return sub_1AD9B025C;
}

void sub_1AD9B025C(void **a1, char a2)
{
}

void sub_1AD9B0274(void **a1, char a2, void (*a3)(void *))
{
  uint64_t v4 = *a1;
  if (a2)
  {
    id v5 = v4;
    a3(v4);
  }
  else
  {
    a3(*a1);
  }
}

char NSUserActivity.articleIdentifier.getter@<W0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = sub_1AD83F638();
  if (v3)
  {
    LOBYTE(v2) = ArticleIdentifier.init(rawValue:)(*(Swift::String *)&v2);
  }
  else
  {
    *a1 = 5;
  }
  return v2;
}

char sub_1AD9B0348@<W0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1AD83F638();
  if (v3)
  {
    LOBYTE(v2) = ArticleIdentifier.init(rawValue:)(*(Swift::String *)&v2);
    char v4 = v6;
  }
  else
  {
    char v4 = 5;
  }
  *a1 = v4;
  return v2;
}

void NSUserActivity.articleIdentifier.setter(unsigned char *a1)
{
  unint64_t v2 = 0xD000000000000023;
  unint64_t v3 = 0x80000001AD9EF7B0;
  char v4 = v1;
  switch(*a1)
  {
    case 1:
      unint64_t v2 = 0xD000000000000026;
      id v5 = "com.apple.health.Sleep.sleepImportance";
      goto LABEL_6;
    case 2:
      unint64_t v2 = 0xD000000000000022;
      id v5 = "com.apple.health.Sleep.sleepStages";
      goto LABEL_6;
    case 3:
      unint64_t v2 = 0xD000000000000021;
      id v5 = "com.apple.health.Sleep.sleepApnea";
      goto LABEL_6;
    case 4:
      unint64_t v2 = 0xD00000000000002DLL;
      id v5 = "com.apple.health.Sleep.sleepApneaNotification";
LABEL_6:
      unint64_t v3 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      goto LABEL_7;
    case 5:
      return;
    default:
LABEL_7:
      sub_1AD9B447C(0, (unint64_t *)&qword_1E9A4D028, (uint64_t (*)(uint64_t))sub_1AD96E174, MEMORY[0x1E4FBBE00]);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
      sub_1AD9DF710();
      swift_bridgeObjectRetain();
      sub_1AD9DF790();
      sub_1AD9DF790();
      uint64_t v7 = MEMORY[0x1E4FBB1A0];
      sub_1AD9DFFE0();
      *(void *)(inited + 96) = v7;
      *(void *)(inited + 72) = v2;
      *(void *)(inited + 80) = v3;
      swift_bridgeObjectRetain();
      sub_1AD863F18(inited);
      uint64_t v8 = (void *)sub_1AD9DF5F0();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_addUserInfoEntriesFromDictionary_, v8);
      swift_bridgeObjectRelease_n();

      return;
  }
}

void (*NSUserActivity.articleIdentifier.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  unint64_t v2 = a1 + 1;
  uint64_t v3 = sub_1AD83F638();
  if (v4) {
    ArticleIdentifier.init(rawValue:)(*(Swift::String *)&v3);
  }
  else {
    *unint64_t v2 = 5;
  }
  return sub_1AD9B060C;
}

void sub_1AD9B060C(uint64_t a1, char a2)
{
  if (a2)
  {
    char v3 = *(unsigned char *)(a1 + 8);
    unint64_t v2 = &v3;
  }
  else
  {
    char v4 = *(unsigned char *)(a1 + 8);
    unint64_t v2 = &v4;
  }
  NSUserActivity.articleIdentifier.setter(v2);
}

uint64_t sub_1AD9B0654()
{
  sub_1AD83F638();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1AD9B06A0()
{
  return sub_1AD83F778();
}

uint64_t sub_1AD9B06C8()
{
  return sub_1AD83F778();
}

uint64_t sub_1AD9B06F0()
{
  sub_1AD83F638();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1AD9B073C()
{
  sub_1AD83F638();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static URL.sleepRoom(route:presentWithAnimation:provenance:articleIdentifier:)@<X0>(void *a1@<X0>, char a2@<W1>, void *a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a5;
  sub_1AD9B447C(0, &qword_1E9A4CE80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = sub_1AD9DC8A0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a4;
  sub_1AD9DF710();
  sub_1AD9DD250();
  swift_bridgeObjectRelease();
  unint64_t v28 = 47;
  unint64_t v29 = 0xE100000000000000;
  uint64_t v27 = v13;
  if (a1) {
    sub_1AD9DF710();
  }
  id v19 = a1;
  sub_1AD9DF790();
  swift_bridgeObjectRelease();
  sub_1AD9DC890();

  if (a2 == 2) {
    unsigned __int8 v20 = 2;
  }
  else {
    unsigned __int8 v20 = a2 & 1;
  }
  sub_1AD9B2AE4(v20, 2);
  id v21 = objc_msgSend(a3, sel_source);
  sub_1AD9B30B0(v21, 4);

  id v22 = objc_msgSend(a3, sel_presentation);
  sub_1AD9B30B0(v22, 5);

  sub_1AD9B367C(v18, (char *)6);
  sub_1AD9DC870();
  uint64_t v23 = sub_1AD9DCB80();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v12, 1, v23) == 1)
  {
    sub_1AD9B440C((uint64_t)v12, &qword_1E9A4CE80, MEMORY[0x1E4F276F0]);
    unint64_t v28 = 0;
    unint64_t v29 = 0xE000000000000000;
    sub_1AD9E0030();
    swift_bridgeObjectRelease();
    unint64_t v28 = 0xD00000000000001ALL;
    unint64_t v29 = 0x80000001AD9F7450;
    sub_1AD9B43B4();
    sub_1AD9E0280();
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1AD9E0140();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v27);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v26, v12, v23);
  }
  return result;
}

uint64_t static URLComponents.plugin.getter()
{
  sub_1AD9DF710();
  sub_1AD9DD250();
  return swift_bridgeObjectRelease();
}

void URLComponents.route.setter(void *a1)
{
  if (a1) {
    sub_1AD9DF710();
  }
  sub_1AD9DF790();
  swift_bridgeObjectRelease();
  sub_1AD9DC890();
}

void URLComponents.presentWithAnimation.setter(char a1)
{
  if (a1 == 2) {
    unsigned __int8 v1 = 2;
  }
  else {
    unsigned __int8 v1 = a1 & 1;
  }
  sub_1AD9B2AE4(v1, 2);
}

void URLComponents.provenanceSource.setter(void *a1)
{
  sub_1AD9B30B0(a1, 4);
}

void URLComponents.provenancePresentation.setter(void *a1)
{
  sub_1AD9B30B0(a1, 5);
}

void URLComponents.articleIdentifier.setter(unsigned __int8 *a1)
{
}

uint64_t URL.route.getter()
{
  return sub_1AD9B12E4(URLComponents.route.getter);
}

uint64_t URLComponents.route.getter()
{
  sub_1AD9DC880();
  unint64_t v0 = sub_1AD85F688();
  unsigned __int8 v1 = (void *)MEMORY[0x1B3E6BEB0](47, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x1E4FBB1A0], v0);
  swift_bridgeObjectRelease();
  if (v1[2])
  {
    uint64_t v2 = v1[4];
    uint64_t v3 = v1[5];
    uint64_t v4 = v1[6];
    uint64_t v5 = v1[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    MEMORY[0x1B3E6B6F0](v2, v3, v4, v5);
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v6;
}

uint64_t URL.presentWithAnimation.getter()
{
  return sub_1AD9B0DEC(sub_1AD9B2728);
}

uint64_t URLComponents.presentWithAnimation.getter()
{
  char v0 = sub_1AD9B2728();
  if (v0 == 2) {
    return 2;
  }
  else {
    return v0 & 1;
  }
}

uint64_t URL.delayScrollToSchedule.getter()
{
  return sub_1AD9B0DEC(sub_1AD9B3D4C);
}

uint64_t sub_1AD9B0DEC(uint64_t (*a1)(void))
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v11 - v4;
  sub_1AD9DC860();
  uint64_t v6 = sub_1AD9DC8A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1AD9B440C((uint64_t)v5, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    return 2;
  }
  else
  {
    char v9 = a1();
    if (v9 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v9 & 1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return v8;
}

uint64_t URLComponents.delayScrollToSchedule.getter()
{
  char v0 = sub_1AD9B3D4C();
  if (v0 == 2) {
    return 2;
  }
  else {
    return v0 & 1;
  }
}

uint64_t URL.provenanceSource.getter()
{
  return sub_1AD9B12E4(URLComponents.provenanceSource.getter);
}

uint64_t URLComponents.provenanceSource.getter()
{
  uint64_t v0 = sub_1AD9DC830();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9B447C(0, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)v23 - v7;
  uint64_t v9 = sub_1AD9DC840();
  if (!v9) {
    return 0;
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v24 = v8;
    uint64_t v25 = v1;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v12 = v1 + 16;
    uint64_t v11 = v13;
    unint64_t v14 = v9 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v15 = *(void *)(v12 + 56);
    v23[1] = v9;
    swift_bridgeObjectRetain();
    while (1)
    {
      v11(v4, v14, v0);
      if (sub_1AD9DC810() == 0x656372756F73 && v16 == 0xE600000000000000) {
        break;
      }
      char v17 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v12 - 8))(v4, v0);
      v14 += v15;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        uint64_t v8 = v24;
        uint64_t v1 = v25;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v8 = v24;
    uint64_t v1 = v25;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v8, v4, v0);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, v18, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0) == 1)
  {
    sub_1AD9B440C((uint64_t)v8, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0]);
    return 0;
  }
  sub_1AD9DC820();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
  if (!v20) {
    return 0;
  }
  uint64_t v21 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t URL.provenancePresentation.getter()
{
  return sub_1AD9B12E4((uint64_t (*)(void))URLComponents.provenancePresentation.getter);
}

uint64_t sub_1AD9B12E4(uint64_t (*a1)(void))
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v10 - v4;
  sub_1AD9DC860();
  uint64_t v6 = sub_1AD9DC8A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1AD9B440C((uint64_t)v5, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    return 0;
  }
  else
  {
    uint64_t v8 = a1();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return v8;
}

id URLComponents.provenancePresentation.getter()
{
  uint64_t v0 = sub_1AD9DC830();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9B447C(0, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)v23 - v7;
  uint64_t v9 = sub_1AD9DC840();
  if (!v9) {
    return (id)*MEMORY[0x1E4FA5340];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v24 = v8;
    uint64_t v25 = v1;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v11 = v1 + 16;
    uint64_t v12 = v13;
    unint64_t v14 = v9 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    v23[1] = v9;
    swift_bridgeObjectRetain();
    while (1)
    {
      v12(v4, v14, v0);
      if (sub_1AD9DC810() == 0x61746E6573657270 && v16 == 0xEC0000006E6F6974) {
        break;
      }
      char v17 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v11 - 8))(v4, v0);
      v14 += v15;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        uint64_t v8 = v24;
        uint64_t v1 = v25;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v8 = v24;
    uint64_t v1 = v25;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v24, v4, v0);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, v18, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0) == 1)
  {
    sub_1AD9B440C((uint64_t)v8, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0]);
    return (id)*MEMORY[0x1E4FA5340];
  }
  sub_1AD9DC820();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
  if (!v20) {
    return (id)*MEMORY[0x1E4FA5340];
  }
  uint64_t v21 = sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return (id)v21;
}

uint64_t URL.articleIdentifier.getter@<X0>(unsigned char *a1@<X8>)
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v9 - v4;
  sub_1AD9DC860();
  uint64_t v6 = sub_1AD9DC8A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    uint64_t result = sub_1AD9B440C((uint64_t)v5, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    *a1 = 5;
  }
  else
  {
    URLComponents.articleIdentifier.getter(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return result;
}

char URLComponents.articleIdentifier.getter@<W0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = sub_1AD9DC830();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9B447C(0, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_1AD9DC840();
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v26 = v10;
    uint64_t v27 = v3;
    unint64_t v28 = a1;
    unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    uint64_t v13 = v3 + 16;
    id v30 = v14;
    unint64_t v15 = v11 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v25 = v11;
    swift_bridgeObjectRetain();
    unint64_t v29 = 0x80000001AD9F7410;
    while (1)
    {
      v30(v6, v15, v2);
      if (sub_1AD9DC810() == 0xD000000000000011 && v17 == v29) {
        break;
      }
      char v18 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v13 - 8))(v6, v2);
      v15 += v16;
      if (!--v12)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = 1;
        uint64_t v3 = v27;
        a1 = v28;
        uint64_t v10 = v26;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v10 = v26;
    uint64_t v3 = v27;
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v26, v6, v2);
    uint64_t v19 = 0;
    a1 = v28;
  }
  else
  {
    uint64_t v19 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v10, v19, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2) == 1)
  {
    LOBYTE(v1sub_1AD95AB40(6, 1) = sub_1AD9B440C((uint64_t)v10, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0]);
LABEL_16:
    *a1 = 5;
    return v11;
  }
  uint64_t v20 = sub_1AD9DC820();
  id v22 = v21;
  LOBYTE(v1sub_1AD95AB40(6, 1) = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v10, v2);
  if (!v22) {
    goto LABEL_16;
  }
  v23._uint64_t countAndFlagsBits = v20;
  v23._object = v22;
  LOBYTE(v1sub_1AD95AB40(6, 1) = ArticleIdentifier.init(rawValue:)(v23);
  return v11;
}

uint64_t URL.userActivity.getter()
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v0 - 8, v1);
  unint64_t v46 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3, v4);
  id v45 = (char *)&v44 - v5;
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v44 = (char *)&v44 - v8;
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (char *)&v44 - v11;
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v44 - v15;
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)&v44 - v19;
  MEMORY[0x1F4188790](v21, v22);
  uint64_t v24 = (char *)&v44 - v23;
  sub_1AD9DC860();
  sub_1AD9DF710();
  uint64_t v25 = sub_1AD9DD240();
  swift_bridgeObjectRelease();
  sub_1AD9AF790(1, 0);
  sub_1AD9B44E0((uint64_t)v24, (uint64_t)v20);
  uint64_t v26 = sub_1AD9DC8A0();
  uint64_t v27 = *(void *)(v26 - 8);
  unint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  if (v28(v20, 1, v26) == 1)
  {
    sub_1AD9B440C((uint64_t)v20, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    unint64_t v29 = 0;
  }
  else
  {
    unint64_t v29 = (void *)URLComponents.route.getter();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v26);
  }
  NSUserActivity.route.setter(v29);
  sub_1AD9B44E0((uint64_t)v24, (uint64_t)v16);
  unsigned int v30 = v28(v16, 1, v26);
  uint64_t v31 = (uint64_t)v44;
  if (v30 == 1)
  {
    sub_1AD9B440C((uint64_t)v16, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    char v32 = 2;
  }
  else
  {
    char v33 = sub_1AD9B2728();
    if (v33 == 2) {
      char v32 = 2;
    }
    else {
      char v32 = v33 & 1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v26);
  }
  NSUserActivity.presentWithAnimation.setter(v32);
  sub_1AD9B44E0((uint64_t)v24, (uint64_t)v12);
  unsigned int v34 = v28(v12, 1, v26);
  uint64_t v35 = (uint64_t)v45;
  if (v34 == 1)
  {
    sub_1AD9B440C((uint64_t)v12, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    char v36 = 2;
  }
  else
  {
    char v37 = sub_1AD9B3D4C();
    if (v37 == 2) {
      char v36 = 2;
    }
    else {
      char v36 = v37 & 1;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v26);
  }
  NSUserActivity.delayScrollToSchedule.setter(v36);
  sub_1AD9B44E0((uint64_t)v24, v31);
  unsigned int v38 = v28((char *)v31, 1, v26);
  uint64_t v39 = (uint64_t)v46;
  if (v38 == 1)
  {
    sub_1AD9B440C(v31, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    unint64_t v40 = 0;
  }
  else
  {
    unint64_t v40 = (void *)URLComponents.provenanceSource.getter();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v31, v26);
  }
  NSUserActivity.provenanceSource.setter(v40);
  sub_1AD9B44E0((uint64_t)v24, v35);
  if (v28((char *)v35, 1, v26) == 1)
  {
    sub_1AD9B440C(v35, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    id v41 = 0;
  }
  else
  {
    id v41 = URLComponents.provenancePresentation.getter();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v35, v26);
  }
  NSUserActivity.provenancePresentation.setter(v41);
  sub_1AD9B44E0((uint64_t)v24, v39);
  if (v28((char *)v39, 1, v26) == 1)
  {
    sub_1AD9B440C(v39, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    char v42 = 5;
  }
  else
  {
    URLComponents.articleIdentifier.getter(&v47);
    char v42 = v47;
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v39, v26);
  }
  char v48 = v42;
  NSUserActivity.articleIdentifier.setter(&v48);
  sub_1AD9B440C((uint64_t)v24, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
  return v25;
}

uint64_t sub_1AD9B21F4(uint64_t a1, uint64_t a2)
{
  return sub_1AD9B23DC(a1, a2, URLComponents.route.getter);
}

uint64_t sub_1AD9B220C(uint64_t a1, uint64_t a2)
{
  return sub_1AD9B223C(a1, a2, sub_1AD9B2728);
}

uint64_t sub_1AD9B2224(uint64_t a1, uint64_t a2)
{
  return sub_1AD9B223C(a1, a2, sub_1AD9B3D4C);
}

uint64_t sub_1AD9B223C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v13 - v6;
  sub_1AD9DC860();
  uint64_t v8 = sub_1AD9DC8A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1AD9B440C((uint64_t)v7, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    return 2;
  }
  else
  {
    char v11 = a3();
    if (v11 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v11 & 1;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  return v10;
}

uint64_t sub_1AD9B23AC(uint64_t a1, uint64_t a2)
{
  return sub_1AD9B23DC(a1, a2, URLComponents.provenanceSource.getter);
}

uint64_t sub_1AD9B23C4(uint64_t a1, uint64_t a2)
{
  return sub_1AD9B23DC(a1, a2, (uint64_t (*)(void))URLComponents.provenancePresentation.getter);
}

uint64_t sub_1AD9B23DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v12 - v6;
  sub_1AD9DC860();
  uint64_t v8 = sub_1AD9DC8A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1AD9B440C((uint64_t)v7, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8]);
    return 0;
  }
  else
  {
    uint64_t v10 = a3();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  return v10;
}

void sub_1AD9B2540(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1) {
    sub_1AD9DF710();
  }
  id v2 = v1;
  sub_1AD9DF790();
  swift_bridgeObjectRelease();
  sub_1AD9DC890();
}

void (*URLComponents.route.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = URLComponents.route.getter();
  return sub_1AD9B2628;
}

void sub_1AD9B2628(void **a1, char a2)
{
  uint64_t v3 = *a1;
  if (a2)
  {
    if (v3)
    {
      id v6 = v3;
      sub_1AD9DF710();
      uint64_t v3 = v6;
    }
    id v4 = v3;
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    sub_1AD9DC890();

    uint64_t v5 = *a1;
  }
  else
  {
    id v7 = v3;
    if (v3) {
      sub_1AD9DF710();
    }
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    sub_1AD9DC890();
    uint64_t v5 = v7;
  }
}

uint64_t sub_1AD9B2728()
{
  uint64_t v0 = sub_1AD9DC830();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  id v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9B447C(0, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)v24 - v7;
  uint64_t v9 = sub_1AD9DC840();
  if (!v9) {
    return 2;
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v25 = v8;
    uint64_t v26 = v1;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v11 = v1 + 16;
    unint64_t v28 = v12;
    unint64_t v13 = v9 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    v24[1] = v9;
    swift_bridgeObjectRetain();
    unint64_t v27 = 0x80000001AD9F73D0;
    while (1)
    {
      v28(v4, v13, v0);
      if (sub_1AD9DC810() == 0xD000000000000014 && v15 == v27) {
        break;
      }
      char v16 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v11 - 8))(v4, v0);
      v13 += v14;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v17 = 1;
        uint64_t v8 = v25;
        uint64_t v1 = v26;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v8 = v25;
    uint64_t v1 = v26;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v25, v4, v0);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, v17, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0) != 1)
  {
    uint64_t v19 = sub_1AD9DC820();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
    if (v21)
    {
      if (v19 == 48 && v21 == 0xE100000000000000)
      {
        uint64_t v18 = 0;
LABEL_22:
        swift_bridgeObjectRelease();
        return v18;
      }
      uint64_t v18 = 0;
      if (sub_1AD9E02D0()) {
        goto LABEL_22;
      }
      if (v19 == 49 && v21 == 0xE100000000000000)
      {
        uint64_t v18 = 1;
        goto LABEL_22;
      }
      char v22 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v22) {
        return 1;
      }
    }
    return 2;
  }
  sub_1AD9B440C((uint64_t)v8, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0]);
  return 2;
}

void sub_1AD9B2AE4(unsigned __int8 a1, uint64_t a2)
{
  int v5 = a1;
  uint64_t v6 = sub_1AD9DC830();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  char v48 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v11);
  unint64_t v13 = (char *)v38 - v12;
  MEMORY[0x1F4188790](v14, v15);
  if (v5 == 2) {
    return;
  }
  uint64_t v44 = a2;
  v38[1] = v5;
  uint64_t v39 = (char *)v38 - v16;
  uint64_t v40 = v2;
  uint64_t v17 = sub_1AD9DC840();
  uint64_t v18 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v46 = v7;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v52 = *(void *)(v17 + 16);
    uint64_t v53 = (void *)MEMORY[0x1E4FBC860];
    if (v52)
    {
      unint64_t v20 = 0;
      char v47 = (void (**)(char *, char *, uint64_t))(v7 + 32);
      uint64_t v49 = (void (**)(char *, uint64_t))(v7 + 8);
      uint64_t v50 = v44;
      uint64_t v51 = v7 + 16;
      char v42 = "presentWithAnimation";
      BOOL v43 = "eepScheduleDayPicker.swift";
      unint64_t v41 = (unint64_t)"delayScrollToSchedule";
      uint64_t v45 = v6;
      while (2)
      {
        if (v20 >= *(void *)(v19 + 16))
        {
          __break(1u);
          goto LABEL_37;
        }
        unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
        uint64_t v22 = *(void *)(v7 + 72);
        unint64_t v23 = v20 + 1;
        (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v13, v19 + v21 + v22 * v20, v6);
        uint64_t v24 = sub_1AD9DC810();
        unint64_t v26 = 0xE700000000000000;
        uint64_t v18 = v25;
        uint64_t v27 = 0x6E6F6973726576;
        switch(v50)
        {
          case 1:
            unint64_t v26 = 0xE500000000000000;
            if (v24 == 0x6574756F72) {
              goto LABEL_20;
            }
            goto LABEL_21;
          case 2:
            unint64_t v28 = 0xD000000000000014;
            unint64_t v29 = (unint64_t)v43;
            goto LABEL_14;
          case 3:
            unint64_t v28 = 0xD000000000000015;
            unint64_t v29 = (unint64_t)v42;
LABEL_14:
            unint64_t v26 = v29 | 0x8000000000000000;
            if (v24 != v28) {
              goto LABEL_21;
            }
            goto LABEL_20;
          case 4:
            unint64_t v26 = 0xE600000000000000;
            if (v24 != 0x656372756F73) {
              goto LABEL_21;
            }
            goto LABEL_20;
          case 5:
            uint64_t v27 = 0x61746E6573657270;
            unint64_t v26 = 0xEC0000006E6F6974;
            goto LABEL_19;
          case 6:
            unint64_t v26 = v41 | 0x8000000000000000;
            if (v24 != 0xD000000000000011) {
              goto LABEL_21;
            }
            goto LABEL_20;
          default:
LABEL_19:
            if (v24 != v27) {
              goto LABEL_21;
            }
LABEL_20:
            if (v25 == (void *)v26)
            {
              swift_bridgeObjectRelease_n();
LABEL_6:
              (*v49)(v13, v6);
              goto LABEL_7;
            }
LABEL_21:
            uint64_t v3 = sub_1AD9E02D0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v3) {
              goto LABEL_6;
            }
            unsigned int v30 = *v47;
            (*v47)(v48, v13, v6);
            uint64_t v31 = v53;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              uint64_t v18 = &v53;
              sub_1AD8A27B8(0, v31[2] + 1, 1);
              uint64_t v31 = v53;
            }
            unint64_t v33 = v31[2];
            unint64_t v32 = v31[3];
            uint64_t v3 = v33 + 1;
            if (v33 >= v32 >> 1)
            {
              uint64_t v18 = &v53;
              sub_1AD8A27B8(v32 > 1, v33 + 1, 1);
              uint64_t v31 = v53;
            }
            v31[2] = v3;
            unint64_t v34 = (unint64_t)v31 + v21 + v33 * v22;
            uint64_t v6 = v45;
            v30((char *)v34, v48, v45);
            uint64_t v53 = v31;
            uint64_t v7 = v46;
LABEL_7:
            unint64_t v20 = v23;
            if (v52 != v23) {
              continue;
            }
            uint64_t v18 = v53;
            break;
        }
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v3 = (uint64_t)v39;
  sub_1AD9DC800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_37:
  }
    uint64_t v18 = (void *)sub_1AD99AF8C(0, v18[2] + 1, 1, (unint64_t)v18);
  uint64_t v35 = v46;
  unint64_t v37 = v18[2];
  unint64_t v36 = v18[3];
  if (v37 >= v36 >> 1) {
    uint64_t v18 = (void *)sub_1AD99AF8C(v36 > 1, v37 + 1, 1, (unint64_t)v18);
  }
  long long v18[2] = v37 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v35 + 32))((unint64_t)v18+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v37, v3, v6);
  sub_1AD9DC850();
}

void sub_1AD9B30B0(void *a1, uint64_t a2)
{
  uint64_t v7 = sub_1AD9DC830();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v44 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v14 = (char *)v36 - v13;
  MEMORY[0x1F4188790](v15, v16);
  unint64_t v41 = (char *)v36 - v17;
  if (!a1) {
    return;
  }
  uint64_t v40 = a2;
  v36[1] = a1;
  v36[0] = a1;
  v36[2] = v2;
  uint64_t v18 = sub_1AD9DC840();
  unint64_t v19 = MEMORY[0x1E4FBC860];
  if (v18)
  {
    uint64_t v20 = v18;
    char v48 = *(char **)(v18 + 16);
    unint64_t v49 = MEMORY[0x1E4FBC860];
    if (v48)
    {
      unint64_t v21 = 0;
      uint64_t v42 = v7;
      BOOL v43 = (void (**)(char *, char *, uint64_t))(v8 + 32);
      uint64_t v45 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v46 = v40;
      uint64_t v47 = v8 + 16;
      unsigned int v38 = "presentWithAnimation";
      uint64_t v39 = "eepScheduleDayPicker.swift";
      unint64_t v37 = (unint64_t)"delayScrollToSchedule";
      while (2)
      {
        if ((unint64_t)v21 >= *(void *)(v20 + 16))
        {
          __break(1u);
          goto LABEL_37;
        }
        unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
        uint64_t v22 = *(void *)(v8 + 72);
        uint64_t v3 = v21 + 1;
        (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v14, v20 + v19 + v22 * (void)v21, v7);
        uint64_t v23 = sub_1AD9DC810();
        id v4 = (void *)0xE700000000000000;
        uint64_t v25 = 0x6E6F6973726576;
        switch(v46)
        {
          case 1:
            id v4 = (void *)0xE500000000000000;
            if (v23 == 0x6574756F72) {
              goto LABEL_20;
            }
            goto LABEL_21;
          case 2:
            unint64_t v26 = 0xD000000000000014;
            unint64_t v27 = (unint64_t)v39;
            goto LABEL_14;
          case 3:
            unint64_t v26 = 0xD000000000000015;
            unint64_t v27 = (unint64_t)v38;
LABEL_14:
            id v4 = (void *)(v27 | 0x8000000000000000);
            if (v23 != v26) {
              goto LABEL_21;
            }
            goto LABEL_20;
          case 4:
            id v4 = (void *)0xE600000000000000;
            if (v23 != 0x656372756F73) {
              goto LABEL_21;
            }
            goto LABEL_20;
          case 5:
            uint64_t v25 = 0x61746E6573657270;
            id v4 = (void *)0xEC0000006E6F6974;
            goto LABEL_19;
          case 6:
            id v4 = (void *)(v37 | 0x8000000000000000);
            if (v23 != 0xD000000000000011) {
              goto LABEL_21;
            }
            goto LABEL_20;
          default:
LABEL_19:
            if (v23 != v25) {
              goto LABEL_21;
            }
LABEL_20:
            if (v24 == v4)
            {
              swift_bridgeObjectRelease_n();
LABEL_6:
              (*v45)(v14, v7);
              goto LABEL_7;
            }
LABEL_21:
            char v28 = sub_1AD9E02D0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v28) {
              goto LABEL_6;
            }
            unint64_t v29 = *v43;
            (*v43)(v44, v14, v7);
            unint64_t v30 = v49;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_1AD8A27B8(0, *(void *)(v30 + 16) + 1, 1);
              unint64_t v30 = v49;
            }
            unint64_t v32 = *(void *)(v30 + 16);
            unint64_t v31 = *(void *)(v30 + 24);
            id v4 = (void *)(v32 + 1);
            if (v32 >= v31 >> 1)
            {
              sub_1AD8A27B8(v31 > 1, v32 + 1, 1);
              unint64_t v30 = v49;
            }
            *(void *)(v30 + 16) = v4;
            unint64_t v33 = v30 + v19 + v32 * v22;
            uint64_t v7 = v42;
            v29((char *)v33, v44, v42);
            unint64_t v49 = v30;
LABEL_7:
            unint64_t v21 = v3;
            if (v48 != v3) {
              continue;
            }
            unint64_t v19 = v49;
            break;
        }
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v3 = v41;
  id v4 = (void *)v36[0];
  sub_1AD9DF710();
  sub_1AD9DC800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_37:
  }
    unint64_t v19 = sub_1AD99AF8C(0, *(void *)(v19 + 16) + 1, 1, v19);
  unint64_t v35 = *(void *)(v19 + 16);
  unint64_t v34 = *(void *)(v19 + 24);
  if (v35 >= v34 >> 1) {
    unint64_t v19 = sub_1AD99AF8C(v34 > 1, v35 + 1, 1, v19);
  }
  *(void *)(v19 + 16) = v35 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v19+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v35, v3, v7);
  sub_1AD9DC850();
}

void sub_1AD9B367C(uint64_t a1, char *a2)
{
  int v5 = a1;
  uint64_t v6 = sub_1AD9DC830();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v47 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v13 = (char *)&v37 - v12;
  MEMORY[0x1F4188790](v14, v15);
  if (v5 == 5) {
    return;
  }
  BOOL v43 = a2;
  uint64_t v37 = a1;
  unsigned int v38 = (char *)&v37 - v16;
  uint64_t v39 = v2;
  uint64_t v17 = sub_1AD9DC840();
  uint64_t v18 = (void *)MEMORY[0x1E4FBC860];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v51 = *(char **)(v17 + 16);
    uint64_t v52 = (void *)MEMORY[0x1E4FBC860];
    if (v51)
    {
      uint64_t v20 = 0;
      uint64_t v45 = v6;
      uint64_t v46 = (void (**)(char *, char *, uint64_t))(v7 + 32);
      char v48 = (void (**)(char *, uint64_t))(v7 + 8);
      uint64_t v49 = v43;
      uint64_t v50 = v7 + 16;
      unint64_t v41 = "presentWithAnimation";
      uint64_t v42 = "eepScheduleDayPicker.swift";
      unint64_t v40 = (unint64_t)"delayScrollToSchedule";
      uint64_t v44 = v7;
      while (2)
      {
        if ((unint64_t)v20 >= *(void *)(v19 + 16))
        {
          __break(1u);
          goto LABEL_37;
        }
        unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
        uint64_t v22 = *(void *)(v7 + 72);
        a2 = v20 + 1;
        (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v13, v19 + v21 + v22 * (void)v20, v6);
        uint64_t v23 = sub_1AD9DC810();
        unint64_t v25 = 0xE700000000000000;
        uint64_t v18 = v24;
        uint64_t v26 = 0x6E6F6973726576;
        switch(v49)
        {
          case 1:
            unint64_t v25 = 0xE500000000000000;
            if (v23 == 0x6574756F72) {
              goto LABEL_20;
            }
            goto LABEL_21;
          case 2:
            unint64_t v27 = 0xD000000000000014;
            unint64_t v28 = (unint64_t)v42;
            goto LABEL_14;
          case 3:
            unint64_t v27 = 0xD000000000000015;
            unint64_t v28 = (unint64_t)v41;
LABEL_14:
            unint64_t v25 = v28 | 0x8000000000000000;
            if (v23 != v27) {
              goto LABEL_21;
            }
            goto LABEL_20;
          case 4:
            unint64_t v25 = 0xE600000000000000;
            if (v23 != 0x656372756F73) {
              goto LABEL_21;
            }
            goto LABEL_20;
          case 5:
            uint64_t v26 = 0x61746E6573657270;
            unint64_t v25 = 0xEC0000006E6F6974;
            goto LABEL_19;
          case 6:
            unint64_t v25 = v40 | 0x8000000000000000;
            if (v23 != 0xD000000000000011) {
              goto LABEL_21;
            }
            goto LABEL_20;
          default:
LABEL_19:
            if (v23 != v26) {
              goto LABEL_21;
            }
LABEL_20:
            if (v24 == (void *)v25)
            {
              swift_bridgeObjectRelease_n();
LABEL_6:
              (*v48)(v13, v6);
              goto LABEL_7;
            }
LABEL_21:
            char v29 = sub_1AD9E02D0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v29) {
              goto LABEL_6;
            }
            unint64_t v30 = *v46;
            (*v46)(v47, v13, v6);
            unint64_t v31 = v52;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              uint64_t v18 = &v52;
              sub_1AD8A27B8(0, v31[2] + 1, 1);
              unint64_t v31 = v52;
            }
            unint64_t v33 = v31[2];
            unint64_t v32 = v31[3];
            if (v33 >= v32 >> 1)
            {
              uint64_t v18 = &v52;
              sub_1AD8A27B8(v32 > 1, v33 + 1, 1);
              unint64_t v31 = v52;
            }
            v31[2] = v33 + 1;
            unint64_t v34 = (unint64_t)v31 + v21 + v33 * v22;
            uint64_t v6 = v45;
            v30((char *)v34, v47, v45);
            uint64_t v52 = v31;
            uint64_t v7 = v44;
LABEL_7:
            uint64_t v20 = a2;
            if (v51 != a2) {
              continue;
            }
            uint64_t v18 = v52;
            break;
        }
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  a2 = v38;
  sub_1AD9DC800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_37:
  }
    uint64_t v18 = (void *)sub_1AD99AF8C(0, v18[2] + 1, 1, (unint64_t)v18);
  unint64_t v36 = v18[2];
  unint64_t v35 = v18[3];
  if (v36 >= v35 >> 1) {
    uint64_t v18 = (void *)sub_1AD99AF8C(v35 > 1, v36 + 1, 1, (unint64_t)v18);
  }
  long long v18[2] = v36 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v18+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v36, a2, v6);
  sub_1AD9DC850();
}

void (*URLComponents.presentWithAnimation.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = v1;
  char v3 = sub_1AD9B2728();
  if (v3 == 2) {
    char v4 = 2;
  }
  else {
    char v4 = v3 & 1;
  }
  *(unsigned char *)(a1 + 8) = v4;
  return sub_1AD9B3D44;
}

void sub_1AD9B3D44(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1AD9B3D4C()
{
  uint64_t v0 = sub_1AD9DC830();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  char v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9B447C(0, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)v24 - v7;
  uint64_t v9 = sub_1AD9DC840();
  if (!v9) {
    return 2;
  }
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    unint64_t v25 = v8;
    uint64_t v26 = v1;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v11 = v1 + 16;
    unint64_t v28 = v12;
    unint64_t v13 = v9 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    v24[1] = v9;
    swift_bridgeObjectRetain();
    unint64_t v27 = 0x80000001AD9F73F0;
    while (1)
    {
      v28(v4, v13, v0);
      if (sub_1AD9DC810() == 0xD000000000000015 && v15 == v27) {
        break;
      }
      char v16 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_11;
      }
      (*(void (**)(char *, uint64_t))(v11 - 8))(v4, v0);
      v13 += v14;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v17 = 1;
        uint64_t v8 = v25;
        uint64_t v1 = v26;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v8 = v25;
    uint64_t v1 = v26;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v25, v4, v0);
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, v17, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0) != 1)
  {
    uint64_t v19 = sub_1AD9DC820();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
    if (v21)
    {
      if (v19 == 48 && v21 == 0xE100000000000000)
      {
        uint64_t v18 = 0;
LABEL_22:
        swift_bridgeObjectRelease();
        return v18;
      }
      uint64_t v18 = 0;
      if (sub_1AD9E02D0()) {
        goto LABEL_22;
      }
      if (v19 == 49 && v21 == 0xE100000000000000)
      {
        uint64_t v18 = 1;
        goto LABEL_22;
      }
      char v22 = sub_1AD9E02D0();
      swift_bridgeObjectRelease();
      if (v22) {
        return 1;
      }
    }
    return 2;
  }
  sub_1AD9B440C((uint64_t)v8, &qword_1E9A4D8F0, MEMORY[0x1E4F26EA0]);
  return 2;
}

void URLComponents.delayScrollToSchedule.setter(char a1)
{
  if (a1 == 2) {
    unsigned __int8 v1 = 2;
  }
  else {
    unsigned __int8 v1 = a1 & 1;
  }
  sub_1AD9B2AE4(v1, 3);
}

void (*URLComponents.delayScrollToSchedule.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = v1;
  char v3 = sub_1AD9B3D4C();
  if (v3 == 2) {
    char v4 = 2;
  }
  else {
    char v4 = v3 & 1;
  }
  *(unsigned char *)(a1 + 8) = v4;
  return sub_1AD9B4178;
}

void sub_1AD9B4178(uint64_t a1, uint64_t a2)
{
}

void sub_1AD9B4180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 == 2) {
    unsigned __int8 v4 = 2;
  }
  else {
    unsigned __int8 v4 = v3 & 1;
  }
  sub_1AD9B2AE4(v4, a3);
}

void (*URLComponents.provenanceSource.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = URLComponents.provenanceSource.getter();
  return sub_1AD9B4200;
}

void sub_1AD9B4200(void **a1, char a2)
{
}

void (*URLComponents.provenancePresentation.modify(id *a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = URLComponents.provenancePresentation.getter();
  return sub_1AD9B4250;
}

void sub_1AD9B4250(void **a1, char a2)
{
}

void sub_1AD9B4258(void **a1, char a2, uint64_t a3)
{
  id v6 = *a1;
  if (a2)
  {
    id v4 = v6;
    sub_1AD9B30B0(v6, a3);

    uint64_t v5 = v4;
  }
  else
  {
    sub_1AD9B30B0(*a1, a3);
    uint64_t v5 = v6;
  }
}

void (*URLComponents.articleIdentifier.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  URLComponents.articleIdentifier.getter((unsigned char *)(a1 + 8));
  return sub_1AD9B432C;
}

void sub_1AD9B432C(uint64_t a1)
{
}

uint64_t sub_1AD9B435C()
{
  char v0 = sub_1AD9B2728();
  if (v0 == 2) {
    return 2;
  }
  else {
    return v0 & 1;
  }
}

uint64_t sub_1AD9B4384()
{
  char v0 = sub_1AD9B3D4C();
  if (v0 == 2) {
    return 2;
  }
  else {
    return v0 & 1;
  }
}

unint64_t sub_1AD9B43B4()
{
  unint64_t result = qword_1E9A4D8E0;
  if (!qword_1E9A4D8E0)
  {
    sub_1AD9DC8A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D8E0);
  }
  return result;
}

uint64_t sub_1AD9B440C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1AD9B447C(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1AD9B447C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1AD9B44E0(uint64_t a1, uint64_t a2)
{
  sub_1AD9B447C(0, &qword_1E9A4D8E8, MEMORY[0x1E4F26ED8], MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1AD9B4578(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  NSUserActivity.route.setter(v1);
}

uint64_t sub_1AD9B45A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AD83F778();
  *a1 = result;
  return result;
}

void sub_1AD9B45D8(char *a1)
{
}

uint64_t sub_1AD9B4600@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1AD83F778();
  *a1 = result;
  return result;
}

void sub_1AD9B4630(char *a1)
{
}

void sub_1AD9B465C(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  NSUserActivity.provenanceSource.setter(v1);
}

void sub_1AD9B4690(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  NSUserActivity.provenancePresentation.setter(v1);
}

void sub_1AD9B46C4(char *a1)
{
  char v1 = *a1;
  NSUserActivity.articleIdentifier.setter(&v1);
}

uint64_t sub_1AD9B46FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = URLComponents.route.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1AD9B472C@<X0>(char *a1@<X8>)
{
  uint64_t result = sub_1AD9B2728();
  if (result == 2) {
    char v3 = 2;
  }
  else {
    char v3 = result & 1;
  }
  *a1 = v3;
  return result;
}

void sub_1AD9B4768(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1AD9B4770@<X0>(char *a1@<X8>)
{
  uint64_t result = sub_1AD9B3D4C();
  if (result == 2) {
    char v3 = 2;
  }
  else {
    char v3 = result & 1;
  }
  *a1 = v3;
  return result;
}

void sub_1AD9B47AC(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void keypath_set_16Tm(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = *a1;
  if (v5 == 2) {
    unsigned __int8 v6 = 2;
  }
  else {
    unsigned __int8 v6 = v5 & 1;
  }
  sub_1AD9B2AE4(v6, a5);
}

uint64_t sub_1AD9B47EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = URLComponents.provenanceSource.getter();
  *a1 = result;
  return result;
}

void sub_1AD9B4818(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_1AD9B30B0(v1, 4);
}

id sub_1AD9B486C@<X0>(void *a1@<X8>)
{
  id result = URLComponents.provenancePresentation.getter();
  *a1 = result;
  return result;
}

void sub_1AD9B4898(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_1AD9B30B0(v1, 5);
}

uint64_t sub_1AD9B48EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = URLComponents.articleIdentifier.getter(&v3);
  *a1 = v3;
  return result;
}

void sub_1AD9B4928(unsigned __int8 *a1)
{
}

uint64_t dispatch thunk of RouteProviding.route.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RouteOptionsProviding.presentWithAnimation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RouteOptionsProviding.delayScrollToSchedule.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RouteProvenanceProviding.provenanceSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RouteProvenanceProviding.provenancePresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness, v4);
  unsigned __int8 v6 = &v15[-v5];
  sub_1AD9DFA30();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  char v7 = sub_1AD9DF810();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, AssociatedTypeWitness);
  if (v7)
  {
    unint64_t v8 = (void (*)(unsigned char *, void))sub_1AD9DFAA0();
    uint64_t v10 = v9;
    uint64_t v11 = swift_getAssociatedTypeWitness();
    uint64_t v12 = *(void *)(v11 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a1, v10, v11);
    v8(v15, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  else
  {
    uint64_t v14 = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
}

uint64_t static ScheduleIssue.issues(bedtimeComponents:wakeUpComponents:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v5 = sub_1AD9DC990();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v12 = MEMORY[0x1F4188790](v10, v11);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, double))(v6 + 16);
  v15((char *)&v36 - v13, a1, v5, v12);
  uint64_t v16 = sub_1AD9DC8F0();
  if (v17) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v16;
  }
  uint64_t v36 = v18;
  uint64_t v19 = sub_1AD9DC940();
  char v21 = v20;
  char v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22(v14, v5);
  if (v21) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = v19;
  }
  ((void (*)(char *, uint64_t, uint64_t))v15)(v9, a2, v5);
  uint64_t v24 = sub_1AD9DC8F0();
  if (v25) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = v24;
  }
  uint64_t v27 = sub_1AD9DC940();
  char v29 = v28;
  v22(v9, v5);
  if (v29) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v27;
  }
  uint64_t result = sub_1AD8943E4(v36, v23, v26, v30);
  double v33 = v32;
  if (qword_1E9A49118 != -1) {
    uint64_t result = swift_once();
  }
  double v34 = *(double *)&qword_1E9A4D900;
  if (qword_1E9A49110 != -1) {
    uint64_t result = swift_once();
  }
  if (v33 < *(double *)&qword_1E9A4D8F8) {
    uint64_t v35 = (8 * (v34 < v33)) | 4;
  }
  else {
    uint64_t v35 = 8 * (v34 < v33);
  }
  *uint64_t v37 = v35;
  return result;
}

uint64_t ScheduleIssue.id.getter()
{
  return *(void *)v0;
}

uint64_t ScheduleIssue.rawValue.getter()
{
  return *(void *)v0;
}

SleepHealthUI::ScheduleIssue __swiftcall ScheduleIssue.init(rawValue:)(SleepHealthUI::ScheduleIssue rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ScheduleIssue.bedtimeConflictsWithPreviousDayWakeUp.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static ScheduleIssue.wakeUpConflictsWithNextDayBedtime.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static ScheduleIssue.scheduleIsTooShort.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static ScheduleIssue.scheduleIsTooLong.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static ScheduleIssue.scheduleConflictsWithOverride.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static ScheduleIssue.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL ScheduleIssue.isForConflict.getter()
{
  uint64_t v1 = unk_1F046A9C8;
  if ((unk_1F046A9C8 & ~qword_1F046A9C0) == 0) {
    uint64_t v1 = 0;
  }
  uint64_t v2 = qword_1F046A9D0;
  if ((qword_1F046A9D0 & ~(v1 | qword_1F046A9C0)) == 0) {
    uint64_t v2 = 0;
  }
  return ((v2 | v1 | qword_1F046A9C0) & *v0) != 0;
}

BOOL ScheduleIssue.isCorrectable.getter()
{
  return (qword_1F046A9F8 & *v0) != 0;
}

void sub_1AD9B4F58()
{
  qword_1E9A4D8F8 = 0x40AC200000000000;
}

void sub_1AD9B4F6C()
{
  qword_1E9A4D900 = 0x40F1940000000000;
}

unint64_t sub_1AD9B4F84()
{
  unint64_t result = qword_1E9A4D908;
  if (!qword_1E9A4D908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D908);
  }
  return result;
}

unint64_t sub_1AD9B4FDC()
{
  unint64_t result = qword_1E9A4D910;
  if (!qword_1E9A4D910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D910);
  }
  return result;
}

unint64_t sub_1AD9B5034()
{
  unint64_t result = qword_1E9A4D918;
  if (!qword_1E9A4D918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D918);
  }
  return result;
}

unint64_t sub_1AD9B508C()
{
  unint64_t result = qword_1E9A4D920;
  if (!qword_1E9A4D920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D920);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduleIssue()
{
  return &type metadata for ScheduleIssue;
}

id UIFontTextStyle.defaultFont.getter(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, *MEMORY[0x1E4FB27D0]);
  id v3 = objc_msgSend(self, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, a1, v2);

  return v3;
}

id static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5, char a6, char a7, uint64_t a8, char a9)
{
  uint64_t v15 = (objc_class *)objc_msgSend(self, sel_preferredFontDescriptorWithTextStyle_, a1);
  Class v16 = v15;
  if (a2)
  {
    char v17 = (objc_class *)[(objc_class *)v15 fontDescriptorWithSymbolicTraits:a2];
    if (v17)
    {
      uint64_t v18 = v17;

      Class v16 = v18;
    }
  }
  uint64_t v19 = &selRef_animateWithDuration_animations_;
  char v50 = a3;
  if (a9)
  {
    if ((a7 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_1AD9422A4(0, &qword_1E9A4C428, (unint64_t *)&qword_1E9A4C430, type metadata accessor for AttributeName);
    char v48 = a7;
    char v21 = a4;
    uint64_t inited = swift_initStackObject();
    long long v47 = xmmword_1AD9E3070;
    *(_OWORD *)(inited + 16) = xmmword_1AD9E3070;
    uint64_t v23 = (void *)*MEMORY[0x1E4FB0950];
    *(void *)(inited + 32) = *MEMORY[0x1E4FB0950];
    sub_1AD9B5780(0, &qword_1E9A4D928, (uint64_t (*)(uint64_t))sub_1AD9B57E4, MEMORY[0x1E4FBBE00]);
    uint64_t v24 = swift_initStackObject();
    *(_OWORD *)(v24 + 16) = xmmword_1AD9E3070;
    char v25 = a5;
    uint64_t v26 = (void *)*MEMORY[0x1E4FB09F0];
    *(void *)(v24 + 32) = *MEMORY[0x1E4FB09F0];
    *(void *)(v24 + 40) = a8;
    id v27 = v23;
    id v28 = v26;
    a5 = v25;
    unint64_t v29 = sub_1AD863CE0(v24);
    sub_1AD9B5854();
    *(void *)(inited + 64) = v30;
    *(void *)(inited + 40) = v29;
    uint64_t v31 = inited;
    a4 = v21;
    sub_1AD863C98(v31);
    type metadata accessor for AttributeName(0);
    sub_1AD9B5900((unint64_t *)&unk_1E9A4C450, type metadata accessor for AttributeName);
    uint64_t v19 = &selRef_animateWithDuration_animations_;
    double v32 = (void *)sub_1AD9DF5F0();
    swift_bridgeObjectRelease();
    double v33 = (objc_class *)[(objc_class *)v16 fontDescriptorByAddingAttributes:v32];

    Class v16 = v33;
    if ((v48 & 1) == 0)
    {
LABEL_6:
      if ((v50 & 1) == 0) {
        goto LABEL_7;
      }
LABEL_11:
      unint64_t v41 = (objc_class *)-[objc_class fontDescriptorWithDesign:](v16, sel_fontDescriptorWithDesign_, *MEMORY[0x1E4FB0938], v47);
      if (v41)
      {
        uint64_t v42 = v41;

        Class v16 = v42;
      }
      if (a4) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  sub_1AD9422A4(0, &qword_1E9A4C428, (unint64_t *)&qword_1E9A4C430, type metadata accessor for AttributeName);
  uint64_t v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_1AD9E3070;
  uint64_t v35 = (void *)*MEMORY[0x1E4FB0910];
  *(void *)(v34 + 32) = *MEMORY[0x1E4FB0910];
  id v36 = v35;
  uint64_t v37 = sub_1AD9B5628();
  sub_1AD9B5780(0, &qword_1E9A4C438, (uint64_t (*)(uint64_t))sub_1AD92F108, MEMORY[0x1E4FBB320]);
  *(void *)(v34 + 64) = v38;
  *(void *)(v34 + 40) = v37;
  sub_1AD863C98(v34);
  type metadata accessor for AttributeName(0);
  sub_1AD9B5900((unint64_t *)&unk_1E9A4C450, type metadata accessor for AttributeName);
  uint64_t v39 = (void *)sub_1AD9DF5F0();
  swift_bridgeObjectRelease();
  unint64_t v40 = (objc_class *)objc_msgSend(v16, v19[331], v39);

  Class v16 = v40;
  if (v50) {
    goto LABEL_11;
  }
LABEL_7:
  if (a4)
  {
LABEL_8:
    id v20 = -[objc_class fontDescriptorWithSymbolicTraits:](v16, sel_fontDescriptorWithSymbolicTraits_, 0x8000, v47);
    goto LABEL_16;
  }
LABEL_14:
  if ((a5 & 1) == 0) {
    goto LABEL_18;
  }
  id v20 = [(objc_class *)v16 fontDescriptorWithSymbolicTraits:0x10000];
LABEL_16:
  BOOL v43 = (objc_class *)v20;
  if (v43)
  {

    Class v16 = v43;
  }
LABEL_18:
  if (a6)
  {
    Class isa = UIFontDescriptor.addingUppercaseSmallCapsAttributes()().super.isa;

    Class v16 = isa;
  }
  id v45 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fontWithDescriptor_size_, v16, 0.0);

  return v45;
}

uint64_t sub_1AD9B5628()
{
  sub_1AD9B5780(0, &qword_1E9A4C8F0, (uint64_t (*)(uint64_t))sub_1AD92F108, MEMORY[0x1E4FBBE00]);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1AD9E3080;
  sub_1AD9422A4(0, &qword_1E9A4C8F8, &qword_1E9A4C900, type metadata accessor for FeatureKey);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AD9E3080;
  id v2 = (void *)*MEMORY[0x1E4FB28A0];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB28A0];
  *(void *)(inited + 40) = 6;
  id v3 = (void *)*MEMORY[0x1E4FB2890];
  *(void *)(inited + 48) = *MEMORY[0x1E4FB2890];
  *(void *)(inited + 56) = 0;
  id v4 = v2;
  id v5 = v3;
  *(void *)(v0 + 32) = sub_1AD863B9C(inited);
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_1AD9E3080;
  *(void *)(v6 + 32) = v4;
  *(void *)(v6 + 40) = 22;
  *(void *)(v6 + 48) = v5;
  *(void *)(v6 + 56) = 1;
  id v7 = v4;
  id v8 = v5;
  *(void *)(v0 + 40) = sub_1AD863B9C(v6);
  return v0;
}

void sub_1AD9B5780(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1AD9B57E4()
{
  if (!qword_1E9A4D930)
  {
    type metadata accessor for TraitKey(255);
    type metadata accessor for Weight(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A4D930);
    }
  }
}

void sub_1AD9B5854()
{
  if (!qword_1E9A4D938)
  {
    type metadata accessor for TraitKey(255);
    type metadata accessor for Weight(255);
    sub_1AD9B5900(&qword_1E9A496C8, type metadata accessor for TraitKey);
    unint64_t v0 = sub_1AD9DF610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D938);
    }
  }
}

uint64_t sub_1AD9B5900(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t static ScheduleOccurrenceAlarmSoundTableViewCell.defaultReuseIdentifier.getter()
{
  return 0xD000000000000029;
}

void sub_1AD9B5A58()
{
  id v1 = objc_msgSend(v0, sel_textLabel);
  if (v1)
  {
    id v2 = v1;
    if (qword_1EB724E38 != -1) {
      swift_once();
    }
    id v3 = (id)qword_1EB727930;
    sub_1AD9DCA70();

    id v4 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setText_, v4, 0xE000000000000000);
  }
  objc_msgSend(v0, sel_setAccessoryType_, 1);
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
  aBlock[4] = sub_1AD8F05CC;
  void aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD8F0900;
  aBlock[3] = &block_descriptor_38;
  uint64_t v6 = _Block_copy(aBlock);
  id v7 = objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v7);
}

void sub_1AD9B5C30()
{
  id v1 = v0;
  sub_1AD86E220(0, (unint64_t *)&qword_1EB725BD0, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD9E53A0;
  *(void *)(v2 + 32) = sub_1AD9DF710();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = 0x7065656C53;
  *(void *)(v2 + 56) = 0xE500000000000000;
  strcpy((char *)(v2 + 64), "ScheduleEditor");
  *(unsigned char *)(v2 + 79) = -18;
  uint64_t v14 = v2;
  sub_1AD86C2F8((uint64_t)&unk_1F046AA00);
  sub_1AD86E220(0, &qword_1EB725B60, MEMORY[0x1E4FBB320]);
  sub_1AD86E270();
  uint64_t v4 = sub_1AD9DF690();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  id v7 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v1, sel_setAccessibilityIdentifier_, v7, v14);

  id v8 = objc_msgSend(v1, sel_textLabel);
  if (v8)
  {
    uint64_t v9 = v8;
    swift_bridgeObjectRetain();
    sub_1AD9DF790();
    uint64_t v10 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setAccessibilityIdentifier_, v10, v4, v6);
  }
  id v11 = objc_msgSend(v1, sel_detailTextLabel);
  if (v11)
  {
    double v12 = v11;
    uint64_t v15 = v6;
    swift_bridgeObjectRetain();
    sub_1AD9DF790();
    swift_bridgeObjectRelease();
    uint64_t v13 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setAccessibilityIdentifier_, v13, v4, v15);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

id ScheduleOccurrenceAlarmSoundTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmSoundTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceAlarmSoundTableViewCell()
{
  return self;
}

void ScheduleOccurrenceAlarmSoundTableViewCell.apply(_:)()
{
  id v1 = objc_msgSend(v0, sel_detailTextLabel);
  if (v1)
  {
    objc_super v2 = v1;
    id v3 = objc_msgSend(self, sel_sharedToneManager);
    if (v3)
    {
      uint64_t v4 = v3;
      ScheduleOccurrenceEditModel.toneIdentifier.getter();
      if (v5)
      {
        uint64_t v6 = (void *)sub_1AD9DF6D0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v6 = 0;
      }
      id v7 = objc_msgSend(v4, sel_nameForToneIdentifier_, v6);

      objc_msgSend(v2, sel_setText_, v7);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1AD9B6024()
{
}

uint64_t method lookup function for ScheduleOccurrenceAlarmSoundTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ScheduleOccurrenceAlarmSoundTableViewCell);
}

uint64_t block_copy_helper_38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_38()
{
  return swift_release();
}

id static NSDateIntervalFormatter.dateIntervalWithYear.getter()
{
  return sub_1AD9B6094((SEL *)&selRef_hk_dayIntervalFormatter);
}

id static NSDateIntervalFormatter.dateIntervalWithoutYear.getter()
{
  return sub_1AD9B6094((SEL *)&selRef_hk_mediumMonthDayDateIntervalFormatter);
}

id sub_1AD9B6094(SEL *a1)
{
  id result = [self *a1];
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t static NSDateIntervalFormatter.eventDateRangeString(from:endDate:)()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C20]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 3);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  id v1 = (void *)sub_1AD9DCBB0();
  uint64_t v2 = (void *)sub_1AD9DCBB0();
  id v3 = objc_msgSend(v0, sel_stringFromDate_toDate_, v1, v2);

  uint64_t v4 = sub_1AD9DF710();
  return v4;
}

id _sSo23NSDateIntervalFormatterC13SleepHealthUIE15weeklyChartAxisABvgZ_0()
{
  sub_1AD9B644C();
  MEMORY[0x1F4188790](v0 - 8, v1);
  id v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1AD9DCD10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  id v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C20]), sel_init);
  sub_1AD9DCCF0();
  uint64_t v10 = (void *)sub_1AD9DCCD0();
  id v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  objc_msgSend(v9, sel_setLocale_, v10);

  double v12 = (void *)sub_1AD9DF6D0();
  id v13 = objc_msgSend(v9, sel_locale);
  if (v13)
  {
    uint64_t v14 = v13;
    sub_1AD9DCCE0();

    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v3, v8, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = (void *)sub_1AD9DCCD0();
      v11(v3, v4);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    uint64_t v15 = 0;
  }
  id v16 = objc_msgSend(self, sel_dateFormatFromTemplate_options_locale_, v12, 0, v15);

  objc_msgSend(v9, sel_setDateTemplate_, v16);
  return v9;
}

void sub_1AD9B644C()
{
  if (!qword_1EB725600)
  {
    sub_1AD9DCD10();
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB725600);
    }
  }
}

id ScheduleOccurrenceAlarmEnabledTableViewCell.apply(_:)(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceEditModel_mutableOccurrence), sel_alarmConfiguration);
  objc_msgSend(v2, sel_mutableCopy);

  sub_1AD9DFF20();
  swift_unknownObjectRelease();
  sub_1AD8AEE54();
  swift_dynamicCast();
  id v3 = objc_msgSend(v5, sel_isEnabled);

  return objc_msgSend(v1, sel_setOn_animated_, v3, 1);
}

unint64_t static ScheduleOccurrenceAlarmEnabledTableViewCell.defaultReuseIdentifier.getter()
{
  return 0xD00000000000002BLL;
}

void sub_1AD9B6684()
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  id v2 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setDisplayText_, v2, 0xE000000000000000);

  id v3 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
  aBlock[4] = sub_1AD8F05CC;
  void aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD8F0900;
  aBlock[3] = &block_descriptor_39;
  uint64_t v4 = _Block_copy(aBlock);
  id v5 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v5);
}

id ScheduleOccurrenceAlarmEnabledTableViewCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell()
{
  return self;
}

id sub_1AD9B6878(uint64_t a1)
{
  return ScheduleOccurrenceAlarmEnabledTableViewCell.apply(_:)(a1);
}

uint64_t method lookup function for ScheduleOccurrenceAlarmEnabledTableViewCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ScheduleOccurrenceAlarmEnabledTableViewCell);
}

uint64_t block_copy_helper_39(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_39()
{
  return swift_release();
}

char *sub_1AD9B68CC(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for SleepOnboardingScheduleViewController());
  return sub_1AD9B6904(a1, 0);
}

char *sub_1AD9B6904(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton] = 0;
  id v5 = (id *)(a1 + 40);
  swift_beginAccess();
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = v2;
  id v8 = v6;
  objc_msgSend(v8, sel_sleepDurationGoal);
  if (v9 <= 0.0)
  {
    double v11 = *MEMORY[0x1E4FA5398] * 60.0 * 60.0;
  }
  else
  {
    objc_msgSend(*v5, sel_sleepDurationGoal);
    double v11 = v10;
  }
  type metadata accessor for ScheduleOnboardingSection(0);
  swift_allocObject();
  uint64_t v12 = sub_1AD8E0BD8(v8, a2, v11);
  uint64_t v13 = OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_scheduleDataSource;
  *(void *)&v7[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_scheduleDataSource] = v12;

  uint64_t v14 = sub_1AD9B6B18();
  uint64_t v16 = v15;
  sub_1AD9B6CD4();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)&v7[v13];
  swift_retain();
  swift_retain();
  char v22 = sub_1AD9B8BE8(v14, v16, v18, v20, a1, a2, v21, 0, 2, 1, 0, (uint64_t)v7, (uint64_t (*)(char *, uint64_t, void, void *, uint64_t))sub_1AD9B8FA8);
  swift_retain();
  uint64_t v23 = sub_1AD8E0A74();
  swift_beginAccess();
  *(void *)(v23 + 112) = &off_1F0472C20;
  swift_unknownObjectWeakAssign();
  sub_1AD874E90();
  swift_release();

  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_1AD9B6B18()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  uint64_t v2 = sub_1AD9DF710();
  uint64_t v4 = v3;
  if (v2 == sub_1AD9DF710() && v4 == v5)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v7 = sub_1AD9E02D0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      if (qword_1EB724E38 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  if (qword_1EB724E38 != -1) {
LABEL_11:
  }
    swift_once();
LABEL_10:
  id v8 = (id)qword_1EB727930;
  uint64_t v9 = sub_1AD9DCA70();

  return v9;
}

void sub_1AD9B6CD4()
{
  id v1 = (void *)v0;
  id v2 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  uint64_t v3 = sub_1AD9DF710();
  uint64_t v5 = v4;
  if (v3 == sub_1AD9DF710() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  char v8 = sub_1AD9E02D0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_9;
  }
  uint64_t v9 = v1[14];
  uint64_t v10 = v1[15];
  __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v9);
  double v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 80);
  swift_retain();
  if (v11(v9, v10))
  {
    uint64_t v12 = v1[14];
    uint64_t v13 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 96))(v12, v13);
    uint64_t v14 = v1[14];
    uint64_t v15 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v14);
    (*(void (**)(uint64_t, uint64_t))(v15 + 112))(v14, v15);
    uint64_t v16 = v1[14];
    uint64_t v17 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v16);
    (*(void (**)(uint64_t, uint64_t))(v17 + 120))(v16, v17);
    uint64_t v18 = v1[14];
    uint64_t v19 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v18);
    (*(void (**)(uint64_t, uint64_t))(v19 + 128))(v18, v19);
    uint64_t v20 = v1[14];
    uint64_t v21 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 136))(v20, v21);
    swift_release();
    goto LABEL_9;
  }
  swift_release();
  id v23 = objc_msgSend(self, sel_sharedBehavior);
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = objc_msgSend(v23, sel_features);

    if (v25)
    {
      unsigned int v26 = objc_msgSend(v25, sel_timeInBedTracking);

      if (!v26)
      {
        if (qword_1EB724E38 == -1) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
LABEL_9:
      if (qword_1EB724E38 == -1)
      {
LABEL_10:
        id v22 = (id)qword_1EB727930;
        sub_1AD9DCA70();

        return;
      }
LABEL_16:
      swift_once();
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_1AD9B704C()
{
  id v1 = v0;
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for SleepOnboardingScheduleViewController();
  objc_msgSendSuper2(&v19, sel_viewDidLoad);
  id v2 = &v0[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  swift_beginAccess();
  id v4 = objc_msgSend(*(id *)(v3 + 40), sel_occurrences);
  sub_1AD837214(0, (unint64_t *)&qword_1E9A49720);
  unint64_t v5 = sub_1AD9DF860();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1AD9E0190();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v6) {
    sub_1AD9B72AC();
  }
  swift_retain();
  sub_1AD9B77AC();
  swift_release();
  char v7 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v1, sel_hksp_addNextButtonWithTitle_, v7);

  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton];
  *(void *)&v1[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton] = v8;

  sub_1AD9B79AC();
  uint64_t v10 = *(void **)(*(void *)v2 + 16);
  swift_retain();
  id v11 = objc_msgSend(v10, sel_source);
  uint64_t v12 = sub_1AD9DF710();
  uint64_t v14 = v13;
  if (v12 == sub_1AD9DF710() && v14 == v15)
  {
    swift_release();

    return (id)swift_bridgeObjectRelease_n();
  }
  else
  {
    char v17 = sub_1AD9E02D0();
    swift_release();

    swift_bridgeObjectRelease();
    id result = (id)swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      return objc_msgSend(v1, sel_hksp_addCancelButton);
    }
  }
  return result;
}

void sub_1AD9B72AC()
{
  id v1 = v0;
  uint64_t v2 = sub_1AD9DCE40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  long long v47 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = &v0[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  uint64_t v11 = *(void *)v10;
  swift_beginAccess();
  uint64_t v12 = *(void **)(v11 + 40);
  swift_beginAccess();
  uint64_t v13 = *(void **)(v11 + 56);
  if (v13)
  {
    id v14 = v12;
    id v15 = v13;
    sub_1AD9B8428();
    if (v16) {
      goto LABEL_6;
    }
  }
  else
  {
    id v17 = v12;
  }
  id v15 = objc_msgSend(v12, sel_mutableOccurrenceTemplate);
LABEL_6:
  uint64_t v18 = *(void *)v10;
  swift_beginAccess();
  objc_super v19 = *(void **)(v18 + 40);
  swift_retain();
  objc_msgSend(v19, sel_sleepDurationGoal);
  double v21 = v20;
  uint64_t v50 = v2;
  uint64_t v51 = v1;
  uint64_t v49 = v3;
  char v48 = v9;
  if (v20 > 0.0)
  {
    objc_msgSend(*(id *)(v18 + 40), sel_sleepDurationGoal);
    uint64_t v22 = v23;
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v22 = 0;
  }
  *(void *)&v52[0] = v22;
  BYTE8(v52[0]) = v21 <= 0.0;
  sub_1AD9B8B24(0, (unint64_t *)&qword_1EB725050, (void (*)(uint64_t))sub_1AD8DF504);
  swift_allocObject();
  uint64_t v24 = sub_1AD9DDB30();
  id v25 = v15;
  id v45 = objc_msgSend(v12, sel_weekdaysWithOccurrences);
  *(void *)&v52[0] = v12;
  sub_1AD9B8B24(0, (unint64_t *)&qword_1EB725060, (void (*)(uint64_t))sub_1AD99094C);
  swift_allocObject();
  id v46 = v12;
  uint64_t v26 = sub_1AD9DDB30();
  uint64_t v27 = *(void *)(*(void *)v10 + 112);
  uint64_t v28 = *(void *)(*(void *)v10 + 120);
  __swift_project_boxed_opaque_existential_1Tm((void *)(*(void *)v10 + 88), v27);
  unint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v28 + 104);
  swift_retain();
  swift_retain();
  char v30 = v29(v27, v28);
  swift_release();
  id v31 = objc_msgSend(*(id *)(*(void *)v10 + 72), sel_currentCalendar);
  double v32 = v48;
  sub_1AD9DCDB0();

  uint64_t v33 = v49;
  uint64_t v34 = (uint64_t)v47;
  uint64_t v35 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v47, v32, v50);
  type metadata accessor for ScheduleOccurrenceEditModel();
  swift_allocObject();
  id v36 = v25;
  swift_retain();
  swift_retain();
  uint64_t v37 = sub_1AD8945FC(v36, 1, 0, (uint64_t)v45, v24, v26, v30 & 1, v34);

  swift_release();
  swift_release();
  uint64_t v38 = (objc_class *)type metadata accessor for ScheduleOccurrenceViewController();
  memset(v52, 0, sizeof(v52));
  uint64_t v53 = 0;
  id v39 = objc_allocWithZone(v38);
  unint64_t v40 = (char *)sub_1AD8410B8(v37, 0, (uint64_t)v52);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v35);
  unint64_t v41 = &v40[OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_delegate];
  swift_beginAccess();
  *((void *)v41 + sub_1AD95AB40(6, 1) = &off_1F0472C30;
  uint64_t v42 = v51;
  swift_unknownObjectWeakAssign();
  id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B78]), sel_initWithRootViewController_, v40);
  sub_1AD95AB40(2, 2);
  objc_msgSend(v42, sel_presentViewController_animated_completion_, v43, 1, 0);

  swift_release();
}

uint64_t sub_1AD9B77AC()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  uint64_t v2 = sub_1AD9DF710();
  uint64_t v4 = v3;
  if (v2 == sub_1AD9DF710() && v4 == v5)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v7 = sub_1AD9E02D0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      if (qword_1EB724E38 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  if (qword_1EB724E38 != -1) {
LABEL_11:
  }
    swift_once();
LABEL_10:
  id v8 = (id)qword_1EB727930;
  uint64_t v9 = sub_1AD9DCA70();

  return v9;
}

void sub_1AD9B79AC()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton);
  if (v1)
  {
    uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo);
    swift_beginAccess();
    uint64_t v3 = *v2;
    swift_beginAccess();
    uint64_t v4 = *(void **)(v3 + 40);
    id v5 = v1;
    id v6 = objc_msgSend(v4, sel_occurrences);
    sub_1AD837214(0, (unint64_t *)&qword_1E9A49720);
    unint64_t v7 = sub_1AD9DF860();

    uint64_t v14 = MEMORY[0x1E4FBC860];
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1AD9E0190();
      swift_bridgeObjectRelease();
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0) {
            id v10 = (id)MEMORY[0x1B3E6BFF0](i, v7);
          }
          else {
            id v10 = *(id *)(v7 + 8 * i + 32);
          }
          uint64_t v11 = v10;
          if (objc_msgSend(v10, sel_isSingleDayOverride))
          {
          }
          else
          {
            sub_1AD9E0080();
            sub_1AD9E00C0();
            sub_1AD9E00D0();
            sub_1AD9E0090();
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v12 = v14;
        if (v14 < 0) {
          goto LABEL_21;
        }
LABEL_17:
        if ((v12 & 0x4000000000000000) == 0)
        {
          uint64_t v13 = *(void *)(v12 + 16);
LABEL_19:
          swift_release();
          objc_msgSend(v5, sel_setEnabled_, v13 > 0);

          return;
        }
LABEL_21:
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_1AD9E0190();
        swift_release();
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = MEMORY[0x1E4FBC860];
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
}

id sub_1AD9B7C30()
{
  id v1 = (void *)(v0 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_beginAccess();
  int v3 = *(unsigned __int8 *)(v2 + 80);
  swift_beginAccess();
  unsigned int v4 = objc_msgSend(*(id *)(v2 + 40), sel_isDefaultSchedule);
  uint64_t v5 = 2;
  if (v4) {
    uint64_t v5 = 3;
  }
  if (v3 == 1) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = v5;
  }
  sub_1AD95AB40(3, v6);
  uint64_t v7 = *v1;
  swift_beginAccess();
  uint64_t v8 = *(void **)(v7 + 40);
  swift_retain();
  objc_msgSend(v8, sel_sleepDurationGoal);
  double v10 = v9;
  if (v9 <= 0.0)
  {
    swift_release();
    double v13 = 0.0;
  }
  else
  {
    objc_msgSend(*(id *)(v7 + 40), sel_sleepDurationGoal);
    double v12 = v11;
    swift_release();
    double v13 = v12 / 60.0 / 60.0;
  }
  uint64_t v14 = (double *)MEMORY[0x1E4FA5398];
  if (v13 != *MEMORY[0x1E4FA5398] || v10 <= 0.0) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 3;
  }
  sub_1AD95AB40(4, v16);
  uint64_t v17 = *v1;
  uint64_t v18 = (id *)(*v1 + 40);
  swift_beginAccess();
  objc_super v19 = *(void **)(v17 + 40);
  swift_retain();
  objc_msgSend(v19, sel_windDownTime);
  double v20 = (double *)MEMORY[0x1E4FA5498];
  if (v21 == 0.0) {
    objc_msgSend(*v18, sel_setWindDownTime_, *MEMORY[0x1E4FA5498] * 60.0);
  }
  swift_release();
  uint64_t v22 = *v1;
  double v23 = *v20 * 60.0;
  swift_beginAccess();
  objc_msgSend(*(id *)(v22 + 40), sel_setWindDownTime_, v23);
  uint64_t v24 = *v1;
  swift_beginAccess();
  id v25 = *(void **)(v24 + 40);
  swift_retain();
  objc_msgSend(v25, sel_sleepDurationGoal);
  if (v26 <= 0.0)
  {
    swift_release();
    uint64_t v28 = *v1;
    double v29 = *v14 * 60.0 * 60.0;
    swift_beginAccess();
    return objc_msgSend(*(id *)(v28 + 40), sel_setSleepDurationGoal_, v29);
  }
  else
  {
    objc_msgSend(*(id *)(v24 + 40), sel_sleepDurationGoal);
    return (id)swift_release();
  }
}

void sub_1AD9B7ED8()
{
  id v1 = v0;
  swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  int v3 = *(void **)(*(void *)v2 + 16);
  swift_retain();
  id v4 = objc_msgSend(v3, sel_source);
  uint64_t v5 = sub_1AD9DF710();
  uint64_t v7 = v6;
  if (v5 == sub_1AD9DF710() && v7 == v8)
  {
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_1AD9E02D0();
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      id v11 = objc_allocWithZone((Class)type metadata accessor for SleepOnboardingConfirmationViewController());
      uint64_t v12 = swift_retain();
      double v13 = sub_1AD9A9150(v12);
      uint64_t v14 = &v1[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate];
      swift_beginAccess();
      uint64_t v15 = *(void *)v14;
      uint64_t v16 = *((void *)v14 + 1);
      uint64_t v17 = &v13[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate];
      swift_beginAccess();
      *(void *)uint64_t v17 = v15;
      *((void *)v17 + sub_1AD95AB40(6, 1) = v16;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      objc_msgSend(v1, sel_showViewController_sender_, v13, 0);

      return;
    }
  }
  if (qword_1E9A49098 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1AD9DD550();
  __swift_project_value_buffer(v18, (uint64_t)qword_1E9A4D300);
  objc_super v19 = sub_1AD9DD530();
  os_log_type_t v20 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v19, v20))
  {
    double v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v30[0] = v22;
    *(_DWORD *)double v21 = 136446210;
    uint64_t v23 = sub_1AD9E04F0();
    sub_1AD838978(v23, v24, v30);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v19, v20, "[%{public}s] we're done!", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v22, -1, -1);
    MEMORY[0x1B3E6D1A0](v21, -1, -1);
  }

  id v25 = &v1[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate];
  swift_beginAccess();
  if (*(void *)v25)
  {
    uint64_t v26 = *((void *)v25 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    swift_unknownObjectRetain();
    uint64_t v29 = swift_retain();
    v28(v29, ObjectType, v26);
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1AD9B8344()
{
  return swift_release();
}

id sub_1AD9B8384()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepOnboardingScheduleViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SleepOnboardingScheduleViewController()
{
  return self;
}

void sub_1AD9B8428()
{
  id v1 = objc_msgSend(v0, sel_occurrences);
  sub_1AD837214(0, (unint64_t *)&qword_1E9A49720);
  unint64_t v2 = sub_1AD9DF860();

  uint64_t v8 = MEMORY[0x1E4FBC860];
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x1E4FBC860];
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1AD9E0190();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_15;
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x1B3E6BFF0](i, v2);
      }
      else {
        id v5 = *(id *)(v2 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      if (objc_msgSend(v5, sel_isRepeating))
      {
        sub_1AD9E0080();
        sub_1AD9E00C0();
        sub_1AD9E00D0();
        sub_1AD9E0090();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v8;
    if (v8 < 0) {
      goto LABEL_18;
    }
LABEL_16:
    if ((v7 & 0x4000000000000000) == 0)
    {
LABEL_17:
      swift_release();
      return;
    }
LABEL_18:
    swift_bridgeObjectRetain();
    sub_1AD9E0190();
    swift_release();
    goto LABEL_17;
  }
  __break(1u);
}

void sub_1AD9B85E8(void *a1)
{
  uint64_t v40 = sub_1AD9DCE40();
  uint64_t v39 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40, v3);
  uint64_t v38 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v6);
  uint64_t v8 = (char *)&v34 - v7;
  unint64_t v41 = v1;
  double v9 = &v1[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  uint64_t v10 = *(void *)v9;
  swift_beginAccess();
  id v11 = *(id *)(v10 + 40);
  swift_retain();
  objc_msgSend(v11, sel_sleepDurationGoal);
  double v13 = v12;
  if (v12 > 0.0)
  {
    objc_msgSend(*(id *)(v10 + 40), sel_sleepDurationGoal);
    uint64_t v14 = v15;
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v14 = 0;
  }
  *(void *)&v42[0] = v14;
  BYTE8(v42[0]) = v13 <= 0.0;
  sub_1AD9B8B24(0, (unint64_t *)&qword_1EB725050, (void (*)(uint64_t))sub_1AD8DF504);
  swift_allocObject();
  uint64_t v16 = sub_1AD9DDB30();
  objc_msgSend(a1, sel_mutableCopy);
  sub_1AD9DFF20();
  swift_unknownObjectRelease();
  sub_1AD837214(0, (unint64_t *)&unk_1E9A4D9E0);
  swift_dynamicCast();
  id v35 = v44;
  id v36 = objc_msgSend(v11, sel_weekdaysWithOccurrences);
  *(void *)&v42[0] = v11;
  sub_1AD9B8B24(0, (unint64_t *)&qword_1EB725060, (void (*)(uint64_t))sub_1AD99094C);
  swift_allocObject();
  id v37 = v11;
  uint64_t v17 = sub_1AD9DDB30();
  uint64_t v18 = *(void *)(*(void *)v9 + 112);
  uint64_t v19 = *(void *)(*(void *)v9 + 120);
  __swift_project_boxed_opaque_existential_1Tm((void *)(*(void *)v9 + 88), v18);
  os_log_type_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 104);
  swift_retain();
  swift_retain();
  char v21 = v20(v18, v19);
  swift_release();
  id v22 = objc_msgSend(*(id *)(*(void *)v9 + 72), sel_currentCalendar);
  sub_1AD9DCDB0();

  uint64_t v23 = v39;
  uint64_t v24 = (uint64_t)v38;
  uint64_t v25 = v40;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v38, v8, v40);
  type metadata accessor for ScheduleOccurrenceEditModel();
  swift_allocObject();
  swift_retain();
  id v26 = v35;
  swift_retain();
  uint64_t v27 = sub_1AD8945FC(v26, 0, 0, (uint64_t)v36, v16, v17, v21 & 1, v24);

  swift_release();
  swift_release();
  uint64_t v28 = (objc_class *)type metadata accessor for ScheduleOccurrenceViewController();
  memset(v42, 0, sizeof(v42));
  uint64_t v43 = 0;
  id v29 = objc_allocWithZone(v28);
  char v30 = (char *)sub_1AD8410B8(v27, 1, (uint64_t)v42);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v25);
  id v31 = &v30[OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_delegate];
  swift_beginAccess();
  *((void *)v31 + sub_1AD95AB40(6, 1) = &off_1F0472C30;
  double v32 = v41;
  swift_unknownObjectWeakAssign();
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B78]), sel_initWithRootViewController_, v30);
  objc_msgSend(v32, sel_presentViewController_animated_completion_, v33, 1, 0);

  swift_release();
}

void sub_1AD9B8ABC()
{
}

void sub_1AD9B8AE0(void *a1)
{
}

void sub_1AD9B8B04(uint64_t a1, uint64_t a2, char a3)
{
}

void sub_1AD9B8B10(uint64_t a1, uint64_t a2)
{
}

void sub_1AD9B8B1C(char a1, double a2)
{
}

void sub_1AD9B8B24(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1AD9DDB20();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

char *sub_1AD9B8B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, char a10, void *a11, uint64_t a12)
{
  return sub_1AD9B8BE8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, (uint64_t (*)(char *, uint64_t, void, void *, uint64_t))sub_1AD9B91A4);
}

char *sub_1AD9B8BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, char a10, void *a11, uint64_t a12, uint64_t (*a13)(char *, uint64_t, void, void *, uint64_t))
{
  uint64_t v19 = (void *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate);
  *uint64_t v19 = 0;
  v19[1] = 0;
  *(void *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_dataSourceAdaptor) = 0;
  *(void *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_sleepChangeObserver) = 0;
  *(void *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo) = a5;
  *(void *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_presentationStyle) = a6;
  os_log_type_t v20 = (void *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_dataSource);
  uint64_t v21 = MEMORY[0x1E4F66470];
  void *v20 = a7;
  v20[1] = v21;
  id v34 = a8;
  swift_retain();
  swift_retain();
  id v22 = (char *)SleepTableWelcomeController.init(title:detailText:icon:tableViewStyle:hasSystemMargins:)(a1, a2, a3, a4, a8, a9, 0);
  id result = (char *)objc_msgSend(v22, sel_tableView);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v24 = result;
  objc_msgSend(result, sel_setDelegate_, v22);

  id result = (char *)objc_msgSend(v22, sel_tableView);
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v25 = result;
  type metadata accessor for SleepDiffableTableViewAdaptor();
  uint64_t v26 = swift_allocObject();
  id v27 = a11;
  swift_retain();
  *(void *)&v22[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_dataSourceAdaptor] = a13(v25, a7, a10 & 1, a11, v26);
  swift_release();
  uint64_t v37 = a7;
  uint64_t v38 = MEMORY[0x1E4F66470];
  sub_1AD8BFA98(0, &qword_1E9A4D950);
  sub_1AD8BFA98(0, &qword_1E9A4D958);
  swift_retain();
  if (!swift_dynamicCast())
  {
    uint64_t v36 = 0;
    memset(v35, 0, sizeof(v35));
    sub_1AD9B9CE0((uint64_t)v35);
    goto LABEL_7;
  }
  sub_1AD843F30(v35, (uint64_t)v39);
  __swift_project_boxed_opaque_existential_1Tm(v39, v39[3]);
  id result = (char *)objc_msgSend(v22, sel_tableView);
  if (result)
  {
    uint64_t v28 = result;
    sub_1AD9DD440();

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
LABEL_7:
    objc_msgSend(v22, sel_setModalInPresentation_, 1);
    id v29 = objc_msgSend(v22, sel_headerView);
    objc_msgSend(v29, sel_setTitleHyphenationFactor_, 0.0);

    sub_1AD87B1E0();
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_1AD9E3070;
    uint64_t v31 = sub_1AD9DD6D0();
    uint64_t v32 = MEMORY[0x1E4FB1138];
    *(void *)(v30 + 32) = v31;
    *(void *)(v30 + 40) = v32;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1AD841D34();
    id v33 = v22;
    sub_1AD9DFC70();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    swift_release();
    swift_release();

    return v33;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t *sub_1AD9B8FA8(void *a1, uint64_t a2, char a3, void *a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  *(_WORD *)((char *)a5 + 49) = 0;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4F66470];
  id v10[2] = a2;
  uint64_t v10[3] = v11;
  v10[4] = a4;
  v10[5] = v9;
  double v12 = (char *)objc_allocWithZone((Class)type metadata accessor for SleepDiffableTableViewDataSource());
  *(void *)&v12[qword_1E9A4B0F0 + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1AD9B9DEC;
  *(void *)(v13 + 24) = v10;
  id v14 = a4;
  id v15 = a1;
  swift_retain();
  swift_retain();
  uint64_t v16 = (void *)sub_1AD9DD670();
  a5[4] = v11;
  a5[5] = (uint64_t)v16;
  *((unsigned char *)a5 + 48) = a3;
  a5[2] = (uint64_t)a4;
  a5[3] = a2;
  swift_retain();
  id v17 = v14;
  id v18 = v16;
  sub_1AD9DD690();

  *(void *)(a5[5] + qword_1E9A4B0F0 + 8) = v11;
  swift_unknownObjectWeakAssign();
  type metadata accessor for ScheduleOnboardingSection(0);
  uint64_t v19 = (void *)sub_1AD9DD2C0();
  swift_retain();
  objc_msgSend(v19, sel_registerObserver_, a5);
  swift_release();

  swift_release();
  swift_release();

  return a5;
}

uint64_t *sub_1AD9B91A4(void *a1, uint64_t a2, char a3, void *a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  *(_WORD *)((char *)a5 + 49) = 0;
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4F66470];
  id v10[2] = a2;
  uint64_t v10[3] = v11;
  v10[4] = a4;
  v10[5] = v9;
  double v12 = (char *)objc_allocWithZone((Class)type metadata accessor for SleepDiffableTableViewDataSource());
  *(void *)&v12[qword_1E9A4B0F0 + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1AD9B9F20;
  *(void *)(v13 + 24) = v10;
  id v14 = a4;
  id v15 = a1;
  swift_retain();
  swift_retain();
  uint64_t v16 = (void *)sub_1AD9DD670();
  a5[4] = v11;
  a5[5] = (uint64_t)v16;
  *((unsigned char *)a5 + 48) = a3;
  a5[2] = (uint64_t)a4;
  a5[3] = a2;
  swift_retain();
  id v17 = v14;
  id v18 = v16;
  sub_1AD9DD690();

  *(void *)(a5[5] + qword_1E9A4B0F0 + 8) = v11;
  swift_unknownObjectWeakAssign();
  type metadata accessor for ConfirmationOnboardingSection();
  uint64_t v19 = (void *)sub_1AD9DD2C0();
  swift_retain();
  objc_msgSend(v19, sel_registerObserver_, a5);
  swift_release();

  swift_release();
  swift_release();

  return a5;
}

void sub_1AD9B93A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  if (qword_1EB725658 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1AD9DD550();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB725958);
  uint64_t v7 = sub_1AD9DD530();
  os_log_type_t v8 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    char v32 = a2;
    uint64_t v10 = swift_slowAlloc();
    v34[0] = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = sub_1AD9E04F0();
    v33[3] = sub_1AD838978(v11, v12, v34);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v7, v8, "[%{public}s] Schedule occurrence was modified", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v10;
    a2 = v32;
    MEMORY[0x1B3E6D1A0](v13, -1, -1);
    MEMORY[0x1B3E6D1A0](v9, -1, -1);
  }

  id v14 = &v2[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  uint64_t v15 = *(void *)v14;
  swift_beginAccess();
  id v16 = *(id *)(v15 + 40);
  id v17 = v16;
  if (a2)
  {
    id v18 = objc_msgSend(v16, sel_overrideOccurrence);
    if (v18)
    {
      uint64_t v19 = v18;
      os_log_type_t v20 = sub_1AD9DD530();
      os_log_type_t v21 = sub_1AD9DFBE0();
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        v33[0] = v23;
        *(_DWORD *)id v22 = 136446210;
        uint64_t v31 = v22 + 4;
        uint64_t v24 = sub_1AD9E04F0();
        sub_1AD838978(v24, v25, v33);
        sub_1AD9DFEA0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1AD834000, v20, v21, "[%{public}s] Removing override", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3E6D1A0](v23, -1, -1);
        MEMORY[0x1B3E6D1A0](v22, -1, -1);
      }

      objc_msgSend(v17, sel_removeOccurrence_, v19);
    }
  }
  objc_msgSend(v17, sel_saveOccurrence_, a1, v31);
  uint64_t v26 = *(void *)v14;
  swift_beginAccess();
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v17;
  id v28 = v17;

  uint64_t v29 = *(void *)v14;
  swift_beginAccess();
  *(unsigned char *)(v29 + 80) = 4;
  id v30 = v28;
  sub_1AD9DDB10();
  sub_1AD8DFBC8();
  sub_1AD9B79AC();
  objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_1AD9B9794(uint64_t a1)
{
  unint64_t v2 = v1;
  swift_getObjectType();
  if (qword_1EB725658 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AD9DD550();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB725958);
  uint64_t v5 = sub_1AD9DD530();
  os_log_type_t v6 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v19[0] = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_1AD9E04F0();
    sub_1AD838978(v9, v10, v19);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v5, v6, "[%{public}s] Schedule occurrence was deleted", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v8, -1, -1);
    MEMORY[0x1B3E6D1A0](v7, -1, -1);
  }

  uint64_t v11 = &v2[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  uint64_t v12 = *(void *)v11;
  swift_beginAccess();
  id v13 = *(id *)(v12 + 40);
  objc_msgSend(v13, sel_removeOccurrence_, a1);
  uint64_t v14 = *(void *)v11;
  swift_beginAccess();
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
  id v16 = v13;

  uint64_t v17 = *(void *)v11;
  swift_beginAccess();
  *(unsigned char *)(v17 + 80) = 4;
  id v18 = v16;
  sub_1AD9DDB10();
  sub_1AD8DFBC8();
  sub_1AD9B79AC();
  objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id sub_1AD9B9A2C()
{
  id v1 = v0;
  swift_getObjectType();
  if (qword_1EB725658 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB725958);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_1AD9E04F0();
    sub_1AD838978(v7, v8, &v10);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "[%{public}s] Schedule occurrence edits were cancelled", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }

  return objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_1AD9B9BD0(char a1, double a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo);
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_beginAccess();
  id v7 = *(id *)(v6 + 40);
  unint64_t v8 = v7;
  uint64_t v9 = &selRef_setSleepDurationGoal_;
  if (a1) {
    uint64_t v9 = &selRef_setWindDownTime_;
  }
  objc_msgSend(v7, *v9, a2);
  uint64_t v10 = *v5;
  swift_beginAccess();
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v12 = v8;

  id v13 = v12;
  sub_1AD9DDB10();
  sub_1AD8DFBC8();
}

uint64_t sub_1AD9B9CE0(uint64_t a1)
{
  sub_1AD9B9D3C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1AD9B9D3C()
{
  if (!qword_1E9A4D960)
  {
    sub_1AD8BFA98(255, &qword_1E9A4D958);
    unint64_t v0 = sub_1AD9DFE90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D960);
    }
  }
}

uint64_t sub_1AD9B9DA8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AD9B9DE0(uint64_t a1, uint64_t a2)
{
  sub_1AD933B00(a1, a2, v2);
}

id sub_1AD9B9DEC(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_1AD8CF0A8(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5]);
}

uint64_t sub_1AD9B9DF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9B9E30(uint64_t a1, uint64_t a2, void *a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v3 + 16))(a1, a2, *a3, a3[1]);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1AD9B9EA4()
{
  return swift_deallocObject();
}

void sub_1AD9B9EDC()
{
}

uint64_t block_copy_helper_40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_40()
{
  return swift_release();
}

void sub_1AD9B9F2C(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1AD9B9F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_1AD9BA154();
  return MEMORY[0x1F40F8670](a1, a2, a3, a4, v8);
}

BOOL static DiagramVariant.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DiagramVariant.hash(into:)()
{
  return sub_1AD9E03B0();
}

uint64_t DiagramVariant.hashValue.getter()
{
  return sub_1AD9E03E0();
}

uint64_t EnvironmentValues.diagramVariant.getter()
{
  sub_1AD883C64();
  return sub_1AD9DE270();
}

uint64_t EnvironmentValues.diagramVariant.setter()
{
  return sub_1AD9DE280();
}

uint64_t (*EnvironmentValues.diagramVariant.modify(void *a1))(uint64_t a1)
{
  *a1 = v1;
  a1[1] = sub_1AD883C64();
  sub_1AD9DE270();
  return sub_1AD9BA118;
}

uint64_t sub_1AD9BA118(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return sub_1AD9DE280();
}

unint64_t sub_1AD9BA154()
{
  unint64_t result = qword_1E9A4D968;
  if (!qword_1E9A4D968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4D968);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DiagramVariant(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(3, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD9BA27CLL);
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(3, 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(3, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(3, 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagramVariant()
{
  return &type metadata for DiagramVariant;
}

ValueMetadata *type metadata accessor for DiagramVariantKey()
{
  return &type metadata for DiagramVariantKey;
}

void sub_1AD9BA2C8(char a1)
{
  id v3 = objc_msgSend(v1, sel_presentedViewController);
  if (v3)
  {
    id v5 = v3;
    self;
    unsigned int v4 = (void *)swift_dynamicCastObjCClass();
    if (v4) {
      objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, a1 & 1, 0);
    }
  }
}

id sub_1AD9BA364(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v75 = a2;
  v84[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1AD9DCC70();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v11);
  id v13 = (char *)&v71 - v12;
  swift_retain();
  sub_1AD9DDB00();
  swift_release();
  id v14 = (id)v84[0];
  if (!v84[0]) {
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA5540]), sel_init);
  }
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1AD9DD550();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_1EB725018);
  char v77 = *(NSObject **)(v6 + 16);
  uint64_t v78 = v6 + 16;
  ((void (*)(char *, uint64_t, uint64_t))v77)(v13, a1, v5);
  id v17 = v14;
  id v18 = sub_1AD9DD530();
  os_log_type_t v19 = sub_1AD9DFBE0();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v81 = a1;
  id v82 = v17;
  uint64_t v80 = v6;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v74 = v3;
    uint64_t v23 = (void *)v22;
    uint64_t v73 = swift_slowAlloc();
    v84[0] = v73;
    *(_DWORD *)uint64_t v21 = 136446722;
    os_log_t v72 = v18;
    uint64_t v83 = sub_1AD838978(0xD000000000000015, 0x80000001AD9F7B30, v84);
    uint64_t v76 = v9;
    sub_1AD9DFEA0();
    *(_WORD *)(v21 + 12) = 2114;
    uint64_t v24 = sub_1AD9DCBB0();
    uint64_t v83 = v24;
    sub_1AD9DFEA0();
    *uint64_t v23 = v24;
    uint64_t v79 = *(void (**)(char *, uint64_t))(v6 + 8);
    v79(v13, v5);
    *(_WORD *)(v21 + 22) = 2114;
    id v25 = v82;
    uint64_t v83 = (uint64_t)v82;
    id v26 = v82;
    uint64_t v9 = v76;
    sub_1AD9DFEA0();
    v23[1] = v25;

    a1 = v81;
    os_log_t v27 = v72;
    _os_log_impl(&dword_1AD834000, v72, v19, "[%{public}s] generating editable override occcurence for current date: %{public}@ and schedule: %{public}@", (uint8_t *)v21, 0x20u);
    sub_1AD8B473C();
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v23, -1, -1);
    uint64_t v28 = v73;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v28, -1, -1);
    MEMORY[0x1B3E6D1A0](v21, -1, -1);
  }
  else
  {
    uint64_t v79 = *(void (**)(char *, uint64_t))(v6 + 8);
    v79(v13, v5);

    id v25 = v17;
  }
  uint64_t v29 = (char *)sub_1AD94D328();
  id v30 = (void *)sub_1AD9DCBB0();
  id v31 = objc_msgSend(v29, sel_upcomingResolvedOccurrenceAfterDate_, v30);

  ((void (*)(char *, uint64_t, uint64_t))v77)(v9, a1, v5);
  id v32 = v31;
  id v33 = sub_1AD9DD530();
  os_log_type_t v34 = sub_1AD9DFBE0();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v76 = v29;
  if (v35)
  {
    char v77 = v33;
    uint64_t v78 = v16;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v73 = v5;
    uint64_t v37 = v36;
    uint64_t v38 = (void *)swift_slowAlloc();
    uint64_t v74 = swift_slowAlloc();
    v84[0] = v74;
    *(_DWORD *)uint64_t v37 = 136446722;
    uint64_t v83 = sub_1AD838978(0xD000000000000015, 0x80000001AD9F7B30, v84);
    sub_1AD9DFEA0();
    *(_WORD *)(v37 + 12) = 2114;
    uint64_t v39 = sub_1AD9DCBB0();
    uint64_t v83 = v39;
    sub_1AD9DFEA0();
    *uint64_t v38 = v39;
    v79(v9, v73);
    *(_WORD *)(v37 + 22) = 2114;
    if (v32)
    {
      uint64_t v83 = (uint64_t)v32;
      id v40 = v32;
      sub_1AD9DFEA0();
    }
    else
    {
      uint64_t v83 = 0;
      sub_1AD9DFEA0();
      id v31 = 0;
    }
    v38[1] = v31;

    os_log_t v41 = v77;
    _os_log_impl(&dword_1AD834000, v77, v34, "[%{public}s] upcoming resolved occurrence after date: %{public}@ is: %{public}@", (uint8_t *)v37, 0x20u);
    sub_1AD8B473C();
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v38, -1, -1);
    uint64_t v42 = v74;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v42, -1, -1);
    MEMORY[0x1B3E6D1A0](v37, -1, -1);

    id v25 = v82;
    uint64_t v29 = v76;
    if (!v32) {
      goto LABEL_21;
    }
  }
  else
  {
    v79(v9, v5);

    if (!v32) {
      goto LABEL_21;
    }
  }
  id v43 = objc_msgSend(v32, sel_occurrence);
  if (v43)
  {
    uint64_t v44 = v43;
    if (objc_msgSend(v43, sel_isSingleDayOverride))
    {
      id v45 = v32;
      id v46 = sub_1AD9DD530();
      os_log_type_t v47 = sub_1AD9DFBE0();
      if (os_log_type_enabled(v46, v47))
      {
        char v48 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = v29;
        uint64_t v50 = swift_slowAlloc();
        v84[0] = v50;
        *(_DWORD *)char v48 = 136446210;
        uint64_t v83 = sub_1AD838978(0xD000000000000015, 0x80000001AD9F7B30, v84);
        id v25 = v82;
        sub_1AD9DFEA0();
        _os_log_impl(&dword_1AD834000, v46, v47, "[%{public}s] upcoming resolved occurrence is single day override, returning", v48, 0xCu);
        swift_arrayDestroy();
        uint64_t v51 = v50;
        uint64_t v29 = v49;
        MEMORY[0x1B3E6D1A0](v51, -1, -1);
        MEMORY[0x1B3E6D1A0](v48, -1, -1);
      }

      objc_msgSend(v44, sel_mutableCopy);
      sub_1AD9DFF20();

      swift_unknownObjectRelease();
      sub_1AD837214(0, (unint64_t *)&unk_1E9A4D9E0);
      swift_dynamicCast();
      return (id)v83;
    }
  }
LABEL_21:
  uint64_t v53 = sub_1AD9DD530();
  os_log_type_t v54 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v53, v54))
  {
    int v55 = (uint8_t *)swift_slowAlloc();
    v56 = v29;
    uint64_t v57 = swift_slowAlloc();
    v84[0] = v57;
    *(_DWORD *)int v55 = 136446210;
    uint64_t v83 = sub_1AD838978(0xD000000000000015, 0x80000001AD9F7B30, v84);
    id v25 = v82;
    sub_1AD9DFEA0();
    _os_log_impl(&dword_1AD834000, v53, v54, "[%{public}s] upcoming resolved occurrence is not a single day override, generating a new one", v55, 0xCu);
    swift_arrayDestroy();
    uint64_t v58 = v57;
    uint64_t v29 = v56;
    MEMORY[0x1B3E6D1A0](v58, -1, -1);
    MEMORY[0x1B3E6D1A0](v55, -1, -1);
  }

  uint64_t v59 = (void *)sub_1AD9DCBB0();
  uint64_t v60 = (void *)sub_1AD9DCDA0();
  id v61 = objc_msgSend(v29, sel_overrideOccurrenceGenerationResultForCurrentDate_gregorianCalendar_schedule_, v59, v60, v25);

  id v62 = v61;
  char v63 = sub_1AD9DD530();
  os_log_type_t v64 = sub_1AD9DFBE0();
  uint64_t v65 = &_OBJC_LABEL_PROTOCOL___HKSPSuggestionProvider;
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v66 = swift_slowAlloc();
    unint64_t v67 = (void *)swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    v84[0] = v81;
    *(_DWORD *)uint64_t v66 = 136446722;
    uint64_t v83 = sub_1AD838978(0xD000000000000015, 0x80000001AD9F7B30, v84);
    sub_1AD9DFEA0();
    *(_WORD *)(v66 + 12) = 2114;
    id v68 = objc_msgSend(v62, sel_overrideOccurrence);
    uint64_t v83 = (uint64_t)v68;
    sub_1AD9DFEA0();
    *unint64_t v67 = v68;
    uint64_t v65 = &_OBJC_LABEL_PROTOCOL___HKSPSuggestionProvider;
    *(_WORD *)(v66 + 22) = 1024;
    LODWORD(v83) = objc_msgSend(v62, sel_wasGeneratedFromTemplate);
    uint64_t v29 = v76;
    sub_1AD9DFEA0();

    _os_log_impl(&dword_1AD834000, v63, v64, "[%{public}s] generated override %{public}@ (from template: %{BOOL}d)", (uint8_t *)v66, 0x1Cu);
    sub_1AD8B473C();
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v67, -1, -1);
    uint64_t v69 = v81;
    swift_arrayDestroy();
    id v25 = v82;
    MEMORY[0x1B3E6D1A0](v69, -1, -1);
    MEMORY[0x1B3E6D1A0](v66, -1, -1);
  }
  else
  {
  }
  id v52 = [v62 (SEL)v65[408]];
  objc_msgSend(v62, sel_wasGeneratedFromTemplate);

  return v52;
}

char *QuickScheduleManagementViewController.__allocating_init(sleepStore:provenanceSource:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(a1, a2);
}

id sub_1AD9BAF50()
{
  v8[1] = *(id *)MEMORY[0x1E4F143B8];
  v8[0] = 0;
  id v1 = objc_msgSend(v0, sel_isFeatureCapabilitySupportedOnActivePairedDeviceWithError_, v8);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = v8[0];
    id v4 = objc_msgSend(v2, sel_BOOLValue);
  }
  else
  {
    id v5 = v8[0];
    uint64_t v6 = (void *)sub_1AD9DCB10();

    swift_willThrow();
    return 0;
  }
  return v4;
}

id sub_1AD9BB024(void *a1, char a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_1AD9DCE40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1AD9DCC70();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v15);
  id v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a4)
  {
    case 1:
      id v22 = sub_1AD9C06B8();
      break;
    case 2:
      id v23 = objc_allocWithZone((Class)type metadata accessor for OnboardPromptViewController());
      char v24 = 1;
      goto LABEL_5;
    case 3:
      id v25 = objc_allocWithZone((Class)type metadata accessor for OnboardPromptViewController());
      char v24 = 0;
LABEL_5:
      id v22 = sub_1AD9BEE68(v24);
      break;
    default:
      sub_1AD9DCC60();
      id v28 = sub_1AD9BA364((uint64_t)v17, a3);
      char v19 = v18;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a3, v8);
      BOOL v20 = objc_allocWithZone((Class)type metadata accessor for QuickScheduleOverrideViewController());
      id v21 = a1;
      id v22 = sub_1AD9BF884(v28, v19 & 1, (uint64_t)v21, a2 & 1, (uint64_t)v12, v20);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
      break;
  }
  return v22;
}

id QuickScheduleManagementViewController.sleepStore.getter()
{
  return *(id *)(v0 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore);
}

uint64_t sub_1AD9BB2F0()
{
  uint64_t v1 = v0 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  return MEMORY[0x1B3E6D270](v1);
}

uint64_t sub_1AD9BB390()
{
  return swift_unknownObjectRelease();
}

void (*sub_1AD9BB3EC(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1B3E6D270](v5);
  return sub_1AD89520C;
}

char *QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(void *a1, void *a2)
{
  uint64_t v5 = sub_1AD9DCD30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  uint64_t v10 = (uint64_t)v2 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_gregorianCalendar;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E4F27B20], v5);
  uint64_t v11 = v2;
  sub_1AD9DCD40();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(void *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver] = 0;
  *(void *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore] = a1;
  type metadata accessor for SleepScheduleProvider();
  id v12 = a1;
  id v13 = SleepScheduleProvider.__allocating_init(sleepStore:)(v12);
  uint64_t v14 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider;
  *(void *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider] = v13;
  *(void *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_provenanceSource] = a2;
  uint64_t v15 = *MEMORY[0x1E4F29DB8];
  id v16 = objc_allocWithZone(MEMORY[0x1E4FA54E8]);
  id v17 = a2;
  id v18 = objc_msgSend(v16, sel_initWithFeatureIdentifier_sleepStore_, v15, v12);
  uint64_t v19 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability;
  *(void *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability] = v18;
  id v20 = v18;
  LOBYTE(v16) = sub_1AD9BAF50();

  uint64_t v21 = *(void *)&v11[v19];
  id v22 = *(void **)&v11[v14];
  swift_unknownObjectRetain();
  id v23 = v22;
  LOBYTE(v2sub_1AD95AB40(3, 1) = sub_1AD9C0070(v21, v23);
  id v24 = v23;
  id v25 = sub_1AD9BB024(v24, v16 & 1, v10, v21);

  id v26 = (objc_class *)type metadata accessor for QuickScheduleManagementViewController();
  v41.receiver = v11;
  v41.super_class = v26;
  id v27 = objc_msgSendSuper2(&v41, sel_initWithRootViewController_, v25);
  type metadata accessor for QuickScheduleOverrideViewController();
  uint64_t v28 = swift_dynamicCastClass();
  if (v28)
  {
    uint64_t v29 = &off_1F0472E58;
    id v30 = &OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate;
  }
  else
  {
    type metadata accessor for EnableSchedulePromptViewController();
    uint64_t v28 = swift_dynamicCastClass();
    if (v28)
    {
      uint64_t v29 = &off_1F0472E90;
      id v30 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate;
    }
    else
    {
      type metadata accessor for OnboardPromptViewController();
      uint64_t v28 = swift_dynamicCastClass();
      if (!v28) {
        goto LABEL_8;
      }
      uint64_t v29 = &off_1F0472E78;
      id v30 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate;
    }
  }
  *(void *)(v28 + *v30 + 8) = v29;
  swift_unknownObjectWeakAssign();
LABEL_8:
  id v31 = (char *)v27;
  id v32 = (char *)v25;
  id v33 = objc_msgSend(v32, sel_navigationItem);
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v31, sel_cancelWithAnimated_);
  objc_msgSend(v33, sel_setLeftBarButtonItem_, v34);

  uint64_t v35 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability;
  uint64_t ObjectType = swift_getObjectType();
  swift_unknownObjectRetain();
  LOBYTE(ObjectType) = HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(ObjectType);
  swift_unknownObjectRelease();
  if ((ObjectType & 1) == 0)
  {
    uint64_t v37 = *(void **)&v31[v35];
    sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
    uint64_t v38 = v31;
    swift_unknownObjectRetain();
    uint64_t v39 = (void *)sub_1AD9DFCA0();
    objc_msgSend(v37, sel_registerObserver_queue_, v38, v39);
    swift_unknownObjectRelease();

    id v32 = v38;
  }

  return v31;
}

void sub_1AD9BB8B4()
{
  uint64_t v1 = sub_1AD9DCD30();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)objc_allocWithZone(v0);
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x1E4F27B20], v1);
  sub_1AD9DCD40();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  *(void *)&v6[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver] = 0;

  sub_1AD9E0140();
  __break(1u);
}

uint64_t sub_1AD9BBA20(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1AD9DFD30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (objc_class *)type metadata accessor for QuickScheduleManagementViewController();
  v13.receiver = v2;
  v13.super_class = v9;
  objc_msgSendSuper2(&v13, sel_viewDidAppear_, a1 & 1);
  id v10 = objc_msgSend(self, sel_defaultCenter);
  sub_1AD9DFD40();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1AD9C1128(&qword_1EB725B80, MEMORY[0x1E4F27FC8]);
  uint64_t v11 = sub_1AD9DDC40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  *(void *)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver] = v11;
  return swift_release();
}

id QuickScheduleManagementViewController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void QuickScheduleManagementViewController.init(navigationBarClass:toolbarClass:)()
{
}

id QuickScheduleManagementViewController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void QuickScheduleManagementViewController.init(rootViewController:)()
{
}

id QuickScheduleManagementViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void QuickScheduleManagementViewController.init(nibName:bundle:)()
{
}

id QuickScheduleManagementViewController.__deallocating_deinit()
{
  return sub_1AD9BF834((uint64_t (*)(void))type metadata accessor for QuickScheduleManagementViewController);
}

void sub_1AD9BBF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x1B3E6D270](v2);
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(v3, sel_cancelWithAnimated_, 0);
  }
}

void *sub_1AD9BBFEC(char a1)
{
  uint64_t v4 = v1;
  swift_getObjectType();
  id v6 = objc_msgSend(v1, sel_viewControllers);
  sub_1AD837214(0, &qword_1E9A49270);
  unint64_t v7 = sub_1AD9DF860();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    id v8 = (id)sub_1AD9E0190();
    swift_bridgeObjectRelease();
    uint64_t v9 = &unk_1EB725000;
    if (v8)
    {
LABEL_3:
      if ((v7 & 0xC000000000000001) != 0)
      {
        id v10 = (id)MEMORY[0x1B3E6BFF0](0, v7);
      }
      else
      {
        if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_32;
        }
        id v10 = *(id *)(v7 + 32);
      }
      id v8 = v10;
      swift_bridgeObjectRelease();
      swift_getObjectType();
      uint64_t v11 = swift_conformsToProtocol2();
      if (v11) {
        uint64_t v3 = v11;
      }
      else {
        uint64_t v3 = 0;
      }
      if (v11) {
        id v2 = v8;
      }
      else {
        id v2 = 0;
      }
      if (!v2) {
        goto LABEL_18;
      }
      if (qword_1EB725030 == -1)
      {
LABEL_14:
        uint64_t v12 = sub_1AD9DD550();
        __swift_project_value_buffer(v12, (uint64_t)qword_1EB725018);
        id v8 = v8;
        objc_super v13 = sub_1AD9DD530();
        os_log_type_t v14 = sub_1AD9DFBE0();
        if (os_log_type_enabled(v13, v14))
        {
          os_log_type_t type = v14;
          uint64_t v15 = swift_slowAlloc();
          id v31 = (void *)swift_slowAlloc();
          uint64_t v33 = swift_slowAlloc();
          v35[0] = v33;
          *(_DWORD *)uint64_t v15 = 136446466;
          uint64_t v16 = sub_1AD9E04F0();
          sub_1AD838978(v16, v17, v35);
          sub_1AD9DFEA0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v15 + 12) = 2114;
          id v34 = v2;
          uint64_t v18 = v3;
          id v19 = v8;
          uint64_t v9 = (void *)&unk_1EB725000;
          sub_1AD9DFEA0();
          *id v31 = v34;

          uint64_t v3 = v18;
          _os_log_impl(&dword_1AD834000, v13, type, "[%{public}s] prepareForCancel: [%{public}@]", (uint8_t *)v15, 0x16u);
          sub_1AD8B473C();
          swift_arrayDestroy();
          MEMORY[0x1B3E6D1A0](v31, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x1B3E6D1A0](v33, -1, -1);
          MEMORY[0x1B3E6D1A0](v15, -1, -1);
        }
        else
        {
        }
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(void, uint64_t, uint64_t))(v3 + 8))(a1 & 1, ObjectType, v3);
LABEL_18:

        goto LABEL_21;
      }
LABEL_32:
      swift_once();
      goto LABEL_14;
    }
  }
  else
  {
    id v8 = *(id *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v9 = &unk_1EB725000;
    if (v8) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
LABEL_21:
  if (v9[6] != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1AD9DD550();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EB725018);
  id v22 = sub_1AD9DD530();
  os_log_type_t v23 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v22, v23))
  {
    id v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v35[0] = v25;
    *(_DWORD *)id v24 = 136446210;
    uint64_t v26 = sub_1AD9E04F0();
    sub_1AD838978(v26, v27, v35);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v22, v23, "[%{public}s] Did cancel", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v25, -1, -1);
    MEMORY[0x1B3E6D1A0](v24, -1, -1);
  }

  uint64_t v28 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(void *)&v4[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1AD9DDA90();
    swift_release();
  }
  *(void *)&v4[v28] = 0;
  swift_release();
  uint64_t v29 = &v4[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate];
  swift_beginAccess();
  unint64_t result = (void *)MEMORY[0x1B3E6D270](v29);
  if (result)
  {
    objc_msgSend(result, sel_quickScheduleManagementViewControllerDidCancel_, v4);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_1AD9BC58C()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AD9DD550();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EB725018);
  uint64_t v3 = sub_1AD9DD530();
  os_log_type_t v4 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v11[0] = v6;
    *(_DWORD *)id v5 = 136446210;
    uint64_t v7 = sub_1AD9E04F0();
    sub_1AD838978(v7, v8, v11);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v3, v4, "[%{public}s] Will save schedule", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v6, -1, -1);
    MEMORY[0x1B3E6D1A0](v5, -1, -1);
  }

  uint64_t v9 = v1 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  unint64_t result = (void *)MEMORY[0x1B3E6D270](v9);
  if (result)
  {
    objc_msgSend(result, sel_quickScheduleManagementViewControllerWillSave_, v1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_1AD9BC760(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AD9DD550();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB725018);
  id v5 = a1;
  uint64_t v6 = sub_1AD9DD530();
  os_log_type_t v7 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v18[0] = v9;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v10 = sub_1AD9E04F0();
    sub_1AD838978(v10, v11, v18);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    if (a1)
    {
      sub_1AD837214(0, (unint64_t *)&qword_1EB725090);
      id v12 = v5;
      uint64_t v13 = sub_1AD9DF730();
      unint64_t v15 = v14;
    }
    else
    {
      unint64_t v15 = 0xE300000000000000;
      uint64_t v13 = 7104878;
    }
    sub_1AD838978(v13, v15, v18);
    sub_1AD9DFEA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v6, v7, "[%{public}s] Did save schedule %{public}s...", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v9, -1, -1);
    MEMORY[0x1B3E6D1A0](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v16 = v2 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  unint64_t result = (void *)MEMORY[0x1B3E6D270](v16);
  if (result)
  {
    objc_msgSend(result, sel_quickScheduleManagementViewController_didSave_, v2, v5);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1AD9BC9E4(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v4 = v3;
  swift_getObjectType();
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1AD9DD550();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EB725018);
  id v9 = a1;
  id v10 = a1;
  unint64_t v11 = sub_1AD9DD530();
  os_log_type_t v12 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v27 = a2;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v28[0] = v14;
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v15 = sub_1AD9E04F0();
    sub_1AD838978(v15, v16, v28);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    if (a1)
    {
      id v17 = a1;
      sub_1AD869CF0();
      uint64_t v18 = sub_1AD9DF730();
      unint64_t v20 = v19;
    }
    else
    {
      unint64_t v20 = 0xE300000000000000;
      uint64_t v18 = 7104878;
    }
    sub_1AD838978(v18, v20, v28);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1AD834000, v11, v12, "[%{public}s] Presenting alert for error %{public}s...", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v14, -1, -1);
    MEMORY[0x1B3E6D1A0](v13, -1, -1);

    a2 = v27;
  }
  else
  {
  }
  uint64_t v21 = v4 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x1B3E6D270](v21);
  if (!v22) {
    return a2();
  }
  os_log_type_t v23 = (void *)v22;
  sub_1AD837214(0, (unint64_t *)&unk_1E9A4B010);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a2;
  *(void *)(v24 + 24) = a3;
  swift_retain();
  id v25 = static UIAlertController.internalOnlyAlert(for:dismissHandler:)(a1, (uint64_t)sub_1AD951A3C, v24);
  swift_release();
  objc_msgSend(v23, sel_quickScheduleManagementViewController_shouldPresent_, v4, v25);

  return swift_unknownObjectRelease();
}

uint64_t sub_1AD9BCD00()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_provenanceSource);
  uint64_t v2 = sub_1AD9DF710();
  uint64_t v4 = v3;
  if (v2 == sub_1AD9DF710() && v4 == v5)
  {
    id v15 = v1;
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v7 = sub_1AD9E02D0();
  id v8 = v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_14:

    return 1;
  }
  uint64_t v9 = sub_1AD9DF710();
  uint64_t v11 = v10;
  if (v9 == sub_1AD9DF710() && v11 == v12)
  {
    uint64_t v14 = 4;
  }
  else if (sub_1AD9E02D0())
  {
    uint64_t v14 = 4;
  }
  else
  {
    uint64_t v14 = 0;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1AD9BCE30(int a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  os_log_type_t v47 = a7;
  uint64_t v48 = a8;
  uint64_t v44 = a5;
  uint64_t v45 = a6;
  uint64_t v42 = a4;
  id v43 = a2;
  int v41 = a1;
  uint64_t v51 = sub_1AD9DF3D0();
  uint64_t v54 = *(void *)(v51 - 8);
  MEMORY[0x1F4188790](v51, v9);
  uint64_t v50 = &v40[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_1AD9DF400();
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  MEMORY[0x1F4188790](v11, v12);
  id v46 = &v40[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_1AD9DD550();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v14, v17);
  uint64_t v18 = &v40[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
  uint64_t v49 = sub_1AD9DFCA0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  unint64_t v19 = (*(unsigned __int8 *)(v15 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v20 = (v16 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = v41;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v15 + 32))(v24 + v19, v18, v14);
  uint64_t v26 = v42;
  id v25 = v43;
  *(void *)(v24 + v20) = v42;
  unint64_t v27 = (void *)(v24 + v21);
  uint64_t v28 = v45;
  *unint64_t v27 = v44;
  v27[1] = v28;
  *(void *)(v24 + v22) = v25;
  id v30 = v47;
  uint64_t v29 = v48;
  *(void *)(v24 + v23) = v47;
  *(void *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8)) = v29;
  aBlock[4] = sub_1AD9C1064;
  void aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD8D34D8;
  aBlock[3] = &block_descriptor_58;
  id v31 = _Block_copy(aBlock);
  id v32 = v26;
  swift_retain();
  id v33 = v25;
  id v34 = v30;
  swift_release();
  uint64_t v35 = v46;
  sub_1AD9DF3F0();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_1AD9C1128((unint64_t *)&qword_1E9A4AD50, MEMORY[0x1E4FBCB00]);
  sub_1AD9C1170(0, &qword_1E9A4C330, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1AD8CCECC();
  uint64_t v37 = v50;
  uint64_t v36 = v51;
  sub_1AD9DFF40();
  uint64_t v38 = (void *)v49;
  MEMORY[0x1B3E6BC50](0, v35, v37, v31);
  _Block_release(v31);

  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v37, v36);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v52 + 8))(v35, v53);
}

uint64_t sub_1AD9BD264(char a1, uint64_t a2, void *a3, uint64_t (*a4)(void), uint64_t a5, void *a6)
{
  if (a1)
  {
    id v9 = a3;
    uint64_t v10 = sub_1AD9DD530();
    os_log_type_t v11 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v44 = v13;
      *(_DWORD *)uint64_t v12 = 136446466;
      uint64_t v14 = sub_1AD9E04F0();
      sub_1AD838978(v14, v15, &v44);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      if (a3)
      {
        sub_1AD837214(0, (unint64_t *)&qword_1E9A4ABE8);
        id v16 = v9;
        uint64_t v17 = sub_1AD9DF730();
        unint64_t v19 = v18;
      }
      else
      {
        uint64_t v17 = 7104878;
        unint64_t v19 = 0xE300000000000000;
      }
      sub_1AD838978(v17, v19, &v44);
      sub_1AD9DFEA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v10, v11, "[%{public}s] Successfully saved sleep schedule %{public}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v13, -1, -1);
      MEMORY[0x1B3E6D1A0](v12, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    id v21 = a3;
    id v22 = a6;
    id v23 = v21;
    id v24 = a6;
    id v25 = sub_1AD9DD530();
    os_log_type_t v26 = sub_1AD9DFBC0();
    if (os_log_type_enabled(v25, v26))
    {
      id v43 = a4;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v44 = v28;
      *(_DWORD *)uint64_t v27 = 136446722;
      uint64_t v29 = sub_1AD9E04F0();
      sub_1AD838978(v29, v30, &v44);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2082;
      if (a6)
      {
        id v31 = a6;
        sub_1AD869CF0();
        uint64_t v32 = sub_1AD9DF730();
        unint64_t v34 = v33;
      }
      else
      {
        unint64_t v34 = 0xE300000000000000;
        uint64_t v32 = 7104878;
      }
      sub_1AD838978(v32, v34, &v44);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v27 + 22) = 2082;
      if (a3)
      {
        sub_1AD837214(0, (unint64_t *)&qword_1E9A4ABE8);
        id v35 = v23;
        uint64_t v36 = sub_1AD9DF730();
        unint64_t v38 = v37;
      }
      else
      {
        unint64_t v38 = 0xE300000000000000;
        uint64_t v36 = 7104878;
      }
      sub_1AD838978(v36, v38, &v44);
      sub_1AD9DFEA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v25, v26, "[%{public}s] Failed to save sleep schedule with error: %{public}s, %{public}s", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v28, -1, -1);
      MEMORY[0x1B3E6D1A0](v27, -1, -1);

      a4 = v43;
    }
    else
    {
    }
    id v39 = objc_msgSend(self, sel_sharedBehavior);
    if (v39)
    {
      id v40 = v39;
      unsigned int v41 = objc_msgSend(v39, sel_isAppleInternalInstall);

      if (v41) {
        return sub_1AD9BC9E4(a6, a4, a5);
      }
    }
  }
  return a4();
}

uint64_t sub_1AD9BD724(void *a1, char a2, id a3, uint64_t a4)
{
  uint64_t v59 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = sub_1AD9DD550();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v60 = v12;
  id v61 = (char *)v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v13);
  unint64_t v15 = (char *)v55 - v14;
  char v63 = v4;
  id v16 = *(id *)&v4[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider];
  id v17 = sub_1AD94D930();

  if (a2)
  {
    id v18 = objc_msgSend(v17, sel_overrideOccurrence);
    if (v18)
    {
      unint64_t v19 = v18;
      if (qword_1EB725030 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v8, (uint64_t)qword_1EB725018);
      unint64_t v20 = sub_1AD9DD530();
      os_log_type_t v21 = sub_1AD9DFBE0();
      if (os_log_type_enabled(v20, v21))
      {
        id v58 = a3;
        id v22 = (uint8_t *)swift_slowAlloc();
        id v57 = (id)swift_slowAlloc();
        aBlock[0] = (uint64_t)v57;
        os_log_t v56 = v20;
        id v23 = v22;
        *(_DWORD *)id v22 = 136446210;
        v55[1] = v22 + 4;
        uint64_t v24 = sub_1AD9E04F0();
        uint64_t v65 = sub_1AD838978(v24, v25, aBlock);
        sub_1AD9DFEA0();
        a3 = v58;
        swift_bridgeObjectRelease();
        os_log_t v26 = v56;
        os_log_type_t v27 = v21;
        uint64_t v28 = v23;
        _os_log_impl(&dword_1AD834000, v56, v27, "[%{public}s] removing override", v23, 0xCu);
        id v29 = v57;
        swift_arrayDestroy();
        MEMORY[0x1B3E6D1A0](v29, -1, -1);
        MEMORY[0x1B3E6D1A0](v28, -1, -1);
      }
      else
      {
      }
      objc_msgSend(v17, sel_removeOccurrence_, v19);
    }
  }
  objc_msgSend(v17, sel_saveOccurrence_, v59);
  unint64_t v30 = (void *)swift_allocObject();
  v30[2] = a3;
  uint64_t v30[3] = a4;
  uint64_t v59 = v30;
  v30[4] = v17;
  uint64_t v31 = qword_1EB725030;
  id v58 = v17;
  swift_retain();
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v32 = __swift_project_value_buffer(v8, (uint64_t)qword_1EB725018);
  uint64_t v64 = v8;
  unint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v33(v15, v32, v8);
  id v34 = objc_msgSend(self, sel_unknownProvenance);
  id v35 = v63;
  sub_1AD9BCD00();
  id v36 = (id)HKSPAnalyticsScheduleChangeContext();

  sub_1AD9DF600();
  uint64_t v37 = v9;

  id v57 = *(id *)&v35[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore];
  os_log_t v56 = (os_log_t)sub_1AD9DF5F0();
  swift_bridgeObjectRelease();
  unint64_t v38 = v61;
  uint64_t v39 = v64;
  v33(v61, (uint64_t)v15, v64);
  unint64_t v40 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  unint64_t v41 = (v60 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v42 = (v41 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v43 = (v42 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v44 + v40, v38, v39);
  id v46 = v58;
  uint64_t v45 = v59;
  *(void *)(v44 + v4sub_1AD95AB40(3, 1) = v58;
  os_log_type_t v47 = (void *)(v44 + v42);
  *os_log_type_t v47 = sub_1AD9C19EC;
  v47[1] = v45;
  uint64_t v48 = ObjectType;
  uint64_t v49 = v63;
  *(void *)(v44 + v43) = v63;
  *(void *)(v44 + ((v43 + 15) & 0xFFFFFFFFFFFFFFF8)) = v48;
  aBlock[4] = (uint64_t)sub_1AD9C0F70;
  void aBlock[5] = v44;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1AD8A776C;
  aBlock[3] = (uint64_t)&block_descriptor_87;
  uint64_t v50 = _Block_copy(aBlock);
  id v51 = v46;
  swift_retain();
  uint64_t v52 = v49;
  swift_release();
  os_log_t v53 = v56;
  objc_msgSend(v57, sel_saveCurrentSleepSchedule_options_context_completion_, v51, 0, v56, v50);
  _Block_release(v50);

  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v64);
  return swift_release();
}

void sub_1AD9BDCDC(void (*a1)(), int a2, id a3)
{
  objc_msgSend(a3, sel_copy);
  sub_1AD9DFF20();
  swift_unknownObjectRelease();
  sub_1AD837214(0, (unint64_t *)&qword_1EB725090);
  swift_dynamicCast();
  a1();
}

void sub_1AD9BDD80(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  sub_1AD9C1170(0, &qword_1E9A4CE80, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  char v7 = (char *)&v31 - v6;
  uint64_t v8 = sub_1AD9DCB80();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v14);
  id v16 = (char *)&v31 - v15;
  id v17 = (id)HKSPSleepURL();
  if (v17)
  {
    id v18 = v17;
    sub_1AD9DCB60();

    unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v19(v7, v13, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v19(v16, v7, v8);
      DeepLinkOpener.open(url:completion:)((uint64_t)v16, 0, 0);
      objc_msgSend(v2, sel_cancelWithAnimated_, 0);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1AD9856C4((uint64_t)v7);
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1AD9DD550();
  __swift_project_value_buffer(v20, (uint64_t)qword_1EB725018);
  id v21 = a1;
  id v22 = sub_1AD9DD530();
  os_log_type_t v23 = sub_1AD9DFBC0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v32 = v25;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v26 = sub_1AD9E04F0();
    uint64_t v31 = sub_1AD838978(v26, v27, &v32);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    uint64_t v31 = (uint64_t)v21;
    type metadata accessor for HKSPSleepLaunchURLRoute(0);
    id v28 = v21;
    uint64_t v29 = sub_1AD9DF730();
    uint64_t v31 = sub_1AD838978(v29, v30, &v32);
    sub_1AD9DFEA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v22, v23, "[%{public}s] Unable to create URL for route %{public}s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v25, -1, -1);
    MEMORY[0x1B3E6D1A0](v24, -1, -1);
  }
  else
  {
  }
}

void QuickScheduleManagementViewController.featureAvailabilityProvidingDidUpdateOnboardingCompletion(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  v58[3] = swift_getObjectType();
  uint64_t v4 = sub_1AD9DF410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (void *)((char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AD837214(0, (unint64_t *)&qword_1EB724D50);
  uint64_t *v8 = sub_1AD9DFCA0();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x1E4FBCBF0], v4);
  char v9 = sub_1AD9DF420();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v8, v4);
  if (v9)
  {
    if (qword_1EB725030 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v10 = sub_1AD9DD550();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EB725018);
  uint64_t v11 = sub_1AD9DD530();
  os_log_type_t v12 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v60 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v15 = sub_1AD9E04F0();
    uint64_t v59 = sub_1AD838978(v15, v16, &v60);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v11, v12, "[%{public}s] Observed onboarding completion update", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v14, -1, -1);
    MEMORY[0x1B3E6D1A0](v13, -1, -1);
  }

  id v17 = objc_msgSend(v2, sel_viewControllers);
  sub_1AD837214(0, &qword_1E9A49270);
  unint64_t v18 = sub_1AD9DF860();

  if (!(v18 >> 62))
  {
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_7;
    }
LABEL_28:
    swift_bridgeObjectRelease();
LABEL_29:
    uint64_t v52 = sub_1AD9DD530();
    os_log_type_t v53 = sub_1AD9DFBE0();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v60 = v55;
      *(_DWORD *)uint64_t v54 = 136446210;
      uint64_t v56 = sub_1AD9E04F0();
      uint64_t v59 = sub_1AD838978(v56, v57, &v60);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v52, v53, "[%{public}s] Onboarding view not displayed - skipping update", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v55, -1, -1);
      MEMORY[0x1B3E6D1A0](v54, -1, -1);
    }

    objc_msgSend(*(id *)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability], sel_unregisterObserver_, v2);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_1AD9E0190();
  swift_bridgeObjectRelease();
  if (!v51) {
    goto LABEL_28;
  }
LABEL_7:
  if ((v18 & 0xC000000000000001) != 0)
  {
    id v19 = (id)MEMORY[0x1B3E6BFF0](0, v18);
  }
  else
  {
    if (!*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v19 = *(id *)(v18 + 32);
  }
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = type metadata accessor for OnboardPromptViewController();
  uint64_t v22 = swift_dynamicCastClass();

  if (!v22) {
    goto LABEL_29;
  }
  uint64_t ObjectType = swift_getObjectType();
  unsigned __int8 v24 = HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(ObjectType);
  uint64_t v25 = sub_1AD9DD530();
  os_log_type_t v26 = sub_1AD9DFBE0();
  BOOL v27 = os_log_type_enabled(v25, v26);
  if (v24)
  {
    if (v27)
    {
      uint64_t v28 = swift_slowAlloc();
      v58[2] = v21;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v60 = v30;
      *(_DWORD *)uint64_t v29 = 136446210;
      v58[1] = v29 + 4;
      uint64_t v31 = sub_1AD9E04F0();
      uint64_t v59 = sub_1AD838978(v31, v32, &v60);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AD834000, v25, v26, "[%{public}s] Onboarded - setting new root view controller", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v30, -1, -1);
      MEMORY[0x1B3E6D1A0](v29, -1, -1);
    }

    unint64_t v33 = *(void **)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider];
    swift_unknownObjectRetain();
    id v34 = v33;
    char v35 = sub_1AD9C0070(a1, v34);
    unsigned __int8 v36 = HKFeatureAvailabilityProviding.pairedWatchSupportsSleep.getter(ObjectType);
    id v37 = sub_1AD9BB024(v34, v36 & 1, (uint64_t)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_gregorianCalendar], v35);
    sub_1AD870B1C();
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_1AD9E71F0;
    *(void *)(v38 + 32) = v37;
    uint64_t v60 = v38;
    sub_1AD9DF870();
    id v39 = v37;
    unint64_t v40 = (void *)sub_1AD9DF850();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setViewControllers_animated_, v40, 0);

    type metadata accessor for QuickScheduleOverrideViewController();
    uint64_t v41 = swift_dynamicCastClass();
    if (v41)
    {
      unint64_t v42 = &off_1F0472E58;
      unint64_t v43 = &OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate;
    }
    else
    {
      type metadata accessor for EnableSchedulePromptViewController();
      uint64_t v41 = swift_dynamicCastClass();
      if (v41)
      {
        unint64_t v42 = &off_1F0472E90;
        unint64_t v43 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate;
      }
      else
      {
        uint64_t v41 = swift_dynamicCastClass();
        if (!v41)
        {
LABEL_24:
          id v48 = v39;
          id v49 = objc_msgSend(v48, sel_navigationItem);
          id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_cancelWithAnimated_);
          objc_msgSend(v49, sel_setLeftBarButtonItem_, v50);

          objc_msgSend(*(id *)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability], sel_unregisterObserver_, v2);
          return;
        }
        unint64_t v42 = &off_1F0472E78;
        unint64_t v43 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate;
      }
    }
    *(void *)(v41 + *v43 + 8) = v42;
    swift_unknownObjectWeakAssign();
    goto LABEL_24;
  }
  if (v27)
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v60 = v45;
    *(_DWORD *)uint64_t v44 = 136446210;
    uint64_t v46 = sub_1AD9E04F0();
    uint64_t v59 = sub_1AD838978(v46, v47, &v60);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v25, v26, "[%{public}s] Not onboarded - skipping update", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v45, -1, -1);
    MEMORY[0x1B3E6D1A0](v44, -1, -1);
  }
}

void sub_1AD9BEAA4()
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EB727930;
  uint64_t v1 = (void *)sub_1AD9DF6D0();
  id v2 = objc_msgSend(self, sel_imageNamed_inBundle_, v1, v0);

  if (v2) {
    qword_1E9A4D970 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

void sub_1AD9BEB6C()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TintedTitleTrayButton();
  objc_msgSendSuper2(&v5, sel_tintColorDidChange);
  id v1 = objc_msgSend(v0, sel_tintColor);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_setTitleColor_forState_, v1, 0);
    id v3 = objc_msgSend(v2, sel_colorWithAlphaComponent_, 0.5);
    objc_msgSend(v0, sel_setTitleColor_forState_, v3, 1);

    id v4 = objc_msgSend(v2, sel_colorWithAlphaComponent_, 0.3);
    objc_msgSend(v0, sel_setTitleColor_forState_, v4, 2);
  }
  else
  {
    __break(1u);
  }
}

id sub_1AD9BED78()
{
  return sub_1AD9BF834((uint64_t (*)(void))type metadata accessor for TintedTitleTrayButton);
}

id sub_1AD9BEE40()
{
  return sub_1AD9BF834((uint64_t (*)(void))type metadata accessor for EnableSchedulePromptViewController);
}

id sub_1AD9BEE68(char a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  id v3 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v4 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  objc_super v5 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  if (qword_1E9A49120 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_1E9A4D970;
  v22.receiver = v1;
  v22.super_class = (Class)type metadata accessor for OnboardPromptViewController();
  id v7 = objc_msgSendSuper2(&v22, sel_initWithTitle_detailText_icon_contentLayout_, v3, v5, v6, 2, 0xE000000000000000);

  uint64_t v8 = (void *)qword_1EB727930;
  id v9 = v7;
  id v10 = v8;
  sub_1AD9DCA70();

  id v11 = objc_msgSend(self, sel_boldButton, 0xE000000000000000);
  objc_msgSend(v11, sel_addTarget_action_forControlEvents_, v9, sel_beginButtonAction, 64);
  os_log_type_t v12 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v11, sel_setTitle_forState_, v12, 0);

  id v13 = objc_msgSend(v9, sel_buttonTray);
  objc_msgSend(v13, sel_addButton_, v11);

  swift_bridgeObjectRelease();
  id v14 = v9;
  if (a1)
  {
    uint64_t v15 = (void *)qword_1EB727930;
    id v16 = v9;
    id v17 = v15;
    sub_1AD9DCA70();

    type metadata accessor for TintedTitleTrayButton();
    id v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init, 0xE000000000000000);
    objc_msgSend(v18, sel_addTarget_action_forControlEvents_, v16, sel_removeButtonAction, 64);
    id v19 = (void *)sub_1AD9DF6D0();
    objc_msgSend(v18, sel_setTitle_forState_, v19, 0);

    id v14 = objc_msgSend(v16, sel_buttonTray);
    objc_msgSend(v14, sel_addButton_, v18);

    swift_bridgeObjectRelease();
  }

  return v9;
}

uint64_t sub_1AD9BF2DC(uint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t result = MEMORY[0x1B3E6D270](a2+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate);
    if (result)
    {
      sub_1AD9C0A40();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void sub_1AD9BF3BC(uint64_t a1, uint64_t a2)
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  objc_super v5 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, 0, v5, 0, 0xE000000000000000);

  id v7 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  id v9 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  os_log_type_t v23 = sub_1AD9AF0DC;
  uint64_t v24 = v8;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_1AD9199DC;
  objc_super v22 = &block_descriptor_41;
  id v10 = _Block_copy(&aBlock);
  swift_release();
  id v11 = self;
  id v12 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v9, 2, v10, 0xE000000000000000);
  _Block_release(v10);

  objc_msgSend(v6, sel_addAction_, v12);
  id v13 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  swift_retain();
  uint64_t v15 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  os_log_type_t v23 = sub_1AD9AF0B0;
  uint64_t v24 = v14;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_1AD9199DC;
  objc_super v22 = &block_descriptor_40;
  id v16 = _Block_copy(&aBlock);
  swift_release();
  id v17 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v15, 1, v16, 0xE000000000000000);
  _Block_release(v16);

  objc_msgSend(v6, sel_addAction_, v17);
  objc_msgSend(v18, sel_presentViewController_animated_completion_, v6, 1, 0);
}

void sub_1AD9BF7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = a5;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1AD9BF81C()
{
  return sub_1AD9BF834((uint64_t (*)(void))type metadata accessor for OnboardPromptViewController);
}

id sub_1AD9BF834(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1AD9BF884(void *a1, int a2, uint64_t a3, int a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v45 = a5;
  int v41 = a2;
  LODWORD(v42) = a4;
  id v40 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = sub_1AD9DCE40();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  id v12 = (char *)&ObjectType - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SleepScheduleProvider();
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_alarmConfigurationObserver] = 0;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_modelEditObserver] = 0;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_significantTimeChangeObserver] = 0;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_nextOccurrenceChangeObserver] = 0;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_scheduleChangeObserver] = 0;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_sleepDurationGoalObserver] = 0;
  v49[3] = v13;
  v49[4] = &protocol witness table for SleepScheduleProvider;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_validScheduleRangeObserver] = 0;
  v49[0] = a3;
  *(void *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_willResignActiveObserver] = 0;
  a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_modelHasChanged] = 0;
  uint64_t v14 = OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_tonePickerStyleProvider;
  uint64_t v15 = (objc_class *)type metadata accessor for TonePickerStyleProvider();
  id v16 = objc_allocWithZone(v15);
  id v17 = a6;
  *(void *)&a6[v14] = objc_msgSend(v16, sel_init);
  uint64_t v18 = OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_vibrationPickerStyleProvider;
  *(void *)&v17[v18] = objc_msgSend(objc_allocWithZone(v15), sel_init);
  *(void *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_dataSource] = 0;
  uint64_t v19 = *(void *)(a3 + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_currentGoalPublisher);
  uint64_t v20 = *(void *)(a3 + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_currentSchedulePublisher);
  uint64_t v43 = v9;
  uint64_t v44 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v45, v8);
  type metadata accessor for ScheduleOccurrenceEditModel();
  swift_allocObject();
  id v21 = v40;
  swift_retain();
  swift_retain();
  uint64_t v22 = sub_1AD8945FC(v21, v41, 1, 0, v19, v20, v42, (uint64_t)v12);

  swift_release();
  swift_release();
  *(void *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_model] = v22;
  sub_1AD841030((uint64_t)v49, (uint64_t)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_sleepScheduleProvider]);
  type metadata accessor for AlarmPreviewPlayer();
  swift_allocObject();
  uint64_t v23 = swift_retain();
  *(void *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_alarmPreviewPlayer] = AlarmPreviewPlayer.init(model:)(v23);

  uint64_t v24 = (objc_class *)type metadata accessor for QuickScheduleOverrideViewController();
  v48.receiver = v17;
  v48.super_class = v24;
  id v25 = objc_msgSendSuper2(&v48, sel_initWithStyle_, 2);
  uint64_t v26 = qword_1EB725030;
  id v27 = v25;
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1AD9DD550();
  __swift_project_value_buffer(v28, (uint64_t)qword_1EB725018);
  id v29 = v21;
  uint64_t v30 = sub_1AD9DD530();
  os_log_type_t v31 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = swift_slowAlloc();
    unint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v47 = v42;
    *(_DWORD *)uint64_t v32 = 136446466;
    nullsub_1(ObjectType);
    uint64_t v34 = sub_1AD9E04F0();
    uint64_t v46 = sub_1AD838978(v34, v35, &v47);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2114;
    uint64_t v46 = (uint64_t)v29;
    id v36 = v29;
    sub_1AD9DFEA0();
    *unint64_t v33 = v29;

    _os_log_impl(&dword_1AD834000, v30, v31, "[%{public}s] initializing with override occurrence %{public}@", (uint8_t *)v32, 0x16u);
    sub_1AD8B473C();
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v33, -1, -1);
    uint64_t v37 = v42;
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v37, -1, -1);
    MEMORY[0x1B3E6D1A0](v32, -1, -1);
  }
  else
  {
  }
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  return v27;
}

void sub_1AD9BFD98()
{
}

uint64_t sub_1AD9BFDAC(void *a1, char a2)
{
  objc_super v3 = v2;
  swift_getObjectType();
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1AD9DD550();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB725018);
  id v7 = a1;
  uint64_t v8 = sub_1AD9DD530();
  os_log_type_t v9 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v11 = sub_1AD9E04F0();
    sub_1AD838978(v11, v12, &v20);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2114;
    uint64_t v13 = v7;
    sub_1AD9DFEA0();
    *uint64_t v18 = v7;

    _os_log_impl(&dword_1AD834000, v8, v9, "[%{public}s] Schedule occurrence was modified: %{public}@", (uint8_t *)v10, 0x16u);
    sub_1AD8B473C();
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v19, -1, -1);
    MEMORY[0x1B3E6D1A0](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(void *)&v3[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1AD9DDA90();
    swift_release();
  }
  *(void *)&v3[v14] = 0;
  swift_release();
  sub_1AD9BC58C();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v3;
  id v16 = v3;
  sub_1AD9BD724(v7, a2 & 1, sub_1AD9C1798, v15);
  return swift_release();
}

uint64_t sub_1AD9C0070(uint64_t a1, void *a2)
{
  uint64_t ObjectType = swift_getObjectType();
  unsigned __int8 v4 = HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(ObjectType);
  id v5 = a2;
  swift_retain();
  sub_1AD9DDB00();

  swift_release();
  if (v9)
  {
    id v6 = v9;
    unsigned int v7 = objc_msgSend(v6, sel_isEnabled);

    swift_unknownObjectRelease();
    if (v4) {
      return v7 ^ 1;
    }
    else {
      return 2;
    }
  }
  else
  {
    swift_unknownObjectRelease();

    if (v4) {
      return 0;
    }
    else {
      return 3;
    }
  }
}

uint64_t type metadata accessor for QuickScheduleManagementViewController()
{
  uint64_t result = qword_1E9A4D9C8;
  if (!qword_1E9A4D9C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for EnableSchedulePromptViewController()
{
  return self;
}

uint64_t type metadata accessor for OnboardPromptViewController()
{
  return self;
}

uint64_t sub_1AD9C01E4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AD9C021C(uint64_t a1)
{
  sub_1AD9BBF8C(a1, v1);
}

uint64_t sub_1AD9C0224@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1B3E6D270](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1AD9C027C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1AD9C02D4()
{
  return type metadata accessor for QuickScheduleManagementViewController();
}

uint64_t sub_1AD9C02DC()
{
  uint64_t result = sub_1AD9DCE40();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for QuickScheduleManagementViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for QuickScheduleManagementViewController);
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.sleepDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.sleepDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.sleepDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.__allocating_init(sleepStore:provenanceSource:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t type metadata accessor for TintedTitleTrayButton()
{
  return self;
}

uint64_t sub_1AD9C0488()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_41(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_41()
{
  return swift_release();
}

uint64_t sub_1AD9C04D8()
{
  return swift_deallocObject();
}

uint64_t sub_1AD9C0510(uint64_t a1)
{
  return sub_1AD9BF2DC(a1, *(void *)(v1 + 16));
}

id sub_1AD9C0518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *(void *)&v7[OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  os_log_type_t v9 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  v18.receiver = v7;
  v18.super_class = (Class)type metadata accessor for EnableSchedulePromptViewController();
  id v11 = objc_msgSendSuper2(&v18, sel_initWithTitle_detailText_icon_contentLayout_, v9, v10, a7, 2);

  unint64_t v12 = self;
  id v13 = v11;
  id v14 = objc_msgSend(v12, sel_boldButton);
  objc_msgSend(v14, sel_addTarget_action_forControlEvents_, v13, sel_enableButtonAction, 64);
  uint64_t v15 = (void *)sub_1AD9DF6D0();
  objc_msgSend(v14, sel_setTitle_forState_, v15, 0);

  id v16 = objc_msgSend(v13, sel_buttonTray);
  objc_msgSend(v16, sel_addButton_, v14);

  return v13;
}

id sub_1AD9C06B8()
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EB727930;
  uint64_t v1 = sub_1AD9DCA70();
  uint64_t v3 = v2;

  id v4 = (id)qword_1EB727930;
  uint64_t v5 = sub_1AD9DCA70();
  uint64_t v7 = v6;

  id v8 = (id)qword_1EB727930;
  uint64_t v9 = sub_1AD9DCA70();
  uint64_t v11 = v10;

  if (qword_1E9A49120 != -1) {
    swift_once();
  }
  unint64_t v12 = (void *)qword_1E9A4D970;
  id v13 = objc_allocWithZone((Class)type metadata accessor for EnableSchedulePromptViewController());
  id v14 = sub_1AD9C0518(v1, v3, v5, v7, v9, v11, v12);
  swift_bridgeObjectRelease();
  return v14;
}

void sub_1AD9C089C(const char *a1, void **a2)
{
  swift_getObjectType();
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AD9DD550();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB725018);
  uint64_t v5 = sub_1AD9DD530();
  os_log_type_t v6 = sub_1AD9DFBE0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_1AD9E04F0();
    sub_1AD838978(v9, v10, &v11);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v5, v6, a1, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v8, -1, -1);
    MEMORY[0x1B3E6D1A0](v7, -1, -1);
  }

  sub_1AD9BDD80(*a2);
}

uint64_t sub_1AD9C0A40()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_1AD9DD550();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v44 = v6;
  uint64_t v45 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v47 = (char *)&v40 - v9;
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v3, (uint64_t)qword_1EB725018);
  uint64_t v11 = sub_1AD9DD530();
  os_log_type_t v12 = sub_1AD9DFBE0();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v48 = v3;
  uint64_t v46 = ObjectType;
  if (v13)
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)id v14 = 136446210;
    uint64_t v16 = sub_1AD9E04F0();
    uint64_t v49 = sub_1AD838978(v16, v17, aBlock);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v11, v12, "[%{public}s] Removing existing sleep schedule...", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v15, -1, -1);
    MEMORY[0x1B3E6D1A0](v14, -1, -1);
  }

  uint64_t v18 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(void *)&v1[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1AD9DDA90();
    swift_release();
  }
  *(void *)&v1[v18] = 0;
  swift_release();
  sub_1AD9BC58C();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v1;
  uint64_t v19 = v4;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  id v21 = v47;
  v20(v47, v10, v48);
  uint64_t v22 = self;
  uint64_t v23 = v1;
  id v24 = objc_msgSend(v22, sel_unknownProvenance);
  sub_1AD9BCD00();
  id v25 = (id)HKSPAnalyticsScheduleChangeContext();

  sub_1AD9DF600();
  id v42 = *(id *)&v23[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore];
  uint64_t v41 = sub_1AD9DF5F0();
  swift_bridgeObjectRelease();
  uint64_t v26 = v45;
  id v27 = v21;
  uint64_t v28 = v48;
  v20(v45, (uint64_t)v27, v48);
  unint64_t v29 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v30 = (v44 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v33 + v29, v26, v28);
  *(void *)(v33 + v30) = 0;
  uint64_t v34 = (void *(**)())(v33 + v31);
  uint64_t v35 = v43;
  *uint64_t v34 = sub_1AD9C0F44;
  v34[1] = (void *(*)())v35;
  *(void *)(v33 + v32) = v23;
  *(void *)(v33 + ((v32 + 15) & 0xFFFFFFFFFFFFFFF8)) = v46;
  aBlock[4] = (uint64_t)sub_1AD9C0F70;
  void aBlock[5] = v33;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1AD8A776C;
  aBlock[3] = (uint64_t)&block_descriptor_52;
  id v36 = _Block_copy(aBlock);
  uint64_t v37 = v23;
  swift_retain();
  swift_release();
  uint64_t v38 = (void *)v41;
  objc_msgSend(v42, sel_saveCurrentSleepSchedule_options_context_completion_, 0, 0, v41, v36);
  _Block_release(v36);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v47, v28);
  return swift_release();
}

void *sub_1AD9C0F44()
{
  return sub_1AD9BC760(0);
}

uint64_t sub_1AD9C0F74()
{
  uint64_t v1 = sub_1AD9DD550();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9C1064()
{
  uint64_t v1 = *(void *)(sub_1AD9DD550() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  char v5 = *(unsigned char *)(v0 + 16);
  uint64_t v6 = *(void **)(v0 + v3);
  uint64_t v7 = *(uint64_t (**)(void))(v0 + v4);
  uint64_t v8 = *(void *)(v0 + v4 + 8);
  uint64_t v9 = *(void **)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8));
  return sub_1AD9BD264(v5, v0 + v2, v6, v7, v8, v9);
}

uint64_t sub_1AD9C1128(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1AD9C1170(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1AD9C11D4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_1AD9DD550();
  uint64_t v54 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v51 = v5;
  uint64_t v52 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v55 = (char *)&v42 - v8;
  if (qword_1EB725030 != -1) {
    swift_once();
  }
  id v50 = (id)__swift_project_value_buffer(v3, (uint64_t)qword_1EB725018);
  uint64_t v9 = sub_1AD9DD530();
  os_log_type_t v10 = sub_1AD9DFBE0();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v53 = ObjectType;
  if (v11)
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)os_log_type_t v12 = 136446210;
    uint64_t v14 = sub_1AD9E04F0();
    uint64_t v56 = sub_1AD838978(v14, v15, aBlock);
    sub_1AD9DFEA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AD834000, v9, v10, "[%{public}s] Enabling sleep schedule...", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v13, -1, -1);
    MEMORY[0x1B3E6D1A0](v12, -1, -1);
  }

  uint64_t v16 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(void *)&v1[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1AD9DDA90();
    swift_release();
  }
  *(void *)&v1[v16] = 0;
  swift_release();
  sub_1AD9BC58C();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  uint64_t v18 = v17;
  uint64_t v19 = *(void **)&v1[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider];
  uint64_t v20 = v1;
  id v21 = v19;
  id v22 = sub_1AD94D930();

  objc_msgSend(v22, sel_setEnabled_, 1);
  uint64_t v23 = (void (*)())swift_allocObject();
  *((void *)v23 + 2) = sub_1AD9C19F0;
  *((void *)v23 + 3) = v18;
  id v48 = v22;
  uint64_t v49 = v18;
  *((void *)v23 + 4) = v22;
  uint64_t v24 = v54;
  uint64_t v45 = *(void (**)(char *, id, uint64_t))(v54 + 16);
  v45(v55, v50, v3);
  id v25 = self;
  id v50 = v22;
  swift_retain();
  id v26 = objc_msgSend(v25, sel_unknownProvenance);
  uint64_t v43 = v20;
  sub_1AD9BCD00();
  id v27 = (id)HKSPAnalyticsScheduleChangeContext();

  sub_1AD9DF600();
  id v47 = *(id *)&v20[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore];
  uint64_t v46 = sub_1AD9DF5F0();
  swift_bridgeObjectRelease();
  uint64_t v28 = v52;
  uint64_t v29 = v3;
  uint64_t v44 = v3;
  v45(v52, v55, v3);
  unint64_t v30 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v31 = (v51 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v34 + v30, v28, v29);
  *(void *)(v34 + v3sub_1AD95AB40(3, 1) = v48;
  uint64_t v35 = (void (**)())(v34 + v32);
  *uint64_t v35 = sub_1AD9C1774;
  v35[1] = v23;
  id v36 = v43;
  *(void *)(v34 + v33) = v43;
  *(void *)(v34 + ((v33 + 15) & 0xFFFFFFFFFFFFFFF8)) = v53;
  aBlock[4] = (uint64_t)sub_1AD9C0F70;
  void aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1AD8A776C;
  aBlock[3] = (uint64_t)&block_descriptor_74;
  uint64_t v37 = _Block_copy(aBlock);
  uint64_t v38 = v36;
  id v39 = v50;
  swift_retain();
  swift_release();
  uint64_t v40 = (void *)v46;
  objc_msgSend(v47, sel_saveCurrentSleepSchedule_options_context_completion_, v39, 0, v46, v37);
  _Block_release(v37);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v55, v44);
  swift_release();

  return swift_release();
}

void sub_1AD9C1774()
{
  sub_1AD9BDCDC(*(void (**)())(v0 + 16), *(void *)(v0 + 24), *(id *)(v0 + 32));
}

void *sub_1AD9C1798(void *a1)
{
  return sub_1AD9BC760(a1);
}

uint64_t objectdestroy_66Tm()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t objectdestroy_48Tm()
{
  uint64_t v1 = sub_1AD9DD550();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9C18DC(int a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_1AD9DD550() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  os_log_type_t v10 = *(void **)(v2 + v7);
  uint64_t v11 = *(void *)(v2 + v8);
  uint64_t v12 = *(void *)(v2 + v8 + 8);
  uint64_t v13 = *(void **)(v2 + v9);
  uint64_t v14 = *(void *)(v2 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_1AD9BCE30(a1, a2, v2 + v6, v10, v11, v12, v13, v14);
}

id SleepTreatmentRowViewProvider.view.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  type metadata accessor for SleepSettingsModel();
  sub_1AD9C1B98(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
  uint64_t v4 = sub_1AD9DE090();
  uint64_t v13 = v5;
  uint64_t v14 = v4;
  type metadata accessor for WatchAppInstalledProvider();
  sub_1AD9C1B98(&qword_1E9A4D5B8, (void (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider);
  uint64_t v6 = sub_1AD9DE090();
  uint64_t v8 = v7;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AD9DDBC0();
  swift_release();
  swift_release();
  uint64_t v9 = sub_1AD9DDAA0();
  id v12 = *(id *)(v3 + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_watchAppInstalledProvider);
  uint64_t v10 = sub_1AD9DDAA0();
  *a1 = v14;
  a1[1] = v13;
  a1[2] = v6;
  a1[3] = v8;
  a1[4] = v9;
  a1[5] = v15;
  a1[6] = v10;
  a1[7] = (uint64_t)v12;
  return v12;
}

uint64_t sub_1AD9C1B98(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for SleepTreatmentRowViewProvider()
{
  return &type metadata for SleepTreatmentRowViewProvider;
}

uint64_t sub_1AD9C1BF8()
{
  return sub_1AD9C1CB8(&qword_1E9A4D5E0, (void (*)(uint64_t))sub_1AD9968F8, (void (*)(void))sub_1AD996AC0, (void (*)(void))sub_1AD996BE8);
}

void sub_1AD9C1C54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_1AD9C1CB8(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepTreatmentRowView()
{
  return &type metadata for SleepTreatmentRowView;
}

uint64_t sub_1AD9C1D54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9C1D70@<X0>(void *a1@<X0>, void *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v29 = a4;
  sub_1AD9C2258();
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v28 = v6;
  MEMORY[0x1F4188790](v6, v7);
  id v26 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepSettingsModel();
  sub_1AD9C1B98(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
  uint64_t v9 = sub_1AD9DE090();
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  type metadata accessor for WatchAppInstalledProvider();
  sub_1AD9C1B98(&qword_1E9A4D5B8, (void (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider);
  uint64_t v11 = sub_1AD9DE090();
  uint64_t v13 = v12;
  LOBYTE(v30) = 0;
  sub_1AD9DF040();
  if (a1)
  {
    char v14 = v32;
    uint64_t v15 = v33;
    id v16 = a1;
    uint64_t v17 = sub_1AD9DDAA0();
    if (a2)
    {
      uint64_t v18 = v17;
      id v19 = a2;
      uint64_t v20 = sub_1AD9DDAA0();
      uint64_t v32 = v25;
      uint64_t v33 = v24;
      uint64_t v34 = v11;
      uint64_t v35 = v13;
      char v36 = v14;
      uint64_t v37 = v15;
      uint64_t v38 = v18;
      id v39 = a1;
      uint64_t v40 = v20;
      uint64_t v41 = a2;
      sub_1AD9C2358();
      sub_1AD9C23D4(0);
      uint64_t v30 = MEMORY[0x1E4F3E2F8];
      uint64_t v31 = MEMORY[0x1E4F3E2E8];
      swift_getOpaqueTypeConformance2();
      sub_1AD9C1CB8(&qword_1E9A4DA10, sub_1AD9C23D4, (void (*)(void))sub_1AD9C24D4, (void (*)(void))sub_1AD996BE8);
      id v21 = v26;
      sub_1AD9DDF10();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v21, v28);
    }
  }
  else
  {
    sub_1AD9DE080();
    __break(1u);
  }
  uint64_t result = sub_1AD9DE080();
  __break(1u);
  return result;
}

uint64_t sub_1AD9C207C()
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v0 = (id)qword_1EB727930;
  uint64_t v1 = sub_1AD9DCA70();
  uint64_t v3 = v2;

  swift_bridgeObjectRelease();
  uint64_t v15 = v3;
  sub_1AD85F688();
  uint64_t v4 = sub_1AD9DEAF0();
  uint64_t v6 = v5;
  LOBYTE(v3) = v7 & 1;
  id v8 = objc_msgSend(self, sel_labelColor, 0xE000000000000000, v1, v15);
  MEMORY[0x1B3E6ADC0](v8);
  uint64_t v9 = sub_1AD9DEA70();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_1AD861548(v4, v6, v3);
  swift_bridgeObjectRelease();
  sub_1AD9DECC0();
  sub_1AD861548(v9, v11, v13 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD9C224C@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9C1D70(*(void **)v1, *(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

void sub_1AD9C2258()
{
  if (!qword_1E9A4D9F0)
  {
    sub_1AD9C2358();
    sub_1AD9C23D4(255);
    swift_getOpaqueTypeConformance2();
    sub_1AD9C1CB8(&qword_1E9A4DA10, sub_1AD9C23D4, (void (*)(void))sub_1AD9C24D4, (void (*)(void))sub_1AD996BE8);
    unint64_t v0 = sub_1AD9DDF20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4D9F0);
    }
  }
}

void sub_1AD9C2358()
{
  if (!qword_1E9A4D9F8)
  {
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4D9F8);
    }
  }
}

void sub_1AD9C23D4(uint64_t a1)
{
}

void sub_1AD9C23F4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    sub_1AD9969F4(255);
    unint64_t v4 = sub_1AD9DDFC0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1AD9C2460(uint64_t a1)
{
}

void sub_1AD9C2474(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    sub_1AD9969C0(255);
    unint64_t v3 = sub_1AD9DDFC0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1AD9C24D4()
{
  return sub_1AD9C1CB8(&qword_1E9A4DA18, sub_1AD9C2460, (void (*)(void))sub_1AD9C251C, (void (*)(void))sub_1AD8FE560);
}

unint64_t sub_1AD9C251C()
{
  unint64_t result = qword_1E9A4DA20;
  if (!qword_1E9A4DA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DA20);
  }
  return result;
}

uint64_t destroy for SleepTreatmentOptionsView(id *a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for SleepTreatmentOptionsView(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  id v7 = v3;
  id v8 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SleepTreatmentOptionsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  id v7 = *(void **)(a1 + 16);
  id v8 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v8;
  id v9 = v8;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SleepTreatmentOptionsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepTreatmentOptionsView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 48)) {
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

uint64_t storeEnumTagSinglePayload for SleepTreatmentOptionsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepTreatmentOptionsView()
{
  return &type metadata for SleepTreatmentOptionsView;
}

uint64_t sub_1AD9C27CC()
{
  return sub_1AD9C1B98(&qword_1E9A4DA28, (void (*)(uint64_t))sub_1AD9C2258);
}

uint64_t sub_1AD9C2814()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9C2830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v40 = a1;
  sub_1AD9C3EB8();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v6);
  id v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9C408C();
  uint64_t v37 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  char v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9C415C();
  uint64_t v38 = v14;
  MEMORY[0x1F4188790](v14, v15);
  id v39 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v2;
  sub_1AD9C3F4C(0);
  sub_1AD9C1B98(&qword_1E9A4DA58, sub_1AD9C3F4C);
  sub_1AD9DE9C0();
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v17 = (id)qword_1EB727930;
  uint64_t v18 = sub_1AD9DCA70();
  uint64_t v20 = v19;

  swift_bridgeObjectRelease();
  uint64_t v43 = v18;
  uint64_t v44 = v20;
  sub_1AD9C1B98(&qword_1E9A4DA68, (void (*)(uint64_t))sub_1AD9C3EB8);
  sub_1AD85F688();
  sub_1AD9DECA0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  long long v21 = *v2;
  long long v46 = v2[1];
  long long v47 = v21;
  long long v45 = v2[2];
  id v22 = (uint64_t (*)())swift_allocObject();
  long long v23 = v2[1];
  *((_OWORD *)v22 + sub_1AD95AB40(3, 1) = *v2;
  *((_OWORD *)v22 + 2) = v23;
  *((_OWORD *)v22 + 3) = v2[2];
  uint64_t v24 = (uint64_t)v39;
  uint64_t v25 = v37;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v39, v13, v37);
  id v26 = (uint64_t (**)())(v24 + *(int *)(v38 + 36));
  *id v26 = sub_1AD9C41C8;
  v26[1] = v22;
  void v26[2] = 0;
  v26[3] = 0;
  sub_1AD878850((id *)&v47);
  sub_1AD878850((id *)&v46);
  sub_1AD95278C((uint64_t)&v45);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v25);
  sub_1AD9DF930();
  sub_1AD878850((id *)&v47);
  sub_1AD878850((id *)&v46);
  sub_1AD95278C((uint64_t)&v45);
  uint64_t v27 = sub_1AD9DF920();
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = MEMORY[0x1E4FBCFD8];
  *(void *)(v28 + 16) = v27;
  *(void *)(v28 + 24) = v29;
  long long v30 = v2[1];
  *(_OWORD *)(v28 + 32) = *v2;
  *(_OWORD *)(v28 + 48) = v30;
  *(_OWORD *)(v28 + 64) = v2[2];
  sub_1AD878850((id *)&v47);
  sub_1AD878850((id *)&v46);
  sub_1AD95278C((uint64_t)&v45);
  uint64_t v31 = sub_1AD9DF920();
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v31;
  *(void *)(v32 + 24) = v29;
  long long v33 = v2[1];
  *(_OWORD *)(v32 + 32) = *v2;
  *(_OWORD *)(v32 + 48) = v33;
  *(_OWORD *)(v32 + 64) = v2[2];
  sub_1AD9DF1F0();
  sub_1AD9C43AC(0, (unint64_t *)&qword_1E9A4A1F8, MEMORY[0x1E4F3EE18]);
  MEMORY[0x1B3E6B160](&v42);
  swift_release();
  swift_release();
  LOBYTE(v43) = v42;
  uint64_t v34 = (_OWORD *)swift_allocObject();
  long long v35 = v2[1];
  v34[1] = *v2;
  v34[2] = v35;
  uint64_t v34[3] = v2[2];
  sub_1AD878850((id *)&v47);
  sub_1AD878850((id *)&v46);
  sub_1AD95278C((uint64_t)&v45);
  sub_1AD9C4244();
  sub_1AD9DEDF0();
  swift_release();
  return sub_1AD9C4730(v24, (uint64_t (*)(void))sub_1AD9C415C);
}

uint64_t sub_1AD9C2DF4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v34 = a2;
  sub_1AD9C4058(0);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v10 = (char *)&v33 - v9;
  sub_1AD9C3FF0();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)&v33 - v19;
  *(void *)&long long v37 = sub_1AD9C4404(*(void **)(a1 + 16));
  *((void *)&v37 + sub_1AD95AB40(3, 1) = v21;
  char v38 = v22 & 1;
  uint64_t v39 = v23;
  uint64_t v35 = a1;
  sub_1AD9302E0();
  sub_1AD9C1B98(&qword_1E9A4C478, (void (*)(uint64_t))sub_1AD9302E0);
  sub_1AD9DF2A0();
  long long v37 = *(_OWORD *)(a1 + 32);
  sub_1AD9C43AC(0, (unint64_t *)&qword_1E9A4A1C0, MEMORY[0x1E4F3ECC8]);
  sub_1AD9DF050();
  if (v36 == 1)
  {
    *(void *)&long long v37 = sub_1AD9C338C();
    *((void *)&v37 + sub_1AD95AB40(3, 1) = v24;
    char v38 = v25 & 1;
    uint64_t v39 = v26;
    MEMORY[0x1F4188790](v37, v24);
    *(&v33 - 2) = a1;
    sub_1AD9DF2A0();
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v10, v27, 1, v12);
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v28(v16, v20, v12);
  sub_1AD9C46CC((uint64_t)v10, (uint64_t)v6);
  uint64_t v29 = v34;
  v28(v34, v16, v12);
  sub_1AD9C3F80();
  sub_1AD9C46CC((uint64_t)v6, (uint64_t)&v29[*(int *)(v30 + 48)]);
  sub_1AD9C4730((uint64_t)v10, (uint64_t (*)(void))sub_1AD9C4058);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v13 + 8);
  v31(v20, v12);
  sub_1AD9C4730((uint64_t)v6, (uint64_t (*)(void))sub_1AD9C4058);
  return ((uint64_t (*)(char *, uint64_t))v31)(v16, v12);
}

uint64_t sub_1AD9C317C(long long *a1)
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  swift_bridgeObjectRelease();
  sub_1AD9DF930();
  long long v3 = a1[1];
  long long v14 = *a1;
  long long v12 = a1[2];
  long long v13 = v3;
  sub_1AD878850((id *)&v14);
  sub_1AD878850((id *)&v13);
  sub_1AD95278C((uint64_t)&v12);
  uint64_t v4 = sub_1AD9DF920();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x1E4FBCFD8];
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v6;
  long long v7 = a1[1];
  *(_OWORD *)(v5 + 32) = *a1;
  *(_OWORD *)(v5 + 48) = v7;
  *(_OWORD *)(v5 + 64) = a1[2];
  sub_1AD878850((id *)&v14);
  sub_1AD878850((id *)&v13);
  sub_1AD95278C((uint64_t)&v12);
  uint64_t v8 = sub_1AD9DF920();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v6;
  long long v10 = a1[1];
  *(_OWORD *)(v9 + 32) = *a1;
  *(_OWORD *)(v9 + 48) = v10;
  *(_OWORD *)(v9 + 64) = a1[2];
  sub_1AD9DF1F0();
  sub_1AD85F688();
  return sub_1AD9DF150();
}

uint64_t sub_1AD9C338C()
{
  uint64_t v1 = (void *)v0[2];
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    sub_1AD9DDBC0();

    swift_release();
    swift_release();
    uint64_t v3 = *v0;
    if (v16)
    {
      if (v3)
      {
        unsigned __int8 v4 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
        BOOL v5 = qword_1EB724E38 == -1;
        if ((v4 & 8) == 0)
        {
          if (qword_1EB724E38 != -1) {
            swift_once();
          }
LABEL_14:
          id v10 = (id)qword_1EB727930;
          sub_1AD9DCA70();

          swift_bridgeObjectRelease();
LABEL_19:
          sub_1AD85F688();
          return sub_1AD9DEAF0();
        }
LABEL_12:
        if (!v5) {
          swift_once();
        }
        goto LABEL_14;
      }
      goto LABEL_22;
    }
    if (!v3)
    {
LABEL_22:
      type metadata accessor for SleepSettingsModel();
      long long v14 = &qword_1E9A4B480;
      uint64_t v15 = type metadata accessor for SleepSettingsModel;
      goto LABEL_23;
    }
    unsigned __int8 v6 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
    long long v7 = self;
    if ((v6 & 8) == 0)
    {
      uint64_t v8 = (void *)sub_1AD9DF6D0();
      id v9 = objc_msgSend(v7, sel_modelSpecificLocalizedStringKeyForKey_, v8);

      if (!v9)
      {
        __break(1u);
        goto LABEL_12;
      }
LABEL_16:
      sub_1AD9DF710();

      if (qword_1EB724E38 != -1) {
        swift_once();
      }
      id v12 = (id)qword_1EB727930;
      sub_1AD9DCA70();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    uint64_t v11 = (void *)sub_1AD9DF6D0();
    id v9 = objc_msgSend(v7, sel_modelSpecificLocalizedStringKeyForKey_, v11);

    if (v9) {
      goto LABEL_16;
    }
    __break(1u);
  }
  type metadata accessor for WatchAppInstalledProvider();
  long long v14 = &qword_1E9A4D5B8;
  uint64_t v15 = type metadata accessor for WatchAppInstalledProvider;
LABEL_23:
  sub_1AD9C1B98(v14, (void (*)(uint64_t))v15);
  uint64_t result = sub_1AD9DE080();
  __break(1u);
  return result;
}

uint64_t sub_1AD9C3774(long long *a1)
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  swift_bridgeObjectRelease();
  sub_1AD9DF930();
  long long v3 = a1[1];
  long long v14 = *a1;
  long long v12 = a1[2];
  long long v13 = v3;
  sub_1AD878850((id *)&v14);
  sub_1AD878850((id *)&v13);
  sub_1AD95278C((uint64_t)&v12);
  uint64_t v4 = sub_1AD9DF920();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x1E4FBCFD8];
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v6;
  long long v7 = a1[1];
  *(_OWORD *)(v5 + 32) = *a1;
  *(_OWORD *)(v5 + 48) = v7;
  *(_OWORD *)(v5 + 64) = a1[2];
  sub_1AD878850((id *)&v14);
  sub_1AD878850((id *)&v13);
  sub_1AD95278C((uint64_t)&v12);
  uint64_t v8 = sub_1AD9DF920();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v6;
  long long v10 = a1[1];
  *(_OWORD *)(v9 + 32) = *a1;
  *(_OWORD *)(v9 + 48) = v10;
  *(_OWORD *)(v9 + 64) = a1[2];
  sub_1AD9DF1F0();
  sub_1AD85F688();
  return sub_1AD9DF150();
}

uint64_t sub_1AD9C3984(long long *a1)
{
  sub_1AD9DF930();
  long long v2 = a1[1];
  long long v15 = *a1;
  long long v13 = a1[2];
  long long v14 = v2;
  sub_1AD878850((id *)&v15);
  sub_1AD878850((id *)&v14);
  sub_1AD95278C((uint64_t)&v13);
  uint64_t v3 = sub_1AD9DF920();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x1E4FBCFD8];
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v5;
  long long v6 = a1[1];
  *(_OWORD *)(v4 + 32) = *a1;
  *(_OWORD *)(v4 + 48) = v6;
  *(_OWORD *)(v4 + 64) = a1[2];
  sub_1AD878850((id *)&v15);
  sub_1AD878850((id *)&v14);
  sub_1AD95278C((uint64_t)&v13);
  uint64_t v7 = sub_1AD9DF920();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v5;
  long long v9 = a1[1];
  *(_OWORD *)(v8 + 32) = *a1;
  *(_OWORD *)(v8 + 48) = v9;
  *(_OWORD *)(v8 + 64) = a1[2];
  sub_1AD9DF1F0();
  sub_1AD9C43AC(0, (unint64_t *)&qword_1E9A4A1F8, MEMORY[0x1E4F3EE18]);
  MEMORY[0x1B3E6B160](&v11);
  swift_release();
  swift_release();
  long long v12 = v13;
  sub_1AD9C43AC(0, (unint64_t *)&qword_1E9A4A1C0, MEMORY[0x1E4F3ECC8]);
  return sub_1AD9DF060();
}

uint64_t sub_1AD9C3B48()
{
  return swift_release();
}

uint64_t sub_1AD9C3BBC@<X0>(void *a1@<X2>, BOOL *a2@<X8>)
{
  if (*a1)
  {
    uint64_t result = (uint64_t)objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
    *a2 = (result & 0x4000) != 0;
  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1AD9C1B98(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
    uint64_t result = sub_1AD9DE080();
    __break(1u);
  }
  return result;
}

void sub_1AD9C3C60(char *a1, uint64_t a2, uint64_t a3, id *a4)
{
  if (*a4)
  {
    char v4 = *a1;
    id v5 = *a4;
    sub_1AD8D9110(v4);
  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1AD9C1B98(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
    sub_1AD9DE080();
    __break(1u);
  }
}

uint64_t sub_1AD9C3D18@<X0>(void *a1@<X2>, BOOL *a2@<X8>)
{
  if (*a1)
  {
    uint64_t result = (uint64_t)objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
    *a2 = (result & 8) == 0;
  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1AD9C1B98(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
    uint64_t result = sub_1AD9DE080();
    __break(1u);
  }
  return result;
}

void sub_1AD9C3DC0(char *a1, uint64_t a2, uint64_t a3, id *a4)
{
  if (*a4)
  {
    char v4 = *a1;
    id v5 = *a4;
    sub_1AD8D94C8((v4 & 1) == 0);
  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1AD9C1B98(&qword_1E9A4B480, (void (*)(uint64_t))type metadata accessor for SleepSettingsModel);
    sub_1AD9DE080();
    __break(1u);
  }
}

uint64_t sub_1AD9C3E7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9C2830(a1);
}

void sub_1AD9C3EB8()
{
  if (!qword_1E9A4DA30)
  {
    sub_1AD9C3F4C(255);
    sub_1AD9C1B98(&qword_1E9A4DA58, sub_1AD9C3F4C);
    unint64_t v0 = sub_1AD9DE9D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DA30);
    }
  }
}

void sub_1AD9C3F4C(uint64_t a1)
{
}

void sub_1AD9C3F80()
{
  if (!qword_1E9A4DA40)
  {
    sub_1AD9C3FF0();
    sub_1AD9C4058(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A4DA40);
    }
  }
}

void sub_1AD9C3FF0()
{
  if (!qword_1E9A4DA48)
  {
    sub_1AD9302E0();
    unint64_t v0 = sub_1AD9DF2B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DA48);
    }
  }
}

void sub_1AD9C4058(uint64_t a1)
{
}

void sub_1AD9C408C()
{
  if (!qword_1E9A4DA60)
  {
    sub_1AD9C3EB8();
    sub_1AD9C1B98(&qword_1E9A4DA68, (void (*)(uint64_t))sub_1AD9C3EB8);
    sub_1AD85F688();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DA60);
    }
  }
}

void sub_1AD9C415C()
{
  if (!qword_1E9A4DA70)
  {
    sub_1AD9C408C();
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DA70);
    }
  }
}

uint64_t sub_1AD9C41BC@<X0>(char *a1@<X8>)
{
  return sub_1AD9C2DF4(*(void *)(v1 + 16), a1);
}

uint64_t sub_1AD9C41C8()
{
  return sub_1AD9C3984((long long *)(v0 + 16));
}

uint64_t sub_1AD9C41D4@<X0>(BOOL *a1@<X8>)
{
  return sub_1AD9C3BBC((void *)(v1 + 32), a1);
}

void sub_1AD9C41E4(char *a1)
{
  sub_1AD9C3C60(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (id *)(v1 + 32));
}

uint64_t objectdestroyTm_10()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9C423C()
{
  return sub_1AD9C3B48();
}

unint64_t sub_1AD9C4244()
{
  unint64_t result = qword_1E9A4DA78;
  if (!qword_1E9A4DA78)
  {
    sub_1AD9C415C();
    sub_1AD9C3EB8();
    sub_1AD9C1B98(&qword_1E9A4DA68, (void (*)(uint64_t))sub_1AD9C3EB8);
    sub_1AD85F688();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DA78);
  }
  return result;
}

uint64_t sub_1AD9C4338()
{
  return sub_1AD9DF060();
}

void sub_1AD9C43AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBB390]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1AD9C4404(void *a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = a1;
    sub_1AD9DDBC0();

    swift_release();
    swift_release();
    if (v9)
    {
      if (qword_1EB724E38 != -1) {
        swift_once();
      }
      id v3 = (id)qword_1EB727930;
      sub_1AD9DCA70();

      swift_bridgeObjectRelease();
LABEL_10:
      sub_1AD85F688();
      return sub_1AD9DEAF0();
    }
    unint64_t v4 = self;
    uint64_t v5 = (void *)sub_1AD9DF6D0();
    id v6 = objc_msgSend(v4, sel_modelSpecificLocalizedStringKeyForKey_, v5);

    if (v6)
    {
      sub_1AD9DF710();

      if (qword_1EB724E38 != -1) {
        swift_once();
      }
      id v7 = (id)qword_1EB727930;
      sub_1AD9DCA70();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    __break(1u);
  }
  type metadata accessor for WatchAppInstalledProvider();
  sub_1AD9C1B98(&qword_1E9A4D5B8, (void (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider);
  uint64_t result = sub_1AD9DE080();
  __break(1u);
  return result;
}

uint64_t sub_1AD9C46C4()
{
  return sub_1AD9C317C(*(long long **)(v0 + 16));
}

uint64_t sub_1AD9C46CC(uint64_t a1, uint64_t a2)
{
  sub_1AD9C4058(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AD9C4730(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AD9C4790()
{
  return sub_1AD9C3774(*(long long **)(v0 + 16));
}

uint64_t sub_1AD9C479C@<X0>(BOOL *a1@<X8>)
{
  return sub_1AD9C3D18((void *)(v1 + 32), a1);
}

void sub_1AD9C47AC(char *a1)
{
  sub_1AD9C3DC0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (id *)(v1 + 32));
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9C4818()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9C488C@<X0>(uint64_t *a1@<X8>)
{
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v2 = (id)qword_1EB727930;
  uint64_t v3 = sub_1AD9DCA70();
  uint64_t v5 = v4;

  swift_bridgeObjectRelease();
  id v6 = (id)qword_1EB727930;
  uint64_t v7 = sub_1AD9DCA70();
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_quaternarySystemFillColor, 0xE000000000000000);
  uint64_t result = MEMORY[0x1B3E6ADC0](v10);
  *a1 = v3;
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v9;
  a1[4] = result;
  return result;
}

uint64_t TrailingDetailViewModel.titleText.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrailingDetailViewModel.detailText.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrailingDetailViewModel.backgroundColor.getter()
{
  return swift_retain();
}

uint64_t TrailingDetailViewModel.init(titleText:detailText:backgroundColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t result = MEMORY[0x1B3E6ADC0](a5);
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = result;
  return result;
}

uint64_t sub_1AD9C4AC0@<X0>(uint64_t a1@<X8>)
{
  sub_1AD85F688();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1AD9DEAF0();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  uint64_t v7 = self;
  MEMORY[0x1B3E6ADC0](objc_msgSend(v7, sel_labelColor));
  uint64_t v8 = sub_1AD9DEA70();
  uint64_t v25 = v9;
  uint64_t v26 = v8;
  char v11 = v10;
  uint64_t v27 = v12;
  swift_release();
  sub_1AD861548(v2, v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1AD9DEAF0();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  MEMORY[0x1B3E6ADC0](objc_msgSend(v7, sel_secondaryLabelColor));
  uint64_t v18 = sub_1AD9DEA70();
  uint64_t v20 = v19;
  LOBYTE(v2) = v21;
  uint64_t v23 = v22;
  swift_release();
  sub_1AD861548(v13, v15, v17);
  swift_bridgeObjectRelease();
  *(void *)a1 = v26;
  *(void *)(a1 + 8) = v25;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v27;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v20;
  *(unsigned char *)(a1 + 64) = v2 & 1;
  *(void *)(a1 + 72) = v23;
  sub_1AD861558(v26, v25, v11 & 1);
  swift_bridgeObjectRetain();
  sub_1AD861558(v18, v20, v2 & 1);
  swift_bridgeObjectRetain();
  sub_1AD861548(v18, v20, v2 & 1);
  swift_bridgeObjectRelease();
  sub_1AD861548(v26, v25, v11 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AD9C4CE8@<X0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  long long v25 = *v1;
  long long v26 = v3;
  uint64_t v27 = *((void *)v1 + 4);
  uint64_t v15 = sub_1AD9DE2B0();
  sub_1AD9C4AC0((uint64_t)v16);
  uint64_t v4 = v16[0];
  uint64_t v5 = v16[1];
  char v6 = v17;
  uint64_t v7 = v18;
  uint64_t v8 = v19;
  char v9 = v20;
  uint64_t v10 = v21;
  uint64_t v11 = v22;
  char v12 = v23;
  uint64_t v14 = v24;
  v16[0] = v27;
  swift_retain();
  uint64_t result = sub_1AD9DF1B0();
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v11;
  *(unsigned char *)(a1 + 88) = v12;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = result;
  return result;
}

uint64_t _s13SleepHealthUI23TrailingDetailViewModelV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (!v6 && (sub_1AD9E02D0() & 1) == 0) {
    return 0;
  }
  BOOL v7 = v2 == v4 && v3 == v5;
  if (!v7 && (sub_1AD9E02D0() & 1) == 0) {
    return 0;
  }
  return sub_1AD9DEE40();
}

ValueMetadata *type metadata accessor for TrailingDetailViewModel()
{
  return &type metadata for TrailingDetailViewModel;
}

void *_s13SleepHealthUI23TrailingDetailViewModelVwcp_0(void *a1, void *a2)
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
  swift_retain();
  return a1;
}

void *_s13SleepHealthUI23TrailingDetailViewModelVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s13SleepHealthUI23TrailingDetailViewModelVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t _s13SleepHealthUI23TrailingDetailViewModelVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1AD9C5028(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrailingDetailRow()
{
  return &type metadata for TrailingDetailRow;
}

uint64_t sub_1AD9C5080()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1AD9C50A0()
{
  unint64_t result = qword_1E9A4DA80;
  if (!qword_1E9A4DA80)
  {
    sub_1AD9C5118();
    sub_1AD9C535C();
    sub_1AD9C53F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DA80);
  }
  return result;
}

void sub_1AD9C5118()
{
  if (!qword_1E9A4DA88)
  {
    sub_1AD9C5260(255, (unint64_t *)&qword_1E9A4B658, (uint64_t (*)(uint64_t))sub_1AD9C5208, (uint64_t (*)(void))sub_1AD8E834C, MEMORY[0x1E4F3ED38]);
    sub_1AD9C5260(255, (unint64_t *)&qword_1E9A4B2F8, MEMORY[0x1E4F3DC98], sub_1AD9C52E0, MEMORY[0x1E4F3D990]);
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DA88);
    }
  }
}

void sub_1AD9C5208()
{
  if (!qword_1E9A4B660)
  {
    sub_1AD8E82E0();
    unint64_t v0 = sub_1AD9DF350();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4B660);
    }
  }
}

void sub_1AD9C5260(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_1AD9C52E0()
{
  return sub_1AD9C5314(&qword_1E9A4B300, MEMORY[0x1E4F3DC98]);
}

uint64_t sub_1AD9C5314(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1AD9C535C()
{
  unint64_t result = qword_1E9A4B678;
  if (!qword_1E9A4B678)
  {
    sub_1AD9C5260(255, (unint64_t *)&qword_1E9A4B658, (uint64_t (*)(uint64_t))sub_1AD9C5208, (uint64_t (*)(void))sub_1AD8E834C, MEMORY[0x1E4F3ED38]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4B678);
  }
  return result;
}

unint64_t sub_1AD9C53F8()
{
  unint64_t result = qword_1E9A4B318;
  if (!qword_1E9A4B318)
  {
    sub_1AD9C5260(255, (unint64_t *)&qword_1E9A4B2F8, MEMORY[0x1E4F3DC98], sub_1AD9C52E0, MEMORY[0x1E4F3D990]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4B318);
  }
  return result;
}

uint64_t sub_1AD9C5494(void (*a1)(uint64_t *__return_ptr, char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v6)
  {
    uint64_t v13 = MEMORY[0x1E4FBC860];
    sub_1AD9E00B0();
    uint64_t v9 = (char *)(a3 + 32);
    while (1)
    {
      char v10 = *v9++;
      char v11 = v10;
      a1(&v12, &v11);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      sub_1AD9E0080();
      sub_1AD9E00C0();
      sub_1AD9E00D0();
      sub_1AD9E0090();
      if (!--v6) {
        return v13;
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1AD9C5584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v20[0] = a1;
  v20[1] = a2;
  uint64_t v6 = type metadata accessor for DayRelativeDuration(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6 - 8, v8);
  char v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = MEMORY[0x1E4FBC860];
  if (v11)
  {
    uint64_t v23 = MEMORY[0x1E4FBC860];
    sub_1AD8A26D8(0, v11, 0);
    uint64_t v12 = v23;
    for (uint64_t i = (unsigned char *)(a3 + 56); ; i += 32)
    {
      uint64_t v14 = *((void *)i - 2);
      uint64_t v15 = *((void *)i - 1);
      char v16 = *i;
      v21[0] = *((void *)i - 3);
      v21[1] = v14;
      void v21[2] = v15;
      char v22 = v16;
      ((void (*)(void *))v20[0])(v21);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v23 = v12;
      unint64_t v18 = *(void *)(v12 + 16);
      unint64_t v17 = *(void *)(v12 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_1AD8A26D8(v17 > 1, v18 + 1, 1);
        uint64_t v12 = v23;
      }
      *(void *)(v12 + 16) = v18 + 1;
      sub_1AD9C71F8((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v18);
      if (!--v11) {
        return v12;
      }
    }
    swift_release();
  }
  return v12;
}

uint64_t sub_1AD9C5730(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  uint64_t v5 = a4 - a3;
  if (__OFSUB__(a4, a3)) {
    goto LABEL_19;
  }
  uint64_t v6 = v4;
  uint64_t v7 = (void (*)(uint64_t *__return_ptr, uint64_t *))result;
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v14 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1AD9E00B0();
    if (v5 < 0)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    if (a4 <= a3) {
      char v10 = a3;
    }
    else {
      char v10 = a4;
    }
    int64_t v11 = a3;
    while (a4 != v11)
    {
      uint64_t v12 = v11;
      v7(&v13, &v12);
      if (v6) {
        return swift_release();
      }
      uint64_t v6 = 0;
      sub_1AD9E0080();
      sub_1AD9E00C0();
      sub_1AD9E00D0();
      uint64_t result = sub_1AD9E0090();
      if (a4 < a3) {
        goto LABEL_17;
      }
      if (v10 == v11) {
        goto LABEL_18;
      }
      if (a4 == ++v11) {
        return v14;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  return result;
}

id HKSleepDaySummary.sleepDurationGoalInterval.getter()
{
  id result = objc_msgSend(v0, sel_sleepDurationGoal);
  unint64_t v2 = result;
  if (result)
  {
    id v3 = objc_msgSend(self, sel_secondUnit);
    objc_msgSend(v2, sel_doubleValueForUnit_, v3);
    uint64_t v5 = v4;

    return (id)v5;
  }
  return result;
}

uint64_t static HKSleepDaySummary.demoSummaries(in:calendar:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1AD9C5D58();
  uint64_t v9 = *(void *)(result + 16);
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (__OFSUB__(v9, a2 % v9))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if ((a2 & 0x8000000000000000) == 0)
  {
    MEMORY[0x1F4188790](result, v8);
    v13[2] = v11;
    v13[3] = v10;
    v13[4] = a1;
    v13[5] = a2;
    v13[6] = &unk_1F046AA30;
    v13[7] = a3;
    v13[8] = v3;
    uint64_t v12 = sub_1AD9C5730((uint64_t)sub_1AD9C65B0, (uint64_t)v13, 0, a2);
    swift_bridgeObjectRelease();
    return v12;
  }
LABEL_7:
  __break(1u);
  return result;
}

void *sub_1AD9C59DC@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t *a7@<X8>)
{
  uint64_t v8 = *result;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(a3 + 16);
  if (!v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v10 = a4 + v8;
  if (__OFADD__(a4, v8))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v11 = (*result + a2) % v9;
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v11 < *(void *)(a5 + 16))
  {
    uint64_t v13 = 8 * v11;
    uint64_t v14 = *(void *)(a3 + v13 + 32);
    uint64_t v15 = *(char **)(a5 + v13 + 32);
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1AD9C67E0(v10, v14, v15, a6);
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *a7 = v16;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

id sub_1AD9C5AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AD9DCC70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1AD9DC7C0();
  uint64_t v10 = *(void *)(v9 - 8);
  double v12 = MEMORY[0x1F4188790](v9, v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v8, a2, v4, v12);
  sub_1AD9DC770();
  uint64_t v15 = (void *)sub_1AD9DC720();
  id v16 = objc_msgSend(self, sel_sleepPeriodSegmentWithDateInterval_category_, v15, a1);

  sub_1AD9DC750();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2, v8, v4);
  return v16;
}

uint64_t sub_1AD9C5C8C(uint64_t a1, void (*a2)(uint64_t, double))
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v3)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1AD9E00B0();
    uint64_t v6 = (double *)(a1 + 40);
    do
    {
      uint64_t v7 = *((void *)v6 - 1);
      double v8 = *v6;
      v6 += 2;
      a2(v7, v8);
      sub_1AD9E0080();
      sub_1AD9E00C0();
      sub_1AD9E00D0();
      sub_1AD9E0090();
      --v3;
    }
    while (v3);
    return v9;
  }
  return result;
}

uint64_t sub_1AD9C5D58()
{
  unint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBBE00];
  sub_1AD9C70F0(0, &qword_1E9A4DA98, (uint64_t (*)(uint64_t))sub_1AD9C715C, MEMORY[0x1E4FBBE00]);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1AD9EED40;
  sub_1AD9C70F0(0, qword_1E9A4DAB0, (uint64_t (*)(uint64_t))sub_1AD9C7190, v0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AD9EED50;
  *(void *)(v2 + 32) = 5;
  *(void *)(v2 + 40) = 0x4076800000000000;
  *(void *)(v2 + 48) = 4;
  *(void *)(v2 + 56) = 0x4076800000000000;
  *(void *)(v2 + 64) = 2;
  *(void *)(v2 + 72) = 0x4086800000000000;
  *(void *)(v2 + 80) = 3;
  *(void *)(v2 + 88) = 0x4096800000000000;
  *(void *)(v2 + 96) = 4;
  *(void *)(v2 + 104) = 0x4076800000000000;
  *(void *)(v2 + 112) = 3;
  *(void *)(v2 + 120) = 0x4090E00000000000;
  *(void *)(v2 + 128) = 4;
  *(void *)(v2 + 136) = 0x4076800000000000;
  *(void *)(v2 + 144) = 3;
  *(void *)(v2 + 152) = 0x40A9500000000000;
  *(void *)(v2 + 160) = 5;
  *(void *)(v2 + 168) = 0x409C200000000000;
  *(void *)(v2 + 176) = 3;
  *(void *)(v2 + 184) = 0x40B3B00000000000;
  *(void *)(v2 + 192) = 5;
  *(void *)(v2 + 200) = 0x409C200000000000;
  *(void *)(v2 + 208) = 3;
  *(void *)(v2 + 216) = 0x40AC200000000000;
  *(void *)(v2 + 224) = 5;
  *(void *)(v2 + 232) = 0x409C200000000000;
  *(void *)(v2 + 240) = 3;
  *(void *)(v2 + 248) = 0x40A6800000000000;
  *(void *)(v2 + 256) = 5;
  *(void *)(v2 + 264) = 0x4096800000000000;
  *(void *)(v1 + 32) = v2;
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD9EED60;
  *(void *)(v3 + 32) = 4;
  *(void *)(v3 + 40) = 0x4076800000000000;
  *(void *)(v3 + 48) = 5;
  *(void *)(v3 + 56) = 0x4086800000000000;
  *(void *)(v3 + 64) = 3;
  *(void *)(v3 + 72) = 0x40A9500000000000;
  *(void *)(v3 + 80) = 4;
  *(void *)(v3 + 88) = 0x4076800000000000;
  *(void *)(v3 + 96) = 3;
  *(void *)(v3 + 104) = 0x40B0E00000000000;
  *(void *)(v3 + 112) = 5;
  *(void *)(v3 + 120) = 0x4076800000000000;
  *(void *)(v3 + 128) = 3;
  *(void *)(v3 + 136) = 0x40B0E00000000000;
  *(void *)(v3 + 144) = 5;
  *(void *)(v3 + 152) = 0x40AC200000000000;
  *(void *)(v3 + 160) = 3;
  *(void *)(v3 + 168) = 0x40AEF00000000000;
  *(void *)(v3 + 176) = 5;
  *(void *)(v3 + 184) = 0x40A0E00000000000;
  *(void *)(v3 + 192) = 3;
  *(void *)(v3 + 200) = 0x4090E00000000000;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1AD9EED70;
  *(void *)(v4 + 32) = 5;
  *(void *)(v4 + 40) = 0x4076800000000000;
  *(void *)(v4 + 48) = 2;
  *(void *)(v4 + 56) = 0x4076800000000000;
  *(void *)(v4 + 64) = 5;
  *(void *)(v4 + 72) = 0x4076800000000000;
  *(void *)(v4 + 80) = 3;
  *(void *)(v4 + 88) = 0x4090E00000000000;
  *(void *)(v4 + 96) = 2;
  *(void *)(v4 + 104) = 0x409C200000000000;
  *(void *)(v4 + 112) = 5;
  *(void *)(v4 + 120) = 0x4076800000000000;
  *(void *)(v4 + 128) = 3;
  *(void *)(v4 + 136) = 0x409C200000000000;
  *(void *)(v4 + 144) = 4;
  *(void *)(v4 + 152) = 0x4076800000000000;
  *(void *)(v4 + 160) = 3;
  *(void *)(v4 + 168) = 0x40B0E00000000000;
  *(void *)(v4 + 176) = 4;
  *(void *)(v4 + 184) = 0x4076800000000000;
  *(void *)(v4 + 192) = 3;
  *(void *)(v4 + 200) = 0x4096800000000000;
  *(void *)(v4 + 208) = 5;
  *(void *)(v4 + 216) = 0x40AC200000000000;
  *(void *)(v4 + 224) = 3;
  *(void *)(v4 + 232) = 0x40A0E00000000000;
  *(void *)(v4 + 240) = 4;
  *(void *)(v4 + 248) = 0x4076800000000000;
  *(void *)(v4 + 256) = 3;
  *(void *)(v4 + 264) = 0x4096800000000000;
  *(void *)(v4 + 272) = 5;
  *(void *)(v4 + 280) = 0x4096800000000000;
  *(void *)(v4 + 288) = 3;
  *(void *)(v4 + 296) = 0x409C200000000000;
  *(void *)(v4 + 304) = 5;
  *(void *)(v4 + 312) = 0x40A6800000000000;
  *(void *)(v1 + 48) = v4;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1AD9EED80;
  *(void *)(v5 + 32) = 3;
  *(void *)(v5 + 40) = 0x4076800000000000;
  *(void *)(v5 + 48) = 5;
  *(void *)(v5 + 56) = 0x4076800000000000;
  *(void *)(v5 + 64) = 3;
  *(void *)(v5 + 72) = 0x40B0E00000000000;
  *(void *)(v5 + 80) = 5;
  *(void *)(v5 + 88) = 0x4086800000000000;
  *(void *)(v5 + 96) = 3;
  *(void *)(v5 + 104) = 0x40AC200000000000;
  *(void *)(v5 + 112) = 5;
  *(void *)(v5 + 120) = 0x409C200000000000;
  *(void *)(v5 + 128) = 3;
  *(void *)(v5 + 136) = 0x40A3B00000000000;
  *(void *)(v5 + 144) = 4;
  *(void *)(v5 + 152) = 0x4086800000000000;
  *(void *)(v5 + 160) = 3;
  *(void *)(v5 + 168) = 0x408A400000000000;
  *(void *)(v5 + 176) = 5;
  *(void *)(v5 + 184) = 0x4096800000000000;
  *(void *)(v5 + 192) = 3;
  *(void *)(v5 + 200) = 0x40A6800000000000;
  *(void *)(v5 + 208) = 5;
  *(void *)(v5 + 216) = 0x40A6800000000000;
  *(void *)(v5 + 224) = 3;
  *(void *)(v5 + 232) = 0x40AC200000000000;
  *(void *)(v1 + 56) = v5;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1AD9EED80;
  *(void *)(v6 + 32) = 3;
  *(void *)(v6 + 40) = 0x409C200000000000;
  *(void *)(v6 + 48) = 4;
  *(void *)(v6 + 56) = 0x4090E00000000000;
  *(void *)(v6 + 64) = 3;
  *(void *)(v6 + 72) = 0x4090E00000000000;
  *(void *)(v6 + 80) = 5;
  *(void *)(v6 + 88) = 0x4090E00000000000;
  *(void *)(v6 + 96) = 3;
  *(void *)(v6 + 104) = 0x40B2480000000000;
  *(void *)(v6 + 112) = 5;
  *(void *)(v6 + 120) = 0x409C200000000000;
  *(void *)(v6 + 128) = 3;
  *(void *)(v6 + 136) = 0x40AEF00000000000;
  *(void *)(v6 + 144) = 5;
  *(void *)(v6 + 152) = 0x40A3B00000000000;
  *(void *)(v6 + 160) = 3;
  *(void *)(v6 + 168) = 0x40A9500000000000;
  *(void *)(v6 + 176) = 5;
  *(void *)(v6 + 184) = 0x40B0E00000000000;
  *(void *)(v6 + 192) = 3;
  *(void *)(v6 + 200) = 0x4076800000000000;
  *(void *)(v6 + 208) = 2;
  *(void *)(v6 + 216) = 0x4076800000000000;
  *(void *)(v6 + 224) = 3;
  *(void *)(v6 + 232) = 0x4066800000000000;
  *(void *)(v1 + 64) = v6;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1AD9EED80;
  *(void *)(v7 + 32) = 5;
  *(void *)(v7 + 40) = 0x4076800000000000;
  *(void *)(v7 + 48) = 3;
  *(void *)(v7 + 56) = 0x40AEF00000000000;
  *(void *)(v7 + 64) = 5;
  *(void *)(v7 + 72) = 0x4090E00000000000;
  *(void *)(v7 + 80) = 3;
  *(void *)(v7 + 88) = 0x40B3B00000000000;
  *(void *)(v7 + 96) = 5;
  *(void *)(v7 + 104) = 0x40A0E00000000000;
  *(void *)(v7 + 112) = 3;
  *(void *)(v7 + 120) = 0x40B6800000000000;
  *(void *)(v7 + 128) = 5;
  *(void *)(v7 + 136) = 0x4076800000000000;
  *(void *)(v7 + 144) = 2;
  *(void *)(v7 + 152) = 0x4076800000000000;
  *(void *)(v7 + 160) = 5;
  *(void *)(v7 + 168) = 0x4076800000000000;
  *(void *)(v7 + 176) = 3;
  *(void *)(v7 + 184) = 0x40A3B00000000000;
  *(void *)(v7 + 192) = 5;
  *(void *)(v7 + 200) = 0x4096800000000000;
  *(void *)(v7 + 208) = 3;
  *(void *)(v7 + 216) = 0x40A0E00000000000;
  *(void *)(v7 + 224) = 5;
  *(void *)(v7 + 232) = 0x408A400000000000;
  *(void *)(v1 + 72) = v7;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1AD9EED90;
  *(void *)(v8 + 32) = 3;
  *(void *)(v8 + 40) = 0x4096800000000000;
  *(void *)(v8 + 48) = 4;
  *(void *)(v8 + 56) = 0x4076800000000000;
  *(void *)(v8 + 64) = 3;
  *(void *)(v8 + 72) = 0x4086800000000000;
  *(void *)(v8 + 80) = 2;
  *(void *)(v8 + 88) = 0x4076800000000000;
  *(void *)(v8 + 96) = 3;
  *(void *)(v8 + 104) = 0x4086800000000000;
  *(void *)(v8 + 112) = 5;
  *(void *)(v8 + 120) = 0x40A0E00000000000;
  *(void *)(v8 + 128) = 3;
  *(void *)(v8 + 136) = 0x4090E00000000000;
  *(void *)(v8 + 144) = 4;
  *(void *)(v8 + 152) = 0x4090E00000000000;
  *(void *)(v8 + 160) = 3;
  *(void *)(v8 + 168) = 0x40A0E00000000000;
  *(void *)(v8 + 176) = 5;
  *(void *)(v8 + 184) = 0x4090E00000000000;
  *(void *)(v8 + 192) = 3;
  *(void *)(v8 + 200) = 0x4076800000000000;
  *(void *)(v8 + 208) = 5;
  *(void *)(v8 + 216) = 0x4076800000000000;
  *(void *)(v8 + 224) = 3;
  *(void *)(v8 + 232) = 0x40B5180000000000;
  *(void *)(v8 + 240) = 5;
  *(void *)(v8 + 248) = 0x40B0E00000000000;
  *(void *)(v8 + 256) = 3;
  *(void *)(v8 + 264) = 0x40A6800000000000;
  *(void *)(v8 + 272) = 5;
  *(void *)(v8 + 280) = 0x4086800000000000;
  *(void *)(v1 + 80) = v8;
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1AD9EED90;
  *(void *)(v9 + 32) = 5;
  *(void *)(v9 + 40) = 0x4076800000000000;
  *(void *)(v9 + 48) = 4;
  *(void *)(v9 + 56) = 0x4076800000000000;
  *(void *)(v9 + 64) = 2;
  *(void *)(v9 + 72) = 0x4086800000000000;
  *(void *)(v9 + 80) = 3;
  *(void *)(v9 + 88) = 0x4096800000000000;
  *(void *)(v9 + 96) = 4;
  *(void *)(v9 + 104) = 0x4076800000000000;
  *(void *)(v9 + 112) = 3;
  *(void *)(v9 + 120) = 0x4090E00000000000;
  *(void *)(v9 + 128) = 4;
  *(void *)(v9 + 136) = 0x4076800000000000;
  *(void *)(v9 + 144) = 3;
  *(void *)(v9 + 152) = 0x40A9500000000000;
  *(void *)(v9 + 160) = 5;
  *(void *)(v9 + 168) = 0x409C200000000000;
  *(void *)(v9 + 176) = 3;
  *(void *)(v9 + 184) = 0x40B3B00000000000;
  *(void *)(v9 + 192) = 5;
  *(void *)(v9 + 200) = 0x409C200000000000;
  *(void *)(v9 + 208) = 3;
  *(void *)(v9 + 216) = 0x40AC200000000000;
  *(void *)(v9 + 224) = 5;
  *(void *)(v9 + 232) = 0x409C200000000000;
  *(void *)(v9 + 240) = 3;
  *(void *)(v9 + 248) = 0x40A6800000000000;
  *(void *)(v9 + 256) = 5;
  *(void *)(v9 + 264) = 0x4096800000000000;
  *(void *)(v9 + 272) = 3;
  *(void *)(v9 + 280) = 0x40A6800000000000;
  *(void *)(v1 + 88) = v9;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AD9EED80;
  *(void *)(v10 + 32) = 4;
  *(void *)(v10 + 40) = 0x4076800000000000;
  *(void *)(v10 + 48) = 5;
  *(void *)(v10 + 56) = 0x4086800000000000;
  *(void *)(v10 + 64) = 3;
  *(void *)(v10 + 72) = 0x40A9500000000000;
  *(void *)(v10 + 80) = 4;
  *(void *)(v10 + 88) = 0x4076800000000000;
  *(void *)(v10 + 96) = 3;
  *(void *)(v10 + 104) = 0x40B0E00000000000;
  *(void *)(v10 + 112) = 5;
  *(void *)(v10 + 120) = 0x4076800000000000;
  *(void *)(v10 + 128) = 3;
  *(void *)(v10 + 136) = 0x40B0E00000000000;
  *(void *)(v10 + 144) = 5;
  *(void *)(v10 + 152) = 0x40AC200000000000;
  *(void *)(v10 + 160) = 3;
  *(void *)(v10 + 168) = 0x40AEF00000000000;
  *(void *)(v10 + 176) = 5;
  *(void *)(v10 + 184) = 0x40A0E00000000000;
  *(void *)(v10 + 192) = 3;
  *(void *)(v10 + 200) = 0x40AC200000000000;
  *(void *)(v10 + 208) = 5;
  *(void *)(v10 + 216) = 0x4090E00000000000;
  *(void *)(v10 + 224) = 3;
  *(void *)(v10 + 232) = 0x40A0E00000000000;
  *(void *)(v1 + 96) = v10;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1AD9EED70;
  *(void *)(v11 + 32) = 5;
  *(void *)(v11 + 40) = 0x4076800000000000;
  *(void *)(v11 + 48) = 2;
  *(void *)(v11 + 56) = 0x4076800000000000;
  *(void *)(v11 + 64) = 5;
  *(void *)(v11 + 72) = 0x4076800000000000;
  *(void *)(v11 + 80) = 3;
  *(void *)(v11 + 88) = 0x4090E00000000000;
  *(void *)(v11 + 96) = 2;
  *(void *)(v11 + 104) = 0x409C200000000000;
  *(void *)(v11 + 112) = 5;
  *(void *)(v11 + 120) = 0x4076800000000000;
  *(void *)(v11 + 128) = 3;
  *(void *)(v11 + 136) = 0x409C200000000000;
  *(void *)(v11 + 144) = 4;
  *(void *)(v11 + 152) = 0x4076800000000000;
  *(void *)(v11 + 160) = 3;
  *(void *)(v11 + 168) = 0x40B0E00000000000;
  *(void *)(v11 + 176) = 4;
  *(void *)(v11 + 184) = 0x4076800000000000;
  *(void *)(v11 + 192) = 3;
  *(void *)(v11 + 200) = 0x40B3B00000000000;
  *(void *)(v11 + 208) = 5;
  *(void *)(v11 + 216) = 0x40AC200000000000;
  *(void *)(v11 + 224) = 3;
  *(void *)(v11 + 232) = 0x40A0E00000000000;
  *(void *)(v11 + 240) = 4;
  *(void *)(v11 + 248) = 0x4076800000000000;
  *(void *)(v11 + 256) = 3;
  *(void *)(v11 + 264) = 0x4096800000000000;
  *(void *)(v11 + 272) = 5;
  *(void *)(v11 + 280) = 0x4096800000000000;
  *(void *)(v11 + 288) = 3;
  *(void *)(v11 + 296) = 0x409C200000000000;
  *(void *)(v11 + 304) = 5;
  *(void *)(v11 + 312) = 0x40A6800000000000;
  *(void *)(v1 + 104) = v11;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1AD9EED40;
  *(void *)(v12 + 32) = 3;
  *(void *)(v12 + 40) = 0x4076800000000000;
  *(void *)(v12 + 48) = 5;
  *(void *)(v12 + 56) = 0x4076800000000000;
  *(void *)(v12 + 64) = 3;
  *(void *)(v12 + 72) = 0x40B0E00000000000;
  *(void *)(v12 + 80) = 5;
  *(void *)(v12 + 88) = 0x4086800000000000;
  *(void *)(v12 + 96) = 3;
  *(void *)(v12 + 104) = 0x40AC200000000000;
  *(void *)(v12 + 112) = 5;
  *(void *)(v12 + 120) = 0x409C200000000000;
  *(void *)(v12 + 128) = 3;
  *(void *)(v12 + 136) = 0x40A3B00000000000;
  *(void *)(v12 + 144) = 4;
  *(void *)(v12 + 152) = 0x4086800000000000;
  *(void *)(v12 + 160) = 3;
  *(void *)(v12 + 168) = 0x40B1580000000000;
  *(void *)(v12 + 176) = 5;
  *(void *)(v12 + 184) = 0x4096800000000000;
  *(void *)(v12 + 192) = 3;
  *(void *)(v12 + 200) = 0x40A6800000000000;
  *(void *)(v12 + 208) = 5;
  *(void *)(v12 + 216) = 0x40A6800000000000;
  *(void *)(v12 + 224) = 3;
  *(void *)(v12 + 232) = 0x40AC200000000000;
  *(void *)(v12 + 240) = 5;
  *(void *)(v12 + 248) = 0x4076800000000000;
  *(void *)(v1 + 112) = v12;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1AD9EED40;
  *(void *)(v13 + 32) = 3;
  *(void *)(v13 + 40) = 0x409C200000000000;
  *(void *)(v13 + 48) = 4;
  *(void *)(v13 + 56) = 0x4090E00000000000;
  *(void *)(v13 + 64) = 3;
  *(void *)(v13 + 72) = 0x4090E00000000000;
  *(void *)(v13 + 80) = 5;
  *(void *)(v13 + 88) = 0x4090E00000000000;
  *(void *)(v13 + 96) = 3;
  *(void *)(v13 + 104) = 0x40B2480000000000;
  *(void *)(v13 + 112) = 5;
  *(void *)(v13 + 120) = 0x409C200000000000;
  *(void *)(v13 + 128) = 3;
  *(void *)(v13 + 136) = 0x40AEF00000000000;
  *(void *)(v13 + 144) = 5;
  *(void *)(v13 + 152) = 0x40A3B00000000000;
  *(void *)(v13 + 160) = 3;
  *(void *)(v13 + 168) = 0x40A9500000000000;
  *(void *)(v13 + 176) = 5;
  *(void *)(v13 + 184) = 0x40B0E00000000000;
  *(void *)(v13 + 192) = 3;
  *(void *)(v13 + 200) = 0x4076800000000000;
  *(void *)(v13 + 208) = 2;
  *(void *)(v13 + 216) = 0x4076800000000000;
  *(void *)(v13 + 224) = 3;
  *(void *)(v13 + 232) = 0x4096800000000000;
  *(void *)(v13 + 240) = 5;
  *(void *)(v13 + 248) = 0x4090E00000000000;
  *(void *)(v1 + 120) = v13;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1AD9EED80;
  *(void *)(v14 + 32) = 5;
  *(void *)(v14 + 40) = 0x4076800000000000;
  *(void *)(v14 + 48) = 3;
  *(void *)(v14 + 56) = 0x40AEF00000000000;
  *(void *)(v14 + 64) = 5;
  *(void *)(v14 + 72) = 0x4090E00000000000;
  *(void *)(v14 + 80) = 3;
  *(void *)(v14 + 88) = 0x40B3B00000000000;
  *(void *)(v14 + 96) = 5;
  *(void *)(v14 + 104) = 0x40A0E00000000000;
  *(void *)(v14 + 112) = 3;
  *(void *)(v14 + 120) = 0x40B6800000000000;
  *(void *)(v14 + 128) = 5;
  *(void *)(v14 + 136) = 0x4076800000000000;
  *(void *)(v14 + 144) = 2;
  *(void *)(v14 + 152) = 0x4076800000000000;
  *(void *)(v14 + 160) = 5;
  *(void *)(v14 + 168) = 0x4076800000000000;
  *(void *)(v14 + 176) = 3;
  *(void *)(v14 + 184) = 0x40A3B00000000000;
  *(void *)(v14 + 192) = 5;
  *(void *)(v14 + 200) = 0x4096800000000000;
  *(void *)(v14 + 208) = 3;
  *(void *)(v14 + 216) = 0x40AEF00000000000;
  *(void *)(v14 + 224) = 5;
  *(void *)(v14 + 232) = 0x408A400000000000;
  *(void *)(v1 + 128) = v14;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1AD9EEDA0;
  *(void *)(v15 + 32) = 3;
  *(void *)(v15 + 40) = 0x4096800000000000;
  *(void *)(v15 + 48) = 4;
  *(void *)(v15 + 56) = 0x4076800000000000;
  *(void *)(v15 + 64) = 3;
  *(void *)(v15 + 72) = 0x4086800000000000;
  *(void *)(v15 + 80) = 2;
  *(void *)(v15 + 88) = 0x4076800000000000;
  *(void *)(v15 + 96) = 3;
  *(void *)(v15 + 104) = 0x4086800000000000;
  *(void *)(v15 + 112) = 5;
  *(void *)(v15 + 120) = 0x40A0E00000000000;
  *(void *)(v15 + 128) = 3;
  *(void *)(v15 + 136) = 0x4090E00000000000;
  *(void *)(v15 + 144) = 4;
  *(void *)(v15 + 152) = 0x4090E00000000000;
  *(void *)(v15 + 160) = 3;
  *(void *)(v15 + 168) = 0x40A0E00000000000;
  *(void *)(v15 + 176) = 5;
  *(void *)(v15 + 184) = 0x4090E00000000000;
  *(void *)(v15 + 192) = 3;
  *(void *)(v15 + 200) = 0x4076800000000000;
  *(void *)(v15 + 208) = 5;
  *(void *)(v15 + 216) = 0x4076800000000000;
  *(void *)(v15 + 224) = 3;
  *(void *)(v15 + 232) = 0x40B5180000000000;
  *(void *)(v15 + 240) = 5;
  *(void *)(v15 + 248) = 0x40B0E00000000000;
  *(void *)(v15 + 256) = 3;
  *(void *)(v15 + 264) = 0x40A6800000000000;
  *(void *)(v15 + 272) = 5;
  *(void *)(v15 + 280) = 0x4086800000000000;
  *(void *)(v15 + 288) = 2;
  *(void *)(v15 + 296) = 0x4076800000000000;
  *(void *)(v15 + 304) = 5;
  *(void *)(v15 + 312) = 0x4086800000000000;
  *(void *)(v15 + 320) = 3;
  *(void *)(v15 + 328) = 0x40A0E00000000000;
  *(void *)(v1 + 136) = v15;
  return v1;
}

void *sub_1AD9C65B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1AD9C59DC(a1, v2[2], v2[3], v2[4], v2[6], v2[7], a2);
}

id sub_1AD9C65E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = (void *)sub_1AD9DC720();
  uint64_t v11 = (void *)sub_1AD9DCDA0();
  sub_1AD837214(0, &qword_1EB725BE0);
  uint64_t v12 = (void *)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  sub_1AD837214(0, &qword_1E9A4DA90);
  uint64_t v13 = (void *)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_1AD9DC7C0();
  uint64_t v15 = *(void *)(v14 - 8);
  id v16 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a7, 1, v14) != 1)
  {
    id v16 = (void *)sub_1AD9DC720();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a7, v14);
  }
  id v17 = objc_msgSend(v20, sel_initWithMorningIndex_dateInterval_calendar_periods_schedules_sleepDurationGoal_creationInterval_, a1, v10, v11, v12, v13, a6, v16);

  uint64_t v18 = sub_1AD9DCE40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a3, v18);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a2, v14);
  return v17;
}

uint64_t sub_1AD9C67E0(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  v99 = a3;
  uint64_t v87 = a2;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD9C70F0(0, &qword_1EB725CA0, MEMORY[0x1E4F26E60], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v95 = (char *)&v84 - v9;
  uint64_t v10 = sub_1AD9DCE40();
  uint64_t v89 = *(void *)(v10 - 8);
  uint64_t v90 = v10;
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v94 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_1AD9DC7C0();
  uint64_t v91 = *(void *)(v93 - 8);
  MEMORY[0x1F4188790](v93, v13);
  uint64_t v92 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1AD9DCE20();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15, v17);
  id v96 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19, v20);
  char v22 = (char *)&v84 - v21;
  sub_1AD9C70F0(0, &qword_1EB724D70, MEMORY[0x1E4F27928], v6);
  MEMORY[0x1F4188790](v23 - 8, v24);
  id v97 = (char *)&v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26, v27);
  uint64_t v29 = (char *)&v84 - v28;
  uint64_t v30 = sub_1AD9DCC70();
  uint64_t v105 = *(void **)(v30 - 8);
  MEMORY[0x1F4188790](v30, v31);
  v86 = (char *)&v84 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v33, v34);
  uint64_t v85 = (char *)&v84 - v35;
  MEMORY[0x1F4188790](v36, v37);
  v100 = (void (*)(char *, char *, uint64_t))((char *)&v84 - v38);
  MEMORY[0x1F4188790](v39, v40);
  v104 = (char *)&v84 - v41;
  MEMORY[0x1F4188790](v42, v43);
  long long v45 = (char *)&v84 - v44;
  long long v46 = self;
  long long v47 = (void *)sub_1AD9DCDA0();
  uint64_t v101 = a1;
  id v48 = objc_msgSend(v46, sel_hk_noonWithDayIndex_calendar_, a1, v47);

  sub_1AD9DCC40();
  uint64_t v49 = *(void (**)(char *, void, uint64_t))(v16 + 104);
  v49(v22, *MEMORY[0x1E4F27C10], v15);
  sub_1AD9DCD90();
  v88 = v45;
  uint64_t v102 = a4;
  sub_1AD9DCDE0();
  id v50 = *(void (**)(char *, uint64_t))(v16 + 8);
  v98 = (void (*)(char *, uint64_t))(v16 + 8);
  v50(v22, v15);
  uint64_t v51 = (uint64_t (*)(char *, uint64_t, uint64_t))v105[6];
  uint64_t v103 = v30;
  uint64_t result = v51(v29, 1, v30);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v53 = v29;
    uint64_t v54 = v103;
    uint64_t v84 = (void (*)(char *, char *, uint64_t))v105[4];
    v84(v104, v53, v103);
    uint64_t v55 = v96;
    v49(v96, *MEMORY[0x1E4F27C48], v15);
    uint64_t v56 = v97;
    sub_1AD9DCDE0();
    v50(v55, v15);
    uint64_t result = v51(v56, 1, v54);
    if (result != 1)
    {
      unint64_t v57 = v104;
      id v58 = v105;
      v98 = (void (*)(char *, uint64_t))v105[1];
      v99 = (char *)(v105 + 1);
      uint64_t v59 = v103;
      v98(v104, v103);
      v84(v57, v56, v59);
      uint64_t v60 = (void (*)(char *, char *, uint64_t))v58[2];
      id v61 = v100;
      v60((char *)v100, v57, v59);
      id v62 = self;
      uint64_t v63 = v102;
      uint64_t v64 = (void *)sub_1AD9DCDA0();
      uint64_t v105 = objc_msgSend(v62, sel_hk_sleepDayIntervalForMorningIndex_calendar_, v101, v64);

      MEMORY[0x1F4188790](v65, v66);
      *(&v84 - 2) = v61;
      sub_1AD9C5C8C(v87, (void (*)(uint64_t, double))sub_1AD9C7154);
      v60(v85, v57, v59);
      v60(v86, (char *)v61, v59);
      uint64_t v67 = (uint64_t)v92;
      sub_1AD9DC760();
      id v68 = (void *)sub_1AD9DC720();
      sub_1AD837214(0, &qword_1EB725BE8);
      uint64_t v69 = (void *)sub_1AD9DF850();
      swift_bridgeObjectRelease();
      id v70 = objc_msgSend(self, sel_sleepPeriodWithDateInterval_segments_, v68, v69);

      uint64_t v71 = v91;
      uint64_t v72 = v93;
      (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v67, v93);
      sub_1AD9DC740();
      uint64_t v73 = (uint64_t)v94;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v94, v63, v90);
      sub_1AD870B1C();
      uint64_t v74 = swift_allocObject();
      *(_OWORD *)(v74 + 16) = xmmword_1AD9E71F0;
      *(void *)(v74 + 32) = v70;
      uint64_t v106 = v74;
      sub_1AD9DF870();
      uint64_t v75 = v106;
      uint64_t v76 = self;
      id v77 = v70;
      id v78 = objc_msgSend(v76, sel_hourUnit);
      id v79 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v78, 8.0);

      uint64_t v80 = (uint64_t)v95;
      sub_1AD9DC7B0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v71 + 56))(v80, 0, 1, v72);
      id v81 = objc_allocWithZone(MEMORY[0x1E4F2B528]);
      id v82 = sub_1AD9C65E8(v101, v67, v73, v75, MEMORY[0x1E4FBC860], (uint64_t)v79, v80);

      uint64_t v83 = v98;
      v98(v104, v59);
      v83(v88, v59);
      v83((char *)v100, v59);
      return (uint64_t)v82;
    }
  }
  __break(1u);
  return result;
}

void sub_1AD9C70F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

id sub_1AD9C7154(uint64_t a1)
{
  return sub_1AD9C5AA0(a1, *(void *)(v1 + 16));
}

void sub_1AD9C715C(uint64_t a1)
{
}

void sub_1AD9C7190()
{
  if (!qword_1E9A4DAA8)
  {
    type metadata accessor for HKCategoryValueSleepAnalysis(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A4DAA8);
    }
  }
}

uint64_t sub_1AD9C71F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DayRelativeDuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id CALayer.center.setter(double a1, double a2)
{
  objc_msgSend(v2, sel_frame);
  return objc_msgSend(v2, sel_setFrame_, a1 - v5 * 0.5, a2 - v6 * 0.5);
}

id static CALayer.performWithoutAnimation(_:)(void (*a1)(id))
{
  uint64_t v2 = self;
  objc_msgSend(v2, sel_begin);
  a1(objc_msgSend(v2, sel_setDisableActions_, 1));
  return objc_msgSend(v2, sel_commit);
}

double CALayer.center.getter()
{
  objc_msgSend(v0, sel_frame);
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  double MidX = CGRectGetMidX(v7);
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  CGRectGetMidY(v8);
  return MidX;
}

void sub_1AD9C73B0(id *a1@<X0>, CGFloat *a2@<X8>)
{
  objc_msgSend(*a1, sel_frame);
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  CGFloat MidX = CGRectGetMidX(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v10);
  *a2 = MidX;
  a2[1] = MidY;
}

id (*CALayer.center.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  objc_msgSend(v1, sel_frame);
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v11);
  *(CGFloat *)a1 = MidX;
  *(CGFloat *)(a1 + 8) = MidY;
  return sub_1AD9C74C0;
}

id sub_1AD9C74C0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  objc_msgSend(v1, sel_frame);
  return objc_msgSend(v1, sel_setFrame_, v2 - v4 * 0.5, v3 - v5 * 0.5);
}

id sub_1AD9C7530(double *a1, id *a2)
{
  double v2 = *a1;
  double v3 = a1[1];
  id v4 = *a2;
  objc_msgSend(*a2, sel_frame);
  return objc_msgSend(v4, sel_setFrame_, v2 - v5 * 0.5, v3 - v6 * 0.5);
}

uint64_t sub_1AD9C759C()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1AD9C75D8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1AD9C7624(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1AD9C7684(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t type metadata accessor for GetSubviews()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1AD9C76E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9C7728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  v24[1] = a1;
  void v24[2] = a2;
  v24[3] = a9;
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  uint64_t v27 = a6;
  uint64_t v28 = a7;
  uint64_t v29 = a8;
  uint64_t v30 = a8;
  type metadata accessor for GetSubviews.SubviewGetter();
  swift_getWitnessTable();
  uint64_t v12 = sub_1AD9DDEA0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)v24 - v19;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  swift_retain();
  sub_1AD9DDEB0();
  v24[4] = swift_getWitnessTable();
  v24[5] = a7;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1AD90C5E8(v16, v12, WitnessTable);
  char v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v16, v12);
  sub_1AD90C5E8(v20, v12, WitnessTable);
  return ((uint64_t (*)(char *, uint64_t))v22)(v20, v12);
}

uint64_t sub_1AD9C7924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void *)(a6 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)&v21 - v16;
  v18(v15);
  sub_1AD90C5E8(v13, a6, a9);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, a6);
  sub_1AD90C5E8(v17, a6, a9);
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, a6);
}

uint64_t sub_1AD9C7A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F40F7D78](a1, a2, a3, a4, a5, WitnessTable);
}

uint64_t sub_1AD9C7AF0()
{
  return sub_1AD9DDC70();
}

uint64_t sub_1AD9C7B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1AD9C7924(a1, *v8, v8[1], a4, a5, *(void *)(a2 + 32), a7, a8, *(void *)(a2 + 56));
}

uint64_t sub_1AD9C7B9C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1AD9C7728(*v2, v2[1], v2[2], v2[3], a1[2], a1[3], a1[4], a1[5], a2);
}

uint64_t type metadata accessor for GetSubviews.SubviewGetter()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1AD9C7BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 56);
}

void *initializeBufferWithCopyOfBuffer for OneDayDiagram(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for OneDayChart()
{
  return swift_release();
}

void *sub_1AD9C7C0C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1AD9C7C48(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1AD9C7C7C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1AD9C7D40()
{
  return swift_getWitnessTable();
}

uint64_t sub_1AD9C7D5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1AD9C7D78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9C7DC4(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t ScheduleOccurrenceView.init(viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1AD9C861C(a1, a2, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
}

uint64_t ScheduleOccurrenceView.viewModel.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9CBAE8(v1, a1, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
}

uint64_t ScheduleOccurrenceView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  sub_1AD9C7FE4(0);
  MEMORY[0x1F4188790](v4 - 8, v5);
  CGRect v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9C8360(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)CGRect v7 = sub_1AD9DE340();
  *((void *)v7 + sub_1AD95AB40(3, 1) = 0x4018000000000000;
  v7[16] = 0;
  sub_1AD9C8584();
  sub_1AD9C8388(v2, (uint64_t)&v7[*(int *)(v13 + 44)]);
  char v14 = sub_1AD9DE7B0();
  type metadata accessor for ScheduleOccurrenceViewModel();
  sub_1AD9DDCC0();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_1AD9CBAE8((uint64_t)v7, (uint64_t)v12, (uint64_t (*)(void))sub_1AD9C7FE4);
  uint64_t v23 = &v12[*(int *)(v9 + 44)];
  *uint64_t v23 = v14;
  *((void *)v23 + sub_1AD95AB40(3, 1) = v16;
  *((void *)v23 + 2) = v18;
  *((void *)v23 + 3) = v20;
  *((void *)v23 + 4) = v22;
  v23[40] = 0;
  sub_1AD9CBB50((uint64_t)v7, (uint64_t (*)(void))sub_1AD9C7FE4);
  return sub_1AD9C861C((uint64_t)v12, a1, (uint64_t (*)(void))sub_1AD9C8360);
}

void sub_1AD9C7FE4(uint64_t a1)
{
}

void sub_1AD9C8014(uint64_t a1)
{
}

void sub_1AD9C8048()
{
  if (!qword_1E9A4DBD0)
  {
    sub_1AD9CBA80(255, &qword_1E9A4DBD8, MEMORY[0x1E4F3D750]);
    sub_1AD9DE6E0();
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DBD0);
    }
  }
}

void sub_1AD9C80CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1AD9C8130()
{
  if (!qword_1E9A4DBE0)
  {
    sub_1AD9C80CC(255, &qword_1E9A4DBE8, (uint64_t (*)(uint64_t))sub_1AD9C81E4, MEMORY[0x1E4F3F108]);
    sub_1AD9CBE8C(&qword_1E9A4DC00, &qword_1E9A4DBE8, (uint64_t (*)(uint64_t))sub_1AD9C81E4);
    unint64_t v0 = sub_1AD9DDDB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DBE0);
    }
  }
}

void sub_1AD9C81E4(uint64_t a1)
{
}

void sub_1AD9C8218(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    a4(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v7) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView(uint64_t a1)
{
  return sub_1AD8372AC(a1, (uint64_t *)&unk_1E9A4DC50);
}

void sub_1AD9C82B4(uint64_t a1)
{
}

void sub_1AD9C82DC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1AD9DDFC0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView(uint64_t a1)
{
  return sub_1AD8372AC(a1, (uint64_t *)&unk_1E9A4DC40);
}

void sub_1AD9C8360(uint64_t a1)
{
}

uint64_t sub_1AD9C8388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1AD9C8130();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v11 = (char *)&v23 - v10;
  sub_1AD9C8048();
  MEMORY[0x1F4188790](v12 - 8, v13);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16, v17);
  uint64_t v19 = (char *)&v23 - v18;
  sub_1AD9C86A0((uint64_t)&v23 - v18);
  *uint64_t v11 = sub_1AD9DE740();
  sub_1AD9CB9E4();
  sub_1AD9C89E8(a1, (uint64_t)&v11[*(int *)(v20 + 44)]);
  sub_1AD9CBAE8((uint64_t)v19, (uint64_t)v15, (uint64_t (*)(void))sub_1AD9C8048);
  sub_1AD9CBAE8((uint64_t)v11, (uint64_t)v7, (uint64_t (*)(void))sub_1AD9C8130);
  sub_1AD9CBAE8((uint64_t)v15, a2, (uint64_t (*)(void))sub_1AD9C8048);
  sub_1AD9C8014(0);
  sub_1AD9CBAE8((uint64_t)v7, a2 + *(int *)(v21 + 48), (uint64_t (*)(void))sub_1AD9C8130);
  sub_1AD9CBB50((uint64_t)v11, (uint64_t (*)(void))sub_1AD9C8130);
  sub_1AD9CBB50((uint64_t)v19, (uint64_t (*)(void))sub_1AD9C8048);
  sub_1AD9CBB50((uint64_t)v7, (uint64_t (*)(void))sub_1AD9C8130);
  return sub_1AD9CBB50((uint64_t)v15, (uint64_t (*)(void))sub_1AD9C8048);
}

void sub_1AD9C8584()
{
  if (!qword_1E9A4DC18)
  {
    sub_1AD9C80CC(255, &qword_1E9A4DBC0, (uint64_t (*)(uint64_t))sub_1AD9C8014, MEMORY[0x1E4F3F108]);
    unint64_t v0 = sub_1AD9DDEA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DC18);
    }
  }
}

uint64_t sub_1AD9C861C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AD9C8684()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9C86A0@<X0>(uint64_t a1@<X8>)
{
  v24[3] = a1;
  sub_1AD9CBA80(0, &qword_1E9A4DC68, MEMORY[0x1E4F3D748]);
  v24[0] = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v24 - v4;
  sub_1AD941130(0);
  v24[1] = v6;
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9CBA80(0, &qword_1E9A4DBD8, MEMORY[0x1E4F3D750]);
  void v24[2] = v10;
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v13 = (char *)v24 - v12;
  uint64_t v14 = ScheduleOccurrenceViewModel.localizedHeaderString.getter();
  uint64_t v16 = v15;
  uint64_t v17 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ScheduleOccurrenceViewModel() + 40));
  uint64_t v18 = *v17;
  uint64_t v19 = v17[2];
  char v20 = *((unsigned char *)v17 + 25);
  swift_retain();
  swift_retain();
  uint64_t v21 = ScheduleOccurrenceViewModel.localizedHeaderAccessibilityString.getter();
  LOWORD(v25) = -772;
  *((void *)&v25 + sub_1AD95AB40(3, 1) = v14;
  uint64_t v26 = v16;
  uint64_t v27 = v18;
  uint64_t v28 = v19;
  char v29 = v20;
  uint64_t v30 = v21;
  uint64_t v31 = v22;
  static Text.create(_:)(&v25, (uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  ScheduleOccurrenceViewModel.localizedHeaderString.getter();
  swift_retain();
  swift_retain();
  ScheduleOccurrenceViewModel.localizedHeaderAccessibilityString.getter();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0) {
    sub_1AD9CBAE8((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(void))sub_1AD941130);
  }
  swift_storeEnumTagMultiPayload();
  sub_1AD9559A0(&qword_1E9A4C898, sub_1AD941130, (void (*)(void))sub_1AD941648);
  sub_1AD9DE470();
  sub_1AD9CBB50((uint64_t)v9, (uint64_t (*)(void))sub_1AD941130);
  LOBYTE(v25) = 3;
  static String.healthAccessibilityIdentifier(_:_:)((unsigned __int8 *)&v25, (uint64_t)&unk_1F046AAC0);
  swift_arrayDestroy();
  sub_1AD9CBBB0();
  sub_1AD9DED30();
  swift_bridgeObjectRelease();
  return sub_1AD9CBC88((uint64_t)v13);
}

uint64_t sub_1AD9C89E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView(0);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9C82B4(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v17 = type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView(0);
  MEMORY[0x1F4188790](v17 - 8, v18);
  char v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21, v22);
  uint64_t v24 = (char *)&v27 - v23;
  sub_1AD9CBAE8(a1, (uint64_t)&v27 - v23, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
  sub_1AD9CBAE8(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
  sub_1AD9CBAE8((uint64_t)v7, (uint64_t)v12, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView);
  *(_WORD *)&v12[*(int *)(v9 + 44)] = 256;
  sub_1AD9CBB50((uint64_t)v7, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView);
  sub_1AD9C861C((uint64_t)v12, (uint64_t)v16, (uint64_t (*)(void))sub_1AD9C82B4);
  sub_1AD9CBAE8((uint64_t)v24, (uint64_t)v20, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
  sub_1AD9CBAE8((uint64_t)v16, (uint64_t)v12, (uint64_t (*)(void))sub_1AD9C82B4);
  sub_1AD9CBAE8((uint64_t)v20, a2, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
  sub_1AD9C81E4(0);
  sub_1AD9CBAE8((uint64_t)v12, a2 + *(int *)(v25 + 48), (uint64_t (*)(void))sub_1AD9C82B4);
  sub_1AD9CBB50((uint64_t)v16, (uint64_t (*)(void))sub_1AD9C82B4);
  sub_1AD9CBB50((uint64_t)v24, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
  sub_1AD9CBB50((uint64_t)v12, (uint64_t (*)(void))sub_1AD9C82B4);
  return sub_1AD9CBB50((uint64_t)v20, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
}

void *sub_1AD9C8CA8@<X0>(_OWORD *a1@<X8>)
{
  sub_1AD9C8CF8(v1, __src);
  *a1 = xmmword_1AD9EEF20;
  return memcpy(a1 + 1, __src, 0x1E0uLL);
}

uint64_t sub_1AD9C8CF8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + *(int *)(v8 + 48) + 192);
  sub_1AD9CBAE8(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
  if ((v9 & 2) == 0)
  {
    sub_1AD9CBB50((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
LABEL_5:
    sub_1AD976874((uint64_t)v83);
    goto LABEL_6;
  }
  char v10 = sub_1AD973C2C();
  sub_1AD9CBB50((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ScheduleOccurrenceViewModel);
  if ((v10 & 1) == 0) {
    goto LABEL_5;
  }
  sub_1AD976460((uint64_t)v83);
LABEL_6:
  long long v28 = v83[10];
  long long v29 = v83[11];
  long long v30 = v83[12];
  uint64_t v31 = v84;
  long long v24 = v83[6];
  long long v25 = v83[7];
  long long v26 = v83[8];
  long long v27 = v83[9];
  long long v20 = v83[2];
  long long v21 = v83[3];
  long long v22 = v83[4];
  long long v23 = v83[5];
  long long v18 = v83[0];
  long long v19 = v83[1];
  *(void *)&v77[0] = 0;
  BYTE8(v77[0]) = 1;
  sub_1AD87437C(0, &qword_1E9A4C748);
  sub_1AD9DF040();
  uint64_t v11 = *(void *)&v70[0];
  uint64_t v12 = *(void *)&v70[1];
  long long v44 = v28;
  long long v45 = v29;
  long long v46 = v30;
  uint64_t v47 = v31;
  long long v40 = v24;
  long long v41 = v25;
  long long v42 = v26;
  long long v43 = v27;
  long long v36 = v20;
  long long v37 = v21;
  long long v38 = v22;
  long long v39 = v23;
  long long v34 = v18;
  long long v35 = v19;
  char v33 = BYTE8(v70[0]);
  sub_1AD976AD8((uint64_t)&v48);
  *(void *)&v77[0] = 0;
  BYTE8(v77[0]) = 1;
  sub_1AD9DF040();
  v71[10] = v58;
  v71[11] = v59;
  v71[12] = v60;
  v71[6] = v54;
  v71[7] = v55;
  v71[8] = v56;
  v71[9] = v57;
  v71[2] = v50;
  v71[3] = v51;
  v71[4] = v52;
  v71[5] = v53;
  v71[0] = v48;
  v71[1] = v49;
  v64[10] = v44;
  v64[11] = v45;
  v64[12] = v46;
  v64[6] = v40;
  v64[7] = v41;
  v64[8] = v42;
  v64[9] = v43;
  v64[2] = v36;
  v64[3] = v37;
  v64[4] = v38;
  v64[5] = v39;
  v64[0] = v34;
  v64[1] = v35;
  v67[10] = v58;
  v67[11] = v59;
  v67[12] = v60;
  v67[6] = v54;
  v67[7] = v55;
  v67[8] = v56;
  v67[9] = v57;
  uint64_t v13 = *(void *)&v70[0];
  char v14 = BYTE8(v70[0]);
  uint64_t v15 = *(void *)&v70[1];
  char v16 = v33;
  *(void *)&long long v65 = v47;
  *((void *)&v65 + sub_1AD95AB40(3, 1) = v11;
  LOBYTE(v66) = v33;
  *(_DWORD *)((char *)&v66 + sub_1AD95AB40(3, 1) = *(_DWORD *)v32;
  DWORD1(v66) = *(_DWORD *)&v32[3];
  *((void *)&v66 + sub_1AD95AB40(3, 1) = v12;
  *(_DWORD *)((char *)&v69 + sub_1AD95AB40(3, 1) = *(_DWORD *)v62;
  DWORD1(v69) = *(_DWORD *)&v62[3];
  v67[2] = v50;
  v67[3] = v51;
  v67[4] = v52;
  v67[5] = v53;
  v67[0] = v48;
  v67[1] = v49;
  *(void *)&long long v68 = v61;
  *((void *)&v68 + sub_1AD95AB40(3, 1) = *(void *)&v70[0];
  LOBYTE(v69) = BYTE8(v70[0]);
  *((void *)&v69 + sub_1AD95AB40(3, 1) = *(void *)&v70[1];
  v70[12] = v46;
  v70[13] = v65;
  v70[8] = v42;
  v70[9] = v43;
  v70[11] = v45;
  v70[10] = v44;
  v70[4] = v38;
  v70[5] = v39;
  v70[7] = v41;
  v70[6] = v40;
  v70[0] = v34;
  v70[1] = v35;
  v70[3] = v37;
  v70[2] = v36;
  v70[26] = v59;
  v70[27] = v60;
  v70[28] = v68;
  v70[29] = v69;
  v70[22] = v55;
  v70[23] = v56;
  v70[24] = v57;
  v70[25] = v58;
  v70[18] = v51;
  v70[19] = v52;
  v70[20] = v53;
  v70[21] = v54;
  v70[14] = v66;
  v70[15] = v48;
  uint64_t v72 = v61;
  char v63 = v69;
  *(_DWORD *)uint64_t v75 = *(_DWORD *)v62;
  *(_DWORD *)&v75[3] = *(_DWORD *)&v62[3];
  v70[16] = v49;
  v70[17] = v50;
  memcpy(a2, v70, 0x1E0uLL);
  uint64_t v73 = v13;
  char v74 = v14;
  uint64_t v76 = v15;
  sub_1AD93FCA8((uint64_t)v64);
  sub_1AD93FCA8((uint64_t)v67);
  sub_1AD9CB8F8((uint64_t)v71);
  v77[10] = v44;
  v77[11] = v45;
  v77[12] = v46;
  v77[6] = v40;
  v77[7] = v41;
  v77[8] = v42;
  v77[9] = v43;
  v77[2] = v36;
  v77[3] = v37;
  v77[4] = v38;
  v77[5] = v39;
  v77[0] = v34;
  v77[1] = v35;
  uint64_t v78 = v47;
  uint64_t v79 = v11;
  char v80 = v16;
  *(_DWORD *)id v81 = *(_DWORD *)v32;
  *(_DWORD *)&v81[3] = *(_DWORD *)&v32[3];
  uint64_t v82 = v12;
  return sub_1AD9CB8F8((uint64_t)v77);
}

void *sub_1AD9C91F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AD9DE340();
  sub_1AD9C8CF8(v1, v5);
  memcpy(&__src[7], v5, 0x1E0uLL);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0x4018000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  return memcpy((void *)(a1 + 17), __src, 0x1E7uLL);
}

uint64_t getEnumTagSinglePayload for ScheduleOccurrenceView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1);
}

uint64_t storeEnumTagSinglePayload for ScheduleOccurrenceView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1);
}

uint64_t type metadata accessor for ScheduleOccurrenceView(uint64_t a1)
{
  return sub_1AD8372AC(a1, (uint64_t *)&unk_1E9A4DC20);
}

unint64_t sub_1AD9C92E0()
{
  unint64_t result = qword_1E9A4DC30;
  if (!qword_1E9A4DC30)
  {
    sub_1AD9C8360(255);
    sub_1AD9CC14C(&qword_1E9A4DC38, sub_1AD9C7FE4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DC30);
  }
  return result;
}

uint64_t *_s13SleepHealthUI22ScheduleOccurrenceViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = sub_1AD9DC990();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = v6[5];
    uint64_t v13 = (char *)a1 + v12;
    char v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 1, v7))
    {
      sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
    uint64_t v16 = v6[6];
    uint64_t v17 = (char *)a1 + v16;
    long long v18 = (char *)a2 + v16;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    *(uint64_t *)((char *)a1 + v6[7]) = *(uint64_t *)((char *)a2 + v6[7]);
    *((unsigned char *)a1 + v6[8]) = *((unsigned char *)a2 + v6[8]);
    *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
    uint64_t v19 = v6[10];
    long long v20 = (char *)a1 + v19;
    long long v21 = (char *)a2 + v19;
    *(void *)long long v20 = *(void *)v21;
    v20[8] = v21[8];
    *((void *)v20 + 2) = *((void *)v21 + 2);
    v20[24] = v21[24];
    v20[25] = v21[25];
    *((void *)v20 + 4) = *((void *)v21 + 4);
    v20[40] = v21[40];
    *((void *)v20 + 6) = *((void *)v21 + 6);
    v20[56] = v21[56];
    v20[57] = v21[57];
    *((void *)v20 + 8) = *((void *)v21 + 8);
    v20[72] = v21[72];
    *((void *)v20 + 10) = *((void *)v21 + 10);
    v20[88] = v21[88];
    v20[89] = v21[89];
    *((void *)v20 + 12) = *((void *)v21 + 12);
    v20[104] = v21[104];
    *((void *)v20 + 14) = *((void *)v21 + 14);
    v20[120] = v21[120];
    v20[121] = v21[121];
    *((void *)v20 + 16) = *((void *)v21 + 16);
    v20[136] = v21[136];
    *((void *)v20 + 18) = *((void *)v21 + 18);
    v20[152] = v21[152];
    v20[153] = v21[153];
    *((void *)v20 + 20) = *((void *)v21 + 20);
    v20[168] = v21[168];
    *((void *)v20 + 22) = *((void *)v21 + 22);
    v20[184] = v21[184];
    v20[185] = v21[185];
    *((void *)v20 + 24) = *((void *)v21 + 24);
    uint64_t v22 = v6[11];
    __dst = (char *)a1 + v22;
    long long v42 = v6;
    long long v39 = (char *)a2 + v22;
    uint64_t v23 = sub_1AD9DCC70();
    uint64_t v40 = *(void *)(v23 - 8);
    long long v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v24(v39, 1, v23))
    {
      sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
      memcpy(__dst, v39, *(void *)(*(void *)(v25 - 8) + 64));
      uint64_t v26 = v40;
    }
    else
    {
      uint64_t v26 = v40;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(__dst, v39, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(__dst, 0, 1, v23);
    }
    uint64_t v27 = v42[12];
    long long v28 = (char *)a1 + v27;
    long long v29 = (char *)a2 + v27;
    if (v24((char *)a2 + v27, 1, v23))
    {
      sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v28, v29, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v28, 0, 1, v23);
    }
    uint64_t v31 = v42[13];
    uint64_t v32 = (char *)a1 + v31;
    char v33 = (char *)a2 + v31;
    if (v24((char *)a2 + v31, 1, v23))
    {
      sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
      memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v32, v33, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v32, 0, 1, v23);
    }
    uint64_t v35 = v42[14];
    long long v36 = *(void **)((char *)a2 + v35);
    *(uint64_t *)((char *)a1 + v35) = (uint64_t)v36;
    id v37 = v36;
  }
  return a1;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwcp_0(char *a1, char *a2)
{
  uint64_t v4 = sub_1AD9DC990();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v6(a2, 1, v4))
  {
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  uint64_t v8 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if (v6(&a2[v9], 1, v4))
  {
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v11, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  }
  uint64_t v13 = v8[6];
  char v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)char v14 = *(void *)v15;
  v14[8] = v15[8];
  *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
  a1[v8[8]] = a2[v8[8]];
  a1[v8[9]] = a2[v8[9]];
  uint64_t v16 = v8[10];
  uint64_t v17 = &a1[v16];
  long long v18 = &a2[v16];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  *((void *)v17 + 2) = *((void *)v18 + 2);
  v17[24] = v18[24];
  v17[25] = v18[25];
  *((void *)v17 + 4) = *((void *)v18 + 4);
  v17[40] = v18[40];
  *((void *)v17 + 6) = *((void *)v18 + 6);
  v17[56] = v18[56];
  v17[57] = v18[57];
  *((void *)v17 + 8) = *((void *)v18 + 8);
  v17[72] = v18[72];
  *((void *)v17 + 10) = *((void *)v18 + 10);
  v17[88] = v18[88];
  v17[89] = v18[89];
  *((void *)v17 + 12) = *((void *)v18 + 12);
  v17[104] = v18[104];
  *((void *)v17 + 14) = *((void *)v18 + 14);
  v17[120] = v18[120];
  v17[121] = v18[121];
  *((void *)v17 + 16) = *((void *)v18 + 16);
  v17[136] = v18[136];
  *((void *)v17 + 18) = *((void *)v18 + 18);
  v17[152] = v18[152];
  v17[153] = v18[153];
  *((void *)v17 + 20) = *((void *)v18 + 20);
  v17[168] = v18[168];
  *((void *)v17 + 22) = *((void *)v18 + 22);
  v17[184] = v18[184];
  v17[185] = v18[185];
  *((void *)v17 + 24) = *((void *)v18 + 24);
  uint64_t v19 = v8[11];
  long long v39 = a1;
  __dst = &a1[v19];
  long long v20 = &a2[v19];
  uint64_t v21 = sub_1AD9DCC70();
  uint64_t v37 = *(void *)(v21 - 8);
  uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v22(v20, 1, v21))
  {
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64));
    uint64_t v24 = v37;
  }
  else
  {
    uint64_t v24 = v37;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(__dst, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(__dst, 0, 1, v21);
  }
  uint64_t v25 = v8[12];
  uint64_t v26 = &v39[v25];
  uint64_t v27 = &a2[v25];
  if (v22(&a2[v25], 1, v21))
  {
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v26, v27, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v26, 0, 1, v21);
  }
  uint64_t v29 = v8[13];
  uint64_t v30 = &v39[v29];
  uint64_t v31 = &a2[v29];
  if (v22(&a2[v29], 1, v21))
  {
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v30, v31, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v30, 0, 1, v21);
  }
  uint64_t v33 = v8[14];
  uint64_t v34 = *(void **)&a2[v33];
  *(void *)&v39[v33] = v34;
  id v35 = v34;
  return v39;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwca_0(char *a1, char *a2)
{
  uint64_t v4 = sub_1AD9DC990();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
LABEL_6:
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
LABEL_7:
  uint64_t v10 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  uint64_t v11 = v10[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = v6(&a1[v11], 1, v4);
  int v15 = v6(v13, 1, v4);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v13, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_12:
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v12, v13, v4);
LABEL_13:
  uint64_t v17 = v10[6];
  long long v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = *(void *)v19;
  v18[8] = v19[8];
  *(void *)long long v18 = v20;
  *(void *)&a1[v10[7]] = *(void *)&a2[v10[7]];
  a1[v10[8]] = a2[v10[8]];
  a1[v10[9]] = a2[v10[9]];
  uint64_t v21 = v10[10];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  swift_retain();
  swift_release();
  v22[8] = v23[8];
  *((void *)v22 + 2) = *((void *)v23 + 2);
  swift_retain();
  swift_release();
  v22[24] = v23[24];
  v22[25] = v23[25];
  *((void *)v22 + 4) = *((void *)v23 + 4);
  swift_retain();
  swift_release();
  v22[40] = v23[40];
  *((void *)v22 + 6) = *((void *)v23 + 6);
  swift_retain();
  swift_release();
  v22[56] = v23[56];
  v22[57] = v23[57];
  *((void *)v22 + 8) = *((void *)v23 + 8);
  swift_retain();
  swift_release();
  v22[72] = v23[72];
  *((void *)v22 + 10) = *((void *)v23 + 10);
  swift_retain();
  swift_release();
  v22[88] = v23[88];
  v22[89] = v23[89];
  *((void *)v22 + 12) = *((void *)v23 + 12);
  swift_retain();
  swift_release();
  v22[104] = v23[104];
  *((void *)v22 + 14) = *((void *)v23 + 14);
  swift_retain();
  swift_release();
  v22[120] = v23[120];
  v22[121] = v23[121];
  *((void *)v22 + 16) = *((void *)v23 + 16);
  swift_retain();
  swift_release();
  v22[136] = v23[136];
  *((void *)v22 + 18) = *((void *)v23 + 18);
  swift_retain();
  swift_release();
  v22[152] = v23[152];
  v22[153] = v23[153];
  *((void *)v22 + 20) = *((void *)v23 + 20);
  swift_retain();
  swift_release();
  v22[168] = v23[168];
  *((void *)v22 + 22) = *((void *)v23 + 22);
  swift_retain();
  swift_release();
  v22[184] = v23[184];
  v22[185] = v23[185];
  *((void *)v22 + 24) = *((void *)v23 + 24);
  uint64_t v24 = v10[11];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = sub_1AD9DCC70();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v25, 1, v27);
  int v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
LABEL_18:
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v25, v26, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v25, v26, v27);
LABEL_19:
  uint64_t v33 = v10[12];
  uint64_t v34 = &a1[v33];
  id v35 = &a2[v33];
  int v36 = v29(&a1[v33], 1, v27);
  int v37 = v29(v35, 1, v27);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v34, v35, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v34, 0, 1, v27);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v37)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v34, v27);
LABEL_24:
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v34, v35, v27);
LABEL_25:
  uint64_t v39 = v10[13];
  uint64_t v40 = &a1[v39];
  long long v41 = &a2[v39];
  int v42 = v29(&a1[v39], 1, v27);
  int v43 = v29(v41, 1, v27);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v40, v41, v27);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v40, v27);
    goto LABEL_30;
  }
  if (v43)
  {
LABEL_30:
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v40, v41, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v40, 0, 1, v27);
LABEL_31:
  uint64_t v45 = v10[14];
  long long v46 = *(void **)&a1[v45];
  uint64_t v47 = *(void **)&a2[v45];
  *(void *)&a1[v45] = v47;
  id v48 = v47;

  return a1;
}

uint64_t sub_1AD9CA9EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1_0);
}

uint64_t sub_1AD9CAA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1_0);
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwtk_0(char *a1, char *a2)
{
  uint64_t v4 = sub_1AD9DC990();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v6(a2, 1, v4))
  {
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  int v8 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  if (v6(&a2[v9], 1, v4))
  {
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v11, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  }
  uint64_t v13 = v8[6];
  int v14 = &a1[v13];
  int v15 = &a2[v13];
  *(void *)int v14 = *(void *)v15;
  v14[8] = v15[8];
  *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
  a1[v8[8]] = a2[v8[8]];
  a1[v8[9]] = a2[v8[9]];
  uint64_t v16 = v8[10];
  uint64_t v17 = &a1[v16];
  long long v18 = &a2[v16];
  long long v19 = *((_OWORD *)v18 + 3);
  *((_OWORD *)v17 + 2) = *((_OWORD *)v18 + 2);
  *((_OWORD *)v17 + 3) = v19;
  long long v20 = *((_OWORD *)v18 + 1);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + sub_1AD95AB40(3, 1) = v20;
  long long v21 = *((_OWORD *)v18 + 7);
  *((_OWORD *)v17 + 6) = *((_OWORD *)v18 + 6);
  *((_OWORD *)v17 + 7) = v21;
  long long v22 = *((_OWORD *)v18 + 5);
  *((_OWORD *)v17 + 4) = *((_OWORD *)v18 + 4);
  *((_OWORD *)v17 + 5) = v22;
  *((void *)v17 + 24) = *((void *)v18 + 24);
  long long v23 = *((_OWORD *)v18 + 11);
  *((_OWORD *)v17 + 10) = *((_OWORD *)v18 + 10);
  *((_OWORD *)v17 + 1sub_1AD95AB40(3, 1) = v23;
  long long v24 = *((_OWORD *)v18 + 9);
  *((_OWORD *)v17 + 8) = *((_OWORD *)v18 + 8);
  *((_OWORD *)v17 + 9) = v24;
  uint64_t v25 = v8[11];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v28 = sub_1AD9DCC70();
  uint64_t v29 = *(void *)(v28 - 8);
  int v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  if (v30(v27, 1, v28))
  {
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v26, v27, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  uint64_t v32 = v8[12];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  if (v30(&a2[v32], 1, v28))
  {
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v33, v34, v28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v33, 0, 1, v28);
  }
  uint64_t v36 = v8[13];
  int v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  if (v30(&a2[v36], 1, v28))
  {
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v37, v38, v28);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v37, 0, 1, v28);
  }
  *(void *)&a1[v8[14]] = *(void *)&a2[v8[14]];
  return a1;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwta_0(char *a1, char *a2)
{
  uint64_t v4 = sub_1AD9DC990();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
LABEL_6:
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
LABEL_7:
  uint64_t v10 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  uint64_t v11 = v10[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  int v14 = v6(&a1[v11], 1, v4);
  int v15 = v6(v13, 1, v4);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v13, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_12:
    sub_1AD9C80CC(0, &qword_1E9A49F48, MEMORY[0x1E4F26F90], MEMORY[0x1E4FBB718]);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v12, v13, v4);
LABEL_13:
  uint64_t v17 = v10[6];
  long long v18 = &a1[v17];
  long long v19 = &a2[v17];
  *(void *)long long v18 = *(void *)v19;
  v18[8] = v19[8];
  *(void *)&a1[v10[7]] = *(void *)&a2[v10[7]];
  a1[v10[8]] = a2[v10[8]];
  a1[v10[9]] = a2[v10[9]];
  uint64_t v20 = v10[10];
  long long v21 = &a1[v20];
  long long v22 = &a2[v20];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  swift_release();
  v21[8] = v22[8];
  *((void *)v21 + 2) = *((void *)v22 + 2);
  swift_release();
  v21[24] = v22[24];
  v21[25] = v22[25];
  *((void *)v21 + 4) = *((void *)v22 + 4);
  swift_release();
  v21[40] = v22[40];
  *((void *)v21 + 6) = *((void *)v22 + 6);
  swift_release();
  v21[56] = v22[56];
  v21[57] = v22[57];
  *((void *)v21 + 8) = *((void *)v22 + 8);
  swift_release();
  v21[72] = v22[72];
  *((void *)v21 + 10) = *((void *)v22 + 10);
  swift_release();
  v21[88] = v22[88];
  v21[89] = v22[89];
  *((void *)v21 + 12) = *((void *)v22 + 12);
  swift_release();
  v21[104] = v22[104];
  *((void *)v21 + 14) = *((void *)v22 + 14);
  swift_release();
  v21[120] = v22[120];
  v21[121] = v22[121];
  *((void *)v21 + 16) = *((void *)v22 + 16);
  swift_release();
  v21[136] = v22[136];
  *((void *)v21 + 18) = *((void *)v22 + 18);
  swift_release();
  v21[152] = v22[152];
  v21[153] = v22[153];
  *((void *)v21 + 20) = *((void *)v22 + 20);
  swift_release();
  v21[168] = v22[168];
  *((void *)v21 + 22) = *((void *)v22 + 22);
  swift_release();
  v21[184] = v22[184];
  v21[185] = v22[185];
  *((void *)v21 + 24) = *((void *)v22 + 24);
  uint64_t v23 = v10[11];
  long long v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = sub_1AD9DCC70();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
LABEL_18:
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
LABEL_19:
  uint64_t v32 = v10[12];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  int v35 = v28(&a1[v32], 1, v26);
  int v36 = v28(v34, 1, v26);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v33, v34, v26);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v33, 0, 1, v26);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v36)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v33, v26);
LABEL_24:
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v33, v34, v26);
LABEL_25:
  uint64_t v38 = v10[13];
  uint64_t v39 = &a1[v38];
  uint64_t v40 = &a2[v38];
  int v41 = v28(&a1[v38], 1, v26);
  int v42 = v28(v40, 1, v26);
  if (!v41)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v39, v40, v26);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v39, v26);
    goto LABEL_30;
  }
  if (v42)
  {
LABEL_30:
    sub_1AD9C80CC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
    memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v39, v40, v26);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v39, 0, 1, v26);
LABEL_31:
  uint64_t v44 = v10[14];
  uint64_t v45 = *(void **)&a1[v44];
  *(void *)&a1[v44] = *(void *)&a2[v44];

  return a1;
}

uint64_t sub_1AD9CB7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD9CB7C8);
}

uint64_t __swift_get_extra_inhabitant_indexTm_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1AD9CB838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD9CB84C);
}

uint64_t __swift_store_extra_inhabitant_indexTm_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_1AD9CB8C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9CB8DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9CB8F8(uint64_t a1)
{
  return a1;
}

void sub_1AD9CB9E4()
{
  if (!qword_1E9A4DC60)
  {
    sub_1AD9C80CC(255, &qword_1E9A4DBE8, (uint64_t (*)(uint64_t))sub_1AD9C81E4, MEMORY[0x1E4F3F108]);
    sub_1AD85CED0();
    unint64_t v0 = sub_1AD9DDEA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DC60);
    }
  }
}

void sub_1AD9CBA80(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void, uint64_t))
{
  if (!*a2)
  {
    sub_1AD941130(255);
    unint64_t v7 = a3(a1, MEMORY[0x1E4F3F058], v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1AD9CBAE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AD9CBB50(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1AD9CBBB0()
{
  unint64_t result = qword_1E9A4DC70;
  if (!qword_1E9A4DC70)
  {
    sub_1AD9CBA80(255, &qword_1E9A4DBD8, MEMORY[0x1E4F3D750]);
    sub_1AD9559A0(&qword_1E9A4C898, sub_1AD941130, (void (*)(void))sub_1AD941648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DC70);
  }
  return result;
}

uint64_t sub_1AD9CBC88(uint64_t a1)
{
  sub_1AD9CBA80(0, &qword_1E9A4DBD8, MEMORY[0x1E4F3D750]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AD9CBD04()
{
  unint64_t result = qword_1E9A4DC78;
  if (!qword_1E9A4DC78)
  {
    sub_1AD9CBD88(255, &qword_1E9A4DC80, &qword_1E9A4DC88, (uint64_t (*)(uint64_t))sub_1AD9CBE28, &qword_1E9A4DC98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DC78);
  }
  return result;
}

void sub_1AD9CBD88(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  if (!*a2)
  {
    sub_1AD9C80CC(255, a3, a4, MEMORY[0x1E4F3F108]);
    sub_1AD9CBE8C(a5, a3, a4);
    unint64_t v9 = sub_1AD9DF180();
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1AD9CBE28()
{
  if (!qword_1E9A4DC90)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1E9A4DC90);
    }
  }
}

uint64_t sub_1AD9CBE8C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AD9C80CC(255, a2, a3, MEMORY[0x1E4F3F108]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1AD9CBEF4()
{
  unint64_t result = qword_1E9A4DCA0;
  if (!qword_1E9A4DCA0)
  {
    sub_1AD9CBFC0();
    sub_1AD9CC14C(&qword_1E9A4DCC8, (void (*)(uint64_t))sub_1AD9CC09C);
    sub_1AD9CBE8C(&qword_1E9A4DC98, &qword_1E9A4DC88, (uint64_t (*)(uint64_t))sub_1AD9CBE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DCA0);
  }
  return result;
}

void sub_1AD9CBFC0()
{
  if (!qword_1E9A4DCA8)
  {
    sub_1AD9CC09C();
    sub_1AD9C80CC(255, &qword_1E9A4DC88, (uint64_t (*)(uint64_t))sub_1AD9CBE28, MEMORY[0x1E4F3F108]);
    sub_1AD9CC14C(&qword_1E9A4DCC0, (void (*)(uint64_t))sub_1AD9CC09C);
    unint64_t v0 = sub_1AD9DDEA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DCA8);
    }
  }
}

void sub_1AD9CC09C()
{
  if (!qword_1E9A4DCB0)
  {
    sub_1AD9CC0F8();
    unint64_t v0 = sub_1AD9DDD60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DCB0);
    }
  }
}

unint64_t sub_1AD9CC0F8()
{
  unint64_t result = qword_1E9A4DCB8;
  if (!qword_1E9A4DCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DCB8);
  }
  return result;
}

uint64_t sub_1AD9CC14C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ScheduleOccurrenceTitleView.__allocating_init(titleText:subtitleText:screenSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return ScheduleOccurrenceTitleView.init(titleText:subtitleText:screenSize:)(a5, a6, a1, a2, a3, a4);
}

uint64_t ScheduleOccurrenceTitleView.init(titleText:subtitleText:screenSize:)(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7 = v6;
  uint64_t v11 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title;
  uint64_t v12 = (void *)*MEMORY[0x1E4FB2928];
  id v13 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  int v14 = v7;
  id v15 = v12;
  id v16 = objc_msgSend(v13, sel_init);
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  id v17 = v16;
  id v18 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)((uint64_t)v15, 0, 0, 0, 0, 0, 0, 0, 1);
  objc_msgSend(v17, sel_setFont_, v18);

  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v17, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v17, sel_setLineBreakMode_, 0);
  objc_msgSend(v17, sel_setNumberOfLines_, 0);
  objc_msgSend(v17, sel_setTextAlignment_, 1);
  *(void *)&v7[v11] = v17;
  *(void *)&v14[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint] = 0;
  id v19 = v17;
  uint64_t v20 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setText_, v20);

  if (a6)
  {
    id v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ScheduleOccurrenceHeaderView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    id v22 = sub_1AD993D30();
    uint64_t v23 = (void *)sub_1AD9DF6D0();
    objc_msgSend(v22, sel_setText_, v23);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v21 = 0;
  }
  *(void *)&v14[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_subtitle] = v21;

  v72.receiver = v14;
  v72.super_class = (Class)type metadata accessor for ScheduleOccurrenceTitleView();
  long long v24 = (char *)objc_msgSendSuper2(&v72, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v25 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title;
  uint64_t v26 = *(void **)&v24[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title];
  uint64_t v27 = v24;
  objc_msgSend(v27, sel_addSubview_, v26);
  id v28 = objc_msgSend(v26, sel_topAnchor);
  id v29 = objc_msgSend(v27, sel_topAnchor);
  id v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

  uint64_t v31 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint;
  uint64_t v32 = *(void **)&v27[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint];
  *(void *)&v27[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint] = v30;

  sub_1AD870B1C();
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1AD9E6BB0;
  uint64_t v34 = *(void **)&v27[v31];
  if (v34)
  {
    int v35 = (void *)result;
    int v36 = self;
    v35[4] = v34;
    uint64_t v37 = *(void **)&v24[v25];
    id v38 = v34;
    id v39 = objc_msgSend(v37, sel_leadingAnchor);
    id v40 = objc_msgSend(v27, sel_leadingAnchor);
    id v41 = objc_msgSend(v39, (SEL)&selRef_copySafeAreaHeight + 6, v40);

    v35[5] = v41;
    id v42 = objc_msgSend(v27, sel_trailingAnchor);
    id v43 = objc_msgSend(*(id *)&v24[v25], sel_trailingAnchor);
    id v44 = objc_msgSend(v42, (SEL)&selRef_copySafeAreaHeight + 6, v43);

    v35[6] = v44;
    sub_1AD9DF870();
    sub_1AD837214(0, (unint64_t *)&qword_1E9A4A090);
    uint64_t v45 = (void *)sub_1AD9DF850();
    swift_bridgeObjectRelease();
    id v71 = v36;
    objc_msgSend(v36, sel_activateConstraints_, v45);

    uint64_t v46 = qword_1E9A49130;
    id v47 = *(id *)&v24[v25];
    if (v46 != -1) {
      swift_once();
    }
    id v48 = *(void **)&v27[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_subtitle];
    long long v49 = &_OBJC_LABEL_PROTOCOL___HKSPSuggestionProvider;
    if (v48)
    {
      id v50 = v48;
      objc_msgSend(v27, sel_addSubview_, v50);
      long long v51 = *(void **)&v24[v25];
      LODWORD(v52) = 1148829696;
      objc_msgSend(v51, sel_setContentHuggingPriority_forAxis_, 1, v52);
      LODWORD(v53) = 1148846080;
      objc_msgSend(v51, sel_setContentCompressionResistancePriority_forAxis_, 1, v53);
      LODWORD(v54) = 1144750080;
      objc_msgSend(v50, sel_setContentHuggingPriority_forAxis_, 1, v54);
      LODWORD(v55) = 1148846080;
      objc_msgSend(v50, sel_setContentCompressionResistancePriority_forAxis_, 1, v55);
      objc_msgSend(v50, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = xmmword_1AD9E6BB0;
      id v57 = objc_msgSend(v50, sel_topAnchor);
      id v58 = objc_msgSend(v51, sel_bottomAnchor);
      if (qword_1E9A49128 != -1) {
        swift_once();
      }
      id v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v58, *(double *)&qword_1E9A4DCD0);

      *(void *)(v56 + 32) = v59;
      id v60 = objc_msgSend(v50, sel_leadingAnchor);
      id v61 = objc_msgSend(v27, sel_leadingAnchor);
      id v62 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v61);

      *(void *)(v56 + 40) = v62;
      id v63 = objc_msgSend(v27, sel_trailingAnchor);
      id v64 = objc_msgSend(v50, sel_trailingAnchor);
      id v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_, v64);

      *(void *)(v56 + 48) = v65;
      sub_1AD9DF870();
      long long v66 = (void *)sub_1AD9DF850();
      swift_bridgeObjectRelease();
      objc_msgSend(v71, sel_activateConstraints_, v66);

      double v67 = 0.0;
      long long v49 = &_OBJC_LABEL_PROTOCOL___HKSPSuggestionProvider;
    }
    else
    {
      double v67 = *(double *)&qword_1E9A4DCD8;
      id v50 = v47;
    }
    id v68 = [v27 (SEL)v49[464]];
    id v69 = [v50 (SEL)v49[464]];
    id v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_constant_, v69, v67);

    objc_msgSend(v70, sel_setActive_, 1);
    sub_1AD9CC9F0(a1, a2);

    return (uint64_t)v27;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1AD9CC9F0(double a1, double a2)
{
  uint64_t v5 = sub_1AD9E02A0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v2[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint];
  if (v10)
  {
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E4FBBEB0], v5);
    id v11 = v10;
    id v12 = objc_msgSend(v2, sel_traitCollection);
    objc_msgSend(v12, sel_displayScale);
    double v14 = CGFloat.rounded(_:toScale:)((uint64_t)v9, v13, a2 * 0.09);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    objc_msgSend(v11, sel_setConstant_, fmax(v14 + -58.0, 8.0));

    id v15 = *(void **)&v2[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title];
    sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
    id v16 = (uint64_t *)MEMORY[0x1E4FB2928];
    if (a1 <= 320.0) {
      id v16 = (uint64_t *)MEMORY[0x1E4FB2988];
    }
    id v17 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(*v16, (a1 <= 320.0) << 15, 0, 0, 0, 0, 0, *MEMORY[0x1E4FB09B8], 0);
    objc_msgSend(v15, sel_setFont_, v17);
  }
  else
  {
    __break(1u);
  }
}

id ScheduleOccurrenceTitleView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void ScheduleOccurrenceTitleView.init(frame:)()
{
}

id ScheduleOccurrenceTitleView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceTitleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1AD9CCE00()
{
  qword_1E9A4DCD0 = 0x402E000000000000;
}

void sub_1AD9CCE10()
{
  qword_1E9A4DCD8 = 0x4042000000000000;
}

uint64_t type metadata accessor for ScheduleOccurrenceTitleView()
{
  return self;
}

uint64_t method lookup function for ScheduleOccurrenceTitleView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ScheduleOccurrenceTitleView);
}

uint64_t dispatch thunk of ScheduleOccurrenceTitleView.__allocating_init(titleText:subtitleText:screenSize:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_1AD9CCE70()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title;
  uint64_t v3 = (void *)*MEMORY[0x1E4FB2928];
  id v4 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v5 = v3;
  id v6 = objc_msgSend(v4, sel_init);
  sub_1AD837214(0, (unint64_t *)&qword_1E9A4A8C0);
  id v7 = v6;
  id v8 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)((uint64_t)v5, 0, 0, 0, 0, 0, 0, 0, 1);
  objc_msgSend(v7, sel_setFont_, v8);

  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v7, sel_setLineBreakMode_, 0);
  objc_msgSend(v7, sel_setNumberOfLines_, 0);
  objc_msgSend(v7, sel_setTextAlignment_, 1);
  *(void *)&v1[v2] = v7;
  *(void *)&v1[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint] = 0;

  sub_1AD9E0140();
  __break(1u);
}

uint64_t String.init<A>(describingOptional:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  v9[2] = a2;
  v9[3] = sub_1AD9CD1E8;
  v9[4] = v4;
  uint64_t v5 = sub_1AD9DFE90();
  sub_1AD9CD230((void (*)(char *, char *))sub_1AD9CD1F0, (uint64_t)v9, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBB1A0], v6, (uint64_t)v10);
  swift_release();
  if (v10[1]) {
    uint64_t v7 = v10[0];
  }
  else {
    uint64_t v7 = 7104878;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return v7;
}

uint64_t sub_1AD9CD120(uint64_t a1)
{
  double v1 = MEMORY[0x1F4188790](a1, a1);
  (*(void (**)(char *, double))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  return sub_1AD9DF730();
}

uint64_t sub_1AD9CD1D8()
{
  return swift_deallocObject();
}

uint64_t sub_1AD9CD1E8(uint64_t a1)
{
  return sub_1AD9CD120(a1);
}

uint64_t sub_1AD9CD1F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 24))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1AD9CD230@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v32 = a1;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v29 = a5;
  uint64_t v30 = v10;
  uint64_t v11 = MEMORY[0x1F4188790](a1, a2);
  double v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v11, v17);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v21);
  uint64_t v23 = (char *)&v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v24 + 16))(v23, v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v23, 1, v15) == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(a6, 1, 1, a4);
  }
  uint64_t v27 = v30;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v23, v15);
  v32(v20, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v13, a3);
  }
  return result;
}

void sub_1AD9CD4DC()
{
  id v1 = objc_allocWithZone(MEMORY[0x1E4FB1618]);
  v6[4] = sub_1AD8F05CC;
  v6[5] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1AD8F0900;
  v6[3] = &block_descriptor_42;
  uint64_t v2 = _Block_copy(v6);
  id v3 = objc_msgSend(v1, sel_initWithDynamicProvider_, v2);
  _Block_release(v2);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v3);

  id v4 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v4, sel_setPreservesSuperviewLayoutMargins_, 0);

  id v5 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v5, sel_setLayoutMargins_, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

id sub_1AD9CD698()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceDayPickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceDayPickerTableViewCell()
{
  return self;
}

id sub_1AD9CD700(uint64_t a1)
{
  return sub_1AD9ADE9C(*(void *)(a1 + 56), (uint64_t)objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceEditModel_mutableOccurrence), sel_weekdays));
}

char *sub_1AD9CD77C(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v5 = OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F28C10]);
  uint64_t v7 = v3;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setFormattingContext_, 2);
  id v9 = objc_allocWithZone((Class)type metadata accessor for SleepScheduleDayPicker());
  *(void *)&v3[v5] = sub_1AD9AD094(v8, 0, 0);

  if (a2)
  {
    uint64_t v10 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for ScheduleOccurrenceDayPickerTableViewCell();
  id v11 = objc_msgSendSuper2(&v17, sel_initWithStyle_reuseIdentifier_, 0, v10);

  uint64_t v12 = (char *)v11;
  id v13 = objc_msgSend(v12, sel_contentView);
  objc_msgSend(v13, sel_addSubview_, *(void *)&v12[OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker]);

  sub_1AD9CD4DC();
  id v14 = objc_msgSend(v12, sel_contentView);
  id v15 = objc_msgSend(v14, sel_layoutMarginsGuide);

  UIView.alignConstraints(to:)((UILayoutGuide)v15);
  return v12;
}

void sub_1AD9CD90C()
{
  id v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v3, sel_setFormattingContext_, 2);
  id v4 = objc_allocWithZone((Class)type metadata accessor for SleepScheduleDayPicker());
  *(void *)&v1[v2] = sub_1AD9AD094(v3, 0, 0);

  sub_1AD9E0140();
  __break(1u);
}

uint64_t block_copy_helper_42(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_42()
{
  return swift_release();
}

uint64_t dispatch thunk of SleepTimeDurationPickerDelegate.didUpdate(topic:duration:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))(a1 & 1);
}

uint64_t sub_1AD9CDA04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1AD9D3F9C();
  uint64_t v5 = v4 - 8;
  MEMORY[0x1F4188790](v4, v6);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1AD9DD700();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, void, uint64_t))(v10 + 16))(v8, *a1, v9);
  uint64_t v11 = sub_1AD9DD960();
  uint64_t v20 = &v8[*(int *)(v5 + 56)];
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(void))(v12 + 16))();
  sub_1AD9D3278();
  uint64_t v14 = v13;
  sub_1AD9D488C(255, &qword_1E9A4DE50, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], MEMORY[0x1E4F19370]);
  sub_1AD9D3328();
  id v15 = &v8[*(int *)(v5 + 72)];
  uint64_t v16 = a1[2];
  uint64_t v17 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, v16, v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v8, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2 + *(int *)(v5 + 56), v20, v11);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(a2 + *(int *)(v5 + 72), v15, v14);
}

uint64_t OneDayDiagram.init(model:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SleepDayModel(0);
  sub_1AD9D5254(&qword_1EB725860, (void (*)(uint64_t))type metadata accessor for SleepDayModel);
  uint64_t result = sub_1AD9DDF30();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t OneDayDiagram.body.getter@<X0>(uint64_t a1@<X8>)
{
  v17[1] = a1;
  uint64_t v2 = sub_1AD9DE610();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(v1 + 8) + 32) + 16);
  if (qword_1E9A48F50 != -1) {
    swift_once();
  }
  id v8 = (void *)qword_1E9A4C618;
  uint64_t KeyPath = swift_getKeyPath();
  id v10 = v8;
  uint64_t v11 = sub_1AD9DCA70();
  uint64_t v13 = v12;

  swift_bridgeObjectRelease();
  type metadata accessor for SleepDayModel(0);
  sub_1AD9D5254(&qword_1EB725860, (void (*)(uint64_t))type metadata accessor for SleepDayModel);
  swift_retain();
  uint64_t v14 = sub_1AD9DDF30();
  BOOL v18 = v7 != 0;
  uint64_t v19 = KeyPath;
  char v20 = 0;
  uint64_t v21 = v11;
  uint64_t v22 = v13;
  uint64_t v23 = v14;
  uint64_t v24 = v15;
  char v25 = 1;
  sub_1AD9DE600();
  sub_1AD9CDFF8();
  sub_1AD9D5254(&qword_1E9A4DD68, (void (*)(uint64_t))sub_1AD9CDFF8);
  sub_1AD9DED00();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_1AD862078(v19, v20);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t OneDayChart.init(model:showDurationText:)@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  type metadata accessor for SleepDayModel(0);
  sub_1AD9D5254(&qword_1EB725860, (void (*)(uint64_t))type metadata accessor for SleepDayModel);
  uint64_t result = sub_1AD9DDF30();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = a1;
  return result;
}

void sub_1AD9CDFF8()
{
  if (!qword_1E9A4DD48)
  {
    sub_1AD9D3808(255, &qword_1E9A4DD50, (uint64_t (*)(void))sub_1AD9CE0B0, (uint64_t)&type metadata for OneDayChart, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for DiagramHeader);
    sub_1AD9CE104();
    unint64_t v0 = type metadata accessor for OptionalContentGroup();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DD48);
    }
  }
}

unint64_t sub_1AD9CE0B0()
{
  unint64_t result = qword_1E9A4DD58;
  if (!qword_1E9A4DD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DD58);
  }
  return result;
}

unint64_t sub_1AD9CE104()
{
  unint64_t result = qword_1E9A4DD60;
  if (!qword_1E9A4DD60)
  {
    sub_1AD9D3808(255, &qword_1E9A4DD50, (uint64_t (*)(void))sub_1AD9CE0B0, (uint64_t)&type metadata for OneDayChart, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for DiagramHeader);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DD60);
  }
  return result;
}

void *OneDayChart.body.getter@<X0>(uint64_t a1@<X8>)
{
  char v3 = *(unsigned char *)(v1 + 16);
  uint64_t v4 = sub_1AD9DE340();
  sub_1AD9CE284(v3, (uint64_t)v6);
  *(_OWORD *)&__src[199] = v6[12];
  *(_OWORD *)&__src[215] = v6[13];
  *(_OWORD *)&__src[231] = v6[14];
  *(_OWORD *)&__src[247] = v6[15];
  *(_OWORD *)&__src[135] = v6[8];
  *(_OWORD *)&__src[151] = v6[9];
  *(_OWORD *)&__src[167] = v6[10];
  *(_OWORD *)&__src[183] = v6[11];
  *(_OWORD *)&__src[71] = v6[4];
  *(_OWORD *)&__src[87] = v6[5];
  *(_OWORD *)&__src[103] = v6[6];
  *(_OWORD *)&__src[119] = v6[7];
  *(_OWORD *)&__src[7] = v6[0];
  *(_OWORD *)&__src[23] = v6[1];
  *(_OWORD *)&__src[39] = v6[2];
  *(_OWORD *)&__src[55] = v6[3];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t sub_1AD9CE284@<X0>(char a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_1AD9DCA50();
  MEMORY[0x1F4188790](v3 - 8, v4);
  swift_retain();
  sub_1AD945760();
  swift_release();
  uint64_t v5 = sub_1AD9DEAE0();
  uint64_t v7 = v6;
  char v9 = v8;
  if (qword_1E9A490B8 != -1) {
    swift_once();
  }
  char v10 = v9 & 1;
  uint64_t v11 = sub_1AD9DEAB0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16 & 1;
  sub_1AD861548(v5, v7, v10);
  swift_bridgeObjectRelease();
  unsigned __int8 v18 = sub_1AD9DE7A0();
  sub_1AD9DDCC0();
  if (a1)
  {
    *(void *)&long long v66 = v11;
    *((void *)&v66 + sub_1AD95AB40(3, 1) = v13;
    *(void *)&long long v67 = v17;
    *((void *)&v67 + sub_1AD95AB40(3, 1) = v15;
    *(void *)&long long v68 = 256;
    *((void *)&v68 + sub_1AD95AB40(3, 1) = v18;
    *(void *)&long long v69 = v19;
    *((void *)&v69 + sub_1AD95AB40(3, 1) = v20;
    *(void *)&long long v70 = v21;
    *((void *)&v70 + sub_1AD95AB40(3, 1) = v22;
    __int16 v71 = 256;
    sub_1AD9D01FC(0, &qword_1E9A4DD98, (uint64_t (*)(uint64_t))sub_1AD9D0260, MEMORY[0x1E4F3EBC8]);
    sub_1AD9D4B18();
    sub_1AD9DE470();
  }
  else
  {
    sub_1AD9D01FC(0, &qword_1E9A4DD98, (uint64_t (*)(uint64_t))sub_1AD9D0260, MEMORY[0x1E4F3EBC8]);
    sub_1AD9D4B18();
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    __int16 v71 = 0;
    sub_1AD9DE470();
    sub_1AD861548(v11, v13, v17);
    swift_bridgeObjectRelease();
  }
  uint64_t v56 = v72;
  uint64_t v55 = v73;
  uint64_t v54 = v74;
  uint64_t v53 = v75;
  uint64_t v52 = v76;
  uint64_t v51 = v77;
  uint64_t v50 = v78;
  uint64_t v49 = v79;
  uint64_t v48 = v80;
  uint64_t v47 = v81;
  char v46 = v82;
  char v45 = v83;
  type metadata accessor for SleepDayModel(0);
  sub_1AD9D5254(&qword_1EB725860, (void (*)(uint64_t))type metadata accessor for SleepDayModel);
  swift_retain();
  uint64_t v23 = sub_1AD9DDF30();
  uint64_t v25 = v24;
  char v26 = sub_1AD9DE7A0();
  sub_1AD9DDCC0();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v35 = sub_1AD9DE2B0();
  sub_1AD9CE978((uint64_t)&v66);
  long long v36 = v66;
  char v37 = v67;
  char v60 = BYTE8(v68);
  *(_DWORD *)(a2 + 82) = v64;
  *(_WORD *)(a2 + 86) = v65;
  *(_DWORD *)(a2 + 105) = v66;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)((char *)&v66 + 3);
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v63[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v63;
  *(_DWORD *)(a2 + 172) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a2 + 169) = *(_DWORD *)v62;
  *(_DWORD *)(a2 + 196) = *(_DWORD *)&v61[3];
  *(_DWORD *)(a2 + 193) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 220) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a2 + 217) = *(_DWORD *)v59;
  *(_DWORD *)(a2 + 244) = *(_DWORD *)&v57[3];
  *(_DWORD *)(a2 + 24sub_1AD95AB40(3, 1) = *(_DWORD *)v57;
  uint64_t v38 = *((void *)&v67 + 1);
  uint64_t v39 = v68;
  *(void *)(a2 + 88) = v23;
  *(unsigned char *)(a2 + 104) = v26;
  long long v40 = v69;
  *(void *)(a2 + 152) = v35;
  *(unsigned char *)(a2 + 168) = 1;
  *(unsigned char *)(a2 + 192) = v37;
  char v41 = v70;
  char v58 = v70;
  *(void *)(a2 + 200) = v38;
  *(void *)(a2 + 208) = v39;
  *(unsigned char *)(a2 + 216) = v60;
  *(unsigned char *)(a2 + 240) = v58;
  uint64_t v42 = *((void *)&v70 + 1);
  *(void *)a2 = v56;
  *(void *)(a2 + 8) = v55;
  *(void *)(a2 + 16) = v54;
  *(void *)(a2 + 24) = v53;
  *(void *)(a2 + 32) = v52;
  *(void *)(a2 + 40) = v51;
  *(void *)(a2 + 48) = v50;
  *(void *)(a2 + 56) = v49;
  *(void *)(a2 + 64) = v48;
  *(void *)(a2 + 72) = v47;
  *(unsigned char *)(a2 + 80) = v46;
  *(unsigned char *)(a2 + 8sub_1AD95AB40(3, 1) = v45;
  *(void *)(a2 + 96) = v25;
  *(void *)(a2 + 112) = v28;
  *(void *)(a2 + 120) = v30;
  *(void *)(a2 + 128) = v32;
  *(void *)(a2 + 136) = v34;
  *(unsigned char *)(a2 + 144) = 0;
  *(void *)(a2 + 160) = 0;
  *(_OWORD *)(a2 + 176) = v36;
  *(_OWORD *)(a2 + 224) = v40;
  *(void *)(a2 + 248) = v42;
  sub_1AD9D4C30(v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45);
  swift_retain();
  sub_1AD861558(v36, *((uint64_t *)&v36 + 1), v37);
  swift_bridgeObjectRetain();
  sub_1AD861558(v40, *((uint64_t *)&v40 + 1), v41);
  swift_bridgeObjectRetain();
  sub_1AD861548(v36, *((uint64_t *)&v36 + 1), v37);
  swift_bridgeObjectRelease();
  sub_1AD861548(v40, *((uint64_t *)&v40 + 1), v41);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1AD9D4C80(v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45);
}

uint64_t sub_1AD9CE978@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1AD9DCA50();
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1AD944C04();
  id v6 = sub_1AD9448EC();
  sub_1AD9DF7C0();
  swift_release();
  swift_bridgeObjectRelease();

  v47[1] = v5;
  uint64_t v7 = sub_1AD9DEAE0();
  uint64_t v9 = v8;
  char v11 = v10;
  if (qword_1E9A48EE8 != -1) {
    swift_once();
  }
  char v12 = v11 & 1;
  uint64_t v13 = sub_1AD9DEA70();
  uint64_t v15 = v14;
  char v17 = v16;
  sub_1AD861548(v7, v9, v12);
  swift_bridgeObjectRelease();
  if (qword_1E9A490C0 != -1) {
    swift_once();
  }
  char v18 = v17 & 1;
  uint64_t v19 = sub_1AD9DEAB0();
  uint64_t v48 = v20;
  uint64_t v49 = v19;
  char v22 = v21;
  uint64_t v50 = v23;
  sub_1AD861548(v13, v15, v18);
  swift_bridgeObjectRelease();
  swift_retain();
  sub_1AD944C34();
  id v24 = sub_1AD9448EC();
  sub_1AD9DF7C0();
  swift_release();
  swift_bridgeObjectRelease();

  uint64_t v25 = sub_1AD9DEAE0();
  uint64_t v27 = v26;
  char v29 = v28;
  if (qword_1EB7255E0 != -1) {
    swift_once();
  }
  char v30 = v29 & 1;
  char v31 = v22 & 1;
  uint64_t v32 = sub_1AD9DEA70();
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  sub_1AD861548(v25, v27, v30);
  swift_bridgeObjectRelease();
  uint64_t v37 = sub_1AD9DEAB0();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  char v43 = v42 & 1;
  sub_1AD861548(v32, v34, v36);
  swift_bridgeObjectRelease();
  char v51 = v31;
  uint64_t v45 = v48;
  uint64_t v44 = v49;
  *(void *)a1 = v49;
  *(void *)(a1 + 8) = v45;
  *(unsigned char *)(a1 + 16) = v31;
  *(void *)(a1 + 24) = v50;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v37;
  *(void *)(a1 + 56) = v39;
  *(unsigned char *)(a1 + 64) = v43;
  *(void *)(a1 + 72) = v41;
  sub_1AD861558(v44, v45, v31);
  swift_bridgeObjectRetain();
  sub_1AD861558(v37, v39, v43);
  swift_bridgeObjectRetain();
  sub_1AD861548(v37, v39, v43);
  swift_bridgeObjectRelease();
  sub_1AD861548(v44, v45, v51);
  return swift_bridgeObjectRelease();
}

void *sub_1AD9CECF8@<X0>(uint64_t a1@<X8>)
{
  char v3 = *(unsigned char *)(v1 + 16);
  uint64_t v4 = sub_1AD9DE340();
  sub_1AD9CE284(v3, (uint64_t)v6);
  *(_OWORD *)&__src[199] = v6[12];
  *(_OWORD *)&__src[215] = v6[13];
  *(_OWORD *)&__src[231] = v6[14];
  *(_OWORD *)&__src[247] = v6[15];
  *(_OWORD *)&__src[135] = v6[8];
  *(_OWORD *)&__src[151] = v6[9];
  *(_OWORD *)&__src[167] = v6[10];
  *(_OWORD *)&__src[183] = v6[11];
  *(_OWORD *)&__src[71] = v6[4];
  *(_OWORD *)&__src[87] = v6[5];
  *(_OWORD *)&__src[103] = v6[6];
  *(_OWORD *)&__src[119] = v6[7];
  *(_OWORD *)&__src[7] = v6[0];
  *(_OWORD *)&__src[23] = v6[1];
  *(_OWORD *)&__src[39] = v6[2];
  *(_OWORD *)&__src[55] = v6[3];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t sub_1AD9CEDE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1AD9D41C8(0, &qword_1EB725BB8, MEMORY[0x1E4F3EB98], MEMORY[0x1E4FBBE00]);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1AD9E3080;
  if (qword_1E9A48EE8 != -1) {
    swift_once();
  }
  *(void *)(v6 + 32) = qword_1E9A4AE38;
  uint64_t v7 = qword_1EB7255E0;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  *(void *)(v6 + 40) = qword_1EB725608;
  sub_1AD9DF870();
  swift_retain();
  MEMORY[0x1B3E6B280](v6);
  sub_1AD9DF3B0();
  sub_1AD9DF3C0();
  sub_1AD9DDF00();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  *(void *)a3 = v6;
  *(_OWORD *)(a3 + 8) = v10;
  *(void *)(a3 + 24) = v11;
  *(void *)(a3 + 32) = v12;
  *(_WORD *)(a3 + 40) = 256;
  *(void *)(a3 + 48) = sub_1AD9D4214;
  *(void *)(a3 + 56) = v8;
  *(_WORD *)(a3 + 64) = 256;
  return swift_retain();
}

uint64_t sub_1AD9CEFAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1AD9DDDF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790](v6, v9);
  *(void *)a3 = sub_1AD9DE2B0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  sub_1AD9D421C();
  v13[1] = *(void *)(a2 + 32);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_1AD9D01FC(0, &qword_1E9A4DDF0, type metadata accessor for SleepDayModel.SegmentModel, MEMORY[0x1E4FBB320]);
  sub_1AD9DCCB0();
  sub_1AD9D43A4();
  sub_1AD9D2D10();
  sub_1AD9D4554(&qword_1E9A4DED8, (void (*)(uint64_t))sub_1AD9D43A4, (void (*)(void))sub_1AD9D45E0, (void (*)(void))sub_1AD87DFB4);
  sub_1AD9D5254(&qword_1E9A4DEB0, (void (*)(uint64_t))type metadata accessor for SleepDayModel.SegmentModel);
  swift_bridgeObjectRetain();
  return sub_1AD9DF260();
}

uint64_t sub_1AD9CF220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v54 = a1;
  uint64_t v52 = sub_1AD9DE020() - 8;
  MEMORY[0x1F4188790](v52, v2);
  uint64_t v49 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1AD9DF210();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD987298(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v51 = sub_1AD987298;
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E4F3CC10];
  sub_1AD9D47C8(0, &qword_1E9A4DED0, (uint64_t (*)(uint64_t))sub_1AD987298, MEMORY[0x1E4F3CAB0], MEMORY[0x1E4F3CC10]);
  uint64_t v14 = v13 - 8;
  MEMORY[0x1F4188790](v13, v15);
  char v17 = (char *)&v46 - v16;
  unsigned int v47 = *MEMORY[0x1E4F3D4A0];
  uint64_t v18 = v47;
  uint64_t v19 = sub_1AD9DE2D0();
  uint64_t v20 = *(void *)(v19 - 8);
  char v46 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 104);
  uint64_t v48 = v20 + 104;
  v46(v7, v18, v19);
  sub_1AD9DDDE0();
  type metadata accessor for SleepDayModel.SegmentModel(0);
  sub_1AD9DF320();
  sub_1AD9DDDC0();
  sub_1AD9D4690((uint64_t)v7, (uint64_t)v12, MEMORY[0x1E4F3EE58]);
  char v21 = &v12[*(int *)(v9 + 44)];
  long long v22 = v56;
  *(_OWORD *)char v21 = v55;
  *((_OWORD *)v21 + sub_1AD95AB40(3, 1) = v22;
  *((_OWORD *)v21 + 2) = v57;
  sub_1AD9D3E50((uint64_t)v7, MEMORY[0x1E4F3EE58]);
  LOBYTE(v7) = sub_1AD9DE7B0();
  sub_1AD9DDDE0();
  sub_1AD9DDCC0();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_1AD9D4690((uint64_t)v12, (uint64_t)v17, (uint64_t (*)(void))sub_1AD987298);
  char v31 = &v17[*(int *)(v14 + 44)];
  *char v31 = (char)v7;
  *((void *)v31 + sub_1AD95AB40(3, 1) = v24;
  *((void *)v31 + 2) = v26;
  *((void *)v31 + 3) = v28;
  *((void *)v31 + 4) = v30;
  v31[40] = 0;
  sub_1AD9D3E50((uint64_t)v12, (uint64_t (*)(void))sub_1AD987298);
  uint64_t v32 = v49;
  v46(&v49[*(int *)(v52 + 28)], v47, v19);
  __asm { FMOV            V0.2D, #1.5 }
  *uint64_t v32 = _Q0;
  sub_1AD9D43A4();
  uint64_t v39 = v53;
  uint64_t v40 = v53 + *(int *)(v38 + 36);
  sub_1AD9D4690((uint64_t)v32, v40, MEMORY[0x1E4F3CDB8]);
  sub_1AD87DCCC();
  *(_WORD *)(v40 + *(int *)(v41 + 36)) = 256;
  char v43 = v50;
  char v42 = (uint64_t (*)(uint64_t))v51;
  uint64_t v44 = MEMORY[0x1E4F3CAB0];
  sub_1AD9D46F8((uint64_t)v17, v39, &qword_1E9A4DED0, (uint64_t (*)(uint64_t))v51, MEMORY[0x1E4F3CAB0], v50);
  sub_1AD9D3E50((uint64_t)v32, MEMORY[0x1E4F3CDB8]);
  return sub_1AD9D476C((uint64_t)v17, &qword_1E9A4DED0, v42, v44, v43);
}

uint64_t sub_1AD9CF640@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9CEDE4(*v1, v1[1], a1);
}

uint64_t OneDayBarGraph.init(model:isLoading:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (!a1)
  {
    type metadata accessor for SleepDayModel(0);
    swift_allocObject();
    SleepDayModel.init(segmentModels:sleepMetrics:)(MEMORY[0x1E4FBC860], 0);
  }
  type metadata accessor for SleepDayModel(0);
  sub_1AD9D5254(&qword_1EB725860, (void (*)(uint64_t))type metadata accessor for SleepDayModel);
  uint64_t result = sub_1AD9DDF30();
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v6;
  *(unsigned char *)(a3 + 16) = a2 & 1;
  return result;
}

uint64_t OneDayBarGraph.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  char v5 = *((unsigned char *)v1 + 16);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v3;
  *(unsigned char *)(v6 + 32) = v5;
  uint64_t v14 = v3;
  swift_retain();
  uint64_t v7 = sub_1AD9CF9C8();
  if (qword_1E9A48F70 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1E9A4C9C8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  sub_1AD9DF040();
  if (qword_1E9A48F88 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1E9A4C9E0;
  uint64_t v11 = qword_1E9A48F90;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1E9A4C9E8;
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = sub_1AD9CF9BC;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = sub_1AD9692D8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v14;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v12;
  return swift_retain();
}

double sub_1AD9CF8B4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v3 = swift_bridgeObjectRetain();
    sub_1AD9D491C(v3, 0, 1, (uint64_t)&v9);
  }
  sub_1AD9D04F0();
  sub_1AD8583D0();
  sub_1AD9DE470();
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(void *)(a2 + 32) = v7;
  *(unsigned char *)(a2 + 40) = v8;
  return result;
}

uint64_t sub_1AD9CF984()
{
  swift_release();
  return swift_deallocObject();
}

double sub_1AD9CF9BC@<D0>(uint64_t a1@<X8>)
{
  return sub_1AD9CF8B4(*(void *)(v1 + 24), a1);
}

uint64_t sub_1AD9CF9C8()
{
  sub_1AD9D47C8(0, &qword_1E9A4DEE8, MEMORY[0x1E4F273A8], (uint64_t)&off_1F0470620, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v1, v3);
  long long v5 = (char *)&v22 - v4;
  if (*(void *)(*(void *)(*(void *)(v0 + 8) + 32) + 16))
  {
    swift_retain();
    uint64_t v6 = sub_1AD945184();
    uint64_t v8 = v7;
    swift_release();
  }
  else
  {
    if (qword_1EB724E38 != -1) {
      swift_once();
    }
    id v9 = (id)qword_1EB727930;
    uint64_t v6 = sub_1AD9DCA70();
    uint64_t v8 = v10;

    swift_bridgeObjectRelease();
  }
  swift_retain();
  sub_1AD945760();
  swift_release();
  uint64_t v11 = &v5[*(int *)(v2 + 36)];
  *(void *)uint64_t v11 = 0xD00000000000002FLL;
  *((void *)v11 + sub_1AD95AB40(3, 1) = 0x80000001AD9F8090;
  swift_retain();
  id v23 = sub_1AD944F60();
  uint64_t v13 = v12;
  swift_release();
  sub_1AD9D01FC(0, &qword_1E9A4CFE8, (uint64_t (*)(uint64_t))sub_1AD9D4834, MEMORY[0x1E4FBBE00]);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1AD9E53A0;
  sub_1AD9D488C(0, (unint64_t *)&qword_1E9A4CFF8, MEMORY[0x1E4FBB1A0], (uint64_t)&off_1F0470630, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  uint64_t v16 = v15;
  *(void *)(v14 + 56) = v15;
  *(void *)(v14 + 64) = &off_1F0470828;
  char v17 = (void *)swift_allocObject();
  *(void *)(v14 + 32) = v17;
  void v17[2] = v6;
  v17[3] = v8;
  v17[4] = 0xD000000000000030;
  v17[5] = 0x80000001AD9F8050;
  *(void *)(v14 + 96) = v2;
  *(void *)(v14 + 104) = &off_1F0470828;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v14 + 72));
  uint64_t v19 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F273A8];
  sub_1AD9D46F8((uint64_t)v5, (uint64_t)boxed_opaque_existential_1, &qword_1E9A4DEE8, MEMORY[0x1E4F273A8], (uint64_t)&off_1F0470620, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  *(void *)(v14 + 136) = v16;
  *(void *)(v14 + 144) = &off_1F0470828;
  uint64_t v20 = (void *)swift_allocObject();
  *(void *)(v14 + 112) = v20;
  void v20[2] = v23;
  v20[3] = v13;
  v20[4] = 0xD000000000000030;
  v20[5] = 0x80000001AD9F80C0;
  sub_1AD9D476C((uint64_t)v5, &qword_1E9A4DEE8, v19, (uint64_t)&off_1F0470620, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  return v14;
}

uint64_t sub_1AD9CFD58()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD9CFD90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9CFDAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9CFDC8()
{
  return swift_getOpaqueTypeConformance2();
}

void *assignWithTake for OneDayDiagram(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for OneDayDiagram()
{
  return &type metadata for OneDayDiagram;
}

ValueMetadata *type metadata accessor for OneDayChart()
{
  return &type metadata for OneDayChart;
}

uint64_t _s13SleepHealthUI11OneDayChartVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t _s13SleepHealthUI11OneDayChartVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t _s13SleepHealthUI11OneDayChartVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for OneDayBarGraph()
{
  return &type metadata for OneDayBarGraph;
}

uint64_t sub_1AD9CFF34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9CFFBC()
{
  return sub_1AD9D5254(&qword_1E9A4DD70, (void (*)(uint64_t))sub_1AD9D0004);
}

void sub_1AD9D0004()
{
  if (!qword_1E9A4DD78)
  {
    sub_1AD9D01FC(255, &qword_1E9A4DD80, (uint64_t (*)(uint64_t))sub_1AD9D00B8, MEMORY[0x1E4F3F108]);
    sub_1AD9D02EC(&qword_1E9A4DDA8, &qword_1E9A4DD80, (uint64_t (*)(uint64_t))sub_1AD9D00B8);
    unint64_t v0 = sub_1AD9DF180();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DD78);
    }
  }
}

void sub_1AD9D00B8()
{
  if (!qword_1E9A4DD88)
  {
    sub_1AD9D016C();
    sub_1AD9D488C(255, &qword_1E9A4DDA0, (uint64_t)&type metadata for OneDayDurationGraph, MEMORY[0x1E4F3CAB0], MEMORY[0x1E4F3CC10]);
    sub_1AD8E81E8();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1E9A4DD88);
    }
  }
}

void sub_1AD9D016C()
{
  if (!qword_1E9A4DD90)
  {
    sub_1AD9D01FC(255, &qword_1E9A4DD98, (uint64_t (*)(uint64_t))sub_1AD9D0260, MEMORY[0x1E4F3EBC8]);
    unint64_t v0 = sub_1AD9DE480();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DD90);
    }
  }
}

void sub_1AD9D01FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_1AD9D0260()
{
  if (!qword_1E9A4A530)
  {
    sub_1AD9D488C(255, (unint64_t *)&qword_1E9A49A78, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3CE30], MEMORY[0x1E4F3CC10]);
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4A530);
    }
  }
}

uint64_t sub_1AD9D02EC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AD9D01FC(255, a2, a3, MEMORY[0x1E4F3F108]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AD9D0350()
{
  return sub_1AD9D5254(&qword_1E9A4DDB0, (void (*)(uint64_t))sub_1AD9D0398);
}

void sub_1AD9D0398()
{
  if (!qword_1E9A4DDB8)
  {
    sub_1AD9D488C(255, &qword_1E9A4DDC0, (uint64_t)&type metadata for OneDayBarChart, (uint64_t)&type metadata for SleepDataUnavailable, MEMORY[0x1E4F3D750]);
    sub_1AD9D044C();
    sub_1AD96BAD0();
    unint64_t v0 = type metadata accessor for InfographicGrid();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DDB8);
    }
  }
}

unint64_t sub_1AD9D044C()
{
  unint64_t result = qword_1E9A4DDC8;
  if (!qword_1E9A4DDC8)
  {
    sub_1AD9D488C(255, &qword_1E9A4DDC0, (uint64_t)&type metadata for OneDayBarChart, (uint64_t)&type metadata for SleepDataUnavailable, MEMORY[0x1E4F3D750]);
    sub_1AD9D04F0();
    sub_1AD8583D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DDC8);
  }
  return result;
}

unint64_t sub_1AD9D04F0()
{
  unint64_t result = qword_1E9A4DDD0;
  if (!qword_1E9A4DDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DDD0);
  }
  return result;
}

uint64_t destroy for OneDayBarChart(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for OneDayBarChart(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OneDayBarChart(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a2 + 8);
  long long v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for OneDayBarChart(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for OneDayBarChart()
{
  return &type metadata for OneDayBarChart;
}

void *_s13SleepHealthUI13OneDayDiagramVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for OneDayDurationGraph()
{
  return &type metadata for OneDayDurationGraph;
}

uint64_t sub_1AD9D072C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AD9D0748()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1AD9D0764(uint64_t a1)
{
  return sub_1AD9D07AC(a1, &qword_1E9A4DD00);
}

id sub_1AD9D0774(uint64_t a1)
{
  return sub_1AD9D07AC(a1, &qword_1E9A4DD08);
}

id sub_1AD9D0784(uint64_t a1)
{
  return sub_1AD9D07AC(a1, &qword_1E9A4DD10);
}

id sub_1AD9D079C(uint64_t a1)
{
  return sub_1AD9D07AC(a1, &qword_1E9A4DD18);
}

id sub_1AD9D07AC(uint64_t a1, void *a2)
{
  id result = objc_msgSend(self, sel_currentDevice);
  if (result)
  {
    id v4 = result;
    sub_1AD9D4024(MEMORY[0x1E4FBC860]);
    sub_1AD9DFE70();
    uint64_t v6 = v5;

    id result = (id)swift_bridgeObjectRelease();
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD9D0838@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v65[1] = a1;
  sub_1AD85FCFC();
  v65[0] = v3;
  MEMORY[0x1F4188790](v3, v4);
  uint64_t v81 = (char *)v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F194D8];
  sub_1AD9D01FC(0, &qword_1EB725A08, MEMORY[0x1E4F194D8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)v65 - v8;
  uint64_t v10 = sub_1AD9DD840();
  uint64_t v71 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v13 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D2B78();
  uint64_t v15 = v14;
  uint64_t v68 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14, v16);
  uint64_t v18 = (char *)v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D2E54();
  uint64_t v20 = v19;
  uint64_t v69 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19, v21);
  id v23 = (char *)v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D2F28();
  uint64_t v72 = v24;
  uint64_t v74 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24, v25);
  long long v66 = (char *)v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D302C();
  uint64_t v75 = v27;
  uint64_t v76 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27, v28);
  long long v67 = (char *)v65 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D3494();
  uint64_t v78 = v30;
  uint64_t v77 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30, v31);
  long long v70 = (char *)v65 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D3920();
  uint64_t v80 = v33;
  MEMORY[0x1F4188790](v33, v34);
  uint64_t v79 = (char *)v65 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v83 = v2;
  sub_1AD9D2C0C();
  sub_1AD9D5254(&qword_1E9A4DE10, (void (*)(uint64_t))sub_1AD9D2C0C);
  sub_1AD9DD8C0();
  sub_1AD9DD6E0();
  uint64_t v36 = sub_1AD9DD9D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v9, 1, 1, v36);
  uint64_t v37 = sub_1AD9D5254(&qword_1E9A4DE20, (void (*)(uint64_t))sub_1AD9D2B78);
  uint64_t v38 = MEMORY[0x1E4F193E0];
  sub_1AD9DEB70();
  sub_1AD9D40FC((uint64_t)v9, &qword_1EB725A08, v73);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v18, v15);
  uint64_t v84 = v15;
  uint64_t v85 = v10;
  uint64_t v86 = v37;
  uint64_t v87 = v38;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v40 = v66;
  sub_1AD9DEB30();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v23, v20);
  char v82 = v2;
  sub_1AD9D31B0(0);
  uint64_t v42 = v41;
  uint64_t v84 = v20;
  uint64_t v85 = OpaqueTypeConformance2;
  uint64_t v43 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = sub_1AD9D5254(&qword_1E9A4DE68, sub_1AD9D31B0);
  uint64_t v45 = v67;
  uint64_t v46 = v72;
  sub_1AD9DEB20();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v40, v46);
  unsigned int v47 = (void *)v2[1];
  uint64_t v90 = *v2;
  long long v88 = *((_OWORD *)v2 + 1);
  uint64_t v89 = v2[4];
  uint64_t v48 = swift_allocObject();
  long long v49 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v48 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v48 + 32) = v49;
  uint64_t v50 = v2[4];
  char v51 = v70;
  *(void *)(v48 + 48) = v50;
  sub_1AD952760((uint64_t)&v90);
  id v52 = v47;
  sub_1AD9D3A4C((uint64_t)&v88);
  sub_1AD9D36AC(0);
  uint64_t v84 = v46;
  uint64_t v85 = v42;
  uint64_t v86 = v43;
  uint64_t v87 = v44;
  swift_getOpaqueTypeConformance2();
  sub_1AD9D4554(&qword_1E9A4DE88, sub_1AD9D36AC, (void (*)(void))sub_1AD9D3870, (void (*)(void))sub_1AD9D38EC);
  uint64_t v53 = v75;
  sub_1AD9DEB90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v45, v53);
  if (qword_1EB7255E0 != -1) {
    swift_once();
  }
  uint64_t v54 = qword_1EB725608;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v56 = v77;
  uint64_t v57 = v78;
  uint64_t v58 = (uint64_t)v79;
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v79, v51, v78);
  id v59 = (uint64_t *)(v58 + *(int *)(v80 + 36));
  *id v59 = KeyPath;
  v59[1] = v54;
  char v60 = *(void (**)(char *, uint64_t))(v56 + 8);
  swift_retain();
  v60(v51, v57);
  uint64_t v61 = *MEMORY[0x1E4F3CB50];
  uint64_t v62 = sub_1AD9DDF50();
  uint64_t v63 = (uint64_t)v81;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v62 - 8) + 104))(v81, v61, v62);
  sub_1AD9D5254(&qword_1EB725A28, MEMORY[0x1E4F3CB98]);
  uint64_t result = sub_1AD9DF6C0();
  if (result)
  {
    sub_1AD9D3C14();
    sub_1AD9D5254(&qword_1EB725B90, (void (*)(uint64_t))sub_1AD85FCFC);
    sub_1AD9DEC80();
    sub_1AD9D3E50(v63, (uint64_t (*)(void))sub_1AD85FCFC);
    return sub_1AD9D3E50(v58, (uint64_t (*)(void))sub_1AD9D3920);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AD9D1278()
{
  return sub_1AD9DD8A0();
}

uint64_t sub_1AD9D12F8(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[1];
  uint64_t v7 = *a1;
  long long v8 = *((_OWORD *)a1 + 1);
  uint64_t v9 = a1[4];
  uint64_t v10 = v7;
  uint64_t v3 = swift_allocObject();
  long long v4 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = a1[4];
  swift_bridgeObjectRetain();
  sub_1AD952760((uint64_t)&v10);
  id v5 = v2;
  sub_1AD9D3A4C((uint64_t)&v8);
  sub_1AD9D01FC(0, &qword_1E9A4DDF0, type metadata accessor for SleepDayModel.SegmentModel, MEMORY[0x1E4FBB320]);
  sub_1AD9DCCB0();
  sub_1AD9D2C8C();
  sub_1AD9D2D10();
  sub_1AD9DD8F0();
  swift_getOpaqueTypeConformance2();
  sub_1AD9D5254(&qword_1E9A4DEB0, (void (*)(uint64_t))type metadata accessor for SleepDayModel.SegmentModel);
  return sub_1AD9DF240();
}

uint64_t sub_1AD9D149C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v43 = a2;
  uint64_t v2 = sub_1AD9DE2D0();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v40 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1AD9DCC70();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D47C8(0, &qword_1EB7259B8, MEMORY[0x1E4F27928], MEMORY[0x1E4F19208], MEMORY[0x1E4F19388]);
  MEMORY[0x1F4188790](v10 - 8, v11);
  v31[1] = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)v31 - v15;
  uint64_t v17 = sub_1AD9DD8F0();
  uint64_t v38 = *(void *)(v17 - 8);
  uint64_t v39 = v17;
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v33 = (char *)v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9D2C8C();
  uint64_t v36 = *(void *)(v20 - 8);
  uint64_t v37 = v20;
  MEMORY[0x1F4188790](v20, v21);
  uint64_t v35 = (char *)v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DE2C0();
  type metadata accessor for SleepDayModel.SegmentModel(0);
  sub_1AD9DC780();
  uint64_t v34 = v16;
  sub_1AD9DD800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v9, v5);
  sub_1AD9DE2C0();
  sub_1AD9DC750();
  sub_1AD9DD800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23(v9, v5);
  long long v46 = *(_OWORD *)(v32 + 16);
  uint64_t v47 = *(void *)(v32 + 32);
  long long v44 = *(_OWORD *)(v32 + 16);
  uint64_t v45 = *(void *)(v32 + 32);
  sub_1AD9D39B4(0, &qword_1E9A4C740, &qword_1E9A4C748, MEMORY[0x1E4FBC958], MEMORY[0x1E4F3ECC8]);
  sub_1AD9DF050();
  if (qword_1E9A49148 != -1) {
    swift_once();
  }
  long long v44 = v46;
  uint64_t v45 = v47;
  sub_1AD9DF050();
  uint64_t v24 = v33;
  sub_1AD9DD8E0();
  if (qword_1E9A49150 != -1) {
    swift_once();
  }
  uint64_t v26 = v40;
  uint64_t v25 = v41;
  uint64_t v27 = v42;
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v40, *MEMORY[0x1E4F3D4A0], v42);
  uint64_t v28 = v35;
  uint64_t v29 = v39;
  sub_1AD9DD720();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v29);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v43, v28, v37);
}

uint64_t sub_1AD9D1ABC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  v27[1] = a2;
  uint64_t v3 = sub_1AD9DD820();
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F27CA0];
  sub_1AD9D01FC(0, &qword_1EB725690, MEMORY[0x1E4F27CA0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)v27 - v8;
  uint64_t v10 = sub_1AD9DCE20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1AD9DD7D0();
  MEMORY[0x1F4188790](v15 - 8, v16);
  uint64_t v17 = sub_1AD9DD7A0();
  MEMORY[0x1F4188790](v17 - 8, v18);
  sub_1AD9DD790();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E4F27C10], v10);
  uint64_t v19 = sub_1AD9DCE40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
  sub_1AD9DD7B0();
  sub_1AD9D40FC((uint64_t)v9, &qword_1EB725690, v5);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  uint64_t v20 = swift_allocObject();
  long long v21 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v20 + 32) = v21;
  uint64_t v22 = a1[4];
  *(void *)(v20 + 48) = v22;
  uint64_t v23 = *a1;
  uint64_t v24 = (void *)a1[1];
  uint64_t v29 = v22;
  uint64_t v30 = v23;
  long long v28 = v21;
  sub_1AD952760((uint64_t)&v30);
  id v25 = v24;
  sub_1AD9D3A4C((uint64_t)&v28);
  sub_1AD9DD810();
  sub_1AD9D31F8();
  sub_1AD9D33AC();
  return sub_1AD9DD970();
}

uint64_t sub_1AD9D1E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a1;
  uint64_t v64 = a2;
  uint64_t v2 = sub_1AD9DD860();
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v58 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1AD9DD890();
  MEMORY[0x1F4188790](v5 - 8, v6);
  sub_1AD9D488C(0, &qword_1E9A4DE50, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], MEMORY[0x1E4F19370]);
  uint64_t v62 = v7;
  uint64_t v61 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v10 = (char *)&v51 - v9;
  sub_1AD9D3278();
  uint64_t v63 = v11;
  uint64_t v56 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v54 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14, v15);
  char v60 = (char *)&v51 - v16;
  uint64_t v17 = sub_1AD9DD930();
  MEMORY[0x1F4188790](v17 - 8, v18);
  uint64_t v59 = sub_1AD9DD960();
  uint64_t v55 = *(void *)(v59 - 8);
  MEMORY[0x1F4188790](v59, v19);
  long long v66 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21, v22);
  uint64_t v24 = (char *)&v51 - v23;
  uint64_t v65 = sub_1AD9DD700();
  uint64_t v25 = *(void *)(v65 - 8);
  MEMORY[0x1F4188790](v65, v26);
  long long v28 = (char *)&v51 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29, v30);
  uint64_t v32 = (char *)&v51 - v31;
  if (qword_1E9A49158 != -1) {
    swift_once();
  }
  long long v72 = xmmword_1E9A4DD20;
  uint64_t v73 = qword_1E9A4DD30;
  uint64_t v74 = unk_1E9A4DD38;
  uint64_t v75 = qword_1E9A4DD40;
  swift_bridgeObjectRetain();
  uint64_t v33 = v32;
  sub_1AD9DD6F0();
  if (qword_1E9A49140 != -1) {
    swift_once();
  }
  sub_1AD9DD910();
  long long v68 = xmmword_1E9A4DD20;
  uint64_t v69 = qword_1E9A4DD30;
  uint64_t v70 = unk_1E9A4DD38;
  uint64_t v71 = qword_1E9A4DD40;
  swift_bridgeObjectRetain();
  sub_1AD9DD950();
  uint64_t v34 = sub_1AD9DD870();
  MEMORY[0x1F4188790](v34, v35);
  sub_1AD9DD850();
  v50[3] = MEMORY[0x1E4F3E2E8];
  v50[1] = v50;
  v50[2] = MEMORY[0x1E4F3E2F8];
  v50[0] = sub_1AD9D3F94;
  sub_1AD9DD7E0();
  if (qword_1E9A49138 != -1) {
    swift_once();
  }
  sub_1AD9D3328();
  uint64_t v36 = v54;
  uint64_t v37 = v62;
  sub_1AD9DD900();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v10, v37);
  uint64_t v38 = v56;
  uint64_t v39 = v60;
  uint64_t v40 = v63;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v60, v36, v63);
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  uint64_t v53 = v28;
  id v52 = v33;
  v41(v28, v33, v65);
  v67[0] = v28;
  uint64_t v42 = v55;
  uint64_t v43 = v66;
  uint64_t v44 = v59;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v66, v24, v59);
  v67[1] = v43;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v36, v39, v40);
  v67[2] = v36;
  sub_1AD9CDA04(v67, v64);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v38 + 8);
  v45(v39, v40);
  long long v46 = *(void (**)(char *, uint64_t))(v42 + 8);
  v46(v24, v44);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v25 + 8);
  uint64_t v48 = v65;
  v47(v52, v65);
  v45(v36, v40);
  v46(v66, v44);
  return ((uint64_t (*)(char *, uint64_t))v47)(v53, v48);
}

uint64_t sub_1AD9D255C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  sub_1AD9D36E0(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a2;
  uint64_t v12 = (void *)a2[1];
  long long v25 = *((_OWORD *)a2 + 1);
  uint64_t v26 = a2[4];
  uint64_t v27 = v11;
  uint64_t v13 = swift_allocObject();
  long long v14 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v13 + 32) = v14;
  *(void *)(v13 + 48) = a2[4];
  sub_1AD952760((uint64_t)&v27);
  id v15 = v12;
  sub_1AD9D3A4C((uint64_t)&v25);
  uint64_t v16 = sub_1AD9DF320();
  uint64_t v18 = v17;
  uint64_t v19 = sub_1AD9DD830();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v10, a1, v19);
  uint64_t v20 = (uint64_t (**)@<X0>(uint64_t@<X8>))&v10[*(int *)(v7 + 44)];
  void *v20 = sub_1AD9886D0;
  v20[1] = 0;
  void v20[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))v16;
  v20[3] = v18;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1AD9D3EB4;
  *(void *)(v21 + 24) = v13;
  sub_1AD9D4690((uint64_t)v10, a3, (uint64_t (*)(void))sub_1AD9D36E0);
  sub_1AD9D36AC(0);
  uint64_t v23 = (uint64_t (**)(uint64_t))(a3 + *(int *)(v22 + 36));
  *uint64_t v23 = sub_1AD93FDCC;
  v23[1] = (uint64_t (*)(uint64_t))v21;
  return sub_1AD9D3E50((uint64_t)v10, (uint64_t (*)(void))sub_1AD9D36E0);
}

uint64_t sub_1AD9D2730@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1AD9D01FC(0, (unint64_t *)&qword_1EB725AB0, MEMORY[0x1E4F3E0A0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)v51 - v7;
  sub_1AD9D01FC(0, &qword_1EB724D70, MEMORY[0x1E4F27928], v4);
  MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v12 = (char *)v51 - v11;
  uint64_t v13 = sub_1AD9DCC70();
  sub_1AD9DD990();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v52 = a2;
    uint64_t v16 = *(void **)(a1 + 8);
    uint64_t v17 = (void *)sub_1AD9DCBB0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    id v18 = objc_msgSend(v16, sel_stringFromDate_, v17);

    uint64_t v19 = sub_1AD9DF710();
    uint64_t v21 = v20;

    uint64_t v53 = v19;
    uint64_t v54 = v21;
    sub_1AD85F688();
    uint64_t v22 = sub_1AD9DEAF0();
    uint64_t v24 = v23;
    char v26 = v25;
    uint64_t v28 = v27;
    if (qword_1E9A490F8 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_1AD9DE890();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v8, 1, 1, v29);
    sub_1AD9DE8D0();
    sub_1AD9D40FC((uint64_t)v8, (unint64_t *)&qword_1EB725AB0, MEMORY[0x1E4F3E0A0]);
    char v30 = v26 & 1;
    uint64_t v31 = sub_1AD9DEAB0();
    v51[0] = v22;
    v51[1] = v28;
    uint64_t v33 = v32;
    char v35 = v34;
    uint64_t v36 = v24;
    swift_release();
    uint64_t v37 = sub_1AD9DEAC0();
    uint64_t v39 = v38;
    char v41 = v40;
    sub_1AD861548(v31, v33, v35 & 1);
    swift_bridgeObjectRelease();
    if (qword_1E9A49100 != -1) {
      swift_once();
    }
    char v42 = v41 & 1;
    uint64_t v43 = sub_1AD9DEA70();
    uint64_t v45 = v44;
    char v47 = v46;
    uint64_t v49 = v48;
    sub_1AD861548(v37, v39, v42);
    swift_bridgeObjectRelease();
    sub_1AD861548(v51[0], v36, v30);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v50 = v52;
    *id v52 = v43;
    v50[1] = v45;
    *((unsigned char *)v50 + 16) = v47 & 1;
    v50[3] = v49;
  }
  return result;
}

uint64_t sub_1AD9D2B3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9D0838(a1);
}

void sub_1AD9D2B78()
{
  if (!qword_1E9A4DDD8)
  {
    sub_1AD9D2C0C();
    sub_1AD9D5254(&qword_1E9A4DE10, (void (*)(uint64_t))sub_1AD9D2C0C);
    unint64_t v0 = sub_1AD9DD8D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DDD8);
    }
  }
}

void sub_1AD9D2C0C()
{
  if (!qword_1E9A4DDE0)
  {
    sub_1AD9D42A0(255, &qword_1E9A4DDE8, (void (*)(uint64_t))sub_1AD9D2C8C);
    sub_1AD9D2D98();
    unint64_t v0 = sub_1AD9DD8B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DDE0);
    }
  }
}

void sub_1AD9D2C8C()
{
  if (!qword_1E9A4DDF8)
  {
    sub_1AD9DD8F0();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DDF8);
    }
  }
}

unint64_t sub_1AD9D2D10()
{
  unint64_t result = qword_1E9A4DE00;
  if (!qword_1E9A4DE00)
  {
    sub_1AD9D01FC(255, &qword_1E9A4DDF0, type metadata accessor for SleepDayModel.SegmentModel, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DE00);
  }
  return result;
}

unint64_t sub_1AD9D2D98()
{
  unint64_t result = qword_1E9A4DE08;
  if (!qword_1E9A4DE08)
  {
    sub_1AD9D42A0(255, &qword_1E9A4DDE8, (void (*)(uint64_t))sub_1AD9D2C8C);
    sub_1AD9DD8F0();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DE08);
  }
  return result;
}

void sub_1AD9D2E54()
{
  if (!qword_1E9A4DE18)
  {
    sub_1AD9D2B78();
    sub_1AD9DD840();
    sub_1AD9D5254(&qword_1E9A4DE20, (void (*)(uint64_t))sub_1AD9D2B78);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DE18);
    }
  }
}

void sub_1AD9D2F28()
{
  if (!qword_1E9A4DE28)
  {
    sub_1AD9D2E54();
    sub_1AD9D2B78();
    sub_1AD9DD840();
    sub_1AD9D5254(&qword_1E9A4DE20, (void (*)(uint64_t))sub_1AD9D2B78);
    swift_getOpaqueTypeConformance2();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DE28);
    }
  }
}

void sub_1AD9D302C()
{
  if (!qword_1E9A4DE30)
  {
    sub_1AD9D2F28();
    sub_1AD9D31B0(255);
    sub_1AD9D2E54();
    sub_1AD9D2B78();
    sub_1AD9DD840();
    sub_1AD9D5254(&qword_1E9A4DE20, (void (*)(uint64_t))sub_1AD9D2B78);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1AD9D5254(&qword_1E9A4DE68, sub_1AD9D31B0);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DE30);
    }
  }
}

void sub_1AD9D31B0(uint64_t a1)
{
}

void sub_1AD9D31F8()
{
  if (!qword_1E9A4DE40)
  {
    sub_1AD9DD700();
    sub_1AD9DD960();
    sub_1AD9D3278();
    unint64_t v0 = sub_1AD9DD710();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DE40);
    }
  }
}

void sub_1AD9D3278()
{
  if (!qword_1E9A4DE48)
  {
    sub_1AD9D488C(255, &qword_1E9A4DE50, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], MEMORY[0x1E4F19370]);
    sub_1AD9D3328();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DE48);
    }
  }
}

unint64_t sub_1AD9D3328()
{
  unint64_t result = qword_1E9A4DE58;
  if (!qword_1E9A4DE58)
  {
    sub_1AD9D488C(255, &qword_1E9A4DE50, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], MEMORY[0x1E4F19370]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DE58);
  }
  return result;
}

unint64_t sub_1AD9D33AC()
{
  unint64_t result = qword_1E9A4DE60;
  if (!qword_1E9A4DE60)
  {
    sub_1AD9D31F8();
    sub_1AD9D488C(255, &qword_1E9A4DE50, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], MEMORY[0x1E4F19370]);
    sub_1AD9D3328();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DE60);
  }
  return result;
}

void sub_1AD9D3494()
{
  if (!qword_1E9A4DE70)
  {
    sub_1AD9D302C();
    sub_1AD9D36AC(255);
    sub_1AD9D2F28();
    sub_1AD9D31B0(255);
    sub_1AD9D2E54();
    sub_1AD9D2B78();
    sub_1AD9DD840();
    sub_1AD9D5254(&qword_1E9A4DE20, (void (*)(uint64_t))sub_1AD9D2B78);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1AD9D5254(&qword_1E9A4DE68, sub_1AD9D31B0);
    swift_getOpaqueTypeConformance2();
    sub_1AD9D4554(&qword_1E9A4DE88, sub_1AD9D36AC, (void (*)(void))sub_1AD9D3870, (void (*)(void))sub_1AD9D38EC);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_1E9A4DE70);
    }
  }
}

void sub_1AD9D36AC(uint64_t a1)
{
}

void sub_1AD9D36E0(uint64_t a1)
{
}

void sub_1AD9D3714(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    a4(255);
    unint64_t v6 = sub_1AD9DDFC0();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

void sub_1AD9D3788(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_1AD9D3808(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

uint64_t sub_1AD9D3870()
{
  return sub_1AD9D4554(&qword_1E9A4DE90, sub_1AD9D36E0, (void (*)(void))sub_1AD9D38B8, (void (*)(void))sub_1AD9887B4);
}

uint64_t sub_1AD9D38B8()
{
  return sub_1AD9D5254(&qword_1EB7259C8, MEMORY[0x1E4F19398]);
}

uint64_t sub_1AD9D38EC()
{
  return sub_1AD9D5254(&qword_1E9A4D280, (void (*)(uint64_t))sub_1AD940CC0);
}

void sub_1AD9D3920()
{
  if (!qword_1E9A4DE98)
  {
    sub_1AD9D3494();
    sub_1AD9D39B4(255, (unint64_t *)&qword_1EB725C80, &qword_1EB725C88, MEMORY[0x1E4F3EB98], MEMORY[0x1E4F3DF18]);
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DE98);
    }
  }
}

void sub_1AD9D39B4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1AD9D41C8(255, a3, a4, MEMORY[0x1E4FBB718]);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_1AD9D3A30()
{
  return sub_1AD9D1278();
}

uint64_t sub_1AD9D3A38@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9D1ABC(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_1AD9D3A44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1AD9D255C(a1, (uint64_t *)(v2 + 16), a2);
}

uint64_t sub_1AD9D3A4C(uint64_t a1)
{
  return a1;
}

double sub_1AD9D3A78()
{
  sub_1AD9DDD40();
  double result = *(double *)&v1;
  xmmword_1E9A4DD20 = v1;
  *(_OWORD *)&qword_1E9A4DD30 = v2;
  qword_1E9A4DD40 = v3;
  return result;
}

unint64_t sub_1AD9D3AD4(uint64_t a1)
{
  sub_1AD9E03A0();
  sub_1AD9E03B0();
  uint64_t v2 = sub_1AD9E03E0();
  return sub_1AD9D3B40(a1, v2);
}

unint64_t sub_1AD9D3B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      unint64_t result = (result + 1) & v8;
      if (((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0
        && *(void *)(v7 + 8 * result) != a1)
      {
        for (unint64_t result = (result + 1) & v8;
              ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
              unint64_t result = (result + 1) & v8)
        {
          if (*(void *)(v7 + 8 * result) == a1) {
            break;
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_1AD9D3C14()
{
  unint64_t result = qword_1E9A4DEA0;
  if (!qword_1E9A4DEA0)
  {
    sub_1AD9D3920();
    sub_1AD9D302C();
    sub_1AD9D36AC(255);
    sub_1AD9D2F28();
    sub_1AD9D31B0(255);
    sub_1AD9D2E54();
    sub_1AD9D2B78();
    sub_1AD9DD840();
    sub_1AD9D5254(&qword_1E9A4DE20, (void (*)(uint64_t))sub_1AD9D2B78);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1AD9D5254(&qword_1E9A4DE68, sub_1AD9D31B0);
    swift_getOpaqueTypeConformance2();
    sub_1AD9D4554(&qword_1E9A4DE88, sub_1AD9D36AC, (void (*)(void))sub_1AD9D3870, (void (*)(void))sub_1AD9D38EC);
    swift_getOpaqueTypeConformance2();
    sub_1AD87D9E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DEA0);
  }
  return result;
}

uint64_t sub_1AD9D3E50(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AD9D3EB4()
{
  return sub_1AD9DF060();
}

uint64_t sub_1AD9D3F34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9D3F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1AD9D1E0C(a1, a2);
}

uint64_t sub_1AD9D3F94@<X0>(uint64_t *a1@<X8>)
{
  return sub_1AD9D2730(*(void *)(v1 + 16), a1);
}

void sub_1AD9D3F9C()
{
  if (!qword_1E9A4DEA8)
  {
    sub_1AD9DD700();
    sub_1AD9DD960();
    sub_1AD9D3278();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1E9A4DEA8);
    }
  }
}

unint64_t sub_1AD9D4024(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1AD8674EC();
    uint64_t v3 = (void *)sub_1AD9E01C0();
    for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_1AD9D3AD4(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC868];
  }
  return result;
}

uint64_t sub_1AD9D40FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1AD9D01FC(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1AD9D416C()
{
  return sub_1AD9D12F8(*(uint64_t **)(v0 + 16));
}

uint64_t objectdestroy_17Tm()
{
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AD9D41C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1AD9D149C(v1 + 16, a1);
}

void sub_1AD9D41C8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1AD9D4214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1AD9CEFAC(a1, *(void *)(v2 + 24), a2);
}

void sub_1AD9D421C()
{
  if (!qword_1E9A4DEB8)
  {
    sub_1AD9D42A0(255, &qword_1E9A4DEC0, (void (*)(uint64_t))sub_1AD9D43A4);
    unint64_t v0 = sub_1AD9DDEA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DEB8);
    }
  }
}

void sub_1AD9D42A0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    sub_1AD9D01FC(255, &qword_1E9A4DDF0, type metadata accessor for SleepDayModel.SegmentModel, MEMORY[0x1E4FBB320]);
    sub_1AD9DCCB0();
    a3(255);
    sub_1AD9D2D10();
    sub_1AD9D5254(&qword_1E9A4C930, MEMORY[0x1E4F27990]);
    unint64_t v5 = sub_1AD9DF270();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_1AD9D43A4()
{
  if (!qword_1E9A4DEC8)
  {
    sub_1AD9D47C8(255, &qword_1E9A4DED0, (uint64_t (*)(uint64_t))sub_1AD987298, MEMORY[0x1E4F3CAB0], MEMORY[0x1E4F3CC10]);
    sub_1AD87DCCC();
    unint64_t v0 = sub_1AD9DDFC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DEC8);
    }
  }
}

uint64_t sub_1AD9D4444()
{
  uint64_t v1 = sub_1AD9DDDF0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1AD9D44D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1AD9DDDF0();
  return sub_1AD9CF220(a1, a2);
}

uint64_t sub_1AD9D4554(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1AD9D45E0()
{
  unint64_t result = qword_1E9A4DEE0;
  if (!qword_1E9A4DEE0)
  {
    sub_1AD9D47C8(255, &qword_1E9A4DED0, (uint64_t (*)(uint64_t))sub_1AD987298, MEMORY[0x1E4F3CAB0], MEMORY[0x1E4F3CC10]);
    sub_1AD987558();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DEE0);
  }
  return result;
}

uint64_t sub_1AD9D4690(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AD9D46F8(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t))
{
  sub_1AD9D47C8(0, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_1AD9D476C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  sub_1AD9D47C8(0, a2, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_1AD9D47C8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    unint64_t v10 = a5(a1, v9, a4);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

unint64_t sub_1AD9D4834()
{
  unint64_t result = qword_1E9A4CFF0;
  if (!qword_1E9A4CFF0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A4CFF0);
  }
  return result;
}

void sub_1AD9D488C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, a4);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1AD9D48DC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AD9D491C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v25 = a3;
  uint64_t v26 = a1;
  uint64_t v6 = sub_1AD9DCD10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  unint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCCF0();
  char v11 = HKSPIsRemoveSpacesForTimeFormatEnabled();
  uint64_t v12 = self;
  uint64_t v13 = (void *)sub_1AD9DF6D0();
  uint64_t v14 = (void *)sub_1AD9DCCD0();
  id v15 = objc_msgSend(v12, sel_dateFormatFromTemplate_options_locale_, v13, 0, v14);

  if (v15)
  {
    uint64_t v16 = sub_1AD9DF710();
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0xE200000000000000;
    uint64_t v16 = 24936;
  }
  id v19 = sub_1AD99B1D4(v16, v18, (uint64_t)v10, v11);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v27 = a2;
  char v28 = v25 & 1;
  sub_1AD9D41C8(0, &qword_1E9A4C748, MEMORY[0x1E4FBC958], MEMORY[0x1E4FBB718]);
  uint64_t result = sub_1AD9DF040();
  uint64_t v21 = v29;
  char v22 = v30;
  uint64_t v23 = v31;
  *(void *)a4 = v26;
  *(void *)(a4 + 8) = v19;
  *(void *)(a4 + 16) = v21;
  *(unsigned char *)(a4 + 24) = v22;
  *(void *)(a4 + 32) = v23;
  return result;
}

unint64_t sub_1AD9D4B18()
{
  unint64_t result = qword_1E9A4DEF0;
  if (!qword_1E9A4DEF0)
  {
    sub_1AD9D01FC(255, &qword_1E9A4DD98, (uint64_t (*)(uint64_t))sub_1AD9D0260, MEMORY[0x1E4F3EBC8]);
    sub_1AD9D4BB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DEF0);
  }
  return result;
}

unint64_t sub_1AD9D4BB8()
{
  unint64_t result = qword_1E9A4DEF8;
  if (!qword_1E9A4DEF8)
  {
    sub_1AD9D0260();
    sub_1AD89073C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DEF8);
  }
  return result;
}

uint64_t sub_1AD9D4C30(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if (a12)
  {
    sub_1AD861558(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1AD9D4C80(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if (a12)
  {
    sub_1AD861548(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AD9D4CD0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1AD9D4D7C()
{
  unint64_t result = qword_1E9A4DF00;
  if (!qword_1E9A4DF00)
  {
    sub_1AD9D47C8(255, &qword_1E9A4DF08, (uint64_t (*)(uint64_t))sub_1AD9D4E70, MEMORY[0x1E4F3CE30], MEMORY[0x1E4F3CC10]);
    sub_1AD9D4554(&qword_1E9A4DF58, sub_1AD9D4E70, (void (*)(void))sub_1AD9D51EC, (void (*)(void))sub_1AD9D5220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DF00);
  }
  return result;
}

void sub_1AD9D4E70(uint64_t a1)
{
}

void sub_1AD9D4EA4()
{
  if (!qword_1E9A4DF18)
  {
    sub_1AD9D4F20();
    unint64_t v0 = sub_1AD9DDD00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DF18);
    }
  }
}

unint64_t sub_1AD9D4F20()
{
  unint64_t result = qword_1E9A4DF20;
  if (!qword_1E9A4DF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DF20);
  }
  return result;
}

void sub_1AD9D4F74()
{
  if (!qword_1E9A4DF28)
  {
    sub_1AD9D5008();
    sub_1AD9D5254(&qword_1E9A4DF50, (void (*)(uint64_t))sub_1AD9D5008);
    unint64_t v0 = sub_1AD9DDD70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DF28);
    }
  }
}

void sub_1AD9D5008()
{
  if (!qword_1E9A4DF30)
  {
    sub_1AD9D509C();
    sub_1AD9D5254(&qword_1E9A4DF48, (void (*)(uint64_t))sub_1AD9D509C);
    unint64_t v0 = sub_1AD9DDEE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DF30);
    }
  }
}

void sub_1AD9D509C()
{
  if (!qword_1E9A4DF38)
  {
    sub_1AD9D42A0(255, &qword_1E9A4DEC0, (void (*)(uint64_t))sub_1AD9D43A4);
    sub_1AD9D511C();
    unint64_t v0 = sub_1AD9DF0E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9A4DF38);
    }
  }
}

unint64_t sub_1AD9D511C()
{
  unint64_t result = qword_1E9A4DF40;
  if (!qword_1E9A4DF40)
  {
    sub_1AD9D42A0(255, &qword_1E9A4DEC0, (void (*)(uint64_t))sub_1AD9D43A4);
    sub_1AD9D4554(&qword_1E9A4DED8, (void (*)(uint64_t))sub_1AD9D43A4, (void (*)(void))sub_1AD9D45E0, (void (*)(void))sub_1AD87DFB4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DF40);
  }
  return result;
}

uint64_t sub_1AD9D51EC()
{
  return sub_1AD9D5254(&qword_1E9A4DF60, (void (*)(uint64_t))sub_1AD9D4EA4);
}

uint64_t sub_1AD9D5220()
{
  return sub_1AD9D5254(&qword_1E9A4DF68, (void (*)(uint64_t))sub_1AD9D4F74);
}

uint64_t sub_1AD9D5254(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t getEnumTagSinglePayload for TimeIntervalPickerViewConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TimeIntervalPickerViewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeIntervalPickerViewConfiguration()
{
  return &type metadata for TimeIntervalPickerViewConfiguration;
}

uint64_t sub_1AD9D5344(double a1, double a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return 59;
  }
  uint64_t result = Double.hoursAndMinutes.getter(a2);
  if (v6) {
    goto LABEL_15;
  }
  uint64_t v7 = 60 * result;
  if ((unsigned __int128)(result * (__int128)60) >> 64 != (60 * result) >> 63)
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v8 = __OFADD__(v7, v5);
  uint64_t v9 = v7 + v5;
  if (v8)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  double v10 = (double)v9;
  if ((~COERCE__INT64((double)v9) & 0x7FF0000000000000) == 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v10 > -9.22337204e18)
  {
    if (v10 < 9.22337204e18) {
      return (uint64_t)v10;
    }
    goto LABEL_14;
  }
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1AD9D53E8(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2
    && *(double *)(a1 + 8) == *(double *)(a2 + 8)
    && *(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    return (*(unsigned __int8 *)(a2 + 24) ^ *(unsigned __int8 *)(a1 + 24) ^ 1) & 1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1AD9D542C()
{
  double v0 = floor(*MEMORY[0x1E4FA53B0] * 60.0 * 60.0 / 60.0);
  if ((~*(void *)&v0 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v0 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v0 < 9.22337204e18) {
    return (uint64_t)v0;
  }
LABEL_7:
  __break(1u);
  return result;
}

unsigned char *storeEnumTagSinglePayload for TimeIntervalPickerViewConfiguration.IntervalCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(3, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1AD9D5598);
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(3, 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + sub_1AD95AB40(3, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1AD95AB40(3, 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeIntervalPickerViewConfiguration.IntervalCategory()
{
  return &type metadata for TimeIntervalPickerViewConfiguration.IntervalCategory;
}

unint64_t sub_1AD9D55D4()
{
  unint64_t result = qword_1E9A4DF70;
  if (!qword_1E9A4DF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9A4DF70);
  }
  return result;
}

uint64_t sub_1AD9D5628@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1AD9D6E0C(0, &qword_1EB724D70, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = &v69[-v6];
  uint64_t v8 = sub_1AD9DCC70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = &v69[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = &v69[-v16];
  uint64_t v19 = MEMORY[0x1F4188790](v15, v18);
  uint64_t v21 = &v69[-v20];
  MEMORY[0x1F4188790](v19, v22);
  uint64_t v24 = &v69[-v23];
  uint64_t v25 = type metadata accessor for Alarm();
  uint64_t v76 = *(void *)(v25 - 8);
  uint64_t v77 = v25;
  MEMORY[0x1F4188790](v25, v26);
  char v28 = &v69[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!a1)
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_1AD9DD550();
    __swift_project_value_buffer(v36, (uint64_t)qword_1E9A4D288);
    uint64_t v37 = sub_1AD9DD530();
    os_log_type_t v38 = sub_1AD9DFBA0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = a2;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v79 = (void (*)(void, void, void))v41;
      *(_DWORD *)uint64_t v39 = 136446210;
      uint64_t v78 = sub_1AD838978(0x6D72616C41, 0xE500000000000000, (uint64_t *)&v79);
      sub_1AD9DFEA0();
      _os_log_impl(&dword_1AD834000, v37, v38, "[%{public}s] ignoring nil alarm", v39, 0xCu);
      uint64_t v35 = 1;
      swift_arrayDestroy();
      uint64_t v42 = v41;
      a2 = v40;
      MEMORY[0x1B3E6D1A0](v42, -1, -1);
      MEMORY[0x1B3E6D1A0](v39, -1, -1);
    }
    else
    {

      uint64_t v35 = 1;
    }
    goto LABEL_30;
  }
  uint64_t v75 = a2;
  sub_1AD9D6E70();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v30 = a1;
  if ((objc_msgSend(v30, sel_isKindOfClass_, ObjCClassFromMetadata) & 1) == 0)
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1AD9DD550();
    __swift_project_value_buffer(v43, (uint64_t)qword_1E9A4D288);
    uint64_t v44 = sub_1AD9DD530();
    os_log_type_t v45 = sub_1AD9DFBA0();
    if (!os_log_type_enabled(v44, v45)) {
      goto LABEL_27;
    }
    char v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v79 = (void (*)(void, void, void))v47;
    *(_DWORD *)char v46 = 136446210;
    uint64_t v78 = sub_1AD838978(0x6D72616C41, 0xE500000000000000, (uint64_t *)&v79);
    sub_1AD9DFEA0();
    uint64_t v48 = "[%{public}s] ignoring alarm of wrong class";
    goto LABEL_21;
  }
  if (!objc_msgSend(v30, sel_isEnabled))
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_1AD9DD550();
    __swift_project_value_buffer(v49, (uint64_t)qword_1E9A4D288);
    uint64_t v44 = sub_1AD9DD530();
    os_log_type_t v45 = sub_1AD9DFBA0();
    if (!os_log_type_enabled(v44, v45)) {
      goto LABEL_27;
    }
    char v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v79 = (void (*)(void, void, void))v47;
    *(_DWORD *)char v46 = 136446210;
    uint64_t v78 = sub_1AD838978(0x6D72616C41, 0xE500000000000000, (uint64_t *)&v79);
    sub_1AD9DFEA0();
    uint64_t v48 = "[%{public}s] ignoring disabled alarm";
LABEL_21:
    _os_log_impl(&dword_1AD834000, v44, v45, v48, v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E6D1A0](v47, -1, -1);
    MEMORY[0x1B3E6D1A0](v46, -1, -1);

    uint64_t v35 = 1;
LABEL_29:
    a2 = v75;
LABEL_30:
    uint64_t v34 = v77;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(a2, v35, 1, v34);
  }
  id v31 = objc_msgSend(v30, sel_nextFireDate);
  if (!v31)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
LABEL_23:
    sub_1AD9D6EB0((uint64_t)v7, &qword_1EB724D70, MEMORY[0x1E4F27928]);
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_1AD9DD550();
    __swift_project_value_buffer(v50, (uint64_t)qword_1E9A4D288);
    uint64_t v44 = sub_1AD9DD530();
    os_log_type_t v51 = sub_1AD9DFBA0();
    if (os_log_type_enabled(v44, v51))
    {
      id v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v79 = (void (*)(void, void, void))v53;
      *(_DWORD *)id v52 = 136446210;
      uint64_t v78 = sub_1AD838978(0x6D72616C41, 0xE500000000000000, (uint64_t *)&v79);
      sub_1AD9DFEA0();
      _os_log_impl(&dword_1AD834000, v44, v51, "[%{public}s] ignoring alarm with no fire date", v52, 0xCu);
      uint64_t v35 = 1;
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v53, -1, -1);
      MEMORY[0x1B3E6D1A0](v52, -1, -1);

      goto LABEL_29;
    }
LABEL_27:

LABEL_28:
    uint64_t v35 = 1;
    goto LABEL_29;
  }
  uint64_t v32 = v31;
  sub_1AD9DCC40();

  uint64_t v74 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32);
  v74(v7, v21, v8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    goto LABEL_23;
  }
  v74(v24, v7, v8);
  sub_1AD9DCBE0();
  char v33 = sub_1AD9DCBD0();
  long long v72 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
  uint64_t v73 = v9 + 8;
  v72(v21, v8);
  if ((v33 & 1) == 0)
  {
    if (qword_1E9A49060 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_1AD9DD550();
    __swift_project_value_buffer(v55, (uint64_t)qword_1E9A4D288);
    uint64_t v56 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 16);
    v56(v17, v24, v8);
    v56(v13, v24, v8);
    uint64_t v57 = sub_1AD9DD530();
    os_log_type_t v58 = sub_1AD9DFBA0();
    int v59 = v58;
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v60 = swift_slowAlloc();
      uint64_t v74 = (void (*)(unsigned char *, unsigned char *, uint64_t))swift_slowAlloc();
      uint64_t v79 = (void (*)(void, void, void))v74;
      *(_DWORD *)uint64_t v60 = 136446722;
      os_log_t v71 = v57;
      uint64_t v78 = sub_1AD838978(0x6D72616C41, 0xE500000000000000, (uint64_t *)&v79);
      sub_1AD9DFEA0();
      *(_WORD *)(v60 + 12) = 2082;
      sub_1AD9D6F20();
      int v70 = v59;
      uint64_t v61 = sub_1AD9E0280();
      uint64_t v78 = sub_1AD838978(v61, v62, (uint64_t *)&v79);
      sub_1AD9DFEA0();
      swift_bridgeObjectRelease();
      uint64_t v63 = v17;
      uint64_t v64 = v72;
      v72(v63, v8);
      *(_WORD *)(v60 + 22) = 2050;
      sub_1AD9DCBF0();
      uint64_t v78 = v65;
      sub_1AD9DFEA0();
      v64(v13, v8);
      os_log_t v66 = v71;
      _os_log_impl(&dword_1AD834000, v71, (os_log_type_t)v70, "[%{public}s] ignoring alarm with fire date: %{public}s (%{public}fs from now)", (uint8_t *)v60, 0x20u);
      long long v67 = (void (*)(void, void, void))v74;
      swift_arrayDestroy();
      MEMORY[0x1B3E6D1A0](v67, -1, -1);
      MEMORY[0x1B3E6D1A0](v60, -1, -1);

      v64(v24, v8);
    }
    else
    {

      long long v68 = v72;
      v72(v13, v8);
      v68(v17, v8);
      v68(v24, v8);
    }
    goto LABEL_28;
  }

  v74(v28, v24, v8);
  uint64_t v34 = v77;
  *(void *)&v28[*(int *)(v77 + 20)] = v30;
  a2 = v75;
  sub_1AD8ADB78((uint64_t)v28, v75);
  uint64_t v35 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(a2, v35, 1, v34);
}

uint64_t Alarm.fireDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1AD9DCC70();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

id Alarm.isSleepAlarm.getter()
{
  return sub_1AD9D6274((SEL *)&selRef_isSleepAlarm);
}

uint64_t type metadata accessor for Alarm()
{
  uint64_t result = qword_1E9A4DF78;
  if (!qword_1E9A4DF78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id Alarm.isSnoozed.getter()
{
  return sub_1AD9D6274((SEL *)&selRef_isSnoozed);
}

id Alarm.isFiring.getter()
{
  return sub_1AD9D6274((SEL *)&selRef_isFiring);
}

id sub_1AD9D6274(SEL *a1)
{
  return [*(id *)(v1 + *(int *)(type metadata accessor for Alarm() + 20)) *a1];
}

uint64_t Alarm.isActive.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for Alarm() + 20));
  if (objc_msgSend(v1, sel_isFiring)) {
    return 1;
  }
  else {
    return (uint64_t)objc_msgSend(v1, sel_isSnoozed);
  }
}

void static Alarm.statusText(for:includeTime:allowSnoozeCountdown:isShortFormat:)(uint64_t a1, char a2, char a3)
{
  sub_1AD9D6E0C(0, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = type metadata accessor for Alarm();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD996574(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1AD9D6EB0((uint64_t)v9, (unint64_t *)&unk_1E9A4ACC0, (uint64_t (*)(uint64_t))type metadata accessor for Alarm);
    return;
  }
  sub_1AD8ADB78((uint64_t)v9, (uint64_t)v14);
  uint64_t v15 = *(void **)&v14[*(int *)(v10 + 20)];
  if objc_msgSend(v15, sel_isSnoozed) && (a3)
  {
    if (qword_1E9A49160 != -1) {
      swift_once();
    }
    uint64_t v16 = (void *)qword_1E9A5AAB0;
    sub_1AD9DCBF0();
    id v17 = objc_msgSend(v16, sel_stringFromTimeInterval_);
    if (v17)
    {
      uint64_t v18 = v17;
      sub_1AD9DF710();

LABEL_19:
      sub_1AD996518((uint64_t)v14);
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  if ((a2 & 1) == 0)
  {
    if (qword_1EB724E38 != -1) {
      swift_once();
    }
    id v28 = (id)qword_1EB727930;
    sub_1AD9DCA70();

    goto LABEL_18;
  }
  objc_msgSend(v15, sel_isSnoozed);
  if (qword_1EB724E38 != -1) {
    swift_once();
  }
  id v19 = (id)qword_1EB727930;
  sub_1AD9DCA70();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD9D6E0C(0, (unint64_t *)&qword_1E9A4A978, (uint64_t (*)(uint64_t))sub_1AD8C93A0, MEMORY[0x1E4FBBE00]);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1AD9E3070;
  id v21 = objc_msgSend(self, sel_sharedInstance);
  if (!v21)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v22 = v21;
  uint64_t v23 = (void *)sub_1AD9DCBB0();
  id v24 = objc_msgSend(v22, sel_formatDateAsTimeStyle_, v23);

  if (v24)
  {
    uint64_t v25 = sub_1AD9DF710();
    uint64_t v27 = v26;

    *(void *)(v20 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v20 + 64) = sub_1AD89E5A8();
    *(void *)(v20 + 32) = v25;
    *(void *)(v20 + 40) = v27;
    sub_1AD9DF720();
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
LABEL_22:
  __break(1u);
}

id sub_1AD9D680C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C00]), sel_init);
  objc_msgSend(v0, sel_setAllowedUnits_, 192);
  objc_msgSend(v0, sel_setUnitsStyle_, 0);
  id result = objc_msgSend(v0, sel_setIncludesTimeRemainingPhrase_, 1);
  qword_1E9A5AAB0 = (uint64_t)v0;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Alarm(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1AD9DCC70();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for Alarm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AD9DCC70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DCC70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DCC70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DCC70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DCC70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AD9D6BE4);
}

uint64_t sub_1AD9D6BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1AD9DCC70();
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
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Alarm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AD9D6CB8);
}

uint64_t sub_1AD9D6CB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1AD9DCC70();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1AD9D6D74()
{
  uint64_t result = sub_1AD9DCC70();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1AD9D6E0C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_1AD9D6E70()
{
  unint64_t result = qword_1E9A4D5B0;
  if (!qword_1E9A4D5B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9A4D5B0);
  }
  return result;
}

uint64_t sub_1AD9D6EB0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1AD9D6E0C(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1AD9D6F20()
{
  unint64_t result = qword_1EB725230;
  if (!qword_1EB725230)
  {
    sub_1AD9DCC70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB725230);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id HKSHLocalizedTimeForComponents(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v35 = a5;
  id v9 = a4;
  uint64_t v10 = [a2 nextDateAfterDate:a3 matchingComponents:a1 options:512];
  uint64_t v11 = HKLocalizedStringForDateAndTemplate();
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v12 setLocalizedDateFormatFromTemplate:@"a"];
  uint64_t v34 = (void *)v10;
  uint64_t v36 = [v12 stringFromDate:v10];
  uint64_t v13 = objc_msgSend(v11, "rangeOfString:");
  uint64_t v15 = v14;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  uint64_t v17 = *MEMORY[0x1E4FB06F8];
  uint64_t v18 = *MEMORY[0x1E4FB0700];
  v39[0] = *MEMORY[0x1E4FB06F8];
  v39[1] = v18;
  v40[0] = v9;
  v40[1] = v16;
  id v19 = (void *)MEMORY[0x1E4F1C9E8];
  id v20 = v16;
  id v21 = v9;
  id v22 = v11;
  uint64_t v23 = [v19 dictionaryWithObjects:v40 forKeys:v39 count:2];
  id v24 = objc_alloc(MEMORY[0x1E4F28B18]);

  uint64_t v25 = (void *)[v24 initWithString:v22 attributes:v23];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = v35;
    uint64_t v27 = v25;
  }
  else
  {
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v25];
    uint64_t v33 = v15;
    uint64_t v26 = v35;
    v37[1] = v18;
    v38[0] = v35;
    v37[0] = v17;
    id v28 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
    v38[1] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];

    objc_msgSend(v27, "setAttributes:range:", v29, v13, v33);
    uint64_t v30 = [v22 rangeOfString:@" "];
    if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v27, "setAttributes:range:", v29, v30, v31);
    }
  }
  return v27;
}

void _LayoutConstants(_OWORD *a1, void *a2)
{
  v38[7] = *MEMORY[0x1E4F143B8];
  id obj = a2;
  if (!obj)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    id v24 = [NSString stringWithUTF8String:"const LayoutConstants _LayoutConstants(CLKDevice *__strong)"];
    [v23 handleFailureInFunction:v24 file:@"HKSHUIWatchMetrics.m" lineNumber:104 description:@"device cannot be nil"];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_0);
  id WeakRetained = objc_loadWeakRetained(&qword_1E9A5A628);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_1E9A5A628);
    if (v5 == obj)
    {
      uint64_t v6 = [obj version];
      uint64_t v7 = qword_1E9A5A630;

      if (v6 == v7) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_1E9A5A628, obj);
  qword_1E9A5A630 = [obj version];

  id v9 = [MEMORY[0x1E4F19A40] metricsWithDevice:obj identitySizeClass:2];
  v37[0] = &unk_1F047C288;
  v37[1] = &unk_1F047C2A0;
  v38[0] = &unk_1F047C330;
  v38[1] = &unk_1F047C340;
  void v37[2] = &unk_1F047C2B8;
  v37[3] = &unk_1F047C2D0;
  void v38[2] = &unk_1F047C350;
  v38[3] = &unk_1F047C360;
  v37[4] = &unk_1F047C2E8;
  v37[5] = &unk_1F047C300;
  v38[4] = &unk_1F047C370;
  v38[5] = &unk_1F047C380;
  v37[6] = &unk_1F047C318;
  v38[6] = &unk_1F047C390;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:7];
  uint64_t v10 = v25 = a1;
  [v9 constantValue:v10 withOverrides:21.0];
  qword_1E9A5A638 = v11;

  v35[0] = &unk_1F047C288;
  v35[1] = &unk_1F047C2A0;
  v36[0] = &unk_1F047C3A0;
  v36[1] = &unk_1F047C3B0;
  long long v35[2] = &unk_1F047C2B8;
  uint64_t v35[3] = &unk_1F047C2D0;
  v36[2] = &unk_1F047C3A0;
  void v36[3] = &unk_1F047C3B0;
  v35[4] = &unk_1F047C2E8;
  v35[5] = &unk_1F047C300;
  v35[6] = &unk_1F047C318;
  v36[4] = &unk_1F047C3A0;
  v36[5] = &unk_1F047C3B0;
  v36[6] = &unk_1F047C3B0;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:7];
  [v9 constantValue:v12 withOverrides:19.0];
  qword_1E9A5A640 = v13;

  v33[0] = &unk_1F047C288;
  v33[1] = &unk_1F047C2A0;
  v34[0] = &unk_1F047C3C0;
  v34[1] = &unk_1F047C3D0;
  v33[2] = &unk_1F047C2B8;
  v33[3] = &unk_1F047C2D0;
  v34[2] = &unk_1F047C3E0;
  uint64_t v34[3] = &unk_1F047C3F0;
  v33[4] = &unk_1F047C2E8;
  v33[5] = &unk_1F047C300;
  v34[4] = &unk_1F047C400;
  v34[5] = &unk_1F047C410;
  uint64_t v33[6] = &unk_1F047C318;
  v34[6] = &unk_1F047C420;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:7];
  [v9 constantValue:v14 withOverrides:47.5];
  qword_1E9A5A648 = v15;

  v31[0] = &unk_1F047C288;
  v31[1] = &unk_1F047C2A0;
  v32[0] = &unk_1F047C430;
  v32[1] = &unk_1F047C440;
  void v31[2] = &unk_1F047C2B8;
  v31[3] = &unk_1F047C2D0;
  void v32[2] = &unk_1F047C450;
  v32[3] = &unk_1F047C460;
  v31[4] = &unk_1F047C2E8;
  v31[5] = &unk_1F047C300;
  v32[4] = &unk_1F047C470;
  v32[5] = &unk_1F047C460;
  v31[6] = &unk_1F047C318;
  v32[6] = &unk_1F047C480;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];
  [v9 constantValue:v16 withOverrides:177.0];
  qword_1E9A5A650 = v17;

  v29[0] = &unk_1F047C288;
  v29[1] = &unk_1F047C2A0;
  v30[0] = &unk_1F047C490;
  v30[1] = &unk_1F047C4A0;
  void v29[2] = &unk_1F047C2B8;
  v29[3] = &unk_1F047C2D0;
  v30[2] = &unk_1F047C4B0;
  uint64_t v30[3] = &unk_1F047C4C0;
  v29[4] = &unk_1F047C2E8;
  v29[5] = &unk_1F047C300;
  v30[4] = &unk_1F047C4D0;
  v30[5] = &unk_1F047C4E0;
  v29[6] = &unk_1F047C318;
  v30[6] = &unk_1F047C4F0;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:7];
  [v9 constantValue:v18 withOverrides:143.0];
  qword_1E9A5A658 = v19;

  v27[0] = &unk_1F047C288;
  v27[1] = &unk_1F047C2A0;
  v28[0] = &unk_1F047C500;
  v28[1] = &unk_1F047C510;
  void v27[2] = &unk_1F047C2B8;
  v27[3] = &unk_1F047C2D0;
  v28[2] = &unk_1F047C520;
  uint64_t v28[3] = &unk_1F047C530;
  v27[4] = &unk_1F047C2E8;
  v27[5] = &unk_1F047C300;
  v28[4] = &unk_1F047C520;
  v28[5] = &unk_1F047C540;
  v27[6] = &unk_1F047C318;
  v28[6] = &unk_1F047C530;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
  [v9 constantValue:v20 withOverrides:30.0];
  qword_1E9A5A660 = v21;

  a1 = v25;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_0);
  long long v22 = *(_OWORD *)&qword_1E9A5A648;
  *a1 = *(_OWORD *)&qword_1E9A5A638;
  a1[1] = v22;
  a1[2] = *(_OWORD *)&qword_1E9A5A658;
}

id HKSHUICurrentDevice()
{
  if (qword_1E9A5A688 != -1) {
    dispatch_once(&qword_1E9A5A688, &__block_literal_global_1);
  }
  id v0 = (void *)_MergedGlobals_2;
  return v0;
}

uint64_t __HKSHUICurrentDevice_block_invoke()
{
  _MergedGlobals_2 = [MEMORY[0x1E4F19A30] currentDevice];
  return MEMORY[0x1F41817F8]();
}

uint64_t HKSHUIBundle()
{
  id v0 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

id HKSHUILocalizedString(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  uint64_t v3 = [v1 bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_1F0473C40 table:0];

  return v4;
}

uint64_t sub_1AD9DC690()
{
  return MEMORY[0x1F40E2F78]();
}

uint64_t sub_1AD9DC6A0()
{
  return MEMORY[0x1F40E2FE0]();
}

uint64_t sub_1AD9DC6B0()
{
  return MEMORY[0x1F40E31D0]();
}

uint64_t sub_1AD9DC6C0()
{
  return MEMORY[0x1F416A998]();
}

uint64_t sub_1AD9DC6D0()
{
  return MEMORY[0x1F416A9A0]();
}

uint64_t sub_1AD9DC6E0()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1AD9DC6F0()
{
  return MEMORY[0x1F40E32D8]();
}

uint64_t sub_1AD9DC700()
{
  return MEMORY[0x1F40E33F0]();
}

uint64_t sub_1AD9DC710()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1AD9DC720()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1AD9DC730()
{
  return MEMORY[0x1F40E34B0]();
}

uint64_t sub_1AD9DC740()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1AD9DC750()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1AD9DC760()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1AD9DC770()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1AD9DC780()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1AD9DC790()
{
  return MEMORY[0x1F40E3508]();
}

uint64_t sub_1AD9DC7A0()
{
  return MEMORY[0x1F40E3518]();
}

uint64_t sub_1AD9DC7B0()
{
  return MEMORY[0x1F40E3520]();
}

uint64_t sub_1AD9DC7C0()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1AD9DC7D0()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1AD9DC7E0()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1AD9DC7F0()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1AD9DC800()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1AD9DC810()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1AD9DC820()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1AD9DC830()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1AD9DC840()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1AD9DC850()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1AD9DC860()
{
  return MEMORY[0x1F40E36C8]();
}

uint64_t sub_1AD9DC870()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1AD9DC880()
{
  return MEMORY[0x1F40E3708]();
}

uint64_t sub_1AD9DC890()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1AD9DC8A0()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1AD9DC8B0()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1AD9DC8C0()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1AD9DC8D0()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1AD9DC8E0()
{
  return MEMORY[0x1F40E3938]();
}

uint64_t sub_1AD9DC8F0()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1AD9DC900()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1AD9DC910()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1AD9DC920()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1AD9DC930()
{
  return MEMORY[0x1F40E39A0]();
}

uint64_t sub_1AD9DC940()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1AD9DC950()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_1AD9DC960()
{
  return MEMORY[0x1F40E39D8]();
}

uint64_t sub_1AD9DC970()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1AD9DC980()
{
  return MEMORY[0x1F40E3A30]();
}

uint64_t sub_1AD9DC990()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1AD9DC9A0()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1AD9DC9B0()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1AD9DC9C0()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1AD9DC9D0()
{
  return MEMORY[0x1F40E3C60]();
}

uint64_t sub_1AD9DC9E0()
{
  return MEMORY[0x1F40E3CD0]();
}

uint64_t sub_1AD9DC9F0()
{
  return MEMORY[0x1F40E3CE8]();
}

uint64_t sub_1AD9DCA00()
{
  return MEMORY[0x1F40E3CF8]();
}

uint64_t sub_1AD9DCA10()
{
  return MEMORY[0x1F40E3D08]();
}

uint64_t sub_1AD9DCA20()
{
  return MEMORY[0x1F40E3E08]();
}

uint64_t sub_1AD9DCA30()
{
  return MEMORY[0x1F4121420]();
}

uint64_t sub_1AD9DCA40()
{
  return MEMORY[0x1F40E3E40]();
}

uint64_t sub_1AD9DCA50()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1AD9DCA60()
{
  return MEMORY[0x1F40E3EF8]();
}

uint64_t sub_1AD9DCA70()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1AD9DCA80()
{
  return MEMORY[0x1F40E4198]();
}

uint64_t sub_1AD9DCAF0()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1AD9DCB00()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1AD9DCB10()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1AD9DCB20()
{
  return MEMORY[0x1F40E4600]();
}

uint64_t sub_1AD9DCB30()
{
  return MEMORY[0x1F40E48A0]();
}

uint64_t sub_1AD9DCB40()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1AD9DCB50()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1AD9DCB60()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1AD9DCB70()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1AD9DCB80()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1AD9DCB90()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1AD9DCBA0()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1AD9DCBB0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1AD9DCBC0()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1AD9DCBD0()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1AD9DCBE0()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1AD9DCBF0()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1AD9DCC00()
{
  return MEMORY[0x1F40E51F8]();
}

uint64_t sub_1AD9DCC10()
{
  return MEMORY[0x1F40E5220]();
}

uint64_t sub_1AD9DCC20()
{
  return MEMORY[0x1F40E5298]();
}

uint64_t sub_1AD9DCC30()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1AD9DCC40()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1AD9DCC50()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1AD9DCC60()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1AD9DCC70()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1AD9DCC80()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1AD9DCC90()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1AD9DCCA0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1AD9DCCB0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1AD9DCCC0()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1AD9DCCD0()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1AD9DCCE0()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1AD9DCCF0()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1AD9DCD00()
{
  return MEMORY[0x1F4121428]();
}

uint64_t sub_1AD9DCD10()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1AD9DCD20()
{
  return MEMORY[0x1F40E5898]();
}

uint64_t sub_1AD9DCD30()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1AD9DCD40()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1AD9DCD50()
{
  return MEMORY[0x1F40E58C0]();
}

uint64_t sub_1AD9DCD60()
{
  return MEMORY[0x1F40E5930]();
}

uint64_t sub_1AD9DCD70()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1AD9DCD80()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1AD9DCD90()
{
  return MEMORY[0x1F40E59B0]();
}

uint64_t sub_1AD9DCDA0()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1AD9DCDB0()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1AD9DCDC0()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1AD9DCDD0()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1AD9DCDE0()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1AD9DCDF0()
{
  return MEMORY[0x1F40E5A98]();
}

uint64_t sub_1AD9DCE00()
{
  return MEMORY[0x1F40E5AA8]();
}

uint64_t sub_1AD9DCE10()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1AD9DCE20()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1AD9DCE30()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1AD9DCE40()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1AD9DCE50()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1AD9DCE60()
{
  return MEMORY[0x1F40E5BC8]();
}

uint64_t sub_1AD9DCE70()
{
  return MEMORY[0x1F40E5BD0]();
}

uint64_t sub_1AD9DCE80()
{
  return MEMORY[0x1F40E5BD8]();
}

uint64_t sub_1AD9DCE90()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1AD9DCEA0()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1AD9DCEB0()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1AD9DCEC0()
{
  return MEMORY[0x1F40E5E60]();
}

uint64_t sub_1AD9DCED0()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1AD9DCEE0()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1AD9DCEF0()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1AD9DCF00()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1AD9DCF10()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1AD9DCF20()
{
  return MEMORY[0x1F41036F8]();
}

uint64_t sub_1AD9DCF30()
{
  return MEMORY[0x1F4103708]();
}

uint64_t sub_1AD9DCF40()
{
  return MEMORY[0x1F4103748]();
}

uint64_t sub_1AD9DCF50()
{
  return MEMORY[0x1F4103790]();
}

uint64_t sub_1AD9DCF60()
{
  return MEMORY[0x1F41037B0]();
}

uint64_t sub_1AD9DCF70()
{
  return MEMORY[0x1F41037B8]();
}

uint64_t sub_1AD9DCF80()
{
  return MEMORY[0x1F41037C8]();
}

uint64_t sub_1AD9DCF90()
{
  return MEMORY[0x1F41037F0]();
}

uint64_t sub_1AD9DCFA0()
{
  return MEMORY[0x1F4103800]();
}

uint64_t sub_1AD9DCFB0()
{
  return MEMORY[0x1F4103818]();
}

uint64_t sub_1AD9DCFC0()
{
  return MEMORY[0x1F4103820]();
}

uint64_t sub_1AD9DCFD0()
{
  return MEMORY[0x1F41038F0]();
}

uint64_t sub_1AD9DCFE0()
{
  return MEMORY[0x1F41038F8]();
}

uint64_t sub_1AD9DCFF0()
{
  return MEMORY[0x1F4103908]();
}

uint64_t sub_1AD9DD010()
{
  return MEMORY[0x1F4103988]();
}

uint64_t sub_1AD9DD020()
{
  return MEMORY[0x1F4103990]();
}

uint64_t sub_1AD9DD030()
{
  return MEMORY[0x1F416A9C8]();
}

uint64_t sub_1AD9DD040()
{
  return MEMORY[0x1F41039E0]();
}

uint64_t sub_1AD9DD050()
{
  return MEMORY[0x1F4103A30]();
}

uint64_t sub_1AD9DD060()
{
  return MEMORY[0x1F4103C38]();
}

uint64_t sub_1AD9DD070()
{
  return MEMORY[0x1F4103C40]();
}

uint64_t sub_1AD9DD080()
{
  return MEMORY[0x1F4103C48]();
}

uint64_t sub_1AD9DD090()
{
  return MEMORY[0x1F4103C50]();
}

uint64_t sub_1AD9DD0A0()
{
  return MEMORY[0x1F4103DD0]();
}

uint64_t sub_1AD9DD0B0()
{
  return MEMORY[0x1F4103DF0]();
}

uint64_t sub_1AD9DD0C0()
{
  return MEMORY[0x1F4168418]();
}

uint64_t sub_1AD9DD0D0()
{
  return MEMORY[0x1F4168440]();
}

uint64_t sub_1AD9DD0E0()
{
  return MEMORY[0x1F4168588]();
}

uint64_t sub_1AD9DD0F0()
{
  return MEMORY[0x1F41685A8]();
}

uint64_t sub_1AD9DD110()
{
  return MEMORY[0x1F40E5F60]();
}

uint64_t sub_1AD9DD120()
{
  return MEMORY[0x1F40E5F70]();
}

uint64_t sub_1AD9DD130()
{
  return MEMORY[0x1F40E5F80]();
}

uint64_t sub_1AD9DD140()
{
  return MEMORY[0x1F411D160]();
}

uint64_t sub_1AD9DD150()
{
  return MEMORY[0x1F411D168]();
}

uint64_t sub_1AD9DD160()
{
  return MEMORY[0x1F411D170]();
}

uint64_t sub_1AD9DD170()
{
  return MEMORY[0x1F411D178]();
}

uint64_t sub_1AD9DD180()
{
  return MEMORY[0x1F411D180]();
}

uint64_t sub_1AD9DD190()
{
  return MEMORY[0x1F411D300]();
}

uint64_t sub_1AD9DD1A0()
{
  return MEMORY[0x1F411D308]();
}

uint64_t sub_1AD9DD1B0()
{
  return MEMORY[0x1F411D310]();
}

uint64_t sub_1AD9DD1C0()
{
  return MEMORY[0x1F411D318]();
}

uint64_t sub_1AD9DD1D0()
{
  return MEMORY[0x1F41306C0]();
}

uint64_t sub_1AD9DD1E0()
{
  return MEMORY[0x1F41306C8]();
}

uint64_t sub_1AD9DD1F0()
{
  return MEMORY[0x1F41306D0]();
}

uint64_t sub_1AD9DD200()
{
  return MEMORY[0x1F4120708]();
}

uint64_t sub_1AD9DD210()
{
  return MEMORY[0x1F4120710]();
}

uint64_t sub_1AD9DD220()
{
  return MEMORY[0x1F411D918]();
}

uint64_t sub_1AD9DD230()
{
  return MEMORY[0x1F411DB00]();
}

uint64_t sub_1AD9DD240()
{
  return MEMORY[0x1F411CF30]();
}

uint64_t sub_1AD9DD250()
{
  return MEMORY[0x1F411D088]();
}

uint64_t sub_1AD9DD260()
{
  return MEMORY[0x1F411E1F8]();
}

uint64_t sub_1AD9DD270()
{
  return MEMORY[0x1F411E210]();
}

uint64_t sub_1AD9DD280()
{
  return MEMORY[0x1F411E220]();
}

uint64_t sub_1AD9DD290()
{
  return MEMORY[0x1F411E228]();
}

uint64_t sub_1AD9DD2A0()
{
  return MEMORY[0x1F411E230]();
}

uint64_t sub_1AD9DD2B0()
{
  return MEMORY[0x1F411E238]();
}

uint64_t sub_1AD9DD2C0()
{
  return MEMORY[0x1F411E460]();
}

uint64_t sub_1AD9DD2D0()
{
  return MEMORY[0x1F411E470]();
}

uint64_t sub_1AD9DD2E0()
{
  return MEMORY[0x1F411E478]();
}

uint64_t sub_1AD9DD2F0()
{
  return MEMORY[0x1F411E608]();
}

uint64_t sub_1AD9DD300()
{
  return MEMORY[0x1F411E638]();
}

uint64_t sub_1AD9DD310()
{
  return MEMORY[0x1F411E648]();
}

uint64_t sub_1AD9DD320()
{
  return MEMORY[0x1F411E650]();
}

uint64_t sub_1AD9DD330()
{
  return MEMORY[0x1F411E658]();
}

uint64_t sub_1AD9DD340()
{
  return MEMORY[0x1F411E660]();
}

uint64_t sub_1AD9DD350()
{
  return MEMORY[0x1F411E668]();
}

uint64_t sub_1AD9DD360()
{
  return MEMORY[0x1F411E6B0]();
}

uint64_t sub_1AD9DD370()
{
  return MEMORY[0x1F411E6B8]();
}

uint64_t sub_1AD9DD380()
{
  return MEMORY[0x1F411E6D0]();
}

uint64_t sub_1AD9DD390()
{
  return MEMORY[0x1F411E6E0]();
}

uint64_t sub_1AD9DD3A0()
{
  return MEMORY[0x1F411E730]();
}

uint64_t sub_1AD9DD3B0()
{
  return MEMORY[0x1F411E738]();
}

uint64_t sub_1AD9DD3C0()
{
  return MEMORY[0x1F411E740]();
}

uint64_t sub_1AD9DD3D0()
{
  return MEMORY[0x1F411E750]();
}

uint64_t sub_1AD9DD3E0()
{
  return MEMORY[0x1F411E778]();
}

uint64_t sub_1AD9DD3F0()
{
  return MEMORY[0x1F411E780]();
}

uint64_t sub_1AD9DD400()
{
  return MEMORY[0x1F411E790]();
}

uint64_t sub_1AD9DD410()
{
  return MEMORY[0x1F411E798]();
}

uint64_t sub_1AD9DD420()
{
  return MEMORY[0x1F411E8D8]();
}

uint64_t sub_1AD9DD430()
{
  return MEMORY[0x1F411E8E0]();
}

uint64_t sub_1AD9DD440()
{
  return MEMORY[0x1F411E950]();
}

uint64_t sub_1AD9DD450()
{
  return MEMORY[0x1F411EA18]();
}

uint64_t sub_1AD9DD460()
{
  return MEMORY[0x1F411EC50]();
}

uint64_t sub_1AD9DD470()
{
  return MEMORY[0x1F411ECA0]();
}

uint64_t sub_1AD9DD480()
{
  return MEMORY[0x1F411ECC0]();
}

uint64_t sub_1AD9DD490()
{
  return MEMORY[0x1F411ECE8]();
}

uint64_t sub_1AD9DD4A0()
{
  return MEMORY[0x1F411ECF0]();
}

uint64_t sub_1AD9DD4B0()
{
  return MEMORY[0x1F411ECF8]();
}

uint64_t sub_1AD9DD4C0()
{
  return MEMORY[0x1F411ED00]();
}

uint64_t sub_1AD9DD4D0()
{
  return MEMORY[0x1F411F000]();
}

uint64_t sub_1AD9DD4E0()
{
  return MEMORY[0x1F411F010]();
}

uint64_t sub_1AD9DD4F0()
{
  return MEMORY[0x1F411F060]();
}

uint64_t sub_1AD9DD500()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1AD9DD510()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t sub_1AD9DD520()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1AD9DD530()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1AD9DD540()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1AD9DD550()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1AD9DD560()
{
  return MEMORY[0x1F4165B78]();
}

uint64_t sub_1AD9DD570()
{
  return MEMORY[0x1F4165BA8]();
}

uint64_t sub_1AD9DD580()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1AD9DD590()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1AD9DD5A0()
{
  return MEMORY[0x1F4165D88]();
}

uint64_t sub_1AD9DD5B0()
{
  return MEMORY[0x1F4165DF0]();
}

uint64_t sub_1AD9DD5C0()
{
  return MEMORY[0x1F4165EB0]();
}

uint64_t sub_1AD9DD5D0()
{
  return MEMORY[0x1F4165F30]();
}

uint64_t sub_1AD9DD5E0()
{
  return MEMORY[0x1F4165F60]();
}

uint64_t sub_1AD9DD5F0()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1AD9DD600()
{
  return MEMORY[0x1F4165F80]();
}

uint64_t sub_1AD9DD610()
{
  return MEMORY[0x1F4165FD0]();
}

uint64_t sub_1AD9DD620()
{
  return MEMORY[0x1F4165FF8]();
}

uint64_t sub_1AD9DD630()
{
  return MEMORY[0x1F4166028]();
}

uint64_t sub_1AD9DD640()
{
  return MEMORY[0x1F4166050]();
}

uint64_t sub_1AD9DD650()
{
  return MEMORY[0x1F4166068]();
}

uint64_t sub_1AD9DD660()
{
  return MEMORY[0x1F4166070]();
}

uint64_t sub_1AD9DD670()
{
  return MEMORY[0x1F41660E0]();
}

uint64_t sub_1AD9DD680()
{
  return MEMORY[0x1F41660E8]();
}

uint64_t sub_1AD9DD690()
{
  return MEMORY[0x1F41660F0]();
}

uint64_t sub_1AD9DD6A0()
{
  return MEMORY[0x1F41660F8]();
}

uint64_t sub_1AD9DD6B0()
{
  return MEMORY[0x1F4166108]();
}

uint64_t sub_1AD9DD6C0()
{
  return MEMORY[0x1F4166118]();
}

uint64_t sub_1AD9DD6D0()
{
  return MEMORY[0x1F41663F0]();
}

uint64_t sub_1AD9DD6E0()
{
  return MEMORY[0x1F40D57F8]();
}

uint64_t sub_1AD9DD6F0()
{
  return MEMORY[0x1F40D5808]();
}

uint64_t sub_1AD9DD700()
{
  return MEMORY[0x1F40D5810]();
}

uint64_t sub_1AD9DD710()
{
  return MEMORY[0x1F40D5820]();
}

uint64_t sub_1AD9DD720()
{
  return MEMORY[0x1F40D5878]();
}

uint64_t sub_1AD9DD730()
{
  return MEMORY[0x1F40D5880]();
}

uint64_t sub_1AD9DD740()
{
  return MEMORY[0x1F40D58B8]();
}

uint64_t sub_1AD9DD750()
{
  return MEMORY[0x1F40D58C8]();
}

uint64_t sub_1AD9DD760()
{
  return MEMORY[0x1F40D5908]();
}

uint64_t sub_1AD9DD770()
{
  return MEMORY[0x1F40D5958]();
}

uint64_t sub_1AD9DD780()
{
  return MEMORY[0x1F40D5968]();
}

uint64_t sub_1AD9DD790()
{
  return MEMORY[0x1F40D5978]();
}

uint64_t sub_1AD9DD7A0()
{
  return MEMORY[0x1F40D5998]();
}

uint64_t sub_1AD9DD7B0()
{
  return MEMORY[0x1F40D59A0]();
}

uint64_t sub_1AD9DD7C0()
{
  return MEMORY[0x1F40D59B0]();
}

uint64_t sub_1AD9DD7D0()
{
  return MEMORY[0x1F40D59B8]();
}

uint64_t sub_1AD9DD7E0()
{
  return MEMORY[0x1F40D59C8]();
}

uint64_t sub_1AD9DD7F0()
{
  return MEMORY[0x1F40D59E0]();
}

uint64_t sub_1AD9DD800()
{
  return MEMORY[0x1F40D5A00]();
}

uint64_t sub_1AD9DD810()
{
  return MEMORY[0x1F40D5A18]();
}

uint64_t sub_1AD9DD820()
{
  return MEMORY[0x1F40D5A30]();
}

uint64_t sub_1AD9DD830()
{
  return MEMORY[0x1F40D5A38]();
}

uint64_t sub_1AD9DD840()
{
  return MEMORY[0x1F40D5A98]();
}

uint64_t sub_1AD9DD850()
{
  return MEMORY[0x1F40D5AB8]();
}

uint64_t sub_1AD9DD860()
{
  return MEMORY[0x1F40D5AC8]();
}

uint64_t sub_1AD9DD870()
{
  return MEMORY[0x1F40D5B10]();
}

uint64_t sub_1AD9DD880()
{
  return MEMORY[0x1F40D5B20]();
}

uint64_t sub_1AD9DD890()
{
  return MEMORY[0x1F40D5B28]();
}

uint64_t sub_1AD9DD8A0()
{
  return MEMORY[0x1F40D5B40]();
}

uint64_t sub_1AD9DD8B0()
{
  return MEMORY[0x1F40D5B48]();
}

uint64_t sub_1AD9DD8C0()
{
  return MEMORY[0x1F40D5B50]();
}

uint64_t sub_1AD9DD8D0()
{
  return MEMORY[0x1F40D5B60]();
}

uint64_t sub_1AD9DD8E0()
{
  return MEMORY[0x1F40D5B80]();
}

uint64_t sub_1AD9DD8F0()
{
  return MEMORY[0x1F40D5B88]();
}

uint64_t sub_1AD9DD900()
{
  return MEMORY[0x1F40D5BC0]();
}

uint64_t sub_1AD9DD910()
{
  return MEMORY[0x1F40D5BC8]();
}

uint64_t sub_1AD9DD920()
{
  return MEMORY[0x1F40D5BD0]();
}

uint64_t sub_1AD9DD930()
{
  return MEMORY[0x1F40D5BD8]();
}

uint64_t sub_1AD9DD940()
{
  return MEMORY[0x1F40D5BE8]();
}

uint64_t sub_1AD9DD950()
{
  return MEMORY[0x1F40D5BF0]();
}

uint64_t sub_1AD9DD960()
{
  return MEMORY[0x1F40D5BF8]();
}

uint64_t sub_1AD9DD970()
{
  return MEMORY[0x1F40D5C60]();
}

uint64_t sub_1AD9DD980()
{
  return MEMORY[0x1F40D5C80]();
}

uint64_t sub_1AD9DD990()
{
  return MEMORY[0x1F40D5C88]();
}

uint64_t sub_1AD9DD9A0()
{
  return MEMORY[0x1F40D5C98]();
}

uint64_t sub_1AD9DD9B0()
{
  return MEMORY[0x1F40D5CB0]();
}

uint64_t sub_1AD9DD9C0()
{
  return MEMORY[0x1F40D5CB8]();
}

uint64_t sub_1AD9DD9D0()
{
  return MEMORY[0x1F40D5CE8]();
}

uint64_t sub_1AD9DD9E0()
{
  return MEMORY[0x1F40D6668]();
}

uint64_t sub_1AD9DD9F0()
{
  return MEMORY[0x1F40D6670]();
}

uint64_t sub_1AD9DDA00()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t sub_1AD9DDA10()
{
  return MEMORY[0x1F40D6740]();
}

uint64_t sub_1AD9DDA20()
{
  return MEMORY[0x1F40D6788]();
}

uint64_t sub_1AD9DDA30()
{
  return MEMORY[0x1F40D6790]();
}

uint64_t sub_1AD9DDA40()
{
  return MEMORY[0x1F40D6878]();
}

uint64_t sub_1AD9DDA50()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t sub_1AD9DDA60()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1AD9DDA70()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1AD9DDA80()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1AD9DDA90()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1AD9DDAA0()
{
  return MEMORY[0x1F40F7D68]();
}

uint64_t sub_1AD9DDAB0()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1AD9DDAC0()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1AD9DDAD0()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1AD9DDAE0()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1AD9DDAF0()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1AD9DDB00()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1AD9DDB10()
{
  return MEMORY[0x1F40D6A58]();
}

uint64_t sub_1AD9DDB20()
{
  return MEMORY[0x1F40D6A68]();
}

uint64_t sub_1AD9DDB30()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1AD9DDB40()
{
  return MEMORY[0x1F40D6A80]();
}

uint64_t sub_1AD9DDB50()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1AD9DDB60()
{
  return MEMORY[0x1F40D6AC0]();
}

uint64_t sub_1AD9DDB70()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1AD9DDB80()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1AD9DDB90()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1AD9DDBA0()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1AD9DDBB0()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1AD9DDBC0()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1AD9DDBD0()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1AD9DDBE0()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1AD9DDBF0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1AD9DDC00()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1AD9DDC10()
{
  return MEMORY[0x1F40D6CD0]();
}

uint64_t sub_1AD9DDC20()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1AD9DDC30()
{
  return MEMORY[0x1F40D6DB8]();
}

uint64_t sub_1AD9DDC40()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1AD9DDC50()
{
  return MEMORY[0x1F40F7D70]();
}

uint64_t sub_1AD9DDC70()
{
  return MEMORY[0x1F40F7D80]();
}

uint64_t sub_1AD9DDC80()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_1AD9DDC90()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_1AD9DDCA0()
{
  return MEMORY[0x1F40F7E30]();
}

uint64_t sub_1AD9DDCB0()
{
  return MEMORY[0x1F40F7E40]();
}

uint64_t sub_1AD9DDCC0()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1AD9DDCD0()
{
  return MEMORY[0x1F40F7F50]();
}

uint64_t sub_1AD9DDCE0()
{
  return MEMORY[0x1F40F7F60]();
}

uint64_t sub_1AD9DDCF0()
{
  return MEMORY[0x1F40F7FF8]();
}

uint64_t sub_1AD9DDD00()
{
  return MEMORY[0x1F40F8000]();
}

uint64_t sub_1AD9DDD10()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_1AD9DDD20()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1AD9DDD30()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1AD9DDD40()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1AD9DDD50()
{
  return MEMORY[0x1F40F81D8]();
}

uint64_t sub_1AD9DDD60()
{
  return MEMORY[0x1F40F81E0]();
}

uint64_t sub_1AD9DDD70()
{
  return MEMORY[0x1F40F81F0]();
}

uint64_t sub_1AD9DDD80()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1AD9DDD90()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1AD9DDDA0()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1AD9DDDB0()
{
  return MEMORY[0x1F40F8390]();
}

uint64_t sub_1AD9DDDC0()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1AD9DDDD0()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_1AD9DDDE0()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1AD9DDDF0()
{
  return MEMORY[0x1F40F84E8]();
}

uint64_t sub_1AD9DDE00()
{
  return MEMORY[0x1F40F8550]();
}

uint64_t sub_1AD9DDE10()
{
  return MEMORY[0x1F40F8560]();
}

uint64_t sub_1AD9DDE20()
{
  return MEMORY[0x1F40F8578]();
}

uint64_t sub_1AD9DDE40()
{
  return MEMORY[0x1F40F85A8]();
}

uint64_t sub_1AD9DDE50()
{
  return MEMORY[0x1F40F85B8]();
}

uint64_t sub_1AD9DDE60()
{
  return MEMORY[0x1F40F85C8]();
}

uint64_t sub_1AD9DDE70()
{
  return MEMORY[0x1F40F85D8]();
}

uint64_t sub_1AD9DDE80()
{
  return MEMORY[0x1F40F8608]();
}

uint64_t sub_1AD9DDE90()
{
  return MEMORY[0x1F40F8610]();
}

uint64_t sub_1AD9DDEA0()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1AD9DDEB0()
{
  return MEMORY[0x1F40F8638]();
}

uint64_t sub_1AD9DDEC0()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1AD9DDEE0()
{
  return MEMORY[0x1F40F86E8]();
}

uint64_t sub_1AD9DDEF0()
{
  return MEMORY[0x1F40F8728]();
}

uint64_t sub_1AD9DDF00()
{
  return MEMORY[0x1F40F8748]();
}

uint64_t sub_1AD9DDF10()
{
  return MEMORY[0x1F40F8770]();
}

uint64_t sub_1AD9DDF20()
{
  return MEMORY[0x1F40F87A8]();
}

uint64_t sub_1AD9DDF30()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1AD9DDF50()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1AD9DDF60()
{
  return MEMORY[0x1F40F8AD8]();
}

uint64_t sub_1AD9DDF70()
{
  return MEMORY[0x1F40F8B18]();
}

uint64_t sub_1AD9DDF80()
{
  return MEMORY[0x1F40F8B38]();
}

uint64_t sub_1AD9DDF90()
{
  return MEMORY[0x1F40F8B40]();
}

uint64_t sub_1AD9DDFA0()
{
  return MEMORY[0x1F40F8B90]();
}

uint64_t sub_1AD9DDFB0()
{
  return MEMORY[0x1F40F8BB8]();
}

uint64_t sub_1AD9DDFC0()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1AD9DDFD0()
{
  return MEMORY[0x1F40F8D80]();
}

uint64_t sub_1AD9DDFE0()
{
  return MEMORY[0x1F40F8D88]();
}

uint64_t sub_1AD9DDFF0()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_1AD9DE000()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_1AD9DE010()
{
  return MEMORY[0x1F40F8E18]();
}

uint64_t sub_1AD9DE020()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1AD9DE030()
{
  return MEMORY[0x1F40F8ED8]();
}

uint64_t sub_1AD9DE040()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1AD9DE050()
{
  return MEMORY[0x1F40F8F68]();
}

uint64_t sub_1AD9DE060()
{
  return MEMORY[0x1F40F8FF8]();
}

uint64_t sub_1AD9DE070()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_1AD9DE080()
{
  return MEMORY[0x1F40F90C8]();
}

uint64_t sub_1AD9DE090()
{
  return MEMORY[0x1F40F90E0]();
}

uint64_t sub_1AD9DE0A0()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1AD9DE0B0()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_1AD9DE0C0()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1AD9DE0D0()
{
  return MEMORY[0x1F40F91E0]();
}

uint64_t sub_1AD9DE0E0()
{
  return MEMORY[0x1F40F91F8]();
}

uint64_t sub_1AD9DE0F0()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1AD9DE100()
{
  return MEMORY[0x1F40F9278]();
}

uint64_t sub_1AD9DE110()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1AD9DE120()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1AD9DE130()
{
  return MEMORY[0x1F40F9340]();
}

uint64_t sub_1AD9DE140()
{
  return MEMORY[0x1F40F9388]();
}

uint64_t sub_1AD9DE150()
{
  return MEMORY[0x1F40F9390]();
}

uint64_t sub_1AD9DE160()
{
  return MEMORY[0x1F40F93C0]();
}

uint64_t sub_1AD9DE170()
{
  return MEMORY[0x1F40F93D0]();
}

uint64_t sub_1AD9DE180()
{
  return MEMORY[0x1F40F93D8]();
}

uint64_t sub_1AD9DE190()
{
  return MEMORY[0x1F40F9460]();
}

uint64_t sub_1AD9DE1A0()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_1AD9DE1B0()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_1AD9DE1C0()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1AD9DE1D0()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1AD9DE1E0()
{
  return MEMORY[0x1F40F95C0]();
}

uint64_t sub_1AD9DE1F0()
{
  return MEMORY[0x1F40F95C8]();
}

uint64_t sub_1AD9DE200()
{
  return MEMORY[0x1F40F9618]();
}

uint64_t sub_1AD9DE210()
{
  return MEMORY[0x1F40F9628]();
}

uint64_t sub_1AD9DE220()
{
  return MEMORY[0x1F4103EE8]();
}

uint64_t sub_1AD9DE230()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1AD9DE240()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1AD9DE250()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1AD9DE260()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1AD9DE270()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_1AD9DE280()
{
  return MEMORY[0x1F40F9708]();
}

uint64_t sub_1AD9DE290()
{
  return MEMORY[0x1F40F97D8]();
}

uint64_t sub_1AD9DE2A0()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_1AD9DE2B0()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1AD9DE2C0()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1AD9DE2D0()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1AD9DE2E0()
{
  return MEMORY[0x1F40F9BB0]();
}

uint64_t sub_1AD9DE2F0()
{
  return MEMORY[0x1F40F9C10]();
}

uint64_t sub_1AD9DE300()
{
  return MEMORY[0x1F40F9C58]();
}

uint64_t sub_1AD9DE310()
{
  return MEMORY[0x1F40F9C70]();
}

uint64_t sub_1AD9DE320()
{
  return MEMORY[0x1F40F9C78]();
}

uint64_t sub_1AD9DE330()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1AD9DE340()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1AD9DE350()
{
  return MEMORY[0x1F40F9DE0]();
}

uint64_t sub_1AD9DE360()
{
  return MEMORY[0x1F40F9E08]();
}

uint64_t sub_1AD9DE370()
{
  return MEMORY[0x1F40F9E40]();
}

uint64_t sub_1AD9DE380()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1AD9DE390()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1AD9DE3A0()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1AD9DE3C0()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1AD9DE3D0()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1AD9DE3E0()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1AD9DE3F0()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1AD9DE400()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1AD9DE410()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1AD9DE430()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1AD9DE440()
{
  return MEMORY[0x1F40F9F80]();
}

uint64_t sub_1AD9DE450()
{
  return MEMORY[0x1F40F9F88]();
}

uint64_t sub_1AD9DE460()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1AD9DE470()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1AD9DE480()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1AD9DE490()
{
  return MEMORY[0x1F40FA0B0]();
}

uint64_t sub_1AD9DE4A0()
{
  return MEMORY[0x1F40FA0C0]();
}

uint64_t sub_1AD9DE4B0()
{
  return MEMORY[0x1F40FA2A8]();
}

uint64_t sub_1AD9DE4C0()
{
  return MEMORY[0x1F40FA2D8]();
}

uint64_t sub_1AD9DE4D0()
{
  return MEMORY[0x1F40FA340]();
}

uint64_t sub_1AD9DE4E0()
{
  return MEMORY[0x1F40FA348]();
}

uint64_t sub_1AD9DE4F0()
{
  return MEMORY[0x1F40FA350]();
}

uint64_t sub_1AD9DE500()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1AD9DE510()
{
  return MEMORY[0x1F40FA3C0]();
}

uint64_t sub_1AD9DE520()
{
  return MEMORY[0x1F40FA450]();
}

uint64_t sub_1AD9DE530()
{
  return MEMORY[0x1F40FA458]();
}

uint64_t sub_1AD9DE540()
{
  return MEMORY[0x1F40FA4F8]();
}

uint64_t sub_1AD9DE550()
{
  return MEMORY[0x1F40FA500]();
}

uint64_t sub_1AD9DE560()
{
  return MEMORY[0x1F40FA508]();
}

uint64_t sub_1AD9DE570()
{
  return MEMORY[0x1F40FA518]();
}

uint64_t sub_1AD9DE580()
{
  return MEMORY[0x1F40FA528]();
}

uint64_t sub_1AD9DE590()
{
  return MEMORY[0x1F40FA5A0]();
}

uint64_t sub_1AD9DE5A0()
{
  return MEMORY[0x1F40FA5A8]();
}

uint64_t sub_1AD9DE5B0()
{
  return MEMORY[0x1F40FA5B8]();
}

uint64_t sub_1AD9DE5C0()
{
  return MEMORY[0x1F40FA5D0]();
}

uint64_t sub_1AD9DE5D0()
{
  return MEMORY[0x1F40FA7D0]();
}

uint64_t sub_1AD9DE5E0()
{
  return MEMORY[0x1F40FA838]();
}

uint64_t sub_1AD9DE5F0()
{
  return MEMORY[0x1F40FA860]();
}

uint64_t sub_1AD9DE600()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1AD9DE610()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1AD9DE620()
{
  return MEMORY[0x1F40FA8C0]();
}

uint64_t sub_1AD9DE630()
{
  return MEMORY[0x1F40FA8D8]();
}

uint64_t sub_1AD9DE640()
{
  return MEMORY[0x1F40FA8F0]();
}

uint64_t sub_1AD9DE650()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1AD9DE660()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1AD9DE670()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_1AD9DE690()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1AD9DE6A0()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1AD9DE6B0()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1AD9DE6D0()
{
  return MEMORY[0x1F40FABE0]();
}

uint64_t sub_1AD9DE6E0()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1AD9DE6F0()
{
  return MEMORY[0x1F40FAC40]();
}

uint64_t sub_1AD9DE700()
{
  return MEMORY[0x1F40FAC50]();
}

uint64_t sub_1AD9DE710()
{
  return MEMORY[0x1F40FAD00]();
}

uint64_t sub_1AD9DE720()
{
  return MEMORY[0x1F40FAD08]();
}

uint64_t sub_1AD9DE730()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1AD9DE740()
{
  return MEMORY[0x1F40FAD78]();
}

uint64_t sub_1AD9DE750()
{
  return MEMORY[0x1F40FAD88]();
}

uint64_t sub_1AD9DE760()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_1AD9DE770()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1AD9DE780()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1AD9DE790()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1AD9DE7A0()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1AD9DE7B0()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1AD9DE7C0()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1AD9DE7D0()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1AD9DE7F0()
{
  return MEMORY[0x1F416A9E0]();
}

uint64_t sub_1AD9DE800()
{
  return MEMORY[0x1F40FAE58]();
}

uint64_t sub_1AD9DE810()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1AD9DE820()
{
  return MEMORY[0x1F40FAEB8]();
}

uint64_t sub_1AD9DE830()
{
  return MEMORY[0x1F40FAEC0]();
}

uint64_t sub_1AD9DE840()
{
  return MEMORY[0x1F40FAEC8]();
}

uint64_t sub_1AD9DE850()
{
  return MEMORY[0x1F40FAEE8]();
}

uint64_t sub_1AD9DE860()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1AD9DE870()
{
  return MEMORY[0x1F40FAF08]();
}

uint64_t sub_1AD9DE880()
{
  return MEMORY[0x1F40FAF18]();
}

uint64_t sub_1AD9DE890()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1AD9DE8A0()
{
  return MEMORY[0x1F40FAFC0]();
}

uint64_t sub_1AD9DE8B0()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_1AD9DE8C0()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1AD9DE8D0()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1AD9DE8E0()
{
  return MEMORY[0x1F40FB040]();
}

uint64_t sub_1AD9DE8F0()
{
  return MEMORY[0x1F40FB050]();
}

uint64_t sub_1AD9DE900()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1AD9DE910()
{
  return MEMORY[0x1F40FB078]();
}

uint64_t sub_1AD9DE920()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1AD9DE930()
{
  return MEMORY[0x1F40FB0B8]();
}

uint64_t sub_1AD9DE940()
{
  return MEMORY[0x1F40FB0C8]();
}

uint64_t sub_1AD9DE950()
{
  return MEMORY[0x1F40FB0D0]();
}

uint64_t sub_1AD9DE960()
{
  return MEMORY[0x1F40FB0E8]();
}

uint64_t sub_1AD9DE970()
{
  return MEMORY[0x1F40FB0F8]();
}

uint64_t sub_1AD9DE980()
{
  return MEMORY[0x1F40FB108]();
}

uint64_t sub_1AD9DE990()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1AD9DE9A0()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_1AD9DE9B0()
{
  return MEMORY[0x1F40FB158]();
}

uint64_t sub_1AD9DE9C0()
{
  return MEMORY[0x1F40FB198]();
}

uint64_t sub_1AD9DE9D0()
{
  return MEMORY[0x1F40FB1A0]();
}

uint64_t sub_1AD9DE9E0()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1AD9DE9F0()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_1AD9DEA00()
{
  return MEMORY[0x1F40FB230]();
}

uint64_t sub_1AD9DEA10()
{
  return MEMORY[0x1F40FB280]();
}

uint64_t sub_1AD9DEA20()
{
  return MEMORY[0x1F40FB2A0]();
}

uint64_t sub_1AD9DEA30()
{
  return MEMORY[0x1F40FB2D0]();
}

uint64_t sub_1AD9DEA40()
{
  return MEMORY[0x1F40FB2E8]();
}

uint64_t sub_1AD9DEA50()
{
  return MEMORY[0x1F40FB2F0]();
}

uint64_t sub_1AD9DEA60()
{
  return MEMORY[0x1F40FB310]();
}

uint64_t sub_1AD9DEA70()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1AD9DEA80()
{
  return MEMORY[0x1F40FB3E8]();
}

uint64_t sub_1AD9DEA90()
{
  return MEMORY[0x1F40FB408]();
}

uint64_t sub_1AD9DEAA0()
{
  return MEMORY[0x1F40FB438]();
}

uint64_t sub_1AD9DEAB0()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1AD9DEAC0()
{
  return MEMORY[0x1F40FB4C8]();
}

uint64_t sub_1AD9DEAD0()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1AD9DEAE0()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1AD9DEAF0()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1AD9DEB00()
{
  return MEMORY[0x1F40FB598]();
}

uint64_t sub_1AD9DEB10()
{
  return MEMORY[0x1F411EE00]();
}

uint64_t sub_1AD9DEB20()
{
  return MEMORY[0x1F40D5CF8]();
}

uint64_t sub_1AD9DEB30()
{
  return MEMORY[0x1F40D5D08]();
}

uint64_t sub_1AD9DEB40()
{
  return MEMORY[0x1F40D5D20]();
}

uint64_t sub_1AD9DEB50()
{
  return MEMORY[0x1F40D5D28]();
}

uint64_t sub_1AD9DEB60()
{
  return MEMORY[0x1F40D5D38]();
}

uint64_t sub_1AD9DEB70()
{
  return MEMORY[0x1F40D5D40]();
}

uint64_t sub_1AD9DEB80()
{
  return MEMORY[0x1F40D5D58]();
}

uint64_t sub_1AD9DEB90()
{
  return MEMORY[0x1F40D5D80]();
}

uint64_t sub_1AD9DEBA0()
{
  return MEMORY[0x1F40D5D88]();
}

uint64_t sub_1AD9DEBB0()
{
  return MEMORY[0x1F41040E8]();
}

uint64_t sub_1AD9DEBC0()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1AD9DEBD0()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1AD9DEBE0()
{
  return MEMORY[0x1F40FB628]();
}

uint64_t sub_1AD9DEBF0()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_1AD9DEC00()
{
  return MEMORY[0x1F40FB660]();
}

uint64_t sub_1AD9DEC10()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1AD9DEC20()
{
  return MEMORY[0x1F40FB720]();
}

uint64_t sub_1AD9DEC30()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1AD9DEC40()
{
  return MEMORY[0x1F40FB890]();
}

uint64_t sub_1AD9DEC50()
{
  return MEMORY[0x1F40FB8A0]();
}

uint64_t sub_1AD9DEC60()
{
  return MEMORY[0x1F40FB8B0]();
}

uint64_t sub_1AD9DEC70()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1AD9DEC80()
{
  return MEMORY[0x1F40FB9D8]();
}

uint64_t sub_1AD9DEC90()
{
  return MEMORY[0x1F40FBA50]();
}

uint64_t sub_1AD9DECA0()
{
  return MEMORY[0x1F40FBA60]();
}

uint64_t sub_1AD9DECB0()
{
  return MEMORY[0x1F40FBA98]();
}

uint64_t sub_1AD9DECC0()
{
  return MEMORY[0x1F40FBB30]();
}

uint64_t sub_1AD9DECD0()
{
  return MEMORY[0x1F40FBB98]();
}

uint64_t sub_1AD9DECE0()
{
  return MEMORY[0x1F40FBC68]();
}

uint64_t sub_1AD9DECF0()
{
  return MEMORY[0x1F40FBC70]();
}

uint64_t sub_1AD9DED00()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1AD9DED10()
{
  return MEMORY[0x1F40FBD88]();
}

uint64_t sub_1AD9DED20()
{
  return MEMORY[0x1F40FBDF8]();
}

uint64_t sub_1AD9DED30()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1AD9DED40()
{
  return MEMORY[0x1F40FBF20]();
}

uint64_t sub_1AD9DED50()
{
  return MEMORY[0x1F40FBF98]();
}

uint64_t sub_1AD9DED60()
{
  return MEMORY[0x1F40FBFE8]();
}

uint64_t sub_1AD9DED70()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_1AD9DED80()
{
  return MEMORY[0x1F40FC018]();
}

uint64_t sub_1AD9DED90()
{
  return MEMORY[0x1F40FC048]();
}

uint64_t sub_1AD9DEDA0()
{
  return MEMORY[0x1F40FC0B0]();
}

uint64_t sub_1AD9DEDB0()
{
  return MEMORY[0x1F40FC0C8]();
}

uint64_t sub_1AD9DEDC0()
{
  return MEMORY[0x1F40FC0D8]();
}

uint64_t sub_1AD9DEDD0()
{
  return MEMORY[0x1F40FC0F0]();
}

uint64_t sub_1AD9DEDE0()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1AD9DEDF0()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_1AD9DEE00()
{
  return MEMORY[0x1F40FC1D8]();
}

uint64_t sub_1AD9DEE10()
{
  return MEMORY[0x1F40FC260]();
}

uint64_t sub_1AD9DEE20()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1AD9DEE30()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_1AD9DEE40()
{
  return MEMORY[0x1F40FC338]();
}

uint64_t sub_1AD9DEE50()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_1AD9DEE60()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_1AD9DEE70()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_1AD9DEE80()
{
  return MEMORY[0x1F40FC388]();
}

uint64_t sub_1AD9DEE90()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1AD9DEEA0()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1AD9DEEB0()
{
  return MEMORY[0x1F40FC3E0]();
}

uint64_t sub_1AD9DEEC0()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1AD9DEED0()
{
  return MEMORY[0x1F40FC420]();
}

uint64_t sub_1AD9DEEE0()
{
  return MEMORY[0x1F40FC428]();
}

uint64_t sub_1AD9DEEF0()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_1AD9DEF00()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1AD9DEF10()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_1AD9DEF20()
{
  return MEMORY[0x1F40FC4A8]();
}

uint64_t sub_1AD9DEF30()
{
  return MEMORY[0x1F40FC520]();
}

uint64_t sub_1AD9DEF40()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1AD9DEF50()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1AD9DEF60()
{
  return MEMORY[0x1F40FC580]();
}

uint64_t sub_1AD9DEF70()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1AD9DEF80()
{
  return MEMORY[0x1F40FC5B8]();
}

uint64_t sub_1AD9DEF90()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1AD9DEFA0()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1AD9DEFB0()
{
  return MEMORY[0x1F40FC600]();
}

uint64_t sub_1AD9DEFC0()
{
  return MEMORY[0x1F40FC620]();
}

uint64_t sub_1AD9DEFD0()
{
  return MEMORY[0x1F40FC658]();
}

uint64_t sub_1AD9DF000()
{
  return MEMORY[0x1F40FC6A0]();
}

uint64_t sub_1AD9DF020()
{
  return MEMORY[0x1F40FC6C8]();
}

uint64_t sub_1AD9DF040()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1AD9DF050()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1AD9DF060()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1AD9DF070()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1AD9DF080()
{
  return MEMORY[0x1F40FC728]();
}

uint64_t sub_1AD9DF090()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1AD9DF0A0()
{
  return MEMORY[0x1F40FC778]();
}

uint64_t sub_1AD9DF0B0()
{
  return MEMORY[0x1F40FC790]();
}

uint64_t sub_1AD9DF0C0()
{
  return MEMORY[0x1F40FC7A0]();
}

uint64_t sub_1AD9DF0D0()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_1AD9DF0E0()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_1AD9DF0F0()
{
  return MEMORY[0x1F40FC7E0]();
}

uint64_t sub_1AD9DF100()
{
  return MEMORY[0x1F40FC7E8]();
}

uint64_t sub_1AD9DF110()
{
  return MEMORY[0x1F40FC7F8]();
}

uint64_t sub_1AD9DF120()
{
  return MEMORY[0x1F40FC808]();
}

uint64_t sub_1AD9DF130()
{
  return MEMORY[0x1F40FC820]();
}

uint64_t sub_1AD9DF140()
{
  return MEMORY[0x1F40FC830]();
}

uint64_t sub_1AD9DF150()
{
  return MEMORY[0x1F40FC8A8]();
}

uint64_t sub_1AD9DF160()
{
  return MEMORY[0x1F40FC8B0]();
}

uint64_t sub_1AD9DF170()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_1AD9DF180()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1AD9DF190()
{
  return MEMORY[0x1F40FC8E0]();
}

uint64_t sub_1AD9DF1A0()
{
  return MEMORY[0x1F40FC8E8]();
}

uint64_t sub_1AD9DF1B0()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1AD9DF1C0()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1AD9DF1D0()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1AD9DF1E0()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_1AD9DF1F0()
{
  return MEMORY[0x1F40FC950]();
}

uint64_t sub_1AD9DF200()
{
  return MEMORY[0x1F40FC970]();
}

uint64_t sub_1AD9DF210()
{
  return MEMORY[0x1F40FC980]();
}

uint64_t sub_1AD9DF220()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1AD9DF230()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1AD9DF240()
{
  return MEMORY[0x1F40D5D90]();
}

uint64_t sub_1AD9DF250()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1AD9DF260()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1AD9DF270()
{
  return MEMORY[0x1F40FC9E0]();
}

uint64_t sub_1AD9DF280()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1AD9DF290()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_1AD9DF2A0()
{
  return MEMORY[0x1F40FCA48]();
}

uint64_t sub_1AD9DF2B0()
{
  return MEMORY[0x1F40FCA58]();
}

uint64_t sub_1AD9DF2C0()
{
  return MEMORY[0x1F40FCB30]();
}

uint64_t sub_1AD9DF2D0()
{
  return MEMORY[0x1F40FCB38]();
}

uint64_t sub_1AD9DF2E0()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_1AD9DF2F0()
{
  return MEMORY[0x1F40FCBB8]();
}

uint64_t sub_1AD9DF300()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_1AD9DF310()
{
  return MEMORY[0x1F40FCC20]();
}

uint64_t sub_1AD9DF320()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1AD9DF330()
{
  return MEMORY[0x1F40FCCE0]();
}

uint64_t sub_1AD9DF340()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_1AD9DF350()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_1AD9DF360()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_1AD9DF370()
{
  return MEMORY[0x1F40FCE88]();
}

uint64_t sub_1AD9DF380()
{
  return MEMORY[0x1F40FCE90]();
}

uint64_t sub_1AD9DF390()
{
  return MEMORY[0x1F40FCEB0]();
}

uint64_t sub_1AD9DF3A0()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_1AD9DF3B0()
{
  return MEMORY[0x1F40FCEE0]();
}

uint64_t sub_1AD9DF3C0()
{
  return MEMORY[0x1F40FCEE8]();
}

uint64_t sub_1AD9DF3D0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1AD9DF3E0()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1AD9DF3F0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1AD9DF400()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1AD9DF410()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1AD9DF420()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1AD9DF430()
{
  return MEMORY[0x1F4121478]();
}

uint64_t sub_1AD9DF440()
{
  return MEMORY[0x1F40E7808]();
}

uint64_t sub_1AD9DF450()
{
  return MEMORY[0x1F40E7818]();
}

uint64_t sub_1AD9DF460()
{
  return MEMORY[0x1F40E7820]();
}

uint64_t sub_1AD9DF470()
{
  return MEMORY[0x1F40E7828]();
}

uint64_t sub_1AD9DF480()
{
  return MEMORY[0x1F40E7910]();
}

uint64_t sub_1AD9DF490()
{
  return MEMORY[0x1F40E7920]();
}

uint64_t sub_1AD9DF4A0()
{
  return MEMORY[0x1F40E7930]();
}

uint64_t sub_1AD9DF4B0()
{
  return MEMORY[0x1F416A9F8]();
}

uint64_t sub_1AD9DF4C0()
{
  return MEMORY[0x1F416AA00]();
}

uint64_t sub_1AD9DF4D0()
{
  return MEMORY[0x1F416AA10]();
}

uint64_t sub_1AD9DF4E0()
{
  return MEMORY[0x1F416AA18]();
}

uint64_t sub_1AD9DF4F0()
{
  return MEMORY[0x1F416AA20]();
}

uint64_t sub_1AD9DF500()
{
  return MEMORY[0x1F416AA28]();
}

uint64_t sub_1AD9DF510()
{
  return MEMORY[0x1F416AA30]();
}

uint64_t sub_1AD9DF520()
{
  return MEMORY[0x1F416AA38]();
}

uint64_t sub_1AD9DF530()
{
  return MEMORY[0x1F416AA40]();
}

uint64_t sub_1AD9DF540()
{
  return MEMORY[0x1F416AA48]();
}

uint64_t sub_1AD9DF550()
{
  return MEMORY[0x1F416AA50]();
}

uint64_t sub_1AD9DF560()
{
  return MEMORY[0x1F416AA70]();
}

uint64_t sub_1AD9DF570()
{
  return MEMORY[0x1F416AA80]();
}

uint64_t sub_1AD9DF580()
{
  return MEMORY[0x1F416AA88]();
}

uint64_t sub_1AD9DF590()
{
  return MEMORY[0x1F416AA98]();
}

uint64_t sub_1AD9DF5A0()
{
  return MEMORY[0x1F416AAA0]();
}

uint64_t sub_1AD9DF5B0()
{
  return MEMORY[0x1F416AAA8]();
}

uint64_t sub_1AD9DF5C0()
{
  return MEMORY[0x1F416AAB0]();
}

uint64_t sub_1AD9DF5D0()
{
  return MEMORY[0x1F416AAB8]();
}

uint64_t sub_1AD9DF5E0()
{
  return MEMORY[0x1F416AAC8]();
}

uint64_t sub_1AD9DF5F0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1AD9DF600()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1AD9DF610()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1AD9DF620()
{
  return MEMORY[0x1F4183520]();
}

uint64_t sub_1AD9DF630()
{
  return MEMORY[0x1F4183570]();
}

uint64_t sub_1AD9DF640()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1AD9DF650()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1AD9DF660()
{
  return MEMORY[0x1F4183630]();
}

uint64_t sub_1AD9DF670()
{
  return MEMORY[0x1F4183690]();
}

uint64_t sub_1AD9DF680()
{
  return MEMORY[0x1F41836A8]();
}

uint64_t sub_1AD9DF690()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1AD9DF6A0()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1AD9DF6B0()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1AD9DF6C0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1AD9DF6D0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1AD9DF6E0()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1AD9DF6F0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1AD9DF700()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1AD9DF710()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1AD9DF720()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1AD9DF730()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1AD9DF740()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1AD9DF750()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1AD9DF760()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1AD9DF770()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1AD9DF780()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1AD9DF790()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1AD9DF7A0()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1AD9DF7B0()
{
  return MEMORY[0x1F4121488]();
}

uint64_t sub_1AD9DF7C0()
{
  return MEMORY[0x1F4121490]();
}

uint64_t sub_1AD9DF7D0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1AD9DF7E0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1AD9DF7F0()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1AD9DF800()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1AD9DF810()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1AD9DF820()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1AD9DF830()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1AD9DF840()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1AD9DF850()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1AD9DF860()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1AD9DF870()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1AD9DF880()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1AD9DF890()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1AD9DF8A0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1AD9DF8B0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1AD9DF8C0()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1AD9DF8D0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1AD9DF8E0()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1AD9DF8F0()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1AD9DF900()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1AD9DF910()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1AD9DF920()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1AD9DF930()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1AD9DF940()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1AD9DF950()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1AD9DF960()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1AD9DF970()
{
  return MEMORY[0x1F4184018]();
}

uint64_t sub_1AD9DF980()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1AD9DF9A0()
{
  return MEMORY[0x1F4184098]();
}

uint64_t sub_1AD9DF9B0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1AD9DF9C0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1AD9DF9D0()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1AD9DF9E0()
{
  return MEMORY[0x1F4184180]();
}

uint64_t sub_1AD9DF9F0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1AD9DFA00()
{
  return MEMORY[0x1F4184278]();
}

uint64_t sub_1AD9DFA10()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1AD9DFA20()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1AD9DFA30()
{
  return MEMORY[0x1F4184318]();
}

uint64_t sub_1AD9DFA40()
{
  return MEMORY[0x1F4184320]();
}

uint64_t sub_1AD9DFA50()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1AD9DFA60()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1AD9DFA70()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1AD9DFA80()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1AD9DFA90()
{
  return MEMORY[0x1F4184418]();
}

uint64_t sub_1AD9DFAA0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1AD9DFAB0()
{
  return MEMORY[0x1F40E64D0]();
}

uint64_t sub_1AD9DFAC0()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1AD9DFAD0()
{
  return MEMORY[0x1F40D9658]();
}

uint64_t sub_1AD9DFAE0()
{
  return MEMORY[0x1F411EE38]();
}

uint64_t sub_1AD9DFAF0()
{
  return MEMORY[0x1F411EE40]();
}

uint64_t sub_1AD9DFB00()
{
  return MEMORY[0x1F411EE48]();
}

uint64_t sub_1AD9DFB10()
{
  return MEMORY[0x1F411EE50]();
}

uint64_t sub_1AD9DFB20()
{
  return MEMORY[0x1F411EE58]();
}

uint64_t sub_1AD9DFB30()
{
  return MEMORY[0x1F411EE60]();
}

uint64_t sub_1AD9DFB40()
{
  return MEMORY[0x1F411EE68]();
}

uint64_t sub_1AD9DFB50()
{
  return MEMORY[0x1F411EE70]();
}

uint64_t sub_1AD9DFB60()
{
  return MEMORY[0x1F411EE78]();
}

uint64_t sub_1AD9DFB70()
{
  return MEMORY[0x1F411EE80]();
}

uint64_t sub_1AD9DFB80()
{
  return MEMORY[0x1F411EE88]();
}

uint64_t sub_1AD9DFB90()
{
  return MEMORY[0x1F411EE90]();
}

uint64_t sub_1AD9DFBA0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1AD9DFBB0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1AD9DFBC0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1AD9DFBD0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1AD9DFBE0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1AD9DFBF0()
{
  return MEMORY[0x1F40E7968]();
}

uint64_t sub_1AD9DFC00()
{
  return MEMORY[0x1F40E7970]();
}

uint64_t sub_1AD9DFC10()
{
  return MEMORY[0x1F40E7978]();
}

uint64_t sub_1AD9DFC20()
{
  return MEMORY[0x1F41664E8]();
}

uint64_t sub_1AD9DFC30()
{
  return MEMORY[0x1F4166500]();
}

uint64_t sub_1AD9DFC40()
{
  return MEMORY[0x1F4120D90]();
}

uint64_t sub_1AD9DFC60()
{
  return MEMORY[0x1F411EEE0]();
}

uint64_t sub_1AD9DFC70()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1AD9DFC80()
{
  return MEMORY[0x1F416AAD8]();
}

uint64_t sub_1AD9DFC90()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1AD9DFCA0()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1AD9DFCB0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1AD9DFCC0()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1AD9DFCD0()
{
  return MEMORY[0x1F41214C0]();
}

uint64_t sub_1AD9DFCE0()
{
  return MEMORY[0x1F41214C8]();
}

uint64_t sub_1AD9DFCF0()
{
  return MEMORY[0x1F41214D0]();
}

uint64_t sub_1AD9DFD00()
{
  return MEMORY[0x1F41214E0]();
}

uint64_t sub_1AD9DFD10()
{
  return MEMORY[0x1F4166630]();
}

uint64_t sub_1AD9DFD20()
{
  return MEMORY[0x1F411EF00]();
}

uint64_t sub_1AD9DFD30()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1AD9DFD40()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1AD9DFD50()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1AD9DFD60()
{
  return MEMORY[0x1F41666A0]();
}

uint64_t sub_1AD9DFD70()
{
  return MEMORY[0x1F41214F0]();
}

uint64_t sub_1AD9DFD80()
{
  return MEMORY[0x1F411EF20]();
}

uint64_t sub_1AD9DFD90()
{
  return MEMORY[0x1F41667E8]();
}

uint64_t sub_1AD9DFDA0()
{
  return MEMORY[0x1F40E68B0]();
}

uint64_t sub_1AD9DFDB0()
{
  return MEMORY[0x1F40E68C8]();
}

uint64_t sub_1AD9DFDC0()
{
  return MEMORY[0x1F40E68D8]();
}

uint64_t sub_1AD9DFDD0()
{
  return MEMORY[0x1F40FCF28]();
}

uint64_t sub_1AD9DFDE0()
{
  return MEMORY[0x1F411EF68]();
}

uint64_t sub_1AD9DFDF0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1AD9DFE00()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1AD9DFE10()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1AD9DFE20()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1AD9DFE30()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1AD9DFE40()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1AD9DFE50()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1AD9DFE60()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1AD9DFE70()
{
  return MEMORY[0x1F4121510]();
}

uint64_t sub_1AD9DFE80()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1AD9DFE90()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1AD9DFEA0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1AD9DFEB0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1AD9DFEC0()
{
  return MEMORY[0x1F4184830]();
}

uint64_t sub_1AD9DFED0()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1AD9DFEE0()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1AD9DFEF0()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1AD9DFF00()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1AD9DFF10()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t sub_1AD9DFF20()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1AD9DFF40()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1AD9DFF50()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1AD9DFF60()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1AD9DFF70()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1AD9DFF80()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1AD9DFF90()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1AD9DFFA0()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1AD9DFFB0()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1AD9DFFC0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1AD9DFFD0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1AD9DFFE0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1AD9DFFF0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1AD9E0000()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1AD9E0010()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1AD9E0020()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1AD9E0030()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1AD9E0040()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1AD9E0050()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1AD9E0060()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1AD9E0070()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1AD9E0080()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1AD9E0090()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1AD9E00A0()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1AD9E00B0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1AD9E00C0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1AD9E00D0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1AD9E00E0()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1AD9E00F0()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1AD9E0100()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1AD9E0110()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1AD9E0120()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1AD9E0130()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1AD9E0140()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1AD9E0150()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1AD9E0160()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1AD9E0170()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1AD9E0180()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1AD9E0190()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1AD9E01A0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1AD9E01B0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1AD9E01C0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1AD9E01D0()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1AD9E01E0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1AD9E01F0()
{
  return MEMORY[0x1F41853A0]();
}

uint64_t sub_1AD9E0200()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1AD9E0210()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1AD9E0220()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1AD9E0230()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1AD9E0240()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1AD9E0250()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1AD9E0260()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1AD9E0270()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1AD9E0280()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1AD9E0290()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1AD9E02A0()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1AD9E02B0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1AD9E02C0()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1AD9E02D0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1AD9E02E0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1AD9E02F0()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1AD9E0300()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1AD9E0310()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1AD9E0340()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1AD9E0350()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1AD9E0360()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1AD9E0370()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1AD9E0380()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1AD9E0390()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1AD9E03A0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1AD9E03B0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1AD9E03C0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1AD9E03D0()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1AD9E03E0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1AD9E03F0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1AD9E0400()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1AD9E0410()
{
  return MEMORY[0x1F40E6F30]();
}

uint64_t sub_1AD9E0420()
{
  return MEMORY[0x1F40E6F38]();
}

uint64_t sub_1AD9E0430()
{
  return MEMORY[0x1F40E6F60]();
}

uint64_t sub_1AD9E0440()
{
  return MEMORY[0x1F40E6F68]();
}

uint64_t sub_1AD9E0450()
{
  return MEMORY[0x1F40E6F78]();
}

uint64_t sub_1AD9E0460()
{
  return MEMORY[0x1F40E6F88]();
}

uint64_t sub_1AD9E0470()
{
  return MEMORY[0x1F40E6F98]();
}

uint64_t sub_1AD9E0480()
{
  return MEMORY[0x1F40E6FB8]();
}

uint64_t sub_1AD9E0490()
{
  return MEMORY[0x1F40E6FC0]();
}

uint64_t sub_1AD9E04A0()
{
  return MEMORY[0x1F40E6FC8]();
}

uint64_t sub_1AD9E04B0()
{
  return MEMORY[0x1F40E6FD0]();
}

uint64_t sub_1AD9E04C0()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t sub_1AD9E04F0()
{
  return MEMORY[0x1F4186318]();
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x1F410D078]();
}

uint64_t BPSPillSelectedColor()
{
  return MEMORY[0x1F410D0A0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x1F40DB1F8](t, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

NSSet *HKCategoryValueSleepAnalysisAsleepValues(void)
{
  return (NSSet *)MEMORY[0x1F40E7B08]();
}

uint64_t HKDateFormatterFromTemplate()
{
  return MEMORY[0x1F4121528]();
}

uint64_t HKHealthTintColor()
{
  return MEMORY[0x1F4121590]();
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return MEMORY[0x1F41215B8]();
}

uint64_t HKSPActivePairedDeviceApplicationsInstalledDistributedNotification()
{
  return MEMORY[0x1F415AF38]();
}

uint64_t HKSPActivePairedDeviceApplicationsUninstalledDistributedNotification()
{
  return MEMORY[0x1F415AF40]();
}

uint64_t HKSPAnalyticsScheduleChangeContext()
{
  return MEMORY[0x1F415AF48]();
}

uint64_t HKSPCurrentDateProvider()
{
  return MEMORY[0x1F415AF50]();
}

uint64_t HKSPDayForWeekdays()
{
  return MEMORY[0x1F415AF58]();
}

uint64_t HKSPDaysForWeekdaysInCalendar()
{
  return MEMORY[0x1F415AF60]();
}

uint64_t HKSPDefaultScheduleProvider()
{
  return MEMORY[0x1F415AF68]();
}

uint64_t HKSPEnumerateDaysOfWeekInCalendar()
{
  return MEMORY[0x1F415AF70]();
}

uint64_t HKSPIdentifierStringForWeekdays()
{
  return MEMORY[0x1F415AF78]();
}

uint64_t HKSPIsRemoveSpacesForTimeFormatEnabled()
{
  return MEMORY[0x1F415AF80]();
}

uint64_t HKSPScreenTimeURL()
{
  return MEMORY[0x1F415AF88]();
}

uint64_t HKSPSleepURL()
{
  return MEMORY[0x1F415AF90]();
}

uint64_t HKSPSleepURLWithProvenanceInfo()
{
  return MEMORY[0x1F415AF98]();
}

uint64_t HKSPWeekdayDaysInCalendar()
{
  return MEMORY[0x1F415AFA0]();
}

uint64_t HKSPWeekdaysAreConsecutiveInCalendar()
{
  return MEMORY[0x1F415AFA8]();
}

uint64_t HKSPWeekdaysFromDay()
{
  return MEMORY[0x1F415AFB0]();
}

uint64_t HKSPWeekdaysIsSingleDay()
{
  return MEMORY[0x1F415AFB8]();
}

uint64_t HKSPWeekdaysShiftBackOneDay()
{
  return MEMORY[0x1F415AFC0]();
}

uint64_t HKSPWeekendDaysInCalendar()
{
  return MEMORY[0x1F415AFC8]();
}

uint64_t HKTimePeriodString()
{
  return MEMORY[0x1F41215E8]();
}

uint64_t HKTimePeriodStringWithFonts()
{
  return MEMORY[0x1F41215F0]();
}

uint64_t NSGregorianCalendarDayForHKSPDay()
{
  return MEMORY[0x1F415AFD0]();
}

uint64_t NSStringForHKSPDay()
{
  return MEMORY[0x1F415AFD8]();
}

uint64_t NSStringFromHKSPSleepScheduleState()
{
  return MEMORY[0x1F415AFE0]();
}

uint64_t NSStringFromHKSPWeekdays()
{
  return MEMORY[0x1F415AFE8]();
}

uint64_t NSStringFromTLAlertPlaybackCompletionType()
{
  return MEMORY[0x1F4164430]();
}

uint64_t ResetLocaleDependentFormatters()
{
  return MEMORY[0x1F4121680]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4166C48]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4166C50]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKCategoryValueSleepAnalysisDefaultAsleepValue()
{
  return MEMORY[0x1F40E8178]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _UIBarsApplyChromelessEverywhere()
{
  return MEMORY[0x1F4166FB0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t lrint(long double __x)
{
  return MEMORY[0x1F40CC8D8](__x);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1F4186588]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}