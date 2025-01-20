@interface RootHostingController.FallbackCoverAnimatingSource
- (BOOL)coverAnimationSourceUseLargeCover;
- (CGRect)coverAnimationSourceFrame;
- (_TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource)init;
- (id)coverAnimationSourceImage;
- (id)coverAnimationSourceReferenceView;
- (id)coverAnimationSourceView;
- (int64_t)coverAnimationSourceAlignment;
@end

@implementation RootHostingController.FallbackCoverAnimatingSource

- (CGRect)coverAnimationSourceFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)coverAnimationSourceReferenceView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource_referenceView));
}

- (id)coverAnimationSourceImage
{
  return 0;
}

- (id)coverAnimationSourceView
{
  double v2 = self;
  double v3 = (void *)sub_75D7C();

  return v3;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (_TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource)init
{
  CGRect result = (_TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC11BookStoreUI21RootHostingControllerP33_33EEA6210FEC2640A5148301F86EE4A328FallbackCoverAnimatingSource_referenceView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end