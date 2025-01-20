@interface _UIFloatableBarButtonItem
- (BOOL)_isFloatable;
- (BOOL)_isFloating;
- (UIView)_configuredFloatableView;
- (UIView)_referenceView;
- (id)description;
- (void)_setConfiguredFloatableView:(id)a3;
- (void)_setFloatable:(BOOL)a3;
- (void)_setFloating:(BOOL)a3;
- (void)_setReferenceView:(id)a3;
@end

@implementation _UIFloatableBarButtonItem

- (void)_setReferenceView:(id)a3
{
}

- (UIView)_referenceView
{
  return self->_referenceView;
}

- (BOOL)_isFloatable
{
  return self->_floatable;
}

- (UIView)_configuredFloatableView
{
  return self->_configuredFloatableView;
}

- (void)_setFloatable:(BOOL)a3
{
  self->_floatable = a3;
}

- (BOOL)_isFloating
{
  return self->_floatable && self->_floating;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFloatableBarButtonItem;
  v3 = [(UIBarButtonItem *)&v7 description];
  v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    if ([(_UIFloatableBarButtonItem *)self _isFloating])
    {
      v6 = @" _isFloating";
    }
    else
    {
      if (!self->_floatable) {
        goto LABEL_2;
      }
      v6 = @" _floatable";
    }
    [v4 appendString:v6];
  }
LABEL_2:
  return v4;
}

- (void)_setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (void)_setConfiguredFloatableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_configuredFloatableView, 0);
}

@end