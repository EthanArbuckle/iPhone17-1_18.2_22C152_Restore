@interface SUUIStyledButton
+ (BOOL)usesItemOfferAppearanceForButtonType:(int64_t)a3 itemState:(id)a4;
+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4;
+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4 borderStyle:(id)a5;
+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4 borderStyle:(id)a5 interiorPadding:(double)a6;
+ (int64_t)buttonTypeForElement:(id)a3;
- (BOOL)_usesTintColor;
- (BOOL)isUsingItemOfferAppearance;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)setValuesUsingBuyButtonDescriptor:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6;
- (BOOL)useBigHitTarget;
- (BOOL)usesTintColor;
- (CGRect)hitRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIAttributedStringLayout)titleLayout;
- (SUUIButtonBorderStyle)borderStyle;
- (SUUIImageView)imageView;
- (SUUIItemOfferButtonDelegate)itemOfferDelegate;
- (SUUIStyledButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)bigHitInsets;
- (UIEdgeInsets)buttonPadding;
- (double)baselineOffset;
- (double)firstBaselineOffset;
- (double)imageTextPaddingInterior;
- (double)imageYAdjustment;
- (id)_borderColor;
- (id)_borderFillColor;
- (id)_textBackgroundColor;
- (id)_textColor;
- (int64_t)buttonType;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_itemOfferButtonAction:(id)a3;
- (void)_reloadDisclosureImage;
- (void)_reloadImageView;
- (void)_reloadOverrideTextColor;
- (void)_showConfirmationAction:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBigHitInsets:(UIEdgeInsets)a3;
- (void)setBorderStyle:(id)a3;
- (void)setButtonPadding:(UIEdgeInsets)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageTextPaddingInterior:(double)a3;
- (void)setImageYAdjustment:(double)a3;
- (void)setItemOfferDelegate:(id)a3;
- (void)setTitleLayout:(id)a3;
- (void)setTitleLayout:(id)a3 forceRefresh:(BOOL)a4;
- (void)setUseBigHitTarget:(BOOL)a3;
- (void)setUsesTintColor:(BOOL)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SUUIStyledButton

- (SUUIStyledButton)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIStyledButton;
  result = -[SUUIStyledButton initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_imageTextPaddingInterior = 5.0;
  }
  return result;
}

- (void)dealloc
{
  [(SUUIItemOfferButton *)self->_itemOfferButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIStyledButton;
  [(SUUIStyledButton *)&v3 dealloc];
}

+ (int64_t)buttonTypeForElement:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 children];
  uint64_t v5 = [v4 count];

  if (v5
    && ([v3 children],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 firstObject],
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        uint64_t v8 = [v7 elementType],
        v7,
        v8 == 49))
  {
    int64_t v9 = 6;
  }
  else
  {
    int64_t v9 = 5;
  }

  return v9;
}

+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4
{
  objc_msgSend(a1, "sizeForTextSize:buttonType:borderStyle:interiorPadding:", a4, 0, a3.width, a3.height, -1.0);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4 borderStyle:(id)a5
{
  objc_msgSend(a1, "sizeForTextSize:buttonType:borderStyle:interiorPadding:", a4, a5, a3.width, a3.height, -1.0);
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)sizeForTextSize:(CGSize)a3 buttonType:(int64_t)a4 borderStyle:(id)a5 interiorPadding:(double)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  v11 = v10;
  switch(a4)
  {
    case 1:
      if (height < 26.0) {
        double height = 26.0;
      }
      double width = width + 0.0;
      goto LABEL_18;
    case 2:
      double v12 = 9.0;
      goto LABEL_9;
    case 3:
    case 4:
      double v12 = 7.0;
LABEL_9:
      double width = width + v12;
      goto LABEL_11;
    case 5:
    case 6:
      double v13 = width + 5.0;
      if (a6 >= 0.0) {
        double width = v13 + 5.0;
      }
      else {
        double width = v13 + a6;
      }
      goto LABEL_11;
    default:
LABEL_11:
      if (a4 != 1 && v10)
      {
        [v10 borderWidth];
        *(float *)&double v14 = v14 + v14;
        double v15 = floorf(*(float *)&v14);
        [v11 contentInset];
        double v18 = height + v17 + v16 + v15;
        double width = width + v19 + v20 + v15;
        double v21 = 44.0;
        if (v18 >= 44.0) {
          double v21 = v18;
        }
        if (a4 == 7) {
          double height = v18;
        }
        else {
          double height = v21;
        }
      }
LABEL_18:

      double v22 = width;
      double v23 = height;
      result.double height = v23;
      result.double width = v22;
      return result;
  }
}

+ (BOOL)usesItemOfferAppearanceForButtonType:(int64_t)a3 itemState:(id)a4
{
  return a3 == 1 && (objc_msgSend(a4, "state", v4, v5) & 0x47) != 0;
}

- (double)baselineOffset
{
  [(SUUIAttributedStringView *)self->_attributedStringView baselineOffset];
  return result;
}

- (double)firstBaselineOffset
{
  [(SUUIAttributedStringView *)self->_attributedStringView firstBaselineOffset];
  return result;
}

- (BOOL)isUsingItemOfferAppearance
{
  itemOfferButton = self->_itemOfferButton;
  if (itemOfferButton) {
    LOBYTE(itemOfferButton) = [(SUUIItemOfferButton *)itemOfferButton isHidden] ^ 1;
  }
  return (char)itemOfferButton;
}

- (void)setBorderStyle:(id)a3
{
  if (self->_borderStyle != a3)
  {
    uint64_t v4 = (SUUIButtonBorderStyle *)[a3 copy];
    borderStyle = self->_borderStyle;
    self->_borderStyle = v4;

    borderView = self->_borderView;
    if (self->_borderStyle)
    {
      if (!borderView)
      {
        v7 = objc_alloc_init(SUUIShapeView);
        uint64_t v8 = self->_borderView;
        self->_borderView = v7;

        int64_t v9 = self->_borderView;
        id v10 = [(SUUIStyledButton *)self backgroundColor];
        [(SUUIShapeView *)v9 setBackgroundColor:v10];

        [(SUUIShapeView *)self->_borderView setUserInteractionEnabled:0];
        [(SUUIStyledButton *)self insertSubview:self->_borderView atIndex:0];
        borderView = self->_borderView;
      }
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = 1;
    }
    [(SUUIShapeView *)borderView setHidden:v11];
    attributedStringView = self->_attributedStringView;
    double v13 = [(SUUIStyledButton *)self _textBackgroundColor];
    [(SUUIAttributedStringView *)attributedStringView setBackgroundColor:v13];

    [(SUUIStyledButton *)self setNeedsLayout];
  }
}

- (void)setButtonType:(int64_t)a3
{
  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    if ((unint64_t)(a3 - 5) > 1)
    {
      imageView = self->_imageView;
      if (imageView)
      {
        [(SUUIImageView *)imageView removeFromSuperview];
        uint64_t v5 = self->_imageView;
        self->_imageView = 0;
      }
    }
    else
    {
      [(SUUIStyledButton *)self _reloadImageView];
    }
    [(SUUIStyledButton *)self _reloadDisclosureImage];
    [(SUUIStyledButton *)self setNeedsLayout];
  }
}

- (void)setTitleLayout:(id)a3
{
}

- (void)setTitleLayout:(id)a3 forceRefresh:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  id v6 = [(SUUIStyledButton *)self titleLayout];

  id v8 = v14;
  if (v6 != v14 || v4)
  {
    attributedStringView = self->_attributedStringView;
    if (!attributedStringView)
    {
      id v10 = objc_alloc_init(SUUIAttributedStringView);
      uint64_t v11 = self->_attributedStringView;
      self->_attributedStringView = v10;

      double v12 = self->_attributedStringView;
      double v13 = [(SUUIStyledButton *)self _textBackgroundColor];
      [(SUUIAttributedStringView *)v12 setBackgroundColor:v13];

      [(SUUIAttributedStringView *)self->_attributedStringView setUserInteractionEnabled:0];
      [(SUUIStyledButton *)self addSubview:self->_attributedStringView];
      attributedStringView = self->_attributedStringView;
    }
    [(SUUIAttributedStringView *)attributedStringView setLayout:v14];
    [(SUUIStyledButton *)self _reloadOverrideTextColor];
    uint64_t v7 = [(SUUIStyledButton *)self _reloadDisclosureImage];
    id v8 = v14;
  }
  MEMORY[0x270F9A758](v7, v8);
}

- (void)setUsesTintColor:(BOOL)a3
{
  if (self->_usesTintColor != a3)
  {
    self->_usesTintColor = a3;
    [(SUUIStyledButton *)self _reloadOverrideTextColor];
  }
}

- (SUUIAttributedStringLayout)titleLayout
{
  return [(SUUIAttributedStringView *)self->_attributedStringView layout];
}

- (void)setItemOfferDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemOfferDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_itemOfferDelegate, obj);
    [(SUUIItemOfferButton *)self->_itemOfferButton setItemOfferDelegate:obj];
  }
}

- (BOOL)setValuesUsingBuyButtonDescriptor:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [(id)objc_opt_class() usesItemOfferAppearanceForButtonType:self->_buttonType itemState:v11];
  if (v13)
  {
    p_itemOfferButton = (id *)&self->_itemOfferButton;
    itemOfferButton = self->_itemOfferButton;
    if (itemOfferButton)
    {
      if (![(SUUIItemOfferButton *)itemOfferButton setValuesUsingBuyButtonDescriptor:v10 itemState:v11 clientContext:v12 animated:v6])
      {
        BOOL v16 = 0;
LABEL_8:
        [(SUUIAttributedStringView *)self->_attributedStringView setHidden:1];
        goto LABEL_9;
      }
    }
    else
    {
      double v17 = [SUUIItemOfferButton alloc];
      [(SUUIStyledButton *)self bounds];
      uint64_t v18 = -[SUUIItemOfferButton initWithFrame:](v17, "initWithFrame:");
      id v19 = *p_itemOfferButton;
      id *p_itemOfferButton = (id)v18;

      [*p_itemOfferButton addTarget:self action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
      [*p_itemOfferButton addTarget:self action:sel__itemOfferButtonAction_ forControlEvents:0x20000];
      [*p_itemOfferButton addTarget:self action:sel__showConfirmationAction_ forControlEvents:0x40000];
      id v20 = *p_itemOfferButton;
      double v21 = [(SUUIStyledButton *)self backgroundColor];
      [v20 setBackgroundColor:v21];

      id v22 = *p_itemOfferButton;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_itemOfferDelegate);
      [v22 setItemOfferDelegate:WeakRetained];

      [*p_itemOfferButton setValuesUsingBuyButtonDescriptor:v10 itemState:v11 clientContext:v12 animated:v6];
      [(SUUIStyledButton *)self addSubview:*p_itemOfferButton];
    }
    [(SUUIStyledButton *)self setNeedsLayout];
    BOOL v16 = 1;
    goto LABEL_8;
  }
  BOOL v16 = [(SUUIStyledButton *)self isUsingItemOfferAppearance];
  [(SUUIAttributedStringView *)self->_attributedStringView setHidden:0];
  p_itemOfferButton = (id *)&self->_itemOfferButton;
LABEL_9:
  [*p_itemOfferButton setHidden:v13 ^ 1u];

  return v16;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUUIStyledButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIStyledButton;
    [(SUUIStyledButton *)&v5 setEnabled:v3];
    [(SUUIStyledButton *)self _reloadOverrideTextColor];
    [(SUUIStyledButton *)self setNeedsLayout];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_didInitialHighlightForTouch = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUIStyledButton;
  [(SUUIStyledButton *)&v4 touchesBegan:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SUUIStyledButton *)self isTouchInside])
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton || [(SUUIItemOfferButton *)itemOfferButton isHidden]) {
      [(SUUIStyledButton *)self sendActionsForControlEvents:0x20000];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIStyledButton;
  [(SUUIStyledButton *)&v9 touchesEnded:v6 withEvent:v7];
}

- (CGRect)hitRect
{
  if (self->_useBigHitTarget)
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUIStyledButton;
    [(SUUIStyledButton *)&v14 hitRect];
    double top = self->_bigHitInsets.top;
    double left = self->_bigHitInsets.left;
    double v6 = v5 + left;
    double v8 = v7 + top;
    double v10 = v9 - (left + self->_bigHitInsets.right);
    double v12 = v11 - (top + self->_bigHitInsets.bottom);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIStyledButton;
    [(SUUIStyledButton *)&v13 hitRect];
  }
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  [(SUUIStyledButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  borderView = self->_borderView;
  if (borderView && ([(SUUIShapeView *)borderView isHidden] & 1) == 0)
  {
    double v12 = [(SUUIShapeView *)self->_borderView layer];
    id v13 = [(SUUIStyledButton *)self _borderFillColor];
    objc_msgSend(v12, "setFillColor:", objc_msgSend(v13, "CGColor"));

    [(SUUIButtonBorderStyle *)self->_borderStyle borderWidth];
    objc_msgSend(v12, "setLineWidth:");
    -[SUUIButtonBorderStyle bezierPathWithBounds:](self->_borderStyle, "bezierPathWithBounds:", v4, v6, v8, v10);
    id v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPath:", objc_msgSend(v14, "CGPath"));

    id v15 = [(SUUIStyledButton *)self _borderColor];
    objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

    -[SUUIShapeView setFrame:](self->_borderView, "setFrame:", v4, v6, v8, v10);
    [(SUUIButtonBorderStyle *)self->_borderStyle contentInset];
    double v4 = v4 + v16;
    double v6 = v6 + v17;
    double v8 = v8 - (v16 + v18);
    double v10 = v10 - (v17 + v19);
  }
  switch(self->_buttonType)
  {
    case 0:
    case 7:
      -[SUUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      *(float *)&double v35 = v4 + (v8 - v35) * 0.5;
      double v39 = floorf(*(float *)&v35);
      *(float *)&double v37 = v6 + (v10 - v37) * 0.5;
      double v40 = floorf(*(float *)&v37);
      attributedStringView = self->_attributedStringView;
      CGFloat v42 = v4;
      CGFloat v43 = v6;
      goto LABEL_28;
    case 1:
      -[SUUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      CGFloat v71 = v70;
      CGFloat v73 = v72;
      *(float *)&double v70 = (v8 - v70) * 0.5;
      *(float *)&double v72 = (v10 - v72) * 0.5;
      [(SUUIAttributedStringView *)self->_attributedStringView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(floorf(*(float *)&v70), floorf(*(float *)&v72), v71, v73, v4, v6, v8, v10)];
      -[SUUIItemOfferButton setFrame:](self->_itemOfferButton, "setFrame:", v4, v6, v8, v10);
      break;
    case 2:
    case 3:
    case 4:
      CGFloat v94 = v6;
      uint64_t v20 = MEMORY[0x263F001A8];
      double v21 = *MEMORY[0x263F001A8];
      -[SUUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      double v23 = v22;
      CGFloat v25 = v24;
      *(float *)&double v22 = (v10 - v24) * 0.5;
      double v26 = floorf(*(float *)&v22);
      -[UIImageView sizeThatFits:](self->_disclosureImageView, "sizeThatFits:", v8, v10);
      double v28 = v27;
      double v30 = v29;
      CGFloat v96 = v4;
      double v90 = v26;
      CGFloat rect = v27;
      CGFloat v89 = v25;
      if (self->_buttonType == 3)
      {
        uint64_t v31 = *(void *)(v20 + 8);
        double v32 = v21;
        double v33 = v30;
        double v87 = v21;
        double v21 = CGRectGetMaxX(*(CGRect *)(&v28 - 2)) + 2.0;
        if (v23 >= v8 - v21) {
          double v34 = v8 - v21;
        }
        else {
          double v34 = v23;
        }
      }
      else
      {
        if (v23 >= v8 - v27 + -2.0) {
          double v34 = v8 - v27 + -2.0;
        }
        else {
          double v34 = v23;
        }
        v100.origin.x = v21;
        v100.origin.y = v26;
        v100.size.double width = v34;
        v100.size.double height = v25;
        double v87 = CGRectGetMaxX(v100) + 2.0;
      }
      CGFloat v65 = v30;
      v66 = [(SUUIAttributedStringView *)self->_attributedStringView layout];
      if ([v66 numberOfLines] == 1 && self->_buttonType != 2)
      {
        v80 = [(SUUIAttributedStringView *)self->_attributedStringView layout];
        [v80 baselineOffset];
        *(float *)&double v81 = v81 + v90 - v30;
        float v68 = ceilf(*(float *)&v81);

        CGFloat v69 = v90;
        CGFloat v65 = v30;
      }
      else
      {
        float v67 = (v10 - v30) * 0.5;
        float v68 = floorf(v67);
        CGFloat v69 = v90;
      }
      [(SUUIAttributedStringView *)self->_attributedStringView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v21, v69, v34, v89, v96, v94, v8, v10)];
      [(UIImageView *)self->_disclosureImageView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v88, v68, rect, v65, v96, v94, v8, v10)];
      [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:1];

      break;
    case 5:
    case 6:
      -[SUUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:", v8, v10);
      double v45 = v44;
      CGFloat v47 = v46;
      *(float *)&double v44 = (v10 - v46) * 0.5;
      double v48 = floorf(*(float *)&v44);
      -[SUUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v8, v10);
      double v50 = v49;
      double v52 = v51;
      CGFloat v95 = v6;
      CGFloat v97 = v4;
      CGFloat recta = v49;
      if (self->_buttonType == 6)
      {
        double v91 = v48;
        CGFloat v53 = *MEMORY[0x263F001A8];
        CGFloat v54 = *(double *)(MEMORY[0x263F001A8] + 8);
        uint64_t v55 = *MEMORY[0x263F001A8];
        CGFloat v56 = v54;
        double v57 = v52;
        double imageTextPaddingInterior = 0.0;
        if (CGRectGetMaxX(*(CGRect *)(&v50 - 2)) > 0.0) {
          double imageTextPaddingInterior = self->_imageTextPaddingInterior;
        }
        v99.origin.x = v53;
        v99.origin.y = v54;
        v99.size.double width = recta;
        v99.size.double height = v52;
        double v59 = imageTextPaddingInterior + CGRectGetMaxX(v99);
        [(SUUIStyledButton *)self buttonPadding];
        double v61 = v59 + v60;
        if (v45 >= v8 - (v59 + v60)) {
          double v45 = v8 - (v59 + v60);
        }
        [(SUUIStyledButton *)self buttonPadding];
        double v63 = v62;
        CGFloat v64 = v91;
      }
      else
      {
        double v74 = self->_imageTextPaddingInterior;
        if (v45 >= v8 - v49 - v74) {
          double v45 = v8 - v49 - v74;
        }
        [(SUUIStyledButton *)self buttonPadding];
        double v61 = v75;
        v101.origin.x = v75;
        v101.origin.y = v48;
        v101.size.double width = v45;
        v101.size.double height = v47;
        CGFloat MaxX = CGRectGetMaxX(v101);
        CGFloat v64 = v48;
        double v63 = MaxX + self->_imageTextPaddingInterior;
      }
      float v77 = (v10 - v52) * 0.5;
      double v78 = self->_imageYAdjustment + floorf(v77);
      v79 = self->_attributedStringView;
      v102.origin.x = SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v61, v64, v45, v47, v97, v95, v8, v10);
      CGRect v103 = CGRectIntegral(v102);
      -[SUUIAttributedStringView setFrame:](v79, "setFrame:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
      attributedStringView = self->_imageView;
      double v39 = v63;
      double v40 = v78;
      CGFloat v36 = recta;
      CGFloat v38 = v52;
      CGFloat v42 = v97;
      CGFloat v43 = v95;
LABEL_28:
      objc_msgSend(attributedStringView, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v39, v40, v36, v38, v42, v43, v8, v10));
      [(SUUIItemOfferButton *)self->_itemOfferButton setHidden:1];
      break;
    default:
      break;
  }
  int v82 = [(SUUIStyledButton *)self isEnabled];
  double v83 = 1.0;
  if (v82) {
    double v84 = 1.0;
  }
  else {
    double v84 = 0.25;
  }
  [(SUUIShapeView *)self->_borderView setAlpha:v84];
  if ((v82 & 1) == 0)
  {
    v85 = [(SUUIButtonBorderStyle *)self->_borderStyle fillColor];
    if (v85) {
      double v83 = 1.0;
    }
    else {
      double v83 = 0.25;
    }
  }
  [(SUUIAttributedStringView *)self->_attributedStringView setAlpha:v83];
  disclosureImageView = self->_disclosureImageView;
  [(UIImageView *)disclosureImageView setAlpha:v83];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_useBigHitTarget)
  {
    [(SUUIStyledButton *)self hitRect];
    CGFloat v10 = x;
    CGFloat v11 = y;
    return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIStyledButton;
    return -[SUUIStyledButton pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  }
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIStyledButton;
  id v4 = a3;
  [(SUUIStyledButton *)&v7 setBackgroundColor:v4];
  attributedStringView = self->_attributedStringView;
  uint64_t v6 = [(SUUIStyledButton *)self _textBackgroundColor];
  [(SUUIAttributedStringView *)attributedStringView setBackgroundColor:v6];

  [(SUUIShapeView *)self->_borderView setBackgroundColor:v4];
  [(UIImageView *)self->_disclosureImageView setBackgroundColor:v4];
  [(SUUIItemOfferButton *)self->_itemOfferButton setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUUIStyledButton *)self isHighlighted] != a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)SUUIStyledButton;
    [(SUUIStyledButton *)&v18 setHighlighted:v3];
    if (self->_borderView
      && ([(SUUIButtonBorderStyle *)self->_borderStyle fillColor],
          double v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v5))
    {
      objc_super v7 = [(SUUIShapeView *)self->_borderView layer];
      double v8 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
      [v7 setCompositingFilter:v8];

      [v7 removeAnimationForKey:@"borderAnimation"];
      double v9 = [MEMORY[0x263F825C8] clearColor];
      [(SUUIStyledButton *)self setBackgroundColor:v9];

      [(SUUIStyledButton *)self bringSubviewToFront:self->_borderView];
      double v10 = 0.47;
      if (v3 && !self->_didInitialHighlightForTouch)
      {
        self->_didInitialHighlightForTouch = 1;
        double v10 = 0.01;
      }
      CGFloat v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"fillColor"];
      [v11 setDelegate:self];
      [v11 setDuration:v10];
      [v11 setFillMode:*MEMORY[0x263F15AB0]];
      [v11 setRemovedOnCompletion:0];
      UIAnimationDragCoefficient();
      *(float *)&double v13 = 1.0 / v12;
      [v11 setSpeed:v13];
      if (v3)
      {
        id v14 = [(SUUIShapeView *)self->_borderView backgroundColor];
        objc_msgSend(v11, "setFromValue:", objc_msgSend(v14, "CGColor"));

        objc_msgSend(v11, "setToValue:", objc_msgSend(v7, "strokeColor"));
      }
      else
      {
        objc_msgSend(v11, "setFromValue:", objc_msgSend(v7, "strokeColor"));
        id v16 = [(SUUIShapeView *)self->_borderView backgroundColor];
        objc_msgSend(v11, "setToValue:", objc_msgSend(v16, "CGColor"));
      }
      [v7 addAnimation:v11 forKey:@"borderAnimation"];
    }
    else
    {
      double v6 = 1.0;
      if (v3 && (double v6 = 0.2, !self->_didInitialHighlightForTouch))
      {
        borderView = self->_borderView;
        if (borderView
          || ([(SUUIAttributedStringView *)self->_attributedStringView setAlpha:0.2],
              [(UIImageView *)self->_disclosureImageView setAlpha:0.2],
              (borderView = self->_imageView) != 0))
        {
          [borderView setAlpha:0.2];
        }
        self->_didInitialHighlightForTouch = 1;
      }
      else
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __35__SUUIStyledButton_setHighlighted___block_invoke;
        v17[3] = &unk_2654019B0;
        v17[4] = self;
        *(double *)&v17[5] = v6;
        [MEMORY[0x263F82E00] animateWithDuration:327684 delay:v17 options:0 animations:0.47 completion:0.0];
      }
    }
  }
}

void *__35__SUUIStyledButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGRect result = *(void **)(v2 + 504);
  if (result)
  {
    id v4 = (double *)(a1 + 40);
  }
  else
  {
    double v5 = *(double *)(a1 + 40);
    id v4 = (double *)(a1 + 40);
    [*(id *)(v2 + 456) setAlpha:v5];
    [*(id *)(*((void *)v4 - 1) + 528) setAlpha:*v4];
    CGRect result = *(void **)(*((void *)v4 - 1) + 544);
    if (!result) {
      return result;
    }
  }
  double v6 = *v4;
  return (void *)[result setAlpha:v6];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[SUUIAttributedStringView sizeThatFits:](self->_attributedStringView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  double v10 = [(UIImageView *)self->_disclosureImageView image];

  if (v10)
  {
    -[UIImageView sizeThatFits:](self->_disclosureImageView, "sizeThatFits:", width, height);
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  imageView = self->_imageView;
  if (imageView)
  {
    id v16 = [(SUUIImageView *)imageView image];

    if (v16)
    {
      -[SUUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height);
      double v12 = v17;
      double v14 = v18;
    }
  }
  int64_t buttonType = self->_buttonType;
  if ((unint64_t)(buttonType - 2) < 3)
  {
    if (v9 < v14) {
      double v9 = v14;
    }
    double v22 = v12 + 2.0;
  }
  else if ((unint64_t)(buttonType - 5) >= 2)
  {
    if (buttonType != 1) {
      goto LABEL_16;
    }
    if ([(SUUIStyledButton *)self isUsingItemOfferAppearance])
    {
      -[SUUIItemOfferButton sizeThatFits:](self->_itemOfferButton, "sizeThatFits:", width, height);
      double v7 = v34;
      double v9 = v35;
      goto LABEL_16;
    }
    if (v9 < 26.0) {
      double v9 = 26.0;
    }
    double v22 = 0.0;
  }
  else
  {
    [(SUUIStyledButton *)self buttonPadding];
    if (v9 < v14) {
      double v9 = v14;
    }
    double v22 = v20 + v21 + v12 + self->_imageTextPaddingInterior;
  }
  double v7 = v7 + v22;
LABEL_16:
  borderStyle = self->_borderStyle;
  if (borderStyle && self->_buttonType != 1)
  {
    [(SUUIButtonBorderStyle *)borderStyle borderWidth];
    *(float *)&double v24 = v24 + v24;
    double v25 = floorf(*(float *)&v24);
    [(SUUIButtonBorderStyle *)self->_borderStyle contentInset];
    double v28 = v9 + v27 + v26 + v25;
    double v7 = v7 + v29 + v30 + v25;
    double v31 = 44.0;
    if (v28 >= 44.0) {
      double v31 = v28;
    }
    if (self->_buttonType == 7) {
      double v9 = v28;
    }
    else {
      double v9 = v31;
    }
  }
  double v32 = v7;
  double v33 = v9;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (void)tintColorDidChange
{
  if ([(SUUIStyledButton *)self _usesTintColor])
  {
    [(SUUIStyledButton *)self _reloadOverrideTextColor];
    [(SUUIStyledButton *)self _reloadDisclosureImage];
  }
  BOOL v3 = [(SUUIShapeView *)self->_borderView layer];
  id v4 = [(SUUIStyledButton *)self _borderFillColor];
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [(SUUIStyledButton *)self _borderColor];
  objc_msgSend(v3, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

  v6.receiver = self;
  v6.super_class = (Class)SUUIStyledButton;
  [(SUUIStyledButton *)&v6 tintColorDidChange];
}

- (void)_cancelConfirmationAction:(id)a3
{
}

- (void)_itemOfferButtonAction:(id)a3
{
}

- (void)_showConfirmationAction:(id)a3
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v8 = [(SUUIShapeView *)self->_borderView layer];
  if ([(SUUIStyledButton *)self isHighlighted])
  {
    id v5 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
    [v8 setCompositingFilter:v5];

    objc_super v6 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIStyledButton *)self setBackgroundColor:v6];

    [(SUUIStyledButton *)self bringSubviewToFront:self->_borderView];
  }
  else
  {
    [v8 setCompositingFilter:0];
    double v7 = [(SUUIShapeView *)self->_borderView backgroundColor];
    [(SUUIStyledButton *)self setBackgroundColor:v7];

    [(SUUIStyledButton *)self sendSubviewToBack:self->_borderView];
  }
}

- (id)_borderColor
{
  BOOL v3 = [(SUUIButtonBorderStyle *)self->_borderStyle borderColor];
  id v4 = v3;
  if (v3)
  {
    if ([v3 colorType] == 1) {
      [(SUUIStyledButton *)self tintColor];
    }
    else {
    id v5 = [v4 color];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_borderFillColor
{
  BOOL v3 = [(SUUIButtonBorderStyle *)self->_borderStyle fillColor];
  id v4 = v3;
  if (v3)
  {
    if ([v3 colorType] == 1) {
      [(SUUIStyledButton *)self tintColor];
    }
    else {
    uint64_t v5 = [v4 color];
    }
  }
  else
  {
    uint64_t v5 = [(SUUIStyledButton *)self backgroundColor];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (void)_reloadImageView
{
  if (!self->_imageView)
  {
    BOOL v3 = [SUUIImageView alloc];
    [(SUUIStyledButton *)self bounds];
    id v4 = -[SUUIImageView initWithFrame:](v3, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v4;

    [(SUUIImageView *)self->_imageView setAutoresizingMask:18];
    [(SUUIImageView *)self->_imageView setUserInteractionEnabled:0];
    objc_super v6 = self->_imageView;
    [(SUUIStyledButton *)self addSubview:v6];
  }
}

- (void)_reloadDisclosureImage
{
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v22.c = v3;
  *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  int64_t buttonType = self->_buttonType;
  switch(buttonType)
  {
    case 4:
      uint64_t v5 = (void *)MEMORY[0x263F827E8];
      objc_super v6 = SUUIBundle();
      double v7 = @"ChevronSeeAll";
      goto LABEL_6;
    case 3:
      double v9 = (void *)MEMORY[0x263F827E8];
      double v10 = SUUIBundle();
      id v8 = [v9 imageNamed:@"ChevronSeeAll" inBundle:v10];

      CGAffineTransformMakeScale(&v22, -1.0, 1.0);
      break;
    case 2:
      uint64_t v5 = (void *)MEMORY[0x263F827E8];
      objc_super v6 = SUUIBundle();
      double v7 = @"SearchFilterDisclosureChevron";
LABEL_6:
      id v8 = [v5 imageNamed:v7 inBundle:v6];

      break;
    default:
      id v8 = 0;
      break;
  }
  double v11 = [v8 imageFlippedForRightToLeftLayoutDirection];

  disclosureImageView = self->_disclosureImageView;
  if (v11)
  {
    if (!disclosureImageView)
    {
      double v13 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      double v14 = self->_disclosureImageView;
      self->_disclosureImageView = v13;

      id v15 = self->_disclosureImageView;
      id v16 = [(SUUIStyledButton *)self backgroundColor];
      [(UIImageView *)v15 setBackgroundColor:v16];

      double v17 = self->_disclosureImageView;
      CGAffineTransform v21 = v22;
      [(UIImageView *)v17 setTransform:&v21];
      [(SUUIStyledButton *)self addSubview:self->_disclosureImageView];
    }
  }
  else
  {
    [(UIImageView *)disclosureImageView setHidden:1];
  }
  uint64_t v18 = [(SUUIStyledButton *)self _textColor];
  double v19 = (void *)v18;
  if (v11 && v18)
  {
    [(UIImageView *)self->_disclosureImageView setTintColor:v18];
    uint64_t v20 = [v11 imageWithRenderingMode:2];

    double v11 = (void *)v20;
  }
  [(UIImageView *)self->_disclosureImageView setImage:v11];
}

- (void)_reloadOverrideTextColor
{
  if ([(SUUIStyledButton *)self isEnabled]
    && [(SUUIStyledButton *)self _usesTintColor])
  {
    attributedStringView = self->_attributedStringView;
    id v5 = [(SUUIStyledButton *)self tintColor];
    [(SUUIAttributedStringView *)attributedStringView setTextColor:v5];
  }
  else
  {
    id v4 = self->_attributedStringView;
    [(SUUIAttributedStringView *)v4 setTextColor:0];
  }
}

- (id)_textBackgroundColor
{
  if (self->_borderStyle) {
    [MEMORY[0x263F825C8] clearColor];
  }
  else {
  uint64_t v2 = [(SUUIStyledButton *)self backgroundColor];
  }
  return v2;
}

- (id)_textColor
{
  if ([(SUUIStyledButton *)self isEnabled]
    && [(SUUIStyledButton *)self _usesTintColor])
  {
    long long v3 = [(SUUIStyledButton *)self tintColor];
  }
  else
  {
    id v4 = [(SUUIAttributedStringView *)self->_attributedStringView layout];
    id v5 = [v4 attributedString];

    if ([v5 length])
    {
      long long v3 = [v5 attribute:*MEMORY[0x263F81500] atIndex:0 effectiveRange:0];
    }
    else
    {
      long long v3 = 0;
    }
  }
  return v3;
}

- (BOOL)_usesTintColor
{
  if (self->_usesTintColor) {
    return 1;
  }
  long long v3 = [(SUUIAttributedStringView *)self->_attributedStringView layout];
  id v4 = [v3 attributedString];

  if ([v4 length])
  {
    id v5 = [v4 attribute:*MEMORY[0x263F81500] atIndex:0 effectiveRange:0];
    BOOL v2 = v5 == 0;
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

- (UIEdgeInsets)bigHitInsets
{
  double top = self->_bigHitInsets.top;
  double left = self->_bigHitInsets.left;
  double bottom = self->_bigHitInsets.bottom;
  double right = self->_bigHitInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBigHitInsets:(UIEdgeInsets)a3
{
  self->_bigHitInsets = a3;
}

- (SUUIButtonBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (double)imageTextPaddingInterior
{
  return self->_imageTextPaddingInterior;
}

- (void)setImageTextPaddingInterior:(double)a3
{
  self->_double imageTextPaddingInterior = a3;
}

- (SUUIImageView)imageView
{
  return self->_imageView;
}

- (double)imageYAdjustment
{
  return self->_imageYAdjustment;
}

- (void)setImageYAdjustment:(double)a3
{
  self->_imageYAdjustment = a3;
}

- (SUUIItemOfferButtonDelegate)itemOfferDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemOfferDelegate);
  return (SUUIItemOfferButtonDelegate *)WeakRetained;
}

- (BOOL)useBigHitTarget
{
  return self->_useBigHitTarget;
}

- (void)setUseBigHitTarget:(BOOL)a3
{
  self->_useBigHitTarget = a3;
}

- (BOOL)usesTintColor
{
  return self->_usesTintColor;
}

- (UIEdgeInsets)buttonPadding
{
  double top = self->_buttonPadding.top;
  double left = self->_buttonPadding.left;
  double bottom = self->_buttonPadding.bottom;
  double right = self->_buttonPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setButtonPadding:(UIEdgeInsets)a3
{
  self->_buttonPadding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemOfferDelegate);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_disclosureImageView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_attributedStringView, 0);
}

@end