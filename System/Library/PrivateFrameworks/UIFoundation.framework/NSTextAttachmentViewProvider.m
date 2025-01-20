@interface NSTextAttachmentViewProvider
- (BOOL)tracksTextAttachmentViewBounds;
- (CGRect)attachmentBoundsForAttributes:(NSDictionary *)attributes location:(id)location textContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)proposedLineFragment position:(CGPoint)position;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (NSLayoutManager)layoutManager;
- (NSTextAttachment)textAttachment;
- (NSTextAttachmentViewProvider)initWithTextAttachment:(NSTextAttachment *)textAttachment parentView:(UIView *)parentView textLayoutManager:(NSTextLayoutManager *)textLayoutManager location:(id)location;
- (NSTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 characterIndex:(unint64_t)a5 layoutManager:(id)a6;
- (NSTextLayoutManager)textLayoutManager;
- (UIView)view;
- (id)location;
- (id)previewImageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (unint64_t)characterIndex;
- (void)dealloc;
- (void)removeView;
- (void)setLayoutManager:(id)a3;
- (void)setLocation:(id)a3;
- (void)setTextAttachment:(id)a3;
- (void)setTextLayoutManager:(id)a3;
- (void)setTracksTextAttachmentViewBounds:(BOOL)tracksTextAttachmentViewBounds;
- (void)setView:(UIView *)view;
@end

@implementation NSTextAttachmentViewProvider

- (BOOL)tracksTextAttachmentViewBounds
{
  return self->_tracksTextAttachmentViewBounds;
}

- (NSTextAttachment)textAttachment
{
  return (NSTextAttachment *)objc_loadWeak((id *)&self->_textAttachment);
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (UIView)view
{
  if (!self->_view) {
    [(NSTextAttachmentViewProvider *)self loadView];
  }
  objc_sync_enter(self);
  v3 = self->_view;
  objc_sync_exit(self);
  return v3;
}

- (NSTextAttachmentViewProvider)initWithTextAttachment:(NSTextAttachment *)textAttachment parentView:(UIView *)parentView textLayoutManager:(NSTextLayoutManager *)textLayoutManager location:(id)location
{
  v12.receiver = self;
  v12.super_class = (Class)NSTextAttachmentViewProvider;
  v9 = [(NSTextAttachmentViewProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(NSTextAttachmentViewProvider *)v9 setTextAttachment:textAttachment];
    v10->_location = (NSTextLocation *)location;
    [(NSTextAttachmentViewProvider *)v10 setTracksTextAttachmentViewBounds:0];
    [(NSTextAttachmentViewProvider *)v10 setTextLayoutManager:textLayoutManager];
  }
  return v10;
}

- (void)setTracksTextAttachmentViewBounds:(BOOL)tracksTextAttachmentViewBounds
{
  self->_tracksTextAttachmentViewBounds = tracksTextAttachmentViewBounds;
}

- (void)setTextLayoutManager:(id)a3
{
}

- (void)setTextAttachment:(id)a3
{
}

- (void)setView:(UIView *)view
{
  if (self->_view != view)
  {
    objc_sync_enter(self);

    self->_view = view;
    objc_sync_exit(self);
  }
}

- (void)removeView
{
  v3 = [(NSTextAttachmentViewProvider *)self view];
  if (v3)
  {
    v4 = v3;
    v5 = [(NSTextAttachmentViewProvider *)self textAttachment];
    uint64_t v6 = [(UIView *)v4 superview];
    [(NSTextAttachment *)v5 detachView:v4 fromParentView:v6];
  }
}

- (void)dealloc
{
  view = self->_view;
  if (view)
  {
    [[(NSTextAttachmentViewProvider *)self textAttachment] detachView:view fromParentView:[(UIView *)view superview]];
    v4 = self->_view;
  }
  else
  {
    v4 = 0;
  }

  [(NSTextAttachmentViewProvider *)self setTextAttachment:0];
  [(NSTextAttachmentViewProvider *)self setTextLayoutManager:0];
  [(NSTextAttachmentViewProvider *)self setLayoutManager:0];
  v5.receiver = self;
  v5.super_class = (Class)NSTextAttachmentViewProvider;
  [(NSTextAttachmentViewProvider *)&v5 dealloc];
}

- (CGRect)attachmentBoundsForAttributes:(NSDictionary *)attributes location:(id)location textContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)proposedLineFragment position:(CGPoint)position
{
  uint64_t v7 = MEMORY[0x1E4F28AD8];
  double v8 = *MEMORY[0x1E4F28AD8];
  double v9 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  v10 = [(NSTextAttachmentViewProvider *)self view];
  if (v10)
  {
    [(UIView *)v10 intrinsicContentSize];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *(double *)(v7 + 16);
    double v14 = *(double *)(v7 + 24);
  }
  double v15 = v8;
  double v16 = v9;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)previewImageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  return 0;
}

- (NSTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 characterIndex:(unint64_t)a5 layoutManager:(id)a6
{
  double v11 = [[NSCountableTextLocation alloc] initWithIndex:a5];
  double v12 = [(NSTextAttachmentViewProvider *)self initWithTextAttachment:a3 parentView:a4 textLayoutManager:0 location:v11];
  double v13 = v12;
  if (v12)
  {
    [(NSTextAttachmentViewProvider *)v12 setLayoutManager:a6];
    v13->_characterIndex = a5;
  }

  return v13;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  uint64_t v6 = MEMORY[0x1E4F28AD8];
  double v7 = *MEMORY[0x1E4F28AD8];
  double v8 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v9 = [(NSTextAttachmentViewProvider *)self view];
  if (v9)
  {
    [(UIView *)v9 intrinsicContentSize];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *(double *)(v6 + 16);
    double v13 = *(double *)(v6 + 24);
  }
  double v14 = v7;
  double v15 = v8;
  result.size.height = v13;
  result.size.width = v11;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)location
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setLocation:(id)a3
{
}

- (unint64_t)characterIndex
{
  return self->_characterIndex;
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_loadWeak((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_textLayoutManager);

  objc_destroyWeak((id *)&self->_textAttachment);
}

@end