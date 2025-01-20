@interface PBFApplicationStateComponent
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSUUID)posterUUID;
- (PBFApplicationStateComponent)initWithIdentifier:(id)a3 userInfo:(id)a4;
- (PBFApplicationStateComponent)initWithPRPosterConfiguration:(id)a3;
- (PBFApplicationStateComponent)initWithPRPosterDescriptor:(id)a3;
- (PBFApplicationStateComponent)initWithPRSPosterConfiguration:(id)a3;
- (PBFApplicationStateComponent)initWithPath:(id)a3;
- (PBFApplicationStateComponent)initWithServerIdentity:(id)a3;
- (PBFStateComponentDelegate)delegate;
- (PFServerPosterIdentity)identity;
- (id)description;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PBFApplicationStateComponent

- (PBFApplicationStateComponent)initWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = v8;
    v16.receiver = self;
    v16.super_class = (Class)PBFApplicationStateComponent;
    v10 = [(PBFApplicationStateComponent *)&v16 init];
    v11 = v10;
    if (v10)
    {
      [(PBFApplicationStateComponent *)v10 setIdentifier:v7];
      uint64_t v12 = [v9 copy];
      userInfo = v11->_userInfo;
      v11->_userInfo = (NSDictionary *)v12;

      v11->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    }

    return v11;
  }
  else
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"componentIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFApplicationStateComponent initWithIdentifier:userInfo:](a2, (uint64_t)self, (uint64_t)v15);
    }
    [v15 UTF8String];
    result = (PBFApplicationStateComponent *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PBFApplicationStateComponent)initWithServerIdentity:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    self = [(PBFApplicationStateComponent *)self initWithIdentifier:@"PosterComponent" userInfo:0];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PBFApplicationStateComponent)initWithPRPosterConfiguration:(id)a3
{
  v4 = [a3 _path];
  id v5 = [v4 serverIdentity];
  v6 = [(PBFApplicationStateComponent *)self initWithServerIdentity:v5];

  return v6;
}

- (PBFApplicationStateComponent)initWithPRSPosterConfiguration:(id)a3
{
  v4 = [a3 _path];
  id v5 = [v4 serverIdentity];
  v6 = [(PBFApplicationStateComponent *)self initWithServerIdentity:v5];

  return v6;
}

- (PBFApplicationStateComponent)initWithPRPosterDescriptor:(id)a3
{
  v4 = [a3 _path];
  id v5 = [v4 serverIdentity];
  v6 = [(PBFApplicationStateComponent *)self initWithServerIdentity:v5];

  return v6;
}

- (PBFApplicationStateComponent)initWithPath:(id)a3
{
  v4 = [a3 identity];
  id v5 = [(PBFApplicationStateComponent *)self initWithServerIdentity:v4];

  return v5;
}

- (NSUUID)posterUUID
{
  return (NSUUID *)[(PFServerPosterIdentity *)self->_identity posterUUID];
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedDescription;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F4F718] builderWithObject:v2];
    [v4 appendString:v2->_identifier withName:@"identifier"];
    id v5 = (id)[v4 appendObject:v2->_identity withName:@"identity" skipIfNil:1];
    [v4 appendDictionarySection:v2->_userInfo withName:@"userInfo" skipIfEmpty:1];
    v6 = [v4 build];
    cachedDescription = v2->_cachedDescription;
    v2->_cachedDescription = v6;

    v3 = v6;
  }
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)hash
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t cachedHash = v2->_cachedHash;
  if (cachedHash == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = [MEMORY[0x1E4F4F758] builder];
    id v5 = (id)[v4 appendString:v2->_identifier];
    id v6 = (id)[v4 appendObject:v2->_userInfo];
    id v7 = (id)[v4 appendObject:v2->_identifier];
    unint64_t cachedHash = [v4 hash];
    v2->_unint64_t cachedHash = cachedHash;
  }
  objc_sync_exit(v2);

  return cachedHash;
}

- (NSDictionary)userInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_userInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setUserInfo:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ([(NSDictionary *)v4->_userInfo isEqualToDictionary:v9])
  {
    objc_sync_exit(v4);
  }
  else
  {
    cachedDescription = v4->_cachedDescription;
    v4->_cachedDescription = 0;

    v4->_unint64_t cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = [v9 copy];
    userInfo = v4->_userInfo;
    v4->_userInfo = (NSDictionary *)v6;

    objc_sync_exit(v4);
    id v8 = [(PBFApplicationStateComponent *)v4 delegate];
    [(PBFApplicationStateComponent *)v8 componentWasUpdated:v4];
    v4 = v8;
  }
}

- (PFServerPosterIdentity)identity
{
  return self->_identity;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (PBFStateComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFStateComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
}

- (void)initWithIdentifier:(uint64_t)a3 userInfo:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PBFApplicationStateMonitoring.m";
  __int16 v10 = 1024;
  int v11 = 41;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end