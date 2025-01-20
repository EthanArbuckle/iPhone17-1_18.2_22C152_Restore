@interface BackgroundDescriptionView
- (_TtC8VideosUI25BackgroundDescriptionView)initWithCoder:(id)a3;
- (_TtC8VideosUI25BackgroundDescriptionView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation BackgroundDescriptionView

- (_TtC8VideosUI25BackgroundDescriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI25BackgroundDescriptionView *)sub_1E3580A34();
}

- (_TtC8VideosUI25BackgroundDescriptionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3580B94();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  v7 = sub_1E3580C4C((uint64_t)v5);

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1E3580E78();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1E3580F50((uint64_t)v10, v9, a5);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25BackgroundDescriptionView_contextMenuInteraction));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25BackgroundDescriptionView_contextMenuInteractor));
  id v3 = (char *)self + OBJC_IVAR____TtC8VideosUI25BackgroundDescriptionView_contextMenuInteractorDelegate;
  sub_1E2F6ABF0((uint64_t)v3);
}

@end