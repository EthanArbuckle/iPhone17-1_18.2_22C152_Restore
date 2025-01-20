@interface PSEditableTableCell
+ (int64_t)cellStyle;
- (BOOL)_cellIsEditing;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canReload;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)isTextFieldEditing;
- (BOOL)resignFirstResponder;
- (BOOL)returnKeyTapped;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PSEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PSListController)controllerDelegate;
- (double)defaultTextFieldIndentation;
- (double)minTextFieldIndentation;
- (double)textFieldHorizontalPadding;
- (id)_defaultTextColor;
- (id)value;
- (void)_setValueChanged;
- (void)cellRemovedFromView;
- (void)controlChanged:(id)a3;
- (void)dealloc;
- (void)endEditingAndSave;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setCellEnabled:(BOOL)a3;
- (void)setControllerDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation PSEditableTableCell

+ (int64_t)cellStyle
{
  return 1000;
}

- (PSEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PSEditableTableCell;
  v5 = [(PSTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PSEditableTableCell *)v5 setSelectionStyle:0];
    [(PSEditableTableCell *)v6 setAccessoryType:0];
    [(PSEditableTableCell *)v6 defaultTextFieldIndentation];
    -[PSEditableTableCell setTextFieldOffset:](v6, "setTextFieldOffset:");
    v7 = [(PSEditableTableCell *)v6 editableTextField];
    [v7 setDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(PSEditableTableCell *)self editableTextField];
  [v3 setDelegate:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43718] object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F436E8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)PSEditableTableCell;
  [(PSTableCell *)&v6 dealloc];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PSEditableTableCell;
  [(PSTableCell *)&v74 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSEditableTableCell *)self textField];
  objc_super v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v5 setFont:v6];

  if (*((void *)v4 + 7) == 12)
  {
    v7 = [v4 propertyForKey:@"overrideDevicePasscodeEntryPreset"];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        objc_super v9 = MEMORY[0x1E4F14500];
        v10 = "will not set devicePasscodeEntry (refreshCellContentsWithSpecifier)";
LABEL_10:
        _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      }
    }
    else
    {
      [v5 setDevicePasscodeEntry:1];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        objc_super v9 = MEMORY[0x1E4F14500];
        v10 = "set devicePasscodeEntry (refreshCellContentsWithSpecifier)";
        goto LABEL_10;
      }
    }
    [v5 setSecureTextEntry:1];
    [v5 setAutocapitalizationType:0];
    [v5 setAutocorrectionType:1];
    uint64_t v13 = *((void *)v4 + 12);
    switch(v13)
    {
      case 3:
        v14 = v5;
        uint64_t v15 = 2;
        break;
      case 2:
        v14 = v5;
        uint64_t v15 = 11;
        break;
      case 1:
        v14 = v5;
        uint64_t v15 = 3;
        break;
      default:
        if (*((uint64_t *)v4 + 9) < 1 || (v16 = [v5 keyboardType], uint64_t v15 = *((void *)v4 + 9), v16 == v15))
        {
          v14 = v5;
          uint64_t v15 = 1;
        }
        else
        {
          v14 = v5;
        }
        break;
    }
    [v14 setKeyboardType:v15];
    goto LABEL_37;
  }
  if (*((void *)v4 + 12))
  {
    [v5 setAutocorrectionType:1];
    [v5 setAutocapitalizationType:0];
    switch(*((void *)v4 + 12))
    {
      case 1:
        v11 = v5;
        uint64_t v12 = 3;
        goto LABEL_30;
      case 2:
        v11 = v5;
        uint64_t v12 = 11;
        goto LABEL_30;
      case 3:
        v11 = v5;
        uint64_t v12 = 2;
        goto LABEL_30;
      case 4:
      case 5:
        v11 = v5;
        uint64_t v12 = 7;
        goto LABEL_30;
      case 6:
        v11 = v5;
        uint64_t v12 = 8;
LABEL_30:
        [v11 setKeyboardType:v12];
        break;
      default:
        break;
    }
  }
  else
  {
    if ([v5 autocapitalizationType] != *((void *)v4 + 10)) {
      objc_msgSend(v5, "setAutocapitalizationType:");
    }
    if ([v5 keyboardType] != *((void *)v4 + 9)) {
      objc_msgSend(v5, "setKeyboardType:");
    }
    if ([v5 autocorrectionType] != *((void *)v4 + 11)) {
      objc_msgSend(v5, "setAutocorrectionType:");
    }
  }
  v17 = [v4 propertyForKey:@"noAutoCorrect"];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
    [v5 setAutocorrectionType:1];
    [v5 setAutocapitalizationType:0];
  }
  v19 = [v4 propertyForKey:@"textContentType"];

  if (v19)
  {
    v20 = [v4 propertyForKey:@"textContentType"];
    [v5 setTextContentType:v20];
  }
LABEL_37:
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v22 = (id *)v4;
    v23 = [v22 placeholder];
    if ([v23 length]) {
      [(PSEditableTableCell *)self setPlaceholderText:v23];
    }
  }
  else
  {
    v22 = 0;
  }
  if (*((void *)v4 + 2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)v4 + 1);
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      v26 = [v4 performGetter];
      if (v26 == 0 && (isKindOfClass & 1) != 0)
      {
        if (!v22[26])
        {
          v27 = [v22 propertyForKey:@"bestGuess"];
          if ([v27 length] && (SEL v28 = NSSelectorFromString((NSString *)v27)) != 0) {
            SEL v29 = v28;
          }
          else {
            SEL v29 = 0;
          }
          v22[26] = (id)v29;

          if (!v22[26]) {
            goto LABEL_55;
          }
        }
        id v30 = objc_loadWeakRetained(v22 + 1);
        char v31 = objc_opt_respondsToSelector();

        if ((v31 & 1) == 0) {
          goto LABEL_55;
        }
        id v32 = objc_loadWeakRetained(v22 + 1);
        v26 = SFPerformSelector();
      }
      if (v26)
      {
        [(PSEditableTableCell *)self setValue:v26];
      }
    }
  }
LABEL_55:
  v33 = +[PSListController appearance];
  v34 = [v33 editablePlaceholderTextColor];

  if (v34)
  {
    v35 = [v5 placeholder];
    if (v35)
    {
      id v36 = objc_alloc(MEMORY[0x1E4F28B18]);
      v37 = [v5 placeholder];
      uint64_t v75 = *MEMORY[0x1E4F42510];
      +[PSListController appearance];
      v38 = v72 = v22;
      v39 = [v38 editablePlaceholderTextColor];
      [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v39];
      id v40 = v4;
      v41 = v5;
      v43 = v42 = self;
      v76[0] = v43;
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
      v45 = (void *)[v36 initWithString:v37 attributes:v44];

      self = v42;
      v5 = v41;
      id v4 = v40;

      v22 = v72;
      [v5 setAttributedPlaceholder:v45];
    }
  }
  v46 = +[PSListController appearance];
  v47 = [v46 editableTextColor];

  if (v47)
  {
    v48 = +[PSListController appearance];
    v49 = [v48 editableTextColor];
    v50 = [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v49];
    [v5 setTextColor:v50];
  }
  v51 = +[PSListController appearance];
  v52 = [v51 editableInsertionPointColor];

  if (v52)
  {
    v53 = +[PSListController appearance];
    v54 = [v53 editableInsertionPointColor];
    v55 = [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v54];
    [v5 setInsertionPointColor:v55];
  }
  v56 = +[PSListController appearance];
  v57 = [v56 editableSelectionBarColor];

  if (v57)
  {
    v58 = +[PSListController appearance];
    v59 = [v58 editableSelectionBarColor];
    v60 = [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v59];
    [v5 setSelectionBarColor:v60];
  }
  v61 = +[PSListController appearance];
  v62 = [v61 editableSelectionHighlightColor];

  if (v62)
  {
    v63 = +[PSListController appearance];
    v64 = [v63 editableSelectionHighlightColor];
    v65 = [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v64];
    [v5 setSelectionHighlightColor:v65];
  }
  uint64_t v66 = [v4 propertyForKey:@"alignment"];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [v4 propertyForKey:@"alignment"];
    objc_opt_class();
    char v69 = objc_opt_isKindOfClass();

    if (v69)
    {
      id v70 = [v4 propertyForKey:@"alignment"];
      if ([v70 isEqualToString:@"left"])
      {
        uint64_t v71 = 0;
      }
      else if ([v70 isEqualToString:@"center"])
      {
        uint64_t v71 = 1;
      }
      else if ([v70 isEqualToString:@"right"])
      {
        uint64_t v71 = 2;
      }
      else
      {
        uint64_t v71 = 4;
      }

      [v5 setTextAlignment:v71];
    }
  }
}

- (void)prepareForReuse
{
  v3 = [(PSEditableTableCell *)self textField];
  [v3 setSecureTextEntry:0];
  [v3 setKeyboardType:0];
  [v3 setAutocorrectionType:0];
  [v3 setAutocapitalizationType:2];
  [(PSEditableTableCell *)self setPlaceholderText:0];
  v4.receiver = self;
  v4.super_class = (Class)PSEditableTableCell;
  [(PSTableCell *)&v4 prepareForReuse];
}

- (BOOL)canReload
{
  uint64_t v3 = objc_opt_class();
  return [(PSEditableTableCell *)self isMemberOfClass:v3];
}

- (void)controlChanged:(id)a3
{
  id v11 = a3;
  objc_super v4 = [v11 value];
  id WeakRetained = objc_loadWeakRetained(&self->_realTarget);
  if (WeakRetained)
  {
    objc_super v6 = WeakRetained;
    v7 = [(PSTableCell *)self specifier];

    if (v7)
    {
      id v8 = objc_loadWeakRetained(&self->_realTarget);
      objc_super v9 = [(PSTableCell *)self specifier];
      id v10 = (id)SFPerformSelector2();
    }
  }
}

- (void)endEditingAndSave
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43718] object:0];

  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F436E8] object:0];

  if (self->_valueChanged)
  {
    [(PSEditableTableCell *)self controlChanged:self];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F43E28];
    v7 = [(PSEditableTableCell *)self editableTextField];
    [v5 removeObserver:self name:v6 object:v7];
  }
  if (self->_delaySpecifierRelease)
  {
    [(PSTableCell *)self setSpecifier:0];
  }
}

- (void)cellRemovedFromView
{
  uint64_t v3 = [(PSTableCell *)self specifier];
  v4.receiver = self;
  v4.super_class = (Class)PSEditableTableCell;
  [(PSTableCell *)&v4 cellRemovedFromView];
  if ([(PSEditableTableCell *)self isTextFieldEditing]
    || [(PSEditableTableCell *)self isFirstResponder])
  {
    if (v3)
    {
      [(PSTableCell *)self setSpecifier:v3];
      self->_delaySpecifierRelease = 1;
    }
  }
}

- (void)_setValueChanged
{
  if ([(PSEditableTableCell *)self isTextFieldEditing]) {
    self->_valueChanged = 1;
  }
  else {
    [(PSEditableTableCell *)self controlChanged:self];
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F43E28];
  objc_super v4 = [(PSEditableTableCell *)self editableTextField];
  [v5 removeObserver:self name:v3 object:v4];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v10 = [(PSEditableTableCell *)self superview];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && UIKeyboardAutomaticIsOnScreen())
  {
    objc_super v4 = [v10 indexPathForCell:self];
    [v10 scrollToRowAtIndexPath:v4 atScrollPosition:2 animated:1];
  }
  self->_valueChanged = 0;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F43E28];
  v7 = [(PSEditableTableCell *)self editableTextField];
  [v5 addObserver:self selector:sel__setValueChanged name:v6 object:v7];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__saveForExit name:*MEMORY[0x1E4F43718] object:0];

  objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__saveForExit name:*MEMORY[0x1E4F436E8] object:0];
}

- (BOOL)textFieldShouldClear:(id)a3
{
  if (![(PSEditableTableCell *)self isTextFieldEditing])
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4F43E28];
    uint64_t v6 = [(PSEditableTableCell *)self editableTextField];
    [v4 addObserver:self selector:sel__setValueChanged name:v5 object:v6];
  }
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  [(PSEditableTableCell *)self endEditingAndSave];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  uint64_t v5 = [WeakRetained propertyForKey:@"textFieldShouldPopOnReturn"];
  int v6 = [v5 BOOLValue];

  if (v6 && self->_returnKeyTapped)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_controllerDelegate);
    v7 = [v9 navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  self->_returnKeyTapped = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  objc_super v4 = [WeakRetained propertyForKey:@"textFieldShouldPopOnReturn"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  id obj = a3;
  [(PSTableCell *)self setCellTarget:self];
  [(PSTableCell *)self setCellAction:sel_controlChanged_];
  if (a4) {
    v7 = a4;
  }
  else {
    v7 = 0;
  }
  self->_targetSetter = v7;
  objc_storeWeak(&self->_realTarget, obj);
}

- (id)_defaultTextColor
{
  uint64_t v3 = +[PSListController appearance];
  objc_super v4 = [v3 editableTextColor];
  if (v4)
  {
    char v5 = [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v4];
  }
  else
  {
    int v6 = [MEMORY[0x1E4F428B8] blackColor];
    char v5 = [(PSEditableTableCell *)self _accessibilityHigherContrastTintColorForColor:v6];
  }
  return v5;
}

- (void)setCellEnabled:(BOOL)a3
{
  if (self->super._cellEnabled != a3)
  {
    BOOL v3 = a3;
    v14.receiver = self;
    v14.super_class = (Class)PSEditableTableCell;
    -[PSTableCell setCellEnabled:](&v14, sel_setCellEnabled_);
    char v5 = [(PSEditableTableCell *)self editableTextField];
    [v5 setEnabled:v3];

    if (v3)
    {
      textColor = self->_textColor;
      v7 = [(PSEditableTableCell *)self editableTextField];
      id v8 = v7;
      if (textColor)
      {
        [v7 setTextColor:self->_textColor];

        id v8 = self->_textColor;
        self->_textColor = 0;
LABEL_8:

        return;
      }
      uint64_t v12 = [(PSEditableTableCell *)self _defaultTextColor];
    }
    else
    {
      id v9 = [(PSEditableTableCell *)self editableTextField];
      id v10 = [v9 textColor];
      id v11 = self->_textColor;
      self->_textColor = v10;

      id v8 = [(PSEditableTableCell *)self editableTextField];
      uint64_t v12 = [MEMORY[0x1E4F428B8] tableCellGrayTextColor];
    }
    uint64_t v13 = (void *)v12;
    [v8 setTextColor:v12];

    goto LABEL_8;
  }
}

- (void)setTitle:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PSEditableTableCell;
  id v4 = a3;
  [(PSTableCell *)&v10 setTitle:v4];
  uint64_t v5 = objc_msgSend(v4, "length", v10.receiver, v10.super_class);

  [(PSTableCell *)self textFieldOffset];
  double v7 = v6;
  if (v5)
  {
    [(PSEditableTableCell *)self minTextFieldIndentation];
    if (v7 == v8) {
      return;
    }
    [(PSEditableTableCell *)self minTextFieldIndentation];
  }
  else
  {
    [(PSEditableTableCell *)self defaultTextFieldIndentation];
    if (v7 == v9) {
      return;
    }
    [(PSEditableTableCell *)self defaultTextFieldIndentation];
  }
  -[PSEditableTableCell setTextFieldOffset:](self, "setTextFieldOffset:");
}

- (void)setDelegate:(id)a3
{
}

- (double)minTextFieldIndentation
{
  return 105.0;
}

- (double)defaultTextFieldIndentation
{
  return 9.0;
}

- (double)textFieldHorizontalPadding
{
  return 8.0;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PSEditableTableCell;
  [(PSTableCell *)&v23 layoutSubviews];
  BOOL v3 = [(PSTableCell *)self titleLabel];
  id v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    double v6 = [(PSEditableTableCell *)self traitCollection];
    double v7 = [v6 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (!IsAccessibilityCategory)
    {
      [v3 frame];
      double v10 = v9;
      double v12 = v11;
      [v3 sizeToFit];
      [v3 frame];
      double v14 = v13;
      objc_msgSend(v3, "setFrame:", v10, v12);
      int v15 = [(PSEditableTableCell *)self _shouldReverseLayoutDirection];
      [(PSEditableTableCell *)self textFieldHorizontalPadding];
      if (v15) {
        double v17 = v10 - v16;
      }
      else {
        double v17 = v10 + v14 + v16;
      }
      float v18 = ceil(v17);
      v19 = [(PSEditableTableCell *)self editableTextField];
      [v19 frame];
      if (v15) {
        BOOL v21 = v20 > v18;
      }
      else {
        BOOL v21 = v20 < v18;
      }
      if (v21)
      {
        float v22 = v18 - v20;
        [v19 setFrame:v20 + v22];
      }
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(PSEditableTableCell *)self editableTextField];
  char v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(PSEditableTableCell *)self editableTextField];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)isFirstResponder
{
  v2 = [(PSEditableTableCell *)self editableTextField];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(PSEditableTableCell *)self editableTextField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)PSEditableTableCell;
  if ([(PSEditableTableCell *)&v7 isFirstResponder])
  {
    v6.receiver = self;
    v6.super_class = (Class)PSEditableTableCell;
    return [(PSEditableTableCell *)&v6 resignFirstResponder];
  }
  else
  {
    id v4 = [(PSEditableTableCell *)self editableTextField];
    char v3 = [v4 resignFirstResponder];
  }
  return v3;
}

- (BOOL)isTextFieldEditing
{
  v2 = [(PSEditableTableCell *)self editableTextField];
  char v3 = [v2 isEditing];

  return v3;
}

- (BOOL)_cellIsEditing
{
  v3.receiver = self;
  v3.super_class = (Class)PSEditableTableCell;
  return [(PSEditableTableCell *)&v3 isEditing];
}

- (id)value
{
  v2 = [(PSEditableTableCell *)self editableTextField];
  objc_super v3 = [v2 text];

  return v3;
}

- (void)setValue:(id)a3
{
  id v14 = a3;
  id v4 = [(PSEditableTableCell *)self detailTextLabel];
  id v5 = [v4 text];

  objc_super v6 = v14;
  if (v5 != v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(PSEditableTableCell *)self editableTextField];
      double v8 = v7;
      id v9 = v14;
LABEL_4:
      [v7 setText:v9];
LABEL_7:

      objc_super v6 = v14;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [(PSEditableTableCell *)self editableTextField];
      double v10 = [v14 stringValue];
      [v8 setText:v10];

      goto LABEL_7;
    }
    objc_super v6 = v14;
    if (!v14)
    {
      double v11 = [(PSEditableTableCell *)self editableTextField];
      double v12 = [v11 text];
      uint64_t v13 = [v12 length];

      objc_super v6 = 0;
      if (v13)
      {
        objc_super v7 = [(PSEditableTableCell *)self editableTextField];
        double v8 = v7;
        id v9 = 0;
        goto LABEL_4;
      }
    }
  }
LABEL_8:
}

- (BOOL)returnKeyTapped
{
  return self->_returnKeyTapped;
}

- (PSListController)controllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controllerDelegate);
  return (PSListController *)WeakRetained;
}

- (void)setControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controllerDelegate);
  objc_destroyWeak(&self->_realTarget);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end