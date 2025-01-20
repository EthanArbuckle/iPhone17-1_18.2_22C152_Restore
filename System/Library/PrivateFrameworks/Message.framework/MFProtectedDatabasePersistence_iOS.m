@interface MFProtectedDatabasePersistence_iOS
+ (id)journalDatabaseName;
+ (id)protectedDatabaseName;
- (BOOL)protectedDataAvailable;
- (BOOL)supportsJournaling;
- (void)addAdditionalCriteriaToCleanupActivity:(id)a3;
- (void)finishJournalReconciliation:(unint64_t)a3;
@end

@implementation MFProtectedDatabasePersistence_iOS

- (BOOL)supportsJournaling
{
  return 1;
}

- (BOOL)protectedDataAvailable
{
  v3 = +[MFMailMessageLibrary defaultInstance];
  if ([v3 allowedToAccessProtectedData])
  {
    v6.receiver = self;
    v6.super_class = (Class)MFProtectedDatabasePersistence_iOS;
    BOOL v4 = [(EDProtectedDatabasePersistence *)&v6 protectedDataAvailable];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)protectedDatabaseName
{
  return @"protected";
}

+ (id)journalDatabaseName
{
  return @"journal";
}

- (void)finishJournalReconciliation:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFProtectedDatabasePersistence_iOS;
  -[EDProtectedDatabasePersistence finishJournalReconciliation:](&v5, sel_finishJournalReconciliation_);
  if (a3 == 2)
  {
    BOOL v4 = +[MFMailMessageLibrary defaultInstance];
    [v4 journalReconciliationFailed];
  }
  else
  {
    if (a3) {
      return;
    }
    BOOL v4 = +[MFMailMessageLibrary defaultInstance];
    [v4 journalWasReconciled];
  }
}

- (void)addAdditionalCriteriaToCleanupActivity:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFProtectedDatabasePersistence_iOS;
  [(EDProtectedDatabasePersistence *)&v5 addAdditionalCriteriaToCleanupActivity:v4];
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14310], 1);
}

@end