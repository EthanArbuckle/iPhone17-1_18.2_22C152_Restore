@interface _SFCollaborationItemsRequest
- (BOOL)isURLProviderSupported;
- (BOOL)supportsMultipleCollaboration;
- (NSArray)activityItems;
- (NSMutableArray)collaborationItems;
- (NSMutableArray)remainingActivityItems;
- (NSURL)managedFileURL;
- (_SFCollaborationItemsRequest)initWithActivityItems:(id)a3 completionHandler:(id)a4;
- (_SFCollaborationItemsRequestDelegate)delegate;
- (id)collaborationService;
- (id)completionHandler;
- (void)_addCollaborationItem:(id)a3;
- (void)_processRemainingActivityItems;
- (void)cancel;
- (void)setActivityItems:(id)a3;
- (void)setCollaborationItems:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsURLProviderSupported:(BOOL)a3;
- (void)setManagedFileURL:(id)a3;
- (void)setRemainingActivityItems:(id)a3;
- (void)setSupportsMultipleCollaboration:(BOOL)a3;
@end

@implementation _SFCollaborationItemsRequest

- (_SFCollaborationItemsRequest)initWithActivityItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SFCollaborationItemsRequest;
  v8 = [(_SFCollaborationItemsRequest *)&v19 init];
  if (v8)
  {
    v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v21 = v6;
      _os_log_impl(&dword_1A5389000, v9, OS_LOG_TYPE_INFO, "New _SFCollaborationItemsRequest for activityItems:%{private}@", buf, 0xCu);
    }

    uint64_t v10 = [v6 copy];
    activityItems = v8->_activityItems;
    v8->_activityItems = (NSArray *)v10;

    uint64_t v12 = [v7 copy];
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v12;

    uint64_t v14 = [v6 mutableCopy];
    remainingActivityItems = v8->_remainingActivityItems;
    v8->_remainingActivityItems = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    collaborationItems = v8->_collaborationItems;
    v8->_collaborationItems = (NSMutableArray *)v16;
  }
  return v8;
}

- (void)cancel
{
}

- (id)collaborationService
{
  v3 = [(_SFCollaborationItemsRequest *)self delegate];
  v4 = [v3 collaborationServiceForItemsRequest:self];

  return v4;
}

- (void)_processRemainingActivityItems
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(_SFCollaborationItemsRequest *)self supportsMultipleCollaboration])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [(_SFCollaborationItemsRequest *)self collaborationItems];
    if ([v4 count] == 2)
    {
      v5 = [(_SFCollaborationItemsRequest *)self collaborationItems];
      id v6 = [v5 objectAtIndexedSubscript:0];
      if ([v6 type])
      {
        BOOL v3 = 0;
      }
      else
      {
        id v7 = [(_SFCollaborationItemsRequest *)self collaborationItems];
        v8 = [v7 objectAtIndexedSubscript:1];
        BOOL v3 = [v8 type] == 0;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  v9 = [(_SFCollaborationItemsRequest *)self remainingActivityItems];
  uint64_t v10 = [v9 count];

  if (v3 || !v10)
  {
    v24 = [(_SFCollaborationItemsRequest *)self completionHandler];
    [(_SFCollaborationItemsRequest *)self setCompletionHandler:0];
    uint64_t v14 = [(_SFCollaborationItemsRequest *)self collaborationItems];
    v24[2](v24, v14, 0);
  }
  else
  {
    v11 = [(_SFCollaborationItemsRequest *)self remainingActivityItems];
    v24 = [v11 firstObject];

    uint64_t v12 = [(_SFCollaborationItemsRequest *)self remainingActivityItems];
    [v12 removeObjectAtIndex:0];

    v13 = [(_SFCollaborationItemsRequest *)self delegate];
    uint64_t v14 = [v13 collaborationItemsRequest:self resolveActivityItem:v24];

    v15 = [v14 firstObject];
    uint64_t v16 = [(_SFCollaborationItemsRequest *)self collaborationItems];
    v17 = [v16 firstObject];
    if ([v17 type] == 1)
    {
      BOOL v18 = 0;
    }
    else
    {
      objc_super v19 = [(_SFCollaborationItemsRequest *)self collaborationItems];
      v20 = [v19 firstObject];
      BOOL v18 = [v20 type] != 2;
    }
    id v21 = [(_SFCollaborationItemsRequest *)self collaborationService];
    uint64_t v22 = [(_SFCollaborationItemsRequest *)self managedFileURL];
    v23 = +[SFCollaborationItemInspector inspectActivityItemValue:v15 activityItem:v24 service:v21 shouldInspectFiles:v18 managedFileURL:v22 isURLProviderSupported:[(_SFCollaborationItemsRequest *)self isURLProviderSupported]];

    if (v23) {
      [(_SFCollaborationItemsRequest *)self _addCollaborationItem:v23];
    }
    [(_SFCollaborationItemsRequest *)self _processRemainingActivityItems];
  }
}

- (void)_addCollaborationItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  v20 = [MEMORY[0x1E4F1CA48] array];
  BOOL v18 = v4;
  BOOL v21 = [v4 type] != 1 && objc_msgSend(v4, "type") != 2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(_SFCollaborationItemsRequest *)self remainingActivityItems];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [(_SFCollaborationItemsRequest *)self delegate];
        v11 = [v10 collaborationItemsRequest:self resolveActivityItem:v9];

        uint64_t v12 = [v11 firstObject];
        v13 = [(_SFCollaborationItemsRequest *)self collaborationService];
        uint64_t v14 = [(_SFCollaborationItemsRequest *)self managedFileURL];
        v15 = +[SFCollaborationItemInspector inspectActivityItemValue:v12 activityItem:v9 service:v13 shouldInspectFiles:v21 managedFileURL:v14 isURLProviderSupported:[(_SFCollaborationItemsRequest *)self isURLProviderSupported]];

        if (v15)
        {

          goto LABEL_16;
        }
        [v22 addObject:v9];
        if (v12) {
          [v20 addObject:v12];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  uint64_t v16 = [(_SFCollaborationItemsRequest *)self remainingActivityItems];
  [v16 removeObjectsInArray:v22];

  [v18 setSendCopyActivityItems:v22];
  [v18 setSendCopyActivityItemValues:v20];
  v17 = [(_SFCollaborationItemsRequest *)self collaborationItems];
  [v17 addObject:v18];
}

- (_SFCollaborationItemsRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFCollaborationItemsRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)supportsMultipleCollaboration
{
  return self->_supportsMultipleCollaboration;
}

- (void)setSupportsMultipleCollaboration:(BOOL)a3
{
  self->_supportsMultipleCollaboration = a3;
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
}

- (BOOL)isURLProviderSupported
{
  return self->_isURLProviderSupported;
}

- (void)setIsURLProviderSupported:(BOOL)a3
{
  self->_isURLProviderSupported = a3;
}

- (NSMutableArray)remainingActivityItems
{
  return self->_remainingActivityItems;
}

- (void)setRemainingActivityItems:(id)a3
{
}

- (NSMutableArray)collaborationItems
{
  return self->_collaborationItems;
}

- (void)setCollaborationItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationItems, 0);
  objc_storeStrong((id *)&self->_remainingActivityItems, 0);
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end