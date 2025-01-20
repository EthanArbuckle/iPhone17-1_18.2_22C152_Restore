@interface UIView(SBSystemActionPreviewPresentable)
- (void)_popWithBlock:()SBSystemActionPreviewPresentable;
- (void)_shakeWithBlock:()SBSystemActionPreviewPresentable;
- (void)sb_animateStateChangeWithBlock:()SBSystemActionPreviewPresentable style:;
- (void)sb_setInflated:()SBSystemActionPreviewPresentable;
@end

@implementation UIView(SBSystemActionPreviewPresentable)

- (void)sb_animateStateChangeWithBlock:()SBSystemActionPreviewPresentable style:
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    id v8 = v6;
    [a1 _shakeWithBlock:v6];
  }
  else if (a4 == 1)
  {
    id v8 = v6;
    [a1 _popWithBlock:v6];
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    id v8 = v6;
    (*((void (**)(id))v6 + 2))(v6);
  }
  v7 = v8;
LABEL_8:
}

- (void)sb_setInflated:()SBSystemActionPreviewPresentable
{
  v5 = +[SBSystemApertureDomain rootSettings];
  id v6 = v5;
  if (a3)
  {
    v7 = [v5 inflateAnimationScaleUpSettings];
    memset(&v11, 0, sizeof(v11));
    CGAffineTransformMakeScale(&v11, 1.1, 1.1);
  }
  else
  {
    v7 = [v5 inflateAnimationScaleDownSettings];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11.c = v8;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  CGAffineTransform v10 = v11;
  v9[2] = __59__UIView_SBSystemActionPreviewPresentable__sb_setInflated___block_invoke;
  v9[3] = &unk_1E6AFAB40;
  v9[4] = a1;
  objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v7, 3, v9, 0);
}

- (void)_popWithBlock:()SBSystemActionPreviewPresentable
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F42FF0];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v6 setBehaviorType:1];
  [v6 setDampingRatio:0.6];
  [v6 setDampingRatioSmoothing:0.0];
  [v6 setResponse:0.5];
  [v6 setResponseSmoothing:0.0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__UIView_SBSystemActionPreviewPresentable___popWithBlock___block_invoke;
  v10[3] = &unk_1E6AF6828;
  v10[4] = a1;
  id v11 = v4;
  id v7 = v4;
  objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v6, 3, v10, 0);

  dispatch_time_t v8 = dispatch_time(0, 275000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIView_SBSystemActionPreviewPresentable___popWithBlock___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = a1;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

- (void)_shakeWithBlock:()SBSystemActionPreviewPresentable
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F42FF0];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v6 setBehaviorType:1];
  [v6 setDampingRatio:0.17678];
  [v6 setDampingRatioSmoothing:0.0];
  [v6 setResponse:0.22214];
  [v6 setResponseSmoothing:0.0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__UIView_SBSystemActionPreviewPresentable___shakeWithBlock___block_invoke;
  v10[3] = &unk_1E6AF6828;
  v10[4] = a1;
  id v11 = v4;
  id v7 = v4;
  objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v6, 3, v10, 0);

  dispatch_time_t v8 = dispatch_time(0, 275000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__UIView_SBSystemActionPreviewPresentable___shakeWithBlock___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = a1;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

@end