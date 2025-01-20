@interface BRCRecentsEnumeratorBatch
- (BRCRecentsEnumeratorBatch)initWithBatchSize:(unint64_t)a3;
- (id)description;
- (unint64_t)batchCount;
- (unint64_t)rank;
- (void)addDeletionOfFileObjectID:(id)a3 rank:(unint64_t)a4;
- (void)addIndexOfItem:(id)a3;
- (void)listItems:(id)a3;
- (void)setRank:(unint64_t)a3;
@end

@implementation BRCRecentsEnumeratorBatch

- (BRCRecentsEnumeratorBatch)initWithBatchSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BRCRecentsEnumeratorBatch;
  v4 = [(BRCRecentsEnumeratorBatch *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    toIndexItems = v4->_toIndexItems;
    v4->_toIndexItems = (NSFileProviderItem *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    deletedItemIDs = v4->_deletedItemIDs;
    v4->_deletedItemIDs = (NSMutableArray *)v7;
  }
  return v4;
}

- (void)addIndexOfItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BRCNotification notificationGatheredFromItem:v4];
  v6 = [v4 itemID];
  int v7 = [v6 isDocumentsFolder];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [v4 appLibrary];
  v9 = [v4 db];
  objc_super v10 = [v8 fetchRootItemInDB:v9];

  v11 = +[BRCNotification notificationFromItem:v10];
  v12 = (void *)MEMORY[0x263F32610];
  v13 = [v4 appLibrary];
  v14 = [v13 containerMetadata];
  v15 = [v12 containerItemForContainer:v14 withRepresentativeItem:v11];

  uint64_t v16 = [v15 asFileProviderItem];
  if (v16)
  {
    v17 = (void *)v16;
    [(NSFileProviderItem *)self->_toIndexItems addObject:v16];

LABEL_4:
    if ([v5 isDead])
    {
      v18 = [v5 fileObjectID];
      -[BRCRecentsEnumeratorBatch addDeletionOfFileObjectID:rank:](self, "addDeletionOfFileObjectID:rank:", v18, [v4 notifsRank]);
    }
    objc_super v10 = [v5 asFileProviderItem];
    if (v10)
    {
      [(NSFileProviderItem *)self->_toIndexItems addObject:v10];
      -[BRCRecentsEnumeratorBatch setRank:](self, "setRank:", [v4 notifsRank]);
    }
    goto LABEL_11;
  }
  v19 = brc_bread_crumbs();
  v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[BRCRecentsEnumeratorBatch addIndexOfItem:]();
  }

LABEL_11:
}

- (void)addDeletionOfFileObjectID:(id)a3 rank:(unint64_t)a4
{
  [(NSMutableArray *)self->_deletedItemIDs addObject:a3];
  [(BRCRecentsEnumeratorBatch *)self setRank:a4];
}

- (unint64_t)batchCount
{
  uint64_t v3 = [(NSFileProviderItem *)self->_toIndexItems count];
  return [(NSMutableArray *)self->_deletedItemIDs count] + v3;
}

- (void)setRank:(unint64_t)a3
{
  if (self->_rank > a3)
  {
    uint64_t v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCRecentsEnumeratorBatch setRank:]();
    }
  }
  self->_rank = a3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, %lu indexed, %lu deleted>", objc_opt_class(), self, -[NSFileProviderItem count](self->_toIndexItems, "count"), -[NSMutableArray count](self->_deletedItemIDs, "count")];
}

- (void)listItems:(id)a3
{
  if (a3) {
    (*((void (**)(id, NSFileProviderItem *, NSMutableArray *))a3 + 2))(a3, self->_toIndexItems, self->_deletedItemIDs);
  }
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_toIndexItems, 0);
}

- (void)addIndexOfItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: There should be a root item for %@%@", v1, 0x16u);
}

- (void)setRank:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rank >= _rank%@", v1, 0xCu);
}

@end