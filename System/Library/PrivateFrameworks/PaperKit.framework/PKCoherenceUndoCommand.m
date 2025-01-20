@interface PKCoherenceUndoCommand
- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)init;
- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4;
- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 changesVisibleStrokes:(BOOL)a5;
- (id)applyToDrawingReturnInverted:(id)a3;
- (void)applyToDrawing:(id)a3;
@end

@implementation PKCoherenceUndoCommand

- (void)applyToDrawing:(id)a3
{
}

- (id)applyToDrawingReturnInverted:(id)a3
{
  return @objc PKCoherenceUndoCommand.apply(toDrawingReturnInverted:)(self, (uint64_t)a2, a3, (uint64_t (*)(char *))PKCoherenceUndoCommand.apply(toDrawingReturnInverted:));
}

- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)initWithDrawingUUID:(id)a3 actionName:(id)a4 changesVisibleStrokes:(BOOL)a5
{
  swift_unknownObjectRetain();
  result = (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand)init
{
  result = (_TtC8PaperKitP33_745DA07C2AB299ADF5B7B63B4181D3F122PKCoherenceUndoCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end