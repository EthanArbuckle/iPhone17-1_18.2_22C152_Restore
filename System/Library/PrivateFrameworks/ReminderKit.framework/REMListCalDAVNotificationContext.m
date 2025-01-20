@interface REMListCalDAVNotificationContext
- (NSArray)calDAVNotifications;
- (REMList)list;
- (REMListCalDAVNotificationContext)initWithList:(id)a3;
- (void)setList:(id)a3;
@end

@implementation REMListCalDAVNotificationContext

- (REMListCalDAVNotificationContext)initWithList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListCalDAVNotificationContext;
  v6 = [(REMListCalDAVNotificationContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_list, a3);
  }

  return v7;
}

- (NSArray)calDAVNotifications
{
  v2 = [(REMListCalDAVNotificationContext *)self list];
  v3 = [v2 calDAVNotifications];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end