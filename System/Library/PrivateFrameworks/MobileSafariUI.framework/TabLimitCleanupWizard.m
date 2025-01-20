@interface TabLimitCleanupWizard
- (id)_cleanupGroupForRange:(int64_t)a3;
- (id)_smallCleanupGroup;
- (id)initForPrivateBrowsing:(BOOL)a3 withBrowserController:(id)a4 resultHandler:(id)a5;
- (id)makeViewController;
@end

@implementation TabLimitCleanupWizard

- (id)initForPrivateBrowsing:(BOOL)a3 withBrowserController:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TabLimitCleanupWizard;
  v10 = [(TabLimitCleanupWizard *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_privateBrowsing = a3;
    objc_storeWeak((id *)&v10->_browserController, v8);
    uint64_t v12 = MEMORY[0x1E4E42950](v9);
    id resultHandler = v11->_resultHandler;
    v11->_id resultHandler = (id)v12;

    v14 = v11;
  }

  return v11;
}

- (id)makeViewController
{
  v3 = [(TabLimitCleanupWizard *)self _smallCleanupGroup];
  v4 = [(TabLimitCleanupWizard *)self _cleanupGroupForRange:4];
  v5 = _WBSLocalizedString();
  v6 = (void *)MEMORY[0x1E4FB1418];
  v7 = [v3 message];
  id v8 = [v6 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v9 = [v3 action];
  [v8 addAction:v9];

  v10 = [v4 action];
  [v8 addAction:v10];

  v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = _WBSLocalizedString();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__TabLimitCleanupWizard_makeViewController__block_invoke;
  v15[3] = &unk_1E6D79120;
  v15[4] = self;
  v13 = [v11 actionWithTitle:v12 style:1 handler:v15];
  [v8 addAction:v13];

  return v8;
}

uint64_t __43__TabLimitCleanupWizard_makeViewController__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

- (id)_smallCleanupGroup
{
  uint64_t v3 = 0;
  while (1)
  {
    v4 = [(TabLimitCleanupWizard *)self _cleanupGroupForRange:qword_1E123E180[v3]];
    if (v4) {
      break;
    }
    if (++v3 == 3)
    {
      v4 = [(TabLimitCleanupWizard *)self _cleanupGroupForRange:3];
      break;
    }
  }
  return v4;
}

- (id)_cleanupGroupForRange:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v6 = [WeakRetained tabController];
  v7 = v6;
  if (self->_privateBrowsing) {
    [v6 privateUnpinnedTabs];
  }
  else {
  id v8 = [v6 normalUnpinnedTabs];
  }
  v30 = v8;
  uint64_t v9 = [v8 count];
  switch(a3)
  {
    case 0:
      id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v10 setMonth:-1];
      id v11 = [v7 tabsOlderThan:v10 inPrivateBrowsing:self->_privateBrowsing];

      uint64_t v12 = NSString;
      v13 = _WBSLocalizedString();
      v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v9, objc_msgSend(v11, "count"));

      uint64_t v15 = _WBSLocalizedString();
      goto LABEL_12;
    case 1:
      id v23 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v23 setWeekOfYear:-2];
      id v11 = [v7 tabsOlderThan:v23 inPrivateBrowsing:self->_privateBrowsing];

      v24 = NSString;
      v25 = _WBSLocalizedString();
      v14 = objc_msgSend(v24, "localizedStringWithFormat:", v25, v9, objc_msgSend(v11, "count"));

      uint64_t v15 = _WBSLocalizedString();
      goto LABEL_12;
    case 2:
      id v16 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v16 setWeekOfYear:-1];
      id v11 = [v7 tabsOlderThan:v16 inPrivateBrowsing:self->_privateBrowsing];

      v17 = NSString;
      v18 = _WBSLocalizedString();
      v14 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v9, objc_msgSend(v11, "count"));

      uint64_t v15 = _WBSLocalizedString();
      goto LABEL_12;
    case 3:
      v19 = [v7 oldestTabsWithLimit:100 inPrivateBrowsing:self->_privateBrowsing];
      v20 = NSString;
      v21 = _WBSLocalizedString();
      v14 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v9);

      if ([v19 count] == 1)
      {
        v22 = _WBSLocalizedString();
      }
      else
      {
        v28 = NSString;
        v29 = _WBSLocalizedString();
        v22 = objc_msgSend(v28, "localizedStringWithFormat:", v29, objc_msgSend(v19, "count"));
      }
      id v11 = v19;
      break;
    case 4:
      id v11 = v8;
      v14 = 0;
      uint64_t v15 = _WBSLocalizedString();
LABEL_12:
      v22 = (void *)v15;
      break;
    default:
      v14 = 0;
      v22 = 0;
      id v11 = 0;
      break;
  }
  v26 = [[TabLimitCleanupGroup alloc] initWithAlertMesssage:v14 actionTitle:v22 tabs:v11 browserController:WeakRetained resultHandler:self->_resultHandler];

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

@end