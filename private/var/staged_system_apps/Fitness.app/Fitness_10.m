uint64_t sub_100715578(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  long long v24;
  long long v25;
  void v26[3];
  uint64_t v27;

  sub_10007E2D8(0, (unint64_t *)&qword_10094C810);
  v4 = sub_10007E2D8(0, (unint64_t *)&qword_10094E530);
  v27 = v4;
  *((void *)&v25 + 1) = v4;
  v26[0] = a1;
  *(void *)&v24 = a2;
  v5 = a1;
  v6 = a2;
  v7 = sub_1000FC040();
  v8 = sub_1003D282C(v26, 5, 0, &v24, 5, 1.0, v7);
  v27 = v4;
  *((void *)&v25 + 1) = v4;
  v26[0] = v5;
  *(void *)&v24 = v6;
  v9 = v5;
  v10 = v6;
  v11 = sub_1003D282C(v26, 4, 0, &v24, 4, 1.0, 0.0);
  v27 = v4;
  *((void *)&v25 + 1) = v4;
  v26[0] = v9;
  *(void *)&v24 = v10;
  v12 = v9;
  v13 = v10;
  v14 = sub_1000FC040();
  v15 = sub_1003D282C(v26, 6, 0, &v24, 6, 1.0, -v14);
  v27 = v4;
  v26[0] = v12;
  v24 = 0u;
  v25 = 0u;
  v16 = self;
  v17 = v12;
  v18 = [v16 mainScreen];
  [v18 scale];
  v20 = v19;

  v21 = sub_1003D282C(v26, 8, 0, &v24, 8, 1.0, 1.0 / v20);
  sub_1000AFA94((uint64_t *)&unk_10095B850);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_100751160;
  *(void *)(v22 + 32) = v8;
  *(void *)(v22 + 40) = v11;
  *(void *)(v22 + 48) = v15;
  *(void *)(v22 + 56) = v21;
  v26[0] = v22;
  specialized Array._endMutation()();
  return v26[0];
}

void sub_100715770()
{
  v1 = *(void **)&v0[OBJC_IVAR___CHDivingDetailMapTableViewCell_dataCalculator];
  if (v1)
  {
    v2 = v0;
    uint64_t v3 = OBJC_IVAR___CHDivingDetailMapTableViewCell_depthChartView;
    if (!*(void *)&v0[OBJC_IVAR___CHDivingDetailMapTableViewCell_depthChartView])
    {
      *(void *)(swift_allocObject() + 16) = v1;
      id v4 = objc_allocWithZone((Class)sub_1000AFA94(&qword_10096B1D0));
      id v5 = v1;
      v6 = (void *)UIHostingController.init(rootView:)();
      id v7 = [v6 view];
      if (v7)
      {
        v8 = v7;
        [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

        id v9 = [v6 view];
        if (v9)
        {
          v10 = v9;
          id v11 = [v2 contentView];
          [v11 frame];
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;

          [v10 setFrame:v13, v15, v17, v19];
          id v20 = [v2 contentView];
          id v21 = [v6 view];
          if (v21)
          {
            v22 = v21;
            [v20 addSubview:v21];

            id v23 = [v6 view];
            v24 = *(void **)&v2[v3];
            *(void *)&v2[v3] = v23;

            sub_1007159A8();
            id v25 = [v6 view];
            if (v25)
            {
              v26 = v25;
              [v25 setNeedsLayout];

              return;
            }
LABEL_12:
            __break(1u);
            return;
          }
LABEL_11:
          __break(1u);
          goto LABEL_12;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_11;
    }
  }
}

void sub_1007159A8()
{
  v1 = *(void **)&v0[OBJC_IVAR___CHDivingDetailMapTableViewCell_depthChartView];
  if (v1)
  {
    v2 = v0;
    uint64_t v3 = self;
    sub_1000AFA94((uint64_t *)&unk_10095B850);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10075C680;
    id v5 = v1;
    id v6 = [v2 contentView];
    id v7 = [v6 heightAnchor];

    if (qword_10094B170 != -1) {
      swift_once();
    }
    double v8 = *(double *)&qword_100998930;
    double v9 = sub_1000FC040();
    id v10 = [v7 constraintEqualToConstant:v8 + v9 + v9];

    *(void *)(v4 + 32) = v10;
    id v11 = [v5 topAnchor];
    id v12 = [v2 contentView];
    id v13 = [v12 topAnchor];

    id v14 = [v11 constraintEqualToAnchor:v13 constant:sub_1000FC040() + -5.0];
    *(void *)(v4 + 40) = v14;
    id v15 = [v5 bottomAnchor];
    id v16 = [v2 contentView];
    id v17 = [v16 bottomAnchor];

    id v18 = [v15 constraintEqualToAnchor:v17 constant:sub_1000FC040() + -5.0];
    *(void *)(v4 + 48) = v18;
    id v19 = [v5 trailingAnchor];
    id v20 = [v2 contentView];
    id v21 = [v20 trailingAnchor];

    id v22 = [v19 constraintEqualToAnchor:v21 constant:-sub_1000FC040()];
    *(void *)(v4 + 56) = v22;
    id v23 = [v5 leadingAnchor];
    id v24 = [v2 contentView];
    id v25 = [v24 leadingAnchor];

    id v26 = [v23 constraintEqualToAnchor:v25 constant:sub_1000FC040()];
    *(void *)(v4 + 64) = v26;
    specialized Array._endMutation()();
    sub_10007E2D8(0, (unint64_t *)&qword_10094C810);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v3 activateConstraints:isa];
  }
}

id sub_100715D94()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DivingDetailMapTableViewCell();
  return [super dealloc];
}

uint64_t type metadata accessor for DivingDetailMapTableViewCell()
{
  return self;
}

uint64_t sub_100715E98()
{
  return swift_deallocObject();
}

void sub_100715ED8()
{
  v1 = v0;
  uint64_t v2 = OBJC_IVAR___CHDivingDetailMapTableViewCell_titleLabel1;
  id v3 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v4 = UIView.forAutoLayout()();

  *(void *)&v1[v2] = v4;
  uint64_t v5 = OBJC_IVAR___CHDivingDetailMapTableViewCell_titleLabel2;
  id v6 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v7 = UIView.forAutoLayout()();

  *(void *)&v1[v5] = v7;
  uint64_t v8 = OBJC_IVAR___CHDivingDetailMapTableViewCell_valueLabel1;
  id v9 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v10 = UIView.forAutoLayout()();

  *(void *)&v1[v8] = v10;
  uint64_t v11 = OBJC_IVAR___CHDivingDetailMapTableViewCell_valueLabel2;
  id v12 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v13 = UIView.forAutoLayout()();

  *(void *)&v1[v11] = v13;
  uint64_t v14 = OBJC_IVAR___CHDivingDetailMapTableViewCell_separatorView;
  id v15 = [objc_allocWithZone((Class)UIView) init];
  uint64_t v16 = UIView.forAutoLayout()();

  *(void *)&v1[v14] = v16;
  *(void *)&v1[OBJC_IVAR___CHDivingDetailMapTableViewCell_dive] = 0;
  *(void *)&v1[OBJC_IVAR___CHDivingDetailMapTableViewCell_dataCalculator] = 0;
  *(void *)&v1[OBJC_IVAR___CHDivingDetailMapTableViewCell_depthChartView] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

unint64_t sub_100716058()
{
  unint64_t result = qword_10096B1D8;
  if (!qword_10096B1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B1D8);
  }
  return result;
}

unint64_t sub_1007160B0()
{
  unint64_t result = qword_10096B1E0;
  if (!qword_10096B1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B1E0);
  }
  return result;
}

unint64_t sub_100716108()
{
  unint64_t result = qword_10096B1E8;
  if (!qword_10096B1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B1E8);
  }
  return result;
}

uint64_t sub_100716160()
{
  sub_1000AFA94(&qword_10094D338);
  type metadata accessor for AppDependencyManager();
  static AppDependencyManager.shared.getter();
  uint64_t v0 = AppDependency.__allocating_init(key:manager:)();
  sub_1000AFA94(&qword_10094D390);
  static AppDependencyManager.shared.getter();
  uint64_t result = AppDependency.__allocating_init(key:manager:)();
  qword_100998940 = v0;
  *(void *)algn_100998948 = result;
  return result;
}

uint64_t sub_100716210()
{
  uint64_t v0 = sub_1000AFA94(&qword_10094D328);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for LocalizedStringResource();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = type metadata accessor for TypeDisplayRepresentation();
  sub_1000258C4(v5, qword_100998950);
  sub_1000876DC(v5, (uint64_t)qword_100998950);
  LocalizedStringResource.init(stringLiteral:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10071637C@<X0>(void *a1@<X8>)
{
  if (qword_10094B180 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_100998948;
  *a1 = qword_100998940;
  a1[1] = v2;
  swift_retain();

  return swift_retain();
}

unint64_t sub_1007163F8()
{
  unint64_t result = qword_10096B1F0;
  if (!qword_10096B1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B1F0);
  }
  return result;
}

unint64_t sub_100716450()
{
  unint64_t result = qword_10096B1F8;
  if (!qword_10096B1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B1F8);
  }
  return result;
}

unint64_t sub_1007164AC()
{
  unint64_t result = qword_10096B200;
  if (!qword_10096B200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B200);
  }
  return result;
}

void sub_100716500(void *a1@<X8>)
{
  if ((*v1 & 0x8000000000000000) != 0) {
    __break(1u);
  }
  else {
    *a1 = *v1;
  }
}

uint64_t sub_100716514@<X0>(uint64_t a1@<X8>)
{
  if (qword_10094B188 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation();
  uint64_t v3 = sub_1000876DC(v2, (uint64_t)qword_100998950);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1007165C0()
{
  unint64_t result = qword_10096B208;
  if (!qword_10096B208)
  {
    sub_1000A1370(&qword_10096B210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B208);
  }
  return result;
}

uint64_t sub_10071661C(uint64_t a1)
{
  unint64_t v2 = sub_10024C020();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10071666C()
{
  id v0 = (id)FILocalizedNameForIndoorAgnosticActivityType();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v0 = (id)v2;
  }
  else
  {
    __break(1u);
  }
  return DisplayRepresentation.init(stringLiteral:)(v0);
}

uint64_t sub_1007166DC(uint64_t a1)
{
  unint64_t v2 = sub_1007164AC();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ModalityTypeEntity()
{
  return &type metadata for ModalityTypeEntity;
}

uint64_t sub_100716738(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

id sub_100716744()
{
  id result = [self preferredFontForTextStyle:UIFontTextStyleBody];
  qword_10096B218 = (uint64_t)result;
  return result;
}

char *sub_10071678C(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR___CHWorkoutCellImageLabelView_workout] = 0;
  *(void *)&v4[OBJC_IVAR___CHWorkoutCellImageLabelView_fitnessAppContext] = 0;
  *(void *)&v4[OBJC_IVAR___CHWorkoutCellImageLabelView_formattingManager] = 0;
  *(void *)&v4[OBJC_IVAR___CHWorkoutCellImageLabelView_achievementCount] = 0;
  v4[OBJC_IVAR___CHWorkoutCellImageLabelView_diveDisplayStyle] = 1;
  uint64_t v9 = OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView;
  id v10 = objc_allocWithZone((Class)UIImageView);
  uint64_t v11 = v4;
  id v12 = [v10 initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v13 = [v12 layer];
  [v13 setCornerRadius:3.0];

  [v12 setClipsToBounds:1];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v4[v9] = v12;
  uint64_t v14 = OBJC_IVAR___CHWorkoutCellImageLabelView_workoutIconView;
  id v15 = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v11[v14] = v15;
  uint64_t v16 = OBJC_IVAR___CHWorkoutCellImageLabelView_labelStackView;
  id v17 = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v17 setAxis:1];
  [v17 setDistribution:3];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v11[v16] = v17;
  uint64_t v18 = OBJC_IVAR___CHWorkoutCellImageLabelView_workoutTitleLabel;
  id v19 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  LODWORD(v20) = 1148846080;
  [v19 setContentCompressionResistancePriority:1 forAxis:v20];
  [v19 setLineBreakMode:0];
  [v19 setNumberOfLines:0];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v11[v18] = v19;
  uint64_t v21 = OBJC_IVAR___CHWorkoutCellImageLabelView_goalLabel;
  id v22 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v11[v21] = v22;
  uint64_t v23 = OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel;
  id v24 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v25 = UIView.forAutoLayout()();

  *(void *)&v11[v23] = v25;
  uint64_t v26 = OBJC_IVAR___CHWorkoutCellImageLabelView_separatorView;
  id v27 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v28 = [self separatorColor];
  [v27 setBackgroundColor:v28];

  [v27 setHidden:1];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v11[v26] = v27;

  v37.receiver = v11;
  v37.super_class = (Class)type metadata accessor for WorkoutCellImageLabelView();
  v29 = [super initWithFrame:a1, a2, a3, a4];
  uint64_t v30 = OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel;
  v31 = *(void **)&v29[OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel];
  v32 = v29;
  id v33 = v31;
  if (FIUILocaleIsRightToLeft()) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = 2;
  }
  [v33 setTextAlignment:v34];

  [v32 addSubview:*(void *)&v32[OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView]];
  [v32 addSubview:*(void *)&v32[OBJC_IVAR___CHWorkoutCellImageLabelView_workoutIconView]];
  [v32 addSubview:*(void *)&v29[v30]];
  v35 = *(void **)&v32[OBJC_IVAR___CHWorkoutCellImageLabelView_labelStackView];
  [v35 addArrangedSubview:*(void *)&v32[OBJC_IVAR___CHWorkoutCellImageLabelView_workoutTitleLabel]];
  [v35 addArrangedSubview:*(void *)&v32[OBJC_IVAR___CHWorkoutCellImageLabelView_goalLabel]];
  [v32 addSubview:v35];
  [v32 addSubview:*(void *)&v32[OBJC_IVAR___CHWorkoutCellImageLabelView_separatorView]];
  sub_100716C38();

  return v32;
}

void sub_100716C38()
{
  uint64_t v1 = v0;
  sub_1000AFA94((uint64_t *)&unk_10095B850);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100760BE0;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView];
  id v4 = [v3 leadingAnchor];
  id v5 = [v1 leadingAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];

  *(void *)(v2 + 32) = v6;
  id v7 = [v3 topAnchor];
  id v8 = [v1 topAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 constant:15.0];

  *(void *)(v2 + 40) = v9;
  id v10 = [v3 widthAnchor];
  id v11 = [v10 constraintEqualToConstant:48.0];

  *(void *)(v2 + 48) = v11;
  id v12 = [v3 heightAnchor];
  id v13 = [v12 constraintEqualToConstant:48.0];

  *(void *)(v2 + 56) = v13;
  uint64_t v14 = *(void **)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_workoutIconView];
  id v107 = v14;
  id v15 = [v14 centerXAnchor];
  id v16 = [v3 centerXAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16];

  *(void *)(v2 + 64) = v17;
  id v18 = [v14 centerYAnchor];
  id v19 = [v3 centerYAnchor];
  id v20 = [v18 constraintEqualToAnchor:v19];

  *(void *)(v2 + 72) = v20;
  uint64_t v21 = *(void **)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_labelStackView];
  id v22 = [v21 topAnchor];
  id v23 = [v3 bottomAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23 constant:10.0];

  *(void *)(v2 + 80) = v24;
  id v25 = [v21 leadingAnchor];
  id v26 = [v1 leadingAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];

  *(void *)(v2 + 88) = v27;
  id v28 = [v21 trailingAnchor];
  id v29 = [v1 trailingAnchor];
  id v30 = [v28 constraintEqualToAnchor:v29];

  *(void *)(v2 + 96) = v30;
  id v31 = [v21 bottomAnchor];
  id v32 = [v1 bottomAnchor];
  id v33 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:-15.0];

  *(void *)(v2 + 104) = v33;
  uint64_t v34 = *(void **)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_goalLabel];
  id v106 = v34;
  id v35 = [v34 topAnchor];
  id v108 = *(id *)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_workoutTitleLabel];
  id v36 = [v108 bottomAnchor];
  id v37 = [v35 constraintEqualToAnchor:v36];

  *(void *)(v2 + 112) = v37;
  v38 = *(void **)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_separatorView];
  id v39 = [v38 widthAnchor];
  id v40 = [v1 widthAnchor];
  id v41 = [v39 constraintEqualToAnchor:v40];

  *(void *)(v2 + 120) = v41;
  id v42 = [v38 heightAnchor];
  id v43 = [v42 constraintEqualToConstant:0.5];

  *(void *)(v2 + 128) = v43;
  id v44 = [v38 bottomAnchor];
  id v45 = [v1 bottomAnchor];
  id v46 = [v44 constraintEqualToAnchor:v45];

  *(void *)(v2 + 136) = v46;
  v47 = *(void **)&v1[OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel];
  id v48 = [v47 topAnchor];
  id v49 = [v34 lastBaselineAnchor];
  id v50 = [v48 constraintEqualToAnchor:v49 constant:10.0];

  *(void *)(v2 + 144) = v50;
  id v51 = [v47 trailingAnchor];
  id v52 = [v1 trailingAnchor];
  id v53 = [v51 constraintEqualToAnchor:v52];

  *(void *)(v2 + 152) = v53;
  id v54 = [v47 bottomAnchor];
  id v55 = [v1 bottomAnchor];
  id v56 = [v54 constraintEqualToAnchor:v55 constant:-15.0];

  *(void *)(v2 + 160) = v56;
  specialized Array._endMutation()();
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_100754590;
  id v58 = [v3 leadingAnchor];
  id v59 = [v1 leadingAnchor];
  id v60 = [v58 constraintEqualToAnchor:v59];

  *(void *)(v57 + 32) = v60;
  id v61 = [v3 centerYAnchor];
  id v62 = [v21 centerYAnchor];
  id v63 = [v61 constraintEqualToAnchor:v62];

  *(void *)(v57 + 40) = v63;
  id v64 = [v3 widthAnchor];
  id v65 = [v64 constraintEqualToConstant:48.0];

  *(void *)(v57 + 48) = v65;
  id v66 = [v3 heightAnchor];
  id v67 = [v66 constraintEqualToConstant:48.0];

  *(void *)(v57 + 56) = v67;
  id v68 = [v107 centerXAnchor];
  id v69 = [v3 centerXAnchor];
  id v70 = [v68 constraintEqualToAnchor:v69];

  *(void *)(v57 + 64) = v70;
  id v71 = [v107 centerYAnchor];
  id v72 = [v3 centerYAnchor];
  id v73 = [v71 constraintEqualToAnchor:v72];

  *(void *)(v57 + 72) = v73;
  id v74 = [v21 topAnchor];
  id v75 = [v1 topAnchor];
  id v76 = [v74 constraintEqualToAnchor:v75 constant:12.0];

  *(void *)(v57 + 80) = v76;
  id v77 = [v21 leadingAnchor];
  id v78 = [v3 trailingAnchor];
  id v79 = [v77 constraintEqualToAnchor:v78 constant:8.0];

  *(void *)(v57 + 88) = v79;
  id v80 = [v21 trailingAnchor];
  id v81 = [v47 leadingAnchor];
  id v82 = [v80 constraintEqualToAnchor:v81 constant:-5.0];

  *(void *)(v57 + 96) = v82;
  id v83 = [v21 bottomAnchor];
  id v84 = [v1 bottomAnchor];
  id v85 = [v83 constraintEqualToAnchor:v84 constant:-12.0];

  *(void *)(v57 + 104) = v85;
  id v86 = [v106 topAnchor];
  id v87 = [v108 bottomAnchor];
  id v88 = [v86 constraintEqualToAnchor:v87];

  *(void *)(v57 + 112) = v88;
  id v89 = [v38 widthAnchor];
  id v90 = [v1 widthAnchor];
  id v91 = [v89 constraintEqualToAnchor:v90];

  *(void *)(v57 + 120) = v91;
  id v92 = [v38 heightAnchor];
  id v93 = [v92 constraintEqualToConstant:0.5];

  *(void *)(v57 + 128) = v93;
  id v94 = [v38 bottomAnchor];
  id v95 = [v1 bottomAnchor];
  id v96 = [v94 constraintEqualToAnchor:v95];

  *(void *)(v57 + 136) = v96;
  id v97 = [v47 topAnchor];
  id v98 = [v1 topAnchor];
  id v99 = [v97 constraintEqualToAnchor:v98 constant:15.0];

  *(void *)(v57 + 144) = v99;
  id v100 = [v47 trailingAnchor];
  id v101 = [v1 trailingAnchor];
  id v102 = [v100 constraintEqualToAnchor:v101];

  *(void *)(v57 + 152) = v102;
  specialized Array._endMutation()();
  id v103 = [self sharedApplication];
  id v104 = [v103 preferredContentSizeCategory];

  UIContentSizeCategory.isAccessibilityCategory.getter();
  swift_bridgeObjectRelease();
  v105 = self;
  sub_10007E2D8(0, (unint64_t *)&qword_10094C810);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v105 activateConstraints:isa];
}

id sub_100717ADC(void *a1, void *a2, void *a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  char v13 = a5 & 1;
  uint64_t v14 = *(void **)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_workout);
  *(void *)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_workout) = a1;
  id v15 = a1;

  id v16 = *(void **)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_fitnessAppContext);
  *(void *)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_fitnessAppContext) = a2;
  id v17 = a2;

  id v18 = *(void **)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_formattingManager);
  *(void *)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_formattingManager) = a3;
  id v19 = a3;

  *(void *)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_achievementCount) = a4;
  *(unsigned char *)(v7 + OBJC_IVAR___CHWorkoutCellImageLabelView_diveDisplayStyle) = v13;
  sub_100717BFC(a6, a7);

  return sub_100718ADC();
}

void sub_100717BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_workout);
  if (v3)
  {
    id v4 = *(void **)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_fitnessAppContext);
    if (v4)
    {
      id v5 = *(void **)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_formattingManager);
      if (v5)
      {
        id v6 = v3;
        id v50 = v4;
        id v7 = v5;
        id v49 = [v7 formattedTypeForWorkout:v6 workoutActivity:0 context:@"WorkoutsListDisplayContext"];
        id v8 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:v49];
        id v9 = [v8 length];
        sub_1000AFA94((uint64_t *)&unk_10095BF70);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10074E640;
        *(void *)(inited + 32) = NSForegroundColorAttributeName;
        id v11 = self;
        id v12 = NSForegroundColorAttributeName;
        id v13 = [v11 whiteColor];
        uint64_t v14 = sub_10007E2D8(0, (unint64_t *)&qword_10095BF80);
        *(void *)(inited + 40) = v13;
        *(void *)(inited + 64) = v14;
        *(void *)(inited + 72) = NSFontAttributeName;
        uint64_t v15 = qword_10094B190;
        id v16 = NSFontAttributeName;
        if (v15 != -1) {
          swift_once();
        }
        id v17 = (void *)qword_10096B218;
        *(void *)(inited + 104) = sub_10007E2D8(0, (unint64_t *)&qword_1009587A0);
        *(void *)(inited + 80) = v17;
        id v18 = v17;
        sub_1000DFC2C(inited);
        type metadata accessor for Key(0);
        sub_100719414((unint64_t *)&qword_10094B9A0, type metadata accessor for Key);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v8 addAttributes:isa range:0];

        [*(id *)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutTitleLabel) setAttributedText:v8];
        if ([v6 workoutActivityType] == (id)84
          && (*(unsigned char *)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_diveDisplayStyle) & 1) == 0)
        {
          id v20 = *(void **)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_goalLabel);
          id v21 = [v7 formattedDurationForWorkout:v6 workoutActivity:0 context:@"WorkoutsListDisplayContext"];
        }
        else
        {
          id v20 = *(void **)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_goalLabel);
          id v21 = [v7 formattedGoalForWorkout:v6 context:@"WorkoutsListDisplayContext"];
        }
        id v22 = v21;
        [v20 setAttributedText:v22];

        uint64_t v23 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = v23;
        *(void *)(v24 + 24) = v6;
        aBlock[4] = sub_1007194D4;
        aBlock[5] = v24;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1006B866C;
        aBlock[3] = &unk_1008D87E0;
        id v25 = _Block_copy(aBlock);
        id v26 = v6;
        id v27 = @"WorkoutsListDisplayContext";
        swift_release();
        [v7 fetchIconImageForWorkout:v26 context:v27 completion:v25];
        _Block_release(v25);

        if (objc_msgSend(v26, "fiui_isConnectedGymWorkout")) {
          unsigned int v28 = [v7 hasConnectedGymVendorIconForWorkout:v26];
        }
        else {
          unsigned int v28 = 0;
        }
        id v29 = [v26 sourceRevision];
        id v30 = [v29 source];

        unsigned int v31 = [v30 _hasFirstPartyBundleID];
        id v32 = [v26 sourceRevision];
        id v33 = [v32 source];

        LODWORD(v32) = [v33 _isAppleWatch];
        if (v32)
        {
          if ((v28 | v31 ^ 1))
          {
LABEL_20:
            id v42 = v26;
            char v43 = sub_1007194DC(v42);

            if (v43)
            {
              id v44 = *(char **)&v50[OBJC_IVAR___CHFitnessAppContext_seymourCatalogItemDataProvider];
              uint64_t v45 = swift_allocObject();
              swift_unknownObjectWeakInit();
              id v46 = v42;
              swift_retain();
              sub_10008A670(a1);
              sub_10048D08C(v46, v44, v45, v46, a1, a2);

              swift_release();
              sub_10005E5F8(a1);

              swift_release();
            }
            else
            {
            }
            return;
          }
        }
        else
        {
          unsigned int v34 = [v26 _isWatchWorkout];
          if (((v28 | v31 ^ 1) & 1) != 0 || !v34) {
            goto LABEL_20;
          }
        }
        id v35 = [v26 fiui_activityType];
        id v36 = (id)FIUIStaticWorkoutIconImage();
        if (!v36)
        {
          __break(1u);
          return;
        }
        id v37 = v36;
        id v38 = [v36 imageWithRenderingMode:2];

        id v39 = sub_1004A4E6C(v26);
        id v40 = *(void **)(v2 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutIconView);
        id v41 = [v39 nonGradientTextColor];
        [v40 setTintColor:v41];

        [v40 setImage:v38];
        goto LABEL_20;
      }
    }
  }
}

void sub_1007182B4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    id v7 = *(void **)(Strong + OBJC_IVAR___CHWorkoutCellImageLabelView_workout);
    id v8 = v7;

    if (v7)
    {
      sub_10007E2D8(0, (unint64_t *)&qword_10095E770);
      id v9 = v8;
      id v10 = a3;
      char v11 = static NSObject.== infix(_:_:)();

      if (v11)
      {
        swift_beginAccess();
        uint64_t v12 = swift_unknownObjectWeakLoadStrong();
        if (!v12
          || (id v13 = (void *)v12,
              id v14 = *(id *)(v12 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView),
              v13,
              id v15 = [v14 image],
              v15,
              v14,
              !v15))
        {
          swift_beginAccess();
          uint64_t v16 = swift_unknownObjectWeakLoadStrong();
          if (v16)
          {
            id v17 = (void *)v16;
            id v18 = *(id *)(v16 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView);

            [v18 setImage:a1];
          }
        }
      }
    }
  }
}

void sub_100718438(char *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v10 = (void *)Strong;
    char v11 = *(void **)(Strong + OBJC_IVAR___CHWorkoutCellImageLabelView_workout);
    id v12 = v11;

    if (v11)
    {
      uint64_t v13 = sub_10007E2D8(0, (unint64_t *)&qword_10095E770);
      id v14 = v12;
      id v15 = a3;
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
        if (a1)
        {
          uint64_t v17 = *(void *)&a1[OBJC_IVAR___CHCatalogItemViewModel_title];
          id v18 = objc_allocWithZone((Class)NSMutableAttributedString);
          v47 = a1;
          id v19 = [v18 initWithAttributedString:v17];
          id v20 = [v19 length];
          sub_1000AFA94((uint64_t *)&unk_10095BF70);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_10074E640;
          *(void *)(inited + 32) = NSForegroundColorAttributeName;
          id v22 = self;
          uint64_t v23 = NSForegroundColorAttributeName;
          id v24 = [v22 whiteColor];
          uint64_t v25 = sub_10007E2D8(0, (unint64_t *)&qword_10095BF80);
          *(void *)(inited + 40) = v24;
          *(void *)(inited + 64) = v25;
          *(void *)(inited + 72) = NSFontAttributeName;
          uint64_t v26 = qword_10094B190;
          id v27 = NSFontAttributeName;
          if (v26 != -1) {
            swift_once();
          }
          unsigned int v28 = (void *)qword_10096B218;
          *(void *)(inited + 104) = sub_10007E2D8(0, (unint64_t *)&qword_1009587A0);
          *(void *)(inited + 80) = v28;
          id v29 = v28;
          sub_1000DFC2C(inited);
          type metadata accessor for Key(0);
          sub_100719414((unint64_t *)&qword_10094B9A0, type metadata accessor for Key);
          Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v19 addAttributes:isa range:0 v20];

          swift_beginAccess();
          uint64_t v31 = swift_unknownObjectWeakLoadStrong();
          if (v31)
          {
            id v32 = (void *)v31;
            id v33 = *(id *)(v31 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutTitleLabel);

            [v33 setAttributedText:v19];
          }
          swift_beginAccess();
          uint64_t v34 = swift_unknownObjectWeakLoadStrong();
          if (v34
            && (id v35 = (void *)v34,
                id v36 = *(void **)(v34 + OBJC_IVAR___CHWorkoutCellImageLabelView_fitnessAppContext),
                id v37 = v36,
                v35,
                v36))
          {
            id v38 = *(id *)&v37[OBJC_IVAR___CHFitnessAppContext_seymourCatalogItemDataProvider];

            uint64_t v39 = swift_allocObject();
            swift_beginAccess();
            id v40 = (void *)swift_unknownObjectWeakLoadStrong();
            swift_unknownObjectWeakInit();

            id v41 = (void *)swift_allocObject();
            v41[2] = v39;
            v41[3] = v15;
            v41[4] = a4;
            v41[5] = a5;
            id v42 = v15;
            swift_retain();
            sub_10008A670(a4);
            sub_100485D1C(v47, (uint64_t)sub_100719614, (uint64_t)v41);

            swift_release();
            swift_release();
          }
          else
          {
          }
        }
        else
        {
          static os_log_type_t.error.getter();
          char v43 = (void *)HKLogActivity;
          sub_1000AFA94((uint64_t *)&unk_1009546D0);
          uint64_t v44 = swift_allocObject();
          *(_OWORD *)(v44 + 16) = xmmword_10074E640;
          *(void *)(v44 + 56) = &type metadata for String;
          *(void *)(v44 + 64) = sub_1000AA64C();
          *(void *)(v44 + 32) = 0xD000000000000028;
          *(void *)(v44 + 40) = 0x80000001007D7E60;
          *(void *)(v44 + 96) = v13;
          *(void *)(v44 + 104) = sub_1002320AC();
          *(void *)(v44 + 72) = v15;
          id v45 = v15;
          id v46 = v43;
          os_log(_:dso:log:_:_:)();

          swift_bridgeObjectRelease();
        }
      }
    }
  }
}

void sub_100718944(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (void *)Strong;
    id v9 = *(void **)(Strong + OBJC_IVAR___CHWorkoutCellImageLabelView_workout);
    id v10 = v9;

    if (v9)
    {
      sub_10007E2D8(0, (unint64_t *)&qword_10095E770);
      id v11 = v10;
      id v12 = a3;
      char v13 = static NSObject.== infix(_:_:)();

      if (v13)
      {
        if (a1)
        {
          swift_beginAccess();
          uint64_t v14 = swift_unknownObjectWeakLoadStrong();
          if (v14)
          {
            id v15 = (void *)v14;
            id v16 = *(id *)(v14 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutIconView);

            [v16 setImage:0];
          }
          swift_beginAccess();
          uint64_t v17 = swift_unknownObjectWeakLoadStrong();
          if (v17)
          {
            id v18 = (void *)v17;
            id v19 = *(id *)(v17 + OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView);

            [v19 setImage:a1];
          }
        }
      }
    }
  }
  if (a4) {
    a4();
  }
}

id sub_100718ADC()
{
  uint64_t v1 = type metadata accessor for AttributeContainer();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for AttributedString();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v51 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v12 = __chkstk_darwin(v11);
  id v61 = (char *)&v51 - v15;
  uint64_t v16 = OBJC_IVAR___CHWorkoutCellImageLabelView_achievementCount;
  if (*(uint64_t *)&v0[OBJC_IVAR___CHWorkoutCellImageLabelView_achievementCount] < 1)
  {
    uint64_t v34 = *(void **)&v0[OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel];
    return [v34 setHidden:1];
  }
  else
  {
    id v55 = v6;
    uint64_t v56 = v12;
    uint64_t v57 = v3;
    id v58 = v0;
    id v59 = v14;
    id v60 = v13;
    id v17 = [self secondaryLabelColor];
    id v18 = [self preferredFontForTextStyle:UIFontTextStyleFootnote];
    sub_1000AFA94((uint64_t *)&unk_10095B850);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100751040;
    *(void *)(v19 + 32) = v17;
    uint64_t v62 = v19;
    specialized Array._endMutation()();
    sub_10007E2D8(0, (unint64_t *)&qword_10095BF80);
    id v54 = v17;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v21 = self;
    id v22 = [v21 configurationWithPaletteColors:isa];

    id v23 = v22;
    id v24 = [v21 configurationWithScale:1];
    id v25 = [v23 configurationByApplyingConfiguration:v24];

    id v26 = v25;
    NSString v27 = String._bridgeToObjectiveC()();
    id v28 = [self smm_systemImageNamed:v27 withConfiguration:v26];

    id v53 = v26;
    id v29 = v28;
    id v30 = [v29 imageWithRenderingMode:2];
    id v52 = v29;
    if (v30)
    {
      uint64_t v31 = v30;
      id v32 = [self textAttachmentWithImage:v30];
      id v33 = [self attributedStringWithAttachment:v32];
    }
    else
    {
      [objc_allocWithZone((Class)NSAttributedString) init];
      id v32 = v29;
    }

    AttributedString.init(_:)();
    id v36 = [objc_allocWithZone((Class)NSNumberFormatter) init];
    [v36 setNumberStyle:0];
    [v36 setRoundingMode:4];
    id v37 = v58;
    Class v38 = Int._bridgeToObjectiveC()().super.super.isa;
    id v39 = [v36 stringForObjectValue:v38];

    if (v39)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      uint64_t v62 = *(void *)&v37[v16];
      dispatch thunk of CustomStringConvertible.description.getter();
    }
    AttributeContainer.init()();
    id v40 = v59;
    AttributedString.init(_:attributes:)();
    id v41 = v60;
    AttributedString.init(stringLiteral:)();
    AttributedString.init()();
    sub_100719414((unint64_t *)&qword_100960998, (void (*)(uint64_t))&type metadata accessor for AttributedString);
    uint64_t v42 = v56;
    AttributedString.append<A>(_:)();
    AttributedString.append<A>(_:)();
    AttributedString.append<A>(_:)();
    uint64_t KeyPath = swift_getKeyPath();
    *(&v51 - 2) = __chkstk_darwin(KeyPath);
    swift_getKeyPath();
    uint64_t v62 = (uint64_t)v18;
    sub_100232308();
    id v58 = (char *)v18;
    AttributedString.subscript.setter();
    uint64_t v44 = swift_getKeyPath();
    *(&v51 - 2) = __chkstk_darwin(v44);
    swift_getKeyPath();
    id v45 = v54;
    uint64_t v62 = (uint64_t)v54;
    sub_100346848();
    id v46 = v45;
    AttributedString.subscript.setter();
    v47 = *(void **)&v37[OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel];
    sub_10007E2D8(0, (unint64_t *)&qword_10094D428);
    uint64_t v48 = v57;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v55, v9, v42);
    id v49 = NSAttributedString.init(_:)();
    [v47 setAttributedText:v49];

    [v47 setHidden:0];
    id v50 = *(void (**)(char *, uint64_t))(v48 + 8);
    v50(v9, v42);
    v50(v41, v42);
    v50(v40, v42);
    return (id)((uint64_t (*)(char *, uint64_t))v50)(v61, v42);
  }
}

id sub_100719290()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutCellImageLabelView();
  return [super dealloc];
}

uint64_t type metadata accessor for WorkoutCellImageLabelView()
{
  return self;
}

uint64_t sub_1007193C0()
{
  return 8;
}

uint64_t sub_1007193CC()
{
  return swift_release();
}

uint64_t sub_1007193D4(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_1007193E8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100719400()
{
  return 8;
}

uint64_t sub_100719414(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10071945C()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_100719494()
{
  swift_release();

  return swift_deallocObject();
}

void sub_1007194D4(uint64_t a1)
{
  sub_1007182B4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1007194DC(void *a1)
{
  id v1 = [a1 metadata];
  if (!v1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    goto LABEL_8;
  }
  objc_super v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v4 = static HealthDataConstants.catalogWorkoutIdentifierProperty.getter();
  if (!*(void *)(v3 + 16) || (unint64_t v6 = sub_1000DA1C0(v4, v5), (v7 & 1) == 0))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_10008F484(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v11 + 1))
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = 1;
LABEL_9:
  sub_100074898((uint64_t)&v10);
  return v8;
}

uint64_t sub_1007195C4()
{
  swift_release();

  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return swift_deallocObject();
}

void sub_100719614(uint64_t a1)
{
  sub_100718944(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void (**)(void))(v1 + 32));
}

uint64_t sub_100719620()
{
  uint64_t v0 = MindfulnessSessionViewModel.metadata.getter();
  if (!v0)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    goto LABEL_8;
  }
  uint64_t v1 = v0;
  uint64_t v2 = static HealthDataConstants.catalogWorkoutIdentifierProperty.getter();
  if (!*(void *)(v1 + 16) || (unint64_t v4 = sub_1000DA1C0(v2, v3), (v5 & 1) == 0))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_10008F484(*(void *)(v1 + 56) + 32 * v4, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = 1;
LABEL_9:
  sub_100074898((uint64_t)&v8);
  return v6;
}

void sub_1007196D4()
{
  uint64_t v1 = v0;
  *(void *)&v0[OBJC_IVAR___CHWorkoutCellImageLabelView_workout] = 0;
  *(void *)&v0[OBJC_IVAR___CHWorkoutCellImageLabelView_fitnessAppContext] = 0;
  *(void *)&v0[OBJC_IVAR___CHWorkoutCellImageLabelView_formattingManager] = 0;
  *(void *)&v0[OBJC_IVAR___CHWorkoutCellImageLabelView_achievementCount] = 0;
  v0[OBJC_IVAR___CHWorkoutCellImageLabelView_diveDisplayStyle] = 1;
  uint64_t v2 = OBJC_IVAR___CHWorkoutCellImageLabelView_workoutImageView;
  id v3 = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v4 = [v3 layer];
  [v4 setCornerRadius:3.0];

  [v3 setClipsToBounds:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v2] = v3;
  uint64_t v5 = OBJC_IVAR___CHWorkoutCellImageLabelView_workoutIconView;
  id v6 = [objc_allocWithZone((Class)UIImageView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v5] = v6;
  uint64_t v7 = OBJC_IVAR___CHWorkoutCellImageLabelView_labelStackView;
  id v8 = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v8 setAxis:1];
  [v8 setDistribution:3];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v7] = v8;
  uint64_t v9 = OBJC_IVAR___CHWorkoutCellImageLabelView_workoutTitleLabel;
  id v10 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  LODWORD(v11) = 1148846080;
  [v10 setContentCompressionResistancePriority:1 forAxis:v11];
  [v10 setLineBreakMode:0];
  [v10 setNumberOfLines:0];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v9] = v10;
  uint64_t v12 = OBJC_IVAR___CHWorkoutCellImageLabelView_goalLabel;
  id v13 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v12] = v13;
  uint64_t v14 = OBJC_IVAR___CHWorkoutCellImageLabelView_badgeCountLabel;
  id v15 = [objc_allocWithZone((Class)UILabel) initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v16 = UIView.forAutoLayout()();

  *(void *)&v1[v14] = v16;
  uint64_t v17 = OBJC_IVAR___CHWorkoutCellImageLabelView_separatorView;
  id v18 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v19 = [self separatorColor];
  [v18 setBackgroundColor:v19];

  [v18 setHidden:1];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  *(void *)&v1[v17] = v18;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100719A48()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_100719A80()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100719A9C(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 88) = a2;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = v2;
  *(void *)(v3 + 48) = swift_getObjectType();
  return _swift_task_switch(sub_100719B10, 0, 0);
}

uint64_t sub_100719B10()
{
  uint64_t v25 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 88);
  if (v1 == 38)
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v0 + 56) = v2;
    swift_unknownObjectWeakInit();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v3;
    uint64_t v4 = type metadata accessor for Date();
    *uint64_t v3 = v0;
    v3[1] = sub_100719E7C;
    uint64_t v5 = *(void *)(v0 + 32);
    return withCheckedContinuation<A>(isolation:function:_:)(v5, 0, 0, 0xD000000000000015, 0x80000001007D7EC0, sub_10071B61C, v2, v4);
  }
  id v6 = (void *)sub_10071BB18(v1);
  if ((v7 & 1) == 0)
  {
    sub_10071A0E8(v6, *(void *)(v0 + 32));
LABEL_14:
    id v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
  id v8 = sub_1000684A0(*(unsigned char *)(v0 + 88));
  *(void *)(v0 + 72) = v8;
  if (!v8)
  {
    os_log_type_t v12 = static os_log_type_t.error.getter();
    id v13 = (void *)HKLogActivity;
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(HKLogActivity, v12))
    {
      char v15 = *(unsigned char *)(v0 + 88);
      uint64_t v16 = v13;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v18 = _typeName(_:qualified:)();
      *(void *)(v0 + 16) = sub_10008F1F4(v18, v19, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v20 = sub_10007D644(v15);
      *(void *)(v0 + 24) = sub_10008F1F4(v20, v21, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v14, "%s firstSampleDate: fail to find activity type or sample type for %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    Date.init()();
    goto LABEL_14;
  }
  uint64_t v9 = (uint64_t)v8;
  id v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v10;
  void *v10 = v0;
  v10[1] = sub_100719F8C;
  uint64_t v11 = *(void *)(v0 + 32);
  return sub_10071A5A0(v11, v9);
}

uint64_t sub_100719E7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  int v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100719F8C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10071A088, 0, 0);
}

uint64_t sub_10071A088()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10071A0E8(id a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  __chkstk_darwin(v4);
  id v30 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000AFA94((uint64_t *)&unk_10095B890);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [*(id *)(v2 + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_workoutDataProvider) unfilteredWorkouts];
  sub_10007E2D8(0, (unint64_t *)&qword_10095E770);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v38 = v10;
  if (v10 >> 62)
  {
LABEL_29:
    swift_bridgeObjectRetain();
    unint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11)
    {
LABEL_3:
      unint64_t v35 = v10;
      unint64_t v36 = v10 & 0xC000000000000001;
      unint64_t v28 = v10 + 32;
      uint64_t v29 = v10 & 0xFFFFFFFFFFFFFF8;
      uint64_t v34 = v8;
      do
      {
        if (__OFSUB__(v11--, 1)) {
          goto LABEL_28;
        }
        if (v36)
        {
          id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v11 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_37:
            __break(1u);
            return;
          }
          if (v11 >= *(void *)(v29 + 16)) {
            goto LABEL_37;
          }
          id v13 = *(id *)(v28 + 8 * v11);
        }
        id v37 = v13;
        unint64_t v10 = [v13 workoutActivities];
        sub_10007E2D8(0, (unint64_t *)&qword_100955600);
        uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if ((unint64_t)v14 >> 62)
        {
          if (v14 < 0) {
            unint64_t v10 = v14;
          }
          else {
            unint64_t v10 = v14 & 0xFFFFFFFFFFFFFF8;
          }
          swift_bridgeObjectRetain_n();
          uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v15)
          {
LABEL_13:
            uint64_t v8 = 4;
            while (1)
            {
              id v16 = (v14 & 0xC000000000000001) != 0
                  ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                  : *(id *)(v14 + 8 * v8);
              uint64_t v17 = v16;
              uint64_t v18 = v8 - 3;
              if (__OFADD__(v8 - 4, 1)) {
                break;
              }
              unint64_t v10 = [v16 fiui_activityType];
              id v19 = [(id)v10 identifier];

              if (v19 == a1)
              {

                uint64_t v20 = swift_bridgeObjectRelease_n();
                __chkstk_darwin(v20);
                *(&v28 - 2) = (unint64_t)&v38;
                unint64_t v39 = v11;
                sub_10071B788(&v39, (unint64_t *)&v40);
                unint64_t v21 = v40;
                uint64_t v8 = v34;
                goto LABEL_31;
              }
              ++v8;
              if (v18 == v15) {
                goto LABEL_4;
              }
            }
            __break(1u);
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v15) {
            goto LABEL_13;
          }
        }
LABEL_4:
        swift_bridgeObjectRelease_n();

        uint64_t v8 = v34;
        unint64_t v10 = v35;
      }
      while (v11);
    }
  }
  unint64_t v21 = 0;
LABEL_31:
  swift_bridgeObjectRelease();
  if (v21)
  {
    id v22 = [v21 endDate];
    id v23 = v30;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v24 = v31;
    uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v31 + 32);
    uint64_t v26 = v23;
    uint64_t v27 = v32;
    v25(v8, v26, v32);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v8, 0, 1, v27);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v8, 1, v27) != 1)
    {

      v25(v33, (char *)v8, v27);
      return;
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v8, 1, 1, v32);
  }
  Date.init()();

  sub_10023636C(v8);
}

uint64_t sub_10071A5A0(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = swift_getObjectType();
  uint64_t v4 = type metadata accessor for Date();
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = swift_task_alloc();
  sub_1000AFA94((uint64_t *)&unk_10095B890);
  v3[12] = swift_task_alloc();
  uint64_t v5 = sub_1000AFA94(&qword_10096B2C0);
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  uint64_t v6 = sub_1000AFA94(&qword_10096B2C8);
  v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_10071A760, 0, 0);
}

uint64_t sub_10071A760()
{
  id v1 = [self _predicateForObjectsFromAppleWatches];
  v0[19] = v1;
  id v2 = [self sharedBehavior];
  if (v2)
  {
    uint64_t v4 = v2;
    unsigned __int8 v5 = [v2 isStandalonePhoneFitnessMode];

    if (v5) {
      id v1 = 0;
    }
    else {
      id v6 = v1;
    }
    uint64_t v8 = v0[17];
    uint64_t v7 = v0[18];
    uint64_t v9 = v0[16];
    uint64_t v10 = v0[7];
    sub_10007E2D8(0, &qword_100950760);
    static HKSamplePredicate.quantitySample(type:predicate:)();

    sub_1000AFA94(&qword_10096B2D0);
    unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1007509E0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 16))(v12 + v11, v7, v9);
    sub_1000AFA94(&qword_10096B2D8);
    sub_1000AFA94(&qword_10096B2E0);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1007509E0;
    swift_getKeyPath();
    SortDescriptor.init<A>(_:order:)();
    sub_10007E2D8(0, (unint64_t *)&qword_100951108);
    HKSampleQueryDescriptor.init(predicates:sortDescriptors:limit:)();
    id v13 = *(void **)(v10 + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_healthStore);
    uint64_t v14 = (void *)swift_task_alloc();
    v0[20] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_10071AA04;
    uint64_t v3 = v0[13];
    id v2 = v13;
  }
  else
  {
    __break(1u);
  }
  return HKSampleQueryDescriptor.result(for:)(v2, v3);
}

uint64_t sub_10071AA04(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10071ADD4;
  }
  else {
    uint64_t v4 = sub_10071AB18;
  }
  return _swift_task_switch(v4, 0, 0);
}

void sub_10071AB18()
{
  unint64_t v1 = *(void *)(v0 + 168);
  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v17 = *(void *)(v0 + 96);
    uint64_t v18 = *(void *)(v0 + 72);
    uint64_t v19 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
LABEL_10:
    uint64_t v20 = *(void *)(v0 + 144);
    unint64_t v21 = *(void **)(v0 + 152);
    uint64_t v22 = *(void *)(v0 + 128);
    uint64_t v23 = *(void *)(v0 + 136);
    uint64_t v25 = *(void *)(v0 + 112);
    uint64_t v24 = *(void *)(v0 + 120);
    uint64_t v27 = *(void *)(v0 + 96);
    uint64_t v26 = *(void *)(v0 + 104);
    Date.init()();

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v20, v22);
    sub_10023636C(v27);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v16) {
    goto LABEL_9;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(*(void *)(v0 + 168) + 32);
  }
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 80);
  swift_bridgeObjectRelease();
  id v7 = [v2 endDate];

  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v8(v3, v4, v5);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v3, 0, 1, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5) == 1) {
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 112);
  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 104);
  uint64_t v29 = *(void *)(v0 + 96);
  uint64_t v30 = *(void *)(v0 + 144);
  uint64_t v14 = *(void *)(v0 + 72);
  uint64_t v15 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v30, v9);
  v8(v15, v29, v14);
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v28 = *(void (**)(void))(v0 + 8);
  v28();
}

uint64_t sub_10071ADD4()
{
  uint64_t v23 = v0;
  os_log_type_t v1 = static os_log_type_t.error.getter();
  id v2 = (void *)HKLogActivity;
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(HKLogActivity, v1))
  {
    id v4 = *(id *)(v0 + 48);
    swift_errorRetain();
    id v5 = v4;
    swift_errorRetain();
    log = v2;
    uint64_t v6 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315650;
    uint64_t v7 = _typeName(_:qualified:)();
    *(void *)(v0 + 16) = sub_10008F1F4(v7, v8, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2112;
    *(void *)(v0 + 24) = v5;
    id v9 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v20 = v5;

    *(_WORD *)(v6 + 22) = 2112;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 32) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v20[1] = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v3, "%s error firstQuantitySampleDate for %@: %@", (uint8_t *)v6, 0x20u);
    sub_1000AFA94((uint64_t *)&unk_100955620);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v11 = *(void *)(v0 + 144);
  uint64_t v12 = *(void **)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 112);
  uint64_t v15 = *(void *)(v0 + 120);
  uint64_t v17 = *(void *)(v0 + 104);
  Date.init()();
  swift_errorRelease();

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v11, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

void sub_10071B0CC(uint64_t a1)
{
  uint64_t v2 = sub_1000AFA94(&qword_10096B2B8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = type metadata accessor for Date();
  __chkstk_darwin(v5 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    unint64_t v8 = *(void **)(Strong + OBJC_IVAR____TtC10FitnessApp19MetricsDataProvider_mindfulnessDataProvider);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    aBlock[4] = sub_10071B6B8;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100007CA4;
    aBlock[3] = &unk_1008D88A8;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = v8;
    swift_release();
    [v12 allMindfulnessSessionsWithCompletion:v11];
    _Block_release(v11);
  }
  else
  {
    Date.init()();
    CheckedContinuation.resume(returning:)();
  }
}

void sub_10071B320(unint64_t a1)
{
  uint64_t v2 = sub_1000AFA94((uint64_t *)&unk_10095B890);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v18 - v10;
  if (!(a1 >> 62))
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  if (!v12) {
    goto LABEL_12;
  }
LABEL_3:
  unint64_t v13 = v12 - 1;
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_17:
    id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_8:
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    if (v15)
    {
      id v16 = [v15 endDate];
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v17(v4, v9, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        v17(v11, v4, v5);
LABEL_15:
        sub_1000AFA94(&qword_10096B2B8);
        CheckedContinuation.resume(returning:)();

        return;
      }
LABEL_14:
      Date.init()();
      sub_10023636C((uint64_t)v4);
      goto LABEL_15;
    }
LABEL_13:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v14 = *(id *)(a1 + 8 * v13 + 32);
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t sub_10071B5E4()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

void sub_10071B61C(uint64_t a1)
{
}

uint64_t sub_10071B624()
{
  uint64_t v1 = sub_1000AFA94(&qword_10096B2B8);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);

  return swift_deallocObject();
}

void sub_10071B6B8(unint64_t a1)
{
  sub_1000AFA94(&qword_10096B2B8);

  sub_10071B320(a1);
}

unint64_t sub_10071B72C(unint64_t result, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0) {
    return specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
  {
    return (unint64_t)*(id *)(a2 + 8 * result + 32);
  }
  __break(1u);
  return result;
}

unint64_t sub_10071B788@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_10071B72C(*a1, **(void **)(v2 + 16));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

unint64_t sub_10071B7D0()
{
  unint64_t result = qword_100950770;
  if (!qword_100950770)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100950770);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ActivityDashboardMetricCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10071B8DCLL);
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

unsigned char *storeEnumTagSinglePayload for ActivityDashboardMetric(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 38 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 38) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD9)
  {
    unsigned int v6 = ((a2 - 218) >> 8) + 1;
    *unint64_t result = a2 + 38;
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
        JUMPOUT(0x10071B9D0);
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
          *unint64_t result = a2 + 38;
        break;
    }
  }
  return result;
}

unint64_t sub_10071B9FC()
{
  unint64_t result = qword_10096B2E8;
  if (!qword_10096B2E8)
  {
    sub_1000A1370(&qword_1009575B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B2E8);
  }
  return result;
}

uint64_t sub_10071BAF4(char a1)
{
  return sub_10007D514(a1, 29, 0x4E5F54524F48535FLL, (void *)0xEB00000000454D41);
}

uint64_t sub_10071BB18(unsigned __int8 a1)
{
  int v1 = a1 - 4;
  uint64_t result = 37;
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      return result;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      uint64_t result = 13;
      break;
    case 15:
    case 16:
    case 17:
    case 18:
      uint64_t result = 24;
      break;
    case 19:
    case 20:
    case 21:
    case 22:
      uint64_t result = 52;
      break;
    case 23:
    case 24:
    case 25:
      uint64_t result = 46;
      break;
    case 26:
    case 27:
    case 28:
    case 29:
      uint64_t result = 70;
      break;
    case 30:
    case 31:
    case 32:
    case 33:
      uint64_t result = 71;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_10071BC30(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6C61746F74;
  if (*v1) {
    uint64_t v2 = 0x65676172657661;
  }
  unint64_t v3 = 0xE500000000000000;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_10071BD08(void *a1@<X8>)
{
  *a1 = &off_1008B6688;
}

unint64_t sub_10071BD1C()
{
  unint64_t result = qword_10096B2F8;
  if (!qword_10096B2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10096B2F8);
  }
  return result;
}

_UNKNOWN **sub_10071BD70(char a1)
{
  if ((a1 - 1) > 0x10u) {
    return (_UNKNOWN **)&_swiftEmptyArrayStorage;
  }
  else {
    return off_1008D8A10[(char)(a1 - 1)];
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10071BDC4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[AppProtection] bundleIdentifier hidden, hiding app icon", v1, 2u);
}

void sub_10071BE08()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_10071BE2C(v0, v1, v2);
}

void sub_10071BE2C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[sharing-setup] %{public}@ Failed to complete end to end Cloud sync with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10071BEB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Existing move goal lookup failed with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_10071BF30(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Existing move goal lookup timed out", v1, 2u);
}

void sub_10071BF74()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "Error reading activity mode characteristic with error=%@", v2, v3, v4, v5, v6);
}

void sub_10071BFDC()
{
  sub_100106124(__stack_chk_guard);
  sub_1001060C4();
  sub_1001060DC((void *)&_mh_execute_header, v0, v1, "Error deleting future goals of type %@: %@");
}

void sub_10071C044(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Saving first daily goals and activity move mode timed out.", v1, 2u);
}

void sub_10071C088()
{
  sub_100106118();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[sharing-setup] Failed to complete end to end Cloud sync with error: %{public}@", v1, 0xCu);
}

void sub_10071C0FC()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "[sharing-setup] Could not force nano sync after saving activity goals: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10071C164()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "Error deleting goal schedule: %@", v2, v3, v4, v5, v6);
}

void sub_10071C1CC()
{
  sub_100106124(__stack_chk_guard);
  sub_1001060C4();
  sub_1001060DC((void *)&_mh_execute_header, v0, v1, "Failed to fetch active sample for type %@ error %@");
}

void sub_10071C234()
{
  sub_100106124(__stack_chk_guard);
  sub_1001060C4();
  sub_1001060DC((void *)&_mh_execute_header, v0, v1, "Failed to fetch most recent sample for type %@ error %@");
}

void sub_10071C29C()
{
  sub_100106124(__stack_chk_guard);
  sub_1001060C4();
  sub_1001060DC((void *)&_mh_execute_header, v0, v1, "Failed to fetch most recent samples for type %@ error %@");
}

void sub_10071C304()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "Error deleting existing goal schedule: %@", v2, v3, v4, v5, v6);
}

void sub_10071C36C()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "Error saving goal schedule: %@", v2, v3, v4, v5, v6);
}

void sub_10071C3D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Some destinations unreachable showing alert", v1, 2u);
}

void sub_10071C418(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error sending invite (%@), destination unreachable=%d", (uint8_t *)&v3, 0x12u);
}

void sub_10071C4A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error getting heart rate for workout: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10071C51C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error getting recovery heart rates: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10071C594(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error getting data (%@) for workout: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10071C620()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "[Workout Data Calculator] Did get an error back from effort observer query. Nil'ing it out and will respin next time.", v2, v3, v4, v5, v6);
}

void sub_10071C654()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Remainder distance should never be negative", v2, v3, v4, v5, v6);
}

void sub_10071C688()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Remainder should not be greater than splitDelimiter, should have been apportioned to its own split", v2, v3, v4, v5, v6);
}

void sub_10071C6BC()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Cannot calculate splits for nil distance samples or stroke samples. Returning empty splits", v2, v3, v4, v5, v6);
}

void sub_10071C6F0()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Cannot calculate splits for empty distance samples. Returning empty splits", v2, v3, v4, v5, v6);
}

void sub_10071C724()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Failed to properly interpolate stroke samples. Bailing.", v2, v3, v4, v5, v6);
}

void sub_10071C758(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to open knowledge base URL for no-heart-rate view with current locale.", v1, 2u);
}

void sub_10071C79C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to open knowledge base URL for no-heart-rate view with en_US locale. Giving up.", v1, 2u);
}

void sub_10071C7E0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "CHASActivitySetupMetricsCollectionViewController found unexpected presentation context %ld", (uint8_t *)&v3, 0xCu);
}

void sub_10071C85C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10071C8C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10071C934(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10071C9A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to animate tableView reloading.", v1, 2u);
}

void sub_10071C9E4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint8_t v6 = [v4 UUID];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error deleting workout: %@: %@", (uint8_t *)&v7, 0x16u);
}

void sub_10071CAA4()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "CHMoveModeUtilities failed to save activity move mode change: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10071CB0C()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "CHMoveModeUtilities failed to save new move goal and default exercise/stand goals for activity move mode: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10071CB74()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "CHMoveModeUtilities failed to force cloud sync after saving activity move mode: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10071CBDC()
{
  sub_100106118();
  sub_1001060FC((void *)&_mh_execute_header, v0, v1, "CHMoveModeUtilities failed to force nano sync after saving activity move mode: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10071CC44(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch watch accounts info with error: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10071CCC0()
{
  __assert_rtn("-[CHWorkoutDetailDataSource _registerCellClasses]", "CHWorkoutDetailDataSource.m", 479, "self.cellClassesBySection.count == CHWorkoutDetailSectionRowCount");
}

void sub_10071CCEC()
{
  __assert_rtn("-[CHWorkoutDetailDataSource _createTableItems]", "CHWorkoutDetailDataSource.m", 542, "self.tableSectionHeaders.count == CHWorkoutDetailSectionRowCount");
}

void sub_10071CD18(void *a1, uint64_t a2, double a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = +[NSNumber numberWithInteger:a2];
  int v7 = +[NSNumber numberWithDouble:a3];
  int v8 = 138544130;
  __int16 v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = &off_1008DE718;
  __int16 v12 = 2114;
  unint64_t v13 = v7;
  __int16 v14 = 2114;
  uint64_t v15 = &off_1008DE9B8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Workout heart rate chart unavailable for statistics pairs with data: %{public}@, mininum required: %{public}@, readings/min: %{public}@, minimum required: %{public}@", (uint8_t *)&v8, 0x2Au);
}

void sub_10071CE24(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve activity item providers for seymour workout: %@. Falling back to sharing generic workout", (uint8_t *)&v2, 0xCu);
}

void sub_10071CE9C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No result returned from AMS for bundle ID %@", (uint8_t *)&v3, 0xCu);
}

void sub_10071CF18(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fetching app info for bundle ID %@ failed with error %@", (uint8_t *)&v4, 0x16u);
}

void sub_10071CFA4(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  int v4 = sub_10014C63C();
  int v5 = 138412546;
  __int16 v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to create (%@) dir: %@", (uint8_t *)&v5, 0x16u);
}

void sub_10071D05C()
{
  sub_100151A84();
  sub_1001060DC((void *)&_mh_execute_header, v0, v1, "[FASC] An error occurred in initial fetch of activity summary query %@. Error: %@");
}

void sub_10071D0C4()
{
  sub_100151A84();
  sub_1001060DC((void *)&_mh_execute_header, v0, v1, "[FASC] An error occurred in update handler of activity summary query %@. Error: %@");
}

void sub_10071D12C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[CHWorkoutDataProvider] Error updating workouts: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10071D1A4(void **a1, void *a2)
{
  int v2 = *a1;
  uint64_t v3 = a2;
  int v4 = 134217984;
  id v5 = [v2 currentPhase];
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "PhoneSceneDelegate found unexpected onboarding phase %ld", (uint8_t *)&v4, 0xCu);
}

void sub_10071D240(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Data collection preference: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10071D2B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error reading data from workout sharing URL: %@ error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10071D340()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Not able to get sandbox using startAccessingSecurityScopedResource. Reading file might not work.", v2, v3, v4, v5, v6);
}

void sub_10071D374()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "[seymour] failed to navigate to tab", v2, v3, v4, v5, v6);
}

void sub_10071D3A8()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "[seymour] Failed to select tab", v2, v3, v4, v5, v6);
}

void sub_10071D3DC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown Fitness Coaching notification type (%d)", (uint8_t *)v2, 8u);
}

void sub_10071D454()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Invalid Fitness Coaching notification type", v2, v3, v4, v5, v6);
}

void sub_10071D488()
{
  sub_10011BEF8();
  sub_10011BEDC((void *)&_mh_execute_header, v0, v1, "Invalid Fitness Coaching goal recommendation", v2, v3, v4, v5, v6);
}

void sub_10071D4BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't find friend list section for date: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10071D534(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 UUID];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Couldn't find row for friend with UUID: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_10071D5DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No valid address, cannot send invitation", v1, 2u);
}

uint64_t dispatch thunk of WorkoutImageProvider.placeholderImage(for:width:)()
{
  return dispatch thunk of WorkoutImageProvider.placeholderImage(for:width:)();
}

uint64_t WorkoutImageProvider.init(healthStore:)()
{
  return WorkoutImageProvider.init(healthStore:)();
}

uint64_t type metadata accessor for WorkoutImageProvider()
{
  return type metadata accessor for WorkoutImageProvider();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.editSummaryButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.editSummaryButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.doneButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.doneButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.editButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.editButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.deleteButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.deleteButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.plusSignButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.plusSignButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.accountSettingsButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.accountSettingsButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.seeAllCategoriesButton.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.seeAllCategoriesButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.SummaryView.base.getter()
{
  return static FitnessAccessibilityIdentifier.SummaryView.base.getter();
}

uint64_t static FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView.addOrSwapButton.getter()
{
  return static FitnessAccessibilityIdentifier.CardTypeConfigurationRoomView.addOrSwapButton.getter();
}

uint64_t static FitnessAccessibilityIdentifier.build(_:)()
{
  return static FitnessAccessibilityIdentifier.build(_:)();
}

uint64_t static _AssistantIntentsProvider.uniqueEntities.getter()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t AppDependency.wrappedValue.getter()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t AppDependency.wrappedValue.setter()
{
  return AppDependency.wrappedValue.setter();
}

uint64_t AppDependency.__allocating_init(key:manager:)()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t type metadata accessor for AppIntentError()
{
  return type metadata accessor for AppIntentError();
}

uint64_t AppDependencyManager.add<A>(key:dependency:)()
{
  return AppDependencyManager.add<A>(key:dependency:)();
}

uint64_t static AppDependencyManager.shared.getter()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t type metadata accessor for AppDependencyManager()
{
  return type metadata accessor for AppDependencyManager();
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

uint64_t IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t IntentDialog.init(stringLiteral:)()
{
  return IntentDialog.init(stringLiteral:)();
}

uint64_t IntentDialog.init(stringInterpolation:)()
{
  return IntentDialog.init(stringInterpolation:)();
}

uint64_t IntentDialog.init<A, B>(from:)()
{
  return IntentDialog.init<A, B>(from:)();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t IntentDialog.init(_:)()
{
  return IntentDialog.init(_:)();
}

uint64_t static IntentResult.result<A, B, C>(value:opensIntent:dialog:view:)()
{
  return static IntentResult.result<A, B, C>(value:opensIntent:dialog:view:)();
}

uint64_t static IntentResult.result<A>(value:dialog:)()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t static IntentResult.result<A>(value:)()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t static IntentResult.result<>(dialog:)()
{
  return static IntentResult.result<>(dialog:)();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t ViewLocation.init(x:y:z:width:height:depth:)()
{
  return ViewLocation.init(x:y:z:width:height:depth:)();
}

uint64_t type metadata accessor for ViewLocation()
{
  return type metadata accessor for ViewLocation();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t EntityProperty.wrappedValue.setter()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t EntityProperty.projectedValue.getter()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t EntityProperty<>.init(title:)()
{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

{
  return EntityProperty<>.init(title:)();
}

uint64_t EntityProperty<>.init(title:_get:)()
{
  return EntityProperty<>.init(title:_get:)();
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

uint64_t IntentParameter.needsValueError(_:)()
{
  return IntentParameter.needsValueError(_:)();
}

uint64_t IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:optionsProvider:)()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:optionsProvider:)();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:optionsProvider:)()
{
  return IntentParameter<>.init<A>(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:optionsProvider:)();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:kind:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:kind:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:controlStyle:inclusiveRange:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:controlStyle:inclusiveRange:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentProjection.subscript.getter()
{
  return IntentProjection.subscript.getter();
}

uint64_t _AssistantIntent.IntentProjection.subscript.getter()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
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

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock()()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
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

uint64_t _AssistantIntent.init<A>(_:phrases:parameterValues:)()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t type metadata accessor for StringSearchScope()
{
  return type metadata accessor for StringSearchScope();
}

uint64_t StringSearchCriteria.term.getter()
{
  return StringSearchCriteria.term.getter();
}

uint64_t type metadata accessor for StringSearchCriteria()
{
  return type metadata accessor for StringSearchCriteria();
}

uint64_t URLRepresentableEnum.urlRepresentation.getter()
{
  return URLRepresentableEnum.urlRepresentation.getter();
}

uint64_t URLRepresentableEnum.urlRepresentationParameter.getter()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t static _DialogBuilderEntity.buildBlock<A>(_:)()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t static _DialogBuilderEntity.buildBlock<A, B>(_:_:)()
{
  return static _DialogBuilderEntity.buildBlock<A, B>(_:_:)();
}

uint64_t static _DialogBuilderEntity.buildExpression<A>(_:)()
{
  return static _DialogBuilderEntity.buildExpression<A>(_:)();
}

uint64_t DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)()
{
  return DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:synonyms:)()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t type metadata accessor for DisplayRepresentation()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t EnumURLRepresentation.StringInterpolation.appendInterpolation(_:)()
{
  return EnumURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall EnumURLRepresentation.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t EnumURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return EnumURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t EnumURLRepresentation.init(stringInterpolation:)()
{
  return EnumURLRepresentation.init(stringInterpolation:)();
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

uint64_t IntentParameterSummary.init(_:table:_:)()
{
  return IntentParameterSummary.init(_:table:_:)();
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

uint64_t ParameterSummaryString.init(stringLiteral:)()
{
  return ParameterSummaryString.init(stringLiteral:)();
}

uint64_t ParameterSummaryString.init(stringInterpolation:)()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t URLRepresentableEntity.urlRepresentationParameter.getter()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t EntityURLRepresentation.init(stringInterpolation:)()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t IntentURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return IntentURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall IntentURLRepresentation.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t IntentURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return IntentURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t IntentURLRepresentation.init(stringInterpolation:)()
{
  return IntentURLRepresentation.init(stringInterpolation:)();
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

uint64_t type metadata accessor for StringComparisonOperator()
{
  return type metadata accessor for StringComparisonOperator();
}

uint64_t type metadata accessor for _GeneratedContentOptions()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t IntentParameterDependency.wrappedValue.getter()
{
  return IntentParameterDependency.wrappedValue.getter();
}

uint64_t IntentParameterDependency.__allocating_init<A, B>(_:)()
{
  return IntentParameterDependency.__allocating_init<A, B>(_:)();
}

uint64_t TypeDisplayRepresentation.init(stringLiteral:)()
{
  return TypeDisplayRepresentation.init(stringLiteral:)();
}

uint64_t TypeDisplayRepresentation.init(name:numericFormat:)()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t type metadata accessor for TypeDisplayRepresentation()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t type metadata accessor for _GeneratedContentFallback()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t _GeneratedContentFallback.init(_:localeIdentifier:)()
{
  return _GeneratedContentFallback.init(_:localeIdentifier:)();
}

uint64_t _RepresentedEntityElement.init<A>(appEntity:geometry:state:subelements:)()
{
  return _RepresentedEntityElement.init<A>(appEntity:geometry:state:subelements:)();
}

uint64_t type metadata accessor for _RepresentedEntityElement()
{
  return type metadata accessor for _RepresentedEntityElement();
}

uint64_t type metadata accessor for HasValueComparisonOperator()
{
  return type metadata accessor for HasValueComparisonOperator();
}

uint64_t ForegroundContinuableIntent.needsToContinueInForegroundError(_:requestConfirmation:continuation:)()
{
  return ForegroundContinuableIntent.needsToContinueInForegroundError(_:requestConfirmation:continuation:)();
}

uint64_t static ParameterSummaryCaseBuilder.buildBlock<A, B, C>(_:_:_:)()
{
  return static ParameterSummaryCaseBuilder.buildBlock<A, B, C>(_:_:_:)();
}

uint64_t static ParameterSummaryCaseBuilder.buildBlock<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  return static ParameterSummaryCaseBuilder.buildBlock<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)();
}

uint64_t static ParameterSummaryCaseBuilder.buildExpression<A>(_:)()
{
  return static ParameterSummaryCaseBuilder.buildExpression<A>(_:)();
}

uint64_t ParameterSummaryCaseCondition.init(_:_:)()
{
  return ParameterSummaryCaseCondition.init(_:_:)();
}

uint64_t ParameterSummaryWhenCondition.init<A>(_:identifier:_:_:otherwise:)()
{
  return ParameterSummaryWhenCondition.init<A>(_:identifier:_:_:otherwise:)();
}

uint64_t ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)()
{
  return ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)();
}

uint64_t ParameterSummaryDefaultCaseCondition.init(_:)()
{
  return ParameterSummaryDefaultCaseCondition.init(_:)();
}

uint64_t AppCoordinator.init(dependencies:)()
{
  return AppCoordinator.init(dependencies:)();
}

uint64_t AppCoordinator.navigateToURL(_:annotation:)()
{
  return AppCoordinator.navigateToURL(_:annotation:)();
}

uint64_t AppCoordinator.navigateToRequest(_:)()
{
  return AppCoordinator.navigateToRequest(_:)();
}

uint64_t AppCoordinator.rootViewController.getter()
{
  return AppCoordinator.rootViewController.getter();
}

uint64_t AppCoordinator.navigateToUserActivity(_:annotation:)()
{
  return AppCoordinator.navigateToUserActivity(_:annotation:)();
}

uint64_t type metadata accessor for AppCoordinator()
{
  return type metadata accessor for AppCoordinator();
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t static FormatStyle<>.dateTime.getter()
{
  return static FormatStyle<>.dateTime.getter();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t static Measurement.< infix<A, B>(_:_:)()
{
  return static Measurement.< infix<A, B>(_:_:)();
}

uint64_t static Measurement._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Measurement.unit.getter()
{
  return Measurement.unit.getter();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t static Measurement<>.+ infix(_:_:)()
{
  return static Measurement<>.+ infix(_:_:)();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t Measurement<>.formatted()()
{
  return Measurement<>.formatted()();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t CharacterSet.contains(_:)()
{
  return CharacterSet.contains(_:)();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t DateInterval.intersects(_:)()
{
  return DateInterval.intersects(_:)();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)DateInterval._bridgeToObjectiveC()();
}

uint64_t static DateInterval.== infix(_:_:)()
{
  return static DateInterval.== infix(_:_:)();
}

uint64_t static DateInterval._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t DateInterval.end.getter()
{
  return DateInterval.end.getter();
}

uint64_t DateInterval.init(start:end:)()
{
  return DateInterval.init(start:end:)();
}

uint64_t DateInterval.init(start:duration:)()
{
  return DateInterval.init(start:duration:)();
}

uint64_t DateInterval.start.getter()
{
  return DateInterval.start.getter();
}

uint64_t DateInterval.contains(_:)()
{
  return DateInterval.contains(_:)();
}

uint64_t DateInterval.duration.getter()
{
  return DateInterval.duration.getter();
}

uint64_t type metadata accessor for DateInterval()
{
  return type metadata accessor for DateInterval();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.name.getter()
{
  return Notification.name.getter();
}

uint64_t Notification.object.getter()
{
  return Notification.object.getter();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

NSURLComponents __swiftcall URLComponents._bridgeToObjectiveC()()
{
  return (NSURLComponents)URLComponents._bridgeToObjectiveC()();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.host.getter()
{
  return URLComponents.host.getter();
}

uint64_t URLComponents.host.setter()
{
  return URLComponents.host.setter();
}

uint64_t URLComponents.path.setter()
{
  return URLComponents.path.setter();
}

uint64_t URLComponents.scheme.getter()
{
  return URLComponents.scheme.getter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t DateComponents.description.getter()
{
  return DateComponents.description.getter();
}

NSDateComponents __swiftcall DateComponents._bridgeToObjectiveC()()
{
  return (NSDateComponents)DateComponents._bridgeToObjectiveC()();
}

uint64_t static DateComponents.== infix(_:_:)()
{
  return static DateComponents.== infix(_:_:)();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t DateComponents.day.getter()
{
  return DateComponents.day.getter();
}

uint64_t DateComponents.day.setter()
{
  return DateComponents.day.setter();
}

uint64_t DateComponents.era.getter()
{
  return DateComponents.era.getter();
}

uint64_t DateComponents.date.getter()
{
  return DateComponents.date.getter();
}

uint64_t DateComponents.hour.getter()
{
  return DateComponents.hour.getter();
}

uint64_t DateComponents.hour.setter()
{
  return DateComponents.hour.setter();
}

uint64_t DateComponents.year.getter()
{
  return DateComponents.year.getter();
}

uint64_t DateComponents.year.setter()
{
  return DateComponents.year.setter();
}

uint64_t DateComponents.month.getter()
{
  return DateComponents.month.getter();
}

uint64_t DateComponents.minute.getter()
{
  return DateComponents.minute.getter();
}

uint64_t DateComponents.minute.setter()
{
  return DateComponents.minute.setter();
}

uint64_t DateComponents.second.getter()
{
  return DateComponents.second.getter();
}

uint64_t DateComponents.second.setter()
{
  return DateComponents.second.setter();
}

uint64_t DateComponents.weekday.getter()
{
  return DateComponents.weekday.getter();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t DateComponents.dayOfYear.getter()
{
  return DateComponents.dayOfYear.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t SortDescriptor.init<A>(_:order:)()
{
  return SortDescriptor.init<A>(_:order:)();
}

uint64_t type metadata accessor for AttributeScopes.FoundationAttributes.MeasurementAttribute.Component()
{
  return type metadata accessor for AttributeScopes.FoundationAttributes.MeasurementAttribute.Component();
}

uint64_t AttributeScopes.FoundationAttributes.measurement.getter()
{
  return AttributeScopes.FoundationAttributes.measurement.getter();
}

uint64_t AttributeScopes.UIKitAttributes.foregroundColor.getter()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t AttributeScopes.UIKitAttributes.font.getter()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.foregroundColor.getter()
{
  return AttributeScopes.SwiftUIAttributes.foregroundColor.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.font.getter()
{
  return AttributeScopes.SwiftUIAttributes.font.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.textScale.getter()
{
  return AttributeScopes.SwiftUIAttributes.textScale.getter();
}

uint64_t AttributedString.characters.modify()
{
  return AttributedString.characters.modify();
}

uint64_t AttributedString.CharacterView.replaceSubrange<A>(_:with:)()
{
  return AttributedString.CharacterView.replaceSubrange<A>(_:with:)();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return type metadata accessor for AttributedString.CharacterView();
}

uint64_t AttributedString.subscript.setter()
{
  return AttributedString.subscript.setter();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t AttributedString.mergeAttributes(_:mergePolicy:)()
{
  return AttributedString.mergeAttributes(_:mergePolicy:)();
}

uint64_t AttributedString.replaceSubrange<A, B>(_:with:)()
{
  return AttributedString.replaceSubrange<A, B>(_:with:)();
}

uint64_t type metadata accessor for AttributedString.AttributeMergePolicy()
{
  return type metadata accessor for AttributedString.AttributeMergePolicy();
}

uint64_t AttributedString.Runs.Run.subscript.getter()
{
  return AttributedString.Runs.Run.subscript.getter();
}

uint64_t AttributedString.Runs.Run.range.getter()
{
  return AttributedString.Runs.Run.range.getter();
}

uint64_t type metadata accessor for AttributedString.Runs.Run()
{
  return type metadata accessor for AttributedString.Runs.Run();
}

uint64_t type metadata accessor for AttributedString.Runs.Index()
{
  return type metadata accessor for AttributedString.Runs.Index();
}

uint64_t type metadata accessor for AttributedString.Runs()
{
  return type metadata accessor for AttributedString.Runs();
}

uint64_t AttributedString.runs.getter()
{
  return AttributedString.runs.getter();
}

uint64_t AttributedString.append<A>(_:)()
{
  return AttributedString.append<A>(_:)();
}

NSAttributedString __swiftcall AttributedString.nsAttributedStringWithMatchingTextScales(font:)(UIFont font)
{
  return (NSAttributedString)AttributedString.nsAttributedStringWithMatchingTextScales(font:)(font.super.isa);
}

uint64_t AttributedString.with(font:)()
{
  return AttributedString.with(font:)();
}

uint64_t AttributedString.init()()
{
  return AttributedString.init()();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t AttributedString.subscript.modify()
{
  return AttributedString.subscript.modify();
}

uint64_t AttributedString.subscript.getter()
{
  return AttributedString.subscript.getter();
}

uint64_t AttributedString.init(_:)()
{
  return AttributedString.init(_:)();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t AttributeContainer.subscript.setter()
{
  return AttributeContainer.subscript.setter();
}

uint64_t AttributeContainer.subscript.getter()
{
  return AttributeContainer.subscript.getter();
}

uint64_t AttributeContainer.Builder.callAsFunction(_:)()
{
  return AttributeContainer.Builder.callAsFunction(_:)();
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeContainer.init(_:)()
{
  return AttributeContainer.init(_:)();
}

uint64_t type metadata accessor for NSIndexSetIterator()
{
  return type metadata accessor for NSIndexSetIterator();
}

uint64_t AttributedSubstring.characters.getter()
{
  return AttributedSubstring.characters.getter();
}

uint64_t AttributedSubstring.subscript.setter()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t type metadata accessor for AttributedSubstring()
{
  return type metadata accessor for AttributedSubstring();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
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

uint64_t AttributedStringProtocol.range<A>(of:options:locale:)()
{
  return AttributedStringProtocol.range<A>(of:options:locale:)();
}

uint64_t FloatingPointFormatStyle.init(locale:)()
{
  return FloatingPointFormatStyle.init(locale:)();
}

uint64_t FloatingPointFormatStyle.rounded(rule:increment:)()
{
  return FloatingPointFormatStyle.rounded(rule:increment:)();
}

uint64_t FloatingPointFormatStyle.precision(_:)()
{
  return FloatingPointFormatStyle.precision(_:)();
}

uint64_t NSKeyValueObservedChange.newValue.getter()
{
  return NSKeyValueObservedChange.newValue.getter();
}

uint64_t NSKeyValueObservedChange.oldValue.getter()
{
  return NSKeyValueObservedChange.oldValue.getter();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t static NumberFormatStyleConfiguration.Precision.fractionLength(_:)()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength(_:)();
}

uint64_t type metadata accessor for NumberFormatStyleConfiguration.Precision()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Precision();
}

uint64_t static FormatStyleCapitalizationContext.unknown.getter()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t type metadata accessor for FormatStyleCapitalizationContext()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.pathComponents.getter()
{
  return URL.pathComponents.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL.== infix(_:_:)()
{
  return static URL.== infix(_:_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.host.getter()
{
  return URL.host.getter();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.queryItems.getter()
{
  return URL.queryItems.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.FormatStyle.TimeStyle.omitted.getter()
{
  return static Date.FormatStyle.TimeStyle.omitted.getter();
}

uint64_t static Date.FormatStyle.TimeStyle.standard.getter()
{
  return static Date.FormatStyle.TimeStyle.standard.getter();
}

uint64_t static Date.FormatStyle.TimeStyle.shortened.getter()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.TimeStyle()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t static Date.FormatStyle.DateStyle.long.getter()
{
  return static Date.FormatStyle.DateStyle.long.getter();
}

uint64_t static Date.FormatStyle.DateStyle.omitted.getter()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t static Date.FormatStyle.DateStyle.complete.getter()
{
  return static Date.FormatStyle.DateStyle.complete.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.DateStyle()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t Date.FormatStyle.hour(_:)()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t static Date.FormatStyle.Symbol.Hour.defaultDigits(amPM:)()
{
  return static Date.FormatStyle.Symbol.Hour.defaultDigits(amPM:)();
}

uint64_t static Date.FormatStyle.Symbol.Hour.AMPMStyle.omitted.getter()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.omitted.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Hour()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t static Date.FormatStyle.Symbol.Weekday.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Weekday.abbreviated.getter();
}

uint64_t static Date.FormatStyle.Symbol.Weekday.narrow.getter()
{
  return static Date.FormatStyle.Symbol.Weekday.narrow.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Weekday()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Weekday();
}

uint64_t Date.FormatStyle.weekday(_:)()
{
  return Date.FormatStyle.weekday(_:)();
}

uint64_t type metadata accessor for Date.FormatStyle()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t Date.offset(until:pauseTimes:lastUnbalancedPauseStart:)()
{
  return Date.offset(until:pauseTimes:lastUnbalancedPauseStart:)();
}

uint64_t Date.description.getter()
{
  return Date.description.getter();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t static Date.distantFuture.getter()
{
  return static Date.distantFuture.getter();
}

uint64_t Date.startOfFitnessWeek(for:)()
{
  return Date.startOfFitnessWeek(for:)();
}

uint64_t Date.bySubtracting(component:value:calendar:)()
{
  return Date.bySubtracting(component:value:calendar:)();
}

uint64_t Date.isAfterOrEqualTo(date:)()
{
  return Date.isAfterOrEqualTo(date:)();
}

uint64_t Date.isBeforeOrEqualTo(date:)()
{
  return Date.isBeforeOrEqualTo(date:)();
}

uint64_t Date.isAfter(date:)()
{
  return Date.isAfter(date:)();
}

uint64_t Date.byAdding(component:value:calendar:)()
{
  return Date.byAdding(component:value:calendar:)();
}

uint64_t Date.debugDescription.getter()
{
  return Date.debugDescription.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
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

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.isSameDay(as:)()
{
  return Date.isSameDay(as:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.compare(_:)()
{
  return Date.compare(_:)();
}

uint64_t Date.dayOfMonth(in:)()
{
  return Date.dayOfMonth(in:)();
}

uint64_t Date.isSameDay(as:timeZone:)()
{
  return Date.isSameDay(as:timeZone:)();
}

uint64_t Date.formatted(date:time:)()
{
  return Date.formatted(date:time:)();
}

Swift::String __swiftcall Date.formatted()()
{
  uint64_t v0 = Date.formatted()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Date.formatted<A>(_:)()
{
  return Date.formatted<A>(_:)();
}

uint64_t Date.hashValue.getter()
{
  return Date.hashValue.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.description.getter()
{
  return UUID.description.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t Locale.LanguageCode.identifier.getter()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return type metadata accessor for Locale.LanguageCode();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Locale.Region.identifier.getter()
{
  return Locale.Region.identifier.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t Locale.region.getter()
{
  return Locale.region.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.languageCode.getter()
{
  return Locale.Language.languageCode.getter();
}

uint64_t type metadata accessor for Locale.Language()
{
  return type metadata accessor for Locale.Language();
}

uint64_t Locale.language.getter()
{
  return Locale.language.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t Calendar.init(identifier:)()
{
  return Calendar.init(identifier:)();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t Calendar.isDateInToday(_:)()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return Calendar.dateComponents(_:from:)();
}

NSCalendar __swiftcall Calendar._bridgeToObjectiveC()()
{
  return (NSCalendar)Calendar._bridgeToObjectiveC()();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t static Calendar._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Calendar.date(from:)()
{
  return Calendar.date(from:)();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t Calendar.date(byAdding:value:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t Calendar.isDate(_:inSameDayAs:)()
{
  return Calendar.isDate(_:inSameDayAs:)();
}

uint64_t Calendar.locale.setter()
{
  return Calendar.locale.setter();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t Calendar.timeZone.setter()
{
  return Calendar.timeZone.setter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t Calendar.component(_:from:)()
{
  return Calendar.component(_:from:)();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t type metadata accessor for IndexSet.Index()
{
  return type metadata accessor for IndexSet.Index();
}

void __swiftcall IndexSet._bridgeToObjectiveC()(NSIndexSet *__return_ptr retstr)
{
}

uint64_t static IndexSet._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexSet.count.getter()
{
  return IndexSet.count.getter();
}

uint64_t IndexSet.union(_:)()
{
  return IndexSet.union(_:)();
}

Swift::tuple_inserted_Bool_memberAfterInsert_Int __swiftcall IndexSet.insert(_:)(Swift::Int a1)
{
  char v1 = IndexSet.insert(_:)(a1);
  result.memberAfterInsert = v2;
  result.inserted = v1;
  return result;
}

uint64_t IndexSet.init(integer:)()
{
  return IndexSet.init(integer:)();
}

uint64_t IndexSet.isEmpty.getter()
{
  return IndexSet.isEmpty.getter();
}

Swift::Bool __swiftcall IndexSet.contains(_:)(Swift::Int a1)
{
  return IndexSet.contains(_:)(a1);
}

uint64_t IndexSet.init()()
{
  return IndexSet.init()();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t TimeZone.isDaylightSavingTime(for:)()
{
  return TimeZone.isDaylightSavingTime(for:)();
}

uint64_t TimeZone.abbreviation(for:)()
{
  return TimeZone.abbreviation(for:)();
}

uint64_t TimeZone.secondsFromGMT(for:)()
{
  return TimeZone.secondsFromGMT(for:)();
}

uint64_t TimeZone.init(secondsFromGMT:)()
{
  return TimeZone.init(secondsFromGMT:)();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(row:section:)()
{
  return IndexPath.init(row:section:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
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

uint64_t WeatherCondition.conditionIcon(isDaylight:isFilled:forLightBackground:)()
{
  return WeatherCondition.conditionIcon(isDaylight:isFilled:forLightBackground:)();
}

uint64_t type metadata accessor for WeatherCondition()
{
  return type metadata accessor for WeatherCondition();
}

uint64_t WorkoutPlan.Route.init(points:snapshot:)()
{
  return WorkoutPlan.Route.init(points:snapshot:)();
}

uint64_t WorkoutPlan.Route.snapshot.getter()
{
  return WorkoutPlan.Route.snapshot.getter();
}

uint64_t type metadata accessor for WorkoutPlan.Route()
{
  return type metadata accessor for WorkoutPlan.Route();
}

uint64_t RoutePoint.init(coordinate:altitude:)()
{
  return RoutePoint.init(coordinate:altitude:)();
}

uint64_t type metadata accessor for RoutePoint()
{
  return type metadata accessor for RoutePoint();
}

uint64_t static WKAnalyticsEvent.metricPlatters(_:activityType:configurationType:duration:isIndoor:swimmingLocationType:)()
{
  return static WKAnalyticsEvent.metricPlatters(_:activityType:configurationType:duration:isIndoor:swimmingLocationType:)();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t Activity.attributes.getter()
{
  return Activity.attributes.getter();
}

uint64_t static Activity.request(attributes:content:pushType:)()
{
  return static Activity.request(attributes:content:pushType:)();
}

uint64_t ActivityAuthorizationInfo.areActivitiesEnabled.getter()
{
  return ActivityAuthorizationInfo.areActivitiesEnabled.getter();
}

uint64_t ActivityAuthorizationInfo.init()()
{
  return ActivityAuthorizationInfo.init()();
}

uint64_t type metadata accessor for ActivityAuthorizationInfo()
{
  return type metadata accessor for ActivityAuthorizationInfo();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t type metadata accessor for PushType()
{
  return type metadata accessor for PushType();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t IntroSheet.firstAppLaunchTriggerConditionInDays.getter()
{
  return IntroSheet.firstAppLaunchTriggerConditionInDays.getter();
}

uint64_t IntroSheet.items.getter()
{
  return IntroSheet.items.getter();
}

uint64_t IntroSheet.title.getter()
{
  return IntroSheet.title.getter();
}

uint64_t type metadata accessor for IntroSheet()
{
  return type metadata accessor for IntroSheet();
}

uint64_t MetricPage.init(pageIdentifier:pageType:pageContext:pageUrl:pageName:)()
{
  return MetricPage.init(pageIdentifier:pageType:pageContext:pageUrl:pageName:)();
}

uint64_t type metadata accessor for MetricPage()
{
  return type metadata accessor for MetricPage();
}

uint64_t MusicGenre.identifier.getter()
{
  return MusicGenre.identifier.getter();
}

uint64_t MusicGenre.name.getter()
{
  return MusicGenre.name.getter();
}

uint64_t type metadata accessor for MusicGenre()
{
  return type metadata accessor for MusicGenre();
}

uint64_t SkillLevel.identifier.getter()
{
  return SkillLevel.identifier.getter();
}

uint64_t SkillLevel.name.getter()
{
  return SkillLevel.name.getter();
}

uint64_t type metadata accessor for SkillLevel()
{
  return type metadata accessor for SkillLevel();
}

uint64_t type metadata accessor for CatalogLink()
{
  return type metadata accessor for CatalogLink();
}

uint64_t MediaMoment.artwork.getter()
{
  return MediaMoment.artwork.getter();
}

uint64_t type metadata accessor for MediaMoment()
{
  return type metadata accessor for MediaMoment();
}

uint64_t MetricClick.init(actionContext:actionType:actionURL:impressionsData:locations:offerType:targetIdentifier:targetIdentifierType:targetType:marketingFields:marketingMessageIdentifier:marketingPlacement:)()
{
  return MetricClick.init(actionContext:actionType:actionURL:impressionsData:locations:offerType:targetIdentifier:targetIdentifierType:targetType:marketingFields:marketingMessageIdentifier:marketingPlacement:)();
}

uint64_t type metadata accessor for MetricClick()
{
  return type metadata accessor for MetricClick();
}

uint64_t ActivityRing.goal.getter()
{
  return ActivityRing.goal.getter();
}

uint64_t ActivityRing.value.getter()
{
  return ActivityRing.value.getter();
}

uint64_t type metadata accessor for ActivityRing()
{
  return type metadata accessor for ActivityRing();
}

uint64_t CatalogTheme.identifier.getter()
{
  return CatalogTheme.identifier.getter();
}

uint64_t CatalogTheme.name.getter()
{
  return CatalogTheme.name.getter();
}

uint64_t type metadata accessor for CatalogTheme()
{
  return type metadata accessor for CatalogTheme();
}

uint64_t static Dependencies.browsing(wheelchairStatus:queue:)()
{
  return static Dependencies.browsing(wheelchairStatus:queue:)();
}

uint64_t static Dependencies.standard(queue:)()
{
  return static Dependencies.standard(queue:)();
}

uint64_t dispatch thunk of Dependencies.resolve<A>(failureHandler:)()
{
  return dispatch thunk of Dependencies.resolve<A>(failureHandler:)();
}

uint64_t type metadata accessor for Dependencies()
{
  return type metadata accessor for Dependencies();
}

uint64_t PlaylistItem.init(identifier:index:healthKitActivityType:mediaType:duration:)()
{
  return PlaylistItem.init(identifier:index:healthKitActivityType:mediaType:duration:)();
}

uint64_t type metadata accessor for PlaylistItem()
{
  return type metadata accessor for PlaylistItem();
}

uint64_t static PortableEnum<>.== infix(_:_:)()
{
  return static PortableEnum<>.== infix(_:_:)();
}

{
  return static PortableEnum<>.== infix(_:_:)();
}

uint64_t ScoreSummary.scale(by:)()
{
  return ScoreSummary.scale(by:)();
}

uint64_t ScoreSummary.description.getter()
{
  return ScoreSummary.description.getter();
}

uint64_t ScoreSummary.init(elapsedSeconds:personalScore:communityLowerScore:communityLowerMiddleScore:communityUpperMiddleScore:communityUpperScore:)()
{
  return ScoreSummary.init(elapsedSeconds:personalScore:communityLowerScore:communityLowerMiddleScore:communityUpperMiddleScore:communityUpperScore:)();
}

uint64_t type metadata accessor for ScoreSummary()
{
  return type metadata accessor for ScoreSummary();
}

uint64_t ActivityRings.move.getter()
{
  return ActivityRings.move.getter();
}

uint64_t ActivityRings.stand.getter()
{
  return ActivityRings.stand.getter();
}

uint64_t ActivityRings.exercise.getter()
{
  return ActivityRings.exercise.getter();
}

uint64_t type metadata accessor for ActivityRings()
{
  return type metadata accessor for ActivityRings();
}

uint64_t CatalogLockup.detailTags.getter()
{
  return CatalogLockup.detailTags.getter();
}

uint64_t CatalogLockup.identifier.getter()
{
  return CatalogLockup.identifier.getter();
}

uint64_t CatalogLockup.description.getter()
{
  return CatalogLockup.description.getter();
}

uint64_t CatalogLockup.streamingURL.getter()
{
  return CatalogLockup.streamingURL.getter();
}

uint64_t CatalogLockup.subtitleTags.getter()
{
  return CatalogLockup.subtitleTags.getter();
}

uint64_t CatalogLockup.streamingTitle.getter()
{
  return CatalogLockup.streamingTitle.getter();
}

uint64_t CatalogLockup.streamingArtwork.getter()
{
  return CatalogLockup.streamingArtwork.getter();
}

uint64_t CatalogLockup.artworkDescriptor.getter()
{
  return CatalogLockup.artworkDescriptor.getter();
}

uint64_t CatalogLockup.streamingSubtitle.getter()
{
  return CatalogLockup.streamingSubtitle.getter();
}

uint64_t CatalogLockup.streamingArtworkCropCode.getter()
{
  return CatalogLockup.streamingArtworkCropCode.getter();
}

uint64_t CatalogLockup.copyWith(accessibilityTitle:actionTags:artworkDescriptor:bundleDateRequested:bundleLoadStatus:bundleProgress:bundleReason:completedCount:contentRating:contextMenuSubtitleTags:contextMenuTitleTags:dateBookmarked:detailTags:duration:dynamicBrickDisplayStyle:editorialCardIdentifier:healthKitActivityTypes:identifier:isIncompletePlanWorkout:link:mediaType:recencyTag:referenceType:streamingArtwork:streamingArtworkCropCode:streamingSubtitle:streamingTitle:streamingURL:subtitleTags:subtitleTextAttribute:titleTags:titleTextAttribute:)()
{
  return CatalogLockup.copyWith(accessibilityTitle:actionTags:artworkDescriptor:bundleDateRequested:bundleLoadStatus:bundleProgress:bundleReason:completedCount:contentRating:contextMenuSubtitleTags:contextMenuTitleTags:dateBookmarked:detailTags:duration:dynamicBrickDisplayStyle:editorialCardIdentifier:healthKitActivityTypes:identifier:isIncompletePlanWorkout:link:mediaType:recencyTag:referenceType:streamingArtwork:streamingArtworkCropCode:streamingSubtitle:streamingTitle:streamingURL:subtitleTags:subtitleTextAttribute:titleTags:titleTextAttribute:)();
}

uint64_t CatalogLockup.mediaType.getter()
{
  return CatalogLockup.mediaType.getter();
}

uint64_t CatalogLockup.titleTags.getter()
{
  return CatalogLockup.titleTags.getter();
}

uint64_t type metadata accessor for CatalogLockup()
{
  return type metadata accessor for CatalogLockup();
}

uint64_t Configuration.filterDurations.getter()
{
  return Configuration.filterDurations.getter();
}

uint64_t type metadata accessor for Configuration()
{
  return type metadata accessor for Configuration();
}

uint64_t MediaDuration.lowerBuffer.getter()
{
  return MediaDuration.lowerBuffer.getter();
}

uint64_t MediaDuration.upperBuffer.getter()
{
  return MediaDuration.upperBuffer.getter();
}

uint64_t MediaDuration.duration.getter()
{
  return MediaDuration.duration.getter();
}

uint64_t type metadata accessor for MediaDuration()
{
  return type metadata accessor for MediaDuration();
}

uint64_t type metadata accessor for TextAttribute()
{
  return type metadata accessor for TextAttribute();
}

uint64_t TrainerDetail.trainer.getter()
{
  return TrainerDetail.trainer.getter();
}

uint64_t WhatsNewSheet.introSheetTriggerConditionInDays.getter()
{
  return WhatsNewSheet.introSheetTriggerConditionInDays.getter();
}

uint64_t WhatsNewSheet.whatsNewSheetTriggerConditionInDays.getter()
{
  return WhatsNewSheet.whatsNewSheetTriggerConditionInDays.getter();
}

uint64_t WhatsNewSheet.expirationDate.getter()
{
  return WhatsNewSheet.expirationDate.getter();
}

uint64_t WhatsNewSheet.items.getter()
{
  return WhatsNewSheet.items.getter();
}

uint64_t WhatsNewSheet.title.getter()
{
  return WhatsNewSheet.title.getter();
}

uint64_t WhatsNewSheet.version.getter()
{
  return WhatsNewSheet.version.getter();
}

uint64_t WhatsNewSheet.startDate.getter()
{
  return WhatsNewSheet.startDate.getter();
}

uint64_t type metadata accessor for WhatsNewSheet()
{
  return type metadata accessor for WhatsNewSheet();
}

uint64_t CatalogWorkout.identifier.getter()
{
  return CatalogWorkout.identifier.getter();
}

uint64_t CatalogWorkout.mediaMoments.getter()
{
  return CatalogWorkout.mediaMoments.getter();
}

uint64_t CatalogWorkout.duration.getter()
{
  return CatalogWorkout.duration.getter();
}

uint64_t CatalogWorkout.modality.getter()
{
  return CatalogWorkout.modality.getter();
}

uint64_t CatalogWorkout.mediaType.getter()
{
  return CatalogWorkout.mediaType.getter();
}

uint64_t type metadata accessor for CatalogWorkout()
{
  return type metadata accessor for CatalogWorkout();
}

uint64_t MetricLocation.init(identifier:identifierType:index:name:elementType:metadata:)()
{
  return MetricLocation.init(identifier:identifierType:index:name:elementType:metadata:)();
}

uint64_t type metadata accessor for MetricLocation()
{
  return type metadata accessor for MetricLocation();
}

uint64_t Recommendation.referenceIdentifier.getter()
{
  return Recommendation.referenceIdentifier.getter();
}

uint64_t Recommendation.index.getter()
{
  return Recommendation.index.getter();
}

uint64_t type metadata accessor for Recommendation()
{
  return type metadata accessor for Recommendation();
}

uint64_t ArchivedSession.scoreSummary.getter()
{
  return ArchivedSession.scoreSummary.getter();
}

uint64_t CatalogModality.name.getter()
{
  return CatalogModality.name.getter();
}

uint64_t type metadata accessor for CatalogModality()
{
  return type metadata accessor for CatalogModality();
}

uint64_t EngagementBadge.identifier.getter()
{
  return EngagementBadge.identifier.getter();
}

uint64_t type metadata accessor for EngagementBadge()
{
  return type metadata accessor for EngagementBadge();
}

uint64_t static MetricConstants.itemIdentifierType.getter()
{
  return static MetricConstants.itemIdentifierType.getter();
}

uint64_t type metadata accessor for ActivityMoveRing()
{
  return type metadata accessor for ActivityMoveRing();
}

uint64_t type metadata accessor for MetricIdentifier()
{
  return type metadata accessor for MetricIdentifier();
}

uint64_t TrainerReference.identifier.getter()
{
  return TrainerReference.identifier.getter();
}

uint64_t TrainerReference.informalName.getter()
{
  return TrainerReference.informalName.getter();
}

uint64_t type metadata accessor for TrainerReference()
{
  return type metadata accessor for TrainerReference();
}

uint64_t ArtworkDescriptor.standardArtworkDescriptor.getter()
{
  return ArtworkDescriptor.standardArtworkDescriptor.getter();
}

uint64_t type metadata accessor for ArtworkDescriptor()
{
  return type metadata accessor for ArtworkDescriptor();
}

uint64_t type metadata accessor for MetricClickAction()
{
  return type metadata accessor for MetricClickAction();
}

uint64_t MetricClickStream.init(type:page:identifier:badgingCounts:groupActivity:environment:remoteParticipantDeviceType:topicRoutingBehavior:metadata:)()
{
  return MetricClickStream.init(type:page:identifier:badgingCounts:groupActivity:environment:remoteParticipantDeviceType:topicRoutingBehavior:metadata:)();
}

uint64_t type metadata accessor for MetricClickStream()
{
  return type metadata accessor for MetricClickStream();
}

uint64_t static MetricEnvironment.current()()
{
  return static MetricEnvironment.current()();
}

uint64_t type metadata accessor for MetricEnvironment()
{
  return type metadata accessor for MetricEnvironment();
}

uint64_t NetworkConditions.rawValue.getter()
{
  return NetworkConditions.rawValue.getter();
}

uint64_t PrivacyIdentifier.rawValue.getter()
{
  return PrivacyIdentifier.rawValue.getter();
}

uint64_t type metadata accessor for PrivacyIdentifier()
{
  return type metadata accessor for PrivacyIdentifier();
}

uint64_t RemoteParticipant.description.getter()
{
  return RemoteParticipant.description.getter();
}

uint64_t static RemoteParticipant.== infix(_:_:)()
{
  return static RemoteParticipant.== infix(_:_:)();
}

uint64_t type metadata accessor for RemoteParticipant()
{
  return type metadata accessor for RemoteParticipant();
}

uint64_t ShelfDisplayStyle.init(rawValue:)()
{
  return ShelfDisplayStyle.init(rawValue:)();
}

uint64_t ShelfDisplayStyle.rawValue.getter()
{
  return ShelfDisplayStyle.rawValue.getter();
}

uint64_t GalleryDestination.rawValue.getter()
{
  return GalleryDestination.rawValue.getter();
}

uint64_t MetricClickElement.rawValue.getter()
{
  return MetricClickElement.rawValue.getter();
}

uint64_t type metadata accessor for MetricClickElement()
{
  return type metadata accessor for MetricClickElement();
}

uint64_t type metadata accessor for MetricPageCategory()
{
  return type metadata accessor for MetricPageCategory();
}

uint64_t UserBodyMassMetric.init(massInKg:machTimestamp:)()
{
  return UserBodyMassMetric.init(massInKg:machTimestamp:)();
}

uint64_t type metadata accessor for UserBodyMassMetric()
{
  return type metadata accessor for UserBodyMassMetric();
}

uint64_t type metadata accessor for AssetBundleProgress()
{
  return type metadata accessor for AssetBundleProgress();
}

uint64_t type metadata accessor for ContentAvailability()
{
  return type metadata accessor for ContentAvailability();
}

uint64_t static EngagementConstants.badgeLaunchURLString.getter()
{
  return static EngagementConstants.badgeLaunchURLString.getter();
}

uint64_t static EngagementConstants.badgeOffersIdentifier.getter()
{
  return static EngagementConstants.badgeOffersIdentifier.getter();
}

uint64_t static EngagementConstants.notificationOffersTopic.getter()
{
  return static EngagementConstants.notificationOffersTopic.getter();
}

uint64_t static EngagementConstants.badgeNewFeaturesIdentifier.getter()
{
  return static EngagementConstants.badgeNewFeaturesIdentifier.getter();
}

uint64_t static EngagementConstants.badgeHardwareOfferIdentifier.getter()
{
  return static EngagementConstants.badgeHardwareOfferIdentifier.getter();
}

uint64_t static EngagementConstants.notificationNewFeaturesTopic.getter()
{
  return static EngagementConstants.notificationNewFeaturesTopic.getter();
}

uint64_t static EngagementConstants.appBadgingAllowedBadgeIdentifiers.getter()
{
  return static EngagementConstants.appBadgingAllowedBadgeIdentifiers.getter();
}

uint64_t type metadata accessor for MetricBadgingCounts()
{
  return type metadata accessor for MetricBadgingCounts();
}

uint64_t type metadata accessor for MetricGroupActivity()
{
  return type metadata accessor for MetricGroupActivity();
}

uint64_t PersonalizationText.localizeFillers(bodyFocusMap:locale:numberFormatter:modalityMap:musicGenreMap:skillLevelMap:themeMap:trainerMap:)()
{
  return PersonalizationText.localizeFillers(bodyFocusMap:locale:numberFormatter:modalityMap:musicGenreMap:skillLevelMap:themeMap:trainerMap:)();
}

uint64_t type metadata accessor for PersonalizationText()
{
  return type metadata accessor for PersonalizationText();
}

uint64_t ServiceSubscription.isSubscribed(date:)()
{
  return ServiceSubscription.isSubscribed(date:)();
}

uint64_t type metadata accessor for ServiceSubscription()
{
  return type metadata accessor for ServiceSubscription();
}

uint64_t CatalogWorkoutDetail.workout.getter()
{
  return CatalogWorkoutDetail.workout.getter();
}

uint64_t type metadata accessor for CatalogWorkoutDetail()
{
  return type metadata accessor for CatalogWorkoutDetail();
}

uint64_t type metadata accessor for MetricClickStreamType()
{
  return type metadata accessor for MetricClickStreamType();
}

uint64_t ShelfLockupDescriptor.identifier.getter()
{
  return ShelfLockupDescriptor.identifier.getter();
}

uint64_t ShelfLockupDescriptor.galleryNameTags.getter()
{
  return ShelfLockupDescriptor.galleryNameTags.getter();
}

uint64_t ShelfLockupDescriptor.galleryDestination.getter()
{
  return ShelfLockupDescriptor.galleryDestination.getter();
}

uint64_t ShelfLockupDescriptor.galleryDisplayStyle.getter()
{
  return ShelfLockupDescriptor.galleryDisplayStyle.getter();
}

uint64_t ShelfLockupDescriptor.galleryDescriptionTags.getter()
{
  return ShelfLockupDescriptor.galleryDescriptionTags.getter();
}

uint64_t ShelfLockupDescriptor.titleTags.getter()
{
  return ShelfLockupDescriptor.titleTags.getter();
}

uint64_t type metadata accessor for ShelfLockupDescriptor()
{
  return type metadata accessor for ShelfLockupDescriptor();
}

uint64_t type metadata accessor for MetricClickDestination()
{
  return type metadata accessor for MetricClickDestination();
}

uint64_t type metadata accessor for MetricRemoteIdentifier()
{
  return type metadata accessor for MetricRemoteIdentifier();
}

uint64_t NoticePrivacyPreference.init(state:version:)()
{
  return NoticePrivacyPreference.init(state:version:)();
}

uint64_t NoticePrivacyPreference.state.getter()
{
  return NoticePrivacyPreference.state.getter();
}

uint64_t static NoticePrivacyPreference.Version.current.getter()
{
  return static NoticePrivacyPreference.Version.current.getter();
}

uint64_t type metadata accessor for NoticePrivacyPreference()
{
  return type metadata accessor for NoticePrivacyPreference();
}

uint64_t CatalogLockupPlaceholder.init(identifier:referenceType:editorialCardIdentifier:)()
{
  return CatalogLockupPlaceholder.init(identifier:referenceType:editorialCardIdentifier:)();
}

uint64_t type metadata accessor for CatalogLockupPlaceholder()
{
  return type metadata accessor for CatalogLockupPlaceholder();
}

uint64_t CatalogModalityReference.identifier.getter()
{
  return CatalogModalityReference.identifier.getter();
}

uint64_t CatalogModalityReference.name.getter()
{
  return CatalogModalityReference.name.getter();
}

uint64_t type metadata accessor for CatalogModalityReference()
{
  return type metadata accessor for CatalogModalityReference();
}

uint64_t type metadata accessor for MetricClickActionContext()
{
  return type metadata accessor for MetricClickActionContext();
}

uint64_t PersonalizationCandidate.identifier.getter()
{
  return PersonalizationCandidate.identifier.getter();
}

uint64_t PersonalizationCandidate.referenceType.getter()
{
  return PersonalizationCandidate.referenceType.getter();
}

uint64_t PersonalizationCandidate.reason.getter()
{
  return PersonalizationCandidate.reason.getter();
}

uint64_t type metadata accessor for PersonalizationCandidate()
{
  return type metadata accessor for PersonalizationCandidate();
}

uint64_t type metadata accessor for MetricNavigationDirection()
{
  return type metadata accessor for MetricNavigationDirection();
}

uint64_t StandardArtworkDescriptor.artwork.getter()
{
  return StandardArtworkDescriptor.artwork.getter();
}

uint64_t StandardArtworkDescriptor.cropCode.getter()
{
  return StandardArtworkDescriptor.cropCode.getter();
}

uint64_t type metadata accessor for StandardArtworkDescriptor()
{
  return type metadata accessor for StandardArtworkDescriptor();
}

uint64_t type metadata accessor for MetricClickMarketingFields()
{
  return type metadata accessor for MetricClickMarketingFields();
}

uint64_t ServiceSubscriptionRequest.init(authenticationBehavior:cacheBehavior:)()
{
  return ServiceSubscriptionRequest.init(authenticationBehavior:cacheBehavior:)();
}

uint64_t type metadata accessor for ServiceSubscriptionRequest()
{
  return type metadata accessor for ServiceSubscriptionRequest();
}

uint64_t FetchCatalogWorkoutsRequest.init(identifiers:)()
{
  return FetchCatalogWorkoutsRequest.init(identifiers:)();
}

uint64_t type metadata accessor for FetchCatalogWorkoutsRequest()
{
  return type metadata accessor for FetchCatalogWorkoutsRequest();
}

uint64_t type metadata accessor for AllowedContentRatingsUpdated()
{
  return type metadata accessor for AllowedContentRatingsUpdated();
}

uint64_t PersonalizationShelfDescriptor.candidates.getter()
{
  return PersonalizationShelfDescriptor.candidates.getter();
}

uint64_t PersonalizationShelfDescriptor.displayStyle.getter()
{
  return PersonalizationShelfDescriptor.displayStyle.getter();
}

uint64_t type metadata accessor for PersonalizationShelfDescriptor()
{
  return type metadata accessor for PersonalizationShelfDescriptor();
}

uint64_t PersonalizationInferenceResponse.shelves.getter()
{
  return PersonalizationInferenceResponse.shelves.getter();
}

uint64_t type metadata accessor for PersonalizationInferenceResponse()
{
  return type metadata accessor for PersonalizationInferenceResponse();
}

uint64_t RemoteParticipantPasswordChallenge.passwordLength.getter()
{
  return RemoteParticipantPasswordChallenge.passwordLength.getter();
}

uint64_t PersonalizationInferenceRequestOptions.init(correlationKey:eventType:source:trigger:version:)()
{
  return PersonalizationInferenceRequestOptions.init(correlationKey:eventType:source:trigger:version:)();
}

uint64_t type metadata accessor for PersonalizationInferenceRequestOptions()
{
  return type metadata accessor for PersonalizationInferenceRequestOptions();
}

uint64_t Artwork.description.getter()
{
  return Artwork.description.getter();
}

uint64_t Artwork.backgroundColor.getter()
{
  return Artwork.backgroundColor.getter();
}

uint64_t static Artwork.== infix(_:_:)()
{
  return static Artwork.== infix(_:_:)();
}

uint64_t type metadata accessor for Artwork()
{
  return type metadata accessor for Artwork();
}

uint64_t static Promise.serial<A>(queue:_:)()
{
  return static Promise.serial<A>(queue:_:)();
}

uint64_t static Promise<>.parallel<A>(queue:maxConcurrent:_:)()
{
  return static Promise<>.parallel<A>(queue:maxConcurrent:_:)();
}

uint64_t Promise.init(asyncOperation:)()
{
  return Promise.init(asyncOperation:)();
}

uint64_t Promise.init(synchronousOperation:)()
{
  return Promise.init(synchronousOperation:)();
}

uint64_t Promise.operation.getter()
{
  return Promise.operation.getter();
}

uint64_t static Promise<>.success.getter()
{
  return static Promise<>.success.getter();
}

uint64_t Trainer.description.getter()
{
  return Trainer.description.getter();
}

uint64_t Trainer.informalName.getter()
{
  return Trainer.informalName.getter();
}

uint64_t Trainer.name.getter()
{
  return Trainer.name.getter();
}

uint64_t type metadata accessor for Trainer()
{
  return type metadata accessor for Trainer();
}

uint64_t type metadata accessor for MediaTag()
{
  return type metadata accessor for MediaTag();
}

uint64_t Platform.supportedFeatures.getter()
{
  return Platform.supportedFeatures.getter();
}

uint64_t Playlist.init(identifier:name:items:dateCreated:)()
{
  return Playlist.init(identifier:name:items:dateCreated:)();
}

uint64_t Playlist.identifier.getter()
{
  return Playlist.identifier.getter();
}

uint64_t Playlist.name.getter()
{
  return Playlist.name.getter();
}

uint64_t type metadata accessor for Playlist()
{
  return type metadata accessor for Playlist();
}

uint64_t BodyFocus.identifier.getter()
{
  return BodyFocus.identifier.getter();
}

uint64_t BodyFocus.name.getter()
{
  return BodyFocus.name.getter();
}

uint64_t type metadata accessor for BodyFocus()
{
  return type metadata accessor for BodyFocus();
}

uint64_t SheetItem.body.getter()
{
  return SheetItem.body.getter();
}

uint64_t SheetItem.title.getter()
{
  return SheetItem.title.getter();
}

uint64_t SheetItem.imageName.getter()
{
  return SheetItem.imageName.getter();
}

uint64_t type metadata accessor for SheetItem()
{
  return type metadata accessor for SheetItem();
}

uint64_t MultiSportWorkoutConfiguration.displayName.getter()
{
  return MultiSportWorkoutConfiguration.displayName.getter();
}

uint64_t type metadata accessor for MultiSportWorkoutConfiguration()
{
  return type metadata accessor for MultiSportWorkoutConfiguration();
}

uint64_t GoalWorkoutConfiguration.goal.getter()
{
  return GoalWorkoutConfiguration.goal.getter();
}

uint64_t type metadata accessor for GoalWorkoutConfiguration()
{
  return type metadata accessor for GoalWorkoutConfiguration();
}

Swift::Bool __swiftcall RaceWorkoutConfiguration.raceTimeWouldWinRace(_:secondsAhead:)(Swift::Double _, Swift::Double_optional secondsAhead)
{
  return RaceWorkoutConfiguration.raceTimeWouldWinRace(_:secondsAhead:)(*(void *)&secondsAhead.is_nil, _, *(__n128 *)&secondsAhead.value);
}

uint64_t static RaceWorkoutConfiguration.aheadColors.getter()
{
  return static RaceWorkoutConfiguration.aheadColors.getter();
}

uint64_t static RaceWorkoutConfiguration.behindColors.getter()
{
  return static RaceWorkoutConfiguration.behindColors.getter();
}

uint64_t static RaceWorkoutConfiguration.expiredColors.getter()
{
  return static RaceWorkoutConfiguration.expiredColors.getter();
}

uint64_t static RaceWorkoutConfiguration.raceCompleteColor.getter()
{
  return static RaceWorkoutConfiguration.raceCompleteColor.getter();
}

uint64_t static RaceWorkoutConfiguration.performanceColorFor(_:)()
{
  return static RaceWorkoutConfiguration.performanceColorFor(_:)();
}

uint64_t static RaceWorkoutConfiguration.colors.getter()
{
  return static RaceWorkoutConfiguration.colors.getter();
}

Swift::Double __swiftcall RaceWorkoutConfiguration.raceTimeFrom(_:)(HKWorkout a1)
{
  RaceWorkoutConfiguration.raceTimeFrom(_:)(a1.super.super.super.isa);
  return result;
}

Swift::Double_optional __swiftcall RaceWorkoutConfiguration.secondsAheadFrom(_:)(HKWorkout a1)
{
  char v1 = RaceWorkoutConfiguration.secondsAheadFrom(_:)(a1.super.super.super.isa);
  result.value = v2;
  result.is_nil = v1;
  return result;
}

uint64_t RaceWorkoutConfiguration.referenceRouteLength.getter()
{
  return RaceWorkoutConfiguration.referenceRouteLength.getter();
}

Swift::Bool __swiftcall RaceWorkoutConfiguration.shouldShowResultsRow(metadata:)(Swift::OpaquePointer_optional metadata)
{
  return RaceWorkoutConfiguration.shouldShowResultsRow(metadata:)(metadata.value._rawValue, *(void *)&metadata.is_nil);
}

uint64_t RaceWorkoutConfiguration.referenceRouteDuration.getter()
{
  return RaceWorkoutConfiguration.referenceRouteDuration.getter();
}

uint64_t type metadata accessor for RaceWorkoutConfiguration()
{
  return type metadata accessor for RaceWorkoutConfiguration();
}

uint64_t static PacerWorkoutConfiguration.displayColor.getter()
{
  return static PacerWorkoutConfiguration.displayColor.getter();
}

uint64_t static PacerWorkoutConfiguration.colors.getter()
{
  return static PacerWorkoutConfiguration.colors.getter();
}

uint64_t PacerWorkoutConfiguration.distanceGoal.getter()
{
  return PacerWorkoutConfiguration.distanceGoal.getter();
}

uint64_t PacerWorkoutConfiguration.timeGoal.getter()
{
  return PacerWorkoutConfiguration.timeGoal.getter();
}

uint64_t type metadata accessor for PacerWorkoutConfiguration()
{
  return type metadata accessor for PacerWorkoutConfiguration();
}

uint64_t IntervalWorkout.displayName.getter()
{
  return IntervalWorkout.displayName.getter();
}

uint64_t IntervalWorkout.stepForKeyPath(_:)()
{
  return IntervalWorkout.stepForKeyPath(_:)();
}

uint64_t IntervalWorkoutConfiguration.intervalWorkout.getter()
{
  return IntervalWorkoutConfiguration.intervalWorkout.getter();
}

uint64_t static IntervalWorkoutConfiguration.displayColor.getter()
{
  return static IntervalWorkoutConfiguration.displayColor.getter();
}

uint64_t static IntervalWorkoutConfiguration.StepSuccessMetadataKey.getter()
{
  return static IntervalWorkoutConfiguration.StepSuccessMetadataKey.getter();
}

uint64_t type metadata accessor for IntervalWorkoutConfiguration()
{
  return type metadata accessor for IntervalWorkoutConfiguration();
}

uint64_t IntervalWorkoutKeyPath.init(serializedString:)()
{
  return IntervalWorkoutKeyPath.init(serializedString:)();
}

uint64_t type metadata accessor for IntervalWorkoutKeyPath()
{
  return type metadata accessor for IntervalWorkoutKeyPath();
}

uint64_t type metadata accessor for WorkoutNotification.NotificationType()
{
  return type metadata accessor for WorkoutNotification.NotificationType();
}

uint64_t dispatch thunk of WorkoutNotification.displayDuration.getter()
{
  return dispatch thunk of WorkoutNotification.displayDuration.getter();
}

uint64_t dispatch thunk of WorkoutNotification.notificationType.getter()
{
  return dispatch thunk of WorkoutNotification.notificationType.getter();
}

uint64_t dispatch thunk of WorkoutNotification.createdAt.getter()
{
  return dispatch thunk of WorkoutNotification.createdAt.getter();
}

uint64_t type metadata accessor for WorkoutNotification()
{
  return type metadata accessor for WorkoutNotification();
}

uint64_t static WorkoutConfiguration.deserialize(from:requiringOccurrence:validator:)()
{
  return static WorkoutConfiguration.deserialize(from:requiringOccurrence:validator:)();
}

uint64_t static WorkoutConfiguration.deserialize(from:validator:)()
{
  return static WorkoutConfiguration.deserialize(from:validator:)();
}

uint64_t dispatch thunk of WorkoutConfiguration.activityType.getter()
{
  return dispatch thunk of WorkoutConfiguration.activityType.getter();
}

uint64_t WorkoutConfiguration.serializedCompositionData.getter()
{
  return WorkoutConfiguration.serializedCompositionData.getter();
}

uint64_t dispatch thunk of WorkoutConfiguration.type.getter()
{
  return dispatch thunk of WorkoutConfiguration.type.getter();
}

uint64_t dispatch thunk of WorkoutConfiguration.route.getter()
{
  return dispatch thunk of WorkoutConfiguration.route.getter();
}

uint64_t dispatch thunk of WorkoutConfiguration.route.setter()
{
  return dispatch thunk of WorkoutConfiguration.route.setter();
}

uint64_t type metadata accessor for WorkoutConfiguration()
{
  return type metadata accessor for WorkoutConfiguration();
}

uint64_t WorkoutStatePublisher.pauseTimes.getter()
{
  return WorkoutStatePublisher.pauseTimes.getter();
}

uint64_t WorkoutStatePublisher.activityType.getter()
{
  return WorkoutStatePublisher.activityType.getter();
}

uint64_t WorkoutStatePublisher.workoutPaused.getter()
{
  return WorkoutStatePublisher.workoutPaused.getter();
}

uint64_t WorkoutStatePublisher.gpsUnavailable.getter()
{
  return WorkoutStatePublisher.gpsUnavailable.getter();
}

uint64_t WorkoutStatePublisher.workoutStartDate.getter()
{
  return WorkoutStatePublisher.workoutStartDate.getter();
}

uint64_t WorkoutStatePublisher.lastUnbalancedPauseStart.getter()
{
  return WorkoutStatePublisher.lastUnbalancedPauseStart.getter();
}

uint64_t WorkoutStatePublisher.lowPowerModeAnimationSuspended.getter()
{
  return WorkoutStatePublisher.lowPowerModeAnimationSuspended.getter();
}

uint64_t WorkoutStatePublisher.hasSpeedSensorEverBeenConnected.getter()
{
  return WorkoutStatePublisher.hasSpeedSensorEverBeenConnected.getter();
}

uint64_t WorkoutStatePublisher.isGymKit.getter()
{
  return WorkoutStatePublisher.isGymKit.getter();
}

uint64_t type metadata accessor for WorkoutStatePublisher()
{
  return type metadata accessor for WorkoutStatePublisher();
}

uint64_t static WorkoutConfigurationValidator.shared.getter()
{
  return static WorkoutConfigurationValidator.shared.getter();
}

uint64_t type metadata accessor for WorkoutConfigurationValidator()
{
  return type metadata accessor for WorkoutConfigurationValidator();
}

uint64_t WorkoutStep.displayString.getter()
{
  return WorkoutStep.displayString.getter();
}

uint64_t WorkoutStep.displayName.getter()
{
  return WorkoutStep.displayName.getter();
}

uint64_t WorkoutStep.activeTargetZone.getter()
{
  return WorkoutStep.activeTargetZone.getter();
}

uint64_t WorkoutStep.activeHeartRateTargetZone.getter()
{
  return WorkoutStep.activeHeartRateTargetZone.getter();
}

uint64_t WorkoutStep.activePowerZonesAlertTargetZone.getter()
{
  return WorkoutStep.activePowerZonesAlertTargetZone.getter();
}

uint64_t WorkoutStep.goal.getter()
{
  return WorkoutStep.goal.getter();
}

uint64_t WorkoutStep.stepType.getter()
{
  return WorkoutStep.stepType.getter();
}

uint64_t type metadata accessor for WorkoutStep()
{
  return type metadata accessor for WorkoutStep();
}

uint64_t WorkoutStep.init(_:goal:activityType:uuid:displayName:)()
{
  return WorkoutStep.init(_:goal:activityType:uuid:displayName:)();
}

uint64_t type metadata accessor for WorkoutFeatures()
{
  return type metadata accessor for WorkoutFeatures();
}

uint64_t type metadata accessor for TargetZone.ZoneType()
{
  return type metadata accessor for TargetZone.ZoneType();
}

uint64_t TargetZone.displayString(formattingManager:activityType:)()
{
  return TargetZone.displayString(formattingManager:activityType:)();
}

uint64_t dispatch thunk of TargetZone.isSingleThreshold.getter()
{
  return dispatch thunk of TargetZone.isSingleThreshold.getter();
}

uint64_t dispatch thunk of TargetZone.max.getter()
{
  return dispatch thunk of TargetZone.max.getter();
}

uint64_t dispatch thunk of TargetZone.min.getter()
{
  return dispatch thunk of TargetZone.min.getter();
}

uint64_t TargetZone.type.getter()
{
  return TargetZone.type.getter();
}

uint64_t type metadata accessor for RacePosition()
{
  return type metadata accessor for RacePosition();
}

uint64_t type metadata accessor for ZoneViewType()
{
  return type metadata accessor for ZoneViewType();
}

uint64_t ExertionValue.shortDescription.getter()
{
  return ExertionValue.shortDescription.getter();
}

uint64_t ExertionValue.level.getter()
{
  return ExertionValue.level.getter();
}

uint64_t type metadata accessor for ExertionValue()
{
  return type metadata accessor for ExertionValue();
}

uint64_t GoalPublisher.goal.getter()
{
  return GoalPublisher.goal.getter();
}

uint64_t GoalPublisher.progress.getter()
{
  return GoalPublisher.progress.getter();
}

uint64_t type metadata accessor for GoalPublisher()
{
  return type metadata accessor for GoalPublisher();
}

uint64_t static LivePowerZone.minCanonicalPowerZones()()
{
  return static LivePowerZone.minCanonicalPowerZones()();
}

uint64_t type metadata accessor for LivePowerZone()
{
  return type metadata accessor for LivePowerZone();
}

uint64_t MetricPlatter.type.getter()
{
  return MetricPlatter.type.getter();
}

uint64_t MetricPlatter.include.getter()
{
  return MetricPlatter.include.getter();
}

uint64_t MetricPlatter.metrics.getter()
{
  return MetricPlatter.metrics.getter();
}

uint64_t type metadata accessor for MetricPlatter()
{
  return type metadata accessor for MetricPlatter();
}

uint64_t dispatch thunk of DataLinkClient.activateLink()()
{
  return dispatch thunk of DataLinkClient.activateLink()();
}

uint64_t dispatch thunk of DataLinkClient.sessionUUID.getter()
{
  return dispatch thunk of DataLinkClient.sessionUUID.getter();
}

uint64_t DataLinkClient.init(metricsPublisher:)()
{
  return DataLinkClient.init(metricsPublisher:)();
}

uint64_t dispatch thunk of DataLinkClient.notificationHandler.setter()
{
  return dispatch thunk of DataLinkClient.notificationHandler.setter();
}

uint64_t dispatch thunk of DataLinkClient.presenceDidChangeHandler.setter()
{
  return dispatch thunk of DataLinkClient.presenceDidChangeHandler.setter();
}

uint64_t dispatch thunk of DataLinkClient.send(command:acknowledged:)()
{
  return dispatch thunk of DataLinkClient.send(command:acknowledged:)();
}

uint64_t type metadata accessor for DataLinkClient()
{
  return type metadata accessor for DataLinkClient();
}

uint64_t type metadata accessor for DataLinkCommand()
{
  return type metadata accessor for DataLinkCommand();
}

uint64_t MetricsPublisher.multisportWorkoutInAutoMode.getter()
{
  return MetricsPublisher.multisportWorkoutInAutoMode.getter();
}

uint64_t MetricsPublisher.multisportMetricsPublisher.getter()
{
  return MetricsPublisher.multisportMetricsPublisher.getter();
}

uint64_t MetricsPublisher.elapsedTimeMetricsPublisher.getter()
{
  return MetricsPublisher.elapsedTimeMetricsPublisher.getter();
}

uint64_t MetricsPublisher.trackRunningMetricsPublisher.getter()
{
  return MetricsPublisher.trackRunningMetricsPublisher.getter();
}

uint64_t MetricsPublisher.workoutStatePublisher.getter()
{
  return MetricsPublisher.workoutStatePublisher.getter();
}

uint64_t MetricsPublisher.activitySummaryMetricsPublisher.getter()
{
  return MetricsPublisher.activitySummaryMetricsPublisher.getter();
}

uint64_t MetricsPublisher.raceInformationPublisher.getter()
{
  return MetricsPublisher.raceInformationPublisher.getter();
}

uint64_t MetricsPublisher.locationPositionPublisher.getter()
{
  return MetricsPublisher.locationPositionPublisher.getter();
}

uint64_t MetricsPublisher.racePositionStatePublisher.getter()
{
  return MetricsPublisher.racePositionStatePublisher.getter();
}

uint64_t MetricsPublisher.goalPublisher.getter()
{
  return MetricsPublisher.goalPublisher.getter();
}

uint64_t MetricsPublisher.lapsMetricsPublisher.getter()
{
  return MetricsPublisher.lapsMetricsPublisher.getter();
}

uint64_t MetricsPublisher.powerMetricsPublisher.getter()
{
  return MetricsPublisher.powerMetricsPublisher.getter();
}

uint64_t MetricsPublisher.energyMetricsPublisher.getter()
{
  return MetricsPublisher.energyMetricsPublisher.getter();
}

uint64_t MetricsPublisher.platterPublisher.getter()
{
  return MetricsPublisher.platterPublisher.getter();
}

uint64_t MetricsPublisher.heartRateMetricsPublisher.getter()
{
  return MetricsPublisher.heartRateMetricsPublisher.getter();
}

uint64_t MetricsPublisher.intervalsMetricsPublisher.getter()
{
  return MetricsPublisher.intervalsMetricsPublisher.getter();
}

uint64_t MetricsPublisher.averagePace.getter()
{
  return MetricsPublisher.averagePace.getter();
}

uint64_t MetricsPublisher.currentPace.getter()
{
  return MetricsPublisher.currentPace.getter();
}

uint64_t MetricsPublisher.fastestPace.getter()
{
  return MetricsPublisher.fastestPace.getter();
}

uint64_t MetricsPublisher.rollingPace.getter()
{
  return MetricsPublisher.rollingPace.getter();
}

uint64_t MetricsPublisher.segmentIndex.getter()
{
  return MetricsPublisher.segmentIndex.getter();
}

uint64_t MetricsPublisher.averageCadence.getter()
{
  return MetricsPublisher.averageCadence.getter();
}

uint64_t MetricsPublisher.currentCadence.getter()
{
  return MetricsPublisher.currentCadence.getter();
}

uint64_t MetricsPublisher.elevationChartData.getter()
{
  return MetricsPublisher.elevationChartData.getter();
}

uint64_t MetricsPublisher.elevationChartUnit.getter()
{
  return MetricsPublisher.elevationChartUnit.getter();
}

uint64_t MetricsPublisher.secondsAheadOfPacer.getter()
{
  return MetricsPublisher.secondsAheadOfPacer.getter();
}

uint64_t MetricsPublisher.distanceGoalFinishTime.getter()
{
  return MetricsPublisher.distanceGoalFinishTime.getter();
}

uint64_t MetricsPublisher.workoutConfigurationType.getter()
{
  return MetricsPublisher.workoutConfigurationType.getter();
}

uint64_t MetricsPublisher.init()()
{
  return MetricsPublisher.init()();
}

uint64_t type metadata accessor for MetricsPublisher()
{
  return type metadata accessor for MetricsPublisher();
}

uint64_t PlatterPublisher.metricPlatters.getter()
{
  return PlatterPublisher.metricPlatters.getter();
}

uint64_t type metadata accessor for PlatterPublisher()
{
  return type metadata accessor for PlatterPublisher();
}

uint64_t static RaceMetadataKeys.referenceWorkoutUUID.getter()
{
  return static RaceMetadataKeys.referenceWorkoutUUID.getter();
}

uint64_t static RaceMetadataKeys.averagePaceOnRoute.getter()
{
  return static RaceMetadataKeys.averagePaceOnRoute.getter();
}

uint64_t ConfigurationType.analyticsKey.getter()
{
  return ConfigurationType.analyticsKey.getter();
}

uint64_t type metadata accessor for ConfigurationType()
{
  return type metadata accessor for ConfigurationType();
}

uint64_t static LiveHeartRateZone.canonicals()()
{
  return static LiveHeartRateZone.canonicals()();
}

uint64_t type metadata accessor for LiveHeartRateZone()
{
  return type metadata accessor for LiveHeartRateZone();
}

uint64_t MetricPlatterType.bridgedValue.getter()
{
  return MetricPlatterType.bridgedValue.getter();
}

uint64_t MetricPlatterType.rawValue.getter()
{
  return MetricPlatterType.rawValue.getter();
}

uint64_t type metadata accessor for MetricPlatterType()
{
  return type metadata accessor for MetricPlatterType();
}

uint64_t type metadata accessor for RacePositionState()
{
  return type metadata accessor for RacePositionState();
}

uint64_t AppleExertionScale.exertionValue.getter()
{
  return AppleExertionScale.exertionValue.getter();
}

uint64_t AppleExertionScale.init(quantity:)()
{
  return AppleExertionScale.init(quantity:)();
}

uint64_t type metadata accessor for AppleExertionScale()
{
  return type metadata accessor for AppleExertionScale();
}

uint64_t HeartRateTargetZone.displayString(formattingManager:activityType:)()
{
  return HeartRateTargetZone.displayString(formattingManager:activityType:)();
}

uint64_t dispatch thunk of HeartRateTargetZone.applicableRange.getter()
{
  return dispatch thunk of HeartRateTargetZone.applicableRange.getter();
}

uint64_t dispatch thunk of HeartRateTargetZone.isEffectivelyCustomSingleThreshold.getter()
{
  return dispatch thunk of HeartRateTargetZone.isEffectivelyCustomSingleThreshold.getter();
}

uint64_t dispatch thunk of LowPowerModeMonitor.lowPowerModeEnabled.getter()
{
  return dispatch thunk of LowPowerModeMonitor.lowPowerModeEnabled.getter();
}

uint64_t LowPowerModeMonitor.init(delegate:)()
{
  return LowPowerModeMonitor.init(delegate:)();
}

uint64_t type metadata accessor for LowPowerModeMonitor()
{
  return type metadata accessor for LowPowerModeMonitor();
}

uint64_t static ElapsedTimeFormatter.stringFromElapsedTime(_:trimDoubleLeadingZero:compactHours:)()
{
  return static ElapsedTimeFormatter.stringFromElapsedTime(_:trimDoubleLeadingZero:compactHours:)();
}

uint64_t type metadata accessor for ElapsedTimeFormatter()
{
  return type metadata accessor for ElapsedTimeFormatter();
}

uint64_t type metadata accessor for LapsMetricsPublisher()
{
  return type metadata accessor for LapsMetricsPublisher();
}

uint64_t PowerMetricsPublisher.livePowerZones.getter()
{
  return PowerMetricsPublisher.livePowerZones.getter();
}

uint64_t PowerMetricsPublisher.averagePower.getter()
{
  return PowerMetricsPublisher.averagePower.getter();
}

uint64_t PowerMetricsPublisher.currentPower.getter()
{
  return PowerMetricsPublisher.currentPower.getter();
}

uint64_t PowerMetricsPublisher.powerChartData.getter()
{
  return PowerMetricsPublisher.powerChartData.getter();
}

uint64_t type metadata accessor for PowerMetricsPublisher()
{
  return type metadata accessor for PowerMetricsPublisher();
}

uint64_t EnergyMetricsPublisher.totalEnergy.getter()
{
  return EnergyMetricsPublisher.totalEnergy.getter();
}

uint64_t EnergyMetricsPublisher.activeEnergy.getter()
{
  return EnergyMetricsPublisher.activeEnergy.getter();
}

uint64_t type metadata accessor for EnergyMetricsPublisher()
{
  return type metadata accessor for EnergyMetricsPublisher();
}

uint64_t type metadata accessor for HeartRateConfiguration.ConfigurationType()
{
  return type metadata accessor for HeartRateConfiguration.ConfigurationType();
}

uint64_t ActivityTypeKeyMigrator.init(migrationKeys:userDefaults:)()
{
  return ActivityTypeKeyMigrator.init(migrationKeys:userDefaults:)();
}

Swift::Void __swiftcall ActivityTypeKeyMigrator.migrateIfNeeded()()
{
}

uint64_t type metadata accessor for ActivityTypeKeyMigrator()
{
  return type metadata accessor for ActivityTypeKeyMigrator();
}

uint64_t type metadata accessor for PowerZonesAlertZoneType()
{
  return type metadata accessor for PowerZonesAlertZoneType();
}

uint64_t dispatch thunk of TrackRunningCoordinator.preferredDistanceUnit.getter()
{
  return dispatch thunk of TrackRunningCoordinator.preferredDistanceUnit.getter();
}

uint64_t MirroredWidgetAttributes.ContentState.init(publisher:)()
{
  return MirroredWidgetAttributes.ContentState.init(publisher:)();
}

uint64_t type metadata accessor for MirroredWidgetAttributes.ContentState()
{
  return type metadata accessor for MirroredWidgetAttributes.ContentState();
}

uint64_t MirroredWidgetAttributes.uuid.getter()
{
  return MirroredWidgetAttributes.uuid.getter();
}

uint64_t MirroredWidgetAttributes.init(uuid:)()
{
  return MirroredWidgetAttributes.init(uuid:)();
}

uint64_t type metadata accessor for MirroredWidgetAttributes()
{
  return type metadata accessor for MirroredWidgetAttributes();
}

uint64_t RaceInformationPublisher.routePoints.getter()
{
  return RaceInformationPublisher.routePoints.getter();
}

uint64_t type metadata accessor for RaceInformationPublisher()
{
  return type metadata accessor for RaceInformationPublisher();
}

uint64_t type metadata accessor for HeartRateCurrentValueType()
{
  return type metadata accessor for HeartRateCurrentValueType();
}

uint64_t HeartRateMetricsPublisher.liveHeartRateZones.getter()
{
  return HeartRateMetricsPublisher.liveHeartRateZones.getter();
}

uint64_t HeartRateMetricsPublisher.currentHeartRate.getter()
{
  return HeartRateMetricsPublisher.currentHeartRate.getter();
}

uint64_t HeartRateMetricsPublisher.currentHeartRateValueType.getter()
{
  return HeartRateMetricsPublisher.currentHeartRateValueType.getter();
}

uint64_t HeartRateMetricsPublisher.isStaleHeartRate.getter()
{
  return HeartRateMetricsPublisher.isStaleHeartRate.getter();
}

uint64_t type metadata accessor for HeartRateMetricsPublisher()
{
  return type metadata accessor for HeartRateMetricsPublisher();
}

uint64_t IntervalsMetricsPublisher.intervalDistance.getter()
{
  return IntervalsMetricsPublisher.intervalDistance.getter();
}

uint64_t IntervalsMetricsPublisher.intervalNextStep.getter()
{
  return IntervalsMetricsPublisher.intervalNextStep.getter();
}

uint64_t IntervalsMetricsPublisher.intervalProgress.getter()
{
  return IntervalsMetricsPublisher.intervalProgress.getter();
}

uint64_t IntervalsMetricsPublisher.intervalThisStep.getter()
{
  return IntervalsMetricsPublisher.intervalThisStep.getter();
}

uint64_t IntervalsMetricsPublisher.intervalStartDate.getter()
{
  return IntervalsMetricsPublisher.intervalStartDate.getter();
}

uint64_t IntervalsMetricsPublisher.intervalTotalTime.getter()
{
  return IntervalsMetricsPublisher.intervalTotalTime.getter();
}

uint64_t type metadata accessor for IntervalsMetricsPublisher()
{
  return type metadata accessor for IntervalsMetricsPublisher();
}

uint64_t type metadata accessor for MultisportTransitionState()
{
  return type metadata accessor for MultisportTransitionState();
}

uint64_t PowerZonesAlertTargetZone.displayString(formattingManager:activityType:)()
{
  return PowerZonesAlertTargetZone.displayString(formattingManager:activityType:)();
}

uint64_t dispatch thunk of PowerZonesAlertTargetZone.applicableRange.getter()
{
  return dispatch thunk of PowerZonesAlertTargetZone.applicableRange.getter();
}

uint64_t dispatch thunk of PowerZonesAlertTargetZone.type.getter()
{
  return dispatch thunk of PowerZonesAlertTargetZone.type.getter();
}

uint64_t MultisportMetricsPublisher.lastMultisportLegTime.getter()
{
  return MultisportMetricsPublisher.lastMultisportLegTime.getter();
}

uint64_t MultisportMetricsPublisher.nextMultisportActivity.getter()
{
  return MultisportMetricsPublisher.nextMultisportActivity.getter();
}

uint64_t MultisportMetricsPublisher.currentMultisportActivity.getter()
{
  return MultisportMetricsPublisher.currentMultisportActivity.getter();
}

uint64_t MultisportMetricsPublisher.currentActivityStart.getter()
{
  return MultisportMetricsPublisher.currentActivityStart.getter();
}

uint64_t MultisportMetricsPublisher.multisportTransitionState.getter()
{
  return MultisportMetricsPublisher.multisportTransitionState.getter();
}

uint64_t MultisportMetricsPublisher.multisportRemainingLegCount.getter()
{
  return MultisportMetricsPublisher.multisportRemainingLegCount.getter();
}

uint64_t type metadata accessor for MultisportMetricsPublisher()
{
  return type metadata accessor for MultisportMetricsPublisher();
}

uint64_t RacePositionStatePublisher.racePosition.getter()
{
  return RacePositionStatePublisher.racePosition.getter();
}

uint64_t RacePositionStatePublisher.racePositionState.getter()
{
  return RacePositionStatePublisher.racePositionState.getter();
}

uint64_t RacePositionStatePublisher.ghostPositionOnRoute.getter()
{
  return RacePositionStatePublisher.ghostPositionOnRoute.getter();
}

uint64_t RacePositionStatePublisher.raceFinishTime.getter()
{
  return RacePositionStatePublisher.raceFinishTime.getter();
}

uint64_t RacePositionStatePublisher.positionOnRoute.getter()
{
  return RacePositionStatePublisher.positionOnRoute.getter();
}

uint64_t RacePositionStatePublisher.secondsAheadOfGhost.getter()
{
  return RacePositionStatePublisher.secondsAheadOfGhost.getter();
}

uint64_t RacePositionStatePublisher.remainingRouteDistance.getter()
{
  return RacePositionStatePublisher.remainingRouteDistance.getter();
}

uint64_t type metadata accessor for RacePositionStatePublisher()
{
  return type metadata accessor for RacePositionStatePublisher();
}

uint64_t ElapsedTimeMetricsPublisher.elapsedTime.getter()
{
  return ElapsedTimeMetricsPublisher.elapsedTime.getter();
}

uint64_t type metadata accessor for FitnessUILocalizationFeature()
{
  return type metadata accessor for FitnessUILocalizationFeature();
}

uint64_t dispatch thunk of TrackRunningMetricsPublisher.trackRunningCoordinator.getter()
{
  return dispatch thunk of TrackRunningMetricsPublisher.trackRunningCoordinator.getter();
}

uint64_t dispatch thunk of FunctionalThresholdPowerStore.fetchMostRecentAppleFTP(completion:)()
{
  return dispatch thunk of FunctionalThresholdPowerStore.fetchMostRecentAppleFTP(completion:)();
}

uint64_t FunctionalThresholdPowerStore.init(with:)()
{
  return FunctionalThresholdPowerStore.init(with:)();
}

uint64_t type metadata accessor for FunctionalThresholdPowerStore()
{
  return type metadata accessor for FunctionalThresholdPowerStore();
}

uint64_t CyclingPowerZonesConfiguration.configurationType.getter()
{
  return CyclingPowerZonesConfiguration.configurationType.getter();
}

uint64_t CyclingPowerZonesConfiguration.zones.getter()
{
  return CyclingPowerZonesConfiguration.zones.getter();
}

uint64_t CyclingPowerZonesConfiguration.isEmpty.getter()
{
  return CyclingPowerZonesConfiguration.isEmpty.getter();
}

uint64_t ActivitySummaryMetricsPublisher.activitySummary.getter()
{
  return ActivitySummaryMetricsPublisher.activitySummary.getter();
}

uint64_t ActivitySummaryMetricsPublisher.isWheelchairUser.getter()
{
  return ActivitySummaryMetricsPublisher.isWheelchairUser.getter();
}

uint64_t type metadata accessor for ActivitySummaryMetricsPublisher()
{
  return type metadata accessor for ActivitySummaryMetricsPublisher();
}

uint64_t BlastDoorConfigurationValidator.init()()
{
  return BlastDoorConfigurationValidator.init()();
}

uint64_t type metadata accessor for BlastDoorConfigurationValidator()
{
  return type metadata accessor for BlastDoorConfigurationValidator();
}

uint64_t type metadata accessor for CyclingPowerZonesConfigurationType()
{
  return type metadata accessor for CyclingPowerZonesConfigurationType();
}

uint64_t static CyclingPowerZonesConfigurationEditor.hasAllEmptyZones(_:)()
{
  return static CyclingPowerZonesConfigurationEditor.hasAllEmptyZones(_:)();
}

uint64_t type metadata accessor for CyclingPowerZonesConfigurationEditor()
{
  return type metadata accessor for CyclingPowerZonesConfigurationEditor();
}

uint64_t Zone.displaySpan.getter()
{
  return Zone.displaySpan.getter();
}

uint64_t dispatch thunk of Zone.logicalSpan.getter()
{
  return dispatch thunk of Zone.logicalSpan.getter();
}

uint64_t Zone.configuration.getter()
{
  return Zone.configuration.getter();
}

uint64_t dispatch thunk of Zone.displayLowerBound.getter()
{
  return dispatch thunk of Zone.displayLowerBound.getter();
}

uint64_t dispatch thunk of Zone.displayUpperBound.getter()
{
  return dispatch thunk of Zone.displayUpperBound.getter();
}

uint64_t type metadata accessor for Zone()
{
  return type metadata accessor for Zone();
}

uint64_t static WOLog.trackRunning.getter()
{
  return static WOLog.trackRunning.getter();
}

uint64_t static WOLog.trainingLoad.getter()
{
  return static WOLog.trainingLoad.getter();
}

uint64_t static WOLog.app.getter()
{
  return static WOLog.app.getter();
}

uint64_t static WOLog.dataLink.getter()
{
  return static WOLog.dataLink.getter();
}

uint64_t StepType.scaleableImage.getter()
{
  return StepType.scaleableImage.getter();
}

uint64_t type metadata accessor for StepType()
{
  return type metadata accessor for StepType();
}

uint64_t LiveZones.init(zones:currentZoneIndex:isStale:)()
{
  return LiveZones.init(zones:currentZoneIndex:isStale:)();
}

uint64_t dispatch thunk of LiveZones.zones.getter()
{
  return dispatch thunk of LiveZones.zones.getter();
}

uint64_t zoneColor(for:index:count:)()
{
  return zoneColor(for:index:count:)();
}

uint64_t static AVPartialAsyncProperty<A>.duration.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)CGFloat._bridgeToObjectiveC()();
}

uint64_t static CGFloat._forceBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t dispatch thunk of MediaTagStringBuilding.attributedString(for:options:)()
{
  return dispatch thunk of MediaTagStringBuilding.attributedString(for:options:)();
}

uint64_t MediaTagStringBuilding.makeAttributedTagStrings(for:)()
{
  return MediaTagStringBuilding.makeAttributedTagStrings(for:)();
}

NSAttributedString __swiftcall MediaTagStringBuilding.attributedString(for:)(Swift::OpaquePointer a1)
{
  return (NSAttributedString)MediaTagStringBuilding.attributedString(for:)(a1._rawValue);
}

uint64_t static MediaTagStringBuilderOptions.workout.getter()
{
  return static MediaTagStringBuilderOptions.workout.getter();
}

uint64_t type metadata accessor for MediaTagStringBuilderOptions()
{
  return type metadata accessor for MediaTagStringBuilderOptions();
}

uint64_t type metadata accessor for ArtworkDimension()
{
  return type metadata accessor for ArtworkDimension();
}

uint64_t dispatch thunk of ArtworkImageLoading.fetchFallbackArtwork(for:)()
{
  return dispatch thunk of ArtworkImageLoading.fetchFallbackArtwork(for:)();
}

uint64_t dispatch thunk of ArtworkImageLoading.fetchArtwork(_:size:)()
{
  return dispatch thunk of ArtworkImageLoading.fetchArtwork(_:size:)();
}

uint64_t dispatch thunk of ArtworkImageLoading.fetchArtwork(_:thatFits:preservingPreferredDimension:)()
{
  return dispatch thunk of ArtworkImageLoading.fetchArtwork(_:thatFits:preservingPreferredDimension:)();
}

uint64_t dispatch thunk of ArtworkImageLoading.fetchRequest(_:priority:)()
{
  return dispatch thunk of ArtworkImageLoading.fetchRequest(_:priority:)();
}

uint64_t ArtworkFlavorMatching.artworkMatching(variant:)()
{
  return ArtworkFlavorMatching.artworkMatching(variant:)();
}

uint64_t MetricClickPublishing.publishClick(actionType:targetType:targetIdentifier:targetIdentifierType:metricPage:locations:impressions:topicRoutingBehavior:)()
{
  return MetricClickPublishing.publishClick(actionType:targetType:targetIdentifier:targetIdentifierType:metricPage:locations:impressions:topicRoutingBehavior:)();
}

uint64_t DefaultWheelchairStatus.init()()
{
  return DefaultWheelchairStatus.init()();
}

uint64_t type metadata accessor for DefaultWheelchairStatus()
{
  return type metadata accessor for DefaultWheelchairStatus();
}

uint64_t type metadata accessor for WheelchairStatusUpdated()
{
  return type metadata accessor for WheelchairStatusUpdated();
}

uint64_t dispatch thunk of SiriUserActivityHandling.handleActivity(_:)()
{
  return dispatch thunk of SiriUserActivityHandling.handleActivity(_:)();
}

uint64_t dispatch thunk of SiriUserActivityHandling.canHandleActivity(_:)()
{
  return dispatch thunk of SiriUserActivityHandling.canHandleActivity(_:)();
}

uint64_t type metadata accessor for MetricClickStreamOccurred()
{
  return type metadata accessor for MetricClickStreamOccurred();
}

uint64_t MetricClickStreamOccurred.init(_:)()
{
  return MetricClickStreamOccurred.init(_:)();
}

uint64_t MetricImpressionConsuming.consumeImpressions(on:)()
{
  return MetricImpressionConsuming.consumeImpressions(on:)();
}

uint64_t MetricImpressionConsuming.snapshotOnScreenImpressions(on:)()
{
  return MetricImpressionConsuming.snapshotOnScreenImpressions(on:)();
}

uint64_t MetricImpressionPublishing.publishImpressions(on:)()
{
  return MetricImpressionPublishing.publishImpressions(on:)();
}

uint64_t MetricResignActiveObserving<>.addResignActiveObserver()()
{
  return MetricResignActiveObserving<>.addResignActiveObserver()();
}

uint64_t MetricResignActiveObserving<>.removeResignActiveObserver()()
{
  return MetricResignActiveObserving<>.removeResignActiveObserver()();
}

uint64_t TrainerTipsGalleryNavigationBegan.init()()
{
  return TrainerTipsGalleryNavigationBegan.init()();
}

uint64_t type metadata accessor for TrainerTipsGalleryNavigationBegan()
{
  return type metadata accessor for TrainerTipsGalleryNavigationBegan();
}

uint64_t BalanceURLBuilder.url(route:source:)()
{
  return BalanceURLBuilder.url(route:source:)();
}

uint64_t type metadata accessor for BalanceURLBuilder.Route()
{
  return type metadata accessor for BalanceURLBuilder.Route();
}

uint64_t type metadata accessor for BalanceURLBuilder.Source()
{
  return type metadata accessor for BalanceURLBuilder.Source();
}

uint64_t BalanceURLBuilder.init()()
{
  return BalanceURLBuilder.init()();
}

uint64_t type metadata accessor for BalanceURLBuilder()
{
  return type metadata accessor for BalanceURLBuilder();
}

uint64_t WarmupProgress.isComplete.getter()
{
  return WarmupProgress.isComplete.getter();
}

uint64_t type metadata accessor for WarmupProgress()
{
  return type metadata accessor for WarmupProgress();
}

uint64_t TrainingLoadBand.color.getter()
{
  return TrainingLoadBand.color.getter();
}

uint64_t type metadata accessor for TrainingLoadBand()
{
  return type metadata accessor for TrainingLoadBand();
}

uint64_t GregorianDayRange.init(dayIndexRange:gregorianCalendar:)()
{
  return GregorianDayRange.init(dayIndexRange:gregorianCalendar:)();
}

uint64_t GregorianDayRange.dayIndexRange.getter()
{
  return GregorianDayRange.dayIndexRange.getter();
}

uint64_t GregorianDayRange.gregorianCalendar.getter()
{
  return GregorianDayRange.gregorianCalendar.getter();
}

uint64_t type metadata accessor for GregorianDayRange()
{
  return type metadata accessor for GregorianDayRange();
}

uint64_t static TrainingLoadDataType.== infix(_:_:)()
{
  return static TrainingLoadDataType.== infix(_:_:)();
}

uint64_t type metadata accessor for TrainingLoadDataType()
{
  return type metadata accessor for TrainingLoadDataType();
}

uint64_t SleepingSampleDataType.localizedName.getter()
{
  return SleepingSampleDataType.localizedName.getter();
}

uint64_t SleepingSampleDataType.preferredImage.getter()
{
  return SleepingSampleDataType.preferredImage.getter();
}

Swift::String_optional __swiftcall SleepingSampleDataType.localizedUnitString(for:)(HKUnit a1)
{
  uint64_t v1 = SleepingSampleDataType.localizedUnitString(for:)(a1.super.isa);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t SleepingSampleDataType.init(rawValue:)()
{
  return SleepingSampleDataType.init(rawValue:)();
}

uint64_t SleepingSampleDataType.rawValue.getter()
{
  return SleepingSampleDataType.rawValue.getter();
}

uint64_t type metadata accessor for SleepingSampleDataType()
{
  return type metadata accessor for SleepingSampleDataType();
}

uint64_t SleepingSampleAggregate.quantity.getter()
{
  return SleepingSampleAggregate.quantity.getter();
}

uint64_t type metadata accessor for SleepingSampleAggregate()
{
  return type metadata accessor for SleepingSampleAggregate();
}

uint64_t type metadata accessor for TrainingLoadChronicBaseline()
{
  return type metadata accessor for TrainingLoadChronicBaseline();
}

uint64_t TrainingLoadSampleDaySummary.trainingLoad.getter()
{
  return TrainingLoadSampleDaySummary.trainingLoad.getter();
}

uint64_t TrainingLoadSampleDaySummary.band.getter()
{
  return TrainingLoadSampleDaySummary.band.getter();
}

uint64_t type metadata accessor for TrainingLoadSampleDaySummary()
{
  return type metadata accessor for TrainingLoadSampleDaySummary();
}

uint64_t TrainingLoadBaselineComparison.chronicBaseline.getter()
{
  return TrainingLoadBaselineComparison.chronicBaseline.getter();
}

uint64_t type metadata accessor for TrainingLoadBaselineComparison()
{
  return type metadata accessor for TrainingLoadBaselineComparison();
}

uint64_t SleepingSampleBaselineComparison.relativeComparison.getter()
{
  return SleepingSampleBaselineComparison.relativeComparison.getter();
}

uint64_t SleepingSampleBaselineComparison.isWarmupDay.getter()
{
  return SleepingSampleBaselineComparison.isWarmupDay.getter();
}

uint64_t SleepingSampleBaselineComparison.isOutOfRange.getter()
{
  return SleepingSampleBaselineComparison.isOutOfRange.getter();
}

uint64_t SleepingSampleBaselineComparison.morningIndex.getter()
{
  return SleepingSampleBaselineComparison.morningIndex.getter();
}

uint64_t SleepingSampleBaselineComparison.aggregate.getter()
{
  return SleepingSampleBaselineComparison.aggregate.getter();
}

uint64_t type metadata accessor for SleepingSampleBaselineComparison()
{
  return type metadata accessor for SleepingSampleBaselineComparison();
}

uint64_t dispatch thunk of EngagementClientProtocol.queryEngagementBadges()()
{
  return dispatch thunk of EngagementClientProtocol.queryEngagementBadges()();
}

uint64_t dispatch thunk of EngagementClientProtocol.deleteAllEngagementBadges()()
{
  return dispatch thunk of EngagementClientProtocol.deleteAllEngagementBadges()();
}

uint64_t dispatch thunk of EngagementClientProtocol.queryIntroSheet()()
{
  return dispatch thunk of EngagementClientProtocol.queryIntroSheet()();
}

uint64_t dispatch thunk of EngagementClientProtocol.queryWhatsNewSheet()()
{
  return dispatch thunk of EngagementClientProtocol.queryWhatsNewSheet()();
}

uint64_t dispatch thunk of ConfigurationClientProtocol.queryConfiguration()()
{
  return dispatch thunk of ConfigurationClientProtocol.queryConfiguration()();
}

uint64_t dispatch thunk of RecommendationClientProtocol.queryRecommendations(for:)()
{
  return dispatch thunk of RecommendationClientProtocol.queryRecommendations(for:)();
}

uint64_t dispatch thunk of RecommendationClientProtocol.fetchPersonalizationInferenceResponse(options:)()
{
  return dispatch thunk of RecommendationClientProtocol.fetchPersonalizationInferenceResponse(options:)();
}

uint64_t dispatch thunk of RemoteBrowsingClientProtocol.tryPassword(_:)()
{
  return dispatch thunk of RemoteBrowsingClientProtocol.tryPassword(_:)();
}

uint64_t dispatch thunk of RemoteBrowsingClientProtocol.requestGuestAuthentication(to:)()
{
  return dispatch thunk of RemoteBrowsingClientProtocol.requestGuestAuthentication(to:)();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.queryArchivedSession(sessionIdentifier:)()
{
  return dispatch thunk of ArchivedSessionClientProtocol.queryArchivedSession(sessionIdentifier:)();
}

uint64_t dispatch thunk of ArchivedSessionClientProtocol.deleteArchivedSession(sessionIdentifier:)()
{
  return dispatch thunk of ArchivedSessionClientProtocol.deleteArchivedSession(sessionIdentifier:)();
}

uint64_t dispatch thunk of PrivacyPreferenceClientProtocol.fetchNoticePrivacyPreference(ignoreCaches:)()
{
  return dispatch thunk of PrivacyPreferenceClientProtocol.fetchNoticePrivacyPreference(ignoreCaches:)();
}

uint64_t dispatch thunk of PrivacyPreferenceClientProtocol.updateNoticePrivacyPreference(_:)()
{
  return dispatch thunk of PrivacyPreferenceClientProtocol.updateNoticePrivacyPreference(_:)();
}

uint64_t dispatch thunk of RemoteParticipantClientProtocol.endDiscoveringParticipants()()
{
  return dispatch thunk of RemoteParticipantClientProtocol.endDiscoveringParticipants()();
}

uint64_t dispatch thunk of RemoteParticipantClientProtocol.beginDiscoveringParticipantsWithRole(_:)()
{
  return dispatch thunk of RemoteParticipantClientProtocol.beginDiscoveringParticipantsWithRole(_:)();
}

uint64_t ContentAvailabilityClient.__allocating_init(eventHub:queue:)()
{
  return ContentAvailabilityClient.__allocating_init(eventHub:queue:)();
}

uint64_t type metadata accessor for ContentAvailabilityClient()
{
  return type metadata accessor for ContentAvailabilityClient();
}

uint64_t dispatch thunk of ContentAvailabilityClientProtocol.queryContentAvailability()()
{
  return dispatch thunk of ContentAvailabilityClientProtocol.queryContentAvailability()();
}

uint64_t dispatch thunk of ContentAvailabilityClientProtocol.queryStorefrontLanguageCode()()
{
  return dispatch thunk of ContentAvailabilityClientProtocol.queryStorefrontLanguageCode()();
}

uint64_t dispatch thunk of ServiceSubscriptionClientProtocol.fetchServiceSubscription(with:)()
{
  return dispatch thunk of ServiceSubscriptionClientProtocol.fetchServiceSubscription(with:)();
}

uint64_t dispatch thunk of MetricClientProtocol.flushMetrics()()
{
  return dispatch thunk of MetricClientProtocol.flushMetrics()();
}

uint64_t dispatch thunk of CatalogClientProtocol.fetchRemoteCatalogLockups(displayStyle:placeholders:)()
{
  return dispatch thunk of CatalogClientProtocol.fetchRemoteCatalogLockups(displayStyle:placeholders:)();
}

uint64_t dispatch thunk of CatalogClientProtocol.fetchRemoteCatalogWorkouts(_:)()
{
  return dispatch thunk of CatalogClientProtocol.fetchRemoteCatalogWorkouts(_:)();
}

uint64_t dispatch thunk of CatalogClientProtocol.queryAllCatalogModalityReferences()()
{
  return dispatch thunk of CatalogClientProtocol.queryAllCatalogModalityReferences()();
}

uint64_t dispatch thunk of CatalogClientProtocol.queryAllCatalogThemes()()
{
  return dispatch thunk of CatalogClientProtocol.queryAllCatalogThemes()();
}

uint64_t dispatch thunk of CatalogClientProtocol.queryAllBodyFocuses()()
{
  return dispatch thunk of CatalogClientProtocol.queryAllBodyFocuses()();
}

uint64_t dispatch thunk of CatalogClientProtocol.queryAllMusicGenres()()
{
  return dispatch thunk of CatalogClientProtocol.queryAllMusicGenres()();
}

uint64_t dispatch thunk of CatalogClientProtocol.queryAllSkillLevels()()
{
  return dispatch thunk of CatalogClientProtocol.queryAllSkillLevels()();
}

uint64_t dispatch thunk of CatalogClientProtocol.fetchRemoteTrainerDetail(_:)()
{
  return dispatch thunk of CatalogClientProtocol.fetchRemoteTrainerDetail(_:)();
}

uint64_t dispatch thunk of CatalogClientProtocol.queryAllTrainerReferences()()
{
  return dispatch thunk of CatalogClientProtocol.queryAllTrainerReferences()();
}

uint64_t dispatch thunk of CatalogClientProtocol.fetchRemoteExploreTrainerTipShelfLockupDescriptor()()
{
  return dispatch thunk of CatalogClientProtocol.fetchRemoteExploreTrainerTipShelfLockupDescriptor()();
}

uint64_t CatalogClientProtocol.fetchRemoteCatalogWorkoutDetail(_:)()
{
  return CatalogClientProtocol.fetchRemoteCatalogWorkoutDetail(_:)();
}

uint64_t dispatch thunk of SessionClientProtocol.queryActiveSession()()
{
  return dispatch thunk of SessionClientProtocol.queryActiveSession()();
}

uint64_t dispatch thunk of BookmarkClientProtocol.queryAllPlaylists()()
{
  return dispatch thunk of BookmarkClientProtocol.queryAllPlaylists()();
}

uint64_t dispatch thunk of UnfairLock.acquire<A>(_:)()
{
  return dispatch thunk of UnfairLock.acquire<A>(_:)();
}

uint64_t UnfairLock.init()()
{
  return UnfairLock.init()();
}

uint64_t type metadata accessor for UnfairLock()
{
  return type metadata accessor for UnfairLock();
}

uint64_t TestProperty.wrappedValue.getter()
{
  return TestProperty.wrappedValue.getter();
}

uint64_t TestProperty.init(_:fallback:)()
{
  return TestProperty.init(_:fallback:)();
}

uint64_t type metadata accessor for CatalogDeleted()
{
  return type metadata accessor for CatalogDeleted();
}

uint64_t dispatch thunk of EventHubProtocol.publish<A>(_:)()
{
  return dispatch thunk of EventHubProtocol.publish<A>(_:)();
}

uint64_t dispatch thunk of EventHubProtocol.subscribe<A>(_:subscriptionToken:handler:)()
{
  return dispatch thunk of EventHubProtocol.subscribe<A>(_:subscriptionToken:handler:)();
}

{
  return dispatch thunk of EventHubProtocol.subscribe<A>(_:subscriptionToken:handler:)();
}

uint64_t type metadata accessor for PlaylistsUpdated()
{
  return type metadata accessor for PlaylistsUpdated();
}

uint64_t static PromiseConstants.defaultMaxConcurrentOperations.getter()
{
  return static PromiseConstants.defaultMaxConcurrentOperations.getter();
}

uint64_t type metadata accessor for UserDefaultsKeys()
{
  return type metadata accessor for UserDefaultsKeys();
}

uint64_t dispatch thunk of NetworkEvaluating.queryNetworkConditions()()
{
  return dispatch thunk of NetworkEvaluating.queryNetworkConditions()();
}

uint64_t static OpenLinkConstants.multiUserHost.getter()
{
  return static OpenLinkConstants.multiUserHost.getter();
}

uint64_t static OpenLinkConstants.scheme.getter()
{
  return static OpenLinkConstants.scheme.getter();
}

uint64_t SubscriptionToken.init(eventHub:)()
{
  return SubscriptionToken.init(eventHub:)();
}

uint64_t type metadata accessor for SubscriptionToken()
{
  return type metadata accessor for SubscriptionToken();
}

uint64_t static HealthDataConstants.catalogWorkoutIdentifierProperty.getter()
{
  return static HealthDataConstants.catalogWorkoutIdentifierProperty.getter();
}

uint64_t static HealthDataConstants.workoutSessionIdentifierProperty.getter()
{
  return static HealthDataConstants.workoutSessionIdentifierProperty.getter();
}

uint64_t static HealthDataConstants.workoutSessionQueueIdentifierProperty.getter()
{
  return static HealthDataConstants.workoutSessionQueueIdentifierProperty.getter();
}

uint64_t static HealthDataConstants.workoutSessionPlaylistIdentifierProperty.getter()
{
  return static HealthDataConstants.workoutSessionPlaylistIdentifierProperty.getter();
}

uint64_t BadgingCountsUpdated.init(appBadgeCount:seymourTabBadges:)()
{
  return BadgingCountsUpdated.init(appBadgeCount:seymourTabBadges:)();
}

uint64_t type metadata accessor for BadgingCountsUpdated()
{
  return type metadata accessor for BadgingCountsUpdated();
}

uint64_t DispatchTimerProvider.init()()
{
  return DispatchTimerProvider.init()();
}

uint64_t type metadata accessor for DispatchTimerProvider()
{
  return type metadata accessor for DispatchTimerProvider();
}

uint64_t type metadata accessor for EventDispatchStrategy()
{
  return type metadata accessor for EventDispatchStrategy();
}

uint64_t type metadata accessor for RemoteParticipantLost()
{
  return type metadata accessor for RemoteParticipantLost();
}

uint64_t type metadata accessor for RecommendationsUpdated()
{
  return type metadata accessor for RecommendationsUpdated();
}

uint64_t static RecommendationConstants.personalizationHeroContentRequestVersion.getter()
{
  return static RecommendationConstants.personalizationHeroContentRequestVersion.getter();
}

uint64_t type metadata accessor for ActiveWorkoutPlanUpdated()
{
  return type metadata accessor for ActiveWorkoutPlanUpdated();
}

uint64_t type metadata accessor for NetworkConditionsChanged()
{
  return type metadata accessor for NetworkConditionsChanged();
}

uint64_t ContentAvailabilityUpdated.availability.getter()
{
  return ContentAvailabilityUpdated.availability.getter();
}

uint64_t type metadata accessor for ContentAvailabilityUpdated()
{
  return type metadata accessor for ContentAvailabilityUpdated();
}

uint64_t type metadata accessor for ServiceSubscriptionUpdated()
{
  return type metadata accessor for ServiceSubscriptionUpdated();
}

uint64_t RemoteParticipantDiscovered.participant.getter()
{
  return RemoteParticipantDiscovered.participant.getter();
}

uint64_t type metadata accessor for RemoteParticipantDiscovered()
{
  return type metadata accessor for RemoteParticipantDiscovered();
}

uint64_t type metadata accessor for OnboardingSurveyResultsUpdated()
{
  return type metadata accessor for OnboardingSurveyResultsUpdated();
}

uint64_t type metadata accessor for MultiUserBeginActivityRequested()
{
  return type metadata accessor for MultiUserBeginActivityRequested();
}

uint64_t type metadata accessor for RemoteParticipantPasswordRequired()
{
  return type metadata accessor for RemoteParticipantPasswordRequired();
}

uint64_t type metadata accessor for AchievementEnvironmentCacheUpdated()
{
  return type metadata accessor for AchievementEnvironmentCacheUpdated();
}

uint64_t type metadata accessor for PersonalizationPrivacyPreferenceUpdated()
{
  return type metadata accessor for PersonalizationPrivacyPreferenceUpdated();
}

uint64_t static Log.engagement.getter()
{
  return static Log.engagement.getter();
}

uint64_t static Log.triage.getter()
{
  return static Log.triage.getter();
}

uint64_t static Log.default.getter()
{
  return static Log.default.getter();
}

uint64_t type metadata accessor for Feature()
{
  return type metadata accessor for Feature();
}

uint64_t EventHub.init(queue:dispatchStrategy:timerProvider:)()
{
  return EventHub.init(queue:dispatchStrategy:timerProvider:)();
}

uint64_t type metadata accessor for EventHub()
{
  return type metadata accessor for EventHub();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t WalkSuggestionClient.init()()
{
  return WalkSuggestionClient.init()();
}

uint64_t type metadata accessor for WalkSuggestionClient()
{
  return type metadata accessor for WalkSuggestionClient();
}

uint64_t static NotificationRequestConstants.moveModeChangeModeNotificationCategory.getter()
{
  return static NotificationRequestConstants.moveModeChangeModeNotificationCategory.getter();
}

uint64_t static NotificationRequestConstants.moveModeChangeGoalsNotificationCategory.getter()
{
  return static NotificationRequestConstants.moveModeChangeGoalsNotificationCategory.getter();
}

uint64_t static NotificationRequestConstants.moveModeNotificationCategory.getter()
{
  return static NotificationRequestConstants.moveModeNotificationCategory.getter();
}

uint64_t static MoveModeNotificationConstants.nextMoveModeUserInfoKey.getter()
{
  return static MoveModeNotificationConstants.nextMoveModeUserInfoKey.getter();
}

uint64_t static MoveModeNotificationConstants.notificationTypeUserInfoKey.getter()
{
  return static MoveModeNotificationConstants.notificationTypeUserInfoKey.getter();
}

uint64_t type metadata accessor for BalanceMetricsTimeScope()
{
  return type metadata accessor for BalanceMetricsTimeScope();
}

uint64_t static BaselineRelativeValue.== infix(_:_:)()
{
  return static BaselineRelativeValue.== infix(_:_:)();
}

uint64_t type metadata accessor for BaselineRelativeValue()
{
  return type metadata accessor for BaselineRelativeValue();
}

uint64_t OvernightMetricsChart.init(timeScope:chartPoints:emphasizedChartPoint:emphasizedDataType:medialRange:visibleDataTypes:keyDates:)()
{
  return OvernightMetricsChart.init(timeScope:chartPoints:emphasizedChartPoint:emphasizedDataType:medialRange:visibleDataTypes:keyDates:)();
}

uint64_t type metadata accessor for OvernightMetricsChart()
{
  return type metadata accessor for OvernightMetricsChart();
}

uint64_t SleepingSampleViewModel.primaryTintColor.getter()
{
  return SleepingSampleViewModel.primaryTintColor.getter();
}

uint64_t SleepingSampleViewModel.keyDatesForTimeAxis.getter()
{
  return SleepingSampleViewModel.keyDatesForTimeAxis.getter();
}

uint64_t SleepingSampleViewModel.chartableMedialRange.getter()
{
  return SleepingSampleViewModel.chartableMedialRange.getter();
}

uint64_t SleepingSampleViewModel.preferredAggregateValueUnit.getter()
{
  return SleepingSampleViewModel.preferredAggregateValueUnit.getter();
}

uint64_t SleepingSampleViewModel.formattedCurrentAggregateValue.getter()
{
  return SleepingSampleViewModel.formattedCurrentAggregateValue.getter();
}

uint64_t SleepingSampleViewModel.chronologicalBaselineComparisons.getter()
{
  return SleepingSampleViewModel.chronologicalBaselineComparisons.getter();
}

uint64_t SleepingSampleViewModel.dataType.getter()
{
  return SleepingSampleViewModel.dataType.getter();
}

uint64_t SleepingSampleViewModel.dayRange.getter()
{
  return SleepingSampleViewModel.dayRange.getter();
}

uint64_t type metadata accessor for SleepingSampleViewModel()
{
  return type metadata accessor for SleepingSampleViewModel();
}

uint64_t OvernightMetricsViewModel.overnightVitalsState.getter()
{
  return OvernightMetricsViewModel.overnightVitalsState.getter();
}

uint64_t OvernightMetricsViewModel.chartPoints.getter()
{
  return OvernightMetricsViewModel.chartPoints.getter();
}

uint64_t OvernightMetricsViewModel.medialRange.getter()
{
  return OvernightMetricsViewModel.medialRange.getter();
}

uint64_t OvernightMetricsViewModel.localizedTitle.getter()
{
  return OvernightMetricsViewModel.localizedTitle.getter();
}

uint64_t OvernightMetricsViewModel.warmupProgress.getter()
{
  return OvernightMetricsViewModel.warmupProgress.getter();
}

uint64_t OvernightMetricsViewModel.primaryTintColor.getter()
{
  return OvernightMetricsViewModel.primaryTintColor.getter();
}

uint64_t OvernightMetricsViewModel.visibleDataTypes.getter()
{
  return OvernightMetricsViewModel.visibleDataTypes.getter();
}

uint64_t OvernightMetricsViewModel.keyDatesForTimeAxis.getter()
{
  return OvernightMetricsViewModel.keyDatesForTimeAxis.getter();
}

uint64_t OvernightMetricsViewModel.emphasizedChartPoint.getter()
{
  return OvernightMetricsViewModel.emphasizedChartPoint.getter();
}

uint64_t OvernightMetricsViewModel.changeCountDescription.getter()
{
  return OvernightMetricsViewModel.changeCountDescription.getter();
}

uint64_t OvernightMetricsViewModel.changeDetectedCountToday.getter()
{
  return OvernightMetricsViewModel.changeDetectedCountToday.getter();
}

uint64_t OvernightMetricsViewModel.isWatchExperienceAvailable.getter()
{
  return OvernightMetricsViewModel.isWatchExperienceAvailable.getter();
}

uint64_t OvernightMetricsViewModel.watchExperienceRequiresSetup.getter()
{
  return OvernightMetricsViewModel.watchExperienceRequiresSetup.getter();
}

uint64_t static OvernightMetricsViewModel.Summary.Variant.== infix(_:_:)()
{
  return static OvernightMetricsViewModel.Summary.Variant.== infix(_:_:)();
}

uint64_t type metadata accessor for OvernightMetricsViewModel.Summary.Variant()
{
  return type metadata accessor for OvernightMetricsViewModel.Summary.Variant();
}

uint64_t OvernightMetricsViewModel.Summary.variant.getter()
{
  return OvernightMetricsViewModel.Summary.variant.getter();
}

uint64_t type metadata accessor for OvernightMetricsViewModel.Summary()
{
  return type metadata accessor for OvernightMetricsViewModel.Summary();
}

uint64_t OvernightMetricsViewModel.summary.getter()
{
  return OvernightMetricsViewModel.summary.getter();
}

uint64_t type metadata accessor for OvernightMetricsViewModel()
{
  return type metadata accessor for OvernightMetricsViewModel();
}

uint64_t OvernightMetricsWarmupProgress.overallProgress.getter()
{
  return OvernightMetricsWarmupProgress.overallProgress.getter();
}

uint64_t type metadata accessor for OvernightMetricsWarmupProgress()
{
  return type metadata accessor for OvernightMetricsWarmupProgress();
}

uint64_t dispatch thunk of SleepingSampleViewModelProvider.overnightMetricsModel.getter()
{
  return dispatch thunk of SleepingSampleViewModelProvider.overnightMetricsModel.getter();
}

uint64_t dispatch thunk of SleepingSampleViewModelProvider.startQuery()()
{
  return dispatch thunk of SleepingSampleViewModelProvider.startQuery()();
}

uint64_t dispatch thunk of SleepingSampleViewModelProvider.viewModels.getter()
{
  return dispatch thunk of SleepingSampleViewModelProvider.viewModels.getter();
}

uint64_t SleepingSampleViewModelProvider.__allocating_init(healthStore:dayRange:debugIdentifier:)()
{
  return SleepingSampleViewModelProvider.__allocating_init(healthStore:dayRange:debugIdentifier:)();
}

uint64_t static SleepingSampleViewModelProvider.DataFreshness.== infix(_:_:)()
{
  return static SleepingSampleViewModelProvider.DataFreshness.== infix(_:_:)();
}

uint64_t type metadata accessor for SleepingSampleViewModelProvider.DataFreshness()
{
  return type metadata accessor for SleepingSampleViewModelProvider.DataFreshness();
}

uint64_t dispatch thunk of SleepingSampleViewModelProvider.dataFreshness.getter()
{
  return dispatch thunk of SleepingSampleViewModelProvider.dataFreshness.getter();
}

uint64_t dispatch thunk of SleepingSampleViewModelProvider.dayRange.setter()
{
  return dispatch thunk of SleepingSampleViewModelProvider.dayRange.setter();
}

uint64_t type metadata accessor for SleepingSampleViewModelProvider()
{
  return type metadata accessor for SleepingSampleViewModelProvider();
}

uint64_t Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)()
{
  return Map.init<A, B>(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)();
}

uint64_t static MapInteractionModes.all.getter()
{
  return static MapInteractionModes.all.getter();
}

uint64_t type metadata accessor for MapInteractionModes()
{
  return type metadata accessor for MapInteractionModes();
}

uint64_t ReplyLayoutValues.phoneValues.unsafeMutableAddressor()
{
  return ReplyLayoutValues.phoneValues.unsafeMutableAddressor();
}

uint64_t Reply.init(message:isFromMe:friend:recipientAddress:timestamp:)()
{
  return Reply.init(message:isFromMe:friend:recipientAddress:timestamp:)();
}

uint64_t type metadata accessor for Reply()
{
  return type metadata accessor for Reply();
}

uint64_t AppEntityViewAnnotation.init<A>(entity:state:)()
{
  return AppEntityViewAnnotation.init<A>(entity:state:)();
}

uint64_t type metadata accessor for AppEntityViewAnnotation()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t AnyRegexOutput.count.getter()
{
  return AnyRegexOutput.count.getter();
}

uint64_t AnyRegexOutput.Element.range.getter()
{
  return AnyRegexOutput.Element.range.getter();
}

uint64_t type metadata accessor for AnyRegexOutput.Element()
{
  return type metadata accessor for AnyRegexOutput.Element();
}

uint64_t AnyRegexOutput.subscript.getter()
{
  return AnyRegexOutput.subscript.getter();
}

uint64_t Regex.firstMatch(in:)()
{
  return Regex.firstMatch(in:)();
}

uint64_t Regex.Match.subscript.getter()
{
  return Regex.Match.subscript.getter();
}

uint64_t Regex<A>.init(_:)()
{
  return Regex<A>.init(_:)();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.deactivate()()
{
  return dispatch thunk of ActivityAwardsDateQuery.deactivate()();
}

uint64_t ActivityAwardsDateQuery.init(dateComponents:initialAwardsHandler:updateHandler:)()
{
  return ActivityAwardsDateQuery.init(dateComponents:initialAwardsHandler:updateHandler:)();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.activate()()
{
  return dispatch thunk of ActivityAwardsDateQuery.activate()();
}

uint64_t type metadata accessor for ActivityAwardsDateQuery()
{
  return type metadata accessor for ActivityAwardsDateQuery();
}

uint64_t SecureCloudClient.init()()
{
  return SecureCloudClient.init()();
}

uint64_t type metadata accessor for SecureCloudClient()
{
  return type metadata accessor for SecureCloudClient();
}

uint64_t ActivitySharingSettings.init(healthStore:)()
{
  return ActivitySharingSettings.init(healthStore:)();
}

uint64_t type metadata accessor for ActivitySharingSettings()
{
  return type metadata accessor for ActivitySharingSettings();
}

uint64_t InvitationDestination.serviceIdentifier.getter()
{
  return InvitationDestination.serviceIdentifier.getter();
}

uint64_t type metadata accessor for InvitationDestination()
{
  return type metadata accessor for InvitationDestination();
}

uint64_t InvitationDestinationCache.__allocating_init(invitationDestinationMap:)()
{
  return InvitationDestinationCache.__allocating_init(invitationDestinationMap:)();
}

uint64_t type metadata accessor for InvitationDestinationCache()
{
  return type metadata accessor for InvitationDestinationCache();
}

uint64_t InvitationDestinationGroup.preferredDestination.getter()
{
  return InvitationDestinationGroup.preferredDestination.getter();
}

uint64_t InvitationDestinationGroup.destination.getter()
{
  return InvitationDestinationGroup.destination.getter();
}

uint64_t InvitationDestinationGroup.additionalDestinations.getter()
{
  return InvitationDestinationGroup.additionalDestinations.getter();
}

uint64_t type metadata accessor for InvitationDestinationGroup()
{
  return type metadata accessor for InvitationDestinationGroup();
}

uint64_t InvitationDestinationService.init(cache:)()
{
  return InvitationDestinationService.init(cache:)();
}

uint64_t type metadata accessor for InvitationDestinationService()
{
  return type metadata accessor for InvitationDestinationService();
}

uint64_t AAUIAwardsDataProvider.__allocating_init(healthStore:layoutMode:)()
{
  return AAUIAwardsDataProvider.__allocating_init(healthStore:layoutMode:)();
}

uint64_t AAUIAwardsDataProvider.init(healthStore:pauseRingsCoordinator:layoutMode:)()
{
  return AAUIAwardsDataProvider.init(healthStore:pauseRingsCoordinator:layoutMode:)();
}

uint64_t AAUIAwardsDataProvider.achievements(forWorkoutIdentifier:)()
{
  return AAUIAwardsDataProvider.achievements(forWorkoutIdentifier:)();
}

uint64_t AAUIAwardsDataProvider.add(observer:)()
{
  return AAUIAwardsDataProvider.add(observer:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AAUIAwardsDataProvider.activate(isFitnessPlusSubscriber:)(Swift::Bool isFitnessPlusSubscriber)
{
}

uint64_t type metadata accessor for AAUIAwardsDataProvider()
{
  return type metadata accessor for AAUIAwardsDataProvider();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.topThreeAchievements()()
{
  return dispatch thunk of AAUIAwardsDataProviding.topThreeAchievements()();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievements(forSection:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.achievements(forSection:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievements(forWorkoutIdentifier:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.achievements(forWorkoutIdentifier:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.otherSections()()
{
  return dispatch thunk of AAUIAwardsDataProviding.otherSections()();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.topAchievement(forSection:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.topAchievement(forSection:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievementCount(forSection:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.achievementCount(forSection:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievementStack(forSection:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.achievementStack(forSection:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.mostRecentSection()()
{
  return dispatch thunk of AAUIAwardsDataProviding.mostRecentSection()();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.shouldShowProgressBar(for:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.shouldShowProgressBar(for:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.add(observer:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.add(observer:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.remove(observer:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.remove(observer:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.activate(isFitnessPlusSubscriber:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.activate(isFitnessPlusSubscriber:)();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.activate()()
{
  return dispatch thunk of AAUIAwardsDataProviding.activate()();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.sections(atIndex:)()
{
  return dispatch thunk of AAUIAwardsDataProviding.sections(atIndex:)();
}

uint64_t static AAUIAwardsDataProviderSection.allCases.getter()
{
  return static AAUIAwardsDataProviderSection.allCases.getter();
}

uint64_t AAUIAwardsDataProviderSection.init(rawValue:)()
{
  return AAUIAwardsDataProviderSection.init(rawValue:)();
}

uint64_t AAUIAwardsDataProviderSection.rawValue.getter()
{
  return AAUIAwardsDataProviderSection.rawValue.getter();
}

Swift::String __swiftcall AAUIAwardsDataProviderSection.localized()()
{
  uint64_t v0 = AAUIAwardsDataProviderSection.localized()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t type metadata accessor for AAUIAwardsDataProviderSection()
{
  return type metadata accessor for AAUIAwardsDataProviderSection();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return OSSignposter.init(subsystem:category:)();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

Swift::Void __swiftcall Logger.trace(file:function:)(Swift::String file, Swift::String function)
{
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static _UIKitNumericRawRepresentable.- infix(_:_:)()
{
  return static _UIKitNumericRawRepresentable.- infix(_:_:)();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t UIBackgroundConfiguration.cornerRadius.setter()
{
  return UIBackgroundConfiguration.cornerRadius.setter();
}

uint64_t UIBackgroundConfiguration.backgroundColor.setter()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t UIListContentConfiguration.TextProperties.font.getter()
{
  return UIListContentConfiguration.TextProperties.font.getter();
}

uint64_t type metadata accessor for UIListContentConfiguration.TextProperties()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties();
}

uint64_t UIListContentConfiguration.attributedText.setter()
{
  return UIListContentConfiguration.attributedText.setter();
}

uint64_t UIListContentConfiguration.textProperties.getter()
{
  return UIListContentConfiguration.textProperties.getter();
}

uint64_t UIListContentConfiguration.directionalLayoutMargins.getter()
{
  return UIListContentConfiguration.directionalLayoutMargins.getter();
}

uint64_t static UIListContentConfiguration.extraProminentInsetGroupedHeader()()
{
  return static UIListContentConfiguration.extraProminentInsetGroupedHeader()();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t NSDiffableDataSourceSnapshot.appendItems(_:toSection:)()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.deleteItems(_:)(Swift::OpaquePointer a1)
{
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.appendSections(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.reconfigureItems(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t NSDiffableDataSourceTransaction.finalSnapshot.getter()
{
  return NSDiffableDataSourceTransaction.finalSnapshot.getter();
}

uint64_t UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t UICollectionViewDiffableDataSource.ReorderingHandlers.didReorder.setter()
{
  return UICollectionViewDiffableDataSource.ReorderingHandlers.didReorder.setter();
}

uint64_t UICollectionViewDiffableDataSource.ReorderingHandlers.canReorderItem.setter()
{
  return UICollectionViewDiffableDataSource.ReorderingHandlers.canReorderItem.setter();
}

uint64_t UICollectionViewDiffableDataSource.reorderingHandlers.modify()
{
  return UICollectionViewDiffableDataSource.reorderingHandlers.modify();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t UICollectionViewDiffableDataSource.snapshot(for:)()
{
  return UICollectionViewDiffableDataSource.snapshot(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t NSDiffableDataSourceSectionSnapshot.items.getter()
{
  return NSDiffableDataSourceSectionSnapshot.items.getter();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.Appearance()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.FooterMode()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.FooterMode();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t UICollectionLayoutListConfiguration.init(appearance:)()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t UICollectionLayoutListConfiguration.footerMode.setter()
{
  return UICollectionLayoutListConfiguration.footerMode.setter();
}

uint64_t UICollectionLayoutListConfiguration.headerMode.setter()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t AxisGridLine.init(centered:stroke:)()
{
  return AxisGridLine.init(centered:stroke:)();
}

uint64_t type metadata accessor for AxisGridLine()
{
  return type metadata accessor for AxisGridLine();
}

uint64_t static ChartContent._makeChartContent(content:inputs:)()
{
  return static ChartContent._makeChartContent(content:inputs:)();
}

uint64_t static ChartContent._chartContentCount(inputs:)()
{
  return static ChartContent._chartContentCount(inputs:)();
}

uint64_t static ChartContent._layoutChartContent(_:_:)()
{
  return static ChartContent._layoutChartContent(_:_:)();
}

uint64_t static ChartContent._renderChartContent(_:_:)()
{
  return static ChartContent._renderChartContent(_:_:)();
}

uint64_t ChartContent.annotation<A>(position:alignment:spacing:overflowResolution:content:)()
{
  return ChartContent.annotation<A>(position:alignment:spacing:overflowResolution:content:)();
}

uint64_t ChartContent.cornerRadius(_:style:)()
{
  return ChartContent.cornerRadius(_:style:)();
}

uint64_t ChartContent.foregroundStyle<A>(_:)()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t ChartContent.compositingLayer()()
{
  return ChartContent.compositingLayer()();
}

uint64_t ChartContent.accessibilityLabel<A>(_:)()
{
  return ChartContent.accessibilityLabel<A>(_:)();
}

uint64_t ChartContent.accessibilityValue<A>(_:)()
{
  return ChartContent.accessibilityValue<A>(_:)();
}

uint64_t ChartContent.accessibilityHidden(_:)()
{
  return ChartContent.accessibilityHidden(_:)();
}

uint64_t ChartContent.interpolationMethod(_:)()
{
  return ChartContent.interpolationMethod(_:)();
}

uint64_t ChartContent.alignsMarkStylesWithPlotArea(_:)()
{
  return ChartContent.alignsMarkStylesWithPlotArea(_:)();
}

uint64_t ChartContent.offset(x:y:)()
{
  return ChartContent.offset(x:y:)();
}

uint64_t ChartContent.offset(x:yStart:yEnd:)()
{
  return ChartContent.offset(x:yStart:yEnd:)();
}

uint64_t ChartContent.symbol<A>(symbol:)()
{
  return ChartContent.symbol<A>(symbol:)();
}

uint64_t ChartContent.zIndex(_:)()
{
  return ChartContent.zIndex(_:)();
}

uint64_t ChartContent.opacity(_:)()
{
  return ChartContent.opacity(_:)();
}

uint64_t ChartContent.clipShape<A>(_:style:)()
{
  return ChartContent.clipShape<A>(_:style:)();
}

uint64_t ChartContent.lineStyle(_:)()
{
  return ChartContent.lineStyle(_:)();
}

uint64_t RectangleMark.init<A, B>(xStart:xEnd:yStart:yEnd:)()
{
  return RectangleMark.init<A, B>(xStart:xEnd:yStart:yEnd:)();
}

uint64_t type metadata accessor for RectangleMark()
{
  return type metadata accessor for RectangleMark();
}

uint64_t static AxisMarkPreset.inset.getter()
{
  return static AxisMarkPreset.inset.getter();
}

uint64_t static AxisMarkPreset.automatic.getter()
{
  return static AxisMarkPreset.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPreset()
{
  return type metadata accessor for AxisMarkPreset();
}

uint64_t static AxisMarkValues.stride(by:count:roundLowerBound:roundUpperBound:calendar:)()
{
  return static AxisMarkValues.stride(by:count:roundLowerBound:roundUpperBound:calendar:)();
}

uint64_t static AxisMarkValues.automatic(desiredCount:roundLowerBound:roundUpperBound:)()
{
  return static AxisMarkValues.automatic(desiredCount:roundLowerBound:roundUpperBound:)();
}

uint64_t static AxisMarkValues.automatic.getter()
{
  return static AxisMarkValues.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkValues()
{
  return type metadata accessor for AxisMarkValues();
}

uint64_t AxisValueLabel.init(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:content:)()
{
  return AxisValueLabel.init(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:content:)();
}

uint64_t AxisValueLabel.init<A>(_:centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)()
{
  return AxisValueLabel.init<A>(_:centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)();
}

uint64_t static PlottableValue.value<>(_:_:unit:calendar:)()
{
  return static PlottableValue.value<>(_:_:unit:calendar:)();
}

uint64_t static PlottableValue.value(_:_:)()
{
  return static PlottableValue.value(_:_:)();
}

uint64_t static PlottableValue.value<A>(_:_:)()
{
  return static PlottableValue.value<A>(_:_:)();
}

uint64_t static AxisMarkPosition.automatic.getter()
{
  return static AxisMarkPosition.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPosition()
{
  return type metadata accessor for AxisMarkPosition();
}

uint64_t static AnnotationPosition.top.getter()
{
  return static AnnotationPosition.top.getter();
}

uint64_t type metadata accessor for AnnotationPosition()
{
  return type metadata accessor for AnnotationPosition();
}

uint64_t static AxisValueLabelOrientation.automatic.getter()
{
  return static AxisValueLabelOrientation.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelOrientation()
{
  return type metadata accessor for AxisValueLabelOrientation();
}

uint64_t AnnotationOverflowResolution.init(x:y:)()
{
  return AnnotationOverflowResolution.init(x:y:)();
}

uint64_t static AnnotationOverflowResolution.Boundary.chart.getter()
{
  return static AnnotationOverflowResolution.Boundary.chart.getter();
}

uint64_t type metadata accessor for AnnotationOverflowResolution.Boundary()
{
  return type metadata accessor for AnnotationOverflowResolution.Boundary();
}

uint64_t static AnnotationOverflowResolution.Strategy.fit(to:)()
{
  return static AnnotationOverflowResolution.Strategy.fit(to:)();
}

uint64_t static AnnotationOverflowResolution.Strategy.disabled.getter()
{
  return static AnnotationOverflowResolution.Strategy.disabled.getter();
}

uint64_t type metadata accessor for AnnotationOverflowResolution.Strategy()
{
  return type metadata accessor for AnnotationOverflowResolution.Strategy();
}

uint64_t type metadata accessor for AnnotationOverflowResolution()
{
  return type metadata accessor for AnnotationOverflowResolution();
}

uint64_t static AxisValueLabelCollisionResolution.automatic.getter()
{
  return static AxisValueLabelCollisionResolution.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelCollisionResolution()
{
  return type metadata accessor for AxisValueLabelCollisionResolution();
}

uint64_t Plot.init(content:)()
{
  return Plot.init(content:)();
}

uint64_t Chart.init(content:)()
{
  return Chart.init(content:)();
}

uint64_t BarMark.init<A, B>(x:y:width:height:stacking:)()
{
  return BarMark.init<A, B>(x:y:width:height:stacking:)();
}

uint64_t type metadata accessor for BarMark()
{
  return type metadata accessor for BarMark();
}

uint64_t AxisMark.foregroundStyle<A>(_:)()
{
  return AxisMark.foregroundStyle<A>(_:)();
}

uint64_t AxisMark.offset(x:y:)()
{
  return AxisMark.offset(x:y:)();
}

uint64_t static AxisTick.Length.automatic.getter()
{
  return static AxisTick.Length.automatic.getter();
}

uint64_t type metadata accessor for AxisTick.Length()
{
  return type metadata accessor for AxisTick.Length();
}

uint64_t AxisTick.init(centered:length:stroke:)()
{
  return AxisTick.init(centered:length:stroke:)();
}

uint64_t type metadata accessor for AxisTick()
{
  return type metadata accessor for AxisTick();
}

uint64_t LineMark.init<A, B, C>(x:y:series:)()
{
  return LineMark.init<A, B, C>(x:y:series:)();
}

uint64_t LineMark.init<A, B>(x:y:)()
{
  return LineMark.init<A, B>(x:y:)();
}

uint64_t type metadata accessor for LineMark()
{
  return type metadata accessor for LineMark();
}

uint64_t RuleMark.init<A>(x:yStart:yEnd:)()
{
  return RuleMark.init<A>(x:yStart:yEnd:)();
}

uint64_t RuleMark.init<A, B>(x:yStart:yEnd:)()
{
  return RuleMark.init<A, B>(x:yStart:yEnd:)();
}

uint64_t RuleMark.init<A, B>(xStart:xEnd:y:)()
{
  return RuleMark.init<A, B>(xStart:xEnd:y:)();
}

uint64_t type metadata accessor for RuleMark()
{
  return type metadata accessor for RuleMark();
}

uint64_t AxisMarks.init(preset:position:values:content:)()
{
  return AxisMarks.init(preset:position:values:content:)();
}

{
  return AxisMarks.init(preset:position:values:content:)();
}

uint64_t AxisMarks.init<A>(preset:position:values:content:)()
{
  return AxisMarks.init<A>(preset:position:values:content:)();
}

uint64_t AxisValue.as<A>(_:)()
{
  return AxisValue.as<A>(_:)();
}

uint64_t AxisValue.count.getter()
{
  return AxisValue.count.getter();
}

uint64_t AxisValue.index.getter()
{
  return AxisValue.index.getter();
}

uint64_t type metadata accessor for AxisValue()
{
  return type metadata accessor for AxisValue();
}

uint64_t type metadata accessor for ScaleType()
{
  return type metadata accessor for ScaleType();
}

uint64_t Tip.invalidate(reason:)()
{
  return Tip.invalidate(reason:)();
}

uint64_t Tip.shouldDisplay.getter()
{
  return Tip.shouldDisplay.getter();
}

uint64_t Tip.statusUpdates.getter()
{
  return Tip.statusUpdates.getter();
}

uint64_t Tip.shouldDisplayUpdates.getter()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.rules.getter()
{
  return Tip.rules.getter();
}

uint64_t Tip.status.getter()
{
  return Tip.status.getter();
}

uint64_t Tip.options.getter()
{
  return Tip.options.getter();
}

uint64_t TipUICollectionViewCell.configureTip(_:arrowEdge:actionHandler:)()
{
  return TipUICollectionViewCell.configureTip(_:arrowEdge:actionHandler:)();
}

uint64_t type metadata accessor for TipUICollectionViewCell()
{
  return type metadata accessor for TipUICollectionViewCell();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(first:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(first:)();
}

uint64_t static Tips.ParameterOption.transient.getter()
{
  return static Tips.ParameterOption.transient.getter();
}

uint64_t type metadata accessor for Tips.ParameterOption()
{
  return type metadata accessor for Tips.ParameterOption();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.daily.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.daily.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DisplayFrequency()
{
  return type metadata accessor for Tips.ConfigurationOption.DisplayFrequency();
}

uint64_t static Tips.ConfigurationOption.displayFrequency(_:)()
{
  return static Tips.ConfigurationOption.displayFrequency(_:)();
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

uint64_t Tips.Action.init<A>(id:title:perform:)()
{
  return Tips.Action.init<A>(id:title:perform:)();
}

uint64_t Tips.Action.init(id:perform:_:)()
{
  return Tips.Action.init(id:perform:_:)();
}

uint64_t Tips.Action.id.getter()
{
  return Tips.Action.id.getter();
}

uint64_t Tips.Action.with(index:)()
{
  return Tips.Action.with(index:)();
}

uint64_t type metadata accessor for Tips.Action()
{
  return type metadata accessor for Tips.Action();
}

uint64_t type metadata accessor for Tips.Status()
{
  return type metadata accessor for Tips.Status();
}

uint64_t Tips.Parameter.wrappedValue.setter()
{
  return Tips.Parameter.wrappedValue.setter();
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

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
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

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
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

uint64_t Publisher.subscribe<A>(on:options:)()
{
  return Publisher.subscribe<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t PauseRingsPeriod.localizedTitleForCurrentDate.getter()
{
  return PauseRingsPeriod.localizedTitleForCurrentDate.getter();
}

uint64_t PauseRingsPeriod.date()()
{
  return PauseRingsPeriod.date()();
}

uint64_t type metadata accessor for PauseRingsPeriod()
{
  return type metadata accessor for PauseRingsPeriod();
}

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t AppStorage.init<A>(wrappedValue:_:store:)()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t AppStorage.wrappedValue.getter()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t AppStorage.wrappedValue.setter()
{
  return AppStorage.wrappedValue.setter();
}

uint64_t static ButtonRole.destructive.getter()
{
  return static ButtonRole.destructive.getter();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t FocusState.wrappedValue.getter()
{
  return FocusState.wrappedValue.getter();
}

uint64_t FocusState.wrappedValue.setter()
{
  return FocusState.wrappedValue.setter();
}

uint64_t FocusState.projectedValue.getter()
{
  return FocusState.projectedValue.getter();
}

uint64_t FocusState.init<>()()
{
  return FocusState.init<>()();
}

uint64_t LazyVStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyVStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t type metadata accessor for ScrollView()
{
  return type metadata accessor for ScrollView();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t static ShapeStyle<>.keyTint.getter()
{
  return static ShapeStyle<>.keyTint.getter();
}

uint64_t TapGesture.init(count:)()
{
  return TapGesture.init(count:)();
}

uint64_t type metadata accessor for TapGesture()
{
  return type metadata accessor for TapGesture();
}

uint64_t TextEditor.init(text:)()
{
  return TextEditor.init(text:)();
}

uint64_t type metadata accessor for TextEditor()
{
  return type metadata accessor for TextEditor();
}

uint64_t static AlignmentID._combineExplicit(childValue:_:into:)()
{
  return static AlignmentID._combineExplicit(childValue:_:into:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for ControlSize()
{
  return type metadata accessor for ControlSize();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.translation.getter()
{
  return DragGesture.Value.translation.getter();
}

uint64_t DragGesture.Value.location.getter()
{
  return DragGesture.Value.location.getter();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t PPTTestCase.parameters.getter()
{
  return PPTTestCase.parameters.getter();
}

uint64_t PPTTestCase.performScrollTest(_:)()
{
  return PPTTestCase.performScrollTest(_:)();
}

uint64_t type metadata accessor for PPTTestCase.Name()
{
  return type metadata accessor for PPTTestCase.Name();
}

uint64_t PPTTestCase.Name.init(_:)()
{
  return PPTTestCase.Name.init(_:)();
}

uint64_t type metadata accessor for PPTTestCase()
{
  return type metadata accessor for PPTTestCase();
}

uint64_t dispatch thunk of PPTTestHost.runTest(_:options:)()
{
  return dispatch thunk of PPTTestHost.runTest(_:options:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t StateObject.projectedValue.getter()
{
  return StateObject.projectedValue.getter();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t GestureState.init(wrappedValue:)()
{
  return GestureState.init(wrappedValue:)();
}

uint64_t GestureState.wrappedValue.getter()
{
  return GestureState.wrappedValue.getter();
}

uint64_t GestureState.projectedValue.getter()
{
  return GestureState.projectedValue.getter();
}

uint64_t ProgressView<>.init<>()()
{
  return ProgressView<>.init<>()();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t ScrollTarget.rect.modify()
{
  return ScrollTarget.rect.modify();
}

uint64_t ScrollTarget.rect.getter()
{
  return ScrollTarget.rect.getter();
}

uint64_t TimelineView.Context.date.getter()
{
  return TimelineView.Context.date.getter();
}

uint64_t TimelineView<>.init(_:content:)()
{
  return TimelineView<>.init(_:content:)();
}

uint64_t static VerticalEdge.Set.all.getter()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t static VerticalEdge.Set.bottom.getter()
{
  return static VerticalEdge.Set.bottom.getter();
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

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t AnyTransition.init<A>(_:)()
{
  return AnyTransition.init<A>(_:)();
}

Swift::Void __swiftcall DismissAction.callAsFunction()()
{
}

uint64_t type metadata accessor for DismissAction()
{
  return type metadata accessor for DismissAction();
}

uint64_t GeometryProxy.safeAreaInsets.getter()
{
  return GeometryProxy.safeAreaInsets.getter();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t LayoutSubview.place(at:anchor:proposal:)()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t type metadata accessor for LayoutSubview()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t type metadata accessor for OpenURLAction()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t GeometryReader.init(content:)()
{
  return GeometryReader.init(content:)();
}

uint64_t type metadata accessor for GeometryReader()
{
  return type metadata accessor for GeometryReader();
}

uint64_t type metadata accessor for LayoutSubviews()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t LayoutSubviews.subscript.getter()
{
  return LayoutSubviews.subscript.getter();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t MoveTransition.init(edge:)()
{
  return MoveTransition.init(edge:)();
}

uint64_t type metadata accessor for MoveTransition()
{
  return type metadata accessor for MoveTransition();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t NavigationLink<>.init<A>(value:label:)()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t type metadata accessor for NavigationLink()
{
  return type metadata accessor for NavigationLink();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
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

uint64_t PlainListStyle.init()()
{
  return PlainListStyle.init()();
}

uint64_t type metadata accessor for PlainListStyle()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t ScrollGeometry.containerSize.getter()
{
  return ScrollGeometry.containerSize.getter();
}

uint64_t ScrollGeometry.contentOffset.getter()
{
  return ScrollGeometry.contentOffset.getter();
}

uint64_t static ToolbarContent._makeToolbar(content:inputs:)()
{
  return static ToolbarContent._makeToolbar(content:inputs:)();
}

uint64_t static ToolbarContent._makeContent(content:inputs:resolved:)()
{
  return static ToolbarContent._makeContent(content:inputs:resolved:)();
}

uint64_t ViewDimensions.subscript.getter()
{
  return ViewDimensions.subscript.getter();
}

{
  return ViewDimensions.subscript.getter();
}

uint64_t _UIHostingView.init(rootView:)()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t AngularGradient.init(gradient:center:startAngle:endAngle:)()
{
  return AngularGradient.init(gradient:center:startAngle:endAngle:)();
}

uint64_t ButtonMenuStyle.init()()
{
  return ButtonMenuStyle.init()();
}

uint64_t type metadata accessor for ButtonMenuStyle()
{
  return type metadata accessor for ButtonMenuStyle();
}

uint64_t static DynamicTypeSize.< infix(_:_:)()
{
  return static DynamicTypeSize.< infix(_:_:)();
}

uint64_t static DynamicTypeSize.== infix(_:_:)()
{
  return static DynamicTypeSize.== infix(_:_:)();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t DynamicTypeSize.init(_:)()
{
  return DynamicTypeSize.init(_:)();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t MenuPickerStyle.init()()
{
  return MenuPickerStyle.init()();
}

uint64_t type metadata accessor for MenuPickerStyle()
{
  return type metadata accessor for MenuPickerStyle();
}

uint64_t ModifiedContent<>.accessibilityLabel<A>(_:)()
{
  return ModifiedContent<>.accessibilityLabel<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityValue<A>(_:)()
{
  return ModifiedContent<>.accessibilityValue<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityAction(_:_:)()
{
  return ModifiedContent<>.accessibilityAction(_:_:)();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityIdentifier(_:)()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t ModifiedContent<>.accessibilityRemoveTraits(_:)()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t NavigationStack.init<>(path:root:)()
{
  return NavigationStack.init<>(path:root:)();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t ScrollViewProxy.scrollTo<A>(_:anchor:)()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t type metadata accessor for ScrollViewProxy()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t type metadata accessor for LegibilityWeight()
{
  return type metadata accessor for LegibilityWeight();
}

uint64_t static PageTabViewStyle.IndexDisplayMode.automatic.getter()
{
  return static PageTabViewStyle.IndexDisplayMode.automatic.getter();
}

uint64_t type metadata accessor for PageTabViewStyle.IndexDisplayMode()
{
  return type metadata accessor for PageTabViewStyle.IndexDisplayMode();
}

uint64_t PageTabViewStyle.init(indexDisplayMode:)()
{
  return PageTabViewStyle.init(indexDisplayMode:)();
}

uint64_t type metadata accessor for PageTabViewStyle()
{
  return type metadata accessor for PageTabViewStyle();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t static RedactionReasons.placeholder.getter()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t type metadata accessor for RedactionReasons()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t ScrollViewReader.init(content:)()
{
  return ScrollViewReader.init(content:)();
}

uint64_t type metadata accessor for ScrollViewReader()
{
  return type metadata accessor for ScrollViewReader();
}

uint64_t TimelineSchedule.paused(_:)()
{
  return TimelineSchedule.paused(_:)();
}

uint64_t WheelPickerStyle.init()()
{
  return WheelPickerStyle.init()();
}

uint64_t type metadata accessor for WheelPickerStyle()
{
  return type metadata accessor for WheelPickerStyle();
}

uint64_t type metadata accessor for _BlendModeEffect()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ButtonBorderShape.roundedRectangle(radius:)()
{
  return static ButtonBorderShape.roundedRectangle(radius:)();
}

uint64_t static ButtonBorderShape.capsule.getter()
{
  return static ButtonBorderShape.capsule.getter();
}

uint64_t type metadata accessor for ButtonBorderShape()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.workoutAnimationStyle.getter()
{
  return EnvironmentValues.workoutAnimationStyle.getter();
}

uint64_t EnvironmentValues.workoutAnimationStyle.setter()
{
  return EnvironmentValues.workoutAnimationStyle.setter();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.controlSize.getter()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.legibilityWeight.getter()
{
  return EnvironmentValues.legibilityWeight.getter();
}

uint64_t EnvironmentValues.legibilityWeight.setter()
{
  return EnvironmentValues.legibilityWeight.setter();
}

uint64_t EnvironmentValues._buttonBorderShape.getter()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t EnvironmentValues.listSectionSpacing.getter()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t EnvironmentValues.listSectionSpacing.setter()
{
  return EnvironmentValues.listSectionSpacing.setter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t EnvironmentValues.symbolRenderingMode.setter()
{
  return EnvironmentValues.symbolRenderingMode.setter();
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

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.openURL.getter()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t EnvironmentValues.openURL.setter()
{
  return EnvironmentValues.openURL.setter();
}

uint64_t EnvironmentValues.calendar.getter()
{
  return EnvironmentValues.calendar.getter();
}

uint64_t EnvironmentValues.calendar.setter()
{
  return EnvironmentValues.calendar.setter();
}

uint64_t EnvironmentValues.editMode.getter()
{
  return EnvironmentValues.editMode.getter();
}

uint64_t EnvironmentValues.editMode.setter()
{
  return EnvironmentValues.editMode.setter();
}

uint64_t EnvironmentValues.textCase.getter()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t EnvironmentValues.textCase.setter()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t SpatialTapGesture.Value.location.getter()
{
  return SpatialTapGesture.Value.location.getter();
}

uint64_t SpatialTapGesture.init<A>(count:coordinateSpace:)()
{
  return SpatialTapGesture.init<A>(count:coordinateSpace:)();
}

uint64_t type metadata accessor for SpatialTapGesture()
{
  return type metadata accessor for SpatialTapGesture();
}

uint64_t static VerticalAlignment.lastTextBaseline.getter()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.bottom.getter()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t VerticalAlignment.init(_:)()
{
  return VerticalAlignment.init(_:)();
}

uint64_t IconOnlyLabelStyle.init()()
{
  return IconOnlyLabelStyle.init()();
}

uint64_t type metadata accessor for IconOnlyLabelStyle()
{
  return type metadata accessor for IconOnlyLabelStyle();
}

uint64_t static ListSectionSpacing.custom(_:)()
{
  return static ListSectionSpacing.custom(_:)();
}

uint64_t type metadata accessor for ListSectionSpacing()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
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

uint64_t static PresentationDetent.== infix(_:_:)()
{
  return static PresentationDetent.== infix(_:_:)();
}

uint64_t static PresentationDetent.fraction(_:)()
{
  return static PresentationDetent.fraction(_:)();
}

uint64_t type metadata accessor for PresentationDetent()
{
  return type metadata accessor for PresentationDetent();
}

uint64_t static RoundedCornerStyle.== infix(_:_:)()
{
  return static RoundedCornerStyle.== infix(_:_:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.isImage.getter()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t static AccessibilityTraits.isButton.getter()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t HorizontalAlignment.init(_:)()
{
  return HorizontalAlignment.init(_:)();
}

uint64_t static SymbolRenderingMode.monochrome.getter()
{
  return static SymbolRenderingMode.monochrome.getter();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t static SymbolRenderingMode.palette.getter()
{
  return static SymbolRenderingMode.palette.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t dispatch thunk of UIHostingController.rootView.getter()
{
  return dispatch thunk of UIHostingController.rootView.getter();
}

uint64_t dispatch thunk of UIHostingController.rootView.setter()
{
  return dispatch thunk of UIHostingController.rootView.setter();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t type metadata accessor for LocalCoordinateSpace()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t static ScrollBounceBehavior.basedOnSize.getter()
{
  return static ScrollBounceBehavior.basedOnSize.getter();
}

uint64_t type metadata accessor for ScrollBounceBehavior()
{
  return type metadata accessor for ScrollBounceBehavior();
}

uint64_t static ScrollTargetBehavior._makeInputs(_:inputs:)()
{
  return static ScrollTargetBehavior._makeInputs(_:inputs:)();
}

uint64_t ScrollTargetBehavior._updateEnvironment(_:context:)()
{
  return ScrollTargetBehavior._updateEnvironment(_:context:)();
}

uint64_t SegmentedPickerStyle.init()()
{
  return SegmentedPickerStyle.init()();
}

uint64_t type metadata accessor for SegmentedPickerStyle()
{
  return type metadata accessor for SegmentedPickerStyle();
}

uint64_t static ToolbarItemPlacement.topBarLeading.getter()
{
  return static ToolbarItemPlacement.topBarLeading.getter();
}

uint64_t static ToolbarItemPlacement.topBarTrailing.getter()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t static ToolbarItemPlacement.cancellationAction.getter()
{
  return static ToolbarItemPlacement.cancellationAction.getter();
}

uint64_t static ToolbarItemPlacement.confirmationAction.getter()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t static ToolbarItemPlacement.principal.getter()
{
  return static ToolbarItemPlacement.principal.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t type metadata accessor for GlobalCoordinateSpace()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t InsetGroupedListStyle.init()()
{
  return InsetGroupedListStyle.init()();
}

uint64_t type metadata accessor for InsetGroupedListStyle()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ToolbarContentBuilder.buildIf<A>(_:)()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.tertiary.getter()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t UIHostingConfiguration.margins(_:_:)()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t UIHostingConfiguration<>.init(content:)()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t static AccessibilityActionKind.default.getter()
{
  return static AccessibilityActionKind.default.getter();
}

uint64_t type metadata accessor for AccessibilityActionKind()
{
  return type metadata accessor for AccessibilityActionKind();
}

uint64_t static CoordinateSpaceProtocol<>.local.getter()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t static CoordinateSpaceProtocol<>.global.getter()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t DelayedLongPressGesture.init(minimumDuration:maximumDistance:)()
{
  return DelayedLongPressGesture.init(minimumDuration:maximumDistance:)();
}

uint64_t type metadata accessor for DelayedLongPressGesture()
{
  return type metadata accessor for DelayedLongPressGesture();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Icon()
{
  return type metadata accessor for LabelStyleConfiguration.Icon();
}

uint64_t LabelStyleConfiguration.icon.getter()
{
  return LabelStyleConfiguration.icon.getter();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Title()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t LabelStyleConfiguration.title.getter()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t SafeAreaPaddingModifier.init(edges:insets:)()
{
  return SafeAreaPaddingModifier.init(edges:insets:)();
}

uint64_t type metadata accessor for SafeAreaPaddingModifier()
{
  return type metadata accessor for SafeAreaPaddingModifier();
}

uint64_t static ToolbarTitleDisplayMode.inline.getter()
{
  return static ToolbarTitleDisplayMode.inline.getter();
}

uint64_t type metadata accessor for ToolbarTitleDisplayMode()
{
  return type metadata accessor for ToolbarTitleDisplayMode();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t PeriodicTimelineSchedule.init(from:by:)()
{
  return PeriodicTimelineSchedule.init(from:by:)();
}

uint64_t type metadata accessor for PeriodicTimelineSchedule()
{
  return type metadata accessor for PeriodicTimelineSchedule();
}

uint64_t CircularProgressViewStyle.init(tint:)()
{
  return CircularProgressViewStyle.init(tint:)();
}

uint64_t type metadata accessor for CircularProgressViewStyle()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t static ScrollIndicatorVisibility.never.getter()
{
  return static ScrollIndicatorVisibility.never.getter();
}

uint64_t static ScrollIndicatorVisibility.hidden.getter()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t type metadata accessor for ScrollIndicatorVisibility()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t static AccessibilityChildBehavior.contain.getter()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t PagingScrollTargetBehavior.init()()
{
  return PagingScrollTargetBehavior.init()();
}

uint64_t type metadata accessor for PagingScrollTargetBehavior()
{
  return type metadata accessor for PagingScrollTargetBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

Swift::Void __swiftcall AXChartDescriptorRepresentable.updateChartDescriptor(_:)(AXChartDescriptor a1)
{
}

uint64_t static PresentationContentInteraction.scrolls.getter()
{
  return static PresentationContentInteraction.scrolls.getter();
}

uint64_t type metadata accessor for PresentationContentInteraction()
{
  return type metadata accessor for PresentationContentInteraction();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t static PresentationBackgroundInteraction.enabled.getter()
{
  return static PresentationBackgroundInteraction.enabled.getter();
}

uint64_t static PresentationBackgroundInteraction.disabled.getter()
{
  return static PresentationBackgroundInteraction.disabled.getter();
}

uint64_t type metadata accessor for PresentationBackgroundInteraction()
{
  return type metadata accessor for PresentationBackgroundInteraction();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.system(_:weight:)()
{
  return static Font.system(_:weight:)();
}

uint64_t static Font.largeTitle.getter()
{
  return static Font.largeTitle.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t static Font.PrivateDesign.compactRounded.getter()
{
  return static Font.PrivateDesign.compactRounded.getter();
}

uint64_t type metadata accessor for Font.PrivateDesign()
{
  return type metadata accessor for Font.PrivateDesign();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t Font.bold()()
{
  return Font.bold()();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

{
  return static Font.system(_:design:weight:)();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.title3.getter()
{
  return static Font.title3.getter();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t type metadata accessor for Font.Leading()
{
  return type metadata accessor for Font.Leading();
}

uint64_t static Font.callout.getter()
{
  return static Font.callout.getter();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t Font.feature(_:)()
{
  return Font.feature(_:)();
}

uint64_t Font.leading(_:)()
{
  return Font.leading(_:)();
}

uint64_t static Font.caption2.getter()
{
  return static Font.caption2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Font.smallCaps()()
{
  return Font.smallCaps()();
}

uint64_t Font.init(_:)()
{
  return Font.init(_:)();
}

uint64_t Link.init(destination:label:)()
{
  return Link.init(destination:label:)();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Menu.init(onPresentationChanged:content:label:)()
{
  return Menu.init(onPresentationChanged:content:label:)();
}

uint64_t Menu.init(content:label:)()
{
  return Menu.init(content:label:)();
}

uint64_t Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)()
{
  return Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
}

uint64_t Path.init(_:)()
{
  return Path.init(_:)();
}

uint64_t Text.fontDesign(_:)()
{
  return Text.fontDesign(_:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t static Text.+ infix(_:_:)()
{
  return static Text.+ infix(_:_:)();
}

uint64_t type metadata accessor for Text.Case()
{
  return type metadata accessor for Text.Case();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t static Text.Scale.secondary.getter()
{
  return static Text.Scale.secondary.getter();
}

uint64_t type metadata accessor for Text.Scale()
{
  return type metadata accessor for Text.Scale();
}

uint64_t static Text.Sizing.adjustsForOversizedCharacters.getter()
{
  return static Text.Sizing.adjustsForOversizedCharacters.getter();
}

uint64_t type metadata accessor for Text.Sizing()
{
  return type metadata accessor for Text.Sizing();
}

uint64_t Text.kerning(_:)()
{
  return Text.kerning(_:)();
}

uint64_t Text.tracking(_:)()
{
  return Text.tracking(_:)();
}

uint64_t Text.textScale(_:isEnabled:)()
{
  return Text.textScale(_:isEnabled:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.setEntityProvider<A>(_:)()
{
  return View.setEntityProvider<A>(_:)();
}

uint64_t View.appEntity<A>(_:state:)()
{
  return View.appEntity<A>(_:state:)();
}

uint64_t View.isHidden(_:defaultAccessibilityHidden:)()
{
  return View.isHidden(_:defaultAccessibilityHidden:)();
}

uint64_t View.workoutViewStyle(_:)()
{
  return View.workoutViewStyle(_:)();
}

uint64_t View.cornerRadius(_:corners:)()
{
  return View.cornerRadius(_:corners:)();
}

uint64_t View.metricUnitFont()()
{
  return View.metricUnitFont()();
}

uint64_t View.metricValueFont(includesSlashes:smallCaps:)()
{
  return View.metricValueFont(includesSlashes:smallCaps:)();
}

uint64_t View.metricDescriptionFont(multiline:)()
{
  return View.metricDescriptionFont(multiline:)();
}

uint64_t View.workoutAnimationStyle(_:)()
{
  return View.workoutAnimationStyle(_:)();
}

uint64_t View.metricRow(padding:)()
{
  return View.metricRow(padding:)();
}

uint64_t View.chartXAxis<A>(content:)()
{
  return View.chartXAxis<A>(content:)();
}

uint64_t View.chartXAxis(_:)()
{
  return View.chartXAxis(_:)();
}

uint64_t View.chartYAxis<A>(content:)()
{
  return View.chartYAxis<A>(content:)();
}

uint64_t View.chartYAxis(_:)()
{
  return View.chartYAxis(_:)();
}

uint64_t View.chartXScale<A>(domain:type:)()
{
  return View.chartXScale<A>(domain:type:)();
}

uint64_t View.chartYScale<A>(domain:type:)()
{
  return View.chartYScale<A>(domain:type:)();
}

uint64_t View.chartXSelection<A>(value:)()
{
  return View.chartXSelection<A>(value:)();
}

uint64_t View.tabViewStyle<A>(_:)()
{
  return View.tabViewStyle<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.background<A>(_:alignment:)()
{
  return View.background<A>(_:alignment:)();
}

uint64_t View.fontDesign(_:)()
{
  return View.fontDesign(_:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.labelStyle<A>(_:)()
{
  return View.labelStyle<A>(_:)();
}

uint64_t View.textSizing(_:)()
{
  return View.textSizing(_:)();
}

uint64_t View.accentColor(_:)()
{
  return View.accentColor(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.pickerStyle<A>(_:)()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t View.contentShape<A>(_:eoFill:)()
{
  return View.contentShape<A>(_:eoFill:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t View.scenePadding(_:)()
{
  return View.scenePadding(_:)();
}

uint64_t View.accessibility(identifier:)()
{
  return View.accessibility(identifier:)();
}

uint64_t View.accessibility(addTraits:)()
{
  return View.accessibility(addTraits:)();
}

uint64_t View.listRowInsets(_:)()
{
  return View.listRowInsets(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.scrollDisabled(_:)()
{
  return View.scrollDisabled(_:)();
}

uint64_t View.dynamicTypeSize(_:)()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.foregroundStyle<A>(_:)()
{
  return View.foregroundStyle<A>(_:)();
}

uint64_t View.fullScreenCover<A>(isPresented:onDismiss:content:)()
{
  return View.fullScreenCover<A>(isPresented:onDismiss:content:)();
}

uint64_t View.monospacedDigit()()
{
  return View.monospacedDigit()();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View.listRowSeparator(_:edges:)()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t View.scrollIndicators(_:axes:)()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t View.hyphenationFactor(_:)()
{
  return View.hyphenationFactor(_:)();
}

uint64_t View.listRowBackground<A>(_:)()
{
  return View.listRowBackground<A>(_:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.confirmationDialog<A, B, C>(_:isPresented:titleVisibility:actions:message:)()
{
  return View.confirmationDialog<A, B, C>(_:isPresented:titleVisibility:actions:message:)();
}

uint64_t View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:)()
{
  return View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:)();
}

uint64_t View.navigationBarItems<A, B>(leading:trailing:)()
{
  return View.navigationBarItems<A, B>(leading:trailing:)();
}

uint64_t View.navigationBarItems<A>(trailing:)()
{
  return View.navigationBarItems<A>(trailing:)();
}

uint64_t View.navigationBarTitle(_:displayMode:)()
{
  return View.navigationBarTitle(_:displayMode:)();
}

uint64_t View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)()
{
  return View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
}

uint64_t View.accessibilityAction(_:_:)()
{
  return View.accessibilityAction(_:_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.onScrollPhaseChange(_:)()
{
  return View.onScrollPhaseChange(_:)();
}

uint64_t View.presentationDetents(_:selection:)()
{
  return View.presentationDetents(_:selection:)();
}

uint64_t View.simultaneousGesture<A>(_:including:)()
{
  return View.simultaneousGesture<A>(_:including:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.listRowSeparatorTint(_:edges:)()
{
  return View.listRowSeparatorTint(_:edges:)();
}

uint64_t View.listSectionSeparator(_:edges:)()
{
  return View.listSectionSeparator(_:edges:)();
}

uint64_t View.scrollBounceBehavior(_:axes:)()
{
  return View.scrollBounceBehavior(_:axes:)();
}

uint64_t View.scrollTargetBehavior<A>(_:)()
{
  return View.scrollTargetBehavior<A>(_:)();
}

uint64_t View.navigationDestination<A, B>(for:destination:)()
{
  return View.navigationDestination<A, B>(for:destination:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.containerRelativeFrame(_:alignment:)()
{
  return View.containerRelativeFrame(_:alignment:)();
}

uint64_t View.onScrollGeometryChange<A>(for:of:action:)()
{
  return View.onScrollGeometryChange<A>(for:of:action:)();
}

uint64_t View.presentationBackground<A>(_:)()
{
  return View.presentationBackground<A>(_:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.toolbarTitleDisplayMode(_:)()
{
  return View.toolbarTitleDisplayMode(_:)();
}

uint64_t View.onScrollVisibilityChange(threshold:_:)()
{
  return View.onScrollVisibilityChange(threshold:_:)();
}

uint64_t View.accessibilityRemoveTraits(_:)()
{
  return View.accessibilityRemoveTraits(_:)();
}

uint64_t View.interactiveDismissDisabled(_:)()
{
  return View.interactiveDismissDisabled(_:)();
}

uint64_t View.accessibilityChartDescriptor<A>(_:)()
{
  return View.accessibilityChartDescriptor<A>(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.id<A>(_:)()
{
  return View.id<A>(_:)();
}

uint64_t View.presentationContentInteraction(_:)()
{
  return View.presentationContentInteraction(_:)();
}

uint64_t View.presentationBackgroundInteraction(_:)()
{
  return View.presentationBackgroundInteraction(_:)();
}

uint64_t View.bold(_:)()
{
  return View.bold(_:)();
}

uint64_t View.alert<A>(item:content:)()
{
  return View.alert<A>(item:content:)();
}

uint64_t View.frame(width:height:alignment:)()
{
  return View.frame(width:height:alignment:)();
}

uint64_t View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.sheet<A, B>(item:onDismiss:content:)()
{
  return View.sheet<A, B>(item:onDismiss:content:)();
}

uint64_t View.onTest(_:handler:)()
{
  return View.onTest(_:handler:)();
}

uint64_t View.focused(_:)()
{
  return View.focused(_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.overlay<A>(alignment:content:)()
{
  return View.overlay<A>(alignment:content:)();
}

uint64_t View.padding(_:)()
{
  return View.padding(_:)();
}

uint64_t View.padding(_:_:)()
{
  return View.padding(_:_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.toolbar(_:for:)()
{
  return View.toolbar(_:for:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.redacted(reason:)()
{
  return View.redacted(reason:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.menuStyle<A>(_:)()
{
  return View.menuStyle<A>(_:)();
}

uint64_t Alert.init(title:message:dismissButton:)()
{
  return Alert.init(title:message:dismissButton:)();
}

uint64_t Alert.init(title:message:primaryButton:secondaryButton:)()
{
  return Alert.init(title:message:primaryButton:secondaryButton:)();
}

uint64_t static Alert.Button.destructive(_:action:)()
{
  return static Alert.Button.destructive(_:action:)();
}

uint64_t static Alert.Button.cancel(_:action:)()
{
  return static Alert.Button.cancel(_:action:)();
}

uint64_t static Alert.Button.default(_:action:)()
{
  return static Alert.Button.default(_:action:)();
}

uint64_t type metadata accessor for Alert.Button()
{
  return type metadata accessor for Alert.Button();
}

uint64_t Color.cgColor.getter()
{
  return Color.cgColor.getter();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t Color.hex.getter()
{
  return Color.hex.getter();
}

uint64_t Color.init(rgbHex:)()
{
  return Color.init(rgbHex:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.keyTint.getter()
{
  return static Color.keyTint.getter();
}

uint64_t static Color.== infix(_:_:)()
{
  return static Color.== infix(_:_:)();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t Color.hash(into:)()
{
  return Color.hash(into:)();
}

uint64_t static Color.teal.getter()
{
  return static Color.teal.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.green.getter()
{
  return static Color.green.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t Color.gradient.getter()
{
  return Color.gradient.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

{
  return Color.init(_:)();
}

uint64_t Group<A>.init(content:)()
{
  return Group<A>.init(content:)();
}

uint64_t type metadata accessor for Group()
{
  return type metadata accessor for Group();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.scaledToFit(size:)()
{
  return Image.scaledToFit(size:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.renderingMode(_:)()
{
  return Image.renderingMode(_:)();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t type metadata accessor for Image.TemplateRenderingMode()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init(_:systemImage:)()
{
  return Label<>.init(_:systemImage:)();
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

uint64_t type metadata accessor for State()
{
  return type metadata accessor for State();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init<A>(_:role:action:)()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t Button<>.init(_:action:)()
{
  return Button<>.init(_:action:)();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t type metadata accessor for Button()
{
  return type metadata accessor for Button();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t type metadata accessor for IDView()
{
  return type metadata accessor for IDView();
}

uint64_t static Layout._makeLayoutView(root:inputs:body:)()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t Layout.updateCache(_:subviews:)()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t static Layout.layoutProperties.getter()
{
  return static Layout.layoutProperties.getter();
}

uint64_t Layout.spacing(subviews:cache:)()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t Layout<>.makeCache(subviews:)()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t Picker<>.init(_:selection:content:)()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t Picker<>.init<A>(_:selection:content:)()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t Toggle.init(isOn:label:)()
{
  return Toggle.init(isOn:label:)();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t ZStack.init(alignment:content:)()
{
  return ZStack.init(alignment:content:)();
}

uint64_t type metadata accessor for ZStack()
{
  return type metadata accessor for ZStack();
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

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

{
  return ForEach<>.init(_:content:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

{
  return ForEach<>.init(_:id:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
}

uint64_t Gesture.onEnded(_:)()
{
  return Gesture.onEnded(_:)();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Section<>.init(_:content:)()
{
  return Section<>.init(_:content:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.init(header:footer:content:)()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t Section<>.init(content:)()
{
  return Section<>.init(content:)();
}

uint64_t Section<>.init(footer:content:)()
{
  return Section<>.init(footer:content:)();
}

uint64_t type metadata accessor for Section()
{
  return type metadata accessor for Section();
}

uint64_t TabView.init(selection:content:)()
{
  return TabView.init(selection:content:)();
}

uint64_t Bindable.wrappedValue.getter()
{
  return Bindable.wrappedValue.getter();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t type metadata accessor for Bindable()
{
  return type metadata accessor for Bindable();
}

uint64_t type metadata accessor for EditMode()
{
  return type metadata accessor for EditMode();
}

uint64_t Gradient.Stop.init(color:location:)()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t Gradient.init(stops:)()
{
  return Gradient.init(stops:)();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t static Material.thin.getter()
{
  return static Material.thin.getter();
}

uint64_t static Material.ultraThin.getter()
{
  return static Material.ultraThin.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
}

uint64_t static Alignment.topTrailing.getter()
{
  return static Alignment.topTrailing.getter();
}

uint64_t static Alignment.bottomLeading.getter()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t static Alignment.bottomTrailing.getter()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t static Alignment.top.getter()
{
  return static Alignment.top.getter();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t Animation.repeatCount(_:autoreverses:)()
{
  return Animation.repeatCount(_:autoreverses:)();
}

uint64_t Animation.repeatForever(autoreverses:)()
{
  return Animation.repeatForever(autoreverses:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.easeIn(duration:)()
{
  return static Animation.easeIn(duration:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeInOut.getter()
{
  return static Animation.easeInOut.getter();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t Namespace.wrappedValue.getter()
{
  return Namespace.wrappedValue.getter();
}

uint64_t TextField<>.init(_:text:onEditingChanged:onCommit:)()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t TextField<>.init<A>(_:text:prompt:)()
{
  return TextField<>.init<A>(_:text:prompt:)();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.topLeading.getter()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t static UnitPoint.topTrailing.getter()
{
  return static UnitPoint.topTrailing.getter();
}

uint64_t static UnitPoint.bottomLeading.getter()
{
  return static UnitPoint.bottomLeading.getter();
}

uint64_t static UnitPoint.bottomTrailing.getter()
{
  return static UnitPoint.bottomTrailing.getter();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static UnitPoint.trailing.getter()
{
  return static UnitPoint.trailing.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
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

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t static DispatchQoS.utility.getter()
{
  return static DispatchQoS.utility.getter();
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

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t AdaptiveStack.init(type:verticalAlignment:horizontalAlignment:spacing:content:)()
{
  return AdaptiveStack.init(type:verticalAlignment:horizontalAlignment:spacing:content:)();
}

uint64_t type metadata accessor for AdaptiveStackType()
{
  return type metadata accessor for AdaptiveStackType();
}

uint64_t static MindfulnessSessionViewModel.makeMindfulnessSessionViewModels(from:)()
{
  return static MindfulnessSessionViewModel.makeMindfulnessSessionViewModels(from:)();
}

uint64_t dispatch thunk of MindfulnessSessionViewModel.sessionType.getter()
{
  return dispatch thunk of MindfulnessSessionViewModel.sessionType.getter();
}

uint64_t MindfulnessSessionViewModel.sourceRevision.getter()
{
  return MindfulnessSessionViewModel.sourceRevision.getter();
}

uint64_t MindfulnessSessionViewModel.mindfulnessSessions.getter()
{
  return MindfulnessSessionViewModel.mindfulnessSessions.getter();
}

uint64_t MindfulnessSessionViewModel.uuid.getter()
{
  return MindfulnessSessionViewModel.uuid.getter();
}

uint64_t MindfulnessSessionViewModel.init(uuid:startDate:endDate:duration:metadata:sourceRevision:mindfulnessSessions:)()
{
  return MindfulnessSessionViewModel.init(uuid:startDate:endDate:duration:metadata:sourceRevision:mindfulnessSessions:)();
}

uint64_t MindfulnessSessionViewModel.endDate.getter()
{
  return MindfulnessSessionViewModel.endDate.getter();
}

uint64_t MindfulnessSessionViewModel.duration.getter()
{
  return MindfulnessSessionViewModel.duration.getter();
}

uint64_t MindfulnessSessionViewModel.metadata.getter()
{
  return MindfulnessSessionViewModel.metadata.getter();
}

uint64_t MindfulnessSessionViewModel.startDate.getter()
{
  return MindfulnessSessionViewModel.startDate.getter();
}

uint64_t type metadata accessor for MindfulnessSessionViewModel()
{
  return type metadata accessor for MindfulnessSessionViewModel();
}

uint64_t FIUIRelativeDateTimeFormatter.localizedString(for:relativeTo:)()
{
  return FIUIRelativeDateTimeFormatter.localizedString(for:relativeTo:)();
}

uint64_t FIUIRelativeDateTimeFormatter.localizedDayString(for:)()
{
  return FIUIRelativeDateTimeFormatter.localizedDayString(for:)();
}

uint64_t FIUIRelativeDateTimeFormatter.init(calendar:)()
{
  return FIUIRelativeDateTimeFormatter.init(calendar:)();
}

uint64_t type metadata accessor for FIUIRelativeDateTimeFormatter()
{
  return type metadata accessor for FIUIRelativeDateTimeFormatter();
}

uint64_t static MindfulnessSessionDataCalculator.endingHeartRate(for:healthStore:completion:)()
{
  return static MindfulnessSessionDataCalculator.endingHeartRate(for:healthStore:completion:)();
}

uint64_t static HKSamplePredicate.categorySample(type:predicate:)()
{
  return static HKSamplePredicate.categorySample(type:predicate:)();
}

uint64_t static HKSamplePredicate.quantitySample(type:predicate:)()
{
  return static HKSamplePredicate.quantitySample(type:predicate:)();
}

uint64_t static HKSamplePredicate.sample(type:predicate:)()
{
  return static HKSamplePredicate.sample(type:predicate:)();
}

uint64_t static HKSamplePredicate.workout(_:)()
{
  return static HKSamplePredicate.workout(_:)();
}

uint64_t HKSampleQueryDescriptor.init(predicates:sortDescriptors:limit:)()
{
  return HKSampleQueryDescriptor.init(predicates:sortDescriptors:limit:)();
}

uint64_t DayIndex.init(integerLiteral:)()
{
  return DayIndex.init(integerLiteral:)();
}

uint64_t static DayIndex.+ infix(_:_:)()
{
  return static DayIndex.+ infix(_:_:)();
}

uint64_t static DayIndex.- infix(_:_:)()
{
  return static DayIndex.- infix(_:_:)();
}

{
  return static DayIndex.- infix(_:_:)();
}

uint64_t DayIndex.init(date:calendar:)()
{
  return DayIndex.init(date:calendar:)();
}

uint64_t DayIndex.value.getter()
{
  return DayIndex.value.getter();
}

uint64_t DayIndex.startDate(in:)()
{
  return DayIndex.startDate(in:)();
}

uint64_t type metadata accessor for DayIndex()
{
  return type metadata accessor for DayIndex();
}

uint64_t ScalarDictionary.init()()
{
  return ScalarDictionary.init()();
}

uint64_t type metadata accessor for ScalarDictionary()
{
  return type metadata accessor for ScalarDictionary();
}

uint64_t ImpressionMetrics.ID.init(parent:element:index:)()
{
  return ImpressionMetrics.ID.init(parent:element:index:)();
}

uint64_t ImpressionMetrics.ID.element.getter()
{
  return ImpressionMetrics.ID.element.getter();
}

uint64_t type metadata accessor for ImpressionMetrics.ID()
{
  return type metadata accessor for ImpressionMetrics.ID();
}

uint64_t ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)()
{
  return ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)();
}

uint64_t ImpressionMetrics.id.getter()
{
  return ImpressionMetrics.id.getter();
}

uint64_t ImpressionMetrics.init(parentId:elementId:name:clickElement:index:idType:additionalFields:custom:)()
{
  return ImpressionMetrics.init(parentId:elementId:name:clickElement:index:idType:additionalFields:custom:)();
}

uint64_t type metadata accessor for ImpressionMetrics()
{
  return type metadata accessor for ImpressionMetrics();
}

uint64_t ImpressionsCalculator.addElement(_:at:)()
{
  return ImpressionsCalculator.addElement(_:at:)();
}

uint64_t ImpressionsCalculator.viewBounds.setter()
{
  return ImpressionsCalculator.viewBounds.setter();
}

uint64_t static ImpressionsCalculator.Configuration.half.getter()
{
  return static ImpressionsCalculator.Configuration.half.getter();
}

uint64_t type metadata accessor for ImpressionsCalculator.Configuration()
{
  return type metadata accessor for ImpressionsCalculator.Configuration();
}

uint64_t ImpressionsCalculator.__allocating_init(configuration:tracker:)()
{
  return ImpressionsCalculator.__allocating_init(configuration:tracker:)();
}

uint64_t ImpressionsCalculator.removeElement(_:)()
{
  return ImpressionsCalculator.removeElement(_:)();
}

Swift::Void __swiftcall ImpressionsCalculator.removeAllElements()()
{
}

uint64_t type metadata accessor for ImpressionsCalculator()
{
  return type metadata accessor for ImpressionsCalculator();
}

uint64_t BasicImpressionsTracker.consumeImpressions(in:on:)()
{
  return BasicImpressionsTracker.consumeImpressions(in:on:)();
}

uint64_t BasicImpressionsTracker.elementDidEnterView(_:on:)()
{
  return BasicImpressionsTracker.elementDidEnterView(_:on:)();
}

uint64_t BasicImpressionsTracker.__allocating_init(threshold:)()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)();
}

uint64_t type metadata accessor for BasicImpressionsTracker()
{
  return type metadata accessor for BasicImpressionsTracker();
}

uint64_t type metadata accessor for ImpressionsTrackerFormat()
{
  return type metadata accessor for ImpressionsTrackerFormat();
}

uint64_t dispatch thunk of AccountButton.updateContact(_:)()
{
  return dispatch thunk of AccountButton.updateContact(_:)();
}

uint64_t type metadata accessor for AccountButton()
{
  return type metadata accessor for AccountButton();
}

uint64_t AvatarSettings.contact.getter()
{
  return AvatarSettings.contact.getter();
}

uint64_t type metadata accessor for AvatarSettings()
{
  return type metadata accessor for AvatarSettings();
}

uint64_t type metadata accessor for NavigationError()
{
  return type metadata accessor for NavigationError();
}

uint64_t type metadata accessor for NavigationIntent()
{
  return type metadata accessor for NavigationIntent();
}

uint64_t type metadata accessor for NavigationSource()
{
  return type metadata accessor for NavigationSource();
}

uint64_t type metadata accessor for AppActiveOccurred()
{
  return type metadata accessor for AppActiveOccurred();
}

uint64_t NavigationRequest.isTrainerTipsGalleryRequest.getter()
{
  return NavigationRequest.isTrainerTipsGalleryRequest.getter();
}

uint64_t NavigationRequest.init(resource:intent:source:routingBehavior:priority:annotation:)()
{
  return NavigationRequest.init(resource:intent:source:routingBehavior:priority:annotation:)();
}

uint64_t type metadata accessor for NavigationRequest()
{
  return type metadata accessor for NavigationRequest();
}

uint64_t type metadata accessor for NavigationPriority()
{
  return type metadata accessor for NavigationPriority();
}

uint64_t type metadata accessor for NavigationResource()
{
  return type metadata accessor for NavigationResource();
}

uint64_t dispatch thunk of SummaryBurnBarView.updateViewModel(_:)()
{
  return dispatch thunk of SummaryBurnBarView.updateViewModel(_:)();
}

uint64_t SummaryBurnBarView.init(workoutActivityType:stringBuilder:)()
{
  return SummaryBurnBarView.init(workoutActivityType:stringBuilder:)();
}

uint64_t type metadata accessor for SummaryBurnBarView()
{
  return type metadata accessor for SummaryBurnBarView();
}

uint64_t dispatch thunk of CatalogTipPlainView.prepareForReuse()()
{
  return dispatch thunk of CatalogTipPlainView.prepareForReuse()();
}

uint64_t dispatch thunk of CatalogTipPlainView.delegate.setter()
{
  return dispatch thunk of CatalogTipPlainView.delegate.setter();
}

uint64_t dispatch thunk of CatalogTipPlainView.configure(attributedTagStrings:artwork:artworkCropCode:)()
{
  return dispatch thunk of CatalogTipPlainView.configure(attributedTagStrings:artwork:artworkCropCode:)();
}

uint64_t type metadata accessor for CatalogTipPlainView()
{
  return type metadata accessor for CatalogTipPlainView();
}

uint64_t static NavigationConstants.sharingURLScheme.getter()
{
  return static NavigationConstants.sharingURLScheme.getter();
}

uint64_t static NavigationConstants.secureSharingURLScheme.getter()
{
  return static NavigationConstants.secureSharingURLScheme.getter();
}

uint64_t static NavigationConstants.host.getter()
{
  return static NavigationConstants.host.getter();
}

uint64_t static NavigationAnnotation.tabReselection.getter()
{
  return static NavigationAnnotation.tabReselection.getter();
}

uint64_t static NavigationAnnotation.external.getter()
{
  return static NavigationAnnotation.external.getter();
}

uint64_t static NavigationAnnotation.appLaunch.getter()
{
  return static NavigationAnnotation.appLaunch.getter();
}

uint64_t static NavigationAnnotation.tabSwitch.getter()
{
  return static NavigationAnnotation.tabSwitch.getter();
}

uint64_t type metadata accessor for NavigationAnnotation()
{
  return type metadata accessor for NavigationAnnotation();
}

uint64_t SummaryStringBuilder.init(unitPreferencesProvider:)()
{
  return SummaryStringBuilder.init(unitPreferencesProvider:)();
}

uint64_t type metadata accessor for SummaryStringBuilder()
{
  return type metadata accessor for SummaryStringBuilder();
}

uint64_t AccountViewController.init(dependencies:fitnessSettingsProvider:)()
{
  return AccountViewController.init(dependencies:fitnessSettingsProvider:)();
}

uint64_t type metadata accessor for AccountViewController()
{
  return type metadata accessor for AccountViewController();
}

uint64_t type metadata accessor for AvatarSettingsChanged()
{
  return type metadata accessor for AvatarSettingsChanged();
}

uint64_t type metadata accessor for SessionViewController()
{
  return type metadata accessor for SessionViewController();
}

uint64_t dispatch thunk of BrowsingViewController.reportBrowsingBeganEvent()()
{
  return dispatch thunk of BrowsingViewController.reportBrowsingBeganEvent()();
}

uint64_t BrowsingViewController.init(dependencies:fitnessSettingsProvider:)()
{
  return BrowsingViewController.init(dependencies:fitnessSettingsProvider:)();
}

uint64_t BrowsingViewController.navigateToURL(_:annotation:)()
{
  return BrowsingViewController.navigateToURL(_:annotation:)();
}

uint64_t BrowsingViewController.navigateToRequest(_:)()
{
  return BrowsingViewController.navigateToRequest(_:)();
}

uint64_t dispatch thunk of BrowsingViewController.reportTabSelectedEvent()()
{
  return dispatch thunk of BrowsingViewController.reportTabSelectedEvent()();
}

uint64_t type metadata accessor for BrowsingViewController()
{
  return type metadata accessor for BrowsingViewController();
}

uint64_t CatalogTipDataProvider.init(dependencies:)()
{
  return CatalogTipDataProvider.init(dependencies:)();
}

uint64_t dispatch thunk of CatalogTipDataProvider.activate()()
{
  return dispatch thunk of CatalogTipDataProvider.activate()();
}

uint64_t dispatch thunk of CatalogTipDataProvider.delegate.setter()
{
  return dispatch thunk of CatalogTipDataProvider.delegate.setter();
}

uint64_t type metadata accessor for CatalogTipDataProvider()
{
  return type metadata accessor for CatalogTipDataProvider();
}

uint64_t static CatalogTipPlayerOptions.catalogSync.getter()
{
  return static CatalogTipPlayerOptions.catalogSync.getter();
}

uint64_t static CatalogTipPlayerOptions.summary.getter()
{
  return static CatalogTipPlayerOptions.summary.getter();
}

uint64_t type metadata accessor for CatalogTipPlayerOptions()
{
  return type metadata accessor for CatalogTipPlayerOptions();
}

uint64_t CatalogTipPlayerPresenter.__allocating_init(dependencies:metricTopicRoutingBehavior:options:pageContext:streamingArtwork:streamingArtworkCropCode:streamingSubtitle:streamingTitle:streamingURL:summaryNavigationHandlers:tipIdentifier:)()
{
  return CatalogTipPlayerPresenter.__allocating_init(dependencies:metricTopicRoutingBehavior:options:pageContext:streamingArtwork:streamingArtworkCropCode:streamingSubtitle:streamingTitle:streamingURL:summaryNavigationHandlers:tipIdentifier:)();
}

uint64_t type metadata accessor for CatalogTipPlayerPresenter()
{
  return type metadata accessor for CatalogTipPlayerPresenter();
}

uint64_t type metadata accessor for NavigationRoutingBehavior()
{
  return type metadata accessor for NavigationRoutingBehavior();
}

uint64_t type metadata accessor for WorkoutNavigationResource()
{
  return type metadata accessor for WorkoutNavigationResource();
}

uint64_t dispatch thunk of AvatarSettingsCoordinating.fetchAvatarSettings()()
{
  return dispatch thunk of AvatarSettingsCoordinating.fetchAvatarSettings()();
}

uint64_t MetricSceneLifecycleTracker.init(dependencies:)()
{
  return MetricSceneLifecycleTracker.init(dependencies:)();
}

uint64_t type metadata accessor for MetricSceneLifecycleTracker()
{
  return type metadata accessor for MetricSceneLifecycleTracker();
}

uint64_t type metadata accessor for NavigationRootResourceState()
{
  return type metadata accessor for NavigationRootResourceState();
}

uint64_t SummaryBannerActionPresenter.init(dependencies:placement:)()
{
  return SummaryBannerActionPresenter.init(dependencies:placement:)();
}

uint64_t dispatch thunk of SummaryBannerActionPresenter.onNavigateToURLAction.setter()
{
  return dispatch thunk of SummaryBannerActionPresenter.onNavigateToURLAction.setter();
}

uint64_t type metadata accessor for SummaryBannerActionPresenter()
{
  return type metadata accessor for SummaryBannerActionPresenter();
}

uint64_t AccountFitnessSettingsChanged.init()()
{
  return AccountFitnessSettingsChanged.init()();
}

uint64_t type metadata accessor for AccountFitnessSettingsChanged()
{
  return type metadata accessor for AccountFitnessSettingsChanged();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportDidSelectTab()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportDidSelectTab()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportDefaultLaunch()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportDefaultLaunch()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportDidDisconnect()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportDidDisconnect()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportDidDeselectTab()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportDidDeselectTab()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportDidBecomeActive()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportDidBecomeActive()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportOpenURLContexts()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportOpenURLContexts()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportDidEnterBackground()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportDidEnterBackground()();
}

uint64_t dispatch thunk of MetricSceneLifecycleReporting.reportContinueUserActivity()()
{
  return dispatch thunk of MetricSceneLifecycleReporting.reportContinueUserActivity()();
}

uint64_t SummaryBurnBarMetricViewModel.init(scoreSummary:showBurnBar:titleText:subtitleText:)()
{
  return SummaryBurnBarMetricViewModel.init(scoreSummary:showBurnBar:titleText:subtitleText:)();
}

uint64_t type metadata accessor for SummaryBurnBarMetricViewModel()
{
  return type metadata accessor for SummaryBurnBarMetricViewModel();
}

uint64_t CatalogTipPlayerViewController.init(presenter:)()
{
  return CatalogTipPlayerViewController.init(presenter:)();
}

uint64_t type metadata accessor for CatalogTipPlayerViewController()
{
  return type metadata accessor for CatalogTipPlayerViewController();
}

uint64_t dispatch thunk of AccountFitnessSettingsProviding.makeUnitsViewController()()
{
  return dispatch thunk of AccountFitnessSettingsProviding.makeUnitsViewController()();
}

uint64_t dispatch thunk of AccountFitnessSettingsProviding.makeChangeGoalsViewController()()
{
  return dispatch thunk of AccountFitnessSettingsProviding.makeChangeGoalsViewController()();
}

uint64_t MarketingPaletteBannerPresenter.init(dependencies:placement:)()
{
  return MarketingPaletteBannerPresenter.init(dependencies:placement:)();
}

uint64_t dispatch thunk of MarketingPaletteBannerPresenter.display.setter()
{
  return dispatch thunk of MarketingPaletteBannerPresenter.display.setter();
}

uint64_t dispatch thunk of MarketingPaletteBannerPresenter.activate()()
{
  return dispatch thunk of MarketingPaletteBannerPresenter.activate()();
}

uint64_t dispatch thunk of MarketingPaletteBannerPresenter.onAppear()()
{
  return dispatch thunk of MarketingPaletteBannerPresenter.onAppear()();
}

uint64_t type metadata accessor for MarketingPaletteBannerPresenter()
{
  return type metadata accessor for MarketingPaletteBannerPresenter();
}

uint64_t static ShelfLockupAttributedTagStrings.== infix(_:_:)()
{
  return static ShelfLockupAttributedTagStrings.== infix(_:_:)();
}

uint64_t ShelfLockupAttributedTagStrings.title.getter()
{
  return ShelfLockupAttributedTagStrings.title.getter();
}

uint64_t ShelfLockupAttributedTagStrings.detail.getter()
{
  return ShelfLockupAttributedTagStrings.detail.getter();
}

uint64_t type metadata accessor for ShelfLockupAttributedTagStrings()
{
  return type metadata accessor for ShelfLockupAttributedTagStrings();
}

uint64_t MarketingPaletteBannerDisplaying<>.removeMarketingPaletteBanner()()
{
  return MarketingPaletteBannerDisplaying<>.removeMarketingPaletteBanner()();
}

uint64_t CompletedWorkoutShareItemProvider.init(dependencies:unitPreferencesProvider:)()
{
  return CompletedWorkoutShareItemProvider.init(dependencies:unitPreferencesProvider:)();
}

uint64_t CompletedWorkoutShareItemProvider.activityItems(workout:)()
{
  return CompletedWorkoutShareItemProvider.activityItems(workout:)();
}

uint64_t type metadata accessor for CompletedWorkoutShareItemProvider()
{
  return type metadata accessor for CompletedWorkoutShareItemProvider();
}

uint64_t DiscoverySheetPrivacyAcknowledged.init()()
{
  return DiscoverySheetPrivacyAcknowledged.init()();
}

uint64_t type metadata accessor for DiscoverySheetPrivacyAcknowledged()
{
  return type metadata accessor for DiscoverySheetPrivacyAcknowledged();
}

uint64_t NotificationConsentViewController.__allocating_init(contentAvailability:)()
{
  return NotificationConsentViewController.__allocating_init(contentAvailability:)();
}

uint64_t NotificationConsentViewController.continueButtonHandler.setter()
{
  return NotificationConsentViewController.continueButtonHandler.setter();
}

uint64_t type metadata accessor for NotificationConsentViewController()
{
  return type metadata accessor for NotificationConsentViewController();
}

uint64_t NotificationSettingsViewController.init(dependencies:)()
{
  return NotificationSettingsViewController.init(dependencies:)();
}

uint64_t type metadata accessor for NotificationSettingsViewController()
{
  return type metadata accessor for NotificationSettingsViewController();
}

uint64_t CatalogTipSummaryNavigationHandlers.init(onLearnMoreTapped:onSeeMoreTipsTapped:)()
{
  return CatalogTipSummaryNavigationHandlers.init(onLearnMoreTapped:onSeeMoreTipsTapped:)();
}

uint64_t type metadata accessor for CatalogTipSummaryNavigationHandlers()
{
  return type metadata accessor for CatalogTipSummaryNavigationHandlers();
}

uint64_t GuestPairingNotificationCoordinator.init(userNotificationCenter:)()
{
  return GuestPairingNotificationCoordinator.init(userNotificationCenter:)();
}

uint64_t dispatch thunk of GuestPairingNotificationCoordinator.post()()
{
  return dispatch thunk of GuestPairingNotificationCoordinator.post()();
}

uint64_t dispatch thunk of GuestPairingNotificationCoordinator.remove()()
{
  return dispatch thunk of GuestPairingNotificationCoordinator.remove()();
}

uint64_t type metadata accessor for GuestPairingNotificationCoordinator()
{
  return type metadata accessor for GuestPairingNotificationCoordinator();
}

uint64_t WeatherConditionIcon.name.getter()
{
  return WeatherConditionIcon.name.getter();
}

uint64_t type metadata accessor for WeatherConditionIcon()
{
  return type metadata accessor for WeatherConditionIcon();
}

uint64_t type metadata accessor for WidgetRenderingMode()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t dispatch thunk of WidgetCenter.reloadAllTimelines()()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t static WidgetCenter.shared.getter()
{
  return static WidgetCenter.shared.getter();
}

uint64_t type metadata accessor for WidgetCenter()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t RaceCompleteRaceTimeMetricView.init(raceTime:didWinRace:)()
{
  return RaceCompleteRaceTimeMetricView.init(raceTime:didWinRace:)();
}

uint64_t type metadata accessor for RaceCompleteRaceTimeMetricView()
{
  return type metadata accessor for RaceCompleteRaceTimeMetricView();
}

uint64_t AnimatedWorkoutGlyph.init(activityType:iconSize:animated:)()
{
  return AnimatedWorkoutGlyph.init(activityType:iconSize:animated:)();
}

uint64_t type metadata accessor for AnimatedWorkoutGlyph()
{
  return type metadata accessor for AnimatedWorkoutGlyph();
}

uint64_t static WorkoutAnimationStyle.== infix(_:_:)()
{
  return static WorkoutAnimationStyle.== infix(_:_:)();
}

uint64_t type metadata accessor for WorkoutAnimationStyle()
{
  return type metadata accessor for WorkoutAnimationStyle();
}

uint64_t static WorkoutChartProperties.power(unit:)()
{
  return static WorkoutChartProperties.power(unit:)();
}

uint64_t static WorkoutChartProperties.elevation(unit:)()
{
  return static WorkoutChartProperties.elevation(unit:)();
}

uint64_t WorkoutChartProperties.tintColor.getter()
{
  return WorkoutChartProperties.tintColor.getter();
}

uint64_t static WorkoutNotificationFont.multilineTextView(with:lineLimit:)()
{
  return static WorkoutNotificationFont.multilineTextView(with:lineLimit:)();
}

uint64_t WorkoutNotificationView.init(notification:formattingManager:)()
{
  return WorkoutNotificationView.init(notification:formattingManager:)();
}

uint64_t type metadata accessor for WorkoutNotificationView()
{
  return type metadata accessor for WorkoutNotificationView();
}

uint64_t WorkoutConfigurationColors.displayColor.getter()
{
  return WorkoutConfigurationColors.displayColor.getter();
}

uint64_t WorkoutConfigurationColors.gradientEndingColor.getter()
{
  return WorkoutConfigurationColors.gradientEndingColor.getter();
}

uint64_t WorkoutConfigurationColors.gradientStartingColor.getter()
{
  return WorkoutConfigurationColors.gradientStartingColor.getter();
}

uint64_t type metadata accessor for WorkoutConfigurationColors()
{
  return type metadata accessor for WorkoutConfigurationColors();
}

uint64_t WorkoutEffort.highestSubWorkoutEffort.getter()
{
  return WorkoutEffort.highestSubWorkoutEffort.getter();
}

uint64_t WorkoutEffort.needsToAddEffort.getter()
{
  return WorkoutEffort.needsToAddEffort.getter();
}

uint64_t WorkoutEffort.allSubWorkoutsHaveEffort.getter()
{
  return WorkoutEffort.allSubWorkoutsHaveEffort.getter();
}

uint64_t WorkoutEffort.addEffortDescriptionShortened.getter()
{
  return WorkoutEffort.addEffortDescriptionShortened.getter();
}

uint64_t WorkoutEffort.itemHasEffort.getter()
{
  return WorkoutEffort.itemHasEffort.getter();
}

uint64_t WorkoutEffort.effortTextColor.getter()
{
  return WorkoutEffort.effortTextColor.getter();
}

uint64_t WorkoutEffort.effortDescription.getter()
{
  return WorkoutEffort.effortDescription.getter();
}

uint64_t WorkoutEffort.effortSymbolSystemName.getter()
{
  return WorkoutEffort.effortSymbolSystemName.getter();
}

uint64_t WorkoutEffort.allSubWorkoutsAreSkipped.getter()
{
  return WorkoutEffort.allSubWorkoutsAreSkipped.getter();
}

uint64_t WorkoutEffort.effortSymbolRenderingMode.getter()
{
  return WorkoutEffort.effortSymbolRenderingMode.getter();
}

uint64_t WorkoutEffort.init(efforts:isGroupWorkout:)()
{
  return WorkoutEffort.init(efforts:isGroupWorkout:)();
}

uint64_t type metadata accessor for WorkoutEffort()
{
  return type metadata accessor for WorkoutEffort();
}

uint64_t WorkoutTimeView.init(startDate:showSubseconds:workoutStatePublisher:)()
{
  return WorkoutTimeView.init(startDate:showSubseconds:workoutStatePublisher:)();
}

uint64_t type metadata accessor for WorkoutTimeView()
{
  return type metadata accessor for WorkoutTimeView();
}

uint64_t type metadata accessor for WorkoutViewStyle()
{
  return type metadata accessor for WorkoutViewStyle();
}

uint64_t MetricText.init(value:unit:description:stale:includesSlashes:)()
{
  return MetricText.init(value:unit:description:stale:includesSlashes:)();
}

uint64_t type metadata accessor for MetricText()
{
  return type metadata accessor for MetricText();
}

uint64_t DownhillRun.alpineSlope.getter()
{
  return DownhillRun.alpineSlope.getter();
}

uint64_t dispatch thunk of DownhillRun.workoutTime.getter()
{
  return dispatch thunk of DownhillRun.workoutTime.getter();
}

uint64_t DownhillRun.averageSpeed.getter()
{
  return DownhillRun.averageSpeed.getter();
}

uint64_t DownhillRun.maximumSpeed.getter()
{
  return DownhillRun.maximumSpeed.getter();
}

uint64_t dispatch thunk of DownhillRun.averageHeartRate.getter()
{
  return dispatch thunk of DownhillRun.averageHeartRate.getter();
}

uint64_t DownhillRun.elevationAscended.getter()
{
  return DownhillRun.elevationAscended.getter();
}

uint64_t DownhillRun.elevationDescended.getter()
{
  return DownhillRun.elevationDescended.getter();
}

uint64_t dispatch thunk of DownhillRun.distance.getter()
{
  return dispatch thunk of DownhillRun.distance.getter();
}

uint64_t static DownhillRun.supports(activityType:)()
{
  return static DownhillRun.supports(activityType:)();
}

uint64_t type metadata accessor for DownhillRun()
{
  return type metadata accessor for DownhillRun();
}

uint64_t static EffortColors.textColor(exertion:)()
{
  return static EffortColors.textColor(exertion:)();
}

uint64_t static Localization.workoutUILocalizedString(_:feature:)()
{
  return static Localization.workoutUILocalizedString(_:feature:)();
}

uint64_t SessionChart.init(data:chartProperties:faking:)()
{
  return SessionChart.init(data:chartProperties:faking:)();
}

uint64_t type metadata accessor for SessionChart()
{
  return type metadata accessor for SessionChart();
}

uint64_t static DemoUtilities.fetchWorkouts(startingDate:)()
{
  return static DemoUtilities.fetchWorkouts(startingDate:)();
}

uint64_t PaceMetricView.init(formattingManager:metricType:activityType:pace:gpsUnavailable:visualAlertDescription:)()
{
  return PaceMetricView.init(formattingManager:metricType:activityType:pace:gpsUnavailable:visualAlertDescription:)();
}

uint64_t type metadata accessor for PaceMetricView()
{
  return type metadata accessor for PaceMetricView();
}

uint64_t RingDetailView.init(ringType:value:goal:isWheelchairUser:)()
{
  return RingDetailView.init(ringType:value:goal:isWheelchairUser:)();
}

uint64_t type metadata accessor for RingDetailView()
{
  return type metadata accessor for RingDetailView();
}

uint64_t StepDetailView.init(step:formattingManager:compressed:)()
{
  return StepDetailView.init(step:formattingManager:compressed:)();
}

uint64_t type metadata accessor for StepDetailView()
{
  return type metadata accessor for StepDetailView();
}

uint64_t ZoneMetricView.init(zoneViewType:liveZones:value:isStale:)()
{
  return ZoneMetricView.init(zoneViewType:liveZones:value:isStale:)();
}

uint64_t type metadata accessor for ZoneMetricView()
{
  return type metadata accessor for ZoneMetricView();
}

uint64_t EffortMiniGraph.init(effort:)()
{
  return EffortMiniGraph.init(effort:)();
}

uint64_t type metadata accessor for EffortMiniGraph()
{
  return type metadata accessor for EffortMiniGraph();
}

uint64_t static EffortUtilities.sendUpdatedEffortAnalyticsEvent(workout:workoutActivity:perceivedEffortQuantity:estimatedEffortQuantity:)()
{
  return static EffortUtilities.sendUpdatedEffortAnalyticsEvent(workout:workoutActivity:perceivedEffortQuantity:estimatedEffortQuantity:)();
}

uint64_t static EffortUtilities.didUpdateDemoOverrideEffortValues.getter()
{
  return static EffortUtilities.didUpdateDemoOverrideEffortValues.getter();
}

uint64_t EffortUtilities.WorkoutAndActivityKey.init(workout:activity:)()
{
  return EffortUtilities.WorkoutAndActivityKey.init(workout:activity:)();
}

uint64_t type metadata accessor for EffortUtilities.WorkoutAndActivityKey()
{
  return type metadata accessor for EffortUtilities.WorkoutAndActivityKey();
}

uint64_t static EffortUtilities.fetchExertion(forWorkout:healthStore:completion:)()
{
  return static EffortUtilities.fetchExertion(forWorkout:healthStore:completion:)();
}

uint64_t static EffortUtilities.fetchDemoExertion(forWorkout:)()
{
  return static EffortUtilities.fetchDemoExertion(forWorkout:)();
}

uint64_t type metadata accessor for EffortUtilities.OvernightVitalsState()
{
  return type metadata accessor for EffortUtilities.OvernightVitalsState();
}

uint64_t static EffortUtilities.effortSampleCollection(for:)()
{
  return static EffortUtilities.effortSampleCollection(for:)();
}

uint64_t static EffortUtilities.fetchExertionCollection(forWorkout:activity:healthStore:completion:)()
{
  return static EffortUtilities.fetchExertionCollection(forWorkout:activity:healthStore:completion:)();
}

uint64_t static EffortUtilities.sendDidViewTrainingLoadAnalytics(from:)()
{
  return static EffortUtilities.sendDidViewTrainingLoadAnalytics(from:)();
}

uint64_t static EffortUtilities.sendDidDeeplinktoVitalsAnalyticsEvent(source:vitalsState:)()
{
  return static EffortUtilities.sendDidDeeplinktoVitalsAnalyticsEvent(source:vitalsState:)();
}

uint64_t static EffortUtilities.save(quantity:workout:workoutActivity:healthStore:)()
{
  return static EffortUtilities.save(quantity:workout:workoutActivity:healthStore:)();
}

uint64_t static EffortUtilities.save(quantity:workout:healthStore:)()
{
  return static EffortUtilities.save(quantity:workout:healthStore:)();
}

uint64_t type metadata accessor for EffortUtilities()
{
  return type metadata accessor for EffortUtilities();
}

uint64_t ElapsedTimeView.init(elapsedTime:showSubseconds:)()
{
  return ElapsedTimeView.init(elapsedTime:showSubseconds:)();
}

uint64_t type metadata accessor for ElapsedTimeView()
{
  return type metadata accessor for ElapsedTimeView();
}

uint64_t static LayoutUtilities.layoutMetric(compact38:regular42:junior40:senior44:aloeSmall41:aloeBig45:agave49:)()
{
  return static LayoutUtilities.layoutMetric(compact38:regular42:junior40:senior44:aloeSmall41:aloeBig45:agave49:)();
}

uint64_t static LayoutUtilities.layoutMetric(regular42:)()
{
  return static LayoutUtilities.layoutMetric(regular42:)();
}

uint64_t EnergyMetricView.init(energy:energyType:workoutSectionType:formattingManager:)()
{
  return EnergyMetricView.init(energy:energyType:workoutSectionType:formattingManager:)();
}

uint64_t type metadata accessor for EnergyMetricView()
{
  return type metadata accessor for EnergyMetricView();
}

uint64_t BreadcrumbMapView.init(locationPositionPublisher:)()
{
  return BreadcrumbMapView.init(locationPositionPublisher:)();
}

uint64_t type metadata accessor for BreadcrumbMapView()
{
  return type metadata accessor for BreadcrumbMapView();
}

uint64_t DownhillRunsStats.init(downhillRuns:)()
{
  return DownhillRunsStats.init(downhillRuns:)();
}

uint64_t DownhillRunsStats.averageSpeed.getter()
{
  return DownhillRunsStats.averageSpeed.getter();
}

uint64_t DownhillRunsStats.maximumSpeed.getter()
{
  return DownhillRunsStats.maximumSpeed.getter();
}

uint64_t DownhillRunsStats.averageHeartRate.getter()
{
  return DownhillRunsStats.averageHeartRate.getter();
}

uint64_t DownhillRunsStats.elevationAscended.getter()
{
  return DownhillRunsStats.elevationAscended.getter();
}

uint64_t DownhillRunsStats.elevationDescended.getter()
{
  return DownhillRunsStats.elevationDescended.getter();
}

uint64_t DownhillRunsStats.distance.getter()
{
  return DownhillRunsStats.distance.getter();
}

uint64_t DownhillRunsStats.duration.getter()
{
  return DownhillRunsStats.duration.getter();
}

uint64_t DownhillRunsStats.runsCount.getter()
{
  return DownhillRunsStats.runsCount.getter();
}

uint64_t type metadata accessor for DownhillRunsStats()
{
  return type metadata accessor for DownhillRunsStats();
}

uint64_t static MetricViewBuilder.view(metricType:metricPlatterType:formattingManager:activityType:metricsPublisher:)()
{
  return static MetricViewBuilder.view(metricType:metricPlatterType:formattingManager:activityType:metricsPublisher:)();
}

uint64_t PillConfiguration.pillColor.getter()
{
  return PillConfiguration.pillColor.getter();
}

uint64_t type metadata accessor for PillConfiguration()
{
  return type metadata accessor for PillConfiguration();
}

uint64_t TrainingLoadChart.Configuration.init(dayRangeOfData:viewPortDayRange:points:keyDates:)()
{
  return TrainingLoadChart.Configuration.init(dayRangeOfData:viewPortDayRange:points:keyDates:)();
}

uint64_t type metadata accessor for TrainingLoadChart.Configuration()
{
  return type metadata accessor for TrainingLoadChart.Configuration();
}

uint64_t TrainingLoadChart.init(configuration:selectedDay:inSelectionMode:)()
{
  return TrainingLoadChart.init(configuration:selectedDay:inSelectionMode:)();
}

uint64_t type metadata accessor for TrainingLoadChart()
{
  return type metadata accessor for TrainingLoadChart();
}

uint64_t DistanceMetricText.init(distance:formattingManager:distanceType:distanceUnit:description:)()
{
  return DistanceMetricText.init(distance:formattingManager:distanceType:distanceUnit:description:)();
}

uint64_t type metadata accessor for DistanceMetricText()
{
  return type metadata accessor for DistanceMetricText();
}

uint64_t DistanceMetricView.init(distance:formattingManager:distanceType:distanceUnit:)()
{
  return DistanceMetricView.init(distance:formattingManager:distanceType:distanceUnit:)();
}

uint64_t type metadata accessor for DistanceMetricView()
{
  return type metadata accessor for DistanceMetricView();
}

uint64_t static EffortUIController.makeHostingController(shouldEmbedInNavStack:startingEffort:workoutActivityType:shouldShowWorkoutGlyph:showCurrentWorkloadButton:cancel:completion:)()
{
  return static EffortUIController.makeHostingController(shouldEmbedInNavStack:startingEffort:workoutActivityType:shouldShowWorkoutGlyph:showCurrentWorkloadButton:cancel:completion:)();
}

uint64_t type metadata accessor for EffortUIController()
{
  return type metadata accessor for EffortUIController();
}

uint64_t MoveRingDetailView.init(activityRing:isWheelchairUser:formattingManager:)()
{
  return MoveRingDetailView.init(activityRing:isWheelchairUser:formattingManager:)();
}

uint64_t type metadata accessor for MoveRingDetailView()
{
  return type metadata accessor for MoveRingDetailView();
}

uint64_t HeartRateMetricView.init(heartRate:heartRateValueType:isStale:workoutPaused:lowPowerModeAnimationSuspended:)()
{
  return HeartRateMetricView.init(heartRate:heartRateValueType:isStale:workoutPaused:lowPowerModeAnimationSuspended:)();
}

uint64_t type metadata accessor for HeartRateMetricView()
{
  return type metadata accessor for HeartRateMetricView();
}

uint64_t type metadata accessor for LocalizationFeature()
{
  return type metadata accessor for LocalizationFeature();
}

uint64_t TrainingLoadDayView.init(fractionalDifferenceFromAcuteToChronicBaseline:widgetRenderingMode:isLoading:)()
{
  return TrainingLoadDayView.init(fractionalDifferenceFromAcuteToChronicBaseline:widgetRenderingMode:isLoading:)();
}

uint64_t type metadata accessor for TrainingLoadDayView()
{
  return type metadata accessor for TrainingLoadDayView();
}

uint64_t TrainingLoadViewModel.chronologicalTrainingLoadDaySummaries.getter()
{
  return TrainingLoadViewModel.chronologicalTrainingLoadDaySummaries.getter();
}

uint64_t TrainingLoadViewModel.trainingLoadBandForToday.getter()
{
  return TrainingLoadViewModel.trainingLoadBandForToday.getter();
}

uint64_t TrainingLoadViewModel.trainingLoadDaySummaryForToday.getter()
{
  return TrainingLoadViewModel.trainingLoadDaySummaryForToday.getter();
}

uint64_t TrainingLoadViewModel.chartPoints.getter()
{
  return TrainingLoadViewModel.chartPoints.getter();
}

uint64_t TrainingLoadViewModel.loadBandToday()()
{
  return TrainingLoadViewModel.loadBandToday()();
}

Swift::String __swiftcall TrainingLoadViewModel.localizedName()()
{
  uint64_t View = TrainingLoadViewModel.localizedName()();
  result._object = v1;
  result._countAndFlagsBits = View;
  return result;
}

uint64_t TrainingLoadViewModel.loadPercentage(onDay:)()
{
  return TrainingLoadViewModel.loadPercentage(onDay:)();
}

uint64_t TrainingLoadViewModel.loadBandTodayColor()()
{
  return TrainingLoadViewModel.loadBandTodayColor()();
}

Swift::String __swiftcall TrainingLoadViewModel.loadPercentageToday()()
{
  uint64_t View = TrainingLoadViewModel.loadPercentageToday()();
  result._object = v1;
  result._countAndFlagsBits = View;
  return result;
}

uint64_t TrainingLoadViewModel.localizedDescription(onDay:)()
{
  return TrainingLoadViewModel.localizedDescription(onDay:)();
}

Swift::String __swiftcall TrainingLoadViewModel.loadBandTodayLocalizedDescription()()
{
  uint64_t View = TrainingLoadViewModel.loadBandTodayLocalizedDescription()();
  result._object = v1;
  result._countAndFlagsBits = View;
  return result;
}

uint64_t TrainingLoadViewModel.loadBandFlavoredGradientBackground(rotated:)()
{
  return TrainingLoadViewModel.loadBandFlavoredGradientBackground(rotated:)();
}

uint64_t TrainingLoadViewModel.fractionalBaselineDifferenceFromChronicForToday.getter()
{
  return TrainingLoadViewModel.fractionalBaselineDifferenceFromChronicForToday.getter();
}

uint64_t TrainingLoadViewModel.band(onDay:)()
{
  return TrainingLoadViewModel.band(onDay:)();
}

Swift::String __swiftcall TrainingLoadViewModel.loadBandTodayLocalizedLongDescriptionInNonActiveState()()
{
  uint64_t View = TrainingLoadViewModel.loadBandTodayLocalizedLongDescriptionInNonActiveState()();
  result._object = v1;
  result._countAndFlagsBits = View;
  return result;
}

uint64_t TrainingLoadViewModel.formattedFractionalDifferenceFromChronicBaselineForToday.getter()
{
  return TrainingLoadViewModel.formattedFractionalDifferenceFromChronicBaselineForToday.getter();
}

uint64_t TrainingLoadViewModel.color(onDay:)()
{
  return TrainingLoadViewModel.color(onDay:)();
}

uint64_t TrainingLoadViewModel.dataType.getter()
{
  return TrainingLoadViewModel.dataType.getter();
}

uint64_t TrainingLoadViewModel.hasValue(onDay:)()
{
  return TrainingLoadViewModel.hasValue(onDay:)();
}

uint64_t TrainingLoadViewModel.isNoData(onDay:)()
{
  return TrainingLoadViewModel.isNoData(onDay:)();
}

uint64_t TrainingLoadViewModel.isPending(onDay:)()
{
  return TrainingLoadViewModel.isPending(onDay:)();
}

uint64_t type metadata accessor for TrainingLoadViewModel()
{
  return type metadata accessor for TrainingLoadViewModel();
}

uint64_t EffortSampleCollection.init(effortSample:estimatedEffortSample:)()
{
  return EffortSampleCollection.init(effortSample:estimatedEffortSample:)();
}

uint64_t EffortSampleCollection.effortSample.getter()
{
  return EffortSampleCollection.effortSample.getter();
}

uint64_t EffortSampleCollection.estimatedEffortSample.getter()
{
  return EffortSampleCollection.estimatedEffortSample.getter();
}

uint64_t dispatch thunk of EffortSampleCollection.preferredSample.getter()
{
  return dispatch thunk of EffortSampleCollection.preferredSample.getter();
}

uint64_t dispatch thunk of EffortSampleCollection.preferredQuantity.getter()
{
  return dispatch thunk of EffortSampleCollection.preferredQuantity.getter();
}

uint64_t type metadata accessor for EffortSampleCollection()
{
  return type metadata accessor for EffortSampleCollection();
}

uint64_t MetricPlatterConstants.metricMaxHeight.getter()
{
  return MetricPlatterConstants.metricMaxHeight.getter();
}

uint64_t MetricPlatterConstants.heightOfChartLabels.getter()
{
  return MetricPlatterConstants.heightOfChartLabels.getter();
}

uint64_t MetricPlatterConstants.init()()
{
  return MetricPlatterConstants.init()();
}

uint64_t type metadata accessor for MetricPlatterConstants()
{
  return type metadata accessor for MetricPlatterConstants();
}

uint64_t PacerViewConfiguration.init(secondsAheadOfPacer:workoutViewStyle:)()
{
  return PacerViewConfiguration.init(secondsAheadOfPacer:workoutViewStyle:)();
}

uint64_t PacerViewConfiguration.pillConfiguration.getter()
{
  return PacerViewConfiguration.pillConfiguration.getter();
}

uint64_t PacerViewConfiguration.text.getter()
{
  return PacerViewConfiguration.text.getter();
}

uint64_t type metadata accessor for PacerViewConfiguration()
{
  return type metadata accessor for PacerViewConfiguration();
}

uint64_t type metadata accessor for TrainingLoadURLBuilder.Source()
{
  return type metadata accessor for TrainingLoadURLBuilder.Source();
}

uint64_t RaceElevationMetricView.init(racePosition:positionOnRoute:ghostPositionOnRoute:chartProperties:formattingManager:)()
{
  return RaceElevationMetricView.init(racePosition:positionOnRoute:ghostPositionOnRoute:chartProperties:formattingManager:)();
}

uint64_t type metadata accessor for RaceElevationMetricView()
{
  return type metadata accessor for RaceElevationMetricView();
}

uint64_t RaceElevationChartProperties.init(activityType:chartPoints:)()
{
  return RaceElevationChartProperties.init(activityType:chartPoints:)();
}

uint64_t type metadata accessor for RaceElevationChartProperties()
{
  return type metadata accessor for RaceElevationChartProperties();
}

uint64_t dispatch thunk of TrainingLoadViewModelProvider.viewModel(for:)()
{
  return dispatch thunk of TrainingLoadViewModelProvider.viewModel(for:)();
}

uint64_t dispatch thunk of TrainingLoadViewModelProvider.isLoadingWorkoutViewModelForTheFirstTime.getter()
{
  return dispatch thunk of TrainingLoadViewModelProvider.isLoadingWorkoutViewModelForTheFirstTime.getter();
}

uint64_t dispatch thunk of TrainingLoadViewModelProvider.startQuery(isFaking:)()
{
  return dispatch thunk of TrainingLoadViewModelProvider.startQuery(isFaking:)();
}

uint64_t dispatch thunk of TrainingLoadViewModelProvider.viewModels.getter()
{
  return dispatch thunk of TrainingLoadViewModelProvider.viewModels.getter();
}

uint64_t static TrainingLoadViewModelProvider.createDayRange(now:days:gregorianCalendar:)()
{
  return static TrainingLoadViewModelProvider.createDayRange(now:days:gregorianCalendar:)();
}

uint64_t dispatch thunk of TrainingLoadViewModelProvider.isFetchingDataForNewDateRange.getter()
{
  return dispatch thunk of TrainingLoadViewModelProvider.isFetchingDataForNewDateRange.getter();
}

uint64_t TrainingLoadViewModelProvider.__allocating_init(dayRange:healthStore:)()
{
  return TrainingLoadViewModelProvider.__allocating_init(dayRange:healthStore:)();
}

uint64_t dispatch thunk of TrainingLoadViewModelProvider.dayRange.setter()
{
  return dispatch thunk of TrainingLoadViewModelProvider.dayRange.setter();
}

uint64_t type metadata accessor for TrainingLoadViewModelProvider()
{
  return type metadata accessor for TrainingLoadViewModelProvider();
}

uint64_t TrainingLoadWorkoutsAddUpView.init(onNext:)()
{
  return TrainingLoadWorkoutsAddUpView.init(onNext:)();
}

uint64_t type metadata accessor for TrainingLoadWorkoutsAddUpView()
{
  return type metadata accessor for TrainingLoadWorkoutsAddUpView();
}

uint64_t RaceRemainingDistanceMetricView.init(remainingDistance:formattingManager:distanceType:)()
{
  return RaceRemainingDistanceMetricView.init(remainingDistance:formattingManager:distanceType:)();
}

uint64_t type metadata accessor for RaceRemainingDistanceMetricView()
{
  return type metadata accessor for RaceRemainingDistanceMetricView();
}

uint64_t TrainingLoadNewInsightsDailyView.init(onConfirm:)()
{
  return TrainingLoadNewInsightsDailyView.init(onConfirm:)();
}

uint64_t type metadata accessor for TrainingLoadNewInsightsDailyView()
{
  return type metadata accessor for TrainingLoadNewInsightsDailyView();
}

uint64_t RaceSecondsAheadOfGhostMetricView.init(secondsAheadOfGhost:color:formattingManager:didCrossFinishLine:)()
{
  return RaceSecondsAheadOfGhostMetricView.init(secondsAheadOfGhost:color:formattingManager:didCrossFinishLine:)();
}

uint64_t type metadata accessor for RaceSecondsAheadOfGhostMetricView()
{
  return type metadata accessor for RaceSecondsAheadOfGhostMetricView();
}

uint64_t TrainingLoadEffortExplanationView.init(isStandalone:onNext:)()
{
  return TrainingLoadEffortExplanationView.init(isStandalone:onNext:)();
}

uint64_t type metadata accessor for TrainingLoadEffortExplanationView()
{
  return type metadata accessor for TrainingLoadEffortExplanationView();
}

uint64_t PacerRow.init(secondsAheadOfPacer:)()
{
  return PacerRow.init(secondsAheadOfPacer:)();
}

uint64_t type metadata accessor for PacerRow()
{
  return type metadata accessor for PacerRow();
}

uint64_t BinaryFloatingPoint.formatted<A>(_:)()
{
  return BinaryFloatingPoint.formatted<A>(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t MutableCollection.move(fromOffsets:toOffset:)()
{
  return MutableCollection.move(fromOffsets:toOffset:)();
}

uint64_t type metadata accessor for ClosedRange()
{
  return type metadata accessor for ClosedRange();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)();
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

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return String.LocalizationValue.init(_:)();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t String.init(format:locale:arguments:)()
{
  return String.init(format:locale:arguments:)();
}

uint64_t String.init(format:locale:_:)()
{
  return String.init(format:locale:_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String.random()()
{
  return static String.random()();
}

uint64_t String.fitnessUILocalizedString(feature:)()
{
  return String.fitnessUILocalizedString(feature:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.init(_:)()
{
  return String.init(_:)();
}

uint64_t String.UnicodeScalarView.append<A>(contentsOf:)()
{
  return String.UnicodeScalarView.append<A>(contentsOf:)();
}

uint64_t String.UnicodeScalarView.append(_:)()
{
  return String.UnicodeScalarView.append(_:)();
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

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
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

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

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

uint64_t Sequence.sorted<A>(key:)()
{
  return Sequence.sorted<A>(key:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t Sequence<>.joined(separator:)()
{
  return Sequence<>.joined(separator:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
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

uint64_t Array.count.getter()
{
  return Array.count.getter();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array.subscript.getter()
{
  return Array.subscript.getter();
}

uint64_t Bool.init(truncating:)()
{
  return Bool.init(truncating:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

uint64_t static Double.currentMachTimestamp()()
{
  return static Double.currentMachTimestamp()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double._roundSlowPath(_:)()
{
  return Double._roundSlowPath(_:)();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

Swift::Double __swiftcall Double.dynamicStepRoundUp(minValue:)(Swift::Double minValue)
{
  Double.dynamicStepRoundUp(minValue:)(minValue);
  return result;
}

uint64_t Double.smoothedForDisplay.getter()
{
  return Double.smoothedForDisplay.getter();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)Float._bridgeToObjectiveC()();
}

uint64_t static Float._forceBridgeFromObjectiveC(_:result:)()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Float._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Float._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t Int.entityIdentifierString.getter()
{
  return Int.entityIdentifierString.getter();
}

uint64_t Int.init(truncating:)()
{
  return Int.init(truncating:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Int.localizedString.getter()
{
  return Int.localizedString.getter();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return RandomAccessCollection<>.indices.getter();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.distance(from:to:)()
{
  return dispatch thunk of Collection.distance(from:to:)();
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

uint64_t Range.contains(_:)()
{
  return Range.contains(_:)();
}

uint64_t CGColorRef.components.getter()
{
  return CGColorRef.components.getter();
}

uint64_t HKQuantity.formattedAttributedValue(for:unit:)()
{
  return HKQuantity.formattedAttributedValue(for:unit:)();
}

uint64_t NSIndexSet.makeIterator()()
{
  return NSIndexSet.makeIterator()();
}

AXDataPoint __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(Swift::String x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  return (AXDataPoint)AXDataPoint.init(x:y:additionalValues:label:)(x._countAndFlagsBits, x._object, *(void *)&y.is_nil, additionalValues._rawValue, label.value._countAndFlagsBits, label.value._object, *(__n128 *)&y.value);
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t UIStackView.withAlignment(_:)()
{
  return UIStackView.withAlignment(_:)();
}

uint64_t CAShapeLayer.withLineDashPattern(_:)()
{
  return CAShapeLayer.withLineDashPattern(_:)();
}

uint64_t UIEdgeInsets.init(uniform:)()
{
  return UIEdgeInsets.init(uniform:)();
}

uint64_t ARUIRingsView.emptyRings()()
{
  return ARUIRingsView.emptyRings()();
}

uint64_t ARUIRingsView.withRingGroupDiameter(_:)()
{
  return ARUIRingsView.withRingGroupDiameter(_:)();
}

uint64_t ARUIRingsView.withRingGroupThickness(_:)()
{
  return ARUIRingsView.withRingGroupThickness(_:)();
}

uint64_t ARUIRingsView.withRingGroupInterspacing(_:)()
{
  return ARUIRingsView.withRingGroupInterspacing(_:)();
}

uint64_t ARUIRingsView.nilRings(animated:)()
{
  return ARUIRingsView.nilRings(animated:)();
}

uint64_t ASCloudDevice.deviceName.getter()
{
  return ASCloudDevice.deviceName.getter();
}

uint64_t ASCloudDevice.isWithinTimeToLive.getter()
{
  return ASCloudDevice.isWithinTimeToLive.getter();
}

uint64_t ASCloudDevice.isEligibleForMigration.getter()
{
  return ASCloudDevice.isEligibleForMigration.getter();
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

uint64_t AMSBagProtocol.makeNavigationRequest(with:annotation:)()
{
  return AMSBagProtocol.makeNavigationRequest(with:annotation:)();
}

{
  return AMSBagProtocol.makeNavigationRequest(with:annotation:)();
}

{
  return AMSBagProtocol.makeNavigationRequest(with:annotation:)();
}

HKCategoryType __swiftcall HKCategoryType.init(_:)(HKCategoryTypeIdentifier a1)
{
  return (HKCategoryType)HKCategoryType.init(_:)(a1);
}

HKQuantityType __swiftcall HKQuantityType.init(_:)(HKQuantityTypeIdentifier a1)
{
  return (HKQuantityType)HKQuantityType.init(_:)(a1);
}

uint64_t NSUserDefaults.set<A>(_:for:)()
{
  return NSUserDefaults.set<A>(_:for:)();
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(systemItem:primaryAction:menu:)(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(title:image:primaryAction:menu:)(Swift::String_optional title, UIImage_optional image, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(title:image:primaryAction:menu:)(title.value._countAndFlagsBits, title.value._object, image.value.super.isa, *(void *)&image.is_nil, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t CGMutablePathRef.move(to:transform:)()
{
  return CGMutablePathRef.move(to:transform:)();
}

uint64_t CGMutablePathRef.addLine(to:transform:)()
{
  return CGMutablePathRef.addLine(to:transform:)();
}

NSNumber_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HKKeyValueDomain.number(for:)(Swift::String a1)
{
  uint64_t v1 = (objc_class *)HKKeyValueDomain.number(for:)(a1._countAndFlagsBits, a1._object);
  result.value.super.super.Class isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t UICollectionView.CellRegistration.init(handler:)()
{
  return UICollectionView.CellRegistration.init(handler:)();
}

uint64_t type metadata accessor for UICollectionView.CellRegistration()
{
  return type metadata accessor for UICollectionView.CellRegistration();
}

uint64_t UICollectionView.SupplementaryRegistration.init(elementKind:handler:)()
{
  return UICollectionView.SupplementaryRegistration.init(elementKind:handler:)();
}

uint64_t UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
}

uint64_t UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)()
{
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
}

uint64_t AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)()
{
  return AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)();
}

uint64_t HKActivitySummary.activityRings()()
{
  return HKActivitySummary.activityRings()();
}

uint64_t HKWorkoutActivity.heartRateZones.getter()
{
  return HKWorkoutActivity.heartRateZones.getter();
}

uint64_t HKWorkoutActivity.defaultRestingHeartRate.getter()
{
  return HKWorkoutActivity.defaultRestingHeartRate.getter();
}

uint64_t HKWorkoutActivity.elapsedTimeInHeartRateZones.getter()
{
  return HKWorkoutActivity.elapsedTimeInHeartRateZones.getter();
}

uint64_t HKWorkoutActivity.cyclingPowerZonesConfiguration.getter()
{
  return HKWorkoutActivity.cyclingPowerZonesConfiguration.getter();
}

uint64_t HKWorkoutActivity.elapsedTimeInCyclingPowerZones.getter()
{
  return HKWorkoutActivity.elapsedTimeInCyclingPowerZones.getter();
}

uint64_t HKWorkoutActivity.heartRateZonesConfigurationType.getter()
{
  return HKWorkoutActivity.heartRateZonesConfigurationType.getter();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return OS_dispatch_group.wait(timeout:)();
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

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
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

uint64_t static UITraitCollection.withSystemPreferredContentSizeCategory.getter()
{
  return static UITraitCollection.withSystemPreferredContentSizeCategory.getter();
}

uint64_t NSAttributedString.init(_:)()
{
  return NSAttributedString.init(_:)();
}

uint64_t NSLayoutConstraint.priority(_:)()
{
  return NSLayoutConstraint.priority(_:)();
}

uint64_t UIFocusEnvironment.contains(_:)()
{
  return UIFocusEnvironment.contains(_:)();
}

uint64_t _HKWorkoutGoalType.color.getter()
{
  return _HKWorkoutGoalType.color.getter();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t UICollectionViewCell.contentConfiguration.setter()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t HKWorkoutActivityType.description.getter()
{
  return HKWorkoutActivityType.description.getter();
}

uint64_t HKWorkoutActivityType.shortenedAnalyticsKey.getter()
{
  return HKWorkoutActivityType.shortenedAnalyticsKey.getter();
}

uint64_t static NLSessionActivityGoal.makeOpenGoal()()
{
  return static NLSessionActivityGoal.makeOpenGoal()();
}

uint64_t NLSessionActivityGoal.intervalDisplayString(formattingManager:distanceType:)()
{
  return NLSessionActivityGoal.intervalDisplayString(formattingManager:distanceType:)();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t UIContentSizeCategory.isAccessibilityCategory.getter()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t type metadata accessor for FIPauseRingsCoordinator()
{
  return type metadata accessor for FIPauseRingsCoordinator();
}

uint64_t static FIUIWorkoutActivityType.indoorCycle.getter()
{
  return static FIUIWorkoutActivityType.indoorCycle.getter();
}

uint64_t static FIUIWorkoutActivityType.outdoorCycle.getter()
{
  return static FIUIWorkoutActivityType.outdoorCycle.getter();
}

uint64_t static FIUIWorkoutActivityType.msIndoorCycle.getter()
{
  return static FIUIWorkoutActivityType.msIndoorCycle.getter();
}

uint64_t static FIUIWorkoutActivityType.other.getter()
{
  return static FIUIWorkoutActivityType.other.getter();
}

uint64_t static FIUIWorkoutActivityType.indoorRun.getter()
{
  return static FIUIWorkoutActivityType.indoorRun.getter();
}

uint64_t FIUIWorkoutActivityType.supportsElevationAscendedInSummary.getter()
{
  return FIUIWorkoutActivityType.supportsElevationAscendedInSummary.getter();
}

uint64_t FIUIWorkoutActivityType.supportsElevationDescendedInSummary.getter()
{
  return FIUIWorkoutActivityType.supportsElevationDescendedInSummary.getter();
}

uint64_t UICollectionViewListCell.defaultContentConfiguration()()
{
  return UICollectionViewListCell.defaultContentConfiguration()();
}

uint64_t static NSCollectionLayoutSection.list(using:layoutEnvironment:)()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)()
{
  return AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)();
}

uint64_t static UICollectionViewCompositionalLayout.list(using:)()
{
  return static UICollectionViewCompositionalLayout.list(using:)();
}

uint64_t CGRect.centered(in:)()
{
  return CGRect.centered(in:)();
}

uint64_t CGSize.init(uniform:)()
{
  return CGSize.init(uniform:)();
}

__C::CMTime __swiftcall CMTime.init(seconds:preferredTimescale:)(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  Swift::Int64 v2 = CMTime.init(seconds:preferredTimescale:)(*(void *)&preferredTimescale, seconds);
  result.epoch = v4;
  result.timescale = v3;
  result.flags = *(__C::CMTimeFlags *)((char *)&v3 + 4);
  result.value = v2;
  return result;
}

uint64_t HKUnit.measurementSystem.getter()
{
  return HKUnit.measurementSystem.getter();
}

uint64_t static UIFont.systemFont(ofSize:weight:design:)()
{
  return static UIFont.systemFont(ofSize:weight:design:)();
}

uint64_t static UIFont.preferredFont(forTextStyle:design:symbolicTraits:weight:compatibleWith:)()
{
  return static UIFont.preferredFont(forTextStyle:design:symbolicTraits:weight:compatibleWith:)();
}

UIFont __swiftcall UIFont.smallCapsVersion()()
{
  return (UIFont)UIFont.smallCapsVersion()();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t UIView.annotate(with:)()
{
  return UIView.annotate(with:)();
}

uint64_t UIView.autoLayout()()
{
  return UIView.autoLayout()();
}

uint64_t UIView.backgroundColor(_:)()
{
  return UIView.backgroundColor(_:)();
}

uint64_t UIView.withContentMode(_:)()
{
  return UIView.withContentMode(_:)();
}

uint64_t UIView.layerCornerRadius(_:)()
{
  return UIView.layerCornerRadius(_:)();
}

uint64_t UIView.contentHuggingPriority(_:forAxis:)()
{
  return UIView.contentHuggingPriority(_:forAxis:)();
}

uint64_t UIView.userInteractionEnabled(_:)()
{
  return UIView.userInteractionEnabled(_:)();
}

uint64_t UIView.constraintsPinningToEdgesOfView(_:supportingRTL:insets:leadingPriority:trailingPriority:topPriority:bottomPriority:)()
{
  return UIView.constraintsPinningToEdgesOfView(_:supportingRTL:insets:leadingPriority:trailingPriority:topPriority:bottomPriority:)();
}

{
  return UIView.constraintsPinningToEdgesOfView(_:supportingRTL:insets:leadingPriority:trailingPriority:topPriority:bottomPriority:)();
}

uint64_t UIView.contentCompressionResistancePriority(_:forAxis:)()
{
  return UIView.contentCompressionResistancePriority(_:forAxis:)();
}

uint64_t UIView.forAutoLayout()()
{
  return UIView.forAutoLayout()();
}

uint64_t UIView.withUserInteractionEnabled(_:)()
{
  return UIView.withUserInteractionEnabled(_:)();
}

NSValue __swiftcall CGPoint._bridgeToObjectiveC()()
{
  return (NSValue)CGPoint._bridgeToObjectiveC()();
}

UIColor __swiftcall UIColor.init(_colorLiteralRed:green:blue:alpha:)(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return (UIColor)UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

uint64_t static UIColor.keyTint.getter()
{
  return static UIColor.keyTint.getter();
}

UIColor __swiftcall UIColor.init(hex:)(Swift::String hex)
{
  return (UIColor)UIColor.init(hex:)(hex._countAndFlagsBits, hex._object);
}

uint64_t UILabel.textAlignment(_:)()
{
  return UILabel.textAlignment(_:)();
}

uint64_t UILabel.withTextColor(_:)()
{
  return UILabel.withTextColor(_:)();
}

uint64_t UILabel.withLineBreakMode(_:)()
{
  return UILabel.withLineBreakMode(_:)();
}

uint64_t UILabel.withNumberOfLines(_:)()
{
  return UILabel.withNumberOfLines(_:)();
}

uint64_t UILabel.withFont(_:)()
{
  return UILabel.withFont(_:)();
}

NSNumber __swiftcall NSNumber.init(floatLiteral:)(Swift::Double floatLiteral)
{
  return (NSNumber)NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t NSNumber.init(value:)()
{
  return NSNumber.init(value:)();
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

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t NSString.init(format:_:)()
{
  return NSString.init(format:_:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t UIButton.Configuration.preferredSymbolConfigurationForImage.setter()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t UIButton.Configuration.background.modify()
{
  return UIButton.Configuration.background.modify();
}

uint64_t UIButton.Configuration.buttonSize.setter()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t UIButton.Configuration.contentInsets.getter()
{
  return UIButton.Configuration.contentInsets.getter();
}

uint64_t UIButton.Configuration.contentInsets.setter()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t UIButton.Configuration.attributedTitle.setter()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t UIButton.Configuration.baseBackgroundColor.setter()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t type metadata accessor for UIButton.Configuration.Size()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t static UIButton.Configuration.gray()()
{
  return static UIButton.Configuration.gray()();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
}

uint64_t static UIButton.Configuration.filled()()
{
  return static UIButton.Configuration.filled()();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t UIButton.configuration.getter()
{
  return UIButton.configuration.getter();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
}

uint64_t UIButton.withTitleLabelFont(_:)()
{
  return UIButton.withTitleLabelFont(_:)();
}

uint64_t UIButton.withTitleTextColor(_:for:)()
{
  return UIButton.withTitleTextColor(_:for:)();
}

uint64_t UIDevice.isLargeDisplayZoomEnabled.getter()
{
  return UIDevice.isLargeDisplayZoomEnabled.getter();
}

uint64_t _NSRange.init<A, B>(_:in:)()
{
  return _NSRange.init<A, B>(_:in:)();
}

uint64_t CGPathRef.copy(dashingWithPhase:lengths:transform:)()
{
  return CGPathRef.copy(dashingWithPhase:lengths:transform:)();
}

uint64_t CGPathRef.copy(strokingWithWidth:lineCap:lineJoin:miterLimit:transform:)()
{
  return CGPathRef.copy(strokingWithWidth:lineCap:lineJoin:miterLimit:transform:)();
}

uint64_t HKWorkout.heartRateZones.getter()
{
  return HKWorkout.heartRateZones.getter();
}

uint64_t HKWorkout.defaultRestingHeartRate.getter()
{
  return HKWorkout.defaultRestingHeartRate.getter();
}

uint64_t HKWorkout.elapsedTimeInHeartRateZones.getter()
{
  return HKWorkout.elapsedTimeInHeartRateZones.getter();
}

uint64_t HKWorkout.cyclingPowerZonesConfiguration.getter()
{
  return HKWorkout.cyclingPowerZonesConfiguration.getter();
}

uint64_t HKWorkout.elapsedTimeInCyclingPowerZones.getter()
{
  return HKWorkout.elapsedTimeInCyclingPowerZones.getter();
}

uint64_t HKWorkout.heartRateZonesConfigurationType.getter()
{
  return HKWorkout.heartRateZonesConfigurationType.getter();
}

uint64_t HKWorkout.makeDownhillRuns(healthStore:completion:)()
{
  return HKWorkout.makeDownhillRuns(healthStore:completion:)();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t Optional.description.getter()
{
  return Optional.description.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of Strideable.advanced(by:)()
{
  return dispatch thunk of Strideable.advanced(by:)();
}

uint64_t dispatch thunk of Strideable.distance(to:)()
{
  return dispatch thunk of Strideable.distance(to:)();
}

uint64_t StringProtocol.localizedLowercase.getter()
{
  return StringProtocol.localizedLowercase.getter();
}

uint64_t StringProtocol.localizedUppercase.getter()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t StringProtocol.localizedCapitalized.getter()
{
  return StringProtocol.localizedCapitalized.getter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.localizedCaseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol.localizedCaseInsensitiveContains<A>(_:)()
{
  return StringProtocol.localizedCaseInsensitiveContains<A>(_:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t StringProtocol.isEmptyOrWhiteSpace.getter()
{
  return StringProtocol.isEmptyOrWhiteSpace.getter();
}

Swift::String __swiftcall BinaryInteger.formatted()()
{
  uint64_t v0 = BinaryInteger.formatted()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t BinaryInteger.description.getter()
{
  return BinaryInteger.description.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t ArraySlice.description.getter()
{
  return ArraySlice.description.getter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t dispatch thunk of static CaseIterable.allCases.getter()
{
  return dispatch thunk of static CaseIterable.allCases.getter();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return dispatch thunk of Identifiable.id.getter();
}

uint64_t Identifiable<>.id.getter()
{
  return Identifiable<>.id.getter();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
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

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t __CocoaDictionary.Iterator.nextKey()()
{
  return __CocoaDictionary.Iterator.nextKey()();
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

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _stringCompareInternal(_:_:_:_:expecting:)()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return type metadata accessor for FloatingPointRoundingRule();
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

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
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

uint64_t Error.errorDescription.getter()
{
  return Error.errorDescription.getter();
}

uint64_t Error.code.getter()
{
  return Error.code.getter();
}

uint64_t Error.domain.getter()
{
  return Error.domain.getter();
}

uint64_t Error.logOutput.getter()
{
  return Error.logOutput.getter();
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

NSNumber __swiftcall Int64._bridgeToObjectiveC()()
{
  return (NSNumber)Int64._bridgeToObjectiveC()();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return Hasher.finalize()();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Hasher.init()()
{
  return Hasher.init()();
}

uint64_t static Result<>.success.getter()
{
  return static Result<>.success.getter();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t Duration.UnitsFormatStyle.init(allowedUnits:width:maximumUnitCount:zeroValueUnits:valueLength:fractionalPart:)()
{
  return Duration.UnitsFormatStyle.init(allowedUnits:width:maximumUnitCount:zeroValueUnits:valueLength:fractionalPart:)();
}

uint64_t static Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy.hide.getter()
{
  return static Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy.hide.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy()
{
  return type metadata accessor for Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy();
}

uint64_t Duration.UnitsFormatStyle.Attributed.locale(_:)()
{
  return Duration.UnitsFormatStyle.Attributed.locale(_:)();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.Attributed()
{
  return type metadata accessor for Duration.UnitsFormatStyle.Attributed();
}

uint64_t Duration.UnitsFormatStyle.attributed.getter()
{
  return Duration.UnitsFormatStyle.attributed.getter();
}

uint64_t static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.hide.getter()
{
  return static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.hide.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.FractionalPartDisplayStrategy()
{
  return type metadata accessor for Duration.UnitsFormatStyle.FractionalPartDisplayStrategy();
}

uint64_t static Duration.UnitsFormatStyle.Unit.hours.getter()
{
  return static Duration.UnitsFormatStyle.Unit.hours.getter();
}

uint64_t static Duration.UnitsFormatStyle.Unit.minutes.getter()
{
  return static Duration.UnitsFormatStyle.Unit.minutes.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.Unit()
{
  return type metadata accessor for Duration.UnitsFormatStyle.Unit();
}

uint64_t static Duration.UnitsFormatStyle.UnitWidth.narrow.getter()
{
  return static Duration.UnitsFormatStyle.UnitWidth.narrow.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.UnitWidth()
{
  return type metadata accessor for Duration.UnitsFormatStyle.UnitWidth();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle()
{
  return type metadata accessor for Duration.UnitsFormatStyle();
}

uint64_t Duration.formatted<A>(_:)()
{
  return Duration.formatted<A>(_:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AAUIShouldUseNewTrophyCase()
{
  return _AAUIShouldUseNewTrophyCase();
}

uint64_t AAUISortAchievementsByMostRecentEarnedDate()
{
  return _AAUISortAchievementsByMostRecentEarnedDate();
}

uint64_t ACHDateComponentsForYearMonthDay()
{
  return _ACHDateComponentsForYearMonthDay();
}

uint64_t ACHDecodeAchievementFromUserInfoDictionary()
{
  return _ACHDecodeAchievementFromUserInfoDictionary();
}

uint64_t ACHFormatDateWithStyle()
{
  return _ACHFormatDateWithStyle();
}

uint64_t ACHLogDefault()
{
  return _ACHLogDefault();
}

uint64_t ACHLogUI()
{
  return _ACHLogUI();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return _ACHShouldUseNewAwardsSystem();
}

uint64_t ASActivityAppLaunchURLForFriendOnDate()
{
  return _ASActivityAppLaunchURLForFriendOnDate();
}

uint64_t ASActivityAppLaunchURLForSharingFriendList()
{
  return _ASActivityAppLaunchURLForSharingFriendList();
}

uint64_t ASActivitySharingRandomizedLocalizedReplyForReplyContextType()
{
  return _ASActivitySharingRandomizedLocalizedReplyForReplyContextType();
}

uint64_t ASAllGoalsMetForSnapshot()
{
  return _ASAllGoalsMetForSnapshot();
}

uint64_t ASCompetitionVictoryStyleForBadge()
{
  return _ASCompetitionVictoryStyleForBadge();
}

uint64_t ASContactSanitizedDestination()
{
  return _ASContactSanitizedDestination();
}

uint64_t ASDateFromActivityAppLaunchURL()
{
  return _ASDateFromActivityAppLaunchURL();
}

uint64_t ASDisplayModeToString()
{
  return _ASDisplayModeToString();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForFriendAchievement()
{
  return _ASEphemeralCompetitionVictoryAchievementForFriendAchievement();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForStyle()
{
  return _ASEphemeralCompetitionVictoryAchievementForStyle();
}

uint64_t ASEphemeralEarnedAchievementForFriendAchievement()
{
  return _ASEphemeralEarnedAchievementForFriendAchievement();
}

uint64_t ASFriendAchievementFromTemplateAndEarnedInstance()
{
  return _ASFriendAchievementFromTemplateAndEarnedInstance();
}

uint64_t ASFriendUUIDFromActivityAppLaunchURL()
{
  return _ASFriendUUIDFromActivityAppLaunchURL();
}

uint64_t ASIsCompetitionVictoryTemplate()
{
  return _ASIsCompetitionVictoryTemplate();
}

uint64_t ASLaunchToMessagesWithRecipients()
{
  return _ASLaunchToMessagesWithRecipients();
}

uint64_t ASLoggingInitialize()
{
  return _ASLoggingInitialize();
}

uint64_t ASManateeContainerEnabled()
{
  return _ASManateeContainerEnabled();
}

uint64_t ASMessageFromRichMessagePayload()
{
  return _ASMessageFromRichMessagePayload();
}

uint64_t ASRichMessagePayloadForAchievement()
{
  return _ASRichMessagePayloadForAchievement();
}

uint64_t ASRichMessagePayloadForGoalCompletion()
{
  return _ASRichMessagePayloadForGoalCompletion();
}

uint64_t ASRichMessagePayloadForWorkout()
{
  return _ASRichMessagePayloadForWorkout();
}

uint64_t ASWorkoutCaloriesString()
{
  return _ASWorkoutCaloriesString();
}

uint64_t ASWorkoutNameString()
{
  return _ASWorkoutNameString();
}

uint64_t AXDateStringForFormat()
{
  return _AXDateStringForFormat();
}

uint64_t ActivitySharingBundle()
{
  return _ActivitySharingBundle();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BPSAccessoryColor()
{
  return _BPSAccessoryColor();
}

uint64_t BPSCellHightlightColor()
{
  return _BPSCellHightlightColor();
}

uint64_t BPSForegroundColor()
{
  return _BPSForegroundColor();
}

uint64_t BPSPillSelectedColor()
{
  return _BPSPillSelectedColor();
}

uint64_t BPSScreenValueGetRelevantValue()
{
  return _BPSScreenValueGetRelevantValue();
}

uint64_t BPSSeparatorColor()
{
  return _BPSSeparatorColor();
}

uint64_t BPSSetupBackgroundColor()
{
  return _BPSSetupBackgroundColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
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

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return _CPPhoneNumberCopyHomeCountryCode();
}

uint64_t CPPhoneNumberCopyNormalized()
{
  return _CPPhoneNumberCopyNormalized();
}

uint64_t CTFontHasExuberatedLineHeight()
{
  return _CTFontHasExuberatedLineHeight();
}

uint64_t FIActivityAnalyticsSubmission()
{
  return _FIActivityAnalyticsSubmission();
}

uint64_t FIActivityAnalyticsSubmissionWithPayload()
{
  return _FIActivityAnalyticsSubmissionWithPayload();
}

uint64_t FIActivityMoveModeChangeSampleForDateComponents()
{
  return _FIActivityMoveModeChangeSampleForDateComponents();
}

uint64_t FIActivityMoveModeUserDefault()
{
  return _FIActivityMoveModeUserDefault();
}

uint64_t FIAgeInYearsForDateOfBirth()
{
  return _FIAgeInYearsForDateOfBirth();
}

uint64_t FICMotionConditionForWheelchairUse()
{
  return _FICMotionConditionForWheelchairUse();
}

uint64_t FICustomSplits()
{
  return _FICustomSplits();
}

uint64_t FIDefaultActivityMoveModeWithAge()
{
  return _FIDefaultActivityMoveModeWithAge();
}

uint64_t FIDefaultExerciseGoalQuantityForActivityMoveMode()
{
  return _FIDefaultExerciseGoalQuantityForActivityMoveMode();
}

uint64_t FIDefaultStandGoalQuantityForActivityMoveMode()
{
  return _FIDefaultStandGoalQuantityForActivityMoveMode();
}

uint64_t FIDeviceMeetsMinimumOSVersionDaytona()
{
  return _FIDeviceMeetsMinimumOSVersionDaytona();
}

uint64_t FIDeviceMeetsMinimumOSVersionGlory()
{
  return _FIDeviceMeetsMinimumOSVersionGlory();
}

uint64_t FIExperienceTypeWithHealthStore()
{
  return _FIExperienceTypeWithHealthStore();
}

uint64_t FIGetActivePairedDevice()
{
  return _FIGetActivePairedDevice();
}

uint64_t FIHasSeenTrainingLoadOnboarding()
{
  return _FIHasSeenTrainingLoadOnboarding();
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  return _FIIsActivePairedDeviceSatellitePaired();
}

uint64_t FIIsTinkerVegaOrFitnessJunior()
{
  return _FIIsTinkerVegaOrFitnessJunior();
}

uint64_t FILocalizedActivityNameWithWorkout()
{
  return _FILocalizedActivityNameWithWorkout();
}

uint64_t FILocalizedNameForActivityType()
{
  return _FILocalizedNameForActivityType();
}

uint64_t FILocalizedNameForIndoorAgnosticActivityType()
{
  return _FILocalizedNameForIndoorAgnosticActivityType();
}

uint64_t FILocalizedStrokeStyleName()
{
  return _FILocalizedStrokeStyleName();
}

uint64_t FIRandomStringForPrefixWithTableName()
{
  return _FIRandomStringForPrefixWithTableName();
}

uint64_t FISaveGoalsForNewActivityMoveMode()
{
  return _FISaveGoalsForNewActivityMoveMode();
}

uint64_t FISetHasSeenTrainingLoadOnboarding()
{
  return _FISetHasSeenTrainingLoadOnboarding();
}

uint64_t FISplitsForMeasuringSystemIdentifier()
{
  return _FISplitsForMeasuringSystemIdentifier();
}

uint64_t FIUIActivityLevelsForBMR()
{
  return _FIUIActivityLevelsForBMR();
}

uint64_t FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode()
{
  return _FIUIActivityLevelsForBMRAndIsStandalonePhoneFitnessMode();
}

uint64_t FIUIActivityLevelsForFitnessJr()
{
  return _FIUIActivityLevelsForFitnessJr();
}

uint64_t FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode()
{
  return _FIUIActivityLevelsForFitnessJrAndIsStandalonePhoneFitnessMode();
}

uint64_t FIUIBundle()
{
  return _FIUIBundle();
}

uint64_t FIUICalculateBMR()
{
  return _FIUICalculateBMR();
}

uint64_t FIUICircularGradientImage()
{
  return _FIUICircularGradientImage();
}

uint64_t FIUICircularImage()
{
  return _FIUICircularImage();
}

uint64_t FIUICircularWorkoutGradientImage()
{
  return _FIUICircularWorkoutGradientImage();
}

uint64_t FIUICircularWorkoutGradientImageWithGoal()
{
  return _FIUICircularWorkoutGradientImageWithGoal();
}

uint64_t FIUICopyUserFirstNameFromAddressBook()
{
  return _FIUICopyUserFirstNameFromAddressBook();
}

uint64_t FIUICurrentLanguageRequiresTallScript()
{
  return _FIUICurrentLanguageRequiresTallScript();
}

uint64_t FIUIDeviceScale()
{
  return _FIUIDeviceScale();
}

uint64_t FIUIDeviceSupportsElevationGain()
{
  return _FIUIDeviceSupportsElevationGain();
}

uint64_t FIUIDeviceSupportsGroundElevation()
{
  return _FIUIDeviceSupportsGroundElevation();
}

uint64_t FIUIDistanceTypeForActivityType()
{
  return _FIUIDistanceTypeForActivityType();
}

uint64_t FIUIDistanceUnitForHKUnit()
{
  return _FIUIDistanceUnitForHKUnit();
}

uint64_t FIUIDistanceUnitIsMetric()
{
  return _FIUIDistanceUnitIsMetric();
}

uint64_t FIUIFlipFrameRightToLeftIfNeeded()
{
  return _FIUIFlipFrameRightToLeftIfNeeded();
}

uint64_t FIUIFlipViewRightToLeftIfNeeded()
{
  return _FIUIFlipViewRightToLeftIfNeeded();
}

uint64_t FIUIHKUnitIsCalorieUnit()
{
  return _FIUIHKUnitIsCalorieUnit();
}

uint64_t FIUIHealthStoreForDevice()
{
  return _FIUIHealthStoreForDevice();
}

uint64_t FIUIIsWheelchairUserForWheelchairUse()
{
  return _FIUIIsWheelchairUserForWheelchairUse();
}

uint64_t FIUIIsWorkoutTypePedestrianActivity()
{
  return _FIUIIsWorkoutTypePedestrianActivity();
}

uint64_t FIUILocaleIsRightToLeft()
{
  return _FIUILocaleIsRightToLeft();
}

uint64_t FIUINumberOfUnitsInPaceForPaceFormat()
{
  return _FIUINumberOfUnitsInPaceForPaceFormat();
}

uint64_t FIUIPaceFormatForDistanceType()
{
  return _FIUIPaceFormatForDistanceType();
}

uint64_t FIUIPaceFormatForWorkoutActivityType()
{
  return _FIUIPaceFormatForWorkoutActivityType();
}

uint64_t FIUISetNeedsActivityRingExplanation()
{
  return _FIUISetNeedsActivityRingExplanation();
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return _FIUIStaticWorkoutIconImage();
}

uint64_t FIUIUserHasExistingExerciseAndStandGoals()
{
  return _FIUIUserHasExistingExerciseAndStandGoals();
}

uint64_t FIUIUserHasExistingMoveGoal()
{
  return _FIUIUserHasExistingMoveGoal();
}

uint64_t FIUIUserHasExistingPreKincaidMoveGoal()
{
  return _FIUIUserHasExistingPreKincaidMoveGoal();
}

uint64_t FUInterpolateQuantitySamplesOverDateIntervals()
{
  return _FUInterpolateQuantitySamplesOverDateIntervals();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return _HKCreateSerialDispatchQueue();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return _HKCreateSerialDispatchQueueWithQOSClass();
}

uint64_t HKFirstDayOfWeekForWeeklyGoalCalculations()
{
  return _HKFirstDayOfWeekForWeeklyGoalCalculations();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return _HKHealthKitFrameworkBundle();
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return _HKLocalizedStringForDateAndTemplate();
}

uint64_t HKNSOperatingSystemVersionCompare()
{
  return _HKNSOperatingSystemVersionCompare();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return _HKNSOperatingSystemVersionFromString();
}

uint64_t HKRelativeMonthYearText()
{
  return _HKRelativeMonthYearText();
}

uint64_t HKSingletonDispatchQueueName()
{
  return _HKSingletonDispatchQueueName();
}

uint64_t HKUILocalizedStringForValenceClassification()
{
  return _HKUILocalizedStringForValenceClassification();
}

uint64_t HKUIStandardMapGreenColor()
{
  return _HKUIStandardMapGreenColor();
}

uint64_t HKUIStandardMapRedColor()
{
  return _HKUIStandardMapRedColor();
}

uint64_t HKWorkoutMetricTypeDescription()
{
  return _HKWorkoutMetricTypeDescription();
}

uint64_t IMPreferredAccountForService()
{
  return _IMPreferredAccountForService();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  CLLocationCoordinate2D v3 = _MKCoordinateForMapPoint(mapPoint);
  double longitude = v3.longitude;
  double latitude = v3.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  return _MKMapRectInset(rect, dx, dy);
}

BOOL MKMapRectIntersectsRect(MKMapRect rect1, MKMapRect rect2)
{
  return _MKMapRectIntersectsRect(rect1, rect2);
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  return _MKRoadWidthAtZoomScale(zoomScale);
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

uint64_t UICeilToViewScale()
{
  return _UICeilToViewScale();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIFloorToViewScale()
{
  return _UIFloorToViewScale();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
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

uint64_t _CPTimeFormatIs24HourMode()
{
  return __CPTimeFormatIs24HourMode();
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return __HKActivityCacheDateComponentsFromCacheIndex();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return __HKActivityCacheDateComponentsFromDate();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return __HKCacheIndexFromDateComponents();
}

uint64_t _HKEnumerateActiveWorkoutIntervals()
{
  return __HKEnumerateActiveWorkoutIntervals();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _HKLogDroppedError()
{
  return __HKLogDroppedError();
}

uint64_t _HKStartDateForSnapshotIndex()
{
  return __HKStartDateForSnapshotIndex();
}

uint64_t _HKWeatherTemperatureUnit()
{
  return __HKWeatherTemperatureUnit();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return __HKWorkoutActivityNameForActivityType();
}

uint64_t _HKWorkoutActivityTypeIsRouteable()
{
  return __HKWorkoutActivityTypeIsRouteable();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return __HKWorkoutActivityTypeIsValid();
}

uint64_t _HKWorkoutDistanceTypeForActivityType()
{
  return __HKWorkoutDistanceTypeForActivityType();
}

uint64_t _HKWorkoutFlooredValueForQuantity()
{
  return __HKWorkoutFlooredValueForQuantity();
}

uint64_t _HKWorkoutSpeedTypeForActivityType()
{
  return __HKWorkoutSpeedTypeForActivityType();
}

uint64_t _HKWorkoutSwimmingLocationTypeName()
{
  return __HKWorkoutSwimmingLocationTypeName();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return _dgetrf_(__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _dgetri_(__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
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

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocBox()
{
  return _swift_deallocBox();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return _swift_dynamicCastObjCProtocolUnconditional();
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

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
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

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

void vDSP_mmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectWithData:options:error:];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _[a1 URLContexts];
}

id objc_msgSend_URLWithSize_cropStyle_format_(void *a1, const char *a2, ...)
{
  return [a1 URLWithSize:cropStyle:format:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accessibilitySetInterfaceStyleIntent_(void *a1, const char *a2, ...)
{
  return [a1 _accessibilitySetInterfaceStyleIntent:];
}

id objc_msgSend__activeDateIntervals_containsDate_(void *a1, const char *a2, ...)
{
  return [_activeDateIntervals:containsDate:];
}

id objc_msgSend__activeDateIntervalsForWorkout_during_(void *a1, const char *a2, ...)
{
  return [_activeDateIntervalsForWorkout:during:];
}

id objc_msgSend__activeDateIntervalsForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [_activeDateIntervalsForWorkout:workoutActivity:];
}

id objc_msgSend__activeDateIntervalsForWorkoutActivity_during_(void *a1, const char *a2, ...)
{
  return [_activeDateIntervalsForWorkoutActivity:during:];
}

id objc_msgSend__activeDuration(void *a1, const char *a2, ...)
{
  return _[a1 _activeDuration];
}

id objc_msgSend__activeEnergyInfoForWorkout_(void *a1, const char *a2, ...)
{
  return [_activeEnergyInfoForWorkout:];
}

id objc_msgSend__activeWorkoutElapsedTimeFromDate_toDate_forWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [_activeWorkoutElapsedTimeFromDate:toDate:forWorkout:workoutActivity:];
}

id objc_msgSend__activityGoalTypeForCurrentPage(void *a1, const char *a2, ...)
{
  return _[a1 _activityGoalTypeForCurrentPage];
}

id objc_msgSend__activityLevelView(void *a1, const char *a2, ...)
{
  return _[a1 _activityLevelView];
}

id objc_msgSend__activityMoveMode(void *a1, const char *a2, ...)
{
  return _[a1 _activityMoveMode];
}

id objc_msgSend__activityMoveModeWithError_(void *a1, const char *a2, ...)
{
  return [a1 _activityMoveModeWithError:];
}

id objc_msgSend__activitySharingIsSetup(void *a1, const char *a2, ...)
{
  return _[a1 _activitySharingIsSetup];
}

id objc_msgSend__activitySummaryIndex(void *a1, const char *a2, ...)
{
  return _[a1 _activitySummaryIndex];
}

id objc_msgSend__add_(void *a1, const char *a2, ...)
{
  return [a1 _add:];
}

id objc_msgSend__addAndRearrangeWeekviewsAndGroups(void *a1, const char *a2, ...)
{
  return _[a1 _addAndRearrangeWeekviewsAndGroups];
}

id objc_msgSend__addDataProviderUpdateHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _addDataProviderUpdateHandlers];
}

id objc_msgSend__addLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _addLayoutConstraints];
}

id objc_msgSend__addSuggestedContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addSuggestedContact:");
}

id objc_msgSend__animateRingOnTouch_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateRingOnTouch:completion:");
}

id objc_msgSend__animateToTappedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateToTappedState:");
}

id objc_msgSend__applicationIconImageForBundleIdentifier_format_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:");
}

id objc_msgSend__autocompleteSharedContactStore(void *a1, const char *a2, ...)
{
  return _[a1 _autocompleteSharedContactStore];
}

id objc_msgSend__averageHeartRateQuantityFromWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_averageHeartRateQuantityFromWorkout:workoutActivity:");
}

id objc_msgSend__backdropViewLayerGroupName(void *a1, const char *a2, ...)
{
  return _[a1 _backdropViewLayerGroupName];
}

id objc_msgSend__beatsPerMinute(void *a1, const char *a2, ...)
{
  return _[a1 _beatsPerMinute];
}

id objc_msgSend__bodyMassCharacteristicQuantityWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bodyMassCharacteristicQuantityWithError:");
}

id objc_msgSend__buildFreshViews(void *a1, const char *a2, ...)
{
  return _[a1 _buildFreshViews];
}

id objc_msgSend__cachedPhoneCloudKitAccountStatusIsActive(void *a1, const char *a2, ...)
{
  return _[a1 _cachedPhoneCloudKitAccountStatusIsActive];
}

id objc_msgSend__cachedWatchCloudKitAccountAssumedToExist(void *a1, const char *a2, ...)
{
  return _[a1 _cachedWatchCloudKitAccountAssumedToExist];
}

id objc_msgSend__cachedWatchCloudKitAccountStatusIsActive(void *a1, const char *a2, ...)
{
  return _[a1 _cachedWatchCloudKitAccountStatusIsActive];
}

id objc_msgSend__calculateLastVisibleDate(void *a1, const char *a2, ...)
{
  return _[a1 _calculateLastVisibleDate];
}

id objc_msgSend__calculateSectionContentOffsets(void *a1, const char *a2, ...)
{
  return _[a1 _calculateSectionContentOffsets];
}

id objc_msgSend__calculateStatistics(void *a1, const char *a2, ...)
{
  return _[a1 _calculateStatistics];
}

id objc_msgSend__centerForRingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_centerForRingAtIndex:");
}

id objc_msgSend__centerXForRingAt_percent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_centerXForRingAt:percent:");
}

id objc_msgSend__checkCurrentMonth(void *a1, const char *a2, ...)
{
  return _[a1 _checkCurrentMonth];
}

id objc_msgSend__checkPairedWatchIsMinimumVersion(void *a1, const char *a2, ...)
{
  return _[a1 _checkPairedWatchIsMinimumVersion];
}

id objc_msgSend__checkReachableForContact_withDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkReachableForContact:withDestination:");
}

id objc_msgSend__clearWeeklyGoalDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _clearWeeklyGoalDisplayContext];
}

id objc_msgSend__clearWindowSceneAndOptions(void *a1, const char *a2, ...)
{
  return _[a1 _clearWindowSceneAndOptions];
}

id objc_msgSend__cloudKitAccountsAreActive(void *a1, const char *a2, ...)
{
  return _[a1 _cloudKitAccountsAreActive];
}

id objc_msgSend__commonConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _commonConstraints];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return _[a1 _commonInit];
}

id objc_msgSend__configureWorkoutHandler(void *a1, const char *a2, ...)
{
  return _[a1 _configureWorkoutHandler];
}

id objc_msgSend__constrainViews(void *a1, const char *a2, ...)
{
  return _[a1 _constrainViews];
}

id objc_msgSend__constructKBURLWithLocale_(void *a1, const char *a2, ...)
{
  return [a1 _constructKBURLWithLocale];
}

id objc_msgSend__contact_hasEmailDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contact:hasEmailDestination:");
}

id objc_msgSend__contact_hasPhoneNumberDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contact:hasPhoneNumberDestination:");
}

id objc_msgSend__countPerMinuteUnit(void *a1, const char *a2, ...)
{
  return _[a1 _countPerMinuteUnit];
}

id objc_msgSend__countWorkouts(void *a1, const char *a2, ...)
{
  return _[a1 _countWorkouts];
}

id objc_msgSend__createAndAddSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _createAndAddSubviews];
}

id objc_msgSend__createAverageHeartRateLabel(void *a1, const char *a2, ...)
{
  return _[a1 _createAverageHeartRateLabel];
}

id objc_msgSend__createAwardSection(void *a1, const char *a2, ...)
{
  return _[a1 _createAwardSection];
}

id objc_msgSend__createBurnBarSection(void *a1, const char *a2, ...)
{
  return _[a1 _createBurnBarSection];
}

id objc_msgSend__createCatalogItemViewModelIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _createCatalogItemViewModelIfNeeded];
}

id objc_msgSend__createContentView(void *a1, const char *a2, ...)
{
  return _[a1 _createContentView];
}

id objc_msgSend__createDiveSection(void *a1, const char *a2, ...)
{
  return _[a1 _createDiveSection];
}

id objc_msgSend__createDownhillRunsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createDownhillRunsSection];
}

id objc_msgSend__createEffortSection(void *a1, const char *a2, ...)
{
  return _[a1 _createEffortSection];
}

id objc_msgSend__createExpandButton(void *a1, const char *a2, ...)
{
  return _[a1 _createExpandButton];
}

id objc_msgSend__createGoalViewWithFrame_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createGoalViewWithFrame:configuration:");
}

id objc_msgSend__createGuidedRunMediaMomentsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createGuidedRunMediaMomentsSection];
}

id objc_msgSend__createHeartRateSectionWithHeartRateReadings_averageHeartRate_recoveryHeartRateReadings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createHeartRateSectionWithHeartRateReadings:averageHeartRate:recoveryHeartRateReadings:");
}

id objc_msgSend__createIntervalsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createIntervalsSection];
}

id objc_msgSend__createLabels(void *a1, const char *a2, ...)
{
  return _[a1 _createLabels];
}

id objc_msgSend__createLayout(void *a1, const char *a2, ...)
{
  return _[a1 _createLayout];
}

id objc_msgSend__createMultiSportSection(void *a1, const char *a2, ...)
{
  return _[a1 _createMultiSportSection];
}

id objc_msgSend__createOrbActions(void *a1, const char *a2, ...)
{
  return _[a1 _createOrbActions];
}

id objc_msgSend__createPeoplePicker(void *a1, const char *a2, ...)
{
  return _[a1 _createPeoplePicker];
}

id objc_msgSend__createPowerSectionWithPowerSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createPowerSectionWithPowerSamples:");
}

id objc_msgSend__createRingsView(void *a1, const char *a2, ...)
{
  return _[a1 _createRingsView];
}

id objc_msgSend__createRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 _createRootViewController];
}

id objc_msgSend__createRouteAndWeatherCellIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _createRouteAndWeatherCellIfNeeded];
}

id objc_msgSend__createRouteAndWeatherSection(void *a1, const char *a2, ...)
{
  return _[a1 _createRouteAndWeatherSection];
}

id objc_msgSend__createSegmentedControl(void *a1, const char *a2, ...)
{
  return _[a1 _createSegmentedControl];
}

id objc_msgSend__createSegmentsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createSegmentsSection];
}

id objc_msgSend__createSeparator(void *a1, const char *a2, ...)
{
  return _[a1 _createSeparator];
}

id objc_msgSend__createSplitsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createSplitsSection];
}

id objc_msgSend__createSubItemsForWorkoutMetrics(void *a1, const char *a2, ...)
{
  return _[a1 _createSubItemsForWorkoutMetrics];
}

id objc_msgSend__createSummarySection(void *a1, const char *a2, ...)
{
  return _[a1 _createSummarySection];
}

id objc_msgSend__createSwimSetsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createSwimSetsSection];
}

id objc_msgSend__createTableItems(void *a1, const char *a2, ...)
{
  return _[a1 _createTableItems];
}

id objc_msgSend__createTitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _createTitleLabel];
}

id objc_msgSend__createTrackLapsSection(void *a1, const char *a2, ...)
{
  return _[a1 _createTrackLapsSection];
}

id objc_msgSend__createValuesSection(void *a1, const char *a2, ...)
{
  return _[a1 _createValuesSection];
}

id objc_msgSend__currentPageHasGoalSchedule(void *a1, const char *a2, ...)
{
  return _[a1 _currentPageHasGoalSchedule];
}

id objc_msgSend__currentWeekStartDate(void *a1, const char *a2, ...)
{
  return _[a1 _currentWeekStartDate];
}

id objc_msgSend__dateInterval(void *a1, const char *a2, ...)
{
  return _[a1 _dateInterval];
}

id objc_msgSend__dayDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _dayDateFormatter];
}

id objc_msgSend__dayViewDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _dayViewDisplayContext];
}

id objc_msgSend__decimalNumberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _decimalNumberFormatter];
}

id objc_msgSend__deleteObjects_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteObjects:options:completion:");
}

id objc_msgSend__deleteWorkoutAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 _deleteWorkoutAtIndexPath];
}

id objc_msgSend__descriptionForOutgoingInvites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_descriptionForOutgoingInvites:");
}

id objc_msgSend__destinationAddressesForCurrentAccount(void *a1, const char *a2, ...)
{
  return _[a1 _destinationAddressesForCurrentAccount];
}

id objc_msgSend__destinationMatchesCurrentAccountDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationMatchesCurrentAccountDestination:");
}

id objc_msgSend__determinePresentationContextIfNeededWithHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 _determinePresentationContextIfNeededWithHealthStore:];
}

id objc_msgSend__dismissAndNotifyDelegate(void *a1, const char *a2, ...)
{
  return _[a1 _dismissAndNotifyDelegate];
}

id objc_msgSend__dismissKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 _dismissKeyboard:];
}

id objc_msgSend__distanceInfoForWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_distanceInfoForWorkout:");
}

id objc_msgSend__durationInfoForWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_durationInfoForWorkout:");
}

id objc_msgSend__emptyContact(void *a1, const char *a2, ...)
{
  return _[a1 _emptyContact];
}

id objc_msgSend__emptyItem(void *a1, const char *a2, ...)
{
  return _[a1 _emptyItem];
}

id objc_msgSend__endEditingAndDiscardChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endEditingAndDiscardChanges:");
}

id objc_msgSend__endValue(void *a1, const char *a2, ...)
{
  return _[a1 _endValue];
}

id objc_msgSend__enumerateActiveTimePeriods_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateActiveTimePeriods:");
}

id objc_msgSend__executeBlockWaitingOnFriendsDataIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _executeBlockWaitingOnFriendsDataIfNeeded];
}

id objc_msgSend__exerciseGoalViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _exerciseGoalViewConfiguration];
}

id objc_msgSend__exerciseQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 _exerciseQuantityForToday];
}

id objc_msgSend__existingActivityGoalScheduleForCurrentPage(void *a1, const char *a2, ...)
{
  return _[a1 _existingActivityGoalScheduleForCurrentPage];
}

id objc_msgSend__fetchActiveExerciseGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveExerciseGoalSampleWithCompletion:");
}

id objc_msgSend__fetchActiveMoveGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveMoveGoalSampleWithCompletion:");
}

id objc_msgSend__fetchActiveSampleForQuantityType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveSampleForQuantityType:completion:");
}

id objc_msgSend__fetchActiveStandGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchActiveStandGoalSampleWithCompletion:");
}

id objc_msgSend__fetchBurnBarScoreSummary(void *a1, const char *a2, ...)
{
  return _[a1 _fetchBurnBarScoreSummary];
}

id objc_msgSend__fetchChicletWithParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchChicletWithParameters:completion:");
}

id objc_msgSend__fetchHeartRateDataForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchHeartRateDataForWorkout:workoutActivity:completion:");
}

id objc_msgSend__fetchIconForConnectedGymWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchIconForConnectedGymWorkout:context:completion:");
}

id objc_msgSend__fetchIconForFirstPartyWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchIconForFirstPartyWorkout:context:completion:");
}

id objc_msgSend__fetchIconForThirdPartyWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchIconForThirdPartyWorkout:context:completion:");
}

id objc_msgSend__fetchIconFromLaunchServicesWithParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchIconFromLaunchServicesWithParameters:completion:");
}

id objc_msgSend__fetchIconFromNRGWithParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchIconFromNRGWithParameters:completion:");
}

id objc_msgSend__fetchMostRecentDailyExerciseGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyExerciseGoalSampleWithCompletion:");
}

id objc_msgSend__fetchMostRecentDailyGoalSampleForQuantityType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyGoalSampleForQuantityType:completion:");
}

id objc_msgSend__fetchMostRecentDailyMoveGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 _fetchMostRecentDailyMoveGoalSampleWithCompletion:];
}

id objc_msgSend__fetchMostRecentDailyStandGoalSampleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentDailyStandGoalSampleWithCompletion:");
}

id objc_msgSend__fetchMostRecentGoalSchedulesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMostRecentGoalSchedulesWithCompletion:");
}

id objc_msgSend__fetchPhoneIconForWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPhoneIconForWorkout:context:completion:");
}

id objc_msgSend__fetchPreferredTrackDistanceUnit(void *a1, const char *a2, ...)
{
  return _[a1 _fetchPreferredTrackDistanceUnit];
}

id objc_msgSend__fetchRingImageForWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRingImageForWorkout:context:completion:");
}

id objc_msgSend__fetchRoundIconWithParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRoundIconWithParameters:completion:");
}

id objc_msgSend__fetchWatchIconForWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchWatchIconForWorkout:context:completion:");
}

id objc_msgSend__filterMenu(void *a1, const char *a2, ...)
{
  return _[a1 _filterMenu];
}

id objc_msgSend__findCenteredWeekAndUpdateTitleIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _findCenteredWeekAndUpdateTitleIfNecessary];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__fitGoalLabel(void *a1, const char *a2, ...)
{
  return _[a1 _fitGoalLabel];
}

id objc_msgSend__fitnessDataCollectionEnabledPreference(void *a1, const char *a2, ...)
{
  return _[a1 _fitnessDataCollectionEnabledPreference];
}

id objc_msgSend__fitnessModeRequiresWatchSetup(void *a1, const char *a2, ...)
{
  return _[a1 _fitnessModeRequiresWatchSetup];
}

id objc_msgSend__fitsWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fitsWidth:");
}

id objc_msgSend__fontForSectionHeaderType_(void *a1, const char *a2, ...)
{
  return [a1 _fontForSectionHeaderType:];
}

id objc_msgSend__footerString(void *a1, const char *a2, ...)
{
  return _[a1 _footerString];
}

id objc_msgSend__formatGoalLabel(void *a1, const char *a2, ...)
{
  return _[a1 _formatGoalLabel];
}

id objc_msgSend__formattedDateForDetailWithWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedDateForDetailWithWorkout:");
}

id objc_msgSend__formattedDateForListViewWithWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedDateForListViewWithWorkout:");
}

id objc_msgSend__formattedDescriptionForDayViewWithWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedDescriptionForDayViewWithWorkout:");
}

id objc_msgSend__formattedDescriptionForListViewWithWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedDescriptionForListViewWithWorkout:");
}

id objc_msgSend__formattedDistanceStringForWorkout_distanceString_unitString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedDistanceStringForWorkout:distanceString:unitString:");
}

id objc_msgSend__formattedGoalForDetailViewWithWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedGoalForDetailViewWithWorkout:");
}

id objc_msgSend__formattedValueString_withUnitString_paceFormat_context_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_formattedValueString:withUnitString:paceFormat:context:color:");
}

id objc_msgSend__formattingManager(void *a1, const char *a2, ...)
{
  return _[a1 _formattingManager];
}

id objc_msgSend__fractionToFillTotalSplitDelimiterDistance(void *a1, const char *a2, ...)
{
  return _[a1 _fractionToFillTotalSplitDelimiterDistance];
}

id objc_msgSend__friendDetailDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _friendDetailDisplayContext];
}

id objc_msgSend__geocoder(void *a1, const char *a2, ...)
{
  return _[a1 _geocoder];
}

id objc_msgSend__getAndHandlePhoneCloudKitAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 _getAndHandlePhoneCloudKitAccountStatus];
}

id objc_msgSend__getAndHandleWatchCloudKitAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 _getAndHandleWatchCloudKitAccountStatus];
}

id objc_msgSend__getDayWithTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getDayWithTouches:");
}

id objc_msgSend__goalCompletionEventsForWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_goalCompletionEventsForWorkout:");
}

id objc_msgSend__goalStringForWorkout_outValue_(void *a1, const char *a2, ...)
{
  return [a1 _goalStringForWorkout:outValue:];
}

id objc_msgSend__goalType(void *a1, const char *a2, ...)
{
  return _[a1 _goalType];
}

id objc_msgSend__groundElevationFont(void *a1, const char *a2, ...)
{
  return _[a1 _groundElevationFont];
}

id objc_msgSend__groundElevationHeight(void *a1, const char *a2, ...)
{
  return _[a1 _groundElevationHeight];
}

id objc_msgSend__guessedKindForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_guessedKindForString:");
}

id objc_msgSend__handleActivityShareShortcut(void *a1, const char *a2, ...)
{
  return _[a1 _handleActivityShareShortcut];
}

id objc_msgSend__handleActivitySharingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleActivitySharingURL:");
}

id objc_msgSend__handleFriendsShortcut(void *a1, const char *a2, ...)
{
  return _[a1 _handleFriendsShortcut];
}

id objc_msgSend__handleHistoryShortcut(void *a1, const char *a2, ...)
{
  return _[a1 _handleHistoryShortcut];
}

id objc_msgSend__handleInitialResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleInitialResults:");
}

id objc_msgSend__handleLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleLocations:");
}

id objc_msgSend__handleRemovedObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRemovedObjects:");
}

id objc_msgSend__handleSettingsShortcut(void *a1, const char *a2, ...)
{
  return _[a1 _handleSettingsShortcut];
}

id objc_msgSend__handleShortcutItem_didJustLaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleShortcutItem:didJustLaunch:");
}

id objc_msgSend__handleTodayShortcut(void *a1, const char *a2, ...)
{
  return _[a1 _handleTodayShortcut];
}

id objc_msgSend__handleTrendsShortcut(void *a1, const char *a2, ...)
{
  return _[a1 _handleTrendsShortcut];
}

id objc_msgSend__handleUpdatedRelationships_withAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpdatedRelationships:withAnchor:");
}

id objc_msgSend__handleWatchStatusAndCloudKitAccountStatusChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleWatchStatusAndCloudKitAccountStatusChange];
}

id objc_msgSend__handleWorkoutConfigurationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWorkoutConfigurationURL:");
}

id objc_msgSend__hasFirstPartyBundleID(void *a1, const char *a2, ...)
{
  return _[a1 _hasFirstPartyBundleID];
}

id objc_msgSend__headerConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _headerConfiguration];
}

id objc_msgSend__heightOffsetForWeekRow_(void *a1, const char *a2, ...)
{
  return [a1 _heightOffsetForWeekRow:];
}

id objc_msgSend__hideSetupControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideSetupControllerAnimated:");
}

id objc_msgSend__horizontalConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _horizontalConstraints];
}

id objc_msgSend__indexPathAdjustedForSummaryCellForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathAdjustedForSummaryCellForRow:inSection:");
}

id objc_msgSend__indexPathsToInsertForSection_deletedIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathsToInsertForSection:deletedIndexPaths:");
}

id objc_msgSend__indexPathsToInsertWithSectionSet_deletedIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathsToInsertWithSectionSet:deletedIndexPaths:");
}

id objc_msgSend__indexPathsToRemoveForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathsToRemoveForSection:");
}

id objc_msgSend__indexPathsToRemoveWithSectionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathsToRemoveWithSectionSet:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__insertBurnBarSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertBurnBarSection];
}

id objc_msgSend__insertDownhillRunsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertDownhillRunsSection];
}

id objc_msgSend__insertGuidedRunMediaMomentsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertGuidedRunMediaMomentsSection];
}

id objc_msgSend__insertHeartRateSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertHeartRateSection];
}

id objc_msgSend__insertHeartRateSubItem(void *a1, const char *a2, ...)
{
  return _[a1 _insertHeartRateSubItem];
}

id objc_msgSend__insertIntervalsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertIntervalsSection];
}

id objc_msgSend__insertMultiSportSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertMultiSportSection];
}

id objc_msgSend__insertPowerSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertPowerSection];
}

id objc_msgSend__insertSegmentsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertSegmentsSection];
}

id objc_msgSend__insertSplitsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertSplitsSection];
}

id objc_msgSend__insertSwimSetsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertSwimSetsSection];
}

id objc_msgSend__insertTrackLapsSection(void *a1, const char *a2, ...)
{
  return _[a1 _insertTrackLapsSection];
}

id objc_msgSend__inviteFriends(void *a1, const char *a2, ...)
{
  return _[a1 _inviteFriends];
}

id objc_msgSend__isAppleWatch(void *a1, const char *a2, ...)
{
  return _[a1 _isAppleWatch];
}

id objc_msgSend__isCompetitionSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCompetitionSection:");
}

id objc_msgSend__isContactsAccessAuthorized(void *a1, const char *a2, ...)
{
  return _[a1 _isContactsAccessAuthorized];
}

id objc_msgSend__isDataHidden(void *a1, const char *a2, ...)
{
  return _[a1 _isDataHidden];
}

id objc_msgSend__isExtendedMode(void *a1, const char *a2, ...)
{
  return _[a1 _isExtendedMode];
}

id objc_msgSend__isGoalSchedule_theSameAs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isGoalSchedule:theSameAs:");
}

id objc_msgSend__isIndexPathEditable_(void *a1, const char *a2, ...)
{
  return [a1 _isIndexPathEditable:];
}

id objc_msgSend__isLastVisibleWeek_(void *a1, const char *a2, ...)
{
  return [a1 _isLastVisibleWeek:];
}

id objc_msgSend__isManagedAppleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isManagedAppleId:");
}

id objc_msgSend__isSetupViewControllerVisible(void *a1, const char *a2, ...)
{
  return _[a1 _isSetupViewControllerVisible];
}

id objc_msgSend__isStandalonePhoneFitnessMode(void *a1, const char *a2, ...)
{
  return _[a1 _isStandalonePhoneFitnessMode];
}

id objc_msgSend__isStandalonePhoneSummary(void *a1, const char *a2, ...)
{
  return _[a1 _isStandalonePhoneSummary];
}

id objc_msgSend__isVerticalCell(void *a1, const char *a2, ...)
{
  return _[a1 _isVerticalCell];
}

id objc_msgSend__isWatchWorkout(void *a1, const char *a2, ...)
{
  return _[a1 _isWatchWorkout];
}

id objc_msgSend__labelsForHeartRateRecovery(void *a1, const char *a2, ...)
{
  return _[a1 _labelsForHeartRateRecovery];
}

id objc_msgSend__lastBaseline(void *a1, const char *a2, ...)
{
  return _[a1 _lastBaseline];
}

id objc_msgSend__lastLineBaselineFrameOriginY(void *a1, const char *a2, ...)
{
  return _[a1 _lastLineBaselineFrameOriginY];
}

id objc_msgSend__layoutLabels(void *a1, const char *a2, ...)
{
  return _[a1 _layoutLabels];
}

id objc_msgSend__layoutPrivacyLinkIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _layoutPrivacyLinkIfNecessary];
}

id objc_msgSend__loadActivitySummariesForWeek_ringGroupIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadActivitySummariesForWeek:ringGroupIndex:");
}

id objc_msgSend__loadExerciseAndStandGoalViews(void *a1, const char *a2, ...)
{
  return _[a1 _loadExerciseAndStandGoalViews];
}

id objc_msgSend__loadMoveGoalView(void *a1, const char *a2, ...)
{
  return _[a1 _loadMoveGoalView];
}

id objc_msgSend__loadWorkoutsForWeek_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadWorkoutsForWeek:");
}

id objc_msgSend__locationArrowImage(void *a1, const char *a2, ...)
{
  return _[a1 _locationArrowImage];
}

id objc_msgSend__logFriendListDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logFriendListDisplayMode:");
}

id objc_msgSend__logMessageComposeResult_messageComposeViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logMessageComposeResult:messageComposeViewController:");
}

id objc_msgSend__makeAppleWeatherFooterView(void *a1, const char *a2, ...)
{
  return _[a1 _makeAppleWeatherFooterView];
}

id objc_msgSend__makeFooterView(void *a1, const char *a2, ...)
{
  return _[a1 _makeFooterView];
}

id objc_msgSend__makeFriendDetailViewControllerForSection_row_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeFriendDetailViewControllerForSection:row:");
}

id objc_msgSend__makeUltraModeFooterView(void *a1, const char *a2, ...)
{
  return _[a1 _makeUltraModeFooterView];
}

id objc_msgSend__maxDepthInfoForDive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maxDepthInfoForDive:");
}

id objc_msgSend__mergeRecipient_(void *a1, const char *a2, ...)
{
  return [a1 _mergeRecipient];
}

id objc_msgSend__monthYearDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _monthYearDateFormatter];
}

id objc_msgSend__moveGoalViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _moveGoalViewConfiguration];
}

id objc_msgSend__moveQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 _moveQuantityForToday];
}

id objc_msgSend__nextButtonTapped(void *a1, const char *a2, ...)
{
  return _[a1 _nextButtonTapped];
}

id objc_msgSend__noSuggestionString(void *a1, const char *a2, ...)
{
  return _[a1 _noSuggestionString];
}

id objc_msgSend__normalizeSubItemsArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_normalizeSubItemsArray:");
}

id objc_msgSend__openKBURLWithLocale_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openKBURLWithLocale:completionHandler:");
}

id objc_msgSend__openKBURLWithRetry(void *a1, const char *a2, ...)
{
  return _[a1 _openKBURLWithRetry];
}

id objc_msgSend__paceFormats(void *a1, const char *a2, ...)
{
  return _[a1 _paceFormats];
}

id objc_msgSend__paceUnitForActivityType_paceFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_paceUnitForActivityType:paceFormat:");
}

id objc_msgSend__parseFitnessCoachingNotificationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseFitnessCoachingNotificationType:");
}

id objc_msgSend__parseGoalRecommendation_(void *a1, const char *a2, ...)
{
  return [a1 _parseGoalRecommendation:];
}

id objc_msgSend__performAfterFriendDataIsAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAfterFriendDataIsAvailable:");
}

id objc_msgSend__popViewControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _popViewControllerIfNeeded];
}

id objc_msgSend__populateAchievements(void *a1, const char *a2, ...)
{
  return _[a1 _populateAchievements];
}

id objc_msgSend__populateProgressBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populateProgressBar:");
}

id objc_msgSend__populateSuggestedContactsWithReachability(void *a1, const char *a2, ...)
{
  return _[a1 _populateSuggestedContactsWithReachability];
}

id objc_msgSend__predicateForActiveDateIntervals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForActiveDateIntervals:");
}

id objc_msgSend__predicateForObjectsFromWorkout_withinWorkoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForObjectsFromWorkout:withinWorkoutActivity:");
}

id objc_msgSend__preferredServiceIdentifierForDestination_inReachableDestinationsByService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredServiceIdentifierForDestination:inReachableDestinationsByService:");
}

id objc_msgSend__prepareForScrollAnimationStart(void *a1, const char *a2, ...)
{
  return _[a1 _prepareForScrollAnimationStart];
}

id objc_msgSend__presentActivityViewControllerForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentActivityViewControllerForItems:");
}

id objc_msgSend__presentConfigurationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentConfigurationData:");
}

id objc_msgSend__presentErrorAlertWithMessage_(void *a1, const char *a2, ...)
{
  return [a1 _presentErrorAlertWithMessage:];
}

id objc_msgSend__presentInitialAchievementIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _presentInitialAchievementIfNeeded];
}

id objc_msgSend__presentOnboardingNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentOnboardingNavigationController:");
}

id objc_msgSend__presentShareSheetWithTitle_image_workoutData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentShareSheetWithTitle:image:workoutData:");
}

id objc_msgSend__pushDetailViewControllerForSection_row_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushDetailViewControllerForSection:row:");
}

id objc_msgSend__quantityByAddingQuantity_(void *a1, const char *a2, ...)
{
  return [a1 _quantityByAddingQuantity:];
}

id objc_msgSend__queryAllServicesForDestinations_reachableUpdateHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryAllServicesForDestinations:reachableUpdateHandler:completionHandler:");
}

id objc_msgSend__queue_downhillRunsForWorkout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_downhillRunsForWorkout:error:");
}

id objc_msgSend__queue_intervalsForWorkout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_intervalsForWorkout:error:");
}

id objc_msgSend__queue_openWaterSwimDistanceByStrokeStyleForWorkout_workoutActivity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_openWaterSwimDistanceByStrokeStyleForWorkout:workoutActivity:error:");
}

id objc_msgSend__queue_refreshCacheWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_refreshCacheWithCompletion:");
}

id objc_msgSend__queue_segmentsForWorkout_markerEvents_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_segmentsForWorkout:markerEvents:error:");
}

id objc_msgSend__queue_sortAllWorkoutsByMonthAndYearWithCurrentFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_sortAllWorkoutsByMonthAndYearWithCurrentFilter");
}

id objc_msgSend__queue_strokeStyleForLaps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_strokeStyleForLaps:");
}

id objc_msgSend__queue_swimDistanceByStrokeStyleForWorkout_workoutActivity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_swimDistanceByStrokeStyleForWorkout:workoutActivity:error:");
}

id objc_msgSend__queue_swimmingSetsForWorkout_workoutActivity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_swimmingSetsForWorkout:workoutActivity:error:");
}

id objc_msgSend__queue_swimmingSplitsForWorkout_workoutActivity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_swimmingSplitsForWorkout:workoutActivity:error:");
}

id objc_msgSend__queue_trackLapsForWorkout_lapEvents_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_trackLapsForWorkout:lapEvents:error:");
}

id objc_msgSend__readjustFrom_to_fromGroupRange_toGroupRange_down_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readjustFrom:to:fromGroupRange:toGroupRange:down:");
}

id objc_msgSend__readjustOffsetIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _readjustOffsetIfNecessary];
}

id objc_msgSend__readjustRings(void *a1, const char *a2, ...)
{
  return _[a1 _readjustRings];
}

id objc_msgSend__readjustScrollViewToOffset_weekOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readjustScrollViewToOffset:weekOffset:");
}

id objc_msgSend__rearrangeWeeks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rearrangeWeeks:");
}

id objc_msgSend__recipientFromDestination_(void *a1, const char *a2, ...)
{
  return [a1 _recipientFromDestination];
}

id objc_msgSend__recreateFilterObjects(void *a1, const char *a2, ...)
{
  return _[a1 _recreateFilterObjects];
}

id objc_msgSend__refilterShownContacts(void *a1, const char *a2, ...)
{
  return _[a1 _refilterShownContacts];
}

id objc_msgSend__refreshBadgeCounts(void *a1, const char *a2, ...)
{
  return _[a1 _refreshBadgeCounts];
}

id objc_msgSend__refreshCache(void *a1, const char *a2, ...)
{
  return _[a1 _refreshCache];
}

id objc_msgSend__registerCellClasses(void *a1, const char *a2, ...)
{
  return _[a1 _registerCellClasses];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForNotifications];
}

id objc_msgSend__relayoutRingGroups(void *a1, const char *a2, ...)
{
  return _[a1 _relayoutRingGroups];
}

id objc_msgSend__reloadActivitySummariesFromCache(void *a1, const char *a2, ...)
{
  return _[a1 _reloadActivitySummariesFromCache];
}

id objc_msgSend__reloadAllActivitySummariesFromCache(void *a1, const char *a2, ...)
{
  return _[a1 _reloadAllActivitySummariesFromCache];
}

id objc_msgSend__reloadAllWorkoutsFromCache(void *a1, const char *a2, ...)
{
  return _[a1 _reloadAllWorkoutsFromCache];
}

id objc_msgSend__reloadData(void *a1, const char *a2, ...)
{
  return _[a1 _reloadData];
}

id objc_msgSend__reloadDataForFilter(void *a1, const char *a2, ...)
{
  return _[a1 _reloadDataForFilter];
}

id objc_msgSend__reloadDataFromProvider(void *a1, const char *a2, ...)
{
  return _[a1 _reloadDataFromProvider];
}

id objc_msgSend__removeAdvancedView(void *a1, const char *a2, ...)
{
  return _[a1 _removeAdvancedView];
}

id objc_msgSend__removeGoalsOfType_after_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeGoalsOfType:after:");
}

id objc_msgSend__requestWheelchairDiagnosticsSubmissionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _requestWheelchairDiagnosticsSubmissionIfNecessary];
}

id objc_msgSend__requireIntrinsicSizeForView_(void *a1, const char *a2, ...)
{
  return [a1 _requireIntrinsicSizeForView:];
}

id objc_msgSend__resetSearchResults(void *a1, const char *a2, ...)
{
  return _[a1 _resetSearchResults];
}

id objc_msgSend__resetToViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetToViewController:");
}

id objc_msgSend__restingDuration(void *a1, const char *a2, ...)
{
  return _[a1 _restingDuration];
}

id objc_msgSend__retryAnchoredObjectQueryWithRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 _retryAnchoredObjectQueryWithRetryCount:];
}

id objc_msgSend__ringImageForWorkout_context_(void *a1, const char *a2, ...)
{
  return [a1 _ringImageForWorkout:context:];
}

id objc_msgSend__rowAlignmentOptions(void *a1, const char *a2, ...)
{
  return _[a1 _rowAlignmentOptions];
}

id objc_msgSend__runAnimatedUpdateHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _runAnimatedUpdateHandlers];
}

id objc_msgSend__runFilterActionFinishedHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _runFilterActionFinishedHandlers];
}

id objc_msgSend__runFilterActionStartedHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _runFilterActionStartedHandlers];
}

id objc_msgSend__runHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runHandlers:");
}

id objc_msgSend__runUpdateHandlers(void *a1, const char *a2, ...)
{
  return _[a1 _runUpdateHandlers];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 _scaledValueForValue:];
}

id objc_msgSend__scrollAnimationFinished(void *a1, const char *a2, ...)
{
  return _[a1 _scrollAnimationFinished];
}

id objc_msgSend__searchForRecipientWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_searchForRecipientWithText:");
}

id objc_msgSend__sectionTypeForSectionIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sectionTypeForSectionIndex:");
}

id objc_msgSend__sectionWidth(void *a1, const char *a2, ...)
{
  return _[a1 _sectionWidth];
}

id objc_msgSend__sendInviteToRecipientsByService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendInviteToRecipientsByService:completion:");
}

id objc_msgSend__seriesSamplesForType_workout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_seriesSamplesForType:workout:workoutActivity:completion:");
}

id objc_msgSend__setAccessoryBaseColor_(void *a1, const char *a2, ...)
{
  return [a1 _setAccessoryBaseColor:];
}

id objc_msgSend__setActivityLevel_activityMoveMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivityLevel:activityMoveMode:");
}

id objc_msgSend__setActivityTabBarImage(void *a1, const char *a2, ...)
{
  return _[a1 _setActivityTabBarImage];
}

id objc_msgSend__setAllowsAutorotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsAutorotation:");
}

id objc_msgSend__setBadgeCount_forTabBarItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBadgeCount:forTabBarItem:");
}

id objc_msgSend__setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _setBundleIdentifier:];
}

id objc_msgSend__setDataForGroups_withStartingDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDataForGroups:withStartingDate:");
}

id objc_msgSend__setDefaultAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDefaultAttributes:");
}

id objc_msgSend__setDrawsSeparatorAtTopOfSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDrawsSeparatorAtTopOfSections:");
}

id objc_msgSend__setFirstLineBaselineFrameOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirstLineBaselineFrameOriginY:");
}

id objc_msgSend__setFirstLineCapFrameOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirstLineCapFrameOriginY:");
}

id objc_msgSend__setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFont:");
}

id objc_msgSend__setGoalQuantity_goalView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGoalQuantity:goalView:");
}

id objc_msgSend__setGoalQuantityForGoalView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGoalQuantityForGoalView:");
}

id objc_msgSend__setGoalSchedules_(void *a1, const char *a2, ...)
{
  return [a1 _setGoalSchedules:];
}

id objc_msgSend__setHeaderAndFooterViewsFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeaderAndFooterViewsFloat:");
}

id objc_msgSend__setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHyphenationFactor:");
}

id objc_msgSend__setIsWatchWorkout_(void *a1, const char *a2, ...)
{
  return [a1 _setIsWatchWorkout:];
}

id objc_msgSend__setLastLineBaselineFrameOriginY_(void *a1, const char *a2, ...)
{
  return [a1 _setLastLineBaselineFrameOriginY:];
}

id objc_msgSend__setParticipatesInAudioSession_(void *a1, const char *a2, ...)
{
  return [a1 _setParticipatesInAudioSession:];
}

id objc_msgSend__setRowAlignmentsOptions_(void *a1, const char *a2, ...)
{
  return [a1 _setRowAlignmentsOptions:];
}

id objc_msgSend__setSelectedViewController_(void *a1, const char *a2, ...)
{
  return [_a1 _setSelectedViewController:];
}

id objc_msgSend__setShouldHaveFullLengthBottomSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldHaveFullLengthBottomSeparator:");
}

id objc_msgSend__setShowSuggestions_(void *a1, const char *a2, ...)
{
  return [a1 _setShowSuggestions:];
}

id objc_msgSend__setupActivityAppAndLoadData(void *a1, const char *a2, ...)
{
  return _[a1 _setupActivityAppAndLoadData];
}

id objc_msgSend__setupCell(void *a1, const char *a2, ...)
{
  return _[a1 _setupCell];
}

id objc_msgSend__setupCellSizes(void *a1, const char *a2, ...)
{
  return _[a1 _setupCellSizes];
}

id objc_msgSend__setupCells(void *a1, const char *a2, ...)
{
  return _[a1 _setupCells];
}

id objc_msgSend__setupCloudRestoreUI(void *a1, const char *a2, ...)
{
  return _[a1 _setupCloudRestoreUI];
}

id objc_msgSend__setupDataSource(void *a1, const char *a2, ...)
{
  return _[a1 _setupDataSource];
}

id objc_msgSend__setupDeeplinks(void *a1, const char *a2, ...)
{
  return _[a1 _setupDeeplinks];
}

id objc_msgSend__setupNumberOfItemsInSection(void *a1, const char *a2, ...)
{
  return _[a1 _setupNumberOfItemsInSection];
}

id objc_msgSend__setupOnboarding(void *a1, const char *a2, ...)
{
  return _[a1 _setupOnboarding];
}

id objc_msgSend__setupTabBarViewControllersAndOrbActions(void *a1, const char *a2, ...)
{
  return _[a1 _setupTabBarViewControllersAndOrbActions];
}

id objc_msgSend__setupTableView(void *a1, const char *a2, ...)
{
  return _[a1 _setupTableView];
}

id objc_msgSend__shareIconForWorkout_routeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareIconForWorkout:routeImage:");
}

id objc_msgSend__shareValueForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 _shareValueForWorkout];
}

id objc_msgSend__shareWorkout(void *a1, const char *a2, ...)
{
  return _[a1 _shareWorkout];
}

id objc_msgSend__shouldShowChangeGoalFooter(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowChangeGoalFooter];
}

id objc_msgSend__shouldShowCompetitionAcceptAction(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowCompetitionAcceptAction];
}

id objc_msgSend__shouldShowCompetitionRequestAction(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowCompetitionRequestAction];
}

id objc_msgSend__shouldShowCompetitionRulesAction(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowCompetitionRulesAction];
}

id objc_msgSend__shouldShowExerciseAndStandCells(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowExerciseAndStandCells];
}

id objc_msgSend__shouldShowMuteAction(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowMuteAction];
}

id objc_msgSend__shouldShowProgressBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowProgressBar:");
}

id objc_msgSend__shouldShowSplits(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowSplits];
}

id objc_msgSend__shouldShowStepsAndDistanceCells(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowStepsAndDistanceCells];
}

id objc_msgSend__shouldShowWhileDataIsHiddenForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowWhileDataIsHiddenForSection:");
}

id objc_msgSend__shouldUseVeryShortWeekdays(void *a1, const char *a2, ...)
{
  return _[a1 _shouldUseVeryShortWeekdays];
}

id objc_msgSend__showAdvancedViewForCurrentGoalPage(void *a1, const char *a2, ...)
{
  return _[a1 _showAdvancedViewForCurrentGoalPage];
}

id objc_msgSend__showAdvancedViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _showAdvancedViewIfNeeded];
}

id objc_msgSend__showAveragePaceForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAveragePaceForWorkout:workoutActivity:");
}

id objc_msgSend__showCoachingDataCollectionMessageIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _showCoachingDataCollectionMessageIfNeeded];
}

id objc_msgSend__showDetailForFriend_date_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailForFriend:date:");
}

id objc_msgSend__showSetupControllerInPhase_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSetupControllerInPhase:animated:");
}

id objc_msgSend__sizeForGoalCell_withPreferredWidth_availableWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sizeForGoalCell:withPreferredWidth:availableWidth:");
}

id objc_msgSend__sortMenu(void *a1, const char *a2, ...)
{
  return _[a1 _sortMenu];
}

id objc_msgSend__source(void *a1, const char *a2, ...)
{
  return _[a1 _source];
}

id objc_msgSend__standGoalViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _standGoalViewConfiguration];
}

id objc_msgSend__standQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 _standQuantityForToday];
}

id objc_msgSend__startEdit(void *a1, const char *a2, ...)
{
  return _[a1 _startEdit];
}

id objc_msgSend__stopActivityIndicator(void *a1, const char *a2, ...)
{
  return _[a1 _stopActivityIndicator];
}

id objc_msgSend__stopRouteQueryIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _stopRouteQueryIfNecessary];
}

id objc_msgSend__storeGoals(void *a1, const char *a2, ...)
{
  return _[a1 _storeGoals];
}

id objc_msgSend__stringFromDate_withTimeInterval_textStyle_forceAMPM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringFromDate:withTimeInterval:textStyle:forceAMPM:");
}

id objc_msgSend__subLabelsForHeartRateRecovery(void *a1, const char *a2, ...)
{
  return _[a1 _subLabelsForHeartRateRecovery];
}

id objc_msgSend__swimmingSplitsForWorkout_workoutActivity_distanceSamples_strokeSamples_forDelimeterUnit_splitDelimiter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swimmingSplitsForWorkout:workoutActivity:distanceSamples:strokeSamples:forDelimeterUnit:splitDelimiter:");
}

id objc_msgSend__systemContentInset(void *a1, const char *a2, ...)
{
  return _[a1 _systemContentInset];
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 _systemImageNamed:];
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _systemImageNamed:withConfiguration:];
}

id objc_msgSend__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend__testMarkersForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 _testMarkersForWorkout:];
}

id objc_msgSend__testTrackLapsForWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_testTrackLapsForWorkout:");
}

id objc_msgSend__textFieldShouldBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 _textFieldShouldBecomeFirstResponder];
}

id objc_msgSend__titleForConfirmButton(void *a1, const char *a2, ...)
{
  return _[a1 _titleForConfirmButton];
}

id objc_msgSend__titleStringForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleStringForDate:");
}

id objc_msgSend__todayDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _todayDateFormatter];
}

id objc_msgSend__toggleAdvancedMode(void *a1, const char *a2, ...)
{
  return _[a1 _toggleAdvancedMode];
}

id objc_msgSend__totalBasalEnergyBurned(void *a1, const char *a2, ...)
{
  return _[a1 _totalBasalEnergyBurned];
}

id objc_msgSend__touchesInside_(void *a1, const char *a2, ...)
{
  return [a1 _touchesInside:];
}

id objc_msgSend__transformAttributes_(void *a1, const char *a2, ...)
{
  return [a1 _transformAttributes:];
}

id objc_msgSend__transformButtonForExpandedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformButtonForExpandedState:");
}

id objc_msgSend__transformFriendAchievementsToACHAchievements(void *a1, const char *a2, ...)
{
  return _[a1 _transformFriendAchievementsToACHAchievements];
}

id objc_msgSend__treatAsFirstPartyWorkout_workoutActivity_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 _treatAsFirstPartyWorkout:workoutActivity:formattingManager:];
}

id objc_msgSend__try_reloadDataForFilter(void *a1, const char *a2, ...)
{
  return [a1 _try_reloadDataForFilter];
}

id objc_msgSend__underwaterTimeInfoForDive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_underwaterTimeInfoForDive:");
}

id objc_msgSend__unitManager(void *a1, const char *a2, ...)
{
  return _[a1 _unitManager];
}

id objc_msgSend__updateActivitySharingWatchPairingStatus(void *a1, const char *a2, ...)
{
  return _[a1 _updateActivitySharingWatchPairingStatus];
}

id objc_msgSend__updateAdvanceViewButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAdvanceViewButton:");
}

id objc_msgSend__updateChartSpacing(void *a1, const char *a2, ...)
{
  return _[a1 _updateChartSpacing];
}

id objc_msgSend__updateConfigurationForStandalone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConfigurationForStandalone:");
}

id objc_msgSend__updateFilterButtonTitleForWorkoutTypeKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFilterButtonTitleForWorkoutTypeKey:");
}

id objc_msgSend__updateFiltersList(void *a1, const char *a2, ...)
{
  return _[a1 _updateFiltersList];
}

id objc_msgSend__updateGoalLabelWithGoal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGoalLabelWithGoal:");
}

id objc_msgSend__updatePaceFormatForSets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePaceFormatForSets:");
}

id objc_msgSend__updateSections(void *a1, const char *a2, ...)
{
  return _[a1 _updateSections];
}

id objc_msgSend__updateSectionsForCurrentDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _updateSectionsForCurrentDisplayContext];
}

id objc_msgSend__updateSeymourNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 _updateSeymourNavigationController];
}

id objc_msgSend__updateSharingTextForMe(void *a1, const char *a2, ...)
{
  return _[a1 _updateSharingTextForMe];
}

id objc_msgSend__updateSplits_withDistance_duration_strokeCount_splitDelimiterInUserUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSplits:withDistance:duration:strokeCount:splitDelimiterInUserUnit:");
}

id objc_msgSend__uuidForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uuidForWorkout:workoutActivity:");
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return _[a1 _value];
}

id objc_msgSend__verticalConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _verticalConstraints];
}

id objc_msgSend__viewControllerAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewControllerAtIndex:");
}

id objc_msgSend__warmDataCalculatorCache(void *a1, const char *a2, ...)
{
  return _[a1 _warmDataCalculatorCache];
}

id objc_msgSend__workoutDetailDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _workoutDetailDisplayContext];
}

id objc_msgSend__workoutDetailOpenGoalDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _workoutDetailOpenGoalDisplayContext];
}

id objc_msgSend__workoutForIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 _workoutForIndexPath:];
}

id objc_msgSend__workoutSupportsDistanceAndPace_(void *a1, const char *a2, ...)
{
  return [a1 _workoutSupportsDistanceAndPace:];
}

id objc_msgSend__workoutTypeInfoForWorkout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_workoutTypeInfoForWorkout:");
}

id objc_msgSend__workoutsForFriend_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_workoutsForFriend:snapshot:");
}

id objc_msgSend__workoutsListDisplayContext(void *a1, const char *a2, ...)
{
  return _[a1 _workoutsListDisplayContext];
}

id objc_msgSend__yValueForCellAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 _yValueForCellAtIndex:];
}

id objc_msgSend_aa_isManagedAppleID(void *a1, const char *a2, ...)
{
  return [a1 aa_isManagedAppleID];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_acceptCompetitionInviteFromFriendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 acceptCompetitionInviteFromFriendUUID:completion:];
}

id objc_msgSend_acceptCompetitionRequestFromFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 acceptCompetitionRequestFromFriend:completion:];
}

id objc_msgSend_acceptFriendInviteFromFriendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 acceptFriendInviteFromFriendUUID:completion:];
}

id objc_msgSend_acceptInvitationFromFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 acceptInvitationFromFriend:completion:];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return _[a1 accessoryView];
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 accountTypeWithAccountTypeIdentifier:];
}

id objc_msgSend_accountsWithAccountType_(void *a1, const char *a2, ...)
{
  return [a1 accountsWithAccountType:];
}

id objc_msgSend_achievedShortDescriptionForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 achievedShortDescriptionForAchievement:];
}

id objc_msgSend_achievement(void *a1, const char *a2, ...)
{
  return _[a1 achievement];
}

id objc_msgSend_achievementAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 achievementAtIndexPath:];
}

id objc_msgSend_achievementForTemplateUniqueName_(void *a1, const char *a2, ...)
{
  return [a1 achievementForTemplateUniqueName:];
}

id objc_msgSend_achievementLocalizationProvider(void *a1, const char *a2, ...)
{
  return _[a1 achievementLocalizationProvider];
}

id objc_msgSend_achievementSelectedBlock(void *a1, const char *a2, ...)
{
  return _[a1 achievementSelectedBlock];
}

id objc_msgSend_achievementTappedHandler(void *a1, const char *a2, ...)
{
  return _[a1 achievementTappedHandler];
}

id objc_msgSend_achievementWithTemplateUniqueName_completedDate_value_friendUUID_(void *a1, const char *a2, ...)
{
  return [a1 achievementWithTemplateUniqueName:completedDate:value:friendUUID:];
}

id objc_msgSend_achievements(void *a1, const char *a2, ...)
{
  return _[a1 achievements];
}

id objc_msgSend_achievementsCell_didTapAchievement_subCell_frameInCHHorizontalScrollingAchievementsTableViewCellCoordinates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "achievementsCell:didTapAchievement:subCell:frameInCHHorizontalScrollingAchievementsTableViewCellCoordinates:");
}

id objc_msgSend_achievementsDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 achievementsDataProvider];
}

id objc_msgSend_achievementsForDateComponents_(void *a1, const char *a2, ...)
{
  return [a1 achievementsForDateComponents:];
}

id objc_msgSend_achievementsForWorkoutIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 achievementsForWorkoutIdentifier:];
}

id objc_msgSend_achievementsView(void *a1, const char *a2, ...)
{
  return _[a1 achievementsView];
}

id objc_msgSend_achievementsView_didTapAchievement_cell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "achievementsView:didTapAchievement:cell:");
}

id objc_msgSend_actionCount(void *a1, const char *a2, ...)
{
  return _[a1 actionCount];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithHandler:];
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:image:identifier:handler:];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 activateWithCompletionHandler:];
}

id objc_msgSend_activeEnergy(void *a1, const char *a2, ...)
{
  return _[a1 activeEnergy];
}

id objc_msgSend_activeHours(void *a1, const char *a2, ...)
{
  return _[a1 activeHours];
}

id objc_msgSend_activeHoursGoal(void *a1, const char *a2, ...)
{
  return _[a1 activeHoursGoal];
}

id objc_msgSend_activePairingDevice(void *a1, const char *a2, ...)
{
  return _[a1 activePairingDevice];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_activityDashboardViewController(void *a1, const char *a2, ...)
{
  return _[a1 activityDashboardViewController];
}

id objc_msgSend_activityDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 activityDataProvider];
}

id objc_msgSend_activityDateCache(void *a1, const char *a2, ...)
{
  return _[a1 activityDateCache];
}

id objc_msgSend_activityGoalScheduleType(void *a1, const char *a2, ...)
{
  return _[a1 activityGoalScheduleType];
}

id objc_msgSend_activityGoalScheduleWithDate_goalType_goal_device_metadata_(void *a1, const char *a2, ...)
{
  return [a1 activityGoalScheduleWithDate:goalType:goal:device:metadata:];
}

id objc_msgSend_activityHasBeenSetup(void *a1, const char *a2, ...)
{
  return _[a1 activityHasBeenSetup];
}

id objc_msgSend_activityLevelForSegmentedControlIndex_(void *a1, const char *a2, ...)
{
  return [a1 activityLevelForSegmentedControlIndex:];
}

id objc_msgSend_activityRingGroupForRingType_(void *a1, const char *a2, ...)
{
  return [a1 activityRingGroupForRingType:];
}

id objc_msgSend_activitySharingClient(void *a1, const char *a2, ...)
{
  return _[a1 activitySharingClient];
}

id objc_msgSend_activitySharingViewController(void *a1, const char *a2, ...)
{
  return _[a1 activitySharingViewController];
}

id objc_msgSend_activitySummary(void *a1, const char *a2, ...)
{
  return _[a1 activitySummary];
}

id objc_msgSend_activitySummaryForCacheIndex_(void *a1, const char *a2, ...)
{
  return [a1 activitySummaryForCacheIndex:];
}

id objc_msgSend_activityTileNavController(void *a1, const char *a2, ...)
{
  return _[a1 activityTileNavController];
}

id objc_msgSend_activityTileViewController(void *a1, const char *a2, ...)
{
  return _[a1 activityTileViewController];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_activityTypeWithHKWorkoutActivityTypeIdentifier_isIndoor_metadata_(void *a1, const char *a2, ...)
{
  return [a1 activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:];
}

id objc_msgSend_activityTypeWithWorkout_(void *a1, const char *a2, ...)
{
  return [a1 activityTypeWithWorkout:];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAnimatedUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 addAnimatedUpdateHandler:];
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return [a1 addArrangedSubview:];
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttributes:range:];
}

id objc_msgSend_addButton(void *a1, const char *a2, ...)
{
  return _[a1 addButton];
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return [a1 addButton:];
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 addCharactersInString:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addClip(void *a1, const char *a2, ...)
{
  return _[a1 addClip];
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return [a1 addCompletion:];
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return [a1 addConstraints:];
}

id objc_msgSend_addFilterActionFinishedHandler_(void *a1, const char *a2, ...)
{
  return [a1 addFilterActionFinishedHandler:];
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return [a1 addFinishBlock:];
}

id objc_msgSend_addFriendViewControllerDidDismiss_(void *a1, const char *a2, ...)
{
  return [a1 addFriendViewControllerDidDismiss:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addInitialLoadObserver_(void *a1, const char *a2, ...)
{
  return [a1 addInitialLoadObserver:];
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 addLayoutGuide:];
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return [a1 addListenerID:capabilities:];
}

id objc_msgSend_addMainSectionObserver_(void *a1, const char *a2, ...)
{
  return [a1 addMainSectionObserver:];
}

id objc_msgSend_addMonitor_(void *a1, const char *a2, ...)
{
  return [a1 addMonitor:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addRecentAndRelevantSectionObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecentAndRelevantSectionObserver:");
}

id objc_msgSend_addRecipient_(void *a1, const char *a2, ...)
{
  return [a1 addRecipient:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forEvents:];
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_addUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 addUpdateHandler:];
}

id objc_msgSend_additionalSafeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 additionalSafeAreaInsets];
}

id objc_msgSend_additionalServiceIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 additionalServiceIdentifiers];
}

id objc_msgSend_additionalSpacing(void *a1, const char *a2, ...)
{
  return _[a1 additionalSpacing];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_adjustSafeAreaInsetsWithHeight_(void *a1, const char *a2, ...)
{
  return [a1 adjustSafeAreaInsetsWithHeight:];
}

id objc_msgSend_adjustWeekLabelsByOffset_(void *a1, const char *a2, ...)
{
  return [a1 adjustWeekLabelsByOffset:];
}

id objc_msgSend_advanceGoalHeaderTitle(void *a1, const char *a2, ...)
{
  return _[a1 advanceGoalHeaderTitle];
}

id objc_msgSend_aggregationStyle(void *a1, const char *a2, ...)
{
  return _[a1 aggregationStyle];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alignGoalViews(void *a1, const char *a2, ...)
{
  return _[a1 alignGoalViews];
}

id objc_msgSend_allDestinationsForActiveOrPendingFriends(void *a1, const char *a2, ...)
{
  return _[a1 allDestinationsForActiveOrPendingFriends];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allSamples(void *a1, const char *a2, ...)
{
  return _[a1 allSamples];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_analyticsHandler(void *a1, const char *a2, ...)
{
  return _[a1 analyticsHandler];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [a1 andPredicateWithSubpredicates:];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateModalBadgeView(void *a1, const char *a2, ...)
{
  return _[a1 animateModalBadgeView];
}

id objc_msgSend_animateModalBadgeViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 animateModalBadgeViewIfNeeded];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:completion:];
}

id objc_msgSend_animateWithDuration_animations_curve_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:curve:completion:];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_animationWithEndingFloatValue_duration_timingFunction_completion_(void *a1, const char *a2, ...)
{
  return [a1 animationWithEndingFloatValue:duration:timingFunction:completion:];
}

id objc_msgSend_annotateView(void *a1, const char *a2, ...)
{
  return _[a1 annotateView];
}

id objc_msgSend_annotateView_withAchievement_(void *a1, const char *a2, ...)
{
  return [a1 annotateView:withAchievement:];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appBadgeAggregator(void *a1, const char *a2, ...)
{
  return _[a1 appBadgeAggregator];
}

id objc_msgSend_appIconFormat(void *a1, const char *a2, ...)
{
  return _[a1 appIconFormat];
}

id objc_msgSend_appIconWidth(void *a1, const char *a2, ...)
{
  return _[a1 appIconWidth];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return _[a1 appearance];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return [a1 applicationIsInstalled:];
}

id objc_msgSend_applicationProxyForCompanionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForCompanionIdentifier:];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_appliesLargeCellInset(void *a1, const char *a2, ...)
{
  return _[a1 appliesLargeCellInset];
}

id objc_msgSend_applyConstraints(void *a1, const char *a2, ...)
{
  return _[a1 applyConstraints];
}

id objc_msgSend_applyProgressBarConstraints_(void *a1, const char *a2, ...)
{
  return [a1 applyProgressBarConstraints:];
}

id objc_msgSend_applyTextBaselineConstraints(void *a1, const char *a2, ...)
{
  return _[a1 applyTextBaselineConstraints];
}

id objc_msgSend_applyTextLeadingAndTrailingConstraints(void *a1, const char *a2, ...)
{
  return _[a1 applyTextLeadingAndTrailingConstraints];
}

id objc_msgSend_applyViewConstraints(void *a1, const char *a2, ...)
{
  return _[a1 applyViewConstraints];
}

id objc_msgSend_areMultipleDevicesSharingDataForSnapshotIndex_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areMultipleDevicesSharingDataForSnapshotIndex:completion:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_as_competitionAcceptConfirmationMessageForCompetition_experienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionAcceptConfirmationMessageForCompetition:experienceType:];
}

id objc_msgSend_as_competitionAcceptConfirmationTitle(void *a1, const char *a2, ...)
{
  return [a1 as_competitionAcceptConfirmationTitle];
}

id objc_msgSend_as_competitionAcceptErrorMessage(void *a1, const char *a2, ...)
{
  return [a1 as_competitionAcceptErrorMessage];
}

id objc_msgSend_as_competitionLearnMoreDetailActionForExperienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionLearnMoreDetailActionForExperienceType:];
}

id objc_msgSend_as_competitionLearnMoreFullDescriptionForExperienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionLearnMoreFullDescriptionForExperienceType:];
}

id objc_msgSend_as_competitionLearnMorePopupAction(void *a1, const char *a2, ...)
{
  return [a1 as_competitionLearnMorePopupAction];
}

id objc_msgSend_as_competitionLearnMoreTitleForExperienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionLearnMoreTitleForExperienceType:];
}

id objc_msgSend_as_competitionReceivedNotificationMessageForExperienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionReceivedNotificationMessageForExperienceType:];
}

id objc_msgSend_as_competitionReceivedNotificationTitle(void *a1, const char *a2, ...)
{
  return [a1 as_competitionReceivedNotificationTitle];
}

id objc_msgSend_as_competitionRequestDurationRemainingString(void *a1, const char *a2, ...)
{
  return [a1 as_competitionRequestDurationRemainingString];
}

id objc_msgSend_as_competitionSendConfirmationMessageForExperienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionSendConfirmationMessageForExperienceType:];
}

id objc_msgSend_as_competitionSendConfirmationTitle(void *a1, const char *a2, ...)
{
  return [a1 as_competitionSendConfirmationTitle];
}

id objc_msgSend_as_competitionStageString(void *a1, const char *a2, ...)
{
  return [a1 as_competitionStageString];
}

id objc_msgSend_as_competitionStatusBreadcrumbStringForExperienceType_(void *a1, const char *a2, ...)
{
  return [a1 as_competitionStatusBreadcrumbStringForExperienceType:];
}

id objc_msgSend_as_darkCompetitionGold(void *a1, const char *a2, ...)
{
  return [a1 as_darkCompetitionGold];
}

id objc_msgSend_as_detailedSharingDurationString(void *a1, const char *a2, ...)
{
  return [a1 as_detailedSharingDurationString];
}

id objc_msgSend_as_distanceStringWithContext_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 as_distanceStringWithContext:formattingManager:];
}

id objc_msgSend_as_exerciseDurationStringWithContext_(void *a1, const char *a2, ...)
{
  return [a1 as_exerciseDurationStringWithContext:];
}

id objc_msgSend_as_exerciseProgressStringWithContext_(void *a1, const char *a2, ...)
{
  return [a1 as_exerciseProgressStringWithContext:];
}

id objc_msgSend_as_friendListNameStringWithDotPrefix_keyColor_(void *a1, const char *a2, ...)
{
  return [a1 as_friendListNameStringWithDotPrefix:keyColor:];
}

id objc_msgSend_as_invitedDurationString(void *a1, const char *a2, ...)
{
  return [a1 as_invitedDurationString];
}

id objc_msgSend_as_lightCompetitionGold(void *a1, const char *a2, ...)
{
  return [a1 as_lightCompetitionGold];
}

id objc_msgSend_as_movePercentStringWithContext_snapshot_(void *a1, const char *a2, ...)
{
  return [a1 as_movePercentStringWithContext:snapshot];
}

id objc_msgSend_as_moveProgressStringWithContext_formattingManager_snapshot_(void *a1, const char *a2, ...)
{
  return [a1 as_moveProgressStringWithContext:formattingManager:snapshot];
}

id objc_msgSend_as_pushesStringWithContext_(void *a1, const char *a2, ...)
{
  return [a1 as_pushesStringWithContext:];
}

id objc_msgSend_as_simpleHiddenFromString(void *a1, const char *a2, ...)
{
  return [a1 as_simpleHiddenFromString];
}

id objc_msgSend_as_stepsStringWithContext_(void *a1, const char *a2, ...)
{
  return [a1 as_stepsStringWithContext:];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_assetWithURL_(void *a1, const char *a2, ...)
{
  return [a1 assetWithURL:];
}

id objc_msgSend_atomViewForRecipient_(void *a1, const char *a2, ...)
{
  return [a1 atomViewForRecipient:];
}

id objc_msgSend_attachPaletteWithHeight_(void *a1, const char *a2, ...)
{
  return [a1 attachPaletteWithHeight:];
}

id objc_msgSend_attrStringWithValue_unit_(void *a1, const char *a2, ...)
{
  return [a1 attrStringWithValue:unit:];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringWithAttachment:];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_authorizationStatusForEntityType_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForEntityType:];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_avPlayer(void *a1, const char *a2, ...)
{
  return _[a1 avPlayer];
}

id objc_msgSend_avPlayerLayer(void *a1, const char *a2, ...)
{
  return _[a1 avPlayerLayer];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return _[a1 available];
}

id objc_msgSend_averageHeartRate(void *a1, const char *a2, ...)
{
  return _[a1 averageHeartRate];
}

id objc_msgSend_averageHeartRateForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 averageHeartRateForWorkout:workoutActivity:];
}

id objc_msgSend_averageQuantity(void *a1, const char *a2, ...)
{
  return _[a1 averageQuantity];
}

id objc_msgSend_awardsDataProviderWrapper(void *a1, const char *a2, ...)
{
  return _[a1 awardsDataProviderWrapper];
}

id objc_msgSend_backSideIconImageForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 backSideIconImageForAchievement:];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_backingOriginOffset(void *a1, const char *a2, ...)
{
  return _[a1 backingOriginOffset];
}

id objc_msgSend_badgeAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 badgeAspectRatio];
}

id objc_msgSend_badgeConfigurationForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 badgeConfigurationForAchievement:];
}

id objc_msgSend_badgeContainer(void *a1, const char *a2, ...)
{
  return _[a1 badgeContainer];
}

id objc_msgSend_badgeFrame(void *a1, const char *a2, ...)
{
  return _[a1 badgeFrame];
}

id objc_msgSend_badgeImageFactory(void *a1, const char *a2, ...)
{
  return _[a1 badgeImageFactory];
}

id objc_msgSend_badgeRect(void *a1, const char *a2, ...)
{
  return _[a1 badgeRect];
}

id objc_msgSend_badgeView(void *a1, const char *a2, ...)
{
  return _[a1 badgeView];
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return [a1 bagForProfile:profileVersion:];
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfile];
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return _[a1 bagSubProfileVersion];
}

id objc_msgSend_barColor(void *a1, const char *a2, ...)
{
  return _[a1 barColor];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginListeningForCloudStatusUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginListeningForCloudStatusUpdates];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithOvalInRect:];
}

id objc_msgSend_biologicalSex(void *a1, const char *a2, ...)
{
  return _[a1 biologicalSex];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_bodyLabel(void *a1, const char *a2, ...)
{
  return _[a1 bodyLabel];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _[a1 boldButton];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_boundingRectWithSize_options_context_(void *a1, const char *a2, ...)
{
  return [a1 boundingRectWithSize:options:context:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bridge_isDownhillSnowSport(void *a1, const char *a2, ...)
{
  return [a1 bridge_isDownhillSnowSport];
}

id objc_msgSend_bridge_supportsElevationAscendedInSummary(void *a1, const char *a2, ...)
{
  return [a1 bridge_supportsElevationAscendedInSummary];
}

id objc_msgSend_bridge_supportsElevationDescendedInSummary(void *a1, const char *a2, ...)
{
  return [a1 bridge_supportsElevationDescendedInSummary];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_briskColors(void *a1, const char *a2, ...)
{
  return _[a1 briskColors];
}

id objc_msgSend_briskMinutes(void *a1, const char *a2, ...)
{
  return _[a1 briskMinutes];
}

id objc_msgSend_briskMinutesGoal(void *a1, const char *a2, ...)
{
  return _[a1 briskMinutesGoal];
}

id objc_msgSend_browsingConsentAlertCompletion(void *a1, const char *a2, ...)
{
  return _[a1 browsingConsentAlertCompletion];
}

id objc_msgSend_browsingConsentAlertController(void *a1, const char *a2, ...)
{
  return _[a1 browsingConsentAlertController];
}

id objc_msgSend_buddyControllerDone_(void *a1, const char *a2, ...)
{
  return [a1 buddyControllerDone:];
}

id objc_msgSend_buddyControllerDone_nextControllerClass_(void *a1, const char *a2, ...)
{
  return [a1 buddyControllerDone:nextControllerClass:];
}

id objc_msgSend_buddyControllerReleaseHold_(void *a1, const char *a2, ...)
{
  return [a1 buddyControllerReleaseHold];
}

id objc_msgSend_buddyControllerReleaseHoldAndSkip_(void *a1, const char *a2, ...)
{
  return [a1 buddyControllerReleaseHoldAndSkip:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithIdentifier:];
}

id objc_msgSend_burnBarExpanded(void *a1, const char *a2, ...)
{
  return _[a1 burnBarExpanded];
}

id objc_msgSend_buttonControllerDidUpdate(void *a1, const char *a2, ...)
{
  return _[a1 buttonControllerDidUpdate];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _[a1 buttonTray];
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithConfiguration:primaryAction:];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheContainerForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 cacheContainerForWorkout:workoutActivity:];
}

id objc_msgSend_cacheKeyForColor_size_(void *a1, const char *a2, ...)
{
  return [a1 cacheKeyForColor:size:];
}

id objc_msgSend_cachedDownhillRunsForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 cachedDownhillRunsForWorkout:workoutActivity:];
}

id objc_msgSend_cachedEffortSampleCollectionForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 cachedEffortSampleCollectionForWorkout:workoutActivity:];
}

id objc_msgSend_cadenceColors(void *a1, const char *a2, ...)
{
  return _[a1 cadenceColors];
}

id objc_msgSend_cadenceSamples(void *a1, const char *a2, ...)
{
  return _[a1 cadenceSamples];
}

id objc_msgSend_cadenceSamplesForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 cadenceSamplesForWorkout:workoutActivity:completion:];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 calendarIdentifier];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 calendarWithIdentifier:];
}

id objc_msgSend_calorieGoal(void *a1, const char *a2, ...)
{
  return _[a1 calorieGoal];
}

id objc_msgSend_canSeeMyActivityData(void *a1, const char *a2, ...)
{
  return _[a1 canSeeMyActivityData];
}

id objc_msgSend_canSendText(void *a1, const char *a2, ...)
{
  return _[a1 canSendText];
}

id objc_msgSend_cancelTaskWithID_(void *a1, const char *a2, ...)
{
  return [a1 cancelTaskWithID:];
}

id objc_msgSend_canonicalUnit(void *a1, const char *a2, ...)
{
  return _[a1 canonicalUnit];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 categoryIdentifier];
}

id objc_msgSend_categorySampleWithType_value_startDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 categorySampleWithType:value:startDate:endDate:];
}

id objc_msgSend_categoryTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 categoryTypeForIdentifier:];
}

id objc_msgSend_celebrationMovieURLForAchievementIdentifer_(void *a1, const char *a2, ...)
{
  return [a1 celebrationMovieURLForAchievementIdentifer:];
}

id objc_msgSend_celebrationVideoContainer(void *a1, const char *a2, ...)
{
  return _[a1 celebrationVideoContainer];
}

id objc_msgSend_cellClass(void *a1, const char *a2, ...)
{
  return _[a1 cellClass];
}

id objc_msgSend_cellClassesBySection(void *a1, const char *a2, ...)
{
  return _[a1 cellClassesBySection];
}

id objc_msgSend_cellDidBecomeFirstResponder_(void *a1, const char *a2, ...)
{
  return [a1 cellDidBecomeFirstResponder:];
}

id objc_msgSend_cellDidResignFirstResponder_(void *a1, const char *a2, ...)
{
  return [a1 cellDidResignFirstResponder:];
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForItemAtIndexPath:];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForRowAtIndexPath:];
}

id objc_msgSend_cellHeightForAchievement_preferredWidth_appliesLargeCellInsets_locProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:");
}

id objc_msgSend_cellSizeForIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 cellSizeForIndexPath];
}

id objc_msgSend_cellWidth(void *a1, const char *a2, ...)
{
  return _[a1 cellWidth];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerXForElementAt_width_percent_(void *a1, const char *a2, ...)
{
  return [a1 centerXForElementAt:width:percent:];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_chAwardsDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 chAwardsDataProvider];
}

id objc_msgSend_ch_beatsPerMinute(void *a1, const char *a2, ...)
{
  return [a1 ch_beatsPerMinute];
}

id objc_msgSend_ch_fetchBodyMassBeforeDate_completion_(void *a1, const char *a2, ...)
{
  return [a1 ch_fetchBodyMassBeforeDate:completion:];
}

id objc_msgSend_ch_mostRecentQuantityOfType_beforeDate_completion_(void *a1, const char *a2, ...)
{
  return [a1 ch_mostRecentQuantityOfType:beforeDate:completion:];
}

id objc_msgSend_ch_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 ch_rootViewController];
}

id objc_msgSend_ch_transformViewsForRightToLeftLanguages_(void *a1, const char *a2, ...)
{
  return [a1 ch_transformViewsForRightToLeftLanguages];
}

id objc_msgSend_chartPointWithDate_valueIndexSet_(void *a1, const char *a2, ...)
{
  return [a1 chartPointWithDate:valueIndexSet:];
}

id objc_msgSend_checkInWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 checkInWithCompletion:];
}

id objc_msgSend_circle(void *a1, const char *a2, ...)
{
  return _[a1 circle];
}

id objc_msgSend_clearAllCachedImages(void *a1, const char *a2, ...)
{
  return _[a1 clearAllCachedImages];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearContext(void *a1, const char *a2, ...)
{
  return _[a1 clearContext];
}

id objc_msgSend_clearText(void *a1, const char *a2, ...)
{
  return _[a1 clearText];
}

id objc_msgSend_cloudDeviceProvider(void *a1, const char *a2, ...)
{
  return _[a1 cloudDeviceProvider];
}

id objc_msgSend_cloudKitAccountStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 cloudKitAccountStatusWithCompletion:];
}

id objc_msgSend_cloudSyncObserver(void *a1, const char *a2, ...)
{
  return _[a1 cloudSyncObserver];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionView_layout_referenceSizeForHeaderInSection_(void *a1, const char *a2, ...)
{
  return [a1 collectionView:layout:referenceSizeForHeaderInSection:];
}

id objc_msgSend_collectionView_layout_sizeForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:layout:sizeForItemAtIndexPath:");
}

id objc_msgSend_collectionView_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return [a1 collectionView:numberOfItemsInSection:];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commmitWithError_(void *a1, const char *a2, ...)
{
  return [a1 commmitWithError:];
}

id objc_msgSend_companionFriendListConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 companionFriendListConfiguration];
}

id objc_msgSend_companionGraph(void *a1, const char *a2, ...)
{
  return _[a1 companionGraph];
}

id objc_msgSend_companionTotalScoreFriendDetailConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 companionTotalScoreFriendDetailConfiguration];
}

id objc_msgSend_companionTotalWinsFriendDetailConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 companionTotalWinsFriendDetailConfiguration];
}

id objc_msgSend_companionTotalWinsStandaloneFriendDetailConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 companionTotalWinsStandaloneFriendDetailConfiguration];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_competitionPendingAcceptance(void *a1, const char *a2, ...)
{
  return _[a1 competitionPendingAcceptance];
}

id objc_msgSend_completedFetchWithLocationReadings_(void *a1, const char *a2, ...)
{
  return [a1 completedFetchWithLocationReadings:];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 component:fromDate:];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:toDate:options:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByCharactersInSet:];
}

id objc_msgSend_composeInputLineHeight(void *a1, const char *a2, ...)
{
  return _[a1 composeInputLineHeight];
}

id objc_msgSend_composeRecipientView_textDidChange_(void *a1, const char *a2, ...)
{
  return [a1 composeRecipientView:textDidChange:];
}

id objc_msgSend_composeRecipientViewRequestAddRecipient_(void *a1, const char *a2, ...)
{
  return [a1 composeRecipientViewRequestAddRecipient:];
}

id objc_msgSend_computeMaxYForGoalViews(void *a1, const char *a2, ...)
{
  return _[a1 computeMaxYForGoalViews];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithActions_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithActions:];
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithFont:];
}

id objc_msgSend_configurationWithIdentifier_previewProvider_actionProvider_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithIdentifier:previewProvider:actionProvider:];
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPointSize:];
}

id objc_msgSend_configurationWithPointSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithPointSize:weight:];
}

id objc_msgSend_configurationWithTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithTextStyle:];
}

id objc_msgSend_configureBadgeView(void *a1, const char *a2, ...)
{
  return _[a1 configureBadgeView];
}

id objc_msgSend_configureForAchievement_badgeImageFactory_localizationProvider_(void *a1, const char *a2, ...)
{
  return [a1 configureForAchievement:badgeImageFactory:localizationProvider:];
}

id objc_msgSend_configureHeaderWithActivityType_(void *a1, const char *a2, ...)
{
  return [a1 configureHeaderWithActivityType:];
}

id objc_msgSend_configurePlayer(void *a1, const char *a2, ...)
{
  return _[a1 configurePlayer];
}

id objc_msgSend_configureWithAchievement_badgeImageFactory_locProvider_(void *a1, const char *a2, ...)
{
  return [a1 configureWithAchievement:badgeImageFactory:locProvider:];
}

id objc_msgSend_configureWithActionTypes_labelTexts_footerText_(void *a1, const char *a2, ...)
{
  return [a1 configureWithActionTypes:labelTexts:footerText:];
}

id objc_msgSend_configureWithDive_row_dataCalculator_(void *a1, const char *a2, ...)
{
  return [a1 configureWithDive:row:dataCalculator:];
}

id objc_msgSend_configureWithDownhillRun_downhillRunIndex_activityType_isLastCell_formattingManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithDownhillRun:downhillRunIndex:activityType:isLastCell:formattingManager:");
}

id objc_msgSend_configureWithDownhillRunsStats_activityType_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 configureWithDownhillRunsStats:activityType:formattingManager:];
}

id objc_msgSend_configureWithFitnessAppContext_workout_scoreSummaryWrapper_(void *a1, const char *a2, ...)
{
  return [a1 configureWithFitnessAppContext:workout:scoreSummaryWrapper:];
}

id objc_msgSend_configureWithInterval_index_workout_activityType_activityMoveMode_isLastCell_formattingManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithInterval:index:workout:activityType:activityMoveMode:isLastCell:formattingManager:");
}

id objc_msgSend_configureWithSectionName_(void *a1, const char *a2, ...)
{
  return [a1 configureWithSectionName:];
}

id objc_msgSend_configureWithSegment_segmentIndex_workout_trackDistanceUnit_activityType_activityMoveMode_isLastCell_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 configureWithSegment:segmentIndex:workout:trackDistanceUnit:activityType:activityMoveMode:isLastCell:formattingManager:];
}

id objc_msgSend_configureWithSwimmingSet_index_isLastCell_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 configureWithSwimmingSet:index:isLastCell:formattingManager:];
}

id objc_msgSend_configureWithSwimmingSplit_splitIndex_isLastCell_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 configureWithSwimmingSplit:splitIndex:isLastCell:formattingManager:];
}

id objc_msgSend_configureWithTitle1_value1_(void *a1, const char *a2, ...)
{
  return [a1 configureWithTitle1:value1:];
}

id objc_msgSend_configureWithTitle2_value2_(void *a1, const char *a2, ...)
{
  return [a1 configureWithTitle2:value2:];
}

id objc_msgSend_configureWithTitle_buttonAction_(void *a1, const char *a2, ...)
{
  return [a1 configureWithTitle:buttonAction:];
}

id objc_msgSend_configureWithTrackLap_lapIndex_workout_distanceUnit_activityType_activityMoveMode_isLastCell_formattingManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithTrackLap:lapIndex:workout:distanceUnit:activityType:activityMoveMode:isLastCell:formattingManager:");
}

id objc_msgSend_configureWithWorkout_fitnessAppContext_(void *a1, const char *a2, ...)
{
  return [a1 configureWithWorkout:fitnessAppContext:];
}

id objc_msgSend_configureWithWorkout_workoutActivity_dataCalculator_(void *a1, const char *a2, ...)
{
  return [a1 configureWithWorkout:workoutActivity:dataCalculator:];
}

id objc_msgSend_configureWithWorkout_workoutActivity_dataCalculator_formattingManager_heartRateReadings_averageHeartRate_parent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithWorkout:workoutActivity:dataCalculator:formattingManager:heartRateReadings:averageHeartRate:parent:");
}

id objc_msgSend_configureWithWorkout_workoutActivity_dataCalculator_formattingManager_parent_locationReadings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithWorkout:workoutActivity:dataCalculator:formattingManager:parent:locationReadings:");
}

id objc_msgSend_configureWithWorkout_workoutActivity_dataCalculator_formattingManager_powerSamples_parent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithWorkout:workoutActivity:dataCalculator:formattingManager:powerSamples:parent:");
}

id objc_msgSend_configureWithWorkout_workoutActivity_dataCalculator_parent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithWorkout:workoutActivity:dataCalculator:parent:");
}

id objc_msgSend_configureWithWorkout_workoutActivity_formattingManager_dataCalculator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithWorkout:workoutActivity:formattingManager:dataCalculator:");
}

id objc_msgSend_configureWithWorkout_workoutActivity_unit_split_splitIndex_splitDistance_isLastCell_dataCalculator_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 configureWithWorkout:workoutActivity:unit:split:splitIndex:splitDistance:isLastCell:dataCalculator:formattingManager:];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connectAutomatically(void *a1, const char *a2, ...)
{
  return _[a1 connectAutomatically];
}

id objc_msgSend_connectionOptions(void *a1, const char *a2, ...)
{
  return _[a1 connectionOptions];
}

id objc_msgSend_constrainViews(void *a1, const char *a2, ...)
{
  return _[a1 constrainViews];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:constant:];
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:multiplier:];
}

id objc_msgSend_constraintEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:multiplier:constant:];
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:constant:];
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToConstant:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:multiplier:];
}

id objc_msgSend_constraintLessThanOrEqualToSystemSpacingAfterAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToSystemSpacingAfterAnchor:multiplier:];
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return [a1 constraintsWithVisualFormat:options:metrics:views:];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_contactWithDisplayName_emailOrPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 contactWithDisplayName:emailOrPhoneNumber:];
}

id objc_msgSend_containerGuide(void *a1, const char *a2, ...)
{
  return _[a1 containerGuide];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containsDate_(void *a1, const char *a2, ...)
{
  return [a1 containsDate:];
}

id objc_msgSend_containsMonthTitle(void *a1, const char *a2, ...)
{
  return _[a1 containsMonthTitle];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
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

id objc_msgSend_contextualActionWithStyle_title_handler_(void *a1, const char *a2, ...)
{
  return [a1 contextualActionWithStyle:title:handler:];
}

id objc_msgSend_continueButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 continueButtonTitle];
}

id objc_msgSend_continueUserActivity_(void *a1, const char *a2, ...)
{
  return [a1 continueUserActivity:];
}

id objc_msgSend_controlCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 controlCharacterSet];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toView:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countLabelTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 countLabelTopConstraint];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return _[a1 countUnit];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentCompetition(void *a1, const char *a2, ...)
{
  return _[a1 currentCompetition];
}

id objc_msgSend_currentExerciseGoal(void *a1, const char *a2, ...)
{
  return _[a1 currentExerciseGoal];
}

id objc_msgSend_currentFilteredTypeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentFilteredTypeIdentifier];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return _[a1 currentItem];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentMoveGoal(void *a1, const char *a2, ...)
{
  return _[a1 currentMoveGoal];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_currentPhase(void *a1, const char *a2, ...)
{
  return _[a1 currentPhase];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentSelectedDate(void *a1, const char *a2, ...)
{
  return _[a1 currentSelectedDate];
}

id objc_msgSend_currentSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 currentSnapshot];
}

id objc_msgSend_currentStandGoal(void *a1, const char *a2, ...)
{
  return _[a1 currentStandGoal];
}

id objc_msgSend_currentWeekStartDate(void *a1, const char *a2, ...)
{
  return _[a1 currentWeekStartDate];
}

id objc_msgSend_currentlySelectedSwimmingPaceFormat(void *a1, const char *a2, ...)
{
  return _[a1 currentlySelectedSwimmingPaceFormat];
}

id objc_msgSend_customSplits(void *a1, const char *a2, ...)
{
  return _[a1 customSplits];
}

id objc_msgSend_customSplitsForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 customSplitsForWorkout:workoutActivity:completion:];
}

id objc_msgSend_cyclingSpeedSamples(void *a1, const char *a2, ...)
{
  return _[a1 cyclingSpeedSamples];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 darkGrayColor];
}

id objc_msgSend_darkeningLayer(void *a1, const char *a2, ...)
{
  return _[a1 darkeningLayer];
}

id objc_msgSend_dataAvailable(void *a1, const char *a2, ...)
{
  return _[a1 dataAvailable];
}

id objc_msgSend_dataCalculator(void *a1, const char *a2, ...)
{
  return _[a1 dataCalculator];
}

id objc_msgSend_dataProvider(void *a1, const char *a2, ...)
{
  return _[a1 dataProvider];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:options:error:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingUnit:value:toDate:options:];
}

id objc_msgSend_dateBySettingUnit_value_ofDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateBySettingUnit:value:ofDate:options:];
}

id objc_msgSend_dateCache(void *a1, const char *a2, ...)
{
  return _[a1 dateCache];
}

id objc_msgSend_dateFont(void *a1, const char *a2, ...)
{
  return _[a1 dateFont];
}

id objc_msgSend_dateFormatFromTemplate_options_locale_(void *a1, const char *a2, ...)
{
  return [a1 dateFormatFromTemplate:options:locale:];
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return [a1 dateFromComponents:];
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return [a1 dateFromString:];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return _[a1 dateInterval];
}

id objc_msgSend_dateOfBirth(void *a1, const char *a2, ...)
{
  return _[a1 dateOfBirth];
}

id objc_msgSend_dateSelected_(void *a1, const char *a2, ...)
{
  return [a1 dateSelected:];
}

id objc_msgSend_dateTopMargin(void *a1, const char *a2, ...)
{
  return _[a1 dateTopMargin];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_dayCells(void *a1, const char *a2, ...)
{
  return _[a1 dayCells];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 deactivateConstraints:];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultCircularRingImageForContext_(void *a1, const char *a2, ...)
{
  return [a1 defaultCircularRingImageForContext:];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultContentConfiguration];
}

id objc_msgSend_defaultFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 defaultFontForTextStyle:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_degreeCelsiusUnit(void *a1, const char *a2, ...)
{
  return _[a1 degreeCelsiusUnit];
}

id objc_msgSend_degreeFahrenheitUnit(void *a1, const char *a2, ...)
{
  return _[a1 degreeFahrenheitUnit];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteArchivedSessionForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 deleteArchivedSessionForWorkout:];
}

id objc_msgSend_deleteObject_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 deleteObject:withCompletion:];
}

id objc_msgSend_deleteObjectsOfType_predicate_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 deleteObjectsOfType:predicate:withCompletion:];
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 deleteRowsAtIndexPaths:withRowAnimation:];
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSections:withRowAnimation:");
}

id objc_msgSend_deleteWorkout_shouldDeleteAssociatedSamples_completion_(void *a1, const char *a2, ...)
{
  return [a1 deleteWorkout:shouldDeleteAssociatedSamples:completion:];
}

id objc_msgSend_demoExertionForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 demoExertionForWorkout:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithReuseIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableHeaderFooterViewWithIdentifier:];
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return _[a1 descriptorForRequiredKeys];
}

id objc_msgSend_deselectItemAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectItemAtIndexPath:animated:];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectRowAtIndexPath:animated:];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_destinationStripped(void *a1, const char *a2, ...)
{
  return _[a1 destinationStripped];
}

id objc_msgSend_detachPalette(void *a1, const char *a2, ...)
{
  return _[a1 detachPalette];
}

id objc_msgSend_detachPalette_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detachPalette:");
}

id objc_msgSend_detailLineOneLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailLineOneLabel];
}

id objc_msgSend_detailLineTwoLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailLineTwoLabel];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_detailViewControllerForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 detailViewControllerForWorkout:];
}

id objc_msgSend_detailViewDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 detailViewDateFormatter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didAppear(void *a1, const char *a2, ...)
{
  return _[a1 didAppear];
}

id objc_msgSend_didExpandDetailSection_(void *a1, const char *a2, ...)
{
  return [a1 didExpandDetailSection:];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_didPresentMediaMomentItem(void *a1, const char *a2, ...)
{
  return _[a1 didPresentMediaMomentItem];
}

id objc_msgSend_didSetInitialSwimmingPaceFormat(void *a1, const char *a2, ...)
{
  return _[a1 didSetInitialSwimmingPaceFormat];
}

id objc_msgSend_didSetupBadgeView(void *a1, const char *a2, ...)
{
  return _[a1 didSetupBadgeView];
}

id objc_msgSend_didTapEditPregnancy(void *a1, const char *a2, ...)
{
  return _[a1 didTapEditPregnancy];
}

id objc_msgSend_didTapInboxBarButtonView_(void *a1, const char *a2, ...)
{
  return [a1 didTapInboxBarButtonView:];
}

id objc_msgSend_didUpdateDemoOverrideEffortValues(void *a1, const char *a2, ...)
{
  return _[a1 didUpdateDemoOverrideEffortValues];
}

id objc_msgSend_didUpdatePauseStateNotification(void *a1, const char *a2, ...)
{
  return _[a1 didUpdatePauseStateNotification];
}

id objc_msgSend_didWinRace(void *a1, const char *a2, ...)
{
  return _[a1 didWinRace];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 directionalLayoutMargins];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _[a1 dismiss];
}

id objc_msgSend_dismissRemoteViewControllerOnHostController_(void *a1, const char *a2, ...)
{
  return [a1 dismissRemoteViewControllerOnHostController];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:YES completion:nil];
}

id objc_msgSend_displayContextWithName_(void *a1, const char *a2, ...)
{
  return [a1 displayContextWithName:];
}

id objc_msgSend_displayDetail_(void *a1, const char *a2, ...)
{
  return [a1 displayDetail:];
}

id objc_msgSend_displayFilter(void *a1, const char *a2, ...)
{
  return _[a1 displayFilter];
}

id objc_msgSend_displayMode(void *a1, const char *a2, ...)
{
  return _[a1 displayMode];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return _[a1 displayString];
}

id objc_msgSend_displaysEarnedInstanceCount(void *a1, const char *a2, ...)
{
  return _[a1 displaysEarnedInstanceCount];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _[a1 distance];
}

id objc_msgSend_distanceColors(void *a1, const char *a2, ...)
{
  return _[a1 distanceColors];
}

id objc_msgSend_distanceGoalAchievedTime(void *a1, const char *a2, ...)
{
  return _[a1 distanceGoalAchievedTime];
}

id objc_msgSend_distanceInMeters(void *a1, const char *a2, ...)
{
  return _[a1 distanceInMeters];
}

id objc_msgSend_distanceInUserDistanceUnitForDistanceInMeters_distanceType_(void *a1, const char *a2, ...)
{
  return [a1 distanceInUserDistanceUnitForDistanceInMeters:distanceType:];
}

id objc_msgSend_distanceInUserUnit(void *a1, const char *a2, ...)
{
  return _[a1 distanceInUserUnit];
}

id objc_msgSend_distanceSamples(void *a1, const char *a2, ...)
{
  return _[a1 distanceSamples];
}

id objc_msgSend_distanceSamplesForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 distanceSamplesForWorkout:workoutActivity:completion:];
}

id objc_msgSend_distanceType(void *a1, const char *a2, ...)
{
  return _[a1 distanceType];
}

id objc_msgSend_distanceUnit(void *a1, const char *a2, ...)
{
  return _[a1 distanceUnit];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_diveColors(void *a1, const char *a2, ...)
{
  return _[a1 diveColors];
}

id objc_msgSend_divingDataCalculator(void *a1, const char *a2, ...)
{
  return _[a1 divingDataCalculator];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_dominantStrokeStyle(void *a1, const char *a2, ...)
{
  return _[a1 dominantStrokeStyle];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_doubleValueForUnit_(void *a1, const char *a2, ...)
{
  return [a1 doubleValueForUnit:];
}

id objc_msgSend_downhillRun(void *a1, const char *a2, ...)
{
  return _[a1 downhillRun];
}

id objc_msgSend_downhillRunEventsBridge(void *a1, const char *a2, ...)
{
  return _[a1 downhillRunEventsBridge];
}

id objc_msgSend_downhillRunIndex(void *a1, const char *a2, ...)
{
  return _[a1 downhillRunIndex];
}

id objc_msgSend_downhillRuns(void *a1, const char *a2, ...)
{
  return _[a1 downhillRuns];
}

id objc_msgSend_downhillRunsForWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 downhillRunsForWorkout:completion:];
}

id objc_msgSend_downhillRunsStats(void *a1, const char *a2, ...)
{
  return _[a1 downhillRunsStats];
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 drawAtPoint:];
}

id objc_msgSend_drawAtPoint_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawAtPoint:blendMode:alpha:");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_drawInRect_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:blendMode:alpha:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_durationScaledToFillSplit(void *a1, const char *a2, ...)
{
  return _[a1 durationScaledToFillSplit];
}

id objc_msgSend_earliestDateToTileForMonth_(void *a1, const char *a2, ...)
{
  return [a1 earliestDateToTileForMonth:];
}

id objc_msgSend_earnedDateComponents(void *a1, const char *a2, ...)
{
  return _[a1 earnedDateComponents];
}

id objc_msgSend_earnedInstanceCount(void *a1, const char *a2, ...)
{
  return _[a1 earnedInstanceCount];
}

id objc_msgSend_earnedInstanceCountLabelView(void *a1, const char *a2, ...)
{
  return _[a1 earnedInstanceCountLabelView];
}

id objc_msgSend_earnedInstances(void *a1, const char *a2, ...)
{
  return _[a1 earnedInstances];
}

id objc_msgSend_editedSettingsController(void *a1, const char *a2, ...)
{
  return _[a1 editedSettingsController];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_effectiveTypeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveTypeIdentifier];
}

id objc_msgSend_effortForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effortForWorkout:workoutActivity:completion:");
}

id objc_msgSend_effortSampleCollection(void *a1, const char *a2, ...)
{
  return _[a1 effortSampleCollection];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_elapsedTimeColors(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeColors];
}

id objc_msgSend_elevationColors(void *a1, const char *a2, ...)
{
  return _[a1 elevationColors];
}

id objc_msgSend_elevationDescended(void *a1, const char *a2, ...)
{
  return _[a1 elevationDescended];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 emailAddresses];
}

id objc_msgSend_emptyKey(void *a1, const char *a2, ...)
{
  return _[a1 emptyKey];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 endDiscovery];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return [a1 endEditing:];
}

id objc_msgSend_endRefreshing(void *a1, const char *a2, ...)
{
  return _[a1 endRefreshing];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_energyBurned(void *a1, const char *a2, ...)
{
  return _[a1 energyBurned];
}

id objc_msgSend_energyBurnedGoal(void *a1, const char *a2, ...)
{
  return _[a1 energyBurnedGoal];
}

id objc_msgSend_energyBurnedInUserUnitForCalories_(void *a1, const char *a2, ...)
{
  return [a1 energyBurnedInUserUnitForCalories:];
}

id objc_msgSend_energyColors(void *a1, const char *a2, ...)
{
  return _[a1 energyColors];
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateValidDisplayModesForFilter_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateValidDisplayModesForFilter:usingBlock:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_executeQuery_(void *a1, const char *a2, ...)
{
  return [a1 executeQuery:];
}

id objc_msgSend_exerciseGoal(void *a1, const char *a2, ...)
{
  return _[a1 exerciseGoal];
}

id objc_msgSend_existsWorkoutOnCacheIndex_(void *a1, const char *a2, ...)
{
  return [a1 existsWorkoutOnCacheIndex:];
}

id objc_msgSend_expandButton(void *a1, const char *a2, ...)
{
  return _[a1 expandButton];
}

id objc_msgSend_expanded(void *a1, const char *a2, ...)
{
  return _[a1 expanded];
}

id objc_msgSend_expandingHeaderView_didChangeExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expandingHeaderView:didChangeExpanded:");
}

id objc_msgSend_expectedIntervalDistanceForStepKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 expectedIntervalDistanceForStepKeyPath:];
}

id objc_msgSend_expectedIntervalDurationForStepKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 expectedIntervalDurationForStepKeyPath:];
}

id objc_msgSend_expectedSplitDistance(void *a1, const char *a2, ...)
{
  return _[a1 expectedSplitDistance];
}

id objc_msgSend_extraProminentInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 extraProminentInsetGroupedHeaderConfiguration];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return _[a1 features];
}

id objc_msgSend_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:completion:");
}

id objc_msgSend_fetchAvatarImageForFriend_diameter_(void *a1, const char *a2, ...)
{
  return [a1 fetchAvatarImageForFriend:diameter:];
}

id objc_msgSend_fetchCatalogArtworkForCatalogItemViewModel_imageSize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCatalogArtworkForCatalogItemViewModel:imageSize:completion:");
}

id objc_msgSend_fetchCatalogItemViewModelForWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchCatalogItemViewModelForWorkout:completion:];
}

id objc_msgSend_fetchExertionForWorkout_workoutActivity_healthStore_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchExertionForWorkout:workoutActivity:healthStore:completion:");
}

id objc_msgSend_fetchIconImageForWorkout_context_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchIconImageForWorkout:context:completion:];
}

id objc_msgSend_fetchIconWithCHIconParameters_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchIconWithCHIconParameters:withCompletion:");
}

id objc_msgSend_fetchLocations(void *a1, const char *a2, ...)
{
  return _[a1 fetchLocations];
}

id objc_msgSend_fetchLocationsFromWorkout_applyThreshold_withSamplesHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchLocationsFromWorkout:applyThreshold:withSamplesHandler:];
}

id objc_msgSend_fetchLocationsFromWorkout_workoutActivity_samplesHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchLocationsFromWorkout:workoutActivity:samplesHandler:];
}

id objc_msgSend_fetchPhoneIconWithParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPhoneIconWithParameters:completion:");
}

id objc_msgSend_fetchReachableDestinationsFor_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchReachableDestinationsFor:completion:];
}

id objc_msgSend_fetchScoreSummaryForWorkout_healthStore_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchScoreSummaryForWorkout:healthStore:completion:];
}

id objc_msgSend_fetchWatchAppBundleIDForCompanionAppBundleID_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchWatchAppBundleIDForCompanionAppBundleID:completion:];
}

id objc_msgSend_fetchWatchIconWithParameters_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchWatchIconWithParameters:completion:];
}

id objc_msgSend_fi_swimmingLocationType(void *a1, const char *a2, ...)
{
  return [a1 fi_swimmingLocationType];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 filledButtonConfiguration];
}

id objc_msgSend_filledWorkoutCircleWithSize_(void *a1, const char *a2, ...)
{
  return [a1 filledWorkoutCircleWithSize:];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filteredArrayUsingPredicate:];
}

id objc_msgSend_finishEnteringRecipient(void *a1, const char *a2, ...)
{
  return _[a1 finishEnteringRecipient];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstCoordinate(void *a1, const char *a2, ...)
{
  return _[a1 firstCoordinate];
}

id objc_msgSend_firstCoordinateUpdatedBlock(void *a1, const char *a2, ...)
{
  return _[a1 firstCoordinateUpdatedBlock];
}

id objc_msgSend_firstDayOfMonthCellIndex(void *a1, const char *a2, ...)
{
  return _[a1 firstDayOfMonthCellIndex];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fitnessAppContext(void *a1, const char *a2, ...)
{
  return _[a1 fitnessAppContext];
}

id objc_msgSend_fitnessColors(void *a1, const char *a2, ...)
{
  return _[a1 fitnessColors];
}

id objc_msgSend_fitnessMode(void *a1, const char *a2, ...)
{
  return _[a1 fitnessMode];
}

id objc_msgSend_fitnessStartOfWeekOffset(void *a1, const char *a2, ...)
{
  return _[a1 fitnessStartOfWeekOffset];
}

id objc_msgSend_fitnessUIFormattingManager(void *a1, const char *a2, ...)
{
  return _[a1 fitnessUIFormattingManager];
}

id objc_msgSend_fiui_activityType(void *a1, const char *a2, ...)
{
  return [a1 fiui_activityType];
}

id objc_msgSend_fiui_appendHeartRate_date_(void *a1, const char *a2, ...)
{
  return [a1 fiui_appendHeartRate:date:];
}

id objc_msgSend_fiui_averageCadence(void *a1, const char *a2, ...)
{
  return [a1 fiui_averageCadence];
}

id objc_msgSend_fiui_averagePace(void *a1, const char *a2, ...)
{
  return [a1 fiui_averagePace];
}

id objc_msgSend_fiui_averagePower(void *a1, const char *a2, ...)
{
  return [a1 fiui_averagePower];
}

id objc_msgSend_fiui_completionFactor(void *a1, const char *a2, ...)
{
  return [a1 fiui_completionFactor];
}

id objc_msgSend_fiui_connectedGymBrandName(void *a1, const char *a2, ...)
{
  return [a1 fiui_connectedGymBrandName];
}

id objc_msgSend_fiui_customSplits(void *a1, const char *a2, ...)
{
  return [a1 fiui_customSplits];
}

id objc_msgSend_fiui_dateInterval(void *a1, const char *a2, ...)
{
  return [a1 fiui_dateInterval];
}

id objc_msgSend_fiui_distanceGoalCompletionTime(void *a1, const char *a2, ...)
{
  return [a1 fiui_distanceGoalCompletionTime];
}

id objc_msgSend_fiui_duration(void *a1, const char *a2, ...)
{
  return [a1 fiui_duration];
}

id objc_msgSend_fiui_hasAveragePace(void *a1, const char *a2, ...)
{
  return [a1 fiui_hasAveragePace];
}

id objc_msgSend_fiui_isConnectedGymWorkout(void *a1, const char *a2, ...)
{
  return [a1 fiui_isConnectedGymWorkout];
}

id objc_msgSend_fiui_isNonzero(void *a1, const char *a2, ...)
{
  return [a1 fiui_isNonzero];
}

id objc_msgSend_fiui_lapLength(void *a1, const char *a2, ...)
{
  return [a1 fiui_lapLength];
}

id objc_msgSend_fiui_splitsForUserPreferredDistanceUnit_(void *a1, const char *a2, ...)
{
  return [a1 fiui_splitsForUserPreferredDistanceUnit:];
}

id objc_msgSend_fiui_strokeStyle(void *a1, const char *a2, ...)
{
  return [a1 fiui_strokeStyle];
}

id objc_msgSend_fiui_swimmingLocationType(void *a1, const char *a2, ...)
{
  return [a1 fiui_swimmingLocationType];
}

id objc_msgSend_fiui_totalDistance(void *a1, const char *a2, ...)
{
  return [a1 fiui_totalDistance];
}

id objc_msgSend_fiui_totalStepCount(void *a1, const char *a2, ...)
{
  return [a1 fiui_totalStepCount];
}

id objc_msgSend_fiui_weightedAverageHeartRateWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 fiui_weightedAverageHeartRateWithStartDate:endDate:];
}

id objc_msgSend_fiui_workoutCustomSplits(void *a1, const char *a2, ...)
{
  return [a1 fiui_workoutCustomSplits];
}

id objc_msgSend_fiui_workoutSplitsForUserPreferredDistanceUnit_(void *a1, const char *a2, ...)
{
  return [a1 fiui_workoutSplitsForUserPreferredDistanceUnit];
}

id objc_msgSend_flashScrollIndicators(void *a1, const char *a2, ...)
{
  return _[a1 flashScrollIndicators];
}

id objc_msgSend_flattenedImageWithColor_(void *a1, const char *a2, ...)
{
  return [a1 flattenedImageWithColor:];
}

id objc_msgSend_flightsClimbedColors(void *a1, const char *a2, ...)
{
  return _[a1 flightsClimbedColors];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushMetricEvents(void *a1, const char *a2, ...)
{
  return _[a1 flushMetricEvents];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorByAddingAttributes:];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorWithSymbolicTraits:];
}

id objc_msgSend_fontSizeChanged_(void *a1, const char *a2, ...)
{
  return [a1 fontSizeChanged:];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_forCompanion(void *a1, const char *a2, ...)
{
  return _[a1 forCompanion];
}

id objc_msgSend_forDayView(void *a1, const char *a2, ...)
{
  return _[a1 forDayView];
}

id objc_msgSend_forModalPresentation(void *a1, const char *a2, ...)
{
  return _[a1 forModalPresentation];
}

id objc_msgSend_forceCloudSyncDataUploadForProfileWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 forceCloudSyncDataUploadForProfileWithCompletion:];
}

id objc_msgSend_forceNanoSyncWithOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 forceNanoSyncWithOptions:completion:];
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return [a1 formUnionWithCharacterSet:];
}

id objc_msgSend_formattedActiveEnergyForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedActiveEnergyForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedActiveEnergyValueForUnit_(void *a1, const char *a2, ...)
{
  return [a1 formattedActiveEnergyValueForUnit:];
}

id objc_msgSend_formattedAverageActiveEnergyBurnWithFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 formattedAverageActiveEnergyBurnWithFormattingManager:];
}

id objc_msgSend_formattedAverageCadenceForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedAverageCadenceForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedAveragePowerForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedAveragePowerForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedAveragePowerStringFor_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedAveragePowerStringFor:context:];
}

id objc_msgSend_formattedAverageSwimPaceWithDuration_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedAverageSwimPaceWithDuration:context:];
}

id objc_msgSend_formattedAverageWorkoutDurationWithFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 formattedAverageWorkoutDurationWithFormattingManager:];
}

id objc_msgSend_formattedCount_color_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedCount:color:context:];
}

id objc_msgSend_formattedDateForWorkout_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedDateForWorkout:context:];
}

id objc_msgSend_formattedDescriptionForWorkout_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedDescriptionForWorkout:context:];
}

id objc_msgSend_formattedDistanceByStrokeStyle_isPoolSwim_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedDistanceByStrokeStyle:isPoolSwim:context:];
}

id objc_msgSend_formattedDistanceForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedDistanceForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedDistanceValueForUnit_(void *a1, const char *a2, ...)
{
  return [a1 formattedDistanceValueForUnit:];
}

id objc_msgSend_formattedDistanceWithFormattingManager_distanceType_amountType_(void *a1, const char *a2, ...)
{
  return [a1 formattedDistanceWithFormattingManager:];
}

id objc_msgSend_formattedDownhillRunsCount_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedDownhillRunsCount:context:];
}

id objc_msgSend_formattedDurationForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedDurationForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedElapsedTimeForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedElapsedTimeForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedElevation_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedElevation:context:];
}

id objc_msgSend_formattedElevationGainForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedElevationGainForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedEnergyBurn_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedEnergyBurn:context:];
}

id objc_msgSend_formattedFlightsClimbedForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedFlightsClimbedForWorkout:workoutActivity:context:");
}

id objc_msgSend_formattedGoalCompletedDurationForWorkout_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedGoalCompletedDurationForWorkout:context:];
}

id objc_msgSend_formattedGoalForWorkout_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedGoalForWorkout:context:];
}

id objc_msgSend_formattedHeartRate_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedHeartRate:context:];
}

id objc_msgSend_formattedLapCountForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedLapCountForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedListStringForDate_font_(void *a1, const char *a2, ...)
{
  return [a1 formattedListStringForDate:font:];
}

id objc_msgSend_formattedPaceOrSpeedForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedPaceOrSpeedForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedPaceOrSpeedWithDistance_overDuration_activityType_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedPaceOrSpeedWithDistance:overDuration:activityType:context:];
}

id objc_msgSend_formattedPaceWithFormattingManager_distanceType_(void *a1, const char *a2, ...)
{
  return [a1 formattedPaceWithFormattingManager:];
}

id objc_msgSend_formattedPoolLengthForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedPoolLengthForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedPowerStringFor_(void *a1, const char *a2, ...)
{
  return [a1 formattedPowerStringFor:];
}

id objc_msgSend_formattedRacePaceOrSpeedForWorkout_metersPerSecond_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedRacePaceOrSpeedForWorkout:metersPerSecond:context:];
}

id objc_msgSend_formattedRaceTimeForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedRaceTimeForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedSessionCount(void *a1, const char *a2, ...)
{
  return _[a1 formattedSessionCount];
}

id objc_msgSend_formattedStepCountForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedStepCountForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedTimeRangeForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedTimeRangeForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedTotalActiveEnergyBurnWithFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 formattedTotalActiveEnergyBurnWithFormattingManager:];
}

id objc_msgSend_formattedTotalDurationWithFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 formattedTotalDurationWithFormattingManager:];
}

id objc_msgSend_formattedTotalEnergyForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedTotalEnergyForWorkout:workoutActivity:context:];
}

id objc_msgSend_formattedTotalWorkoutDurationWithFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 formattedTotalWorkoutDurationWithFormattingManager:];
}

id objc_msgSend_formattedTypeForWorkout_workoutActivity_context_(void *a1, const char *a2, ...)
{
  return [a1 formattedTypeForWorkout:workoutActivity:context:];
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return _[a1 formatter];
}

id objc_msgSend_formattingManager(void *a1, const char *a2, ...)
{
  return _[a1 formattingManager];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameOrigin(void *a1, const char *a2, ...)
{
  return _[a1 frameOrigin];
}

id objc_msgSend_fridayGoal(void *a1, const char *a2, ...)
{
  return _[a1 fridayGoal];
}

id objc_msgSend_friend(void *a1, const char *a2, ...)
{
  return _[a1 friend];
}

id objc_msgSend_friendAchievements(void *a1, const char *a2, ...)
{
  return _[a1 friendAchievements];
}

id objc_msgSend_friendListManager(void *a1, const char *a2, ...)
{
  return _[a1 friendListManager];
}

id objc_msgSend_friendManager(void *a1, const char *a2, ...)
{
  return _[a1 friendManager];
}

id objc_msgSend_friendWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 friendWithUUID:];
}

id objc_msgSend_friendWorkouts(void *a1, const char *a2, ...)
{
  return _[a1 friendWorkouts];
}

id objc_msgSend_friendsSetupViewController(void *a1, const char *a2, ...)
{
  return _[a1 friendsSetupViewController];
}

id objc_msgSend_friendsSetupViewController_didCompletePhase_(void *a1, const char *a2, ...)
{
  return [a1 friendsSetupViewController:didCompletePhase:];
}

id objc_msgSend_friendsSetupViewControllerDidCompleteSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendsSetupViewControllerDidCompleteSetup:");
}

id objc_msgSend_friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:");
}

id objc_msgSend_fu_fontWithStraightSidedNumbers(void *a1, const char *a2, ...)
{
  return [a1 fu_fontWithStraightSidedNumbers];
}

id objc_msgSend_fu_lightSausageFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 fu_lightSausageFontOfSize:];
}

id objc_msgSend_fu_monospacedFont(void *a1, const char *a2, ...)
{
  return [a1 fu_monospacedFont];
}

id objc_msgSend_fu_sausageFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 fu_sausageFontOfSize:];
}

id objc_msgSend_fu_shortSlashFont(void *a1, const char *a2, ...)
{
  return [a1 fu_shortSlashFont];
}

id objc_msgSend_fu_systemTextGreyColor(void *a1, const char *a2, ...)
{
  return [a1 fu_systemTextGreyColor];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return [a1 functionWithName:];
}

id objc_msgSend_generateHeaders(void *a1, const char *a2, ...)
{
  return _[a1 generateHeaders];
}

id objc_msgSend_getAccountsInfo_(void *a1, const char *a2, ...)
{
  return [a1 getAccountsInfo:];
}

id objc_msgSend_getIconForBundleID_iconVariant_block_timeout_(void *a1, const char *a2, ...)
{
  return [a1 getIconForBundleID:iconVariant:block:timeout:];
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 getNotificationSettingsWithCompletionHandler:];
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 getRed:green:blue:alpha:];
}

id objc_msgSend_goal(void *a1, const char *a2, ...)
{
  return _[a1 goal];
}

id objc_msgSend_goalColor(void *a1, const char *a2, ...)
{
  return _[a1 goalColor];
}

id objc_msgSend_goalDays(void *a1, const char *a2, ...)
{
  return _[a1 goalDays];
}

id objc_msgSend_goalDescriptionFont(void *a1, const char *a2, ...)
{
  return _[a1 goalDescriptionFont];
}

id objc_msgSend_goalProgressAttrStringWithCurrentValue_goalValue_unitString_(void *a1, const char *a2, ...)
{
  return [a1 goalProgressAttrStringWithCurrentValue:goalValue:unitString:];
}

id objc_msgSend_goalQuantityForToday(void *a1, const char *a2, ...)
{
  return _[a1 goalQuantityForToday];
}

id objc_msgSend_goalType(void *a1, const char *a2, ...)
{
  return _[a1 goalType];
}

id objc_msgSend_goalUnitStringFormatter(void *a1, const char *a2, ...)
{
  return _[a1 goalUnitStringFormatter];
}

id objc_msgSend_goalValueStringFormatter(void *a1, const char *a2, ...)
{
  return _[a1 goalValueStringFormatter];
}

id objc_msgSend_gradientDarkColor(void *a1, const char *a2, ...)
{
  return _[a1 gradientDarkColor];
}

id objc_msgSend_gradientLightColor(void *a1, const char *a2, ...)
{
  return _[a1 gradientLightColor];
}

id objc_msgSend_gramUnitWithMetricPrefix_(void *a1, const char *a2, ...)
{
  return [a1 gramUnitWithMetricPrefix:];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_groundContactTimeSamples(void *a1, const char *a2, ...)
{
  return _[a1 groundContactTimeSamples];
}

id objc_msgSend_groupDiameter(void *a1, const char *a2, ...)
{
  return _[a1 groupDiameter];
}

id objc_msgSend_gymKitIconWidth(void *a1, const char *a2, ...)
{
  return _[a1 gymKitIconWidth];
}

id objc_msgSend_handleActivitySharingURL_(void *a1, const char *a2, ...)
{
  return [a1 handleActivitySharingURL:];
}

id objc_msgSend_handleFitnessCoachingNotificationResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFitnessCoachingNotificationResponse:");
}

id objc_msgSend_handleNotificationResponse_completion_(void *a1, const char *a2, ...)
{
  return [a1 handleNotificationResponse:completion:];
}

id objc_msgSend_handleNotificationResponse_presentingNavigationController_healthStore_formattingManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotificationResponse:presentingNavigationController:healthStore:formattingManager:");
}

id objc_msgSend_handleWindowScene_with_(void *a1, const char *a2, ...)
{
  return [a1 handleWindowScene:with:];
}

id objc_msgSend_hasAnyFriendsSetup(void *a1, const char *a2, ...)
{
  return _[a1 hasAnyFriendsSetup];
}

id objc_msgSend_hasAverageCadenceForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 hasAverageCadenceForWorkout:workoutActivity:];
}

id objc_msgSend_hasAverageCyclingPowerForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 hasAverageCyclingPowerForWorkout:workoutActivity:];
}

id objc_msgSend_hasAverageCyclingSpeedForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAverageCyclingSpeedForWorkout:workoutActivity:");
}

id objc_msgSend_hasAveragePowerForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 hasAveragePowerForWorkout:workoutActivity:];
}

id objc_msgSend_hasCachedThumbnailImageForAchievement_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCachedThumbnailImageForAchievement:size:");
}

id objc_msgSend_hasCarriedForwardGoals(void *a1, const char *a2, ...)
{
  return _[a1 hasCarriedForwardGoals];
}

id objc_msgSend_hasChartableMetrics(void *a1, const char *a2, ...)
{
  return _[a1 hasChartableMetrics];
}

id objc_msgSend_hasCompetitionHistory(void *a1, const char *a2, ...)
{
  return _[a1 hasCompetitionHistory];
}

id objc_msgSend_hasConnectedGymVendorIconForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 hasConnectedGymVendorIconForWorkout:];
}

id objc_msgSend_hasCurrentWorkouts(void *a1, const char *a2, ...)
{
  return _[a1 hasCurrentWorkouts];
}

id objc_msgSend_hasDemoWorkouts(void *a1, const char *a2, ...)
{
  return _[a1 hasDemoWorkouts];
}

id objc_msgSend_hasDistanceForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 hasDistanceForWorkout:workoutActivity:];
}

id objc_msgSend_hasElevationAscendedDataForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 hasElevationAscendedDataForWorkout:workoutActivity:];
}

id objc_msgSend_hasFlightsClimbedForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFlightsClimbedForWorkout:workoutActivity:");
}

id objc_msgSend_hasPendingCompetitionRequestFromMe(void *a1, const char *a2, ...)
{
  return _[a1 hasPendingCompetitionRequestFromMe];
}

id objc_msgSend_hasReachedMaxNumberOfFriends(void *a1, const char *a2, ...)
{
  return _[a1 hasReachedMaxNumberOfFriends];
}

id objc_msgSend_hasStepCountForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasStepCountForWorkout:workoutActivity:");
}

id objc_msgSend_hasVisibleAchievements(void *a1, const char *a2, ...)
{
  return _[a1 hasVisibleAchievements];
}

id objc_msgSend_hasVisitedSeymourTabKey(void *a1, const char *a2, ...)
{
  return _[a1 hasVisitedSeymourTabKey];
}

id objc_msgSend_hasWeatherConditionForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasWeatherConditionForWorkout:workoutActivity:");
}

id objc_msgSend_hasWheelchairDataSubmissionAllowedBeenSet(void *a1, const char *a2, ...)
{
  return _[a1 hasWheelchairDataSubmissionAllowedBeenSet];
}

id objc_msgSend_hasWorkouts(void *a1, const char *a2, ...)
{
  return _[a1 hasWorkouts];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerFont(void *a1, const char *a2, ...)
{
  return _[a1 headerFont];
}

id objc_msgSend_headerStringForSection_isRecentAndRelevant_(void *a1, const char *a2, ...)
{
  return [a1 headerStringForSection:isRecentAndRelevant:];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_headerViewForSection_(void *a1, const char *a2, ...)
{
  return [a1 headerViewForSection:];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return _[a1 healthStore];
}

id objc_msgSend_heartRateColors(void *a1, const char *a2, ...)
{
  return _[a1 heartRateColors];
}

id objc_msgSend_heartRateDataForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 heartRateDataForWorkout:workoutActivity:completion:];
}

id objc_msgSend_heartRateReadings(void *a1, const char *a2, ...)
{
  return _[a1 heartRateReadings];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 heightConstraint];
}

id objc_msgSend_heightForCellAtIndex_oneTime_(void *a1, const char *a2, ...)
{
  return [a1 heightForCellAtIndex:oneTime:];
}

id objc_msgSend_heightForWorkoutActivityTypeKey_statistics_(void *a1, const char *a2, ...)
{
  return [a1 heightForWorkoutActivityTypeKey:statistics:];
}

id objc_msgSend_hiddenApplications(void *a1, const char *a2, ...)
{
  return _[a1 hiddenApplications];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return _[a1 hide];
}

id objc_msgSend_highlightWeekdayLabelForDateAndSetDay_(void *a1, const char *a2, ...)
{
  return [a1 highlightWeekdayLabelForDateAndSetDay:];
}

id objc_msgSend_highlightedLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 highlightedLabelColor];
}

id objc_msgSend_highlightedSubLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 highlightedSubLabelColor];
}

id objc_msgSend_historyDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 historyDataProvider];
}

id objc_msgSend_historyFilterDisambiguatesLocationForActivityType_(void *a1, const char *a2, ...)
{
  return [a1 historyFilterDisambiguatesLocationForActivityType:];
}

id objc_msgSend_hkWorkoutFromFriendWorkout(void *a1, const char *a2, ...)
{
  return _[a1 hkWorkoutFromFriendWorkout];
}

id objc_msgSend_hk_configureWithActivitySummary_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_configureWithActivitySummary:animated:");
}

id objc_msgSend_hk_configureWithActivitySummary_isStandaloneFallback_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_configureWithActivitySummary:isStandaloneFallback:animated:completion:");
}

id objc_msgSend_hk_dateByAddingDays_toDate_(void *a1, const char *a2, ...)
{
  return [a1 hk_dateByAddingDays:toDate:];
}

id objc_msgSend_hk_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_hk_filter_(void *a1, const char *a2, ...)
{
  return [a1 hk_filter:];
}

id objc_msgSend_hk_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 hk_firstObjectPassingTest:];
}

id objc_msgSend_hk_gregorianCalendar(void *a1, const char *a2, ...)
{
  return [a1 hk_gregorianCalendar];
}

id objc_msgSend_hk_gregorianCalendarWithUTCTimeZone(void *a1, const char *a2, ...)
{
  return [a1 hk_gregorianCalendarWithUTCTimeZone];
}

id objc_msgSend_hk_map_(void *a1, const char *a2, ...)
{
  return [a1 hk_map:];
}

id objc_msgSend_hk_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 hk_preferredFontForTextStyle:];
}

id objc_msgSend_hk_startOfDateByAddingDays_toDate_(void *a1, const char *a2, ...)
{
  return [a1 hk_startOfDateByAddingDays:];
}

id objc_msgSend_hk_startOfFitnessWeekBeforeDate_(void *a1, const char *a2, ...)
{
  return [a1 hk_startOfFitnessWeekBeforeDate:];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iMessageService(void *a1, const char *a2, ...)
{
  return _[a1 iMessageService];
}

id objc_msgSend_iconForConnectedGymDevice_preferredIconWidth_(void *a1, const char *a2, ...)
{
  return [a1 iconForConnectedGymDevice:preferredIconWidth:];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return _[a1 iconImage];
}

id objc_msgSend_iconImageView(void *a1, const char *a2, ...)
{
  return _[a1 iconImageView];
}

id objc_msgSend_iconVariant2x(void *a1, const char *a2, ...)
{
  return _[a1 iconVariant2x];
}

id objc_msgSend_iconVariant3x(void *a1, const char *a2, ...)
{
  return _[a1 iconVariant3x];
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return [a1 iconWithSystemImageName:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreCompetitionInviteFromFriendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 ignoreCompetitionInviteFromFriendUUID:completion:];
}

id objc_msgSend_ignoreCompetitionRequestFromFriend_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoreCompetitionRequestFromFriend:completion:");
}

id objc_msgSend_ignoreFriendInviteFromFriendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 ignoreFriendInviteFromFriendUUID:completion:];
}

id objc_msgSend_ignoreInvitationFromFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 ignoreInvitationFromFriend:completion:];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageDimension(void *a1, const char *a2, ...)
{
  return _[a1 imageDimension];
}

id objc_msgSend_imageFactory(void *a1, const char *a2, ...)
{
  return _[a1 imageFactory];
}

id objc_msgSend_imageForCacheKey_(void *a1, const char *a2, ...)
{
  return [a1 imageForCacheKey:];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithContentsOfCPBitmapFile_flags_(void *a1, const char *a2, ...)
{
  return [a1 imageWithContentsOfCPBitmapFile:flags:];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_imageWithSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 imageWithSymbolConfiguration:];
}

id objc_msgSend_imageWithTintColor_renderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithTintColor:renderingMode:];
}

id objc_msgSend_incomingTableViewCellDidTapAccept_(void *a1, const char *a2, ...)
{
  return [a1 incomingTableViewCellDidTapAccept:];
}

id objc_msgSend_incomingTableViewCellDidTapIgnore_(void *a1, const char *a2, ...)
{
  return [a1 incomingTableViewCellDidTapIgnore];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObjectPassingTest:];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return _[a1 indexPath];
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForCell:];
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForItem:inSection:];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
}

id objc_msgSend_indexPathsForVisibleRows(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForVisibleRows];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndex:];
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndexesInRange:];
}

id objc_msgSend_indicatorView(void *a1, const char *a2, ...)
{
  return _[a1 indicatorView];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 initForWorkout:];
}

id objc_msgSend_initUsingEarnedShader_(void *a1, const char *a2, ...)
{
  return [a1 initUsingEarnedShader:];
}

id objc_msgSend_initWithAchievement_healthStore_friendListManager_achievementDataProvider_badgeImageFactory_resourceProvider_formattingManager_localizationProvider_pauseRingsCoordinator_fitnessAppContext_workoutFormattingManager_workoutDataProvider_forModalPresentation_shouldShowCelebration_shouldShowEarned_shouldShowAssociatedWorkout_(void *a1, const char *a2, ...)
{
  return [a1 initWithAchievement:healthStore:friendListManager:achievementDataProvider:badgeImageFactory:resourceProvider:formattingManager:localizationProvider:pauseRingsCoordinator:fitnessAppContext:workoutFormattingManager:workoutDataProvider:forModalPresentation:shouldShowCelebration:shouldShowEarned:shouldShowAssociatedWorkout:];
}

id objc_msgSend_initWithAchievement_locProvider_formatsForFriend_forDayView_forModalPresentation_shouldShowCelebration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:");
}

id objc_msgSend_initWithActionIdentifier_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithActionIdentifier:userInfo:];
}

id objc_msgSend_initWithActivityDataProvider_activityDateCache_achievementsDataProvider_balanceDataProvider_pauseRingsCoordinator_historyDataProvider_workoutFormattingManager_workoutDataProvider_friendListManager_friendsSetupCoordinator_chFriendManager_achievementLocalizationProvider_badgeImageFactory_healthStore_fiuiFormattingManager_fitnessAppContext_wheelchairUseCache_trendsAvailabilityManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityDataProvider:activityDateCache:achievementsDataProvider:balanceDataProvider:pauseRingsCoordinator:historyDataProvider:workoutFormattingManager:workoutDataProvider:friendListManager:friendsSetupCoordinator:chFriendManager:achievementLocalizationProvider:badgeImageFactory:healthStore:fiuiFormattingManager:fitnessAppContext:wheelchairUseCache:trendsAvailabilityManager:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithActivityItems_applicationActivities_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityItems:applicationActivities:];
}

id objc_msgSend_initWithActivitySettingsController_showWheelchair_pregnancyStateProvider_showPregnancy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivitySettingsController:showWheelchair:pregnancyStateProvider:showPregnancy:");
}

id objc_msgSend_initWithActivitySharingClient_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivitySharingClient:];
}

id objc_msgSend_initWithAppContext_badgingProvider_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppContext:badgingProvider:delegate:];
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return [a1 initWithArrangedSubviews:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithAutocompleteSearchType_(void *a1, const char *a2, ...)
{
  return [a1 initWithAutocompleteSearchType:];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:target:action:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCategory_domainName_healthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithCategory:domainName:healthStore:];
}

id objc_msgSend_initWithCollectionView_achievements_imageFactory_locProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithCollectionView:achievements:imageFactory:locProvider:];
}

id objc_msgSend_initWithCollectionViewLayout_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithCollectionViewLayout:context:];
}

id objc_msgSend_initWithComponent_(void *a1, const char *a2, ...)
{
  return [a1 initWithComponent:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithContact_address_kind_(void *a1, const char *a2, ...)
{
  return [a1 initWithContact:address:kind:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:];
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return [a1 initWithCustomView:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_MIMEType_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:MIMEType:];
}

id objc_msgSend_initWithDataCalculator_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataCalculator:];
}

id objc_msgSend_initWithDataLinkMonitor_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataLinkMonitor:];
}

id objc_msgSend_initWithDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProvider:];
}

id objc_msgSend_initWithDataProvider_collectionView_localizationProvider_badgeImageFactory_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProvider:collectionView:localizationProvider:badgeImageFactory:];
}

id objc_msgSend_initWithDataProvider_collectionView_recentAndRelevantCollectionView_recentAndRelevantDataSource_localizationProvider_badgeImageFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataProvider:collectionView:recentAndRelevantCollectionView:recentAndRelevantDataSource:localizationProvider:badgeImageFactory:");
}

id objc_msgSend_initWithDataProvider_healthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProvider:healthStore:];
}

id objc_msgSend_initWithDate_andRows_(void *a1, const char *a2, ...)
{
  return [a1 initWithDate:andRows:];
}

id objc_msgSend_initWithDate_quantity_(void *a1, const char *a2, ...)
{
  return [a1 initWithDate:quantity:];
}

id objc_msgSend_initWithDateCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithDateCache:];
}

id objc_msgSend_initWithDateCache_pauseRingsCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 initWithDateCache:pauseRingsCoordinator:];
}

id objc_msgSend_initWithDateCache_workoutsDataProvider_pauseRingsCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateCache:workoutsDataProvider:pauseRingsCoordinator:");
}

id objc_msgSend_initWithDateInterval_(void *a1, const char *a2, ...)
{
  return [a1 initWithDateInterval:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:code:userInfo:];
}

id objc_msgSend_initWithDownhillRunBridges_(void *a1, const char *a2, ...)
{
  return [a1 initWithDownhillRunBridges:];
}

id objc_msgSend_initWithDownhillRunDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithDownhillRunDataSource:];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithFitnessAppContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithFitnessAppContext:];
}

id objc_msgSend_initWithFitnessAppContext_activitySharingClient_(void *a1, const char *a2, ...)
{
  return [a1 initWithFitnessAppContext:activitySharingClient:];
}

id objc_msgSend_initWithFitnessPlusAvailable_buttonHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithFitnessPlusAvailable:buttonHandler:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_badgeImageFactory_locProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:badgeImageFactory:locProvider:];
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:collectionViewLayout:];
}

id objc_msgSend_initWithFrame_configuration_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:configuration:];
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:style:];
}

id objc_msgSend_initWithFriendListManager_andWithFriendManager_achievementsDataProvider_workoutsDataProvider_workoutFormattingManager_formattingManager_badgeImageFactory_healthStore_fitnessAppContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFriendListManager:andWithFriendManager:achievementsDataProvider:workoutsDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:");
}

id objc_msgSend_initWithFriendListManager_friendManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithFriendListManager:friendManager:];
}

id objc_msgSend_initWithFriendListManager_friendManager_achievementsDataProvider_workoutsDataProvider_workoutFormattingManager_formattingManager_badgeImageFactory_healthStore_fitnessAppContext_makeFriendDetailViewControllerBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithFriendListManager:friendManager:achievementsDataProvider:workoutsDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:makeFriendDetailViewControllerBlock:];
}

id objc_msgSend_initWithFriendListManager_friendManager_friend_snapshot_snapshotDate_achievementsDataProvider_workoutDataProvider_workoutFormattingManager_formattingManager_badgeImageFactory_healthStore_fitnessAppContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFriendListManager:friendManager:friend:snapshot:snapshotDate:achievementsDataProvider:workoutDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:");
}

id objc_msgSend_initWithFriendManager_friendListSectionManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithFriendManager:friendListSectionManager:];
}

id objc_msgSend_initWithGoalSchedule_(void *a1, const char *a2, ...)
{
  return [a1 initWithGoalSchedule:];
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:];
}

id objc_msgSend_initWithHealthStore_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:delegate:];
}

id objc_msgSend_initWithHealthStore_diveSession_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:diveSession:formattingManager:];
}

id objc_msgSend_initWithHealthStore_fitnessAppContext_activityDataProvider_pauseRingsCoordinator_historyDataProvider_achievementsDataProvider_achievementLocalizationProvider_fiuiModel_badgeImageFactory_friendListManager_fiuiFormattingManager_workoutFormattingManager_activityDateCache_trendsAvailabilityManager_wheelchairUseCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:fitnessAppContext:activityDataProvider:pauseRingsCoordinator:historyDataProvider:achievementsDataProvider:achievementLocalizationProvider:fiuiModel:badgeImageFactory:friendListManager:fiuiFormattingManager:workoutFormattingManager:activityDateCache:trendsAvailabilityManager:wheelchairUseCache:");
}

id objc_msgSend_initWithHealthStore_gregorianCalendar_historyDataProvider_activityDataProvider_isFaking_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:gregorianCalendar:historyDataProvider:activityDataProvider:isFaking:];
}

id objc_msgSend_initWithHealthStore_layoutMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:layoutMode:];
}

id objc_msgSend_initWithHealthStore_seymourAvailabilityManager_wheelchairUseCache_formattingManager_pregnancyStateProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:seymourAvailabilityManager:wheelchairUseCache:formattingManager:pregnancyStateProvider:];
}

id objc_msgSend_initWithHealthStore_unitManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithHealthStore:unitManager:];
}

id objc_msgSend_initWithHealthStore_wheelchairUseCache_workoutDataProvider_achievementsDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:wheelchairUseCache:workoutDataProvider:achievementsDataProvider:");
}

id objc_msgSend_initWithIconImage_routeImage_metricTitleAndValueInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithIconImage:routeImage:metricTitleAndValueInfo:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithImage_menu_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:menu:];
}

id objc_msgSend_initWithImage_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:style:target:action:];
}

id objc_msgSend_initWithIntervalDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithIntervalDataSource];
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithItems:];
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return [a1 initWithLatitude:longitude:];
}

id objc_msgSend_initWithLocation_workout_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocation:workout:];
}

id objc_msgSend_initWithLocationReadings_title_sharingEnabled_shareText_excludedActivityTypes_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocationReadings:title:sharingEnabled:shareText:excludedActivityTypes:];
}

id objc_msgSend_initWithMaximumRingCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithMaximumRingCount:];
}

id objc_msgSend_initWithMetricsVersion_activityType_activityMoveMode_deviceSupportsElevationMetrics_deviceSupportsGroundElevationMetrics_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:];
}

id objc_msgSend_initWithMigrationKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithMigrationKeys:];
}

id objc_msgSend_initWithModel_activitySharingClient_workoutDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithModel:activitySharingClient:workoutDataProvider:];
}

id objc_msgSend_initWithNextMoveMode_notificationType_healthStore_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithNextMoveMode:notificationType:healthStore:formattingManager:];
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithNibName:nil bundle:nil];
}

id objc_msgSend_initWithNumberOfRings_(void *a1, const char *a2, ...)
{
  return [a1 initWithNumberOfRings:];
}

id objc_msgSend_initWithOutgoingInvites_(void *a1, const char *a2, ...)
{
  return [a1 initWithOutgoingInvites:];
}

id objc_msgSend_initWithPathRendererClass_(void *a1, const char *a2, ...)
{
  return [a1 initWithPathRendererClass:];
}

id objc_msgSend_initWithPauseRingsCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 initWithPauseRingsCoordinator:];
}

id objc_msgSend_initWithPlatformImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithPlatformImage:];
}

id objc_msgSend_initWithPredicate_anchor_options_resultsHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithPredicate:anchor:options:resultsHandler:];
}

id objc_msgSend_initWithPredicate_resultsHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithPredicate:resultsHandler:];
}

id objc_msgSend_initWithPresentationContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentationContext:];
}

id objc_msgSend_initWithPresentationContext_goalType_editTodayOnly_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentationContext:goalType:editTodayOnly:];
}

id objc_msgSend_initWithPresentationContext_pregnancyStateProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentationContext:pregnancyStateProvider:];
}

id objc_msgSend_initWithPresentingViewController_detailViewController_shouldPlayFlipInAnimation_initialBadgeFrame_conversionView_didStartAnimationBlock_didFinishAnimationBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:didStartAnimationBlock:didFinishAnimationBlock:];
}

id objc_msgSend_initWithPresentingViewController_detailViewController_shouldPlayFlipInAnimation_initialBadgeFrame_conversionView_presentAlongsideBlock_dismissAlongsideBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:");
}

id objc_msgSend_initWithProgressViewStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithProgressViewStyle:];
}

id objc_msgSend_initWithQuantitySamples_(void *a1, const char *a2, ...)
{
  return [a1 initWithQuantitySamples:];
}

id objc_msgSend_initWithQuantityType_predicate_quantityHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithQuantityType:predicate:quantityHandler:];
}

id objc_msgSend_initWithQuantityType_quantitySamplePredicate_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithRingGroup_(void *a1, const char *a2, ...)
{
  return [a1 initWithRingGroup:];
}

id objc_msgSend_initWithRingGroups_(void *a1, const char *a2, ...)
{
  return [a1 initWithRingGroups:];
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithSBSApplicationShortcutIcon_(void *a1, const char *a2, ...)
{
  return [a1 initWithSBSApplicationShortcutIcon:];
}

id objc_msgSend_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:");
}

id objc_msgSend_initWithSamples_(void *a1, const char *a2, ...)
{
  return [a1 initWithSamples:];
}

id objc_msgSend_initWithSegmentDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithSegmentDataSource:];
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return [a1 initWithSettings:];
}

id objc_msgSend_initWithSizingDelegate_dateProvider_pauseRingsCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 initWithSizingDelegate:dateProvider:pauseRingsCoordinator:];
}

id objc_msgSend_initWithSplitDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithSplitDataSource:];
}

id objc_msgSend_initWithSplitDelimiterDistance_distanceInUserUnit_strokeCount_duration_(void *a1, const char *a2, ...)
{
  return [a1 initWithSplitDelimiterDistance:distanceInUserUnit:strokeCount:duration:];
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartDate:duration:];
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartDate:endDate:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithStringValue:];
}

id objc_msgSend_initWithStyle_achievement_achLocalizationProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:achievement:achLocalizationProvider:];
}

id objc_msgSend_initWithStyle_diameter_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:diameter:];
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:reuseIdentifier:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithSwimmingSetDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithSwimmingSetDataSource];
}

id objc_msgSend_initWithSwimmingSplitDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithSwimmingSplitDataSource:];
}

id objc_msgSend_initWithSystemImageName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSystemImageName:];
}

id objc_msgSend_initWithTabBarController_fitnessAppContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithTabBarController:fitnessAppContext:];
}

id objc_msgSend_initWithTabBarController_healthStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithTabBarController:healthStore:];
}

id objc_msgSend_initWithTableView_dataProvider_fitnessAppContext_formattingManager_badgeImageFactory_awardsDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithTableView:dataProvider:fitnessAppContext:formattingManager:badgeImageFactory:awardsDataProvider:];
}

id objc_msgSend_initWithTableView_workout_workoutActivity_healthStore_model_fitnessAppContext_formattingManager_badgeImageFactory_achievementLocalizationProvider_awardsDataProvider_fiuiFormattingManager_showCurrentWorkloadButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTableView:workout:workoutActivity:healthStore:model:fitnessAppContext:formattingManager:badgeImageFactory:achievementLocalizationProvider:awardsDataProvider:fiuiFormattingManager:showCurrentWorkloadButton:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTitle_menu_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:menu:];
}

id objc_msgSend_initWithTitle_passwordLength_supportedOrientations_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:passwordLength:supportedOrientations:];
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:style:target:action:];
}

id objc_msgSend_initWithTrackLapDataSource_(void *a1, const char *a2, ...)
{
  return [a1 initWithTrackLapDataSource:];
}

id objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:clientIdentifier:clientVersion:bag:];
}

id objc_msgSend_initWithType_localizedTitle_localizedSubtitle_icon_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:localizedTitle:localizedSubtitle:icon:userInfo:];
}

id objc_msgSend_initWithType_predicate_anchor_limit_resultsHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:predicate:anchor:limit:resultsHandler:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUnitManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithUnitManager:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_initWithWorkout_dataCalculator_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkout:dataCalculator:formattingManager:];
}

id objc_msgSend_initWithWorkout_dataCalculator_trackDistanceUnit_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkout:dataCalculator:trackDistanceUnit:formattingManager:];
}

id objc_msgSend_initWithWorkout_workoutActivity_dataCalculator_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkout:workoutActivity:dataCalculator:formattingManager:];
}

id objc_msgSend_initWithWorkout_workoutActivity_dataCalculator_formattingManager_locationReadings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkout:workoutActivity:dataCalculator:formattingManager:locationReadings:");
}

id objc_msgSend_initWithWorkout_workoutActivity_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkout:workoutActivity:formattingManager:];
}

id objc_msgSend_initWithWorkout_workoutActivity_healthStore_formattingManager_isFirstPartyWorkout_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkout:workoutActivity:healthStore:formattingManager:isFirstPartyWorkout:];
}

id objc_msgSend_initWithWorkout_workoutActivity_healthStore_model_fitnessAppContext_workoutFormattingManager_workoutDataProvider_badgeImageFactory_friendListManager_achievementLocalizationProvider_pauseRingsCoordinator_achievementResourceProvider_formattingManager_awardsDataProvider_shouldExposeDeepLinkToTrainingLoadFromEffort_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkout:workoutActivity:healthStore:model:fitnessAppContext:workoutFormattingManager:workoutDataProvider:badgeImageFactory:friendListManager:achievementLocalizationProvider:pauseRingsCoordinator:achievementResourceProvider:formattingManager:awardsDataProvider:shouldExposeDeepLinkToTrainingLoadFromEffort:];
}

id objc_msgSend_initWithWorkoutEvent_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkoutEvent:];
}

id objc_msgSend_initWithWorkouts_(void *a1, const char *a2, ...)
{
  return [a1 initWithWorkouts:];
}

id objc_msgSend_initializeCachePathOnMainQueue(void *a1, const char *a2, ...)
{
  return _[a1 initializeCachePathOnMainQueue];
}

id objc_msgSend_insertArrangedSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertArrangedSubview:atIndex:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_insertObjects_atIndexes_(void *a1, const char *a2, ...)
{
  return [a1 insertObjects:atIndexes:];
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 insertRowsAtIndexPaths:withRowAnimation:];
}

id objc_msgSend_insertSamples_(void *a1, const char *a2, ...)
{
  return [a1 insertSamples:];
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 insertSections:withRowAnimation:];
}

id objc_msgSend_insertSublayer_below_(void *a1, const char *a2, ...)
{
  return [a1 insertSublayer:below:];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:atIndex:];
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:below:];
}

id objc_msgSend_insetView(void *a1, const char *a2, ...)
{
  return _[a1 insetView];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interactivePopGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 interactivePopGestureRecognizer];
}

id objc_msgSend_intersectionWithDateInterval_(void *a1, const char *a2, ...)
{
  return [a1 intersectionWithDateInterval:];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return _[a1 interval];
}

id objc_msgSend_intervalIndex(void *a1, const char *a2, ...)
{
  return _[a1 intervalIndex];
}

id objc_msgSend_intervals(void *a1, const char *a2, ...)
{
  return _[a1 intervals];
}

id objc_msgSend_intervalsForWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 intervalsForWorkout:completion:];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayout];
}

id objc_msgSend_invalidateMaxCellHeight(void *a1, const char *a2, ...)
{
  return _[a1 invalidateMaxCellHeight];
}

id objc_msgSend_isActivityDataVisibleToMeForDate_(void *a1, const char *a2, ...)
{
  return [a1 isActivityDataVisibleToMeForDate:];
}

id objc_msgSend_isAmm(void *a1, const char *a2, ...)
{
  return _[a1 isAmm];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isAppleInternalInstall];
}

id objc_msgSend_isAwaitingCompetitionResponseFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isAwaitingCompetitionResponseFromMe];
}

id objc_msgSend_isAwaitingInviteResponseFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isAwaitingInviteResponseFromMe];
}

id objc_msgSend_isCloudKitAccountActiveWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 isCloudKitAccountActiveWithCompletion:];
}

id objc_msgSend_isCompatibleWithUnit_(void *a1, const char *a2, ...)
{
  return [a1 isCompatibleWithUnit:];
}

id objc_msgSend_isCompetitionActive(void *a1, const char *a2, ...)
{
  return _[a1 isCompetitionActive];
}

id objc_msgSend_isCurrentFilterValid(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentFilterValid];
}

id objc_msgSend_isDate_equalToDate_toUnitGranularity_(void *a1, const char *a2, ...)
{
  return [a1 isDate:equalToDate:toUnitGranularity:];
}

id objc_msgSend_isDate_inSameDayAsDate_(void *a1, const char *a2, ...)
{
  return [a1 isDate:inSameDayAsDate:];
}

id objc_msgSend_isDateInToday_(void *a1, const char *a2, ...)
{
  return [a1 isDateInToday:];
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return [a1 isDescendantOfView:];
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isEmail(void *a1, const char *a2, ...)
{
  return _[a1 isEmail];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToAttributedString:];
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDate:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFutureDay(void *a1, const char *a2, ...)
{
  return _[a1 isFutureDay];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isIndoor(void *a1, const char *a2, ...)
{
  return _[a1 isIndoor];
}

id objc_msgSend_isIndoorCyclingForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 isIndoorCyclingForWorkout:workoutActivity:];
}

id objc_msgSend_isIntervalWorkout(void *a1, const char *a2, ...)
{
  return _[a1 isIntervalWorkout];
}

id objc_msgSend_isLikePhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 isLikePhoneNumber:];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isMetricTypeSupported_isMachineWorkout_activityType_(void *a1, const char *a2, ...)
{
  return [a1 isMetricTypeSupported:isMachineWorkout:activityType:];
}

id objc_msgSend_isMirroringSessionActive(void *a1, const char *a2, ...)
{
  return _[a1 isMirroringSessionActive];
}

id objc_msgSend_isMultiSportWorkout(void *a1, const char *a2, ...)
{
  return _[a1 isMultiSportWorkout];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMuted];
}

id objc_msgSend_isMyActivityDataCurrentlyHidden(void *a1, const char *a2, ...)
{
  return _[a1 isMyActivityDataCurrentlyHidden];
}

id objc_msgSend_isNavigationBarHidden(void *a1, const char *a2, ...)
{
  return _[a1 isNavigationBarHidden];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return _[a1 isPaused];
}

id objc_msgSend_isPausedForActivitySummary_(void *a1, const char *a2, ...)
{
  return [a1 isPausedForActivitySummary:];
}

id objc_msgSend_isPausedForActivitySummaryCacheIndex_(void *a1, const char *a2, ...)
{
  return [a1 isPausedForActivitySummaryCacheIndex:];
}

id objc_msgSend_isPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 isPhoneNumber];
}

id objc_msgSend_isRaceWorkout(void *a1, const char *a2, ...)
{
  return _[a1 isRaceWorkout];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSessionViewControllerPresented(void *a1, const char *a2, ...)
{
  return _[a1 isSessionViewControllerPresented];
}

id objc_msgSend_isSeymourGuidedRunWorkout(void *a1, const char *a2, ...)
{
  return _[a1 isSeymourGuidedRunWorkout];
}

id objc_msgSend_isSeymourPairedWorkout(void *a1, const char *a2, ...)
{
  return _[a1 isSeymourPairedWorkout];
}

id objc_msgSend_isSeymourWorkout_(void *a1, const char *a2, ...)
{
  return [a1 isSeymourWorkout:];
}

id objc_msgSend_isStandaloneForCacheIndex_(void *a1, const char *a2, ...)
{
  return [a1 isStandaloneForCacheIndex:];
}

id objc_msgSend_isStandalonePhoneFitnessMode(void *a1, const char *a2, ...)
{
  return _[a1 isStandalonePhoneFitnessMode];
}

id objc_msgSend_isSwimmingActivity(void *a1, const char *a2, ...)
{
  return _[a1 isSwimmingActivity];
}

id objc_msgSend_isTrackWorkout(void *a1, const char *a2, ...)
{
  return _[a1 isTrackWorkout];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isWatchWorkout_(void *a1, const char *a2, ...)
{
  return [a1 isWatchWorkout:];
}

id objc_msgSend_isWheelchairUser(void *a1, const char *a2, ...)
{
  return _[a1 isWheelchairUser];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_kIntervalWorkoutStepDistanceGoalAchievedDateKey(void *a1, const char *a2, ...)
{
  return _[a1 kIntervalWorkoutStepDistanceGoalAchievedDateKey];
}

id objc_msgSend_kIntervalWorkoutStepDistanceGoalAchievedDurationKey(void *a1, const char *a2, ...)
{
  return _[a1 kIntervalWorkoutStepDistanceGoalAchievedDurationKey];
}

id objc_msgSend_kIntervalWorkoutStepMetadataKey(void *a1, const char *a2, ...)
{
  return _[a1 kIntervalWorkoutStepMetadataKey];
}

id objc_msgSend_kIntervalWorkoutStepSuccessful(void *a1, const char *a2, ...)
{
  return _[a1 kIntervalWorkoutStepSuccessful];
}

id objc_msgSend_kRaceWorkoutAveragePaceOnRouteMetadataKey(void *a1, const char *a2, ...)
{
  return _[a1 kRaceWorkoutAveragePaceOnRouteMetadataKey];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyColorForDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 keyColorForDisplayMode:];
}

id objc_msgSend_keyColors(void *a1, const char *a2, ...)
{
  return _[a1 keyColors];
}

id objc_msgSend_keyLineView(void *a1, const char *a2, ...)
{
  return _[a1 keyLineView];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return _[a1 kilocalorieUnit];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelBaselineConstraint(void *a1, const char *a2, ...)
{
  return _[a1 labelBaselineConstraint];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_labelFirstBaselineConstraint(void *a1, const char *a2, ...)
{
  return _[a1 labelFirstBaselineConstraint];
}

id objc_msgSend_laneNumber(void *a1, const char *a2, ...)
{
  return _[a1 laneNumber];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lapColors(void *a1, const char *a2, ...)
{
  return _[a1 lapColors];
}

id objc_msgSend_lapIndex(void *a1, const char *a2, ...)
{
  return _[a1 lapIndex];
}

id objc_msgSend_lapLength(void *a1, const char *a2, ...)
{
  return _[a1 lapLength];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastEffortAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastEffortAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return [a1 laterDate:];
}

id objc_msgSend_latestAnchor(void *a1, const char *a2, ...)
{
  return _[a1 latestAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leadingMargin(void *a1, const char *a2, ...)
{
  return _[a1 leadingMargin];
}

id objc_msgSend_leadingTextConstraint(void *a1, const char *a2, ...)
{
  return _[a1 leadingTextConstraint];
}

id objc_msgSend_leanBodyMass(void *a1, const char *a2, ...)
{
  return _[a1 leanBodyMass];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_lightTextColor(void *a1, const char *a2, ...)
{
  return _[a1 lightTextColor];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return _[a1 linkButton];
}

id objc_msgSend_linkLabel(void *a1, const char *a2, ...)
{
  return _[a1 linkLabel];
}

id objc_msgSend_linkWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 linkWithBundleIdentifier:];
}

id objc_msgSend_linkedContactStoreIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 linkedContactStoreIdentifier];
}

id objc_msgSend_listViewDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 listViewDateFormatter];
}

id objc_msgSend_loadAppImageAtURL_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadAppImageAtURL:completionHandler:];
}

id objc_msgSend_loadDataIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadDataIfNeeded];
}

id objc_msgSend_loadingView(void *a1, const char *a2, ...)
{
  return _[a1 loadingView];
}

id objc_msgSend_locProvider(void *a1, const char *a2, ...)
{
  return _[a1 locProvider];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return _[a1 localDevice];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _[a1 locality];
}

id objc_msgSend_localizationKeyForEnergyBaseKey_(void *a1, const char *a2, ...)
{
  return [a1 localizationKeyForEnergyBaseKey:];
}

id objc_msgSend_localizationProvider(void *a1, const char *a2, ...)
{
  return _[a1 localizationProvider];
}

id objc_msgSend_localizedAttributedBacksideString(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedBacksideString];
}

id objc_msgSend_localizedAttributedCombinedString(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedCombinedString];
}

id objc_msgSend_localizedAttributedCombinedStringWithoutProgress(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedCombinedStringWithoutProgress];
}

id objc_msgSend_localizedAttributedShortenedBacksideString(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedShortenedBacksideString];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedButtonTitle];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 localizedCapitalizedString];
}

id objc_msgSend_localizedCompactGoalDescriptionForGoalType_goalValue_activityType_(void *a1, const char *a2, ...)
{
  return [a1 localizedCompactGoalDescriptionForGoalType:goalValue:activityType:];
}

id objc_msgSend_localizedGoalDescriptionForDive_healthStore_outValue_(void *a1, const char *a2, ...)
{
  return [a1 localizedGoalDescriptionForDive:healthStore:outValue:];
}

id objc_msgSend_localizedGoalDescriptionForWorkout_withValue_appendActivityType_(void *a1, const char *a2, ...)
{
  return [a1 localizedGoalDescriptionForWorkout:withValue:appendActivityType:];
}

id objc_msgSend_localizedLongActiveEnergyUnitString(void *a1, const char *a2, ...)
{
  return _[a1 localizedLongActiveEnergyUnitString];
}

id objc_msgSend_localizedLongActiveHoursUnitStringForValue_(void *a1, const char *a2, ...)
{
  return [a1 localizedLongActiveHoursUnitStringForValue:];
}

id objc_msgSend_localizedLongBriskMinutesUnitStringForValue_(void *a1, const char *a2, ...)
{
  return [a1 localizedLongBriskMinutesUnitStringForValue:];
}

id objc_msgSend_localizedLongMoveUnitStringWithActivityMoveMode_value_(void *a1, const char *a2, ...)
{
  return [a1 localizedLongMoveUnitStringWithActivityMoveMode:];
}

id objc_msgSend_localizedLowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedLowercaseString];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameForWorkoutTypeKey_(void *a1, const char *a2, ...)
{
  return [a1 localizedNameForWorkoutTypeKey:];
}

id objc_msgSend_localizedNaturalScaleStringWithDistanceInMeters_distanceType_unitStyle_usedUnit_(void *a1, const char *a2, ...)
{
  return [a1 localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:];
}

id objc_msgSend_localizedPaceStringWithDistance_overDuration_paceFormat_distanceType_(void *a1, const char *a2, ...)
{
  return [a1 localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:];
}

id objc_msgSend_localizedShareTextWithWorkout_shareValue_(void *a1, const char *a2, ...)
{
  return [a1 localizedShareTextWithWorkout:shareValue:];
}

id objc_msgSend_localizedShortActiveEnergyUnitString(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortActiveEnergyUnitString];
}

id objc_msgSend_localizedShortCadenceUnitStringForActivityType_(void *a1, const char *a2, ...)
{
  return [a1 localizedShortCadenceUnitStringForActivityType:];
}

id objc_msgSend_localizedShortNameForWorkoutTypeKey_(void *a1, const char *a2, ...)
{
  return [a1 localizedShortNameForWorkoutTypeKey:];
}

id objc_msgSend_localizedShortPowerUnitString(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortPowerUnitString];
}

id objc_msgSend_localizedShortUnitStringForDistanceType_(void *a1, const char *a2, ...)
{
  return [a1 localizedShortUnitStringForDistanceType:];
}

id objc_msgSend_localizedShortUnitStringForDistanceUnit_(void *a1, const char *a2, ...)
{
  return [a1 localizedShortUnitStringForDistanceUnit:];
}

id objc_msgSend_localizedShortUnitStringForDistanceUnit_textCase_(void *a1, const char *a2, ...)
{
  return [a1 localizedShortUnitStringForDistanceUnit:textCase:];
}

id objc_msgSend_localizedSpeedUnitStringForActivityType_(void *a1, const char *a2, ...)
{
  return [a1 localizedSpeedUnitStringForActivityType:];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringFromDate:dateStyle:timeStyle:];
}

id objc_msgSend_localizedStringFromNumber_numberStyle_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringFromNumber:numberStyle:];
}

id objc_msgSend_localizedStringWithActiveEnergy_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithActiveEnergy];
}

id objc_msgSend_localizedStringWithActiveHours_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithActiveHours:];
}

id objc_msgSend_localizedStringWithBeatsPerMinute_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithBeatsPerMinute:];
}

id objc_msgSend_localizedStringWithBriskMinutes_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithBriskMinutes:];
}

id objc_msgSend_localizedStringWithDistanceInMeters_distanceType_unitStyle_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithDistanceInMeters:distanceType:unitStyle:];
}

id objc_msgSend_localizedStringWithDistanceInMeters_distanceType_unitStyle_roundingMode_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithDistanceInMeters:roundingMode:unitStyle:distanceType:];
}

id objc_msgSend_localizedStringWithDistanceInMeters_distanceUnit_unitStyle_decimalPrecision_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_localizedStringWithHeartRate_unitStyle_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithHeartRate:unitStyle:];
}

id objc_msgSend_localizedStringWithMoveQuantity_activityMoveMode_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithMoveQuantity:activityMoveMode:];
}

id objc_msgSend_localizedStrokeCountStringWithCount_overDistance_paceFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStrokeCountStringWithCount:overDistance:paceFormat:];
}

id objc_msgSend_localizedSwimmingPaceStringWithDistance_overDuration_paceFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedSwimmingPaceStringWithDistance:overDuration:paceFormat:];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationFetcher(void *a1, const char *a2, ...)
{
  return _[a1 locationFetcher];
}

id objc_msgSend_locationFetcherObserver(void *a1, const char *a2, ...)
{
  return _[a1 locationFetcherObserver];
}

id objc_msgSend_locationForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 locationForWorkout:workoutActivity:];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_locationReadings(void *a1, const char *a2, ...)
{
  return _[a1 locationReadings];
}

id objc_msgSend_locationType(void *a1, const char *a2, ...)
{
  return _[a1 locationType];
}

id objc_msgSend_logCardConfigurationAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 logCardConfigurationAnalytics];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainCollectionView(void *a1, const char *a2, ...)
{
  return _[a1 mainCollectionView];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainSectionCellPadding(void *a1, const char *a2, ...)
{
  return _[a1 mainSectionCellPadding];
}

id objc_msgSend_mainSectionCellWidth(void *a1, const char *a2, ...)
{
  return _[a1 mainSectionCellWidth];
}

id objc_msgSend_mainSectionDataSource(void *a1, const char *a2, ...)
{
  return _[a1 mainSectionDataSource];
}

id objc_msgSend_mainSectionHorizontalInset(void *a1, const char *a2, ...)
{
  return _[a1 mainSectionHorizontalInset];
}

id objc_msgSend_makeDownhillRunBridgesWithHealthStore_completion_(void *a1, const char *a2, ...)
{
  return [a1 makeDownhillRunBridgesWithHealthStore:completion:];
}

id objc_msgSend_makeHostingControllerWithStartingEffort_workoutActivityType_showCurrentWorkloadButton_cancel_completion_(void *a1, const char *a2, ...)
{
  return [a1 makeHostingControllerWithStartingEffort:workoutActivityType:showCurrentWorkloadButton:cancel:completion:];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeNotificationConsentViewController_buttonHandler_(void *a1, const char *a2, ...)
{
  return [a1 makeNotificationConsentViewController:buttonHandler:];
}

id objc_msgSend_makeObjectsPerformSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:withObject:];
}

id objc_msgSend_makeViewWithGoalSchedule_goalDaysModel_wheelchairUser_goalType_formattingManager_showFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeViewWithGoalSchedule:goalDaysModel:wheelchairUser:goalType:formattingManager:showFooter:");
}

id objc_msgSend_makeWithAchievementBadgeImageFactory_achievementLocalizationProvider_achievementsDataProvider_activitySharingClient_awardsDataProvider_fitnessAppContext_fiuiFormattingManager_friendListSectionManager_friendsSetupCoordinator_friendManager_healthStore_seymourCatalogItemDataProvider_wheelchairUseCache_workoutDataProvider_workoutFormattingManager_pauseRingsCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeWithAchievementBadgeImageFactory:achievementLocalizationProvider:achievementsDataProvider:activitySharingClient:awardsDataProvider:fitnessAppContext:fiuiFormattingManager:friendListSectionManager:friendsSetupCoordinator:friendManager:healthStore:seymourCatalogItemDataProvider:wheelchairUseCache:workoutDataProvider:workoutFormattingManager:pauseRingsCoordinator:");
}

id objc_msgSend_maxCellHeight(void *a1, const char *a2, ...)
{
  return _[a1 maxCellHeight];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return _[a1 maximumValue];
}

id objc_msgSend_me(void *a1, const char *a2, ...)
{
  return _[a1 me];
}

id objc_msgSend_measuredHeightWithDisplayMode_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 measuredHeightWithDisplayMode:formattingManager:];
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return [a1 menuWithChildren:];
}

id objc_msgSend_menuWithTitle_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:children:];
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:image:identifier:options:children:];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_meterUnit(void *a1, const char *a2, ...)
{
  return _[a1 meterUnit];
}

id objc_msgSend_meterUnitWithMetricPrefix_(void *a1, const char *a2, ...)
{
  return [a1 meterUnitWithMetricPrefix:];
}

id objc_msgSend_metricColorsForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 metricColorsForWorkout:];
}

id objc_msgSend_metricTitleAndValueInfo(void *a1, const char *a2, ...)
{
  return _[a1 metricTitleAndValueInfo];
}

id objc_msgSend_metricsVersionForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 metricsVersionForWorkout:];
}

id objc_msgSend_migrateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 migrateIfNeeded];
}

id objc_msgSend_migrationKeys(void *a1, const char *a2, ...)
{
  return _[a1 migrationKeys];
}

id objc_msgSend_mileUnit(void *a1, const char *a2, ...)
{
  return _[a1 mileUnit];
}

id objc_msgSend_minValue(void *a1, const char *a2, ...)
{
  return _[a1 minValue];
}

id objc_msgSend_mindfulnessSessionsStatistics(void *a1, const char *a2, ...)
{
  return _[a1 mindfulnessSessionsStatistics];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return _[a1 minimumValue];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return _[a1 minuteUnit];
}

id objc_msgSend_mmg(void *a1, const char *a2, ...)
{
  return _[a1 mmg];
}

id objc_msgSend_mmv(void *a1, const char *a2, ...)
{
  return _[a1 mmv];
}

id objc_msgSend_modalBadgeFlipStarted(void *a1, const char *a2, ...)
{
  return _[a1 modalBadgeFlipStarted];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_mondayGoal(void *a1, const char *a2, ...)
{
  return _[a1 mondayGoal];
}

id objc_msgSend_monogramForContact_(void *a1, const char *a2, ...)
{
  return [a1 monogramForContact:];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _[a1 month];
}

id objc_msgSend_monthScrollDelegate(void *a1, const char *a2, ...)
{
  return _[a1 monthScrollDelegate];
}

id objc_msgSend_monthTitleBottomMargin(void *a1, const char *a2, ...)
{
  return _[a1 monthTitleBottomMargin];
}

id objc_msgSend_monthTitleTopMargin(void *a1, const char *a2, ...)
{
  return _[a1 monthTitleTopMargin];
}

id objc_msgSend_monthTitleView(void *a1, const char *a2, ...)
{
  return _[a1 monthTitleView];
}

id objc_msgSend_mostRecentWorkout(void *a1, const char *a2, ...)
{
  return _[a1 mostRecentWorkout];
}

id objc_msgSend_mostRecentWorkout_supportsMetric_(void *a1, const char *a2, ...)
{
  return [a1 mostRecentWorkout:supportsMetric:];
}

id objc_msgSend_moveMinuteGoal(void *a1, const char *a2, ...)
{
  return _[a1 moveMinuteGoal];
}

id objc_msgSend_moveModeChangeGoalsNotificationCategory(void *a1, const char *a2, ...)
{
  return _[a1 moveModeChangeGoalsNotificationCategory];
}

id objc_msgSend_moveModeChangeModeNotificationCategory(void *a1, const char *a2, ...)
{
  return _[a1 moveModeChangeModeNotificationCategory];
}

id objc_msgSend_moveModeNotificationCategory(void *a1, const char *a2, ...)
{
  return _[a1 moveModeNotificationCategory];
}

id objc_msgSend_movementEndDate(void *a1, const char *a2, ...)
{
  return _[a1 movementEndDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nCellsPerRow(void *a1, const char *a2, ...)
{
  return _[a1 nCellsPerRow];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameFont(void *a1, const char *a2, ...)
{
  return _[a1 nameFont];
}

id objc_msgSend_nanoSystemSettingsManager(void *a1, const char *a2, ...)
{
  return _[a1 nanoSystemSettingsManager];
}

id objc_msgSend_navigateToHistoryAnimated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToHistoryAnimated:];
}

id objc_msgSend_navigateToMindfulnessHistoryAnimated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToMindfulnessHistoryAnimated:];
}

id objc_msgSend_navigateToTrophyCaseAnimated_initialAchievement_shouldShowCelebration_forModalPresentation_(void *a1, const char *a2, ...)
{
  return [a1 navigateToTrophyCaseAnimated:initialAchievement:shouldShowCelebration:forModalPresentation:];
}

id objc_msgSend_navigateToTrophyCaseSection_withAchievementID_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToTrophyCaseSection:withAchievementID:animated:];
}

id objc_msgSend_navigateToURL_(void *a1, const char *a2, ...)
{
  return [a1 navigateToURL:];
}

id objc_msgSend_navigateToWorkout_(void *a1, const char *a2, ...)
{
  return [a1 navigateToWorkout:];
}

id objc_msgSend_navigateToWorkoutHistoryWithActivityType_animated_(void *a1, const char *a2, ...)
{
  return [a1 navigateToWorkoutHistoryWithActivityType:animated:];
}

id objc_msgSend_navigateToWorkoutPlanCreation(void *a1, const char *a2, ...)
{
  return _[a1 navigateToWorkoutPlanCreation];
}

id objc_msgSend_navigateToWorkoutPlanDetail(void *a1, const char *a2, ...)
{
  return _[a1 navigateToWorkoutPlanDetail];
}

id objc_msgSend_navigationActionForHeaderInSection_(void *a1, const char *a2, ...)
{
  return [a1 navigationActionForHeaderInSection:];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_navigationStackDisplacedBySetupController(void *a1, const char *a2, ...)
{
  return _[a1 navigationStackDisplacedBySetupController];
}

id objc_msgSend_needsWatchIcon(void *a1, const char *a2, ...)
{
  return _[a1 needsWatchIcon];
}

id objc_msgSend_newGradientForStartColor_endColor_(void *a1, const char *a2, ...)
{
  return [a1 newGradientForStartColor:endColor:];
}

id objc_msgSend_nextMoveModeUserInfoKey(void *a1, const char *a2, ...)
{
  return _[a1 nextMoveModeUserInfoKey];
}

id objc_msgSend_nextWeekStartDate(void *a1, const char *a2, ...)
{
  return _[a1 nextWeekStartDate];
}

id objc_msgSend_nonGradientTextColor(void *a1, const char *a2, ...)
{
  return _[a1 nonGradientTextColor];
}

id objc_msgSend_nonZeroMetadataExistsInWorkout_orWorkoutActivity_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nonZeroMetadataExistsInWorkout:orWorkoutActivity:withKey:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationResponse(void *a1, const char *a2, ...)
{
  return _[a1 notificationResponse];
}

id objc_msgSend_notificationTypeUserInfoKey(void *a1, const char *a2, ...)
{
  return _[a1 notificationTypeUserInfoKey];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberForKey_error_(void *a1, const char *a2, ...)
{
  return [a1 numberForKey:error:];
}

id objc_msgSend_numberOfItemsInRecentAndRelevantSection_(void *a1, const char *a2, ...)
{
  return [a1 numberOfItemsInRecentAndRelevantSection:];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return [a1 numberOfItemsInSection:];
}

id objc_msgSend_numberOfNewFriendsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 numberOfNewFriendsAllowed];
}

id objc_msgSend_numberOfRecentAndRelevantSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRecentAndRelevantSections];
}

id objc_msgSend_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return [a1 numberOfRowsInSection:];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_numberOfSectionsInCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 numberOfSectionsInCollectionView:];
}

id objc_msgSend_numberOfSectionsInTableView_(void *a1, const char *a2, ...)
{
  return [a1 numberOfSectionsInTableView:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_oldDevicesExist(void *a1, const char *a2, ...)
{
  return _[a1 oldDevicesExist];
}

id objc_msgSend_onboardingCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 onboardingCoordinator];
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:withOptions:];
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:options:completionHandler:];
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:withCompletionHandler:];
}

id objc_msgSend_openURLContext_(void *a1, const char *a2, ...)
{
  return [a1 openURLContext:];
}

id objc_msgSend_openWaterSwimDistanceByStrokeStyleForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openWaterSwimDistanceByStrokeStyleForWorkout:workoutActivity:completion:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [a1 orPredicateWithSubpredicates:];
}

id objc_msgSend_pace100UnitFont(void *a1, const char *a2, ...)
{
  return _[a1 pace100UnitFont];
}

id objc_msgSend_paceCell_didSelectNewPaceFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paceCell:didSelectNewPaceFormat:");
}

id objc_msgSend_paceColors(void *a1, const char *a2, ...)
{
  return _[a1 paceColors];
}

id objc_msgSend_paceDistanceUnitForDistanceType_(void *a1, const char *a2, ...)
{
  return [a1 paceDistanceUnitForDistanceType:];
}

id objc_msgSend_paceFormatUpdatedBlock(void *a1, const char *a2, ...)
{
  return _[a1 paceFormatUpdatedBlock];
}

id objc_msgSend_paceSamples(void *a1, const char *a2, ...)
{
  return _[a1 paceSamples];
}

id objc_msgSend_paceSelectionDelegate(void *a1, const char *a2, ...)
{
  return _[a1 paceSelectionDelegate];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return _[a1 pairingID];
}

id objc_msgSend_paletteDateSelected_(void *a1, const char *a2, ...)
{
  return [a1 paletteDateSelected:];
}

id objc_msgSend_paletteForEdge_size_(void *a1, const char *a2, ...)
{
  return [a1 paletteForEdge:size:];
}

id objc_msgSend_paletteScrolledInDirection_(void *a1, const char *a2, ...)
{
  return [a1 paletteScrolledInDirection:];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 panGestureRecognizer];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_passwordController(void *a1, const char *a2, ...)
{
  return _[a1 passwordController];
}

id objc_msgSend_passwordEnteredHandler(void *a1, const char *a2, ...)
{
  return _[a1 passwordEnteredHandler];
}

id objc_msgSend_passwordEntryCancelledHandler(void *a1, const char *a2, ...)
{
  return _[a1 passwordEntryCancelledHandler];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pauseRingsCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 pauseRingsCoordinator];
}

id objc_msgSend_perMinuteWorkoutRecoveryHeartRateFromReadings_workoutEndDate_(void *a1, const char *a2, ...)
{
  return [a1 perMinuteWorkoutRecoveryHeartRateFromReadings:workoutEndDate:];
}

id objc_msgSend_percentStringWithNumber_(void *a1, const char *a2, ...)
{
  return [a1 percentStringWithNumber:];
}

id objc_msgSend_percentUnit(void *a1, const char *a2, ...)
{
  return _[a1 percentUnit];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_performAsCurrentTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 performAsCurrentTraitCollection:];
}

id objc_msgSend_performEndToEndCloudSyncOnSkippingSetupForHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 performEndToEndCloudSyncOnSkippingSetupForHealthStore:];
}

id objc_msgSend_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion_(void *a1, const char *a2, ...)
{
  return [a1 performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_phoneCloudKitAccountIsActive(void *a1, const char *a2, ...)
{
  return _[a1 phoneCloudKitAccountIsActive];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_pillImageForColor_size_(void *a1, const char *a2, ...)
{
  return [a1 pillImageForColor:size:];
}

id objc_msgSend_pillImages(void *a1, const char *a2, ...)
{
  return _[a1 pillImages];
}

id objc_msgSend_placeBadgeViewInContainer(void *a1, const char *a2, ...)
{
  return _[a1 placeBadgeViewInContainer];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 plainButtonConfiguration];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_playFlipInAnimation(void *a1, const char *a2, ...)
{
  return _[a1 playFlipInAnimation];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _[a1 player];
}

id objc_msgSend_playerItemWithAsset_(void *a1, const char *a2, ...)
{
  return [a1 playerItemWithAsset:];
}

id objc_msgSend_playerLayerWithPlayer_(void *a1, const char *a2, ...)
{
  return [a1 playerLayerWithPlayer:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popToRootViewControllerAnimated:];
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 popToViewController:animated:];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popViewControllerAnimated:];
}

id objc_msgSend_populateExistingCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 populateExistingCharacteristics];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_powerColors(void *a1, const char *a2, ...)
{
  return _[a1 powerColors];
}

id objc_msgSend_powerSamples(void *a1, const char *a2, ...)
{
  return _[a1 powerSamples];
}

id objc_msgSend_powerSamplesForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 powerSamplesForWorkout:workoutActivity:completion:];
}

id objc_msgSend_predicateForActivitySummariesBetweenStartDateComponents_endDateComponents_(void *a1, const char *a2, ...)
{
  return [a1 predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:];
}

id objc_msgSend_predicateForObjectsFromWorkout_(void *a1, const char *a2, ...)
{
  return [a1 predicateForObjectsFromWorkout:];
}

id objc_msgSend_predicateForObjectsWithMetadataKey_operatorType_value_(void *a1, const char *a2, ...)
{
  return [a1 predicateForObjectsWithMetadataKey:operatorType:value:];
}

id objc_msgSend_predicateForSamplesWithStartDate_endDate_options_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSamplesWithStartDate:endDate:options:];
}

id objc_msgSend_predicateForWorkoutRecoveryTimeWithWorkout_(void *a1, const char *a2, ...)
{
  return [a1 predicateForWorkoutRecoveryTimeWithWorkout:];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithValue:];
}

id objc_msgSend_preferredAppStoreIconWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredAppStoreIconWidth];
}

id objc_msgSend_preferredCellHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredCellHeight];
}

id objc_msgSend_preferredCollectionViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredCollectionViewHeight];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredHeight];
}

id objc_msgSend_preferredHeightForConfiguration_friend_(void *a1, const char *a2, ...)
{
  return [a1 preferredHeightForConfiguration:friend:];
}

id objc_msgSend_preferredHeightForFriend_(void *a1, const char *a2, ...)
{
  return [a1 preferredHeightForFriend:];
}

id objc_msgSend_preferredHeightForWidth_(void *a1, const char *a2, ...)
{
  return [a1 preferredHeightForWidth:];
}

id objc_msgSend_preferredHeightForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 preferredHeightForWorkout:];
}

id objc_msgSend_preferredHeightForWorkout_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 preferredHeightForWorkout:formattingManager:];
}

id objc_msgSend_preferredHeightForWorkout_indexPath_numberOfRows_(void *a1, const char *a2, ...)
{
  return [a1 preferredHeightForWorkout:indexPath:numberOfRows:];
}

id objc_msgSend_preferredQuantity(void *a1, const char *a2, ...)
{
  return _[a1 preferredQuantity];
}

id objc_msgSend_preferredServiceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 preferredServiceIdentifier];
}

id objc_msgSend_preferredSizeForSectionName_(void *a1, const char *a2, ...)
{
  return [a1 preferredSizeForSectionName:];
}

id objc_msgSend_preferredWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredWidth];
}

id objc_msgSend_pregnancySectionIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 pregnancySectionIndexPath];
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return _[a1 prepareForReuse];
}

id objc_msgSend_presentAchievement_badgeRect_cell_(void *a1, const char *a2, ...)
{
  return [a1 presentAchievement:badgeRect:cell:];
}

id objc_msgSend_presentAppSettingsShowingPane_(void *a1, const char *a2, ...)
{
  return [a1 presentAppSettingsShowingPane:];
}

id objc_msgSend_presentDetailForAchievement_badgeRect_conversionView_cell_(void *a1, const char *a2, ...)
{
  return [a1 presentDetailForAchievement:badgeRect:conversionView:cell:];
}

id objc_msgSend_presentEffortViewController_presentationCompletion_(void *a1, const char *a2, ...)
{
  return [a1 presentEffortViewController:presentationCompletion:];
}

id objc_msgSend_presentPageForSection_(void *a1, const char *a2, ...)
{
  return [a1 presentPageForSection];
}

id objc_msgSend_presentRemoteViewControllerOnHostController_workoutPlanData_dismissHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentRemoteViewControllerOnHostController:workoutPlanData:dismissHandler:completionHandler:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentViewController_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:completion:];
}

id objc_msgSend_presentWithController_onDismiss_(void *a1, const char *a2, ...)
{
  return [a1 presentWithController:onDismiss:];
}

id objc_msgSend_presentWorkoutConfigurationWithData_(void *a1, const char *a2, ...)
{
  return [a1 presentWorkoutConfigurationWithData:];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presenter_userNotificationCenter_(void *a1, const char *a2, ...)
{
  return [a1 presenter:userNotificationCenter:];
}

id objc_msgSend_pressToTransition_(void *a1, const char *a2, ...)
{
  return [a1 pressToTransition:];
}

id objc_msgSend_previewViewController(void *a1, const char *a2, ...)
{
  return _[a1 previewViewController];
}

id objc_msgSend_previousWeekStartDate(void *a1, const char *a2, ...)
{
  return _[a1 previousWeekStartDate];
}

id objc_msgSend_primaryDestinationForMessaging(void *a1, const char *a2, ...)
{
  return _[a1 primaryDestinationForMessaging];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return _[a1 privacyFlow];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressBar(void *a1, const char *a2, ...)
{
  return _[a1 progressBar];
}

id objc_msgSend_pushCount(void *a1, const char *a2, ...)
{
  return _[a1 pushCount];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _[a1 quantity];
}

id objc_msgSend_quantitySampleWithType_quantity_startDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 quantitySampleWithType:quantity:startDate:endDate:];
}

id objc_msgSend_quantitySampleWithType_quantity_startDate_endDate_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:metadata:");
}

id objc_msgSend_quantityType(void *a1, const char *a2, ...)
{
  return _[a1 quantityType];
}

id objc_msgSend_quantityTypeForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 quantityTypeForIdentifier:];
}

id objc_msgSend_quantityWithUnit_doubleValue_(void *a1, const char *a2, ...)
{
  return [a1 quantityWithUnit:doubleValue:];
}

id objc_msgSend_quaternarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 quaternarySystemFillColor];
}

id objc_msgSend_queryDestinations_updateHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryDestinations:updateHandler:completionHandler:");
}

id objc_msgSend_raceAheadColors(void *a1, const char *a2, ...)
{
  return _[a1 raceAheadColors];
}

id objc_msgSend_raceBehindColors(void *a1, const char *a2, ...)
{
  return _[a1 raceBehindColors];
}

id objc_msgSend_raceTime(void *a1, const char *a2, ...)
{
  return _[a1 raceTime];
}

id objc_msgSend_raceWorkoutDisplayDistance(void *a1, const char *a2, ...)
{
  return _[a1 raceWorkoutDisplayDistance];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_reachableEmailAddress(void *a1, const char *a2, ...)
{
  return _[a1 reachableEmailAddress];
}

id objc_msgSend_reachablePhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 reachablePhoneNumber];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_recentAndRelevantAchievementAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 recentAndRelevantAchievementAtIndexPath:];
}

id objc_msgSend_recentAndRelevantCollectionView(void *a1, const char *a2, ...)
{
  return _[a1 recentAndRelevantCollectionView];
}

id objc_msgSend_recentAndRelevantDataSource(void *a1, const char *a2, ...)
{
  return _[a1 recentAndRelevantDataSource];
}

id objc_msgSend_recipientView(void *a1, const char *a2, ...)
{
  return _[a1 recipientView];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _[a1 recipients];
}

id objc_msgSend_recoveryDateIntervalWithWorkout_(void *a1, const char *a2, ...)
{
  return [a1 recoveryDateIntervalWithWorkout:];
}

id objc_msgSend_recoveryHeartRateReadings(void *a1, const char *a2, ...)
{
  return _[a1 recoveryHeartRateReadings];
}

id objc_msgSend_rectForHeaderInSection_(void *a1, const char *a2, ...)
{
  return [a1 rectForHeaderInSection:];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_reflow(void *a1, const char *a2, ...)
{
  return _[a1 reflow];
}

id objc_msgSend_refreshControl(void *a1, const char *a2, ...)
{
  return _[a1 refreshControl];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellWithReuseIdentifier:];
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forHeaderFooterViewReuseIdentifier:];
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forSupplementaryViewOfKind:withReuseIdentifier:];
}

id objc_msgSend_registerURLHandlerWithSlug_completion_(void *a1, const char *a2, ...)
{
  return [a1 registerURLHandlerWithSlug:completion:];
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return _[a1 relationship];
}

id objc_msgSend_relevantEarnedInstance(void *a1, const char *a2, ...)
{
  return _[a1 relevantEarnedInstance];
}

id objc_msgSend_reloadCells(void *a1, const char *a2, ...)
{
  return _[a1 reloadCells];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadDataAnimated_(void *a1, const char *a2, ...)
{
  return [a1 reloadDataAnimated:];
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 reloadRowsAtIndexPaths:withRowAnimation:];
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSections:withRowAnimation:");
}

id objc_msgSend_reloadViewDataAtDate_(void *a1, const char *a2, ...)
{
  return [a1 reloadViewDataAtDate:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAllSamples(void *a1, const char *a2, ...)
{
  return _[a1 removeAllSamples];
}

id objc_msgSend_removeArrangedSubview_(void *a1, const char *a2, ...)
{
  return [a1 removeArrangedSubview:];
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return [a1 removeAttribute:range:];
}

id objc_msgSend_removeFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeFriend:completion:];
}

id objc_msgSend_removeFriendWithUUID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFriendWithUUID:completion:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeInitialLoadObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeInitialLoadObserver:];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeLeadingPadding(void *a1, const char *a2, ...)
{
  return _[a1 removeLeadingPadding];
}

id objc_msgSend_removeListenerID_(void *a1, const char *a2, ...)
{
  return [a1 removeListenerID:];
}

id objc_msgSend_removeMainSectionObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeMainSectionObserver];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInRange:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeRecentAndRelevantSectionObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRecentAndRelevantSectionObserver:");
}

id objc_msgSend_removeRecipient_(void *a1, const char *a2, ...)
{
  return [a1 removeRecipient];
}

id objc_msgSend_removeSamplesWithUUIDs_(void *a1, const char *a2, ...)
{
  return [a1 removeSamplesWithUUIDs:];
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 removeTarget:action:forControlEvents:];
}

id objc_msgSend_renderRingGroup_withRenderer_(void *a1, const char *a2, ...)
{
  return [a1 renderRingGroup:withRenderer:];
}

id objc_msgSend_renderRingGroupController_withRenderer_(void *a1, const char *a2, ...)
{
  return [a1 renderRingGroupController:withRenderer:];
}

id objc_msgSend_replaceCurrentItemWithPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 replaceCurrentItemWithPlayerItem:];
}

id objc_msgSend_representedElementCategory(void *a1, const char *a2, ...)
{
  return _[a1 representedElementCategory];
}

id objc_msgSend_representedElementKind(void *a1, const char *a2, ...)
{
  return _[a1 representedElementKind];
}

id objc_msgSend_representsToday(void *a1, const char *a2, ...)
{
  return _[a1 representsToday];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requiredDistanceForIntervalTimeGoalForStepKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 requiredDistanceForIntervalTimeGoalForStepKeyPath:];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resizableImageWithCapInsets_(void *a1, const char *a2, ...)
{
  return [a1 resizableImageWithCapInsets:];
}

id objc_msgSend_resizableImageWithCapInsets_resizingMode_(void *a1, const char *a2, ...)
{
  return [a1 resizableImageWithCapInsets:resizingMode:];
}

id objc_msgSend_resizeBadgeForCurrentViewSize(void *a1, const char *a2, ...)
{
  return _[a1 resizeBadgeForCurrentViewSize];
}

id objc_msgSend_resizedImageWithNewSize_(void *a1, const char *a2, ...)
{
  return [a1 resizedImageWithNewSize:];
}

id objc_msgSend_resourceProvider(void *a1, const char *a2, ...)
{
  return _[a1 resourceProvider];
}

id objc_msgSend_responseDataItems(void *a1, const char *a2, ...)
{
  return _[a1 responseDataItems];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_reverseGeocodeLocation_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseGeocodeLocation:completionHandler:");
}

id objc_msgSend_reverseSampleEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseSampleEnumerator];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_ringDiameter(void *a1, const char *a2, ...)
{
  return _[a1 ringDiameter];
}

id objc_msgSend_ringGroup(void *a1, const char *a2, ...)
{
  return _[a1 ringGroup];
}

id objc_msgSend_ringThickness(void *a1, const char *a2, ...)
{
  return _[a1 ringThickness];
}

id objc_msgSend_rings(void *a1, const char *a2, ...)
{
  return _[a1 rings];
}

id objc_msgSend_ringsView(void *a1, const char *a2, ...)
{
  return _[a1 ringsView];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_routeImage(void *a1, const char *a2, ...)
{
  return _[a1 routeImage];
}

id objc_msgSend_routeImageForSharing(void *a1, const char *a2, ...)
{
  return _[a1 routeImageForSharing];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return _[a1 rows];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_safeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 safeObjectAtIndex:];
}

id objc_msgSend_sampleAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 sampleAtIndex:];
}

id objc_msgSend_samples(void *a1, const char *a2, ...)
{
  return _[a1 samples];
}

id objc_msgSend_saturdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 saturdayGoal];
}

id objc_msgSend_saveContainerToCache_forWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveContainerToCache:forWorkout:workoutActivity:");
}

id objc_msgSend_saveObject_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 saveObject:withCompletion:];
}

id objc_msgSend_saveObjects_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 saveObjects:withCompletion:];
}

id objc_msgSend_saveWithQuantity_effortSampleCollection_workout_workoutActivity_healthStore_canSendAnalytics_(void *a1, const char *a2, ...)
{
  return [a1 saveWithQuantity:effortSampleCollection:workout:workoutActivity:healthStore:canSendAnalytics:];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForSmallWidth_bigWidth_(void *a1, const char *a2, ...)
{
  return [a1 scaledValueForSmallWidth:bigWidth:];
}

id objc_msgSend_scheduleFrom_goalType_(void *a1, const char *a2, ...)
{
  return [a1 scheduleFrom:goalType:];
}

id objc_msgSend_scheduledGoals(void *a1, const char *a2, ...)
{
  return _[a1 scheduledGoals];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scrollOrRelayoutWeekIfNeededToDate_(void *a1, const char *a2, ...)
{
  return [a1 scrollOrRelayoutWeekIfNeededToDate:];
}

id objc_msgSend_scrollToDate_windowHeight_(void *a1, const char *a2, ...)
{
  return [a1 scrollToDate:];
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return [a1 scrollToRowAtIndexPath:atScrollPosition:animated:];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_scrollViewContentInset(void *a1, const char *a2, ...)
{
  return _[a1 scrollViewContentInset];
}

id objc_msgSend_scrolledPastMonthWithDate_(void *a1, const char *a2, ...)
{
  return [a1 scrolledPastMonthWithDate:];
}

id objc_msgSend_seahorse(void *a1, const char *a2, ...)
{
  return _[a1 seahorse];
}

id objc_msgSend_searchForText_withAutocompleteFetchContext_consumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchForText:withAutocompleteFetchContext:consumer:");
}

id objc_msgSend_secondUnit(void *a1, const char *a2, ...)
{
  return _[a1 secondUnit];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemBackgroundColor];
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return _[a1 secondaryTextProperties];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _[a1 secondsFromGMT];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionForFriendsCompetingWithMe(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsCompetingWithMe];
}

id objc_msgSend_sectionForFriendsHidingDataFromMe(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsHidingDataFromMe];
}

id objc_msgSend_sectionForFriendsInvitedByMe(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsInvitedByMe];
}

id objc_msgSend_sectionForFriendsInvitingMe(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsInvitingMe];
}

id objc_msgSend_sectionForFriendsMyDataIsHiddenFrom(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsMyDataIsHiddenFrom];
}

id objc_msgSend_sectionForFriendsRequestedToCompeteByMe(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsRequestedToCompeteByMe];
}

id objc_msgSend_sectionForFriendsRequestedToDowngradeByMe(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsRequestedToDowngradeByMe];
}

id objc_msgSend_sectionForFriendsRequestingMeToCompete(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsRequestingMeToCompete];
}

id objc_msgSend_sectionForFriendsWithNoHiding(void *a1, const char *a2, ...)
{
  return _[a1 sectionForFriendsWithNoHiding];
}

id objc_msgSend_sectionsForDisplayContext_(void *a1, const char *a2, ...)
{
  return [a1 sectionsForDisplayContext:];
}

id objc_msgSend_sedentaryColors(void *a1, const char *a2, ...)
{
  return _[a1 sedentaryColors];
}

id objc_msgSend_segControlToBaselineConstraint(void *a1, const char *a2, ...)
{
  return _[a1 segControlToBaselineConstraint];
}

id objc_msgSend_segment(void *a1, const char *a2, ...)
{
  return _[a1 segment];
}

id objc_msgSend_segmentIndex(void *a1, const char *a2, ...)
{
  return _[a1 segmentIndex];
}

id objc_msgSend_segmentedControl(void *a1, const char *a2, ...)
{
  return _[a1 segmentedControl];
}

id objc_msgSend_segments(void *a1, const char *a2, ...)
{
  return _[a1 segments];
}

id objc_msgSend_segmentsExpanded(void *a1, const char *a2, ...)
{
  return _[a1 segmentsExpanded];
}

id objc_msgSend_segmentsForWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 segmentsForWorkout:completion:];
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedIndex];
}

id objc_msgSend_selectedPaceFormat(void *a1, const char *a2, ...)
{
  return _[a1 selectedPaceFormat];
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedSegmentIndex];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_sendCompetitionInviteToFriendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendCompetitionInviteToFriendUUID:completion:];
}

id objc_msgSend_sendCompetitionRequestToFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendCompetitionRequestToFriend:completion:];
}

id objc_msgSend_sendDidViewTrainingLoadAnalyticsFromURL_(void *a1, const char *a2, ...)
{
  return [a1 sendDidViewTrainingLoadAnalyticsFromURL:];
}

id objc_msgSend_sendFriendInviteToDestination_callerID_serviceIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendFriendInviteToDestination:callerID:serviceIdentifier:completion:];
}

id objc_msgSend_sendInvitationToDestinations_callerID_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendInvitationToDestinations:callerID:completion:];
}

id objc_msgSend_sendInviteToRecipient_callerID_serviceIdentifier_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 sendInviteToRecipient:callerID:serviceIdentifier:withCompletion:];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return _[a1 separatorInset];
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return _[a1 separatorView];
}

id objc_msgSend_serializedConfigurationContainsRoute(void *a1, const char *a2, ...)
{
  return _[a1 serializedConfigurationContainsRoute];
}

id objc_msgSend_serializedConfigurationDataIncludingRoute_(void *a1, const char *a2, ...)
{
  return [a1 serializedConfigurationDataIncludingRoute:];
}

id objc_msgSend_serializedConfigurationRouteSnapshotData(void *a1, const char *a2, ...)
{
  return _[a1 serializedConfigurationRouteSnapshotData];
}

id objc_msgSend_serializedConfigurationWithEmbedding_snapshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedConfigurationWithEmbedding:snapshot:");
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serviceIdentifier];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAcceptTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptTintColor:];
}

id objc_msgSend_setAccessibilityHint_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityHint:];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityLabel:];
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityTraits:];
}

id objc_msgSend_setAccessibilityViewIsModal_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityViewIsModal:];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryType:];
}

id objc_msgSend_setAchUnitManager_(void *a1, const char *a2, ...)
{
  return [a1 setAchUnitManager:];
}

id objc_msgSend_setAchievement_(void *a1, const char *a2, ...)
{
  return [a1 setAchievement:];
}

id objc_msgSend_setAchievementSelectedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setAchievementSelectedBlock:];
}

id objc_msgSend_setAchievementTappedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAchievementTappedHandler:];
}

id objc_msgSend_setAchievements_(void *a1, const char *a2, ...)
{
  return [a1 setAchievements:];
}

id objc_msgSend_setActionAtItemEnd_(void *a1, const char *a2, ...)
{
  return [a1 setActionAtItemEnd:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActiveEnergy_(void *a1, const char *a2, ...)
{
  return [a1 setActiveEnergy:];
}

id objc_msgSend_setActivityDashboardViewController_(void *a1, const char *a2, ...)
{
  return [a1 setActivityDashboardViewController:];
}

id objc_msgSend_setActivityDataVisible_friendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 setActivityDataVisible:friendUUID:completion:];
}

id objc_msgSend_setActivityDataVisible_toFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 setActivityDataVisible:toFriend:completion:];
}

id objc_msgSend_setActivityLevels_activityMoveMode_(void *a1, const char *a2, ...)
{
  return [a1 setActivityLevels:activityMoveMode:];
}

id objc_msgSend_setActivitySharingViewController_(void *a1, const char *a2, ...)
{
  return [a1 setActivitySharingViewController:];
}

id objc_msgSend_setActivitySummary_animated_(void *a1, const char *a2, ...)
{
  return [a1 setActivitySummary:animated:];
}

id objc_msgSend_setActivitySummaryProvider_(void *a1, const char *a2, ...)
{
  return [a1 setActivitySummaryProvider:];
}

id objc_msgSend_setActivityTileNavController_(void *a1, const char *a2, ...)
{
  return [a1 setActivityTileNavController:];
}

id objc_msgSend_setActivityTileViewController_(void *a1, const char *a2, ...)
{
  return [a1 setActivityTileViewController:];
}

id objc_msgSend_setActivityType_(void *a1, const char *a2, ...)
{
  return [a1 setActivityType:];
}

id objc_msgSend_setActivityTypeKey_(void *a1, const char *a2, ...)
{
  return [a1 setActivityTypeKey:];
}

id objc_msgSend_setAdditionalSafeAreaInsets_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalSafeAreaInsets:];
}

id objc_msgSend_setAdditionalServiceIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalServiceIdentifiers:];
}

id objc_msgSend_setAdditionalSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalSpacing:];
}

id objc_msgSend_setAdditionalSpacingPerRow_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalSpacingPerRow:];
}

id objc_msgSend_setAddresses_(void *a1, const char *a2, ...)
{
  return [a1 setAddresses:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAllowsCancel_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsCancel:];
}

id objc_msgSend_setAllowsDefaultTighteningForTruncation_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsDefaultTighteningForTruncation:];
}

id objc_msgSend_setAllowsEditing_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsEditing:];
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsSelection:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return [a1 setAlwaysBounceVertical:];
}

id objc_msgSend_setAnalyticsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAnalyticsHandler:];
}

id objc_msgSend_setAnchorRule_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorRule:];
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationDuration:];
}

id objc_msgSend_setAppBadgeAggregator_(void *a1, const char *a2, ...)
{
  return [a1 setAppBadgeAggregator:];
}

id objc_msgSend_setAppIconFormat_(void *a1, const char *a2, ...)
{
  return [a1 setAppIconFormat:];
}

id objc_msgSend_setAppIconWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAppIconWidth:];
}

id objc_msgSend_setAppliesLargeCellInset_(void *a1, const char *a2, ...)
{
  return [a1 setAppliesLargeCellInset:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setAvPlayer_(void *a1, const char *a2, ...)
{
  return [a1 setAvPlayer:];
}

id objc_msgSend_setAverageHeartRate_(void *a1, const char *a2, ...)
{
  return [a1 setAverageHeartRate:];
}

id objc_msgSend_setAverageText_(void *a1, const char *a2, ...)
{
  return [a1 setAverageText:];
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAxis:];
}

id objc_msgSend_setAxisDescriptorPadding_(void *a1, const char *a2, ...)
{
  return [a1 setAxisDescriptorPadding:];
}

id objc_msgSend_setAxisSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setAxisSpacing:];
}

id objc_msgSend_setBackBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setBackBarButtonItem:];
}

id objc_msgSend_setBackButtonDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setBackButtonDisplayMode:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundView:];
}

id objc_msgSend_setBackingOriginOffset_(void *a1, const char *a2, ...)
{
  return [a1 setBackingOriginOffset:];
}

id objc_msgSend_setBadgeBacksideAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeBacksideAttributedString:];
}

id objc_msgSend_setBadgeBacksideIcon_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeBacksideIcon:];
}

id objc_msgSend_setBadgeColor_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeColor];
}

id objc_msgSend_setBadgeContainer_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeContainer:];
}

id objc_msgSend_setBadgeText_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeText:];
}

id objc_msgSend_setBadgeTextAttributes_forState_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeTextAttributes:forState:];
}

id objc_msgSend_setBadgeValue_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeValue:];
}

id objc_msgSend_setBarColor_(void *a1, const char *a2, ...)
{
  return [a1 setBarColor:];
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBarStyle:];
}

id objc_msgSend_setBaseBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBaseBackgroundColor:];
}

id objc_msgSend_setBaseForegroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBaseForegroundColor:];
}

id objc_msgSend_setBaselineRelativeArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineRelativeArrangement:];
}

id objc_msgSend_setBodyLabel_(void *a1, const char *a2, ...)
{
  return [a1 setBodyLabel:];
}

id objc_msgSend_setBoldFont_(void *a1, const char *a2, ...)
{
  return [a1 setBoldFont:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setBrowsingConsentAlertCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setBrowsingConsentAlertCompletion:];
}

id objc_msgSend_setBrowsingConsentAlertController_(void *a1, const char *a2, ...)
{
  return [a1 setBrowsingConsentAlertController:];
}

id objc_msgSend_setBuddyControllerDoneAction_(void *a1, const char *a2, ...)
{
  return [a1 setBuddyControllerDoneAction:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setBundleIdentifiers:];
}

id objc_msgSend_setBurnBarExpanded_(void *a1, const char *a2, ...)
{
  return [a1 setBurnBarExpanded:];
}

id objc_msgSend_setButtonSize_(void *a1, const char *a2, ...)
{
  return [a1 setButtonSize:];
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObject:];
}

id objc_msgSend_setCadenceSamples_(void *a1, const char *a2, ...)
{
  return [a1 setCadenceSamples:];
}

id objc_msgSend_setCalendarUnit_(void *a1, const char *a2, ...)
{
  return [a1 setCalendarUnit:];
}

id objc_msgSend_setCanCancelContentTouches_(void *a1, const char *a2, ...)
{
  return [a1 setCanCancelContentTouches:];
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:error:];
}

id objc_msgSend_setCelebrationVideoContainer_(void *a1, const char *a2, ...)
{
  return [a1 setCelebrationVideoContainer:];
}

id objc_msgSend_setCellClass_(void *a1, const char *a2, ...)
{
  return [a1 setCellClass:];
}

id objc_msgSend_setCellClassesBySection_(void *a1, const char *a2, ...)
{
  return [a1 setCellClassesBySection:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setCircleHidden_updateCircleColor_(void *a1, const char *a2, ...)
{
  return [a1 setCircleHidden:updateCircleColor:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionView:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setCompetition_(void *a1, const char *a2, ...)
{
  return [a1 setCompetition:];
}

id objc_msgSend_setCompletedWelcomeViews(void *a1, const char *a2, ...)
{
  return _[a1 setCompletedWelcomeViews];
}

id objc_msgSend_setCompletedWhatsNewViews(void *a1, const char *a2, ...)
{
  return _[a1 setCompletedWhatsNewViews];
}

id objc_msgSend_setComposeInputLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setComposeInputLineHeight:];
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:];
}

id objc_msgSend_setConfigurationUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurationUpdateHandler:];
}

id objc_msgSend_setConnectionOptions_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionOptions:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setContact_(void *a1, const char *a2, ...)
{
  return [a1 setContact:];
}

id objc_msgSend_setContacts_(void *a1, const char *a2, ...)
{
  return [a1 setContacts:];
}

id objc_msgSend_setContainerGuide_(void *a1, const char *a2, ...)
{
  return [a1 setContainerGuide:];
}

id objc_msgSend_setContentBufferEdgeInsets_(void *a1, const char *a2, ...)
{
  return [a1 setContentBufferEdgeInsets:];
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentCompressionResistancePriority:forAxis:];
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setContentConfiguration:];
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentHuggingPriority:forAxis:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setContentInsetAdjustmentBehavior:];
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return [a1 setContentInsets:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:];
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:animated:];
}

id objc_msgSend_setContentScrollView_forEdge_(void *a1, const char *a2, ...)
{
  return [a1 setContentScrollView:forEdge:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return [a1 setContents:];
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 setContentsScale:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCountLabelTopConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setCountLabelTopConstraint:];
}

id objc_msgSend_setCountLimit_(void *a1, const char *a2, ...)
{
  return [a1 setCountLimit:];
}

id objc_msgSend_setCurrentFilteredTypeIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentFilteredTypeIdentifier:completion:];
}

id objc_msgSend_setCurrentSection_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSection:];
}

id objc_msgSend_setCurrentValue_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentValue:];
}

id objc_msgSend_setCurrentValue_goalValue_unitString_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentValue:goalValue:unitString:];
}

id objc_msgSend_setCurrentValue_unitString_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentValue:unitString:];
}

id objc_msgSend_setCustomSplits_(void *a1, const char *a2, ...)
{
  return [a1 setCustomSplits:];
}

id objc_msgSend_setCyclingSpeedSamples_(void *a1, const char *a2, ...)
{
  return [a1 setCyclingSpeedSamples:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDateBottomMargin_(void *a1, const char *a2, ...)
{
  return [a1 setDateBottomMargin:];
}

id objc_msgSend_setDateDiameter_(void *a1, const char *a2, ...)
{
  return [a1 setDateDiameter:];
}

id objc_msgSend_setDateFont_(void *a1, const char *a2, ...)
{
  return [a1 setDateFont:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDateInterval_(void *a1, const char *a2, ...)
{
  return [a1 setDateInterval:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDateTopMargin_(void *a1, const char *a2, ...)
{
  return [a1 setDateTopMargin:];
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return [a1 setDay:];
}

id objc_msgSend_setDayDiameter_(void *a1, const char *a2, ...)
{
  return [a1 setDayDiameter:];
}

id objc_msgSend_setDebugIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDebugIdentifier];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDetailText_(void *a1, const char *a2, ...)
{
  return [a1 setDetailText:];
}

id objc_msgSend_setDidAppear_(void *a1, const char *a2, ...)
{
  return [a1 setDidAppear:];
}

id objc_msgSend_setDidSetInitialSwimmingPaceFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDidSetInitialSwimmingPaceFormat:];
}

id objc_msgSend_setDidSetupBadgeView_(void *a1, const char *a2, ...)
{
  return [a1 setDidSetupBadgeView:];
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return [a1 setDirection:];
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setDirectionalLayoutMargins:];
}

id objc_msgSend_setDirectionalLockEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDirectionalLockEnabled:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:];
}

id objc_msgSend_setDiscardBackBuffers_(void *a1, const char *a2, ...)
{
  return [a1 setDiscardBackBuffers:];
}

id objc_msgSend_setDisplayFilter_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayFilter:];
}

id objc_msgSend_setDisplayIcon_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayIcon];
}

id objc_msgSend_setDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayMode:];
}

id objc_msgSend_setDisplayScale_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayScale:];
}

id objc_msgSend_setDisplayedPropertyKeys_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayedPropertyKeys:];
}

id objc_msgSend_setDistance_(void *a1, const char *a2, ...)
{
  return [a1 setDistance:];
}

id objc_msgSend_setDistanceGoalAchievedTime_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceGoalAchievedTime:];
}

id objc_msgSend_setDistanceInUserUnit_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceInUserUnit:];
}

id objc_msgSend_setDistanceSamples_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceSamples:];
}

id objc_msgSend_setDistanceUnit_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceUnit:];
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return [a1 setDistribution:];
}

id objc_msgSend_setDominantStrokeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDominantStrokeStyle:];
}

id objc_msgSend_setDownhillRun_(void *a1, const char *a2, ...)
{
  return [a1 setDownhillRun:];
}

id objc_msgSend_setDownhillRunIndex_(void *a1, const char *a2, ...)
{
  return [a1 setDownhillRunIndex:];
}

id objc_msgSend_setDownhillRuns_(void *a1, const char *a2, ...)
{
  return [a1 setDownhillRuns:];
}

id objc_msgSend_setDownhillRunsStats_(void *a1, const char *a2, ...)
{
  return [a1 setDownhillRunsStats:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEarnedInstanceCount_(void *a1, const char *a2, ...)
{
  return [a1 setEarnedInstanceCount:];
}

id objc_msgSend_setEarnedInstanceCountLabelBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setEarnedInstanceCountLabelBackgroundColor:];
}

id objc_msgSend_setEdgeInsets_(void *a1, const char *a2, ...)
{
  return [a1 setEdgeInsets:];
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return [a1 setEditable:];
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return [a1 setEditing:animated:];
}

id objc_msgSend_setEffortQuantity_(void *a1, const char *a2, ...)
{
  return [a1 setEffortQuantity:];
}

id objc_msgSend_setEffortSampleCollection_(void *a1, const char *a2, ...)
{
  return [a1 setEffortSampleCollection:];
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTime:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return [a1 setEndDate:];
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedRowHeight:];
}

id objc_msgSend_setEvictsObjectsWhenApplicationEntersBackground_(void *a1, const char *a2, ...)
{
  return [a1 setEvictsObjectsWhenApplicationEntersBackground:];
}

id objc_msgSend_setEvictsObjectsWithDiscardedContent_(void *a1, const char *a2, ...)
{
  return [a1 setEvictsObjectsWithDiscardedContent:];
}

id objc_msgSend_setExcludedActivityTypes_(void *a1, const char *a2, ...)
{
  return [a1 setExcludedActivityTypes:];
}

id objc_msgSend_setExclusiveTouch_(void *a1, const char *a2, ...)
{
  return [a1 setExclusiveTouch:];
}

id objc_msgSend_setExpanded_(void *a1, const char *a2, ...)
{
  return [a1 setExpanded:];
}

id objc_msgSend_setExpectedSplitDistance_(void *a1, const char *a2, ...)
{
  return [a1 setExpectedSplitDistance:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFirstCoordinate_(void *a1, const char *a2, ...)
{
  return [a1 setFirstCoordinate:];
}

id objc_msgSend_setFirstCoordinateUpdatedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFirstCoordinateUpdatedBlock:];
}

id objc_msgSend_setFirstWeekday_(void *a1, const char *a2, ...)
{
  return [a1 setFirstWeekday:];
}

id objc_msgSend_setFitnessUIFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 setFitnessUIFormattingManager:];
}

id objc_msgSend_setFixedBadgeAngle_(void *a1, const char *a2, ...)
{
  return [a1 setFixedBadgeAngle:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFont_textColor_(void *a1, const char *a2, ...)
{
  return [a1 setFont:textColor:];
}

id objc_msgSend_setForceAMPMOnFirstLabel_(void *a1, const char *a2, ...)
{
  return [a1 setForceAMPMOnFirstLabel:];
}

id objc_msgSend_setFormatsForFriend_(void *a1, const char *a2, ...)
{
  return [a1 setFormatsForFriend];
}

id objc_msgSend_setFormattingContext_(void *a1, const char *a2, ...)
{
  return [a1 setFormattingContext:];
}

id objc_msgSend_setFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 setFormattingManager:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setFriend_(void *a1, const char *a2, ...)
{
  return [a1 setFriend:];
}

id objc_msgSend_setFriend_competition_(void *a1, const char *a2, ...)
{
  return [a1 setFriend:competition:];
}

id objc_msgSend_setFriend_snapshot_animated_(void *a1, const char *a2, ...)
{
  return [a1 setFriend:snapshot:animated:];
}

id objc_msgSend_setFriend_snapshot_formattingManager_animated_(void *a1, const char *a2, ...)
{
  return [a1 setFriend:snapshot:formattingManager:animated:];
}

id objc_msgSend_setFriendAchievements_(void *a1, const char *a2, ...)
{
  return [a1 setFriendAchievements:];
}

id objc_msgSend_setFriendManager_(void *a1, const char *a2, ...)
{
  return [a1 setFriendManager:];
}

id objc_msgSend_setFriendsSetupCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setFriendsSetupCoordinator:];
}

id objc_msgSend_setFriendsSetupViewController_(void *a1, const char *a2, ...)
{
  return [a1 setFriendsSetupViewController:];
}

id objc_msgSend_setFullFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFullFrame:];
}

id objc_msgSend_setGoalColor_(void *a1, const char *a2, ...)
{
  return [a1 setGoalColor:];
}

id objc_msgSend_setGoalDescriptionFont_(void *a1, const char *a2, ...)
{
  return [a1 setGoalDescriptionFont:];
}

id objc_msgSend_setGoalUnitStringFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setGoalUnitStringFormatter:];
}

id objc_msgSend_setGoalValueStringFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setGoalValueStringFormatter:];
}

id objc_msgSend_setGroundContactTimeSamples_(void *a1, const char *a2, ...)
{
  return [a1 setGroundContactTimeSamples:];
}

id objc_msgSend_setGroupDiameter_(void *a1, const char *a2, ...)
{
  return [a1 setGroupDiameter:];
}

id objc_msgSend_setGymKitIconWidth_(void *a1, const char *a2, ...)
{
  return [a1 setGymKitIconWidth:];
}

id objc_msgSend_setHasWorkout_(void *a1, const char *a2, ...)
{
  return [a1 setHasWorkout:];
}

id objc_msgSend_setHeaderString_(void *a1, const char *a2, ...)
{
  return [a1 setHeaderString:];
}

id objc_msgSend_setHealthStore_(void *a1, const char *a2, ...)
{
  return [a1 setHealthStore:];
}

id objc_msgSend_setHeartRateReadings_(void *a1, const char *a2, ...)
{
  return [a1 setHeartRateReadings:];
}

id objc_msgSend_setHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setHeightConstraint:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHideClippedLabels_(void *a1, const char *a2, ...)
{
  return [a1 setHideClippedLabels:];
}

id objc_msgSend_setHidesKeyLine_(void *a1, const char *a2, ...)
{
  return [a1 setHidesKeyLine:];
}

id objc_msgSend_setHidesPromptInLandscape_(void *a1, const char *a2, ...)
{
  return [a1 setHidesPromptInLandscape:];
}

id objc_msgSend_setHidesSeparator_(void *a1, const char *a2, ...)
{
  return [a1 setHidesSeparator:];
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return [a1 setHidesWhenStopped:];
}

id objc_msgSend_setHighlightedLabelColor_(void *a1, const char *a2, ...)
{
  return [a1 setHighlightedLabelColor:];
}

id objc_msgSend_setHighlightedSubLabelColor_(void *a1, const char *a2, ...)
{
  return [a1 setHighlightedSubLabelColor:];
}

id objc_msgSend_setHistoryDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 setHistoryDataProvider:];
}

id objc_msgSend_setHistoryPagingViewControllerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setHistoryPagingViewControllerDelegate:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return [a1 setHyphenationFactor:];
}

id objc_msgSend_setIconImageView_(void *a1, const char *a2, ...)
{
  return [a1 setIconImageView:];
}

id objc_msgSend_setIconVariant2x_(void *a1, const char *a2, ...)
{
  return [a1 setIconVariant2x:];
}

id objc_msgSend_setIconVariant3x_(void *a1, const char *a2, ...)
{
  return [a1 setIconVariant3x:];
}

id objc_msgSend_setIgnoreTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setIgnoreTintColor:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImage_forCacheKey_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forCacheKey:];
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forState:];
}

id objc_msgSend_setImageDimension_(void *a1, const char *a2, ...)
{
  return [a1 setImageDimension:];
}

id objc_msgSend_setImageFactory_(void *a1, const char *a2, ...)
{
  return [a1 setImageFactory:];
}

id objc_msgSend_setImagePadding_(void *a1, const char *a2, ...)
{
  return [a1 setImagePadding:];
}

id objc_msgSend_setImplicitGroupCreationThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setImplicitGroupCreationThreshold:];
}

id objc_msgSend_setIncludeUpcomingEventMembers_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeUpcomingEventMembers:];
}

id objc_msgSend_setIncrementButton_decrementButton_(void *a1, const char *a2, ...)
{
  return [a1 setIncrementButton:decrementButton:];
}

id objc_msgSend_setIndex_(void *a1, const char *a2, ...)
{
  return [a1 setIndex:];
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorStyle:];
}

id objc_msgSend_setIndoor_(void *a1, const char *a2, ...)
{
  return [a1 setIndoor:];
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setInteger:forKey:];
}

id objc_msgSend_setIntegerValue_(void *a1, const char *a2, ...)
{
  return [a1 setIntegerValue:];
}

id objc_msgSend_setInterspacing_(void *a1, const char *a2, ...)
{
  return [a1 setInterspacing:];
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return [a1 setInterval:];
}

id objc_msgSend_setIntervalIndex_(void *a1, const char *a2, ...)
{
  return [a1 setIntervalIndex:];
}

id objc_msgSend_setIntervals_(void *a1, const char *a2, ...)
{
  return [a1 setIntervals:];
}

id objc_msgSend_setIsAccessibilityElement_(void *a1, const char *a2, ...)
{
  return [a1 setIsAccessibilityElement:];
}

id objc_msgSend_setIsDiscoveryAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setIsDiscoveryAllowed:];
}

id objc_msgSend_setIsExpanded_(void *a1, const char *a2, ...)
{
  return [a1 setIsExpanded:];
}

id objc_msgSend_setIsPaused_(void *a1, const char *a2, ...)
{
  return [a1 setIsPaused:];
}

id objc_msgSend_setIsStandalonePhoneFitnessMode_(void *a1, const char *a2, ...)
{
  return [a1 setIsStandalonePhoneFitnessMode:];
}

id objc_msgSend_setIsStandalonePhoneFitnessMode_animated_(void *a1, const char *a2, ...)
{
  return [a1 setIsStandalonePhoneFitnessMode:animated:];
}

id objc_msgSend_setIsWatchWorkout_(void *a1, const char *a2, ...)
{
  return [a1 setIsWatchWorkout];
}

id objc_msgSend_setKeyColor_(void *a1, const char *a2, ...)
{
  return [a1 setKeyColor:];
}

id objc_msgSend_setKeyboardDismissMode_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardDismissMode:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLabelAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setLabelAttributes:];
}

id objc_msgSend_setLabelBaselineConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLabelBaselineConstraint:];
}

id objc_msgSend_setLabelColor_(void *a1, const char *a2, ...)
{
  return [a1 setLabelColor:];
}

id objc_msgSend_setLabelFirstBaselineConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLabelFirstBaselineConstraint:];
}

id objc_msgSend_setLabelFont_(void *a1, const char *a2, ...)
{
  return [a1 setLabelFont:];
}

id objc_msgSend_setLaneNumber_(void *a1, const char *a2, ...)
{
  return [a1 setLaneNumber:];
}

id objc_msgSend_setLapIndex_(void *a1, const char *a2, ...)
{
  return [a1 setLapIndex:];
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setLargeTitleDisplayMode:];
}

id objc_msgSend_setLastEffortAnchor_(void *a1, const char *a2, ...)
{
  return [a1 setLastEffortAnchor:];
}

id objc_msgSend_setLastPhoneCloudKitAccountFetchTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLastPhoneCloudKitAccountFetchTimestamp:];
}

id objc_msgSend_setLastWatchCloudKitAccountFetchTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLastWatchCloudKitAccountFetchTimestamp:];
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMargins:];
}

id objc_msgSend_setLayoutMarginsRelativeArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMarginsRelativeArrangement:];
}

id objc_msgSend_setLeadingMargin_(void *a1, const char *a2, ...)
{
  return [a1 setLeadingMargin:];
}

id objc_msgSend_setLeadingTextConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setLeadingTextConstraint:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setLineInsets_(void *a1, const char *a2, ...)
{
  return [a1 setLineInsets:];
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setLineSpacing:];
}

id objc_msgSend_setLinkButton_(void *a1, const char *a2, ...)
{
  return [a1 setLinkButton:];
}

id objc_msgSend_setLinkLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLinkLabel:];
}

id objc_msgSend_setLoadingView_(void *a1, const char *a2, ...)
{
  return [a1 setLoadingView:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setLocation_completion_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:completion:];
}

id objc_msgSend_setLocationFetcher_(void *a1, const char *a2, ...)
{
  return [a1 setLocationFetcher:];
}

id objc_msgSend_setLocationFetcherObserver_(void *a1, const char *a2, ...)
{
  return [a1 setLocationFetcherObserver:];
}

id objc_msgSend_setLocationReadings_(void *a1, const char *a2, ...)
{
  return [a1 setLocationReadings:];
}

id objc_msgSend_setMainCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 setMainCollectionView:];
}

id objc_msgSend_setMainSectionCellWidth_(void *a1, const char *a2, ...)
{
  return [a1 setMainSectionCellWidth:];
}

id objc_msgSend_setMainSectionDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setMainSectionDataSource:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMaxValue_(void *a1, const char *a2, ...)
{
  return [a1 setMaxValue:];
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumContentSizeCategory:];
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumFractionDigits:];
}

id objc_msgSend_setMaximumLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumLineHeight:];
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumValue:];
}

id objc_msgSend_setMenu_(void *a1, const char *a2, ...)
{
  return [a1 setMenu:];
}

id objc_msgSend_setMinValue_(void *a1, const char *a2, ...)
{
  return [a1 setMinValue:];
}

id objc_msgSend_setMindfulnessSessionsStatistics_(void *a1, const char *a2, ...)
{
  return [a1 setMindfulnessSessionsStatistics:];
}

id objc_msgSend_setMinimumFractionDigits_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumFractionDigits:];
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumInteritemSpacing:];
}

id objc_msgSend_setMinimumLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLineHeight:];
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLineSpacing:];
}

id objc_msgSend_setMinimumMiddleMargin_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumMiddleMargin:];
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumScaleFactor:];
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumValue:];
}

id objc_msgSend_setMinumumStepValueIncrement_(void *a1, const char *a2, ...)
{
  return [a1 setMinumumStepValueIncrement:];
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return [a1 setMinute:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return [a1 setMonth:];
}

id objc_msgSend_setMonthScrollDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setMonthScrollDelegate:];
}

id objc_msgSend_setMonthTitleBottomMargin_(void *a1, const char *a2, ...)
{
  return [a1 setMonthTitleBottomMargin:];
}

id objc_msgSend_setMonthTitleTopMargin_(void *a1, const char *a2, ...)
{
  return [a1 setMonthTitleTopMargin:];
}

id objc_msgSend_setMonthWeekStart_(void *a1, const char *a2, ...)
{
  return [a1 setMonthWeekStart:];
}

id objc_msgSend_setMovementEndDate_(void *a1, const char *a2, ...)
{
  return [a1 setMovementEndDate:];
}

id objc_msgSend_setMuteEnabled_forFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 setMuteEnabled:forFriend:completion:];
}

id objc_msgSend_setMuteEnabled_friendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 setMuteEnabled:friendUUID:completion:];
}

id objc_msgSend_setNCellsPerRow_(void *a1, const char *a2, ...)
{
  return [a1 setNCellsPerRow:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNameFont_(void *a1, const char *a2, ...)
{
  return [a1 setNameFont:];
}

id objc_msgSend_setNanoSystemSettingsManager_(void *a1, const char *a2, ...)
{
  return [a1 setNanoSystemSettingsManager:];
}

id objc_msgSend_setNarrowFrame_(void *a1, const char *a2, ...)
{
  return [a1 setNarrowFrame:];
}

id objc_msgSend_setNavBarBackdropGroupName_(void *a1, const char *a2, ...)
{
  return [a1 setNavBarBackdropGroupName:];
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationBarHidden:];
}

id objc_msgSend_setNavigationBarHidden_animated_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationBarHidden:animated:];
}

id objc_msgSend_setNavigationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationDelegate:];
}

id objc_msgSend_setNavigationStackDisplacedBySetupController_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationStackDisplacedBySetupController:];
}

id objc_msgSend_setNavigationTracker_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationTracker:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setNeedsUpdateConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConfiguration];
}

id objc_msgSend_setNeedsWatchIcon_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsWatchIcon:];
}

id objc_msgSend_setNumLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumLines:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfWorkoutsForCacheKey_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfWorkoutsForCacheKey:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forCacheIndex_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forCacheIndex:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObservedProgress_(void *a1, const char *a2, ...)
{
  return [a1 setObservedProgress:];
}

id objc_msgSend_setOnDidTapMediaMomentItem_(void *a1, const char *a2, ...)
{
  return [a1 setOnDidTapMediaMomentItem:];
}

id objc_msgSend_setOnboardingCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setOnboardingCoordinator:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOpponentScoreViewWidth_(void *a1, const char *a2, ...)
{
  return [a1 setOpponentScoreViewWidth:];
}

id objc_msgSend_setOtherAddressesAlreadyChosen_(void *a1, const char *a2, ...)
{
  return [a1 setOtherAddressesAlreadyChosen:];
}

id objc_msgSend_setPace100UnitFont_(void *a1, const char *a2, ...)
{
  return [a1 setPace100UnitFont:];
}

id objc_msgSend_setPaceSamples_(void *a1, const char *a2, ...)
{
  return [a1 setPaceSamples:];
}

id objc_msgSend_setPaceSelectionDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setPaceSelectionDelegate:];
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPagingEnabled:];
}

id objc_msgSend_setParagraphStyle_(void *a1, const char *a2, ...)
{
  return [a1 setParagraphStyle:];
}

id objc_msgSend_setPasswordController_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordController:];
}

id objc_msgSend_setPasswordEnteredHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordEnteredHandler:];
}

id objc_msgSend_setPasswordEntryCancelledHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordEntryCancelledHandler:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPauseRingsCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setPauseRingsCoordinator:];
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return [a1 setPaused:];
}

id objc_msgSend_setPercentage_ofRingAtIndex_animated_(void *a1, const char *a2, ...)
{
  return [a1 setPercentage:ofRingAtIndex:animated:];
}

id objc_msgSend_setPhase_animated_(void *a1, const char *a2, ...)
{
  return [a1 setPhase:animated:];
}

id objc_msgSend_setPhoneCloudKitAccountIsActive_(void *a1, const char *a2, ...)
{
  return [a1 setPhoneCloudKitAccountIsActive:];
}

id objc_msgSend_setPillBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setPillBackgroundColor:];
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return [a1 setPlayer:];
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return [a1 setPosition:];
}

id objc_msgSend_setPowerSamples_(void *a1, const char *a2, ...)
{
  return [a1 setPowerSamples:];
}

id objc_msgSend_setPredicateForEnablingContact_(void *a1, const char *a2, ...)
{
  return [a1 setPredicateForEnablingContact:];
}

id objc_msgSend_setPredicateForSelectionOfContact_(void *a1, const char *a2, ...)
{
  return [a1 setPredicateForSelectionOfContact:];
}

id objc_msgSend_setPredictsBasedOnOutgoingInteraction_(void *a1, const char *a2, ...)
{
  return [a1 setPredictsBasedOnOutgoingInteraction:];
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredAction:];
}

id objc_msgSend_setPreferredAppStoreIconWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredAppStoreIconWidth:];
}

id objc_msgSend_setPreferredWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredWidth:];
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersLargeTitles:];
}

id objc_msgSend_setPrefersSideBySideTextAndSecondaryText_(void *a1, const char *a2, ...)
{
  return [a1 setPrefersSideBySideTextAndSecondaryText:];
}

id objc_msgSend_setPrefetchingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPrefetchingEnabled:];
}

id objc_msgSend_setPregnancyStateProvider_(void *a1, const char *a2, ...)
{
  return [a1 setPregnancyStateProvider:];
}

id objc_msgSend_setPresentedViewControllerShouldUseDarkMode_(void *a1, const char *a2, ...)
{
  return [a1 setPresentedViewControllerShouldUseDarkMode:];
}

id objc_msgSend_setPreventsDisplaySleepDuringVideoPlayback_(void *a1, const char *a2, ...)
{
  return [a1 setPreventsDisplaySleepDuringVideoPlayback:];
}

id objc_msgSend_setPrimaryScoreFont_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryScoreFont:];
}

id objc_msgSend_setPrimaryScoreUnitFont_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryScoreUnitFont:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return [a1 setProgress:];
}

id objc_msgSend_setProgressTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setProgressTintColor:];
}

id objc_msgSend_setReachableEmailAddress_(void *a1, const char *a2, ...)
{
  return [a1 setReachableEmailAddress:];
}

id objc_msgSend_setReachablePhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 setReachablePhoneNumber:];
}

id objc_msgSend_setRecentAndRelevantCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 setRecentAndRelevantCollectionView:];
}

id objc_msgSend_setRecentAndRelevantDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setRecentAndRelevantDataSource:];
}

id objc_msgSend_setRecipient_(void *a1, const char *a2, ...)
{
  return [a1 setRecipient:];
}

id objc_msgSend_setRecipientView_(void *a1, const char *a2, ...)
{
  return [a1 setRecipientView:];
}

id objc_msgSend_setRecoveryHeartRateReadings_(void *a1, const char *a2, ...)
{
  return [a1 setRecoveryHeartRateReadings:];
}

id objc_msgSend_setRefreshControl_(void *a1, const char *a2, ...)
{
  return [a1 setRefreshControl:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItems:];
}

id objc_msgSend_setRingDiameter_(void *a1, const char *a2, ...)
{
  return [a1 setRingDiameter:];
}

id objc_msgSend_setRingThickness_(void *a1, const char *a2, ...)
{
  return [a1 setRingThickness:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setRoundingValue_(void *a1, const char *a2, ...)
{
  return [a1 setRoundingValue:];
}

id objc_msgSend_setRouteImageForSharing_(void *a1, const char *a2, ...)
{
  return [a1 setRouteImageForSharing];
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setRowHeight:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setScrollDirection_(void *a1, const char *a2, ...)
{
  return [a1 setScrollDirection:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setScrollViewContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setScrollViewContentInset:];
}

id objc_msgSend_setSearchTypes_(void *a1, const char *a2, ...)
{
  return [a1 setSearchTypes:];
}

id objc_msgSend_setSecondaryScoreFont_(void *a1, const char *a2, ...)
{
  return [a1 setSecondaryScoreFont:];
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return [a1 setSecondaryText:];
}

id objc_msgSend_setSection_(void *a1, const char *a2, ...)
{
  return [a1 setSection:];
}

id objc_msgSend_setSectionFooterHeight_(void *a1, const char *a2, ...)
{
  return [a1 setSectionFooterHeight:];
}

id objc_msgSend_setSectionHeaderTopPadding_(void *a1, const char *a2, ...)
{
  return [a1 setSectionHeaderTopPadding:];
}

id objc_msgSend_setSectionHeadersPinToVisibleBounds_(void *a1, const char *a2, ...)
{
  return [a1 setSectionHeadersPinToVisibleBounds:];
}

id objc_msgSend_setSegControlToBaselineConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setSegControlToBaselineConstraint:];
}

id objc_msgSend_setSegment_(void *a1, const char *a2, ...)
{
  return [a1 setSegment:];
}

id objc_msgSend_setSegmentIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSegmentIndex:];
}

id objc_msgSend_setSegments_(void *a1, const char *a2, ...)
{
  return [a1 setSegments:];
}

id objc_msgSend_setSegmentsExpanded_(void *a1, const char *a2, ...)
{
  return [a1 setSegmentsExpanded:];
}

id objc_msgSend_setSelectedBackgroundView_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedBackgroundView:];
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedIndex:];
}

id objc_msgSend_setSelectedPaceFormat_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedPaceFormat:];
}

id objc_msgSend_setSelectedSegmentIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedSegmentIndex:];
}

id objc_msgSend_setSelectedViewController_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedViewController:];
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSelectionStyle:];
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorColor:];
}

id objc_msgSend_setSeparatorHidden_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorHidden:];
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorStyle:];
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setServiceIdentifier];
}

id objc_msgSend_setSet_(void *a1, const char *a2, ...)
{
  return [a1 setSet:];
}

id objc_msgSend_setSetIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSetIndex:];
}

id objc_msgSend_setSetupNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 setSetupNavigationController:];
}

id objc_msgSend_setSeymourAvailabilityManager_(void *a1, const char *a2, ...)
{
  return [a1 setSeymourAvailabilityManager:];
}

id objc_msgSend_setSeymourNavController_(void *a1, const char *a2, ...)
{
  return [a1 setSeymourNavController:];
}

id objc_msgSend_setShadowBlur_(void *a1, const char *a2, ...)
{
  return [a1 setShadowBlur:];
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return [a1 setShadowColor:];
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOffset:];
}

id objc_msgSend_setSharingImage_(void *a1, const char *a2, ...)
{
  return [a1 setSharingImage:];
}

id objc_msgSend_setSharingText_(void *a1, const char *a2, ...)
{
  return [a1 setSharingText:];
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return [a1 setShortcutItems:];
}

id objc_msgSend_setShortenedBadgeBacksideStringProvider_(void *a1, const char *a2, ...)
{
  return [a1 setShortenedBadgeBacksideStringProvider:];
}

id objc_msgSend_setShouldAdjustButtonTrayForKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 setShouldAdjustButtonTrayForKeyboard:];
}

id objc_msgSend_setShouldCenterLines_(void *a1, const char *a2, ...)
{
  return [a1 setShouldCenterLines:];
}

id objc_msgSend_setShouldIncludeActivitySummaryPrivateProperties_(void *a1, const char *a2, ...)
{
  return [a1 setShouldIncludeActivitySummaryPrivateProperties:];
}

id objc_msgSend_setShouldIncludeActivitySummaryStatistics_(void *a1, const char *a2, ...)
{
  return [a1 setShouldIncludeActivitySummaryStatistics:];
}

id objc_msgSend_setShouldUseFakeSegmentMarkers_(void *a1, const char *a2, ...)
{
  return [a1 setShouldUseFakeSegmentMarkers:];
}

id objc_msgSend_setShownContacts_(void *a1, const char *a2, ...)
{
  return [a1 setShownContacts:];
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsHorizontalScrollIndicator:];
}

id objc_msgSend_setShowsSeparator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsSeparator:];
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsVerticalScrollIndicator:];
}

id objc_msgSend_setSideMargin_(void *a1, const char *a2, ...)
{
  return [a1 setSideMargin:];
}

id objc_msgSend_setSortDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setSortDescriptor:];
}

id objc_msgSend_setSortedTypeIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setSortedTypeIdentifiers:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setSpecialization_(void *a1, const char *a2, ...)
{
  return [a1 setSpecialization:];
}

id objc_msgSend_setSpinner_(void *a1, const char *a2, ...)
{
  return [a1 setSpinner:];
}

id objc_msgSend_setSplit_(void *a1, const char *a2, ...)
{
  return [a1 setSplit:];
}

id objc_msgSend_setSplitIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSplitIndex:];
}

id objc_msgSend_setSplits_(void *a1, const char *a2, ...)
{
  return [a1 setSplits:];
}

id objc_msgSend_setSplitsDictionary_(void *a1, const char *a2, ...)
{
  return [a1 setSplitsDictionary:];
}

id objc_msgSend_setSplitsExpanded_(void *a1, const char *a2, ...)
{
  return [a1 setSplitsExpanded:];
}

id objc_msgSend_setSpriteSheet_(void *a1, const char *a2, ...)
{
  return [a1 setSpriteSheet:];
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setStartDate:];
}

id objc_msgSend_setStepKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setStepKeyPath:];
}

id objc_msgSend_setStrideLengthSamples_(void *a1, const char *a2, ...)
{
  return [a1 setStrideLengthSamples:];
}

id objc_msgSend_setStrokeCount_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeCount:];
}

id objc_msgSend_setStrokeSamples_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeSamples:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSubAnchorRule_(void *a1, const char *a2, ...)
{
  return [a1 setSubAnchorRule:];
}

id objc_msgSend_setSubAxisDescriptorPadding_(void *a1, const char *a2, ...)
{
  return [a1 setSubAxisDescriptorPadding:];
}

id objc_msgSend_setSubAxisSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSubAxisSpacing:];
}

id objc_msgSend_setSubItems_(void *a1, const char *a2, ...)
{
  return [a1 setSubItems:];
}

id objc_msgSend_setSubLabelAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setSubLabelAlignment:];
}

id objc_msgSend_setSubTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 setSubTimeInterval:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setSummary_(void *a1, const char *a2, ...)
{
  return [a1 setSummary:];
}

id objc_msgSend_setSummaryType_(void *a1, const char *a2, ...)
{
  return [a1 setSummaryType:];
}

id objc_msgSend_setSwimDistanceByStrokeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSwimDistanceByStrokeStyle:];
}

id objc_msgSend_setSwimDistanceByStrokeStyleUpdateBlock_(void *a1, const char *a2, ...)
{
  return [a1 setSwimDistanceByStrokeStyleUpdateBlock:];
}

id objc_msgSend_setSwimLocationType_(void *a1, const char *a2, ...)
{
  return [a1 setSwimLocationType:];
}

id objc_msgSend_setSwimmingSets_(void *a1, const char *a2, ...)
{
  return [a1 setSwimmingSets:];
}

id objc_msgSend_setSwimmingSplit_(void *a1, const char *a2, ...)
{
  return [a1 setSwimmingSplit:];
}

id objc_msgSend_setSwimmingSplitItems_(void *a1, const char *a2, ...)
{
  return [a1 setSwimmingSplitItems:];
}

id objc_msgSend_setSwimmingSplits_(void *a1, const char *a2, ...)
{
  return [a1 setSwimmingSplits:];
}

id objc_msgSend_setSwolfScore_(void *a1, const char *a2, ...)
{
  return [a1 setSwolfScore:];
}

id objc_msgSend_setSynchronizesWithCA_(void *a1, const char *a2, ...)
{
  return [a1 setSynchronizesWithCA:];
}

id objc_msgSend_setTabBarController_(void *a1, const char *a2, ...)
{
  return [a1 setTabBarController:];
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return [a1 setTableFooterView:];
}

id objc_msgSend_setTableHeaderViewShouldAutoHide_(void *a1, const char *a2, ...)
{
  return [a1 setTableHeaderViewShouldAutoHide:];
}

id objc_msgSend_setTableItemsBySection_(void *a1, const char *a2, ...)
{
  return [a1 setTableItemsBySection:];
}

id objc_msgSend_setTableSectionHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setTableSectionHeaders];
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return [a1 setTableView:];
}

id objc_msgSend_setTemplateUniqueName_(void *a1, const char *a2, ...)
{
  return [a1 setTemplateUniqueName:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextBottomBaselineConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextBottomBaselineConstraint:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTextColorHighlighted_(void *a1, const char *a2, ...)
{
  return [a1 setTextColorHighlighted:];
}

id objc_msgSend_setTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTextStyle:];
}

id objc_msgSend_setThickness_(void *a1, const char *a2, ...)
{
  return [a1 setThickness:];
}

id objc_msgSend_setThumbnail_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnail:];
}

id objc_msgSend_setTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 setTimeInterval:];
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStyle:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:forState:];
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabel:];
}

id objc_msgSend_setTitleString_(void *a1, const char *a2, ...)
{
  return [a1 setTitleString:];
}

id objc_msgSend_setTitleText_(void *a1, const char *a2, ...)
{
  return [a1 setTitleText:];
}

id objc_msgSend_setTitleTextAttributes_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleTextAttributes:forState:];
}

id objc_msgSend_setTopColor_bottomColor_ofRingAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 setTopColor:bottomColor:ofRingAtIndex:];
}

id objc_msgSend_setTotalDistance_(void *a1, const char *a2, ...)
{
  return [a1 setTotalDistance:];
}

id objc_msgSend_setTotalText_(void *a1, const char *a2, ...)
{
  return [a1 setTotalText:];
}

id objc_msgSend_setTrackDistanceUnit_(void *a1, const char *a2, ...)
{
  return [a1 setTrackDistanceUnit:];
}

id objc_msgSend_setTrackLap_(void *a1, const char *a2, ...)
{
  return [a1 setTrackLap:];
}

id objc_msgSend_setTrackLaps_(void *a1, const char *a2, ...)
{
  return [a1 setTrackLaps:];
}

id objc_msgSend_setTrackTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTrackTintColor:];
}

id objc_msgSend_setTrailingTextConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTrailingTextConstraint:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform:];
}

id objc_msgSend_setTransitionAnimator_(void *a1, const char *a2, ...)
{
  return [a1 setTransitionAnimator:];
}

id objc_msgSend_setTransitionAnimatorFromViewController_(void *a1, const char *a2, ...)
{
  return [a1 setTransitionAnimatorFromViewController:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return [a1 setTranslucent:];
}

id objc_msgSend_setTrophyCaseViewControllerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setTrophyCaseViewControllerDelegate:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUnhighlightedLabelColor_(void *a1, const char *a2, ...)
{
  return [a1 setUnhighlightedLabelColor:];
}

id objc_msgSend_setUnhighlightedSubLabelColor_(void *a1, const char *a2, ...)
{
  return [a1 setUnhighlightedSubLabelColor:];
}

id objc_msgSend_setUnit_(void *a1, const char *a2, ...)
{
  return [a1 setUnit:];
}

id objc_msgSend_setUnitFormatString_(void *a1, const char *a2, ...)
{
  return [a1 setUnitFormatString:];
}

id objc_msgSend_setUnitTextYOffset_(void *a1, const char *a2, ...)
{
  return [a1 setUnitTextYOffset:];
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateBlock:];
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateHandler:];
}

id objc_msgSend_setUrlRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setUrlRetryCount:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setUserInterfaceStyle:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValueAttrString_(void *a1, const char *a2, ...)
{
  return [a1 setValueAttrString:];
}

id objc_msgSend_setValueColor_(void *a1, const char *a2, ...)
{
  return [a1 setValueColor:];
}

id objc_msgSend_setValueFont_(void *a1, const char *a2, ...)
{
  return [a1 setValueFont:];
}

id objc_msgSend_setValueIncrement_(void *a1, const char *a2, ...)
{
  return [a1 setValueIncrement:];
}

id objc_msgSend_setValueStepIncremement_(void *a1, const char *a2, ...)
{
  return [a1 setValueStepIncremement:];
}

id objc_msgSend_setValueUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setValueUpdateHandler:];
}

id objc_msgSend_setVerticalOscillationSamples_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalOscillationSamples:];
}

id objc_msgSend_setVideoGravity_(void *a1, const char *a2, ...)
{
  return [a1 setVideoGravity:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:];
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:animated:];
}

id objc_msgSend_setWasSuccessful_(void *a1, const char *a2, ...)
{
  return [a1 setWasSuccessful:];
}

id objc_msgSend_setWatchCloudKitAccountAssumedToExist_(void *a1, const char *a2, ...)
{
  return [a1 setWatchCloudKitAccountAssumedToExist:];
}

id objc_msgSend_setWatchCloudKitAccountExists_(void *a1, const char *a2, ...)
{
  return [a1 setWatchCloudKitAccountExists];
}

id objc_msgSend_setWatchCloudKitAccountFetchInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setWatchCloudKitAccountFetchInProgress:];
}

id objc_msgSend_setWheelchairDataSubmissionAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setWheelchairDataSubmissionAllowed:];
}

id objc_msgSend_setWheelchairUseCache_(void *a1, const char *a2, ...)
{
  return [a1 setWheelchairUseCache];
}

id objc_msgSend_setWheelchairUser_(void *a1, const char *a2, ...)
{
  return [a1 setWheelchairUser:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_setWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 setWindowScene:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithCurrentSelectedDate_caller_(void *a1, const char *a2, ...)
{
  return [a1 setWithCurrentSelectedDate:caller:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWorkout_fitnessAppContext_formattingManager_achievementCount_(void *a1, const char *a2, ...)
{
  return [a1 setWorkout:fitnessAppContext:formattingManager:achievementCount:];
}

id objc_msgSend_setWorkout_fitnessAppContext_formattingManager_achievementCount_completion_(void *a1, const char *a2, ...)
{
  return [a1 setWorkout:fitnessAppContext:formattingManager:achievementCount:completion:];
}

id objc_msgSend_setWorkoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutActivity:];
}

id objc_msgSend_setWorkoutBrandName_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutBrandName:];
}

id objc_msgSend_setWorkoutFormattingManager_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutFormattingManager:];
}

id objc_msgSend_setWorkoutStatistics_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutStatistics:];
}

id objc_msgSend_setWorkoutStatistics_activityTypeKey_formattingManager_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutStatistics:activityTypeKey:formattingManager:];
}

id objc_msgSend_setWorkoutTypeFont_(void *a1, const char *a2, ...)
{
  return [a1 setWorkoutTypeFont:];
}

id objc_msgSend_setXAxisDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setXAxisDescriptor:];
}

id objc_msgSend_setYAxisDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setYAxisDescriptor:];
}

id objc_msgSend_settingsWithContactStore_threeDTouchEnabled_(void *a1, const char *a2, ...)
{
  return [a1 settingsWithContactStore:threeDTouchEnabled:];
}

id objc_msgSend_setupCelebrationVideoIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 setupCelebrationVideoIfNeeded];
}

id objc_msgSend_setupCircleBackground(void *a1, const char *a2, ...)
{
  return _[a1 setupCircleBackground];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 setupFlowUserInfo];
}

id objc_msgSend_setupGoalViewValueChanged_value_(void *a1, const char *a2, ...)
{
  return [a1 setupGoalViewValueChanged:value];
}

id objc_msgSend_setupLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 setupLabelFont];
}

id objc_msgSend_setupNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 setupNavigationController];
}

id objc_msgSend_seymourAppWillResignActive(void *a1, const char *a2, ...)
{
  return _[a1 seymourAppWillResignActive];
}

id objc_msgSend_seymourAppWillTerminate(void *a1, const char *a2, ...)
{
  return _[a1 seymourAppWillTerminate];
}

id objc_msgSend_seymourAvailabilityDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 seymourAvailabilityDidChangeNotification];
}

id objc_msgSend_seymourAvailabilityManager(void *a1, const char *a2, ...)
{
  return _[a1 seymourAvailabilityManager];
}

id objc_msgSend_seymourCatalogItemDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 seymourCatalogItemDataProvider];
}

id objc_msgSend_seymourNavController(void *a1, const char *a2, ...)
{
  return _[a1 seymourNavController];
}

id objc_msgSend_seymourNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 seymourNavigationController];
}

id objc_msgSend_seymourTabDeselected(void *a1, const char *a2, ...)
{
  return _[a1 seymourTabDeselected];
}

id objc_msgSend_seymourTabSelectedWithSelection_(void *a1, const char *a2, ...)
{
  return [a1 seymourTabSelectedWithSelection:];
}

id objc_msgSend_shallowCopyReplacingEarnedInstances_(void *a1, const char *a2, ...)
{
  return [a1 shallowCopyReplacingEarnedInstances:];
}

id objc_msgSend_shareDescriptionForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 shareDescriptionForAchievement:];
}

id objc_msgSend_shareImageForWorkout_routeImage_(void *a1, const char *a2, ...)
{
  return [a1 shareImageForWorkout:routeImage:];
}

id objc_msgSend_shareSheetActivityItemsWithWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 shareSheetActivityItemsWithWorkout:completion:];
}

id objc_msgSend_shareTextForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 shareTextForWorkout:];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return _[a1 sharedBehavior];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedDeviceConnection];
}

id objc_msgSend_sharedImageManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedImageManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstanceForServiceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 sharedInstanceForServiceIdentifier:];
}

id objc_msgSend_sharedNavigator(void *a1, const char *a2, ...)
{
  return _[a1 sharedNavigator];
}

id objc_msgSend_sharingImage(void *a1, const char *a2, ...)
{
  return _[a1 sharingImage];
}

id objc_msgSend_sharingSpriteSheet(void *a1, const char *a2, ...)
{
  return _[a1 sharingSpriteSheet];
}

id objc_msgSend_sharingText(void *a1, const char *a2, ...)
{
  return _[a1 sharingText];
}

id objc_msgSend_shiftLocations_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 shiftLocations:withCompletion:];
}

id objc_msgSend_shifter(void *a1, const char *a2, ...)
{
  return _[a1 shifter];
}

id objc_msgSend_shortWeekdaySymbols(void *a1, const char *a2, ...)
{
  return _[a1 shortWeekdaySymbols];
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _[a1 shortcutItem];
}

id objc_msgSend_shouldAccountForHeaderHeight(void *a1, const char *a2, ...)
{
  return _[a1 shouldAccountForHeaderHeight];
}

id objc_msgSend_shouldBypassFirstResponderAction_(void *a1, const char *a2, ...)
{
  return [a1 shouldBypassFirstResponderAction:];
}

id objc_msgSend_shouldFakeData(void *a1, const char *a2, ...)
{
  return _[a1 shouldFakeData];
}

id objc_msgSend_shouldHandleNotificationCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 shouldHandleNotificationCategoryIdentifier:];
}

id objc_msgSend_shouldHandleNotificationResponse_(void *a1, const char *a2, ...)
{
  return [a1 shouldHandleNotificationResponse:];
}

id objc_msgSend_shouldShowCelebration(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowCelebration];
}

id objc_msgSend_shouldShowCountForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 shouldShowCountForAchievement:];
}

id objc_msgSend_shouldShowDistanceForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 shouldShowDistanceForWorkout:workoutActivity:];
}

id objc_msgSend_shouldShowRaceResults(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowRaceResults];
}

id objc_msgSend_shouldUseCircularGradientImage(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseCircularGradientImage];
}

id objc_msgSend_shouldUseFakeSegmentMarkers(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseFakeSegmentMarkers];
}

id objc_msgSend_showActivityOnDate_shareImmediately_animated_forGoalCompleteNotification_goalRecommendation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showActivityOnDate:shareImmediately:animated:forGoalCompleteNotification:goalRecommendation:");
}

id objc_msgSend_showAllTrendsAnimated_(void *a1, const char *a2, ...)
{
  return [a1 showAllTrendsAnimated:];
}

id objc_msgSend_showDetailForFriendWithUUID_date_(void *a1, const char *a2, ...)
{
  return [a1 showDetailForFriendWithUUID:date:];
}

id objc_msgSend_showDetailForMeOnDate_(void *a1, const char *a2, ...)
{
  return [a1 showDetailForMeOnDate:];
}

id objc_msgSend_showInbox(void *a1, const char *a2, ...)
{
  return _[a1 showInbox];
}

id objc_msgSend_showLoad(void *a1, const char *a2, ...)
{
  return _[a1 showLoad];
}

id objc_msgSend_showMindfulnessSessionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 showMindfulnessSessionWithUUID:];
}

id objc_msgSend_showPregnancy(void *a1, const char *a2, ...)
{
  return _[a1 showPregnancy];
}

id objc_msgSend_showSummaryCardWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 showSummaryCardWithIdentifier:];
}

id objc_msgSend_showTimeoutDialogWithDismissCompletion_(void *a1, const char *a2, ...)
{
  return [a1 showTimeoutDialogWithDismissCompletion:];
}

id objc_msgSend_showTodayAndShareImmediately_animated_forGoalCompleteNotification_goalRecommendation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:");
}

id objc_msgSend_showTodayAndShareImmediately_animated_forGoalCompleteNotification_goalRecommendation_withPauseRingsEditing_(void *a1, const char *a2, ...)
{
  return [a1 showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:withPauseRingsEditing:];
}

id objc_msgSend_showTrendWithIdentifier_animated_(void *a1, const char *a2, ...)
{
  return [a1 showTrendWithIdentifier:animated:];
}

id objc_msgSend_showWorkoutWithId_activityId_page_(void *a1, const char *a2, ...)
{
  return [a1 showWorkoutWithId:activityId:page:];
}

id objc_msgSend_siblingIndexPathsForIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 siblingIndexPathsForIndexPath:];
}

id objc_msgSend_simpleWorkoutCount(void *a1, const char *a2, ...)
{
  return _[a1 simpleWorkoutCount];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return [a1 sizeWithAttributes:];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_snapshotIndex(void *a1, const char *a2, ...)
{
  return _[a1 snapshotIndex];
}

id objc_msgSend_snapshotWithGoalsCarriedForwardForSnapshotIndex_(void *a1, const char *a2, ...)
{
  return [a1 snapshotWithGoalsCarriedForwardForSnapshotIndex:];
}

id objc_msgSend_snapshotWithSize_lineWidth_traitCollection_insets_completion_(void *a1, const char *a2, ...)
{
  return [a1 snapshotWithSize:lineWidth:traitCollection:insets:completion:];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sortedDateComponentKeys(void *a1, const char *a2, ...)
{
  return _[a1 sortedDateComponentKeys];
}

id objc_msgSend_sortedTypeIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 sortedTypeIdentifiers];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return _[a1 sourceName];
}

id objc_msgSend_sourceRevision(void *a1, const char *a2, ...)
{
  return _[a1 sourceRevision];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return _[a1 spinner];
}

id objc_msgSend_split(void *a1, const char *a2, ...)
{
  return _[a1 split];
}

id objc_msgSend_splitDelimiterDistance(void *a1, const char *a2, ...)
{
  return _[a1 splitDelimiterDistance];
}

id objc_msgSend_splitIndex(void *a1, const char *a2, ...)
{
  return _[a1 splitIndex];
}

id objc_msgSend_splits(void *a1, const char *a2, ...)
{
  return _[a1 splits];
}

id objc_msgSend_splitsDictionary(void *a1, const char *a2, ...)
{
  return _[a1 splitsDictionary];
}

id objc_msgSend_splitsExpanded(void *a1, const char *a2, ...)
{
  return _[a1 splitsExpanded];
}

id objc_msgSend_splitsForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitsForWorkout:workoutActivity:completion:");
}

id objc_msgSend_stackedLabels(void *a1, const char *a2, ...)
{
  return _[a1 stackedLabels];
}

id objc_msgSend_standGoal(void *a1, const char *a2, ...)
{
  return _[a1 standGoal];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startActivitySummaryQuery(void *a1, const char *a2, ...)
{
  return _[a1 startActivitySummaryQuery];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startEditing(void *a1, const char *a2, ...)
{
  return _[a1 startEditing];
}

id objc_msgSend_startFetching(void *a1, const char *a2, ...)
{
  return _[a1 startFetching];
}

id objc_msgSend_startObservation_(void *a1, const char *a2, ...)
{
  return [a1 startObservation:];
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return [a1 startOfDayForDate:];
}

id objc_msgSend_startOfDayMidnight(void *a1, const char *a2, ...)
{
  return _[a1 startOfDayMidnight];
}

id objc_msgSend_startOfFitnessWeekAfterWeekStarting_(void *a1, const char *a2, ...)
{
  return [a1 startOfFitnessWeekAfterWeekStarting:];
}

id objc_msgSend_startOfFitnessWeekBeforeWeekStarting_(void *a1, const char *a2, ...)
{
  return [a1 startOfFitnessWeekBeforeWeekStarting:];
}

id objc_msgSend_startOfMonth(void *a1, const char *a2, ...)
{
  return _[a1 startOfMonth];
}

id objc_msgSend_startSyncIfRestoreNotCompleted(void *a1, const char *a2, ...)
{
  return _[a1 startSyncIfRestoreNotCompleted];
}

id objc_msgSend_startTrackingWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 startTrackingWorkout:workoutActivity:];
}

id objc_msgSend_stateKnown(void *a1, const char *a2, ...)
{
  return _[a1 stateKnown];
}

id objc_msgSend_statisticsForType_(void *a1, const char *a2, ...)
{
  return [a1 statisticsForType:];
}

id objc_msgSend_statusBarFrame(void *a1, const char *a2, ...)
{
  return _[a1 statusBarFrame];
}

id objc_msgSend_statusBarManager(void *a1, const char *a2, ...)
{
  return _[a1 statusBarManager];
}

id objc_msgSend_stepColors(void *a1, const char *a2, ...)
{
  return _[a1 stepColors];
}

id objc_msgSend_stepCount(void *a1, const char *a2, ...)
{
  return _[a1 stepCount];
}

id objc_msgSend_stepKeyPath(void *a1, const char *a2, ...)
{
  return _[a1 stepKeyPath];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopObservation_(void *a1, const char *a2, ...)
{
  return [a1 stopObservation:];
}

id objc_msgSend_stopQuery_(void *a1, const char *a2, ...)
{
  return [a1 stopQuery:];
}

id objc_msgSend_stopTrackingWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 stopTrackingWorkout:workoutActivity:];
}

id objc_msgSend_strideLengthSamples(void *a1, const char *a2, ...)
{
  return _[a1 strideLengthSamples];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringForAchievement_locProvider_formatForFriend_(void *a1, const char *a2, ...)
{
  return [a1 stringForAchievement:locProvider:formatForFriend:];
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return [a1 stringFromContact:style:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithDayNameAndShortMonthFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringWithDayNameAndShortMonthFromDate:];
}

id objc_msgSend_stringWithDuration_durationFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithDuration:durationFormat:];
}

id objc_msgSend_stringWithEitherTodayOrLongStyleDateFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringWithEitherTodayOrLongStyleDateFromDate:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithNumber_decimalPrecision_(void *a1, const char *a2, ...)
{
  return [a1 stringWithNumber:decimalPrecision:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return [a1 stringWithValidatedFormat:];
}

id objc_msgSend_strokeCount(void *a1, const char *a2, ...)
{
  return _[a1 strokeCount];
}

id objc_msgSend_strokeCountScaledToFillSplit(void *a1, const char *a2, ...)
{
  return _[a1 strokeCountScaledToFillSplit];
}

id objc_msgSend_strokeSamples(void *a1, const char *a2, ...)
{
  return _[a1 strokeSamples];
}

id objc_msgSend_strokeSamplesForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 strokeSamplesForWorkout:workoutActivity:completion:];
}

id objc_msgSend_subItems(void *a1, const char *a2, ...)
{
  return _[a1 subItems];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_subjectMonitorRegistry(void *a1, const char *a2, ...)
{
  return _[a1 subjectMonitorRegistry];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_sumQuantity(void *a1, const char *a2, ...)
{
  return _[a1 sumQuantity];
}

id objc_msgSend_summaryConfigureWithWorkout_workoutActivity_fitnessAppContext_catalogItemViewModel_formattingManager_resizeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summaryConfigureWithWorkout:workoutActivity:fitnessAppContext:catalogItemViewModel:formattingManager:resizeBlock:");
}

id objc_msgSend_summaryCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 summaryCoordinator];
}

id objc_msgSend_summaryDeeplinkViewController(void *a1, const char *a2, ...)
{
  return _[a1 summaryDeeplinkViewController];
}

id objc_msgSend_summaryIndexes(void *a1, const char *a2, ...)
{
  return _[a1 summaryIndexes];
}

id objc_msgSend_summaryType(void *a1, const char *a2, ...)
{
  return _[a1 summaryType];
}

id objc_msgSend_sundayGoal(void *a1, const char *a2, ...)
{
  return _[a1 sundayGoal];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsActivityType_(void *a1, const char *a2, ...)
{
  return [a1 supportsActivityType:];
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return [a1 supportsCapability:];
}

id objc_msgSend_supportsCompetitions(void *a1, const char *a2, ...)
{
  return _[a1 supportsCompetitions];
}

id objc_msgSend_supportsDistanceForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 supportsDistanceForWorkout:workoutActivity:];
}

id objc_msgSend_supportsDownhillRunsCountForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 supportsDownhillRunsCountForWorkout:workoutActivity:];
}

id objc_msgSend_supportsElevationAscendedForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsElevationAscendedForWorkout:workoutActivity:");
}

id objc_msgSend_supportsElevationDescendedForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 supportsElevationDescendedForWorkout:workoutActivity:];
}

id objc_msgSend_supportsPaceForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 supportsPaceForWorkout:workoutActivity:];
}

id objc_msgSend_supportsTrackWorkout(void *a1, const char *a2, ...)
{
  return _[a1 supportsTrackWorkout];
}

id objc_msgSend_swimDistanceByStrokeStyle(void *a1, const char *a2, ...)
{
  return _[a1 swimDistanceByStrokeStyle];
}

id objc_msgSend_swimDistanceByStrokeStyleForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swimDistanceByStrokeStyleForWorkout:workoutActivity:completion:");
}

id objc_msgSend_swimDistanceByStrokeStyleUpdateBlock(void *a1, const char *a2, ...)
{
  return _[a1 swimDistanceByStrokeStyleUpdateBlock];
}

id objc_msgSend_swimLocationType(void *a1, const char *a2, ...)
{
  return _[a1 swimLocationType];
}

id objc_msgSend_swimmingLocationType(void *a1, const char *a2, ...)
{
  return _[a1 swimmingLocationType];
}

id objc_msgSend_swimmingPacePerHundredForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 swimmingPacePerHundredForWorkout:workoutActivity:completion:];
}

id objc_msgSend_swimmingSets(void *a1, const char *a2, ...)
{
  return _[a1 swimmingSets];
}

id objc_msgSend_swimmingSetsForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 swimmingSetsForWorkout:workoutActivity:completion:];
}

id objc_msgSend_swimmingSplit(void *a1, const char *a2, ...)
{
  return _[a1 swimmingSplit];
}

id objc_msgSend_swimmingSplitItems(void *a1, const char *a2, ...)
{
  return _[a1 swimmingSplitItems];
}

id objc_msgSend_swimmingSplits(void *a1, const char *a2, ...)
{
  return _[a1 swimmingSplits];
}

id objc_msgSend_swimmingSplitsForWorkout_workoutActivity_completion_(void *a1, const char *a2, ...)
{
  return [a1 swimmingSplitsForWorkout:workoutActivity:completion:];
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return [a1 synchronizeUserDefaultsDomain:keys:];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemFontOfSize_weight_design_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:weight:design:];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:withConfiguration:];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return [a1 systemLayoutSizeFittingSize:];
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_tabBar(void *a1, const char *a2, ...)
{
  return _[a1 tabBar];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return _[a1 tabBarController];
}

id objc_msgSend_tabBarItem(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItem];
}

id objc_msgSend_tableItemsBySection(void *a1, const char *a2, ...)
{
  return _[a1 tableItemsBySection];
}

id objc_msgSend_tableSectionHeaders(void *a1, const char *a2, ...)
{
  return _[a1 tableSectionHeaders];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableView_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 tableView:cellForRowAtIndexPath:];
}

id objc_msgSend_tableView_heightForHeaderInSection_(void *a1, const char *a2, ...)
{
  return [a1 tableView:heightForHeaderInSection:];
}

id objc_msgSend_tableView_heightForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 tableView:heightForRowAtIndexPath:];
}

id objc_msgSend_tableView_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return [a1 tableView:numberOfRowsInSection:];
}

id objc_msgSend_tappedContinue_(void *a1, const char *a2, ...)
{
  return [a1 tappedContinue:];
}

id objc_msgSend_teardownPlayer(void *a1, const char *a2, ...)
{
  return _[a1 teardownPlayer];
}

id objc_msgSend_template(void *a1, const char *a2, ...)
{
  return _[a1 template];
}

id objc_msgSend_templateUniqueName(void *a1, const char *a2, ...)
{
  return _[a1 templateUniqueName];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textBottomBaselineConstraint(void *a1, const char *a2, ...)
{
  return _[a1 textBottomBaselineConstraint];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _[a1 textProperties];
}

id objc_msgSend_textSizeDidChange_(void *a1, const char *a2, ...)
{
  return [a1 textSizeDidChange:];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_thumbnailImageForAchievement_size_(void *a1, const char *a2, ...)
{
  return [a1 thumbnailImageForAchievement:size:];
}

id objc_msgSend_thursdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 thursdayGoal];
}

id objc_msgSend_timeDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 timeDateFormatter];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZoneForWorkout_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneForWorkout:];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithName:];
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 timerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 titleForAchievement:];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleString(void *a1, const char *a2, ...)
{
  return _[a1 titleString];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topDivider(void *a1, const char *a2, ...)
{
  return _[a1 topDivider];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_totalActiveEnergyBurn(void *a1, const char *a2, ...)
{
  return _[a1 totalActiveEnergyBurn];
}

id objc_msgSend_totalDistance(void *a1, const char *a2, ...)
{
  return _[a1 totalDistance];
}

id objc_msgSend_totalEnergyBurned(void *a1, const char *a2, ...)
{
  return _[a1 totalEnergyBurned];
}

id objc_msgSend_totalFlightsClimbed(void *a1, const char *a2, ...)
{
  return _[a1 totalFlightsClimbed];
}

id objc_msgSend_totalNumberOfPendingRequests(void *a1, const char *a2, ...)
{
  return _[a1 totalNumberOfPendingRequests];
}

id objc_msgSend_trackDistanceUnit(void *a1, const char *a2, ...)
{
  return _[a1 trackDistanceUnit];
}

id objc_msgSend_trackLap(void *a1, const char *a2, ...)
{
  return _[a1 trackLap];
}

id objc_msgSend_trackLaps(void *a1, const char *a2, ...)
{
  return _[a1 trackLaps];
}

id objc_msgSend_trackLapsForWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 trackLapsForWorkout:completion:];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_trailingTextConstraint(void *a1, const char *a2, ...)
{
  return _[a1 trailingTextConstraint];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithTraits_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithTraits:];
}

id objc_msgSend_transitionAnimator(void *a1, const char *a2, ...)
{
  return _[a1 transitionAnimator];
}

id objc_msgSend_transitionAnimatorFromViewController(void *a1, const char *a2, ...)
{
  return _[a1 transitionAnimatorFromViewController];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transitionCoordinator];
}

id objc_msgSend_trendsAvailability(void *a1, const char *a2, ...)
{
  return _[a1 trendsAvailability];
}

id objc_msgSend_trendsAvailabilityDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 trendsAvailabilityDidChangeNotification];
}

id objc_msgSend_trendsAvailabilityManager(void *a1, const char *a2, ...)
{
  return _[a1 trendsAvailabilityManager];
}

id objc_msgSend_triggerFetch(void *a1, const char *a2, ...)
{
  return _[a1 triggerFetch];
}

id objc_msgSend_trophyCaseDidBeginCelebration_(void *a1, const char *a2, ...)
{
  return [a1 trophyCaseDidBeginCelebration:];
}

id objc_msgSend_tuesdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 tuesdayGoal];
}

id objc_msgSend_tvConnectionManager(void *a1, const char *a2, ...)
{
  return _[a1 tvConnectionManager];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unachievedShortDescriptionForAchievement_(void *a1, const char *a2, ...)
{
  return [a1 unachievedShortDescriptionForAchievement:];
}

id objc_msgSend_unavailable(void *a1, const char *a2, ...)
{
  return _[a1 unavailable];
}

id objc_msgSend_uncommentedAddresses(void *a1, const char *a2, ...)
{
  return _[a1 uncommentedAddresses];
}

id objc_msgSend_unearned(void *a1, const char *a2, ...)
{
  return _[a1 unearned];
}

id objc_msgSend_unhide(void *a1, const char *a2, ...)
{
  return _[a1 unhide];
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return [a1 unifiedContactWithIdentifier:keysToFetch:error:];
}

id objc_msgSend_uniqueName(void *a1, const char *a2, ...)
{
  return _[a1 uniqueName];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return _[a1 unit];
}

id objc_msgSend_unitFormatString(void *a1, const char *a2, ...)
{
  return _[a1 unitFormatString];
}

id objc_msgSend_unitFromString_(void *a1, const char *a2, ...)
{
  return [a1 unitFromString:];
}

id objc_msgSend_unitManager(void *a1, const char *a2, ...)
{
  return _[a1 unitManager];
}

id objc_msgSend_unitTextYOffset(void *a1, const char *a2, ...)
{
  return _[a1 unitTextYOffset];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAuthorization(void *a1, const char *a2, ...)
{
  return _[a1 updateAuthorization];
}

id objc_msgSend_updateAvailability(void *a1, const char *a2, ...)
{
  return _[a1 updateAvailability];
}

id objc_msgSend_updateBlock(void *a1, const char *a2, ...)
{
  return _[a1 updateBlock];
}

id objc_msgSend_updateContinueButton(void *a1, const char *a2, ...)
{
  return _[a1 updateContinueButton];
}

id objc_msgSend_updateDateTextForDayNumber_textColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDateTextForDayNumber:textColor:");
}

id objc_msgSend_updateDiscoveryStateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateDiscoveryStateIfNeeded];
}

id objc_msgSend_updateHeaderViewContent(void *a1, const char *a2, ...)
{
  return _[a1 updateHeaderViewContent];
}

id objc_msgSend_updateHiddenAppBundleIds(void *a1, const char *a2, ...)
{
  return _[a1 updateHiddenAppBundleIds];
}

id objc_msgSend_updateLocationReadings_(void *a1, const char *a2, ...)
{
  return [a1 updateLocationReadings:];
}

id objc_msgSend_updateOutgoingInvites_(void *a1, const char *a2, ...)
{
  return [a1 updateOutgoingInvites:];
}

id objc_msgSend_updateSharingImage(void *a1, const char *a2, ...)
{
  return _[a1 updateSharingImage];
}

id objc_msgSend_updateWidgets(void *a1, const char *a2, ...)
{
  return _[a1 updateWidgets];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_urlRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 urlRetryCount];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return _[a1 userActiveEnergyBurnedUnit];
}

id objc_msgSend_userCachesDirectory(void *a1, const char *a2, ...)
{
  return _[a1 userCachesDirectory];
}

id objc_msgSend_userDistanceElevationUnit(void *a1, const char *a2, ...)
{
  return _[a1 userDistanceElevationUnit];
}

id objc_msgSend_userDistanceHKUnitForDistanceType_(void *a1, const char *a2, ...)
{
  return [a1 userDistanceHKUnitForDistanceType:];
}

id objc_msgSend_userDistanceUnitForDistanceType_(void *a1, const char *a2, ...)
{
  return [a1 userDistanceUnitForDistanceType:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirectionForSemanticContentAttribute:];
}

id objc_msgSend_userLapLengthHKUnit(void *a1, const char *a2, ...)
{
  return _[a1 userLapLengthHKUnit];
}

id objc_msgSend_userPreferredDistanceUnit(void *a1, const char *a2, ...)
{
  return _[a1 userPreferredDistanceUnit];
}

id objc_msgSend_userText(void *a1, const char *a2, ...)
{
  return _[a1 userText];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueAttrString(void *a1, const char *a2, ...)
{
  return _[a1 valueAttrString];
}

id objc_msgSend_valueColor(void *a1, const char *a2, ...)
{
  return _[a1 valueColor];
}

id objc_msgSend_valueDisplayColor(void *a1, const char *a2, ...)
{
  return _[a1 valueDisplayColor];
}

id objc_msgSend_valueFont(void *a1, const char *a2, ...)
{
  return _[a1 valueFont];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_valueForSmallWidth_mediumWidth_largeWidth_(void *a1, const char *a2, ...)
{
  return [a1 valueForSmallWidth:mediumWidth:largeWidth:];
}

id objc_msgSend_valueIncrement(void *a1, const char *a2, ...)
{
  return _[a1 valueIncrement];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return _[a1 valueLabel];
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGSize:];
}

id objc_msgSend_valueWithSize_(void *a1, const char *a2, ...)
{
  return [a1 valueWithSize:];
}

id objc_msgSend_verticalOscillationSamples(void *a1, const char *a2, ...)
{
  return _[a1 verticalOscillationSamples];
}

id objc_msgSend_veryShortWeekdaySymbols(void *a1, const char *a2, ...)
{
  return _[a1 veryShortWeekdaySymbols];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewControllerForContact_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForContact:];
}

id objc_msgSend_viewControllerForUnknownContact_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForUnknownContact:];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_walkingAndRunningDistance(void *a1, const char *a2, ...)
{
  return _[a1 walkingAndRunningDistance];
}

id objc_msgSend_wasSuccessful(void *a1, const char *a2, ...)
{
  return _[a1 wasSuccessful];
}

id objc_msgSend_watchCloudKitAccountAssumedToExist(void *a1, const char *a2, ...)
{
  return _[a1 watchCloudKitAccountAssumedToExist];
}

id objc_msgSend_watchCloudKitAccountExists(void *a1, const char *a2, ...)
{
  return _[a1 watchCloudKitAccountExists];
}

id objc_msgSend_watchCloudKitAccountFetchInProgress(void *a1, const char *a2, ...)
{
  return _[a1 watchCloudKitAccountFetchInProgress];
}

id objc_msgSend_wattUnit(void *a1, const char *a2, ...)
{
  return _[a1 wattUnit];
}

id objc_msgSend_weatherHumidityForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 weatherHumidityForWorkout:workoutActivity:];
}

id objc_msgSend_weatherTemperatureForWorkout_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 weatherTemperatureForWorkout:workoutActivity:];
}

id objc_msgSend_wednesdayGoal(void *a1, const char *a2, ...)
{
  return _[a1 wednesdayGoal];
}

id objc_msgSend_week_cellSelected_(void *a1, const char *a2, ...)
{
  return [a1 week:cellSelected:];
}

id objc_msgSend_week_pressedOnDay_down_(void *a1, const char *a2, ...)
{
  return [a1 week:pressedOnDay:down:];
}

id objc_msgSend_weekDayLabel(void *a1, const char *a2, ...)
{
  return _[a1 weekDayLabel];
}

id objc_msgSend_weekOfYear(void *a1, const char *a2, ...)
{
  return _[a1 weekOfYear];
}

id objc_msgSend_weekWithStartDate_(void *a1, const char *a2, ...)
{
  return [a1 weekWithStartDate:];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return _[a1 weight];
}

id objc_msgSend_wheelchairSectionIndex(void *a1, const char *a2, ...)
{
  return _[a1 wheelchairSectionIndex];
}

id objc_msgSend_wheelchairSharingSpriteSheet(void *a1, const char *a2, ...)
{
  return _[a1 wheelchairSharingSpriteSheet];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return _[a1 wheelchairUse];
}

id objc_msgSend_wheelchairUseCache(void *a1, const char *a2, ...)
{
  return _[a1 wheelchairUseCache];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}

id objc_msgSend_withdrawFriendInviteToFriendUUID_completion_(void *a1, const char *a2, ...)
{
  return [a1 withdrawFriendInviteToFriendUUID:completion:];
}

id objc_msgSend_withdrawInvitationToFriend_completion_(void *a1, const char *a2, ...)
{
  return [a1 withdrawInvitationToFriend:completion:];
}

id objc_msgSend_workout(void *a1, const char *a2, ...)
{
  return _[a1 workout];
}

id objc_msgSend_workoutActivities(void *a1, const char *a2, ...)
{
  return _[a1 workoutActivities];
}

id objc_msgSend_workoutActivity(void *a1, const char *a2, ...)
{
  return _[a1 workoutActivity];
}

id objc_msgSend_workoutActivityType(void *a1, const char *a2, ...)
{
  return _[a1 workoutActivityType];
}

id objc_msgSend_workoutAnalyticsHandlerFor_workoutActivity_(void *a1, const char *a2, ...)
{
  return [a1 workoutAnalyticsHandlerFor:workoutActivity:];
}

id objc_msgSend_workoutBrandName(void *a1, const char *a2, ...)
{
  return _[a1 workoutBrandName];
}

id objc_msgSend_workoutConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 workoutConfiguration];
}

id objc_msgSend_workoutDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 workoutDataProvider];
}

id objc_msgSend_workoutEventWithType_dateInterval_metadata_(void *a1, const char *a2, ...)
{
  return [a1 workoutEventWithType:dateInterval:metadata:];
}

id objc_msgSend_workoutEvents(void *a1, const char *a2, ...)
{
  return _[a1 workoutEvents];
}

id objc_msgSend_workoutForIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 workoutForIndexPath:];
}

id objc_msgSend_workoutFormattingManager(void *a1, const char *a2, ...)
{
  return _[a1 workoutFormattingManager];
}

id objc_msgSend_workoutHasGoalCompletionEvent_(void *a1, const char *a2, ...)
{
  return [a1 workoutHasGoalCompletionEvent:];
}

id objc_msgSend_workoutIsFirstParty(void *a1, const char *a2, ...)
{
  return _[a1 workoutIsFirstParty];
}

id objc_msgSend_workoutIsPoolSwim(void *a1, const char *a2, ...)
{
  return _[a1 workoutIsPoolSwim];
}

id objc_msgSend_workoutRingWithPercent_colors_diameter_thickness_renderer_(void *a1, const char *a2, ...)
{
  return [a1 workoutRingWithPercent:colors:diameter:thickness:renderer:];
}

id objc_msgSend_workoutRouteType(void *a1, const char *a2, ...)
{
  return _[a1 workoutRouteType];
}

id objc_msgSend_workoutStatistics(void *a1, const char *a2, ...)
{
  return _[a1 workoutStatistics];
}

id objc_msgSend_workoutStatisticsForMonthAndYear(void *a1, const char *a2, ...)
{
  return _[a1 workoutStatisticsForMonthAndYear];
}

id objc_msgSend_workoutType(void *a1, const char *a2, ...)
{
  return _[a1 workoutType];
}

id objc_msgSend_workoutTypeFont(void *a1, const char *a2, ...)
{
  return _[a1 workoutTypeFont];
}

id objc_msgSend_workouts(void *a1, const char *a2, ...)
{
  return _[a1 workouts];
}

id objc_msgSend_workoutsByDay(void *a1, const char *a2, ...)
{
  return _[a1 workoutsByDay];
}

id objc_msgSend_workoutsByMonthAndYear(void *a1, const char *a2, ...)
{
  return _[a1 workoutsByMonthAndYear];
}

id objc_msgSend_workoutsDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 workoutsDataProvider];
}

id objc_msgSend_workoutsListDataSource_didEncounterReloadingException_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutsListDataSource:didEncounterReloadingException:");
}

id objc_msgSend_workoutsListDataSource_didScrollToSectionWithDateComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workoutsListDataSource:didScrollToSectionWithDateComponents:");
}

id objc_msgSend_workoutsListDataSource_didSelectWorkout_atIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 workoutsListDataSource:didSelectWorkout:atIndexPath:];
}

id objc_msgSend_workoutsListDataSource_requestsDeleteConfirmationForWorkout_completion_(void *a1, const char *a2, ...)
{
  return [a1 workoutsListDataSource:requestsDeleteConfirmationForWorkout:completion:];
}

id objc_msgSend_workoutsListViewController_didScrollToDateComponents_(void *a1, const char *a2, ...)
{
  return [a1 workoutsListViewController:didScrollToDateComponents:];
}

id objc_msgSend_writeToCPBitmapFile_flags_(void *a1, const char *a2, ...)
{
  return [a1 writeToCPBitmapFile:flags:];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}

id objc_msgSend_xAxisDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 xAxisDescriptor];
}

id objc_msgSend_yardUnit(void *a1, const char *a2, ...)
{
  return _[a1 yardUnit];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _[a1 year];
}