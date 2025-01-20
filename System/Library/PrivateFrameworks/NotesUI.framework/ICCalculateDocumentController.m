@interface ICCalculateDocumentController
- (BOOL)hasExpressions;
- (BOOL)isCalculateMathEnabled;
- (BOOL)isExpressionFormattingEnabled;
- (BOOL)isUpdating;
- (BOOL)updateAffectingChangeCounts:(BOOL)a3;
- (BOOL)updateHighlights;
- (ICCalculateDocumentController)init;
- (ICCalculateDocumentController)initWithNote:(id)a3;
- (ICNote)note;
- (NSIndexSet)expressionsIndexSet;
- (_NSRange)expressionRangeForResultAttachment:(id)a3;
- (id)contextMenuForResultAttachment:(id)a3;
- (id)errorStringForResultAttachment:(id)a3;
- (id)expressionStringForResultAttachment:(id)a3;
- (id)numberLiteralAtLocation:(int64_t)a3;
- (void)cancelUpdate;
- (void)formatExpressionsInAttributedString:(id)a3 range:(_NSRange)a4 textStorageOffset:(int64_t)a5 skipStaleExpressions:(BOOL)a6;
- (void)noteDidChangeCalculatePreviewBehavior:(id)a3;
- (void)noteDidPerformMerge:(id)a3;
- (void)performUpdate;
- (void)resetHighlights;
- (void)scheduleUpdateAffectingChangeCounts:(BOOL)a3 isHighPriority:(BOOL)a4;
- (void)setIsExpressionFormattingEnabled:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)textStorageDidProcessEndEditing:(id)a3;
- (void)undoManagerDidRedo:(id)a3;
- (void)undoManagerDidUndo:(id)a3;
- (void)updateAffectingChangeCounts:(BOOL)a3 completion:(id)a4;
@end

@implementation ICCalculateDocumentController

- (ICNote)note
{
  v2 = (char *)self + OBJC_IVAR___ICCalculateDocumentController_note;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1B3E9F7C0](v2);
  return (ICNote *)v3;
}

- (void)setNote:(id)a3
{
}

- (ICCalculateDocumentController)initWithNote:(id)a3
{
  return (ICCalculateDocumentController *)ICCalculateDocumentController.init(note:)(a3);
}

- (void)scheduleUpdateAffectingChangeCounts:(BOOL)a3 isHighPriority:(BOOL)a4
{
  v6 = self;
  ICCalculateDocumentController.scheduleUpdate(affectChangeCounts:isHighPriority:)(a3, a4);
}

- (void)cancelUpdate
{
  v4 = self;
  id v2 = sub_1B0A6BABC();
  objc_msgSend(v2, sel_cancelPreviousFireRequests);

  v3 = *(Class *)((char *)&v4->super.isa + OBJC_IVAR___ICCalculateDocumentController_currentScanRequest);
  if (v3) {
    objc_msgSend(v3, sel_cancel);
  }
}

- (void)performUpdate
{
  id v2 = self;
  sub_1B0A6C068();
}

- (BOOL)isUpdating
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_updating);
}

- (BOOL)updateAffectingChangeCounts:(BOOL)a3
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_needsDocumentUpdate) == 1)
  {
    BOOL v3 = a3;
    v4 = self;
    [(ICCalculateDocumentController *)v4 cancelUpdate];
    sub_1B0A6B230();
    v5 = sub_1B0A49F24(0, 0, 1);
    swift_release();
    char v6 = sub_1B0A6C738(v3, (uint64_t)v5);

    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (void)updateAffectingChangeCounts:(BOOL)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1B0A7771C(a3, (unsigned __int8 *)v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (BOOL)hasExpressions
{
  id v2 = self;
  sub_1B0A6C4F8();
  unint64_t v3 = sub_1B0B8218C();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B0B831DC();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v4 != 0;
}

- (NSIndexSet)expressionsIndexSet
{
  uint64_t v3 = sub_1B0B7FF6C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  _sSo29ICCalculateDocumentControllerC7NotesUIE19expressionsIndexSet10Foundation0gH0Vvg_0((uint64_t)v6);

  v8 = (void *)sub_1B0B7FF1C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSIndexSet *)v8;
}

- (BOOL)updateHighlights
{
  id v2 = self;
  sub_1B0A6B384();
  char v3 = sub_1B0B702DC();
  swift_release();
  sub_1B0A6B384();
  sub_1B0B7007C();

  swift_release();
  return v3 & 1;
}

- (id)expressionStringForResultAttachment:(id)a3
{
  return sub_1B0A72098(self, (uint64_t)a2, a3, (void (*)(id))sub_1B0A71C90);
}

- (_NSRange)expressionRangeForResultAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1B0A71E18(v4);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)errorStringForResultAttachment:(id)a3
{
  return sub_1B0A72098(self, (uint64_t)a2, a3, (void (*)(id))sub_1B0A71F1C);
}

- (id)numberLiteralAtLocation:(int64_t)a3
{
  id v4 = self;
  id v5 = sub_1B0A72EB8(a3);

  return v5;
}

- (BOOL)isExpressionFormattingEnabled
{
  id v2 = (BOOL *)self + OBJC_IVAR___ICCalculateDocumentController_isExpressionFormattingEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExpressionFormattingEnabled:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___ICCalculateDocumentController_isExpressionFormattingEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)formatExpressionsInAttributedString:(id)a3 range:(_NSRange)a4 textStorageOffset:(int64_t)a5 skipStaleExpressions:(BOOL)a6
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  id v11 = a3;
  v13 = self;
  v12.Swift::Int location = location;
  v12.Swift::Int length = length;
  ICCalculateDocumentController.formatExpressions(in:range:textStorageOffset:skipStaleExpressions:)((NSMutableAttributedString)v11, v12, a5, a6);
}

- (void)noteDidPerformMerge:(id)a3
{
}

- (void)undoManagerDidUndo:(id)a3
{
}

- (void)undoManagerDidRedo:(id)a3
{
}

- (void)noteDidChangeCalculatePreviewBehavior:(id)a3
{
  uint64_t v4 = sub_1B0B7F86C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  NSUInteger v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  uint64_t v8 = OBJC_IVAR___ICCalculateDocumentController_updating;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_updating) = 1;
  NSUInteger v9 = self;
  sub_1B0A74894();
  sub_1B0A6B384();
  sub_1B0B7007C();
  swift_release();
  *((unsigned char *)&self->super.isa + v8) = 0;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)textStorageDidProcessEndEditing:(id)a3
{
  uint64_t v4 = sub_1B0B7F86C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  NSUInteger v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController_needsDocumentUpdate) = 1;
  uint64_t v8 = self;
  sub_1B0A6C4F8();
  uint64_t v9 = sub_1B0B8216C();
  swift_release();
  sub_1B0A6A608(v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)contextMenuForResultAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = ICCalculateDocumentController.contextMenu(forResultAttachment:)(v4);

  return v6;
}

- (BOOL)isCalculateMathEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateDocumentController__isCalculateMathEnabled);
}

- (void)resetHighlights
{
  id v2 = self;
  uint64_t v3 = sub_1B0A6B384();
  id v4 = *(id *)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  swift_release();
}

- (ICCalculateDocumentController)init
{
  _NSRange result = (ICCalculateDocumentController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateDocumentController____lazy_storage___updateDelayer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateDocumentController____lazy_storage___highPriorityDelayer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateDocumentController____lazy_storage___numberFormatter));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateDocumentController_isMathPaperSolvingAllowedObservation));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICCalculateDocumentController_isKeyboardMathSolvingAllowedObservation);
}

@end