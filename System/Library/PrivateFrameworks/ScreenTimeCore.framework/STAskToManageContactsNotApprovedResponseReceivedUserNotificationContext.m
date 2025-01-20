@interface STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSString)childName;
- (STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext)initWithChildName:(id)a3;
- (STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setChildName:(id)a3;
@end

@implementation STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext

- (STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext)initWithChildName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext;
  id v3 = a3;
  v4 = [(STUserNotificationContext *)&v8 initWithIdentifier:@"AskToManageContactsResponseReceivedUserNotificationContextIdentifier"];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  childName = v4->_childName;
  v4->_childName = (NSString *)v5;

  return v4;
}

- (STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext;
  uint64_t v5 = [(STUserNotificationContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childName"];
    childName = v5->_childName;
    v5->_childName = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext;
  id v4 = a3;
  [(STUserNotificationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_childName, @"childName", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __124__STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __124__STAskToManageContactsNotApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  id v3 = [*(id *)(a1 + 40) childName];
  v12[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  objc_super v5 = [v2 localizedUserNotificationStringForKey:@"AskToManageContactsNotApprovedResponseReceivedNotificationTitle" arguments:v4];
  [*(id *)(a1 + 32) setTitle:v5];

  id v6 = NSString;
  id v7 = [*(id *)(a1 + 40) childName];
  v11 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v9 = [v6 localizedUserNotificationStringForKey:@"AskToManageContactsNotApprovedResponseReceivedNotificationBody" arguments:v8];
  [*(id *)(a1 + 32) setBody:v9];

  [*(id *)(a1 + 32) setShouldPreventNotificationDismissalAfterDefaultAction:1];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSString)childName
{
  return self->_childName;
}

- (void)setChildName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end