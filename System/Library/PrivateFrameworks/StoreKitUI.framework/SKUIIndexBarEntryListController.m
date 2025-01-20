@interface SKUIIndexBarEntryListController
+ (id)entryListControllerForEntryListViewElement:(id)a3;
+ (id)entryListControllerForEntryViewElement:(id)a3;
- (BOOL)hidesIndexBar;
- (BOOL)needsRootTargetViewElement;
- (NSString)rootTargetIndexBarEntryID;
- (SKUIIndexBarEntryListControllerDelegate)delegate;
- (SKUIViewElement)rootTargetViewElement;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)_didInvalidate;
- (void)reloadViewElementData;
- (void)setDelegate:(id)a3;
- (void)setRootTargetViewElement:(id)a3;
@end

@implementation SKUIIndexBarEntryListController

+ (id)entryListControllerForEntryViewElement:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntryListController entryListControllerForEntryViewElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = [[SKUIIndexBarSingleEntryListController alloc] initWithEntryViewElement:v3];

  return v12;
}

+ (id)entryListControllerForEntryListViewElement:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntryListController entryListControllerForEntryListViewElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 entryListElementType];
  if (v12 == 2)
  {
    v13 = [[SKUIIndexBarLocaleStandardEntryListController alloc] initWithSKUIIndexBarEntryListViewElement:v3];
    goto LABEL_9;
  }
  if (v12 == 1)
  {
    v13 = [[SKUIIndexBarDynamicElementEntryListController alloc] initWithEntryListViewElement:v3];
LABEL_9:
    v14 = v13;
    goto LABEL_11;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUIIndexBarEntryListController entryDescriptorAtIndex:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)reloadViewElementData
{
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIIndexBarEntryListController targetIndexBarEntryIDForEntryDescriptorAtIndex:returningRelativeSectionIndex:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  return 0;
}

- (void)_didInvalidate
{
  id v3 = [(SKUIIndexBarEntryListController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 indexBarEntryListControllerDidInvalidate:self];
  }
}

- (SKUIIndexBarEntryListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIIndexBarEntryListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)needsRootTargetViewElement
{
  return self->_needsRootTargetViewElement;
}

- (BOOL)hidesIndexBar
{
  return self->_hidesIndexBar;
}

- (NSString)rootTargetIndexBarEntryID
{
  return self->_rootTargetIndexBarEntryID;
}

- (SKUIViewElement)rootTargetViewElement
{
  return self->_rootTargetViewElement;
}

- (void)setRootTargetViewElement:(id)a3
{
}

- (int64_t)numberOfEntryDescriptors
{
  return self->_numberOfEntryDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootTargetViewElement, 0);
  objc_storeStrong((id *)&self->_rootTargetIndexBarEntryID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)entryListControllerForEntryViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)entryListControllerForEntryListViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)entryDescriptorAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)targetIndexBarEntryIDForEntryDescriptorAtIndex:(uint64_t)a3 returningRelativeSectionIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end