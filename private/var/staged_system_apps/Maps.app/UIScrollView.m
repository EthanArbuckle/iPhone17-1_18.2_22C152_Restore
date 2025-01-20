@interface UIScrollView
+ (void)_maps_updateHairlineAlpha:(double)a3 animated:(BOOL)a4 getter:(id)a5 setter:(id)a6;
- (unint64_t)_maps_edgesObscuringContentIncludingContentInsets:(BOOL)a3;
- (void)_maps_scrollTextViewSelectedRangeVisible:(id)a3;
@end

@implementation UIScrollView

+ (void)_maps_updateHairlineAlpha:(double)a3 animated:(BOOL)a4 getter:(id)a5 setter:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  if ((*((double (**)(id))a5 + 2))(a5) != a3)
  {
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100107BBC;
    v14 = &unk_1012F01B8;
    id v15 = v9;
    double v16 = a3;
    v10 = objc_retainBlock(&v11);
    if (v7) {
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.2, 0.0, v11, v12, v13, v14);
    }
    else {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10, v11, v12, v13, v14);
    }
  }
}

- (void)_maps_scrollTextViewSelectedRangeVisible:(id)a3
{
  id v15 = a3;
  v4 = [v15 selectedTextRange];
  if (v4)
  {
    [v15 firstRectForRange:v4];
    -[UIScrollView convertRect:toView:](self, "convertRect:toView:", v15);
    double x = v17.origin.x;
    double y = v17.origin.y;
    double width = v17.size.width;
    double height = v17.size.height;
    v19.origin.double x = CGRectZero.origin.x;
    v19.origin.double y = CGRectZero.origin.y;
    v19.size.double width = CGRectZero.size.width;
    v19.size.double height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v17, v19))
    {
      unint64_t v9 = 0;
      do
      {
        -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0, x, y, width, height);
        [(UIScrollView *)self layoutIfNeeded];
        [v15 firstRectForRange:v4];
        -[UIScrollView convertRect:toView:](self, "convertRect:toView:", v15);
        CGFloat v10 = v18.origin.x;
        CGFloat v11 = v18.origin.y;
        CGFloat v12 = v18.size.width;
        CGFloat v13 = v18.size.height;
        v20.origin.double x = x;
        v20.origin.double y = y;
        v20.size.double width = width;
        v20.size.double height = height;
        if (CGRectEqualToRect(v18, v20)) {
          break;
        }
        double x = v10;
        double y = v11;
        double width = v12;
        double height = v13;
      }
      while (v9++ < 9);
    }
  }
}

- (unint64_t)_maps_edgesObscuringContentIncludingContentInsets:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIScrollView *)self bounds];
  CGFloat MinX = CGRectGetMinX(v26);
  [(UIScrollView *)self bounds];
  CGFloat MinY = CGRectGetMinY(v27);
  [(UIScrollView *)self bounds];
  CGFloat Width = CGRectGetWidth(v28);
  [(UIScrollView *)self bounds];
  CGFloat Height = CGRectGetHeight(v29);
  [(UIScrollView *)self contentSize];
  double v10 = v9;
  [(UIScrollView *)self contentSize];
  double v12 = v11;
  if (v3)
  {
    [(UIScrollView *)self adjustedContentInset];
    double v16 = 0.0 - v15;
    double v25 = 0.0 - v17;
    double v10 = v10 - (-v14 - v15);
    double v12 = v12 - (-v13 - v17);
  }
  else
  {
    double v25 = 0.0;
    double v16 = 0.0;
  }
  v30.origin.double x = MinX;
  v30.origin.double y = MinY;
  v30.size.double width = Width;
  v30.size.double height = Height;
  CGFloat v24 = MinX;
  double v23 = CGRectGetMinY(v30);
  v31.origin.double x = v16;
  v31.origin.double y = v25;
  v31.size.double width = v10;
  v31.size.double height = v12;
  unint64_t v18 = v23 > CGRectGetMinY(v31);
  v32.origin.double x = MinX;
  v32.origin.double y = MinY;
  v32.size.double width = Width;
  v32.size.double height = Height;
  double v19 = CGRectGetMinX(v32);
  v33.origin.double x = v16;
  v33.origin.double y = v25;
  v33.size.double width = v10;
  v33.size.double height = v12;
  if (v19 > CGRectGetMinX(v33)) {
    v18 |= 2uLL;
  }
  v34.origin.double x = v24;
  v34.origin.double y = MinY;
  v34.size.double width = Width;
  v34.size.double height = Height;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.double x = v16;
  v35.origin.double y = v25;
  v35.size.double width = v10;
  v35.size.double height = v12;
  if (MaxY < CGRectGetMaxY(v35)) {
    v18 |= 4uLL;
  }
  v36.origin.double x = v24;
  v36.origin.double y = MinY;
  v36.size.double width = Width;
  v36.size.double height = Height;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.double x = v16;
  v37.origin.double y = v25;
  v37.size.double width = v10;
  v37.size.double height = v12;
  if (MaxX >= CGRectGetMaxX(v37)) {
    return v18;
  }
  else {
    return v18 | 8;
  }
}

@end