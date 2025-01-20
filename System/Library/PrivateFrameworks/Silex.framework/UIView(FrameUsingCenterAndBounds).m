@interface UIView(FrameUsingCenterAndBounds)
- (double)frameUsingCenterAndBounds;
- (void)setFrameUsingCenterAndBounds:()FrameUsingCenterAndBounds;
@end

@implementation UIView(FrameUsingCenterAndBounds)

- (double)frameUsingCenterAndBounds
{
  v2 = [a1 layer];
  [v2 anchorPoint];
  double v4 = v3;
  double v6 = v5;

  v7 = [a1 layer];
  objc_msgSend(v7, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  [a1 bounds];
  [a1 center];
  double v9 = v8;
  [a1 bounds];
  double v11 = v9 - v10 * 0.5;
  [a1 center];
  [a1 bounds];
  v12 = [a1 layer];
  objc_msgSend(v12, "setAnchorPointWithoutChangingPosition:", v4, v6);

  return v11;
}

- (void)setFrameUsingCenterAndBounds:()FrameUsingCenterAndBounds
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v10 = [a1 layer];
  double v11 = v10;
  if (v10)
  {
    [v10 transform];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
  }

  v12 = [a1 layer];
  [v12 anchorPoint];
  double v14 = v13;
  double v16 = v15;

  v17 = [a1 layer];
  long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v28[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v28[5] = v18;
  long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v28[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v28[7] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v28[0] = *MEMORY[0x263F15740];
  v28[1] = v20;
  long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v28[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v28[3] = v21;
  [v17 setTransform:v28];

  v22 = [a1 layer];
  objc_msgSend(v22, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  [a1 bounds];
  double v24 = v23;
  [a1 bounds];
  [a1 setBounds:v24];
  objc_msgSend(a1, "setCenter:", a2 + a4 * 0.5, a3 + a5 * 0.5);
  v25 = [a1 layer];
  objc_msgSend(v25, "setAnchorPointWithoutChangingPosition:", v14, v16);

  v26 = [a1 layer];
  v27[4] = v33;
  v27[5] = v34;
  v27[6] = v35;
  v27[7] = v36;
  v27[0] = v29;
  v27[1] = v30;
  v27[2] = v31;
  v27[3] = v32;
  [v26 setTransform:v27];
}

@end