@interface Window
- (_TtC16MusicApplication6Window)initWithCoder:(id)a3;
- (_TtC16MusicApplication6Window)initWithContentRect:(CGRect)a3;
- (_TtC16MusicApplication6Window)initWithFrame:(CGRect)a3;
- (_TtC16MusicApplication6Window)initWithWindowScene:(id)a3;
- (void)_updateWindowTraitsAndNotify:(BOOL)a3;
- (void)layoutSubviews;
- (void)sendEvent:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation Window

- (_TtC16MusicApplication6Window)initWithWindowScene:(id)a3
{
  id v3 = a3;
  v4 = (_TtC16MusicApplication6Window *)sub_335720(v3);

  return v4;
}

- (_TtC16MusicApplication6Window)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication6Window *)Window.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication6Window)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication6Window_screenDimensionsDidChangeHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication6Window_boundsSizeDidChangeHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection) = 0;
  id v6 = a3;

  result = (_TtC16MusicApplication6Window *)sub_AB8280();
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
  if (qword_DBDB90 != -1) {
    swift_once();
  }
  [v6 postNotificationName:qword_E4A4E8 object:v5];
}

- (void)layoutSubviews
{
  v2 = self;
  Window.layoutSubviews()();
}

- (void)_updateWindowTraitsAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection) = 0;
  id v5 = self;

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for Window();
  [(Window *)&v6 _updateWindowTraitsAndNotify:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection) = 0;
  id v5 = a3;
  objc_super v6 = self;

  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for Window();
  [(Window *)&v7 traitCollectionDidChange:v5];
}

- (_TtC16MusicApplication6Window)initWithContentRect:(CGRect)a3
{
  result = (_TtC16MusicApplication6Window *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication6Window_screenDimensionsDidChangeHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication6Window_boundsSizeDidChangeHandler));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication6Window_overrideTraitCollection);
}

@end