@interface ICPaperDocumentTextAttachmentView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)bounds;
- (ICPaperDocumentTextAttachmentView)initWithCoder:(id)a3;
- (ICPaperDocumentTextAttachmentView)initWithFrame:(CGRect)a3;
- (NSArray)accessibilityElements;
- (NSArray)supportedRotorTypes;
- (NSString)accessibilityLabel;
- (NSTextAttachment)textAttachment;
- (_NSRange)_icaxRangeInTextStorage;
- (_TtC11NotesEditor27PaperDocumentEngagementData)engagementData;
- (double)additionalXOffsetForTextDragPreviewInTextView:(id)a3;
- (id)_icaxEnclosingTextView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)paperDocumentEngagementData;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)tiledViewAttachmentViews;
- (id)viewForTextDragPreview;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)imageForTextPreviewUsingFindingResult:(id)a3 inTextView:(id)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)paperDidSaveDidQuiesce;
- (void)pinch:(id)a3;
- (void)quickLook:(id)a3;
- (void)resetPaperDocumentEngagementData;
- (void)setBounds:(CGRect)a3;
- (void)setEngagementData:(id)a3;
- (void)setTextAttachment:(id)a3;
- (void)updateHeaderConfiguration;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ICPaperDocumentTextAttachmentView

- (NSArray)supportedRotorTypes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"ICAccessibilityRotorTypeAttachments";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (_NSRange)_icaxRangeInTextStorage
{
  v3 = [(ICPaperDocumentTextAttachmentView *)self _icaxEnclosingTextView];
  v4 = [v3 textStorage];

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3010000000;
  v15 = &unk_20C1E2BF2;
  long long v16 = xmmword_20C1794E0;
  uint64_t v5 = [v4 length];
  uint64_t v6 = *MEMORY[0x263F814A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__ICPaperDocumentTextAttachmentView_Accessibility___icaxRangeInTextStorage__block_invoke;
  v11[3] = &unk_2640B8D60;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v11);
  NSUInteger v7 = v13[4];
  NSUInteger v8 = v13[5];
  _Block_object_dispose(&v12, 8);

  NSUInteger v9 = v7;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

void __75__ICPaperDocumentTextAttachmentView_Accessibility___icaxRangeInTextStorage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  NSUInteger v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 textAttachment];

  if (v11 == v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a3;
    *(void *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

- (id)_icaxEnclosingTextView
{
  id v2 = [(ICPaperDocumentTextAttachmentView *)self superview];
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      id v2 = (id)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

- (id)paperDocumentEngagementData
{
  id v2 = self;
  uint64_t v3 = (void *)sub_20BFC81D8();
  swift_unknownObjectRetain();

  return v3;
}

- (void)resetPaperDocumentEngagementData
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData)) {
    sub_20C14EA44();
  }
}

- (void)paperDidSaveDidQuiesce
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_isRevertingChanges) = 0;
}

- (_TtC11NotesEditor27PaperDocumentEngagementData)engagementData
{
  return (_TtC11NotesEditor27PaperDocumentEngagementData *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData);
}

- (void)setEngagementData:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData) = (Class)a3;
  id v3 = a3;
}

- (NSArray)accessibilityElements
{
  id v2 = self;
  id v3 = sub_20BF99104();

  if (v3)
  {
    id v4 = (void *)sub_20C162CE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentView();
  [(ICPaperDocumentTextAttachmentView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  NSUInteger v8 = (objc_class *)type metadata accessor for PaperDocumentTextAttachmentView();
  v23.receiver = self;
  v23.super_class = v8;
  NSUInteger v9 = self;
  [(ICPaperDocumentTextAttachmentView *)&v23 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v22.receiver = v9;
  v22.super_class = v8;
  -[ICPaperDocumentTextAttachmentView setBounds:](&v22, sel_setBounds_, x, y, width, height);
  [(ICPaperDocumentTextAttachmentView *)v9 bounds];
  v25.origin.double x = v18;
  v25.origin.double y = v19;
  v25.size.double width = v20;
  v25.size.double height = v21;
  v24.origin.double x = v11;
  v24.origin.double y = v13;
  v24.size.double width = v15;
  v24.size.double height = v17;
  if (!CGRectEqualToRect(v24, v25)) {
    sub_20BFA75F4(1, 0);
  }
}

- (NSTextAttachment)textAttachment
{
  double v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textAttachment);
  swift_beginAccess();
  return (NSTextAttachment *)*v2;
}

- (void)setTextAttachment:(id)a3
{
  double v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textAttachment);
  swift_beginAccess();
  double v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (void)willMoveToWindow:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_20BF9CD7C(a3);
}

- (void)didMoveToWindow
{
  double v2 = self;
  sub_20BF9E278();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentView();
  id v7 = v15.receiver;
  id v8 = a4;
  id v9 = -[ICPaperDocumentTextAttachmentView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  double v10 = v9;
  sub_20BFCEE58(0, (unint64_t *)&qword_26AD812D0);
  id v11 = v7;
  id v12 = v10;
  char v13 = sub_20C163630();

  id v8 = v12;
  if (v13)
  {
LABEL_5:

    id v12 = 0;
  }

  return v12;
}

- (ICPaperDocumentTextAttachmentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20BFC8CFC();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = self;
  LOBYTE(self) = sub_20BFA589C(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_20BFA5BF8(v6, v7);
  char v10 = v9;

  return v10 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_20BFA5EF8(v6, v7);
  char v10 = v9;

  return v10 & 1;
}

- (void)pinch:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_20BFA6390(v5);
}

- (void)updateHeaderConfiguration
{
  double v2 = self;
  sub_20BFA77D8();
}

- (void)quickLook:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_20BFAA4A8(0);
}

- (void)dealloc
{
  double v2 = self;
  id v3 = [(ICPaperDocumentTextAttachmentView *)v2 undoManager];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_removeAllActionsWithTarget_, v2);
  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentView();
  [(ICPaperDocumentTextAttachmentView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_viewControllerForPresentingUI));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView____lazy_storage___paperDidSaveSelectorDelayer));
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR___ICPaperDocumentTextAttachmentView_attachmentChangeNotifications, (uint64_t *)&unk_26AD80ED8);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_engagementData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView____lazy_storage___smallBrickView));
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textAttachment));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_inlinePaperDocumentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_paperDocumentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_placeholderContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_internalErrorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_quickLookTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICPaperDocumentTextAttachmentView_pinchToResizeGestureRecognizer));

  sub_20BFCEB78((uint64_t)self + OBJC_IVAR___ICPaperDocumentTextAttachmentView_liveStreamMessenger);
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR___ICPaperDocumentTextAttachmentView_textualContextProvider;

  sub_20BFCEB78((uint64_t)v3);
}

- (id)tiledViewAttachmentViews
{
  sub_20BFCEE58(0, (unint64_t *)&unk_2676BBE98);
  double v2 = (void *)sub_20C162CE0();

  return v2;
}

- (ICPaperDocumentTextAttachmentView)initWithFrame:(CGRect)a3
{
}

- (void)imageForTextPreviewUsingFindingResult:(id)a3 inTextView:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_20BFC9EA0(a3, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (id)viewForTextDragPreview
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICPaperDocumentTextAttachmentView_displayMode)
    && *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICPaperDocumentTextAttachmentView_paperDocumentContainerView))
  {
    self = *(ICPaperDocumentTextAttachmentView **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___ICPaperDocumentTextAttachmentView_paperDocumentContainerView);
  }
  return self;
}

- (double)additionalXOffsetForTextDragPreviewInTextView:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  PaperDocumentTextAttachmentView.additionalXOffsetForTextDragPreview(in:)(v4);
  double v7 = v6;

  return v7;
}

- (void)layoutSubviews
{
  double v2 = self;
  PaperDocumentTextAttachmentView.layoutSubviews()();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  double v6 = self;
  id v7 = _s11NotesEditor31PaperDocumentTextAttachmentViewC22contextMenuInteraction_016configurationForI10AtLocationSo09UIContextI13ConfigurationCSgSo0oiJ0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = _s11NotesEditor31PaperDocumentTextAttachmentViewC22contextMenuInteraction_022previewForHighlightingI17WithConfigurationSo17UITargetedPreviewCSgSo09UIContextiJ0C_So0riO0CtF_0();

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_20BFCAC18(a5);

  swift_unknownObjectRelease();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (NSString)accessibilityLabel
{
  double v2 = self;
  PaperDocumentTextAttachmentView.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_20C162A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

@end