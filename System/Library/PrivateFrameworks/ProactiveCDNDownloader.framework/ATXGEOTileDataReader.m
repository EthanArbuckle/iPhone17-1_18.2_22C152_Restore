@interface ATXGEOTileDataReader
- (id)appAndClipEntryForTileData:(id)a3;
- (id)readFileURL:(id)a3;
- (id)readTileData:(id)a3;
@end

@implementation ATXGEOTileDataReader

- (id)appAndClipEntryForTileData:(id)a3
{
  id v4 = a3;
  v5 = [v4 data];

  if (v5)
  {
    v6 = [v4 data];
    uint64_t v7 = [(ATXGEOTileDataReader *)self readTileData:v6];
LABEL_5:
    v9 = (void *)v7;

    goto LABEL_6;
  }
  v8 = [v4 fileURL];

  if (v8)
  {
    v6 = [v4 fileURL];
    uint64_t v7 = [(ATXGEOTileDataReader *)self readFileURL:v6];
    goto LABEL_5;
  }
  v11 = __atxlog_handle_hero();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ATXGEOTileDataReader appAndClipEntryForTileData:](v11);
  }

  v9 = 0;
LABEL_6:

  return v9;
}

- (id)readTileData:(id)a3
{
  return +[ATXHeroEntriesReader loadAppAndClipEntriesFromData:a3];
}

- (id)readFileURL:(id)a3
{
  return +[ATXHeroEntriesReader loadAppAndClipEntriesFromFileURL:a3];
}

- (void)appAndClipEntryForTileData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FF54000, log, OS_LOG_TYPE_ERROR, "No data was found in the tile", v1, 2u);
}

@end