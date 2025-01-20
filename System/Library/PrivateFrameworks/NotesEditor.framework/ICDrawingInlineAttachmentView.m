@interface ICDrawingInlineAttachmentView
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)cancelDidScrollIntoVisibleRange;
- (BOOL)shouldAddPanGesture;
- (CGRect)boundsForDisplay;
- (ICDrawingInlineAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5;
- (ICDrawingInlineView)drawingInlineView;
- (id)accessibilityLabel;
- (id)icaxHintString;
- (void)dealloc;
- (void)didChangeSize;
- (void)didScrollIntoVisibleRange;
- (void)didScrollOutOfVisibleRange;
- (void)didTapAttachment:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachmentContentSize:(CGSize)a3;
- (void)setDrawingInlineView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)sharedInit:(BOOL)a3;
@end

@implementation ICDrawingInlineAttachmentView

- (id)icaxHintString
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Double tap to edit sketch" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 localizedStringForKey:@"sketch attachment" value:&stru_26C10E100 table:0];

  v7 = [(ICAttachmentView *)self icaxAttachmentViewTypeDescription];
  v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (ICDrawingInlineAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  return -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, "initWithFrame:textAttachment:textContainer:forManualRendering:", a3, a4, a5, 0.0, 0.0, 0.0, 0.0);
}

- (void)sharedInit:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICDrawingInlineAttachmentView;
  [(ICAttachmentView *)&v13 sharedInit:a3];
  v4 = [ICDrawingInlineView alloc];
  [(ICDrawingInlineAttachmentView *)self bounds];
  v9 = -[ICDrawingInlineView initWithFrame:forManualRendering:](v4, "initWithFrame:forManualRendering:", [(ICAttachmentView *)self forManualRendering], v5, v6, v7, v8);
  [(ICDrawingInlineAttachmentView *)self setDrawingInlineView:v9];

  v10 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [v10 setEditable:1];

  v11 = [MEMORY[0x263F825C8] clearColor];
  [(ICDrawingInlineAttachmentView *)self setIc_backgroundColor:v11];

  v12 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [(ICDrawingInlineAttachmentView *)self addSubview:v12];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDrawingInlineAttachmentView;
  [(ICAttachmentView *)&v4 dealloc];
}

- (CGRect)boundsForDisplay
{
  v2 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [v2 boundsForDisplay];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  double v5 = [(ICDrawingInlineAttachmentView *)self attachment];

  double v6 = (uint64_t *)MEMORY[0x263F5A978];
  double v7 = (uint64_t *)MEMORY[0x263F5A940];
  if (v5)
  {
    double v8 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v9 = *v6;
    double v10 = [(ICDrawingInlineAttachmentView *)self attachment];
    double v11 = [v10 objectID];
    [v8 removeObserver:self name:v9 object:v11];

    double v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *v7;
    double v14 = [(ICDrawingInlineAttachmentView *)self attachment];
    v15 = [v14 objectID];
    [v12 removeObserver:self name:v13 object:v15];
  }
  v28.receiver = self;
  v28.super_class = (Class)ICDrawingInlineAttachmentView;
  [(ICDrawingInlineAttachmentView *)&v28 setAttachment:v4];
  v16 = [(ICDrawingInlineAttachmentView *)self attachment];
  v17 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [v17 setAttachment:v16];

  v18 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [v18 setThumbnailDisplay:0];

  v19 = [(ICDrawingInlineAttachmentView *)self attachment];

  if (v19)
  {
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v21 = *v6;
    v22 = [(ICDrawingInlineAttachmentView *)self attachment];
    v23 = [v22 objectID];
    [v20 addObserver:self selector:sel_didChangeSize name:v21 object:v23];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v25 = *v7;
    v26 = [(ICDrawingInlineAttachmentView *)self attachment];
    v27 = [v26 objectID];
    [v24 addObserver:self selector:sel_didChangeSize name:v25 object:v27];
  }
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICDrawingInlineAttachmentView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICDrawingInlineAttachmentView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)setAttachmentContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICDrawingInlineAttachmentView setAttachmentContentSize:](&v7, sel_setAttachmentContentSize_);
  double v6 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  objc_msgSend(v6, "setAttachmentContentSize:", width, height);
}

- (void)didTapAttachment:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(ICDrawingInlineAttachmentView *)self attachment];
  double v6 = [v5 attachmentModel];
  if ([v6 isReadyToPresent])
  {
    objc_super v7 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
    int v8 = [v7 isReadyToPresent];

    if (v8)
    {
      v12.receiver = self;
      v12.super_class = (Class)ICDrawingInlineAttachmentView;
      [(ICAttachmentView *)&v12 didTapAttachment:v4];
      goto LABEL_8;
    }
  }
  else
  {
  }
  double v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = [(ICDrawingInlineAttachmentView *)self attachment];
    double v11 = [v10 shortLoggingDescription];
    *(_DWORD *)buf = 138412290;
    double v14 = v11;
    _os_log_impl(&dword_20BE60000, v9, OS_LOG_TYPE_INFO, "Not presenting drawing %@ because it's not ready yet", buf, 0xCu);
  }
LABEL_8:
}

- (void)didScrollIntoVisibleRange
{
  id v2 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [v2 didScrollIntoVisibleRange];
}

- (void)didScrollOutOfVisibleRange
{
  id v2 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  [v2 didScrollOutOfVisibleRange];
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  id v2 = [(ICDrawingInlineAttachmentView *)self drawingInlineView];
  char v3 = [v2 cancelDidScrollIntoVisibleRange];

  return v3;
}

- (void)didChangeSize
{
  char v3 = [(ICDrawingInlineAttachmentView *)self attachment];
  id v4 = [v3 managedObjectContext];
  double v5 = [(ICDrawingInlineAttachmentView *)self attachment];
  objc_msgSend(v4, "ic_refreshObject:mergeChanges:", v5, 1);

  v6.receiver = self;
  v6.super_class = (Class)ICDrawingInlineAttachmentView;
  [(ICDrawingInlineAttachmentView *)&v6 didChangeSize];
}

- (BOOL)shouldAddPanGesture
{
  return 1;
}

- (ICDrawingInlineView)drawingInlineView
{
  return self->_drawingInlineView;
}

- (void)setDrawingInlineView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end