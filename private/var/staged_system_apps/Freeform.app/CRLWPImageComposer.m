@interface CRLWPImageComposer
- (CRLImage)baseImage;
- (CRLImage)compositedImage;
- (CRLWPImageComposer)initWithBaseImage:(id)a3 screenScale:(double)a4;
- (double)screenScale;
- (id)overlayImage:(id)a3 usingFrame:(CGRect)a4;
- (void)setBaseImage:(id)a3;
- (void)setCompositedImage:(id)a3;
- (void)setScreenScale:(double)a3;
@end

@implementation CRLWPImageComposer

- (CRLWPImageComposer)initWithBaseImage:(id)a3 screenScale:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPImageComposer;
  v7 = [(CRLWPImageComposer *)&v11 init];
  if (v7)
  {
    [v6 scale];
    if (v8 != a4)
    {
      uint64_t v9 = +[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", [v6 CGImageForContentsScale:a4]);

      id v6 = (id)v9;
    }
    objc_storeStrong((id *)&v7->_baseImage, v6);
    objc_storeStrong((id *)&v7->_compositedImage, v6);
    v7->_screenScale = a4;
  }

  return v7;
}

- (id)overlayImage:(id)a3 usingFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (sub_100065AF4(x, y, width, height))
  {
    [v9 scale];
    double v11 = v10;
    [(CRLWPImageComposer *)self screenScale];
    if (v11 != v12)
    {
      [(CRLWPImageComposer *)self screenScale];
      uint64_t v13 = +[CRLImage imageWithCGImage:[v9 CGImageForContentsScale:]];

      id v9 = (id)v13;
    }
    v14 = [(CRLWPImageComposer *)self compositedImage];
    [v14 size];
    double v15 = sub_100064070();
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v22 = [(CRLWPImageComposer *)self compositedImage];
    [v22 scale];
    double v24 = sub_1000652FC(v15, v17, v19, v21, v23);
    CGFloat v53 = v25;
    CGFloat v54 = v24;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    v31 = [(CRLWPImageComposer *)self compositedImage];
    [v31 scale];
    double v33 = sub_1000652FC(x, y, width, height, v32);
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    double v40 = sub_100064F28(v24, v26, v28, v30, v33, v35, v37, v39);
    double v42 = v41;
    v45 = sub_100455AA8(3, v43, v44);
    CGContextTranslateCTM(v45, -v40, -v42);
    v46 = [(CRLWPImageComposer *)self compositedImage];
    v47 = (CGImage *)[v46 CGImage];
    v56.origin.CGFloat y = v53;
    v56.origin.double x = v54;
    v56.size.CGFloat width = v28;
    v56.size.CGFloat height = v30;
    CGContextDrawImage(v45, v56, v47);

    [(CRLWPImageComposer *)self screenScale];
    v48 = [v9 CGImageForContentsScale:];
    v57.origin.double x = v33;
    v57.origin.CGFloat y = v35;
    v57.size.CGFloat width = v37;
    v57.size.CGFloat height = v39;
    CGContextDrawImage(v45, v57, v48);
    Image = CGBitmapContextCreateImage(v45);
    CGContextRelease(v45);
    [(CRLWPImageComposer *)self screenScale];
    v50 = +[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", Image, 0);
    CGImageRelease(Image);
    [(CRLWPImageComposer *)self setCompositedImage:v50];
  }
  else
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014EE458);
    }
    v51 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG)) {
      sub_10109F25C(v51, x, y, width, height);
    }
    v50 = [(CRLWPImageComposer *)self compositedImage];
  }

  return v50;
}

- (CRLImage)compositedImage
{
  return self->_compositedImage;
}

- (void)setCompositedImage:(id)a3
{
}

- (CRLImage)baseImage
{
  return self->_baseImage;
}

- (void)setBaseImage:(id)a3
{
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImage, 0);

  objc_storeStrong((id *)&self->_compositedImage, 0);
}

@end