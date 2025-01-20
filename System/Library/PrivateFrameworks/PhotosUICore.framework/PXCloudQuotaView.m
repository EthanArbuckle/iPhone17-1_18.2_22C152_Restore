@interface PXCloudQuotaView
- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)contentViewSizeForWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXCloudQuotaView)initWithContentView:(id)a3;
- (UIView)contentView;
- (id)contentViewFont;
- (int64_t)offerLevel;
- (void)layoutSubviews;
- (void)setOfferLevel:(int64_t)a3;
@end

@implementation PXCloudQuotaView

- (void).cxx_destruct
{
}

- (void)setOfferLevel:(int64_t)a3
{
  self->_offerLevel = a3;
}

- (int64_t)offerLevel
{
  return self->_offerLevel;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXCloudQuotaView.m", 93, @"Method %s is a responsibility of subclass %@", "-[PXCloudQuotaView contentViewSizeForWidth:]", v7 object file lineNumber description];

  abort();
}

- (id)contentViewFont
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXCloudQuotaView.m", 89, @"Method %s is a responsibility of subclass %@", "-[PXCloudQuotaView contentViewFont]", v6 object file lineNumber description];

  abort();
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  v7 = [(PXCloudQuotaView *)self contentViewFont];
  [(PXCloudQuotaView *)self contentViewSizeForWidth:a3];
  UICeilToViewScale();
  double v9 = v8;
  [v7 ascender];
  UICeilToViewScale();
  CGFloat v11 = v10;
  if (a4) {
    -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, v10, a3, v9);
  }
  v17.origin.x = 0.0;
  v17.origin.y = v11;
  v17.size.width = a3;
  v17.size.height = v9;
  CGRectGetMaxY(v17);
  [v7 descender];
  UICeilToViewScale();
  double v13 = v12;

  double v14 = a3;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCloudQuotaView;
  [(PXCloudQuotaView *)&v4 layoutSubviews];
  [(PXCloudQuotaView *)self bounds];
  [(PXCloudQuotaView *)self _performLayoutInWidth:1 updateSubviewFrames:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXCloudQuotaView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PXCloudQuotaView)initWithContentView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCloudQuotaView.m", 40, @"Invalid parameter not satisfying: %@", @"contentView" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXCloudQuotaView;
  v7 = -[PXCloudQuotaView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentView, a3);
    [(PXCloudQuotaView *)v8 addSubview:v6];
  }

  return v8;
}

@end