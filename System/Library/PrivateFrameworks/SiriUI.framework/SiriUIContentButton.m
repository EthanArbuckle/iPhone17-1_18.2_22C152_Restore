@interface SiriUIContentButton
+ (id)button;
+ (id)buttonWithImageMask:(id)a3;
+ (id)buttonWithImageMask:(id)a3 style:(int64_t)a4;
+ (id)buttonWithImageTemplate:(id)a3;
+ (id)buttonWithImageTemplate:(id)a3 style:(int64_t)a4;
+ (id)buttonWithLightWeightFont;
+ (id)buttonWithMediumWeightFont;
+ (id)buttonWithRole:(int64_t)a3;
+ (id)eyesFreeButtonWithImageTemplate:(id)a3 style:(int64_t)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)usePlatterStyle;
- (SiriUIContentButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)hitTestEdgeInsets;
- (void)_setIsRenderingImageTemplate:(BOOL)a3;
- (void)_updateStyling;
- (void)_updateTintColor;
- (void)configureRoleForConfirmationOptions:(id)a3;
- (void)setDefaultColorForTemplate:(id)a3;
- (void)setHighlightColorForTemplate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3;
- (void)setOverrideTextColor:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setUsePlatterStyle:(BOOL)a3;
@end

@implementation SiriUIContentButton

+ (id)button
{
  return (id)[a1 buttonWithType:0];
}

+ (id)buttonWithRole:(int64_t)a3
{
  v4 = [a1 button];
  [v4 setRole:a3];
  return v4;
}

+ (id)buttonWithLightWeightFont
{
  v2 = [a1 button];
  v3 = [v2 titleLabel];
  v4 = objc_msgSend(MEMORY[0x263F1C658], "siriui_dynamicLightWeightBodySizeFont");
  [v3 setFont:v4];

  v5 = [v2 titleLabel];
  [v5 setTextAlignment:1];

  v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v2 setTitleColor:v6 forState:2];

  return v2;
}

+ (id)buttonWithMediumWeightFont
{
  v2 = [a1 button];
  v3 = [v2 titleLabel];
  v4 = objc_msgSend(MEMORY[0x263F1C658], "siriui_dynamicMediumWeightBodySizeFont");
  [v3 setFont:v4];

  v5 = [v2 titleLabel];
  [v5 setTextAlignment:1];

  v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v2 setTitleColor:v6 forState:2];

  return v2;
}

+ (id)buttonWithImageMask:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 button];
  v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setBackgroundColor:v8];

  if (a4) {
    objc_msgSend(MEMORY[0x263F1C550], "siriui_maskingColor");
  }
  else {
  v9 = objc_msgSend(MEMORY[0x263F1C550], "siriui_transparantButtonColor");
  }
  v10 = [v6 _flatImageWithColor:v9];
  [v7 setImage:v10 forState:0];

  if (a4) {
    objc_msgSend(MEMORY[0x263F1C550], "siriui_maskingHighlightColor");
  }
  else {
  v11 = objc_msgSend(MEMORY[0x263F1C550], "siriui_transparantHighlightedButtonColor");
  }
  v12 = [v6 _flatImageWithColor:v11];
  [v7 setImage:v12 forState:1];

  return v7;
}

+ (id)buttonWithImageTemplate:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 button];
  v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setImage:v6 forState:0];
  [v7 _setIsRenderingImageTemplate:1];
  if (a4)
  {
    v9 = objc_msgSend(MEMORY[0x263F1C550], "siriui_maskingColor");
    [v7 setDefaultColorForTemplate:v9];

    objc_msgSend(MEMORY[0x263F1C550], "siriui_maskingHighlightColor");
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x263F1C550], "siriui_transparantButtonColor");
    [v7 setDefaultColorForTemplate:v10];

    objc_msgSend(MEMORY[0x263F1C550], "siriui_transparantHighlightedButtonColor");
  v11 = };
  [v7 setHighlightColorForTemplate:v11];

  return v7;
}

+ (id)eyesFreeButtonWithImageTemplate:(id)a3 style:(int64_t)a4
{
  v4 = +[SiriUIContentButton buttonWithImageTemplate:a3 style:a4];
  [v4 setContentVerticalAlignment:3];
  [v4 setContentHorizontalAlignment:3];
  return v4;
}

- (SiriUIContentButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SiriUIContentButton;
  v3 = -[SiriUIContentButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&v3->_hitTestEdgeInsets.top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&v3->_hitTestEdgeInsets.bottom = v5;
    id v6 = [(SiriUIContentButton *)v3 titleLabel];
    v7 = objc_msgSend(MEMORY[0x263F1C550], "siriui_textColor");
    [v6 setTextColor:v7];

    v8 = [(SiriUIContentButton *)v4 titleLabel];
    [v8 setLineBreakMode:4];

    v9 = [MEMORY[0x263F1C550] clearColor];
    [(SiriUIContentButton *)v4 setBackgroundColor:v9];

    [(SiriUIContentButton *)v4 setExclusiveTouch:1];
    [(SiriUIContentButton *)v4 setUsePlatterStyle:SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIContentButton;
  [(SiriUIContentButton *)&v4 setHighlighted:a3];
  [(SiriUIContentButton *)self _updateStyling];
}

- (void)setUsePlatterStyle:(BOOL)a3
{
  if (self->_usePlatterStyle != a3)
  {
    self->_usePlatterStyle = a3;
    [(SiriUIContentButton *)self _updateStyling];
  }
}

- (void)setRole:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SiriUIContentButton;
  -[SiriUIContentButton setRole:](&v17, sel_setRole_);
  switch(a3)
  {
    case 0:
    case 2:
      long long v5 = [(SiriUIContentButton *)self titleLabel];
      id v6 = objc_msgSend(MEMORY[0x263F1C658], "siriUI_dynamicSubHeadlineMediumSizeFont");
      [v5 setFont:v6];

      v7 = [MEMORY[0x263F1C550] labelColor];
      [(SiriUIContentButton *)self setTitleColor:v7 forState:0];

      uint64_t v8 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
      goto LABEL_5;
    case 1:
      v9 = [(SiriUIContentButton *)self titleLabel];
      v10 = objc_msgSend(MEMORY[0x263F1C658], "siriUI_dynamicSubHeadlineEmphasizedSizeFont");
      [v9 setFont:v10];

      objc_super v11 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
      [(SiriUIContentButton *)self setTitleColor:v11 forState:0];

      uint64_t v8 = [MEMORY[0x263F1C550] systemBlueColor];
      goto LABEL_5;
    case 3:
      v12 = [(SiriUIContentButton *)self titleLabel];
      v13 = objc_msgSend(MEMORY[0x263F1C658], "siriUI_dynamicSubHeadlineEmphasizedSizeFont");
      [v12 setFont:v13];

      v14 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
      [(SiriUIContentButton *)self setTitleColor:v14 forState:0];

      uint64_t v8 = [MEMORY[0x263F1C550] systemRedColor];
LABEL_5:
      v15 = (void *)v8;
      [(SiriUIContentButton *)self setBackgroundColor:v8];

      break;
    default:
      break;
  }
  v16 = [(SiriUIContentButton *)self titleLabel];
  [v16 setTextAlignment:1];
}

- (void)_updateStyling
{
  if ([(SiriUIContentButton *)self isHighlighted])
  {
    v3 = [(SiriUIContentButton *)self imageView];
    objc_super v4 = [v3 image];

    if (!v4)
    {
      if ([(SiriUIContentButton *)self role] == 3)
      {
        v9 = [MEMORY[0x263F1C550] systemRedColor];
      }
      else
      {
        if ([(SiriUIContentButton *)self role] != 1)
        {
          if ([(SiriUIContentButton *)self role] != 2)
          {
            overrideTextColor = self->_overrideTextColor;
            if (overrideTextColor)
            {
              [(SiriUIContentButton *)self setTitleColor:overrideTextColor forState:0];
            }
            else
            {
              if (self->_usePlatterStyle) {
                objc_msgSend(MEMORY[0x263F1C550], "siriui_platterTextHighlightColor");
              }
              else {
              v12 = objc_msgSend(MEMORY[0x263F1C550], "siriui_lightTextColor");
              }
              [(SiriUIContentButton *)self setTitleColor:v12 forState:0];
            }
            uint64_t v8 = objc_msgSend(MEMORY[0x263F1C550], "siriui_highlightColor");
            goto LABEL_29;
          }
          v9 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
          id v13 = v9;
          double v10 = 0.15;
LABEL_17:
          id v7 = [v9 colorWithAlphaComponent:v10];
          [(SiriUIContentButton *)self setBackgroundColor:v7];
LABEL_18:

          goto LABEL_30;
        }
        v9 = [MEMORY[0x263F1C550] systemBlueColor];
      }
      id v13 = v9;
      double v10 = 0.75;
      goto LABEL_17;
    }
  }
  if (self->_isRenderingImageTemplate)
  {
    int v5 = [(SiriUIContentButton *)self isHighlighted];
    id v6 = &OBJC_IVAR___SiriUIContentButton__defaultColorForTemplate;
    if (v5) {
      id v6 = &OBJC_IVAR___SiriUIContentButton__highlightColorForTemplate;
    }
    id v7 = *(id *)((char *)&self->super.super.super.super.super.isa + *v6);
    id v13 = [(SiriUIContentButton *)self imageView];
    [v13 setTintColor:v7];
    goto LABEL_18;
  }
  if ([(SiriUIContentButton *)self role] == 3)
  {
    uint64_t v8 = [MEMORY[0x263F1C550] systemRedColor];
  }
  else
  {
    if ([(SiriUIContentButton *)self role] == 1)
    {
      [MEMORY[0x263F1C550] systemBlueColor];
    }
    else
    {
      [(SiriUIContentButton *)self role];
      [MEMORY[0x263F1C550] tertiarySystemFillColor];
    uint64_t v8 = };
  }
LABEL_29:
  id v13 = (id)v8;
  [(SiriUIContentButton *)self setBackgroundColor:v8];
LABEL_30:
}

- (void)configureRoleForConfirmationOptions:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = v4;
  id v7 = 0;
  uint64_t v8 = *(void *)v29;
  uint64_t v9 = *MEMORY[0x263F65D90];
  uint64_t v10 = *MEMORY[0x263F65D88];
  uint64_t v26 = *MEMORY[0x263F65D80];
  *(void *)&long long v5 = 136315394;
  long long v25 = v5;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v3);
      }
      v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
      id v13 = objc_msgSend(v12, "type", v25);
      int v14 = [v13 isEqualToString:v9];

      if (v14)
      {
        if (v7)
        {
          v15 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v33 = "-[SiriUIContentButton configureRoleForConfirmationOptions:]";
            __int16 v34 = 2112;
            id v35 = v12;
            _os_log_error_impl(&dword_2231EF000, v15, OS_LOG_TYPE_ERROR, "%s Warning: Duplicated confirm confirmationOption included in SAUIConfirmationOptions : %@", buf, 0x16u);
          }
        }
        id v16 = v12;

        objc_super v17 = [v16 buttonRole];
        int v18 = [v17 isEqualToString:v10];

        if (v18)
        {
          v19 = self;
          uint64_t v20 = 1;
          goto LABEL_14;
        }
        v21 = [v16 buttonRole];
        int v22 = [v21 isEqualToString:v26];

        if (v22)
        {
          v19 = self;
          uint64_t v20 = 3;
LABEL_14:
          [(SiriUIContentButton *)v19 setRole:v20];
        }
        else
        {
          [(SiriUIContentButton *)self setRole:0];
          v23 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v33 = "-[SiriUIContentButton configureRoleForConfirmationOptions:]";
            __int16 v34 = 2112;
            id v35 = v16;
            _os_log_impl(&dword_2231EF000, v23, OS_LOG_TYPE_DEFAULT, "%s %@ does not specify primary or destructive roles.", buf, 0x16u);
          }
        }
        id v7 = v16;
      }
      ++v11;
    }
    while (v6 != v11);
    uint64_t v24 = [v3 countByEnumeratingWithState:&v28 objects:v36 count:16];
    uint64_t v6 = v24;
  }
  while (v24);
LABEL_23:
  [(SiriUIContentButton *)self _updateStyling];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  p_hitTestEdgeInsets = &self->_hitTestEdgeInsets;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.top, *MEMORY[0x263F1D1C0]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_hitTestEdgeInsets.bottom, *(float64x2_t *)(MEMORY[0x263F1D1C0] + 16)))), 0xFuLL))) & 1) != 0|| ![(SiriUIContentButton *)self isEnabled]|| [(SiriUIContentButton *)self isHidden])
  {
    v17.receiver = self;
    v17.super_class = (Class)SiriUIContentButton;
    BOOL v9 = -[SiriUIContentButton pointInside:withEvent:](&v17, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    [(SiriUIContentButton *)self bounds];
    double left = self->_hitTestEdgeInsets.left;
    v19.origin.double x = v13 + left;
    v19.origin.double y = p_hitTestEdgeInsets->top + v14;
    v19.size.width = v15 - (left + self->_hitTestEdgeInsets.right);
    v19.size.height = v16 - (p_hitTestEdgeInsets->top + self->_hitTestEdgeInsets.bottom);
    v18.double x = x;
    v18.double y = y;
    BOOL v9 = CGRectContainsPoint(v19, v18);
  }
  BOOL v10 = v9;

  return v10;
}

- (void)setOverrideTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTextColor, a3);
  [(SiriUIContentButton *)self _updateStyling];
}

- (void)_setIsRenderingImageTemplate:(BOOL)a3
{
  self->_isRenderingImageTemplate = a3;
}

- (void)setDefaultColorForTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultColorForTemplate, a3);
  [(SiriUIContentButton *)self _updateTintColor];
}

- (void)setHighlightColorForTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColorForTemplate, a3);
  [(SiriUIContentButton *)self _updateTintColor];
}

- (void)_updateTintColor
{
  if (self->_isRenderingImageTemplate)
  {
    int v3 = [(SiriUIContentButton *)self isHighlighted];
    uint64_t v4 = [(SiriUIContentButton *)self imageView];
    id v6 = v4;
    long long v5 = &OBJC_IVAR___SiriUIContentButton__defaultColorForTemplate;
    if (v3) {
      long long v5 = &OBJC_IVAR___SiriUIContentButton__highlightColorForTemplate;
    }
    [v4 setTintColor:*(Class *)((char *)&self->super.super.super.super.super.isa + *v5)];
  }
}

+ (id)buttonWithImageMask:(id)a3
{
  return (id)[a1 buttonWithImageMask:a3 style:0];
}

+ (id)buttonWithImageTemplate:(id)a3
{
  return (id)[a1 buttonWithImageTemplate:a3 style:0];
}

- (BOOL)usePlatterStyle
{
  return self->_usePlatterStyle;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double bottom = self->_hitTestEdgeInsets.bottom;
  double right = self->_hitTestEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_highlightColorForTemplate, 0);
  objc_storeStrong((id *)&self->_defaultColorForTemplate, 0);
}

@end