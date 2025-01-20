@interface CanvasCollaborationStateView
- (_TtC8PaperKit28CanvasCollaborationStateView)initWithCoder:(id)a3;
- (_TtC8PaperKit28CanvasCollaborationStateView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation CanvasCollaborationStateView

- (_TtC8PaperKit28CanvasCollaborationStateView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  uint64_t v8 = OBJC_IVAR____TtC8PaperKit28CanvasCollaborationStateView_selectionCursors;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for CanvasCollaborationStateView();
  v10 = -[CanvasCollaborationStateView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  [(CanvasCollaborationStateView *)v10 setUserInteractionEnabled:0];
  return v10;
}

- (_TtC8PaperKit28CanvasCollaborationStateView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit28CanvasCollaborationStateView_selectionCursors;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);

  result = (_TtC8PaperKit28CanvasCollaborationStateView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  CanvasCollaborationStateView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  objc_super v12 = v11;

  return v12;
}

- (void)layoutSubviews
{
  v2 = self;
  CanvasCollaborationStateView.layoutSubviews()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end