@interface LAUIHorizontalArrowView(PKAdditions)
+ (uint64_t)pkui_cameraEdgeForScreen:()PKAdditions;
- (uint64_t)pkui_updateFrame;
@end

@implementation LAUIHorizontalArrowView(PKAdditions)

+ (uint64_t)pkui_cameraEdgeForScreen:()PKAdditions
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  id v17 = 0;
  double v4 = PKUIFrontCameraCurrentPosition(v3, &v17);
  double v6 = v5;
  [v17 bounds];
  if (v4 <= v7)
  {
    uint64_t v15 = 0;
  }
  else
  {
    CGFloat v11 = v7;
    double v12 = v8;
    CGFloat v13 = v9;
    CGFloat v14 = v10;
    if (v4 >= CGRectGetMaxX(*(CGRect *)&v7))
    {
      uint64_t v15 = 2;
    }
    else if (v6 <= v12)
    {
      uint64_t v15 = 1;
    }
    else
    {
      v18.origin.x = v11;
      v18.origin.y = v12;
      v18.size.width = v13;
      v18.size.height = v14;
      if (v6 >= CGRectGetMaxY(v18)) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 1;
      }
    }
  }

  return v15;
}

- (uint64_t)pkui_updateFrame
{
  v2 = [a1 superview];
  id v3 = v2;
  if (v2)
  {
    double v4 = [v2 window];
    uint64_t v5 = [v4 screen];
    if (v5)
    {
      double v6 = (void *)v5;
    }
    else
    {
      double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];

      if (!v6) {
        goto LABEL_7;
      }
    }
    CGRectEdge v8 = objc_msgSend((id)objc_opt_class(), "pkui_cameraEdgeForScreen:", v6);
    if ((v8 & 0xFFFFFFFD) != 1)
    {
      CGRectEdge v9 = v8;
      [a1 frame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGRect v18 = [v6 coordinateSpace];
      [v18 bounds];
      objc_msgSend(v3, "convertRect:fromCoordinateSpace:", v18, 0, 0, 0, 0);
      CGRect remainder = v30;
      CGRectDivide(v30, &v28, &remainder, 80.0, v9);
      CGRectDivide(remainder, &v28, &remainder, v15, v9);
      [a1 setDirection:v9 != CGRectMinXEdge];
      PKFloatRoundToPixel();
      objc_msgSend(a1, "setDisplacement:");
      PKSizeAlignedInRect();
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      v31.origin.x = v11;
      v31.origin.y = v13;
      v31.size.width = v15;
      v31.size.height = v17;
      v32.origin.x = v20;
      v32.origin.y = v22;
      v32.size.width = v24;
      v32.size.height = v26;
      if (!CGRectEqualToRect(v31, v32)) {
        objc_msgSend(a1, "setFrame:", v20, v22, v24, v26);
      }

      uint64_t v7 = 1;
      goto LABEL_11;
    }
LABEL_7:
    uint64_t v7 = 0;
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v7 = 0;
LABEL_12:

  return v7;
}

@end