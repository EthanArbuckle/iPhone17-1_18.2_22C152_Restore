@interface SFUnifiedTabBarPointerRegionIdentifier
- (BOOL)isEqual:(id)a3;
- (UIView)viewForPreview;
- (unint64_t)pointerStyle;
- (void)setPointerStyle:(unint64_t)a3;
- (void)setViewForPreview:(id)a3;
@end

@implementation SFUnifiedTabBarPointerRegionIdentifier

- (BOOL)isEqual:(id)a3
{
  v4 = (SFUnifiedTabBarPointerRegionIdentifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_pointerStyle == v4->_pointerStyle
      && self->_viewForPreview == v4->_viewForPreview;
  }

  return v5;
}

- (unint64_t)pointerStyle
{
  return self->_pointerStyle;
}

- (void)setPointerStyle:(unint64_t)a3
{
  self->_pointerStyle = a3;
}

- (UIView)viewForPreview
{
  return self->_viewForPreview;
}

- (void)setViewForPreview:(id)a3
{
}

- (void).cxx_destruct
{
}

@end