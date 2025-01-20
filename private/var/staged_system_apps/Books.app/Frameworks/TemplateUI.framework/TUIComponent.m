@interface TUIComponent
- (BOOL)hasUpdatesForTransactionGroup:(id)a3;
- (BOOL)needsValidationForTransactionGroup:(id)a3;
- (BOOL)validateGlobalsWithContext:(id)a3;
- (TUIComponent)initWithModel:(shared_ptr<const TUI:(id)a4 :Model::Component>)a3 identifier:;
- (TUIIdentifier)identifier;
- (TUIModelContaining)parentModel;
- (id).cxx_construct;
- (id)describeWithContext:(id)a3;
- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5;
- (shared_ptr<const)model;
- (unint64_t)descendentEnvironmentUseMask;
- (unint64_t)directEnvironmentUseMask;
- (unint64_t)globalsEnvironmentUseMask;
- (unint64_t)modelKind;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)onContainedModelsChanged;
- (void)setDescendentEnvironmentUseMask:(unint64_t)a3;
- (void)setDirectEnvironmentUseMask:(unint64_t)a3;
- (void)setGlobalsEnvironmentUseMask:(unint64_t)a3;
- (void)setParentModel:(id)a3;
- (void)updateModel:(shared_ptr<const TUI::Model::Component>)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIComponent

- (TUIComponent)initWithModel:(shared_ptr<const TUI:(id)a4 :Model::Component>)a3 identifier:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v7 = a3.__cntrl_;
  v14.receiver = self;
  v14.super_class = (Class)TUIComponent;
  v8 = [(TUIComponent *)&v14 init];
  v9 = v8;
  if (v8)
  {
    Component v11 = *ptr;
    Component v10 = ptr[1];
    if (v10) {
      atomic_fetch_add_explicit(v10[1].data, 1uLL, memory_order_relaxed);
    }
    v12 = (std::__shared_weak_count *)v8->_model.__cntrl_;
    v9->_model.__ptr_ = (Component *)v11;
    v9->_model.__cntrl_ = (__shared_weak_count *)v10;
    if (v12) {
      sub_123E4(v12);
    }
    objc_storeStrong((id *)&v9->_identifier, cntrl);
    v9->_flags = ($AA655BFBBE6AB2FAC50FEA720D47B75E)(*((unsigned __int8 *)&v9->_flags + 3) << 24);
  }

  return v9;
}

- (shared_ptr<const)model
{
  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (Component *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Component *)self;
  return result;
}

- (void)updateModel:(shared_ptr<const TUI::Model::Component>)a3
{
  v4 = (Component *)*a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_model.__cntrl_;
  self->_model.__ptr_ = v4;
  self->_model.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    sub_123E4((std::__shared_weak_count *)cntrl);
  }
}

- (id)describeWithContext:(id)a3
{
  v4 = [a3 package];
  LODWORD(self) = TUI::Package::Buffer::nameForComponent([v4 packageBuffer], *((void *)self->_model.__ptr_ + 5));
  v5 = TUI::Symbol::Tab::string((TUI::Symbol::Tab *)[v4 symtab], self);

  return v5;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ptr = self->_model.__ptr_;
  v9 = (id *)ptr[13];
  Component v10 = (std::__shared_weak_count *)ptr[14];
  if (v10)
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    id WeakRetained = objc_loadWeakRetained(v9);
    sub_123E4(v10);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v9);
  }
  v12 = [WeakRetained transactionCoordinator];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_D0504;
  v14[3] = &unk_2550D0;
  id v13 = WeakRetained;
  id v15 = v13;
  v16 = self;
  [v12 scheduleLayoutUpdateWithTransaction:v7 block:v14];
}

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendContainedChildrenToArray:(id)a3
{
}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D0620;
  v7[3] = &unk_2550F8;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (void)appendLayoutModelsToArray:(id)a3
{
  id v4 = a3;
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D06DC;
  v7[3] = &unk_2550F8;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
}

- (void)onContainedModelsChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  [WeakRetained onContainedModelsChanged];
}

- (void)updateModelChildren:(id)a3
{
  id v5 = a3;
  [(NSArray *)self->_children enumerateObjectsUsingBlock:&stru_255118];
  objc_storeStrong((id *)&self->_children, a3);
  children = self->_children;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D0824;
  v7[3] = &unk_2550F8;
  void v7[4] = self;
  [(NSArray *)children enumerateObjectsUsingBlock:v7];
  [(TUIComponent *)self onContainedModelsChanged];
}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)self->_model.__ptr_ + 9);
  int v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v6 |= [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) optimizeUpdatesForTransactionGroup:v4 v11];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v6 & 1;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *((id *)self->_model.__ptr_ + 9);
  int v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v6 |= [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) hasUpdatesForTransactionGroup:v4 v11];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v6 & 1;
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = *((id *)self->_model.__ptr_ + 9);
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        while ((objc_msgSend(v13, "applyUpdatesForTransactionGroup:", v8, (void)v15) & 1) != 0)
          ;
        long long v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v7 updateComponentBody:self];
  return self;
}

- (unint64_t)directEnvironmentUseMask
{
  return (unint64_t)self->_flags;
}

- (void)setDirectEnvironmentUseMask:(unint64_t)a3
{
  *(unsigned char *)&self->_flags = a3;
}

- (unint64_t)descendentEnvironmentUseMask
{
  return *((unsigned __int8 *)&self->_flags + 1);
}

- (void)setDescendentEnvironmentUseMask:(unint64_t)a3
{
  *((unsigned char *)&self->_flags + 1) = a3;
}

- (unint64_t)globalsEnvironmentUseMask
{
  return *((unsigned __int8 *)&self->_flags + 2);
}

- (void)setGlobalsEnvironmentUseMask:(unint64_t)a3
{
  *((unsigned char *)&self->_flags + 2) = a3;
}

- (BOOL)validateGlobalsWithContext:(id)a3
{
  return _[a3 updateComponentGlobals:self];
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_identifier, 0);
  cntrl = self->_model.__cntrl_;
  if (cntrl) {
    sub_123E4((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_transactionCoordinator, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end