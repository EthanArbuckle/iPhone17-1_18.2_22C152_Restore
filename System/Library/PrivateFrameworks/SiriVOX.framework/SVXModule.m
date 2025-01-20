@interface SVXModule
- (AFAnalytics)analytics;
- (AFInstanceContext)instanceContext;
- (AFPreferences)preferences;
- (BOOL)isActive;
- (Class)instanceClass;
- (NSString)identifier;
- (SVXModule)initWithIdentifier:(id)a3 instanceClass:(Class)a4 instanceContext:(id)a5 preferences:(id)a6 analytics:(id)a7 performer:(id)a8;
- (SVXPerforming)performer;
- (id)description;
- (void)setIsActive:(BOOL)a3;
@end

@implementation SVXModule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (SVXPerforming)performer
{
  return self->_performer;
}

- (AFAnalytics)analytics
{
  return self->_analytics;
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (Class)instanceClass
{
  return self->_instanceClass;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SVXModule;
  v4 = [(SVXModule *)&v9 description];
  identifier = self->_identifier;
  v6 = NSStringFromClass(self->_instanceClass);
  v7 = [v3 stringWithFormat:@"%@ {identifier = %@, instanceClass = %@, instanceContext = %@, performer = %@}", v4, identifier, v6, self->_instanceContext, self->_performer];

  return v7;
}

- (SVXModule)initWithIdentifier:(id)a3 instanceClass:(Class)a4 instanceContext:(id)a5 preferences:(id)a6 analytics:(id)a7 performer:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id obj = a8;
  id v17 = a8;
  if (v13)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SVXModule.m", 22, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SVXModule.m", 23, @"Invalid parameter not satisfying: %@", @"instanceClass != Nil" object file lineNumber description];

  if (v14)
  {
LABEL_4:
    if (v15) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SVXModule.m", 24, @"Invalid parameter not satisfying: %@", @"instanceContext != nil" object file lineNumber description];

  if (v15)
  {
LABEL_5:
    if (v16) {
      goto LABEL_6;
    }
LABEL_14:
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SVXModule.m", 26, @"Invalid parameter not satisfying: %@", @"analytics != nil" object file lineNumber description];

    if (v17) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SVXModule.m", 25, @"Invalid parameter not satisfying: %@", @"preferences != nil" object file lineNumber description];

  if (!v16) {
    goto LABEL_14;
  }
LABEL_6:
  if (v17) {
    goto LABEL_7;
  }
LABEL_15:
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SVXModule.m", 27, @"Invalid parameter not satisfying: %@", @"performer != nil" object file lineNumber description];

LABEL_7:
  v31.receiver = self;
  v31.super_class = (Class)SVXModule;
  v18 = [(SVXModule *)&v31 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_instanceContext, a5);
    objc_storeStrong((id *)&v18->_preferences, a6);
    objc_storeStrong((id *)&v18->_analytics, a7);
    objc_storeStrong((id *)&v18->_performer, obj);
    v18->_instanceClass = a4;
  }

  return v18;
}

@end