@interface REMSmartList_Codable
- (REMSmartList_Codable)initWithStore:(id)a3 account:(id)a4 parentList:(id)a5 storage:(id)a6;
- (REMSmartList_Codable)initWithStore:(id)a3 storage:(id)a4;
@end

@implementation REMSmartList_Codable

- (REMSmartList_Codable)initWithStore:(id)a3 storage:(id)a4
{
  return (REMSmartList_Codable *)sub_1A7510B58(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_initWithStore_storage_);
}

- (REMSmartList_Codable)initWithStore:(id)a3 account:(id)a4 parentList:(id)a5 storage:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  return [(REMSmartList *)&v11 initWithStore:a3 account:a4 parentList:a5 storage:a6];
}

@end