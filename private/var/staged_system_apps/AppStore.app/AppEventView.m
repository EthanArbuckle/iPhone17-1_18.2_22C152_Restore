@interface AppEventView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore12AppEventView)initWithCoder:(id)a3;
- (_TtC8AppStore12AppEventView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore16AppEventCardView)accessibilityAppEventCardView;
- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)stateChangedFor:(id)a3;
@end

@implementation AppEventView

- (_TtC8AppStore12AppEventView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore12AppEventView *)sub_10021625C();
}

- (_TtC8AppStore12AppEventView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore12AppEventView_clickAction;
  uint64_t v6 = sub_100082C28((uint64_t *)&unk_10098A9A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore12AppEventView_initialLongPressLocation;
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  id v8 = a3;

  result = (_TtC8AppStore12AppEventView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore12AppEventView_longPressGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(AppEventView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore12AppEventView_longPressGestureRecognizer));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore12AppEventView_clickAction, &qword_10098D120);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100214600();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v6 - 8);
  id v8 = (uint64_t *)((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = qword_10097E9C8;
  v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  sub_1007827B0(&unk_1009E2598, v10, width, height);
  double v12 = v11;
  v13 = *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC8AppStore12AppEventView_appEventCardView);
  sub_100654B6C((uint64_t)v8);
  sub_100782080(v13, v8);
  double v15 = v14;
  double v17 = v16;
  sub_100216200((uint64_t)v8);

  double v18 = v12 + v17;
  double v19 = v15;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002149B4(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_10021587C((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore12AppEventView_formattedDateView));
}

- (_TtC8AppStore16AppEventCardView)accessibilityAppEventCardView
{
  return (_TtC8AppStore16AppEventCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore12AppEventView_appEventCardView));
}

@end