@interface SULoadMoreMediaCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (SULoadMoreMediaCellConfiguration)init;
- (double)previousCellHeight;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (void)reloadLayoutInformation;
- (void)reloadStrings;
- (void)setPreviousCellHeight:(double)a3;
@end

@implementation SULoadMoreMediaCellConfiguration

- (SULoadMoreMediaCellConfiguration)init
{
  return [(SUArrayCellConfiguration *)self initWithStringCount:2 imageCount:0];
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 56.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a4) {
    return (id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor", a3);
  }
  if ((a4 & 2) != 0)
  {
    v4 = (void *)MEMORY[0x263F1C550];
  }
  else
  {
    v4 = (void *)MEMORY[0x263F1C550];
    if (a3 == 1) {
      return (id)[MEMORY[0x263F1C550] colorWithRed:0.0 green:0.321568627 blue:0.91372549 alpha:1.0];
    }
  }
  return (id)objc_msgSend(v4, "grayColor", a3);
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  if (!a3) {
    return (id)[MEMORY[0x263F1C658] systemFontOfSize:14.0];
  }
  if (*self->super.super.super._strings) {
    double v3 = 18.0;
  }
  else {
    double v3 = 14.0;
  }
  return (id)[MEMORY[0x263F1C658] boldSystemFontOfSize:v3];
}

- (void)reloadLayoutInformation
{
  double v3 = self->super.super.super.super._layoutSize.width + -5.0;
  double previousCellHeight = self->_previousCellHeight;
  if (previousCellHeight >= 0.00000011920929) {
    double v5 = previousCellHeight + 10.0 + -4.0;
  }
  else {
    double v5 = 10.0;
  }
  id v6 = *self->super.super.super._strings;
  if (*((void *)self->super.super.super._strings + 1))
  {
    double height = self->super.super.super.super._layoutSize.height;
    stringFrames = self->super.super.super._stringFrames;
    double v9 = v3 - v5;
    stringFrames[1].origin.x = v5;
    if (!v6)
    {
      p_double height = (void *)&stringFrames[1].size.height;
      stringFrames[1].origin.y = floor((height + -16.0) * 0.5);
      stringFrames[1].size.width = v9;
      goto LABEL_11;
    }
    v14.origin.y = floor((height + -35.0) * 0.5);
    stringFrames[1].origin.y = v14.origin.y;
    stringFrames[1].size.width = v9;
    stringFrames[1].size.double height = 20.0;
    v14.size.double height = 20.0;
    v14.origin.x = v5;
    v14.size.width = v9;
    CGFloat MaxY = CGRectGetMaxY(v14);
    v11 = self->super.super.super._stringFrames;
    v11->origin.x = v5;
    v11->origin.y = MaxY + -1.0;
    v11->size.width = v9;
  }
  else
  {
    if (!v6) {
      return;
    }
    v11 = self->super.super.super._stringFrames;
    CGFloat v12 = floor((self->super.super.super.super._layoutSize.height + -16.0) * 0.5);
    v11->origin.x = v5;
    v11->origin.y = v12;
    v11->size.width = v3 - v5;
  }
  p_double height = (void *)&v11->size.height;
LABEL_11:
  *p_double height = 0x4030000000000000;
}

- (void)reloadStrings
{
  double v3 = (void *)[self->super.super.super.super._representedObject title];

  id v4 = (id)[v3 length];
  if (v4) {
    id v4 = v3;
  }
  *((void *)self->super.super.super._strings + 1) = v4;
  if ([self->super.super.super.super._representedObject representedItemCount] < 0) {
    double v5 = 0;
  }
  else {
    double v5 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SEARCH_TOTAL", &stru_26DB8C5F8, 0), objc_msgSend(self->super.super.super.super._representedObject, "representedItemCount"));
  }

  id v6 = (id)[v5 length];
  if (v6) {
    id v6 = v5;
  }
  *self->super.super.super._strings = v6;
}

- (double)previousCellHeight
{
  return self->_previousCellHeight;
}

- (void)setPreviousCellHeight:(double)a3
{
  self->_double previousCellHeight = a3;
}

@end