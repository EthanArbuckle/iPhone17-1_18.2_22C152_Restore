@interface STAskForTimeApprovedResponseReceivedUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSString)parentName;
- (NSString)requestedResourceName;
- (STAskForTimeApprovedResponseReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 parentName:(id)a4 requestedResourceName:(id)a5 amountGranted:(double)a6;
- (STAskForTimeApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3;
- (double)amountGranted;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountGranted:(double)a3;
- (void)setParentName:(id)a3;
- (void)setRequestedResourceName:(id)a3;
@end

@implementation STAskForTimeApprovedResponseReceivedUserNotificationContext

- (STAskForTimeApprovedResponseReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 parentName:(id)a4 requestedResourceName:(id)a5 amountGranted:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  v12 = [(STUserNotificationContext *)&v18 initWithIdentifier:a3];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    parentName = v12->_parentName;
    v12->_parentName = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    requestedResourceName = v12->_requestedResourceName;
    v12->_requestedResourceName = (NSString *)v15;

    v12->_amountGranted = a6;
  }

  return v12;
}

- (STAskForTimeApprovedResponseReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  v5 = [(STUserNotificationContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentName"];
    parentName = v5->_parentName;
    v5->_parentName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedResourceName"];
    requestedResourceName = v5->_requestedResourceName;
    v5->_requestedResourceName = (NSString *)v8;

    [v4 decodeDoubleForKey:@"amountGranted"];
    v5->_amountGranted = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  id v4 = a3;
  [(STUserNotificationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentName, @"parentName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_requestedResourceName forKey:@"requestedResourceName"];
  [v4 encodeDouble:@"amountGranted" forKey:self->_amountGranted];
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
  v11[2] = __112__STAskForTimeApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STAskForTimeApprovedResponseReceivedUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

void __112__STAskForTimeApprovedResponseReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  [v2 setAllowedUnits:96];
  [v2 setUnitsStyle:3];
  [v2 setFormattingContext:5];
  [*(id *)(a1 + 32) amountGranted];
  v3 = objc_msgSend(v2, "stringFromTimeInterval:");
  id v4 = NSString;
  objc_super v5 = [*(id *)(a1 + 32) parentName];
  v16[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v7 = [v4 localizedUserNotificationStringForKey:@"AskForTimeApprovedResposeReceivedNotificationTitle" arguments:v6];
  [*(id *)(a1 + 40) setTitle:v7];

  uint64_t v8 = [*(id *)(a1 + 32) requestedResourceName];
  id v9 = (void *)v8;
  objc_super v10 = NSString;
  if (v8)
  {
    v15[0] = v3;
    v15[1] = v8;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v12 = @"AskForTimeApprovedResposeReceivedNotificationBody";
  }
  else
  {
    v14 = v3;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    id v12 = @"AskForTimeApprovedNoResourceResposeReceivedNotificationBody";
  }
  id v13 = [v10 localizedUserNotificationStringForKey:v12 arguments:v11];
  [*(id *)(a1 + 40) setBody:v13];

  [*(id *)(a1 + 40) setInterruptionLevel:2];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
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

- (double)amountGranted
{
  return self->_amountGranted;
}

- (void)setAmountGranted:(double)a3
{
  self->_amountGranted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedResourceName, 0);
  objc_storeStrong((id *)&self->_parentName, 0);
}

@end