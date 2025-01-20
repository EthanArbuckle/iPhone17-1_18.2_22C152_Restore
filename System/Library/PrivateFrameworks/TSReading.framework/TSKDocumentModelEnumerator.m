@interface TSKDocumentModelEnumerator
- (BOOL)filterBeforeAddingChildren;
- (NSMutableArray)enumeratorStack;
- (TSKDocumentModelEnumerator)initWithEnumerator:(id)a3 filter:(id)a4;
- (TSKDocumentModelEnumerator)initWithRootModelObject:(id)a3 filter:(id)a4;
- (TSKModel)root;
- (id)filter;
- (id)nextObject;
- (void)dealloc;
- (void)enumerateReferencedStylesUsingBlock:(id)a3;
- (void)enumerateUsingBlock:(id)a3;
- (void)setEnumeratorStack:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilterBeforeAddingChildren:(BOOL)a3;
- (void)setRoot:(id)a3;
@end

@implementation TSKDocumentModelEnumerator

- (TSKDocumentModelEnumerator)initWithRootModelObject:(id)a3 filter:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSKDocumentModelEnumerator;
  v6 = [(TSKDocumentModelEnumerator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(TSKDocumentModelEnumerator *)v6 setRoot:a3];
    [(TSKDocumentModelEnumerator *)v7 setFilter:a4];
    [(TSKDocumentModelEnumerator *)v7 setFilterBeforeAddingChildren:0];
  }
  return v7;
}

- (TSKDocumentModelEnumerator)initWithEnumerator:(id)a3 filter:(id)a4
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKDocumentModelEnumerator initWithEnumerator:filter:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentModelEnumerator.m"), 82, @"invalid nil value for '%s'", "enumerator");
  }
  v11.receiver = self;
  v11.super_class = (Class)TSKDocumentModelEnumerator;
  objc_super v9 = [(TSKDocumentModelEnumerator *)&v11 init];
  if (v9)
  {
    -[TSKDocumentModelEnumerator setEnumeratorStack:](v9, "setEnumeratorStack:", [MEMORY[0x263EFF980] arrayWithObject:a3]);
    [(TSKDocumentModelEnumerator *)v9 setFilter:a4];
    [(TSKDocumentModelEnumerator *)v9 setFilterBeforeAddingChildren:0];
  }
  return v9;
}

- (void)dealloc
{
  [(TSKDocumentModelEnumerator *)self setRoot:0];
  [(TSKDocumentModelEnumerator *)self setFilter:0];
  [(TSKDocumentModelEnumerator *)self setEnumeratorStack:0];
  v3.receiver = self;
  v3.super_class = (Class)TSKDocumentModelEnumerator;
  [(TSKDocumentModelEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  if (self->_enumeratorStack)
  {
    objc_super v3 = 0;
  }
  else
  {
    if ([(TSKDocumentModelEnumerator *)self filter]
      && (v4 = [(TSKDocumentModelEnumerator *)self filter],
          !v4[2](v4, [(TSKDocumentModelEnumerator *)self root], &self->_stop)))
    {
      objc_super v3 = 0;
    }
    else
    {
      objc_super v3 = [(TSKDocumentModelEnumerator *)self root];
    }
    [(TSKDocumentModelEnumerator *)self root];
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObject:", -[TSKModel childEnumerator](-[TSKDocumentModelEnumerator root](self, "root"), "childEnumerator"));
    }
    else {
      uint64_t v5 = [MEMORY[0x263EFF980] array];
    }
    [(TSKDocumentModelEnumerator *)self setEnumeratorStack:v5];
  }
  if ([(NSMutableArray *)[(TSKDocumentModelEnumerator *)self enumeratorStack] count] && !v3)
  {
    while (!self->_stop)
    {
      objc_super v3 = (TSKModel *)objc_msgSend((id)-[NSMutableArray lastObject](-[TSKDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"), "lastObject"), "nextObject");
      if (v3)
      {
        if (self->_filterBeforeAddingChildren)
        {
          if ([(TSKDocumentModelEnumerator *)self filter])
          {
            v6 = [(TSKDocumentModelEnumerator *)self filter];
            if (!v6[2](v6, v3, &self->_stop)) {
              objc_super v3 = 0;
            }
          }
        }
        if ((objc_opt_respondsToSelector() & 1) != 0 && [(TSKModel *)v3 childEnumerator]) {
          [(NSMutableArray *)[(TSKDocumentModelEnumerator *)self enumeratorStack] addObject:[(TSKModel *)v3 childEnumerator]];
        }
        if (!self->_filterBeforeAddingChildren)
        {
          if ([(TSKDocumentModelEnumerator *)self filter])
          {
            v7 = [(TSKDocumentModelEnumerator *)self filter];
            if (!v7[2](v7, v3, &self->_stop)) {
              objc_super v3 = 0;
            }
          }
        }
      }
      else
      {
        [(NSMutableArray *)[(TSKDocumentModelEnumerator *)self enumeratorStack] removeLastObject];
      }
      if (![(NSMutableArray *)[(TSKDocumentModelEnumerator *)self enumeratorStack] count]
        || v3)
      {
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

- (void)enumerateUsingBlock:(id)a3
{
  char v8 = 0;
  id v5 = [(TSKDocumentModelEnumerator *)self nextObject];
  if (v5)
  {
    id v6 = v5;
    do
    {
      (*((void (**)(id, id, char *))a3 + 2))(a3, v6, &v8);
      id v7 = [(TSKDocumentModelEnumerator *)self nextObject];
      if (!v7) {
        break;
      }
      id v6 = v7;
    }
    while (!v8);
  }
}

- (BOOL)filterBeforeAddingChildren
{
  return self->_filterBeforeAddingChildren;
}

- (void)setFilterBeforeAddingChildren:(BOOL)a3
{
  self->_filterBeforeAddingChildren = a3;
}

- (TSKModel)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (NSMutableArray)enumeratorStack
{
  return self->_enumeratorStack;
}

- (void)setEnumeratorStack:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void)enumerateReferencedStylesUsingBlock:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F7C870]);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = __Block_byref_object_copy__8;
  v7[4] = __Block_byref_object_dispose__8;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__TSKDocumentModelEnumerator_TSSAdditions__enumerateReferencedStylesUsingBlock___block_invoke;
  v6[3] = &unk_2646B10A0;
  v6[4] = v5;
  v6[5] = a3;
  v6[6] = v7;
  v7[5] = v6;
  [(TSKDocumentModelEnumerator *)self enumerateUsingBlock:v6];

  _Block_object_dispose(v7, 8);
}

void *__80__TSKDocumentModelEnumerator_TSSAdditions__enumerateReferencedStylesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  result = (void *)TSUClassAndProtocolCast();
  if (result)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(result, "referencedStyles", &unk_26D77B598);
    result = (void *)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (([*(id *)(a1 + 32) containsObject:v10] & 1) == 0)
        {
          result = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
          if (*a3) {
            break;
          }
          [*(id *)(a1 + 32) addObject:v10];
          result = (void *)(*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
          if (*a3) {
            break;
          }
        }
        if (v7 == (void *)++v9)
        {
          result = (void *)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          id v7 = result;
          if (result) {
            goto LABEL_4;
          }
          return result;
        }
      }
    }
  }
  return result;
}

@end