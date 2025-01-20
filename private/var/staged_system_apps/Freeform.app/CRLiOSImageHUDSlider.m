@interface CRLiOSImageHUDSlider
- (BOOL)accessibilityPerformEscape;
- (CRLiOSImageHUDSlider)initWithCoder:(id)a3;
- (CRLiOSImageHUDSlider)initWithFrame:(CGRect)a3;
- (CRLiOSImageHUDViewController)parentHUDViewController;
- (NSArray)detents;
- (double)p_positionForValue:(double)a3;
- (float)value;
- (id)accessibilityLabel;
- (void)setDetents:(id)a3;
- (void)setParentHUDViewController:(id)a3;
@end

@implementation CRLiOSImageHUDSlider

- (CRLiOSImageHUDSlider)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSImageHUDSlider;
  v3 = -[CRLiOSImageHUDSlider initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    detents = v3->_detents;
    v3->_detents = (NSArray *)&__NSArray0__struct;
  }
  return v4;
}

- (CRLiOSImageHUDSlider)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSImageHUDSlider;
  v3 = [(CRLiOSImageHUDSlider *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    detents = v3->_detents;
    v3->_detents = (NSArray *)&__NSArray0__struct;
  }
  return v4;
}

- (float)value
{
  v27.receiver = self;
  v27.super_class = (Class)CRLiOSImageHUDSlider;
  [(CRLiOSImageHUDSlider *)&v27 value];
  float v4 = v3;
  [(CRLiOSImageHUDSlider *)self minimumValue];
  float v6 = v5;
  [(CRLiOSImageHUDSlider *)self maximumValue];
  if (v4 != v6)
  {
    BOOL v8 = vabdd_f64(v4, v6) < 0.00999999978 || v4 == v7;
    if (!v8 && vabdd_f64(v4, v7) >= 0.00999999978)
    {
      -[CRLiOSImageHUDSlider p_positionForValue:](self, "p_positionForValue:");
      double v10 = v9;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v11 = [(CRLiOSImageHUDSlider *)self detents];
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) floatValue];
            float v17 = v16;
            [(CRLiOSImageHUDSlider *)self p_positionForValue:v16];
            double v19 = v18 + -4.0;
            double v20 = v18 + 4.0;
            if (v10 >= v19 && v10 < v20)
            {
              float v4 = v17;
              goto LABEL_20;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_20:
    }
  }
  return v4;
}

- (double)p_positionForValue:(double)a3
{
  [(CRLiOSImageHUDSlider *)self minimumValue];
  float v6 = v5;
  [(CRLiOSImageHUDSlider *)self maximumValue];
  *(float *)&a3 = (a3 - v6) / (float)(v7 - v6);
  [(CRLiOSImageHUDSlider *)self bounds];
  -[CRLiOSImageHUDSlider trackRectForBounds:](self, "trackRectForBounds:");
  return v8 + *(float *)&a3 * v9;
}

- (id)accessibilityLabel
{
  v2 = +[NSBundle mainBundle];
  float v3 = [v2 localizedStringForKey:@"Image mask slider" value:0 table:0];

  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(CRLiOSImageHUDSlider *)self parentHUDViewController];
  unsigned __int8 v3 = [v2 accessibilityPerformEscape];

  return v3;
}

- (NSArray)detents
{
  return self->_detents;
}

- (void)setDetents:(id)a3
{
}

- (CRLiOSImageHUDViewController)parentHUDViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentHUDViewController);

  return (CRLiOSImageHUDViewController *)WeakRetained;
}

- (void)setParentHUDViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentHUDViewController);

  objc_storeStrong((id *)&self->_detents, 0);
}

@end