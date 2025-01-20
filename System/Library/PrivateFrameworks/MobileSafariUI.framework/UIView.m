@interface UIView
+ (void)safari_animate:(char)a3 withDuration:(void *)a4 animations:;
+ (void)safari_animate:(uint64_t)a3 withDuration:(char)a4 delay:(uint64_t)a5 options:(void *)a6 animations:(void *)a7 completion:;
- (void)safari_setUntransformedFrame:(double)a3;
@end

@implementation UIView

+ (void)safari_animate:(char)a3 withDuration:(void *)a4 animations:
{
  id v7 = a4;
  uint64_t v6 = self;
  +[UIView safari_animate:withDuration:delay:options:animations:completion:](a1, 0.0, v6, a3, 0, v7, 0);
}

+ (void)safari_animate:(uint64_t)a3 withDuration:(char)a4 delay:(uint64_t)a5 options:(void *)a6 animations:(void *)a7 completion:
{
  v15 = a6;
  id v12 = a7;
  v13 = self;
  v14 = (void (**)(void, void))MEMORY[0x1E4E42950](v12);

  if (a4)
  {
    [v13 animateWithDuration:a5 delay:v15 options:v14 animations:a1 completion:a2];
  }
  else
  {
    if (v15) {
      v15[2](v15);
    }
    if (v12) {
      v14[2](v14, 1);
    }
  }
}

- (void)safari_setUntransformedFrame:(double)a3
{
  if (result)
  {
    v9 = result;
    [result bounds];
    objc_msgSend(v9, "setBounds:");
    v10 = [v9 layer];
    [v10 anchorPoint];
    double v12 = v11;
    double v14 = v13;

    return objc_msgSend(v9, "setCenter:", a2 + v12 * a4, a3 + v14 * a5);
  }
  return result;
}

@end