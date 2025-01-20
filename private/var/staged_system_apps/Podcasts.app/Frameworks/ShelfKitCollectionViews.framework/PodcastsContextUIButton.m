@interface PodcastsContextUIButton
- (NSArray)accessibilityCustomActions;
- (_TtC23ShelfKitCollectionViews23PodcastsContextUIButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23PodcastsContextUIButton)initWithFrame:(CGRect)a3;
- (void)setAccessibilityCustomActions:(id)a3;
@end

@implementation PodcastsContextUIButton

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  uint64_t v3 = sub_19D2F4();

  if (v3)
  {
    sub_2E66C(0, &qword_4792B0);
    v4.super.isa = sub_3845E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_2E66C(0, &qword_4792B0);
    sub_3845F0();
    v5 = self;
    isa = sub_3845E0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PodcastsContextUIButton();
  [(PodcastsContextUIButton *)&v7 setAccessibilityCustomActions:isa];
}

- (_TtC23ShelfKitCollectionViews23PodcastsContextUIButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PodcastsContextUIButton();
  return -[PodcastsContextUIButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews23PodcastsContextUIButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PodcastsContextUIButton();
  return [(PodcastsContextUIButton *)&v5 initWithCoder:a3];
}

@end