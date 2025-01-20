@interface AnyCanvasElementView
- (CGRect)textBoxViewActiveTextBoxFrame:(id)a3;
- (_TtC8PaperKit20AnyCanvasElementView)initWithCoder:(id)a3;
- (_TtC8PaperKit20AnyCanvasElementView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation AnyCanvasElementView

- (_TtC8PaperKit20AnyCanvasElementView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized AnyCanvasElementView.init(coder:)();
}

- (_TtC8PaperKit20AnyCanvasElementView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit20AnyCanvasElementView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CC8]), sel_initWithView_, self);
  return v4;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (CGRect)textBoxViewActiveTextBoxFrame:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end