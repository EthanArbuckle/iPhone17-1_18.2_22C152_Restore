@interface CRLWPStickyNoteEditor
- (BOOL)wantsStickyNoteMiniFormatterVariant;
- (_TtC8Freeform21CRLWPStickyNoteEditor)initWithInteractiveCanvasController:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)saveDefaultInsertionPreset:(id)a3;
- (void)updatePreset:(id)a3;
@end

@implementation CRLWPStickyNoteEditor

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  int64_t v8 = sub_100E1C424((uint64_t)a3, (uint64_t)v10);

  sub_10052E2B0((uint64_t)v10);
  return v8;
}

- (void)updatePreset:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100E1C624((uint64_t)v6);

  sub_10052E2B0((uint64_t)v6);
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100E1CEFC();

  sub_10052E2B0((uint64_t)v6);
}

- (BOOL)wantsStickyNoteMiniFormatterVariant
{
  return 1;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  int64_t v8 = self;
  sub_100E1D3C0(v7, x, y);
}

- (_TtC8Freeform21CRLWPStickyNoteEditor)initWithInteractiveCanvasController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLWPStickyNoteEditor();
  return [(CRLBoardItemEditor *)&v5 initWithInteractiveCanvasController:a3];
}

@end