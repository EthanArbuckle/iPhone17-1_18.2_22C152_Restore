@interface SXComponentInteractionHandlerManager
- (NSMapTable)interactionHandlers;
- (SXComponentInteractionHandlerManager)initWithViewport:(id)a3;
- (SXViewport)viewport;
- (id)componentViewForLocation:(CGPoint)a3;
- (id)interactionsForComponentView:(id)a3;
- (id)interactionsForComponentView:(id)a3 type:(unint64_t)a4;
- (void)addInteractionHandler:(id)a3 componentView:(id)a4 types:(unint64_t)a5;
- (void)removeInteractionHandler:(id)a3 componentView:(id)a4;
- (void)updateUserInteractionForComponentView:(id)a3;
@end

@implementation SXComponentInteractionHandlerManager

- (SXComponentInteractionHandlerManager)initWithViewport:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXComponentInteractionHandlerManager;
  v6 = [(SXComponentInteractionHandlerManager *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08968] mapTableWithKeyOptions:517 valueOptions:0];
    interactionHandlers = v6->_interactionHandlers;
    v6->_interactionHandlers = (NSMapTable *)v7;

    objc_storeStrong((id *)&v6->_viewport, a3);
  }

  return v6;
}

- (void)addInteractionHandler:(id)a3 componentView:(id)a4 types:(unint64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  if (v13 && v8)
  {
    v9 = [[SXComponentInteraction alloc] initWithComponentView:v8 handler:v13 types:a5];
    if ([(SXComponentInteraction *)v9 handlesType:8]
      && ([v13 conformsToProtocol:&unk_26D5A91D0] & 1) != 0
      || ![(SXComponentInteraction *)v9 handlesType:8])
    {
      objc_super v10 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
      v11 = [v10 objectForKey:v8];

      if (!v11)
      {
        v11 = [MEMORY[0x263EFF980] array];
        v12 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
        [v12 setObject:v11 forKey:v8];
      }
      [v11 addObject:v9];
      [(SXComponentInteractionHandlerManager *)self updateUserInteractionForComponentView:v8];
    }
  }
}

- (void)removeInteractionHandler:(id)a3 componentView:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v9 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
    objc_super v10 = [v9 objectForKey:v8];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = objc_msgSend(v10, "copy", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v17 = [v16 handler];

          if (v17 == v6) {
            [v10 removeObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [(SXComponentInteractionHandlerManager *)self updateUserInteractionForComponentView:v8];
  }
}

- (id)componentViewForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
  id v7 = [v6 keyEnumerator];

  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    v9 = (void *)v8;
    while (1)
    {
      [v9 absoluteFrame];
      v19.double x = x;
      v19.double y = y;
      if (CGRectContainsPoint(v21, v19))
      {
        objc_super v10 = [(SXComponentInteractionHandlerManager *)self viewport];
        objc_msgSend(v10, "convertPoint:toView:", v9, x, y);
        CGFloat v12 = v11;
        CGFloat v14 = v13;

        [v9 interactionFrame];
        v20.double x = v12;
        v20.double y = v14;
        if (CGRectContainsPoint(v22, v20)) {
          break;
        }
      }
      uint64_t v15 = [v7 nextObject];

      v9 = (void *)v15;
      if (!v15) {
        goto LABEL_6;
      }
    }
    id v16 = v9;
  }
  else
  {
LABEL_6:
    id v16 = 0;
  }

  return v16;
}

- (id)interactionsForComponentView:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 reverseObjectEnumerator];
  uint64_t v8 = [v7 allObjects];

  v9 = (void *)[v8 copy];
  objc_super v10 = v9;
  if (!v9) {
    v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v11 = v9;

  return v11;
}

- (id)interactionsForComponentView:(id)a3 type:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
  uint64_t v8 = [v7 objectForKey:v6];
  v9 = [v8 reverseObjectEnumerator];
  objc_super v10 = [v9 allObjects];
  id v11 = (void *)[v10 mutableCopy];

  CGFloat v12 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v19 = objc_msgSend(v18, "handlesType:", 2, (void)v24);
        if ((v4 & 2) != 0 && v19) {
          [v12 addObject:v18];
        }
        int v20 = [v18 handlesType:4];
        if ((v4 & 4) != 0 && v20) {
          [v12 addObject:v18];
        }
        int v21 = [v18 handlesType:8];
        if ((v4 & 8) != 0 && v21) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  CGRect v22 = (void *)[v12 copy];
  return v22;
}

- (void)updateUserInteractionForComponentView:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SXComponentInteractionHandlerManager *)self interactionHandlers];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 handlesType:2] & 1) != 0 || (objc_msgSend(v11, "handlesType:", 4))
        {
          uint64_t v12 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v12 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
LABEL_13:

  [v4 setUserInteractionEnabled:v12];
}

- (NSMapTable)interactionHandlers
{
  return self->_interactionHandlers;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_interactionHandlers, 0);
}

@end