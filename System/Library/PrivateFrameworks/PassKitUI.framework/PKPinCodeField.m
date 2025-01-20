@interface PKPinCodeField
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)hyphenatePinCode;
- (BOOL)isSecureTextEntry;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)pinCode;
- (PKPinCodeField)initWithPinCodeLength:(unint64_t)a3 delegate:(id)a4;
- (PKPinCodeField)initWithPinCodeLength:(unint64_t)a3 style:(unint64_t)a4 delegate:(id)a5;
- (PKPinCodeFieldDelegate)delegate;
- (int64_t)keyboardType;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setHyphenatePinCode:(BOOL)a3;
- (void)setPinCode:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)updateCharacterVisibility;
@end

@implementation PKPinCodeField

- (PKPinCodeField)initWithPinCodeLength:(unint64_t)a3 delegate:(id)a4
{
  return [(PKPinCodeField *)self initWithPinCodeLength:a3 style:0 delegate:a4];
}

- (PKPinCodeField)initWithPinCodeLength:(unint64_t)a3 style:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    v9 = [(PKPinCodeField *)self init];
    v10 = v9;
    if (!v9)
    {
LABEL_14:
      self = v10;
      v14 = self;
      goto LABEL_15;
    }
    uint64_t v11 = 408;
    v9->_pinCodeLength = a3;
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_style = a4;
    p_config = &v10->_config;
    id v49 = v8;
    if (a4 == 1)
    {
      long long v13 = xmmword_1A0445B00;
    }
    else
    {
      if (a4)
      {
        long long v13 = 0uLL;
        double v15 = 0.0;
        goto LABEL_10;
      }
      long long v13 = xmmword_1A0445B10;
    }
    double v15 = -7.0;
LABEL_10:
    *(_OWORD *)&p_config->dashLength = v13;
    v10->_config.hyphenOffset = v15;
    v10->_keyboardOverrideEnabled = PKPinCodeViewKeyboardOverride();
    v16 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    pinCode = v10->_pinCode;
    v10->_pinCode = v16;

    uint64_t v18 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
    numbersOnlyCharacterSet = v10->_numbersOnlyCharacterSet;
    v10->_numbersOnlyCharacterSet = (NSCharacterSet *)v18;

    v20 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2788], 2, 32);
    v21 = (void *)MEMORY[0x1E4FB1818];
    v22 = PKPassKitUIBundle();
    v23 = [v21 imageNamed:@"passcodeDot-full" inBundle:v22];
    uint64_t v24 = [v23 imageWithRenderingMode:2];
    dotImage = v10->_dotImage;
    v10->_dotImage = (UIImage *)v24;

    unint64_t v26 = 0x1E4FB1000uLL;
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    hyphenLabel = v10->_hyphenLabel;
    v10->_hyphenLabel = v27;

    [(UILabel *)v10->_hyphenLabel setFont:v20];
    [(UILabel *)v10->_hyphenLabel setTextAlignment:1];
    [(UILabel *)v10->_hyphenLabel setHidden:1];
    [(UILabel *)v10->_hyphenLabel setText:@"-"];
    [(PKPinCodeField *)v10 addSubview:v10->_hyphenLabel];
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10->_pinCodeLength];
    v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10->_pinCodeLength];
    v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10->_pinCodeLength];
    if (v10->_pinCodeLength)
    {
      v30 = 0;
      do
      {
        id v31 = objc_alloc_init(*(Class *)(v26 + 2352));
        uint64_t v32 = v11;
        id v33 = v31;
        [v31 setFont:v20];
        [v33 setTextAlignment:1];
        [v33 setHidden:1];
        [v29 addObject:v33];
        [(PKPinCodeField *)v10 addSubview:v33];
        id v34 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v35 = [MEMORY[0x1E4FB1618] labelColor];
        [v34 setBackgroundColor:v35];

        v36 = [v34 layer];
        [v36 setCornerRadius:p_config->dashWidth * 0.5];

        v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10->_dotImage];
        [MEMORY[0x1E4FB1618] labelColor];
        v38 = v29;
        v40 = v39 = p_config;
        [v37 setTintColor:v40];

        p_config = v39;
        v29 = v38;
        [v37 setHidden:1];
        [v51 addObject:v37];
        [(PKPinCodeField *)v10 addSubview:v37];
        [v52 addObject:v34];
        [(PKPinCodeField *)v10 addSubview:v34];

        uint64_t v11 = v32;
        unint64_t v26 = 0x1E4FB1000;
        v30 = (objc_class *)((char *)v30 + 1);
      }
      while (v30 < *(Class *)((char *)&v10->super.super.super.isa + v11));
    }
    uint64_t v41 = objc_msgSend(v29, "copy", v49);
    numberLabels = v10->_numberLabels;
    v10->_numberLabels = (NSArray *)v41;

    uint64_t v43 = [v52 copy];
    dashViews = v10->_dashViews;
    v10->_dashViews = (NSArray *)v43;

    uint64_t v45 = [v51 copy];
    dotViews = v10->_dotViews;
    v10->_dotViews = (NSArray *)v45;

    [v20 lineHeight];
    v10->_fontHeight = v47;

    id v8 = v50;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)setPinCode:(id)a3
{
  id v10 = a3;
  v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  pinCode = self->_pinCode;
  self->_pinCode = v4;

  unint64_t v6 = [v10 length];
  if (v6)
  {
    if (self->_pinCodeLength >= v6) {
      unint64_t pinCodeLength = v6;
    }
    else {
      unint64_t pinCodeLength = self->_pinCodeLength;
    }
    id v8 = self->_pinCode;
    v9 = [v10 substringToIndex:pinCodeLength];
    [(NSMutableString *)v8 appendString:v9];
  }
  [(PKPinCodeField *)self updateCharacterVisibility];
}

- (NSString)pinCode
{
  v2 = (void *)[(NSMutableString *)self->_pinCode copy];

  return (NSString *)v2;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  if (((!self->_secureTextEntry ^ a3) & 1) == 0)
  {
    self->_secureTextEntry = a3;
    [(PKPinCodeField *)self updateCharacterVisibility];
  }
}

- (void)setHyphenatePinCode:(BOOL)a3
{
  if (self->_hyphenatePinCode != a3)
  {
    self->_hyphenatePinCode = a3;
    [(UILabel *)self->_hyphenLabel setHidden:!a3];
    [(PKPinCodeField *)self setNeedsLayout];
  }
}

- (void)updateCharacterVisibility
{
  uint64_t v3 = [(NSMutableString *)self->_pinCode length];
  if (self->_pinCodeLength)
  {
    unint64_t v4 = v3;
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = [(NSArray *)self->_dashViews objectAtIndexedSubscript:v5];
      [v6 setHidden:v5 < v4];

      v7 = [(NSArray *)self->_numberLabels objectAtIndexedSubscript:v5];
      id v8 = v7;
      BOOL v9 = v5 >= v4 || self->_secureTextEntry;
      [v7 setHidden:v9];

      id v10 = [(NSArray *)self->_dotViews objectAtIndexedSubscript:v5];
      uint64_t v11 = v10;
      BOOL v12 = v5 >= v4 || !self->_secureTextEntry;
      [v10 setHidden:v12];

      ++v5;
    }
    while (v5 < self->_pinCodeLength);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PKPinCodeField *)self layoutMargins];
  double v7 = v5 + v6 + self->_config.dashLength * (double)self->_pinCodeLength;
  double v10 = v9 + v8 + self->_fontHeight;
  double v11 = fmax(v7, width);
  result.height = v10;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PKPinCodeField;
  [(PKPinCodeField *)&v25 layoutSubviews];
  [(PKPinCodeField *)self bounds];
  double x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double v21 = *MEMORY[0x1E4F1DB28];
  double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double dashLength = self->_config.dashLength;
  CGRectGetMidY(v26);
  v27.origin.double x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRectGetWidth(v27);
  PKFloatRoundToPixel();
  if (self->_pinCodeLength)
  {
    unint64_t v9 = 0;
    double v10 = dashLength + v8;
    while (1)
    {
      PKFloatRoundToPixel();
      double v12 = v11;
      double fontHeight = self->_fontHeight;
      v14 = [(NSArray *)self->_numberLabels objectAtIndexedSubscript:v9];
      objc_msgSend(v14, "setFrame:", x, v12, dashLength, fontHeight);

      double v15 = [(NSArray *)self->_dashViews objectAtIndexedSubscript:v9];
      PKSizeAlignedInRect();
      objc_msgSend(v15, "setFrame:");

      v16 = [(NSArray *)self->_dotViews objectAtIndexedSubscript:v9];
      PKSizeAlignedInRect();
      objc_msgSend(v16, "setFrame:");

      double v17 = v10 + x;
      unint64_t pinCodeLength = self->_pinCodeLength;
      if (!self->_hyphenatePinCode) {
        break;
      }
      unint64_t v19 = pinCodeLength >> 1;
      if (pinCodeLength >> 1 != ++v9) {
        goto LABEL_7;
      }
      PKFloatRoundToPixel();
      double v24 = v20;
      double v22 = dashLength;
      double v23 = self->_fontHeight;
      double x = v10 + v17;
      unint64_t pinCodeLength = self->_pinCodeLength;
      unint64_t v9 = v19;
      double v21 = v17;
LABEL_8:
      if (v9 >= pinCodeLength) {
        goto LABEL_9;
      }
    }
    ++v9;
LABEL_7:
    double x = v10 + x;
    goto LABEL_8;
  }
LABEL_9:
  if (self->_hyphenatePinCode) {
    -[UILabel setFrame:](self->_hyphenLabel, "setFrame:", v21, v24, v22, v23);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_pinCode length] != 0;
}

- (void)insertText:(id)a3
{
  id v22 = a3;
  unint64_t pinCodeLength = self->_pinCodeLength;
  unint64_t v5 = [(NSMutableString *)self->_pinCode length];
  unint64_t v6 = self->_pinCodeLength;
  if (v5 < v6) {
    unint64_t v6 = [(NSMutableString *)self->_pinCode length];
  }
  if (pinCodeLength - v6 >= [v22 length])
  {
    uint64_t v10 = [v22 length];
  }
  else
  {
    unint64_t v7 = self->_pinCodeLength;
    unint64_t v8 = [(NSMutableString *)self->_pinCode length];
    unint64_t v9 = self->_pinCodeLength;
    if (v8 < v9) {
      unint64_t v9 = [(NSMutableString *)self->_pinCode length];
    }
    uint64_t v10 = v7 - v9;
  }
  double v11 = v22;
  if (v10)
  {
    uint64_t v12 = 0;
    while (-[NSCharacterSet characterIsMember:](self->_numbersOnlyCharacterSet, "characterIsMember:", [v11 characterAtIndex:v12])|| self->_keyboardOverrideEnabled)
    {
      ++v12;
      double v11 = v22;
      if (v10 == v12)
      {
        uint64_t v12 = v10;
        goto LABEL_15;
      }
    }
    double v11 = v22;
    if (!v12) {
      goto LABEL_18;
    }
LABEL_15:
    unint64_t v13 = [(NSMutableString *)self->_pinCode length];
    pinCode = self->_pinCode;
    double v15 = [v22 substringToIndex:v12];
    [(NSMutableString *)pinCode appendString:v15];

    if (v13 < v13 + v12)
    {
      do
      {
        v16 = [(NSArray *)self->_numberLabels objectAtIndexedSubscript:v13];
        double v17 = self->_pinCode;
        uint64_t v18 = -[NSMutableString rangeOfComposedCharacterSequencesForRange:](v17, "rangeOfComposedCharacterSequencesForRange:", v13, 1);
        double v20 = -[NSMutableString substringWithRange:](v17, "substringWithRange:", v18, v19);
        [v16 setText:v20];

        [(PKPinCodeField *)self updateCharacterVisibility];
        ++v13;
        --v12;
      }
      while (v12);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pinCodeTextFieldWasUpdated:isComplete:", self, -[NSMutableString length](self->_pinCode, "length") == self->_pinCodeLength);

    double v11 = v22;
  }
LABEL_18:
}

- (void)deleteBackward
{
  uint64_t v3 = [(NSMutableString *)self->_pinCode length];
  if (v3)
  {
    -[NSMutableString deleteCharactersInRange:](self->_pinCode, "deleteCharactersInRange:", v3 - 1, 1);
    [(PKPinCodeField *)self updateCharacterVisibility];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pinCodeTextFieldWasUpdated:self isComplete:0];
  }
}

- (int64_t)keyboardType
{
  if (self->_keyboardOverrideEnabled) {
    return 0;
  }
  else {
    return 11;
  }
}

- (BOOL)hyphenatePinCode
{
  return self->_hyphenatePinCode;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (PKPinCodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPinCodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hyphenLabel, 0);
  objc_storeStrong((id *)&self->_dotImage, 0);
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_dashViews, 0);
  objc_storeStrong((id *)&self->_numberLabels, 0);
  objc_storeStrong((id *)&self->_pinCode, 0);

  objc_storeStrong((id *)&self->_numbersOnlyCharacterSet, 0);
}

@end