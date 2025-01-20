@interface _UITabCrossFadeTransitionSpec
+ (id)settingsControllerModule;
- (_TtC5UIKit29_UITabCrossFadeTransitionSpec)initWithDefaultValues;
- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)compact;
- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)regular;
- (id)specFor:(id)a3;
- (void)setCompact:(id)a3;
- (void)setDefaultValues;
- (void)setRegular:(id)a3;
@end

@implementation _UITabCrossFadeTransitionSpec

- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)regular
{
  return (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_regular);
}

- (void)setRegular:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_regular);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_regular) = (Class)a3;
  id v3 = a3;
}

- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)compact
{
  return (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact);
}

- (void)setCompact:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact) = (Class)a3;
  id v3 = a3;
}

- (id)specFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (id)sub_1858FB788(v4);

  return v6;
}

- (void)setDefaultValues
{
  v2 = self;
  sub_1858FAEC0();
}

+ (id)settingsControllerModule
{
  sub_1858FB7F0();
  return v2;
}

- (_TtC5UIKit29_UITabCrossFadeTransitionSpec)initWithDefaultValues
{
  return (_TtC5UIKit29_UITabCrossFadeTransitionSpec *)sub_1858FB15C();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact);
}

@end