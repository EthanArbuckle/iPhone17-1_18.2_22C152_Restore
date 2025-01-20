@interface ActivityDashboardEditButtonCell
- (_TtC10FitnessApp31ActivityDashboardEditButtonCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp31ActivityDashboardEditButtonCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation ActivityDashboardEditButtonCell

- (_TtC10FitnessApp31ActivityDashboardEditButtonCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivityDashboardEditButtonCell();
  return -[ActivityDashboardEditButtonCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityDashboardEditButtonCell();
  id v2 = v3.receiver;
  [(ActivityDashboardEditButtonCell *)&v3 prepareForReuse];
  UICollectionViewCell.contentConfiguration.setter();
}

- (_TtC10FitnessApp31ActivityDashboardEditButtonCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityDashboardEditButtonCell();
  return [(ActivityDashboardEditButtonCell *)&v5 initWithCoder:a3];
}

@end