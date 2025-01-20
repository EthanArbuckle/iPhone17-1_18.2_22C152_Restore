@interface DOCSafeAreaView
- (UIView)contentView;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView)initWithCoder:(id)a3;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView)initWithEffect:(id)a3;
- (void)dealloc;
- (void)handleKeyboardNotification:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation DOCSafeAreaView

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeAreaView));
}

- (void)dealloc
{
  v2 = self;
  sub_1002E503C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeBottomConstraint));

  swift_bridgeObjectRelease();
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_safeBottomConstraint) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_keyboardFrame;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView_visibilityState) = 0;
  id v5 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)handleKeyboardNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1002E4F10();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)safeAreaInsetsDidChange
{
}

- (void)layoutSubviews
{
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7515DOCSafeAreaView)initWithEffect:(id)a3
{
}

@end