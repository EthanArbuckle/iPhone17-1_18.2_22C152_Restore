@interface CALayer(FrameUsingCenterAndBounds)
- (double)frameUsingCenterAndBounds;
- (uint64_t)setFrameUsingCenterAndBounds:()FrameUsingCenterAndBounds;
@end

@implementation CALayer(FrameUsingCenterAndBounds)

- (double)frameUsingCenterAndBounds
{
  [a1 anchorPoint];
  double v3 = v2;
  double v5 = v4;
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);
  [a1 bounds];
  [a1 position];
  double v7 = v6;
  [a1 bounds];
  double v9 = v7 - v8 * 0.5;
  [a1 position];
  [a1 bounds];
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", v3, v5);
  return v9;
}

- (uint64_t)setFrameUsingCenterAndBounds:()FrameUsingCenterAndBounds
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  [a1 transform];
  [a1 anchorPoint];
  double v11 = v10;
  double v13 = v12;
  long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v22[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v22[5] = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v22[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v22[7] = v15;
  long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v22[0] = *MEMORY[0x263F15740];
  v22[1] = v16;
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v22[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v22[3] = v17;
  [a1 setTransform:v22];
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);
  [a1 bounds];
  double v19 = v18;
  [a1 bounds];
  [a1 setBounds:v19];
  objc_msgSend(a1, "setPosition:", a2 + a4 * 0.5, a3 + a5 * 0.5);
  objc_msgSend(a1, "setAnchorPointWithoutChangingPosition:", v11, v13);
  v21[4] = v27;
  v21[5] = v28;
  v21[6] = v29;
  v21[7] = v30;
  v21[0] = v23;
  v21[1] = v24;
  v21[2] = v25;
  v21[3] = v26;
  return [a1 setTransform:v21];
}

@end