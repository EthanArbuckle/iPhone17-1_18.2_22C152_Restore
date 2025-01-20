@interface MFContactCardInteractions
+ (id)contactCardInteractionWithViewController:(id)a3 blockedSenderManager:(id)a4;
+ (id)log;
- (BOOL)isBlocked;
- (CNContactViewController)contactViewController;
- (EAEmailAddressSet)emailAddressSet;
- (EFScheduler)workerScheduler;
- (EMBlockedSenderManager)blockedSenderManager;
- (EMVIP)currentVIP;
- (MFContactCardInteractionDelegate)delegate;
- (MFContactCardInteractions)initWithViewController:(id)a3 blockedSenderManager:(id)a4;
- (NSString)displayName;
- (id)contact;
- (void)_addVIP:(id)a3;
- (void)_removeVIP:(id)a3;
- (void)_startSearch:(id)a3;
- (void)_unblockContact:(id)a3;
- (void)_updateBlockContactCardButtonForViewController:(id)a3;
- (void)_updateContactCardButtonsForViewController:(id)a3;
- (void)_updateSearchContactCardButtonForViewController:(id)a3;
- (void)_updateVIPContactCardButtonForViewController:(id)a3;
- (void)configureInteractionsWithInteractionDelegate:(id)a3;
- (void)setContactViewController:(id)a3;
- (void)setCurrentVIP:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddressSet:(id)a3;
- (void)setIsBlocked:(BOOL)a3;
@end

@implementation MFContactCardInteractions

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MFContactCardInteractions_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return v2;
}

void __32__MFContactCardInteractions_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

+ (id)contactCardInteractionWithViewController:(id)a3 blockedSenderManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithViewController:v6 blockedSenderManager:v7];

  return v8;
}

- (MFContactCardInteractions)initWithViewController:(id)a3 blockedSenderManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFContactCardInteractions;
  v8 = [(MFContactCardInteractions *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_contactViewController, v6);
    uint64_t v10 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.MFContactCardInteractions.workerScheduler" qualityOfService:17];
    workerScheduler = v9->_workerScheduler;
    v9->_workerScheduler = (EFScheduler *)v10;

    objc_storeStrong((id *)&v9->_blockedSenderManager, a4);
  }

  return v9;
}

- (id)contact
{
  v2 = [(MFContactCardInteractions *)self contactViewController];
  id v3 = [v2 contact];

  return v3;
}

- (void)configureInteractionsWithInteractionDelegate:(id)a3
{
  id v19 = a3;
  v4 = [(MFContactCardInteractions *)self contact];
  [(MFContactCardInteractions *)self setDelegate:v19];
  v5 = [v4 emailAddresses];
  id v6 = objc_msgSend(v5, "ef_map:", &__block_literal_global_2);

  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F605B8]);
    [(MFContactCardInteractions *)self setEmailAddressSet:v7];

    v8 = [(MFContactCardInteractions *)self emailAddressSet];
    [v8 addObjectsFromArray:v6];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
    [(MFContactCardInteractions *)self setDisplayName:v10];

    v11 = [(MFContactCardInteractions *)self displayName];

    if (v11)
    {
      v12 = [(MFContactCardInteractions *)self displayName];
      [v9 addObject:v12];
    }
    objc_super v13 = [(MFContactCardInteractions *)self contactViewController];
    v14 = +[VIPManager defaultInstance];
    v15 = [(MFContactCardInteractions *)self emailAddressSet];
    v16 = [v14 vipForEmailAddresses:v15 andDisplayNames:v9];
    [(MFContactCardInteractions *)self setCurrentVIP:v16];

    v17 = [(MFContactCardInteractions *)self blockedSenderManager];
    v18 = [v13 contact];
    -[MFContactCardInteractions setIsBlocked:](self, "setIsBlocked:", [v17 isContactBlocked:v18]);

    [(MFContactCardInteractions *)self _updateContactCardButtonsForViewController:v13];
  }
}

id __74__MFContactCardInteractions_configureInteractionsWithInteractionDelegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  return v2;
}

- (void)_updateContactCardButtonsForViewController:(id)a3
{
  id v6 = a3;
  -[MFContactCardInteractions _updateVIPContactCardButtonForViewController:](self, "_updateVIPContactCardButtonForViewController:");
  [(MFContactCardInteractions *)self _updateBlockContactCardButtonForViewController:v6];
  v4 = [(MFContactCardInteractions *)self delegate];
  int v5 = [v4 canSearchForContactFromContactCardInteractions:self];

  if (v5) {
    [(MFContactCardInteractions *)self _updateSearchContactCardButtonForViewController:v6];
  }
}

- (void)_updateSearchContactCardButtonForViewController:(id)a3
{
  id v7 = [a3 contentViewController];
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  int v5 = [v4 localizedStringForKey:@"SEARCH_MAIL_FOR_CONTACT_ADDRESSES" value:&stru_1F39E2A88 table:@"Main"];

  id v6 = [v7 cardBottomGroup];
  [v7 addActionWithTitle:v5 target:self selector:sel__startSearch_ inGroup:v6 destructive:0];
}

- (void)_startSearch:(id)a3
{
  v4 = [(MFContactCardInteractions *)self displayName];
  int v5 = v4;
  if (v4)
  {
    id v11 = v4;
  }
  else
  {
    id v12 = [(MFContactCardInteractions *)self emailAddressSet];
    id v6 = [v12 allObjects];
    uint64_t v7 = [v6 firstObject];

    id v11 = (id)v7;
  }

  v8 = [(MFContactCardInteractions *)self delegate];
  id v9 = [(MFContactCardInteractions *)self emailAddressSet];
  uint64_t v10 = [v9 allObjects];
  [v8 contactCardInteractions:self triggerSearchForDisplayName:v11 emailAddresses:v10];
}

- (void)_removeVIP:(id)a3
{
  id v6 = +[VIPManager defaultInstance];
  v4 = [(MFContactCardInteractions *)self currentVIP];
  int v5 = [v4 identifier];
  [v6 deleteVIPWithIdentifier:v5];

  [(MFContactCardInteractions *)self setCurrentVIP:0];
  id v7 = [(MFContactCardInteractions *)self contactViewController];
  -[MFContactCardInteractions _updateContactCardButtonsForViewController:](self, "_updateContactCardButtonsForViewController:");
}

- (void)_addVIP:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F60518]);
  int v5 = [(MFContactCardInteractions *)self displayName];
  id v6 = [(MFContactCardInteractions *)self emailAddressSet];
  id v10 = (id)[v4 initWithIdentifier:0 name:v5 emailAddresses:v6];

  [(MFContactCardInteractions *)self setCurrentVIP:v10];
  id v7 = +[VIPManager defaultInstance];
  v8 = [(MFContactCardInteractions *)self currentVIP];
  [v7 saveVIP:v8];

  id v9 = [(MFContactCardInteractions *)self contactViewController];
  [(MFContactCardInteractions *)self _updateContactCardButtonsForViewController:v9];
}

- (void)_updateVIPContactCardButtonForViewController:(id)a3
{
  id v4 = [a3 contentViewController];
  int v5 = [v4 cardBottomGroup];
  id v6 = sel__removeVIP_;
  [v4 removeActionWithTarget:self selector:sel__removeVIP_ inGroup:v5];

  id v7 = [v4 cardBottomGroup];
  [v4 removeActionWithTarget:self selector:sel__addVIP_ inGroup:v7];

  if ([(MFContactCardInteractions *)self isBlocked]
    && ([(MFContactCardInteractions *)self currentVIP],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    id v13 = 0;
  }
  else
  {
    id v9 = [(MFContactCardInteractions *)self currentVIP];

    [MEMORY[0x1E4F28B50] mainBundle];
    if (v9) {
      id v10 = {;
    }
      id v13 = [v10 localizedStringForKey:@"REMOVE_VIP" value:&stru_1F39E2A88 table:@"Main"];
    }
    else {
      id v10 = {;
    }
      id v13 = [v10 localizedStringForKey:@"ADD_VIP" value:&stru_1F39E2A88 table:@"Main"];
      id v6 = sel__addVIP_;
    }

    id v11 = [v4 cardBottomGroup];
    [v4 addActionWithTitle:v13 target:self selector:v6 inGroup:v11 destructive:0];

    id v12 = [(MFContactCardInteractions *)self currentVIP];

    if ((v12 != 0) != [v4 isMailVIP]) {
      [v4 setIsMailVIP:v12 != 0];
    }
  }
}

void __43__MFContactCardInteractions__blockContact___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contactViewController];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __43__MFContactCardInteractions__blockContact___block_invoke_2;
  id v9 = &unk_1E6D1AB90;
  uint64_t v10 = v3;
  id v5 = v2;
  id v11 = v5;
  [v4 performBlock:&v6];
  objc_msgSend(*(id *)(a1 + 32), "setIsBlocked:", 1, v6, v7, v8, v9, v10);
  [*(id *)(a1 + 32) _updateContactCardButtonsForViewController:v5];
}

void __43__MFContactCardInteractions__blockContact___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) blockedSenderManager];
  v2 = [*(id *)(a1 + 40) contact];
  [v3 blockContact:v2];
}

- (void)_unblockContact:(id)a3
{
  id v4 = [(MFContactCardInteractions *)self contactViewController];
  workerScheduler = self->_workerScheduler;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __45__MFContactCardInteractions__unblockContact___block_invoke;
  uint64_t v10 = &unk_1E6D1AB90;
  id v11 = self;
  id v6 = v4;
  id v12 = v6;
  [(EFScheduler *)workerScheduler performBlock:&v7];
  -[MFContactCardInteractions setIsBlocked:](self, "setIsBlocked:", 0, v7, v8, v9, v10, v11);
  [(MFContactCardInteractions *)self _updateContactCardButtonsForViewController:v6];
}

void __45__MFContactCardInteractions__unblockContact___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) blockedSenderManager];
  v2 = [*(id *)(a1 + 40) contact];
  [v3 unblockContact:v2];
}

- (void)_updateBlockContactCardButtonForViewController:(id)a3
{
  id v14 = [a3 contentViewController];
  id v4 = [v14 cardBottomGroup];
  id v5 = sel__unblockContact_;
  [v14 removeActionWithTarget:self selector:sel__unblockContact_ inGroup:v4];

  id v6 = [v14 cardBottomGroup];
  [v14 removeActionWithTarget:self selector:sel__blockContact_ inGroup:v6];

  uint64_t v7 = [(MFContactCardInteractions *)self currentVIP];
  if (!v7 || (BOOL v8 = [(MFContactCardInteractions *)self isBlocked], v7, v8))
  {
    if ([(MFContactCardInteractions *)self isBlocked])
    {
      id v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"UNBLOCK_CONTACT" value:&stru_1F39E2A88 table:@"Main"];
    }
    else
    {
      id v11 = [(MFContactCardInteractions *)self blockedSenderManager];
      int v12 = [v11 isBlockedSenderEnabled];

      if (!v12) {
        goto LABEL_8;
      }
      id v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"BLOCK_CONTACT" value:&stru_1F39E2A88 table:@"Main"];
      id v5 = sel__blockContact_;
    }

    id v13 = [v14 cardBottomGroup];
    [v14 addActionWithTitle:v10 target:self selector:v5 inGroup:v13 destructive:0];
  }
LABEL_8:
}

- (CNContactViewController)contactViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactViewController);
  return (CNContactViewController *)WeakRetained;
}

- (void)setContactViewController:(id)a3
{
}

- (MFContactCardInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFContactCardInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (EAEmailAddressSet)emailAddressSet
{
  return self->_emailAddressSet;
}

- (void)setEmailAddressSet:(id)a3
{
}

- (EMVIP)currentVIP
{
  return self->_currentVIP;
}

- (void)setCurrentVIP:(id)a3
{
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (EFScheduler)workerScheduler
{
  return self->_workerScheduler;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_workerScheduler, 0);
  objc_storeStrong((id *)&self->_currentVIP, 0);
  objc_storeStrong((id *)&self->_emailAddressSet, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contactViewController);
}

@end