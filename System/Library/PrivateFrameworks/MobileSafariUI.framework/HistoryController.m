@interface HistoryController
- (HistoryController)init;
- (id)_createHistoryForProfileIdentifier:(id)a3;
- (id)frequentlyVisitedSitesBannedURLStoreForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4;
- (id)frequentlyVisitedSitesControllerForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4;
- (id)historyForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4;
@end

@implementation HistoryController

- (id)frequentlyVisitedSitesBannedURLStoreForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = SafariFrequentlyVisitedSitesBannedURLStoreURLForProfileWithIdentifier(v6);
  if (v7)
  {
    v8 = [(NSMapTable *)self->_frequentlyVisitedSitesBannedURLStores objectForKey:v6];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      v10 = [(HistoryController *)self historyForProfileIdentifier:v6 loadIfNeeded:v4];
      if (v10)
      {
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F98B68]) initWithStoreURL:v7 history:v10];
        [(NSMapTable *)self->_frequentlyVisitedSitesBannedURLStores setObject:v11 forKey:v6];
        id v9 = v11;
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)frequentlyVisitedSitesControllerForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSMapTable *)self->_frequentlyVisitedSitesControllers objectForKey:v6];
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    id v9 = [(HistoryController *)self historyForProfileIdentifier:v6 loadIfNeeded:v4];
    if (v9)
    {
      v10 = [(HistoryController *)self frequentlyVisitedSitesBannedURLStoreForProfileIdentifier:v6 loadIfNeeded:v4];
      if (v10)
      {
        v11 = [FrequentlyVisitedSitesController alloc];
        v12 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
        v13 = +[Application sharedApplication];
        v14 = [v13 tabGroupManager];
        v15 = [v14 tabCollection];
        v16 = [(FrequentlyVisitedSitesController *)v11 initWithBookmarkCollection:v12 history:v9 bannedURLStore:v10 tabCollection:v15 profileIdentifier:v6];

        [(NSMapTable *)self->_frequentlyVisitedSitesControllers setObject:v16 forKey:v6];
        if (([v6 isEqualToString:*MEMORY[0x1E4F980C8]] & 1) == 0) {
          [(WBSFrequentlyVisitedSitesController *)v16 recomputeFrequentlyVisitedSitesIfNecessary];
        }
        v8 = v16;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (id)historyForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HistoryController;
  BOOL v4 = [(WBSHistoryController *)&v6 historyForProfileIdentifier:a3 loadIfNeeded:a4];
  return v4;
}

- (HistoryController)init
{
  v9.receiver = self;
  v9.super_class = (Class)HistoryController;
  v2 = [(WBSHistoryController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    frequentlyVisitedSitesBannedURLStores = v2->_frequentlyVisitedSitesBannedURLStores;
    v2->_frequentlyVisitedSitesBannedURLStores = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    frequentlyVisitedSitesControllers = v2->_frequentlyVisitedSitesControllers;
    v2->_frequentlyVisitedSitesControllers = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)_createHistoryForProfileIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = [(WBUHistory *)[History alloc] initWithDatabaseID:v3];
    [(WBSHistory *)v4 loadHistoryAsynchronouslyIfNeeded];
  }
  else
  {
    BOOL v4 = +[History sharedHistory];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesControllers, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesBannedURLStores, 0);
}

@end