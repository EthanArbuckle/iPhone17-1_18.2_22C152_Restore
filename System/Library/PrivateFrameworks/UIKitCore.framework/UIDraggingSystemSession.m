@interface UIDraggingSystemSession
- (BOOL)isCommandeered;
- (UIDraggingSystemSessionInfo)info;
- (UIDraggingSystemTouchRoutingPolicy)routingPolicy;
- (_DUIServerSessionSystemApp)_serverSession;
- (unint64_t)_indexOfDragItemInSession:(id)a3;
- (void)commandeerImmediately;
- (void)loadURLForItem:(id)a3 completion:(id)a4;
- (void)loadUserActivityForItem:(id)a3 completion:(id)a4;
- (void)requestDragContinuationEndpointWithCompletion:(id)a3;
- (void)setCommandeered:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setRoutingPolicy:(id)a3;
- (void)setServerSession:(id)a3;
@end

@implementation UIDraggingSystemSession

- (void)commandeerImmediately
{
  self->_commandeered = 1;
}

- (void)setCommandeered:(BOOL)a3
{
  BOOL commandeered = self->_commandeered;
  if (commandeered != a3)
  {
    v6 = [(UIDraggingSystemSession *)self _serverSession];
    v7 = v6;
    if (commandeered) {
      [v6 surrenderDragSession];
    }
    else {
      [v6 commandeerDragSession];
    }

    self->_BOOL commandeered = a3;
  }
}

- (unint64_t)_indexOfDragItemInSession:(id)a3
{
  id v4 = a3;
  v5 = [v4 _dragDropSession];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v6 = [v5 sessionDestination];
  int v7 = [v6 sessionIdentifier];

  v8 = [(UIDraggingSystemSession *)self info];
  LODWORD(v6) = [v8 sessionIdentifier];

  if (v7 == v6)
  {
    v9 = [v5 items];
    unint64_t v10 = [v9 indexOfObjectIdenticalTo:v4];
  }
  else
  {
LABEL_4:
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)loadURLForItem:(id)a3 completion:(id)a4
{
  v9 = (void (**)(id, void))a4;
  unint64_t v6 = [(UIDraggingSystemSession *)self _indexOfDragItemInSession:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9[2](v9, 0);
  }
  else
  {
    unint64_t v7 = v6;
    v8 = [(UIDraggingSystemSession *)self _serverSession];
    [v8 loadURLForItemAtIndex:v7 reply:v9];
  }
}

- (void)loadUserActivityForItem:(id)a3 completion:(id)a4
{
  unint64_t v6 = (void (**)(id, void))a4;
  unint64_t v7 = [(UIDraggingSystemSession *)self _indexOfDragItemInSession:a3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6[2](v6, 0);
  }
  else
  {
    unint64_t v8 = v7;
    v9 = [(UIDraggingSystemSession *)self _serverSession];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__UIDraggingSystemSession_loadUserActivityForItem_completion___block_invoke;
    v10[3] = &unk_1E530CA90;
    v11 = v6;
    [v9 loadUserActivityDataForItemAtIndex:v8 reply:v10];
  }
}

void __62__UIDraggingSystemSession_loadUserActivityForItem_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E4F29230];
    id v4 = a2;
    id v5 = (id)[[v3 alloc] _initWithUserActivityData:v4];
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestDragContinuationEndpointWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDraggingSystemSession *)self _serverSession];
  [v5 requestDragContinuationEndpointWithReply:v4];
}

- (BOOL)isCommandeered
{
  return self->_commandeered;
}

- (UIDraggingSystemSessionInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (UIDraggingSystemTouchRoutingPolicy)routingPolicy
{
  return self->_routingPolicy;
}

- (void)setRoutingPolicy:(id)a3
{
}

- (_DUIServerSessionSystemApp)_serverSession
{
  return self->_serverSession;
}

- (void)setServerSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSession, 0);
  objc_storeStrong((id *)&self->_routingPolicy, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end