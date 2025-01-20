@interface UIColor(WorkflowUI)
+ (id)wf_usableColorWithPaletteColor:()WorkflowUI;
+ (uint64_t)settingsCellDetailTextColor;
+ (uint64_t)wf_actionDescriptionColor;
+ (uint64_t)wf_gallerySearchCollectionColor;
+ (uint64_t)wf_gallerySearchCollectionHighlightedColor;
+ (uint64_t)wf_gallerySearchSectionHeaderButtonColor;
+ (uint64_t)wf_gallerySearchSectionHeaderColor;
+ (uint64_t)wf_homeTintColor;
+ (uint64_t)wf_libraryCellSelectionColor;
+ (uint64_t)wf_settingsBackgroundColor;
+ (uint64_t)wf_settingsHeaderFooterColor;
+ (uint64_t)wf_tableCellDefaultSelectionTintColor;
+ (uint64_t)wf_wizardBackgroundColor;
+ (uint64_t)wf_workflowWizardRecordButtonColor;
@end

@implementation UIColor(WorkflowUI)

+ (id)wf_usableColorWithPaletteColor:()WorkflowUI
{
  v2 = objc_msgSend(MEMORY[0x263F851A8], "colorWithPaletteColor:");
  v3 = [v2 paletteGradient];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__UIColor_WorkflowUI__wf_usableColorWithPaletteColor___block_invoke;
  v7[3] = &unk_2649CAAC0;
  id v8 = v3;
  id v4 = v3;
  v5 = [a1 colorWithDynamicProvider:v7];

  return v5;
}

+ (uint64_t)wf_libraryCellSelectionColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_9];
}

+ (uint64_t)wf_tableCellDefaultSelectionTintColor
{
  return [MEMORY[0x263F825C8] tableCellDefaultSelectionTintColor];
}

+ (uint64_t)wf_homeTintColor
{
  return [MEMORY[0x263F825C8] systemOrangeColor];
}

+ (uint64_t)wf_gallerySearchSectionHeaderButtonColor
{
  return [MEMORY[0x263F825C8] systemBlueColor];
}

+ (uint64_t)wf_gallerySearchSectionHeaderColor
{
  return [MEMORY[0x263F825C8] labelColor];
}

+ (uint64_t)wf_gallerySearchCollectionHighlightedColor
{
  return [MEMORY[0x263F825C8] tertiarySystemGroupedBackgroundColor];
}

+ (uint64_t)wf_gallerySearchCollectionColor
{
  return [MEMORY[0x263F825C8] secondarySystemGroupedBackgroundColor];
}

+ (uint64_t)wf_workflowWizardRecordButtonColor
{
  return [MEMORY[0x263F825C8] colorWithRed:0.78039217 green:0.78039217 blue:0.800000012 alpha:1.0];
}

+ (uint64_t)wf_wizardBackgroundColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_466];
}

+ (uint64_t)wf_settingsHeaderFooterColor
{
  return [MEMORY[0x263F825C8] colorWithRed:0.356862754 green:0.423529416 blue:0.509803951 alpha:1.0];
}

+ (uint64_t)settingsCellDetailTextColor
{
  return [MEMORY[0x263F825C8] colorWithRed:0.517647088 green:0.53725493 blue:0.564705908 alpha:1.0];
}

+ (uint64_t)wf_settingsBackgroundColor
{
  return [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
}

+ (uint64_t)wf_actionDescriptionColor
{
  return [MEMORY[0x263F825C8] colorWithRed:0.400000006 green:0.41568628 blue:0.43921569 alpha:1.0];
}

@end