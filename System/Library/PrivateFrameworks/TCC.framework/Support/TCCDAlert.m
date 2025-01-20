@interface TCCDAlert
- (BOOL)isDisplayableForCondition:(int64_t)a3;
- (NSDictionary)configuration;
- (NSDictionary)customUserInfo;
- (NSString)platformName;
- (TCCDAlert)initWithCondition:(int64_t)a3 platformName:(id)a4 service:(id)a5 displayPolicy:(int64_t)a6 persistentStateType:(unint64_t)a7 displayCountlimit:(int)a8 configuration:(id)a9;
- (TCCDService)service;
- (int)displayCountlimit;
- (int)persistentStateValue;
- (int64_t)condition;
- (int64_t)displayPolicy;
- (unint64_t)persistentStateType;
- (void)display;
- (void)setCondition:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setCustomUserInfo:(id)a3;
- (void)setDisplayCountlimit:(int)a3;
- (void)setDisplayPolicy:(int64_t)a3;
- (void)setPersistentStateType:(unint64_t)a3;
- (void)setPersistentStateValue:(int)a3;
- (void)setPlatformName:(id)a3;
- (void)setService:(id)a3;
@end

@implementation TCCDAlert

- (TCCDAlert)initWithCondition:(int64_t)a3 platformName:(id)a4 service:(id)a5 displayPolicy:(int64_t)a6 persistentStateType:(unint64_t)a7 displayCountlimit:(int)a8 configuration:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)TCCDAlert;
  v18 = [(TCCDAlert *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_persistentStateType = a7;
    v18->_condition = a3;
    if (v16) {
      objc_storeStrong((id *)&v18->_service, a5);
    }
    if (v15)
    {
      v20 = (NSString *)[v15 copy];
      platformName = v19->_platformName;
      v19->_platformName = v20;
    }
    v19->_displayPolicy = a6;
    v19->_displayCountlimit = a8;
    v22 = (NSDictionary *)[v17 copy];
    configuration = v19->_configuration;
    v19->_configuration = v22;
  }
  return v19;
}

- (BOOL)isDisplayableForCondition:(int64_t)a3
{
  uint64_t v5 = [(TCCDAlert *)self platformName];
  if (!v5) {
    return [(TCCDAlert *)self condition] == a3;
  }
  v6 = (void *)v5;
  v7 = +[TCCDPlatform currentPlatform];
  v8 = [v7 name];
  v9 = [(TCCDAlert *)self platformName];
  unsigned int v10 = [v8 isEqualToString:v9];

  return v10 && [(TCCDAlert *)self condition] == a3;
}

- (void)display
{
  if ([(TCCDAlert *)self displayPolicy])
  {
    uint64_t v3 = [(TCCDAlert *)self persistentStateType];
    v4 = [(TCCDAlert *)self service];
    uint64_t v5 = [v4 name];
    uint64_t value = db_persistent_state_get_value(v3, v5);

    if ((id)[(TCCDAlert *)self displayPolicy] == (id)1)
    {
      if (value == -1)
      {
        uint64_t value = 0;
      }
      else if ((int)value >= [(TCCDAlert *)self displayCountlimit])
      {
        return;
      }
    }
    else if ((id)[(TCCDAlert *)self displayPolicy] == (id)2 && (int)value <= 0)
    {
      if (value) {
        return;
      }
      goto LABEL_19;
    }
    [(TCCDAlert *)self setPersistentStateValue:value];
  }
  v7 = +[TCCDPlatform currentPlatform];
  unsigned int v8 = [v7 displayAlert:self];

  if (!v8 || ![(TCCDAlert *)self displayPolicy]) {
    return;
  }
  if ((id)[(TCCDAlert *)self displayPolicy] == (id)1)
  {
    int v9 = [(TCCDAlert *)self persistentStateValue];
    if (v9 >= [(TCCDAlert *)self displayCountlimit]) {
      return;
    }
    unint64_t v10 = [(TCCDAlert *)self persistentStateType];
    id v19 = [(TCCDAlert *)self service];
    v11 = [v19 name];
    uint64_t v12 = [(TCCDAlert *)self persistentStateValue] + 1;
    uint64_t v13 = v10;
    v14 = v11;
    goto LABEL_22;
  }
  if ((id)[(TCCDAlert *)self displayPolicy] != (id)2) {
    return;
  }
  int v15 = [(TCCDAlert *)self persistentStateValue];
  uint64_t v16 = (v15 - 1);
  if (v15 > 1)
  {
    unint64_t v18 = [(TCCDAlert *)self persistentStateType];
    id v19 = [(TCCDAlert *)self service];
    v11 = [v19 name];
    uint64_t v13 = v18;
    v14 = v11;
    uint64_t v12 = v16;
LABEL_22:
    db_persistent_state_set_value(v13, v14, v12);
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v17 = [(TCCDAlert *)self persistentStateType];
  id v19 = [(TCCDAlert *)self service];
  v11 = [v19 name];
  db_persistent_state_reset(v17, v11);
LABEL_23:
}

- (unint64_t)persistentStateType
{
  return self->_persistentStateType;
}

- (void)setPersistentStateType:(unint64_t)a3
{
  self->_persistentStateType = a3;
}

- (int64_t)condition
{
  return self->_condition;
}

- (void)setCondition:(int64_t)a3
{
  self->_condition = a3;
}

- (NSString)platformName
{
  return self->_platformName;
}

- (void)setPlatformName:(id)a3
{
}

- (TCCDService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (int64_t)displayPolicy
{
  return self->_displayPolicy;
}

- (void)setDisplayPolicy:(int64_t)a3
{
  self->_displayPolicy = a3;
}

- (int)displayCountlimit
{
  return self->_displayCountlimit;
}

- (void)setDisplayCountlimit:(int)a3
{
  self->_displayCountlimit = a3;
}

- (NSDictionary)customUserInfo
{
  return self->_customUserInfo;
}

- (void)setCustomUserInfo:(id)a3
{
}

- (int)persistentStateValue
{
  return self->_persistentStateValue;
}

- (void)setPersistentStateValue:(int)a3
{
  self->_persistentStateValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUserInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_platformName, 0);
}

@end