@interface UIKBUndoStyling
- (BOOL)cutCopyPasteIconOnly;
- (BOOL)isRTL;
- (BOOL)tooSmallForInstructionalText;
- (BOOL)undoRedoIconOnly;
- (UIBlurEffect)backgroundBlurEffect;
- (UIColor)HUDShadowColor;
- (UIColor)HUDbackgroundColor;
- (UIColor)buttonGlyphColorDisabled;
- (UIColor)buttonGlyphColorEnabled;
- (UIColor)buttonGlyphColorPressed;
- (UIColor)elementBackgroundColor;
- (UIColor)elementCoverColor;
- (UIFont)undoInteractiveControlLabelFont;
- (UIFont)undoStateControlLabelFont;
- (UIFont)undoStateControlUnavailableLabelFont;
- (UIKBUndoStyling)initWithKeyboardAppearance:(int64_t)a3 isRTL:(BOOL)a4;
- (UIVibrancyEffect)backgroundVibrancyEffect;
- (double)cutControlMinWidth;
- (double)undoControlMinWidth;
- (id)vibrancyEffectForBlur:(id)a3;
- (int64_t)appearance;
- (void)createDynamicColors;
- (void)setAppearance:(int64_t)a3;
- (void)setBackgroundBlurEffect:(id)a3;
- (void)setBackgroundVibrancyEffect:(id)a3;
- (void)setButtonGlyphColorDisabled:(id)a3;
- (void)setButtonGlyphColorEnabled:(id)a3;
- (void)setButtonGlyphColorPressed:(id)a3;
- (void)setCutControlMinWidth:(double)a3;
- (void)setCutCopyPasteIconOnly:(BOOL)a3;
- (void)setElementBackgroundColor:(id)a3;
- (void)setElementCoverColor:(id)a3;
- (void)setHUDShadowColor:(id)a3;
- (void)setHUDbackgroundColor:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setTooSmallForInstructionalText:(BOOL)a3;
- (void)setUndoControlMinWidth:(double)a3;
- (void)setUndoRedoIconOnly:(BOOL)a3;
@end

@implementation UIKBUndoStyling

- (UIKBUndoStyling)initWithKeyboardAppearance:(int64_t)a3 isRTL:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)UIKBUndoStyling;
  v6 = [(UIKBUndoStyling *)&v13 init];
  if (v6)
  {
    uint64_t v7 = +[UIBlurEffect effectWithStyle:1200];
    backgroundBlurEffect = v6->_backgroundBlurEffect;
    v6->_backgroundBlurEffect = (UIBlurEffect *)v7;

    uint64_t v9 = [(UIKBUndoStyling *)v6 vibrancyEffectForBlur:v6->_backgroundBlurEffect];
    backgroundVibrancyEffect = v6->_backgroundVibrancyEffect;
    v6->_backgroundVibrancyEffect = (UIVibrancyEffect *)v9;

    v6->_isRTL = a4;
    v6->_appearance = a3;
    [(UIKBUndoStyling *)v6 createDynamicColors];
    v11 = v6;
  }

  return v6;
}

- (id)vibrancyEffectForBlur:(id)a3
{
  return +[UIVibrancyEffect effectForBlurEffect:a3 style:7];
}

- (void)createDynamicColors
{
  v3 = +[UIColor colorWithDynamicProvider:&__block_literal_global_398];
  HUDbackgroundColor = self->_HUDbackgroundColor;
  self->_HUDbackgroundColor = v3;

  v5 = +[UIColor colorWithDynamicProvider:&__block_literal_global_53_1];
  HUDShadowColor = self->_HUDShadowColor;
  self->_HUDShadowColor = v5;

  uint64_t v7 = +[UIColor colorWithDynamicProvider:&__block_literal_global_55_2];
  elementBackgroundColor = self->_elementBackgroundColor;
  self->_elementBackgroundColor = v7;

  uint64_t v9 = +[UIColor colorWithDynamicProvider:&__block_literal_global_57_0];
  elementCoverColor = self->_elementCoverColor;
  self->_elementCoverColor = v9;

  v11 = +[UIColor colorWithDynamicProvider:&__block_literal_global_59_0];
  buttonGlyphColorEnabled = self->_buttonGlyphColorEnabled;
  self->_buttonGlyphColorEnabled = v11;

  objc_storeStrong((id *)&self->_buttonGlyphColorPressed, self->_buttonGlyphColorEnabled);
  objc_super v13 = +[UIColor colorWithDynamicProvider:&__block_literal_global_61_1];
  buttonGlyphColorDisabled = self->_buttonGlyphColorDisabled;
  self->_buttonGlyphColorDisabled = v13;
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = self;
  uint64_t v4 = [v2 valueForNSIntegerTrait:v3];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__UIKBUndoStyling_createDynamicColors__block_invoke_2;
  v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v9[4] = v4;
  v5 = [v2 traitCollectionByModifyingTraits:v9];

  v6 = +[UIColor systemBackgroundColor];
  uint64_t v7 = [v6 resolvedColorWithTraitCollection:v5];

  return v7;
}

void __38__UIKBUndoStyling_createDynamicColors__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = a2;
  [v3 setUserInterfaceStyle:v2];
  [v3 setUserInterfaceLevel:1];
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  uint64_t v4 = [v2 valueForNSIntegerTrait:v3];

  if (v4 == 1) {
    +[UIColor clearColor];
  }
  else {
  v5 = +[UIColor blackColor];
  }
  return v5;
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  uint64_t v4 = [v2 valueForNSIntegerTrait:v3];

  if (v4 == 1) {
    +[UIColor colorWithWhite:1.0 alpha:0.4];
  }
  else {
  v5 = +[UIColor colorWithRed:0.937254902 green:0.937254902 blue:0.937254902 alpha:1.0];
  }
  return v5;
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  uint64_t v4 = [v2 valueForNSIntegerTrait:v3];

  if (v4 == 1) {
    +[UIColor colorWithWhite:1.0 alpha:0.95];
  }
  else {
  v5 = +[UIColor systemYellowColor];
  }
  return v5;
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  uint64_t v4 = [v2 valueForNSIntegerTrait:v3];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__UIKBUndoStyling_createDynamicColors__block_invoke_7;
  v10[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v10[4] = v4;
  v5 = [v2 traitCollectionByModifyingTraits:v10];

  v6 = +[UIColor labelColor];
  uint64_t v7 = [v6 colorWithAlphaComponent:0.8];
  v8 = [v7 resolvedColorWithTraitCollection:v5];

  return v8;
}

uint64_t __38__UIKBUndoStyling_createDynamicColors__block_invoke_7(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setUserInterfaceStyle:v2];
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  uint64_t v4 = [v2 valueForNSIntegerTrait:v3];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__UIKBUndoStyling_createDynamicColors__block_invoke_9;
  v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v9[4] = v4;
  v5 = [v2 traitCollectionByModifyingTraits:v9];

  v6 = +[UIColor quaternaryLabelColor];
  uint64_t v7 = [v6 resolvedColorWithTraitCollection:v5];

  return v7;
}

uint64_t __38__UIKBUndoStyling_createDynamicColors__block_invoke_9(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setUserInterfaceStyle:v2];
}

- (UIFont)undoInteractiveControlLabelFont
{
  uint64_t v2 = *MEMORY[0x1E4FB3558];
  id v3 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB3550]];
  uint64_t v4 = [off_1E52D39B8 _preferredFontForTextStyle:v2 maximumPointSize:v3 compatibleWithTraitCollection:18.0];

  return (UIFont *)v4;
}

- (UIFont)undoStateControlLabelFont
{
  uint64_t v2 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryL"];
  id v3 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedFootnote" maximumPointSize:v2 compatibleWithTraitCollection:20.0];

  return (UIFont *)v3;
}

- (UIFont)undoStateControlUnavailableLabelFont
{
  uint64_t v2 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryL"];
  id v3 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedCaption2" maximumPointSize:v2 compatibleWithTraitCollection:20.0];

  return (UIFont *)v3;
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void)setBackgroundBlurEffect:(id)a3
{
}

- (UIVibrancyEffect)backgroundVibrancyEffect
{
  return self->_backgroundVibrancyEffect;
}

- (void)setBackgroundVibrancyEffect:(id)a3
{
}

- (UIColor)HUDbackgroundColor
{
  return self->_HUDbackgroundColor;
}

- (void)setHUDbackgroundColor:(id)a3
{
}

- (UIColor)HUDShadowColor
{
  return self->_HUDShadowColor;
}

- (void)setHUDShadowColor:(id)a3
{
}

- (UIColor)buttonGlyphColorEnabled
{
  return self->_buttonGlyphColorEnabled;
}

- (void)setButtonGlyphColorEnabled:(id)a3
{
}

- (UIColor)buttonGlyphColorPressed
{
  return self->_buttonGlyphColorPressed;
}

- (void)setButtonGlyphColorPressed:(id)a3
{
}

- (UIColor)buttonGlyphColorDisabled
{
  return self->_buttonGlyphColorDisabled;
}

- (void)setButtonGlyphColorDisabled:(id)a3
{
}

- (UIColor)elementBackgroundColor
{
  return self->_elementBackgroundColor;
}

- (void)setElementBackgroundColor:(id)a3
{
}

- (UIColor)elementCoverColor
{
  return self->_elementCoverColor;
}

- (void)setElementCoverColor:(id)a3
{
}

- (BOOL)undoRedoIconOnly
{
  return self->_undoRedoIconOnly;
}

- (void)setUndoRedoIconOnly:(BOOL)a3
{
  self->_undoRedoIconOnly = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)undoControlMinWidth
{
  return self->_undoControlMinWidth;
}

- (void)setUndoControlMinWidth:(double)a3
{
  self->_undoControlMinWidth = a3;
}

- (double)cutControlMinWidth
{
  return self->_cutControlMinWidth;
}

- (void)setCutControlMinWidth:(double)a3
{
  self->_cutControlMinWidth = a3;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (BOOL)cutCopyPasteIconOnly
{
  return self->_cutCopyPasteIconOnly;
}

- (void)setCutCopyPasteIconOnly:(BOOL)a3
{
  self->_cutCopyPasteIconOnly = a3;
}

- (BOOL)tooSmallForInstructionalText
{
  return self->_tooSmallForInstructionalText;
}

- (void)setTooSmallForInstructionalText:(BOOL)a3
{
  self->_tooSmallForInstructionalText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementCoverColor, 0);
  objc_storeStrong((id *)&self->_elementBackgroundColor, 0);
  objc_storeStrong((id *)&self->_buttonGlyphColorDisabled, 0);
  objc_storeStrong((id *)&self->_buttonGlyphColorPressed, 0);
  objc_storeStrong((id *)&self->_buttonGlyphColorEnabled, 0);
  objc_storeStrong((id *)&self->_HUDShadowColor, 0);
  objc_storeStrong((id *)&self->_HUDbackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
}

@end