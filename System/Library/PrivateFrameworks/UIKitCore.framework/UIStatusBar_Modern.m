@interface UIStatusBar_Modern
+ (UIView)sensorActivityIndicator;
+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7;
+ (id)sensorActivityIndicatorForScreen:(id)a3;
+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5;
+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4;
+ (void)setSensorActivityIndicator:(id)a3;
- (CGRect)frameForPartWithIdentifier:(id)a3;
- (CGSize)intrinsicContentSize;
- (UIOffset)offsetForPartWithIdentifier:(id)a3;
- (_UIStatusBar)statusBar;
- (double)alphaForPartWithIdentifier:(id)a3;
- (double)defaultDoubleHeight;
- (id)_dataFromLegacyData:(id *)a3;
- (id)_effectiveDataFromData:(id)a3 activeOverride:(unint64_t)a4 canUpdateBackgroundActivity:(BOOL)a5;
- (id)_initWithFrame:(CGRect)a3 showForegroundView:(BOOL)a4 wantsServer:(BOOL)a5 inProcessStateProvider:(id)a6;
- (id)actionForPartWithIdentifier:(id)a3;
- (id)clockFont;
- (id)disabledPartIdentifiers;
- (id)enabledPartIdentifiers;
- (int64_t)_effectiveStyleFromStyle:(int64_t)a3;
- (int64_t)currentStyle;
- (unint64_t)_implicitStyleOverrideForStyle:(int64_t)a3;
- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6;
- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8;
- (void)_updateSemanticContentAttributeFromLegacyData:(id *)a3;
- (void)_updateWithData:(id)a3 force:(BOOL)a4;
- (void)forceUpdate:(BOOL)a3;
- (void)forceUpdateData:(BOOL)a3;
- (void)jiggleLockIcon;
- (void)layoutSubviews;
- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4;
- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4;
- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5;
- (void)setDisabledPartIdentifiers:(id)a3;
- (void)setEnabledPartIdentifiers:(id)a3;
- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4;
- (void)setForegroundColor:(id)a3 animationParameters:(id)a4;
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

@implementation UIStatusBar_Modern

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
  v23.super_class = (Class)UIStatusBar_Modern;
  id v14 = -[UIStatusBar_Base _initWithFrame:showForegroundView:wantsServer:inProcessStateProvider:](&v23, sel__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider_, v7, v6, v13, x, y, width, height);
  if (v14)
  {
    v15 = [[_UIStatusBar alloc] initWithStyle:0];
    [v14 addSubview:v15];
    [v14 _setRequestedStyle:0];
    objc_initWeak(&location, v14);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __91__UIStatusBar_Modern__initWithFrame_showForegroundView_wantsServer_inProcessStateProvider___block_invoke;
    v20 = &unk_1E52DE810;
    objc_copyWeak(&v21, &location);
    [(_UIStatusBar *)v15 setRegionActionValidationBlock:&v17];
    objc_msgSend(v14, "setStatusBar:", v15, v17, v18, v19, v20);
    [v14 _evaluateServerRegistration];
    [v14 setNeedsLayout];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v14;
}

+ (double)_heightForStyle:(int64_t)a3 orientation:(int64_t)a4 forStatusBarFrame:(BOOL)a5 inWindow:(id)a6 isAzulBLinked:(BOOL)a7
{
  BOOL v7 = a7;
  v10 = +[UIScreen mainScreen];
  +[_UIStatusBar intrinsicContentSizeForTargetScreen:v10 orientation:a4 onLockScreen:a3 == 306 isAzulBLinked:v7];
  double v12 = v11;

  return v12;
}

+ (int64_t)_defaultStyleForRequestedStyle:(int64_t)a3 styleOverrides:(unint64_t)a4 activeStyleOverride:(unint64_t *)a5
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___UIStatusBar_Modern;
  objc_msgSendSuper2(&v7, sel__defaultStyleForRequestedStyle_styleOverrides_activeStyleOverride_, a3, a4, a5);
  return a3;
}

- (void)_updateSemanticContentAttributeFromLegacyData:(id *)a3
{
  if ((*((unsigned char *)a3 + 2536) & 2) != 0) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  [(_UIStatusBar *)self->_statusBar setSemanticContentAttribute:v3];
}

- (id)_dataFromLegacyData:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(UIStatusBar_Base *)self localDataOverrides])
  {
    memset(&v9[30], 0, 32);
    +[UIStatusBar getData:forRequestedData:withOverrides:](UIStatusBar, "getData:forRequestedData:withOverrides:", v9, a3, -[UIStatusBar_Base localDataOverrides](self, "localDataOverrides", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
    v5 = [(_UIStatusBar *)self->_statusBar currentData];
    BOOL v6 = (const $6C45178016D353444451090973A2A97F *)v9;
  }
  else
  {
    v5 = [(_UIStatusBar *)self->_statusBar currentData];
    BOOL v6 = a3;
  }
  objc_super v7 = +[_UIStatusBarDataConverter convertData:v6 fromReferenceData:v5];

  return v7;
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
        char v8 = [(_UIStatusBar *)self->_statusBar style];
        return _UIStatusBarStyleFromResolvedStyle(v8);
      }
  }
}

- (id)_effectiveDataFromData:(id)a3 activeOverride:(unint64_t)a4 canUpdateBackgroundActivity:(BOOL)a5
{
  BOOL v5 = a5;
  char v8 = (_UIStatusBarData *)a3;
  v9 = objc_alloc_init(_UIStatusBarDataBackgroundActivityEntry);
  uint64_t v10 = v9;
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
            uint64_t v11 = 31;
            goto LABEL_96;
          }
          if (a4 == 0x400000)
          {
            uint64_t v11 = 27;
            goto LABEL_96;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x800000uLL:
              uint64_t v11 = 28;
              goto LABEL_96;
            case 0x1000000uLL:
              uint64_t v11 = 11;
              goto LABEL_96;
            case 0x2000000uLL:
              uint64_t v11 = 12;
              goto LABEL_96;
          }
        }
        goto LABEL_113;
      }
      if ((uint64_t)a4 <= 0xFFFFFFF)
      {
        if (a4 == 0x4000000)
        {
          uint64_t v11 = 13;
          goto LABEL_96;
        }
        if (a4 == 0x8000000)
        {
          uint64_t v11 = 2;
          goto LABEL_96;
        }
        goto LABEL_113;
      }
      if (a4 == 0x10000000)
      {
        uint64_t v11 = 3;
        goto LABEL_96;
      }
      if (a4 == 0x20000000)
      {
        uint64_t v11 = 0;
        goto LABEL_96;
      }
      uint64_t v12 = 0x40000000;
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
              uint64_t v11 = 5;
              goto LABEL_96;
            case 0x10000000000uLL:
              uint64_t v11 = 21;
              goto LABEL_96;
            case 0x20000000000uLL:
              uint64_t v11 = 16;
              goto LABEL_96;
          }
        }
        else
        {
          switch(a4)
          {
            case 0x1000000000uLL:
              uint64_t v11 = 8;
              goto LABEL_96;
            case 0x2000000000uLL:
              uint64_t v11 = 9;
              goto LABEL_96;
            case 0x4000000000uLL:
              uint64_t v11 = 4;
LABEL_96:
              [(_UIStatusBarDataBackgroundActivityEntry *)v9 setType:v11];
              goto LABEL_97;
          }
        }
        goto LABEL_113;
      }
      if ((uint64_t)a4 > 0x1FFFFFFFFLL)
      {
        if (a4 != 0x200000000)
        {
          if (a4 == 0x400000000)
          {
            uint64_t v11 = 22;
            goto LABEL_96;
          }
          if (a4 == 0x800000000)
          {
            uint64_t v11 = 1;
            goto LABEL_96;
          }
          goto LABEL_113;
        }
LABEL_73:
        uint64_t v11 = 20;
        goto LABEL_96;
      }
      if (a4 == 0x80000000) {
        goto LABEL_73;
      }
      uint64_t v12 = 0x100000000;
    }
    if (a4 == v12)
    {
      uint64_t v11 = 19;
      goto LABEL_96;
    }
    goto LABEL_113;
  }
  if ((uint64_t)a4 > 2047)
  {
    if ((uint64_t)a4 >= 0x10000)
    {
      if ((uint64_t)a4 < 0x40000)
      {
        if (a4 == 0x10000)
        {
          uint64_t v11 = 36;
          goto LABEL_96;
        }
        if (a4 == 0x20000)
        {
          uint64_t v11 = 10;
          goto LABEL_96;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x40000uLL:
            uint64_t v11 = 35;
            goto LABEL_96;
          case 0x80000uLL:
            uint64_t v11 = 37;
            goto LABEL_96;
          case 0x100000uLL:
            uint64_t v11 = 26;
            goto LABEL_96;
        }
      }
    }
    else if ((uint64_t)a4 < 0x2000)
    {
      if (a4 == 2048)
      {
        uint64_t v11 = 15;
        goto LABEL_96;
      }
      if (a4 == 4096)
      {
        uint64_t v11 = 32;
        goto LABEL_96;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x2000uLL:
          uint64_t v11 = 29;
          goto LABEL_96;
        case 0x4000uLL:
          uint64_t v11 = 25;
          goto LABEL_96;
        case 0x8000uLL:
          uint64_t v11 = 30;
          goto LABEL_96;
      }
    }
  }
  else if ((uint64_t)a4 > 63)
  {
    if ((uint64_t)a4 <= 255)
    {
      if (a4 == 64 || a4 == 128)
      {
        uint64_t v11 = 14;
        goto LABEL_96;
      }
    }
    else
    {
      switch(a4)
      {
        case 0x100uLL:
          uint64_t v11 = 33;
          goto LABEL_96;
        case 0x200uLL:
          uint64_t v11 = 23;
          goto LABEL_96;
        case 0x400uLL:
          uint64_t v11 = 18;
          goto LABEL_96;
      }
    }
  }
  else if ((uint64_t)a4 <= 7)
  {
    if (a4 == 1)
    {
      uint64_t v11 = 6;
      goto LABEL_96;
    }
    if (a4 == 4)
    {
      uint64_t v11 = 17;
      goto LABEL_96;
    }
  }
  else
  {
    switch(a4)
    {
      case 8uLL:
        uint64_t v11 = 34;
        goto LABEL_96;
      case 0x10uLL:
        uint64_t v11 = 7;
        goto LABEL_96;
      case 0x20uLL:
        uint64_t v11 = 24;
        goto LABEL_96;
    }
  }
LABEL_113:
  [(_UIStatusBarDataEntry *)v9 setEnabled:0];
LABEL_97:
  if ([(_UIStatusBarDataEntry *)v10 isEnabled])
  {
    id v13 = +[UIStatusBarServer getDoubleHeightStatusStringForStyle:](UIStatusBarServer, "getDoubleHeightStatusStringForStyle:", +[UIStatusBar_Base _defaultStyleForRequestedStyle:0 styleOverrides:a4 activeStyleOverride:0]);
    [(_UIStatusBarDataBackgroundActivityEntry *)v10 setDetailString:v13];

    if ([(id)_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry isEnabled]&& (uint64_t v14 = -[_UIStatusBarDataBackgroundActivityEntry type](v10, "type"), v14 == objc_msgSend((id)_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry, "type")))
    {
      [(id)_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry displayStartDate];
    }
    else
    {
      double v15 = CACurrentMediaTime();
    }
    [(_UIStatusBarDataBackgroundActivityEntry *)v10 setDisplayStartDate:v15];
  }
  if (v5) {
    objc_storeStrong((id *)&_effectiveDataFromData_activeOverride_canUpdateBackgroundActivity__lastBackgroundActivityEntry, v10);
  }
  v16 = [(_UIStatusBar *)self->_statusBar currentData];
  uint64_t v17 = [v16 backgroundActivityEntry];

  uint64_t v18 = v8;
  if (![(_UIStatusBarDataBackgroundActivityEntry *)v10 isEqual:v17])
  {
    if (v8)
    {
      uint64_t v18 = (_UIStatusBarData *)[(_UIStatusBarData *)v8 copy];
    }
    else
    {
      uint64_t v18 = objc_alloc_init(_UIStatusBarData);
    }
    [(_UIStatusBarData *)v18 setBackgroundActivityEntry:v10];
  }

  return v18;
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

- (void)_updateWithData:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    objc_super v7 = [(_UIStatusBar *)self->_statusBar currentData];

    if (!v7) {
      goto LABEL_11;
    }
  }
  unint64_t v12 = 0;
  char v8 = [(UIStatusBar_Base *)self styleDelegate];

  if (!v8)
  {
    unint64_t v12 = [(UIStatusBar_Base *)self styleOverrides];
    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(UIStatusBar_Base *)self _getStyle:0 andActiveOverride:&v12 forRequestedStyle:_UIStatusBarStyleFromResolvedStyle([(_UIStatusBar *)self->_statusBar style])];
  if (!v12) {
LABEL_5:
  }
    unint64_t v12 = [(UIStatusBar_Modern *)self _implicitStyleOverrideForStyle:[(UIStatusBar_Base *)self _requestStyle]];
LABEL_6:
  -[UIStatusBar_Base setActiveStyleOverride:](self, "setActiveStyleOverride:");
  unint64_t v9 = [(UIStatusBar_Base *)self activeStyleOverride];
  uint64_t v10 = [(UIStatusBar_Base *)self styleDelegate];
  [(UIStatusBar_Modern *)self _effectiveDataFromData:v6 activeOverride:v9 canUpdateBackgroundActivity:v10 != 0];
  uint64_t v11 = (_UIStatusBarData *)objc_claimAutoreleasedReturnValue();

  if (v11 || v4)
  {
    if (!v11) {
      uint64_t v11 = objc_alloc_init(_UIStatusBarData);
    }
    [(_UIStatusBar *)self->_statusBar updateWithData:v11];
  }
LABEL_11:
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 legibilityStyle:(int64_t)a5 foregroundColor:(id)a6 animationParameters:(id)a7 forced:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(UIStatusBar_Base *)self manager];
  if (!v17
    || (uint64_t v18 = (void *)v17,
        [(UIStatusBar_Base *)self manager],
        v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 statusBar:self shouldRequestStyle:a3 animationParameters:v16 forced:v8],
        v19,
        v18,
        v20))
  {
    int64_t v21 = [(UIStatusBar_Base *)self styleForRequestedStyle:[(UIStatusBar_Modern *)self _effectiveStyleFromStyle:a3]];
    if (a5 == 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = -1;
    }
    if (a5 == 2) {
      uint64_t v22 = 3;
    }
    if (!a5) {
      uint64_t v22 = v21;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __106__UIStatusBar_Modern__requestStyle_partStyles_legibilityStyle_foregroundColor_animationParameters_forced___block_invoke;
    v24[3] = &unk_1E52E9D28;
    if (v22 == 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2 * (v22 == 3);
    }
    int64_t v27 = a3;
    uint64_t v28 = v23;
    v24[4] = self;
    id v25 = v15;
    id v26 = v14;
    [(UIStatusBar_Base *)self _performAnimations:v24 withParameters:v16 completion:0];
  }
}

- (void)_requestStyle:(int64_t)a3 partStyles:(id)a4 animationParameters:(id)a5 forced:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  int64_t v12 = [(UIStatusBar_Base *)self legibilityStyle];
  id v13 = [(UIStatusBar_Base *)self foregroundColor];
  [(UIStatusBar_Modern *)self _requestStyle:a3 partStyles:v11 legibilityStyle:v12 foregroundColor:v13 animationParameters:v10 forced:v6];
}

- (int64_t)currentStyle
{
  char v2 = [(_UIStatusBar *)self->_statusBar style];
  return _UIStatusBarStyleFromResolvedStyle(v2);
}

- (void)setStyleRequest:(id)a3 animationParameters:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBar_Modern;
  id v6 = a4;
  id v7 = a3;
  [(UIStatusBar_Base *)&v11 setStyleRequest:v7 animationParameters:v6];
  uint64_t v8 = objc_msgSend(v7, "style", v11.receiver, v11.super_class);
  uint64_t v9 = [v7 legibilityStyle];
  id v10 = [v7 foregroundColor];

  [(UIStatusBar_Modern *)self _requestStyle:v8 partStyles:0 legibilityStyle:v9 foregroundColor:v10 animationParameters:v6 forced:0];
}

- (void)setForegroundColor:(id)a3 animationParameters:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar_Modern;
  id v6 = a4;
  id v7 = a3;
  [(UIStatusBar_Base *)&v8 setForegroundColor:v7 animationParameters:v6];
  [(UIStatusBar_Modern *)self _requestStyle:[(UIStatusBar_Base *)self _requestStyle] partStyles:0 legibilityStyle:[(UIStatusBar_Base *)self legibilityStyle] foregroundColor:v7 animationParameters:v6 forced:0];
}

- (void)setForegroundAlpha:(double)a3 animationParameters:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBar_Modern;
  id v6 = a4;
  [(UIStatusBar_Base *)&v8 setForegroundAlpha:v6 animationParameters:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__UIStatusBar_Modern_setForegroundAlpha_animationParameters___block_invoke;
  v7[3] = &unk_1E52D9CD0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  [(UIStatusBar_Base *)self _performAnimations:v7 withParameters:v6 completion:0];
}

- (void)setLegibilityStyle:(int64_t)a3 animationParameters:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBar_Modern;
  id v6 = a4;
  [(UIStatusBar_Base *)&v9 setLegibilityStyle:a3 animationParameters:v6];
  int64_t v7 = [(UIStatusBar_Base *)self _requestStyle];
  objc_super v8 = [(UIStatusBar_Base *)self foregroundColor];
  [(UIStatusBar_Modern *)self _requestStyle:v7 partStyles:0 legibilityStyle:a3 foregroundColor:v8 animationParameters:v6 forced:0];
}

- (void)setAvoidanceFrame:(CGRect)a3 animationSettings:(id)a4 options:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBar_Modern;
  id v11 = a4;
  -[UIStatusBar_Base setAvoidanceFrame:animationSettings:options:](&v12, sel_setAvoidanceFrame_animationSettings_options_, v11, a5, x, y, width, height);
  -[_UIStatusBar setAvoidanceFrame:animationSettings:options:](self->_statusBar, "setAvoidanceFrame:animationSettings:options:", v11, a5, x, y, width, height, v12.receiver, v12.super_class);
}

- (double)defaultDoubleHeight
{
  return 0.0;
}

- (void)setMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar_Modern;
  -[UIStatusBar_Base setMode:](&v5, sel_setMode_);
  [(_UIStatusBar *)self->_statusBar setMode:a3];
}

+ (void)registerSensorActivityIndicator:(id)a3 forScreen:(id)a4
{
}

+ (id)sensorActivityIndicatorForScreen:(id)a3
{
  return +[_UIStatusBar sensorActivityIndicatorForScreen:a3];
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
  char v2 = [(_UIStatusBar *)self->_statusBar visualProvider];
  char v3 = [v2 clockFont];

  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBar_Modern;
  -[UIStatusBar_Base setOrientation:](&v5, sel_setOrientation_);
  [(_UIStatusBar *)self->_statusBar setOrientation:a3];
}

- (void)jiggleLockIcon
{
  id v6 = objc_alloc_init(_UIStatusBarData);
  char v3 = [(_UIStatusBar *)self->_statusBar currentData];
  BOOL v4 = [v3 lockEntry];
  objc_super v5 = (void *)[v4 copy];

  objc_msgSend(v5, "setUnlockFailureCount:", objc_msgSend(v5, "unlockFailureCount") + 1);
  [(_UIStatusBarData *)v6 setLockEntry:v5];
  [(_UIStatusBar *)self->_statusBar updateWithData:v6];
}

- (void)setAction:(id)a3 forPartWithIdentifier:(id)a4
{
}

- (id)actionForPartWithIdentifier:(id)a3
{
  return [(_UIStatusBar *)self->_statusBar actionForPartWithIdentifier:a3];
}

- (void)setOffset:(UIOffset)a3 forPartWithIdentifier:(id)a4
{
}

- (UIOffset)offsetForPartWithIdentifier:(id)a3
{
  [(_UIStatusBar *)self->_statusBar offsetForPartWithIdentifier:a3];
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setAlpha:(double)a3 forPartWithIdentifier:(id)a4
{
}

- (double)alphaForPartWithIdentifier:(id)a3
{
  [(_UIStatusBar *)self->_statusBar alphaForPartWithIdentifier:a3];
  return result;
}

- (void)setEnabledPartIdentifiers:(id)a3
{
}

- (id)enabledPartIdentifiers
{
  return [(_UIStatusBar *)self->_statusBar enabledPartIdentifiers];
}

- (void)setDisabledPartIdentifiers:(id)a3
{
}

- (id)disabledPartIdentifiers
{
  return [(_UIStatusBar *)self->_statusBar disabledPartIdentifiers];
}

- (CGRect)frameForPartWithIdentifier:(id)a3
{
  id v4 = a3;
  [(UIView *)self layoutIfNeeded];
  [(_UIStatusBar *)self->_statusBar frameForPartWithIdentifier:v4];
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

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  statusBar = self->_statusBar;
  -[UIView setFrame:](statusBar, "setFrame:");
}

- (void)forceUpdate:(BOOL)a3
{
  if (a3)
  {
    [(UIStatusBar_Modern *)self _updateWithData:0 force:1];
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__UIStatusBar_Modern_forceUpdate___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
  }
}

- (void)forceUpdateData:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[UIStatusBarServer getStatusBarData];
  if (v5)
  {
    double v6 = v5;
    uint64_t v7 = 0;
    while (!v5->var0[v7])
    {
      if (++v7 == 52) {
        return;
      }
    }
    [(UIStatusBar_Modern *)self _updateSemanticContentAttributeFromLegacyData:v5];
    double v8 = [(UIStatusBar_Modern *)self _dataFromLegacyData:v6];
    double v9 = v8;
    if (v3)
    {
      [(UIStatusBar_Modern *)self _updateWithData:v8 force:0];
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __38__UIStatusBar_Modern_forceUpdateData___block_invoke;
      v10[3] = &unk_1E52D9F98;
      v10[4] = self;
      id v11 = v8;
      +[UIView performWithoutAnimation:v10];
    }
  }
}

- (void)statusBarServer:(id)a3 didReceiveStatusBarData:(id *)a4 withActions:(int)a5
{
  [(UIStatusBar_Modern *)self _updateSemanticContentAttributeFromLegacyData:a4];
  id v7 = [(UIStatusBar_Modern *)self _dataFromLegacyData:a4];
  [(UIStatusBar_Modern *)self _updateWithData:v7 force:0];
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(UIStatusBar_Base *)self styleOverrides] == a4)
  {
    id v7 = _UIStatusBar_Log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = a4;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Duplicate StatusBar_Modern overrides receieved: %llu", buf, 0xCu);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIStatusBar_Modern;
    [(UIStatusBar_Base *)&v8 statusBarServer:v6 didReceiveStyleOverrides:a4];
    [(UIStatusBar_Modern *)self forceUpdate:1];
  }
}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  [(UIStatusBar_Modern *)self _updateSemanticContentAttributeFromLegacyData:a4];
  id v7 = [(UIStatusBar_Modern *)self _dataFromLegacyData:a4];
  [(UIStatusBar_Modern *)self _updateWithData:v7 force:0];
}

- (void)statusBarServer:(id)a3 didReceiveDoubleHeightStatusString:(id)a4 forStyle:(int64_t)a5
{
}

- (CGSize)intrinsicContentSize
{
  [(_UIStatusBar *)self->_statusBar intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (_UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end