@interface STStatusDomainPublisher
+ (STStatusDomainData)emptyData;
+ (STStatusDomainDataChangeContext)emptyChangeContext;
+ (unint64_t)statusDomainName;
- (BOOL)isInvalidated;
- (STStatusDomainData)data;
- (STStatusDomainData)volatileData;
- (STStatusDomainPublisher)init;
- (STStatusDomainPublisher)initWithServerHandle:(id)a3;
- (id)_validatedChangeContext:(uint64_t)a1;
- (void)_setData:(void *)a3 withChangeContext:(void *)a4 completion:;
- (void)_setVolatileData:(void *)a3 withChangeContext:(void *)a4 completion:;
- (void)_updateDataWithBlock:(void *)a3 completion:;
- (void)_updateVolatileDataWithBlock:(void *)a3 completion:;
- (void)dealloc;
- (void)invalidate;
- (void)setData:(id)a3;
- (void)setData:(id)a3 completion:(id)a4;
- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)setVolatileData:(id)a3;
- (void)setVolatileData:(id)a3 completion:(id)a4;
- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)updateData:(id)a3 completion:(id)a4;
- (void)updateDataWithBlock:(id)a3;
- (void)updateDataWithBlock:(id)a3 completion:(id)a4;
- (void)updateVolatileData:(id)a3 completion:(id)a4;
- (void)updateVolatileDataWithBlock:(id)a3;
- (void)updateVolatileDataWithBlock:(id)a3 completion:(id)a4;
@end

@implementation STStatusDomainPublisher

id __59__STStatusDomainPublisher__updateDataWithBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = (void *)[v5 mutableCopyWithZone:0];
  v7 = [(id)objc_opt_class() emptyChangeContext];
  v8 = (void *)[v7 mutableCopyWithZone:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a3) {
    *a3 = (id)[v8 copyWithZone:0];
  }
  v9 = [v6 diffFromData:v5];

  return v9;
}

id __67__STStatusDomainPublisher__updateVolatileDataWithBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = (void *)[v5 mutableCopyWithZone:0];
  v7 = [(id)objc_opt_class() emptyChangeContext];
  v8 = (void *)[v7 mutableCopyWithZone:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a3) {
    *a3 = (id)[v8 copyWithZone:0];
  }
  v9 = [v6 diffFromData:v5];

  return v9;
}

+ (STStatusDomainDataChangeContext)emptyChangeContext
{
  v2 = objc_alloc_init(STStatusDomainDataChangeContext);

  return v2;
}

uint64_t __66__STStatusDomainPublisher_updateVolatileDataWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__STStatusDomainPublisher_updateDataWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__STStatusDomainPublisher_updateVolatileDataWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateVolatileDataWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__STStatusDomainPublisher_updateVolatileDataWithBlock___block_invoke;
  v6[3] = &unk_1E6B63AD8;
  id v7 = v4;
  id v5 = v4;
  -[STStatusDomainPublisher _updateVolatileDataWithBlock:completion:]((id *)&self->super.isa, v6, 0);
}

- (STStatusDomainPublisher)init
{
  v3 = +[STStatusDomainPublisherXPCServerHandle sharedMachServiceServerHandle];
  id v4 = [(STStatusDomainPublisher *)self initWithServerHandle:v3];

  return v4;
}

- (STStatusDomainPublisher)initWithServerHandle:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusDomainPublisher;
  v6 = [(STStatusDomainPublisher *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverHandle, a3);
    uint64_t v8 = [(id)objc_opt_class() statusDomainName];
    v9 = [(id)objc_opt_class() emptyData];
    [v5 registerPublisherClient:v7 forDomain:v8 fallbackData:v9];
  }
  return v7;
}

- (void)updateDataWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__STStatusDomainPublisher_updateDataWithBlock___block_invoke;
  v6[3] = &unk_1E6B63AD8;
  id v7 = v4;
  id v5 = v4;
  -[STStatusDomainPublisher _updateDataWithBlock:completion:]((id *)&self->super.isa, v6, 0);
}

- (void)_updateDataWithBlock:(void *)a3 completion:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    char v7 = [a1 isInvalidated];
    if (!v5 || (v7 & 1) != 0)
    {
      if ([a1 isInvalidated])
      {
        v10 = STSystemStatusLogPublishing();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          unint64_t v11 = [(id)objc_opt_class() statusDomainName];
          v12 = STSystemStatusDescriptionForDomain(v11);
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_fault_impl(&dword_1D9514000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to update data after being invalidated", buf, 0xCu);
        }
      }
      if (v6) {
        v6[2](v6);
      }
    }
    else
    {
      id v8 = a1[2];
      uint64_t v9 = [(id)objc_opt_class() statusDomainName];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__STStatusDomainPublisher__updateDataWithBlock_completion___block_invoke;
      v13[3] = &unk_1E6B63B00;
      v13[4] = a1;
      id v14 = v5;
      [v8 updateDataForPublisherClient:a1 domain:v9 usingDiffProvider:v13 completion:v6];
    }
  }
}

- (void)updateVolatileDataWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__STStatusDomainPublisher_updateVolatileDataWithBlock_completion___block_invoke;
  v8[3] = &unk_1E6B63AD8;
  id v9 = v6;
  id v7 = v6;
  -[STStatusDomainPublisher _updateVolatileDataWithBlock:completion:]((id *)&self->super.isa, v8, a4);
}

- (void)_updateVolatileDataWithBlock:(void *)a3 completion:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    char v7 = [a1 isInvalidated];
    if (!v5 || (v7 & 1) != 0)
    {
      if ([a1 isInvalidated])
      {
        v10 = STSystemStatusLogPublishing();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          unint64_t v11 = [(id)objc_opt_class() statusDomainName];
          v12 = STSystemStatusDescriptionForDomain(v11);
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_fault_impl(&dword_1D9514000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to update volatile data after being invalidated", buf, 0xCu);
        }
      }
      if (v6) {
        v6[2](v6);
      }
    }
    else
    {
      id v8 = a1[2];
      uint64_t v9 = [(id)objc_opt_class() statusDomainName];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__STStatusDomainPublisher__updateVolatileDataWithBlock_completion___block_invoke;
      v13[3] = &unk_1E6B63B00;
      v13[4] = a1;
      id v14 = v5;
      [v8 updateVolatileDataForPublisherClient:a1 domain:v9 usingDiffProvider:v13 completion:v6];
    }
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)updateVolatileData:(id)a3 completion:(id)a4
{
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![(STStatusDomainPublisher *)self isInvalidated])
  {
    v3 = STSystemStatusLogPublishing();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      unint64_t v4 = [(id)objc_opt_class() statusDomainName];
      id v5 = STSystemStatusDescriptionForDomain(v4);
      *(_DWORD *)buf = 138543362;
      id v8 = v5;
      _os_log_fault_impl(&dword_1D9514000, v3, OS_LOG_TYPE_FAULT, "SYSTEMSTATUS CLIENT ERROR: %{public}@ publisher was deallocated without being invalidated", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)STStatusDomainPublisher;
  [(STStatusDomainPublisher *)&v6 dealloc];
}

- (STStatusDomainData)data
{
  if ([(STStatusDomainPublisher *)self isInvalidated])
  {
    v3 = 0;
  }
  else
  {
    if (self) {
      serverHandle = self->_serverHandle;
    }
    else {
      serverHandle = 0;
    }
    id v5 = serverHandle;
    v3 = -[STStatusDomainPublisherServerHandle publishedDataForDomain:](v5, "publishedDataForDomain:", [(id)objc_opt_class() statusDomainName]);
  }

  return (STStatusDomainData *)v3;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(STStatusDomainPublisher *)self isInvalidated])
  {
    v3 = STSystemStatusLogPublishing();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      unint64_t v5 = [(id)objc_opt_class() statusDomainName];
      objc_super v6 = STSystemStatusDescriptionForDomain(v5);
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v6;
      _os_log_fault_impl(&dword_1D9514000, v3, OS_LOG_TYPE_FAULT, "Attempted to invalidate %{public}@ publisher which was already invalidated", buf, 0xCu);
    }
  }
  else
  {
    if (self)
    {
      self->_invalidated = 1;
      serverHandle = self->_serverHandle;
    }
    else
    {
      serverHandle = 0;
    }
    char v7 = serverHandle;
    -[STStatusDomainPublisherServerHandle removePublisherClient:forDomain:](v7, "removePublisherClient:forDomain:", self, [(id)objc_opt_class() statusDomainName]);
  }
}

- (void)setData:(id)a3
{
}

- (void)_setData:(void *)a3 withChangeContext:(void *)a4 completion:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (a1)
  {
    if ([a1 isInvalidated])
    {
      uint64_t v10 = STSystemStatusLogPublishing();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        unint64_t v14 = [(id)objc_opt_class() statusDomainName];
        v15 = STSystemStatusDescriptionForDomain(v14);
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_fault_impl(&dword_1D9514000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to set data after being invalidated", (uint8_t *)&v16, 0xCu);
      }
      if (v9) {
        v9[2](v9);
      }
    }
    else
    {
      unint64_t v11 = -[STStatusDomainPublisher _validatedChangeContext:]((uint64_t)a1, v8);
      id v12 = a1[2];
      v13 = (void *)[v7 copyWithZone:0];
      objc_msgSend(v12, "publishData:forPublisherClient:domain:withChangeContext:completion:", v13, a1, objc_msgSend((id)objc_opt_class(), "statusDomainName"), v11, v9);
    }
  }
}

- (void)setData:(id)a3 completion:(id)a4
{
}

- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5
{
}

- (void)updateDataWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__STStatusDomainPublisher_updateDataWithBlock_completion___block_invoke;
  v8[3] = &unk_1E6B63AD8;
  id v9 = v6;
  id v7 = v6;
  -[STStatusDomainPublisher _updateDataWithBlock:completion:]((id *)&self->super.isa, v8, a4);
}

uint64_t __58__STStatusDomainPublisher_updateDataWithBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateData:(id)a3 completion:(id)a4
{
}

- (STStatusDomainData)volatileData
{
  if ([(STStatusDomainPublisher *)self isInvalidated])
  {
    v3 = 0;
  }
  else
  {
    if (self) {
      serverHandle = self->_serverHandle;
    }
    else {
      serverHandle = 0;
    }
    unint64_t v5 = serverHandle;
    v3 = -[STStatusDomainPublisherServerHandle publishedVolatileDataForDomain:](v5, "publishedVolatileDataForDomain:", [(id)objc_opt_class() statusDomainName]);
  }

  return (STStatusDomainData *)v3;
}

- (void)setVolatileData:(id)a3
{
}

- (void)_setVolatileData:(void *)a3 withChangeContext:(void *)a4 completion:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if ([a1 isInvalidated])
    {
      uint64_t v10 = STSystemStatusLogPublishing();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        unint64_t v14 = [(id)objc_opt_class() statusDomainName];
        v15 = STSystemStatusDescriptionForDomain(v14);
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_fault_impl(&dword_1D9514000, v10, OS_LOG_TYPE_FAULT, "%{public}@ publisher attempted to set volatile data after being invalidated", (uint8_t *)&v16, 0xCu);
      }
      if (v9) {
        v9[2](v9);
      }
    }
    else
    {
      unint64_t v11 = -[STStatusDomainPublisher _validatedChangeContext:]((uint64_t)a1, v8);
      id v12 = a1[2];
      v13 = (void *)[v7 copyWithZone:0];
      objc_msgSend(v12, "publishVolatileData:forPublisherClient:domain:withChangeContext:completion:", v13, a1, objc_msgSend((id)objc_opt_class(), "statusDomainName"), v11, v9);
    }
  }
}

- (void)setVolatileData:(id)a3 completion:(id)a4
{
}

- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5
{
}

+ (unint64_t)statusDomainName
{
  return -1;
}

+ (STStatusDomainData)emptyData
{
  return 0;
}

- (id)_validatedChangeContext:(uint64_t)a1
{
  id v2 = a2;
  if (v2)
  {
    unint64_t v4 = [(id)objc_opt_class() emptyChangeContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v2;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v5 = (void *)[v4 mutableCopyWithZone:0];
        objc_msgSend(v5, "setUserInitiated:", objc_msgSend(v2, "isUserInitiated"));
        id v3 = (id)[v5 copyWithZone:0];
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end