@interface PRSPosterRoleActivePosterObserver
- (BOOL)needsSandboxExtensions;
- (NSSet)roles;
- (PRSPosterRoleActivePosterObserver)init;
- (PRSPosterRoleActivePosterObserver)initWithRoles:(id)a3;
- (PRSPosterRoleActivePosterObserver)initWithRoles:(id)a3 needsSandboxExtensions:(BOOL)a4;
- (id)handler;
- (id)stateForRole:(id)a3;
- (void)issueUpdatedState:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation PRSPosterRoleActivePosterObserver

- (PRSPosterRoleActivePosterObserver)init
{
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PRPosterRoleLockScreen"];
  v4 = [(PRSPosterRoleActivePosterObserver *)self initWithRoles:v3];

  return v4;
}

- (PRSPosterRoleActivePosterObserver)initWithRoles:(id)a3
{
  return [(PRSPosterRoleActivePosterObserver *)self initWithRoles:a3 needsSandboxExtensions:1];
}

- (PRSPosterRoleActivePosterObserver)initWithRoles:(id)a3 needsSandboxExtensions:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSPosterRoleActivePosterObserver;
  v7 = [(PRSPosterRoleActivePosterObserver *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    roles = v7->_roles;
    v7->_roles = (NSSet *)v8;

    v7->_needsSandboxExtensions = a4;
    uint64_t v10 = objc_opt_new();
    roleToState = v7->_roleToState;
    v7->_roleToState = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)issueUpdatedState:(id)a3
{
  id v8 = a3;
  v4 = [v8 role];
  if ([(NSSet *)self->_roles containsObject:v4])
  {
    v5 = self;
    objc_sync_enter(v5);
    [(NSMutableDictionary *)v5->_roleToState setObject:v8 forKeyedSubscript:v4];
    uint64_t v6 = [(PRSPosterRoleActivePosterObserver *)v5 handler];
    v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, PRSPosterRoleActivePosterObserver *, id))(v6 + 16))(v6, v5, v8);
    }

    objc_sync_exit(v5);
  }
}

- (id)stateForRole:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_roleToState objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (NSSet)roles
{
  return self->_roles;
}

- (BOOL)needsSandboxExtensions
{
  return self->_needsSandboxExtensions;
}

- (id)handler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_roles, 0);
  objc_storeStrong((id *)&self->_roleToState, 0);
}

@end