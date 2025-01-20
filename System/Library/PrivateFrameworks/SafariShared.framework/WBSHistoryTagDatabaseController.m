@interface WBSHistoryTagDatabaseController
- (BOOL)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 error:(id *)a5;
- (BOOL)clearAllTagsWithError:(id *)a3;
- (BOOL)clearTagsFromStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (BOOL)renameTagWithID:(int64_t)a3 toTitle:(id)a4 error:(id *)a5;
- (WBSHistoryTagDatabaseController)initWithDatabase:(id)a3;
- (id)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 error:(id *)a7;
@end

@implementation WBSHistoryTagDatabaseController

- (WBSHistoryTagDatabaseController)initWithDatabase:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryTagDatabaseController;
  v6 = [(WBSHistoryTagDatabaseController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = v7;
  }

  return v7;
}

- (id)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = [MEMORY[0x1E4F1CA48] array];
  database = self->_database;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __88__WBSHistoryTagDatabaseController_createTagsForIdentifiers_withTitles_type_level_error___block_invoke;
  v23[3] = &unk_1E5C9D930;
  id v16 = v12;
  id v24 = v16;
  id v17 = v13;
  id v25 = v17;
  v26 = self;
  v28 = a7;
  unint64_t v29 = a5;
  int64_t v30 = a6;
  id v18 = v14;
  id v27 = v18;
  int v19 = [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v23];
  if (v19) {
    v20 = v18;
  }
  else {
    v20 = 0;
  }
  if (v19) {
    v21 = 0;
  }
  else {
    v21 = v18;
  }

  return v20;
}

uint64_t __88__WBSHistoryTagDatabaseController_createTagsForIdentifiers_withTitles_type_level_error___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) count]) {
    return 1;
  }
  uint64_t v2 = 0;
  while (1)
  {
    id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v2];
    id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
    v3 = *(void **)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(a1 + 64);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v10 = v5;
    int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,unsigned long const&,long long const&,double>(v3, v4, @"INSERT INTO history_tags (identifier, title, type, level, modification_timestamp) VALUES (?, ?, ?, ?, ?)", &v11, &v12, (void *)(a1 + 72), (void *)(a1 + 80), (double *)&v10);
    if (v6)
    {
      if (v6 != 101) {
        break;
      }
    }
    v7 = *(void **)(a1 + 56);
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "lastInsertRowID"));
    [v7 addObject:v8];

    if (++v2 >= (unint64_t)[*(id *)(a1 + 32) count]) {
      return 1;
    }
  }

  return 0;
}

- (BOOL)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  database = self->_database;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__WBSHistoryTagDatabaseController_assignURLString_toTopicTagsWithIDs_error___block_invoke;
  v14[3] = &unk_1E5C9D958;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = a5;
  id v11 = v9;
  id v12 = v8;
  LOBYTE(self) = [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v14];

  return (char)self;
}

uint64_t __76__WBSHistoryTagDatabaseController_assignURLString_toTopicTagsWithIDs_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v10 = (id *)&v11;
  uint64_t v11 = 0;
  uint64_t result = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * const {__strong}&,std::tuple<long long &>>(v2, v3, @"SELECT id FROM history_items WHERE url = ?", (id *)(a1 + 40), &v10);
  if (result)
  {
    uint64_t v5 = *(void **)([*(id *)(a1 + 48) set] + 16);
    if (v5)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0);
        uint64_t v10 = v6;
        int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,long long const&,double &>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 56), @"INSERT INTO history_items_to_tags (history_item, tag_id, timestamp) VALUES (?, ?, ?)", &v11, v5 + 2, (double *)&v10);
        if (v7 != 101 && v7 != 0) {
          break;
        }
        int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double &,long long const&>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 56), @"UPDATE history_tags SET modification_timestamp = ? WHERE id = ?", (double *)&v10, v5 + 2);
        if (v9)
        {
          if (v9 != 101) {
            break;
          }
        }
        uint64_t v5 = (void *)*v5;
        if (!v5) {
          return 1;
        }
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)renameTagWithID:(int64_t)a3 toTitle:(id)a4 error:(id *)a5
{
  id v8 = a4;
  database = self->_database;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__WBSHistoryTagDatabaseController_renameTagWithID_toTitle_error___block_invoke;
  v12[3] = &unk_1E5C9D980;
  v12[4] = self;
  id v13 = v8;
  v14 = a5;
  int64_t v15 = a3;
  id v10 = v8;
  LOBYTE(a3) = [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v12];

  return a3;
}

BOOL __65__WBSHistoryTagDatabaseController_renameTagWithID_toTitle_error___block_invoke(uint64_t a1)
{
  int v1 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,long long const&>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 48), @"UPDATE history_tags SET title = ? WHERE id = ?", (void *)(a1 + 40), (void *)(a1 + 56));
  return v1 == 101 || v1 == 0;
}

- (BOOL)clearAllTagsWithError:(id *)a3
{
  database = self->_database;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__WBSHistoryTagDatabaseController_clearAllTagsWithError___block_invoke;
  v5[3] = &unk_1E5C9D9A8;
  v5[4] = self;
  v5[5] = a3;
  return [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v5];
}

BOOL __57__WBSHistoryTagDatabaseController_clearAllTagsWithError___block_invoke(uint64_t a1)
{
  int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), @"DELETE FROM history_items_to_tags");
  if (v2 != 101 && v2 != 0) {
    return 0;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), @"DELETE FROM history_tags");
  return v4 == 101 || v4 == 0;
}

- (BOOL)clearTagsFromStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;
  [v9 timeIntervalSinceReferenceDate];
  database = self->_database;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__WBSHistoryTagDatabaseController_clearTagsFromStartDate_endDate_error___block_invoke;
  v15[3] = &unk_1E5C9D9D0;
  v15[4] = self;
  v15[5] = a5;
  v15[6] = v11;
  v15[7] = v13;
  LOBYTE(a5) = [(WBSSQLiteDatabase *)database tryToPerformTransactionInBlock:v15];

  return (char)a5;
}

BOOL __72__WBSHistoryTagDatabaseController_clearTagsFromStartDate_endDate_error___block_invoke(uint64_t a1)
{
  int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double const&,double const&>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), @"DELETE FROM history_items_to_tags WHERE timestamp > ? AND timestamp < ?", (double *)(a1 + 48), (double *)(a1 + 56));
  if (v2 != 101 && v2 != 0) {
    return 0;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double const&,double const&>(*(void **)(*(void *)(a1 + 32) + 8), *(void **)(a1 + 40), @"DELETE FROM history_tags WHERE modification_timestamp > ? AND modification_timestamp < ?", (double *)(a1 + 48), (double *)(a1 + 56));
  return v4 == 101 || v4 == 0;
}

- (void).cxx_destruct
{
}

@end