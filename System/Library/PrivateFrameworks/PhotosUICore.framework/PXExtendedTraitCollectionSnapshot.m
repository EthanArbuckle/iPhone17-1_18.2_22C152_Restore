@interface PXExtendedTraitCollectionSnapshot
- (CGRect)fullScreenReferenceRect;
- (CGSize)layoutReferenceSize;
- (CGSize)windowReferenceSize;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)peripheryInsets;
- (UIEdgeInsets)safeAreaInsets;
- (double)displayScale;
- (id)_initWithExtendedTraitCollection:(id)a3;
- (int64_t)contentSizeCategory;
- (int64_t)layoutDirection;
- (int64_t)layoutOrientation;
- (int64_t)layoutSizeClass;
- (int64_t)layoutSizeSubclass;
- (int64_t)userInterfaceFeature;
- (int64_t)userInterfaceIdiom;
- (int64_t)userInterfaceLevel;
- (int64_t)userInterfaceStyle;
- (int64_t)windowOrientation;
@end

@implementation PXExtendedTraitCollectionSnapshot

- (CGRect)fullScreenReferenceRect
{
  double x = self->_fullScreenReferenceRect.origin.x;
  double y = self->_fullScreenReferenceRect.origin.y;
  double width = self->_fullScreenReferenceRect.size.width;
  double height = self->_fullScreenReferenceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (CGSize)windowReferenceSize
{
  double width = self->_windowReferenceSize.width;
  double height = self->_windowReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)peripheryInsets
{
  double top = self->_peripheryInsets.top;
  double left = self->_peripheryInsets.left;
  double bottom = self->_peripheryInsets.bottom;
  double right = self->_peripheryInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)layoutSizeSubclass
{
  return self->_layoutSizeSubclass;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (id)_initWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(PXExtendedTraitCollectionSnapshot *)self init];
  if (v5)
  {
    v5->_layoutSizeClass = [v4 layoutSizeClass];
    v5->_layoutSizeSubclass = [v4 layoutSizeSubclass];
    v5->_layoutOrientation = [v4 layoutOrientation];
    v5->_layoutDirection = [v4 layoutDirection];
    v5->_contentSizeCategordouble y = [v4 contentSizeCategory];
    v5->_userInterfaceIdiom = [v4 userInterfaceIdiom];
    v5->_userInterfaceFeature = [v4 userInterfaceFeature];
    [v4 layoutReferenceSize];
    v5->_layoutReferenceSize.double width = v6;
    v5->_layoutReferenceSize.double height = v7;
    [v4 displayScale];
    v5->_displayScale = v8;
    [v4 safeAreaInsets];
    v5->_safeAreaInsets.double top = v9;
    v5->_safeAreaInsets.double left = v10;
    v5->_safeAreaInsets.double bottom = v11;
    v5->_safeAreaInsets.double right = v12;
    [v4 peripheryInsets];
    v5->_peripheryInsets.double top = v13;
    v5->_peripheryInsets.double left = v14;
    v5->_peripheryInsets.double bottom = v15;
    v5->_peripheryInsets.double right = v16;
    [v4 layoutMargins];
    v5->_layoutMargins.double top = v17;
    v5->_layoutMargins.double left = v18;
    v5->_layoutMargins.double bottom = v19;
    v5->_layoutMargins.double right = v20;
    v5->_userInterfaceStyle = [v4 userInterfaceStyle];
    v5->_userInterfaceLevel = [v4 userInterfaceLevel];
    [v4 windowReferenceSize];
    v5->_windowReferenceSize.double width = v21;
    v5->_windowReferenceSize.double height = v22;
    v5->_windowOrientation = [v4 windowOrientation];
    [v4 fullScreenReferenceRect];
    v5->_fullScreenReferenceRect.origin.double x = v23;
    v5->_fullScreenReferenceRect.origin.double y = v24;
    v5->_fullScreenReferenceRect.size.double width = v25;
    v5->_fullScreenReferenceRect.size.double height = v26;
  }

  return v5;
}

@end