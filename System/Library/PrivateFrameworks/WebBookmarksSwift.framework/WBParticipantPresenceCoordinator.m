@interface WBParticipantPresenceCoordinator
- (WBParticipantPresenceCoordinator)init;
- (WBParticipantPresenceCoordinatorDelegate)delegate;
- (void)beginCollaborationForShare:(id)a3;
- (void)beginDeviceCoordination;
- (void)endCollaborationForShare:(id)a3;
- (void)endDeviceCoordination;
- (void)getActiveParticipantsInTabGroupWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getActiveParticipantsInTabWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3;
- (void)getCurrentLocationIdentifiersForParticipantIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getTabGroupIdentifierForParticipantIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getTabIdentifierForParticipantIdentifier:(id)a3 completionHandler:(id)a4;
- (void)moveCurrentParticipantToTabIdentifier:(id)a3 inTabGroupIdentifier:(id)a4 withDeviceIdentifier:(id)a5;
- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabGroupWithIdentifier:(id)a5;
- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabWithIdentifier:(id)a5;
- (void)setDelegate:(id)a3;
- (void)shareDidUpdate:(id)a3;
@end

@implementation WBParticipantPresenceCoordinator

- (void)moveCurrentParticipantToTabIdentifier:(id)a3 inTabGroupIdentifier:(id)a4 withDeviceIdentifier:(id)a5
{
}

uint64_t __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setDelegate:(id)a3
{
}

- (WBParticipantPresenceCoordinator)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBParticipantPresenceCoordinator;
  v2 = [(WBParticipantPresenceCoordinator *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(_WBParticipantPresenceCoordinator);
    internalCoordinator = v2->_internalCoordinator;
    v2->_internalCoordinator = v3;

    [(_WBParticipantPresenceCoordinator *)v2->_internalCoordinator setDelegate:v2];
    v5 = v2;
  }

  return v2;
}

- (void)getActiveParticipantsInTabWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  internalCoordinator = self->_internalCoordinator;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_2655851F0;
  id v10 = v6;
  id v8 = v6;
  [(_WBParticipantPresenceCoordinator *)internalCoordinator getActiveParticipantsInTabWithIdentifier:a3 completionHandler:v9];
}

void __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__WBParticipantPresenceCoordinator_getActiveParticipantsInTabWithIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_265585150;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)beginDeviceCoordination
{
}

- (void)endDeviceCoordination
{
}

- (void)beginCollaborationForShare:(id)a3
{
}

- (void)shareDidUpdate:(id)a3
{
}

- (void)endCollaborationForShare:(id)a3
{
}

- (void)getTabGroupIdentifierForParticipantIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    internalCoordinator = self->_internalCoordinator;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_265585178;
    id v10 = v7;
    [(_WBParticipantPresenceCoordinator *)internalCoordinator getTabGroupIdentifierForParticipantIdentifier:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_265585150;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __100__WBParticipantPresenceCoordinator_getTabGroupIdentifierForParticipantIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getTabIdentifierForParticipantIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    internalCoordinator = self->_internalCoordinator;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_265585178;
    id v10 = v7;
    [(_WBParticipantPresenceCoordinator *)internalCoordinator getTabIdentifierForParticipantIdentifier:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_265585150;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __95__WBParticipantPresenceCoordinator_getTabIdentifierForParticipantIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getCurrentLocationIdentifiersForParticipantIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    internalCoordinator = self->_internalCoordinator;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke;
    v9[3] = &unk_2655851C8;
    id v10 = v7;
    [(_WBParticipantPresenceCoordinator *)internalCoordinator getCurrentLocationIdentifiersForParticipantIdentifier:v6 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_2655851A0;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __108__WBParticipantPresenceCoordinator_getCurrentLocationIdentifiersForParticipantIdentifier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getActiveParticipantsInTabGroupWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  internalCoordinator = self->_internalCoordinator;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_2655851F0;
  id v10 = v6;
  id v8 = v6;
  [(_WBParticipantPresenceCoordinator *)internalCoordinator getActiveParticipantsInTabGroupWithIdentifier:a3 completionHandler:v9];
}

void __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke_2;
  v6[3] = &unk_265585150;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __100__WBParticipantPresenceCoordinator_getActiveParticipantsInTabGroupWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalCoordinator = self->_internalCoordinator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_265585218;
  id v8 = v4;
  id v6 = v4;
  [(_WBParticipantPresenceCoordinator *)internalCoordinator getCurrentConnectionStateWithCompletionHandler:v7];
}

void __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_265585150;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __83__WBParticipantPresenceCoordinator_getCurrentConnectionStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabGroupWithIdentifier:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained participantPresenceCoordinator:self didUpdateActiveParticipants:v9 inTabGroupWithIdentifier:v7];
  }
}

- (void)participantPresenceCoordinator:(id)a3 didUpdateActiveParticipants:(id)a4 inTabWithIdentifier:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained participantPresenceCoordinator:self didUpdateActiveParticipants:v9 inTabWithIdentifier:v7];
  }
}

- (WBParticipantPresenceCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBParticipantPresenceCoordinatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalCoordinator, 0);
}

@end