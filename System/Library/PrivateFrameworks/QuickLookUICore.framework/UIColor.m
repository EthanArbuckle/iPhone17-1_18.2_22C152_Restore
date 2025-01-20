@interface UIColor
@end

@implementation UIColor

void __50__UIColor__QLUtilities___ql_markupBackgroundColor__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:0];
  v1 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  v7[0] = v0;
  v2 = [MEMORY[0x1E4F428B8] colorWithRed:0.909803922 green:0.909803922 blue:0.909803922 alpha:1.0];
  v7[1] = v1;
  v8[0] = v2;
  v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v8[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  uint64_t v5 = [MEMORY[0x1E4F428B8] _dynamicColorWithColorsByTraitCollection:v4];
  v6 = (void *)_ql_markupBackgroundColor_markupBackgroundColor;
  _ql_markupBackgroundColor_markupBackgroundColor = v5;
}

@end