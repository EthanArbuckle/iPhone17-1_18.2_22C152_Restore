@interface UIContextMenuConfiguration
+ (UIContextMenuConfiguration)configurationWithIdentifier:(id)identifier previewProvider:(UIContextMenuContentPreviewProvider)previewProvider actionProvider:(UIContextMenuActionProvider)actionProvider;
- (BOOL)_clientDidSetBadgeCount;
- (BOOL)_isCollectionViewBackgroundMenu;
- (BOOL)_isMultiItemMenu;
- (BOOL)prefersHorizontalAttachment;
- (NSArray)_secondarySourcePreviews;
- (NSInteger)badgeCount;
- (NSSet)_effectiveSecondaryItemIdentifiers;
- (NSSet)_internalSecondaryItemIdentifiers;
- (NSSet)secondaryItemIdentifiers;
- (UIContextMenuConfiguration)init;
- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder;
- (UIResponder)firstResponderTarget;
- (UITab)_tab;
- (UITargetedPreview)_primarySourcePreview;
- (id)_effectiveInternalIdentifier;
- (id)_internalIdentifier;
- (id)actionProvider;
- (id)identifier;
- (id)previewProvider;
- (int64_t)preferredMenuAlignment;
- (void)_prepareWithCompletion:(id)a3;
- (void)_setTab:(id)a3;
- (void)setActionProvider:(id)a3;
- (void)setBadgeCount:(NSInteger)badgeCount;
- (void)setFirstResponderTarget:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPreferredMenuAlignment:(int64_t)a3;
- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder;
- (void)setPreviewProvider:(id)a3;
- (void)setSecondaryItemIdentifiers:(NSSet *)secondaryItemIdentifiers;
- (void)set_internalIdentifier:(id)a3;
- (void)set_internalSecondaryItemIdentifiers:(id)a3;
- (void)set_primarySourcePreview:(id)a3;
- (void)set_secondarySourcePreviews:(id)a3;
@end

@implementation UIContextMenuConfiguration

- (BOOL)_isCollectionViewBackgroundMenu
{
  v3 = [(UIContextMenuConfiguration *)self _internalIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  v5 = [(UIContextMenuConfiguration *)self _internalIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.UIKit.UICollectionView.backgroundMenu"];

  return v6;
}

+ (UIContextMenuConfiguration)configurationWithIdentifier:(id)identifier previewProvider:(UIContextMenuContentPreviewProvider)previewProvider actionProvider:(UIContextMenuActionProvider)actionProvider
{
  UIContextMenuActionProvider v7 = actionProvider;
  UIContextMenuContentPreviewProvider v8 = previewProvider;
  id v9 = identifier;
  v10 = objc_opt_new();
  [v10 setIdentifier:v9];

  [v10 setPreviewProvider:v8];
  [v10 setActionProvider:v7];

  return (UIContextMenuConfiguration *)v10;
}

- (UIContextMenuConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIContextMenuConfiguration;
  result = [(UIContextMenuConfiguration *)&v3 init];
  if (result) {
    result->_badgeCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = self->_identifier;
    self->_identifier = v4;

    identifier = self->_identifier;
  }
  return identifier;
}

- (BOOL)_clientDidSetBadgeCount
{
  return [(UIContextMenuConfiguration *)self badgeCount] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isMultiItemMenu
{
  v2 = [(UIContextMenuConfiguration *)self _effectiveSecondaryItemIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_effectiveInternalIdentifier
{
  BOOL v3 = [(UIContextMenuConfiguration *)self _internalIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIContextMenuConfiguration *)self identifier];
  }
  char v6 = v5;

  return v6;
}

- (NSSet)_effectiveSecondaryItemIdentifiers
{
  BOOL v3 = [(UIContextMenuConfiguration *)self _internalSecondaryItemIdentifiers];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIContextMenuConfiguration *)self secondaryItemIdentifiers];
  }
  char v6 = v5;

  return (NSSet *)v6;
}

- (void)_prepareWithCompletion:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (NSSet)secondaryItemIdentifiers
{
  return self->_secondaryItemIdentifiers;
}

- (void)setSecondaryItemIdentifiers:(NSSet *)secondaryItemIdentifiers
{
}

- (NSInteger)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(NSInteger)badgeCount
{
  self->_badgeCount = badgeCount;
}

- (UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  return self->_preferredMenuElementOrder;
}

- (void)setPreferredMenuElementOrder:(UIContextMenuConfigurationElementOrder)preferredMenuElementOrder
{
  self->_preferredMenuElementOrder = preferredMenuElementOrder;
}

- (id)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
}

- (id)actionProvider
{
  return self->_actionProvider;
}

- (void)setActionProvider:(id)a3
{
}

- (UIResponder)firstResponderTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstResponderTarget);
  return (UIResponder *)WeakRetained;
}

- (void)setFirstResponderTarget:(id)a3
{
}

- (UITargetedPreview)_primarySourcePreview
{
  return self->__primarySourcePreview;
}

- (void)set_primarySourcePreview:(id)a3
{
}

- (NSArray)_secondarySourcePreviews
{
  return self->__secondarySourcePreviews;
}

- (void)set_secondarySourcePreviews:(id)a3
{
}

- (id)_internalIdentifier
{
  return self->__internalIdentifier;
}

- (void)set_internalIdentifier:(id)a3
{
}

- (NSSet)_internalSecondaryItemIdentifiers
{
  return self->__internalSecondaryItemIdentifiers;
}

- (void)set_internalSecondaryItemIdentifiers:(id)a3
{
}

- (BOOL)prefersHorizontalAttachment
{
  return self->_prefersHorizontalAttachment;
}

- (int64_t)preferredMenuAlignment
{
  return self->_preferredMenuAlignment;
}

- (void)setPreferredMenuAlignment:(int64_t)a3
{
  self->_preferredMenuAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalSecondaryItemIdentifiers, 0);
  objc_storeStrong(&self->__internalIdentifier, 0);
  objc_storeStrong((id *)&self->__secondarySourcePreviews, 0);
  objc_storeStrong((id *)&self->__primarySourcePreview, 0);
  objc_destroyWeak((id *)&self->_firstResponderTarget);
  objc_storeStrong(&self->_actionProvider, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_secondaryItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (UITab)_tab
{
  return (UITab *)objc_getAssociatedObject(self, &_UITabContextMenuIdentifier);
}

- (void)_setTab:(id)a3
{
}

@end