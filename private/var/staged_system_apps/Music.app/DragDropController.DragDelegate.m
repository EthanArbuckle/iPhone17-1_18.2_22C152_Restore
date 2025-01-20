@interface DragDropController.DragDelegate
- (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate)init;
- (id)_dragInteraction:(void *)a3 sessionPropertiesForSession:;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
@end

@implementation DragDropController.DragDelegate

- (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate)init
{
  return (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *)sub_10007BD60((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd, (uint64_t (*)(void))type metadata accessor for DragDropController.DragDelegate);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v4 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider);
  if (v4)
  {
    id v7 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    sub_10007B674((uint64_t)v4);
    v4(a4);
    sub_10006ADFC((uint64_t)v4);

    swift_unknownObjectRelease();
  }
  sub_100057778(0, (unint64_t *)&qword_1010A2C40);
  v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider);
  if (v5)
  {
    id v8 = a3;
    swift_unknownObjectRetain();
    NSArray v9 = self;
    sub_10007B674((uint64_t)v5);
    v5(a4);
    sub_10006ADFC((uint64_t)v5);

    swift_unknownObjectRelease();
  }
  sub_100057778(0, (unint64_t *)&qword_1010A2C40);
  v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v10.super.isa;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd);
  if (v5)
  {
    id v8 = a3;
    swift_unknownObjectRetain();
    NSArray v9 = self;
    sub_10007B674((uint64_t)v5);
    v5(a4);
    sub_10006ADFC((uint64_t)v5);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
}

- (id)_dragInteraction:(void *)a3 sessionPropertiesForSession:
{
  id v5 = objc_allocWithZone((Class)_UIDragSessionProperties);
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a1;
  id v8 = [v5 init];
  [v8 set_supportsSystemDrag:0];

  swift_unknownObjectRelease();

  return v8;
}

@end