@interface SKUIIndexBarDynamicElementEntryListController
- (BOOL)hidesIndexBar;
- (BOOL)needsRootTargetViewElement;
- (SKUIIndexBarDynamicElementEntryListController)initWithEntryListViewElement:(id)a3;
- (SKUIIndexBarEntryListViewElement)entryListViewElement;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)rootTargetIndexBarEntryID;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)_entityProviderDidInvalidateNotification:(id)a3;
- (void)dealloc;
- (void)reloadViewElementData;
- (void)setRootTargetViewElement:(id)a3;
@end

@implementation SKUIIndexBarDynamicElementEntryListController

- (SKUIIndexBarDynamicElementEntryListController)initWithEntryListViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarDynamicElementEntryListController initWithEntryListViewElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  v6 = [(SKUIIndexBarDynamicElementEntryListController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryListViewElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = v3;
  if (self->_entityProvider) {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E4F6EF68]);
  }

  v5.receiver = self;
  v5.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  [(SKUIIndexBarDynamicElementEntryListController *)&v5 dealloc];
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  v4 = [(SKUIEntityProviding *)self->_entityProvider indexBarEntryEntityValueProviderAtIndex:a3];
  [(SKUIViewElement *)self->_templateElement setEntityValueProvider:v4];
  objc_super v5 = SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_indexBarEntryViewElement, self->_templateElement);
  objc_msgSend(v5, "setVisibilityPriority:", objc_msgSend(v4, "visibilityPriority"));

  return v5;
}

- (BOOL)hidesIndexBar
{
  BOOL v3 = [(SKUIIndexBarEntryListViewElement *)self->_entryListViewElement isIndexBarHiddenWhenEmpty];
  if (v3)
  {
    int64_t v4 = [(SKUIDynamicPageSectionIndexMapper *)self->_dynamicIndexMapper totalNumberOfEntities];
    LOBYTE(v3) = v4 < [(SKUIIndexBarEntryListViewElement *)self->_entryListViewElement minimumEntityCount];
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
  int64_t v3 = [(SKUIDynamicPageSectionIndexMapper *)self->_dynamicIndexMapper totalNumberOfEntities];
  if (v3 < [(SKUIIndexBarEntryListViewElement *)self->_entryListViewElement minimumEntityCount]
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    return 0;
  }
  entityProvider = self->_entityProvider;

  return [(SKUIEntityProviding *)entityProvider numberOfIndexBarEntries];
}

- (void)reloadViewElementData
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  [(SKUIIndexBarEntryListController *)&v9 reloadViewElementData];
  int64_t v3 = [(SKUIIndexBarEntryListViewElement *)self->_entryListViewElement childIndexBarEntryElements];
  int64_t v4 = [v3 firstObject];

  indexBarEntryViewElement = self->_indexBarEntryViewElement;
  if (indexBarEntryViewElement == v4
    || ([(SKUIIndexBarEntryViewElement *)indexBarEntryViewElement isEqual:v4] & 1) != 0)
  {
    int v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_indexBarEntryViewElement, v4);
    int v6 = 1;
  }
  v7 = [(SKUIIndexBarEntryViewElement *)v4 childElement];
  templateElement = self->_templateElement;
  if (templateElement == v7 || ([(SKUIViewElement *)templateElement isEqual:v7] & 1) != 0)
  {
    if (!v6) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_templateElement, v7);
  }
  [(SKUIIndexBarEntryListController *)self _didInvalidate];
LABEL_11:
}

- (id)rootTargetIndexBarEntryID
{
  return [(SKUIIndexBarEntryListViewElement *)self->_entryListViewElement targetIndexBarEntryID];
}

- (void)setRootTargetViewElement:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  [(SKUIIndexBarEntryListController *)&v14 setRootTargetViewElement:a3];
  int64_t v4 = [(SKUIIndexBarEntryListController *)self rootTargetViewElement];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [v4 entityProvider];
    p_entityProvider = &self->_entityProvider;
    entityProvider = self->_entityProvider;
    if (entityProvider != v5 && ([(SKUIEntityProviding *)entityProvider isEqual:v5] & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      objc_super v9 = v8;
      v10 = (void *)MEMORY[0x1E4F6EF68];
      if (*p_entityProvider) {
        objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E4F6EF68]);
      }
      objc_storeStrong((id *)&self->_entityProvider, v5);
      dynamicIndexMapper = self->_dynamicIndexMapper;
      if (*p_entityProvider)
      {
        if (!dynamicIndexMapper)
        {
          v12 = objc_alloc_init(SKUIDynamicPageSectionIndexMapper);
          v13 = self->_dynamicIndexMapper;
          self->_dynamicIndexMapper = v12;

          dynamicIndexMapper = self->_dynamicIndexMapper;
        }
        -[SKUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicIndexMapper, "setEntityProvider:");
        [v9 addObserver:self selector:sel__entityProviderDidInvalidateNotification_ name:*v10 object:*p_entityProvider];
      }
      else
      {
        self->_dynamicIndexMapper = 0;
      }
      [(SKUIIndexBarEntryListController *)self _didInvalidate];
    }
  }
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4)
  {
    uint64_t v6 = a3;
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [(SKUIEntityProviding *)self->_entityProvider sectionForSectionIndexBarEntryAtIndex:v6];
    }
    *a4 = v6;
  }
  entryListViewElement = self->_entryListViewElement;

  return [(SKUIIndexBarEntryListViewElement *)entryListViewElement targetIndexBarEntryID];
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke;
  aBlock[3] = &unk_1E6422020;
  aBlock[4] = self;
  int64_t v3 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke_2;
    v4[3] = &unk_1E64238C0;
    objc_super v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) reloadData];
  v2 = *(void **)(a1 + 32);

  return [v2 _didInvalidate];
}

uint64_t __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SKUIIndexBarEntryListViewElement)entryListViewElement
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

- (void)initWithEntryListViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIndexBarDynamicElementEntryListController initWithEntryListViewElement:]";
}

@end