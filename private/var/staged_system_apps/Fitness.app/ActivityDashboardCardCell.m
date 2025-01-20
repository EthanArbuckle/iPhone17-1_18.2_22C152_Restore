@interface ActivityDashboardCardCell
- (CGRect)bounds;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC10FitnessApp25ActivityDashboardCardCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp25ActivityDashboardCardCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)setBounds:(CGRect)a3;
@end

@implementation ActivityDashboardCardCell

- (_TtC10FitnessApp25ActivityDashboardCardCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_hostViewController) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_summaryCoordinator;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_loadingCardHeightProvider) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_isJiggling) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_card;
  v10 = (objc_class *)type metadata accessor for ActivityDashboardCardCell();
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[ActivityDashboardCardCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100095520(x, y, width, height);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  double v10 = sub_1000920C8(width, height, a4, a5);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActivityDashboardCardCell();
  [(ActivityDashboardCardCell *)&v6 bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityDashboardCardCell();
  id v2 = v4.receiver;
  [(ActivityDashboardCardCell *)&v4 prepareForReuse];
  UICollectionViewCell.contentConfiguration.setter();
  uint64_t v3 = OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_isJiggling;
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_isJiggling) == 1)
  {
    sub_1006E8DD8(0, v2);
    *((unsigned char *)v2 + v3) = 0;
  }
}

- (_TtC10FitnessApp25ActivityDashboardCardCell)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp25ActivityDashboardCardCell *)sub_100676144(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_hostViewController));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_summaryCoordinator, &qword_10095F6E8);
  swift_release();
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp25ActivityDashboardCardCell_card, &qword_10094CEF0);
}

@end