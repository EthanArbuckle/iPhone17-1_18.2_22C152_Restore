@interface REMReminder_Codable
- (REMReminder_Codable)initWithStore:(id)a3 account:(id)a4 storage:(id)a5;
- (REMReminder_Codable)initWithStore:(id)a3 list:(id)a4 storage:(id)a5;
- (REMReminder_Codable)initWithStore:(id)a3 storage:(id)a4;
@end

@implementation REMReminder_Codable

- (REMReminder_Codable)initWithStore:(id)a3 list:(id)a4 storage:(id)a5
{
  return (REMReminder_Codable *)sub_1A7506C94(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (SEL *)&selRef_initWithStore_list_storage_);
}

- (REMReminder_Codable)initWithStore:(id)a3 storage:(id)a4
{
  return (REMReminder_Codable *)sub_1A7510B58(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_initWithStore_storage_);
}

- (REMReminder_Codable)initWithStore:(id)a3 account:(id)a4 storage:(id)a5
{
  return (REMReminder_Codable *)sub_1A7506C94(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (SEL *)&selRef_initWithStore_account_storage_);
}

@end