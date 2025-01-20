@interface SUCoreXPCActivity
- (BOOL)isEqual:(id)a3;
- (BOOL)isRegisteredWithXPC;
- (NSString)activityName;
- (SUCoreActivityOptions)activityOptions;
- (id)description;
- (id)handler;
- (id)init:(id)a3 options:(id)a4 handler:(id)a5;
- (void)setActivityName:(id)a3;
- (void)setActivityOptions:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIsRegisteredWithXPC:(BOOL)a3;
@end

@implementation SUCoreXPCActivity

- (id)init:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreXPCActivity;
  v12 = [(SUCoreXPCActivity *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityName, a3);
    uint64_t v14 = MEMORY[0x210550B20](v11);
    id handler = v13->_handler;
    v13->_id handler = (id)v14;

    objc_storeStrong((id *)&v13->_activityOptions, a4);
    v13->_isRegisteredWithXPC = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUCoreXPCActivity *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(SUCoreXPCActivity *)v4 activityName];
      char v6 = [v5 isEqualToString:self->_activityName];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v2 = @"YES";
  if (self->_handler) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (!self->_isRegisteredWithXPC) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"Name: %@ Options: {%@} HandlerSet: %@ RegisteredWithXPC: %@", self->_activityName, self->_activityOptions, v3, v2];
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (SUCoreActivityOptions)activityOptions
{
  return self->_activityOptions;
}

- (void)setActivityOptions:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isRegisteredWithXPC
{
  return self->_isRegisteredWithXPC;
}

- (void)setIsRegisteredWithXPC:(BOOL)a3
{
  self->_isRegisteredWithXPC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_activityOptions, 0);

  objc_storeStrong((id *)&self->_activityName, 0);
}

@end