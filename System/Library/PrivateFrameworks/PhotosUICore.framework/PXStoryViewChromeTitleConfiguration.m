@interface PXStoryViewChromeTitleConfiguration
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (PXStoryViewChromeTitleConfiguration)init;
- (PXStoryViewChromeTitleConfiguration)initWithTextAlignment:(int64_t)a3 margins:(UIEdgeInsets)a4;
- (PXStoryViewChromeTitleConfiguration)initWithTextAlignment:(int64_t)a3 margins:(UIEdgeInsets)a4 hidden:(BOOL)a5;
- (UIEdgeInsets)margins;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)textAlignment;
- (unint64_t)hash;
- (void)setHidden:(BOOL)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation PXStoryViewChromeTitleConfiguration

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PXStoryViewChromeTitleConfiguration *)self hidden];
  return v3 | (2 * [(PXStoryViewChromeTitleConfiguration *)self textAlignment]);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(PXStoryViewChromeTitleConfiguration *)self textAlignment];
    if (v6 == [v5 textAlignment])
    {
      [(PXStoryViewChromeTitleConfiguration *)self margins];
      [v5 margins];
      PXEdgeInsetsEqualToEdgeInsets();
    }
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(PXStoryViewChromeTitleConfiguration *)self textAlignment];
  [(PXStoryViewChromeTitleConfiguration *)self margins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(PXStoryViewChromeTitleConfiguration *)self hidden];
  return (id)objc_msgSend(v4, "initWithTextAlignment:margins:hidden:", v5, v14, v7, v9, v11, v13);
}

- (PXStoryViewChromeTitleConfiguration)initWithTextAlignment:(int64_t)a3 margins:(UIEdgeInsets)a4 hidden:(BOOL)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryViewChromeTitleConfiguration;
  UIEdgeInsets result = [(PXStoryViewChromeTitleConfiguration *)&v12 init];
  if (result)
  {
    result->_textAlignment = a3;
    result->_margins.CGFloat top = top;
    result->_margins.CGFloat left = left;
    result->_margins.CGFloat bottom = bottom;
    result->_margins.CGFloat right = right;
    result->_hidden = a5;
  }
  return result;
}

- (PXStoryViewChromeTitleConfiguration)initWithTextAlignment:(int64_t)a3 margins:(UIEdgeInsets)a4
{
  return -[PXStoryViewChromeTitleConfiguration initWithTextAlignment:margins:hidden:](self, "initWithTextAlignment:margins:hidden:", a3, 0, a4.top, a4.left, a4.bottom, a4.right);
}

- (PXStoryViewChromeTitleConfiguration)init
{
  return -[PXStoryViewChromeTitleConfiguration initWithTextAlignment:margins:](self, "initWithTextAlignment:margins:", 1, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

@end