@interface TUIRootBox
+ (TUIRootBox)rootBoxWithContentModel:(id)a3;
- (BOOL)hasUpdatesForTransactionGroup:(id)a3;
- (BOOL)needsValidationForTransactionGroup:(id)a3;
- (Class)layoutClass;
- (TUIInstantiatingEntry)entry;
- (TUIModelLayoutable)contentModel;
- (TUIRootBox)init;
- (id)contentModels;
- (id)navBarModels;
- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5;
- (unint64_t)descendentEnvironmentUseMask;
- (unint64_t)directEnvironmentUseMask;
- (void)onContainedModelsChanged;
- (void)setDescendentEnvironmentUseMask:(unint64_t)a3;
- (void)setDirectEnvironmentUseMask:(unint64_t)a3;
- (void)setEntry:(id)a3;
@end

@implementation TUIRootBox

- (TUIRootBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIRootBox;
  result = [(TUIBox *)&v3 init];
  if (result) {
    *(_WORD *)&result->_flags = 0;
  }
  return result;
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

- (id)contentModels
{
  objc_super v3 = objc_opt_new();
  [(TUIContainerBox *)self appendLayoutChildrenToArray:v3];
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v10, "role", (void)v13)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (id)navBarModels
{
  objc_super v3 = objc_opt_new();
  [(TUIContainerBox *)self appendLayoutChildrenToArray:v3];
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "role", (void)v13) == &dword_4) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (TUIModelLayoutable)contentModel
{
  contentModel = self->_contentModel;
  if (!contentModel)
  {
    v4 = [(TUIRootBox *)self contentModels];
    if ([v4 count] == (char *)&def_141F14 + 1)
    {
      id v5 = [v4 firstObject];
    }
    else
    {
      id v5 = 0;
    }
    id v6 = self->_contentModel;
    self->_contentModel = v5;

    contentModel = self->_contentModel;
  }

  return contentModel;
}

- (void)onContainedModelsChanged
{
  contentModel = self->_contentModel;
  self->_contentModel = 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

+ (TUIRootBox)rootBoxWithContentModel:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TUIRootBox);
  id v7 = v3;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];

  [(TUIContainerBox *)v4 updateModelChildren:v5];

  return v4;
}

- (id)validateInstantiationWithContext:(id)a3 transactionGroup:(id)a4 layout:(id)a5
{
  id v6 = a3;
  id v7 = objc_alloc_init(TUIBoxBuilder);
  *(unsigned char *)&self->_flags = [v6 updateWithEntry:self->_entry withBuilder:v7 environmentContainer:self];
  id v8 = [(TUIBoxBuilder *)v7 finalizeModelsWithParent:self box:self context:v6];

  return self;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  return 0;
}

- (BOOL)needsValidationForTransactionGroup:(id)a3
{
  return 0;
}

- (TUIInstantiatingEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_contentModel, 0);
}

@end