@interface SUUIViewElement
- (BOOL)canMoveWithinCollection;
- (BOOL)descendsFromElementWithType:(unint64_t)a3;
- (BOOL)handlesBackgroundColorDirectly;
- (BOOL)isDescendentFromViewElement:(id)a3;
- (BOOL)isDynamicContainer;
- (BOOL)isEnabled;
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (IKEntityValueProviding)entityValueProvider;
- (IKEntityValueProviding)explicitEntityValueProvider;
- (NSArray)flattenedChildren;
- (NSCopying)uniquingMapKey;
- (NSSet)entityValueProperties;
- (NSSet)personalizationLibraryItems;
- (NSString)indexBarEntryID;
- (SUUIEntityProviding)entityProvider;
- (SUUIEntityProviding)explicitEntityProvider;
- (SUUIViewElement)elementWithIdentifier:(id)a3;
- (SUUIViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)ancestorElementMatchingPredicate:(id)a3;
- (id)ancestorElementOfType:(unint64_t)a3;
- (id)applyUpdatesWithElement:(id)a3;
- (id)expandableLabelElementForWidth:(double)a3 context:(id)a4;
- (id)featureWithName:(id)a3;
- (id)firstChildForElementName:(id)a3;
- (id)firstChildForElementType:(unint64_t)a3;
- (id)firstDescendentWithIndexBarEntryID:(id)a3;
- (int64_t)pageComponentType;
- (int64_t)pinGroup;
- (int64_t)pinStyle;
- (void)_entityProviderDidInvalidateNotification:(id)a3;
- (void)_entityValueProviderDidChange;
- (void)_registerForNotificationsForEntityProvider:(id)a3;
- (void)_unregisterForNotificationsForEntityProvider:(id)a3;
- (void)dealloc;
- (void)enumerateChildrenUsingBlock:(id)a3;
- (void)enumerateViewElementsWithDictionary:(id)a3 factory:(id)a4 usingBlock:(id)a5;
- (void)setEntityValueProvider:(id)a3;
- (void)setExplicitEntityValueProvider:(id)a3;
@end

@implementation SUUIViewElement

- (id)expandableLabelElementForWidth:(double)a3 context:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__SUUIViewElement_SUUIReviewListPageSection__expandableLabelElementForWidth_context___block_invoke;
  v10[3] = &unk_265400BE8;
  id v7 = v6;
  double v13 = a3;
  id v11 = v7;
  v12 = &v14;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __85__SUUIViewElement_SUUIReviewListPageSection__expandableLabelElementForWidth_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ([v8 elementType] == 138 && objc_msgSend(v8, "labelViewStyle") == 1)
  {
    id v6 = [*(id *)(a1 + 32) editorialLayoutForLabelElement:v8 width:*(double *)(a1 + 48)];
    if (([*(id *)(a1 + 32) isEditorialLayoutExpanded:v6] & 1) == 0)
    {
      id v7 = [v6 bodyTextLayoutForOrientation:0];
      if ([v7 requiresTruncation])
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *a3 = 1;
      }
    }
  }
}

- (SUUIViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"pin"];
    if ([v10 isEqualToString:@"alone"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"group"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"rubberband"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"group-rubberband"])
    {
      uint64_t v11 = 5;
    }
    else
    {
      if (![v10 length])
      {
LABEL_14:
        double v13 = [v8 getAttribute:@"pinGroup"];
        v9->_pinGroup = [v13 isEqualToString:@"before-top"];

        goto LABEL_15;
      }
      int v12 = [v10 BOOLValue];
      uint64_t v11 = 1;
      if (v12) {
        uint64_t v11 = 2;
      }
    }
    v9->_pinStyle = v11;
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

- (void)dealloc
{
  if (self->_entityProvider) {
    -[SUUIViewElement _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:");
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewElement;
  [(SUUIViewElement *)&v3 dealloc];
}

- (BOOL)canMoveWithinCollection
{
  v2 = [(SUUIViewElement *)self attributes];
  objc_super v3 = [v2 objectForKey:@"canMoveWithinCollection"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)ancestorElementMatchingPredicate:(id)a3
{
  char v4 = (unsigned int (**)(id, id))a3;
  id v5 = [(SUUIViewElement *)self parent];
  if (v5)
  {
    while (!v4[2](v4, v5))
    {
      id v6 = [v5 parent];

      id v5 = v6;
      if (!v6) {
        goto LABEL_7;
      }
    }
    id v5 = v5;
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
LABEL_7:

  return v5;
}

- (id)ancestorElementOfType:(unint64_t)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__SUUIViewElement_ancestorElementOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e25_B16__0__SUUIViewElement_8l;
  v5[4] = a3;
  objc_super v3 = [(SUUIViewElement *)self ancestorElementMatchingPredicate:v5];
  return v3;
}

BOOL __41__SUUIViewElement_ancestorElementOfType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementType] == *(void *)(a1 + 32);
}

- (BOOL)descendsFromElementWithType:(unint64_t)a3
{
  uint64_t v4 = [(SUUIViewElement *)self parent];
  if (!v4) {
    return 0;
  }
  id v5 = (void *)v4;
  do
  {
    uint64_t v6 = [v5 elementType];
    id v7 = [v5 parent];

    id v5 = v7;
    BOOL v8 = v6 == a3;
  }
  while (!v8 && v7);

  return v8;
}

- (BOOL)isDescendentFromViewElement:(id)a3
{
  uint64_t v4 = self;
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  do
  {
    uint64_t v6 = [(SUUIViewElement *)v5 parent];

    BOOL v7 = v5 == a3;
    BOOL v8 = v5 == a3;
    id v5 = v6;
  }
  while (!v7 && v6);

  return v8;
}

- (SUUIViewElement)elementWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__36;
  id v19 = __Block_byref_object_dispose__36;
  id v20 = 0;
  id v5 = [(SUUIViewElement *)self itmlID];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    BOOL v7 = v16;
    BOOL v8 = self;
    v9 = (void *)v7[5];
    v7[5] = (uint64_t)v8;
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__SUUIViewElement_elementWithIdentifier___block_invoke;
    v12[3] = &unk_265402C18;
    uint64_t v14 = &v15;
    id v13 = v4;
    [(SUUIViewElement *)self enumerateChildrenUsingBlock:v12];
    v9 = v13;
  }

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (SUUIViewElement *)v10;
}

void __41__SUUIViewElement_elementWithIdentifier___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5 = [a2 elementWithIdentifier:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (SUUIEntityProviding)entityProvider
{
  objc_super v3 = [(SUUIViewElement *)self explicitEntityProvider];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(SUUIViewElement *)self parent];
    id v5 = [v6 entityProvider];
  }
  return (SUUIEntityProviding *)v5;
}

- (IKEntityValueProviding)entityValueProvider
{
  objc_super v3 = [(SUUIViewElement *)self explicitEntityValueProvider];
  if (!v3)
  {
    id v4 = [(SUUIViewElement *)self entityProvider];
    id v5 = [(SUUIViewElement *)self parent];
    if (v5)
    {
      while (1)
      {
        uint64_t v6 = [v5 entityProvider];
        if (v4 != v6 && ([v4 isEqual:v6] & 1) == 0) {
          break;
        }
        uint64_t v7 = [v5 explicitEntityValueProvider];
        if (v7) {
          goto LABEL_12;
        }
        uint64_t v8 = [v5 parent];

        id v5 = (void *)v8;
        if (!v8) {
          goto LABEL_9;
        }
      }
    }
LABEL_9:
    if ([v4 numberOfSections] && objc_msgSend(v4, "numberOfEntitiesInSection:", 0))
    {
      uint64_t v6 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
      uint64_t v7 = [v4 entityValueProviderAtIndexPath:v6];
LABEL_12:
      objc_super v3 = (void *)v7;
    }
    else
    {
      objc_super v3 = 0;
    }
  }
  return (IKEntityValueProviding *)v3;
}

- (SUUIEntityProviding)explicitEntityProvider
{
  if (!self->_hasValidEntityProvider)
  {
    self->_hasValidEntityProvider = 1;
    objc_super v3 = [(SUUIViewElement *)self attributes];
    id v4 = [v3 objectForKey:@"entityProviderID"];

    if ([v4 length])
    {
      id v5 = [(IKViewElement *)self entityProviderList];
      uint64_t v6 = [v5 entityProviderWithIdentifier:v4];
      entityProvider = self->_entityProvider;
      self->_entityProvider = v6;

      if (self->_entityProvider)
      {
        -[SUUIViewElement _registerForNotificationsForEntityProvider:](self, "_registerForNotificationsForEntityProvider:");
      }
      else
      {
        uint64_t v8 = [(SUUIViewElement *)self description];
        NSLog(&cfstr_ErrorNoEntityP.isa, v4, v8);
      }
    }
  }
  v9 = self->_entityProvider;
  return v9;
}

- (IKEntityValueProviding)explicitEntityValueProvider
{
  return self->_entityValueProvider;
}

- (NSSet)entityValueProperties
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [(SUUIViewElement *)self children];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) entityValueProperties];
        if (v8)
        {
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          [v5 unionSet:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSSet *)v5;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SUUIViewElement *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v5);
      }
      v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __47__SUUIViewElement_enumerateChildrenUsingBlock___block_invoke;
        v10[3] = &unk_265403F40;
        id v11 = v4;
        long long v12 = &v17;
        [v9 enumerateChildrenUsingBlock:v10];
      }
      else
      {
        (*((void (**)(id, void *, uint64_t *))v4 + 2))(v4, v9, v18 + 3);
      }
      if (*((unsigned char *)v18 + 24)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __47__SUUIViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateViewElementsWithDictionary:(id)a3 factory:(id)a4 usingBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = [a3 objectForKey:@"c"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__SUUIViewElement_enumerateViewElementsWithDictionary_factory_usingBlock___block_invoke;
  v13[3] = &unk_265403F68;
  id v14 = v8;
  long long v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 enumerateObjectsUsingBlock:v13];
}

uint64_t __74__SUUIViewElement_enumerateViewElementsWithDictionary_factory_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) elementForDictionary:a2 parent:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (id)featureWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SUUIViewElement *)self features];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "featureName", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstChildForElementType:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__36;
  long long v10 = __Block_byref_object_dispose__36;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SUUIViewElement_firstChildForElementType___block_invoke;
  v5[3] = &unk_265401700;
  v5[4] = &v6;
  void v5[5] = a3;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SUUIViewElement_firstChildForElementType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 elementType] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)firstChildForElementName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__36;
  long long v15 = __Block_byref_object_dispose__36;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SUUIViewElement_firstChildForElementName___block_invoke;
  v8[3] = &unk_265403F90;
  id v5 = v4;
  id v9 = v5;
  long long v10 = &v11;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __44__SUUIViewElement_firstChildForElementName___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = [a2 elementName];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)flattenedChildren
{
  flattenedChildren = self->_flattenedChildren;
  if (!flattenedChildren)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = self->_flattenedChildren;
    self->_flattenedChildren = v4;

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SUUIViewElement_flattenedChildren__block_invoke;
    v7[3] = &unk_2654008B8;
    v7[4] = self;
    [(SUUIViewElement *)self enumerateChildrenUsingBlock:v7];
    flattenedChildren = self->_flattenedChildren;
  }
  return (NSArray *)flattenedChildren;
}

uint64_t __36__SUUIViewElement_flattenedChildren__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) addObject:a2];
}

- (BOOL)isDynamicContainer
{
  return 0;
}

- (BOOL)isEnabled
{
  v2 = [(SUUIViewElement *)self parent];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isEnabled];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int64_t)pageComponentType
{
  return 0;
}

- (NSSet)personalizationLibraryItems
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  char v4 = [(SUUIViewElement *)self children];
  SUUIViewElementAccumulatePersonalizationLibraryItemsForChildren(v3, v4);

  return (NSSet *)v3;
}

- (BOOL)rendersWithPerspective
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SUUIViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) rendersWithPerspective])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)rendersWithParallax
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SUUIViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) rendersWithParallax])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setEntityValueProvider:(id)a3
{
  id v5 = a3;
  uint64_t entityValueProvider = (uint64_t)self->_entityValueProvider;
  if ((id)entityValueProvider != v5)
  {
    id v7 = v5;
    uint64_t entityValueProvider = [(id)entityValueProvider isEqual:v5];
    id v5 = v7;
    if ((entityValueProvider & 1) == 0)
    {
      objc_storeStrong((id *)&self->_entityValueProvider, a3);
      uint64_t entityValueProvider = [(SUUIViewElement *)self _entityValueProviderDidChange];
      id v5 = v7;
    }
  }
  MEMORY[0x270F9A758](entityValueProvider, v5);
}

- (NSCopying)uniquingMapKey
{
  v2 = [(SUUIViewElement *)self parent];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 uniquingMapKey];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSCopying *)v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SUUIViewElement *)a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIViewElement;
  id v5 = [(SUUIViewElement *)&v17 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self)
  {
    if (!v4) {
      goto LABEL_17;
    }
LABEL_6:
    self->_hasValidEntityProvider = 0;
    p_entityProvider = (id *)&self->_entityProvider;
    if (self->_entityProvider)
    {
      -[SUUIViewElement _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:");
      id v9 = *p_entityProvider;
      id *p_entityProvider = 0;
    }
    flattenedChildren = self->_flattenedChildren;
    self->_flattenedChildren = 0;

    self->_pinStyle = [(SUUIViewElement *)v4 pinStyle];
    uint64_t v11 = [(SUUIViewElement *)v4 explicitEntityValueProvider];
    uint64_t entityValueProvider = self->_entityValueProvider;
    if (entityValueProvider == v11
      || ([(IKEntityValueProviding *)entityValueProvider isEqual:v11] & 1) != 0)
    {
      int v13 = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_entityValueProvider, v11);
      int v13 = 1;
    }
    id v14 = [(SUUIViewElement *)v4 explicitEntityProvider];
    if (*p_entityProvider == v14 || ([*p_entityProvider isEqual:v14] & 1) != 0)
    {
      if (!v13)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      if (*p_entityProvider) {
        -[SUUIViewElement _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:");
      }
      objc_storeStrong((id *)&self->_entityProvider, v14);
      if (*p_entityProvider) {
        -[SUUIViewElement _registerForNotificationsForEntityProvider:](self, "_registerForNotificationsForEntityProvider:");
      }
      if (self->_entityValueProvider) {
        char v16 = v13;
      }
      else {
        char v16 = 1;
      }
      if ((v16 & 1) == 0) {
        goto LABEL_16;
      }
    }
    [(SUUIViewElement *)self _entityValueProviderDidChange];
    goto LABEL_16;
  }
  uint64_t v7 = [v5 updateType];
  if (v4 && v7) {
    goto LABEL_6;
  }
LABEL_17:

  return v6;
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__SUUIViewElement__entityProviderDidInvalidateNotification___block_invoke;
  aBlock[3] = &unk_265400980;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v3[2](v3);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v3);
  }
}

uint64_t __60__SUUIViewElement__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _entityValueProviderDidChange];
}

- (void)_entityValueProviderDidChange
{
  [(SUUIViewElement *)self entityValueProviderDidChange];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__36;
  v6[4] = __Block_byref_object_dispose__36;
  id v7 = 0;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SUUIViewElement__entityValueProviderDidChange__block_invoke;
  v3[3] = &unk_265403FB8;
  v3[5] = v4;
  v3[6] = v6;
  v3[4] = self;
  [(SUUIViewElement *)self enumerateChildrenUsingBlock:v3];
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(v6, 8);
}

void __48__SUUIViewElement__entityValueProviderDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 explicitEntityValueProvider];

  uint64_t v4 = v11;
  if (!v3)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 1;
      uint64_t v6 = [*(id *)(a1 + 32) entityProvider];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v4 = v11;
    }
    id v9 = [v4 entityProvider];
    long long v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v10 == v9 || [v10 isEqual:v9]) {
      [v11 _entityValueProviderDidChange];
    }

    uint64_t v4 = v11;
  }
}

- (void)_registerForNotificationsForEntityProvider:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__entityProviderDidInvalidateNotification_ name:*MEMORY[0x263F4B2F8] object:v5];
  }
}

- (void)_unregisterForNotificationsForEntityProvider:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x263F4B2F8] object:v5];
  }
}

- (int64_t)pinStyle
{
  return self->_pinStyle;
}

- (int64_t)pinGroup
{
  return self->_pinGroup;
}

- (void)setExplicitEntityValueProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitEntityValueProvider, 0);
  objc_storeStrong((id *)&self->_flattenedChildren, 0);
  objc_storeStrong((id *)&self->_entityValueProvider, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
}

- (id)firstDescendentWithIndexBarEntryID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(SUUIViewElement *)self indexBarEntryID];
    int v6 = [v5 isEqualToString:v4];

    if (v6)
    {
      uint64_t v7 = self;
    }
    else
    {
      uint64_t v12 = 0;
      int v13 = &v12;
      uint64_t v14 = 0x3032000000;
      long long v15 = __Block_byref_object_copy__37;
      char v16 = __Block_byref_object_dispose__37;
      id v17 = 0;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __77__SUUIViewElement_SUUIIndexBarAdditions__firstDescendentWithIndexBarEntryID___block_invoke;
      v9[3] = &unk_265403F90;
      id v10 = v4;
      id v11 = &v12;
      [(SUUIViewElement *)self enumerateChildrenUsingBlock:v9];
      uint64_t v7 = (SUUIViewElement *)(id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __77__SUUIViewElement_SUUIIndexBarAdditions__firstDescendentWithIndexBarEntryID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  int v6 = [v11 indexBarEntryID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    uint64_t v8 = [v11 firstDescendentWithIndexBarEntryID:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      goto LABEL_5;
    }
  }
  *a3 = 1;
LABEL_5:
}

- (NSString)indexBarEntryID
{
  v2 = [(SUUIViewElement *)self attributes];
  uint64_t v3 = [v2 objectForKey:@"indexBarEntryID"];

  if (v3 && ![v3 length])
  {

    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)handlesBackgroundColorDirectly
{
  if ([(SUUIViewElement *)self elementType] == 66)
  {
    uint64_t v3 = self;
    if ([(SUUIViewElement *)v3 lockupViewType] == 7)
    {

      return 1;
    }
    uint64_t v4 = [(SUUIViewElement *)v3 lockupViewType];

    if (v4 == 6) {
      return 1;
    }
  }
  return 0;
}

@end