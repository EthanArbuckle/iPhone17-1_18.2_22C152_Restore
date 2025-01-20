@interface MSTrackListLoadMoreCellConfiguration
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3;
- (void)reloadLayoutInformation;
@end

@implementation MSTrackListLoadMoreCellConfiguration

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  double v7 = v6 + -10.0 + -5.0;
  uint64_t v8 = [a4 unmodifiedTitle];
  objc_msgSend(a3, "sizeForString:font:constrainedToSize:", v8, objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 14.0), v7, 1.79769313e308);
  return v9 + 26.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (a4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MSTrackListLoadMoreCellConfiguration;
    return -[SULoadMoreMediaCellConfiguration colorForLabelAtIndex:withModifiers:](&v6, sel_colorForLabelAtIndex_withModifiers_, a3);
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1C550];
    return (id)objc_msgSend(v5, "blackColor", a3);
  }
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", a3, 14.0);
}

- (void)reloadLayoutInformation
{
  if ((*(void **)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F896F8]))[1])
  {
    uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F896F0]);
    *(_OWORD *)(v2 + 32) = xmmword_23791B210;
    v3 = (double *)((char *)self + (int)*MEMORY[0x263F89708]);
    double v4 = v3[1] + -26.0;
    *(double *)(v2 + 48) = *v3 + -5.0 + -10.0;
    *(double *)(v2 + 56) = v4;
  }
}

- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3
{
  return 1;
}

@end