@interface WBUHistory
- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3;
- (BOOL)historyStoreShouldScheduleMaintenance:(id)a3;
- (BOOL)shouldScheduleMaintenance;
- (Class)_historyItemClass;
- (WBUHistory)initWithDatabaseID:(id)a3;
- (id)_createHistoryStore;
- (void)historyStoreDidFailDatabaseIntegrityCheck:(id)a3;
- (void)setShouldScheduleMaintenance:(BOOL)a3;
@end

@implementation WBUHistory

- (id)_createHistoryStore
{
  id v3 = objc_alloc((Class)off_2643EFDB0);
  v4 = [(WBSHistory *)self databaseID];
  v5 = objc_msgSend(v3, "initWithDatabaseID:itemCountLimit:historyAgeLimit:historyItemClass:", v4, 4000, -[WBUHistory _historyItemClass](self, "_historyItemClass"), *(double *)((char *)&self->super.super.isa + *(int *)off_2643EFE70));

  return v5;
}

- (WBUHistory)initWithDatabaseID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WBUHistory;
  id v3 = [(WBSHistory *)&v7 initWithDatabaseID:a3];
  v4 = v3;
  if (v3)
  {
    v3->_shouldScheduleMaintenance = 1;
    *(Class *)((char *)&v3->super.super.isa + *(int *)off_2643EFE70) = (Class)0x4143C68000000000;
    [(WBSHistory *)v3 _createHistoryStoreIfNeeded];
    v5 = v4;
  }

  return v4;
}

- (BOOL)historyStoreShouldScheduleMaintenance:(id)a3
{
  return self->_shouldScheduleMaintenance;
}

- (Class)_historyItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3
{
  return 1;
}

- (void)historyStoreDidFailDatabaseIntegrityCheck:(id)a3
{
  objc_msgSend(MEMORY[0x263F08850], "defaultManager", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(id)objc_opt_class() historyDatabaseURL];
  [v5 removeItemAtURL:v3 error:0];

  v4 = [(id)objc_opt_class() historyDatabaseWriteAheadLogURL];
  [v5 removeItemAtURL:v4 error:0];
}

- (BOOL)shouldScheduleMaintenance
{
  return self->_shouldScheduleMaintenance;
}

- (void)setShouldScheduleMaintenance:(BOOL)a3
{
  self->_shouldScheduleMaintenance = a3;
}

@end