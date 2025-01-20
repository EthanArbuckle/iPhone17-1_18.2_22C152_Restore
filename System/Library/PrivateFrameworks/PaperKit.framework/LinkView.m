@interface LinkView
- (_TtC8PaperKit8LinkView)init;
- (_TtC8PaperKit8LinkView)initWithCoder:(id)a3;
- (_TtC8PaperKit8LinkView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation LinkView

- (_TtC8PaperKit8LinkView)init
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8PaperKit8LinkView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit8LinkView_isSelected) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LinkView();
  return -[LinkView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC8PaperKit8LinkView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8PaperKit8LinkView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit8LinkView_isSelected) = 0;
  id v5 = a3;

  result = (_TtC8PaperKit8LinkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8PaperKit8LinkView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit8LinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = specialized LinkView.contextMenuInteraction(_:configurationForMenuAtLocation:)();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CC8]), sel_initWithView_, self);
  return v4;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

@end