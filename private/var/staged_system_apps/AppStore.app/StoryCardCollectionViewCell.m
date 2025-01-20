@interface StoryCardCollectionViewCell
- (NSArray)accessibilityElements;
- (_TtC8AppStore27StoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation StoryCardCollectionViewCell

- (_TtC8AppStore27StoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27StoryCardCollectionViewCell *)sub_100033A68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10000ED3C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100280E58();
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_1002812EC();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    NSArray v4 = self;
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StoryCardCollectionViewCell();
  [(StoryCardCollectionViewCell *)&v7 setAccessibilityElements:v5.super.isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_mediaBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_mediaBackgroundViewMirror));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_infoLayer));
  swift_weakDestroy();

  swift_weakDestroy();
}

@end