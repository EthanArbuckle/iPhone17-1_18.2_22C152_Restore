@interface PaperDocumentHeaderView
- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView)initWithCoder:(id)a3;
- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutMarginsDidChange;
@end

@implementation PaperDocumentHeaderView

- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_stackView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_moreButton) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_toggleThumbnailsButton) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_isCompact) = 1;
  id v5 = a3;

  result = (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(PaperDocumentHeaderView *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3) {
    sub_20BF9A6E8();
  }
}

- (void)layoutMarginsDidChange
{
  id v2 = self;
  sub_20BFBEFE4();
}

- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_moreButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62223PaperDocumentHeaderView_toggleThumbnailsButton);
}

@end