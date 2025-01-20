@interface SUUIPINInputControl
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)_defaultBoxSizeForFont:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (BOOL)resignFirstResponder;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SUUIPINInputControl)initWithFrame:(CGRect)a3;
- (UIColor)boxBackgroundColor;
- (UIColor)boxBorderColor;
- (UIColor)textColor;
- (UIFont)font;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (int64_t)numberOfCharacters;
- (int64_t)spellCheckingType;
- (void)_reloadLabelSubviews;
- (void)_sendValueChangeEvents;
- (void)_setNeedsReloadLayout;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBoxBackgroundColor:(id)a3;
- (void)setBoxBorderColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setNumberOfCharacters:(int64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SUUIPINInputControl

- (SUUIPINInputControl)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUUIPINInputControl;
  v3 = -[SUUIPINInputControl initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] whiteColor];
    boxBackgroundColor = v3->_boxBackgroundColor;
    v3->_boxBackgroundColor = (UIColor *)v4;

    uint64_t v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    boxBorderColor = v3->_boxBorderColor;
    v3->_boxBorderColor = (UIColor *)v6;

    uint64_t v8 = [MEMORY[0x263F81708] _lightSystemFontOfSize:28.0];
    font = v3->_font;
    v3->_font = (UIFont *)v8;

    uint64_t v10 = [MEMORY[0x263F825C8] blackColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;

    v3->_numberOfCharacters = 4;
    [(SUUIPINInputControl *)v3 _reloadLabelSubviews];
  }
  return v3;
}

- (void)setBoxBackgroundColor:(id)a3
{
  if (self->_boxBackgroundColor != a3)
  {
    uint64_t v4 = (UIColor *)[a3 copy];
    boxBackgroundColor = self->_boxBackgroundColor;
    self->_boxBackgroundColor = v4;

    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

- (void)setBoxBorderColor:(id)a3
{
  if (self->_boxBorderColor != a3)
  {
    uint64_t v4 = (UIColor *)[a3 copy];
    boxBorderColor = self->_boxBorderColor;
    self->_boxBorderColor = v4;

    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

- (void)setFont:(id)a3
{
  if (self->_font != a3)
  {
    uint64_t v4 = (UIFont *)[a3 copy];
    font = self->_font;
    self->_font = v4;

    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  if (self->_numberOfCharacters != a3)
  {
    self->_numberOfCharacters = a3;
    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

- (void)setText:(id)a3
{
  if (self->_text != a3)
  {
    uint64_t v4 = (NSMutableString *)[a3 mutableCopy];
    text = self->_text;
    self->_text = v4;

    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

- (void)setTextColor:(id)a3
{
  if (self->_textColor != a3)
  {
    uint64_t v4 = (UIColor *)[a3 copy];
    textColor = self->_textColor;
    self->_textColor = v4;

    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  v7 = [a4 style];
  uint64_t v8 = SUUIViewElementFontWithStyle(v7);

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263F81708] _lightSystemFontOfSize:28.0];
  }
  [a1 _defaultBoxSizeForFont:v8];
  double v10 = v9;

  double v11 = a3;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v6 = (SUUIViewElement *)a3;
  id v15 = [(SUUIViewElement *)v6 style];
  v7 = [v15 ikBackgroundColor];
  uint64_t v8 = [v7 color];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(SUUIPINInputControl *)self setBoxBackgroundColor:v8];
  double v9 = [v15 ikBorderColor];
  double v10 = [v9 color];

  if (!v10)
  {
    double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  }
  [(SUUIPINInputControl *)self setBoxBorderColor:v10];
  double v11 = [v15 ikColor];
  double v12 = [v11 color];

  if (!v12)
  {
    double v12 = [MEMORY[0x263F825C8] blackColor];
  }
  [(SUUIPINInputControl *)self setTextColor:v12];
  objc_super v13 = SUUIViewElementFontWithStyle(v15);
  if (!v13)
  {
    objc_super v13 = [MEMORY[0x263F81708] _lightSystemFontOfSize:28.0];
  }
  [(SUUIPINInputControl *)self setFont:v13];
  [(SUUIPINInputControl *)self setKeyboardType:[(SUUIViewElement *)v6 keyboardType]];
  [(SUUIPINInputControl *)self setNumberOfCharacters:[(SUUIViewElement *)v6 maximumLength]];
  [(SUUIPINInputControl *)self setSecureTextEntry:[(SUUIViewElement *)v6 isSecure]];
  viewElement = self->_viewElement;
  self->_viewElement = v6;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)deleteBackward
{
  uint64_t v3 = [(NSMutableString *)self->_text length];
  if (v3 >= 1)
  {
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", v3 - 1, 1);
    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
    [(SUUIPINInputControl *)self _sendValueChangeEvents];
  }
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_text length] != 0;
}

- (void)insertText:(id)a3
{
  id v7 = a3;
  if ((unint64_t)[(NSMutableString *)self->_text length] < self->_numberOfCharacters
    && ([v7 isEqualToString:@"\n"] & 1) == 0)
  {
    text = self->_text;
    if (!text)
    {
      double v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
      uint64_t v6 = self->_text;
      self->_text = v5;

      text = self->_text;
    }
    [(NSMutableString *)text appendString:v7];
    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
    [(SUUIPINInputControl *)self _sendValueChangeEvents];
  }
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIPINInputControl;
  BOOL v3 = [(SUUIPINInputControl *)&v5 becomeFirstResponder];
  if (v3) {
    [(SUUIPINInputControl *)self _reloadLabelSubviews];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIPINInputControl;
  BOOL v3 = [(SUUIPINInputControl *)&v5 resignFirstResponder];
  if (v3) {
    [(SUUIPINInputControl *)self _reloadLabelSubviews];
  }
  return v3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  if (self->_secureTextEntry != a3)
  {
    self->_secureTextEntry = a3;
    [(SUUIPINInputControl *)self _setNeedsReloadLayout];
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (void)layoutSubviews
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  [(SUUIPINInputControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if (self->_needsLabelReload)
  {
    [(SUUIPINInputControl *)self _reloadLabelSubviews];
    self->_needsLabelReload = 0;
  }
  [(id)objc_opt_class() _defaultBoxSizeForFont:self->_font];
  double v8 = v7;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  double v9 = self->_labels;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    double v13 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "sizeThatFits:", v4, v6);
        if (v8 < v16) {
          double v8 = v16;
        }
        if (v13 < v15) {
          double v13 = v15;
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = v8;
  }

  uint64_t v17 = [(NSMutableArray *)self->_labels count];
  double v18 = v13 * (double)v17;
  double v19 = (double)(v17 - 1);
  float v20 = (v4 - v18) / v19;
  double v21 = floorf(v20);
  if (v21 <= 10.0) {
    double v22 = v21;
  }
  else {
    double v22 = 10.0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v23 = self->_labels;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    float v26 = (v6 - v8) * 0.5;
    double v27 = floorf(v26);
    float v28 = (v4 - (v18 + v22 * v19)) * 0.5;
    double v29 = floorf(v28);
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "setFrame:", v29, v27, v13, v8, (void)v32);
        v43.origin.x = v29;
        v43.origin.y = v27;
        v43.size.width = v13;
        v43.size.height = v8;
        double v29 = v22 + CGRectGetMaxX(v43);
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v25);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_needsLabelReload)
  {
    [(SUUIPINInputControl *)self _reloadLabelSubviews];
    self->_needsLabelReload = 0;
  }
  [(id)objc_opt_class() _defaultBoxSizeForFont:self->_font];
  double v7 = v6;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v8 = self->_labels;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    double v12 = v7;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "sizeThatFits:", width, height, (void)v19);
        if (v7 < v15) {
          double v7 = v15;
        }
        if (v12 < v14) {
          double v12 = v14;
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = v7;
  }

  uint64_t v16 = [(NSMutableArray *)self->_labels count];
  double v17 = (double)(v16 - 1) * 10.0 + v12 * (double)v16;
  double v18 = v7;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIPINInputControl;
  [(SUUIPINInputControl *)&v3 tintColorDidChange];
  [(SUUIPINInputControl *)self _reloadLabelSubviews];
}

+ (double)_defaultBoxSizeForFont:(id)a3
{
  [a3 pointSize];
  return fmax(v3 + 16.0, 44.0);
}

- (void)_reloadLabelSubviews
{
  if (!self->_labels)
  {
    double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    labels = self->_labels;
    self->_labels = v3;
  }
  float v26 = [(UIColor *)self->_boxBorderColor CGColor];
  double v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  double v7 = v6;

  int v8 = [(SUUIPINInputControl *)self isFirstResponder];
  BOOL v25 = [(SUUIPINInputControl *)self isSecureTextEntry];
  uint64_t v9 = [(NSMutableString *)self->_text length];
  if (self->_numberOfCharacters >= 1)
  {
    int64_t v10 = v9;
    int64_t v11 = 0;
    double v12 = 1.0 / v7;
    do
    {
      if (v11 >= (unint64_t)[(NSMutableArray *)self->_labels count])
      {
        id v13 = objc_alloc_init(MEMORY[0x263F828E0]);
        [v13 setTextAlignment:1];
        [v13 setUserInteractionEnabled:0];
        [(NSMutableArray *)self->_labels addObject:v13];
        [(SUUIPINInputControl *)self addSubview:v13];
      }
      else
      {
        id v13 = [(NSMutableArray *)self->_labels objectAtIndex:v11];
      }
      double v14 = [v13 layer];
      double v15 = v14;
      if (v10 == v11) {
        int v16 = v8;
      }
      else {
        int v16 = 0;
      }
      if (v16 == 1)
      {
        id v17 = [(SUUIPINInputControl *)self tintColor];
        objc_msgSend(v15, "setBorderColor:", objc_msgSend(v17, "CGColor"));

        double v18 = 1.0;
      }
      else
      {
        [v14 setBorderColor:v26];
        double v18 = v12;
      }
      [v15 setBorderWidth:v18];
      [v13 setBackgroundColor:self->_boxBackgroundColor];
      [v13 setFont:self->_font];
      [v13 setTextColor:self->_textColor];
      if (v11 >= v10)
      {
        long long v19 = v13;
        long long v20 = 0;
      }
      else
      {
        if (!v25)
        {
          long long v21 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v11, 1);
          [v13 setText:v21];

          goto LABEL_20;
        }
        long long v19 = v13;
        long long v20 = @"•";
      }
      [v19 setText:v20];
LABEL_20:

      ++v11;
    }
    while (v11 < self->_numberOfCharacters);
  }
  int64_t v22 = [(NSMutableArray *)self->_labels count];
  if (v22 > self->_numberOfCharacters)
  {
    int64_t v23 = v22 - 1;
    do
    {
      uint64_t v24 = [(NSMutableArray *)self->_labels objectAtIndex:v23];
      [v24 removeFromSuperview];
      [(NSMutableArray *)self->_labels removeObjectAtIndex:v23];

      ++v23;
    }
    while (v23 >= self->_numberOfCharacters);
  }
}

- (void)_sendValueChangeEvents
{
  if (self->_viewElement)
  {
    double v3 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", self->_text, @"term", 0);
    [(SUUIViewElement *)self->_viewElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v3 completionBlock:0];
  }
  [(SUUIPINInputControl *)self sendActionsForControlEvents:4096];
}

- (void)_setNeedsReloadLayout
{
  self->_needsLabelReload = 1;
  [(SUUIPINInputControl *)self setNeedsLayout];
}

- (UIColor)boxBackgroundColor
{
  return self->_boxBackgroundColor;
}

- (UIColor)boxBorderColor
{
  return self->_boxBorderColor;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)numberOfCharacters
{
  return self->_numberOfCharacters;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (NSString)text
{
  return &self->_text->super;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_boxBorderColor, 0);
  objc_storeStrong((id *)&self->_boxBackgroundColor, 0);
}

@end