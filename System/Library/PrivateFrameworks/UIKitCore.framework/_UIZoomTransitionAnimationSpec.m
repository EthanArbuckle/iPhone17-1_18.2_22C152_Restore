@interface _UIZoomTransitionAnimationSpec
+ (id)settingsControllerModule;
- (UIViewSpringAnimationBehaviorSettings)cornerRadiusAdjustment;
- (UIViewSpringAnimationBehaviorSettings)general;
- (UIViewSpringAnimationBehaviorSettings)morph;
- (UIViewSpringAnimationBehaviorSettings)position;
- (UIViewSpringAnimationBehaviorSettings)transform;
- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)initWithDefaultValues;
- (void)setCornerRadiusAdjustment:(id)a3;
- (void)setDefaultValues;
- (void)setGeneral:(id)a3;
- (void)setMorph:(id)a3;
- (void)setPosition:(id)a3;
- (void)setTransform:(id)a3;
@end

@implementation _UIZoomTransitionAnimationSpec

- (UIViewSpringAnimationBehaviorSettings)morph
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_morph));
}

- (void)setMorph:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_morph);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_morph) = (Class)a3;
  id v3 = a3;
}

- (UIViewSpringAnimationBehaviorSettings)transform
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_transform));
}

- (void)setTransform:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_transform);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_transform) = (Class)a3;
  id v3 = a3;
}

- (UIViewSpringAnimationBehaviorSettings)position
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_position));
}

- (void)setPosition:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_position);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_position) = (Class)a3;
  id v3 = a3;
}

- (UIViewSpringAnimationBehaviorSettings)general
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_general));
}

- (void)setGeneral:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_general);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_general) = (Class)a3;
  id v3 = a3;
}

- (UIViewSpringAnimationBehaviorSettings)cornerRadiusAdjustment
{
  return (UIViewSpringAnimationBehaviorSettings *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                          + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment));
}

- (void)setCornerRadiusAdjustment:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment) = (Class)a3;
  id v3 = a3;
}

- (void)setDefaultValues
{
  v2 = self;
  sub_1859F188C();
}

+ (id)settingsControllerModule
{
  sub_1859F2740();
  return v2;
}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)initWithDefaultValues
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)sub_1859F1AC0();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5UIKit30_UIZoomTransitionAnimationSpec_cornerRadiusAdjustment);
}

@end