@interface UIStatusBarBatteryView
@end

@implementation UIStatusBarBatteryView

uint64_t __44___UIStatusBarBatteryView__batteryFillColor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessibilityContrast:*(void *)(a1 + 32)];
}

void __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setUserInterfaceStyle:v3];
  [v4 setAccessibilityContrast:*(void *)(a1 + 40)];
}

void __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setUserInterfaceStyle:v3];
  [v4 setAccessibilityContrast:*(void *)(a1 + 40)];
}

void __43___UIStatusBarBatteryView__updateFillColor__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBatteryFillColor];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[411])
  {
    uint64_t v3 = [v2 _batteryTextColor];
    int v4 = [*(id *)(a1 + 32) _batteryTextIsCutout];
    if (+[UIView _isInAnimationBlock])
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 496);
      +[UIView _currentAnimationDuration];
      double v7 = v6;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43___UIStatusBarBatteryView__updateFillColor__block_invoke_2;
      v10[3] = &unk_1E52DC3D0;
      v10[4] = *(void *)(a1 + 32);
      id v11 = v3;
      char v12 = v4;
      +[UIView transitionWithView:v5 duration:5242880 options:v10 animations:0 completion:v7];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 496) setTextColor:v3];
      if (v4)
      {
        v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
      }
      else
      {
        v8 = 0;
      }
      v9 = [*(id *)(*(void *)(a1 + 32) + 496) layer];
      [v9 setCompositingFilter:v8];

      if (v4) {
    }
      }
  }
}

void __43___UIStatusBarBatteryView__updateFillColor__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 496) setTextColor:*(void *)(a1 + 40)];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 496) layer];
  [v3 setCompositingFilter:v4];

  if (v2)
  {
  }
}

uint64_t __38___UIStatusBarBatteryView__updateBolt__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 536);
  long long v3 = *(_OWORD *)(a1 + 120);
  v17[4] = *(_OWORD *)(a1 + 104);
  v17[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v17[6] = *(_OWORD *)(a1 + 136);
  v17[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v17[0] = *(_OWORD *)(a1 + 40);
  v17[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v17[2] = *(_OWORD *)(a1 + 72);
  v17[3] = v6;
  [v2 setTransform:v17];
  LODWORD(v7) = 1.0;
  [*(id *)(*(void *)(a1 + 32) + 536) setOpacity:v7];
  v8 = *(void **)(*(void *)(a1 + 32) + 528);
  long long v9 = *(_OWORD *)(a1 + 120);
  v16[4] = *(_OWORD *)(a1 + 104);
  v16[5] = v9;
  long long v10 = *(_OWORD *)(a1 + 152);
  v16[6] = *(_OWORD *)(a1 + 136);
  v16[7] = v10;
  long long v11 = *(_OWORD *)(a1 + 56);
  v16[0] = *(_OWORD *)(a1 + 40);
  v16[1] = v11;
  long long v12 = *(_OWORD *)(a1 + 88);
  v16[2] = *(_OWORD *)(a1 + 72);
  v16[3] = v12;
  [v8 setTransform:v16];
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = 0.0;
  if (!*(unsigned char *)(v13 + 411)) {
    *(float *)&double v14 = 1.0;
  }
  [*(id *)(v13 + 528) setOpacity:v14];
  return [*(id *)(a1 + 32) _unflipBoltIfNecessary];
}

uint64_t __38___UIStatusBarBatteryView__updateBolt__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDidFinishAnimatingBoltToVisible:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __38___UIStatusBarBatteryView__updateBolt__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 536) opacity];
  if (v2 == 0.0)
  {
    [*(id *)(*(void *)(a1 + 32) + 536) removeFromSuperlayer];
    [*(id *)(*(void *)(a1 + 32) + 512) setMask:0];
  }
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  return [v3 _notifyDidFinishAnimatingBoltToVisible:v4];
}

id __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *(void *)off_1E52D6B98;
  uint64_t v2 = *(void *)off_1E52D6BD0;
  v13[0] = *(void *)off_1E52D6BC0;
  uint64_t v3 = *(void *)off_1E52D6C08;
  v12[0] = v2;
  v12[1] = v3;
  uint64_t v4 = [NSNumber numberWithDouble:*(double *)off_1E52D6BD8];
  v13[1] = v4;
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v5;
  long long v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  double v7 = [off_1E52D39C0 fontDescriptorWithFontAttributes:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48) && *(void *)(v8 + 464) || *(double *)(v8 + 456) >= 0.995)
  {
    uint64_t v9 = [v7 fontDescriptorWithSymbolicTraits:66];

    double v7 = (void *)v9;
  }
  long long v10 = [off_1E52D39B8 fontWithDescriptor:v7 size:*(double *)(a1 + 40)];

  return v10;
}

uint64_t __44___UIStatusBarBatteryView__updatePercentage__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:1.0];
}

uint64_t __44___UIStatusBarBatteryView__updatePercentage__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:0.0];
}

uint64_t __44___UIStatusBarBatteryView_setChargePercent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBolt];
}

uint64_t __44___UIStatusBarBatteryView_setChargePercent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLightningBoltAndPercentagePosition];
}

uint64_t __44___UIStatusBarBatteryView_setChargingState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLightningBoltAndPercentagePosition];
}

uint64_t __46___UIStatusBarBatteryView_setShowsPercentage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLightningBoltAndPercentagePosition];
}

@end