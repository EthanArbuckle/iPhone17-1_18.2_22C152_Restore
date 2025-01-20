@interface PXToastDefaultContentView
+ (void)configureBackgroundOfToastContentView:(id)a3;
- (PXToastDefaultContentView)initWithCoder:(id)a3;
- (PXToastDefaultContentView)initWithFrame:(CGRect)a3;
- (PXToastDefaultContentView)initWithToastConfiguration:(id)a3;
- (void)layoutSubviews;
@end

@implementation PXToastDefaultContentView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXToastDefaultContentView;
  [(PXToastDefaultContentView *)&v5 layoutSubviews];
  [(PXToastDefaultContentView *)self bounds];
  CGFloat v3 = CGRectGetHeight(v6) * 0.5;
  v4 = [(PXToastDefaultContentView *)self layer];
  [v4 setCornerRadius:v3];
}

- (PXToastDefaultContentView)initWithToastConfiguration:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXToastDefaultContentView;
  if (-[PXToastDefaultContentView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24)))
  {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyle();
  }

  return 0;
}

- (PXToastDefaultContentView)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXToastDefaultContentView.m", 23, @"%s is not available as initializer", "-[PXToastDefaultContentView initWithCoder:]");

  abort();
}

- (PXToastDefaultContentView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXToastDefaultContentView.m", 19, @"%s is not available as initializer", "-[PXToastDefaultContentView initWithFrame:]");

  abort();
}

+ (void)configureBackgroundOfToastContentView:(id)a3
{
  id v3 = a3;
  id v6 = [v3 layer];
  LODWORD(v4) = 1045220557;
  [v6 setShadowOpacity:v4];
  [v6 setShadowRadius:4.0];
  objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  id v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v5];
}

@end