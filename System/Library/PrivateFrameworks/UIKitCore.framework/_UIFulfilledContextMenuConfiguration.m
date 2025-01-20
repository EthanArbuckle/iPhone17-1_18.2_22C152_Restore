@interface _UIFulfilledContextMenuConfiguration
- (BOOL)isMultiItemMenu;
- (BOOL)isPresentable;
- (NSArray)accessoryViews;
- (NSArray)secondarySourcePreviews;
- (NSCopying)identifier;
- (NSSet)internalIdentifiers;
- (UIAction)previewAction;
- (UIMenu)menu;
- (UIResponder)firstResponderTarget;
- (UITargetedPreview)sourcePreview;
- (UIViewController)previewViewController;
- (unint64_t)badgeCount;
- (unint64_t)representedItemCount;
- (void)setAccessoryViews:(id)a3;
- (void)setBadgeCount:(unint64_t)a3;
- (void)setFirstResponderTarget:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMenu:(id)a3;
- (void)setPreviewAction:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)setPrimaryInternalIdentifier:(id)a3 secondaryIdentifiers:(id)a4;
- (void)setRepresentedItemCount:(unint64_t)a3;
- (void)setSecondarySourcePreviews:(id)a3;
- (void)setSourcePreview:(id)a3;
@end

@implementation _UIFulfilledContextMenuConfiguration

- (BOOL)isPresentable
{
  v3 = [(_UIFulfilledContextMenuConfiguration *)self previewViewController];
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = [(_UIFulfilledContextMenuConfiguration *)self menu];
    unint64_t v4 = ((unint64_t)[v5 metadata] >> 24) & 1;
  }
  return v4;
}

- (void)setPrimaryInternalIdentifier:(id)a3 secondaryIdentifiers:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObject:");
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    if (![v7 count]) {
      goto LABEL_8;
    }
    if (v8)
    {
      [(NSSet *)v8 unionSet:v7];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ([v6 count])
  {
LABEL_6:
    v8 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:
  internalIdentifiers = self->_internalIdentifiers;
  self->_internalIdentifiers = v8;
}

- (BOOL)isMultiItemMenu
{
  return [(_UIFulfilledContextMenuConfiguration *)self representedItemCount] > 1;
}

- (void)setMenu:(id)a3
{
  unint64_t v4 = [a3 _immutableCopy];
  menu = self->_menu;
  self->_menu = v4;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSSet)internalIdentifiers
{
  return self->_internalIdentifiers;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
}

- (NSArray)secondarySourcePreviews
{
  return self->_secondarySourcePreviews;
}

- (void)setSecondarySourcePreviews:(id)a3
{
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
}

- (NSArray)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (UIAction)previewAction
{
  return self->_previewAction;
}

- (void)setPreviewAction:(id)a3
{
}

- (unint64_t)representedItemCount
{
  return self->_representedItemCount;
}

- (void)setRepresentedItemCount:(unint64_t)a3
{
  self->_representedItemCount = a3;
}

- (unint64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(unint64_t)a3
{
  self->_badgeCount = a3;
}

- (UIResponder)firstResponderTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstResponderTarget);
  return (UIResponder *)WeakRetained;
}

- (void)setFirstResponderTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_firstResponderTarget);
  objc_storeStrong((id *)&self->_previewAction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_secondarySourcePreviews, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong((id *)&self->_internalIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end