@interface PKNumberPadInputView
+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3;
- (BOOL)showsDecimalPointButton;
- (PKNumberPadInputView)initWithFrame:(CGRect)a3 delegate:(id)a4 configurator:(id)a5;
- (UIColor)numberPadColor;
- (UIColor)textColor;
- (UIView)bottomView;
- (id)_createBorderedButtonForButtonValue:(unint64_t)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5;
- (void)_numericKeyPressed:(unint64_t)a3;
- (void)_reloadSubviews;
- (void)_updateButtons;
- (void)layoutSubviews;
- (void)performBatchUpdates:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setNumberPadColor:(id)a3;
- (void)setShowsDecimalPointButton:(BOOL)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKNumberPadInputView

+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  [MEMORY[0x1E4FB18E0] defaultSizeForInterfaceOrientation:a3];
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKNumberPadInputView)initWithFrame:(CGRect)a3 delegate:(id)a4 configurator:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKNumberPadInputView;
  v13 = -[UIInputView initWithFrame:inputViewStyle:](&v24, sel_initWithFrame_inputViewStyle_, 1, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v11);
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v16 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)v15 setLocale:v16];

    formatter = v14->_formatter;
    v14->_formatter = v15;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    buttons = v14->_buttons;
    v14->_buttons = v18;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__PKNumberPadInputView_initWithFrame_delegate_configurator___block_invoke;
    v21[3] = &unk_1E59D39A8;
    v22 = v14;
    id v23 = v12;
    [(PKNumberPadInputView *)v22 performBatchUpdates:v21];
  }
  return v14;
}

void __60__PKNumberPadInputView_initWithFrame_delegate_configurator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 625) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 664) = 0;
  id v5 = v3;
  [v3 setNumberPadColor:0];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    ++self->_batchedUpdateCount;
    id v6 = v4;
    (*((void (**)(id, PKNumberPadInputView *))v4 + 2))(v4, self);
    unsigned __int8 v5 = self->_batchedUpdateCount - 1;
    self->_batchedUpdateCount = v5;
    if (!v5)
    {
      if (self->_needsReload) {
        [(PKNumberPadInputView *)self _reloadSubviews];
      }
      if (self->_needsUpdate) {
        [(PKNumberPadInputView *)self _updateButtons];
      }
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKNumberPadInputView;
  [(PKNumberPadInputView *)&v12 layoutSubviews];
  [(PKNumberPadInputView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((PKHomeButtonIsAvailable() & 1) == 0)
  {
    [(PKNumberPadInputView *)self safeAreaInsets];
    double v10 = v10 - v11;
  }
  -[UIStackView setFrame:](self->_verticalStackView, "setFrame:", v4, v6, v8, v10);
}

- (void)setShowsDecimalPointButton:(BOOL)a3
{
  if (((!self->_showsDecimalPointButton ^ a3) & 1) == 0)
  {
    self->_showsDecimalPointButton = a3;
    [(PKNumberPadInputView *)self _reloadSubviews];
  }
}

- (void)setNumberPadColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    PKProvisioningBackgroundColor();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id obj = v4;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_numberPadColor, obj);
    [(PKNumberPadInputView *)self setBackgroundColor:self->_numberPadColor];
    [(PKNumberPadInputView *)self _updateButtons];
  }
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  id obj = v4;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, obj);
    [(PKNumberPadInputView *)self _updateButtons];
  }
}

- (void)setBottomView:(id)a3
{
  double v5 = (UIView *)a3;
  p_bottomView = &self->_bottomView;
  bottomView = self->_bottomView;
  double v8 = v5;
  if (bottomView != v5)
  {
    if (bottomView)
    {
      -[UIStackView removeArrangedSubview:](self->_verticalStackView, "removeArrangedSubview:");
      [(UIView *)*p_bottomView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_bottomView, a3);
    if (*p_bottomView) {
      -[UIStackView addArrangedSubview:](self->_verticalStackView, "addArrangedSubview:");
    }
  }
}

- (void)_numericKeyPressed:(unint64_t)a3
{
  if (a3 < 0xA || a3 == 11)
  {
    id v5 = PKNumberPadKeyButtonValueToString(self->_formatter, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained numberPadInputView:self requestReplaceSelectedTextFieldRangeWithText:v5];
  }
  else
  {
    if (a3 != 10) {
      return;
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 numberPadInputViewRequestDeleteText:self];
  }
}

- (void)_updateButtons
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_batchedUpdateCount)
  {
    self->_needsUpdate = 1;
  }
  else
  {
    double v3 = (void *)MEMORY[0x1A6224460]();
    self->_needsUpdate = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_buttons;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "setNeedsUpdateConfiguration", (void)v9);
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_reloadSubviews
{
  v36[4] = *MEMORY[0x1E4F143B8];
  if (self->_batchedUpdateCount)
  {
    self->_needsReload = 1;
  }
  else
  {
    context = (void *)MEMORY[0x1A6224460]();
    self->_needsReload = 0;
    self->_needsUpdate = 0;
    verticalStackView = self->_verticalStackView;
    if (verticalStackView)
    {
      [(UIStackView *)verticalStackView removeFromSuperview];
      id v4 = self->_verticalStackView;
      self->_verticalStackView = 0;
    }
    [(NSMutableArray *)self->_buttons removeAllObjects];
    uint64_t v5 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    uint64_t v6 = self->_verticalStackView;
    self->_verticalStackView = v5;

    [(UIStackView *)self->_verticalStackView setAxis:1];
    [(UIStackView *)self->_verticalStackView setDistribution:1];
    [(UIStackView *)self->_verticalStackView setAlignment:0];
    [(UIStackView *)self->_verticalStackView setSpacing:0.0];
    [(PKNumberPadInputView *)self addSubview:self->_verticalStackView];
    val = self;
    if (self->_showsDecimalPointButton) {
      uint64_t v7 = 11;
    }
    else {
      uint64_t v7 = 12;
    }
    v36[0] = &unk_1EF2B9FA8;
    v36[1] = &unk_1EF2B9FC0;
    v36[2] = &unk_1EF2B9FD8;
    double v8 = [NSNumber numberWithUnsignedInteger:v7];
    v35[0] = v8;
    v35[1] = &unk_1EF2B9120;
    v35[2] = &unk_1EF2B9138;
    long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    v36[3] = v9;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];

    objc_initWeak(&location, self);
    unint64_t v27 = [v25 count];
    if (v27)
    {
      uint64_t v10 = 0;
      do
      {
        uint64_t v26 = v10;
        v28 = objc_msgSend(v25, "objectAtIndexedSubscript:");
        id v11 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
        [v11 setAxis:0];
        [v11 setDistribution:1];
        [v11 setAlignment:0];
        [v11 setSemanticContentAttribute:3];
        [v11 setSpacing:0.0];
        uint64_t v12 = [v28 count];
        uint64_t v13 = v12;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = v12 - 1;
          do
          {
            v16 = [v28 objectAtIndexedSubscript:v14];
            unsigned __int8 IsAvailable = PKHomeButtonIsAvailable();
            uint64_t v18 = 5;
            if (v15 == v14) {
              uint64_t v18 = 1;
            }
            if ((IsAvailable & (v26 + 1 >= v27)) != 0) {
              uint64_t v19 = v18 | 2;
            }
            else {
              uint64_t v19 = v18;
            }
            v20 = (void *)[v16 unsignedIntegerValue];
            v21 = (void *)MEMORY[0x1E4FB13F0];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __39__PKNumberPadInputView__reloadSubviews__block_invoke;
            v32[3] = &unk_1E59D39D0;
            objc_copyWeak(v33, &location);
            v33[1] = v20;
            v22 = [v21 actionWithHandler:v32];
            id v23 = [(PKNumberPadInputView *)val _createBorderedButtonForButtonValue:v20 withBorder:v19 primaryAction:v22];

            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __39__PKNumberPadInputView__reloadSubviews__block_invoke_2;
            v30[3] = &unk_1E59D39F8;
            objc_copyWeak(v31, &location);
            v31[1] = v20;
            [v23 setConfigurationUpdateHandler:v30];
            [v11 addArrangedSubview:v23];
            [(NSMutableArray *)val->_buttons addObject:v23];
            objc_destroyWeak(v31);

            objc_destroyWeak(v33);
            ++v14;
          }
          while (v13 != v14);
        }
        [(UIStackView *)val->_verticalStackView addArrangedSubview:v11];

        uint64_t v10 = v26 + 1;
      }
      while (v26 + 1 != v27);
    }
    if (val->_bottomView) {
      -[UIStackView addArrangedSubview:](val->_verticalStackView, "addArrangedSubview:");
    }
    objc_destroyWeak(&location);
  }
}

void __39__PKNumberPadInputView__reloadSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _numericKeyPressed:*(void *)(a1 + 40)];
}

void __39__PKNumberPadInputView__reloadSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  double v3 = (void *)MEMORY[0x1A6224460]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v5 = [v12 isHighlighted];
    uint64_t v6 = [v12 configuration];
    if (*(void *)(a1 + 40) == 10)
    {
      if (v5) {
        UIKeyboardGetDeleteOnKeyImage();
      }
      else {
      uint64_t v7 = UIKeyboardGetDeleteKeyImage();
      }
      double v8 = [v7 imageWithRenderingMode:2];
      [v6 setImage:v8];
    }
    [v6 setBaseForegroundColor:WeakRetained[85]];
    long long v9 = [v6 background];
    uint64_t v10 = v9;
    if (v5)
    {
      id v11 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
      [v10 setBackgroundColor:v11];
    }
    else
    {
      [v9 setBackgroundColor:WeakRetained[84]];
    }
    [v12 setConfiguration:v6];
  }
}

- (id)_createBorderedButtonForButtonValue:(unint64_t)a3 withBorder:(unint64_t)a4 primaryAction:(id)a5
{
  id v8 = a5;
  long long v9 = +[PKBorderedButtonConfiguration plainButtonConfiguration];
  [v9 setBorder:a4];
  uint64_t v10 = [v9 background];
  [v10 setCornerRadius:0.0];
  [v9 setTitleAlignment:2];
  [v9 setTitleTextAttributesTransformer:&__block_literal_global_91];
  if (a3 != 10 && a3 != 12)
  {
    id v11 = PKNumberPadKeyButtonValueToString(self->_formatter, a3);
    [v9 setTitle:v11];
  }
  id v12 = +[PKBorderedButton borderedButtonWithConfiguration:v9 primaryAction:v8];
  uint64_t v13 = v12;
  if (a3 == 12) {
    [v12 setUserInteractionEnabled:0];
  }

  return v13;
}

id __85__PKNumberPadInputView__createBorderedButtonForButtonValue_withBorder_primaryAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  double v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:31.0];
  [v2 setObject:v3 forKey:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (BOOL)showsDecimalPointButton
{
  return self->_showsDecimalPointButton;
}

- (UIColor)numberPadColor
{
  return self->_numberPadColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_numberPadColor, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end