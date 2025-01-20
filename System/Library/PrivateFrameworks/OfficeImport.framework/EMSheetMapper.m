@interface EMSheetMapper
- (CGSize)adjustedSize;
- (CGSize)preprocessSizeWithState:(id)a3;
- (int)height;
- (int)width;
@end

@implementation EMSheetMapper

- (int)height
{
  return 600;
}

- (CGSize)preprocessSizeWithState:(id)a3
{
  id v4 = a3;
  int v5 = [(EMSheetMapper *)self preprocessWidthWithState:v4];
  int v6 = [(EMSheetMapper *)self preprocessHeightWithState:v4];
  if ((double)v5 >= 400.0) {
    double v7 = (double)v5;
  }
  else {
    double v7 = 400.0;
  }
  if ((double)v6 >= 300.0) {
    double v8 = (double)v6;
  }
  else {
    double v8 = 300.0;
  }

  double v9 = v7;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int)width
{
  return 980;
}

- (CGSize)adjustedSize
{
  int v3 = [(EMSheetMapper *)self width];
  int v4 = [(EMSheetMapper *)self height];
  if (v3 > 0 || v4 >= 1)
  {
    double v7 = (double)v4;
    if (v3 <= 0)
    {
      double v8 = v7 * 4.0 / 3.0;
    }
    else
    {
      double v8 = (double)v3;
      if (v4 <= 0) {
        double v7 = v8 * 3.0 * 0.25;
      }
    }
    double v5 = v8 + 20.0;
    double v6 = v7 + 20.0;
  }
  else
  {
    double v5 = 980.0;
    double v6 = 600.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

@end