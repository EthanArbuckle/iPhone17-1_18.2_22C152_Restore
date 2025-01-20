@interface NowPlayingCollectionViewSecondaryBackground
- (_TtC12NowPlayingUI43NowPlayingCollectionViewSecondaryBackground)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI43NowPlayingCollectionViewSecondaryBackground)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation NowPlayingCollectionViewSecondaryBackground

- (void)applyLayoutAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v8.receiver;
  [(NowPlayingCollectionViewSecondaryBackground *)&v8 applyLayoutAttributes:v4];
  type metadata accessor for NowPlayingSecondaryBackgroundAttributes();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6)
  {
    [v5 setBackgroundColor:[v6 backgroundColor]];
  }
  else
  {
    id v7 = [self clearColor];
    [v5 setBackgroundColor:v7];

    id v4 = v5;
    id v5 = v7;
  }
}

- (_TtC12NowPlayingUI43NowPlayingCollectionViewSecondaryBackground)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[NowPlayingCollectionViewSecondaryBackground initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI43NowPlayingCollectionViewSecondaryBackground)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(NowPlayingCollectionViewSecondaryBackground *)&v5 initWithCoder:a3];
}

@end