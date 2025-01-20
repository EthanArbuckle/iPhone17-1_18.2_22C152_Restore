@interface SKUIIndexBarSingleEntryListController
- (BOOL)hidesIndexBar;
- (BOOL)needsRootTargetViewElement;
- (SKUIIndexBarEntryViewElement)entryViewElement;
- (SKUIIndexBarSingleEntryListController)initWithEntryViewElement:(id)a3;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)reloadViewElementData;
@end

@implementation SKUIIndexBarSingleEntryListController

- (SKUIIndexBarSingleEntryListController)initWithEntryViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarSingleEntryListController initWithEntryViewElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIIndexBarSingleEntryListController;
  v6 = [(SKUIIndexBarSingleEntryListController *)&v9 init];
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
  v7.super_class = (Class)SKUIIndexBarSingleEntryListController;
  [(SKUIIndexBarEntryListController *)&v7 reloadViewElementData];
  v3 = [(SKUIIndexBarEntryViewElement *)self->_entryViewElement childElement];
  descriptiveViewElement = self->_descriptiveViewElement;
  if (descriptiveViewElement != v3 && ([(SKUIViewElement *)descriptiveViewElement isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptiveViewElement, v3);
    [(SKUIIndexBarEntryListController *)self _didInvalidate];
  }
  SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_entryViewElement, self->_descriptiveViewElement);
  id v5 = (SKUIIndexBarEntryDescriptor *)objc_claimAutoreleasedReturnValue();
  entryDescriptor = self->_entryDescriptor;
  if (entryDescriptor != v5 && ![(SKUIIndexBarEntryDescriptor *)entryDescriptor isEqual:v5])
  {
    objc_storeStrong((id *)&self->_entryDescriptor, v5);
    [(SKUIIndexBarEntryListController *)self _didInvalidate];
  }
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return [(SKUIIndexBarEntryViewElement *)self->_entryViewElement targetIndexBarEntryID];
}

- (SKUIIndexBarEntryViewElement)entryViewElement
{
  return self->_entryViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewElement, 0);
  objc_storeStrong((id *)&self->_descriptiveViewElement, 0);

  objc_storeStrong((id *)&self->_entryDescriptor, 0);
}

- (void)initWithEntryViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIndexBarSingleEntryListController initWithEntryViewElement:]";
}

@end