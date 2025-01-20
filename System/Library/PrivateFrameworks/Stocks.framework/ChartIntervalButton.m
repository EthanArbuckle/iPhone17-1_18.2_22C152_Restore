@interface ChartIntervalButton
+ (id)titleForInterval:(int64_t)a3;
- (BOOL)isSelected;
- (ChartIntervalButton)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation ChartIntervalButton

- (ChartIntervalButton)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ChartIntervalButton;
  v3 = -[ChartIntervalButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(ChartIntervalButton *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F1C550] whiteColor];
    [(ChartIntervalButton *)v3 setTextColor:v5];

    v6 = +[StocksStyle sharedStyle];
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 _referenceBounds];
    double v8 = 14.0;
    if (v9 == 667.0) {
      double v8 = 17.0;
    }
    v10 = [v6 lightFontOfSize:v8];
    [(ChartIntervalButton *)v3 setFont:v10];

    [(ChartIntervalButton *)v3 setTextAlignment:1];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  if ([(ChartIntervalButton *)self isSelected] != a3)
  {
    self->_selected = a3;
    id v9 = +[StocksStyle sharedStyle];
    v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 _referenceBounds];
    double v6 = 14.0;
    if (v7 == 667.0) {
      double v6 = 17.0;
    }
    if (a3) {
      [v9 boldFontOfSize:v6];
    }
    else {
    double v8 = [v9 lightFontOfSize:v6];
    }
    [(ChartIntervalButton *)self setFont:v8];
  }
}

+ (id)titleForInterval:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"1w";
      break;
    case 2:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"1m";
      break;
    case 3:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"3m";
      break;
    case 4:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"6m";
      break;
    case 5:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"1y";
      break;
    case 6:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"2y";
      break;
    case 7:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"5y";
      break;
    case 8:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"10y";
      break;
    default:
      v3 = +[StocksBundles getBundle:1];
      v4 = v3;
      v5 = @"1d";
      break;
  }
  double v6 = [v3 localizedStringForKey:v5 value:&stru_26D5DA820 table:@"Localizable"];

  return v6;
}

- (BOOL)isSelected
{
  return self->_selected;
}

@end