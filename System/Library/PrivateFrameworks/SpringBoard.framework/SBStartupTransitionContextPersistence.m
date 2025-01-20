@interface SBStartupTransitionContextPersistence
- (SBStartupTransitionContextPersistence)initWithBootDefaults:(id)a3 loginSession:(BOOL)a4;
- (id)readTransitionContext;
- (void)saveContext:(id)a3;
@end

@implementation SBStartupTransitionContextPersistence

- (SBStartupTransitionContextPersistence)initWithBootDefaults:(id)a3 loginSession:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBStartupTransitionContextPersistence;
  v8 = [(SBStartupTransitionContextPersistence *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bootDefaults, a3);
    v9->_loginSession = a4;
  }

  return v9;
}

- (void)saveContext:(id)a3
{
  bootDefaults = self->_bootDefaults;
  if (a3)
  {
    id v5 = [a3 _representation];
    [(SBBootDefaults *)bootDefaults setBootTransitionContext:v5];
  }
  else
  {
    v4 = self->_bootDefaults;
    -[SBBootDefaults setBootTransitionContext:](v4, "setBootTransitionContext:");
  }
}

- (id)readTransitionContext
{
  v3 = [(SBBootDefaults *)self->_bootDefaults bootTransitionContext];
  id v4 = [[SBStartupTransitionContext alloc] _initWithRepresentation:v3 loginSession:self->_loginSession];

  return v4;
}

- (void).cxx_destruct
{
}

@end