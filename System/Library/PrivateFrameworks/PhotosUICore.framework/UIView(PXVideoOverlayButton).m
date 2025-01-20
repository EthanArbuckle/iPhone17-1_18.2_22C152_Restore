@interface UIView(PXVideoOverlayButton)
+ (double)px_videoOverlayButtonSize;
+ (double)px_videoOverlayButtonSizeWithConfiguration:()PXVideoOverlayButton;
+ (id)px_videoOverlayButtonWithConfiguration:()PXVideoOverlayButton;
+ (id)px_videoOverlayButtonWithStyle:()PXVideoOverlayButton allowBackdropStatisticsSupression:;
+ (uint64_t)px_videoOverlayButtonWithStyle:()PXVideoOverlayButton;
+ (void)px_preloadResourcesForVideoOverlayButtonWithStyle:()PXVideoOverlayButton;
@end

@implementation UIView(PXVideoOverlayButton)

+ (double)px_videoOverlayButtonSizeWithConfiguration:()PXVideoOverlayButton
{
  id v4 = a3;
  if (px_videoOverlayButtonSizeWithConfiguration__onceToken != -1) {
    dispatch_once(&px_videoOverlayButtonSizeWithConfiguration__onceToken, &__block_literal_global_49284);
  }
  if ([v4 style] == 5)
  {
    v5 = (void *)px_videoOverlayButtonSizeWithConfiguration__cachedSizes;
    v6 = [v4 localizedTitle];
    v7 = [v5 objectForKey:v6];

    if (!v7)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      v12 = [v4 localizedTitle];
      [v11 setText:v12];

      objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      PXSizeCeilingToPixel();
    }
    [v7 CGSizeValue];
    double v9 = v8;
  }
  else
  {
    objc_msgSend(a1, "px_videoOverlayButtonSize");
    double v9 = v10;
  }

  return v9;
}

+ (double)px_videoOverlayButtonSize
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "px_playOverlayImage:", 1);
  [v0 size];
  double v2 = v1;

  return v2;
}

+ (uint64_t)px_videoOverlayButtonWithStyle:()PXVideoOverlayButton
{
  return objc_msgSend(a1, "px_videoOverlayButtonWithStyle:allowBackdropStatisticsSupression:", a3, 1);
}

+ (id)px_videoOverlayButtonWithStyle:()PXVideoOverlayButton allowBackdropStatisticsSupression:
{
  v7 = objc_opt_new();
  [v7 setStyle:a3];
  [v7 setAllowBackdropStatisticsSupression:a4];
  double v8 = objc_msgSend(a1, "px_videoOverlayButtonWithConfiguration:", v7);

  return v8;
}

+ (id)px_videoOverlayButtonWithConfiguration:()PXVideoOverlayButton
{
  id v3 = a3;
  uint64_t v4 = [v3 style];
  BOOL v5 = (unint64_t)(v4 - 2) < 2 || v4 == 5;
  if (!v5
    && (v4
     || (+[PXKitSettings sharedInstance],
         v7 = objc_claimAutoreleasedReturnValue(),
         uint64_t v8 = [v7 deviceGraphicsQuality],
         v7,
         v8)))
  {
    v6 = off_1E5DA6DD8;
  }
  else
  {
    v6 = off_1E5DA6578;
  }
  double v9 = (void *)[objc_alloc(*v6) initWithConfiguration:v3];

  return v9;
}

+ (void)px_preloadResourcesForVideoOverlayButtonWithStyle:()PXVideoOverlayButton
{
  BOOL v5 = +[PXPreloadScheduler sharedScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__UIView_PXVideoOverlayButton__px_preloadResourcesForVideoOverlayButtonWithStyle___block_invoke;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = a1;
  [v5 scheduleMainQueueTask:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__UIView_PXVideoOverlayButton__px_preloadResourcesForVideoOverlayButtonWithStyle___block_invoke_2;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a1;
  v6[5] = a3;
  [v5 scheduleMainQueueTask:v6];
}

@end