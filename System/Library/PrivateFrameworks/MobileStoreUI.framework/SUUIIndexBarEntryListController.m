@interface SUUIIndexBarEntryListController
+ (id)entryListControllerForEntryListViewElement:(id)a3;
+ (id)entryListControllerForEntryViewElement:(id)a3;
- (BOOL)hidesIndexBar;
- (BOOL)needsRootTargetViewElement;
- (NSString)rootTargetIndexBarEntryID;
- (SUUIIndexBarEntryListControllerDelegate)delegate;
- (SUUIViewElement)rootTargetViewElement;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)_didInvalidate;
- (void)setDelegate:(id)a3;
- (void)setRootTargetViewElement:(id)a3;
@end

@implementation SUUIIndexBarEntryListController

+ (id)entryListControllerForEntryViewElement:(id)a3
{
  id v3 = a3;
  v4 = [[SUUIIndexBarSingleEntryListController alloc] initWithEntryViewElement:v3];

  return v4;
}

+ (id)entryListControllerForEntryListViewElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 entryListElementType];
  if (v4 == 2)
  {
    v5 = [[SUUIIndexBarLocaleStandardEntryListController alloc] initWithSUUIIndexBarEntryListViewElement:v3];
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = [[SUUIIndexBarDynamicElementEntryListController alloc] initWithEntryListViewElement:v3];
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  return 0;
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  return 0;
}

- (void)_didInvalidate
{
  id v3 = [(SUUIIndexBarEntryListController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 indexBarEntryListControllerDidInvalidate:self];
  }
}

- (SUUIIndexBarEntryListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIIndexBarEntryListControllerDelegate *)WeakRetained;
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

- (SUUIViewElement)rootTargetViewElement
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

@end