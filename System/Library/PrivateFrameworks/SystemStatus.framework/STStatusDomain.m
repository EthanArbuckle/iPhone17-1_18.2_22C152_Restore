@interface STStatusDomain
+ (unint64_t)statusDomainName;
- (BOOL)isInvalidated;
- (NSArray)preferredLocalizations;
- (STStatusDomain)init;
- (STStatusDomain)initWithServerHandle:(id)a3;
- (STStatusDomainData)data;
- (STStatusDomainServerHandle)serverHandle;
- (void)dealloc;
- (void)invalidate;
- (void)observeData:(id)a3;
- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5;
- (void)observeDataWithBlock:(id)a3;
@end

@implementation STStatusDomain

- (void)observeData:(id)a3 forDomain:(unint64_t)a4 withChangeContext:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (![(STStatusDomain *)self isInvalidated]
    && [(id)objc_opt_class() statusDomainName] == a4)
  {
    if (self)
    {
      id v9 = self->_dataChangedBlock;
      v10 = v9;
      if (v9) {
        (*((void (**)(id, id))v9 + 2))(v9, v13);
      }
      id v11 = self->_dataChangedWithContextBlock;
      if (v11)
      {
        v12 = v11;
        (*((void (**)(id, id, id))v11 + 2))(v11, v13, v8);
      }
    }
    else
    {
      v10 = 0;
    }
  }
}

- (STStatusDomainData)data
{
  if ([(STStatusDomain *)self isInvalidated])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(STStatusDomain *)self serverHandle];
    v3 = objc_msgSend(v4, "dataForDomain:", objc_msgSend((id)objc_opt_class(), "statusDomainName"));
  }

  return (STStatusDomainData *)v3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (STStatusDomainServerHandle)serverHandle
{
  return self->_serverHandle;
}

- (STStatusDomain)init
{
  v3 = +[STStatusDomainXPCServerHandle sharedMachServiceServerHandle];
  v4 = [(STStatusDomain *)self initWithServerHandle:v3];

  return v4;
}

- (STStatusDomain)initWithServerHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusDomain;
  v6 = [(STStatusDomain *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverHandle, a3);
    objc_msgSend(v5, "registerClient:forDomain:", v7, objc_msgSend((id)objc_opt_class(), "statusDomainName"));
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![(STStatusDomain *)self isInvalidated])
  {
    v3 = STSystemStatusLogObservation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      unint64_t v4 = [(id)objc_opt_class() statusDomainName];
      id v5 = STSystemStatusDescriptionForDomain(v4);
      *(_DWORD *)buf = 138543362;
      id v8 = v5;
      _os_log_fault_impl(&dword_1D9514000, v3, OS_LOG_TYPE_FAULT, "SYSTEMSTATUS CLIENT ERROR: %{public}@ domain was deallocated without being invalidated", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)STStatusDomain;
  [(STStatusDomain *)&v6 dealloc];
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(STStatusDomain *)self isInvalidated])
  {
    v3 = STSystemStatusLogObservation();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      unint64_t v4 = [(id)objc_opt_class() statusDomainName];
      id v5 = STSystemStatusDescriptionForDomain(v4);
      *(_DWORD *)buf = 138543362;
      id v8 = v5;
      _os_log_fault_impl(&dword_1D9514000, v3, OS_LOG_TYPE_FAULT, "Attempted to invalidate %{public}@ domain which was already invalidated", buf, 0xCu);
    }
  }
  else
  {
    if (self) {
      self->_invalidated = 1;
    }
    id v6 = [(STStatusDomain *)self serverHandle];
    objc_msgSend(v6, "removeClient:forDomain:", self, objc_msgSend((id)objc_opt_class(), "statusDomainName"));
  }
}

- (void)observeDataWithBlock:(id)a3
{
  unint64_t v4 = (char *)a3;
  id v5 = v4;
  if (self && self->_dataChangedBlock != v4)
  {
    id v6 = v4;
    objc_setProperty_nonatomic_copy(self, v4, v4, 16);
    id v5 = v6;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)observeData:(id)a3
{
  unint64_t v4 = (char *)a3;
  id v5 = v4;
  if (self && self->_dataChangedWithContextBlock != v4)
  {
    id v6 = v4;
    objc_setProperty_nonatomic_copy(self, v4, v4, 24);
    id v5 = v6;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

+ (unint64_t)statusDomainName
{
  return -1;
}

- (NSArray)preferredLocalizations
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 preferredLocalizations];

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHandle, 0);
  objc_storeStrong(&self->_dataChangedWithContextBlock, 0);

  objc_storeStrong(&self->_dataChangedBlock, 0);
}

@end