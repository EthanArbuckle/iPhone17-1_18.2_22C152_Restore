@interface _UNNotificationCommunicationContextService
- (_UNNotificationCommunicationContextService)init;
- (id)_updatedCommunicationContext:(id)a3 bundleIdentifier:(id)a4;
- (id)resolveCommunicationContextForRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation _UNNotificationCommunicationContextService

- (_UNNotificationCommunicationContextService)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UNNotificationCommunicationContextService;
  v2 = [(_UNNotificationCommunicationContextService *)&v4 init];
  if (v2) {
    NCRegisterUserNotificationsUILogging();
  }
  return v2;
}

- (id)resolveCommunicationContextForRequest:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 content];
  v9 = [v8 communicationContext];

  if (v9)
  {
    v10 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      id v23 = v7;
      __int16 v24 = 2082;
      v25 = "-[_UNNotificationCommunicationContextService resolveCommunicationContextForRequest:bundleIdentifier:]";
      _os_log_impl(&dword_22012C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Service existing context context", (uint8_t *)&v22, 0x16u);
    }
    v11 = [(_UNNotificationCommunicationContextService *)self _updatedCommunicationContext:v9 bundleIdentifier:v7];
    if (v11)
    {
      v12 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543618;
        id v23 = v7;
        __int16 v24 = 2082;
        v25 = "-[_UNNotificationCommunicationContextService resolveCommunicationContextForRequest:bundleIdentifier:]";
        _os_log_impl(&dword_22012C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: New context created while servicing request", (uint8_t *)&v22, 0x16u);
      }
      v13 = [v6 content];
      v14 = (void *)[v13 mutableCopy];
      [v14 setCommunicationContext:v11];

      if (v14)
      {
        v15 = (void *)MEMORY[0x263F1DF48];
        v16 = [v6 identifier];
        v17 = [v6 trigger];
        v18 = objc_msgSend(v15, "requestWithIdentifier:content:trigger:destinations:", v16, v14, v17, objc_msgSend(v6, "destinations"));

        goto LABEL_12;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v11 = 0;
  }
  v18 = 0;
LABEL_12:
  if (v18) {
    v19 = v18;
  }
  else {
    v19 = v6;
  }
  id v20 = v19;

  return v20;
}

- (id)_updatedCommunicationContext:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  [v7 setBundleIdentifier:v5];
  v8 = [v6 sender];

  if (v8)
  {
    v9 = +[_UNNotificationContactService sharedInstance];
    v10 = [v9 updateServiceWithContact:v8 bundleIdentifier:v5];

    if (v10 && ([v10 isEqual:v8] & 1) == 0)
    {
      v11 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138544130;
        id v14 = v5;
        __int16 v15 = 2082;
        v16 = "-[_UNNotificationCommunicationContextService _updatedCommunicationContext:bundleIdentifier:]";
        __int16 v17 = 2114;
        v18 = v8;
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_22012C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Updated sender.\nExisting:%{public}@\nUpdated:%{public}@", (uint8_t *)&v13, 0x2Au);
      }
      [v7 setSender:v10];
    }
  }

  return v7;
}

@end