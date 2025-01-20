@interface SummaryMetricGridView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI21SummaryMetricGridView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21SummaryMetricGridView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SummaryMetricGridView

- (_TtC9SeymourUI21SummaryMetricGridView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21SummaryMetricGridView *)sub_23A0823DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SummaryMetricGridView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(SummaryMetricGridView *)&v6 traitCollectionDidChange:v4];
  sub_23A082E5C();
}

- (_TtC9SeymourUI21SummaryMetricGridView)initWithCoder:(id)a3
{
  uint64_t v5 = sub_23A7F6818();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_reuseIdentifier);
  id v10 = a3;
  sub_23A7F6808();
  uint64_t v11 = sub_23A7F67D8();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t *v9 = v11;
  v9[1] = v13;
  v14 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_metrics) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_metricViews) = v14;

  result = (_TtC9SeymourUI21SummaryMetricGridView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_collectionView), sel_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_collectionView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryMetricGridView_metrics))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  uint64_t v11 = self;
  sub_23A083220(v10);
  uint64_t v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

@end