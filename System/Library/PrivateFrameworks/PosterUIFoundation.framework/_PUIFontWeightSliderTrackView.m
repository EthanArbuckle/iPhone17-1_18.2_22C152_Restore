@interface _PUIFontWeightSliderTrackView
- (UIColor)trackBackgroundColor;
- (_PUIFontWeightSliderTrackView)initWithTrackBackgroundColor:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation _PUIFontWeightSliderTrackView

- (_PUIFontWeightSliderTrackView)initWithTrackBackgroundColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PUIFontWeightSliderTrackView;
  v6 = -[_PUIFontWeightSliderTrackView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trackBackgroundColor, a3);
    [(_PUIFontWeightSliderTrackView *)v7 setOpaque:0];
    [(_PUIFontWeightSliderTrackView *)v7 setContentMode:3];
  }

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)_PUIFontWeightSliderTrackView;
  -[_PUIFontWeightSliderTrackView drawRect:](&v29, sel_drawRect_);
  v8 = (id *)MEMORY[0x263F1D020];
  uint64_t v9 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  CGFloat v10 = x;
  CGFloat v11 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  if (v9 == 1)
  {
    double v27 = CGRectGetMaxX(*(CGRect *)&v10) + -2.0;
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    double v28 = CGRectGetMaxX(v31) + -2.0;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double v26 = CGRectGetMidY(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v24 = CGRectGetMaxX(v33) + -2.0;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v14 = CGRectGetMidY(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double v15 = 7.0;
    double v16 = CGRectGetMinX(v35) + 7.0;
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double v17 = CGRectGetMidY(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v37);
  }
  else
  {
    double v27 = CGRectGetMinX(*(CGRect *)&v10) + 2.0;
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    double v28 = CGRectGetMinX(v39) + 2.0;
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v26 = CGRectGetMidY(v40);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    double v24 = CGRectGetMinX(v41) + 2.0;
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    double v14 = CGRectGetMidY(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double v15 = -7.0;
    double v16 = CGRectGetMaxX(v43) + -7.0;
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double v17 = CGRectGetMidY(v44);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double MinX = CGRectGetMaxX(v45);
  }
  double v19 = MinX + v15;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v20 = CGRectGetMidY(v46);
  id v21 = objc_alloc_init(MEMORY[0x263F1C478]);
  objc_msgSend(v21, "moveToPoint:", v27, MidY + -2.0);
  objc_msgSend(v21, "addLineToPoint:", v16, v17 + -7.0);
  BOOL v22 = [*v8 userInterfaceLayoutDirection] != 1;
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v22, v19, v20, 7.0, 4.71238898, 1.57079633);
  objc_msgSend(v21, "addLineToPoint:", v24, v14 + 2.0);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v22, v28, v26, 2.0, 1.57079633, 4.71238898);
  v23 = [(_PUIFontWeightSliderTrackView *)self trackBackgroundColor];
  [v23 setFill];

  [v21 fill];
}

- (UIColor)trackBackgroundColor
{
  return self->_trackBackgroundColor;
}

- (void).cxx_destruct
{
}

@end