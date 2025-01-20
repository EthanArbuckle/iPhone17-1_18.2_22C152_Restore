@interface JournalEntryMO
- (JournalEntryMO)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSString)sectionOrderedByEntryDateGroupingString;
- (NSString)sectionOrderedByMomentDateGroupingString;
- (void)prepareForDeletion;
- (void)willSave;
@end

@implementation JournalEntryMO

- (NSString)sectionOrderedByEntryDateGroupingString
{
  return (NSString *)sub_10003852C(self, (uint64_t)a2, (SEL *)&selRef_entryDate);
}

- (NSString)sectionOrderedByMomentDateGroupingString
{
  return (NSString *)sub_10003852C(self, (uint64_t)a2, (SEL *)&selRef_momentDateForSorting);
}

- (void)willSave
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JournalEntryMO();
  id v2 = v3.receiver;
  [(JournalEntryMO *)&v3 willSave];
  if ((objc_msgSend(v2, "isDeleted", v3.receiver, v3.super_class) & 1) == 0) {
    sub_10030DC34();
  }
}

- (void)prepareForDeletion
{
  id v2 = self;
  JournalEntryMO.prepareForDeletion()();
}

- (JournalEntryMO)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JournalEntryMO();
  return [(JournalEntryMO *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end