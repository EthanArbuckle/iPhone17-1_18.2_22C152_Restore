@interface NTKColorCodeTimeView
- (NSDate)date;
- (NTKColorCodeTimeView)init;
- (void)layoutSubviews;
- (void)setDate:(id)a3;
@end

@implementation NTKColorCodeTimeView

- (NTKColorCodeTimeView)init
{
  v29[10] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)NTKColorCodeTimeView;
  v2 = [(NTKColorCodeTimeView *)&v28 init];
  if (v2)
  {
    v3 = (NSArray *)objc_opt_new();
    int v4 = 9;
    do
    {
      v5 = objc_opt_new();
      id v6 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v7 = [v6 CGColor];
      v8 = [v5 layer];
      [v8 setBorderColor:v7];

      v9 = [v5 layer];
      [v9 setBorderWidth:2.0];

      [(NSArray *)v3 addObject:v5];
      [(NTKColorCodeTimeView *)v2 addSubview:v5];

      --v4;
    }
    while (v4);
    colorViews = v2->_colorViews;
    v2->_colorViews = v3;
    v27 = v3;

    v26 = [MEMORY[0x1E4FB1618] blackColor];
    v29[0] = v26;
    v25 = [MEMORY[0x1E4FB1618] brownColor];
    v29[1] = v25;
    v11 = [MEMORY[0x1E4FB1618] redColor];
    v29[2] = v11;
    v12 = [MEMORY[0x1E4FB1618] orangeColor];
    v29[3] = v12;
    v13 = [MEMORY[0x1E4FB1618] yellowColor];
    v29[4] = v13;
    v14 = [MEMORY[0x1E4FB1618] greenColor];
    v29[5] = v14;
    v15 = [MEMORY[0x1E4FB1618] blueColor];
    v29[6] = v15;
    v16 = [MEMORY[0x1E4FB1618] purpleColor];
    v29[7] = v16;
    v17 = [MEMORY[0x1E4FB1618] grayColor];
    v29[8] = v17;
    v18 = [MEMORY[0x1E4FB1618] whiteColor];
    v29[9] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:10];
    digitToColor = v2->_digitToColor;
    v2->_digitToColor = (NSArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    cal = v2->_cal;
    v2->_cal = (NSCalendar *)v21;

    v23 = [MEMORY[0x1E4FB1618] whiteColor];

    [(NTKColorCodeTimeView *)v2 setBackgroundColor:v23];
  }
  return v2;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)NTKColorCodeTimeView;
  [(NTKColorCodeTimeView *)&v15 layoutSubviews];
  [(NTKColorCodeTimeView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  unint64_t v7 = [(NSArray *)self->_colorViews count];
  if ([(NSArray *)self->_colorViews count])
  {
    unint64_t v8 = 0;
    double v9 = v4 / (double)v7;
    do
    {
      v16.origin.double x = v9 * (double)(int)v8;
      v16.origin.double y = 0.0;
      v16.size.double width = v9;
      v16.size.double height = v6;
      CGRect v17 = CGRectInset(v16, 2.0, 2.0);
      double x = v17.origin.x;
      double y = v17.origin.y;
      double width = v17.size.width;
      double height = v17.size.height;
      v14 = [(NSArray *)self->_colorViews objectAtIndexedSubscript:v8];
      objc_msgSend(v14, "setFrame:", x, y, width, height);

      ++v8;
    }
    while ([(NSArray *)self->_colorViews count] > v8);
  }
}

- (void)setDate:(id)a3
{
  v10[9] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  objc_storeStrong((id *)&self->_date, a3);
  [(NTKColorCodeTimeView *)self layoutSubviews];
  double v5 = [(NSCalendar *)self->_cal components:32992 fromDate:v9];
  v10[0] = [v5 hour] / 10;
  v10[1] = [v5 hour] % 10;
  v10[2] = [v5 minute] / 10;
  v10[3] = [v5 minute] % 10;
  v10[4] = [v5 second] / 10;
  v10[5] = [v5 second] % 10;
  v10[6] = [v5 nanosecond] / 100000000;
  v10[7] = [v5 nanosecond] / 10000000 % 10;
  uint64_t v6 = 0;
  v10[8] = [v5 nanosecond] / 1000000 % 10;
  do
  {
    unint64_t v7 = [(NSArray *)self->_digitToColor objectAtIndexedSubscript:v10[v6]];
    unint64_t v8 = [(NSArray *)self->_colorViews objectAtIndexedSubscript:v6];
    [v8 setBackgroundColor:v7];

    ++v6;
  }
  while (v6 != 9);
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cal, 0);
  objc_storeStrong((id *)&self->_digitToColor, 0);
  objc_storeStrong((id *)&self->_colorViews, 0);
}

@end