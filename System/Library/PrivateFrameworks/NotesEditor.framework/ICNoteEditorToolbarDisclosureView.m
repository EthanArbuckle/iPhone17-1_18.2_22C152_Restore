@interface ICNoteEditorToolbarDisclosureView
- (BOOL)closeState;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (ICNoteEditorToolbarDisclosureView)initWithFrame:(CGRect)a3;
- (ICNoteEditorToolbarPlusView)openView;
- (UIColor)itemColor;
- (UIImageView)closeImageView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setCloseImageView:(id)a3;
- (void)setCloseState:(BOOL)a3;
- (void)setOpenView:(id)a3;
@end

@implementation ICNoteEditorToolbarDisclosureView

- (ICNoteEditorToolbarDisclosureView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)ICNoteEditorToolbarDisclosureView;
  v3 = -[ICNoteEditorToolbarDisclosureView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[ICNoteEditorToolbarPlusView initWithFrame:]([ICNoteEditorToolbarPlusView alloc], "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    [(ICNoteEditorToolbarDisclosureView *)v3 setOpenView:v4];

    v5 = [(ICNoteEditorToolbarDisclosureView *)v3 openView];
    v6 = [v5 layer];
    [v6 setShadowRadius:12.0];

    v7 = [(ICNoteEditorToolbarDisclosureView *)v3 openView];
    v8 = [v7 layer];
    objc_msgSend(v8, "setShadowOffset:", 0.0, 4.0);

    v9 = [(ICNoteEditorToolbarDisclosureView *)v3 openView];
    v10 = [v9 layer];
    LODWORD(v11) = 1036831949;
    [v10 setShadowOpacity:v11];

    id v12 = [MEMORY[0x263F825C8] blackColor];
    uint64_t v13 = [v12 CGColor];
    v14 = [(ICNoteEditorToolbarDisclosureView *)v3 openView];
    v15 = [v14 layer];
    [v15 setShadowColor:v13];

    v16 = [(ICNoteEditorToolbarDisclosureView *)v3 openView];
    [(ICNoteEditorToolbarDisclosureView *)v3 addSubview:v16];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    [(ICNoteEditorToolbarDisclosureView *)v3 setCloseImageView:v17];

    v18 = objc_msgSend(MEMORY[0x263F827E8], "ic_largeSystemImageNamed:", @"xmark");
    v19 = [(ICNoteEditorToolbarDisclosureView *)v3 closeImageView];
    [v19 setImage:v18];

    v20 = [(ICNoteEditorToolbarDisclosureView *)v3 closeImageView];
    [v20 setContentMode:4];

    v21 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    v22 = [(ICNoteEditorToolbarDisclosureView *)v3 closeImageView];
    [v22 setTintColor:v21];

    v23 = [(ICNoteEditorToolbarDisclosureView *)v3 closeImageView];
    [v23 setAlpha:0.0];

    CGAffineTransformMakeRotation(&v28, 0.785398163);
    v24 = [(ICNoteEditorToolbarDisclosureView *)v3 closeImageView];
    CGAffineTransform v27 = v28;
    [v24 setTransform:&v27];

    v25 = [(ICNoteEditorToolbarDisclosureView *)v3 closeImageView];
    [(ICNoteEditorToolbarDisclosureView *)v3 addSubview:v25];
  }
  return v3;
}

- (UIImageView)closeImageView
{
  return self->_closeImageView;
}

- (ICNoteEditorToolbarPlusView)openView
{
  return self->_openView;
}

- (void)setOpenView:(id)a3
{
}

- (void)setCloseImageView:(id)a3
{
}

- (BOOL)closeState
{
  return self->_closeState;
}

- (UIColor)itemColor
{
  return (UIColor *)[MEMORY[0x263F825C8] labelColor];
}

- (id)accessibilityLabel
{
  BOOL v2 = [(ICNoteEditorToolbarDisclosureView *)self closeState];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = v3;
  if (v2) {
    v5 = @"Hide toolbar";
  }
  else {
    v5 = @"Show toolbar";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_26C10E100 table:0];

  return v6;
}

- (id)accessibilityHint
{
  BOOL v2 = [(ICNoteEditorToolbarDisclosureView *)self closeState];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = v3;
  if (v2) {
    v5 = @"Double tap to hide the editing toolbar.";
  }
  else {
    v5 = @"Double tap to show the editing toolbar.";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_26C10E100 table:0];

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorToolbarDisclosureView;
  return *MEMORY[0x263F83260] | [(ICNoteEditorToolbarDisclosureView *)&v3 accessibilityTraits];
}

- (void)setCloseState:(BOOL)a3
{
  if (self->_closeState != a3)
  {
    self->_closeState = a3;
    objc_super v3 = (void *)MEMORY[0x263F82E00];
    if (a3)
    {
      v4 = v8;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v5 = __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke;
    }
    else
    {
      v4 = &v6;
      uint64_t v6 = MEMORY[0x263EF8330];
      uint64_t v7 = 3221225472;
      v5 = __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke_2;
    }
    v4[2] = (uint64_t)v5;
    v4[3] = (uint64_t)&unk_2640B9320;
    v4[4] = (uint64_t)self;
    *((unsigned char *)v4 + 40) = a3;
    objc_msgSend(v3, "animateWithDuration:animations:", v4, 0.25, v6, v7);
  }
}

void __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  objc_super v3 = [*(id *)(a1 + 32) openView];
  [v3 setCloseState:v2];

  CGAffineTransformMakeRotation(&v12, -0.785398163);
  v4 = [*(id *)(a1 + 32) openView];
  CGAffineTransform v11 = v12;
  [v4 setTransform:&v11];

  v5 = [*(id *)(a1 + 32) openView];
  uint64_t v6 = [v5 layer];
  [v6 setShadowOpacity:0.0];

  uint64_t v7 = [*(id *)(a1 + 32) closeImageView];
  [v7 setAlpha:1.0];

  CGAffineTransformMakeRotation(&v10, 0.0);
  v8 = [*(id *)(a1 + 32) closeImageView];
  CGAffineTransform v9 = v10;
  [v8 setTransform:&v9];
}

void __51__ICNoteEditorToolbarDisclosureView_setCloseState___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  objc_super v3 = [*(id *)(a1 + 32) openView];
  [v3 setCloseState:v2];

  v4 = [*(id *)(a1 + 32) openView];
  v5 = [v4 layer];
  LODWORD(v6) = 1036831949;
  [v5 setShadowOpacity:v6];

  uint64_t v7 = [*(id *)(a1 + 32) openView];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v13[0] = *MEMORY[0x263F000D0];
  v13[1] = v8;
  v13[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v7 setTransform:v13];

  CGAffineTransform v9 = [*(id *)(a1 + 32) closeImageView];
  [v9 setAlpha:0.0];

  CGAffineTransformMakeRotation(&v12, 0.785398163);
  CGAffineTransform v10 = [*(id *)(a1 + 32) closeImageView];
  CGAffineTransform v11 = v12;
  [v10 setTransform:&v11];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(ICNoteEditorToolbarDisclosureView *)self bounds];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeImageView, 0);

  objc_storeStrong((id *)&self->_openView, 0);
}

@end