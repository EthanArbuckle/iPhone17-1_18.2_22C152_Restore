@interface UIScrollView
- (int)desiredScrollLength:(id)a3;
@end

@implementation UIScrollView

- (int)desiredScrollLength:(id)a3
{
  id v4 = a3;
  v5 = [v4 mf_testName];
  if (objc_msgSend(v5, "mf_isScrollMessageListTest")) {
    double v6 = 80000.0;
  }
  else {
    double v6 = (double)[v4 mf_maxScrollLength];
  }
  [(UIScrollView *)self contentSize];
  double v8 = v7;
  [(UIScrollView *)self bounds];
  double v10 = v8 + v9;
  if (v6 < v8 + v9) {
    double v10 = v6;
  }
  int v11 = (int)v10;

  return v11;
}

@end