@interface UITabBarAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)_checkEqualTo:(id)a3;
- (CGFloat)stackedItemSpacing;
- (CGFloat)stackedItemWidth;
- (UIColor)selectionIndicatorTintColor;
- (UIImage)selectionIndicatorImage;
- (UITabBarItemAppearance)compactInlineLayoutAppearance;
- (UITabBarItemAppearance)inlineLayoutAppearance;
- (UITabBarItemAppearance)stackedLayoutAppearance;
- (UITabBarItemPositioning)stackedItemPositioning;
- (id)_compactInlineTabButtonAppearanceData;
- (id)_dataForItemStyle:(int64_t)a3;
- (id)_inlineTabButtonAppearanceData;
- (id)_stackedTabButtonAppearanceData;
- (id)_tabLayoutAppearanceData;
- (unint64_t)_hashInto:(unint64_t)a3;
- (void)_completeInit;
- (void)_copyFromAppearance:(id)a3;
- (void)_decodeFromCoder:(id)a3;
- (void)_describeInto:(id)a3;
- (void)_setupDefaults;
- (void)_tabBarItemDataChanged:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompactInlineLayoutAppearance:(UITabBarItemAppearance *)compactInlineLayoutAppearance;
- (void)setInlineLayoutAppearance:(UITabBarItemAppearance *)inlineLayoutAppearance;
- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage;
- (void)setSelectionIndicatorTintColor:(UIColor *)selectionIndicatorTintColor;
- (void)setStackedItemPositioning:(UITabBarItemPositioning)stackedItemPositioning;
- (void)setStackedItemSpacing:(CGFloat)stackedItemSpacing;
- (void)setStackedItemWidth:(CGFloat)stackedItemWidth;
- (void)setStackedLayoutAppearance:(UITabBarItemAppearance *)stackedLayoutAppearance;
@end

@implementation UITabBarAppearance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactInlineLayoutAppearance, 0);
  objc_storeStrong((id *)&self->_inlineLayoutAppearance, 0);
  objc_storeStrong((id *)&self->_stackedLayoutAppearance, 0);
  objc_storeStrong((id *)&self->_layoutData, 0);
}

- (void)_copyFromAppearance:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarAppearance;
  [(UIBarAppearance *)&v17 _copyFromAppearance:v4];
  v5 = [v4 _stackedTabButtonAppearanceData];
  if (v5)
  {
    v6 = [[UITabBarItemAppearance alloc] _initWithTabBarItemData:v5];
    stackedLayoutAppearance = self->_stackedLayoutAppearance;
    self->_stackedLayoutAppearance = v6;
  }
  v8 = [v4 _inlineTabButtonAppearanceData];
  if (v8)
  {
    v9 = [[UITabBarItemAppearance alloc] _initWithTabBarItemData:v8];
    inlineLayoutAppearance = self->_inlineLayoutAppearance;
    self->_inlineLayoutAppearance = v9;
  }
  v11 = [v4 _compactInlineTabButtonAppearanceData];
  if (v11)
  {
    v12 = [[UITabBarItemAppearance alloc] _initWithTabBarItemData:v11];
    compactInlineLayoutAppearance = self->_compactInlineLayoutAppearance;
    self->_compactInlineLayoutAppearance = v12;
  }
  v14 = [v4 _tabLayoutAppearanceData];
  v15 = (_UITabBarLayoutData *)[v14 copy];
  layoutData = self->_layoutData;
  self->_layoutData = v15;
}

- (id)_dataForItemStyle:(int64_t)a3
{
  v5 = 0;
  switch(a3)
  {
    case 0:
      uint64_t v6 = 56;
      goto LABEL_6;
    case 1:
    case 4:
      uint64_t v6 = 64;
      goto LABEL_6;
    case 2:
      uint64_t v6 = 72;
LABEL_6:
      v5 = [*(id *)((char *)&self->super.super.isa + v6) _data];
      break;
    case 3:
      break;
    default:
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITabBarAppearance.m", 510, @"Invalid style (%li)", a3);

      v5 = 0;
      break;
  }
  return v5;
}

- (void)_setupDefaults
{
  v11.receiver = self;
  v11.super_class = (Class)UITabBarAppearance;
  [(UIBarAppearance *)&v11 _setupDefaults];
  if (!self->_stackedLayoutAppearance)
  {
    v3 = [[UITabBarItemAppearance alloc] initWithStyle:0];
    stackedLayoutAppearance = self->_stackedLayoutAppearance;
    self->_stackedLayoutAppearance = v3;
  }
  if (!self->_inlineLayoutAppearance)
  {
    v5 = [[UITabBarItemAppearance alloc] initWithStyle:1];
    inlineLayoutAppearance = self->_inlineLayoutAppearance;
    self->_inlineLayoutAppearance = v5;
  }
  if (!self->_compactInlineLayoutAppearance)
  {
    v7 = [[UITabBarItemAppearance alloc] initWithStyle:2];
    compactInlineLayoutAppearance = self->_compactInlineLayoutAppearance;
    self->_compactInlineLayoutAppearance = v7;
  }
  if (!self->_layoutData)
  {
    v9 = +[_UITabBarLayoutData standardLayoutData];
    layoutData = self->_layoutData;
    self->_layoutData = v9;
  }
}

- (id)_tabLayoutAppearanceData
{
  return self->_layoutData;
}

- (id)_stackedTabButtonAppearanceData
{
  return [(UITabBarItemAppearance *)self->_stackedLayoutAppearance _data];
}

- (id)_inlineTabButtonAppearanceData
{
  return [(UITabBarItemAppearance *)self->_inlineLayoutAppearance _data];
}

- (id)_compactInlineTabButtonAppearanceData
{
  return [(UITabBarItemAppearance *)self->_compactInlineLayoutAppearance _data];
}

- (void)_completeInit
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBarAppearance;
  [(UIBarAppearance *)&v3 _completeInit];
  [(UITabBarItemAppearance *)self->_stackedLayoutAppearance _setOwningAppearance:self];
  [(UITabBarItemAppearance *)self->_inlineLayoutAppearance _setOwningAppearance:self];
  [(UITabBarItemAppearance *)self->_compactInlineLayoutAppearance _setOwningAppearance:self];
}

- (BOOL)_checkEqualTo:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UITabBarAppearance;
  if (![(UIBarAppearance *)&v20 _checkEqualTo:v4])
  {
    LOBYTE(v10) = 0;
    goto LABEL_19;
  }
  v5 = (void *)v4[7];
  uint64_t v6 = self->_stackedLayoutAppearance;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_17;
    }
    BOOL v10 = [(UITabBarItemAppearance *)v6 isEqual:v7];

    if (!v10) {
      goto LABEL_19;
    }
  }
  objc_super v11 = (void *)v4[8];
  uint64_t v6 = self->_inlineLayoutAppearance;
  v12 = v11;
  if (v6 == v12)
  {

LABEL_22:
    v15 = (void *)v4[9];
    uint64_t v6 = self->_compactInlineLayoutAppearance;
    v16 = v15;
    if (v6 == v16)
    {

LABEL_28:
      layoutData = self->_layoutData;
      v18 = (void *)v4[6];
      uint64_t v6 = layoutData;
      v19 = v18;
      if (v6 == v19)
      {
        LOBYTE(v10) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v19;
        LOBYTE(v10) = 0;
        if (v6 && v19) {
          LOBYTE(v10) = [(UITabBarItemAppearance *)v6 isEqual:v19];
        }
      }
      goto LABEL_18;
    }
    v8 = v16;
    LOBYTE(v10) = 0;
    if (v6 && v16)
    {
      BOOL v10 = [(UITabBarItemAppearance *)v6 isEqual:v16];

      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
LABEL_18:

    goto LABEL_19;
  }
  v8 = v12;
  if (v6) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
LABEL_17:
    LOBYTE(v10) = 0;
    goto LABEL_18;
  }
  BOOL v10 = [(UITabBarItemAppearance *)v6 isEqual:v12];

  if (v10) {
    goto LABEL_22;
  }
LABEL_19:

  return v10;
}

- (UITabBarItemAppearance)stackedLayoutAppearance
{
  return self->_stackedLayoutAppearance;
}

- (void)_tabBarItemDataChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (UITabBarItemAppearance *)a3;
  v5 = v4;
  if (self->_stackedLayoutAppearance == v4)
  {
    v7 = self;
    uint64_t v8 = 32;
LABEL_10:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)v7, v8);
    goto LABEL_11;
  }
  if (self->_inlineLayoutAppearance == v4)
  {
    v7 = self;
    uint64_t v8 = 64;
    goto LABEL_10;
  }
  if (self->_compactInlineLayoutAppearance == v4)
  {
    v7 = self;
    uint64_t v8 = 128;
    goto LABEL_10;
  }
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Signal from unknown appearance object %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_tabBarItemDataChanged____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Signal from unknown appearance object %@", (uint8_t *)&v10, 0xCu);
    }
  }
LABEL_11:
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stackedLayoutAppearance, @"Stacked", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_inlineLayoutAppearance forKey:@"Inline"];
  [v4 encodeObject:self->_compactInlineLayoutAppearance forKey:@"CompactInline"];
  [(_UITabBarLayoutData *)self->_layoutData encodeToCoder:v4 prefix:@"Layout"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UITabBarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v13 _decodeFromCoder:v4];
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), @"Stacked", v13.receiver, v13.super_class);
  objc_super v5 = (UITabBarItemAppearance *)objc_claimAutoreleasedReturnValue();
  stackedLayoutAppearance = self->_stackedLayoutAppearance;
  self->_stackedLayoutAppearance = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Inline"];
  inlineLayoutAppearance = self->_inlineLayoutAppearance;
  self->_inlineLayoutAppearance = v7;

  BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CompactInline"];
  compactInlineLayoutAppearance = self->_compactInlineLayoutAppearance;
  self->_compactInlineLayoutAppearance = v9;

  objc_super v11 = +[_UITabBarLayoutData decodeFromCoder:v4 prefix:@"Layout"];

  layoutData = self->_layoutData;
  self->_layoutData = v11;
}

- (void)_describeInto:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v5 _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tStackedItemAppearance(%p):", self->_stackedLayoutAppearance);
  [(UITabBarItemAppearance *)self->_stackedLayoutAppearance _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tInlineItemAppearance(%p):", self->_inlineLayoutAppearance);
  [(UITabBarItemAppearance *)self->_inlineLayoutAppearance _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tCompactInlineItemAppearance(%p):", self->_compactInlineLayoutAppearance);
  [(UITabBarItemAppearance *)self->_compactInlineLayoutAppearance _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tItemLayout(%p):", self->_layoutData);
  [(_UITabBarLayoutData *)self->_layoutData describeInto:v4];
}

- (unint64_t)_hashInto:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UITabBarAppearance;
  uint64_t v4 = 3 * [(UIBarAppearance *)&v9 _hashInto:a3];
  unint64_t v5 = 3 * ([(UITabBarItemAppearance *)self->_stackedLayoutAppearance hash] + v4);
  unint64_t v6 = 3 * ([(UITabBarItemAppearance *)self->_inlineLayoutAppearance hash] + v5);
  unint64_t v7 = 3 * ([(UITabBarItemAppearance *)self->_compactInlineLayoutAppearance hash] + v6);
  return [(_UIBarAppearanceData *)self->_layoutData hash] + v7;
}

- (void)setStackedLayoutAppearance:(UITabBarItemAppearance *)stackedLayoutAppearance
{
  unint64_t v5 = stackedLayoutAppearance;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITabBarAppearance.m" lineNumber:529 description:@"Use -[UITabBarItemAppearance configureWithDefaultForStyle:] to reset"];
  }
  unint64_t v6 = self->_stackedLayoutAppearance;
  unint64_t v7 = v5;
  uint64_t v12 = v7;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

    goto LABEL_10;
  }
  BOOL v8 = [(UITabBarItemAppearance *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_10:
    [(UITabBarItemAppearance *)self->_stackedLayoutAppearance _setOwningAppearance:0];
    objc_super v9 = [(UITabBarItemAppearance *)v12 copy];
    int v10 = self->_stackedLayoutAppearance;
    self->_stackedLayoutAppearance = v9;

    [(UITabBarItemAppearance *)self->_stackedLayoutAppearance _setOwningAppearance:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 32);
  }
LABEL_11:
}

- (void)setInlineLayoutAppearance:(UITabBarItemAppearance *)inlineLayoutAppearance
{
  unint64_t v5 = inlineLayoutAppearance;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITabBarAppearance.m" lineNumber:540 description:@"Use -[UITabBarItemAppearance configureWithDefaultForStyle:] to reset"];
  }
  unint64_t v6 = self->_inlineLayoutAppearance;
  unint64_t v7 = v5;
  uint64_t v12 = v7;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

    goto LABEL_10;
  }
  BOOL v8 = [(UITabBarItemAppearance *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_10:
    [(UITabBarItemAppearance *)self->_inlineLayoutAppearance _setOwningAppearance:0];
    objc_super v9 = [(UITabBarItemAppearance *)v12 copy];
    int v10 = self->_inlineLayoutAppearance;
    self->_inlineLayoutAppearance = v9;

    [(UITabBarItemAppearance *)self->_inlineLayoutAppearance _setOwningAppearance:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 64);
  }
LABEL_11:
}

- (void)setCompactInlineLayoutAppearance:(UITabBarItemAppearance *)compactInlineLayoutAppearance
{
  unint64_t v5 = compactInlineLayoutAppearance;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITabBarAppearance.m" lineNumber:551 description:@"Use -[UITabBarItemAppearance configureWithDefaultForStyle:] to reset"];
  }
  unint64_t v6 = self->_compactInlineLayoutAppearance;
  unint64_t v7 = v5;
  uint64_t v12 = v7;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

    goto LABEL_10;
  }
  BOOL v8 = [(UITabBarItemAppearance *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_10:
    [(UITabBarItemAppearance *)self->_compactInlineLayoutAppearance _setOwningAppearance:0];
    objc_super v9 = [(UITabBarItemAppearance *)v12 copy];
    int v10 = self->_compactInlineLayoutAppearance;
    self->_compactInlineLayoutAppearance = v9;

    [(UITabBarItemAppearance *)self->_compactInlineLayoutAppearance _setOwningAppearance:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 128);
  }
LABEL_11:
}

- (UIColor)selectionIndicatorTintColor
{
  return [(_UITabBarLayoutData *)self->_layoutData selectionIndicatorTintColor];
}

- (void)setSelectionIndicatorTintColor:(UIColor *)selectionIndicatorTintColor
{
  uint64_t v4 = selectionIndicatorTintColor;
  if (v4
    && (+[UIColor clearColor],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [(UIColor *)v4 isEqual:v5],
        v5,
        !v6))
  {
    unint64_t v7 = v4;
  }
  else
  {
    unint64_t v7 = 0;
  }

  BOOL v8 = [(_UITabBarLayoutData *)self->_layoutData selectionIndicatorTintColor];
  objc_super v9 = v7;
  objc_super v13 = v9;
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
    objc_super v11 = [(_UIBarAppearanceData *)self->_layoutData writableInstance];
    layoutData = self->_layoutData;
    self->_layoutData = v11;

    [(_UITabBarLayoutData *)v11 setSelectionIndicatorTintColor:v13];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
LABEL_13:
}

- (UIImage)selectionIndicatorImage
{
  return [(_UITabBarLayoutData *)self->_layoutData selectionIndicatorImage];
}

- (void)setSelectionIndicatorImage:(UIImage *)selectionIndicatorImage
{
  uint64_t v4 = selectionIndicatorImage;
  unint64_t v5 = v4;
  if (v4)
  {
    [(UIImage *)v4 size];
    unint64_t v7 = 0;
    if (v8 != 0.0 && v6 != 0.0) {
      unint64_t v7 = v5;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  objc_super v9 = [(_UITabBarLayoutData *)self->_layoutData selectionIndicatorImage];
  BOOL v10 = v7;
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
    uint64_t v12 = [(_UIBarAppearanceData *)self->_layoutData writableInstance];
    layoutData = self->_layoutData;
    self->_layoutData = v12;

    [(_UITabBarLayoutData *)v12 setSelectionIndicatorImage:v14];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
LABEL_14:
}

- (UITabBarItemPositioning)stackedItemPositioning
{
  return [(_UITabBarLayoutData *)self->_layoutData itemPositioning];
}

- (void)setStackedItemPositioning:(UITabBarItemPositioning)stackedItemPositioning
{
  if ([(_UITabBarLayoutData *)self->_layoutData itemPositioning] != stackedItemPositioning)
  {
    unint64_t v5 = [(_UIBarAppearanceData *)self->_layoutData writableInstance];
    layoutData = self->_layoutData;
    self->_layoutData = v5;

    [(_UITabBarLayoutData *)v5 setItemPositioning:stackedItemPositioning];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
}

- (CGFloat)stackedItemWidth
{
  [(_UITabBarLayoutData *)self->_layoutData itemWidth];
  return result;
}

- (void)setStackedItemWidth:(CGFloat)stackedItemWidth
{
  [(_UITabBarLayoutData *)self->_layoutData itemWidth];
  if (v5 != stackedItemWidth)
  {
    double v6 = [(_UIBarAppearanceData *)self->_layoutData writableInstance];
    layoutData = self->_layoutData;
    self->_layoutData = v6;

    [(_UITabBarLayoutData *)v6 setItemWidth:stackedItemWidth];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
}

- (CGFloat)stackedItemSpacing
{
  [(_UITabBarLayoutData *)self->_layoutData itemSpacing];
  return result;
}

- (void)setStackedItemSpacing:(CGFloat)stackedItemSpacing
{
  [(_UITabBarLayoutData *)self->_layoutData itemSpacing];
  if (v5 != stackedItemSpacing)
  {
    double v6 = [(_UIBarAppearanceData *)self->_layoutData writableInstance];
    layoutData = self->_layoutData;
    self->_layoutData = v6;

    [(_UITabBarLayoutData *)v6 setItemSpacing:stackedItemSpacing];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 256);
  }
}

- (UITabBarItemAppearance)inlineLayoutAppearance
{
  return self->_inlineLayoutAppearance;
}

- (UITabBarItemAppearance)compactInlineLayoutAppearance
{
  return self->_compactInlineLayoutAppearance;
}

@end