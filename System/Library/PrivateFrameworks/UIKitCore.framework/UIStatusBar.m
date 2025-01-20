@interface UIStatusBar
+ (BOOL)_isLightContentStyle:(int64_t)a3;
+ (BOOL)_shouldForwardToImplementationClassForStyle:(int64_t)a3;
+ (NSDirectionalEdgeInsets)_regularPadEdgeInsets;
+ (NSDirectionalEdgeInsets)_roundedPadEdgeInsets;
+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7;
+ (double)_regularPadBaselineOffset;
+ (double)_roundedPadBaselineOffset;
+ (double)_viewControllerAdjustmentForOrientation:(int64_t)a3 inWindow:(id)a4;
+ (id)_newStyleAttributesForRequest:(id)a3;
+ (id)_styleAttributesForRequest:(id)a3;
+ (id)_styleAttributesForStatusBarStyle:(int64_t)a3;
+ (int64_t)_deviceUserInterfaceLayoutDirection;
+ (int64_t)lowBatteryLevel;
+ (void)_setDeviceUserInterfaceLayoutDirection:(int64_t)a3;
+ (void)enumerateStatusBarStyleOverridesWithBlock:(id)a3;
+ (void)getData:(id *)a3 forRequestedData:(id *)a4 withOverrides:(id *)a5;
- (BOOL)_isTransparent;
- (BOOL)_rectIntersectsTimeItem:(CGRect)a3;
- (BOOL)_shouldReverseLayoutDirection;
- (BOOL)_shouldSeekHigherPriorityTouchTarget;
- (BOOL)_shouldUseInProcessProviderDoubleHeightStatusString;
- (BOOL)_touchShouldProduceReturnEvent;
- (BOOL)disablesRasterization;
- (BOOL)isDoubleHeight;
- (BOOL)isTimeHidden;
- (BOOL)isTranslucent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGAffineTransform)_slideTransform;
- (CGRect)_backgroundFrameForAttributes:(id)a3;
- (CGRect)frameForOrientation:(int64_t)a3;
- (CGRect)frameForPartWithIdentifier:(id)a3;
- (double)defaultDoubleHeight;
- (double)defaultHeight;
- (double)heightForOrientation:(int64_t)a3;
- (id)_backgroundView;
- (id)_currentComposedData;
- (id)_currentComposedDataForStyle:(id)a3;
- (id)_currentStyleAttributes;
- (id)_doubleHeightStatusStringForStyle:(int64_t)a3;
- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6;
- (id)_prepareInterruptedAnimationCompositeViewIncludingForeground:(BOOL)a3;
- (id)_prepareToSetStyle:(id)a3 animation:(int)a4 forced:(BOOL)a5;
- (id)_styleAttributesForRequest:(id)a3;
- (id)actionForPartWithIdentifier:(id)a3;
- (id)currentStyleRequestForStyle:(int64_t)a3;
- (id)disabledPartIdentifiers;
- (id)enabledPartIdentifiers;
- (id)statusBarWindow;
- (id)styleRequest;
- (int64_t)currentStyle;
- (void)_adjustDoubleHeightTextVisibility;
- (void)_beginDisablingRasterizationForReason:(id)a3;
- (void)_clearOverrideHeight;
- (void)_crossfadeToNewBackgroundView;
- (void)_crossfadeToNewForegroundViewWithAlpha:(double)a3;
- (void)_dateTimePreferencesUpdated;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_endDisablingRasterizationForReason:(id)a3;
- (void)_finishedSettingStyleWithOldHeight:(double)a3 newHeight:(double)a4 animation:(int)a5;
- (void)_itemViewPerformButtonAction:(id)a3;
- (void)_itemViewShouldBeginDisablingRasterization:(id)a3;
- (void)_itemViewShouldEndDisablingRasterization:(id)a3;
- (void)_noteStyleOverridesChangedLocally;
- (void)_performBlockWhileIgnoringForegroundViewChanges:(id)a3;
- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6;
- (void)_setDisablesRasterization:(BOOL)a3;
- (void)_setDoubleHeightStatusString:(id)a3;
- (void)_setFrameForStyle:(id)a3;
- (void)_setOverrideHeight:(double)a3;
- (void)_setStyle:(id)a3;
- (void)_setStyle:(id)a3 animation:(int)a4;
- (void)_setVisualAltitude:(double)a3;
- (void)_setVisualAltitudeBias:(CGSize)a3;
- (void)_statusBarDidAnimateRotation;
- (void)_statusBarWillAnimateRotation;
- (void)_swapToNewBackgroundView;
- (void)_swapToNewForegroundView;
- (void)_updateBackgroundFrame;
- (void)_updatePersistentAnimationsEnabledForForegroundView:(id)a3;
- (void)_updateShouldRasterize;
- (void)_updateUIWithStyleAttributes:(id)a3 animationParameters:(id)a4;
- (void)_updateUIWithStyleAttributes:(id)a3 animationParameters:(id)a4 forced:(BOOL)a5;
- (void)animateUnlock;
- (void)dealloc;
- (void)forceUpdateData:(BOOL)a3;
- (void)forceUpdateDoubleHeightStatus;
- (void)forceUpdateToData:(id *)a3 animated:(BOOL)a4;
- (void)forgetEitherSideHistory;
- (void)jiggleLockIcon;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)requestStyle:(int64_t)a3 animation:(int)a4 startTime:(double)a5 duration:(double)a6 curve:(int64_t)a7;
- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4;
- (void)setEnabledCenterItems:(id)a3 duration:(double)a4;
- (void)setEnabledPartIdentifiers:(id)a3;
- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4;
- (void)setForegroundColor:(id)a3 animationParameters:(id)a4;
- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setPersistentAnimationsEnabled:(BOOL)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setShowsOnlyCenterItems:(BOOL)a3;
- (void)setStyleRequest:(id)a3 animationParameters:(id)a4;
- (void)setSuppressesHiddenSideEffects:(BOOL)a3;
- (void)setTimeHidden:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTintColor:(id)a3 withDuration:(double)a4;
- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5;
- (void)statusBarServer:(id)a3 didReceiveGlowAnimationState:(BOOL)a4 forStyle:(int64_t)a5;
- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5;
- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4;
- (void)statusBarStateProvider:(id)a3 didChangeDoubleHeightStatusStringForStyle:(int64_t)a4;
- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UIStatusBar

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  id v12 = a6;
  if ([a1 _shouldForwardToImplementationClassForStyle:a3])
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_implementationClass"), "_heightForStyle:orientation:forStatusBarFrame:inWindow:isAzulBLinked:", a3, a4, v8, v12, v7);
    double v14 = v13;
  }
  else
  {
    v15 = [a1 _styleAttributesForStatusBarStyle:a3];
    [v15 heightForOrientation:a4];
    double v14 = v16;
  }
  return v14;
}

+ (BOOL)_shouldForwardToImplementationClassForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 400) < 6) {
    return 0;
  }
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class()) {
    return 0;
  }
  uint64_t v5 = [(id)objc_opt_class() _implementationClass];
  return v5 != objc_opt_class();
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 setAlpha:*(double *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 32);
    long long v5 = *(_OWORD *)(a1 + 64);
    long long v9 = *(_OWORD *)(a1 + 48);
    long long v10 = v5;
    long long v6 = *(_OWORD *)(a1 + 80);
  }
  else
  {
    [v3 setAlpha:1.0];
    uint64_t v4 = *(void **)(a1 + 32);
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v9 = *MEMORY[0x1E4F1DAB8];
    long long v10 = v7;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  long long v11 = v6;
  return [v4 setTransform:&v9];
}

+ (id)_styleAttributesForStatusBarStyle:(int64_t)a3
{
  uint64_t v4 = [[UIStatusBarStyleRequest alloc] initWithStyle:a3 legibilityStyle:0 foregroundColor:0 overrideHeight:0];
  long long v5 = [a1 _styleAttributesForRequest:v4];

  return v5;
}

+ (id)_styleAttributesForRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v5 = (void *)_styleAttributesForRequest__styles;
    if (!_styleAttributesForRequest__styles)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v7 = (void *)_styleAttributesForRequest__styles;
      _styleAttributesForRequest__styles = (uint64_t)v6;

      long long v5 = (void *)_styleAttributesForRequest__styles;
    }
    BOOL v8 = [v5 objectForKeyedSubscript:v4];
    if (!v8)
    {
      BOOL v8 = (void *)[a1 _newStyleAttributesForRequest:v4];
      if (v8) {
        [(id)_styleAttributesForRequest__styles setObject:v8 forKeyedSubscript:v4];
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_newStyleAttributesForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 style];
  uint64_t v6 = v5;
  if (v5 > 305)
  {
    switch(v5)
    {
      case 1001:
        long long v10 = UIStatusBarLockScreenStyleAttributes;
LABEL_30:
        BOOL v8 = (UIStatusBarExternalStyleAttributes *)[v10 alloc];
        double v17 = 0.141176471;
        double v18 = 0.517647059;
        double v19 = 0.909803922;
        goto LABEL_42;
      case 1002:
      case 1005:
      case 1015:
        long long v7 = UIStatusBarLockScreenStyleAttributes;
LABEL_6:
        BOOL v8 = (UIStatusBarExternalStyleAttributes *)[v7 alloc];
        uint64_t v9 = +[UIColor systemBlueColor];
        goto LABEL_43;
      case 1003:
        v20 = UIStatusBarLockScreenStyleAttributes;
LABEL_41:
        BOOL v8 = (UIStatusBarExternalStyleAttributes *)[v20 alloc];
        double v17 = 0.28627451;
        double v18 = 0.0901960784;
        double v19 = 0.439215686;
LABEL_42:
        uint64_t v9 = +[UIColor colorWithRed:v17 green:v18 blue:v19 alpha:1.0];
        goto LABEL_43;
      case 1004:
      case 1006:
      case 1016:
        long long v11 = UIStatusBarLockScreenStyleAttributes;
LABEL_37:
        BOOL v8 = (UIStatusBarExternalStyleAttributes *)[v11 alloc];
        uint64_t v9 = +[UIColor systemRedColor];
        goto LABEL_43;
      case 1007:
      case 1008:
      case 1009:
      case 1010:
      case 1011:
      case 1017:
      case 1018:
      case 1019:
      case 1020:
      case 1021:
        goto LABEL_38;
      case 1012:
      case 1013:
        id v12 = UIStatusBarActionableLockScreenStyleAttributes;
LABEL_18:
        BOOL v8 = (UIStatusBarExternalStyleAttributes *)[v12 alloc];
        uint64_t v9 = +[UIColor systemGreenColor];
        goto LABEL_43;
      case 1014:
      case 1022:
        double v13 = UIStatusBarLockScreenStyleAttributes;
LABEL_22:
        BOOL v8 = (UIStatusBarExternalStyleAttributes *)[v13 alloc];
        uint64_t v9 = +[UIColor grayColor];
        goto LABEL_43;
      default:
        if ((unint64_t)(v5 - 400) > 5)
        {
          if (v5 == 306)
          {
LABEL_26:
            double v14 = [UIStatusBarLockScreenStyleAttributes alloc];
            uint64_t v15 = +[UIColor whiteColor];
LABEL_35:
            v21 = (void *)v15;
            v22 = v14;
          }
          else
          {
LABEL_38:
            v23 = [UIStatusBarNewUIStyleAttributes alloc];
            if ([a1 _isLightContentStyle:v6]) {
              +[UIColor whiteColor];
            }
            else {
            v21 = +[UIColor blackColor];
            }
            v22 = (UIStatusBarLockScreenStyleAttributes *)v23;
          }
          double v16 = [(UIStatusBarNewUIStyleAttributes *)v22 initWithRequest:v4 backgroundColor:0 foregroundColor:v21];
        }
        else
        {
          if (((1 << (v5 + 112)) & 0x2D) != 0)
          {
            BOOL v8 = [UIStatusBarExternalStyleAttributes alloc];
            +[UIColor blackColor];
          }
          else
          {
            BOOL v8 = [UIStatusBarExternalStyleAttributes alloc];
            +[UIColor colorWithWhite:0.0 alpha:0.9];
          uint64_t v9 = };
LABEL_43:
          v21 = (void *)v9;
          v24 = +[UIColor whiteColor];
          double v16 = [(UIStatusBarNewUIStyleAttributes *)v8 initWithRequest:v4 backgroundColor:v21 foregroundColor:v24];
        }
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 200:
      case 208:
      case 222:
      case 223:
        id v12 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_18;
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 211:
        long long v11 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_37;
      case 207:
      case 214:
      case 224:
        long long v10 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_30;
      case 209:
      case 210:
      case 212:
      case 215:
      case 216:
      case 217:
      case 219:
      case 226:
      case 227:
        long long v7 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_6;
      case 213:
        v20 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_41;
      case 218:
      case 225:
        double v13 = UIStatusBarNewUIDoubleHeightStyleAttributes;
        goto LABEL_22;
      case 220:
      case 221:
        BOOL v8 = [UIStatusBarNewUIDoubleHeightStyleAttributes alloc];
        uint64_t v9 = +[UIColor systemGrayColor];
        goto LABEL_43;
      default:
        switch(v5)
        {
          case 'e':
            long long v11 = UIStatusBarNewUIStyleAttributes;
            goto LABEL_37;
          case 'f':
          case 'h':
          case 'p':
            long long v10 = UIStatusBarNewUIStyleAttributes;
            goto LABEL_30;
          case 'g':
          case 'j':
          case 'k':
          case 'n':
            goto LABEL_38;
          case 'i':
            v20 = UIStatusBarNewUIStyleAttributes;
            goto LABEL_41;
          case 'l':
            goto LABEL_26;
          case 'm':
            double v14 = [UIStatusBarLockScreenStyleAttributes alloc];
            uint64_t v15 = +[UIColor grayColor];
            goto LABEL_35;
          case 'o':
            long long v11 = UIStatusBarNewUIActionableStyleAttributes;
            goto LABEL_37;
          case 'q':
          case 'r':
            long long v10 = UIStatusBarNewUIActionableStyleAttributes;
            goto LABEL_30;
          default:
            if (v5 != -1) {
              goto LABEL_38;
            }
            double v16 = 0;
            break;
        }
        break;
    }
  }

  return v16;
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  int v2 = [v1 isHidden];
  double v3 = 1.0;
  if (v2) {
    double v3 = 0.0;
  }
  return [v1 setAlpha:v3];
}

+ (void)getData:(id *)a3 forRequestedData:(id *)a4 withOverrides:(id *)a5
{
  if (!a3 || !a4 || !a5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"UIStatusBar.m", 214, @"cannot call without valid pointers for data=%p, requestedData=%p and overrides=%p", a3, a4, a5 object file lineNumber description];
  }
  if (a3 != a4) {
    memcpy(a3, a4, sizeof($6C45178016D353444451090973A2A97F));
  }
  for (uint64_t i = 0; i != 46; ++i)
  {
    if (a5->var0[i]) {
      a3->var0[i] = a5->var36.var0[i];
    }
  }
  int v11 = *(_DWORD *)((char *)a5 + 46);
  if (v11)
  {
    strncpy(a3->var1, a5->var36.var1, 0x40uLL);
    uint64_t v18 = [NSString stringWithUTF8String:a5->var36.var1];
    if (v18)
    {
      double v19 = (void *)v18;
      id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      v21 = [MEMORY[0x1E4F1CA20] currentLocale];
      [v20 setLocale:v21];

      [v20 setDateStyle:0];
      [v20 setTimeStyle:1];
      v22 = [v20 dateFromString:v19];
      if (v22)
      {
        v23 = (void *)[v20 copy];
        [v23 setLocalizedDateFormatFromTemplate:@"Jmm"];
        uint64_t v24 = [v23 stringFromDate:v22];

        double v19 = (void *)v24;
      }
      id v25 = v19;
      strncpy(a3->var2, (const char *)[v25 UTF8String], 0x40uLL);
    }
    int v11 = *(_DWORD *)((char *)a5 + 46);
    if ((v11 & 2) == 0)
    {
LABEL_12:
      if ((v11 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_45;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_12;
  }
  strncpy(a3->var3, a5->var36.var3, 0x100uLL);
  int v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 4) == 0)
  {
LABEL_13:
    if ((v11 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  a3->var4 = a5->var36.var4;
  int v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 0x10) == 0)
  {
LABEL_14:
    if ((v11 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  a3->var6 = a5->var36.var6;
  int v11 = *(_DWORD *)((char *)a5 + 46);
  if ((v11 & 8) == 0)
  {
LABEL_15:
    if ((v11 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_47:
  a3->var5 = a5->var36.var5;
  if ((*(_DWORD *)((char *)a5 + 46) & 0x20) != 0) {
LABEL_16:
  }
    a3->var7 = a5->var36.var7;
LABEL_17:
  if ((*((unsigned char *)a5 + 56) & 4) != 0) {
    strncpy(a3->var44, a5->var36.var44, 0x64uLL);
  }
  int v12 = *(_DWORD *)((char *)a5 + 46);
  if ((v12 & 0x40) != 0)
  {
    strncpy(a3->var8, a5->var36.var8, 0x64uLL);
    int v12 = *(_DWORD *)((char *)a5 + 46);
  }
  if ((v12 & 0x80) != 0) {
    strncpy(a3->var9, a5->var36.var9, 0x64uLL);
  }
  uint64_t v13 = 0;
  char v14 = 1;
  do
  {
    char v15 = v14;
    if ((*(_DWORD *)((char *)a5 + 46) >> 8 >> v13)) {
      strncpy(a3->var12[v13], a5->var36.var12[v13], 0x64uLL);
    }
    char v14 = 0;
    uint64_t v13 = 1;
  }
  while ((v15 & 1) != 0);
  int v16 = *(_DWORD *)((char *)a5 + 46);
  if ((v16 & 0x400) != 0)
  {
    strncpy(a3->var13, a5->var36.var13, 0x400uLL);
    int v16 = *(_DWORD *)((char *)a5 + 46);
    if ((v16 & 0x800) == 0)
    {
LABEL_29:
      if ((v16 & 0x1000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v16 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  a3->var14 = a5->var36.var14;
  if ((*(_DWORD *)((char *)a5 + 46) & 0x1000) != 0) {
LABEL_30:
  }
    a3->var15 = a5->var36.var15;
LABEL_31:
  if ((*((unsigned char *)a5 + 56) & 8) != 0) {
    *((unsigned char *)a3 + 3149) = *((unsigned char *)a3 + 3149) & 0xF7 | *((unsigned char *)&a5->var36 + 3149) & 8;
  }
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x2000) != 0)
  {
    a3->var18 = a5->var36.var18;
    int v17 = *(_DWORD *)((char *)a5 + 46);
    if ((v17 & 0x4000) == 0)
    {
LABEL_35:
      if ((v17 & 0x8000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_54;
    }
  }
  else if ((v17 & 0x4000) == 0)
  {
    goto LABEL_35;
  }
  a3->var19 = a5->var36.var19;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x8000) == 0)
  {
LABEL_36:
    if ((v17 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_55;
  }
LABEL_54:
  a3->unsigned int var21 = a5->var36.var21;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x10000) == 0)
  {
LABEL_37:
    if ((v17 & 0x20000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_56;
  }
LABEL_55:
  a3->var22 = a5->var36.var22;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x20000) == 0) {
    goto LABEL_59;
  }
LABEL_56:
  unsigned int var21 = a3->var21;
  if (var21 <= 0xE && ((1 << var21) & 0x7F9F) != 0)
  {
    a3->var0[9] = 0;
    int v17 = *(_DWORD *)((char *)a5 + 46);
  }
LABEL_59:
  if ((v17 & 0x40000) != 0)
  {
    a3->var23 = a5->var36.var23;
    int v17 = *(_DWORD *)((char *)a5 + 46);
    if ((v17 & 0x80000) == 0)
    {
LABEL_61:
      if ((v17 & 0x100000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_83;
    }
  }
  else if ((v17 & 0x80000) == 0)
  {
    goto LABEL_61;
  }
  a3->var24 = a5->var36.var24;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x100000) == 0)
  {
LABEL_62:
    if ((v17 & 0x200000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_84;
  }
LABEL_83:
  strncpy(a3->var25, a5->var36.var25, 0x96uLL);
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x200000) == 0)
  {
LABEL_63:
    if ((v17 & 0x400000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_85;
  }
LABEL_84:
  a3->var26 = a5->var36.var26;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x400000) == 0)
  {
LABEL_64:
    if ((v17 & 0x800000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_86;
  }
LABEL_85:
  a3->var27 = a5->var36.var27;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x800000) == 0)
  {
LABEL_65:
    if ((v17 & 0x1000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((unsigned char *)a3 + 2272) = *((unsigned char *)a3 + 2272) & 0xFD | *((unsigned char *)&a5->var36 + 2272) & 2;
  int v17 = *(_DWORD *)((char *)a5 + 46);
  if ((v17 & 0x1000000) == 0)
  {
LABEL_66:
    if ((v17 & 0x2000000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_87:
  strncpy(a3->var31, a5->var36.var31, 0x100uLL);
  if ((*(_DWORD *)((char *)a5 + 46) & 0x2000000) != 0) {
LABEL_67:
  }
    *((unsigned char *)a3 + 2529) = *((unsigned char *)a3 + 2529) & 0xFE | *((unsigned char *)&a5->var36 + 2529) & 1;
LABEL_68:
  if (a5->var27) {
    *((unsigned char *)a3 + 2536) = *((unsigned char *)a3 + 2536) & 0xFB | *((unsigned char *)&a5->var36 + 2536) & 4;
  }
  char v27 = *((unsigned char *)a5 + 56);
  if (v27)
  {
    *((unsigned char *)a3 + 2529) = *((unsigned char *)a3 + 2529) & 0xFD | *((unsigned char *)&a5->var36 + 2529) & 2;
    char v27 = *((unsigned char *)a5 + 56);
    if ((v27 & 2) == 0)
    {
LABEL_72:
      if ((v27 & 0x10) == 0) {
        goto LABEL_73;
      }
      goto LABEL_91;
    }
  }
  else if ((*((unsigned char *)a5 + 56) & 2) == 0)
  {
    goto LABEL_72;
  }
  *((unsigned char *)a3 + 2529) = *((unsigned char *)a3 + 2529) & 0xFB | *((unsigned char *)&a5->var36 + 2529) & 4;
  char v27 = *((unsigned char *)a5 + 56);
  if ((v27 & 0x10) == 0)
  {
LABEL_73:
    if ((v27 & 0x20) == 0) {
      goto LABEL_74;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((unsigned char *)a3 + 3160) = *((unsigned char *)a3 + 3160) & 0xFB | *((unsigned char *)&a5->var36 + 3160) & 4;
  char v27 = *((unsigned char *)a5 + 56);
  if ((v27 & 0x20) == 0)
  {
LABEL_74:
    if ((v27 & 0x40) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_92:
  strncpy(a3->var54, a5->var36.var54, 0x64uLL);
  if ((*((unsigned char *)a5 + 56) & 0x40) != 0) {
LABEL_75:
  }
    strncpy(a3->var55, a5->var36.var55, 0x64uLL);
LABEL_76:
  if (a5->var0[41]) {
    *((unsigned char *)a3 + 2529) = *((unsigned char *)a3 + 2529) & 0x9F | *((unsigned char *)&a5->var36 + 2529) & 0x60;
  }
  __strlcpy_chk();
  __strlcpy_chk();
}

+ (NSDirectionalEdgeInsets)_roundedPadEdgeInsets
{
  +[_UIStatusBarVisualProvider_RoundedPad edgeInsets];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (NSDirectionalEdgeInsets)_regularPadEdgeInsets
{
  +[_UIStatusBarVisualProvider_Pad edgeInsets];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (double)_roundedPadBaselineOffset
{
  +[_UIStatusBarVisualProvider_RoundedPad baselineOffset];
  return result;
}

+ (double)_regularPadBaselineOffset
{
  +[_UIStatusBarVisualProvider_Pad baselineOffset];
  return result;
}

void __58___UIStatusBar_registerSensorActivityIndicator_forScreen___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] mapTableWithStrongToWeakObjects];
  v1 = (void *)qword_1EB25E828;
  qword_1EB25E828 = v0;
}

void __30___UIStatusBar_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateWithAggregatedData:v3];
}

void __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStatusBar:v3];
  double v5 = *(void **)(a1 + 40);
  id v6 = [v4 identifier];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

void __46___UIStatusBar__prepareVisualProviderIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 408) orderedDisplayItemPlacementsInRegionWithIdentifier:a2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 identifier];
        int v12 = [*(id *)(*(void *)(a1 + 32) + 512) objectForKeyedSubscript:v11];
        if (!v12)
        {
          int v12 = +[_UIStatusBarDisplayItemState stateForDisplayItemWithIdentifier:v11 statusBar:*(void *)(a1 + 32)];
          [*(id *)(*(void *)(a1 + 32) + 512) setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addPlacement:v10 inRegion:v5];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

void __35___UIStatusBar_resetVisualProvider__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v4 = a3;
  id v5 = [v3 orderedSet];
  [v4 setDisplayItems:v5];
}

uint64_t __24___UIStatusBar_setMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

uint64_t __41___UIStatusBar_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

uint64_t __25___UIStatusBar_setStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

uint64_t __35___UIStatusBar_setForegroundColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleAttributes];
}

uint64_t __50___UIStatusBar__updateWithData_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 584) updateWithData:*(void *)(a1 + 40)];
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 prepareForDataUpdate];
}

void __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 updateWithData:*(void *)(a1 + 32) styleAttributes:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addObjectsFromArray:v4];
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updatedDisplayItemsWithData:*(void *)(a1 + 32)];
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __78___UIStatusBar__updateDisplayedItemsWithData_styleAttributes_extraAnimations___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __52___UIStatusBar__delayUpdatesWithKeys_fromAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 584) endDelayingUpdatesForEntryKeys:*(void *)(a1 + 40)];
}

void __43___UIStatusBar__fixupDisplayItemAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 isEnabled])
  {
    uint64_t v3 = [v4 displayItems];
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_111_0];
  }
}

void __43___UIStatusBar__fixupDisplayItemAttributes__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAlpha:1.0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v4];
}

uint64_t __42___UIStatusBar_resizeSubviewsWithOldSize___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 resetToPreferredPlacement];
}

void __30___UIStatusBar_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "_is_needsLayout"))
  {
    id v2 = [v3 layer];
    [v2 setNeedsLayout];
  }
}

void __30___UIStatusBar_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 contentView];
  if (v4)
  {
    id v5 = v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = v5;
  }
}

uint64_t __34___UIStatusBar__updateRegionItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updatePlacement];
}

uint64_t __34___UIStatusBar__updateRegionItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 isEnabled];
  int v6 = [v4 isEnabled];

  if (v5 | v6 ^ 1) {
    return v5 & (v6 ^ 1u);
  }
  else {
    return -1;
  }
}

void __41___UIStatusBar__rearrangeOverflowedItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if ([v11 isEnabled] && (objc_msgSend(v11, "disableItemFrameBasedOverflow") & 1) == 0)
  {
    id v4 = [v11 overflowedDisplayItem];
    int v5 = v4;
    if (!v4)
    {
LABEL_9:

      goto LABEL_10;
    }
    int v6 = *(void **)(*(void *)(a1 + 32) + 512);
    uint64_t v7 = [v4 identifier];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(void *)(v9 + 40))
    {
      uint64_t v10 = [v8 priority];
      if (v10 >= [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) priority])
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v9 + 40), v8);
    goto LABEL_8;
  }
LABEL_10:
}

void __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([v7 isEnabled])
  {
    uint64_t v8 = [v7 displayItems];
    if ([v8 count])
    {
      uint64_t v9 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) location];
      uint64_t v10 = objc_msgSend(v9, "_cursorLocation:isInsideActionable:", v7);

      if (v10)
      {
        id v11 = [v7 displayItems];
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        uint64_t v24 = __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2;
        id v25 = &unk_1E5307408;
        int v12 = *(void **)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 32);
        id v27 = v12;
        long long v28 = *(_OWORD *)(a1 + 48);
        [v11 enumerateObjectsUsingBlock:&v22];

        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          uint64_t v13 = objc_msgSend(v7, "action", v22, v23, v24, v25, v26);
          int v14 = [v13 isEnabled];
          if ((v14 & 1) == 0)
          {
            uint64_t v10 = [v7 hoverAction];
            if (![v10 isEnabled]) {
              goto LABEL_14;
            }
          }
          long long v15 = *(void **)(a1 + 32);
          [*(id *)(a1 + 40) location];
          if (objc_msgSend(v15, "_cursorLocation:isInsideHoverableActionable:", v7))
          {
            long long v16 = [v7 contentView];
            [v16 alpha];
            double v18 = v17;

            if ((v14 & 1) == 0) {
            if (v18 > 0.0)
            }
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
              uint64_t v19 = [v7 identifier];
              uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
              v21 = *(void **)(v20 + 40);
              *(void *)(v20 + 40) = v19;

              *a4 = 1;
            }
            goto LABEL_16;
          }
          if (!v14) {
LABEL_14:
          }
        }
LABEL_16:
      }
    }
    else
    {
    }
  }
}

void __66___UIStatusBar_pointerInteraction_regionForRequest_defaultRegion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v8 = [v15 action];
  char v9 = [v8 isEnabled];
  if ((v9 & 1) == 0)
  {
    id v4 = [v15 hoverAction];
    if (([v4 isEnabled] & 1) == 0)
    {

      goto LABEL_9;
    }
  }
  uint64_t v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) location];
  int v11 = objc_msgSend(v10, "_cursorLocation:isInsideHoverableActionable:", v15);
  if ((v9 & 1) == 0)
  {

    if ((v11 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  if (v11)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v12 = [v15 identifier];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_9:
}

void __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 isEnabled])
  {
    id v7 = [v6 displayItems];
    if ([v7 count])
    {
      int v8 = [*(id *)(a1 + 32) _gestureRecognizer:*(void *)(a1 + 40) isInsideActionable:v6];

      if (v8)
      {
        char v9 = [v6 displayItems];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        long long v16 = __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke_2;
        double v17 = &unk_1E5307458;
        uint64_t v10 = *(void **)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 32);
        id v19 = v10;
        [v9 enumerateObjectsUsingBlock:&v14];

        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 536));
        if (WeakRetained)
        {
        }
        else
        {
          uint64_t v12 = objc_msgSend(v6, "action", v14, v15, v16, v17, v18);
          int v13 = [v12 isEnabled];

          if (v13)
          {
            objc_storeWeak((id *)(*(void *)(a1 + 32) + 536), v6);
            *a4 = 1;
          }
        }
      }
    }
    else
    {
    }
  }
}

void __45___UIStatusBar_gestureRecognizerShouldBegin___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id obj = a2;
  id v6 = [obj action];
  if ([v6 isEnabled])
  {
    int v7 = [*(id *)(a1 + 32) _gestureRecognizer:*(void *)(a1 + 40) isInsideActionable:obj];

    int v8 = obj;
    if (v7)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 536), obj);
      int v8 = obj;
      *a4 = 1;
    }
  }
  else
  {

    int v8 = obj;
  }
}

void __47___UIStatusBar_setStyle_forPartWithIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 styleAttributes];
  [v1 _updateDisplayedItemsWithData:0 styleAttributes:v2 extraAnimations:MEMORY[0x1E4F1CBF0]];
}

void __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v7 = a3;
  int v5 = [v7 identifier];
  LODWORD(v4) = [v4 containsObject:v5];

  int v6 = [v7 isEnabled];
  if (v4)
  {
    if (v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    [v7 disableWithToken:1];
  }
  else
  {
    if ((v6 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    [v7 enableWithToken:1];
  }
}

uint64_t __42___UIStatusBar_setEnabledPartIdentifiers___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

uint64_t __43___UIStatusBar_setDisabledPartIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

void __38___UIStatusBar_dependentDataEntryKeys__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 object];
  id v3 = [*(id *)(a1 + 32) itemWithIdentifier:v6];
  id v4 = *(void **)(a1 + 40);
  int v5 = [v3 dependentEntryKeys];
  [v4 unionSet:v5];
}

void __37___UIStatusBar_itemsDependingOnKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 dependentEntryKeys];
  int v5 = [v4 intersectsSet:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void __56___UIStatusBar_itemIdentifiersInRegionsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

void ___UIStatusBar_Log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "UIStatusBarLog");
  v1 = (void *)_MergedGlobals_9_4;
  _MergedGlobals_9_4 = (uint64_t)v0;
}

- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)UIStatusBar;
  uint64_t v14 = -[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v23, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, v7, v6, v13, x, y, width, height);
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 setOpaque:0];
    v22.receiver = v15;
    v22.super_class = (Class)UIStatusBar;
    [(UIStatusBar_Base *)&v22 setOrientation:1];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v17 = (void *)*((void *)v15 + 575);
    *((void *)v15 + 575) = v16;

    if (v13)
    {
      [v13 getStatusBarData:v15 + 640];
    }
    else
    {
      uint64_t v18 = +[UIStatusBarServer getStatusBarData];
      if (v18) {
        memcpy(v15 + 640, v18, 0xF28uLL);
      }
    }
    +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:((unint64_t)v15[3176] >> 1) & 1];
    v15[592] = v7;
    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v15 selector:sel__itemViewPerformButtonAction_ name:@"UIStatusBarItemViewPerformButtonActionNotification" object:0];
    [v19 addObserver:v15 selector:sel__itemViewShouldBeginDisablingRasterization_ name:@"UIStatusBarItemViewShouldBeginDisablingRasterizationNotification" object:0];
    [v19 addObserver:v15 selector:sel__itemViewShouldEndDisablingRasterization_ name:@"UIStatusBarItemViewShouldEndDisablingRasterizationNotification" object:0];
    if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      uint64_t v20 = _UIKitUserDefaults();
      [v20 addObserver:v15 forKeyPath:0x1ED168420 options:0 context:0];
      [v20 addObserver:v15 forKeyPath:0x1ED168440 options:0 context:0];
      v15[593] = 1;
    }
    [v15 _evaluateServerRegistration];
    [v15 _updateShouldRasterize];
  }
  return v15;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIStatusBarItemViewPerformButtonActionNotification" object:0];
  [v3 removeObserver:self name:@"UIStatusBarItemViewShouldBeginDisablingRasterizationNotification" object:0];
  [v3 removeObserver:self name:@"UIStatusBarItemViewShouldEndDisablingRasterizationNotification" object:0];
  if (self->_observingDefaults)
  {
    id v4 = _UIKitUserDefaults();
    [v4 removeObserver:self forKeyPath:0x1ED168420];
    [v4 removeObserver:self forKeyPath:0x1ED168440];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar;
  [(UIStatusBar_Base *)&v5 dealloc];
}

+ (void)enumerateStatusBarStyleOverridesWithBlock:(id)a3
{
  unint64_t v4 = 1;
  do
  {
    (*((void (**)(id, unint64_t))a3 + 2))(a3, v4);
    BOOL v5 = v4 >= 0x10000000001;
    v4 *= 2;
  }
  while (!v5);
}

+ (int64_t)lowBatteryLevel
{
  if (_UIDeviceNativeUserInterfaceIdiom() == 1) {
    return 10;
  }
  else {
    return 20;
  }
}

- (id)statusBarWindow
{
  return 0;
}

- (void)forceUpdateData:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIStatusBar_Base *)self inProcessStateProvider];

  if (!v5)
  {
    BOOL v6 = +[UIStatusBarServer getStatusBarData];
    [(UIStatusBar *)self forceUpdateToData:v6 animated:v3];
  }
}

- (void)forceUpdateToData:(id *)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    memcpy(&self->_currentRawData, a3, sizeof(self->_currentRawData));
  }
  +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:((unint64_t)*((unsigned __int8 *)&self->_currentRawData + 2536) >> 1) & 1];
  foregroundView = self->_foregroundView;
  id v7 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v7 actions:0 animated:v4];
}

- (void)forceUpdateDoubleHeightStatus
{
  BOOL v3 = [(UIStatusBar *)self _doubleHeightStatusStringForStyle:[(UIStatusBar *)self currentStyle]];
  if (v3)
  {
    BOOL v4 = v3;
    [(UIStatusBar *)self _setDoubleHeightStatusString:v3];
    [(UIStatusBar *)self _adjustDoubleHeightTextVisibility];
    BOOL v3 = v4;
  }
}

- (void)_noteStyleOverridesChangedLocally
{
  self->_waitingOnCallbackAfterChangingStyleOverridesLocalldouble y = 1;
}

- (void)forgetEitherSideHistory
{
}

- (void)setShowsOnlyCenterItems:(BOOL)a3
{
  self->_showOnlyCenterItems = a3;
  foregroundView = self->_foregroundView;
  id v4 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v4 actions:0 animated:0];
}

- (double)defaultHeight
{
  styleAttributes = self->_styleAttributes;
  if (!styleAttributes) {
    return 20.0;
  }
  [(UIStatusBarStyleAttributes *)styleAttributes heightForMetrics:0];
  return result;
}

- (double)defaultDoubleHeight
{
  return 40.0;
}

- (CGRect)frameForOrientation:(int64_t)a3
{
  if (self->_waitingOnCallbackAfterChangingStyleOverridesLocally)
  {
    [(UIStatusBar *)self forceUpdate:1];
    self->_waitingOnCallbackAfterChangingStyleOverridesLocalldouble y = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBar;
  [(UIStatusBar_Base *)&v9 frameForOrientation:a3];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (double)heightForOrientation:(int64_t)a3
{
  if (self->_waitingOnCallbackAfterChangingStyleOverridesLocally)
  {
    [(UIStatusBar *)self forceUpdate:1];
    self->_waitingOnCallbackAfterChangingStyleOverridesLocalldouble y = 0;
  }
  double v5 = [(UIStatusBar *)self _currentStyleAttributes];
  [v5 heightForOrientation:a3];
  double v7 = v6;

  return v7;
}

+ (double)_viewControllerAdjustmentForOrientation:(int64_t)a3 inWindow:(id)a4
{
  id v6 = a4;
  if ([a1 _shouldForwardToImplementationClassForStyle:0])
  {
    objc_msgSend((id)objc_msgSend(a1, "_implementationClass"), "_viewControllerAdjustmentForOrientation:inWindow:", a3, v6);
    double v8 = v7;
  }
  else
  {
    _UIAppStatusBarDefaultHeight();
    double v8 = 0.0 - v9;
  }

  return v8;
}

- (int64_t)currentStyle
{
  styleAttributes = self->_styleAttributes;
  if (styleAttributes) {
    return [(UIStatusBarStyleAttributes *)styleAttributes style];
  }
  else {
    return -1;
  }
}

- (BOOL)isDoubleHeight
{
  BOOL v3 = [(UIStatusBar *)self styleRequest];
  id v4 = [(UIStatusBar *)self _styleAttributesForRequest:v3];
  char v5 = [v4 isDoubleHeight];

  return v5;
}

- (BOOL)isTranslucent
{
  BOOL v3 = [(UIStatusBar *)self styleRequest];
  id v4 = [(UIStatusBar *)self _styleAttributesForRequest:v3];
  char v5 = [v4 isTranslucent];

  return v5;
}

- (void)requestStyle:(int64_t)a3 animation:(int)a4 startTime:(double)a5 duration:(double)a6 curve:(int64_t)a7
{
  double v9 = 0;
  if (a4 && a6 > 0.0)
  {
    uint64_t v13 = *(void *)&a4;
    uint64_t v14 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
    [(UIStatusBarStyleAnimationParameters *)v14 setStyleAnimation:v13];
    [(UIStatusBarAnimationParameters *)v14 setStartTime:a5];
    [(UIStatusBarAnimationParameters *)v14 setDuration:a6];
    [(UIStatusBarAnimationParameters *)v14 setCurve:a7];
    double v9 = v14;
  }
  uint64_t v15 = v9;
  -[UIStatusBar_Base requestStyle:animationParameters:](self, "requestStyle:animationParameters:", a3, v9, a7, a5, a6);
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v16 = a3;
  id v9 = a5;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB25D1C8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v14 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = a3;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 1024;
      BOOL v21 = v6;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Requesting status bar style %lu. Animation parameters:%@ forced: %d", buf, 0x1Cu);
    }
  }
  unint64_t v11 = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB25D1D0);
  if (*(unsigned char *)v11)
  {
    uint64_t v15 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = a3;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Effective status bar style: %lu", buf, 0xCu);
    }
  }
  *(void *)buf = 0;
  [(UIStatusBar_Base *)self _getStyle:&v16 andActiveOverride:buf forRequestedStyle:[(UIStatusBar_Base *)self _requestStyle]];
  [(UIStatusBar_Base *)self setActiveStyleOverride:*(void *)buf];
  uint64_t v12 = [(UIStatusBar *)self currentStyleRequestForStyle:v16];
  uint64_t v13 = [(UIStatusBar *)self _styleAttributesForRequest:v12];
  [(UIStatusBar *)self _updateUIWithStyleAttributes:v13 animationParameters:v9 forced:v6];
}

- (void)_updateUIWithStyleAttributes:(id)a3 animationParameters:(id)a4
{
}

- (void)_updateUIWithStyleAttributes:(id)a3 animationParameters:(id)a4 forced:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = (UIStatusBarStyleAttributes *)a3;
  id v10 = a4;
  nextTintTransition = self->_nextTintTransition;
  self->_nextTintTransition = 0;

  uint64_t v12 = [(UIStatusBar_Base *)self manager];
  if (!v12
    || (uint64_t v13 = (void *)v12,
        [(UIStatusBar_Base *)self manager],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 statusBar:self shouldRequestStyleAttributes:v9 animationParameters:v10 forced:v5],
        v14,
        v13,
        v15))
  {
    if ([(UIStatusBar_Base *)self isHidden])
    {
      BOOL v16 = [(UIStatusBar_Base *)self suppressesHiddenSideEffects];
      if (!v9 || !v16) {
        goto LABEL_25;
      }
    }
    else if (!v9)
    {
      goto LABEL_25;
    }
    double v17 = [(id)UIApp _systemNavigationAction];
    BOOL v18 = [(UIStatusBarForegroundView *)self->_foregroundView willChangeNavigationItemDisplayWithSystemNavigationAction:v17];
    id v19 = [(UIStatusBarStyleAttributes *)v9 backgroundColorWithTintColor:self->_tintColor];
    __int16 v20 = v19;
    p_styleAttributes = &self->_styleAttributes;
    if (self->_styleAttributes != v9
      || v18
      || v19 != self->_lastUsedBackgroundColor && !-[UIColor isEqual:](v19, "isEqual:"))
    {
      double v22 = 0.0;
      v45 = v17;
      if (v10)
      {
        uint64_t v23 = [v10 styleAnimation];
        uint64_t v24 = v20;
        if (v23)
        {
          [v10 duration];
          double v22 = v25;
        }
      }
      else
      {
        uint64_t v24 = v20;
        uint64_t v23 = 0;
      }
      uint64_t v26 = -[UIStatusBar _prepareToSetStyle:animation:forced:](self, "_prepareToSetStyle:animation:forced:", v9, v23, v5, v45);
      [(UIStatusBarStyleAttributes *)*p_styleAttributes heightForOrientation:[(UIStatusBar_Base *)self orientation]];
      double v28 = v27;
      objc_storeStrong((id *)p_styleAttributes, a3);
      [(UIStatusBarStyleAttributes *)*p_styleAttributes heightForOrientation:[(UIStatusBar_Base *)self orientation]];
      double v30 = v29;
      v31 = [(UIStatusBarStyleAttributes *)*p_styleAttributes foregroundStyle];
      [v31 scale];
      double v33 = v32;
      v34 = [(UIView *)self layer];
      [v34 setRasterizationScale:v33];

      if ([(UIStatusBarStyleAttributes *)*p_styleAttributes supportsRasterization]) {
        [(UIStatusBar *)self _endDisablingRasterizationForReason:@"style"];
      }
      else {
        [(UIStatusBar *)self _beginDisablingRasterizationForReason:@"style"];
      }
      __int16 v20 = v24;
      if (v28 != v30)
      {
        v35 = [(UIStatusBar_Base *)self styleDelegate];
        [v35 statusBar:self willAnimateFromHeight:v23 toHeight:v28 duration:v30 animation:v22];
      }
      v36 = self->_foregroundView;
      v37 = v36;
      BOOL foregroundViewShouldIgnoreStatusBarDataDuringAnimation = self->_foregroundViewShouldIgnoreStatusBarDataDuringAnimation;
      double v17 = v46;
      if (foregroundViewShouldIgnoreStatusBarDataDuringAnimation) {
        [(UIStatusBarForegroundView *)v36 startIgnoringData];
      }
      v39 = [(UIStatusBar *)self _doubleHeightStatusStringForStyle:[(UIStatusBarStyleAttributes *)v9 style]];
      [(UIStatusBar *)self _setDoubleHeightStatusString:v39];

      [(UIStatusBar *)self _beginDisablingRasterizationForReason:@"styleChange"];
      [(UIView *)self _setDrawsAsBackdropOverlay:[(UIStatusBarStyleAttributes *)v9 style] == 110];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke;
      aBlock[3] = &unk_1E5307C38;
      aBlock[4] = self;
      v56 = v9;
      int v58 = v23;
      id v40 = v26;
      id v57 = v40;
      v41 = _Block_copy(aBlock);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke_2;
      v47[3] = &unk_1E5307C60;
      BOOL v54 = foregroundViewShouldIgnoreStatusBarDataDuringAnimation;
      v48 = v37;
      v49 = self;
      double v51 = v28;
      double v52 = v30;
      int v53 = v23;
      id v50 = v40;
      id v42 = v40;
      v43 = v37;
      v44 = _Block_copy(v47);
      [(UIStatusBar_Base *)self _performAnimations:v41 withParameters:v10 completion:v44];
    }
  }
LABEL_25:
}

void *__71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setStyle:*(void *)(a1 + 40) animation:*(unsigned int *)(a1 + 56)];
  CGRect result = *(void **)(a1 + 48);
  if (result)
  {
    return (void *)[result setAlpha:0.0];
  }
  return result;
}

void *__71__UIStatusBar__updateUIWithStyleAttributes_animationParameters_forced___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 76)) {
    [*(id *)(a1 + 32) stopIgnoringData:0];
  }
  [*(id *)(a1 + 40) _endDisablingRasterizationForReason:@"styleChange"];
  [*(id *)(a1 + 40) _finishedSettingStyleWithOldHeight:*(unsigned int *)(a1 + 72) newHeight:*(double *)(a1 + 56) animation:*(double *)(a1 + 64)];
  CGRect result = *(void **)(a1 + 48);
  if (result)
  {
    [result removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = *(void **)(*(void *)(a1 + 40) + 4520);
    return (void *)[v4 removeObject:v3];
  }
  return result;
}

- (BOOL)_shouldUseInProcessProviderDoubleHeightStatusString
{
  uint64_t v3 = [(UIStatusBar_Base *)self inProcessStateProvider];
  if (v3)
  {
    id v4 = [(UIStatusBar_Base *)self inProcessStateProvider];
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (id)_doubleHeightStatusStringForStyle:(int64_t)a3
{
  if ([(UIStatusBar *)self _shouldUseInProcessProviderDoubleHeightStatusString])
  {
    char v5 = [(UIStatusBar_Base *)self inProcessStateProvider];
    BOOL v6 = [v5 doubleHeightStatusStringForStyle:a3];
  }
  else
  {
    BOOL v6 = +[UIStatusBarServer getDoubleHeightStatusStringForStyle:a3];
  }
  return v6;
}

- (void)_setDoubleHeightStatusString:(id)a3
{
  id v31 = a3;
  id v4 = (NSString *)[v31 copy];
  currentDoubleHeightText = self->_currentDoubleHeightText;
  self->_currentDoubleHeightText = v4;

  foregroundView = self->_foregroundView;
  double v7 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v7 actions:0 animated:1];

  newStyleForegroundView = self->_newStyleForegroundView;
  id v9 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)newStyleForegroundView setStatusBarData:v9 actions:0 animated:1];

  id v10 = [(UIView *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  uint64_t v12 = v31;
  if (!v11)
  {
    uint64_t v13 = [v31 length];
    doubleHeightLabel = self->_doubleHeightLabel;
    if (v13)
    {
      if (!doubleHeightLabel)
      {
        int v15 = [UIView alloc];
        [(UIView *)self bounds];
        BOOL v16 = -[UIView initWithFrame:](v15, "initWithFrame:");
        doubleHeightLabelContainer = self->_doubleHeightLabelContainer;
        self->_doubleHeightLabelContainer = v16;

        [(UIView *)self->_doubleHeightLabelContainer setAutoresizingMask:18];
        [(UIView *)self->_doubleHeightLabelContainer setClipsToBounds:1];
        [(UIView *)self addSubview:self->_doubleHeightLabelContainer];
        [(UIStatusBar *)self defaultHeight];
        double v19 = v18;
        [(UIView *)self bounds];
        double v21 = v20;
        [(UIStatusBar *)self defaultHeight];
        uint64_t v23 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, v19, v21, v22 + -2.0);
        uint64_t v24 = self->_doubleHeightLabel;
        self->_doubleHeightLabel = v23;

        double v25 = self->_doubleHeightLabel;
        uint64_t v26 = +[UIColor whiteColor];
        [(UILabel *)v25 setTextColor:v26];

        [(UILabel *)self->_doubleHeightLabel setTextAlignment:1];
        [(UIView *)self->_doubleHeightLabel setAutoresizingMask:34];
        [(UIView *)self->_doubleHeightLabel setBackgroundColor:0];
        [(UIView *)self->_doubleHeightLabel setOpaque:0];
        double v27 = self->_doubleHeightLabel;
        double v28 = [off_1E52D39B8 systemFontOfSize:13.5];
        [(UILabel *)v27 setFont:v28];

        [(UIView *)self->_doubleHeightLabelContainer addSubview:self->_doubleHeightLabel];
        [(UIStatusBar *)self _adjustDoubleHeightTextVisibility];
        doubleHeightLabel = self->_doubleHeightLabel;
      }
      [(UILabel *)doubleHeightLabel setText:v31];
    }
    else
    {
      [(UIView *)doubleHeightLabel removeFromSuperview];
      double v29 = self->_doubleHeightLabel;
      self->_doubleHeightLabel = 0;

      [(UIView *)self->_doubleHeightLabelContainer removeFromSuperview];
      double v30 = self->_doubleHeightLabelContainer;
      self->_doubleHeightLabelContainer = 0;
    }
    uint64_t v12 = v31;
  }
}

- (void)_adjustDoubleHeightTextVisibility
{
  if (self->_doubleHeightLabel)
  {
    newStyleBackgroundView = self->_newStyleBackgroundView;
    if (!newStyleBackgroundView) {
      newStyleBackgroundView = self->_backgroundView;
    }
    id v13 = [(UIStatusBarBackgroundView *)newStyleBackgroundView style];
    objc_msgSend(v13, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
    double v5 = v4;
    [(UIStatusBar *)self defaultDoubleHeight];
    doubleHeightLabel = self->_doubleHeightLabel;
    if (v5 == v7)
    {
      [(UIView *)doubleHeightLabel setAlpha:1.0];
      int v8 = [v13 isPulsingAnimationEnabled];
    }
    else
    {
      [(UIView *)doubleHeightLabel setAlpha:0.0];
      int v8 = 0;
    }
    id v9 = [(UIView *)self->_doubleHeightLabel layer];
    [v9 removeAnimationForKey:@"opacity"];
    if (v8)
    {
      id v10 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v10 setValues:&unk_1ED3F11E0];
      [v10 setKeyTimes:&unk_1ED3F11F8];
      uint64_t v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v10 setTimingFunction:v11];

      [v10 setCalculationMode:*MEMORY[0x1E4F39D80]];
      [v10 setAutoreverses:1];
      LODWORD(v12) = 2139095040;
      [v10 setRepeatCount:v12];
      [v10 setDuration:2.0];
      [v9 addAnimation:v10 forKey:@"opacity"];
      [(UIStatusBar *)self _beginDisablingRasterizationForReason:@"doubleHeight"];
    }
    else
    {
      [(UIStatusBar *)self _endDisablingRasterizationForReason:@"doubleHeight"];
    }
  }
}

- (CGAffineTransform)_slideTransform
{
  id v6 = [(UIView *)self window];
  [v6 bounds];
  CGAffineTransformMakeTranslation(retstr, 0.0, v4);

  return result;
}

- (id)_prepareInterruptedAnimationCompositeViewIncludingForeground:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(NSMutableArray *)self->_interruptedAnimationCompositeViews lastObject];
  [(UIView *)self->_backgroundView frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(UIView *)self->_newStyleBackgroundView frame];
  v46.origin.CGFloat x = v14;
  v46.origin.CGFloat y = v15;
  v46.size.CGFloat width = v16;
  v46.size.CGFloat height = v17;
  v42.origin.CGFloat x = v7;
  v42.origin.CGFloat y = v9;
  v42.size.CGFloat width = v11;
  v42.size.CGFloat height = v13;
  CGRect v43 = CGRectUnion(v42, v46);
  CGFloat x = v43.origin.x;
  CGFloat y = v43.origin.y;
  CGFloat width = v43.size.width;
  CGFloat height = v43.size.height;
  [v5 frame];
  v47.origin.CGFloat x = v22;
  v47.origin.CGFloat y = v23;
  v47.size.CGFloat width = v24;
  v47.size.CGFloat height = v25;
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  CGRect v45 = CGRectUnion(v44, v47);
  uint64_t v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__UIStatusBar__prepareInterruptedAnimationCompositeViewIncludingForeground___block_invoke;
  aBlock[3] = &unk_1E52DC3D0;
  double v27 = v26;
  v39 = v27;
  id v40 = self;
  BOOL v41 = v3;
  double v28 = (void (**)(void))_Block_copy(aBlock);
  if (v5) {
    [(UIView *)self insertSubview:v27 aboveSubview:v5];
  }
  else {
    [(UIView *)self insertSubview:v27 atIndex:0];
  }
  double v29 = [(UIStatusBarBackgroundView *)self->_backgroundView style];
  int v30 = [v29 isTranslucent];

  if (v30) {
    v28[2](v28);
  }
  [(UIView *)v27 addSubview:self->_newStyleBackgroundView];
  newStyleBackgroundView = self->_newStyleBackgroundView;
  self->_newStyleBackgroundView = 0;

  if (v3)
  {
    [(UIView *)v27 addSubview:self->_newStyleForegroundView];
    newStyleForegroundView = self->_newStyleForegroundView;
    self->_newStyleForegroundView = 0;
  }
  if ((v30 & 1) == 0) {
    v28[2](v28);
  }
  interruptedAnimationCompositeViews = self->_interruptedAnimationCompositeViews;
  if (!interruptedAnimationCompositeViews)
  {
    v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35 = self->_interruptedAnimationCompositeViews;
    self->_interruptedAnimationCompositeViews = v34;

    interruptedAnimationCompositeViews = self->_interruptedAnimationCompositeViews;
  }
  [(NSMutableArray *)interruptedAnimationCompositeViews addObject:v27];
  v36 = v27;

  return v36;
}

void __76__UIStatusBar__prepareInterruptedAnimationCompositeViewIncludingForeground___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 40) + 600)];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = *(void **)(v2 + 600);
  *(void *)(v2 + 600) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(v4 + 4536) || *(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) addSubview:*(void *)(v4 + 608)];
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(void **)(v5 + 608);
    *(void *)(v5 + 608) = 0;
  }
}

- (void)_setVisualAltitude:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBar;
  [(UIView *)&v4 _setVisualAltitude:a3];
  [(UIStatusBar *)self _updateBackgroundFrame];
}

- (void)_setVisualAltitudeBias:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBar;
  -[UIView _setVisualAltitudeBias:](&v4, sel__setVisualAltitudeBias_, a3.width, a3.height);
  [(UIStatusBar *)self _updateBackgroundFrame];
}

- (CGRect)_backgroundFrameForAttributes:(id)a3
{
  if ([a3 shouldUseVisualAltitude])
  {
    [(UIView *)self _visualAltitudeSensitiveBoundsWithInfiniteEdges:11];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(UIView *)self setClipsToBounds:0];
  }
  else
  {
    [(UIView *)self bounds];
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)_updateBackgroundFrame
{
  [(UIStatusBar *)self _backgroundFrameForAttributes:self->_styleAttributes];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  newStyleBackgroundView = self->_newStyleBackgroundView;
  -[UIView setFrame:](newStyleBackgroundView, "setFrame:", v4, v6, v8, v10);
}

- (id)_prepareToSetStyle:(id)a3 animation:(int)a4 forced:(BOOL)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = [v8 foregroundStyle];
  if (a5)
  {
    BOOL v10 = 1;
  }
  else if (self->_showsForeground)
  {
    newStyleForegroundView = self->_newStyleForegroundView;
    if (!newStyleForegroundView) {
      newStyleForegroundView = self->_foregroundView;
    }
    double v12 = [(UIStatusBarForegroundView *)newStyleForegroundView foregroundStyle];
    BOOL v10 = v12 != v9;
  }
  else
  {
    BOOL v10 = 0;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_prepareToSetStyle_animation_forced____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v37 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "Foreground view needs changing: %d", buf, 8u);
    }
  }
  if (a4 == 1 && self->_newStyleBackgroundView)
  {
    double v14 = [(UIStatusBar *)self _prepareInterruptedAnimationCompositeViewIncludingForeground:v10];
  }
  else
  {
    double v14 = 0;
  }
  [(UIView *)self->_newStyleBackgroundView removeFromSuperview];
  newStyleBackgroundView = self->_newStyleBackgroundView;
  self->_newStyleBackgroundView = 0;

  double v16 = [v8 backgroundColorWithTintColor:self->_tintColor];
  lastUsedBackgroundColor = self->_lastUsedBackgroundColor;
  self->_lastUsedBackgroundColor = v16;

  [(UIStatusBar *)self _backgroundFrameForAttributes:v8];
  CGFloat v22 = -[UIStatusBarBackgroundView initWithFrame:style:backgroundColor:]([UIStatusBarBackgroundView alloc], "initWithFrame:style:backgroundColor:", v8, self->_lastUsedBackgroundColor, v18, v19, v20, v21);
  CGFloat v23 = self->_newStyleBackgroundView;
  self->_newStyleBackgroundView = v22;

  CGFloat v24 = [(UIStatusBarBackgroundView *)self->_newStyleBackgroundView style];
  int v25 = [v24 isTranslucent];

  if (v25) {
    [(UIView *)self->_newStyleBackgroundView setAlpha:1.0];
  }
  [(UIView *)self insertSubview:self->_newStyleBackgroundView atIndex:0];
  if (v10)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __51__UIStatusBar__prepareToSetStyle_animation_forced___block_invoke;
    v39[3] = &unk_1E52DCB30;
    v39[4] = self;
    id v40 = v9;
    id v41 = v8;
    +[UIView performWithoutAnimation:v39];
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    [(UIView *)self->_slidingStatusBar removeFromSuperview];
    slidingStatusBar = self->_slidingStatusBar;
    self->_slidingStatusBar = 0;

    [(UIView *)self setClipsToBounds:0];
    if (a4 == 2)
    {
      double v27 = (UIStatusBarStyleAttributes *)v8;
      long long v43 = 0u;
      long long v44 = 0u;
      *(_OWORD *)buf = 0u;
      [(UIStatusBar *)self _slideTransform];
    }
    else
    {
      double v27 = self->_styleAttributes;
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E4F1DAB8];
      long long v43 = v28;
      long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    [(UIView *)self bounds];
    double v30 = v29;
    [(UIStatusBarStyleAttributes *)v27 heightForOrientation:[(UIStatusBar_Base *)self orientation]];
    double v32 = -[UIStatusBar_Base initWithFrame:showForegroundView:]([UIStatusBar alloc], "initWithFrame:showForegroundView:", 0, 0.0, 0.0, v30, v31);
    double v33 = self->_slidingStatusBar;
    self->_slidingStatusBar = v32;

    [(UIStatusBar_Base *)self->_slidingStatusBar requestStyle:[(UIStatusBarStyleAttributes *)v27 style] animated:0];
    v34 = self->_slidingStatusBar;
    v38[0] = *(_OWORD *)buf;
    v38[1] = v43;
    v38[2] = v44;
    [(UIView *)v34 setTransform:v38];
    [(UIView *)self insertSubview:self->_slidingStatusBar belowSubview:self->_foregroundView];
    if (a4 == 3)
    {
      [(UIStatusBar *)self _setFrameForStyle:v8];
      v35 = -[UIStatusBar _doubleHeightStatusStringForStyle:](self, "_doubleHeightStatusStringForStyle:", [v8 style]);
      [(UIStatusBar *)self _setDoubleHeightStatusString:v35];

      [(UIStatusBar *)self _adjustDoubleHeightTextVisibility];
      [(UIStatusBar *)self _swapToNewBackgroundView];
    }
    else
    {
      [(UIView *)self->_newStyleBackgroundView setAlpha:0.0];
      [(UIView *)self->_newStyleForegroundView setAlpha:0.0];
    }
  }
  else if (a4 == 1)
  {
    if (([v8 shouldUseVisualAltitude] & 1) == 0) {
      [(UIView *)self setClipsToBounds:1];
    }
    if ([(UIStatusBarStyleAttributes *)self->_styleAttributes isTranslucent] || v14)
    {
      [(UIView *)self insertSubview:self->_newStyleBackgroundView aboveSubview:self->_backgroundView];
      [(UIView *)self insertSubview:self->_newStyleForegroundView aboveSubview:self->_newStyleBackgroundView];
      [(UIView *)self->_newStyleBackgroundView setAlpha:0.0];
      [(UIView *)self->_newStyleForegroundView setAlpha:0.0];
    }
  }

  return v14;
}

uint64_t __51__UIStatusBar__prepareToSetStyle_animation_forced___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 4536) removeFromSuperview];
  uint64_t v2 = [UIStatusBarForegroundView alloc];
  [*(id *)(a1 + 32) bounds];
  uint64_t v7 = -[UIStatusBarForegroundView initWithFrame:foregroundStyle:usesVerticalLayout:](v2, "initWithFrame:foregroundStyle:usesVerticalLayout:", *(void *)(a1 + 40), [*(id *)(a1 + 48) usesVerticalLayout], v3, v4, v5, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(void **)(v8 + 4536);
  *(void *)(v8 + 4536) = v7;

  [*(id *)(a1 + 32) _updatePersistentAnimationsEnabledForForegroundView:*(void *)(*(void *)(a1 + 32) + 4536)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 4536), "setIdiom:", objc_msgSend(*(id *)(a1 + 48), "idiom"));
  BOOL v10 = *(void **)(*(void *)(a1 + 32) + 4536);
  [*(id *)(a1 + 48) foregroundAlpha];
  objc_msgSend(v10, "setAlpha:");
  double v11 = *(void **)(a1 + 32);
  double v12 = (void *)v11[567];
  double v13 = [v11 _currentComposedDataForStyle:*(void *)(a1 + 48)];
  [v12 setStatusBarData:v13 actions:0 animated:0];

  double v14 = *(void **)(a1 + 32);
  uint64_t v15 = v14[567];
  uint64_t v16 = v14[566];
  return [v14 insertSubview:v15 aboveSubview:v16];
}

- (void)_setStyle:(id)a3 animation:(int)a4
{
  id v6 = a3;
  [v6 foregroundAlpha];
  double v8 = v7;
  if (a4 == 3)
  {
    slidingStatusBar = self->_slidingStatusBar;
    [(UIStatusBar *)self _slideTransform];
    double v11 = &v13;
    double v9 = slidingStatusBar;
  }
  else
  {
    if (a4 != 2)
    {
      [(UIStatusBar *)self _setStyle:v6];
      goto LABEL_7;
    }
    double v9 = self->_slidingStatusBar;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v14[0] = *MEMORY[0x1E4F1DAB8];
    v14[1] = v10;
    v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v11 = (uint64_t *)v14;
  }
  [(UIView *)v9 setTransform:v11];
  [(UIStatusBar *)self _crossfadeToNewForegroundViewWithAlpha:v8];
LABEL_7:
}

- (void)_finishedSettingStyleWithOldHeight:(double)a3 newHeight:(double)a4 animation:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  [(UIView *)self setClipsToBounds:0];
  if (a3 != a4)
  {
    double v9 = [(UIStatusBar_Base *)self styleDelegate];
    [v9 statusBar:self didAnimateFromHeight:v5 toHeight:a3 animation:a4];
  }
  if (v5 != 3)
  {
    if (v5 != 2) {
      goto LABEL_7;
    }
    [(UIStatusBar *)self _setStyle:self->_styleAttributes];
  }
  [(UIView *)self->_slidingStatusBar removeFromSuperview];
  slidingStatusBar = self->_slidingStatusBar;
  self->_slidingStatusBar = 0;

LABEL_7:
  [(UIStatusBar *)self _swapToNewBackgroundView];
  [(UIStatusBar *)self _swapToNewForegroundView];
}

- (void)_setFrameForStyle:(id)a3
{
  id v4 = a3;
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(v4, "heightForOrientation:", -[UIStatusBar_Base orientation](self, "orientation"));
  double v14 = v13;
  int v15 = [v4 usesVerticalLayout];

  if (v15) {
    double v16 = v14;
  }
  else {
    double v16 = v10;
  }
  if (v15) {
    double v17 = v12;
  }
  else {
    double v17 = v14;
  }
  -[UIView setFrame:](self, "setFrame:", v6, v8, v16, v17);
}

- (void)_setStyle:(id)a3
{
  id v4 = a3;
  [v4 foregroundAlpha];
  -[UIStatusBar _crossfadeToNewForegroundViewWithAlpha:](self, "_crossfadeToNewForegroundViewWithAlpha:");
  [(UIStatusBar *)self _crossfadeToNewBackgroundView];
  -[UIStatusBarBackgroundView setGlowAnimationEnabled:](self->_backgroundView, "setGlowAnimationEnabled:", +[UIStatusBarServer getGlowAnimationStateForStyle:](UIStatusBarServer, "getGlowAnimationStateForStyle:", [v4 style]));
  -[UIStatusBarBackgroundView setGlowAnimationEnabled:](self->_newStyleBackgroundView, "setGlowAnimationEnabled:", +[UIStatusBarServer getGlowAnimationStateForStyle:](UIStatusBarServer, "getGlowAnimationStateForStyle:", [v4 style]));
  [(UIStatusBar *)self _setFrameForStyle:v4];

  [(UIStatusBar *)self _adjustDoubleHeightTextVisibility];
}

- (void)_crossfadeToNewBackgroundView
{
  newStyleBackgroundView = self->_newStyleBackgroundView;
  if (newStyleBackgroundView)
  {
    [(UIView *)newStyleBackgroundView setAlpha:1.0];
    id v4 = [(UIStatusBarBackgroundView *)self->_backgroundView style];
    if ([v4 isTranslucent])
    {
      double v5 = [(UIStatusBarBackgroundView *)self->_newStyleBackgroundView style];
      int v6 = [v5 isTranslucent];

      if (!v6) {
        return;
      }
    }
    else
    {
    }
    backgroundView = self->_backgroundView;
    [(UIView *)backgroundView setAlpha:0.0];
  }
}

- (void)_crossfadeToNewForegroundViewWithAlpha:(double)a3
{
  newStyleForegroundView = self->_newStyleForegroundView;
  if (newStyleForegroundView)
  {
    [(UIView *)newStyleForegroundView setAlpha:a3];
    a3 = 0.0;
  }
  foregroundView = self->_foregroundView;
  [(UIView *)foregroundView setAlpha:a3];
}

- (void)_swapToNewBackgroundView
{
  if (self->_newStyleBackgroundView)
  {
    p_backgroundView = &self->_backgroundView;
    [(UIView *)self->_backgroundView removeFromSuperview];
    objc_storeStrong((id *)p_backgroundView, self->_newStyleBackgroundView);
    newStyleBackgroundView = self->_newStyleBackgroundView;
    self->_newStyleBackgroundView = 0;
  }
}

- (void)_swapToNewForegroundView
{
  if (self->_newStyleForegroundView)
  {
    p_foregroundView = &self->_foregroundView;
    [(UIView *)self->_foregroundView removeFromSuperview];
    objc_storeStrong((id *)p_foregroundView, self->_newStyleForegroundView);
    newStyleForegroundView = self->_newStyleForegroundView;
    self->_newStyleForegroundView = 0;
  }
}

- (void)setTintColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_tintColor = &self->_tintColor;
  if (*p_tintColor != v5)
  {
    double v8 = v5;
    BOOL v7 = [(UIColor *)*p_tintColor isEqual:v5];
    double v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)p_tintColor, a3);
      double v5 = v8;
    }
  }
}

- (void)setTintColor:(id)a3 withDuration:(double)a4
{
  BOOL v7 = (UIColor *)a3;
  tintColor = self->_tintColor;
  if (tintColor != v7)
  {
    double v17 = v7;
    BOOL v9 = [(UIColor *)tintColor isEqual:v7];
    BOOL v7 = v17;
    if (!v9)
    {
      objc_storeStrong((id *)&self->_tintColor, a3);
      nextTintTransition = self->_nextTintTransition;
      self->_nextTintTransition = 0;

      int64_t v11 = [(UIStatusBar_Base *)self _requestStyle];
      BOOL v7 = v17;
      if (!v11)
      {
        double v12 = [UIStatusBarStyleAnimationParameters alloc];
        if (a4 == 0.0)
        {
          int v15 = [(UIStatusBarAnimationParameters *)v12 initWithEmptyParameters];
          double v16 = self->_nextTintTransition;
          self->_nextTintTransition = v15;
        }
        else
        {
          double v13 = [(UIStatusBarStyleAnimationParameters *)v12 initWithDefaultParameters];
          double v14 = self->_nextTintTransition;
          self->_nextTintTransition = v13;

          if (a4 > 0.0) {
            [(UIStatusBarAnimationParameters *)self->_nextTintTransition setDuration:a4];
          }
        }
        [(UIView *)self setNeedsLayout];
        BOOL v7 = v17;
      }
    }
  }
}

- (void)layoutSubviews
{
  nextTintTransition = self->_nextTintTransition;
  if (nextTintTransition)
  {
    self->_nextTintTransition = 0;
    id v4 = nextTintTransition;

    [(UIStatusBar_Base *)self requestStyle:[(UIStatusBar_Base *)self _requestStyle] animationParameters:v4];
  }
}

- (void)setOrientation:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)UIStatusBar;
  -[UIStatusBar_Base setOrientation:](&v18, sel_setOrientation_);
  [(UIStatusBar *)self _adjustDoubleHeightTextVisibility];
  [(UIStatusBarStyleAttributes *)self->_styleAttributes heightForOrientation:a3];
  double v6 = v5;
  [(UIView *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  BOOL v15 = [(UIStatusBarStyleAttributes *)self->_styleAttributes usesVerticalLayout];
  if (v15) {
    double v16 = v6;
  }
  else {
    double v16 = v12;
  }
  if (v15) {
    double v17 = v14;
  }
  else {
    double v17 = v6;
  }
  -[UIView setFrame:](self, "setFrame:", v8, v10, v16, v17);
  [(UIStatusBarForegroundView *)self->_foregroundView reflowItemViews:0];
}

- (void)_statusBarWillAnimateRotation
{
}

- (void)_statusBarDidAnimateRotation
{
}

- (void)setSuppressesHiddenSideEffects:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIStatusBar_Base *)self suppressesHiddenSideEffects] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBar;
    [(UIStatusBar_Base *)&v5 setSuppressesHiddenSideEffects:v3];
    if ([(UIStatusBar_Base *)self suppressesHiddenSideEffects])
    {
      if ([(UIStatusBar_Base *)self isHidden]) {
        [(UIStatusBar_Base *)self requestStyle:[(UIStatusBar_Base *)self _requestStyle] animationParameters:0];
      }
    }
  }
}

+ (BOOL)_isLightContentStyle:(int64_t)a3
{
  BOOL result = 1;
  if ((unint64_t)(a3 - 51) > 0x37 || ((1 << (a3 - 51)) & 0x90000000000001) == 0) {
    return (unint64_t)(a3 - 301) < 3 || (unint64_t)(a3 - 1) < 2;
  }
  return result;
}

- (id)_styleAttributesForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _styleAttributesForRequest:v3];

  return v4;
}

- (BOOL)_touchShouldProduceReturnEvent
{
  if (![(UIStatusBarStyleAttributes *)self->_styleAttributes shouldProduceReturnEvent]) {
    return 0;
  }
  id v3 = +[UIDevice currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1
    || (unint64_t)([(UIStatusBar_Base *)self orientation] - 1) < 2;

  return v4;
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar;
  BOOL v3 = [(UIStatusBar_Base *)&v5 _shouldSeekHigherPriorityTouchTarget];
  if (v3) {
    LOBYTE(v3) = ![(UIStatusBar *)self _touchShouldProduceReturnEvent];
  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([*(id *)(*((void *)&v21 + 1) + 8 * v12) type] != 1) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    int64_t v13 = [(UIStatusBarStyleAttributes *)self->_styleAttributes tapButtonType];
    if (v13 == -1)
    {
      if (![(UIStatusBar *)self _touchShouldProduceReturnEvent]) {
        goto LABEL_20;
      }
      if (objc_msgSend((id)UIApp, "handleDoubleHeightStatusBarTapWithStyleOverride:", -[UIStatusBar_Base activeStyleOverride](self, "activeStyleOverride")))goto LABEL_19; {
      BOOL v15 = [[UIHandleStatusBarTapAction alloc] initWithStatusBarStyle:[(UIStatusBar *)self currentStyle] andStatusBarStyleOverride:[(UIStatusBar_Base *)self activeStyleOverride]];
      }
      double v16 = [(UIView *)self window];
      double v17 = -[UIWindow _fbsScene](v16);
      objc_super v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
      [v17 sendActions:v18];
    }
    else
    {
      int64_t v14 = v13;
      BOOL v15 = [(UIStatusBar_Base *)self styleDelegate];
      if (objc_opt_respondsToSelector()) {
        [(UIHandleStatusBarTapAction *)v15 statusBar:self didTriggerButtonType:v14 withAction:0];
      }
      if (objc_opt_respondsToSelector()) {
        [(UIHandleStatusBarTapAction *)v15 statusBar:self didTriggerButtonType:v14 withAction:0 context:0];
      }
    }

LABEL_19:
    uint64_t v19 = [v8 objectsPassingTest:&__block_literal_global_124_1];

    id v8 = (id)v19;
    goto LABEL_20;
  }
LABEL_9:

LABEL_20:
  if ([v8 count])
  {
    v20.receiver = self;
    v20.super_class = (Class)UIStatusBar;
    [(_UIScrollsToTopInitiatorView *)&v20 touchesEnded:v8 withEvent:v7];
  }
}

- (void)setEnabledCenterItems:(id)a3 duration:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:&unk_1ED3F6840];
  id v8 = v7;
  if (v7 && (int v9 = [v7 BOOLValue], self->_currentRawData.itemIsEnabled[0] != v9))
  {
    self->_currentRawData.itemIsEnabled[0] = v9;
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:&unk_1ED3F6858];
  uint64_t v12 = v11;
  if (v11 && (int v13 = [v11 BOOLValue], self->_currentRawData.itemIsEnabled[39] != v13))
  {
    self->_currentRawData.itemIsEnabled[39] = v13;
  }
  else if (!v10)
  {
    goto LABEL_17;
  }
  int64_t v14 = [(UIStatusBar *)self _currentComposedData];
  if ([(UIStatusBarForegroundView *)self->_newStyleForegroundView ignoringData]
    || [(UIStatusBarForegroundView *)self->_foregroundView ignoringData])
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB25D1D8);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      objc_super v18 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v6;
        __int16 v22 = 2048;
        double v23 = a4;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Setting center items enabled: %@, duration: %f. Pending the update instead.", (uint8_t *)&v20, 0x16u);
      }
    }
    [(UIStatusBarForegroundView *)self->_newStyleForegroundView setStatusBarData:v14 actions:64 animated:0];
    [(UIStatusBarForegroundView *)self->_foregroundView setStatusBarData:v14 actions:64 animated:0];
  }
  else
  {
    BOOL v16 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:1];
    unint64_t v17 = __UILogGetCategoryCachedImpl("StatusBar", &qword_1EB25D1E0);
    if (*(unsigned char *)v17)
    {
      uint64_t v19 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v6;
        __int16 v22 = 2048;
        double v23 = a4;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Crossfade setting center items enabled: %@, duration: %f", (uint8_t *)&v20, 0x16u);
      }
    }
    [(UIStatusBarForegroundView *)self->_newStyleForegroundView reflowItemViewsCrossfadingCenter:v14 duration:a4];
    [(UIStatusBarForegroundView *)self->_foregroundView reflowItemViewsCrossfadingCenter:v14 duration:a4];
    +[UIView setAnimationsEnabled:v16];
  }

LABEL_17:
}

- (void)animateUnlock
{
  [(UIStatusBarForegroundView *)self->_foregroundView animateUnlock];
  newStyleForegroundView = self->_newStyleForegroundView;
  [(UIStatusBarForegroundView *)newStyleForegroundView animateUnlock];
}

- (void)jiggleLockIcon
{
  [(UIStatusBarForegroundView *)self->_foregroundView jiggleLockIcon];
  newStyleForegroundView = self->_newStyleForegroundView;
  [(UIStatusBarForegroundView *)newStyleForegroundView jiggleLockIcon];
}

- (void)_itemViewPerformButtonAction:(id)a3
{
  id v14 = a3;
  BOOL v4 = [v14 object];
  objc_super v5 = [(UIStatusBar_Base *)self styleDelegate];
  if ([v4 isDescendantOfView:self])
  {
    id v6 = [v14 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"buttonType"];
    uint64_t v8 = [v7 integerValue];

    int v9 = [v14 userInfo];
    int v10 = [v9 objectForKeyedSubscript:@"buttonAction"];
    uint64_t v11 = [v10 integerValue];

    if (objc_opt_respondsToSelector())
    {
      [v5 statusBar:self didTriggerButtonType:v8 withAction:v11];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v14 userInfo];
      int v13 = [v12 objectForKeyedSubscript:@"buttonContext"];

      [v5 statusBar:self didTriggerButtonType:v8 withAction:v11 context:v13];
    }
  }
}

- (void)setRegistered:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBar;
  [(UIStatusBar_Base *)&v4 setRegistered:a3];
  [(UIStatusBar *)self _updatePersistentAnimationsEnabledForForegroundView:self->_foregroundView];
  [(UIStatusBar *)self _updatePersistentAnimationsEnabledForForegroundView:self->_newStyleForegroundView];
}

- (void)_updatePersistentAnimationsEnabledForForegroundView:(id)a3
{
  id v5 = a3;
  if ([(UIStatusBar_Base *)self registered]) {
    BOOL v4 = [(UIStatusBar_Base *)self persistentAnimationsEnabled];
  }
  else {
    BOOL v4 = 0;
  }
  [v5 setPersistentAnimationsEnabled:v4];
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIStatusBar_Base *)self persistentAnimationsEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBar;
    [(UIStatusBar_Base *)&v5 setPersistentAnimationsEnabled:v3];
    [(UIStatusBar *)self _updatePersistentAnimationsEnabledForForegroundView:self->_foregroundView];
    [(UIStatusBar *)self _updatePersistentAnimationsEnabledForForegroundView:self->_newStyleForegroundView];
  }
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIStatusBar_Base *)self foregroundColor];
  char v9 = [v8 isEqual:v6];

  if ((v9 & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIStatusBar;
    [(UIStatusBar_Base *)&v12 setForegroundColor:v6 animationParameters:v7];
    int v10 = [(UIStatusBar *)self styleRequest];
    uint64_t v11 = [(UIStatusBar *)self _styleAttributesForRequest:v10];

    [(UIStatusBar *)self _updateUIWithStyleAttributes:v11 animationParameters:v7];
  }
}

- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4
{
  id v6 = a4;
  id v7 = [(UIStatusBar *)self styleRequest];
  uint64_t v8 = [(UIStatusBar *)self _styleAttributesForRequest:v7];
  id v9 = (id)[v8 copy];

  [v9 setForegroundAlpha:a3];
  [(UIStatusBar *)self _updateUIWithStyleAttributes:v9 animationParameters:v6];
}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  id v6 = a4;
  if ([(UIStatusBar_Base *)self legibilityStyle] != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIStatusBar;
    [(UIStatusBar_Base *)&v9 setLegibilityStyle:a3 animationParameters:v6];
    id v7 = [(UIStatusBar *)self styleRequest];
    uint64_t v8 = [(UIStatusBar *)self _styleAttributesForRequest:v7];

    [(UIStatusBar *)self _updateUIWithStyleAttributes:v8 animationParameters:v6];
  }
}

- (id)currentStyleRequestForStyle:(int64_t)a3
{
  if (a3 == 110) {
    double v5 = 0.4;
  }
  else {
    double v5 = 1.0;
  }
  id v6 = [UIStatusBarStyleRequest alloc];
  int64_t v7 = [(UIStatusBar_Base *)self legibilityStyle];
  uint64_t v8 = [(UIStatusBar_Base *)self foregroundColor];
  objc_super v9 = [(UIStatusBarStyleRequest *)v6 initWithStyle:a3 legibilityStyle:v7 foregroundColor:v8 foregroundAlpha:self->_overrideHeight overrideHeight:v5];

  return v9;
}

- (id)styleRequest
{
  int64_t v3 = [(UIStatusBar *)self currentStyle];
  return [(UIStatusBar *)self currentStyleRequestForStyle:v3];
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBar;
  id v6 = a4;
  [(UIStatusBar_Base *)&v12 setStyleRequest:a3 animationParameters:v6];
  if ([(UIStatusBar_Base *)self _requestStyle] == 2000)
  {
    uint64_t v7 = 0;
LABEL_5:
    [(UIStatusBar_Base *)self _setRequestedStyle:v7];
    goto LABEL_6;
  }
  if ([(UIStatusBar_Base *)self _requestStyle] == 2001)
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v11 = 0;
  [(UIStatusBar_Base *)self _getStyle:&v11 andActiveOverride:&v10 forRequestedStyle:[(UIStatusBar_Base *)self _requestStyle]];
  [(UIStatusBar_Base *)self setActiveStyleOverride:v10];
  uint64_t v8 = [(UIStatusBar *)self currentStyleRequestForStyle:v11];
  objc_super v9 = [(UIStatusBar *)self _styleAttributesForRequest:v8];
  [(UIStatusBar *)self _updateUIWithStyleAttributes:v9 animationParameters:v6];
}

- (id)_currentStyleAttributes
{
  int64_t v3 = self->_styleAttributes;
  if (!v3)
  {
    BOOL v4 = [(UIStatusBar *)self currentStyleRequestForStyle:[(UIStatusBar_Base *)self styleForRequestedStyle:[(UIStatusBar_Base *)self _requestStyle]]];
    int64_t v3 = [(UIStatusBar *)self _styleAttributesForRequest:v4];
  }
  return v3;
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  actions = self->_actions;
  if (!actions)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_super v9 = self->_actions;
    self->_actions = v8;

    actions = self->_actions;
  }
  [(NSMutableDictionary *)actions setObject:v10 forKeyedSubscript:v6];
}

- (id)actionForPartWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_actions objectForKeyedSubscript:a3];
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"batteryPartIdentifier"])
  {
    uint64_t v5 = 12;
LABEL_5:
    [(UIStatusBarForegroundView *)self->_foregroundView frameForItemOfType:v5];
LABEL_11:
    double v11 = v6;
    double v12 = v7;
    double v13 = v8;
    double v14 = v9;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"clockPartIdentifier"])
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"fittingLeadingPartIdentifier"])
  {
    uint64_t v10 = 0;
LABEL_10:
    [(UIStatusBarForegroundView *)self->_foregroundView frameForAllItemsInRegion:v10];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"fittingTrailingPartIdentifier"])
  {
    uint64_t v10 = 1;
    goto LABEL_10;
  }
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_12:
  v23.origin.CGFloat x = v11;
  v23.origin.CGFloat y = v12;
  v23.size.CGFloat width = v13;
  v23.size.CGFloat height = v14;
  if (!CGRectIsEmpty(v23))
  {
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", self->_foregroundView, v11, v12, v13, v14);
    double v11 = v15;
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
  }

  double v19 = v11;
  double v20 = v12;
  double v21 = v13;
  double v22 = v14;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && ![v4 count])
  {
    uint64_t v5 = [(UIView *)self layer];
    double v6 = v5;
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v5 = [(UIView *)self layer];
    double v6 = v5;
    uint64_t v7 = 0;
  }
  [v5 setHidden:v7];
}

- (id)enabledPartIdentifiers
{
  uint64_t v2 = [(UIView *)self layer];
  int v3 = [v2 isHidden];

  if (v3) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  else {
    return 0;
  }
}

- (id)disabledPartIdentifiers
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBar;
  if (-[UIView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    foregroundView = self->_foregroundView;
    -[UIView convertPoint:fromView:](foregroundView, "convertPoint:fromView:", self, x, y);
    char v8 = -[UIStatusBarForegroundView pointInside:withEvent:](foregroundView, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar;
  [(UIView *)&v8 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  foregroundView = self->_foregroundView;
  id v7 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v7 actions:0 animated:0];
}

+ (void)_setDeviceUserInterfaceLayoutDirection:(int64_t)a3
{
  _deviceUserInterfaceLayoutDirection = a3;
}

+ (int64_t)_deviceUserInterfaceLayoutDirection
{
  return _deviceUserInterfaceLayoutDirection;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return _deviceUserInterfaceLayoutDirection == 1;
}

- (void)_setDisablesRasterization:(BOOL)a3
{
  self->_disablesRasterization = a3;
  [(UIStatusBar *)self _updateShouldRasterize];
}

- (void)_updateShouldRasterize
{
  if ([(NSMutableSet *)self->_disableRasterizationReasons count]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = !self->_disablesRasterization;
  }
  id v4 = [(UIView *)self layer];
  int v5 = [v4 shouldRasterize];

  if (v3 != v5)
  {
    id v6 = [(UIView *)self layer];
    [v6 setShouldRasterize:v3];
  }
}

- (void)_beginDisablingRasterizationForReason:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_disableRasterizationReasons, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->_disableRasterizationReasons addObject:v4];
    [(UIStatusBar *)self _updateShouldRasterize];
  }
}

- (void)_endDisablingRasterizationForReason:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_disableRasterizationReasons, "containsObject:"))
  {
    [(NSMutableSet *)self->_disableRasterizationReasons removeObject:v4];
    [(UIStatusBar *)self _updateShouldRasterize];
  }
}

- (void)_itemViewShouldBeginDisablingRasterization:(id)a3
{
  id v7 = [a3 object];
  if ([v7 isDescendantOfView:self])
  {
    id v4 = NSNumber;
    int v5 = [v7 item];
    id v6 = objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(v5, "type"));

    [(UIStatusBar *)self _beginDisablingRasterizationForReason:v6];
  }
}

- (void)_itemViewShouldEndDisablingRasterization:(id)a3
{
  id v7 = [a3 object];
  if ([v7 isDescendantOfView:self])
  {
    id v4 = NSNumber;
    int v5 = [v7 item];
    id v6 = objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(v5, "type"));

    [(UIStatusBar *)self _endDisablingRasterizationForReason:v6];
  }
}

- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_super v8 = [(UIStatusBar_Base *)self inProcessStateProvider];

  if (v8) {
    return;
  }
  if ((_shouldAutomaticallyDetectCenterItemAnimation & 1) == 0)
  {
    if (a4->var0[0] == self->_currentRawData.itemIsEnabled[0])
    {
      uint64_t v10 = &a4->var0[39];
      if (a4->var0[39] == self->_currentRawData.itemIsEnabled[39])
      {
        id v20 = 0;
        BOOL v9 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1CA60] dictionary];
      double v12 = [NSNumber numberWithBool:a4->var0[0]];
      [v20 setObject:v12 forKeyedSubscript:&unk_1ED3F6840];

      uint64_t v10 = &a4->var0[39];
      BOOL v13 = a4->var0[39];
      if (v13 == self->_currentRawData.itemIsEnabled[39])
      {
        BOOL v9 = 0;
        char v11 = 0;
        goto LABEL_15;
      }
      uint64_t v14 = (uint64_t)v20;
      if (v20)
      {
LABEL_14:
        id v20 = (id)v14;
        double v15 = [NSNumber numberWithBool:v13];
        [v20 setObject:v15 forKeyedSubscript:&unk_1ED3F6858];

        char v11 = 0;
        BOOL v9 = !*v10;
        goto LABEL_15;
      }
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v13 = *v10;
    goto LABEL_14;
  }
  if (a4)
  {
    id v20 = 0;
    BOOL v9 = 0;
LABEL_8:
    char v11 = 1;
LABEL_15:
    memcpy(&self->_currentRawData, a4, sizeof(self->_currentRawData));
    +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:((unint64_t)*((unsigned __int8 *)&self->_currentRawData + 2536) >> 1) & 1];
    if ((v11 & 1) == 0 && (_shouldAutomaticallyDetectCenterItemAnimation & 1) == 0)
    {
      if (v9)
      {
        [(UIStatusBarForegroundView *)self->_foregroundView animateUnlock];
        [(UIStatusBarForegroundView *)self->_newStyleForegroundView animateUnlock];
      }
      [(UIStatusBar *)self setEnabledCenterItems:v20 duration:0.4];
    }
    goto LABEL_20;
  }
  id v20 = 0;
LABEL_20:
  foregroundView = self->_foregroundView;
  double v17 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v17 actions:v5 animated:1];

  newStyleForegroundView = self->_newStyleForegroundView;
  double v19 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)newStyleForegroundView setStatusBarData:v19 actions:v5 animated:1];
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  id v6 = a3;
  if ([(UIStatusBar_Base *)self styleOverrides] != a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIStatusBar;
    [(UIStatusBar_Base *)&v7 statusBarServer:v6 didReceiveStyleOverrides:a4];
    [(UIStatusBar_Base *)self requestStyle:[(UIStatusBar_Base *)self _requestStyle] animated:1];
  }
  self->_waitingOnCallbackAfterChangingStyleOverridesLocalldouble y = 0;
}

- (void)statusBarServer:(id)a3 didReceiveGlowAnimationState:(BOOL)a4 forStyle:(int64_t)a5
{
  BOOL v5 = a4;
  if ([(UIStatusBar *)self currentStyle] == a5)
  {
    backgroundView = self->_backgroundView;
    [(UIStatusBarBackgroundView *)backgroundView setGlowAnimationEnabled:v5];
  }
}

- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5
{
  id v7 = a4;
  if ([(UIStatusBar *)self currentStyle] == a5
    && ![(UIStatusBar *)self _shouldUseInProcessProviderDoubleHeightStatusString])
  {
    [(UIStatusBar *)self _setDoubleHeightStatusString:v7];
  }
}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (a4) {
    memcpy(&self->_currentRawData, a4, sizeof(self->_currentRawData));
  }
  +[UIStatusBar _setDeviceUserInterfaceLayoutDirection:((unint64_t)*((unsigned __int8 *)&self->_currentRawData + 2536) >> 1) & 1];
  foregroundView = self->_foregroundView;
  objc_super v8 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v8 actions:v5 animated:1];

  newStyleForegroundView = self->_newStyleForegroundView;
  id v10 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)newStyleForegroundView setStatusBarData:v10 actions:v5 animated:1];
}

- (void)statusBarStateProvider:(id)a3 didChangeDoubleHeightStatusStringForStyle:(int64_t)a4
{
  if ([(UIStatusBar *)self currentStyle] == a4
    && [(UIStatusBar *)self _shouldUseInProcessProviderDoubleHeightStatusString])
  {
    id v6 = [(UIStatusBar *)self _doubleHeightStatusStringForStyle:a4];
    [(UIStatusBar *)self _setDoubleHeightStatusString:v6];
  }
}

- (id)_backgroundView
{
  return self->_backgroundView;
}

- (BOOL)_isTransparent
{
  uint64_t v2 = [(UIStatusBarBackgroundView *)self->_backgroundView style];
  char v3 = [v2 isTransparent];

  return v3;
}

- (id)_currentComposedData
{
  return [(UIStatusBar *)self _currentComposedDataForStyle:self->_styleAttributes];
}

- (id)_currentComposedDataForStyle:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(__dst, 0, 512);
  if ([(UIStatusBar_Base *)self localDataOverrides]) {
    +[UIStatusBar getData:__dst forRequestedData:&self->_currentRawData withOverrides:[(UIStatusBar_Base *)self localDataOverrides]];
  }
  else {
    memcpy(__dst, &self->_currentRawData, sizeof(__dst));
  }
  uint64_t v5 = [[UIStatusBarComposedData alloc] initWithRawData:__dst];
  id v6 = [(UIStatusBar_Base *)self styleDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 statusBarSystemNavigationAction:self];
    [(UIStatusBarComposedData *)v5 setSystemNavigationItem:v7];
  }
  [(UIStatusBarComposedData *)v5 setDoubleHeightStatus:self->_currentDoubleHeightText];
  v22[0] = !self->_showOnlyCenterItems;
  v22[1] = v22[0];
  v22[2] = 1;
  uint64_t v8 = [v4 idiom];
  BOOL v9 = [(UIView *)self _screen];
  id v10 = [v9 _capabilities];

  uint64_t v11 = 46;
  do
  {
    BOOL v12 = [(UIStatusBar_Base *)self homeItemsDisabled];
    if (v11 == 46 && v12) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = [v4 shouldShowInternalItemType:v11 withScreenCapabilities:v10];
    }
    [(UIStatusBarComposedData *)v5 setItem:v11 enabled:v13];
    BOOL v14 = +[UIStatusBarItem isItemWithTypeExclusive:v11 outBlacklistItems:0 outWhitelistItems:0];
    if (v13 && v14)
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        if (+[UIStatusBarItem itemType:v11 idiom:v8 appearsInRegion:i])
        {
          v22[i] = 0;
        }
      }
    }
    uint64_t v11 = (v11 + 1);
  }
  while (v11 != 52);
  uint64_t v16 = 0;
  do
  {
    if (+[UIStatusBarItem itemType:v16 idiom:v8 canBeEnabledForData:v5 style:v4])
    {
      uint64_t v17 = 0;
      while (v22[v17]
           || !+[UIStatusBarItem itemType:v16 idiom:v8 appearsInRegion:v17])
      {
        if (++v17 == 3)
        {
          uint64_t v18 = 1;
          goto LABEL_26;
        }
      }
    }
    uint64_t v18 = 0;
LABEL_26:
    [(UIStatusBarComposedData *)v5 setItem:v16 enabled:v18];
    uint64_t v16 = (v16 + 1);
  }
  while (v16 != 46);
  double v19 = (void *)CFPreferencesCopyAppValue(@"StatusBarPrimaryNavigationTitleOverride", @"com.apple.UIKit");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v19 length]) {
    strncpy((char *)(-[UIStatusBarComposedData rawData](v5, "rawData") + 2537), (const char *)[v19 UTF8String], 0x100uLL);
  }
  id v20 = (void *)CFPreferencesCopyAppValue(@"StatusBarSecondaryNavigationURLOverride", @"com.apple.UIKit");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v20 length]) {
    strncpy((char *)(-[UIStatusBarComposedData rawData](v5, "rawData") + 2793), (const char *)[v20 UTF8String], 0x100uLL);
  }

  return v5;
}

- (void)_setOverrideHeight:(double)a3
{
  overrideHeight = self->_overrideHeight;
  if (!overrideHeight || ([(NSNumber *)overrideHeight doubleValue], v6 != a3))
  {
    id v7 = [NSNumber numberWithDouble:a3];
    uint64_t v8 = self->_overrideHeight;
    self->_overrideHeight = v7;
  }
}

- (void)_clearOverrideHeight
{
  overrideHeight = self->_overrideHeight;
  self->_overrideHeight = 0;
}

- (void)_performBlockWhileIgnoringForegroundViewChanges:(id)a3
{
  self->_BOOL foregroundViewShouldIgnoreStatusBarDataDuringAnimation = 1;
  if (a3) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  self->_BOOL foregroundViewShouldIgnoreStatusBarDataDuringAnimation = 0;
}

- (BOOL)_rectIntersectsTimeItem:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (-[UIStatusBarForegroundView rectIntersectsTimeItem:](self->_foregroundView, "rectIntersectsTimeItem:")) {
    return 1;
  }
  newStyleForegroundView = self->_newStyleForegroundView;
  return -[UIStatusBarForegroundView rectIntersectsTimeItem:](newStyleForegroundView, "rectIntersectsTimeItem:", x, y, width, height);
}

- (void)_dateTimePreferencesUpdated
{
  foregroundView = self->_foregroundView;
  id v3 = [(UIStatusBar *)self _currentComposedData];
  [(UIStatusBarForegroundView *)foregroundView setStatusBarData:v3 actions:512 animated:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _UIKitUserDefaults();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    [(UIStatusBar *)self _dateTimePreferencesUpdated];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIStatusBar;
    [(UIStatusBar *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)disablesRasterization
{
  return self->_disablesRasterization;
}

- (BOOL)isTimeHidden
{
  return self->_timeHidden;
}

- (void)setTimeHidden:(BOOL)a3
{
  self->_timeHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_disableRasterizationReasons, 0);
  objc_storeStrong((id *)&self->_overrideHeight, 0);
  objc_storeStrong((id *)&self->_nextTintTransition, 0);
  objc_storeStrong((id *)&self->_lastUsedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_slidingStatusBar, 0);
  objc_storeStrong((id *)&self->_newStyleForegroundView, 0);
  objc_storeStrong((id *)&self->_newStyleBackgroundView, 0);
  objc_storeStrong((id *)&self->_interruptedAnimationCompositeViews, 0);
  objc_storeStrong((id *)&self->_currentDoubleHeightText, 0);
  objc_storeStrong((id *)&self->_doubleHeightLabelContainer, 0);
  objc_storeStrong((id *)&self->_doubleHeightLabel, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

uint64_t __51__UIStatusBar_Base__setHidden_animationParameters___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__UIStatusBar_Base__performAnimations_withParameters_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __91__UIStatusBar_Modern__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained styleDelegate];
  uint64_t v3 = (void *)v2;
  uint64_t v4 = 1;
  if (WeakRetained && v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v4 = [v3 statusBarShouldDisableRegionActions:WeakRetained] ^ 1;
  }

  return v4;
}

uint64_t __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t result = [*(id *)(a1 + 32) _requestStyle];
  if (v2 == result)
  {
    [*(id *)(a1 + 32) _updateWithData:0 force:0];
    [*(id *)(*(void *)(a1 + 32) + 592) setStyle:*(void *)(a1 + 64)];
    [*(id *)(*(void *)(a1 + 32) + 592) setForegroundColor:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2;
    v5[3] = &unk_1E52EFB10;
    v5[4] = *(void *)(a1 + 32);
    return [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
  return result;
}

void __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 592), "setStyle:forPartWithIdentifier:", objc_msgSend(a3, "integerValue"), v5);
}

uint64_t __61__UIStatusBar_Modern_setForegroundAlpha_animationParameters___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 592) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __34__UIStatusBar_Modern_forceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithData:0 force:1];
}

uint64_t __38__UIStatusBar_Modern_forceUpdateData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithData:*(void *)(a1 + 40) force:0];
}

@end