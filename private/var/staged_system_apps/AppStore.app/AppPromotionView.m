@interface AppPromotionView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore16AppPromotionView)initWithCoder:(id)a3;
- (_TtC8AppStore16AppPromotionView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore20AppPromotionCardView)accessibilityAppPromotionCardView;
- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateChangedFor:(id)a3;
@end

@implementation AppPromotionView

- (_TtC8AppStore16AppPromotionView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16AppPromotionView *)sub_1003C448C();
}

- (_TtC8AppStore16AppPromotionView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore16AppPromotionView_clickAction;
  uint64_t v6 = sub_100082C28((uint64_t *)&unk_10098A9A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore16AppPromotionView_initialLongPressLocation;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC8AppStore16AppPromotionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore16AppPromotionView_longPressGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AppPromotionView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16AppPromotionView_availabilityLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16AppPromotionView_appPromotionCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16AppPromotionView_longPressGestureRecognizer));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore16AppPromotionView_clickAction, &qword_10098D120);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003C29FC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = qword_10097E9C8;
  objc_super v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  sub_1007827B0(&unk_1009E2598, v6, width, height);
  double v8 = v7;
  double v9 = sub_100687040();
  double v11 = v10;

  double v12 = v8 + v11;
  double v13 = v9;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003C2D44(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  char v9 = sub_1003C3B38((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore16AppPromotionView_availabilityLabelView));
}

- (_TtC8AppStore20AppPromotionCardView)accessibilityAppPromotionCardView
{
  return (_TtC8AppStore20AppPromotionCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore16AppPromotionView_appPromotionCardView));
}

@end