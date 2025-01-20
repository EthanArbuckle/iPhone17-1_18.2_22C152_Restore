@interface PSPasscodeField
- (BOOL)becomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isEnabled;
- (BOOL)isSecureTextEntry;
- (BOOL)securePasscodeEntry;
- (BOOL)shouldBecomeFirstResponderOnTap;
- (CGSize)dotFullSize;
- (CGSize)promptSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)fieldSpacing;
- (PSPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3;
- (PSPasscodeFieldDelegate)delegate;
- (UIColor)foregroundColor;
- (id)dashImage;
- (id)digitFont;
- (id)dotFullImage;
- (id)dotOutlineImage;
- (id)stringValue;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (unint64_t)numberOfEntryFields;
- (void)_delegateEnteredPasscode:(id)a3;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)passcodeFieldTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFieldSpacing:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setNumberOfEntryFields:(unint64_t)a3;
- (void)setSecurePasscodeEntry:(BOOL)a3;
- (void)setShouldBecomeFirstResponderOnTap:(BOOL)a3;
- (void)setStringValue:(id)a3;
@end

@implementation PSPasscodeField

- (PSPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PSPasscodeField;
  v4 = -[PSPasscodeField initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    dotOutlineViews = v4->_dotOutlineViews;
    v4->_dotOutlineViews = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    dotFullViews = v4->_dotFullViews;
    v4->_dotFullViews = (NSMutableArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    dashViews = v4->_dashViews;
    v4->_dashViews = (NSMutableArray *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    digitViews = v4->_digitViews;
    v4->_digitViews = (NSMutableArray *)v11;

    v13 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    stringValue = v4->_stringValue;
    v4->_stringValue = v13;

    v4->_enabled = 1;
    v4->_shouldBecomeFirstResponderOnTap = 1;
    v4->_securePasscodeEntry = 1;
    [(PSPasscodeField *)v4 setNumberOfEntryFields:a3];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel_passcodeFieldTapped_];
    [(PSPasscodeField *)v4 addGestureRecognizer:v15];
  }
  return v4;
}

- (id)dotFullImage
{
  return GetImage(@"passcodeDot-full", @"passcodeDotInverted-full");
}

- (id)dotOutlineImage
{
  return GetImage(@"passcodeDot-outline", @"passcodeDotInverted-outline");
}

- (id)dashImage
{
  return GetImage(@"passcodeDash", @"passcodeDashInverted");
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  if (self->_numberOfEntryFields != a3)
  {
    unint64_t v3 = a3;
    self->_numberOfEntryFields = a3;
    uint64_t v5 = 416;
    [(NSMutableArray *)self->_dotFullViews removeAllObjects];
    uint64_t v6 = 408;
    [(NSMutableArray *)self->_dotOutlineViews removeAllObjects];
    uint64_t v7 = 424;
    [(NSMutableArray *)self->_dashViews removeAllObjects];
    [(NSMutableArray *)self->_digitViews removeAllObjects];
    id v28 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:28.0];
    v8 = +[PSListController appearance];
    v27 = [v8 textColor];

    uint64_t v9 = [(PSPasscodeField *)self dotFullImage];
    v10 = [(PSPasscodeField *)self dotOutlineImage];
    uint64_t v11 = [(PSPasscodeField *)self dashImage];
    if (v3)
    {
      double v12 = *MEMORY[0x1E4F1DB28];
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v25 = v9;
      v26 = v10;
      do
      {
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v9];
        [*(id *)((char *)&self->super.super.super.isa + v5) addObject:v16];
        uint64_t v17 = v5;
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v10];
        [*(id *)((char *)&self->super.super.super.isa + v6) addObject:v18];
        uint64_t v19 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v11];
        v20 = v11;
        uint64_t v21 = v6;
        v22 = (void *)v19;
        [*(id *)((char *)&self->super.super.super.isa + v7) addObject:v19];
        uint64_t v23 = v7;
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v12, v13, v14, v15);
        [v24 setFont:v28];
        [v24 setTextColor:v27];
        [(NSMutableArray *)self->_digitViews addObject:v24];

        uint64_t v7 = v23;
        uint64_t v6 = v21;
        uint64_t v11 = v20;

        uint64_t v5 = v17;
        uint64_t v9 = v25;
        v10 = v26;

        --v3;
      }
      while (v3);
    }
    [(PSPasscodeField *)self sizeToFit];
    [(PSPasscodeField *)self setNeedsLayout];
  }
}

- (CGSize)dotFullSize
{
  v2 = [(NSMutableArray *)self->_dotFullViews firstObject];
  unint64_t v3 = [v2 image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)promptSize
{
  if (self->_securePasscodeEntry) {
    v2 = &OBJC_IVAR___PSPasscodeField__dotOutlineViews;
  }
  else {
    v2 = &OBJC_IVAR___PSPasscodeField__dashViews;
  }
  unint64_t v3 = [*(id *)((char *)&self->super.super.super.isa + *v2) firstObject];
  double v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)digitFont
{
  v2 = [(NSMutableArray *)self->_digitViews firstObject];
  unint64_t v3 = [v2 font];

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  [(PSPasscodeField *)self dotFullSize];
  double v5 = v4;
  double v7 = v6;
  [(PSPasscodeField *)self promptSize];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(PSPasscodeField *)self digitFont];
  double v13 = (void *)v12;
  if (v12)
  {
    uint64_t v39 = *MEMORY[0x1E4F42508];
    v40[0] = v12;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    [@"0" sizeWithAttributes:v14];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v19 = self->_fieldSpacing;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    double v23 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "floatValue", (void)v34);
        double v23 = v23 + v25;
      }
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }
  else
  {
    double v23 = 0.0;
  }
  if (v7 >= v11) {
    double v26 = v7;
  }
  else {
    double v26 = v11;
  }
  if (v26 >= v18) {
    double v27 = v26;
  }
  else {
    double v27 = v18;
  }
  if (v5 >= v9) {
    double v28 = v5;
  }
  else {
    double v28 = v9;
  }
  if (v28 >= v16) {
    double v29 = v28;
  }
  else {
    double v29 = v16;
  }

  unint64_t numberOfEntryFields = self->_numberOfEntryFields;
  double v31 = v23 + (v29 + 25.0) * (double)numberOfEntryFields + -25.0;
  float v32 = v27;
  double v33 = ceilf(v32);
  result.height = v33;
  result.width = v31;
  return result;
}

- (void)setForegroundColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_foregroundColor = (void **)&self->_foregroundColor;
  if (self->_foregroundColor != v5)
  {
    double v15 = v5;
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    double v7 = GetImageTemplate(@"passcodeDot-full", *p_foregroundColor);
    double v8 = GetImageTemplate(@"passcodeDot-outline", *p_foregroundColor);
    double v9 = GetImageTemplate(@"passcodeDash", *p_foregroundColor);
    if (self->_numberOfEntryFields)
    {
      unint64_t v10 = 0;
      do
      {
        double v11 = [(NSMutableArray *)self->_dotFullViews objectAtIndexedSubscript:v10];
        [v11 setImage:v7];

        uint64_t v12 = [(NSMutableArray *)self->_dotOutlineViews objectAtIndexedSubscript:v10];
        [v12 setImage:v8];

        double v13 = [(NSMutableArray *)self->_dashViews objectAtIndexedSubscript:v10];
        [v13 setImage:v9];

        double v14 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v10];
        [v14 setTextColor:*p_foregroundColor];

        ++v10;
      }
      while (v10 < self->_numberOfEntryFields);
    }

    double v5 = v15;
  }
}

- (void)passcodeFieldTapped:(id)a3
{
  if ([(PSPasscodeField *)self shouldBecomeFirstResponderOnTap])
  {
    [(PSPasscodeField *)self becomeFirstResponder];
  }
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (void)setFieldSpacing:(id)a3
{
  double v5 = (NSArray *)a3;
  p_fieldSpacing = &self->_fieldSpacing;
  if (self->_fieldSpacing != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_fieldSpacing, a3);
    [(PSPasscodeField *)self sizeToFit];
    p_fieldSpacing = (NSArray **)[(PSPasscodeField *)self setNeedsLayout];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_fieldSpacing, v5);
}

- (void)layoutSubviews
{
  v53[1] = *MEMORY[0x1E4F143B8];
  if (self->_securePasscodeEntry) {
    unint64_t v3 = &OBJC_IVAR___PSPasscodeField__dotOutlineViews;
  }
  else {
    unint64_t v3 = &OBJC_IVAR___PSPasscodeField__dashViews;
  }
  id v4 = *(id *)((char *)&self->super.super.super.isa + *v3);
  if (self->_numberOfEntryFields)
  {
    unint64_t v5 = 0;
    BOOL securePasscodeEntry = self->_securePasscodeEntry;
    while (v5 >= [(NSMutableString *)self->_stringValue length])
    {
      double v11 = [(NSMutableArray *)self->_dotFullViews objectAtIndexedSubscript:v5];
      [v11 removeFromSuperview];

      uint64_t v12 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v5];
      [v12 removeFromSuperview];

      double v13 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v5];
      [v13 setText:0];

      double v14 = [v4 objectAtIndexedSubscript:v5];
      double v15 = [v14 superview];

      if (!v15)
      {
        unint64_t v10 = [v4 objectAtIndexedSubscript:v5];
        goto LABEL_13;
      }
LABEL_15:
      if (++v5 >= self->_numberOfEntryFields) {
        goto LABEL_16;
      }
    }
    double v6 = [(NSMutableArray *)self->_dotOutlineViews objectAtIndexedSubscript:v5];
    [v6 removeFromSuperview];

    double v7 = [(NSMutableArray *)self->_dotFullViews objectAtIndexedSubscript:v5];
    [v7 removeFromSuperview];

    double v8 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v5];
    [v8 removeFromSuperview];

    double v9 = [(NSMutableArray *)self->_dashViews objectAtIndexedSubscript:v5];
    [v9 removeFromSuperview];

    if (securePasscodeEntry)
    {
      unint64_t v10 = [(NSMutableArray *)self->_dotFullViews objectAtIndexedSubscript:v5];
    }
    else
    {
      unint64_t v10 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v5];
      double v16 = -[NSMutableString substringWithRange:](self->_stringValue, "substringWithRange:", v5, 1);
      double v17 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v5];
      [v17 setText:v16];
    }
    double v18 = [v10 superview];

    if (!v18) {
LABEL_13:
    }
      [(PSPasscodeField *)self addSubview:v10];

    goto LABEL_15;
  }
LABEL_16:
  uint64_t v19 = [(PSPasscodeField *)self digitFont];
  [(PSPasscodeField *)self dotFullSize];
  double v49 = v21;
  double v51 = v20;
  [(PSPasscodeField *)self promptSize];
  double v47 = v23;
  double v48 = v22;
  uint64_t v52 = *MEMORY[0x1E4F42508];
  v53[0] = v19;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
  [@"0" sizeWithAttributes:v24];
  double v45 = v26;
  double v46 = v25;

  if (self->_numberOfEntryFields)
  {
    unint64_t v27 = 0;
    if (v51 >= v48) {
      double v28 = v51;
    }
    else {
      double v28 = v48;
    }
    if (v28 < v46) {
      double v28 = v46;
    }
    if (v49 >= v47) {
      double v29 = v49;
    }
    else {
      double v29 = v47;
    }
    if (v29 < v45) {
      double v29 = v45;
    }
    double v44 = v28 + 25.0;
    double v30 = (v28 - v51) * 0.5;
    double v31 = (v29 - v49) * 0.5;
    double v32 = (v28 - v48) * 0.5;
    double v33 = (v29 - v47) * 0.5;
    double v34 = (v28 - v46) * 0.5;
    double v35 = (v29 - v45) * 0.5;
    double v36 = 0.0;
    do
    {
      double v37 = 0.0;
      if ((uint64_t)(v27 - 1) >= 0 && [(NSArray *)self->_fieldSpacing count] > v27 - 1)
      {
        v38 = [(NSArray *)self->_fieldSpacing objectAtIndexedSubscript:v27 - 1];
        [v38 floatValue];
        double v37 = v39;
      }
      double v36 = v36 + v37;
      double v40 = v36 + v44 * (double)v27;
      v41 = [(NSMutableArray *)self->_dotFullViews objectAtIndexedSubscript:v27];
      v54.origin.x = v30 + v40;
      v54.origin.y = v31;
      v54.size.height = v49;
      v54.size.width = v51;
      CGRect v55 = CGRectIntegral(v54);
      objc_msgSend(v41, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
      v42 = [v4 objectAtIndexedSubscript:v27];
      v56.origin.x = v32 + v40;
      v56.origin.y = v33;
      v56.size.height = v47;
      v56.size.width = v48;
      CGRect v57 = CGRectIntegral(v56);
      objc_msgSend(v42, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
      v43 = [(NSMutableArray *)self->_digitViews objectAtIndexedSubscript:v27];
      v58.origin.x = v34 + v40;
      v58.origin.y = v35;
      v58.size.height = v45;
      v58.size.width = v46;
      CGRect v59 = CGRectIntegral(v58);
      objc_msgSend(v43, "setFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);

      ++v27;
    }
    while (v27 < self->_numberOfEntryFields);
  }
}

- (void)_delegateEnteredPasscode:(id)a3
{
  id v4 = a3;
  [(PSPasscodeField *)self forceDisplayIfNeeded];
  dispatch_time_t v5 = dispatch_time(0, 76000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PSPasscodeField__delegateEnteredPasscode___block_invoke;
  v7[3] = &unk_1E5C5DDD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], v7);
}

void __44__PSPasscodeField__delegateEnteredPasscode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 456));
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  [WeakRetained passcodeField:v2 enteredPasscode:v3];
}

- (id)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  [(NSMutableString *)self->_stringValue setString:a3];
  [(PSPasscodeField *)self setNeedsLayout];
  if ([(NSMutableString *)self->_stringValue length] == self->_numberOfEntryFields)
  {
    stringValue = self->_stringValue;
    [(PSPasscodeField *)self _delegateEnteredPasscode:stringValue];
  }
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PSPasscodeField;
  BOOL v2 = [(PSPasscodeField *)&v5 becomeFirstResponder];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [v3 setReturnKeyEnabled:0];
  }
  return v2;
}

- (int64_t)keyboardType
{
  if (PSUsePadStylePIN()) {
    return 11;
  }
  else {
    return 127;
  }
}

- (int64_t)keyboardAppearance
{
  unint64_t v3 = +[PSListController appearance];
  char v4 = [v3 usesDarkTheme];

  if (v4) {
    return 1;
  }
  else {
    return self->_keyboardAppearance;
  }
}

- (void)insertText:(id)a3
{
  id v9 = a3;
  if ([(PSPasscodeField *)self isEnabled]
    && [(NSMutableString *)self->_stringValue length] != self->_numberOfEntryFields
    && ([v9 isEqualToString:@"\n"] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v7 = [v6 passcodeField:self shouldInsertText:v9];

      id v8 = (void *)v7;
    }
    else
    {
      id v8 = v9;
    }
    id v9 = v8;
    if ([v8 length])
    {
      [(NSMutableString *)self->_stringValue appendString:v9];
      [(PSPasscodeField *)self setNeedsLayout];
      if ([(NSMutableString *)self->_stringValue length] == self->_numberOfEntryFields) {
        [(PSPasscodeField *)self _delegateEnteredPasscode:self->_stringValue];
      }
    }
  }
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_stringValue length] != 0;
}

- (void)deleteBackward
{
  if ([(NSMutableString *)self->_stringValue length])
  {
    -[NSMutableString deleteCharactersInRange:](self->_stringValue, "deleteCharactersInRange:", [(NSMutableString *)self->_stringValue length] - 1, 1);
    [(PSPasscodeField *)self setNeedsLayout];
  }
}

- (PSPasscodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSPasscodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (BOOL)securePasscodeEntry
{
  return self->_securePasscodeEntry;
}

- (void)setSecurePasscodeEntry:(BOOL)a3
{
  self->_BOOL securePasscodeEntry = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (NSArray)fieldSpacing
{
  return self->_fieldSpacing;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)shouldBecomeFirstResponderOnTap
{
  return self->_shouldBecomeFirstResponderOnTap;
}

- (void)setShouldBecomeFirstResponderOnTap:(BOOL)a3
{
  self->_shouldBecomeFirstResponderOnTap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldSpacing, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_digitViews, 0);
  objc_storeStrong((id *)&self->_dashViews, 0);
  objc_storeStrong((id *)&self->_dotFullViews, 0);
  objc_storeStrong((id *)&self->_dotOutlineViews, 0);
}

@end