@interface SUUICountdownFlapView
- (CATransform3D)_transformForAngle:(SEL)a3 isTop:(double)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)string;
- (SUUICountdownFlapView)initWithPosition:(int64_t)a3 flapTopColor:(id)a4 flapBottomColor:(id)a5;
- (UIColor)flapBottomColor;
- (UIColor)flapTopColor;
- (UIColor)textColor;
- (id)_newBackgroundImageForTop:(int)a3;
- (id)_newLabel;
- (int64_t)position;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setString:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SUUICountdownFlapView

- (SUUICountdownFlapView)initWithPosition:(int64_t)a3 flapTopColor:(id)a4 flapBottomColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SUUICountdownFlapView;
  v11 = [(SUUICountdownFlapView *)&v32 init];
  v12 = v11;
  if (v11)
  {
    v11->_factor = 0.0;
    v11->_position = a3;
    objc_storeStrong((id *)&v11->_flapTopColor, a4);
    objc_storeStrong((id *)&v12->_flapBottomColor, a5);
    uint64_t v13 = [(SUUICountdownFlapView *)v12 _newLabel];
    labelTop = v12->_labelTop;
    v12->_labelTop = (UILabel *)v13;

    v15 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    backgroundViewTop = v12->_backgroundViewTop;
    v12->_backgroundViewTop = v15;

    [(SUUICountdownFlapView *)v12 addSubview:v12->_backgroundViewTop];
    [(UIView *)v12->_backgroundViewTop addSubview:v12->_labelTop];
    [(UIView *)v12->_backgroundViewTop setClipsToBounds:1];
    uint64_t v17 = [(SUUICountdownFlapView *)v12 _newLabel];
    labelBot = v12->_labelBot;
    v12->_labelBot = (UILabel *)v17;

    v19 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    backgroundViewBot = v12->_backgroundViewBot;
    v12->_backgroundViewBot = v19;

    [(SUUICountdownFlapView *)v12 addSubview:v12->_backgroundViewBot];
    [(UIView *)v12->_backgroundViewBot addSubview:v12->_labelBot];
    [(UIView *)v12->_backgroundViewBot setClipsToBounds:1];
    uint64_t v21 = [(SUUICountdownFlapView *)v12 _newLabel];
    labelTransitionTop = v12->_labelTransitionTop;
    v12->_labelTransitionTop = (UILabel *)v21;

    v23 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    backgroundViewTransitionTop = v12->_backgroundViewTransitionTop;
    v12->_backgroundViewTransitionTop = v23;

    [(UIImageView *)v12->_backgroundViewTransitionTop addSubview:v12->_labelTransitionTop];
    [(UIImageView *)v12->_backgroundViewTransitionTop setHidden:1];
    [(UIImageView *)v12->_backgroundViewTransitionTop setClipsToBounds:1];
    v25 = [(UIImageView *)v12->_backgroundViewTransitionTop layer];
    [v25 setZPosition:100.0];

    [(SUUICountdownFlapView *)v12 addSubview:v12->_backgroundViewTransitionTop];
    uint64_t v26 = [(SUUICountdownFlapView *)v12 _newLabel];
    labelTransitionBot = v12->_labelTransitionBot;
    v12->_labelTransitionBot = (UILabel *)v26;

    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    backgroundViewTransitionBot = v12->_backgroundViewTransitionBot;
    v12->_backgroundViewTransitionBot = v28;

    [(UIImageView *)v12->_backgroundViewTransitionBot addSubview:v12->_labelTransitionBot];
    [(UIImageView *)v12->_backgroundViewTransitionBot setHidden:1];
    [(UIImageView *)v12->_backgroundViewTransitionBot setClipsToBounds:1];
    v30 = [(UIImageView *)v12->_backgroundViewTransitionBot layer];
    [v30 setZPosition:100.0];

    [(SUUICountdownFlapView *)v12 addSubview:v12->_backgroundViewTransitionBot];
  }

  return v12;
}

- (void)layoutSubviews
{
  [(SUUICountdownFlapView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  int64_t position = self->_position;
  if (!position)
  {
    double factor = self->_factor;
    float v15 = factor + factor;
    float v14 = roundf(v15);
    goto LABEL_5;
  }
  if (position == 2)
  {
    double factor = self->_factor;
    float v13 = factor + factor;
    float v14 = -roundf(v13);
LABEL_5:
    double v16 = v14;
    goto LABEL_7;
  }
  double factor = self->_factor;
  double v16 = 0.0;
LABEL_7:
  double v17 = v3 * 0.5;
  v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 scale];
  *(float *)&double v19 = factor * v19;
  double v20 = roundf(*(float *)&v19);
  uint64_t v21 = [MEMORY[0x263F82B60] mainScreen];
  [v21 scale];
  double v23 = v17 - v20 / v22;

  -[UIView setFrame:](self->_backgroundViewTop, "setFrame:", v5, v7, v9, v23);
  double v24 = v5 + v16;
  -[UILabel setFrame:](self->_labelTop, "setFrame:", v5 + v16, v7, v9, v10);
  double v25 = self->_factor;
  uint64_t v26 = [MEMORY[0x263F82B60] mainScreen];
  [v26 scale];
  *(float *)&double v27 = v25 * v27;
  double v28 = roundf(*(float *)&v27);
  v29 = [MEMORY[0x263F82B60] mainScreen];
  [v29 scale];
  double v31 = v17 - v28 / v30;

  double v32 = self->_factor;
  v33 = [MEMORY[0x263F82B60] mainScreen];
  [v33 scale];
  *(float *)&double v34 = v32 * v34;
  double v35 = roundf(*(float *)&v34);
  v36 = [MEMORY[0x263F82B60] mainScreen];
  [v36 scale];
  double v38 = v17 + v35 / v37;

  -[UIView setFrame:](self->_backgroundViewBot, "setFrame:", v5, v38, v9, v31);
  double v39 = self->_factor;
  v40 = [MEMORY[0x263F82B60] mainScreen];
  [v40 scale];
  *(float *)&double v41 = v39 * v41;
  double v42 = roundf(*(float *)&v41);
  v43 = [MEMORY[0x263F82B60] mainScreen];
  [v43 scale];
  double v45 = v7 - (v17 + v42 / v44);

  -[UILabel setFrame:](self->_labelBot, "setFrame:", v24, v45, v9, v10);
  double v46 = self->_factor;
  v47 = [MEMORY[0x263F82B60] mainScreen];
  [v47 scale];
  *(float *)&double v48 = v46 * v48;
  double v49 = roundf(*(float *)&v48);
  v50 = [MEMORY[0x263F82B60] mainScreen];
  [v50 scale];
  double v52 = v17 - v49 / v51;

  -[UIImageView setFrame:](self->_backgroundViewTransitionTop, "setFrame:", v5, v7, v9, v52);
  -[UILabel setFrame:](self->_labelTransitionTop, "setFrame:", v24, v7, v9, v10);
  double v53 = self->_factor;
  v54 = [MEMORY[0x263F82B60] mainScreen];
  [v54 scale];
  *(float *)&double v55 = v53 * v55;
  double v56 = roundf(*(float *)&v55);
  v57 = [MEMORY[0x263F82B60] mainScreen];
  [v57 scale];
  double v59 = v17 - v56 / v58;

  double v60 = self->_factor;
  v61 = [MEMORY[0x263F82B60] mainScreen];
  [v61 scale];
  *(float *)&double v62 = v60 * v62;
  double v63 = roundf(*(float *)&v62);
  v64 = [MEMORY[0x263F82B60] mainScreen];
  [v64 scale];
  double v66 = v17 + v63 / v65;

  -[UIImageView setFrame:](self->_backgroundViewTransitionBot, "setFrame:", v5, v66, v9, v59);
  double v67 = self->_factor;
  v68 = [MEMORY[0x263F82B60] mainScreen];
  [v68 scale];
  *(float *)&double v69 = v67 * v69;
  double v70 = roundf(*(float *)&v69);
  v71 = [MEMORY[0x263F82B60] mainScreen];
  [v71 scale];
  double v73 = v7 - (v17 + v70 / v72);

  labelTransitionBot = self->_labelTransitionBot;
  -[UILabel setFrame:](labelTransitionBot, "setFrame:", v24, v73, v9, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float width = a3.width;
  double v4 = roundf(width);
  int64_t position = self->_position;
  switch(position)
  {
    case 0:
      goto LABEL_4;
    case 3:
      double v6 = 4.0;
      goto LABEL_6;
    case 2:
LABEL_4:
      double v6 = 2.0;
LABEL_6:
      double v4 = v4 + v4 / 14.0 * v6;
      break;
  }
  float v7 = v4;
  double v8 = roundf(v7);
  float height = a3.height;
  double v10 = roundf(height);
  result.float height = v10;
  result.float width = v8;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double width = a3.size.width;
  uint64_t v28 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)SUUICountdownFlapView;
  -[SUUICountdownFlapView setFrame:](&v25, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double factor = self->_factor;
  int64_t position = self->_position;
  switch(position)
  {
    case 0:
      goto LABEL_4;
    case 3:
      double width = width * 14.0 / 18.0;
      break;
    case 2:
LABEL_4:
      double width = width * 14.0 * 0.0625;
      break;
  }
  self->_double factor = width / 14.0;
  if (width / 14.0 != factor && width / 14.0 != 0.0)
  {
    backgroundViewTransitionTop = self->_backgroundViewTransitionTop;
    id v8 = [(SUUICountdownFlapView *)self _newBackgroundImageForTop:1];
    [(UIImageView *)backgroundViewTransitionTop setImage:v8];

    backgroundViewTransitionBot = self->_backgroundViewTransitionBot;
    id v10 = [(SUUICountdownFlapView *)self _newBackgroundImageForTop:0];
    [(UIImageView *)backgroundViewTransitionBot setImage:v10];

    id v11 = [(SUUICountdownFlapView *)self _newBackgroundImageForTop:0xFFFFFFFFLL];
    [(SUUICountdownFlapView *)self setImage:v11];

    float v12 = self->_factor * 24.0;
    float v13 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:roundf(v12)];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    labelBot = self->_labelBot;
    v26[0] = self->_labelTop;
    v26[1] = labelBot;
    labelTransitionBot = self->_labelTransitionBot;
    v26[2] = self->_labelTransitionTop;
    v26[3] = labelTransitionBot;
    double v16 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 4, 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) setFont:v13];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v18);
    }

    [(SUUICountdownFlapView *)self setNeedsLayout];
  }
}

- (void)setString:(id)a3
{
  id v5 = a3;
  p_string = &self->_string;
  string = self->_string;
  if (!string)
  {
    objc_storeStrong((id *)&self->_string, a3);
    [(UILabel *)self->_labelTop setText:*p_string];
    [(UILabel *)self->_labelBot setText:*p_string];
    string = *p_string;
  }
  if (([v5 isEqualToString:string] & 1) == 0)
  {
    id v8 = *p_string;
    objc_storeStrong((id *)&self->_string, a3);
    double v9 = [(UIImageView *)self->_backgroundViewTransitionTop layer];
    [v9 removeAllAnimations];

    id v10 = [(UIImageView *)self->_backgroundViewTransitionBot layer];
    [v10 removeAllAnimations];

    [(UILabel *)self->_labelTop setText:*p_string];
    [(UILabel *)self->_labelBot setText:v8];
    [(UILabel *)self->_labelTransitionTop setText:v8];
    [(UILabel *)self->_labelTransitionBot setText:*p_string];
    [(UIImageView *)self->_backgroundViewTransitionTop setHidden:0];
    [(UIImageView *)self->_backgroundViewTransitionBot setHidden:1];
    id v11 = [MEMORY[0x263EFF980] array];
    float v12 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != 11; ++i)
    {
      float v14 = (void *)MEMORY[0x263F08D40];
      [(SUUICountdownFlapView *)self _transformForAngle:1 isTop:(float)((float)i / 10.0) * 3.14159265 * 0.5];
      float v15 = [v14 valueWithCATransform3D:v20];
      [v11 addObject:v15];

      *(float *)&double v16 = (float)i / 10.0;
      uint64_t v17 = [NSNumber numberWithFloat:v16];
      [v12 addObject:v17];
    }
    id v18 = objc_alloc_init(MEMORY[0x263F157D8]);
    [v18 setKeyPath:@"transform"];
    [v18 setValues:v11];
    [v18 setKeyTimes:v12];
    [v18 setRemovedOnCompletion:0];
    [v18 setFillMode:*MEMORY[0x263F15AB0]];
    [v18 setDuration:0.200000003];
    [v18 setDelegate:self];
    uint64_t v19 = [(UIImageView *)self->_backgroundViewTransitionTop layer];
    [v19 addAnimation:v18 forKey:@"top"];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_textColor = &self->_textColor;
  if (self->_textColor != v5)
  {
    float v15 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    labelTop = self->_labelTop;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_labelTop, "setTextColor:");
    }
    else
    {
      id v8 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)labelTop setTextColor:v8];
    }
    labelBot = self->_labelBot;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_labelBot, "setTextColor:");
    }
    else
    {
      id v10 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)labelBot setTextColor:v10];
    }
    labelTransitionTop = self->_labelTransitionTop;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_labelTransitionTop, "setTextColor:");
    }
    else
    {
      float v12 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)labelTransitionTop setTextColor:v12];
    }
    labelTransitionBot = self->_labelTransitionBot;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](labelTransitionBot, "setTextColor:");
    }
    else
    {
      float v14 = [MEMORY[0x263F825C8] whiteColor];
      [(UILabel *)labelTransitionBot setTextColor:v14];
    }
    id v5 = v15;
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  double v6 = [(UIImageView *)self->_backgroundViewTransitionTop layer];
  id v7 = [v6 animationForKey:@"top"];

  if (v7 == v5)
  {
    [(UIImageView *)self->_backgroundViewTransitionTop setHidden:1];
    [(UIImageView *)self->_backgroundViewTransitionBot setHidden:0];
    id v8 = [MEMORY[0x263EFF980] array];
    double v9 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != 11; ++i)
    {
      id v11 = (void *)MEMORY[0x263F08D40];
      [(SUUICountdownFlapView *)self _transformForAngle:0 isTop:(float)(1.0 - (float)((float)i / 10.0)) * 3.14159265 * 0.5];
      float v12 = [v11 valueWithCATransform3D:&v17];
      [v8 addObject:v12];

      *(float *)&double v13 = (float)i / 10.0;
      float v14 = [NSNumber numberWithFloat:v13];
      [v9 addObject:v14];
    }
    id v15 = objc_alloc_init(MEMORY[0x263F157D8]);
    [v15 setKeyPath:@"transform"];
    [v15 setValues:v8];
    [v15 setKeyTimes:v9];
    [v15 setRemovedOnCompletion:0];
    [v15 setFillMode:*MEMORY[0x263F15AB0]];
    [v15 setDuration:0.200000003];
    [v15 setDelegate:self];
    double v16 = [(UIImageView *)self->_backgroundViewTransitionBot layer];
    [v16 addAnimation:v15 forKey:@"bot"];
  }
  else
  {
    [(UILabel *)self->_labelBot setText:self->_string];
    [(UIImageView *)self->_backgroundViewTransitionTop setHidden:1];
    [(UIImageView *)self->_backgroundViewTransitionBot setHidden:1];
  }
}

- (id)_newLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v4 = v3;
  if (self->_textColor)
  {
    objc_msgSend(v3, "setTextColor:");
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] whiteColor];
    [v4 setTextColor:v5];
  }
  double v6 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v6];

  [v4 setTextAlignment:1];
  return v4;
}

- (id)_newBackgroundImageForTop:(int)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  [(SUUICountdownFlapView *)self frame];
  double v7 = v6;
  double v8 = v5;
  if (a3 == 1)
  {
    double factor = self->_factor;
    long long v24 = [MEMORY[0x263F82B60] mainScreen];
    [v24 scale];
    *(float *)&double v25 = factor * v25;
    double v26 = roundf(*(float *)&v25);
    double v27 = [MEMORY[0x263F82B60] mainScreen];
    [v27 scale];
    double v15 = v8 * 0.5 - v26 / v28;
  }
  else
  {
    if (!a3)
    {
      double v9 = self->_factor;
      id v10 = [MEMORY[0x263F82B60] mainScreen];
      [v10 scale];
      *(float *)&double v11 = v9 * v11;
      double v12 = roundf(*(float *)&v11);
      double v13 = [MEMORY[0x263F82B60] mainScreen];
      [v13 scale];
      double v15 = v8 * 0.5 - v12 / v14;

      double v16 = self->_factor;
      uint64_t v17 = [MEMORY[0x263F82B60] mainScreen];
      [v17 scale];
      *(float *)&double v18 = v16 * v18;
      double v19 = roundf(*(float *)&v18);
      double v20 = [MEMORY[0x263F82B60] mainScreen];
      [v20 scale];
      double v22 = v8 * -0.5 - v19 / v21;

      goto LABEL_7;
    }
    double v15 = v5;
  }
  double v22 = 0.0;
LABEL_7:
  v29 = [MEMORY[0x263F82B60] mainScreen];
  [v29 scale];
  CGFloat v31 = v30;
  v58.double width = v7;
  v58.float height = v15;
  UIGraphicsBeginImageContextWithOptions(v58, 0, v31);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7 * 0.5 + 0.0, v22);
  double v33 = v7 + 0.0;
  if ((self->_position & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    float v34 = self->_factor * 5.0;
    CGFloat v35 = roundf(v34);
    CGContextAddArc(CurrentContext, v33 - v35, v22 + v35, v35, 4.71238898, 6.28318531, 0);
    float v36 = self->_factor * 5.0;
    CGFloat v37 = roundf(v36);
    CGContextAddArc(CurrentContext, v33 - v37, v8 + v22 - v37, v37, 0.0, 1.57079633, 0);
  }
  else
  {
    CGContextAddLineToPoint(CurrentContext, v33, v22);
    CGContextAddLineToPoint(CurrentContext, v33, v8 + v22);
  }
  int64_t position = self->_position;
  if (position == 3 || position == 0)
  {
    float v40 = self->_factor * 5.0;
    CGFloat v41 = roundf(v40);
    CGContextAddArc(CurrentContext, v41 + 0.0, v8 + v22 - v41, v41, 1.57079633, 3.14159265, 0);
    float v42 = self->_factor * 5.0;
    CGFloat v43 = roundf(v42);
    CGContextAddArc(CurrentContext, v43 + 0.0, v22 + v43, v43, 3.14159265, 4.71238898, 0);
  }
  else
  {
    CGContextAddLineToPoint(CurrentContext, 0.0, v8 + v22);
    CGContextAddLineToPoint(CurrentContext, 0.0, v22);
  }
  CGContextClosePath(CurrentContext);
  CGContextClip(CurrentContext);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)locations = xmmword_2568A0CA0;
  flapTopColor = self->_flapTopColor;
  double v46 = flapTopColor;
  if (!flapTopColor)
  {
    double v46 = [MEMORY[0x263F825C8] blackColor];
  }
  CGColorRef v47 = CGColorRetain((CGColorRef)[v46 CGColor]);
  if (!flapTopColor) {

  }
  flapBottomColor = self->_flapBottomColor;
  double v49 = flapBottomColor;
  if (!flapBottomColor)
  {
    double v49 = [MEMORY[0x263F825C8] colorWithWhite:0.4 alpha:1.0];
  }
  CGColorRef v50 = CGColorRetain((CGColorRef)[v49 CGColor]);
  if (!flapBottomColor) {

  }
  v55[0] = v47;
  v55[1] = v50;
  CFArrayRef v51 = CFArrayCreate(0, v55, 2, MEMORY[0x263EFFF70]);
  double v52 = CGGradientCreateWithColors(DeviceRGB, v51, locations);
  v60.y = v8 + v22;
  v59.x = 0.0;
  v60.x = 0.0;
  v59.y = v22;
  CGContextDrawLinearGradient(CurrentContext, v52, v59, v60, 0);
  CGColorRelease(v47);
  CGColorRelease(v50);
  CGGradientRelease(v52);
  CFRelease(v51);
  CGColorSpaceRelease(DeviceRGB);
  double v53 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v53;
}

- (CATransform3D)_transformForAngle:(SEL)a3 isTop:(double)a4
{
  [(SUUICountdownFlapView *)self frame];
  double v10 = v9;
  double v12 = v11;
  if (a5)
  {
    double factor = self->_factor;
    double v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    *(float *)&double v15 = factor * v15;
    double v16 = roundf(*(float *)&v15);
    uint64_t v17 = [MEMORY[0x263F82B60] mainScreen];
    [v17 scale];
    double v19 = v12 * 0.25 - v16 / v18 * 0.25;
    double v20 = v10;
  }
  else
  {
    double v20 = v9 * 3.0;
    double v21 = self->_factor;
    double v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    *(float *)&double v22 = v21 * v22;
    double v23 = roundf(*(float *)&v22);
    uint64_t v17 = [MEMORY[0x263F82B60] mainScreen];
    [v17 scale];
    double v19 = v12 * 3.0 * 0.25 + v23 / v24 * 3.0 * 0.25;
  }

  double v25 = (long long *)MEMORY[0x263F15740];
  double v26 = v20 * 0.25;
  double v27 = v12 * 0.5;
  long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  double v30 = v10 * 0.5;
  *(_OWORD *)&retstr->m31 = v28;
  *(_OWORD *)&retstr->m33 = v29;
  long long v31 = v25[6];
  long long v32 = v25[7];
  *(_OWORD *)&retstr->m41 = v31;
  *(_OWORD *)&retstr->m43 = v32;
  long long v33 = *v25;
  long long v34 = v25[1];
  *(_OWORD *)&retstr->m11 = *v25;
  *(_OWORD *)&retstr->m13 = v34;
  long long v35 = v25[2];
  long long v36 = v25[3];
  *(_OWORD *)&retstr->m21 = v35;
  *(_OWORD *)&retstr->m23 = v36;
  *(_OWORD *)&v58.m31 = v28;
  *(_OWORD *)&v58.m33 = v29;
  *(_OWORD *)&v58.m41 = v31;
  *(_OWORD *)&v58.m43 = v32;
  *(_OWORD *)&v58.m11 = v33;
  *(_OWORD *)&v58.m13 = v34;
  *(_OWORD *)&v58.m21 = v35;
  *(_OWORD *)&v58.m23 = v36;
  CATransform3DTranslate(&v59, &v58, v30 - v26, v27 - v19, 0.0);
  long long v37 = *(_OWORD *)&v59.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v59.m31;
  *(_OWORD *)&retstr->m33 = v37;
  long long v38 = *(_OWORD *)&v59.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v59.m41;
  *(_OWORD *)&retstr->m43 = v38;
  long long v39 = *(_OWORD *)&v59.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v59.m11;
  *(_OWORD *)&retstr->m13 = v39;
  long long v40 = *(_OWORD *)&v59.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v59.m21;
  *(_OWORD *)&retstr->m23 = v40;
  long long v41 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v58.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v58.m33 = v41;
  long long v42 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v58.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v58.m43 = v42;
  long long v43 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v58.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v58.m13 = v43;
  long long v44 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v58.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v58.m23 = v44;
  CATransform3DRotate(&v59, &v58, a4, 1.0, 0.0, 0.0);
  long long v45 = *(_OWORD *)&v59.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v59.m31;
  *(_OWORD *)&retstr->m33 = v45;
  long long v46 = *(_OWORD *)&v59.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v59.m41;
  *(_OWORD *)&retstr->m43 = v46;
  long long v47 = *(_OWORD *)&v59.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v59.m11;
  *(_OWORD *)&retstr->m13 = v47;
  long long v48 = *(_OWORD *)&v59.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v59.m21;
  *(_OWORD *)&retstr->m23 = v48;
  long long v49 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v58.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v58.m33 = v49;
  long long v50 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v58.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v58.m43 = v50;
  long long v51 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v58.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v58.m13 = v51;
  long long v52 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v58.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v58.m23 = v52;
  CGSize result = CATransform3DTranslate(&v59, &v58, v26 - v30, v19 - v27, 0.0);
  long long v54 = *(_OWORD *)&v59.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v59.m31;
  *(_OWORD *)&retstr->m33 = v54;
  long long v55 = *(_OWORD *)&v59.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v59.m41;
  *(_OWORD *)&retstr->m43 = v55;
  long long v56 = *(_OWORD *)&v59.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v59.m11;
  *(_OWORD *)&retstr->m13 = v56;
  long long v57 = *(_OWORD *)&v59.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v59.m21;
  *(_OWORD *)&retstr->m23 = v57;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)flapTopColor
{
  return self->_flapTopColor;
}

- (UIColor)flapBottomColor
{
  return self->_flapBottomColor;
}

- (int64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_labelTransitionTop, 0);
  objc_storeStrong((id *)&self->_labelTransitionBot, 0);
  objc_storeStrong((id *)&self->_labelTop, 0);
  objc_storeStrong((id *)&self->_labelBot, 0);
  objc_storeStrong((id *)&self->_flapBottomColor, 0);
  objc_storeStrong((id *)&self->_flapTopColor, 0);
  objc_storeStrong((id *)&self->_backgroundViewTransitionTop, 0);
  objc_storeStrong((id *)&self->_backgroundViewTransitionBot, 0);
  objc_storeStrong((id *)&self->_backgroundViewTop, 0);
  objc_storeStrong((id *)&self->_backgroundViewBot, 0);
}

@end