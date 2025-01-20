@interface UITintColor
- (BOOL)_isDeepColor;
- (BOOL)_isDynamicTintColor;
- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6;
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6;
- (BOOL)getWhite:(double *)a3 alpha:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPatternColor;
- (CGColor)CGColor;
- (UITintColor)init;
- (double)alphaComponent;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)colorSpaceName;
- (unint64_t)hash;
- (void)set;
- (void)setFill;
- (void)setStroke;
@end

@implementation UITintColor

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (UITintColor)init
{
  v5.receiver = self;
  v5.super_class = (Class)UITintColor;
  v2 = [(UITintColor *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(UIColor *)v2 _setSystemColorName:@"tintColor"];
  }
  return v3;
}

- (void)set
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  objc_super v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITintColor;
    [(UIDynamicColor *)&v7 set];
  }
  else
  {
    [(UITintColor *)v4 set];
  }
}

- (CGColor)CGColor
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  objc_super v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    objc_super v7 = [(UIDynamicColor *)&v10 CGColor];
  }
  else
  {
    objc_super v7 = [(UITintColor *)v4 CGColor];
  }
  v8 = v7;

  return v8;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() == 1)
  {
    uint64_t v6 = _UIGetCurrentFallbackView();
    if (v6) {
      *(void *)(v6 + 116) |= 0x100000000uLL;
    }
  }
  objc_super v7 = [v5 _tintColor];
  v8 = v7;
  if (!v7 || v7 == self)
  {
    if (v5)
    {
      uint64_t v10 = [v5 userInterfaceIdiom];
    }
    else
    {
      id v3 = +[UIDevice currentDevice];
      uint64_t v10 = [v3 userInterfaceIdiom];
    }
    v9 = +[UIView _defaultInteractionTintColorForIdiom:v10];

    if (!v5) {
  }
    }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (BOOL)_isDynamicTintColor
{
  return 1;
}

- (void)setFill
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITintColor;
    [(UIDynamicColor *)&v7 setFill];
  }
  else
  {
    [(UITintColor *)v4 setFill];
  }
}

- (void)setStroke
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)UITintColor;
    [(UIDynamicColor *)&v7 setStroke];
  }
  else
  {
    [(UITintColor *)v4 setStroke];
  }
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  objc_super v7 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v8 = [(UITintColor *)self _resolvedColorWithTraitCollection:v7];
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
    v14.super_class = (Class)UITintColor;
    unsigned __int8 v11 = [(UIDynamicColor *)&v14 getWhite:a3 alpha:a4];
  }
  else
  {
    unsigned __int8 v11 = [(UITintColor *)v8 getWhite:a3 alpha:a4];
  }
  BOOL v12 = v11;

  return v12;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  unsigned __int8 v11 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  BOOL v12 = [(UITintColor *)self _resolvedColorWithTraitCollection:v11];
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
    v18.super_class = (Class)UITintColor;
    unsigned __int8 v15 = [(UIDynamicColor *)&v18 getHue:a3 saturation:a4 brightness:a5 alpha:a6];
  }
  else
  {
    unsigned __int8 v15 = [(UITintColor *)v12 getHue:a3 saturation:a4 brightness:a5 alpha:a6];
  }
  BOOL v16 = v15;

  return v16;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  unsigned __int8 v11 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  BOOL v12 = [(UITintColor *)self _resolvedColorWithTraitCollection:v11];
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
    v18.super_class = (Class)UITintColor;
    unsigned __int8 v15 = [(UIDynamicColor *)&v18 getRed:a3 green:a4 blue:a5 alpha:a6];
  }
  else
  {
    unsigned __int8 v15 = [(UITintColor *)v12 getRed:a3 green:a4 blue:a5 alpha:a6];
  }
  BOOL v16 = v15;

  return v16;
}

- (double)alphaComponent
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    [(UIDynamicColor *)&v10 alphaComponent];
  }
  else
  {
    [(UITintColor *)v4 alphaComponent];
  }
  double v8 = v7;

  return v8;
}

- (BOOL)isPatternColor
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    unsigned __int8 v7 = [(UIDynamicColor *)&v10 isPatternColor];
  }
  else
  {
    unsigned __int8 v7 = [(UITintColor *)v4 isPatternColor];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)_isDeepColor
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    unsigned __int8 v7 = [(UIDynamicColor *)&v10 _isDeepColor];
  }
  else
  {
    unsigned __int8 v7 = [(UITintColor *)v4 _isDeepColor];
  }
  BOOL v8 = v7;

  return v8;
}

- (id)colorSpaceName
{
  id v3 = +[UITraitCollection _currentTraitCollectionWithUnmarkedFallback]();
  v4 = [(UITintColor *)self _resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)UITintColor;
    uint64_t v7 = [(UIDynamicColor *)&v10 colorSpaceName];
  }
  else
  {
    uint64_t v7 = [(UITintColor *)v4 colorSpaceName];
  }
  BOOL v8 = (void *)v7;

  return v8;
}

@end