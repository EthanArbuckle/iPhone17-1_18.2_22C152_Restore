@interface PaperDocumentContainerView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isLocked;
- (BOOL)isZoomed;
- (CGPoint)contentOffset;
- (CGRect)frameInContainingScrollView;
- (CGRect)scrollBounds;
- (CGSize)contentSize;
- (UIEdgeInsets)adjustedContentInset;
- (UIScrollView)scrollView;
- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView)initWithCoder:(id)a3;
- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView)initWithFrame:(CGRect)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)pdfViewMightHaveZoomed:(id)a3;
- (void)pdfViewSelectedPageThumbnail:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setContentOffset:(CGPoint)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)updateConstraints;
- (void)updatePaletteVisibility;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PaperDocumentContainerView

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_doubleTapEater);
  if (!v7)
  {
    id v15 = a3;
    id v16 = a4;
    v17 = self;
    goto LABEL_5;
  }
  sub_20BFCEE58(0, &qword_2676BB6C8);
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = v7;
  char v12 = sub_20C163630();

  if ((v12 & 1) == 0)
  {
LABEL_5:
    type metadata accessor for PanEaterGestureRecognizer();
    swift_dynamicCastClass();

    char v14 = 1;
    goto LABEL_6;
  }
  BOOL v13 = sub_20BFB95E8();

  char v14 = !v13;
LABEL_6:

  return v14 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_20BFB98F4((uint64_t)v6, v7);
  char v10 = v9;

  return v10 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_20BFCADE0(v7);

  return v9 & 1;
}

- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20BFCAEC4();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_20BFB9D08((uint64_t)a3);
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_20BFB9F8C();
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v5 = self;
  id v6 = a3;
  id v7 = self;
  objc_msgSend(v5, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v7, sel_updatePaletteVisibility, 0);
  [(PaperDocumentContainerView *)v7 performSelector:sel_updatePaletteVisibility withObject:0 afterDelay:0.0];
}

- (void)updateConstraints
{
  v2 = self;
  sub_20BFBA434();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20BFBA6C4();
}

- (void)pdfViewMightHaveZoomed:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  id v8 = self;
  sub_20BFBB390();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)pdfViewSelectedPageThumbnail:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  id v8 = self;
  sub_20BFBB8E0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20BFBBAF0(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  char v10 = self;
  sub_20BFBBFD4(v9, &a5->x, x, y);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_20BFBCEC4(a3);
}

- (void)updatePaletteVisibility
{
  v2 = self;
  sub_20BFBA154();
}

- (_TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_inlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_autoFillBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_headerContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_headerContainer));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_collapseThumbnailsConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_collapseFormFillingBannerConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_stickyHeaderConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_pushStickyHeaderAwayConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_doubleTapEater));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditorP33_B1771FC5B77E2D60FA249C310C92C62226PaperDocumentContainerView_nestedScrollViewInteraction);
}

- (UIScrollView)scrollView
{
  v2 = self;
  result = (UIScrollView *)sub_20C162050();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v4 = result;
  id v5 = (void *)sub_20C161FC0();

  if (!v5)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v6 = objc_msgSend(v5, sel_documentScrollView);

  if (!v6)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  return (UIScrollView *)v6;
}

- (BOOL)isZoomed
{
  v2 = self;
  sub_20BFBD5DC(sub_20BFB11A0);
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)isLocked
{
  v2 = self;
  sub_20BFBD5DC((void (*)(void))sub_20BFB95E8);
  char v4 = v3;

  return v4 & 1;
}

- (CGRect)frameInContainingScrollView
{
  double v2 = sub_20BFBDA94(self, (uint64_t)a2, (double (*)(void))sub_20BFBD6D8);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGPoint)contentOffset
{
  double v2 = self;
  sub_20BFBD9D0((SEL *)&selRef_contentOffset);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  sub_20BFBD8C8(x, y);
}

- (CGSize)contentSize
{
  double v2 = self;
  sub_20BFBD9D0((SEL *)&selRef_contentSize);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)scrollBounds
{
  double v2 = sub_20BFBDA94(self, (uint64_t)a2, (double (*)(void))sub_20BFBDAF8);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIEdgeInsets)adjustedContentInset
{
  double v2 = self;
  sub_20BFBDC0C();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

@end