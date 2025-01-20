@interface SearchUICalendarColorGenerator
- (int)defaultTintStyle;
- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SearchUICalendarColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(SearchUIColorGenerator *)self sfColor];
  v8 = [v7 eventIdentifier];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SearchUICalendarColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v10[3] = &unk_1E6E72910;
  BOOL v12 = a3;
  id v11 = v6;
  id v9 = v6;
  +[SearchUICalendarStore fetchCalendarItemFromEventIdentifier:v8 completionHandler:v10];
}

void __75__SearchUICalendarColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [a2 calendar];
  uint64_t v4 = [v3 CGColor];

  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] colorWithCGColor:v4];
    id v6 = CUIKAdjustedColorForColor();

    v7 = [v6 colorWithAlphaComponent:0.9];

    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      v11[0] = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

      return;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
  }
  v10 = *(void (**)(uint64_t, void))(v8 + 16);
  v10(v8, 0);
}

- (int)defaultTintStyle
{
  return 1;
}

@end