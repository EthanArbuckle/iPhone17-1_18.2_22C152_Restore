@interface SBSystemActionAbstractOverridableDataSource
- (void)addOverrider:(id)a3;
- (void)removeOverrider:(id)a3;
- (void)setSelectedSystemAction:(id)a3;
@end

@implementation SBSystemActionAbstractOverridableDataSource

- (void)addOverrider:(id)a3
{
  id v4 = a3;
  overriders = self->_overriders;
  id v8 = v4;
  if (!overriders)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7 = self->_overriders;
    self->_overriders = v6;

    id v4 = v8;
    overriders = self->_overriders;
  }
  [(NSMutableSet *)overriders addObject:v4];
  [(SBSystemActionAbstractDataSource *)self updateSelectedAction];
}

- (void)removeOverrider:(id)a3
{
  [(NSMutableSet *)self->_overriders removeObject:a3];
  [(SBSystemActionAbstractDataSource *)self updateSelectedAction];
}

- (void)setSelectedSystemAction:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = (void *)[(NSMutableSet *)self->_overriders copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) systemActionDataSource:self overrideActionForAction:v4];
        if (v10)
        {
          v11 = (void *)v10;
          v12 = SBLogSystemActionDataSource();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v19 = self;
            __int16 v20 = 2114;
            v21 = v11;
            __int16 v22 = 2114;
            id v23 = v4;
            _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found override action: %{public}@ for action: %{public}@", buf, 0x20u);
          }

          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = v4;
LABEL_13:

  v13.receiver = self;
  v13.super_class = (Class)SBSystemActionAbstractOverridableDataSource;
  [(SBSystemActionAbstractDataSource *)&v13 setSelectedSystemAction:v11];
}

- (void).cxx_destruct
{
}

@end