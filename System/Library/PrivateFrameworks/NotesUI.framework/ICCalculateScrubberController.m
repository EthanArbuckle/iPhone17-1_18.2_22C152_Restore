@interface ICCalculateScrubberController
- (BOOL)isScrubbing;
- (BOOL)isShowing;
- (ICCalculateScrubberController)init;
- (ICCalculateScrubberController)initWithTextView:(id)a3;
- (ICNote)note;
- (UITextView)textView;
- (void)dealloc;
- (void)deselectText;
- (void)didBeginScrub;
- (void)didEndScrub;
- (void)endBlockingMerge;
- (void)endPausingUndoActions;
- (void)hideIfNotScrubbing;
- (void)hideScrubber;
- (void)resetHoverTimer;
- (void)setHoveredCharacterIndex:(int64_t)a3;
- (void)setNote:(id)a3;
- (void)showScrubberForNumberLiteral:(id)a3 isCompact:(BOOL)a4;
- (void)startBlockingMerge;
- (void)startPausingUndoActions;
- (void)updateText:(id)a3;
@end

@implementation ICCalculateScrubberController

- (UITextView)textView
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___ICCalculateScrubberController_textView));
}

- (ICNote)note
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_note);
  swift_beginAccess();
  return (ICNote *)*v2;
}

- (void)setNote:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_note);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)isScrubbing
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_scrubber))
  {
    v2 = self;
    swift_retain();
    char v3 = sub_1B0B8004C();

    swift_release();
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (ICCalculateScrubberController)initWithTextView:(id)a3
{
  return (ICCalculateScrubberController *)sub_1B0B6B840((uint64_t)a3);
}

- (BOOL)isShowing
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_viewController);
  if (!v2) {
    goto LABEL_5;
  }
  char v3 = self;
  id v4 = objc_msgSend(v2, sel_view);
  if (!v4)
  {
    __break(1u);
    return (char)v4;
  }
  v5 = v4;
  id v6 = objc_msgSend(v4, sel_window);

  if (v6)
  {

    LOBYTE(v4) = 1;
  }
  else
  {
LABEL_5:
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)showScrubberForNumberLiteral:(id)a3 isCompact:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_1B0B6BAF0(a3, a4);
}

- (void)hideScrubber
{
  v2 = self;
  ICCalculateScrubberController.hideScrubber()();
}

- (void)didBeginScrub
{
}

- (void)updateText:(id)a3
{
  uint64_t v4 = sub_1B0B8240C();
  id v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ICCalculateScrubberController.updateText(string:)(v8);

  swift_bridgeObjectRelease();
}

- (void)didEndScrub
{
  v2 = self;
  char v3 = [(ICCalculateScrubberController *)v2 note];
  [(ICNote *)v3 updateModificationDateAndChangeCountAndSaveImmediately];
}

- (void)hideIfNotScrubbing
{
  v2 = self;
  ICCalculateScrubberController.hideIfNotScrubbing()();
}

- (void)deselectText
{
  v2 = self;
  sub_1B0B6C720();
}

- (void)startBlockingMerge
{
  v2 = self;
  sub_1B0B6C858();
}

- (void)endBlockingMerge
{
  v2 = self;
  sub_1B0B6C980();
}

- (void)startPausingUndoActions
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) & 1) == 0)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) = 1;
    v2 = self;
    char v3 = [(ICCalculateScrubberController *)v2 note];
    uint64_t v4 = [(ICNote *)v3 textStorage];

    [(ICTTTextStorage *)v4 setIsPausingUndoActions:1];
  }
}

- (void)endPausingUndoActions
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) == 1)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_isPausingUndoActions) = 0;
    v2 = self;
    char v3 = [(ICCalculateScrubberController *)v2 note];
    uint64_t v4 = [(ICNote *)v3 textStorage];

    [(ICTTTextStorage *)v4 setIsPausingUndoActions:0];
  }
}

- (void)dealloc
{
  v2 = self;
  [(ICCalculateScrubberController *)v2 hideScrubber];
  v3.receiver = v2;
  v3.super_class = (Class)ICCalculateScrubberController;
  [(ICCalculateScrubberController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateScrubberController____lazy_storage___hoverController));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateScrubberController_viewController);
}

- (ICCalculateScrubberController)init
{
  result = (ICCalculateScrubberController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)setHoveredCharacterIndex:(int64_t)a3
{
  uint64_t v4 = self;
  Swift::String v8 = sub_1B0B6B90C();
  v5 = &v8[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex];
  uint64_t v6 = *(void *)&v8[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex];
  char v7 = v8[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_hoveredCharacterIndex + 8];
  *(void *)v5 = a3;
  v5[8] = 0;
  sub_1B0B6CED0(v6, v7);
}

- (void)resetHoverTimer
{
  v2 = self;
  id v3 = sub_1B0B6B90C();
  id v4 = sub_1B0B6D22C();
  objc_msgSend(v4, sel_cancelPreviousFireRequests);
}

@end