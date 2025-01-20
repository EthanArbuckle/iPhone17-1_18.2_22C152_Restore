@interface FCNotificationPayload
- (FCHeadlineProviding)headline;
- (FCNotificationPayload)init;
- (FCNotificationPayload)initWithNotificationItem:(id)a3 headline:(id)a4 bodyText:(id)a5;
- (NSString)bodyText;
- (NTPBNotificationItem)notificationItem;
- (id)description;
@end

@implementation FCNotificationPayload

- (FCNotificationPayload)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNotificationPayload init]";
    __int16 v9 = 2080;
    v10 = "FCNotificationPayload.m";
    __int16 v11 = 1024;
    int v12 = 19;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationPayload init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCNotificationPayload)initWithNotificationItem:(id)a3 headline:(id)a4 bodyText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCNotificationPayload;
  int v12 = [(FCNotificationPayload *)&v15 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationItem, a3);
    objc_storeStrong((id *)&v13->_headline, a4);
    objc_storeStrong((id *)&v13->_bodyText, a5);
  }

  return v13;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  uint64_t v4 = [(FCNotificationPayload *)self notificationItem];
  v5 = [v4 identifier];
  [(FCDescription *)v3 addField:@"identifier" value:v5];

  id v6 = [(FCNotificationPayload *)self notificationItem];
  v7 = [v6 canonicalID];
  [(FCDescription *)v3 addField:@"canonicalID" value:v7];

  v8 = [(FCNotificationPayload *)self notificationItem];
  id v9 = [v8 articleID];
  [(FCDescription *)v3 addField:@"articleID" value:v9];

  id v10 = [(FCNotificationPayload *)self headline];
  id v11 = [v10 title];
  [(FCDescription *)v3 addField:@"title" value:v11];

  int v12 = [(FCDescription *)v3 descriptionString];

  return v12;
}

- (NTPBNotificationItem)notificationItem
{
  return self->_notificationItem;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_notificationItem, 0);
}

@end