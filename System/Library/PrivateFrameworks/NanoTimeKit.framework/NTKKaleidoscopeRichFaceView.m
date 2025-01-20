@interface NTKKaleidoscopeRichFaceView
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (id)_newComplicationFactoryForDevice:(id)a3;
- (void)_updateComplicationColors;
@end

@implementation NTKKaleidoscopeRichFaceView

- (id)_newComplicationFactoryForDevice:(id)a3
{
  id v4 = a3;
  v5 = [[NTKColorCircularUtilitarianFaceViewComplicationFactory alloc] initWithFaceView:self device:v4 graphicCornerComplications:1];

  [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)v5 setFaceView:self];
  return v5;
}

- (void)_updateComplicationColors
{
  v4.receiver = self;
  v4.super_class = (Class)NTKKaleidoscopeRichFaceView;
  [(NTKKaleidoscopeFaceView *)&v4 _updateComplicationColors];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__NTKKaleidoscopeRichFaceView__updateComplicationColors__block_invoke;
  v3[3] = &unk_1E62C87B0;
  v3[4] = self;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v3];
}

void __56__NTKKaleidoscopeRichFaceView__updateComplicationColors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = *(void **)(a1 + 32);
    id v5 = v7;
    v6 = [v4 complicationColor];
    [*(id *)(a1 + 32) setComplicationColor:v6];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v6];
    [v5 updateMonochromeColor];
  }
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isEqualToString:@"top-left"] & 1) != 0
    || [v6 isEqualToString:@"top-right"])
  {
    id v7 = [(NTKFaceView *)self complicationFactory];
    [v7 keylineFrameForCornerComplicationSlot:v6 selected:v4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKKaleidoscopeRichFaceView;
    [(NTKFaceView *)&v24 _keylineFrameForComplicationSlot:v6 selected:v4];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end