@interface VUIActionMarkedAsWatched
- (NSString)adamID;
- (NSString)itemID;
- (NSString)itemType;
- (VUIActionMarkedAsWatched)initWithContextData:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAdamID:(id)a3;
- (void)setItemID:(id)a3;
- (void)setItemType:(id)a3;
@end

@implementation VUIActionMarkedAsWatched

- (VUIActionMarkedAsWatched)initWithContextData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIActionMarkedAsWatched;
  v5 = [(VUIActionMarkedAsWatched *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"itemID");
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "vui_stringForKey:", @"type");
    itemType = v5->_itemType;
    v5->_itemType = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "vui_stringForKey:", @"adamID");
    adamID = v5->_adamID;
    v5->_adamID = (NSString *)v10;
  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  uint64_t v6 = +[VUIMarkAsWatchedRequestManager sharedInstance];
  p_itemID = (uint64_t *)&self->_itemID;
  p_itemType = (uint64_t *)&self->_itemType;
  [v6 sendRequestForItemID:self->_itemID itemType:self->_itemType channelID:0 adamID:self->_adamID];

  if (!self->_itemID || !*p_itemType)
  {
    v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VUIActionMarkedAsWatched performWithTargetResponder:completionHandler:](p_itemID, p_itemType, v9);
    }
  }
  if (v5) {
    v5[2](v5, 1);
  }
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionMarkedAsWatched failed for itemID [%@] type [%@]", (uint8_t *)&v5, 0x16u);
}

@end