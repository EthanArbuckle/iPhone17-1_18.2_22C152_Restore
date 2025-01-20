@interface LegacyCachingArtworkView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC23ShelfKitCollectionViews24LegacyCachingArtworkView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation LegacyCachingArtworkView

- (CGRect)frame
{
  sub_227B50(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_227B50(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (_TtC23ShelfKitCollectionViews24LegacyCachingArtworkView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC23ShelfKitCollectionViews24LegacyCachingArtworkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end