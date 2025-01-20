@interface NTKRoundedCornerOverlayView
- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 forDevice:(id)a4 cornerRadius:(double)a5;
- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 forDeviceCornerRadius:(id)a4;
- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 screenScale:(double)a4 cornerRadius:(double)a5;
- (void)layoutSubviews;
@end

@implementation NTKRoundedCornerOverlayView

- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 screenScale:(double)a4 cornerRadius:(double)a5
{
  v39.receiver = self;
  v39.super_class = (Class)NTKRoundedCornerOverlayView;
  v7 = -[NTKRoundedCornerOverlayView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_cornerRadius = a5;
    v7->_screenScale = a4;
    v9 = (void *)[MEMORY[0x1E4FB1818] newImageForScreenCorner:1 screenScale:a4 cornerRadius:a5];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    upperLeftCorner = v8->_upperLeftCorner;
    v8->_upperLeftCorner = (UIImageView *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    v13 = (void *)MEMORY[0x1E4FB1818];
    id v14 = v9;
    uint64_t v15 = [v14 CGImage];
    [v14 scale];
    v16 = objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v15, 3);
    uint64_t v17 = [v12 initWithImage:v16];
    upperRightCorner = v8->_upperRightCorner;
    v8->_upperRightCorner = (UIImageView *)v17;

    id v19 = objc_alloc(MEMORY[0x1E4FB1838]);
    v20 = (void *)MEMORY[0x1E4FB1818];
    id v21 = v14;
    uint64_t v22 = [v21 CGImage];
    [v21 scale];
    v23 = objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v22, 2);
    uint64_t v24 = [v19 initWithImage:v23];
    bottomLeftCorner = v8->_bottomLeftCorner;
    v8->_bottomLeftCorner = (UIImageView *)v24;

    id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
    v27 = (void *)MEMORY[0x1E4FB1818];
    id v28 = v21;
    uint64_t v29 = [v28 CGImage];
    [v28 scale];
    v30 = objc_msgSend(v27, "imageWithCGImage:scale:orientation:", v29, 1);
    uint64_t v31 = [v26 initWithImage:v30];
    bottomRightCorner = v8->_bottomRightCorner;
    v8->_bottomRightCorner = (UIImageView *)v31;

    v33 = [(UIImageView *)v8->_upperLeftCorner layer];
    [v33 setAllowsEdgeAntialiasing:0];

    v34 = [(UIImageView *)v8->_upperRightCorner layer];
    [v34 setAllowsEdgeAntialiasing:0];

    v35 = [(UIImageView *)v8->_bottomLeftCorner layer];
    [v35 setAllowsEdgeAntialiasing:0];

    v36 = [(UIImageView *)v8->_bottomRightCorner layer];
    [v36 setAllowsEdgeAntialiasing:0];

    [(NTKRoundedCornerOverlayView *)v8 addSubview:v8->_upperRightCorner];
    [(NTKRoundedCornerOverlayView *)v8 addSubview:v8->_upperLeftCorner];
    [(NTKRoundedCornerOverlayView *)v8 addSubview:v8->_bottomLeftCorner];
    [(NTKRoundedCornerOverlayView *)v8 addSubview:v8->_bottomRightCorner];
    [(NTKRoundedCornerOverlayView *)v8 setUserInteractionEnabled:0];
    v37 = [(NTKRoundedCornerOverlayView *)v8 layer];
    [v37 setAllowsHitTesting:0];
  }
  return v8;
}

- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 forDeviceCornerRadius:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [v9 screenCornerRadius];
  v11 = -[NTKRoundedCornerOverlayView initWithFrame:forDevice:cornerRadius:](self, "initWithFrame:forDevice:cornerRadius:", v9, x, y, width, height, v10);

  return v11;
}

- (NTKRoundedCornerOverlayView)initWithFrame:(CGRect)a3 forDevice:(id)a4 cornerRadius:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [a4 screenScale];
  return -[NTKRoundedCornerOverlayView initWithFrame:screenScale:cornerRadius:](self, "initWithFrame:screenScale:cornerRadius:", x, y, width, height, v11, a5);
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRoundedCornerOverlayView;
  [(NTKRoundedCornerOverlayView *)&v14 layoutSubviews];
  [(NTKRoundedCornerOverlayView *)self bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  double v7 = ceil(self->_cornerRadius * 1.528665 * self->_screenScale) / self->_screenScale;
  CGFloat v8 = CGRectGetMinX(v15) + -0.5;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v9 = CGRectGetMinY(v16) + -0.5;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_upperLeftCorner, "ntk_setBoundsAndPositionFromFrame:", v8, v9, v7 + 0.5, v7 + 0.5);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat v10 = CGRectGetWidth(v17);
  CGFloat v11 = v10 - v7;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_upperRightCorner, "ntk_setBoundsAndPositionFromFrame:", v10 - v7, v9, v7 + 0.5, v7 + 0.5);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v18);
  CGFloat v13 = MaxY - v7;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_bottomRightCorner, "ntk_setBoundsAndPositionFromFrame:", v11, MaxY - v7, v7 + 0.5, v7 + 0.5);
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_bottomLeftCorner, "ntk_setBoundsAndPositionFromFrame:", -0.5, v13, v7 + 0.5, v7 + 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRightCorner, 0);
  objc_storeStrong((id *)&self->_bottomLeftCorner, 0);
  objc_storeStrong((id *)&self->_upperRightCorner, 0);
  objc_storeStrong((id *)&self->_upperLeftCorner, 0);
}

@end