@interface SFCapsuleCollectionViewBorrowedContentView
- (BOOL)resizesFromOriginalToolbarFrame;
- (SFCapsuleCollectionViewBorrowedContentView)initWithCoder:(id)a3;
- (SFCapsuleCollectionViewBorrowedContentView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setResizesFromOriginalToolbarFrame:(BOOL)a3;
@end

@implementation SFCapsuleCollectionViewBorrowedContentView

- (SFCapsuleCollectionViewBorrowedContentView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SFCapsuleCollectionViewBorrowedContentView;
  v3 = -[SFCapsuleCollectionViewBorrowedContentView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFCapsuleCollectionViewBorrowedContentView *)v3 setClipsToBounds:1];
    v5 = [(SFCapsuleCollectionViewBorrowedContentView *)v4 layer];
    [v5 setAllowsGroupOpacity:0];

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(SFCapsuleCollectionViewBorrowedContentView *)v4 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v7;

    [(SFCapsuleCollectionViewBorrowedContentView *)v4 addSubview:v4->_contentView];
    v9 = v4;
  }

  return v4;
}

- (SFCapsuleCollectionViewBorrowedContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Not implemented" userInfo:0];
  objc_exception_throw(v4);
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SFCapsuleCollectionViewBorrowedContentView;
  [(SFCapsuleCollectionViewBorrowedContentView *)&v12 layoutSubviews];
  [(UIView *)self->_contentView frame];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFCapsuleCollectionViewBorrowedContentView *)self bounds];
  double Height = CGRectGetHeight(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, Height - CGRectGetHeight(v14), v8, v10);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)resizesFromOriginalToolbarFrame
{
  return self->_resizesFromOriginalToolbarFrame;
}

- (void)setResizesFromOriginalToolbarFrame:(BOOL)a3
{
  self->_resizesFromOriginalToolbarFrame = a3;
}

- (void).cxx_destruct
{
}

@end