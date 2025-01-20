@interface UIStatusBarStaticBatteryView
@end

@implementation UIStatusBarStaticBatteryView

void __101___UIStatusBarStaticBatteryView__imageWithRenderedBezierPath_size_scale_pathScaleFactor_stroke_fill___block_invoke(uint64_t a1, void *a2)
{
  CGContextScaleCTM((CGContextRef)[a2 CGContext], *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stroke];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v3 = *(void **)(a1 + 32);
    [v3 fill];
  }
}

uint64_t __111___UIStatusBarStaticBatteryView__imageByPunchingImage_inRect_flippedHorizontally_outOfImage_inRect_size_scale___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), 1.0);
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  double v5 = *(double *)(a1 + 96);
  double v6 = *(double *)(a1 + 104);
  return objc_msgSend(v2, "drawInRect:blendMode:alpha:", 23, v3, v4, v5, v6, 1.0);
}

void __110___UIStatusBarStaticBatteryView__batteryBodyImageWithSize_forScale_batteryRect_cornerRadius_lineWidth_filled___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)_MergedGlobals_1059;
  _MergedGlobals_1059 = v0;
}

void __143___UIStatusBarStaticBatteryView__batteryBodyImageWithSize_forScale_batteryRect_cornerRadius_lineWidth_withBoltCutOutOfSize_inRect_boltFlipped___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB260888;
  qword_1EB260888 = v0;
}

void __103___UIStatusBarStaticBatteryView__percentFillImageWithSize_forScale_batteryRect_cornerRadius_lineWidth___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB260898;
  qword_1EB260898 = v0;
}

void __82___UIStatusBarStaticBatteryView__batteryPinImageWithSize_forScale_complexPinPath___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB2608A8;
  qword_1EB2608A8 = v0;
}

void __77___UIStatusBarStaticBatteryView__batteryBoltImageWithSize_boltSize_forScale___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB2608B8;
  qword_1EB2608B8 = v0;
}

void __81___UIStatusBarStaticBatteryView__batteryBoltMaskImageWithSize_boltSize_forScale___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB2608C8;
  qword_1EB2608C8 = v0;
}

void __81___UIStatusBarStaticBatteryView__batteryFillImageWithSize_forScale_cornerRadius___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB2608D8;
  qword_1EB2608D8 = v0;
}

void __121___UIStatusBarStaticBatteryView__batteryFillImageWithSize_forScale_cornerRadius_withBoltCutOutOfSize_inRect_boltFlipped___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB2608E8;
  qword_1EB2608E8 = v0;
}

@end