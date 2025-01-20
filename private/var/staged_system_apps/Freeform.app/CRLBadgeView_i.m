@interface CRLBadgeView_i
- (CRLBadgeView_i)initWithFrame:(CGRect)a3;
- (NSString)finalImageName;
- (NSString)legacyImageName;
- (UIImageView)imageView;
- (id)tintColorForSystemImageNamed:(id)a3;
- (void)setFinalImageName:(id)a3;
- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4;
- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4 accessibilityName:(id)a5;
- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4 accessibilityName:(id)a5 scalesImageToFit:(BOOL)a6;
- (void)setImageView:(id)a3;
- (void)setLegacyImageName:(id)a3;
@end

@implementation CRLBadgeView_i

- (CRLBadgeView_i)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLBadgeView_i;
  v7 = -[CRLBadgeView_i initWithFrame:](&v13, "initWithFrame:");
  if (v7)
  {
    v8 = +[UIColor clearColor];
    [(CRLBadgeView_i *)v7 setBackgroundColor:v8];

    v9 = [objc_alloc((Class)UIImageView) initWithFrame:x, y, width, height];
    imageView = v7->_imageView;
    v7->_imageView = v9;

    v11 = [(CRLBadgeView_i *)v7 imageView];
    [(CRLBadgeView_i *)v7 addSubview:v11];
  }
  return v7;
}

- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4
{
}

- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4 accessibilityName:(id)a5
{
}

- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4 accessibilityName:(id)a5 scalesImageToFit:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE6A0);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BA1FC(v13, v14);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FE6C0);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v15, v13);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBadgeView_i setFinalImageWithName:legacyName:accessibilityName:scalesImageToFit:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/StatusHUDs/CRLBadgeView_i.m"];
  }
  id v18 = [v11 copy];
  [(CRLBadgeView_i *)self setLegacyImageName:v18];

  id v19 = [v10 copy];
  [(CRLBadgeView_i *)self setFinalImageName:v19];

  v20 = [(CRLBadgeView_i *)self finalImageName];

  if (v20)
  {
    v21 = [(CRLBadgeView_i *)self finalImageName];
    v22 = +[UIImage imageNamed:v21];

    if (v22) {
      goto LABEL_16;
    }
    v23 = [(CRLBadgeView_i *)self finalImageName];
    v22 = +[UIImage systemImageNamed:v23];
  }
  else
  {
    v23 = +[NSBundle mainBundle];
    v24 = [v23 infoDictionary];
    v25 = [v24 objectForKeyedSubscript:@"CFBundleIcons"];
    [v25 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
    id v41 = v12;
    id v26 = v11;
    v28 = id v27 = v10;
    v29 = [v28 objectForKeyedSubscript:@"CFBundleIconFiles"];
    v30 = [v29 lastObject];
    v22 = +[UIImage imageNamed:v30];

    id v10 = v27;
    id v11 = v26;
    id v12 = v41;
  }
LABEL_16:
  v31 = [(CRLBadgeView_i *)self imageView];
  [v31 setImage:v22];

  v32 = [(CRLBadgeView_i *)self imageView];
  [v32 setContentMode:4];

  v33 = [(CRLBadgeView_i *)self finalImageName];

  if (v33)
  {
    v34 = [(CRLBadgeView_i *)self finalImageName];
    v35 = [(CRLBadgeView_i *)self tintColorForSystemImageNamed:v34];
    v36 = [(CRLBadgeView_i *)self imageView];
    [v36 setTintColor:v35];
  }
  else
  {
    v37 = [(CRLBadgeView_i *)self imageView];
    [v37 setContentMode:1];

    v38 = [(CRLBadgeView_i *)self imageView];
    v39 = [v38 layer];
    [v39 setCornerRadius:4.86];

    v34 = [(CRLBadgeView_i *)self imageView];
    v35 = [v34 layer];
    [v35 setMasksToBounds:1];
  }

  v40 = [(CRLBadgeView_i *)self imageView];
  [v40 setAccessibilityLabel:v12];

  [(CRLBadgeView_i *)self setNeedsDisplay];
}

- (id)tintColorForSystemImageNamed:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"exclamationmark.circle"])
  {
    uint64_t v4 = +[UIColor systemRedColor];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"checkmark.circle"])
  {
    uint64_t v4 = +[UIColor systemGreenColor];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSString)legacyImageName
{
  return self->_legacyImageName;
}

- (void)setLegacyImageName:(id)a3
{
}

- (NSString)finalImageName
{
  return self->_finalImageName;
}

- (void)setFinalImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalImageName, 0);
  objc_storeStrong((id *)&self->_legacyImageName, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end