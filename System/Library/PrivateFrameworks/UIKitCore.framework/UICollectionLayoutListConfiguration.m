@interface UICollectionLayoutListConfiguration
- (BOOL)_sectionHeaderHugsContent;
- (BOOL)showsSeparators;
- (CGFloat)headerTopPadding;
- (UICollectionLayoutListAppearance)appearance;
- (UICollectionLayoutListConfiguration)init;
- (UICollectionLayoutListConfiguration)initWithAppearance:(UICollectionLayoutListAppearance)appearance;
- (UICollectionLayoutListFooterMode)footerMode;
- (UICollectionLayoutListHeaderMode)headerMode;
- (UICollectionLayoutListItemSeparatorHandler)itemSeparatorHandler;
- (UICollectionLayoutListSwipeActionsConfigurationProvider)leadingSwipeActionsConfigurationProvider;
- (UICollectionLayoutListSwipeActionsConfigurationProvider)trailingSwipeActionsConfigurationProvider;
- (UIColor)backgroundColor;
- (UIListSeparatorConfiguration)separatorConfiguration;
- (double)_cornerRadius;
- (id)_didEndSwipingHandler;
- (id)_spiConfiguration;
- (id)_willBeginSwipingHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)contentHuggingElements;
- (void)_setCornerRadius:(double)a3;
- (void)_setDidEndSwipingHandler:(id)a3;
- (void)_setSectionHeaderHugsContent:(BOOL)a3;
- (void)_setWillBeginSwipingHandler:(id)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setContentHuggingElements:(unint64_t)a3;
- (void)setFooterMode:(UICollectionLayoutListFooterMode)footerMode;
- (void)setHeaderMode:(UICollectionLayoutListHeaderMode)headerMode;
- (void)setHeaderTopPadding:(CGFloat)headerTopPadding;
- (void)setItemSeparatorHandler:(UICollectionLayoutListItemSeparatorHandler)itemSeparatorHandler;
- (void)setLeadingSwipeActionsConfigurationProvider:(UICollectionLayoutListSwipeActionsConfigurationProvider)leadingSwipeActionsConfigurationProvider;
- (void)setSeparatorConfiguration:(UIListSeparatorConfiguration *)separatorConfiguration;
- (void)setShowsSeparators:(BOOL)showsSeparators;
- (void)setTrailingSwipeActionsConfigurationProvider:(UICollectionLayoutListSwipeActionsConfigurationProvider)trailingSwipeActionsConfigurationProvider;
@end

@implementation UICollectionLayoutListConfiguration

- (void)_setWillBeginSwipingHandler:(id)a3
{
}

- (void)_setDidEndSwipingHandler:(id)a3
{
}

- (unint64_t)contentHuggingElements
{
  return self->_contentHuggingElements;
}

- (void)setShowsSeparators:(BOOL)showsSeparators
{
  self->_showsSeparators = showsSeparators;
}

- (UICollectionLayoutListHeaderMode)headerMode
{
  return self->_headerMode;
}

- (UICollectionLayoutListFooterMode)footerMode
{
  return self->_footerMode;
}

- (void)setSeparatorConfiguration:(UIListSeparatorConfiguration *)separatorConfiguration
{
  if (!separatorConfiguration)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Setting a nil separatorConfiguration is not supported" userInfo:0];
    objc_exception_throw(v6);
  }
  v4 = (UIListSeparatorConfiguration *)[(UIListSeparatorConfiguration *)separatorConfiguration copy];
  v5 = self->_separatorConfiguration;
  self->_separatorConfiguration = v4;
}

- (UIListSeparatorConfiguration)separatorConfiguration
{
  v2 = (void *)[(UIListSeparatorConfiguration *)self->_separatorConfiguration copy];
  return (UIListSeparatorConfiguration *)v2;
}

- (void)setHeaderMode:(UICollectionLayoutListHeaderMode)headerMode
{
  self->_headerMode = headerMode;
}

- (void)setTrailingSwipeActionsConfigurationProvider:(UICollectionLayoutListSwipeActionsConfigurationProvider)trailingSwipeActionsConfigurationProvider
{
}

- (void)setLeadingSwipeActionsConfigurationProvider:(UICollectionLayoutListSwipeActionsConfigurationProvider)leadingSwipeActionsConfigurationProvider
{
}

- (UICollectionLayoutListConfiguration)initWithAppearance:(UICollectionLayoutListAppearance)appearance
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionLayoutListConfiguration;
  v4 = [(UICollectionLayoutListConfiguration *)&v11 init];
  if (v4)
  {
    v5 = +[UITraitCollection _fallbackTraitCollection]();
    v4->_appearance = appearance;
    id v6 = [[UIListSeparatorConfiguration alloc] initWithListAppearance:appearance];
    separatorConfiguration = v4->_separatorConfiguration;
    v4->_separatorConfiguration = v6;

    if (dyld_program_sdk_at_least())
    {
      if ((unint64_t)(appearance - 1) > 2) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = qword_186B94D30[appearance - 1];
      }
      v9 = _UITableConstantsForTraitCollection(v5);
      v4->_showsSeparators = [v9 defaultSeparatorStyleForTableViewStyle:v8] != 0;
    }
    else
    {
      v4->_showsSeparators = 1;
    }
    v4->_headerTopPadding = 1.79769313e308;
    v4->_cornerRadius = 1.79769313e308;
  }
  return v4;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
}

- (void)setFooterMode:(UICollectionLayoutListFooterMode)footerMode
{
  self->_footerMode = footerMode;
}

- (UICollectionLayoutListAppearance)appearance
{
  return self->_appearance;
}

- (void)setItemSeparatorHandler:(UICollectionLayoutListItemSeparatorHandler)itemSeparatorHandler
{
}

- (void)setHeaderTopPadding:(CGFloat)headerTopPadding
{
  if (headerTopPadding < 0.0) {
    headerTopPadding = 1.79769313e308;
  }
  self->_headerTopPadding = headerTopPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trailingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_leadingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong(&self->_itemSeparatorHandler, 0);
  objc_storeStrong(&self->_didEndSwipingHandler, 0);
  objc_storeStrong(&self->_willBeginSwipingHandler, 0);
  objc_storeStrong((id *)&self->_separatorConfiguration, 0);
}

- (id)_spiConfiguration
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "set_apiVersion:", 1);
  objc_msgSend(v3, "set_headerElementKind:", @"UICollectionElementKindSectionHeader");
  objc_msgSend(v3, "set_footerElementKind:", @"UICollectionElementKindSectionFooter");
  if ((unint64_t)(self->_appearance - 1) >= 4) {
    int64_t appearance = 0;
  }
  else {
    int64_t appearance = self->_appearance;
  }
  [v3 setAppearanceStyle:appearance];
  [v3 setSeparatorStyle:self->_showsSeparators];
  id v5 = [(UIListSeparatorConfiguration *)self->_separatorConfiguration __copyWithSubclass:objc_opt_class() inZone:0];
  [v3 _setSeparatorConfiguration:v5];

  id v6 = (void *)[self->_itemSeparatorHandler copy];
  [v3 _setItemSeparatorHandler:v6];

  objc_msgSend(v3, "set_backgroundColor:", self->_backgroundColor);
  [v3 setLeadingSwipeActionsConfigurationProvider:self->_leadingSwipeActionsConfigurationProvider];
  [v3 setTrailingSwipeActionsConfigurationProvider:self->_trailingSwipeActionsConfigurationProvider];
  [v3 setWillBeginSwipingHandler:self->_willBeginSwipingHandler];
  [v3 setDidEndSwipingHandler:self->_didEndSwipingHandler];
  if (self->_headerMode == 1) {
    double v7 = 1.79769313e308;
  }
  else {
    double v7 = -1000.0;
  }
  [v3 setSectionHeaderHeight:v7];
  if (self->_footerMode == 1) {
    double v8 = 1.79769313e308;
  }
  else {
    double v8 = -1000.0;
  }
  [v3 setSectionFooterHeight:v8];
  [v3 setStylesFirstItemAsHeader:self->_headerMode == 2];
  [v3 setHeaderTopPadding:self->_headerTopPadding];
  [v3 setCornerRadius:self->_cornerRadius];
  [v3 setSectionHeaderHugsContent:self->_contentHuggingElements & 1];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAppearance:", self->_appearance);
  uint64_t v5 = v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_showsSeparators;
    uint64_t v6 = [(UIListSeparatorConfiguration *)self->_separatorConfiguration copy];
    double v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    uint64_t v8 = [self->_itemSeparatorHandler copy];
    v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    objc_storeStrong((id *)(v5 + 64), self->_backgroundColor);
    uint64_t v10 = [self->_leadingSwipeActionsConfigurationProvider copy];
    objc_super v11 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v10;

    uint64_t v12 = [self->_trailingSwipeActionsConfigurationProvider copy];
    v13 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v12;

    uint64_t v14 = [self->_willBeginSwipingHandler copy];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    uint64_t v16 = [self->_didEndSwipingHandler copy];
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    *(void *)(v5 + 88) = self->_headerMode;
    *(void *)(v5 + 96) = self->_footerMode;
    *(double *)(v5 + 104) = self->_headerTopPadding;
    *(double *)(v5 + 24) = self->_cornerRadius;
    *(void *)(v5 + 112) = self->_contentHuggingElements;
  }
  return (id)v5;
}

- (UICollectionLayoutListConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"init is unavailable on %@.", v6 format];

  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  if (a3 < 0.0) {
    a3 = 1.79769313e308;
  }
  self->_cornerRadius = a3;
}

- (BOOL)_sectionHeaderHugsContent
{
  return self->_contentHuggingElements == 1;
}

- (void)_setSectionHeaderHugsContent:(BOOL)a3
{
  self->_contentHuggingElements = a3;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (id)_willBeginSwipingHandler
{
  return self->_willBeginSwipingHandler;
}

- (id)_didEndSwipingHandler
{
  return self->_didEndSwipingHandler;
}

- (BOOL)showsSeparators
{
  return self->_showsSeparators;
}

- (UICollectionLayoutListItemSeparatorHandler)itemSeparatorHandler
{
  return self->_itemSeparatorHandler;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UICollectionLayoutListSwipeActionsConfigurationProvider)leadingSwipeActionsConfigurationProvider
{
  return self->_leadingSwipeActionsConfigurationProvider;
}

- (UICollectionLayoutListSwipeActionsConfigurationProvider)trailingSwipeActionsConfigurationProvider
{
  return self->_trailingSwipeActionsConfigurationProvider;
}

- (CGFloat)headerTopPadding
{
  return self->_headerTopPadding;
}

- (void)setContentHuggingElements:(unint64_t)a3
{
  self->_contentHuggingElements = a3;
}

@end