@interface SRFollowUp
+ (void)initialize;
- (SRFollowUp)init;
- (void)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)pendingFollowUpItemsWithCompletion:(id)a3;
- (void)postFollowUpItem:(id)a3 completion:(id)a4;
@end

@implementation SRFollowUp

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogFollowUp = (uint64_t)os_log_create("com.apple.SensorKit", "SRFollowUp");
  }
}

- (SRFollowUp)init
{
  v4.receiver = self;
  v4.super_class = (Class)SRFollowUp;
  v2 = [(SRFollowUp *)&v4 init];
  if (v2) {
    v2->_followUpController = (FLFollowUpController *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.sensorkitd"];
  }
  return v2;
}

- (void)dealloc
{
  self->_followUpController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRFollowUp;
  [(SRFollowUp *)&v3 dealloc];
}

- (void)postFollowUpItem:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7 = SRLogFollowUp;
  if (os_log_type_enabled((os_log_t)SRLogFollowUp, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = a3;
    _os_log_impl(&dword_230B11000, v7, OS_LOG_TYPE_INFO, "Attempting to post follow up item: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(FLFollowUpController *)self->_followUpController postFollowUpItem:a3 completion:a4];
}

- (void)clearPendingFollowUpItemsWithUniqueIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7 = SRLogFollowUp;
  if (os_log_type_enabled((os_log_t)SRLogFollowUp, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    id v9 = a3;
    _os_log_impl(&dword_230B11000, v7, OS_LOG_TYPE_INFO, "Attempting to clear follow up identifiers: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(FLFollowUpController *)self->_followUpController clearPendingFollowUpItemsWithUniqueIdentifiers:a3 completion:a4];
}

- (void)pendingFollowUpItemsWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = SRLogFollowUp;
  if (os_log_type_enabled((os_log_t)SRLogFollowUp, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    v7 = @"com.apple.SensorKit.followup.enableSensorKit";
    _os_log_impl(&dword_230B11000, v5, OS_LOG_TYPE_INFO, "Retrieving follow items for %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(FLFollowUpController *)self->_followUpController pendingFollowUpItemsWithCompletion:a3];
}

@end