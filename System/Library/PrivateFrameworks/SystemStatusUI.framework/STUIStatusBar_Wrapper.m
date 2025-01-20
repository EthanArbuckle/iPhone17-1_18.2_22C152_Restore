@interface STUIStatusBar_Wrapper
+ (UIView)sensorActivityIndicator;
+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7;
+ (id)sensorActivityIndicatorForScreen:(id)a3;
+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5;
+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4;
+ (void)setSensorActivityIndicator:(id)a3;
- (CGRect)frameForPartWithIdentifier:(id)a3;
- (CGSize)intrinsicContentSize;
- (NSSet)backgroundActivities;
- (NSString)activeBackgroundActivity;
- (STUIStatusBar)statusBar;
- (UIOffset)offsetForPartWithIdentifier:(id)a3;
- (double)alphaForPartWithIdentifier:(id)a3;
- (double)defaultDoubleHeight;
- (id)_dataFromLegacyData:(id *)a3;
- (id)_effectiveDataFromData:(id)a3 activeOverride:(unint64_t)a4 activeBackgroundActivity:(id)a5 canUpdateBackgroundActivity:(BOOL)a6;
- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6;
- (id)actionForPartWithIdentifier:(id)a3;
- (id)clockFont;
- (id)disabledPartIdentifiers;
- (id)enabledPartIdentifiers;
- (int64_t)_effectiveStyleFromStyle:(int64_t)a3;
- (int64_t)_requestedResolvedStyle;
- (int64_t)currentStyle;
- (unint64_t)_implicitStyleOverrideForStyle:(int64_t)a3;
- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 andActiveBackgroundActivity:(id *)a5 forRequestedStyle:(int64_t)a6 updatingBackgroundActivity:(BOOL)a7;
- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 forRequestedStyle:(int64_t)a5;
- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6;
- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8;
- (void)_setRequestedResolvedStyle:(int64_t)a3;
- (void)_updateSemanticContentAttributeFromLegacyData:(id *)a3;
- (void)_updateWithData:(id)a3 force:(BOOL)a4;
- (void)activeBackgroundActivitiesDidUpdate:(id)a3;
- (void)dealloc;
- (void)forceUpdate:(BOOL)a3;
- (void)forceUpdateData:(BOOL)a3;
- (void)jiggleLockIcon;
- (void)layoutSubviews;
- (void)requestResolvedStyle:(int64_t)a3;
- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4;
- (void)setActiveBackgroundActivity:(id)a3;
- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5;
- (void)setBackgroundActivities:(id)a3;
- (void)setDisabledPartIdentifiers:(id)a3;
- (void)setEnabledPartIdentifiers:(id)a3;
- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4;
- (void)setForegroundColor:(id)a3 animationParameters:(id)a4;
- (void)setHidden:(BOOL)a3 animationParameters:(id)a4;
- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4;
- (void)setMode:(int64_t)a3;
- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setStatusBar:(id)a3;
- (void)setStyleRequest:(id)a3 animationParameters:(id)a4;
- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5;
- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5;
- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4;
- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5;
@end

@implementation STUIStatusBar_Wrapper

- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 forRequestedStyle:(int64_t)a5
{
}

- (STUIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
}

- (void)layoutSubviews
{
  [(STUIStatusBar_Wrapper *)self bounds];
  statusBar = self->_statusBar;
  -[STUIStatusBar setFrame:](statusBar, "setFrame:");
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  BOOL v7 = a7;
  v10 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", a3, a4, a5, a6);
  +[STUIStatusBar intrinsicContentSizeForTargetScreen:v10 orientation:a4 onLockScreen:a3 == 306 isAzulBLinked:v7];
  double v12 = v11;

  return v12;
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _UIStatusBarResolvedStyleFromStyle();
  uint64_t v12 = [(STUIStatusBar_Wrapper *)self legibilityStyle];
  id v13 = [(STUIStatusBar_Wrapper *)self foregroundColor];
  [(STUIStatusBar_Wrapper *)self _requestStyle:v11 partStyles:v10 legibilityStyle:v12 foregroundColor:v13 animationParameters:v9 forced:v6];
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBar_Wrapper;
  id v6 = a4;
  id v7 = a3;
  [(STUIStatusBar_Wrapper *)&v11 setStyleRequest:v7 animationParameters:v6];
  uint64_t v8 = objc_msgSend(v7, "resolvedStyle", v11.receiver, v11.super_class);
  uint64_t v9 = [v7 legibilityStyle];
  id v10 = [v7 foregroundColor];

  [(STUIStatusBar_Wrapper *)self _requestStyle:v8 partStyles:0 legibilityStyle:v9 foregroundColor:v10 animationParameters:v6 forced:0];
}

- (void)requestResolvedStyle:(int64_t)a3
{
  uint64_t v5 = [(STUIStatusBar_Wrapper *)self legibilityStyle];
  id v7 = [(STUIStatusBar_Wrapper *)self foregroundColor];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1C90]) initWithDefaultParameters];
  [(STUIStatusBar_Wrapper *)self _requestStyle:a3 partStyles:0 legibilityStyle:v5 foregroundColor:v7 animationParameters:v6 forced:0];
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (a3 || ([(STUIStatusBar_Wrapper *)self _requestedResolvedStyle] & 0x3F) != 0) {
    [(STUIStatusBar_Wrapper *)self _setRequestedResolvedStyle:a3];
  }
  else {
    a3 = [(STUIStatusBar_Wrapper *)self _requestedResolvedStyle];
  }
  uint64_t v17 = _UIStatusBarStyleFromResolvedStyle();
  uint64_t v18 = [(STUIStatusBar_Wrapper *)self manager];
  if (!v18
    || (v19 = (void *)v18,
        [(STUIStatusBar_Wrapper *)self manager],
        v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 statusBar:self shouldRequestStyle:v17 animationParameters:v16 forced:v8],
        v20,
        v19,
        v21))
  {
    uint64_t v22 = [(STUIStatusBar_Wrapper *)self styleForRequestedStyle:[(STUIStatusBar_Wrapper *)self _effectiveStyleFromStyle:v17]];
    if (a5)
    {
      _UIStatusBarStyleFromLegibilityStyle();
    }
    else if (v22 == v17)
    {
LABEL_10:
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __109__STUIStatusBar_Wrapper__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke;
      v23[3] = &unk_1E6AA3F08;
      int64_t v26 = a3;
      v23[4] = self;
      id v24 = v15;
      id v25 = v14;
      [(STUIStatusBar_Wrapper *)self _performAnimations:v23 withParameters:v16 completion:0];

      goto LABEL_11;
    }
    a3 = _UIStatusBarResolvedStyleFromStyle();
    goto LABEL_10;
  }
LABEL_11:
}

- (int64_t)_requestedResolvedStyle
{
  return self->_requestedResolvedStyle;
}

- (int64_t)_effectiveStyleFromStyle:(int64_t)a3
{
  if (!(!v4 & v3))
  {
    switch(a3)
    {
      case 300:
      case 304:
      case 305:
        return 0;
      case 301:
      case 302:
      case 303:
      case 306:
        return 1;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 'g':
    case 'j':
    case 'l':
      return 1;
    case 'h':
    case 'i':
      goto LABEL_13;
    case 'k':
      return 0;
    case 'm':
      return 3;
    case 'n':
      return 110;
    default:
      if ((unint64_t)a3 > 0x33) {
        goto LABEL_13;
      }
      if (((1 << a3) & 0xB) != 0) {
        return a3;
      }
      if (((1 << a3) & 0x8000000000004) != 0)
      {
        return 1;
      }
      else
      {
LABEL_13:
        [(STUIStatusBar *)self->_statusBar style];
        return _UIStatusBarStyleFromResolvedStyle();
      }
  }
}

- (id)_effectiveDataFromData:(id)a3 activeOverride:(unint64_t)a4 activeBackgroundActivity:(id)a5 canUpdateBackgroundActivity:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = v10;
  id v13 = v11;
  if (v11)
  {
LABEL_98:
    id v16 = v13;
    if ([(id)_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry isEnabled]&& (objc_msgSend((id)_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "backgroundActivityIdentifier"), id v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v16 == v17))
    {
      [(id)_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry displayStartDate];
    }
    else
    {
      double v18 = CACurrentMediaTime();
    }
    double v19 = v18;
    v20 = (void *)MEMORY[0x1E4FA9450];
    int v21 = (void *)MEMORY[0x1E4FB1C88];
    uint64_t v22 = [0 backgroundActivityIdentifier];
    v23 = objc_msgSend(v21, "stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:", v22);
    id v24 = [v20 entryWithBackgroundActivityIdentifier:v16 displayStartDate:v23 detailString:v19];

    if (v6) {
      goto LABEL_102;
    }
    goto LABEL_103;
  }
  if ((uint64_t)a4 >= 0x200000)
  {
    if ((uint64_t)a4 <= 0x7FFFFFFF)
    {
      if ((uint64_t)a4 <= 0x3FFFFFF)
      {
        if ((uint64_t)a4 < 0x800000)
        {
          if (a4 == 0x200000)
          {
            id v14 = (void **)MEMORY[0x1E4FA9638];
            goto LABEL_97;
          }
          if (a4 == 0x400000)
          {
            id v14 = (void **)MEMORY[0x1E4FA95B8];
            goto LABEL_97;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x800000uLL:
              id v14 = (void **)MEMORY[0x1E4FA95B0];
              goto LABEL_97;
            case 0x1000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA96D8];
              goto LABEL_97;
            case 0x2000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA9608];
              goto LABEL_97;
          }
        }
        goto LABEL_112;
      }
      if ((uint64_t)a4 <= 0xFFFFFFF)
      {
        if (a4 == 0x4000000)
        {
          id v14 = (void **)MEMORY[0x1E4FA9600];
          goto LABEL_97;
        }
        if (a4 == 0x8000000)
        {
          id v14 = (void **)MEMORY[0x1E4FA95D0];
          goto LABEL_97;
        }
        goto LABEL_112;
      }
      if (a4 == 0x10000000)
      {
        id v14 = (void **)MEMORY[0x1E4FA96C8];
        goto LABEL_97;
      }
      if (a4 == 0x20000000)
      {
        id v14 = (void **)MEMORY[0x1E4FA9670];
        goto LABEL_97;
      }
      uint64_t v15 = 0x40000000;
    }
    else
    {
      if ((uint64_t)a4 > 0xFFFFFFFFFLL)
      {
        if ((uint64_t)a4 > 0x7FFFFFFFFFLL)
        {
          switch(a4)
          {
            case 0x8000000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA96C0];
              goto LABEL_97;
            case 0x10000000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA96A0];
              goto LABEL_97;
            case 0x20000000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA9658];
              goto LABEL_97;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x1000000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA9598];
              goto LABEL_97;
            case 0x2000000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA9618];
              goto LABEL_97;
            case 0x4000000000uLL:
              id v14 = (void **)MEMORY[0x1E4FA95C8];
LABEL_97:
              id v13 = *v14;
              goto LABEL_98;
          }
        }
        goto LABEL_112;
      }
      if ((uint64_t)a4 > 0x1FFFFFFFFLL)
      {
        if (a4 != 0x200000000)
        {
          if (a4 == 0x400000000)
          {
            id v14 = (void **)MEMORY[0x1E4FA9660];
            goto LABEL_97;
          }
          if (a4 == 0x800000000)
          {
            id v14 = (void **)MEMORY[0x1E4FA9678];
            goto LABEL_97;
          }
          goto LABEL_112;
        }
LABEL_74:
        id v14 = (void **)MEMORY[0x1E4FA96A8];
        goto LABEL_97;
      }
      if (a4 == 0x80000000) {
        goto LABEL_74;
      }
      uint64_t v15 = 0x100000000;
    }
    if (a4 == v15)
    {
      id v14 = (void **)MEMORY[0x1E4FA9698];
      goto LABEL_97;
    }
    goto LABEL_112;
  }
  if ((uint64_t)a4 > 2047)
  {
    if ((uint64_t)a4 >= 0x10000)
    {
      if ((uint64_t)a4 < 0x40000)
      {
        if (a4 == 0x10000)
        {
          id v14 = (void **)MEMORY[0x1E4FA95E8];
          goto LABEL_97;
        }
        if (a4 == 0x20000)
        {
          id v14 = (void **)MEMORY[0x1E4FA96E0];
          goto LABEL_97;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x40000uLL:
            id v14 = (void **)MEMORY[0x1E4FA95A0];
            goto LABEL_97;
          case 0x80000uLL:
            id v14 = (void **)MEMORY[0x1E4FA95F0];
            goto LABEL_97;
          case 0x100000uLL:
            id v14 = (void **)MEMORY[0x1E4FA9680];
            goto LABEL_97;
        }
      }
    }
    else if ((uint64_t)a4 < 0x2000)
    {
      if (a4 == 2048)
      {
        id v14 = (void **)MEMORY[0x1E4FA95C0];
        goto LABEL_97;
      }
      if (a4 == 4096)
      {
        id v14 = (void **)MEMORY[0x1E4FA95E0];
        goto LABEL_97;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x2000uLL:
          id v14 = (void **)MEMORY[0x1E4FA96B0];
          goto LABEL_97;
        case 0x4000uLL:
          id v14 = (void **)MEMORY[0x1E4FA9690];
          goto LABEL_97;
        case 0x8000uLL:
          id v14 = (void **)MEMORY[0x1E4FA95F8];
          goto LABEL_97;
      }
    }
  }
  else if ((uint64_t)a4 > 63)
  {
    if ((uint64_t)a4 <= 255)
    {
      if (a4 == 64 || a4 == 128)
      {
        id v14 = (void **)MEMORY[0x1E4FA9640];
        goto LABEL_97;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x100uLL:
          id v14 = (void **)MEMORY[0x1E4FA95A8];
          goto LABEL_97;
        case 0x200uLL:
          id v14 = (void **)MEMORY[0x1E4FA96D0];
          goto LABEL_97;
        case 0x400uLL:
          id v14 = (void **)MEMORY[0x1E4FA9610];
          goto LABEL_97;
      }
    }
  }
  else if ((uint64_t)a4 <= 7)
  {
    if (a4 == 1)
    {
      id v14 = (void **)MEMORY[0x1E4FA9620];
      goto LABEL_97;
    }
    if (a4 == 4)
    {
      id v14 = (void **)MEMORY[0x1E4FA9668];
      goto LABEL_97;
    }
  }
  else
  {
    switch(a4)
    {
      case 8uLL:
        id v14 = (void **)MEMORY[0x1E4FA96B8];
        goto LABEL_97;
      case 0x10uLL:
        id v14 = (void **)MEMORY[0x1E4FA9628];
        goto LABEL_97;
      case 0x20uLL:
        id v14 = (void **)MEMORY[0x1E4FA9688];
        goto LABEL_97;
    }
  }
LABEL_112:
  id v24 = [MEMORY[0x1E4FA9450] disabledEntry];
  id v16 = 0;
  if (v6) {
LABEL_102:
  }
    objc_storeStrong((id *)&_effectiveDataFromData_activeOverride_activeBackgroundActivity_canUpdateBackgroundActivity__lastBackgroundActivityEntry, v24);
LABEL_103:
  id v25 = [(STUIStatusBar *)self->_statusBar currentData];
  int64_t v26 = [v25 backgroundActivityEntry];

  v27 = v12;
  if ((BSEqualObjects() & 1) == 0)
  {
    if (v12) {
      id v28 = (id)[v12 mutableCopy];
    }
    else {
      id v28 = objc_alloc_init(MEMORY[0x1E4FA9418]);
    }
    v29 = v28;
    [v28 setBackgroundActivityEntry:v24];
    v27 = [v29 immutableCopy];
  }
  return v27;
}

- (void)_updateWithData:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    id v7 = [(STUIStatusBar *)self->_statusBar currentData];

    if (!v7) {
      goto LABEL_15;
    }
  }
  uint64_t v16 = 0;
  BOOL v8 = [(STUIStatusBar_Wrapper *)self styleDelegate];

  if (v8)
  {
    id v15 = 0;
    [(STUIStatusBar *)self->_statusBar style];
    [(STUIStatusBar_Wrapper *)self _getStyle:0 andActiveOverride:&v16 andActiveBackgroundActivity:&v15 forRequestedStyle:_UIStatusBarStyleFromResolvedStyle() updatingBackgroundActivity:0];
    id v9 = v15;
    if (v9)
    {
      id v10 = v9;
      [(STUIStatusBar_Wrapper *)self setActiveBackgroundActivity:v9];
      goto LABEL_9;
    }
    uint64_t v11 = v16;
    if (!v16) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v11 = [(STUIStatusBar_Wrapper *)self styleOverrides];
    uint64_t v16 = v11;
    if (!v11)
    {
LABEL_7:
      uint64_t v11 = [(STUIStatusBar_Wrapper *)self _implicitStyleOverrideForStyle:[(STUIStatusBar_Wrapper *)self _requestStyle]];
      uint64_t v16 = v11;
    }
  }
  [(STUIStatusBar_Wrapper *)self setActiveStyleOverride:v11];
  id v10 = 0;
LABEL_9:
  uint64_t v12 = [(STUIStatusBar_Wrapper *)self activeStyleOverride];
  id v13 = [(STUIStatusBar_Wrapper *)self styleDelegate];
  [(STUIStatusBar_Wrapper *)self _effectiveDataFromData:v6 activeOverride:v12 activeBackgroundActivity:v10 canUpdateBackgroundActivity:v13 != 0];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 || v4)
  {
    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x1E4FA9440]);
    }
    [(STUIStatusBar *)self->_statusBar updateWithData:v14];
  }
LABEL_15:
}

- (void)_getStyle:(int64_t *)a3 andActiveOverride:(unint64_t *)a4 andActiveBackgroundActivity:(id *)a5 forRequestedStyle:(int64_t)a6 updatingBackgroundActivity:(BOOL)a7
{
  uint64_t v12 = [(STUIStatusBar_Wrapper *)self styleDelegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v14 = a6 == 306 || (a6 & 0xFFFFFFFFFFFFFFFELL) == 108;
    id v15 = [(STUIStatusBar_Wrapper *)self backgroundActivities];
    uint64_t v16 = [v12 statusBar:self effectiveBackgroundActivitiesForBackgroundActiviesWithIdentifiers:v15];

    id v17 = [MEMORY[0x1E4FA9348] sharedInstance];
    double v18 = [v17 resolvedBackgroundActivityFromBackgroundActivities:v16 inPrecedenceScope:v14];

    if (a4) {
      *a4 = 0;
    }
    if (a5) {
      *a5 = v18;
    }
    if (a3) {
      *a3 = a6;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STUIStatusBar_Wrapper;
    [(STUIStatusBar_Wrapper *)&v19 _getStyle:a3 andActiveOverride:a4 forRequestedStyle:a6];
  }
}

- (NSSet)backgroundActivities
{
  return self->_backgroundActivities;
}

- (unint64_t)_implicitStyleOverrideForStyle:(int64_t)a3
{
  unint64_t result = 0x20000000;
  switch(a3)
  {
    case 200:
LABEL_18:
      unint64_t result = 1;
      break;
    case 201:
    case 228:
    case 229:
LABEL_32:
      unint64_t result = 0;
      break;
    case 202:
LABEL_11:
      unint64_t result = 0x20000;
      break;
    case 203:
LABEL_12:
      unint64_t result = 0x1000000;
      break;
    case 204:
LABEL_13:
      unint64_t result = 0x2000000;
      break;
    case 205:
LABEL_14:
      unint64_t result = 0x4000000;
      break;
    case 206:
LABEL_9:
      unint64_t result = 4;
      break;
    case 207:
LABEL_4:
      unint64_t result = 8;
      break;
    case 208:
LABEL_17:
      unint64_t result = 16;
      break;
    case 209:
      unint64_t result = 64;
      break;
    case 210:
      unint64_t result = 128;
      break;
    case 211:
      unint64_t result = 1024;
      break;
    case 212:
LABEL_7:
      unint64_t result = 2048;
      break;
    case 213:
LABEL_8:
      unint64_t result = 0x2000;
      break;
    case 214:
      unint64_t result = 0x4000;
      break;
    case 215:
      unint64_t result = 0x8000;
      break;
    case 216:
      unint64_t result = 0x200000;
      break;
    case 217:
LABEL_10:
      unint64_t result = 0x10000;
      break;
    case 218:
LABEL_19:
      unint64_t result = 0x80000;
      break;
    case 219:
LABEL_20:
      unint64_t result = 0x40000;
      break;
    case 220:
LABEL_16:
      unint64_t result = 0x8000000;
      break;
    case 221:
LABEL_15:
      unint64_t result = 0x10000000;
      break;
    case 222:
    case 223:
      return result;
    case 224:
LABEL_21:
      unint64_t result = 0x40000000;
      break;
    case 225:
LABEL_22:
      unint64_t result = 0x400000000;
      break;
    case 226:
LABEL_23:
      unint64_t result = 0x1000000000;
      break;
    case 227:
LABEL_24:
      unint64_t result = 0x2000000000;
      break;
    case 230:
LABEL_25:
      unint64_t result = 0x20000000000;
      break;
    default:
      switch(a3)
      {
        case 1001:
          goto LABEL_4;
        case 1002:
          goto LABEL_7;
        case 1003:
          goto LABEL_8;
        case 1004:
          goto LABEL_9;
        case 1005:
          goto LABEL_10;
        case 1006:
          goto LABEL_11;
        case 1007:
          goto LABEL_12;
        case 1008:
          goto LABEL_13;
        case 1009:
          goto LABEL_14;
        case 1010:
          goto LABEL_15;
        case 1011:
          goto LABEL_16;
        case 1012:
          goto LABEL_17;
        case 1013:
          goto LABEL_18;
        case 1014:
          goto LABEL_19;
        case 1015:
          goto LABEL_20;
        case 1016:
        case 1020:
        case 1021:
        case 1025:
        case 1026:
          goto LABEL_32;
        case 1017:
        case 1018:
          return result;
        case 1019:
          goto LABEL_21;
        case 1022:
          goto LABEL_22;
        case 1023:
          goto LABEL_23;
        case 1024:
          goto LABEL_24;
        case 1027:
          goto LABEL_25;
        default:
          switch(a3)
          {
            case 'h':
              unint64_t result = 32;
              break;
            case 'i':
              unint64_t result = 256;
              break;
            case 'o':
              unint64_t result = 0x100000;
              break;
            case 'p':
              unint64_t result = 4096;
              break;
            case 'q':
              unint64_t result = 0x400000;
              break;
            case 'r':
              unint64_t result = 0x800000;
              break;
            default:
              goto LABEL_32;
          }
          break;
      }
      break;
  }
  return result;
}

- (void)_setRequestedResolvedStyle:(int64_t)a3
{
  self->_requestedResolvedStyle = a3;
}

- (void)setHidden:(BOOL)a3 animationParameters:(id)a4
{
  BOOL v4 = a3;
  statusBar = self->_statusBar;
  id v7 = a4;
  [(STUIStatusBar *)statusBar setHidden:v4 animationParameters:v7];
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBar_Wrapper;
  [(STUIStatusBar_Wrapper *)&v8 setHidden:v4 animationParameters:v7];
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
  v24.receiver = self;
  v24.super_class = (Class)STUIStatusBar_Wrapper;
  id v14 = -[STUIStatusBar_Wrapper _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v24, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, v7, v6, v13, x, y, width, height);
  if (v14)
  {
    id v15 = [[STUIStatusBar alloc] initWithStyle:0];
    [v14 addSubview:v15];
    [v14 _setRequestedStyle:0];
    objc_initWeak(&location, v14);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __94__STUIStatusBar_Wrapper__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke;
    int v21 = &unk_1E6AA3EB8;
    objc_copyWeak(&v22, &location);
    [(STUIStatusBar *)v15 setRegionActionValidationBlock:&v18];
    objc_msgSend(v14, "setStatusBar:", v15, v18, v19, v20, v21);
    uint64_t v16 = [MEMORY[0x1E4FA9348] sharedInstance];
    [v16 addBackgroundActivityClient:v14];

    [v14 _evaluateServerRegistration];
    [v14 setNeedsLayout];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v14;
}

- (void)setStatusBar:(id)a3
{
}

- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5
{
  [(STUIStatusBar_Wrapper *)self _updateSemanticContentAttributeFromLegacyData:a4];
  id v7 = [(STUIStatusBar_Wrapper *)self _dataFromLegacyData:a4];
  [(STUIStatusBar_Wrapper *)self _updateWithData:v7 force:0];
}

- (void)forceUpdateData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB1C88] getStatusBarData];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (!*(unsigned char *)(v5 + v7))
    {
      if (++v7 == 52) {
        return;
      }
    }
    [(STUIStatusBar_Wrapper *)self _updateSemanticContentAttributeFromLegacyData:v5];
    objc_super v8 = [(STUIStatusBar_Wrapper *)self _dataFromLegacyData:v6];
    id v9 = v8;
    if (v3)
    {
      [(STUIStatusBar_Wrapper *)self _updateWithData:v8 force:0];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __41__STUIStatusBar_Wrapper_forceUpdateData___block_invoke;
      v11[3] = &unk_1E6AA39F0;
      v11[4] = self;
      id v12 = v8;
      [v10 performWithoutAnimation:v11];
    }
  }
}

- (void)_updateSemanticContentAttributeFromLegacyData:(id *)a3
{
  if ((*((unsigned char *)a3 + 2536) & 2) != 0) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  [(STUIStatusBar *)self->_statusBar setSemanticContentAttribute:v3];
}

- (id)_dataFromLegacyData:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(STUIStatusBar_Wrapper *)self localDataOverrides])
  {
    memset(&v9[30], 0, 32);
    objc_msgSend(MEMORY[0x1E4FB1C68], "getData:forRequestedData:withOverrides:", v9, a3, -[STUIStatusBar_Wrapper localDataOverrides](self, "localDataOverrides", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0));
    uint64_t v5 = [(STUIStatusBar *)self->_statusBar currentData];
    uint64_t v6 = (const $6C45178016D353444451090973A2A97F *)v9;
  }
  else
  {
    uint64_t v5 = [(STUIStatusBar *)self->_statusBar currentData];
    uint64_t v6 = a3;
  }
  uint64_t v7 = +[STUIStatusBarDataConverter convertData:v6 fromReferenceData:v5];

  return v7;
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBar_Wrapper;
  id v11 = a4;
  -[STUIStatusBar_Wrapper setAvoidanceFrame:animationSettings:options:](&v12, sel_setAvoidanceFrame_animationSettings_options_, v11, a5, x, y, width, height);
  -[STUIStatusBar setAvoidanceFrame:animationSettings:options:](self->_statusBar, "setAvoidanceFrame:animationSettings:options:", v11, a5, x, y, width, height, v12.receiver, v12.super_class);
}

- (void)activeBackgroundActivitiesDidUpdate:(id)a3
{
  BOOL v4 = (NSSet *)[a3 copy];
  backgroundActivities = self->_backgroundActivities;
  self->_backgroundActivities = v4;

  [(STUIStatusBar_Wrapper *)self forceUpdate:1];
}

- (void)forceUpdate:(BOOL)a3
{
  if (a3)
  {
    [(STUIStatusBar_Wrapper *)self _updateWithData:0 force:1];
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__STUIStatusBar_Wrapper_forceUpdate___block_invoke;
    v5[3] = &unk_1E6AA37A0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v5];
  }
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBar_Wrapper;
  id v6 = a4;
  id v7 = a3;
  [(STUIStatusBar_Wrapper *)&v8 setForegroundColor:v7 animationParameters:v6];
  [(STUIStatusBar_Wrapper *)self _requestStyle:[(STUIStatusBar_Wrapper *)self _requestedResolvedStyle] partStyles:0 legibilityStyle:[(STUIStatusBar_Wrapper *)self legibilityStyle] foregroundColor:v7 animationParameters:v6 forced:0];
}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBar_Wrapper;
  id v6 = a4;
  [(STUIStatusBar_Wrapper *)&v9 setLegibilityStyle:a3 animationParameters:v6];
  int64_t v7 = [(STUIStatusBar_Wrapper *)self _requestedResolvedStyle];
  objc_super v8 = [(STUIStatusBar_Wrapper *)self foregroundColor];
  [(STUIStatusBar_Wrapper *)self _requestStyle:v7 partStyles:0 legibilityStyle:a3 foregroundColor:v8 animationParameters:v6 forced:0];
}

- (void)setOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBar_Wrapper;
  -[STUIStatusBar_Wrapper setOrientation:](&v5, sel_setOrientation_);
  [(STUIStatusBar *)self->_statusBar setOrientation:a3];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4FA9348] sharedInstance];
  [v3 removeBackgroundActivityClient:self];

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBar_Wrapper;
  [(STUIStatusBar_Wrapper *)&v4 dealloc];
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___STUIStatusBar_Wrapper;
  objc_msgSendSuper2(&v7, sel__defaultStyleForRequestedStyle_styleOverrides_activeStyleOverride_, a3, a4, a5);
  return a3;
}

- (int64_t)currentStyle
{
  [(STUIStatusBar *)self->_statusBar style];
  return _UIStatusBarStyleFromResolvedStyle();
}

- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBar_Wrapper;
  id v6 = a4;
  [(STUIStatusBar_Wrapper *)&v8 setForegroundAlpha:v6 animationParameters:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__STUIStatusBar_Wrapper_setForegroundAlpha_animationParameters___block_invoke;
  v7[3] = &unk_1E6AA3F30;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  [(STUIStatusBar_Wrapper *)self _performAnimations:v7 withParameters:v6 completion:0];
}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (void)setMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBar_Wrapper;
  -[STUIStatusBar_Wrapper setMode:](&v5, sel_setMode_);
  [(STUIStatusBar *)self->_statusBar setMode:a3];
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  return +[STUIStatusBar sensorActivityIndicatorForScreen:a3];
}

+ (void)setSensorActivityIndicator:(id)a3
{
}

+ (UIView)sensorActivityIndicator
{
  return (UIView *)[a1 sensorActivityIndicatorForScreen:0];
}

- (id)clockFont
{
  v2 = [(STUIStatusBar *)self->_statusBar visualProvider];
  uint64_t v3 = [v2 clockFont];

  return v3;
}

- (void)jiggleLockIcon
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FA9418]);
  uint64_t v3 = [(STUIStatusBar *)self->_statusBar currentData];
  objc_super v4 = [v3 lockEntry];

  if ([v4 isEnabled])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FA94A8], "entryWithUnlockFailureCount:", objc_msgSend(v4, "unlockFailureCount") + 1);

    objc_super v4 = (void *)v5;
  }
  [v6 setLockEntry:v4];
  [(STUIStatusBar *)self->_statusBar updateWithData:v6];
}

- (id)actionForPartWithIdentifier:(id)a3
{
  return [(STUIStatusBar *)self->_statusBar actionForPartWithIdentifier:a3];
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  [(STUIStatusBar *)self->_statusBar offsetForPartWithIdentifier:a3];
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  [(STUIStatusBar *)self->_statusBar alphaForPartWithIdentifier:a3];
  return result;
}

- (id)enabledPartIdentifiers
{
  return [(STUIStatusBar *)self->_statusBar enabledPartIdentifiers];
}

- (void)setDisabledPartIdentifiers:(id)a3
{
}

- (id)disabledPartIdentifiers
{
  return [(STUIStatusBar *)self->_statusBar disabledPartIdentifiers];
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  [(STUIStatusBar_Wrapper *)self layoutIfNeeded];
  [(STUIStatusBar *)self->_statusBar frameForPartWithIdentifier:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(STUIStatusBar_Wrapper *)self styleOverrides] == a4)
  {
    double v7 = _STUIStatusBar_BackgroundActivity_Log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = a4;
      _os_log_impl(&dword_1D7E39000, v7, OS_LOG_TYPE_DEFAULT, "Duplicate StatusBar_Modern overrides receieved: %llu", buf, 0xCu);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STUIStatusBar_Wrapper;
    [(STUIStatusBar_Wrapper *)&v8 statusBarServer:v6 didReceiveStyleOverrides:a4];
    [(STUIStatusBar_Wrapper *)self forceUpdate:1];
  }
}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  [(STUIStatusBar_Wrapper *)self _updateSemanticContentAttributeFromLegacyData:a4];
  id v7 = [(STUIStatusBar_Wrapper *)self _dataFromLegacyData:a4];
  [(STUIStatusBar_Wrapper *)self _updateWithData:v7 force:0];
}

- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5
{
}

- (CGSize)intrinsicContentSize
{
  [(STUIStatusBar *)self->_statusBar intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (NSString)activeBackgroundActivity
{
  return self->_activeBackgroundActivity;
}

- (void)setActiveBackgroundActivity:(id)a3
{
}

- (void)setBackgroundActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivities, 0);
  objc_storeStrong((id *)&self->_activeBackgroundActivity, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
}

@end