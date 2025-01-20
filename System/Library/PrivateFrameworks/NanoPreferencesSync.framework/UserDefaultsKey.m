@interface UserDefaultsKey
- (BOOL)isCloudEnabled;
- (BOOL)isMirroring;
- (BOOL)isPerGizmoSetting;
- (BOOL)isPrefix;
- (BOOL)twoWaySync;
- (NSSet)syncGroups;
- (NSString)appGroupContainer;
- (NSString)container;
- (NSString)key;
- (NSString)mirrorableBBDomain;
- (NSString)mirrorableDomain;
- (NSString)mirrorableKey;
- (id)description;
- (void)log;
- (void)setAppGroupContainer:(id)a3;
- (void)setContainer:(id)a3;
- (void)setIsCloudEnabled:(BOOL)a3;
- (void)setIsPerGizmoSetting:(BOOL)a3;
- (void)setIsPrefix:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setMirrorableBBDomain:(id)a3;
- (void)setMirrorableDomain:(id)a3;
- (void)setMirrorableKey:(id)a3;
- (void)setSyncGroups:(id)a3;
- (void)setTwoWaySync:(BOOL)a3;
@end

@implementation UserDefaultsKey

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p key = \"%@\" twoWaySync = %d", v4, self, self->_key, self->_twoWaySync];

  v6 = +[NSString stringWithFormat:@" isPerGizmoSetting = %d", self->_isPerGizmoSetting];
  v7 = +[NSString stringWithFormat:@"%@%@>", v5, v6];

  return v7;
}

- (BOOL)isMirroring
{
  if (self->_mirrorableBBDomain)
  {
    id v3 = +[NPSSettings bbAppsSettings];
    id v4 = [v3 synchronize];
    v5 = [v3 objectForKey:self->_mirrorableBBDomain];
    v6 = [v5 objectForKeyedSubscript:@"BPSNanoBulletinShowsCustomSettings"];
    unsigned int v7 = [v6 BOOLValue] ^ 1;
  }
  else
  {
    if (!self->_mirrorableDomain)
    {
      LOBYTE(v7) = 0;
      return v7;
    }
    id v3 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:self->_mirrorableDomain];
    id v8 = [v3 synchronize];
    char v11 = 0;
    unsigned __int8 v9 = [v3 BOOLForKey:self->_mirrorableKey keyExistsAndHasValidFormat:&v11];
    if (v11) {
      LOBYTE(v7) = v9;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (void)log
{
  id v3 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG)) {
    sub_100028E64(v3, self);
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)twoWaySync
{
  return self->_twoWaySync;
}

- (void)setTwoWaySync:(BOOL)a3
{
  self->_twoWaySync = a3;
}

- (BOOL)isPrefix
{
  return self->_isPrefix;
}

- (void)setIsPrefix:(BOOL)a3
{
  self->_isPrefix = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSString)appGroupContainer
{
  return self->_appGroupContainer;
}

- (void)setAppGroupContainer:(id)a3
{
}

- (BOOL)isCloudEnabled
{
  return self->_isCloudEnabled;
}

- (void)setIsCloudEnabled:(BOOL)a3
{
  self->_isCloudEnabled = a3;
}

- (NSSet)syncGroups
{
  return self->_syncGroups;
}

- (void)setSyncGroups:(id)a3
{
}

- (BOOL)isPerGizmoSetting
{
  return self->_isPerGizmoSetting;
}

- (void)setIsPerGizmoSetting:(BOOL)a3
{
  self->_isPerGizmoSetting = a3;
}

- (NSString)mirrorableBBDomain
{
  return self->_mirrorableBBDomain;
}

- (void)setMirrorableBBDomain:(id)a3
{
}

- (NSString)mirrorableDomain
{
  return self->_mirrorableDomain;
}

- (void)setMirrorableDomain:(id)a3
{
}

- (NSString)mirrorableKey
{
  return self->_mirrorableKey;
}

- (void)setMirrorableKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorableKey, 0);
  objc_storeStrong((id *)&self->_mirrorableDomain, 0);
  objc_storeStrong((id *)&self->_mirrorableBBDomain, 0);
  objc_storeStrong((id *)&self->_syncGroups, 0);
  objc_storeStrong((id *)&self->_appGroupContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end