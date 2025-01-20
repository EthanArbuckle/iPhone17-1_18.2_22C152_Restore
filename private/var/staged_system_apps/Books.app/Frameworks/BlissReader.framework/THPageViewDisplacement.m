@interface THPageViewDisplacement
- (THPageViewDisplacement)initWithView:(id)a3 scrollView:(id)a4;
- (unint64_t)numberOfPagesShown;
- (void)animateFadeWithDuration:(double)a3 forPageIndex:(unint64_t)a4 enumerator:(id)a5;
- (void)animateOpacityAndDisplaymentProgess:(double)a3 delay:(double)a4 duration:(double)a5 initialPageIndex:(unint64_t)a6 enumerator:(id)a7;
- (void)animateOverscrollWithDuration:(unint64_t)a3 enumerator:(id)a4;
- (void)animateShowWithDuration:(double)a3 forPageIndex:(unint64_t)a4 enumerator:(id)a5;
- (void)animateZoomWithDuration:(double)a3 initialPageIndex:(unint64_t)a4 minViewScale:(double)a5 maxViewScale:(double)a6 currentViewScale:(double)a7 enumerator:(id)a8;
- (void)dealloc;
- (void)endRevealTOCWithEnumerator:(id)a3;
- (void)hideWithEnumerator:(id)a3;
- (void)prepareToZoomWithEnumerator:(id)a3;
- (void)resetAnimationsWithEnumerator:(id)a3;
- (void)setNumberOfPagesShown:(unint64_t)a3;
- (void)startRevealTOCWithPageIndex:(unint64_t)a3 enumerator:(id)a4;
- (void)updateDisplacementAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4 enumerator:(id)a5;
- (void)updateZoomInitialPageIndex:(unint64_t)a3 minViewScale:(double)a4 maxViewScale:(double)a5 currentViewScale:(double)a6 enumerator:(id)a7;
@end

@implementation THPageViewDisplacement

- (THPageViewDisplacement)initWithView:(id)a3 scrollView:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THPageViewDisplacement;
  v6 = [(THPageViewDisplacement *)&v8 init];
  if (v6)
  {
    v6->_view = (UIView *)a3;
    v6->_scrollView = (TSKScrollView *)a4;
    v6->_numberOfPagesShown = 1;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THPageViewDisplacement;
  [(THPageViewDisplacement *)&v3 dealloc];
}

- (void)prepareToZoomWithEnumerator:(id)a3
{
}

- (void)resetAnimationsWithEnumerator:(id)a3
{
}

- (void)hideWithEnumerator:(id)a3
{
}

- (void)animateZoomWithDuration:(double)a3 initialPageIndex:(unint64_t)a4 minViewScale:(double)a5 maxViewScale:(double)a6 currentViewScale:(double)a7 enumerator:(id)a8
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_17B764;
  v12[3] = &unk_45A1B8;
  *(double *)&v12[6] = a6;
  *(double *)&v12[7] = a5;
  v12[4] = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v12[5] = a4;
  *(double *)&v12[8] = a7;
  *(double *)&v12[9] = a3;
  (*((void (**)(id, void *))a8 + 2))(a8, v12);
}

- (void)animateOpacityAndDisplaymentProgess:(double)a3 delay:(double)a4 duration:(double)a5 initialPageIndex:(unint64_t)a6 enumerator:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_17B9F8;
  v12[3] = &unk_45A1E0;
  v12[4] = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v12[5] = a6;
  *(double *)&v12[6] = a3;
  *(double *)&v12[7] = a5;
  *(double *)&v12[8] = a4;
  (*((void (**)(id, void *))a7 + 2))(a7, v12);
}

- (void)updateZoomInitialPageIndex:(unint64_t)a3 minViewScale:(double)a4 maxViewScale:(double)a5 currentViewScale:(double)a6 enumerator:(id)a7
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_17BC54;
  v9[3] = &unk_45A1E0;
  *(double *)&v9[6] = a5;
  *(double *)&v9[7] = a4;
  *(double *)&v9[8] = a6;
  v9[4] = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  v9[5] = a3;
  (*((void (**)(id, void *))a7 + 2))(a7, v9);
}

- (void)animateFadeWithDuration:(double)a3 forPageIndex:(unint64_t)a4 enumerator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_17BE90;
  v5[3] = &unk_45A200;
  v5[4] = a4;
  *(double *)&v5[5] = a3;
  (*((void (**)(id, void *))a5 + 2))(a5, v5);
}

- (void)animateShowWithDuration:(double)a3 forPageIndex:(unint64_t)a4 enumerator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_17C074;
  v5[3] = &unk_45A200;
  v5[4] = a4;
  *(double *)&v5[5] = a3;
  (*((void (**)(id, void *))a5 + 2))(a5, v5);
}

- (void)animateOverscrollWithDuration:(unint64_t)a3 enumerator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_17C254;
  v4[3] = &unk_45A220;
  v4[4] = a3;
  (*((void (**)(id, void *))a4 + 2))(a4, v4);
}

- (void)startRevealTOCWithPageIndex:(unint64_t)a3 enumerator:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_17C3E8;
  v4[3] = &unk_45A240;
  v4[4] = a3;
  (*((void (**)(id, void *))a4 + 2))(a4, v4);
}

- (void)endRevealTOCWithEnumerator:(id)a3
{
}

- (void)updateDisplacementAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4 enumerator:(id)a5
{
  [(TSKScrollView *)self->_scrollView tsk_bounds];
  CGFloat x = v41.origin.x;
  CGFloat y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  double v12 = CGRectGetWidth(v41);
  if (v12 == 0.0) {
    double v13 = 1.0;
  }
  else {
    double v13 = v12;
  }
  unint64_t numberOfPagesShown = self->_numberOfPagesShown;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  rect.origin.CGFloat y = CGRectGetMinX(v42) / v13 * (double)numberOfPagesShown;
  v15 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [(UIView *)self->_view bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  view = self->_view;
  [(TSKScrollView *)self->_scrollView bounds];
  -[UIView convertRect:fromView:](view, "convertRect:fromView:", self->_scrollView);
  rect.origin.CGFloat x = v43.origin.x;
  CGFloat v25 = v43.origin.y;
  CGFloat v26 = v43.size.width;
  CGFloat v27 = v43.size.height;
  double MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = v17;
  v44.origin.CGFloat y = v19;
  v44.size.CGFloat width = v21;
  v44.size.CGFloat height = v23;
  double v32 = fmax(MinX - CGRectGetMinX(v44), 0.0);
  v45.origin.CGFloat x = v17;
  v45.origin.CGFloat y = v19;
  v45.size.CGFloat width = v21;
  v45.size.CGFloat height = v23;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.CGFloat x = rect.origin.x;
  v46.origin.CGFloat y = v25;
  v46.size.CGFloat width = v26;
  v46.size.CGFloat height = v27;
  BOOL v30 = fmin(v32, 40.0) + fmin(fmax(MaxX - CGRectGetMaxX(v46), 0.0), 40.0) <= 0.0;
  double v31 = 1.0;
  if (v30) {
    double v31 = 0.0;
  }
  *(void *)&rect.size.CGFloat width = _NSConcreteStackBlock;
  *(void *)&rect.size.CGFloat height = 3221225472;
  v34 = sub_17C7D4;
  v35 = &unk_45A2A8;
  BOOL v40 = a4;
  CGFloat v37 = rect.origin.y;
  unint64_t v38 = numberOfPagesShown;
  v36 = v15;
  double v39 = v31;
  (*((void (**)(id, CGSize *))a5 + 2))(a5, &rect.size);
}

- (unint64_t)numberOfPagesShown
{
  return self->_numberOfPagesShown;
}

- (void)setNumberOfPagesShown:(unint64_t)a3
{
  self->_unint64_t numberOfPagesShown = a3;
}

@end