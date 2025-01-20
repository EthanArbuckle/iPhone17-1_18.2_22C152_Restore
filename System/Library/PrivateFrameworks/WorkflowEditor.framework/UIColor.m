@interface UIColor
@end

@implementation UIColor

id __58__UIColor_WorkflowEditor__wf_moduleWarningBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 userInterfaceStyle] == 2;
  v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.23137255 blue:0.188235298 alpha:dbl_234B79640[v2]];
  return v3;
}

id __50__UIColor_WorkflowEditor__wf_moduleSeparatorColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    BOOL v2 = [MEMORY[0x263F851A8] colorWithRGBAValue:960052223];
    v3 = [v2 UIColor];
  }
  else
  {
    v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.140000001];
  }
  return v3;
}

id __54__UIColor_WorkflowEditor__wf_moduleHeadingButtonColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.278431386;
    double v3 = 0.282352954;
  }
  else
  {
    double v2 = 0.87843138;
    double v3 = 0.890196085;
  }
  v4 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v2 blue:v3 alpha:1.0];
  return v4;
}

id __61__UIColor_WorkflowEditor__wf_moduleCommentHeadingButtonColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.372549027;
    double v3 = 0.352941185;
    double v4 = 0.313725501;
    double v5 = 1.0;
  }
  else
  {
    double v2 = 0.87843138;
    double v4 = 0.890196085;
    double v5 = 1.0;
    double v3 = 0.87843138;
  }
  v6 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v3 blue:v4 alpha:v5];
  return v6;
}

id __68__UIColor_WorkflowEditor__wf_moduleCommentParametersBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.164705887;
    double v3 = 0.141176477;
    double v4 = 0.0862745121;
  }
  else
  {
    double v2 = 0.984313726;
    double v3 = 0.960784316;
    double v4 = 0.909803927;
  }
  double v5 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];
  return v5;
}

id __67__UIColor_WorkflowEditor__wf_moduleCommentParametersSeparatorColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.164705887;
    double v3 = 0.141176477;
    double v4 = 0.0862745121;
  }
  else
  {
    double v2 = 0.913725495;
    double v3 = 0.827450991;
    double v4 = 0.631372571;
  }
  double v5 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];
  return v5;
}

id __52__UIColor_WorkflowEditor__wf_moduleCommentCellColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.164705887;
    double v3 = 0.141176477;
    double v4 = 0.0862745121;
  }
  else
  {
    double v2 = 0.972549021;
    double v3 = 0.925490201;
    double v4 = 0.819607854;
  }
  double v5 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v3 blue:v4 alpha:1.0];
  return v5;
}

id __50__UIColor_WorkflowEditor__wf_moduleCellTitleColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.596078455;
    double v3 = 0.600000024;
  }
  else
  {
    double v2 = 0.580392182;
    double v3 = 0.588235319;
  }
  double v4 = [MEMORY[0x263F825C8] colorWithRed:v2 green:v2 blue:v3 alpha:1.0];
  return v4;
}

id __58__UIColor_WorkflowEditor__wf_moduleCellRunningShadowColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = [MEMORY[0x263F825C8] clearColor];
  }
  else
  {
    double v3 = [MEMORY[0x263F851A8] colorWithP3RGBAValue:413675775];
    double v4 = [v3 UIColor];
    double v2 = [v4 colorWithAlphaComponent:0.200000003];
  }
  return v2;
}

@end