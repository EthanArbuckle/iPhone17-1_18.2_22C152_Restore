@interface UIToolbarAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)_checkEqualTo:(id)a3;
- (UIBarButtonItemAppearance)buttonAppearance;
- (UIBarButtonItemAppearance)doneButtonAppearance;
- (id)_doneButtonAppearance;
- (id)_doneButtonAppearanceData;
- (id)_plainButtonAppearance;
- (id)_plainButtonAppearanceData;
- (unint64_t)_hashInto:(unint64_t)a3;
- (void)_barButtonItemDataChanged:(id)a3;
- (void)_completeInit;
- (void)_copyFromAppearance:(id)a3;
- (void)_decodeFromCoder:(id)a3;
- (void)_describeInto:(id)a3;
- (void)_setupDefaults;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonAppearance:(UIBarButtonItemAppearance *)buttonAppearance;
- (void)setDoneButtonAppearance:(UIBarButtonItemAppearance *)doneButtonAppearance;
@end

@implementation UIToolbarAppearance

- (void)_completeInit
{
  v3.receiver = self;
  v3.super_class = (Class)UIToolbarAppearance;
  [(UIBarAppearance *)&v3 _completeInit];
  [(UIBarButtonItemAppearance *)self->_buttonAppearance _setChangeObserver:self];
  [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _setChangeObserver:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonAppearance, 0);
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
}

- (BOOL)_checkEqualTo:(id)a3
{
  v4 = (id *)a3;
  v18.receiver = self;
  v18.super_class = (Class)UIToolbarAppearance;
  if (![(UIBarAppearance *)&v18 _checkEqualTo:v4]) {
    goto LABEL_8;
  }
  v5 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
  v6 = [v4[6] _data];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    goto LABEL_16;
  }
  char v11 = [v7 isEqual:v8];

  if (v11)
  {
LABEL_10:
    v13 = [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _data];
    v14 = [v4[7] _data];
    id v7 = v13;
    id v15 = v14;
    if (v7 == v15)
    {
      char v12 = 1;
      v9 = v7;
      goto LABEL_18;
    }
    v9 = v15;
    if (v7) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      char v12 = [v7 isEqual:v15];
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:
    char v12 = 0;
    goto LABEL_18;
  }
LABEL_8:
  char v12 = 0;
LABEL_19:

  return v12;
}

- (void)_setupDefaults
{
  v7.receiver = self;
  v7.super_class = (Class)UIToolbarAppearance;
  [(UIBarAppearance *)&v7 _setupDefaults];
  if (!self->_buttonAppearance)
  {
    objc_super v3 = [[UIBarButtonItemAppearance alloc] initWithStyle:0];
    buttonAppearance = self->_buttonAppearance;
    self->_buttonAppearance = v3;
  }
  if (!self->_doneButtonAppearance)
  {
    v5 = [[UIBarButtonItemAppearance alloc] initWithStyle:2];
    doneButtonAppearance = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v5;
  }
}

- (void)_copyFromAppearance:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIToolbarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v11 _copyFromAppearance:v4];
  v5 = objc_msgSend(v4, "_plainButtonAppearance", v11.receiver, v11.super_class);
  v6 = (UIBarButtonItemAppearance *)[v5 copy];
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v6;

  id v8 = [v4 _doneButtonAppearance];

  v9 = (UIBarButtonItemAppearance *)[v8 copy];
  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v9;
}

- (id)_plainButtonAppearance
{
  return self->_buttonAppearance;
}

- (id)_doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

- (id)_plainButtonAppearanceData
{
  return [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
}

- (id)_doneButtonAppearanceData
{
  return [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _data];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIToolbarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_buttonAppearance, @"PlainButtons", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_doneButtonAppearance forKey:@"DoneButtons"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_decodeFromCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIToolbarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v9 _decodeFromCoder:v4];
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), @"PlainButtons", v9.receiver, v9.super_class);
  objc_super v5 = (UIBarButtonItemAppearance *)objc_claimAutoreleasedReturnValue();
  buttonAppearance = self->_buttonAppearance;
  self->_buttonAppearance = v5;

  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DoneButtons"];

  doneButtonAppearance = self->_doneButtonAppearance;
  self->_doneButtonAppearance = v7;
}

- (void)_describeInto:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIToolbarAppearance;
  id v4 = a3;
  [(UIBarAppearance *)&v5 _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tPlain BarButtonItems(%p):", self->_buttonAppearance);
  [(UIBarButtonItemAppearance *)self->_buttonAppearance _describeInto:v4];
  objc_msgSend(v4, "appendFormat:", @"\n\tDone BarButtonItems(%p):", self->_doneButtonAppearance);
  [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _describeInto:v4];
}

- (unint64_t)_hashInto:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIToolbarAppearance;
  uint64_t v4 = 3 * [(UIBarAppearance *)&v10 _hashInto:a3];
  objc_super v5 = [(UIBarButtonItemAppearance *)self->_buttonAppearance _data];
  uint64_t v6 = [v5 hash] + v4;

  objc_super v7 = [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _data];
  unint64_t v8 = [v7 hash] + 3 * v6;

  return v8;
}

- (void)setButtonAppearance:(UIBarButtonItemAppearance *)buttonAppearance
{
  objc_super v5 = buttonAppearance;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIToolbarAppearance.m" lineNumber:114 description:@"use -[UIBarButtonItemAppearance setupDefaultAppearanceForStyle:] to reset appearance values"];
  }
  uint64_t v6 = self->_buttonAppearance;
  objc_super v7 = v5;
  char v12 = v7;
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
    objc_super v9 = [(UIBarButtonItemAppearance *)v12 copy];
    objc_super v10 = self->_buttonAppearance;
    self->_buttonAppearance = v9;

    [(UIBarButtonItemAppearance *)self->_buttonAppearance _setChangeObserver:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 8);
  }
LABEL_11:
}

- (void)setDoneButtonAppearance:(UIBarButtonItemAppearance *)doneButtonAppearance
{
  objc_super v5 = doneButtonAppearance;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIToolbarAppearance.m" lineNumber:125 description:@"use -[UIBarButtonItemAppearance setupDefaultAppearanceForStyle:] to reset appearance values"];
  }
  uint64_t v6 = self->_doneButtonAppearance;
  objc_super v7 = v5;
  char v12 = v7;
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
    objc_super v9 = [(UIBarButtonItemAppearance *)v12 copy];
    objc_super v10 = self->_doneButtonAppearance;
    self->_doneButtonAppearance = v9;

    [(UIBarButtonItemAppearance *)self->_doneButtonAppearance _setChangeObserver:self];
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)self, 16);
  }
LABEL_11:
}

- (void)_barButtonItemDataChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (UIBarButtonItemAppearance *)a3;
  objc_super v5 = v4;
  if (self->_buttonAppearance == v4)
  {
    objc_super v7 = self;
    uint64_t v8 = 8;
LABEL_8:
    -[UIBarAppearance _signalCategoryChanges:]((uint64_t)v7, v8);
    goto LABEL_9;
  }
  if (self->_doneButtonAppearance == v4)
  {
    objc_super v7 = self;
    uint64_t v8 = 16;
    goto LABEL_8;
  }
  if (os_variant_has_internal_diagnostics())
  {
    objc_super v9 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Signal from unknown apperance object %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_barButtonItemDataChanged____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Signal from unknown apperance object %@", (uint8_t *)&v10, 0xCu);
    }
  }
LABEL_9:
}

- (UIBarButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (UIBarButtonItemAppearance)doneButtonAppearance
{
  return self->_doneButtonAppearance;
}

@end