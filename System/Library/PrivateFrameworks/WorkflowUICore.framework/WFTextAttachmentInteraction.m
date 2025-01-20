@interface WFTextAttachmentInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (NSTextContainer)textContainer;
- (UIEdgeInsets)textContainerInset;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)view;
- (WFTextAttachmentInteractionDelegate)delegate;
- (id)attachmentAtPoint:(CGPoint)a3 characterRange:(_NSRange *)a4;
- (id)layoutManager;
- (id)textStorage;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)handleTextTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextContainer:(id)a3;
- (void)setTextContainerInset:(UIEdgeInsets)a3;
@end

@implementation WFTextAttachmentInteraction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapGestureRecognizer);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapGestureRecognizer);
  return (UITapGestureRecognizer *)WeakRetained;
}

- (void)setTextContainerInset:(UIEdgeInsets)a3
{
  self->_textContainerInset = a3;
}

- (UIEdgeInsets)textContainerInset
{
  double top = self->_textContainerInset.top;
  double left = self->_textContainerInset.left;
  double bottom = self->_textContainerInset.bottom;
  double right = self->_textContainerInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextContainer:(id)a3
{
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (void)setDelegate:(id)a3
{
}

- (WFTextAttachmentInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTextAttachmentInteractionDelegate *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFTextAttachmentInteraction *)self tapGestureRecognizer];

  if (v8 == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = [(WFTextAttachmentInteraction *)self view];
    [v6 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    v15 = -[WFTextAttachmentInteraction attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", 0, v12, v14);
    BOOL v9 = v15 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  id v5 = a4;
  id v6 = [(WFTextAttachmentInteraction *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = -[WFTextAttachmentInteraction attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", &v15, v8, v10);
  if (v11)
  {
    double v12 = [(WFTextAttachmentInteraction *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v13 = objc_msgSend(v12, "textAttachmentInteraction:shouldRecognizeTapOnTextAttachment:inCharacterRange:", self, v11, v15, v16);
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)handleTextTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    id v5 = [(WFTextAttachmentInteraction *)self view];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    double v10 = -[WFTextAttachmentInteraction attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", &v12, v7, v9);
    if (v10)
    {
      double v11 = [(WFTextAttachmentInteraction *)self delegate];
      objc_msgSend(v11, "textAttachmentInteraction:didTapTextAttachment:inCharacterRange:", self, v10, v12, v13);
    }
  }
}

- (id)attachmentAtPoint:(CGPoint)a3 characterRange:(_NSRange *)a4
{
  double y = a3.y;
  double x = a3.x;
  [(WFTextAttachmentInteraction *)self textContainerInset];
  double v9 = y - v8;
  [(WFTextAttachmentInteraction *)self textContainerInset];
  double v11 = x - v10;
  uint64_t v12 = [(WFTextAttachmentInteraction *)self layoutManager];
  uint64_t v13 = [(WFTextAttachmentInteraction *)self textContainer];
  NSUInteger v14 = objc_msgSend(v12, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v13, 0, v11, v9);

  uint64_t v15 = [(WFTextAttachmentInteraction *)self layoutManager];
  uint64_t v16 = [(WFTextAttachmentInteraction *)self textContainer];
  uint64_t v17 = objc_msgSend(v15, "glyphIndexForPoint:inTextContainer:", v16, v11, v9);

  v18 = [(WFTextAttachmentInteraction *)self textStorage];
  unint64_t v19 = [v18 length];

  v20 = 0;
  if (v14 < v19)
  {
    v21 = [(WFTextAttachmentInteraction *)self textStorage];
    v20 = [v21 attribute:*MEMORY[0x263F814A0] atIndex:v14 effectiveRange:0];

    if (!v20) {
      goto LABEL_6;
    }
    v22 = [(WFTextAttachmentInteraction *)self layoutManager];
    v23 = [(WFTextAttachmentInteraction *)self textContainer];
    objc_msgSend(v22, "boundingRectForGlyphRange:inTextContainer:", v17, 1, v23);
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    v35.origin.double x = v25;
    v35.origin.double y = v27;
    v35.size.width = v29;
    v35.size.height = v31;
    v34.double x = v11;
    v34.double y = v9;
    if (CGRectContainsPoint(v35, v34))
    {
      if (a4)
      {
        a4->location = v14;
        a4->length = 1;
      }
    }
    else
    {
LABEL_6:

      v20 = 0;
    }
  }
  return v20;
}

- (id)textStorage
{
  v2 = [(WFTextAttachmentInteraction *)self layoutManager];
  v3 = [v2 textStorage];

  return v3;
}

- (id)layoutManager
{
  v2 = [(WFTextAttachmentInteraction *)self textContainer];
  v3 = [v2 layoutManager];

  return v3;
}

- (void)dealloc
{
  v3 = [(WFTextAttachmentInteraction *)self view];
  id v4 = [(WFTextAttachmentInteraction *)self tapGestureRecognizer];
  [v3 removeGestureRecognizer:v4];

  v5.receiver = self;
  v5.super_class = (Class)WFTextAttachmentInteraction;
  [(WFTextAttachmentInteraction *)&v5 dealloc];
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFTextAttachmentInteraction *)self view];
  double v6 = [(WFTextAttachmentInteraction *)self tapGestureRecognizer];
  [v5 removeGestureRecognizer:v6];

  objc_storeWeak((id *)&self->_view, v4);
  id obj = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTextTap_];
  [obj setDelegate:self];
  [v4 addGestureRecognizer:obj];

  objc_storeWeak((id *)&self->_tapGestureRecognizer, obj);
}

@end