@interface UIView(VideosUICore)
+ (id)_timingFuctionWithOptions:()VideosUICore;
+ (uint64_t)vui_animateWithDuration:()VideosUICore animations:;
+ (uint64_t)vui_animateWithDuration:()VideosUICore animations:completion:;
+ (uint64_t)vui_animateWithDuration:()VideosUICore delay:options:animations:completion:;
+ (uint64_t)vui_performByPreventingAdditiveAnimations:()VideosUICore;
+ (uint64_t)vui_performWithoutAnimation:()VideosUICore;
+ (uint64_t)vui_transitionWithView:()VideosUICore duration:options:animations:completion:;
- (BOOL)vuiIsRTL;
- (double)vui_alignmentInsetsForExpectedWidth:()VideosUICore;
- (double)vui_layoutSubviews:()VideosUICore computationOnly:;
- (uint64_t)setVuiAlpha:()VideosUICore;
- (uint64_t)setVuiContentMode:()VideosUICore;
- (uint64_t)vuiDebugUI;
- (uint64_t)vui_addSubview:()VideosUICore oldView:;
- (uint64_t)vui_highlighted;
- (uint64_t)vui_insertSubview:()VideosUICore aboveSubview:oldView:;
- (uint64_t)vui_insertSubview:()VideosUICore belowSubview:oldView:;
- (uint64_t)vui_setOverrideUserInterfaceStyle:()VideosUICore;
- (unint64_t)vuiContentMode;
- (unint64_t)vuiOverrideUserInterfaceStyle;
- (unint64_t)vuiUserInterfaceStyle;
- (void)vui_performAsCurrentTraitCollection:()VideosUICore;
- (void)vui_registerForTraitChanges:()VideosUICore withHandler:;
- (void)vui_removeFromSuperView;
@end

@implementation UIView(VideosUICore)

- (uint64_t)vui_addSubview:()VideosUICore oldView:
{
  unint64_t v6 = a3;
  unint64_t v7 = a4;
  v8 = (void *)v7;
  if (v7 == v6)
  {
    if (v7)
    {
      v10 = [(id)v7 superview];

      if (!v10)
      {
        [a1 addSubview:v8];
        if ([a1 vuiDebugUI])
        {
          v11 = +[VUICoreUtilities randomColor];
          v12 = v8;
          goto LABEL_13;
        }
LABEL_14:
        uint64_t v9 = 1;
        goto LABEL_15;
      }
    }
  }
  else if (v6 | v7)
  {
    objc_msgSend((id)v7, "vui_removeFromSuperView");
    if (!v6 || (objc_msgSend((id)v6, "vui_isDescendantOfView:", a1) & 1) != 0)
    {
      uint64_t v9 = 0;
LABEL_15:
      objc_msgSend(a1, "vui_setNeedsLayout");
      goto LABEL_16;
    }
    [a1 addSubview:v6];
    if ([a1 vuiDebugUI])
    {
      v11 = +[VUICoreUtilities randomColor];
      v12 = (void *)v6;
LABEL_13:
      [v12 setVuiBackgroundColor:v11];

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v9 = 0;
LABEL_16:

  return v9;
}

- (uint64_t)vuiDebugUI
{
  return 0;
}

- (void)vui_registerForTraitChanges:()VideosUICore withHandler:
{
  id v8 = a4;
  unint64_t v6 = +[VUITraitBaseClass uiTraitsFrom:a3];
  id v7 = (id)[a1 registerForTraitChanges:v6 withHandler:v8];
}

- (unint64_t)vuiContentMode
{
  unint64_t v1 = [a1 contentMode];
  return VUIViewContentModeFromUIContentMode(v1);
}

- (uint64_t)setVuiContentMode:()VideosUICore
{
  unint64_t v4 = VUIUIViewContentModeFromVUIContentMode(a3);
  return [a1 setContentMode:v4];
}

+ (uint64_t)vui_performWithoutAnimation:()VideosUICore
{
  return objc_msgSend(MEMORY[0x1E4F42FF0], "performWithoutAnimation:");
}

- (BOOL)vuiIsRTL
{
  return [a1 effectiveUserInterfaceLayoutDirection] == 1;
}

- (uint64_t)setVuiAlpha:()VideosUICore
{
  uint64_t result = [a1 vuiAlpha];
  if (v5 != a2)
  {
    return [a1 setAlpha:a2];
  }
  return result;
}

- (double)vui_layoutSubviews:()VideosUICore computationOnly:
{
  if (!a3) {
    return *MEMORY[0x1E4F1DB30];
  }
  [a1 bounds];
  return v3;
}

- (unint64_t)vuiUserInterfaceStyle
{
  unint64_t v1 = [a1 traitCollection];
  uint64_t v2 = [v1 userInterfaceStyle];

  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:v2];
}

- (unint64_t)vuiOverrideUserInterfaceStyle
{
  uint64_t v1 = [a1 overrideUserInterfaceStyle];
  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:v1];
}

- (uint64_t)vui_setOverrideUserInterfaceStyle:()VideosUICore
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  return [a1 setOverrideUserInterfaceStyle:v3];
}

- (uint64_t)vui_insertSubview:()VideosUICore aboveSubview:oldView:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10 == v8)
    {
      uint64_t v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "vui_removeFromSuperView");
      if (v8 && (objc_msgSend(v8, "vui_isDescendantOfView:", a1) & 1) == 0)
      {
        [a1 insertSubview:v8 aboveSubview:v9];
        if ([a1 vuiDebugUI])
        {
          v13 = +[VUICoreUtilities randomColor];
          [v8 setVuiBackgroundColor:v13];
        }
        uint64_t v12 = 1;
      }
      else
      {
        uint64_t v12 = 0;
      }
      objc_msgSend(a1, "vui_setNeedsLayout");
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(a1, "vui_addSubview:oldView:", v8, v10);
  }

  return v12;
}

- (uint64_t)vui_insertSubview:()VideosUICore belowSubview:oldView:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10 == v8)
    {
      uint64_t v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "vui_removeFromSuperView");
      if (v8 && (objc_msgSend(v8, "vui_isDescendantOfView:", a1) & 1) == 0)
      {
        [a1 insertSubview:v8 belowSubview:v9];
        if ([a1 vuiDebugUI])
        {
          v13 = +[VUICoreUtilities randomColor];
          [v8 setVuiBackgroundColor:v13];
        }
        uint64_t v12 = 1;
      }
      else
      {
        uint64_t v12 = 0;
      }
      objc_msgSend(a1, "vui_setNeedsLayout");
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(a1, "vui_addSubview:oldView:", v8, v10);
  }

  return v12;
}

- (void)vui_removeFromSuperView
{
  uint64_t v2 = [a1 superview];

  if (v2)
  {
    [a1 removeFromSuperview];
  }
}

+ (uint64_t)vui_performByPreventingAdditiveAnimations:()VideosUICore
{
  return [MEMORY[0x1E4F42FF0] animateWithDuration:2048 delay:a3 options:0 animations:0.0 completion:0.0];
}

- (void)vui_performAsCurrentTraitCollection:()VideosUICore
{
  id v4 = a3;
  double v5 = [a1 traitCollection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__UIView_VideosUICore__vui_performAsCurrentTraitCollection___block_invoke;
  v7[3] = &unk_1E6DDCEB0;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsCurrentTraitCollection:v7];
}

- (double)vui_alignmentInsetsForExpectedWidth:()VideosUICore
{
  return *MEMORY[0x1E4F437F8];
}

- (uint64_t)vui_highlighted
{
  return 0;
}

+ (uint64_t)vui_animateWithDuration:()VideosUICore delay:options:animations:completion:
{
  return objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:delay:options:animations:completion:");
}

+ (uint64_t)vui_animateWithDuration:()VideosUICore animations:completion:
{
  return objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:animations:completion:");
}

+ (uint64_t)vui_animateWithDuration:()VideosUICore animations:
{
  return objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:animations:");
}

+ (uint64_t)vui_transitionWithView:()VideosUICore duration:options:animations:completion:
{
  return objc_msgSend(MEMORY[0x1E4F42FF0], "transitionWithView:duration:options:animations:completion:");
}

+ (id)_timingFuctionWithOptions:()VideosUICore
{
  uint64_t v3 = (void *)MEMORY[0x1E4F3A498];
  if ((*(void *)&a3 & 0x20000) == 0) {
    uint64_t v3 = (void *)MEMORY[0x1E4F3A480];
  }
  if ((*(void *)&a3 & 0x10000) != 0) {
    uint64_t v3 = (void *)MEMORY[0x1E4F3A488];
  }
  id v4 = [MEMORY[0x1E4F39C10] functionWithName:*v3];
  return v4;
}

@end