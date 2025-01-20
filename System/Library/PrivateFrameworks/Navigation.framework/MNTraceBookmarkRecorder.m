@interface MNTraceBookmarkRecorder
- (MNTraceBookmarkRecorder)initWithTrace:(id)a3;
- (void)recordBookmarkAtTime:(double)a3 withScreenshotData:(id)a4 completionHandler:(id)a5;
@end

@implementation MNTraceBookmarkRecorder

- (MNTraceBookmarkRecorder)initWithTrace:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNTraceBookmarkRecorder;
  v6 = [(MNTraceBookmarkRecorder *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trace, a3);
    v8 = v7;
  }

  return v7;
}

- (void)recordBookmarkAtTime:(double)a3 withScreenshotData:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = [(MNTrace *)self->_trace writeGroup];
  v11 = [(MNTrace *)self->_trace writeQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke;
  v14[3] = &unk_1E60FAD40;
  id v15 = v8;
  v16 = self;
  double v18 = a3;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_group_async(v10, v11, v14);
}

void __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (*(void *)(a1 + 32)) {
    v2 = "INSERT INTO bookmarks (timestamp, screenshot_data) VALUES (?, ?)";
  }
  else {
    v2 = "INSERT INTO bookmarks (timestamp) VALUES (?)";
  }
  if (sqlite3_prepare_v2((sqlite3 *)[*(id *)(*(void *)(a1 + 40) + 8) db], v2, -1, &ppStmt, 0))
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
LABEL_12:
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "Error recording trace bookmark", buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  sqlite3_bind_double(ppStmt, 1, *(double *)(a1 + 56));
  v4 = *(void **)(a1 + 32);
  if (v4) {
    sqlite3_bind_blob(ppStmt, 2, (const void *)[v4 bytes], objc_msgSend(*(id *)(a1 + 32), "length"), 0);
  }
  sqlite3_step(ppStmt);
  if (sqlite3_finalize(ppStmt))
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      goto LABEL_12;
    }
LABEL_13:
  }
  id v5 = *(void **)(a1 + 48);
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_22;
  }
  *(void *)buf = 0;
  if (sqlite3_prepare_v2((sqlite3 *)[*(id *)(*(void *)(a1 + 40) + 8) db], "SELECT Count(*) FROM bookmarks", -1, (sqlite3_stmt **)buf, 0))
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Error counting trace bookmarks", v11, 2u);
    }
    uint64_t v7 = 0;
  }
  else
  {
    sqlite3_step(*(sqlite3_stmt **)buf);
    uint64_t v7 = sqlite3_column_int(*(sqlite3_stmt **)buf, 0);
    if (!sqlite3_finalize(*(sqlite3_stmt **)buf)) {
      goto LABEL_20;
    }
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "Error counting trace bookmarks", v11, 2u);
    }
  }

LABEL_20:
  id v5 = *(void **)(a1 + 48);
LABEL_22:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke_10;
  block[3] = &unk_1E60FAD18;
  block[4] = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__MNTraceBookmarkRecorder_recordBookmarkAtTime_withScreenshotData_completionHandler___block_invoke_10(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setBookmarks:0];
  [*(id *)(*(void *)(a1 + 32) + 8) setBookmarkImages:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end