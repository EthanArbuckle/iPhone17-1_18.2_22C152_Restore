@interface COSPinKeyView
- (COSPinKeyView)initWithFrame:(CGRect)a3;
- (NSArray)dashLayers;
- (NSArray)digitLayers;
- (NSString)digits;
- (int64_t)expectedPinLength;
- (void)layoutSubviews;
- (void)setCodeLength:(int64_t)a3;
- (void)setDashLayers:(id)a3;
- (void)setDigitLayers:(id)a3;
- (void)setDigits:(id)a3;
@end

@implementation COSPinKeyView

- (COSPinKeyView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)COSPinKeyView;
  v3 = -[COSPinKeyView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[NSMutableArray array];
    v5 = +[NSMutableArray array];
    if ([(COSPinKeyView *)v3 expectedPinLength] >= 1)
    {
      uint64_t v6 = 0;
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      do
      {
        id v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
        v11 = +[UIFont systemFontOfSize:45.0];
        [v10 setFont:v11];

        v12 = BPSTextColor();
        [v10 setTextColor:v12];

        [v10 setTextAlignment:1];
        v13 = +[NSBundle mainBundle];
        [v13 localizedStringForKey:@"EMPTY_DIGIT_DASH" value:&stru_100249230 table:@"Localizable"];
        v15 = v14 = (void *)v4;
        [v10 setText:v15];

        [(NSArray *)v5 addObject:v10];
        [(COSPinKeyView *)v3 addSubview:v10];
        id v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
        v17 = +[UIFont systemFontOfSize:36.0];
        [v16 setFont:v17];

        v18 = BPSTextColor();
        [v16 setTextColor:v18];

        [v16 setTextAlignment:1];
        v19 = +[NSBundle mainBundle];
        [v19 localizedStringForKey:@"EMPTY_DIGIT_DASH" value:&stru_100249230 table:@"Localizable"];
        v21 = v20 = v5;
        [v16 setText:v21];

        v5 = v20;
        uint64_t v4 = (uint64_t)v14;
        [v14 addObject:v16];
        [(COSPinKeyView *)v3 addSubview:v16];

        ++v6;
      }
      while ([(COSPinKeyView *)v3 expectedPinLength] > v6);
    }
    dashLayers = v3->_dashLayers;
    v3->_dashLayers = v5;
    v23 = v5;

    digitLayers = v3->_digitLayers;
    v3->_digitLayers = (NSArray *)v4;
  }
  return v3;
}

- (int64_t)expectedPinLength
{
  return 6;
}

- (void)layoutSubviews
{
  [(COSPinKeyView *)self bounds];
  double Width = CGRectGetWidth(v35);
  uint64_t v4 = [(COSPinKeyView *)self expectedPinLength];
  id v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  uint64_t v6 = +[UIFont systemFontOfSize:45.0];
  [v5 setFont:v6];

  v7 = BPSTextColor();
  [v5 setTextColor:v7];

  [v5 setTextAlignment:1];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"DIGIT_DASH" value:&stru_100249230 table:@"Localizable"];
  [v5 setText:v9];

  [v5 sizeToFit];
  [v5 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v18 = self->_dashLayers;
  id v19 = [(NSArray *)v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    int v21 = 0;
    float v22 = Width / (double)v4;
    double v23 = floorf(v22);
    uint64_t v24 = *(void *)v31;
    do
    {
      v25 = 0;
      uint64_t v26 = v21;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v18);
        }
        v27 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v25);
        v36.origin.x = v11;
        v36.origin.double y = v13;
        v36.size.double width = v15;
        v36.size.double height = v17;
        float v28 = (v23 - CGRectGetWidth(v36)) * 0.5;
        double v11 = floorf(v28) + v23 * (double)((int)v26 + (int)v25);
        [v27 setFrame:v11, v13, v15, v17, v30];
        v29 = [(NSArray *)self->_digitLayers objectAtIndexedSubscript:(char *)v25 + v26];
        [v29 setFrame:v11, v13, v15, v17];

        v25 = (char *)v25 + 1;
      }
      while (v20 != v25);
      id v20 = [(NSArray *)v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      int v21 = v26 + v25;
    }
    while (v20);
  }
}

- (void)setCodeLength:(int64_t)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_dashLayers;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
        double v11 = +[NSBundle mainBundle];
        double v12 = v11;
        if ((uint64_t)v8 + v9 >= a3)
        {
          double v16 = [v11 localizedStringForKey:@"EMPTY_DIGIT_DASH" value:&stru_100249230 table:@"Localizable"];
          [v10 setText:v16];

          [v10 setHidden:0];
          double v14 = [(NSArray *)self->_digitLayers objectAtIndexedSubscript:(char *)v8 + v9];
          [(__CFString *)v14 setText:&stru_100249230];
        }
        else
        {
          double v13 = [v11 localizedStringForKey:@"DIGIT_DASH" value:&stru_100249230 table:@"Localizable"];
          [v10 setText:v13];

          [v10 setHidden:1];
          double v14 = &stru_100249230;
          if ((char *)[(NSString *)self->_digits length] > (char *)v8 + v9)
          {
            -[NSString substringWithRange:](self->_digits, "substringWithRange:", (char *)v8 + v9, 1);
            double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          double v15 = [(NSArray *)self->_digitLayers objectAtIndexedSubscript:(char *)v8 + v9];
          [v15 setText:v14];
        }
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      int v6 = v9 + v8;
    }
    while (v5);
  }
}

- (NSArray)dashLayers
{
  return self->_dashLayers;
}

- (void)setDashLayers:(id)a3
{
}

- (NSArray)digitLayers
{
  return self->_digitLayers;
}

- (void)setDigitLayers:(id)a3
{
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_digitLayers, 0);

  objc_storeStrong((id *)&self->_dashLayers, 0);
}

@end