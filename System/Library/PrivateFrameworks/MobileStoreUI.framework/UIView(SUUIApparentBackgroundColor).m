@interface UIView(SUUIApparentBackgroundColor)
- (id)suui_apparentBackgroundColor;
@end

@implementation UIView(SUUIApparentBackgroundColor)

- (id)suui_apparentBackgroundColor
{
  id v1 = a1;
  if (v1)
  {
    while (1)
    {
      v2 = [v1 backgroundColor];
      if (objc_msgSend(v2, "suui_isOpaque"))
      {
        v5 = v2;
        goto LABEL_8;
      }
      id v3 = objc_alloc(MEMORY[0x263F825C8]);
      v4 = [v1 layer];
      v5 = objc_msgSend(v3, "initWithCGColor:", objc_msgSend(v4, "backgroundColor"));

      if (objc_msgSend(v5, "suui_isOpaque")) {
        break;
      }
      uint64_t v6 = [v1 superview];

      id v1 = (id)v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

@end