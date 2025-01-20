@interface CRLBoardLibraryCommandController
- (BOOL)canRedo;
- (BOOL)canUndo;
- (NSString)redoActionName;
- (NSString)undoActionName;
- (_TtC8Freeform32CRLBoardLibraryCommandController)init;
- (void)redo;
- (void)undo;
@end

@implementation CRLBoardLibraryCommandController

- (NSString)undoActionName
{
  return (NSString *)sub_100DF8EE4(self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack);
}

- (NSString)redoActionName
{
  return (NSString *)sub_100DF8EE4(self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack);
}

- (BOOL)canUndo
{
  return sub_100DF90B4((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack);
}

- (BOOL)canRedo
{
  return sub_100DF90B4((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack);
}

- (void)undo
{
  v2 = self;
  sub_100DF98DC((SEL *)&selRef_canUndo, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_undoStack, (uint64_t)&unk_10152E160, (uint64_t)&unk_10169D148);
}

- (void)redo
{
  v2 = self;
  sub_100DF98DC((SEL *)&selRef_canRedo, &OBJC_IVAR____TtC8Freeform32CRLBoardLibraryCommandController_redoStack, (uint64_t)&unk_10152E138, (uint64_t)&unk_10169D138);
}

- (_TtC8Freeform32CRLBoardLibraryCommandController)init
{
  result = (_TtC8Freeform32CRLBoardLibraryCommandController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end