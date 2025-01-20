@interface NCNotificationAction
- (BOOL)isDestructiveAction;
- (BOOL)isSiriActionCandidate;
- (BOOL)isSystemAction;
- (BOOL)requiresAuthentication;
- (BOOL)shouldDismissNotification;
- (NCNotificationAction)initWithNotificationAction:(id)a3;
- (NCNotificationActionRunner)actionRunner;
- (NSDictionary)behaviorParameters;
- (NSString)debugDescription;
- (NSString)iconImageBundlePath;
- (NSString)iconImageName;
- (NSString)identifier;
- (NSString)launchBundleID;
- (NSString)title;
- (NSURL)launchURL;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)activationMode;
- (unint64_t)behavior;
@end

@implementation NCNotificationAction

- (NCNotificationAction)initWithNotificationAction:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NCNotificationAction;
  v5 = [(NCNotificationAction *)&v30 init];
  if (v5)
  {
    v6 = [v4 identifier];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 title];
    uint64_t v10 = [v9 copy];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v5->_activationMode = [v4 activationMode];
    v5->_requiresAuthentication = [v4 requiresAuthentication];
    v12 = [v4 launchURL];
    uint64_t v13 = [v12 copy];
    launchURL = v5->_launchURL;
    v5->_launchURL = (NSURL *)v13;

    v15 = [v4 launchBundleID];
    uint64_t v16 = [v15 copy];
    launchBundleID = v5->_launchBundleID;
    v5->_launchBundleID = (NSString *)v16;

    v5->_behavior = [v4 behavior];
    v18 = [v4 behaviorParameters];
    uint64_t v19 = [v18 copy];
    behaviorParameters = v5->_behaviorParameters;
    v5->_behaviorParameters = (NSDictionary *)v19;

    uint64_t v21 = [v4 actionRunner];
    actionRunner = v5->_actionRunner;
    v5->_actionRunner = (NCNotificationActionRunner *)v21;

    v5->_destructiveAction = [v4 isDestructiveAction];
    v5->_shouldDismissNotification = [v4 shouldDismissNotification];
    v23 = [v4 iconImageName];
    uint64_t v24 = [v23 copy];
    iconImageName = v5->_iconImageName;
    v5->_iconImageName = (NSString *)v24;

    v26 = [v4 iconImageBundlePath];
    uint64_t v27 = [v26 copy];
    iconImageBundlePath = v5->_iconImageBundlePath;
    v5->_iconImageBundlePath = (NSString *)v27;

    v5->_isSiriActionCandidate = [v4 isSiriActionCandidate];
  }

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationAction *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isSystemAction
{
  v3 = [(NCNotificationAction *)self identifier];
  if ([v3 isEqual:*MEMORY[0x263F1E0C8]])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(NCNotificationAction *)self identifier];
    char v4 = [v5 isEqual:*MEMORY[0x263F1E0D0]];
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  char v4 = [NCMutableNotificationAction alloc];

  return [(NCNotificationAction *)v4 initWithNotificationAction:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(NCNotificationAction *)self descriptionBuilderWithMultilinePrefix:a3];
  char v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__NCNotificationAction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __62__NCNotificationAction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"identifier"];

  id v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) title];
  id v7 = (id)[v5 appendObject:v6 withName:@"title"];

  id v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) launchURL];
  id v10 = (id)[v8 appendObject:v9 withName:@"launchURL"];

  id v11 = *(void **)(a1 + 32);
  v12 = [*(id *)(a1 + 40) launchBundleID];
  id v13 = (id)[v11 appendObject:v12 withName:@"launchBundleID"];

  id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "activationMode"), @"activationMode");
  v15 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) behavior]) {
    uint64_t v16 = @"TextInput";
  }
  else {
    uint64_t v16 = @"Default";
  }
  id v17 = (id)[v15 appendObject:v16 withName:@"behavior"];
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "requiresAuthentication"), @"requiresUnlock");
  id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDestructiveAction"), @"destructiveAction");
  id v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "shouldDismissNotification"), @"shouldDismiss");
  uint64_t v21 = *(void **)(a1 + 32);
  v22 = [*(id *)(a1 + 40) actionRunner];
  id v23 = (id)[v21 appendObject:v22 withName:@"actionRunner"];

  uint64_t v24 = *(void **)(a1 + 32);
  v25 = [*(id *)(a1 + 40) behaviorParameters];
  id v26 = (id)[v24 appendObject:v25 withName:@"behaviorParameters" skipIfNil:0];

  uint64_t v27 = *(void **)(a1 + 32);
  v28 = [*(id *)(a1 + 40) iconImageName];
  id v29 = (id)[v27 appendObject:v28 withName:@"iconImageName"];

  objc_super v30 = *(void **)(a1 + 32);
  v31 = [*(id *)(a1 + 40) iconImageBundlePath];
  id v32 = (id)[v30 appendObject:v31 withName:@"iconImageBundlePath"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSiriActionCandidate"), @"isSiriAction");
}

- (id)succinctDescription
{
  v2 = [(NCNotificationAction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NCNotificationAction *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (NSString)iconImageBundlePath
{
  return self->_iconImageBundlePath;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (NSString)launchBundleID
{
  return self->_launchBundleID;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (NSDictionary)behaviorParameters
{
  return self->_behaviorParameters;
}

- (NCNotificationActionRunner)actionRunner
{
  return self->_actionRunner;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)isDestructiveAction
{
  return self->_destructiveAction;
}

- (BOOL)shouldDismissNotification
{
  return self->_shouldDismissNotification;
}

- (BOOL)isSiriActionCandidate
{
  return self->_isSiriActionCandidate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionRunner, 0);
  objc_storeStrong((id *)&self->_behaviorParameters, 0);
  objc_storeStrong((id *)&self->_launchBundleID, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_iconImageBundlePath, 0);
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end