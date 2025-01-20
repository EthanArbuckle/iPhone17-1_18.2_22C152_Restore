@interface _PXUITextView
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (_PXUITextView)initWithFrame:(CGRect)a3;
- (double)_distanceFromContentToGivenPoint:(CGPoint)a3 charIndexAtPoint:(unint64_t *)a4;
- (id)_linkTappedByGesture:(id)a3 charIndexAtPoint:(unint64_t *)a4;
- (id)keyCommands;
- (void)_handleTapGesture:(id)a3;
- (void)addKeyCommand:(id)a3;
- (void)setEditable:(BOOL)a3;
@end

@implementation _PXUITextView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_keyCommands, 0);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (double)_distanceFromContentToGivenPoint:(CGPoint)a3 charIndexAtPoint:(unint64_t *)a4
{
  if (a4) {
    *a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v6 = -[_PXUITextView closestPositionToPoint:](self, "closestPositionToPoint:", a3.x, a3.y);
  if (v6)
  {
    v7 = [(_PXUITextView *)self beginningOfDocument];
    unint64_t v8 = [(_PXUITextView *)self offsetFromPosition:v7 toPosition:v6];

    v9 = [(_PXUITextView *)self layoutManager];
    uint64_t v10 = [v9 glyphIndexForCharacterAtIndex:v8];
    v11 = [(_PXUITextView *)self textContainer];
    objc_msgSend(v9, "boundingRectForGlyphRange:inTextContainer:", v10, 0, v11);

    v12 = [(_PXUITextView *)self textContainer];
    [v12 textContainerOrigin];

    UIDistanceBetweenPointAndRect();
    double v14 = v13;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    double v14 = 1.79769313e308;
  }

  return v14;
}

- (id)_linkTappedByGesture:(id)a3 charIndexAtPoint:(unint64_t *)a4
{
  id v6 = a3;
  v7 = [(_PXUITextView *)self text];
  unint64_t v8 = (void *)[v7 length];

  if (!v8) {
    goto LABEL_13;
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (![v6 numberOfTouches]) {
    goto LABEL_6;
  }
  [v6 locationOfTouch:0 inView:self];
  -[_PXUITextView _distanceFromContentToGivenPoint:charIndexAtPoint:](self, "_distanceFromContentToGivenPoint:charIndexAtPoint:", &v15);
  if ((void *)v15 == v8)
  {
    if (v9 < 8.0)
    {
      uint64_t v10 = [(_PXUITextView *)self textStorage];
      v11 = v10;
      uint64_t v12 = *MEMORY[0x1E4FB0720];
      unint64_t v13 = v15 - 1;
LABEL_10:
      unint64_t v8 = [v10 attribute:v12 atIndex:v13 effectiveRange:0];

      goto LABEL_11;
    }
LABEL_6:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  unint64_t v8 = 0;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL && v9 < 28.0)
  {
    uint64_t v10 = [(_PXUITextView *)self textStorage];
    v11 = v10;
    uint64_t v12 = *MEMORY[0x1E4FB0720];
    unint64_t v13 = v15;
    goto LABEL_10;
  }
LABEL_11:
  if (a4) {
    *a4 = v15;
  }
LABEL_13:

  return v8;
}

- (void)_handleTapGesture:(id)a3
{
  id v6 = a3;
  id v4 = [(_PXUITextView *)self tapGestureRecognizer];
  if (v4 == v6)
  {
    uint64_t v5 = [v6 state];

    if (v5 == 3) {
      [(_PXUITextView *)self becomeFirstResponder];
    }
  }
  else
  {
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ == a3)
  {
    [(_PXUITextView *)self selectedRange];
    return v5 != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_PXUITextView;
    return -[_PXUITextView canPerformAction:withSender:](&v6, sel_canPerformAction_withSender_);
  }
}

- (BOOL)becomeFirstResponder
{
  [(_PXUITextView *)self setEditable:1];
  v4.receiver = self;
  v4.super_class = (Class)_PXUITextView;
  return [(_PXUITextView *)&v4 becomeFirstResponder];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)keyCommands
{
  v7.receiver = self;
  v7.super_class = (Class)_PXUITextView;
  v3 = [(_PXUITextView *)&v7 keyCommands];
  objc_super v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:self->_keyCommands];

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_PXUITextView *)self tapGestureRecognizer];

  if (v5 == v4)
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    objc_super v7 = [(_PXUITextView *)self _linkTappedByGesture:v4 charIndexAtPoint:&v10];

    unsigned __int8 v6 = v7 == 0;
    if (!v7 && v10 != 0x7FFFFFFFFFFFFFFFLL) {
      -[_PXUITextView setSelectedRange:](self, "setSelectedRange:", v10, 0);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_PXUITextView;
    unsigned __int8 v6 = [(_PXUITextView *)&v9 gestureRecognizerShouldBegin:v4];
  }
  return v6;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)addKeyCommand:(id)a3
{
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PXUITextView;
  -[_PXUITextView setEditable:](&v8, sel_setEditable_);
  if (v3)
  {
    id v5 = [(_PXUITextView *)self tapGestureRecognizer];
    unsigned __int8 v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    [(_PXUITextView *)self setScrollEnabled:0];
    id v5 = [(_PXUITextView *)self tapGestureRecognizer];
    unsigned __int8 v6 = v5;
    uint64_t v7 = 1;
  }
  [v5 setEnabled:v7];
}

- (_PXUITextView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_PXUITextView;
  BOOL v3 = -[_PXUITextView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__handleTapGesture_];
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    [(UITapGestureRecognizer *)v3->_tapGestureRecognizer setDelegate:v3];
    [(_PXUITextView *)v3 addGestureRecognizer:v3->_tapGestureRecognizer];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    keyCommands = v3->_keyCommands;
    v3->_keyCommands = (NSMutableArray *)v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F38E40]);
    [v8 setDelegate:v3];
    [(_PXUITextView *)v3 addInteraction:v8];
  }
  return v3;
}

@end