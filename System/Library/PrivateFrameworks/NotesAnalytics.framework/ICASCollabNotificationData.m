@interface ICASCollabNotificationData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollabNotificationAction)collabNotificationAction;
- (ICASCollabNotificationData)initWithCollabNotificationAction:(id)a3;
- (id)toDict;
@end

@implementation ICASCollabNotificationData

- (ICASCollabNotificationData)initWithCollabNotificationAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASCollabNotificationData;
  v6 = [(ICASCollabNotificationData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collabNotificationAction, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"CollabNotificationData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"collabNotificationAction";
  v3 = [(ICASCollabNotificationData *)self collabNotificationAction];
  if (v3)
  {
    uint64_t v4 = [(ICASCollabNotificationData *)self collabNotificationAction];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (ICASCollabNotificationAction)collabNotificationAction
{
  return self->_collabNotificationAction;
}

- (void).cxx_destruct
{
}

@end