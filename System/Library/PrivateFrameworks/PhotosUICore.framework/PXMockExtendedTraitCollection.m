@interface PXMockExtendedTraitCollection
- (CGSize)layoutReferenceSize;
- (PXMockExtendedTraitCollection)initWithFormFactor:(int64_t)a3 orientation:(int64_t)a4 visibleChromeElements:(unint64_t)a5;
- (PXMockExtendedTraitCollection)initWithLayoutSizeClass:(int64_t)a3;
- (PXMockExtendedTraitCollection)initWithViewController:(id)a3;
- (UIEdgeInsets)safeAreaInsets;
- (double)displayScale;
- (int64_t)contentSizeCategory;
- (int64_t)formFactor;
- (int64_t)layoutOrientation;
- (int64_t)layoutSizeClass;
- (int64_t)layoutSizeSubclass;
- (int64_t)userInterfaceIdiom;
- (int64_t)windowOrientation;
- (unint64_t)visibleChromeElements;
- (void)_invalidateLayoutReferenceSizeAndDisplayScale;
- (void)_invalidateLayoutSizeClass;
- (void)_invalidateSafeAreaInsets;
- (void)_setNeedsUpdate;
- (void)_updateLayoutReferenceSizeAndDisplayScale;
- (void)_updateLayoutSizeClass;
- (void)_updateSafeAreaInsets;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setContentSizeCategory:(int64_t)a3;
- (void)setDisplayScale:(double)a3;
- (void)setFormFactor:(int64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLayoutReferenceSize:(CGSize)a3;
- (void)setLayoutSizeClass:(int64_t)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)setVisibleChromeElements:(unint64_t)a3;
- (void)setWindowOrientation:(int64_t)a3;
@end

@implementation PXMockExtendedTraitCollection

- (void).cxx_destruct
{
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
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

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (unint64_t)visibleChromeElements
{
  return self->_visibleChromeElements;
}

- (int64_t)formFactor
{
  return self->_formFactor;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (void)_updateSafeAreaInsets
{
  int64_t v4 = [(PXMockExtendedTraitCollection *)self formFactor];
  if (v4)
  {
    unint64_t v5 = v4;
    int64_t v6 = [(PXMockExtendedTraitCollection *)self layoutOrientation];
    double v7 = 0.0;
    double v8 = NAN;
    double v9 = 20.0;
    double v10 = NAN;
    double v11 = 44.0;
    if (v6 == 1) {
      double v10 = 44.0;
    }
    else {
      double v11 = 0.0;
    }
    if (((1 << v5) & 0x70) == 0)
    {
      double v10 = NAN;
      double v11 = 0.0;
    }
    if (((1 << v5) & 0xF8E) != 0)
    {
      double v12 = 0.0;
    }
    else
    {
      double v9 = v10;
      double v12 = v11;
    }
    if (v5 <= 0xB) {
      double v13 = v9;
    }
    else {
      double v13 = NAN;
    }
    if (v5 <= 0xB) {
      double v14 = v12;
    }
    else {
      double v14 = 0.0;
    }
    double v15 = NAN;
    if (v5 <= 0xB)
    {
      if (((1 << v5) & 0x58E) != 0)
      {
        double v15 = 49.0;
      }
      else if (((1 << v5) & 0x70) != 0)
      {
        if (v6 == 1) {
          double v15 = 83.0;
        }
        else {
          double v15 = NAN;
        }
        double v8 = 34.0;
        double v9 = 0.0;
        if (v6 == 1) {
          double v7 = 34.0;
        }
        else {
          double v7 = 0.0;
        }
      }
      else if (((1 << v5) & 0xA00) != 0)
      {
        double v15 = 65.0;
      }
    }
    double v16 = *((double *)off_1E5DAAF10 + 1);
    double v17 = *((double *)off_1E5DAAF10 + 3);
    unint64_t v18 = [(PXMockExtendedTraitCollection *)self visibleChromeElements];
    unint64_t v19 = v18;
    if (v18) {
      double v20 = v13;
    }
    else {
      double v20 = v14;
    }
    double v21 = NAN;
    if ((v18 & 2) != 0) {
      double v22 = NAN;
    }
    else {
      double v22 = v20;
    }
    if ((v18 & 4) != 0)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v26.double top = v22;
      v26.double left = v16;
      v26.double bottom = NAN;
      v26.double right = v17;
      v24 = NSStringFromUIEdgeInsets(v26);
      [v23 handleFailureInMethod:a2, self, @"PXMockExtendedTraitCollection.m", 495, @"unknown value for chrome elements %li form factor %li (%@)", v19, v5, v24 object file lineNumber description];
    }
    else if ((v18 & 8) != 0)
    {
      double v21 = v15;
    }
    else
    {
      double v21 = v7;
    }
    -[PXMockExtendedTraitCollection setSafeAreaInsets:](self, "setSafeAreaInsets:", v22, v16, v21, v17);
  }
}

- (void)_invalidateSafeAreaInsets
{
}

- (void)_updateLayoutReferenceSizeAndDisplayScale
{
  switch([(PXMockExtendedTraitCollection *)self formFactor])
  {
    case 0:
      unint64_t v8 = [(PXMockExtendedTraitCollection *)self layoutSizeClass];
      if (v8 >= 3)
      {
        double v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"PXMockExtendedTraitCollection.m" lineNumber:336 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      double v6 = dbl_1AB35B0B8[v8];
      double v5 = dbl_1AB35B0D0[v8];
      double v4 = 2.0;
      break;
    case 1:
      double v4 = 2.0;
      double v5 = 320.0;
      double v6 = 568.0;
      break;
    case 2:
      double v4 = 2.0;
      double v5 = 375.0;
      double v6 = 667.0;
      break;
    case 3:
      double v4 = 3.0;
      double v5 = 414.0;
      *(double *)&uint64_t v7 = 736.0;
      goto LABEL_16;
    case 4:
      double v4 = 3.0;
      double v5 = 375.0;
      double v6 = 812.0;
      break;
    case 5:
      double v4 = 2.0;
      goto LABEL_15;
    case 6:
      double v4 = 3.0;
LABEL_15:
      double v5 = 414.0;
      *(double *)&uint64_t v7 = 896.0;
      goto LABEL_16;
    case 7:
      double v4 = 2.0;
      double v5 = 768.0;
      *(double *)&uint64_t v7 = 1024.0;
LABEL_16:
      double v6 = *(double *)&v7;
      break;
    case 8:
      double v4 = 2.0;
      double v5 = 834.0;
      double v6 = 1112.0;
      break;
    case 9:
      double v4 = 2.0;
      double v5 = 834.0;
      double v6 = 1194.0;
      break;
    case 10:
    case 11:
      double v4 = 2.0;
      double v5 = 1024.0;
      double v6 = 1366.0;
      break;
    case 12:
      double v4 = 2.0;
      double v5 = 1680.0;
      double v6 = 1050.0;
      break;
    case 13:
      double v4 = 1.0;
      double v5 = 1920.0;
      double v6 = 1080.0;
      break;
    default:
      double v4 = 0.0;
      double v6 = 0.0;
      double v5 = 0.0;
      break;
  }
  if (v5 >= v6) {
    double v9 = v5;
  }
  else {
    double v9 = v6;
  }
  if (v5 >= v6) {
    double v10 = v6;
  }
  else {
    double v10 = v5;
  }
  int64_t v11 = [(PXMockExtendedTraitCollection *)self layoutOrientation];
  if (v11 == 1)
  {
    double v12 = v10;
    double v10 = v9;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_28;
    }
    double v12 = v9;
  }
  -[PXMockExtendedTraitCollection setLayoutReferenceSize:](self, "setLayoutReferenceSize:", v12, v10);
LABEL_28:
  [(PXMockExtendedTraitCollection *)self setDisplayScale:v4];
}

- (void)_invalidateLayoutReferenceSizeAndDisplayScale
{
}

- (void)_updateLayoutSizeClass
{
  if ([(PXMockExtendedTraitCollection *)self layoutOrientation])
  {
    unint64_t v3 = [(PXMockExtendedTraitCollection *)self formFactor] - 1;
    if (v3 <= 0xC)
    {
      uint64_t v4 = qword_1AB35B050[v3];
      [(PXMockExtendedTraitCollection *)self setLayoutSizeClass:v4];
    }
  }
}

- (void)_invalidateLayoutSizeClass
{
}

- (void)setWindowOrientation:(int64_t)a3
{
  if (self->_windowOrientation != a3)
  {
    self->_windowOrientation = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:0x40000];
  }
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
}

- (void)setContentSizeCategory:(int64_t)a3
{
  if (self->_contentSizeCategory != a3)
  {
    self->_contentSizeCategory = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:2048];
  }
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:32];
  }
}

- (void)setVisibleChromeElements:(unint64_t)a3
{
  if (self->_visibleChromeElements != a3)
  {
    self->_visibleChromeElements = a3;
    [(PXMockExtendedTraitCollection *)self _invalidateSafeAreaInsets];
  }
}

- (void)setFormFactor:(int64_t)a3
{
  if (self->_formFactor != a3)
  {
    self->_formFactor = a3;
    [(PXMockExtendedTraitCollection *)self _invalidateLayoutSizeClass];
    [(PXMockExtendedTraitCollection *)self _invalidateLayoutReferenceSizeAndDisplayScale];
    [(PXMockExtendedTraitCollection *)self _invalidateSafeAreaInsets];
  }
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  if (self->_userInterfaceIdiom != a3)
  {
    self->_userInterfaceIdiom = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:64];
  }
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  if (a3.width != self->_layoutReferenceSize.width || a3.height != self->_layoutReferenceSize.height)
  {
    self->_layoutReferenceSize = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:16];
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:8];
    [(PXMockExtendedTraitCollection *)self _invalidateLayoutSizeClass];
    [(PXMockExtendedTraitCollection *)self _invalidateLayoutReferenceSizeAndDisplayScale];
    [(PXMockExtendedTraitCollection *)self _invalidateSafeAreaInsets];
  }
}

- (void)setLayoutSizeClass:(int64_t)a3
{
  if (self->_layoutSizeClass != a3)
  {
    self->_layoutSizeClass = a3;
    [(PXMockExtendedTraitCollection *)self signalChange:2];
    [(PXMockExtendedTraitCollection *)self _invalidateLayoutReferenceSizeAndDisplayScale];
    [(PXMockExtendedTraitCollection *)self _invalidateSafeAreaInsets];
  }
}

- (void)_setNeedsUpdate
{
}

- (int64_t)layoutSizeSubclass
{
  return 2;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXMockExtendedTraitCollection;
  [(PXExtendedTraitCollection *)&v3 didPerformChanges];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXMockExtendedTraitCollection;
  [(PXMockExtendedTraitCollection *)&v3 performChanges:a3];
}

- (PXMockExtendedTraitCollection)initWithFormFactor:(int64_t)a3 orientation:(int64_t)a4 visibleChromeElements:(unint64_t)a5
{
  unint64_t v8 = [(PXMockExtendedTraitCollection *)self initWithViewController:0];
  double v9 = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__PXMockExtendedTraitCollection_initWithFormFactor_orientation_visibleChromeElements___block_invoke;
    v11[3] = &__block_descriptor_56_e48_v16__0___PXMockMutableExtendedTraitCollection__8l;
    v11[4] = a3;
    v11[5] = a4;
    v11[6] = a5;
    [(PXMockExtendedTraitCollection *)v8 performChanges:v11];
  }
  return v9;
}

void __86__PXMockExtendedTraitCollection_initWithFormFactor_orientation_visibleChromeElements___block_invoke(void *a1, void *a2)
{
  unint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setUserInterfaceIdiom:IdiomForFormFactor(v3)];
  [v4 setFormFactor:a1[4]];
  [v4 setLayoutOrientation:a1[5]];
  [v4 setWindowOrientation:a1[5]];
  [v4 setVisibleChromeElements:a1[6]];
}

- (PXMockExtendedTraitCollection)initWithLayoutSizeClass:(int64_t)a3
{
  id v4 = [(PXMockExtendedTraitCollection *)self initWithViewController:0];
  double v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PXMockExtendedTraitCollection_initWithLayoutSizeClass___block_invoke;
    v7[3] = &__block_descriptor_40_e48_v16__0___PXMockMutableExtendedTraitCollection__8l;
    v7[4] = a3;
    [(PXMockExtendedTraitCollection *)v4 performChanges:v7];
  }
  return v5;
}

void __57__PXMockExtendedTraitCollection_initWithLayoutSizeClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setLayoutSizeClass:v2];
  [v3 setLayoutOrientation:1];
}

- (PXMockExtendedTraitCollection)initWithViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXMockExtendedTraitCollection;
  id v3 = [(PXExtendedTraitCollection *)&v7 initWithViewController:0];
  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v3 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateLayoutSizeClass];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateLayoutReferenceSizeAndDisplayScale];
    [(PXUpdater *)v3->_updater addUpdateSelector:sel__updateSafeAreaInsets];
    [(PXExtendedTraitCollection *)v3 setEnabled:1];
  }
  return v3;
}

@end