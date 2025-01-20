@interface NTKUpNextPhotoCell
- (id)transitionContextInView:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)configureWithContent:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKUpNextPhotoCell

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NTKUpNextPhotoCell;
  [(NTKUpNextBaseCell *)&v29 configureWithContent:v4];
  v5 = [v4 overrideBodyImage];
  [v5 size];
  self->_aspectRatio = v6 / v7;
  v8 = [(NTKUpNextBaseCell *)self device];
  [v8 screenBounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  CGFloat v17 = v10;
  CGFloat v18 = v12;
  CGFloat v19 = v14;
  CGFloat v20 = v16;
  if (self->_aspectRatio <= 1.0)
  {
    double Width = CGRectGetWidth(*(CGRect *)&v17);
    v31.origin.x = v10;
    v31.origin.y = v12;
    v31.size.width = v14;
    v31.size.height = v16;
    double Height = CGRectGetWidth(v31) / self->_aspectRatio;
  }
  else
  {
    double Width = CGRectGetHeight(*(CGRect *)&v17) * self->_aspectRatio;
    v30.origin.x = v10;
    v30.origin.y = v12;
    v30.size.width = v14;
    v30.size.height = v16;
    double Height = CGRectGetHeight(v30);
  }
  self->_wantsFullCellPhoto = 0;
  v23 = [v4 objectForKey:@"NTKUpNextWantsFullScreenPhotoContent"];
  if (v23)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_wantsFullCellPhoto = [v23 BOOLValue];
    }
  }
  self->_scaledImageSize.width = Width;
  self->_scaledImageSize.height = Height;
  [v4 imageFocusRect];
  self->_facesRect.origin.x = v24;
  self->_facesRect.origin.y = v25;
  self->_facesRect.size.width = v26;
  self->_facesRect.size.height = v27;
  v28 = [v4 overrideBodyImage];
  [(NTKUpNextBaseCell *)self setOverrideContentImage:v28];

  [(NTKUpNextPhotoCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)NTKUpNextPhotoCell;
  [(NTKUpNextBaseCell *)&v33 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  if (self->_wantsFullCellPhoto)
  {
    double y = 0.0;
    double v4 = 1.0;
    double v5 = 1.0;
    double v6 = 0.0;
  }
  else
  {
    double v7 = [(NTKUpNextBaseCell *)self device];
    [v7 screenBounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    [(NTKUpNextPhotoCell *)self bounds];
    double Width = CGRectGetWidth(v34);
    double v17 = self->_scaledImageSize.width;
    v35.origin.CGFloat x = v9;
    v35.origin.double y = v11;
    v35.size.width = v13;
    v35.size.height = v15;
    double v18 = 0.0;
    BOOL v19 = CGRectGetWidth(v35) < v17;
    if (v19) {
      double v5 = Width / v17;
    }
    else {
      double v5 = 1.0;
    }
    if (v19) {
      double v6 = (1.0 - Width / v17) * 0.5;
    }
    else {
      double v6 = 0.0;
    }
    [(NTKUpNextPhotoCell *)self bounds];
    double Height = CGRectGetHeight(v36);
    double v21 = self->_scaledImageSize.height;
    p_facesRect = &self->_facesRect;
    if (CGRectIsNull(self->_facesRect))
    {
      double v4 = Height / v21;
      double y = v4 * -0.5 + 0.333333333;
    }
    else
    {
      v37.origin.CGFloat x = p_facesRect->origin.x;
      v37.origin.double y = self->_facesRect.origin.y;
      v37.size.width = self->_facesRect.size.width;
      v37.size.height = self->_facesRect.size.height;
      CGFloat v23 = CGRectGetWidth(v37) * -0.1;
      v38.origin.CGFloat x = p_facesRect->origin.x;
      v38.origin.double y = self->_facesRect.origin.y;
      v38.size.width = self->_facesRect.size.width;
      v38.size.height = self->_facesRect.size.height;
      CGFloat v24 = CGRectGetHeight(v38) * -0.1;
      v39.origin.CGFloat x = p_facesRect->origin.x;
      v39.origin.double y = self->_facesRect.origin.y;
      v39.size.width = self->_facesRect.size.width;
      v39.size.height = self->_facesRect.size.height;
      CGRect v40 = CGRectInset(v39, v23, v24);
      CGFloat x = v40.origin.x;
      double y = v40.origin.y;
      CGFloat v26 = v40.size.width;
      double v4 = v40.size.height;
      [(NTKUpNextPhotoCell *)self bounds];
      double v27 = CGRectGetWidth(v41);
      [(NTKUpNextPhotoCell *)self bounds];
      double v28 = v27 / CGRectGetHeight(v42);
      v43.origin.CGFloat x = x;
      v43.origin.double y = y;
      v43.size.width = v26;
      v43.size.height = v4;
      double v29 = CGRectGetHeight(v43) * v28 / self->_aspectRatio;
      v44.origin.CGFloat x = x;
      v44.origin.double y = y;
      v44.size.width = v26;
      v44.size.height = v4;
      double v30 = CGRectGetMidX(v44) + v29 * -0.5;
      v45.origin.CGFloat x = v30;
      v45.origin.double y = y;
      v45.size.width = v29;
      v45.size.height = v4;
      if (CGRectGetMinX(v45) >= 0.0)
      {
        v46.origin.CGFloat x = v30;
        v46.origin.double y = y;
        v46.size.width = v29;
        v46.size.height = v4;
        if (CGRectGetMaxX(v46) <= 1.0)
        {
          double v18 = v30;
        }
        else
        {
          v47.origin.CGFloat x = v30;
          v47.origin.double y = y;
          v47.size.width = v29;
          v47.size.height = v4;
          double v18 = v30 - (CGRectGetMaxX(v47) + -1.0);
        }
      }
      v48.origin.CGFloat x = v18;
      v48.origin.double y = y;
      v48.size.width = v29;
      v48.size.height = v4;
      double v5 = 1.0;
      if (CGRectGetMaxX(v48) <= 1.0
        && (v49.origin.x = v18, v49.origin.double y = y, v49.size.width = v29, v49.size.height = v4, CGRectGetMinX(v49) >= 0.0))
      {
        double v5 = v29;
        double v6 = v18;
      }
      else
      {
        double v6 = 0.0;
        v50.origin.CGFloat x = 0.0;
        v50.size.width = 1.0;
        v50.origin.double y = y;
        v50.size.height = v4;
        double MidY = CGRectGetMidY(v50);
        double v4 = self->_aspectRatio / v28;
        v51.origin.CGFloat x = 0.0;
        v51.size.width = 1.0;
        v51.origin.double y = y;
        v51.size.height = v4;
        double y = MidY + CGRectGetHeight(v51) * -0.5;
      }
    }
  }
  v32 = [(NTKUpNextBaseCell *)self imageLayer];
  objc_msgSend(v32, "setContentsRect:", v6, y, v5, v4);

  [MEMORY[0x1E4F39CF8] commit];
}

- (id)transitionContextInView:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextPhotoCell;
  [(NTKUpNextBaseCell *)&v4 prepareForReuse];
  v3 = [(NTKUpNextPhotoCell *)self layer];
  [v3 setFilters:0];
}

- (void)applyLayoutAttributes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextPhotoCell;
  [(NTKUpNextBaseCell *)&v3 applyLayoutAttributes:a3];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  if (fabs(a3) >= 0.00000011920929)
  {
    double v5 = [(NTKUpNextBaseCell *)self filterProvider];
    id v8 = [v5 filtersForView:self style:1 fraction:a3];

    double v6 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    double v7 = [(NTKUpNextPhotoCell *)self layer];
    [v7 setFilters:v8];
  }
  else
  {
    id v8 = [(NTKUpNextPhotoCell *)self layer];
    [v8 setFilters:0];
  }
  double v6 = v8;
LABEL_6:
}

- (void)updateMonochromeColor
{
  objc_super v3 = [(NTKUpNextBaseCell *)self filterProvider];
  id v5 = [v3 filtersForView:self style:1];

  if (v5)
  {
    objc_super v4 = [(NTKUpNextPhotoCell *)self layer];
    [v4 setFilters:v5];
  }
}

@end