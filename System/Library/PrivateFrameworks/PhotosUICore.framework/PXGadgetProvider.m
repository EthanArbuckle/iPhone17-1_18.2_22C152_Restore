@interface PXGadgetProvider
- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (BOOL)invalidGadgets;
- (BOOL)isPerformingChanges;
- (NSArray)gadgets;
- (NSString)identifier;
- (PXGadgetDelegate)nextGadgetResponder;
- (PXGadgetProvider)init;
- (PXGadgetProvider)initWithIdentifier:(id)a3;
- (PXGadgetProviderDelegate)delegate;
- (id)gadgetViewControllerHostingGadget:(id)a3;
- (id)presentationEnvironmentForGadget:(id)a3;
- (unint64_t)estimatedNumberOfGadgets;
- (void)_teardownGadget:(id)a3;
- (void)_updateIfNeeded;
- (void)addGadgets:(id)a3;
- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)gadget:(id)a3 animateChanges:(id)a4;
- (void)gadget:(id)a3 didChange:(unint64_t)a4;
- (void)generateGadgets;
- (void)insertGadgets:(id)a3 atIndexes:(id)a4;
- (void)performChanges:(id)a3;
- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeAllGadgets;
- (void)removeGadgets:(id)a3;
- (void)removeGadgetsAtIndexes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGadgets:(id)a3;
- (void)setInvalidGadgets:(BOOL)a3;
- (void)setIsPerformingChanges:(BOOL)a3;
- (void)setNextGadgetResponder:(id)a3;
@end

@implementation PXGadgetProvider

- (void)setDelegate:(id)a3
{
}

- (PXGadgetProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXGadgetProvider;
  v2 = [(PXGadgetProvider *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    gadgets = v2->_gadgets;
    v2->_gadgets = v6;
  }
  return v2;
}

- (PXGadgetProvider)initWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 39, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXGadgetProvider;
  v7 = [(PXGadgetProvider *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_identifier, a3);
    objc_super v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    gadgets = v8->_gadgets;
    v8->_gadgets = v9;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgets, 0);
  objc_destroyWeak((id *)&self->_nextGadgetResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setInvalidGadgets:(BOOL)a3
{
  self->_invalidGadgets = a3;
}

- (BOOL)invalidGadgets
{
  return self->_invalidGadgets;
}

- (void)setIsPerformingChanges:(BOOL)a3
{
  self->_isPerformingChanges = a3;
}

- (BOOL)isPerformingChanges
{
  return self->_isPerformingChanges;
}

- (void)setGadgets:(id)a3
{
}

- (NSArray)gadgets
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNextGadgetResponder:(id)a3
{
}

- (PXGadgetDelegate)nextGadgetResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextGadgetResponder);
  return (PXGadgetDelegate *)WeakRetained;
}

- (PXGadgetProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGadgetProviderDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v4 = a3;
  v5 = [(PXGadgetProvider *)self nextGadgetResponder];
  id v6 = [v5 presentationEnvironmentForGadget:v4];

  return v6;
}

- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXGadgetProvider *)self nextGadgetResponder];
  [v10 dismissGadgetViewController:v9 animated:v5 completion:v8];
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PXGadgetProvider *)self nextGadgetResponder];
  [v10 presentGadgetViewController:v9 animated:v5 completion:v8];
}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_super v13 = [(PXGadgetProvider *)self nextGadgetResponder];
  v14 = v13;
  if (v13) {
    char v15 = [v13 gadget:v10 transitionToViewController:v11 animated:v7 completion:v12];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if ((a4 & 0x20) != 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__PXGadgetProvider_gadget_didChange___block_invoke;
    v13[3] = &unk_1E5DC3398;
    id v14 = v6;
    [(PXGadgetProvider *)self performChanges:v13];
  }
  uint64_t v8 = [(PXGadgetProvider *)self nextGadgetResponder];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(PXGadgetProvider *)self nextGadgetResponder];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(PXGadgetProvider *)self nextGadgetResponder];
      [v12 gadget:v7 didChange:a4];
    }
  }
}

void __37__PXGadgetProvider_gadget_didChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "removeGadgets:", v4, v5, v6);
}

- (void)gadget:(id)a3 animateChanges:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(PXGadgetProvider *)self nextGadgetResponder];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(PXGadgetProvider *)self nextGadgetResponder];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = [(PXGadgetProvider *)self nextGadgetResponder];
      [v11 gadget:v12 animateChanges:v6];
    }
  }
}

- (id)gadgetViewControllerHostingGadget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGadgetProvider *)self nextGadgetResponder];
  if (v5
    && (id v6 = (void *)v5,
        [(PXGadgetProvider *)self nextGadgetResponder],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = [(PXGadgetProvider *)self nextGadgetResponder];
    char v10 = [v9 gadgetViewControllerHostingGadget:v4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_teardownGadget:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  if (objc_opt_respondsToSelector()) {
    [v3 gadgetWasDismissed];
  }
}

- (void)_updateIfNeeded
{
  if ([(PXGadgetProvider *)self invalidGadgets])
  {
    uint64_t v3 = [(PXGadgetProvider *)self delegate];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [(PXGadgetProvider *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = [(PXGadgetProvider *)self delegate];
        [v7 invalidateGadgets];
      }
    }
    [(PXGadgetProvider *)self setInvalidGadgets:0];
  }
}

- (void)removeAllGadgets
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(PXGadgetProvider *)self isPerformingChanges])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = NSStringFromSelector(a2);
    [v16 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 206, @"[%@] %@ must be called from a performChanges block.", self, v17 object file lineNumber description];
  }
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%@: Removing all gadgets", buf, 0xCu);
  }
  char v6 = [(PXGadgetProvider *)self gadgets];
  if ([v6 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          [(PXGadgetProvider *)self _teardownGadget:*(void *)(*((void *)&v18 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v9);
    }

    [(PXGadgetProvider *)self setGadgets:MEMORY[0x1E4F1CBF0]];
    id v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_super v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "%@: Removed gadgets %@", buf, 0x16u);
    }
    [(PXGadgetProvider *)self setInvalidGadgets:1];
  }
  else
  {
    id v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      char v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "%@: No gadgets removed", buf, 0xCu);
    }
  }
}

- (void)removeGadgetsAtIndexes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(PXGadgetProvider *)self isPerformingChanges])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    char v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 186, @"[%@] %@ must be called from a performChanges block.", self, v15 object file lineNumber description];
  }
  uint64_t v6 = [v5 count];
  id v7 = PLUIGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v18 = v9;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@: Removing gadgets at indexes %@", buf, 0x16u);
    }
    uint64_t v10 = [(PXGadgetProvider *)self gadgets];
    id v7 = [v10 mutableCopy];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__PXGadgetProvider_removeGadgetsAtIndexes___block_invoke;
    v16[3] = &unk_1E5DAF780;
    v16[4] = self;
    [v7 enumerateObjectsAtIndexes:v5 options:0 usingBlock:v16];
    [v7 removeObjectsAtIndexes:v5];
    [(PXGadgetProvider *)self setGadgets:v7];
    uint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "%@: Removed gadgets at indexes %@", buf, 0x16u);
    }
    [(PXGadgetProvider *)self setInvalidGadgets:1];
  }
  else if (v8)
  {
    objc_super v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    long long v18 = v13;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to remove gadgets at zero indexes", buf, 0xCu);
  }
}

uint64_t __43__PXGadgetProvider_removeGadgetsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _teardownGadget:a2];
}

- (void)removeGadgets:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(PXGadgetProvider *)self isPerformingChanges])
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v24 = NSStringFromSelector(a2);
    [v23 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 155, @"[%@] %@ must be called from a performChanges block.", self, v24 object file lineNumber description];
  }
  uint64_t v6 = [v5 count];
  id v7 = PLUIGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v31 = v9;
      __int16 v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@: Removing gadgets %@", buf, 0x16u);
    }
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject count](v5, "count"));
    uint64_t v10 = [(PXGadgetProvider *)self gadgets];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([v10 containsObject:v16])
          {
            [v7 addObject:v16];
            [(PXGadgetProvider *)self _teardownGadget:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    if ([v7 count])
    {
      v17 = [(PXGadgetProvider *)self gadgets];
      long long v18 = [v17 mutableCopy];

      [v18 removeObjectsInArray:v7];
      [(PXGadgetProvider *)self setGadgets:v18];
      __int16 v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v31 = v20;
        __int16 v32 = 2112;
        v33 = v7;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "%@: Removed gadgets %@", buf, 0x16u);
      }
      [(PXGadgetProvider *)self setInvalidGadgets:1];
    }
    else
    {
      long long v18 = PLUIGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v22 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v31 = v22;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "%@: No gadgets removed", buf, 0xCu);
      }
    }
  }
  else if (v8)
  {
    uint64_t v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v31 = v21;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to remove zero gadgets", buf, 0xCu);
  }
}

- (void)insertGadgets:(id)a3 atIndexes:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![(PXGadgetProvider *)self isPerformingChanges])
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v26 = NSStringFromSelector(a2);
    [v25 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 116, @"[%@] %@ must be called from a performChanges block.", self, v26 object file lineNumber description];
  }
  uint64_t v9 = [v7 count];
  if ([v7 count])
  {
    if (v9 != [v8 count])
    {
      long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 120, @"Invalid parameter not satisfying: %@", @"gadgetCount == indexes.count" object file lineNumber description];
    }
    uint64_t v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v7;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "%@: Inserting Gadgets %@ at indexes %@", buf, 0x20u);
    }
    aSelector = a2;

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject count](v7, "count"));
    uint64_t v13 = [v8 firstIndex];
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    char v15 = [(PXGadgetProvider *)self gadgets];
    uint64_t v16 = (void *)[v15 mutableCopy];

    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        long long v18 = [v7 objectAtIndexedSubscript:i];
        if (([v16 containsObject:v18] & 1) == 0)
        {
          [v12 addObject:v18];
          [v14 addIndex:v13];
          [v18 setDelegate:self];
        }
        uint64_t v13 = [v8 indexGreaterThanIndex:v13];
      }
    }
    uint64_t v19 = [v12 count];
    if (v19 != [v14 count])
    {
      long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:aSelector object:self file:@"PXGadgetProvider.m" lineNumber:142 description:@"number of gadgets to insert does not match the number of indexes specified"];
    }
    if ([v12 count])
    {
      [v16 insertObjects:v12 atIndexes:v14];
      [(PXGadgetProvider *)self setGadgets:v16];
      id v20 = PLUIGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        v31 = v21;
        __int16 v32 = 2112;
        v33 = v12;
        __int16 v34 = 2112;
        id v35 = v14;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "%@: Inserted gadgets %@ at indexes %@", buf, 0x20u);
      }
      [(PXGadgetProvider *)self setInvalidGadgets:1];
    }
    else
    {
      v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        __int16 v24 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEBUG, "%@: No Gadgets added", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v31 = v22;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to insert zero gadgets", buf, 0xCu);
    }
  }
}

- (void)addGadgets:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(PXGadgetProvider *)self isPerformingChanges])
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v25 = NSStringFromSelector(a2);
    [v24 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 87, @"[%@] %@ must be called from a performChanges block.", self, v25 object file lineNumber description];
  }
  uint64_t v6 = [v5 count];
  id v7 = PLUIGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v32 = v9;
      __int16 v33 = 2112;
      __int16 v34 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@: Adding Gadgets %@", buf, 0x16u);
    }
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSObject count](v5, "count"));
    uint64_t v10 = [(PXGadgetProvider *)self gadgets];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (([v10 containsObject:v16] & 1) == 0)
          {
            [v7 addObject:v16];
            [v16 setDelegate:self];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    if ([v7 count])
    {
      v17 = [(PXGadgetProvider *)self gadgets];
      long long v18 = [v17 arrayByAddingObjectsFromArray:v7];
      [(PXGadgetProvider *)self setGadgets:v18];

      uint64_t v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        __int16 v32 = v20;
        __int16 v33 = 2112;
        __int16 v34 = v7;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "%@: Added Gadgets %@", buf, 0x16u);
      }
      [(PXGadgetProvider *)self setInvalidGadgets:1];
    }
    else
    {
      v22 = PLUIGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        __int16 v32 = v23;
        _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEBUG, "%@: No Gadgets added", buf, 0xCu);
      }
    }
  }
  else if (v8)
  {
    uint64_t v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    __int16 v32 = v21;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "%@: Ignoring attempt to add zero gadgets", buf, 0xCu);
  }
}

- (void)performChanges:(id)a3
{
  id v5 = (void (**)(id, PXGadgetProvider *))a3;
  BOOL v4 = [(PXGadgetProvider *)self isPerformingChanges];
  [(PXGadgetProvider *)self setIsPerformingChanges:1];
  if (v5) {
    v5[2](v5, self);
  }
  [(PXGadgetProvider *)self setIsPerformingChanges:v4];
  if (![(PXGadgetProvider *)self isPerformingChanges]) {
    [(PXGadgetProvider *)self _updateIfNeeded];
  }
}

- (void)generateGadgets
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 70, @"Method %s is a responsibility of subclass %@", "-[PXGadgetProvider generateGadgets]", v6 object file lineNumber description];

  abort();
}

- (unint64_t)estimatedNumberOfGadgets
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGadgetProvider.m", 66, @"Method %s is a responsibility of subclass %@", "-[PXGadgetProvider estimatedNumberOfGadgets]", v6 object file lineNumber description];

  abort();
}

@end