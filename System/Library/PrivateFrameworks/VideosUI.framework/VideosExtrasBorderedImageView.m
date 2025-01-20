@interface VideosExtrasBorderedImageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)shouldDeferSettingTransform;
- (BOOL)shouldSkipImageWhenReplicatingState;
- (BOOL)shouldUseTransformWhenReplicatingState;
- (CGAffineTransform)deferredTransform;
- (UIColor)borderColor;
- (double)borderWidth;
- (void)replicateStateFromImageView:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setDeferredTransform:(CGAffineTransform *)a3;
- (void)setShouldDeferSettingTransform:(BOOL)a3;
- (void)setShouldSkipImageWhenReplicatingState:(BOOL)a3;
- (void)setShouldUseTransformWhenReplicatingState:(BOOL)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation VideosExtrasBorderedImageView

- (void)setTransform:(CGAffineTransform *)a3
{
  if ([(VideosExtrasBorderedImageView *)self shouldDeferSettingTransform])
  {
    long long v5 = *(_OWORD *)&a3->c;
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = v5;
    long long v10 = *(_OWORD *)&a3->tx;
    [(VideosExtrasBorderedImageView *)self setDeferredTransform:&v8];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VideosExtrasBorderedImageView;
    long long v6 = *(_OWORD *)&a3->c;
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = v6;
    long long v10 = *(_OWORD *)&a3->tx;
    [(VideosExtrasBorderedImageView *)&v7 setTransform:&v8];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasBorderedImageView;
  if ([(VideosExtrasBorderedImageView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"borderColor"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"borderWidth"];
  }

  return v5;
}

- (UIColor)borderColor
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  v3 = [(VideosExtrasBorderedImageView *)self layer];
  id v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));

  return (UIColor *)v4;
}

- (void)setBorderColor:(id)a3
{
  id v4 = a3;
  id v7 = [(VideosExtrasBorderedImageView *)self layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setBorderColor:v6];
}

- (double)borderWidth
{
  v2 = [(VideosExtrasBorderedImageView *)self layer];
  [v2 borderWidth];
  double v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4 = [(VideosExtrasBorderedImageView *)self layer];
  [v4 setBorderWidth:a3];
}

- (void)replicateStateFromImageView:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasBorderedImageView *)self layer];
  uint64_t v6 = [v4 layer];
  if (![(VideosExtrasBorderedImageView *)self shouldSkipImageWhenReplicatingState])
  {
    id v7 = [v4 image];
    [(VideosExtrasBorderedImageView *)self setImage:v7];
  }
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "borderColor"));
  [v6 borderWidth];
  objc_msgSend(v5, "setBorderWidth:");
  [v4 bounds];
  -[VideosExtrasBorderedImageView convertRect:fromView:](self, "convertRect:fromView:", v4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(VideosExtrasBorderedImageView *)self superview];
  [v4 center];
  double v18 = v17;
  double v20 = v19;
  v21 = [v4 superview];
  objc_msgSend(v16, "convertPoint:fromView:", v21, v18, v20);
  double v23 = v22;
  double v25 = v24;

  if ([(VideosExtrasBorderedImageView *)self shouldUseTransformWhenReplicatingState])
  {
    [(VideosExtrasBorderedImageView *)self bounds];
    double v27 = v26;
    double v29 = v28;
    if (MPUFloatLessThanOrEqualToFloat()) {
      double v27 = 1.0;
    }
    if (MPUFloatLessThanOrEqualToFloat()) {
      double v30 = 1.0;
    }
    else {
      double v30 = v29;
    }
    memset(&v37, 0, sizeof(v37));
    CGAffineTransformMakeScale(&v37, v13 / v27, v15 / v30);
    [(VideosExtrasBorderedImageView *)self center];
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeTranslation(&v36, v23 - v31, v25 - v32);
    CGAffineTransform t1 = v37;
    memset(&v35, 0, sizeof(v35));
    CGAffineTransform v33 = v36;
    CGAffineTransformConcat(&v35, &t1, &v33);
    CGAffineTransform t1 = v35;
    [(VideosExtrasBorderedImageView *)self setTransform:&t1];
  }
  else
  {
    -[VideosExtrasBorderedImageView setBounds:](self, "setBounds:", v9, v11, v13, v15);
    -[VideosExtrasBorderedImageView setCenter:](self, "setCenter:", v23, v25);
  }
}

- (CGAffineTransform)deferredTransform
{
  long long v3 = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].c;
  return self;
}

- (void)setDeferredTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_deferredTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_deferredTransform.c = v4;
  *(_OWORD *)&self->_deferredTransform.tx = v3;
}

- (BOOL)shouldDeferSettingTransform
{
  return self->_shouldDeferSettingTransform;
}

- (void)setShouldDeferSettingTransform:(BOOL)a3
{
  self->_shouldDeferSettingTransform = a3;
}

- (BOOL)shouldUseTransformWhenReplicatingState
{
  return self->_shouldUseTransformWhenReplicatingState;
}

- (void)setShouldUseTransformWhenReplicatingState:(BOOL)a3
{
  self->_shouldUseTransformWhenReplicatingState = a3;
}

- (BOOL)shouldSkipImageWhenReplicatingState
{
  return self->_shouldSkipImageWhenReplicatingState;
}

- (void)setShouldSkipImageWhenReplicatingState:(BOOL)a3
{
  self->_shouldSkipImageWhenReplicatingState = a3;
}

@end