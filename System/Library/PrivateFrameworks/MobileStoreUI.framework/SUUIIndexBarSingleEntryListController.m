@interface SUUIIndexBarSingleEntryListController
- (BOOL)hidesIndexBar;
- (BOOL)needsRootTargetViewElement;
- (SUUIIndexBarEntryViewElement)entryViewElement;
- (SUUIIndexBarSingleEntryListController)initWithEntryViewElement:(id)a3;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)reloadViewElementData;
@end

@implementation SUUIIndexBarSingleEntryListController

- (SUUIIndexBarSingleEntryListController)initWithEntryViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarSingleEntryListController;
  v6 = [(SUUIIndexBarSingleEntryListController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryViewElement, a3);
  }

  return v7;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  return self->_entryDescriptor;
}

- (BOOL)hidesIndexBar
{
  return 0;
}

- (BOOL)needsRootTargetViewElement
{
  return 0;
}

- (int64_t)numberOfEntryDescriptors
{
  return self->_entryDescriptor != 0;
}

- (void)reloadViewElementData
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIIndexBarSingleEntryListController;
  [(SUUIIndexBarEntryListController *)&v7 reloadViewElementData];
  v3 = [(SUUIIndexBarEntryViewElement *)self->_entryViewElement childElement];
  descriptiveViewElement = self->_descriptiveViewElement;
  if (descriptiveViewElement != v3 && ([(SUUIViewElement *)descriptiveViewElement isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptiveViewElement, v3);
    [(SUUIIndexBarEntryListController *)self _didInvalidate];
  }
  SUUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_entryViewElement, self->_descriptiveViewElement);
  id v5 = (SUUIIndexBarEntryDescriptor *)objc_claimAutoreleasedReturnValue();
  entryDescriptor = self->_entryDescriptor;
  if (entryDescriptor != v5 && ![(SUUIIndexBarEntryDescriptor *)entryDescriptor isEqual:v5])
  {
    objc_storeStrong((id *)&self->_entryDescriptor, v5);
    [(SUUIIndexBarEntryListController *)self _didInvalidate];
  }
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return [(SUUIIndexBarEntryViewElement *)self->_entryViewElement targetIndexBarEntryID];
}

- (SUUIIndexBarEntryViewElement)entryViewElement
{
  return self->_entryViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewElement, 0);
  objc_storeStrong((id *)&self->_descriptiveViewElement, 0);
  objc_storeStrong((id *)&self->_entryDescriptor, 0);
}

@end