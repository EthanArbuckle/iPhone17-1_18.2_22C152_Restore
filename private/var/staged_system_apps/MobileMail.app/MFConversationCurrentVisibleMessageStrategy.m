@interface MFConversationCurrentVisibleMessageStrategy
- (ConversationViewControllerBase)viewController;
- (MFConversationCurrentVisibleMessageStrategy)initWithConversationViewController:(id)a3;
- (MessageContentRepresentationRequest)currentVisibleMessageContentRequest;
- (id)persistentIDForEMMessageObjectID:(id)a3;
@end

@implementation MFConversationCurrentVisibleMessageStrategy

- (MFConversationCurrentVisibleMessageStrategy)initWithConversationViewController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MFConversationCurrentVisibleMessageStrategy.m", 25, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)MFConversationCurrentVisibleMessageStrategy;
  v6 = [(MFConversationCurrentVisibleMessageStrategy *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_viewController, v5);
  }

  return v7;
}

- (id)persistentIDForEMMessageObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(MFConversationCurrentVisibleMessageStrategy *)self viewController];
  v6 = [v5 _persistentIDForEMMessageObjectID:v4];

  return v6;
}

- (MessageContentRepresentationRequest)currentVisibleMessageContentRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v3 = [WeakRetained collectionView];
  [v3 mf_visibleBounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  id v12 = [WeakRetained conversationSortOrder];
  v13 = [v3 visibleCells];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100187DB8;
  v26[3] = &unk_10060B1C8;
  BOOL v27 = v12 != (id)1;
  v14 = [v13 sortedArrayUsingComparator:v26];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100187E5C;
  v24 = sub_100187E6C;
  id v25 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100187E74;
  v18[3] = &unk_10060B1F0;
  v18[6] = v5;
  v18[7] = v7;
  v18[8] = v9;
  v18[9] = v11;
  v18[4] = v19;
  v18[5] = &v20;
  [v14 enumerateObjectsUsingBlock:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [(id)v21[5] viewModel];
    v16 = [v15 messageContentRequest];
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v20, 8);

  return (MessageContentRepresentationRequest *)v16;
}

- (ConversationViewControllerBase)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (ConversationViewControllerBase *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end