@interface UITableViewCell(NAUIAdditions)
+ (double)naui_estimatedTableRowHeight;
+ (double)naui_tableRowHeight;
+ (id)naui_prototypeCell;
+ (uint64_t)naui_supportsAutoLayout;
@end

@implementation UITableViewCell(NAUIAdditions)

+ (id)naui_prototypeCell
{
  v0 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStyle:0 reuseIdentifier:0];
  return v0;
}

+ (uint64_t)naui_supportsAutoLayout
{
  return 0;
}

+ (double)naui_tableRowHeight
{
  int v1 = objc_msgSend(a1, "naui_supportsAutoLayout");
  double result = *MEMORY[0x263F1D600];
  if (!v1) {
    return 44.0;
  }
  return result;
}

+ (double)naui_estimatedTableRowHeight
{
  int v1 = objc_msgSend(a1, "naui_prototypeCell");
  [v1 updateConstraintsIfNeeded];
  [v1 layoutIfNeeded];
  objc_msgSend(v1, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
  double v3 = v2;

  return v3;
}

@end