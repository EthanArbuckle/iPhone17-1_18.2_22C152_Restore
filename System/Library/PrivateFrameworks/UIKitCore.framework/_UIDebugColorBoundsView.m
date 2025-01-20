@interface _UIDebugColorBoundsView
+ (id)_nextColor;
- (_UIDebugColorBoundsView)initWithView:(id)a3;
@end

@implementation _UIDebugColorBoundsView

+ (id)_nextColor
{
  if (qword_1EB264AA8 != -1) {
    dispatch_once(&qword_1EB264AA8, &__block_literal_global_602);
  }
  v2 = [(id)_MergedGlobals_1289 objectAtIndex:qword_1EB264AA0];
  unint64_t v3 = ++qword_1EB264AA0;
  qword_1EB264AA0 = v3 % [(id)_MergedGlobals_1289 count];
  return v2;
}

- (_UIDebugColorBoundsView)initWithView:(id)a3
{
  [a3 bounds];
  v13.receiver = self;
  v13.super_class = (Class)_UIDebugColorBoundsView;
  v4 = -[UIView initWithFrame:](&v13, sel_initWithFrame_);
  v5 = v4;
  if (v4)
  {
    [(UIView *)v4 setAutoresizingMask:18];
    [(UIView *)v5 setUserInteractionEnabled:0];
    [(UIView *)v5 setOpaque:0];
    id v6 = +[_UIDebugColorBoundsView _nextColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(UIView *)v5 layer];
    [v8 setBorderColor:v7];

    [(UIView *)v5 _currentScreenScale];
    double v10 = 1.0 / v9;
    v11 = [(UIView *)v5 layer];
    [v11 setBorderWidth:v10];
  }
  return v5;
}

@end