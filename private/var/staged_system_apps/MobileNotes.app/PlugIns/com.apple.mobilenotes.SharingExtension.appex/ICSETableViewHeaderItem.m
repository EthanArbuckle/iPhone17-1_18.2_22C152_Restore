@interface ICSETableViewHeaderItem
+ (id)headerItemWithAccount:(id)a3;
- (BOOL)isChecked;
- (BOOL)isHeader;
- (BOOL)isSelectable;
- (UIColor)backgroundColor;
- (double)cellHeight;
- (unint64_t)headerType;
- (void)setHeaderType:(unint64_t)a3;
@end

@implementation ICSETableViewHeaderItem

- (BOOL)isHeader
{
  return 1;
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isChecked
{
  return 0;
}

- (double)cellHeight
{
  unint64_t v2 = [(ICSETableViewHeaderItem *)self headerType];
  if (v2 > 2) {
    return 32.0;
  }
  v3 = (double *)((char *)&unk_1000CB6E8 + 8 * v2);
  int v4 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  v5 = (double *)&UITableViewAutomaticDimension;
  if (!v4) {
    v5 = v3;
  }
  return *v5;
}

- (UIColor)backgroundColor
{
  v3 = +[UIColor clearColor];
  unint64_t v4 = [(ICSETableViewHeaderItem *)self headerType];
  if (v4 == 1)
  {
    uint64_t v5 = +[UIColor systemGroupedBackgroundColor];
  }
  else
  {
    if (v4 != 2) {
      goto LABEL_6;
    }
    uint64_t v5 = +[UIColor tertiarySystemGroupedBackgroundColor];
  }
  v6 = (void *)v5;

  v3 = v6;
LABEL_6:

  return (UIColor *)v3;
}

+ (id)headerItemWithAccount:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(ICSETableViewHeaderItem);
  [(ICSETableViewHeaderItem *)v4 setHeaderType:1];
  uint64_t v5 = [v3 accountName];
  v6 = [v5 localizedUppercaseString];
  [(ICSETableViewItem *)v4 setTitle:v6];

  [(ICSETableViewItem *)v4 setAccount:v3];

  return v4;
}

- (unint64_t)headerType
{
  return self->_headerType;
}

- (void)setHeaderType:(unint64_t)a3
{
  self->_headerType = a3;
}

@end