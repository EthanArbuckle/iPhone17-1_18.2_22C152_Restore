@interface BCBuyGetTwoStateButton
- (AEUserPublishingProductProfile)productProfile;
- (BCBuyGetTwoStateButton)initWithCoder:(id)a3;
- (BCBuyGetTwoStateButton)initWithFrame:(CGRect)a3;
- (BCBuyGetTwoStateButtonDelegate)delegate;
- (BFMAsset)asset;
- (BOOL)buttonShouldBeReadState;
- (BOOL)canPreorder;
- (BOOL)invertedContent;
- (BOOL)isAudiobook;
- (BOOL)isCloud;
- (BOOL)isDownloading;
- (BOOL)isLocal;
- (BOOL)isSample;
- (BOOL)isSingleState;
- (BOOL)isStore;
- (BOOL)storeReachable;
- (BOOL)wasPreordered;
- (CGRect)alignmentFrame;
- (CGSize)alignmentSizeThatFits:(CGSize)a3;
- (NSString)buyDefaultTitle;
- (NSString)buyParameters;
- (NSString)canPreorderDefaultTitle;
- (NSString)listenDefaultTitle;
- (NSString)preorderedDefaultTitle;
- (NSString)priceString;
- (NSString)readDefaultTitle;
- (UIColor)backgroundFillColor;
- (UIColor)backgroundFillHighlightColor;
- (UIColor)buyStateBackgroundFillColor;
- (UIColor)buyStateFrameColor;
- (UIColor)buyStateTextColor;
- (UIColor)disabledBackgroundFillColor;
- (UIColor)disabledTextColor;
- (UIColor)frameColor;
- (UIColor)highlightBackgroundColor;
- (UIColor)normalBackgroundColor;
- (UIColor)textColor;
- (UIColor)textHilightColor;
- (UIFont)buttonFont;
- (UITouch)lastTouch;
- (double)buttonShrinkFactor;
- (double)frameWidth;
- (id)description;
- (unint64_t)buttonState;
- (void)_commonInit;
- (void)buttonTouched:(id)a3 event:(id)a4;
- (void)buyPressed;
- (void)pausedSpinnerPressed;
- (void)preorderPressed;
- (void)pricePressed;
- (void)readOrProductPressed;
- (void)resetButtonState;
- (void)setAlignmentFrame:(CGRect)a3;
- (void)setAsset:(id)a3;
- (void)setBackgroundFillColor:(id)a3;
- (void)setBackgroundFillHighlightColor:(id)a3;
- (void)setButtonFont:(id)a3;
- (void)setButtonShrinkFactor:(double)a3;
- (void)setButtonState:(unint64_t)a3;
- (void)setBuyDefaultTitle:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setBuyStateBackgroundFillColor:(id)a3;
- (void)setBuyStateFrameColor:(id)a3;
- (void)setBuyStateTextColor:(id)a3;
- (void)setCanPreorderDefaultTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledBackgroundFillColor:(id)a3;
- (void)setDisabledTextColor:(id)a3;
- (void)setFrameColor:(id)a3;
- (void)setFrameWidth:(double)a3;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setInvertedContent:(BOOL)a3;
- (void)setIsSingleState:(BOOL)a3;
- (void)setListenDefaultTitle:(id)a3;
- (void)setNormalBackgroundColor:(id)a3;
- (void)setPreorderedDefaultTitle:(id)a3;
- (void)setPriceString:(id)a3;
- (void)setProductProfile:(id)a3;
- (void)setReadDefaultTitle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextHilightColor:(id)a3;
- (void)spinnerPressed;
- (void)updateButton;
- (void)updateConfiguration;
@end

@implementation BCBuyGetTwoStateButton

- (BCBuyGetTwoStateButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCBuyGetTwoStateButton;
  v3 = -[BCBuyGetTwoStateButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BCBuyGetTwoStateButton *)v3 _commonInit];
  }
  return v4;
}

- (BCBuyGetTwoStateButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCBuyGetTwoStateButton;
  v3 = [(BCBuyGetTwoStateButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BCBuyGetTwoStateButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(BCBuyGetTwoStateButton *)self addTarget:self action:"buttonTouched:event:" forControlEvents:64];
  [(BCBuyGetTwoStateButton *)self setClipsToBounds:1];
  v3 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
  buttonFont = self->_buttonFont;
  self->_buttonFont = v3;

  v5 = +[UIColor whiteColor];
  textColor = self->_textColor;
  self->_textColor = v5;

  v7 = +[UIColor colorWithWhite:1.0 alpha:0.5];
  disabledTextColor = self->_disabledTextColor;
  self->_disabledTextColor = v7;

  v9 = +[UIColor blackColor];
  backgroundFillColor = self->_backgroundFillColor;
  self->_backgroundFillColor = v9;

  v11 = +[UIColor blackColor];
  textHilightColor = self->_textHilightColor;
  self->_textHilightColor = v11;

  v13 = +[UIColor whiteColor];
  backgroundFillHighlightColor = self->_backgroundFillHighlightColor;
  self->_backgroundFillHighlightColor = v13;

  v15 = +[UIColor blackColor];
  frameColor = self->_frameColor;
  self->_frameColor = v15;

  self->_frameWidth = 2.0;
  self->_isSingleState = 1;
  v17 = +[UIColor colorWithRed:0.2117647 green:0.580392 blue:0.3843137 alpha:1.0];
  buyStateFrameColor = self->_buyStateFrameColor;
  self->_buyStateFrameColor = v17;

  v19 = +[UIColor colorWithRed:0.2117647 green:0.580392 blue:0.3843137 alpha:1.0];
  buyStateTextColor = self->_buyStateTextColor;
  self->_buyStateTextColor = v19;

  v21 = +[UIColor whiteColor];
  buyStateBackgroundFillColor = self->_buyStateBackgroundFillColor;
  self->_buyStateBackgroundFillColor = v21;

  self->_buttonState = 0;
  v23 = IMCommonCoreBundle();
  v24 = [v23 localizedStringForKey:@"READ" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  readDefaultTitle = self->_readDefaultTitle;
  self->_readDefaultTitle = v24;

  v26 = IMCommonCoreBundle();
  v27 = [v26 localizedStringForKey:@"LISTEN" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  listenDefaultTitle = self->_listenDefaultTitle;
  self->_listenDefaultTitle = v27;

  v29 = IMCommonCoreBundle();
  v30 = [v29 localizedStringForKey:@"BUY" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  buyDefaultTitle = self->_buyDefaultTitle;
  self->_buyDefaultTitle = v30;

  v32 = IMCommonCoreBundle();
  v33 = [v32 localizedStringForKey:@"PRE-ORDER" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  canPreorderDefaultTitle = self->_canPreorderDefaultTitle;
  self->_canPreorderDefaultTitle = v33;

  v35 = IMCommonCoreBundle();
  v36 = [v35 localizedStringForKey:@" PRE-ORDERED" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  preorderedDefaultTitle = self->_preorderedDefaultTitle;
  self->_preorderedDefaultTitle = v36;

  id v38 = +[UIButtonConfiguration plainButtonConfiguration];
  [v38 setCornerStyle:4];
  [v38 setMacIdiomStyle:1];
  [v38 setButtonSize:3];
  [v38 setContentInsets:6.0, 20.0, 6.0, 20.0];
  [(BCBuyGetTwoStateButton *)self setConfiguration:v38];
}

- (CGRect)alignmentFrame
{
  [(BCBuyGetTwoStateButton *)self frame];

  -[BCBuyGetTwoStateButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setAlignmentFrame:(CGRect)a3
{
  -[BCBuyGetTwoStateButton frameForAlignmentRect:](self, "frameForAlignmentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[BCBuyGetTwoStateButton setFrame:](self, "setFrame:");
}

- (CGSize)alignmentSizeThatFits:(CGSize)a3
{
  -[BCBuyGetTwoStateButton sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
  CGRectMakeWithSize();
  -[BCBuyGetTwoStateButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v5 = v4;
  double v7 = v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (BOOL)buttonShouldBeReadState
{
  if (([(BCBuyGetTwoStateButton *)self isCloud]
     || [(BCBuyGetTwoStateButton *)self isLocal]
     || [(BCBuyGetTwoStateButton *)self isDownloading]
     || ![(BCBuyGetTwoStateButton *)self isStore])
    && ![(BCBuyGetTwoStateButton *)self isSample]
    && ![(BCBuyGetTwoStateButton *)self canPreorder])
  {
    return ![(BCBuyGetTwoStateButton *)self wasPreordered];
  }
  else
  {
    return 0;
  }
}

- (void)resetButtonState
{
  if ([(BCBuyGetTwoStateButton *)self buttonShouldBeReadState])
  {
    uint64_t v3 = 3;
  }
  else if ([(BCBuyGetTwoStateButton *)self buttonShouldBeWasPreorderedState])
  {
    uint64_t v3 = 6;
  }
  else if ([(BCBuyGetTwoStateButton *)self buttonShouldBeCanPreorderState])
  {
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = 1;
  }

  [(BCBuyGetTwoStateButton *)self setButtonState:v3];
}

- (void)setButtonState:(unint64_t)a3
{
  unint64_t buttonState = self->_buttonState;
  if (buttonState != a3)
  {
    self->_unint64_t buttonState = a3;
    double v5 = [(BCBuyGetTwoStateButton *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(BCBuyGetTwoStateButton *)self delegate];
      [v7 buyButton:self stateDidChange:buttonState];
    }
    [(BCBuyGetTwoStateButton *)self updateButton];
  }
}

- (void)buttonTouched:(id)a3 event:(id)a4
{
  double v5 = [a4 touchesForView:a3];
  char v6 = [v5 anyObject];
  lastTouch = self->_lastTouch;
  self->_lastTouch = v6;

  if (![(BCBuyGetTwoStateButton *)self buttonState]
    || (char *)[(BCBuyGetTwoStateButton *)self buttonState] == (char *)&def_7D91C + 1)
  {
    [(BCBuyGetTwoStateButton *)self pricePressed];
    return;
  }
  if ((int *)[(BCBuyGetTwoStateButton *)self buttonState] == &dword_4)
  {
    [(BCBuyGetTwoStateButton *)self preorderPressed];
    return;
  }
  if ((char *)[(BCBuyGetTwoStateButton *)self buttonState] == (char *)&dword_4 + 2) {
    goto LABEL_11;
  }
  if ((char *)[(BCBuyGetTwoStateButton *)self buttonState] == (char *)&def_7D91C + 2
    || (char *)[(BCBuyGetTwoStateButton *)self buttonState] == (char *)&dword_4 + 1)
  {
    [(BCBuyGetTwoStateButton *)self buyPressed];
  }
  else
  {
    if ((char *)[(BCBuyGetTwoStateButton *)self buttonState] != (char *)&dword_4 + 3)
    {
      if ((char *)[(BCBuyGetTwoStateButton *)self buttonState] != (char *)&def_7D91C + 3) {
        return;
      }
LABEL_11:
      [(BCBuyGetTwoStateButton *)self readOrProductPressed];
      return;
    }
    [(BCBuyGetTwoStateButton *)self spinnerPressed];
  }
}

- (void)pricePressed
{
  if ([(BCBuyGetTwoStateButton *)self isSingleState])
  {
    [(BCBuyGetTwoStateButton *)self buyPressed];
  }
  else
  {
    [(BCBuyGetTwoStateButton *)self setButtonState:2];
  }
}

- (void)preorderPressed
{
  if ([(BCBuyGetTwoStateButton *)self isSingleState])
  {
    [(BCBuyGetTwoStateButton *)self buyPressed];
  }
  else
  {
    [(BCBuyGetTwoStateButton *)self setButtonState:5];
  }
}

- (void)buyPressed
{
  uint64_t v3 = [(BCBuyGetTwoStateButton *)self buyParameters];
  if (!v3)
  {
    double v4 = [(BCBuyGetTwoStateButton *)self asset];
    if (v4)
    {
      double v5 = [(BCBuyGetTwoStateButton *)self asset];
      [v5 buyParams];
    }
    else
    {
      double v5 = [(BCBuyGetTwoStateButton *)self productProfile];
      [v5 buyParameters];
    uint64_t v3 = };
  }
  [(BCBuyGetTwoStateButton *)self setButtonState:7];
  objc_initWeak(&location, self);
  char v6 = [(BCBuyGetTwoStateButton *)self delegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_16A538;
  v7[3] = &unk_2C4F30;
  objc_copyWeak(&v8, &location);
  [v6 buyButton:self initialBuy:v3 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)readOrProductPressed
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(BCBuyGetTwoStateButton *)self delegate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_16A6F4;
  v4[3] = &unk_2C4F30;
  objc_copyWeak(&v5, &location);
  [v3 buyButton:self initialBuy:0 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)spinnerPressed
{
}

- (void)pausedSpinnerPressed
{
}

- (void)setAsset:(id)a3
{
  id v5 = (BFMAsset *)a3;
  if (self->_asset != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    char v6 = [(BFMAsset *)v10 buyParams];
    [(BCBuyGetTwoStateButton *)self setBuyParameters:v6];

    double v7 = [(BFMAsset *)v10 priceFormatted];
    if (v7)
    {
      [(BCBuyGetTwoStateButton *)self setPriceString:v7];
    }
    else
    {
      id v8 = +[BCMAssetWrapper actionTextForType:0 withAsset:v10];
      [(BCBuyGetTwoStateButton *)self setPriceString:v8];

      v9 = [(BFMAsset *)v10 offer];

      if (v9) {
        [(BCBuyGetTwoStateButton *)self setIsSingleState:1];
      }
    }
    [(BCBuyGetTwoStateButton *)self resetButtonState];
    [(BCBuyGetTwoStateButton *)self updateButton];
  }

  _objc_release_x2();
}

- (void)setProductProfile:(id)a3
{
  id v5 = (AEUserPublishingProductProfile *)a3;
  p_productProfile = &self->_productProfile;
  if (self->_productProfile != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)p_productProfile, a3);
    double v7 = [(AEUserPublishingProductProfile *)v11 buyParameters];
    [(BCBuyGetTwoStateButton *)self setBuyParameters:v7];

    id v8 = [(AEUserPublishingProductProfile *)v11 priceString];
    if (v8)
    {
      [(BCBuyGetTwoStateButton *)self setPriceString:v8];
    }
    else
    {
      v9 = [(AEUserPublishingProductProfile *)v11 actionTextWithType:0];
      [(BCBuyGetTwoStateButton *)self setPriceString:v9];

      v10 = [(AEUserPublishingProductProfile *)v11 offer];

      if (v10) {
        [(BCBuyGetTwoStateButton *)self setIsSingleState:1];
      }
    }
    [(BCBuyGetTwoStateButton *)self resetButtonState];
    [(BCBuyGetTwoStateButton *)self updateButton];

    id v5 = v11;
  }

  _objc_release_x1(p_productProfile, v5);
}

- (void)updateConfiguration
{
  v70.receiver = self;
  v70.super_class = (Class)BCBuyGetTwoStateButton;
  [(BCBuyGetTwoStateButton *)&v70 updateConfiguration];
  uint64_t v3 = [(BCBuyGetTwoStateButton *)self configuration];
  id v4 = [v3 copy];

  id v5 = [v4 background];
  [v5 setStrokeWidth:0.0];

  char v6 = [v4 background];
  [v6 setStrokeColor:0];

  [v4 setImage:0];
  [v4 setPreferredSymbolConfigurationForImage:0];
  unint64_t v10 = [(BCBuyGetTwoStateButton *)self buttonState];
  switch(v10)
  {
    case 0uLL:
      [(BCBuyGetTwoStateButton *)self resetButtonState];
      goto LABEL_60;
    case 1uLL:
    case 3uLL:
    case 7uLL:
    case 9uLL:
    case 0xAuLL:
      goto LABEL_2;
    case 2uLL:
      v14 = [(BCBuyGetTwoStateButton *)self buyStateTextColor];
      v11 = [(BCBuyGetTwoStateButton *)self buyDefaultTitle];
      uint64_t v22 = [(BCBuyGetTwoStateButton *)self buyStateFrameColor];
      if (v22)
      {
        v23 = (void *)v22;
        [(BCBuyGetTwoStateButton *)self frameWidth];
        double v25 = vabdd_f64(0.0, v24);

        if (v25 >= 0.00999999978)
        {
          [(BCBuyGetTwoStateButton *)self frameWidth];
          double v27 = v26;
          v28 = [v4 background];
          [v28 setStrokeWidth:v27];

          if ([(BCBuyGetTwoStateButton *)self isEnabled]) {
            [(BCBuyGetTwoStateButton *)self buyStateFrameColor];
          }
          else {
          v54 = [(BCBuyGetTwoStateButton *)self disabledTextColor];
          }
          v55 = [v4 background];
          [v55 setStrokeColor:v54];
        }
      }
      uint64_t v45 = [(BCBuyGetTwoStateButton *)self buyStateBackgroundFillColor];
      goto LABEL_49;
    case 4uLL:
      goto LABEL_28;
    case 5uLL:
      v14 = +[UIColor systemOrangeColor];
      v11 = [(BCBuyGetTwoStateButton *)self canPreorderDefaultTitle];
      [(BCBuyGetTwoStateButton *)self frameWidth];
      if (vabdd_f64(0.0, v29) >= 0.00999999978)
      {
        [(BCBuyGetTwoStateButton *)self frameWidth];
        double v31 = v30;
        v32 = [v4 background];
        [v32 setStrokeWidth:v31];

        if ([(BCBuyGetTwoStateButton *)self isEnabled]) {
          +[UIColor systemOrangeColor];
        }
        else {
        v52 = [(BCBuyGetTwoStateButton *)self disabledTextColor];
        }
        v53 = [v4 background];
        [v53 setStrokeColor:v52];
      }
      uint64_t v45 = +[UIColor whiteColor];
      goto LABEL_49;
    case 6uLL:
      v33 = [(BCBuyGetTwoStateButton *)self titleLabel];
      v34 = [v33 font];

      [v34 pointSize];
      double v36 = v35;
      [(BCBuyGetTwoStateButton *)self buttonShrinkFactor];
      id v38 = [v34 fontWithSize:v36 * v37];

      v39 = +[UIImageSymbolConfiguration configurationWithFont:v38];
      [v4 setPreferredSymbolConfigurationForImage:v39];

      v40 = +[UIImage systemImageNamed:@"checkmark"];
      [v4 setImage:v40];

      v14 = +[UIColor whiteColor];
      v11 = [(BCBuyGetTwoStateButton *)self preorderedDefaultTitle];
      v41 = +[UIColor tertiaryLabelColor];
      [(BCBuyGetTwoStateButton *)self setNormalBackgroundColor:v41];

      goto LABEL_50;
    case 8uLL:
      if ([(BCBuyGetTwoStateButton *)self buttonShouldBeCanPreorderState])
      {
LABEL_28:
        v42 = [(BCBuyGetTwoStateButton *)self priceString];
        if ([v42 length]) {
          [(BCBuyGetTwoStateButton *)self priceString];
        }
        else {
        v11 = [(BCBuyGetTwoStateButton *)self canPreorderDefaultTitle];
        }

        v14 = +[UIColor whiteColor];
        [(BCBuyGetTwoStateButton *)self frameWidth];
        if (vabdd_f64(0.0, v46) >= 0.00999999978)
        {
          [(BCBuyGetTwoStateButton *)self frameWidth];
          double v48 = v47;
          v49 = [v4 background];
          [v49 setStrokeWidth:v48];

          if ([(BCBuyGetTwoStateButton *)self isEnabled]) {
            +[UIColor systemOrangeColor];
          }
          else {
          v50 = [(BCBuyGetTwoStateButton *)self disabledTextColor];
          }
          v51 = [v4 background];
          [v51 setStrokeColor:v50];
        }
        uint64_t v45 = +[UIColor systemOrangeColor];
      }
      else
      {
LABEL_2:
        v11 = [(BCBuyGetTwoStateButton *)self buyDefaultTitle];
        if (v10 == 3)
        {
          if ([(BCBuyGetTwoStateButton *)self isAudiobook]) {
            [(BCBuyGetTwoStateButton *)self listenDefaultTitle];
          }
          else {
            [(BCBuyGetTwoStateButton *)self readDefaultTitle];
          }
          v11 = v12 = v11;
        }
        else
        {
          v12 = [(BCBuyGetTwoStateButton *)self priceString];
          if ([v12 length])
          {
            uint64_t v13 = [(BCBuyGetTwoStateButton *)self priceString];

            v11 = (void *)v13;
          }
        }

        if ([(BCBuyGetTwoStateButton *)self invertedContent]) {
          [(BCBuyGetTwoStateButton *)self backgroundFillColor];
        }
        else {
        v14 = [(BCBuyGetTwoStateButton *)self textColor];
        }
        uint64_t v15 = [(BCBuyGetTwoStateButton *)self frameColor];
        if (v15)
        {
          v16 = (void *)v15;
          [(BCBuyGetTwoStateButton *)self frameWidth];
          double v18 = vabdd_f64(0.0, v17);

          if (v18 >= 0.00999999978)
          {
            [(BCBuyGetTwoStateButton *)self frameWidth];
            double v20 = v19;
            v21 = [v4 background];
            [v21 setStrokeWidth:v20];

            if ([(BCBuyGetTwoStateButton *)self isEnabled]) {
              [(BCBuyGetTwoStateButton *)self frameColor];
            }
            else {
            v43 = [(BCBuyGetTwoStateButton *)self disabledTextColor];
            }
            v44 = [v4 background];
            [v44 setStrokeColor:v43];
          }
        }
        if ([(BCBuyGetTwoStateButton *)self invertedContent]) {
          [(BCBuyGetTwoStateButton *)self textColor];
        }
        else {
        uint64_t v45 = [(BCBuyGetTwoStateButton *)self backgroundFillColor];
        }
      }
LABEL_49:
      id v38 = (void *)v45;
      [(BCBuyGetTwoStateButton *)self setNormalBackgroundColor:v45];
LABEL_50:

      if (v11) {
        goto LABEL_51;
      }
      goto LABEL_17;
    default:
      v14 = 0;
LABEL_17:
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/BCBuyGetTwoStateButton.m", 421, (uint64_t)"-[BCBuyGetTwoStateButton updateConfiguration]", (uint64_t)"buttonTitle", 0, v7, v8, v9, v69);
      v11 = 0;
LABEL_51:
      if (!v14) {
        BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/BCBuyGetTwoStateButton.m", 422, (uint64_t)"-[BCBuyGetTwoStateButton updateConfiguration]", (uint64_t)"enabledTextColor", 0, v7, v8, v9, v69);
      }
      v56 = [(BCBuyGetTwoStateButton *)self buttonFont];

      if (!v56) {
        BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/BCBuyGetTwoStateButton.m", 423, (uint64_t)"-[BCBuyGetTwoStateButton updateConfiguration]", (uint64_t)"self.buttonFont", 0, v57, v58, v59, v69);
      }
      v60 = [(BCBuyGetTwoStateButton *)self normalBackgroundColor];
      v61 = [v4 background];
      [v61 setBackgroundColor:v60];

      [v4 setBaseForegroundColor:v14];
      id v62 = objc_alloc((Class)NSAttributedString);
      v71[0] = NSFontAttributeName;
      v63 = [(BCBuyGetTwoStateButton *)self buttonFont];
      v72[0] = v63;
      v71[1] = NSForegroundColorAttributeName;
      unsigned __int8 v64 = [(BCBuyGetTwoStateButton *)self isEnabled];
      v65 = v14;
      if ((v64 & 1) == 0)
      {
        v65 = [(BCBuyGetTwoStateButton *)self disabledTextColor];
      }
      v72[1] = v65;
      v66 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
      id v67 = [v62 initWithString:v11 attributes:v66];
      [v4 setAttributedTitle:v67];

      if ((v64 & 1) == 0) {
      [(BCBuyGetTwoStateButton *)self setConfiguration:v4];
      }
      v68 = [v4 attributedTitle];
      [(BCBuyGetTwoStateButton *)self setAccessibilityAttributedLabel:v68];

LABEL_60:
      return;
  }
}

- (void)updateButton
{
  unsigned __int8 v4 = [(BCBuyGetTwoStateButton *)self buttonShouldBeReadState];
  if ((v4 & 1) == 0)
  {
    if (![(BCBuyGetTwoStateButton *)self storeReachable])
    {
      [(BCBuyGetTwoStateButton *)self setEnabled:0];
      goto LABEL_13;
    }
    v2 = [(BCBuyGetTwoStateButton *)self buyParameters];
    if (![v2 length])
    {
      [(BCBuyGetTwoStateButton *)self setEnabled:0];
LABEL_12:

      goto LABEL_13;
    }
  }
  if ([(BCBuyGetTwoStateButton *)self isDownloading]
    && ![(BCBuyGetTwoStateButton *)self isAudiobook])
  {
    char v6 = self;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = +[UIApplication isRunningInStoreDemoMode] ^ 1;
    char v6 = self;
  }
  [(BCBuyGetTwoStateButton *)v6 setEnabled:v5];
  if ((v4 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_13:

  [(BCBuyGetTwoStateButton *)self updateConfiguration];
}

- (BOOL)isStore
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 isStore];

  return v3;
}

- (BOOL)isDownloading
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 isDownloading];

  return v3;
}

- (BOOL)isLocal
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 isLocal];

  return v3;
}

- (BOOL)isCloud
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 isCloud];

  return v3;
}

- (BOOL)isSample
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 isSample];

  return v3;
}

- (BOOL)isAudiobook
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 isAudiobook];

  return v3;
}

- (BOOL)wasPreordered
{
  v2 = [(BCBuyGetTwoStateButton *)self delegate];
  unsigned __int8 v3 = [v2 wasPreordered];

  return v3;
}

- (BOOL)canPreorder
{
  unsigned __int8 v3 = [(BCBuyGetTwoStateButton *)self asset];
  if (v3) {
    [(BCBuyGetTwoStateButton *)self asset];
  }
  else {
  unsigned __int8 v4 = [(BCBuyGetTwoStateButton *)self productProfile];
  }
  unsigned __int8 v5 = [v4 isPreorder];

  return v5;
}

- (BOOL)storeReachable
{
  unsigned __int8 v3 = [(BCBuyGetTwoStateButton *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    unsigned __int8 v5 = [(BCBuyGetTwoStateButton *)self delegate];
    unsigned __int8 v6 = [v5 storeReachable];
LABEL_8:

    return v6;
  }
  if (!+[BKReachability isOffline])
  {
    unsigned __int8 v5 = +[BUAccountsProvider sharedProvider];
    if ([v5 isStoreAccountManagedAppleID])
    {
      unsigned __int8 v6 = 0;
    }
    else
    {
      uint64_t v7 = +[BURestrictionsProvider sharedInstance];
      unsigned __int8 v6 = [v7 isBookStoreAllowed];
    }
    goto LABEL_8;
  }
  return 0;
}

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)BCBuyGetTwoStateButton;
  unsigned __int8 v3 = [(BCBuyGetTwoStateButton *)&v22 description];
  id v4 = [v3 mutableCopy];

  [v4 appendFormat:@" \n"];
  unsigned __int8 v5 = [(BCBuyGetTwoStateButton *)self currentAttributedTitle];
  unsigned __int8 v6 = [v5 string];
  [v4 appendFormat:@"\t currentTitle = %@ \n", v6];

  uint64_t v7 = [(BCBuyGetTwoStateButton *)self priceString];
  [v4 appendFormat:@"\t priceString = %@ \n", v7];

  uint64_t v8 = [(BCBuyGetTwoStateButton *)self buyParameters];
  [v4 appendFormat:@"\t buyParameters = %@ \n", v8];

  uint64_t v9 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self invertedContent]];
  [v4 appendFormat:@"\t invertedContent = %@ \n", v9];

  unint64_t v10 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isSingleState]];
  [v4 appendFormat:@"\t isSingleState = %@ \n", v10];

  v11 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isStore]];
  [v4 appendFormat:@"\t isStore = %@ \n", v11];

  v12 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isLocal]];
  [v4 appendFormat:@"\t isLocal = %@ \n", v12];

  uint64_t v13 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isCloud]];
  [v4 appendFormat:@"\t isCloud = %@ \n", v13];

  v14 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isSample]];
  [v4 appendFormat:@"\t isSample = %@ \n", v14];

  uint64_t v15 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isAudiobook]];
  [v4 appendFormat:@"\t isAudiobook = %@ \n", v15];

  v16 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isDownloading]];
  [v4 appendFormat:@"\t isDownloading = %@ \n", v16];

  double v17 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self isEnabled]];
  [v4 appendFormat:@"\t button state enabled = %@ \n", v17];

  double v18 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self canPreorder]];
  [v4 appendFormat:@"\t canPreorder = %@ \n", v18];

  double v19 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self wasPreordered]];
  [v4 appendFormat:@"\t wasPreordered = %@ \n", v19];

  double v20 = +[NSNumber numberWithBool:[(BCBuyGetTwoStateButton *)self storeReachable]];
  [v4 appendFormat:@"\t storeReachable = %@ \n", v20];

  return v4;
}

- (BCBuyGetTwoStateButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCBuyGetTwoStateButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (AEUserPublishingProductProfile)productProfile
{
  return self->_productProfile;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
}

- (NSString)priceString
{
  return self->_priceString;
}

- (void)setPriceString:(id)a3
{
}

- (BOOL)invertedContent
{
  return self->_invertedContent;
}

- (void)setInvertedContent:(BOOL)a3
{
  self->_invertedContent = a3;
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

- (double)buttonShrinkFactor
{
  return self->_buttonShrinkFactor;
}

- (void)setButtonShrinkFactor:(double)a3
{
  self->_buttonShrinkFactor = a3;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (void)setButtonFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
}

- (UIColor)backgroundFillColor
{
  return self->_backgroundFillColor;
}

- (void)setBackgroundFillColor:(id)a3
{
}

- (UIColor)disabledBackgroundFillColor
{
  return self->_disabledBackgroundFillColor;
}

- (void)setDisabledBackgroundFillColor:(id)a3
{
}

- (UIColor)textHilightColor
{
  return self->_textHilightColor;
}

- (void)setTextHilightColor:(id)a3
{
}

- (UIColor)backgroundFillHighlightColor
{
  return self->_backgroundFillHighlightColor;
}

- (void)setBackgroundFillHighlightColor:(id)a3
{
}

- (UIColor)frameColor
{
  return self->_frameColor;
}

- (void)setFrameColor:(id)a3
{
}

- (double)frameWidth
{
  return self->_frameWidth;
}

- (void)setFrameWidth:(double)a3
{
  self->_frameWidth = a3;
}

- (UIColor)buyStateTextColor
{
  return self->_buyStateTextColor;
}

- (void)setBuyStateTextColor:(id)a3
{
}

- (UIColor)buyStateBackgroundFillColor
{
  return self->_buyStateBackgroundFillColor;
}

- (void)setBuyStateBackgroundFillColor:(id)a3
{
}

- (UIColor)buyStateFrameColor
{
  return self->_buyStateFrameColor;
}

- (void)setBuyStateFrameColor:(id)a3
{
}

- (NSString)buyDefaultTitle
{
  return self->_buyDefaultTitle;
}

- (void)setBuyDefaultTitle:(id)a3
{
}

- (NSString)canPreorderDefaultTitle
{
  return self->_canPreorderDefaultTitle;
}

- (void)setCanPreorderDefaultTitle:(id)a3
{
}

- (NSString)preorderedDefaultTitle
{
  return self->_preorderedDefaultTitle;
}

- (void)setPreorderedDefaultTitle:(id)a3
{
}

- (NSString)readDefaultTitle
{
  return self->_readDefaultTitle;
}

- (void)setReadDefaultTitle:(id)a3
{
}

- (NSString)listenDefaultTitle
{
  return self->_listenDefaultTitle;
}

- (void)setListenDefaultTitle:(id)a3
{
}

- (BOOL)isSingleState
{
  return self->_isSingleState;
}

- (void)setIsSingleState:(BOOL)a3
{
  self->_isSingleState = a3;
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (void)setNormalBackgroundColor:(id)a3
{
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
}

- (UITouch)lastTouch
{
  return self->_lastTouch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_listenDefaultTitle, 0);
  objc_storeStrong((id *)&self->_readDefaultTitle, 0);
  objc_storeStrong((id *)&self->_preorderedDefaultTitle, 0);
  objc_storeStrong((id *)&self->_canPreorderDefaultTitle, 0);
  objc_storeStrong((id *)&self->_buyDefaultTitle, 0);
  objc_storeStrong((id *)&self->_buyStateFrameColor, 0);
  objc_storeStrong((id *)&self->_buyStateBackgroundFillColor, 0);
  objc_storeStrong((id *)&self->_buyStateTextColor, 0);
  objc_storeStrong((id *)&self->_frameColor, 0);
  objc_storeStrong((id *)&self->_backgroundFillHighlightColor, 0);
  objc_storeStrong((id *)&self->_textHilightColor, 0);
  objc_storeStrong((id *)&self->_disabledBackgroundFillColor, 0);
  objc_storeStrong((id *)&self->_backgroundFillColor, 0);
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_priceString, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_productProfile, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end