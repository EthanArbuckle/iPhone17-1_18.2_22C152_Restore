@interface SiriSharedUICompactServerUtteranceView
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)isMultiLine;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriSharedUICompactServerUtteranceView)initWithContentInsets:(UIEdgeInsets)a3 delegate:(id)a4;
- (SiriSharedUICompactServerUtteranceViewDelegate)delegate;
- (SiriSharedUIDeviceMotionEffectView)deviceMotionEffectView;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)contentInsets;
- (UIView)labelsContainerView;
- (double)_lineHeightForFont:(id)a3;
- (double)_scaledSpacingBetweenLabels;
- (id)_createEmojiLabelForString:(id)a3 containingEmojisAtRanges:(id)a4;
- (id)_createLabel;
- (id)_createLabelForUtterance:(id)a3;
- (id)_fontForUtteranceLabel;
- (id)_textForLabel:(id)a3;
- (void)_setTextForLabel:(id)a3 text:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setUtterances:(id)a3;
@end

@implementation SiriSharedUICompactServerUtteranceView

- (SiriSharedUICompactServerUtteranceView)initWithContentInsets:(UIEdgeInsets)a3 delegate:(id)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SiriSharedUICompactServerUtteranceView;
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = -[SiriSharedUICompactServerUtteranceView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    v14->_contentInsets.CGFloat top = top;
    v14->_contentInsets.CGFloat left = left;
    v14->_contentInsets.CGFloat bottom = bottom;
    v14->_contentInsets.CGFloat right = right;
    objc_storeWeak((id *)&v14->_delegate, v9);
    v16 = -[SiriSharedUIStandardView initWithFrame:]([SiriSharedUIStandardView alloc], "initWithFrame:", v10, v11, v12, v13);
    labelsContainerView = v15->_labelsContainerView;
    v15->_labelsContainerView = &v16->super;

    [(SiriSharedUICompactServerUtteranceView *)v15 addSubview:v15->_labelsContainerView];
    v18 = objc_alloc_init(SiriSharedUIDeviceMotionEffectView);
    deviceMotionEffectView = v15->_deviceMotionEffectView;
    v15->_deviceMotionEffectView = v18;

    [(SiriSharedUICompactServerUtteranceView *)v15 addSubview:v15->_deviceMotionEffectView];
  }

  return v15;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setUtterances:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(UIView *)self->_labelsContainerView subviews];
  v6 = (void *)[v5 copy];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v12 removeFromSuperview];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v14 = [v12 assistantUtteranceView];
          [WeakRetained serverUtteranceView:self utteranceViewDidDisappear:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v15 = [(NSMapTable *)self->_emojiLabels objectEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * j) removeFromSuperview];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v17);
  }
  v39 = v7;

  [(NSMapTable *)self->_emojiLabels removeAllObjects];
  v20 = [MEMORY[0x263EFF980] array];
  serverLabels = self->_serverLabels;
  self->_serverLabels = v20;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v4;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v40 + 1) + 8 * k);
        uint64_t v28 = [v27 text];
        if (v28)
        {
          v29 = (void *)v28;
          v30 = [v27 text];
          char v31 = [v30 isEqualToString:&stru_26C1A19D8];

          if ((v31 & 1) == 0)
          {
            v32 = [(SiriSharedUICompactServerUtteranceView *)self _createLabelForUtterance:v27];
            [(UIView *)self->_labelsContainerView addSubview:v32];
            [(NSMutableArray *)self->_serverLabels addObject:v32];
            id v33 = objc_loadWeakRetained((id *)&self->_delegate);
            [v33 serverUtteranceView:self utteranceViewDidAppear:v27];

            v34 = [(SiriSharedUICompactServerUtteranceView *)self _textForLabel:v32];
            v35 = +[SiriSharedUIUtilities substringRangesContainingEmojiInString:v34];
            if ([v35 count])
            {
              if (!self->_emojiLabels)
              {
                v36 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
                emojiLabels = self->_emojiLabels;
                self->_emojiLabels = v36;
              }
              v38 = [(SiriSharedUICompactServerUtteranceView *)self _createEmojiLabelForString:v34 containingEmojisAtRanges:v35];
              [(SiriSharedUICompactServerUtteranceView *)self addSubview:v38];
              [(NSMapTable *)self->_emojiLabels setObject:v38 forKey:v32];
            }
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v24);
  }

  [(SiriSharedUIDeviceMotionEffectView *)self->_deviceMotionEffectView viewWillBeUpdated];
  [(SiriSharedUICompactServerUtteranceView *)self setNeedsLayout];
}

- (BOOL)isMultiLine
{
  return self->_isMultiLine;
}

- (void)setIsInAmbient:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_isInAmbient != a3)
  {
    self->_isInAmbient = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_serverLabels;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          uint64_t v10 = [(SiriSharedUICompactServerUtteranceView *)self _fontForUtteranceLabel];
          [v9 setFont:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->_isInAmbientInteractivity = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_serverLabels;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = [(SiriSharedUICompactServerUtteranceView *)self _fontForUtteranceLabel];
        [v9 setFont:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(UIView *)self->_labelsContainerView subviews];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v27 = 0x2020000000;
    uint64_t v23 = 0x2020000000;
    double top = self->_contentInsets.top;
    double bottom = self->_contentInsets.bottom;
    double v10 = width - self->_contentInsets.left - self->_contentInsets.right;
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v28 = 0;
    uint64_t v21 = 0;
    id v22 = (double *)&v21;
    uint64_t v24 = 0;
    serverLabels = self->_serverLabels;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__SiriSharedUICompactServerUtteranceView_sizeThatFits___block_invoke;
    v20[3] = &unk_2640E3BB0;
    *(double *)&v20[7] = v10;
    *(double *)&v20[8] = height - top - bottom;
    v20[5] = &v25;
    v20[6] = &v21;
    v20[4] = self;
    [(NSMutableArray *)serverLabels enumerateObjectsUsingBlock:v20];
    double v12 = v22[3];
    long long v13 = [(SiriSharedUICompactServerUtteranceView *)self _fontForUtteranceLabel];
    [(SiriSharedUICompactServerUtteranceView *)self _lineHeightForFont:v13];
    double v15 = vabdd_f64(v12, v14);

    if (v15 <= 1.0)
    {
      self->_isMultiLine = 0;
      uint64_t v16 = v26;
      double v10 = v26[3];
    }
    else
    {
      self->_isMultiLine = 1;
      uint64_t v16 = v26;
      v26[3] = v10;
    }
    v16[3] = self->_contentInsets.left + self->_contentInsets.right + v10;
    double v17 = self->_contentInsets.top + self->_contentInsets.bottom + v22[3];
    v22[3] = v17;
    if (v16[3] < width) {
      double width = v16[3];
    }
    if (v17 < height) {
      double height = v17;
    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    double width = *MEMORY[0x263F001B0];
    double height = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v18 = width;
  double v19 = height;
  result.double height = v19;
  result.double width = v18;
  return result;
}

double __55__SiriSharedUICompactServerUtteranceView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  float v6 = *(double *)(v5 + 24);
  *(float *)&double v7 = v7;
  *(double *)(v5 + 24) = fmaxf(v6, *(float *)&v7);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v9 + *(double *)(v8 + 24);
  *(double *)(v8 + 24) = result;
  if (a3)
  {
    [*(id *)(a1 + 32) _scaledSpacingBetweenLabels];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    double result = v12 + *(double *)(v11 + 24);
    *(double *)(v11 + 24) = result;
  }
  return result;
}

- (void)layoutSubviews
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)SiriSharedUICompactServerUtteranceView;
  [(SiriSharedUICompactServerUtteranceView *)&v50 layoutSubviews];
  [(SiriSharedUICompactServerUtteranceView *)self bounds];
  CGFloat x = v53.origin.x;
  CGFloat y = v53.origin.y;
  CGFloat width = v53.size.width;
  CGFloat height = v53.size.height;
  if (CGRectIsEmpty(v53)) {
    p_contentInsets = (UIEdgeInsets *)MEMORY[0x263F834E8];
  }
  else {
    p_contentInsets = &self->_contentInsets;
  }
  double left = p_contentInsets->left;
  double right = p_contentInsets->right;
  double bottom = p_contentInsets->bottom;
  double top = p_contentInsets->top;
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  double v10 = left + CGRectGetMinX(v54);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  double v11 = top + CGRectGetMinY(v55);
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  double v12 = CGRectGetWidth(v56) - (right + left);
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  double v40 = v11;
  double v41 = v10;
  double v45 = CGRectGetHeight(v57) - (bottom + top);
  -[UIView setFrame:](self->_labelsContainerView, "setFrame:", v10, v11, v12);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v13 = self->_serverLabels;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = *MEMORY[0x263F00148];
    double v17 = *(double *)(MEMORY[0x263F00148] + 8);
    uint64_t v18 = *(void *)v47;
    double v43 = v12;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_msgSend(v20, "sizeThatFits:", v12, v45);
        double v22 = v21;
        objc_msgSend(v20, "setFrame:", v16, v17, v12, v21);
        [(SiriSharedUICompactServerUtteranceView *)self _scaledSpacingBetweenLabels];
        double v24 = v23;
        uint64_t v25 = [(NSMapTable *)self->_emojiLabels objectForKey:v20];
        if (v25)
        {
          v26 = [(UIView *)self->_labelsContainerView superview];
          objc_msgSend(v26, "convertRect:fromView:", self->_labelsContainerView, v16, v17, v12, v22);
          double v27 = v16;
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;

          double v36 = v29;
          double v16 = v27;
          double v12 = v43;
          objc_msgSend(v25, "setFrame:", v36, v31, v33, v35);
        }
        double v17 = v17 + v22 + v24;
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v15);
  }

  -[SiriSharedUIDeviceMotionEffectView setFrame:](self->_deviceMotionEffectView, "setFrame:", v41, v40, v12, v45);
  v37 = [(UIView *)self->_labelsContainerView subviews];
  if (![v37 count])
  {

    goto LABEL_17;
  }
  char v38 = [MEMORY[0x263F286B8] isSAEEnabled];

  if (v38)
  {
LABEL_17:
    labelsContainerView = 0;
    goto LABEL_18;
  }
  labelsContainerView = self->_labelsContainerView;
LABEL_18:
  [(SiriSharedUIDeviceMotionEffectView *)self->_deviceMotionEffectView updateMaskingForView:labelsContainerView];
}

- (id)_createLabelForUtterance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SiriSharedUICompactServerUtteranceView *)self _createLabel];
  float v6 = [(SiriSharedUICompactServerUtteranceView *)self delegate];
  double v7 = [v6 parserSpeakableObjectProviderForServerUtterance:self];

  uint64_t v8 = (void *)MEMORY[0x263F75508];
  double v9 = [v4 text];
  double v10 = [v4 context];
  double v11 = [v8 parsedUtteranceFromText:v9 context:v10 spekableObjectProviding:v7];

  [(SiriSharedUICompactServerUtteranceView *)self _setTextForLabel:v5 text:v11];
  double v12 = [v4 dialogIdentifier];
  [v5 setAccessibilityIdentifier:v12];

  [v5 setAssistantUtteranceView:v4];
  return v5;
}

- (id)_createEmojiLabelForString:(id)a3 containingEmojisAtRanges:(id)a4
{
  v31[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SiriSharedUICompactServerUtteranceView *)self _createLabel];
  uint64_t v9 = *MEMORY[0x263F81500];
  v30[0] = *MEMORY[0x263F81500];
  double v10 = [MEMORY[0x263F825C8] clearColor];
  v31[0] = v10;
  v30[1] = *MEMORY[0x263F814F0];
  double v11 = [v8 font];
  v31[1] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

  double v24 = v6;
  long long v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v6 attributes:v12];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v20 = [v8 textColor];
        uint64_t v21 = [v19 rangeValue];
        objc_msgSend(v13, "addAttribute:value:range:", v9, v20, v21, v22);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [v8 setAttributedText:v13];
  return v8;
}

- (id)_createLabel
{
  v3 = objc_alloc_init(SiriSharedUICompactServerUtteranceLabel);
  id v4 = [MEMORY[0x263F825C8] labelColor];
  [(SiriSharedUICompactServerUtteranceLabel *)v3 setTextColor:v4];

  uint64_t v5 = [(SiriSharedUICompactServerUtteranceView *)self _fontForUtteranceLabel];
  [(SiriSharedUICompactServerUtteranceLabel *)v3 setFont:v5];

  [(SiriSharedUICompactServerUtteranceLabel *)v3 setNumberOfLines:0];
  SiriSharedUIRecursiveSetSemanticContentAttribute(v3, [(SiriSharedUICompactServerUtteranceView *)self semanticContentAttribute]);
  return v3;
}

- (double)_scaledSpacingBetweenLabels
{
  v3 = objc_msgSend(MEMORY[0x263F81708], "sirisharedui_serverUtteranceFont");
  [(SiriSharedUICompactServerUtteranceView *)self _lineHeightForFont:v3];
  double v5 = v4;

  return v5;
}

- (void)dealloc
{
  [(SiriSharedUIDeviceMotionEffectView *)self->_deviceMotionEffectView invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SiriSharedUICompactServerUtteranceView;
  [(SiriSharedUICompactServerUtteranceView *)&v3 dealloc];
}

- (id)_textForLabel:(id)a3
{
  return (id)[a3 text];
}

- (void)_setTextForLabel:(id)a3 text:(id)a4
{
}

- (double)_lineHeightForFont:(id)a3
{
  [a3 lineHeight];
  return result;
}

- (id)_fontForUtteranceLabel
{
  id v3 = (id)*MEMORY[0x263F83570];
  if (self->_isInAmbient && !self->_isInAmbientInteractivity)
  {
    id v4 = (id)*MEMORY[0x263F835E0];

    id v3 = v4;
  }
  double v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v3 variant:1280];

  return v5;
}

- (SiriSharedUICompactServerUtteranceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriSharedUICompactServerUtteranceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (SiriSharedUIDeviceMotionEffectView)deviceMotionEffectView
{
  return self->_deviceMotionEffectView;
}

- (UIView)labelsContainerView
{
  return self->_labelsContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsContainerView, 0);
  objc_storeStrong((id *)&self->_deviceMotionEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_emojiLabels, 0);
  objc_storeStrong((id *)&self->_serverLabels, 0);
}

@end