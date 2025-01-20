@interface ArtworkGrid
- (CGRect)frame;
- (_TtC8AppStore11ArtworkGrid)initWithCoder:(id)a3;
- (_TtC8AppStore11ArtworkGrid)initWithFrame:(CGRect)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArtworkGrid

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(ArtworkGrid *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v7 = v8.receiver;
  -[ArtworkGrid setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_1006CA3F4();
  [v7 setNeedsLayout];
}

- (_TtC8AppStore11ArtworkGrid)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = objc_allocWithZone((Class)swift_getObjectType());
  objc_super v8 = sub_1006CA7F0(0, x, y, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC8AppStore11ArtworkGrid *)v8;
}

- (_TtC8AppStore11ArtworkGrid)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006CB7A8();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1006CABCC();
}

- (void)didMoveToSuperview
{
}

- (void)didMoveToWindow
{
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1006CC8C4();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(ArtworkGrid *)&v8 traitCollectionDidChange:v5];
  id v6 = [v4 traitCollection];
  id v7 = [v6 layoutDirection];

  if (!v5 || v7 != [v5 layoutDirection]) {
    [v4 setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end