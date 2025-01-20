@interface _UITabCrossFadeTransitionAnimationSpec
+ (id)settingsControllerModule;
- (_TtC5UIKit30_UIDurationBounceAnimationSpec)fadeIn;
- (_TtC5UIKit30_UIDurationBounceAnimationSpec)fadeOut;
- (_TtC5UIKit30_UIDurationBounceAnimationSpec)scaleIn;
- (_TtC5UIKit30_UIDurationBounceAnimationSpec)scaleOut;
- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)initWithDefaultValues;
- (double)fadedOutScale;
- (void)setFadeIn:(id)a3;
- (void)setFadeOut:(id)a3;
- (void)setFadedOutScale:(double)a3;
- (void)setScaleIn:(id)a3;
- (void)setScaleOut:(id)a3;
@end

@implementation _UITabCrossFadeTransitionAnimationSpec

- (double)fadedOutScale
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadedOutScale);
}

- (void)setFadedOutScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadedOutScale) = a3;
}

- (_TtC5UIKit30_UIDurationBounceAnimationSpec)fadeOut
{
  return (_TtC5UIKit30_UIDurationBounceAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeOut));
}

- (void)setFadeOut:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeOut);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeOut) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIDurationBounceAnimationSpec)scaleOut
{
  return (_TtC5UIKit30_UIDurationBounceAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleOut));
}

- (void)setScaleOut:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleOut);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleOut) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIDurationBounceAnimationSpec)fadeIn
{
  return (_TtC5UIKit30_UIDurationBounceAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeIn));
}

- (void)setFadeIn:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeIn);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeIn) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit30_UIDurationBounceAnimationSpec)scaleIn
{
  return (_TtC5UIKit30_UIDurationBounceAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleIn));
}

- (void)setScaleIn:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleIn);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleIn) = (Class)a3;
  id v3 = a3;
}

+ (id)settingsControllerModule
{
  sub_1858FB9D0();
  return v2;
}

- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)initWithDefaultValues
{
  return (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec *)sub_1858FB454();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeOut));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleOut));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_fadeIn));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec_scaleIn);
}

@end