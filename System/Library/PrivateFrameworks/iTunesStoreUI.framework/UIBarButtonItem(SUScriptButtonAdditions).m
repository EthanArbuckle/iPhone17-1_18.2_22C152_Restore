@interface UIBarButtonItem(SUScriptButtonAdditions)
- (uint64_t)configureFromScriptButton:()SUScriptButtonAdditions;
@end

@implementation UIBarButtonItem(SUScriptButtonAdditions)

- (uint64_t)configureFromScriptButton:()SUScriptButtonAdditions
{
  objc_msgSend(a1, "setEnabled:", objc_msgSend(a3, "enabled"));
  [a3 image];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [a3 image];
  }
  [a1 setImage:v5];
  [a3 imageEdgeInsets];
  objc_msgSend(a1, "setImageInsets:");
  uint64_t v6 = [a3 style];
  uint64_t v7 = 0;
  while (![(id)__BarButtonStyles[v7 + 1] isEqualToString:v6])
  {
    v7 += 2;
    if (v7 == 8)
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v8 = __BarButtonStyles[v7];
LABEL_9:
  [a1 setStyle:v8];
  [a3 title];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = [a3 title];
  }
  [a1 setTitle:v9];
  uint64_t result = [a3 tag];
  if (result)
  {
    return [a1 setTag:result];
  }
  return result;
}

@end