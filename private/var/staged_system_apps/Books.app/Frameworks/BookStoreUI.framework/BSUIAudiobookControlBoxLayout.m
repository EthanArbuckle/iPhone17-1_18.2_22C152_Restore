@interface BSUIAudiobookControlBoxLayout
- (double)computeIntrinsicAspectRatio;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
@end

@implementation BSUIAudiobookControlBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  [(BSUIAudiobookControlBoxLayout *)self computedNaturalSize];
  double v6 = v5;
  double v8 = v7;
  v9 = [(BSUIAudiobookControlBoxLayout *)self box];
  v10 = [v9 identifier];
  v11 = [(BSUIAudiobookControlBoxLayout *)self box];
  v12 = [v11 dynamicAudiobookProgress];
  v13 = [(BSUIAudiobookControlBoxLayout *)self box];
  v14 = [v13 dynamicState];
  v15 = +[BSUIAudiobookControlView renderModelWithIdentifier:v10 dynamicProgress:v12 dynamicState:v14];

  [v15 setSize:v6, v8];
  return v15;
}

- (double)computeIntrinsicAspectRatio
{
  return 1.0;
}

@end