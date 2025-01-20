@interface PVEffectTimedPropertiesDelegateWrapper
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsStartStopNotifications;
- (NSArray)supportedTimedPropertyGroups;
- (NSDictionary)userContext;
- (PVEffectTimedPropertiesDelegate)timedPropertiesDelegate;
- (PVEffectTimedPropertiesDelegateWrapper)initWithTimedPropertiesDelegate:(id)a3 supportedTimedPropertyGroups:(id)a4 userContext:(id)a5;
- (unint64_t)hash;
- (void)setSupportedTimedPropertyGroups:(id)a3;
- (void)setTimedPropertiesDelegate:(id)a3;
- (void)setUserContext:(id)a3;
- (void)setWantsStartStopNotifications:(BOOL)a3;
@end

@implementation PVEffectTimedPropertiesDelegateWrapper

- (PVEffectTimedPropertiesDelegateWrapper)initWithTimedPropertiesDelegate:(id)a3 supportedTimedPropertyGroups:(id)a4 userContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PVEffectTimedPropertiesDelegateWrapper;
  v11 = [(PVEffectTimedPropertiesDelegateWrapper *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(PVEffectTimedPropertiesDelegateWrapper *)v11 setTimedPropertiesDelegate:v8];
    [(PVEffectTimedPropertiesDelegateWrapper *)v12 setSupportedTimedPropertyGroups:v9];
    [(PVEffectTimedPropertiesDelegateWrapper *)v12 setUserContext:v10];
    unsigned __int8 v13 = objc_opt_respondsToSelector();
    [(PVEffectTimedPropertiesDelegateWrapper *)v12 setWantsStartStopNotifications:v13 & objc_opt_respondsToSelector() & 1];
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = [(PVEffectTimedPropertiesDelegateWrapper *)self timedPropertiesDelegate];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PVEffectTimedPropertiesDelegateWrapper *)self timedPropertiesDelegate];
    v6 = [v4 timedPropertiesDelegate];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    v5 = [(PVEffectTimedPropertiesDelegateWrapper *)self timedPropertiesDelegate];
    char v7 = [v5 isEqual:v4];
  }

  return v7;
}

- (PVEffectTimedPropertiesDelegate)timedPropertiesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timedPropertiesDelegate);

  return (PVEffectTimedPropertiesDelegate *)WeakRetained;
}

- (void)setTimedPropertiesDelegate:(id)a3
{
}

- (NSArray)supportedTimedPropertyGroups
{
  return self->_supportedTimedPropertyGroups;
}

- (void)setSupportedTimedPropertyGroups:(id)a3
{
}

- (NSDictionary)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (BOOL)wantsStartStopNotifications
{
  return self->_wantsStartStopNotifications;
}

- (void)setWantsStartStopNotifications:(BOOL)a3
{
  self->_wantsStartStopNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_supportedTimedPropertyGroups, 0);

  objc_destroyWeak((id *)&self->_timedPropertiesDelegate);
}

@end