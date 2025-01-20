@interface NABarButtonItem
- (NABarButtonItem)init;
- (UIBarButtonItem)barButtonItem;
- (UIEdgeInsets)additionalPageContentInset;
@end

@implementation NABarButtonItem

- (UIBarButtonItem)barButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___NABarButtonItem_barButtonItem));
}

- (UIEdgeInsets)additionalPageContentInset
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___NABarButtonItem_additionalPageContentInset);
  double v3 = *(double *)&self->barButtonItem[OBJC_IVAR___NABarButtonItem_additionalPageContentInset];
  double v4 = *(double *)&self->additionalPageContentInset[OBJC_IVAR___NABarButtonItem_additionalPageContentInset];
  double v5 = *(double *)&self->additionalPageContentInset[OBJC_IVAR___NABarButtonItem_additionalPageContentInset + 8];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NABarButtonItem)init
{
  UIEdgeInsets result = (NABarButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end