@interface DOCItemCollectionGridCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5Files28DOCItemCollectionCellContent)cellContent;
- (id)accessibilitySecondSubtitleLabel;
- (id)accessibilitySubtitleLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)fittingImageViewDidLayout:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCellContent:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation DOCItemCollectionGridCell

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_secondSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_thumbnailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell____lazy_storage___selectionView));
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_backgroundConfigurationProvider, &qword_10071C0B8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_titleBackgroundStateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_imageBackgroundStateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_circularProgressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_horizontalProgressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_iconWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_stackTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridCircularProgressVerticalConstraintFolder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridCircularProgressVerticalConstraintFile));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalProgressHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalStopButtonCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_gridHorizontalStopButtonCenterYConstraint));

  swift_bridgeObjectRelease();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100051ED8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)isHighlighted
{
  return sub_1000A2AFC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)fittingImageViewDidLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000A0C38();
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (objc_class *)type metadata accessor for DOCItemCollectionGridCell();
  v10.receiver = self;
  v10.super_class = v5;
  uint64_t v6 = self;
  unsigned int v7 = [(DOCItemCollectionGridCell *)&v10 isSelected];
  v9.receiver = v6;
  v9.super_class = v5;
  [(DOCItemCollectionGridCell *)&v9 setSelected:v3];
  if (v7 != [(DOCItemCollectionGridCell *)v6 isSelected])
  {
    v8 = (Class *)((char *)&v6->super.super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
    swift_beginAccess();
    if (*v8) {
      sub_1000A1028();
    }
  }
}

- (BOOL)isSelected
{
  return sub_1000A2AFC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)layoutSubviews
{
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemCollectionGridCell();
  id v2 = v4.receiver;
  [(DOCItemCollectionCell *)&v4 prepareForReuse];
  sub_100559CA8((uint64_t)v2);
}

- (void)tintColorDidChange
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_10009E6C4(0, (unint64_t *)&qword_10070D310);
  sub_1004697E8();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned int v7 = self;
  id v8 = a4;
  objc_super v9 = (void *)sub_1002969B0(v6);
  if (v9
    && (objc_super v10 = v9,
        [v9 locationInView:v7],
        double v12 = v11,
        CGFloat v14 = v13,
        v10,
        sub_10055C9C4(v12, v14)))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    v16.receiver = v7;
    v16.super_class = (Class)type metadata accessor for DOCItemCollectionGridCell();
    [(DOCItemCollectionGridCell *)&v16 touchesBegan:isa withEvent:v8];

    swift_bridgeObjectRelease();
  }
}

- (_TtC5Files28DOCItemCollectionCellContent)cellContent
{
  id v2 = (id *)((char *)&self->super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
  swift_beginAccess();
  return (_TtC5Files28DOCItemCollectionCellContent *)*v2;
}

- (void)setCellContent:(id)a3
{
  objc_super v4 = self;
  id v5 = a3;
  sub_1000A48F0(a3);
  if (qword_100705328 != -1) {
    swift_once();
  }
  uint64_t v6 = (Class *)((char *)&v4->super.super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Files21DOCItemCollectionCell_cellContent);
  swift_beginAccess();
  if (*v6)
  {
    sub_1000CBE0C(*v6 + OBJC_IVAR____TtC5Files28DOCItemCollectionCellContent_gridItemLayoutTraits, (uint64_t)v7, (uint64_t *)&unk_100705550);
    sub_1000CBE0C((uint64_t)v7, (uint64_t)v8, (uint64_t *)&unk_100705550);
    if (sub_1000CBEB4(v8) != 1)
    {
      qword_10071BF50 = v8[6];
      qword_10071BF58 = v8[8];
      qword_10071BF60 = v8[5];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4 = self;
  sub_10055AC10(a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCItemCollectionGridCell();
  return -[DOCItemCollectionGridCell pointInside:withEvent:](&v8, "pointInside:withEvent:", a4, x, y);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = self;
  int IsPad = DOCDeviceIsPad();
  objc_super v10 = (objc_class *)type metadata accessor for DOCItemCollectionGridCell();
  if (!IsPad)
  {
    v15.receiver = v8;
    v15.super_class = v10;
    double v11 = (_TtC5Files25DOCItemCollectionGridCell *)-[DOCItemCollectionGridCell hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
    goto LABEL_10;
  }
  v14.receiver = v8;
  v14.super_class = v10;
  double v11 = (_TtC5Files25DOCItemCollectionGridCell *)-[DOCItemCollectionGridCell hitTest:withEvent:](&v14, "hitTest:withEvent:", v7, x, y);
  if (!v11)
  {
LABEL_10:

    goto LABEL_11;
  }
  double v12 = sub_10055AE70(1, x, y);

  if (v12) {
    objc_super v8 = (_TtC5Files25DOCItemCollectionGridCell *)v12;
  }
  else {
    objc_super v8 = v11;
  }
  if (!v12) {
    double v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)accessibilitySubtitleLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_subtitleLabel));
}

- (id)accessibilitySecondSubtitleLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC5Files25DOCItemCollectionGridCell_secondSubtitleLabel));
}

@end