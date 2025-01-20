@interface UIDynamicColor
- (BOOL)_isDeepColor;
- (BOOL)_isDynamic;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isPatternColor;
- (CGColor)CGColor;
- (UIDynamicColor)colorWithAlphaComponent:(double)a3;
- (UIDynamicColor)colorWithProminence:(int64_t)a3;
- (double)alphaComponent;
- (id)_highContrastDynamicColor;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)_resolvedMaterialWithTraitCollection:(id)a3;
- (id)colorSpaceName;
- (id)resolvedColorWithTraitCollection:(id)a3;
- (int64_t)prominence;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UIDynamicColor

- (BOOL)_isDynamic
{
  return 1;
}

- (id)_resolvedMaterialWithTraitCollection:(id)a3
{
  id v4 = a3;
  if ([v4 _userInterfaceRenderingMode] == 2)
  {
    v5 = [(UIColor *)self _systemColorName];
    v6 = +[_UIMaterial materialForSystemColorName:v5];
    if ([v6 isVibrant] && objc_msgSend(v4, "_vibrancy") != 1) {
      id v7 = 0;
    }
    else {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)resolvedColorWithTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v4];
  v6 = [v5 resolvedColorWithTraitCollection:v4];

  return v6;
}

- (void)set
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  id v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDynamicColor;
    [(UIColor *)&v7 set];
  }
  else
  {
    [(UIDynamicColor *)v4 set];
  }
}

- (UIDynamicColor)colorWithAlphaComponent:(double)a3
{
  v3 = -[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:]((id *)[UIDynamicModifiedColor alloc], self, (void *)0xFFFFFFFFFFFFFFFFLL, a3);
  return (UIDynamicColor *)v3;
}

- (CGColor)CGColor
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  id v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    objc_super v7 = [(UIColor *)&v10 CGColor];
  }
  else
  {
    objc_super v7 = [(UIDynamicColor *)v4 CGColor];
  }
  v8 = v7;

  return v8;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  v11 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v12 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v11];
  v13 = v12;
  if (v12) {
    BOOL v14 = v12 == self;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIDynamicColor;
    unsigned __int8 v15 = [(UIColor *)&v18 getRed:a3 green:a4 blue:a5 alpha:a6];
  }
  else
  {
    unsigned __int8 v15 = [(UIDynamicColor *)v12 getRed:a3 green:a4 blue:a5 alpha:a6];
  }
  BOOL v16 = v15;

  return v16;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  v11 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v12 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v11];
  v13 = v12;
  if (v12) {
    BOOL v14 = v12 == self;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIDynamicColor;
    unsigned __int8 v15 = [(UIColor *)&v18 getHue:a3 saturation:a4 brightness:a5 alpha:a6];
  }
  else
  {
    unsigned __int8 v15 = [(UIDynamicColor *)v12 getHue:a3 saturation:a4 brightness:a5 alpha:a6];
  }
  BOOL v16 = v15;

  return v16;
}

- (double)alphaComponent
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  id v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    [(UIColor *)&v10 alphaComponent];
  }
  else
  {
    [(UIDynamicColor *)v4 alphaComponent];
  }
  double v8 = v7;

  return v8;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  double v7 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  double v8 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v7];
  v9 = v8;
  if (v8) {
    BOOL v10 = v8 == self;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v14.receiver = self;
    v14.super_class = (Class)UIDynamicColor;
    unsigned __int8 v11 = [(UIColor *)&v14 getWhite:a3 alpha:a4];
  }
  else
  {
    unsigned __int8 v11 = [(UIDynamicColor *)v8 getWhite:a3 alpha:a4];
  }
  BOOL v12 = v11;

  return v12;
}

- (void)setFill
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  id v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDynamicColor;
    [(UIColor *)&v7 setFill];
  }
  else
  {
    [(UIDynamicColor *)v4 setFill];
  }
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = NSStringFromSelector(a2);
  BOOL v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"Abstract method %@ called from class %@. Subclasses must override.", v5, v7 format];

  return 0;
}

- (id)_highContrastDynamicColor
{
  v2 = -[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:]((id *)[UIDynamicModifiedColor alloc], self, (void *)1, 1.79769313e308);
  return v2;
}

- (void)setStroke
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  uint64_t v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDynamicColor;
    [(UIColor *)&v7 setStroke];
  }
  else
  {
    [(UIDynamicColor *)v4 setStroke];
  }
}

- (BOOL)isPatternColor
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  uint64_t v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    unsigned __int8 v7 = [(UIColor *)&v10 isPatternColor];
  }
  else
  {
    unsigned __int8 v7 = [(UIDynamicColor *)v4 isPatternColor];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)_isDeepColor
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  uint64_t v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    unsigned __int8 v7 = [(UIColor *)&v10 _isDeepColor];
  }
  else
  {
    unsigned __int8 v7 = [(UIDynamicColor *)v4 _isDeepColor];
  }
  BOOL v8 = v7;

  return v8;
}

- (id)colorSpaceName
{
  v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  uint64_t v4 = [(UIDynamicColor *)self _resolvedColorWithTraitCollection:v3];
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicColor;
    uint64_t v7 = [(UIColor *)&v10 colorSpaceName];
  }
  else
  {
    uint64_t v7 = [(UIDynamicColor *)v4 colorSpaceName];
  }
  BOOL v8 = (void *)v7;

  return v8;
}

- (UIDynamicColor)colorWithProminence:(int64_t)a3
{
  v5 = [(UIColor *)self _systemColorName];
  if (([v5 isEqualToString:@"labelColor"] & 1) != 0
    || ([v5 isEqualToString:@"secondaryLabelColor"] & 1) != 0
    || ([v5 isEqualToString:@"tertiaryLabelColor"] & 1) != 0
    || [v5 isEqualToString:@"quaternaryLabelColor"])
  {
    switch(a3)
    {
      case 0:
        uint64_t v6 = +[UIColor labelColor];
        break;
      case 1:
        uint64_t v6 = +[UIColor secondaryLabelColor];
        break;
      case 2:
        uint64_t v6 = +[UIColor tertiaryLabelColor];
        break;
      case 3:
        uint64_t v6 = +[UIColor quaternaryLabelColor];
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    if (([v5 isEqualToString:@"systemFillColor"] & 1) != 0
      || ([v5 isEqualToString:@"secondarySystemFillColor"] & 1) != 0
      || ([v5 isEqualToString:@"tertiarySystemFillColor"] & 1) != 0
      || [v5 isEqualToString:@"quaternarySystemFillColor"])
    {
      switch(a3)
      {
        case 0:
          uint64_t v6 = +[UIColor systemFillColor];
          break;
        case 1:
          uint64_t v6 = +[UIColor secondarySystemFillColor];
          break;
        case 2:
          uint64_t v6 = +[UIColor tertiarySystemFillColor];
          break;
        case 3:
          uint64_t v6 = +[UIColor quaternarySystemFillColor];
          break;
        default:
          goto LABEL_16;
      }
    }
    else
    {
LABEL_16:
      if (([v5 isEqualToString:@"systemBackgroundColor"] & 1) != 0
        || ([v5 isEqualToString:@"secondarySystemBackgroundColor"] & 1) != 0
        || [v5 isEqualToString:@"tertiarySystemBackgroundColor"])
      {
        switch(a3)
        {
          case 0:
            uint64_t v6 = +[UIColor systemBackgroundColor];
            break;
          case 1:
            uint64_t v6 = +[UIColor secondarySystemBackgroundColor];
            break;
          case 2:
          case 3:
            uint64_t v6 = +[UIColor tertiarySystemBackgroundColor];
            break;
          default:
            goto LABEL_27;
        }
      }
      else
      {
LABEL_27:
        if (([v5 isEqualToString:@"systemGroupedBackgroundColor"] & 1) != 0
          || ([v5 isEqualToString:@"secondarySystemGroupedBackgroundColor"] & 1) != 0
          || [v5 isEqualToString:@"tertiarySystemGroupedBackgroundColor"])
        {
          switch(a3)
          {
            case 0:
              uint64_t v6 = +[UIColor systemGroupedBackgroundColor];
              break;
            case 1:
              uint64_t v6 = +[UIColor secondarySystemGroupedBackgroundColor];
              break;
            case 2:
            case 3:
              uint64_t v6 = +[UIColor tertiarySystemGroupedBackgroundColor];
              break;
            default:
              goto LABEL_34;
          }
        }
        else
        {
LABEL_34:
          if (([v5 isEqualToString:@"systemGrayColor"] & 1) != 0
            || ([v5 isEqualToString:@"systemGray2Color"] & 1) != 0
            || ([v5 isEqualToString:@"systemGray3Color"] & 1) != 0
            || ([v5 isEqualToString:@"systemGray4Color"] & 1) != 0
            || ([v5 isEqualToString:@"systemGray5Color"] & 1) != 0
            || [v5 isEqualToString:@"systemGray6Color"])
          {
            switch(a3)
            {
              case 0:
                uint64_t v6 = +[UIColor systemGrayColor];
                break;
              case 1:
                uint64_t v6 = +[UIColor systemGray2Color];
                break;
              case 2:
                uint64_t v6 = +[UIColor systemGray3Color];
                break;
              case 3:
                uint64_t v6 = +[UIColor systemGray4Color];
                break;
              default:
                goto LABEL_44;
            }
          }
          else
          {
LABEL_44:
            uint64_t v6 = (uint64_t)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self, (void *)0xFFFFFFFFFFFFFFFFLL, (void *)a3, 1.79769313e308);
          }
        }
      }
    }
  }
  uint64_t v7 = (void *)v6;

  return (UIDynamicColor *)v7;
}

- (int64_t)prominence
{
  v3 = [(UIColor *)self _systemColorName];
  if (([v3 hasPrefix:@"secondary"] & 1) == 0)
  {
    if ([v3 hasPrefix:@"tertiary"]) {
      goto LABEL_4;
    }
    if (([v3 hasPrefix:@"quaternary"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"systemGrayColor"])
      {
        int64_t v4 = 0;
        goto LABEL_9;
      }
      if ([v3 isEqualToString:@"systemGray2Color"]) {
        goto LABEL_2;
      }
      if ([v3 isEqualToString:@"systemGray3Color"])
      {
LABEL_4:
        int64_t v4 = 2;
        goto LABEL_9;
      }
      if (([v3 isEqualToString:@"systemGray4Color"] & 1) == 0
        && ([v3 isEqualToString:@"systemGray5Color"] & 1) == 0
        && ([v3 isEqualToString:@"systemGray6Color"] & 1) == 0)
      {
        v6.receiver = self;
        v6.super_class = (Class)UIDynamicColor;
        int64_t v4 = [(UIColor *)&v6 prominence];
        goto LABEL_9;
      }
    }
    int64_t v4 = 3;
    goto LABEL_9;
  }
LABEL_2:
  int64_t v4 = 1;
LABEL_9:

  return v4;
}

id ___UIDynamicColor_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 2) {
    uint64_t v4 = 32;
  }
  v5 = *(void **)(a1 + v4);
  return v5;
}

@end