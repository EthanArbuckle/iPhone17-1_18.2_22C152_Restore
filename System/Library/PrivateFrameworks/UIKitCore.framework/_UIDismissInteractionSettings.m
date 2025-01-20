@interface _UIDismissInteractionSettings
+ (id)settingsControllerModule;
- (BOOL)showDebugUI;
- (_TtC5UIKit29_UIDismissInteractionSettings)initWithDefaultValues;
- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)edgePan;
- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)pinch;
- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)scroll;
- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)swipeDown;
- (void)setDefaultValues;
- (void)setEdgePan:(id)a3;
- (void)setPinch:(id)a3;
- (void)setScroll:(id)a3;
- (void)setShowDebugUI:(BOOL)a3;
- (void)setSwipeDown:(id)a3;
@end

@implementation _UIDismissInteractionSettings

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)swipeDown
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_swipeDown);
}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)edgePan
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_edgePan);
}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)scroll
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_scroll);
}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)pinch
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch);
}

- (void)setDefaultValues
{
  v2 = self;
  sub_1858B8394();
}

- (_TtC5UIKit29_UIDismissInteractionSettings)initWithDefaultValues
{
  return (_TtC5UIKit29_UIDismissInteractionSettings *)sub_185787BFC();
}

- (void)setEdgePan:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_edgePan);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_edgePan) = (Class)a3;
  id v3 = a3;
}

- (void)setScroll:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_scroll);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_scroll) = (Class)a3;
  id v3 = a3;
}

- (void)setSwipeDown:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_swipeDown);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_swipeDown) = (Class)a3;
  id v3 = a3;
}

- (void)setPinch:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch) = (Class)a3;
  id v3 = a3;
}

- (BOOL)showDebugUI
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_showDebugUI);
}

- (void)setShowDebugUI:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_showDebugUI) = a3;
}

+ (id)settingsControllerModule
{
  sub_185968114();
  return v2;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch);
}

@end