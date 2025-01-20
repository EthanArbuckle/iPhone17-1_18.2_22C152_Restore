@interface RecordLabelsDetailView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RecordLabelsDetailView

- (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *)sub_BA2A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_recordLabels) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_onSelectHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_recordLabelLinkViews) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView____lazy_storage___titleLabel) = 0;
  id v5 = a3;

  result = (_TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_BACCC(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_BAFAC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_BB2FC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView_onSelectHandler));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_DFFB545A04BDF8CFD1631A9374555FAE22RecordLabelsDetailView____lazy_storage___titleLabel);
}

@end