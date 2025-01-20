@interface PUImportOneUpViewControllerSpec
- (BOOL)allowsInterfaceRotation;
- (CGSize)selectionBadgeSize;
- (PUImportOneUpViewControllerSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PUImportOneUpViewControllerSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5;
- (UIOffset)selectionBadgeOffset;
- (double)interItemSpacing;
- (unint64_t)selectionBadgeCorner;
- (unint64_t)style;
@end

@implementation PUImportOneUpViewControllerSpec

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)allowsInterfaceRotation
{
  return self->_allowsInterfaceRotation;
}

- (unint64_t)selectionBadgeCorner
{
  return self->_selectionBadgeCorner;
}

- (UIOffset)selectionBadgeOffset
{
  double horizontal = self->_selectionBadgeOffset.horizontal;
  double vertical = self->_selectionBadgeOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (CGSize)selectionBadgeSize
{
  double width = self->_selectionBadgeSize.width;
  double height = self->_selectionBadgeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (PUImportOneUpViewControllerSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  v19.receiver = self;
  v19.super_class = (Class)PUImportOneUpViewControllerSpec;
  v6 = [(PXFeatureSpec *)&v19 initWithExtendedTraitCollection:a3 options:a4];
  v7 = v6;
  if (v6)
  {
    v6->_style = a5;
    double v8 = 0.0;
    if (!a5)
    {
      int v9 = PLIsTallScreen();
      double v8 = 15.0;
      if (v9) {
        double v8 = 10.0;
      }
    }
    v7->_interItemSpacing = v8;
    v10 = objc_msgSend(MEMORY[0x1E4FB1EB0], "px_circularGlyphViewWithName:backgroundColor:", @"circle", 0);
    [v10 bounds];
    v7->_selectionBadgeSize.double width = v11;
    v7->_selectionBadgeSize.double height = v12;
    __asm { FMOV            V0.2D, #6.0 }
    v7->_selectionBadgeOffset = _Q0;
    v7->_selectionBadgeCorner = 8;
    v7->_allowsInterfaceRotation = 0;
  }
  return v7;
}

- (PUImportOneUpViewControllerSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PUImportOneUpViewControllerSpec *)self initWithExtendedTraitCollection:a3 options:a4 style:0];
}

@end