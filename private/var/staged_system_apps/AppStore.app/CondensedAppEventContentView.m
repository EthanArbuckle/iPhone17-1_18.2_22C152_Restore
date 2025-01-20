@interface CondensedAppEventContentView
- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView;
- (_TtC8AppStore25CondensedAppEventCardView)accessibilityAppEventView;
- (_TtC8AppStore28CondensedAppEventContentView)initWithCoder:(id)a3;
- (_TtC8AppStore28CondensedAppEventContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CondensedAppEventContentView

- (_TtC8AppStore28CondensedAppEventContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28CondensedAppEventContentView *)sub_100256B74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28CondensedAppEventContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v8 = OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_eventCardView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)type metadata accessor for CondensedAppEventCardView()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_interRowSpacing) = 0;

  result = (_TtC8AppStore28CondensedAppEventContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100256DEC();
}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_lockupView));
}

- (_TtC8AppStore25CondensedAppEventCardView)accessibilityAppEventView
{
  return (_TtC8AppStore25CondensedAppEventCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_eventCardView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_lockupView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore28CondensedAppEventContentView_eventCardView);
}

@end