@interface PXExtendedTraitCollection
- (BOOL)_needsUpdate;
- (BOOL)insideCollectionDetailsView;
- (BOOL)isEnabled;
- (CGRect)platformSpecificFullScreenReferenceRect;
- (CGSize)_pendingViewTransitionSize;
- (CGSize)_viewSize;
- (CGSize)layoutReferenceSize;
- (CGSize)windowReferenceSize;
- (PXAnonymousTraitCollection)traitCollection;
- (PXAnonymousViewController)viewController;
- (PXExtendedTraitCollection)init;
- (PXExtendedTraitCollection)initWithViewController:(id)a3;
- (PXExtendedTraitCollection)rootExtendedTraitCollection;
- (PXExtendedTraitCollectionSnapshot)snapshot;
- (PXPhotosHeaderCustomizationModel)headerCustomizationModel;
- (PXStoryChromeLayoutSpec)storyChromeLayoutSpec;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)peripheryInsets;
- (UIEdgeInsets)platformSpecificPeripheryInsets;
- (UIEdgeInsets)safeAreaInsets;
- (double)displayScale;
- (double)displayScaleFromTraitCollection:(id)a3;
- (id)createTraitCollection;
- (id)swift_environmentStorage;
- (int64_t)contentSizeCategory;
- (int64_t)layoutDirection;
- (int64_t)layoutOrientation;
- (int64_t)layoutSizeClass;
- (int64_t)layoutSizeSubclass;
- (int64_t)preferredBackgroundStyle;
- (int64_t)userInterfaceFeature;
- (int64_t)userInterfaceFeatureForViewController:(id)a3;
- (int64_t)userInterfaceIdiom;
- (int64_t)userInterfaceLevel;
- (int64_t)userInterfaceStyle;
- (int64_t)windowOrientation;
- (unint64_t)curatedLibraryLayoutStyle;
- (void)_invalidateAllAppearingProperties;
- (void)_invalidateContentSizeCategory;
- (void)_invalidateLayoutDirection;
- (void)_invalidateLayoutOrientation;
- (void)_invalidateLayoutReferenceSize;
- (void)_invalidateLayoutSizeClass;
- (void)_invalidateUserInterfaceFeature;
- (void)_invalidateUserInterfaceIdiom;
- (void)_invalidateUserInterfaceLevel;
- (void)_invalidateUserInterfaceStyle;
- (void)_invalidateViewSize;
- (void)_invalidateWindowOrientation;
- (void)_invalidateWindowReferenceSize;
- (void)_setLayoutOrientation:(int64_t)a3;
- (void)_setLayoutSizeClass:(int64_t)a3;
- (void)_setLayoutSizeSubclass:(int64_t)a3;
- (void)_setNeedsUpdate;
- (void)_setPendingViewTransitionSize:(CGSize)a3;
- (void)_setTraitCollection:(id)a3;
- (void)_setUserInterfaceFeature:(int64_t)a3;
- (void)_setUserInterfaceIdiom:(int64_t)a3;
- (void)_setUserInterfaceLevel:(int64_t)a3;
- (void)_setUserInterfaceStyle:(int64_t)a3;
- (void)_setViewSize:(CGSize)a3;
- (void)_setWindowOrientation:(int64_t)a3;
- (void)_setWindowReferenceSize:(CGSize)a3;
- (void)_updateContentSizeCategoryIfNeeded;
- (void)_updateDisplayScaleIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateLayoutDirectionIfNeeded;
- (void)_updateLayoutMarginsIfNeeded;
- (void)_updateLayoutOrientationIfNeeded;
- (void)_updateLayoutReferenceSizeIfNeeded;
- (void)_updateLayoutSizeClassIfNeeded;
- (void)_updatePeripheryInsetsIfNeeded;
- (void)_updateSafeAreaInsetsIfNeeded;
- (void)_updateTraitCollectionIfNeeded;
- (void)_updateUserInterfaceFeatureIfNeeded;
- (void)_updateUserInterfaceIdiomIfNeeded;
- (void)_updateUserInterfaceLevelIfNeeded;
- (void)_updateUserInterfaceStyleIfNeeded;
- (void)_updateViewSizeIfNeeded;
- (void)_updateWindowOrientationIfNeeded;
- (void)_updateWindowReferenceSizeIfNeeded;
- (void)_viewWillLayoutSubviews;
- (void)dealloc;
- (void)didPerformChanges;
- (void)getContentSizeCategory:(int64_t *)a3;
- (void)getLayoutDirection:(int64_t *)a3;
- (void)getSizeClass:(int64_t *)a3 sizeSubclass:(int64_t *)a4;
- (void)getUserInterfaceIdiom:(int64_t *)a3;
- (void)getUserInterfaceLevel:(int64_t *)a3;
- (void)getUserInterfaceStyle:(int64_t *)a3;
- (void)invalidateDisplayScale;
- (void)invalidateLayoutMargins;
- (void)invalidatePeripheryInsets;
- (void)invalidateSafeAreaInsets;
- (void)invalidateTraitCollection;
- (void)peripheryInsetsNeedsUpdate;
- (void)setContentSizeCategory:(int64_t)a3;
- (void)setDisplayScale:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHeaderCustomizationModel:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setLayoutReferenceSize:(CGSize)a3;
- (void)setPeripheryInsets:(UIEdgeInsets)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setSwift_environmentStorage:(id)a3;
- (void)viewControllerDidMoveToParentViewController:(id)a3;
- (void)viewControllerLayoutOrientationDidChange;
- (void)viewControllerTraitCollectionDidChange;
- (void)viewControllerViewDidAppear;
- (void)viewControllerViewDidLoad;
- (void)viewControllerViewIsAppearing;
- (void)viewControllerViewLayoutMarginsDidChange;
- (void)viewControllerViewSafeAreaInsetsDidChange;
- (void)viewControllerViewWillAppear;
- (void)viewControllerViewWillTransitionToSize:(CGSize)a3;
@end

@implementation PXExtendedTraitCollection

- (id)swift_environmentStorage
{
  return self->_swift_environmentStorage;
}

- (void)setSwift_environmentStorage:(id)a3
{
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)layoutSizeSubclass
{
  return self->_layoutSizeSubclass;
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

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
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

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (unint64_t)curatedLibraryLayoutStyle
{
}

uint64_t __52__PXExtendedTraitCollection_initWithViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateUserInterfaceIdiom];
}

uint64_t __54__PXExtendedTraitCollection_viewControllerViewDidLoad__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateViewSize];
  [*(id *)(a1 + 32) invalidateTraitCollection];
  [*(id *)(a1 + 32) invalidateSafeAreaInsets];
  [*(id *)(a1 + 32) invalidateLayoutMargins];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateLayoutDirection];
}

uint64_t __56__PXExtendedTraitCollection_viewControllerViewDidAppear__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateWindowReferenceSize];
  [*(id *)(a1 + 32) invalidateDisplayScale];
  [*(id *)(a1 + 32) invalidateTraitCollection];
  [*(id *)(a1 + 32) invalidateSafeAreaInsets];
  [*(id *)(a1 + 32) invalidatePeripheryInsets];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateLayoutMargins];
}

- (void)_invalidateAllAppearingProperties
{
  [(PXExtendedTraitCollection *)self _invalidateViewSize];
  [(PXExtendedTraitCollection *)self invalidateTraitCollection];
  [(PXExtendedTraitCollection *)self invalidateSafeAreaInsets];
  [(PXExtendedTraitCollection *)self invalidatePeripheryInsets];
  [(PXExtendedTraitCollection *)self invalidateLayoutMargins];
  [(PXExtendedTraitCollection *)self _invalidateLayoutDirection];
}

- (void)invalidateLayoutMargins
{
  self->_needsUpdateFlags.layoutMargins = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)invalidatePeripheryInsets
{
  self->_needsUpdateFlags.peripheryInsets = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

uint64_t __67__PXExtendedTraitCollection_viewControllerTraitCollectionDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateTraitCollection];
  [*(id *)(a1 + 32) invalidateSafeAreaInsets];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateLayoutMargins];
}

- (void)invalidateSafeAreaInsets
{
  self->_needsUpdateFlags.safeAreaInsets = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)invalidateTraitCollection
{
  self->_needsUpdateFlags.traitCollection = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (id)createTraitCollection
{
  v2 = [(PXExtendedTraitCollection *)self viewController];
  v3 = [v2 traitCollection];

  return v3;
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXExtendedTraitCollection;
  [(PXExtendedTraitCollection *)&v3 didPerformChanges];
  [(PXExtendedTraitCollection *)self _updateIfNeeded];
}

- (void)_updateIfNeeded
{
  if ([(PXExtendedTraitCollection *)self _needsUpdate])
  {
    [(PXExtendedTraitCollection *)self _updateViewSizeIfNeeded];
    [(PXExtendedTraitCollection *)self _updateLayoutReferenceSizeIfNeeded];
    [(PXExtendedTraitCollection *)self _updateTraitCollectionIfNeeded];
    [(PXExtendedTraitCollection *)self _updateLayoutSizeClassIfNeeded];
    [(PXExtendedTraitCollection *)self _updateLayoutDirectionIfNeeded];
    [(PXExtendedTraitCollection *)self _updateLayoutOrientationIfNeeded];
    [(PXExtendedTraitCollection *)self _updateContentSizeCategoryIfNeeded];
    [(PXExtendedTraitCollection *)self _updateDisplayScaleIfNeeded];
    [(PXExtendedTraitCollection *)self _updateSafeAreaInsetsIfNeeded];
    [(PXExtendedTraitCollection *)self _updatePeripheryInsetsIfNeeded];
    [(PXExtendedTraitCollection *)self _updateLayoutMarginsIfNeeded];
    [(PXExtendedTraitCollection *)self _updateUserInterfaceIdiomIfNeeded];
    [(PXExtendedTraitCollection *)self _updateUserInterfaceFeatureIfNeeded];
    [(PXExtendedTraitCollection *)self _updateUserInterfaceStyleIfNeeded];
    [(PXExtendedTraitCollection *)self _updateUserInterfaceLevelIfNeeded];
    [(PXExtendedTraitCollection *)self _updateWindowReferenceSizeIfNeeded];
    [(PXExtendedTraitCollection *)self _updateWindowOrientationIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.viewSize
      || self->_needsUpdateFlags.layoutReferenceSize
      || self->_needsUpdateFlags.traitCollection
      || self->_needsUpdateFlags.layoutSizeClass
      || self->_needsUpdateFlags.layoutDirection
      || self->_needsUpdateFlags.layoutOrientation
      || self->_needsUpdateFlags.contentSizeCategory
      || self->_needsUpdateFlags.displayScale
      || self->_needsUpdateFlags.safeAreaInsets
      || self->_needsUpdateFlags.peripheryInsets
      || self->_needsUpdateFlags.layoutMargins
      || self->_needsUpdateFlags.userInterfaceIdiom
      || self->_needsUpdateFlags.userInterfaceStyle
      || self->_needsUpdateFlags.userInterfaceLevel
      || self->_needsUpdateFlags.userInterfaceFeature
      || self->_needsUpdateFlags.windowReferenceSize
      || self->_needsUpdateFlags.windowOrientation;
}

- (void)_updateWindowReferenceSizeIfNeeded
{
  if (self->_needsUpdateFlags.windowReferenceSize)
  {
    self->_needsUpdateFlags.windowReferenceSize = 0;
    id v3 = [(PXExtendedTraitCollection *)self viewController];
    objc_msgSend(v3, "px_windowReferenceSize");
    -[PXExtendedTraitCollection _setWindowReferenceSize:](self, "_setWindowReferenceSize:");
  }
}

- (void)_updateWindowOrientationIfNeeded
{
  if (self->_needsUpdateFlags.windowOrientation)
  {
    self->_needsUpdateFlags.windowOrientation = 0;
    [(PXExtendedTraitCollection *)self windowReferenceSize];
    PXSizeIsEmpty();
  }
}

- (void)_updateViewSizeIfNeeded
{
  if (self->_needsUpdateFlags.viewSize)
  {
    self->_needsUpdateFlags.viewSize = 0;
    id v3 = [(PXExtendedTraitCollection *)self viewController];
    objc_msgSend(v3, "px_referenceSize");
    double v5 = v4;
    double v7 = v6;

    -[PXExtendedTraitCollection _setViewSize:](self, "_setViewSize:", v5, v7);
  }
}

- (void)_updateUserInterfaceStyleIfNeeded
{
  if (self->_needsUpdateFlags.userInterfaceStyle)
  {
    self->_needsUpdateFlags.userInterfaceStyle = 0;
    uint64_t v3 = 0;
    [(PXExtendedTraitCollection *)self getUserInterfaceStyle:&v3];
    [(PXExtendedTraitCollection *)self _setUserInterfaceStyle:v3];
  }
}

- (void)_updateUserInterfaceLevelIfNeeded
{
  if (self->_needsUpdateFlags.userInterfaceLevel)
  {
    self->_needsUpdateFlags.userInterfaceLevel = 0;
    uint64_t v3 = -1;
    [(PXExtendedTraitCollection *)self getUserInterfaceLevel:&v3];
    [(PXExtendedTraitCollection *)self _setUserInterfaceLevel:v3];
  }
}

- (void)_updateUserInterfaceIdiomIfNeeded
{
  if (self->_needsUpdateFlags.userInterfaceIdiom)
  {
    self->_needsUpdateFlags.userInterfaceIdiom = 0;
    uint64_t v3 = 0;
    [(PXExtendedTraitCollection *)self getUserInterfaceIdiom:&v3];
    [(PXExtendedTraitCollection *)self _setUserInterfaceIdiom:v3];
  }
}

- (void)_updateUserInterfaceFeatureIfNeeded
{
  if (self->_needsUpdateFlags.userInterfaceFeature)
  {
    self->_needsUpdateFlags.userInterfaceFeature = 0;
    uint64_t v3 = [(PXExtendedTraitCollection *)self viewController];
    int64_t v4 = [(PXExtendedTraitCollection *)self userInterfaceFeatureForViewController:v3];

    [(PXExtendedTraitCollection *)self _setUserInterfaceFeature:v4];
  }
}

- (void)_updateTraitCollectionIfNeeded
{
  if (self->_needsUpdateFlags.traitCollection)
  {
    self->_needsUpdateFlags.traitCollection = 0;
    id v3 = [(PXExtendedTraitCollection *)self createTraitCollection];
    [(PXExtendedTraitCollection *)self _setTraitCollection:v3];
  }
}

- (void)_updateSafeAreaInsetsIfNeeded
{
  if (self->_needsUpdateFlags.safeAreaInsets)
  {
    self->_needsUpdateFlags.safeAreaInsets = 0;
    id v3 = [(PXExtendedTraitCollection *)self viewController];
    objc_msgSend(v3, "px_safeAreaInsets");
    -[PXExtendedTraitCollection setSafeAreaInsets:](self, "setSafeAreaInsets:");
  }
}

- (void)_updatePeripheryInsetsIfNeeded
{
  if (self->_needsUpdateFlags.peripheryInsets)
  {
    self->_needsUpdateFlags.peripheryInsets = 0;
    [(PXExtendedTraitCollection *)self platformSpecificPeripheryInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v18 = +[PXKitSettings sharedInstance];
    [v18 simulatedPeripheryExtraTopInset];
    double v12 = v4 + v11;
    [v18 simulatedPeripheryExtraLeftInset];
    double v14 = v6 + v13;
    [v18 simulatedPeripheryExtraBottomInset];
    double v16 = v8 + v15;
    [v18 simulatedPeripheryExtraRightInset];
    -[PXExtendedTraitCollection setPeripheryInsets:](self, "setPeripheryInsets:", v12, v14, v16, v10 + v17);
  }
}

- (void)_updateLayoutSizeClassIfNeeded
{
  if (self->_needsUpdateFlags.layoutSizeClass)
  {
    self->_needsUpdateFlags.layoutSizeClass = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    [(PXExtendedTraitCollection *)self getSizeClass:&v4 sizeSubclass:&v3];
    [(PXExtendedTraitCollection *)self _setLayoutSizeClass:v4];
    [(PXExtendedTraitCollection *)self _setLayoutSizeSubclass:v3];
  }
}

- (void)_updateLayoutReferenceSizeIfNeeded
{
  if (self->_needsUpdateFlags.layoutReferenceSize)
  {
    self->_needsUpdateFlags.layoutReferenceSize = 0;
    [(PXExtendedTraitCollection *)self _pendingViewTransitionSize];
    PXSizeIsNull();
  }
}

- (void)_updateLayoutOrientationIfNeeded
{
  if (self->_needsUpdateFlags.layoutOrientation)
  {
    self->_needsUpdateFlags.layoutOrientation = 0;
    [(PXExtendedTraitCollection *)self layoutReferenceSize];
    PXSizeIsEmpty();
  }
}

- (void)_updateLayoutMarginsIfNeeded
{
  if (self->_needsUpdateFlags.layoutMargins)
  {
    self->_needsUpdateFlags.layoutMargins = 0;
    id v3 = [(PXExtendedTraitCollection *)self viewController];
    objc_msgSend(v3, "px_layoutMargins");
    [(PXExtendedTraitCollection *)self setLayoutMargins:"setLayoutMargins:"];
  }
}

- (PXAnonymousViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (PXAnonymousViewController *)WeakRetained;
}

- (void)_updateLayoutDirectionIfNeeded
{
  if (self->_needsUpdateFlags.layoutDirection)
  {
    self->_needsUpdateFlags.layoutDirection = 0;
    uint64_t v3 = 0;
    [(PXExtendedTraitCollection *)self getLayoutDirection:&v3];
    [(PXExtendedTraitCollection *)self setLayoutDirection:v3];
  }
}

- (void)_updateDisplayScaleIfNeeded
{
  if (self->_needsUpdateFlags.displayScale)
  {
    self->_needsUpdateFlags.displayScale = 0;
    uint64_t v3 = [(PXExtendedTraitCollection *)self traitCollection];
    [(PXExtendedTraitCollection *)self displayScaleFromTraitCollection:v3];
    double v5 = v4;

    [(PXExtendedTraitCollection *)self setDisplayScale:v5];
  }
}

- (void)_updateContentSizeCategoryIfNeeded
{
  if (self->_needsUpdateFlags.contentSizeCategory)
  {
    self->_needsUpdateFlags.contentSizeCategory = 0;
    uint64_t v3 = 0;
    [(PXExtendedTraitCollection *)self getContentSizeCategory:&v3];
    [(PXExtendedTraitCollection *)self setContentSizeCategory:v3];
  }
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
}

- (void)getUserInterfaceIdiom:(int64_t *)a3
{
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  unint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 > 6) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = qword_1AB35AFA8[v5];
  }
  *a3 = v6;
}

- (void)_setUserInterfaceIdiom:(int64_t)a3
{
  if (self->_userInterfaceIdiom != a3)
  {
    self->_userInterfaceIdiom = a3;
    [(PXExtendedTraitCollection *)self signalChange:64];
  }
}

- (void)_setTraitCollection:(id)a3
{
  unint64_t v5 = (PXAnonymousTraitCollection *)a3;
  int64_t v6 = v5;
  if (self->_traitCollection != v5)
  {
    double v8 = v5;
    char v7 = -[PXAnonymousTraitCollection isEqual:](v5, "isEqual:");
    int64_t v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      [(PXExtendedTraitCollection *)self signalChange:1];
      [(PXExtendedTraitCollection *)self _invalidateLayoutSizeClass];
      [(PXExtendedTraitCollection *)self _invalidateUserInterfaceIdiom];
      [(PXExtendedTraitCollection *)self _invalidateUserInterfaceStyle];
      [(PXExtendedTraitCollection *)self _invalidateUserInterfaceLevel];
      [(PXExtendedTraitCollection *)self _invalidateContentSizeCategory];
      [(PXExtendedTraitCollection *)self invalidateDisplayScale];
      int64_t v6 = v8;
    }
  }
}

- (void)_setNeedsUpdate
{
}

- (void)_invalidateUserInterfaceIdiom
{
  self->_needsUpdateFlags.userInterfaceIdiom = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (double)displayScaleFromTraitCollection:(id)a3
{
  [a3 displayScale];
  return result;
}

- (PXAnonymousTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXExtendedTraitCollection *)self signalChange:32];
  }
}

- (void)_setWindowReferenceSize:(CGSize)a3
{
  if (a3.width != self->_windowReferenceSize.width || a3.height != self->_windowReferenceSize.height)
  {
    self->_windowReferenceSize = a3;
    [(PXExtendedTraitCollection *)self signalChange:0x20000];
    [(PXExtendedTraitCollection *)self _invalidateWindowOrientation];
  }
}

- (void)_setViewSize:(CGSize)a3
{
  if (a3.width != self->__viewSize.width || a3.height != self->__viewSize.height)
  {
    self->__viewSize = a3;
    [(PXExtendedTraitCollection *)self _invalidateLayoutReferenceSize];
  }
}

- (void)invalidateDisplayScale
{
  self->_needsUpdateFlags.displayScale = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_invalidateLayoutSizeClass
{
  self->_needsUpdateFlags.layoutSizeClass = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (UIEdgeInsets)platformSpecificPeripheryInsets
{
  v2 = [(PXExtendedTraitCollection *)self viewController];
  uint64_t v3 = [v2 viewIfLoaded];

  if (v3)
  {
    objc_msgSend(v3, "px_peripheryInsets");
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *(double *)off_1E5DAAF10;
    double v7 = *((double *)off_1E5DAAF10 + 1);
    double v9 = *((double *)off_1E5DAAF10 + 2);
    double v11 = *((double *)off_1E5DAAF10 + 3);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (void)getUserInterfaceStyle:(int64_t *)a3
{
}

- (void)getUserInterfaceLevel:(int64_t *)a3
{
  id v7 = [(PXExtendedTraitCollection *)self viewController];
  double v4 = [v7 traitCollection];
  uint64_t v5 = [v4 userInterfaceLevel];
  if (a3)
  {
    int64_t v6 = v5 == 1;
    if (v5 == -1) {
      int64_t v6 = -1;
    }
    *a3 = v6;
  }
}

- (void)getSizeClass:(int64_t *)a3 sizeSubclass:(int64_t *)a4
{
  [(PXExtendedTraitCollection *)self layoutReferenceSize];
  double v8 = v7;
  double v10 = v9;
  id v15 = [(PXExtendedTraitCollection *)self viewController];
  double v11 = [v15 traitCollection];
  int64_t v12 = PXUserInterfaceSizeClassFromUITraitCollection(v11);
  int64_t v13 = v12;
  if (v12 == 2) {
    goto LABEL_7;
  }
  if (v12 == 1)
  {
    double v14 = fmin(v10, v8);
    int64_t v13 = 2;
    if (v14 <= 350.0) {
      int64_t v13 = 1;
    }
    if (v14 > 400.0) {
      int64_t v13 = 3;
    }
LABEL_7:
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int64_t v13 = 0;
  if (a3) {
LABEL_8:
  }
    *a3 = v12;
LABEL_9:
  if (a4) {
    *a4 = v13;
  }
}

- (void)getContentSizeCategory:(int64_t *)a3
{
  id v6 = [(PXExtendedTraitCollection *)self viewController];
  double v4 = [v6 traitCollection];
  int64_t v5 = PXPreferredContentSizeCategoryFromUITraitCollection(v4);
  if (a3) {
    *a3 = v5;
  }
}

- (void)setPeripheryInsets:(UIEdgeInsets)a3
{
}

- (void)setContentSizeCategory:(int64_t)a3
{
  if (self->_contentSizeCategory != a3)
  {
    self->_contentSizeCategory = a3;
    [(PXExtendedTraitCollection *)self signalChange:2048];
  }
}

- (void)_setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(PXExtendedTraitCollection *)self signalChange:1024];
  }
}

- (void)_setUserInterfaceLevel:(int64_t)a3
{
  if (self->_userInterfaceLevel != a3)
  {
    self->_userInterfaceLevel = a3;
    [(PXExtendedTraitCollection *)self signalChange:4096];
  }
}

- (void)_setLayoutSizeSubclass:(int64_t)a3
{
  if (self->_layoutSizeSubclass != a3)
  {
    self->_layoutSizeSubclass = a3;
    [(PXExtendedTraitCollection *)self signalChange:4];
  }
}

- (void)_setLayoutSizeClass:(int64_t)a3
{
  if (self->_layoutSizeClass != a3)
  {
    self->_layoutSizeClass = a3;
    [(PXExtendedTraitCollection *)self signalChange:2];
  }
}

- (void)_invalidateUserInterfaceStyle
{
  self->_needsUpdateFlags.userInterfaceStyle = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_invalidateUserInterfaceLevel
{
  self->_needsUpdateFlags.userInterfaceLevel = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_invalidateContentSizeCategory
{
  self->_needsUpdateFlags.contentSizeCategory = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)getLayoutDirection:(int64_t *)a3
{
  id v7 = [(PXExtendedTraitCollection *)self viewController];
  double v4 = [v7 traitCollection];
  uint64_t v5 = [v4 layoutDirection];
  if (a3)
  {
    int64_t v6 = 2 * (v5 == 1);
    if (!v5) {
      int64_t v6 = 1;
    }
    *a3 = v6;
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

uint64_t __73__PXExtendedTraitCollection_viewControllerDidMoveToParentViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateWindowReferenceSize];
  [*(id *)(a1 + 32) invalidateSafeAreaInsets];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateLayoutMargins];
}

uint64_t __52__PXExtendedTraitCollection__viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPendingViewTransitionSize:", *(double *)off_1E5DAB030, *((double *)off_1E5DAB030 + 1));
  [*(id *)(a1 + 32) _invalidateViewSize];
  [*(id *)(a1 + 32) _invalidateWindowReferenceSize];
  [*(id *)(a1 + 32) invalidateSafeAreaInsets];
  v2 = *(void **)(a1 + 32);
  return [v2 invalidateLayoutMargins];
}

- (void)_invalidateWindowReferenceSize
{
  self->_needsUpdateFlags.windowReferenceSize = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_invalidateViewSize
{
  self->_needsUpdateFlags.viewSize = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_setPendingViewTransitionSize:(CGSize)a3
{
  if (a3.width != self->__pendingViewTransitionSize.width || a3.height != self->__pendingViewTransitionSize.height)
  {
    self->__pendingViewTransitionSize = a3;
    [(PXExtendedTraitCollection *)self _invalidateLayoutReferenceSize];
  }
}

- (CGSize)windowReferenceSize
{
  double width = self->_windowReferenceSize.width;
  double height = self->_windowReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  if (a3.width != self->_layoutReferenceSize.width || a3.height != self->_layoutReferenceSize.height)
  {
    self->_layoutReferenceSize = a3;
    [(PXExtendedTraitCollection *)self signalChange:16];
    [(PXExtendedTraitCollection *)self _invalidateLayoutSizeClass];
    [(PXExtendedTraitCollection *)self _invalidateLayoutOrientation];
  }
}

- (CGSize)_viewSize
{
  double width = self->__viewSize.width;
  double height = self->__viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setWindowOrientation:(int64_t)a3
{
  if (self->_windowOrientation != a3)
  {
    self->_windowOrientation = a3;
    [(PXExtendedTraitCollection *)self signalChange:0x40000];
  }
}

- (void)_setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(PXExtendedTraitCollection *)self signalChange:8];
  }
}

- (CGSize)_pendingViewTransitionSize
{
  double width = self->__pendingViewTransitionSize.width;
  double height = self->__pendingViewTransitionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_invalidateWindowOrientation
{
  self->_needsUpdateFlags.windowOrientation = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_invalidateLayoutReferenceSize
{
  self->_needsUpdateFlags.layoutReferenceSize = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_invalidateLayoutOrientation
{
  self->_needsUpdateFlags.layoutOrientation = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

uint64_t __69__PXExtendedTraitCollection_viewControllerViewLayoutMarginsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateLayoutMargins];
}

uint64_t __70__PXExtendedTraitCollection_viewControllerViewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateSafeAreaInsets];
}

uint64_t __55__PXExtendedTraitCollection_peripheryInsetsNeedsUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidatePeripheryInsets];
}

- (void)_invalidateLayoutDirection
{
  self->_needsUpdateFlags.layoutDirection = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (PXExtendedTraitCollection)rootExtendedTraitCollection
{
  v2 = self;
  uint64_t v3 = [(PXExtendedTraitCollection *)v2 viewController];
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = PXViewControllerRootViewController(v3);
    int64_t v6 = v5;
    if (v5 != v4)
    {
      objc_msgSend(v5, "px_extendedTraitCollection");
      id v7 = (PXExtendedTraitCollection *)objc_claimAutoreleasedReturnValue();

      if ([(PXExtendedTraitCollection *)v7 isEnabled])
      {
        v2 = v7;
      }
      else
      {
        v2 = v2;
      }
    }
  }
  return v2;
}

- (void)viewControllerViewWillAppear
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__PXExtendedTraitCollection_viewControllerViewWillAppear__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (void)viewControllerViewDidAppear
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PXExtendedTraitCollection_viewControllerViewDidAppear__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (void)viewControllerTraitCollectionDidChange
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__PXExtendedTraitCollection_viewControllerTraitCollectionDidChange__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (void)_viewWillLayoutSubviews
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __52__PXExtendedTraitCollection__viewWillLayoutSubviews__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)viewControllerViewLayoutMarginsDidChange
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __69__PXExtendedTraitCollection_viewControllerViewLayoutMarginsDidChange__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (void)viewControllerViewSafeAreaInsetsDidChange
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __70__PXExtendedTraitCollection_viewControllerViewSafeAreaInsetsDidChange__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (void)peripheryInsetsNeedsUpdate
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PXExtendedTraitCollection_peripheryInsetsNeedsUpdate__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (void)viewControllerDidMoveToParentViewController:(id)a3
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __73__PXExtendedTraitCollection_viewControllerDidMoveToParentViewController___block_invoke;
    v4[3] = &unk_1E5DD0FA8;
    v4[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v4];
  }
}

- (PXExtendedTraitCollection)initWithViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXExtendedTraitCollection;
  uint64_t v5 = [(PXExtendedTraitCollection *)&v12 init];
  int64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    CGSize v7 = *(CGSize *)off_1E5DAB030;
    v6->_layoutReferenceSize = *(CGSize *)off_1E5DAB030;
    v6->_layoutDirection = 0;
    v6->_layoutOrientation = 0;
    v6->_windowReferenceSize = v7;
    v6->_windowOrientation = 0;
    v6->_contentSizeCategory = 0;
    v6->_displayScale = 1.0;
    v6->__viewSize = v7;
    v6->__pendingViewTransitionSize = v7;
    v6->_userInterfaceFeature = [(PXExtendedTraitCollection *)v6 userInterfaceFeatureForViewController:v4];
    v6->_userInterfaceStyle = 0;
    v6->_userInterfaceLevel = -1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__PXExtendedTraitCollection_initWithViewController___block_invoke;
    v10[3] = &unk_1E5DD0FA8;
    double v8 = v6;
    double v11 = v8;
    [(PXExtendedTraitCollection *)v8 performChanges:v10];
    [(PXExtendedTraitCollection *)v8 registerObservations];
  }
  return v6;
}

- (int64_t)userInterfaceFeatureForViewController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v4 = [(PXExtendedTraitCollection *)self viewController];
  int64_t v5 = [v4 userInterfaceFeature];

  return v5;
}

- (void)viewControllerViewIsAppearing
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __58__PXExtendedTraitCollection_viewControllerViewIsAppearing__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

uint64_t __58__PXExtendedTraitCollection_viewControllerViewIsAppearing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllAppearingProperties];
}

uint64_t __57__PXExtendedTraitCollection_viewControllerViewWillAppear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllAppearingProperties];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)viewControllerViewDidLoad
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__PXExtendedTraitCollection_viewControllerViewDidLoad__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

- (PXStoryChromeLayoutSpec)storyChromeLayoutSpec
{
  swift_getKeyPath();
  sub_1A9CD68C8();
  sub_1A9CD6908();
  uint64_t v3 = self;
  sub_1AB23472C();
}

- (int64_t)preferredBackgroundStyle
{
}

- (BOOL)insideCollectionDetailsView
{
}

- (PXExtendedTraitCollectionSnapshot)snapshot
{
  id v2 = [[PXExtendedTraitCollectionSnapshot alloc] _initWithExtendedTraitCollection:self];
  return (PXExtendedTraitCollectionSnapshot *)v2;
}

- (CGRect)platformSpecificFullScreenReferenceRect
{
  id v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setHeaderCustomizationModel:(id)a3
{
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return (PXPhotosHeaderCustomizationModel *)objc_getAssociatedObject(self, sel_headerCustomizationModel);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_swift_environmentStorage, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_traitCollection, 0);
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

- (void)_invalidateUserInterfaceFeature
{
  self->_needsUpdateFlags.userInterfaceFeature = 1;
  [(PXExtendedTraitCollection *)self _setNeedsUpdate];
}

- (void)_setUserInterfaceFeature:(int64_t)a3
{
  if (self->_userInterfaceFeature != a3)
  {
    self->_userInterfaceFeature = a3;
    [(PXExtendedTraitCollection *)self signalChange:128];
  }
}

- (void)viewControllerLayoutOrientationDidChange
{
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __69__PXExtendedTraitCollection_viewControllerLayoutOrientationDidChange__block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXExtendedTraitCollection *)self performChanges:v3];
  }
}

uint64_t __69__PXExtendedTraitCollection_viewControllerLayoutOrientationDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLayoutOrientation];
}

- (void)viewControllerViewWillTransitionToSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ([(PXExtendedTraitCollection *)self isEnabled])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__PXExtendedTraitCollection_viewControllerViewWillTransitionToSize___block_invoke;
    v6[3] = &unk_1E5DD0460;
    v6[4] = self;
    *(CGFloat *)&v6[5] = width;
    *(CGFloat *)&v6[6] = height;
    [(PXExtendedTraitCollection *)self performChanges:v6];
  }
}

uint64_t __68__PXExtendedTraitCollection_viewControllerViewWillTransitionToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingViewTransitionSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)dealloc
{
  [(PXExtendedTraitCollection *)self unregisterObservations];
  v3.receiver = self;
  v3.super_class = (Class)PXExtendedTraitCollection;
  [(PXExtendedTraitCollection *)&v3 dealloc];
}

- (PXExtendedTraitCollection)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXExtendedTraitCollection.m", 98, @"%s is not available as initializer", "-[PXExtendedTraitCollection init]");

  abort();
}

@end