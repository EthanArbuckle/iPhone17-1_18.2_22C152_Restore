@interface CanvasElementResizeView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8PaperKit23CanvasElementResizeView)initWithCoder:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)controlHandleMoved:(id)a3;
- (void)didMoveToWindow;
- (void)doubleTapped:(id)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)layoutSubviews;
- (void)tapped:(id)a3;
@end

@implementation CanvasElementResizeView

- (void)didMoveToWindow
{
  v2 = self;
  CanvasElementResizeView.didMoveToWindow()();
}

- (_TtC8PaperKit23CanvasElementResizeView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CanvasElementResizeView.init(coder:)();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CanvasElementResizeView();
  v2 = (char *)v3.receiver;
  [(ResizeView *)&v3 layoutSubviews];
  if (*(void *)&v2[OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_miniMenuController])
  {
    swift_retain();
    MiniMenuController.update()();

    swift_release();
  }
  else
  {
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  CanvasElementResizeView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (void)controlHandleMoved:(id)a3
{
  v4 = (UIPanGestureRecognizer *)a3;
  v5 = self;
  CanvasElementResizeView.controlHandleMoved(_:)(v4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = CanvasElementResizeView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (void)tapped:(id)a3
{
  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  CanvasElementResizeView.tapped(_:)(v4);
}

- (void)doubleTapped:(id)a3
{
  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  CanvasElementResizeView.doubleTapped(_:)(v4);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  id v8 = self;
  v9 = (void *)CanvasElementResizeView.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v7, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  v9 = (void *)CanvasElementResizeView.contextMenuInteraction(_:previewForHighlightingMenuWithConfiguration:)((UIContextMenuInteraction)v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  specialized CanvasElementResizeView.contextMenuInteraction(_:willPerformPreviewActionForMenuWith:animator:)(a5);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_contextMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_doubleTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementResizeView_draggedImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v6 = (_TtC8PaperKit23CanvasElementResizeView *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit10ResizeView_canvas, a2);
  if (!v6) {
    id v6 = self;
  }
  id v7 = self;
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = [(CanvasElementResizeView *)v6 _dragDataOwner];

  swift_unknownObjectRelease();
  return (int64_t)v9;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v7 = (_TtC8PaperKit23CanvasElementResizeView *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit10ResizeView_canvas, a2, (__n128)a5, *(__n128 *)&a5.y);
  if (!v7) {
    id v7 = self;
  }
  id v8 = self;
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = [(CanvasElementResizeView *)v7 _dragDataOwner];

  swift_unknownObjectRelease();
  return (int64_t)v10;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  v11 = (void *)specialized CanvasElementResizeView.dragInteraction(_:previewForLifting:session:)((uint64_t)v9, (uint64_t)a5);

  swift_unknownObjectRelease();
  return v11;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  specialized CanvasElementResizeView.dragInteraction(_:itemsForBeginning:)(a4);

  swift_unknownObjectRelease();
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIDragItem);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v8.super.isa;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  specialized CanvasElementResizeView.dragInteraction(_:sessionWillBegin:)();

  swift_unknownObjectRelease();
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  specialized CanvasElementResizeView.dragInteraction(_:previewForCancelling:withDefault:)(v10);
  v13 = v12;

  return v13;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = self;
  specialized CanvasElementResizeView.dragInteraction(_:session:didEndWith:)(a4, a5);

  swift_unknownObjectRelease();
}

@end