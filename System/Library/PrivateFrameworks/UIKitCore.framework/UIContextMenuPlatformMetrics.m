@interface UIContextMenuPlatformMetrics
@end

@implementation UIContextMenuPlatformMetrics

id __37___UIContextMenuPlatformMetrics_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  v4 = +[UIBlurEffect effectWithStyle:8];
  v5 = +[UIVibrancyEffect effectForBlurEffect:v4 style:6];
  [v3 setEffect:v5];

  v6 = +[UIColor whiteColor];
  [v3 setContentBackgroundColor:v6];

  [v3 setBackgroundShape:v2];
  return v3;
}

id __37___UIContextMenuPlatformMetrics_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  v3 = (void **)MEMORY[0x1E4F3A2E0];
  if (v2 == 2) {
    v3 = (void **)MEMORY[0x1E4F3A2E8];
  }
  v4 = *v3;
  return v4;
}

UIColor *__37___UIContextMenuPlatformMetrics_init__block_invoke_3(uint64_t a1, void *a2)
{
  [a2 userInterfaceStyle];
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:");
}

UIColor *__37___UIContextMenuPlatformMetrics_init__block_invoke_4(uint64_t a1, void *a2)
{
  double v2 = dbl_186B9E830[[a2 userInterfaceStyle] == 2];
  return +[UIColor colorWithWhite:0.0 alpha:v2];
}

double __37___UIContextMenuPlatformMetrics_init__block_invoke_5(double a1, double a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  id v11 = v9;
  v12 = [v10 layer];
  v13 = [v11 layer];
  uint64_t v14 = [v12 presentationLayer];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [v13 presentationLayer];
    if (v16 && (_UILayerAncestorsHaveAllBeenCommitted(v12) & 1) != 0)
    {
      int HaveAllBeenCommitted = _UILayerAncestorsHaveAllBeenCommitted(v13);

      if (!HaveAllBeenCommitted) {
        goto LABEL_8;
      }
      uint64_t v18 = [v12 presentationLayer];

      [v13 presentationLayer];
      v13 = v15 = v13;
      v12 = (void *)v18;
    }
    else
    {
    }
  }
LABEL_8:
  v19 = [v10 _window];
  v20 = [v11 _window];
  v21 = [v19 windowScene];
  uint64_t v22 = [v20 windowScene];
  v23 = (void *)v22;
  if (v19 == v20)
  {
    objc_msgSend(v12, "convertPoint:toLayer:", v13, a1, a2);
    double v34 = v35;
  }
  else if (v22 && v21 && v21 != (void *)v22)
  {
    [v21 screen];
    v25 = v24 = v12;
    v26 = [v25 fixedCoordinateSpace];
    objc_msgSend(v26, "convertPoint:fromCoordinateSpace:", v10, a1, a2);
    double v28 = v27;
    double v30 = v29;

    v31 = [v23 screen];
    v32 = [v31 fixedCoordinateSpace];
    objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v32, v28, v30);
    double v34 = v33;

    v12 = v24;
  }
  else
  {
    v46 = v13;
    v36 = [v19 layer];
    v37 = [v20 layer];
    uint64_t v38 = [v36 presentationLayer];
    if (v38)
    {
      v39 = (void *)v38;
      v45 = v12;
      v40 = [v37 presentationLayer];

      if (v40)
      {
        uint64_t v41 = [v36 presentationLayer];

        uint64_t v42 = [v37 presentationLayer];

        v37 = (void *)v42;
        v36 = (void *)v41;
      }
      v12 = v45;
    }
    objc_msgSend(v12, "convertPoint:toLayer:", v36, a1, a2);
    objc_msgSend(v46, "convertPoint:fromLayer:", v37);
    double v34 = v43;

    v13 = v46;
  }

  return v34;
}

id __37___UIContextMenuPlatformMetrics_init__block_invoke_6(uint64_t a1, char a2)
{
  if ((a2 & 2) != 0) {
    +[UIColor secondaryLabelColor];
  }
  else {
  double v2 = +[UIColor labelColor];
  }
  return v2;
}

UIColor *__37___UIContextMenuPlatformMetrics_init__block_invoke_7()
{
  return +[UIColor systemRedColor];
}

double __37___UIContextMenuPlatformMetrics_init__block_invoke_8(double a1, double a2)
{
  double result = (45.0 - a2) * 0.5;
  if (result < 4.0) {
    return 4.0;
  }
  return result;
}

BOOL __37___UIContextMenuPlatformMetrics_init__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 verticalSizeClass] == 1;
}

@end