@interface NTKCPhotoListCell
+ (id)reuseIdentifier;
- (CGRect)crop;
- (NTKCPhotoListCell)initWithFrame:(CGRect)a3;
- (UIImage)photo;
- (unint64_t)index;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCrop:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setPhoto:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation NTKCPhotoListCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCPhotoListCell)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)NTKCPhotoListCell;
  v3 = -[NTKCPhotoListCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    content = v3->_content;
    v3->_content = (UIView *)v4;

    [(UIView *)v3->_content setClipsToBounds:1];
    [(NTKCPhotoListCell *)v3 addSubview:v3->_content];
    uint64_t v6 = objc_opt_new();
    contentImageView = v3->_contentImageView;
    v3->_contentImageView = (UIImageView *)v6;

    [(UIView *)v3->_content addSubview:v3->_contentImageView];
    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKCPhotoListCell *)v3 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    selectionOverlayView = v3->_selectionOverlayView;
    v3->_selectionOverlayView = (UIView *)v9;

    [(UIView *)v3->_selectionOverlayView setUserInteractionEnabled:0];
    v11 = [MEMORY[0x1E4FB1618] labelColor];
    v12 = [v11 colorWithAlphaComponent:0.25];
    [(UIView *)v3->_selectionOverlayView setBackgroundColor:v12];

    [(NTKCPhotoListCell *)v3 addSubview:v3->_selectionOverlayView];
    [(UIView *)v3->_selectionOverlayView setHidden:1];
    v13 = NTKCImageNamed(@"BlueCheckSelected");
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
    selectionBadge = v3->_selectionBadge;
    v3->_selectionBadge = (UIImageView *)v14;

    [(UIView *)v3->_selectionOverlayView addSubview:v3->_selectionBadge];
    id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKCPhotoListCell *)v3 bounds];
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:");
    highlightOverlayView = v3->_highlightOverlayView;
    v3->_highlightOverlayView = (UIView *)v17;

    [(UIView *)v3->_highlightOverlayView setUserInteractionEnabled:0];
    v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v20 = [v19 colorWithAlphaComponent:0.5];
    [(UIView *)v3->_highlightOverlayView setBackgroundColor:v20];

    [(NTKCPhotoListCell *)v3 addSubview:v3->_highlightOverlayView];
    [(UIView *)v3->_highlightOverlayView setHidden:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)NTKCPhotoListCell;
  [(NTKCPhotoListCell *)&v33 layoutSubviews];
  [(NTKCPhotoListCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_content, "setFrame:");
  double v11 = 1.0;
  if (!CGRectIsEmpty(self->_crop))
  {
    v12 = [(UIImageView *)self->_contentImageView image];

    if (v12)
    {
      double width = self->_crop.size.width;
      double height = self->_crop.size.height;
      v34.origin.x = v4;
      v34.origin.y = v6;
      v34.size.double width = v8;
      v34.size.double height = v10;
      double v15 = CGRectGetWidth(v34);
      v35.origin.x = v4;
      v35.origin.y = v6;
      v35.size.double width = v8;
      v35.size.double height = v10;
      if (width / height <= v15 / CGRectGetHeight(v35)) {
        double v16 = width;
      }
      else {
        double v16 = height;
      }
      v36.origin.x = v4;
      v36.origin.y = v6;
      v36.size.double width = v8;
      v36.size.double height = v10;
      double v17 = CGRectGetWidth(v36) / v16;
      v37.origin.x = v4;
      v37.origin.y = v6;
      v37.size.double width = v8;
      v37.size.double height = v10;
      double v18 = CGRectGetHeight(v37) / v16;
      if (v17 >= v18) {
        double v11 = v18;
      }
      else {
        double v11 = v17;
      }
    }
  }
  CGAffineTransformMakeScale(&v32, v11, v11);
  contentImageView = self->_contentImageView;
  CGAffineTransform v31 = v32;
  [(UIImageView *)contentImageView setTransform:&v31];
  [(UIImageView *)self->_contentImageView frame];
  UIRectCenteredIntegralRectScale();
  [(UIImageView *)self->_contentImageView setFrame:0];
  -[UIView setFrame:](self->_highlightOverlayView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_selectionOverlayView, "setFrame:", v4, v6, v8, v10);
  [(UIImageView *)self->_selectionBadge frame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [(UIView *)self->_selectionOverlayView frame];
  double MaxX = CGRectGetMaxX(v38);
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.double width = v25;
  v39.size.double height = v27;
  CGFloat v29 = MaxX - CGRectGetWidth(v39);
  [(UIView *)self->_selectionOverlayView frame];
  double MaxY = CGRectGetMaxY(v40);
  v41.origin.x = v29;
  v41.origin.y = v23;
  v41.size.double width = v25;
  v41.size.double height = v27;
  -[UIImageView setFrame:](self->_selectionBadge, "setFrame:", v29, MaxY - CGRectGetHeight(v41), v25, v27);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTKCPhotoListCell *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCPhotoListCell;
    [(NTKCPhotoListCell *)&v5 setHighlighted:v3];
    [(UIView *)self->_highlightOverlayView setHidden:v3 ^ 1];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTKCPhotoListCell *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCPhotoListCell;
    [(NTKCPhotoListCell *)&v5 setSelected:v3];
    [(UIView *)self->_selectionOverlayView setHidden:v3 ^ 1];
  }
}

- (UIImage)photo
{
  return [(UIImageView *)self->_contentImageView image];
}

- (void)setPhoto:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIImageView *)self->_contentImageView image];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    contentImageView = self->_contentImageView;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v9[0] = *MEMORY[0x1E4F1DAB8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIImageView *)contentImageView setTransform:v9];
    [(UIImageView *)self->_contentImageView setImage:v4];
    [(UIImageView *)self->_contentImageView sizeToFit];
    [(NTKCPhotoListCell *)self setNeedsLayout];
  }
}

- (void)setCrop:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_crop = &self->_crop;
  if (!CGRectEqualToRect(a3, self->_crop))
  {
    p_crop->origin.CGFloat x = x;
    p_crop->origin.CGFloat y = y;
    p_crop->size.CGFloat width = width;
    p_crop->size.CGFloat height = height;
    [(NTKCPhotoListCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCPhotoListCell;
  [(NTKCPhotoListCell *)&v3 prepareForReuse];
  [(NTKCPhotoListCell *)self setIndex:-1];
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_indedouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_selectionBadge, 0);
  objc_storeStrong((id *)&self->_selectionOverlayView, 0);
}

@end