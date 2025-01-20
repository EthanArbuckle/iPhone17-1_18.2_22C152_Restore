@interface _UIBarButtonItemActionBinding
- (NSArray)barButtonItems;
- (_UIBarButtonItemActionBinding)initWithBarButtonItems:(id)a3 registerObservers:(id)a4 unregisterObservers:(id)a5;
- (id)registerObservers;
- (id)unregisterObservers;
- (void)_update:(id)a3;
- (void)setBarButtonItems:(id)a3;
- (void)setRegisterObservers:(id)a3;
- (void)setUnregisterObservers:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation _UIBarButtonItemActionBinding

- (_UIBarButtonItemActionBinding)initWithBarButtonItems:(id)a3 registerObservers:(id)a4 unregisterObservers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIBarButtonItemActionBinding;
  v11 = [(_UIBarButtonItemActionBinding *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    barButtonItems = v11->_barButtonItems;
    v11->_barButtonItems = (NSArray *)v12;

    v14 = _Block_copy(v9);
    id registerObservers = v11->_registerObservers;
    v11->_id registerObservers = v14;

    v16 = _Block_copy(v10);
    unid registerObservers = v11->_unregisterObservers;
    v11->_unid registerObservers = v16;
  }
  return v11;
}

- (void)_update:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_barButtonItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "target", (void)v12);
        uint64_t v10 = [v8 action];
        if (v9) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11) {
          objc_msgSend(v8, "setEnabled:", objc_msgSend(v9, "canPerformAction:withSender:", v10, 0));
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)startMonitoring
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    (*((void (**)(void))self->_registerObservers + 2))();
    [(_UIBarButtonItemActionBinding *)self _update:0];
  }
}

- (void)stopMonitoring
{
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    unid registerObservers = (void (**)(id, _UIBarButtonItemActionBinding *, char *))self->_unregisterObservers;
    if (unregisterObservers) {
      unregisterObservers[2](unregisterObservers, self, sel__update_);
    }
  }
}

- (NSArray)barButtonItems
{
  return self->_barButtonItems;
}

- (void)setBarButtonItems:(id)a3
{
}

- (id)registerObservers
{
  return self->_registerObservers;
}

- (void)setRegisterObservers:(id)a3
{
}

- (id)unregisterObservers
{
  return self->_unregisterObservers;
}

- (void)setUnregisterObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterObservers, 0);
  objc_storeStrong(&self->_registerObservers, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
}

@end