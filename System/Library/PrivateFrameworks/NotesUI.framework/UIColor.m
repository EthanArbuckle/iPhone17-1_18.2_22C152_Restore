@interface UIColor
@end

@implementation UIColor

void __40__UIColor_IC__preferredDefaultFontColor__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = (void *)MEMORY[0x1E4F28B50];
  v2 = ICUIFrameworkBundleIdentifier();
  v3 = [v1 bundleWithIdentifier:v2];
  id v8 = [v0 colorNamed:@"default_body_text_color" inBundle:v3 compatibleWithTraitCollection:0];

  if (v8 && (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision") & 1) == 0)
  {
    id v7 = v8;
    v4 = (void *)preferredDefaultFontColor_sDefaultFontColor;
    preferredDefaultFontColor_sDefaultFontColor = (uint64_t)v7;
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v5 = objc_msgSend(v4, "ic_resolvedColorForLightUserInterfaceStyle");
    v6 = (void *)preferredDefaultFontColor_sDefaultFontColor;
    preferredDefaultFontColor_sDefaultFontColor = v5;
  }
}

void __26__UIColor_IC__ICTintColor__block_invoke(uint64_t a1)
{
  double v2 = __26__UIColor_IC__ICTintColor__block_invoke_2(a1, @"tintColorRed");
  if (v2 == -1.0)
  {
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [MEMORY[0x1E4FB1618] colorNamed:@"notes_tint_color" inBundle:v9 compatibleWithTraitCollection:0];
    id v8 = (void *)ICTintColor_color;
    ICTintColor_color = v7;
  }
  else
  {
    double v3 = __26__UIColor_IC__ICTintColor__block_invoke_2(v1, @"tintColorGreen");
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", v2 / 255.0, v3 / 255.0, __26__UIColor_IC__ICTintColor__block_invoke_2(v4, @"tintColorBlue") / 255.0, 1.0);
    v6 = (void *)ICTintColor_color;
    ICTintColor_color = v5;

    sUsingCustomTintColor = 1;
  }
}

double __26__UIColor_IC__ICTintColor__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F1CB18];
  id v3 = a2;
  uint64_t v4 = [v2 standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:v3];

  double v6 = -1.0;
  if (v5)
  {
    objc_opt_class();
    uint64_t v7 = ICDynamicCast();
    char v8 = [v7 isEqualToString:&stru_1F0973378];

    if ((v8 & 1) == 0)
    {
      [v5 doubleValue];
      double v6 = v9;
    }
  }

  return v6;
}

void __37__UIColor_IC__ICTintedSelectionColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorNamed:@"notes_selection_tint_color" inBundle:v2 compatibleWithTraitCollection:0];
  uint64_t v1 = (void *)ICTintedSelectionColor_sTintedSelectionColor;
  ICTintedSelectionColor_sTintedSelectionColor = v0;
}

uint64_t __54__UIColor_IC__ICSelectedAttachmentBrickHighlightColor__block_invoke()
{
  ICSelectedAttachmentBrickHighlightColor_color = [MEMORY[0x1E4FB1618] colorNamed:@"selected_search_highlight"];
  return MEMORY[0x1F41817F8]();
}

void __46__UIColor_NotesColors__ic_notesAppYellowColor__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB1618]) initWithRed:0.917647059 green:0.733333333 blue:0.0 alpha:1.0];
  uint64_t v0 = objc_msgSend(v2, "ic_resolvedColorForNoteEditor");
  uint64_t v1 = (void *)ic_notesAppYellowColor_appYellowColor;
  ic_notesAppYellowColor_appYellowColor = v0;
}

void __48__UIColor_NotesColors__ic_notesDefaultTextColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.270588235 green:0.270588235 blue:0.270588235 alpha:1.0];
  uint64_t v0 = objc_msgSend(v2, "ic_resolvedColorForNoteEditor");
  uint64_t v1 = (void *)ic_notesDefaultTextColor_defaultTextColor;
  ic_notesDefaultTextColor_defaultTextColor = v0;
}

@end