@interface TFFeedbackFormShortTextCell
+ (CGSize)_sizeToFitText:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5;
+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6;
+ (UIEdgeInsets)_textFieldInsetsInTraitEnvironment:(id)a3;
+ (id)_createTextFieldFontWithTraitCollection:(id)a3;
- (TFFeedbackEntryShortText)shortTextEntry;
- (TFFeedbackFormShortTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (unint64_t)displayableDataType;
- (void)_configureTextFieldForContentType:(unint64_t)a3;
- (void)_prepareForDisplayWithTraitCollection:(id)a3;
- (void)applyContentsOfEntry:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisplayedDataString:(id)a3;
- (void)setShortTextEntry:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TFFeedbackFormShortTextCell

- (TFFeedbackFormShortTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackFormShortTextCell;
  v4 = [(TFFeedbackFormBaseCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CA98]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    [(UITextField *)v4->_textField setDelegate:v4];
    [(UITextField *)v4->_textField setClearButtonMode:2];
    v8 = [(TFFeedbackFormShortTextCell *)v4 contentView];
    [v8 addSubview:v4->_textField];

    v9 = [(TFFeedbackFormShortTextCell *)v4 traitCollection];
    [(TFFeedbackFormShortTextCell *)v4 _prepareForDisplayWithTraitCollection:v9];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)TFFeedbackFormShortTextCell;
  [(TFFeedbackFormBaseCell *)&v21 layoutSubviews];
  +[TFFeedbackFormShortTextCell _textFieldInsetsInTraitEnvironment:self];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(TFFeedbackFormShortTextCell *)self contentView];
  [v11 bounds];
  double v13 = v6 + v12;
  double v15 = v4 + v14;
  double v17 = v16 - (v6 + v10);
  double v19 = v18 - (v4 + v8);

  v20 = [(TFFeedbackFormShortTextCell *)self textField];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackFormShortTextCell;
  [(TFFeedbackFormShortTextCell *)&v5 traitCollectionDidChange:a3];
  double v4 = [(TFFeedbackFormShortTextCell *)self traitCollection];
  [(TFFeedbackFormShortTextCell *)self _prepareForDisplayWithTraitCollection:v4];

  [(TFFeedbackFormShortTextCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)TFFeedbackFormShortTextCell;
  [(TFFeedbackFormShortTextCell *)&v10 prepareForReuse];
  double v3 = [(TFFeedbackFormShortTextCell *)self textField];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    objc_super v5 = [(TFFeedbackFormShortTextCell *)self shortTextEntry];

    if (v5)
    {
      double v6 = [(TFFeedbackFormBaseCell *)self updateProxy];
      double v7 = [(TFFeedbackFormShortTextCell *)self shortTextEntry];
      double v8 = [(TFFeedbackFormShortTextCell *)self textField];
      double v9 = [v8 text];
      [v6 didUpdateEntry:v7 toString:v9 editInProgress:0];
    }
  }
  [(TFFeedbackFormShortTextCell *)self setShortTextEntry:0];
}

- (void)applyContentsOfEntry:(id)a3
{
  id v8 = a3;
  if (![v8 type])
  {
    [(TFFeedbackFormShortTextCell *)self setShortTextEntry:v8];
    int v4 = [(TFFeedbackFormShortTextCell *)self shortTextEntry];
    objc_super v5 = [v4 placeholder];
    double v6 = [(TFFeedbackFormShortTextCell *)self textField];
    [v6 setPlaceholder:v5];

    double v7 = [(TFFeedbackFormShortTextCell *)self shortTextEntry];
    -[TFFeedbackFormShortTextCell _configureTextFieldForContentType:](self, "_configureTextFieldForContentType:", [v7 contentType]);
  }
}

+ (CGSize)sizeForEntry:(id)a3 dataSource:(id)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a6;
  id v13 = v11;
  id v14 = a4;
  double v15 = [v13 identifier];
  double v16 = [v14 stringForIdentifier:v15];

  if (!v16 || ![v16 length])
  {
    uint64_t v17 = [v13 placeholder];

    double v16 = (void *)v17;
  }
  objc_msgSend(a1, "_sizeToFitText:fittingSize:inTraitEnvironment:", v16, v12, width, height);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (unint64_t)displayableDataType
{
  return 0;
}

- (void)setDisplayedDataString:(id)a3
{
  id v4 = a3;
  id v5 = [(TFFeedbackFormShortTextCell *)self textField];
  [v5 setText:v4];
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (!a4)
  {
    id v11 = v6;
    double v7 = [(TFFeedbackFormShortTextCell *)self shortTextEntry];

    id v6 = v11;
    if (v7)
    {
      id v8 = [(TFFeedbackFormBaseCell *)self updateProxy];
      double v9 = [(TFFeedbackFormShortTextCell *)self shortTextEntry];
      objc_super v10 = [v11 text];
      [v8 didUpdateEntry:v9 toString:v10 editInProgress:0];

      id v6 = v11;
    }
  }
}

- (void)_configureTextFieldForContentType:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v10 = (id)*MEMORY[0x263F1D690];
    uint64_t v4 = 1;
    uint64_t v5 = 7;
  }
  else
  {
    id v10 = 0;
    uint64_t v5 = 0;
    uint64_t v4 = 0;
  }
  id v6 = [(TFFeedbackFormShortTextCell *)self textField];
  [v6 setTextContentType:v10];

  double v7 = [(TFFeedbackFormShortTextCell *)self textField];
  [v7 setKeyboardType:v5];

  id v8 = [(TFFeedbackFormShortTextCell *)self textField];
  [v8 setSmartInsertDeleteType:v4];

  double v9 = [(TFFeedbackFormShortTextCell *)self textField];
  [v9 setAutocorrectionType:v4];
}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  id v5 = +[TFFeedbackFormShortTextCell _createTextFieldFontWithTraitCollection:a3];
  uint64_t v4 = [(TFFeedbackFormShortTextCell *)self textField];
  [v4 setFont:v5];
}

+ (CGSize)_sizeToFitText:(id)a3 fittingSize:(CGSize)a4 inTraitEnvironment:(id)a5
{
  double width = a4.width;
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  +[TFFeedbackFormShortTextCell _textFieldInsetsInTraitEnvironment:v8];
  double v11 = v10;
  double v13 = v12;
  double v16 = width - v14 - v15;
  uint64_t v30 = *MEMORY[0x263F1C238];
  uint64_t v17 = [v8 traitCollection];

  double v18 = [a1 _createTextFieldFontWithTraitCollection:v17];
  v31[0] = v18;
  double v19 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 2, v19, 0, v16, 1.79769313e308);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v33.origin.x = v21;
  v33.origin.y = v23;
  v33.size.double width = v25;
  v33.size.double height = v27;
  double v28 = ceil(v13 + v11 + CGRectGetHeight(v33));
  double v29 = width;
  result.double height = v28;
  result.double width = v29;
  return result;
}

+ (UIEdgeInsets)_textFieldInsetsInTraitEnvironment:(id)a3
{
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:a3];

  MEMORY[0x270F05FE0](15);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (id)_createTextFieldFontWithTraitCollection:(id)a3
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260] compatibleWithTraitCollection:a3];
}

- (UITextField)textField
{
  return self->_textField;
}

- (TFFeedbackEntryShortText)shortTextEntry
{
  return self->_shortTextEntry;
}

- (void)setShortTextEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTextEntry, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end