@interface UITableViewCell(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UITableViewCell(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v11 = a3;
  v4 = [v11 foregroundColor];
  [a1 setBackgroundColor:v4];

  v5 = [a1 textLabel];
  PKAppearanceApplyToContainer(v11, v5);

  v6 = [a1 textLabel];
  v7 = [v11 textColor];
  [v6 setTextColor:v7];

  if ([a1 style] == 1000)
  {
    v8 = [a1 editableTextField];
    PKAppearanceApplyToContainer(v11, v8);
  }
  else
  {
    v9 = [a1 detailTextLabel];
    PKAppearanceApplyToContainer(v11, v9);

    v8 = [a1 detailTextLabel];
    v10 = [v11 altTextColor];
    [v8 setTextColor:v10];
  }
}

@end