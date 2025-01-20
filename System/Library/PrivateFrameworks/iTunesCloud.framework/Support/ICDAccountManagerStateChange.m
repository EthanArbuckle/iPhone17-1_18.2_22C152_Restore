@interface ICDAccountManagerStateChange
+ (id)stateChangeFromState:(id)a3 toState:(id)a4 computation:(int64_t)a5;
- (BOOL)activeConfigurationChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportedConfigurationsChanged;
- (ICDAccountManagerState)finalState;
- (ICDAccountManagerState)initialState;
- (id)_initWithInitialState:(id)a3 finalState:(id)a4 computation:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)computation;
@end

@implementation ICDAccountManagerStateChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalState, 0);

  objc_storeStrong((id *)&self->_initialState, 0);
}

- (int64_t)computation
{
  return self->_computation;
}

- (ICDAccountManagerState)finalState
{
  return self->_finalState;
}

- (ICDAccountManagerState)initialState
{
  return self->_initialState;
}

- (id)_initWithInitialState:(id)a3 finalState:(id)a4 computation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDAccountManagerStateChange;
  v10 = [(ICDAccountManagerStateChange *)&v16 init];
  if (v10)
  {
    v11 = (ICDAccountManagerState *)[v8 copy];
    initialState = v10->_initialState;
    v10->_initialState = v11;

    v13 = (ICDAccountManagerState *)[v9 copy];
    finalState = v10->_finalState;
    v10->_finalState = v13;

    v10->_computation = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = [(ICDAccountManagerStateChange *)self initialState];
    id v7 = [v6 copyWithZone:a3];
    id v8 = (void *)v5[1];
    v5[1] = v7;

    id v9 = [(ICDAccountManagerStateChange *)self finalState];
    id v10 = [v9 copyWithZone:a3];
    v11 = (void *)v5[2];
    v5[2] = v10;

    v5[3] = [(ICDAccountManagerStateChange *)self computation];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICDAccountManagerStateChange *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ICDAccountManagerStateChange *)v5 initialState];
      id v7 = [(ICDAccountManagerStateChange *)self initialState];
      if ([v6 isEqual:v7])
      {
        id v8 = [(ICDAccountManagerStateChange *)v5 finalState];
        id v9 = [(ICDAccountManagerStateChange *)self finalState];
        if ([v8 isEqual:v9])
        {
          id v10 = [(ICDAccountManagerStateChange *)v5 computation];
          BOOL v11 = v10 == (id)[(ICDAccountManagerStateChange *)self computation];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = [(ICDAccountManagerStateChange *)self initialState];
  v4 = [(ICDAccountManagerStateChange *)self finalState];
  v5 = +[NSString stringWithFormat:@"ICDAccountManagerStateChange %p: %@ -> %@ - [active changed=%u] [supported changed=%u]", self, v3, v4, [(ICDAccountManagerStateChange *)self activeConfigurationChanged], [(ICDAccountManagerStateChange *)self supportedConfigurationsChanged]];

  return v5;
}

- (BOOL)supportedConfigurationsChanged
{
  unsigned __int8 v3 = [(ICDAccountManagerStateChange *)self computation];
  v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 2) != 0)
  {
    if (v5)
    {
      id v7 = [(ICDAccountManagerStateChange *)self initialState];
      id v8 = [v7 supportedConfigurationsDSIDs];
      id v9 = [(ICDAccountManagerStateChange *)self finalState];
      id v10 = [v9 supportedConfigurationsDSIDs];
      int v19 = 134218498;
      v20 = self;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerStateChange %p - Initial configurations [%@] -> Final configurations [%@]", (uint8_t *)&v19, 0x20u);
    }
    v4 = [(ICDAccountManagerStateChange *)self initialState];
    BOOL v11 = [v4 supportedConfigurationsDSIDs];
    v12 = [(ICDAccountManagerStateChange *)self finalState];
    v13 = [v12 supportedConfigurationsDSIDs];
    if (v11 == v13)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v14 = [(ICDAccountManagerStateChange *)self initialState];
      v15 = [v14 supportedConfigurationsDSIDs];
      objc_super v16 = [(ICDAccountManagerStateChange *)self finalState];
      v17 = [v16 supportedConfigurationsDSIDs];
      unsigned int v6 = [v15 isEqualToSet:v17] ^ 1;
    }
  }
  else
  {
    if (v5)
    {
      int v19 = 134217984;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerStateChange %p - supportedConfigurationsChanged: NO [computation option driven]", (uint8_t *)&v19, 0xCu);
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)activeConfigurationChanged
{
  unsigned __int8 v3 = [(ICDAccountManagerStateChange *)self computation];
  v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v7 = [(ICDAccountManagerStateChange *)self initialState];
      id v8 = [v7 activeConfigurationDSID];
      id v9 = [(ICDAccountManagerStateChange *)self finalState];
      id v10 = [v9 activeConfigurationDSID];
      int v15 = 134218498;
      objc_super v16 = self;
      __int16 v17 = 2112;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerStateChange %p - Initial configuration [%@] -> Final configuration [%@]", (uint8_t *)&v15, 0x20u);
    }
    v4 = [(ICDAccountManagerStateChange *)self initialState];
    BOOL v11 = [v4 activeConfigurationDSID];
    v12 = [(ICDAccountManagerStateChange *)self finalState];
    v13 = [v12 activeConfigurationDSID];
    if (v11 == v13) {
      LOBYTE(v6) = 0;
    }
    else {
      unsigned int v6 = [v11 isEqual:v13] ^ 1;
    }
  }
  else
  {
    if (v5)
    {
      int v15 = 134217984;
      objc_super v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ICDAccountManagerStateChange %p - configurationChanged: NO [computation option driven]", (uint8_t *)&v15, 0xCu);
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)stateChangeFromState:(id)a3 toState:(id)a4 computation:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) _initWithInitialState:v9 finalState:v8 computation:a5];

  return v10;
}

@end