@interface DragDropController.DropDelegate
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate)init;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
@end

@implementation DragDropController.DropDelegate

- (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd);
  v7 = (objc_class *)type metadata accessor for DragDropController.DropDelegate();
  void *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return [(DragDropController.DropDelegate *)&v9 init];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return sub_1002D21D0((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  v4 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  if (v4)
  {
    id v7 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    sub_10007B674((uint64_t)v4);
    id v9 = (id)v4(a4);
    sub_10006ADFC((uint64_t)v4);

    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = [objc_allocWithZone((Class)UIDropProposal) initWithDropOperation:0];
  }

  return v9;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd);

  sub_10006ADFC(v3);
}

@end