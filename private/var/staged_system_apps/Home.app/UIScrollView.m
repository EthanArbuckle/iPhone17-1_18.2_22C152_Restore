@interface UIScrollView
- (id)_simulateScrollWithTranslation:(CGPoint)a3 numIterations:(int)a4 duration:(double)a5 reversed:(BOOL)a6;
- (void)_performTranslationScrollTest:(id)a3 duration:(double)a4 iterations:(int)a5 scrollAxis:(unint64_t)a6;
@end

@implementation UIScrollView

- (void)_performTranslationScrollTest:(id)a3 duration:(double)a4 iterations:(int)a5 scrollAxis:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  [(UIScrollView *)self contentSize];
  if (a6 == 1)
  {
    [(UIScrollView *)self contentOffset];
    double v13 = v12;
    [(UIScrollView *)self contentSize];
    if (v13 >= v14 * 0.5)
    {
      [(UIScrollView *)self contentOffset];
      double v18 = -v20;
    }
    else
    {
      [(UIScrollView *)self contentSize];
      double v16 = v15;
      [(UIScrollView *)self contentOffset];
      double v18 = v16 - v17;
    }
    double v19 = 0.0;
  }
  else
  {
    double v19 = v11;
    double v18 = 0.0;
  }
  if (a4 == -1.0)
  {
    float v21 = fabs(v18) + fabs(v19);
    a4 = v21 / 400.0;
  }
  v22 = +[UIApplication sharedApplication];
  [v22 startedTest:v10];

  v23 = -[UIScrollView _simulateScrollWithTranslation:numIterations:duration:reversed:](self, "_simulateScrollWithTranslation:numIterations:duration:reversed:", v7, 0, v18, v19, a4);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002ED94;
  v26[3] = &unk_1000C2350;
  id v27 = v10;
  id v24 = v10;
  id v25 = [v23 addSuccessBlock:v26];
}

- (id)_simulateScrollWithTranslation:(CGPoint)a3 numIterations:(int)a4 duration:(double)a5 reversed:(BOOL)a6
{
  if (a4 <= 0)
  {
    double v16 = +[NAFuture futureWithNoResult];
  }
  else
  {
    BOOL v6 = a6;
    double y = a3.y;
    double x = a3.x;
    double v12 = objc_opt_new();
    if (v6) {
      double v13 = -x;
    }
    else {
      double v13 = x;
    }
    if (v6) {
      double v14 = -y;
    }
    else {
      double v14 = y;
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002EFE0;
    v23[3] = &unk_1000C3060;
    id v24 = v12;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002EFF4;
    v21[3] = &unk_1000C1CF8;
    id v22 = v24;
    id v15 = v24;
    -[UIScrollView _simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:](self, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", &stru_1000C3038, v23, &stru_1000C3080, v21, v13, v14, a5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002EFFC;
    v18[3] = &unk_1000C30A8;
    v18[4] = self;
    *(double *)&v18[5] = x;
    *(double *)&v18[6] = y;
    int v19 = a4;
    *(double *)&v18[7] = a5;
    BOOL v20 = v6;
    double v16 = [v15 flatMap:v18];
  }

  return v16;
}

@end