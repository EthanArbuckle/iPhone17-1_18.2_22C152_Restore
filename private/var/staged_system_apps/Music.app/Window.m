@interface Window
- (_TtC5Music6Window)initWithCoder:(id)a3;
- (_TtC5Music6Window)initWithContentRect:(CGRect)a3;
- (_TtC5Music6Window)initWithFrame:(CGRect)a3;
- (_TtC5Music6Window)initWithWindowScene:(id)a3;
- (void)_updateWindowTraitsAndNotify:(BOOL)a3;
- (void)layoutSubviews;
- (void)sendEvent:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation Window

- (void)traitCollectionDidChange:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_overrideTraitCollection) = 0;
  id v5 = a3;
  v6 = self;

  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for Window();
  [(Window *)&v7 traitCollectionDidChange:v5];
}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_overrideTraitCollection) = 0;
  id v5 = self;

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for Window();
  [(Window *)&v6 _updateWindowTraitsAndNotify:v3];
}

- (void)layoutSubviews
{
  v2 = self;
  Window.layoutSubviews()();
}

- (_TtC5Music6Window)initWithWindowScene:(id)a3
{
  id v3 = a3;
  v4 = (_TtC5Music6Window *)sub_100047D54(v3);

  return v4;
}

- (_TtC5Music6Window)initWithFrame:(CGRect)a3
{
  return (_TtC5Music6Window *)Window.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music6Window)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Music6Window_screenDimensionsDidChangeHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_boundsSizeDidChangeHandler);
  *id v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_overrideTraitCollection) = 0;
  id v6 = a3;

  result = (_TtC5Music6Window *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)sendEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for Window();
  id v4 = a3;
  id v5 = v7.receiver;
  [(Window *)&v7 sendEvent:v4];
  id v6 = [self defaultCenter];
  if (qword_1010978D0 != -1) {
    swift_once();
  }
  [v6 postNotificationName:qword_101128E60 object:v5];
}

- (_TtC5Music6Window)initWithContentRect:(CGRect)a3
{
  result = (_TtC5Music6Window *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music6Window_screenDimensionsDidChangeHandler));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music6Window_boundsSizeDidChangeHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music6Window_overrideTraitCollection);
}

@end