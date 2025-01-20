@interface _UIColorPalette(TextInputUI)
+ (id)_tui_coolColors:()TextInputUI;
+ (id)_tui_intelligenceAmbientPaletteWithStartColor:()TextInputUI endColor:;
+ (id)_tui_warmColors:()TextInputUI;
- (id)_tui_scaledColorSpaceForAmbientText;
@end

@implementation _UIColorPalette(TextInputUI)

- (id)_tui_scaledColorSpaceForAmbientText
{
  id v2 = objc_alloc(MEMORY[0x1E4FB2058]);
  v3 = [a1 colors];
  v4 = [a1 colorSpaceName];
  v5 = (void *)[v2 initWithColors:v3 locations:&unk_1EDC79AE8 colorSpaceName:v4];

  return v5;
}

+ (id)_tui_intelligenceAmbientPaletteWithStartColor:()TextInputUI endColor:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
  v9 = v8;
  if (v6) {
    [v8 addObject:v6];
  }
  v10 = objc_msgSend(a1, "_tui_warmColors:", 1);
  [v9 addObjectsFromArray:v10];

  v11 = objc_msgSend(a1, "_tui_coolColors:", 1);
  [v9 addObjectsFromArray:v11];

  if (v7) {
    [v9 addObject:v7];
  }
  v12 = (void *)[objc_alloc((Class)a1) initWithColors:v9];

  return v12;
}

+ (id)_tui_coolColors:()TextInputUI
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.821 green:0.606 blue:0.98 alpha:1.0];
    v9[0] = v3;
    v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.371 green:0.738 blue:0.987 alpha:1.0];
    v9[1] = v4;
    v5 = v9;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.768 green:0.364 blue:0.909 alpha:1.0];
    v8[0] = v3;
    v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.337 green:0.756 blue:1.0 alpha:1.0];
    v8[1] = v4;
    v5 = v8;
  }
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v6;
}

+ (id)_tui_warmColors:()TextInputUI
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.928 green:0.672 blue:0.319 alpha:1.0];
    v9[0] = v3;
    v4 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.537 blue:0.637 alpha:1.0];
    v9[1] = v4;
    v5 = v9;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.56 blue:0.011 alpha:1.0];
    v8[0] = v3;
    v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.933 green:0.227 blue:0.498 alpha:1.0];
    v8[1] = v4;
    v5 = v8;
  }
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v6;
}

@end