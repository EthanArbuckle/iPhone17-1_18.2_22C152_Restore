@interface NAUIContentSizeLayoutConstraint
+ (double)_maximumWidthOfStrings:(id)a3 withFont:(id)a4;
+ (id)_constraintForAutoitem:(id)a3 constrainedItem:(id)a4 attribute:(int64_t)a5 relatedBy:(int64_t)a6 toItem:(id)a7 attribute:(int64_t)a8 multiplier:(double)a9 defaultConstant:(double)a10 additionalConstant:(double)a11 initialize:(BOOL)a12;
+ (id)baselineConstraintForAutoitem:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 defaultConstant:(double)a7;
+ (id)baselineConstraintForView:(id)a3 attribute:(int64_t)a4 relation:(int64_t)a5 toAutoitem:(id)a6 defaultConstant:(double)a7;
+ (id)constraintForAutoitem:(id)a3 additionalConstant:(double)a4 constantLoadingBlock:(id)a5;
+ (id)constraintForAutoitem:(id)a3 additionalConstant:(double)a4 constantWidthSizingStringsLoadingBlock:(id)a5;
+ (id)constraintForAutoitem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 defaultConstant:(double)a9;
+ (id)constraintForAutoitem:(id)a3 constrainedItem:(id)a4 attribute:(int64_t)a5 relatedBy:(int64_t)a6 toItem:(id)a7 attribute:(int64_t)a8 multiplier:(double)a9 defaultConstant:(double)a10;
- (BOOL)autoUpdatingConstantShrinks;
- (NSString)textStyle;
- (double)_defaultConstantByFixingUpDefaultConstant:(double)a3;
- (double)additionalConstant;
- (double)defaultConstant;
- (id)constantLoadingBlock;
- (void)_forceUpdatePreferredContentSize;
- (void)_reloadPreferredContentSize:(BOOL)a3;
- (void)_updatePreferredContentSize;
- (void)dealloc;
- (void)setAdditionalConstant:(double)a3;
- (void)setAutoUpdatingConstantShrinks:(BOOL)a3;
- (void)setConstantLoadingBlock:(id)a3;
- (void)setDefaultConstant:(double)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation NAUIContentSizeLayoutConstraint

+ (id)_constraintForAutoitem:(id)a3 constrainedItem:(id)a4 attribute:(int64_t)a5 relatedBy:(int64_t)a6 toItem:(id)a7 attribute:(int64_t)a8 multiplier:(double)a9 defaultConstant:(double)a10 additionalConstant:(double)a11 initialize:(BOOL)a12
{
  id v21 = a3;
  uint64_t v22 = [a1 constraintWithItem:a4 attribute:a5 relatedBy:a6 toItem:a7 attribute:a8 multiplier:a9 constant:0.0];
  [(id)v22 _defaultConstantByFixingUpDefaultConstant:a10];
  [(id)v22 setConstant:v23 + a11];
  v24 = objc_msgSend(v21, "naui_dynamicFontTextStyleDescriptor");
  v25 = [v24 textStyle];
  [(id)v22 setTextStyle:v25];

  uint64_t v26 = objc_msgSend(v21, "naui_dynamicFontTextStyleDescriptor");
  v27 = *(void **)(v22 + 104);
  *(void *)(v22 + 104) = v26;

  v28 = *(void **)(v22 + 80);
  *(void *)(v22 + 80) = v21;

  *(unsigned char *)(v22 + 96) = 1;
  *(double *)(v22 + 144) = a11;
  *(double *)(v22 + 136) = a10;
  *(unsigned char *)(v22 + 128) = 0;
  if (a12) {
    [(id)v22 _forceUpdatePreferredContentSize];
  }
  return (id)v22;
}

+ (id)constraintForAutoitem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 defaultConstant:(double)a9
{
  LOBYTE(v10) = 1;
  return (id)[a1 _constraintForAutoitem:a3 constrainedItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:a8 defaultConstant:a9 additionalConstant:0.0 initialize:v10];
}

+ (id)constraintForAutoitem:(id)a3 constrainedItem:(id)a4 attribute:(int64_t)a5 relatedBy:(int64_t)a6 toItem:(id)a7 attribute:(int64_t)a8 multiplier:(double)a9 defaultConstant:(double)a10
{
  LOBYTE(v11) = 1;
  return (id)[a1 _constraintForAutoitem:a3 constrainedItem:a4 attribute:a5 relatedBy:a6 toItem:a7 attribute:a8 multiplier:a9 defaultConstant:a10 additionalConstant:0.0 initialize:v11];
}

+ (id)constraintForAutoitem:(id)a3 additionalConstant:(double)a4 constantLoadingBlock:(id)a5
{
  id v8 = a5;
  LOBYTE(v11) = 0;
  v9 = [a1 _constraintForAutoitem:a3 constrainedItem:a3 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 defaultConstant:0.0 additionalConstant:a4 initialize:v11];
  [v9 setConstantLoadingBlock:v8];

  [v9 _updatePreferredContentSize];
  return v9;
}

+ (id)constraintForAutoitem:(id)a3 additionalConstant:(double)a4 constantWidthSizingStringsLoadingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __115__NAUIContentSizeLayoutConstraint_constraintForAutoitem_additionalConstant_constantWidthSizingStringsLoadingBlock___block_invoke;
  v14[3] = &unk_264627D10;
  id v16 = v9;
  id v17 = a1;
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  v12 = [a1 constraintForAutoitem:v11 additionalConstant:v14 constantLoadingBlock:a4];

  return v12;
}

double __115__NAUIContentSizeLayoutConstraint_constraintForAutoitem_additionalConstant_constantWidthSizingStringsLoadingBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) font];
  v3 = objc_opt_class();
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v3 _maximumWidthOfStrings:v4 withFont:v2];
  double v6 = v5;

  return v6;
}

+ (id)baselineConstraintForAutoitem:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 defaultConstant:(double)a7
{
  return (id)[a1 constraintForAutoitem:a3 constrainedItem:a3 attribute:11 relatedBy:a4 toItem:a5 attribute:a6 multiplier:1.0 defaultConstant:a7];
}

+ (id)baselineConstraintForView:(id)a3 attribute:(int64_t)a4 relation:(int64_t)a5 toAutoitem:(id)a6 defaultConstant:(double)a7
{
  return (id)[a1 constraintForAutoitem:a6 constrainedItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:11 multiplier:1.0 defaultConstant:a7];
}

- (void)dealloc
{
  if (self->_preferredContentSizeDidChangeObserver)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_preferredContentSizeDidChangeObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)NAUIContentSizeLayoutConstraint;
  [(NAUIContentSizeLayoutConstraint *)&v4 dealloc];
}

- (void)setTextStyle:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_textStyle isEqualToString:v4])
  {
    double v5 = (NSString *)[v4 copy];
    textStyle = self->_textStyle;
    self->_textStyle = v5;

    v7 = [MEMORY[0x263F81708] defaultFontForTextStyle:v4];
    [v7 _bodyLeading];
    self->_textStyleDefaultBodyLeading = v8;

    if (self->_autoitem) {
      [(NAUIContentSizeLayoutConstraint *)self _updatePreferredContentSize];
    }
  }
  if (!self->_preferredContentSizeDidChangeObserver)
  {
    objc_initWeak(&location, self);
    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    id v10 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v11 = *MEMORY[0x263F1D158];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__NAUIContentSizeLayoutConstraint_setTextStyle___block_invoke;
    v14[3] = &unk_264627D38;
    objc_copyWeak(&v15, &location);
    v12 = [v9 addObserverForName:v11 object:0 queue:v10 usingBlock:v14];
    id preferredContentSizeDidChangeObserver = self->_preferredContentSizeDidChangeObserver;
    self->_id preferredContentSizeDidChangeObserver = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __48__NAUIContentSizeLayoutConstraint_setTextStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);
  [v4 _updatePreferredContentSize];

  objc_destroyWeak(&to);
}

- (void)setDefaultConstant:(double)a3
{
  if (self->_defaultConstant != a3)
  {
    self->_defaultConstant = a3;
    [(NAUIContentSizeLayoutConstraint *)self _updatePreferredContentSize];
  }
}

- (void)setAutoUpdatingConstantShrinks:(BOOL)a3
{
  if (self->_autoUpdatingConstantShrinks != a3)
  {
    self->_autoUpdatingConstantShrinks = a3;
    [(NAUIContentSizeLayoutConstraint *)self _updatePreferredContentSize];
  }
}

- (double)_defaultConstantByFixingUpDefaultConstant:(double)a3
{
  double v5 = [(NAUIContentSizeLayoutConstraint *)self firstItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(NAUIContentSizeLayoutConstraint *)self firstItem];
    if (![v7 borderStyle]
      && [(NAUIContentSizeLayoutConstraint *)self firstAttribute] == 12)
    {
      a3 = UIScreenPixelHeight() + a3;
    }
  }
  double v8 = [(NAUIContentSizeLayoutConstraint *)self secondItem];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    id v10 = [(NAUIContentSizeLayoutConstraint *)self secondItem];
    if (![v10 borderStyle]
      && [(NAUIContentSizeLayoutConstraint *)self secondAttribute] == 12)
    {
      a3 = a3 - UIScreenPixelHeight();
    }
  }
  return a3;
}

+ (double)_maximumWidthOfStrings:(id)a3 withFont:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v7 setFont:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "setText:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v7 intrinsicContentSize];
        if (v12 < v14) {
          double v12 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (void)_forceUpdatePreferredContentSize
{
}

- (void)_updatePreferredContentSize
{
}

- (void)_reloadPreferredContentSize:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(self->_autoitem, "naui_dynamicFontTextStyleDescriptor");
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:](NAUITextStyleDescriptor, "fontWithTextStyleDescriptor:");
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(self->_autoitem, "naui_reloadDynamicFontWithTextStyleDescriptor:", v21);
    }
    id v6 = [self->_autoitem viewForLastBaselineLayout];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v6, "naui_reloadDynamicFontWithTextStyleDescriptor:", v21);
    }
    [(NAUIContentSizeLayoutConstraint *)self _defaultConstantByFixingUpDefaultConstant:self->_defaultConstant];
    constantLoadingBlock = (void (**)(void))self->_constantLoadingBlock;
    if (constantLoadingBlock)
    {
      constantLoadingBlock[2]();
    }
    else
    {
      double v10 = v7;
      [v5 _bodyLeading];
      double v12 = 1.0;
      if (fabs(v10) > 0.000000238418579) {
        double v12 = v11 / self->_textStyleDefaultBodyLeading;
      }
      double v13 = 1.0 / v12;
      if (!self->_autoUpdatingConstantShrinks) {
        double v13 = v12;
      }
      double v9 = v10 * v13;
    }
    double v14 = v9 + self->_additionalConstant;
    double v15 = v14 / UIScreenPixelHeight();
    double v16 = UIScreenPixelHeight();
    float v17 = v15;
    double v18 = v16 * roundf(v17);
    [(NAUIContentSizeLayoutConstraint *)self constant];
    if (v19 != v18 || v3) {
      [(NAUIContentSizeLayoutConstraint *)self setConstant:v18];
    }
  }
}

- (BOOL)autoUpdatingConstantShrinks
{
  return self->_autoUpdatingConstantShrinks;
}

- (double)defaultConstant
{
  return self->_defaultConstant;
}

- (double)additionalConstant
{
  return self->_additionalConstant;
}

- (void)setAdditionalConstant:(double)a3
{
  self->_additionalConstant = a3;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (id)constantLoadingBlock
{
  return self->_constantLoadingBlock;
}

- (void)setConstantLoadingBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_constantLoadingBlock, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_dynamicTextStyleDescriptor, 0);
  objc_storeStrong(&self->_preferredContentSizeDidChangeObserver, 0);
  objc_storeStrong(&self->_autoitem, 0);
}

@end