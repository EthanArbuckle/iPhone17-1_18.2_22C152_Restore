@interface TSDCheckableTableViewCell
- (BOOL)checked;
- (BOOL)showsCheckboxOnRight;
- (TSDCheckableTableViewCell)initWithReuseIdentifier:(id)a3 showsCheckboxOnRight:(BOOL)a4;
- (TSDCheckableTableViewCell)initWithReuseIdentifier:(id)a3 showsCheckboxOnRight:(BOOL)a4 style:(int64_t)a5;
- (id)imageForState:(unint64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkImage:(id)a3 forState:(unint64_t)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation TSDCheckableTableViewCell

- (TSDCheckableTableViewCell)initWithReuseIdentifier:(id)a3 showsCheckboxOnRight:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSDCheckableTableViewCell;
  v5 = [(TSDCheckableTableViewCell *)&v8 initWithStyle:0 reuseIdentifier:a3];
  v6 = v5;
  if (v5)
  {
    v5->mShowsCheckboxOnRight = a4;
    if (!a4)
    {
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v5, "imageView"), "setImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"TSD_TableViewCheckboxImage_N", TSDBundle(), 0), "imageWithRenderingMode:", 2));
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v6, "imageView"), "setHidden:", 1);
    }
  }
  return v6;
}

- (TSDCheckableTableViewCell)initWithReuseIdentifier:(id)a3 showsCheckboxOnRight:(BOOL)a4 style:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TSDCheckableTableViewCell;
  v6 = [(TSDCheckableTableViewCell *)&v9 initWithStyle:a5 reuseIdentifier:a3];
  v7 = v6;
  if (v6)
  {
    v6->mShowsCheckboxOnRight = a4;
    if (!a4)
    {
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v6, "imageView"), "setImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"TSD_TableViewCheckboxImage_N", TSDBundle(), 0), "imageWithRenderingMode:", 2));
      objc_msgSend((id)-[TSDCheckableTableViewCell imageView](v7, "imageView"), "setHidden:", 1);
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDCheckableTableViewCell;
  [(TSDCheckableTableViewCell *)&v3 dealloc];
}

- (void)setCheckmarkImage:(id)a3 forState:(unint64_t)a4
{
  if (self->mShowsCheckboxOnRight)
  {
    mCheckmarkImageView = self->mCheckmarkImageView;
    if (!mCheckmarkImageView)
    {
      mCheckmarkImageView = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:a3];
      self->mCheckmarkImageView = mCheckmarkImageView;
    }
  }
  else
  {
    mCheckmarkImageView = (UIImageView *)[(TSDCheckableTableViewCell *)self imageView];
  }
  if (a4 == 1)
  {
    [(UIImageView *)mCheckmarkImageView setHighlightedImage:a3];
  }
  else if (a4)
  {
    objc_super v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDCheckableTableViewCell setCheckmarkImage:forState:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCheckableTableViewCell.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:79 description:@"Setting checkmark image for unsupported state"];
  }
  else
  {
    [(UIImageView *)mCheckmarkImageView setImage:a3];
  }
}

- (id)imageForState:(unint64_t)a3
{
  return [(UIButton *)self->mImageButton imageForState:a3];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  mImageButton = self->mImageButton;
  if (!mImageButton)
  {
    objc_super v8 = (UIButton *)(id)[MEMORY[0x263F1C488] buttonWithType:0];
    self->mImageButton = v8;
    [(UIButton *)v8 setUserInteractionEnabled:0];
    [(UIButton *)self->mImageButton setClipsToBounds:1];
    [(UIButton *)self->mImageButton setContentHorizontalAlignment:1];
    objc_msgSend((id)-[TSDCheckableTableViewCell contentView](self, "contentView"), "addSubview:", self->mImageButton);
    mImageButton = self->mImageButton;
  }

  [(UIButton *)mImageButton setImage:a3 forState:a4];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TSDCheckableTableViewCell;
  [(TSDCheckableTableViewCell *)&v4 layoutSubviews];
  objc_msgSend((id)-[TSDCheckableTableViewCell contentView](self, "contentView"), "frame");
  double v3 = TSDRectWithSize();
  if (!self->mShowsCheckboxOnRight) {
    double v3 = v3 + 32.0;
  }
  [(UIButton *)self->mImageButton setFrame:v3];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  self->mChecked = a3;
  if (![(TSDCheckableTableViewCell *)self showsCheckboxOnRight])
  {
    BOOL v5 = !v3;
    v6 = (void *)[(TSDCheckableTableViewCell *)self imageView];
    goto LABEL_5;
  }
  if (self->mCheckmarkImageView)
  {
    -[TSDCheckableTableViewCell setAccessoryView:](self, "setAccessoryView:");
    BOOL v5 = !v3;
    v6 = (void *)[(TSDCheckableTableViewCell *)self accessoryView];
LABEL_5:
    [v6 setHidden:v5];
    return;
  }
  if (v3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }

  [(TSDCheckableTableViewCell *)self setAccessoryType:v7];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSDCheckableTableViewCell;
  -[TSDCheckableTableViewCell setHighlighted:animated:](&v13, sel_setHighlighted_animated_);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __53__TSDCheckableTableViewCell_setHighlighted_animated___block_invoke;
  uint64_t v10 = &unk_2646B1410;
  v11 = self;
  BOOL v12 = v5;
  if (v4)
  {
    [MEMORY[0x263F1CB60] animateWithDuration:&v7 animations:0.2];
  }
  else
  {
    -[UIButton setHighlighted:](self->mImageButton, "setHighlighted:", v5, v7, v8, v9, v10);
    [(UIImageView *)v11->mCheckmarkImageView setHighlighted:v12];
  }
}

uint64_t __53__TSDCheckableTableViewCell_setHighlighted_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1024);

  return [v3 setHighlighted:v2];
}

- (BOOL)showsCheckboxOnRight
{
  return self->mShowsCheckboxOnRight;
}

- (BOOL)checked
{
  return self->mChecked;
}

@end