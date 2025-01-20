@interface STAskForTimeNotApprovedResponseReceivedUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSString)parentName;
- (NSString)requestedResourceName;
- (STAskForTimeNotApprovedResponseReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 parentName:(id)a4 requestedResourceName:(id)a5;
- (STAskForTimeNotApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setParentName:(id)a3;
- (void)setRequestedResourceName:(id)a3;
@end

@implementation STAskForTimeNotApprovedResponseReceivedUserNotificationContext

- (STAskForTimeNotApprovedResponseReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 parentName:(id)a4 requestedResourceName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  v10 = [(STUserNotificationContext *)&v16 initWithIdentifier:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    parentName = v10->_parentName;
    v10->_parentName = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    requestedResourceName = v10->_requestedResourceName;
    v10->_requestedResourceName = (NSString *)v13;
  }
  return v10;
}

- (STAskForTimeNotApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  v5 = [(STUserNotificationContext *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentName"];
    parentName = v5->_parentName;
    v5->_parentName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedResourceName"];
    requestedResourceName = v5->_requestedResourceName;
    v5->_requestedResourceName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  id v4 = a3;
  [(STUserNotificationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentName, @"parentName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_requestedResourceName forKey:@"requestedResourceName"];
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
  v11[2] = __115__STAskForTimeNotApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STAskForTimeNotApprovedResponseReceivedUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __115__STAskForTimeNotApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [*(id *)(a1 + 40) parentName];
  v12[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  objc_super v5 = [v2 localizedUserNotificationStringForKey:@"AskForTimeNotApprovedResposeReceivedNotificationTitle" arguments:v4];
  [*(id *)(a1 + 32) setTitle:v5];

  id v6 = NSString;
  id v7 = [*(id *)(a1 + 40) requestedResourceName];
  objc_super v11 = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  id v9 = [v6 localizedUserNotificationStringForKey:@"AskForTimeNotApprovedResposeReceivedNotificationBody" arguments:v8];
  [*(id *)(a1 + 32) setBody:v9];

  [*(id *)(a1 + 32) setInterruptionLevel:2];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSString)parentName
{
  return self->_parentName;
}

- (void)setParentName:(id)a3
{
}

- (NSString)requestedResourceName
{
  return self->_requestedResourceName;
}

- (void)setRequestedResourceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedResourceName, 0);
  objc_storeStrong((id *)&self->_parentName, 0);
}

@end