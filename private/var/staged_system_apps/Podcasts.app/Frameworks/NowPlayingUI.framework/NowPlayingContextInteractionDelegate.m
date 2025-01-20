@interface NowPlayingContextInteractionDelegate
- (_TtC12NowPlayingUI36NowPlayingContextInteractionDelegate)init;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation NowPlayingContextInteractionDelegate

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  v7 = _s12NowPlayingUI0aB26ContextInteractionDelegateC011contextMenuE0_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0mhE0C_So7CGPointVtF_0(v5);

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_6B0D8(v6);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_6B1B4(v9, a5);

  swift_unknownObjectRelease();
}

- (_TtC12NowPlayingUI36NowPlayingContextInteractionDelegate)init
{
  result = (_TtC12NowPlayingUI36NowPlayingContextInteractionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_6A504(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC12NowPlayingUI36NowPlayingContextInteractionDelegate_menuProvider));
  sub_1A41C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI36NowPlayingContextInteractionDelegate_episodeController, &qword_19D290);
}

@end