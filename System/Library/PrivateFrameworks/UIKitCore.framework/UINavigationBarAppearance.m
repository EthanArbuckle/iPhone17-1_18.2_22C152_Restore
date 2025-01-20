@interface UINavigationBarAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)_checkEqualTo:(id)a3;
- (NSDictionary)largeTitleTextAttributes;
- (NSDictionary)titleTextAttributes;
- (UIBarButtonItemAppearance)backButtonAppearance;
- (UIBarButtonItemAppearance)buttonAppearance;
- (UIBarButtonItemAppearance)doneButtonAppearance;
- (UIImage)backIndicatorImage;
- (UIImage)backIndicatorTransitionMaskImage;
- (UIOffset)titlePositionAdjustment;
- (_UINavigationBarVisualProvider)visualProvider;
- (double)_backgroundVisibilityOnScrollDistance;
- (id)_backButtonAppearance;
- (id)_backButtonAppearanceData;
- (id)_barTitleData;
- (id)_doneButtonAppearance;
- (id)_doneButtonAppearanceData;
- (id)_plainButtonAppearance;
- (id)_plainButtonAppearanceData;
- (int64_t)_backgroundVisibility;
- (unint64_t)_hashInto:(unint64_t)a3;
- (void)_barButtonItemAppearanceChangedItemData:(id)a3 toItemData:(id)a4 fromItemData:(id)a5;
- (void)_barButtonItemDataChanged:(id)a3;
- (void)_completeInit;
- (void)_copyFromAppearance:(id)a3;
- (void)_decodeFromCoder:(id)a3;
- (void)_describeInto:(id)a3;
- (void)_setupDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)setBackButtonAppearance:(UIBarButtonItemAppearance *)backButtonAppearance;
- (void)setBackIndicatorImage:(UIImage *)backIndicatorImage transitionMaskImage:(UIImage *)backIndicatorTransitionMaskImage;
- (void)setButtonAppearance:(UIBarButtonItemAppearance *)buttonAppearance;
- (void)setDoneButtonAppearance:(UIBarButtonItemAppearance *)doneButtonAppearance;
- (void)setLargeTitleTextAttributes:(NSDictionary *)largeTitleTextAttributes;
- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment;
- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes;
- (void)set_backgroundVisibility:(int64_t)a3;
- (void)set_backgroundVisibilityOnScrollDistance:(double)a3;
@end

@implementation UINavigationBarAppearance

- (id)_plainButtonAppearanceData
{
  return [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
}

- (id)_doneButtonAppearanceData
{
  return [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _data];
}

- (id)_backButtonAppearanceData
{
  return [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
}

- (void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
  v4 = titleTextAttributes;
  v5 = [(_UINavTitleAppearanceData *)self->_barTitleData titleTextAttributes];
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
  char v7 = [(NSDictionary *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = [(_UIBarAppearanceData *)self->_barTitleData writableInstance];
    barTitleData = self->_barTitleData;
    self->_barTitleData = v8;

    [(_UINavTitleAppearanceData *)v8 setTitleTextAttributes:v10];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 2);
  }
LABEL_9:
}

- (void)_completeInit
{
  v4.receiver = self;
  v4.super_class = (Class)UINavigationBarAppearance;
  [(UIBarAppearance *)&v4 _completeInit];
  [(UIBarButtonItemAppearance *)self->_buttonAppearance _setChangeObserver:self];
  [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _setChangeObserver:self];
  [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setChangeObserver:self];
  v3 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
  [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setFallback:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_backButtonAppearance, 0);
  objc_storeStrong((id *)&self->_doneButtonAppearance, 0);
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
  objc_storeStrong((id *)&self->_barTitleData, 0);
}

- (void)setLargeTitleTextAttributes:(NSDictionary *)largeTitleTextAttributes
{
  objc_super v4 = largeTitleTextAttributes;
  v5 = [(_UINavTitleAppearanceData *)self->_barTitleData largeTitleTextAttributes];
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
  char v7 = [(NSDictionary *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = [(_UIBarAppearanceData *)self->_barTitleData writableInstance];
    barTitleData = self->_barTitleData;
    self->_barTitleData = v8;

    [(_UINavTitleAppearanceData *)v8 setLargeTitleTextAttributes:v10];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 2);
  }
LABEL_9:
}

- (BOOL)_checkEqualTo:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UINavigationBarAppearance;
  if (![(UIBarAppearance *)&v24 _checkEqualTo:v4]) {
    goto LABEL_24;
  }
  v5 = (void *)*((void *)v4 + 6);
  v6 = self->_barTitleData;
  char v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    LOBYTE(v10) = 0;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v10 = [(_UIBarAppearanceData *)v6 isEqual:v7];

  if (v10)
  {
LABEL_11:
    v11 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
    v12 = [*((id *)v4 + 7) _data];
    v6 = v11;
    v13 = v12;
    if (v6 == v13)
    {
    }
    else
    {
      v8 = v13;
      if (v6) {
        BOOL v14 = v13 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        LOBYTE(v10) = 0;
        goto LABEL_31;
      }
      BOOL v15 = [(_UIBarAppearanceData *)v6 isEqual:v13];

      if (!v15) {
        goto LABEL_24;
      }
    }
    v16 = [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _data];
    v17 = [*((id *)v4 + 8) _data];
    v6 = v16;
    v18 = v17;
    if (v6 == v18)
    {

LABEL_26:
      v20 = [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
      v21 = [*((id *)v4 + 9) _data];
      v6 = v20;
      v22 = v21;
      if (v6 == v22)
      {
        LOBYTE(v10) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v22;
        LOBYTE(v10) = 0;
        if (v6 && v22) {
          LOBYTE(v10) = [(_UIBarAppearanceData *)v6 isEqual:v22];
        }
      }
      goto LABEL_31;
    }
    v8 = v18;
    LOBYTE(v10) = 0;
    if (v6 && v18)
    {
      BOOL v19 = [(_UIBarAppearanceData *)v6 isEqual:v18];

      if (!v19)
      {
LABEL_24:
        LOBYTE(v10) = 0;
        goto LABEL_33;
      }
      goto LABEL_26;
    }
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:

  return v10;
}

- (void)_setupDefaults
{
  v11.receiver = self;
  v11.super_class = (Class)UINavigationBarAppearance;
  [(UIBarAppearance *)&v11 _setupDefaults];
  if (!self->_barTitleData)
  {
    v3 = +[_UINavTitleAppearanceData standardTitleDataForIdiom:[(UIBarAppearance *)self idiom]];
    barTitleData = self->_barTitleData;
    self->_barTitleData = v3;
  }
  if (!self->_buttonAppearance)
  {
    v5 = [[UIBarButtonItemAppearance alloc] initWithStyle:0];
    buttonAppearance = self->_buttonAppearance;
    self->_buttonAppearance = v5;
  }
  if (!self->_doneButtonAppearance)
  {
    char v7 = [[UIBarButtonItemAppearance alloc] initWithStyle:2];
    doneButtonAppearance = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v7;
  }
  if (!self->_backButtonAppearance)
  {
    BOOL v9 = objc_alloc_init(UIBarButtonItemAppearance);
    backButtonAppearance = self->_backButtonAppearance;
    self->_backButtonAppearance = v9;

    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:0];
  }
}

- (void)_copyFromAppearance:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)UINavigationBarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v17 _copyFromAppearance:v4];
  v5 = objc_msgSend(v4, "_barTitleData", v17.receiver, v17.super_class);
  v6 = (_UINavTitleAppearanceData *)[v5 copy];
  barTitleData = self->_barTitleData;
  self->_barTitleData = v6;

  v8 = [v4 _plainButtonAppearance];
  BOOL v9 = (UIBarButtonItemAppearance *)[v8 copy];
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v9;

  objc_super v11 = [v4 _doneButtonAppearance];
  v12 = (UIBarButtonItemAppearance *)[v11 copy];
  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v12;

  BOOL v14 = [v4 _backButtonAppearance];

  BOOL v15 = (UIBarButtonItemAppearance *)[v14 copy];
  backButtonAppearance = self->_backButtonAppearance;
  self->_backButtonAppearance = v15;
}

- (id)_barTitleData
{
  return [(_UIBarAppearanceData *)self->_barTitleData markReadOnly];
}

- (id)_plainButtonAppearance
{
  return self->_buttonAppearance;
}

- (id)_doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

- (id)_backButtonAppearance
{
  return self->_backButtonAppearance;
}

- (NSDictionary)largeTitleTextAttributes
{
  return [(_UINavTitleAppearanceData *)self->_barTitleData largeTitleTextAttributes];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v5 encodeWithCoder:v4];
  [(_UINavTitleAppearanceData *)self->_barTitleData encodeToCoder:v4, @"Title", v5.receiver, v5.super_class prefix];
  [v4 encodeObject:self->_buttonAppearance forKey:@"PlainButtons"];
  [v4 encodeObject:self->_doneButtonAppearance forKey:@"DoneButtons"];
  [v4 encodeObject:self->_backButtonAppearance forKey:@"BackButtons"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAppearance;
  [(UIBarAppearance *)&v13 _decodeFromCoder:v4];
  objc_super v5 = +[_UINavTitleAppearanceData decodeFromCoder:v4 prefix:@"Title"];
  v6 = v5;
  if (!v5)
  {
    v6 = +[_UINavTitleAppearanceData standardTitleDataForIdiom:[(UIBarAppearance *)self idiom]];
  }
  objc_storeStrong((id *)&self->_barTitleData, v6);
  if (!v5) {

  }
  char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PlainButtons"];
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v7;

  BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DoneButtons"];
  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v9;

  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackButtons"];
  backButtonAppearance = self->_backButtonAppearance;
  self->_backButtonAppearance = v11;
}

- (void)_describeInto:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UINavigationBarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v5 _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tTitle(%p):", self->_barTitleData);
  [(_UINavTitleAppearanceData *)self->_barTitleData describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tPlain BarButtonItems(%p):", self->_buttonAppearance);
  [(UIBarButtonItemAppearance *)self->_buttonAppearance _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tDone BarButtonItems(%p):", self->_doneButtonAppearance);
  [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tBack Buttons(%p):", self->_backButtonAppearance);
  [(UIBarButtonItemAppearance *)self->_backButtonAppearance _describeInto:v4];
}

- (unint64_t)_hashInto:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAppearance;
  uint64_t v4 = 3 * [(UIBarAppearance *)&v13 _hashInto:a3];
  unint64_t v5 = 3 * ([(_UIBarAppearanceData *)self->_barTitleData hash] + v4);
  v6 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
  unint64_t v7 = [v6 hash] + v5;

  v8 = [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _data];
  uint64_t v9 = [v8 hash] + 3 * v7;

  BOOL v10 = [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
  unint64_t v11 = [v10 hash] + 3 * v9;

  return v11;
}

- (NSDictionary)titleTextAttributes
{
  return [(_UINavTitleAppearanceData *)self->_barTitleData titleTextAttributes];
}

- (UIOffset)titlePositionAdjustment
{
  [(_UINavTitleAppearanceData *)self->_barTitleData titlePositionAdjustment];
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical = titlePositionAdjustment.vertical;
  double horizontal = titlePositionAdjustment.horizontal;
  [(_UINavTitleAppearanceData *)self->_barTitleData titlePositionAdjustment];
  if (v7 != horizontal || v6 != vertical)
  {
    uint64_t v9 = [(_UIBarAppearanceData *)self->_barTitleData writableInstance];
    barTitleData = self->_barTitleData;
    self->_barTitleData = v9;

    -[_UINavTitleAppearanceData setTitlePositionAdjustment:](v9, "setTitlePositionAdjustment:", horizontal, vertical);
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 2);
  }
}

- (void)setButtonAppearance:(UIBarButtonItemAppearance *)buttonAppearance
{
  unint64_t v5 = buttonAppearance;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UINavigationBarAppearance.m" lineNumber:202 description:@"use -[UIBarButtonItemAppearance configureWithDefaultForStyle:] to reset appearance values"];
  }
  double v6 = self->_buttonAppearance;
  double v7 = v5;
  objc_super v13 = v7;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

    goto LABEL_10;
  }
  BOOL v8 = [(UIBarButtonItemAppearance *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_10:
    [(UIBarButtonItemAppearance *)self->_buttonAppearance _setChangeObserver:0];
    uint64_t v9 = [(UIBarButtonItemAppearance *)v13 copy];
    BOOL v10 = self->_buttonAppearance;
    self->_buttonAppearance = v9;

    unint64_t v11 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setFallback:v11];

    [(UIBarButtonItemAppearance *)self->_buttonAppearance _setChangeObserver:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 8);
  }
LABEL_11:
}

- (void)setDoneButtonAppearance:(UIBarButtonItemAppearance *)doneButtonAppearance
{
  unint64_t v5 = doneButtonAppearance;
  if (!v5)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UINavigationBarAppearance.m" lineNumber:214 description:@"use -[UIBarButtonItemAppearance configureWithDefaultForStyle:] to reset appearance values"];
  }
  double v6 = self->_doneButtonAppearance;
  double v7 = v5;
  v12 = v7;
  if (v6 == v7)
  {

    goto LABEL_11;
  }
  if (!v7 || !v6)
  {

    goto LABEL_10;
  }
  BOOL v8 = [(UIBarButtonItemAppearance *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_10:
    [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _setChangeObserver:0];
    uint64_t v9 = [(UIBarButtonItemAppearance *)v12 copy];
    BOOL v10 = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v9;

    [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _setChangeObserver:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 16);
  }
LABEL_11:
}

- (void)setBackButtonAppearance:(UIBarButtonItemAppearance *)backButtonAppearance
{
  unint64_t v5 = backButtonAppearance;
  if (!v5)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UINavigationBarAppearance.m" lineNumber:225 description:@"use -[UIBarButtonItemAppearance configureWithDefaultForStyle:] to reset appearance values"];
  }
  double v6 = self->_backButtonAppearance;
  double v7 = v5;
  BOOL v15 = v7;
  if (v6 == v7)
  {

    BOOL v10 = v15;
LABEL_11:

    uint64_t v9 = v15;
    goto LABEL_12;
  }
  if (!v7 || !v6)
  {

    goto LABEL_10;
  }
  BOOL v8 = [(UIBarButtonItemAppearance *)v6 isEqual:v7];

  uint64_t v9 = v15;
  if (!v8)
  {
LABEL_10:
    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setChangeObserver:0];
    BOOL v10 = [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
    unint64_t v11 = [(UIBarButtonItemAppearance *)v15 copy];
    v12 = self->_backButtonAppearance;
    self->_backButtonAppearance = v11;

    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _updateToSupportBackIndicatorsCopyingIndicatorsAndFallbackFrom:v10];
    objc_super v13 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setFallback:v13];

    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setChangeObserver:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 4);
    goto LABEL_11;
  }
LABEL_12:
}

- (UIImage)backIndicatorImage
{
  double v2 = [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
  double v3 = [v2 backIndicatorImage];

  return (UIImage *)v3;
}

- (UIImage)backIndicatorTransitionMaskImage
{
  double v2 = [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
  double v3 = [v2 backIndicatorTransitionMaskImage];

  return (UIImage *)v3;
}

- (void)setBackIndicatorImage:(UIImage *)backIndicatorImage transitionMaskImage:(UIImage *)backIndicatorTransitionMaskImage
{
  double v6 = backIndicatorImage;
  double v7 = backIndicatorTransitionMaskImage;
  BOOL v8 = v6;
  uint64_t v9 = v8;
  if (v8)
  {
    [(UIImage *)v8 size];
    v28 = 0;
    if (v11 != 0.0 && v10 != 0.0) {
      v28 = v9;
    }
  }
  else
  {
    v28 = 0;
  }

  v12 = v7;
  objc_super v13 = v12;
  if (v12)
  {
    [(UIImage *)v12 size];
    BOOL v15 = 0;
    if (v16 != 0.0 && v14 != 0.0) {
      BOOL v15 = v13;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  backButtonAppearance = self->_backButtonAppearance;
  if (!v28 || !v15)
  {
    [(UIBarButtonItemAppearance *)backButtonAppearance _resetBackIndicatorImages];
LABEL_28:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 4);
    goto LABEL_29;
  }
  v18 = [(UIBarButtonItemAppearance *)backButtonAppearance _data];
  BOOL v19 = [v18 backIndicatorImage];
  v20 = v28;
  v21 = v20;
  if (v19 == v20)
  {
  }
  else
  {
    v22 = v20;
    if (!v19)
    {
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    BOOL v23 = [(UIImage *)v19 isEqual:v20];

    if (!v23) {
      goto LABEL_26;
    }
  }
  v22 = [(UIBarButtonItemAppearance *)self->_backButtonAppearance _data];
  objc_super v24 = [v22 backIndicatorTransitionMaskImage];
  v25 = v15;
  v26 = v25;
  if (v24 == v25)
  {

    goto LABEL_29;
  }
  if (!v24)
  {

    goto LABEL_25;
  }
  BOOL v27 = [(UIImage *)v24 isEqual:v25];

  if (!v27)
  {
LABEL_27:
    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setBackIndicatorImage:v21 transitionMaskImage:v15];
    goto LABEL_28;
  }
LABEL_29:
}

- (void)_barButtonItemAppearanceChangedItemData:(id)a3 toItemData:(id)a4 fromItemData:(id)a5
{
  if (self->_buttonAppearance == a3) {
    [(UIBarButtonItemAppearance *)self->_backButtonAppearance _setFallback:a4];
  }
}

- (void)_barButtonItemDataChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (UIBarButtonItemAppearance *)a3;
  unint64_t v5 = v4;
  if (self->_buttonAppearance == v4)
  {
    double v7 = self;
    uint64_t v8 = 8;
LABEL_10:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)v7, v8);
    goto LABEL_11;
  }
  if (self->_doneButtonAppearance == v4)
  {
    double v7 = self;
    uint64_t v8 = 16;
    goto LABEL_10;
  }
  if (self->_backButtonAppearance == v4)
  {
    double v7 = self;
    uint64_t v8 = 4;
    goto LABEL_10;
  }
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      double v11 = v5;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Signal from unknown appearance object %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    double v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_barButtonItemDataChanged____s_category_0) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      double v11 = v5;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Signal from unknown appearance object %@", (uint8_t *)&v10, 0xCu);
    }
  }
LABEL_11:
}

- (UIBarButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (UIBarButtonItemAppearance)doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

- (UIBarButtonItemAppearance)backButtonAppearance
{
  return self->_backButtonAppearance;
}

- (_UINavigationBarVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (int64_t)_backgroundVisibility
{
  return self->__backgroundVisibility;
}

- (void)set_backgroundVisibility:(int64_t)a3
{
  self->__backgroundVisibility = a3;
}

- (double)_backgroundVisibilityOnScrollDistance
{
  return self->__backgroundVisibilityOnScrollDistance;
}

- (void)set_backgroundVisibilityOnScrollDistance:(double)a3
{
  self->__backgroundVisibilityOnScrollDistance = a3;
}

@end