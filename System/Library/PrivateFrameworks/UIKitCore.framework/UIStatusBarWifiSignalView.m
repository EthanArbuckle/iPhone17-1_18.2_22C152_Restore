@interface UIStatusBarWifiSignalView
@end

@implementation UIStatusBarWifiSignalView

void __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_MergedGlobals_5_13;
  _MergedGlobals_5_13 = v0;
}

double __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 32);
  return v2 - __sincos_stret(*(double *)(a1 + 48)).__cosval * a2;
}

double __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) - a2;
}

void __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  if (*(unsigned char *)(a1 + 96) && v2 == 0.0)
  {
    +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64) - *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 72) * 0.5, 0.0, 6.28318531);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 setLineWidth:*(double *)(a1 + 88)];
  }
  else
  {
    double v3 = (*(double (**)(double))(*(void *)(a1 + 32) + 16))(v2);
    double v5 = v4;
    id v8 = +[UIBezierPath bezierPath];
    objc_msgSend(v8, "moveToPoint:", v3, v5);
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64), v2, *(double *)(a1 + 80) + 3.14159265, 6.28318531 - *(double *)(a1 + 80));
    double v6 = *(double *)(a1 + 72);
    if (*(unsigned char *)(a1 + 96)) {
      double v6 = v6 * 0.5;
    }
    double v7 = v2 + v6;
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v7);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (*(unsigned char *)(a1 + 96))
    {
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
      double v7 = v7 + *(double *)(a1 + 72) * 0.5;
    }
    else
    {
      objc_msgSend(v8, "addLineToPoint:");
    }
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64), v7, 6.28318531 - *(double *)(a1 + 80), *(double *)(a1 + 80) + 3.14159265);
    if (*(unsigned char *)(a1 + 96))
    {
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v7 - *(double *)(a1 + 72) * 0.5);
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
    }
    else
    {
      [v8 setLineJoinStyle:1];
    }
    [v8 setLineWidth:*(double *)(a1 + 88)];
  }
  [v8 closePath];
  [v8 fill];
  [v8 stroke];
}

uint64_t __46___UIStatusBarWifiSignalView__updateFromMode___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateActiveBars];
  }
  return result;
}

@end