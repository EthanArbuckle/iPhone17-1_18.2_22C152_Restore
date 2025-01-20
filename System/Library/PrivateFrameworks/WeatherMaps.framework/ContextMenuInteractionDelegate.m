@interface ContextMenuInteractionDelegate
- (_TtC11WeatherMaps30ContextMenuInteractionDelegate)init;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation ContextMenuInteractionDelegate

- (_TtC11WeatherMaps30ContextMenuInteractionDelegate)init
{
  return (_TtC11WeatherMaps30ContextMenuInteractionDelegate *)sub_20A23C2B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WeatherMaps30ContextMenuInteractionDelegate_currentPreviewViewController));
  v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps30ContextMenuInteractionDelegate_location;
  sub_20A23DD94((uint64_t)v3);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_20A23C4E0();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_20A23DC88(self, (uint64_t)a2, a3, a4, (uint64_t)a5, v5, (void (*)(id))sub_20A23C870);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = self;
  id v9 = sub_20A23C9A8(v7, x, y);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_20A23D7AC(v6, v7);

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_20A23D7AC(v6, v7);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  sub_20A23DC88(self, (uint64_t)a2, a3, a4, (uint64_t)a5, v5, (void (*)(id))sub_20A23DAD4);
}

@end