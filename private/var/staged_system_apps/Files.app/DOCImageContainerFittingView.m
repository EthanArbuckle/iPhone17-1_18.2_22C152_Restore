@interface DOCImageContainerFittingView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (_TtC5Files28DOCImageContainerFittingView)initWithCoder:(id)a3;
- (_TtC5Files28DOCImageContainerFittingView)initWithFrame:(CGRect)a3;
- (double)contentOffsetFromTop;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (void)fittingImageViewDidLayout:(id)a3;
- (void)layoutSubviews;
- (void)setContentOffsetFromTop:(double)a3;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCImageContainerFittingView

- (double)contentOffsetFromTop
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_contentOffsetFromTop);
  swift_beginAccess();
  return *v2;
}

- (void)setContentOffsetFromTop:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC5Files28DOCImageContainerFittingView_contentOffsetFromTop);
  swift_beginAccess();
  double *v4 = a3;
}

- (_TtC5Files28DOCImageContainerFittingView)initWithFrame:(CGRect)a3
{
  sub_10024236C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Files28DOCImageContainerFittingView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s5Files28DOCImageContainerFittingViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = DOCImageContainerFittingView.systemLayoutSizeFitting(_:)(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  DOCImageContainerFittingView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCImageContainerFittingView();
  id v2 = v3.receiver;
  [(DOCImageContainerFittingView *)&v3 layoutSubviews];
  DOCImageContainerFittingView.updateContentFrame()();
  [v2 setContentOffsetFromTop:0.0];
}

- (void)thumbnailLoaded:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectRetain();
  double v5 = self;
  unint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v7 = sub_1002451A8(v6, a3);
  char v9 = v8;
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0) {
    sub_100244224(a3, v7);
  }
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fittingImageViewDidLayout:(id)a3
{
  id v4 = a3;
  double v5 = self;
  _s5Files28DOCImageContainerFittingViewC012fittingImageE9DidLayoutyySo010DOCFittinggE0CF_0();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  unint64_t v6 = self;
  _s5Files28DOCImageContainerFittingViewC15dragInteraction_17itemsForBeginningSaySo10UIDragItemCGSo0kG0C_So0K7Session_ptF_0(v5);

  swift_unknownObjectRelease();
  sub_10009E6C4(0, (unint64_t *)&unk_10070C600);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  char v9 = self;
  id v10 = _s5Files28DOCImageContainerFittingViewC15dragInteraction_17previewForLifting7sessionSo21UITargetedDragPreviewCSgSo06UIDragG0C_So0O4ItemCSo0O7Session_ptF_0(v7);

  swift_unknownObjectRelease();

  return v10;
}

@end