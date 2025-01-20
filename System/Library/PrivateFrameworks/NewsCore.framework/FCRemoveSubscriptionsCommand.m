@interface FCRemoveSubscriptionsCommand
- (FCRemoveSubscriptionsCommand)initWithSubscription:(id)a3;
- (FCRemoveSubscriptionsCommand)initWithSubscriptions:(id)a3;
@end

@implementation FCRemoveSubscriptionsCommand

- (FCRemoveSubscriptionsCommand)initWithSubscriptions:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = *MEMORY[0x1E4F19C08];
  v8 = (void *)[v6 initWithZoneName:@"Subscriptions" ownerName:*MEMORY[0x1E4F19C08]];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"SensitiveSubscriptions" ownerName:v7];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__FCRemoveSubscriptionsCommand_initWithSubscriptions___block_invoke;
  v16[3] = &unk_1E5B5C278;
  id v17 = v9;
  id v18 = v8;
  id v10 = v8;
  id v11 = v9;
  v12 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v16);

  v15.receiver = self;
  v15.super_class = (Class)FCRemoveSubscriptionsCommand;
  v13 = [(FCRemoveRecordsCommand *)&v15 initWithRecordIDs:v12];

  return v13;
}

id __54__FCRemoveSubscriptionsCommand_initWithSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 zone];
  uint64_t v5 = 40;
  if (v4 == 1) {
    uint64_t v5 = 32;
  }
  id v6 = *(void **)(a1 + v5);
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v8 = v6;
  id v9 = [v7 alloc];
  id v10 = [v3 subscriptionID];

  id v11 = (void *)[v9 initWithRecordName:v10 zoneID:v8];
  return v11;
}

- (FCRemoveSubscriptionsCommand)initWithSubscription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = [(FCRemoveSubscriptionsCommand *)self initWithSubscriptions:v6];
  }
  else
  {
    uint64_t v7 = [(FCRemoveSubscriptionsCommand *)self initWithSubscriptions:MEMORY[0x1E4F1CBF0]];
  }

  return v7;
}

@end