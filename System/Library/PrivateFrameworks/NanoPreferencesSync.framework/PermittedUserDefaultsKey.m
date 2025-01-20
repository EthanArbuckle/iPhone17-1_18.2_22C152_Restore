@interface PermittedUserDefaultsKey
- (BOOL)isPerGizmoSetting;
- (BOOL)isPrefix;
- (BOOL)twoWaySync;
- (NSMutableSet)notificationNames;
- (NSSet)syncGroups;
- (NSString)appGroupContainer;
- (NSString)container;
- (NSString)key;
- (id)description;
- (void)log;
- (void)setAppGroupContainer:(id)a3;
- (void)setContainer:(id)a3;
- (void)setIsPerGizmoSetting:(BOOL)a3;
- (void)setIsPrefix:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNotificationNames:(id)a3;
- (void)setSyncGroups:(id)a3;
- (void)setTwoWaySync:(BOOL)a3;
@end

@implementation PermittedUserDefaultsKey

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p key = \"%@\" notificationNames = \"%@\" twoWaySync = %d", v4, self, self->_key, self->_notificationNames, self->_twoWaySync];

  v6 = +[NSString stringWithFormat:@" isPerGizmoSetting = %d", self->_isPerGizmoSetting];
  v7 = +[NSString stringWithFormat:@"%@%@>", v5, v6];

  return v7;
}

- (void)log
{
  v3 = (void *)nps_daemon_log;
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

- (NSMutableSet)notificationNames
{
  return self->_notificationNames;
}

- (void)setNotificationNames:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncGroups, 0);
  objc_storeStrong((id *)&self->_notificationNames, 0);
  objc_storeStrong((id *)&self->_appGroupContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end