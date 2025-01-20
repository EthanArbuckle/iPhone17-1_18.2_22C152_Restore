@interface VUIActionRemoveFromPlayHistory
- (BOOL)isContinueWatching;
- (NSString)deleteID;
- (VUIActionRemoveFromPlayHistory)initWithContextData:(id)a3 isContinueWatching:(BOOL)a4;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setDeleteID:(id)a3;
- (void)setIsContinueWatching:(BOOL)a3;
@end

@implementation VUIActionRemoveFromPlayHistory

- (VUIActionRemoveFromPlayHistory)initWithContextData:(id)a3 isContinueWatching:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionRemoveFromPlayHistory;
  v7 = [(VUIActionRemoveFromPlayHistory *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "vui_stringForKey:", @"deleteId");
    deleteID = v7->_deleteID;
    v7->_deleteID = (NSString *)v8;

    v7->_isContinueWatching = a4;
  }

  return v7;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  p_deleteID = (uint64_t *)&self->_deleteID;
  if ([(NSString *)self->_deleteID length])
  {
    v7 = +[VUIRemoveFromPlayHistoryRequestManager sharedInstance];
    [v7 sendRequestForDeleteID:*p_deleteID isContinueWatching:self->_isContinueWatching];

    if (v5) {
LABEL_3:
    }
      v5[2](v5, 1);
  }
  else
  {
    uint64_t v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIActionRemoveFromPlayHistory performWithTargetResponder:completionHandler:](p_deleteID, v8);
    }

    if (v5) {
      goto LABEL_3;
    }
  }
}

- (NSString)deleteID
{
  return self->_deleteID;
}

- (void)setDeleteID:(id)a3
{
}

- (BOOL)isContinueWatching
{
  return self->_isContinueWatching;
}

- (void)setIsContinueWatching:(BOOL)a3
{
  self->_isContinueWatching = a3;
}

- (void).cxx_destruct
{
}

- (void)performWithTargetResponder:(uint64_t *)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIActionRemoveFromPlayHistory failed for itemID [%@]", (uint8_t *)&v3, 0xCu);
}

@end