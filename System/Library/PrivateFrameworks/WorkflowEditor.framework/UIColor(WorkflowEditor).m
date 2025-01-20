@interface UIColor(WorkflowEditor)
+ (id)wf_moduleBorderColor;
+ (id)wf_workflowEditorColorNamed:()WorkflowEditor;
+ (uint64_t)wf_galleryModuleConnectionColor;
+ (uint64_t)wf_moduleCellBorderColor;
+ (uint64_t)wf_moduleCellColor;
+ (uint64_t)wf_moduleCellHighlightedColor;
+ (uint64_t)wf_moduleCellRunningColor;
+ (uint64_t)wf_moduleCellRunningShadowColor;
+ (uint64_t)wf_moduleCellShadowColor;
+ (uint64_t)wf_moduleCellTitleColor;
+ (uint64_t)wf_moduleCommentCellColor;
+ (uint64_t)wf_moduleCommentHeadingButtonColor;
+ (uint64_t)wf_moduleCommentParametersBackgroundColor;
+ (uint64_t)wf_moduleCommentParametersSeparatorColor;
+ (uint64_t)wf_moduleConnectionColor;
+ (uint64_t)wf_moduleHeadingButtonColor;
+ (uint64_t)wf_moduleSeparatorColor;
+ (uint64_t)wf_moduleWarningBackgroundColor;
+ (uint64_t)wf_moduleWarningTitleColor;
+ (uint64_t)wf_modulesViewBodyButtonBackgroundColor;
@end

@implementation UIColor(WorkflowEditor)

+ (uint64_t)wf_moduleWarningTitleColor
{
  return [MEMORY[0x263F825C8] systemRedColor];
}

+ (uint64_t)wf_moduleWarningBackgroundColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_197];
}

+ (uint64_t)wf_moduleSeparatorColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_195];
}

+ (uint64_t)wf_moduleHeadingButtonColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_193];
}

+ (uint64_t)wf_galleryModuleConnectionColor
{
  return [MEMORY[0x263F825C8] colorWithWhite:0.811764717 alpha:1.0];
}

+ (uint64_t)wf_moduleConnectionColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "wf_workflowEditorColorNamed:", @"Connector");
}

+ (uint64_t)wf_moduleCommentHeadingButtonColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_188];
}

+ (uint64_t)wf_moduleCommentParametersBackgroundColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_186];
}

+ (uint64_t)wf_moduleCommentParametersSeparatorColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_184_5342];
}

+ (uint64_t)wf_moduleCommentCellColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_182];
}

+ (uint64_t)wf_moduleCellTitleColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_180];
}

+ (uint64_t)wf_moduleCellBorderColor
{
  return [MEMORY[0x263F825C8] separatorColor];
}

+ (uint64_t)wf_moduleCellRunningColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "wf_workflowEditorColorNamed:", @"ProgressBackground");
}

+ (uint64_t)wf_moduleCellRunningShadowColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_5346];
}

+ (uint64_t)wf_moduleCellShadowColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "wf_workflowEditorColorNamed:", @"ActionShadow");
}

+ (uint64_t)wf_modulesViewBodyButtonBackgroundColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "wf_workflowEditorColorNamed:", @"EditorBodyButtonBackground");
}

+ (uint64_t)wf_moduleCellHighlightedColor
{
  return [MEMORY[0x263F825C8] tableCellDefaultSelectionTintColor];
}

+ (uint64_t)wf_moduleCellColor
{
  return [MEMORY[0x263F825C8] secondarySystemGroupedBackgroundColor];
}

+ (id)wf_moduleBorderColor
{
  v0 = [MEMORY[0x263F825C8] linkColor];
  v1 = [v0 colorWithAlphaComponent:0.8];

  return v1;
}

+ (id)wf_workflowEditorColorNamed:()WorkflowEditor
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [a1 colorNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

@end