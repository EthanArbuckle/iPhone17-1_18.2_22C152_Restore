@interface Artwork.Placeholder.View
- (_TtCVV11MusicCoreUI7Artwork11Placeholder4View)initWithCoder:(id)a3;
- (_TtCVV11MusicCoreUI7Artwork11Placeholder4View)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation Artwork.Placeholder.View

- (void)layoutSubviews
{
  v2 = self;
  Artwork.Placeholder.View.layoutSubviews()();
}

- (_TtCVV11MusicCoreUI7Artwork11Placeholder4View)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_contentView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtCVV11MusicCoreUI7Artwork11Placeholder4View *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtCVV11MusicCoreUI7Artwork11Placeholder4View)initWithFrame:(CGRect)a3
{
  result = (_TtCVV11MusicCoreUI7Artwork11Placeholder4View *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration);
  v4 = *(void **)&self->typedConfiguration[OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration];
  uint64_t v5 = *(void **)&self->typedConfiguration[OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration
                                         + 8];
  objc_release(*(id *)&self->typedConfiguration[OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_typedConfiguration
                                              + 16]);

  id v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCVV11MusicCoreUI7Artwork11Placeholder4View_contentView);
}

@end