@interface PDNotificationStreamRegistrationState
- (PDNotificationStreamRegistrationState)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)notificationNamesForStream:(int64_t)a3;
- (void)setNotificationNames:(id)a3 forStream:(int64_t)a4;
@end

@implementation PDNotificationStreamRegistrationState

- (id)notificationNamesForStream:(int64_t)a3
{
  notificationNameMapping = self->_notificationNameMapping;
  v4 = +[NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)notificationNameMapping objectForKeyedSubscript:v4];

  return v5;
}

- (PDNotificationStreamRegistrationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDNotificationStreamRegistrationState;
  v2 = [(PDNotificationStreamRegistrationState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notificationNameMapping = v2->_notificationNameMapping;
    v2->_notificationNameMapping = v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSMutableDictionary *)self->_notificationNameMapping copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)setNotificationNames:(id)a3 forStream:(int64_t)a4
{
  id v10 = a3;
  if ([v10 count])
  {
    id v6 = [v10 copy];
    notificationNameMapping = self->_notificationNameMapping;
    v8 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)notificationNameMapping setObject:v6 forKeyedSubscript:v8];
  }
  else
  {
    v9 = self->_notificationNameMapping;
    id v6 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v9 removeObjectForKey:v6];
  }
}

- (void).cxx_destruct
{
}

@end