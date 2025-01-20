@interface UITableViewCell
+ (double)safari_defaultHeightOfTrivialInstance;
- (void)safari_setCompletionIcon:(void *)a1;
- (void)safari_setLinkedPageTitle:(uint64_t)a3 URL:;
- (void)safari_setLinkedPageTitle:(uint64_t)a3 description:;
@end

@implementation UITableViewCell

+ (double)safari_defaultHeightOfTrivialInstance
{
  v0 = (objc_class *)self;
  v1 = (void *)safari_defaultHeightOfTrivialInstance_cellForMeasurement;
  if (!safari_defaultHeightOfTrivialInstance_cellForMeasurement)
  {
    uint64_t v2 = [[v0 alloc] initWithStyle:3 reuseIdentifier:0];
    v3 = (void *)safari_defaultHeightOfTrivialInstance_cellForMeasurement;
    safari_defaultHeightOfTrivialInstance_cellForMeasurement = v2;

    v1 = (void *)safari_defaultHeightOfTrivialInstance_cellForMeasurement;
  }
  objc_msgSend(v1, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v4;
}

- (void)safari_setLinkedPageTitle:(uint64_t)a3 description:
{
  if (a1) {
    return objc_msgSend(a1, "_safari_setLinkedPageTitle:description:", a2, a3);
  }
  return a1;
}

- (void)safari_setLinkedPageTitle:(uint64_t)a3 URL:
{
  if (a1) {
    return objc_msgSend(a1, "_safari_setLinkedPageTitle:URL:", a2, a3);
  }
  return a1;
}

- (void)safari_setCompletionIcon:(void *)a1
{
  if (a1)
  {
    id v8 = [a1 imageView];
    v3 = (void *)MEMORY[0x1E4FB1818];
    double v4 = systemImageNameForCompletionIcon(a2);
    v5 = [v3 systemImageNamed:v4];
    [v8 setImage:v5];

    v6 = [MEMORY[0x1E4FB1618] labelColor];
    [v8 setTintColor:v6];

    v7 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
    [v8 setPreferredSymbolConfiguration:v7];
  }
}

@end