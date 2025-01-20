@interface UIBarAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)_checkEqualTo:(id)a3;
- (BOOL)_hasTransparentBackground;
- (BOOL)isEqual:(id)a3;
- (NSArray)backgroundEffects;
- (UIBarAppearance)copy;
- (UIBarAppearance)init;
- (UIBarAppearance)initWithBarAppearance:(UIBarAppearance *)barAppearance;
- (UIBarAppearance)initWithCoder:(NSCoder *)coder;
- (UIBarAppearance)initWithIdiom:(UIUserInterfaceIdiom)idiom;
- (UIBlurEffect)backgroundEffect;
- (UIColor)backgroundColor;
- (UIColor)shadowColor;
- (UIImage)backgroundImage;
- (UIImage)shadowImage;
- (UIUserInterfaceIdiom)idiom;
- (UIVibrancyEffect)_selectedItemVibrancyEffect;
- (UIVibrancyEffect)shadowEffect;
- (UIViewContentMode)backgroundImageContentMode;
- (id)_backButtonAppearance;
- (id)_backButtonAppearanceData;
- (id)_backgroundData;
- (id)_barTitleData;
- (id)_compactInlineTabButtonAppearanceData;
- (id)_doneButtonAppearance;
- (id)_doneButtonAppearanceData;
- (id)_inlineTabButtonAppearanceData;
- (id)_plainButtonAppearance;
- (id)_plainButtonAppearanceData;
- (id)_stackedTabButtonAppearanceData;
- (id)_tabLayoutAppearanceData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_hashInto:(unint64_t)a3;
- (unint64_t)hash;
- (void)_copyFromAppearance:(id)a3;
- (void)_decodeFromCoder:(id)a3;
- (void)_describeInto:(id)a3;
- (void)_setSelectedItemVibrancyEffect:(id)a3;
- (void)_setupDefaults;
- (void)_signalCategoryChanges:(uint64_t)a1;
- (void)configureWithDefaultBackground;
- (void)configureWithDefaultShadow;
- (void)configureWithOpaqueBackground;
- (void)configureWithTransparentBackground;
- (void)configureWithoutShadow;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBackgroundEffect:(UIBlurEffect *)backgroundEffect;
- (void)setBackgroundEffects:(id)a3;
- (void)setBackgroundImage:(UIImage *)backgroundImage;
- (void)setBackgroundImageContentMode:(UIViewContentMode)backgroundImageContentMode;
- (void)setShadowColor:(UIColor *)shadowColor;
- (void)setShadowEffect:(id)a3;
- (void)setShadowImage:(UIImage *)shadowImage;
@end

@implementation UIBarAppearance

- (id)_backgroundData
{
  return [(_UIBarAppearanceData *)self->_backgroundData markReadOnly];
}

- (void)setBackgroundEffect:(UIBlurEffect *)backgroundEffect
{
  v4 = backgroundEffect;
  v5 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundEffect];
  v6 = v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(UIBlurEffect *)v5 isEqual:v6];

  if (!v7)
  {
LABEL_8:
    v8 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v8;

    [(_UIBarBackgroundAppearanceData *)v8 setBackgroundEffect:v10];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundData, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

- (void)configureWithDefaultBackground
{
  v3 = +[_UIBarBackgroundAppearanceData standardBackgroundData];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIBarAppearance *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && [(UIBarAppearance *)v4 isMemberOfClass:objc_opt_class()]
      && [(UIBarAppearance *)self _checkEqualTo:v5];

  return v6;
}

- (UIBarAppearance)init
{
  v3 = +[UIDevice currentDevice];
  v4 = -[UIBarAppearance initWithIdiom:](self, "initWithIdiom:", [v3 userInterfaceIdiom]);

  return v4;
}

- (BOOL)_checkEqualTo:(id)a3
{
  return [(_UIBarAppearanceData *)self->_backgroundData isEqual:*((void *)a3 + 3)];
}

- (UIBarAppearance)copy
{
  v3.receiver = self;
  v3.super_class = (Class)UIBarAppearance;
  return [(UIBarAppearance *)&v3 copy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithBarAppearance:self];
}

- (UIBarAppearance)initWithIdiom:(UIUserInterfaceIdiom)idiom
{
  v8.receiver = self;
  v8.super_class = (Class)UIBarAppearance;
  id v4 = [(UIBarAppearance *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)idiom >= UIUserInterfaceIdiomTV) {
      UIUserInterfaceIdiom v6 = UIUserInterfaceIdiomPhone;
    }
    else {
      UIUserInterfaceIdiom v6 = idiom;
    }
    v4->_idiom = v6;
    [(UIBarAppearance *)v4 _setupDefaults];
    [(UIBarAppearance *)v5 _completeInit];
  }
  return v5;
}

- (UIBarAppearance)initWithBarAppearance:(UIBarAppearance *)barAppearance
{
  v5 = barAppearance;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIBarAppearance.m", 60, @"Invalid parameter not satisfying: %@", @"barAppearance != nil" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)UIBarAppearance;
  UIUserInterfaceIdiom v6 = [(UIBarAppearance *)&v10 init];
  BOOL v7 = v6;
  if (v6)
  {
    v6->_idiom = v5->_idiom;
    [(UIBarAppearance *)v6 _copyFromAppearance:v5];
    [(UIBarAppearance *)v7 _setupDefaults];
    [(UIBarAppearance *)v7 _completeInit];
  }

  return v7;
}

- (void)_setupDefaults
{
  if (!self->_backgroundData)
  {
    objc_super v3 = +[_UIBarBackgroundAppearanceData standardBackgroundData];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v3;
  }
}

- (UIUserInterfaceIdiom)idiom
{
  return self->_idiom;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  id v4 = backgroundColor;
  if (v4
    && (+[UIColor clearColor],
        v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [(UIColor *)v4 isEqual:v5],
        v5,
        !v6))
  {
    BOOL v7 = v4;
  }
  else
  {
    BOOL v7 = 0;
  }

  objc_super v8 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundColor];
  v9 = v7;
  v13 = v9;
  if (v8 == v9)
  {

    goto LABEL_13;
  }
  if (!v9 || !v8)
  {

    goto LABEL_12;
  }
  BOOL v10 = [(UIColor *)v8 isEqual:v9];

  if (!v10)
  {
LABEL_12:
    v11 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v11;

    [(_UIBarBackgroundAppearanceData *)v11 setBackgroundColor:v13];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_13:
}

- (void)_signalCategoryChanges:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)(a1 + 32) |= a2;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      [WeakRetained appearance:a1 categoriesChanged:a2];
    }
  }
}

- (void)_copyFromAppearance:(id)a3
{
  id v6 = [a3 _backgroundData];
  id v4 = (_UIBarBackgroundAppearanceData *)[v6 copy];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v4;
}

- (void)setShadowColor:(UIColor *)shadowColor
{
  id v4 = shadowColor;
  if (v4)
  {
    v5 = +[UIColor clearColor];
    BOOL v6 = [(UIColor *)v4 isEqual:v5];

    if (v6)
    {

      id v4 = 0;
    }
  }
  BOOL v7 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowColor];
  objc_super v8 = v4;
  v17 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  if (v8 && v7)
  {
    BOOL v9 = [(UIColor *)v7 isEqual:v8];

    if (!v9) {
      goto LABEL_12;
    }
LABEL_10:
    int v10 = 0;
    goto LABEL_13;
  }

LABEL_12:
  v11 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v11;

  [(_UIBarBackgroundAppearanceData *)v11 setShadowColor:v17];
  int v10 = 1;
LABEL_13:
  id v13 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowEffect];
  v14 = v13;
  if (v13)
  {

    v15 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    v16 = self->_backgroundData;
    self->_backgroundData = v15;

    [(_UIBarBackgroundAppearanceData *)v15 setShadowEffect:0];
  }
  else if (!v10)
  {
    goto LABEL_17;
  }
  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
LABEL_17:
}

- (void)configureWithOpaqueBackground
{
  objc_super v3 = +[_UIBarBackgroundAppearanceData opaqueBackgroundData];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (void)configureWithTransparentBackground
{
  objc_super v3 = +[_UIBarBackgroundAppearanceData transparentBackgroundData];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (UIBlurEffect)backgroundEffect
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundEffect];
}

- (void)setShadowImage:(UIImage *)shadowImage
{
  id v4 = shadowImage;
  v5 = v4;
  if (v4)
  {
    [(UIImage *)v4 size];
    BOOL v7 = 0;
    if (v8 != 0.0 && v6 != 0.0) {
      BOOL v7 = v5;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  BOOL v9 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowImage];
  int v10 = v7;
  v14 = v10;
  if (v9 == v10)
  {

    goto LABEL_14;
  }
  if (!v10 || !v9)
  {

    goto LABEL_13;
  }
  BOOL v11 = [(UIImage *)v9 isEqual:v10];

  if (!v11)
  {
LABEL_13:
    v12 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v12;

    [(_UIBarBackgroundAppearanceData *)v12 setShadowImage:v14];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_14:
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
  id v4 = backgroundImage;
  v5 = v4;
  if (v4)
  {
    [(UIImage *)v4 size];
    BOOL v7 = 0;
    if (v8 != 0.0 && v6 != 0.0) {
      BOOL v7 = v5;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  BOOL v9 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundImage];
  int v10 = v7;
  v14 = v10;
  if (v9 == v10)
  {

    goto LABEL_14;
  }
  if (!v10 || !v9)
  {

    goto LABEL_13;
  }
  BOOL v11 = [(UIImage *)v9 isEqual:v10];

  if (!v11)
  {
LABEL_13:
    v12 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v12;

    [(_UIBarBackgroundAppearanceData *)v12 setBackgroundImage:v14];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_14:
}

- (void)setBackgroundEffects:(id)a3
{
  id v4 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v4 = a3;
  }
  id v5 = v4;
  id v6 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundEffects];
  id v7 = v5;
  id v11 = v7;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  if (!v6)
  {

    goto LABEL_9;
  }
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_9:
    BOOL v9 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v9;

    [(_UIBarBackgroundAppearanceData *)v9 setBackgroundEffects:v11];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_10:
}

- (unint64_t)hash
{
  return [(UIBarAppearance *)self _hashInto:0];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIBarAppearance;
  objc_super v3 = [(UIBarAppearance *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(UIBarAppearance *)self _describeInto:v4];
  return v4;
}

- (UIBarAppearance)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v7.receiver = self;
  v7.super_class = (Class)UIBarAppearance;
  id v5 = [(UIBarAppearance *)&v7 init];
  if (v5)
  {
    v5->_idiom = [(NSCoder *)v4 decodeIntegerForKey:@"Idiom"];
    [(UIBarAppearance *)v5 _decodeFromCoder:v4];
    [(UIBarAppearance *)v5 _setupDefaults];
    [(UIBarAppearance *)v5 _completeInit];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t idiom = self->_idiom;
  id v5 = a3;
  [v5 encodeInteger:idiom forKey:@"Idiom"];
  [(_UIBarBackgroundAppearanceData *)self->_backgroundData encodeToCoder:v5 prefix:@"Background"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  id v4 = +[_UIBarBackgroundAppearanceData decodeFromCoder:a3 prefix:@"Background"];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v4;
}

- (void)_describeInto:(id)a3
{
  backgroundData = self->_backgroundData;
  id v5 = a3;
  objc_msgSend(v5, "appendFormat:", @"\n\tBackground(%p):", backgroundData);
  [(_UIBarBackgroundAppearanceData *)self->_backgroundData describeInto:v5];
}

- (unint64_t)_hashInto:(unint64_t)a3
{
  return [(_UIBarAppearanceData *)self->_backgroundData hash];
}

- (BOOL)_hasTransparentBackground
{
  return ![(_UIBarBackgroundAppearanceData *)self->_backgroundData hasBackground];
}

- (id)_barTitleData
{
  return 0;
}

- (id)_backButtonAppearanceData
{
  return 0;
}

- (id)_plainButtonAppearanceData
{
  return 0;
}

- (id)_doneButtonAppearanceData
{
  return 0;
}

- (id)_stackedTabButtonAppearanceData
{
  return 0;
}

- (id)_inlineTabButtonAppearanceData
{
  return 0;
}

- (id)_compactInlineTabButtonAppearanceData
{
  return 0;
}

- (id)_tabLayoutAppearanceData
{
  return 0;
}

- (id)_backButtonAppearance
{
  return 0;
}

- (id)_plainButtonAppearance
{
  return 0;
}

- (id)_doneButtonAppearance
{
  return 0;
}

- (UIVibrancyEffect)_selectedItemVibrancyEffect
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData overrideTabBarVibrancyEffect];
}

- (void)_setSelectedItemVibrancyEffect:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData overrideTabBarVibrancyEffect];
  id v10 = v4;
  id v6 = v5;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v10 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    char v8 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v8;

    [(_UIBarBackgroundAppearanceData *)v8 setOverrideTabBarVibrancyEffect:v10];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, -1);
  }
LABEL_9:
}

- (NSArray)backgroundEffects
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundEffects];
}

- (UIColor)backgroundColor
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundColor];
}

- (UIImage)backgroundImage
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundImage];
}

- (UIViewContentMode)backgroundImageContentMode
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundImageContentMode];
}

- (void)setBackgroundImageContentMode:(UIViewContentMode)backgroundImageContentMode
{
  if (backgroundImageContentMode == UIViewContentModeRedraw) {
    UIViewContentMode v4 = UIViewContentModeScaleToFill;
  }
  else {
    UIViewContentMode v4 = backgroundImageContentMode;
  }
  if ([(_UIBarBackgroundAppearanceData *)self->_backgroundData backgroundImageContentMode] != v4)
  {
    id v5 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v5;

    [(_UIBarBackgroundAppearanceData *)v5 setBackgroundImageContentMode:v4];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
}

- (void)configureWithDefaultShadow
{
  objc_super v3 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  [(_UIBarBackgroundAppearanceData *)self->_backgroundData configureWithDefaultShadow];
  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (void)configureWithoutShadow
{
  objc_super v3 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
  backgroundData = self->_backgroundData;
  self->_backgroundData = v3;

  [(_UIBarBackgroundAppearanceData *)self->_backgroundData configureWithoutShadow];
  -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
}

- (UIImage)shadowImage
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowImage];
}

- (UIColor)shadowColor
{
  objc_super v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowColor];
  if (!v3)
  {
    UIViewContentMode v4 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowEffect];

    if (v4)
    {
      objc_super v3 = +[UIColor clearColor];
    }
    else
    {
      objc_super v3 = 0;
    }
  }
  return (UIColor *)v3;
}

- (UIVibrancyEffect)shadowEffect
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowEffect];
}

- (void)setShadowEffect:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData shadowEffect];
  id v6 = v4;
  id v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    char v8 = [(_UIBarAppearanceData *)self->_backgroundData writableInstance];
    backgroundData = self->_backgroundData;
    self->_backgroundData = v8;

    [(_UIBarBackgroundAppearanceData *)v8 setShadowEffect:v10];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 1);
  }
LABEL_9:
}

@end