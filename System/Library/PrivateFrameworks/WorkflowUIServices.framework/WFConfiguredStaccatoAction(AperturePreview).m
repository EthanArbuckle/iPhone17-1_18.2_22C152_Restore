@interface WFConfiguredStaccatoAction(AperturePreview)
- (WFApertureIconView)leadingApertureView;
- (WFApertureIconView)trailingApertureView;
@end

@implementation WFConfiguredStaccatoAction(AperturePreview)

- (WFApertureIconView)trailingApertureView
{
  v2 = [a1 sectionIdentifier];
  int v3 = [v2 isEqualToString:@"Accessibility"];

  if (v3)
  {
    v4 = +[WFStaccatoPreviewViewProvider secondarySymbolForConfiguredAction:a1];
    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x263F85438]);
      v6 = [MEMORY[0x263F851A8] whiteColor];
      v7 = (void *)[v5 initWithSymbolName:v4 symbolColor:v6];

      v8 = [[WFApertureIconView alloc] initWithIcon:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (WFApertureIconView)leadingApertureView
{
  v2 = [WFApertureIconView alloc];
  int v3 = [a1 previewIcon];
  v4 = [(WFApertureIconView *)v2 initWithIcon:v3];

  id v5 = [a1 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F85818]];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F825C8] systemRedColor];
  }
  else
  {
    v8 = [a1 identifier];
    int v9 = [v8 isEqualToString:*MEMORY[0x263F85A30]];

    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v7 = [MEMORY[0x263F825C8] colorWithRed:0.196 green:0.678 blue:0.843 alpha:1.0];
  }
  v10 = (void *)v7;
  [(WFApertureIconView *)v4 setKeyColorOverride:v7];

LABEL_6:
  return v4;
}

@end