@interface UITabBarItem
+ (id)_appearanceBlindViewClasses;
- (BOOL)_isPinned;
- (BOOL)_isSelected;
- (BOOL)_usesModernAppearance;
- (BOOL)animatedBadge;
- (BOOL)hasTitle;
- (BOOL)isEnabled;
- (BOOL)isSpringLoaded;
- (BOOL)isSystemItem;
- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4;
- (CGRect)_sourceRectForPresentationInWindow:(id)a3;
- (CGRect)frameInView:(id)a3;
- (NSDictionary)badgeTextAttributesForState:(UIControlState)state;
- (NSString)badgeValue;
- (NSString)description;
- (SEL)action;
- (UIColor)_tintColor;
- (UIColor)badgeColor;
- (UIEdgeInsets)imageInsets;
- (UIEdgeInsets)imageInsetsForStyle:(int64_t)a3 state:(int64_t)a4;
- (UIEdgeInsets)landscapeImagePhoneInsets;
- (UIEdgeInsets)largeContentSizeImageInsets;
- (UIImage)_internalLandscapeSelectedImagePhone;
- (UIImage)finishedSelectedImage;
- (UIImage)finishedUnselectedImage;
- (UIImage)landscapeSelectedImagePhone;
- (UIImage)selectedImage;
- (UIOffset)badgeOffset;
- (UIOffset)landscapePhoneBadgeOffset;
- (UIOffset)titlePositionAdjustment;
- (UITabBarAppearance)scrollEdgeAppearance;
- (UITabBarAppearance)standardAppearance;
- (UITabBarItem)init;
- (UITabBarItem)initWithCoder:(NSCoder *)coder;
- (UITabBarItem)initWithTabBarSystemItem:(UITabBarSystemItem)systemItem tag:(NSInteger)tag;
- (UITabBarItem)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
- (UITabBarItem)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag;
- (_UITabBarItemAppearanceStorage)_appearanceStorage;
- (id)_changeObserver;
- (id)_createViewForTabBar:(id)a3 asProxyView:(BOOL)a4;
- (id)_internalLandscapeTemplateImage;
- (id)_internalLandscapeTemplateImages;
- (id)_internalTemplateImage;
- (id)_internalTemplateImages;
- (id)_internalTemplateImagesForTabBarDisplayStyle:(int64_t)a3;
- (id)_internalTitle;
- (id)_internalTitleForTabBarDisplayStyle:(int64_t)a3;
- (id)_nearestViewController;
- (id)_resolvedSourceItem;
- (id)_sourceViewForPresentationInWindow:(id)a3;
- (id)_tabBarButton;
- (id)badgeForStyle:(int64_t)a3 state:(int64_t)a4;
- (id)image;
- (id)imageForStyle:(int64_t)a3 state:(int64_t)a4;
- (id)landscapeImagePhone;
- (id)largeContentSizeImage;
- (id)target;
- (id)title;
- (id)titleForStyle:(int64_t)a3 state:(int64_t)a4;
- (id)titleTextAttributesForState:(unint64_t)a3;
- (id)unselectedImage;
- (int64_t)_barMetrics;
- (int64_t)_imageStyle;
- (int64_t)preferredPlacement;
- (int64_t)systemItem;
- (void)_itemBarAppearanceNeedsUpdate:(id *)a1;
- (void)_itemViewNeedsUpdate:(uint64_t)a1;
- (void)_resolveSystemItem;
- (void)_setBarMetrics:(int64_t)a3;
- (void)_setImageStyle:(int64_t)a3;
- (void)_setInternalLandscapeTemplateImage:(id)a3;
- (void)_setInternalTemplateImage:(id)a3;
- (void)_setInternalTitle:(id)a3;
- (void)_setPinned:(BOOL)a3;
- (void)_setSelected:(BOOL)a3;
- (void)_setTabBarButton:(uint64_t)a1;
- (void)_setTitleTextAttributeValue:(id)a3 forAttributeKey:(id)a4 state:(unint64_t)a5;
- (void)_setUsesModernAppearance:(BOOL)a3;
- (void)_updateView;
- (void)_updateViewAndPositionItems:(BOOL)a3;
- (void)_updateViewBadge;
- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setBadgeColor:(UIColor *)badgeColor;
- (void)setBadgeOffset:(UIOffset)a3;
- (void)setBadgeTextAttributes:(NSDictionary *)textAttributes forState:(UIControlState)state;
- (void)setBadgeValue:(NSString *)badgeValue;
- (void)setEnabled:(BOOL)a3;
- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setLandscapeImagePhone:(id)a3;
- (void)setLandscapeImagePhoneInsets:(UIEdgeInsets)a3;
- (void)setLandscapeSelectedImagePhone:(id)a3;
- (void)setLargeContentSizeImage:(id)a3;
- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)a3;
- (void)setScrollEdgeAppearance:(UITabBarAppearance *)scrollEdgeAppearance;
- (void)setSelectedImage:(UIImage *)selectedImage;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setStandardAppearance:(UITabBarAppearance *)standardAppearance;
- (void)setTarget:(id)a3;
- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment;
- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)setUnselectedImage:(id)a3;
- (void)setView:(id)a3;
- (void)set_fallbackSourceItem:(uint64_t)a1;
@end

@implementation UITabBarItem

- (void)setTarget:(id)a3
{
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (UITabBarItem)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
{
  v8 = title;
  v9 = image;
  v10 = [(UITabBarItem *)self init];
  v11 = v10;
  if (v10)
  {
    [(UITabBarItem *)v10 setTitle:v8];
    [(UITabBarItem *)v11 setImage:v9];
    [(UIBarItem *)v11 setTag:tag];
  }

  return v11;
}

- (void)_setInternalTitle:(id)a3
{
  id v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    title = self->_title;
    self->_title = v8;

    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
LABEL_9:
}

- (void)_setInternalTemplateImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_templateImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_templateImage, a3);
    __int16 tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    if ((tabBarItemFlags & 0x800) == 0)
    {
      selectedImage = self->_selectedImage;
      self->_selectedImage = 0;

      __int16 tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    }
    if ((tabBarItemFlags & 0x1000) == 0)
    {
      unselectedImage = self->_unselectedImage;
      self->_unselectedImage = 0;
    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    v5 = v9;
  }
}

- (void)setEnabled:(BOOL)a3
{
  *(_WORD *)&self->___int16 tabBarItemFlags = *(_WORD *)&self->_tabBarItemFlags & 0xFFFE | a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__UITabBarItem_setEnabled___block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v3);
}

- (void)_itemViewNeedsUpdate:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    aBlock = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 280));
    v5 = _Block_copy(aBlock);
    v6 = *(void **)(a1 + 256);
    *(void *)(a1 + 256) = v5;

    if (WeakRetained)
    {
      [WeakRetained _tabDataProviderContentDidChange:a1];
    }
    else if (aBlock)
    {
      aBlock[2]();
    }
    else
    {
      [(id)a1 _updateView];
    }
    char v7 = *(void **)(a1 + 256);
    *(void *)(a1 + 256) = 0;

    v3 = aBlock;
  }
}

- (void)_updateView
{
  alternateUpdateHandler = (void (**)(id))self->_alternateUpdateHandler;
  if (alternateUpdateHandler) {
    alternateUpdateHandler[2](self->_alternateUpdateHandler);
  }
  else {
    [(UITabBarItem *)self _updateViewAndPositionItems:1];
  }
}

- (void)_updateViewAndPositionItems:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UITabBarButton *)self->_view tabBar];
  if (v5)
  {
    id v9 = v5;
    [(UIView *)self->_view alpha];
    double v7 = v6;
    [v9 _updateTabBarItemView:self];
    if (v3) {
      [v9 _positionAllItems];
    }
    [(UIView *)self->_view setAlpha:v7];
    v8 = [v9 selectedItem];

    if (v8 == self) {
      [(UITabBarButton *)self->_view _showSelectedIndicator:1 changeSelection:1];
    }
    [(UITabBarItem *)self _updateViewBadge];
    v5 = v9;
  }
}

uint64_t __27__UITabBarItem_setEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) setEnabled:*(_WORD *)(*(void *)(a1 + 32) + 248) & 1];
}

- (UITabBarItem)init
{
  v5.receiver = self;
  v5.super_class = (Class)UITabBarItem;
  v2 = [(UIBarItem *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(UITabBarItem *)v2 setEnabled:1];
  }
  return v3;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
  id v4 = badgeValue;
  objc_super v5 = self->_badgeValue;
  double v6 = v4;
  double v7 = v5;
  if (v7 == v6)
  {
  }
  else
  {
    v8 = v7;
    if (v6 && v7)
    {
      char v9 = [(NSString *)v6 isEqual:v7];

      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v10 = (NSString *)[(NSString *)v6 copy];
    v11 = self->_badgeValue;
    self->_badgeValue = v10;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __30__UITabBarItem_setBadgeValue___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v12);
  }
LABEL_9:
}

- (void)setSpringLoaded:(BOOL)a3
{
  __int16 tabBarItemFlags = (__int16)self->_tabBarItemFlags;
  if (((((tabBarItemFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 2;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 tabBarItemFlags = tabBarItemFlags & 0xFFFD | v4;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __32__UITabBarItem_setSpringLoaded___block_invoke;
    v5[3] = &unk_1E52D9FC0;
    v5[4] = self;
    BOOL v6 = a3;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v5);
  }
}

uint64_t __32__UITabBarItem_setSpringLoaded___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) setSpringLoaded:*(unsigned __int8 *)(a1 + 40)];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)UITabBarItem;
  BOOL v3 = [(UITabBarItem *)&v7 description];
  __int16 v4 = (void *)[v3 mutableCopy];

  if ([(UITabBarItem *)self isSystemItem])
  {
    switch([(UITabBarItem *)self systemItem])
    {
      case 0:
        objc_super v5 = @" systemItem=More";
        goto LABEL_20;
      case 1:
        objc_super v5 = @" systemItem=Favorites";
        goto LABEL_20;
      case 2:
        objc_super v5 = @" systemItem=Featured";
        goto LABEL_20;
      case 3:
        objc_super v5 = @" systemItem=TopRated";
        goto LABEL_20;
      case 4:
        objc_super v5 = @" systemItem=Recents";
        goto LABEL_20;
      case 5:
        objc_super v5 = @" systemItem=Contacts";
        goto LABEL_20;
      case 6:
        objc_super v5 = @" systemItem=History";
        goto LABEL_20;
      case 7:
        objc_super v5 = @" systemItem=Bookmarks";
        goto LABEL_20;
      case 8:
        objc_super v5 = @" systemItem=Search";
        goto LABEL_20;
      case 9:
        objc_super v5 = @" systemItem=Downloads";
        goto LABEL_20;
      case 10:
        objc_super v5 = @" systemItem=MostRecent";
        goto LABEL_20;
      case 11:
        objc_super v5 = @" systemItem=MostViewed";
LABEL_20:
        [v4 appendString:v5];
        break;
      default:
        break;
    }
  }
  else
  {
    if (self->_title) {
      [v4 appendFormat:@" title='%@'", self->_title];
    }
    if (self->_templateImage)
    {
      [v4 appendFormat:@" image=%@", self->_templateImage];
      if (self->_landscapeTemplateImage) {
        [v4 appendFormat:@" landscapeImagePhone=%@", self->_landscapeTemplateImage];
      }
    }
  }
  if (self->_standardAppearance) {
    objc_msgSend(v4, "appendFormat:", @" standardAppearance=%p", self->_standardAppearance);
  }
  if (self->_scrollEdgeAppearance) {
    objc_msgSend(v4, "appendFormat:", @" scrollEdgeAppearance=%p", self->_scrollEdgeAppearance);
  }
  if ([(UITabBarItem *)self _isSelected]) {
    [v4 appendString:@" selected"];
  }
  if ((*(_WORD *)&self->_tabBarItemFlags & 1) == 0) {
    [v4 appendString:@" disabled"];
  }
  return (NSString *)v4;
}

- (UITabBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (UITabBarAppearance)standardAppearance
{
  return self->_standardAppearance;
}

- (id)_tabBarButton
{
  if (a1)
  {
    a1 = (id *)a1[29];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setImageStyle:(int64_t)a3
{
  self->__imageStyle = a3;
}

- (void)_setBarMetrics:(int64_t)a3
{
  self->__barMetrics = a3;
}

- (void)_setTabBarButton:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v4 = [(id)a1 _isSelected];
    objc_storeStrong((id *)(a1 + 232), a2);
    [*(id *)(a1 + 232) _setSelected:v4];
    [*(id *)(a1 + 232) setSpringLoaded:(*(unsigned __int16 *)(a1 + 248) >> 1) & 1];
    [*(id *)(a1 + 232) setEnabled:*(_WORD *)(a1 + 248) & 1];
  }
}

- (BOOL)_isSelected
{
  view = self->_view;
  if (view)
  {
    BOOL v4 = [(UITabBarButton *)view _isSelected];
    if (v4) {
      __int16 v5 = 1024;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 tabBarItemFlags = *(_WORD *)&self->_tabBarItemFlags & 0xFBFF | v5;
  }
  else
  {
    return (*(_WORD *)&self->_tabBarItemFlags >> 10) & 1;
  }
  return v4;
}

- (id)image
{
  return self->_templateImage;
}

- (BOOL)isSystemItem
{
  return (*(_WORD *)&self->_tabBarItemFlags >> 5) & 1;
}

- (id)unselectedImage
{
  unselectedImage = self->_unselectedImage;
  if (!unselectedImage)
  {
    BOOL v4 = [(UITabBarItem *)self _internalTemplateImages];
    __int16 v5 = [v4 firstObject];

    BOOL v6 = self->_unselectedImage;
    self->_unselectedImage = v5;

    unselectedImage = self->_unselectedImage;
  }
  return unselectedImage;
}

- (UIImage)selectedImage
{
  selectedImage = self->_selectedImage;
  if (!selectedImage)
  {
    BOOL v4 = [(UITabBarItem *)self _internalTemplateImages];
    __int16 v5 = [v4 lastObject];
    BOOL v6 = self->_selectedImage;
    self->_selectedImage = v5;

    selectedImage = self->_selectedImage;
  }
  return selectedImage;
}

- (id)_internalTemplateImages
{
  return [(UITabBarItem *)self _internalTemplateImagesForTabBarDisplayStyle:0];
}

- (id)_internalTemplateImagesForTabBarDisplayStyle:(int64_t)a3
{
  BOOL v4 = self->_templateImage;
  if (v4)
  {
    __int16 v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, self->_selectedTemplateImage, 0);
  }
  else
  {
    __int16 v5 = 0;
  }

  return v5;
}

- (int64_t)preferredPlacement
{
  if ([(UITabBarItem *)self systemItem] == 8) {
    return 4;
  }
  if ([(UITabBarItem *)self _isPinned]) {
    return 4;
  }
  return 5;
}

- (int64_t)systemItem
{
  return ((unint64_t)*(_WORD *)&self->_tabBarItemFlags >> 6) & 0xF;
}

- (BOOL)_isPinned
{
  return self->__pinned;
}

- (NSString)badgeValue
{
  return self->_badgeValue;
}

- (UIEdgeInsets)landscapeImagePhoneInsets
{
  double top = self->_landscapeImageInsets.top;
  double left = self->_landscapeImageInsets.left;
  double bottom = self->_landscapeImageInsets.bottom;
  double right = self->_landscapeImageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isSpringLoaded
{
  return (*(_WORD *)&self->_tabBarItemFlags >> 1) & 1;
}

- (BOOL)isEnabled
{
  return *(_WORD *)&self->_tabBarItemFlags & 1;
}

- (UIEdgeInsets)imageInsets
{
  double top = self->_imageInsets.top;
  double left = self->_imageInsets.left;
  double bottom = self->_imageInsets.bottom;
  double right = self->_imageInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIOffset)badgeOffset
{
  double horizontal = self->_badgeOffset.horizontal;
  double vertical = self->_badgeOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (id)_internalLandscapeTemplateImage
{
  v2 = [(UITabBarItem *)self _internalLandscapeTemplateImages];
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (UIImage)_internalLandscapeSelectedImagePhone
{
  landscapeSelectedImage = self->_landscapeSelectedImage;
  if (!landscapeSelectedImage)
  {
    BOOL v4 = [(UITabBarItem *)self _internalLandscapeTemplateImages];
    __int16 v5 = [v4 lastObject];
    BOOL v6 = self->_landscapeSelectedImage;
    self->_landscapeSelectedImage = v5;

    landscapeSelectedImage = self->_landscapeSelectedImage;
  }
  return landscapeSelectedImage;
}

- (id)_internalLandscapeTemplateImages
{
  BOOL v3 = self->_landscapeTemplateImage;
  if (v3)
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, self->_landscapeSelectedTemplateImage, 0);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (_UITabBarItemAppearanceStorage)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (id)title
{
  return self->_title;
}

- (void)set_fallbackSourceItem:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 320), a2);
  }
}

- (int64_t)_imageStyle
{
  return self->__imageStyle;
}

- (int64_t)_barMetrics
{
  return self->__barMetrics;
}

- (id)_internalTitle
{
  return [(UITabBarItem *)self _internalTitleForTabBarDisplayStyle:0];
}

- (id)_internalTitleForTabBarDisplayStyle:(int64_t)a3
{
  return self->_title;
}

- (void)setStandardAppearance:(UITabBarAppearance *)standardAppearance
{
  BOOL v4 = standardAppearance;
  __int16 v5 = self->_standardAppearance;
  BOOL v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v8 = self->_standardAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  char v9 = [(UIBarAppearance *)v12 copy];
  v10 = self->_standardAppearance;
  self->_standardAppearance = v9;

  -[UITabBarItem _itemBarAppearanceNeedsUpdate:]((id *)&self->super.super.isa, self->_standardAppearance);
  v11 = self->_standardAppearance;
  if (v11) {
    objc_storeWeak((id *)&v11->super._changeObserver, self);
  }
LABEL_12:
}

- (void)_itemBarAppearanceNeedsUpdate:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 35);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained _tab:a1 appearanceNeedsUpdate:v4];
    }
    else {
      [a1 appearance:v4 categoriesChanged:-1];
    }
  }
}

- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4
{
  id v5 = [(UITabBarButton *)self->_view tabBar];
  [v5 _useModernAppearance];
  [(UITabBarItem *)self _setUsesModernAppearance:1];
  if ([(UITabBarItem *)self _isSelected]) {
    [v5 setNeedsLayout];
  }
}

- (void)_setUsesModernAppearance:(BOOL)a3
{
  self->__usesModernAppearance = a3;
}

- (BOOL)_usesModernAppearance
{
  return self->__usesModernAppearance;
}

- (UITabBarItem)initWithTabBarSystemItem:(UITabBarSystemItem)systemItem tag:(NSInteger)tag
{
  char v5 = systemItem;
  BOOL v6 = [(UITabBarItem *)self init];
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    [(UIBarItem *)v6 setTag:tag];
    *(_WORD *)(v7 + 248) = ((v5 & 0xF) << 6) | *(_WORD *)(v7 + 248) & 0xFC3F | 0x20;
    -[UITabBarItem _resolveSystemItem](v7);
  }
  return (UITabBarItem *)v7;
}

- (void)_resolveSystemItem
{
  if ((*(_WORD *)(a1 + 248) & 0x20) != 0)
  {
    switch([(id)a1 systemItem])
    {
      case 0:
        v2 = _UINSLocalizedStringWithDefaultValue(@"More", @"More");
        BOOL v3 = @"ellipsis";
        break;
      case 1:
        id v4 = @"Favorites";
        goto LABEL_8;
      case 2:
        id v4 = @"Featured";
        goto LABEL_8;
      case 3:
        id v4 = @"Top Rated";
LABEL_8:
        v2 = _UINSLocalizedStringWithDefaultValue(v4, v4);
        BOOL v3 = @"star.fill";
        break;
      case 4:
        char v5 = @"Recents";
        goto LABEL_16;
      case 5:
        v2 = _UINSLocalizedStringWithDefaultValue(@"Contacts", @"Contacts");
        BOOL v3 = @"person.crop.circle.fill";
        break;
      case 6:
        char v5 = @"History";
        goto LABEL_16;
      case 7:
        v2 = _UINSLocalizedStringWithDefaultValue(@"Bookmarks", @"Bookmarks");
        BOOL v3 = @"book.fill";
        break;
      case 8:
        v2 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
        BOOL v3 = @"magnifyingglass";
        break;
      case 9:
        v2 = _UINSLocalizedStringWithDefaultValue(@"Downloads", @"Downloads");
        BOOL v3 = @"square.and.arrow.down.fill";
        break;
      case 10:
        char v5 = @"Most Recent";
LABEL_16:
        v2 = _UINSLocalizedStringWithDefaultValue(v5, v5);
        BOOL v3 = @"clock.fill";
        break;
      case 11:
        v2 = _UINSLocalizedStringWithDefaultValue(@"Most Viewed", @"Most Viewed");
        BOOL v3 = @"list.number";
        break;
      default:
        BOOL v3 = 0;
        v2 = 0;
        break;
    }
    BOOL v6 = +[UIImage systemImageNamed:v3];
    id v7 = v6;
    v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v2;
    id v9 = v2;

    objc_storeStrong((id *)(a1 + 88), v6);
    v10 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    v11 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v7;
    id v13 = v7;

    v12 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;
  }
}

uint64_t __30__UITabBarItem_setBadgeValue___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) _setBadgeValue:*(void *)(*(void *)(a1 + 32) + 208)];
}

- (UITabBarItem)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
  v8 = title;
  id v9 = image;
  v10 = selectedImage;
  v11 = [(UITabBarItem *)self init];
  v12 = v11;
  if (v11)
  {
    [(UITabBarItem *)v11 setTitle:v8];
    [(UITabBarItem *)v12 setImage:v9];
    [(UITabBarItem *)v12 setSelectedImage:v10];
  }

  return v12;
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
  if (self->_selectedTemplateImage != selectedImage)
  {
    id v4 = [(UIImage *)selectedImage _imageThatSuppressesAccessibilityHairlineThickening];
    selectedTemplateImage = self->_selectedTemplateImage;
    self->_selectedTemplateImage = v4;

    if ((*(_WORD *)&self->_tabBarItemFlags & 0x800) == 0)
    {
      BOOL v6 = self->_selectedImage;
      self->_selectedImage = 0;
    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fallbackSourceItem, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong(&self->_alternateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_landscapeSelectedImage, 0);
  objc_storeStrong((id *)&self->_landscapeSelectedTemplateImage, 0);
  objc_storeStrong((id *)&self->_landscapeTemplateImage, 0);
  objc_storeStrong((id *)&self->_unselectedImage, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_selectedTemplateImage, 0);
  objc_storeStrong((id *)&self->_templateImage, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setScrollEdgeAppearance:(UITabBarAppearance *)scrollEdgeAppearance
{
  id v4 = scrollEdgeAppearance;
  char v5 = self->_scrollEdgeAppearance;
  BOOL v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(UIBarAppearance *)v5 isEqual:v6];

    if (v7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v8 = self->_scrollEdgeAppearance;
  if (v8) {
    objc_storeWeak((id *)&v8->super._changeObserver, 0);
  }
  id v9 = [(UIBarAppearance *)v12 copy];
  v10 = self->_scrollEdgeAppearance;
  self->_scrollEdgeAppearance = v9;

  -[UITabBarItem _itemBarAppearanceNeedsUpdate:]((id *)&self->super.super.isa, self->_scrollEdgeAppearance);
  v11 = self->_scrollEdgeAppearance;
  if (v11) {
    objc_storeWeak((id *)&v11->super._changeObserver, self);
  }
LABEL_12:
}

- (void)_setSelected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 tabBarItemFlags = *(_WORD *)&self->_tabBarItemFlags & 0xFBFF | v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__UITabBarItem__setSelected___block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v4);
}

uint64_t __29__UITabBarItem__setSelected___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) _setSelected:(*(unsigned __int16 *)(*(void *)(a1 + 32) + 248) >> 10) & 1];
}

- (void)_updateViewBadge
{
  if (self->_badgeValue) {
    -[UITabBarButton _setBadgeValue:](self->_view, "_setBadgeValue:");
  }
}

- (void)setBadgeOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_badgeOffset.horizontal || a3.vertical != self->_badgeOffset.vertical)
  {
    self->_badgeOffset = a3;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (UIOffset)landscapePhoneBadgeOffset
{
  double horizontal = self->_badgeOffset.horizontal;
  double vertical = self->_badgeOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (UITabBarItem)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v28.receiver = self;
  v28.super_class = (Class)UITabBarItem;
  char v5 = [(UIBarItem *)&v28 initWithCoder:v4];
  if (v5)
  {
    if ([(NSCoder *)v4 containsValueForKey:@"UISystemItem"])
    {
      *(_WORD *)&v5->_tabBarItemFlags |= 0x20u;
      *(_WORD *)&v5->___int16 tabBarItemFlags = (([(NSCoder *)v4 decodeIntegerForKey:@"UISystemItem"] & 0xF) << 6) | *(_WORD *)&v5->_tabBarItemFlags & 0xFC3F;
    }
    [(UIBarItem *)v5 setTag:[(NSCoder *)v4 decodeIntegerForKey:@"UITag"]];
    *(_WORD *)&v5->___int16 tabBarItemFlags = *(_WORD *)&v5->_tabBarItemFlags & 0xFFFE | [(NSCoder *)v4 decodeBoolForKey:@"UIEnabled"];
    uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"UITitle"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [(NSCoder *)v4 decodeObjectForKey:@"UIBadgeValue"];
    badgeValue = v5->_badgeValue;
    v5->_badgeValue = (NSString *)v8;

    v10 = [(NSCoder *)v4 decodeObjectForKey:@"UIBadgeColor"];
    [(UITabBarItem *)v5 setBadgeColor:v10];

    uint64_t v11 = [(NSCoder *)v4 decodeObjectForKey:@"UIImage"];
    templateImage = v5->_templateImage;
    v5->_templateImage = (UIImage *)v11;

    uint64_t v13 = [(NSCoder *)v4 decodeObjectForKey:@"UISelectedTemplateImage"];
    selectedTemplateImage = v5->_selectedTemplateImage;
    v5->_selectedTemplateImage = (UIImage *)v13;

    [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UIImageInsets"];
    v5->_imageInsets.double top = v15;
    v5->_imageInsets.double left = v16;
    v5->_imageInsets.double bottom = v17;
    v5->_imageInsets.double right = v18;
    if (dyld_program_sdk_at_least())
    {
      uint64_t v19 = [(NSCoder *)v4 decodeObjectForKey:@"UIImageLandscape"];
      landscapeTemplateImage = v5->_landscapeTemplateImage;
      v5->_landscapeTemplateImage = (UIImage *)v19;

      uint64_t v21 = [(NSCoder *)v4 decodeObjectForKey:@"UISelectedTemplateImageLandscape"];
      landscapeSelectedTemplateImage = v5->_landscapeSelectedTemplateImage;
      v5->_landscapeSelectedTemplateImage = (UIImage *)v21;

      [(NSCoder *)v4 decodeUIEdgeInsetsForKey:@"UIImageInsetsLandscape"];
      v5->_landscapeImageInsets.double top = v23;
      v5->_landscapeImageInsets.double left = v24;
      v5->_landscapeImageInsets.double bottom = v25;
      v5->_landscapeImageInsets.double right = v26;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UITitlePositionAdjustment"])
    {
      [(NSCoder *)v4 decodeUIOffsetForKey:@"UITitlePositionAdjustment"];
      -[UITabBarItem setTitlePositionAdjustment:](v5, "setTitlePositionAdjustment:");
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISpringLoaded"]) {
      [(UITabBarItem *)v5 setSpringLoaded:[(NSCoder *)v4 decodeBoolForKey:@"UISpringLoaded"]];
    }
    -[UITabBarItem _resolveSystemItem]((uint64_t)v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarItem;
  [(UIBarItem *)&v17 encodeWithCoder:v4];
  unint64_t tabBarItemFlags = (unint64_t)self->_tabBarItemFlags;
  LOBYTE(v6) = self->_tabBarItemFlags;
  if ((tabBarItemFlags & 0x20) != 0)
  {
    [v4 encodeInteger:(tabBarItemFlags >> 6) & 0xF forKey:@"UISystemItem"];
    __int16 v6 = (__int16)self->_tabBarItemFlags;
  }
  if (v6) {
    [v4 encodeBool:1 forKey:@"UIEnabled"];
  }
  if ([(UIBarItem *)self tag]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIBarItem tag](self, "tag"), @"UITag");
  }
  if ((tabBarItemFlags & 0x20) == 0)
  {
    title = self->_title;
    if (title) {
      [v4 encodeObject:title forKey:@"UITitle"];
    }
  }
  badgeValue = self->_badgeValue;
  if (badgeValue) {
    [v4 encodeObject:badgeValue forKey:@"UIBadgeValue"];
  }
  id v9 = [(UITabBarItem *)self badgeColor];

  if (v9)
  {
    v10 = [(UITabBarItem *)self badgeColor];
    [v4 encodeObject:v10 forKey:@"UIBadgeColor"];
  }
  if ((tabBarItemFlags & 0x20) == 0)
  {
    templateImage = self->_templateImage;
    if (templateImage) {
      [v4 encodeObject:templateImage forKey:@"UIImage"];
    }
    selectedTemplateImage = self->_selectedTemplateImage;
    if (selectedTemplateImage) {
      [v4 encodeObject:selectedTemplateImage forKey:@"UISelectedTemplateImage"];
    }
  }
  if (self->_imageInsets.top != 0.0
    || self->_imageInsets.bottom != 0.0
    || self->_imageInsets.left != 0.0
    || self->_imageInsets.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UIImageInsets");
  }
  if (dyld_program_sdk_at_least())
  {
    if ((tabBarItemFlags & 0x20) == 0)
    {
      landscapeTemplateImage = self->_landscapeTemplateImage;
      if (landscapeTemplateImage) {
        [v4 encodeObject:landscapeTemplateImage forKey:@"UIImageLandscape"];
      }
      landscapeSelectedTemplateImage = self->_landscapeSelectedTemplateImage;
      if (landscapeSelectedTemplateImage) {
        [v4 encodeObject:landscapeSelectedTemplateImage forKey:@"UISelectedTemplateImageLandscape"];
      }
    }
    if (self->_landscapeImageInsets.top != 0.0
      || self->_landscapeImageInsets.bottom != 0.0
      || self->_landscapeImageInsets.left != 0.0
      || self->_landscapeImageInsets.right != 0.0)
    {
      objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"UIImageInsetsLandscape");
    }
  }
  [(UITabBarItem *)self titlePositionAdjustment];
  if (v16 != 0.0 || v15 != 0.0) {
    objc_msgSend(v4, "encodeUIOffset:forKey:", @"UITitlePositionAdjustment");
  }
  if ([(UITabBarItem *)self isSpringLoaded]) {
    [v4 encodeBool:1 forKey:@"UISpringLoaded"];
  }
}

- (void)setLandscapeImagePhone:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least()) {
    [(UITabBarItem *)self _setInternalLandscapeTemplateImage:v4];
  }
}

- (id)landscapeImagePhone
{
  return self->_landscapeTemplateImage;
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_imageInsets.left
    || a3.top != self->_imageInsets.top
    || a3.right != self->_imageInsets.right
    || a3.bottom != self->_imageInsets.bottom)
  {
    self->_imageInsets = a3;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (void)setLandscapeImagePhoneInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (dyld_program_sdk_at_least())
  {
    BOOL v8 = left == self->_landscapeImageInsets.left && top == self->_landscapeImageInsets.top;
    BOOL v9 = v8 && right == self->_landscapeImageInsets.right;
    if (!v9 || bottom != self->_landscapeImageInsets.bottom)
    {
      self->_landscapeImageInsets.double top = top;
      self->_landscapeImageInsets.double left = left;
      self->_landscapeImageInsets.double bottom = bottom;
      self->_landscapeImageInsets.double right = right;
      -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    }
  }
}

- (id)largeContentSizeImage
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) != 0)
  {
    v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITabBarItem;
    v2 = [(UIBarItem *)&v4 largeContentSizeImage];
  }
  return v2;
}

- (void)setLargeContentSizeImage:(id)a3
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UITabBarItem;
    [(UIBarItem *)&v3 setLargeContentSizeImage:a3];
  }
}

- (UIEdgeInsets)largeContentSizeImageInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UITabBarItem;
    [(UIBarItem *)&v6 largeContentSizeImageInsets];
  }
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v2;
  result.double top = v3;
  return result;
}

- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)a3
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UITabBarItem;
    -[UIBarItem setLargeContentSizeImageInsets:](&v3, sel_setLargeContentSizeImageInsets_, a3.top, a3.left, a3.bottom, a3.right);
  }
}

- (UIImage)landscapeSelectedImagePhone
{
  landscapeSelectedImage = self->_landscapeSelectedImage;
  if (!landscapeSelectedImage)
  {
    double v4 = [(UITabBarItem *)self _internalLandscapeTemplateImages];
    double v5 = [v4 lastObject];
    objc_super v6 = self->_landscapeSelectedImage;
    self->_landscapeSelectedImage = v5;

    landscapeSelectedImage = self->_landscapeSelectedImage;
  }
  return landscapeSelectedImage;
}

- (void)setLandscapeSelectedImagePhone:(id)a3
{
  if (self->_landscapeSelectedTemplateImage != a3)
  {
    double v4 = [a3 _imageThatSuppressesAccessibilityHairlineThickening];
    landscapeSelectedTemplateImage = self->_landscapeSelectedTemplateImage;
    self->_landscapeSelectedTemplateImage = v4;

    if ((*(_WORD *)&self->_tabBarItemFlags & 0x800) == 0)
    {
      landscapeSelectedImage = self->_landscapeSelectedImage;
      self->_landscapeSelectedImage = 0;
    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage
{
  uint64_t v11 = selectedImage;
  BOOL v7 = unselectedImage;
  BOOL v8 = v7;
  if (v7)
  {
    [(UIImage *)v7 _setRenderingMode:1];
    *(_WORD *)&self->_tabBarItemFlags |= 0x1000u;
  }
  BOOL v9 = self->_unselectedImage;
  if (v9 != v8) {
    objc_storeStrong((id *)&self->_unselectedImage, unselectedImage);
  }
  v10 = v11;
  if (v11)
  {
    [(UIImage *)v11 _setRenderingMode:1];
    v10 = v11;
    *(_WORD *)&self->_tabBarItemFlags |= 0x800u;
  }
  if (self->_selectedImage == v10)
  {
    if (v9 == v8) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedImage, selectedImage);
  }
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
LABEL_11:
}

- (UIImage)finishedSelectedImage
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x800) != 0) {
    return self->_selectedImage;
  }
  else {
    return (UIImage *)0;
  }
}

- (UIImage)finishedUnselectedImage
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x1000) != 0) {
    return self->_unselectedImage;
  }
  else {
    return (UIImage *)0;
  }
}

- (BOOL)hasTitle
{
  double v2 = [(UITabBarItem *)self resolvedTitle];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_resolvedSourceItem
{
  if (a1)
  {
    double v2 = a1;
    BOOL v3 = [a1[29] _window];

    double v4 = &OBJC_IVAR___UITabBarItem___fallbackSourceItem;
    if (v3) {
      double v4 = &OBJC_IVAR___UITabBarItem__view;
    }
    a1 = (id *)*(id *)((char *)v2 + *v4);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_appearanceStorage)
  {
    BOOL v8 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;
  }
  uint64_t v10 = objc_msgSend(v7, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");

  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a4 != 8) {
    a4 = 4;
  }
  v12 = [NSNumber numberWithUnsignedInteger:a4];
  v15[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  _UIAppearanceTagObjectForSelector(self, a2, v13);

  uint64_t v14 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a4];
  if (v10 | v14 && ([(id)v10 isEqualToDictionary:v14] & 1) == 0)
  {
    [(_UIBarItemAppearanceStorage *)self->_appearanceStorage setTextAttributes:v10 forState:a4];
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a3 != 8) {
    a3 = 4;
  }
  return [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a3];
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical = titlePositionAdjustment.vertical;
  double horizontal = titlePositionAdjustment.horizontal;
  _UIAppearanceTagObjectForSelector(self, a2, 0);
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    id v7 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    BOOL v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;

    appearanceStorage = self->_appearanceStorage;
  }
  [(_UITabBarItemAppearanceStorage *)appearanceStorage titleOffset];
  if (v10 != horizontal || v9 != vertical)
  {
    -[_UITabBarItemAppearanceStorage setTitleOffset:](self->_appearanceStorage, "setTitleOffset:", horizontal, vertical);
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (UIOffset)titlePositionAdjustment
{
  [(_UITabBarItemAppearanceStorage *)self->_appearanceStorage titleOffset];
  result.double vertical = v3;
  result.double horizontal = v2;
  return result;
}

- (void)setBadgeColor:(UIColor *)badgeColor
{
  double v4 = badgeColor;
  appearanceStorage = self->_appearanceStorage;
  if (v4)
  {
    if (!appearanceStorage)
    {
      objc_super v6 = objc_alloc_init(_UITabBarItemAppearanceStorage);
      id v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_9;
  }
  BOOL v8 = [(_UITabBarItemAppearanceStorage *)appearanceStorage badgeColor];
  double v9 = v8;
  if (v8 != v4 && ![(UIColor *)v8 isEqual:v4]) {
    [(_UITabBarItemAppearanceStorage *)self->_appearanceStorage setBadgeColor:v4];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__UITabBarItem_setBadgeColor___block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v10);

LABEL_9:
}

void __30__UITabBarItem_setBadgeColor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 232);
  id v3 = [*(id *)(v1 + 240) badgeColor];
  [v2 _setBadgeColor:v3];
}

- (UIColor)badgeColor
{
  return [(_UITabBarItemAppearanceStorage *)self->_appearanceStorage badgeColor];
}

- (void)setBadgeTextAttributes:(NSDictionary *)textAttributes forState:(UIControlState)state
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = textAttributes;
  if (!self->_appearanceStorage)
  {
    BOOL v8 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;
  }
  double v10 = [NSNumber numberWithUnsignedInteger:state];
  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  _UIAppearanceTagObjectForSelector(self, a2, v11);

  v12 = [(_UITabBarItemAppearanceStorage *)self->_appearanceStorage badgeTextAttributesForState:state];
  if (v12 != v7 && ![(NSDictionary *)v7 isEqualToDictionary:v12]) {
    [(_UITabBarItemAppearanceStorage *)self->_appearanceStorage setBadgeTextAttributes:v7 forState:state];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__UITabBarItem_setBadgeTextAttributes_forState___block_invoke;
  v13[3] = &unk_1E52D9CD0;
  v13[4] = self;
  v13[5] = state;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v13);
}

void __48__UITabBarItem_setBadgeTextAttributes_forState___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 232);
  id v4 = [*(id *)(v2 + 240) badgeTextAttributesForState:*(void *)(a1 + 40)];
  [v3 _setBadgeTextAttributes:v4 forState:*(void *)(a1 + 40)];
}

- (NSDictionary)badgeTextAttributesForState:(UIControlState)state
{
  return (NSDictionary *)[(_UITabBarItemAppearanceStorage *)self->_appearanceStorage badgeTextAttributesForState:state];
}

- (void)setView:(id)a3
{
}

- (BOOL)animatedBadge
{
  return 0;
}

- (void)setUnselectedImage:(id)a3
{
  double v5 = (UIImage *)a3;
  objc_super v6 = v5;
  id v7 = v5;
  if (v5)
  {
    [(UIImage *)v5 _setRenderingMode:1];
    objc_super v6 = v7;
    *(_WORD *)&self->_tabBarItemFlags |= 0x1000u;
  }
  if (self->_unselectedImage != v6)
  {
    objc_storeStrong((id *)&self->_unselectedImage, a3);
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    objc_super v6 = v7;
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (id)_internalTemplateImage
{
  uint64_t v2 = [(UITabBarItem *)self _internalTemplateImages];
  id v3 = [v2 firstObject];

  return v3;
}

- (void)_setInternalLandscapeTemplateImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_landscapeTemplateImage != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_landscapeTemplateImage, a3);
    __int16 tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    if ((tabBarItemFlags & 0x800) == 0)
    {
      selectedImage = self->_selectedImage;
      self->_selectedImage = 0;

      __int16 tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    }
    if ((tabBarItemFlags & 0x1000) == 0)
    {
      unselectedImage = self->_unselectedImage;
      self->_unselectedImage = 0;
    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    double v5 = v9;
  }
}

- (void)_setTitleTextAttributeValue:(id)a3 forAttributeKey:(id)a4 state:(unint64_t)a5
{
  unint64_t v12 = (unint64_t)a3;
  id v8 = a4;
  double v9 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:a5];
  id v10 = (id)[v9 mutableCopy];

  uint64_t v11 = [v10 objectForKey:v8];
  if (v12 && !v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(id)v12 isEqual:v11]) {
      goto LABEL_11;
    }
LABEL_8:
    [v10 setObject:v12 forKey:v8];
    goto LABEL_9;
  }
  if (!(v12 | v11) || ([(id)v12 isEqual:v11] & 1) != 0) {
    goto LABEL_11;
  }
  if (v12) {
    goto LABEL_8;
  }
  [v10 removeObjectForKey:v8];
LABEL_9:
  [(UITabBarItem *)self setTitleTextAttributes:v10 forState:a5];
  if (self->_view) {
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
LABEL_11:
}

+ (id)_appearanceBlindViewClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)_appearanceBlindViewClasses_classList_0;
  if (!_appearanceBlindViewClasses_classList_0)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
    id v4 = (void *)_appearanceBlindViewClasses_classList_0;
    _appearanceBlindViewClasses_classList_0 = v3;

    uint64_t v2 = (void *)_appearanceBlindViewClasses_classList_0;
  }
  return v2;
}

- (id)_createViewForTabBar:(id)a3 asProxyView:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    int64_t imageStyle = self->__imageStyle;
    double v9 = [v6 _appearanceStorage];
    id v10 = [v9 selectedImageTintColor];
    uint64_t v11 = v10;
    if (v10 || (imageStyle & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(UITabBarItem *)self _tintColor];
    }
    uint64_t v13 = v12;
  }
  uint64_t v14 = [(UITabBarItem *)self _internalTitle];
  double v15 = [(UITabBarItem *)self _internalLandscapeTemplateImages];
  double v16 = [v15 firstObject];

  objc_super v17 = [UITabBarButton alloc];
  CGFloat v18 = [(UITabBarItem *)self unselectedImage];
  uint64_t v19 = [(UITabBarItem *)self selectedImage];
  v20 = [(UITabBarItem *)self landscapeSelectedImagePhone];
  [(UITabBarItem *)self imageInsets];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(UITabBarItem *)self landscapeImagePhoneInsets];
  v33 = -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](v17, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", v18, v16, v19, v20, v14, v7, v22, v24, v26, v28, v29, v30, v31, v32);

  [(UITabBarItem *)self badgeOffset];
  -[UITabBarButton _setBadgeOffset:](v33, "_setBadgeOffset:");
  if ((*(_WORD *)&self->_tabBarItemFlags & 2) != 0) {
    [(UITabBarButton *)v33 setSpringLoaded:1];
  }

  [(UITabBarButton *)v33 _setAppearanceGuideClass:objc_opt_class()];
  [(UIView *)v33 frame];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  [v7 _heightForCustomizingItems];
  -[UIView setFrame:](v33, "setFrame:", v35, v37, v39, v40);
  appearanceStorage = self->_appearanceStorage;
  v42 = objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
  [(UITabBarButton *)v33 _applyTabBarButtonAppearanceStorage:appearanceStorage withTaggedSelectors:v42];

  v43 = [v7 _appearanceStorage];
  v44 = [v43 selectionIndicatorImage];

  if (v44) {
    [(UITabBarButton *)v33 _setCustomSelectedIndicatorImage:v44];
  }
  [(UIControl *)v33 addTarget:v7 action:sel__buttonDown_ forControlEvents:1];
  [(UIControl *)v33 addTarget:v7 action:sel__buttonUp_ forControlEvents:64];
  [(UIControl *)v33 addTarget:v7 action:sel__buttonCancel_ forControlEvents:256];
  [(UIControl *)v33 addTarget:v7 action:sel__sendAction_withEvent_ forControlEvents:0x40000000];
  [(UITabBarButton *)v33 setEnabled:[(UITabBarItem *)self isEnabled]];
  -[UITabBarButton _setShowsHighlightedState:](v33, "_setShowsHighlightedState:", [v7 _showsHighlightedState]);
  if (!a4 && self->_badgeValue) {
    -[UITabBarButton _setBadgeValue:](v33, "_setBadgeValue:");
  }
  LODWORD(v45) = -1105618534;
  [(UIView *)v33 setCharge:v45];

  return v33;
}

- (id)titleForStyle:(int64_t)a3 state:(int64_t)a4
{
  id v4 = [(UITabBarItem *)self _internalTitle];
  if ([v4 length]) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)badgeForStyle:(int64_t)a3 state:(int64_t)a4
{
  badgeValue = [(NSString *)self->_badgeValue length];
  if (badgeValue) {
    badgeValue = self->_badgeValue;
  }
  return badgeValue;
}

- (id)imageForStyle:(int64_t)a3 state:(int64_t)a4
{
  if ((unint64_t)a3 < 2)
  {
    id v6 = [(UITabBarItem *)self _internalTemplateImages];
LABEL_6:
    double v9 = v6;
    if (a4 == 2) {
      [v6 lastObject];
    }
    else {
    id v10 = [v6 firstObject];
    }
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    id v6 = [(UITabBarItem *)self _internalLandscapeTemplateImages];
    goto LABEL_6;
  }
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITabBarItem.m", 1062, @"style %li currently unsupported", a3);
  id v10 = 0;
LABEL_10:

  return v10;
}

- (UIEdgeInsets)imageInsetsForStyle:(int64_t)a3 state:(int64_t)a4
{
  if ((unint64_t)a3 < 2)
  {
    uint64_t v5 = 120;
LABEL_6:
    id v6 = (double *)((char *)self + v5);
    double v13 = *v6;
    double v12 = v6[1];
    double v11 = v6[2];
    double v10 = v6[3];
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    uint64_t v5 = 176;
    goto LABEL_6;
  }
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITabBarItem.m", 1084, @"style %li currently unsupported", a3);

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
LABEL_7:
  result.double right = v10;
  result.double bottom = v11;
  result.double left = v12;
  result.double top = v13;
  return result;
}

- (id)_changeObserver
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 35);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (void)_setPinned:(BOOL)a3
{
  self->__pinned = a3;
}

- (CGRect)frameInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
  [v5 frameInView:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
  [v8 _frameInCoordinateSpace:v7 window:v6];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_nearestViewController
{
  uint64_t v2 = -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
  uint64_t v3 = [v2 _nearestViewController];

  return v3;
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
  id v6 = [v5 _sourceViewForPresentationInWindow:v4];

  return v6;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
  [v5 _sourceRectForPresentationInWindow:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end