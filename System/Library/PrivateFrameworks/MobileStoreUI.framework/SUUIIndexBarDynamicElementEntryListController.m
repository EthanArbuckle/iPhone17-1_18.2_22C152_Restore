@interface SUUIIndexBarDynamicElementEntryListController
- (BOOL)hidesIndexBar;
- (BOOL)needsRootTargetViewElement;
- (SUUIIndexBarDynamicElementEntryListController)initWithEntryListViewElement:(id)a3;
- (SUUIIndexBarEntryListViewElement)entryListViewElement;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)rootTargetIndexBarEntryID;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)_entityProviderDidInvalidateNotification:(id)a3;
- (void)dealloc;
- (void)reloadViewElementData;
- (void)setRootTargetViewElement:(id)a3;
@end

@implementation SUUIIndexBarDynamicElementEntryListController

- (SUUIIndexBarDynamicElementEntryListController)initWithEntryListViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarDynamicElementEntryListController;
  v6 = [(SUUIIndexBarDynamicElementEntryListController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryListViewElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = v3;
  if (self->_entityProvider) {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x263F4B2F8]);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUUIIndexBarDynamicElementEntryListController;
  [(SUUIIndexBarDynamicElementEntryListController *)&v5 dealloc];
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  v4 = [(SUUIEntityProviding *)self->_entityProvider indexBarEntryEntityValueProviderAtIndex:a3];
  [(SUUIViewElement *)self->_templateElement setEntityValueProvider:v4];
  objc_super v5 = SUUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_indexBarEntryViewElement, self->_templateElement);
  objc_msgSend(v5, "setVisibilityPriority:", objc_msgSend(v4, "visibilityPriority"));

  return v5;
}

- (BOOL)hidesIndexBar
{
  BOOL v3 = [(SUUIIndexBarEntryListViewElement *)self->_entryListViewElement isIndexBarHiddenWhenEmpty];
  if (v3)
  {
    int64_t v4 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicIndexMapper totalNumberOfEntities];
    LOBYTE(v3) = v4 < [(SUUIIndexBarEntryListViewElement *)self->_entryListViewElement minimumEntityCount];
  }
  return v3;
}

- (BOOL)needsRootTargetViewElement
{
  return 1;
}

- (int64_t)numberOfEntryDescriptors
{
  if (!self->_templateElement) {
    return 0;
  }
  int64_t v3 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicIndexMapper totalNumberOfEntities];
  if (v3 < [(SUUIIndexBarEntryListViewElement *)self->_entryListViewElement minimumEntityCount]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  entityProvider = self->_entityProvider;
  return [(SUUIEntityProviding *)entityProvider numberOfIndexBarEntries];
}

- (void)reloadViewElementData
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarDynamicElementEntryListController;
  [(SUUIIndexBarEntryListController *)&v9 reloadViewElementData];
  int64_t v3 = [(SUUIIndexBarEntryListViewElement *)self->_entryListViewElement childIndexBarEntryElements];
  int64_t v4 = [v3 firstObject];

  indexBarEntryViewElement = self->_indexBarEntryViewElement;
  if (indexBarEntryViewElement == v4
    || ([(SUUIIndexBarEntryViewElement *)indexBarEntryViewElement isEqual:v4] & 1) != 0)
  {
    int v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_indexBarEntryViewElement, v4);
    int v6 = 1;
  }
  v7 = [(SUUIIndexBarEntryViewElement *)v4 childElement];
  templateElement = self->_templateElement;
  if (templateElement == v7 || ([(SUUIViewElement *)templateElement isEqual:v7] & 1) != 0)
  {
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_templateElement, v7);
  }
  [(SUUIIndexBarEntryListController *)self _didInvalidate];
LABEL_11:
}

- (id)rootTargetIndexBarEntryID
{
  return [(SUUIIndexBarEntryListViewElement *)self->_entryListViewElement targetIndexBarEntryID];
}

- (void)setRootTargetViewElement:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SUUIIndexBarDynamicElementEntryListController;
  [(SUUIIndexBarEntryListController *)&v14 setRootTargetViewElement:a3];
  int64_t v4 = [(SUUIIndexBarEntryListController *)self rootTargetViewElement];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [v4 entityProvider];
    p_entityProvider = &self->_entityProvider;
    entityProvider = self->_entityProvider;
    if (entityProvider != v5 && ([(SUUIEntityProviding *)entityProvider isEqual:v5] & 1) == 0)
    {
      v8 = [MEMORY[0x263F08A00] defaultCenter];
      objc_super v9 = v8;
      v10 = (void *)MEMORY[0x263F4B2F8];
      if (*p_entityProvider) {
        objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x263F4B2F8]);
      }
      objc_storeStrong((id *)&self->_entityProvider, v5);
      dynamicIndexMapper = self->_dynamicIndexMapper;
      if (*p_entityProvider)
      {
        if (!dynamicIndexMapper)
        {
          v12 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
          v13 = self->_dynamicIndexMapper;
          self->_dynamicIndexMapper = v12;

          dynamicIndexMapper = self->_dynamicIndexMapper;
        }
        -[SUUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicIndexMapper, "setEntityProvider:");
        [v9 addObserver:self selector:sel__entityProviderDidInvalidateNotification_ name:*v10 object:*p_entityProvider];
      }
      else
      {
        self->_dynamicIndexMapper = 0;
      }
      [(SUUIIndexBarEntryListController *)self _didInvalidate];
    }
  }
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4)
  {
    uint64_t v6 = a3;
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [(SUUIEntityProviding *)self->_entityProvider sectionForSectionIndexBarEntryAtIndex:v6];
    }
    *a4 = v6;
  }
  entryListViewElement = self->_entryListViewElement;
  return [(SUUIIndexBarEntryListViewElement *)entryListViewElement targetIndexBarEntryID];
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__SUUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke;
  aBlock[3] = &unk_265400980;
  aBlock[4] = self;
  int64_t v3 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __90__SUUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke_2;
    v4[3] = &unk_265403930;
    objc_super v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __90__SUUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) reloadData];
  v2 = *(void **)(a1 + 32);
  return [v2 _didInvalidate];
}

uint64_t __90__SUUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SUUIIndexBarEntryListViewElement)entryListViewElement
{
  return self->_entryListViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryListViewElement, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_indexBarEntryViewElement, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicIndexMapper, 0);
}

@end