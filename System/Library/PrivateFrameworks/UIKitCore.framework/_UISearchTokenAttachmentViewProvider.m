@interface _UISearchTokenAttachmentViewProvider
- (BOOL)isLastAttachmentBeforeText;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (_UISearchTokenAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (void)loadView;
@end

@implementation _UISearchTokenAttachmentViewProvider

- (_UISearchTokenAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISearchTokenAttachmentViewProvider;
  v11 = [(NSTextAttachmentViewProvider *)&v14 initWithTextAttachment:a3 parentView:v10 textLayoutManager:a5 location:a6];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_parentView, v10);
  }

  return v12;
}

- (void)loadView
{
  v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  id v19 = [v3 textContentManager];

  v4 = self;
  if (objc_opt_isKindOfClass()) {
    v5 = v19;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 attributedString];
  }
  else
  {
    v8 = [(NSTextAttachmentViewProvider *)self layoutManager];
    v7 = [v8 textStorage];
  }
  v9 = objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *(void *)off_1E52D2040, -[NSTextAttachmentViewProvider characterIndex](self, "characterIndex"), 0);
  id v10 = objc_alloc_init(_UISearchAtomView);
  v11 = [(NSTextAttachmentViewProvider *)self textAttachment];
  v12 = [v11 token];

  v13 = [v12 text];
  objc_super v14 = [(_UISearchAtomView *)v10 textLabel];
  [v14 setText:v13];

  v15 = [v12 image];
  v16 = [(_UISearchAtomView *)v10 leadingImage];
  [v16 setImage:v15];

  [(_UISearchAtomView *)v10 setAtomFont:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  [WeakRetained bounds];
  [(_UISearchAtomView *)v10 setViewportWidth:CGRectGetWidth(v21)];

  v18 = [[_UISearchTokenLayoutView alloc] initWithDelegateView:v10];
  [(NSTextAttachmentViewProvider *)self setView:v18];
}

- (BOOL)isLastAttachmentBeforeText
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  v4 = [(NSTextAttachmentViewProvider *)self location];
  v5 = [v3 locationFromLocation:v4 withOffset:1];

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66___UISearchTokenAttachmentViewProvider_isLastAttachmentBeforeText__block_invoke;
    v8[3] = &unk_1E52DF3A0;
    v8[4] = &v9;
    [v3 enumerateSubstringsFromLocation:v5 options:2 usingBlock:v8];
  }
  char v6 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v10 = a4.origin.y;
  double v11 = a4.origin.x;
  id v13 = a3;
  objc_super v14 = [(NSTextAttachmentViewProvider *)self view];
  objc_msgSend(v14, "boundsForTextContainer:proposedLineFragment:glyphPosition:", v13, v11, v10, width, height, x, y);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double height = a6.size.height;
  double width = a6.size.width;
  double v11 = a6.origin.y;
  double v12 = a6.origin.x;
  id v14 = a5;
  double v15 = [(NSTextAttachmentViewProvider *)self view];
  objc_msgSend(v15, "setIsLastSearchToken:", -[_UISearchTokenAttachmentViewProvider isLastAttachmentBeforeText](self, "isLastAttachmentBeforeText"));
  objc_msgSend(v15, "boundsForTextContainer:proposedLineFragment:glyphPosition:", v14, v12, v11, width, height, x, y);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void).cxx_destruct
{
}

@end